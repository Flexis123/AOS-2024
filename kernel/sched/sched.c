#include <types.h>
#include <list.h>
#include <stdio.h>
#include <x86-64/asm.h>
#include <x86-64/paging.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>

struct rb_tree runq;
extern size_t nuser_tasks;
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

	if(runq.root == NULL){
		if(!cur_task) sched_halt();
		task_run(cur_task);
	}

	task = runq_pop();
	cprintf("running task: %d\n", task->task_pid);
	task_run(task);
}
/* For now jump into the kernel monitor. */
void sched_halt()
{
	while (1) {
		monitor(NULL);
	}
}