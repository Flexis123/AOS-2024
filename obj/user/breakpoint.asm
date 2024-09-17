
obj/user/breakpoint:	file format elf64-x86-64

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
  800042: e8 19 00 00 00               	callq	0x800060 <libmain>
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
  800054: 89 7d fc                     	movl	%edi, -4(%rbp)
  800057: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	asm volatile("int $3");
  80005b: cc                           	int3
; }
  80005c: 31 c0                        	xorl	%eax, %eax
  80005e: 5d                           	popq	%rbp
  80005f: c3                           	retq

0000000000800060 <libmain>:
; {
  800060: 55                           	pushq	%rbp
  800061: 48 89 e5                     	movq	%rsp, %rbp
  800064: 48 83 ec 10                  	subq	$16, %rsp
  800068: 89 7d fc                     	movl	%edi, -4(%rbp)
  80006b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80006f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  800073: 0f 8e 11 00 00 00            	jle	0x80008a <libmain+0x2a>
; 		binary_name = argv[0];
  800079: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80007d: 48 8b 08                     	movq	(%rax), %rcx
  800080: 48 8d 05 79 2f 00 00         	leaq	12153(%rip), %rax       # 0x803000 <binary_name>
  800087: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  80008a: 8b 7d fc                     	movl	-4(%rbp), %edi
  80008d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800091: e8 ba ff ff ff               	callq	0x800050 <main>
; 	exit();
  800096: e8 15 00 00 00               	callq	0x8000b0 <exit>
; }
  80009b: 48 83 c4 10                  	addq	$16, %rsp
  80009f: 5d                           	popq	%rbp
  8000a0: c3                           	retq
  8000a1: cc                           	int3
  8000a2: cc                           	int3
  8000a3: cc                           	int3
  8000a4: cc                           	int3
  8000a5: cc                           	int3
  8000a6: cc                           	int3
  8000a7: cc                           	int3
  8000a8: cc                           	int3
  8000a9: cc                           	int3
  8000aa: cc                           	int3
  8000ab: cc                           	int3
  8000ac: cc                           	int3
  8000ad: cc                           	int3
  8000ae: cc                           	int3
  8000af: cc                           	int3

00000000008000b0 <exit>:
; {
  8000b0: 55                           	pushq	%rbp
  8000b1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000b4: 31 ff                        	xorl	%edi, %edi
  8000b6: e8 15 01 00 00               	callq	0x8001d0 <kill>
; }
  8000bb: 5d                           	popq	%rbp
  8000bc: c3                           	retq
  8000bd: cc                           	int3
  8000be: cc                           	int3
  8000bf: cc                           	int3

00000000008000c0 <puts>:
; {
  8000c0: 55                           	pushq	%rbp
  8000c1: 48 89 e5                     	movq	%rsp, %rbp
  8000c4: 48 83 ec 20                  	subq	$32, %rsp
  8000c8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000cc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000d0: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8000d4: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8000d8: 31 f6                        	xorl	%esi, %esi
  8000da: 31 c0                        	xorl	%eax, %eax
  8000dc: 41 89 c1                     	movl	%eax, %r9d
  8000df: 89 f7                        	movl	%esi, %edi
  8000e1: 4d 89 c8                     	movq	%r9, %r8
  8000e4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000ec: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8000f5: e8 06 00 00 00               	callq	0x800100 <syscall>
; }
  8000fa: 48 83 c4 20                  	addq	$32, %rsp
  8000fe: 5d                           	popq	%rbp
  8000ff: c3                           	retq

0000000000800100 <syscall>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
  800104: 48 83 ec 40                  	subq	$64, %rsp
  800108: 48 8b 45 18                  	movq	24(%rbp), %rax
  80010c: 48 8b 45 10                  	movq	16(%rbp), %rax
  800110: 89 7d fc                     	movl	%edi, -4(%rbp)
  800113: 89 75 f8                     	movl	%esi, -8(%rbp)
  800116: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80011a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80011e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  800122: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800126: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80012a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80012e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800132: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800136: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80013a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80013e: 48 8b 45 18                  	movq	24(%rbp), %rax
  800142: 48 89 04 24                  	movq	%rax, (%rsp)
  800146: e8 01 01 00 00               	callq	0x80024c <do_syscall>
  80014b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80014f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  800153: 0f 84 2c 00 00 00            	je	0x800185 <syscall+0x85>
  800159: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80015e: 0f 83 21 00 00 00            	jae	0x800185 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  800164: 8b 4d fc                     	movl	-4(%rbp), %ecx
  800167: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80016b: 48 8d 3d 4c 1f 00 00         	leaq	8012(%rip), %rdi        # 0x8020be <syscall.c+0x8020be>
  800172: be 1f 00 00 00               	movl	$31, %esi
  800177: 48 8d 15 de 1e 00 00         	leaq	7902(%rip), %rdx        # 0x80205c <syscall.c+0x80205c>
  80017e: b0 00                        	movb	$0, %al
  800180: e8 db 00 00 00               	callq	0x800260 <_panic>
; 	return ret;
  800185: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800189: 48 83 c4 40                  	addq	$64, %rsp
  80018d: 5d                           	popq	%rbp
  80018e: c3                           	retq
  80018f: 90                           	nop

