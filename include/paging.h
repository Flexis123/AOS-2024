#pragma once

#include <list.h>
#include <kernel/mem/swap.h>
#include <x86-64/paging.h>
#include <task.h>


#ifndef __ASSEMBLER__
/*
 * Page descriptor structures, mapped at USER_PAGES.
 * Read/write to the kernel, read-only to user programs.
 *
 * Each struct page_info stores metadata for one physical page.
 * Is it NOT the physical page itself, but there is a one-to-one
 * correspondence between physical pages and struct page_infos.
 * You can map a struct page_info * to the corresponding physical
 * address with page2pa() in kernel/mem.h.
 * FIXME: where?
 */
struct page_info {
	/* Next page on the free list. */
	struct list pp_node;

	/* pp_ref is the count of pointers (usually in page table entries)
	 * to this page, for pages allocated using page_alloc.
	 * Pages allocated at boot time using pmap.c's
	 * boot_alloc do not have valid reference count fields. */
	uint16_t pp_ref;

	/* The order of the page. */
	uint8_t pp_order : 7;

	/* Whether the page is actually free. */
	uint8_t pp_free : 1;

	/* Reserved. */
	uint64_t pp_zero;

	struct list pp_lru_node;
	struct reverse_mapping rmap; // list of 
	struct list pp_swap_out_queue_node;

	bool is_enqued_for_swap_out;
	bool is_in_lru;
};

void _init_page(struct page_info* page);
#endif /* !__ASSEMBLER__ */

