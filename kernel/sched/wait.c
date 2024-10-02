#include <types.h>
#include <error.h>

#include <kernel/mem.h>
#include <kernel/sched.h>

extern struct list runq;
extern struct task **tasks;
extern size_t nuser_tasks;

pid_t sys_wait(int *rstatus)
{	
	/*
	struct list *current_child = NULL;
	if(list_is_empty(&cur_task->task_children)){
		return -ECHILD;
	}
	list_foreach(&cur_task->task_children, current_child){
		struct task *child = container_of(current_child, struct task, task_children);
		assert(child);
		cprintf("child found at: %p\n", child);
		cprintf("child staus: %d\n", child->task_status);

		if(child->task_status == TASK_DYING){
			pid_t child_pid = child->task_pid;
			task_destroy(child);
			cur_task->task_status = TASK_RUNNABLE;
			list_add(&runq, &cur_task->task_node);
			return child_pid;
		}
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;
	return -1
	*/
	return sys_waitpid(-1, rstatus, 0);
}

pid_t sys_waitpid(pid_t pid, int *rstatus, int opts)
{
	assert(!opts); // we dont support opts for now

	if(list_is_empty(&cur_task->task_children)){
		return -ECHILD;
	}
	cprintf("running sys_waitpid on pid: %d\n", pid);

	struct task *task = pid == -1 ? list_head(&cur_task->task_children) : pid2task(pid, true);

	if(task){
		if(task->task_status == TASK_DYING){
			task_destroy(task);
			list_add(&runq, &cur_task->task_node);
			return pid;
			
		}
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;
	return cur_task->task_pid;
}
