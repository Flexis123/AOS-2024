#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

/* Given an address addr, this function returns the sign extended address. */
static uintptr_t sign_extend(uintptr_t addr)
{
	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
}

/* Given an addresss addr, this function returns the page boundary. */
static uintptr_t ptbl_end(uintptr_t addr)
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

static int ptbl_walk_range(struct page_table *ptbl, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	uintptr_t current = sign_extend(base);
	end = sign_extend(end);
	uintptr_t next = sign_extend(ptbl_end(current) + 1);
	if(next < current){
		next = end;
	}

	while(current < end){
		
		physaddr_t* entry = ptbl->entries + PAGE_TABLE_INDEX(current);
		assert(PAGE_TABLE_INDEX(current) < 512);
		if(walker->pte_callback){
			if(walker->pte_callback(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT)){
			if(walker->pt_hole_callback(current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pte_unmap){
			if(walker->pte_unmap(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		current = next;
		next = sign_extend(ptbl_end(next) +1);
		if(next < current){
			current = end;
		}
	}
	return 0;
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

	uintptr_t current = sign_extend(base);
	end = sign_extend(end);
	uintptr_t next = sign_extend(pdir_end(current) + 1);

	if(next < current){
		next = end;
	}
	while(current < end){
		physaddr_t* entry = pdir->entries + PAGE_DIR_INDEX(current);
		assert(PAGE_DIR_INDEX(current) < 512);


		if(walker->pde_callback){
			if(walker->pde_callback(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT)){
			if(walker->pt_hole_callback(current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if((*entry & PAGE_PRESENT) && !(*entry & PAGE_HUGE)){
			if(ptbl_walk_range(KADDR(PAGE_ADDR(*entry)), current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pde_unmap){
			if(walker->pde_unmap(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		current = next;
		next = sign_extend(pdir_end(next) +1);
		if(next < current){
			current = end;
		}
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


static int pdpt_walk_range(struct page_table *pdpt, uintptr_t base,
    uintptr_t end, struct page_walker *walker)
{
	uintptr_t current = sign_extend(base);
	end = sign_extend(end);
	uintptr_t next = sign_extend(pdpt_end(current) + 1);

	if(next < current){
		next = end;
	}
	while(current < end){
		physaddr_t* entry = pdpt->entries + PDPT_INDEX(current);
		assert(PDPT_INDEX(current) < 512);
		if(walker->pdpte_callback){
			if(walker->pdpte_callback(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT)){
			if(walker->pt_hole_callback(current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if((*entry & PAGE_PRESENT) && !(*entry & PAGE_HUGE)){
			if(pdir_walk_range(KADDR(PAGE_ADDR(*entry)), current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pdpte_unmap){
			if(walker->pdpte_unmap(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		current = next;
		next = sign_extend(pdpt_end(next) +1);
		if(next < current){
			current = end;
		}
	}
	return 0;
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

static int pml4_walk_range(struct page_table *pml4, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{

	uintptr_t current = sign_extend(base);
	end = sign_extend(end);
	uintptr_t next = sign_extend(pml4_end(current) + 1);

	if(next < current){
		next = end;
	}

	while(current < end){
		physaddr_t* entry = pml4->entries + PML4_INDEX(current);
		assert(PML4_INDEX(current) < 512);

		if(walker->pml4e_callback){
			if(walker->pml4e_callback(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT)){
			if(walker->pt_hole_callback(current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if((*entry & PAGE_PRESENT) && !(*entry & PAGE_GLOBAL)){
			if(pdpt_walk_range(KADDR(PAGE_ADDR(*entry)), current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		if(walker->pml4e_unmap){
			if(walker->pml4e_unmap(entry, current, MIN(next -1, end), walker) < 0){
				return -1;
			}
		}
		current = next;
		next = sign_extend(pml4_end(next) +1);
		if(next < current){
			current = end;
		}
	}
	return 0;
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
