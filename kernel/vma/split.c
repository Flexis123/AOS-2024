#include <task.h>
#include <vma.h>

#include <kernel/vma.h>
#include <assert.h>

/* Given a task and a VMA, this function splits the VMA at the given address
 * by setting the end address of original VMA to the given address and by
 * adding a new VMA with the given address as base.
 */
struct vma *split_vma(struct task *task, struct vma *lhs, void *addr)
{
	assert(!task || !lhs);

	if(addr >= lhs->vm_end || addr < lhs->vm_base){
		return NULL;
	}
	
	size_t new_lhs_size = addr - lhs->vm_base;
	size_t new_rhs_size = lhs->vm_end - addr;

	struct vma* new_vma = NULL;

	if(lhs->vm_src){
		new_vma = add_executable_vma(task, lhs->vm_name, addr, new_rhs_size, lhs->vm_flags, lhs->vm_src + new_lhs_size, lhs->vm_len - new_lhs_size);
	}
	else{
		new_vma = add_anonymous_vma(task, lhs->vm_name, addr, new_rhs_size, lhs->vm_flags);
	}
	
	lhs->vm_end = addr;
	
	return new_vma;
}

/* Given a task and a VMA, this function first splits the VMA into a left-hand
 * and right-hand side at address base. Then this function splits the
 * right-hand side or the original VMA, if no split happened, into a left-hand
 * and a right-hand side. This function finally returns the right-hand side of
 * the first split or the original VMA.
 */
struct vma *split_vmas(struct task *task, struct vma *vma, void *base, size_t size)
{
	struct vma *mid_and_rhs = split_vma(task, vma, base);

	if(mid_and_rhs){
		split_vma(task, mid_and_rhs, mid_and_rhs->vm_base + size);
	}
	return (mid_and_rhs)? mid_and_rhs : vma;
}

