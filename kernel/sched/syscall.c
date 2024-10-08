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
	struct task *task;

	task = pid2task(pid, 1);

	if (!task) {
		return -1;
	}

	if(task->task_ppid != 0){
		struct task *parent = pid2task(task->task_ppid, false);
		assert(parent);
		assert(parent->task_pid == task->task_ppid);
		task->task_status = TASK_DYING;
		
		if(task->is_in_runq) rb_remove(&runq, &task->task_runq_node);

		list_add(&parent->task_zombies, &task->task_zombie_node);
		cprintf("[PID %5u] Reaping task with PID %u\n", cur_task->task_pid, task->task_pid);

		if(parent->task_wait == task){
			parent->task_status = TASK_RUNNABLE;
			runq_add(parent);
		}
		if(task != cur_task){
			lapic_ipi(IRQ_TIMER);//force other cores to reschedule in case the child process is still running.
		}
		sched_yield();
		return 0;
	}

	cprintf("[PID %5u] Exiting gracefully\n", task->task_pid);
	task_destroy(task);

	return 0;
}

static int sys_getcpuid(void)
{
	/* LAB 6: your code here. */
	return this_cpu->cpu_id;
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
		case SYS_cputs:
			cprintf("executing syscall cputs\n");
			sys_cputs((void*) a1, a2);
			break;

		case SYS_cgetc:
		cprintf("executing syscall cgetc\n");
			ret = sys_cgetc();
			break;

		case SYS_getpid:
		cprintf("executing syscall getpid\n");
			ret = sys_getpid();
			break;

		case SYS_kill:
		cprintf("executing syscall kill\n");
			ret = sys_kill(a1);
			break;
		
		case SYS_mquery:
			cprintf("executing syscall mquery\n");
			ret = sys_mquery((void *)a1, (void *)a2);
			break;

		case SYS_mmap:
			cprintf("executing syscall mmap\n");
			ret = (int64_t)sys_mmap((void *)a1, a2, a3, a4, a5, a6);
			break;

		case SYS_munmap:
			cprintf("executing syscall munmap\n");
			sys_munmap((void *)a1, a2);
			break;

		case SYS_mprotect:
			cprintf("executing syscall mprotect\n");
			ret = sys_mprotect((void *)a1, a2, a3);
			break;
		
		case SYS_madvise:
			cprintf("executing syscall madvice\n");
			ret = sys_madvise((void *)a1, a2, a3);
			break;
		case SYS_yield:
			cprintf("executing syscall yield\n");
			sched_yield();
			break;
		case SYS_wait:
			cprintf("executing syscall wait\n");
			ret = sys_wait((int *)a1);
			break;
		case SYS_waitpid:
			cprintf("executing syscall waitpid\n");
			ret = sys_waitpid(a1, (int *)a2, a3);
			break;
		case SYS_fork:
			cprintf("executing syscall fork\n");
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

void syscall_handler(uint64_t syscallno, uint64_t a1, uint64_t a2, uint64_t a3,
    uint64_t a4, uint64_t a5, uint64_t a6)
{
	struct int_frame *frame;

	/* Syscall from user mode. */
	assert(cur_task);

	/* Avoid using the frame on the stack. */
	frame = &cur_task->task_frame;

	/* Issue the syscall. */
	frame->rax = syscall(syscallno, a1, a2, a3, a4, a5, a6);

	/* Return to the current task, which should be running. */
	task_run(cur_task);
}
