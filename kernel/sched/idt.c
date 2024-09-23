#include <assert.h>
#include <stdio.h>

#include <x86-64/asm.h>
#include <x86-64/gdt.h>
#include <x86-64/idt.h>

#include <kernel/sched/idt.h>
#include <kernel/monitor.h>
#include <kernel/sched/syscall.h>

#include <kernel/sched/task.h>
#include <kernel/mem/insert.h>

#define __DEF_INT_HANDLER(int_no) \
	void isr##int_no();

#define DEF_INT_HANDLER(int_no) __DEF_INT_HANDLER(int_no)

DEF_INT_HANDLER(INT_DIVIDE)
DEF_INT_HANDLER(INT_DEBUG)
DEF_INT_HANDLER(INT_NMI)
DEF_INT_HANDLER(INT_BREAK)
DEF_INT_HANDLER(INT_OVERFLOW)
DEF_INT_HANDLER(INT_BOUND)
DEF_INT_HANDLER(INT_INVALID_OP)
DEF_INT_HANDLER(INT_DEVICE)
DEF_INT_HANDLER(INT_DOUBLE_FAULT)
DEF_INT_HANDLER(INT_TSS)
DEF_INT_HANDLER(INT_NO_SEG_PRESENT)
DEF_INT_HANDLER(INT_SS)
DEF_INT_HANDLER(INT_GPF)
DEF_INT_HANDLER(INT_PAGE_FAULT)
DEF_INT_HANDLER(INT_FPU)
DEF_INT_HANDLER(INT_ALIGNMENT)
DEF_INT_HANDLER(INT_MCE)
DEF_INT_HANDLER(INT_SIMD)
DEF_INT_HANDLER(INT_SECURITY)
DEF_INT_HANDLER(INT_SYSCALL)

#define __INT_HANDLER(int_no) isr##int_no
#define INT_HANDLER(int_no) __INT_HANDLER(int_no)

struct int_info{
	void (*handler)();
	char* name;
};

#define INT_INFO(_int_no, _name) {INT_HANDLER(_int_no), _name}


static const struct int_info int_infos[256] = {
	[INT_DIVIDE] = INT_INFO(INT_DIVIDE,  "Divide-by-Zero Error Exception (#DE)"),
	[INT_DEBUG] = INT_INFO(INT_DEBUG, "Debug (#DB)"),
	[INT_NMI] = INT_INFO(INT_NMI, "Non-Maskable Interrupt"),
	[INT_BREAK] = INT_INFO(INT_BREAK, "Breakpoint (#BP)"),
	[INT_OVERFLOW] = INT_INFO(INT_OVERFLOW, "Overflow (#OF)"),
	[INT_BOUND] = INT_INFO(INT_BOUND, "Bound Range (#BR)"),
	[INT_INVALID_OP] = INT_INFO(INT_INVALID_OP, "Invalid Opcode (#UD)"),
	[INT_DEVICE] = INT_INFO(INT_DEVICE, "Device Not Available (#NM)"),
	[INT_DOUBLE_FAULT] = INT_INFO(INT_DOUBLE_FAULT, "Double Fault (#DF)"),
	[INT_TSS] = INT_INFO(INT_TSS, "Invalid TSS (#TS)"),
	[INT_NO_SEG_PRESENT] = INT_INFO(INT_NO_SEG_PRESENT, "Segment Not Present (#NP)"),
	[INT_SS] = INT_INFO(INT_SS, "Stack (#SS)"),
	[INT_GPF] = INT_INFO(INT_GPF, "General Protection (#GP)"),
	[INT_PAGE_FAULT] = INT_INFO(INT_PAGE_FAULT, "Page Fault (#PF)"),
	[INT_FPU] = INT_INFO(INT_FPU, "x86 FPU Floating-Point (#MF)"),
	[INT_ALIGNMENT] = INT_INFO(INT_ALIGNMENT, "Alignment Check (#AC)"),
	[INT_MCE] = INT_INFO(INT_MCE, "Machine Check (#MC)"),
	[INT_SIMD] = INT_INFO(INT_SIMD, "SIMD Floating-Point (#XF)"),
	[INT_SECURITY] = INT_INFO(INT_SECURITY, "Security (#SX)"),
	[INT_SYSCALL] = INT_INFO(INT_SYSCALL, "Sys call")
};

static struct idt_entry entries[256];
static struct idtr idtr = {
	.limit = sizeof(entries) - 1,
	.entries = entries,
};

static const char *get_int_name(unsigned int_no)
{
	if (!int_infos[int_no].name)
		return "Unknown Interrupt";

	return int_infos[int_no].name;
}

