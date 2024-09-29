#include <error.h>
#include <list.h>

#include <kernel/console.h>
#include <kernel/mem.h>
#include <kernel/monitor.h>
#include <kernel/sched.h>
#include <kernel/vma.h>
#include <kernel/sched/task.h>

extern struct list runq;

void *table_index_to_va(int pml4_index, int pdpt_index, int pdir_index, int ptbl_index){
	return (void *)((uintptr_t)pml4_index * PDPT_SPAN
	+ (uintptr_t)pdpt_index * PAGE_DIR_SPAN
	+ (uintptr_t)pdir_index * PAGE_TABLE_SPAN
	+ (uintptr_t)ptbl_index * PAGE_SIZE);
}


//helper function to COW the 
void task_clone_pml4(struct page_table *child_pml4, struct page_table *parent_pml4){

	for(int i = 0; i < PML4_INDEX(USER_LIM); i++){
		physaddr_t pml4_entry = parent_pml4->entries[i];

		if(!pml4_entry)continue;
		struct page_table *pdpt = (struct page_table *)(KADDR(pml4_entry));

		for(int j = 0; j < PAGE_TABLE_ENTRIES; j++){
			
			physaddr_t pdpt_entry = pdpt->entries[j];

			if(!pdpt_entry)continue;
			struct page_table *pdir = (struct page_table *)(KADDR(pdpt_entry));

			for(int k = 0; k < PAGE_TABLE_ENTRIES; k++){
				physaddr_t pdir_entry = pdir->entries[k];

				if(!pdir_entry)continue;

				if(pdir_entry & PAGE_HUGE){
					void* va = table_index_to_va(i, j, k, 0);
					struct page_info *huge_page = page_lookup(parent_pml4, va, NULL);
					assert(huge_page);
					huge_page->pp_ref++;
					assert(page_insert(child_pml4, huge_page, va, PAGE_PRESENT));
				}
				else{
					struct page_table *ptbl = (struct page_table *)(KADDR(pdir_entry));
					for(int l = 0; l < PAGE_TABLE_ENTRIES; l++){
						physaddr_t ptbl_entry = ptbl->entries[k];

						if(!ptbl_entry)continue;
						void* va = table_index_to_va(i, j, k, l);
						struct page_info *page = page_lookup(parent_pml4, va, NULL);
						assert(page);
						page->pp_ref++;
						assert(page_insert(child_pml4, page, va, PAGE_PRESENT));
					}
				}
			}
		}
	}
}

/* Allocates a task struct for the child process and copies the register state,
 * the VMAs and the page tables. Once the child task has been set up, it is
 * added to the run queue.
 */
struct task *task_clone(struct task *task)
{
	struct task *child = task_alloc(task->task_pid);

	if(!child){
		panic("OOM in task_clone");
		return NULL;
	}
	memcpy(&child->task_frame, &task->task_frame, sizeof(task->task_frame));

	task_clone_pml4(child->task_pml4, task->task_pml4);
	struct list *vma_entry = NULL;

	list_foreach(&task->task_mmap, vma_entry){

		struct vma *parent_vma = container_of(vma_entry, struct vma, vm_mmap);
		struct vma *child_vma = NULL;
		size_t vma_size = parent_vma->vm_end - parent_vma->vm_base;

		if(parent_vma->vm_src){
			child_vma = add_executable_vma(child, parent_vma->vm_name, parent_vma->vm_base, vma_size, parent_vma->vm_flags, parent_vma->vm_src, parent_vma->vm_len);

			if(!child_vma){
				panic("unable to create executable vma in task_clone");
				task_free(child);
				return NULL;
			}
		}
		else{
			child_vma = add_anonymous_vma(child, parent_vma->vm_name, parent_vma->vm_base, vma_size, parent_vma->vm_flags);

			if(!child_vma){
				panic("unable to create anonymous vma in task_clone");
				task_free(child);
				return NULL;
			}
		}
	}
	list_add(&runq, &child->task_node);
	return child;
}

pid_t sys_fork(void)
{
	/* LAB 5: your code here. */
	return -ENOSYS;
}
