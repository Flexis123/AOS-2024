#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

int task_page_fault_cow_handler(struct task *task, void *va, int pf_flags){
	physaddr_t *entry = NULL;


	struct page_info *existing_page = page_lookup(task->task_pml4, va, &entry);

	assert(existing_page);
	assert(existing_page->pp_ref > 0);
	
	if(existing_page->pp_ref == 1){
		*entry |= PAGE_WRITE;
		return 0;
	}
	struct page_info *copy_page = page_alloc(existing_page->pp_order);
	
	if(!copy_page){
		panic("OOM in task_page_fault_cow_handler");
		return -1;
	}
	size_t page_size = (existing_page->pp_order == BUDDY_2M_PAGE)? HPAGE_SIZE : PAGE_SIZE;
	memcpy(page2kva(copy_page), page2kva(existing_page), page_size);
	
	
	assert(page_insert(task->task_pml4, copy_page, ROUNDDOWN(va, page_size), (*entry | PAGE_WRITE) & PAGE_MASK) == 0);
	
	return 0;
}




/* Handles the page fault for a given task. */
int task_page_fault_handler(struct task *task, void *va, int flags)
{
    struct vma* vm = task_find_vma(task, va);

	if(!vm)return -1;

	bool illegal_write = !(vm->vm_flags & VM_WRITE) && (flags & PF_WRITE) && !(vm->vm_flags & VM_WRITE);

	bool invalid_page_fault = illegal_write || !(vm->vm_flags & VM_READ) || (flags & PF_RESERVED) 
				|| ((flags & PF_IFETCH) && !(vm->vm_flags & VM_EXEC));

	if(invalid_page_fault) return -1;

	if(((flags & (PF_WRITE | PF_PRESENT)) == (PF_WRITE | PF_PRESENT)) && (vm->vm_flags & VM_WRITE)){//handle copy on write
		return task_page_fault_cow_handler(task, va, flags);
	}

	populate_vma_range(task, ROUNDDOWN(va, PAGE_SIZE), PAGE_SIZE, vm->vm_flags);
	return 0;
}
