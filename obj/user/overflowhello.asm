
obj/user/overflowhello:	file format elf64-x86-64

Disassembly of section .text:

0000000000800020 <_start>:
; 	movq %r10, %r11
  800020: 4d 89 d3                     	movq	%r10, %r11
; 	movq %r11, %r10
  800023: 4d 89 da                     	movq	%r11, %r10
; 	movabsq $USTACK_TOP, %rax
  800026: 48 b8 00 e0 ff ff ff 7f 00 00	movabsq	$140737488347136, %rax  # imm = 0x7FFFFFFFE000
; 	movq %r10, %r11
  800030: 4d 89 d3                     	movq	%r10, %r11
; 	cmpq %rax, %rsp
  800033: 48 39 c4                     	cmpq	%rax, %rsp
; 	movq %r11, %r10
  800036: 4d 89 da                     	movq	%r11, %r10
; 	jne args_exist
  800039: 75 04                        	jne	0x80003f <args_exist>
; 	xorl %edi, %edi
  80003b: 31 ff                        	xorl	%edi, %edi
; 	xorl %esi, %esi
  80003d: 31 f6                        	xorl	%esi, %esi

000000000080003f <args_exist>:
; 	movq %r10, %r11
  80003f: 4d 89 d3                     	movq	%r10, %r11
; 	call libmain
  800042: e8 29 00 00 00               	callq	0x800070 <libmain>
; 	jmp 1b
  800047: eb fe                        	jmp	0x800047 <args_exist+0x8>
  800049: cc                           	int3
  80004a: cc                           	int3
  80004b: cc                           	int3
  80004c: cc                           	int3
  80004d: cc                           	int3
  80004e: cc                           	int3
  80004f: cc                           	int3

0000000000800050 <main>:
; {
  800050: 55                           	pushq	%rbp
  800051: 48 89 e5                     	movq	%rsp, %rbp
; 	puts(s, 0x800000000000);
  800054: 48 8d 3d af 0f 00 00         	leaq	4015(%rip), %rdi        # 0x80100a <syscall.c+0x80100a>
  80005b: 48 be 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rsi  # imm = 0x800000000000
; 	puts(s, 0x800000000000);
  800065: e8 46 00 00 00               	callq	0x8000b0 <puts>
; }
  80006a: 31 c0                        	xorl	%eax, %eax
  80006c: 5d                           	popq	%rbp
  80006d: c3                           	retq
  80006e: cc                           	int3
  80006f: cc                           	int3

0000000000800070 <libmain>:
; {
  800070: 55                           	pushq	%rbp
  800071: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800074: 85 ff                        	testl	%edi, %edi
  800076: 7e 0d                        	jle	0x800085 <libmain+0x15>
; 		binary_name = argv[0];
  800078: 48 8b 06                     	movq	(%rsi), %rax
  80007b: 48 8d 0d 7e 1f 00 00         	leaq	8062(%rip), %rcx        # 0x802000 <binary_name>
  800082: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800085: e8 c6 ff ff ff               	callq	0x800050 <main>
; 	exit();
  80008a: e8 11 00 00 00               	callq	0x8000a0 <exit>
; }
  80008f: 5d                           	popq	%rbp
  800090: c3                           	retq
  800091: cc                           	int3
  800092: cc                           	int3
  800093: cc                           	int3
  800094: cc                           	int3
  800095: cc                           	int3
  800096: cc                           	int3
  800097: cc                           	int3
  800098: cc                           	int3
  800099: cc                           	int3
  80009a: cc                           	int3
  80009b: cc                           	int3
  80009c: cc                           	int3
  80009d: cc                           	int3
  80009e: cc                           	int3
  80009f: cc                           	int3

00000000008000a0 <exit>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000a4: 31 ff                        	xorl	%edi, %edi
  8000a6: e8 75 00 00 00               	callq	0x800120 <kill>
; }
  8000ab: 5d                           	popq	%rbp
  8000ac: c3                           	retq
  8000ad: cc                           	int3
  8000ae: cc                           	int3
  8000af: cc                           	int3

00000000008000b0 <puts>:
; {
  8000b0: 55                           	pushq	%rbp
  8000b1: 48 89 e5                     	movq	%rsp, %rbp
  8000b4: 48 89 f1                     	movq	%rsi, %rcx
  8000b7: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000ba: 31 ff                        	xorl	%edi, %edi
  8000bc: 31 f6                        	xorl	%esi, %esi
  8000be: e8 0d 00 00 00               	callq	0x8000d0 <syscall>
; }
  8000c3: 5d                           	popq	%rbp
  8000c4: c3                           	retq
  8000c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8000cf: 90                           	nop

00000000008000d0 <syscall>:
; {
  8000d0: 55                           	pushq	%rbp
  8000d1: 48 89 e5                     	movq	%rsp, %rbp
  8000d4: 48 83 ec 10                  	subq	$16, %rsp
  8000d8: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8000da: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000e2: 48 89 d6                     	movq	%rdx, %rsi
  8000e5: 48 89 ca                     	movq	%rcx, %rdx
  8000e8: 31 c9                        	xorl	%ecx, %ecx
  8000ea: 45 31 c0                     	xorl	%r8d, %r8d
  8000ed: 45 31 c9                     	xorl	%r9d, %r9d
  8000f0: e8 63 00 00 00               	callq	0x800158 <do_syscall>
; 	return ret;
  8000f5: 48 83 c4 10                  	addq	$16, %rsp
  8000f9: 5d                           	popq	%rbp
  8000fa: c3                           	retq
  8000fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800100 <getc>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800104: bf 01 00 00 00               	movl	$1, %edi
  800109: 31 f6                        	xorl	%esi, %esi
  80010b: 31 d2                        	xorl	%edx, %edx
  80010d: 31 c9                        	xorl	%ecx, %ecx
  80010f: e8 bc ff ff ff               	callq	0x8000d0 <syscall>
  800114: 5d                           	popq	%rbp
  800115: c3                           	retq
  800116: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800120 <kill>:
; {
  800120: 55                           	pushq	%rbp
  800121: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800124: 48 63 d7                     	movslq	%edi, %rdx
  800127: bf 03 00 00 00               	movl	$3, %edi
  80012c: be 01 00 00 00               	movl	$1, %esi
  800131: 31 c9                        	xorl	%ecx, %ecx
  800133: e8 98 ff ff ff               	callq	0x8000d0 <syscall>
  800138: 5d                           	popq	%rbp
  800139: c3                           	retq
  80013a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800140 <getpid>:
; {
  800140: 55                           	pushq	%rbp
  800141: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800144: bf 02 00 00 00               	movl	$2, %edi
  800149: 31 f6                        	xorl	%esi, %esi
  80014b: 31 d2                        	xorl	%edx, %edx
  80014d: 31 c9                        	xorl	%ecx, %ecx
  80014f: e8 7c ff ff ff               	callq	0x8000d0 <syscall>
  800154: 5d                           	popq	%rbp
  800155: c3                           	retq
  800156: cc                           	int3
  800157: cc                           	int3

0000000000800158 <do_syscall>:
; 	pushq %rbp
  800158: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800159: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  80015e: cd 80                        	int	$128
; 	popq %rbp
  800160: 5d                           	popq	%rbp
; 	retq
  800161: c3                           	retq
