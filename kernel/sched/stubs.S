.section .text

#include <x86-64/gdt.h>
#include <x86-64/idt.h>
#include <x86-64/memory.h>

#include <cpu.h>

.macro ISR_NOERRCODE int_no
.global isr\int_no
isr\int_no:
	pushq $0
	pushq $\int_no
	jmp isr_common_stub
.endm

.macro ISR_ERRCODE int_no
.global isr\int_no
isr\int_no:
	pushq $\int_no
	jmp isr_common_stub
.endm

ISR_NOERRCODE INT_DIVIDE
ISR_NOERRCODE INT_DEBUG
ISR_NOERRCODE INT_NMI
ISR_NOERRCODE INT_BREAK
ISR_NOERRCODE INT_OVERFLOW
ISR_NOERRCODE INT_BOUND
ISR_NOERRCODE INT_INVALID_OP
ISR_NOERRCODE INT_DEVICE
ISR_ERRCODE   INT_DOUBLE_FAULT
ISR_ERRCODE   INT_TSS
ISR_ERRCODE	  INT_NO_SEG_PRESENT
ISR_ERRCODE   INT_SS
ISR_ERRCODE   INT_GPF
ISR_ERRCODE   INT_PAGE_FAULT
ISR_NOERRCODE INT_FPU
ISR_ERRCODE   INT_ALIGNMENT
ISR_NOERRCODE INT_MCE
ISR_NOERRCODE INT_SIMD
ISR_NOERRCODE INT_SECURITY
ISR_NOERRCODE INT_SYSCALL


isr_common_stub:
	/*push all registers to build int frame*/
	pushq %rax
	pushq %rcx
	pushq %rdx
	pushq %rbx
	pushq %rbp
	pushq %rsi
	pushq %rdi
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	movq %ds, %rax
	pushq %rax

	/*change selectors to kernel*/
	movq $GDT_KDATA, %rax
	movq %rax, %es
	movq %rax, %ds

	/* Jump to the generic interrupt handler. */
	movq %rsp, %rdi
	jmp int_handler



.global syscall64
syscall64:
	/* LAB 3: your bonus code here. */
	/* Store the userspace stack pointer in the per-cpu struct. */
	swapgs
	movq %rsp, %gs:CPU_TSS_RSP3
	/* Load the kernel stack pointer from the per-cpu struct. */
	movq %gs:CPU_TSS_RSP0, %rsp

	/* Store the register state into the per-cpu struct. */
	movq  %gs:CPU_TASK, %rax

	movq %r15, IF_R15(%rax)
	movq %r14, IF_R14(%rax)
	movq %r13, IF_R13(%rax)
	movq %r12, IF_R12(%rax)
	movq %r11, IF_R11(%rax)
	movq %r10, IF_R10(%rax)
	movq %r9, IF_R9(%rax)
	movq %r8, IF_R8(%rax)
	movq %rdi, IF_RDI(%rax)
	movq %rsi, IF_RSI(%rax)
	movq %rbp, IF_RBP(%rax)
	movq %rbx, IF_RBX(%rax)
	movq %rdx, IF_RDX(%rax)
	movq %rcx, IF_RCX(%rax)
	movq $INT_SYSCALL, IF_INO(%rax) //probaly dont need this
	movq $0, IF_ERR(%rax) //probaly dont need this
	
	movq %gs:CPU_TSS_RSP3, %r15
	movq %r15, IF_RSP(%rax) 

	/* Jump to the system call handler. */
	movq %r10, %rcx
	pushq %rbp
	pushq $0
	jmp syscall_handler

.global iret64
iret64:
	/* Restore the register state. */
	movq IF_R15(%rdi), 	%r15
	movq IF_R14(%rdi),  %r14
	movq IF_R13(%rdi),  %r13
	movq IF_R12(%rdi),  %r12
	movq IF_R11(%rdi),  %r11
	movq IF_R10(%rdi),  %r10
	movq IF_R9(%rdi),  	%r9
	movq IF_R8(%rdi),  	%r8
	movq IF_RSI(%rdi),  %rsi
	movq IF_RBP(%rdi),  %rbp
	movq IF_RBX(%rdi),  %rbx
	movq IF_RDX(%rdi),  %rdx
	movq IF_RCX(%rdi),  %rcx
	
	/* Return from the interrupt. */
	//push the stack segment register, without changing %rsp

	movq IF_SS(%rdi), 	%rax
	movq %rax, (%rsp)
	pushq IF_RSP(%rdi)
	pushq IF_RFLAGS(%rdi)
	pushq IF_CS(%rdi)
	pushq IF_RIP(%rdi)

	//restore the data- and extended segment registers
	movq IF_DS(%rdi),  %rax
	movq %rax,	%ds
	movq %rax,  %es

	//restore scratch
	movq IF_RAX(%rdi), %rax
	movq IF_RDI(%rdi), %rdi

	iretq

.global sysret64
sysret64:
	/* LAB 3: your bonus code here. */
	/* Recover the register state. */

	movq IF_R15(%rdi), 	%r15
	movq IF_R14(%rdi),  %r14
	movq IF_R13(%rdi),  %r13
	movq IF_R12(%rdi),  %r12
	movq IF_R11(%rdi),  %r11
	movq IF_R10(%rdi),  %r10
	movq IF_R9(%rdi),  	%r9
	movq IF_R8(%rdi),  	%r8
	movq IF_RSI(%rdi),  %rsi
	movq IF_RBP(%rdi),  %rbp
	movq IF_RBX(%rdi),  %rbx
	movq IF_RDX(%rdi),  %rdx
	movq IF_RCX(%rdi),  %rcx
	movq IF_RSP(%rdi),  %rsp
	movq IF_RAX(%rdi),  %rax

	//should ds be restored??
	//maybe

	/* Return from the system call. */
	swapgs
	sysretq
