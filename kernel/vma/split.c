#include <task.h>
#include <vma.h>

#include <kernel/vma.h>
#include <assert.h>
#include <kernel/mem/kmem.h>

/* Given a task and a VMA, this function splits the VMA at the given address
 * by setting the end address of original VMA to the given address and by
 * adding a new VMA with the given address as base.
 */
struct vma *split_vma(struct task *task, struct vma *lhs, void *addr)
{

	assert(page_aligned((uintptr_t) addr));
	if(addr >= lhs->vm_end || addr <= lhs->vm_base){
		return lhs;
	}
	
	size_t new_lhs_size = addr - lhs->vm_base;
	size_t new_rhs_size = lhs->vm_end - addr;

	assert(new_lhs_size + new_rhs_size == (lhs->vm_end - lhs->vm_base));

	struct vma *new_vma = kmalloc(sizeof(struct vma));

	if(!new_vma)panic("Failed to kmalloc a vma");

	new_vma->vm_base = addr;
	new_vma->vm_end = lhs->vm_end;
	new_vma->vm_len = (lhs->vm_len > new_lhs_size)? lhs->vm_len - new_lhs_size : 0;
	new_vma->vm_name = lhs->vm_name;
	new_vma->vm_flags = lhs->vm_flags;
	new_vma->vm_src = (new_vma->vm_len)? lhs->vm_src + new_lhs_size : NULL;
	new_vma->src_offset = 0;
	
	list_init(&new_vma->vm_mmap);
	rb_node_init(&new_vma->vm_rb);
	lhs->vm_end = addr;
	int ret = insert_vma(task, new_vma);

	if(ret < 0){
		kfree(new_vma);
		return NULL;
	}
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
	struct vma *rhs = split_vma(task, vma, base);

	if(!rhs){
		rhs = vma;
	}
	split_vma(task, rhs, base + size);
	return rhs;
}

