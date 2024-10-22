#include <types.h>
#include <list.h>
#include <paging.h>
#include <spinlock.h>
#include <string.h>

#include <kernel/mem.h>

/* Physical page metadata. */
size_t npages;
struct page_info *pages;

#define BONUS_LAB1

/*
 * List of free buddy chunks (often also referred to as buddy pages or simply
 * pages). Each order has a list containing all free buddy chunks of the
 * specific buddy order. Buddy orders go from 0 to BUDDY_MAX_ORDER - 1
 */
struct list buddy_free_list[BUDDY_MAX_ORDER];

#ifndef USE_BIG_KERNEL_LOCK
/* Lock for the buddy allocator. */
struct spinlock buddy_lock = {
#ifdef DEBUG_SPINLOCK
	.name = "buddy_lock",
#endif
};
#endif

/* Counts the number of free pages for the given order.
 */
size_t count_free_pages(size_t order)
{
	struct list *node;
	size_t nfree_pages = 0;

	if (order >= BUDDY_MAX_ORDER) {
		return 0;
	}

	list_foreach(buddy_free_list + order, node) {
		++nfree_pages;
	}

	return nfree_pages;
}

/* Shows the number of free pages in the buddy allocator as well as the amount
 * of free memory in kiB.
 *
 * Use this function to diagnose your buddy allocator.
 */
void show_buddy_info(void)
{
	struct page_info *page;
	struct list *node;
	size_t order;
	size_t nfree_pages;
	size_t nfree = 0;

	cprintf("Buddy allocator:\n");

	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
		nfree_pages = count_free_pages(order);

		cprintf("  order #%u pages=%u\n", order, nfree_pages);

		nfree += nfree_pages * (1 << (order + 12));
	}

	cprintf("  free: %u kiB\n", nfree / 1024);
}

/* Gets the total amount of free pages. */
size_t count_total_free_pages(void)
{
	struct page_info *page;
	struct list *node;
	size_t order;
	size_t nfree_pages;
	size_t nfree = 0;

	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
		nfree_pages = count_free_pages(order);
		nfree += nfree_pages * (1 << order);
	}

	return nfree;
}

/* Splits lhs into free pages until the order of the page is the requested
 * order req_order.
 *
 * The algorithm to split pages is as follows:
 *  - Given the page of order k, locate the page and its buddy at order k - 1.
 *  - Decrement the order of both the page and its buddy.
 *  - Mark the buddy page as free and add it to the free list.
 *  - Repeat until the page is of the requested order.
 *
 * Returns a page of the requested order.
 */
struct page_info *buddy_split(struct page_info *lhs, size_t req_order)
{
	//get page adress
	//flip order bit to get buddy
	assert(lhs->pp_order >= req_order);
	
	while(lhs->pp_order > req_order){
		physaddr_t page_addr = page2pa(lhs);
		physaddr_t buddy_addr = page_addr ^ (1 << (lhs->pp_order + PAGE_TABLE_SHIFT - 1));
		struct page_info *buddy = pa2page(buddy_addr);
		buddy->pp_order = lhs->pp_order - 1;
		buddy->pp_free = true;

		lhs->pp_order--;
#ifdef BONUS_LAB1
		struct list* entry;
		list_foreach(&buddy_free_list[lhs->pp_order], entry){
			assert(entry != &lhs->pp_node);
		}
#endif

		list_insert_before(&buddy_free_list[lhs->pp_order], &buddy->pp_node);
	}
	
	return lhs;
}

/* Merges the buddy of the page with the page if the buddy is free to form
 * larger and larger free pages until either the maximum order is reached or
 * no free buddy is found.
 *
 * The algorithm to merge pages is as follows:
 *  - Given the page of order k, locate the page with the lowest address
 *    and its buddy of order k.
 *  - Check if both the page and the buddy are free and whether the order
 *    matches.
 *  - Remove the page and its buddy from the free list.
 *  - Increment the order of the page.
 *  - Repeat until the maximum order has been reached or until the buddy is not
 *    free.
 *
 * Returns the largest merged free page possible.
 */
struct page_info *buddy_merge(struct page_info *page)
{
	unsigned int order = page->pp_order;

	while(order < BUDDY_MAX_ORDER - 1){
		physaddr_t page_addr = page2pa(page);
		physaddr_t buddy_addr = page_addr ^ (1 << (order + PAGE_TABLE_SHIFT));
		struct page_info *buddy = pa2page(buddy_addr);

		if(!buddy->pp_free || (buddy->pp_order != page->pp_order)){
			break;
		}
		physaddr_t merged_page_addr = page_addr & ~(1 << (order + PAGE_TABLE_SHIFT));
		struct page_info *merged_page = pa2page(merged_page_addr);
		struct list *next = NULL;
		struct list* entry = &page->pp_node;
		page->pp_free = false;
		buddy->pp_free = false;

		int entries_removed = 0;
		list_foreach_safe(&buddy_free_list[order], entry, next){
			
			if(entry == &page->pp_node || entry == &buddy->pp_node){
				list_del(entry);
				entries_removed++;

				if(entries_removed == 2){
					break;
				}
			}	
		}
		assert(entries_removed == 2);
		order++;
		merged_page->pp_order = order;
#ifdef BONUS_LAB1
		list_foreach(&buddy_free_list[order], entry){
			assert(entry != &merged_page->pp_node);
		}
#endif
		list_insert_before(&buddy_free_list[order], &merged_page->pp_node);
		merged_page->pp_free = true;
		page = merged_page;
	}
	return page;
}

