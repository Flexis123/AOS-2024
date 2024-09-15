
obj/user/nullread:	file format elf64-x86-64

Disassembly of section .text:

0000000000800020 <_start>:
; 	movabsq $USTACK_TOP, %rax
  800020: 48 b8 00 e0 ff ff ff 7f 00 00	movabsq	$0x7fffffffe000, %rax   # imm = 0x7FFFFFFFE000
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
  800044: 48 83 ec 10                  	subq	$0x10, %rsp
  800048: c7 45 fc 00 00 00 00         	movl	$0x0, -0x4(%rbp)
  80004f: 89 7d f8                     	movl	%edi, -0x8(%rbp)
  800052: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	printf("I read %02x from location 0!\n", *(volatile char *)NULL);
  800056: 31 c0                        	xorl	%eax, %eax
  800058: 8a 00                        	movb	(%rax), %al
  80005a: 0f be f0                     	movsbl	%al, %esi
  80005d: 48 8d 3d dd 1f 00 00         	leaq	0x1fdd(%rip), %rdi      # 0x802041
  800064: b0 00                        	movb	$0x0, %al
  800066: e8 55 01 00 00               	callq	0x8001c0 <printf>
; 	return 0;
  80006b: 31 c0                        	xorl	%eax, %eax
  80006d: 48 83 c4 10                  	addq	$0x10, %rsp
  800071: 5d                           	popq	%rbp
  800072: c3                           	retq
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
  800084: 48 83 ec 10                  	subq	$0x10, %rsp
  800088: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  80008b: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	if (argc > 0) {
  80008f: 83 7d fc 00                  	cmpl	$0x0, -0x4(%rbp)
  800093: 0f 8e 11 00 00 00            	jle	0x8000aa <libmain+0x2a>
; 		binary_name = argv[0];
  800099: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80009d: 48 8b 08                     	movq	(%rax), %rcx
  8000a0: 48 8d 05 59 2f 00 00         	leaq	0x2f59(%rip), %rax      # 0x803000 <binary_name>
  8000a7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8000aa: 8b 7d fc                     	movl	-0x4(%rbp), %edi
  8000ad: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8000b1: e8 8a ff ff ff               	callq	0x800040 <main>
; 	exit();
  8000b6: e8 15 00 00 00               	callq	0x8000d0 <exit>
; }
  8000bb: 48 83 c4 10                  	addq	$0x10, %rsp
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
  8000d6: e8 c5 17 00 00               	callq	0x8018a0 <kill>
; }
  8000db: 5d                           	popq	%rbp
  8000dc: c3                           	retq
  8000dd: cc                           	int3
  8000de: cc                           	int3
  8000df: cc                           	int3

