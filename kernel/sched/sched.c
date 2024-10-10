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
	return(int64_t)task->task_cpu_time - (int64_t)(waiting_time / (runq_len + 1));
}

void sched_init(void)
{
	rb_init(&runq);
	sched_init_mp();
}

void sched_init_mp(void)
{
	list_init(&this_cpu->runq);
	list_init(&this_cpu->nextq);
	this_cpu->runq_len = 0;
}


int runq_add(struct task* task){//add to global runq
	assert(task);
	assert(holding(&runq_lock));
	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	int dir;

	node = runq.root;
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif
	int64_t vruntime_task = vruntime(task);
	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif

	while (node) {
		task_tmp = container_of(node, struct task, task_runq_node);
		parent = node;

		#ifndef USE_BIG_KERNEL_LOCK
		if(task_tmp != task)spin_lock(&task->task_lock);
		#endif
		dir = (vruntime_task >= vruntime(task_tmp));
		#ifndef USE_BIG_KERNEL_LOCK
		if(task_tmp != task)spin_unlock(&task->task_lock);
		#endif
		node = node->child[dir];
	}
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif
	if (!parent){
		runq.root = &task->task_runq_node;
	} else {
		parent->child[dir] = &task->task_runq_node;
		task->task_runq_node.parent = parent;
	}
	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif

	if (rb_balance(&runq, &task->task_runq_node) < 0) {
		return -1;
	}
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif
	task->is_in_runq = true;
	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif
	runq_len++;
	return 0;
}

struct task* runq_pop(){//for global runq
	assert(runq_len > 0);
	assert(holding(&runq_lock));
	struct rb_node* node = rb_first(&runq);
	if(!node){
		return NULL;
	}

	struct task* task = container_of(node, struct task, task_runq_node);
	rb_remove(&runq, &task->task_runq_node);
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif
	rb_node_init(&task->task_runq_node);

	task->is_in_runq = false;
	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif
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

			if(nuser_tasks == 0) {
				spin_unlock(&kernel_lock);
				monitor(NULL);
			}
			spin_unlock(&kernel_lock);
		}
	}

	task = runq_pop();
	cprintf("running task: %d, runq: %p cpu: %d\n", task->task_pid, &runq, this_cpu->cpu_id);
	task_run(task);

#else
	cprintf("printing runq before fill\n");
	struct list* node;
	list_foreach(&this_cpu->runq, node){
		cprintf("%d,", container_of(node, struct task, task_local_runq_node)->task_pid);
	}
	cprintf("\n");
	if(this_cpu->runq_len == 0) assert(list_is_empty(&this_cpu->nextq));
	if(cur_task){

		spin_lock(&cur_task->task_lock);
		cprintf("curr task  %d\n", cur_task->task_pid);
		spin_unlock(&cur_task->task_lock);

		if(cur_task->task_status == TASK_RUNNABLE || cur_task->task_status == TASK_RUNNING){
			spin_lock(&cur_task->task_lock);
			cprintf("curr task adedd to nextq %d\n", cur_task->task_pid);
			cprintf("runqlen %lu\n", this_cpu->runq_len + 1);
			list_add(&this_cpu->nextq, &cur_task->task_local_runq_node);
			spin_unlock(&cur_task->task_lock);
			this_cpu->runq_len++;
		}
		else{
			spin_lock(&cur_task->task_lock);
			struct task *old_task = cur_task;
			spin_unlock(&cur_task->task_lock);
			cur_task = NULL;
		}
	}
	cprintf("cur_task checked in sched yield\n");
	
	cprintf("runq_len before migration: %lu\n", runq_len);
	cprintf("this_cpu->runq_len before: %lu\n", this_cpu->runq_len);
	while(list_is_empty(&this_cpu->runq)){
		if(atomic_cmpxchg(&nuser_tasks, 0, 0)) sched_halt();
		if(spin_trylock(&runq_lock)){
			//do migration
			size_t target_runq_len = (runq_len + this_cpu->runq_len) / ncpus;
			if(target_runq_len == 0){
				target_runq_len = MAX(runq_len, this_cpu->runq_len);
			}
			assert(target_runq_len != 0);
			while(this_cpu->runq_len < target_runq_len && runq_len > 0){
				struct task *task = runq_pop();
				assert(task);
				list_add(&this_cpu->nextq, &task->task_local_runq_node);
				this_cpu->runq_len++;
			}
			while(this_cpu->runq_len > target_runq_len){
				assert(!list_is_empty(&this_cpu->nextq));
				struct task *task = container_of(list_pop(&this_cpu->nextq), struct task, task_local_runq_node);
				assert(task);
				runq_add(task);
				this_cpu->runq_len--;
			}
			cprintf("this_cpu->runq_len - target_runq_len = %d\n", (int) this_cpu->runq_len - target_runq_len);
			spin_unlock(&runq_lock);
		}
		//swap the next queue with the run queue
		struct list *tmp = list_head(&this_cpu->nextq);
		if(tmp){
			assert(list_is_empty(&this_cpu->runq));

			list_del(&this_cpu->nextq);
			
			this_cpu->runq.next = tmp;
			this_cpu->runq.prev = tmp->prev;

			struct list* tmp_tail = tmp->prev;
			tmp->prev = &this_cpu->runq;
			tmp_tail->next = &this_cpu->runq;

			this_cpu->runq_len = 0;
		}
	}

		
	struct list *task_list = list_pop(&this_cpu->runq);
	task = container_of(task_list, struct task, task_local_runq_node);
	assert(task);

	task_run(task);
#endif
}
/* For now jump into the kernel monitor. */
void sched_halt()
{
	xchg(&this_cpu->cpu_status, CPU_HALTED);

	cprintf("Halted cpu %d\n", this_cpu->cpu_id);

	bool all_processors_halted = true;
	for(int i = 0; i < NCPUS; i++){
		if(cpus[i].cpu_status != CPU_HALTED){
			all_processors_halted = false;
			break;
		}
	}

	if(all_processors_halted) {
		cprintf("Entering the monitor here\n");
		monitor(NULL);
	}

	asm volatile(
		"cli\n"
		"hlt\n");
}