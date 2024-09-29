#include <types.h>
#include <error.h>

#include <kernel/mem.h>
#include <kernel/sched.h>

extern struct list runq;
extern struct task **tasks;
extern size_t nuser_tasks;

pid_t sys_wait(int *rstatus)
{	
	if(rstatus == NULL)panic("rstatus is null in sys_wait");

	for(size_t i = 0; i < nuser_tasks; i++){
		if(!tasks[i])continue;

		if(tasks[i]->task_status == TASK_NOT_RUNNABLE){
			task_destroy(tasks[i]);
			list_add(&runq, &cur_task->task_node);
			return i;
		}
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;
	return cur_task->task_pid;
	return -ENOSYS;
}

pid_t sys_waitpid(pid_t pid, int *rstatus, int opts)
{
	struct task *task = pid2task(pid, true);
	if(task){
		if(task->task_status == TASK_NOT_RUNNABLE){
			task_destroy(task);
			list_add(&runq, &cur_task->task_node);
			return pid;
			
		}
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;
	return cur_task->task_pid;
}
