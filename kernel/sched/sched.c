#include <types.h>
#include <cpu.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>

struct rb_tree runq;


#ifndef USE_BIG_KERNEL_LOCK
struct spinlock runq_lock = {
#ifdef DBEUG_SPINLOCK
	.name = "runq_lock",
#endif
};
#endif
extern size_t nuser_tasks;
extern struct spinlock kernel_lock;
size_t runq_len = 0;


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
	/* LAB 6: your code here. */
}


int runq_add(struct task* task){
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

struct task* runq_pop(){
	struct rb_node* node = rb_first(&runq);
	if(!node) return NULL;

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

	//if global runq is empty wait for it to be filled
	//but the problem is that we cant sleep
	
	if(runq.root == NULL){
		if(nuser_tasks == 0) monitor(NULL);
		else if(cur_task && cur_task->task_status == TASK_RUNNING) task_run(cur_task);


		//this is just for BKL i thinktask_run(
		#ifdef USE_BIG_KERNEL_LOCK
		spin_unlock(&kernel_lock);
		#endif
		while(true){
			#ifdef USE_BIG_KERNEL_LOCK
			spin_lock(&kernel_lock);
			#endif
			if(runq.root) break;
			#ifdef USE_BIG_KERNEL_LOCK
			spin_unlock(&kernel_lock);
			#endif
		}
	}

	task = runq_pop();
	cprintf("running task: %d, runq: %p cpu: %d\n", task->task_pid, &runq, this_cpu->cpu_id);
	task_run(task);
}
/* For now jump into the kernel monitor. */
void sched_halt()
{
	while (1) {
		monitor(NULL);
	}
}