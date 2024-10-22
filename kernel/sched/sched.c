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

bool _is_task_scheduled(struct rb_tree* tree, struct task* task, size_t runq_node_offset, struct rb_node** _parent, int* _dir){
	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	bool ret = false;
	int dir;

	node = tree->root;
	
	int64_t vruntime_task = vruntime(task);

	while (node) {
		task_tmp = container_of_from_offset(node, struct task, runq_node_offset);

		if(task_tmp == task) {
			ret = true;
			break;
		} //duplicate entries not allowed!
		
		if(task != task_tmp) TASK_LOCK(task_tmp);

		parent = node;
	
		dir = (vruntime_task >= vruntime(task_tmp));
		if(task != task_tmp) TASK_UNLOCK(task_tmp);
		
		node = node->child[dir];
		assert(task->task_pml4);
	}

	if(_dir) *_dir = dir;
	if(_parent) *_parent = parent;

	return ret;
}

int _runq_add(struct rb_tree* tree, struct task* task, size_t runq_node_offset){

	assert(holding(&task->task_lock));

	struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	int dir;

	if(_is_task_scheduled(tree, task, runq_node_offset, &parent, &dir)) return -1;

	struct rb_node* task_runq_node = field_from_offset(task, struct rb_node, runq_node_offset);

	if (!parent){
		tree->root = task_runq_node;
	} else {
		parent->child[dir] = task_runq_node;
		task_runq_node->parent = parent;
	}

	if (rb_balance(tree, task_runq_node) < 0) {
		return -1;
	}

	return 0;
}

struct task* _runq_pop(struct rb_tree* tree, size_t runq_node_offset){
	struct rb_node* node = rb_first(tree);
	if(!node){
		return NULL;
	}

	struct task* task = container_of_from_offset(node, struct task, runq_node_offset);
	TASK_LOCK(task);

	rb_remove(tree, node);
	
	return task;
}

/*
 * Adds the 'task' to the global runq.
 * The task is expected to be locked before inserting
 * Also the global runq is expected to be locked!
*/
int global_runq_add(struct task* task){//add to global runq
	assert(holding(&global_runq_lock));
	int ret = _runq_add(&global_runq, task, offsetof(struct task, task_global_runq_node));
	if(ret >= 0){
		runq_len++;
		task->task_cpunum = -1; 
	}
	return ret;
}

struct task* global_runq_pop(){//for global runq
	assert(holding(&global_runq_lock));
	struct task* task = _runq_pop(&global_runq, offsetof(struct task, task_global_runq_node));
	
	if(task){
		runq_len--;
		task->task_cpunum = this_cpu->cpu_id;
	} // a normal cpu value means that the task is scheduled on a core
	
	return task;
}

int local_runq_add(struct rb_tree *tree, struct task* task){
	assert(holding(&this_cpu->runq_lock));
	return _runq_add(tree, task, offsetof(struct task, task_local_runq_node));
}

struct task* local_runq_pop(struct rb_tree *tree){
	assert(holding(&this_cpu->runq_lock));
	return _runq_pop(tree, offsetof(struct task, task_local_runq_node));
}

bool is_scheduled_in_nextq(struct task* task){
	return _is_task_scheduled(&this_cpu->nextq, task, offsetof(struct task, task_local_runq_node), NULL, NULL);
}

bool is_scheduled_in_runq(struct task* task){
	return _is_task_scheduled(&this_cpu->runq, task, offsetof(struct task, task_local_runq_node), NULL, NULL);
}

//TASK NEEDS TO BE LOCKED
void schedule_task(struct task *task){
	GLOBAL_RUNQ_LOCK;
	global_runq_add(task);
	GLOBAL_RUNQ_UNLOCK;
}

/*
 *removes task from every runqueue and is put in a dying state

 *the task may be still running after this operation
 * This functionn expects the task to be locked already
 * 
*/
void deschedule_task(struct task *task){
    if(!holding(&task->task_lock)){
		panic("task lock should be held in deschedule task\n");
	}
	
	task->task_status = TASK_DYING;

	struct rb_node* task_global_runq_node = &task->task_global_runq_node;
	struct rb_node* task_local_runq_node = &task->task_local_runq_node;

	TASK_UNLOCK(task);

	GLOBAL_RUNQ_LOCK;
	LOCAL_RUNQ_LOCK;

	TASK_LOCK(task);
	
	if(task->task_cpunum == -1){
		rb_remove(&global_runq, &task->task_global_runq_node);
		runq_len--;
	}else if(is_scheduled_in_nextq(task)){
		rb_remove(&this_cpu->nextq, &task->task_local_runq_node);
		this_cpu->runq_len--;
	}else if(is_scheduled_in_runq(task)){
		rb_remove(&this_cpu->runq, &task->task_local_runq_node);
	}

	TASK_UNLOCK(task);

	GLOBAL_RUNQ_UNLOCK;
	LOCAL_RUNQ_UNLOCK;

	TASK_LOCK(task);
}

/* Runs the next runnable task. */
void sched_yield(void)
{	
	struct task* task;

	if(cur_task){
		TASK_LOCK(cur_task);

		if(cur_task->task_status == TASK_RUNNABLE || cur_task->task_status == TASK_RUNNING){
			LOCAL_RUNQ_LOCK;
			if(local_runq_add(&this_cpu->nextq, cur_task) >= 0) this_cpu->runq_len++;
			LOCAL_RUNQ_UNLOCK;

			TASK_UNLOCK(cur_task);
		}
		else {
			TASK_UNLOCK(cur_task);
			cur_task = NULL;
		}
	}
	
	LOCAL_RUNQ_LOCK;
	while(this_cpu->runq.root == NULL){
		
		if(atomic_cmpxchg(&nuser_tasks, 0, 0)) {
			LOCAL_RUNQ_UNLOCK;
			sched_halt();
		}

		if(spin_trylock(&global_runq_lock)){
			//do migration
			size_t target_runq_len = (runq_len + this_cpu->runq_len) / ncpus;
			if(target_runq_len == 0){
				target_runq_len = MAX(runq_len, this_cpu->runq_len);
			}

			while(this_cpu->runq_len < target_runq_len && runq_len > 0){
				task = global_runq_pop(); 
				assert(task);
				
				if(task->task_status != TASK_DYING && local_runq_add(&this_cpu->nextq, task) >= 0) {
					this_cpu->runq_len++;	
				}
				TASK_UNLOCK(task);
			}
			
			while(this_cpu->runq_len > target_runq_len){
				task = local_runq_pop(&this_cpu->nextq);
				
				if(!task) break;
				else if(task->task_status != TASK_DYING) global_runq_add(task);
			
				TASK_UNLOCK(task);
				this_cpu->runq_len--;
			}
			GLOBAL_RUNQ_UNLOCK;
		}
		//swap the next queue with the run queue
		
		struct rb_tree tmp = this_cpu->nextq;
		this_cpu->nextq = this_cpu->runq;
		this_cpu->runq = tmp;
	}

	this_cpu->runq_len = 0;
	task = local_runq_pop(&this_cpu->runq);

	//here it is out of the runq and the task can either go inside the nextq or be desched

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

	assert(!cur_task);
	asm volatile(
		"core_suspend:\n"
		"cli\n"
		"hlt\n"
		"jmp core_suspend\n");
}