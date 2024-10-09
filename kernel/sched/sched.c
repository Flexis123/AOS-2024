#include <types.h>
#include <cpu.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>

struct rb_tree runq;//the global runq, used by cores to balance tasks

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


//give priority that wait for a longer time
static inline int64_t vruntime(struct task* task){
	uint64_t waiting_time = task->task_start_waiting ? read_tsc() - task->task_start_waiting : 0;
	return (int64_t)task->task_cpu_time - (int64_t)(waiting_time / (runq_len + 1));
}

void sched_init(void)
{
	rb_init(&runq);
}

void sched_init_mp(void)
{
	list_init(&this_cpu->runq);
	list_init(&this_cpu->nextq);
	this_cpu->runq_len = 0;
}


int runq_add(struct task* task){//add to global runq
	assert(task);
	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	int dir;

	node = runq.root;

	int64_t vruntime_task = vruntime(task);

	while (node) {
		task_tmp = container_of(node, struct task, task_runq_node);
		parent = node;
		dir = (vruntime_task >= vruntime(task_tmp));
		node = node->child[dir];
	}

	if (!parent){
		runq.root = &task->task_runq_node;
	} else {
		parent->child[dir] = &task->task_runq_node;
		task->task_runq_node.parent = parent;
	}

	if (rb_balance(&runq, &task->task_runq_node) < 0) {
		return -1;
	}

	task->is_in_runq = true;
	runq_len++;
	return 0;
}

struct task* runq_pop(){//for global runq

	if(runq_len == 0){
		return NULL;
	}
	struct rb_node* node = rb_first(&runq);
	if(!node){
		return NULL;
	}

	struct task* task = container_of(node, struct task, task_runq_node);
	rb_remove(&runq, &task->task_runq_node);

	rb_node_init(&task->task_runq_node);

	task->is_in_runq = false;
	runq_len--;
	return task;
}


/* Runs the next runnable task. */
void sched_yield(void)
{	
	struct task* task;
#ifdef USE_BIG_KERNEL_LOCK
	if(runq.root == NULL){
		if(nuser_tasks == 0) monitor(NULL);
		else if(cur_task && cur_task->task_status == TASK_RUNNING){
			cprintf("running only task available: %d,cpu: %d\n", cur_task->task_pid, this_cpu->cpu_id);	
			task_run(cur_task);
		}
		cur_task = NULL;

		//this is just for BKL i thinktask_run(
		spin_unlock(&kernel_lock);
		while(true){
			spin_lock(&kernel_lock);
			if(runq.root) break;

			if(nuser_tasks == 0) monitor(NULL);
			spin_unlock(&kernel_lock);
		}
	}

	task = runq_pop();
	cprintf("running task: %d, runq: %p cpu: %d\n", task->task_pid, &runq, this_cpu->cpu_id);
	task_run(task);

#else
	if(cur_task && (cur_task->task_status == TASK_RUNNABLE || cur_task->task_status == TASK_RUNNING)){
		list_add(&this_cpu->nextq, &cur_task->task_local_runq_node);
	}

	if(list_is_empty(&this_cpu->runq)){
		if(spin_trylock(&runq_lock)){
			//do migration
			size_t target_runq_len = (global_runq_len + this_cpu->runq_len) / ncpus;
			if(target_runq_len == 0 && global_runq_len > 0){
				target_runq_len = 1;
			}
			while(this_cpu->runq_len < target_runq_len && global_runq_len > 0){
				struct task *task = runq_pop();
				assert(task);
				list_add(&this_cpu->nextq, &task->task_local_runq_node);
				this_cpu->runq_len++;
			}
			while(this_cpu->runq_len > target_runq_len){
				assert(!list_is_empty(&this_cpu->runq));
				struct task *task = container_of(list_pop(&this_cpu->nextq), struct task, task_local_runq_node);
				assert(task);
				runq_add(task);
				this_cpu->runq_len--;
			}
			spin_unlock(&runq_lock);
		}
		//swap the next queue with the run queue
		struct list *tmp = list_head(&this_cpu->nextq);
		list_del(&this_cpu->nextq);
		list_add(&this_cpu->runq, tmp);
		this_cpu->runq_len = 0;
	}

	if(list_is_empty(&this_cpu->runq)){
		/*
		we get here if the nextq is empty even after checking the global queue as the lobal queue is empty
		so we halt the scheduling

		*/
		sched_halt();
	}
	
	task = container_of(list_pop(&this_cpu->runq), struct task, task_local_runq_node);
	assert(task);
	this_cpu->runq_len++;
	cprintf("running task: %d, runq: cpu: %d\n", task->task_pid, this_cpu->cpu_id);
	task_run(task);
#endif
}
/* For now jump into the kernel monitor. */
void sched_halt()
{
	while (1) {
		monitor(NULL);
	}
}