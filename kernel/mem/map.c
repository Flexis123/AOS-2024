#include <types.h>
#include <paging.h>

#include <kernel/mem.h>

#define ENTRY_PA_MASK 0xFFF0000000000FFF

struct boot_map_info {
	struct page_table *pml4;
	uint64_t flags;
	physaddr_t pa;
	uintptr_t base, end;
};


//clears all flags and adds the new flags provided by 'flags' into 'entry'
static void ovveride_flags(physaddr_t* entry, uint64_t flags){
	*entry &= 0x7FFFFFFFFFFFF000; 
	*entry |= flags;
}

static int claim_entry(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
	struct boot_map_info *info = walker->udata;

	int res = 0;
	if(!(*entry & PAGE_PRESENT)) {
		cprintf("attempting to do ptbl_alloc\n");
		res = ptbl_alloc(entry, base, end, walker);
	}
	
	if(res >= 0) {
		set_entry_pa(entry, info->pa);
		ovveride_flags(entry, info->flags);
	}

	return res;
}

/* Stores the physical address and the appropriate permissions into the PTE and
 * increments the physical address to point to the next page.
 */
static int boot_map_pte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct boot_map_info *info = walker->udata;

	/* LAB 2: your code here. */

	int res = claim_entry(entry, base, end, walker);
	if(res > 0) info->pa, info->base += PAGE_SIZE;
	return res;
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

	/* LAB 2: your code here. */
	int res = 0;
	//check if entry is present
	if(hpage_aligned(info->pa) && (info->end - info->end) > HPAGE_SIZE){
		set_entry_pa(entry, info->pa);
		ovveride_flags(entry, info->flags);
		info->pa, info->base += PAGE_HUGE;

	}else{
		if(*entry & PAGE_PRESENT){
			res = ptbl_split(entry, base, end, walker);
		}else{
			res = ptbl_alloc(entry, base, end, walker);
		}

		if(res >= 0) {
			set_entry_pa(entry, info->pa);
			ovveride_flags(entry, info->flags);
		}
	}

	return res;
}

static int boot_map_pdpte(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	return claim_entry(entry, base, end, walker);
}

static int boot_map_pml4(physaddr_t *entry, uintptr_t base, uintptr_t end,
    struct page_walker *walker)
{
	struct boot_map_info *info = walker->udata;

	return claim_entry(entry, base, end, walker);

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
	struct boot_map_info info = {
		.pa = pa,
		.flags = flags,
		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
	};
	struct page_walker walker = {
		.pte_callback = boot_map_pte,
		.pde_callback = boot_map_pde,
		.pdpte_callback = boot_map_pdpte,
		.pml4e_callback = boot_map_pml4, //CHECK IF ALREADY INITIALIZED TO NULL ALL FIELDS
		/* LAB 2: your code here. */
		.udata = &info,
	};

	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
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

	//kernel vma = 0xFFFF800000000000
	//which pa to use for this? where does the kenrla start in physical mem?
	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, PADDR((void*)KERNEL_VMA), PAGE_KMASK);

	/* LAB 2: your code here. */
	struct elf_proghdr *prog_hdr;
	uint64_t flags = 0;
	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
		prog_hdr = prog_start + i;

		if(prog_hdr->p_va < KERNEL_VMA) continue;

		//setup flags
		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
		if(!(prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)) flags |= PAGE_NO_EXEC; //CHECK AGAIN IF THIS IS THE CORRECT WAY TO CHECK THE FLAGS
		flags |= PF_PRESENT;
		
		boot_map_region(pml4, (void*) prog_hdr->p_va, prog_hdr->p_memsz, prog_hdr->p_pa, flags);

		flags = 0;
	}
}
