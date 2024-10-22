#pragma once
#include <list.h>
#include <task.h>
#include <paging.h>
#include <assert.h>

struct reverse_mapping;
#define NSWAP_PAGES 32 * 1024
struct pte_list {
	struct list node;
	physaddr_t *pte;
};

struct swap_info {
	struct pte_list pte_list;
    struct list node; //for the free list.
	struct page_info *page;
};


extern struct swap_info swap_pages[];
extern struct list swap_free_list;
extern struct list swap_read_queue;
extern struct list swap_write_queue;
extern struct swap_info *current_swap_page;
extern struct list lru;
extern size_t lru_size;

//TODO add locking for this

void swap_init();
void pte_list_init(struct pte_list *pte_list);
void reverse_mapping_init(struct reverse_mapping *reverse_map);
void add_reverse_map(struct page_info *page, void *va, struct task *task);
void remove_reverse_map(struct page_info *page, void *va, struct task *task);
void copy_reverse_map(struct page_info *from, struct page_info *to);
void reverse_mapping_to_pte_list(struct reverse_mapping *reverse_mapping, struct pte_list *pte_list);

void swap_read_queue_insert(struct swap_info *info);
void swap_write_queue_insert(struct swap_info *info);

void swap_to_disk(struct page_info *page);
void swap_to_memory(physaddr_t *pte);

struct swap_info *pte_to_swap_info(physaddr_t swap_pte);
physaddr_t swap_info_to_swap_pte(struct swap_info* info);

void do_write();
void do_read();