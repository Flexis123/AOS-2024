#pragma once

void sched_init(void);
void sched_yield(void);
void sched_halt(void);

int runq_add(struct task* task);

