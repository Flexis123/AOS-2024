#include <error.h>
#include <string.h>
#include <paging.h>
#include <task.h>
#include <cpu.h>

#include <kernel/monitor.h>
#include <kernel/mem.h>
#include <kernel/sched.h>
#include <kernel/vma/remove.h>
#include <kernel/vma/insert.h>
#include <kernel/mem/buddy.h>

#include <kernel/mem/vma.h>
#include <atomic.h>

pid_t pid_max = 1 << 16;
struct task **tasks = (struct task **)PIDMAP_BASE;
size_t nuser_tasks = 0;
extern struct rb_tree global_runq;

#ifndef USE_BIG_KERNEL_LOCK
struct spinlock task_table_lock;
#endif


/* Looks up the respective task for a given PID.
 * If check_perm is non-zero, this function checks if the PID maps to the
 * current task or if the current task is the parent of the task that the PID
 * maps to.
 * 
 * The task is returnd locked if the operation is sucesfull.
 */
struct task *pid2task(pid_t pid, int check_perm)
{
	struct task *task;

	/* PID 0 is the current task. */
	if (pid == 0) {
		PROC_TABLE_LOCK;
		TASK_LOCK(cur_task);
		return cur_task;
	}

	/* Limit the PID. */
	if (pid >= pid_max || pid < 1) {
		return NULL;
	}

	PROC_TABLE_LOCK;

	/* Look up the task in the PID map. */
	task = tasks[pid];

	/* No such mapping found. */
	if (!task) {
		PROC_TABLE_UNLOCK;
		return NULL;
	}

	while(!spin_trylock(&task->task_lock)){
		PROC_TABLE_UNLOCK;
		PROC_TABLE_LOCK;
	}

	/* If we don't have to do a permission check, we can simply return the
	 * task.
	 */
	if (!check_perm) {
		return task;
	}

	/* Check if the task is the current task or if the current task is the
	 * parent. If not, then the current task has insufficient permissions.
	 */

	if (task != cur_task && task->task_ppid != cur_task->task_pid) {
		PROC_TABLE_UNLOCK;
		TASK_UNLOCK(task);
		return NULL;
	}

	return task;
}

void task_init(void)
{
	/* Allocate an array of pointers at PIDMAP_BASE to be able to map PIDs
	 * to tasks.
	 */
	populate_region(kernel_pml4, (void*) PIDMAP_BASE, ROUNDUP(pid_max * sizeof(struct task *), PAGE_SIZE), 
						PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC);
}

/* Sets up the virtual address space for the task. */
static int task_setup_vas(struct task *task)
{
	struct page_info *page;

	/* Allocate a page for the page table. */
	page = page_alloc(ALLOC_ZERO);

	if (!page) {
		return -ENOMEM;
	}
	++page->pp_ref;

	struct page_table *pml4 = (struct page_table *)page2kva(page);

	for(int i = PML4_INDEX(KERNEL_VMA); i < PAGE_TABLE_ENTRIES; i++){
		pml4->entries[i] = kernel_pml4->entries[i];
	}
	task->task_pml4 = pml4;
	return 0;
}

/* Allocates and initializes a new task.
 * On success, the new task is returned and the task is locked.
 */
struct task *task_alloc(pid_t ppid)
{
	struct task *task;
	pid_t pid;

	/* Allocate a new task struct. */
	task = kmalloc(sizeof *task);

	if (!task) {
		return NULL;
	}

	/* Set up the virtual address space for the task. */
	if (task_setup_vas(task) < 0) {
		kfree(task);
		return NULL;
	}

	/* Find a free PID for the task in the PID mapping and associate the
	 * task with that PID.
	 */
	PROC_TABLE_LOCK;
	for (pid = 1; pid < pid_max; ++pid) {
		if (!tasks[pid]) {
			tasks[pid] = task;
			task->task_pid = pid;
			break;
		}
	}
	/* We are out of PIDs. */
	if (pid == pid_max) {
		kfree(task);
		return NULL;
	}

	/* Set up the task. */

	//setup task frame
	memset(&task->task_frame, 0, sizeof task->task_frame);
	task->task_frame.ds = GDT_UDATA | 3;
	task->task_frame.ss = GDT_UDATA | 3;
	task->task_frame.rsp = USTACK_TOP;
	task->task_frame.cs = GDT_UCODE | 3;
	/* You will set task->task_frame.rip later. */