void print_int_frame(struct int_frame *frame)
{
	cprintf("INT frame at %p\n", frame);

	/* Print the interrupt number and the name. */
	cprintf(" INT %u: %s\n",
		frame->int_no,
		get_int_name(frame->int_no));

	/* Print the error code. */
	switch (frame->int_no) {
	case INT_PAGE_FAULT:
		cprintf(" CR2 %p\n", read_cr2());
		cprintf(" ERR 0x%016llx (%s, %s, %s)\n",
			frame->err_code,
			frame->err_code & 4 ? "user" : "kernel",
			frame->err_code & 2 ? "write" : "read",
			frame->err_code & 1 ? "protection" : "not present");
		break;
	default:
		cprintf(" ERR 0x%016llx\n", frame->err_code);
	}

	/* Print the general-purpose registers. */
	cprintf(" RAX 0x%016llx"
		" RCX 0x%016llx"
		" RDX 0x%016llx"
		" RBX 0x%016llx\n"
		" RSP 0x%016llx"
		" RBP 0x%016llx"
		" RSI 0x%016llx"
		" RDI 0x%016llx\n"
		" R8  0x%016llx"
		" R9  0x%016llx"
		" R10 0x%016llx"
		" R11 0x%016llx\n"
		" R12 0x%016llx"
		" R13 0x%016llx"
		" R14 0x%016llx"
		" R15 0x%016llx\n",
		frame->rax, frame->rcx, frame->rdx, frame->rbx,
		frame->rsp, frame->rbp, frame->rsi, frame->rdi,
		frame->r8,  frame->r9,  frame->r10, frame->r11,
		frame->r12, frame->r13, frame->r14, frame->r15);

	/* Print the IP, segment selectors and the RFLAGS register. */
	cprintf(" RIP 0x%016llx"
		" RFL 0x%016llx\n"
		" CS  0x%04x"
		"            "
		" DS  0x%04x"
		"            "
		" SS  0x%04x\n",
		frame->rip, frame->rflags,
		frame->cs, frame->ds, frame->ss);
}


/* Set up the interrupt handlers. */
void idt_init(void)
{
	struct idt_entry* entry;
	unsigned int flags = 0;
	struct int_info inf;
	for(int i = 0; i < 256; i++){
		inf = int_infos[i];
		if(inf.handler){
			entry = entries + i;
			
			flags = IDT_PRESENT;
			switch (i)
			{
			case INT_DEBUG:
			case INT_BREAK:
			case INT_OVERFLOW:
				flags |= IDT_TRAP_GATE32;
				break;
			
			default:
				flags |= IDT_INT_GATE32;
				break;
			}

			switch (i)
			{
			case INT_SYSCALL:
			case INT_BREAK:
			case INT_OVERFLOW:
				flags |= IDT_PRIVL(3);
				break;
			
			default:
				flags |= IDT_PRIVL(0);
				break;
			}
			set_idt_entry(entry, inf.handler, flags, GDT_KCODE); 
		}
	}
	load_idt(&idtr);
}

void int_dispatch(struct int_frame *frame)
{
	/* Handle processor exceptions:
	 *  - Fall through to the kernel monitor on a breakpoint.
	 *  - Dispatch page faults to page_fault_handler().
	 *  - Dispatch system calls to syscall().
	 */
	switch (frame->int_no) {

		case INT_BREAK:
			return monitor(frame);

		case INT_PAGE_FAULT:
			return page_fault_handler(frame);

		case INT_SYSCALL:
			print_int_frame(frame);
			frame->rax = syscall(frame->rdi, frame->rsi, frame->rdx, frame->rcx, frame->r8, frame->r9, frame->rbp);
			return iret64(frame);
	
		default: break;
	}

	/* Unexpected trap: The user process or the kernel has a bug. */
	print_int_frame(frame);

	if (frame->cs == GDT_KCODE) {
		panic("unhandled interrupt in kernel");
	} else {
		task_destroy(cur_task);
		return;
	}
}

void int_handler(struct int_frame *frame)
{
	/* The task may have set DF and some versions of GCC rely on DF being
	 * clear. */
	asm volatile("cld" ::: "cc");
	/* Check if interrupts are disabled.
	 * If this assertion fails, DO NOT be tempted to fix it by inserting a
	 * "cli" in the interrupt path.
	 */
	assert(!(read_rflags() & FLAGS_IF));
	/* cprintf("Incoming INT frame at %p\n", frame); */
	if ((frame->cs & 3) == 3) {
		/* Interrupt from user mode. */
		assert(cur_task);

		/* Copy interrupt frame (which is currently on the stack) into
		 * 'cur_task->task_frame', so that running the task will restart at
		 * the point of interrupt. */
		cur_task->task_frame = *frame;

		/* Avoid using the frame on the stack. */
		frame = &cur_task->task_frame;
	}

	/* Dispatch based on the type of interrupt that occurred. */
	int_dispatch(frame);

	/* Return to the current task, which should be running. */
	task_run(cur_task);
}

void page_fault_handler(struct int_frame *frame)
{
	void *fault_va;
	unsigned perm = 0;
	int ret;


	/* Read the CR2 register to find the faulting address. */
	fault_va = (void *)read_cr2();

	/* Handle kernel-mode page faults. */
	if(!(frame->err_code & PAGE_USER)){
		print_int_frame(frame);
		panic("Page fault originated from the kernel");
	}


	/* LAB 3: your code here. */
	/* We have already handled kernel-mode exceptions, so if we get here, the
	 * page fault has happened in user mode.
	 */

	if(!(frame->err_code & PAGE_PRESENT)){
		// LAB 4?
	}

	/* Destroy the task that caused the fault. */
	cprintf("[PID %5u] user fault va %p ip %p\n",
		cur_task->task_pid, fault_va, frame->rip);
	print_int_frame(frame);
	task_destroy(cur_task);
}
