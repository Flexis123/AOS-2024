
obj/user/aslr:	file format elf64-x86-64

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
  800033: e8 68 00 00 00               	callq	0x8000a0 <libmain>
; 	jmp 1b
  800038: eb fe                        	jmp	0x800038 <args_exist+0x5>
  80003a: cc                           	int3
  80003b: cc                           	int3
  80003c: cc                           	int3
  80003d: cc                           	int3
  80003e: cc                           	int3
  80003f: cc                           	int3

0000000000800040 <main>:
; void main(int argc, char **argv) {
  800040: 55                           	pushq	%rbp
  800041: 48 89 e5                     	movq	%rsp, %rbp
  800044: 48 83 ec 10                  	subq	$0x10, %rsp
  800048: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  80004b: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
;     printf("foo: %p\n", foo); /* invalid ptr if foo global is not relocated */
  80004f: 48 8d 05 aa 2f 00 00         	leaq	0x2faa(%rip), %rax      # 0x803000 <foo>
  800056: 48 8b 30                     	movq	(%rax), %rsi
  800059: 48 8d 3d f0 1f 00 00         	leaq	0x1ff0(%rip), %rdi      # 0x802050
  800060: b0 00                        	movb	$0x0, %al
  800062: e8 09 02 00 00               	callq	0x800270 <printf>
;     printf("&puts: %p\n", &puts); /* also invalid */
  800067: 48 8d 3d c6 1f 00 00         	leaq	0x1fc6(%rip), %rdi      # 0x802034
  80006e: 48 8d 35 cb 17 00 00         	leaq	0x17cb(%rip), %rsi      # 0x801840 <puts>
  800075: b0 00                        	movb	$0x0, %al
  800077: e8 f4 01 00 00               	callq	0x800270 <printf>
;     panic("die"); /* fails when binaryname global is not relocated properly */
  80007c: 48 8d 3d 54 20 00 00         	leaq	0x2054(%rip), %rdi      # 0x8020d7
  800083: be 0b 00 00 00               	movl	$0xb, %esi
  800088: 48 8d 15 12 20 00 00         	leaq	0x2012(%rip), %rdx      # 0x8020a1
  80008f: b0 00                        	movb	$0x0, %al
  800091: e8 6a 00 00 00               	callq	0x800100 <_panic>
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

00000000008000a0 <libmain>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
  8000a4: 48 83 ec 10                  	subq	$0x10, %rsp
  8000a8: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  8000ab: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	if (argc > 0) {
  8000af: 83 7d fc 00                  	cmpl	$0x0, -0x4(%rbp)
  8000b3: 0f 8e 11 00 00 00            	jle	0x8000ca <libmain+0x2a>
; 		binary_name = argv[0];
  8000b9: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8000bd: 48 8b 08                     	movq	(%rax), %rcx
  8000c0: 48 8d 05 41 2f 00 00         	leaq	0x2f41(%rip), %rax      # 0x803008 <binary_name>
  8000c7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8000ca: 8b 7d fc                     	movl	-0x4(%rbp), %edi
  8000cd: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8000d1: e8 6a ff ff ff               	callq	0x800040 <main>
; 	exit();
  8000d6: e8 15 00 00 00               	callq	0x8000f0 <exit>
; }
  8000db: 48 83 c4 10                  	addq	$0x10, %rsp
  8000df: 5d                           	popq	%rbp
  8000e0: c3                           	retq
  8000e1: cc                           	int3
  8000e2: cc                           	int3
  8000e3: cc                           	int3
  8000e4: cc                           	int3
  8000e5: cc                           	int3
  8000e6: cc                           	int3
  8000e7: cc                           	int3
  8000e8: cc                           	int3
  8000e9: cc                           	int3
  8000ea: cc                           	int3
  8000eb: cc                           	int3
  8000ec: cc                           	int3
  8000ed: cc                           	int3
  8000ee: cc                           	int3
  8000ef: cc                           	int3

00000000008000f0 <exit>:
; {
  8000f0: 55                           	pushq	%rbp
  8000f1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000f4: 31 ff                        	xorl	%edi, %edi
  8000f6: e8 55 18 00 00               	callq	0x801950 <kill>
; }
  8000fb: 5d                           	popq	%rbp
  8000fc: c3                           	retq
  8000fd: cc                           	int3
  8000fe: cc                           	int3
  8000ff: cc                           	int3

0000000000800100 <_panic>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
  800104: 48 83 ec 60                  	subq	$0x60, %rsp
  800108: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  80010c: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  800110: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  800114: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800118: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  80011b: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	va_start(ap, fmt);
  80011f: 48 8d 45 d0                  	leaq	-0x30(%rbp), %rax
  800123: 48 8d 4d a0                  	leaq	-0x60(%rbp), %rcx
  800127: 48 89 48 10                  	movq	%rcx, 0x10(%rax)
  80012b: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
  80012f: 48 89 48 08                  	movq	%rcx, 0x8(%rax)
  800133: c7 40 04 30 00 00 00         	movl	$0x30, 0x4(%rax)
  80013a: c7 00 18 00 00 00            	movl	$0x18, (%rax)
; 		getpid(), binary_name, file, line);
  800140: e8 4b 18 00 00               	callq	0x801990 <getpid>
  800145: 89 c6                        	movl	%eax, %esi
  800147: 48 8d 05 ba 2e 00 00         	leaq	0x2eba(%rip), %rax      # 0x803008 <binary_name>
  80014e: 48 8b 10                     	movq	(%rax), %rdx
  800151: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  800155: 44 8b 45 f4                  	movl	-0xc(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  800159: 48 8d 3d 51 1f 00 00         	leaq	0x1f51(%rip), %rdi      # 0x8020b1
  800160: b0 00                        	movb	$0x0, %al
  800162: e8 09 01 00 00               	callq	0x800270 <printf>
; 	vprintf(fmt, ap);
  800167: 48 8b 7d e8                  	movq	-0x18(%rbp), %rdi
  80016b: 48 8d 75 d0                  	leaq	-0x30(%rbp), %rsi
  80016f: e8 1c 00 00 00               	callq	0x800190 <vprintf>
; 	printf("\n");
  800174: 48 8d 3d 68 1f 00 00         	leaq	0x1f68(%rip), %rdi      # 0x8020e3
  80017b: b0 00                        	movb	$0x0, %al
  80017d: e8 ee 00 00 00               	callq	0x800270 <printf>
; 		asm volatile("int3");
  800182: cc                           	int3
; 	while (1) {
  800183: e9 fa ff ff ff               	jmp	0x800182 <_panic+0x82>
  800188: cc                           	int3
  800189: cc                           	int3
  80018a: cc                           	int3
  80018b: cc                           	int3
  80018c: cc                           	int3
  80018d: cc                           	int3
  80018e: cc                           	int3
  80018f: cc                           	int3

0000000000800190 <vprintf>:
; {
  800190: 55                           	pushq	%rbp
  800191: 48 89 e5                     	movq	%rsp, %rbp
  800194: 48 81 ec 20 01 00 00         	subq	$0x120, %rsp            # imm = 0x120
  80019b: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80019f: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b.idx = 0;
  8001a3: c7 85 e8 fe ff ff 00 00 00 00	movl	$0x0, -0x118(%rbp)
; 	b.cnt = 0;
  8001ad: c7 85 ec fe ff ff 00 00 00 00	movl	$0x0, -0x114(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8001b7: 48 8d b5 e8 fe ff ff         	leaq	-0x118(%rbp), %rsi
  8001be: 48 8b 55 f8                  	movq	-0x8(%rbp), %rdx
  8001c2: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  8001c6: 48 8d 3d 33 00 00 00         	leaq	0x33(%rip), %rdi        # 0x800200 <putch>
  8001cd: e8 fe 00 00 00               	callq	0x8002d0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8001d2: 48 8d bd e8 fe ff ff         	leaq	-0x118(%rbp), %rdi
  8001d9: 48 83 c7 08                  	addq	$0x8, %rdi
  8001dd: 48 63 b5 e8 fe ff ff         	movslq	-0x118(%rbp), %rsi
  8001e4: e8 57 16 00 00               	callq	0x801840 <puts>
; 	return b.cnt;
  8001e9: 8b 85 ec fe ff ff            	movl	-0x114(%rbp), %eax
  8001ef: 48 81 c4 20 01 00 00         	addq	$0x120, %rsp            # imm = 0x120
  8001f6: 5d                           	popq	%rbp
  8001f7: c3                           	retq
  8001f8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800200 <putch>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 83 ec 10                  	subq	$0x10, %rsp
  800208: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  80020b: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b->buf[b->idx++] = ch;
  80020f: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800212: 88 c2                        	movb	%al, %dl
  800214: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800218: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80021c: 8b 0e                        	movl	(%rsi), %ecx
  80021e: 89 cf                        	movl	%ecx, %edi
  800220: 83 c7 01                     	addl	$0x1, %edi
  800223: 89 3e                        	movl	%edi, (%rsi)
  800225: 48 63 c9                     	movslq	%ecx, %rcx
  800228: 88 54 08 08                  	movb	%dl, 0x8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80022c: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800230: 81 38 ff 00 00 00            	cmpl	$0xff, (%rax)
  800236: 0f 85 1e 00 00 00            	jne	0x80025a <putch+0x5a>
; 		puts(b->buf, b->idx);
  80023c: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  800240: 48 83 c7 08                  	addq	$0x8, %rdi
  800244: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800248: 48 63 30                     	movslq	(%rax), %rsi
  80024b: e8 f0 15 00 00               	callq	0x801840 <puts>
; 		b->idx = 0;
  800250: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800254: c7 00 00 00 00 00            	movl	$0x0, (%rax)
; 	b->cnt++;
  80025a: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80025e: 8b 48 04                     	movl	0x4(%rax), %ecx
  800261: 83 c1 01                     	addl	$0x1, %ecx
  800264: 89 48 04                     	movl	%ecx, 0x4(%rax)
; }
  800267: 48 83 c4 10                  	addq	$0x10, %rsp
  80026b: 5d                           	popq	%rbp
  80026c: c3                           	retq
  80026d: 0f 1f 00                     	nopl	(%rax)

0000000000800270 <printf>:
; {
  800270: 55                           	pushq	%rbp
  800271: 48 89 e5                     	movq	%rsp, %rbp
  800274: 48 83 ec 60                  	subq	$0x60, %rsp
  800278: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  80027c: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  800280: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  800284: 48 89 55 b0                  	movq	%rdx, -0x50(%rbp)
  800288: 48 89 75 a8                  	movq	%rsi, -0x58(%rbp)
  80028c: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800290: 48 8d 45 a0                  	leaq	-0x60(%rbp), %rax
; 	va_start(ap, fmt);
  800294: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  800298: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  80029c: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  8002a0: c7 45 e4 30 00 00 00         	movl	$0x30, -0x1c(%rbp)
  8002a7: c7 45 e0 08 00 00 00         	movl	$0x8, -0x20(%rbp)
; 	cnt = vprintf(fmt, ap);
  8002ae: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  8002b2: 48 8d 75 e0                  	leaq	-0x20(%rbp), %rsi
  8002b6: e8 d5 fe ff ff               	callq	0x800190 <vprintf>
  8002bb: 89 45 dc                     	movl	%eax, -0x24(%rbp)
; 	return cnt;
  8002be: 8b 45 dc                     	movl	-0x24(%rbp), %eax
  8002c1: 48 83 c4 60                  	addq	$0x60, %rsp
  8002c5: 5d                           	popq	%rbp
  8002c6: c3                           	retq
  8002c7: cc                           	int3
  8002c8: cc                           	int3
  8002c9: cc                           	int3
  8002ca: cc                           	int3
  8002cb: cc                           	int3
  8002cc: cc                           	int3
  8002cd: cc                           	int3
  8002ce: cc                           	int3
  8002cf: cc                           	int3

00000000008002d0 <vprintfmt>:
; {
  8002d0: 55                           	pushq	%rbp
  8002d1: 48 89 e5                     	movq	%rsp, %rbp
  8002d4: 48 81 ec 00 01 00 00         	subq	$0x100, %rsp            # imm = 0x100
  8002db: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8002df: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  8002e3: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  8002e7: 48 89 4d e0                  	movq	%rcx, -0x20(%rbp)
; 	va_copy(ap, tmp_ap);
  8002eb: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  8002ef: 48 8b 55 e0                  	movq	-0x20(%rbp), %rdx
  8002f3: 48 8b 4a 10                  	movq	0x10(%rdx), %rcx
  8002f7: 48 89 48 10                  	movq	%rcx, 0x10(%rax)
  8002fb: 48 8b 0a                     	movq	(%rdx), %rcx
  8002fe: 48 8b 52 08                  	movq	0x8(%rdx), %rdx
  800302: 48 89 50 08                  	movq	%rdx, 0x8(%rax)
  800306: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800309: e9 00 00 00 00               	jmp	0x80030e <vprintfmt+0x3e>
  80030e: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800312: 48 89 c1                     	movq	%rax, %rcx
  800315: 48 83 c1 01                  	addq	$0x1, %rcx
  800319: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  80031d: 0f b6 00                     	movzbl	(%rax), %eax
  800320: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
  800323: 83 f8 25                     	cmpl	$0x25, %eax
  800326: 0f 84 25 00 00 00            	je	0x800351 <vprintfmt+0x81>
; 			if (ch == '\0')
  80032c: 83 7d b4 00                  	cmpl	$0x0, -0x4c(%rbp)
  800330: 0f 85 09 00 00 00            	jne	0x80033f <vprintfmt+0x6f>
; 				return;
  800336: 48 81 c4 00 01 00 00         	addq	$0x100, %rsp            # imm = 0x100
  80033d: 5d                           	popq	%rbp
  80033e: c3                           	retq
; 			putch(ch, putdat);
  80033f: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800343: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  800346: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80034a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80034c: e9 bd ff ff ff               	jmp	0x80030e <vprintfmt+0x3e>
; 		padc = ' ';
  800351: c6 45 93 20                  	movb	$0x20, -0x6d(%rbp)
; 		width = -1;
  800355: c7 45 9c ff ff ff ff         	movl	$0xffffffff, -0x64(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  80035c: c7 45 98 ff ff ff ff         	movl	$0xffffffff, -0x68(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  800363: c7 45 a0 00 00 00 00         	movl	$0x0, -0x60(%rbp)
; 		altflag = 0;
  80036a: c7 45 94 00 00 00 00         	movl	$0x0, -0x6c(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  800371: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800375: 48 89 c1                     	movq	%rax, %rcx
  800378: 48 83 c1 01                  	addq	$0x1, %rcx
  80037c: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  800380: 0f b6 00                     	movzbl	(%rax), %eax
  800383: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
  800386: 83 c0 dd                     	addl	$-0x23, %eax
  800389: 89 c1                        	movl	%eax, %ecx
  80038b: 48 89 4d 88                  	movq	%rcx, -0x78(%rbp)
  80038f: 83 e8 55                     	subl	$0x55, %eax
  800392: 0f 87 c1 05 00 00            	ja	0x800959 <vprintfmt+0x689>
  800398: 48 8b 45 88                  	movq	-0x78(%rbp), %rax
  80039c: 48 8d 0d 99 1d 00 00         	leaq	0x1d99(%rip), %rcx      # 0x80213c
  8003a3: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  8003a7: 48 01 c8                     	addq	%rcx, %rax
  8003aa: ff e0                        	jmpq	*%rax
; 			padc = '-';
  8003ac: c6 45 93 2d                  	movb	$0x2d, -0x6d(%rbp)
; 			goto reswitch;
  8003b0: e9 bc ff ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			padc = '0';
  8003b5: c6 45 93 30                  	movb	$0x30, -0x6d(%rbp)
; 			goto reswitch;
  8003b9: e9 b3 ff ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  8003be: c7 45 98 00 00 00 00         	movl	$0x0, -0x68(%rbp)
; 				precision = precision * 10 + ch - '0';
  8003c5: 6b 45 98 0a                  	imull	$0xa, -0x68(%rbp), %eax
  8003c9: 03 45 b4                     	addl	-0x4c(%rbp), %eax
  8003cc: 83 e8 30                     	subl	$0x30, %eax
  8003cf: 89 45 98                     	movl	%eax, -0x68(%rbp)
; 				ch = *fmt;
  8003d2: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8003d6: 0f be 00                     	movsbl	(%rax), %eax
  8003d9: 89 45 b4                     	movl	%eax, -0x4c(%rbp)
; 				if (ch < '0' || ch > '9')
  8003dc: 83 7d b4 30                  	cmpl	$0x30, -0x4c(%rbp)
  8003e0: 0f 8c 0a 00 00 00            	jl	0x8003f0 <vprintfmt+0x120>
  8003e6: 83 7d b4 39                  	cmpl	$0x39, -0x4c(%rbp)
  8003ea: 0f 8e 05 00 00 00            	jle	0x8003f5 <vprintfmt+0x125>
; 					break;
  8003f0: e9 16 00 00 00               	jmp	0x80040b <vprintfmt+0x13b>
; 			}
  8003f5: e9 00 00 00 00               	jmp	0x8003fa <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  8003fa: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8003fe: 48 83 c0 01                  	addq	$0x1, %rax
  800402: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  800406: e9 ba ff ff ff               	jmp	0x8003c5 <vprintfmt+0xf5>
; 			goto process_precision;
  80040b: e9 8c 00 00 00               	jmp	0x80049c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800410: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800414: 48 89 85 78 ff ff ff         	movq	%rax, -0x88(%rbp)
  80041b: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  80041e: 89 45 84                     	movl	%eax, -0x7c(%rbp)
  800421: 83 f8 28                     	cmpl	$0x28, %eax
  800424: 0f 87 22 00 00 00            	ja	0x80044c <vprintfmt+0x17c>
  80042a: 48 8b 8d 78 ff ff ff         	movq	-0x88(%rbp), %rcx
  800431: 8b 55 84                     	movl	-0x7c(%rbp), %edx
; 			precision = va_arg(ap, int);
  800434: 48 63 c2                     	movslq	%edx, %rax
  800437: 48 03 41 10                  	addq	0x10(%rcx), %rax
  80043b: 83 c2 08                     	addl	$0x8, %edx
  80043e: 89 11                        	movl	%edx, (%rcx)
  800440: 48 89 85 70 ff ff ff         	movq	%rax, -0x90(%rbp)
  800447: e9 1d 00 00 00               	jmp	0x800469 <vprintfmt+0x199>
  80044c: 48 8b 8d 78 ff ff ff         	movq	-0x88(%rbp), %rcx
; 			precision = va_arg(ap, int);
  800453: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800457: 48 89 d0                     	movq	%rdx, %rax
  80045a: 48 83 c2 08                  	addq	$0x8, %rdx
  80045e: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800462: 48 89 85 70 ff ff ff         	movq	%rax, -0x90(%rbp)
  800469: 48 8b 85 70 ff ff ff         	movq	-0x90(%rbp), %rax
; 			precision = va_arg(ap, int);
  800470: 8b 00                        	movl	(%rax), %eax
  800472: 89 45 98                     	movl	%eax, -0x68(%rbp)
; 			goto process_precision;
  800475: e9 22 00 00 00               	jmp	0x80049c <vprintfmt+0x1cc>
; 			if (width < 0)
  80047a: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  80047e: 0f 8d 07 00 00 00            	jge	0x80048b <vprintfmt+0x1bb>
; 				width = 0;
  800484: c7 45 9c 00 00 00 00         	movl	$0x0, -0x64(%rbp)
; 			goto reswitch;
  80048b: e9 e1 fe ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			altflag = 1;
  800490: c7 45 94 01 00 00 00         	movl	$0x1, -0x6c(%rbp)
; 			goto reswitch;
  800497: e9 d5 fe ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			if (width < 0)
  80049c: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8004a0: 0f 8d 0d 00 00 00            	jge	0x8004b3 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  8004a6: 8b 45 98                     	movl	-0x68(%rbp), %eax
  8004a9: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  8004ac: c7 45 98 ff ff ff ff         	movl	$0xffffffff, -0x68(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  8004b3: e9 b9 fe ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			lflag++;
  8004b8: 8b 45 a0                     	movl	-0x60(%rbp), %eax
  8004bb: 83 c0 01                     	addl	$0x1, %eax
  8004be: 89 45 a0                     	movl	%eax, -0x60(%rbp)
; 			goto reswitch;
  8004c1: e9 ab fe ff ff               	jmp	0x800371 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  8004c6: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8004ca: 48 89 85 58 ff ff ff         	movq	%rax, -0xa8(%rbp)
  8004d1: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  8004d5: 48 89 85 60 ff ff ff         	movq	%rax, -0xa0(%rbp)
  8004dc: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  8004df: 89 85 6c ff ff ff            	movl	%eax, -0x94(%rbp)
  8004e5: 83 f8 28                     	cmpl	$0x28, %eax
  8004e8: 0f 87 25 00 00 00            	ja	0x800513 <vprintfmt+0x243>
  8004ee: 48 8b 8d 60 ff ff ff         	movq	-0xa0(%rbp), %rcx
  8004f5: 8b 95 6c ff ff ff            	movl	-0x94(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  8004fb: 48 63 c2                     	movslq	%edx, %rax
  8004fe: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800502: 83 c2 08                     	addl	$0x8, %edx
  800505: 89 11                        	movl	%edx, (%rcx)
  800507: 48 89 85 50 ff ff ff         	movq	%rax, -0xb0(%rbp)
  80050e: e9 1d 00 00 00               	jmp	0x800530 <vprintfmt+0x260>
  800513: 48 8b 8d 60 ff ff ff         	movq	-0xa0(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80051a: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  80051e: 48 89 d0                     	movq	%rdx, %rax
  800521: 48 83 c2 08                  	addq	$0x8, %rdx
  800525: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800529: 48 89 85 50 ff ff ff         	movq	%rax, -0xb0(%rbp)
  800530: 48 8b 85 58 ff ff ff         	movq	-0xa8(%rbp), %rax
  800537: 48 8b 8d 50 ff ff ff         	movq	-0xb0(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80053e: 8b 39                        	movl	(%rcx), %edi
  800540: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800544: ff d0                        	callq	*%rax
; 			break;
  800546: e9 55 04 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80054b: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  80054f: 48 89 85 40 ff ff ff         	movq	%rax, -0xc0(%rbp)
  800556: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  800559: 89 85 4c ff ff ff            	movl	%eax, -0xb4(%rbp)
  80055f: 83 f8 28                     	cmpl	$0x28, %eax
  800562: 0f 87 25 00 00 00            	ja	0x80058d <vprintfmt+0x2bd>
  800568: 48 8b 8d 40 ff ff ff         	movq	-0xc0(%rbp), %rcx
  80056f: 8b 95 4c ff ff ff            	movl	-0xb4(%rbp), %edx
; 			err = va_arg(ap, int);
  800575: 48 63 c2                     	movslq	%edx, %rax
  800578: 48 03 41 10                  	addq	0x10(%rcx), %rax
  80057c: 83 c2 08                     	addl	$0x8, %edx
  80057f: 89 11                        	movl	%edx, (%rcx)
  800581: 48 89 85 38 ff ff ff         	movq	%rax, -0xc8(%rbp)
  800588: e9 1d 00 00 00               	jmp	0x8005aa <vprintfmt+0x2da>
  80058d: 48 8b 8d 40 ff ff ff         	movq	-0xc0(%rbp), %rcx
; 			err = va_arg(ap, int);
  800594: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800598: 48 89 d0                     	movq	%rdx, %rax
  80059b: 48 83 c2 08                  	addq	$0x8, %rdx
  80059f: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8005a3: 48 89 85 38 ff ff ff         	movq	%rax, -0xc8(%rbp)
  8005aa: 48 8b 85 38 ff ff ff         	movq	-0xc8(%rbp), %rax
; 			err = va_arg(ap, int);
  8005b1: 8b 00                        	movl	(%rax), %eax
  8005b3: 89 45 b0                     	movl	%eax, -0x50(%rbp)
; 			if (err < 0)
  8005b6: 83 7d b0 00                  	cmpl	$0x0, -0x50(%rbp)
  8005ba: 0f 8d 08 00 00 00            	jge	0x8005c8 <vprintfmt+0x2f8>
; 				err = -err;
  8005c0: 31 c0                        	xorl	%eax, %eax
  8005c2: 2b 45 b0                     	subl	-0x50(%rbp), %eax
  8005c5: 89 45 b0                     	movl	%eax, -0x50(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005c8: 48 63 45 b0                  	movslq	-0x50(%rbp), %rax
  8005cc: 48 83 f8 09                  	cmpq	$0x9, %rax
  8005d0: 0f 83 1d 00 00 00            	jae	0x8005f3 <vprintfmt+0x323>
  8005d6: 48 63 4d b0                  	movslq	-0x50(%rbp), %rcx
  8005da: 48 8d 05 3f fa 9f ff         	leaq	-0x6005c1(%rip), %rax   # 0x200020 <error_string>
  8005e1: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  8005e5: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
  8005e9: 48 83 f8 00                  	cmpq	$0x0, %rax
  8005ed: 0f 85 1e 00 00 00            	jne	0x800611 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  8005f3: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  8005f7: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8005fb: 8b 4d b0                     	movl	-0x50(%rbp), %ecx
  8005fe: 48 8d 15 26 1b 00 00         	leaq	0x1b26(%rip), %rdx      # 0x80212b
  800605: b0 00                        	movb	$0x0, %al
  800607: e8 a4 03 00 00               	callq	0x8009b0 <printfmt>
  80060c: e9 1a 00 00 00               	jmp	0x80062b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800611: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800615: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800619: 48 8b 4d b8                  	movq	-0x48(%rbp), %rcx
  80061d: 48 8d 15 50 1a 00 00         	leaq	0x1a50(%rip), %rdx      # 0x802074
  800624: b0 00                        	movb	$0x0, %al
  800626: e8 85 03 00 00               	callq	0x8009b0 <printfmt>
; 			break;
  80062b: e9 70 03 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800630: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800634: 48 89 85 28 ff ff ff         	movq	%rax, -0xd8(%rbp)
  80063b: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  80063e: 89 85 34 ff ff ff            	movl	%eax, -0xcc(%rbp)
  800644: 83 f8 28                     	cmpl	$0x28, %eax
  800647: 0f 87 25 00 00 00            	ja	0x800672 <vprintfmt+0x3a2>
  80064d: 48 8b 8d 28 ff ff ff         	movq	-0xd8(%rbp), %rcx
  800654: 8b 95 34 ff ff ff            	movl	-0xcc(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  80065a: 48 63 c2                     	movslq	%edx, %rax
  80065d: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800661: 83 c2 08                     	addl	$0x8, %edx
  800664: 89 11                        	movl	%edx, (%rcx)
  800666: 48 89 85 20 ff ff ff         	movq	%rax, -0xe0(%rbp)
  80066d: e9 1d 00 00 00               	jmp	0x80068f <vprintfmt+0x3bf>
  800672: 48 8b 8d 28 ff ff ff         	movq	-0xd8(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  800679: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  80067d: 48 89 d0                     	movq	%rdx, %rax
  800680: 48 83 c2 08                  	addq	$0x8, %rdx
  800684: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800688: 48 89 85 20 ff ff ff         	movq	%rax, -0xe0(%rbp)
  80068f: 48 8b 85 20 ff ff ff         	movq	-0xe0(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800696: 48 8b 00                     	movq	(%rax), %rax
  800699: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
  80069d: 48 83 f8 00                  	cmpq	$0x0, %rax
  8006a1: 0f 85 0b 00 00 00            	jne	0x8006b2 <vprintfmt+0x3e2>
; 				p = "(null)";
  8006a7: 48 8d 05 86 1a 00 00         	leaq	0x1a86(%rip), %rax      # 0x802134
  8006ae: 48 89 45 b8                  	movq	%rax, -0x48(%rbp)
; 			if (width > 0 && padc != '-')
  8006b2: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8006b6: 0f 8e 4f 00 00 00            	jle	0x80070b <vprintfmt+0x43b>
  8006bc: 0f be 45 93                  	movsbl	-0x6d(%rbp), %eax
  8006c0: 83 f8 2d                     	cmpl	$0x2d, %eax
  8006c3: 0f 84 42 00 00 00            	je	0x80070b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8006c9: 48 8b 7d b8                  	movq	-0x48(%rbp), %rdi
  8006cd: 48 63 75 98                  	movslq	-0x68(%rbp), %rsi
  8006d1: e8 da 07 00 00               	callq	0x800eb0 <strnlen>
  8006d6: 89 c1                        	movl	%eax, %ecx
  8006d8: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  8006db: 29 c8                        	subl	%ecx, %eax
  8006dd: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  8006e0: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8006e4: 0f 8e 1c 00 00 00            	jle	0x800706 <vprintfmt+0x436>
; 					putch(padc, putdat);
  8006ea: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8006ee: 0f be 7d 93                  	movsbl	-0x6d(%rbp), %edi
  8006f2: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8006f6: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8006f8: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  8006fb: 83 c0 ff                     	addl	$-0x1, %eax
  8006fe: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  800701: e9 da ff ff ff               	jmp	0x8006e0 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800706: e9 00 00 00 00               	jmp	0x80070b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80070b: e9 00 00 00 00               	jmp	0x800710 <vprintfmt+0x440>
  800710: 48 8b 45 b8                  	movq	-0x48(%rbp), %rax
  800714: 48 89 c1                     	movq	%rax, %rcx
  800717: 48 83 c1 01                  	addq	$0x1, %rcx
  80071b: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  80071f: 0f be 08                     	movsbl	(%rax), %ecx
  800722: 89 4d b4                     	movl	%ecx, -0x4c(%rbp)
  800725: 31 c0                        	xorl	%eax, %eax
  800727: 83 f9 00                     	cmpl	$0x0, %ecx
  80072a: 88 85 1f ff ff ff            	movb	%al, -0xe1(%rbp)
  800730: 0f 84 33 00 00 00            	je	0x800769 <vprintfmt+0x499>
  800736: b0 01                        	movb	$0x1, %al
  800738: 83 7d 98 00                  	cmpl	$0x0, -0x68(%rbp)
  80073c: 88 85 1e ff ff ff            	movb	%al, -0xe2(%rbp)
  800742: 0f 8c 15 00 00 00            	jl	0x80075d <vprintfmt+0x48d>
  800748: 8b 45 98                     	movl	-0x68(%rbp), %eax
  80074b: 83 c0 ff                     	addl	$-0x1, %eax
  80074e: 89 45 98                     	movl	%eax, -0x68(%rbp)
  800751: 83 f8 00                     	cmpl	$0x0, %eax
  800754: 0f 9d c0                     	setge	%al
  800757: 88 85 1e ff ff ff            	movb	%al, -0xe2(%rbp)
  80075d: 8a 85 1e ff ff ff            	movb	-0xe2(%rbp), %al
  800763: 88 85 1f ff ff ff            	movb	%al, -0xe1(%rbp)
  800769: 8a 85 1f ff ff ff            	movb	-0xe1(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80076f: a8 01                        	testb	$0x1, %al
  800771: 0f 85 05 00 00 00            	jne	0x80077c <vprintfmt+0x4ac>
  800777: e9 52 00 00 00               	jmp	0x8007ce <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  80077c: 83 7d 94 00                  	cmpl	$0x0, -0x6c(%rbp)
  800780: 0f 84 28 00 00 00            	je	0x8007ae <vprintfmt+0x4de>
  800786: 83 7d b4 20                  	cmpl	$0x20, -0x4c(%rbp)
  80078a: 0f 8c 0a 00 00 00            	jl	0x80079a <vprintfmt+0x4ca>
  800790: 83 7d b4 7e                  	cmpl	$0x7e, -0x4c(%rbp)
  800794: 0f 8e 14 00 00 00            	jle	0x8007ae <vprintfmt+0x4de>
; 					putch('?', putdat);
  80079a: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80079e: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8007a2: bf 3f 00 00 00               	movl	$0x3f, %edi
  8007a7: ff d0                        	callq	*%rax
  8007a9: e9 0d 00 00 00               	jmp	0x8007bb <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  8007ae: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8007b2: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  8007b5: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8007b9: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  8007bb: e9 00 00 00 00               	jmp	0x8007c0 <vprintfmt+0x4f0>
; 					width--)
  8007c0: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  8007c3: 83 c0 ff                     	addl	$-0x1, %eax
  8007c6: 89 45 9c                     	movl	%eax, -0x64(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8007c9: e9 42 ff ff ff               	jmp	0x800710 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  8007ce: e9 00 00 00 00               	jmp	0x8007d3 <vprintfmt+0x503>
  8007d3: 83 7d 9c 00                  	cmpl	$0x0, -0x64(%rbp)
  8007d7: 0f 8e 1d 00 00 00            	jle	0x8007fa <vprintfmt+0x52a>
; 				putch(' ', putdat);
  8007dd: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8007e1: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8007e5: bf 20 00 00 00               	movl	$0x20, %edi
  8007ea: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  8007ec: 8b 45 9c                     	movl	-0x64(%rbp), %eax
  8007ef: 83 c0 ff                     	addl	$-0x1, %eax
  8007f2: 89 45 9c                     	movl	%eax, -0x64(%rbp)
  8007f5: e9 d9 ff ff ff               	jmp	0x8007d3 <vprintfmt+0x503>
; 			break;
  8007fa: e9 a1 01 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  8007ff: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800802: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800806: e8 05 02 00 00               	callq	0x800a10 <getint>
  80080b: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			if ((long long) num < 0) {
  80080f: 48 83 7d a8 00               	cmpq	$0x0, -0x58(%rbp)
  800814: 0f 8d 19 00 00 00            	jge	0x800833 <vprintfmt+0x563>
; 				putch('-', putdat);
  80081a: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80081e: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800822: bf 2d 00 00 00               	movl	$0x2d, %edi
  800827: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800829: 31 c0                        	xorl	%eax, %eax
  80082b: 48 2b 45 a8                  	subq	-0x58(%rbp), %rax
  80082f: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 10;
  800833: c7 45 a4 0a 00 00 00         	movl	$0xa, -0x5c(%rbp)
; 			goto number;
  80083a: e9 e6 00 00 00               	jmp	0x800925 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80083f: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800842: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800846: e8 f5 02 00 00               	callq	0x800b40 <getuint>
  80084b: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 10;
  80084f: c7 45 a4 0a 00 00 00         	movl	$0xa, -0x5c(%rbp)
; 			goto number;
  800856: e9 ca 00 00 00               	jmp	0x800925 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80085b: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  80085e: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800862: e8 d9 02 00 00               	callq	0x800b40 <getuint>
  800867: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 8;
  80086b: c7 45 a4 08 00 00 00         	movl	$0x8, -0x5c(%rbp)
; 			goto number;
  800872: e9 ae 00 00 00               	jmp	0x800925 <vprintfmt+0x655>
; 			putch('0', putdat);
  800877: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80087b: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80087f: bf 30 00 00 00               	movl	$0x30, %edi
  800884: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800886: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80088a: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80088e: bf 78 00 00 00               	movl	$0x78, %edi
  800893: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800895: 48 8d 45 c0                  	leaq	-0x40(%rbp), %rax
  800899: 48 89 85 10 ff ff ff         	movq	%rax, -0xf0(%rbp)
  8008a0: 8b 45 c0                     	movl	-0x40(%rbp), %eax
  8008a3: 89 85 18 ff ff ff            	movl	%eax, -0xe8(%rbp)
  8008a9: 83 f8 28                     	cmpl	$0x28, %eax
  8008ac: 0f 87 25 00 00 00            	ja	0x8008d7 <vprintfmt+0x607>
  8008b2: 48 8b 8d 10 ff ff ff         	movq	-0xf0(%rbp), %rcx
  8008b9: 8b 95 18 ff ff ff            	movl	-0xe8(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  8008bf: 48 63 c2                     	movslq	%edx, %rax
  8008c2: 48 03 41 10                  	addq	0x10(%rcx), %rax
  8008c6: 83 c2 08                     	addl	$0x8, %edx
  8008c9: 89 11                        	movl	%edx, (%rcx)
  8008cb: 48 89 85 08 ff ff ff         	movq	%rax, -0xf8(%rbp)
  8008d2: e9 1d 00 00 00               	jmp	0x8008f4 <vprintfmt+0x624>
  8008d7: 48 8b 8d 10 ff ff ff         	movq	-0xf0(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  8008de: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  8008e2: 48 89 d0                     	movq	%rdx, %rax
  8008e5: 48 83 c2 08                  	addq	$0x8, %rdx
  8008e9: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  8008ed: 48 89 85 08 ff ff ff         	movq	%rax, -0xf8(%rbp)
  8008f4: 48 8b 85 08 ff ff ff         	movq	-0xf8(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  8008fb: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  8008fe: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 16;
  800902: c7 45 a4 10 00 00 00         	movl	$0x10, -0x5c(%rbp)
; 			goto number;
  800909: e9 17 00 00 00               	jmp	0x800925 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80090e: 8b 75 a0                     	movl	-0x60(%rbp), %esi
  800911: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
  800915: e8 26 02 00 00               	callq	0x800b40 <getuint>
  80091a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
; 			base = 16;
  80091e: c7 45 a4 10 00 00 00         	movl	$0x10, -0x5c(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800925: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800929: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  80092d: 48 8b 55 a8                  	movq	-0x58(%rbp), %rdx
  800931: 8b 4d a4                     	movl	-0x5c(%rbp), %ecx
  800934: 44 8b 45 9c                  	movl	-0x64(%rbp), %r8d
  800938: 44 0f be 4d 93               	movsbl	-0x6d(%rbp), %r9d
  80093d: e8 2e 03 00 00               	callq	0x800c70 <printnum>
; 			break;
  800942: e9 59 00 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800947: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80094b: 8b 7d b4                     	movl	-0x4c(%rbp), %edi
  80094e: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800952: ff d0                        	callq	*%rax
; 			break;
  800954: e9 47 00 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800959: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80095d: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800961: bf 25 00 00 00               	movl	$0x25, %edi
  800966: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800968: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  80096c: 48 83 c0 ff                  	addq	$-0x1, %rax
  800970: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  800974: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800978: 0f be 40 ff                  	movsbl	-0x1(%rax), %eax
  80097c: 83 f8 25                     	cmpl	$0x25, %eax
  80097f: 0f 84 16 00 00 00            	je	0x80099b <vprintfmt+0x6cb>
  800985: e9 00 00 00 00               	jmp	0x80098a <vprintfmt+0x6ba>
  80098a: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  80098e: 48 83 c0 ff                  	addq	$-0x1, %rax
  800992: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
  800996: e9 d9 ff ff ff               	jmp	0x800974 <vprintfmt+0x6a4>
; 			break;
  80099b: e9 00 00 00 00               	jmp	0x8009a0 <vprintfmt+0x6d0>
; 	while (1) {
  8009a0: e9 64 f9 ff ff               	jmp	0x800309 <vprintfmt+0x39>
  8009a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8009af: 90                           	nop

00000000008009b0 <printfmt>:
; {
  8009b0: 55                           	pushq	%rbp
  8009b1: 48 89 e5                     	movq	%rsp, %rbp
  8009b4: 48 83 ec 60                  	subq	$0x60, %rsp
  8009b8: 4c 89 4d c8                  	movq	%r9, -0x38(%rbp)
  8009bc: 4c 89 45 c0                  	movq	%r8, -0x40(%rbp)
  8009c0: 48 89 4d b8                  	movq	%rcx, -0x48(%rbp)
  8009c4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8009c8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  8009cc: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  8009d0: 48 8d 45 a0                  	leaq	-0x60(%rbp), %rax
; 	va_start(ap, fmt);
  8009d4: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  8009d8: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  8009dc: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  8009e0: c7 45 d4 30 00 00 00         	movl	$0x30, -0x2c(%rbp)
  8009e7: c7 45 d0 18 00 00 00         	movl	$0x18, -0x30(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  8009ee: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  8009f2: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8009f6: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  8009fa: 48 8d 4d d0                  	leaq	-0x30(%rbp), %rcx
  8009fe: e8 cd f8 ff ff               	callq	0x8002d0 <vprintfmt>
; }
  800a03: 48 83 c4 60                  	addq	$0x60, %rsp
  800a07: 5d                           	popq	%rbp
  800a08: c3                           	retq
  800a09: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800a10 <getint>:
; {
  800a10: 55                           	pushq	%rbp
  800a11: 48 89 e5                     	movq	%rsp, %rbp
  800a14: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800a18: 89 75 ec                     	movl	%esi, -0x14(%rbp)
; 	if (lflag >= 2)
  800a1b: 83 7d ec 02                  	cmpl	$0x2, -0x14(%rbp)
  800a1f: 0f 8c 59 00 00 00            	jl	0x800a7e <getint+0x6e>
; 		return va_arg(*ap, long long);
  800a25: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800a29: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800a2d: 8b 00                        	movl	(%rax), %eax
  800a2f: 89 45 e8                     	movl	%eax, -0x18(%rbp)
  800a32: 83 f8 28                     	cmpl	$0x28, %eax
  800a35: 0f 87 1c 00 00 00            	ja	0x800a57 <getint+0x47>
  800a3b: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  800a3f: 8b 55 e8                     	movl	-0x18(%rbp), %edx
; 		return va_arg(*ap, long long);
  800a42: 48 63 c2                     	movslq	%edx, %rax
  800a45: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800a49: 83 c2 08                     	addl	$0x8, %edx
  800a4c: 89 11                        	movl	%edx, (%rcx)
  800a4e: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800a52: e9 17 00 00 00               	jmp	0x800a6e <getint+0x5e>
  800a57: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800a5b: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800a5f: 48 89 d0                     	movq	%rdx, %rax
  800a62: 48 83 c2 08                  	addq	$0x8, %rdx
  800a66: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800a6a: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800a6e: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
; 		return va_arg(*ap, long long);
  800a72: 48 8b 00                     	movq	(%rax), %rax
  800a75: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800a79: e9 b7 00 00 00               	jmp	0x800b35 <getint+0x125>
; 	else if (lflag)
  800a7e: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  800a82: 0f 84 59 00 00 00            	je	0x800ae1 <getint+0xd1>
; 		return va_arg(*ap, long);
  800a88: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800a8c: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  800a90: 8b 00                        	movl	(%rax), %eax
  800a92: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
  800a95: 83 f8 28                     	cmpl	$0x28, %eax
  800a98: 0f 87 1c 00 00 00            	ja	0x800aba <getint+0xaa>
  800a9e: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
  800aa2: 8b 55 d4                     	movl	-0x2c(%rbp), %edx
; 		return va_arg(*ap, long);
  800aa5: 48 63 c2                     	movslq	%edx, %rax
  800aa8: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800aac: 83 c2 08                     	addl	$0x8, %edx
  800aaf: 89 11                        	movl	%edx, (%rcx)
  800ab1: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800ab5: e9 17 00 00 00               	jmp	0x800ad1 <getint+0xc1>
  800aba: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
; 		return va_arg(*ap, long);
  800abe: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800ac2: 48 89 d0                     	movq	%rdx, %rax
  800ac5: 48 83 c2 08                  	addq	$0x8, %rdx
  800ac9: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800acd: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800ad1: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
; 		return va_arg(*ap, long);
  800ad5: 48 8b 00                     	movq	(%rax), %rax
  800ad8: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800adc: e9 54 00 00 00               	jmp	0x800b35 <getint+0x125>
; 		return va_arg(*ap, int);
  800ae1: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800ae5: 48 89 45 b0                  	movq	%rax, -0x50(%rbp)
  800ae9: 8b 00                        	movl	(%rax), %eax
  800aeb: 89 45 bc                     	movl	%eax, -0x44(%rbp)
  800aee: 83 f8 28                     	cmpl	$0x28, %eax
  800af1: 0f 87 1c 00 00 00            	ja	0x800b13 <getint+0x103>
  800af7: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
  800afb: 8b 55 bc                     	movl	-0x44(%rbp), %edx
; 		return va_arg(*ap, int);
  800afe: 48 63 c2                     	movslq	%edx, %rax
  800b01: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800b05: 83 c2 08                     	addl	$0x8, %edx
  800b08: 89 11                        	movl	%edx, (%rcx)
  800b0a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800b0e: e9 17 00 00 00               	jmp	0x800b2a <getint+0x11a>
  800b13: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
; 		return va_arg(*ap, int);
  800b17: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800b1b: 48 89 d0                     	movq	%rdx, %rax
  800b1e: 48 83 c2 08                  	addq	$0x8, %rdx
  800b22: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800b26: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800b2a: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
; 		return va_arg(*ap, int);
  800b2e: 48 63 00                     	movslq	(%rax), %rax
  800b31: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  800b35: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800b39: 5d                           	popq	%rbp
  800b3a: c3                           	retq
  800b3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800b40 <getuint>:
; {
  800b40: 55                           	pushq	%rbp
  800b41: 48 89 e5                     	movq	%rsp, %rbp
  800b44: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800b48: 89 75 ec                     	movl	%esi, -0x14(%rbp)
; 	if (lflag >= 2)
  800b4b: 83 7d ec 02                  	cmpl	$0x2, -0x14(%rbp)
  800b4f: 0f 8c 59 00 00 00            	jl	0x800bae <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800b55: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800b59: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800b5d: 8b 00                        	movl	(%rax), %eax
  800b5f: 89 45 e8                     	movl	%eax, -0x18(%rbp)
  800b62: 83 f8 28                     	cmpl	$0x28, %eax
  800b65: 0f 87 1c 00 00 00            	ja	0x800b87 <getuint+0x47>
  800b6b: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  800b6f: 8b 55 e8                     	movl	-0x18(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800b72: 48 63 c2                     	movslq	%edx, %rax
  800b75: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800b79: 83 c2 08                     	addl	$0x8, %edx
  800b7c: 89 11                        	movl	%edx, (%rcx)
  800b7e: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800b82: e9 17 00 00 00               	jmp	0x800b9e <getuint+0x5e>
  800b87: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800b8b: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800b8f: 48 89 d0                     	movq	%rdx, %rax
  800b92: 48 83 c2 08                  	addq	$0x8, %rdx
  800b96: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800b9a: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800b9e: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800ba2: 48 8b 00                     	movq	(%rax), %rax
  800ba5: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800ba9: e9 b6 00 00 00               	jmp	0x800c64 <getuint+0x124>
; 	else if (lflag)
  800bae: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  800bb2: 0f 84 59 00 00 00            	je	0x800c11 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800bb8: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800bbc: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  800bc0: 8b 00                        	movl	(%rax), %eax
  800bc2: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
  800bc5: 83 f8 28                     	cmpl	$0x28, %eax
  800bc8: 0f 87 1c 00 00 00            	ja	0x800bea <getuint+0xaa>
  800bce: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
  800bd2: 8b 55 d4                     	movl	-0x2c(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800bd5: 48 63 c2                     	movslq	%edx, %rax
  800bd8: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800bdc: 83 c2 08                     	addl	$0x8, %edx
  800bdf: 89 11                        	movl	%edx, (%rcx)
  800be1: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800be5: e9 17 00 00 00               	jmp	0x800c01 <getuint+0xc1>
  800bea: 48 8b 4d c8                  	movq	-0x38(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800bee: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800bf2: 48 89 d0                     	movq	%rdx, %rax
  800bf5: 48 83 c2 08                  	addq	$0x8, %rdx
  800bf9: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800bfd: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800c01: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800c05: 48 8b 00                     	movq	(%rax), %rax
  800c08: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800c0c: e9 53 00 00 00               	jmp	0x800c64 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800c11: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800c15: 48 89 45 b0                  	movq	%rax, -0x50(%rbp)
  800c19: 8b 00                        	movl	(%rax), %eax
  800c1b: 89 45 bc                     	movl	%eax, -0x44(%rbp)
  800c1e: 83 f8 28                     	cmpl	$0x28, %eax
  800c21: 0f 87 1c 00 00 00            	ja	0x800c43 <getuint+0x103>
  800c27: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
  800c2b: 8b 55 bc                     	movl	-0x44(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800c2e: 48 63 c2                     	movslq	%edx, %rax
  800c31: 48 03 41 10                  	addq	0x10(%rcx), %rax
  800c35: 83 c2 08                     	addl	$0x8, %edx
  800c38: 89 11                        	movl	%edx, (%rcx)
  800c3a: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800c3e: e9 17 00 00 00               	jmp	0x800c5a <getuint+0x11a>
  800c43: 48 8b 4d b0                  	movq	-0x50(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800c47: 48 8b 51 08                  	movq	0x8(%rcx), %rdx
  800c4b: 48 89 d0                     	movq	%rdx, %rax
  800c4e: 48 83 c2 08                  	addq	$0x8, %rdx
  800c52: 48 89 51 08                  	movq	%rdx, 0x8(%rcx)
  800c56: 48 89 45 a8                  	movq	%rax, -0x58(%rbp)
  800c5a: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800c5e: 8b 00                        	movl	(%rax), %eax
  800c60: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  800c64: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800c68: 5d                           	popq	%rbp
  800c69: c3                           	retq
  800c6a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800c70 <printnum>:
; {
  800c70: 55                           	pushq	%rbp
  800c71: 48 89 e5                     	movq	%rsp, %rbp
  800c74: 48 83 ec 30                  	subq	$0x30, %rsp
  800c78: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800c7c: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800c80: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800c84: 89 4d e4                     	movl	%ecx, -0x1c(%rbp)
  800c87: 44 89 45 e0                  	movl	%r8d, -0x20(%rbp)
  800c8b: 44 89 4d dc                  	movl	%r9d, -0x24(%rbp)
; 	if (num >= base) {
  800c8f: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800c93: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800c96: 48 39 c8                     	cmpq	%rcx, %rax
  800c99: 0f 82 30 00 00 00            	jb	0x800ccf <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800c9f: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800ca3: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800ca7: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800cab: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800cae: 31 d2                        	xorl	%edx, %edx
  800cb0: 48 f7 f1                     	divq	%rcx
  800cb3: 48 89 c2                     	movq	%rax, %rdx
  800cb6: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800cb9: 44 8b 45 e0                  	movl	-0x20(%rbp), %r8d
  800cbd: 41 83 e8 01                  	subl	$0x1, %r8d
  800cc1: 44 8b 4d dc                  	movl	-0x24(%rbp), %r9d
  800cc5: e8 a6 ff ff ff               	callq	0x800c70 <printnum>
; 	} else {
  800cca: e9 2e 00 00 00               	jmp	0x800cfd <printnum+0x8d>
; 		while (--width > 0)
  800ccf: e9 00 00 00 00               	jmp	0x800cd4 <printnum+0x64>
  800cd4: 8b 45 e0                     	movl	-0x20(%rbp), %eax
  800cd7: 83 c0 ff                     	addl	$-0x1, %eax
  800cda: 89 45 e0                     	movl	%eax, -0x20(%rbp)
  800cdd: 83 f8 00                     	cmpl	$0x0, %eax
  800ce0: 0f 8e 12 00 00 00            	jle	0x800cf8 <printnum+0x88>
; 			putch(padc, putdat);
  800ce6: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800cea: 8b 7d dc                     	movl	-0x24(%rbp), %edi
  800ced: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800cf1: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800cf3: e9 dc ff ff ff               	jmp	0x800cd4 <printnum+0x64>
  800cf8: e9 00 00 00 00               	jmp	0x800cfd <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800cfd: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800d01: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  800d05: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800d09: 8b 4d e4                     	movl	-0x1c(%rbp), %ecx
  800d0c: 31 d2                        	xorl	%edx, %edx
  800d0e: 48 f7 f1                     	divq	%rcx
  800d11: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  800d15: 48 8d 0d e1 13 00 00         	leaq	0x13e1(%rip), %rcx      # 0x8020fd
  800d1c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800d20: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800d24: ff d0                        	callq	*%rax
; }
  800d26: 48 83 c4 30                  	addq	$0x30, %rsp
  800d2a: 5d                           	popq	%rbp
  800d2b: c3                           	retq
  800d2c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800d30 <vsnprintf>:
; {
  800d30: 55                           	pushq	%rbp
  800d31: 48 89 e5                     	movq	%rsp, %rbp
  800d34: 48 83 ec 40                  	subq	$0x40, %rsp
  800d38: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  800d3c: 89 75 ec                     	movl	%esi, -0x14(%rbp)
  800d3f: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
  800d43: 48 89 4d d8                  	movq	%rcx, -0x28(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800d47: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800d4b: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
  800d4f: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800d53: 48 63 4d ec                  	movslq	-0x14(%rbp), %rcx
  800d57: 48 01 c8                     	addq	%rcx, %rax
  800d5a: 48 83 c0 ff                  	addq	$-0x1, %rax
  800d5e: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
  800d62: c7 45 d0 00 00 00 00         	movl	$0x0, -0x30(%rbp)
; 	if (buf == NULL || n < 1)
  800d69: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  800d6e: 0f 84 0a 00 00 00            	je	0x800d7e <vsnprintf+0x4e>
  800d74: 83 7d ec 01                  	cmpl	$0x1, -0x14(%rbp)
  800d78: 0f 8d 0c 00 00 00            	jge	0x800d8a <vsnprintf+0x5a>
; 		return -EINVAL;
  800d7e: c7 45 fc fb ff ff ff         	movl	$0xfffffffb, -0x4(%rbp) # imm = 0xFFFFFFFB
  800d85: e9 25 00 00 00               	jmp	0x800daf <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800d8a: 48 8d 75 c0                  	leaq	-0x40(%rbp), %rsi
  800d8e: 48 8b 55 e0                  	movq	-0x20(%rbp), %rdx
  800d92: 48 8b 4d d8                  	movq	-0x28(%rbp), %rcx
  800d96: 48 8d 3d 23 00 00 00         	leaq	0x23(%rip), %rdi        # 0x800dc0 <sprintputch>
  800d9d: e8 2e f5 ff ff               	callq	0x8002d0 <vprintfmt>
; 	*b.buf = '\0';
  800da2: 48 8b 45 c0                  	movq	-0x40(%rbp), %rax
  800da6: c6 00 00                     	movb	$0x0, (%rax)
; 	return b.cnt;
  800da9: 8b 45 d0                     	movl	-0x30(%rbp), %eax
  800dac: 89 45 fc                     	movl	%eax, -0x4(%rbp)
; }
  800daf: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800db2: 48 83 c4 40                  	addq	$0x40, %rsp
  800db6: 5d                           	popq	%rbp
  800db7: c3                           	retq
  800db8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800dc0 <sprintputch>:
; {
  800dc0: 55                           	pushq	%rbp
  800dc1: 48 89 e5                     	movq	%rsp, %rbp
  800dc4: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  800dc7: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	b->cnt++;
  800dcb: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800dcf: 8b 48 10                     	movl	0x10(%rax), %ecx
  800dd2: 83 c1 01                     	addl	$0x1, %ecx
  800dd5: 89 48 10                     	movl	%ecx, 0x10(%rax)
; 	if (b->buf < b->ebuf)
  800dd8: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800ddc: 48 8b 00                     	movq	(%rax), %rax
  800ddf: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  800de3: 48 3b 41 08                  	cmpq	0x8(%rcx), %rax
  800de7: 0f 83 18 00 00 00            	jae	0x800e05 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800ded: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  800df0: 88 c1                        	movb	%al, %cl
  800df2: 48 8b 55 f0                  	movq	-0x10(%rbp), %rdx
  800df6: 48 8b 02                     	movq	(%rdx), %rax
  800df9: 48 89 c6                     	movq	%rax, %rsi
  800dfc: 48 83 c6 01                  	addq	$0x1, %rsi
  800e00: 48 89 32                     	movq	%rsi, (%rdx)
  800e03: 88 08                        	movb	%cl, (%rax)
; }
  800e05: 5d                           	popq	%rbp
  800e06: c3                           	retq
  800e07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800e10 <snprintf>:
; {
  800e10: 55                           	pushq	%rbp
  800e11: 48 89 e5                     	movq	%rsp, %rbp
  800e14: 48 83 ec 70                  	subq	$0x70, %rsp
  800e18: 4c 89 4d b8                  	movq	%r9, -0x48(%rbp)
  800e1c: 4c 89 45 b0                  	movq	%r8, -0x50(%rbp)
  800e20: 48 89 4d a8                  	movq	%rcx, -0x58(%rbp)
  800e24: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800e28: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  800e2b: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
  800e2f: 48 8d 45 90                  	leaq	-0x70(%rbp), %rax
; 	va_start(ap, fmt);
  800e33: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  800e37: 48 8d 45 10                  	leaq	0x10(%rbp), %rax
  800e3b: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  800e3f: c7 45 d4 30 00 00 00         	movl	$0x30, -0x2c(%rbp)
  800e46: c7 45 d0 18 00 00 00         	movl	$0x18, -0x30(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800e4d: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800e51: 8b 75 f4                     	movl	-0xc(%rbp), %esi
  800e54: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  800e58: 48 8d 4d d0                  	leaq	-0x30(%rbp), %rcx
  800e5c: e8 cf fe ff ff               	callq	0x800d30 <vsnprintf>
  800e61: 89 45 cc                     	movl	%eax, -0x34(%rbp)
; 	return rc;
  800e64: 8b 45 cc                     	movl	-0x34(%rbp), %eax
  800e67: 48 83 c4 70                  	addq	$0x70, %rsp
  800e6b: 5d                           	popq	%rbp
  800e6c: c3                           	retq
  800e6d: cc                           	int3
  800e6e: cc                           	int3
  800e6f: cc                           	int3

0000000000800e70 <strlen>:
; {
  800e70: 55                           	pushq	%rbp
  800e71: 48 89 e5                     	movq	%rsp, %rbp
  800e74: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800e78: c7 45 f4 00 00 00 00         	movl	$0x0, -0xc(%rbp)
  800e7f: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800e83: 0f be 00                     	movsbl	(%rax), %eax
  800e86: 83 f8 00                     	cmpl	$0x0, %eax
  800e89: 0f 84 1a 00 00 00            	je	0x800ea9 <strlen+0x39>
; 		n++;
  800e8f: 8b 45 f4                     	movl	-0xc(%rbp), %eax
  800e92: 83 c0 01                     	addl	$0x1, %eax
  800e95: 89 45 f4                     	movl	%eax, -0xc(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800e98: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800e9c: 48 83 c0 01                  	addq	$0x1, %rax
  800ea0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800ea4: e9 d6 ff ff ff               	jmp	0x800e7f <strlen+0xf>
; 	return n;
  800ea9: 8b 45 f4                     	movl	-0xc(%rbp), %eax
  800eac: 5d                           	popq	%rbp
  800ead: c3                           	retq
  800eae: 66 90                        	nop

0000000000800eb0 <strnlen>:
; {
  800eb0: 55                           	pushq	%rbp
  800eb1: 48 89 e5                     	movq	%rsp, %rbp
  800eb4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800eb8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800ebc: c7 45 ec 00 00 00 00         	movl	$0x0, -0x14(%rbp)
  800ec3: 31 c0                        	xorl	%eax, %eax
  800ec5: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  800eca: 88 45 eb                     	movb	%al, -0x15(%rbp)
  800ecd: 0f 86 10 00 00 00            	jbe	0x800ee3 <strnlen+0x33>
  800ed3: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800ed7: 0f be 00                     	movsbl	(%rax), %eax
  800eda: 83 f8 00                     	cmpl	$0x0, %eax
  800edd: 0f 95 c0                     	setne	%al
  800ee0: 88 45 eb                     	movb	%al, -0x15(%rbp)
  800ee3: 8a 45 eb                     	movb	-0x15(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800ee6: a8 01                        	testb	$0x1, %al
  800ee8: 0f 85 05 00 00 00            	jne	0x800ef3 <strnlen+0x43>
  800eee: e9 26 00 00 00               	jmp	0x800f19 <strnlen+0x69>
; 		n++;
  800ef3: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  800ef6: 83 c0 01                     	addl	$0x1, %eax
  800ef9: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800efc: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800f00: 48 83 c0 01                  	addq	$0x1, %rax
  800f04: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  800f08: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800f0c: 48 83 c0 ff                  	addq	$-0x1, %rax
  800f10: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  800f14: e9 aa ff ff ff               	jmp	0x800ec3 <strnlen+0x13>
; 	return n;
  800f19: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  800f1c: 5d                           	popq	%rbp
  800f1d: c3                           	retq
  800f1e: 66 90                        	nop

0000000000800f20 <strcpy>:
; {
  800f20: 55                           	pushq	%rbp
  800f21: 48 89 e5                     	movq	%rsp, %rbp
  800f24: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800f28: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	ret = dst;
  800f2c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800f30: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  800f34: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800f38: 48 89 c1                     	movq	%rax, %rcx
  800f3b: 48 83 c1 01                  	addq	$0x1, %rcx
  800f3f: 48 89 4d f0                  	movq	%rcx, -0x10(%rbp)
  800f43: 8a 00                        	movb	(%rax), %al
  800f45: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  800f49: 48 89 ca                     	movq	%rcx, %rdx
  800f4c: 48 83 c2 01                  	addq	$0x1, %rdx
  800f50: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  800f54: 88 01                        	movb	%al, (%rcx)
  800f56: 0f be c0                     	movsbl	%al, %eax
  800f59: 83 f8 00                     	cmpl	$0x0, %eax
  800f5c: 0f 84 05 00 00 00            	je	0x800f67 <strcpy+0x47>
  800f62: e9 cd ff ff ff               	jmp	0x800f34 <strcpy+0x14>
; 	return ret;
  800f67: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  800f6b: 5d                           	popq	%rbp
  800f6c: c3                           	retq
  800f6d: 0f 1f 00                     	nopl	(%rax)

0000000000800f70 <strcat>:
; {
  800f70: 55                           	pushq	%rbp
  800f71: 48 89 e5                     	movq	%rsp, %rbp
  800f74: 48 83 ec 20                  	subq	$0x20, %rsp
  800f78: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800f7c: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	int len = strlen(dst);
  800f80: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800f84: e8 e7 fe ff ff               	callq	0x800e70 <strlen>
  800f89: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 	strcpy(dst + len, src);
  800f8c: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  800f90: 48 63 45 ec                  	movslq	-0x14(%rbp), %rax
  800f94: 48 01 c7                     	addq	%rax, %rdi
  800f97: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  800f9b: e8 80 ff ff ff               	callq	0x800f20 <strcpy>
; 	return dst;
  800fa0: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800fa4: 48 83 c4 20                  	addq	$0x20, %rsp
  800fa8: 5d                           	popq	%rbp
  800fa9: c3                           	retq
  800faa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800fb0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800fb0: 55                           	pushq	%rbp
  800fb1: 48 89 e5                     	movq	%rsp, %rbp
  800fb4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  800fb8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  800fbc: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	ret = dst;
  800fc0: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800fc4: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	for (i = 0; i < size; i++) {
  800fc8: 48 c7 45 e0 00 00 00 00      	movq	$0x0, -0x20(%rbp)
  800fd0: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  800fd4: 48 3b 45 e8                  	cmpq	-0x18(%rbp), %rax
  800fd8: 0f 83 49 00 00 00            	jae	0x801027 <strncpy+0x77>
; 		*dst++ = *src;
  800fde: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800fe2: 8a 08                        	movb	(%rax), %cl
  800fe4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  800fe8: 48 89 c2                     	movq	%rax, %rdx
  800feb: 48 83 c2 01                  	addq	$0x1, %rdx
  800fef: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  800ff3: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  800ff5: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  800ff9: 0f be 00                     	movsbl	(%rax), %eax
  800ffc: 83 f8 00                     	cmpl	$0x0, %eax
  800fff: 0f 84 0c 00 00 00            	je	0x801011 <strncpy+0x61>
; 			src++;
  801005: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801009: 48 83 c0 01                  	addq	$0x1, %rax
  80100d: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
; 	}
  801011: e9 00 00 00 00               	jmp	0x801016 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801016: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  80101a: 48 83 c0 01                  	addq	$0x1, %rax
  80101e: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  801022: e9 a9 ff ff ff               	jmp	0x800fd0 <strncpy+0x20>
; 	return ret;
  801027: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80102b: 5d                           	popq	%rbp
  80102c: c3                           	retq
  80102d: 0f 1f 00                     	nopl	(%rax)

0000000000801030 <strlcpy>:
; {
  801030: 55                           	pushq	%rbp
  801031: 48 89 e5                     	movq	%rsp, %rbp
  801034: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801038: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  80103c: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	dst_in = dst;
  801040: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801044: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	if (size > 0) {
  801048: 48 83 7d e8 00               	cmpq	$0x0, -0x18(%rbp)
  80104d: 0f 86 6e 00 00 00            	jbe	0x8010c1 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  801053: e9 00 00 00 00               	jmp	0x801058 <strlcpy+0x28>
  801058: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  80105c: 48 83 c1 ff                  	addq	$-0x1, %rcx
  801060: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  801064: 31 c0                        	xorl	%eax, %eax
  801066: 48 83 f9 00                  	cmpq	$0x0, %rcx
  80106a: 88 45 df                     	movb	%al, -0x21(%rbp)
  80106d: 0f 86 10 00 00 00            	jbe	0x801083 <strlcpy+0x53>
  801073: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801077: 0f be 00                     	movsbl	(%rax), %eax
  80107a: 83 f8 00                     	cmpl	$0x0, %eax
  80107d: 0f 95 c0                     	setne	%al
  801080: 88 45 df                     	movb	%al, -0x21(%rbp)
  801083: 8a 45 df                     	movb	-0x21(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801086: a8 01                        	testb	$0x1, %al
  801088: 0f 85 05 00 00 00            	jne	0x801093 <strlcpy+0x63>
  80108e: e9 27 00 00 00               	jmp	0x8010ba <strlcpy+0x8a>
; 			*dst++ = *src++;
  801093: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801097: 48 89 c1                     	movq	%rax, %rcx
  80109a: 48 83 c1 01                  	addq	$0x1, %rcx
  80109e: 48 89 4d f0                  	movq	%rcx, -0x10(%rbp)
  8010a2: 8a 08                        	movb	(%rax), %cl
  8010a4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8010a8: 48 89 c2                     	movq	%rax, %rdx
  8010ab: 48 83 c2 01                  	addq	$0x1, %rdx
  8010af: 48 89 55 f8                  	movq	%rdx, -0x8(%rbp)
  8010b3: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  8010b5: e9 9e ff ff ff               	jmp	0x801058 <strlcpy+0x28>
; 		*dst = '\0';
  8010ba: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8010be: c6 00 00                     	movb	$0x0, (%rax)
; 	return dst - dst_in;
  8010c1: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8010c5: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  8010c9: 48 29 c8                     	subq	%rcx, %rax
  8010cc: 5d                           	popq	%rbp
  8010cd: c3                           	retq
  8010ce: 66 90                        	nop

00000000008010d0 <strcmp>:
; {
  8010d0: 55                           	pushq	%rbp
  8010d1: 48 89 e5                     	movq	%rsp, %rbp
  8010d4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8010d8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	while (*p && *p == *q)
  8010dc: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8010e0: 0f be 08                     	movsbl	(%rax), %ecx
  8010e3: 31 c0                        	xorl	%eax, %eax
  8010e5: 83 f9 00                     	cmpl	$0x0, %ecx
  8010e8: 88 45 ef                     	movb	%al, -0x11(%rbp)
  8010eb: 0f 84 16 00 00 00            	je	0x801107 <strcmp+0x37>
  8010f1: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8010f5: 0f be 00                     	movsbl	(%rax), %eax
  8010f8: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  8010fc: 0f be 09                     	movsbl	(%rcx), %ecx
  8010ff: 39 c8                        	cmpl	%ecx, %eax
  801101: 0f 94 c0                     	sete	%al
  801104: 88 45 ef                     	movb	%al, -0x11(%rbp)
  801107: 8a 45 ef                     	movb	-0x11(%rbp), %al
; 	while (*p && *p == *q)
  80110a: a8 01                        	testb	$0x1, %al
  80110c: 0f 85 05 00 00 00            	jne	0x801117 <strcmp+0x47>
  801112: e9 1d 00 00 00               	jmp	0x801134 <strcmp+0x64>
; 		p++, q++;
  801117: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80111b: 48 83 c0 01                  	addq	$0x1, %rax
  80111f: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801123: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801127: 48 83 c0 01                  	addq	$0x1, %rax
  80112b: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
; 	while (*p && *p == *q)
  80112f: e9 a8 ff ff ff               	jmp	0x8010dc <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801134: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801138: 0f b6 00                     	movzbl	(%rax), %eax
  80113b: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  80113f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801142: 29 c8                        	subl	%ecx, %eax
  801144: 5d                           	popq	%rbp
  801145: c3                           	retq
  801146: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000801150 <strncmp>:
; {
  801150: 55                           	pushq	%rbp
  801151: 48 89 e5                     	movq	%rsp, %rbp
  801154: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  801158: 48 89 75 e8                  	movq	%rsi, -0x18(%rbp)
  80115c: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	while (n > 0 && *p && *p == *q)
  801160: 31 c0                        	xorl	%eax, %eax
  801162: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  801167: 88 45 df                     	movb	%al, -0x21(%rbp)
  80116a: 0f 86 2b 00 00 00            	jbe	0x80119b <strncmp+0x4b>
  801170: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801174: 0f be 08                     	movsbl	(%rax), %ecx
  801177: 31 c0                        	xorl	%eax, %eax
  801179: 83 f9 00                     	cmpl	$0x0, %ecx
  80117c: 88 45 df                     	movb	%al, -0x21(%rbp)
  80117f: 0f 84 16 00 00 00            	je	0x80119b <strncmp+0x4b>
  801185: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801189: 0f be 00                     	movsbl	(%rax), %eax
  80118c: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  801190: 0f be 09                     	movsbl	(%rcx), %ecx
  801193: 39 c8                        	cmpl	%ecx, %eax
  801195: 0f 94 c0                     	sete	%al
  801198: 88 45 df                     	movb	%al, -0x21(%rbp)
  80119b: 8a 45 df                     	movb	-0x21(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80119e: a8 01                        	testb	$0x1, %al
  8011a0: 0f 85 05 00 00 00            	jne	0x8011ab <strncmp+0x5b>
  8011a6: e9 29 00 00 00               	jmp	0x8011d4 <strncmp+0x84>
; 		n--, p++, q++;
  8011ab: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8011af: 48 83 c0 ff                  	addq	$-0x1, %rax
  8011b3: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
  8011b7: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8011bb: 48 83 c0 01                  	addq	$0x1, %rax
  8011bf: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  8011c3: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8011c7: 48 83 c0 01                  	addq	$0x1, %rax
  8011cb: 48 89 45 e8                  	movq	%rax, -0x18(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8011cf: e9 8c ff ff ff               	jmp	0x801160 <strncmp+0x10>
; 	if (n == 0)
  8011d4: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  8011d9: 0f 85 0c 00 00 00            	jne	0x8011eb <strncmp+0x9b>
; 		return 0;
  8011df: c7 45 fc 00 00 00 00         	movl	$0x0, -0x4(%rbp)
  8011e6: e9 13 00 00 00               	jmp	0x8011fe <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  8011eb: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8011ef: 0f b6 00                     	movzbl	(%rax), %eax
  8011f2: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  8011f6: 0f b6 09                     	movzbl	(%rcx), %ecx
  8011f9: 29 c8                        	subl	%ecx, %eax
  8011fb: 89 45 fc                     	movl	%eax, -0x4(%rbp)
; }
  8011fe: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  801201: 5d                           	popq	%rbp
  801202: c3                           	retq
  801203: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80120d: 0f 1f 00                     	nopl	(%rax)

0000000000801210 <strchr>:
; {
  801210: 55                           	pushq	%rbp
  801211: 48 89 e5                     	movq	%rsp, %rbp
  801214: 40 88 f0                     	movb	%sil, %al
  801217: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  80121b: 88 45 ef                     	movb	%al, -0x11(%rbp)
; 	for (; *s; s++)
  80121e: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801222: 80 38 00                     	cmpb	$0x0, (%rax)
  801225: 0f 84 36 00 00 00            	je	0x801261 <strchr+0x51>
; 		if (*s == c)
  80122b: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80122f: 0f be 00                     	movsbl	(%rax), %eax
  801232: 0f be 4d ef                  	movsbl	-0x11(%rbp), %ecx
  801236: 39 c8                        	cmpl	%ecx, %eax
  801238: 0f 85 0d 00 00 00            	jne	0x80124b <strchr+0x3b>
; 			return (char *) s;
  80123e: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801242: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801246: e9 1e 00 00 00               	jmp	0x801269 <strchr+0x59>
; 		if (*s == c)
  80124b: e9 00 00 00 00               	jmp	0x801250 <strchr+0x40>
; 	for (; *s; s++)
  801250: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801254: 48 83 c0 01                  	addq	$0x1, %rax
  801258: 48 89 45 f0                  	movq	%rax, -0x10(%rbp)
  80125c: e9 bd ff ff ff               	jmp	0x80121e <strchr+0xe>
; 	return 0;
  801261: 48 c7 45 f8 00 00 00 00      	movq	$0x0, -0x8(%rbp)
; }
  801269: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80126d: 5d                           	popq	%rbp
  80126e: c3                           	retq
  80126f: 90                           	nop

0000000000801270 <strfind>:
; {
  801270: 55                           	pushq	%rbp
  801271: 48 89 e5                     	movq	%rsp, %rbp
  801274: 40 88 f0                     	movb	%sil, %al
  801277: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80127b: 88 45 f7                     	movb	%al, -0x9(%rbp)
; 	for (; *s; s++)
  80127e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801282: 80 38 00                     	cmpb	$0x0, (%rax)
  801285: 0f 84 2e 00 00 00            	je	0x8012b9 <strfind+0x49>
; 		if (*s == c)
  80128b: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80128f: 0f be 00                     	movsbl	(%rax), %eax
  801292: 0f be 4d f7                  	movsbl	-0x9(%rbp), %ecx
  801296: 39 c8                        	cmpl	%ecx, %eax
  801298: 0f 85 05 00 00 00            	jne	0x8012a3 <strfind+0x33>
; 			break;
  80129e: e9 16 00 00 00               	jmp	0x8012b9 <strfind+0x49>
; 		if (*s == c)
  8012a3: e9 00 00 00 00               	jmp	0x8012a8 <strfind+0x38>
; 	for (; *s; s++)
  8012a8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8012ac: 48 83 c0 01                  	addq	$0x1, %rax
  8012b0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8012b4: e9 c5 ff ff ff               	jmp	0x80127e <strfind+0xe>
; 	return (char *) s;
  8012b9: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8012bd: 5d                           	popq	%rbp
  8012be: c3                           	retq
  8012bf: 90                           	nop

00000000008012c0 <memset>:
; {
  8012c0: 55                           	pushq	%rbp
  8012c1: 48 89 e5                     	movq	%rsp, %rbp
  8012c4: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  8012c8: 89 75 ec                     	movl	%esi, -0x14(%rbp)
  8012cb: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	if (n == 0)
  8012cf: 48 83 7d e0 00               	cmpq	$0x0, -0x20(%rbp)
  8012d4: 0f 85 0d 00 00 00            	jne	0x8012e7 <memset+0x27>
; 		return v;
  8012da: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8012de: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8012e2: e9 78 00 00 00               	jmp	0x80135f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  8012e7: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8012eb: 48 83 e0 03                  	andq	$0x3, %rax
  8012ef: 48 83 f8 00                  	cmpq	$0x0, %rax
  8012f3: 0f 85 50 00 00 00            	jne	0x801349 <memset+0x89>
  8012f9: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8012fd: 48 83 e0 03                  	andq	$0x3, %rax
  801301: 48 83 f8 00                  	cmpq	$0x0, %rax
  801305: 0f 85 3e 00 00 00            	jne	0x801349 <memset+0x89>
; 		c &= 0xFF;
  80130b: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  80130e: 25 ff 00 00 00               	andl	$0xff, %eax
  801313: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801316: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  801319: c1 e0 18                     	shll	$0x18, %eax
  80131c: 8b 4d ec                     	movl	-0x14(%rbp), %ecx
  80131f: c1 e1 10                     	shll	$0x10, %ecx
  801322: 09 c8                        	orl	%ecx, %eax
  801324: 8b 4d ec                     	movl	-0x14(%rbp), %ecx
  801327: c1 e1 08                     	shll	$0x8, %ecx
  80132a: 09 c8                        	orl	%ecx, %eax
  80132c: 0b 45 ec                     	orl	-0x14(%rbp), %eax
  80132f: 89 45 ec                     	movl	%eax, -0x14(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801332: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  801336: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  801339: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  80133d: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801341: fc                           	cld
  801342: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801344: e9 0e 00 00 00               	jmp	0x801357 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801349: 48 8b 7d f0                  	movq	-0x10(%rbp), %rdi
  80134d: 8b 45 ec                     	movl	-0x14(%rbp), %eax
  801350: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  801354: fc                           	cld
  801355: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  801357: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  80135b: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; }
  80135f: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801363: 5d                           	popq	%rbp
  801364: c3                           	retq
  801365: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80136f: 90                           	nop

0000000000801370 <memmove>:
; {
  801370: 55                           	pushq	%rbp
  801371: 48 89 e5                     	movq	%rsp, %rbp
  801374: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801378: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  80137c: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	s = src;
  801380: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801384: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	d = dst;
  801388: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80138c: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	if (s < d && s + n > d) {
  801390: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801394: 48 3b 45 d8                  	cmpq	-0x28(%rbp), %rax
  801398: 0f 83 9d 00 00 00            	jae	0x80143b <memmove+0xcb>
  80139e: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8013a2: 48 03 45 e8                  	addq	-0x18(%rbp), %rax
  8013a6: 48 3b 45 d8                  	cmpq	-0x28(%rbp), %rax
  8013aa: 0f 86 8b 00 00 00            	jbe	0x80143b <memmove+0xcb>
; 		s += n;
  8013b0: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8013b4: 48 03 45 e0                  	addq	-0x20(%rbp), %rax
  8013b8: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 		d += n;
  8013bc: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8013c0: 48 03 45 d8                  	addq	-0x28(%rbp), %rax
  8013c4: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8013c8: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8013cc: 48 83 e0 03                  	andq	$0x3, %rax
  8013d0: 48 83 f8 00                  	cmpq	$0x0, %rax
  8013d4: 0f 85 44 00 00 00            	jne	0x80141e <memmove+0xae>
  8013da: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  8013de: 48 83 e0 03                  	andq	$0x3, %rax
  8013e2: 48 83 f8 00                  	cmpq	$0x0, %rax
  8013e6: 0f 85 32 00 00 00            	jne	0x80141e <memmove+0xae>
  8013ec: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8013f0: 48 83 e0 03                  	andq	$0x3, %rax
  8013f4: 48 83 f8 00                  	cmpq	$0x0, %rax
  8013f8: 0f 85 20 00 00 00            	jne	0x80141e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  8013fe: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  801402: 48 83 c7 fc                  	addq	$-0x4, %rdi
  801406: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  80140a: 48 83 c6 fc                  	addq	$-0x4, %rsi
  80140e: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  801412: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 			asm volatile("std; rep movsl\n"
  801416: fd                           	std
  801417: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801419: e9 17 00 00 00               	jmp	0x801435 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80141e: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  801422: 48 83 c7 ff                  	addq	$-0x1, %rdi
  801426: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  80142a: 48 83 c6 ff                  	addq	$-0x1, %rsi
  80142e: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801432: fd                           	std
  801433: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801435: fc                           	cld
; 	} else {
  801436: e9 62 00 00 00               	jmp	0x80149d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80143b: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  80143f: 48 83 e0 03                  	andq	$0x3, %rax
  801443: 48 83 f8 00                  	cmpq	$0x0, %rax
  801447: 0f 85 3c 00 00 00            	jne	0x801489 <memmove+0x119>
  80144d: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  801451: 48 83 e0 03                  	andq	$0x3, %rax
  801455: 48 83 f8 00                  	cmpq	$0x0, %rax
  801459: 0f 85 2a 00 00 00            	jne	0x801489 <memmove+0x119>
  80145f: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  801463: 48 83 e0 03                  	andq	$0x3, %rax
  801467: 48 83 f8 00                  	cmpq	$0x0, %rax
  80146b: 0f 85 18 00 00 00            	jne	0x801489 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  801471: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  801475: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  801479: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
  80147d: 48 c1 e9 02                  	shrq	$0x2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801481: fc                           	cld
  801482: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801484: e9 0f 00 00 00               	jmp	0x801498 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801489: 48 8b 7d d8                  	movq	-0x28(%rbp), %rdi
  80148d: 48 8b 75 e0                  	movq	-0x20(%rbp), %rsi
  801491: 48 8b 4d e8                  	movq	-0x18(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801495: fc                           	cld
  801496: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801498: e9 00 00 00 00               	jmp	0x80149d <memmove+0x12d>
; 	return dst;
  80149d: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8014a1: 5d                           	popq	%rbp
  8014a2: c3                           	retq
  8014a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8014ad: 0f 1f 00                     	nopl	(%rax)

00000000008014b0 <memcpy>:
; {
  8014b0: 55                           	pushq	%rbp
  8014b1: 48 89 e5                     	movq	%rsp, %rbp
  8014b4: 48 83 ec 20                  	subq	$0x20, %rsp
  8014b8: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8014bc: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  8014c0: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	return memmove(dst, src, n);
  8014c4: 48 8b 7d f8                  	movq	-0x8(%rbp), %rdi
  8014c8: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8014cc: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  8014d0: e8 9b fe ff ff               	callq	0x801370 <memmove>
  8014d5: 48 83 c4 20                  	addq	$0x20, %rsp
  8014d9: 5d                           	popq	%rbp
  8014da: c3                           	retq
  8014db: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008014e0 <memcmp>:
; {
  8014e0: 55                           	pushq	%rbp
  8014e1: 48 89 e5                     	movq	%rsp, %rbp
  8014e4: 48 89 7d f0                  	movq	%rdi, -0x10(%rbp)
  8014e8: 48 89 75 e8                  	movq	%rsi, -0x18(%rbp)
  8014ec: 48 89 55 e0                  	movq	%rdx, -0x20(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  8014f0: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  8014f4: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  8014f8: 48 8b 45 e8                  	movq	-0x18(%rbp), %rax
  8014fc: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	while (n-- > 0) {
  801500: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801504: 48 89 c1                     	movq	%rax, %rcx
  801507: 48 83 c1 ff                  	addq	$-0x1, %rcx
  80150b: 48 89 4d e0                  	movq	%rcx, -0x20(%rbp)
  80150f: 48 83 f8 00                  	cmpq	$0x0, %rax
  801513: 0f 86 4b 00 00 00            	jbe	0x801564 <memcmp+0x84>
; 		if (*s1 != *s2)
  801519: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80151d: 0f b6 00                     	movzbl	(%rax), %eax
  801520: 48 8b 4d d0                  	movq	-0x30(%rbp), %rcx
  801524: 0f b6 09                     	movzbl	(%rcx), %ecx
  801527: 39 c8                        	cmpl	%ecx, %eax
  801529: 0f 84 18 00 00 00            	je	0x801547 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80152f: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  801533: 0f b6 00                     	movzbl	(%rax), %eax
  801536: 48 8b 4d d0                  	movq	-0x30(%rbp), %rcx
  80153a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80153d: 29 c8                        	subl	%ecx, %eax
  80153f: 89 45 fc                     	movl	%eax, -0x4(%rbp)
  801542: e9 24 00 00 00               	jmp	0x80156b <memcmp+0x8b>
; 		s1++, s2++;
  801547: 48 8b 45 d8                  	movq	-0x28(%rbp), %rax
  80154b: 48 83 c0 01                  	addq	$0x1, %rax
  80154f: 48 89 45 d8                  	movq	%rax, -0x28(%rbp)
  801553: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  801557: 48 83 c0 01                  	addq	$0x1, %rax
  80155b: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	while (n-- > 0) {
  80155f: e9 9c ff ff ff               	jmp	0x801500 <memcmp+0x20>
; 	return 0;
  801564: c7 45 fc 00 00 00 00         	movl	$0x0, -0x4(%rbp)
; }
  80156b: 8b 45 fc                     	movl	-0x4(%rbp), %eax
  80156e: 5d                           	popq	%rbp
  80156f: c3                           	retq

0000000000801570 <memfind>:
; {
  801570: 55                           	pushq	%rbp
  801571: 48 89 e5                     	movq	%rsp, %rbp
  801574: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  801578: 89 75 f4                     	movl	%esi, -0xc(%rbp)
  80157b: 48 89 55 e8                  	movq	%rdx, -0x18(%rbp)
; 	const void *ends = (const char *) s + n;
  80157f: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801583: 48 03 45 e8                  	addq	-0x18(%rbp), %rax
  801587: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	for (; s < ends; s++)
  80158b: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80158f: 48 3b 45 e0                  	cmpq	-0x20(%rbp), %rax
  801593: 0f 83 30 00 00 00            	jae	0x8015c9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801599: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  80159d: 0f b6 00                     	movzbl	(%rax), %eax
  8015a0: 8b 4d f4                     	movl	-0xc(%rbp), %ecx
  8015a3: 0f b6 c9                     	movzbl	%cl, %ecx
  8015a6: 39 c8                        	cmpl	%ecx, %eax
  8015a8: 0f 85 05 00 00 00            	jne	0x8015b3 <memfind+0x43>
; 			break;
  8015ae: e9 16 00 00 00               	jmp	0x8015c9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8015b3: e9 00 00 00 00               	jmp	0x8015b8 <memfind+0x48>
; 	for (; s < ends; s++)
  8015b8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015bc: 48 83 c0 01                  	addq	$0x1, %rax
  8015c0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8015c4: e9 c2 ff ff ff               	jmp	0x80158b <memfind+0x1b>
; 	return (void *) s;
  8015c9: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015cd: 5d                           	popq	%rbp
  8015ce: c3                           	retq
  8015cf: 90                           	nop

00000000008015d0 <strtol>:
; {
  8015d0: 55                           	pushq	%rbp
  8015d1: 48 89 e5                     	movq	%rsp, %rbp
  8015d4: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  8015d8: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
  8015dc: 89 55 ec                     	movl	%edx, -0x14(%rbp)
; 	int neg = 0;
  8015df: c7 45 e8 00 00 00 00         	movl	$0x0, -0x18(%rbp)
; 	long val = 0;
  8015e6: 48 c7 45 e0 00 00 00 00      	movq	$0x0, -0x20(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8015ee: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8015f2: 0f be 08                     	movsbl	(%rax), %ecx
  8015f5: b0 01                        	movb	$0x1, %al
  8015f7: 83 f9 20                     	cmpl	$0x20, %ecx
  8015fa: 88 45 db                     	movb	%al, -0x25(%rbp)
  8015fd: 0f 84 10 00 00 00            	je	0x801613 <strtol+0x43>
  801603: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801607: 0f be 00                     	movsbl	(%rax), %eax
  80160a: 83 f8 09                     	cmpl	$0x9, %eax
  80160d: 0f 94 c0                     	sete	%al
  801610: 88 45 db                     	movb	%al, -0x25(%rbp)
  801613: 8a 45 db                     	movb	-0x25(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801616: a8 01                        	testb	$0x1, %al
  801618: 0f 85 05 00 00 00            	jne	0x801623 <strtol+0x53>
  80161e: e9 11 00 00 00               	jmp	0x801634 <strtol+0x64>
; 		s++;
  801623: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801627: 48 83 c0 01                  	addq	$0x1, %rax
  80162b: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80162f: e9 ba ff ff ff               	jmp	0x8015ee <strtol+0x1e>
; 	if (*s == '+')
  801634: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801638: 0f be 00                     	movsbl	(%rax), %eax
  80163b: 83 f8 2b                     	cmpl	$0x2b, %eax
  80163e: 0f 85 11 00 00 00            	jne	0x801655 <strtol+0x85>
; 		s++;
  801644: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801648: 48 83 c0 01                  	addq	$0x1, %rax
  80164c: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801650: e9 28 00 00 00               	jmp	0x80167d <strtol+0xad>
; 	else if (*s == '-')
  801655: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801659: 0f be 00                     	movsbl	(%rax), %eax
  80165c: 83 f8 2d                     	cmpl	$0x2d, %eax
  80165f: 0f 85 13 00 00 00            	jne	0x801678 <strtol+0xa8>
; 		s++, neg = 1;
  801665: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801669: 48 83 c0 01                  	addq	$0x1, %rax
  80166d: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  801671: c7 45 e8 01 00 00 00         	movl	$0x1, -0x18(%rbp)
  801678: e9 00 00 00 00               	jmp	0x80167d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  80167d: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  801681: 0f 84 0a 00 00 00            	je	0x801691 <strtol+0xc1>
  801687: 83 7d ec 10                  	cmpl	$0x10, -0x14(%rbp)
  80168b: 0f 85 39 00 00 00            	jne	0x8016ca <strtol+0xfa>
  801691: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801695: 0f be 00                     	movsbl	(%rax), %eax
  801698: 83 f8 30                     	cmpl	$0x30, %eax
  80169b: 0f 85 29 00 00 00            	jne	0x8016ca <strtol+0xfa>
  8016a1: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016a5: 0f be 40 01                  	movsbl	0x1(%rax), %eax
  8016a9: 83 f8 78                     	cmpl	$0x78, %eax
  8016ac: 0f 85 18 00 00 00            	jne	0x8016ca <strtol+0xfa>
; 		s += 2, base = 16;
  8016b2: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016b6: 48 83 c0 02                  	addq	$0x2, %rax
  8016ba: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8016be: c7 45 ec 10 00 00 00         	movl	$0x10, -0x14(%rbp)
  8016c5: e9 4d 00 00 00               	jmp	0x801717 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  8016ca: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  8016ce: 0f 85 28 00 00 00            	jne	0x8016fc <strtol+0x12c>
  8016d4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016d8: 0f be 00                     	movsbl	(%rax), %eax
  8016db: 83 f8 30                     	cmpl	$0x30, %eax
  8016de: 0f 85 18 00 00 00            	jne	0x8016fc <strtol+0x12c>
; 		s++, base = 8;
  8016e4: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8016e8: 48 83 c0 01                  	addq	$0x1, %rax
  8016ec: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8016f0: c7 45 ec 08 00 00 00         	movl	$0x8, -0x14(%rbp)
  8016f7: e9 16 00 00 00               	jmp	0x801712 <strtol+0x142>
; 	else if (base == 0)
  8016fc: 83 7d ec 00                  	cmpl	$0x0, -0x14(%rbp)
  801700: 0f 85 07 00 00 00            	jne	0x80170d <strtol+0x13d>
; 		base = 10;
  801706: c7 45 ec 0a 00 00 00         	movl	$0xa, -0x14(%rbp)
  80170d: e9 00 00 00 00               	jmp	0x801712 <strtol+0x142>
  801712: e9 00 00 00 00               	jmp	0x801717 <strtol+0x147>
; 	while (1) {
  801717: e9 00 00 00 00               	jmp	0x80171c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80171c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801720: 0f be 00                     	movsbl	(%rax), %eax
  801723: 83 f8 30                     	cmpl	$0x30, %eax
  801726: 0f 8c 22 00 00 00            	jl	0x80174e <strtol+0x17e>
  80172c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801730: 0f be 00                     	movsbl	(%rax), %eax
  801733: 83 f8 39                     	cmpl	$0x39, %eax
  801736: 0f 8f 12 00 00 00            	jg	0x80174e <strtol+0x17e>
; 			dig = *s - '0';
  80173c: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801740: 0f be 00                     	movsbl	(%rax), %eax
  801743: 83 e8 30                     	subl	$0x30, %eax
  801746: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  801749: e9 79 00 00 00               	jmp	0x8017c7 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80174e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801752: 0f be 00                     	movsbl	(%rax), %eax
  801755: 83 f8 61                     	cmpl	$0x61, %eax
  801758: 0f 8c 25 00 00 00            	jl	0x801783 <strtol+0x1b3>
  80175e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801762: 0f be 00                     	movsbl	(%rax), %eax
  801765: 83 f8 7a                     	cmpl	$0x7a, %eax
  801768: 0f 8f 15 00 00 00            	jg	0x801783 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  80176e: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801772: 0f be 00                     	movsbl	(%rax), %eax
  801775: 83 e8 61                     	subl	$0x61, %eax
  801778: 83 c0 0a                     	addl	$0xa, %eax
  80177b: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  80177e: e9 3f 00 00 00               	jmp	0x8017c2 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801783: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801787: 0f be 00                     	movsbl	(%rax), %eax
  80178a: 83 f8 41                     	cmpl	$0x41, %eax
  80178d: 0f 8c 25 00 00 00            	jl	0x8017b8 <strtol+0x1e8>
  801793: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  801797: 0f be 00                     	movsbl	(%rax), %eax
  80179a: 83 f8 5a                     	cmpl	$0x5a, %eax
  80179d: 0f 8f 15 00 00 00            	jg	0x8017b8 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  8017a3: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8017a7: 0f be 00                     	movsbl	(%rax), %eax
  8017aa: 83 e8 41                     	subl	$0x41, %eax
  8017ad: 83 c0 0a                     	addl	$0xa, %eax
  8017b0: 89 45 dc                     	movl	%eax, -0x24(%rbp)
  8017b3: e9 05 00 00 00               	jmp	0x8017bd <strtol+0x1ed>
; 			break;
  8017b8: e9 43 00 00 00               	jmp	0x801800 <strtol+0x230>
  8017bd: e9 00 00 00 00               	jmp	0x8017c2 <strtol+0x1f2>
  8017c2: e9 00 00 00 00               	jmp	0x8017c7 <strtol+0x1f7>
; 		if (dig >= base)
  8017c7: 8b 45 dc                     	movl	-0x24(%rbp), %eax
  8017ca: 3b 45 ec                     	cmpl	-0x14(%rbp), %eax
  8017cd: 0f 8c 05 00 00 00            	jl	0x8017d8 <strtol+0x208>
; 			break;
  8017d3: e9 28 00 00 00               	jmp	0x801800 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  8017d8: 48 8b 45 f8                  	movq	-0x8(%rbp), %rax
  8017dc: 48 83 c0 01                  	addq	$0x1, %rax
  8017e0: 48 89 45 f8                  	movq	%rax, -0x8(%rbp)
  8017e4: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  8017e8: 48 63 4d ec                  	movslq	-0x14(%rbp), %rcx
  8017ec: 48 0f af c1                  	imulq	%rcx, %rax
  8017f0: 48 63 4d dc                  	movslq	-0x24(%rbp), %rcx
  8017f4: 48 01 c8                     	addq	%rcx, %rax
  8017f7: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
; 	while (1) {
  8017fb: e9 1c ff ff ff               	jmp	0x80171c <strtol+0x14c>
; 	if (endptr)
  801800: 48 83 7d f0 00               	cmpq	$0x0, -0x10(%rbp)
  801805: 0f 84 0b 00 00 00            	je	0x801816 <strtol+0x246>
; 		*endptr = (char *) s;
  80180b: 48 8b 4d f8                  	movq	-0x8(%rbp), %rcx
  80180f: 48 8b 45 f0                  	movq	-0x10(%rbp), %rax
  801813: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801816: 83 7d e8 00                  	cmpl	$0x0, -0x18(%rbp)
  80181a: 0f 84 0f 00 00 00            	je	0x80182f <strtol+0x25f>
  801820: 31 c0                        	xorl	%eax, %eax
  801822: 48 2b 45 e0                  	subq	-0x20(%rbp), %rax
  801826: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  80182a: e9 08 00 00 00               	jmp	0x801837 <strtol+0x267>
  80182f: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
  801833: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
  801837: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
; 	return (neg ? -val : val);
  80183b: 5d                           	popq	%rbp
  80183c: c3                           	retq
  80183d: cc                           	int3
  80183e: cc                           	int3
  80183f: cc                           	int3

0000000000801840 <puts>:
; {
  801840: 55                           	pushq	%rbp
  801841: 48 89 e5                     	movq	%rsp, %rbp
  801844: 48 83 ec 20                  	subq	$0x20, %rsp
  801848: 48 89 7d f8                  	movq	%rdi, -0x8(%rbp)
  80184c: 48 89 75 f0                  	movq	%rsi, -0x10(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  801850: 48 8b 55 f8                  	movq	-0x8(%rbp), %rdx
  801854: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
  801858: 31 f6                        	xorl	%esi, %esi
  80185a: 31 c0                        	xorl	%eax, %eax
  80185c: 41 89 c1                     	movl	%eax, %r9d
  80185f: 89 f7                        	movl	%esi, %edi
  801861: 4d 89 c8                     	movq	%r9, %r8
  801864: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  80186c: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  801875: e8 06 00 00 00               	callq	0x801880 <syscall>
; }
  80187a: 48 83 c4 20                  	addq	$0x20, %rsp
  80187e: 5d                           	popq	%rbp
  80187f: c3                           	retq

0000000000801880 <syscall>:
; {
  801880: 55                           	pushq	%rbp
  801881: 48 89 e5                     	movq	%rsp, %rbp
  801884: 48 83 ec 40                  	subq	$0x40, %rsp
  801888: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  80188c: 48 8b 45 10                  	movq	0x10(%rbp), %rax
  801890: 89 7d fc                     	movl	%edi, -0x4(%rbp)
  801893: 89 75 f8                     	movl	%esi, -0x8(%rbp)
  801896: 48 89 55 f0                  	movq	%rdx, -0x10(%rbp)
  80189a: 48 89 4d e8                  	movq	%rcx, -0x18(%rbp)
  80189e: 4c 89 45 e0                  	movq	%r8, -0x20(%rbp)
  8018a2: 4c 89 4d d8                  	movq	%r9, -0x28(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8018a6: 48 63 7d fc                  	movslq	-0x4(%rbp), %rdi
  8018aa: 48 8b 75 f0                  	movq	-0x10(%rbp), %rsi
  8018ae: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
  8018b2: 48 8b 4d e0                  	movq	-0x20(%rbp), %rcx
  8018b6: 4c 8b 45 d8                  	movq	-0x28(%rbp), %r8
  8018ba: 4c 8b 4d 10                  	movq	0x10(%rbp), %r9
  8018be: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  8018c2: 48 89 04 24                  	movq	%rax, (%rsp)
  8018c6: e8 01 01 00 00               	callq	0x8019cc <do_syscall>
  8018cb: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
; 	if(check && ret < 0) {
  8018cf: 83 7d f8 00                  	cmpl	$0x0, -0x8(%rbp)
  8018d3: 0f 84 2c 00 00 00            	je	0x801905 <syscall+0x85>
  8018d9: 48 83 7d d0 00               	cmpq	$0x0, -0x30(%rbp)
  8018de: 0f 83 21 00 00 00            	jae	0x801905 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  8018e4: 8b 4d fc                     	movl	-0x4(%rbp), %ecx
  8018e7: 4c 8b 45 d0                  	movq	-0x30(%rbp), %r8
  8018eb: 48 8d 3d 34 07 00 00         	leaq	0x734(%rip), %rdi       # 0x802026
  8018f2: be 1f 00 00 00               	movl	$0x1f, %esi
  8018f7: 48 8d 15 10 08 00 00         	leaq	0x810(%rip), %rdx       # 0x80210e
  8018fe: b0 00                        	movb	$0x0, %al
  801900: e8 fb e7 ff ff               	callq	0x800100 <_panic>
; 	return ret;
  801905: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
  801909: 48 83 c4 40                  	addq	$0x40, %rsp
  80190d: 5d                           	popq	%rbp
  80190e: c3                           	retq
  80190f: 90                           	nop

0000000000801910 <getc>:
; {
  801910: 55                           	pushq	%rbp
  801911: 48 89 e5                     	movq	%rsp, %rbp
  801914: 48 83 ec 10                  	subq	$0x10, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801918: bf 01 00 00 00               	movl	$0x1, %edi
  80191d: 31 f6                        	xorl	%esi, %esi
  80191f: 31 c0                        	xorl	%eax, %eax
  801921: 41 89 c1                     	movl	%eax, %r9d
  801924: 4c 89 ca                     	movq	%r9, %rdx
  801927: 4c 89 c9                     	movq	%r9, %rcx
  80192a: 4d 89 c8                     	movq	%r9, %r8
  80192d: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  801935: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  80193e: e8 3d ff ff ff               	callq	0x801880 <syscall>
  801943: 48 83 c4 10                  	addq	$0x10, %rsp
  801947: 5d                           	popq	%rbp
  801948: c3                           	retq
  801949: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000801950 <kill>:
; {
  801950: 55                           	pushq	%rbp
  801951: 48 89 e5                     	movq	%rsp, %rbp
  801954: 48 83 ec 20                  	subq	$0x20, %rsp
  801958: 89 7d fc                     	movl	%edi, -0x4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  80195b: 48 63 55 fc                  	movslq	-0x4(%rbp), %rdx
  80195f: bf 03 00 00 00               	movl	$0x3, %edi
  801964: be 01 00 00 00               	movl	$0x1, %esi
  801969: 31 c0                        	xorl	%eax, %eax
  80196b: 41 89 c1                     	movl	%eax, %r9d
  80196e: 4c 89 c9                     	movq	%r9, %rcx
  801971: 4d 89 c8                     	movq	%r9, %r8
  801974: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  80197c: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  801985: e8 f6 fe ff ff               	callq	0x801880 <syscall>
  80198a: 48 83 c4 20                  	addq	$0x20, %rsp
  80198e: 5d                           	popq	%rbp
  80198f: c3                           	retq

0000000000801990 <getpid>:
; {
  801990: 55                           	pushq	%rbp
  801991: 48 89 e5                     	movq	%rsp, %rbp
  801994: 48 83 ec 10                  	subq	$0x10, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  801998: bf 02 00 00 00               	movl	$0x2, %edi
  80199d: 31 f6                        	xorl	%esi, %esi
  80199f: 31 c0                        	xorl	%eax, %eax
  8019a1: 41 89 c1                     	movl	%eax, %r9d
  8019a4: 4c 89 ca                     	movq	%r9, %rdx
  8019a7: 4c 89 c9                     	movq	%r9, %rcx
  8019aa: 4d 89 c8                     	movq	%r9, %r8
  8019ad: 48 c7 04 24 00 00 00 00      	movq	$0x0, (%rsp)
  8019b5: 48 c7 44 24 08 00 00 00 00   	movq	$0x0, 0x8(%rsp)
  8019be: e8 bd fe ff ff               	callq	0x801880 <syscall>
  8019c3: 48 83 c4 10                  	addq	$0x10, %rsp
  8019c7: 5d                           	popq	%rbp
  8019c8: c3                           	retq
  8019c9: cc                           	int3
  8019ca: cc                           	int3
  8019cb: cc                           	int3

00000000008019cc <do_syscall>:
; 	pushq %rbp
  8019cc: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  8019cd: 48 8b 6c 24 10               	movq	0x10(%rsp), %rbp
; 	int $INT_SYSCALL
  8019d2: cd 80                        	int	$0x80
; 	popq %rbp
  8019d4: 5d                           	popq	%rbp
; 	retq
  8019d5: c3                           	retq
