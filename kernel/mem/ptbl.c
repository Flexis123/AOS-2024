#include <types.h>
#include <string.h>
#include <paging.h>

#include <kernel/mem.h>

extern struct list buddy_free_list[BUDDY_MAX_ORDER];

/* Allocates a page table if none is present for the given entry.
 * If there is already something present in the PTE, then this function simply
 * returns. Otherwise, this function allocates a page using page_alloc(),
 * increments the reference count and stores the newly allocated page table
 * with the PAGE_PRESENT | PAGE_WRITE | PAGE_USER permissions.
 */
int ptbl_alloc(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	if(*entry & PAGE_PRESENT) return 0;
	struct page_info *new_table = page_alloc(ALLOC_ZERO);

	if(new_table == NULL){
		panic("unable to alloc new page");
		return -1;
	}
	
	new_table->pp_ref++;
	physaddr_t table_addr = page2pa(new_table);
	*entry = table_addr | PAGE_PRESENT | PAGE_WRITE | PAGE_USER;
	return 0;
}

/* Splits up a huge page by allocating a new page table and setting up the huge
 * page into smaller pages that consecutively make up the huge page.
 *
 * If no huge page was mapped at the entry, simply allocate a page table.
 *
 * Otherwise if a huge page is present, allocate a new page, increment the
 * reference count and have the PDE point to the newly allocated page. This
 * page is used as the page table. Then allocate a normal page for each entry,
 * copy over the data from the huge page and set each PDE.
 *
 * Hint: the only user of this function is boot_map_region(). Otherwise the 2M
 * physical page has to be split down into its individual 4K pages by updating
 * the respective struct page_info structs.
 *
 * Hint: this function calls ptbl_alloc(), page_alloc(), page2pa() and
 * page2kva().
 */



int ptbl_split(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{

	if((*entry & PAGE_PRESENT) == 0){	
		return ptbl_alloc(entry, base, end, walker);
	}
	if((*entry & PAGE_HUGE) == 0){
		return 0;
	}
	struct page_info *new_table = page_alloc(ALLOC_ZERO);

	if(new_table == NULL){
		panic("unable to alloc new page");
		return -1;
	}
	
	new_table->pp_ref++;
	physaddr_t *new_table_entries = page2kva(new_table);
	void *old_data = KADDR(PAGE_ADDR(*entry));

	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
		struct page_info *new_page = page_alloc(ALLOC_ZERO);

		if(new_page == NULL){
			return -1;
		}
		new_table_entries[i] = page2pa(new_page) | ((*entry & PAGE_MASK) & ~PAGE_HUGE);
		memcpy(page2kva(new_page), old_data + i * PAGE_SIZE, PAGE_SIZE);
		new_page->pp_ref++;
	}
	page_decref(pa2page(PAGE_ADDR(*entry)));
	*entry = page2pa(new_table) | PAGE_TABLE_ENTRY_PERMS;
  
	return 0;
}

/* Attempts to merge all consecutive pages in a page table into a huge page.
 *
 * First checks if the PDE points to a huge page. If the PDE points to a huge
 * page there is nothing to do. Otherwise the PDE points to a page table.
 * Then this function checks all entries in the page table to check if they
 * point to present pages and share the same flags. If not all pages are
 * present or if not all flags are the same, this function simply returns.
 * At this point the pages can be merged into a huge page. This function now
 * allocates a huge page and copies over the data from the consecutive pages
 * over to the huge page.
 * Finally, it sets the PDE to point to the huge page with the flags shared
 * between the previous pages.
 *
 * Hint: don't forget to free the page table and the previously used pages.
 */
int ptbl_merge(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	if(*entry & PAGE_HUGE){
		return 0;
	}
	struct page_table *table = KADDR(PAGE_ADDR(*entry));
	physaddr_t flags = table->entries[0] & PAGE_MASK;

	if(!(flags & PAGE_PRESENT)) return 0;

	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
		if((table->entries[i] & PAGE_MASK) != flags){
			 return 0;
		}
	}
	struct page_info *huge_page = page_alloc(ALLOC_HUGE);
	huge_page->pp_ref++;
	if(!huge_page) {
		return -1;
	}
	void* huge_page_addr = page2kva(huge_page);

	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
		struct page_info *entry_page = pa2page(PAGE_ADDR(table->entries[i]));
		memcpy(huge_page_addr + i * PAGE_SIZE, page2kva(entry_page), PAGE_SIZE);
		page_decref(entry_page);
	}
	page_decref(pa2page(PAGE_ADDR(*entry)));
	*entry = page2pa(huge_page) | flags | PAGE_HUGE;
	return 0;
}

/* Frees up the page table by checking if all entries are clear. Returns if no
 * page table is present. Otherwise this function checks every entry in the
 * page table and frees the page table if no entry is set.
 *
 * Hint: this function calls pa2page(), page2kva() and page_free().
 */
int ptbl_free(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	if((*entry & PAGE_PRESENT) == 0) return 0;
	physaddr_t table = PAGE_ADDR(*entry);

	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
		physaddr_t table_entry = table + i;
		
		if(table_entry & PAGE_PRESENT) return 0;
	}
	struct page_info *table_page = pa2page(table);
	page_decref(table_page);
	return 0;
}
