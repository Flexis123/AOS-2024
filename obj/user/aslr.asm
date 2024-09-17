
obj/user/aslr:	file format elf64-x86-64

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
  800042: e8 69 00 00 00               	callq	0x8000b0 <libmain>
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
; void main(int argc, char **argv) {
  800050: 55                           	pushq	%rbp
  800051: 48 89 e5                     	movq	%rsp, %rbp
  800054: 48 83 ec 10                  	subq	$16, %rsp
  800058: 89 7d fc                     	movl	%edi, -4(%rbp)
  80005b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
;     printf("foo: %p\n", foo); /* invalid ptr if foo global is not relocated */
  80005f: 48 8d 05 9a 2f 00 00         	leaq	12186(%rip), %rax       # 0x803000 <foo>
  800066: 48 8b 30                     	movq	(%rax), %rsi
  800069: 48 8d 3d ab 1f 00 00         	leaq	8107(%rip), %rdi        # 0x80201b <syscall.c+0x80201b>
  800070: b0 00                        	movb	$0, %al
  800072: e8 09 02 00 00               	callq	0x800280 <printf>
;     printf("&puts: %p\n", &puts); /* also invalid */
  800077: 48 8d 3d ad 1f 00 00         	leaq	8109(%rip), %rdi        # 0x80202b <syscall.c+0x80202b>
  80007e: 48 8d 35 cb 17 00 00         	leaq	6091(%rip), %rsi        # 0x801850 <puts>
  800085: b0 00                        	movb	$0, %al
  800087: e8 f4 01 00 00               	callq	0x800280 <printf>
;     panic("die"); /* fails when binaryname global is not relocated properly */
  80008c: 48 8d 3d c9 1f 00 00         	leaq	8137(%rip), %rdi        # 0x80205c <syscall.c+0x80205c>
  800093: be 0b 00 00 00               	movl	$11, %esi
  800098: 48 8d 15 c9 1f 00 00         	leaq	8137(%rip), %rdx        # 0x802068 <syscall.c+0x802068>
  80009f: b0 00                        	movb	$0, %al
  8000a1: e8 6a 00 00 00               	callq	0x800110 <_panic>
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

00000000008000b0 <libmain>:
; {
  8000b0: 55                           	pushq	%rbp
  8000b1: 48 89 e5                     	movq	%rsp, %rbp
  8000b4: 48 83 ec 10                  	subq	$16, %rsp
  8000b8: 89 7d fc                     	movl	%edi, -4(%rbp)
  8000bb: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  8000bf: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  8000c3: 0f 8e 11 00 00 00            	jle	0x8000da <libmain+0x2a>
; 		binary_name = argv[0];
  8000c9: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8000cd: 48 8b 08                     	movq	(%rax), %rcx
  8000d0: 48 8d 05 31 2f 00 00         	leaq	12081(%rip), %rax       # 0x803008 <binary_name>
  8000d7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8000da: 8b 7d fc                     	movl	-4(%rbp), %edi
  8000dd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8000e1: e8 6a ff ff ff               	callq	0x800050 <main>
; 	exit();
  8000e6: e8 15 00 00 00               	callq	0x800100 <exit>
; }
  8000eb: 48 83 c4 10                  	addq	$16, %rsp
  8000ef: 5d                           	popq	%rbp
  8000f0: c3                           	retq
  8000f1: cc                           	int3
  8000f2: cc                           	int3
  8000f3: cc                           	int3
  8000f4: cc                           	int3
  8000f5: cc                           	int3
  8000f6: cc                           	int3
  8000f7: cc                           	int3
  8000f8: cc                           	int3
  8000f9: cc                           	int3
  8000fa: cc                           	int3
  8000fb: cc                           	int3
  8000fc: cc                           	int3
  8000fd: cc                           	int3
  8000fe: cc                           	int3
  8000ff: cc                           	int3

0000000000800100 <exit>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  800104: 31 ff                        	xorl	%edi, %edi
  800106: e8 55 18 00 00               	callq	0x801960 <kill>
; }
  80010b: 5d                           	popq	%rbp
  80010c: c3                           	retq
  80010d: cc                           	int3
  80010e: cc                           	int3
  80010f: cc                           	int3

