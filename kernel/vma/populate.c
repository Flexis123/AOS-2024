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
	uint64_t flags;

	vma->vm_len = 0; //can the vma be fragmnted?
	for(void* va = vma->vm_base; va < MIN(base + size, vma->vm_end); va += PAGE_SIZE, vma->vm_len += PAGE_SIZE){
		if(!(page = page_alloc(ALLOC_ZERO))){
			panic("OOM: cannot populate vma with physical pages");
		}

		flags = 0;
		if(vma->vm_flags & VM_WRITE) flags |= PAGE_WRITE;
		if(!(vma->vm_flags & VM_EXEC)) flags |= PAGE_NO_EXEC;

		if(page_insert(task->task_pml4, page, va, flags | PAGE_PRESENT | PAGE_USER) < 0){
			panic("Problem with mapping physical page to virtual page for VMA");
		}

		if(vma->vm_src) memcpy(base, vma->vm_src + vma->vm_len, PAGE_SIZE);
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

