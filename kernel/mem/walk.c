#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

#define RET_ON_ERR_WALKER_CALLBACK(guard, ret)  if(guard && ret < 0) return ret;

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

struct ptbl_functions
{
	map_pte_t ptbl_callback; 
	map_pte_t ptbl_unmap;
	walkfn_t walkfn; 
	int (*ptbl_index)(uintptr_t); 
	uintptr_t (*ptbl_end)(uintptr_t);
	map_pte_t stop_walk;
};


static int __walk_range(struct page_table *ptbl, uintptr_t base, uintptr_t end, struct ptbl_functions* ptbl_fn, struct page_walker *walker){

	physaddr_t* entry;
	uintptr_t page_entry_base = sign_extend(base);
	uintptr_t page_entry_end = sign_extend(ptbl_fn->ptbl_end(base));
	int ret = 0;

	for(int i = ptbl_fn->ptbl_index(base); i <= ptbl_fn->ptbl_index(end); i++){
		entry = ptbl->entries + i;

		bool isPresent = *entry & PAGE_PRESENT;
		if(ptbl_fn->ptbl_callback && (ret = ptbl_fn->ptbl_callback(entry, page_entry_base, page_entry_end, walker)) < 0) {
			return ret;
		}

		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT) && (ret = walker->pt_hole_callback(base, end, walker)) < 0){
			return ret;
		}


		bool stopWalk = ptbl_fn->stop_walk && !ptbl_fn->stop_walk(entry, base, end, walker);
		
		if(ptbl_fn->walkfn && (*entry & PAGE_PRESENT) && stopWalk
			&& (ret = ptbl_fn->walkfn((struct page_table *) pa2page(PAGE_ADDR(*entry)), base, end, walker)) < 0){
			
			return ret;
		}

		if(ptbl_fn->ptbl_unmap && (*entry & PAGE_PRESENT) && (ret = ptbl_fn->ptbl_unmap(entry, base, end, walker) < 0)){
			return ret;
		}

		page_entry_base = sign_extend(page_entry_end + 1);
		page_entry_end = sign_extend(ptbl_fn->ptbl_end(page_entry_base));
	}

	
	return ret;
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

static inline int pt_index(uintptr_t addr) {return PAGE_TABLE_INDEX(addr);}

static int ptbl_walk_range(struct page_table *ptbl, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	struct ptbl_functions ptbl_fns = 
	{
		.ptbl_callback = walker->pte_callback,
		.ptbl_unmap = walker->pte_unmap,
		.ptbl_end = pt_end,
		.ptbl_index = pt_index,
	};
	
	return __walk_range(ptbl, base, end, &ptbl_fns, walker);
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

static inline int pd_index(uintptr_t addr) {return PAGE_DIR_INDEX(addr);}

static inline int stop_walk_pdir(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
	return *entry & PAGE_HUGE;
}

static int pdir_walk_range(struct page_table *pdir, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	/* LAB 2: your code here. */

	struct ptbl_functions ptbl_fns = 
	{
		.ptbl_callback = walker->pde_callback,
		.ptbl_unmap = walker->pde_unmap,
		.walkfn = ptbl_walk_range,
		.ptbl_end = pdir_end,
		.ptbl_index = pd_index,
		.stop_walk = stop_walk_pdir
	};
	
	return __walk_range(pdir, base, end, &ptbl_fns, walker);
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
	struct ptbl_functions ptbl_fns = 
	{
		.ptbl_callback = walker->pdpte_callback,
		.ptbl_unmap = walker->pdpte_unmap,
		.walkfn = pdir_walk_range,
		.ptbl_end = pdpt_end,
		.ptbl_index = pdpt_index,
	};
	
	return __walk_range(pdpt, base, end, &ptbl_fns, walker);
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
	struct ptbl_functions ptbl_fns = 
	{
		.ptbl_callback = walker->pml4e_callback,
		.ptbl_unmap = walker->pml4e_unmap,
		.walkfn = pdpt_walk_range,
		.ptbl_end = pml4_end,
		.ptbl_index = pml4_index,
	};
	
	return __walk_range(pml4, base, end, &ptbl_fns, walker);
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