/* Given the order req_order, attempts to find a page of that order or a larger
 * order in the free list. In case the order of the free page is larger than the
 * requested order, the page is split down to the requested order using
 * buddy_split().
 *
 * Returns a page of the requested order or NULL if no such page can be found.
 */
struct page_info *buddy_find(size_t req_order)
{	
	struct list* head;
	struct page_info* page;
	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
		head = &buddy_free_list[ord];

		if(!list_is_empty(head)) {
			page = container_of(head->next, struct page_info, pp_node);
			assert(page->pp_order == ord);
			page = buddy_split(page, req_order);
			list_del(&page->pp_node);

			page->pp_free = false;
			return page;
		}
	}
	return NULL;
}

/*
 * Allocates a physical page.
 *
 * if (alloc_flags & ALLOC_ZERO), fills the entire returned physical page with
 * '\0' bytes.
 * if (alloc_flags & ALLOC_HUGE), returns a huge physical 2M page.
 *
 * Beware: this function does NOT increment the reference count of the page -
 * this is the caller's responsibility.
 *
 * Returns NULL if out of free memory.
 *
 * Hint: use buddy_find() to find a free page of the right order.
 * Hint: use page2kva() and memset() to clear the page.
 */
struct page_info *page_alloc(int alloc_flags)
{
	BUDDY_LOCK;
	struct page_info* page;


	if (alloc_flags & ALLOC_HUGE) page = buddy_find(BUDDY_2M_PAGE);
	else page = buddy_find(0);

	//check for OOM
	if(page) {
		if(alloc_flags & ALLOC_ZERO) {
			memset(page2kva(page), 0, 1 << (page->pp_order + PAGE_TABLE_SHIFT));
		}
	}
	assert(page != NULL);
	BUDDY_UNLOCK;
	return page;
}

/*
 * Return a page to the free list.
 * (This function should only be called when pp->pp_ref reaches 0.)
 *
 * Hint: mark the page as free and use buddy_merge() to merge the free page
 * with its buddies before returning the page to the free list.
 */
void page_free(struct page_info *pp)
{
	if(pp->pp_ref != 0){
		panic("page_free called on page that is still in use");
	}
#ifdef BONUS_LAB1
	if(pp->pp_free){
		panic("page_free called on page that is already freed");
	}
	struct list *entry;

	//list_foreach(&buddy_free_list[pp->pp_order], entry){
	//	assert(entry != &pp->pp_node);
	//}

	physaddr_t page_addr = page2pa(pp);
	if(page_addr == 0){
		panic("page_free called on reserved page");
	}
#endif
	pp->pp_free = true;

	list_insert_before(&buddy_free_list[pp->pp_order], &pp->pp_node);
	
	buddy_merge(pp);
}

/*
 * Decrement the reference count on a page,
 * freeing it if there are no more refs.
 */
void page_decref(struct page_info *pp)
{
	BUDDY_LOCK;

	if (--pp->pp_ref == 0) {
		page_free(pp);
	}
	BUDDY_UNLOCK;
}

static int in_page_range(void *p)
{
	return ((uintptr_t)pages <= (uintptr_t)p &&
	        (uintptr_t)p < (uintptr_t)(pages + npages));
}

static void *update_ptr(void *p)
{
	if (!in_page_range(p))
		return p;

	return (void *)((uintptr_t)p + KPAGES - (uintptr_t)pages);
}


//relocates next and previous pointers for free lst
void buddy_migrate(void)
{
	struct page_info *page;
	struct list *node;
	size_t i;

	for (i = 0; i < npages; ++i) {
		page = pages + i;
		node = &page->pp_node;

		node->next = update_ptr(node->next);
		node->prev = update_ptr(node->prev);
	}

	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
		node = buddy_free_list + i;

		node->next = update_ptr(node->next);
		node->prev = update_ptr(node->prev);
	}

	pages = (struct page_info *)KPAGES;
}

int buddy_map_chunk(struct page_table *pml4, size_t index)
{
	struct page_info *page, *base;
	void *end;
	size_t nblocks = (1 << (12 + BUDDY_MAX_ORDER - 1)) / PAGE_SIZE;
	size_t nalloc = ROUNDUP(nblocks * sizeof *page, PAGE_SIZE) / PAGE_SIZE;
	size_t i;

	index = ROUNDDOWN(index, nblocks);
	base = pages + index;

	for (i = 0; i < nalloc; ++i) {
		page = page_alloc(ALLOC_ZERO);

		if (!page) {
			return -1;
		}

		++page->pp_ref;

		if (page_insert(pml4, page, (char *)base + i * PAGE_SIZE,
		    PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC) < 0) {
			return -1;
		}
	}

	for (i = 0; i < nblocks; ++i) {
		page = base + i;
		list_init(&page->pp_node);
		list_init(&page->pp_lru_node);
		reverse_mapping_init(&page->pp_reverse_map);
	}
	npages = index + nblocks;

	return 0;
}

void setzero(void *setzero_info){
	assert(setzero_info);
	struct setzero_info *info = (struct setzero_info*)setzero_info;

	for(size_t i = 0; i < SETZERO_PAGES_PER_RUN; i++){
		struct page_info *page = &pages[info->current_page];
		BUDDY_LOCK;
		if(!page->pp_free){
			

			if(page->pp_order > 0){
				i += (1 << page->pp_order) -1;
			}
			BUDDY_UNLOCK;
			info->current_page++;
			info->current_page %= npages;
			continue;
		}
		memset(page2kva(page), 0, PAGE_SIZE);
		BUDDY_UNLOCK;
		info->current_page++;
		info->current_page %= npages;
	}
}
