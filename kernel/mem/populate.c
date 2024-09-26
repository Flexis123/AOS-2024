#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

struct populate_info {
	uint64_t flags;
	uintptr_t base, end;
};

static int populate_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct page_info *page;
	struct populate_info *info = walker->udata;
	page = page_alloc(ALLOC_ZERO);

	if(!page)return -1;
	page->pp_ref++;
	//cprintf("populate va: %p, flags: %p\n", base, info->flags);
	*entry = page2pa(page) | info->flags;
	return 0;
}

static int populate_pde(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct page_info *page;
	struct populate_info *info = walker->udata;

	if(hpage_aligned(base) && (end - base) + 1 >= HPAGE_SIZE){
		page = page_alloc(ALLOC_HUGE);
		if(!page)return -1;
		page->pp_ref++;
		//cprintf("populate huge page: %p, flags: %p\n", base, info->flags);
		*entry = page2pa(page) | info->flags | PAGE_HUGE;
		return 0;
	}
	if(*entry & PAGE_PRESENT){
		return 0;
	}
	return ptbl_alloc(entry, base, end, walker);
}

/* Populates the region [va, va + size) with pages by allocating pages from the
 * frame allocator and mapping them.
 */
void populate_region(struct page_table *pml4, void *va, size_t size,
	uint64_t flags)
{
	/* LAB 3: your code here. */
	struct populate_info info = {
		.flags = flags,
		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
	};
	struct page_walker walker = {
		.pte_callback = populate_pte,
		.pde_callback = populate_pde,
		.pdpte_callback = ptbl_alloc,
		.pml4e_callback = ptbl_alloc,
		.udata = &info,
	};
	//cprintf("populate va from: %p to %p with flags: %p\n", info.base, info.end, info.flags);
	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
}