0000000000800110 <_panic>:
; {
  800110: 55                           	pushq	%rbp
  800111: 48 89 e5                     	movq	%rsp, %rbp
  800114: 48 83 ec 60                  	subq	$96, %rsp
  800118: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80011c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800120: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800124: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800128: 89 75 f4                     	movl	%esi, -12(%rbp)
  80012b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80012f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800133: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800137: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80013b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80013f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  800143: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80014a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  800150: e8 4b 18 00 00               	callq	0x8019a0 <getpid>
  800155: 89 c6                        	movl	%eax, %esi
  800157: 48 8d 05 aa 2e 00 00         	leaq	11946(%rip), %rax       # 0x803008 <binary_name>
  80015e: 48 8b 10                     	movq	(%rax), %rdx
  800161: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  800165: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  800169: 48 8d 3d c6 1e 00 00         	leaq	7878(%rip), %rdi        # 0x802036 <syscall.c+0x802036>
  800170: b0 00                        	movb	$0, %al
  800172: e8 09 01 00 00               	callq	0x800280 <printf>
; 	vprintf(fmt, ap);
  800177: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  80017b: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  80017f: e8 1c 00 00 00               	callq	0x8001a0 <vprintf>
; 	printf("\n");
  800184: 48 8d 3d 52 1f 00 00         	leaq	8018(%rip), %rdi        # 0x8020dd <syscall.c+0x8020dd>
  80018b: b0 00                        	movb	$0, %al
  80018d: e8 ee 00 00 00               	callq	0x800280 <printf>
; 		asm volatile("int3");
  800192: cc                           	int3
; 	while (1) {
  800193: e9 fa ff ff ff               	jmp	0x800192 <_panic+0x82>
  800198: cc                           	int3
  800199: cc                           	int3
  80019a: cc                           	int3
  80019b: cc                           	int3
  80019c: cc                           	int3
  80019d: cc                           	int3
  80019e: cc                           	int3
  80019f: cc                           	int3

00000000008001a0 <vprintf>:
; {
  8001a0: 55                           	pushq	%rbp
  8001a1: 48 89 e5                     	movq	%rsp, %rbp
  8001a4: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  8001ab: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8001af: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  8001b3: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  8001bd: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8001c7: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  8001ce: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8001d2: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8001d6: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800210 <putch>
  8001dd: e8 fe 00 00 00               	callq	0x8002e0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8001e2: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  8001e9: 48 83 c7 08                  	addq	$8, %rdi
  8001ed: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  8001f4: e8 57 16 00 00               	callq	0x801850 <puts>
; 	return b.cnt;
  8001f9: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  8001ff: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  800206: 5d                           	popq	%rbp
  800207: c3                           	retq
  800208: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800210 <putch>:
; {
  800210: 55                           	pushq	%rbp
  800211: 48 89 e5                     	movq	%rsp, %rbp
  800214: 48 83 ec 10                  	subq	$16, %rsp
  800218: 89 7d fc                     	movl	%edi, -4(%rbp)
  80021b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80021f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800222: 88 c2                        	movb	%al, %dl
  800224: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800228: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80022c: 8b 0e                        	movl	(%rsi), %ecx
  80022e: 89 cf                        	movl	%ecx, %edi
  800230: 83 c7 01                     	addl	$1, %edi
  800233: 89 3e                        	movl	%edi, (%rsi)
  800235: 48 63 c9                     	movslq	%ecx, %rcx
  800238: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80023c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800240: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800246: 0f 85 1e 00 00 00            	jne	0x80026a <putch+0x5a>
; 		puts(b->buf, b->idx);
  80024c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  800250: 48 83 c7 08                  	addq	$8, %rdi
  800254: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800258: 48 63 30                     	movslq	(%rax), %rsi
  80025b: e8 f0 15 00 00               	callq	0x801850 <puts>
; 		b->idx = 0;
  800260: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800264: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  80026a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80026e: 8b 48 04                     	movl	4(%rax), %ecx
  800271: 83 c1 01                     	addl	$1, %ecx
  800274: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  800277: 48 83 c4 10                  	addq	$16, %rsp
  80027b: 5d                           	popq	%rbp
  80027c: c3                           	retq
  80027d: 0f 1f 00                     	nopl	(%rax)

0000000000800280 <printf>:
; {
  800280: 55                           	pushq	%rbp
  800281: 48 89 e5                     	movq	%rsp, %rbp
  800284: 48 83 ec 60                  	subq	$96, %rsp
  800288: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80028c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800290: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800294: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  800298: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  80029c: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8002a0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8002a4: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8002a8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8002ac: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8002b0: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  8002b7: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  8002be: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8002c2: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  8002c6: e8 d5 fe ff ff               	callq	0x8001a0 <vprintf>
  8002cb: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  8002ce: 8b 45 dc                     	movl	-36(%rbp), %eax
  8002d1: 48 83 c4 60                  	addq	$96, %rsp
  8002d5: 5d                           	popq	%rbp
  8002d6: c3                           	retq
  8002d7: cc                           	int3
  8002d8: cc                           	int3
  8002d9: cc                           	int3
  8002da: cc                           	int3
  8002db: cc                           	int3
  8002dc: cc                           	int3
  8002dd: cc                           	int3
  8002de: cc                           	int3
  8002df: cc                           	int3

00000000008002e0 <vprintfmt>:
; {
  8002e0: 55                           	pushq	%rbp
  8002e1: 48 89 e5                     	movq	%rsp, %rbp
  8002e4: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  8002eb: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8002ef: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8002f3: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  8002f7: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  8002fb: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8002ff: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800303: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  800307: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80030b: 48 8b 0a                     	movq	(%rdx), %rcx
  80030e: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800312: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800316: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800319: e9 00 00 00 00               	jmp	0x80031e <vprintfmt+0x3e>
  80031e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800322: 48 89 c1                     	movq	%rax, %rcx
  800325: 48 83 c1 01                  	addq	$1, %rcx
  800329: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80032d: 0f b6 00                     	movzbl	(%rax), %eax
  800330: 89 45 b4                     	movl	%eax, -76(%rbp)
  800333: 83 f8 25                     	cmpl	$37, %eax
  800336: 0f 84 25 00 00 00            	je	0x800361 <vprintfmt+0x81>
; 			if (ch == '\0')
  80033c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800340: 0f 85 09 00 00 00            	jne	0x80034f <vprintfmt+0x6f>
; 				return;
  800346: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80034d: 5d                           	popq	%rbp
  80034e: c3                           	retq
; 			putch(ch, putdat);
  80034f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800353: 8b 7d b4                     	movl	-76(%rbp), %edi
  800356: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80035a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80035c: e9 bd ff ff ff               	jmp	0x80031e <vprintfmt+0x3e>
; 		padc = ' ';
  800361: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  800365: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  80036c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  800373: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  80037a: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  800381: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800385: 48 89 c1                     	movq	%rax, %rcx
  800388: 48 83 c1 01                  	addq	$1, %rcx
  80038c: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800390: 0f b6 00                     	movzbl	(%rax), %eax
  800393: 89 45 b4                     	movl	%eax, -76(%rbp)
  800396: 83 c0 dd                     	addl	$-35, %eax
  800399: 89 c1                        	movl	%eax, %ecx
  80039b: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  80039f: 83 e8 55                     	subl	$85, %eax
  8003a2: 0f 87 c1 05 00 00            	ja	0x800969 <vprintfmt+0x689>
  8003a8: 48 8b 45 88                  	movq	-120(%rbp), %rax
  8003ac: 48 8d 0d 89 1d 00 00         	leaq	7561(%rip), %rcx        # 0x80213c <syscall.c+0x80213c>
  8003b3: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  8003b7: 48 01 c8                     	addq	%rcx, %rax
  8003ba: ff e0                        	jmpq	*%rax
; 			padc = '-';
  8003bc: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  8003c0: e9 bc ff ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			padc = '0';
  8003c5: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  8003c9: e9 b3 ff ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  8003ce: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  8003d5: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  8003d9: 03 45 b4                     	addl	-76(%rbp), %eax
  8003dc: 83 e8 30                     	subl	$48, %eax
  8003df: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  8003e2: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8003e6: 0f be 00                     	movsbl	(%rax), %eax
  8003e9: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  8003ec: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  8003f0: 0f 8c 0a 00 00 00            	jl	0x800400 <vprintfmt+0x120>
  8003f6: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  8003fa: 0f 8e 05 00 00 00            	jle	0x800405 <vprintfmt+0x125>
; 					break;
  800400: e9 16 00 00 00               	jmp	0x80041b <vprintfmt+0x13b>
; 			}
  800405: e9 00 00 00 00               	jmp	0x80040a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  80040a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80040e: 48 83 c0 01                  	addq	$1, %rax
  800412: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800416: e9 ba ff ff ff               	jmp	0x8003d5 <vprintfmt+0xf5>
; 			goto process_precision;
  80041b: e9 8c 00 00 00               	jmp	0x8004ac <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800420: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800424: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80042b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80042e: 89 45 84                     	movl	%eax, -124(%rbp)
  800431: 83 f8 28                     	cmpl	$40, %eax
  800434: 0f 87 22 00 00 00            	ja	0x80045c <vprintfmt+0x17c>
  80043a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800441: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800444: 48 63 c2                     	movslq	%edx, %rax
  800447: 48 03 41 10                  	addq	16(%rcx), %rax
  80044b: 83 c2 08                     	addl	$8, %edx
  80044e: 89 11                        	movl	%edx, (%rcx)
  800450: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800457: e9 1d 00 00 00               	jmp	0x800479 <vprintfmt+0x199>
  80045c: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  800463: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800467: 48 89 d0                     	movq	%rdx, %rax
  80046a: 48 83 c2 08                  	addq	$8, %rdx
  80046e: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800472: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800479: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  800480: 8b 00                        	movl	(%rax), %eax
  800482: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  800485: e9 22 00 00 00               	jmp	0x8004ac <vprintfmt+0x1cc>
; 			if (width < 0)
  80048a: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  80048e: 0f 8d 07 00 00 00            	jge	0x80049b <vprintfmt+0x1bb>
; 				width = 0;
  800494: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  80049b: e9 e1 fe ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			altflag = 1;
  8004a0: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  8004a7: e9 d5 fe ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			if (width < 0)
  8004ac: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8004b0: 0f 8d 0d 00 00 00            	jge	0x8004c3 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  8004b6: 8b 45 98                     	movl	-104(%rbp), %eax
  8004b9: 89 45 9c                     	movl	%eax, -100(%rbp)
  8004bc: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  8004c3: e9 b9 fe ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			lflag++;
  8004c8: 8b 45 a0                     	movl	-96(%rbp), %eax
  8004cb: 83 c0 01                     	addl	$1, %eax
  8004ce: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  8004d1: e9 ab fe ff ff               	jmp	0x800381 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  8004d6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8004da: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  8004e1: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8004e5: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  8004ec: 8b 45 c0                     	movl	-64(%rbp), %eax
  8004ef: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  8004f5: 83 f8 28                     	cmpl	$40, %eax
  8004f8: 0f 87 25 00 00 00            	ja	0x800523 <vprintfmt+0x243>
  8004fe: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  800505: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  80050b: 48 63 c2                     	movslq	%edx, %rax
  80050e: 48 03 41 10                  	addq	16(%rcx), %rax
  800512: 83 c2 08                     	addl	$8, %edx
  800515: 89 11                        	movl	%edx, (%rcx)
  800517: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80051e: e9 1d 00 00 00               	jmp	0x800540 <vprintfmt+0x260>
  800523: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80052a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80052e: 48 89 d0                     	movq	%rdx, %rax
  800531: 48 83 c2 08                  	addq	$8, %rdx
  800535: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800539: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800540: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800547: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80054e: 8b 39                        	movl	(%rcx), %edi
  800550: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800554: ff d0                        	callq	*%rax
; 			break;
  800556: e9 55 04 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80055b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80055f: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  800566: 8b 45 c0                     	movl	-64(%rbp), %eax
  800569: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  80056f: 83 f8 28                     	cmpl	$40, %eax
  800572: 0f 87 25 00 00 00            	ja	0x80059d <vprintfmt+0x2bd>
  800578: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  80057f: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  800585: 48 63 c2                     	movslq	%edx, %rax
  800588: 48 03 41 10                  	addq	16(%rcx), %rax
  80058c: 83 c2 08                     	addl	$8, %edx
  80058f: 89 11                        	movl	%edx, (%rcx)
  800591: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  800598: e9 1d 00 00 00               	jmp	0x8005ba <vprintfmt+0x2da>
  80059d: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  8005a4: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8005a8: 48 89 d0                     	movq	%rdx, %rax
  8005ab: 48 83 c2 08                  	addq	$8, %rdx
  8005af: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8005b3: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8005ba: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  8005c1: 8b 00                        	movl	(%rax), %eax
  8005c3: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  8005c6: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  8005ca: 0f 8d 08 00 00 00            	jge	0x8005d8 <vprintfmt+0x2f8>
; 				err = -err;
  8005d0: 31 c0                        	xorl	%eax, %eax
  8005d2: 2b 45 b0                     	subl	-80(%rbp), %eax
  8005d5: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005d8: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  8005dc: 48 83 f8 09                  	cmpq	$9, %rax
  8005e0: 0f 83 1d 00 00 00            	jae	0x800603 <vprintfmt+0x323>
  8005e6: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8005ea: 48 8d 05 2f fa 9f ff         	leaq	-6292945(%rip), %rax    # 0x200020 <error_string>
  8005f1: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  8005f5: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8005f9: 48 83 f8 00                  	cmpq	$0, %rax
  8005fd: 0f 85 1e 00 00 00            	jne	0x800621 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  800603: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800607: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80060b: 8b 4d b0                     	movl	-80(%rbp), %ecx
  80060e: 48 8d 15 ae 1a 00 00         	leaq	6830(%rip), %rdx        # 0x8020c3 <syscall.c+0x8020c3>
  800615: b0 00                        	movb	$0, %al
  800617: e8 a4 03 00 00               	callq	0x8009c0 <printfmt>
  80061c: e9 1a 00 00 00               	jmp	0x80063b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800621: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800625: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800629: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80062d: 48 8d 15 f4 19 00 00         	leaq	6644(%rip), %rdx        # 0x802028 <syscall.c+0x802028>
  800634: b0 00                        	movb	$0, %al
  800636: e8 85 03 00 00               	callq	0x8009c0 <printfmt>
; 			break;
  80063b: e9 70 03 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800640: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800644: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80064b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80064e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  800654: 83 f8 28                     	cmpl	$40, %eax
  800657: 0f 87 25 00 00 00            	ja	0x800682 <vprintfmt+0x3a2>
  80065d: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  800664: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  80066a: 48 63 c2                     	movslq	%edx, %rax
  80066d: 48 03 41 10                  	addq	16(%rcx), %rax
  800671: 83 c2 08                     	addl	$8, %edx
  800674: 89 11                        	movl	%edx, (%rcx)
  800676: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80067d: e9 1d 00 00 00               	jmp	0x80069f <vprintfmt+0x3bf>
  800682: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  800689: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80068d: 48 89 d0                     	movq	%rdx, %rax
  800690: 48 83 c2 08                  	addq	$8, %rdx
  800694: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800698: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80069f: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  8006a6: 48 8b 00                     	movq	(%rax), %rax
  8006a9: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8006ad: 48 83 f8 00                  	cmpq	$0, %rax
  8006b1: 0f 85 0b 00 00 00            	jne	0x8006c2 <vprintfmt+0x3e2>
; 				p = "(null)";
  8006b7: 48 8d 05 21 1a 00 00         	leaq	6689(%rip), %rax        # 0x8020df <syscall.c+0x8020df>
  8006be: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  8006c2: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8006c6: 0f 8e 4f 00 00 00            	jle	0x80071b <vprintfmt+0x43b>
  8006cc: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  8006d0: 83 f8 2d                     	cmpl	$45, %eax
  8006d3: 0f 84 42 00 00 00            	je	0x80071b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8006d9: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  8006dd: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  8006e1: e8 da 07 00 00               	callq	0x800ec0 <strnlen>
  8006e6: 89 c1                        	movl	%eax, %ecx
  8006e8: 8b 45 9c                     	movl	-100(%rbp), %eax
  8006eb: 29 c8                        	subl	%ecx, %eax
  8006ed: 89 45 9c                     	movl	%eax, -100(%rbp)
  8006f0: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8006f4: 0f 8e 1c 00 00 00            	jle	0x800716 <vprintfmt+0x436>
; 					putch(padc, putdat);
  8006fa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8006fe: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  800702: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800706: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800708: 8b 45 9c                     	movl	-100(%rbp), %eax
  80070b: 83 c0 ff                     	addl	$-1, %eax
  80070e: 89 45 9c                     	movl	%eax, -100(%rbp)
  800711: e9 da ff ff ff               	jmp	0x8006f0 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800716: e9 00 00 00 00               	jmp	0x80071b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80071b: e9 00 00 00 00               	jmp	0x800720 <vprintfmt+0x440>
  800720: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800724: 48 89 c1                     	movq	%rax, %rcx
  800727: 48 83 c1 01                  	addq	$1, %rcx
  80072b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80072f: 0f be 08                     	movsbl	(%rax), %ecx
  800732: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800735: 31 c0                        	xorl	%eax, %eax
  800737: 83 f9 00                     	cmpl	$0, %ecx
  80073a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800740: 0f 84 33 00 00 00            	je	0x800779 <vprintfmt+0x499>
  800746: b0 01                        	movb	$1, %al
  800748: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80074c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  800752: 0f 8c 15 00 00 00            	jl	0x80076d <vprintfmt+0x48d>
  800758: 8b 45 98                     	movl	-104(%rbp), %eax
  80075b: 83 c0 ff                     	addl	$-1, %eax
  80075e: 89 45 98                     	movl	%eax, -104(%rbp)
  800761: 83 f8 00                     	cmpl	$0, %eax
  800764: 0f 9d c0                     	setge	%al
  800767: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  80076d: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  800773: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800779: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80077f: a8 01                        	testb	$1, %al
  800781: 0f 85 05 00 00 00            	jne	0x80078c <vprintfmt+0x4ac>
  800787: e9 52 00 00 00               	jmp	0x8007de <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  80078c: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  800790: 0f 84 28 00 00 00            	je	0x8007be <vprintfmt+0x4de>
  800796: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  80079a: 0f 8c 0a 00 00 00            	jl	0x8007aa <vprintfmt+0x4ca>
  8007a0: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  8007a4: 0f 8e 14 00 00 00            	jle	0x8007be <vprintfmt+0x4de>
; 					putch('?', putdat);
  8007aa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007ae: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007b2: bf 3f 00 00 00               	movl	$63, %edi
  8007b7: ff d0                        	callq	*%rax
  8007b9: e9 0d 00 00 00               	jmp	0x8007cb <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  8007be: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007c2: 8b 7d b4                     	movl	-76(%rbp), %edi
  8007c5: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007c9: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  8007cb: e9 00 00 00 00               	jmp	0x8007d0 <vprintfmt+0x4f0>
; 					width--)
  8007d0: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007d3: 83 c0 ff                     	addl	$-1, %eax
  8007d6: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8007d9: e9 42 ff ff ff               	jmp	0x800720 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  8007de: e9 00 00 00 00               	jmp	0x8007e3 <vprintfmt+0x503>
  8007e3: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8007e7: 0f 8e 1d 00 00 00            	jle	0x80080a <vprintfmt+0x52a>
; 				putch(' ', putdat);
  8007ed: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007f1: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007f5: bf 20 00 00 00               	movl	$32, %edi
  8007fa: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  8007fc: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007ff: 83 c0 ff                     	addl	$-1, %eax
  800802: 89 45 9c                     	movl	%eax, -100(%rbp)
  800805: e9 d9 ff ff ff               	jmp	0x8007e3 <vprintfmt+0x503>
; 			break;
  80080a: e9 a1 01 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  80080f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800812: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800816: e8 05 02 00 00               	callq	0x800a20 <getint>
  80081b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80081f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800824: 0f 8d 19 00 00 00            	jge	0x800843 <vprintfmt+0x563>
; 				putch('-', putdat);
  80082a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80082e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800832: bf 2d 00 00 00               	movl	$45, %edi
  800837: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800839: 31 c0                        	xorl	%eax, %eax
  80083b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80083f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800843: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80084a: e9 e6 00 00 00               	jmp	0x800935 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80084f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800852: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800856: e8 f5 02 00 00               	callq	0x800b50 <getuint>
  80085b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  80085f: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  800866: e9 ca 00 00 00               	jmp	0x800935 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80086b: 8b 75 a0                     	movl	-96(%rbp), %esi
  80086e: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800872: e8 d9 02 00 00               	callq	0x800b50 <getuint>
  800877: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  80087b: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  800882: e9 ae 00 00 00               	jmp	0x800935 <vprintfmt+0x655>
; 			putch('0', putdat);
  800887: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80088b: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80088f: bf 30 00 00 00               	movl	$48, %edi
  800894: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800896: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80089a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80089e: bf 78 00 00 00               	movl	$120, %edi
  8008a3: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  8008a5: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8008a9: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  8008b0: 8b 45 c0                     	movl	-64(%rbp), %eax
  8008b3: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  8008b9: 83 f8 28                     	cmpl	$40, %eax
  8008bc: 0f 87 25 00 00 00            	ja	0x8008e7 <vprintfmt+0x607>
  8008c2: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  8008c9: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  8008cf: 48 63 c2                     	movslq	%edx, %rax
  8008d2: 48 03 41 10                  	addq	16(%rcx), %rax
  8008d6: 83 c2 08                     	addl	$8, %edx
  8008d9: 89 11                        	movl	%edx, (%rcx)
  8008db: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  8008e2: e9 1d 00 00 00               	jmp	0x800904 <vprintfmt+0x624>
  8008e7: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  8008ee: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8008f2: 48 89 d0                     	movq	%rdx, %rax
  8008f5: 48 83 c2 08                  	addq	$8, %rdx
  8008f9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8008fd: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  800904: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  80090b: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  80090e: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800912: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800919: e9 17 00 00 00               	jmp	0x800935 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80091e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800921: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800925: e8 26 02 00 00               	callq	0x800b50 <getuint>
  80092a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  80092e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800935: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800939: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80093d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800941: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800944: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800948: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  80094d: e8 2e 03 00 00               	callq	0x800c80 <printnum>
; 			break;
  800952: e9 59 00 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800957: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80095b: 8b 7d b4                     	movl	-76(%rbp), %edi
  80095e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800962: ff d0                        	callq	*%rax
; 			break;
  800964: e9 47 00 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800969: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80096d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800971: bf 25 00 00 00               	movl	$37, %edi
  800976: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800978: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80097c: 48 83 c0 ff                  	addq	$-1, %rax
  800980: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800984: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800988: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  80098c: 83 f8 25                     	cmpl	$37, %eax
  80098f: 0f 84 16 00 00 00            	je	0x8009ab <vprintfmt+0x6cb>
  800995: e9 00 00 00 00               	jmp	0x80099a <vprintfmt+0x6ba>
  80099a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80099e: 48 83 c0 ff                  	addq	$-1, %rax
  8009a2: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8009a6: e9 d9 ff ff ff               	jmp	0x800984 <vprintfmt+0x6a4>
; 			break;
  8009ab: e9 00 00 00 00               	jmp	0x8009b0 <vprintfmt+0x6d0>
; 	while (1) {
  8009b0: e9 64 f9 ff ff               	jmp	0x800319 <vprintfmt+0x39>
  8009b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8009bf: 90                           	nop

00000000008009c0 <printfmt>:
; {
  8009c0: 55                           	pushq	%rbp
  8009c1: 48 89 e5                     	movq	%rsp, %rbp
  8009c4: 48 83 ec 60                  	subq	$96, %rsp
  8009c8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8009cc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8009d0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8009d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8009d8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8009dc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  8009e0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8009e4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8009e8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8009ec: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  8009f0: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  8009f7: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  8009fe: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a02: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a06: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800a0a: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800a0e: e8 cd f8 ff ff               	callq	0x8002e0 <vprintfmt>
; }
  800a13: 48 83 c4 60                  	addq	$96, %rsp
  800a17: 5d                           	popq	%rbp
  800a18: c3                           	retq
  800a19: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800a20 <getint>:
; {
  800a20: 55                           	pushq	%rbp
  800a21: 48 89 e5                     	movq	%rsp, %rbp
  800a24: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800a28: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800a2b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800a2f: 0f 8c 59 00 00 00            	jl	0x800a8e <getint+0x6e>
; 		return va_arg(*ap, long long);
  800a35: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800a39: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800a3d: 8b 00                        	movl	(%rax), %eax
  800a3f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800a42: 83 f8 28                     	cmpl	$40, %eax
  800a45: 0f 87 1c 00 00 00            	ja	0x800a67 <getint+0x47>
  800a4b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800a4f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800a52: 48 63 c2                     	movslq	%edx, %rax
  800a55: 48 03 41 10                  	addq	16(%rcx), %rax
  800a59: 83 c2 08                     	addl	$8, %edx
  800a5c: 89 11                        	movl	%edx, (%rcx)
  800a5e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800a62: e9 17 00 00 00               	jmp	0x800a7e <getint+0x5e>
  800a67: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800a6b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800a6f: 48 89 d0                     	movq	%rdx, %rax
  800a72: 48 83 c2 08                  	addq	$8, %rdx
  800a76: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800a7a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800a7e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800a82: 48 8b 00                     	movq	(%rax), %rax
  800a85: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800a89: e9 b7 00 00 00               	jmp	0x800b45 <getint+0x125>
; 	else if (lflag)
  800a8e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800a92: 0f 84 59 00 00 00            	je	0x800af1 <getint+0xd1>
; 		return va_arg(*ap, long);
  800a98: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800a9c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800aa0: 8b 00                        	movl	(%rax), %eax
  800aa2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800aa5: 83 f8 28                     	cmpl	$40, %eax
  800aa8: 0f 87 1c 00 00 00            	ja	0x800aca <getint+0xaa>
  800aae: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800ab2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800ab5: 48 63 c2                     	movslq	%edx, %rax
  800ab8: 48 03 41 10                  	addq	16(%rcx), %rax
  800abc: 83 c2 08                     	addl	$8, %edx
  800abf: 89 11                        	movl	%edx, (%rcx)
  800ac1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ac5: e9 17 00 00 00               	jmp	0x800ae1 <getint+0xc1>
  800aca: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800ace: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800ad2: 48 89 d0                     	movq	%rdx, %rax
  800ad5: 48 83 c2 08                  	addq	$8, %rdx
  800ad9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800add: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ae1: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800ae5: 48 8b 00                     	movq	(%rax), %rax
  800ae8: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800aec: e9 54 00 00 00               	jmp	0x800b45 <getint+0x125>
; 		return va_arg(*ap, int);
  800af1: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800af5: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800af9: 8b 00                        	movl	(%rax), %eax
  800afb: 89 45 bc                     	movl	%eax, -68(%rbp)
  800afe: 83 f8 28                     	cmpl	$40, %eax
  800b01: 0f 87 1c 00 00 00            	ja	0x800b23 <getint+0x103>
  800b07: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800b0b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800b0e: 48 63 c2                     	movslq	%edx, %rax
  800b11: 48 03 41 10                  	addq	16(%rcx), %rax
  800b15: 83 c2 08                     	addl	$8, %edx
  800b18: 89 11                        	movl	%edx, (%rcx)
  800b1a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800b1e: e9 17 00 00 00               	jmp	0x800b3a <getint+0x11a>
  800b23: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800b27: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800b2b: 48 89 d0                     	movq	%rdx, %rax
  800b2e: 48 83 c2 08                  	addq	$8, %rdx
  800b32: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800b36: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800b3a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800b3e: 48 63 00                     	movslq	(%rax), %rax
  800b41: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800b45: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800b49: 5d                           	popq	%rbp
  800b4a: c3                           	retq
  800b4b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800b50 <getuint>:
; {
  800b50: 55                           	pushq	%rbp
  800b51: 48 89 e5                     	movq	%rsp, %rbp
  800b54: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b58: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b5b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b5f: 0f 8c 59 00 00 00            	jl	0x800bbe <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800b65: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b69: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b6d: 8b 00                        	movl	(%rax), %eax
  800b6f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800b72: 83 f8 28                     	cmpl	$40, %eax
  800b75: 0f 87 1c 00 00 00            	ja	0x800b97 <getuint+0x47>
  800b7b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800b7f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800b82: 48 63 c2                     	movslq	%edx, %rax
  800b85: 48 03 41 10                  	addq	16(%rcx), %rax
  800b89: 83 c2 08                     	addl	$8, %edx
  800b8c: 89 11                        	movl	%edx, (%rcx)
  800b8e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b92: e9 17 00 00 00               	jmp	0x800bae <getuint+0x5e>
  800b97: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800b9b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800b9f: 48 89 d0                     	movq	%rdx, %rax
  800ba2: 48 83 c2 08                  	addq	$8, %rdx
  800ba6: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800baa: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800bae: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800bb2: 48 8b 00                     	movq	(%rax), %rax
  800bb5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bb9: e9 b6 00 00 00               	jmp	0x800c74 <getuint+0x124>
; 	else if (lflag)
  800bbe: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800bc2: 0f 84 59 00 00 00            	je	0x800c21 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800bc8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bcc: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800bd0: 8b 00                        	movl	(%rax), %eax
  800bd2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800bd5: 83 f8 28                     	cmpl	$40, %eax
  800bd8: 0f 87 1c 00 00 00            	ja	0x800bfa <getuint+0xaa>
  800bde: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800be2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800be5: 48 63 c2                     	movslq	%edx, %rax
  800be8: 48 03 41 10                  	addq	16(%rcx), %rax
  800bec: 83 c2 08                     	addl	$8, %edx
  800bef: 89 11                        	movl	%edx, (%rcx)
  800bf1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800bf5: e9 17 00 00 00               	jmp	0x800c11 <getuint+0xc1>
  800bfa: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800bfe: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c02: 48 89 d0                     	movq	%rdx, %rax
  800c05: 48 83 c2 08                  	addq	$8, %rdx
  800c09: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c0d: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800c11: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800c15: 48 8b 00                     	movq	(%rax), %rax
  800c18: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c1c: e9 53 00 00 00               	jmp	0x800c74 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800c21: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c25: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800c29: 8b 00                        	movl	(%rax), %eax
  800c2b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800c2e: 83 f8 28                     	cmpl	$40, %eax
  800c31: 0f 87 1c 00 00 00            	ja	0x800c53 <getuint+0x103>
  800c37: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800c3b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800c3e: 48 63 c2                     	movslq	%edx, %rax
  800c41: 48 03 41 10                  	addq	16(%rcx), %rax
  800c45: 83 c2 08                     	addl	$8, %edx
  800c48: 89 11                        	movl	%edx, (%rcx)
  800c4a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c4e: e9 17 00 00 00               	jmp	0x800c6a <getuint+0x11a>
  800c53: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800c57: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c5b: 48 89 d0                     	movq	%rdx, %rax
  800c5e: 48 83 c2 08                  	addq	$8, %rdx
  800c62: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c66: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c6a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800c6e: 8b 00                        	movl	(%rax), %eax
  800c70: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800c74: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c78: 5d                           	popq	%rbp
  800c79: c3                           	retq
  800c7a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800c80 <printnum>:
; {
  800c80: 55                           	pushq	%rbp
  800c81: 48 89 e5                     	movq	%rsp, %rbp
  800c84: 48 83 ec 30                  	subq	$48, %rsp
  800c88: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800c8c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800c90: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800c94: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800c97: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800c9b: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800c9f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800ca3: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800ca6: 48 39 c8                     	cmpq	%rcx, %rax
  800ca9: 0f 82 30 00 00 00            	jb	0x800cdf <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800caf: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800cb3: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800cb7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800cbb: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800cbe: 31 d2                        	xorl	%edx, %edx
  800cc0: 48 f7 f1                     	divq	%rcx
  800cc3: 48 89 c2                     	movq	%rax, %rdx
  800cc6: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800cc9: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800ccd: 41 83 e8 01                  	subl	$1, %r8d
  800cd1: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800cd5: e8 a6 ff ff ff               	callq	0x800c80 <printnum>
; 	} else {
  800cda: e9 2e 00 00 00               	jmp	0x800d0d <printnum+0x8d>
; 		while (--width > 0)
  800cdf: e9 00 00 00 00               	jmp	0x800ce4 <printnum+0x64>
  800ce4: 8b 45 e0                     	movl	-32(%rbp), %eax
  800ce7: 83 c0 ff                     	addl	$-1, %eax
  800cea: 89 45 e0                     	movl	%eax, -32(%rbp)
  800ced: 83 f8 00                     	cmpl	$0, %eax
  800cf0: 0f 8e 12 00 00 00            	jle	0x800d08 <printnum+0x88>
; 			putch(padc, putdat);
  800cf6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800cfa: 8b 7d dc                     	movl	-36(%rbp), %edi
  800cfd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800d01: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800d03: e9 dc ff ff ff               	jmp	0x800ce4 <printnum+0x64>
  800d08: e9 00 00 00 00               	jmp	0x800d0d <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800d0d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800d11: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800d15: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800d19: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800d1c: 31 d2                        	xorl	%edx, %edx
  800d1e: 48 f7 f1                     	divq	%rcx
  800d21: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800d25: 48 8d 0d a0 13 00 00         	leaq	5024(%rip), %rcx        # 0x8020cc <syscall.c+0x8020cc>
  800d2c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800d30: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800d34: ff d0                        	callq	*%rax
; }
  800d36: 48 83 c4 30                  	addq	$48, %rsp
  800d3a: 5d                           	popq	%rbp
  800d3b: c3                           	retq
  800d3c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800d40 <vsnprintf>:
; {
  800d40: 55                           	pushq	%rbp
  800d41: 48 89 e5                     	movq	%rsp, %rbp
  800d44: 48 83 ec 40                  	subq	$64, %rsp
  800d48: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800d4c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800d4f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800d53: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800d57: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d5b: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d5f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d63: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800d67: 48 01 c8                     	addq	%rcx, %rax
  800d6a: 48 83 c0 ff                  	addq	$-1, %rax
  800d6e: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800d72: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800d79: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800d7e: 0f 84 0a 00 00 00            	je	0x800d8e <vsnprintf+0x4e>
  800d84: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800d88: 0f 8d 0c 00 00 00            	jge	0x800d9a <vsnprintf+0x5a>
; 		return -EINVAL;
  800d8e: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800d95: e9 25 00 00 00               	jmp	0x800dbf <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800d9a: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800d9e: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800da2: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800da6: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800dd0 <sprintputch>
  800dad: e8 2e f5 ff ff               	callq	0x8002e0 <vprintfmt>
; 	*b.buf = '\0';
  800db2: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800db6: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800db9: 8b 45 d0                     	movl	-48(%rbp), %eax
  800dbc: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800dbf: 8b 45 fc                     	movl	-4(%rbp), %eax
  800dc2: 48 83 c4 40                  	addq	$64, %rsp
  800dc6: 5d                           	popq	%rbp
  800dc7: c3                           	retq
  800dc8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800dd0 <sprintputch>:
; {
  800dd0: 55                           	pushq	%rbp
  800dd1: 48 89 e5                     	movq	%rsp, %rbp
  800dd4: 89 7d fc                     	movl	%edi, -4(%rbp)
  800dd7: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800ddb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ddf: 8b 48 10                     	movl	16(%rax), %ecx
  800de2: 83 c1 01                     	addl	$1, %ecx
  800de5: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800de8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800dec: 48 8b 00                     	movq	(%rax), %rax
  800def: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800df3: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800df7: 0f 83 18 00 00 00            	jae	0x800e15 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800dfd: 8b 45 fc                     	movl	-4(%rbp), %eax
  800e00: 88 c1                        	movb	%al, %cl
  800e02: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800e06: 48 8b 02                     	movq	(%rdx), %rax
  800e09: 48 89 c6                     	movq	%rax, %rsi
  800e0c: 48 83 c6 01                  	addq	$1, %rsi
  800e10: 48 89 32                     	movq	%rsi, (%rdx)
  800e13: 88 08                        	movb	%cl, (%rax)
; }
  800e15: 5d                           	popq	%rbp
  800e16: c3                           	retq
  800e17: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800e20 <snprintf>:
; {
  800e20: 55                           	pushq	%rbp
  800e21: 48 89 e5                     	movq	%rsp, %rbp
  800e24: 48 83 ec 70                  	subq	$112, %rsp
  800e28: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800e2c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800e30: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800e34: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800e38: 89 75 f4                     	movl	%esi, -12(%rbp)
  800e3b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800e3f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800e43: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800e47: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800e4b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800e4f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800e56: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800e5d: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800e61: 8b 75 f4                     	movl	-12(%rbp), %esi
  800e64: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800e68: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800e6c: e8 cf fe ff ff               	callq	0x800d40 <vsnprintf>
  800e71: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800e74: 8b 45 cc                     	movl	-52(%rbp), %eax
  800e77: 48 83 c4 70                  	addq	$112, %rsp
  800e7b: 5d                           	popq	%rbp
  800e7c: c3                           	retq
  800e7d: cc                           	int3
  800e7e: cc                           	int3
  800e7f: cc                           	int3

0000000000800e80 <strlen>:
; {
  800e80: 55                           	pushq	%rbp
  800e81: 48 89 e5                     	movq	%rsp, %rbp
  800e84: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800e88: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800e8f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e93: 0f be 00                     	movsbl	(%rax), %eax
  800e96: 83 f8 00                     	cmpl	$0, %eax
  800e99: 0f 84 1a 00 00 00            	je	0x800eb9 <strlen+0x39>
; 		n++;
  800e9f: 8b 45 f4                     	movl	-12(%rbp), %eax
  800ea2: 83 c0 01                     	addl	$1, %eax
  800ea5: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800ea8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800eac: 48 83 c0 01                  	addq	$1, %rax
  800eb0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800eb4: e9 d6 ff ff ff               	jmp	0x800e8f <strlen+0xf>
; 	return n;
  800eb9: 8b 45 f4                     	movl	-12(%rbp), %eax
  800ebc: 5d                           	popq	%rbp
  800ebd: c3                           	retq
  800ebe: 66 90                        	nop

0000000000800ec0 <strnlen>:
; {
  800ec0: 55                           	pushq	%rbp
  800ec1: 48 89 e5                     	movq	%rsp, %rbp
  800ec4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800ec8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800ecc: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  800ed3: 31 c0                        	xorl	%eax, %eax
  800ed5: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800eda: 88 45 eb                     	movb	%al, -21(%rbp)
  800edd: 0f 86 10 00 00 00            	jbe	0x800ef3 <strnlen+0x33>
  800ee3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ee7: 0f be 00                     	movsbl	(%rax), %eax
  800eea: 83 f8 00                     	cmpl	$0, %eax
  800eed: 0f 95 c0                     	setne	%al
  800ef0: 88 45 eb                     	movb	%al, -21(%rbp)
  800ef3: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800ef6: a8 01                        	testb	$1, %al
  800ef8: 0f 85 05 00 00 00            	jne	0x800f03 <strnlen+0x43>
  800efe: e9 26 00 00 00               	jmp	0x800f29 <strnlen+0x69>
; 		n++;
  800f03: 8b 45 ec                     	movl	-20(%rbp), %eax
  800f06: 83 c0 01                     	addl	$1, %eax
  800f09: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800f0c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f10: 48 83 c0 01                  	addq	$1, %rax
  800f14: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800f18: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f1c: 48 83 c0 ff                  	addq	$-1, %rax
  800f20: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800f24: e9 aa ff ff ff               	jmp	0x800ed3 <strnlen+0x13>
; 	return n;
  800f29: 8b 45 ec                     	movl	-20(%rbp), %eax
  800f2c: 5d                           	popq	%rbp
  800f2d: c3                           	retq
  800f2e: 66 90                        	nop

0000000000800f30 <strcpy>:
; {
  800f30: 55                           	pushq	%rbp
  800f31: 48 89 e5                     	movq	%rsp, %rbp
  800f34: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f38: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  800f3c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f40: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  800f44: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800f48: 48 89 c1                     	movq	%rax, %rcx
  800f4b: 48 83 c1 01                  	addq	$1, %rcx
  800f4f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  800f53: 8a 00                        	movb	(%rax), %al
  800f55: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  800f59: 48 89 ca                     	movq	%rcx, %rdx
  800f5c: 48 83 c2 01                  	addq	$1, %rdx
  800f60: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  800f64: 88 01                        	movb	%al, (%rcx)
  800f66: 0f be c0                     	movsbl	%al, %eax
  800f69: 83 f8 00                     	cmpl	$0, %eax
  800f6c: 0f 84 05 00 00 00            	je	0x800f77 <strcpy+0x47>
  800f72: e9 cd ff ff ff               	jmp	0x800f44 <strcpy+0x14>
; 	return ret;
  800f77: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800f7b: 5d                           	popq	%rbp
  800f7c: c3                           	retq
  800f7d: 0f 1f 00                     	nopl	(%rax)

0000000000800f80 <strcat>:
; {
  800f80: 55                           	pushq	%rbp
  800f81: 48 89 e5                     	movq	%rsp, %rbp
  800f84: 48 83 ec 20                  	subq	$32, %rsp
  800f88: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f8c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  800f90: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800f94: e8 e7 fe ff ff               	callq	0x800e80 <strlen>
  800f99: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  800f9c: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800fa0: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  800fa4: 48 01 c7                     	addq	%rax, %rdi
  800fa7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800fab: e8 80 ff ff ff               	callq	0x800f30 <strcpy>
; 	return dst;
  800fb0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fb4: 48 83 c4 20                  	addq	$32, %rsp
  800fb8: 5d                           	popq	%rbp
  800fb9: c3                           	retq
  800fba: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800fc0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800fc0: 55                           	pushq	%rbp
  800fc1: 48 89 e5                     	movq	%rsp, %rbp
  800fc4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800fc8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800fcc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  800fd0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fd4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  800fd8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  800fe0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  800fe4: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  800fe8: 0f 83 49 00 00 00            	jae	0x801037 <strncpy+0x77>
; 		*dst++ = *src;
  800fee: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ff2: 8a 08                        	movb	(%rax), %cl
  800ff4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ff8: 48 89 c2                     	movq	%rax, %rdx
  800ffb: 48 83 c2 01                  	addq	$1, %rdx
  800fff: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801003: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  801005: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801009: 0f be 00                     	movsbl	(%rax), %eax
  80100c: 83 f8 00                     	cmpl	$0, %eax
  80100f: 0f 84 0c 00 00 00            	je	0x801021 <strncpy+0x61>
; 			src++;
  801015: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801019: 48 83 c0 01                  	addq	$1, %rax
  80101d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801021: e9 00 00 00 00               	jmp	0x801026 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801026: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80102a: 48 83 c0 01                  	addq	$1, %rax
  80102e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801032: e9 a9 ff ff ff               	jmp	0x800fe0 <strncpy+0x20>
; 	return ret;
  801037: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80103b: 5d                           	popq	%rbp
  80103c: c3                           	retq
  80103d: 0f 1f 00                     	nopl	(%rax)

0000000000801040 <strlcpy>:
; {
  801040: 55                           	pushq	%rbp
  801041: 48 89 e5                     	movq	%rsp, %rbp
  801044: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801048: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80104c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  801050: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801054: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  801058: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  80105d: 0f 86 6e 00 00 00            	jbe	0x8010d1 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  801063: e9 00 00 00 00               	jmp	0x801068 <strlcpy+0x28>
  801068: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80106c: 48 83 c1 ff                  	addq	$-1, %rcx
  801070: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  801074: 31 c0                        	xorl	%eax, %eax
  801076: 48 83 f9 00                  	cmpq	$0, %rcx
  80107a: 88 45 df                     	movb	%al, -33(%rbp)
  80107d: 0f 86 10 00 00 00            	jbe	0x801093 <strlcpy+0x53>
  801083: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801087: 0f be 00                     	movsbl	(%rax), %eax
  80108a: 83 f8 00                     	cmpl	$0, %eax
  80108d: 0f 95 c0                     	setne	%al
  801090: 88 45 df                     	movb	%al, -33(%rbp)
  801093: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801096: a8 01                        	testb	$1, %al
  801098: 0f 85 05 00 00 00            	jne	0x8010a3 <strlcpy+0x63>
  80109e: e9 27 00 00 00               	jmp	0x8010ca <strlcpy+0x8a>
; 			*dst++ = *src++;
  8010a3: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010a7: 48 89 c1                     	movq	%rax, %rcx
  8010aa: 48 83 c1 01                  	addq	$1, %rcx
  8010ae: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8010b2: 8a 08                        	movb	(%rax), %cl
  8010b4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010b8: 48 89 c2                     	movq	%rax, %rdx
  8010bb: 48 83 c2 01                  	addq	$1, %rdx
  8010bf: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010c3: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  8010c5: e9 9e ff ff ff               	jmp	0x801068 <strlcpy+0x28>
; 		*dst = '\0';
  8010ca: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010ce: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8010d1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010d5: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8010d9: 48 29 c8                     	subq	%rcx, %rax
  8010dc: 5d                           	popq	%rbp
  8010dd: c3                           	retq
  8010de: 66 90                        	nop

00000000008010e0 <strcmp>:
; {
  8010e0: 55                           	pushq	%rbp
  8010e1: 48 89 e5                     	movq	%rsp, %rbp
  8010e4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010e8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  8010ec: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010f0: 0f be 08                     	movsbl	(%rax), %ecx
  8010f3: 31 c0                        	xorl	%eax, %eax
  8010f5: 83 f9 00                     	cmpl	$0, %ecx
  8010f8: 88 45 ef                     	movb	%al, -17(%rbp)
  8010fb: 0f 84 16 00 00 00            	je	0x801117 <strcmp+0x37>
  801101: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801105: 0f be 00                     	movsbl	(%rax), %eax
  801108: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80110c: 0f be 09                     	movsbl	(%rcx), %ecx
  80110f: 39 c8                        	cmpl	%ecx, %eax
  801111: 0f 94 c0                     	sete	%al
  801114: 88 45 ef                     	movb	%al, -17(%rbp)
  801117: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80111a: a8 01                        	testb	$1, %al
  80111c: 0f 85 05 00 00 00            	jne	0x801127 <strcmp+0x47>
  801122: e9 1d 00 00 00               	jmp	0x801144 <strcmp+0x64>
; 		p++, q++;
  801127: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80112b: 48 83 c0 01                  	addq	$1, %rax
  80112f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801133: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801137: 48 83 c0 01                  	addq	$1, %rax
  80113b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80113f: e9 a8 ff ff ff               	jmp	0x8010ec <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801144: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801148: 0f b6 00                     	movzbl	(%rax), %eax
  80114b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80114f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801152: 29 c8                        	subl	%ecx, %eax
  801154: 5d                           	popq	%rbp
  801155: c3                           	retq
  801156: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000801160 <strncmp>:
; {
  801160: 55                           	pushq	%rbp
  801161: 48 89 e5                     	movq	%rsp, %rbp
  801164: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801168: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80116c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  801170: 31 c0                        	xorl	%eax, %eax
  801172: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801177: 88 45 df                     	movb	%al, -33(%rbp)
  80117a: 0f 86 2b 00 00 00            	jbe	0x8011ab <strncmp+0x4b>
  801180: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801184: 0f be 08                     	movsbl	(%rax), %ecx
  801187: 31 c0                        	xorl	%eax, %eax
  801189: 83 f9 00                     	cmpl	$0, %ecx
  80118c: 88 45 df                     	movb	%al, -33(%rbp)
  80118f: 0f 84 16 00 00 00            	je	0x8011ab <strncmp+0x4b>
  801195: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801199: 0f be 00                     	movsbl	(%rax), %eax
  80119c: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8011a0: 0f be 09                     	movsbl	(%rcx), %ecx
  8011a3: 39 c8                        	cmpl	%ecx, %eax
  8011a5: 0f 94 c0                     	sete	%al
  8011a8: 88 45 df                     	movb	%al, -33(%rbp)
  8011ab: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  8011ae: a8 01                        	testb	$1, %al
  8011b0: 0f 85 05 00 00 00            	jne	0x8011bb <strncmp+0x5b>
  8011b6: e9 29 00 00 00               	jmp	0x8011e4 <strncmp+0x84>
; 		n--, p++, q++;
  8011bb: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8011bf: 48 83 c0 ff                  	addq	$-1, %rax
  8011c3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8011c7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011cb: 48 83 c0 01                  	addq	$1, %rax
  8011cf: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8011d3: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8011d7: 48 83 c0 01                  	addq	$1, %rax
  8011db: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8011df: e9 8c ff ff ff               	jmp	0x801170 <strncmp+0x10>
; 	if (n == 0)
  8011e4: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8011e9: 0f 85 0c 00 00 00            	jne	0x8011fb <strncmp+0x9b>
; 		return 0;
  8011ef: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  8011f6: e9 13 00 00 00               	jmp	0x80120e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  8011fb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8011ff: 0f b6 00                     	movzbl	(%rax), %eax
  801202: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801206: 0f b6 09                     	movzbl	(%rcx), %ecx
  801209: 29 c8                        	subl	%ecx, %eax
  80120b: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  80120e: 8b 45 fc                     	movl	-4(%rbp), %eax
  801211: 5d                           	popq	%rbp
  801212: c3                           	retq
  801213: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80121d: 0f 1f 00                     	nopl	(%rax)

0000000000801220 <strchr>:
; {
  801220: 55                           	pushq	%rbp
  801221: 48 89 e5                     	movq	%rsp, %rbp
  801224: 40 88 f0                     	movb	%sil, %al
  801227: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80122b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80122e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801232: 80 38 00                     	cmpb	$0, (%rax)
  801235: 0f 84 36 00 00 00            	je	0x801271 <strchr+0x51>
; 		if (*s == c)
  80123b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80123f: 0f be 00                     	movsbl	(%rax), %eax
  801242: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801246: 39 c8                        	cmpl	%ecx, %eax
  801248: 0f 85 0d 00 00 00            	jne	0x80125b <strchr+0x3b>
; 			return (char *) s;
  80124e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801252: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801256: e9 1e 00 00 00               	jmp	0x801279 <strchr+0x59>
; 		if (*s == c)
  80125b: e9 00 00 00 00               	jmp	0x801260 <strchr+0x40>
; 	for (; *s; s++)
  801260: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801264: 48 83 c0 01                  	addq	$1, %rax
  801268: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80126c: e9 bd ff ff ff               	jmp	0x80122e <strchr+0xe>
; 	return 0;
  801271: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  801279: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80127d: 5d                           	popq	%rbp
  80127e: c3                           	retq
  80127f: 90                           	nop

0000000000801280 <strfind>:
; {
  801280: 55                           	pushq	%rbp
  801281: 48 89 e5                     	movq	%rsp, %rbp
  801284: 40 88 f0                     	movb	%sil, %al
  801287: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80128b: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  80128e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801292: 80 38 00                     	cmpb	$0, (%rax)
  801295: 0f 84 2e 00 00 00            	je	0x8012c9 <strfind+0x49>
; 		if (*s == c)
  80129b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80129f: 0f be 00                     	movsbl	(%rax), %eax
  8012a2: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  8012a6: 39 c8                        	cmpl	%ecx, %eax
  8012a8: 0f 85 05 00 00 00            	jne	0x8012b3 <strfind+0x33>
; 			break;
  8012ae: e9 16 00 00 00               	jmp	0x8012c9 <strfind+0x49>
; 		if (*s == c)
  8012b3: e9 00 00 00 00               	jmp	0x8012b8 <strfind+0x38>
; 	for (; *s; s++)
  8012b8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012bc: 48 83 c0 01                  	addq	$1, %rax
  8012c0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8012c4: e9 c5 ff ff ff               	jmp	0x80128e <strfind+0xe>
; 	return (char *) s;
  8012c9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8012cd: 5d                           	popq	%rbp
  8012ce: c3                           	retq
  8012cf: 90                           	nop

00000000008012d0 <memset>:
; {
  8012d0: 55                           	pushq	%rbp
  8012d1: 48 89 e5                     	movq	%rsp, %rbp
  8012d4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8012d8: 89 75 ec                     	movl	%esi, -20(%rbp)
  8012db: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  8012df: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012e4: 0f 85 0d 00 00 00            	jne	0x8012f7 <memset+0x27>
; 		return v;
  8012ea: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012ee: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8012f2: e9 78 00 00 00               	jmp	0x80136f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  8012f7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012fb: 48 83 e0 03                  	andq	$3, %rax
  8012ff: 48 83 f8 00                  	cmpq	$0, %rax
  801303: 0f 85 50 00 00 00            	jne	0x801359 <memset+0x89>
  801309: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80130d: 48 83 e0 03                  	andq	$3, %rax
  801311: 48 83 f8 00                  	cmpq	$0, %rax
  801315: 0f 85 3e 00 00 00            	jne	0x801359 <memset+0x89>
; 		c &= 0xFF;
  80131b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80131e: 25 ff 00 00 00               	andl	$255, %eax
  801323: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801326: 8b 45 ec                     	movl	-20(%rbp), %eax
  801329: c1 e0 18                     	shll	$24, %eax
  80132c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80132f: c1 e1 10                     	shll	$16, %ecx
  801332: 09 c8                        	orl	%ecx, %eax
  801334: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801337: c1 e1 08                     	shll	$8, %ecx
  80133a: 09 c8                        	orl	%ecx, %eax
  80133c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80133f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801342: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801346: 8b 45 ec                     	movl	-20(%rbp), %eax
  801349: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80134d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801351: fc                           	cld
  801352: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801354: e9 0e 00 00 00               	jmp	0x801367 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801359: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  80135d: 8b 45 ec                     	movl	-20(%rbp), %eax
  801360: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  801364: fc                           	cld
  801365: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  801367: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80136b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  80136f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801373: 5d                           	popq	%rbp
  801374: c3                           	retq
  801375: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80137f: 90                           	nop

0000000000801380 <memmove>:
; {
  801380: 55                           	pushq	%rbp
  801381: 48 89 e5                     	movq	%rsp, %rbp
  801384: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801388: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80138c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  801390: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801394: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  801398: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80139c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  8013a0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8013a4: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8013a8: 0f 83 9d 00 00 00            	jae	0x80144b <memmove+0xcb>
  8013ae: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8013b2: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8013b6: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8013ba: 0f 86 8b 00 00 00            	jbe	0x80144b <memmove+0xcb>
; 		s += n;
  8013c0: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8013c4: 48 03 45 e0                  	addq	-32(%rbp), %rax
  8013c8: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  8013cc: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8013d0: 48 03 45 d8                  	addq	-40(%rbp), %rax
  8013d4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8013d8: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8013dc: 48 83 e0 03                  	andq	$3, %rax
  8013e0: 48 83 f8 00                  	cmpq	$0, %rax
  8013e4: 0f 85 44 00 00 00            	jne	0x80142e <memmove+0xae>
  8013ea: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8013ee: 48 83 e0 03                  	andq	$3, %rax
  8013f2: 48 83 f8 00                  	cmpq	$0, %rax
  8013f6: 0f 85 32 00 00 00            	jne	0x80142e <memmove+0xae>
  8013fc: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801400: 48 83 e0 03                  	andq	$3, %rax
  801404: 48 83 f8 00                  	cmpq	$0, %rax
  801408: 0f 85 20 00 00 00            	jne	0x80142e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  80140e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801412: 48 83 c7 fc                  	addq	$-4, %rdi
  801416: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80141a: 48 83 c6 fc                  	addq	$-4, %rsi
  80141e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801422: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801426: fd                           	std
  801427: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801429: e9 17 00 00 00               	jmp	0x801445 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80142e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801432: 48 83 c7 ff                  	addq	$-1, %rdi
  801436: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80143a: 48 83 c6 ff                  	addq	$-1, %rsi
  80143e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801442: fd                           	std
  801443: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801445: fc                           	cld
; 	} else {
  801446: e9 62 00 00 00               	jmp	0x8014ad <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80144b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80144f: 48 83 e0 03                  	andq	$3, %rax
  801453: 48 83 f8 00                  	cmpq	$0, %rax
  801457: 0f 85 3c 00 00 00            	jne	0x801499 <memmove+0x119>
  80145d: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801461: 48 83 e0 03                  	andq	$3, %rax
  801465: 48 83 f8 00                  	cmpq	$0, %rax
  801469: 0f 85 2a 00 00 00            	jne	0x801499 <memmove+0x119>
  80146f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801473: 48 83 e0 03                  	andq	$3, %rax
  801477: 48 83 f8 00                  	cmpq	$0, %rax
  80147b: 0f 85 18 00 00 00            	jne	0x801499 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  801481: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801485: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801489: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80148d: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801491: fc                           	cld
  801492: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801494: e9 0f 00 00 00               	jmp	0x8014a8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801499: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  80149d: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8014a1: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  8014a5: fc                           	cld
  8014a6: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  8014a8: e9 00 00 00 00               	jmp	0x8014ad <memmove+0x12d>
; 	return dst;
  8014ad: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8014b1: 5d                           	popq	%rbp
  8014b2: c3                           	retq
  8014b3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014bd: 0f 1f 00                     	nopl	(%rax)

00000000008014c0 <memcpy>:
; {
  8014c0: 55                           	pushq	%rbp
  8014c1: 48 89 e5                     	movq	%rsp, %rbp
  8014c4: 48 83 ec 20                  	subq	$32, %rsp
  8014c8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8014cc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8014d0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  8014d4: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8014d8: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8014dc: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8014e0: e8 9b fe ff ff               	callq	0x801380 <memmove>
  8014e5: 48 83 c4 20                  	addq	$32, %rsp
  8014e9: 5d                           	popq	%rbp
  8014ea: c3                           	retq
  8014eb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008014f0 <memcmp>:
; {
  8014f0: 55                           	pushq	%rbp
  8014f1: 48 89 e5                     	movq	%rsp, %rbp
  8014f4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8014f8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8014fc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  801500: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801504: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  801508: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80150c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801510: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801514: 48 89 c1                     	movq	%rax, %rcx
  801517: 48 83 c1 ff                  	addq	$-1, %rcx
  80151b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80151f: 48 83 f8 00                  	cmpq	$0, %rax
  801523: 0f 86 4b 00 00 00            	jbe	0x801574 <memcmp+0x84>
; 		if (*s1 != *s2)
  801529: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80152d: 0f b6 00                     	movzbl	(%rax), %eax
  801530: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801534: 0f b6 09                     	movzbl	(%rcx), %ecx
  801537: 39 c8                        	cmpl	%ecx, %eax
  801539: 0f 84 18 00 00 00            	je	0x801557 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80153f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801543: 0f b6 00                     	movzbl	(%rax), %eax
  801546: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80154a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80154d: 29 c8                        	subl	%ecx, %eax
  80154f: 89 45 fc                     	movl	%eax, -4(%rbp)
  801552: e9 24 00 00 00               	jmp	0x80157b <memcmp+0x8b>
; 		s1++, s2++;
  801557: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80155b: 48 83 c0 01                  	addq	$1, %rax
  80155f: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  801563: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801567: 48 83 c0 01                  	addq	$1, %rax
  80156b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  80156f: e9 9c ff ff ff               	jmp	0x801510 <memcmp+0x20>
; 	return 0;
  801574: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  80157b: 8b 45 fc                     	movl	-4(%rbp), %eax
  80157e: 5d                           	popq	%rbp
  80157f: c3                           	retq

0000000000801580 <memfind>:
; {
  801580: 55                           	pushq	%rbp
  801581: 48 89 e5                     	movq	%rsp, %rbp
  801584: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801588: 89 75 f4                     	movl	%esi, -12(%rbp)
  80158b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  80158f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801593: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801597: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  80159b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80159f: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  8015a3: 0f 83 30 00 00 00            	jae	0x8015d9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8015a9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015ad: 0f b6 00                     	movzbl	(%rax), %eax
  8015b0: 8b 4d f4                     	movl	-12(%rbp), %ecx
  8015b3: 0f b6 c9                     	movzbl	%cl, %ecx
  8015b6: 39 c8                        	cmpl	%ecx, %eax
  8015b8: 0f 85 05 00 00 00            	jne	0x8015c3 <memfind+0x43>
; 			break;
  8015be: e9 16 00 00 00               	jmp	0x8015d9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8015c3: e9 00 00 00 00               	jmp	0x8015c8 <memfind+0x48>
; 	for (; s < ends; s++)
  8015c8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015cc: 48 83 c0 01                  	addq	$1, %rax
  8015d0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8015d4: e9 c2 ff ff ff               	jmp	0x80159b <memfind+0x1b>
; 	return (void *) s;
  8015d9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015dd: 5d                           	popq	%rbp
  8015de: c3                           	retq
  8015df: 90                           	nop

00000000008015e0 <strtol>:
; {
  8015e0: 55                           	pushq	%rbp
  8015e1: 48 89 e5                     	movq	%rsp, %rbp
  8015e4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8015e8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8015ec: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  8015ef: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  8015f6: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8015fe: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801602: 0f be 08                     	movsbl	(%rax), %ecx
  801605: b0 01                        	movb	$1, %al
  801607: 83 f9 20                     	cmpl	$32, %ecx
  80160a: 88 45 db                     	movb	%al, -37(%rbp)
  80160d: 0f 84 10 00 00 00            	je	0x801623 <strtol+0x43>
  801613: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801617: 0f be 00                     	movsbl	(%rax), %eax
  80161a: 83 f8 09                     	cmpl	$9, %eax
  80161d: 0f 94 c0                     	sete	%al
  801620: 88 45 db                     	movb	%al, -37(%rbp)
  801623: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801626: a8 01                        	testb	$1, %al
  801628: 0f 85 05 00 00 00            	jne	0x801633 <strtol+0x53>
  80162e: e9 11 00 00 00               	jmp	0x801644 <strtol+0x64>
; 		s++;
  801633: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801637: 48 83 c0 01                  	addq	$1, %rax
  80163b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80163f: e9 ba ff ff ff               	jmp	0x8015fe <strtol+0x1e>
; 	if (*s == '+')
  801644: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801648: 0f be 00                     	movsbl	(%rax), %eax
  80164b: 83 f8 2b                     	cmpl	$43, %eax
  80164e: 0f 85 11 00 00 00            	jne	0x801665 <strtol+0x85>
; 		s++;
  801654: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801658: 48 83 c0 01                  	addq	$1, %rax
  80165c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801660: e9 28 00 00 00               	jmp	0x80168d <strtol+0xad>
; 	else if (*s == '-')
  801665: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801669: 0f be 00                     	movsbl	(%rax), %eax
  80166c: 83 f8 2d                     	cmpl	$45, %eax
  80166f: 0f 85 13 00 00 00            	jne	0x801688 <strtol+0xa8>
; 		s++, neg = 1;
  801675: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801679: 48 83 c0 01                  	addq	$1, %rax
  80167d: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801681: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  801688: e9 00 00 00 00               	jmp	0x80168d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  80168d: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801691: 0f 84 0a 00 00 00            	je	0x8016a1 <strtol+0xc1>
  801697: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  80169b: 0f 85 39 00 00 00            	jne	0x8016da <strtol+0xfa>
  8016a1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016a5: 0f be 00                     	movsbl	(%rax), %eax
  8016a8: 83 f8 30                     	cmpl	$48, %eax
  8016ab: 0f 85 29 00 00 00            	jne	0x8016da <strtol+0xfa>
  8016b1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016b5: 0f be 40 01                  	movsbl	1(%rax), %eax
  8016b9: 83 f8 78                     	cmpl	$120, %eax
  8016bc: 0f 85 18 00 00 00            	jne	0x8016da <strtol+0xfa>
; 		s += 2, base = 16;
  8016c2: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016c6: 48 83 c0 02                  	addq	$2, %rax
  8016ca: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8016ce: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  8016d5: e9 4d 00 00 00               	jmp	0x801727 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  8016da: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8016de: 0f 85 28 00 00 00            	jne	0x80170c <strtol+0x12c>
  8016e4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016e8: 0f be 00                     	movsbl	(%rax), %eax
  8016eb: 83 f8 30                     	cmpl	$48, %eax
  8016ee: 0f 85 18 00 00 00            	jne	0x80170c <strtol+0x12c>
; 		s++, base = 8;
  8016f4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016f8: 48 83 c0 01                  	addq	$1, %rax
  8016fc: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801700: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  801707: e9 16 00 00 00               	jmp	0x801722 <strtol+0x142>
; 	else if (base == 0)
  80170c: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801710: 0f 85 07 00 00 00            	jne	0x80171d <strtol+0x13d>
; 		base = 10;
  801716: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80171d: e9 00 00 00 00               	jmp	0x801722 <strtol+0x142>
  801722: e9 00 00 00 00               	jmp	0x801727 <strtol+0x147>
; 	while (1) {
  801727: e9 00 00 00 00               	jmp	0x80172c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80172c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801730: 0f be 00                     	movsbl	(%rax), %eax
  801733: 83 f8 30                     	cmpl	$48, %eax
  801736: 0f 8c 22 00 00 00            	jl	0x80175e <strtol+0x17e>
  80173c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801740: 0f be 00                     	movsbl	(%rax), %eax
  801743: 83 f8 39                     	cmpl	$57, %eax
  801746: 0f 8f 12 00 00 00            	jg	0x80175e <strtol+0x17e>
; 			dig = *s - '0';
  80174c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801750: 0f be 00                     	movsbl	(%rax), %eax
  801753: 83 e8 30                     	subl	$48, %eax
  801756: 89 45 dc                     	movl	%eax, -36(%rbp)
  801759: e9 79 00 00 00               	jmp	0x8017d7 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80175e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801762: 0f be 00                     	movsbl	(%rax), %eax
  801765: 83 f8 61                     	cmpl	$97, %eax
  801768: 0f 8c 25 00 00 00            	jl	0x801793 <strtol+0x1b3>
  80176e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801772: 0f be 00                     	movsbl	(%rax), %eax
  801775: 83 f8 7a                     	cmpl	$122, %eax
  801778: 0f 8f 15 00 00 00            	jg	0x801793 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  80177e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801782: 0f be 00                     	movsbl	(%rax), %eax
  801785: 83 e8 61                     	subl	$97, %eax
  801788: 83 c0 0a                     	addl	$10, %eax
  80178b: 89 45 dc                     	movl	%eax, -36(%rbp)
  80178e: e9 3f 00 00 00               	jmp	0x8017d2 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801793: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801797: 0f be 00                     	movsbl	(%rax), %eax
  80179a: 83 f8 41                     	cmpl	$65, %eax
  80179d: 0f 8c 25 00 00 00            	jl	0x8017c8 <strtol+0x1e8>
  8017a3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a7: 0f be 00                     	movsbl	(%rax), %eax
  8017aa: 83 f8 5a                     	cmpl	$90, %eax
  8017ad: 0f 8f 15 00 00 00            	jg	0x8017c8 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  8017b3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b7: 0f be 00                     	movsbl	(%rax), %eax
  8017ba: 83 e8 41                     	subl	$65, %eax
  8017bd: 83 c0 0a                     	addl	$10, %eax
  8017c0: 89 45 dc                     	movl	%eax, -36(%rbp)
  8017c3: e9 05 00 00 00               	jmp	0x8017cd <strtol+0x1ed>
; 			break;
  8017c8: e9 43 00 00 00               	jmp	0x801810 <strtol+0x230>
  8017cd: e9 00 00 00 00               	jmp	0x8017d2 <strtol+0x1f2>
  8017d2: e9 00 00 00 00               	jmp	0x8017d7 <strtol+0x1f7>
; 		if (dig >= base)
  8017d7: 8b 45 dc                     	movl	-36(%rbp), %eax
  8017da: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  8017dd: 0f 8c 05 00 00 00            	jl	0x8017e8 <strtol+0x208>
; 			break;
  8017e3: e9 28 00 00 00               	jmp	0x801810 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  8017e8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017ec: 48 83 c0 01                  	addq	$1, %rax
  8017f0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017f4: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8017f8: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  8017fc: 48 0f af c1                  	imulq	%rcx, %rax
  801800: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  801804: 48 01 c8                     	addq	%rcx, %rax
  801807: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  80180b: e9 1c ff ff ff               	jmp	0x80172c <strtol+0x14c>
; 	if (endptr)
  801810: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801815: 0f 84 0b 00 00 00            	je	0x801826 <strtol+0x246>
; 		*endptr = (char *) s;
  80181b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80181f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801823: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801826: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80182a: 0f 84 0f 00 00 00            	je	0x80183f <strtol+0x25f>
  801830: 31 c0                        	xorl	%eax, %eax
  801832: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801836: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80183a: e9 08 00 00 00               	jmp	0x801847 <strtol+0x267>
  80183f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801843: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801847: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80184b: 5d                           	popq	%rbp
  80184c: c3                           	retq
  80184d: cc                           	int3
  80184e: cc                           	int3
  80184f: cc                           	int3

0000000000801850 <puts>:
; {
  801850: 55                           	pushq	%rbp
  801851: 48 89 e5                     	movq	%rsp, %rbp
  801854: 48 83 ec 20                  	subq	$32, %rsp
  801858: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80185c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  801860: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  801864: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  801868: 31 f6                        	xorl	%esi, %esi
  80186a: 31 c0                        	xorl	%eax, %eax
  80186c: 41 89 c1                     	movl	%eax, %r9d
  80186f: 89 f7                        	movl	%esi, %edi
  801871: 4d 89 c8                     	movq	%r9, %r8
  801874: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80187c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801885: e8 06 00 00 00               	callq	0x801890 <syscall>
; }
  80188a: 48 83 c4 20                  	addq	$32, %rsp
  80188e: 5d                           	popq	%rbp
  80188f: c3                           	retq

0000000000801890 <syscall>:
; {
  801890: 55                           	pushq	%rbp
  801891: 48 89 e5                     	movq	%rsp, %rbp
  801894: 48 83 ec 40                  	subq	$64, %rsp
  801898: 48 8b 45 18                  	movq	24(%rbp), %rax
  80189c: 48 8b 45 10                  	movq	16(%rbp), %rax
  8018a0: 89 7d fc                     	movl	%edi, -4(%rbp)
  8018a3: 89 75 f8                     	movl	%esi, -8(%rbp)
  8018a6: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  8018aa: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  8018ae: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  8018b2: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8018b6: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  8018ba: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8018be: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8018c2: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8018c6: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  8018ca: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  8018ce: 48 8b 45 18                  	movq	24(%rbp), %rax
  8018d2: 48 89 04 24                  	movq	%rax, (%rsp)
  8018d6: e8 01 01 00 00               	callq	0x8019dc <do_syscall>
  8018db: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  8018df: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  8018e3: 0f 84 2c 00 00 00            	je	0x801915 <syscall+0x85>
  8018e9: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  8018ee: 0f 83 21 00 00 00            	jae	0x801915 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  8018f4: 8b 4d fc                     	movl	-4(%rbp), %ecx
  8018f7: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  8018fb: 48 8d 3d e4 07 00 00         	leaq	2020(%rip), %rdi        # 0x8020e6 <syscall.c+0x8020e6>
  801902: be 1f 00 00 00               	movl	$31, %esi
  801907: 48 8d 15 98 07 00 00         	leaq	1944(%rip), %rdx        # 0x8020a6 <syscall.c+0x8020a6>
  80190e: b0 00                        	movb	$0, %al
  801910: e8 fb e7 ff ff               	callq	0x800110 <_panic>
; 	return ret;
  801915: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801919: 48 83 c4 40                  	addq	$64, %rsp
  80191d: 5d                           	popq	%rbp
  80191e: c3                           	retq
  80191f: 90                           	nop

0000000000801920 <getc>:
; {
  801920: 55                           	pushq	%rbp
  801921: 48 89 e5                     	movq	%rsp, %rbp
  801924: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801928: bf 01 00 00 00               	movl	$1, %edi
  80192d: 31 f6                        	xorl	%esi, %esi
  80192f: 31 c0                        	xorl	%eax, %eax
  801931: 41 89 c1                     	movl	%eax, %r9d
  801934: 4c 89 ca                     	movq	%r9, %rdx
  801937: 4c 89 c9                     	movq	%r9, %rcx
  80193a: 4d 89 c8                     	movq	%r9, %r8
  80193d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801945: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  80194e: e8 3d ff ff ff               	callq	0x801890 <syscall>
  801953: 48 83 c4 10                  	addq	$16, %rsp
  801957: 5d                           	popq	%rbp
  801958: c3                           	retq
  801959: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000801960 <kill>:
; {
  801960: 55                           	pushq	%rbp
  801961: 48 89 e5                     	movq	%rsp, %rbp
  801964: 48 83 ec 20                  	subq	$32, %rsp
  801968: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  80196b: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  80196f: bf 03 00 00 00               	movl	$3, %edi
  801974: be 01 00 00 00               	movl	$1, %esi
  801979: 31 c0                        	xorl	%eax, %eax
  80197b: 41 89 c1                     	movl	%eax, %r9d
  80197e: 4c 89 c9                     	movq	%r9, %rcx
  801981: 4d 89 c8                     	movq	%r9, %r8
  801984: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80198c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801995: e8 f6 fe ff ff               	callq	0x801890 <syscall>
  80199a: 48 83 c4 20                  	addq	$32, %rsp
  80199e: 5d                           	popq	%rbp
  80199f: c3                           	retq

00000000008019a0 <getpid>:
; {
  8019a0: 55                           	pushq	%rbp
  8019a1: 48 89 e5                     	movq	%rsp, %rbp
  8019a4: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  8019a8: bf 02 00 00 00               	movl	$2, %edi
  8019ad: 31 f6                        	xorl	%esi, %esi
  8019af: 31 c0                        	xorl	%eax, %eax
  8019b1: 41 89 c1                     	movl	%eax, %r9d
  8019b4: 4c 89 ca                     	movq	%r9, %rdx
  8019b7: 4c 89 c9                     	movq	%r9, %rcx
  8019ba: 4d 89 c8                     	movq	%r9, %r8
  8019bd: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8019c5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  8019ce: e8 bd fe ff ff               	callq	0x801890 <syscall>
  8019d3: 48 83 c4 10                  	addq	$16, %rsp
  8019d7: 5d                           	popq	%rbp
  8019d8: c3                           	retq
  8019d9: cc                           	int3
  8019da: cc                           	int3
  8019db: cc                           	int3

00000000008019dc <do_syscall>:
; 	pushq %rbp
  8019dc: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  8019dd: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  8019e2: cd 80                        	int	$128
; 	popq %rbp
  8019e4: 5d                           	popq	%rbp
; 	retq
  8019e5: c3                           	retq
