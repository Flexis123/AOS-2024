#include <types.h>

typedef int64_t (*task_score_fn)(struct task*);

struct task* pop_task(struct rb_tree* tree, task_score_fn tsfn);
void add_task(struct rb_tree* tree, struct task* task, task_score_fn tsfn);
struct task* lookup_task(struct rb_tree* tree, struct task* task, size_t runq_node_offset, struct rb_node** _parent, int* _dir);