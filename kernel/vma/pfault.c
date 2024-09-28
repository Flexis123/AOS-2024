#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Handles the page fault for a given task. */
int task_page_fault_handler(struct task *task, void *va, int flags)
{
	/* LAB 4: your code here. */
	//assert that this isnt caused by kernel!
    struct vma* vm = task_find_vma(task, va);

	//CHECK for case where adress is out of vma but still legal
	if(!vm)return -1;

	bool illegal_write = !(vm->vm_flags & VM_WRITE) && (flags & PF_WRITE);

	bool invalid_page_fault = illegal_write || !(vm->vm_flags & VM_READ) || (flags & PF_RESERVED) 
				|| ((flags & PF_IFETCH) && !(vm->vm_flags & VM_EXEC));

	if(invalid_page_fault) return -1;

	//this means the page fault was caused because the page is not mapped which is the only legal page fault
	assert(!(flags & PF_PRESENT));


	populate_vma_range(task, ROUNDDOWN(va, PAGE_SIZE), PAGE_SIZE, vm->vm_flags);
	return 0;
}