0000000000800190 <getc>:
; {
  800190: 55                           	pushq	%rbp
  800191: 48 89 e5                     	movq	%rsp, %rbp
  800194: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800198: bf 01 00 00 00               	movl	$1, %edi
  80019d: 31 f6                        	xorl	%esi, %esi
  80019f: 31 c0                        	xorl	%eax, %eax
  8001a1: 41 89 c1                     	movl	%eax, %r9d
  8001a4: 4c 89 ca                     	movq	%r9, %rdx
  8001a7: 4c 89 c9                     	movq	%r9, %rcx
  8001aa: 4d 89 c8                     	movq	%r9, %r8
  8001ad: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001b5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001be: e8 3d ff ff ff               	callq	0x800100 <syscall>
  8001c3: 48 83 c4 10                  	addq	$16, %rsp
  8001c7: 5d                           	popq	%rbp
  8001c8: c3                           	retq
  8001c9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008001d0 <kill>:
; {
  8001d0: 55                           	pushq	%rbp
  8001d1: 48 89 e5                     	movq	%rsp, %rbp
  8001d4: 48 83 ec 20                  	subq	$32, %rsp
  8001d8: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8001db: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  8001df: bf 03 00 00 00               	movl	$3, %edi
  8001e4: be 01 00 00 00               	movl	$1, %esi
  8001e9: 31 c0                        	xorl	%eax, %eax
  8001eb: 41 89 c1                     	movl	%eax, %r9d
  8001ee: 4c 89 c9                     	movq	%r9, %rcx
  8001f1: 4d 89 c8                     	movq	%r9, %r8
  8001f4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001fc: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800205: e8 f6 fe ff ff               	callq	0x800100 <syscall>
  80020a: 48 83 c4 20                  	addq	$32, %rsp
  80020e: 5d                           	popq	%rbp
  80020f: c3                           	retq

0000000000800210 <getpid>:
; {
  800210: 55                           	pushq	%rbp
  800211: 48 89 e5                     	movq	%rsp, %rbp
  800214: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800218: bf 02 00 00 00               	movl	$2, %edi
  80021d: 31 f6                        	xorl	%esi, %esi
  80021f: 31 c0                        	xorl	%eax, %eax
  800221: 41 89 c1                     	movl	%eax, %r9d
  800224: 4c 89 ca                     	movq	%r9, %rdx
  800227: 4c 89 c9                     	movq	%r9, %rcx
  80022a: 4d 89 c8                     	movq	%r9, %r8
  80022d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800235: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80023e: e8 bd fe ff ff               	callq	0x800100 <syscall>
  800243: 48 83 c4 10                  	addq	$16, %rsp
  800247: 5d                           	popq	%rbp
  800248: c3                           	retq
  800249: cc                           	int3
  80024a: cc                           	int3
  80024b: cc                           	int3

000000000080024c <do_syscall>:
; 	pushq %rbp
  80024c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80024d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800252: cd 80                        	int	$128
; 	popq %rbp
  800254: 5d                           	popq	%rbp
; 	retq
  800255: c3                           	retq
  800256: cc                           	int3
  800257: cc                           	int3
  800258: cc                           	int3
  800259: cc                           	int3
  80025a: cc                           	int3
  80025b: cc                           	int3
  80025c: cc                           	int3
  80025d: cc                           	int3
  80025e: cc                           	int3
  80025f: cc                           	int3

0000000000800260 <_panic>:
; {
  800260: 55                           	pushq	%rbp
  800261: 48 89 e5                     	movq	%rsp, %rbp
  800264: 48 83 ec 60                  	subq	$96, %rsp
  800268: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80026c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800270: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800274: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800278: 89 75 f4                     	movl	%esi, -12(%rbp)
  80027b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80027f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800283: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800287: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80028b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80028f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  800293: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80029a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  8002a0: e8 6b ff ff ff               	callq	0x800210 <getpid>
  8002a5: 89 c6                        	movl	%eax, %esi
  8002a7: 48 8d 05 52 2d 00 00         	leaq	11602(%rip), %rax       # 0x803000 <binary_name>
  8002ae: 48 8b 10                     	movq	(%rax), %rdx
  8002b1: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8002b5: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8002b9: 48 8d 3d 5e 1d 00 00         	leaq	7518(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8002c0: b0 00                        	movb	$0, %al
  8002c2: e8 09 01 00 00               	callq	0x8003d0 <printf>
; 	vprintf(fmt, ap);
  8002c7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8002cb: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8002cf: e8 1c 00 00 00               	callq	0x8002f0 <vprintf>
; 	printf("\n");
  8002d4: 48 8d 3d da 1d 00 00         	leaq	7642(%rip), %rdi        # 0x8020b5 <syscall.c+0x8020b5>
  8002db: b0 00                        	movb	$0, %al
  8002dd: e8 ee 00 00 00               	callq	0x8003d0 <printf>
; 		asm volatile("int3");
  8002e2: cc                           	int3
; 	while (1) {
  8002e3: e9 fa ff ff ff               	jmp	0x8002e2 <_panic+0x82>
  8002e8: cc                           	int3
  8002e9: cc                           	int3
  8002ea: cc                           	int3
  8002eb: cc                           	int3
  8002ec: cc                           	int3
  8002ed: cc                           	int3
  8002ee: cc                           	int3
  8002ef: cc                           	int3

00000000008002f0 <vprintf>:
; {
  8002f0: 55                           	pushq	%rbp
  8002f1: 48 89 e5                     	movq	%rsp, %rbp
  8002f4: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  8002fb: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8002ff: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800303: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80030d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800317: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80031e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800322: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800326: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800360 <putch>
  80032d: e8 fe 00 00 00               	callq	0x800430 <vprintfmt>
; 	puts(b.buf, b.idx);
  800332: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800339: 48 83 c7 08                  	addq	$8, %rdi
  80033d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800344: e8 77 fd ff ff               	callq	0x8000c0 <puts>
; 	return b.cnt;
  800349: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80034f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800356: 5d                           	popq	%rbp
  800357: c3                           	retq
  800358: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800360 <putch>:
; {
  800360: 55                           	pushq	%rbp
  800361: 48 89 e5                     	movq	%rsp, %rbp
  800364: 48 83 ec 10                  	subq	$16, %rsp
  800368: 89 7d fc                     	movl	%edi, -4(%rbp)
  80036b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80036f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800372: 88 c2                        	movb	%al, %dl
  800374: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800378: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80037c: 8b 0e                        	movl	(%rsi), %ecx
  80037e: 89 cf                        	movl	%ecx, %edi
  800380: 83 c7 01                     	addl	$1, %edi
  800383: 89 3e                        	movl	%edi, (%rsi)
  800385: 48 63 c9                     	movslq	%ecx, %rcx
  800388: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80038c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800390: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800396: 0f 85 1e 00 00 00            	jne	0x8003ba <putch+0x5a>
; 		puts(b->buf, b->idx);
  80039c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8003a0: 48 83 c7 08                  	addq	$8, %rdi
  8003a4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003a8: 48 63 30                     	movslq	(%rax), %rsi
  8003ab: e8 10 fd ff ff               	callq	0x8000c0 <puts>
; 		b->idx = 0;
  8003b0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003b4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8003ba: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003be: 8b 48 04                     	movl	4(%rax), %ecx
  8003c1: 83 c1 01                     	addl	$1, %ecx
  8003c4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8003c7: 48 83 c4 10                  	addq	$16, %rsp
  8003cb: 5d                           	popq	%rbp
  8003cc: c3                           	retq
  8003cd: 0f 1f 00                     	nopl	(%rax)

00000000008003d0 <printf>:
; {
  8003d0: 55                           	pushq	%rbp
  8003d1: 48 89 e5                     	movq	%rsp, %rbp
  8003d4: 48 83 ec 60                  	subq	$96, %rsp
  8003d8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8003dc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8003e0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8003e4: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  8003e8: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  8003ec: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8003f0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8003f4: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8003f8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8003fc: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800400: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800407: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80040e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800412: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800416: e8 d5 fe ff ff               	callq	0x8002f0 <vprintf>
  80041b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80041e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800421: 48 83 c4 60                  	addq	$96, %rsp
  800425: 5d                           	popq	%rbp
  800426: c3                           	retq
  800427: cc                           	int3
  800428: cc                           	int3
  800429: cc                           	int3
  80042a: cc                           	int3
  80042b: cc                           	int3
  80042c: cc                           	int3
  80042d: cc                           	int3
  80042e: cc                           	int3
  80042f: cc                           	int3

0000000000800430 <vprintfmt>:
; {
  800430: 55                           	pushq	%rbp
  800431: 48 89 e5                     	movq	%rsp, %rbp
  800434: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80043b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80043f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800443: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800447: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80044b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80044f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800453: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800457: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80045b: 48 8b 0a                     	movq	(%rdx), %rcx
  80045e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800462: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800466: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800469: e9 00 00 00 00               	jmp	0x80046e <vprintfmt+0x3e>
  80046e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800472: 48 89 c1                     	movq	%rax, %rcx
  800475: 48 83 c1 01                  	addq	$1, %rcx
  800479: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80047d: 0f b6 00                     	movzbl	(%rax), %eax
  800480: 89 45 b4                     	movl	%eax, -76(%rbp)
  800483: 83 f8 25                     	cmpl	$37, %eax
  800486: 0f 84 25 00 00 00            	je	0x8004b1 <vprintfmt+0x81>
; 			if (ch == '\0')
  80048c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800490: 0f 85 09 00 00 00            	jne	0x80049f <vprintfmt+0x6f>
; 				return;
  800496: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80049d: 5d                           	popq	%rbp
  80049e: c3                           	retq
; 			putch(ch, putdat);
  80049f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8004a3: 8b 7d b4                     	movl	-76(%rbp), %edi
  8004a6: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8004aa: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8004ac: e9 bd ff ff ff               	jmp	0x80046e <vprintfmt+0x3e>
; 		padc = ' ';
  8004b1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8004b5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8004bc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8004c3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8004ca: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8004d1: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004d5: 48 89 c1                     	movq	%rax, %rcx
  8004d8: 48 83 c1 01                  	addq	$1, %rcx
  8004dc: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8004e0: 0f b6 00                     	movzbl	(%rax), %eax
  8004e3: 89 45 b4                     	movl	%eax, -76(%rbp)
  8004e6: 83 c0 dd                     	addl	$-35, %eax
  8004e9: 89 c1                        	movl	%eax, %ecx
  8004eb: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  8004ef: 83 e8 55                     	subl	$85, %eax
  8004f2: 0f 87 c1 05 00 00            	ja	0x800ab9 <vprintfmt+0x689>
  8004f8: 48 8b 45 88                  	movq	-120(%rbp), %rax
  8004fc: 48 8d 0d 11 1c 00 00         	leaq	7185(%rip), %rcx        # 0x802114 <syscall.c+0x802114>
  800503: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800507: 48 01 c8                     	addq	%rcx, %rax
  80050a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80050c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800510: e9 bc ff ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			padc = '0';
  800515: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800519: e9 b3 ff ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80051e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800525: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800529: 03 45 b4                     	addl	-76(%rbp), %eax
  80052c: 83 e8 30                     	subl	$48, %eax
  80052f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800532: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800536: 0f be 00                     	movsbl	(%rax), %eax
  800539: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80053c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800540: 0f 8c 0a 00 00 00            	jl	0x800550 <vprintfmt+0x120>
  800546: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80054a: 0f 8e 05 00 00 00            	jle	0x800555 <vprintfmt+0x125>
; 					break;
  800550: e9 16 00 00 00               	jmp	0x80056b <vprintfmt+0x13b>
; 			}
  800555: e9 00 00 00 00               	jmp	0x80055a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80055a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80055e: 48 83 c0 01                  	addq	$1, %rax
  800562: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800566: e9 ba ff ff ff               	jmp	0x800525 <vprintfmt+0xf5>
; 			goto process_precision;
  80056b: e9 8c 00 00 00               	jmp	0x8005fc <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800570: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800574: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80057b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80057e: 89 45 84                     	movl	%eax, -124(%rbp)
  800581: 83 f8 28                     	cmpl	$40, %eax
  800584: 0f 87 22 00 00 00            	ja	0x8005ac <vprintfmt+0x17c>
  80058a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800591: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800594: 48 63 c2                     	movslq	%edx, %rax
  800597: 48 03 41 10                  	addq	16(%rcx), %rax
  80059b: 83 c2 08                     	addl	$8, %edx
  80059e: 89 11                        	movl	%edx, (%rcx)
  8005a0: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005a7: e9 1d 00 00 00               	jmp	0x8005c9 <vprintfmt+0x199>
  8005ac: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8005b3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005b7: 48 89 d0                     	movq	%rdx, %rax
  8005ba: 48 83 c2 08                  	addq	$8, %rdx
  8005be: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005c2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005c9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  8005d0: 8b 00                        	movl	(%rax), %eax
  8005d2: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  8005d5: e9 22 00 00 00               	jmp	0x8005fc <vprintfmt+0x1cc>
; 			if (width < 0)
  8005da: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005de: 0f 8d 07 00 00 00            	jge	0x8005eb <vprintfmt+0x1bb>
; 				width = 0;
  8005e4: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  8005eb: e9 e1 fe ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			altflag = 1;
  8005f0: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  8005f7: e9 d5 fe ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			if (width < 0)
  8005fc: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800600: 0f 8d 0d 00 00 00            	jge	0x800613 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800606: 8b 45 98                     	movl	-104(%rbp), %eax
  800609: 89 45 9c                     	movl	%eax, -100(%rbp)
  80060c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800613: e9 b9 fe ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			lflag++;
  800618: 8b 45 a0                     	movl	-96(%rbp), %eax
  80061b: 83 c0 01                     	addl	$1, %eax
  80061e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800621: e9 ab fe ff ff               	jmp	0x8004d1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800626: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80062a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800631: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800635: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80063c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80063f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800645: 83 f8 28                     	cmpl	$40, %eax
  800648: 0f 87 25 00 00 00            	ja	0x800673 <vprintfmt+0x243>
  80064e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800655: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80065b: 48 63 c2                     	movslq	%edx, %rax
  80065e: 48 03 41 10                  	addq	16(%rcx), %rax
  800662: 83 c2 08                     	addl	$8, %edx
  800665: 89 11                        	movl	%edx, (%rcx)
  800667: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80066e: e9 1d 00 00 00               	jmp	0x800690 <vprintfmt+0x260>
  800673: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80067a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80067e: 48 89 d0                     	movq	%rdx, %rax
  800681: 48 83 c2 08                  	addq	$8, %rdx
  800685: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800689: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800690: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800697: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80069e: 8b 39                        	movl	(%rcx), %edi
  8006a0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006a4: ff d0                        	callq	*%rax
; 			break;
  8006a6: e9 55 04 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  8006ab: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8006af: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8006b6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8006b9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8006bf: 83 f8 28                     	cmpl	$40, %eax
  8006c2: 0f 87 25 00 00 00            	ja	0x8006ed <vprintfmt+0x2bd>
  8006c8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8006cf: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  8006d5: 48 63 c2                     	movslq	%edx, %rax
  8006d8: 48 03 41 10                  	addq	16(%rcx), %rax
  8006dc: 83 c2 08                     	addl	$8, %edx
  8006df: 89 11                        	movl	%edx, (%rcx)
  8006e1: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8006e8: e9 1d 00 00 00               	jmp	0x80070a <vprintfmt+0x2da>
  8006ed: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  8006f4: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8006f8: 48 89 d0                     	movq	%rdx, %rax
  8006fb: 48 83 c2 08                  	addq	$8, %rdx
  8006ff: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800703: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80070a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800711: 8b 00                        	movl	(%rax), %eax
  800713: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800716: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80071a: 0f 8d 08 00 00 00            	jge	0x800728 <vprintfmt+0x2f8>
; 				err = -err;
  800720: 31 c0                        	xorl	%eax, %eax
  800722: 2b 45 b0                     	subl	-80(%rbp), %eax
  800725: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800728: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80072c: 48 83 f8 09                  	cmpq	$9, %rax
  800730: 0f 83 1d 00 00 00            	jae	0x800753 <vprintfmt+0x323>
  800736: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80073a: 48 8d 05 df f8 9f ff         	leaq	-6293281(%rip), %rax    # 0x200020 <error_string>
  800741: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800745: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800749: 48 83 f8 00                  	cmpq	$0, %rax
  80074d: 0f 85 1e 00 00 00            	jne	0x800771 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800753: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800757: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80075b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80075e: 48 8d 15 36 19 00 00         	leaq	6454(%rip), %rdx        # 0x80209b <syscall.c+0x80209b>
  800765: b0 00                        	movb	$0, %al
  800767: e8 a4 03 00 00               	callq	0x800b10 <printfmt>
  80076c: e9 1a 00 00 00               	jmp	0x80078b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800771: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800775: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800779: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80077d: 48 8d 15 97 18 00 00         	leaq	6295(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  800784: b0 00                        	movb	$0, %al
  800786: e8 85 03 00 00               	callq	0x800b10 <printfmt>
; 			break;
  80078b: e9 70 03 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800790: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800794: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80079b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80079e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  8007a4: 83 f8 28                     	cmpl	$40, %eax
  8007a7: 0f 87 25 00 00 00            	ja	0x8007d2 <vprintfmt+0x3a2>
  8007ad: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8007b4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007ba: 48 63 c2                     	movslq	%edx, %rax
  8007bd: 48 03 41 10                  	addq	16(%rcx), %rax
  8007c1: 83 c2 08                     	addl	$8, %edx
  8007c4: 89 11                        	movl	%edx, (%rcx)
  8007c6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007cd: e9 1d 00 00 00               	jmp	0x8007ef <vprintfmt+0x3bf>
  8007d2: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007d9: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8007dd: 48 89 d0                     	movq	%rdx, %rax
  8007e0: 48 83 c2 08                  	addq	$8, %rdx
  8007e4: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8007e8: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007ef: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007f6: 48 8b 00                     	movq	(%rax), %rax
  8007f9: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8007fd: 48 83 f8 00                  	cmpq	$0, %rax
  800801: 0f 85 0b 00 00 00            	jne	0x800812 <vprintfmt+0x3e2>
; 				p = "(null)";
  800807: 48 8d 05 a9 18 00 00         	leaq	6313(%rip), %rax        # 0x8020b7 <syscall.c+0x8020b7>
  80080e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800812: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800816: 0f 8e 4f 00 00 00            	jle	0x80086b <vprintfmt+0x43b>
  80081c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800820: 83 f8 2d                     	cmpl	$45, %eax
  800823: 0f 84 42 00 00 00            	je	0x80086b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800829: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80082d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800831: e8 da 07 00 00               	callq	0x801010 <strnlen>
  800836: 89 c1                        	movl	%eax, %ecx
  800838: 8b 45 9c                     	movl	-100(%rbp), %eax
  80083b: 29 c8                        	subl	%ecx, %eax
  80083d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800840: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800844: 0f 8e 1c 00 00 00            	jle	0x800866 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80084a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80084e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800852: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800856: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800858: 8b 45 9c                     	movl	-100(%rbp), %eax
  80085b: 83 c0 ff                     	addl	$-1, %eax
  80085e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800861: e9 da ff ff ff               	jmp	0x800840 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800866: e9 00 00 00 00               	jmp	0x80086b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80086b: e9 00 00 00 00               	jmp	0x800870 <vprintfmt+0x440>
  800870: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800874: 48 89 c1                     	movq	%rax, %rcx
  800877: 48 83 c1 01                  	addq	$1, %rcx
  80087b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80087f: 0f be 08                     	movsbl	(%rax), %ecx
  800882: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800885: 31 c0                        	xorl	%eax, %eax
  800887: 83 f9 00                     	cmpl	$0, %ecx
  80088a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800890: 0f 84 33 00 00 00            	je	0x8008c9 <vprintfmt+0x499>
  800896: b0 01                        	movb	$1, %al
  800898: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80089c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008a2: 0f 8c 15 00 00 00            	jl	0x8008bd <vprintfmt+0x48d>
  8008a8: 8b 45 98                     	movl	-104(%rbp), %eax
  8008ab: 83 c0 ff                     	addl	$-1, %eax
  8008ae: 89 45 98                     	movl	%eax, -104(%rbp)
  8008b1: 83 f8 00                     	cmpl	$0, %eax
  8008b4: 0f 9d c0                     	setge	%al
  8008b7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008bd: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8008c3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008c9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008cf: a8 01                        	testb	$1, %al
  8008d1: 0f 85 05 00 00 00            	jne	0x8008dc <vprintfmt+0x4ac>
  8008d7: e9 52 00 00 00               	jmp	0x80092e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008dc: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  8008e0: 0f 84 28 00 00 00            	je	0x80090e <vprintfmt+0x4de>
  8008e6: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  8008ea: 0f 8c 0a 00 00 00            	jl	0x8008fa <vprintfmt+0x4ca>
  8008f0: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  8008f4: 0f 8e 14 00 00 00            	jle	0x80090e <vprintfmt+0x4de>
; 					putch('?', putdat);
  8008fa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008fe: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800902: bf 3f 00 00 00               	movl	$63, %edi
  800907: ff d0                        	callq	*%rax
  800909: e9 0d 00 00 00               	jmp	0x80091b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80090e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800912: 8b 7d b4                     	movl	-76(%rbp), %edi
  800915: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800919: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80091b: e9 00 00 00 00               	jmp	0x800920 <vprintfmt+0x4f0>
; 					width--)
  800920: 8b 45 9c                     	movl	-100(%rbp), %eax
  800923: 83 c0 ff                     	addl	$-1, %eax
  800926: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800929: e9 42 ff ff ff               	jmp	0x800870 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80092e: e9 00 00 00 00               	jmp	0x800933 <vprintfmt+0x503>
  800933: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800937: 0f 8e 1d 00 00 00            	jle	0x80095a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80093d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800941: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800945: bf 20 00 00 00               	movl	$32, %edi
  80094a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80094c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80094f: 83 c0 ff                     	addl	$-1, %eax
  800952: 89 45 9c                     	movl	%eax, -100(%rbp)
  800955: e9 d9 ff ff ff               	jmp	0x800933 <vprintfmt+0x503>
; 			break;
  80095a: e9 a1 01 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80095f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800962: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800966: e8 05 02 00 00               	callq	0x800b70 <getint>
  80096b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80096f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800974: 0f 8d 19 00 00 00            	jge	0x800993 <vprintfmt+0x563>
; 				putch('-', putdat);
  80097a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80097e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800982: bf 2d 00 00 00               	movl	$45, %edi
  800987: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800989: 31 c0                        	xorl	%eax, %eax
  80098b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80098f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800993: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80099a: e9 e6 00 00 00               	jmp	0x800a85 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80099f: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009a2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009a6: e8 f5 02 00 00               	callq	0x800ca0 <getuint>
  8009ab: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009af: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009b6: e9 ca 00 00 00               	jmp	0x800a85 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009bb: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009be: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009c2: e8 d9 02 00 00               	callq	0x800ca0 <getuint>
  8009c7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8009cb: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  8009d2: e9 ae 00 00 00               	jmp	0x800a85 <vprintfmt+0x655>
; 			putch('0', putdat);
  8009d7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009db: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009df: bf 30 00 00 00               	movl	$48, %edi
  8009e4: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  8009e6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009ea: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009ee: bf 78 00 00 00               	movl	$120, %edi
  8009f3: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  8009f5: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8009f9: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800a00: 8b 45 c0                     	movl	-64(%rbp), %eax
  800a03: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800a09: 83 f8 28                     	cmpl	$40, %eax
  800a0c: 0f 87 25 00 00 00            	ja	0x800a37 <vprintfmt+0x607>
  800a12: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800a19: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  800a1f: 48 63 c2                     	movslq	%edx, %rax
  800a22: 48 03 41 10                  	addq	16(%rcx), %rax
  800a26: 83 c2 08                     	addl	$8, %edx
  800a29: 89 11                        	movl	%edx, (%rcx)
  800a2b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a32: e9 1d 00 00 00               	jmp	0x800a54 <vprintfmt+0x624>
  800a37: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  800a3e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a42: 48 89 d0                     	movq	%rdx, %rax
  800a45: 48 83 c2 08                  	addq	$8, %rdx
  800a49: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a4d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a54: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  800a5b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  800a5e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a62: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a69: e9 17 00 00 00               	jmp	0x800a85 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a6e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a71: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a75: e8 26 02 00 00               	callq	0x800ca0 <getuint>
  800a7a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a7e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800a85: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a89: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a8d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800a91: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800a94: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800a98: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800a9d: e8 2e 03 00 00               	callq	0x800dd0 <printnum>
; 			break;
  800aa2: e9 59 00 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800aa7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800aab: 8b 7d b4                     	movl	-76(%rbp), %edi
  800aae: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ab2: ff d0                        	callq	*%rax
; 			break;
  800ab4: e9 47 00 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800ab9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800abd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ac1: bf 25 00 00 00               	movl	$37, %edi
  800ac6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800ac8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800acc: 48 83 c0 ff                  	addq	$-1, %rax
  800ad0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800ad4: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ad8: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800adc: 83 f8 25                     	cmpl	$37, %eax
  800adf: 0f 84 16 00 00 00            	je	0x800afb <vprintfmt+0x6cb>
  800ae5: e9 00 00 00 00               	jmp	0x800aea <vprintfmt+0x6ba>
  800aea: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800aee: 48 83 c0 ff                  	addq	$-1, %rax
  800af2: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800af6: e9 d9 ff ff ff               	jmp	0x800ad4 <vprintfmt+0x6a4>
; 			break;
  800afb: e9 00 00 00 00               	jmp	0x800b00 <vprintfmt+0x6d0>
; 	while (1) {
  800b00: e9 64 f9 ff ff               	jmp	0x800469 <vprintfmt+0x39>
  800b05: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b0f: 90                           	nop

0000000000800b10 <printfmt>:
; {
  800b10: 55                           	pushq	%rbp
  800b11: 48 89 e5                     	movq	%rsp, %rbp
  800b14: 48 83 ec 60                  	subq	$96, %rsp
  800b18: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800b1c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800b20: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800b24: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800b28: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800b2c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800b30: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800b34: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b38: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800b3c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b40: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800b47: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800b4e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800b52: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800b56: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800b5a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800b5e: e8 cd f8 ff ff               	callq	0x800430 <vprintfmt>
; }
  800b63: 48 83 c4 60                  	addq	$96, %rsp
  800b67: 5d                           	popq	%rbp
  800b68: c3                           	retq
  800b69: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b70 <getint>:
; {
  800b70: 55                           	pushq	%rbp
  800b71: 48 89 e5                     	movq	%rsp, %rbp
  800b74: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b78: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b7b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b7f: 0f 8c 59 00 00 00            	jl	0x800bde <getint+0x6e>
; 		return va_arg(*ap, long long);
  800b85: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b89: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b8d: 8b 00                        	movl	(%rax), %eax
  800b8f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800b92: 83 f8 28                     	cmpl	$40, %eax
  800b95: 0f 87 1c 00 00 00            	ja	0x800bb7 <getint+0x47>
  800b9b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800b9f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800ba2: 48 63 c2                     	movslq	%edx, %rax
  800ba5: 48 03 41 10                  	addq	16(%rcx), %rax
  800ba9: 83 c2 08                     	addl	$8, %edx
  800bac: 89 11                        	movl	%edx, (%rcx)
  800bae: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bb2: e9 17 00 00 00               	jmp	0x800bce <getint+0x5e>
  800bb7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800bbb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bbf: 48 89 d0                     	movq	%rdx, %rax
  800bc2: 48 83 c2 08                  	addq	$8, %rdx
  800bc6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bca: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bce: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800bd2: 48 8b 00                     	movq	(%rax), %rax
  800bd5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bd9: e9 b7 00 00 00               	jmp	0x800c95 <getint+0x125>
; 	else if (lflag)
  800bde: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800be2: 0f 84 59 00 00 00            	je	0x800c41 <getint+0xd1>
; 		return va_arg(*ap, long);
  800be8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bec: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800bf0: 8b 00                        	movl	(%rax), %eax
  800bf2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800bf5: 83 f8 28                     	cmpl	$40, %eax
  800bf8: 0f 87 1c 00 00 00            	ja	0x800c1a <getint+0xaa>
  800bfe: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800c02: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800c05: 48 63 c2                     	movslq	%edx, %rax
  800c08: 48 03 41 10                  	addq	16(%rcx), %rax
  800c0c: 83 c2 08                     	addl	$8, %edx
  800c0f: 89 11                        	movl	%edx, (%rcx)
  800c11: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c15: e9 17 00 00 00               	jmp	0x800c31 <getint+0xc1>
  800c1a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800c1e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c22: 48 89 d0                     	movq	%rdx, %rax
  800c25: 48 83 c2 08                  	addq	$8, %rdx
  800c29: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c2d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c31: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800c35: 48 8b 00                     	movq	(%rax), %rax
  800c38: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c3c: e9 54 00 00 00               	jmp	0x800c95 <getint+0x125>
; 		return va_arg(*ap, int);
  800c41: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c45: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c49: 8b 00                        	movl	(%rax), %eax
  800c4b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c4e: 83 f8 28                     	cmpl	$40, %eax
  800c51: 0f 87 1c 00 00 00            	ja	0x800c73 <getint+0x103>
  800c57: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c5b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800c5e: 48 63 c2                     	movslq	%edx, %rax
  800c61: 48 03 41 10                  	addq	16(%rcx), %rax
  800c65: 83 c2 08                     	addl	$8, %edx
  800c68: 89 11                        	movl	%edx, (%rcx)
  800c6a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c6e: e9 17 00 00 00               	jmp	0x800c8a <getint+0x11a>
  800c73: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c77: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c7b: 48 89 d0                     	movq	%rdx, %rax
  800c7e: 48 83 c2 08                  	addq	$8, %rdx
  800c82: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c86: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c8a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800c8e: 48 63 00                     	movslq	(%rax), %rax
  800c91: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800c95: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c99: 5d                           	popq	%rbp
  800c9a: c3                           	retq
  800c9b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800ca0 <getuint>:
; {
  800ca0: 55                           	pushq	%rbp
  800ca1: 48 89 e5                     	movq	%rsp, %rbp
  800ca4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800ca8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800cab: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800caf: 0f 8c 59 00 00 00            	jl	0x800d0e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800cb5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cb9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800cbd: 8b 00                        	movl	(%rax), %eax
  800cbf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800cc2: 83 f8 28                     	cmpl	$40, %eax
  800cc5: 0f 87 1c 00 00 00            	ja	0x800ce7 <getuint+0x47>
  800ccb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800ccf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800cd2: 48 63 c2                     	movslq	%edx, %rax
  800cd5: 48 03 41 10                  	addq	16(%rcx), %rax
  800cd9: 83 c2 08                     	addl	$8, %edx
  800cdc: 89 11                        	movl	%edx, (%rcx)
  800cde: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800ce2: e9 17 00 00 00               	jmp	0x800cfe <getuint+0x5e>
  800ce7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800ceb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800cef: 48 89 d0                     	movq	%rdx, %rax
  800cf2: 48 83 c2 08                  	addq	$8, %rdx
  800cf6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800cfa: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800cfe: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800d02: 48 8b 00                     	movq	(%rax), %rax
  800d05: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d09: e9 b6 00 00 00               	jmp	0x800dc4 <getuint+0x124>
; 	else if (lflag)
  800d0e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800d12: 0f 84 59 00 00 00            	je	0x800d71 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800d18: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d1c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d20: 8b 00                        	movl	(%rax), %eax
  800d22: 89 45 d4                     	movl	%eax, -44(%rbp)
  800d25: 83 f8 28                     	cmpl	$40, %eax
  800d28: 0f 87 1c 00 00 00            	ja	0x800d4a <getuint+0xaa>
  800d2e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800d32: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800d35: 48 63 c2                     	movslq	%edx, %rax
  800d38: 48 03 41 10                  	addq	16(%rcx), %rax
  800d3c: 83 c2 08                     	addl	$8, %edx
  800d3f: 89 11                        	movl	%edx, (%rcx)
  800d41: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d45: e9 17 00 00 00               	jmp	0x800d61 <getuint+0xc1>
  800d4a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800d4e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d52: 48 89 d0                     	movq	%rdx, %rax
  800d55: 48 83 c2 08                  	addq	$8, %rdx
  800d59: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d5d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d61: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d65: 48 8b 00                     	movq	(%rax), %rax
  800d68: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d6c: e9 53 00 00 00               	jmp	0x800dc4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d71: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d75: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d79: 8b 00                        	movl	(%rax), %eax
  800d7b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d7e: 83 f8 28                     	cmpl	$40, %eax
  800d81: 0f 87 1c 00 00 00            	ja	0x800da3 <getuint+0x103>
  800d87: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800d8b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800d8e: 48 63 c2                     	movslq	%edx, %rax
  800d91: 48 03 41 10                  	addq	16(%rcx), %rax
  800d95: 83 c2 08                     	addl	$8, %edx
  800d98: 89 11                        	movl	%edx, (%rcx)
  800d9a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d9e: e9 17 00 00 00               	jmp	0x800dba <getuint+0x11a>
  800da3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800da7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800dab: 48 89 d0                     	movq	%rdx, %rax
  800dae: 48 83 c2 08                  	addq	$8, %rdx
  800db2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800db6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dba: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800dbe: 8b 00                        	movl	(%rax), %eax
  800dc0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800dc4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800dc8: 5d                           	popq	%rbp
  800dc9: c3                           	retq
  800dca: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800dd0 <printnum>:
; {
  800dd0: 55                           	pushq	%rbp
  800dd1: 48 89 e5                     	movq	%rsp, %rbp
  800dd4: 48 83 ec 30                  	subq	$48, %rsp
  800dd8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800ddc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800de0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800de4: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800de7: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800deb: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800def: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800df3: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800df6: 48 39 c8                     	cmpq	%rcx, %rax
  800df9: 0f 82 30 00 00 00            	jb	0x800e2f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800dff: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800e03: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e07: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e0b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e0e: 31 d2                        	xorl	%edx, %edx
  800e10: 48 f7 f1                     	divq	%rcx
  800e13: 48 89 c2                     	movq	%rax, %rdx
  800e16: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e19: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800e1d: 41 83 e8 01                  	subl	$1, %r8d
  800e21: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800e25: e8 a6 ff ff ff               	callq	0x800dd0 <printnum>
; 	} else {
  800e2a: e9 2e 00 00 00               	jmp	0x800e5d <printnum+0x8d>
; 		while (--width > 0)
  800e2f: e9 00 00 00 00               	jmp	0x800e34 <printnum+0x64>
  800e34: 8b 45 e0                     	movl	-32(%rbp), %eax
  800e37: 83 c0 ff                     	addl	$-1, %eax
  800e3a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800e3d: 83 f8 00                     	cmpl	$0, %eax
  800e40: 0f 8e 12 00 00 00            	jle	0x800e58 <printnum+0x88>
; 			putch(padc, putdat);
  800e46: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e4a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800e4d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e51: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800e53: e9 dc ff ff ff               	jmp	0x800e34 <printnum+0x64>
  800e58: e9 00 00 00 00               	jmp	0x800e5d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800e5d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e61: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e65: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e69: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e6c: 31 d2                        	xorl	%edx, %edx
  800e6e: 48 f7 f1                     	divq	%rcx
  800e71: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e75: 48 8d 0d 28 12 00 00         	leaq	4648(%rip), %rcx        # 0x8020a4 <syscall.c+0x8020a4>
  800e7c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800e80: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e84: ff d0                        	callq	*%rax
; }
  800e86: 48 83 c4 30                  	addq	$48, %rsp
  800e8a: 5d                           	popq	%rbp
  800e8b: c3                           	retq
  800e8c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800e90 <vsnprintf>:
; {
  800e90: 55                           	pushq	%rbp
  800e91: 48 89 e5                     	movq	%rsp, %rbp
  800e94: 48 83 ec 40                  	subq	$64, %rsp
  800e98: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800e9c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800e9f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800ea3: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800ea7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800eab: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800eaf: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800eb3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800eb7: 48 01 c8                     	addq	%rcx, %rax
  800eba: 48 83 c0 ff                  	addq	$-1, %rax
  800ebe: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800ec2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800ec9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800ece: 0f 84 0a 00 00 00            	je	0x800ede <vsnprintf+0x4e>
  800ed4: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800ed8: 0f 8d 0c 00 00 00            	jge	0x800eea <vsnprintf+0x5a>
; 		return -EINVAL;
  800ede: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800ee5: e9 25 00 00 00               	jmp	0x800f0f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800eea: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800eee: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800ef2: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800ef6: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800f20 <sprintputch>
  800efd: e8 2e f5 ff ff               	callq	0x800430 <vprintfmt>
; 	*b.buf = '\0';
  800f02: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800f06: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800f09: 8b 45 d0                     	movl	-48(%rbp), %eax
  800f0c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800f0f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f12: 48 83 c4 40                  	addq	$64, %rsp
  800f16: 5d                           	popq	%rbp
  800f17: c3                           	retq
  800f18: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800f20 <sprintputch>:
; {
  800f20: 55                           	pushq	%rbp
  800f21: 48 89 e5                     	movq	%rsp, %rbp
  800f24: 89 7d fc                     	movl	%edi, -4(%rbp)
  800f27: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800f2b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f2f: 8b 48 10                     	movl	16(%rax), %ecx
  800f32: 83 c1 01                     	addl	$1, %ecx
  800f35: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800f38: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f3c: 48 8b 00                     	movq	(%rax), %rax
  800f3f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800f43: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800f47: 0f 83 18 00 00 00            	jae	0x800f65 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800f4d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f50: 88 c1                        	movb	%al, %cl
  800f52: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800f56: 48 8b 02                     	movq	(%rdx), %rax
  800f59: 48 89 c6                     	movq	%rax, %rsi
  800f5c: 48 83 c6 01                  	addq	$1, %rsi
  800f60: 48 89 32                     	movq	%rsi, (%rdx)
  800f63: 88 08                        	movb	%cl, (%rax)
; }
  800f65: 5d                           	popq	%rbp
  800f66: c3                           	retq
  800f67: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f70 <snprintf>:
; {
  800f70: 55                           	pushq	%rbp
  800f71: 48 89 e5                     	movq	%rsp, %rbp
  800f74: 48 83 ec 70                  	subq	$112, %rsp
  800f78: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f7c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800f80: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800f84: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f88: 89 75 f4                     	movl	%esi, -12(%rbp)
  800f8b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800f8f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800f93: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800f97: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800f9b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800f9f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800fa6: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800fad: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fb1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800fb4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800fb8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800fbc: e8 cf fe ff ff               	callq	0x800e90 <vsnprintf>
  800fc1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800fc4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800fc7: 48 83 c4 70                  	addq	$112, %rsp
  800fcb: 5d                           	popq	%rbp
  800fcc: c3                           	retq
  800fcd: cc                           	int3
  800fce: cc                           	int3
  800fcf: cc                           	int3

0000000000800fd0 <strlen>:
; {
  800fd0: 55                           	pushq	%rbp
  800fd1: 48 89 e5                     	movq	%rsp, %rbp
  800fd4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800fd8: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800fdf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fe3: 0f be 00                     	movsbl	(%rax), %eax
  800fe6: 83 f8 00                     	cmpl	$0, %eax
  800fe9: 0f 84 1a 00 00 00            	je	0x801009 <strlen+0x39>
; 		n++;
  800fef: 8b 45 f4                     	movl	-12(%rbp), %eax
  800ff2: 83 c0 01                     	addl	$1, %eax
  800ff5: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800ff8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ffc: 48 83 c0 01                  	addq	$1, %rax
  801000: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801004: e9 d6 ff ff ff               	jmp	0x800fdf <strlen+0xf>
; 	return n;
  801009: 8b 45 f4                     	movl	-12(%rbp), %eax
  80100c: 5d                           	popq	%rbp
  80100d: c3                           	retq
  80100e: 66 90                        	nop

0000000000801010 <strnlen>:
; {
  801010: 55                           	pushq	%rbp
  801011: 48 89 e5                     	movq	%rsp, %rbp
  801014: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801018: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80101c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  801023: 31 c0                        	xorl	%eax, %eax
  801025: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  80102a: 88 45 eb                     	movb	%al, -21(%rbp)
  80102d: 0f 86 10 00 00 00            	jbe	0x801043 <strnlen+0x33>
  801033: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801037: 0f be 00                     	movsbl	(%rax), %eax
  80103a: 83 f8 00                     	cmpl	$0, %eax
  80103d: 0f 95 c0                     	setne	%al
  801040: 88 45 eb                     	movb	%al, -21(%rbp)
  801043: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  801046: a8 01                        	testb	$1, %al
  801048: 0f 85 05 00 00 00            	jne	0x801053 <strnlen+0x43>
  80104e: e9 26 00 00 00               	jmp	0x801079 <strnlen+0x69>
; 		n++;
  801053: 8b 45 ec                     	movl	-20(%rbp), %eax
  801056: 83 c0 01                     	addl	$1, %eax
  801059: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80105c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801060: 48 83 c0 01                  	addq	$1, %rax
  801064: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801068: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80106c: 48 83 c0 ff                  	addq	$-1, %rax
  801070: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801074: e9 aa ff ff ff               	jmp	0x801023 <strnlen+0x13>
; 	return n;
  801079: 8b 45 ec                     	movl	-20(%rbp), %eax
  80107c: 5d                           	popq	%rbp
  80107d: c3                           	retq
  80107e: 66 90                        	nop

0000000000801080 <strcpy>:
; {
  801080: 55                           	pushq	%rbp
  801081: 48 89 e5                     	movq	%rsp, %rbp
  801084: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801088: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  80108c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801090: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  801094: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801098: 48 89 c1                     	movq	%rax, %rcx
  80109b: 48 83 c1 01                  	addq	$1, %rcx
  80109f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8010a3: 8a 00                        	movb	(%rax), %al
  8010a5: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8010a9: 48 89 ca                     	movq	%rcx, %rdx
  8010ac: 48 83 c2 01                  	addq	$1, %rdx
  8010b0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010b4: 88 01                        	movb	%al, (%rcx)
  8010b6: 0f be c0                     	movsbl	%al, %eax
  8010b9: 83 f8 00                     	cmpl	$0, %eax
  8010bc: 0f 84 05 00 00 00            	je	0x8010c7 <strcpy+0x47>
  8010c2: e9 cd ff ff ff               	jmp	0x801094 <strcpy+0x14>
; 	return ret;
  8010c7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8010cb: 5d                           	popq	%rbp
  8010cc: c3                           	retq
  8010cd: 0f 1f 00                     	nopl	(%rax)

00000000008010d0 <strcat>:
; {
  8010d0: 55                           	pushq	%rbp
  8010d1: 48 89 e5                     	movq	%rsp, %rbp
  8010d4: 48 83 ec 20                  	subq	$32, %rsp
  8010d8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010dc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  8010e0: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8010e4: e8 e7 fe ff ff               	callq	0x800fd0 <strlen>
  8010e9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  8010ec: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8010f0: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  8010f4: 48 01 c7                     	addq	%rax, %rdi
  8010f7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8010fb: e8 80 ff ff ff               	callq	0x801080 <strcpy>
; 	return dst;
  801100: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801104: 48 83 c4 20                  	addq	$32, %rsp
  801108: 5d                           	popq	%rbp
  801109: c3                           	retq
  80110a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000801110 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  801110: 55                           	pushq	%rbp
  801111: 48 89 e5                     	movq	%rsp, %rbp
  801114: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801118: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80111c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  801120: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801124: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  801128: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  801130: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801134: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  801138: 0f 83 49 00 00 00            	jae	0x801187 <strncpy+0x77>
; 		*dst++ = *src;
  80113e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801142: 8a 08                        	movb	(%rax), %cl
  801144: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801148: 48 89 c2                     	movq	%rax, %rdx
  80114b: 48 83 c2 01                  	addq	$1, %rdx
  80114f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801153: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801155: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801159: 0f be 00                     	movsbl	(%rax), %eax
  80115c: 83 f8 00                     	cmpl	$0, %eax
  80115f: 0f 84 0c 00 00 00            	je	0x801171 <strncpy+0x61>
; 			src++;
  801165: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801169: 48 83 c0 01                  	addq	$1, %rax
  80116d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801171: e9 00 00 00 00               	jmp	0x801176 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801176: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80117a: 48 83 c0 01                  	addq	$1, %rax
  80117e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801182: e9 a9 ff ff ff               	jmp	0x801130 <strncpy+0x20>
; 	return ret;
  801187: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80118b: 5d                           	popq	%rbp
  80118c: c3                           	retq
  80118d: 0f 1f 00                     	nopl	(%rax)

0000000000801190 <strlcpy>:
; {
  801190: 55                           	pushq	%rbp
  801191: 48 89 e5                     	movq	%rsp, %rbp
  801194: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801198: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80119c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  8011a0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011a4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  8011a8: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  8011ad: 0f 86 6e 00 00 00            	jbe	0x801221 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  8011b3: e9 00 00 00 00               	jmp	0x8011b8 <strlcpy+0x28>
  8011b8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011bc: 48 83 c1 ff                  	addq	$-1, %rcx
  8011c0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8011c4: 31 c0                        	xorl	%eax, %eax
  8011c6: 48 83 f9 00                  	cmpq	$0, %rcx
  8011ca: 88 45 df                     	movb	%al, -33(%rbp)
  8011cd: 0f 86 10 00 00 00            	jbe	0x8011e3 <strlcpy+0x53>
  8011d3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011d7: 0f be 00                     	movsbl	(%rax), %eax
  8011da: 83 f8 00                     	cmpl	$0, %eax
  8011dd: 0f 95 c0                     	setne	%al
  8011e0: 88 45 df                     	movb	%al, -33(%rbp)
  8011e3: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  8011e6: a8 01                        	testb	$1, %al
  8011e8: 0f 85 05 00 00 00            	jne	0x8011f3 <strlcpy+0x63>
  8011ee: e9 27 00 00 00               	jmp	0x80121a <strlcpy+0x8a>
; 			*dst++ = *src++;
  8011f3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011f7: 48 89 c1                     	movq	%rax, %rcx
  8011fa: 48 83 c1 01                  	addq	$1, %rcx
  8011fe: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801202: 8a 08                        	movb	(%rax), %cl
  801204: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801208: 48 89 c2                     	movq	%rax, %rdx
  80120b: 48 83 c2 01                  	addq	$1, %rdx
  80120f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801213: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801215: e9 9e ff ff ff               	jmp	0x8011b8 <strlcpy+0x28>
; 		*dst = '\0';
  80121a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80121e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801221: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801225: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801229: 48 29 c8                     	subq	%rcx, %rax
  80122c: 5d                           	popq	%rbp
  80122d: c3                           	retq
  80122e: 66 90                        	nop

0000000000801230 <strcmp>:
; {
  801230: 55                           	pushq	%rbp
  801231: 48 89 e5                     	movq	%rsp, %rbp
  801234: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801238: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80123c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801240: 0f be 08                     	movsbl	(%rax), %ecx
  801243: 31 c0                        	xorl	%eax, %eax
  801245: 83 f9 00                     	cmpl	$0, %ecx
  801248: 88 45 ef                     	movb	%al, -17(%rbp)
  80124b: 0f 84 16 00 00 00            	je	0x801267 <strcmp+0x37>
  801251: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801255: 0f be 00                     	movsbl	(%rax), %eax
  801258: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80125c: 0f be 09                     	movsbl	(%rcx), %ecx
  80125f: 39 c8                        	cmpl	%ecx, %eax
  801261: 0f 94 c0                     	sete	%al
  801264: 88 45 ef                     	movb	%al, -17(%rbp)
  801267: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80126a: a8 01                        	testb	$1, %al
  80126c: 0f 85 05 00 00 00            	jne	0x801277 <strcmp+0x47>
  801272: e9 1d 00 00 00               	jmp	0x801294 <strcmp+0x64>
; 		p++, q++;
  801277: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80127b: 48 83 c0 01                  	addq	$1, %rax
  80127f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801283: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801287: 48 83 c0 01                  	addq	$1, %rax
  80128b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80128f: e9 a8 ff ff ff               	jmp	0x80123c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801294: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801298: 0f b6 00                     	movzbl	(%rax), %eax
  80129b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80129f: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012a2: 29 c8                        	subl	%ecx, %eax
  8012a4: 5d                           	popq	%rbp
  8012a5: c3                           	retq
  8012a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008012b0 <strncmp>:
; {
  8012b0: 55                           	pushq	%rbp
  8012b1: 48 89 e5                     	movq	%rsp, %rbp
  8012b4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012b8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8012bc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012c0: 31 c0                        	xorl	%eax, %eax
  8012c2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012c7: 88 45 df                     	movb	%al, -33(%rbp)
  8012ca: 0f 86 2b 00 00 00            	jbe	0x8012fb <strncmp+0x4b>
  8012d0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012d4: 0f be 08                     	movsbl	(%rax), %ecx
  8012d7: 31 c0                        	xorl	%eax, %eax
  8012d9: 83 f9 00                     	cmpl	$0, %ecx
  8012dc: 88 45 df                     	movb	%al, -33(%rbp)
  8012df: 0f 84 16 00 00 00            	je	0x8012fb <strncmp+0x4b>
  8012e5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012e9: 0f be 00                     	movsbl	(%rax), %eax
  8012ec: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8012f0: 0f be 09                     	movsbl	(%rcx), %ecx
  8012f3: 39 c8                        	cmpl	%ecx, %eax
  8012f5: 0f 94 c0                     	sete	%al
  8012f8: 88 45 df                     	movb	%al, -33(%rbp)
  8012fb: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  8012fe: a8 01                        	testb	$1, %al
  801300: 0f 85 05 00 00 00            	jne	0x80130b <strncmp+0x5b>
  801306: e9 29 00 00 00               	jmp	0x801334 <strncmp+0x84>
; 		n--, p++, q++;
  80130b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80130f: 48 83 c0 ff                  	addq	$-1, %rax
  801313: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801317: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80131b: 48 83 c0 01                  	addq	$1, %rax
  80131f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801323: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801327: 48 83 c0 01                  	addq	$1, %rax
  80132b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80132f: e9 8c ff ff ff               	jmp	0x8012c0 <strncmp+0x10>
; 	if (n == 0)
  801334: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801339: 0f 85 0c 00 00 00            	jne	0x80134b <strncmp+0x9b>
; 		return 0;
  80133f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801346: e9 13 00 00 00               	jmp	0x80135e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80134b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80134f: 0f b6 00                     	movzbl	(%rax), %eax
  801352: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801356: 0f b6 09                     	movzbl	(%rcx), %ecx
  801359: 29 c8                        	subl	%ecx, %eax
  80135b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80135e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801361: 5d                           	popq	%rbp
  801362: c3                           	retq
  801363: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80136d: 0f 1f 00                     	nopl	(%rax)

0000000000801370 <strchr>:
; {
  801370: 55                           	pushq	%rbp
  801371: 48 89 e5                     	movq	%rsp, %rbp
  801374: 40 88 f0                     	movb	%sil, %al
  801377: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80137b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80137e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801382: 80 38 00                     	cmpb	$0, (%rax)
  801385: 0f 84 36 00 00 00            	je	0x8013c1 <strchr+0x51>
; 		if (*s == c)
  80138b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80138f: 0f be 00                     	movsbl	(%rax), %eax
  801392: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801396: 39 c8                        	cmpl	%ecx, %eax
  801398: 0f 85 0d 00 00 00            	jne	0x8013ab <strchr+0x3b>
; 			return (char *) s;
  80139e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013a2: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013a6: e9 1e 00 00 00               	jmp	0x8013c9 <strchr+0x59>
; 		if (*s == c)
  8013ab: e9 00 00 00 00               	jmp	0x8013b0 <strchr+0x40>
; 	for (; *s; s++)
  8013b0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013b4: 48 83 c0 01                  	addq	$1, %rax
  8013b8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8013bc: e9 bd ff ff ff               	jmp	0x80137e <strchr+0xe>
; 	return 0;
  8013c1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8013c9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013cd: 5d                           	popq	%rbp
  8013ce: c3                           	retq
  8013cf: 90                           	nop

00000000008013d0 <strfind>:
; {
  8013d0: 55                           	pushq	%rbp
  8013d1: 48 89 e5                     	movq	%rsp, %rbp
  8013d4: 40 88 f0                     	movb	%sil, %al
  8013d7: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8013db: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  8013de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013e2: 80 38 00                     	cmpb	$0, (%rax)
  8013e5: 0f 84 2e 00 00 00            	je	0x801419 <strfind+0x49>
; 		if (*s == c)
  8013eb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013ef: 0f be 00                     	movsbl	(%rax), %eax
  8013f2: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  8013f6: 39 c8                        	cmpl	%ecx, %eax
  8013f8: 0f 85 05 00 00 00            	jne	0x801403 <strfind+0x33>
; 			break;
  8013fe: e9 16 00 00 00               	jmp	0x801419 <strfind+0x49>
; 		if (*s == c)
  801403: e9 00 00 00 00               	jmp	0x801408 <strfind+0x38>
; 	for (; *s; s++)
  801408: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80140c: 48 83 c0 01                  	addq	$1, %rax
  801410: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801414: e9 c5 ff ff ff               	jmp	0x8013de <strfind+0xe>
; 	return (char *) s;
  801419: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80141d: 5d                           	popq	%rbp
  80141e: c3                           	retq
  80141f: 90                           	nop

0000000000801420 <memset>:
; {
  801420: 55                           	pushq	%rbp
  801421: 48 89 e5                     	movq	%rsp, %rbp
  801424: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801428: 89 75 ec                     	movl	%esi, -20(%rbp)
  80142b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80142f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801434: 0f 85 0d 00 00 00            	jne	0x801447 <memset+0x27>
; 		return v;
  80143a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80143e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801442: e9 78 00 00 00               	jmp	0x8014bf <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801447: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80144b: 48 83 e0 03                  	andq	$3, %rax
  80144f: 48 83 f8 00                  	cmpq	$0, %rax
  801453: 0f 85 50 00 00 00            	jne	0x8014a9 <memset+0x89>
  801459: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80145d: 48 83 e0 03                  	andq	$3, %rax
  801461: 48 83 f8 00                  	cmpq	$0, %rax
  801465: 0f 85 3e 00 00 00            	jne	0x8014a9 <memset+0x89>
; 		c &= 0xFF;
  80146b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80146e: 25 ff 00 00 00               	andl	$255, %eax
  801473: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801476: 8b 45 ec                     	movl	-20(%rbp), %eax
  801479: c1 e0 18                     	shll	$24, %eax
  80147c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80147f: c1 e1 10                     	shll	$16, %ecx
  801482: 09 c8                        	orl	%ecx, %eax
  801484: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801487: c1 e1 08                     	shll	$8, %ecx
  80148a: 09 c8                        	orl	%ecx, %eax
  80148c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80148f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801492: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801496: 8b 45 ec                     	movl	-20(%rbp), %eax
  801499: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80149d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  8014a1: fc                           	cld
  8014a2: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  8014a4: e9 0e 00 00 00               	jmp	0x8014b7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  8014a9: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014ad: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014b0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8014b4: fc                           	cld
  8014b5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8014b7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014bb: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8014bf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014c3: 5d                           	popq	%rbp
  8014c4: c3                           	retq
  8014c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014cf: 90                           	nop

00000000008014d0 <memmove>:
; {
  8014d0: 55                           	pushq	%rbp
  8014d1: 48 89 e5                     	movq	%rsp, %rbp
  8014d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014d8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8014dc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  8014e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014e4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  8014e8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014ec: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  8014f0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014f4: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8014f8: 0f 83 9d 00 00 00            	jae	0x80159b <memmove+0xcb>
  8014fe: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801502: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801506: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80150a: 0f 86 8b 00 00 00            	jbe	0x80159b <memmove+0xcb>
; 		s += n;
  801510: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801514: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801518: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80151c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801520: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801524: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801528: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80152c: 48 83 e0 03                  	andq	$3, %rax
  801530: 48 83 f8 00                  	cmpq	$0, %rax
  801534: 0f 85 44 00 00 00            	jne	0x80157e <memmove+0xae>
  80153a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80153e: 48 83 e0 03                  	andq	$3, %rax
  801542: 48 83 f8 00                  	cmpq	$0, %rax
  801546: 0f 85 32 00 00 00            	jne	0x80157e <memmove+0xae>
  80154c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801550: 48 83 e0 03                  	andq	$3, %rax
  801554: 48 83 f8 00                  	cmpq	$0, %rax
  801558: 0f 85 20 00 00 00            	jne	0x80157e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80155e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801562: 48 83 c7 fc                  	addq	$-4, %rdi
  801566: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80156a: 48 83 c6 fc                  	addq	$-4, %rsi
  80156e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801572: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801576: fd                           	std
  801577: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801579: e9 17 00 00 00               	jmp	0x801595 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80157e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801582: 48 83 c7 ff                  	addq	$-1, %rdi
  801586: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80158a: 48 83 c6 ff                  	addq	$-1, %rsi
  80158e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801592: fd                           	std
  801593: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801595: fc                           	cld
; 	} else {
  801596: e9 62 00 00 00               	jmp	0x8015fd <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80159b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80159f: 48 83 e0 03                  	andq	$3, %rax
  8015a3: 48 83 f8 00                  	cmpq	$0, %rax
  8015a7: 0f 85 3c 00 00 00            	jne	0x8015e9 <memmove+0x119>
  8015ad: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8015b1: 48 83 e0 03                  	andq	$3, %rax
  8015b5: 48 83 f8 00                  	cmpq	$0, %rax
  8015b9: 0f 85 2a 00 00 00            	jne	0x8015e9 <memmove+0x119>
  8015bf: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015c3: 48 83 e0 03                  	andq	$3, %rax
  8015c7: 48 83 f8 00                  	cmpq	$0, %rax
  8015cb: 0f 85 18 00 00 00            	jne	0x8015e9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8015d1: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015d5: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015d9: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8015dd: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  8015e1: fc                           	cld
  8015e2: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8015e4: e9 0f 00 00 00               	jmp	0x8015f8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  8015e9: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015ed: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015f1: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  8015f5: fc                           	cld
  8015f6: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  8015f8: e9 00 00 00 00               	jmp	0x8015fd <memmove+0x12d>
; 	return dst;
  8015fd: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801601: 5d                           	popq	%rbp
  801602: c3                           	retq
  801603: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80160d: 0f 1f 00                     	nopl	(%rax)

0000000000801610 <memcpy>:
; {
  801610: 55                           	pushq	%rbp
  801611: 48 89 e5                     	movq	%rsp, %rbp
  801614: 48 83 ec 20                  	subq	$32, %rsp
  801618: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80161c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801620: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801624: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801628: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80162c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801630: e8 9b fe ff ff               	callq	0x8014d0 <memmove>
  801635: 48 83 c4 20                  	addq	$32, %rsp
  801639: 5d                           	popq	%rbp
  80163a: c3                           	retq
  80163b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801640 <memcmp>:
; {
  801640: 55                           	pushq	%rbp
  801641: 48 89 e5                     	movq	%rsp, %rbp
  801644: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801648: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80164c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801650: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801654: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801658: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80165c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801660: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801664: 48 89 c1                     	movq	%rax, %rcx
  801667: 48 83 c1 ff                  	addq	$-1, %rcx
  80166b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80166f: 48 83 f8 00                  	cmpq	$0, %rax
  801673: 0f 86 4b 00 00 00            	jbe	0x8016c4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801679: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80167d: 0f b6 00                     	movzbl	(%rax), %eax
  801680: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801684: 0f b6 09                     	movzbl	(%rcx), %ecx
  801687: 39 c8                        	cmpl	%ecx, %eax
  801689: 0f 84 18 00 00 00            	je	0x8016a7 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80168f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801693: 0f b6 00                     	movzbl	(%rax), %eax
  801696: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80169a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80169d: 29 c8                        	subl	%ecx, %eax
  80169f: 89 45 fc                     	movl	%eax, -4(%rbp)
  8016a2: e9 24 00 00 00               	jmp	0x8016cb <memcmp+0x8b>
; 		s1++, s2++;
  8016a7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016ab: 48 83 c0 01                  	addq	$1, %rax
  8016af: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8016b3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8016b7: 48 83 c0 01                  	addq	$1, %rax
  8016bb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8016bf: e9 9c ff ff ff               	jmp	0x801660 <memcmp+0x20>
; 	return 0;
  8016c4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8016cb: 8b 45 fc                     	movl	-4(%rbp), %eax
  8016ce: 5d                           	popq	%rbp
  8016cf: c3                           	retq

00000000008016d0 <memfind>:
; {
  8016d0: 55                           	pushq	%rbp
  8016d1: 48 89 e5                     	movq	%rsp, %rbp
  8016d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016d8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8016db: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  8016df: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016e3: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8016e7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  8016eb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016ef: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  8016f3: 0f 83 30 00 00 00            	jae	0x801729 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8016f9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016fd: 0f b6 00                     	movzbl	(%rax), %eax
  801700: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801703: 0f b6 c9                     	movzbl	%cl, %ecx
  801706: 39 c8                        	cmpl	%ecx, %eax
  801708: 0f 85 05 00 00 00            	jne	0x801713 <memfind+0x43>
; 			break;
  80170e: e9 16 00 00 00               	jmp	0x801729 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801713: e9 00 00 00 00               	jmp	0x801718 <memfind+0x48>
; 	for (; s < ends; s++)
  801718: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80171c: 48 83 c0 01                  	addq	$1, %rax
  801720: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801724: e9 c2 ff ff ff               	jmp	0x8016eb <memfind+0x1b>
; 	return (void *) s;
  801729: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80172d: 5d                           	popq	%rbp
  80172e: c3                           	retq
  80172f: 90                           	nop

0000000000801730 <strtol>:
; {
  801730: 55                           	pushq	%rbp
  801731: 48 89 e5                     	movq	%rsp, %rbp
  801734: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801738: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80173c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80173f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801746: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80174e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801752: 0f be 08                     	movsbl	(%rax), %ecx
  801755: b0 01                        	movb	$1, %al
  801757: 83 f9 20                     	cmpl	$32, %ecx
  80175a: 88 45 db                     	movb	%al, -37(%rbp)
  80175d: 0f 84 10 00 00 00            	je	0x801773 <strtol+0x43>
  801763: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801767: 0f be 00                     	movsbl	(%rax), %eax
  80176a: 83 f8 09                     	cmpl	$9, %eax
  80176d: 0f 94 c0                     	sete	%al
  801770: 88 45 db                     	movb	%al, -37(%rbp)
  801773: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801776: a8 01                        	testb	$1, %al
  801778: 0f 85 05 00 00 00            	jne	0x801783 <strtol+0x53>
  80177e: e9 11 00 00 00               	jmp	0x801794 <strtol+0x64>
; 		s++;
  801783: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801787: 48 83 c0 01                  	addq	$1, %rax
  80178b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80178f: e9 ba ff ff ff               	jmp	0x80174e <strtol+0x1e>
; 	if (*s == '+')
  801794: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801798: 0f be 00                     	movsbl	(%rax), %eax
  80179b: 83 f8 2b                     	cmpl	$43, %eax
  80179e: 0f 85 11 00 00 00            	jne	0x8017b5 <strtol+0x85>
; 		s++;
  8017a4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a8: 48 83 c0 01                  	addq	$1, %rax
  8017ac: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017b0: e9 28 00 00 00               	jmp	0x8017dd <strtol+0xad>
; 	else if (*s == '-')
  8017b5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b9: 0f be 00                     	movsbl	(%rax), %eax
  8017bc: 83 f8 2d                     	cmpl	$45, %eax
  8017bf: 0f 85 13 00 00 00            	jne	0x8017d8 <strtol+0xa8>
; 		s++, neg = 1;
  8017c5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017c9: 48 83 c0 01                  	addq	$1, %rax
  8017cd: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017d1: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  8017d8: e9 00 00 00 00               	jmp	0x8017dd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8017dd: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017e1: 0f 84 0a 00 00 00            	je	0x8017f1 <strtol+0xc1>
  8017e7: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  8017eb: 0f 85 39 00 00 00            	jne	0x80182a <strtol+0xfa>
  8017f1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017f5: 0f be 00                     	movsbl	(%rax), %eax
  8017f8: 83 f8 30                     	cmpl	$48, %eax
  8017fb: 0f 85 29 00 00 00            	jne	0x80182a <strtol+0xfa>
  801801: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801805: 0f be 40 01                  	movsbl	1(%rax), %eax
  801809: 83 f8 78                     	cmpl	$120, %eax
  80180c: 0f 85 18 00 00 00            	jne	0x80182a <strtol+0xfa>
; 		s += 2, base = 16;
  801812: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801816: 48 83 c0 02                  	addq	$2, %rax
  80181a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80181e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801825: e9 4d 00 00 00               	jmp	0x801877 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80182a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80182e: 0f 85 28 00 00 00            	jne	0x80185c <strtol+0x12c>
  801834: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801838: 0f be 00                     	movsbl	(%rax), %eax
  80183b: 83 f8 30                     	cmpl	$48, %eax
  80183e: 0f 85 18 00 00 00            	jne	0x80185c <strtol+0x12c>
; 		s++, base = 8;
  801844: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801848: 48 83 c0 01                  	addq	$1, %rax
  80184c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801850: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801857: e9 16 00 00 00               	jmp	0x801872 <strtol+0x142>
; 	else if (base == 0)
  80185c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801860: 0f 85 07 00 00 00            	jne	0x80186d <strtol+0x13d>
; 		base = 10;
  801866: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80186d: e9 00 00 00 00               	jmp	0x801872 <strtol+0x142>
  801872: e9 00 00 00 00               	jmp	0x801877 <strtol+0x147>
; 	while (1) {
  801877: e9 00 00 00 00               	jmp	0x80187c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80187c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801880: 0f be 00                     	movsbl	(%rax), %eax
  801883: 83 f8 30                     	cmpl	$48, %eax
  801886: 0f 8c 22 00 00 00            	jl	0x8018ae <strtol+0x17e>
  80188c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801890: 0f be 00                     	movsbl	(%rax), %eax
  801893: 83 f8 39                     	cmpl	$57, %eax
  801896: 0f 8f 12 00 00 00            	jg	0x8018ae <strtol+0x17e>
; 			dig = *s - '0';
  80189c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018a0: 0f be 00                     	movsbl	(%rax), %eax
  8018a3: 83 e8 30                     	subl	$48, %eax
  8018a6: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018a9: e9 79 00 00 00               	jmp	0x801927 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  8018ae: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018b2: 0f be 00                     	movsbl	(%rax), %eax
  8018b5: 83 f8 61                     	cmpl	$97, %eax
  8018b8: 0f 8c 25 00 00 00            	jl	0x8018e3 <strtol+0x1b3>
  8018be: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018c2: 0f be 00                     	movsbl	(%rax), %eax
  8018c5: 83 f8 7a                     	cmpl	$122, %eax
  8018c8: 0f 8f 15 00 00 00            	jg	0x8018e3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8018ce: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018d2: 0f be 00                     	movsbl	(%rax), %eax
  8018d5: 83 e8 61                     	subl	$97, %eax
  8018d8: 83 c0 0a                     	addl	$10, %eax
  8018db: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018de: e9 3f 00 00 00               	jmp	0x801922 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  8018e3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018e7: 0f be 00                     	movsbl	(%rax), %eax
  8018ea: 83 f8 41                     	cmpl	$65, %eax
  8018ed: 0f 8c 25 00 00 00            	jl	0x801918 <strtol+0x1e8>
  8018f3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018f7: 0f be 00                     	movsbl	(%rax), %eax
  8018fa: 83 f8 5a                     	cmpl	$90, %eax
  8018fd: 0f 8f 15 00 00 00            	jg	0x801918 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801903: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801907: 0f be 00                     	movsbl	(%rax), %eax
  80190a: 83 e8 41                     	subl	$65, %eax
  80190d: 83 c0 0a                     	addl	$10, %eax
  801910: 89 45 dc                     	movl	%eax, -36(%rbp)
  801913: e9 05 00 00 00               	jmp	0x80191d <strtol+0x1ed>
; 			break;
  801918: e9 43 00 00 00               	jmp	0x801960 <strtol+0x230>
  80191d: e9 00 00 00 00               	jmp	0x801922 <strtol+0x1f2>
  801922: e9 00 00 00 00               	jmp	0x801927 <strtol+0x1f7>
; 		if (dig >= base)
  801927: 8b 45 dc                     	movl	-36(%rbp), %eax
  80192a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80192d: 0f 8c 05 00 00 00            	jl	0x801938 <strtol+0x208>
; 			break;
  801933: e9 28 00 00 00               	jmp	0x801960 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801938: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80193c: 48 83 c0 01                  	addq	$1, %rax
  801940: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801944: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801948: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80194c: 48 0f af c1                  	imulq	%rcx, %rax
  801950: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801954: 48 01 c8                     	addq	%rcx, %rax
  801957: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80195b: e9 1c ff ff ff               	jmp	0x80187c <strtol+0x14c>
; 	if (endptr)
  801960: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801965: 0f 84 0b 00 00 00            	je	0x801976 <strtol+0x246>
; 		*endptr = (char *) s;
  80196b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80196f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801973: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801976: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80197a: 0f 84 0f 00 00 00            	je	0x80198f <strtol+0x25f>
  801980: 31 c0                        	xorl	%eax, %eax
  801982: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801986: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80198a: e9 08 00 00 00               	jmp	0x801997 <strtol+0x267>
  80198f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801993: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801997: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80199b: 5d                           	popq	%rbp
  80199c: c3                           	retq
