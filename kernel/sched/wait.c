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
	struct task *target_task = NULL;
	struct list *target_task_node = NULL;
	
	TASK_LOCK(cur_task);
	if(list_is_empty(&cur_task->task_children)) {
		TASK_UNLOCK(cur_task);
		return -ECHILD;
	}

	TASK_UNLOCK(cur_task);

	target_task = pid2task(pid, true);
	if(pid != 0 && !target_task) {
		return -ECHILD;
	}
	else if(pid == -1) {
		target_task_node = list_head(&cur_task->task_zombies);

		if(target_task_node){
			target_task = container_of(target_task_node, struct task, task_zombie_node);
			TASK_LOCK(target_task);
		}
	}

	//check if it is a zombie, if it is go ahead an destroy it
	if(target_task && target_task->task_status == TASK_DYING){
		
		target_pid = target_task->task_pid;
		list_del(&target_task->task_zombie_node);
		list_del(&target_task->task_child);

		TASK_UNLOCK(target_task);
		task_destroy(target_task);
		return target_pid;

	}
	
	PROC_TABLE_UNLOCK;

	if(!target_task){ 
		target_task_node = list_head(&cur_task->task_children);

		if(target_task) {
			target_task = container_of(target_task_node, struct task, task_child);
			TASK_LOCK(target_task);
		}

	}else{
		target_pid = target_task->task_pid;
	}

	cur_task->task_status = TASK_NOT_RUNNABLE;
	cur_task->task_wait = target_task;

	if(target_task) TASK_UNLOCK(target_task);

	return target_pid;	
}
