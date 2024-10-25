#include <kernel/mem.h>
#include <task.h>
#include <paging.h>
#include <assert.h>
#include <kernel/sched.h>

#include <kernel/dev/disk.h>

struct swap_page* swap_pages;
struct list swap_free_list;
struct list swap_out_queue;
struct list swap_in_queue;
struct swap_page *current_swap_page = NULL;
struct list lru; //the Least Recently Used list, holds all physical pages in use by user tasks, cannot hold duplicates but can have free page_infos.
//Note that the lru only holds 4K pages that have been allocated by the pagefault handler or by the mmap syscall.
size_t lru_size;

#define cur_disk disks[1]

void swap_init(){
    list_init(&swap_free_list);
    list_init(&swap_out_queue);
    list_init(&swap_in_queue);
    list_init(&lru);

    populate_region(kernel_pml4, SPAGES, NSWAP_PAGES * sizeof(struct swap_page), PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC);
    swap_pages = (struct swap_page*) SPAGES;

    for(int i = 0; i < NSWAP_PAGES; i++){
        struct swap_page *sp = swap_pages + i;
        list_init(&sp->sp_pte_entries);
        list_init(&sp->sp_free_list_node);
        list_init(&sp->sp_swap_in_queue_node);
        sp->is_enqued_for_swap_out = false;
        list_add(&swap_free_list, &sp->sp_free_list_node);
    }
}

void swap_out_queue_insert(struct page_info *page){
    if(!page->is_enqued_for_swap_out) {
        page->is_enqued_for_swap_out = true;
        list_add(&swap_out_queue, &page->pp_swap_out_queue_node);
    }
}

void swap_in_queue_insert(struct swap_page *sp){
    if(!sp->is_enqued_for_swap_in) {
        sp->is_enqued_for_swap_in = true;
        list_add(&swap_in_queue, &sp->sp_swap_in_queue_node);
    }
}

struct page_info* swap_out_queue_pop(){
    if(!list_is_empty(&swap_out_queue)) {
       return container_of(list_pop(&swap_out_queue), struct page_info, pp_swap_out_queue_node);
    }
    return NULL;
}

struct swap_page* swap_in_queue_pop(){
    if(!list_is_empty(&swap_in_queue)) {
       return container_of(list_pop(&swap_in_queue), struct swap_page, sp_swap_in_queue_node);
    }
    return NULL;
}


void lru_add(struct page_info* page){
    if(!page->is_in_lru){
        list_add(&lru, &page->pp_lru_node);
        lru_size++;
    }
}

void lru_remove(struct page_info* page){
    if(page->is_in_lru){
        list_del(&page->pp_lru_node);
        lru_size--;
    }
}

struct page_info* lru_pop(){
    if(lru_size > 0){
        lru_size--;
        return  container_of(list_pop_tail(&lru), struct page_info, pp_lru_node);
    }
    return NULL;
}


void lru_swapper_kthread(void* data){

    size_t free_pages = count_total_free_pages();
    struct page_info* page;
    struct list* page_node;
    while(free_pages / npages < LOW_FREE_PAGES_WATERMARK){
        page = lru_pop();

        struct list* reverse_map_node;

        //check if any entry is dirty
        bool page_is_used = false;
        list_foreach(&page->pp_pte_entries, reverse_map_node){
            struct pte_entry *rmap = container_of(reverse_map_node, struct pte_entry, node);
            
            page_is_used = ((*rmap->pte_entry) & PAGE_DIRTY) || ((*rmap->pte_entry) & PAGE_ACCESSED);
            if(page_is_used)break;  
        }

        if(page_is_used){
            lru_add(page); //add back page as its used
            continue;
        }

        //enqueue a swap info
        struct swap_page* swap_page = container_of(list_pop(&swap_free_list), struct swap_page, sp_free_list_node);
        if(swap_page) swap_in_queue_insert(swap_page);
        
    }
}

void create_lru_kthread(){
    struct task* lru_kthread = create_kthread(lru_swapper_kthread, NULL);

    if(!lru_kthread){
        panic("Could not create lru kthread\n");
    }

    schedule_task(lru_kthread);
    TASK_UNLOCK(lru_kthread);
}