	task->task_wait = NULL;
	task->task_ppid = ppid;
	task->task_type = TASK_TYPE_USER;
	task->task_status = TASK_RUNNABLE;
	task->task_runs = 0;
	task->task_cpunum = this_cpu->cpu_id;

	task->task_start_time = 0;
	task->task_cpu_time = 0;

	//init vma stuff
	rb_init(&task->task_rb); 
	list_init(&task->task_mmap);

	//init scheduling stuff
	list_init(&task->task_children);
	list_init(&task->task_child);
	list_init(&task->task_zombies);
	list_init(&task->task_zombie_node);
	rb_node_init(&task->task_global_runq_node);
	rb_node_init(&task->task_local_runq_node);
	#ifndef USE_BIG_KERNEL_LOCK
	spin_init(&task->task_lock, "task_lock");
	#endif

	cprintf("[PID %5u] New task with PID %u\n",
	        cur_task ? cur_task->task_pid : 0, task->task_pid);

	TASK_LOCK(task);
	PROC_TABLE_UNLOCK;

	return task;
}

/* Sets up the initial program binary, stack and processor flags for a user
 * process.
 * This function is ONLY called during kernel initialization, before running
 * the first user-mode environment.
 *
 * This function loads all loadable segments from the ELF binary image into the
 * task's user memory, starting at the appropriate virtual addresses indicated
 * in the ELF program header.
 * At the same time it clears to zero any portions of these segments that are
 * marked in the program header as being mapped but not actually present in the
 * ELF file, i.e., the program's .bss section.
 *
 * All this is very similar to what our boot loader does, except the boot
 * loader also needs to read the code from disk. Take a look at boot/main.c to
 * get some ideas.
 *
 * Finally, this function maps one page for the program's initial stack.
 */

void debug_va_to_idx(uintptr_t va){
	cprintf("va: %p is found at: pml4: %d pdpt: %d  pdir %d ptbl %d\n", va, PML4_INDEX(va) % 512, PDPT_INDEX(va) % 512, PAGE_DIR_INDEX(va) % 512, PAGE_INDEX(va) % 512);
}


static void task_load_elf(struct task *task, uint8_t *binary)
{
	/* Hints:
	 * - Load each program segment into virtual memory at the address
	 *   specified in the ELF section header.
	 * - You should only load segments with type ELF_PROG_LOAD.
	 * - Each segment's virtual address can be found in p_va and its
	 *   size in memory can be found in p_memsz.
	 * - The p_filesz bytes from the ELF binary, starting at binary +
	 *   p_offset, should be copied to virtual address p_va.
	 * - Any remaining memory bytes should be zero.
	 * - Use populate_region() and protect_region().
	 * - Check for malicious input.
	 *
	 * Loading the segments is much simpler if you can move data directly
	 * into the virtual addresses stored in the ELF binary.
	 * So in which address space should we be operating during this
	 * function?
	 *
	 * You must also do something with the entry point of the program, to
	 * make sure that the task starts executing there.
	 */
	//assert(task->task_type != TASK_TYPE_KERNEL);//do not overwrite kernel tasks

	struct elf *elf = (struct elf *)binary;
	if (elf->e_magic != ELF_MAGIC) {
		panic("binary has wrong magic number. got: %d, expected: %d", elf->e_magic, ELF_MAGIC);
	}
	struct elf_proghdr *prog_headers = (struct elf_proghdr *)(binary + elf->e_phoff);
	struct elf_secthdr *sections = (struct elf_secthdr *)(binary + elf->e_shoff);
	assert(elf->e_phoff != 0);

	for(uint16_t i = 0; i < elf->e_phnum; i++){
		struct elf_proghdr *ph = &prog_headers[i];
		if(!(ph->p_type & ELF_PROG_LOAD)){
			continue;
		}
		if(ph->p_va == 0 || ph->p_memsz == 0){
			continue;
		}

		assert(ph->p_offset != 0);

		int flags = 0;
		if(ph->p_flags & ELF_PROG_FLAG_WRITE) flags |= VM_WRITE;
		if(ph->p_flags & ELF_PROG_FLAG_EXEC) flags |= VM_EXEC;
		if(ph->p_flags & ELF_PROG_FLAG_READ) flags |= VM_READ;
		
		if(ph->p_va + ph->p_memsz >= KERNEL_VMA){
			panic("elf section maps to kernel memory");
		}
		if(ph->p_memsz < ph->p_filesz && ph->p_filesz > 0){
			panic("not enough data in file to write to memory");
		}

		char *name = "";

		switch (flags)
		{
		case VM_READ | VM_WRITE:
			name = ".data";
			break;
		case VM_READ | VM_EXEC:
			name = ".text";
			break;
		case VM_READ:
			name = ".rodata";
			break;
		
		default:
			break;
		}

		if(ph->p_filesz > 0){
			add_executable_vma(task, name, (void*)ph->p_va, ph->p_memsz, flags, binary + ph->p_offset, ph->p_filesz);
		}
		else{
			add_anonymous_vma(task, name, (void*)ph->p_va, ph->p_memsz, flags);
		}
	}
	
	/* Now map one page for the program's initial stack at virtual address
	 * USTACK_TOP - PAGE_SIZE.
	 */
	add_anonymous_vma(task, "stack", (void*)USTACK_TOP - PAGE_SIZE, PAGE_SIZE, VM_WRITE | VM_READ);
	task->task_frame.rip = elf->e_entry;
	show_vmas(task);
}

