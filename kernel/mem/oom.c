#include <kernel/mem.h>
#include <rbtree.h>
#include <kernel/sched.h>



//should not oom cur_task!

struct rb_tree oom_candidates;

void add_task_to_oom_candidates(struct task *task){
    struct rb_node *node, *parent = NULL;
    struct task *task_tmp = NULL;
	bool ret = false;
	int dir;

	node = oom_candidates.root;
	
	int64_t task_rss = task->task_rss_pages;

	while (node) {
		task_tmp = container_of(node, struct task, task_oom_node);

		if(task_tmp == task) return;
		
		if(task != task_tmp) TASK_LOCK(task_tmp);

		parent = node;
	
		dir = (task_rss >= task_tmp->task_rss_pages);
		if(task != task_tmp) TASK_UNLOCK(task_tmp);
		
		node = node->child[dir];
	}

    if (!parent){
		oom_candidates.root = &task->task_oom_node;
	} else {
		parent->child[dir] = &task->task_oom_node;
		task->task_oom_node.parent = parent;
	}

	if (rb_balance(&oom_candidates, &task->task_oom_node) < 0) {
		return -1;
	}
    return 0;
}

//this assumes that the task is already in the oom_candidates
void remove_task_from_oom_candidates(struct task *task){
    rb_remove(&oom_candidates, &task->task_oom_node);
}


void _attempt_oom_kill(void* data){
   struct task* task = rb_last(&oom_candidates);
   if(task) task_free(task);
}

void attempt_oom_kill(){
    _attempt_oom_kill(NULL);
}