void remove_pte_entry(void* page, size_t offsetof_pte_list, physaddr_t *entry){
    if(!(*entry & PAGE_USER)) return;

    //search for entry inside of page
    struct list* pte_entry_node = NULL;
    struct list* next = NULL;
    struct list* pte_list = page + offsetof_pte_list;

    list_foreach_safe(pte_list, pte_entry_node, next){

        struct pte_entry* pt_en = container_of(pte_entry_node, struct pte_entry, node);
        if(entry == pt_en->pte_entry){
            list_del(pte_entry_node);
            kfree(pt_en);
            break;
        }
    }
}

void swapper_remove_swap_page_entry(struct swap_page *page, physaddr_t *entry){
   remove_pte_entry(page, offsetof(struct swap_page, sp_pte_entries), entry);
   if(list_is_empty(&page->sp_pte_entries)) list_add(&swap_free_list, &page->sp_free_list_node); //swap page has no morerefs add it tos swap page free list
}

void swapper_remove_page_entry(struct page_info *page, physaddr_t *entry) {
    remove_pte_entry(page, offsetof(struct page_info, pp_pte_entries), entry);
    if(list_is_empty(&page->pp_pte_entries)) lru_remove(page);
}

void swapper_add_page(struct page_info *page, physaddr_t *entry){
    if(!(*entry & PAGE_USER)) return;

    struct pte_entry* en = kmalloc(sizeof(struct pte_entry));
    en->pte_entry = entry;
    list_add(&page->pp_pte_entries, &en->node);

    if(page->pp_ref == 1) lru_add(page);
}



size_t swap_info_to_index(struct swap_info *info){
    size_t index = ((uintptr_t)info - (uintptr_t)swap_pages) / (sizeof(struct swap_page));
    assert(index < NSWAP_PAGES);
    assert(&swap_pages[index] == info);
    return index;
}

struct swap_info *pte_to_swap_info(physaddr_t swap_pte){
    assert(swap_pte & PAGE_SWAP);
    size_t index = PAGE_ADDR(swap_pte) >> PAGE_TABLE_SHIFT;
    assert(index < NSWAP_PAGES);
    return swap_pages + index;
}

physaddr_t swap_info_to_swap_pte(struct swap_page* swap){
    assert(swap >= swap_pages && swap <= swap_pages + NSWAP_PAGES);

    physaddr_t index = swap_info_to_index(swap);
    return (index << PAGE_TABLE_SHIFT) | PAGE_SWAP;
}


void  attempt_swap_out(){

    if(!disk_poll(cur_disk) || list_is_empty(&swap_out_queue)){
        return;
    }

    //disk is ready to get oiled up! p diddy style
    struct page_info* page = swap_out_queue_pop();
    

    //attempt to write to disk
    struct swap_page *sp = container_of(list_head(&swap_free_list), struct swap_page, sp_free_list_node);

    if(!sp){
        //TODO we do oom kill here right?
    }

    if(disk_write(cur_disk, page, PAGE_SIZE, swap_info_to_index(sp) * PAGE_SIZE) == -EAGAIN){
        swap_out_queue_insert(page);
        return;
    }

    list_del(&sp->sp_free_list_node); //remove swap page from swap free list a its occupied now

    //copy the pte_list of the page to the swap_page and change all ptes to match new state
    sp->sp_pte_entries = page->pp_pte_entries;

    struct list* pte_entry_node;
    list_foreach(&sp->sp_pte_entries, pte_entry_node){
        physaddr_t *entry = container_of(pte_entry_node, struct pte_entry, node)->pte_entry;


    }

    //reset swapping state of the page
    list_init(&page->pp_lru_node);
	list_init(&page->pp_swap_out_queue_node);
	list_init(&page->pp_pte_entries);
	page->is_enqued_for_swap_out = false;
	page->is_in_lru = false;


    //free page
    page_free(page);
}


void attempt_swap_in(){
    if(!disk_poll(cur_disk) || list_is_empty(&swap_in_queue)){
        return;
    }

    struct swap_page* sp = swap_in_queue_pop();

    struct page_info* page = page_alloc(ALLOC_ZERO); //this will oom if there is not enough space
    
    if(disk_read(cur_disk, page, PAGE_SIZE, swap_info_to_index(sp) * PAGE_SIZE) == -EAGAIN){
        //disk read failed so reset state and try again later
        page_free(page);
        swap_in_queue_insert(sp);
        return;
    }

    list_add(&swap_free_list, &sp->sp_free_list_node); // swap page is swaped in so now the place in dis its free real estate ;)))

    page->pp_pte_entries = sp->sp_pte_entries; //copy back all the pte 
}