/* Allocates a new task with task_alloc(), loads the named ELF binary using
 * task_load_elf() and sets its task type.
 * If the task is a user task, increment the number of user tasks.
 * This function is ONLY called during kernel initialization, before running
 * the first user-mode task.
 * The new task's parent PID is set to 0.
 */
void task_create(uint8_t *binary, enum task_type type)
{
	struct task* task = task_alloc(0);
	
	if(!task)return;
	
	task_load_elf(task, binary);
	task->task_type = type;

	if(type == TASK_TYPE_USER) atomic_inc(&nuser_tasks);
	schedule_task(task);
	TASK_UNLOCK(task);
}

/* Free the task and all of the memory that is used by it.
*  It expects the process table to be locked!
*  It will unlock the process table when this function finishes executing.
 */
void task_free(struct task *task)
{
	assert(holding(&task_table_lock));
	
	atomic_dec(&nuser_tasks);

	if(tasks[task->task_pid] == NULL){
		PROC_TABLE_UNLOCK;
		return; // the task is already freed or being freed
	}

	assert(task->task_type != TASK_TYPE_KERNEL);
	tasks[task->task_pid] = NULL;

	TASK_LOCK(task);

	deschedule_task(task);

	//also check if the task is still the current task of the processor it is scheduled on
	//if it is contionously send ipi's until a new task is there
	if(task != cur_task && task->task_cpunum != this_cpu->cpu_id && task->task_cpunum != -1){
		
		while (cpus[task->task_cpunum].cpu_task == task){
			TASK_UNLOCK(task);
			PROC_TABLE_UNLOCK;
			lapic_ipi(IRQ_TIMER);
			PROC_TABLE_LOCK;
			TASK_LOCK(task);
		}
	}

	TASK_UNLOCK(task);

	//now that the task cant be scheduled anymore and it is not running
	// we can sfely remove the task as no more operations will be done on it
	// 
	struct list *current_child = NULL;
	struct list *next = NULL;

	list_foreach_safe (&task->task_children, current_child, next){
		struct task *child_task = container_of(current_child, struct task, task_child);

		TASK_LOCK(child_task);

		list_del(&child_task->task_child);
		child_task->task_ppid = 0;

		TASK_UNLOCK(child_task);
	}


	struct list *current_zombie = NULL;
	list_foreach_safe (&task->task_zombies, current_zombie, next){
		struct task* zombie = container_of(current_zombie, struct task, task_zombie_node);
		task_free(container_of(current_zombie, struct task, task_zombie_node));
	}

	list_del(&task->task_zombie_node);//what happens if this insnt in the zombie LIST?

	/* If we are freeing the current task, switch to the kernel_pml4
	 * before freeing the page tables, just in case the page gets re-used.
	 */
	if (task == cur_task) {
		load_pml4((struct page_table *)PADDR(kernel_pml4));
	}

	/* Unmap the user pages. */
	unmap_user_pages(task->task_pml4);//i dont think this is needed, we just have to free the page table pages and vma's

	free_vmas(task);

	/* Note the task's demise. */
	cprintf("[PID %5u] Freed task with PID %u\n",
	    cur_task ? cur_task->task_pid : task->task_ppid,
 	    task->task_pid);

	/* Free the task. */
	kfree(task);
}

/* Frees the task. If the task is the currently running task, then this
 * function runs a new task (and does not return to the caller).
 * It expects the process table to be locked already!
 */
void task_destroy(struct task *task)
{
	assert(holding(&task_table_lock));
	task_free(task);
	PROC_TABLE_UNLOCK;

	if(task == cur_task){
		cur_task = NULL;
		load_pml4((struct page_table *)PADDR(kernel_pml4));
		sched_yield();
	}
}

