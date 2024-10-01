#include <types.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>

#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>

//struct list runq;
struct list runq;

extern size_t nuser_tasks;
uint64_t meanCpuTime;

void sched_init(void)
{
	list_init(&runq);
}

/* Runs the next runnable task. */
void sched_yield(void)
{
	if(list_is_empty(&runq)){
		if(!cur_task){
			monitor(NULL);
		}
		task_run(cur_task);
	}
	struct task *task = container_of(list_pop_tail(&runq), struct task, task_node);
	task_run(task);
}

/* For now jump into the kernel monitor. */
void sched_halt()
{
	while (1) {
		monitor(NULL);
	}
}
