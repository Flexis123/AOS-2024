#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

struct boot_map_info {
	struct page_table *pml4;
	uint64_t flags;
	physaddr_t pa;
	uintptr_t base, end;
};

/* Stores the physical address and the appropriate permissions into the PTE and
 * increments the physical address to point to the next page.
 */
static int boot_map_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{

	struct boot_map_info *info = walker->udata;
	*entry = info->pa | info->flags;
	info->pa += PAGE_SIZE;
	tlb_invalidate(info->pml4, (void*)base);
	
	return 0;
}

/* Stores the physical address and the appropriate permissions into the PDE and
 * increments the physical address to point to the next huge page if the
 * physical address is huge page aligned and if the area to be mapped covers a
 * 2M area. Otherwise this function calls ptbl_split() to split down the huge
 * page or allocate a page table.
 */
static int boot_map_pde(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct boot_map_info *info = walker->udata;

	if(hpage_aligned((uintptr_t)info->pa) && (end - base +1) == HPAGE_SIZE){
		*entry = info->pa | PAGE_PRESENT | PAGE_HUGE;//fixing this causes problems
		info->pa += HPAGE_SIZE;
		return 0;
	}
	int ok = ptbl_split(entry, base, end, walker);

	for(uintptr_t i = base; i < end; i += PAGE_SIZE){
		tlb_invalidate(info->pml4, (void*)i);
	}
	return ok;

}

/*
 * Maps the virtual address space at [va, va + size) to the contiguous physical
 * address space at [pa, pa + size). Size is a multiple of PAGE_SIZE. The
 * permissions of the page to set are passed through the flags argument.
 *
 * This function is only intended to set up static mappings. As such, it should
 * not change the reference counts of the mapped pages.
 *
 * Hint: this function calls walk_page_range().
 */
void boot_map_region(struct page_table *pml4, void *va, size_t size,
    physaddr_t pa, uint64_t flags)
{
	
	/* LAB 2: your code here. */
	assert(flags & PAGE_PRESENT);
	struct boot_map_info info = {
		.pa = pa,
		.flags = flags,
		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
	};
	cprintf("executing boot map region from va %p to %p, flags: %p\n", info.base, info.end, info.flags);
	struct page_walker walker = {
		.pte_callback = boot_map_pte,
		.pde_callback = boot_map_pde,
		.pdpte_callback = ptbl_alloc,
		.pml4e_callback = ptbl_alloc,
		.udata = &info,
	};
	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);

	for(size_t i = 0; i < size; i+= PAGE_SIZE){
		tlb_invalidate(pml4, va + i);
	}
}

/* This function parses the program headers of the ELF header of the kernel
 * to map the regions into the page table with the appropriate permissions.
 *
 * First creates an identity mapping at the KERNEL_VMA of size BOOT_MAP_LIM
 * with permissions RW-.
 *
 * Then iterates the program headers to map the regions with the appropriate
 * permissions.
 *
 * Hint: this function calls boot_map_region().
 * Hint: this function ignores program headers below KERNEL_VMA (e.g. ".boot").
 */


void boot_map_kernel(struct page_table *pml4, struct elf *elf_hdr)
{
	struct elf_proghdr *prog_start =
	    (struct elf_proghdr *)((char *)elf_hdr + elf_hdr->e_phoff);

	cprintf("map kernel, no exec\n");
	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, 0, PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC);


	/* LAB 2: your code here. */
	struct elf_proghdr *prog_hdr;
	uint64_t flags = 0;
	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
		prog_hdr = prog_start + i;

		if(prog_hdr->p_va < KERNEL_VMA || prog_hdr->p_type != ELF_PROG_LOAD || !(prog_hdr->p_flags & ELF_PROG_FLAG_READ)) continue;

		//setup flags
		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
		if((prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)){
			cprintf("exec flag enabled!\n");
		}
		else{
			flags |= PAGE_NO_EXEC;
		}
		flags |= PAGE_PRESENT;
		//this causes kernel segfault
		cprintf("map region at va %p to %p with flags; %p\n", prog_hdr->p_va, ROUNDUP(prog_hdr->p_memsz + prog_hdr->p_va, PAGE_SIZE), flags);
		//boot_map_region(kernel_pml4, (void *)prog_hdr->p_va, prog_hdr->p_memsz, (physaddr_t)prog_hdr->p_pa, flags);
		flags = 0;
	}
}
