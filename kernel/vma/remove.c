#include <task.h>
#include <vma.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Removes the given VMA from the given task. */
void remove_vma(struct task *task, struct vma *vma)
{
	if (!task || !vma) {
		return;
	}

	rb_remove(&task->task_rb, &vma->vm_rb);
	rb_node_init(&vma->vm_rb);
	list_del(&vma->vm_mmap);
}

/* Frees all the VMAs for the given task. */
void free_vmas(struct task *task)
{
	remove_vma_range(task, 0, KERNEL_LIM);
}

/* Splits the VMA into the address range [base, base + size) and removes the
 * resulting VMA and any physical pages that back the VMA.
 */
int do_remove_vma(struct task *task, void *base, size_t size, struct vma *vma,
	void *udata)
{
	//checl at if we are at the first or last vma
	//if we are at the first vma we split at base
	//if we are at the last vma we split at base + size
	//else we split at vma->vm_base which should not split the vma!

	void* global_end = base + size;
	void* curr_base = MAX(base, vma->vm_base);
	void* curr_end = MIN(global_end, vma->vm_end);

	void* split_addr;
	if(curr_end == global_end) split_addr = global_end;
	else split_addr = curr_base;

	//struct vma* new_vma = split_vma(task, vma, split_addr);
	remove_vma(task, vma);
	unmap_page_range(task->task_pml4, curr_base, vma->vm_len); //remove only mapped pages, so that is from [curr_base, vma->vm_len)

	kfree(vma);
	return 0;
}

/* Removes the VMAs and any physical pages backing those VMAs for the given
 * address range [base, base + size).
 */
int remove_vma_range(struct task *task, void *base, size_t size)
{
	return walk_vma_range(task, base, size, do_remove_vma, NULL);
}

/* Removes any non-dirty physical pages for the given address range
 * [base, base + size) within the VMA.
 */
int do_unmap_vma(struct task *task, void *base, size_t size, struct vma *vma,
	void *udata)
{
	/* LAB 4: your code here. */
	//TODO probably also flush tlb
	return 0;
}

/* Removes any non-dirty physical pages within the address range
 * [base, base + size).
 */
int unmap_vma_range(struct task *task, void *base, size_t size)
{
	return walk_vma_range(task, base, size, do_unmap_vma, NULL);
}

