#include <kernel/mem/swap.h>
#include <task.h>
#include <paging.h>
#include <kernel/mem/kmem.h>
#include <kernel/mem/lookup.h>
#include <assert.h>
#include <kernel/sched/sched.h>


struct swap_info swap_pages[NSWAP_PAGES];
struct list swap_free_list;
struct list swap_read_queue;
struct list swap_write_queue;
struct swap_info *current_swap_page = NULL;
struct list lru; //the Least Recently Used list, holds all physical pages in use by user tasks, cannot hold duplicates but can have free page_infos.
//Note that the lru only holds 4K pages that have been allocated by the pagefault handler or by the mmap syscall.
size_t lru_size;

void swap_init(){
    list_init(&swap_free_list);
    list_init(&swap_read_queue);
    list_init(&swap_write_queue);
    list_init(&lru);

    for(int i = 0; i < NSWAP_PAGES; i++){
        struct swap_info *entry = &swap_pages[i];
        pte_list_init(&entry->pte_list);
        list_init(&entry->node);
        entry->page = NULL;
        list_add(&swap_free_list, &entry->node);
    }
}

void pte_list_init(struct pte_list *pte_list){
    list_init(&pte_list->node);
    pte_list->pte = NULL;
}

void reverse_mapping_init(struct reverse_mapping *reverse_map){
    list_init(&reverse_map->node);
    reverse_map->va = NULL;
    reverse_map->task = NULL;
}

void add_reverse_map(struct page_info *page, void *va, struct task *task){
    struct reverse_mapping *reverse_map = kmalloc(sizeof(struct reverse_mapping));
    assert(page);
    if(!reverse_map){
        panic("failed to malloc a reverse map");
    }
    reverse_mapping_init(reverse_map);
    reverse_map->task = task;
    reverse_map->va = va;
    list_add(&page->pp_reverse_map.node, &reverse_map->node);
}

void remove_reverse_map(struct page_info *page, void *va, struct task *task){
    struct list *node;
    struct list *next;
    assert(page);

    if(!task)return;
    bool use_lock = !holding(&task->task_lock);

    if(use_lock)TASK_LOCK(task);

    list_foreach_safe(&page->pp_reverse_map.node, node, next){
        struct reverse_mapping *entry = container_of(node, struct reverse_mapping, node);
        
        if(entry->va == va && entry->task == task){
            list_del(&entry->node);
        }
    }
    if(use_lock)TASK_UNLOCK(task);
}

void copy_reverse_map(struct page_info *from, struct page_info *to){
    assert(from);
    assert(to);

    if(list_is_empty(&from->pp_reverse_map.node)) return;

    struct list *node;
    list_foreach(&from->pp_reverse_map.node, node){
        struct reverse_mapping *entry = container_of(node, struct reverse_mapping, node);
        struct reverse_mapping *copy = kmalloc(sizeof(struct reverse_mapping));
        list_init(&copy->node);
        copy->task = entry->task;
        copy->va = entry->va;
        list_add(&to->pp_reverse_map.node, &copy->node);
    }
}

void reverse_mapping_to_pte_list(struct reverse_mapping *reverse_mapping, struct pte_list *pte_list){
    struct list *node;

    list_foreach(&reverse_mapping->node, node){
        struct reverse_mapping *entry = container_of(node, struct reverse_mapping, node);
        struct pte_list *pte_entry = kmalloc(sizeof(struct pte_list));
        assert(pte_entry);
        list_init(&pte_entry->node);
        assert(entry->task);
        physaddr_t *pte;
        struct page_info *page = page_lookup(entry->task->task_pml4, entry->va, &pte);
        assert(page);
        assert(pte);
        pte_entry->pte = pte;
        list_add(&pte_list->node, &pte_entry->node);
    }
}

void swap_read_queue_insert(struct swap_info *info){
    struct list *node;
    assert(info);
    list_foreach(&swap_read_queue, node){
        if(node == &info->node)return;
    }
    list_add(&swap_read_queue, &info->node);
}

void swap_write_queue_insert(struct swap_info *info){
    struct list *node;
    assert(info);
    list_foreach(&swap_write_queue, node){
        if(node == &info->node)return;
    }
    list_add(&swap_write_queue, &info->node);
}




void swap_to_disk(struct page_info *page){
    assert(!page->pp_free);
    assert(!list_is_empty(&page->pp_reverse_map.node));
    assert(!list_is_empty(&swap_free_list));
    struct swap_info *info = container_of(list_head(&swap_free_list), struct swap_info, node);
    list_del(&info->node);
    assert(info->page = NULL);
    assert(list_is_empty(&info->pte_list.node));
    reverse_mapping_to_pte_list(&page->pp_reverse_map, &info->pte_list);
    info->page = page;

    struct list *node;
    swap_write_queue_insert(info);
    do_write();
    sched_yield();
    assert(false);
}

void swap_to_memory(physaddr_t *swap_pte){
    assert(swap_pte);
    struct swap_info *info = pte_to_swap_info(*swap_pte);
    swap_read_queue_insert(info);
    do_read();
    sched_yield();
    assert(false);
}

struct swap_info *pte_to_swap_info(physaddr_t swap_pte){
    size_t index = PAGE_ADDR(swap_pte) >> PAGE_TABLE_SHIFT;
    assert(index < NSWAP_PAGES);
    return &swap_pages[index];
}

physaddr_t swap_info_to_swap_pte(struct swap_info* info){
    assert(info >= swap_pages);
    physaddr_t index = ((uintptr_t)info - (uintptr_t)swap_pages) / (sizeof(struct swap_info));
    assert(index < NSWAP_PAGES);
    assert(&swap_pages[index] == info);
    return index << PAGE_DIR_SHIFT;
}


void do_write(){
    assert(false);//TODO implement


}

void do_read(){
    assert(false);//TODO implement
}