
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
  800042: e8 49 00 00 00               	callq	0x800090 <libmain>
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
  800054: 48 83 ec 20                  	subq	$32, %rsp
  800058: 89 7d fc                     	movl	%edi, -4(%rbp)
  80005b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	const char *s = "Hello, world!\n";
  80005f: 48 8d 05 f6 1f 00 00         	leaq	8182(%rip), %rax        # 0x80205c <syscall.c+0x80205c>
  800066: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	puts(s, 0x800000000000);
  80006a: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  80006e: 48 be 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rsi  # imm = 0x800000000000
  800078: e8 73 00 00 00               	callq	0x8000f0 <puts>
; }
  80007d: 31 c0                        	xorl	%eax, %eax
  80007f: 48 83 c4 20                  	addq	$32, %rsp
  800083: 5d                           	popq	%rbp
  800084: c3                           	retq
  800085: cc                           	int3
  800086: cc                           	int3
  800087: cc                           	int3
  800088: cc                           	int3
  800089: cc                           	int3
  80008a: cc                           	int3
  80008b: cc                           	int3
  80008c: cc                           	int3
  80008d: cc                           	int3
  80008e: cc                           	int3
  80008f: cc                           	int3

0000000000800090 <libmain>:
; {
  800090: 55                           	pushq	%rbp
  800091: 48 89 e5                     	movq	%rsp, %rbp
  800094: 48 83 ec 10                  	subq	$16, %rsp
  800098: 89 7d fc                     	movl	%edi, -4(%rbp)
  80009b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80009f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  8000a3: 0f 8e 11 00 00 00            	jle	0x8000ba <libmain+0x2a>
; 		binary_name = argv[0];
  8000a9: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8000ad: 48 8b 08                     	movq	(%rax), %rcx
  8000b0: 48 8d 05 49 2f 00 00         	leaq	12105(%rip), %rax       # 0x803000 <binary_name>
  8000b7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8000ba: 8b 7d fc                     	movl	-4(%rbp), %edi
  8000bd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8000c1: e8 8a ff ff ff               	callq	0x800050 <main>
; 	exit();
  8000c6: e8 15 00 00 00               	callq	0x8000e0 <exit>
; }
  8000cb: 48 83 c4 10                  	addq	$16, %rsp
  8000cf: 5d                           	popq	%rbp
  8000d0: c3                           	retq
  8000d1: cc                           	int3
  8000d2: cc                           	int3
  8000d3: cc                           	int3
  8000d4: cc                           	int3
  8000d5: cc                           	int3
  8000d6: cc                           	int3
  8000d7: cc                           	int3
  8000d8: cc                           	int3
  8000d9: cc                           	int3
  8000da: cc                           	int3
  8000db: cc                           	int3
  8000dc: cc                           	int3
  8000dd: cc                           	int3
  8000de: cc                           	int3
  8000df: cc                           	int3

00000000008000e0 <exit>:
; {
  8000e0: 55                           	pushq	%rbp
  8000e1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000e4: 31 ff                        	xorl	%edi, %edi
  8000e6: e8 15 01 00 00               	callq	0x800200 <kill>
; }
  8000eb: 5d                           	popq	%rbp
  8000ec: c3                           	retq
  8000ed: cc                           	int3
  8000ee: cc                           	int3
  8000ef: cc                           	int3

00000000008000f0 <puts>:
; {
  8000f0: 55                           	pushq	%rbp
  8000f1: 48 89 e5                     	movq	%rsp, %rbp
  8000f4: 48 83 ec 20                  	subq	$32, %rsp
  8000f8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000fc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800100: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800104: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800108: 31 f6                        	xorl	%esi, %esi
  80010a: 31 c0                        	xorl	%eax, %eax
  80010c: 41 89 c1                     	movl	%eax, %r9d
  80010f: 89 f7                        	movl	%esi, %edi
  800111: 4d 89 c8                     	movq	%r9, %r8
  800114: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80011c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800125: e8 06 00 00 00               	callq	0x800130 <syscall>
; }
  80012a: 48 83 c4 20                  	addq	$32, %rsp
  80012e: 5d                           	popq	%rbp
  80012f: c3                           	retq