/*
 * Restores the register values in the trap frame with the iretq or sysretq
 * instruction. This exits the kernel and starts executing the code of some
 * task.
 *
 * This function does not return.
 */
void task_pop_frame(struct int_frame *frame)
{
	KUNLOCK;

	frame->rflags |= FLAGS_IF; //enable back interrupts
	switch (frame->int_no) {
#ifdef LAB3_SYSCALL
	case 0x80: sysret64(frame); break;
#endif
	default: iret64(frame); break;
	}

	panic("We should have gone back to userspace!");
}

/* Context switch from the current task to the provided task.
 * Note: if this is the first call to task_run(), cur_task is NULL.
 *
 * This function does not return.
 */
void task_run(struct task *task)
{
	if( !task || !holding(&task->task_lock)){
		panic("fuck you\n");
	}

	/*
	 * Step 1: If this is a context switch (a new task is running):
	 *     1. Set the current task (if any) back to
	 *        TASK_RUNNABLE if it is TASK_RUNNING (think about
	 *        what other states it can be in),
	 *     2. Set 'cur_task' to the new task,
	 *     3. Set its status to TASK_RUNNING,
	 *     4. Update its 'task_runs' counter,
	 *     5. Use load_pml4() to switch to its address space.
	 * Step 2: Use task_pop_frame() to restore the task's
	 *     registers and drop into user mode in the
	 *     task.
	 *
	 * Hint: This function loads the new task's state from
	 *  e->task_frame.  Go back through the code you wrote above
	 *  and make sure you have set the relevant parts ofcur_task
	 *  e->task_frame to sensible values.
	 */


	if(task->task_type == TASK_TYPE_KERNEL){
		void (*fn)(void*) = (void (*)(void*)) task->task_frame.rip;
		void* arg = (void*) task->task_frame.rdi;

		fn(arg);

		schedule_task(task);
		TASK_UNLOCK(task);

		sched_yield();
		return;
	}

	if(task->task_status == TASK_DYING || task->task_status == TASK_NOT_RUNNABLE){
		TASK_UNLOCK(task);
		sched_yield();
		return;
	}

	if(cur_task != task){
		uint64_t curr_time = read_tsc();
		
		if(cur_task){

			switch (cur_task->task_status)
			{
			case TASK_DYING:{
				//parent destroys dying tasks
				break;
			}
			case TASK_RUNNING:{
				cur_task->task_status = TASK_RUNNABLE;
				break;
			}
			case TASK_RUNNABLE:
			case TASK_NOT_RUNNABLE:{
				assert(cur_task->task_wait && cur_task->task_wait->task_pid == task->task_pid);
				break;
			}		
			default:
				panic("unknown task state in task_run");
				break;
			}
			cur_task->task_cpu_time += curr_time - cur_task->task_start_time;
			cur_task->task_start_waiting = curr_time;
			
		}
		cur_task = task;
		cur_task->task_status = TASK_RUNNING;
		cur_task->task_runs++;
		cur_task->task_start_time = curr_time;
	}
	
	load_pml4((struct page_table*)PADDR(task->task_pml4));
	
	TASK_UNLOCK(task);
	
	task_pop_frame(&task->task_frame);
}

struct task* create_kthread(void (*fn)(void*), void* data){
	struct task* task = task_alloc(0);


	task->task_type = TASK_TYPE_KERNEL;
	task->task_frame.rip = (uint64_t) fn;
	task->task_frame.rdi = (uint64_t) data;

	PROC_TABLE_LOCK;

	tasks[task->task_pid] = NULL;
	bool assigned_pid = false;
	for(int i = pid_max -1; i > 0; i--){
		if(!tasks[i]){
			tasks[i] = task;
			task->task_pid = i;
			assigned_pid = true;
			break;
		}
	}
	
	if(!assigned_pid){
		task_free(task);
		PROC_TABLE_UNLOCK;
		return NULL;
	}
	PROC_TABLE_UNLOCK;

	return task;
}

void task_kernel_setzero_create(){

	struct setzero_info *info = kmalloc(sizeof(struct setzero_info));

	if(!info){
		panic("failed to create kernel thread setzero, couldnt allocate setzero_info\n");
	}
	info->current_page = 0;//start from 0;

	struct task* kthread = create_kthread(setzero, (void*) info);
	if(!kthread) panic("could not create setzero kthread\n");

	schedule_task(kthread);

	TASK_UNLOCK(kthread);
}