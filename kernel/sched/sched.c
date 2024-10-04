#include <types.h>
#include <cpu.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>
#include <atomic.h>

struct rb_tree global_runq;//the global runq, used by cores to balance tasks

#ifndef USE_BIG_KERNEL_LOCK
struct spinlock global_runq_lock = {
#ifdef DBEUG_SPINLOCK
	.name = "global_runq_lock",
#endif
};

#endif

#ifndef USE_BIG_KERNEL_LOCK
struct spinlock runq_lock = {
#ifdef DBEUG_SPINLOCK
	.name = "runq_lock",
#endif
};
#endif

extern size_t nuser_tasks;
extern struct spinlock kernel_lock;
size_t runq_len = 0;//every core attempts to hold runq_len / ncpus tasks in their local runq.


static inline int64_t vruntime(struct task* task){
	uint64_t waiting_time = task->task_start_waiting ? read_tsc() - task->task_start_waiting : 0;
	int64_t runtime = (int64_t)task->task_cpu_time - (int64_t)(waiting_time / (runq_len + 1));

	return (task->task_type == TASK_TYPE_KERNEL) ? __INT64_MAX__ : runtime;
}

void sched_init(void)
{
	rb_init(&global_runq);
	sched_init_mp();
}

void sched_init_mp(void)
{
	rb_init(&this_cpu->runq);
	rb_init(&this_cpu->nextq);
	this_cpu->runq_len = 0;
}

/*
* Add to the the 'runq' the 'task' and keeps the
* 'task' locked
*/
int _runq_add(struct task* task, struct rb_tree* runq){
	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	int dir;
	node = runq->root;
	

	//check if the task became a zombiei n the meanwhile can this happen?

	int64_t vruntime_task = vruntime(task);

	while (node) {
		task_tmp = container_of(node, struct task, task_runq_node);
		parent = node;
	
		dir = (vruntime_task >= vruntime(task_tmp));
		
		node = node->child[dir];
		assert(task->task_pml4);
	}

	if (!parent){
		runq->root = &task->task_runq_node;
		assert(container_of(runq->root, struct task, task_runq_node)->task_pml4);
	} else {
		if(parent == &task->task_runq_node)return -1;
		parent->child[dir] = &task->task_runq_node;
		task->task_runq_node.parent = parent;
	}
	if (rb_balance(runq, &task->task_runq_node) < 0) {
		return -1;
	}

	return 0;
}

/*
* Remove a task from the 'runq' and returns the task locked if the runq is not empty.
*/
struct task* _runq_pop(struct rb_tree* runq){
	struct rb_node* node = rb_first(runq);
	if(!node){
		return NULL;
	}

	struct task* task = container_of(node, struct task, task_runq_node);
	TASK_LOCK(task);

	rb_remove(runq, &task->task_runq_node);
	rb_node_init(&task->task_runq_node);

	return task;
}


int global_runq_add(struct task* task){//add to global runq
	int ret = _runq_add(task, &global_runq);
	if(ret >= 0) {
		runq_len++;
		task->task_cpunum = -1; // a cpunum of -1 means tha it isnt scheduled on any core
	}

	return ret;
}

struct task* global_runq_pop(){//for global runq
	struct task* task = _runq_pop(&global_runq);
	if(task) {
		runq_len--;
		task->task_cpunum = this_cpu->cpu_id; // a normal cpu value means that the task is scheduled on a core
	}

	return task;
}

void schedule_task(struct task *task){
	//TASK NEEDS TO BE LOCKED
	GLOBAL_RUNQ_LOCK;
	global_runq_add(task);
	GLOBAL_RUNQ_UNLOCK;
}

void deschedule_task(struct task *task){
	//assert(holding(&task->task_lock));
	
	TASK_LOCK(task);

	task->task_status = TASK_DYING;
	struct rb_node *global_runq_node = &task->task_runq_node;
	struct list *local_runq_node = &task->task_local_runq_node;
	int task_cpunum = task->task_cpunum;

	TASK_UNLOCK(task);

	if(task_cpunum == -1){
		GLOBAL_RUNQ_LOCK;
		assert(rb_remove(&global_runq, global_runq_node) >= 0);
		GLOBAL_RUNQ_UNLOCK;
	}else{
		LOCAL_RUNQ_LOCK;
		list_del(local_runq_node);
		LOCAL_RUNQ_UNLOCK;
	}

}

void sched_init_mp(void)
{
	/* LAB 6: your code here. */
}

/* Runs the next runnable task. */
void sched_yield(void)
{	
	struct task* task;

	if(cur_task){
		assert(holding(&cur_task->task_lock));

		if(cur_task->task_status == TASK_RUNNABLE || cur_task->task_status == TASK_RUNNING){
			LOCAL_RUNQ_LOCK;
			list_add(&this_cpu->runq, cur_task);
			this_cpu->runq_len++;
			LOCAL_RUNQ_UNLOCK;
		}
		else cur_task = NULL;
	}
	
	LOCAL_RUNQ_LOCK;
	while(list_is_empty(&this_cpu->runq)){
	
		if(atomic_cmpxchg(&nuser_tasks, 0, 0)) sched_halt();
		if(spin_trylock(&global_runq_lock)){
			//do migration
			size_t target_runq_len = (runq_len + this_cpu->runq_len) / ncpus;
			if(target_runq_len == 0){
				target_runq_len = MAX(runq_len, this_cpu->runq_len);
			}

			while(this_cpu->runq_len < target_runq_len && runq_len > 0){
				task = global_runq_pop(); 
				assert(task);
				
				if(task->task_status != TASK_DYING) list_add(&this_cpu->nextq, &task->task_local_runq_node);	
				else task_destroy(task);
				//TASK_UNLOCK(task);
			}
			
			while(this_cpu->runq_len > target_runq_len){
				task = container_of(list_pop(&this_cpu->nextq), struct task, task_local_runq_node);
				TASK_LOCK(task);
				
				if(task->task_status != TASK_DYING) global_runq_add(task);
			
				TASK_UNLOCK(task);
				this_cpu->runq_len--;
			}
			GLOBAL_RUNQ_UNLOCK;
		}
		//swap the next queue with the run queue
		
		struct list tmp = this_cpu->nextq;
		this_cpu->nextq = this_cpu->runq;
		this_cpu->runq = tmp;
	}

	assert(!list_is_empty(this_cpu->runq_len));
	this_cpu->runq_len = 0;
	task = container_of(list_pop(&this_cpu->runq), struct task, task_local_runq_node);

	LOCAL_RUNQ_UNLOCK;

	task_run(task);
}
/* For now jump into the kernel monitor. */

void sched_halt()
{
	GLOBAL_RUNQ_LOCK;
	xchg(&this_cpu->cpu_status, CPU_HALTED);

	bool all_processors_halted = true;
	for(int i = 0; i < ncpus; i++){
		if(cpus[i].cpu_status != CPU_HALTED){
			all_processors_halted = false;
			break;
		}
	}

	if(all_processors_halted) {
		cprintf("Destroyed the only task - nothing more to do!\n");
		GLOBAL_RUNQ_UNLOCK;
		monitor(NULL);
	}
	
	GLOBAL_RUNQ_UNLOCK;

	asm volatile(
		"cli\n"
		"hlt\n");
}