#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Checks the flags in udata against the flags of the VMA to check appropriate
 * permissions. If the permissions are all right, this function populates the
 * address range [base, base + size) with physical pages. If the VMA is backed
 * by an executable, the data is copied over. Then the protection of the
 * physical pages is adjusted to match the permissions of the VMA.
 */
int do_populate_vma(struct task *task, void *base, size_t size,
	struct vma *vma, void *udata)
{
	assert(size <= PAGE_SIZE);
	/* LAB 4: your code here. */
	//should we have check that cheks if base + size fits in this vma?

	//what happens if the next vma doesnt have the correct flags?
	//is hthe linked list we go over sorted by base addr?
	//yes?
	//so then this should fail if the flags dont match as we cant do the virutal contigous mapping!
	if(vma->vm_flags != *((int*)udata)) return -1;
	struct page_info* page;
	uint64_t flags = PAGE_PRESENT | PAGE_USER;
	if(vma->vm_flags & VM_WRITE) flags |= PAGE_WRITE;
	if(!(vma->vm_flags & VM_EXEC)) flags |= PAGE_NO_EXEC;
	
	populate_region(task->task_pml4, base, size, flags);

	if(vma->vm_src){		
		void * write_pos = MAX(vma->vm_base + vma->src_offset, base);
		void *read_pos = vma->vm_src + (base - vma->vm_base);

		if(base != vma->vm_base){
			read_pos -= vma->src_offset;
		}
		size_t remaining_in_file = vma->vm_len + (size_t)vma->vm_src - (uintptr_t)read_pos;
		size_t write_space = PAGE_SIZE - ((uintptr_t)write_pos % PAGE_SIZE);
		size_t size = MIN(write_space, remaining_in_file);

		memcpy(write_pos, read_pos, size);
	}
	assert(page_lookup(task->task_pml4, base, NULL));

	return 0;
}

/* Populates the VMAs for the given address range [base, base + size) by
 * backing the VMAs with physical pages.
 */
int populate_vma_range(struct task *task, void *base, size_t size, int flags)
{
	return walk_vma_range(task, base, size, do_populate_vma, &flags);
}

