#include <types.h>
#include <paging.h>

#include <kernel/mem.h>


void debug_print(){
	cprintf("\n");
	for(int i = 0; i < 512; i++){
		physaddr_t entry = kernel_pml4->entries[i];

		if(entry != 0){
			cprintf("pml4 entry %d is: %p\n", i, entry);
			
			physaddr_t* pml3 = KADDR(PAGE_ADDR(entry));

			for(int j = 0; j < 512; j++){

				if(pml3[j] != 0){
					cprintf("	pdpt entry %d is %p\n", j, pml3[j]);
					physaddr_t* pml2 = KADDR(PAGE_ADDR(pml3[j]));
					
					for(int k = 0; k < 512; k++){
						if(pml2[k] != 0 && !(pml2[k] & PAGE_HUGE)){
								cprintf("		pd entry %d is %p\n", k, pml2[k]);

								physaddr_t* pml1 = KADDR(PAGE_ADDR(pml2[k]));
								for(int l = 0; l < 512; l++){

									if(pml1[l] != 0){
										cprintf("			pt entry %d is %p\n", l, pml1[l]);
									}
								}

						}
						if(pml2[k] != 0 && (pml2[k] & PAGE_HUGE)){
							cprintf("		entry3 %d is HUGE %p\n", k, pml2[k]);
						}
					}
				}
			}



		}
	}
	cprintf("\n");
}


struct dump_info {
	uintptr_t base;
	uintptr_t end;
	uint64_t flags;
	uint64_t mask;
};

/* Print the region before the hole if there was any and reset the info struct.
 */
static int dump_hole(uintptr_t base, uintptr_t end, struct page_walker *walker)
{
	struct dump_info *info = walker->udata;

	if (info->flags & PAGE_PRESENT) {
		cprintf("  %016p - %016p [%c%c%c%c",
			info->base,
			info->end,
			(info->flags & PAGE_PRESENT) ? 'r' : '-',
			(info->flags & PAGE_WRITE) ? 'w' : '-',
			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
			(info->flags & PAGE_USER) ? 'u' : '-'
		);

		if (info->mask & PAGE_HUGE) {
			cprintf(" %s",
				(info->flags & PAGE_HUGE) ? "2M" : "4K"
			);
		}

		cprintf("]\n");
	}

	info->flags = 0;

	return 0;
}

/* Update the end pointer if the flags are the same. Otherwise print the region
 * and keep track of the new region.
 */
static int dump_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct dump_info *info = walker->udata;
	uint64_t flags;

	flags = *entry & info->mask;

	if (flags == info->flags) {
		info->end = end;

		return 0;
	}

	dump_hole(base, end, walker);

	info->base = base;
	info->end = end;
	info->flags = flags;

	return 0;
}

/* Update the end pointer if the flags are the same and the PDE points to a
 * huge page. Otherwise print the region and keep track of the new region.
 */
static int dump_pde(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct dump_info *info = walker->udata;
	uint64_t flags;

	if (!(*entry & PAGE_HUGE))
		return 0;

	flags = *entry & info->mask;

	if (flags == info->flags) {
		info->end = end;

		return 0;
	}

	dump_hole(base, end, walker);

	info->base = base;
	info->end = end;
	info->flags = flags;

	return 0;
}

/* Given the root pml4 to the page table hierarchy, dumps the mapped regions
 * with the same flags. mask can be PAGE_HUGE to differentiate regions mapped
 * with normal pages from those mapped with huge pages.
 */
int dump_page_tables(struct page_table *pml4, uint64_t mask)
{
	struct dump_info info = {
		.base = 0,
		.flags = 0,
		.mask = mask,
	};
	struct page_walker walker = {
		.pte_callback = dump_pte,
		.pde_callback = dump_pde,
		.pt_hole_callback = dump_hole,
		.udata = &info,
	};

	if (walk_all_pages(pml4, &walker) < 0)
		return -1;

	dump_hole(0, 0, &walker);

	return 0;
}

