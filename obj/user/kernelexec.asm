
obj/user/kernelexec:	file format elf64-x86-64

Disassembly of section .text:

0000000000800020 <_start>:
; 	movabsq $USTACK_TOP, %rax
  800020: 48 b8 00 e0 ff ff ff 7f 00 00	movabsq	$140737488347136, %rax  # imm = 0x7FFFFFFFE000
; 	cmpq %rax, %rsp
  80002a: 48 39 c4                     	cmpq	%rax, %rsp
; 	jne args_exist
  80002d: 75 04                        	jne	0x800033 <args_exist>
; 	xorl %edi, %edi
  80002f: 31 ff                        	xorl	%edi, %edi
; 	xorl %esi, %esi
  800031: 31 f6                        	xorl	%esi, %esi

0000000000800033 <args_exist>:
; 	call libmain
  800033: e8 38 00 00 00               	callq	0x800070 <libmain>
; 	jmp 1b
  800038: eb fe                        	jmp	0x800038 <args_exist+0x5>
  80003a: cc                           	int3
  80003b: cc                           	int3
  80003c: cc                           	int3
  80003d: cc                           	int3
  80003e: cc                           	int3
  80003f: cc                           	int3

0000000000800040 <main>:
; {
  800040: 55                           	pushq	%rbp
  800041: 48 89 e5                     	movq	%rsp, %rbp
  800044: 48 83 ec 20                  	subq	$32, %rsp
  800048: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  80004f: 89 7d f8                     	movl	%edi, -8(%rbp)
  800052: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	void (* func)(void) = (void (*)(void))0xffff800000100000;
  800056: 48 b8 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %rax # imm = 0xFFFF800000100000
  800060: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	func();
  800064: ff 55 e8                     	callq	*-24(%rbp)
; 	return 0;
  800067: 31 c0                        	xorl	%eax, %eax
  800069: 48 83 c4 20                  	addq	$32, %rsp
  80006d: 5d                           	popq	%rbp
  80006e: c3                           	retq
  80006f: cc                           	int3

0000000000800070 <libmain>:
; {
  800070: 55                           	pushq	%rbp
  800071: 48 89 e5                     	movq	%rsp, %rbp
  800074: 48 83 ec 10                  	subq	$16, %rsp
  800078: 89 7d fc                     	movl	%edi, -4(%rbp)
  80007b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80007f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  800083: 0f 8e 11 00 00 00            	jle	0x80009a <libmain+0x2a>
; 		binary_name = argv[0];
  800089: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80008d: 48 8b 08                     	movq	(%rax), %rcx
  800090: 48 8d 05 69 2f 00 00         	leaq	12137(%rip), %rax       # 0x803000 <binary_name>
  800097: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  80009a: 8b 7d fc                     	movl	-4(%rbp), %edi
  80009d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8000a1: e8 9a ff ff ff               	callq	0x800040 <main>
; 	exit();
  8000a6: e8 15 00 00 00               	callq	0x8000c0 <exit>
; }
  8000ab: 48 83 c4 10                  	addq	$16, %rsp
  8000af: 5d                           	popq	%rbp
  8000b0: c3                           	retq
  8000b1: cc                           	int3
  8000b2: cc                           	int3
  8000b3: cc                           	int3
  8000b4: cc                           	int3
  8000b5: cc                           	int3
  8000b6: cc                           	int3
  8000b7: cc                           	int3
  8000b8: cc                           	int3
  8000b9: cc                           	int3
  8000ba: cc                           	int3
  8000bb: cc                           	int3
  8000bc: cc                           	int3
  8000bd: cc                           	int3
  8000be: cc                           	int3
  8000bf: cc                           	int3

00000000008000c0 <exit>:
; {
  8000c0: 55                           	pushq	%rbp
  8000c1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000c4: 31 ff                        	xorl	%edi, %edi
  8000c6: e8 15 01 00 00               	callq	0x8001e0 <kill>
; }
  8000cb: 5d                           	popq	%rbp
  8000cc: c3                           	retq
  8000cd: cc                           	int3
  8000ce: cc                           	int3
  8000cf: cc                           	int3

00000000008000d0 <puts>:
; {
  8000d0: 55                           	pushq	%rbp
  8000d1: 48 89 e5                     	movq	%rsp, %rbp
  8000d4: 48 83 ec 20                  	subq	$32, %rsp
  8000d8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000dc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000e0: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8000e4: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8000e8: 31 f6                        	xorl	%esi, %esi
  8000ea: 31 c0                        	xorl	%eax, %eax
  8000ec: 41 89 c1                     	movl	%eax, %r9d
  8000ef: 89 f7                        	movl	%esi, %edi
  8000f1: 4d 89 c8                     	movq	%r9, %r8
  8000f4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000fc: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800105: e8 06 00 00 00               	callq	0x800110 <syscall>
; }
  80010a: 48 83 c4 20                  	addq	$32, %rsp
  80010e: 5d                           	popq	%rbp
  80010f: c3                           	retq

0000000000800110 <syscall>:
; {
  800110: 55                           	pushq	%rbp
  800111: 48 89 e5                     	movq	%rsp, %rbp
  800114: 48 83 ec 40                  	subq	$64, %rsp
  800118: 48 8b 45 18                  	movq	24(%rbp), %rax
  80011c: 48 8b 45 10                  	movq	16(%rbp), %rax
  800120: 89 7d fc                     	movl	%edi, -4(%rbp)
  800123: 89 75 f8                     	movl	%esi, -8(%rbp)
  800126: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80012a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80012e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  800132: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800136: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80013a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80013e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800142: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800146: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80014a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80014e: 48 8b 45 18                  	movq	24(%rbp), %rax
  800152: 48 89 04 24                  	movq	%rax, (%rsp)
  800156: e8 01 01 00 00               	callq	0x80025c <do_syscall>
  80015b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80015f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  800163: 0f 84 2c 00 00 00            	je	0x800195 <syscall+0x85>
  800169: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80016e: 0f 83 21 00 00 00            	jae	0x800195 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  800174: 8b 4d fc                     	movl	-4(%rbp), %ecx
  800177: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80017b: 48 8d 3d 3c 1f 00 00         	leaq	7996(%rip), %rdi        # 0x8020be <syscall.c+0x8020be>
  800182: be 1f 00 00 00               	movl	$31, %esi
  800187: 48 8d 15 ce 1e 00 00         	leaq	7886(%rip), %rdx        # 0x80205c <syscall.c+0x80205c>
  80018e: b0 00                        	movb	$0, %al
  800190: e8 db 00 00 00               	callq	0x800270 <_panic>
; 	return ret;
  800195: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800199: 48 83 c4 40                  	addq	$64, %rsp
  80019d: 5d                           	popq	%rbp
  80019e: c3                           	retq
  80019f: 90                           	nop

00000000008001a0 <getc>:
; {
  8001a0: 55                           	pushq	%rbp
  8001a1: 48 89 e5                     	movq	%rsp, %rbp
  8001a4: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  8001a8: bf 01 00 00 00               	movl	$1, %edi
  8001ad: 31 f6                        	xorl	%esi, %esi
  8001af: 31 c0                        	xorl	%eax, %eax
  8001b1: 41 89 c1                     	movl	%eax, %r9d
  8001b4: 4c 89 ca                     	movq	%r9, %rdx
  8001b7: 4c 89 c9                     	movq	%r9, %rcx
  8001ba: 4d 89 c8                     	movq	%r9, %r8
  8001bd: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001c5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001ce: e8 3d ff ff ff               	callq	0x800110 <syscall>
  8001d3: 48 83 c4 10                  	addq	$16, %rsp
  8001d7: 5d                           	popq	%rbp
  8001d8: c3                           	retq
  8001d9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008001e0 <kill>:
; {
  8001e0: 55                           	pushq	%rbp
  8001e1: 48 89 e5                     	movq	%rsp, %rbp
  8001e4: 48 83 ec 20                  	subq	$32, %rsp
  8001e8: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8001eb: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  8001ef: bf 03 00 00 00               	movl	$3, %edi
  8001f4: be 01 00 00 00               	movl	$1, %esi
  8001f9: 31 c0                        	xorl	%eax, %eax
  8001fb: 41 89 c1                     	movl	%eax, %r9d
  8001fe: 4c 89 c9                     	movq	%r9, %rcx
  800201: 4d 89 c8                     	movq	%r9, %r8
  800204: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80020c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800215: e8 f6 fe ff ff               	callq	0x800110 <syscall>
  80021a: 48 83 c4 20                  	addq	$32, %rsp
  80021e: 5d                           	popq	%rbp
  80021f: c3                           	retq

0000000000800220 <getpid>:
; {
  800220: 55                           	pushq	%rbp
  800221: 48 89 e5                     	movq	%rsp, %rbp
  800224: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800228: bf 02 00 00 00               	movl	$2, %edi
  80022d: 31 f6                        	xorl	%esi, %esi
  80022f: 31 c0                        	xorl	%eax, %eax
  800231: 41 89 c1                     	movl	%eax, %r9d
  800234: 4c 89 ca                     	movq	%r9, %rdx
  800237: 4c 89 c9                     	movq	%r9, %rcx
  80023a: 4d 89 c8                     	movq	%r9, %r8
  80023d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800245: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80024e: e8 bd fe ff ff               	callq	0x800110 <syscall>
  800253: 48 83 c4 10                  	addq	$16, %rsp
  800257: 5d                           	popq	%rbp
  800258: c3                           	retq
  800259: cc                           	int3
  80025a: cc                           	int3
  80025b: cc                           	int3

000000000080025c <do_syscall>:
; 	pushq %rbp
  80025c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80025d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800262: cd 80                        	int	$128
; 	popq %rbp
  800264: 5d                           	popq	%rbp
; 	retq
  800265: c3                           	retq
  800266: cc                           	int3
  800267: cc                           	int3
  800268: cc                           	int3
  800269: cc                           	int3
  80026a: cc                           	int3
  80026b: cc                           	int3
  80026c: cc                           	int3
  80026d: cc                           	int3
  80026e: cc                           	int3
  80026f: cc                           	int3

0000000000800270 <_panic>:
; {
  800270: 55                           	pushq	%rbp
  800271: 48 89 e5                     	movq	%rsp, %rbp
  800274: 48 83 ec 60                  	subq	$96, %rsp
  800278: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80027c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800280: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800284: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800288: 89 75 f4                     	movl	%esi, -12(%rbp)
  80028b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80028f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800293: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800297: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80029b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80029f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  8002a3: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  8002aa: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  8002b0: e8 6b ff ff ff               	callq	0x800220 <getpid>
  8002b5: 89 c6                        	movl	%eax, %esi
  8002b7: 48 8d 05 42 2d 00 00         	leaq	11586(%rip), %rax       # 0x803000 <binary_name>
  8002be: 48 8b 10                     	movq	(%rax), %rdx
  8002c1: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8002c5: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8002c9: 48 8d 3d 4e 1d 00 00         	leaq	7502(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8002d0: b0 00                        	movb	$0, %al
  8002d2: e8 09 01 00 00               	callq	0x8003e0 <printf>
; 	vprintf(fmt, ap);
  8002d7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8002db: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8002df: e8 1c 00 00 00               	callq	0x800300 <vprintf>
; 	printf("\n");
  8002e4: 48 8d 3d ca 1d 00 00         	leaq	7626(%rip), %rdi        # 0x8020b5 <syscall.c+0x8020b5>
  8002eb: b0 00                        	movb	$0, %al
  8002ed: e8 ee 00 00 00               	callq	0x8003e0 <printf>
; 		asm volatile("int3");
  8002f2: cc                           	int3
; 	while (1) {
  8002f3: e9 fa ff ff ff               	jmp	0x8002f2 <_panic+0x82>
  8002f8: cc                           	int3
  8002f9: cc                           	int3
  8002fa: cc                           	int3
  8002fb: cc                           	int3
  8002fc: cc                           	int3
  8002fd: cc                           	int3
  8002fe: cc                           	int3
  8002ff: cc                           	int3

0000000000800300 <vprintf>:
; {
  800300: 55                           	pushq	%rbp
  800301: 48 89 e5                     	movq	%rsp, %rbp
  800304: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  80030b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80030f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800313: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80031d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800327: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80032e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800332: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800336: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800370 <putch>
  80033d: e8 fe 00 00 00               	callq	0x800440 <vprintfmt>
; 	puts(b.buf, b.idx);
  800342: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800349: 48 83 c7 08                  	addq	$8, %rdi
  80034d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800354: e8 77 fd ff ff               	callq	0x8000d0 <puts>
; 	return b.cnt;
  800359: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80035f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800366: 5d                           	popq	%rbp
  800367: c3                           	retq
  800368: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800370 <putch>:
; {
  800370: 55                           	pushq	%rbp
  800371: 48 89 e5                     	movq	%rsp, %rbp
  800374: 48 83 ec 10                  	subq	$16, %rsp
  800378: 89 7d fc                     	movl	%edi, -4(%rbp)
  80037b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80037f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800382: 88 c2                        	movb	%al, %dl
  800384: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800388: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80038c: 8b 0e                        	movl	(%rsi), %ecx
  80038e: 89 cf                        	movl	%ecx, %edi
  800390: 83 c7 01                     	addl	$1, %edi
  800393: 89 3e                        	movl	%edi, (%rsi)
  800395: 48 63 c9                     	movslq	%ecx, %rcx
  800398: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80039c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003a0: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  8003a6: 0f 85 1e 00 00 00            	jne	0x8003ca <putch+0x5a>
; 		puts(b->buf, b->idx);
  8003ac: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8003b0: 48 83 c7 08                  	addq	$8, %rdi
  8003b4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003b8: 48 63 30                     	movslq	(%rax), %rsi
  8003bb: e8 10 fd ff ff               	callq	0x8000d0 <puts>
; 		b->idx = 0;
  8003c0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003c4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8003ca: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003ce: 8b 48 04                     	movl	4(%rax), %ecx
  8003d1: 83 c1 01                     	addl	$1, %ecx
  8003d4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8003d7: 48 83 c4 10                  	addq	$16, %rsp
  8003db: 5d                           	popq	%rbp
  8003dc: c3                           	retq
  8003dd: 0f 1f 00                     	nopl	(%rax)

00000000008003e0 <printf>:
; {
  8003e0: 55                           	pushq	%rbp
  8003e1: 48 89 e5                     	movq	%rsp, %rbp
  8003e4: 48 83 ec 60                  	subq	$96, %rsp
  8003e8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8003ec: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8003f0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8003f4: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  8003f8: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  8003fc: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800400: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800404: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800408: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80040c: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800410: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800417: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80041e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800422: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800426: e8 d5 fe ff ff               	callq	0x800300 <vprintf>
  80042b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80042e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800431: 48 83 c4 60                  	addq	$96, %rsp
  800435: 5d                           	popq	%rbp
  800436: c3                           	retq
  800437: cc                           	int3
  800438: cc                           	int3
  800439: cc                           	int3
  80043a: cc                           	int3
  80043b: cc                           	int3
  80043c: cc                           	int3
  80043d: cc                           	int3
  80043e: cc                           	int3
  80043f: cc                           	int3

0000000000800440 <vprintfmt>:
; {
  800440: 55                           	pushq	%rbp
  800441: 48 89 e5                     	movq	%rsp, %rbp
  800444: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80044b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80044f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800453: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800457: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80045b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80045f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800463: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800467: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80046b: 48 8b 0a                     	movq	(%rdx), %rcx
  80046e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800472: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800476: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800479: e9 00 00 00 00               	jmp	0x80047e <vprintfmt+0x3e>
  80047e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800482: 48 89 c1                     	movq	%rax, %rcx
  800485: 48 83 c1 01                  	addq	$1, %rcx
  800489: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80048d: 0f b6 00                     	movzbl	(%rax), %eax
  800490: 89 45 b4                     	movl	%eax, -76(%rbp)
  800493: 83 f8 25                     	cmpl	$37, %eax
  800496: 0f 84 25 00 00 00            	je	0x8004c1 <vprintfmt+0x81>
; 			if (ch == '\0')
  80049c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  8004a0: 0f 85 09 00 00 00            	jne	0x8004af <vprintfmt+0x6f>
; 				return;
  8004a6: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  8004ad: 5d                           	popq	%rbp
  8004ae: c3                           	retq
; 			putch(ch, putdat);
  8004af: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8004b3: 8b 7d b4                     	movl	-76(%rbp), %edi
  8004b6: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8004ba: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8004bc: e9 bd ff ff ff               	jmp	0x80047e <vprintfmt+0x3e>
; 		padc = ' ';
  8004c1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8004c5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8004cc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8004d3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8004da: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8004e1: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004e5: 48 89 c1                     	movq	%rax, %rcx
  8004e8: 48 83 c1 01                  	addq	$1, %rcx
  8004ec: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8004f0: 0f b6 00                     	movzbl	(%rax), %eax
  8004f3: 89 45 b4                     	movl	%eax, -76(%rbp)
  8004f6: 83 c0 dd                     	addl	$-35, %eax
  8004f9: 89 c1                        	movl	%eax, %ecx
  8004fb: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  8004ff: 83 e8 55                     	subl	$85, %eax
  800502: 0f 87 c1 05 00 00            	ja	0x800ac9 <vprintfmt+0x689>
  800508: 48 8b 45 88                  	movq	-120(%rbp), %rax
  80050c: 48 8d 0d 01 1c 00 00         	leaq	7169(%rip), %rcx        # 0x802114 <syscall.c+0x802114>
  800513: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800517: 48 01 c8                     	addq	%rcx, %rax
  80051a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80051c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800520: e9 bc ff ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			padc = '0';
  800525: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800529: e9 b3 ff ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80052e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800535: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800539: 03 45 b4                     	addl	-76(%rbp), %eax
  80053c: 83 e8 30                     	subl	$48, %eax
  80053f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800542: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800546: 0f be 00                     	movsbl	(%rax), %eax
  800549: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80054c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800550: 0f 8c 0a 00 00 00            	jl	0x800560 <vprintfmt+0x120>
  800556: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80055a: 0f 8e 05 00 00 00            	jle	0x800565 <vprintfmt+0x125>
; 					break;
  800560: e9 16 00 00 00               	jmp	0x80057b <vprintfmt+0x13b>
; 			}
  800565: e9 00 00 00 00               	jmp	0x80056a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80056a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80056e: 48 83 c0 01                  	addq	$1, %rax
  800572: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800576: e9 ba ff ff ff               	jmp	0x800535 <vprintfmt+0xf5>
; 			goto process_precision;
  80057b: e9 8c 00 00 00               	jmp	0x80060c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800580: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800584: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80058b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80058e: 89 45 84                     	movl	%eax, -124(%rbp)
  800591: 83 f8 28                     	cmpl	$40, %eax
  800594: 0f 87 22 00 00 00            	ja	0x8005bc <vprintfmt+0x17c>
  80059a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  8005a1: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  8005a4: 48 63 c2                     	movslq	%edx, %rax
  8005a7: 48 03 41 10                  	addq	16(%rcx), %rax
  8005ab: 83 c2 08                     	addl	$8, %edx
  8005ae: 89 11                        	movl	%edx, (%rcx)
  8005b0: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005b7: e9 1d 00 00 00               	jmp	0x8005d9 <vprintfmt+0x199>
  8005bc: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8005c3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005c7: 48 89 d0                     	movq	%rdx, %rax
  8005ca: 48 83 c2 08                  	addq	$8, %rdx
  8005ce: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005d2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005d9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  8005e0: 8b 00                        	movl	(%rax), %eax
  8005e2: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  8005e5: e9 22 00 00 00               	jmp	0x80060c <vprintfmt+0x1cc>
; 			if (width < 0)
  8005ea: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005ee: 0f 8d 07 00 00 00            	jge	0x8005fb <vprintfmt+0x1bb>
; 				width = 0;
  8005f4: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  8005fb: e9 e1 fe ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			altflag = 1;
  800600: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  800607: e9 d5 fe ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			if (width < 0)
  80060c: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800610: 0f 8d 0d 00 00 00            	jge	0x800623 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800616: 8b 45 98                     	movl	-104(%rbp), %eax
  800619: 89 45 9c                     	movl	%eax, -100(%rbp)
  80061c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800623: e9 b9 fe ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			lflag++;
  800628: 8b 45 a0                     	movl	-96(%rbp), %eax
  80062b: 83 c0 01                     	addl	$1, %eax
  80062e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800631: e9 ab fe ff ff               	jmp	0x8004e1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800636: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80063a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800641: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800645: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80064c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80064f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800655: 83 f8 28                     	cmpl	$40, %eax
  800658: 0f 87 25 00 00 00            	ja	0x800683 <vprintfmt+0x243>
  80065e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800665: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80066b: 48 63 c2                     	movslq	%edx, %rax
  80066e: 48 03 41 10                  	addq	16(%rcx), %rax
  800672: 83 c2 08                     	addl	$8, %edx
  800675: 89 11                        	movl	%edx, (%rcx)
  800677: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80067e: e9 1d 00 00 00               	jmp	0x8006a0 <vprintfmt+0x260>
  800683: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80068a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80068e: 48 89 d0                     	movq	%rdx, %rax
  800691: 48 83 c2 08                  	addq	$8, %rdx
  800695: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800699: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  8006a0: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  8006a7: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  8006ae: 8b 39                        	movl	(%rcx), %edi
  8006b0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006b4: ff d0                        	callq	*%rax
; 			break;
  8006b6: e9 55 04 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  8006bb: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8006bf: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8006c6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8006c9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8006cf: 83 f8 28                     	cmpl	$40, %eax
  8006d2: 0f 87 25 00 00 00            	ja	0x8006fd <vprintfmt+0x2bd>
  8006d8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8006df: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  8006e5: 48 63 c2                     	movslq	%edx, %rax
  8006e8: 48 03 41 10                  	addq	16(%rcx), %rax
  8006ec: 83 c2 08                     	addl	$8, %edx
  8006ef: 89 11                        	movl	%edx, (%rcx)
  8006f1: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8006f8: e9 1d 00 00 00               	jmp	0x80071a <vprintfmt+0x2da>
  8006fd: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  800704: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800708: 48 89 d0                     	movq	%rdx, %rax
  80070b: 48 83 c2 08                  	addq	$8, %rdx
  80070f: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800713: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80071a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800721: 8b 00                        	movl	(%rax), %eax
  800723: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800726: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80072a: 0f 8d 08 00 00 00            	jge	0x800738 <vprintfmt+0x2f8>
; 				err = -err;
  800730: 31 c0                        	xorl	%eax, %eax
  800732: 2b 45 b0                     	subl	-80(%rbp), %eax
  800735: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800738: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80073c: 48 83 f8 09                  	cmpq	$9, %rax
  800740: 0f 83 1d 00 00 00            	jae	0x800763 <vprintfmt+0x323>
  800746: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80074a: 48 8d 05 cf f8 9f ff         	leaq	-6293297(%rip), %rax    # 0x200020 <error_string>
  800751: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800755: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800759: 48 83 f8 00                  	cmpq	$0, %rax
  80075d: 0f 85 1e 00 00 00            	jne	0x800781 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800763: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800767: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80076b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80076e: 48 8d 15 26 19 00 00         	leaq	6438(%rip), %rdx        # 0x80209b <syscall.c+0x80209b>
  800775: b0 00                        	movb	$0, %al
  800777: e8 a4 03 00 00               	callq	0x800b20 <printfmt>
  80077c: e9 1a 00 00 00               	jmp	0x80079b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800781: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800785: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800789: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80078d: 48 8d 15 87 18 00 00         	leaq	6279(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  800794: b0 00                        	movb	$0, %al
  800796: e8 85 03 00 00               	callq	0x800b20 <printfmt>
; 			break;
  80079b: e9 70 03 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007a0: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8007a4: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  8007ab: 8b 45 c0                     	movl	-64(%rbp), %eax
  8007ae: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  8007b4: 83 f8 28                     	cmpl	$40, %eax
  8007b7: 0f 87 25 00 00 00            	ja	0x8007e2 <vprintfmt+0x3a2>
  8007bd: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8007c4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007ca: 48 63 c2                     	movslq	%edx, %rax
  8007cd: 48 03 41 10                  	addq	16(%rcx), %rax
  8007d1: 83 c2 08                     	addl	$8, %edx
  8007d4: 89 11                        	movl	%edx, (%rcx)
  8007d6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007dd: e9 1d 00 00 00               	jmp	0x8007ff <vprintfmt+0x3bf>
  8007e2: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007e9: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8007ed: 48 89 d0                     	movq	%rdx, %rax
  8007f0: 48 83 c2 08                  	addq	$8, %rdx
  8007f4: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8007f8: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007ff: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800806: 48 8b 00                     	movq	(%rax), %rax
  800809: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  80080d: 48 83 f8 00                  	cmpq	$0, %rax
  800811: 0f 85 0b 00 00 00            	jne	0x800822 <vprintfmt+0x3e2>
; 				p = "(null)";
  800817: 48 8d 05 99 18 00 00         	leaq	6297(%rip), %rax        # 0x8020b7 <syscall.c+0x8020b7>
  80081e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800822: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800826: 0f 8e 4f 00 00 00            	jle	0x80087b <vprintfmt+0x43b>
  80082c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800830: 83 f8 2d                     	cmpl	$45, %eax
  800833: 0f 84 42 00 00 00            	je	0x80087b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800839: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80083d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800841: e8 da 07 00 00               	callq	0x801020 <strnlen>
  800846: 89 c1                        	movl	%eax, %ecx
  800848: 8b 45 9c                     	movl	-100(%rbp), %eax
  80084b: 29 c8                        	subl	%ecx, %eax
  80084d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800850: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800854: 0f 8e 1c 00 00 00            	jle	0x800876 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80085a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80085e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800862: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800866: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800868: 8b 45 9c                     	movl	-100(%rbp), %eax
  80086b: 83 c0 ff                     	addl	$-1, %eax
  80086e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800871: e9 da ff ff ff               	jmp	0x800850 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800876: e9 00 00 00 00               	jmp	0x80087b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80087b: e9 00 00 00 00               	jmp	0x800880 <vprintfmt+0x440>
  800880: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800884: 48 89 c1                     	movq	%rax, %rcx
  800887: 48 83 c1 01                  	addq	$1, %rcx
  80088b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80088f: 0f be 08                     	movsbl	(%rax), %ecx
  800892: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800895: 31 c0                        	xorl	%eax, %eax
  800897: 83 f9 00                     	cmpl	$0, %ecx
  80089a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008a0: 0f 84 33 00 00 00            	je	0x8008d9 <vprintfmt+0x499>
  8008a6: b0 01                        	movb	$1, %al
  8008a8: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  8008ac: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008b2: 0f 8c 15 00 00 00            	jl	0x8008cd <vprintfmt+0x48d>
  8008b8: 8b 45 98                     	movl	-104(%rbp), %eax
  8008bb: 83 c0 ff                     	addl	$-1, %eax
  8008be: 89 45 98                     	movl	%eax, -104(%rbp)
  8008c1: 83 f8 00                     	cmpl	$0, %eax
  8008c4: 0f 9d c0                     	setge	%al
  8008c7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008cd: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8008d3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008d9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008df: a8 01                        	testb	$1, %al
  8008e1: 0f 85 05 00 00 00            	jne	0x8008ec <vprintfmt+0x4ac>
  8008e7: e9 52 00 00 00               	jmp	0x80093e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008ec: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  8008f0: 0f 84 28 00 00 00            	je	0x80091e <vprintfmt+0x4de>
  8008f6: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  8008fa: 0f 8c 0a 00 00 00            	jl	0x80090a <vprintfmt+0x4ca>
  800900: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  800904: 0f 8e 14 00 00 00            	jle	0x80091e <vprintfmt+0x4de>
; 					putch('?', putdat);
  80090a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80090e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800912: bf 3f 00 00 00               	movl	$63, %edi
  800917: ff d0                        	callq	*%rax
  800919: e9 0d 00 00 00               	jmp	0x80092b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80091e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800922: 8b 7d b4                     	movl	-76(%rbp), %edi
  800925: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800929: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80092b: e9 00 00 00 00               	jmp	0x800930 <vprintfmt+0x4f0>
; 					width--)
  800930: 8b 45 9c                     	movl	-100(%rbp), %eax
  800933: 83 c0 ff                     	addl	$-1, %eax
  800936: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800939: e9 42 ff ff ff               	jmp	0x800880 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80093e: e9 00 00 00 00               	jmp	0x800943 <vprintfmt+0x503>
  800943: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800947: 0f 8e 1d 00 00 00            	jle	0x80096a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80094d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800951: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800955: bf 20 00 00 00               	movl	$32, %edi
  80095a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80095c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80095f: 83 c0 ff                     	addl	$-1, %eax
  800962: 89 45 9c                     	movl	%eax, -100(%rbp)
  800965: e9 d9 ff ff ff               	jmp	0x800943 <vprintfmt+0x503>
; 			break;
  80096a: e9 a1 01 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80096f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800972: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800976: e8 05 02 00 00               	callq	0x800b80 <getint>
  80097b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80097f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800984: 0f 8d 19 00 00 00            	jge	0x8009a3 <vprintfmt+0x563>
; 				putch('-', putdat);
  80098a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80098e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800992: bf 2d 00 00 00               	movl	$45, %edi
  800997: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800999: 31 c0                        	xorl	%eax, %eax
  80099b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80099f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009a3: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009aa: e9 e6 00 00 00               	jmp	0x800a95 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009af: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009b2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009b6: e8 f5 02 00 00               	callq	0x800cb0 <getuint>
  8009bb: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009bf: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009c6: e9 ca 00 00 00               	jmp	0x800a95 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009cb: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009ce: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009d2: e8 d9 02 00 00               	callq	0x800cb0 <getuint>
  8009d7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8009db: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  8009e2: e9 ae 00 00 00               	jmp	0x800a95 <vprintfmt+0x655>
; 			putch('0', putdat);
  8009e7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009eb: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009ef: bf 30 00 00 00               	movl	$48, %edi
  8009f4: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  8009f6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009fa: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009fe: bf 78 00 00 00               	movl	$120, %edi
  800a03: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800a05: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800a09: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800a10: 8b 45 c0                     	movl	-64(%rbp), %eax
  800a13: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800a19: 83 f8 28                     	cmpl	$40, %eax
  800a1c: 0f 87 25 00 00 00            	ja	0x800a47 <vprintfmt+0x607>
  800a22: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800a29: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  800a2f: 48 63 c2                     	movslq	%edx, %rax
  800a32: 48 03 41 10                  	addq	16(%rcx), %rax
  800a36: 83 c2 08                     	addl	$8, %edx
  800a39: 89 11                        	movl	%edx, (%rcx)
  800a3b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a42: e9 1d 00 00 00               	jmp	0x800a64 <vprintfmt+0x624>
  800a47: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  800a4e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a52: 48 89 d0                     	movq	%rdx, %rax
  800a55: 48 83 c2 08                  	addq	$8, %rdx
  800a59: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a5d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a64: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  800a6b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  800a6e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a72: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a79: e9 17 00 00 00               	jmp	0x800a95 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a7e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a81: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a85: e8 26 02 00 00               	callq	0x800cb0 <getuint>
  800a8a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a8e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800a95: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a99: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a9d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800aa1: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800aa4: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800aa8: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800aad: e8 2e 03 00 00               	callq	0x800de0 <printnum>
; 			break;
  800ab2: e9 59 00 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800ab7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800abb: 8b 7d b4                     	movl	-76(%rbp), %edi
  800abe: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ac2: ff d0                        	callq	*%rax
; 			break;
  800ac4: e9 47 00 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800ac9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800acd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ad1: bf 25 00 00 00               	movl	$37, %edi
  800ad6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800ad8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800adc: 48 83 c0 ff                  	addq	$-1, %rax
  800ae0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800ae4: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ae8: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800aec: 83 f8 25                     	cmpl	$37, %eax
  800aef: 0f 84 16 00 00 00            	je	0x800b0b <vprintfmt+0x6cb>
  800af5: e9 00 00 00 00               	jmp	0x800afa <vprintfmt+0x6ba>
  800afa: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800afe: 48 83 c0 ff                  	addq	$-1, %rax
  800b02: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800b06: e9 d9 ff ff ff               	jmp	0x800ae4 <vprintfmt+0x6a4>
; 			break;
  800b0b: e9 00 00 00 00               	jmp	0x800b10 <vprintfmt+0x6d0>
; 	while (1) {
  800b10: e9 64 f9 ff ff               	jmp	0x800479 <vprintfmt+0x39>
  800b15: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b1f: 90                           	nop

0000000000800b20 <printfmt>:
; {
  800b20: 55                           	pushq	%rbp
  800b21: 48 89 e5                     	movq	%rsp, %rbp
  800b24: 48 83 ec 60                  	subq	$96, %rsp
  800b28: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800b2c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800b30: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800b34: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800b38: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800b3c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800b40: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800b44: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b48: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800b4c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b50: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800b57: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800b5e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800b62: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800b66: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800b6a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800b6e: e8 cd f8 ff ff               	callq	0x800440 <vprintfmt>
; }
  800b73: 48 83 c4 60                  	addq	$96, %rsp
  800b77: 5d                           	popq	%rbp
  800b78: c3                           	retq
  800b79: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b80 <getint>:
; {
  800b80: 55                           	pushq	%rbp
  800b81: 48 89 e5                     	movq	%rsp, %rbp
  800b84: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b88: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b8b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b8f: 0f 8c 59 00 00 00            	jl	0x800bee <getint+0x6e>
; 		return va_arg(*ap, long long);
  800b95: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b99: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b9d: 8b 00                        	movl	(%rax), %eax
  800b9f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800ba2: 83 f8 28                     	cmpl	$40, %eax
  800ba5: 0f 87 1c 00 00 00            	ja	0x800bc7 <getint+0x47>
  800bab: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800baf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800bb2: 48 63 c2                     	movslq	%edx, %rax
  800bb5: 48 03 41 10                  	addq	16(%rcx), %rax
  800bb9: 83 c2 08                     	addl	$8, %edx
  800bbc: 89 11                        	movl	%edx, (%rcx)
  800bbe: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bc2: e9 17 00 00 00               	jmp	0x800bde <getint+0x5e>
  800bc7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800bcb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bcf: 48 89 d0                     	movq	%rdx, %rax
  800bd2: 48 83 c2 08                  	addq	$8, %rdx
  800bd6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bda: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bde: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800be2: 48 8b 00                     	movq	(%rax), %rax
  800be5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800be9: e9 b7 00 00 00               	jmp	0x800ca5 <getint+0x125>
; 	else if (lflag)
  800bee: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800bf2: 0f 84 59 00 00 00            	je	0x800c51 <getint+0xd1>
; 		return va_arg(*ap, long);
  800bf8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bfc: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800c00: 8b 00                        	movl	(%rax), %eax
  800c02: 89 45 d4                     	movl	%eax, -44(%rbp)
  800c05: 83 f8 28                     	cmpl	$40, %eax
  800c08: 0f 87 1c 00 00 00            	ja	0x800c2a <getint+0xaa>
  800c0e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800c12: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800c15: 48 63 c2                     	movslq	%edx, %rax
  800c18: 48 03 41 10                  	addq	16(%rcx), %rax
  800c1c: 83 c2 08                     	addl	$8, %edx
  800c1f: 89 11                        	movl	%edx, (%rcx)
  800c21: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c25: e9 17 00 00 00               	jmp	0x800c41 <getint+0xc1>
  800c2a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800c2e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c32: 48 89 d0                     	movq	%rdx, %rax
  800c35: 48 83 c2 08                  	addq	$8, %rdx
  800c39: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c3d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c41: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800c45: 48 8b 00                     	movq	(%rax), %rax
  800c48: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c4c: e9 54 00 00 00               	jmp	0x800ca5 <getint+0x125>
; 		return va_arg(*ap, int);
  800c51: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c55: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c59: 8b 00                        	movl	(%rax), %eax
  800c5b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c5e: 83 f8 28                     	cmpl	$40, %eax
  800c61: 0f 87 1c 00 00 00            	ja	0x800c83 <getint+0x103>
  800c67: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c6b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800c6e: 48 63 c2                     	movslq	%edx, %rax
  800c71: 48 03 41 10                  	addq	16(%rcx), %rax
  800c75: 83 c2 08                     	addl	$8, %edx
  800c78: 89 11                        	movl	%edx, (%rcx)
  800c7a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c7e: e9 17 00 00 00               	jmp	0x800c9a <getint+0x11a>
  800c83: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c87: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c8b: 48 89 d0                     	movq	%rdx, %rax
  800c8e: 48 83 c2 08                  	addq	$8, %rdx
  800c92: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c96: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c9a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800c9e: 48 63 00                     	movslq	(%rax), %rax
  800ca1: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800ca5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ca9: 5d                           	popq	%rbp
  800caa: c3                           	retq
  800cab: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800cb0 <getuint>:
; {
  800cb0: 55                           	pushq	%rbp
  800cb1: 48 89 e5                     	movq	%rsp, %rbp
  800cb4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800cb8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800cbb: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800cbf: 0f 8c 59 00 00 00            	jl	0x800d1e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800cc5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cc9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800ccd: 8b 00                        	movl	(%rax), %eax
  800ccf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800cd2: 83 f8 28                     	cmpl	$40, %eax
  800cd5: 0f 87 1c 00 00 00            	ja	0x800cf7 <getuint+0x47>
  800cdb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800cdf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800ce2: 48 63 c2                     	movslq	%edx, %rax
  800ce5: 48 03 41 10                  	addq	16(%rcx), %rax
  800ce9: 83 c2 08                     	addl	$8, %edx
  800cec: 89 11                        	movl	%edx, (%rcx)
  800cee: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800cf2: e9 17 00 00 00               	jmp	0x800d0e <getuint+0x5e>
  800cf7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800cfb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800cff: 48 89 d0                     	movq	%rdx, %rax
  800d02: 48 83 c2 08                  	addq	$8, %rdx
  800d06: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d0a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d0e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800d12: 48 8b 00                     	movq	(%rax), %rax
  800d15: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d19: e9 b6 00 00 00               	jmp	0x800dd4 <getuint+0x124>
; 	else if (lflag)
  800d1e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800d22: 0f 84 59 00 00 00            	je	0x800d81 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800d28: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d2c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d30: 8b 00                        	movl	(%rax), %eax
  800d32: 89 45 d4                     	movl	%eax, -44(%rbp)
  800d35: 83 f8 28                     	cmpl	$40, %eax
  800d38: 0f 87 1c 00 00 00            	ja	0x800d5a <getuint+0xaa>
  800d3e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800d42: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800d45: 48 63 c2                     	movslq	%edx, %rax
  800d48: 48 03 41 10                  	addq	16(%rcx), %rax
  800d4c: 83 c2 08                     	addl	$8, %edx
  800d4f: 89 11                        	movl	%edx, (%rcx)
  800d51: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d55: e9 17 00 00 00               	jmp	0x800d71 <getuint+0xc1>
  800d5a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800d5e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d62: 48 89 d0                     	movq	%rdx, %rax
  800d65: 48 83 c2 08                  	addq	$8, %rdx
  800d69: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d6d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d71: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d75: 48 8b 00                     	movq	(%rax), %rax
  800d78: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d7c: e9 53 00 00 00               	jmp	0x800dd4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d81: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d85: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d89: 8b 00                        	movl	(%rax), %eax
  800d8b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d8e: 83 f8 28                     	cmpl	$40, %eax
  800d91: 0f 87 1c 00 00 00            	ja	0x800db3 <getuint+0x103>
  800d97: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800d9b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800d9e: 48 63 c2                     	movslq	%edx, %rax
  800da1: 48 03 41 10                  	addq	16(%rcx), %rax
  800da5: 83 c2 08                     	addl	$8, %edx
  800da8: 89 11                        	movl	%edx, (%rcx)
  800daa: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dae: e9 17 00 00 00               	jmp	0x800dca <getuint+0x11a>
  800db3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800db7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800dbb: 48 89 d0                     	movq	%rdx, %rax
  800dbe: 48 83 c2 08                  	addq	$8, %rdx
  800dc2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800dc6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dca: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800dce: 8b 00                        	movl	(%rax), %eax
  800dd0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800dd4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800dd8: 5d                           	popq	%rbp
  800dd9: c3                           	retq
  800dda: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800de0 <printnum>:
; {
  800de0: 55                           	pushq	%rbp
  800de1: 48 89 e5                     	movq	%rsp, %rbp
  800de4: 48 83 ec 30                  	subq	$48, %rsp
  800de8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800dec: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800df0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800df4: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800df7: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800dfb: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800dff: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e03: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e06: 48 39 c8                     	cmpq	%rcx, %rax
  800e09: 0f 82 30 00 00 00            	jb	0x800e3f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800e0f: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800e13: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e17: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e1b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e1e: 31 d2                        	xorl	%edx, %edx
  800e20: 48 f7 f1                     	divq	%rcx
  800e23: 48 89 c2                     	movq	%rax, %rdx
  800e26: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e29: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800e2d: 41 83 e8 01                  	subl	$1, %r8d
  800e31: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800e35: e8 a6 ff ff ff               	callq	0x800de0 <printnum>
; 	} else {
  800e3a: e9 2e 00 00 00               	jmp	0x800e6d <printnum+0x8d>
; 		while (--width > 0)
  800e3f: e9 00 00 00 00               	jmp	0x800e44 <printnum+0x64>
  800e44: 8b 45 e0                     	movl	-32(%rbp), %eax
  800e47: 83 c0 ff                     	addl	$-1, %eax
  800e4a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800e4d: 83 f8 00                     	cmpl	$0, %eax
  800e50: 0f 8e 12 00 00 00            	jle	0x800e68 <printnum+0x88>
; 			putch(padc, putdat);
  800e56: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e5a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800e5d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e61: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800e63: e9 dc ff ff ff               	jmp	0x800e44 <printnum+0x64>
  800e68: e9 00 00 00 00               	jmp	0x800e6d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800e6d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e71: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e75: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e79: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e7c: 31 d2                        	xorl	%edx, %edx
  800e7e: 48 f7 f1                     	divq	%rcx
  800e81: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e85: 48 8d 0d 18 12 00 00         	leaq	4632(%rip), %rcx        # 0x8020a4 <syscall.c+0x8020a4>
  800e8c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800e90: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e94: ff d0                        	callq	*%rax
; }
  800e96: 48 83 c4 30                  	addq	$48, %rsp
  800e9a: 5d                           	popq	%rbp
  800e9b: c3                           	retq
  800e9c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800ea0 <vsnprintf>:
; {
  800ea0: 55                           	pushq	%rbp
  800ea1: 48 89 e5                     	movq	%rsp, %rbp
  800ea4: 48 83 ec 40                  	subq	$64, %rsp
  800ea8: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800eac: 89 75 ec                     	movl	%esi, -20(%rbp)
  800eaf: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800eb3: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800eb7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ebb: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ebf: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ec3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800ec7: 48 01 c8                     	addq	%rcx, %rax
  800eca: 48 83 c0 ff                  	addq	$-1, %rax
  800ece: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800ed2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800ed9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800ede: 0f 84 0a 00 00 00            	je	0x800eee <vsnprintf+0x4e>
  800ee4: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800ee8: 0f 8d 0c 00 00 00            	jge	0x800efa <vsnprintf+0x5a>
; 		return -EINVAL;
  800eee: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800ef5: e9 25 00 00 00               	jmp	0x800f1f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800efa: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800efe: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800f02: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800f06: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800f30 <sprintputch>
  800f0d: e8 2e f5 ff ff               	callq	0x800440 <vprintfmt>
; 	*b.buf = '\0';
  800f12: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800f16: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800f19: 8b 45 d0                     	movl	-48(%rbp), %eax
  800f1c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800f1f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f22: 48 83 c4 40                  	addq	$64, %rsp
  800f26: 5d                           	popq	%rbp
  800f27: c3                           	retq
  800f28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800f30 <sprintputch>:
; {
  800f30: 55                           	pushq	%rbp
  800f31: 48 89 e5                     	movq	%rsp, %rbp
  800f34: 89 7d fc                     	movl	%edi, -4(%rbp)
  800f37: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800f3b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f3f: 8b 48 10                     	movl	16(%rax), %ecx
  800f42: 83 c1 01                     	addl	$1, %ecx
  800f45: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800f48: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f4c: 48 8b 00                     	movq	(%rax), %rax
  800f4f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800f53: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800f57: 0f 83 18 00 00 00            	jae	0x800f75 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800f5d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f60: 88 c1                        	movb	%al, %cl
  800f62: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800f66: 48 8b 02                     	movq	(%rdx), %rax
  800f69: 48 89 c6                     	movq	%rax, %rsi
  800f6c: 48 83 c6 01                  	addq	$1, %rsi
  800f70: 48 89 32                     	movq	%rsi, (%rdx)
  800f73: 88 08                        	movb	%cl, (%rax)
; }
  800f75: 5d                           	popq	%rbp
  800f76: c3                           	retq
  800f77: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f80 <snprintf>:
; {
  800f80: 55                           	pushq	%rbp
  800f81: 48 89 e5                     	movq	%rsp, %rbp
  800f84: 48 83 ec 70                  	subq	$112, %rsp
  800f88: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f8c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800f90: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800f94: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f98: 89 75 f4                     	movl	%esi, -12(%rbp)
  800f9b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800f9f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800fa3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800fa7: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800fab: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800faf: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800fb6: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800fbd: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fc1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800fc4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800fc8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800fcc: e8 cf fe ff ff               	callq	0x800ea0 <vsnprintf>
  800fd1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800fd4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800fd7: 48 83 c4 70                  	addq	$112, %rsp
  800fdb: 5d                           	popq	%rbp
  800fdc: c3                           	retq
  800fdd: cc                           	int3
  800fde: cc                           	int3
  800fdf: cc                           	int3

0000000000800fe0 <strlen>:
; {
  800fe0: 55                           	pushq	%rbp
  800fe1: 48 89 e5                     	movq	%rsp, %rbp
  800fe4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800fe8: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800fef: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ff3: 0f be 00                     	movsbl	(%rax), %eax
  800ff6: 83 f8 00                     	cmpl	$0, %eax
  800ff9: 0f 84 1a 00 00 00            	je	0x801019 <strlen+0x39>
; 		n++;
  800fff: 8b 45 f4                     	movl	-12(%rbp), %eax
  801002: 83 c0 01                     	addl	$1, %eax
  801005: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  801008: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80100c: 48 83 c0 01                  	addq	$1, %rax
  801010: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801014: e9 d6 ff ff ff               	jmp	0x800fef <strlen+0xf>
; 	return n;
  801019: 8b 45 f4                     	movl	-12(%rbp), %eax
  80101c: 5d                           	popq	%rbp
  80101d: c3                           	retq
  80101e: 66 90                        	nop

0000000000801020 <strnlen>:
; {
  801020: 55                           	pushq	%rbp
  801021: 48 89 e5                     	movq	%rsp, %rbp
  801024: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801028: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80102c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  801033: 31 c0                        	xorl	%eax, %eax
  801035: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  80103a: 88 45 eb                     	movb	%al, -21(%rbp)
  80103d: 0f 86 10 00 00 00            	jbe	0x801053 <strnlen+0x33>
  801043: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801047: 0f be 00                     	movsbl	(%rax), %eax
  80104a: 83 f8 00                     	cmpl	$0, %eax
  80104d: 0f 95 c0                     	setne	%al
  801050: 88 45 eb                     	movb	%al, -21(%rbp)
  801053: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  801056: a8 01                        	testb	$1, %al
  801058: 0f 85 05 00 00 00            	jne	0x801063 <strnlen+0x43>
  80105e: e9 26 00 00 00               	jmp	0x801089 <strnlen+0x69>
; 		n++;
  801063: 8b 45 ec                     	movl	-20(%rbp), %eax
  801066: 83 c0 01                     	addl	$1, %eax
  801069: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80106c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801070: 48 83 c0 01                  	addq	$1, %rax
  801074: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801078: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80107c: 48 83 c0 ff                  	addq	$-1, %rax
  801080: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801084: e9 aa ff ff ff               	jmp	0x801033 <strnlen+0x13>
; 	return n;
  801089: 8b 45 ec                     	movl	-20(%rbp), %eax
  80108c: 5d                           	popq	%rbp
  80108d: c3                           	retq
  80108e: 66 90                        	nop

0000000000801090 <strcpy>:
; {
  801090: 55                           	pushq	%rbp
  801091: 48 89 e5                     	movq	%rsp, %rbp
  801094: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801098: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  80109c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010a0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  8010a4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010a8: 48 89 c1                     	movq	%rax, %rcx
  8010ab: 48 83 c1 01                  	addq	$1, %rcx
  8010af: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8010b3: 8a 00                        	movb	(%rax), %al
  8010b5: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8010b9: 48 89 ca                     	movq	%rcx, %rdx
  8010bc: 48 83 c2 01                  	addq	$1, %rdx
  8010c0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010c4: 88 01                        	movb	%al, (%rcx)
  8010c6: 0f be c0                     	movsbl	%al, %eax
  8010c9: 83 f8 00                     	cmpl	$0, %eax
  8010cc: 0f 84 05 00 00 00            	je	0x8010d7 <strcpy+0x47>
  8010d2: e9 cd ff ff ff               	jmp	0x8010a4 <strcpy+0x14>
; 	return ret;
  8010d7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8010db: 5d                           	popq	%rbp
  8010dc: c3                           	retq
  8010dd: 0f 1f 00                     	nopl	(%rax)

00000000008010e0 <strcat>:
; {
  8010e0: 55                           	pushq	%rbp
  8010e1: 48 89 e5                     	movq	%rsp, %rbp
  8010e4: 48 83 ec 20                  	subq	$32, %rsp
  8010e8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010ec: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  8010f0: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8010f4: e8 e7 fe ff ff               	callq	0x800fe0 <strlen>
  8010f9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  8010fc: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801100: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  801104: 48 01 c7                     	addq	%rax, %rdi
  801107: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80110b: e8 80 ff ff ff               	callq	0x801090 <strcpy>
; 	return dst;
  801110: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801114: 48 83 c4 20                  	addq	$32, %rsp
  801118: 5d                           	popq	%rbp
  801119: c3                           	retq
  80111a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000801120 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  801120: 55                           	pushq	%rbp
  801121: 48 89 e5                     	movq	%rsp, %rbp
  801124: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801128: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80112c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  801130: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801134: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  801138: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  801140: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801144: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  801148: 0f 83 49 00 00 00            	jae	0x801197 <strncpy+0x77>
; 		*dst++ = *src;
  80114e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801152: 8a 08                        	movb	(%rax), %cl
  801154: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801158: 48 89 c2                     	movq	%rax, %rdx
  80115b: 48 83 c2 01                  	addq	$1, %rdx
  80115f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801163: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801165: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801169: 0f be 00                     	movsbl	(%rax), %eax
  80116c: 83 f8 00                     	cmpl	$0, %eax
  80116f: 0f 84 0c 00 00 00            	je	0x801181 <strncpy+0x61>
; 			src++;
  801175: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801179: 48 83 c0 01                  	addq	$1, %rax
  80117d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801181: e9 00 00 00 00               	jmp	0x801186 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801186: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80118a: 48 83 c0 01                  	addq	$1, %rax
  80118e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801192: e9 a9 ff ff ff               	jmp	0x801140 <strncpy+0x20>
; 	return ret;
  801197: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80119b: 5d                           	popq	%rbp
  80119c: c3                           	retq
  80119d: 0f 1f 00                     	nopl	(%rax)

00000000008011a0 <strlcpy>:
; {
  8011a0: 55                           	pushq	%rbp
  8011a1: 48 89 e5                     	movq	%rsp, %rbp
  8011a4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011a8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8011ac: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  8011b0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011b4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  8011b8: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  8011bd: 0f 86 6e 00 00 00            	jbe	0x801231 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  8011c3: e9 00 00 00 00               	jmp	0x8011c8 <strlcpy+0x28>
  8011c8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011cc: 48 83 c1 ff                  	addq	$-1, %rcx
  8011d0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8011d4: 31 c0                        	xorl	%eax, %eax
  8011d6: 48 83 f9 00                  	cmpq	$0, %rcx
  8011da: 88 45 df                     	movb	%al, -33(%rbp)
  8011dd: 0f 86 10 00 00 00            	jbe	0x8011f3 <strlcpy+0x53>
  8011e3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011e7: 0f be 00                     	movsbl	(%rax), %eax
  8011ea: 83 f8 00                     	cmpl	$0, %eax
  8011ed: 0f 95 c0                     	setne	%al
  8011f0: 88 45 df                     	movb	%al, -33(%rbp)
  8011f3: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  8011f6: a8 01                        	testb	$1, %al
  8011f8: 0f 85 05 00 00 00            	jne	0x801203 <strlcpy+0x63>
  8011fe: e9 27 00 00 00               	jmp	0x80122a <strlcpy+0x8a>
; 			*dst++ = *src++;
  801203: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801207: 48 89 c1                     	movq	%rax, %rcx
  80120a: 48 83 c1 01                  	addq	$1, %rcx
  80120e: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801212: 8a 08                        	movb	(%rax), %cl
  801214: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801218: 48 89 c2                     	movq	%rax, %rdx
  80121b: 48 83 c2 01                  	addq	$1, %rdx
  80121f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801223: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801225: e9 9e ff ff ff               	jmp	0x8011c8 <strlcpy+0x28>
; 		*dst = '\0';
  80122a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80122e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801231: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801235: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801239: 48 29 c8                     	subq	%rcx, %rax
  80123c: 5d                           	popq	%rbp
  80123d: c3                           	retq
  80123e: 66 90                        	nop

0000000000801240 <strcmp>:
; {
  801240: 55                           	pushq	%rbp
  801241: 48 89 e5                     	movq	%rsp, %rbp
  801244: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801248: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80124c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801250: 0f be 08                     	movsbl	(%rax), %ecx
  801253: 31 c0                        	xorl	%eax, %eax
  801255: 83 f9 00                     	cmpl	$0, %ecx
  801258: 88 45 ef                     	movb	%al, -17(%rbp)
  80125b: 0f 84 16 00 00 00            	je	0x801277 <strcmp+0x37>
  801261: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801265: 0f be 00                     	movsbl	(%rax), %eax
  801268: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80126c: 0f be 09                     	movsbl	(%rcx), %ecx
  80126f: 39 c8                        	cmpl	%ecx, %eax
  801271: 0f 94 c0                     	sete	%al
  801274: 88 45 ef                     	movb	%al, -17(%rbp)
  801277: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80127a: a8 01                        	testb	$1, %al
  80127c: 0f 85 05 00 00 00            	jne	0x801287 <strcmp+0x47>
  801282: e9 1d 00 00 00               	jmp	0x8012a4 <strcmp+0x64>
; 		p++, q++;
  801287: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80128b: 48 83 c0 01                  	addq	$1, %rax
  80128f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801293: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801297: 48 83 c0 01                  	addq	$1, %rax
  80129b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80129f: e9 a8 ff ff ff               	jmp	0x80124c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  8012a4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012a8: 0f b6 00                     	movzbl	(%rax), %eax
  8012ab: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8012af: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012b2: 29 c8                        	subl	%ecx, %eax
  8012b4: 5d                           	popq	%rbp
  8012b5: c3                           	retq
  8012b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008012c0 <strncmp>:
; {
  8012c0: 55                           	pushq	%rbp
  8012c1: 48 89 e5                     	movq	%rsp, %rbp
  8012c4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012c8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8012cc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012d0: 31 c0                        	xorl	%eax, %eax
  8012d2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012d7: 88 45 df                     	movb	%al, -33(%rbp)
  8012da: 0f 86 2b 00 00 00            	jbe	0x80130b <strncmp+0x4b>
  8012e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012e4: 0f be 08                     	movsbl	(%rax), %ecx
  8012e7: 31 c0                        	xorl	%eax, %eax
  8012e9: 83 f9 00                     	cmpl	$0, %ecx
  8012ec: 88 45 df                     	movb	%al, -33(%rbp)
  8012ef: 0f 84 16 00 00 00            	je	0x80130b <strncmp+0x4b>
  8012f5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012f9: 0f be 00                     	movsbl	(%rax), %eax
  8012fc: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801300: 0f be 09                     	movsbl	(%rcx), %ecx
  801303: 39 c8                        	cmpl	%ecx, %eax
  801305: 0f 94 c0                     	sete	%al
  801308: 88 45 df                     	movb	%al, -33(%rbp)
  80130b: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80130e: a8 01                        	testb	$1, %al
  801310: 0f 85 05 00 00 00            	jne	0x80131b <strncmp+0x5b>
  801316: e9 29 00 00 00               	jmp	0x801344 <strncmp+0x84>
; 		n--, p++, q++;
  80131b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80131f: 48 83 c0 ff                  	addq	$-1, %rax
  801323: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801327: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80132b: 48 83 c0 01                  	addq	$1, %rax
  80132f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801333: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801337: 48 83 c0 01                  	addq	$1, %rax
  80133b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80133f: e9 8c ff ff ff               	jmp	0x8012d0 <strncmp+0x10>
; 	if (n == 0)
  801344: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801349: 0f 85 0c 00 00 00            	jne	0x80135b <strncmp+0x9b>
; 		return 0;
  80134f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801356: e9 13 00 00 00               	jmp	0x80136e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80135b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80135f: 0f b6 00                     	movzbl	(%rax), %eax
  801362: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801366: 0f b6 09                     	movzbl	(%rcx), %ecx
  801369: 29 c8                        	subl	%ecx, %eax
  80136b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80136e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801371: 5d                           	popq	%rbp
  801372: c3                           	retq
  801373: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80137d: 0f 1f 00                     	nopl	(%rax)

0000000000801380 <strchr>:
; {
  801380: 55                           	pushq	%rbp
  801381: 48 89 e5                     	movq	%rsp, %rbp
  801384: 40 88 f0                     	movb	%sil, %al
  801387: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80138b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80138e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801392: 80 38 00                     	cmpb	$0, (%rax)
  801395: 0f 84 36 00 00 00            	je	0x8013d1 <strchr+0x51>
; 		if (*s == c)
  80139b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80139f: 0f be 00                     	movsbl	(%rax), %eax
  8013a2: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  8013a6: 39 c8                        	cmpl	%ecx, %eax
  8013a8: 0f 85 0d 00 00 00            	jne	0x8013bb <strchr+0x3b>
; 			return (char *) s;
  8013ae: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013b2: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013b6: e9 1e 00 00 00               	jmp	0x8013d9 <strchr+0x59>
; 		if (*s == c)
  8013bb: e9 00 00 00 00               	jmp	0x8013c0 <strchr+0x40>
; 	for (; *s; s++)
  8013c0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013c4: 48 83 c0 01                  	addq	$1, %rax
  8013c8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8013cc: e9 bd ff ff ff               	jmp	0x80138e <strchr+0xe>
; 	return 0;
  8013d1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8013d9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013dd: 5d                           	popq	%rbp
  8013de: c3                           	retq
  8013df: 90                           	nop

00000000008013e0 <strfind>:
; {
  8013e0: 55                           	pushq	%rbp
  8013e1: 48 89 e5                     	movq	%rsp, %rbp
  8013e4: 40 88 f0                     	movb	%sil, %al
  8013e7: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8013eb: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  8013ee: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013f2: 80 38 00                     	cmpb	$0, (%rax)
  8013f5: 0f 84 2e 00 00 00            	je	0x801429 <strfind+0x49>
; 		if (*s == c)
  8013fb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013ff: 0f be 00                     	movsbl	(%rax), %eax
  801402: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  801406: 39 c8                        	cmpl	%ecx, %eax
  801408: 0f 85 05 00 00 00            	jne	0x801413 <strfind+0x33>
; 			break;
  80140e: e9 16 00 00 00               	jmp	0x801429 <strfind+0x49>
; 		if (*s == c)
  801413: e9 00 00 00 00               	jmp	0x801418 <strfind+0x38>
; 	for (; *s; s++)
  801418: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80141c: 48 83 c0 01                  	addq	$1, %rax
  801420: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801424: e9 c5 ff ff ff               	jmp	0x8013ee <strfind+0xe>
; 	return (char *) s;
  801429: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80142d: 5d                           	popq	%rbp
  80142e: c3                           	retq
  80142f: 90                           	nop

0000000000801430 <memset>:
; {
  801430: 55                           	pushq	%rbp
  801431: 48 89 e5                     	movq	%rsp, %rbp
  801434: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801438: 89 75 ec                     	movl	%esi, -20(%rbp)
  80143b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80143f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801444: 0f 85 0d 00 00 00            	jne	0x801457 <memset+0x27>
; 		return v;
  80144a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80144e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801452: e9 78 00 00 00               	jmp	0x8014cf <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801457: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80145b: 48 83 e0 03                  	andq	$3, %rax
  80145f: 48 83 f8 00                  	cmpq	$0, %rax
  801463: 0f 85 50 00 00 00            	jne	0x8014b9 <memset+0x89>
  801469: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80146d: 48 83 e0 03                  	andq	$3, %rax
  801471: 48 83 f8 00                  	cmpq	$0, %rax
  801475: 0f 85 3e 00 00 00            	jne	0x8014b9 <memset+0x89>
; 		c &= 0xFF;
  80147b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80147e: 25 ff 00 00 00               	andl	$255, %eax
  801483: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801486: 8b 45 ec                     	movl	-20(%rbp), %eax
  801489: c1 e0 18                     	shll	$24, %eax
  80148c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80148f: c1 e1 10                     	shll	$16, %ecx
  801492: 09 c8                        	orl	%ecx, %eax
  801494: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801497: c1 e1 08                     	shll	$8, %ecx
  80149a: 09 c8                        	orl	%ecx, %eax
  80149c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80149f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  8014a2: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014a6: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014a9: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8014ad: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  8014b1: fc                           	cld
  8014b2: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  8014b4: e9 0e 00 00 00               	jmp	0x8014c7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  8014b9: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014bd: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014c0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8014c4: fc                           	cld
  8014c5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8014c7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014cb: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8014cf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014d3: 5d                           	popq	%rbp
  8014d4: c3                           	retq
  8014d5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014df: 90                           	nop

00000000008014e0 <memmove>:
; {
  8014e0: 55                           	pushq	%rbp
  8014e1: 48 89 e5                     	movq	%rsp, %rbp
  8014e4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014e8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8014ec: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  8014f0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014f4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  8014f8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014fc: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  801500: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801504: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  801508: 0f 83 9d 00 00 00            	jae	0x8015ab <memmove+0xcb>
  80150e: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801512: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801516: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80151a: 0f 86 8b 00 00 00            	jbe	0x8015ab <memmove+0xcb>
; 		s += n;
  801520: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801524: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801528: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80152c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801530: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801534: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801538: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80153c: 48 83 e0 03                  	andq	$3, %rax
  801540: 48 83 f8 00                  	cmpq	$0, %rax
  801544: 0f 85 44 00 00 00            	jne	0x80158e <memmove+0xae>
  80154a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80154e: 48 83 e0 03                  	andq	$3, %rax
  801552: 48 83 f8 00                  	cmpq	$0, %rax
  801556: 0f 85 32 00 00 00            	jne	0x80158e <memmove+0xae>
  80155c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801560: 48 83 e0 03                  	andq	$3, %rax
  801564: 48 83 f8 00                  	cmpq	$0, %rax
  801568: 0f 85 20 00 00 00            	jne	0x80158e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80156e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801572: 48 83 c7 fc                  	addq	$-4, %rdi
  801576: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80157a: 48 83 c6 fc                  	addq	$-4, %rsi
  80157e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801582: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801586: fd                           	std
  801587: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801589: e9 17 00 00 00               	jmp	0x8015a5 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80158e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801592: 48 83 c7 ff                  	addq	$-1, %rdi
  801596: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80159a: 48 83 c6 ff                  	addq	$-1, %rsi
  80159e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  8015a2: fd                           	std
  8015a3: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  8015a5: fc                           	cld
; 	} else {
  8015a6: e9 62 00 00 00               	jmp	0x80160d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8015ab: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8015af: 48 83 e0 03                  	andq	$3, %rax
  8015b3: 48 83 f8 00                  	cmpq	$0, %rax
  8015b7: 0f 85 3c 00 00 00            	jne	0x8015f9 <memmove+0x119>
  8015bd: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8015c1: 48 83 e0 03                  	andq	$3, %rax
  8015c5: 48 83 f8 00                  	cmpq	$0, %rax
  8015c9: 0f 85 2a 00 00 00            	jne	0x8015f9 <memmove+0x119>
  8015cf: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015d3: 48 83 e0 03                  	andq	$3, %rax
  8015d7: 48 83 f8 00                  	cmpq	$0, %rax
  8015db: 0f 85 18 00 00 00            	jne	0x8015f9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8015e1: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015e5: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015e9: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8015ed: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  8015f1: fc                           	cld
  8015f2: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8015f4: e9 0f 00 00 00               	jmp	0x801608 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  8015f9: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015fd: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801601: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801605: fc                           	cld
  801606: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801608: e9 00 00 00 00               	jmp	0x80160d <memmove+0x12d>
; 	return dst;
  80160d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801611: 5d                           	popq	%rbp
  801612: c3                           	retq
  801613: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80161d: 0f 1f 00                     	nopl	(%rax)

0000000000801620 <memcpy>:
; {
  801620: 55                           	pushq	%rbp
  801621: 48 89 e5                     	movq	%rsp, %rbp
  801624: 48 83 ec 20                  	subq	$32, %rsp
  801628: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80162c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801630: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801634: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801638: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80163c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801640: e8 9b fe ff ff               	callq	0x8014e0 <memmove>
  801645: 48 83 c4 20                  	addq	$32, %rsp
  801649: 5d                           	popq	%rbp
  80164a: c3                           	retq
  80164b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801650 <memcmp>:
; {
  801650: 55                           	pushq	%rbp
  801651: 48 89 e5                     	movq	%rsp, %rbp
  801654: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801658: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80165c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801660: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801664: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801668: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80166c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801670: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801674: 48 89 c1                     	movq	%rax, %rcx
  801677: 48 83 c1 ff                  	addq	$-1, %rcx
  80167b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80167f: 48 83 f8 00                  	cmpq	$0, %rax
  801683: 0f 86 4b 00 00 00            	jbe	0x8016d4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801689: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80168d: 0f b6 00                     	movzbl	(%rax), %eax
  801690: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801694: 0f b6 09                     	movzbl	(%rcx), %ecx
  801697: 39 c8                        	cmpl	%ecx, %eax
  801699: 0f 84 18 00 00 00            	je	0x8016b7 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80169f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016a3: 0f b6 00                     	movzbl	(%rax), %eax
  8016a6: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  8016aa: 0f b6 09                     	movzbl	(%rcx), %ecx
  8016ad: 29 c8                        	subl	%ecx, %eax
  8016af: 89 45 fc                     	movl	%eax, -4(%rbp)
  8016b2: e9 24 00 00 00               	jmp	0x8016db <memcmp+0x8b>
; 		s1++, s2++;
  8016b7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016bb: 48 83 c0 01                  	addq	$1, %rax
  8016bf: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8016c3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8016c7: 48 83 c0 01                  	addq	$1, %rax
  8016cb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8016cf: e9 9c ff ff ff               	jmp	0x801670 <memcmp+0x20>
; 	return 0;
  8016d4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8016db: 8b 45 fc                     	movl	-4(%rbp), %eax
  8016de: 5d                           	popq	%rbp
  8016df: c3                           	retq

00000000008016e0 <memfind>:
; {
  8016e0: 55                           	pushq	%rbp
  8016e1: 48 89 e5                     	movq	%rsp, %rbp
  8016e4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016e8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8016eb: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  8016ef: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016f3: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8016f7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  8016fb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016ff: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  801703: 0f 83 30 00 00 00            	jae	0x801739 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801709: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80170d: 0f b6 00                     	movzbl	(%rax), %eax
  801710: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801713: 0f b6 c9                     	movzbl	%cl, %ecx
  801716: 39 c8                        	cmpl	%ecx, %eax
  801718: 0f 85 05 00 00 00            	jne	0x801723 <memfind+0x43>
; 			break;
  80171e: e9 16 00 00 00               	jmp	0x801739 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801723: e9 00 00 00 00               	jmp	0x801728 <memfind+0x48>
; 	for (; s < ends; s++)
  801728: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80172c: 48 83 c0 01                  	addq	$1, %rax
  801730: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801734: e9 c2 ff ff ff               	jmp	0x8016fb <memfind+0x1b>
; 	return (void *) s;
  801739: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80173d: 5d                           	popq	%rbp
  80173e: c3                           	retq
  80173f: 90                           	nop

0000000000801740 <strtol>:
; {
  801740: 55                           	pushq	%rbp
  801741: 48 89 e5                     	movq	%rsp, %rbp
  801744: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801748: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80174c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80174f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801756: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80175e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801762: 0f be 08                     	movsbl	(%rax), %ecx
  801765: b0 01                        	movb	$1, %al
  801767: 83 f9 20                     	cmpl	$32, %ecx
  80176a: 88 45 db                     	movb	%al, -37(%rbp)
  80176d: 0f 84 10 00 00 00            	je	0x801783 <strtol+0x43>
  801773: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801777: 0f be 00                     	movsbl	(%rax), %eax
  80177a: 83 f8 09                     	cmpl	$9, %eax
  80177d: 0f 94 c0                     	sete	%al
  801780: 88 45 db                     	movb	%al, -37(%rbp)
  801783: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801786: a8 01                        	testb	$1, %al
  801788: 0f 85 05 00 00 00            	jne	0x801793 <strtol+0x53>
  80178e: e9 11 00 00 00               	jmp	0x8017a4 <strtol+0x64>
; 		s++;
  801793: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801797: 48 83 c0 01                  	addq	$1, %rax
  80179b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80179f: e9 ba ff ff ff               	jmp	0x80175e <strtol+0x1e>
; 	if (*s == '+')
  8017a4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a8: 0f be 00                     	movsbl	(%rax), %eax
  8017ab: 83 f8 2b                     	cmpl	$43, %eax
  8017ae: 0f 85 11 00 00 00            	jne	0x8017c5 <strtol+0x85>
; 		s++;
  8017b4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b8: 48 83 c0 01                  	addq	$1, %rax
  8017bc: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017c0: e9 28 00 00 00               	jmp	0x8017ed <strtol+0xad>
; 	else if (*s == '-')
  8017c5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017c9: 0f be 00                     	movsbl	(%rax), %eax
  8017cc: 83 f8 2d                     	cmpl	$45, %eax
  8017cf: 0f 85 13 00 00 00            	jne	0x8017e8 <strtol+0xa8>
; 		s++, neg = 1;
  8017d5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017d9: 48 83 c0 01                  	addq	$1, %rax
  8017dd: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017e1: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  8017e8: e9 00 00 00 00               	jmp	0x8017ed <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8017ed: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017f1: 0f 84 0a 00 00 00            	je	0x801801 <strtol+0xc1>
  8017f7: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  8017fb: 0f 85 39 00 00 00            	jne	0x80183a <strtol+0xfa>
  801801: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801805: 0f be 00                     	movsbl	(%rax), %eax
  801808: 83 f8 30                     	cmpl	$48, %eax
  80180b: 0f 85 29 00 00 00            	jne	0x80183a <strtol+0xfa>
  801811: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801815: 0f be 40 01                  	movsbl	1(%rax), %eax
  801819: 83 f8 78                     	cmpl	$120, %eax
  80181c: 0f 85 18 00 00 00            	jne	0x80183a <strtol+0xfa>
; 		s += 2, base = 16;
  801822: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801826: 48 83 c0 02                  	addq	$2, %rax
  80182a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80182e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801835: e9 4d 00 00 00               	jmp	0x801887 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80183a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80183e: 0f 85 28 00 00 00            	jne	0x80186c <strtol+0x12c>
  801844: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801848: 0f be 00                     	movsbl	(%rax), %eax
  80184b: 83 f8 30                     	cmpl	$48, %eax
  80184e: 0f 85 18 00 00 00            	jne	0x80186c <strtol+0x12c>
; 		s++, base = 8;
  801854: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801858: 48 83 c0 01                  	addq	$1, %rax
  80185c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801860: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801867: e9 16 00 00 00               	jmp	0x801882 <strtol+0x142>
; 	else if (base == 0)
  80186c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801870: 0f 85 07 00 00 00            	jne	0x80187d <strtol+0x13d>
; 		base = 10;
  801876: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80187d: e9 00 00 00 00               	jmp	0x801882 <strtol+0x142>
  801882: e9 00 00 00 00               	jmp	0x801887 <strtol+0x147>
; 	while (1) {
  801887: e9 00 00 00 00               	jmp	0x80188c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80188c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801890: 0f be 00                     	movsbl	(%rax), %eax
  801893: 83 f8 30                     	cmpl	$48, %eax
  801896: 0f 8c 22 00 00 00            	jl	0x8018be <strtol+0x17e>
  80189c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018a0: 0f be 00                     	movsbl	(%rax), %eax
  8018a3: 83 f8 39                     	cmpl	$57, %eax
  8018a6: 0f 8f 12 00 00 00            	jg	0x8018be <strtol+0x17e>
; 			dig = *s - '0';
  8018ac: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018b0: 0f be 00                     	movsbl	(%rax), %eax
  8018b3: 83 e8 30                     	subl	$48, %eax
  8018b6: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018b9: e9 79 00 00 00               	jmp	0x801937 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  8018be: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018c2: 0f be 00                     	movsbl	(%rax), %eax
  8018c5: 83 f8 61                     	cmpl	$97, %eax
  8018c8: 0f 8c 25 00 00 00            	jl	0x8018f3 <strtol+0x1b3>
  8018ce: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018d2: 0f be 00                     	movsbl	(%rax), %eax
  8018d5: 83 f8 7a                     	cmpl	$122, %eax
  8018d8: 0f 8f 15 00 00 00            	jg	0x8018f3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8018de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018e2: 0f be 00                     	movsbl	(%rax), %eax
  8018e5: 83 e8 61                     	subl	$97, %eax
  8018e8: 83 c0 0a                     	addl	$10, %eax
  8018eb: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018ee: e9 3f 00 00 00               	jmp	0x801932 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  8018f3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018f7: 0f be 00                     	movsbl	(%rax), %eax
  8018fa: 83 f8 41                     	cmpl	$65, %eax
  8018fd: 0f 8c 25 00 00 00            	jl	0x801928 <strtol+0x1e8>
  801903: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801907: 0f be 00                     	movsbl	(%rax), %eax
  80190a: 83 f8 5a                     	cmpl	$90, %eax
  80190d: 0f 8f 15 00 00 00            	jg	0x801928 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801913: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801917: 0f be 00                     	movsbl	(%rax), %eax
  80191a: 83 e8 41                     	subl	$65, %eax
  80191d: 83 c0 0a                     	addl	$10, %eax
  801920: 89 45 dc                     	movl	%eax, -36(%rbp)
  801923: e9 05 00 00 00               	jmp	0x80192d <strtol+0x1ed>
; 			break;
  801928: e9 43 00 00 00               	jmp	0x801970 <strtol+0x230>
  80192d: e9 00 00 00 00               	jmp	0x801932 <strtol+0x1f2>
  801932: e9 00 00 00 00               	jmp	0x801937 <strtol+0x1f7>
; 		if (dig >= base)
  801937: 8b 45 dc                     	movl	-36(%rbp), %eax
  80193a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80193d: 0f 8c 05 00 00 00            	jl	0x801948 <strtol+0x208>
; 			break;
  801943: e9 28 00 00 00               	jmp	0x801970 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801948: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80194c: 48 83 c0 01                  	addq	$1, %rax
  801950: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801954: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801958: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80195c: 48 0f af c1                  	imulq	%rcx, %rax
  801960: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801964: 48 01 c8                     	addq	%rcx, %rax
  801967: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80196b: e9 1c ff ff ff               	jmp	0x80188c <strtol+0x14c>
; 	if (endptr)
  801970: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801975: 0f 84 0b 00 00 00            	je	0x801986 <strtol+0x246>
; 		*endptr = (char *) s;
  80197b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80197f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801983: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801986: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80198a: 0f 84 0f 00 00 00            	je	0x80199f <strtol+0x25f>
  801990: 31 c0                        	xorl	%eax, %eax
  801992: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801996: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80199a: e9 08 00 00 00               	jmp	0x8019a7 <strtol+0x267>
  80199f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8019a3: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  8019a7: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  8019ab: 5d                           	popq	%rbp
  8019ac: c3                           	retq
