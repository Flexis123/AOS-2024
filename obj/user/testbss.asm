
obj/user/testbss:	file format elf64-x86-64

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
  800042: e8 e9 00 00 00               	callq	0x800130 <libmain>
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
  800054: 41 56                        	pushq	%r14
  800056: 53                           	pushq	%rbx
; 	printf("Making sure bss works right...\n");
  800057: 48 8d 3d 15 10 00 00         	leaq	4117(%rip), %rdi        # 0x801073 <testbss.c+0x801073>
  80005e: 31 db                        	xorl	%ebx, %ebx
; 	printf("Making sure bss works right...\n");
  800060: 31 c0                        	xorl	%eax, %eax
  800062: e8 39 02 00 00               	callq	0x8002a0 <printf>
  800067: 4c 8d 35 92 2f 00 00         	leaq	12178(%rip), %r14       # 0x803000 <big_array>
  80006e: 66 90                        	nop
; 		if (big_array[i] != 0) {
  800070: 41 83 3c 9e 00               	cmpl	$0, (%r14,%rbx,4)
  800075: 0f 85 7e 00 00 00            	jne	0x8000f9 <main+0xa9>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  80007b: 48 83 c3 01                  	addq	$1, %rbx
  80007f: 48 81 fb 00 00 10 00         	cmpq	$1048576, %rbx          # imm = 0x100000
  800086: 75 e8                        	jne	0x800070 <main+0x20>
  800088: 31 c0                        	xorl	%eax, %eax
  80008a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 		big_array[i] = i;
  800090: 41 89 04 86                  	movl	%eax, (%r14,%rax,4)
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  800094: 48 83 c0 01                  	addq	$1, %rax
  800098: 48 3d 00 00 10 00            	cmpq	$1048576, %rax          # imm = 0x100000
  80009e: 75 f0                        	jne	0x800090 <main+0x40>
  8000a0: 31 c9                        	xorl	%ecx, %ecx
  8000a2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8000ac: 0f 1f 40 00                  	nopl	(%rax)
; 		if (big_array[i] != i) {
  8000b0: 41 8b 04 8e                  	movl	(%r14,%rcx,4), %eax
  8000b4: 48 39 c1                     	cmpq	%rax, %rcx
  8000b7: 75 5c                        	jne	0x800115 <main+0xc5>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000b9: 48 83 c1 01                  	addq	$1, %rcx
  8000bd: 48 81 f9 00 00 10 00         	cmpq	$1048576, %rcx          # imm = 0x100000
  8000c4: 75 ea                        	jne	0x8000b0 <main+0x60>
; 	printf("Yes, good. Now doing a wild write off the end...\n");
  8000c6: 48 8d 3d 2f 10 00 00         	leaq	4143(%rip), %rdi        # 0x8010fc <testbss.c+0x8010fc>
  8000cd: 31 c0                        	xorl	%eax, %eax
  8000cf: e8 cc 01 00 00               	callq	0x8002a0 <printf>
; 	big_array[ARRAY_SIZE + 1024] = 0;
  8000d4: 41 c7 86 00 10 40 00 00 00 00 00     	movl	$0, 4198400(%r14)
; 	panic("Why are we still here?");
  8000df: 48 8d 3d 07 10 00 00         	leaq	4103(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  8000e6: 48 8d 15 2e 0f 00 00         	leaq	3886(%rip), %rdx        # 0x80101b <testbss.c+0x80101b>
  8000ed: be 20 00 00 00               	movl	$32, %esi
  8000f2: 31 c0                        	xorl	%eax, %eax
  8000f4: e8 77 00 00 00               	callq	0x800170 <_panic>
; 			panic("big_array[%d] isn't cleared!\n", i);
  8000f9: 48 8d 3d ed 0f 00 00         	leaq	4077(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  800100: 48 8d 15 8c 0f 00 00         	leaq	3980(%rip), %rdx        # 0x801093 <testbss.c+0x801093>
  800107: be 10 00 00 00               	movl	$16, %esi
  80010c: 89 d9                        	movl	%ebx, %ecx
  80010e: 31 c0                        	xorl	%eax, %eax
  800110: e8 5b 00 00 00               	callq	0x800170 <_panic>
; 			panic("big_array[%d] didn't hold its value!\n", i);
  800115: 48 8d 3d d1 0f 00 00         	leaq	4049(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  80011c: 48 8d 15 4f 10 00 00         	leaq	4175(%rip), %rdx        # 0x801172 <testbss.c+0x801172>
  800123: be 1a 00 00 00               	movl	$26, %esi
  800128: 31 c0                        	xorl	%eax, %eax
  80012a: e8 41 00 00 00               	callq	0x800170 <_panic>
  80012f: cc                           	int3

0000000000800130 <libmain>:
; {
  800130: 55                           	pushq	%rbp
  800131: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800134: 85 ff                        	testl	%edi, %edi
  800136: 7e 0d                        	jle	0x800145 <libmain+0x15>
; 		binary_name = argv[0];
  800138: 48 8b 06                     	movq	(%rsi), %rax
  80013b: 48 8d 0d be 1e 00 00         	leaq	7870(%rip), %rcx        # 0x802000 <binary_name>
  800142: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800145: e8 06 ff ff ff               	callq	0x800050 <main>
; 	exit();
  80014a: e8 11 00 00 00               	callq	0x800160 <exit>
; }
  80014f: 5d                           	popq	%rbp
  800150: c3                           	retq
  800151: cc                           	int3
  800152: cc                           	int3
  800153: cc                           	int3
  800154: cc                           	int3
  800155: cc                           	int3
  800156: cc                           	int3
  800157: cc                           	int3
  800158: cc                           	int3
  800159: cc                           	int3
  80015a: cc                           	int3
  80015b: cc                           	int3
  80015c: cc                           	int3
  80015d: cc                           	int3
  80015e: cc                           	int3
  80015f: cc                           	int3

0000000000800160 <exit>:
; {
  800160: 55                           	pushq	%rbp
  800161: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  800164: 31 ff                        	xorl	%edi, %edi
  800166: e8 55 0d 00 00               	callq	0x800ec0 <kill>
; }
  80016b: 5d                           	popq	%rbp
  80016c: c3                           	retq
  80016d: cc                           	int3
  80016e: cc                           	int3
  80016f: cc                           	int3

0000000000800170 <_panic>:
; {
  800170: 55                           	pushq	%rbp
  800171: 48 89 e5                     	movq	%rsp, %rbp
  800174: 41 57                        	pushq	%r15
  800176: 41 56                        	pushq	%r14
  800178: 53                           	pushq	%rbx
  800179: 48 83 ec 48                  	subq	$72, %rsp
  80017d: 49 89 d6                     	movq	%rdx, %r14
  800180: 41 89 f7                     	movl	%esi, %r15d
  800183: 48 89 fb                     	movq	%rdi, %rbx
  800186: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80018a: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  80018e: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800192: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800196: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80019a: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80019e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8001a2: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  8001ac: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 		getpid(), binary_name, file, line);
  8001b0: e8 2b 0d 00 00               	callq	0x800ee0 <getpid>
  8001b5: 48 8d 0d 44 1e 00 00         	leaq	7748(%rip), %rcx        # 0x802000 <binary_name>
  8001bc: 48 8b 11                     	movq	(%rcx), %rdx
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8001bf: 48 8d 3d 6f 0e 00 00         	leaq	3695(%rip), %rdi        # 0x801035 <testbss.c+0x801035>
  8001c6: 89 c6                        	movl	%eax, %esi
  8001c8: 48 89 d9                     	movq	%rbx, %rcx
  8001cb: 45 89 f8                     	movl	%r15d, %r8d
  8001ce: 31 c0                        	xorl	%eax, %eax
  8001d0: e8 cb 00 00 00               	callq	0x8002a0 <printf>
  8001d5: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
; 	vprintf(fmt, ap);
  8001d9: 4c 89 f7                     	movq	%r14, %rdi
  8001dc: e8 1f 00 00 00               	callq	0x800200 <vprintf>
; 	printf("\n");
  8001e1: 48 8d 3d 46 0f 00 00         	leaq	3910(%rip), %rdi        # 0x80112e <testbss.c+0x80112e>
  8001e8: 31 c0                        	xorl	%eax, %eax
  8001ea: e8 b1 00 00 00               	callq	0x8002a0 <printf>
  8001ef: 90                           	nop
; 		asm volatile("int3");
  8001f0: cc                           	int3
; 	while (1) {
  8001f1: eb fd                        	jmp	0x8001f0 <_panic+0x80>
  8001f3: cc                           	int3
  8001f4: cc                           	int3
  8001f5: cc                           	int3
  8001f6: cc                           	int3
  8001f7: cc                           	int3
  8001f8: cc                           	int3
  8001f9: cc                           	int3
  8001fa: cc                           	int3
  8001fb: cc                           	int3
  8001fc: cc                           	int3
  8001fd: cc                           	int3
  8001fe: cc                           	int3
  8001ff: cc                           	int3

0000000000800200 <vprintf>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  80020b: 48 89 f1                     	movq	%rsi, %rcx
  80020e: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  800211: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80021c: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x800260 <putch>
  800223: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80022a: e8 c1 00 00 00               	callq	0x8002f0 <vprintfmt>
; 	puts(b.buf, b.idx);
  80022f: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  800236: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  80023d: e8 0e 0c 00 00               	callq	0x800e50 <puts>
; 	return b.cnt;
  800242: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  800248: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  80024f: 5d                           	popq	%rbp
  800250: c3                           	retq
  800251: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80025b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800260 <putch>:
; {
  800260: 55                           	pushq	%rbp
  800261: 48 89 e5                     	movq	%rsp, %rbp
  800264: 53                           	pushq	%rbx
  800265: 50                           	pushq	%rax
  800266: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  800269: 48 63 06                     	movslq	(%rsi), %rax
  80026c: 8d 48 01                     	leal	1(%rax), %ecx
  80026f: 89 0e                        	movl	%ecx, (%rsi)
  800271: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  800276: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  80027c: 75 14                        	jne	0x800292 <putch+0x32>
; 		puts(b->buf, b->idx);
  80027e: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  800282: be ff 00 00 00               	movl	$255, %esi
  800287: e8 c4 0b 00 00               	callq	0x800e50 <puts>
; 		b->idx = 0;
  80028c: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800292: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800296: 48 83 c4 08                  	addq	$8, %rsp
  80029a: 5b                           	popq	%rbx
  80029b: 5d                           	popq	%rbp
  80029c: c3                           	retq
  80029d: 0f 1f 00                     	nopl	(%rax)

00000000008002a0 <printf>:
; {
  8002a0: 55                           	pushq	%rbp
  8002a1: 48 89 e5                     	movq	%rsp, %rbp
  8002a4: 48 83 ec 50                  	subq	$80, %rsp
  8002a8: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  8002ac: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  8002b0: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8002b4: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8002b8: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8002bc: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8002c0: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8002c4: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8002c8: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8002cc: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  8002d6: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8002da: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  8002de: e8 1d ff ff ff               	callq	0x800200 <vprintf>
; 	return cnt;
  8002e3: 48 83 c4 50                  	addq	$80, %rsp
  8002e7: 5d                           	popq	%rbp
  8002e8: c3                           	retq
  8002e9: cc                           	int3
  8002ea: cc                           	int3
  8002eb: cc                           	int3
  8002ec: cc                           	int3
  8002ed: cc                           	int3
  8002ee: cc                           	int3
  8002ef: cc                           	int3

00000000008002f0 <vprintfmt>:
; {
  8002f0: 55                           	pushq	%rbp
  8002f1: 48 89 e5                     	movq	%rsp, %rbp
  8002f4: 41 57                        	pushq	%r15
  8002f6: 41 56                        	pushq	%r14
  8002f8: 41 55                        	pushq	%r13
  8002fa: 41 54                        	pushq	%r12
  8002fc: 53                           	pushq	%rbx
  8002fd: 48 83 ec 38                  	subq	$56, %rsp
  800301: 48 89 d3                     	movq	%rdx, %rbx
  800304: 49 89 f6                     	movq	%rsi, %r14
  800307: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  80030a: 48 8b 41 10                  	movq	16(%rcx), %rax
  80030e: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800312: 48 8b 01                     	movq	(%rcx), %rax
  800315: 48 8b 49 08                  	movq	8(%rcx), %rcx
  800319: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80031d: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800321: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  800325: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  800329: eb 36                        	jmp	0x800361 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  80032b: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  80032f: e8 0c 05 00 00               	callq	0x800840 <getuint>
  800334: 49 89 c4                     	movq	%rax, %r12
  800337: 41 bf 10 00 00 00            	movl	$16, %r15d
  80033d: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  800341: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  800345: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  800349: 4c 89 e2                     	movq	%r12, %rdx
  80034c: 44 89 f9                     	movl	%r15d, %ecx
  80034f: 49 89 ff                     	movq	%rdi, %r15
  800352: 45 89 f0                     	movl	%r14d, %r8d
  800355: 49 89 f6                     	movq	%rsi, %r14
  800358: e8 63 05 00 00               	callq	0x8008c0 <printnum>
; 			break;
  80035d: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800361: 0f b6 3b                     	movzbl	(%rbx), %edi
  800364: 48 83 c3 01                  	addq	$1, %rbx
  800368: 83 ff 25                     	cmpl	$37, %edi
  80036b: 74 13                        	je	0x800380 <vprintfmt+0x90>
  80036d: 40 84 ff                     	testb	%dil, %dil
  800370: 0f 84 ea 03 00 00            	je	0x800760 <vprintfmt+0x470>
  800376: 4c 89 f6                     	movq	%r14, %rsi
  800379: 41 ff d7                     	callq	*%r15
  80037c: eb e3                        	jmp	0x800361 <vprintfmt+0x71>
  80037e: 66 90                        	nop
  800380: 41 b5 20                     	movb	$32, %r13b
  800383: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  800389: 31 f6                        	xorl	%esi, %esi
  80038b: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  80038f: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800395: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80039c: 48 8d 3d 01 0e 00 00         	leaq	3585(%rip), %rdi        # 0x8011a4 <testbss.c+0x8011a4>
; 		switch (ch = *(unsigned char *) fmt++) {
  8003a3: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  8003a7: eb 12                        	jmp	0x8003bb <vprintfmt+0xcb>
  8003a9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8003b0: 48 83 c3 01                  	addq	$1, %rbx
  8003b4: 49 83 c4 01                  	addq	$1, %r12
  8003b8: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  8003bb: 0f b6 0b                     	movzbl	(%rbx), %ecx
  8003be: 8d 51 dd                     	leal	-35(%rcx), %edx
  8003c1: 80 fa 55                     	cmpb	$85, %dl
  8003c4: 0f 87 21 01 00 00            	ja	0x8004eb <vprintfmt+0x1fb>
  8003ca: 0f b6 d2                     	movzbl	%dl, %edx
  8003cd: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  8003d1: 48 01 fa                     	addq	%rdi, %rdx
  8003d4: ff e2                        	jmpq	*%rdx
  8003d6: b1 30                        	movb	$48, %cl
  8003d8: eb d6                        	jmp	0x8003b0 <vprintfmt+0xc0>
  8003da: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8003e0: 0f b6 c9                     	movzbl	%cl, %ecx
  8003e3: 45 31 ff                     	xorl	%r15d, %r15d
  8003e6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  8003f0: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  8003f4: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  8003f8: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  8003fc: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  800400: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  800404: 8d 51 c6                     	leal	-58(%rcx), %edx
  800407: 80 fa f6                     	cmpb	$-10, %dl
  80040a: 73 e4                        	jae	0x8003f0 <vprintfmt+0x100>
; 			if (width < 0)
  80040c: 45 85 f6                     	testl	%r14d, %r14d
  80040f: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  800413: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  800418: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  80041c: eb 85                        	jmp	0x8003a3 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  80041e: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800422: 48 83 c3 01                  	addq	$1, %rbx
  800426: 48 83 f9 28                  	cmpq	$40, %rcx
  80042a: 77 3b                        	ja	0x800467 <vprintfmt+0x177>
  80042c: 48 89 ca                     	movq	%rcx, %rdx
  80042f: 48 01 c2                     	addq	%rax, %rdx
  800432: 83 c1 08                     	addl	$8, %ecx
  800435: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800438: 44 8b 3a                     	movl	(%rdx), %r15d
  80043b: eb cf                        	jmp	0x80040c <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  80043d: 48 83 c3 01                  	addq	$1, %rbx
  800441: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  800448: e9 56 ff ff ff               	jmp	0x8003a3 <vprintfmt+0xb3>
; 			if (width < 0)
  80044d: 45 85 f6                     	testl	%r14d, %r14d
  800450: b9 00 00 00 00               	movl	$0, %ecx
  800455: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  800459: eb 03                        	jmp	0x80045e <vprintfmt+0x16e>
; 			lflag++;
  80045b: 83 c6 01                     	addl	$1, %esi
  80045e: 48 83 c3 01                  	addq	$1, %rbx
  800462: e9 3c ff ff ff               	jmp	0x8003a3 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  800467: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80046b: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  80046f: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  800473: 44 8b 39                     	movl	(%rcx), %r15d
  800476: eb 94                        	jmp	0x80040c <vprintfmt+0x11c>
; 			putch(ch, putdat);
  800478: bf 25 00 00 00               	movl	$37, %edi
  80047d: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800481: 4c 89 f6                     	movq	%r14, %rsi
  800484: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800488: 41 ff d7                     	callq	*%r15
; 			break;
  80048b: 48 83 c3 01                  	addq	$1, %rbx
  80048f: e9 cd fe ff ff               	jmp	0x800361 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800494: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800498: 48 83 f9 28                  	cmpq	$40, %rcx
  80049c: 0f 87 1a 01 00 00            	ja	0x8005bc <vprintfmt+0x2cc>
  8004a2: 48 89 c8                     	movq	%rcx, %rax
  8004a5: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8004a9: 83 c1 08                     	addl	$8, %ecx
  8004ac: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8004af: e9 14 01 00 00               	jmp	0x8005c8 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  8004b4: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8004b8: e8 83 03 00 00               	callq	0x800840 <getuint>
  8004bd: 49 89 c4                     	movq	%rax, %r12
  8004c0: 41 bf 08 00 00 00            	movl	$8, %r15d
  8004c6: e9 72 fe ff ff               	jmp	0x80033d <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8004cb: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8004cf: 48 83 f9 28                  	cmpq	$40, %rcx
  8004d3: 0f 87 2f 01 00 00            	ja	0x800608 <vprintfmt+0x318>
  8004d9: 48 89 c8                     	movq	%rcx, %rax
  8004dc: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8004e0: 83 c1 08                     	addl	$8, %ecx
  8004e3: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8004e6: e9 29 01 00 00               	jmp	0x800614 <vprintfmt+0x324>
; 			putch('%', putdat);
  8004eb: bf 25 00 00 00               	movl	$37, %edi
  8004f0: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8004f4: 4c 89 f6                     	movq	%r14, %rsi
  8004f7: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8004fb: 41 ff d7                     	callq	*%r15
  8004fe: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800500: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  800505: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  80050b: 49 89 dc                     	movq	%rbx, %r12
  80050e: 75 f0                        	jne	0x800500 <vprintfmt+0x210>
  800510: e9 4c fe ff ff               	jmp	0x800361 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  800515: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800519: 48 83 f9 28                  	cmpq	$40, %rcx
  80051d: 0f 87 ab 01 00 00            	ja	0x8006ce <vprintfmt+0x3de>
  800523: 48 89 c8                     	movq	%rcx, %rax
  800526: 48 03 45 c0                  	addq	-64(%rbp), %rax
  80052a: 83 c1 08                     	addl	$8, %ecx
  80052d: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800530: e9 a5 01 00 00               	jmp	0x8006da <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  800535: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800539: e8 82 02 00 00               	callq	0x8007c0 <getint>
  80053e: 49 89 c4                     	movq	%rax, %r12
  800541: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  800547: 48 85 c0                     	testq	%rax, %rax
  80054a: 0f 89 ed fd ff ff            	jns	0x80033d <vprintfmt+0x4d>
; 				putch('-', putdat);
  800550: bf 2d 00 00 00               	movl	$45, %edi
  800555: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  800559: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  80055c: 49 f7 dc                     	negq	%r12
  80055f: e9 d9 fd ff ff               	jmp	0x80033d <vprintfmt+0x4d>
; 			putch('0', putdat);
  800564: bf 30 00 00 00               	movl	$48, %edi
  800569: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  80056d: 4c 89 fe                     	movq	%r15, %rsi
  800570: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  800574: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  800577: bf 78 00 00 00               	movl	$120, %edi
  80057c: 4c 89 fe                     	movq	%r15, %rsi
  80057f: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  800582: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800586: 48 83 f9 28                  	cmpq	$40, %rcx
  80058a: 0f 87 5d 01 00 00            	ja	0x8006ed <vprintfmt+0x3fd>
  800590: 48 89 c8                     	movq	%rcx, %rax
  800593: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800597: 83 c1 08                     	addl	$8, %ecx
  80059a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80059d: 4c 8b 20                     	movq	(%rax), %r12
  8005a0: e9 92 fd ff ff               	jmp	0x800337 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  8005a5: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8005a9: e8 92 02 00 00               	callq	0x800840 <getuint>
  8005ae: 49 89 c4                     	movq	%rax, %r12
  8005b1: 41 bf 0a 00 00 00            	movl	$10, %r15d
  8005b7: e9 81 fd ff ff               	jmp	0x80033d <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  8005bc: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8005c0: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8005c4: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8005c8: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  8005cc: 48 83 c3 01                  	addq	$1, %rbx
  8005d0: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  8005d2: 89 c1                        	movl	%eax, %ecx
  8005d4: f7 d9                        	negl	%ecx
  8005d6: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005d9: 83 f9 08                     	cmpl	$8, %ecx
  8005dc: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8005e0: 77 0d                        	ja	0x8005ef <vprintfmt+0x2ff>
  8005e2: 83 f9 03                     	cmpl	$3, %ecx
  8005e5: 74 08                        	je	0x8005ef <vprintfmt+0x2ff>
  8005e7: 85 c9                        	testl	%ecx, %ecx
  8005e9: 0f 85 4b 01 00 00            	jne	0x80073a <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  8005ef: 4c 89 ff                     	movq	%r15, %rdi
  8005f2: 4c 89 f6                     	movq	%r14, %rsi
  8005f5: 48 8d 15 d7 0a 00 00         	leaq	2775(%rip), %rdx        # 0x8010d3 <testbss.c+0x8010d3>
  8005fc: 31 c0                        	xorl	%eax, %eax
  8005fe: e8 6d 01 00 00               	callq	0x800770 <printfmt>
  800603: e9 59 fd ff ff               	jmp	0x800361 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800608: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  80060c: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800610: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800614: 4c 8b 20                     	movq	(%rax), %r12
  800617: 4d 85 e4                     	testq	%r12, %r12
  80061a: 48 8d 05 0f 0b 00 00         	leaq	2831(%rip), %rax        # 0x801130 <testbss.c+0x801130>
  800621: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  800625: 45 85 f6                     	testl	%r14d, %r14d
  800628: 7e 4f                        	jle	0x800679 <vprintfmt+0x389>
  80062a: 41 80 fd 2d                  	cmpb	$45, %r13b
  80062e: 74 49                        	je	0x800679 <vprintfmt+0x389>
  800630: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800634: 49 63 f7                     	movslq	%r15d, %rsi
  800637: 4c 89 e7                     	movq	%r12, %rdi
  80063a: e8 01 04 00 00               	callq	0x800a40 <strnlen>
  80063f: 45 89 f5                     	movl	%r14d, %r13d
  800642: 41 29 c5                     	subl	%eax, %r13d
  800645: 7e 35                        	jle	0x80067c <vprintfmt+0x38c>
  800647: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  80064b: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80064e: 41 29 c6                     	subl	%eax, %r14d
  800651: 41 83 c6 01                  	addl	$1, %r14d
  800655: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  800659: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800660: 8b 7d ac                     	movl	-84(%rbp), %edi
  800663: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  800667: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80066a: 41 83 c6 ff                  	addl	$-1, %r14d
  80066e: 41 83 fe 01                  	cmpl	$1, %r14d
  800672: 7f ec                        	jg	0x800660 <vprintfmt+0x370>
  800674: 45 31 ed                     	xorl	%r13d, %r13d
  800677: eb 03                        	jmp	0x80067c <vprintfmt+0x38c>
  800679: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80067c: 41 8a 04 24                  	movb	(%r12), %al
  800680: 84 c0                        	testb	%al, %al
  800682: 74 7d                        	je	0x800701 <vprintfmt+0x411>
  800684: 49 83 c4 01                  	addq	$1, %r12
  800688: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80068c: eb 33                        	jmp	0x8006c1 <vprintfmt+0x3d1>
  80068e: 66 90                        	nop
  800690: 0f be c0                     	movsbl	%al, %eax
  800693: 8d 48 81                     	leal	-127(%rax), %ecx
  800696: 80 f9 a1                     	cmpb	$-95, %cl
  800699: 89 c7                        	movl	%eax, %edi
  80069b: b9 3f 00 00 00               	movl	$63, %ecx
  8006a0: 0f 42 f9                     	cmovbl	%ecx, %edi
  8006a3: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  8006a7: 0f 44 f8                     	cmovel	%eax, %edi
  8006aa: 4c 89 f6                     	movq	%r14, %rsi
  8006ad: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  8006b0: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8006b4: 41 0f b6 04 24               	movzbl	(%r12), %eax
  8006b9: 49 83 c4 01                  	addq	$1, %r12
  8006bd: 84 c0                        	testb	%al, %al
  8006bf: 74 44                        	je	0x800705 <vprintfmt+0x415>
  8006c1: 45 85 ff                     	testl	%r15d, %r15d
  8006c4: 78 ca                        	js	0x800690 <vprintfmt+0x3a0>
  8006c6: 41 83 ef 01                  	subl	$1, %r15d
  8006ca: 73 c4                        	jae	0x800690 <vprintfmt+0x3a0>
  8006cc: eb 37                        	jmp	0x800705 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  8006ce: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8006d2: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006d6: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8006da: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8006de: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  8006e2: 48 83 c3 01                  	addq	$1, %rbx
  8006e6: 8b 38                        	movl	(%rax), %edi
  8006e8: e9 89 fc ff ff               	jmp	0x800376 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  8006ed: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8006f1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006f5: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8006f9: 4c 8b 20                     	movq	(%rax), %r12
  8006fc: e9 36 fc ff ff               	jmp	0x800337 <vprintfmt+0x47>
  800701: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800705: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  800709: 45 85 ed                     	testl	%r13d, %r13d
  80070c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800710: 0f 8e 4b fc ff ff            	jle	0x800361 <vprintfmt+0x71>
; 	while (1) {
  800716: 41 83 c5 01                  	addl	$1, %r13d
  80071a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  800720: bf 20 00 00 00               	movl	$32, %edi
  800725: 4c 89 f6                     	movq	%r14, %rsi
  800728: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  80072b: 41 83 c5 ff                  	addl	$-1, %r13d
  80072f: 41 83 fd 01                  	cmpl	$1, %r13d
  800733: 7f eb                        	jg	0x800720 <vprintfmt+0x430>
  800735: e9 27 fc ff ff               	jmp	0x800361 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  80073a: 89 c8                        	movl	%ecx, %eax
  80073c: 48 8d 0d cd 18 00 00         	leaq	6349(%rip), %rcx        # 0x802010 <error_string>
  800743: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  800747: 4c 89 ff                     	movq	%r15, %rdi
  80074a: 4c 89 f6                     	movq	%r14, %rsi
  80074d: 48 8d 15 de 08 00 00         	leaq	2270(%rip), %rdx        # 0x801032 <testbss.c+0x801032>
  800754: 31 c0                        	xorl	%eax, %eax
  800756: e8 15 00 00 00               	callq	0x800770 <printfmt>
  80075b: e9 01 fc ff ff               	jmp	0x800361 <vprintfmt+0x71>
; }
  800760: 48 83 c4 38                  	addq	$56, %rsp
  800764: 5b                           	popq	%rbx
  800765: 41 5c                        	popq	%r12
  800767: 41 5d                        	popq	%r13
  800769: 41 5e                        	popq	%r14
  80076b: 41 5f                        	popq	%r15
  80076d: 5d                           	popq	%rbp
  80076e: c3                           	retq
  80076f: 90                           	nop

0000000000800770 <printfmt>:
; {
  800770: 55                           	pushq	%rbp
  800771: 48 89 e5                     	movq	%rsp, %rbp
  800774: 48 83 ec 50                  	subq	$80, %rsp
  800778: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80077c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800780: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800784: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800788: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80078c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800790: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800794: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80079e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8007a2: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  8007a6: e8 45 fb ff ff               	callq	0x8002f0 <vprintfmt>
; }
  8007ab: 48 83 c4 50                  	addq	$80, %rsp
  8007af: 5d                           	popq	%rbp
  8007b0: c3                           	retq
  8007b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8007bb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008007c0 <getint>:
; {
  8007c0: 55                           	pushq	%rbp
  8007c1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8007c4: 83 fe 02                     	cmpl	$2, %esi
  8007c7: 7c 17                        	jl	0x8007e0 <getint+0x20>
; 		return va_arg(*ap, long long);
  8007c9: 48 63 07                     	movslq	(%rdi), %rax
  8007cc: 48 83 f8 28                  	cmpq	$40, %rax
  8007d0: 77 2b                        	ja	0x8007fd <getint+0x3d>
  8007d2: 48 89 c1                     	movq	%rax, %rcx
  8007d5: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8007d9: 83 c0 08                     	addl	$8, %eax
  8007dc: 89 07                        	movl	%eax, (%rdi)
  8007de: eb 18                        	jmp	0x8007f8 <getint+0x38>
  8007e0: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  8007e3: 85 f6                        	testl	%esi, %esi
  8007e5: 74 27                        	je	0x80080e <getint+0x4e>
  8007e7: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  8007ea: 77 11                        	ja	0x8007fd <getint+0x3d>
  8007ec: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  8007f0: 48 01 c1                     	addq	%rax, %rcx
  8007f3: 83 c0 08                     	addl	$8, %eax
  8007f6: 89 07                        	movl	%eax, (%rdi)
  8007f8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8007fb: 5d                           	popq	%rbp
  8007fc: c3                           	retq
  8007fd: 48 8b 47 08                  	movq	8(%rdi), %rax
  800801: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800805: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800809: 48 8b 00                     	movq	(%rax), %rax
; }
  80080c: 5d                           	popq	%rbp
  80080d: c3                           	retq
  80080e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  800811: 77 0e                        	ja	0x800821 <getint+0x61>
  800813: 48 89 c1                     	movq	%rax, %rcx
  800816: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80081a: 83 c0 08                     	addl	$8, %eax
  80081d: 89 07                        	movl	%eax, (%rdi)
  80081f: eb 0c                        	jmp	0x80082d <getint+0x6d>
  800821: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800825: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800829: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80082d: 48 63 01                     	movslq	(%rcx), %rax
; }
  800830: 5d                           	popq	%rbp
  800831: c3                           	retq
  800832: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80083c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800840 <getuint>:
; {
  800840: 55                           	pushq	%rbp
  800841: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800844: 83 fe 02                     	cmpl	$2, %esi
  800847: 7c 17                        	jl	0x800860 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  800849: 48 63 07                     	movslq	(%rdi), %rax
  80084c: 48 83 f8 28                  	cmpq	$40, %rax
  800850: 77 2b                        	ja	0x80087d <getuint+0x3d>
  800852: 48 89 c1                     	movq	%rax, %rcx
  800855: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800859: 83 c0 08                     	addl	$8, %eax
  80085c: 89 07                        	movl	%eax, (%rdi)
  80085e: eb 18                        	jmp	0x800878 <getuint+0x38>
  800860: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800863: 85 f6                        	testl	%esi, %esi
  800865: 74 27                        	je	0x80088e <getuint+0x4e>
  800867: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  80086a: 77 11                        	ja	0x80087d <getuint+0x3d>
  80086c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  800870: 48 01 c1                     	addq	%rax, %rcx
  800873: 83 c0 08                     	addl	$8, %eax
  800876: 89 07                        	movl	%eax, (%rdi)
  800878: 48 8b 01                     	movq	(%rcx), %rax
; }
  80087b: 5d                           	popq	%rbp
  80087c: c3                           	retq
  80087d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800881: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800885: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800889: 48 8b 00                     	movq	(%rax), %rax
; }
  80088c: 5d                           	popq	%rbp
  80088d: c3                           	retq
  80088e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800891: 77 0e                        	ja	0x8008a1 <getuint+0x61>
  800893: 48 89 c1                     	movq	%rax, %rcx
  800896: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80089a: 83 c0 08                     	addl	$8, %eax
  80089d: 89 07                        	movl	%eax, (%rdi)
  80089f: eb 0c                        	jmp	0x8008ad <getuint+0x6d>
  8008a1: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  8008a5: 48 8d 41 08                  	leaq	8(%rcx), %rax
  8008a9: 48 89 47 08                  	movq	%rax, 8(%rdi)
  8008ad: 8b 01                        	movl	(%rcx), %eax
; }
  8008af: 5d                           	popq	%rbp
  8008b0: c3                           	retq
  8008b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008bb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008c0 <printnum>:
; {
  8008c0: 55                           	pushq	%rbp
  8008c1: 48 89 e5                     	movq	%rsp, %rbp
  8008c4: 41 57                        	pushq	%r15
  8008c6: 41 56                        	pushq	%r14
  8008c8: 41 55                        	pushq	%r13
  8008ca: 41 54                        	pushq	%r12
  8008cc: 53                           	pushq	%rbx
  8008cd: 50                           	pushq	%rax
  8008ce: 45 89 cd                     	movl	%r9d, %r13d
  8008d1: 44 89 c3                     	movl	%r8d, %ebx
  8008d4: 49 89 f6                     	movq	%rsi, %r14
  8008d7: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  8008da: 41 89 cf                     	movl	%ecx, %r15d
  8008dd: 49 39 d7                     	cmpq	%rdx, %r15
  8008e0: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  8008e4: 76 1d                        	jbe	0x800903 <printnum+0x43>
; 		while (--width > 0)
  8008e6: 83 fb 02                     	cmpl	$2, %ebx
  8008e9: 7c 37                        	jl	0x800922 <printnum+0x62>
  8008eb: 83 c3 01                     	addl	$1, %ebx
  8008ee: 66 90                        	nop
; 			putch(padc, putdat);
  8008f0: 44 89 ef                     	movl	%r13d, %edi
  8008f3: 4c 89 f6                     	movq	%r14, %rsi
  8008f6: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  8008f9: 83 c3 ff                     	addl	$-1, %ebx
  8008fc: 83 fb 02                     	cmpl	$2, %ebx
  8008ff: 7f ef                        	jg	0x8008f0 <printnum+0x30>
  800901: eb 1f                        	jmp	0x800922 <printnum+0x62>
  800903: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800906: 31 d2                        	xorl	%edx, %edx
  800908: 49 f7 f7                     	divq	%r15
  80090b: 83 c3 ff                     	addl	$-1, %ebx
  80090e: 4c 89 e7                     	movq	%r12, %rdi
  800911: 4c 89 f6                     	movq	%r14, %rsi
  800914: 48 89 c2                     	movq	%rax, %rdx
  800917: 41 89 d8                     	movl	%ebx, %r8d
  80091a: 45 89 e9                     	movl	%r13d, %r9d
  80091d: e8 9e ff ff ff               	callq	0x8008c0 <printnum>
  800922: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  800926: 31 d2                        	xorl	%edx, %edx
  800928: 49 f7 f7                     	divq	%r15
  80092b: 48 8d 05 aa 07 00 00         	leaq	1962(%rip), %rax        # 0x8010dc <testbss.c+0x8010dc>
  800932: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  800936: 4c 89 f6                     	movq	%r14, %rsi
  800939: 41 ff d4                     	callq	*%r12
; }
  80093c: 48 83 c4 08                  	addq	$8, %rsp
  800940: 5b                           	popq	%rbx
  800941: 41 5c                        	popq	%r12
  800943: 41 5d                        	popq	%r13
  800945: 41 5e                        	popq	%r14
  800947: 41 5f                        	popq	%r15
  800949: 5d                           	popq	%rbp
  80094a: c3                           	retq
  80094b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800950 <vsnprintf>:
; {
  800950: 55                           	pushq	%rbp
  800951: 48 89 e5                     	movq	%rsp, %rbp
  800954: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800958: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  80095c: 48 63 c6                     	movslq	%esi, %rax
  80095f: 48 01 f8                     	addq	%rdi, %rax
  800962: 48 83 c0 ff                  	addq	$-1, %rax
  800966: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80096a: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  800971: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  800976: 48 85 ff                     	testq	%rdi, %rdi
  800979: 74 1e                        	je	0x800999 <vsnprintf+0x49>
  80097b: 85 f6                        	testl	%esi, %esi
  80097d: 7e 1a                        	jle	0x800999 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80097f: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x8009a0 <sprintputch>
  800986: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80098a: e8 61 f9 ff ff               	callq	0x8002f0 <vprintfmt>
; 	*b.buf = '\0';
  80098f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800993: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800996: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800999: 48 83 c4 20                  	addq	$32, %rsp
  80099d: 5d                           	popq	%rbp
  80099e: c3                           	retq
  80099f: 90                           	nop

00000000008009a0 <sprintputch>:
; {
  8009a0: 55                           	pushq	%rbp
  8009a1: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  8009a4: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  8009a8: 48 8b 06                     	movq	(%rsi), %rax
  8009ab: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  8009af: 73 0a                        	jae	0x8009bb <sprintputch+0x1b>
; 		*b->buf++ = ch;
  8009b1: 48 8d 48 01                  	leaq	1(%rax), %rcx
  8009b5: 48 89 0e                     	movq	%rcx, (%rsi)
  8009b8: 40 88 38                     	movb	%dil, (%rax)
; }
  8009bb: 5d                           	popq	%rbp
  8009bc: c3                           	retq
  8009bd: 0f 1f 00                     	nopl	(%rax)

00000000008009c0 <snprintf>:
; {
  8009c0: 55                           	pushq	%rbp
  8009c1: 48 89 e5                     	movq	%rsp, %rbp
  8009c4: 48 83 ec 50                  	subq	$80, %rsp
  8009c8: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8009cc: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8009d0: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8009d4: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8009d8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8009dc: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8009e0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8009e4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  8009ee: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8009f2: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  8009f6: e8 55 ff ff ff               	callq	0x800950 <vsnprintf>
; 	return rc;
  8009fb: 48 83 c4 50                  	addq	$80, %rsp
  8009ff: 5d                           	popq	%rbp
  800a00: c3                           	retq
  800a01: cc                           	int3
  800a02: cc                           	int3
  800a03: cc                           	int3
  800a04: cc                           	int3
  800a05: cc                           	int3
  800a06: cc                           	int3
  800a07: cc                           	int3
  800a08: cc                           	int3
  800a09: cc                           	int3
  800a0a: cc                           	int3
  800a0b: cc                           	int3
  800a0c: cc                           	int3
  800a0d: cc                           	int3
  800a0e: cc                           	int3
  800a0f: cc                           	int3

0000000000800a10 <strlen>:
; {
  800a10: 55                           	pushq	%rbp
  800a11: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  800a14: 80 3f 00                     	cmpb	$0, (%rdi)
  800a17: 74 14                        	je	0x800a2d <strlen+0x1d>
  800a19: 31 c0                        	xorl	%eax, %eax
  800a1b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  800a20: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  800a25: 48 8d 40 01                  	leaq	1(%rax), %rax
  800a29: 75 f5                        	jne	0x800a20 <strlen+0x10>
; 	return n;
  800a2b: 5d                           	popq	%rbp
  800a2c: c3                           	retq
  800a2d: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800a2f: 5d                           	popq	%rbp
  800a30: c3                           	retq
  800a31: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a40 <strnlen>:
; {
  800a40: 55                           	pushq	%rbp
  800a41: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800a44: 48 85 f6                     	testq	%rsi, %rsi
  800a47: 74 18                        	je	0x800a61 <strnlen+0x21>
  800a49: 48 89 f0                     	movq	%rsi, %rax
  800a4c: 31 c9                        	xorl	%ecx, %ecx
  800a4e: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800a50: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  800a54: 74 0f                        	je	0x800a65 <strnlen+0x25>
  800a56: 48 83 c1 01                  	addq	$1, %rcx
  800a5a: 48 39 c8                     	cmpq	%rcx, %rax
  800a5d: 75 f1                        	jne	0x800a50 <strnlen+0x10>
; 	return n;
  800a5f: 5d                           	popq	%rbp
  800a60: c3                           	retq
  800a61: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800a63: 5d                           	popq	%rbp
  800a64: c3                           	retq
  800a65: 89 c8                        	movl	%ecx, %eax
; 	return n;
  800a67: 5d                           	popq	%rbp
  800a68: c3                           	retq
  800a69: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800a70 <strcpy>:
; {
  800a70: 55                           	pushq	%rbp
  800a71: 48 89 e5                     	movq	%rsp, %rbp
  800a74: 48 89 f8                     	movq	%rdi, %rax
  800a77: 31 c9                        	xorl	%ecx, %ecx
  800a79: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  800a80: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  800a84: 88 14 08                     	movb	%dl, (%rax,%rcx)
  800a87: 48 83 c1 01                  	addq	$1, %rcx
  800a8b: 84 d2                        	testb	%dl, %dl
  800a8d: 75 f1                        	jne	0x800a80 <strcpy+0x10>
; 	return ret;
  800a8f: 5d                           	popq	%rbp
  800a90: c3                           	retq
  800a91: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a9b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800aa0 <strcat>:
; {
  800aa0: 55                           	pushq	%rbp
  800aa1: 48 89 e5                     	movq	%rsp, %rbp
  800aa4: 41 56                        	pushq	%r14
  800aa6: 53                           	pushq	%rbx
  800aa7: 49 89 f6                     	movq	%rsi, %r14
  800aaa: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  800aad: e8 5e ff ff ff               	callq	0x800a10 <strlen>
; 	strcpy(dst + len, src);
  800ab2: 48 63 f8                     	movslq	%eax, %rdi
  800ab5: 48 01 df                     	addq	%rbx, %rdi
  800ab8: 4c 89 f6                     	movq	%r14, %rsi
  800abb: e8 b0 ff ff ff               	callq	0x800a70 <strcpy>
; 	return dst;
  800ac0: 48 89 d8                     	movq	%rbx, %rax
  800ac3: 5b                           	popq	%rbx
  800ac4: 41 5e                        	popq	%r14
  800ac6: 5d                           	popq	%rbp
  800ac7: c3                           	retq
  800ac8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800ad0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800ad0: 55                           	pushq	%rbp
  800ad1: 48 89 e5                     	movq	%rsp, %rbp
  800ad4: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800ad7: 48 85 d2                     	testq	%rdx, %rdx
  800ada: 74 1a                        	je	0x800af6 <strncpy+0x26>
  800adc: 31 ff                        	xorl	%edi, %edi
  800ade: 66 90                        	nop
; 		*dst++ = *src;
  800ae0: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800ae3: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800ae6: 80 3e 01                     	cmpb	$1, (%rsi)
  800ae9: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  800aed: 48 83 c7 01                  	addq	$1, %rdi
  800af1: 48 39 fa                     	cmpq	%rdi, %rdx
  800af4: 75 ea                        	jne	0x800ae0 <strncpy+0x10>
; 	return ret;
  800af6: 5d                           	popq	%rbp
  800af7: c3                           	retq
  800af8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800b00 <strlcpy>:
; {
  800b00: 55                           	pushq	%rbp
  800b01: 48 89 e5                     	movq	%rsp, %rbp
  800b04: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  800b07: 48 85 d2                     	testq	%rdx, %rdx
  800b0a: 74 2e                        	je	0x800b3a <strlcpy+0x3a>
  800b0c: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  800b0f: 48 83 c2 ff                  	addq	$-1, %rdx
  800b13: 74 22                        	je	0x800b37 <strlcpy+0x37>
  800b15: 31 c0                        	xorl	%eax, %eax
  800b17: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  800b20: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  800b24: 84 c9                        	testb	%cl, %cl
  800b26: 74 0c                        	je	0x800b34 <strlcpy+0x34>
; 			*dst++ = *src++;
  800b28: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  800b2b: 48 83 c0 01                  	addq	$1, %rax
  800b2f: 48 39 c2                     	cmpq	%rax, %rdx
  800b32: 75 ec                        	jne	0x800b20 <strlcpy+0x20>
  800b34: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  800b37: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  800b3a: 48 29 f8                     	subq	%rdi, %rax
  800b3d: 5d                           	popq	%rbp
  800b3e: c3                           	retq
  800b3f: 90                           	nop

0000000000800b40 <strcmp>:
; {
  800b40: 55                           	pushq	%rbp
  800b41: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  800b44: 8a 07                        	movb	(%rdi), %al
  800b46: 84 c0                        	testb	%al, %al
  800b48: 74 19                        	je	0x800b63 <strcmp+0x23>
  800b4a: 48 83 c7 01                  	addq	$1, %rdi
  800b4e: 66 90                        	nop
  800b50: 3a 06                        	cmpb	(%rsi), %al
  800b52: 75 0f                        	jne	0x800b63 <strcmp+0x23>
; 		p++, q++;
  800b54: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800b58: 0f b6 07                     	movzbl	(%rdi), %eax
  800b5b: 48 83 c7 01                  	addq	$1, %rdi
  800b5f: 84 c0                        	testb	%al, %al
  800b61: 75 ed                        	jne	0x800b50 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800b63: 0f b6 c0                     	movzbl	%al, %eax
  800b66: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800b69: 29 c8                        	subl	%ecx, %eax
  800b6b: 5d                           	popq	%rbp
  800b6c: c3                           	retq
  800b6d: 0f 1f 00                     	nopl	(%rax)

0000000000800b70 <strncmp>:
; {
  800b70: 55                           	pushq	%rbp
  800b71: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800b74: 48 85 d2                     	testq	%rdx, %rdx
  800b77: 74 1d                        	je	0x800b96 <strncmp+0x26>
  800b79: 31 c9                        	xorl	%ecx, %ecx
  800b7b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800b80: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800b84: 85 c0                        	testl	%eax, %eax
  800b86: 74 12                        	je	0x800b9a <strncmp+0x2a>
  800b88: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800b8b: 75 0d                        	jne	0x800b9a <strncmp+0x2a>
  800b8d: 48 83 c1 01                  	addq	$1, %rcx
  800b91: 48 39 ca                     	cmpq	%rcx, %rdx
  800b94: 75 ea                        	jne	0x800b80 <strncmp+0x10>
  800b96: 31 c0                        	xorl	%eax, %eax
; }
  800b98: 5d                           	popq	%rbp
  800b99: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800b9a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800b9e: 29 c8                        	subl	%ecx, %eax
; }
  800ba0: 5d                           	popq	%rbp
  800ba1: c3                           	retq
  800ba2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bac: 0f 1f 40 00                  	nopl	(%rax)

0000000000800bb0 <strchr>:
; {
  800bb0: 55                           	pushq	%rbp
  800bb1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800bb4: 8a 0f                        	movb	(%rdi), %cl
  800bb6: 84 c9                        	testb	%cl, %cl
  800bb8: 74 17                        	je	0x800bd1 <strchr+0x21>
  800bba: 48 89 f8                     	movq	%rdi, %rax
  800bbd: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800bc0: 40 38 f1                     	cmpb	%sil, %cl
  800bc3: 74 0e                        	je	0x800bd3 <strchr+0x23>
; 	for (; *s; s++)
  800bc5: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800bc9: 48 83 c0 01                  	addq	$1, %rax
  800bcd: 84 c9                        	testb	%cl, %cl
  800bcf: 75 ef                        	jne	0x800bc0 <strchr+0x10>
  800bd1: 31 c0                        	xorl	%eax, %eax
; }
  800bd3: 5d                           	popq	%rbp
  800bd4: c3                           	retq
  800bd5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bdf: 90                           	nop

0000000000800be0 <strfind>:
; {
  800be0: 55                           	pushq	%rbp
  800be1: 48 89 e5                     	movq	%rsp, %rbp
  800be4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800be7: 48 83 c0 ff                  	addq	$-1, %rax
  800beb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800bf0: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800bf4: 48 83 c0 01                  	addq	$1, %rax
  800bf8: 84 c9                        	testb	%cl, %cl
  800bfa: 74 05                        	je	0x800c01 <strfind+0x21>
  800bfc: 40 38 f1                     	cmpb	%sil, %cl
  800bff: 75 ef                        	jne	0x800bf0 <strfind+0x10>
; 	return (char *) s;
  800c01: 5d                           	popq	%rbp
  800c02: c3                           	retq
  800c03: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c0d: 0f 1f 00                     	nopl	(%rax)

0000000000800c10 <memset>:
; {
  800c10: 55                           	pushq	%rbp
  800c11: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800c14: 48 85 d2                     	testq	%rdx, %rdx
  800c17: 74 36                        	je	0x800c4f <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800c19: 89 f8                        	movl	%edi, %eax
  800c1b: 09 d0                        	orl	%edx, %eax
  800c1d: a8 03                        	testb	$3, %al
  800c1f: 74 0a                        	je	0x800c2b <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800c21: 89 f0                        	movl	%esi, %eax
  800c23: 48 89 d1                     	movq	%rdx, %rcx
  800c26: fc                           	cld
  800c27: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800c29: eb 24                        	jmp	0x800c4f <memset+0x3f>
; 		c &= 0xFF;
  800c2b: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800c2f: c1 e6 18                     	shll	$24, %esi
  800c32: 44 89 c1                     	movl	%r8d, %ecx
  800c35: c1 e1 10                     	shll	$16, %ecx
  800c38: 09 f1                        	orl	%esi, %ecx
  800c3a: 44 89 c0                     	movl	%r8d, %eax
  800c3d: c1 e0 08                     	shll	$8, %eax
  800c40: 09 c8                        	orl	%ecx, %eax
  800c42: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800c45: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800c49: 48 89 d1                     	movq	%rdx, %rcx
  800c4c: fc                           	cld
  800c4d: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800c4f: 48 89 f8                     	movq	%rdi, %rax
  800c52: 5d                           	popq	%rbp
  800c53: c3                           	retq
  800c54: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c5e: 66 90                        	nop

0000000000800c60 <memmove>:
; {
  800c60: 55                           	pushq	%rbp
  800c61: 48 89 e5                     	movq	%rsp, %rbp
  800c64: 48 89 d1                     	movq	%rdx, %rcx
  800c67: 48 89 f2                     	movq	%rsi, %rdx
  800c6a: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800c6d: 48 39 fe                     	cmpq	%rdi, %rsi
  800c70: 73 38                        	jae	0x800caa <memmove+0x4a>
  800c72: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800c76: 48 39 c6                     	cmpq	%rax, %rsi
  800c79: 76 2f                        	jbe	0x800caa <memmove+0x4a>
; 		d += n;
  800c7b: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800c7f: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c82: 75 4e                        	jne	0x800cd2 <memmove+0x72>
  800c84: 89 f2                        	movl	%esi, %edx
  800c86: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c89: 48 85 d2                     	testq	%rdx, %rdx
  800c8c: 75 44                        	jne	0x800cd2 <memmove+0x72>
  800c8e: 89 fa                        	movl	%edi, %edx
  800c90: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c93: 48 85 d2                     	testq	%rdx, %rdx
  800c96: 75 3a                        	jne	0x800cd2 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800c98: 48 83 c7 fc                  	addq	$-4, %rdi
  800c9c: 48 83 c6 fc                  	addq	$-4, %rsi
  800ca0: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800ca4: fd                           	std
  800ca5: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800ca7: fc                           	cld
; 	return dst;
  800ca8: 5d                           	popq	%rbp
  800ca9: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800caa: 89 d6                        	movl	%edx, %esi
  800cac: 09 c6                        	orl	%eax, %esi
  800cae: 89 cf                        	movl	%ecx, %edi
  800cb0: 09 f7                        	orl	%esi, %edi
  800cb2: 40 f6 c7 03                  	testb	$3, %dil
  800cb6: 74 0b                        	je	0x800cc3 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800cb8: 48 89 c7                     	movq	%rax, %rdi
  800cbb: 48 89 d6                     	movq	%rdx, %rsi
  800cbe: fc                           	cld
  800cbf: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800cc1: 5d                           	popq	%rbp
  800cc2: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800cc3: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800cc7: 48 89 c7                     	movq	%rax, %rdi
  800cca: 48 89 d6                     	movq	%rdx, %rsi
  800ccd: fc                           	cld
  800cce: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800cd0: 5d                           	popq	%rbp
  800cd1: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800cd2: 48 83 c7 ff                  	addq	$-1, %rdi
  800cd6: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800cda: fd                           	std
  800cdb: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800cdd: fc                           	cld
; 	return dst;
  800cde: 5d                           	popq	%rbp
  800cdf: c3                           	retq

0000000000800ce0 <memcpy>:
; {
  800ce0: 55                           	pushq	%rbp
  800ce1: 48 89 e5                     	movq	%rsp, %rbp
  800ce4: 53                           	pushq	%rbx
  800ce5: 50                           	pushq	%rax
  800ce6: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800ce9: e8 72 ff ff ff               	callq	0x800c60 <memmove>
  800cee: 48 89 d8                     	movq	%rbx, %rax
  800cf1: 48 83 c4 08                  	addq	$8, %rsp
  800cf5: 5b                           	popq	%rbx
  800cf6: 5d                           	popq	%rbp
  800cf7: c3                           	retq
  800cf8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800d00 <memcmp>:
; {
  800d00: 55                           	pushq	%rbp
  800d01: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800d04: 48 85 d2                     	testq	%rdx, %rdx
  800d07: 74 1e                        	je	0x800d27 <memcmp+0x27>
  800d09: 31 c9                        	xorl	%ecx, %ecx
  800d0b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800d10: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800d14: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800d19: 44 38 c0                     	cmpb	%r8b, %al
  800d1c: 75 0d                        	jne	0x800d2b <memcmp+0x2b>
; 	while (n-- > 0) {
  800d1e: 48 83 c1 01                  	addq	$1, %rcx
  800d22: 48 39 ca                     	cmpq	%rcx, %rdx
  800d25: 75 e9                        	jne	0x800d10 <memcmp+0x10>
  800d27: 31 c0                        	xorl	%eax, %eax
; }
  800d29: 5d                           	popq	%rbp
  800d2a: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800d2b: 44 29 c0                     	subl	%r8d, %eax
; }
  800d2e: 5d                           	popq	%rbp
  800d2f: c3                           	retq

0000000000800d30 <memfind>:
; {
  800d30: 55                           	pushq	%rbp
  800d31: 48 89 e5                     	movq	%rsp, %rbp
  800d34: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800d37: 48 85 d2                     	testq	%rdx, %rdx
  800d3a: 7e 12                        	jle	0x800d4e <memfind+0x1e>
  800d3c: 48 01 c2                     	addq	%rax, %rdx
  800d3f: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800d40: 40 38 30                     	cmpb	%sil, (%rax)
  800d43: 74 09                        	je	0x800d4e <memfind+0x1e>
; 	for (; s < ends; s++)
  800d45: 48 83 c0 01                  	addq	$1, %rax
  800d49: 48 39 d0                     	cmpq	%rdx, %rax
  800d4c: 72 f2                        	jb	0x800d40 <memfind+0x10>
; 	return (void *) s;
  800d4e: 5d                           	popq	%rbp
  800d4f: c3                           	retq

0000000000800d50 <strtol>:
; {
  800d50: 55                           	pushq	%rbp
  800d51: 48 89 e5                     	movq	%rsp, %rbp
  800d54: 48 8d 05 a1 05 00 00         	leaq	1441(%rip), %rax        # 0x8012fc <testbss.c+0x8012fc>
  800d5b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800d60: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800d63: 80 c1 f7                     	addb	$-9, %cl
  800d66: 80 f9 24                     	cmpb	$36, %cl
  800d69: 77 16                        	ja	0x800d81 <strtol+0x31>
  800d6b: 0f b6 c9                     	movzbl	%cl, %ecx
  800d6e: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800d72: 48 01 c1                     	addq	%rax, %rcx
  800d75: ff e1                        	jmpq	*%rcx
; 		s++;
  800d77: 48 83 c7 01                  	addq	$1, %rdi
  800d7b: eb e3                        	jmp	0x800d60 <strtol+0x10>
; 		s++;
  800d7d: 48 83 c7 01                  	addq	$1, %rdi
  800d81: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d84: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800d8a: 75 27                        	jne	0x800db3 <strtol+0x63>
  800d8c: eb 0f                        	jmp	0x800d9d <strtol+0x4d>
; 		s++, neg = 1;
  800d8e: 48 83 c7 01                  	addq	$1, %rdi
  800d92: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d95: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800d9b: 75 16                        	jne	0x800db3 <strtol+0x63>
  800d9d: 80 3f 30                     	cmpb	$48, (%rdi)
  800da0: 75 11                        	jne	0x800db3 <strtol+0x63>
  800da2: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800da6: 75 0b                        	jne	0x800db3 <strtol+0x63>
; 		s += 2, base = 16;
  800da8: 48 83 c7 02                  	addq	$2, %rdi
  800dac: ba 10 00 00 00               	movl	$16, %edx
  800db1: eb 1a                        	jmp	0x800dcd <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800db3: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800db5: 75 16                        	jne	0x800dcd <strtol+0x7d>
  800db7: 31 c0                        	xorl	%eax, %eax
  800db9: 31 c9                        	xorl	%ecx, %ecx
  800dbb: 80 3f 30                     	cmpb	$48, (%rdi)
  800dbe: 0f 95 c0                     	setne	%al
  800dc1: 0f 94 c1                     	sete	%cl
  800dc4: 48 01 cf                     	addq	%rcx, %rdi
  800dc7: 8d 14 00                     	leal	(%rax,%rax), %edx
  800dca: 83 c2 08                     	addl	$8, %edx
  800dcd: 4c 63 ca                     	movslq	%edx, %r9
  800dd0: 45 31 d2                     	xorl	%r10d, %r10d
  800dd3: eb 2f                        	jmp	0x800e04 <strtol+0xb4>
  800dd5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800ddf: 90                           	nop
  800de0: 31 c0                        	xorl	%eax, %eax
  800de2: 84 c0                        	testb	%al, %al
  800de4: 75 1e                        	jne	0x800e04 <strtol+0xb4>
  800de6: eb 51                        	jmp	0x800e39 <strtol+0xe9>
  800de8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800df0: 48 83 c7 01                  	addq	$1, %rdi
  800df4: 4d 0f af d1                  	imulq	%r9, %r10
  800df8: 48 63 c1                     	movslq	%ecx, %rax
  800dfb: 49 01 c2                     	addq	%rax, %r10
  800dfe: b0 01                        	movb	$1, %al
  800e00: 84 c0                        	testb	%al, %al
  800e02: 74 35                        	je	0x800e39 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800e04: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800e08: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800e0c: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800e11: 3c 0a                        	cmpb	$10, %al
  800e13: 72 1b                        	jb	0x800e30 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800e15: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800e19: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800e1e: 3c 1a                        	cmpb	$26, %al
  800e20: 72 0e                        	jb	0x800e30 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800e22: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800e26: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800e2b: 3c 19                        	cmpb	$25, %al
  800e2d: 77 b1                        	ja	0x800de0 <strtol+0x90>
  800e2f: 90                           	nop
  800e30: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800e33: 39 d1                        	cmpl	%edx, %ecx
  800e35: 7c b9                        	jl	0x800df0 <strtol+0xa0>
  800e37: eb a7                        	jmp	0x800de0 <strtol+0x90>
; 	if (endptr)
  800e39: 48 85 f6                     	testq	%rsi, %rsi
  800e3c: 74 03                        	je	0x800e41 <strtol+0xf1>
; 		*endptr = (char *) s;
  800e3e: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800e41: 4c 89 d0                     	movq	%r10, %rax
  800e44: 48 f7 d8                     	negq	%rax
  800e47: 45 84 c0                     	testb	%r8b, %r8b
  800e4a: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800e4e: 5d                           	popq	%rbp
  800e4f: c3                           	retq

0000000000800e50 <puts>:
; {
  800e50: 55                           	pushq	%rbp
  800e51: 48 89 e5                     	movq	%rsp, %rbp
  800e54: 48 89 f1                     	movq	%rsi, %rcx
  800e57: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800e5a: 31 ff                        	xorl	%edi, %edi
  800e5c: 31 f6                        	xorl	%esi, %esi
  800e5e: e8 0d 00 00 00               	callq	0x800e70 <syscall>
; }
  800e63: 5d                           	popq	%rbp
  800e64: c3                           	retq
  800e65: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800e6f: 90                           	nop

0000000000800e70 <syscall>:
; {
  800e70: 55                           	pushq	%rbp
  800e71: 48 89 e5                     	movq	%rsp, %rbp
  800e74: 48 83 ec 10                  	subq	$16, %rsp
  800e78: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800e7a: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800e82: 48 89 d6                     	movq	%rdx, %rsi
  800e85: 48 89 ca                     	movq	%rcx, %rdx
  800e88: 31 c9                        	xorl	%ecx, %ecx
  800e8a: 45 31 c0                     	xorl	%r8d, %r8d
  800e8d: 45 31 c9                     	xorl	%r9d, %r9d
  800e90: e8 63 00 00 00               	callq	0x800ef8 <do_syscall>
; 	return ret;
  800e95: 48 83 c4 10                  	addq	$16, %rsp
  800e99: 5d                           	popq	%rbp
  800e9a: c3                           	retq
  800e9b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800ea0 <getc>:
; {
  800ea0: 55                           	pushq	%rbp
  800ea1: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800ea4: bf 01 00 00 00               	movl	$1, %edi
  800ea9: 31 f6                        	xorl	%esi, %esi
  800eab: 31 d2                        	xorl	%edx, %edx
  800ead: 31 c9                        	xorl	%ecx, %ecx
  800eaf: e8 bc ff ff ff               	callq	0x800e70 <syscall>
  800eb4: 5d                           	popq	%rbp
  800eb5: c3                           	retq
  800eb6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800ec0 <kill>:
; {
  800ec0: 55                           	pushq	%rbp
  800ec1: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800ec4: 48 63 d7                     	movslq	%edi, %rdx
  800ec7: bf 03 00 00 00               	movl	$3, %edi
  800ecc: be 01 00 00 00               	movl	$1, %esi
  800ed1: 31 c9                        	xorl	%ecx, %ecx
  800ed3: e8 98 ff ff ff               	callq	0x800e70 <syscall>
  800ed8: 5d                           	popq	%rbp
  800ed9: c3                           	retq
  800eda: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800ee0 <getpid>:
; {
  800ee0: 55                           	pushq	%rbp
  800ee1: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800ee4: bf 02 00 00 00               	movl	$2, %edi
  800ee9: 31 f6                        	xorl	%esi, %esi
  800eeb: 31 d2                        	xorl	%edx, %edx
  800eed: 31 c9                        	xorl	%ecx, %ecx
  800eef: e8 7c ff ff ff               	callq	0x800e70 <syscall>
  800ef4: 5d                           	popq	%rbp
  800ef5: c3                           	retq
  800ef6: cc                           	int3
  800ef7: cc                           	int3

0000000000800ef8 <do_syscall>:
; 	pushq %rbp
  800ef8: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800ef9: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800efe: cd 80                        	int	$128
; 	popq %rbp
  800f00: 5d                           	popq	%rbp
; 	retq
  800f01: c3                           	retq
