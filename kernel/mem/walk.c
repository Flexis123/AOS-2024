#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

#define BREAK_ON_ERR_WCALLBACK(guard, ret)  if(guard && ret < 0) return ret;
#define WALK_RANGE(ptbl, base, end, walker, nextWalkFn, ptblName) \
	__walk_range(ptbl, base, end, walker->##ptblName##e_callback, walker->##ptblName##e_unmap, nextWalkFn, ptblName##_index, ptblName##_end , walker)

//TODO check order of arguments


/* Given an address addr, this function returns the sign extended address. */
static uintptr_t sign_extend(uintptr_t addr)
{
	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
}

/* Given an addresss addr, this function returns the page boundary. */
static uintptr_t pt_end(uintptr_t addr)
{
	return addr | (PAGE_SIZE - 1);
}

/* Given an address addr, this function returns the page table boundary. */
static uintptr_t pdir_end(uintptr_t addr)
{
	return addr | (PAGE_TABLE_SPAN - 1);
}

/* Given an address addr, this function returns the page directory boundary. */
static uintptr_t pdpt_end(uintptr_t addr)
{
	return addr | (PAGE_DIR_SPAN - 1);
}

/* Given an address addr, this function returns the PDPT boundary. */
static uintptr_t pml4_end(uintptr_t addr)
{
	return addr | (PDPT_SPAN - 1);
}

static int __walk_range(struct page_table *ptbl, uintptr_t base, uintptr_t end, map_pte_t ptbl_callback, map_pte_t ptbl_unmap, 
	walkfn_t walkfn, int (*ptbl_index)(uintptr_t), uintptr_t (*ptbl_end)(uintptr_t), struct page_walker *walker){

	physaddr_t* entry;
	uintptr_t page_entry_base = sign_extend(base);
	uintptr_t page_entry_end = sign_extend(ptbl_end(base));

	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
		entry = ptbl->entries + i;

		bool isPresent = *entry & PAGE_PRESENT;
		BREAK_ON_ERR_WCALLBACK(ptbl_callback, ptbl_callback(entry, page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))

		page_entry_base = sign_extend(page_entry_end + 1);
		page_entry_end = sign_extend(ptbl_end(page_entry_base));
	}

	
	return 0;
}

/* Walks over the page range from base to end iterating over the entries in the
 * given page table ptbl. The user may provide walker->pte_callback() that gets
 * called for every entry in the page table. In addition the user may provide
 * walker->pt_hole_callback() that gets called for every unmapped entry in the page
 * table.
 *
 * Hint: this function calls ptbl_end() to get the end boundary of the current
 * page.
 * Hint: the next page is at ptbl_end() + 1.
 * Hint: the loop condition is next < end.
 */

static inline int pt_index(uintptr_t addr) {return ptbl_index(addr);}

static int ptbl_walk_range(struct page_table *ptbl, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	/* LAB 2: your code here. */
	return WALK_RANGE(ptbl, base, end, walker, NULL, pt);
}

/* Walks over the page range from base to end iterating over the entries in the
 * given page directory pdir. The user may provide walker->pde_callback() that gets
 * called for every entry in the page directory. In addition the user may
 * provide walker->pt_hole_callback() that gets called for every unmapped entry in the
 * page directory. If the PDE is present, but not a huge page, this function
 * calls ptbl_walk_range() to iterate over the entries in the page table. The
 * user may provide walker->pde_unmap() that gets called for every present PDE
 * after walking over the page table.
 *
 * Hint: see ptbl_walk_range().
 */
static int pdir_walk_range(struct page_table *pdir, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	/* LAB 2: your code here. */

	//TODO find a way to integrate with WALK_RANGE
	physaddr_t* entry;
	uintptr_t page_entry_base = sign_extend(base);
	uintptr_t page_entry_end = sign_extend(pdir_end(base));

	for(int i = PAGE_DIR_INDEX(base); i <= PAGE_DIR_INDEX(end); i++){
		entry = pdir->entries + i;

		bool isPresent = *entry & PAGE_PRESENT;
		BREAK_ON_ERR_WCALLBACK(walker->pde_callback, walker->pde_callback(entry, page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(walker->pde_unmap && isPresent, walker->pde_unmap(entry, page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(isPresent && !(*entry & PAGE_HUGE), ptbl_walk_range((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
		BREAK_ON_ERR_WCALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))

		page_entry_base = sign_extend(page_entry_end + 1);
		page_entry_end = sign_extend(pdir_end(page_entry_base));
	}

	return 0;
}

/* Walks over the page range from base to end iterating over the entries in the
 * given PDPT pdpt. The user may provide walker->pdpte_callback() that gets called
 * for every entry in the PDPT. In addition the user may provide
 * walker->pt_hole_callback() that gets called for every unmapped entry in the PDPT. If
 * the PDPTE is present, but not a large page, this function calls
 * pdir_walk_range() to iterate over the entries in the page directory. The
 * user may provide walker->pdpte_unmap() that gets called for every present
 * PDPTE after walking over the page directory.
 *
 * Hint: see ptbl_walk_range().
 */

static inline int pdpt_index(uintptr_t addr) {return PDPT_INDEX(addr);}

static int pdpt_walk_range(struct page_table *pdpt, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	return WALK_RANGE(pdpt, base, end, walker, pdpt_walk_range, pdpt);
}

/* Walks over the page range from base to end iterating over the entries in the
 * given PML4 pml4. The user may provide walker->pml4e_callback() that gets called
 * for every entry in the PML4. In addition the user may provide
 * walker->pt_hole_callback() that gets called for every unmapped entry in the PML4. If
 * the PML4E is present, this function calls pdpt_walk_range() to iterate over
 * the entries in the PDPT. The user may provide walker->pml4e_unmap() that
 * gets called for every present PML4E after walking over the PDPT.
 *
 * Hint: see ptbl_walk_range().
 */

static inline int pml4_index(uintptr_t addr){return PML4_INDEX(addr);}

static int pml4_walk_range(struct page_table *pml4, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	/* LAB 2: your code here. */
	return WALK_RANGE(pml4, base, end, walker, pdpt_walk_range, pdpt);
}

/* Helper function to walk over a page range starting at base and ending before
 * end.
 */
int walk_page_range(struct page_table *pml4, void *base, void *end,
	struct page_walker *walker)
{
	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
		ROUNDUP((uintptr_t)end, PAGE_SIZE) - 1, walker);
}

/* Helper function to walk over all pages. */
int walk_all_pages(struct page_table *pml4, struct page_walker *walker)
{
	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
}

/* Helper function to walk over all user pages. */
int walk_user_pages(struct page_table *pml4, struct page_walker *walker)
{
	return pml4_walk_range(pml4, 0, USER_LIM, walker);
}

/* Helper function to walk over all kernel pages. */
int walk_kernel_pages(struct page_table *pml4, struct page_walker *walker)
{
	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
}
