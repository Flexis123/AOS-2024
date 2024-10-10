#include <types.h>
#include <cpu.h>
#include <error.h>

#include <kernel/mem.h>
#include <kernel/sched.h>

extern struct rb_tree runq;
extern struct task **tasks;
extern size_t nuser_tasks;
extern struct spinlock kernel_lock;

pid_t sys_wait(int *rstatus)
{	
	return sys_waitpid(-1, rstatus, 0);
}

pid_t sys_waitpid(pid_t pid, int *rstatus, int opts)
{
	assert(!opts); // we dont support opts for now
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&cur_task->task_lock);
	#endif

	if(list_is_empty(&cur_task->task_children)){

		#ifndef USE_BIG_KERNEL_LOCK
		spin_unlock(&cur_task->task_lock);
		#endif

		return -ECHILD;
	}
	cprintf("running sys_waitpid on pid: %d\n", pid);

	if(pid != 0 && !pid2task(pid, true)){
		#ifndef USE_BIG_KERNEL_LOCK
		spin_unlock(&cur_task->task_lock);
		#endif
		return -ECHILD;
	}
	struct task *zombie = (pid == -1)? container_of(list_head(&cur_task->task_zombies), struct task, task_zombie_node) : pid2task(pid, true);

	#ifndef USE_BIG_KERNEL_LOCK
	if(zombie)spin_lock(&zombie->task_lock);
	#endif

	if(zombie && zombie->task_status == TASK_DYING){
		assert(zombie->task_ppid == cur_task->task_pid);
		assert(zombie != cur_task);
		int zombie_pid = zombie->task_pid;
		list_del(&zombie->task_zombie_node);
		list_del(&zombie->task_child);

		while(cpus[zombie->task_cpunum].cpu_task == zombie){
			cprintf("Oh no! the zombie is still begin run on cpu: %d\n", zombie->task_cpunum);
			#ifdef USE_BIG_KERNEL_LOCK
			spin_unlock(&kernel_lock);
			#endif
			lapic_ipi(IRQ_TIMER);
			#ifdef USE_BIG_KERNEL_LOCK
			spin_lock(&kernel_lock);
			#endif

		}//busy wait for the zombie task to be descheduled by cores who
											//did not notice the state change to DYING
		#ifndef USE_BIG_KERNEL_LOCK
		if(zombie)spin_unlock(&zombie->task_lock);
		spin_unlock(&cur_task->task_lock);
		#endif

		task_destroy(zombie);
		return zombie_pid;
	}
	pid_t return_pid = 0;
	if(!zombie){
		assert(pid == -1);
		zombie = container_of(list_head(&cur_task->task_children), struct task, task_child);

		#ifndef USE_BIG_KERNEL_LOCK
		spin_lock(&zombie->task_lock);
		#endif

		return_pid = zombie->task_pid;
	}
	else{
		return_pid = zombie->task_pid;
	}
	cur_task->task_status = TASK_NOT_RUNNABLE;//the child is not a zombie yet
	cur_task->task_wait = zombie;

	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&zombie->task_lock);
	spin_unlock(&cur_task->task_lock);
	#endif

	return return_pid;	
}
