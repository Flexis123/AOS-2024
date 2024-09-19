
obj/user/faultexec:	file format elf64-x86-64

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
  800042: e8 39 00 00 00               	callq	0x800080 <libmain>
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
; 	printf("adress of s is: %p\n", s);
  800054: 48 8d 3d ea 0f 00 00         	leaq	4074(%rip), %rdi        # 0x801045 <syscall.c+0x801045>
  80005b: 48 8d 35 d4 0f 00 00         	leaq	4052(%rip), %rsi        # 0x801036 <syscall.c+0x801036>
  800062: 31 c0                        	xorl	%eax, %eax
  800064: e8 f7 00 00 00               	callq	0x800160 <printf>
; 	func();
  800069: e8 c8 0f 00 00               	callq	0x801036 <syscall.c+0x801036>
; 	return 0;
  80006e: 31 c0                        	xorl	%eax, %eax
  800070: 5d                           	popq	%rbp
  800071: c3                           	retq
  800072: cc                           	int3
  800073: cc                           	int3
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
; 	if (argc > 0) {
  800084: 85 ff                        	testl	%edi, %edi
  800086: 7e 0d                        	jle	0x800095 <libmain+0x15>
; 		binary_name = argv[0];
  800088: 48 8b 06                     	movq	(%rsi), %rax
  80008b: 48 8d 0d 6e 1f 00 00         	leaq	8046(%rip), %rcx        # 0x802000 <binary_name>
  800092: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800095: e8 b6 ff ff ff               	callq	0x800050 <main>
; 	exit();
  80009a: e8 11 00 00 00               	callq	0x8000b0 <exit>
; }
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
  8000b6: e8 c5 0c 00 00               	callq	0x800d80 <kill>
; }
  8000bb: 5d                           	popq	%rbp
  8000bc: c3                           	retq
  8000bd: cc                           	int3
  8000be: cc                           	int3
  8000bf: cc                           	int3

