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
	if(!vma) return 0;

	void* actual_base = MAX(vma->vm_base, base);
	void* actual_end = MIN(vma->vm_end, base + size);

	struct vma* new_vma = split_vmas(task, vma, actual_base, (size_t)(actual_end - actual_base));

	if(actual_end == base + size && actual_base != base) new_vma = container_of(list_prev(&task->task_mmap, &new_vma->vm_mmap), struct vma, vm_mmap);
	
	remove_vma(task, new_vma);
	
	unmap_page_range(task->task_pml4, actual_base, (size_t) (actual_end - actual_base));
	
	kfree(new_vma);

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
	if(!vma) return 0;

	void* actual_base = MAX(vma->vm_base, base);
	void* actual_end = MIN(vma->vm_end, base + size);
	
	unmap_page_range_non_dirty(task->task_pml4, actual_base, (size_t) (actual_end - actual_base));

	return 0;
}

/* Removes any non-dirty physical pages within the address range
 * [base, base + size).
 */
int unmap_vma_range(struct task *task, void *base, size_t size)
{
	return walk_vma_range(task, base, size, do_unmap_vma, NULL);
}

