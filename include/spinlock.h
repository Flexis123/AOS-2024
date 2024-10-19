#pragma once

struct cpuinfo;

struct spinlock {
	/* Is the lock held? */
	volatile unsigned locked;

#define DEBUG_SPINLOCK
	/* The name of the lock. */
	const char *name;

	/* The CPU that is holding the lock. */
	struct cpuinfo *cpu;

	/* The filename and line at which the last successful lock took
	 * place.
	 */
	const char *file;
	int line;
};

#define spin_lock(lock) __spin_lock(lock, __FILE__, __LINE__)
#define spin_trylock(lock) __spin_trylock(lock, __FILE__, __LINE__)
#define spin_unlock(lock) __spin_unlock(lock, __FILE__, __LINE__)

void spin_init(struct spinlock *lock, const char *name);
void __spin_lock(struct spinlock *lock, const char *file, int line);
int __spin_trylock(struct spinlock *lock, const char *file, int line);
void __spin_unlock(struct spinlock *lock, const char *file, int line);
int holding(struct spinlock *lock);



#ifndef USE_BIG_KERNEL_LOCK

	extern struct spinlock buddy_lock;
	extern struct spinlock console_lock;
	extern struct spinlock global_runq_lock;
	extern struct spinlock task_table_lock;

	#define KLOCK
	#define KUNLOCK

	#define TASK_LOCK(task) (spin_lock(&task->task_lock))
	#define TASK_UNLOCK(task) (spin_unlock(&task->task_lock))

	#define PROC_TABLE_LOCK (spin_lock(&task_table_lock))
	#define PROC_TABLE_UNLOCK (spin_unlock(&task_table_lock))

	#define BUDDY_LOCK (spin_lock(&buddy_lock))
	#define BUDDY_UNLOCK (spin_unlock(&buddy_lock))

	#define CONSOLE_LOCK (spin_lock(&console_lock))
	#define CONSOLE_UNLOCK (spin_unlock(&console_lock))

	#define GLOBAL_RUNQ_LOCK (spin_lock(&global_runq_lock))
	#define GLOBAL_RUNQ_UNLOCK (spin_unlock(&global_runq_lock))

	#define LOCAL_RUNQ_LOCK (spin_lock(&this_cpu->runq_lock))
	#define LOCAL_RUNQ_UNLOCK (spin_unlock(&this_cpu->runq_lock))
#else

	extern struct spinlock kernel_lock;

	#define KLOCK (spin_lock(&kernel_lock))
	#define KUNLOCK (spin_unlock(&kernel_lock))

	#define TASK_LOCK(task) 
	#define TASK_UNLOCK(task) 

	#define BUDDY_LOCK 
	#define BUDDY_UNLOCK 

	#define CONSOLE_LOCK 
	#define CONSOLE_UNLOCK 

	#define GLOBAL_RUNQ_LOCK 
	#define GLOBAL_RUNQ_UNLOCK

	#define LOCAL_RUNQ_LOCK
	#define LOCAL_RUNQ_UNLOCK

#endif