#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Changes the protection flags of the given VMA. Does nothing if the flags
 * would remain the same. Splits up the VMA into the address range
 * [base, base + size) and changes the protection of the physical pages backing
 * the VMA. Then attempts to merge the VMAs in case the protection became the
 * same as that of any of the adjacent VMAs.
 */
int do_protect_vma(struct task *task, void *base, size_t size, struct vma *vma,
	void *udata)
{
	int flags = *((int*) udata);

	if(vma->vm_flags == flags) return 0;

	//flags are different so we have to split vma!
	void* actual_base = MAX(vma->vm_base, base);
	void* actual_end = MIN(vma->vm_end, base + size);
	
	struct vma* new_vma = split_vmas(task, vma, actual_base, (size_t)(actual_end - actual_base));
	if(!new_vma) return -1;

	uint64_t pflags = PAGE_PRESENT | PAGE_USER;
	if(flags & VM_WRITE) pflags |= PAGE_WRITE;
	if(!(flags & VM_EXEC)) pflags |= PAGE_NO_EXEC;

	new_vma->vm_flags = flags;

	protect_region(task->task_pml4, new_vma->vm_base, (size_t)(actual_end - actual_base), pflags);
	merge_vmas(task, vma);
	return 0;
}

/* Changes the protection flags of the VMAs for the given address range
 * [base, base + size).
 */
int protect_vma_range(struct task *task, void *base, size_t size, int flags)
{
	return walk_vma_range(task, base, size, do_protect_vma, &flags);
}
