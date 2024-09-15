
obj/user/faultexec:	file format elf64-x86-64

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
  800033: e8 48 00 00 00               	callq	0x800080 <libmain>
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
; 	const char *s = "Hello, world!\n";
  800056: 48 8d 05 ff 1f 00 00         	leaq	8191(%rip), %rax        # 0x80205c <syscall.c+0x80205c>
  80005d: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	void (* func)(void) = (void (*)(void))s;
  800061: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800065: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	func();
  800069: ff 55 e0                     	callq	*-32(%rbp)
; 	return 0;
  80006c: 31 c0                        	xorl	%eax, %eax
  80006e: 48 83 c4 20                  	addq	$32, %rsp
  800072: 5d                           	popq	%rbp
  800073: c3                           	retq
  800074: cc                           	int3
  800075: cc                           	int3
  800076: cc                           	int3
  800077: cc                           	int3
  800078: cc                           	int3
  800079: cc                           	int3
  80007a: cc                           	int3
  80007b: cc                           	int3
  80007c: cc                           	int3
  80007d: cc                           	int3
  80007e: cc                           	int3
  80007f: cc                           	int3

0000000000800080 <libmain>:
; {
  800080: 55                           	pushq	%rbp
  800081: 48 89 e5                     	movq	%rsp, %rbp
  800084: 48 83 ec 10                  	subq	$16, %rsp
  800088: 89 7d fc                     	movl	%edi, -4(%rbp)
  80008b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80008f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  800093: 0f 8e 11 00 00 00            	jle	0x8000aa <libmain+0x2a>
; 		binary_name = argv[0];
  800099: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80009d: 48 8b 08                     	movq	(%rax), %rcx
  8000a0: 48 8d 05 59 2f 00 00         	leaq	12121(%rip), %rax       # 0x803000 <binary_name>
  8000a7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8000aa: 8b 7d fc                     	movl	-4(%rbp), %edi
  8000ad: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8000b1: e8 8a ff ff ff               	callq	0x800040 <main>
; 	exit();
  8000b6: e8 15 00 00 00               	callq	0x8000d0 <exit>
; }
  8000bb: 48 83 c4 10                  	addq	$16, %rsp
  8000bf: 5d                           	popq	%rbp
  8000c0: c3                           	retq
  8000c1: cc                           	int3
  8000c2: cc                           	int3
  8000c3: cc                           	int3
  8000c4: cc                           	int3
  8000c5: cc                           	int3
  8000c6: cc                           	int3
  8000c7: cc                           	int3
  8000c8: cc                           	int3
  8000c9: cc                           	int3
  8000ca: cc                           	int3
  8000cb: cc                           	int3
  8000cc: cc                           	int3
  8000cd: cc                           	int3
  8000ce: cc                           	int3
  8000cf: cc                           	int3

00000000008000d0 <exit>:
; {
  8000d0: 55                           	pushq	%rbp
  8000d1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000d4: 31 ff                        	xorl	%edi, %edi
  8000d6: e8 15 01 00 00               	callq	0x8001f0 <kill>
; }
  8000db: 5d                           	popq	%rbp
  8000dc: c3                           	retq
  8000dd: cc                           	int3
  8000de: cc                           	int3
  8000df: cc                           	int3

00000000008000e0 <puts>:
; {
  8000e0: 55                           	pushq	%rbp
  8000e1: 48 89 e5                     	movq	%rsp, %rbp
  8000e4: 48 83 ec 20                  	subq	$32, %rsp
  8000e8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000ec: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000f0: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8000f4: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8000f8: 31 f6                        	xorl	%esi, %esi
  8000fa: 31 c0                        	xorl	%eax, %eax
  8000fc: 41 89 c1                     	movl	%eax, %r9d
  8000ff: 89 f7                        	movl	%esi, %edi
  800101: 4d 89 c8                     	movq	%r9, %r8
  800104: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80010c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800115: e8 06 00 00 00               	callq	0x800120 <syscall>
; }
  80011a: 48 83 c4 20                  	addq	$32, %rsp
  80011e: 5d                           	popq	%rbp
  80011f: c3                           	retq

