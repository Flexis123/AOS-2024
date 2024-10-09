#include <task.h>
#include <vma.h>

#include <kernel/vma.h>
#include <assert.h>

/* Given a task and two VMAs, checks if the VMAs are adjacent and compatible
 * for merging. If they are, then the VMAs are merged by removing the
 * right-hand side and extending the left-hand side by setting the end address
 * of the left-hand side to the end address of the right-hand side.
 */
struct vma *merge_vma(struct task *task, struct vma *lhs, struct vma *rhs)
{
	if(!lhs){
		panic("no lhs in merge_vma");
	}
	if(!rhs){
		panic("no rhs in merge_vma");
	}
	if(!task){
		panic("no task in merge_vma");
	}

	//assert(!lhs || !rhs || !task);

	if(lhs->vm_end != rhs->vm_base){
		return NULL;
	}
	else if(lhs->vm_flags != rhs->vm_flags){
		return NULL;
	}
	else if(lhs->vm_src != NULL || rhs->vm_src != NULL){
		return NULL;
	}

	lhs->vm_end = rhs->vm_end;
	remove_vma(task, rhs);
	
	return lhs;
}

/* Given a task and a VMA, this function attempts to merge the given VMA with
 * the previous and the next VMA. Returns the merged VMA or the original VMA if
 * the VMAs could not be merged.
 */
struct vma *merge_vmas(struct task *task, struct vma *vma)
{
	#ifndef USE_BIG_KERNEL_LOCK
	spin_lock(&task->task_lock);
	#endif

	struct list *previous = list_prev(&task->task_mmap, &vma->vm_mmap);
	struct vma *previous_vma = (previous)? container_of(previous, struct vma, vm_mmap) : NULL;

	if(previous_vma){
		struct vma *merged_vma = merge_vma(task, previous_vma, vma);

		if(merged_vma){
			vma = merged_vma;
		}
	}
	struct list *next = list_next(&task->task_mmap, &vma->vm_mmap);
	struct vma *next_vma = (next)? container_of(next, struct vma, vm_mmap) : NULL;

	if(next_vma){
		struct vma *merged_vma = merge_vma(task, vma, next_vma);

		if(merged_vma){
			vma = merged_vma;
		}
	}
	#ifndef USE_BIG_KERNEL_LOCK
	spin_unlock(&task->task_lock);
	#endif
	return vma;
}

