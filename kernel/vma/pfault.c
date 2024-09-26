#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Handles the page fault for a given task. */
int task_page_fault_handler(struct task *task, void *va, int flags)
{
	/* LAB 4: your code here. */
	//assert that this isnt caused by kernel!
	cprintf("start task_page_Fault handler, va is: %p\n", va);
    struct vma* vm = task_find_vma(task, va);

	//CHECK for case where adress is out of vma but still legal
	if(!vm){
		
		if(va >= (void *)USER_LIM)return -1;

		struct vma *vma_above = task_find_vma(task, va + PAGE_SIZE);

		if(!vma_above || (strcmp("stack", vma_above->vm_name) != 0)){
			return -1;
		}
		vm = add_anonymous_vma(task, "stack", ROUNDDOWN(va, PAGE_SIZE), PAGE_SIZE, vma_above->vm_flags);

		if(!vm){
			panic("failed to grow user stack");
		}
		
	}

	bool illegalWrite = !(vm->vm_flags & VM_WRITE) && (flags & PF_WRITE);

	if(illegalWrite){
		cprintf("illegal write detected\n");
	}

	bool invalidPf = illegalWrite || !(vm->vm_flags & VM_READ) || (flags & PF_RESERVED) 
				|| ((flags & PF_IFETCH) && !(vm->vm_flags & VM_EXEC));
	if(invalidPf){
		cprintf("illegal pf detected\n");
	}

	if(invalidPf) return -1;

	//this means the page fault was caused because the page is not mapped which is the only legal page fault
	assert(!(flags & PF_PRESENT));

	//map in missing page
	//this code may change depending on what bonus we implement
	//do we map one page at a time or multiple?
	cprintf("populate vma range from: %p to (exclusive) %p\n", ROUNDDOWN(va, PAGE_SIZE), ROUNDDOWN(va, PAGE_SIZE) + PAGE_SIZE);
	populate_vma_range(task, ROUNDDOWN(va, PAGE_SIZE), PAGE_SIZE, vm->vm_flags);
	struct page_info *test = page_lookup(task->task_pml4, va, NULL);
	assert(test);
	uint8_t *bytes = page2kva(test);
	cprintf("page fault complete\n");
	return 0;
}
