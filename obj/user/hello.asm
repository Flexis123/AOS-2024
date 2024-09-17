
obj/user/hello:	file format elf64-x86-64

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
  800054: 48 83 ec 10                  	subq	$16, %rsp
  800058: 89 7d fc                     	movl	%edi, -4(%rbp)
  80005b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	printf("Hello, world!\n");
  80005f: 48 8d 3d f6 1f 00 00         	leaq	8182(%rip), %rdi        # 0x80205c <syscall.c+0x80205c>
  800066: b0 00                        	movb	$0, %al
  800068: e8 63 01 00 00               	callq	0x8001d0 <printf>
; 	printf("We are number %u!\n", getpid());
  80006d: e8 7e 18 00 00               	callq	0x8018f0 <getpid>
  800072: 89 c6                        	movl	%eax, %esi
  800074: 48 8d 3d 8a 20 00 00         	leaq	8330(%rip), %rdi        # 0x802105 <syscall.c+0x802105>
  80007b: b0 00                        	movb	$0, %al
  80007d: e8 4e 01 00 00               	callq	0x8001d0 <printf>
; }
  800082: 31 c0                        	xorl	%eax, %eax
  800084: 48 83 c4 10                  	addq	$16, %rsp
  800088: 5d                           	popq	%rbp
  800089: c3                           	retq
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
  8000e6: e8 c5 17 00 00               	callq	0x8018b0 <kill>
; }
  8000eb: 5d                           	popq	%rbp
  8000ec: c3                           	retq
  8000ed: cc                           	int3
  8000ee: cc                           	int3
  8000ef: cc                           	int3

