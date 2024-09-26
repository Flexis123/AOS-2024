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

	assert((uintptr_t)addr % PAGE_SIZE == 0);
	if(addr >= lhs->vm_end || addr <= lhs->vm_base){
		return NULL;
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
	cprintf("split vmas, vma is %p\n", vma);


	if(vma->vm_end - vma->vm_base == size){
		return vma;
	}
	if(vma->vm_base == base){
		split_vma(task, vma, base + size);
		return vma;
	}
	struct vma *mid_and_rhs = split_vma(task, vma, base);

	if(!mid_and_rhs){
		return vma;
	}
	if(mid_and_rhs->vm_end - mid_and_rhs->vm_base == size){
		return mid_and_rhs;
	}
	split_vma(task, mid_and_rhs, base + size);
	return mid_and_rhs;
}