00000000008000e0 <vprintf>:
; {
  8000e0: 55                           	pushq	%rbp
  8000e1: 48 89 e5                     	movq	%rsp, %rbp
  8000e4: 48 81 ec 20 01 00 00         	subq	$0x120, %rsp            # imm = 0x120
  8000eb: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8000ef: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b.idx = 0;
  8000f3: c7 85 e8 fe ff ff 00 00 00 00	movl	$0x0, -0x118(%rbp)
; 	b.cnt = 0;
  8000fd: c7 85 ec fe ff ff 00 00 00 00	movl	$0x0, -0x114(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800107: 48 8d b5 e8 fe ff ff         	leaq	-0x118(%rbp), %rsi
  80010e: 48 8b 55 f8                  	movq	-0x8(%rbp), %rdx
  800112: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  800116: 48 8d 3d 33 00 00 00         	leaq	0x33(%rip), %rdi        # 0x800150 <putch>
  80011d: e8 fe 00 00 00               	callq	0x800220 <vprintfmt>
; 	puts(b.buf, b.idx);
  800122: 48 8d bd e8 fe ff ff         	leaq	-0x118(%rbp), %rdi
  800129: 48 83 c7 08                  	addq	$0x8, %rdi
  80012d: 48 63 b5 e8 fe ff ff         	movslq	-0x118(%rbp), %rsi
  800134: e8 57 16 00 00               	callq	0x801790 <puts>
; 	return b.cnt;
  800139: 8b 85 ec fe ff ff            	movl	-0x114(%rbp), %eax
  80013f: 48 81 c4 20 01 00 00         	addq	$0x120, %rsp            # imm = 0x120
  800146: 5d                           	popq	%rbp
  800147: c3                           	retq
  800148: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800150 <putch>:
; {
  800150: 55                           	pushq	%rbp
  800151: 48 89 e5                     	movq	%rsp, %rbp
  800154: 48 83 ec 10                  	subq	$0x10, %rsp
  800158: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  80015b: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b->buf[b->idx++] = ch;
  80015f: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800162: 88 c2                        	movb	%al, %dl
  800164: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800168: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80016c: 8b 0e                        	movl	(%rsi), %ecx
  80016e: 89 cf                        	movl	%ecx, %edi
  800170: 83 c7 01                     	addl	$0x1, %edi
  800173: 89 3e                        	movl	%edi, (%rsi)
  800175: 48 63 c9                     	movslq	%ecx, %rcx
  800178: 88 54 08 08                  	movb	%dl, 0x8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80017c: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800180: 81 38 ff 00 00 00            	cmpl	$0xff, (%rax)
  800186: 0f 85 1e 00 00 00            	jne	0x8001aa <putch+0x5a>
; 		puts(b->buf, b->idx);
  80018c: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  800190: 48 83 c7 08                  	addq	$0x8, %rdi
  800194: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800198: 48 63 30                     	movslq	(%rax), %rsi
  80019b: e8 f0 15 00 00               	callq	0x801790 <puts>
; 		b->idx = 0;
  8001a0: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8001a4: c7 00 00 00 00 00            	movl	$0x0, (%rax)
; 	b->cnt++;
  8001aa: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8001ae: 8b 48 04                     	movl	0x4(%rax), %ecx
  8001b1: 83 c1 01                     	addl	$0x1, %ecx
  8001b4: 89 48 04                     	movl	%ecx, 0x4(%rax)
; }
  8001b7: 48 83 c4 10                  	addq	$0x10, %rsp
  8001bb: 5d                           	popq	%rbp
  8001bc: c3                           	retq
  8001bd: 0f 1f 00                     	nopl	(%rax)

00000000008001c0 <printf>:
; {
  8001c0: 55                           	pushq	%rbp
  8001c1: 48 89 e5                     	movq	%rsp, %rbp
  8001c4: 48 83 ec 60                  	subq	$0x60, %rsp
  8001c8: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  8001cc: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  8001d0: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  8001d4: 48 89 55 b0                  	movq	%rdx, -0x50(%rbp)
  8001d8: 48 89 75 a8                  	movq	%rsi, -0x58(%rbp)
  8001dc: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8001e0: 48 8d 45 a0                  	leaq	-0x60(%rbp), %rax
; 	va_start(ap, fmt);
  8001e4: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  8001e8: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  8001ec: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  8001f0: c7 45 e4 30 00 00 00         	movl	$0x30, -0x1c(%rbp)
  8001f7: c7 45 e0 08 00 00 00         	movl	$0x8, -0x20(%rbp)
; 	cnt = vprintf(fmt, ap);
  8001fe: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800202: 48 8d 75 e0                  	leaq	-0x20(%rbp), %rsi
  800206: e8 d5 fe ff ff               	callq	0x8000e0 <vprintf>
  80020b: 89 45 dc                     	movl	%eax, -0x24(%rbp)
; 	return cnt;
  80020e: 8b 45 dc                     	movl	-0x24(%rbp), %eax
  800211: 48 83 c4 60                  	addq	$0x60, %rsp
  800215: 5d                           	popq	%rbp
  800216: c3                           	retq
  800217: cc                           	int3
  800218: cc                           	int3
  800219: cc                           	int3
  80021a: cc                           	int3
  80021b: cc                           	int3
  80021c: cc                           	int3
  80021d: cc                           	int3
  80021e: cc                           	int3
  80021f: cc                           	int3

0000000000800220 <vprintfmt>:
; {
  800220: 55                           	pushq	%rbp
  800221: 48 89 e5                     	movq	%rsp, %rbp
  800224: 48 81 ec 00 01 00 00         	subq	$0x100, %rsp            # imm = 0x100
  80022b: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80022f: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800233: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800237: 48 89 4d e0                  	movq	%rcx, -0x20(%rbp)
; 	va_copy(ap, tmp_ap);
  80023b: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  80023f: 48 8b 55 e0                  	movq	-0x20(%rbp), %rdx
  800243: 48 8b 4a 10                  	movq	0x10(%rdx), %rcx
  800247: 48 89 48 10                  	movq	%rcx, 0x10(%rax)
  80024b: 48 8b 0a                     	movq	(%rdx), %rcx
  80024e: 48 8b 52 08                  	movq	0x8(%rdx), %rdx
  800252: 48 89 50 08                  	movq	%rdx, 0x8(%rax)
  800256: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800259: e9 00 00 00 00               	jmp	0x80025e <vprintfmt+0x3e>
  80025e: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800262: 48 89 c1                     	movq	%rax, %rcx
  800265: 48 83 c1 01                  	addq	$0x1, %rcx
  800269: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  80026d: 0f b6 00                     	movzbl	(%rax), %eax
  800270: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
  800273: 83 f8 25                     	cmpl	$0x25, %eax
  800276: 0f 84 25 00 00 00            	je	0x8002a1 <vprintfmt+0x81>
; 			if (ch == '\0')
  80027c: 83 7d b4 00                  	cmpl	$0x0, -0x4c(%rbp)
  800280: 0f 85 09 00 00 00            	jne	0x80028f <vprintfmt+0x6f>
; 				return;
  800286: 48 81 c4 00 01 00 00         	addq	$0x100, %rsp            # imm = 0x100
  80028d: 5d                           	popq	%rbp
  80028e: c3                           	retq
; 			putch(ch, putdat);
  80028f: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800293: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  800296: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80029a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80029c: e9 bd ff ff ff               	jmp	0x80025e <vprintfmt+0x3e>
; 		padc = ' ';
  8002a1: c6 45 93 20                  	movb	$0x20, -0x6d(%rbp)
; 		width = -1;
  8002a5: c7 45 9c ff ff ff ff         	movl	$0xffffffff, -0x64(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8002ac: c7 45 98 ff ff ff ff         	movl	$0xffffffff, -0x68(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8002b3: c7 45 a0 00 00 00 00         	movl	$0x0, -0x60(%rbp)
; 		altflag = 0;
  8002ba: c7 45 94 00 00 00 00         	movl	$0x0, -0x6c(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8002c1: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8002c5: 48 89 c1                     	movq	%rax, %rcx
  8002c8: 48 83 c1 01                  	addq	$0x1, %rcx
  8002cc: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  8002d0: 0f b6 00                     	movzbl	(%rax), %eax
  8002d3: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
  8002d6: 83 c0 dd                     	addl	$-0x23, %eax
  8002d9: 89 c1                        	movl	%eax, %ecx
  8002db: 48 89 4d 88                  	movq	%rcx, -0x78(%rbp)
  8002df: 83 e8 55                     	subl	$0x55, %eax
  8002e2: 0f 87 c1 05 00 00            	ja	0x8008a9 <vprintfmt+0x689>
  8002e8: 48 8b 45 88                  	movq	-0x78(%rbp), %rax
  8002ec: 48 8d 0d 41 1e 00 00         	leaq	0x1e41(%rip), %rcx      # 0x802134
  8002f3: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  8002f7: 48 01 c8                     	addq	%rcx, %rax
  8002fa: ff e0                        	jmpq	*%rax
; 			padc = '-';
  8002fc: c6 45 93 2d                  	movb	$0x2d, -0x6d(%rbp)
; 			goto reswitch;
  800300: e9 bc ff ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			padc = '0';
  800305: c6 45 93 30                  	movb	$0x30, -0x6d(%rbp)
; 			goto reswitch;
  800309: e9 b3 ff ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80030e: c7 45 98 00 00 00 00         	movl	$0x0, -0x68(%rbp)
; 				precision = precision * 10 + ch - '0';
  800315: 6b 45 98 0a                  	imull	$0xa, -0x68(%rbp), %eax
  800319: 03 45 b4                     	addl	-0x4c(%rbp), %eax
  80031c: 83 e8 30                     	subl	$0x30, %eax
  80031f: 89 45 98                     	movl	%eax, -0x68(%rbp)
; 				ch = *fmt;
  800322: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800326: 0f be 00                     	movsbl	(%rax), %eax
  800329: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
; 				if (ch < '0' || ch > '9')
  80032c: 83 7d b4 30                  	cmpl	$0x30, -0x4c(%rbp)
  800330: 0f 8c 0a 00 00 00            	jl	0x800340 <vprintfmt+0x120>
  800336: 83 7d b4 39                  	cmpl	$0x39, -0x4c(%rbp)
  80033a: 0f 8e 05 00 00 00            	jle	0x800345 <vprintfmt+0x125>
; 					break;
  800340: e9 16 00 00 00               	jmp	0x80035b <vprintfmt+0x13b>
; 			}
  800345: e9 00 00 00 00               	jmp	0x80034a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80034a: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  80034e: 48 83 c0 01                  	addq	$0x1, %rax
  800352: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  800356: e9 ba ff ff ff               	jmp	0x800315 <vprintfmt+0xf5>
; 			goto process_precision;
  80035b: e9 8c 00 00 00               	jmp	0x8003ec <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800360: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800364: 48 89 85 78 ff ff ff         	movq	%rax, -0x88(%rbp)
  80036b: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  80036e: 89 45 84                     	movl	%eax, -0x7c(%rbp)
  800371: 83 f8 28                     	cmpl	$0x28, %eax
  800374: 0f 87 22 00 00 00            	ja	0x80039c <vprintfmt+0x17c>
  80037a: 48 8b 8d 78 ff ff ff         	movq	-0x88(%rbp), %rcx
  800381: 8b 55 84                     	movl	-0x7c(%rbp), %edx
; 			precision = va_arg(ap, int);
  800384: 48 63 c2                     	movslq	%edx, %rax
  800387: 48 03 41 10                  	addq	0x10(%rcx), %rax
  80038b: 83 c2 08                     	addl	$0x8, %edx
  80038e: 89 11                        	movl	%edx, (%rcx)
  800390: 48 89 85 70 ff ff ff         	movq	%rax, -0x90(%rbp)
  800397: e9 1d 00 00 00               	jmp	0x8003b9 <vprintfmt+0x199>
  80039c: 48 8b 8d 78 ff ff ff         	movq	-0x88(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8003a3: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  8003a7: 48 89 d0                     	movq	%rdx, %rax
  8003aa: 48 83 c2 08                  	addq	$0x8, %rdx
  8003ae: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8003b2: 48 89 85 70 ff ff ff         	movq	%rax, -0x90(%rbp)
  8003b9: 48 8b 85 70 ff ff ff         	movq	-0x90(%rbp), %rax
; 			precision = va_arg(ap, int);
  8003c0: 8b 00                        	movl	(%rax), %eax
  8003c2: 89 45 98                     	movl	%eax, -0x68(%rbp)
; 			goto process_precision;
  8003c5: e9 22 00 00 00               	jmp	0x8003ec <vprintfmt+0x1cc>
; 			if (width < 0)
  8003ca: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8003ce: 0f 8d 07 00 00 00            	jge	0x8003db <vprintfmt+0x1bb>
; 				width = 0;
  8003d4: c7 45 9c 00 00 00 00         	movl	$0x0, -0x64(%rbp)
; 			goto reswitch;
  8003db: e9 e1 fe ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			altflag = 1;
  8003e0: c7 45 94 01 00 00 00         	movl	$0x1, -0x6c(%rbp)
; 			goto reswitch;
  8003e7: e9 d5 fe ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			if (width < 0)
  8003ec: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8003f0: 0f 8d 0d 00 00 00            	jge	0x800403 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  8003f6: 8b 45 98                     	movl	-0x68(%rbp), %eax
  8003f9: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  8003fc: c7 45 98 ff ff ff ff         	movl	$0xffffffff, -0x68(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800403: e9 b9 fe ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			lflag++;
  800408: 8b 45 a0                     	movl	-0x60(%rbp), %eax
  80040b: 83 c0 01                     	addl	$0x1, %eax
  80040e: 89 45 a0                     	movl	%eax, -0x60(%rbp)
; 			goto reswitch;
  800411: e9 ab fe ff ff               	jmp	0x8002c1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800416: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80041a: 48 89 85 58 ff ff ff         	movq	%rax, -0xa8(%rbp)
  800421: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800425: 48 89 85 60 ff ff ff         	movq	%rax, -0xa0(%rbp)
  80042c: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  80042f: 89 85 6c ff ff ff            	movl	%eax, -0x94(%rbp)
  800435: 83 f8 28                     	cmpl	$0x28, %eax
  800438: 0f 87 25 00 00 00            	ja	0x800463 <vprintfmt+0x243>
  80043e: 48 8b 8d 60 ff ff ff         	movq	-0xa0(%rbp), %rcx
  800445: 8b 95 6c ff ff ff            	movl	-0x94(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80044b: 48 63 c2                     	movslq	%edx, %rax
  80044e: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800452: 83 c2 08                     	addl	$0x8, %edx
  800455: 89 11                        	movl	%edx, (%rcx)
  800457: 48 89 85 50 ff ff ff         	movq	%rax, -0xb0(%rbp)
  80045e: e9 1d 00 00 00               	jmp	0x800480 <vprintfmt+0x260>
  800463: 48 8b 8d 60 ff ff ff         	movq	-0xa0(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80046a: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  80046e: 48 89 d0                     	movq	%rdx, %rax
  800471: 48 83 c2 08                  	addq	$0x8, %rdx
  800475: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800479: 48 89 85 50 ff ff ff         	movq	%rax, -0xb0(%rbp)
  800480: 48 8b 85 58 ff ff ff         	movq	-0xa8(%rbp), %rax
  800487: 48 8b 8d 50 ff ff ff         	movq	-0xb0(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80048e: 8b 39                        	movl	(%rcx), %edi
  800490: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800494: ff d0                        	callq	*%rax
; 			break;
  800496: e9 55 04 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80049b: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  80049f: 48 89 85 40 ff ff ff         	movq	%rax, -0xc0(%rbp)
  8004a6: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  8004a9: 89 85 4c ff ff ff            	movl	%eax, -0xb4(%rbp)
  8004af: 83 f8 28                     	cmpl	$0x28, %eax
  8004b2: 0f 87 25 00 00 00            	ja	0x8004dd <vprintfmt+0x2bd>
  8004b8: 48 8b 8d 40 ff ff ff         	movq	-0xc0(%rbp), %rcx
  8004bf: 8b 95 4c ff ff ff            	movl	-0xb4(%rbp), %edx
; 			err = va_arg(ap, int);
  8004c5: 48 63 c2                     	movslq	%edx, %rax
  8004c8: 48 03 41 10                  	addq	0x10(%rcx), %rax
  8004cc: 83 c2 08                     	addl	$0x8, %edx
  8004cf: 89 11                        	movl	%edx, (%rcx)
  8004d1: 48 89 85 38 ff ff ff         	movq	%rax, -0xc8(%rbp)
  8004d8: e9 1d 00 00 00               	jmp	0x8004fa <vprintfmt+0x2da>
  8004dd: 48 8b 8d 40 ff ff ff         	movq	-0xc0(%rbp), %rcx
; 			err = va_arg(ap, int);
  8004e4: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  8004e8: 48 89 d0                     	movq	%rdx, %rax
  8004eb: 48 83 c2 08                  	addq	$0x8, %rdx
  8004ef: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8004f3: 48 89 85 38 ff ff ff         	movq	%rax, -0xc8(%rbp)
  8004fa: 48 8b 85 38 ff ff ff         	movq	-0xc8(%rbp), %rax
; 			err = va_arg(ap, int);
  800501: 8b 00                        	movl	(%rax), %eax
  800503: 89 45 b0                     	movl	%eax, -0x50(%rbp)
; 			if (err < 0)
  800506: 83 7d b0 00                  	cmpl	$0x0, -0x50(%rbp)
  80050a: 0f 8d 08 00 00 00            	jge	0x800518 <vprintfmt+0x2f8>
; 				err = -err;
  800510: 31 c0                        	xorl	%eax, %eax
  800512: 2b 45 b0                     	subl	-0x50(%rbp), %eax
  800515: 89 45 b0                     	movl	%eax, -0x50(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800518: 48 63 45 b0                  	movslq	-0x50(%rbp), %rax
  80051c: 48 83 f8 09                  	cmpq	$0x9, %rax
  800520: 0f 83 1d 00 00 00            	jae	0x800543 <vprintfmt+0x323>
  800526: 48 63 4d b0                  	movslq	-0x50(%rbp), %rcx
  80052a: 48 8d 05 ef fa 9f ff         	leaq	-0x600511(%rip), %rax   # 0x200020 <error_string>
  800531: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800535: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
  800539: 48 83 f8 00                  	cmpq	$0x0, %rax
  80053d: 0f 85 1e 00 00 00            	jne	0x800561 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800543: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800547: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80054b: 8b 4d b0                     	movl	-0x50(%rbp), %ecx
  80054e: 48 8d 15 cc 1b 00 00         	leaq	0x1bcc(%rip), %rdx      # 0x802121
  800555: b0 00                        	movb	$0x0, %al
  800557: e8 a4 03 00 00               	callq	0x800900 <printfmt>
  80055c: e9 1a 00 00 00               	jmp	0x80057b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800561: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800565: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800569: 48 8b 4d b8                  	movq	-0x48(%rbp), %rcx
  80056d: 48 8d 15 06 1b 00 00         	leaq	0x1b06(%rip), %rdx      # 0x80207a
  800574: b0 00                        	movb	$0x0, %al
  800576: e8 85 03 00 00               	callq	0x800900 <printfmt>
; 			break;
  80057b: e9 70 03 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800580: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800584: 48 89 85 28 ff ff ff         	movq	%rax, -0xd8(%rbp)
  80058b: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  80058e: 89 85 34 ff ff ff            	movl	%eax, -0xcc(%rbp)
  800594: 83 f8 28                     	cmpl	$0x28, %eax
  800597: 0f 87 25 00 00 00            	ja	0x8005c2 <vprintfmt+0x3a2>
  80059d: 48 8b 8d 28 ff ff ff         	movq	-0xd8(%rbp), %rcx
  8005a4: 8b 95 34 ff ff ff            	movl	-0xcc(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005aa: 48 63 c2                     	movslq	%edx, %rax
  8005ad: 48 03 41 10                  	addq	0x10(%rcx), %rax
  8005b1: 83 c2 08                     	addl	$0x8, %edx
  8005b4: 89 11                        	movl	%edx, (%rcx)
  8005b6: 48 89 85 20 ff ff ff         	movq	%rax, -0xe0(%rbp)
  8005bd: e9 1d 00 00 00               	jmp	0x8005df <vprintfmt+0x3bf>
  8005c2: 48 8b 8d 28 ff ff ff         	movq	-0xd8(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005c9: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  8005cd: 48 89 d0                     	movq	%rdx, %rax
  8005d0: 48 83 c2 08                  	addq	$0x8, %rdx
  8005d4: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8005d8: 48 89 85 20 ff ff ff         	movq	%rax, -0xe0(%rbp)
  8005df: 48 8b 85 20 ff ff ff         	movq	-0xe0(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005e6: 48 8b 00                     	movq	(%rax), %rax
  8005e9: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
  8005ed: 48 83 f8 00                  	cmpq	$0x0, %rax
  8005f1: 0f 85 0b 00 00 00            	jne	0x800602 <vprintfmt+0x3e2>
; 				p = "(null)";
  8005f7: 48 8d 05 2c 1b 00 00         	leaq	0x1b2c(%rip), %rax      # 0x80212a
  8005fe: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
; 			if (width > 0 && padc != '-')
  800602: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  800606: 0f 8e 4f 00 00 00            	jle	0x80065b <vprintfmt+0x43b>
  80060c: 0f be 45 93                  	movsbl	-0x6d(%rbp), %eax
  800610: 83 f8 2d                     	cmpl	$0x2d, %eax
  800613: 0f 84 42 00 00 00            	je	0x80065b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800619: 48 8b 7d b8                  	movq	-0x48(%rbp), %rdi
  80061d: 48 63 75 98                  	movslq	-0x68(%rbp), %rsi
  800621: e8 da 07 00 00               	callq	0x800e00 <strnlen>
  800626: 89 c1                        	movl	%eax, %ecx
  800628: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  80062b: 29 c8                        	subl	%ecx, %eax
  80062d: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  800630: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  800634: 0f 8e 1c 00 00 00            	jle	0x800656 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80063a: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80063e: 0f be 7d 93                  	movsbl	-0x6d(%rbp), %edi
  800642: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800646: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800648: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  80064b: 83 c0 ff                     	addl	$-0x1, %eax
  80064e: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  800651: e9 da ff ff ff               	jmp	0x800630 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800656: e9 00 00 00 00               	jmp	0x80065b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80065b: e9 00 00 00 00               	jmp	0x800660 <vprintfmt+0x440>
  800660: 48 8b 45 b8                  	movq	-0x48(%rbp), %rax
  800664: 48 89 c1                     	movq	%rax, %rcx
  800667: 48 83 c1 01                  	addq	$0x1, %rcx
  80066b: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  80066f: 0f be 08                     	movsbl	(%rax), %ecx
  800672: 89 4d b4                     	movl	%ecx, -0x4c(%rbp)
  800675: 31 c0                        	xorl	%eax, %eax
  800677: 83 f9 00                     	cmpl	$0x0, %ecx
  80067a: 88 85 1f ff ff ff            	movb	%al, -0xe1(%rbp)
  800680: 0f 84 33 00 00 00            	je	0x8006b9 <vprintfmt+0x499>
  800686: b0 01                        	movb	$0x1, %al
  800688: 83 7d 98 00                  	cmpl	$0x0, -0x68(%rbp)
  80068c: 88 85 1e ff ff ff            	movb	%al, -0xe2(%rbp)
  800692: 0f 8c 15 00 00 00            	jl	0x8006ad <vprintfmt+0x48d>
  800698: 8b 45 98                     	movl	-0x68(%rbp), %eax
  80069b: 83 c0 ff                     	addl	$-0x1, %eax
  80069e: 89 45 98                     	movl	%eax, -0x68(%rbp)
  8006a1: 83 f8 00                     	cmpl	$0x0, %eax
  8006a4: 0f 9d c0                     	setge	%al
  8006a7: 88 85 1e ff ff ff            	movb	%al, -0xe2(%rbp)
  8006ad: 8a 85 1e ff ff ff            	movb	-0xe2(%rbp), %al
  8006b3: 88 85 1f ff ff ff            	movb	%al, -0xe1(%rbp)
  8006b9: 8a 85 1f ff ff ff            	movb	-0xe1(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8006bf: a8 01                        	testb	$0x1, %al
  8006c1: 0f 85 05 00 00 00            	jne	0x8006cc <vprintfmt+0x4ac>
  8006c7: e9 52 00 00 00               	jmp	0x80071e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8006cc: 83 7d 94 00                  	cmpl	$0x0, -0x6c(%rbp)
  8006d0: 0f 84 28 00 00 00            	je	0x8006fe <vprintfmt+0x4de>
  8006d6: 83 7d b4 20                  	cmpl	$0x20, -0x4c(%rbp)
  8006da: 0f 8c 0a 00 00 00            	jl	0x8006ea <vprintfmt+0x4ca>
  8006e0: 83 7d b4 7e                  	cmpl	$0x7e, -0x4c(%rbp)
  8006e4: 0f 8e 14 00 00 00            	jle	0x8006fe <vprintfmt+0x4de>
; 					putch('?', putdat);
  8006ea: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8006ee: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8006f2: bf 3f 00 00 00               	movl	$0x3f, %edi
  8006f7: ff d0                        	callq	*%rax
  8006f9: e9 0d 00 00 00               	jmp	0x80070b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  8006fe: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800702: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  800705: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800709: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80070b: e9 00 00 00 00               	jmp	0x800710 <vprintfmt+0x4f0>
; 					width--)
  800710: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  800713: 83 c0 ff                     	addl	$-0x1, %eax
  800716: 89 45 9c                     	movl	%eax, -0x64(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800719: e9 42 ff ff ff               	jmp	0x800660 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80071e: e9 00 00 00 00               	jmp	0x800723 <vprintfmt+0x503>
  800723: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  800727: 0f 8e 1d 00 00 00            	jle	0x80074a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80072d: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800731: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800735: bf 20 00 00 00               	movl	$0x20, %edi
  80073a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80073c: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  80073f: 83 c0 ff                     	addl	$-0x1, %eax
  800742: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  800745: e9 d9 ff ff ff               	jmp	0x800723 <vprintfmt+0x503>
; 			break;
  80074a: e9 a1 01 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80074f: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800752: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800756: e8 05 02 00 00               	callq	0x800960 <getint>
  80075b: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			if ((long long) num < 0) {
  80075f: 48 83 7d a8 00               	cmpq	$0x0, -0x58(%rbp)
  800764: 0f 8d 19 00 00 00            	jge	0x800783 <vprintfmt+0x563>
; 				putch('-', putdat);
  80076a: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80076e: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800772: bf 2d 00 00 00               	movl	$0x2d, %edi
  800777: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800779: 31 c0                        	xorl	%eax, %eax
  80077b: 48 2b 45 a8                  	subq	-0x58(%rbp), %rax
  80077f: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 10;
  800783: c7 45 a4 0a 00 00 00         	movl	$0xa, -0x5c(%rbp)
; 			goto number;
  80078a: e9 e6 00 00 00               	jmp	0x800875 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80078f: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800792: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800796: e8 f5 02 00 00               	callq	0x800a90 <getuint>
  80079b: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 10;
  80079f: c7 45 a4 0a 00 00 00         	movl	$0xa, -0x5c(%rbp)
; 			goto number;
  8007a6: e9 ca 00 00 00               	jmp	0x800875 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8007ab: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  8007ae: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  8007b2: e8 d9 02 00 00               	callq	0x800a90 <getuint>
  8007b7: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 8;
  8007bb: c7 45 a4 08 00 00 00         	movl	$0x8, -0x5c(%rbp)
; 			goto number;
  8007c2: e9 ae 00 00 00               	jmp	0x800875 <vprintfmt+0x655>
; 			putch('0', putdat);
  8007c7: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8007cb: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8007cf: bf 30 00 00 00               	movl	$0x30, %edi
  8007d4: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  8007d6: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8007da: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8007de: bf 78 00 00 00               	movl	$0x78, %edi
  8007e3: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  8007e5: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  8007e9: 48 89 85 10 ff ff ff         	movq	%rax, -0xf0(%rbp)
  8007f0: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  8007f3: 89 85 18 ff ff ff            	movl	%eax, -0xe8(%rbp)
  8007f9: 83 f8 28                     	cmpl	$0x28, %eax
  8007fc: 0f 87 25 00 00 00            	ja	0x800827 <vprintfmt+0x607>
  800802: 48 8b 8d 10 ff ff ff         	movq	-0xf0(%rbp), %rcx
  800809: 8b 95 18 ff ff ff            	movl	-0xe8(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  80080f: 48 63 c2                     	movslq	%edx, %rax
  800812: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800816: 83 c2 08                     	addl	$0x8, %edx
  800819: 89 11                        	movl	%edx, (%rcx)
  80081b: 48 89 85 08 ff ff ff         	movq	%rax, -0xf8(%rbp)
  800822: e9 1d 00 00 00               	jmp	0x800844 <vprintfmt+0x624>
  800827: 48 8b 8d 10 ff ff ff         	movq	-0xf0(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  80082e: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800832: 48 89 d0                     	movq	%rdx, %rax
  800835: 48 83 c2 08                  	addq	$0x8, %rdx
  800839: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  80083d: 48 89 85 08 ff ff ff         	movq	%rax, -0xf8(%rbp)
  800844: 48 8b 85 08 ff ff ff         	movq	-0xf8(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  80084b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  80084e: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 16;
  800852: c7 45 a4 10 00 00 00         	movl	$0x10, -0x5c(%rbp)
; 			goto number;
  800859: e9 17 00 00 00               	jmp	0x800875 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80085e: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800861: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800865: e8 26 02 00 00               	callq	0x800a90 <getuint>
  80086a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 16;
  80086e: c7 45 a4 10 00 00 00         	movl	$0x10, -0x5c(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800875: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800879: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80087d: 48 8b 55 a8                  	movq	-0x58(%rbp), %rdx
  800881: 8b 4d a4                     	movl	-0x5c(%rbp), %ecx
  800884: 44 8b 45 9c                  	movl	-0x64(%rbp), %r8d
  800888: 44 0f be 4d 93               	movsbl	-0x6d(%rbp), %r9d
  80088d: e8 2e 03 00 00               	callq	0x800bc0 <printnum>
; 			break;
  800892: e9 59 00 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800897: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80089b: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  80089e: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8008a2: ff d0                        	callq	*%rax
; 			break;
  8008a4: e9 47 00 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  8008a9: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8008ad: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8008b1: bf 25 00 00 00               	movl	$0x25, %edi
  8008b6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8008b8: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8008bc: 48 83 c0 ff                  	addq	$-0x1, %rax
  8008c0: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  8008c4: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8008c8: 0f be 40 ff                  	movsbl	-0x1(%rax), %eax
  8008cc: 83 f8 25                     	cmpl	$0x25, %eax
  8008cf: 0f 84 16 00 00 00            	je	0x8008eb <vprintfmt+0x6cb>
  8008d5: e9 00 00 00 00               	jmp	0x8008da <vprintfmt+0x6ba>
  8008da: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8008de: 48 83 c0 ff                  	addq	$-0x1, %rax
  8008e2: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  8008e6: e9 d9 ff ff ff               	jmp	0x8008c4 <vprintfmt+0x6a4>
; 			break;
  8008eb: e9 00 00 00 00               	jmp	0x8008f0 <vprintfmt+0x6d0>
; 	while (1) {
  8008f0: e9 64 f9 ff ff               	jmp	0x800259 <vprintfmt+0x39>
  8008f5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008ff: 90                           	nop

0000000000800900 <printfmt>:
; {
  800900: 55                           	pushq	%rbp
  800901: 48 89 e5                     	movq	%rsp, %rbp
  800904: 48 83 ec 60                  	subq	$0x60, %rsp
  800908: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  80090c: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  800910: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  800914: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800918: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  80091c: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800920: 48 8d 45 a0                  	leaq	-0x60(%rbp), %rax
; 	va_start(ap, fmt);
  800924: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800928: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  80092c: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800930: c7 45 d4 30 00 00 00         	movl	$0x30, -0x2c(%rbp)
  800937: c7 45 d0 18 00 00 00         	movl	$0x18, -0x30(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  80093e: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800942: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800946: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  80094a: 48 8d 4d d0                  	leaq	-0x30(%rbp), %rcx
  80094e: e8 cd f8 ff ff               	callq	0x800220 <vprintfmt>
; }
  800953: 48 83 c4 60                  	addq	$0x60, %rsp
  800957: 5d                           	popq	%rbp
  800958: c3                           	retq
  800959: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800960 <getint>:
; {
  800960: 55                           	pushq	%rbp
  800961: 48 89 e5                     	movq	%rsp, %rbp
  800964: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800968: 89 75 ec                     	movl	%esi, -0x14(%rbp)
; 	if (lflag >= 2)
  80096b: 83 7d ec 02                  	cmpl	$0x2, -0x14(%rbp)
  80096f: 0f 8c 59 00 00 00            	jl	0x8009ce <getint+0x6e>
; 		return va_arg(*ap, long long);
  800975: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800979: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  80097d: 8b 00                        	movl	(%rax), %eax
  80097f: 89 45 e8                     	movl	%eax, -0x18(%rbp)
  800982: 83 f8 28                     	cmpl	$0x28, %eax
  800985: 0f 87 1c 00 00 00            	ja	0x8009a7 <getint+0x47>
  80098b: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  80098f: 8b 55 e8                     	movl	-0x18(%rbp), %edx
; 		return va_arg(*ap, long long);
  800992: 48 63 c2                     	movslq	%edx, %rax
  800995: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800999: 83 c2 08                     	addl	$0x8, %edx
  80099c: 89 11                        	movl	%edx, (%rcx)
  80099e: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  8009a2: e9 17 00 00 00               	jmp	0x8009be <getint+0x5e>
  8009a7: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		return va_arg(*ap, long long);
  8009ab: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  8009af: 48 89 d0                     	movq	%rdx, %rax
  8009b2: 48 83 c2 08                  	addq	$0x8, %rdx
  8009b6: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8009ba: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  8009be: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
; 		return va_arg(*ap, long long);
  8009c2: 48 8b 00                     	movq	(%rax), %rax
  8009c5: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8009c9: e9 b7 00 00 00               	jmp	0x800a85 <getint+0x125>
; 	else if (lflag)
  8009ce: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  8009d2: 0f 84 59 00 00 00            	je	0x800a31 <getint+0xd1>
; 		return va_arg(*ap, long);
  8009d8: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8009dc: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  8009e0: 8b 00                        	movl	(%rax), %eax
  8009e2: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
  8009e5: 83 f8 28                     	cmpl	$0x28, %eax
  8009e8: 0f 87 1c 00 00 00            	ja	0x800a0a <getint+0xaa>
  8009ee: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
  8009f2: 8b 55 d4                     	movl	-0x2c(%rbp), %edx
; 		return va_arg(*ap, long);
  8009f5: 48 63 c2                     	movslq	%edx, %rax
  8009f8: 48 03 41 10                  	addq	0x10(%rcx), %rax
  8009fc: 83 c2 08                     	addl	$0x8, %edx
  8009ff: 89 11                        	movl	%edx, (%rcx)
  800a01: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800a05: e9 17 00 00 00               	jmp	0x800a21 <getint+0xc1>
  800a0a: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
; 		return va_arg(*ap, long);
  800a0e: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800a12: 48 89 d0                     	movq	%rdx, %rax
  800a15: 48 83 c2 08                  	addq	$0x8, %rdx
  800a19: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800a1d: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800a21: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
; 		return va_arg(*ap, long);
  800a25: 48 8b 00                     	movq	(%rax), %rax
  800a28: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800a2c: e9 54 00 00 00               	jmp	0x800a85 <getint+0x125>
; 		return va_arg(*ap, int);
  800a31: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800a35: 48 89 45 b0                  	movq	%rax, -0x50(%rbp)
  800a39: 8b 00                        	movl	(%rax), %eax
  800a3b: 89 45 bc                     	movl	%eax, -0x44(%rbp)
  800a3e: 83 f8 28                     	cmpl	$0x28, %eax
  800a41: 0f 87 1c 00 00 00            	ja	0x800a63 <getint+0x103>
  800a47: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
  800a4b: 8b 55 bc                     	movl	-0x44(%rbp), %edx
; 		return va_arg(*ap, int);
  800a4e: 48 63 c2                     	movslq	%edx, %rax
  800a51: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800a55: 83 c2 08                     	addl	$0x8, %edx
  800a58: 89 11                        	movl	%edx, (%rcx)
  800a5a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800a5e: e9 17 00 00 00               	jmp	0x800a7a <getint+0x11a>
  800a63: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
; 		return va_arg(*ap, int);
  800a67: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800a6b: 48 89 d0                     	movq	%rdx, %rax
  800a6e: 48 83 c2 08                  	addq	$0x8, %rdx
  800a72: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800a76: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800a7a: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
; 		return va_arg(*ap, int);
  800a7e: 48 63 00                     	movslq	(%rax), %rax
  800a81: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  800a85: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800a89: 5d                           	popq	%rbp
  800a8a: c3                           	retq
  800a8b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a90 <getuint>:
; {
  800a90: 55                           	pushq	%rbp
  800a91: 48 89 e5                     	movq	%rsp, %rbp
  800a94: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800a98: 89 75 ec                     	movl	%esi, -0x14(%rbp)
; 	if (lflag >= 2)
  800a9b: 83 7d ec 02                  	cmpl	$0x2, -0x14(%rbp)
  800a9f: 0f 8c 59 00 00 00            	jl	0x800afe <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800aa5: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800aa9: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800aad: 8b 00                        	movl	(%rax), %eax
  800aaf: 89 45 e8                     	movl	%eax, -0x18(%rbp)
  800ab2: 83 f8 28                     	cmpl	$0x28, %eax
  800ab5: 0f 87 1c 00 00 00            	ja	0x800ad7 <getuint+0x47>
  800abb: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  800abf: 8b 55 e8                     	movl	-0x18(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800ac2: 48 63 c2                     	movslq	%edx, %rax
  800ac5: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800ac9: 83 c2 08                     	addl	$0x8, %edx
  800acc: 89 11                        	movl	%edx, (%rcx)
  800ace: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800ad2: e9 17 00 00 00               	jmp	0x800aee <getuint+0x5e>
  800ad7: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800adb: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800adf: 48 89 d0                     	movq	%rdx, %rax
  800ae2: 48 83 c2 08                  	addq	$0x8, %rdx
  800ae6: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800aea: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800aee: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800af2: 48 8b 00                     	movq	(%rax), %rax
  800af5: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800af9: e9 b6 00 00 00               	jmp	0x800bb4 <getuint+0x124>
; 	else if (lflag)
  800afe: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  800b02: 0f 84 59 00 00 00            	je	0x800b61 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800b08: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800b0c: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  800b10: 8b 00                        	movl	(%rax), %eax
  800b12: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
  800b15: 83 f8 28                     	cmpl	$0x28, %eax
  800b18: 0f 87 1c 00 00 00            	ja	0x800b3a <getuint+0xaa>
  800b1e: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
  800b22: 8b 55 d4                     	movl	-0x2c(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800b25: 48 63 c2                     	movslq	%edx, %rax
  800b28: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800b2c: 83 c2 08                     	addl	$0x8, %edx
  800b2f: 89 11                        	movl	%edx, (%rcx)
  800b31: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800b35: e9 17 00 00 00               	jmp	0x800b51 <getuint+0xc1>
  800b3a: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800b3e: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800b42: 48 89 d0                     	movq	%rdx, %rax
  800b45: 48 83 c2 08                  	addq	$0x8, %rdx
  800b49: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800b4d: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800b51: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800b55: 48 8b 00                     	movq	(%rax), %rax
  800b58: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800b5c: e9 53 00 00 00               	jmp	0x800bb4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800b61: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800b65: 48 89 45 b0                  	movq	%rax, -0x50(%rbp)
  800b69: 8b 00                        	movl	(%rax), %eax
  800b6b: 89 45 bc                     	movl	%eax, -0x44(%rbp)
  800b6e: 83 f8 28                     	cmpl	$0x28, %eax
  800b71: 0f 87 1c 00 00 00            	ja	0x800b93 <getuint+0x103>
  800b77: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
  800b7b: 8b 55 bc                     	movl	-0x44(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800b7e: 48 63 c2                     	movslq	%edx, %rax
  800b81: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800b85: 83 c2 08                     	addl	$0x8, %edx
  800b88: 89 11                        	movl	%edx, (%rcx)
  800b8a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800b8e: e9 17 00 00 00               	jmp	0x800baa <getuint+0x11a>
  800b93: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800b97: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800b9b: 48 89 d0                     	movq	%rdx, %rax
  800b9e: 48 83 c2 08                  	addq	$0x8, %rdx
  800ba2: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800ba6: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800baa: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800bae: 8b 00                        	movl	(%rax), %eax
  800bb0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  800bb4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800bb8: 5d                           	popq	%rbp
  800bb9: c3                           	retq
  800bba: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800bc0 <printnum>:
; {
  800bc0: 55                           	pushq	%rbp
  800bc1: 48 89 e5                     	movq	%rsp, %rbp
  800bc4: 48 83 ec 30                  	subq	$0x30, %rsp
  800bc8: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800bcc: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800bd0: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800bd4: 89 4d e4                     	movl	%ecx, -0x1c(%rbp)
  800bd7: 44 89 45 e0                  	movl	%r8d, -0x20(%rbp)
  800bdb: 44 89 4d dc                  	movl	%r9d, -0x24(%rbp)
; 	if (num >= base) {
  800bdf: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800be3: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800be6: 48 39 c8                     	cmpq	%rcx, %rax
  800be9: 0f 82 30 00 00 00            	jb	0x800c1f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800bef: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800bf3: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800bf7: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800bfb: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800bfe: 31 d2                        	xorl	%edx, %edx
  800c00: 48 f7 f1                     	divq	%rcx
  800c03: 48 89 c2                     	movq	%rax, %rdx
  800c06: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800c09: 44 8b 45 e0                  	movl	-0x20(%rbp), %r8d
  800c0d: 41 83 e8 01                  	subl	$0x1, %r8d
  800c11: 44 8b 4d dc                  	movl	-0x24(%rbp), %r9d
  800c15: e8 a6 ff ff ff               	callq	0x800bc0 <printnum>
; 	} else {
  800c1a: e9 2e 00 00 00               	jmp	0x800c4d <printnum+0x8d>
; 		while (--width > 0)
  800c1f: e9 00 00 00 00               	jmp	0x800c24 <printnum+0x64>
  800c24: 8b 45 e0                     	movl	-0x20(%rbp), %eax
  800c27: 83 c0 ff                     	addl	$-0x1, %eax
  800c2a: 89 45 e0                     	movl	%eax, -0x20(%rbp)
  800c2d: 83 f8 00                     	cmpl	$0x0, %eax
  800c30: 0f 8e 12 00 00 00            	jle	0x800c48 <printnum+0x88>
; 			putch(padc, putdat);
  800c36: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800c3a: 8b 7d dc                     	movl	-0x24(%rbp), %edi
  800c3d: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800c41: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800c43: e9 dc ff ff ff               	jmp	0x800c24 <printnum+0x64>
  800c48: e9 00 00 00 00               	jmp	0x800c4d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800c4d: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800c51: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  800c55: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800c59: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800c5c: 31 d2                        	xorl	%edx, %edx
  800c5e: 48 f7 f1                     	divq	%rcx
  800c61: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  800c65: 48 8d 0d 87 14 00 00         	leaq	0x1487(%rip), %rcx      # 0x8020f3
  800c6c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800c70: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800c74: ff d0                        	callq	*%rax
; }
  800c76: 48 83 c4 30                  	addq	$0x30, %rsp
  800c7a: 5d                           	popq	%rbp
  800c7b: c3                           	retq
  800c7c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800c80 <vsnprintf>:
; {
  800c80: 55                           	pushq	%rbp
  800c81: 48 89 e5                     	movq	%rsp, %rbp
  800c84: 48 83 ec 40                  	subq	$0x40, %rsp
  800c88: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800c8c: 89 75 ec                     	movl	%esi, -0x14(%rbp)
  800c8f: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
  800c93: 48 89 4d d8                  	movq	%rcx, -0x28(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800c97: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800c9b: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800c9f: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800ca3: 48 63 4d ec                  	movslq	-0x14(%rbp), %rcx
  800ca7: 48 01 c8                     	addq	%rcx, %rax
  800caa: 48 83 c0 ff                  	addq	$-0x1, %rax
  800cae: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  800cb2: c7 45 d0 00 00 00 00         	movl	$0x0, -0x30(%rbp)
; 	if (buf == NULL || n < 1)
  800cb9: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  800cbe: 0f 84 0a 00 00 00            	je	0x800cce <vsnprintf+0x4e>
  800cc4: 83 7d ec 01                  	cmpl	$0x1, -0x14(%rbp)
  800cc8: 0f 8d 0c 00 00 00            	jge	0x800cda <vsnprintf+0x5a>
; 		return -EINVAL;
  800cce: c7 45 fc fb ff ff ff         	movl	$0xfffffffb, -0x4(%rbp) # imm = 0xFFFFFFFB
  800cd5: e9 25 00 00 00               	jmp	0x800cff <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800cda: 48 8d 75 c0                  	leaq	-0x40(%rbp), %rsi
  800cde: 48 8b 55 e0                  	movq	-0x20(%rbp), %rdx
  800ce2: 48 8b 4d d8                  	movq	-0x28(%rbp), %rcx
  800ce6: 48 8d 3d 23 00 00 00         	leaq	0x23(%rip), %rdi        # 0x800d10 <sprintputch>
  800ced: e8 2e f5 ff ff               	callq	0x800220 <vprintfmt>
; 	*b.buf = '\0';
  800cf2: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
  800cf6: c6 00 00                     	movb	$0x0, (%rax)
; 	return b.cnt;
  800cf9: 8b 45 d0                     	movl	-0x30(%rbp), %eax
  800cfc: 89 45 fc                     	movl	%eax, -0x4(%rbp)
; }
  800cff: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800d02: 48 83 c4 40                  	addq	$0x40, %rsp
  800d06: 5d                           	popq	%rbp
  800d07: c3                           	retq
  800d08: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800d10 <sprintputch>:
; {
  800d10: 55                           	pushq	%rbp
  800d11: 48 89 e5                     	movq	%rsp, %rbp
  800d14: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  800d17: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b->cnt++;
  800d1b: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800d1f: 8b 48 10                     	movl	0x10(%rax), %ecx
  800d22: 83 c1 01                     	addl	$0x1, %ecx
  800d25: 89 48 10                     	movl	%ecx, 0x10(%rax)
; 	if (b->buf < b->ebuf)
  800d28: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800d2c: 48 8b 00                     	movq	(%rax), %rax
  800d2f: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  800d33: 48 3b 41 08                  	cmpq	0x8(%rcx), %rax
  800d37: 0f 83 18 00 00 00            	jae	0x800d55 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800d3d: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800d40: 88 c1                        	movb	%al, %cl
  800d42: 48 8b 55 f0                  	movq	-0x10(%rbp), %rdx
  800d46: 48 8b 02                     	movq	(%rdx), %rax
  800d49: 48 89 c6                     	movq	%rax, %rsi
  800d4c: 48 83 c6 01                  	addq	$0x1, %rsi
  800d50: 48 89 32                     	movq	%rsi, (%rdx)
  800d53: 88 08                        	movb	%cl, (%rax)
; }
  800d55: 5d                           	popq	%rbp
  800d56: c3                           	retq
  800d57: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800d60 <snprintf>:
; {
  800d60: 55                           	pushq	%rbp
  800d61: 48 89 e5                     	movq	%rsp, %rbp
  800d64: 48 83 ec 70                  	subq	$0x70, %rsp
  800d68: 4c 89 4d b8                  	movq	%r9, -0x48(%rbp)
  800d6c: 4c 89 45 b0                  	movq	%r8, -0x50(%rbp)
  800d70: 48 89 4d a8                  	movq	%rcx, -0x58(%rbp)
  800d74: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800d78: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  800d7b: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800d7f: 48 8d 45 90                  	leaq	-0x70(%rbp), %rax
; 	va_start(ap, fmt);
  800d83: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800d87: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  800d8b: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800d8f: c7 45 d4 30 00 00 00         	movl	$0x30, -0x2c(%rbp)
  800d96: c7 45 d0 18 00 00 00         	movl	$0x18, -0x30(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800d9d: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800da1: 8b 75 f4                     	movl	-0xc(%rbp), %esi
  800da4: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  800da8: 48 8d 4d d0                  	leaq	-0x30(%rbp), %rcx
  800dac: e8 cf fe ff ff               	callq	0x800c80 <vsnprintf>
  800db1: 89 45 cc                     	movl	%eax, -0x34(%rbp)
; 	return rc;
  800db4: 8b 45 cc                     	movl	-0x34(%rbp), %eax
  800db7: 48 83 c4 70                  	addq	$0x70, %rsp
  800dbb: 5d                           	popq	%rbp
  800dbc: c3                           	retq
  800dbd: cc                           	int3
  800dbe: cc                           	int3
  800dbf: cc                           	int3

0000000000800dc0 <strlen>:
; {
  800dc0: 55                           	pushq	%rbp
  800dc1: 48 89 e5                     	movq	%rsp, %rbp
  800dc4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800dc8: c7 45 f4 00 00 00 00         	movl	$0x0, -0xc(%rbp)
  800dcf: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800dd3: 0f be 00                     	movsbl	(%rax), %eax
  800dd6: 83 f8 00                     	cmpl	$0x0, %eax
  800dd9: 0f 84 1a 00 00 00            	je	0x800df9 <strlen+0x39>
; 		n++;
  800ddf: 8b 45 f4                     	movl	-0xc(%rbp), %eax
  800de2: 83 c0 01                     	addl	$0x1, %eax
  800de5: 89 45 f4                     	movl	%eax, -0xc(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800de8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800dec: 48 83 c0 01                  	addq	$0x1, %rax
  800df0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800df4: e9 d6 ff ff ff               	jmp	0x800dcf <strlen+0xf>
; 	return n;
  800df9: 8b 45 f4                     	movl	-0xc(%rbp), %eax
  800dfc: 5d                           	popq	%rbp
  800dfd: c3                           	retq
  800dfe: 66 90                        	nop

0000000000800e00 <strnlen>:
; {
  800e00: 55                           	pushq	%rbp
  800e01: 48 89 e5                     	movq	%rsp, %rbp
  800e04: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800e08: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e0c: c7 45 ec 00 00 00 00         	movl	$0x0, -0x14(%rbp)
  800e13: 31 c0                        	xorl	%eax, %eax
  800e15: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  800e1a: 88 45 eb                     	movb	%al, -0x15(%rbp)
  800e1d: 0f 86 10 00 00 00            	jbe	0x800e33 <strnlen+0x33>
  800e23: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800e27: 0f be 00                     	movsbl	(%rax), %eax
  800e2a: 83 f8 00                     	cmpl	$0x0, %eax
  800e2d: 0f 95 c0                     	setne	%al
  800e30: 88 45 eb                     	movb	%al, -0x15(%rbp)
  800e33: 8a 45 eb                     	movb	-0x15(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e36: a8 01                        	testb	$0x1, %al
  800e38: 0f 85 05 00 00 00            	jne	0x800e43 <strnlen+0x43>
  800e3e: e9 26 00 00 00               	jmp	0x800e69 <strnlen+0x69>
; 		n++;
  800e43: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  800e46: 83 c0 01                     	addl	$0x1, %eax
  800e49: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e4c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800e50: 48 83 c0 01                  	addq	$0x1, %rax
  800e54: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800e58: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800e5c: 48 83 c0 ff                  	addq	$-0x1, %rax
  800e60: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  800e64: e9 aa ff ff ff               	jmp	0x800e13 <strnlen+0x13>
; 	return n;
  800e69: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  800e6c: 5d                           	popq	%rbp
  800e6d: c3                           	retq
  800e6e: 66 90                        	nop

0000000000800e70 <strcpy>:
; {
  800e70: 55                           	pushq	%rbp
  800e71: 48 89 e5                     	movq	%rsp, %rbp
  800e74: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800e78: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	ret = dst;
  800e7c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800e80: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  800e84: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800e88: 48 89 c1                     	movq	%rax, %rcx
  800e8b: 48 83 c1 01                  	addq	$0x1, %rcx
  800e8f: 48 89 4d f0                  	movq	%rcx, -0x10(%rbp)
  800e93: 8a 00                        	movb	(%rax), %al
  800e95: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  800e99: 48 89 ca                     	movq	%rcx, %rdx
  800e9c: 48 83 c2 01                  	addq	$0x1, %rdx
  800ea0: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  800ea4: 88 01                        	movb	%al, (%rcx)
  800ea6: 0f be c0                     	movsbl	%al, %eax
  800ea9: 83 f8 00                     	cmpl	$0x0, %eax
  800eac: 0f 84 05 00 00 00            	je	0x800eb7 <strcpy+0x47>
  800eb2: e9 cd ff ff ff               	jmp	0x800e84 <strcpy+0x14>
; 	return ret;
  800eb7: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800ebb: 5d                           	popq	%rbp
  800ebc: c3                           	retq
  800ebd: 0f 1f 00                     	nopl	(%rax)

0000000000800ec0 <strcat>:
; {
  800ec0: 55                           	pushq	%rbp
  800ec1: 48 89 e5                     	movq	%rsp, %rbp
  800ec4: 48 83 ec 20                  	subq	$0x20, %rsp
  800ec8: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800ecc: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	int len = strlen(dst);
  800ed0: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800ed4: e8 e7 fe ff ff               	callq	0x800dc0 <strlen>
  800ed9: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 	strcpy(dst + len, src);
  800edc: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800ee0: 48 63 45 ec                  	movslq	-0x14(%rbp), %rax
  800ee4: 48 01 c7                     	addq	%rax, %rdi
  800ee7: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800eeb: e8 80 ff ff ff               	callq	0x800e70 <strcpy>
; 	return dst;
  800ef0: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800ef4: 48 83 c4 20                  	addq	$0x20, %rsp
  800ef8: 5d                           	popq	%rbp
  800ef9: c3                           	retq
  800efa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800f00 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800f00: 55                           	pushq	%rbp
  800f01: 48 89 e5                     	movq	%rsp, %rbp
  800f04: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800f08: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800f0c: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	ret = dst;
  800f10: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800f14: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	for (i = 0; i < size; i++) {
  800f18: 48 c7 45 e0 00 00 00 00      	movq	$0x0, -0x20(%rbp)
  800f20: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  800f24: 48 3b 45 e8                  	cmpq	-0x18(%rbp), %rax
  800f28: 0f 83 49 00 00 00            	jae	0x800f77 <strncpy+0x77>
; 		*dst++ = *src;
  800f2e: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800f32: 8a 08                        	movb	(%rax), %cl
  800f34: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800f38: 48 89 c2                     	movq	%rax, %rdx
  800f3b: 48 83 c2 01                  	addq	$0x1, %rdx
  800f3f: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  800f43: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  800f45: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800f49: 0f be 00                     	movsbl	(%rax), %eax
  800f4c: 83 f8 00                     	cmpl	$0x0, %eax
  800f4f: 0f 84 0c 00 00 00            	je	0x800f61 <strncpy+0x61>
; 			src++;
  800f55: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800f59: 48 83 c0 01                  	addq	$0x1, %rax
  800f5d: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
; 	}
  800f61: e9 00 00 00 00               	jmp	0x800f66 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  800f66: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  800f6a: 48 83 c0 01                  	addq	$0x1, %rax
  800f6e: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800f72: e9 a9 ff ff ff               	jmp	0x800f20 <strncpy+0x20>
; 	return ret;
  800f77: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  800f7b: 5d                           	popq	%rbp
  800f7c: c3                           	retq
  800f7d: 0f 1f 00                     	nopl	(%rax)

0000000000800f80 <strlcpy>:
; {
  800f80: 55                           	pushq	%rbp
  800f81: 48 89 e5                     	movq	%rsp, %rbp
  800f84: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800f88: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800f8c: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	dst_in = dst;
  800f90: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800f94: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	if (size > 0) {
  800f98: 48 83 7d e8 00               	cmpq	$0x0, -0x18(%rbp)
  800f9d: 0f 86 6e 00 00 00            	jbe	0x801011 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  800fa3: e9 00 00 00 00               	jmp	0x800fa8 <strlcpy+0x28>
  800fa8: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  800fac: 48 83 c1 ff                  	addq	$-0x1, %rcx
  800fb0: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  800fb4: 31 c0                        	xorl	%eax, %eax
  800fb6: 48 83 f9 00                  	cmpq	$0x0, %rcx
  800fba: 88 45 df                     	movb	%al, -0x21(%rbp)
  800fbd: 0f 86 10 00 00 00            	jbe	0x800fd3 <strlcpy+0x53>
  800fc3: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800fc7: 0f be 00                     	movsbl	(%rax), %eax
  800fca: 83 f8 00                     	cmpl	$0x0, %eax
  800fcd: 0f 95 c0                     	setne	%al
  800fd0: 88 45 df                     	movb	%al, -0x21(%rbp)
  800fd3: 8a 45 df                     	movb	-0x21(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  800fd6: a8 01                        	testb	$0x1, %al
  800fd8: 0f 85 05 00 00 00            	jne	0x800fe3 <strlcpy+0x63>
  800fde: e9 27 00 00 00               	jmp	0x80100a <strlcpy+0x8a>
; 			*dst++ = *src++;
  800fe3: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800fe7: 48 89 c1                     	movq	%rax, %rcx
  800fea: 48 83 c1 01                  	addq	$0x1, %rcx
  800fee: 48 89 4d f0                  	movq	%rcx, -0x10(%rbp)
  800ff2: 8a 08                        	movb	(%rax), %cl
  800ff4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800ff8: 48 89 c2                     	movq	%rax, %rdx
  800ffb: 48 83 c2 01                  	addq	$0x1, %rdx
  800fff: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  801003: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801005: e9 9e ff ff ff               	jmp	0x800fa8 <strlcpy+0x28>
; 		*dst = '\0';
  80100a: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80100e: c6 00 00                     	movb	$0x0, (%rax)
; 	return dst - dst_in;
  801011: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801015: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  801019: 48 29 c8                     	subq	%rcx, %rax
  80101c: 5d                           	popq	%rbp
  80101d: c3                           	retq
  80101e: 66 90                        	nop

0000000000801020 <strcmp>:
; {
  801020: 55                           	pushq	%rbp
  801021: 48 89 e5                     	movq	%rsp, %rbp
  801024: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801028: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	while (*p && *p == *q)
  80102c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801030: 0f be 08                     	movsbl	(%rax), %ecx
  801033: 31 c0                        	xorl	%eax, %eax
  801035: 83 f9 00                     	cmpl	$0x0, %ecx
  801038: 88 45 ef                     	movb	%al, -0x11(%rbp)
  80103b: 0f 84 16 00 00 00            	je	0x801057 <strcmp+0x37>
  801041: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801045: 0f be 00                     	movsbl	(%rax), %eax
  801048: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  80104c: 0f be 09                     	movsbl	(%rcx), %ecx
  80104f: 39 c8                        	cmpl	%ecx, %eax
  801051: 0f 94 c0                     	sete	%al
  801054: 88 45 ef                     	movb	%al, -0x11(%rbp)
  801057: 8a 45 ef                     	movb	-0x11(%rbp), %al
; 	while (*p && *p == *q)
  80105a: a8 01                        	testb	$0x1, %al
  80105c: 0f 85 05 00 00 00            	jne	0x801067 <strcmp+0x47>
  801062: e9 1d 00 00 00               	jmp	0x801084 <strcmp+0x64>
; 		p++, q++;
  801067: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80106b: 48 83 c0 01                  	addq	$0x1, %rax
  80106f: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801073: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801077: 48 83 c0 01                  	addq	$0x1, %rax
  80107b: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
; 	while (*p && *p == *q)
  80107f: e9 a8 ff ff ff               	jmp	0x80102c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801084: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801088: 0f b6 00                     	movzbl	(%rax), %eax
  80108b: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  80108f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801092: 29 c8                        	subl	%ecx, %eax
  801094: 5d                           	popq	%rbp
  801095: c3                           	retq
  801096: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008010a0 <strncmp>:
; {
  8010a0: 55                           	pushq	%rbp
  8010a1: 48 89 e5                     	movq	%rsp, %rbp
  8010a4: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  8010a8: 48 89 75 e8                  	movq	%rsi, -0x18(%rbp)
  8010ac: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8010b0: 31 c0                        	xorl	%eax, %eax
  8010b2: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  8010b7: 88 45 df                     	movb	%al, -0x21(%rbp)
  8010ba: 0f 86 2b 00 00 00            	jbe	0x8010eb <strncmp+0x4b>
  8010c0: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8010c4: 0f be 08                     	movsbl	(%rax), %ecx
  8010c7: 31 c0                        	xorl	%eax, %eax
  8010c9: 83 f9 00                     	cmpl	$0x0, %ecx
  8010cc: 88 45 df                     	movb	%al, -0x21(%rbp)
  8010cf: 0f 84 16 00 00 00            	je	0x8010eb <strncmp+0x4b>
  8010d5: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8010d9: 0f be 00                     	movsbl	(%rax), %eax
  8010dc: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  8010e0: 0f be 09                     	movsbl	(%rcx), %ecx
  8010e3: 39 c8                        	cmpl	%ecx, %eax
  8010e5: 0f 94 c0                     	sete	%al
  8010e8: 88 45 df                     	movb	%al, -0x21(%rbp)
  8010eb: 8a 45 df                     	movb	-0x21(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  8010ee: a8 01                        	testb	$0x1, %al
  8010f0: 0f 85 05 00 00 00            	jne	0x8010fb <strncmp+0x5b>
  8010f6: e9 29 00 00 00               	jmp	0x801124 <strncmp+0x84>
; 		n--, p++, q++;
  8010fb: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8010ff: 48 83 c0 ff                  	addq	$-0x1, %rax
  801103: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  801107: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80110b: 48 83 c0 01                  	addq	$0x1, %rax
  80110f: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  801113: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  801117: 48 83 c0 01                  	addq	$0x1, %rax
  80111b: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80111f: e9 8c ff ff ff               	jmp	0x8010b0 <strncmp+0x10>
; 	if (n == 0)
  801124: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  801129: 0f 85 0c 00 00 00            	jne	0x80113b <strncmp+0x9b>
; 		return 0;
  80112f: c7 45 fc 00 00 00 00         	movl	$0x0, -0x4(%rbp)
  801136: e9 13 00 00 00               	jmp	0x80114e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80113b: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80113f: 0f b6 00                     	movzbl	(%rax), %eax
  801142: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  801146: 0f b6 09                     	movzbl	(%rcx), %ecx
  801149: 29 c8                        	subl	%ecx, %eax
  80114b: 89 45 fc                     	movl	%eax, -0x4(%rbp)
; }
  80114e: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  801151: 5d                           	popq	%rbp
  801152: c3                           	retq
  801153: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80115d: 0f 1f 00                     	nopl	(%rax)

0000000000801160 <strchr>:
; {
  801160: 55                           	pushq	%rbp
  801161: 48 89 e5                     	movq	%rsp, %rbp
  801164: 40 88 f0                     	movb	%sil, %al
  801167: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  80116b: 88 45 ef                     	movb	%al, -0x11(%rbp)
; 	for (; *s; s++)
  80116e: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801172: 80 38 00                     	cmpb	$0x0, (%rax)
  801175: 0f 84 36 00 00 00            	je	0x8011b1 <strchr+0x51>
; 		if (*s == c)
  80117b: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80117f: 0f be 00                     	movsbl	(%rax), %eax
  801182: 0f be 4d ef                  	movsbl	-0x11(%rbp), %ecx
  801186: 39 c8                        	cmpl	%ecx, %eax
  801188: 0f 85 0d 00 00 00            	jne	0x80119b <strchr+0x3b>
; 			return (char *) s;
  80118e: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801192: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801196: e9 1e 00 00 00               	jmp	0x8011b9 <strchr+0x59>
; 		if (*s == c)
  80119b: e9 00 00 00 00               	jmp	0x8011a0 <strchr+0x40>
; 	for (; *s; s++)
  8011a0: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8011a4: 48 83 c0 01                  	addq	$0x1, %rax
  8011a8: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  8011ac: e9 bd ff ff ff               	jmp	0x80116e <strchr+0xe>
; 	return 0;
  8011b1: 48 c7 45 f8 00 00 00 00      	movq	$0x0, -0x8(%rbp)
; }
  8011b9: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8011bd: 5d                           	popq	%rbp
  8011be: c3                           	retq
  8011bf: 90                           	nop

00000000008011c0 <strfind>:
; {
  8011c0: 55                           	pushq	%rbp
  8011c1: 48 89 e5                     	movq	%rsp, %rbp
  8011c4: 40 88 f0                     	movb	%sil, %al
  8011c7: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8011cb: 88 45 f7                     	movb	%al, -0x9(%rbp)
; 	for (; *s; s++)
  8011ce: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8011d2: 80 38 00                     	cmpb	$0x0, (%rax)
  8011d5: 0f 84 2e 00 00 00            	je	0x801209 <strfind+0x49>
; 		if (*s == c)
  8011db: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8011df: 0f be 00                     	movsbl	(%rax), %eax
  8011e2: 0f be 4d f7                  	movsbl	-0x9(%rbp), %ecx
  8011e6: 39 c8                        	cmpl	%ecx, %eax
  8011e8: 0f 85 05 00 00 00            	jne	0x8011f3 <strfind+0x33>
; 			break;
  8011ee: e9 16 00 00 00               	jmp	0x801209 <strfind+0x49>
; 		if (*s == c)
  8011f3: e9 00 00 00 00               	jmp	0x8011f8 <strfind+0x38>
; 	for (; *s; s++)
  8011f8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8011fc: 48 83 c0 01                  	addq	$0x1, %rax
  801200: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801204: e9 c5 ff ff ff               	jmp	0x8011ce <strfind+0xe>
; 	return (char *) s;
  801209: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80120d: 5d                           	popq	%rbp
  80120e: c3                           	retq
  80120f: 90                           	nop

0000000000801210 <memset>:
; {
  801210: 55                           	pushq	%rbp
  801211: 48 89 e5                     	movq	%rsp, %rbp
  801214: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  801218: 89 75 ec                     	movl	%esi, -0x14(%rbp)
  80121b: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	if (n == 0)
  80121f: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  801224: 0f 85 0d 00 00 00            	jne	0x801237 <memset+0x27>
; 		return v;
  80122a: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80122e: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801232: e9 78 00 00 00               	jmp	0x8012af <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801237: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80123b: 48 83 e0 03                  	andq	$0x3, %rax
  80123f: 48 83 f8 00                  	cmpq	$0x0, %rax
  801243: 0f 85 50 00 00 00            	jne	0x801299 <memset+0x89>
  801249: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  80124d: 48 83 e0 03                  	andq	$0x3, %rax
  801251: 48 83 f8 00                  	cmpq	$0x0, %rax
  801255: 0f 85 3e 00 00 00            	jne	0x801299 <memset+0x89>
; 		c &= 0xFF;
  80125b: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  80125e: 25 ff 00 00 00               	andl	$0xff, %eax
  801263: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801266: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  801269: c1 e0 18                     	shll	$0x18, %eax
  80126c: 8b 4d ec                     	movl	-0x14(%rbp), %ecx
  80126f: c1 e1 10                     	shll	$0x10, %ecx
  801272: 09 c8                        	orl	%ecx, %eax
  801274: 8b 4d ec                     	movl	-0x14(%rbp), %ecx
  801277: c1 e1 08                     	shll	$0x8, %ecx
  80127a: 09 c8                        	orl	%ecx, %eax
  80127c: 0b 45 ec                     	orl	-0x14(%rbp), %eax
  80127f: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801282: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  801286: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  801289: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  80128d: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801291: fc                           	cld
  801292: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801294: e9 0e 00 00 00               	jmp	0x8012a7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801299: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  80129d: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  8012a0: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8012a4: fc                           	cld
  8012a5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8012a7: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8012ab: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  8012af: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8012b3: 5d                           	popq	%rbp
  8012b4: c3                           	retq
  8012b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8012bf: 90                           	nop

00000000008012c0 <memmove>:
; {
  8012c0: 55                           	pushq	%rbp
  8012c1: 48 89 e5                     	movq	%rsp, %rbp
  8012c4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8012c8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  8012cc: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	s = src;
  8012d0: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8012d4: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	d = dst;
  8012d8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8012dc: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	if (s < d && s + n > d) {
  8012e0: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8012e4: 48 3b 45 d8                  	cmpq	-0x28(%rbp), %rax
  8012e8: 0f 83 9d 00 00 00            	jae	0x80138b <memmove+0xcb>
  8012ee: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8012f2: 48 03 45 e8                  	addq	-0x18(%rbp), %rax
  8012f6: 48 3b 45 d8                  	cmpq	-0x28(%rbp), %rax
  8012fa: 0f 86 8b 00 00 00            	jbe	0x80138b <memmove+0xcb>
; 		s += n;
  801300: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  801304: 48 03 45 e0                  	addq	-0x20(%rbp), %rax
  801308: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 		d += n;
  80130c: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  801310: 48 03 45 d8                  	addq	-0x28(%rbp), %rax
  801314: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801318: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  80131c: 48 83 e0 03                  	andq	$0x3, %rax
  801320: 48 83 f8 00                  	cmpq	$0x0, %rax
  801324: 0f 85 44 00 00 00            	jne	0x80136e <memmove+0xae>
  80132a: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80132e: 48 83 e0 03                  	andq	$0x3, %rax
  801332: 48 83 f8 00                  	cmpq	$0x0, %rax
  801336: 0f 85 32 00 00 00            	jne	0x80136e <memmove+0xae>
  80133c: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  801340: 48 83 e0 03                  	andq	$0x3, %rax
  801344: 48 83 f8 00                  	cmpq	$0x0, %rax
  801348: 0f 85 20 00 00 00            	jne	0x80136e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80134e: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  801352: 48 83 c7 fc                  	addq	$-0x4, %rdi
  801356: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  80135a: 48 83 c6 fc                  	addq	$-0x4, %rsi
  80135e: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  801362: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 			asm volatile("std; rep movsl\n"
  801366: fd                           	std
  801367: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801369: e9 17 00 00 00               	jmp	0x801385 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80136e: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  801372: 48 83 c7 ff                  	addq	$-0x1, %rdi
  801376: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  80137a: 48 83 c6 ff                  	addq	$-0x1, %rsi
  80137e: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801382: fd                           	std
  801383: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801385: fc                           	cld
; 	} else {
  801386: e9 62 00 00 00               	jmp	0x8013ed <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80138b: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  80138f: 48 83 e0 03                  	andq	$0x3, %rax
  801393: 48 83 f8 00                  	cmpq	$0x0, %rax
  801397: 0f 85 3c 00 00 00            	jne	0x8013d9 <memmove+0x119>
  80139d: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  8013a1: 48 83 e0 03                  	andq	$0x3, %rax
  8013a5: 48 83 f8 00                  	cmpq	$0x0, %rax
  8013a9: 0f 85 2a 00 00 00            	jne	0x8013d9 <memmove+0x119>
  8013af: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8013b3: 48 83 e0 03                  	andq	$0x3, %rax
  8013b7: 48 83 f8 00                  	cmpq	$0x0, %rax
  8013bb: 0f 85 18 00 00 00            	jne	0x8013d9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8013c1: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  8013c5: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  8013c9: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  8013cd: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 			asm volatile("cld; rep movsl\n"
  8013d1: fc                           	cld
  8013d2: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8013d4: e9 0f 00 00 00               	jmp	0x8013e8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  8013d9: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  8013dd: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  8013e1: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  8013e5: fc                           	cld
  8013e6: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  8013e8: e9 00 00 00 00               	jmp	0x8013ed <memmove+0x12d>
; 	return dst;
  8013ed: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8013f1: 5d                           	popq	%rbp
  8013f2: c3                           	retq
  8013f3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8013fd: 0f 1f 00                     	nopl	(%rax)

0000000000801400 <memcpy>:
; {
  801400: 55                           	pushq	%rbp
  801401: 48 89 e5                     	movq	%rsp, %rbp
  801404: 48 83 ec 20                  	subq	$0x20, %rsp
  801408: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80140c: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  801410: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	return memmove(dst, src, n);
  801414: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  801418: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80141c: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  801420: e8 9b fe ff ff               	callq	0x8012c0 <memmove>
  801425: 48 83 c4 20                  	addq	$0x20, %rsp
  801429: 5d                           	popq	%rbp
  80142a: c3                           	retq
  80142b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801430 <memcmp>:
; {
  801430: 55                           	pushq	%rbp
  801431: 48 89 e5                     	movq	%rsp, %rbp
  801434: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  801438: 48 89 75 e8                  	movq	%rsi, -0x18(%rbp)
  80143c: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801440: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801444: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801448: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  80144c: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	while (n-- > 0) {
  801450: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801454: 48 89 c1                     	movq	%rax, %rcx
  801457: 48 83 c1 ff                  	addq	$-0x1, %rcx
  80145b: 48 89 4d e0                  	movq	%rcx, -0x20(%rbp)
  80145f: 48 83 f8 00                  	cmpq	$0x0, %rax
  801463: 0f 86 4b 00 00 00            	jbe	0x8014b4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801469: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80146d: 0f b6 00                     	movzbl	(%rax), %eax
  801470: 48 8b 4d d0                  	movq	-0x30(%rbp), %rcx
  801474: 0f b6 09                     	movzbl	(%rcx), %ecx
  801477: 39 c8                        	cmpl	%ecx, %eax
  801479: 0f 84 18 00 00 00            	je	0x801497 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80147f: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  801483: 0f b6 00                     	movzbl	(%rax), %eax
  801486: 48 8b 4d d0                  	movq	-0x30(%rbp), %rcx
  80148a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80148d: 29 c8                        	subl	%ecx, %eax
  80148f: 89 45 fc                     	movl	%eax, -0x4(%rbp)
  801492: e9 24 00 00 00               	jmp	0x8014bb <memcmp+0x8b>
; 		s1++, s2++;
  801497: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80149b: 48 83 c0 01                  	addq	$0x1, %rax
  80149f: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  8014a3: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  8014a7: 48 83 c0 01                  	addq	$0x1, %rax
  8014ab: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	while (n-- > 0) {
  8014af: e9 9c ff ff ff               	jmp	0x801450 <memcmp+0x20>
; 	return 0;
  8014b4: c7 45 fc 00 00 00 00         	movl	$0x0, -0x4(%rbp)
; }
  8014bb: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  8014be: 5d                           	popq	%rbp
  8014bf: c3                           	retq

00000000008014c0 <memfind>:
; {
  8014c0: 55                           	pushq	%rbp
  8014c1: 48 89 e5                     	movq	%rsp, %rbp
  8014c4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8014c8: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  8014cb: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	const void *ends = (const char *) s + n;
  8014cf: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8014d3: 48 03 45 e8                  	addq	-0x18(%rbp), %rax
  8014d7: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	for (; s < ends; s++)
  8014db: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8014df: 48 3b 45 e0                  	cmpq	-0x20(%rbp), %rax
  8014e3: 0f 83 30 00 00 00            	jae	0x801519 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8014e9: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8014ed: 0f b6 00                     	movzbl	(%rax), %eax
  8014f0: 8b 4d f4                     	movl	-0xc(%rbp), %ecx
  8014f3: 0f b6 c9                     	movzbl	%cl, %ecx
  8014f6: 39 c8                        	cmpl	%ecx, %eax
  8014f8: 0f 85 05 00 00 00            	jne	0x801503 <memfind+0x43>
; 			break;
  8014fe: e9 16 00 00 00               	jmp	0x801519 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801503: e9 00 00 00 00               	jmp	0x801508 <memfind+0x48>
; 	for (; s < ends; s++)
  801508: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80150c: 48 83 c0 01                  	addq	$0x1, %rax
  801510: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801514: e9 c2 ff ff ff               	jmp	0x8014db <memfind+0x1b>
; 	return (void *) s;
  801519: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80151d: 5d                           	popq	%rbp
  80151e: c3                           	retq
  80151f: 90                           	nop

0000000000801520 <strtol>:
; {
  801520: 55                           	pushq	%rbp
  801521: 48 89 e5                     	movq	%rsp, %rbp
  801524: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801528: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  80152c: 89 55 ec                     	movl	%edx, -0x14(%rbp)
; 	int neg = 0;
  80152f: c7 45 e8 00 00 00 00         	movl	$0x0, -0x18(%rbp)
; 	long val = 0;
  801536: 48 c7 45 e0 00 00 00 00      	movq	$0x0, -0x20(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80153e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801542: 0f be 08                     	movsbl	(%rax), %ecx
  801545: b0 01                        	movb	$0x1, %al
  801547: 83 f9 20                     	cmpl	$0x20, %ecx
  80154a: 88 45 db                     	movb	%al, -0x25(%rbp)
  80154d: 0f 84 10 00 00 00            	je	0x801563 <strtol+0x43>
  801553: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801557: 0f be 00                     	movsbl	(%rax), %eax
  80155a: 83 f8 09                     	cmpl	$0x9, %eax
  80155d: 0f 94 c0                     	sete	%al
  801560: 88 45 db                     	movb	%al, -0x25(%rbp)
  801563: 8a 45 db                     	movb	-0x25(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801566: a8 01                        	testb	$0x1, %al
  801568: 0f 85 05 00 00 00            	jne	0x801573 <strtol+0x53>
  80156e: e9 11 00 00 00               	jmp	0x801584 <strtol+0x64>
; 		s++;
  801573: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801577: 48 83 c0 01                  	addq	$0x1, %rax
  80157b: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80157f: e9 ba ff ff ff               	jmp	0x80153e <strtol+0x1e>
; 	if (*s == '+')
  801584: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801588: 0f be 00                     	movsbl	(%rax), %eax
  80158b: 83 f8 2b                     	cmpl	$0x2b, %eax
  80158e: 0f 85 11 00 00 00            	jne	0x8015a5 <strtol+0x85>
; 		s++;
  801594: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801598: 48 83 c0 01                  	addq	$0x1, %rax
  80159c: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8015a0: e9 28 00 00 00               	jmp	0x8015cd <strtol+0xad>
; 	else if (*s == '-')
  8015a5: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015a9: 0f be 00                     	movsbl	(%rax), %eax
  8015ac: 83 f8 2d                     	cmpl	$0x2d, %eax
  8015af: 0f 85 13 00 00 00            	jne	0x8015c8 <strtol+0xa8>
; 		s++, neg = 1;
  8015b5: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015b9: 48 83 c0 01                  	addq	$0x1, %rax
  8015bd: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8015c1: c7 45 e8 01 00 00 00         	movl	$0x1, -0x18(%rbp)
  8015c8: e9 00 00 00 00               	jmp	0x8015cd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8015cd: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  8015d1: 0f 84 0a 00 00 00            	je	0x8015e1 <strtol+0xc1>
  8015d7: 83 7d ec 10                  	cmpl	$0x10, -0x14(%rbp)
  8015db: 0f 85 39 00 00 00            	jne	0x80161a <strtol+0xfa>
  8015e1: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015e5: 0f be 00                     	movsbl	(%rax), %eax
  8015e8: 83 f8 30                     	cmpl	$0x30, %eax
  8015eb: 0f 85 29 00 00 00            	jne	0x80161a <strtol+0xfa>
  8015f1: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015f5: 0f be 40 01                  	movsbl	0x1(%rax), %eax
  8015f9: 83 f8 78                     	cmpl	$0x78, %eax
  8015fc: 0f 85 18 00 00 00            	jne	0x80161a <strtol+0xfa>
; 		s += 2, base = 16;
  801602: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801606: 48 83 c0 02                  	addq	$0x2, %rax
  80160a: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  80160e: c7 45 ec 10 00 00 00         	movl	$0x10, -0x14(%rbp)
  801615: e9 4d 00 00 00               	jmp	0x801667 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80161a: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  80161e: 0f 85 28 00 00 00            	jne	0x80164c <strtol+0x12c>
  801624: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801628: 0f be 00                     	movsbl	(%rax), %eax
  80162b: 83 f8 30                     	cmpl	$0x30, %eax
  80162e: 0f 85 18 00 00 00            	jne	0x80164c <strtol+0x12c>
; 		s++, base = 8;
  801634: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801638: 48 83 c0 01                  	addq	$0x1, %rax
  80163c: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801640: c7 45 ec 08 00 00 00         	movl	$0x8, -0x14(%rbp)
  801647: e9 16 00 00 00               	jmp	0x801662 <strtol+0x142>
; 	else if (base == 0)
  80164c: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  801650: 0f 85 07 00 00 00            	jne	0x80165d <strtol+0x13d>
; 		base = 10;
  801656: c7 45 ec 0a 00 00 00         	movl	$0xa, -0x14(%rbp)
  80165d: e9 00 00 00 00               	jmp	0x801662 <strtol+0x142>
  801662: e9 00 00 00 00               	jmp	0x801667 <strtol+0x147>
; 	while (1) {
  801667: e9 00 00 00 00               	jmp	0x80166c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80166c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801670: 0f be 00                     	movsbl	(%rax), %eax
  801673: 83 f8 30                     	cmpl	$0x30, %eax
  801676: 0f 8c 22 00 00 00            	jl	0x80169e <strtol+0x17e>
  80167c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801680: 0f be 00                     	movsbl	(%rax), %eax
  801683: 83 f8 39                     	cmpl	$0x39, %eax
  801686: 0f 8f 12 00 00 00            	jg	0x80169e <strtol+0x17e>
; 			dig = *s - '0';
  80168c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801690: 0f be 00                     	movsbl	(%rax), %eax
  801693: 83 e8 30                     	subl	$0x30, %eax
  801696: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  801699: e9 79 00 00 00               	jmp	0x801717 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80169e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016a2: 0f be 00                     	movsbl	(%rax), %eax
  8016a5: 83 f8 61                     	cmpl	$0x61, %eax
  8016a8: 0f 8c 25 00 00 00            	jl	0x8016d3 <strtol+0x1b3>
  8016ae: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016b2: 0f be 00                     	movsbl	(%rax), %eax
  8016b5: 83 f8 7a                     	cmpl	$0x7a, %eax
  8016b8: 0f 8f 15 00 00 00            	jg	0x8016d3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8016be: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016c2: 0f be 00                     	movsbl	(%rax), %eax
  8016c5: 83 e8 61                     	subl	$0x61, %eax
  8016c8: 83 c0 0a                     	addl	$0xa, %eax
  8016cb: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  8016ce: e9 3f 00 00 00               	jmp	0x801712 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  8016d3: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016d7: 0f be 00                     	movsbl	(%rax), %eax
  8016da: 83 f8 41                     	cmpl	$0x41, %eax
  8016dd: 0f 8c 25 00 00 00            	jl	0x801708 <strtol+0x1e8>
  8016e3: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016e7: 0f be 00                     	movsbl	(%rax), %eax
  8016ea: 83 f8 5a                     	cmpl	$0x5a, %eax
  8016ed: 0f 8f 15 00 00 00            	jg	0x801708 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  8016f3: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016f7: 0f be 00                     	movsbl	(%rax), %eax
  8016fa: 83 e8 41                     	subl	$0x41, %eax
  8016fd: 83 c0 0a                     	addl	$0xa, %eax
  801700: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  801703: e9 05 00 00 00               	jmp	0x80170d <strtol+0x1ed>
; 			break;
  801708: e9 43 00 00 00               	jmp	0x801750 <strtol+0x230>
  80170d: e9 00 00 00 00               	jmp	0x801712 <strtol+0x1f2>
  801712: e9 00 00 00 00               	jmp	0x801717 <strtol+0x1f7>
; 		if (dig >= base)
  801717: 8b 45 dc                     	movl	-0x24(%rbp), %eax
  80171a: 3b 45 ec                     	cmpl	-0x14(%rbp), %eax
  80171d: 0f 8c 05 00 00 00            	jl	0x801728 <strtol+0x208>
; 			break;
  801723: e9 28 00 00 00               	jmp	0x801750 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801728: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80172c: 48 83 c0 01                  	addq	$0x1, %rax
  801730: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801734: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801738: 48 63 4d ec                  	movslq	-0x14(%rbp), %rcx
  80173c: 48 0f af c1                  	imulq	%rcx, %rax
  801740: 48 63 4d dc                  	movslq	-0x24(%rbp), %rcx
  801744: 48 01 c8                     	addq	%rcx, %rax
  801747: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	while (1) {
  80174b: e9 1c ff ff ff               	jmp	0x80166c <strtol+0x14c>
; 	if (endptr)
  801750: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  801755: 0f 84 0b 00 00 00            	je	0x801766 <strtol+0x246>
; 		*endptr = (char *) s;
  80175b: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  80175f: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801763: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801766: 83 7d e8 00                  	cmpl	$0x0, -0x18(%rbp)
  80176a: 0f 84 0f 00 00 00            	je	0x80177f <strtol+0x25f>
  801770: 31 c0                        	xorl	%eax, %eax
  801772: 48 2b 45 e0                  	subq	-0x20(%rbp), %rax
  801776: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  80177a: e9 08 00 00 00               	jmp	0x801787 <strtol+0x267>
  80177f: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801783: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  801787: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
; 	return (neg ? -val : val);
  80178b: 5d                           	popq	%rbp
  80178c: c3                           	retq
  80178d: cc                           	int3
  80178e: cc                           	int3
  80178f: cc                           	int3

0000000000801790 <puts>:
; {
  801790: 55                           	pushq	%rbp
  801791: 48 89 e5                     	movq	%rsp, %rbp
  801794: 48 83 ec 20                  	subq	$0x20, %rsp
  801798: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80179c: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8017a0: 48 8b 55 f8                  	movq	-0x8(%rbp), %rdx
  8017a4: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  8017a8: 31 f6                        	xorl	%esi, %esi
  8017aa: 31 c0                        	xorl	%eax, %eax
  8017ac: 41 89 c1                     	movl	%eax, %r9d
  8017af: 89 f7                        	movl	%esi, %edi
  8017b1: 4d 89 c8                     	movq	%r9, %r8
  8017b4: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  8017bc: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  8017c5: e8 06 00 00 00               	callq	0x8017d0 <syscall>
; }
  8017ca: 48 83 c4 20                  	addq	$0x20, %rsp
  8017ce: 5d                           	popq	%rbp
  8017cf: c3                           	retq

00000000008017d0 <syscall>:
; {
  8017d0: 55                           	pushq	%rbp
  8017d1: 48 89 e5                     	movq	%rsp, %rbp
  8017d4: 48 83 ec 40                  	subq	$0x40, %rsp
  8017d8: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  8017dc: 48 8b 45 10                  	movq	0x10(%rbp), %rax
  8017e0: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  8017e3: 89 75 f8                     	movl	%esi, -0x8(%rbp)
  8017e6: 48 89 55 f0                  	movq	%rdx, -0x10(%rbp)
  8017ea: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  8017ee: 4c 89 45 e0                  	movq	%r8, -0x20(%rbp)
  8017f2: 4c 89 4d d8                  	movq	%r9, -0x28(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8017f6: 48 63 7d fc                  	movslq	-0x4(%rbp), %rdi
  8017fa: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8017fe: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  801802: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  801806: 4c 8b 45 d8                  	movq	-0x28(%rbp), %r8
  80180a: 4c 8b 4d 10                  	movq	0x10(%rbp), %r9
  80180e: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  801812: 48 89 04 24                  	movq	%rax, (%rsp)
  801816: e8 01 01 00 00               	callq	0x80191c <do_syscall>
  80181b: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	if(check && ret < 0) {
  80181f: 83 7d f8 00                  	cmpl	$0x0, -0x8(%rbp)
  801823: 0f 84 2c 00 00 00            	je	0x801855 <syscall+0x85>
  801829: 48 83 7d d0 00               	cmpq	$0x0, -0x30(%rbp)
  80182e: 0f 83 21 00 00 00            	jae	0x801855 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  801834: 8b 4d fc                     	movl	-0x4(%rbp), %ecx
  801837: 4c 8b 45 d0                  	movq	-0x30(%rbp), %r8
  80183b: 48 8d 3d e0 07 00 00         	leaq	0x7e0(%rip), %rdi       # 0x802022
  801842: be 1f 00 00 00               	movl	$0x1f, %esi
  801847: 48 8d 15 b6 08 00 00         	leaq	0x8b6(%rip), %rdx       # 0x802104
  80184e: b0 00                        	movb	$0x0, %al
  801850: e8 db 00 00 00               	callq	0x801930 <_panic>
; 	return ret;
  801855: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  801859: 48 83 c4 40                  	addq	$0x40, %rsp
  80185d: 5d                           	popq	%rbp
  80185e: c3                           	retq
  80185f: 90                           	nop

0000000000801860 <getc>:
; {
  801860: 55                           	pushq	%rbp
  801861: 48 89 e5                     	movq	%rsp, %rbp
  801864: 48 83 ec 10                  	subq	$0x10, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801868: bf 01 00 00 00               	movl	$0x1, %edi
  80186d: 31 f6                        	xorl	%esi, %esi
  80186f: 31 c0                        	xorl	%eax, %eax
  801871: 41 89 c1                     	movl	%eax, %r9d
  801874: 4c 89 ca                     	movq	%r9, %rdx
  801877: 4c 89 c9                     	movq	%r9, %rcx
  80187a: 4d 89 c8                     	movq	%r9, %r8
  80187d: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  801885: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  80188e: e8 3d ff ff ff               	callq	0x8017d0 <syscall>
  801893: 48 83 c4 10                  	addq	$0x10, %rsp
  801897: 5d                           	popq	%rbp
  801898: c3                           	retq
  801899: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008018a0 <kill>:
; {
  8018a0: 55                           	pushq	%rbp
  8018a1: 48 89 e5                     	movq	%rsp, %rbp
  8018a4: 48 83 ec 20                  	subq	$0x20, %rsp
  8018a8: 89 7d fc                     	movl	%edi, -0x4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8018ab: 48 63 55 fc                  	movslq	-0x4(%rbp), %rdx
  8018af: bf 03 00 00 00               	movl	$0x3, %edi
  8018b4: be 01 00 00 00               	movl	$0x1, %esi
  8018b9: 31 c0                        	xorl	%eax, %eax
  8018bb: 41 89 c1                     	movl	%eax, %r9d
  8018be: 4c 89 c9                     	movq	%r9, %rcx
  8018c1: 4d 89 c8                     	movq	%r9, %r8
  8018c4: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  8018cc: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  8018d5: e8 f6 fe ff ff               	callq	0x8017d0 <syscall>
  8018da: 48 83 c4 20                  	addq	$0x20, %rsp
  8018de: 5d                           	popq	%rbp
  8018df: c3                           	retq

00000000008018e0 <getpid>:
; {
  8018e0: 55                           	pushq	%rbp
  8018e1: 48 89 e5                     	movq	%rsp, %rbp
  8018e4: 48 83 ec 10                  	subq	$0x10, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  8018e8: bf 02 00 00 00               	movl	$0x2, %edi
  8018ed: 31 f6                        	xorl	%esi, %esi
  8018ef: 31 c0                        	xorl	%eax, %eax
  8018f1: 41 89 c1                     	movl	%eax, %r9d
  8018f4: 4c 89 ca                     	movq	%r9, %rdx
  8018f7: 4c 89 c9                     	movq	%r9, %rcx
  8018fa: 4d 89 c8                     	movq	%r9, %r8
  8018fd: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  801905: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  80190e: e8 bd fe ff ff               	callq	0x8017d0 <syscall>
  801913: 48 83 c4 10                  	addq	$0x10, %rsp
  801917: 5d                           	popq	%rbp
  801918: c3                           	retq
  801919: cc                           	int3
  80191a: cc                           	int3
  80191b: cc                           	int3

000000000080191c <do_syscall>:
; 	pushq %rbp
  80191c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80191d: 48 8b 6c 24 10               	movq	0x10(%rsp), %rbp
; 	int $INT_SYSCALL
  801922: cd 80                        	int	$0x80
; 	popq %rbp
  801924: 5d                           	popq	%rbp
; 	retq
  801925: c3                           	retq
  801926: cc                           	int3
  801927: cc                           	int3
  801928: cc                           	int3
  801929: cc                           	int3
  80192a: cc                           	int3
  80192b: cc                           	int3
  80192c: cc                           	int3
  80192d: cc                           	int3
  80192e: cc                           	int3
  80192f: cc                           	int3

0000000000801930 <_panic>:
; {
  801930: 55                           	pushq	%rbp
  801931: 48 89 e5                     	movq	%rsp, %rbp
  801934: 48 83 ec 60                  	subq	$0x60, %rsp
  801938: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  80193c: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  801940: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  801944: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801948: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  80194b: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	va_start(ap, fmt);
  80194f: 48 8d 45 d0                  	leaq	-0x30(%rbp), %rax
  801953: 48 8d 4d a0                  	leaq	-0x60(%rbp), %rcx
  801957: 48 89 48 10                  	movq	%rcx, 0x10(%rax)
  80195b: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
  80195f: 48 89 48 08                  	movq	%rcx, 0x8(%rax)
  801963: c7 40 04 30 00 00 00         	movl	$0x30, 0x4(%rax)
  80196a: c7 00 18 00 00 00            	movl	$0x18, (%rax)
; 		getpid(), binary_name, file, line);
  801970: e8 6b ff ff ff               	callq	0x8018e0 <getpid>
  801975: 89 c6                        	movl	%eax, %esi
  801977: 48 8d 05 82 16 00 00         	leaq	0x1682(%rip), %rax      # 0x803000 <binary_name>
  80197e: 48 8b 10                     	movq	(%rax), %rdx
  801981: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  801985: 44 8b 45 f4                  	movl	-0xc(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  801989: 48 8d 3d 23 07 00 00         	leaq	0x723(%rip), %rdi       # 0x8020b3
  801990: b0 00                        	movb	$0x0, %al
  801992: e8 29 e8 ff ff               	callq	0x8001c0 <printf>
; 	vprintf(fmt, ap);
  801997: 48 8b 7d e8                  	movq	-0x18(%rbp), %rdi
  80199b: 48 8d 75 d0                  	leaq	-0x30(%rbp), %rsi
  80199f: e8 3c e7 ff ff               	callq	0x8000e0 <vprintf>
; 	printf("\n");
  8019a4: 48 8d 3d 2e 07 00 00         	leaq	0x72e(%rip), %rdi       # 0x8020d9
  8019ab: b0 00                        	movb	$0x0, %al
  8019ad: e8 0e e8 ff ff               	callq	0x8001c0 <printf>
; 		asm volatile("int3");
  8019b2: cc                           	int3
; 	while (1) {
  8019b3: e9 fa ff ff ff               	jmp	0x8019b2 <_panic+0x82>