00000000008000c0 <vprintf>:
; {
  8000c0: 55                           	pushq	%rbp
  8000c1: 48 89 e5                     	movq	%rsp, %rbp
  8000c4: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  8000cb: 48 89 f1                     	movq	%rsi, %rcx
  8000ce: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  8000d1: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000dc: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x800120 <putch>
  8000e3: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000ea: e8 c1 00 00 00               	callq	0x8001b0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8000ef: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  8000f6: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  8000fd: e8 0e 0c 00 00               	callq	0x800d10 <puts>
; 	return b.cnt;
  800102: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  800108: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  80010f: 5d                           	popq	%rbp
  800110: c3                           	retq
  800111: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80011b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800120 <putch>:
; {
  800120: 55                           	pushq	%rbp
  800121: 48 89 e5                     	movq	%rsp, %rbp
  800124: 53                           	pushq	%rbx
  800125: 50                           	pushq	%rax
  800126: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  800129: 48 63 06                     	movslq	(%rsi), %rax
  80012c: 8d 48 01                     	leal	1(%rax), %ecx
  80012f: 89 0e                        	movl	%ecx, (%rsi)
  800131: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  800136: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  80013c: 75 14                        	jne	0x800152 <putch+0x32>
; 		puts(b->buf, b->idx);
  80013e: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  800142: be ff 00 00 00               	movl	$255, %esi
  800147: e8 c4 0b 00 00               	callq	0x800d10 <puts>
; 		b->idx = 0;
  80014c: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800152: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800156: 48 83 c4 08                  	addq	$8, %rsp
  80015a: 5b                           	popq	%rbx
  80015b: 5d                           	popq	%rbp
  80015c: c3                           	retq
  80015d: 0f 1f 00                     	nopl	(%rax)

0000000000800160 <printf>:
; {
  800160: 55                           	pushq	%rbp
  800161: 48 89 e5                     	movq	%rsp, %rbp
  800164: 48 83 ec 50                  	subq	$80, %rsp
  800168: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80016c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  800170: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  800174: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800178: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  80017c: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800180: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800184: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800188: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  80018c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  800196: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80019a: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  80019e: e8 1d ff ff ff               	callq	0x8000c0 <vprintf>
; 	return cnt;
  8001a3: 48 83 c4 50                  	addq	$80, %rsp
  8001a7: 5d                           	popq	%rbp
  8001a8: c3                           	retq
  8001a9: cc                           	int3
  8001aa: cc                           	int3
  8001ab: cc                           	int3
  8001ac: cc                           	int3
  8001ad: cc                           	int3
  8001ae: cc                           	int3
  8001af: cc                           	int3

00000000008001b0 <vprintfmt>:
; {
  8001b0: 55                           	pushq	%rbp
  8001b1: 48 89 e5                     	movq	%rsp, %rbp
  8001b4: 41 57                        	pushq	%r15
  8001b6: 41 56                        	pushq	%r14
  8001b8: 41 55                        	pushq	%r13
  8001ba: 41 54                        	pushq	%r12
  8001bc: 53                           	pushq	%rbx
  8001bd: 48 83 ec 38                  	subq	$56, %rsp
  8001c1: 48 89 d3                     	movq	%rdx, %rbx
  8001c4: 49 89 f6                     	movq	%rsi, %r14
  8001c7: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  8001ca: 48 8b 41 10                  	movq	16(%rcx), %rax
  8001ce: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  8001d2: 48 8b 01                     	movq	(%rcx), %rax
  8001d5: 48 8b 49 08                  	movq	8(%rcx), %rcx
  8001d9: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8001dd: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  8001e1: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  8001e5: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  8001e9: eb 36                        	jmp	0x800221 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  8001eb: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8001ef: e8 0c 05 00 00               	callq	0x800700 <getuint>
  8001f4: 49 89 c4                     	movq	%rax, %r12
  8001f7: 41 bf 10 00 00 00            	movl	$16, %r15d
  8001fd: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  800201: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  800205: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  800209: 4c 89 e2                     	movq	%r12, %rdx
  80020c: 44 89 f9                     	movl	%r15d, %ecx
  80020f: 49 89 ff                     	movq	%rdi, %r15
  800212: 45 89 f0                     	movl	%r14d, %r8d
  800215: 49 89 f6                     	movq	%rsi, %r14
  800218: e8 63 05 00 00               	callq	0x800780 <printnum>
; 			break;
  80021d: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800221: 0f b6 3b                     	movzbl	(%rbx), %edi
  800224: 48 83 c3 01                  	addq	$1, %rbx
  800228: 83 ff 25                     	cmpl	$37, %edi
  80022b: 74 13                        	je	0x800240 <vprintfmt+0x90>
  80022d: 40 84 ff                     	testb	%dil, %dil
  800230: 0f 84 ea 03 00 00            	je	0x800620 <vprintfmt+0x470>
  800236: 4c 89 f6                     	movq	%r14, %rsi
  800239: 41 ff d7                     	callq	*%r15
  80023c: eb e3                        	jmp	0x800221 <vprintfmt+0x71>
  80023e: 66 90                        	nop
  800240: 41 b5 20                     	movb	$32, %r13b
  800243: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  800249: 31 f6                        	xorl	%esi, %esi
  80024b: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  80024f: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800255: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80025c: 48 8d 3d 81 0e 00 00         	leaq	3713(%rip), %rdi        # 0x8010e4 <syscall.c+0x8010e4>
; 		switch (ch = *(unsigned char *) fmt++) {
  800263: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800267: eb 12                        	jmp	0x80027b <vprintfmt+0xcb>
  800269: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800270: 48 83 c3 01                  	addq	$1, %rbx
  800274: 49 83 c4 01                  	addq	$1, %r12
  800278: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  80027b: 0f b6 0b                     	movzbl	(%rbx), %ecx
  80027e: 8d 51 dd                     	leal	-35(%rcx), %edx
  800281: 80 fa 55                     	cmpb	$85, %dl
  800284: 0f 87 21 01 00 00            	ja	0x8003ab <vprintfmt+0x1fb>
  80028a: 0f b6 d2                     	movzbl	%dl, %edx
  80028d: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  800291: 48 01 fa                     	addq	%rdi, %rdx
  800294: ff e2                        	jmpq	*%rdx
  800296: b1 30                        	movb	$48, %cl
  800298: eb d6                        	jmp	0x800270 <vprintfmt+0xc0>
  80029a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8002a0: 0f b6 c9                     	movzbl	%cl, %ecx
  8002a3: 45 31 ff                     	xorl	%r15d, %r15d
  8002a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  8002b0: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  8002b4: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  8002b8: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  8002bc: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  8002c0: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  8002c4: 8d 51 c6                     	leal	-58(%rcx), %edx
  8002c7: 80 fa f6                     	cmpb	$-10, %dl
  8002ca: 73 e4                        	jae	0x8002b0 <vprintfmt+0x100>
; 			if (width < 0)
  8002cc: 45 85 f6                     	testl	%r14d, %r14d
  8002cf: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  8002d3: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  8002d8: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  8002dc: eb 85                        	jmp	0x800263 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  8002de: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8002e2: 48 83 c3 01                  	addq	$1, %rbx
  8002e6: 48 83 f9 28                  	cmpq	$40, %rcx
  8002ea: 77 3b                        	ja	0x800327 <vprintfmt+0x177>
  8002ec: 48 89 ca                     	movq	%rcx, %rdx
  8002ef: 48 01 c2                     	addq	%rax, %rdx
  8002f2: 83 c1 08                     	addl	$8, %ecx
  8002f5: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8002f8: 44 8b 3a                     	movl	(%rdx), %r15d
  8002fb: eb cf                        	jmp	0x8002cc <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  8002fd: 48 83 c3 01                  	addq	$1, %rbx
  800301: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  800308: e9 56 ff ff ff               	jmp	0x800263 <vprintfmt+0xb3>
; 			if (width < 0)
  80030d: 45 85 f6                     	testl	%r14d, %r14d
  800310: b9 00 00 00 00               	movl	$0, %ecx
  800315: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  800319: eb 03                        	jmp	0x80031e <vprintfmt+0x16e>
; 			lflag++;
  80031b: 83 c6 01                     	addl	$1, %esi
  80031e: 48 83 c3 01                  	addq	$1, %rbx
  800322: e9 3c ff ff ff               	jmp	0x800263 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  800327: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80032b: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  80032f: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  800333: 44 8b 39                     	movl	(%rcx), %r15d
  800336: eb 94                        	jmp	0x8002cc <vprintfmt+0x11c>
; 			putch(ch, putdat);
  800338: bf 25 00 00 00               	movl	$37, %edi
  80033d: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800341: 4c 89 f6                     	movq	%r14, %rsi
  800344: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800348: 41 ff d7                     	callq	*%r15
; 			break;
  80034b: 48 83 c3 01                  	addq	$1, %rbx
  80034f: e9 cd fe ff ff               	jmp	0x800221 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800354: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800358: 48 83 f9 28                  	cmpq	$40, %rcx
  80035c: 0f 87 1a 01 00 00            	ja	0x80047c <vprintfmt+0x2cc>
  800362: 48 89 c8                     	movq	%rcx, %rax
  800365: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800369: 83 c1 08                     	addl	$8, %ecx
  80036c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80036f: e9 14 01 00 00               	jmp	0x800488 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  800374: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800378: e8 83 03 00 00               	callq	0x800700 <getuint>
  80037d: 49 89 c4                     	movq	%rax, %r12
  800380: 41 bf 08 00 00 00            	movl	$8, %r15d
  800386: e9 72 fe ff ff               	jmp	0x8001fd <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  80038b: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80038f: 48 83 f9 28                  	cmpq	$40, %rcx
  800393: 0f 87 2f 01 00 00            	ja	0x8004c8 <vprintfmt+0x318>
  800399: 48 89 c8                     	movq	%rcx, %rax
  80039c: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8003a0: 83 c1 08                     	addl	$8, %ecx
  8003a3: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8003a6: e9 29 01 00 00               	jmp	0x8004d4 <vprintfmt+0x324>
; 			putch('%', putdat);
  8003ab: bf 25 00 00 00               	movl	$37, %edi
  8003b0: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8003b4: 4c 89 f6                     	movq	%r14, %rsi
  8003b7: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8003bb: 41 ff d7                     	callq	*%r15
  8003be: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8003c0: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  8003c5: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  8003cb: 49 89 dc                     	movq	%rbx, %r12
  8003ce: 75 f0                        	jne	0x8003c0 <vprintfmt+0x210>
  8003d0: e9 4c fe ff ff               	jmp	0x800221 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  8003d5: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8003d9: 48 83 f9 28                  	cmpq	$40, %rcx
  8003dd: 0f 87 ab 01 00 00            	ja	0x80058e <vprintfmt+0x3de>
  8003e3: 48 89 c8                     	movq	%rcx, %rax
  8003e6: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8003ea: 83 c1 08                     	addl	$8, %ecx
  8003ed: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8003f0: e9 a5 01 00 00               	jmp	0x80059a <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  8003f5: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8003f9: e8 82 02 00 00               	callq	0x800680 <getint>
  8003fe: 49 89 c4                     	movq	%rax, %r12
  800401: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  800407: 48 85 c0                     	testq	%rax, %rax
  80040a: 0f 89 ed fd ff ff            	jns	0x8001fd <vprintfmt+0x4d>
; 				putch('-', putdat);
  800410: bf 2d 00 00 00               	movl	$45, %edi
  800415: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  800419: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  80041c: 49 f7 dc                     	negq	%r12
  80041f: e9 d9 fd ff ff               	jmp	0x8001fd <vprintfmt+0x4d>
; 			putch('0', putdat);
  800424: bf 30 00 00 00               	movl	$48, %edi
  800429: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  80042d: 4c 89 fe                     	movq	%r15, %rsi
  800430: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  800434: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  800437: bf 78 00 00 00               	movl	$120, %edi
  80043c: 4c 89 fe                     	movq	%r15, %rsi
  80043f: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  800442: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800446: 48 83 f9 28                  	cmpq	$40, %rcx
  80044a: 0f 87 5d 01 00 00            	ja	0x8005ad <vprintfmt+0x3fd>
  800450: 48 89 c8                     	movq	%rcx, %rax
  800453: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800457: 83 c1 08                     	addl	$8, %ecx
  80045a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80045d: 4c 8b 20                     	movq	(%rax), %r12
  800460: e9 92 fd ff ff               	jmp	0x8001f7 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800465: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800469: e8 92 02 00 00               	callq	0x800700 <getuint>
  80046e: 49 89 c4                     	movq	%rax, %r12
  800471: 41 bf 0a 00 00 00            	movl	$10, %r15d
  800477: e9 81 fd ff ff               	jmp	0x8001fd <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  80047c: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800480: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800484: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800488: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  80048c: 48 83 c3 01                  	addq	$1, %rbx
  800490: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  800492: 89 c1                        	movl	%eax, %ecx
  800494: f7 d9                        	negl	%ecx
  800496: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800499: 83 f9 08                     	cmpl	$8, %ecx
  80049c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8004a0: 77 0d                        	ja	0x8004af <vprintfmt+0x2ff>
  8004a2: 83 f9 03                     	cmpl	$3, %ecx
  8004a5: 74 08                        	je	0x8004af <vprintfmt+0x2ff>
  8004a7: 85 c9                        	testl	%ecx, %ecx
  8004a9: 0f 85 4b 01 00 00            	jne	0x8005fa <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  8004af: 4c 89 ff                     	movq	%r15, %rdi
  8004b2: 4c 89 f6                     	movq	%r14, %rsi
  8004b5: 48 8d 15 bf 0b 00 00         	leaq	3007(%rip), %rdx        # 0x80107b <syscall.c+0x80107b>
  8004bc: 31 c0                        	xorl	%eax, %eax
  8004be: e8 6d 01 00 00               	callq	0x800630 <printfmt>
  8004c3: e9 59 fd ff ff               	jmp	0x800221 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8004c8: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8004cc: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8004d0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8004d4: 4c 8b 20                     	movq	(%rax), %r12
  8004d7: 4d 85 e4                     	testq	%r12, %r12
  8004da: 48 8d 05 b4 0b 00 00         	leaq	2996(%rip), %rax        # 0x801095 <syscall.c+0x801095>
  8004e1: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  8004e5: 45 85 f6                     	testl	%r14d, %r14d
  8004e8: 7e 4f                        	jle	0x800539 <vprintfmt+0x389>
  8004ea: 41 80 fd 2d                  	cmpb	$45, %r13b
  8004ee: 74 49                        	je	0x800539 <vprintfmt+0x389>
  8004f0: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8004f4: 49 63 f7                     	movslq	%r15d, %rsi
  8004f7: 4c 89 e7                     	movq	%r12, %rdi
  8004fa: e8 01 04 00 00               	callq	0x800900 <strnlen>
  8004ff: 45 89 f5                     	movl	%r14d, %r13d
  800502: 41 29 c5                     	subl	%eax, %r13d
  800505: 7e 35                        	jle	0x80053c <vprintfmt+0x38c>
  800507: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  80050b: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80050e: 41 29 c6                     	subl	%eax, %r14d
  800511: 41 83 c6 01                  	addl	$1, %r14d
  800515: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  800519: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800520: 8b 7d ac                     	movl	-84(%rbp), %edi
  800523: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  800527: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80052a: 41 83 c6 ff                  	addl	$-1, %r14d
  80052e: 41 83 fe 01                  	cmpl	$1, %r14d
  800532: 7f ec                        	jg	0x800520 <vprintfmt+0x370>
  800534: 45 31 ed                     	xorl	%r13d, %r13d
  800537: eb 03                        	jmp	0x80053c <vprintfmt+0x38c>
  800539: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80053c: 41 8a 04 24                  	movb	(%r12), %al
  800540: 84 c0                        	testb	%al, %al
  800542: 74 7d                        	je	0x8005c1 <vprintfmt+0x411>
  800544: 49 83 c4 01                  	addq	$1, %r12
  800548: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80054c: eb 33                        	jmp	0x800581 <vprintfmt+0x3d1>
  80054e: 66 90                        	nop
  800550: 0f be c0                     	movsbl	%al, %eax
  800553: 8d 48 81                     	leal	-127(%rax), %ecx
  800556: 80 f9 a1                     	cmpb	$-95, %cl
  800559: 89 c7                        	movl	%eax, %edi
  80055b: b9 3f 00 00 00               	movl	$63, %ecx
  800560: 0f 42 f9                     	cmovbl	%ecx, %edi
  800563: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800567: 0f 44 f8                     	cmovel	%eax, %edi
  80056a: 4c 89 f6                     	movq	%r14, %rsi
  80056d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  800570: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800574: 41 0f b6 04 24               	movzbl	(%r12), %eax
  800579: 49 83 c4 01                  	addq	$1, %r12
  80057d: 84 c0                        	testb	%al, %al
  80057f: 74 44                        	je	0x8005c5 <vprintfmt+0x415>
  800581: 45 85 ff                     	testl	%r15d, %r15d
  800584: 78 ca                        	js	0x800550 <vprintfmt+0x3a0>
  800586: 41 83 ef 01                  	subl	$1, %r15d
  80058a: 73 c4                        	jae	0x800550 <vprintfmt+0x3a0>
  80058c: eb 37                        	jmp	0x8005c5 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  80058e: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800592: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800596: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80059a: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80059e: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  8005a2: 48 83 c3 01                  	addq	$1, %rbx
  8005a6: 8b 38                        	movl	(%rax), %edi
  8005a8: e9 89 fc ff ff               	jmp	0x800236 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  8005ad: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8005b1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8005b5: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8005b9: 4c 8b 20                     	movq	(%rax), %r12
  8005bc: e9 36 fc ff ff               	jmp	0x8001f7 <vprintfmt+0x47>
  8005c1: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8005c5: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  8005c9: 45 85 ed                     	testl	%r13d, %r13d
  8005cc: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8005d0: 0f 8e 4b fc ff ff            	jle	0x800221 <vprintfmt+0x71>
; 	while (1) {
  8005d6: 41 83 c5 01                  	addl	$1, %r13d
  8005da: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  8005e0: bf 20 00 00 00               	movl	$32, %edi
  8005e5: 4c 89 f6                     	movq	%r14, %rsi
  8005e8: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  8005eb: 41 83 c5 ff                  	addl	$-1, %r13d
  8005ef: 41 83 fd 01                  	cmpl	$1, %r13d
  8005f3: 7f eb                        	jg	0x8005e0 <vprintfmt+0x430>
  8005f5: e9 27 fc ff ff               	jmp	0x800221 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005fa: 89 c8                        	movl	%ecx, %eax
  8005fc: 48 8d 0d 1d fa 9f ff         	leaq	-6292963(%rip), %rcx    # 0x200020 <error_string>
  800603: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  800607: 4c 89 ff                     	movq	%r15, %rdi
  80060a: 4c 89 f6                     	movq	%r14, %rsi
  80060d: 48 8d 15 07 0a 00 00         	leaq	2567(%rip), %rdx        # 0x80101b <syscall.c+0x80101b>
  800614: 31 c0                        	xorl	%eax, %eax
  800616: e8 15 00 00 00               	callq	0x800630 <printfmt>
  80061b: e9 01 fc ff ff               	jmp	0x800221 <vprintfmt+0x71>
; }
  800620: 48 83 c4 38                  	addq	$56, %rsp
  800624: 5b                           	popq	%rbx
  800625: 41 5c                        	popq	%r12
  800627: 41 5d                        	popq	%r13
  800629: 41 5e                        	popq	%r14
  80062b: 41 5f                        	popq	%r15
  80062d: 5d                           	popq	%rbp
  80062e: c3                           	retq
  80062f: 90                           	nop

0000000000800630 <printfmt>:
; {
  800630: 55                           	pushq	%rbp
  800631: 48 89 e5                     	movq	%rsp, %rbp
  800634: 48 83 ec 50                  	subq	$80, %rsp
  800638: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80063c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800640: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800644: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800648: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80064c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800650: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800654: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80065e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800662: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800666: e8 45 fb ff ff               	callq	0x8001b0 <vprintfmt>
; }
  80066b: 48 83 c4 50                  	addq	$80, %rsp
  80066f: 5d                           	popq	%rbp
  800670: c3                           	retq
  800671: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80067b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800680 <getint>:
; {
  800680: 55                           	pushq	%rbp
  800681: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800684: 83 fe 02                     	cmpl	$2, %esi
  800687: 7c 17                        	jl	0x8006a0 <getint+0x20>
; 		return va_arg(*ap, long long);
  800689: 48 63 07                     	movslq	(%rdi), %rax
  80068c: 48 83 f8 28                  	cmpq	$40, %rax
  800690: 77 2b                        	ja	0x8006bd <getint+0x3d>
  800692: 48 89 c1                     	movq	%rax, %rcx
  800695: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800699: 83 c0 08                     	addl	$8, %eax
  80069c: 89 07                        	movl	%eax, (%rdi)
  80069e: eb 18                        	jmp	0x8006b8 <getint+0x38>
  8006a0: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  8006a3: 85 f6                        	testl	%esi, %esi
  8006a5: 74 27                        	je	0x8006ce <getint+0x4e>
  8006a7: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  8006aa: 77 11                        	ja	0x8006bd <getint+0x3d>
  8006ac: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  8006b0: 48 01 c1                     	addq	%rax, %rcx
  8006b3: 83 c0 08                     	addl	$8, %eax
  8006b6: 89 07                        	movl	%eax, (%rdi)
  8006b8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8006bb: 5d                           	popq	%rbp
  8006bc: c3                           	retq
  8006bd: 48 8b 47 08                  	movq	8(%rdi), %rax
  8006c1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006c5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8006c9: 48 8b 00                     	movq	(%rax), %rax
; }
  8006cc: 5d                           	popq	%rbp
  8006cd: c3                           	retq
  8006ce: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  8006d1: 77 0e                        	ja	0x8006e1 <getint+0x61>
  8006d3: 48 89 c1                     	movq	%rax, %rcx
  8006d6: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8006da: 83 c0 08                     	addl	$8, %eax
  8006dd: 89 07                        	movl	%eax, (%rdi)
  8006df: eb 0c                        	jmp	0x8006ed <getint+0x6d>
  8006e1: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  8006e5: 48 8d 41 08                  	leaq	8(%rcx), %rax
  8006e9: 48 89 47 08                  	movq	%rax, 8(%rdi)
  8006ed: 48 63 01                     	movslq	(%rcx), %rax
; }
  8006f0: 5d                           	popq	%rbp
  8006f1: c3                           	retq
  8006f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8006fc: 0f 1f 40 00                  	nopl	(%rax)

0000000000800700 <getuint>:
; {
  800700: 55                           	pushq	%rbp
  800701: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800704: 83 fe 02                     	cmpl	$2, %esi
  800707: 7c 17                        	jl	0x800720 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  800709: 48 63 07                     	movslq	(%rdi), %rax
  80070c: 48 83 f8 28                  	cmpq	$40, %rax
  800710: 77 2b                        	ja	0x80073d <getuint+0x3d>
  800712: 48 89 c1                     	movq	%rax, %rcx
  800715: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800719: 83 c0 08                     	addl	$8, %eax
  80071c: 89 07                        	movl	%eax, (%rdi)
  80071e: eb 18                        	jmp	0x800738 <getuint+0x38>
  800720: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800723: 85 f6                        	testl	%esi, %esi
  800725: 74 27                        	je	0x80074e <getuint+0x4e>
  800727: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  80072a: 77 11                        	ja	0x80073d <getuint+0x3d>
  80072c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  800730: 48 01 c1                     	addq	%rax, %rcx
  800733: 83 c0 08                     	addl	$8, %eax
  800736: 89 07                        	movl	%eax, (%rdi)
  800738: 48 8b 01                     	movq	(%rcx), %rax
; }
  80073b: 5d                           	popq	%rbp
  80073c: c3                           	retq
  80073d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800741: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800745: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800749: 48 8b 00                     	movq	(%rax), %rax
; }
  80074c: 5d                           	popq	%rbp
  80074d: c3                           	retq
  80074e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800751: 77 0e                        	ja	0x800761 <getuint+0x61>
  800753: 48 89 c1                     	movq	%rax, %rcx
  800756: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80075a: 83 c0 08                     	addl	$8, %eax
  80075d: 89 07                        	movl	%eax, (%rdi)
  80075f: eb 0c                        	jmp	0x80076d <getuint+0x6d>
  800761: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800765: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800769: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80076d: 8b 01                        	movl	(%rcx), %eax
; }
  80076f: 5d                           	popq	%rbp
  800770: c3                           	retq
  800771: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80077b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800780 <printnum>:
; {
  800780: 55                           	pushq	%rbp
  800781: 48 89 e5                     	movq	%rsp, %rbp
  800784: 41 57                        	pushq	%r15
  800786: 41 56                        	pushq	%r14
  800788: 41 55                        	pushq	%r13
  80078a: 41 54                        	pushq	%r12
  80078c: 53                           	pushq	%rbx
  80078d: 50                           	pushq	%rax
  80078e: 45 89 cd                     	movl	%r9d, %r13d
  800791: 44 89 c3                     	movl	%r8d, %ebx
  800794: 49 89 f6                     	movq	%rsi, %r14
  800797: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  80079a: 41 89 cf                     	movl	%ecx, %r15d
  80079d: 49 39 d7                     	cmpq	%rdx, %r15
  8007a0: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  8007a4: 76 1d                        	jbe	0x8007c3 <printnum+0x43>
; 		while (--width > 0)
  8007a6: 83 fb 02                     	cmpl	$2, %ebx
  8007a9: 7c 37                        	jl	0x8007e2 <printnum+0x62>
  8007ab: 83 c3 01                     	addl	$1, %ebx
  8007ae: 66 90                        	nop
; 			putch(padc, putdat);
  8007b0: 44 89 ef                     	movl	%r13d, %edi
  8007b3: 4c 89 f6                     	movq	%r14, %rsi
  8007b6: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  8007b9: 83 c3 ff                     	addl	$-1, %ebx
  8007bc: 83 fb 02                     	cmpl	$2, %ebx
  8007bf: 7f ef                        	jg	0x8007b0 <printnum+0x30>
  8007c1: eb 1f                        	jmp	0x8007e2 <printnum+0x62>
  8007c3: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  8007c6: 31 d2                        	xorl	%edx, %edx
  8007c8: 49 f7 f7                     	divq	%r15
  8007cb: 83 c3 ff                     	addl	$-1, %ebx
  8007ce: 4c 89 e7                     	movq	%r12, %rdi
  8007d1: 4c 89 f6                     	movq	%r14, %rsi
  8007d4: 48 89 c2                     	movq	%rax, %rdx
  8007d7: 41 89 d8                     	movl	%ebx, %r8d
  8007da: 45 89 e9                     	movl	%r13d, %r9d
  8007dd: e8 9e ff ff ff               	callq	0x800780 <printnum>
  8007e2: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  8007e6: 31 d2                        	xorl	%edx, %edx
  8007e8: 49 f7 f7                     	divq	%r15
  8007eb: 48 8d 05 92 08 00 00         	leaq	2194(%rip), %rax        # 0x801084 <syscall.c+0x801084>
  8007f2: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  8007f6: 4c 89 f6                     	movq	%r14, %rsi
  8007f9: 41 ff d4                     	callq	*%r12
; }
  8007fc: 48 83 c4 08                  	addq	$8, %rsp
  800800: 5b                           	popq	%rbx
  800801: 41 5c                        	popq	%r12
  800803: 41 5d                        	popq	%r13
  800805: 41 5e                        	popq	%r14
  800807: 41 5f                        	popq	%r15
  800809: 5d                           	popq	%rbp
  80080a: c3                           	retq
  80080b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800810 <vsnprintf>:
; {
  800810: 55                           	pushq	%rbp
  800811: 48 89 e5                     	movq	%rsp, %rbp
  800814: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800818: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  80081c: 48 63 c6                     	movslq	%esi, %rax
  80081f: 48 01 f8                     	addq	%rdi, %rax
  800822: 48 83 c0 ff                  	addq	$-1, %rax
  800826: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80082a: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  800831: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  800836: 48 85 ff                     	testq	%rdi, %rdi
  800839: 74 1e                        	je	0x800859 <vsnprintf+0x49>
  80083b: 85 f6                        	testl	%esi, %esi
  80083d: 7e 1a                        	jle	0x800859 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80083f: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800860 <sprintputch>
  800846: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80084a: e8 61 f9 ff ff               	callq	0x8001b0 <vprintfmt>
; 	*b.buf = '\0';
  80084f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800853: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800856: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800859: 48 83 c4 20                  	addq	$32, %rsp
  80085d: 5d                           	popq	%rbp
  80085e: c3                           	retq
  80085f: 90                           	nop

0000000000800860 <sprintputch>:
; {
  800860: 55                           	pushq	%rbp
  800861: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800864: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800868: 48 8b 06                     	movq	(%rsi), %rax
  80086b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80086f: 73 0a                        	jae	0x80087b <sprintputch+0x1b>
; 		*b->buf++ = ch;
  800871: 48 8d 48 01                  	leaq	1(%rax), %rcx
  800875: 48 89 0e                     	movq	%rcx, (%rsi)
  800878: 40 88 38                     	movb	%dil, (%rax)
; }
  80087b: 5d                           	popq	%rbp
  80087c: c3                           	retq
  80087d: 0f 1f 00                     	nopl	(%rax)

0000000000800880 <snprintf>:
; {
  800880: 55                           	pushq	%rbp
  800881: 48 89 e5                     	movq	%rsp, %rbp
  800884: 48 83 ec 50                  	subq	$80, %rsp
  800888: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80088c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800890: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800894: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800898: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80089c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8008a0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8008a4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  8008ae: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8008b2: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  8008b6: e8 55 ff ff ff               	callq	0x800810 <vsnprintf>
; 	return rc;
  8008bb: 48 83 c4 50                  	addq	$80, %rsp
  8008bf: 5d                           	popq	%rbp
  8008c0: c3                           	retq
  8008c1: cc                           	int3
  8008c2: cc                           	int3
  8008c3: cc                           	int3
  8008c4: cc                           	int3
  8008c5: cc                           	int3
  8008c6: cc                           	int3
  8008c7: cc                           	int3
  8008c8: cc                           	int3
  8008c9: cc                           	int3
  8008ca: cc                           	int3
  8008cb: cc                           	int3
  8008cc: cc                           	int3
  8008cd: cc                           	int3
  8008ce: cc                           	int3
  8008cf: cc                           	int3

00000000008008d0 <strlen>:
; {
  8008d0: 55                           	pushq	%rbp
  8008d1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  8008d4: 80 3f 00                     	cmpb	$0, (%rdi)
  8008d7: 74 14                        	je	0x8008ed <strlen+0x1d>
  8008d9: 31 c0                        	xorl	%eax, %eax
  8008db: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  8008e0: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  8008e5: 48 8d 40 01                  	leaq	1(%rax), %rax
  8008e9: 75 f5                        	jne	0x8008e0 <strlen+0x10>
; 	return n;
  8008eb: 5d                           	popq	%rbp
  8008ec: c3                           	retq
  8008ed: 31 c0                        	xorl	%eax, %eax
; 	return n;
  8008ef: 5d                           	popq	%rbp
  8008f0: c3                           	retq
  8008f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800900 <strnlen>:
; {
  800900: 55                           	pushq	%rbp
  800901: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800904: 48 85 f6                     	testq	%rsi, %rsi
  800907: 74 18                        	je	0x800921 <strnlen+0x21>
  800909: 48 89 f0                     	movq	%rsi, %rax
  80090c: 31 c9                        	xorl	%ecx, %ecx
  80090e: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800910: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  800914: 74 0f                        	je	0x800925 <strnlen+0x25>
  800916: 48 83 c1 01                  	addq	$1, %rcx
  80091a: 48 39 c8                     	cmpq	%rcx, %rax
  80091d: 75 f1                        	jne	0x800910 <strnlen+0x10>
; 	return n;
  80091f: 5d                           	popq	%rbp
  800920: c3                           	retq
  800921: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800923: 5d                           	popq	%rbp
  800924: c3                           	retq
  800925: 89 c8                        	movl	%ecx, %eax
; 	return n;
  800927: 5d                           	popq	%rbp
  800928: c3                           	retq
  800929: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800930 <strcpy>:
; {
  800930: 55                           	pushq	%rbp
  800931: 48 89 e5                     	movq	%rsp, %rbp
  800934: 48 89 f8                     	movq	%rdi, %rax
  800937: 31 c9                        	xorl	%ecx, %ecx
  800939: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  800940: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  800944: 88 14 08                     	movb	%dl, (%rax,%rcx)
  800947: 48 83 c1 01                  	addq	$1, %rcx
  80094b: 84 d2                        	testb	%dl, %dl
  80094d: 75 f1                        	jne	0x800940 <strcpy+0x10>
; 	return ret;
  80094f: 5d                           	popq	%rbp
  800950: c3                           	retq
  800951: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80095b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800960 <strcat>:
; {
  800960: 55                           	pushq	%rbp
  800961: 48 89 e5                     	movq	%rsp, %rbp
  800964: 41 56                        	pushq	%r14
  800966: 53                           	pushq	%rbx
  800967: 49 89 f6                     	movq	%rsi, %r14
  80096a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  80096d: e8 5e ff ff ff               	callq	0x8008d0 <strlen>
; 	strcpy(dst + len, src);
  800972: 48 63 f8                     	movslq	%eax, %rdi
  800975: 48 01 df                     	addq	%rbx, %rdi
  800978: 4c 89 f6                     	movq	%r14, %rsi
  80097b: e8 b0 ff ff ff               	callq	0x800930 <strcpy>
; 	return dst;
  800980: 48 89 d8                     	movq	%rbx, %rax
  800983: 5b                           	popq	%rbx
  800984: 41 5e                        	popq	%r14
  800986: 5d                           	popq	%rbp
  800987: c3                           	retq
  800988: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800990 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800990: 55                           	pushq	%rbp
  800991: 48 89 e5                     	movq	%rsp, %rbp
  800994: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800997: 48 85 d2                     	testq	%rdx, %rdx
  80099a: 74 1a                        	je	0x8009b6 <strncpy+0x26>
  80099c: 31 ff                        	xorl	%edi, %edi
  80099e: 66 90                        	nop
; 		*dst++ = *src;
  8009a0: 0f b6 0e                     	movzbl	(%rsi), %ecx
  8009a3: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  8009a6: 80 3e 01                     	cmpb	$1, (%rsi)
  8009a9: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  8009ad: 48 83 c7 01                  	addq	$1, %rdi
  8009b1: 48 39 fa                     	cmpq	%rdi, %rdx
  8009b4: 75 ea                        	jne	0x8009a0 <strncpy+0x10>
; 	return ret;
  8009b6: 5d                           	popq	%rbp
  8009b7: c3                           	retq
  8009b8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

00000000008009c0 <strlcpy>:
; {
  8009c0: 55                           	pushq	%rbp
  8009c1: 48 89 e5                     	movq	%rsp, %rbp
  8009c4: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  8009c7: 48 85 d2                     	testq	%rdx, %rdx
  8009ca: 74 2e                        	je	0x8009fa <strlcpy+0x3a>
  8009cc: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  8009cf: 48 83 c2 ff                  	addq	$-1, %rdx
  8009d3: 74 22                        	je	0x8009f7 <strlcpy+0x37>
  8009d5: 31 c0                        	xorl	%eax, %eax
  8009d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  8009e0: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  8009e4: 84 c9                        	testb	%cl, %cl
  8009e6: 74 0c                        	je	0x8009f4 <strlcpy+0x34>
; 			*dst++ = *src++;
  8009e8: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  8009eb: 48 83 c0 01                  	addq	$1, %rax
  8009ef: 48 39 c2                     	cmpq	%rax, %rdx
  8009f2: 75 ec                        	jne	0x8009e0 <strlcpy+0x20>
  8009f4: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  8009f7: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8009fa: 48 29 f8                     	subq	%rdi, %rax
  8009fd: 5d                           	popq	%rbp
  8009fe: c3                           	retq
  8009ff: 90                           	nop

0000000000800a00 <strcmp>:
; {
  800a00: 55                           	pushq	%rbp
  800a01: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  800a04: 8a 07                        	movb	(%rdi), %al
  800a06: 84 c0                        	testb	%al, %al
  800a08: 74 19                        	je	0x800a23 <strcmp+0x23>
  800a0a: 48 83 c7 01                  	addq	$1, %rdi
  800a0e: 66 90                        	nop
  800a10: 3a 06                        	cmpb	(%rsi), %al
  800a12: 75 0f                        	jne	0x800a23 <strcmp+0x23>
; 		p++, q++;
  800a14: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800a18: 0f b6 07                     	movzbl	(%rdi), %eax
  800a1b: 48 83 c7 01                  	addq	$1, %rdi
  800a1f: 84 c0                        	testb	%al, %al
  800a21: 75 ed                        	jne	0x800a10 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800a23: 0f b6 c0                     	movzbl	%al, %eax
  800a26: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800a29: 29 c8                        	subl	%ecx, %eax
  800a2b: 5d                           	popq	%rbp
  800a2c: c3                           	retq
  800a2d: 0f 1f 00                     	nopl	(%rax)

0000000000800a30 <strncmp>:
; {
  800a30: 55                           	pushq	%rbp
  800a31: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800a34: 48 85 d2                     	testq	%rdx, %rdx
  800a37: 74 1d                        	je	0x800a56 <strncmp+0x26>
  800a39: 31 c9                        	xorl	%ecx, %ecx
  800a3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800a40: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800a44: 85 c0                        	testl	%eax, %eax
  800a46: 74 12                        	je	0x800a5a <strncmp+0x2a>
  800a48: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800a4b: 75 0d                        	jne	0x800a5a <strncmp+0x2a>
  800a4d: 48 83 c1 01                  	addq	$1, %rcx
  800a51: 48 39 ca                     	cmpq	%rcx, %rdx
  800a54: 75 ea                        	jne	0x800a40 <strncmp+0x10>
  800a56: 31 c0                        	xorl	%eax, %eax
; }
  800a58: 5d                           	popq	%rbp
  800a59: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800a5a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800a5e: 29 c8                        	subl	%ecx, %eax
; }
  800a60: 5d                           	popq	%rbp
  800a61: c3                           	retq
  800a62: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a6c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800a70 <strchr>:
; {
  800a70: 55                           	pushq	%rbp
  800a71: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800a74: 8a 0f                        	movb	(%rdi), %cl
  800a76: 84 c9                        	testb	%cl, %cl
  800a78: 74 17                        	je	0x800a91 <strchr+0x21>
  800a7a: 48 89 f8                     	movq	%rdi, %rax
  800a7d: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800a80: 40 38 f1                     	cmpb	%sil, %cl
  800a83: 74 0e                        	je	0x800a93 <strchr+0x23>
; 	for (; *s; s++)
  800a85: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800a89: 48 83 c0 01                  	addq	$1, %rax
  800a8d: 84 c9                        	testb	%cl, %cl
  800a8f: 75 ef                        	jne	0x800a80 <strchr+0x10>
  800a91: 31 c0                        	xorl	%eax, %eax
; }
  800a93: 5d                           	popq	%rbp
  800a94: c3                           	retq
  800a95: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a9f: 90                           	nop

0000000000800aa0 <strfind>:
; {
  800aa0: 55                           	pushq	%rbp
  800aa1: 48 89 e5                     	movq	%rsp, %rbp
  800aa4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800aa7: 48 83 c0 ff                  	addq	$-1, %rax
  800aab: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800ab0: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800ab4: 48 83 c0 01                  	addq	$1, %rax
  800ab8: 84 c9                        	testb	%cl, %cl
  800aba: 74 05                        	je	0x800ac1 <strfind+0x21>
  800abc: 40 38 f1                     	cmpb	%sil, %cl
  800abf: 75 ef                        	jne	0x800ab0 <strfind+0x10>
; 	return (char *) s;
  800ac1: 5d                           	popq	%rbp
  800ac2: c3                           	retq
  800ac3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800acd: 0f 1f 00                     	nopl	(%rax)

0000000000800ad0 <memset>:
; {
  800ad0: 55                           	pushq	%rbp
  800ad1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800ad4: 48 85 d2                     	testq	%rdx, %rdx
  800ad7: 74 36                        	je	0x800b0f <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800ad9: 89 f8                        	movl	%edi, %eax
  800adb: 09 d0                        	orl	%edx, %eax
  800add: a8 03                        	testb	$3, %al
  800adf: 74 0a                        	je	0x800aeb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800ae1: 89 f0                        	movl	%esi, %eax
  800ae3: 48 89 d1                     	movq	%rdx, %rcx
  800ae6: fc                           	cld
  800ae7: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800ae9: eb 24                        	jmp	0x800b0f <memset+0x3f>
; 		c &= 0xFF;
  800aeb: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800aef: c1 e6 18                     	shll	$24, %esi
  800af2: 44 89 c1                     	movl	%r8d, %ecx
  800af5: c1 e1 10                     	shll	$16, %ecx
  800af8: 09 f1                        	orl	%esi, %ecx
  800afa: 44 89 c0                     	movl	%r8d, %eax
  800afd: c1 e0 08                     	shll	$8, %eax
  800b00: 09 c8                        	orl	%ecx, %eax
  800b02: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800b05: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800b09: 48 89 d1                     	movq	%rdx, %rcx
  800b0c: fc                           	cld
  800b0d: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800b0f: 48 89 f8                     	movq	%rdi, %rax
  800b12: 5d                           	popq	%rbp
  800b13: c3                           	retq
  800b14: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b1e: 66 90                        	nop

0000000000800b20 <memmove>:
; {
  800b20: 55                           	pushq	%rbp
  800b21: 48 89 e5                     	movq	%rsp, %rbp
  800b24: 48 89 d1                     	movq	%rdx, %rcx
  800b27: 48 89 f2                     	movq	%rsi, %rdx
  800b2a: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800b2d: 48 39 fe                     	cmpq	%rdi, %rsi
  800b30: 73 38                        	jae	0x800b6a <memmove+0x4a>
  800b32: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800b36: 48 39 c6                     	cmpq	%rax, %rsi
  800b39: 76 2f                        	jbe	0x800b6a <memmove+0x4a>
; 		d += n;
  800b3b: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800b3f: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b42: 75 4e                        	jne	0x800b92 <memmove+0x72>
  800b44: 89 f2                        	movl	%esi, %edx
  800b46: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b49: 48 85 d2                     	testq	%rdx, %rdx
  800b4c: 75 44                        	jne	0x800b92 <memmove+0x72>
  800b4e: 89 fa                        	movl	%edi, %edx
  800b50: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b53: 48 85 d2                     	testq	%rdx, %rdx
  800b56: 75 3a                        	jne	0x800b92 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800b58: 48 83 c7 fc                  	addq	$-4, %rdi
  800b5c: 48 83 c6 fc                  	addq	$-4, %rsi
  800b60: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800b64: fd                           	std
  800b65: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b67: fc                           	cld
; 	return dst;
  800b68: 5d                           	popq	%rbp
  800b69: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b6a: 89 d6                        	movl	%edx, %esi
  800b6c: 09 c6                        	orl	%eax, %esi
  800b6e: 89 cf                        	movl	%ecx, %edi
  800b70: 09 f7                        	orl	%esi, %edi
  800b72: 40 f6 c7 03                  	testb	$3, %dil
  800b76: 74 0b                        	je	0x800b83 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800b78: 48 89 c7                     	movq	%rax, %rdi
  800b7b: 48 89 d6                     	movq	%rdx, %rsi
  800b7e: fc                           	cld
  800b7f: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800b81: 5d                           	popq	%rbp
  800b82: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800b83: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800b87: 48 89 c7                     	movq	%rax, %rdi
  800b8a: 48 89 d6                     	movq	%rdx, %rsi
  800b8d: fc                           	cld
  800b8e: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800b90: 5d                           	popq	%rbp
  800b91: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800b92: 48 83 c7 ff                  	addq	$-1, %rdi
  800b96: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800b9a: fd                           	std
  800b9b: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b9d: fc                           	cld
; 	return dst;
  800b9e: 5d                           	popq	%rbp
  800b9f: c3                           	retq

0000000000800ba0 <memcpy>:
; {
  800ba0: 55                           	pushq	%rbp
  800ba1: 48 89 e5                     	movq	%rsp, %rbp
  800ba4: 53                           	pushq	%rbx
  800ba5: 50                           	pushq	%rax
  800ba6: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800ba9: e8 72 ff ff ff               	callq	0x800b20 <memmove>
  800bae: 48 89 d8                     	movq	%rbx, %rax
  800bb1: 48 83 c4 08                  	addq	$8, %rsp
  800bb5: 5b                           	popq	%rbx
  800bb6: 5d                           	popq	%rbp
  800bb7: c3                           	retq
  800bb8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800bc0 <memcmp>:
; {
  800bc0: 55                           	pushq	%rbp
  800bc1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800bc4: 48 85 d2                     	testq	%rdx, %rdx
  800bc7: 74 1e                        	je	0x800be7 <memcmp+0x27>
  800bc9: 31 c9                        	xorl	%ecx, %ecx
  800bcb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800bd0: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800bd4: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800bd9: 44 38 c0                     	cmpb	%r8b, %al
  800bdc: 75 0d                        	jne	0x800beb <memcmp+0x2b>
; 	while (n-- > 0) {
  800bde: 48 83 c1 01                  	addq	$1, %rcx
  800be2: 48 39 ca                     	cmpq	%rcx, %rdx
  800be5: 75 e9                        	jne	0x800bd0 <memcmp+0x10>
  800be7: 31 c0                        	xorl	%eax, %eax
; }
  800be9: 5d                           	popq	%rbp
  800bea: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800beb: 44 29 c0                     	subl	%r8d, %eax
; }
  800bee: 5d                           	popq	%rbp
  800bef: c3                           	retq

0000000000800bf0 <memfind>:
; {
  800bf0: 55                           	pushq	%rbp
  800bf1: 48 89 e5                     	movq	%rsp, %rbp
  800bf4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800bf7: 48 85 d2                     	testq	%rdx, %rdx
  800bfa: 7e 12                        	jle	0x800c0e <memfind+0x1e>
  800bfc: 48 01 c2                     	addq	%rax, %rdx
  800bff: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800c00: 40 38 30                     	cmpb	%sil, (%rax)
  800c03: 74 09                        	je	0x800c0e <memfind+0x1e>
; 	for (; s < ends; s++)
  800c05: 48 83 c0 01                  	addq	$1, %rax
  800c09: 48 39 d0                     	cmpq	%rdx, %rax
  800c0c: 72 f2                        	jb	0x800c00 <memfind+0x10>
; 	return (void *) s;
  800c0e: 5d                           	popq	%rbp
  800c0f: c3                           	retq

0000000000800c10 <strtol>:
; {
  800c10: 55                           	pushq	%rbp
  800c11: 48 89 e5                     	movq	%rsp, %rbp
  800c14: 48 8d 05 21 06 00 00         	leaq	1569(%rip), %rax        # 0x80123c <syscall.c+0x80123c>
  800c1b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800c20: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800c23: 80 c1 f7                     	addb	$-9, %cl
  800c26: 80 f9 24                     	cmpb	$36, %cl
  800c29: 77 16                        	ja	0x800c41 <strtol+0x31>
  800c2b: 0f b6 c9                     	movzbl	%cl, %ecx
  800c2e: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800c32: 48 01 c1                     	addq	%rax, %rcx
  800c35: ff e1                        	jmpq	*%rcx
; 		s++;
  800c37: 48 83 c7 01                  	addq	$1, %rdi
  800c3b: eb e3                        	jmp	0x800c20 <strtol+0x10>
; 		s++;
  800c3d: 48 83 c7 01                  	addq	$1, %rdi
  800c41: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c44: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c4a: 75 27                        	jne	0x800c73 <strtol+0x63>
  800c4c: eb 0f                        	jmp	0x800c5d <strtol+0x4d>
; 		s++, neg = 1;
  800c4e: 48 83 c7 01                  	addq	$1, %rdi
  800c52: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c55: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c5b: 75 16                        	jne	0x800c73 <strtol+0x63>
  800c5d: 80 3f 30                     	cmpb	$48, (%rdi)
  800c60: 75 11                        	jne	0x800c73 <strtol+0x63>
  800c62: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800c66: 75 0b                        	jne	0x800c73 <strtol+0x63>
; 		s += 2, base = 16;
  800c68: 48 83 c7 02                  	addq	$2, %rdi
  800c6c: ba 10 00 00 00               	movl	$16, %edx
  800c71: eb 1a                        	jmp	0x800c8d <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c73: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800c75: 75 16                        	jne	0x800c8d <strtol+0x7d>
  800c77: 31 c0                        	xorl	%eax, %eax
  800c79: 31 c9                        	xorl	%ecx, %ecx
  800c7b: 80 3f 30                     	cmpb	$48, (%rdi)
  800c7e: 0f 95 c0                     	setne	%al
  800c81: 0f 94 c1                     	sete	%cl
  800c84: 48 01 cf                     	addq	%rcx, %rdi
  800c87: 8d 14 00                     	leal	(%rax,%rax), %edx
  800c8a: 83 c2 08                     	addl	$8, %edx
  800c8d: 4c 63 ca                     	movslq	%edx, %r9
  800c90: 45 31 d2                     	xorl	%r10d, %r10d
  800c93: eb 2f                        	jmp	0x800cc4 <strtol+0xb4>
  800c95: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c9f: 90                           	nop
  800ca0: 31 c0                        	xorl	%eax, %eax
  800ca2: 84 c0                        	testb	%al, %al
  800ca4: 75 1e                        	jne	0x800cc4 <strtol+0xb4>
  800ca6: eb 51                        	jmp	0x800cf9 <strtol+0xe9>
  800ca8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800cb0: 48 83 c7 01                  	addq	$1, %rdi
  800cb4: 4d 0f af d1                  	imulq	%r9, %r10
  800cb8: 48 63 c1                     	movslq	%ecx, %rax
  800cbb: 49 01 c2                     	addq	%rax, %r10
  800cbe: b0 01                        	movb	$1, %al
  800cc0: 84 c0                        	testb	%al, %al
  800cc2: 74 35                        	je	0x800cf9 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800cc4: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800cc8: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800ccc: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800cd1: 3c 0a                        	cmpb	$10, %al
  800cd3: 72 1b                        	jb	0x800cf0 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800cd5: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800cd9: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800cde: 3c 1a                        	cmpb	$26, %al
  800ce0: 72 0e                        	jb	0x800cf0 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800ce2: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800ce6: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800ceb: 3c 19                        	cmpb	$25, %al
  800ced: 77 b1                        	ja	0x800ca0 <strtol+0x90>
  800cef: 90                           	nop
  800cf0: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800cf3: 39 d1                        	cmpl	%edx, %ecx
  800cf5: 7c b9                        	jl	0x800cb0 <strtol+0xa0>
  800cf7: eb a7                        	jmp	0x800ca0 <strtol+0x90>
; 	if (endptr)
  800cf9: 48 85 f6                     	testq	%rsi, %rsi
  800cfc: 74 03                        	je	0x800d01 <strtol+0xf1>
; 		*endptr = (char *) s;
  800cfe: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800d01: 4c 89 d0                     	movq	%r10, %rax
  800d04: 48 f7 d8                     	negq	%rax
  800d07: 45 84 c0                     	testb	%r8b, %r8b
  800d0a: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800d0e: 5d                           	popq	%rbp
  800d0f: c3                           	retq

0000000000800d10 <puts>:
; {
  800d10: 55                           	pushq	%rbp
  800d11: 48 89 e5                     	movq	%rsp, %rbp
  800d14: 48 89 f1                     	movq	%rsi, %rcx
  800d17: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800d1a: 31 ff                        	xorl	%edi, %edi
  800d1c: 31 f6                        	xorl	%esi, %esi
  800d1e: e8 0d 00 00 00               	callq	0x800d30 <syscall>
; }
  800d23: 5d                           	popq	%rbp
  800d24: c3                           	retq
  800d25: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800d2f: 90                           	nop

0000000000800d30 <syscall>:
; {
  800d30: 55                           	pushq	%rbp
  800d31: 48 89 e5                     	movq	%rsp, %rbp
  800d34: 48 83 ec 10                  	subq	$16, %rsp
  800d38: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800d3a: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800d42: 48 89 d6                     	movq	%rdx, %rsi
  800d45: 48 89 ca                     	movq	%rcx, %rdx
  800d48: 31 c9                        	xorl	%ecx, %ecx
  800d4a: 45 31 c0                     	xorl	%r8d, %r8d
  800d4d: 45 31 c9                     	xorl	%r9d, %r9d
  800d50: e8 63 00 00 00               	callq	0x800db8 <do_syscall>
; 	return ret;
  800d55: 48 83 c4 10                  	addq	$16, %rsp
  800d59: 5d                           	popq	%rbp
  800d5a: c3                           	retq
  800d5b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800d60 <getc>:
; {
  800d60: 55                           	pushq	%rbp
  800d61: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800d64: bf 01 00 00 00               	movl	$1, %edi
  800d69: 31 f6                        	xorl	%esi, %esi
  800d6b: 31 d2                        	xorl	%edx, %edx
  800d6d: 31 c9                        	xorl	%ecx, %ecx
  800d6f: e8 bc ff ff ff               	callq	0x800d30 <syscall>
  800d74: 5d                           	popq	%rbp
  800d75: c3                           	retq
  800d76: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800d80 <kill>:
; {
  800d80: 55                           	pushq	%rbp
  800d81: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800d84: 48 63 d7                     	movslq	%edi, %rdx
  800d87: bf 03 00 00 00               	movl	$3, %edi
  800d8c: be 01 00 00 00               	movl	$1, %esi
  800d91: 31 c9                        	xorl	%ecx, %ecx
  800d93: e8 98 ff ff ff               	callq	0x800d30 <syscall>
  800d98: 5d                           	popq	%rbp
  800d99: c3                           	retq
  800d9a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800da0 <getpid>:
; {
  800da0: 55                           	pushq	%rbp
  800da1: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800da4: bf 02 00 00 00               	movl	$2, %edi
  800da9: 31 f6                        	xorl	%esi, %esi
  800dab: 31 d2                        	xorl	%edx, %edx
  800dad: 31 c9                        	xorl	%ecx, %ecx
  800daf: e8 7c ff ff ff               	callq	0x800d30 <syscall>
  800db4: 5d                           	popq	%rbp
  800db5: c3                           	retq
  800db6: cc                           	int3
  800db7: cc                           	int3

0000000000800db8 <do_syscall>:
; 	pushq %rbp
  800db8: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800db9: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	movq %rcx, %r10
  800dbe: 49 89 ca                     	movq	%rcx, %r10
; 	syscall
  800dc1: 0f 05                        	syscall
; 	popq %rbp
  800dc3: 5d                           	popq	%rbp
; 	retq
  800dc4: c3                           	retq
