#include <task.h>
#include <vma.h>

#include <kernel/vma.h>

/* Given a task and two VMAs, checks if the VMAs are adjacent and compatible
 * for merging. If they are, then the VMAs are merged by removing the
 * right-hand side and extending the left-hand side by setting the end address
 * of the left-hand side to the end address of the right-hand side.
 */
struct vma *merge_vma(struct task *task, struct vma *lhs, struct vma *rhs)
{
	if(!lhs || !rhs || !task){
		return NULL;
	}
	if(lhs->vm_end != rhs->vm_base -1){
		return NULL;
	}
	if(lhs->vm_flags != rhs->vm_flags){
		return NULL;
	}
	if(lhs->vm_src != NULL && lhs->vm_src + lhs->vm_len != rhs->vm_src){
		return NULL;
	}
	if(lhs->vm_len < rhs->vm_end - lhs->vm_base){
		return NULL;
	}
	void* new_end = rhs->vm_end;
	remove_vma(task, rhs);
	lhs->vm_end = new_end;
	return lhs;
}

/* Given a task and a VMA, this function attempts to merge the given VMA with
 * the previous and the next VMA. Returns the merged VMA or the original VMA if
 * the VMAs could not be merged.
 */
struct vma *merge_vmas(struct task *task, struct vma *vma)
{
	if(vma->vm_base > 0){
		struct vma *previous = task_find_vma(task, vma->vm_base -1);
		if(previous){
			struct vma *merged_vma = merge_vma(task, previous, vma);

			if(merged_vma){
				vma = merged_vma;
			}
		}
	}
	if(vma->vm_end < KERNEL_LIM){
		struct vma *next = task_find_vma(task, vma->vm_base +1);
		if(next){
			struct vma *merged_vma = merge_vma(task, vma, next);

			if(merged_vma){
				vma = merged_vma;
			}
		}
	}
	return vma;
}

