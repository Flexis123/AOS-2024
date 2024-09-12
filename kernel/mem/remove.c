#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

struct remove_info {
	struct page_table *pml4;
	void *va;
};

static void remove_page(physaddr_t *entry, struct remove_info *info){
	struct page_info *page = pa2page(PAGE_ADDR(*entry));
	page_decref(page);
	cprintf("page struct addr %p\n", page);

	// only unmap when ref count is zero because 2 va's can point to the same page!
	*entry = 0;
	tlb_invalidate(info->pml4, info->va); //but invalidate tlb as virtual adress points to nothing now!
}

/* Removes the page if present by decrement the reference count, clearing the
 * PTE and invalidating the TLB.
 */
static int remove_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct remove_info *info = walker->udata;
	if(*entry & PAGE_PRESENT)remove_page(entry, info);
	return 0;
}

/* Removes the page if present and if it is a huge page by decrementing the
 * reference count, clearing the PDE and invalidating the TLB.
 */
static int remove_pde(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct remove_info *info = walker->udata;

	if((*entry & PAGE_PRESENT) && (*entry & PAGE_HUGE)) remove_page(entry, info);
	return 0;
}

/* Unmaps the range of pages from [va, va + size). */
void unmap_page_range(struct page_table *pml4, void *va, size_t size)
{
	/* LAB 2: your code here. */
	struct remove_info info = {
		.pml4 = pml4,
		.va = va
	};
	struct page_walker walker = {
		.pte_callback = remove_pte,
		.pde_callback = remove_pde,
		.pde_unmap = remove_pte,
		.pdpte_unmap = remove_pte,
		.pml4e_unmap = remove_pte,
		.udata = &info,
	};

	walk_page_range(pml4, va, va + size, &walker);
}

/* Unmaps all user pages. */
void unmap_user_pages(struct page_table *pml4)
{
	unmap_page_range(pml4, 0, USER_LIM);
}

/* Unmaps the physical page at the virtual address va. */
void page_remove(struct page_table *pml4, void *va)
{
	unmap_page_range(pml4, va, PAGE_SIZE);
}