00000000008000f0 <vprintf>:
; {
  8000f0: 55                           	pushq	%rbp
  8000f1: 48 89 e5                     	movq	%rsp, %rbp
  8000f4: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  8000fb: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8000ff: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800103: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80010d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  800117: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  80011e: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  800122: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800126: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800160 <putch>
  80012d: e8 fe 00 00 00               	callq	0x800230 <vprintfmt>
; 	puts(b.buf, b.idx);
  800132: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  800139: 48 83 c7 08                  	addq	$8, %rdi
  80013d: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  800144: e8 57 16 00 00               	callq	0x8017a0 <puts>
; 	return b.cnt;
  800149: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  80014f: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800156: 5d                           	popq	%rbp
  800157: c3                           	retq
  800158: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800160 <putch>:
; {
  800160: 55                           	pushq	%rbp
  800161: 48 89 e5                     	movq	%rsp, %rbp
  800164: 48 83 ec 10                  	subq	$16, %rsp
  800168: 89 7d fc                     	movl	%edi, -4(%rbp)
  80016b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80016f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800172: 88 c2                        	movb	%al, %dl
  800174: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800178: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80017c: 8b 0e                        	movl	(%rsi), %ecx
  80017e: 89 cf                        	movl	%ecx, %edi
  800180: 83 c7 01                     	addl	$1, %edi
  800183: 89 3e                        	movl	%edi, (%rsi)
  800185: 48 63 c9                     	movslq	%ecx, %rcx
  800188: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80018c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800190: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800196: 0f 85 1e 00 00 00            	jne	0x8001ba <putch+0x5a>
; 		puts(b->buf, b->idx);
  80019c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8001a0: 48 83 c7 08                  	addq	$8, %rdi
  8001a4: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8001a8: 48 63 30                     	movslq	(%rax), %rsi
  8001ab: e8 f0 15 00 00               	callq	0x8017a0 <puts>
; 		b->idx = 0;
  8001b0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8001b4: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  8001ba: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8001be: 8b 48 04                     	movl	4(%rax), %ecx
  8001c1: 83 c1 01                     	addl	$1, %ecx
  8001c4: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  8001c7: 48 83 c4 10                  	addq	$16, %rsp
  8001cb: 5d                           	popq	%rbp
  8001cc: c3                           	retq
  8001cd: 0f 1f 00                     	nopl	(%rax)

00000000008001d0 <printf>:
; {
  8001d0: 55                           	pushq	%rbp
  8001d1: 48 89 e5                     	movq	%rsp, %rbp
  8001d4: 48 83 ec 60                  	subq	$96, %rsp
  8001d8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8001dc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8001e0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8001e4: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  8001e8: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  8001ec: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8001f0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8001f4: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8001f8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8001fc: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800200: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800207: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80020e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800212: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  800216: e8 d5 fe ff ff               	callq	0x8000f0 <vprintf>
  80021b: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  80021e: 8b 45 dc                     	movl	-36(%rbp), %eax
  800221: 48 83 c4 60                  	addq	$96, %rsp
  800225: 5d                           	popq	%rbp
  800226: c3                           	retq
  800227: cc                           	int3
  800228: cc                           	int3
  800229: cc                           	int3
  80022a: cc                           	int3
  80022b: cc                           	int3
  80022c: cc                           	int3
  80022d: cc                           	int3
  80022e: cc                           	int3
  80022f: cc                           	int3

0000000000800230 <vprintfmt>:
; {
  800230: 55                           	pushq	%rbp
  800231: 48 89 e5                     	movq	%rsp, %rbp
  800234: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  80023b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80023f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800243: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800247: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  80024b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80024f: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800253: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800257: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80025b: 48 8b 0a                     	movq	(%rdx), %rcx
  80025e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800262: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800266: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800269: e9 00 00 00 00               	jmp	0x80026e <vprintfmt+0x3e>
  80026e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800272: 48 89 c1                     	movq	%rax, %rcx
  800275: 48 83 c1 01                  	addq	$1, %rcx
  800279: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80027d: 0f b6 00                     	movzbl	(%rax), %eax
  800280: 89 45 b4                     	movl	%eax, -76(%rbp)
  800283: 83 f8 25                     	cmpl	$37, %eax
  800286: 0f 84 25 00 00 00            	je	0x8002b1 <vprintfmt+0x81>
; 			if (ch == '\0')
  80028c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800290: 0f 85 09 00 00 00            	jne	0x80029f <vprintfmt+0x6f>
; 				return;
  800296: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80029d: 5d                           	popq	%rbp
  80029e: c3                           	retq
; 			putch(ch, putdat);
  80029f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8002a3: 8b 7d b4                     	movl	-76(%rbp), %edi
  8002a6: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8002aa: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8002ac: e9 bd ff ff ff               	jmp	0x80026e <vprintfmt+0x3e>
; 		padc = ' ';
  8002b1: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  8002b5: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  8002bc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  8002c3: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  8002ca: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  8002d1: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8002d5: 48 89 c1                     	movq	%rax, %rcx
  8002d8: 48 83 c1 01                  	addq	$1, %rcx
  8002dc: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8002e0: 0f b6 00                     	movzbl	(%rax), %eax
  8002e3: 89 45 b4                     	movl	%eax, -76(%rbp)
  8002e6: 83 c0 dd                     	addl	$-35, %eax
  8002e9: 89 c1                        	movl	%eax, %ecx
  8002eb: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  8002ef: 83 e8 55                     	subl	$85, %eax
  8002f2: 0f 87 c1 05 00 00            	ja	0x8008b9 <vprintfmt+0x689>
  8002f8: 48 8b 45 88                  	movq	-120(%rbp), %rax
  8002fc: 48 8d 0d 35 1e 00 00         	leaq	7733(%rip), %rcx        # 0x802138 <syscall.c+0x802138>
  800303: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800307: 48 01 c8                     	addq	%rcx, %rax
  80030a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80030c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  800310: e9 bc ff ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			padc = '0';
  800315: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  800319: e9 b3 ff ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  80031e: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  800325: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  800329: 03 45 b4                     	addl	-76(%rbp), %eax
  80032c: 83 e8 30                     	subl	$48, %eax
  80032f: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  800332: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800336: 0f be 00                     	movsbl	(%rax), %eax
  800339: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  80033c: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  800340: 0f 8c 0a 00 00 00            	jl	0x800350 <vprintfmt+0x120>
  800346: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  80034a: 0f 8e 05 00 00 00            	jle	0x800355 <vprintfmt+0x125>
; 					break;
  800350: e9 16 00 00 00               	jmp	0x80036b <vprintfmt+0x13b>
; 			}
  800355: e9 00 00 00 00               	jmp	0x80035a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80035a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80035e: 48 83 c0 01                  	addq	$1, %rax
  800362: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800366: e9 ba ff ff ff               	jmp	0x800325 <vprintfmt+0xf5>
; 			goto process_precision;
  80036b: e9 8c 00 00 00               	jmp	0x8003fc <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800370: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800374: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80037b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80037e: 89 45 84                     	movl	%eax, -124(%rbp)
  800381: 83 f8 28                     	cmpl	$40, %eax
  800384: 0f 87 22 00 00 00            	ja	0x8003ac <vprintfmt+0x17c>
  80038a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800391: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800394: 48 63 c2                     	movslq	%edx, %rax
  800397: 48 03 41 10                  	addq	16(%rcx), %rax
  80039b: 83 c2 08                     	addl	$8, %edx
  80039e: 89 11                        	movl	%edx, (%rcx)
  8003a0: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8003a7: e9 1d 00 00 00               	jmp	0x8003c9 <vprintfmt+0x199>
  8003ac: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  8003b3: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8003b7: 48 89 d0                     	movq	%rdx, %rax
  8003ba: 48 83 c2 08                  	addq	$8, %rdx
  8003be: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8003c2: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  8003c9: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  8003d0: 8b 00                        	movl	(%rax), %eax
  8003d2: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  8003d5: e9 22 00 00 00               	jmp	0x8003fc <vprintfmt+0x1cc>
; 			if (width < 0)
  8003da: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8003de: 0f 8d 07 00 00 00            	jge	0x8003eb <vprintfmt+0x1bb>
; 				width = 0;
  8003e4: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  8003eb: e9 e1 fe ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			altflag = 1;
  8003f0: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  8003f7: e9 d5 fe ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			if (width < 0)
  8003fc: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800400: 0f 8d 0d 00 00 00            	jge	0x800413 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800406: 8b 45 98                     	movl	-104(%rbp), %eax
  800409: 89 45 9c                     	movl	%eax, -100(%rbp)
  80040c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  800413: e9 b9 fe ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			lflag++;
  800418: 8b 45 a0                     	movl	-96(%rbp), %eax
  80041b: 83 c0 01                     	addl	$1, %eax
  80041e: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  800421: e9 ab fe ff ff               	jmp	0x8002d1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  800426: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80042a: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  800431: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800435: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  80043c: 8b 45 c0                     	movl	-64(%rbp), %eax
  80043f: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  800445: 83 f8 28                     	cmpl	$40, %eax
  800448: 0f 87 25 00 00 00            	ja	0x800473 <vprintfmt+0x243>
  80044e: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800455: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80045b: 48 63 c2                     	movslq	%edx, %rax
  80045e: 48 03 41 10                  	addq	16(%rcx), %rax
  800462: 83 c2 08                     	addl	$8, %edx
  800465: 89 11                        	movl	%edx, (%rcx)
  800467: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80046e: e9 1d 00 00 00               	jmp	0x800490 <vprintfmt+0x260>
  800473: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80047a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80047e: 48 89 d0                     	movq	%rdx, %rax
  800481: 48 83 c2 08                  	addq	$8, %rdx
  800485: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800489: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800490: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800497: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80049e: 8b 39                        	movl	(%rcx), %edi
  8004a0: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8004a4: ff d0                        	callq	*%rax
; 			break;
  8004a6: e9 55 04 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  8004ab: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8004af: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  8004b6: 8b 45 c0                     	movl	-64(%rbp), %eax
  8004b9: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  8004bf: 83 f8 28                     	cmpl	$40, %eax
  8004c2: 0f 87 25 00 00 00            	ja	0x8004ed <vprintfmt+0x2bd>
  8004c8: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  8004cf: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  8004d5: 48 63 c2                     	movslq	%edx, %rax
  8004d8: 48 03 41 10                  	addq	16(%rcx), %rax
  8004dc: 83 c2 08                     	addl	$8, %edx
  8004df: 89 11                        	movl	%edx, (%rcx)
  8004e1: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8004e8: e9 1d 00 00 00               	jmp	0x80050a <vprintfmt+0x2da>
  8004ed: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  8004f4: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8004f8: 48 89 d0                     	movq	%rdx, %rax
  8004fb: 48 83 c2 08                  	addq	$8, %rdx
  8004ff: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800503: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80050a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  800511: 8b 00                        	movl	(%rax), %eax
  800513: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  800516: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  80051a: 0f 8d 08 00 00 00            	jge	0x800528 <vprintfmt+0x2f8>
; 				err = -err;
  800520: 31 c0                        	xorl	%eax, %eax
  800522: 2b 45 b0                     	subl	-80(%rbp), %eax
  800525: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800528: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  80052c: 48 83 f8 09                  	cmpq	$9, %rax
  800530: 0f 83 1d 00 00 00            	jae	0x800553 <vprintfmt+0x323>
  800536: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80053a: 48 8d 05 df fa 9f ff         	leaq	-6292769(%rip), %rax    # 0x200020 <error_string>
  800541: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  800545: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  800549: 48 83 f8 00                  	cmpq	$0, %rax
  80054d: 0f 85 1e 00 00 00            	jne	0x800571 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800553: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800557: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80055b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80055e: 48 8d 15 45 1b 00 00         	leaq	6981(%rip), %rdx        # 0x8020aa <syscall.c+0x8020aa>
  800565: b0 00                        	movb	$0, %al
  800567: e8 a4 03 00 00               	callq	0x800910 <printfmt>
  80056c: e9 1a 00 00 00               	jmp	0x80058b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800571: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800575: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800579: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80057d: 48 8d 15 97 1a 00 00         	leaq	6807(%rip), %rdx        # 0x80201b <syscall.c+0x80201b>
  800584: b0 00                        	movb	$0, %al
  800586: e8 85 03 00 00               	callq	0x800910 <printfmt>
; 			break;
  80058b: e9 70 03 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800590: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800594: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80059b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80059e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  8005a4: 83 f8 28                     	cmpl	$40, %eax
  8005a7: 0f 87 25 00 00 00            	ja	0x8005d2 <vprintfmt+0x3a2>
  8005ad: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  8005b4: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005ba: 48 63 c2                     	movslq	%edx, %rax
  8005bd: 48 03 41 10                  	addq	16(%rcx), %rax
  8005c1: 83 c2 08                     	addl	$8, %edx
  8005c4: 89 11                        	movl	%edx, (%rcx)
  8005c6: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8005cd: e9 1d 00 00 00               	jmp	0x8005ef <vprintfmt+0x3bf>
  8005d2: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005d9: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005dd: 48 89 d0                     	movq	%rdx, %rax
  8005e0: 48 83 c2 08                  	addq	$8, %rdx
  8005e4: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005e8: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  8005ef: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005f6: 48 8b 00                     	movq	(%rax), %rax
  8005f9: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8005fd: 48 83 f8 00                  	cmpq	$0, %rax
  800601: 0f 85 0b 00 00 00            	jne	0x800612 <vprintfmt+0x3e2>
; 				p = "(null)";
  800607: 48 8d 05 b8 1a 00 00         	leaq	6840(%rip), %rax        # 0x8020c6 <syscall.c+0x8020c6>
  80060e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  800612: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800616: 0f 8e 4f 00 00 00            	jle	0x80066b <vprintfmt+0x43b>
  80061c: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  800620: 83 f8 2d                     	cmpl	$45, %eax
  800623: 0f 84 42 00 00 00            	je	0x80066b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800629: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  80062d: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  800631: e8 da 07 00 00               	callq	0x800e10 <strnlen>
  800636: 89 c1                        	movl	%eax, %ecx
  800638: 8b 45 9c                     	movl	-100(%rbp), %eax
  80063b: 29 c8                        	subl	%ecx, %eax
  80063d: 89 45 9c                     	movl	%eax, -100(%rbp)
  800640: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800644: 0f 8e 1c 00 00 00            	jle	0x800666 <vprintfmt+0x436>
; 					putch(padc, putdat);
  80064a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80064e: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800652: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800656: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800658: 8b 45 9c                     	movl	-100(%rbp), %eax
  80065b: 83 c0 ff                     	addl	$-1, %eax
  80065e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800661: e9 da ff ff ff               	jmp	0x800640 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800666: e9 00 00 00 00               	jmp	0x80066b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80066b: e9 00 00 00 00               	jmp	0x800670 <vprintfmt+0x440>
  800670: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800674: 48 89 c1                     	movq	%rax, %rcx
  800677: 48 83 c1 01                  	addq	$1, %rcx
  80067b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80067f: 0f be 08                     	movsbl	(%rax), %ecx
  800682: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800685: 31 c0                        	xorl	%eax, %eax
  800687: 83 f9 00                     	cmpl	$0, %ecx
  80068a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800690: 0f 84 33 00 00 00            	je	0x8006c9 <vprintfmt+0x499>
  800696: b0 01                        	movb	$1, %al
  800698: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80069c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8006a2: 0f 8c 15 00 00 00            	jl	0x8006bd <vprintfmt+0x48d>
  8006a8: 8b 45 98                     	movl	-104(%rbp), %eax
  8006ab: 83 c0 ff                     	addl	$-1, %eax
  8006ae: 89 45 98                     	movl	%eax, -104(%rbp)
  8006b1: 83 f8 00                     	cmpl	$0, %eax
  8006b4: 0f 9d c0                     	setge	%al
  8006b7: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  8006bd: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  8006c3: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  8006c9: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8006cf: a8 01                        	testb	$1, %al
  8006d1: 0f 85 05 00 00 00            	jne	0x8006dc <vprintfmt+0x4ac>
  8006d7: e9 52 00 00 00               	jmp	0x80072e <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  8006dc: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  8006e0: 0f 84 28 00 00 00            	je	0x80070e <vprintfmt+0x4de>
  8006e6: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  8006ea: 0f 8c 0a 00 00 00            	jl	0x8006fa <vprintfmt+0x4ca>
  8006f0: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  8006f4: 0f 8e 14 00 00 00            	jle	0x80070e <vprintfmt+0x4de>
; 					putch('?', putdat);
  8006fa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8006fe: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800702: bf 3f 00 00 00               	movl	$63, %edi
  800707: ff d0                        	callq	*%rax
  800709: e9 0d 00 00 00               	jmp	0x80071b <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80070e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800712: 8b 7d b4                     	movl	-76(%rbp), %edi
  800715: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800719: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  80071b: e9 00 00 00 00               	jmp	0x800720 <vprintfmt+0x4f0>
; 					width--)
  800720: 8b 45 9c                     	movl	-100(%rbp), %eax
  800723: 83 c0 ff                     	addl	$-1, %eax
  800726: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800729: e9 42 ff ff ff               	jmp	0x800670 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  80072e: e9 00 00 00 00               	jmp	0x800733 <vprintfmt+0x503>
  800733: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800737: 0f 8e 1d 00 00 00            	jle	0x80075a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  80073d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800741: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800745: bf 20 00 00 00               	movl	$32, %edi
  80074a: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  80074c: 8b 45 9c                     	movl	-100(%rbp), %eax
  80074f: 83 c0 ff                     	addl	$-1, %eax
  800752: 89 45 9c                     	movl	%eax, -100(%rbp)
  800755: e9 d9 ff ff ff               	jmp	0x800733 <vprintfmt+0x503>
; 			break;
  80075a: e9 a1 01 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80075f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800762: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800766: e8 05 02 00 00               	callq	0x800970 <getint>
  80076b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80076f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800774: 0f 8d 19 00 00 00            	jge	0x800793 <vprintfmt+0x563>
; 				putch('-', putdat);
  80077a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80077e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800782: bf 2d 00 00 00               	movl	$45, %edi
  800787: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800789: 31 c0                        	xorl	%eax, %eax
  80078b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80078f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800793: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80079a: e9 e6 00 00 00               	jmp	0x800885 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80079f: 8b 75 a0                     	movl	-96(%rbp), %esi
  8007a2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8007a6: e8 f5 02 00 00               	callq	0x800aa0 <getuint>
  8007ab: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  8007af: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  8007b6: e9 ca 00 00 00               	jmp	0x800885 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8007bb: 8b 75 a0                     	movl	-96(%rbp), %esi
  8007be: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8007c2: e8 d9 02 00 00               	callq	0x800aa0 <getuint>
  8007c7: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  8007cb: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  8007d2: e9 ae 00 00 00               	jmp	0x800885 <vprintfmt+0x655>
; 			putch('0', putdat);
  8007d7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007db: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007df: bf 30 00 00 00               	movl	$48, %edi
  8007e4: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  8007e6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007ea: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007ee: bf 78 00 00 00               	movl	$120, %edi
  8007f3: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  8007f5: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8007f9: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800800: 8b 45 c0                     	movl	-64(%rbp), %eax
  800803: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800809: 83 f8 28                     	cmpl	$40, %eax
  80080c: 0f 87 25 00 00 00            	ja	0x800837 <vprintfmt+0x607>
  800812: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  800819: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  80081f: 48 63 c2                     	movslq	%edx, %rax
  800822: 48 03 41 10                  	addq	16(%rcx), %rax
  800826: 83 c2 08                     	addl	$8, %edx
  800829: 89 11                        	movl	%edx, (%rcx)
  80082b: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800832: e9 1d 00 00 00               	jmp	0x800854 <vprintfmt+0x624>
  800837: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  80083e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800842: 48 89 d0                     	movq	%rdx, %rax
  800845: 48 83 c2 08                  	addq	$8, %rdx
  800849: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  80084d: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800854: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  80085b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  80085e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800862: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800869: e9 17 00 00 00               	jmp	0x800885 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80086e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800871: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800875: e8 26 02 00 00               	callq	0x800aa0 <getuint>
  80087a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  80087e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800885: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800889: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80088d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800891: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800894: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800898: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  80089d: e8 2e 03 00 00               	callq	0x800bd0 <printnum>
; 			break;
  8008a2: e9 59 00 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  8008a7: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008ab: 8b 7d b4                     	movl	-76(%rbp), %edi
  8008ae: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008b2: ff d0                        	callq	*%rax
; 			break;
  8008b4: e9 47 00 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  8008b9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008bd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008c1: bf 25 00 00 00               	movl	$37, %edi
  8008c6: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8008c8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8008cc: 48 83 c0 ff                  	addq	$-1, %rax
  8008d0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8008d4: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8008d8: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  8008dc: 83 f8 25                     	cmpl	$37, %eax
  8008df: 0f 84 16 00 00 00            	je	0x8008fb <vprintfmt+0x6cb>
  8008e5: e9 00 00 00 00               	jmp	0x8008ea <vprintfmt+0x6ba>
  8008ea: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8008ee: 48 83 c0 ff                  	addq	$-1, %rax
  8008f2: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8008f6: e9 d9 ff ff ff               	jmp	0x8008d4 <vprintfmt+0x6a4>
; 			break;
  8008fb: e9 00 00 00 00               	jmp	0x800900 <vprintfmt+0x6d0>
; 	while (1) {
  800900: e9 64 f9 ff ff               	jmp	0x800269 <vprintfmt+0x39>
  800905: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80090f: 90                           	nop

0000000000800910 <printfmt>:
; {
  800910: 55                           	pushq	%rbp
  800911: 48 89 e5                     	movq	%rsp, %rbp
  800914: 48 83 ec 60                  	subq	$96, %rsp
  800918: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80091c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800920: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800924: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800928: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80092c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800930: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800934: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800938: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80093c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800940: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800947: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  80094e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800952: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800956: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  80095a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  80095e: e8 cd f8 ff ff               	callq	0x800230 <vprintfmt>
; }
  800963: 48 83 c4 60                  	addq	$96, %rsp
  800967: 5d                           	popq	%rbp
  800968: c3                           	retq
  800969: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800970 <getint>:
; {
  800970: 55                           	pushq	%rbp
  800971: 48 89 e5                     	movq	%rsp, %rbp
  800974: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800978: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  80097b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  80097f: 0f 8c 59 00 00 00            	jl	0x8009de <getint+0x6e>
; 		return va_arg(*ap, long long);
  800985: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800989: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80098d: 8b 00                        	movl	(%rax), %eax
  80098f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800992: 83 f8 28                     	cmpl	$40, %eax
  800995: 0f 87 1c 00 00 00            	ja	0x8009b7 <getint+0x47>
  80099b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80099f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  8009a2: 48 63 c2                     	movslq	%edx, %rax
  8009a5: 48 03 41 10                  	addq	16(%rcx), %rax
  8009a9: 83 c2 08                     	addl	$8, %edx
  8009ac: 89 11                        	movl	%edx, (%rcx)
  8009ae: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8009b2: e9 17 00 00 00               	jmp	0x8009ce <getint+0x5e>
  8009b7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  8009bb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8009bf: 48 89 d0                     	movq	%rdx, %rax
  8009c2: 48 83 c2 08                  	addq	$8, %rdx
  8009c6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8009ca: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8009ce: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  8009d2: 48 8b 00                     	movq	(%rax), %rax
  8009d5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8009d9: e9 b7 00 00 00               	jmp	0x800a95 <getint+0x125>
; 	else if (lflag)
  8009de: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8009e2: 0f 84 59 00 00 00            	je	0x800a41 <getint+0xd1>
; 		return va_arg(*ap, long);
  8009e8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8009ec: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  8009f0: 8b 00                        	movl	(%rax), %eax
  8009f2: 89 45 d4                     	movl	%eax, -44(%rbp)
  8009f5: 83 f8 28                     	cmpl	$40, %eax
  8009f8: 0f 87 1c 00 00 00            	ja	0x800a1a <getint+0xaa>
  8009fe: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800a02: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800a05: 48 63 c2                     	movslq	%edx, %rax
  800a08: 48 03 41 10                  	addq	16(%rcx), %rax
  800a0c: 83 c2 08                     	addl	$8, %edx
  800a0f: 89 11                        	movl	%edx, (%rcx)
  800a11: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800a15: e9 17 00 00 00               	jmp	0x800a31 <getint+0xc1>
  800a1a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800a1e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a22: 48 89 d0                     	movq	%rdx, %rax
  800a25: 48 83 c2 08                  	addq	$8, %rdx
  800a29: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a2d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800a31: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800a35: 48 8b 00                     	movq	(%rax), %rax
  800a38: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800a3c: e9 54 00 00 00               	jmp	0x800a95 <getint+0x125>
; 		return va_arg(*ap, int);
  800a41: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800a45: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800a49: 8b 00                        	movl	(%rax), %eax
  800a4b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800a4e: 83 f8 28                     	cmpl	$40, %eax
  800a51: 0f 87 1c 00 00 00            	ja	0x800a73 <getint+0x103>
  800a57: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800a5b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800a5e: 48 63 c2                     	movslq	%edx, %rax
  800a61: 48 03 41 10                  	addq	16(%rcx), %rax
  800a65: 83 c2 08                     	addl	$8, %edx
  800a68: 89 11                        	movl	%edx, (%rcx)
  800a6a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800a6e: e9 17 00 00 00               	jmp	0x800a8a <getint+0x11a>
  800a73: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800a77: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a7b: 48 89 d0                     	movq	%rdx, %rax
  800a7e: 48 83 c2 08                  	addq	$8, %rdx
  800a82: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a86: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800a8a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800a8e: 48 63 00                     	movslq	(%rax), %rax
  800a91: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800a95: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a99: 5d                           	popq	%rbp
  800a9a: c3                           	retq
  800a9b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800aa0 <getuint>:
; {
  800aa0: 55                           	pushq	%rbp
  800aa1: 48 89 e5                     	movq	%rsp, %rbp
  800aa4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800aa8: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800aab: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800aaf: 0f 8c 59 00 00 00            	jl	0x800b0e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800ab5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ab9: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800abd: 8b 00                        	movl	(%rax), %eax
  800abf: 89 45 e8                     	movl	%eax, -24(%rbp)
  800ac2: 83 f8 28                     	cmpl	$40, %eax
  800ac5: 0f 87 1c 00 00 00            	ja	0x800ae7 <getuint+0x47>
  800acb: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800acf: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800ad2: 48 63 c2                     	movslq	%edx, %rax
  800ad5: 48 03 41 10                  	addq	16(%rcx), %rax
  800ad9: 83 c2 08                     	addl	$8, %edx
  800adc: 89 11                        	movl	%edx, (%rcx)
  800ade: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800ae2: e9 17 00 00 00               	jmp	0x800afe <getuint+0x5e>
  800ae7: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800aeb: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800aef: 48 89 d0                     	movq	%rdx, %rax
  800af2: 48 83 c2 08                  	addq	$8, %rdx
  800af6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800afa: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800afe: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800b02: 48 8b 00                     	movq	(%rax), %rax
  800b05: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800b09: e9 b6 00 00 00               	jmp	0x800bc4 <getuint+0x124>
; 	else if (lflag)
  800b0e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800b12: 0f 84 59 00 00 00            	je	0x800b71 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800b18: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b1c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800b20: 8b 00                        	movl	(%rax), %eax
  800b22: 89 45 d4                     	movl	%eax, -44(%rbp)
  800b25: 83 f8 28                     	cmpl	$40, %eax
  800b28: 0f 87 1c 00 00 00            	ja	0x800b4a <getuint+0xaa>
  800b2e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800b32: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800b35: 48 63 c2                     	movslq	%edx, %rax
  800b38: 48 03 41 10                  	addq	16(%rcx), %rax
  800b3c: 83 c2 08                     	addl	$8, %edx
  800b3f: 89 11                        	movl	%edx, (%rcx)
  800b41: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800b45: e9 17 00 00 00               	jmp	0x800b61 <getuint+0xc1>
  800b4a: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800b4e: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800b52: 48 89 d0                     	movq	%rdx, %rax
  800b55: 48 83 c2 08                  	addq	$8, %rdx
  800b59: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800b5d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800b61: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800b65: 48 8b 00                     	movq	(%rax), %rax
  800b68: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800b6c: e9 53 00 00 00               	jmp	0x800bc4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800b71: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b75: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800b79: 8b 00                        	movl	(%rax), %eax
  800b7b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800b7e: 83 f8 28                     	cmpl	$40, %eax
  800b81: 0f 87 1c 00 00 00            	ja	0x800ba3 <getuint+0x103>
  800b87: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800b8b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800b8e: 48 63 c2                     	movslq	%edx, %rax
  800b91: 48 03 41 10                  	addq	16(%rcx), %rax
  800b95: 83 c2 08                     	addl	$8, %edx
  800b98: 89 11                        	movl	%edx, (%rcx)
  800b9a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800b9e: e9 17 00 00 00               	jmp	0x800bba <getuint+0x11a>
  800ba3: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800ba7: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bab: 48 89 d0                     	movq	%rdx, %rax
  800bae: 48 83 c2 08                  	addq	$8, %rdx
  800bb2: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bb6: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800bba: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800bbe: 8b 00                        	movl	(%rax), %eax
  800bc0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800bc4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800bc8: 5d                           	popq	%rbp
  800bc9: c3                           	retq
  800bca: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800bd0 <printnum>:
; {
  800bd0: 55                           	pushq	%rbp
  800bd1: 48 89 e5                     	movq	%rsp, %rbp
  800bd4: 48 83 ec 30                  	subq	$48, %rsp
  800bd8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800bdc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800be0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800be4: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800be7: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800beb: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800bef: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800bf3: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800bf6: 48 39 c8                     	cmpq	%rcx, %rax
  800bf9: 0f 82 30 00 00 00            	jb	0x800c2f <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800bff: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800c03: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800c07: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800c0b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800c0e: 31 d2                        	xorl	%edx, %edx
  800c10: 48 f7 f1                     	divq	%rcx
  800c13: 48 89 c2                     	movq	%rax, %rdx
  800c16: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800c19: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800c1d: 41 83 e8 01                  	subl	$1, %r8d
  800c21: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800c25: e8 a6 ff ff ff               	callq	0x800bd0 <printnum>
; 	} else {
  800c2a: e9 2e 00 00 00               	jmp	0x800c5d <printnum+0x8d>
; 		while (--width > 0)
  800c2f: e9 00 00 00 00               	jmp	0x800c34 <printnum+0x64>
  800c34: 8b 45 e0                     	movl	-32(%rbp), %eax
  800c37: 83 c0 ff                     	addl	$-1, %eax
  800c3a: 89 45 e0                     	movl	%eax, -32(%rbp)
  800c3d: 83 f8 00                     	cmpl	$0, %eax
  800c40: 0f 8e 12 00 00 00            	jle	0x800c58 <printnum+0x88>
; 			putch(padc, putdat);
  800c46: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c4a: 8b 7d dc                     	movl	-36(%rbp), %edi
  800c4d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800c51: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800c53: e9 dc ff ff ff               	jmp	0x800c34 <printnum+0x64>
  800c58: e9 00 00 00 00               	jmp	0x800c5d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800c5d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c61: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800c65: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800c69: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800c6c: 31 d2                        	xorl	%edx, %edx
  800c6e: 48 f7 f1                     	divq	%rcx
  800c71: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800c75: 48 8d 0d 37 14 00 00         	leaq	5175(%rip), %rcx        # 0x8020b3 <syscall.c+0x8020b3>
  800c7c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800c80: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800c84: ff d0                        	callq	*%rax
; }
  800c86: 48 83 c4 30                  	addq	$48, %rsp
  800c8a: 5d                           	popq	%rbp
  800c8b: c3                           	retq
  800c8c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800c90 <vsnprintf>:
; {
  800c90: 55                           	pushq	%rbp
  800c91: 48 89 e5                     	movq	%rsp, %rbp
  800c94: 48 83 ec 40                  	subq	$64, %rsp
  800c98: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800c9c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800c9f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800ca3: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800ca7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cab: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800caf: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cb3: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800cb7: 48 01 c8                     	addq	%rcx, %rax
  800cba: 48 83 c0 ff                  	addq	$-1, %rax
  800cbe: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800cc2: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800cc9: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800cce: 0f 84 0a 00 00 00            	je	0x800cde <vsnprintf+0x4e>
  800cd4: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800cd8: 0f 8d 0c 00 00 00            	jge	0x800cea <vsnprintf+0x5a>
; 		return -EINVAL;
  800cde: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800ce5: e9 25 00 00 00               	jmp	0x800d0f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800cea: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800cee: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800cf2: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800cf6: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800d20 <sprintputch>
  800cfd: e8 2e f5 ff ff               	callq	0x800230 <vprintfmt>
; 	*b.buf = '\0';
  800d02: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800d06: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800d09: 8b 45 d0                     	movl	-48(%rbp), %eax
  800d0c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800d0f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800d12: 48 83 c4 40                  	addq	$64, %rsp
  800d16: 5d                           	popq	%rbp
  800d17: c3                           	retq
  800d18: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800d20 <sprintputch>:
; {
  800d20: 55                           	pushq	%rbp
  800d21: 48 89 e5                     	movq	%rsp, %rbp
  800d24: 89 7d fc                     	movl	%edi, -4(%rbp)
  800d27: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800d2b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d2f: 8b 48 10                     	movl	16(%rax), %ecx
  800d32: 83 c1 01                     	addl	$1, %ecx
  800d35: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800d38: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d3c: 48 8b 00                     	movq	(%rax), %rax
  800d3f: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800d43: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800d47: 0f 83 18 00 00 00            	jae	0x800d65 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800d4d: 8b 45 fc                     	movl	-4(%rbp), %eax
  800d50: 88 c1                        	movb	%al, %cl
  800d52: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800d56: 48 8b 02                     	movq	(%rdx), %rax
  800d59: 48 89 c6                     	movq	%rax, %rsi
  800d5c: 48 83 c6 01                  	addq	$1, %rsi
  800d60: 48 89 32                     	movq	%rsi, (%rdx)
  800d63: 88 08                        	movb	%cl, (%rax)
; }
  800d65: 5d                           	popq	%rbp
  800d66: c3                           	retq
  800d67: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800d70 <snprintf>:
; {
  800d70: 55                           	pushq	%rbp
  800d71: 48 89 e5                     	movq	%rsp, %rbp
  800d74: 48 83 ec 70                  	subq	$112, %rsp
  800d78: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800d7c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800d80: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800d84: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800d88: 89 75 f4                     	movl	%esi, -12(%rbp)
  800d8b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800d8f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800d93: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800d97: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800d9b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800d9f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800da6: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800dad: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800db1: 8b 75 f4                     	movl	-12(%rbp), %esi
  800db4: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800db8: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800dbc: e8 cf fe ff ff               	callq	0x800c90 <vsnprintf>
  800dc1: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800dc4: 8b 45 cc                     	movl	-52(%rbp), %eax
  800dc7: 48 83 c4 70                  	addq	$112, %rsp
  800dcb: 5d                           	popq	%rbp
  800dcc: c3                           	retq
  800dcd: cc                           	int3
  800dce: cc                           	int3
  800dcf: cc                           	int3

0000000000800dd0 <strlen>:
; {
  800dd0: 55                           	pushq	%rbp
  800dd1: 48 89 e5                     	movq	%rsp, %rbp
  800dd4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800dd8: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800ddf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800de3: 0f be 00                     	movsbl	(%rax), %eax
  800de6: 83 f8 00                     	cmpl	$0, %eax
  800de9: 0f 84 1a 00 00 00            	je	0x800e09 <strlen+0x39>
; 		n++;
  800def: 8b 45 f4                     	movl	-12(%rbp), %eax
  800df2: 83 c0 01                     	addl	$1, %eax
  800df5: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800df8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800dfc: 48 83 c0 01                  	addq	$1, %rax
  800e00: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800e04: e9 d6 ff ff ff               	jmp	0x800ddf <strlen+0xf>
; 	return n;
  800e09: 8b 45 f4                     	movl	-12(%rbp), %eax
  800e0c: 5d                           	popq	%rbp
  800e0d: c3                           	retq
  800e0e: 66 90                        	nop

0000000000800e10 <strnlen>:
; {
  800e10: 55                           	pushq	%rbp
  800e11: 48 89 e5                     	movq	%rsp, %rbp
  800e14: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800e18: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e1c: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  800e23: 31 c0                        	xorl	%eax, %eax
  800e25: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800e2a: 88 45 eb                     	movb	%al, -21(%rbp)
  800e2d: 0f 86 10 00 00 00            	jbe	0x800e43 <strnlen+0x33>
  800e33: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e37: 0f be 00                     	movsbl	(%rax), %eax
  800e3a: 83 f8 00                     	cmpl	$0, %eax
  800e3d: 0f 95 c0                     	setne	%al
  800e40: 88 45 eb                     	movb	%al, -21(%rbp)
  800e43: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e46: a8 01                        	testb	$1, %al
  800e48: 0f 85 05 00 00 00            	jne	0x800e53 <strnlen+0x43>
  800e4e: e9 26 00 00 00               	jmp	0x800e79 <strnlen+0x69>
; 		n++;
  800e53: 8b 45 ec                     	movl	-20(%rbp), %eax
  800e56: 83 c0 01                     	addl	$1, %eax
  800e59: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800e5c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e60: 48 83 c0 01                  	addq	$1, %rax
  800e64: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800e68: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e6c: 48 83 c0 ff                  	addq	$-1, %rax
  800e70: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800e74: e9 aa ff ff ff               	jmp	0x800e23 <strnlen+0x13>
; 	return n;
  800e79: 8b 45 ec                     	movl	-20(%rbp), %eax
  800e7c: 5d                           	popq	%rbp
  800e7d: c3                           	retq
  800e7e: 66 90                        	nop

0000000000800e80 <strcpy>:
; {
  800e80: 55                           	pushq	%rbp
  800e81: 48 89 e5                     	movq	%rsp, %rbp
  800e84: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800e88: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  800e8c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e90: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  800e94: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e98: 48 89 c1                     	movq	%rax, %rcx
  800e9b: 48 83 c1 01                  	addq	$1, %rcx
  800e9f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  800ea3: 8a 00                        	movb	(%rax), %al
  800ea5: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  800ea9: 48 89 ca                     	movq	%rcx, %rdx
  800eac: 48 83 c2 01                  	addq	$1, %rdx
  800eb0: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  800eb4: 88 01                        	movb	%al, (%rcx)
  800eb6: 0f be c0                     	movsbl	%al, %eax
  800eb9: 83 f8 00                     	cmpl	$0, %eax
  800ebc: 0f 84 05 00 00 00            	je	0x800ec7 <strcpy+0x47>
  800ec2: e9 cd ff ff ff               	jmp	0x800e94 <strcpy+0x14>
; 	return ret;
  800ec7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ecb: 5d                           	popq	%rbp
  800ecc: c3                           	retq
  800ecd: 0f 1f 00                     	nopl	(%rax)

0000000000800ed0 <strcat>:
; {
  800ed0: 55                           	pushq	%rbp
  800ed1: 48 89 e5                     	movq	%rsp, %rbp
  800ed4: 48 83 ec 20                  	subq	$32, %rsp
  800ed8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800edc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  800ee0: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800ee4: e8 e7 fe ff ff               	callq	0x800dd0 <strlen>
  800ee9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  800eec: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800ef0: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  800ef4: 48 01 c7                     	addq	%rax, %rdi
  800ef7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800efb: e8 80 ff ff ff               	callq	0x800e80 <strcpy>
; 	return dst;
  800f00: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f04: 48 83 c4 20                  	addq	$32, %rsp
  800f08: 5d                           	popq	%rbp
  800f09: c3                           	retq
  800f0a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800f10 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800f10: 55                           	pushq	%rbp
  800f11: 48 89 e5                     	movq	%rsp, %rbp
  800f14: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f18: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800f1c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  800f20: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f24: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  800f28: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  800f30: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  800f34: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  800f38: 0f 83 49 00 00 00            	jae	0x800f87 <strncpy+0x77>
; 		*dst++ = *src;
  800f3e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f42: 8a 08                        	movb	(%rax), %cl
  800f44: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f48: 48 89 c2                     	movq	%rax, %rdx
  800f4b: 48 83 c2 01                  	addq	$1, %rdx
  800f4f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  800f53: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  800f55: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f59: 0f be 00                     	movsbl	(%rax), %eax
  800f5c: 83 f8 00                     	cmpl	$0, %eax
  800f5f: 0f 84 0c 00 00 00            	je	0x800f71 <strncpy+0x61>
; 			src++;
  800f65: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f69: 48 83 c0 01                  	addq	$1, %rax
  800f6d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  800f71: e9 00 00 00 00               	jmp	0x800f76 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  800f76: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  800f7a: 48 83 c0 01                  	addq	$1, %rax
  800f7e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800f82: e9 a9 ff ff ff               	jmp	0x800f30 <strncpy+0x20>
; 	return ret;
  800f87: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  800f8b: 5d                           	popq	%rbp
  800f8c: c3                           	retq
  800f8d: 0f 1f 00                     	nopl	(%rax)

0000000000800f90 <strlcpy>:
; {
  800f90: 55                           	pushq	%rbp
  800f91: 48 89 e5                     	movq	%rsp, %rbp
  800f94: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f98: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800f9c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  800fa0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fa4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  800fa8: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  800fad: 0f 86 6e 00 00 00            	jbe	0x801021 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  800fb3: e9 00 00 00 00               	jmp	0x800fb8 <strlcpy+0x28>
  800fb8: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  800fbc: 48 83 c1 ff                  	addq	$-1, %rcx
  800fc0: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800fc4: 31 c0                        	xorl	%eax, %eax
  800fc6: 48 83 f9 00                  	cmpq	$0, %rcx
  800fca: 88 45 df                     	movb	%al, -33(%rbp)
  800fcd: 0f 86 10 00 00 00            	jbe	0x800fe3 <strlcpy+0x53>
  800fd3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800fd7: 0f be 00                     	movsbl	(%rax), %eax
  800fda: 83 f8 00                     	cmpl	$0, %eax
  800fdd: 0f 95 c0                     	setne	%al
  800fe0: 88 45 df                     	movb	%al, -33(%rbp)
  800fe3: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  800fe6: a8 01                        	testb	$1, %al
  800fe8: 0f 85 05 00 00 00            	jne	0x800ff3 <strlcpy+0x63>
  800fee: e9 27 00 00 00               	jmp	0x80101a <strlcpy+0x8a>
; 			*dst++ = *src++;
  800ff3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ff7: 48 89 c1                     	movq	%rax, %rcx
  800ffa: 48 83 c1 01                  	addq	$1, %rcx
  800ffe: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801002: 8a 08                        	movb	(%rax), %cl
  801004: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801008: 48 89 c2                     	movq	%rax, %rdx
  80100b: 48 83 c2 01                  	addq	$1, %rdx
  80100f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801013: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  801015: e9 9e ff ff ff               	jmp	0x800fb8 <strlcpy+0x28>
; 		*dst = '\0';
  80101a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80101e: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  801021: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801025: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801029: 48 29 c8                     	subq	%rcx, %rax
  80102c: 5d                           	popq	%rbp
  80102d: c3                           	retq
  80102e: 66 90                        	nop

0000000000801030 <strcmp>:
; {
  801030: 55                           	pushq	%rbp
  801031: 48 89 e5                     	movq	%rsp, %rbp
  801034: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801038: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  80103c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801040: 0f be 08                     	movsbl	(%rax), %ecx
  801043: 31 c0                        	xorl	%eax, %eax
  801045: 83 f9 00                     	cmpl	$0, %ecx
  801048: 88 45 ef                     	movb	%al, -17(%rbp)
  80104b: 0f 84 16 00 00 00            	je	0x801067 <strcmp+0x37>
  801051: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801055: 0f be 00                     	movsbl	(%rax), %eax
  801058: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80105c: 0f be 09                     	movsbl	(%rcx), %ecx
  80105f: 39 c8                        	cmpl	%ecx, %eax
  801061: 0f 94 c0                     	sete	%al
  801064: 88 45 ef                     	movb	%al, -17(%rbp)
  801067: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80106a: a8 01                        	testb	$1, %al
  80106c: 0f 85 05 00 00 00            	jne	0x801077 <strcmp+0x47>
  801072: e9 1d 00 00 00               	jmp	0x801094 <strcmp+0x64>
; 		p++, q++;
  801077: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80107b: 48 83 c0 01                  	addq	$1, %rax
  80107f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801083: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801087: 48 83 c0 01                  	addq	$1, %rax
  80108b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80108f: e9 a8 ff ff ff               	jmp	0x80103c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801094: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801098: 0f b6 00                     	movzbl	(%rax), %eax
  80109b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80109f: 0f b6 09                     	movzbl	(%rcx), %ecx
  8010a2: 29 c8                        	subl	%ecx, %eax
  8010a4: 5d                           	popq	%rbp
  8010a5: c3                           	retq
  8010a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

00000000008010b0 <strncmp>:
; {
  8010b0: 55                           	pushq	%rbp
  8010b1: 48 89 e5                     	movq	%rsp, %rbp
  8010b4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8010b8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8010bc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8010c0: 31 c0                        	xorl	%eax, %eax
  8010c2: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8010c7: 88 45 df                     	movb	%al, -33(%rbp)
  8010ca: 0f 86 2b 00 00 00            	jbe	0x8010fb <strncmp+0x4b>
  8010d0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010d4: 0f be 08                     	movsbl	(%rax), %ecx
  8010d7: 31 c0                        	xorl	%eax, %eax
  8010d9: 83 f9 00                     	cmpl	$0, %ecx
  8010dc: 88 45 df                     	movb	%al, -33(%rbp)
  8010df: 0f 84 16 00 00 00            	je	0x8010fb <strncmp+0x4b>
  8010e5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010e9: 0f be 00                     	movsbl	(%rax), %eax
  8010ec: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8010f0: 0f be 09                     	movsbl	(%rcx), %ecx
  8010f3: 39 c8                        	cmpl	%ecx, %eax
  8010f5: 0f 94 c0                     	sete	%al
  8010f8: 88 45 df                     	movb	%al, -33(%rbp)
  8010fb: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  8010fe: a8 01                        	testb	$1, %al
  801100: 0f 85 05 00 00 00            	jne	0x80110b <strncmp+0x5b>
  801106: e9 29 00 00 00               	jmp	0x801134 <strncmp+0x84>
; 		n--, p++, q++;
  80110b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80110f: 48 83 c0 ff                  	addq	$-1, %rax
  801113: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801117: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80111b: 48 83 c0 01                  	addq	$1, %rax
  80111f: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801123: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801127: 48 83 c0 01                  	addq	$1, %rax
  80112b: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  80112f: e9 8c ff ff ff               	jmp	0x8010c0 <strncmp+0x10>
; 	if (n == 0)
  801134: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801139: 0f 85 0c 00 00 00            	jne	0x80114b <strncmp+0x9b>
; 		return 0;
  80113f: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  801146: e9 13 00 00 00               	jmp	0x80115e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  80114b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80114f: 0f b6 00                     	movzbl	(%rax), %eax
  801152: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801156: 0f b6 09                     	movzbl	(%rcx), %ecx
  801159: 29 c8                        	subl	%ecx, %eax
  80115b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80115e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801161: 5d                           	popq	%rbp
  801162: c3                           	retq
  801163: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80116d: 0f 1f 00                     	nopl	(%rax)

0000000000801170 <strchr>:
; {
  801170: 55                           	pushq	%rbp
  801171: 48 89 e5                     	movq	%rsp, %rbp
  801174: 40 88 f0                     	movb	%sil, %al
  801177: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80117b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80117e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801182: 80 38 00                     	cmpb	$0, (%rax)
  801185: 0f 84 36 00 00 00            	je	0x8011c1 <strchr+0x51>
; 		if (*s == c)
  80118b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80118f: 0f be 00                     	movsbl	(%rax), %eax
  801192: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801196: 39 c8                        	cmpl	%ecx, %eax
  801198: 0f 85 0d 00 00 00            	jne	0x8011ab <strchr+0x3b>
; 			return (char *) s;
  80119e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011a2: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8011a6: e9 1e 00 00 00               	jmp	0x8011c9 <strchr+0x59>
; 		if (*s == c)
  8011ab: e9 00 00 00 00               	jmp	0x8011b0 <strchr+0x40>
; 	for (; *s; s++)
  8011b0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011b4: 48 83 c0 01                  	addq	$1, %rax
  8011b8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8011bc: e9 bd ff ff ff               	jmp	0x80117e <strchr+0xe>
; 	return 0;
  8011c1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  8011c9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011cd: 5d                           	popq	%rbp
  8011ce: c3                           	retq
  8011cf: 90                           	nop

00000000008011d0 <strfind>:
; {
  8011d0: 55                           	pushq	%rbp
  8011d1: 48 89 e5                     	movq	%rsp, %rbp
  8011d4: 40 88 f0                     	movb	%sil, %al
  8011d7: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011db: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  8011de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011e2: 80 38 00                     	cmpb	$0, (%rax)
  8011e5: 0f 84 2e 00 00 00            	je	0x801219 <strfind+0x49>
; 		if (*s == c)
  8011eb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011ef: 0f be 00                     	movsbl	(%rax), %eax
  8011f2: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  8011f6: 39 c8                        	cmpl	%ecx, %eax
  8011f8: 0f 85 05 00 00 00            	jne	0x801203 <strfind+0x33>
; 			break;
  8011fe: e9 16 00 00 00               	jmp	0x801219 <strfind+0x49>
; 		if (*s == c)
  801203: e9 00 00 00 00               	jmp	0x801208 <strfind+0x38>
; 	for (; *s; s++)
  801208: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80120c: 48 83 c0 01                  	addq	$1, %rax
  801210: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801214: e9 c5 ff ff ff               	jmp	0x8011de <strfind+0xe>
; 	return (char *) s;
  801219: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80121d: 5d                           	popq	%rbp
  80121e: c3                           	retq
  80121f: 90                           	nop

0000000000801220 <memset>:
; {
  801220: 55                           	pushq	%rbp
  801221: 48 89 e5                     	movq	%rsp, %rbp
  801224: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801228: 89 75 ec                     	movl	%esi, -20(%rbp)
  80122b: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  80122f: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801234: 0f 85 0d 00 00 00            	jne	0x801247 <memset+0x27>
; 		return v;
  80123a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80123e: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801242: e9 78 00 00 00               	jmp	0x8012bf <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  801247: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80124b: 48 83 e0 03                  	andq	$3, %rax
  80124f: 48 83 f8 00                  	cmpq	$0, %rax
  801253: 0f 85 50 00 00 00            	jne	0x8012a9 <memset+0x89>
  801259: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80125d: 48 83 e0 03                  	andq	$3, %rax
  801261: 48 83 f8 00                  	cmpq	$0, %rax
  801265: 0f 85 3e 00 00 00            	jne	0x8012a9 <memset+0x89>
; 		c &= 0xFF;
  80126b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80126e: 25 ff 00 00 00               	andl	$255, %eax
  801273: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801276: 8b 45 ec                     	movl	-20(%rbp), %eax
  801279: c1 e0 18                     	shll	$24, %eax
  80127c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80127f: c1 e1 10                     	shll	$16, %ecx
  801282: 09 c8                        	orl	%ecx, %eax
  801284: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801287: c1 e1 08                     	shll	$8, %ecx
  80128a: 09 c8                        	orl	%ecx, %eax
  80128c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80128f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801292: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801296: 8b 45 ec                     	movl	-20(%rbp), %eax
  801299: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80129d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  8012a1: fc                           	cld
  8012a2: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  8012a4: e9 0e 00 00 00               	jmp	0x8012b7 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  8012a9: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  8012ad: 8b 45 ec                     	movl	-20(%rbp), %eax
  8012b0: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  8012b4: fc                           	cld
  8012b5: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  8012b7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012bb: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  8012bf: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012c3: 5d                           	popq	%rbp
  8012c4: c3                           	retq
  8012c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8012cf: 90                           	nop

00000000008012d0 <memmove>:
; {
  8012d0: 55                           	pushq	%rbp
  8012d1: 48 89 e5                     	movq	%rsp, %rbp
  8012d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8012d8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8012dc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  8012e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012e4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  8012e8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012ec: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  8012f0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8012f4: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8012f8: 0f 83 9d 00 00 00            	jae	0x80139b <memmove+0xcb>
  8012fe: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801302: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801306: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80130a: 0f 86 8b 00 00 00            	jbe	0x80139b <memmove+0xcb>
; 		s += n;
  801310: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801314: 48 03 45 e0                  	addq	-32(%rbp), %rax
  801318: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  80131c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801320: 48 03 45 d8                  	addq	-40(%rbp), %rax
  801324: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  801328: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80132c: 48 83 e0 03                  	andq	$3, %rax
  801330: 48 83 f8 00                  	cmpq	$0, %rax
  801334: 0f 85 44 00 00 00            	jne	0x80137e <memmove+0xae>
  80133a: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80133e: 48 83 e0 03                  	andq	$3, %rax
  801342: 48 83 f8 00                  	cmpq	$0, %rax
  801346: 0f 85 32 00 00 00            	jne	0x80137e <memmove+0xae>
  80134c: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801350: 48 83 e0 03                  	andq	$3, %rax
  801354: 48 83 f8 00                  	cmpq	$0, %rax
  801358: 0f 85 20 00 00 00            	jne	0x80137e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80135e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801362: 48 83 c7 fc                  	addq	$-4, %rdi
  801366: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80136a: 48 83 c6 fc                  	addq	$-4, %rsi
  80136e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801372: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801376: fd                           	std
  801377: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801379: e9 17 00 00 00               	jmp	0x801395 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80137e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801382: 48 83 c7 ff                  	addq	$-1, %rdi
  801386: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80138a: 48 83 c6 ff                  	addq	$-1, %rsi
  80138e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801392: fd                           	std
  801393: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801395: fc                           	cld
; 	} else {
  801396: e9 62 00 00 00               	jmp	0x8013fd <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80139b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80139f: 48 83 e0 03                  	andq	$3, %rax
  8013a3: 48 83 f8 00                  	cmpq	$0, %rax
  8013a7: 0f 85 3c 00 00 00            	jne	0x8013e9 <memmove+0x119>
  8013ad: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8013b1: 48 83 e0 03                  	andq	$3, %rax
  8013b5: 48 83 f8 00                  	cmpq	$0, %rax
  8013b9: 0f 85 2a 00 00 00            	jne	0x8013e9 <memmove+0x119>
  8013bf: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8013c3: 48 83 e0 03                  	andq	$3, %rax
  8013c7: 48 83 f8 00                  	cmpq	$0, %rax
  8013cb: 0f 85 18 00 00 00            	jne	0x8013e9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  8013d1: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8013d5: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8013d9: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8013dd: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  8013e1: fc                           	cld
  8013e2: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  8013e4: e9 0f 00 00 00               	jmp	0x8013f8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  8013e9: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8013ed: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8013f1: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  8013f5: fc                           	cld
  8013f6: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  8013f8: e9 00 00 00 00               	jmp	0x8013fd <memmove+0x12d>
; 	return dst;
  8013fd: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801401: 5d                           	popq	%rbp
  801402: c3                           	retq
  801403: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80140d: 0f 1f 00                     	nopl	(%rax)

0000000000801410 <memcpy>:
; {
  801410: 55                           	pushq	%rbp
  801411: 48 89 e5                     	movq	%rsp, %rbp
  801414: 48 83 ec 20                  	subq	$32, %rsp
  801418: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80141c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  801420: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  801424: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801428: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80142c: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801430: e8 9b fe ff ff               	callq	0x8012d0 <memmove>
  801435: 48 83 c4 20                  	addq	$32, %rsp
  801439: 5d                           	popq	%rbp
  80143a: c3                           	retq
  80143b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000801440 <memcmp>:
; {
  801440: 55                           	pushq	%rbp
  801441: 48 89 e5                     	movq	%rsp, %rbp
  801444: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801448: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80144c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801450: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801454: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801458: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80145c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801460: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801464: 48 89 c1                     	movq	%rax, %rcx
  801467: 48 83 c1 ff                  	addq	$-1, %rcx
  80146b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80146f: 48 83 f8 00                  	cmpq	$0, %rax
  801473: 0f 86 4b 00 00 00            	jbe	0x8014c4 <memcmp+0x84>
; 		if (*s1 != *s2)
  801479: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80147d: 0f b6 00                     	movzbl	(%rax), %eax
  801480: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801484: 0f b6 09                     	movzbl	(%rcx), %ecx
  801487: 39 c8                        	cmpl	%ecx, %eax
  801489: 0f 84 18 00 00 00            	je	0x8014a7 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80148f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801493: 0f b6 00                     	movzbl	(%rax), %eax
  801496: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80149a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80149d: 29 c8                        	subl	%ecx, %eax
  80149f: 89 45 fc                     	movl	%eax, -4(%rbp)
  8014a2: e9 24 00 00 00               	jmp	0x8014cb <memcmp+0x8b>
; 		s1++, s2++;
  8014a7: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8014ab: 48 83 c0 01                  	addq	$1, %rax
  8014af: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8014b3: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8014b7: 48 83 c0 01                  	addq	$1, %rax
  8014bb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8014bf: e9 9c ff ff ff               	jmp	0x801460 <memcmp+0x20>
; 	return 0;
  8014c4: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  8014cb: 8b 45 fc                     	movl	-4(%rbp), %eax
  8014ce: 5d                           	popq	%rbp
  8014cf: c3                           	retq

00000000008014d0 <memfind>:
; {
  8014d0: 55                           	pushq	%rbp
  8014d1: 48 89 e5                     	movq	%rsp, %rbp
  8014d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014d8: 89 75 f4                     	movl	%esi, -12(%rbp)
  8014db: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  8014df: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014e3: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8014e7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  8014eb: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014ef: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  8014f3: 0f 83 30 00 00 00            	jae	0x801529 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8014f9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014fd: 0f b6 00                     	movzbl	(%rax), %eax
  801500: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801503: 0f b6 c9                     	movzbl	%cl, %ecx
  801506: 39 c8                        	cmpl	%ecx, %eax
  801508: 0f 85 05 00 00 00            	jne	0x801513 <memfind+0x43>
; 			break;
  80150e: e9 16 00 00 00               	jmp	0x801529 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801513: e9 00 00 00 00               	jmp	0x801518 <memfind+0x48>
; 	for (; s < ends; s++)
  801518: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80151c: 48 83 c0 01                  	addq	$1, %rax
  801520: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801524: e9 c2 ff ff ff               	jmp	0x8014eb <memfind+0x1b>
; 	return (void *) s;
  801529: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80152d: 5d                           	popq	%rbp
  80152e: c3                           	retq
  80152f: 90                           	nop

0000000000801530 <strtol>:
; {
  801530: 55                           	pushq	%rbp
  801531: 48 89 e5                     	movq	%rsp, %rbp
  801534: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801538: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80153c: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  80153f: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  801546: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80154e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801552: 0f be 08                     	movsbl	(%rax), %ecx
  801555: b0 01                        	movb	$1, %al
  801557: 83 f9 20                     	cmpl	$32, %ecx
  80155a: 88 45 db                     	movb	%al, -37(%rbp)
  80155d: 0f 84 10 00 00 00            	je	0x801573 <strtol+0x43>
  801563: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801567: 0f be 00                     	movsbl	(%rax), %eax
  80156a: 83 f8 09                     	cmpl	$9, %eax
  80156d: 0f 94 c0                     	sete	%al
  801570: 88 45 db                     	movb	%al, -37(%rbp)
  801573: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801576: a8 01                        	testb	$1, %al
  801578: 0f 85 05 00 00 00            	jne	0x801583 <strtol+0x53>
  80157e: e9 11 00 00 00               	jmp	0x801594 <strtol+0x64>
; 		s++;
  801583: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801587: 48 83 c0 01                  	addq	$1, %rax
  80158b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80158f: e9 ba ff ff ff               	jmp	0x80154e <strtol+0x1e>
; 	if (*s == '+')
  801594: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801598: 0f be 00                     	movsbl	(%rax), %eax
  80159b: 83 f8 2b                     	cmpl	$43, %eax
  80159e: 0f 85 11 00 00 00            	jne	0x8015b5 <strtol+0x85>
; 		s++;
  8015a4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015a8: 48 83 c0 01                  	addq	$1, %rax
  8015ac: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8015b0: e9 28 00 00 00               	jmp	0x8015dd <strtol+0xad>
; 	else if (*s == '-')
  8015b5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015b9: 0f be 00                     	movsbl	(%rax), %eax
  8015bc: 83 f8 2d                     	cmpl	$45, %eax
  8015bf: 0f 85 13 00 00 00            	jne	0x8015d8 <strtol+0xa8>
; 		s++, neg = 1;
  8015c5: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015c9: 48 83 c0 01                  	addq	$1, %rax
  8015cd: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8015d1: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  8015d8: e9 00 00 00 00               	jmp	0x8015dd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  8015dd: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8015e1: 0f 84 0a 00 00 00            	je	0x8015f1 <strtol+0xc1>
  8015e7: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  8015eb: 0f 85 39 00 00 00            	jne	0x80162a <strtol+0xfa>
  8015f1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015f5: 0f be 00                     	movsbl	(%rax), %eax
  8015f8: 83 f8 30                     	cmpl	$48, %eax
  8015fb: 0f 85 29 00 00 00            	jne	0x80162a <strtol+0xfa>
  801601: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801605: 0f be 40 01                  	movsbl	1(%rax), %eax
  801609: 83 f8 78                     	cmpl	$120, %eax
  80160c: 0f 85 18 00 00 00            	jne	0x80162a <strtol+0xfa>
; 		s += 2, base = 16;
  801612: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801616: 48 83 c0 02                  	addq	$2, %rax
  80161a: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  80161e: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  801625: e9 4d 00 00 00               	jmp	0x801677 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  80162a: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  80162e: 0f 85 28 00 00 00            	jne	0x80165c <strtol+0x12c>
  801634: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801638: 0f be 00                     	movsbl	(%rax), %eax
  80163b: 83 f8 30                     	cmpl	$48, %eax
  80163e: 0f 85 18 00 00 00            	jne	0x80165c <strtol+0x12c>
; 		s++, base = 8;
  801644: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801648: 48 83 c0 01                  	addq	$1, %rax
  80164c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801650: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801657: e9 16 00 00 00               	jmp	0x801672 <strtol+0x142>
; 	else if (base == 0)
  80165c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801660: 0f 85 07 00 00 00            	jne	0x80166d <strtol+0x13d>
; 		base = 10;
  801666: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80166d: e9 00 00 00 00               	jmp	0x801672 <strtol+0x142>
  801672: e9 00 00 00 00               	jmp	0x801677 <strtol+0x147>
; 	while (1) {
  801677: e9 00 00 00 00               	jmp	0x80167c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80167c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801680: 0f be 00                     	movsbl	(%rax), %eax
  801683: 83 f8 30                     	cmpl	$48, %eax
  801686: 0f 8c 22 00 00 00            	jl	0x8016ae <strtol+0x17e>
  80168c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801690: 0f be 00                     	movsbl	(%rax), %eax
  801693: 83 f8 39                     	cmpl	$57, %eax
  801696: 0f 8f 12 00 00 00            	jg	0x8016ae <strtol+0x17e>
; 			dig = *s - '0';
  80169c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016a0: 0f be 00                     	movsbl	(%rax), %eax
  8016a3: 83 e8 30                     	subl	$48, %eax
  8016a6: 89 45 dc                     	movl	%eax, -36(%rbp)
  8016a9: e9 79 00 00 00               	jmp	0x801727 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  8016ae: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016b2: 0f be 00                     	movsbl	(%rax), %eax
  8016b5: 83 f8 61                     	cmpl	$97, %eax
  8016b8: 0f 8c 25 00 00 00            	jl	0x8016e3 <strtol+0x1b3>
  8016be: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016c2: 0f be 00                     	movsbl	(%rax), %eax
  8016c5: 83 f8 7a                     	cmpl	$122, %eax
  8016c8: 0f 8f 15 00 00 00            	jg	0x8016e3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  8016ce: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016d2: 0f be 00                     	movsbl	(%rax), %eax
  8016d5: 83 e8 61                     	subl	$97, %eax
  8016d8: 83 c0 0a                     	addl	$10, %eax
  8016db: 89 45 dc                     	movl	%eax, -36(%rbp)
  8016de: e9 3f 00 00 00               	jmp	0x801722 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  8016e3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016e7: 0f be 00                     	movsbl	(%rax), %eax
  8016ea: 83 f8 41                     	cmpl	$65, %eax
  8016ed: 0f 8c 25 00 00 00            	jl	0x801718 <strtol+0x1e8>
  8016f3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016f7: 0f be 00                     	movsbl	(%rax), %eax
  8016fa: 83 f8 5a                     	cmpl	$90, %eax
  8016fd: 0f 8f 15 00 00 00            	jg	0x801718 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801703: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801707: 0f be 00                     	movsbl	(%rax), %eax
  80170a: 83 e8 41                     	subl	$65, %eax
  80170d: 83 c0 0a                     	addl	$10, %eax
  801710: 89 45 dc                     	movl	%eax, -36(%rbp)
  801713: e9 05 00 00 00               	jmp	0x80171d <strtol+0x1ed>
; 			break;
  801718: e9 43 00 00 00               	jmp	0x801760 <strtol+0x230>
  80171d: e9 00 00 00 00               	jmp	0x801722 <strtol+0x1f2>
  801722: e9 00 00 00 00               	jmp	0x801727 <strtol+0x1f7>
; 		if (dig >= base)
  801727: 8b 45 dc                     	movl	-36(%rbp), %eax
  80172a: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  80172d: 0f 8c 05 00 00 00            	jl	0x801738 <strtol+0x208>
; 			break;
  801733: e9 28 00 00 00               	jmp	0x801760 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  801738: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80173c: 48 83 c0 01                  	addq	$1, %rax
  801740: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801744: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801748: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80174c: 48 0f af c1                  	imulq	%rcx, %rax
  801750: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801754: 48 01 c8                     	addq	%rcx, %rax
  801757: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80175b: e9 1c ff ff ff               	jmp	0x80167c <strtol+0x14c>
; 	if (endptr)
  801760: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801765: 0f 84 0b 00 00 00            	je	0x801776 <strtol+0x246>
; 		*endptr = (char *) s;
  80176b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80176f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801773: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801776: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80177a: 0f 84 0f 00 00 00            	je	0x80178f <strtol+0x25f>
  801780: 31 c0                        	xorl	%eax, %eax
  801782: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801786: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80178a: e9 08 00 00 00               	jmp	0x801797 <strtol+0x267>
  80178f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801793: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801797: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80179b: 5d                           	popq	%rbp
  80179c: c3                           	retq
  80179d: cc                           	int3
  80179e: cc                           	int3
  80179f: cc                           	int3

00000000008017a0 <puts>:
; {
  8017a0: 55                           	pushq	%rbp
  8017a1: 48 89 e5                     	movq	%rsp, %rbp
  8017a4: 48 83 ec 20                  	subq	$32, %rsp
  8017a8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8017ac: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8017b0: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8017b4: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8017b8: 31 f6                        	xorl	%esi, %esi
  8017ba: 31 c0                        	xorl	%eax, %eax
  8017bc: 41 89 c1                     	movl	%eax, %r9d
  8017bf: 89 f7                        	movl	%esi, %edi
  8017c1: 4d 89 c8                     	movq	%r9, %r8
  8017c4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8017cc: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8017d5: e8 06 00 00 00               	callq	0x8017e0 <syscall>
; }
  8017da: 48 83 c4 20                  	addq	$32, %rsp
  8017de: 5d                           	popq	%rbp
  8017df: c3                           	retq

00000000008017e0 <syscall>:
; {
  8017e0: 55                           	pushq	%rbp
  8017e1: 48 89 e5                     	movq	%rsp, %rbp
  8017e4: 48 83 ec 40                  	subq	$64, %rsp
  8017e8: 48 8b 45 18                  	movq	24(%rbp), %rax
  8017ec: 48 8b 45 10                  	movq	16(%rbp), %rax
  8017f0: 89 7d fc                     	movl	%edi, -4(%rbp)
  8017f3: 89 75 f8                     	movl	%esi, -8(%rbp)
  8017f6: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  8017fa: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8017fe: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  801802: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  801806: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80180a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80180e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  801812: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  801816: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  80181a: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  80181e: 48 8b 45 18                  	movq	24(%rbp), %rax
  801822: 48 89 04 24                  	movq	%rax, (%rsp)
  801826: e8 01 01 00 00               	callq	0x80192c <do_syscall>
  80182b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  80182f: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  801833: 0f 84 2c 00 00 00            	je	0x801865 <syscall+0x85>
  801839: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  80183e: 0f 83 21 00 00 00            	jae	0x801865 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  801844: 8b 4d fc                     	movl	-4(%rbp), %ecx
  801847: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  80184b: 48 8d 3d 7b 08 00 00         	leaq	2171(%rip), %rdi        # 0x8020cd <syscall.c+0x8020cd>
  801852: be 1f 00 00 00               	movl	$31, %esi
  801857: 48 8d 15 2f 08 00 00         	leaq	2095(%rip), %rdx        # 0x80208d <syscall.c+0x80208d>
  80185e: b0 00                        	movb	$0, %al
  801860: e8 db 00 00 00               	callq	0x801940 <_panic>
; 	return ret;
  801865: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801869: 48 83 c4 40                  	addq	$64, %rsp
  80186d: 5d                           	popq	%rbp
  80186e: c3                           	retq
  80186f: 90                           	nop

0000000000801870 <getc>:
; {
  801870: 55                           	pushq	%rbp
  801871: 48 89 e5                     	movq	%rsp, %rbp
  801874: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801878: bf 01 00 00 00               	movl	$1, %edi
  80187d: 31 f6                        	xorl	%esi, %esi
  80187f: 31 c0                        	xorl	%eax, %eax
  801881: 41 89 c1                     	movl	%eax, %r9d
  801884: 4c 89 ca                     	movq	%r9, %rdx
  801887: 4c 89 c9                     	movq	%r9, %rcx
  80188a: 4d 89 c8                     	movq	%r9, %r8
  80188d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801895: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80189e: e8 3d ff ff ff               	callq	0x8017e0 <syscall>
  8018a3: 48 83 c4 10                  	addq	$16, %rsp
  8018a7: 5d                           	popq	%rbp
  8018a8: c3                           	retq
  8018a9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008018b0 <kill>:
; {
  8018b0: 55                           	pushq	%rbp
  8018b1: 48 89 e5                     	movq	%rsp, %rbp
  8018b4: 48 83 ec 20                  	subq	$32, %rsp
  8018b8: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  8018bb: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  8018bf: bf 03 00 00 00               	movl	$3, %edi
  8018c4: be 01 00 00 00               	movl	$1, %esi
  8018c9: 31 c0                        	xorl	%eax, %eax
  8018cb: 41 89 c1                     	movl	%eax, %r9d
  8018ce: 4c 89 c9                     	movq	%r9, %rcx
  8018d1: 4d 89 c8                     	movq	%r9, %r8
  8018d4: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8018dc: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8018e5: e8 f6 fe ff ff               	callq	0x8017e0 <syscall>
  8018ea: 48 83 c4 20                  	addq	$32, %rsp
  8018ee: 5d                           	popq	%rbp
  8018ef: c3                           	retq

00000000008018f0 <getpid>:
; {
  8018f0: 55                           	pushq	%rbp
  8018f1: 48 89 e5                     	movq	%rsp, %rbp
  8018f4: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  8018f8: bf 02 00 00 00               	movl	$2, %edi
  8018fd: 31 f6                        	xorl	%esi, %esi
  8018ff: 31 c0                        	xorl	%eax, %eax
  801901: 41 89 c1                     	movl	%eax, %r9d
  801904: 4c 89 ca                     	movq	%r9, %rdx
  801907: 4c 89 c9                     	movq	%r9, %rcx
  80190a: 4d 89 c8                     	movq	%r9, %r8
  80190d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801915: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80191e: e8 bd fe ff ff               	callq	0x8017e0 <syscall>
  801923: 48 83 c4 10                  	addq	$16, %rsp
  801927: 5d                           	popq	%rbp
  801928: c3                           	retq
  801929: cc                           	int3
  80192a: cc                           	int3
  80192b: cc                           	int3

000000000080192c <do_syscall>:
; 	pushq %rbp
  80192c: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  80192d: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  801932: cd 80                        	int	$128
; 	popq %rbp
  801934: 5d                           	popq	%rbp
; 	retq
  801935: c3                           	retq
  801936: cc                           	int3
  801937: cc                           	int3
  801938: cc                           	int3
  801939: cc                           	int3
  80193a: cc                           	int3
  80193b: cc                           	int3
  80193c: cc                           	int3
  80193d: cc                           	int3
  80193e: cc                           	int3
  80193f: cc                           	int3

0000000000801940 <_panic>:
; {
  801940: 55                           	pushq	%rbp
  801941: 48 89 e5                     	movq	%rsp, %rbp
  801944: 48 83 ec 60                  	subq	$96, %rsp
  801948: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80194c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  801950: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  801954: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801958: 89 75 f4                     	movl	%esi, -12(%rbp)
  80195b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80195f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  801963: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  801967: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80196b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80196f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  801973: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80197a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  801980: e8 6b ff ff ff               	callq	0x8018f0 <getpid>
  801985: 89 c6                        	movl	%eax, %esi
  801987: 48 8d 05 72 16 00 00         	leaq	5746(%rip), %rax        # 0x803000 <binary_name>
  80198e: 48 8b 10                     	movq	(%rax), %rdx
  801991: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  801995: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  801999: 48 8d 3d 7e 06 00 00         	leaq	1662(%rip), %rdi        # 0x80201e <syscall.c+0x80201e>
  8019a0: b0 00                        	movb	$0, %al
  8019a2: e8 29 e8 ff ff               	callq	0x8001d0 <printf>
; 	vprintf(fmt, ap);
  8019a7: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  8019ab: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  8019af: e8 3c e7 ff ff               	callq	0x8000f0 <vprintf>
; 	printf("\n");
  8019b4: 48 8d 3d 09 07 00 00         	leaq	1801(%rip), %rdi        # 0x8020c4 <syscall.c+0x8020c4>
  8019bb: b0 00                        	movb	$0, %al
  8019bd: e8 0e e8 ff ff               	callq	0x8001d0 <printf>
; 		asm volatile("int3");
  8019c2: cc                           	int3
; 	while (1) {
  8019c3: e9 fa ff ff ff               	jmp	0x8019c2 <_panic+0x82>
