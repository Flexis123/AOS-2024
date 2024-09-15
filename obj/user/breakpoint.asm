
obj/user/breakpoint:	file format elf64-x86-64

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
  800033: e8 18 00 00 00               	callq	0x800050 <libmain>
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
  800044: 89 7d fc                     	movl	%edi, -4(%rbp)
  800047: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	asm volatile("int $3");
  80004b: cc                           	int3
; }
  80004c: 31 c0                        	xorl	%eax, %eax
  80004e: 5d                           	popq	%rbp
  80004f: c3                           	retq

0000000000800050 <libmain>:
; {
  800050: 55                           	pushq	%rbp
  800051: 48 89 e5                     	movq	%rsp, %rbp
  800054: 48 83 ec 10                  	subq	$16, %rsp
  800058: 89 7d fc                     	movl	%edi, -4(%rbp)
  80005b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80005f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  800063: 0f 8e 11 00 00 00            	jle	0x80007a <libmain+0x2a>
; 		binary_name = argv[0];
  800069: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80006d: 48 8b 08                     	movq	(%rax), %rcx
  800070: 48 8d 05 89 2f 00 00         	leaq	12169(%rip), %rax       # 0x803000 <binary_name>
  800077: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  80007a: 8b 7d fc                     	movl	-4(%rbp), %edi
  80007d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800081: e8 ba ff ff ff               	callq	0x800040 <main>
; 	exit();
  800086: e8 15 00 00 00               	callq	0x8000a0 <exit>
; }
  80008b: 48 83 c4 10                  	addq	$16, %rsp
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
  8000a6: e8 15 01 00 00               	callq	0x8001c0 <kill>
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
  8000b4: 48 83 ec 20                  	subq	$32, %rsp
  8000b8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000bc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000c0: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8000c4: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8000c8: 31 f6                        	xorl	%esi, %esi
  8000ca: 31 c0                        	xorl	%eax, %eax
  8000cc: 41 89 c1                     	movl	%eax, %r9d
  8000cf: 89 f7                        	movl	%esi, %edi
  8000d1: 4d 89 c8                     	movq	%r9, %r8
  8000d4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000dc: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8000e5: e8 06 00 00 00               	callq	0x8000f0 <syscall>
; }
  8000ea: 48 83 c4 20                  	addq	$32, %rsp
  8000ee: 5d                           	popq	%rbp
  8000ef: c3                           	retq

