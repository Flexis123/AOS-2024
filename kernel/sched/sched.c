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

#define VRUNTIME_PENALTY_KTASK 10

//give priority that wait for a longer time
static inline int64_t vruntime(struct task* task){
	uint64_t waiting_time = task->task_start_waiting ? read_tsc() - task->task_start_waiting : 0;
	int64_t runtime = (int64_t)task->task_cpu_time - (int64_t)(waiting_time / (runq_len + 1));

	return (task->task_type == TASK_TYPE_KERNEL) ? runtime * VRUNTIME_PENALTY_KTASK : runtime;
}

void sched_init(void)
{
	rb_init(&runq);
	sched_init_mp();
}

void sched_init_mp(void)
{
	rb_init(&this_cpu->runq);
	rb_init(&this_cpu->nextq);
	this_cpu->runq_len = 0;
}

struct task* local_runq_pop(struct rb_tree* tree);

int local_runq_add(struct task* task, struct rb_tree* tree){
	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	int dir;
	node = tree->root;
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif

	int64_t vruntime_task = vruntime(task);

	while (node) {
		task_tmp = container_of(node, struct task, task_runq_node);
		parent = node;
		assert(task->task_pml4);

		#ifndef USE_BIG_KERNEL_LOCK
		//cprintf("task_tmp->task_pid == %d and task->task_pid == %d\n", task_tmp->task_pid, task->task_pid);
		if(task_tmp != task){
			spin_lock(&task_tmp->task_lock);
		}
		#endif

		/*
		if(task_tmp->task_pid == task->task_pid) {
			#ifndef USE_BIG_KERNEL_LOCK
			spin_unlock(&task_tmp->task_lock);
			#endif
			return -1;
		}
		*/

		dir = (vruntime_task >= vruntime(task_tmp));
		#ifndef USE_BIG_KERNEL_LOCK
		if(task_tmp != task)spin_unlock(&task_tmp->task_lock);
		#endif
		node = node->child[dir];
		assert(task->task_pml4);

	}
	if (!parent){
		tree->root = &task->task_runq_node;
		assert(container_of(tree->root, struct task, task_runq_node)->task_pml4);
	} else {
		parent->child[dir] = &task->task_runq_node;
		task->task_runq_node.parent = parent;
	}
	if (rb_balance(tree, &task->task_runq_node) < 0) {
		return -1;
	}

	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif
	return 0;
}

struct task* local_runq_pop(struct rb_tree* tree){
	struct rb_node* node = rb_first(tree);
	if(!node){
		return NULL;
	}

	struct task* task = container_of(node, struct task, task_runq_node);
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif

	rb_remove(tree, &task->task_runq_node);
	rb_node_init(&task->task_runq_node);
	task->is_in_runq = false;

	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif
	return task;
}


int runq_add(struct task* task){//add to global runq
	assert(task);
	assert(holding(&runq_lock));
	int ret = local_runq_add(task, &runq);
	if(ret >= 0) {
		runq_len++;
		task->is_in_runq = true;
	}
	return ret;
}

struct task* runq_pop(){//for global runq
	assert(runq_len > 0);
	assert(holding(&runq_lock));

	struct task* task = local_runq_pop(&runq);
	if(task) {
		runq_len--;
		task->is_in_runq = false;
	}
	return task;
}

static void debug_print_runq(struct rb_tree *tree, char* runqname){
	if(tree->root){
//		cprintf("printing %s\n", runqname);
//		cprintf("root = %d\n", container_of(tree->root, struct task, task_runq_node)->task_pid);
		//if(runq.root->child[RB_LEFT]) cprintf("root.left = %d\n", container_of(tree->root->child[RB_LEFT], struct task, task_runq_node)->task_pid);
		//if(runq.root->child[RB_RIGHT]) cprintf("root.right = %d\n", container_of(tree->root->child[RB_RIGHT], struct task, task_runq_node)->task_pid);
	}
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
	if(cur_task){
		if(cur_task->task_status == TASK_RUNNABLE || cur_task->task_status == TASK_RUNNING){
			local_runq_add(cur_task, &this_cpu->nextq);
			this_cpu->runq_len++;
		}
		else{
			cur_task = NULL;
		}
	}
	
	while(this_cpu->runq.root == NULL){
		if(atomic_cmpxchg(&nuser_tasks, 0, 0)) sched_halt();
		if(spin_trylock(&runq_lock)){
			//do migration
			size_t target_runq_len = (runq_len + this_cpu->runq_len) / ncpus;
			if(target_runq_len == 0){
				target_runq_len = MAX(runq_len, this_cpu->runq_len);
			}
			
			while(this_cpu->runq_len < target_runq_len && runq_len > 0){
				struct task *task = runq_pop();
				assert(task);
				
				local_runq_add(task, &this_cpu->nextq);	
			}
			
			while(this_cpu->runq_len > target_runq_len){
				struct task *task = local_runq_pop(&this_cpu->nextq);
				assert(task);
				
				runq_add(task);
				this_cpu->runq_len--;
			}
			spin_unlock(&runq_lock);
		}
		//swap the next queue with the run queue
		
		struct rb_tree tmp = this_cpu->nextq;
		this_cpu->nextq = this_cpu->runq;
		this_cpu->runq = tmp;

		//cprintf("nusertask = %lu\n", nuser_tasks);
	}

	assert(this_cpu->runq.root);
	this_cpu->runq_len = 0;
	task = local_runq_pop(&this_cpu->runq);
	//cprintf("popped task %d from the runq in cpu %d\n", task->task_pid, this_cpu->cpu_id);
	assert(task);

	task_run(task);
#endif
}
/* For now jump into the kernel monitor. */

void sched_halt()
{
	spin_lock(&runq_lock);
	xchg(&this_cpu->cpu_status, CPU_HALTED);
	cprintf("Halted cpu %d\n", this_cpu->cpu_id);

	bool all_processors_halted = true;
	for(int i = 0; i < ncpus; i++){
		if(cpus[i].cpu_status != CPU_HALTED){
			all_processors_halted = false;
			break;
		}
	}

	if(all_processors_halted) {
		cprintf("Destroyed the only task - nothing more to do!\n");
		spin_unlock(&runq_lock);
		monitor(NULL);
	}

	cprintf("Halting cpu %d\n", this_cpu->cpu_id);
	spin_unlock(&runq_lock);
	asm volatile(
		"cli\n"
		"hlt\n");
}