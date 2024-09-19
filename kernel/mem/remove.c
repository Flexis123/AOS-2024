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
	*entry = 0;
	tlb_invalidate(info->pml4, info->va);
}

/* Removes the page if present by decrement the reference count, clearing the
 * PTE and invalidating the TLB.
 */
static int remove_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct remove_info *info = walker->udata;
	if(*entry & PAGE_PRESENT){
		remove_page(entry, info);
		*entry = 0;
	}
	return 0;
}

/* Removes the page if present and if it is a huge page by decrementing the
 * reference count, clearing the PDE and invalidating the TLB.
 */
static int remove_pde(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct remove_info *info = walker->udata;

	if((*entry & PAGE_PRESENT) && (*entry & PAGE_HUGE)){

		if((end - base) + 1 >= HPAGE_SIZE){
			
			struct page_info *page = pa2page(PAGE_ADDR(*entry));
			remove_page(entry, info);
			return 0;
		}
		else{
			return ptbl_split(entry, base, end, walker);
		}
	}
	return 0;
}

static int remove_table(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	if(!(*entry & PAGE_PRESENT)){
		return 0;
	}

	struct page_info* page = pa2page(PAGE_ADDR(*entry));
	struct page_table* table = page2kva(page);

	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
		
		if(table->entries[i] != 0){
			return 0;
		}
	}
	*entry = 0;
	page_decref(page);
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
		.pde_unmap = ptbl_free,
		.pdpte_unmap = ptbl_free,
		.pml4e_unmap = ptbl_free,
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
	struct page_info *page = page_lookup(pml4, va, NULL);

	if(!page){
		panic("no page for this va\n");
		return;
	}
	if(page->pp_order == BUDDY_4K_PAGE){
		unmap_page_range(pml4, va, PAGE_SIZE);
	}
	if(page->pp_order == BUDDY_2M_PAGE){
		unmap_page_range(pml4, va, HPAGE_SIZE);
	}	
}
