#include <types.h>
#include <error.h>

#include <kernel/mem.h>
#include <kernel/sched.h>

extern struct rb_tree runq;
extern struct task **tasks;
extern size_t nuser_tasks;

pid_t sys_wait(int *rstatus)
{	
	return sys_waitpid(-1, rstatus, 0);
}

pid_t sys_waitpid(pid_t pid, int *rstatus, int opts)
{
	assert(!opts); // we dont support opts for now

	if(list_is_empty(&cur_task->task_children)){
		return -ECHILD;
	}
	cprintf("running sys_waitpid on pid: %d\n", pid);

	if(pid != 0 && !pid2task(pid, true)){
		return -ECHILD;
	}
	struct task *zombie = (pid == -1)? container_of(list_head(&cur_task->task_zombies), struct task, task_zombie_node) : pid2task(pid, true);

	if(zombie && zombie->task_status == TASK_DYING){
		assert(zombie->task_ppid == cur_task->task_pid);
		int zombie_pid = zombie->task_pid;
		list_del(&zombie->task_zombie_node);
		list_del(&zombie->task_child);
		task_destroy(zombie);
		return zombie_pid;
	}
	if(!zombie){
		assert(pid == -1);
		zombie = container_of(list_head(&cur_task->task_children), struct task, task_child);
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;//the child is not a zombie yet
	cur_task->task_wait = zombie;
	return zombie->task_pid;	
}