0000000000800120 <syscall>:
; {
  800120: 55                           	pushq	%rbp
  800121: 48 89 e5                     	movq	%rsp, %rbp
  800124: 48 83 ec 40                  	subq	$64, %rsp
  800128: 48 8b 45 18                  	movq	24(%rbp), %rax
  80012c: 48 8b 45 10                  	movq	16(%rbp), %rax
  800130: 89 7d fc                     	movl	%edi, -4(%rbp)
  800133: 89 75 f8                     	movl	%esi, -8(%rbp)
  800136: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80013a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80013e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  800142: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800146: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80014a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80014e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800152: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800156: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80015a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80015e: 48 8b 45 18                  	movq	24(%rbp), %rax
  800162: 48 89 04 24                  	movq	%rax, (%rsp)
  800166: e8 01 01 00 00               	callq	0x80026c <do_syscall>
  80016b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80016f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  800173: 0f 84 2c 00 00 00            	je	0x8001a5 <syscall+0x85>
  800179: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80017e: 0f 83 21 00 00 00            	jae	0x8001a5 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  800184: 8b 4d fc                     	movl	-4(%rbp), %ecx
  800187: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80018b: 48 8d 3d 3b 1f 00 00         	leaq	7995(%rip), %rdi        # 0x8020cd <syscall.c+0x8020cd>
  800192: be 1f 00 00 00               	movl	$31, %esi
  800197: 48 8d 15 cd 1e 00 00         	leaq	7885(%rip), %rdx        # 0x80206b <syscall.c+0x80206b>
  80019e: b0 00                        	movb	$0, %al
  8001a0: e8 db 00 00 00               	callq	0x800280 <_panic>
; 	return ret;
  8001a5: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8001a9: 48 83 c4 40                  	addq	$64, %rsp
  8001ad: 5d                           	popq	%rbp
  8001ae: c3                           	retq
  8001af: 90                           	nop

00000000008001b0 <getc>:
; {
  8001b0: 55                           	pushq	%rbp
  8001b1: 48 89 e5                     	movq	%rsp, %rbp
  8001b4: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  8001b8: bf 01 00 00 00               	movl	$1, %edi
  8001bd: 31 f6                        	xorl	%esi, %esi
  8001bf: 31 c0                        	xorl	%eax, %eax
  8001c1: 41 89 c1                     	movl	%eax, %r9d
  8001c4: 4c 89 ca                     	movq	%r9, %rdx
  8001c7: 4c 89 c9                     	movq	%r9, %rcx
  8001ca: 4d 89 c8                     	movq	%r9, %r8
  8001cd: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001d5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001de: e8 3d ff ff ff               	callq	0x800120 <syscall>
  8001e3: 48 83 c4 10                  	addq	$16, %rsp
  8001e7: 5d                           	popq	%rbp
  8001e8: c3                           	retq
  8001e9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008001f0 <kill>:
; {
  8001f0: 55                           	pushq	%rbp
  8001f1: 48 89 e5                     	movq	%rsp, %rbp
  8001f4: 48 83 ec 20                  	subq	$32, %rsp
  8001f8: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8001fb: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  8001ff: bf 03 00 00 00               	movl	$3, %edi
  800204: be 01 00 00 00               	movl	$1, %esi
  800209: 31 c0                        	xorl	%eax, %eax
  80020b: 41 89 c1                     	movl	%eax, %r9d
  80020e: 4c 89 c9                     	movq	%r9, %rcx
  800211: 4d 89 c8                     	movq	%r9, %r8
  800214: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80021c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800225: e8 f6 fe ff ff               	callq	0x800120 <syscall>
  80022a: 48 83 c4 20                  	addq	$32, %rsp
  80022e: 5d                           	popq	%rbp
  80022f: c3                           	retq

0000000000800230 <getpid>:
; {
  800230: 55                           	pushq	%rbp
  800231: 48 89 e5                     	movq	%rsp, %rbp
  800234: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800238: bf 02 00 00 00               	movl	$2, %edi
  80023d: 31 f6                        	xorl	%esi, %esi
  80023f: 31 c0                        	xorl	%eax, %eax
  800241: 41 89 c1                     	movl	%eax, %r9d
  800244: 4c 89 ca                     	movq	%r9, %rdx
  800247: 4c 89 c9                     	movq	%r9, %rcx
  80024a: 4d 89 c8                     	movq	%r9, %r8
  80024d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800255: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80025e: e8 bd fe ff ff               	callq	0x800120 <syscall>
  800263: 48 83 c4 10                  	addq	$16, %rsp
  800267: 5d                           	popq	%rbp
  800268: c3                           	retq
  800269: cc                           	int3
  80026a: cc                           	int3
  80026b: cc                           	int3

000000000080026c <do_syscall>:
; 	pushq %rbp
  80026c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80026d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800272: cd 80                        	int	$128
; 	popq %rbp
  800274: 5d                           	popq	%rbp
; 	retq
  800275: c3                           	retq
  800276: cc                           	int3
  800277: cc                           	int3
  800278: cc                           	int3
  800279: cc                           	int3
  80027a: cc                           	int3
  80027b: cc                           	int3
  80027c: cc                           	int3
  80027d: cc                           	int3
  80027e: cc                           	int3
  80027f: cc                           	int3

0000000000800280 <_panic>:
; {
  800280: 55                           	pushq	%rbp
  800281: 48 89 e5                     	movq	%rsp, %rbp
  800284: 48 83 ec 60                  	subq	$96, %rsp
  800288: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80028c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800290: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800294: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800298: 89 75 f4                     	movl	%esi, -12(%rbp)
  80029b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80029f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  8002a3: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  8002a7: 48 89 48 10                  	movq	%rcx, 16(%rax)
  8002ab: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  8002af: 48 89 48 08                  	movq	%rcx, 8(%rax)
  8002b3: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  8002ba: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  8002c0: e8 6b ff ff ff               	callq	0x800230 <getpid>
  8002c5: 89 c6                        	movl	%eax, %esi
  8002c7: 48 8d 05 32 2d 00 00         	leaq	11570(%rip), %rax       # 0x803000 <binary_name>
  8002ce: 48 8b 10                     	movq	(%rax), %rdx
  8002d1: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8002d5: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8002d9: 48 8d 3d 3e 1d 00 00         	leaq	7486(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8002e0: b0 00                        	movb	$0, %al
  8002e2: e8 09 01 00 00               	callq	0x8003f0 <printf>
; 	vprintf(fmt, ap);
  8002e7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8002eb: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8002ef: e8 1c 00 00 00               	callq	0x800310 <vprintf>
; 	printf("\n");
  8002f4: 48 8d 3d c9 1d 00 00         	leaq	7625(%rip), %rdi        # 0x8020c4 <syscall.c+0x8020c4>
  8002fb: b0 00                        	movb	$0, %al
  8002fd: e8 ee 00 00 00               	callq	0x8003f0 <printf>
; 		asm volatile("int3");
  800302: cc                           	int3
; 	while (1) {
  800303: e9 fa ff ff ff               	jmp	0x800302 <_panic+0x82>
  800308: cc                           	int3
  800309: cc                           	int3
  80030a: cc                           	int3
  80030b: cc                           	int3
  80030c: cc                           	int3
  80030d: cc                           	int3
  80030e: cc                           	int3
  80030f: cc                           	int3

0000000000800310 <vprintf>:
; {
  800310: 55                           	pushq	%rbp
  800311: 48 89 e5                     	movq	%rsp, %rbp
  800314: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  80031b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80031f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800323: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80032d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800337: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80033e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800342: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800346: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800380 <putch>
  80034d: e8 fe 00 00 00               	callq	0x800450 <vprintfmt>
; 	puts(b.buf, b.idx);
  800352: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800359: 48 83 c7 08                  	addq	$8, %rdi
  80035d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800364: e8 77 fd ff ff               	callq	0x8000e0 <puts>
; 	return b.cnt;
  800369: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80036f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800376: 5d                           	popq	%rbp
  800377: c3                           	retq
  800378: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800380 <putch>:
; {
  800380: 55                           	pushq	%rbp
  800381: 48 89 e5                     	movq	%rsp, %rbp
  800384: 48 83 ec 10                  	subq	$16, %rsp
  800388: 89 7d fc                     	movl	%edi, -4(%rbp)
  80038b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80038f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800392: 88 c2                        	movb	%al, %dl
  800394: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800398: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80039c: 8b 0e                        	movl	(%rsi), %ecx
  80039e: 89 cf                        	movl	%ecx, %edi
  8003a0: 83 c7 01                     	addl	$1, %edi
  8003a3: 89 3e                        	movl	%edi, (%rsi)
  8003a5: 48 63 c9                     	movslq	%ecx, %rcx
  8003a8: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  8003ac: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003b0: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  8003b6: 0f 85 1e 00 00 00            	jne	0x8003da <putch+0x5a>
; 		puts(b->buf, b->idx);
  8003bc: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8003c0: 48 83 c7 08                  	addq	$8, %rdi
  8003c4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003c8: 48 63 30                     	movslq	(%rax), %rsi
  8003cb: e8 10 fd ff ff               	callq	0x8000e0 <puts>
; 		b->idx = 0;
  8003d0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003d4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8003da: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003de: 8b 48 04                     	movl	4(%rax), %ecx
  8003e1: 83 c1 01                     	addl	$1, %ecx
  8003e4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8003e7: 48 83 c4 10                  	addq	$16, %rsp
  8003eb: 5d                           	popq	%rbp
  8003ec: c3                           	retq
  8003ed: 0f 1f 00                     	nopl	(%rax)

00000000008003f0 <printf>:
; {
  8003f0: 55                           	pushq	%rbp
  8003f1: 48 89 e5                     	movq	%rsp, %rbp
  8003f4: 48 83 ec 60                  	subq	$96, %rsp
  8003f8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8003fc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800400: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800404: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  800408: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  80040c: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800410: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800414: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800418: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80041c: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800420: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800427: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80042e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800432: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800436: e8 d5 fe ff ff               	callq	0x800310 <vprintf>
  80043b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80043e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800441: 48 83 c4 60                  	addq	$96, %rsp
  800445: 5d                           	popq	%rbp
  800446: c3                           	retq
  800447: cc                           	int3
  800448: cc                           	int3
  800449: cc                           	int3
  80044a: cc                           	int3
  80044b: cc                           	int3
  80044c: cc                           	int3
  80044d: cc                           	int3
  80044e: cc                           	int3
  80044f: cc                           	int3

0000000000800450 <vprintfmt>:
; {
  800450: 55                           	pushq	%rbp
  800451: 48 89 e5                     	movq	%rsp, %rbp
  800454: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80045b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80045f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800463: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800467: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80046b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80046f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800473: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800477: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80047b: 48 8b 0a                     	movq	(%rdx), %rcx
  80047e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800482: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800486: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800489: e9 00 00 00 00               	jmp	0x80048e <vprintfmt+0x3e>
  80048e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800492: 48 89 c1                     	movq	%rax, %rcx
  800495: 48 83 c1 01                  	addq	$1, %rcx
  800499: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80049d: 0f b6 00                     	movzbl	(%rax), %eax
  8004a0: 89 45 b4                     	movl	%eax, -76(%rbp)
  8004a3: 83 f8 25                     	cmpl	$37, %eax
  8004a6: 0f 84 25 00 00 00            	je	0x8004d1 <vprintfmt+0x81>
; 			if (ch == '\0')
  8004ac: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  8004b0: 0f 85 09 00 00 00            	jne	0x8004bf <vprintfmt+0x6f>
; 				return;
  8004b6: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  8004bd: 5d                           	popq	%rbp
  8004be: c3                           	retq
; 			putch(ch, putdat);
  8004bf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8004c3: 8b 7d b4                     	movl	-76(%rbp), %edi
  8004c6: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8004ca: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8004cc: e9 bd ff ff ff               	jmp	0x80048e <vprintfmt+0x3e>
; 		padc = ' ';
  8004d1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8004d5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8004dc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8004e3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8004ea: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8004f1: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004f5: 48 89 c1                     	movq	%rax, %rcx
  8004f8: 48 83 c1 01                  	addq	$1, %rcx
  8004fc: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800500: 0f b6 00                     	movzbl	(%rax), %eax
  800503: 89 45 b4                     	movl	%eax, -76(%rbp)
  800506: 83 c0 dd                     	addl	$-35, %eax
  800509: 89 c1                        	movl	%eax, %ecx
  80050b: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  80050f: 83 e8 55                     	subl	$85, %eax
  800512: 0f 87 c1 05 00 00            	ja	0x800ad9 <vprintfmt+0x689>
  800518: 48 8b 45 88                  	movq	-120(%rbp), %rax
  80051c: 48 8d 0d 01 1c 00 00         	leaq	7169(%rip), %rcx        # 0x802124 <syscall.c+0x802124>
  800523: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800527: 48 01 c8                     	addq	%rcx, %rax
  80052a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80052c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800530: e9 bc ff ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			padc = '0';
  800535: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800539: e9 b3 ff ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80053e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800545: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800549: 03 45 b4                     	addl	-76(%rbp), %eax
  80054c: 83 e8 30                     	subl	$48, %eax
  80054f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800552: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800556: 0f be 00                     	movsbl	(%rax), %eax
  800559: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80055c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800560: 0f 8c 0a 00 00 00            	jl	0x800570 <vprintfmt+0x120>
  800566: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80056a: 0f 8e 05 00 00 00            	jle	0x800575 <vprintfmt+0x125>
; 					break;
  800570: e9 16 00 00 00               	jmp	0x80058b <vprintfmt+0x13b>
; 			}
  800575: e9 00 00 00 00               	jmp	0x80057a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80057a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80057e: 48 83 c0 01                  	addq	$1, %rax
  800582: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800586: e9 ba ff ff ff               	jmp	0x800545 <vprintfmt+0xf5>
; 			goto process_precision;
  80058b: e9 8c 00 00 00               	jmp	0x80061c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800590: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800594: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80059b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80059e: 89 45 84                     	movl	%eax, -124(%rbp)
  8005a1: 83 f8 28                     	cmpl	$40, %eax
  8005a4: 0f 87 22 00 00 00            	ja	0x8005cc <vprintfmt+0x17c>
  8005aa: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  8005b1: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  8005b4: 48 63 c2                     	movslq	%edx, %rax
  8005b7: 48 03 41 10                  	addq	16(%rcx), %rax
  8005bb: 83 c2 08                     	addl	$8, %edx
  8005be: 89 11                        	movl	%edx, (%rcx)
  8005c0: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005c7: e9 1d 00 00 00               	jmp	0x8005e9 <vprintfmt+0x199>
  8005cc: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8005d3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005d7: 48 89 d0                     	movq	%rdx, %rax
  8005da: 48 83 c2 08                  	addq	$8, %rdx
  8005de: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005e2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005e9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  8005f0: 8b 00                        	movl	(%rax), %eax
  8005f2: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  8005f5: e9 22 00 00 00               	jmp	0x80061c <vprintfmt+0x1cc>
; 			if (width < 0)
  8005fa: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005fe: 0f 8d 07 00 00 00            	jge	0x80060b <vprintfmt+0x1bb>
; 				width = 0;
  800604: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  80060b: e9 e1 fe ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			altflag = 1;
  800610: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  800617: e9 d5 fe ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			if (width < 0)
  80061c: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800620: 0f 8d 0d 00 00 00            	jge	0x800633 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800626: 8b 45 98                     	movl	-104(%rbp), %eax
  800629: 89 45 9c                     	movl	%eax, -100(%rbp)
  80062c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800633: e9 b9 fe ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			lflag++;
  800638: 8b 45 a0                     	movl	-96(%rbp), %eax
  80063b: 83 c0 01                     	addl	$1, %eax
  80063e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800641: e9 ab fe ff ff               	jmp	0x8004f1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800646: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80064a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800651: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800655: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80065c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80065f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800665: 83 f8 28                     	cmpl	$40, %eax
  800668: 0f 87 25 00 00 00            	ja	0x800693 <vprintfmt+0x243>
  80066e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800675: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80067b: 48 63 c2                     	movslq	%edx, %rax
  80067e: 48 03 41 10                  	addq	16(%rcx), %rax
  800682: 83 c2 08                     	addl	$8, %edx
  800685: 89 11                        	movl	%edx, (%rcx)
  800687: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80068e: e9 1d 00 00 00               	jmp	0x8006b0 <vprintfmt+0x260>
  800693: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80069a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80069e: 48 89 d0                     	movq	%rdx, %rax
  8006a1: 48 83 c2 08                  	addq	$8, %rdx
  8006a5: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8006a9: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  8006b0: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  8006b7: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  8006be: 8b 39                        	movl	(%rcx), %edi
  8006c0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006c4: ff d0                        	callq	*%rax
; 			break;
  8006c6: e9 55 04 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  8006cb: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8006cf: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8006d6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8006d9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8006df: 83 f8 28                     	cmpl	$40, %eax
  8006e2: 0f 87 25 00 00 00            	ja	0x80070d <vprintfmt+0x2bd>
  8006e8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8006ef: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  8006f5: 48 63 c2                     	movslq	%edx, %rax
  8006f8: 48 03 41 10                  	addq	16(%rcx), %rax
  8006fc: 83 c2 08                     	addl	$8, %edx
  8006ff: 89 11                        	movl	%edx, (%rcx)
  800701: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  800708: e9 1d 00 00 00               	jmp	0x80072a <vprintfmt+0x2da>
  80070d: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  800714: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800718: 48 89 d0                     	movq	%rdx, %rax
  80071b: 48 83 c2 08                  	addq	$8, %rdx
  80071f: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800723: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80072a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800731: 8b 00                        	movl	(%rax), %eax
  800733: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800736: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80073a: 0f 8d 08 00 00 00            	jge	0x800748 <vprintfmt+0x2f8>
; 				err = -err;
  800740: 31 c0                        	xorl	%eax, %eax
  800742: 2b 45 b0                     	subl	-80(%rbp), %eax
  800745: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800748: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80074c: 48 83 f8 09                  	cmpq	$9, %rax
  800750: 0f 83 1d 00 00 00            	jae	0x800773 <vprintfmt+0x323>
  800756: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80075a: 48 8d 05 bf f8 9f ff         	leaq	-6293313(%rip), %rax    # 0x200020 <error_string>
  800761: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800765: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800769: 48 83 f8 00                  	cmpq	$0, %rax
  80076d: 0f 85 1e 00 00 00            	jne	0x800791 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800773: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800777: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80077b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80077e: 48 8d 15 25 19 00 00         	leaq	6437(%rip), %rdx        # 0x8020aa <syscall.c+0x8020aa>
  800785: b0 00                        	movb	$0, %al
  800787: e8 a4 03 00 00               	callq	0x800b30 <printfmt>
  80078c: e9 1a 00 00 00               	jmp	0x8007ab <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800791: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800795: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800799: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80079d: 48 8d 15 77 18 00 00         	leaq	6263(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  8007a4: b0 00                        	movb	$0, %al
  8007a6: e8 85 03 00 00               	callq	0x800b30 <printfmt>
; 			break;
  8007ab: e9 70 03 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007b0: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8007b4: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  8007bb: 8b 45 c0                     	movl	-64(%rbp), %eax
  8007be: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  8007c4: 83 f8 28                     	cmpl	$40, %eax
  8007c7: 0f 87 25 00 00 00            	ja	0x8007f2 <vprintfmt+0x3a2>
  8007cd: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8007d4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007da: 48 63 c2                     	movslq	%edx, %rax
  8007dd: 48 03 41 10                  	addq	16(%rcx), %rax
  8007e1: 83 c2 08                     	addl	$8, %edx
  8007e4: 89 11                        	movl	%edx, (%rcx)
  8007e6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007ed: e9 1d 00 00 00               	jmp	0x80080f <vprintfmt+0x3bf>
  8007f2: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007f9: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8007fd: 48 89 d0                     	movq	%rdx, %rax
  800800: 48 83 c2 08                  	addq	$8, %rdx
  800804: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800808: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80080f: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800816: 48 8b 00                     	movq	(%rax), %rax
  800819: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  80081d: 48 83 f8 00                  	cmpq	$0, %rax
  800821: 0f 85 0b 00 00 00            	jne	0x800832 <vprintfmt+0x3e2>
; 				p = "(null)";
  800827: 48 8d 05 98 18 00 00         	leaq	6296(%rip), %rax        # 0x8020c6 <syscall.c+0x8020c6>
  80082e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800832: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800836: 0f 8e 4f 00 00 00            	jle	0x80088b <vprintfmt+0x43b>
  80083c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800840: 83 f8 2d                     	cmpl	$45, %eax
  800843: 0f 84 42 00 00 00            	je	0x80088b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800849: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80084d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800851: e8 da 07 00 00               	callq	0x801030 <strnlen>
  800856: 89 c1                        	movl	%eax, %ecx
  800858: 8b 45 9c                     	movl	-100(%rbp), %eax
  80085b: 29 c8                        	subl	%ecx, %eax
  80085d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800860: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800864: 0f 8e 1c 00 00 00            	jle	0x800886 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80086a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80086e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800872: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800876: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800878: 8b 45 9c                     	movl	-100(%rbp), %eax
  80087b: 83 c0 ff                     	addl	$-1, %eax
  80087e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800881: e9 da ff ff ff               	jmp	0x800860 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800886: e9 00 00 00 00               	jmp	0x80088b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80088b: e9 00 00 00 00               	jmp	0x800890 <vprintfmt+0x440>
  800890: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800894: 48 89 c1                     	movq	%rax, %rcx
  800897: 48 83 c1 01                  	addq	$1, %rcx
  80089b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80089f: 0f be 08                     	movsbl	(%rax), %ecx
  8008a2: 89 4d b4                     	movl	%ecx, -76(%rbp)
  8008a5: 31 c0                        	xorl	%eax, %eax
  8008a7: 83 f9 00                     	cmpl	$0, %ecx
  8008aa: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008b0: 0f 84 33 00 00 00            	je	0x8008e9 <vprintfmt+0x499>
  8008b6: b0 01                        	movb	$1, %al
  8008b8: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  8008bc: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008c2: 0f 8c 15 00 00 00            	jl	0x8008dd <vprintfmt+0x48d>
  8008c8: 8b 45 98                     	movl	-104(%rbp), %eax
  8008cb: 83 c0 ff                     	addl	$-1, %eax
  8008ce: 89 45 98                     	movl	%eax, -104(%rbp)
  8008d1: 83 f8 00                     	cmpl	$0, %eax
  8008d4: 0f 9d c0                     	setge	%al
  8008d7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008dd: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8008e3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008e9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008ef: a8 01                        	testb	$1, %al
  8008f1: 0f 85 05 00 00 00            	jne	0x8008fc <vprintfmt+0x4ac>
  8008f7: e9 52 00 00 00               	jmp	0x80094e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008fc: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  800900: 0f 84 28 00 00 00            	je	0x80092e <vprintfmt+0x4de>
  800906: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  80090a: 0f 8c 0a 00 00 00            	jl	0x80091a <vprintfmt+0x4ca>
  800910: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  800914: 0f 8e 14 00 00 00            	jle	0x80092e <vprintfmt+0x4de>
; 					putch('?', putdat);
  80091a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80091e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800922: bf 3f 00 00 00               	movl	$63, %edi
  800927: ff d0                        	callq	*%rax
  800929: e9 0d 00 00 00               	jmp	0x80093b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80092e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800932: 8b 7d b4                     	movl	-76(%rbp), %edi
  800935: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800939: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80093b: e9 00 00 00 00               	jmp	0x800940 <vprintfmt+0x4f0>
; 					width--)
  800940: 8b 45 9c                     	movl	-100(%rbp), %eax
  800943: 83 c0 ff                     	addl	$-1, %eax
  800946: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800949: e9 42 ff ff ff               	jmp	0x800890 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80094e: e9 00 00 00 00               	jmp	0x800953 <vprintfmt+0x503>
  800953: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800957: 0f 8e 1d 00 00 00            	jle	0x80097a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80095d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800961: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800965: bf 20 00 00 00               	movl	$32, %edi
  80096a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80096c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80096f: 83 c0 ff                     	addl	$-1, %eax
  800972: 89 45 9c                     	movl	%eax, -100(%rbp)
  800975: e9 d9 ff ff ff               	jmp	0x800953 <vprintfmt+0x503>
; 			break;
  80097a: e9 a1 01 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80097f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800982: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800986: e8 05 02 00 00               	callq	0x800b90 <getint>
  80098b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80098f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800994: 0f 8d 19 00 00 00            	jge	0x8009b3 <vprintfmt+0x563>
; 				putch('-', putdat);
  80099a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80099e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009a2: bf 2d 00 00 00               	movl	$45, %edi
  8009a7: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  8009a9: 31 c0                        	xorl	%eax, %eax
  8009ab: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  8009af: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009b3: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009ba: e9 e6 00 00 00               	jmp	0x800aa5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009bf: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009c2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009c6: e8 f5 02 00 00               	callq	0x800cc0 <getuint>
  8009cb: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009cf: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009d6: e9 ca 00 00 00               	jmp	0x800aa5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009db: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009de: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009e2: e8 d9 02 00 00               	callq	0x800cc0 <getuint>
  8009e7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8009eb: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  8009f2: e9 ae 00 00 00               	jmp	0x800aa5 <vprintfmt+0x655>
; 			putch('0', putdat);
  8009f7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009fb: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009ff: bf 30 00 00 00               	movl	$48, %edi
  800a04: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800a06: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a0a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a0e: bf 78 00 00 00               	movl	$120, %edi
  800a13: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800a15: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800a19: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800a20: 8b 45 c0                     	movl	-64(%rbp), %eax
  800a23: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800a29: 83 f8 28                     	cmpl	$40, %eax
  800a2c: 0f 87 25 00 00 00            	ja	0x800a57 <vprintfmt+0x607>
  800a32: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800a39: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  800a3f: 48 63 c2                     	movslq	%edx, %rax
  800a42: 48 03 41 10                  	addq	16(%rcx), %rax
  800a46: 83 c2 08                     	addl	$8, %edx
  800a49: 89 11                        	movl	%edx, (%rcx)
  800a4b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a52: e9 1d 00 00 00               	jmp	0x800a74 <vprintfmt+0x624>
  800a57: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  800a5e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a62: 48 89 d0                     	movq	%rdx, %rax
  800a65: 48 83 c2 08                  	addq	$8, %rdx
  800a69: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a6d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a74: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  800a7b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  800a7e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a82: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a89: e9 17 00 00 00               	jmp	0x800aa5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a8e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a91: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a95: e8 26 02 00 00               	callq	0x800cc0 <getuint>
  800a9a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a9e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800aa5: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800aa9: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800aad: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800ab1: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800ab4: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800ab8: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800abd: e8 2e 03 00 00               	callq	0x800df0 <printnum>
; 			break;
  800ac2: e9 59 00 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800ac7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800acb: 8b 7d b4                     	movl	-76(%rbp), %edi
  800ace: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ad2: ff d0                        	callq	*%rax
; 			break;
  800ad4: e9 47 00 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800ad9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800add: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ae1: bf 25 00 00 00               	movl	$37, %edi
  800ae6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800ae8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800aec: 48 83 c0 ff                  	addq	$-1, %rax
  800af0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800af4: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800af8: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800afc: 83 f8 25                     	cmpl	$37, %eax
  800aff: 0f 84 16 00 00 00            	je	0x800b1b <vprintfmt+0x6cb>
  800b05: e9 00 00 00 00               	jmp	0x800b0a <vprintfmt+0x6ba>
  800b0a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800b0e: 48 83 c0 ff                  	addq	$-1, %rax
  800b12: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800b16: e9 d9 ff ff ff               	jmp	0x800af4 <vprintfmt+0x6a4>
; 			break;
  800b1b: e9 00 00 00 00               	jmp	0x800b20 <vprintfmt+0x6d0>
; 	while (1) {
  800b20: e9 64 f9 ff ff               	jmp	0x800489 <vprintfmt+0x39>
  800b25: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b2f: 90                           	nop

0000000000800b30 <printfmt>:
; {
  800b30: 55                           	pushq	%rbp
  800b31: 48 89 e5                     	movq	%rsp, %rbp
  800b34: 48 83 ec 60                  	subq	$96, %rsp
  800b38: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800b3c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800b40: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800b44: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800b48: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800b4c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800b50: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800b54: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b58: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800b5c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b60: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800b67: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800b6e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800b72: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800b76: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800b7a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800b7e: e8 cd f8 ff ff               	callq	0x800450 <vprintfmt>
; }
  800b83: 48 83 c4 60                  	addq	$96, %rsp
  800b87: 5d                           	popq	%rbp
  800b88: c3                           	retq
  800b89: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b90 <getint>:
; {
  800b90: 55                           	pushq	%rbp
  800b91: 48 89 e5                     	movq	%rsp, %rbp
  800b94: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b98: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b9b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b9f: 0f 8c 59 00 00 00            	jl	0x800bfe <getint+0x6e>
; 		return va_arg(*ap, long long);
  800ba5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ba9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800bad: 8b 00                        	movl	(%rax), %eax
  800baf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800bb2: 83 f8 28                     	cmpl	$40, %eax
  800bb5: 0f 87 1c 00 00 00            	ja	0x800bd7 <getint+0x47>
  800bbb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800bbf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800bc2: 48 63 c2                     	movslq	%edx, %rax
  800bc5: 48 03 41 10                  	addq	16(%rcx), %rax
  800bc9: 83 c2 08                     	addl	$8, %edx
  800bcc: 89 11                        	movl	%edx, (%rcx)
  800bce: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bd2: e9 17 00 00 00               	jmp	0x800bee <getint+0x5e>
  800bd7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800bdb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bdf: 48 89 d0                     	movq	%rdx, %rax
  800be2: 48 83 c2 08                  	addq	$8, %rdx
  800be6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bea: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bee: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800bf2: 48 8b 00                     	movq	(%rax), %rax
  800bf5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bf9: e9 b7 00 00 00               	jmp	0x800cb5 <getint+0x125>
; 	else if (lflag)
  800bfe: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800c02: 0f 84 59 00 00 00            	je	0x800c61 <getint+0xd1>
; 		return va_arg(*ap, long);
  800c08: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c0c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800c10: 8b 00                        	movl	(%rax), %eax
  800c12: 89 45 d4                     	movl	%eax, -44(%rbp)
  800c15: 83 f8 28                     	cmpl	$40, %eax
  800c18: 0f 87 1c 00 00 00            	ja	0x800c3a <getint+0xaa>
  800c1e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800c22: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800c25: 48 63 c2                     	movslq	%edx, %rax
  800c28: 48 03 41 10                  	addq	16(%rcx), %rax
  800c2c: 83 c2 08                     	addl	$8, %edx
  800c2f: 89 11                        	movl	%edx, (%rcx)
  800c31: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c35: e9 17 00 00 00               	jmp	0x800c51 <getint+0xc1>
  800c3a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800c3e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c42: 48 89 d0                     	movq	%rdx, %rax
  800c45: 48 83 c2 08                  	addq	$8, %rdx
  800c49: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c4d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c51: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800c55: 48 8b 00                     	movq	(%rax), %rax
  800c58: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c5c: e9 54 00 00 00               	jmp	0x800cb5 <getint+0x125>
; 		return va_arg(*ap, int);
  800c61: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c65: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c69: 8b 00                        	movl	(%rax), %eax
  800c6b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c6e: 83 f8 28                     	cmpl	$40, %eax
  800c71: 0f 87 1c 00 00 00            	ja	0x800c93 <getint+0x103>
  800c77: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c7b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800c7e: 48 63 c2                     	movslq	%edx, %rax
  800c81: 48 03 41 10                  	addq	16(%rcx), %rax
  800c85: 83 c2 08                     	addl	$8, %edx
  800c88: 89 11                        	movl	%edx, (%rcx)
  800c8a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c8e: e9 17 00 00 00               	jmp	0x800caa <getint+0x11a>
  800c93: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c97: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c9b: 48 89 d0                     	movq	%rdx, %rax
  800c9e: 48 83 c2 08                  	addq	$8, %rdx
  800ca2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800ca6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800caa: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800cae: 48 63 00                     	movslq	(%rax), %rax
  800cb1: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800cb5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800cb9: 5d                           	popq	%rbp
  800cba: c3                           	retq
  800cbb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800cc0 <getuint>:
; {
  800cc0: 55                           	pushq	%rbp
  800cc1: 48 89 e5                     	movq	%rsp, %rbp
  800cc4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800cc8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800ccb: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800ccf: 0f 8c 59 00 00 00            	jl	0x800d2e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800cd5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cd9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800cdd: 8b 00                        	movl	(%rax), %eax
  800cdf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800ce2: 83 f8 28                     	cmpl	$40, %eax
  800ce5: 0f 87 1c 00 00 00            	ja	0x800d07 <getuint+0x47>
  800ceb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800cef: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800cf2: 48 63 c2                     	movslq	%edx, %rax
  800cf5: 48 03 41 10                  	addq	16(%rcx), %rax
  800cf9: 83 c2 08                     	addl	$8, %edx
  800cfc: 89 11                        	movl	%edx, (%rcx)
  800cfe: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d02: e9 17 00 00 00               	jmp	0x800d1e <getuint+0x5e>
  800d07: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800d0b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d0f: 48 89 d0                     	movq	%rdx, %rax
  800d12: 48 83 c2 08                  	addq	$8, %rdx
  800d16: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d1a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d1e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800d22: 48 8b 00                     	movq	(%rax), %rax
  800d25: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d29: e9 b6 00 00 00               	jmp	0x800de4 <getuint+0x124>
; 	else if (lflag)
  800d2e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800d32: 0f 84 59 00 00 00            	je	0x800d91 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800d38: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d3c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d40: 8b 00                        	movl	(%rax), %eax
  800d42: 89 45 d4                     	movl	%eax, -44(%rbp)
  800d45: 83 f8 28                     	cmpl	$40, %eax
  800d48: 0f 87 1c 00 00 00            	ja	0x800d6a <getuint+0xaa>
  800d4e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800d52: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800d55: 48 63 c2                     	movslq	%edx, %rax
  800d58: 48 03 41 10                  	addq	16(%rcx), %rax
  800d5c: 83 c2 08                     	addl	$8, %edx
  800d5f: 89 11                        	movl	%edx, (%rcx)
  800d61: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d65: e9 17 00 00 00               	jmp	0x800d81 <getuint+0xc1>
  800d6a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800d6e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d72: 48 89 d0                     	movq	%rdx, %rax
  800d75: 48 83 c2 08                  	addq	$8, %rdx
  800d79: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d7d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d81: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d85: 48 8b 00                     	movq	(%rax), %rax
  800d88: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d8c: e9 53 00 00 00               	jmp	0x800de4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d91: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d95: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d99: 8b 00                        	movl	(%rax), %eax
  800d9b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d9e: 83 f8 28                     	cmpl	$40, %eax
  800da1: 0f 87 1c 00 00 00            	ja	0x800dc3 <getuint+0x103>
  800da7: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800dab: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800dae: 48 63 c2                     	movslq	%edx, %rax
  800db1: 48 03 41 10                  	addq	16(%rcx), %rax
  800db5: 83 c2 08                     	addl	$8, %edx
  800db8: 89 11                        	movl	%edx, (%rcx)
  800dba: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dbe: e9 17 00 00 00               	jmp	0x800dda <getuint+0x11a>
  800dc3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800dc7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800dcb: 48 89 d0                     	movq	%rdx, %rax
  800dce: 48 83 c2 08                  	addq	$8, %rdx
  800dd2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800dd6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dda: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800dde: 8b 00                        	movl	(%rax), %eax
  800de0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800de4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800de8: 5d                           	popq	%rbp
  800de9: c3                           	retq
  800dea: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800df0 <printnum>:
; {
  800df0: 55                           	pushq	%rbp
  800df1: 48 89 e5                     	movq	%rsp, %rbp
  800df4: 48 83 ec 30                  	subq	$48, %rsp
  800df8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800dfc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800e00: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800e04: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800e07: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800e0b: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800e0f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e13: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e16: 48 39 c8                     	cmpq	%rcx, %rax
  800e19: 0f 82 30 00 00 00            	jb	0x800e4f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800e1f: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800e23: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e27: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e2b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e2e: 31 d2                        	xorl	%edx, %edx
  800e30: 48 f7 f1                     	divq	%rcx
  800e33: 48 89 c2                     	movq	%rax, %rdx
  800e36: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e39: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800e3d: 41 83 e8 01                  	subl	$1, %r8d
  800e41: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800e45: e8 a6 ff ff ff               	callq	0x800df0 <printnum>
; 	} else {
  800e4a: e9 2e 00 00 00               	jmp	0x800e7d <printnum+0x8d>
; 		while (--width > 0)
  800e4f: e9 00 00 00 00               	jmp	0x800e54 <printnum+0x64>
  800e54: 8b 45 e0                     	movl	-32(%rbp), %eax
  800e57: 83 c0 ff                     	addl	$-1, %eax
  800e5a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800e5d: 83 f8 00                     	cmpl	$0, %eax
  800e60: 0f 8e 12 00 00 00            	jle	0x800e78 <printnum+0x88>
; 			putch(padc, putdat);
  800e66: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e6a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800e6d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e71: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800e73: e9 dc ff ff ff               	jmp	0x800e54 <printnum+0x64>
  800e78: e9 00 00 00 00               	jmp	0x800e7d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800e7d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e81: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e85: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e89: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e8c: 31 d2                        	xorl	%edx, %edx
  800e8e: 48 f7 f1                     	divq	%rcx
  800e91: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e95: 48 8d 0d 17 12 00 00         	leaq	4631(%rip), %rcx        # 0x8020b3 <syscall.c+0x8020b3>
  800e9c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800ea0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ea4: ff d0                        	callq	*%rax
; }
  800ea6: 48 83 c4 30                  	addq	$48, %rsp
  800eaa: 5d                           	popq	%rbp
  800eab: c3                           	retq
  800eac: 0f 1f 40 00                  	nopl	(%rax)

0000000000800eb0 <vsnprintf>:
; {
  800eb0: 55                           	pushq	%rbp
  800eb1: 48 89 e5                     	movq	%rsp, %rbp
  800eb4: 48 83 ec 40                  	subq	$64, %rsp
  800eb8: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800ebc: 89 75 ec                     	movl	%esi, -20(%rbp)
  800ebf: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800ec3: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800ec7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ecb: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ecf: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ed3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800ed7: 48 01 c8                     	addq	%rcx, %rax
  800eda: 48 83 c0 ff                  	addq	$-1, %rax
  800ede: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800ee2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800ee9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800eee: 0f 84 0a 00 00 00            	je	0x800efe <vsnprintf+0x4e>
  800ef4: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800ef8: 0f 8d 0c 00 00 00            	jge	0x800f0a <vsnprintf+0x5a>
; 		return -EINVAL;
  800efe: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800f05: e9 25 00 00 00               	jmp	0x800f2f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800f0a: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800f0e: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800f12: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800f16: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800f40 <sprintputch>
  800f1d: e8 2e f5 ff ff               	callq	0x800450 <vprintfmt>
; 	*b.buf = '\0';
  800f22: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800f26: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800f29: 8b 45 d0                     	movl	-48(%rbp), %eax
  800f2c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800f2f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f32: 48 83 c4 40                  	addq	$64, %rsp
  800f36: 5d                           	popq	%rbp
  800f37: c3                           	retq
  800f38: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800f40 <sprintputch>:
; {
  800f40: 55                           	pushq	%rbp
  800f41: 48 89 e5                     	movq	%rsp, %rbp
  800f44: 89 7d fc                     	movl	%edi, -4(%rbp)
  800f47: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800f4b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f4f: 8b 48 10                     	movl	16(%rax), %ecx
  800f52: 83 c1 01                     	addl	$1, %ecx
  800f55: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800f58: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f5c: 48 8b 00                     	movq	(%rax), %rax
  800f5f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800f63: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800f67: 0f 83 18 00 00 00            	jae	0x800f85 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800f6d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f70: 88 c1                        	movb	%al, %cl
  800f72: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800f76: 48 8b 02                     	movq	(%rdx), %rax
  800f79: 48 89 c6                     	movq	%rax, %rsi
  800f7c: 48 83 c6 01                  	addq	$1, %rsi
  800f80: 48 89 32                     	movq	%rsi, (%rdx)
  800f83: 88 08                        	movb	%cl, (%rax)
; }
  800f85: 5d                           	popq	%rbp
  800f86: c3                           	retq
  800f87: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f90 <snprintf>:
; {
  800f90: 55                           	pushq	%rbp
  800f91: 48 89 e5                     	movq	%rsp, %rbp
  800f94: 48 83 ec 70                  	subq	$112, %rsp
  800f98: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f9c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800fa0: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800fa4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800fa8: 89 75 f4                     	movl	%esi, -12(%rbp)
  800fab: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800faf: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800fb3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800fb7: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800fbb: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800fbf: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800fc6: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800fcd: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fd1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800fd4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800fd8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800fdc: e8 cf fe ff ff               	callq	0x800eb0 <vsnprintf>
  800fe1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800fe4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800fe7: 48 83 c4 70                  	addq	$112, %rsp
  800feb: 5d                           	popq	%rbp
  800fec: c3                           	retq
  800fed: cc                           	int3
  800fee: cc                           	int3
  800fef: cc                           	int3

0000000000800ff0 <strlen>:
; {
  800ff0: 55                           	pushq	%rbp
  800ff1: 48 89 e5                     	movq	%rsp, %rbp
  800ff4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800ff8: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800fff: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801003: 0f be 00                     	movsbl	(%rax), %eax
  801006: 83 f8 00                     	cmpl	$0, %eax
  801009: 0f 84 1a 00 00 00            	je	0x801029 <strlen+0x39>
; 		n++;
  80100f: 8b 45 f4                     	movl	-12(%rbp), %eax
  801012: 83 c0 01                     	addl	$1, %eax
  801015: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  801018: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80101c: 48 83 c0 01                  	addq	$1, %rax
  801020: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801024: e9 d6 ff ff ff               	jmp	0x800fff <strlen+0xf>
; 	return n;
  801029: 8b 45 f4                     	movl	-12(%rbp), %eax
  80102c: 5d                           	popq	%rbp
  80102d: c3                           	retq
  80102e: 66 90                        	nop

0000000000801030 <strnlen>:
; {
  801030: 55                           	pushq	%rbp
  801031: 48 89 e5                     	movq	%rsp, %rbp
  801034: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801038: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80103c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  801043: 31 c0                        	xorl	%eax, %eax
  801045: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  80104a: 88 45 eb                     	movb	%al, -21(%rbp)
  80104d: 0f 86 10 00 00 00            	jbe	0x801063 <strnlen+0x33>
  801053: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801057: 0f be 00                     	movsbl	(%rax), %eax
  80105a: 83 f8 00                     	cmpl	$0, %eax
  80105d: 0f 95 c0                     	setne	%al
  801060: 88 45 eb                     	movb	%al, -21(%rbp)
  801063: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  801066: a8 01                        	testb	$1, %al
  801068: 0f 85 05 00 00 00            	jne	0x801073 <strnlen+0x43>
  80106e: e9 26 00 00 00               	jmp	0x801099 <strnlen+0x69>
; 		n++;
  801073: 8b 45 ec                     	movl	-20(%rbp), %eax
  801076: 83 c0 01                     	addl	$1, %eax
  801079: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80107c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801080: 48 83 c0 01                  	addq	$1, %rax
  801084: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801088: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80108c: 48 83 c0 ff                  	addq	$-1, %rax
  801090: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801094: e9 aa ff ff ff               	jmp	0x801043 <strnlen+0x13>
; 	return n;
  801099: 8b 45 ec                     	movl	-20(%rbp), %eax
  80109c: 5d                           	popq	%rbp
  80109d: c3                           	retq
  80109e: 66 90                        	nop

00000000008010a0 <strcpy>:
; {
  8010a0: 55                           	pushq	%rbp
  8010a1: 48 89 e5                     	movq	%rsp, %rbp
  8010a4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010a8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  8010ac: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010b0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  8010b4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010b8: 48 89 c1                     	movq	%rax, %rcx
  8010bb: 48 83 c1 01                  	addq	$1, %rcx
  8010bf: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8010c3: 8a 00                        	movb	(%rax), %al
  8010c5: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8010c9: 48 89 ca                     	movq	%rcx, %rdx
  8010cc: 48 83 c2 01                  	addq	$1, %rdx
  8010d0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010d4: 88 01                        	movb	%al, (%rcx)
  8010d6: 0f be c0                     	movsbl	%al, %eax
  8010d9: 83 f8 00                     	cmpl	$0, %eax
  8010dc: 0f 84 05 00 00 00            	je	0x8010e7 <strcpy+0x47>
  8010e2: e9 cd ff ff ff               	jmp	0x8010b4 <strcpy+0x14>
; 	return ret;
  8010e7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8010eb: 5d                           	popq	%rbp
  8010ec: c3                           	retq
  8010ed: 0f 1f 00                     	nopl	(%rax)

00000000008010f0 <strcat>:
; {
  8010f0: 55                           	pushq	%rbp
  8010f1: 48 89 e5                     	movq	%rsp, %rbp
  8010f4: 48 83 ec 20                  	subq	$32, %rsp
  8010f8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010fc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  801100: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801104: e8 e7 fe ff ff               	callq	0x800ff0 <strlen>
  801109: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  80110c: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801110: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  801114: 48 01 c7                     	addq	%rax, %rdi
  801117: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80111b: e8 80 ff ff ff               	callq	0x8010a0 <strcpy>
; 	return dst;
  801120: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801124: 48 83 c4 20                  	addq	$32, %rsp
  801128: 5d                           	popq	%rbp
  801129: c3                           	retq
  80112a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000801130 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  801130: 55                           	pushq	%rbp
  801131: 48 89 e5                     	movq	%rsp, %rbp
  801134: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801138: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80113c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  801140: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801144: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  801148: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  801150: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801154: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  801158: 0f 83 49 00 00 00            	jae	0x8011a7 <strncpy+0x77>
; 		*dst++ = *src;
  80115e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801162: 8a 08                        	movb	(%rax), %cl
  801164: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801168: 48 89 c2                     	movq	%rax, %rdx
  80116b: 48 83 c2 01                  	addq	$1, %rdx
  80116f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801173: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801175: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801179: 0f be 00                     	movsbl	(%rax), %eax
  80117c: 83 f8 00                     	cmpl	$0, %eax
  80117f: 0f 84 0c 00 00 00            	je	0x801191 <strncpy+0x61>
; 			src++;
  801185: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801189: 48 83 c0 01                  	addq	$1, %rax
  80118d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801191: e9 00 00 00 00               	jmp	0x801196 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801196: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80119a: 48 83 c0 01                  	addq	$1, %rax
  80119e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8011a2: e9 a9 ff ff ff               	jmp	0x801150 <strncpy+0x20>
; 	return ret;
  8011a7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8011ab: 5d                           	popq	%rbp
  8011ac: c3                           	retq
  8011ad: 0f 1f 00                     	nopl	(%rax)

00000000008011b0 <strlcpy>:
; {
  8011b0: 55                           	pushq	%rbp
  8011b1: 48 89 e5                     	movq	%rsp, %rbp
  8011b4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011b8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8011bc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  8011c0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011c4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  8011c8: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  8011cd: 0f 86 6e 00 00 00            	jbe	0x801241 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  8011d3: e9 00 00 00 00               	jmp	0x8011d8 <strlcpy+0x28>
  8011d8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011dc: 48 83 c1 ff                  	addq	$-1, %rcx
  8011e0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8011e4: 31 c0                        	xorl	%eax, %eax
  8011e6: 48 83 f9 00                  	cmpq	$0, %rcx
  8011ea: 88 45 df                     	movb	%al, -33(%rbp)
  8011ed: 0f 86 10 00 00 00            	jbe	0x801203 <strlcpy+0x53>
  8011f3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011f7: 0f be 00                     	movsbl	(%rax), %eax
  8011fa: 83 f8 00                     	cmpl	$0, %eax
  8011fd: 0f 95 c0                     	setne	%al
  801200: 88 45 df                     	movb	%al, -33(%rbp)
  801203: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801206: a8 01                        	testb	$1, %al
  801208: 0f 85 05 00 00 00            	jne	0x801213 <strlcpy+0x63>
  80120e: e9 27 00 00 00               	jmp	0x80123a <strlcpy+0x8a>
; 			*dst++ = *src++;
  801213: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801217: 48 89 c1                     	movq	%rax, %rcx
  80121a: 48 83 c1 01                  	addq	$1, %rcx
  80121e: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801222: 8a 08                        	movb	(%rax), %cl
  801224: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801228: 48 89 c2                     	movq	%rax, %rdx
  80122b: 48 83 c2 01                  	addq	$1, %rdx
  80122f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801233: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801235: e9 9e ff ff ff               	jmp	0x8011d8 <strlcpy+0x28>
; 		*dst = '\0';
  80123a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80123e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801241: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801245: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801249: 48 29 c8                     	subq	%rcx, %rax
  80124c: 5d                           	popq	%rbp
  80124d: c3                           	retq
  80124e: 66 90                        	nop

0000000000801250 <strcmp>:
; {
  801250: 55                           	pushq	%rbp
  801251: 48 89 e5                     	movq	%rsp, %rbp
  801254: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801258: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80125c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801260: 0f be 08                     	movsbl	(%rax), %ecx
  801263: 31 c0                        	xorl	%eax, %eax
  801265: 83 f9 00                     	cmpl	$0, %ecx
  801268: 88 45 ef                     	movb	%al, -17(%rbp)
  80126b: 0f 84 16 00 00 00            	je	0x801287 <strcmp+0x37>
  801271: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801275: 0f be 00                     	movsbl	(%rax), %eax
  801278: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80127c: 0f be 09                     	movsbl	(%rcx), %ecx
  80127f: 39 c8                        	cmpl	%ecx, %eax
  801281: 0f 94 c0                     	sete	%al
  801284: 88 45 ef                     	movb	%al, -17(%rbp)
  801287: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80128a: a8 01                        	testb	$1, %al
  80128c: 0f 85 05 00 00 00            	jne	0x801297 <strcmp+0x47>
  801292: e9 1d 00 00 00               	jmp	0x8012b4 <strcmp+0x64>
; 		p++, q++;
  801297: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80129b: 48 83 c0 01                  	addq	$1, %rax
  80129f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8012a3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012a7: 48 83 c0 01                  	addq	$1, %rax
  8012ab: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  8012af: e9 a8 ff ff ff               	jmp	0x80125c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  8012b4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012b8: 0f b6 00                     	movzbl	(%rax), %eax
  8012bb: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8012bf: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012c2: 29 c8                        	subl	%ecx, %eax
  8012c4: 5d                           	popq	%rbp
  8012c5: c3                           	retq
  8012c6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008012d0 <strncmp>:
; {
  8012d0: 55                           	pushq	%rbp
  8012d1: 48 89 e5                     	movq	%rsp, %rbp
  8012d4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012d8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8012dc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012e0: 31 c0                        	xorl	%eax, %eax
  8012e2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012e7: 88 45 df                     	movb	%al, -33(%rbp)
  8012ea: 0f 86 2b 00 00 00            	jbe	0x80131b <strncmp+0x4b>
  8012f0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012f4: 0f be 08                     	movsbl	(%rax), %ecx
  8012f7: 31 c0                        	xorl	%eax, %eax
  8012f9: 83 f9 00                     	cmpl	$0, %ecx
  8012fc: 88 45 df                     	movb	%al, -33(%rbp)
  8012ff: 0f 84 16 00 00 00            	je	0x80131b <strncmp+0x4b>
  801305: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801309: 0f be 00                     	movsbl	(%rax), %eax
  80130c: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801310: 0f be 09                     	movsbl	(%rcx), %ecx
  801313: 39 c8                        	cmpl	%ecx, %eax
  801315: 0f 94 c0                     	sete	%al
  801318: 88 45 df                     	movb	%al, -33(%rbp)
  80131b: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80131e: a8 01                        	testb	$1, %al
  801320: 0f 85 05 00 00 00            	jne	0x80132b <strncmp+0x5b>
  801326: e9 29 00 00 00               	jmp	0x801354 <strncmp+0x84>
; 		n--, p++, q++;
  80132b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80132f: 48 83 c0 ff                  	addq	$-1, %rax
  801333: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801337: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80133b: 48 83 c0 01                  	addq	$1, %rax
  80133f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801343: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801347: 48 83 c0 01                  	addq	$1, %rax
  80134b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80134f: e9 8c ff ff ff               	jmp	0x8012e0 <strncmp+0x10>
; 	if (n == 0)
  801354: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801359: 0f 85 0c 00 00 00            	jne	0x80136b <strncmp+0x9b>
; 		return 0;
  80135f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801366: e9 13 00 00 00               	jmp	0x80137e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80136b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80136f: 0f b6 00                     	movzbl	(%rax), %eax
  801372: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801376: 0f b6 09                     	movzbl	(%rcx), %ecx
  801379: 29 c8                        	subl	%ecx, %eax
  80137b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80137e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801381: 5d                           	popq	%rbp
  801382: c3                           	retq
  801383: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80138d: 0f 1f 00                     	nopl	(%rax)

0000000000801390 <strchr>:
; {
  801390: 55                           	pushq	%rbp
  801391: 48 89 e5                     	movq	%rsp, %rbp
  801394: 40 88 f0                     	movb	%sil, %al
  801397: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80139b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80139e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013a2: 80 38 00                     	cmpb	$0, (%rax)
  8013a5: 0f 84 36 00 00 00            	je	0x8013e1 <strchr+0x51>
; 		if (*s == c)
  8013ab: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013af: 0f be 00                     	movsbl	(%rax), %eax
  8013b2: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  8013b6: 39 c8                        	cmpl	%ecx, %eax
  8013b8: 0f 85 0d 00 00 00            	jne	0x8013cb <strchr+0x3b>
; 			return (char *) s;
  8013be: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013c2: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013c6: e9 1e 00 00 00               	jmp	0x8013e9 <strchr+0x59>
; 		if (*s == c)
  8013cb: e9 00 00 00 00               	jmp	0x8013d0 <strchr+0x40>
; 	for (; *s; s++)
  8013d0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013d4: 48 83 c0 01                  	addq	$1, %rax
  8013d8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8013dc: e9 bd ff ff ff               	jmp	0x80139e <strchr+0xe>
; 	return 0;
  8013e1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8013e9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013ed: 5d                           	popq	%rbp
  8013ee: c3                           	retq
  8013ef: 90                           	nop

00000000008013f0 <strfind>:
; {
  8013f0: 55                           	pushq	%rbp
  8013f1: 48 89 e5                     	movq	%rsp, %rbp
  8013f4: 40 88 f0                     	movb	%sil, %al
  8013f7: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8013fb: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  8013fe: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801402: 80 38 00                     	cmpb	$0, (%rax)
  801405: 0f 84 2e 00 00 00            	je	0x801439 <strfind+0x49>
; 		if (*s == c)
  80140b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80140f: 0f be 00                     	movsbl	(%rax), %eax
  801412: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  801416: 39 c8                        	cmpl	%ecx, %eax
  801418: 0f 85 05 00 00 00            	jne	0x801423 <strfind+0x33>
; 			break;
  80141e: e9 16 00 00 00               	jmp	0x801439 <strfind+0x49>
; 		if (*s == c)
  801423: e9 00 00 00 00               	jmp	0x801428 <strfind+0x38>
; 	for (; *s; s++)
  801428: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80142c: 48 83 c0 01                  	addq	$1, %rax
  801430: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801434: e9 c5 ff ff ff               	jmp	0x8013fe <strfind+0xe>
; 	return (char *) s;
  801439: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80143d: 5d                           	popq	%rbp
  80143e: c3                           	retq
  80143f: 90                           	nop

0000000000801440 <memset>:
; {
  801440: 55                           	pushq	%rbp
  801441: 48 89 e5                     	movq	%rsp, %rbp
  801444: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801448: 89 75 ec                     	movl	%esi, -20(%rbp)
  80144b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80144f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801454: 0f 85 0d 00 00 00            	jne	0x801467 <memset+0x27>
; 		return v;
  80145a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80145e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801462: e9 78 00 00 00               	jmp	0x8014df <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801467: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80146b: 48 83 e0 03                  	andq	$3, %rax
  80146f: 48 83 f8 00                  	cmpq	$0, %rax
  801473: 0f 85 50 00 00 00            	jne	0x8014c9 <memset+0x89>
  801479: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80147d: 48 83 e0 03                  	andq	$3, %rax
  801481: 48 83 f8 00                  	cmpq	$0, %rax
  801485: 0f 85 3e 00 00 00            	jne	0x8014c9 <memset+0x89>
; 		c &= 0xFF;
  80148b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80148e: 25 ff 00 00 00               	andl	$255, %eax
  801493: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801496: 8b 45 ec                     	movl	-20(%rbp), %eax
  801499: c1 e0 18                     	shll	$24, %eax
  80149c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80149f: c1 e1 10                     	shll	$16, %ecx
  8014a2: 09 c8                        	orl	%ecx, %eax
  8014a4: 8b 4d ec                     	movl	-20(%rbp), %ecx
  8014a7: c1 e1 08                     	shll	$8, %ecx
  8014aa: 09 c8                        	orl	%ecx, %eax
  8014ac: 0b 45 ec                     	orl	-20(%rbp), %eax
  8014af: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  8014b2: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014b6: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014b9: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8014bd: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  8014c1: fc                           	cld
  8014c2: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  8014c4: e9 0e 00 00 00               	jmp	0x8014d7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  8014c9: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014cd: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014d0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8014d4: fc                           	cld
  8014d5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8014d7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014db: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8014df: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014e3: 5d                           	popq	%rbp
  8014e4: c3                           	retq
  8014e5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014ef: 90                           	nop

00000000008014f0 <memmove>:
; {
  8014f0: 55                           	pushq	%rbp
  8014f1: 48 89 e5                     	movq	%rsp, %rbp
  8014f4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014f8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8014fc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  801500: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801504: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  801508: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80150c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  801510: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801514: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  801518: 0f 83 9d 00 00 00            	jae	0x8015bb <memmove+0xcb>
  80151e: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801522: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801526: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80152a: 0f 86 8b 00 00 00            	jbe	0x8015bb <memmove+0xcb>
; 		s += n;
  801530: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801534: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801538: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80153c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801540: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801544: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801548: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80154c: 48 83 e0 03                  	andq	$3, %rax
  801550: 48 83 f8 00                  	cmpq	$0, %rax
  801554: 0f 85 44 00 00 00            	jne	0x80159e <memmove+0xae>
  80155a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80155e: 48 83 e0 03                  	andq	$3, %rax
  801562: 48 83 f8 00                  	cmpq	$0, %rax
  801566: 0f 85 32 00 00 00            	jne	0x80159e <memmove+0xae>
  80156c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801570: 48 83 e0 03                  	andq	$3, %rax
  801574: 48 83 f8 00                  	cmpq	$0, %rax
  801578: 0f 85 20 00 00 00            	jne	0x80159e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80157e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801582: 48 83 c7 fc                  	addq	$-4, %rdi
  801586: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80158a: 48 83 c6 fc                  	addq	$-4, %rsi
  80158e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801592: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801596: fd                           	std
  801597: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801599: e9 17 00 00 00               	jmp	0x8015b5 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80159e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015a2: 48 83 c7 ff                  	addq	$-1, %rdi
  8015a6: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015aa: 48 83 c6 ff                  	addq	$-1, %rsi
  8015ae: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  8015b2: fd                           	std
  8015b3: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  8015b5: fc                           	cld
; 	} else {
  8015b6: e9 62 00 00 00               	jmp	0x80161d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8015bb: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8015bf: 48 83 e0 03                  	andq	$3, %rax
  8015c3: 48 83 f8 00                  	cmpq	$0, %rax
  8015c7: 0f 85 3c 00 00 00            	jne	0x801609 <memmove+0x119>
  8015cd: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8015d1: 48 83 e0 03                  	andq	$3, %rax
  8015d5: 48 83 f8 00                  	cmpq	$0, %rax
  8015d9: 0f 85 2a 00 00 00            	jne	0x801609 <memmove+0x119>
  8015df: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015e3: 48 83 e0 03                  	andq	$3, %rax
  8015e7: 48 83 f8 00                  	cmpq	$0, %rax
  8015eb: 0f 85 18 00 00 00            	jne	0x801609 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8015f1: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015f5: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015f9: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8015fd: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801601: fc                           	cld
  801602: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801604: e9 0f 00 00 00               	jmp	0x801618 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801609: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  80160d: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801611: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801615: fc                           	cld
  801616: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801618: e9 00 00 00 00               	jmp	0x80161d <memmove+0x12d>
; 	return dst;
  80161d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801621: 5d                           	popq	%rbp
  801622: c3                           	retq
  801623: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80162d: 0f 1f 00                     	nopl	(%rax)

0000000000801630 <memcpy>:
; {
  801630: 55                           	pushq	%rbp
  801631: 48 89 e5                     	movq	%rsp, %rbp
  801634: 48 83 ec 20                  	subq	$32, %rsp
  801638: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80163c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801640: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801644: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801648: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80164c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801650: e8 9b fe ff ff               	callq	0x8014f0 <memmove>
  801655: 48 83 c4 20                  	addq	$32, %rsp
  801659: 5d                           	popq	%rbp
  80165a: c3                           	retq
  80165b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801660 <memcmp>:
; {
  801660: 55                           	pushq	%rbp
  801661: 48 89 e5                     	movq	%rsp, %rbp
  801664: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801668: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80166c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801670: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801674: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801678: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80167c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801680: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801684: 48 89 c1                     	movq	%rax, %rcx
  801687: 48 83 c1 ff                  	addq	$-1, %rcx
  80168b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80168f: 48 83 f8 00                  	cmpq	$0, %rax
  801693: 0f 86 4b 00 00 00            	jbe	0x8016e4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801699: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80169d: 0f b6 00                     	movzbl	(%rax), %eax
  8016a0: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  8016a4: 0f b6 09                     	movzbl	(%rcx), %ecx
  8016a7: 39 c8                        	cmpl	%ecx, %eax
  8016a9: 0f 84 18 00 00 00            	je	0x8016c7 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  8016af: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016b3: 0f b6 00                     	movzbl	(%rax), %eax
  8016b6: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  8016ba: 0f b6 09                     	movzbl	(%rcx), %ecx
  8016bd: 29 c8                        	subl	%ecx, %eax
  8016bf: 89 45 fc                     	movl	%eax, -4(%rbp)
  8016c2: e9 24 00 00 00               	jmp	0x8016eb <memcmp+0x8b>
; 		s1++, s2++;
  8016c7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016cb: 48 83 c0 01                  	addq	$1, %rax
  8016cf: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8016d3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8016d7: 48 83 c0 01                  	addq	$1, %rax
  8016db: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8016df: e9 9c ff ff ff               	jmp	0x801680 <memcmp+0x20>
; 	return 0;
  8016e4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8016eb: 8b 45 fc                     	movl	-4(%rbp), %eax
  8016ee: 5d                           	popq	%rbp
  8016ef: c3                           	retq

00000000008016f0 <memfind>:
; {
  8016f0: 55                           	pushq	%rbp
  8016f1: 48 89 e5                     	movq	%rsp, %rbp
  8016f4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016f8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8016fb: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  8016ff: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801703: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801707: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  80170b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80170f: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  801713: 0f 83 30 00 00 00            	jae	0x801749 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801719: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80171d: 0f b6 00                     	movzbl	(%rax), %eax
  801720: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801723: 0f b6 c9                     	movzbl	%cl, %ecx
  801726: 39 c8                        	cmpl	%ecx, %eax
  801728: 0f 85 05 00 00 00            	jne	0x801733 <memfind+0x43>
; 			break;
  80172e: e9 16 00 00 00               	jmp	0x801749 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801733: e9 00 00 00 00               	jmp	0x801738 <memfind+0x48>
; 	for (; s < ends; s++)
  801738: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80173c: 48 83 c0 01                  	addq	$1, %rax
  801740: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801744: e9 c2 ff ff ff               	jmp	0x80170b <memfind+0x1b>
; 	return (void *) s;
  801749: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80174d: 5d                           	popq	%rbp
  80174e: c3                           	retq
  80174f: 90                           	nop

0000000000801750 <strtol>:
; {
  801750: 55                           	pushq	%rbp
  801751: 48 89 e5                     	movq	%rsp, %rbp
  801754: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801758: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80175c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80175f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801766: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80176e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801772: 0f be 08                     	movsbl	(%rax), %ecx
  801775: b0 01                        	movb	$1, %al
  801777: 83 f9 20                     	cmpl	$32, %ecx
  80177a: 88 45 db                     	movb	%al, -37(%rbp)
  80177d: 0f 84 10 00 00 00            	je	0x801793 <strtol+0x43>
  801783: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801787: 0f be 00                     	movsbl	(%rax), %eax
  80178a: 83 f8 09                     	cmpl	$9, %eax
  80178d: 0f 94 c0                     	sete	%al
  801790: 88 45 db                     	movb	%al, -37(%rbp)
  801793: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801796: a8 01                        	testb	$1, %al
  801798: 0f 85 05 00 00 00            	jne	0x8017a3 <strtol+0x53>
  80179e: e9 11 00 00 00               	jmp	0x8017b4 <strtol+0x64>
; 		s++;
  8017a3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a7: 48 83 c0 01                  	addq	$1, %rax
  8017ab: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8017af: e9 ba ff ff ff               	jmp	0x80176e <strtol+0x1e>
; 	if (*s == '+')
  8017b4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b8: 0f be 00                     	movsbl	(%rax), %eax
  8017bb: 83 f8 2b                     	cmpl	$43, %eax
  8017be: 0f 85 11 00 00 00            	jne	0x8017d5 <strtol+0x85>
; 		s++;
  8017c4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017c8: 48 83 c0 01                  	addq	$1, %rax
  8017cc: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017d0: e9 28 00 00 00               	jmp	0x8017fd <strtol+0xad>
; 	else if (*s == '-')
  8017d5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017d9: 0f be 00                     	movsbl	(%rax), %eax
  8017dc: 83 f8 2d                     	cmpl	$45, %eax
  8017df: 0f 85 13 00 00 00            	jne	0x8017f8 <strtol+0xa8>
; 		s++, neg = 1;
  8017e5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017e9: 48 83 c0 01                  	addq	$1, %rax
  8017ed: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017f1: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  8017f8: e9 00 00 00 00               	jmp	0x8017fd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8017fd: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801801: 0f 84 0a 00 00 00            	je	0x801811 <strtol+0xc1>
  801807: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  80180b: 0f 85 39 00 00 00            	jne	0x80184a <strtol+0xfa>
  801811: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801815: 0f be 00                     	movsbl	(%rax), %eax
  801818: 83 f8 30                     	cmpl	$48, %eax
  80181b: 0f 85 29 00 00 00            	jne	0x80184a <strtol+0xfa>
  801821: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801825: 0f be 40 01                  	movsbl	1(%rax), %eax
  801829: 83 f8 78                     	cmpl	$120, %eax
  80182c: 0f 85 18 00 00 00            	jne	0x80184a <strtol+0xfa>
; 		s += 2, base = 16;
  801832: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801836: 48 83 c0 02                  	addq	$2, %rax
  80183a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80183e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801845: e9 4d 00 00 00               	jmp	0x801897 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80184a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80184e: 0f 85 28 00 00 00            	jne	0x80187c <strtol+0x12c>
  801854: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801858: 0f be 00                     	movsbl	(%rax), %eax
  80185b: 83 f8 30                     	cmpl	$48, %eax
  80185e: 0f 85 18 00 00 00            	jne	0x80187c <strtol+0x12c>
; 		s++, base = 8;
  801864: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801868: 48 83 c0 01                  	addq	$1, %rax
  80186c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801870: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801877: e9 16 00 00 00               	jmp	0x801892 <strtol+0x142>
; 	else if (base == 0)
  80187c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801880: 0f 85 07 00 00 00            	jne	0x80188d <strtol+0x13d>
; 		base = 10;
  801886: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80188d: e9 00 00 00 00               	jmp	0x801892 <strtol+0x142>
  801892: e9 00 00 00 00               	jmp	0x801897 <strtol+0x147>
; 	while (1) {
  801897: e9 00 00 00 00               	jmp	0x80189c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80189c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018a0: 0f be 00                     	movsbl	(%rax), %eax
  8018a3: 83 f8 30                     	cmpl	$48, %eax
  8018a6: 0f 8c 22 00 00 00            	jl	0x8018ce <strtol+0x17e>
  8018ac: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018b0: 0f be 00                     	movsbl	(%rax), %eax
  8018b3: 83 f8 39                     	cmpl	$57, %eax
  8018b6: 0f 8f 12 00 00 00            	jg	0x8018ce <strtol+0x17e>
; 			dig = *s - '0';
  8018bc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018c0: 0f be 00                     	movsbl	(%rax), %eax
  8018c3: 83 e8 30                     	subl	$48, %eax
  8018c6: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018c9: e9 79 00 00 00               	jmp	0x801947 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  8018ce: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018d2: 0f be 00                     	movsbl	(%rax), %eax
  8018d5: 83 f8 61                     	cmpl	$97, %eax
  8018d8: 0f 8c 25 00 00 00            	jl	0x801903 <strtol+0x1b3>
  8018de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018e2: 0f be 00                     	movsbl	(%rax), %eax
  8018e5: 83 f8 7a                     	cmpl	$122, %eax
  8018e8: 0f 8f 15 00 00 00            	jg	0x801903 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8018ee: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018f2: 0f be 00                     	movsbl	(%rax), %eax
  8018f5: 83 e8 61                     	subl	$97, %eax
  8018f8: 83 c0 0a                     	addl	$10, %eax
  8018fb: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018fe: e9 3f 00 00 00               	jmp	0x801942 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801903: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801907: 0f be 00                     	movsbl	(%rax), %eax
  80190a: 83 f8 41                     	cmpl	$65, %eax
  80190d: 0f 8c 25 00 00 00            	jl	0x801938 <strtol+0x1e8>
  801913: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801917: 0f be 00                     	movsbl	(%rax), %eax
  80191a: 83 f8 5a                     	cmpl	$90, %eax
  80191d: 0f 8f 15 00 00 00            	jg	0x801938 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801923: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801927: 0f be 00                     	movsbl	(%rax), %eax
  80192a: 83 e8 41                     	subl	$65, %eax
  80192d: 83 c0 0a                     	addl	$10, %eax
  801930: 89 45 dc                     	movl	%eax, -36(%rbp)
  801933: e9 05 00 00 00               	jmp	0x80193d <strtol+0x1ed>
; 			break;
  801938: e9 43 00 00 00               	jmp	0x801980 <strtol+0x230>
  80193d: e9 00 00 00 00               	jmp	0x801942 <strtol+0x1f2>
  801942: e9 00 00 00 00               	jmp	0x801947 <strtol+0x1f7>
; 		if (dig >= base)
  801947: 8b 45 dc                     	movl	-36(%rbp), %eax
  80194a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80194d: 0f 8c 05 00 00 00            	jl	0x801958 <strtol+0x208>
; 			break;
  801953: e9 28 00 00 00               	jmp	0x801980 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801958: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80195c: 48 83 c0 01                  	addq	$1, %rax
  801960: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801964: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801968: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80196c: 48 0f af c1                  	imulq	%rcx, %rax
  801970: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801974: 48 01 c8                     	addq	%rcx, %rax
  801977: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80197b: e9 1c ff ff ff               	jmp	0x80189c <strtol+0x14c>
; 	if (endptr)
  801980: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801985: 0f 84 0b 00 00 00            	je	0x801996 <strtol+0x246>
; 		*endptr = (char *) s;
  80198b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80198f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801993: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801996: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80199a: 0f 84 0f 00 00 00            	je	0x8019af <strtol+0x25f>
  8019a0: 31 c0                        	xorl	%eax, %eax
  8019a2: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  8019a6: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  8019aa: e9 08 00 00 00               	jmp	0x8019b7 <strtol+0x267>
  8019af: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8019b3: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  8019b7: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  8019bb: 5d                           	popq	%rbp
  8019bc: c3                           	retq
