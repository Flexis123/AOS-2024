#pragma once

#include <task.h>
#include <cpu.h>
#include <kernel/mem/buddy.h>

#define cur_task (this_cpu->cpu_task)

struct task *pid2task(pid_t pid, int check_perm);
struct task *task_alloc(pid_t ppid);
void task_init(void);
void task_create(uint8_t *binary, enum task_type type);
void task_free(struct task *task);
void task_destroy(struct task *task);
void task_pop_frame(struct int_frame *frame);
void task_run(struct task *task);

void task_kernel_setzero_create();//creates the setzero kernel task. setzero sets the physical memory of unused pages to 0.
void task_run_kernel(struct task *kernel_task);//use this to run kernel tasks, not task_run
struct task *pml4_to_task(struct page_table *pml4);

/* Without this extra macro, we couldn't pass macros like TEST to TASK_CREATE()
 * because of the C preprocessor's argument prescan rule.
 */
#define TASK_PASTE3(x, y, z) x ## y ## z

#define TASK_CREATE(x, type)                                             \
	do {                                                             \
		extern uint8_t TASK_PASTE3(_binary_obj_, x, _start)[];   \
		task_create(TASK_PASTE3(_binary_obj_, x, _start), type); \
	} while (0)
