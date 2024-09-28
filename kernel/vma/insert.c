#include <types.h>

#include <kernel/mem.h>
#include <kernel/vma.h>

/* Inserts the given VMA into the red-black tree of the given task. First tries
 * to find a VMA for the end address of the given end address. If there is
 * already a VMA that overlaps, this function returns -1. Then the VMA is
 * inserted into the red-black tree and added to the sorted linked list of
 * VMAs.
 */

int insert_vma(struct task *task, struct vma *vma)
{
	struct rb_node *node, *parent = NULL;
        struct vma *vma_tmp = NULL;
	int dir;


	node = task->task_rb.root;

	while (node) {
		vma_tmp = container_of(node, struct vma, vm_rb);
		parent = node;
		dir = (vma->vm_base >= vma_tmp->vm_end);

		if (!dir) {
		    /* If dir == 0 check if we don't overlap vma_tmp */
                    if (vma->vm_end > vma_tmp->vm_base){
                        return -1;
                    }
		}

		node = node->child[dir];
	}

        if (!parent){
            task->task_rb.root = &vma->vm_rb;
        } else {
            parent->child[dir] = &vma->vm_rb;
            vma->vm_rb.parent = parent;
        }

        /* Balance the RED-BLACK tree after VMA insertion */
	if (rb_balance(&task->task_rb, &vma->vm_rb) < 0) {
		return -1;
	}

	if (!parent) {
		list_insert_after(&task->task_mmap, &vma->vm_mmap);
	} else {
                assert(vma_tmp);
		if (dir) {
			list_insert_after(&vma_tmp->vm_mmap, &vma->vm_mmap);
		} else {
			list_insert_before(&vma_tmp->vm_mmap, &vma->vm_mmap);
		}
	}

	return 0;
}


/* Allocates and adds a new VMA for the given task.
 *
 * This function first allocates a new VMA. Then it copies over the given
 * information. The VMA is then inserted into the red-black tree and linked
 * list. Finally, this functions attempts to merge the VMA with the adjacent
 * VMAs.
 *
 * Returns the new VMA if it could be added, NULL otherwise.
 */
struct vma *add_executable_vma(struct task *task, char *name, void *addr,
	size_t size, int flags, void *src, size_t len)
{
	struct vma* vm = kmalloc(sizeof(struct vma));

	if(!vm)panic("Failed to kmalloc a vma");

	vm->vm_base = ROUNDDOWN(addr, PAGE_SIZE);
	vm->vm_end = ROUNDUP(addr + size, PAGE_SIZE);
	vm->vm_len = len;
	vm->vm_name = name;
	vm->vm_flags = flags;
	vm->vm_src = src;
	vm->src_offset = (uintptr_t)addr % PAGE_SIZE;
	
	list_init(&vm->vm_mmap);
	rb_node_init(&vm->vm_rb);

	int ret = insert_vma(task, vm);
	if(ret >= 0){
		
		struct vma* prev_vma = vm;
		
		do{
			prev_vma = merge_vmas(task, vm);

			if(prev_vma){
				vm = prev_vma;
			}
		}while(prev_vma && (prev_vma->vm_end - prev_vma->vm_base) > (vm->vm_end - vm->vm_base));
		return vm;
	}

	return NULL;
}

/* A simplified wrapper to add anonymous VMAs, i.e. VMAs not backed by an
 * executable.
 */
struct vma *add_anonymous_vma(struct task *task, char *name, void *addr,
	size_t size, int flags)
{
	return add_executable_vma(task, name, addr, size, flags, NULL, 0);
}

/* Allocates and adds a new VMA to the requested address or tries to find a
 * suitable free space that is sufficiently large to host the new VMA. If the
 * address is NULL, this function scans the address space from the end to the
 * beginning for such a space. If an address is given, this function scans the
 * address space from the given address to the beginning and then scans from
 * the end to the given address for such a space.
 *
 * Returns the VMA if it could be added. NULL otherwise.
 */
struct vma *add_vma(struct task *task, char *name, void *addr, size_t size,
	int flags)
{
	struct vma *result = add_anonymous_vma(task, name, addr, size, flags);

	if(result){
		return result;
	}

	for(void* base = addr; base - size < base; base -= size){
		struct vma *vma = find_vma(NULL, NULL, &task->task_rb, base);

		if(!vma){
			return NULL;
		}
		if(base + size < vma->vm_base && base < vma->vm_base){
			return add_anonymous_vma(task, name, addr, size, flags);
		}
	}
	for(void* base = (void *)(KERNEL_LIM - size); base - size < base && base - size >= addr; base -= size){
		struct vma *vma = find_vma(NULL, NULL, &task->task_rb, base);

		if(!vma){
			return NULL;
		}
		if(base + size < vma->vm_base && base < vma->vm_base){
			return add_anonymous_vma(task, name, addr, size, flags);
		}
	}
	return NULL;
}
