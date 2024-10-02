#include <error.h>
#include <list.h>

#include <kernel/console.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>
#include <kernel/vma.h>
#include <kernel/sched/task.h>

extern struct list runq;
extern size_t nuser_tasks;

struct copy_info{
	struct page_table* child_pml4;
};

static int copy_page_and_setup_cow(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
	struct page_info* parent_page = pa2page(PAGE_ADDR(*entry));

	//inherit the flags from the parent but zap the write flag to setup COW
	physaddr_t copy_flags = (*entry & PAGE_MASK) & ~(PAGE_WRITE | PAGE_DIRTY | PAGE_ACCESSED);

	//zap the write flag also for the parent
	*entry &= ~(PAGE_WRITE | PAGE_DIRTY | PAGE_ACCESSED);

	struct copy_info* cpy_inf = (struct copy_info*) walker->udata;
	int res = page_insert(cpy_inf->child_pml4, parent_page, (void*) base, copy_flags);
	assert(page_lookup(cpy_inf->child_pml4, (void*) base, NULL));
	return res;
}

static int copy_pte(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
	if(*entry & PAGE_PRESENT){
		return copy_page_and_setup_cow(entry, base, end, walker);
	}
	return 0;
}

static int copy_pde(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
	if((*entry & PAGE_HUGE) && (*entry & PAGE_PRESENT)){
		cprintf("you have a huge page you retard\n");
		return copy_page_and_setup_cow(entry, base, end, walker);
	}
	return 0;
}

/*
copies the region of memory from [base, base + size) from parent_pml4 into child_pml4 and also set's up
the page tables in order to do COW
*/
static int copy_region(struct page_table *parent_pml4, struct page_table* child_pml4, void *base, size_t size){

	struct copy_info cpy_inf = {
		.child_pml4 = child_pml4
	};

	struct page_walker walker = {
		.pde_callback = copy_pde,
		.pte_callback = copy_pte,
		.udata = &cpy_inf
	};

	return walk_page_range(parent_pml4, base, base + size, &walker);
}

/* Allocates a task struct for the child process and copies the register state,
 * the VMAs and the page tables. Once the child task has been set up, it is
 * added to the run queue.
 */
struct task *task_clone(struct task *task)
{
	struct task *child = task_alloc(task->task_pid);

	if(!child){
		panic("OOM in task_clone");
		return NULL;
	}
	memcpy(&child->task_frame, &task->task_frame, sizeof(task->task_frame));


	struct list *vma_entry = NULL;
	list_foreach(&task->task_mmap, vma_entry){

		struct vma *parent_vma = container_of(vma_entry, struct vma, vm_mmap);
		struct vma *child_vma = NULL;
		size_t vma_size = parent_vma->vm_end - parent_vma->vm_base;

		if(parent_vma->vm_src){
			child_vma = add_executable_vma(child, parent_vma->vm_name, parent_vma->vm_base, vma_size, parent_vma->vm_flags, parent_vma->vm_src, parent_vma->vm_len);
		}
		else{
			child_vma = add_anonymous_vma(child, parent_vma->vm_name, parent_vma->vm_base, vma_size, parent_vma->vm_flags);
		}

		if(!child_vma){
			panic("unable to create vma in task_clone");
			task_free(child);
			return NULL;
		}

		//do we need to check for shared mappings??
		assert(copy_region(task->task_pml4, child->task_pml4, child_vma->vm_base, vma_size) == 0);
	}

	//add child to run queue and to the list of children of the parent
	assert(child != task);
	list_add(&runq, &child->task_node);
	list_add(&task->task_children, &child->task_child);
	nuser_tasks++;
	return child;
}
void debug_print_task_list(struct list *list){

	if(list_is_empty(list)){
		cprintf("there are no tasks in the list\n");
		return;
	}
	struct list *node = NULL;

	list_foreach(list, node){
		struct task *task = container_of(node, struct task, task_node);
		cprintf("task: pid: %p, parent ppid: %d, waiting on: %p, status code: %d\n", task->task_pid, task->task_ppid, task->task_wait, task->task_status);
	}
}

pid_t sys_fork(void)
{
	struct task* child = task_clone(cur_task);
	if (!child) return -ENOMEM;

	child->task_frame.rax = 0;
	//cur_task->task_frame.rax = cur_task->task_pid;

	struct list* node;
	struct task* task;
	return child->task_pid;
}
