#include <types.h>
#include <cpu.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>

struct rb_tree runq;


#ifndef USE_BIG_KERNEL_LOCK
struct spinlock runq_lock = {
#ifdef DBEUG_SPINLOCK
	.name = "runq_lock",
#endif
};
#endif
extern size_t nuser_tasks;
size_t runq_len = 0;


//give priority that wait for a longer time
static inline int64_t vruntime(struct task* task){
	uint64_t waiting_time = task->task_start_waiting ? read_tsc() - task->task_start_waiting : 0;
	return (int64_t)task->task_cpu_time - (int64_t)(waiting_time / (runq_len + 1));
}

void sched_init(void)
{
	list_init(&runq);
}

void sched_init_mp(void)
{
	/* LAB 6: your code here. */
}

/* Runs the next runnable task. */
void sched_yield(void)
{	
	struct task* task;

	if(runq.root == NULL){
		if(!cur_task) sched_halt();
		task_run(cur_task);
	}

	task = runq_pop();
	cprintf("running task: %d\n", task->task_pid);
	task_run(task);
}
/* For now jump into the kernel monitor. */
void sched_halt()
{
	while (1) {
		monitor(NULL);
	}
}