#include <types.h>
#include <cpu.h>
#include <error.h>

#include <kernel/mem.h>
#include <kernel/sched.h>

extern struct rb_tree global_runq;
extern struct task **tasks;
extern size_t nuser_tasks;

pid_t sys_wait(int *rstatus)
{	
	return sys_waitpid(-1, rstatus, 0);
}

pid_t sys_waitpid(pid_t pid, int *rstatus, int opts)
{
	assert(!opts); // we dont support opts for now
	pid_t target_pid = 0;
	struct task *target_task;
	
	if(list_is_empty(&cur_task->task_children)) return -ECHILD;

	target_task = pid2task(pid, true);
	if(pid != 0 && !target_task) return -ECHILD;
	else if(pid == -1) {
		target_task = container_of(list_head(&cur_task->task_zombies), struct task, task_zombie_node);

		assert(target_task->task_status == TASK_DYING);

		if(target_task) TASK_LOCK(target_task);
	}

	//check if it is a zombie, if it is go ahead an destroy it
	if(target_task && target_task->task_status == TASK_DYING){
		
		target_pid = target_task->task_pid;
		list_del(&target_task->task_zombie_node);
		list_del(&target_task->task_child);

		task_destroy(target_task);
		return target_pid;

	}
	
	if(!target_task){ // we get here
		target_task = container_of(list_head(&cur_task->task_children), struct task, task_child);

		if(target_task && target_task != cur_task) TASK_LOCK(target_task);

	}else{
		target_pid = target_task->task_pid;
	}

	cur_task->task_status = TASK_NOT_RUNNABLE;//the child is not a zombie yet
	cur_task->task_wait = target_task;

	if(target_task && target_task != cur_task) TASK_UNLOCK(target_task);

	return target_pid;	
}
