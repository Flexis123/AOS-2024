#pragma once
#include <list.h>
#include <task.h>
#include <paging.h>
#include <assert.h>

struct reverse_mapping;
#define NSWAP_PAGES 32 * 1024

struct pte_entry {
	struct list node;
	physaddr_t *pte_entry;
};

struct swap_page {
	struct list sp_pte_entries; // pte_list head
    struct list sp_free_list_node; //for the free list.
	struct list sp_swap_in_queue_node;
	bool is_enqued_for_swap_in;
};


extern struct swap_page swap_pages[];
extern struct list swap_free_list;
extern struct list swap_out_queue;
extern struct list swap_in_queue;
extern struct swap_page *current_swap_page;
extern struct list lru;
extern size_t lru_size;

#define LOW_FREE_PAGES_WATERMARK 0.15

//TODO add locking for this

void swap_init();

void swapper_remove_swap_page_entry(struct swap_page *page, physaddr_t *entry);

void swapper_add_page_entry(struct page_info *page, physaddr_t *entry);
void swapper_remove_page_entry(struct page_info *page, physaddr_t *entry);

void swap_out_queue_insert(struct swap_page *info);
void swap_in_queue_insert(struct swap_page *info);

struct swap_page *pte_to_swap_info(physaddr_t swap_pte);
physaddr_t swap_info_to_swap_pte(struct swap_page* info);

void attempt_swap_out();
void attempt_swap_in();

void create_lru_kthread();