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
	
	void* actual_base = MAX(vma->vm_base, base);
	void* actual_end = MIN(vma->vm_end, base + size);
	size_t actual_size = actual_end - actual_base;


	populate_region(task->task_pml4, actual_base, actual_size, flags);

	cprintf("actual size %lu\n", actual_size);
	if(vma->vm_src){	
		void * write_pos = MAX(vma->vm_base + vma->src_offset, actual_base);
		void *read_pos = vma->vm_src + (actual_base - vma->vm_base);

		if(actual_base != vma->vm_base){
			read_pos -= vma->src_offset;
		}else{
			actual_size -= vma->src_offset;
		}
		size_t remaining_in_file = vma->vm_len + (size_t)vma->vm_src - (uintptr_t)read_pos;
		memcpy(write_pos, read_pos, MIN(actual_size, remaining_in_file));
	}
	return 0;
}

/* Populates the VMAs for the given address range [base, base + size) by
 * backing the VMAs with physical pages.
 */
int populate_vma_range(struct task *task, void *base, size_t size, int flags)
{
	return walk_vma_range(task, base, size, do_populate_vma, &flags);
}