00000000008000f0 <syscall>:
; {
  8000f0: 55                           	pushq	%rbp
  8000f1: 48 89 e5                     	movq	%rsp, %rbp
  8000f4: 48 83 ec 40                  	subq	$64, %rsp
  8000f8: 48 8b 45 18                  	movq	24(%rbp), %rax
  8000fc: 48 8b 45 10                  	movq	16(%rbp), %rax
  800100: 89 7d fc                     	movl	%edi, -4(%rbp)
  800103: 89 75 f8                     	movl	%esi, -8(%rbp)
  800106: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80010a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80010e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  800112: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800116: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80011a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80011e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800122: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800126: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80012a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80012e: 48 8b 45 18                  	movq	24(%rbp), %rax
  800132: 48 89 04 24                  	movq	%rax, (%rsp)
  800136: e8 01 01 00 00               	callq	0x80023c <do_syscall>
  80013b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80013f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  800143: 0f 84 2c 00 00 00            	je	0x800175 <syscall+0x85>
  800149: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80014e: 0f 83 21 00 00 00            	jae	0x800175 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  800154: 8b 4d fc                     	movl	-4(%rbp), %ecx
  800157: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80015b: 48 8d 3d 5c 1f 00 00         	leaq	8028(%rip), %rdi        # 0x8020be <syscall.c+0x8020be>
  800162: be 1f 00 00 00               	movl	$31, %esi
  800167: 48 8d 15 ee 1e 00 00         	leaq	7918(%rip), %rdx        # 0x80205c <syscall.c+0x80205c>
  80016e: b0 00                        	movb	$0, %al
  800170: e8 db 00 00 00               	callq	0x800250 <_panic>
; 	return ret;
  800175: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800179: 48 83 c4 40                  	addq	$64, %rsp
  80017d: 5d                           	popq	%rbp
  80017e: c3                           	retq
  80017f: 90                           	nop

0000000000800180 <getc>:
; {
  800180: 55                           	pushq	%rbp
  800181: 48 89 e5                     	movq	%rsp, %rbp
  800184: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800188: bf 01 00 00 00               	movl	$1, %edi
  80018d: 31 f6                        	xorl	%esi, %esi
  80018f: 31 c0                        	xorl	%eax, %eax
  800191: 41 89 c1                     	movl	%eax, %r9d
  800194: 4c 89 ca                     	movq	%r9, %rdx
  800197: 4c 89 c9                     	movq	%r9, %rcx
  80019a: 4d 89 c8                     	movq	%r9, %r8
  80019d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001a5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001ae: e8 3d ff ff ff               	callq	0x8000f0 <syscall>
  8001b3: 48 83 c4 10                  	addq	$16, %rsp
  8001b7: 5d                           	popq	%rbp
  8001b8: c3                           	retq
  8001b9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008001c0 <kill>:
; {
  8001c0: 55                           	pushq	%rbp
  8001c1: 48 89 e5                     	movq	%rsp, %rbp
  8001c4: 48 83 ec 20                  	subq	$32, %rsp
  8001c8: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8001cb: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  8001cf: bf 03 00 00 00               	movl	$3, %edi
  8001d4: be 01 00 00 00               	movl	$1, %esi
  8001d9: 31 c0                        	xorl	%eax, %eax
  8001db: 41 89 c1                     	movl	%eax, %r9d
  8001de: 4c 89 c9                     	movq	%r9, %rcx
  8001e1: 4d 89 c8                     	movq	%r9, %r8
  8001e4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001ec: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001f5: e8 f6 fe ff ff               	callq	0x8000f0 <syscall>
  8001fa: 48 83 c4 20                  	addq	$32, %rsp
  8001fe: 5d                           	popq	%rbp
  8001ff: c3                           	retq

0000000000800200 <getpid>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800208: bf 02 00 00 00               	movl	$2, %edi
  80020d: 31 f6                        	xorl	%esi, %esi
  80020f: 31 c0                        	xorl	%eax, %eax
  800211: 41 89 c1                     	movl	%eax, %r9d
  800214: 4c 89 ca                     	movq	%r9, %rdx
  800217: 4c 89 c9                     	movq	%r9, %rcx
  80021a: 4d 89 c8                     	movq	%r9, %r8
  80021d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800225: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80022e: e8 bd fe ff ff               	callq	0x8000f0 <syscall>
  800233: 48 83 c4 10                  	addq	$16, %rsp
  800237: 5d                           	popq	%rbp
  800238: c3                           	retq
  800239: cc                           	int3
  80023a: cc                           	int3
  80023b: cc                           	int3

000000000080023c <do_syscall>:
; 	pushq %rbp
  80023c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80023d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800242: cd 80                        	int	$128
; 	popq %rbp
  800244: 5d                           	popq	%rbp
; 	retq
  800245: c3                           	retq
  800246: cc                           	int3
  800247: cc                           	int3
  800248: cc                           	int3
  800249: cc                           	int3
  80024a: cc                           	int3
  80024b: cc                           	int3
  80024c: cc                           	int3
  80024d: cc                           	int3
  80024e: cc                           	int3
  80024f: cc                           	int3

0000000000800250 <_panic>:
; {
  800250: 55                           	pushq	%rbp
  800251: 48 89 e5                     	movq	%rsp, %rbp
  800254: 48 83 ec 60                  	subq	$96, %rsp
  800258: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80025c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800260: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800264: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800268: 89 75 f4                     	movl	%esi, -12(%rbp)
  80026b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80026f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800273: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800277: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80027b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80027f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  800283: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80028a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  800290: e8 6b ff ff ff               	callq	0x800200 <getpid>
  800295: 89 c6                        	movl	%eax, %esi
  800297: 48 8d 05 62 2d 00 00         	leaq	11618(%rip), %rax       # 0x803000 <binary_name>
  80029e: 48 8b 10                     	movq	(%rax), %rdx
  8002a1: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8002a5: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8002a9: 48 8d 3d 6e 1d 00 00         	leaq	7534(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8002b0: b0 00                        	movb	$0, %al
  8002b2: e8 09 01 00 00               	callq	0x8003c0 <printf>
; 	vprintf(fmt, ap);
  8002b7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8002bb: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8002bf: e8 1c 00 00 00               	callq	0x8002e0 <vprintf>
; 	printf("\n");
  8002c4: 48 8d 3d ea 1d 00 00         	leaq	7658(%rip), %rdi        # 0x8020b5 <syscall.c+0x8020b5>
  8002cb: b0 00                        	movb	$0, %al
  8002cd: e8 ee 00 00 00               	callq	0x8003c0 <printf>
; 		asm volatile("int3");
  8002d2: cc                           	int3
; 	while (1) {
  8002d3: e9 fa ff ff ff               	jmp	0x8002d2 <_panic+0x82>
  8002d8: cc                           	int3
  8002d9: cc                           	int3
  8002da: cc                           	int3
  8002db: cc                           	int3
  8002dc: cc                           	int3
  8002dd: cc                           	int3
  8002de: cc                           	int3
  8002df: cc                           	int3

00000000008002e0 <vprintf>:
; {
  8002e0: 55                           	pushq	%rbp
  8002e1: 48 89 e5                     	movq	%rsp, %rbp
  8002e4: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  8002eb: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8002ef: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  8002f3: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  8002fd: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800307: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80030e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800312: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800316: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800350 <putch>
  80031d: e8 fe 00 00 00               	callq	0x800420 <vprintfmt>
; 	puts(b.buf, b.idx);
  800322: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800329: 48 83 c7 08                  	addq	$8, %rdi
  80032d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800334: e8 77 fd ff ff               	callq	0x8000b0 <puts>
; 	return b.cnt;
  800339: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80033f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800346: 5d                           	popq	%rbp
  800347: c3                           	retq
  800348: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800350 <putch>:
; {
  800350: 55                           	pushq	%rbp
  800351: 48 89 e5                     	movq	%rsp, %rbp
  800354: 48 83 ec 10                  	subq	$16, %rsp
  800358: 89 7d fc                     	movl	%edi, -4(%rbp)
  80035b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80035f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800362: 88 c2                        	movb	%al, %dl
  800364: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800368: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80036c: 8b 0e                        	movl	(%rsi), %ecx
  80036e: 89 cf                        	movl	%ecx, %edi
  800370: 83 c7 01                     	addl	$1, %edi
  800373: 89 3e                        	movl	%edi, (%rsi)
  800375: 48 63 c9                     	movslq	%ecx, %rcx
  800378: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80037c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800380: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800386: 0f 85 1e 00 00 00            	jne	0x8003aa <putch+0x5a>
; 		puts(b->buf, b->idx);
  80038c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  800390: 48 83 c7 08                  	addq	$8, %rdi
  800394: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800398: 48 63 30                     	movslq	(%rax), %rsi
  80039b: e8 10 fd ff ff               	callq	0x8000b0 <puts>
; 		b->idx = 0;
  8003a0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003a4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8003aa: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003ae: 8b 48 04                     	movl	4(%rax), %ecx
  8003b1: 83 c1 01                     	addl	$1, %ecx
  8003b4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8003b7: 48 83 c4 10                  	addq	$16, %rsp
  8003bb: 5d                           	popq	%rbp
  8003bc: c3                           	retq
  8003bd: 0f 1f 00                     	nopl	(%rax)

00000000008003c0 <printf>:
; {
  8003c0: 55                           	pushq	%rbp
  8003c1: 48 89 e5                     	movq	%rsp, %rbp
  8003c4: 48 83 ec 60                  	subq	$96, %rsp
  8003c8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8003cc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8003d0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8003d4: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  8003d8: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  8003dc: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8003e0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8003e4: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8003e8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8003ec: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8003f0: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  8003f7: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  8003fe: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800402: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800406: e8 d5 fe ff ff               	callq	0x8002e0 <vprintf>
  80040b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80040e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800411: 48 83 c4 60                  	addq	$96, %rsp
  800415: 5d                           	popq	%rbp
  800416: c3                           	retq
  800417: cc                           	int3
  800418: cc                           	int3
  800419: cc                           	int3
  80041a: cc                           	int3
  80041b: cc                           	int3
  80041c: cc                           	int3
  80041d: cc                           	int3
  80041e: cc                           	int3
  80041f: cc                           	int3

0000000000800420 <vprintfmt>:
; {
  800420: 55                           	pushq	%rbp
  800421: 48 89 e5                     	movq	%rsp, %rbp
  800424: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80042b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80042f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800433: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800437: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80043b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80043f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800443: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800447: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80044b: 48 8b 0a                     	movq	(%rdx), %rcx
  80044e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800452: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800456: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800459: e9 00 00 00 00               	jmp	0x80045e <vprintfmt+0x3e>
  80045e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800462: 48 89 c1                     	movq	%rax, %rcx
  800465: 48 83 c1 01                  	addq	$1, %rcx
  800469: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80046d: 0f b6 00                     	movzbl	(%rax), %eax
  800470: 89 45 b4                     	movl	%eax, -76(%rbp)
  800473: 83 f8 25                     	cmpl	$37, %eax
  800476: 0f 84 25 00 00 00            	je	0x8004a1 <vprintfmt+0x81>
; 			if (ch == '\0')
  80047c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800480: 0f 85 09 00 00 00            	jne	0x80048f <vprintfmt+0x6f>
; 				return;
  800486: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80048d: 5d                           	popq	%rbp
  80048e: c3                           	retq
; 			putch(ch, putdat);
  80048f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800493: 8b 7d b4                     	movl	-76(%rbp), %edi
  800496: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80049a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80049c: e9 bd ff ff ff               	jmp	0x80045e <vprintfmt+0x3e>
; 		padc = ' ';
  8004a1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8004a5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8004ac: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8004b3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8004ba: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8004c1: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004c5: 48 89 c1                     	movq	%rax, %rcx
  8004c8: 48 83 c1 01                  	addq	$1, %rcx
  8004cc: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8004d0: 0f b6 00                     	movzbl	(%rax), %eax
  8004d3: 89 45 b4                     	movl	%eax, -76(%rbp)
  8004d6: 83 c0 dd                     	addl	$-35, %eax
  8004d9: 89 c1                        	movl	%eax, %ecx
  8004db: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  8004df: 83 e8 55                     	subl	$85, %eax
  8004e2: 0f 87 c1 05 00 00            	ja	0x800aa9 <vprintfmt+0x689>
  8004e8: 48 8b 45 88                  	movq	-120(%rbp), %rax
  8004ec: 48 8d 0d 21 1c 00 00         	leaq	7201(%rip), %rcx        # 0x802114 <syscall.c+0x802114>
  8004f3: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  8004f7: 48 01 c8                     	addq	%rcx, %rax
  8004fa: ff e0                        	jmpq	*%rax
; 			padc = '-';
  8004fc: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800500: e9 bc ff ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			padc = '0';
  800505: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800509: e9 b3 ff ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80050e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800515: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800519: 03 45 b4                     	addl	-76(%rbp), %eax
  80051c: 83 e8 30                     	subl	$48, %eax
  80051f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800522: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800526: 0f be 00                     	movsbl	(%rax), %eax
  800529: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80052c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800530: 0f 8c 0a 00 00 00            	jl	0x800540 <vprintfmt+0x120>
  800536: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80053a: 0f 8e 05 00 00 00            	jle	0x800545 <vprintfmt+0x125>
; 					break;
  800540: e9 16 00 00 00               	jmp	0x80055b <vprintfmt+0x13b>
; 			}
  800545: e9 00 00 00 00               	jmp	0x80054a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80054a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80054e: 48 83 c0 01                  	addq	$1, %rax
  800552: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800556: e9 ba ff ff ff               	jmp	0x800515 <vprintfmt+0xf5>
; 			goto process_precision;
  80055b: e9 8c 00 00 00               	jmp	0x8005ec <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800560: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800564: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80056b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80056e: 89 45 84                     	movl	%eax, -124(%rbp)
  800571: 83 f8 28                     	cmpl	$40, %eax
  800574: 0f 87 22 00 00 00            	ja	0x80059c <vprintfmt+0x17c>
  80057a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800581: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800584: 48 63 c2                     	movslq	%edx, %rax
  800587: 48 03 41 10                  	addq	16(%rcx), %rax
  80058b: 83 c2 08                     	addl	$8, %edx
  80058e: 89 11                        	movl	%edx, (%rcx)
  800590: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800597: e9 1d 00 00 00               	jmp	0x8005b9 <vprintfmt+0x199>
  80059c: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8005a3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005a7: 48 89 d0                     	movq	%rdx, %rax
  8005aa: 48 83 c2 08                  	addq	$8, %rdx
  8005ae: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005b2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005b9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  8005c0: 8b 00                        	movl	(%rax), %eax
  8005c2: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  8005c5: e9 22 00 00 00               	jmp	0x8005ec <vprintfmt+0x1cc>
; 			if (width < 0)
  8005ca: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005ce: 0f 8d 07 00 00 00            	jge	0x8005db <vprintfmt+0x1bb>
; 				width = 0;
  8005d4: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  8005db: e9 e1 fe ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			altflag = 1;
  8005e0: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  8005e7: e9 d5 fe ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			if (width < 0)
  8005ec: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005f0: 0f 8d 0d 00 00 00            	jge	0x800603 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  8005f6: 8b 45 98                     	movl	-104(%rbp), %eax
  8005f9: 89 45 9c                     	movl	%eax, -100(%rbp)
  8005fc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800603: e9 b9 fe ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			lflag++;
  800608: 8b 45 a0                     	movl	-96(%rbp), %eax
  80060b: 83 c0 01                     	addl	$1, %eax
  80060e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800611: e9 ab fe ff ff               	jmp	0x8004c1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800616: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80061a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800621: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800625: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80062c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80062f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800635: 83 f8 28                     	cmpl	$40, %eax
  800638: 0f 87 25 00 00 00            	ja	0x800663 <vprintfmt+0x243>
  80063e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800645: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80064b: 48 63 c2                     	movslq	%edx, %rax
  80064e: 48 03 41 10                  	addq	16(%rcx), %rax
  800652: 83 c2 08                     	addl	$8, %edx
  800655: 89 11                        	movl	%edx, (%rcx)
  800657: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80065e: e9 1d 00 00 00               	jmp	0x800680 <vprintfmt+0x260>
  800663: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80066a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80066e: 48 89 d0                     	movq	%rdx, %rax
  800671: 48 83 c2 08                  	addq	$8, %rdx
  800675: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800679: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800680: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800687: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80068e: 8b 39                        	movl	(%rcx), %edi
  800690: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800694: ff d0                        	callq	*%rax
; 			break;
  800696: e9 55 04 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80069b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80069f: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8006a6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8006a9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8006af: 83 f8 28                     	cmpl	$40, %eax
  8006b2: 0f 87 25 00 00 00            	ja	0x8006dd <vprintfmt+0x2bd>
  8006b8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8006bf: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  8006c5: 48 63 c2                     	movslq	%edx, %rax
  8006c8: 48 03 41 10                  	addq	16(%rcx), %rax
  8006cc: 83 c2 08                     	addl	$8, %edx
  8006cf: 89 11                        	movl	%edx, (%rcx)
  8006d1: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8006d8: e9 1d 00 00 00               	jmp	0x8006fa <vprintfmt+0x2da>
  8006dd: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  8006e4: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8006e8: 48 89 d0                     	movq	%rdx, %rax
  8006eb: 48 83 c2 08                  	addq	$8, %rdx
  8006ef: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8006f3: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8006fa: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800701: 8b 00                        	movl	(%rax), %eax
  800703: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800706: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80070a: 0f 8d 08 00 00 00            	jge	0x800718 <vprintfmt+0x2f8>
; 				err = -err;
  800710: 31 c0                        	xorl	%eax, %eax
  800712: 2b 45 b0                     	subl	-80(%rbp), %eax
  800715: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800718: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80071c: 48 83 f8 09                  	cmpq	$9, %rax
  800720: 0f 83 1d 00 00 00            	jae	0x800743 <vprintfmt+0x323>
  800726: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80072a: 48 8d 05 ef f8 9f ff         	leaq	-6293265(%rip), %rax    # 0x200020 <error_string>
  800731: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800735: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800739: 48 83 f8 00                  	cmpq	$0, %rax
  80073d: 0f 85 1e 00 00 00            	jne	0x800761 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800743: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800747: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80074b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80074e: 48 8d 15 46 19 00 00         	leaq	6470(%rip), %rdx        # 0x80209b <syscall.c+0x80209b>
  800755: b0 00                        	movb	$0, %al
  800757: e8 a4 03 00 00               	callq	0x800b00 <printfmt>
  80075c: e9 1a 00 00 00               	jmp	0x80077b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800761: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800765: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800769: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80076d: 48 8d 15 a7 18 00 00         	leaq	6311(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  800774: b0 00                        	movb	$0, %al
  800776: e8 85 03 00 00               	callq	0x800b00 <printfmt>
; 			break;
  80077b: e9 70 03 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800780: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800784: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80078b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80078e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  800794: 83 f8 28                     	cmpl	$40, %eax
  800797: 0f 87 25 00 00 00            	ja	0x8007c2 <vprintfmt+0x3a2>
  80079d: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8007a4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007aa: 48 63 c2                     	movslq	%edx, %rax
  8007ad: 48 03 41 10                  	addq	16(%rcx), %rax
  8007b1: 83 c2 08                     	addl	$8, %edx
  8007b4: 89 11                        	movl	%edx, (%rcx)
  8007b6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007bd: e9 1d 00 00 00               	jmp	0x8007df <vprintfmt+0x3bf>
  8007c2: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007c9: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8007cd: 48 89 d0                     	movq	%rdx, %rax
  8007d0: 48 83 c2 08                  	addq	$8, %rdx
  8007d4: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8007d8: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007df: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007e6: 48 8b 00                     	movq	(%rax), %rax
  8007e9: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8007ed: 48 83 f8 00                  	cmpq	$0, %rax
  8007f1: 0f 85 0b 00 00 00            	jne	0x800802 <vprintfmt+0x3e2>
; 				p = "(null)";
  8007f7: 48 8d 05 b9 18 00 00         	leaq	6329(%rip), %rax        # 0x8020b7 <syscall.c+0x8020b7>
  8007fe: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800802: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800806: 0f 8e 4f 00 00 00            	jle	0x80085b <vprintfmt+0x43b>
  80080c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800810: 83 f8 2d                     	cmpl	$45, %eax
  800813: 0f 84 42 00 00 00            	je	0x80085b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800819: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80081d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800821: e8 da 07 00 00               	callq	0x801000 <strnlen>
  800826: 89 c1                        	movl	%eax, %ecx
  800828: 8b 45 9c                     	movl	-100(%rbp), %eax
  80082b: 29 c8                        	subl	%ecx, %eax
  80082d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800830: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800834: 0f 8e 1c 00 00 00            	jle	0x800856 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80083a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80083e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800842: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800846: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800848: 8b 45 9c                     	movl	-100(%rbp), %eax
  80084b: 83 c0 ff                     	addl	$-1, %eax
  80084e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800851: e9 da ff ff ff               	jmp	0x800830 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800856: e9 00 00 00 00               	jmp	0x80085b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80085b: e9 00 00 00 00               	jmp	0x800860 <vprintfmt+0x440>
  800860: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800864: 48 89 c1                     	movq	%rax, %rcx
  800867: 48 83 c1 01                  	addq	$1, %rcx
  80086b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80086f: 0f be 08                     	movsbl	(%rax), %ecx
  800872: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800875: 31 c0                        	xorl	%eax, %eax
  800877: 83 f9 00                     	cmpl	$0, %ecx
  80087a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800880: 0f 84 33 00 00 00            	je	0x8008b9 <vprintfmt+0x499>
  800886: b0 01                        	movb	$1, %al
  800888: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80088c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  800892: 0f 8c 15 00 00 00            	jl	0x8008ad <vprintfmt+0x48d>
  800898: 8b 45 98                     	movl	-104(%rbp), %eax
  80089b: 83 c0 ff                     	addl	$-1, %eax
  80089e: 89 45 98                     	movl	%eax, -104(%rbp)
  8008a1: 83 f8 00                     	cmpl	$0, %eax
  8008a4: 0f 9d c0                     	setge	%al
  8008a7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008ad: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8008b3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008b9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008bf: a8 01                        	testb	$1, %al
  8008c1: 0f 85 05 00 00 00            	jne	0x8008cc <vprintfmt+0x4ac>
  8008c7: e9 52 00 00 00               	jmp	0x80091e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008cc: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  8008d0: 0f 84 28 00 00 00            	je	0x8008fe <vprintfmt+0x4de>
  8008d6: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  8008da: 0f 8c 0a 00 00 00            	jl	0x8008ea <vprintfmt+0x4ca>
  8008e0: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  8008e4: 0f 8e 14 00 00 00            	jle	0x8008fe <vprintfmt+0x4de>
; 					putch('?', putdat);
  8008ea: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008ee: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008f2: bf 3f 00 00 00               	movl	$63, %edi
  8008f7: ff d0                        	callq	*%rax
  8008f9: e9 0d 00 00 00               	jmp	0x80090b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  8008fe: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800902: 8b 7d b4                     	movl	-76(%rbp), %edi
  800905: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800909: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80090b: e9 00 00 00 00               	jmp	0x800910 <vprintfmt+0x4f0>
; 					width--)
  800910: 8b 45 9c                     	movl	-100(%rbp), %eax
  800913: 83 c0 ff                     	addl	$-1, %eax
  800916: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800919: e9 42 ff ff ff               	jmp	0x800860 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80091e: e9 00 00 00 00               	jmp	0x800923 <vprintfmt+0x503>
  800923: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800927: 0f 8e 1d 00 00 00            	jle	0x80094a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80092d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800931: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800935: bf 20 00 00 00               	movl	$32, %edi
  80093a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80093c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80093f: 83 c0 ff                     	addl	$-1, %eax
  800942: 89 45 9c                     	movl	%eax, -100(%rbp)
  800945: e9 d9 ff ff ff               	jmp	0x800923 <vprintfmt+0x503>
; 			break;
  80094a: e9 a1 01 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80094f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800952: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800956: e8 05 02 00 00               	callq	0x800b60 <getint>
  80095b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80095f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800964: 0f 8d 19 00 00 00            	jge	0x800983 <vprintfmt+0x563>
; 				putch('-', putdat);
  80096a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80096e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800972: bf 2d 00 00 00               	movl	$45, %edi
  800977: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800979: 31 c0                        	xorl	%eax, %eax
  80097b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80097f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800983: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80098a: e9 e6 00 00 00               	jmp	0x800a75 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80098f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800992: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800996: e8 f5 02 00 00               	callq	0x800c90 <getuint>
  80099b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  80099f: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009a6: e9 ca 00 00 00               	jmp	0x800a75 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009ab: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009ae: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009b2: e8 d9 02 00 00               	callq	0x800c90 <getuint>
  8009b7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8009bb: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  8009c2: e9 ae 00 00 00               	jmp	0x800a75 <vprintfmt+0x655>
; 			putch('0', putdat);
  8009c7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009cb: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009cf: bf 30 00 00 00               	movl	$48, %edi
  8009d4: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  8009d6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009da: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009de: bf 78 00 00 00               	movl	$120, %edi
  8009e3: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  8009e5: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8009e9: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  8009f0: 8b 45 c0                     	movl	-64(%rbp), %eax
  8009f3: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  8009f9: 83 f8 28                     	cmpl	$40, %eax
  8009fc: 0f 87 25 00 00 00            	ja	0x800a27 <vprintfmt+0x607>
  800a02: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800a09: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  800a0f: 48 63 c2                     	movslq	%edx, %rax
  800a12: 48 03 41 10                  	addq	16(%rcx), %rax
  800a16: 83 c2 08                     	addl	$8, %edx
  800a19: 89 11                        	movl	%edx, (%rcx)
  800a1b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a22: e9 1d 00 00 00               	jmp	0x800a44 <vprintfmt+0x624>
  800a27: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  800a2e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a32: 48 89 d0                     	movq	%rdx, %rax
  800a35: 48 83 c2 08                  	addq	$8, %rdx
  800a39: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a3d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a44: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  800a4b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  800a4e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a52: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a59: e9 17 00 00 00               	jmp	0x800a75 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a5e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a61: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a65: e8 26 02 00 00               	callq	0x800c90 <getuint>
  800a6a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a6e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800a75: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a79: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a7d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800a81: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800a84: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800a88: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800a8d: e8 2e 03 00 00               	callq	0x800dc0 <printnum>
; 			break;
  800a92: e9 59 00 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800a97: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a9b: 8b 7d b4                     	movl	-76(%rbp), %edi
  800a9e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800aa2: ff d0                        	callq	*%rax
; 			break;
  800aa4: e9 47 00 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800aa9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800aad: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ab1: bf 25 00 00 00               	movl	$37, %edi
  800ab6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800ab8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800abc: 48 83 c0 ff                  	addq	$-1, %rax
  800ac0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800ac4: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ac8: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800acc: 83 f8 25                     	cmpl	$37, %eax
  800acf: 0f 84 16 00 00 00            	je	0x800aeb <vprintfmt+0x6cb>
  800ad5: e9 00 00 00 00               	jmp	0x800ada <vprintfmt+0x6ba>
  800ada: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ade: 48 83 c0 ff                  	addq	$-1, %rax
  800ae2: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800ae6: e9 d9 ff ff ff               	jmp	0x800ac4 <vprintfmt+0x6a4>
; 			break;
  800aeb: e9 00 00 00 00               	jmp	0x800af0 <vprintfmt+0x6d0>
; 	while (1) {
  800af0: e9 64 f9 ff ff               	jmp	0x800459 <vprintfmt+0x39>
  800af5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800aff: 90                           	nop

0000000000800b00 <printfmt>:
; {
  800b00: 55                           	pushq	%rbp
  800b01: 48 89 e5                     	movq	%rsp, %rbp
  800b04: 48 83 ec 60                  	subq	$96, %rsp
  800b08: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800b0c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800b10: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800b14: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800b18: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800b1c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800b20: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800b24: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b28: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800b2c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b30: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800b37: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800b3e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800b42: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800b46: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800b4a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800b4e: e8 cd f8 ff ff               	callq	0x800420 <vprintfmt>
; }
  800b53: 48 83 c4 60                  	addq	$96, %rsp
  800b57: 5d                           	popq	%rbp
  800b58: c3                           	retq
  800b59: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b60 <getint>:
; {
  800b60: 55                           	pushq	%rbp
  800b61: 48 89 e5                     	movq	%rsp, %rbp
  800b64: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b68: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b6b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b6f: 0f 8c 59 00 00 00            	jl	0x800bce <getint+0x6e>
; 		return va_arg(*ap, long long);
  800b75: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b79: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b7d: 8b 00                        	movl	(%rax), %eax
  800b7f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800b82: 83 f8 28                     	cmpl	$40, %eax
  800b85: 0f 87 1c 00 00 00            	ja	0x800ba7 <getint+0x47>
  800b8b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800b8f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800b92: 48 63 c2                     	movslq	%edx, %rax
  800b95: 48 03 41 10                  	addq	16(%rcx), %rax
  800b99: 83 c2 08                     	addl	$8, %edx
  800b9c: 89 11                        	movl	%edx, (%rcx)
  800b9e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800ba2: e9 17 00 00 00               	jmp	0x800bbe <getint+0x5e>
  800ba7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800bab: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800baf: 48 89 d0                     	movq	%rdx, %rax
  800bb2: 48 83 c2 08                  	addq	$8, %rdx
  800bb6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bba: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bbe: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800bc2: 48 8b 00                     	movq	(%rax), %rax
  800bc5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bc9: e9 b7 00 00 00               	jmp	0x800c85 <getint+0x125>
; 	else if (lflag)
  800bce: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800bd2: 0f 84 59 00 00 00            	je	0x800c31 <getint+0xd1>
; 		return va_arg(*ap, long);
  800bd8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bdc: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800be0: 8b 00                        	movl	(%rax), %eax
  800be2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800be5: 83 f8 28                     	cmpl	$40, %eax
  800be8: 0f 87 1c 00 00 00            	ja	0x800c0a <getint+0xaa>
  800bee: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800bf2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800bf5: 48 63 c2                     	movslq	%edx, %rax
  800bf8: 48 03 41 10                  	addq	16(%rcx), %rax
  800bfc: 83 c2 08                     	addl	$8, %edx
  800bff: 89 11                        	movl	%edx, (%rcx)
  800c01: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c05: e9 17 00 00 00               	jmp	0x800c21 <getint+0xc1>
  800c0a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800c0e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c12: 48 89 d0                     	movq	%rdx, %rax
  800c15: 48 83 c2 08                  	addq	$8, %rdx
  800c19: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c1d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c21: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800c25: 48 8b 00                     	movq	(%rax), %rax
  800c28: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c2c: e9 54 00 00 00               	jmp	0x800c85 <getint+0x125>
; 		return va_arg(*ap, int);
  800c31: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c35: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c39: 8b 00                        	movl	(%rax), %eax
  800c3b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c3e: 83 f8 28                     	cmpl	$40, %eax
  800c41: 0f 87 1c 00 00 00            	ja	0x800c63 <getint+0x103>
  800c47: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c4b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800c4e: 48 63 c2                     	movslq	%edx, %rax
  800c51: 48 03 41 10                  	addq	16(%rcx), %rax
  800c55: 83 c2 08                     	addl	$8, %edx
  800c58: 89 11                        	movl	%edx, (%rcx)
  800c5a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c5e: e9 17 00 00 00               	jmp	0x800c7a <getint+0x11a>
  800c63: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c67: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c6b: 48 89 d0                     	movq	%rdx, %rax
  800c6e: 48 83 c2 08                  	addq	$8, %rdx
  800c72: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c76: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c7a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800c7e: 48 63 00                     	movslq	(%rax), %rax
  800c81: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800c85: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c89: 5d                           	popq	%rbp
  800c8a: c3                           	retq
  800c8b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800c90 <getuint>:
; {
  800c90: 55                           	pushq	%rbp
  800c91: 48 89 e5                     	movq	%rsp, %rbp
  800c94: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800c98: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800c9b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800c9f: 0f 8c 59 00 00 00            	jl	0x800cfe <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800ca5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ca9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800cad: 8b 00                        	movl	(%rax), %eax
  800caf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800cb2: 83 f8 28                     	cmpl	$40, %eax
  800cb5: 0f 87 1c 00 00 00            	ja	0x800cd7 <getuint+0x47>
  800cbb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800cbf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800cc2: 48 63 c2                     	movslq	%edx, %rax
  800cc5: 48 03 41 10                  	addq	16(%rcx), %rax
  800cc9: 83 c2 08                     	addl	$8, %edx
  800ccc: 89 11                        	movl	%edx, (%rcx)
  800cce: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800cd2: e9 17 00 00 00               	jmp	0x800cee <getuint+0x5e>
  800cd7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800cdb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800cdf: 48 89 d0                     	movq	%rdx, %rax
  800ce2: 48 83 c2 08                  	addq	$8, %rdx
  800ce6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800cea: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800cee: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800cf2: 48 8b 00                     	movq	(%rax), %rax
  800cf5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800cf9: e9 b6 00 00 00               	jmp	0x800db4 <getuint+0x124>
; 	else if (lflag)
  800cfe: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800d02: 0f 84 59 00 00 00            	je	0x800d61 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800d08: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d0c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d10: 8b 00                        	movl	(%rax), %eax
  800d12: 89 45 d4                     	movl	%eax, -44(%rbp)
  800d15: 83 f8 28                     	cmpl	$40, %eax
  800d18: 0f 87 1c 00 00 00            	ja	0x800d3a <getuint+0xaa>
  800d1e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800d22: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800d25: 48 63 c2                     	movslq	%edx, %rax
  800d28: 48 03 41 10                  	addq	16(%rcx), %rax
  800d2c: 83 c2 08                     	addl	$8, %edx
  800d2f: 89 11                        	movl	%edx, (%rcx)
  800d31: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d35: e9 17 00 00 00               	jmp	0x800d51 <getuint+0xc1>
  800d3a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800d3e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d42: 48 89 d0                     	movq	%rdx, %rax
  800d45: 48 83 c2 08                  	addq	$8, %rdx
  800d49: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d4d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d51: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d55: 48 8b 00                     	movq	(%rax), %rax
  800d58: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d5c: e9 53 00 00 00               	jmp	0x800db4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d61: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d65: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d69: 8b 00                        	movl	(%rax), %eax
  800d6b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d6e: 83 f8 28                     	cmpl	$40, %eax
  800d71: 0f 87 1c 00 00 00            	ja	0x800d93 <getuint+0x103>
  800d77: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800d7b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800d7e: 48 63 c2                     	movslq	%edx, %rax
  800d81: 48 03 41 10                  	addq	16(%rcx), %rax
  800d85: 83 c2 08                     	addl	$8, %edx
  800d88: 89 11                        	movl	%edx, (%rcx)
  800d8a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d8e: e9 17 00 00 00               	jmp	0x800daa <getuint+0x11a>
  800d93: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800d97: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d9b: 48 89 d0                     	movq	%rdx, %rax
  800d9e: 48 83 c2 08                  	addq	$8, %rdx
  800da2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800da6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800daa: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800dae: 8b 00                        	movl	(%rax), %eax
  800db0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800db4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800db8: 5d                           	popq	%rbp
  800db9: c3                           	retq
  800dba: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800dc0 <printnum>:
; {
  800dc0: 55                           	pushq	%rbp
  800dc1: 48 89 e5                     	movq	%rsp, %rbp
  800dc4: 48 83 ec 30                  	subq	$48, %rsp
  800dc8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800dcc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800dd0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800dd4: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800dd7: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800ddb: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800ddf: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800de3: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800de6: 48 39 c8                     	cmpq	%rcx, %rax
  800de9: 0f 82 30 00 00 00            	jb	0x800e1f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800def: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800df3: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800df7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800dfb: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800dfe: 31 d2                        	xorl	%edx, %edx
  800e00: 48 f7 f1                     	divq	%rcx
  800e03: 48 89 c2                     	movq	%rax, %rdx
  800e06: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e09: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800e0d: 41 83 e8 01                  	subl	$1, %r8d
  800e11: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800e15: e8 a6 ff ff ff               	callq	0x800dc0 <printnum>
; 	} else {
  800e1a: e9 2e 00 00 00               	jmp	0x800e4d <printnum+0x8d>
; 		while (--width > 0)
  800e1f: e9 00 00 00 00               	jmp	0x800e24 <printnum+0x64>
  800e24: 8b 45 e0                     	movl	-32(%rbp), %eax
  800e27: 83 c0 ff                     	addl	$-1, %eax
  800e2a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800e2d: 83 f8 00                     	cmpl	$0, %eax
  800e30: 0f 8e 12 00 00 00            	jle	0x800e48 <printnum+0x88>
; 			putch(padc, putdat);
  800e36: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e3a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800e3d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e41: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800e43: e9 dc ff ff ff               	jmp	0x800e24 <printnum+0x64>
  800e48: e9 00 00 00 00               	jmp	0x800e4d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800e4d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e51: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e55: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e59: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e5c: 31 d2                        	xorl	%edx, %edx
  800e5e: 48 f7 f1                     	divq	%rcx
  800e61: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e65: 48 8d 0d 38 12 00 00         	leaq	4664(%rip), %rcx        # 0x8020a4 <syscall.c+0x8020a4>
  800e6c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800e70: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e74: ff d0                        	callq	*%rax
; }
  800e76: 48 83 c4 30                  	addq	$48, %rsp
  800e7a: 5d                           	popq	%rbp
  800e7b: c3                           	retq
  800e7c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800e80 <vsnprintf>:
; {
  800e80: 55                           	pushq	%rbp
  800e81: 48 89 e5                     	movq	%rsp, %rbp
  800e84: 48 83 ec 40                  	subq	$64, %rsp
  800e88: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800e8c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800e8f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800e93: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800e97: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e9b: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800e9f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ea3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800ea7: 48 01 c8                     	addq	%rcx, %rax
  800eaa: 48 83 c0 ff                  	addq	$-1, %rax
  800eae: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800eb2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800eb9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800ebe: 0f 84 0a 00 00 00            	je	0x800ece <vsnprintf+0x4e>
  800ec4: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800ec8: 0f 8d 0c 00 00 00            	jge	0x800eda <vsnprintf+0x5a>
; 		return -EINVAL;
  800ece: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800ed5: e9 25 00 00 00               	jmp	0x800eff <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800eda: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800ede: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800ee2: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800ee6: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800f10 <sprintputch>
  800eed: e8 2e f5 ff ff               	callq	0x800420 <vprintfmt>
; 	*b.buf = '\0';
  800ef2: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800ef6: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800ef9: 8b 45 d0                     	movl	-48(%rbp), %eax
  800efc: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800eff: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f02: 48 83 c4 40                  	addq	$64, %rsp
  800f06: 5d                           	popq	%rbp
  800f07: c3                           	retq
  800f08: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800f10 <sprintputch>:
; {
  800f10: 55                           	pushq	%rbp
  800f11: 48 89 e5                     	movq	%rsp, %rbp
  800f14: 89 7d fc                     	movl	%edi, -4(%rbp)
  800f17: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800f1b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f1f: 8b 48 10                     	movl	16(%rax), %ecx
  800f22: 83 c1 01                     	addl	$1, %ecx
  800f25: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800f28: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f2c: 48 8b 00                     	movq	(%rax), %rax
  800f2f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800f33: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800f37: 0f 83 18 00 00 00            	jae	0x800f55 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800f3d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f40: 88 c1                        	movb	%al, %cl
  800f42: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800f46: 48 8b 02                     	movq	(%rdx), %rax
  800f49: 48 89 c6                     	movq	%rax, %rsi
  800f4c: 48 83 c6 01                  	addq	$1, %rsi
  800f50: 48 89 32                     	movq	%rsi, (%rdx)
  800f53: 88 08                        	movb	%cl, (%rax)
; }
  800f55: 5d                           	popq	%rbp
  800f56: c3                           	retq
  800f57: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f60 <snprintf>:
; {
  800f60: 55                           	pushq	%rbp
  800f61: 48 89 e5                     	movq	%rsp, %rbp
  800f64: 48 83 ec 70                  	subq	$112, %rsp
  800f68: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f6c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800f70: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800f74: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f78: 89 75 f4                     	movl	%esi, -12(%rbp)
  800f7b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800f7f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800f83: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800f87: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800f8b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800f8f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800f96: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800f9d: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fa1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800fa4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800fa8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800fac: e8 cf fe ff ff               	callq	0x800e80 <vsnprintf>
  800fb1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800fb4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800fb7: 48 83 c4 70                  	addq	$112, %rsp
  800fbb: 5d                           	popq	%rbp
  800fbc: c3                           	retq
  800fbd: cc                           	int3
  800fbe: cc                           	int3
  800fbf: cc                           	int3

0000000000800fc0 <strlen>:
; {
  800fc0: 55                           	pushq	%rbp
  800fc1: 48 89 e5                     	movq	%rsp, %rbp
  800fc4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800fc8: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800fcf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fd3: 0f be 00                     	movsbl	(%rax), %eax
  800fd6: 83 f8 00                     	cmpl	$0, %eax
  800fd9: 0f 84 1a 00 00 00            	je	0x800ff9 <strlen+0x39>
; 		n++;
  800fdf: 8b 45 f4                     	movl	-12(%rbp), %eax
  800fe2: 83 c0 01                     	addl	$1, %eax
  800fe5: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800fe8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fec: 48 83 c0 01                  	addq	$1, %rax
  800ff0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800ff4: e9 d6 ff ff ff               	jmp	0x800fcf <strlen+0xf>
; 	return n;
  800ff9: 8b 45 f4                     	movl	-12(%rbp), %eax
  800ffc: 5d                           	popq	%rbp
  800ffd: c3                           	retq
  800ffe: 66 90                        	nop

0000000000801000 <strnlen>:
; {
  801000: 55                           	pushq	%rbp
  801001: 48 89 e5                     	movq	%rsp, %rbp
  801004: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801008: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80100c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  801013: 31 c0                        	xorl	%eax, %eax
  801015: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  80101a: 88 45 eb                     	movb	%al, -21(%rbp)
  80101d: 0f 86 10 00 00 00            	jbe	0x801033 <strnlen+0x33>
  801023: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801027: 0f be 00                     	movsbl	(%rax), %eax
  80102a: 83 f8 00                     	cmpl	$0, %eax
  80102d: 0f 95 c0                     	setne	%al
  801030: 88 45 eb                     	movb	%al, -21(%rbp)
  801033: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  801036: a8 01                        	testb	$1, %al
  801038: 0f 85 05 00 00 00            	jne	0x801043 <strnlen+0x43>
  80103e: e9 26 00 00 00               	jmp	0x801069 <strnlen+0x69>
; 		n++;
  801043: 8b 45 ec                     	movl	-20(%rbp), %eax
  801046: 83 c0 01                     	addl	$1, %eax
  801049: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80104c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801050: 48 83 c0 01                  	addq	$1, %rax
  801054: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801058: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80105c: 48 83 c0 ff                  	addq	$-1, %rax
  801060: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801064: e9 aa ff ff ff               	jmp	0x801013 <strnlen+0x13>
; 	return n;
  801069: 8b 45 ec                     	movl	-20(%rbp), %eax
  80106c: 5d                           	popq	%rbp
  80106d: c3                           	retq
  80106e: 66 90                        	nop

0000000000801070 <strcpy>:
; {
  801070: 55                           	pushq	%rbp
  801071: 48 89 e5                     	movq	%rsp, %rbp
  801074: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801078: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  80107c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801080: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  801084: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801088: 48 89 c1                     	movq	%rax, %rcx
  80108b: 48 83 c1 01                  	addq	$1, %rcx
  80108f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801093: 8a 00                        	movb	(%rax), %al
  801095: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  801099: 48 89 ca                     	movq	%rcx, %rdx
  80109c: 48 83 c2 01                  	addq	$1, %rdx
  8010a0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010a4: 88 01                        	movb	%al, (%rcx)
  8010a6: 0f be c0                     	movsbl	%al, %eax
  8010a9: 83 f8 00                     	cmpl	$0, %eax
  8010ac: 0f 84 05 00 00 00            	je	0x8010b7 <strcpy+0x47>
  8010b2: e9 cd ff ff ff               	jmp	0x801084 <strcpy+0x14>
; 	return ret;
  8010b7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8010bb: 5d                           	popq	%rbp
  8010bc: c3                           	retq
  8010bd: 0f 1f 00                     	nopl	(%rax)

00000000008010c0 <strcat>:
; {
  8010c0: 55                           	pushq	%rbp
  8010c1: 48 89 e5                     	movq	%rsp, %rbp
  8010c4: 48 83 ec 20                  	subq	$32, %rsp
  8010c8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010cc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  8010d0: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8010d4: e8 e7 fe ff ff               	callq	0x800fc0 <strlen>
  8010d9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  8010dc: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8010e0: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  8010e4: 48 01 c7                     	addq	%rax, %rdi
  8010e7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8010eb: e8 80 ff ff ff               	callq	0x801070 <strcpy>
; 	return dst;
  8010f0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010f4: 48 83 c4 20                  	addq	$32, %rsp
  8010f8: 5d                           	popq	%rbp
  8010f9: c3                           	retq
  8010fa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000801100 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  801100: 55                           	pushq	%rbp
  801101: 48 89 e5                     	movq	%rsp, %rbp
  801104: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801108: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80110c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  801110: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801114: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  801118: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  801120: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801124: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  801128: 0f 83 49 00 00 00            	jae	0x801177 <strncpy+0x77>
; 		*dst++ = *src;
  80112e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801132: 8a 08                        	movb	(%rax), %cl
  801134: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801138: 48 89 c2                     	movq	%rax, %rdx
  80113b: 48 83 c2 01                  	addq	$1, %rdx
  80113f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801143: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801145: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801149: 0f be 00                     	movsbl	(%rax), %eax
  80114c: 83 f8 00                     	cmpl	$0, %eax
  80114f: 0f 84 0c 00 00 00            	je	0x801161 <strncpy+0x61>
; 			src++;
  801155: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801159: 48 83 c0 01                  	addq	$1, %rax
  80115d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801161: e9 00 00 00 00               	jmp	0x801166 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801166: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80116a: 48 83 c0 01                  	addq	$1, %rax
  80116e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801172: e9 a9 ff ff ff               	jmp	0x801120 <strncpy+0x20>
; 	return ret;
  801177: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80117b: 5d                           	popq	%rbp
  80117c: c3                           	retq
  80117d: 0f 1f 00                     	nopl	(%rax)

0000000000801180 <strlcpy>:
; {
  801180: 55                           	pushq	%rbp
  801181: 48 89 e5                     	movq	%rsp, %rbp
  801184: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801188: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80118c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  801190: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801194: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  801198: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  80119d: 0f 86 6e 00 00 00            	jbe	0x801211 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  8011a3: e9 00 00 00 00               	jmp	0x8011a8 <strlcpy+0x28>
  8011a8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011ac: 48 83 c1 ff                  	addq	$-1, %rcx
  8011b0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8011b4: 31 c0                        	xorl	%eax, %eax
  8011b6: 48 83 f9 00                  	cmpq	$0, %rcx
  8011ba: 88 45 df                     	movb	%al, -33(%rbp)
  8011bd: 0f 86 10 00 00 00            	jbe	0x8011d3 <strlcpy+0x53>
  8011c3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011c7: 0f be 00                     	movsbl	(%rax), %eax
  8011ca: 83 f8 00                     	cmpl	$0, %eax
  8011cd: 0f 95 c0                     	setne	%al
  8011d0: 88 45 df                     	movb	%al, -33(%rbp)
  8011d3: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  8011d6: a8 01                        	testb	$1, %al
  8011d8: 0f 85 05 00 00 00            	jne	0x8011e3 <strlcpy+0x63>
  8011de: e9 27 00 00 00               	jmp	0x80120a <strlcpy+0x8a>
; 			*dst++ = *src++;
  8011e3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011e7: 48 89 c1                     	movq	%rax, %rcx
  8011ea: 48 83 c1 01                  	addq	$1, %rcx
  8011ee: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8011f2: 8a 08                        	movb	(%rax), %cl
  8011f4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011f8: 48 89 c2                     	movq	%rax, %rdx
  8011fb: 48 83 c2 01                  	addq	$1, %rdx
  8011ff: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801203: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801205: e9 9e ff ff ff               	jmp	0x8011a8 <strlcpy+0x28>
; 		*dst = '\0';
  80120a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80120e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801211: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801215: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801219: 48 29 c8                     	subq	%rcx, %rax
  80121c: 5d                           	popq	%rbp
  80121d: c3                           	retq
  80121e: 66 90                        	nop

0000000000801220 <strcmp>:
; {
  801220: 55                           	pushq	%rbp
  801221: 48 89 e5                     	movq	%rsp, %rbp
  801224: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801228: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80122c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801230: 0f be 08                     	movsbl	(%rax), %ecx
  801233: 31 c0                        	xorl	%eax, %eax
  801235: 83 f9 00                     	cmpl	$0, %ecx
  801238: 88 45 ef                     	movb	%al, -17(%rbp)
  80123b: 0f 84 16 00 00 00            	je	0x801257 <strcmp+0x37>
  801241: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801245: 0f be 00                     	movsbl	(%rax), %eax
  801248: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80124c: 0f be 09                     	movsbl	(%rcx), %ecx
  80124f: 39 c8                        	cmpl	%ecx, %eax
  801251: 0f 94 c0                     	sete	%al
  801254: 88 45 ef                     	movb	%al, -17(%rbp)
  801257: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80125a: a8 01                        	testb	$1, %al
  80125c: 0f 85 05 00 00 00            	jne	0x801267 <strcmp+0x47>
  801262: e9 1d 00 00 00               	jmp	0x801284 <strcmp+0x64>
; 		p++, q++;
  801267: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80126b: 48 83 c0 01                  	addq	$1, %rax
  80126f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801273: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801277: 48 83 c0 01                  	addq	$1, %rax
  80127b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80127f: e9 a8 ff ff ff               	jmp	0x80122c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801284: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801288: 0f b6 00                     	movzbl	(%rax), %eax
  80128b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80128f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801292: 29 c8                        	subl	%ecx, %eax
  801294: 5d                           	popq	%rbp
  801295: c3                           	retq
  801296: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008012a0 <strncmp>:
; {
  8012a0: 55                           	pushq	%rbp
  8012a1: 48 89 e5                     	movq	%rsp, %rbp
  8012a4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012a8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8012ac: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012b0: 31 c0                        	xorl	%eax, %eax
  8012b2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012b7: 88 45 df                     	movb	%al, -33(%rbp)
  8012ba: 0f 86 2b 00 00 00            	jbe	0x8012eb <strncmp+0x4b>
  8012c0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012c4: 0f be 08                     	movsbl	(%rax), %ecx
  8012c7: 31 c0                        	xorl	%eax, %eax
  8012c9: 83 f9 00                     	cmpl	$0, %ecx
  8012cc: 88 45 df                     	movb	%al, -33(%rbp)
  8012cf: 0f 84 16 00 00 00            	je	0x8012eb <strncmp+0x4b>
  8012d5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012d9: 0f be 00                     	movsbl	(%rax), %eax
  8012dc: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8012e0: 0f be 09                     	movsbl	(%rcx), %ecx
  8012e3: 39 c8                        	cmpl	%ecx, %eax
  8012e5: 0f 94 c0                     	sete	%al
  8012e8: 88 45 df                     	movb	%al, -33(%rbp)
  8012eb: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  8012ee: a8 01                        	testb	$1, %al
  8012f0: 0f 85 05 00 00 00            	jne	0x8012fb <strncmp+0x5b>
  8012f6: e9 29 00 00 00               	jmp	0x801324 <strncmp+0x84>
; 		n--, p++, q++;
  8012fb: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8012ff: 48 83 c0 ff                  	addq	$-1, %rax
  801303: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801307: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80130b: 48 83 c0 01                  	addq	$1, %rax
  80130f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801313: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801317: 48 83 c0 01                  	addq	$1, %rax
  80131b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80131f: e9 8c ff ff ff               	jmp	0x8012b0 <strncmp+0x10>
; 	if (n == 0)
  801324: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801329: 0f 85 0c 00 00 00            	jne	0x80133b <strncmp+0x9b>
; 		return 0;
  80132f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801336: e9 13 00 00 00               	jmp	0x80134e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80133b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80133f: 0f b6 00                     	movzbl	(%rax), %eax
  801342: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801346: 0f b6 09                     	movzbl	(%rcx), %ecx
  801349: 29 c8                        	subl	%ecx, %eax
  80134b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80134e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801351: 5d                           	popq	%rbp
  801352: c3                           	retq
  801353: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80135d: 0f 1f 00                     	nopl	(%rax)

0000000000801360 <strchr>:
; {
  801360: 55                           	pushq	%rbp
  801361: 48 89 e5                     	movq	%rsp, %rbp
  801364: 40 88 f0                     	movb	%sil, %al
  801367: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80136b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80136e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801372: 80 38 00                     	cmpb	$0, (%rax)
  801375: 0f 84 36 00 00 00            	je	0x8013b1 <strchr+0x51>
; 		if (*s == c)
  80137b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80137f: 0f be 00                     	movsbl	(%rax), %eax
  801382: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801386: 39 c8                        	cmpl	%ecx, %eax
  801388: 0f 85 0d 00 00 00            	jne	0x80139b <strchr+0x3b>
; 			return (char *) s;
  80138e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801392: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801396: e9 1e 00 00 00               	jmp	0x8013b9 <strchr+0x59>
; 		if (*s == c)
  80139b: e9 00 00 00 00               	jmp	0x8013a0 <strchr+0x40>
; 	for (; *s; s++)
  8013a0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013a4: 48 83 c0 01                  	addq	$1, %rax
  8013a8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8013ac: e9 bd ff ff ff               	jmp	0x80136e <strchr+0xe>
; 	return 0;
  8013b1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8013b9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013bd: 5d                           	popq	%rbp
  8013be: c3                           	retq
  8013bf: 90                           	nop

00000000008013c0 <strfind>:
; {
  8013c0: 55                           	pushq	%rbp
  8013c1: 48 89 e5                     	movq	%rsp, %rbp
  8013c4: 40 88 f0                     	movb	%sil, %al
  8013c7: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8013cb: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  8013ce: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013d2: 80 38 00                     	cmpb	$0, (%rax)
  8013d5: 0f 84 2e 00 00 00            	je	0x801409 <strfind+0x49>
; 		if (*s == c)
  8013db: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013df: 0f be 00                     	movsbl	(%rax), %eax
  8013e2: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  8013e6: 39 c8                        	cmpl	%ecx, %eax
  8013e8: 0f 85 05 00 00 00            	jne	0x8013f3 <strfind+0x33>
; 			break;
  8013ee: e9 16 00 00 00               	jmp	0x801409 <strfind+0x49>
; 		if (*s == c)
  8013f3: e9 00 00 00 00               	jmp	0x8013f8 <strfind+0x38>
; 	for (; *s; s++)
  8013f8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013fc: 48 83 c0 01                  	addq	$1, %rax
  801400: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801404: e9 c5 ff ff ff               	jmp	0x8013ce <strfind+0xe>
; 	return (char *) s;
  801409: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80140d: 5d                           	popq	%rbp
  80140e: c3                           	retq
  80140f: 90                           	nop

0000000000801410 <memset>:
; {
  801410: 55                           	pushq	%rbp
  801411: 48 89 e5                     	movq	%rsp, %rbp
  801414: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801418: 89 75 ec                     	movl	%esi, -20(%rbp)
  80141b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80141f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801424: 0f 85 0d 00 00 00            	jne	0x801437 <memset+0x27>
; 		return v;
  80142a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80142e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801432: e9 78 00 00 00               	jmp	0x8014af <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801437: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80143b: 48 83 e0 03                  	andq	$3, %rax
  80143f: 48 83 f8 00                  	cmpq	$0, %rax
  801443: 0f 85 50 00 00 00            	jne	0x801499 <memset+0x89>
  801449: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80144d: 48 83 e0 03                  	andq	$3, %rax
  801451: 48 83 f8 00                  	cmpq	$0, %rax
  801455: 0f 85 3e 00 00 00            	jne	0x801499 <memset+0x89>
; 		c &= 0xFF;
  80145b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80145e: 25 ff 00 00 00               	andl	$255, %eax
  801463: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801466: 8b 45 ec                     	movl	-20(%rbp), %eax
  801469: c1 e0 18                     	shll	$24, %eax
  80146c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80146f: c1 e1 10                     	shll	$16, %ecx
  801472: 09 c8                        	orl	%ecx, %eax
  801474: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801477: c1 e1 08                     	shll	$8, %ecx
  80147a: 09 c8                        	orl	%ecx, %eax
  80147c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80147f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801482: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801486: 8b 45 ec                     	movl	-20(%rbp), %eax
  801489: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80148d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801491: fc                           	cld
  801492: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801494: e9 0e 00 00 00               	jmp	0x8014a7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801499: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  80149d: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014a0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8014a4: fc                           	cld
  8014a5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8014a7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014ab: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8014af: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014b3: 5d                           	popq	%rbp
  8014b4: c3                           	retq
  8014b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014bf: 90                           	nop

00000000008014c0 <memmove>:
; {
  8014c0: 55                           	pushq	%rbp
  8014c1: 48 89 e5                     	movq	%rsp, %rbp
  8014c4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014c8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8014cc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  8014d0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014d4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  8014d8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014dc: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  8014e0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014e4: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8014e8: 0f 83 9d 00 00 00            	jae	0x80158b <memmove+0xcb>
  8014ee: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014f2: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8014f6: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8014fa: 0f 86 8b 00 00 00            	jbe	0x80158b <memmove+0xcb>
; 		s += n;
  801500: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801504: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801508: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80150c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801510: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801514: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801518: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80151c: 48 83 e0 03                  	andq	$3, %rax
  801520: 48 83 f8 00                  	cmpq	$0, %rax
  801524: 0f 85 44 00 00 00            	jne	0x80156e <memmove+0xae>
  80152a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80152e: 48 83 e0 03                  	andq	$3, %rax
  801532: 48 83 f8 00                  	cmpq	$0, %rax
  801536: 0f 85 32 00 00 00            	jne	0x80156e <memmove+0xae>
  80153c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801540: 48 83 e0 03                  	andq	$3, %rax
  801544: 48 83 f8 00                  	cmpq	$0, %rax
  801548: 0f 85 20 00 00 00            	jne	0x80156e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80154e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801552: 48 83 c7 fc                  	addq	$-4, %rdi
  801556: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80155a: 48 83 c6 fc                  	addq	$-4, %rsi
  80155e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801562: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801566: fd                           	std
  801567: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801569: e9 17 00 00 00               	jmp	0x801585 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80156e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801572: 48 83 c7 ff                  	addq	$-1, %rdi
  801576: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80157a: 48 83 c6 ff                  	addq	$-1, %rsi
  80157e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801582: fd                           	std
  801583: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801585: fc                           	cld
; 	} else {
  801586: e9 62 00 00 00               	jmp	0x8015ed <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80158b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80158f: 48 83 e0 03                  	andq	$3, %rax
  801593: 48 83 f8 00                  	cmpq	$0, %rax
  801597: 0f 85 3c 00 00 00            	jne	0x8015d9 <memmove+0x119>
  80159d: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8015a1: 48 83 e0 03                  	andq	$3, %rax
  8015a5: 48 83 f8 00                  	cmpq	$0, %rax
  8015a9: 0f 85 2a 00 00 00            	jne	0x8015d9 <memmove+0x119>
  8015af: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015b3: 48 83 e0 03                  	andq	$3, %rax
  8015b7: 48 83 f8 00                  	cmpq	$0, %rax
  8015bb: 0f 85 18 00 00 00            	jne	0x8015d9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8015c1: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015c5: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015c9: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8015cd: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  8015d1: fc                           	cld
  8015d2: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8015d4: e9 0f 00 00 00               	jmp	0x8015e8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  8015d9: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015dd: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015e1: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  8015e5: fc                           	cld
  8015e6: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  8015e8: e9 00 00 00 00               	jmp	0x8015ed <memmove+0x12d>
; 	return dst;
  8015ed: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015f1: 5d                           	popq	%rbp
  8015f2: c3                           	retq
  8015f3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8015fd: 0f 1f 00                     	nopl	(%rax)

0000000000801600 <memcpy>:
; {
  801600: 55                           	pushq	%rbp
  801601: 48 89 e5                     	movq	%rsp, %rbp
  801604: 48 83 ec 20                  	subq	$32, %rsp
  801608: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80160c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801610: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801614: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801618: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80161c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801620: e8 9b fe ff ff               	callq	0x8014c0 <memmove>
  801625: 48 83 c4 20                  	addq	$32, %rsp
  801629: 5d                           	popq	%rbp
  80162a: c3                           	retq
  80162b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801630 <memcmp>:
; {
  801630: 55                           	pushq	%rbp
  801631: 48 89 e5                     	movq	%rsp, %rbp
  801634: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801638: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80163c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801640: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801644: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801648: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80164c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801650: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801654: 48 89 c1                     	movq	%rax, %rcx
  801657: 48 83 c1 ff                  	addq	$-1, %rcx
  80165b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80165f: 48 83 f8 00                  	cmpq	$0, %rax
  801663: 0f 86 4b 00 00 00            	jbe	0x8016b4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801669: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80166d: 0f b6 00                     	movzbl	(%rax), %eax
  801670: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801674: 0f b6 09                     	movzbl	(%rcx), %ecx
  801677: 39 c8                        	cmpl	%ecx, %eax
  801679: 0f 84 18 00 00 00            	je	0x801697 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80167f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801683: 0f b6 00                     	movzbl	(%rax), %eax
  801686: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80168a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80168d: 29 c8                        	subl	%ecx, %eax
  80168f: 89 45 fc                     	movl	%eax, -4(%rbp)
  801692: e9 24 00 00 00               	jmp	0x8016bb <memcmp+0x8b>
; 		s1++, s2++;
  801697: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80169b: 48 83 c0 01                  	addq	$1, %rax
  80169f: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8016a3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8016a7: 48 83 c0 01                  	addq	$1, %rax
  8016ab: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8016af: e9 9c ff ff ff               	jmp	0x801650 <memcmp+0x20>
; 	return 0;
  8016b4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8016bb: 8b 45 fc                     	movl	-4(%rbp), %eax
  8016be: 5d                           	popq	%rbp
  8016bf: c3                           	retq

00000000008016c0 <memfind>:
; {
  8016c0: 55                           	pushq	%rbp
  8016c1: 48 89 e5                     	movq	%rsp, %rbp
  8016c4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016c8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8016cb: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  8016cf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016d3: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8016d7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  8016db: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016df: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  8016e3: 0f 83 30 00 00 00            	jae	0x801719 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8016e9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016ed: 0f b6 00                     	movzbl	(%rax), %eax
  8016f0: 8b 4d f4                     	movl	-12(%rbp), %ecx
  8016f3: 0f b6 c9                     	movzbl	%cl, %ecx
  8016f6: 39 c8                        	cmpl	%ecx, %eax
  8016f8: 0f 85 05 00 00 00            	jne	0x801703 <memfind+0x43>
; 			break;
  8016fe: e9 16 00 00 00               	jmp	0x801719 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801703: e9 00 00 00 00               	jmp	0x801708 <memfind+0x48>
; 	for (; s < ends; s++)
  801708: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80170c: 48 83 c0 01                  	addq	$1, %rax
  801710: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801714: e9 c2 ff ff ff               	jmp	0x8016db <memfind+0x1b>
; 	return (void *) s;
  801719: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80171d: 5d                           	popq	%rbp
  80171e: c3                           	retq
  80171f: 90                           	nop

0000000000801720 <strtol>:
; {
  801720: 55                           	pushq	%rbp
  801721: 48 89 e5                     	movq	%rsp, %rbp
  801724: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801728: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80172c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80172f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801736: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80173e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801742: 0f be 08                     	movsbl	(%rax), %ecx
  801745: b0 01                        	movb	$1, %al
  801747: 83 f9 20                     	cmpl	$32, %ecx
  80174a: 88 45 db                     	movb	%al, -37(%rbp)
  80174d: 0f 84 10 00 00 00            	je	0x801763 <strtol+0x43>
  801753: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801757: 0f be 00                     	movsbl	(%rax), %eax
  80175a: 83 f8 09                     	cmpl	$9, %eax
  80175d: 0f 94 c0                     	sete	%al
  801760: 88 45 db                     	movb	%al, -37(%rbp)
  801763: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801766: a8 01                        	testb	$1, %al
  801768: 0f 85 05 00 00 00            	jne	0x801773 <strtol+0x53>
  80176e: e9 11 00 00 00               	jmp	0x801784 <strtol+0x64>
; 		s++;
  801773: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801777: 48 83 c0 01                  	addq	$1, %rax
  80177b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80177f: e9 ba ff ff ff               	jmp	0x80173e <strtol+0x1e>
; 	if (*s == '+')
  801784: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801788: 0f be 00                     	movsbl	(%rax), %eax
  80178b: 83 f8 2b                     	cmpl	$43, %eax
  80178e: 0f 85 11 00 00 00            	jne	0x8017a5 <strtol+0x85>
; 		s++;
  801794: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801798: 48 83 c0 01                  	addq	$1, %rax
  80179c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017a0: e9 28 00 00 00               	jmp	0x8017cd <strtol+0xad>
; 	else if (*s == '-')
  8017a5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a9: 0f be 00                     	movsbl	(%rax), %eax
  8017ac: 83 f8 2d                     	cmpl	$45, %eax
  8017af: 0f 85 13 00 00 00            	jne	0x8017c8 <strtol+0xa8>
; 		s++, neg = 1;
  8017b5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b9: 48 83 c0 01                  	addq	$1, %rax
  8017bd: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017c1: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  8017c8: e9 00 00 00 00               	jmp	0x8017cd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8017cd: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017d1: 0f 84 0a 00 00 00            	je	0x8017e1 <strtol+0xc1>
  8017d7: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  8017db: 0f 85 39 00 00 00            	jne	0x80181a <strtol+0xfa>
  8017e1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017e5: 0f be 00                     	movsbl	(%rax), %eax
  8017e8: 83 f8 30                     	cmpl	$48, %eax
  8017eb: 0f 85 29 00 00 00            	jne	0x80181a <strtol+0xfa>
  8017f1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017f5: 0f be 40 01                  	movsbl	1(%rax), %eax
  8017f9: 83 f8 78                     	cmpl	$120, %eax
  8017fc: 0f 85 18 00 00 00            	jne	0x80181a <strtol+0xfa>
; 		s += 2, base = 16;
  801802: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801806: 48 83 c0 02                  	addq	$2, %rax
  80180a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80180e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801815: e9 4d 00 00 00               	jmp	0x801867 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80181a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80181e: 0f 85 28 00 00 00            	jne	0x80184c <strtol+0x12c>
  801824: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801828: 0f be 00                     	movsbl	(%rax), %eax
  80182b: 83 f8 30                     	cmpl	$48, %eax
  80182e: 0f 85 18 00 00 00            	jne	0x80184c <strtol+0x12c>
; 		s++, base = 8;
  801834: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801838: 48 83 c0 01                  	addq	$1, %rax
  80183c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801840: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801847: e9 16 00 00 00               	jmp	0x801862 <strtol+0x142>
; 	else if (base == 0)
  80184c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801850: 0f 85 07 00 00 00            	jne	0x80185d <strtol+0x13d>
; 		base = 10;
  801856: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80185d: e9 00 00 00 00               	jmp	0x801862 <strtol+0x142>
  801862: e9 00 00 00 00               	jmp	0x801867 <strtol+0x147>
; 	while (1) {
  801867: e9 00 00 00 00               	jmp	0x80186c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80186c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801870: 0f be 00                     	movsbl	(%rax), %eax
  801873: 83 f8 30                     	cmpl	$48, %eax
  801876: 0f 8c 22 00 00 00            	jl	0x80189e <strtol+0x17e>
  80187c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801880: 0f be 00                     	movsbl	(%rax), %eax
  801883: 83 f8 39                     	cmpl	$57, %eax
  801886: 0f 8f 12 00 00 00            	jg	0x80189e <strtol+0x17e>
; 			dig = *s - '0';
  80188c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801890: 0f be 00                     	movsbl	(%rax), %eax
  801893: 83 e8 30                     	subl	$48, %eax
  801896: 89 45 dc                     	movl	%eax, -36(%rbp)
  801899: e9 79 00 00 00               	jmp	0x801917 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80189e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018a2: 0f be 00                     	movsbl	(%rax), %eax
  8018a5: 83 f8 61                     	cmpl	$97, %eax
  8018a8: 0f 8c 25 00 00 00            	jl	0x8018d3 <strtol+0x1b3>
  8018ae: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018b2: 0f be 00                     	movsbl	(%rax), %eax
  8018b5: 83 f8 7a                     	cmpl	$122, %eax
  8018b8: 0f 8f 15 00 00 00            	jg	0x8018d3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8018be: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018c2: 0f be 00                     	movsbl	(%rax), %eax
  8018c5: 83 e8 61                     	subl	$97, %eax
  8018c8: 83 c0 0a                     	addl	$10, %eax
  8018cb: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018ce: e9 3f 00 00 00               	jmp	0x801912 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  8018d3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018d7: 0f be 00                     	movsbl	(%rax), %eax
  8018da: 83 f8 41                     	cmpl	$65, %eax
  8018dd: 0f 8c 25 00 00 00            	jl	0x801908 <strtol+0x1e8>
  8018e3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018e7: 0f be 00                     	movsbl	(%rax), %eax
  8018ea: 83 f8 5a                     	cmpl	$90, %eax
  8018ed: 0f 8f 15 00 00 00            	jg	0x801908 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  8018f3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018f7: 0f be 00                     	movsbl	(%rax), %eax
  8018fa: 83 e8 41                     	subl	$65, %eax
  8018fd: 83 c0 0a                     	addl	$10, %eax
  801900: 89 45 dc                     	movl	%eax, -36(%rbp)
  801903: e9 05 00 00 00               	jmp	0x80190d <strtol+0x1ed>
; 			break;
  801908: e9 43 00 00 00               	jmp	0x801950 <strtol+0x230>
  80190d: e9 00 00 00 00               	jmp	0x801912 <strtol+0x1f2>
  801912: e9 00 00 00 00               	jmp	0x801917 <strtol+0x1f7>
; 		if (dig >= base)
  801917: 8b 45 dc                     	movl	-36(%rbp), %eax
  80191a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80191d: 0f 8c 05 00 00 00            	jl	0x801928 <strtol+0x208>
; 			break;
  801923: e9 28 00 00 00               	jmp	0x801950 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801928: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80192c: 48 83 c0 01                  	addq	$1, %rax
  801930: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801934: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801938: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80193c: 48 0f af c1                  	imulq	%rcx, %rax
  801940: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801944: 48 01 c8                     	addq	%rcx, %rax
  801947: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80194b: e9 1c ff ff ff               	jmp	0x80186c <strtol+0x14c>
; 	if (endptr)
  801950: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801955: 0f 84 0b 00 00 00            	je	0x801966 <strtol+0x246>
; 		*endptr = (char *) s;
  80195b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80195f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801963: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801966: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80196a: 0f 84 0f 00 00 00            	je	0x80197f <strtol+0x25f>
  801970: 31 c0                        	xorl	%eax, %eax
  801972: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801976: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80197a: e9 08 00 00 00               	jmp	0x801987 <strtol+0x267>
  80197f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801983: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801987: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80198b: 5d                           	popq	%rbp
  80198c: c3                           	retq
