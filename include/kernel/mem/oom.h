#include <task.h>

void attempt_oom_kill();
void create_oom_killer_kthread();
void add_task_to_oom_candidates(struct task *task);
void remove_task_from_oom_candidates(struct task *task);