#pragma once

void sched_init(void);
void sched_init_mp(void);
void sched_yield(void);
void sched_halt(void);

void schedule_task(struct task *task);
void deschedule_task(struct task *task);

