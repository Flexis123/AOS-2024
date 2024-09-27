#include <types.h>

#include <kernel/mem.h>
#include <kernel/sched.h>
#include <kernel/vma.h>

#include <lib.h>

int sys_mquery(struct vma_info *info, void *addr)
{
	struct vma *vma;
	struct list *node;
	physaddr_t *entry;

	/* Check if the user has read/write access to the info struct. */
	assert_user_mem(cur_task, info, sizeof *info, PAGE_USER | PAGE_WRITE);

	/* Do not leak information about the kernel space. */
	if (addr >= (void *)USER_LIM) {
		return -1;
	}

	/* Clear the info struct. */
	memset(info, 0, sizeof *info);

	/* Find the VMA with an end address that is greater than the requested
	 * address, but also the closest to the requested address.
	 */
	vma = find_vma(NULL, NULL, &cur_task->task_rb, addr);

	if (!vma) {
		/* If there is no such VMA, it means the address is greater
		 * than the address of any VMA in the address space, i.e. the
		 * user is requesting the free gap at the end of the address
		 * space. The base address of this free gap is the end address
		 * of the highest VMA and the end address is simply USER_LIM.
		 */
		node = list_tail(&cur_task->task_mmap);

		info->vm_end = (void *)USER_LIM;

		if (!node) {
			return 0;
		}

		vma = container_of(node, struct vma, vm_mmap);
		info->vm_base = vma->vm_end;

		return 0;
	}

	if (addr < vma->vm_base) {
		/* The address lies outside the found VMA. This means the user
		 * is requesting the free gap between two VMAs. The base
		 * address of the free gap is the end address of the previous
		 * VMA. The end address of the free gap is the base address of
		 * the VMA that we found.
		 */
		node = list_prev(&cur_task->task_mmap, &vma->vm_mmap);

		info->vm_end = vma->vm_base;

		if (!node) {
			return 0;
		}

		vma = container_of(node, struct vma, vm_mmap);
		info->vm_base = vma->vm_end;

		return 0;
	}

	/* The requested address actually lies within a VMA. Copy the
	 * information.
	 */
	strncpy(info->vm_name, vma->vm_name, 64);
	info->vm_base = vma->vm_base;
	info->vm_end = vma->vm_end;
	info->vm_prot = vma->vm_flags;
	info->vm_type = vma->vm_src ? VMA_EXECUTABLE : VMA_ANONYMOUS;

	/* Check if the address is backed by a physical page. */
	if (page_lookup(cur_task->task_pml4, addr, &entry)) {
		info->vm_mapped = (*entry & PAGE_HUGE) ? VM_2M_PAGE : VM_4K_PAGE;
	}

	return 0;
}

static bool prot_flags_valid(int prot){
	if(prot & PROT_EXEC){
        if(prot & PROT_WRITE){
            return false;
        }
        if(!(prot & PROT_READ)){
            return false;
        }
    }
    else if(prot & PROT_WRITE){
        if(!(prot & PROT_READ)){
            return false;
        }
    }
	return true;
}

static bool is_adress_invalid(void* addr, size_t len){
	return addr >= (void *)USER_LIM || (addr + len) >= (void *)USER_LIM || addr + len < (void*) len || addr == NULL;
}

static bool invalid_mapping(void* addr, size_t len, int prot){
	return !page_aligned((uintptr_t)addr) || is_adress_invalid(addr, len) || !prot_flags_valid(prot);
}

void *sys_mmap(void *addr, size_t len, int prot, int flags, int fd,
	uintptr_t offset)
{

	if(invalid_mapping(addr, len, prot)) return MAP_FAILED;
	

	if((flags & (MAP_ANONYMOUS | MAP_PRIVATE)) != (MAP_ANONYMOUS | MAP_PRIVATE)){
        panic("Unsupported flags in sys_mmap: %p", flags);
    }

	if(flags & MAP_FIXED) remove_vma_range(cur_task, addr, len);

	
	struct vma *vma = add_anonymous_vma(cur_task, "user", addr, len, prot);
	if(flags & MAP_POPULATE) populate_vma_range(cur_task, addr, len, prot);

	if(vma) return vma->vm_base;
	return NULL;
}

void sys_munmap(void *addr, size_t len)
{
	remove_vma_range(cur_task, addr, len);
}

int sys_mprotect(void *addr, size_t len, int prot)
{
	/* LAB 4: your bonus code here. */

	if(invalid_mapping(addr, len, prot)) return -EINVAL;	
	protect_vma_range(cur_task, addr, len, prot);
	return 0;
}

int sys_madvise(void *addr, size_t len, int advise)
{
	/* LAB 4: your bonus code here. */
	if(is_adress_invalid(addr, len) || !page_aligned((uintptr_t)addr)) return -EINVAL;

	struct vma* vma;

	switch (advise)
	{
	case MADV_DONTNEED:
		unmap_page_range_non_dirty(cur_task->task_pml4, addr, len);
		break;

	case MADV_WILLNEED:
		//check if vma can be enlarged
		vma = task_find_vma(cur_task, addr);
		if(!vma) return -EINVAL;

		void* vma_new_end = vma->vm_base + len;
		//if(task_find_vma(cur_task, vma_new_end)) return -EINVAL;
		struct list* next_vma = list_next(&cur_task->task_mmap, &vma->vm_mmap);
		if(next_vma && vma_new_end >= container_of(next_vma, struct vma, vm_mmap)->vm_base) return -EINVAL;

		vma->vm_end = vma_new_end;

		return populate_vma_range(cur_task, vma->vm_base, len, vma->vm_flags);
	
	default:
		return -EINVAL;
	}
	return 0;
}