0000000000800130 <syscall>:
; {
  800130: 55                           	pushq	%rbp
  800131: 48 89 e5                     	movq	%rsp, %rbp
  800134: 48 83 ec 40                  	subq	$64, %rsp
  800138: 48 8b 45 18                  	movq	24(%rbp), %rax
  80013c: 48 8b 45 10                  	movq	16(%rbp), %rax
  800140: 89 7d fc                     	movl	%edi, -4(%rbp)
  800143: 89 75 f8                     	movl	%esi, -8(%rbp)
  800146: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80014a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80014e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  800152: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800156: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80015a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80015e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800162: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800166: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80016a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80016e: 48 8b 45 18                  	movq	24(%rbp), %rax
  800172: 48 89 04 24                  	movq	%rax, (%rsp)
  800176: e8 01 01 00 00               	callq	0x80027c <do_syscall>
  80017b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80017f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  800183: 0f 84 2c 00 00 00            	je	0x8001b5 <syscall+0x85>
  800189: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80018e: 0f 83 21 00 00 00            	jae	0x8001b5 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  800194: 8b 4d fc                     	movl	-4(%rbp), %ecx
  800197: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80019b: 48 8d 3d 2b 1f 00 00         	leaq	7979(%rip), %rdi        # 0x8020cd <syscall.c+0x8020cd>
  8001a2: be 1f 00 00 00               	movl	$31, %esi
  8001a7: 48 8d 15 bd 1e 00 00         	leaq	7869(%rip), %rdx        # 0x80206b <syscall.c+0x80206b>
  8001ae: b0 00                        	movb	$0, %al
  8001b0: e8 db 00 00 00               	callq	0x800290 <_panic>
; 	return ret;
  8001b5: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8001b9: 48 83 c4 40                  	addq	$64, %rsp
  8001bd: 5d                           	popq	%rbp
  8001be: c3                           	retq
  8001bf: 90                           	nop

00000000008001c0 <getc>:
; {
  8001c0: 55                           	pushq	%rbp
  8001c1: 48 89 e5                     	movq	%rsp, %rbp
  8001c4: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  8001c8: bf 01 00 00 00               	movl	$1, %edi
  8001cd: 31 f6                        	xorl	%esi, %esi
  8001cf: 31 c0                        	xorl	%eax, %eax
  8001d1: 41 89 c1                     	movl	%eax, %r9d
  8001d4: 4c 89 ca                     	movq	%r9, %rdx
  8001d7: 4c 89 c9                     	movq	%r9, %rcx
  8001da: 4d 89 c8                     	movq	%r9, %r8
  8001dd: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8001e5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8001ee: e8 3d ff ff ff               	callq	0x800130 <syscall>
  8001f3: 48 83 c4 10                  	addq	$16, %rsp
  8001f7: 5d                           	popq	%rbp
  8001f8: c3                           	retq
  8001f9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800200 <kill>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 83 ec 20                  	subq	$32, %rsp
  800208: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  80020b: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  80020f: bf 03 00 00 00               	movl	$3, %edi
  800214: be 01 00 00 00               	movl	$1, %esi
  800219: 31 c0                        	xorl	%eax, %eax
  80021b: 41 89 c1                     	movl	%eax, %r9d
  80021e: 4c 89 c9                     	movq	%r9, %rcx
  800221: 4d 89 c8                     	movq	%r9, %r8
  800224: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80022c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  800235: e8 f6 fe ff ff               	callq	0x800130 <syscall>
  80023a: 48 83 c4 20                  	addq	$32, %rsp
  80023e: 5d                           	popq	%rbp
  80023f: c3                           	retq

0000000000800240 <getpid>:
; {
  800240: 55                           	pushq	%rbp
  800241: 48 89 e5                     	movq	%rsp, %rbp
  800244: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800248: bf 02 00 00 00               	movl	$2, %edi
  80024d: 31 f6                        	xorl	%esi, %esi
  80024f: 31 c0                        	xorl	%eax, %eax
  800251: 41 89 c1                     	movl	%eax, %r9d
  800254: 4c 89 ca                     	movq	%r9, %rdx
  800257: 4c 89 c9                     	movq	%r9, %rcx
  80025a: 4d 89 c8                     	movq	%r9, %r8
  80025d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800265: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80026e: e8 bd fe ff ff               	callq	0x800130 <syscall>
  800273: 48 83 c4 10                  	addq	$16, %rsp
  800277: 5d                           	popq	%rbp
  800278: c3                           	retq
  800279: cc                           	int3
  80027a: cc                           	int3
  80027b: cc                           	int3

000000000080027c <do_syscall>:
; 	pushq %rbp
  80027c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80027d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800282: cd 80                        	int	$128
; 	popq %rbp
  800284: 5d                           	popq	%rbp
; 	retq
  800285: c3                           	retq
  800286: cc                           	int3
  800287: cc                           	int3
  800288: cc                           	int3
  800289: cc                           	int3
  80028a: cc                           	int3
  80028b: cc                           	int3
  80028c: cc                           	int3
  80028d: cc                           	int3
  80028e: cc                           	int3
  80028f: cc                           	int3

0000000000800290 <_panic>:
; {
  800290: 55                           	pushq	%rbp
  800291: 48 89 e5                     	movq	%rsp, %rbp
  800294: 48 83 ec 60                  	subq	$96, %rsp
  800298: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80029c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8002a0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8002a4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8002a8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8002ab: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  8002af: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  8002b3: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  8002b7: 48 89 48 10                  	movq	%rcx, 16(%rax)
  8002bb: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  8002bf: 48 89 48 08                  	movq	%rcx, 8(%rax)
  8002c3: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  8002ca: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  8002d0: e8 6b ff ff ff               	callq	0x800240 <getpid>
  8002d5: 89 c6                        	movl	%eax, %esi
  8002d7: 48 8d 05 22 2d 00 00         	leaq	11554(%rip), %rax       # 0x803000 <binary_name>
  8002de: 48 8b 10                     	movq	(%rax), %rdx
  8002e1: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8002e5: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8002e9: 48 8d 3d 2e 1d 00 00         	leaq	7470(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8002f0: b0 00                        	movb	$0, %al
  8002f2: e8 09 01 00 00               	callq	0x800400 <printf>
; 	vprintf(fmt, ap);
  8002f7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8002fb: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8002ff: e8 1c 00 00 00               	callq	0x800320 <vprintf>
; 	printf("\n");
  800304: 48 8d 3d b9 1d 00 00         	leaq	7609(%rip), %rdi        # 0x8020c4 <syscall.c+0x8020c4>
  80030b: b0 00                        	movb	$0, %al
  80030d: e8 ee 00 00 00               	callq	0x800400 <printf>
; 		asm volatile("int3");
  800312: cc                           	int3
; 	while (1) {
  800313: e9 fa ff ff ff               	jmp	0x800312 <_panic+0x82>
  800318: cc                           	int3
  800319: cc                           	int3
  80031a: cc                           	int3
  80031b: cc                           	int3
  80031c: cc                           	int3
  80031d: cc                           	int3
  80031e: cc                           	int3
  80031f: cc                           	int3

0000000000800320 <vprintf>:
; {
  800320: 55                           	pushq	%rbp
  800321: 48 89 e5                     	movq	%rsp, %rbp
  800324: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  80032b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80032f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800333: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80033d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800347: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80034e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800352: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800356: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800390 <putch>
  80035d: e8 fe 00 00 00               	callq	0x800460 <vprintfmt>
; 	puts(b.buf, b.idx);
  800362: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800369: 48 83 c7 08                  	addq	$8, %rdi
  80036d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800374: e8 77 fd ff ff               	callq	0x8000f0 <puts>
; 	return b.cnt;
  800379: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80037f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800386: 5d                           	popq	%rbp
  800387: c3                           	retq
  800388: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800390 <putch>:
; {
  800390: 55                           	pushq	%rbp
  800391: 48 89 e5                     	movq	%rsp, %rbp
  800394: 48 83 ec 10                  	subq	$16, %rsp
  800398: 89 7d fc                     	movl	%edi, -4(%rbp)
  80039b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80039f: 8b 45 fc                     	movl	-4(%rbp), %eax
  8003a2: 88 c2                        	movb	%al, %dl
  8003a4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003a8: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8003ac: 8b 0e                        	movl	(%rsi), %ecx
  8003ae: 89 cf                        	movl	%ecx, %edi
  8003b0: 83 c7 01                     	addl	$1, %edi
  8003b3: 89 3e                        	movl	%edi, (%rsi)
  8003b5: 48 63 c9                     	movslq	%ecx, %rcx
  8003b8: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  8003bc: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003c0: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  8003c6: 0f 85 1e 00 00 00            	jne	0x8003ea <putch+0x5a>
; 		puts(b->buf, b->idx);
  8003cc: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8003d0: 48 83 c7 08                  	addq	$8, %rdi
  8003d4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003d8: 48 63 30                     	movslq	(%rax), %rsi
  8003db: e8 10 fd ff ff               	callq	0x8000f0 <puts>
; 		b->idx = 0;
  8003e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003e4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8003ea: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8003ee: 8b 48 04                     	movl	4(%rax), %ecx
  8003f1: 83 c1 01                     	addl	$1, %ecx
  8003f4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8003f7: 48 83 c4 10                  	addq	$16, %rsp
  8003fb: 5d                           	popq	%rbp
  8003fc: c3                           	retq
  8003fd: 0f 1f 00                     	nopl	(%rax)

0000000000800400 <printf>:
; {
  800400: 55                           	pushq	%rbp
  800401: 48 89 e5                     	movq	%rsp, %rbp
  800404: 48 83 ec 60                  	subq	$96, %rsp
  800408: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80040c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800410: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800414: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  800418: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  80041c: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800420: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800424: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800428: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80042c: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800430: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800437: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80043e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800442: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800446: e8 d5 fe ff ff               	callq	0x800320 <vprintf>
  80044b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80044e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800451: 48 83 c4 60                  	addq	$96, %rsp
  800455: 5d                           	popq	%rbp
  800456: c3                           	retq
  800457: cc                           	int3
  800458: cc                           	int3
  800459: cc                           	int3
  80045a: cc                           	int3
  80045b: cc                           	int3
  80045c: cc                           	int3
  80045d: cc                           	int3
  80045e: cc                           	int3
  80045f: cc                           	int3

0000000000800460 <vprintfmt>:
; {
  800460: 55                           	pushq	%rbp
  800461: 48 89 e5                     	movq	%rsp, %rbp
  800464: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80046b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80046f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800473: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800477: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80047b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80047f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800483: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800487: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80048b: 48 8b 0a                     	movq	(%rdx), %rcx
  80048e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800492: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800496: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800499: e9 00 00 00 00               	jmp	0x80049e <vprintfmt+0x3e>
  80049e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004a2: 48 89 c1                     	movq	%rax, %rcx
  8004a5: 48 83 c1 01                  	addq	$1, %rcx
  8004a9: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8004ad: 0f b6 00                     	movzbl	(%rax), %eax
  8004b0: 89 45 b4                     	movl	%eax, -76(%rbp)
  8004b3: 83 f8 25                     	cmpl	$37, %eax
  8004b6: 0f 84 25 00 00 00            	je	0x8004e1 <vprintfmt+0x81>
; 			if (ch == '\0')
  8004bc: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  8004c0: 0f 85 09 00 00 00            	jne	0x8004cf <vprintfmt+0x6f>
; 				return;
  8004c6: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  8004cd: 5d                           	popq	%rbp
  8004ce: c3                           	retq
; 			putch(ch, putdat);
  8004cf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8004d3: 8b 7d b4                     	movl	-76(%rbp), %edi
  8004d6: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8004da: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8004dc: e9 bd ff ff ff               	jmp	0x80049e <vprintfmt+0x3e>
; 		padc = ' ';
  8004e1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8004e5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8004ec: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8004f3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8004fa: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  800501: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800505: 48 89 c1                     	movq	%rax, %rcx
  800508: 48 83 c1 01                  	addq	$1, %rcx
  80050c: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800510: 0f b6 00                     	movzbl	(%rax), %eax
  800513: 89 45 b4                     	movl	%eax, -76(%rbp)
  800516: 83 c0 dd                     	addl	$-35, %eax
  800519: 89 c1                        	movl	%eax, %ecx
  80051b: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  80051f: 83 e8 55                     	subl	$85, %eax
  800522: 0f 87 c1 05 00 00            	ja	0x800ae9 <vprintfmt+0x689>
  800528: 48 8b 45 88                  	movq	-120(%rbp), %rax
  80052c: 48 8d 0d f1 1b 00 00         	leaq	7153(%rip), %rcx        # 0x802124 <syscall.c+0x802124>
  800533: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800537: 48 01 c8                     	addq	%rcx, %rax
  80053a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80053c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800540: e9 bc ff ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			padc = '0';
  800545: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800549: e9 b3 ff ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80054e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800555: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800559: 03 45 b4                     	addl	-76(%rbp), %eax
  80055c: 83 e8 30                     	subl	$48, %eax
  80055f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800562: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800566: 0f be 00                     	movsbl	(%rax), %eax
  800569: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80056c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800570: 0f 8c 0a 00 00 00            	jl	0x800580 <vprintfmt+0x120>
  800576: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80057a: 0f 8e 05 00 00 00            	jle	0x800585 <vprintfmt+0x125>
; 					break;
  800580: e9 16 00 00 00               	jmp	0x80059b <vprintfmt+0x13b>
; 			}
  800585: e9 00 00 00 00               	jmp	0x80058a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80058a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80058e: 48 83 c0 01                  	addq	$1, %rax
  800592: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800596: e9 ba ff ff ff               	jmp	0x800555 <vprintfmt+0xf5>
; 			goto process_precision;
  80059b: e9 8c 00 00 00               	jmp	0x80062c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  8005a0: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8005a4: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  8005ab: 8b 45 c0                     	movl	-64(%rbp), %eax
  8005ae: 89 45 84                     	movl	%eax, -124(%rbp)
  8005b1: 83 f8 28                     	cmpl	$40, %eax
  8005b4: 0f 87 22 00 00 00            	ja	0x8005dc <vprintfmt+0x17c>
  8005ba: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  8005c1: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  8005c4: 48 63 c2                     	movslq	%edx, %rax
  8005c7: 48 03 41 10                  	addq	16(%rcx), %rax
  8005cb: 83 c2 08                     	addl	$8, %edx
  8005ce: 89 11                        	movl	%edx, (%rcx)
  8005d0: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005d7: e9 1d 00 00 00               	jmp	0x8005f9 <vprintfmt+0x199>
  8005dc: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8005e3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005e7: 48 89 d0                     	movq	%rdx, %rax
  8005ea: 48 83 c2 08                  	addq	$8, %rdx
  8005ee: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005f2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8005f9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  800600: 8b 00                        	movl	(%rax), %eax
  800602: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  800605: e9 22 00 00 00               	jmp	0x80062c <vprintfmt+0x1cc>
; 			if (width < 0)
  80060a: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  80060e: 0f 8d 07 00 00 00            	jge	0x80061b <vprintfmt+0x1bb>
; 				width = 0;
  800614: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  80061b: e9 e1 fe ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			altflag = 1;
  800620: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  800627: e9 d5 fe ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			if (width < 0)
  80062c: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800630: 0f 8d 0d 00 00 00            	jge	0x800643 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800636: 8b 45 98                     	movl	-104(%rbp), %eax
  800639: 89 45 9c                     	movl	%eax, -100(%rbp)
  80063c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800643: e9 b9 fe ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			lflag++;
  800648: 8b 45 a0                     	movl	-96(%rbp), %eax
  80064b: 83 c0 01                     	addl	$1, %eax
  80064e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800651: e9 ab fe ff ff               	jmp	0x800501 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800656: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80065a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800661: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800665: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80066c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80066f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800675: 83 f8 28                     	cmpl	$40, %eax
  800678: 0f 87 25 00 00 00            	ja	0x8006a3 <vprintfmt+0x243>
  80067e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800685: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80068b: 48 63 c2                     	movslq	%edx, %rax
  80068e: 48 03 41 10                  	addq	16(%rcx), %rax
  800692: 83 c2 08                     	addl	$8, %edx
  800695: 89 11                        	movl	%edx, (%rcx)
  800697: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80069e: e9 1d 00 00 00               	jmp	0x8006c0 <vprintfmt+0x260>
  8006a3: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  8006aa: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8006ae: 48 89 d0                     	movq	%rdx, %rax
  8006b1: 48 83 c2 08                  	addq	$8, %rdx
  8006b5: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8006b9: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  8006c0: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  8006c7: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  8006ce: 8b 39                        	movl	(%rcx), %edi
  8006d0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006d4: ff d0                        	callq	*%rax
; 			break;
  8006d6: e9 55 04 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  8006db: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8006df: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8006e6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8006e9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8006ef: 83 f8 28                     	cmpl	$40, %eax
  8006f2: 0f 87 25 00 00 00            	ja	0x80071d <vprintfmt+0x2bd>
  8006f8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8006ff: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  800705: 48 63 c2                     	movslq	%edx, %rax
  800708: 48 03 41 10                  	addq	16(%rcx), %rax
  80070c: 83 c2 08                     	addl	$8, %edx
  80070f: 89 11                        	movl	%edx, (%rcx)
  800711: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  800718: e9 1d 00 00 00               	jmp	0x80073a <vprintfmt+0x2da>
  80071d: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  800724: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800728: 48 89 d0                     	movq	%rdx, %rax
  80072b: 48 83 c2 08                  	addq	$8, %rdx
  80072f: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800733: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80073a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800741: 8b 00                        	movl	(%rax), %eax
  800743: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800746: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80074a: 0f 8d 08 00 00 00            	jge	0x800758 <vprintfmt+0x2f8>
; 				err = -err;
  800750: 31 c0                        	xorl	%eax, %eax
  800752: 2b 45 b0                     	subl	-80(%rbp), %eax
  800755: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800758: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80075c: 48 83 f8 09                  	cmpq	$9, %rax
  800760: 0f 83 1d 00 00 00            	jae	0x800783 <vprintfmt+0x323>
  800766: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80076a: 48 8d 05 af f8 9f ff         	leaq	-6293329(%rip), %rax    # 0x200020 <error_string>
  800771: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800775: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800779: 48 83 f8 00                  	cmpq	$0, %rax
  80077d: 0f 85 1e 00 00 00            	jne	0x8007a1 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800783: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800787: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80078b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80078e: 48 8d 15 15 19 00 00         	leaq	6421(%rip), %rdx        # 0x8020aa <syscall.c+0x8020aa>
  800795: b0 00                        	movb	$0, %al
  800797: e8 a4 03 00 00               	callq	0x800b40 <printfmt>
  80079c: e9 1a 00 00 00               	jmp	0x8007bb <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  8007a1: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8007a5: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007a9: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  8007ad: 48 8d 15 67 18 00 00         	leaq	6247(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  8007b4: b0 00                        	movb	$0, %al
  8007b6: e8 85 03 00 00               	callq	0x800b40 <printfmt>
; 			break;
  8007bb: e9 70 03 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007c0: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8007c4: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  8007cb: 8b 45 c0                     	movl	-64(%rbp), %eax
  8007ce: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  8007d4: 83 f8 28                     	cmpl	$40, %eax
  8007d7: 0f 87 25 00 00 00            	ja	0x800802 <vprintfmt+0x3a2>
  8007dd: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8007e4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8007ea: 48 63 c2                     	movslq	%edx, %rax
  8007ed: 48 03 41 10                  	addq	16(%rcx), %rax
  8007f1: 83 c2 08                     	addl	$8, %edx
  8007f4: 89 11                        	movl	%edx, (%rcx)
  8007f6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8007fd: e9 1d 00 00 00               	jmp	0x80081f <vprintfmt+0x3bf>
  800802: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  800809: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80080d: 48 89 d0                     	movq	%rdx, %rax
  800810: 48 83 c2 08                  	addq	$8, %rdx
  800814: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800818: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80081f: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800826: 48 8b 00                     	movq	(%rax), %rax
  800829: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  80082d: 48 83 f8 00                  	cmpq	$0, %rax
  800831: 0f 85 0b 00 00 00            	jne	0x800842 <vprintfmt+0x3e2>
; 				p = "(null)";
  800837: 48 8d 05 88 18 00 00         	leaq	6280(%rip), %rax        # 0x8020c6 <syscall.c+0x8020c6>
  80083e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800842: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800846: 0f 8e 4f 00 00 00            	jle	0x80089b <vprintfmt+0x43b>
  80084c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800850: 83 f8 2d                     	cmpl	$45, %eax
  800853: 0f 84 42 00 00 00            	je	0x80089b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800859: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80085d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800861: e8 da 07 00 00               	callq	0x801040 <strnlen>
  800866: 89 c1                        	movl	%eax, %ecx
  800868: 8b 45 9c                     	movl	-100(%rbp), %eax
  80086b: 29 c8                        	subl	%ecx, %eax
  80086d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800870: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800874: 0f 8e 1c 00 00 00            	jle	0x800896 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80087a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80087e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800882: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800886: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800888: 8b 45 9c                     	movl	-100(%rbp), %eax
  80088b: 83 c0 ff                     	addl	$-1, %eax
  80088e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800891: e9 da ff ff ff               	jmp	0x800870 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800896: e9 00 00 00 00               	jmp	0x80089b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80089b: e9 00 00 00 00               	jmp	0x8008a0 <vprintfmt+0x440>
  8008a0: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8008a4: 48 89 c1                     	movq	%rax, %rcx
  8008a7: 48 83 c1 01                  	addq	$1, %rcx
  8008ab: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8008af: 0f be 08                     	movsbl	(%rax), %ecx
  8008b2: 89 4d b4                     	movl	%ecx, -76(%rbp)
  8008b5: 31 c0                        	xorl	%eax, %eax
  8008b7: 83 f9 00                     	cmpl	$0, %ecx
  8008ba: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008c0: 0f 84 33 00 00 00            	je	0x8008f9 <vprintfmt+0x499>
  8008c6: b0 01                        	movb	$1, %al
  8008c8: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  8008cc: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008d2: 0f 8c 15 00 00 00            	jl	0x8008ed <vprintfmt+0x48d>
  8008d8: 8b 45 98                     	movl	-104(%rbp), %eax
  8008db: 83 c0 ff                     	addl	$-1, %eax
  8008de: 89 45 98                     	movl	%eax, -104(%rbp)
  8008e1: 83 f8 00                     	cmpl	$0, %eax
  8008e4: 0f 9d c0                     	setge	%al
  8008e7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8008ed: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8008f3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8008f9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008ff: a8 01                        	testb	$1, %al
  800901: 0f 85 05 00 00 00            	jne	0x80090c <vprintfmt+0x4ac>
  800907: e9 52 00 00 00               	jmp	0x80095e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  80090c: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  800910: 0f 84 28 00 00 00            	je	0x80093e <vprintfmt+0x4de>
  800916: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  80091a: 0f 8c 0a 00 00 00            	jl	0x80092a <vprintfmt+0x4ca>
  800920: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  800924: 0f 8e 14 00 00 00            	jle	0x80093e <vprintfmt+0x4de>
; 					putch('?', putdat);
  80092a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80092e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800932: bf 3f 00 00 00               	movl	$63, %edi
  800937: ff d0                        	callq	*%rax
  800939: e9 0d 00 00 00               	jmp	0x80094b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80093e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800942: 8b 7d b4                     	movl	-76(%rbp), %edi
  800945: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800949: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80094b: e9 00 00 00 00               	jmp	0x800950 <vprintfmt+0x4f0>
; 					width--)
  800950: 8b 45 9c                     	movl	-100(%rbp), %eax
  800953: 83 c0 ff                     	addl	$-1, %eax
  800956: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800959: e9 42 ff ff ff               	jmp	0x8008a0 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80095e: e9 00 00 00 00               	jmp	0x800963 <vprintfmt+0x503>
  800963: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800967: 0f 8e 1d 00 00 00            	jle	0x80098a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80096d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800971: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800975: bf 20 00 00 00               	movl	$32, %edi
  80097a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80097c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80097f: 83 c0 ff                     	addl	$-1, %eax
  800982: 89 45 9c                     	movl	%eax, -100(%rbp)
  800985: e9 d9 ff ff ff               	jmp	0x800963 <vprintfmt+0x503>
; 			break;
  80098a: e9 a1 01 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80098f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800992: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800996: e8 05 02 00 00               	callq	0x800ba0 <getint>
  80099b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80099f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  8009a4: 0f 8d 19 00 00 00            	jge	0x8009c3 <vprintfmt+0x563>
; 				putch('-', putdat);
  8009aa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8009ae: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8009b2: bf 2d 00 00 00               	movl	$45, %edi
  8009b7: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  8009b9: 31 c0                        	xorl	%eax, %eax
  8009bb: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  8009bf: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009c3: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009ca: e9 e6 00 00 00               	jmp	0x800ab5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009cf: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009d2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009d6: e8 f5 02 00 00               	callq	0x800cd0 <getuint>
  8009db: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8009df: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8009e6: e9 ca 00 00 00               	jmp	0x800ab5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009eb: 8b 75 a0                     	movl	-96(%rbp), %esi
  8009ee: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8009f2: e8 d9 02 00 00               	callq	0x800cd0 <getuint>
  8009f7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8009fb: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  800a02: e9 ae 00 00 00               	jmp	0x800ab5 <vprintfmt+0x655>
; 			putch('0', putdat);
  800a07: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a0b: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a0f: bf 30 00 00 00               	movl	$48, %edi
  800a14: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800a16: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a1a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a1e: bf 78 00 00 00               	movl	$120, %edi
  800a23: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800a25: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800a29: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800a30: 8b 45 c0                     	movl	-64(%rbp), %eax
  800a33: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800a39: 83 f8 28                     	cmpl	$40, %eax
  800a3c: 0f 87 25 00 00 00            	ja	0x800a67 <vprintfmt+0x607>
  800a42: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800a49: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  800a4f: 48 63 c2                     	movslq	%edx, %rax
  800a52: 48 03 41 10                  	addq	16(%rcx), %rax
  800a56: 83 c2 08                     	addl	$8, %edx
  800a59: 89 11                        	movl	%edx, (%rcx)
  800a5b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a62: e9 1d 00 00 00               	jmp	0x800a84 <vprintfmt+0x624>
  800a67: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  800a6e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a72: 48 89 d0                     	movq	%rdx, %rax
  800a75: 48 83 c2 08                  	addq	$8, %rdx
  800a79: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a7d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800a84: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  800a8b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  800a8e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a92: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a99: e9 17 00 00 00               	jmp	0x800ab5 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a9e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800aa1: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800aa5: e8 26 02 00 00               	callq	0x800cd0 <getuint>
  800aaa: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800aae: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800ab5: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800ab9: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800abd: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800ac1: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800ac4: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800ac8: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800acd: e8 2e 03 00 00               	callq	0x800e00 <printnum>
; 			break;
  800ad2: e9 59 00 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800ad7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800adb: 8b 7d b4                     	movl	-76(%rbp), %edi
  800ade: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ae2: ff d0                        	callq	*%rax
; 			break;
  800ae4: e9 47 00 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800ae9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800aed: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800af1: bf 25 00 00 00               	movl	$37, %edi
  800af6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800af8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800afc: 48 83 c0 ff                  	addq	$-1, %rax
  800b00: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800b04: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800b08: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800b0c: 83 f8 25                     	cmpl	$37, %eax
  800b0f: 0f 84 16 00 00 00            	je	0x800b2b <vprintfmt+0x6cb>
  800b15: e9 00 00 00 00               	jmp	0x800b1a <vprintfmt+0x6ba>
  800b1a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800b1e: 48 83 c0 ff                  	addq	$-1, %rax
  800b22: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800b26: e9 d9 ff ff ff               	jmp	0x800b04 <vprintfmt+0x6a4>
; 			break;
  800b2b: e9 00 00 00 00               	jmp	0x800b30 <vprintfmt+0x6d0>
; 	while (1) {
  800b30: e9 64 f9 ff ff               	jmp	0x800499 <vprintfmt+0x39>
  800b35: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b3f: 90                           	nop

0000000000800b40 <printfmt>:
; {
  800b40: 55                           	pushq	%rbp
  800b41: 48 89 e5                     	movq	%rsp, %rbp
  800b44: 48 83 ec 60                  	subq	$96, %rsp
  800b48: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800b4c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800b50: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800b54: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800b58: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800b5c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800b60: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800b64: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b68: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800b6c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b70: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800b77: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800b7e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800b82: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800b86: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800b8a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800b8e: e8 cd f8 ff ff               	callq	0x800460 <vprintfmt>
; }
  800b93: 48 83 c4 60                  	addq	$96, %rsp
  800b97: 5d                           	popq	%rbp
  800b98: c3                           	retq
  800b99: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800ba0 <getint>:
; {
  800ba0: 55                           	pushq	%rbp
  800ba1: 48 89 e5                     	movq	%rsp, %rbp
  800ba4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800ba8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800bab: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800baf: 0f 8c 59 00 00 00            	jl	0x800c0e <getint+0x6e>
; 		return va_arg(*ap, long long);
  800bb5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bb9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800bbd: 8b 00                        	movl	(%rax), %eax
  800bbf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800bc2: 83 f8 28                     	cmpl	$40, %eax
  800bc5: 0f 87 1c 00 00 00            	ja	0x800be7 <getint+0x47>
  800bcb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800bcf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800bd2: 48 63 c2                     	movslq	%edx, %rax
  800bd5: 48 03 41 10                  	addq	16(%rcx), %rax
  800bd9: 83 c2 08                     	addl	$8, %edx
  800bdc: 89 11                        	movl	%edx, (%rcx)
  800bde: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800be2: e9 17 00 00 00               	jmp	0x800bfe <getint+0x5e>
  800be7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800beb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bef: 48 89 d0                     	movq	%rdx, %rax
  800bf2: 48 83 c2 08                  	addq	$8, %rdx
  800bf6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bfa: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bfe: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800c02: 48 8b 00                     	movq	(%rax), %rax
  800c05: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c09: e9 b7 00 00 00               	jmp	0x800cc5 <getint+0x125>
; 	else if (lflag)
  800c0e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800c12: 0f 84 59 00 00 00            	je	0x800c71 <getint+0xd1>
; 		return va_arg(*ap, long);
  800c18: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c1c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800c20: 8b 00                        	movl	(%rax), %eax
  800c22: 89 45 d4                     	movl	%eax, -44(%rbp)
  800c25: 83 f8 28                     	cmpl	$40, %eax
  800c28: 0f 87 1c 00 00 00            	ja	0x800c4a <getint+0xaa>
  800c2e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800c32: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800c35: 48 63 c2                     	movslq	%edx, %rax
  800c38: 48 03 41 10                  	addq	16(%rcx), %rax
  800c3c: 83 c2 08                     	addl	$8, %edx
  800c3f: 89 11                        	movl	%edx, (%rcx)
  800c41: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c45: e9 17 00 00 00               	jmp	0x800c61 <getint+0xc1>
  800c4a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800c4e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c52: 48 89 d0                     	movq	%rdx, %rax
  800c55: 48 83 c2 08                  	addq	$8, %rdx
  800c59: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c5d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c61: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800c65: 48 8b 00                     	movq	(%rax), %rax
  800c68: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c6c: e9 54 00 00 00               	jmp	0x800cc5 <getint+0x125>
; 		return va_arg(*ap, int);
  800c71: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c75: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c79: 8b 00                        	movl	(%rax), %eax
  800c7b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c7e: 83 f8 28                     	cmpl	$40, %eax
  800c81: 0f 87 1c 00 00 00            	ja	0x800ca3 <getint+0x103>
  800c87: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c8b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800c8e: 48 63 c2                     	movslq	%edx, %rax
  800c91: 48 03 41 10                  	addq	16(%rcx), %rax
  800c95: 83 c2 08                     	addl	$8, %edx
  800c98: 89 11                        	movl	%edx, (%rcx)
  800c9a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c9e: e9 17 00 00 00               	jmp	0x800cba <getint+0x11a>
  800ca3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800ca7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800cab: 48 89 d0                     	movq	%rdx, %rax
  800cae: 48 83 c2 08                  	addq	$8, %rdx
  800cb2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800cb6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800cba: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800cbe: 48 63 00                     	movslq	(%rax), %rax
  800cc1: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800cc5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800cc9: 5d                           	popq	%rbp
  800cca: c3                           	retq
  800ccb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800cd0 <getuint>:
; {
  800cd0: 55                           	pushq	%rbp
  800cd1: 48 89 e5                     	movq	%rsp, %rbp
  800cd4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800cd8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800cdb: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800cdf: 0f 8c 59 00 00 00            	jl	0x800d3e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800ce5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ce9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800ced: 8b 00                        	movl	(%rax), %eax
  800cef: 89 45 e8                     	movl	%eax, -24(%rbp)
  800cf2: 83 f8 28                     	cmpl	$40, %eax
  800cf5: 0f 87 1c 00 00 00            	ja	0x800d17 <getuint+0x47>
  800cfb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800cff: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800d02: 48 63 c2                     	movslq	%edx, %rax
  800d05: 48 03 41 10                  	addq	16(%rcx), %rax
  800d09: 83 c2 08                     	addl	$8, %edx
  800d0c: 89 11                        	movl	%edx, (%rcx)
  800d0e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d12: e9 17 00 00 00               	jmp	0x800d2e <getuint+0x5e>
  800d17: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800d1b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d1f: 48 89 d0                     	movq	%rdx, %rax
  800d22: 48 83 c2 08                  	addq	$8, %rdx
  800d26: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d2a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d2e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800d32: 48 8b 00                     	movq	(%rax), %rax
  800d35: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d39: e9 b6 00 00 00               	jmp	0x800df4 <getuint+0x124>
; 	else if (lflag)
  800d3e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800d42: 0f 84 59 00 00 00            	je	0x800da1 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800d48: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d4c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d50: 8b 00                        	movl	(%rax), %eax
  800d52: 89 45 d4                     	movl	%eax, -44(%rbp)
  800d55: 83 f8 28                     	cmpl	$40, %eax
  800d58: 0f 87 1c 00 00 00            	ja	0x800d7a <getuint+0xaa>
  800d5e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800d62: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800d65: 48 63 c2                     	movslq	%edx, %rax
  800d68: 48 03 41 10                  	addq	16(%rcx), %rax
  800d6c: 83 c2 08                     	addl	$8, %edx
  800d6f: 89 11                        	movl	%edx, (%rcx)
  800d71: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d75: e9 17 00 00 00               	jmp	0x800d91 <getuint+0xc1>
  800d7a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800d7e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d82: 48 89 d0                     	movq	%rdx, %rax
  800d85: 48 83 c2 08                  	addq	$8, %rdx
  800d89: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d8d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d91: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d95: 48 8b 00                     	movq	(%rax), %rax
  800d98: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d9c: e9 53 00 00 00               	jmp	0x800df4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800da1: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800da5: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800da9: 8b 00                        	movl	(%rax), %eax
  800dab: 89 45 bc                     	movl	%eax, -68(%rbp)
  800dae: 83 f8 28                     	cmpl	$40, %eax
  800db1: 0f 87 1c 00 00 00            	ja	0x800dd3 <getuint+0x103>
  800db7: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800dbb: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800dbe: 48 63 c2                     	movslq	%edx, %rax
  800dc1: 48 03 41 10                  	addq	16(%rcx), %rax
  800dc5: 83 c2 08                     	addl	$8, %edx
  800dc8: 89 11                        	movl	%edx, (%rcx)
  800dca: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dce: e9 17 00 00 00               	jmp	0x800dea <getuint+0x11a>
  800dd3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800dd7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800ddb: 48 89 d0                     	movq	%rdx, %rax
  800dde: 48 83 c2 08                  	addq	$8, %rdx
  800de2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800de6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800dea: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800dee: 8b 00                        	movl	(%rax), %eax
  800df0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800df4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800df8: 5d                           	popq	%rbp
  800df9: c3                           	retq
  800dfa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800e00 <printnum>:
; {
  800e00: 55                           	pushq	%rbp
  800e01: 48 89 e5                     	movq	%rsp, %rbp
  800e04: 48 83 ec 30                  	subq	$48, %rsp
  800e08: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800e0c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800e10: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800e14: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800e17: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800e1b: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800e1f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e23: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e26: 48 39 c8                     	cmpq	%rcx, %rax
  800e29: 0f 82 30 00 00 00            	jb	0x800e5f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800e2f: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800e33: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e37: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e3b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e3e: 31 d2                        	xorl	%edx, %edx
  800e40: 48 f7 f1                     	divq	%rcx
  800e43: 48 89 c2                     	movq	%rax, %rdx
  800e46: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e49: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800e4d: 41 83 e8 01                  	subl	$1, %r8d
  800e51: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800e55: e8 a6 ff ff ff               	callq	0x800e00 <printnum>
; 	} else {
  800e5a: e9 2e 00 00 00               	jmp	0x800e8d <printnum+0x8d>
; 		while (--width > 0)
  800e5f: e9 00 00 00 00               	jmp	0x800e64 <printnum+0x64>
  800e64: 8b 45 e0                     	movl	-32(%rbp), %eax
  800e67: 83 c0 ff                     	addl	$-1, %eax
  800e6a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800e6d: 83 f8 00                     	cmpl	$0, %eax
  800e70: 0f 8e 12 00 00 00            	jle	0x800e88 <printnum+0x88>
; 			putch(padc, putdat);
  800e76: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e7a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800e7d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e81: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800e83: e9 dc ff ff ff               	jmp	0x800e64 <printnum+0x64>
  800e88: e9 00 00 00 00               	jmp	0x800e8d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800e8d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e91: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e95: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e99: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e9c: 31 d2                        	xorl	%edx, %edx
  800e9e: 48 f7 f1                     	divq	%rcx
  800ea1: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800ea5: 48 8d 0d 07 12 00 00         	leaq	4615(%rip), %rcx        # 0x8020b3 <syscall.c+0x8020b3>
  800eac: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800eb0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800eb4: ff d0                        	callq	*%rax
; }
  800eb6: 48 83 c4 30                  	addq	$48, %rsp
  800eba: 5d                           	popq	%rbp
  800ebb: c3                           	retq
  800ebc: 0f 1f 40 00                  	nopl	(%rax)

0000000000800ec0 <vsnprintf>:
; {
  800ec0: 55                           	pushq	%rbp
  800ec1: 48 89 e5                     	movq	%rsp, %rbp
  800ec4: 48 83 ec 40                  	subq	$64, %rsp
  800ec8: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800ecc: 89 75 ec                     	movl	%esi, -20(%rbp)
  800ecf: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800ed3: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800ed7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800edb: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800edf: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ee3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800ee7: 48 01 c8                     	addq	%rcx, %rax
  800eea: 48 83 c0 ff                  	addq	$-1, %rax
  800eee: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800ef2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800ef9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800efe: 0f 84 0a 00 00 00            	je	0x800f0e <vsnprintf+0x4e>
  800f04: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800f08: 0f 8d 0c 00 00 00            	jge	0x800f1a <vsnprintf+0x5a>
; 		return -EINVAL;
  800f0e: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800f15: e9 25 00 00 00               	jmp	0x800f3f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800f1a: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800f1e: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800f22: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800f26: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800f50 <sprintputch>
  800f2d: e8 2e f5 ff ff               	callq	0x800460 <vprintfmt>
; 	*b.buf = '\0';
  800f32: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800f36: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800f39: 8b 45 d0                     	movl	-48(%rbp), %eax
  800f3c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800f3f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f42: 48 83 c4 40                  	addq	$64, %rsp
  800f46: 5d                           	popq	%rbp
  800f47: c3                           	retq
  800f48: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800f50 <sprintputch>:
; {
  800f50: 55                           	pushq	%rbp
  800f51: 48 89 e5                     	movq	%rsp, %rbp
  800f54: 89 7d fc                     	movl	%edi, -4(%rbp)
  800f57: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800f5b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f5f: 8b 48 10                     	movl	16(%rax), %ecx
  800f62: 83 c1 01                     	addl	$1, %ecx
  800f65: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800f68: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f6c: 48 8b 00                     	movq	(%rax), %rax
  800f6f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800f73: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800f77: 0f 83 18 00 00 00            	jae	0x800f95 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800f7d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800f80: 88 c1                        	movb	%al, %cl
  800f82: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800f86: 48 8b 02                     	movq	(%rdx), %rax
  800f89: 48 89 c6                     	movq	%rax, %rsi
  800f8c: 48 83 c6 01                  	addq	$1, %rsi
  800f90: 48 89 32                     	movq	%rsi, (%rdx)
  800f93: 88 08                        	movb	%cl, (%rax)
; }
  800f95: 5d                           	popq	%rbp
  800f96: c3                           	retq
  800f97: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800fa0 <snprintf>:
; {
  800fa0: 55                           	pushq	%rbp
  800fa1: 48 89 e5                     	movq	%rsp, %rbp
  800fa4: 48 83 ec 70                  	subq	$112, %rsp
  800fa8: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800fac: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800fb0: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800fb4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800fb8: 89 75 f4                     	movl	%esi, -12(%rbp)
  800fbb: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800fbf: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800fc3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800fc7: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800fcb: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800fcf: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800fd6: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800fdd: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fe1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800fe4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800fe8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800fec: e8 cf fe ff ff               	callq	0x800ec0 <vsnprintf>
  800ff1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800ff4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800ff7: 48 83 c4 70                  	addq	$112, %rsp
  800ffb: 5d                           	popq	%rbp
  800ffc: c3                           	retq
  800ffd: cc                           	int3
  800ffe: cc                           	int3
  800fff: cc                           	int3

0000000000801000 <strlen>:
; {
  801000: 55                           	pushq	%rbp
  801001: 48 89 e5                     	movq	%rsp, %rbp
  801004: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  801008: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  80100f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801013: 0f be 00                     	movsbl	(%rax), %eax
  801016: 83 f8 00                     	cmpl	$0, %eax
  801019: 0f 84 1a 00 00 00            	je	0x801039 <strlen+0x39>
; 		n++;
  80101f: 8b 45 f4                     	movl	-12(%rbp), %eax
  801022: 83 c0 01                     	addl	$1, %eax
  801025: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  801028: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80102c: 48 83 c0 01                  	addq	$1, %rax
  801030: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801034: e9 d6 ff ff ff               	jmp	0x80100f <strlen+0xf>
; 	return n;
  801039: 8b 45 f4                     	movl	-12(%rbp), %eax
  80103c: 5d                           	popq	%rbp
  80103d: c3                           	retq
  80103e: 66 90                        	nop

0000000000801040 <strnlen>:
; {
  801040: 55                           	pushq	%rbp
  801041: 48 89 e5                     	movq	%rsp, %rbp
  801044: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801048: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80104c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  801053: 31 c0                        	xorl	%eax, %eax
  801055: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  80105a: 88 45 eb                     	movb	%al, -21(%rbp)
  80105d: 0f 86 10 00 00 00            	jbe	0x801073 <strnlen+0x33>
  801063: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801067: 0f be 00                     	movsbl	(%rax), %eax
  80106a: 83 f8 00                     	cmpl	$0, %eax
  80106d: 0f 95 c0                     	setne	%al
  801070: 88 45 eb                     	movb	%al, -21(%rbp)
  801073: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  801076: a8 01                        	testb	$1, %al
  801078: 0f 85 05 00 00 00            	jne	0x801083 <strnlen+0x43>
  80107e: e9 26 00 00 00               	jmp	0x8010a9 <strnlen+0x69>
; 		n++;
  801083: 8b 45 ec                     	movl	-20(%rbp), %eax
  801086: 83 c0 01                     	addl	$1, %eax
  801089: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  80108c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801090: 48 83 c0 01                  	addq	$1, %rax
  801094: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801098: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80109c: 48 83 c0 ff                  	addq	$-1, %rax
  8010a0: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8010a4: e9 aa ff ff ff               	jmp	0x801053 <strnlen+0x13>
; 	return n;
  8010a9: 8b 45 ec                     	movl	-20(%rbp), %eax
  8010ac: 5d                           	popq	%rbp
  8010ad: c3                           	retq
  8010ae: 66 90                        	nop

00000000008010b0 <strcpy>:
; {
  8010b0: 55                           	pushq	%rbp
  8010b1: 48 89 e5                     	movq	%rsp, %rbp
  8010b4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010b8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  8010bc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010c0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  8010c4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010c8: 48 89 c1                     	movq	%rax, %rcx
  8010cb: 48 83 c1 01                  	addq	$1, %rcx
  8010cf: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8010d3: 8a 00                        	movb	(%rax), %al
  8010d5: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8010d9: 48 89 ca                     	movq	%rcx, %rdx
  8010dc: 48 83 c2 01                  	addq	$1, %rdx
  8010e0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010e4: 88 01                        	movb	%al, (%rcx)
  8010e6: 0f be c0                     	movsbl	%al, %eax
  8010e9: 83 f8 00                     	cmpl	$0, %eax
  8010ec: 0f 84 05 00 00 00            	je	0x8010f7 <strcpy+0x47>
  8010f2: e9 cd ff ff ff               	jmp	0x8010c4 <strcpy+0x14>
; 	return ret;
  8010f7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8010fb: 5d                           	popq	%rbp
  8010fc: c3                           	retq
  8010fd: 0f 1f 00                     	nopl	(%rax)

0000000000801100 <strcat>:
; {
  801100: 55                           	pushq	%rbp
  801101: 48 89 e5                     	movq	%rsp, %rbp
  801104: 48 83 ec 20                  	subq	$32, %rsp
  801108: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80110c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  801110: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801114: e8 e7 fe ff ff               	callq	0x801000 <strlen>
  801119: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  80111c: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801120: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  801124: 48 01 c7                     	addq	%rax, %rdi
  801127: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80112b: e8 80 ff ff ff               	callq	0x8010b0 <strcpy>
; 	return dst;
  801130: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801134: 48 83 c4 20                  	addq	$32, %rsp
  801138: 5d                           	popq	%rbp
  801139: c3                           	retq
  80113a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000801140 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  801140: 55                           	pushq	%rbp
  801141: 48 89 e5                     	movq	%rsp, %rbp
  801144: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801148: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80114c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  801150: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801154: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  801158: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  801160: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801164: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  801168: 0f 83 49 00 00 00            	jae	0x8011b7 <strncpy+0x77>
; 		*dst++ = *src;
  80116e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801172: 8a 08                        	movb	(%rax), %cl
  801174: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801178: 48 89 c2                     	movq	%rax, %rdx
  80117b: 48 83 c2 01                  	addq	$1, %rdx
  80117f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801183: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801185: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801189: 0f be 00                     	movsbl	(%rax), %eax
  80118c: 83 f8 00                     	cmpl	$0, %eax
  80118f: 0f 84 0c 00 00 00            	je	0x8011a1 <strncpy+0x61>
; 			src++;
  801195: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801199: 48 83 c0 01                  	addq	$1, %rax
  80119d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  8011a1: e9 00 00 00 00               	jmp	0x8011a6 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  8011a6: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8011aa: 48 83 c0 01                  	addq	$1, %rax
  8011ae: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8011b2: e9 a9 ff ff ff               	jmp	0x801160 <strncpy+0x20>
; 	return ret;
  8011b7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8011bb: 5d                           	popq	%rbp
  8011bc: c3                           	retq
  8011bd: 0f 1f 00                     	nopl	(%rax)

00000000008011c0 <strlcpy>:
; {
  8011c0: 55                           	pushq	%rbp
  8011c1: 48 89 e5                     	movq	%rsp, %rbp
  8011c4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011c8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8011cc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  8011d0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011d4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  8011d8: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  8011dd: 0f 86 6e 00 00 00            	jbe	0x801251 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  8011e3: e9 00 00 00 00               	jmp	0x8011e8 <strlcpy+0x28>
  8011e8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011ec: 48 83 c1 ff                  	addq	$-1, %rcx
  8011f0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8011f4: 31 c0                        	xorl	%eax, %eax
  8011f6: 48 83 f9 00                  	cmpq	$0, %rcx
  8011fa: 88 45 df                     	movb	%al, -33(%rbp)
  8011fd: 0f 86 10 00 00 00            	jbe	0x801213 <strlcpy+0x53>
  801203: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801207: 0f be 00                     	movsbl	(%rax), %eax
  80120a: 83 f8 00                     	cmpl	$0, %eax
  80120d: 0f 95 c0                     	setne	%al
  801210: 88 45 df                     	movb	%al, -33(%rbp)
  801213: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801216: a8 01                        	testb	$1, %al
  801218: 0f 85 05 00 00 00            	jne	0x801223 <strlcpy+0x63>
  80121e: e9 27 00 00 00               	jmp	0x80124a <strlcpy+0x8a>
; 			*dst++ = *src++;
  801223: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801227: 48 89 c1                     	movq	%rax, %rcx
  80122a: 48 83 c1 01                  	addq	$1, %rcx
  80122e: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801232: 8a 08                        	movb	(%rax), %cl
  801234: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801238: 48 89 c2                     	movq	%rax, %rdx
  80123b: 48 83 c2 01                  	addq	$1, %rdx
  80123f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801243: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801245: e9 9e ff ff ff               	jmp	0x8011e8 <strlcpy+0x28>
; 		*dst = '\0';
  80124a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80124e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801251: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801255: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801259: 48 29 c8                     	subq	%rcx, %rax
  80125c: 5d                           	popq	%rbp
  80125d: c3                           	retq
  80125e: 66 90                        	nop

0000000000801260 <strcmp>:
; {
  801260: 55                           	pushq	%rbp
  801261: 48 89 e5                     	movq	%rsp, %rbp
  801264: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801268: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80126c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801270: 0f be 08                     	movsbl	(%rax), %ecx
  801273: 31 c0                        	xorl	%eax, %eax
  801275: 83 f9 00                     	cmpl	$0, %ecx
  801278: 88 45 ef                     	movb	%al, -17(%rbp)
  80127b: 0f 84 16 00 00 00            	je	0x801297 <strcmp+0x37>
  801281: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801285: 0f be 00                     	movsbl	(%rax), %eax
  801288: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80128c: 0f be 09                     	movsbl	(%rcx), %ecx
  80128f: 39 c8                        	cmpl	%ecx, %eax
  801291: 0f 94 c0                     	sete	%al
  801294: 88 45 ef                     	movb	%al, -17(%rbp)
  801297: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80129a: a8 01                        	testb	$1, %al
  80129c: 0f 85 05 00 00 00            	jne	0x8012a7 <strcmp+0x47>
  8012a2: e9 1d 00 00 00               	jmp	0x8012c4 <strcmp+0x64>
; 		p++, q++;
  8012a7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012ab: 48 83 c0 01                  	addq	$1, %rax
  8012af: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8012b3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012b7: 48 83 c0 01                  	addq	$1, %rax
  8012bb: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  8012bf: e9 a8 ff ff ff               	jmp	0x80126c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  8012c4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012c8: 0f b6 00                     	movzbl	(%rax), %eax
  8012cb: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8012cf: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012d2: 29 c8                        	subl	%ecx, %eax
  8012d4: 5d                           	popq	%rbp
  8012d5: c3                           	retq
  8012d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008012e0 <strncmp>:
; {
  8012e0: 55                           	pushq	%rbp
  8012e1: 48 89 e5                     	movq	%rsp, %rbp
  8012e4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012e8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8012ec: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012f0: 31 c0                        	xorl	%eax, %eax
  8012f2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012f7: 88 45 df                     	movb	%al, -33(%rbp)
  8012fa: 0f 86 2b 00 00 00            	jbe	0x80132b <strncmp+0x4b>
  801300: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801304: 0f be 08                     	movsbl	(%rax), %ecx
  801307: 31 c0                        	xorl	%eax, %eax
  801309: 83 f9 00                     	cmpl	$0, %ecx
  80130c: 88 45 df                     	movb	%al, -33(%rbp)
  80130f: 0f 84 16 00 00 00            	je	0x80132b <strncmp+0x4b>
  801315: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801319: 0f be 00                     	movsbl	(%rax), %eax
  80131c: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801320: 0f be 09                     	movsbl	(%rcx), %ecx
  801323: 39 c8                        	cmpl	%ecx, %eax
  801325: 0f 94 c0                     	sete	%al
  801328: 88 45 df                     	movb	%al, -33(%rbp)
  80132b: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80132e: a8 01                        	testb	$1, %al
  801330: 0f 85 05 00 00 00            	jne	0x80133b <strncmp+0x5b>
  801336: e9 29 00 00 00               	jmp	0x801364 <strncmp+0x84>
; 		n--, p++, q++;
  80133b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80133f: 48 83 c0 ff                  	addq	$-1, %rax
  801343: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801347: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80134b: 48 83 c0 01                  	addq	$1, %rax
  80134f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801353: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801357: 48 83 c0 01                  	addq	$1, %rax
  80135b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80135f: e9 8c ff ff ff               	jmp	0x8012f0 <strncmp+0x10>
; 	if (n == 0)
  801364: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801369: 0f 85 0c 00 00 00            	jne	0x80137b <strncmp+0x9b>
; 		return 0;
  80136f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801376: e9 13 00 00 00               	jmp	0x80138e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80137b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80137f: 0f b6 00                     	movzbl	(%rax), %eax
  801382: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801386: 0f b6 09                     	movzbl	(%rcx), %ecx
  801389: 29 c8                        	subl	%ecx, %eax
  80138b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80138e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801391: 5d                           	popq	%rbp
  801392: c3                           	retq
  801393: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80139d: 0f 1f 00                     	nopl	(%rax)

00000000008013a0 <strchr>:
; {
  8013a0: 55                           	pushq	%rbp
  8013a1: 48 89 e5                     	movq	%rsp, %rbp
  8013a4: 40 88 f0                     	movb	%sil, %al
  8013a7: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8013ab: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  8013ae: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013b2: 80 38 00                     	cmpb	$0, (%rax)
  8013b5: 0f 84 36 00 00 00            	je	0x8013f1 <strchr+0x51>
; 		if (*s == c)
  8013bb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013bf: 0f be 00                     	movsbl	(%rax), %eax
  8013c2: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  8013c6: 39 c8                        	cmpl	%ecx, %eax
  8013c8: 0f 85 0d 00 00 00            	jne	0x8013db <strchr+0x3b>
; 			return (char *) s;
  8013ce: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013d2: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013d6: e9 1e 00 00 00               	jmp	0x8013f9 <strchr+0x59>
; 		if (*s == c)
  8013db: e9 00 00 00 00               	jmp	0x8013e0 <strchr+0x40>
; 	for (; *s; s++)
  8013e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013e4: 48 83 c0 01                  	addq	$1, %rax
  8013e8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8013ec: e9 bd ff ff ff               	jmp	0x8013ae <strchr+0xe>
; 	return 0;
  8013f1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8013f9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013fd: 5d                           	popq	%rbp
  8013fe: c3                           	retq
  8013ff: 90                           	nop

0000000000801400 <strfind>:
; {
  801400: 55                           	pushq	%rbp
  801401: 48 89 e5                     	movq	%rsp, %rbp
  801404: 40 88 f0                     	movb	%sil, %al
  801407: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80140b: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  80140e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801412: 80 38 00                     	cmpb	$0, (%rax)
  801415: 0f 84 2e 00 00 00            	je	0x801449 <strfind+0x49>
; 		if (*s == c)
  80141b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80141f: 0f be 00                     	movsbl	(%rax), %eax
  801422: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  801426: 39 c8                        	cmpl	%ecx, %eax
  801428: 0f 85 05 00 00 00            	jne	0x801433 <strfind+0x33>
; 			break;
  80142e: e9 16 00 00 00               	jmp	0x801449 <strfind+0x49>
; 		if (*s == c)
  801433: e9 00 00 00 00               	jmp	0x801438 <strfind+0x38>
; 	for (; *s; s++)
  801438: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80143c: 48 83 c0 01                  	addq	$1, %rax
  801440: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801444: e9 c5 ff ff ff               	jmp	0x80140e <strfind+0xe>
; 	return (char *) s;
  801449: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80144d: 5d                           	popq	%rbp
  80144e: c3                           	retq
  80144f: 90                           	nop

0000000000801450 <memset>:
; {
  801450: 55                           	pushq	%rbp
  801451: 48 89 e5                     	movq	%rsp, %rbp
  801454: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801458: 89 75 ec                     	movl	%esi, -20(%rbp)
  80145b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80145f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801464: 0f 85 0d 00 00 00            	jne	0x801477 <memset+0x27>
; 		return v;
  80146a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80146e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801472: e9 78 00 00 00               	jmp	0x8014ef <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801477: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80147b: 48 83 e0 03                  	andq	$3, %rax
  80147f: 48 83 f8 00                  	cmpq	$0, %rax
  801483: 0f 85 50 00 00 00            	jne	0x8014d9 <memset+0x89>
  801489: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80148d: 48 83 e0 03                  	andq	$3, %rax
  801491: 48 83 f8 00                  	cmpq	$0, %rax
  801495: 0f 85 3e 00 00 00            	jne	0x8014d9 <memset+0x89>
; 		c &= 0xFF;
  80149b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80149e: 25 ff 00 00 00               	andl	$255, %eax
  8014a3: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  8014a6: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014a9: c1 e0 18                     	shll	$24, %eax
  8014ac: 8b 4d ec                     	movl	-20(%rbp), %ecx
  8014af: c1 e1 10                     	shll	$16, %ecx
  8014b2: 09 c8                        	orl	%ecx, %eax
  8014b4: 8b 4d ec                     	movl	-20(%rbp), %ecx
  8014b7: c1 e1 08                     	shll	$8, %ecx
  8014ba: 09 c8                        	orl	%ecx, %eax
  8014bc: 0b 45 ec                     	orl	-20(%rbp), %eax
  8014bf: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  8014c2: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014c6: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014c9: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8014cd: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  8014d1: fc                           	cld
  8014d2: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  8014d4: e9 0e 00 00 00               	jmp	0x8014e7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  8014d9: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8014dd: 8b 45 ec                     	movl	-20(%rbp), %eax
  8014e0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8014e4: fc                           	cld
  8014e5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8014e7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8014eb: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8014ef: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014f3: 5d                           	popq	%rbp
  8014f4: c3                           	retq
  8014f5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014ff: 90                           	nop

0000000000801500 <memmove>:
; {
  801500: 55                           	pushq	%rbp
  801501: 48 89 e5                     	movq	%rsp, %rbp
  801504: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801508: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80150c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  801510: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801514: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  801518: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80151c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  801520: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801524: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  801528: 0f 83 9d 00 00 00            	jae	0x8015cb <memmove+0xcb>
  80152e: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801532: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801536: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80153a: 0f 86 8b 00 00 00            	jbe	0x8015cb <memmove+0xcb>
; 		s += n;
  801540: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801544: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801548: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80154c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801550: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801554: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801558: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80155c: 48 83 e0 03                  	andq	$3, %rax
  801560: 48 83 f8 00                  	cmpq	$0, %rax
  801564: 0f 85 44 00 00 00            	jne	0x8015ae <memmove+0xae>
  80156a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80156e: 48 83 e0 03                  	andq	$3, %rax
  801572: 48 83 f8 00                  	cmpq	$0, %rax
  801576: 0f 85 32 00 00 00            	jne	0x8015ae <memmove+0xae>
  80157c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801580: 48 83 e0 03                  	andq	$3, %rax
  801584: 48 83 f8 00                  	cmpq	$0, %rax
  801588: 0f 85 20 00 00 00            	jne	0x8015ae <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80158e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801592: 48 83 c7 fc                  	addq	$-4, %rdi
  801596: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80159a: 48 83 c6 fc                  	addq	$-4, %rsi
  80159e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8015a2: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  8015a6: fd                           	std
  8015a7: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8015a9: e9 17 00 00 00               	jmp	0x8015c5 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  8015ae: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8015b2: 48 83 c7 ff                  	addq	$-1, %rdi
  8015b6: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8015ba: 48 83 c6 ff                  	addq	$-1, %rsi
  8015be: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  8015c2: fd                           	std
  8015c3: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  8015c5: fc                           	cld
; 	} else {
  8015c6: e9 62 00 00 00               	jmp	0x80162d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8015cb: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8015cf: 48 83 e0 03                  	andq	$3, %rax
  8015d3: 48 83 f8 00                  	cmpq	$0, %rax
  8015d7: 0f 85 3c 00 00 00            	jne	0x801619 <memmove+0x119>
  8015dd: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8015e1: 48 83 e0 03                  	andq	$3, %rax
  8015e5: 48 83 f8 00                  	cmpq	$0, %rax
  8015e9: 0f 85 2a 00 00 00            	jne	0x801619 <memmove+0x119>
  8015ef: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015f3: 48 83 e0 03                  	andq	$3, %rax
  8015f7: 48 83 f8 00                  	cmpq	$0, %rax
  8015fb: 0f 85 18 00 00 00            	jne	0x801619 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  801601: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801605: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801609: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80160d: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801611: fc                           	cld
  801612: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801614: e9 0f 00 00 00               	jmp	0x801628 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801619: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  80161d: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801621: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801625: fc                           	cld
  801626: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801628: e9 00 00 00 00               	jmp	0x80162d <memmove+0x12d>
; 	return dst;
  80162d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801631: 5d                           	popq	%rbp
  801632: c3                           	retq
  801633: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80163d: 0f 1f 00                     	nopl	(%rax)

0000000000801640 <memcpy>:
; {
  801640: 55                           	pushq	%rbp
  801641: 48 89 e5                     	movq	%rsp, %rbp
  801644: 48 83 ec 20                  	subq	$32, %rsp
  801648: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80164c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801650: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801654: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801658: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80165c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801660: e8 9b fe ff ff               	callq	0x801500 <memmove>
  801665: 48 83 c4 20                  	addq	$32, %rsp
  801669: 5d                           	popq	%rbp
  80166a: c3                           	retq
  80166b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801670 <memcmp>:
; {
  801670: 55                           	pushq	%rbp
  801671: 48 89 e5                     	movq	%rsp, %rbp
  801674: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801678: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80167c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801680: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801684: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801688: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80168c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801690: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801694: 48 89 c1                     	movq	%rax, %rcx
  801697: 48 83 c1 ff                  	addq	$-1, %rcx
  80169b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80169f: 48 83 f8 00                  	cmpq	$0, %rax
  8016a3: 0f 86 4b 00 00 00            	jbe	0x8016f4 <memcmp+0x84>
; 		if (*s1 != *s2)
  8016a9: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016ad: 0f b6 00                     	movzbl	(%rax), %eax
  8016b0: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  8016b4: 0f b6 09                     	movzbl	(%rcx), %ecx
  8016b7: 39 c8                        	cmpl	%ecx, %eax
  8016b9: 0f 84 18 00 00 00            	je	0x8016d7 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  8016bf: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016c3: 0f b6 00                     	movzbl	(%rax), %eax
  8016c6: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  8016ca: 0f b6 09                     	movzbl	(%rcx), %ecx
  8016cd: 29 c8                        	subl	%ecx, %eax
  8016cf: 89 45 fc                     	movl	%eax, -4(%rbp)
  8016d2: e9 24 00 00 00               	jmp	0x8016fb <memcmp+0x8b>
; 		s1++, s2++;
  8016d7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8016db: 48 83 c0 01                  	addq	$1, %rax
  8016df: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8016e3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8016e7: 48 83 c0 01                  	addq	$1, %rax
  8016eb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8016ef: e9 9c ff ff ff               	jmp	0x801690 <memcmp+0x20>
; 	return 0;
  8016f4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8016fb: 8b 45 fc                     	movl	-4(%rbp), %eax
  8016fe: 5d                           	popq	%rbp
  8016ff: c3                           	retq

0000000000801700 <memfind>:
; {
  801700: 55                           	pushq	%rbp
  801701: 48 89 e5                     	movq	%rsp, %rbp
  801704: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801708: 89 75 f4                     	movl	%esi, -12(%rbp)
  80170b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  80170f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801713: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801717: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  80171b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80171f: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  801723: 0f 83 30 00 00 00            	jae	0x801759 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801729: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80172d: 0f b6 00                     	movzbl	(%rax), %eax
  801730: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801733: 0f b6 c9                     	movzbl	%cl, %ecx
  801736: 39 c8                        	cmpl	%ecx, %eax
  801738: 0f 85 05 00 00 00            	jne	0x801743 <memfind+0x43>
; 			break;
  80173e: e9 16 00 00 00               	jmp	0x801759 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801743: e9 00 00 00 00               	jmp	0x801748 <memfind+0x48>
; 	for (; s < ends; s++)
  801748: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80174c: 48 83 c0 01                  	addq	$1, %rax
  801750: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801754: e9 c2 ff ff ff               	jmp	0x80171b <memfind+0x1b>
; 	return (void *) s;
  801759: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80175d: 5d                           	popq	%rbp
  80175e: c3                           	retq
  80175f: 90                           	nop

0000000000801760 <strtol>:
; {
  801760: 55                           	pushq	%rbp
  801761: 48 89 e5                     	movq	%rsp, %rbp
  801764: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801768: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80176c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80176f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801776: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80177e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801782: 0f be 08                     	movsbl	(%rax), %ecx
  801785: b0 01                        	movb	$1, %al
  801787: 83 f9 20                     	cmpl	$32, %ecx
  80178a: 88 45 db                     	movb	%al, -37(%rbp)
  80178d: 0f 84 10 00 00 00            	je	0x8017a3 <strtol+0x43>
  801793: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801797: 0f be 00                     	movsbl	(%rax), %eax
  80179a: 83 f8 09                     	cmpl	$9, %eax
  80179d: 0f 94 c0                     	sete	%al
  8017a0: 88 45 db                     	movb	%al, -37(%rbp)
  8017a3: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  8017a6: a8 01                        	testb	$1, %al
  8017a8: 0f 85 05 00 00 00            	jne	0x8017b3 <strtol+0x53>
  8017ae: e9 11 00 00 00               	jmp	0x8017c4 <strtol+0x64>
; 		s++;
  8017b3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b7: 48 83 c0 01                  	addq	$1, %rax
  8017bb: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8017bf: e9 ba ff ff ff               	jmp	0x80177e <strtol+0x1e>
; 	if (*s == '+')
  8017c4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017c8: 0f be 00                     	movsbl	(%rax), %eax
  8017cb: 83 f8 2b                     	cmpl	$43, %eax
  8017ce: 0f 85 11 00 00 00            	jne	0x8017e5 <strtol+0x85>
; 		s++;
  8017d4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017d8: 48 83 c0 01                  	addq	$1, %rax
  8017dc: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017e0: e9 28 00 00 00               	jmp	0x80180d <strtol+0xad>
; 	else if (*s == '-')
  8017e5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017e9: 0f be 00                     	movsbl	(%rax), %eax
  8017ec: 83 f8 2d                     	cmpl	$45, %eax
  8017ef: 0f 85 13 00 00 00            	jne	0x801808 <strtol+0xa8>
; 		s++, neg = 1;
  8017f5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017f9: 48 83 c0 01                  	addq	$1, %rax
  8017fd: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801801: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  801808: e9 00 00 00 00               	jmp	0x80180d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  80180d: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801811: 0f 84 0a 00 00 00            	je	0x801821 <strtol+0xc1>
  801817: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  80181b: 0f 85 39 00 00 00            	jne	0x80185a <strtol+0xfa>
  801821: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801825: 0f be 00                     	movsbl	(%rax), %eax
  801828: 83 f8 30                     	cmpl	$48, %eax
  80182b: 0f 85 29 00 00 00            	jne	0x80185a <strtol+0xfa>
  801831: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801835: 0f be 40 01                  	movsbl	1(%rax), %eax
  801839: 83 f8 78                     	cmpl	$120, %eax
  80183c: 0f 85 18 00 00 00            	jne	0x80185a <strtol+0xfa>
; 		s += 2, base = 16;
  801842: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801846: 48 83 c0 02                  	addq	$2, %rax
  80184a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80184e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801855: e9 4d 00 00 00               	jmp	0x8018a7 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80185a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80185e: 0f 85 28 00 00 00            	jne	0x80188c <strtol+0x12c>
  801864: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801868: 0f be 00                     	movsbl	(%rax), %eax
  80186b: 83 f8 30                     	cmpl	$48, %eax
  80186e: 0f 85 18 00 00 00            	jne	0x80188c <strtol+0x12c>
; 		s++, base = 8;
  801874: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801878: 48 83 c0 01                  	addq	$1, %rax
  80187c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801880: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801887: e9 16 00 00 00               	jmp	0x8018a2 <strtol+0x142>
; 	else if (base == 0)
  80188c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801890: 0f 85 07 00 00 00            	jne	0x80189d <strtol+0x13d>
; 		base = 10;
  801896: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80189d: e9 00 00 00 00               	jmp	0x8018a2 <strtol+0x142>
  8018a2: e9 00 00 00 00               	jmp	0x8018a7 <strtol+0x147>
; 	while (1) {
  8018a7: e9 00 00 00 00               	jmp	0x8018ac <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  8018ac: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018b0: 0f be 00                     	movsbl	(%rax), %eax
  8018b3: 83 f8 30                     	cmpl	$48, %eax
  8018b6: 0f 8c 22 00 00 00            	jl	0x8018de <strtol+0x17e>
  8018bc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018c0: 0f be 00                     	movsbl	(%rax), %eax
  8018c3: 83 f8 39                     	cmpl	$57, %eax
  8018c6: 0f 8f 12 00 00 00            	jg	0x8018de <strtol+0x17e>
; 			dig = *s - '0';
  8018cc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018d0: 0f be 00                     	movsbl	(%rax), %eax
  8018d3: 83 e8 30                     	subl	$48, %eax
  8018d6: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018d9: e9 79 00 00 00               	jmp	0x801957 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  8018de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018e2: 0f be 00                     	movsbl	(%rax), %eax
  8018e5: 83 f8 61                     	cmpl	$97, %eax
  8018e8: 0f 8c 25 00 00 00            	jl	0x801913 <strtol+0x1b3>
  8018ee: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018f2: 0f be 00                     	movsbl	(%rax), %eax
  8018f5: 83 f8 7a                     	cmpl	$122, %eax
  8018f8: 0f 8f 15 00 00 00            	jg	0x801913 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8018fe: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801902: 0f be 00                     	movsbl	(%rax), %eax
  801905: 83 e8 61                     	subl	$97, %eax
  801908: 83 c0 0a                     	addl	$10, %eax
  80190b: 89 45 dc                     	movl	%eax, -36(%rbp)
  80190e: e9 3f 00 00 00               	jmp	0x801952 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801913: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801917: 0f be 00                     	movsbl	(%rax), %eax
  80191a: 83 f8 41                     	cmpl	$65, %eax
  80191d: 0f 8c 25 00 00 00            	jl	0x801948 <strtol+0x1e8>
  801923: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801927: 0f be 00                     	movsbl	(%rax), %eax
  80192a: 83 f8 5a                     	cmpl	$90, %eax
  80192d: 0f 8f 15 00 00 00            	jg	0x801948 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801933: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801937: 0f be 00                     	movsbl	(%rax), %eax
  80193a: 83 e8 41                     	subl	$65, %eax
  80193d: 83 c0 0a                     	addl	$10, %eax
  801940: 89 45 dc                     	movl	%eax, -36(%rbp)
  801943: e9 05 00 00 00               	jmp	0x80194d <strtol+0x1ed>
; 			break;
  801948: e9 43 00 00 00               	jmp	0x801990 <strtol+0x230>
  80194d: e9 00 00 00 00               	jmp	0x801952 <strtol+0x1f2>
  801952: e9 00 00 00 00               	jmp	0x801957 <strtol+0x1f7>
; 		if (dig >= base)
  801957: 8b 45 dc                     	movl	-36(%rbp), %eax
  80195a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80195d: 0f 8c 05 00 00 00            	jl	0x801968 <strtol+0x208>
; 			break;
  801963: e9 28 00 00 00               	jmp	0x801990 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801968: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80196c: 48 83 c0 01                  	addq	$1, %rax
  801970: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801974: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801978: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80197c: 48 0f af c1                  	imulq	%rcx, %rax
  801980: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801984: 48 01 c8                     	addq	%rcx, %rax
  801987: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80198b: e9 1c ff ff ff               	jmp	0x8018ac <strtol+0x14c>
; 	if (endptr)
  801990: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801995: 0f 84 0b 00 00 00            	je	0x8019a6 <strtol+0x246>
; 		*endptr = (char *) s;
  80199b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80199f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8019a3: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  8019a6: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  8019aa: 0f 84 0f 00 00 00            	je	0x8019bf <strtol+0x25f>
  8019b0: 31 c0                        	xorl	%eax, %eax
  8019b2: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  8019b6: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  8019ba: e9 08 00 00 00               	jmp	0x8019c7 <strtol+0x267>
  8019bf: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8019c3: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  8019c7: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  8019cb: 5d                           	popq	%rbp
  8019cc: c3                           	retq
