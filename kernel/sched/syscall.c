#include <error.h>
#include <string.h>
#include <assert.h>
#include <cpu.h>

#include <x86-64/asm.h>
#include <x86-64/gdt.h>

#include <kernel/acpi.h>
#include <kernel/console.h>
#include <kernel/mem.h>
#include <kernel/sched.h>
#include <kernel/vma/syscall.h>

extern void syscall64(void);
extern struct rb_tree runq;
extern size_t runq_len;


void syscall_init(void)
{
	write_msr(MSR_LSTAR, (uintptr_t) syscall64);
	write_msr(MSR_STAR, ((uint64_t)GDT_KCODE << 32) | ((uint64_t)GDT_UCODE << 48));
	write_msr(MSR_SFMASK, ((0 & 0x3) << 12) | FLAGS_TF | FLAGS_IF | FLAGS_AC | FLAGS_NT);


	uint64_t msr_efer = read_msr(MSR_EFER);
	write_msr(MSR_EFER, msr_efer | MSR_EFER_SCE);

	write_msr(MSR_KERNEL_GS_BASE, (uintptr_t) this_cpu); //this may need chaning in lab 5 or just disable syscalls
}

void syscall_init_mp(void)
{
	/* LAB 6: your code here. */
}

void syscall_init_mp(void)
{
	/* LAB 6: your code here. */
}

/*
 * Print a string to the system console.
 * The string is exactly 'len' characters long.
 * Destroys the environment on memory errors.
 */
static void sys_cputs(const char *s, size_t len)
{
	/* Check that the user has permission to read memory [s, s+len).
	 * Destroy the environment if not. */
	/* LAB 3: your code here. */
	assert_user_mem(cur_task, (void*)s, len, 0);
	/* Print the string supplied by the user. */
	cprintf("%.*s", len, s);
}

/*
 * Read a character from the system console without blocking.
 * Returns the character, or 0 if there is no input waiting.
 */
static int sys_cgetc(void)
{
	return cons_getc();
}

/* Returns the PID of the current task. */
static pid_t sys_getpid(void)
{
	return cur_task->task_pid;
}

static int sys_kill(pid_t pid)
{
	struct task *target_task;

	target_task = pid2task(pid, 1);

	if (!target_task) {
		return -1;
	}
	
	pid_t old_task_pid = cur_task->task_pid;

	//remove task from the runq or local runq
	//and set it to dying
	
	if(target_task->task_ppid != 0 && target_task->task_pid != 0){
		PROC_TABLE_UNLOCK;
		deschedule_task(target_task); //removes task from runqueues and marks it as dying
		

		cprintf("[PID %5u] Reaping task with PID %u\n", old_task_pid, target_task->task_pid);

		pid_t child_pid = target_task->task_pid;
		pid_t parent_pid = target_task->task_ppid;
		
        TASK_UNLOCK(target_task);
		struct task *parent = pid2task(parent_pid, false);

		if(parent){
			PROC_TABLE_UNLOCK;
			list_add(&parent->task_zombies, &target_task->task_zombie_node);

			if(parent->task_wait == target_task){
				parent->task_status = TASK_RUNNABLE;
				schedule_task(parent);
			}

			if(target_task != cur_task){
				lapic_ipi(IRQ_TIMER);//force other cores to reschedule in case the child process is still running.
			}
			TASK_UNLOCK(parent);
		}
		
		TASK_LOCK(target_task);

		if(target_task->task_ppid == 0){
			TASK_UNLOCK(target_task);
			PROC_TABLE_LOCK;
			task_destroy(target_task);
		}
		TASK_UNLOCK(target_task);

		return 0;
	}

	cprintf("[PID %5u] Exiting gracefully\n", target_task->task_pid);

	TASK_UNLOCK(target_task);
	task_destroy(target_task);

	return 0;
}

static int sys_getcpuid(void)
{
	return this_cpu->cpu_id;
}

int64_t _syscall(uint64_t syscallno, uint64_t a1, uint64_t a2, uint64_t a3,
        uint64_t a4, uint64_t a5, uint64_t a6){

	int64_t ret = 0;

	switch (syscallno) {
		case SYS_cputs:
			sys_cputs((void*) a1, a2);
			break;

		case SYS_cgetc:
			ret = sys_cgetc();
			break;

		case SYS_getpid:
			ret = sys_getpid();
			break;

		case SYS_kill:
			ret = sys_kill(a1);
			break;
		
		case SYS_mquery:
			ret = sys_mquery((void *)a1, (void *)a2);
			break;

		case SYS_mmap:
			ret = (int64_t)sys_mmap((void *)a1, a2, a3, a4, a5, a6);
			break;

		case SYS_munmap:
			sys_munmap((void *)a1, a2);
			break;

		case SYS_mprotect:
			ret = sys_mprotect((void *)a1, a2, a3);
			break;
		
		case SYS_madvise:
			ret = sys_madvise((void *)a1, a2, a3);
			break;
		case SYS_yield:
			sched_yield();
			break;
		case SYS_wait:
			ret = sys_wait((int *)a1);
			break;
		case SYS_waitpid:
			ret = sys_waitpid(a1, (int *)a2, a3);
			break;
		case SYS_fork:
			ret = sys_fork();
			break;

		case SYS_getcpuid:
			ret = sys_getcpuid();
			break;
		default:
			ret = -ENOSYS;
	}
	return ret;
}

/* Dispatches to the correct kernel function, passing the arguments. */
int64_t syscall(uint64_t syscallno, uint64_t a1, uint64_t a2, uint64_t a3,
        uint64_t a4, uint64_t a5, uint64_t a6)
{
	/*
	 * Call the function corresponding to the 'syscallno' parameter.
	 * Return any appropriate return value.
	 */
	int64_t ret = 0;

	switch (syscallno) {

		case SYS_getpid:
		case SYS_mquery:
		case SYS_mmap:
		case SYS_munmap:
		case SYS_mprotect:
		case SYS_madvise:
			TASK_LOCK(cur_task);
			ret = _syscall(syscallno, a1, a2, a3, a4, a5, a6);
			TASK_UNLOCK(cur_task);
			break;

		default:
			ret = _syscall(syscallno, a1, a2, a3, a4, a5, a6);
			break;
	}
	return ret;
}