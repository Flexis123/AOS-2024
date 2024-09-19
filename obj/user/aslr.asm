
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
  800042: e8 59 00 00 00               	callq	0x8000a0 <libmain>
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
;     printf("foo: %p\n", foo); /* invalid ptr if foo global is not relocated */
  800054: 48 8d 05 a5 1f 00 00         	leaq	8101(%rip), %rax        # 0x802000 <foo>
  80005b: 48 8b 30                     	movq	(%rax), %rsi
  80005e: 48 8d 3d b6 0f 00 00         	leaq	4022(%rip), %rdi        # 0x80101b <syscall.c+0x80101b>
  800065: 31 c0                        	xorl	%eax, %eax
  800067: e8 a4 01 00 00               	callq	0x800210 <printf>
;     printf("&puts: %p\n", &puts); /* also invalid */
  80006c: 48 8d 3d b8 0f 00 00         	leaq	4024(%rip), %rdi        # 0x80102b <syscall.c+0x80102b>
  800073: 48 8d 35 46 0d 00 00         	leaq	3398(%rip), %rsi        # 0x800dc0 <puts>
  80007a: 31 c0                        	xorl	%eax, %eax
  80007c: e8 8f 01 00 00               	callq	0x800210 <printf>
;     panic("die"); /* fails when binaryname global is not relocated properly */
  800081: 48 8d 3d d4 0f 00 00         	leaq	4052(%rip), %rdi        # 0x80105c <syscall.c+0x80105c>
  800088: 48 8d 15 d9 0f 00 00         	leaq	4057(%rip), %rdx        # 0x801068 <syscall.c+0x801068>
  80008f: be 0b 00 00 00               	movl	$11, %esi
  800094: 31 c0                        	xorl	%eax, %eax
  800096: e8 45 00 00 00               	callq	0x8000e0 <_panic>
  80009b: cc                           	int3
  80009c: cc                           	int3
  80009d: cc                           	int3
  80009e: cc                           	int3
  80009f: cc                           	int3

00000000008000a0 <libmain>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  8000a4: 85 ff                        	testl	%edi, %edi
  8000a6: 7e 0d                        	jle	0x8000b5 <libmain+0x15>
; 		binary_name = argv[0];
  8000a8: 48 8b 06                     	movq	(%rsi), %rax
  8000ab: 48 8d 0d 56 1f 00 00         	leaq	8022(%rip), %rcx        # 0x802008 <binary_name>
  8000b2: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  8000b5: e8 96 ff ff ff               	callq	0x800050 <main>
; 	exit();
  8000ba: e8 11 00 00 00               	callq	0x8000d0 <exit>
; }
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
  8000d6: e8 55 0d 00 00               	callq	0x800e30 <kill>
; }
  8000db: 5d                           	popq	%rbp
  8000dc: c3                           	retq
  8000dd: cc                           	int3
  8000de: cc                           	int3
  8000df: cc                           	int3

00000000008000e0 <_panic>:
; {
  8000e0: 55                           	pushq	%rbp
  8000e1: 48 89 e5                     	movq	%rsp, %rbp
  8000e4: 41 57                        	pushq	%r15
  8000e6: 41 56                        	pushq	%r14
  8000e8: 53                           	pushq	%rbx
  8000e9: 48 83 ec 48                  	subq	$72, %rsp
  8000ed: 49 89 d6                     	movq	%rdx, %r14
  8000f0: 41 89 f7                     	movl	%esi, %r15d
  8000f3: 48 89 fb                     	movq	%rdi, %rbx
  8000f6: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8000fa: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8000fe: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800102: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800106: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80010a: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80010e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800112: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80011c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 		getpid(), binary_name, file, line);
  800120: e8 2b 0d 00 00               	callq	0x800e50 <getpid>
  800125: 48 8d 0d dc 1e 00 00         	leaq	7900(%rip), %rcx        # 0x802008 <binary_name>
  80012c: 48 8b 11                     	movq	(%rcx), %rdx
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  80012f: 48 8d 3d 00 0f 00 00         	leaq	3840(%rip), %rdi        # 0x801036 <syscall.c+0x801036>
  800136: 89 c6                        	movl	%eax, %esi
  800138: 48 89 d9                     	movq	%rbx, %rcx
  80013b: 45 89 f8                     	movl	%r15d, %r8d
  80013e: 31 c0                        	xorl	%eax, %eax
  800140: e8 cb 00 00 00               	callq	0x800210 <printf>
  800145: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
; 	vprintf(fmt, ap);
  800149: 4c 89 f7                     	movq	%r14, %rdi
  80014c: e8 1f 00 00 00               	callq	0x800170 <vprintf>
; 	printf("\n");
  800151: 48 8d 3d 68 0f 00 00         	leaq	3944(%rip), %rdi        # 0x8010c0 <syscall.c+0x8010c0>
  800158: 31 c0                        	xorl	%eax, %eax
  80015a: e8 b1 00 00 00               	callq	0x800210 <printf>
  80015f: 90                           	nop
; 		asm volatile("int3");
  800160: cc                           	int3
; 	while (1) {
  800161: eb fd                        	jmp	0x800160 <_panic+0x80>
  800163: cc                           	int3
  800164: cc                           	int3
  800165: cc                           	int3
  800166: cc                           	int3
  800167: cc                           	int3
  800168: cc                           	int3
  800169: cc                           	int3
  80016a: cc                           	int3
  80016b: cc                           	int3
  80016c: cc                           	int3
  80016d: cc                           	int3
  80016e: cc                           	int3
  80016f: cc                           	int3

0000000000800170 <vprintf>:
; {
  800170: 55                           	pushq	%rbp
  800171: 48 89 e5                     	movq	%rsp, %rbp
  800174: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  80017b: 48 89 f1                     	movq	%rsi, %rcx
  80017e: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  800181: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80018c: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x8001d0 <putch>
  800193: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80019a: e8 c1 00 00 00               	callq	0x800260 <vprintfmt>
; 	puts(b.buf, b.idx);
  80019f: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  8001a6: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  8001ad: e8 0e 0c 00 00               	callq	0x800dc0 <puts>
; 	return b.cnt;
  8001b2: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  8001b8: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  8001bf: 5d                           	popq	%rbp
  8001c0: c3                           	retq
  8001c1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8001cb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008001d0 <putch>:
; {
  8001d0: 55                           	pushq	%rbp
  8001d1: 48 89 e5                     	movq	%rsp, %rbp
  8001d4: 53                           	pushq	%rbx
  8001d5: 50                           	pushq	%rax
  8001d6: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  8001d9: 48 63 06                     	movslq	(%rsi), %rax
  8001dc: 8d 48 01                     	leal	1(%rax), %ecx
  8001df: 89 0e                        	movl	%ecx, (%rsi)
  8001e1: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  8001e6: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  8001ec: 75 14                        	jne	0x800202 <putch+0x32>
; 		puts(b->buf, b->idx);
  8001ee: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  8001f2: be ff 00 00 00               	movl	$255, %esi
  8001f7: e8 c4 0b 00 00               	callq	0x800dc0 <puts>
; 		b->idx = 0;
  8001fc: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800202: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800206: 48 83 c4 08                  	addq	$8, %rsp
  80020a: 5b                           	popq	%rbx
  80020b: 5d                           	popq	%rbp
  80020c: c3                           	retq
  80020d: 0f 1f 00                     	nopl	(%rax)

0000000000800210 <printf>:
; {
  800210: 55                           	pushq	%rbp
  800211: 48 89 e5                     	movq	%rsp, %rbp
  800214: 48 83 ec 50                  	subq	$80, %rsp
  800218: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80021c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  800220: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  800224: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800228: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  80022c: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800230: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800234: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800238: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  80023c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  800246: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80024a: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  80024e: e8 1d ff ff ff               	callq	0x800170 <vprintf>
; 	return cnt;
  800253: 48 83 c4 50                  	addq	$80, %rsp
  800257: 5d                           	popq	%rbp
  800258: c3                           	retq
  800259: cc                           	int3
  80025a: cc                           	int3
  80025b: cc                           	int3
  80025c: cc                           	int3
  80025d: cc                           	int3
  80025e: cc                           	int3
  80025f: cc                           	int3

0000000000800260 <vprintfmt>:
; {
  800260: 55                           	pushq	%rbp
  800261: 48 89 e5                     	movq	%rsp, %rbp
  800264: 41 57                        	pushq	%r15
  800266: 41 56                        	pushq	%r14
  800268: 41 55                        	pushq	%r13
  80026a: 41 54                        	pushq	%r12
  80026c: 53                           	pushq	%rbx
  80026d: 48 83 ec 38                  	subq	$56, %rsp
  800271: 48 89 d3                     	movq	%rdx, %rbx
  800274: 49 89 f6                     	movq	%rsi, %r14
  800277: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  80027a: 48 8b 41 10                  	movq	16(%rcx), %rax
  80027e: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800282: 48 8b 01                     	movq	(%rcx), %rax
  800285: 48 8b 49 08                  	movq	8(%rcx), %rcx
  800289: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80028d: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800291: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  800295: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  800299: eb 36                        	jmp	0x8002d1 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  80029b: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  80029f: e8 0c 05 00 00               	callq	0x8007b0 <getuint>
  8002a4: 49 89 c4                     	movq	%rax, %r12
  8002a7: 41 bf 10 00 00 00            	movl	$16, %r15d
  8002ad: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  8002b1: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  8002b5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  8002b9: 4c 89 e2                     	movq	%r12, %rdx
  8002bc: 44 89 f9                     	movl	%r15d, %ecx
  8002bf: 49 89 ff                     	movq	%rdi, %r15
  8002c2: 45 89 f0                     	movl	%r14d, %r8d
  8002c5: 49 89 f6                     	movq	%rsi, %r14
  8002c8: e8 63 05 00 00               	callq	0x800830 <printnum>
; 			break;
  8002cd: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8002d1: 0f b6 3b                     	movzbl	(%rbx), %edi
  8002d4: 48 83 c3 01                  	addq	$1, %rbx
  8002d8: 83 ff 25                     	cmpl	$37, %edi
  8002db: 74 13                        	je	0x8002f0 <vprintfmt+0x90>
  8002dd: 40 84 ff                     	testb	%dil, %dil
  8002e0: 0f 84 ea 03 00 00            	je	0x8006d0 <vprintfmt+0x470>
  8002e6: 4c 89 f6                     	movq	%r14, %rsi
  8002e9: 41 ff d7                     	callq	*%r15
  8002ec: eb e3                        	jmp	0x8002d1 <vprintfmt+0x71>
  8002ee: 66 90                        	nop
  8002f0: 41 b5 20                     	movb	$32, %r13b
  8002f3: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  8002f9: 31 f6                        	xorl	%esi, %esi
  8002fb: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  8002ff: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800305: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80030c: 48 8d 3d fd 0d 00 00         	leaq	3581(%rip), %rdi        # 0x801110 <syscall.c+0x801110>
; 		switch (ch = *(unsigned char *) fmt++) {
  800313: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800317: eb 12                        	jmp	0x80032b <vprintfmt+0xcb>
  800319: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800320: 48 83 c3 01                  	addq	$1, %rbx
  800324: 49 83 c4 01                  	addq	$1, %r12
  800328: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  80032b: 0f b6 0b                     	movzbl	(%rbx), %ecx
  80032e: 8d 51 dd                     	leal	-35(%rcx), %edx
  800331: 80 fa 55                     	cmpb	$85, %dl
  800334: 0f 87 21 01 00 00            	ja	0x80045b <vprintfmt+0x1fb>
  80033a: 0f b6 d2                     	movzbl	%dl, %edx
  80033d: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  800341: 48 01 fa                     	addq	%rdi, %rdx
  800344: ff e2                        	jmpq	*%rdx
  800346: b1 30                        	movb	$48, %cl
  800348: eb d6                        	jmp	0x800320 <vprintfmt+0xc0>
  80034a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  800350: 0f b6 c9                     	movzbl	%cl, %ecx
  800353: 45 31 ff                     	xorl	%r15d, %r15d
  800356: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  800360: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  800364: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  800368: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  80036c: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  800370: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  800374: 8d 51 c6                     	leal	-58(%rcx), %edx
  800377: 80 fa f6                     	cmpb	$-10, %dl
  80037a: 73 e4                        	jae	0x800360 <vprintfmt+0x100>
; 			if (width < 0)
  80037c: 45 85 f6                     	testl	%r14d, %r14d
  80037f: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  800383: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  800388: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  80038c: eb 85                        	jmp	0x800313 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  80038e: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800392: 48 83 c3 01                  	addq	$1, %rbx
  800396: 48 83 f9 28                  	cmpq	$40, %rcx
  80039a: 77 3b                        	ja	0x8003d7 <vprintfmt+0x177>
  80039c: 48 89 ca                     	movq	%rcx, %rdx
  80039f: 48 01 c2                     	addq	%rax, %rdx
  8003a2: 83 c1 08                     	addl	$8, %ecx
  8003a5: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8003a8: 44 8b 3a                     	movl	(%rdx), %r15d
  8003ab: eb cf                        	jmp	0x80037c <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  8003ad: 48 83 c3 01                  	addq	$1, %rbx
  8003b1: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  8003b8: e9 56 ff ff ff               	jmp	0x800313 <vprintfmt+0xb3>
; 			if (width < 0)
  8003bd: 45 85 f6                     	testl	%r14d, %r14d
  8003c0: b9 00 00 00 00               	movl	$0, %ecx
  8003c5: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  8003c9: eb 03                        	jmp	0x8003ce <vprintfmt+0x16e>
; 			lflag++;
  8003cb: 83 c6 01                     	addl	$1, %esi
  8003ce: 48 83 c3 01                  	addq	$1, %rbx
  8003d2: e9 3c ff ff ff               	jmp	0x800313 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  8003d7: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  8003db: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  8003df: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  8003e3: 44 8b 39                     	movl	(%rcx), %r15d
  8003e6: eb 94                        	jmp	0x80037c <vprintfmt+0x11c>
; 			putch(ch, putdat);
  8003e8: bf 25 00 00 00               	movl	$37, %edi
  8003ed: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8003f1: 4c 89 f6                     	movq	%r14, %rsi
  8003f4: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8003f8: 41 ff d7                     	callq	*%r15
; 			break;
  8003fb: 48 83 c3 01                  	addq	$1, %rbx
  8003ff: e9 cd fe ff ff               	jmp	0x8002d1 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800404: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800408: 48 83 f9 28                  	cmpq	$40, %rcx
  80040c: 0f 87 1a 01 00 00            	ja	0x80052c <vprintfmt+0x2cc>
  800412: 48 89 c8                     	movq	%rcx, %rax
  800415: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800419: 83 c1 08                     	addl	$8, %ecx
  80041c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80041f: e9 14 01 00 00               	jmp	0x800538 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  800424: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800428: e8 83 03 00 00               	callq	0x8007b0 <getuint>
  80042d: 49 89 c4                     	movq	%rax, %r12
  800430: 41 bf 08 00 00 00            	movl	$8, %r15d
  800436: e9 72 fe ff ff               	jmp	0x8002ad <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  80043b: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80043f: 48 83 f9 28                  	cmpq	$40, %rcx
  800443: 0f 87 2f 01 00 00            	ja	0x800578 <vprintfmt+0x318>
  800449: 48 89 c8                     	movq	%rcx, %rax
  80044c: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800450: 83 c1 08                     	addl	$8, %ecx
  800453: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800456: e9 29 01 00 00               	jmp	0x800584 <vprintfmt+0x324>
; 			putch('%', putdat);
  80045b: bf 25 00 00 00               	movl	$37, %edi
  800460: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800464: 4c 89 f6                     	movq	%r14, %rsi
  800467: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  80046b: 41 ff d7                     	callq	*%r15
  80046e: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800470: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  800475: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  80047b: 49 89 dc                     	movq	%rbx, %r12
  80047e: 75 f0                        	jne	0x800470 <vprintfmt+0x210>
  800480: e9 4c fe ff ff               	jmp	0x8002d1 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  800485: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800489: 48 83 f9 28                  	cmpq	$40, %rcx
  80048d: 0f 87 ab 01 00 00            	ja	0x80063e <vprintfmt+0x3de>
  800493: 48 89 c8                     	movq	%rcx, %rax
  800496: 48 03 45 c0                  	addq	-64(%rbp), %rax
  80049a: 83 c1 08                     	addl	$8, %ecx
  80049d: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8004a0: e9 a5 01 00 00               	jmp	0x80064a <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  8004a5: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8004a9: e8 82 02 00 00               	callq	0x800730 <getint>
  8004ae: 49 89 c4                     	movq	%rax, %r12
  8004b1: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  8004b7: 48 85 c0                     	testq	%rax, %rax
  8004ba: 0f 89 ed fd ff ff            	jns	0x8002ad <vprintfmt+0x4d>
; 				putch('-', putdat);
  8004c0: bf 2d 00 00 00               	movl	$45, %edi
  8004c5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  8004c9: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  8004cc: 49 f7 dc                     	negq	%r12
  8004cf: e9 d9 fd ff ff               	jmp	0x8002ad <vprintfmt+0x4d>
; 			putch('0', putdat);
  8004d4: bf 30 00 00 00               	movl	$48, %edi
  8004d9: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  8004dd: 4c 89 fe                     	movq	%r15, %rsi
  8004e0: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  8004e4: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  8004e7: bf 78 00 00 00               	movl	$120, %edi
  8004ec: 4c 89 fe                     	movq	%r15, %rsi
  8004ef: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  8004f2: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8004f6: 48 83 f9 28                  	cmpq	$40, %rcx
  8004fa: 0f 87 5d 01 00 00            	ja	0x80065d <vprintfmt+0x3fd>
  800500: 48 89 c8                     	movq	%rcx, %rax
  800503: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800507: 83 c1 08                     	addl	$8, %ecx
  80050a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80050d: 4c 8b 20                     	movq	(%rax), %r12
  800510: e9 92 fd ff ff               	jmp	0x8002a7 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800515: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800519: e8 92 02 00 00               	callq	0x8007b0 <getuint>
  80051e: 49 89 c4                     	movq	%rax, %r12
  800521: 41 bf 0a 00 00 00            	movl	$10, %r15d
  800527: e9 81 fd ff ff               	jmp	0x8002ad <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  80052c: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800530: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800534: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800538: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  80053c: 48 83 c3 01                  	addq	$1, %rbx
  800540: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  800542: 89 c1                        	movl	%eax, %ecx
  800544: f7 d9                        	negl	%ecx
  800546: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800549: 83 f9 08                     	cmpl	$8, %ecx
  80054c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800550: 77 0d                        	ja	0x80055f <vprintfmt+0x2ff>
  800552: 83 f9 03                     	cmpl	$3, %ecx
  800555: 74 08                        	je	0x80055f <vprintfmt+0x2ff>
  800557: 85 c9                        	testl	%ecx, %ecx
  800559: 0f 85 4b 01 00 00            	jne	0x8006aa <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  80055f: 4c 89 ff                     	movq	%r15, %rdi
  800562: 4c 89 f6                     	movq	%r14, %rsi
  800565: 48 8d 15 3a 0b 00 00         	leaq	2874(%rip), %rdx        # 0x8010a6 <syscall.c+0x8010a6>
  80056c: 31 c0                        	xorl	%eax, %eax
  80056e: e8 6d 01 00 00               	callq	0x8006e0 <printfmt>
  800573: e9 59 fd ff ff               	jmp	0x8002d1 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800578: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  80057c: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800580: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800584: 4c 8b 20                     	movq	(%rax), %r12
  800587: 4d 85 e4                     	testq	%r12, %r12
  80058a: 48 8d 05 31 0b 00 00         	leaq	2865(%rip), %rax        # 0x8010c2 <syscall.c+0x8010c2>
  800591: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  800595: 45 85 f6                     	testl	%r14d, %r14d
  800598: 7e 4f                        	jle	0x8005e9 <vprintfmt+0x389>
  80059a: 41 80 fd 2d                  	cmpb	$45, %r13b
  80059e: 74 49                        	je	0x8005e9 <vprintfmt+0x389>
  8005a0: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8005a4: 49 63 f7                     	movslq	%r15d, %rsi
  8005a7: 4c 89 e7                     	movq	%r12, %rdi
  8005aa: e8 01 04 00 00               	callq	0x8009b0 <strnlen>
  8005af: 45 89 f5                     	movl	%r14d, %r13d
  8005b2: 41 29 c5                     	subl	%eax, %r13d
  8005b5: 7e 35                        	jle	0x8005ec <vprintfmt+0x38c>
  8005b7: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  8005bb: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8005be: 41 29 c6                     	subl	%eax, %r14d
  8005c1: 41 83 c6 01                  	addl	$1, %r14d
  8005c5: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  8005c9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8005d0: 8b 7d ac                     	movl	-84(%rbp), %edi
  8005d3: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  8005d7: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8005da: 41 83 c6 ff                  	addl	$-1, %r14d
  8005de: 41 83 fe 01                  	cmpl	$1, %r14d
  8005e2: 7f ec                        	jg	0x8005d0 <vprintfmt+0x370>
  8005e4: 45 31 ed                     	xorl	%r13d, %r13d
  8005e7: eb 03                        	jmp	0x8005ec <vprintfmt+0x38c>
  8005e9: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8005ec: 41 8a 04 24                  	movb	(%r12), %al
  8005f0: 84 c0                        	testb	%al, %al
  8005f2: 74 7d                        	je	0x800671 <vprintfmt+0x411>
  8005f4: 49 83 c4 01                  	addq	$1, %r12
  8005f8: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8005fc: eb 33                        	jmp	0x800631 <vprintfmt+0x3d1>
  8005fe: 66 90                        	nop
  800600: 0f be c0                     	movsbl	%al, %eax
  800603: 8d 48 81                     	leal	-127(%rax), %ecx
  800606: 80 f9 a1                     	cmpb	$-95, %cl
  800609: 89 c7                        	movl	%eax, %edi
  80060b: b9 3f 00 00 00               	movl	$63, %ecx
  800610: 0f 42 f9                     	cmovbl	%ecx, %edi
  800613: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800617: 0f 44 f8                     	cmovel	%eax, %edi
  80061a: 4c 89 f6                     	movq	%r14, %rsi
  80061d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  800620: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800624: 41 0f b6 04 24               	movzbl	(%r12), %eax
  800629: 49 83 c4 01                  	addq	$1, %r12
  80062d: 84 c0                        	testb	%al, %al
  80062f: 74 44                        	je	0x800675 <vprintfmt+0x415>
  800631: 45 85 ff                     	testl	%r15d, %r15d
  800634: 78 ca                        	js	0x800600 <vprintfmt+0x3a0>
  800636: 41 83 ef 01                  	subl	$1, %r15d
  80063a: 73 c4                        	jae	0x800600 <vprintfmt+0x3a0>
  80063c: eb 37                        	jmp	0x800675 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  80063e: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800642: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800646: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80064a: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80064e: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  800652: 48 83 c3 01                  	addq	$1, %rbx
  800656: 8b 38                        	movl	(%rax), %edi
  800658: e9 89 fc ff ff               	jmp	0x8002e6 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  80065d: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800661: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800665: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800669: 4c 8b 20                     	movq	(%rax), %r12
  80066c: e9 36 fc ff ff               	jmp	0x8002a7 <vprintfmt+0x47>
  800671: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800675: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  800679: 45 85 ed                     	testl	%r13d, %r13d
  80067c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800680: 0f 8e 4b fc ff ff            	jle	0x8002d1 <vprintfmt+0x71>
; 	while (1) {
  800686: 41 83 c5 01                  	addl	$1, %r13d
  80068a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  800690: bf 20 00 00 00               	movl	$32, %edi
  800695: 4c 89 f6                     	movq	%r14, %rsi
  800698: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  80069b: 41 83 c5 ff                  	addl	$-1, %r13d
  80069f: 41 83 fd 01                  	cmpl	$1, %r13d
  8006a3: 7f eb                        	jg	0x800690 <vprintfmt+0x430>
  8006a5: e9 27 fc ff ff               	jmp	0x8002d1 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8006aa: 89 c8                        	movl	%ecx, %eax
  8006ac: 48 8d 0d 6d f9 9f ff         	leaq	-6293139(%rip), %rcx    # 0x200020 <error_string>
  8006b3: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  8006b7: 4c 89 ff                     	movq	%r15, %rdi
  8006ba: 4c 89 f6                     	movq	%r14, %rsi
  8006bd: 48 8d 15 64 09 00 00         	leaq	2404(%rip), %rdx        # 0x801028 <syscall.c+0x801028>
  8006c4: 31 c0                        	xorl	%eax, %eax
  8006c6: e8 15 00 00 00               	callq	0x8006e0 <printfmt>
  8006cb: e9 01 fc ff ff               	jmp	0x8002d1 <vprintfmt+0x71>
; }
  8006d0: 48 83 c4 38                  	addq	$56, %rsp
  8006d4: 5b                           	popq	%rbx
  8006d5: 41 5c                        	popq	%r12
  8006d7: 41 5d                        	popq	%r13
  8006d9: 41 5e                        	popq	%r14
  8006db: 41 5f                        	popq	%r15
  8006dd: 5d                           	popq	%rbp
  8006de: c3                           	retq
  8006df: 90                           	nop

00000000008006e0 <printfmt>:
; {
  8006e0: 55                           	pushq	%rbp
  8006e1: 48 89 e5                     	movq	%rsp, %rbp
  8006e4: 48 83 ec 50                  	subq	$80, %rsp
  8006e8: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8006ec: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8006f0: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8006f4: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8006f8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8006fc: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800700: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800704: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80070e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800712: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800716: e8 45 fb ff ff               	callq	0x800260 <vprintfmt>
; }
  80071b: 48 83 c4 50                  	addq	$80, %rsp
  80071f: 5d                           	popq	%rbp
  800720: c3                           	retq
  800721: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80072b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800730 <getint>:
; {
  800730: 55                           	pushq	%rbp
  800731: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800734: 83 fe 02                     	cmpl	$2, %esi
  800737: 7c 17                        	jl	0x800750 <getint+0x20>
; 		return va_arg(*ap, long long);
  800739: 48 63 07                     	movslq	(%rdi), %rax
  80073c: 48 83 f8 28                  	cmpq	$40, %rax
  800740: 77 2b                        	ja	0x80076d <getint+0x3d>
  800742: 48 89 c1                     	movq	%rax, %rcx
  800745: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800749: 83 c0 08                     	addl	$8, %eax
  80074c: 89 07                        	movl	%eax, (%rdi)
  80074e: eb 18                        	jmp	0x800768 <getint+0x38>
  800750: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800753: 85 f6                        	testl	%esi, %esi
  800755: 74 27                        	je	0x80077e <getint+0x4e>
  800757: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  80075a: 77 11                        	ja	0x80076d <getint+0x3d>
  80075c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  800760: 48 01 c1                     	addq	%rax, %rcx
  800763: 83 c0 08                     	addl	$8, %eax
  800766: 89 07                        	movl	%eax, (%rdi)
  800768: 48 8b 01                     	movq	(%rcx), %rax
; }
  80076b: 5d                           	popq	%rbp
  80076c: c3                           	retq
  80076d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800771: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800775: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800779: 48 8b 00                     	movq	(%rax), %rax
; }
  80077c: 5d                           	popq	%rbp
  80077d: c3                           	retq
  80077e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  800781: 77 0e                        	ja	0x800791 <getint+0x61>
  800783: 48 89 c1                     	movq	%rax, %rcx
  800786: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80078a: 83 c0 08                     	addl	$8, %eax
  80078d: 89 07                        	movl	%eax, (%rdi)
  80078f: eb 0c                        	jmp	0x80079d <getint+0x6d>
  800791: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800795: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800799: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80079d: 48 63 01                     	movslq	(%rcx), %rax
; }
  8007a0: 5d                           	popq	%rbp
  8007a1: c3                           	retq
  8007a2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8007ac: 0f 1f 40 00                  	nopl	(%rax)

00000000008007b0 <getuint>:
; {
  8007b0: 55                           	pushq	%rbp
  8007b1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8007b4: 83 fe 02                     	cmpl	$2, %esi
  8007b7: 7c 17                        	jl	0x8007d0 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  8007b9: 48 63 07                     	movslq	(%rdi), %rax
  8007bc: 48 83 f8 28                  	cmpq	$40, %rax
  8007c0: 77 2b                        	ja	0x8007ed <getuint+0x3d>
  8007c2: 48 89 c1                     	movq	%rax, %rcx
  8007c5: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8007c9: 83 c0 08                     	addl	$8, %eax
  8007cc: 89 07                        	movl	%eax, (%rdi)
  8007ce: eb 18                        	jmp	0x8007e8 <getuint+0x38>
  8007d0: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  8007d3: 85 f6                        	testl	%esi, %esi
  8007d5: 74 27                        	je	0x8007fe <getuint+0x4e>
  8007d7: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  8007da: 77 11                        	ja	0x8007ed <getuint+0x3d>
  8007dc: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  8007e0: 48 01 c1                     	addq	%rax, %rcx
  8007e3: 83 c0 08                     	addl	$8, %eax
  8007e6: 89 07                        	movl	%eax, (%rdi)
  8007e8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8007eb: 5d                           	popq	%rbp
  8007ec: c3                           	retq
  8007ed: 48 8b 47 08                  	movq	8(%rdi), %rax
  8007f1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8007f5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8007f9: 48 8b 00                     	movq	(%rax), %rax
; }
  8007fc: 5d                           	popq	%rbp
  8007fd: c3                           	retq
  8007fe: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800801: 77 0e                        	ja	0x800811 <getuint+0x61>
  800803: 48 89 c1                     	movq	%rax, %rcx
  800806: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80080a: 83 c0 08                     	addl	$8, %eax
  80080d: 89 07                        	movl	%eax, (%rdi)
  80080f: eb 0c                        	jmp	0x80081d <getuint+0x6d>
  800811: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800815: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800819: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80081d: 8b 01                        	movl	(%rcx), %eax
; }
  80081f: 5d                           	popq	%rbp
  800820: c3                           	retq
  800821: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80082b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800830 <printnum>:
; {
  800830: 55                           	pushq	%rbp
  800831: 48 89 e5                     	movq	%rsp, %rbp
  800834: 41 57                        	pushq	%r15
  800836: 41 56                        	pushq	%r14
  800838: 41 55                        	pushq	%r13
  80083a: 41 54                        	pushq	%r12
  80083c: 53                           	pushq	%rbx
  80083d: 50                           	pushq	%rax
  80083e: 45 89 cd                     	movl	%r9d, %r13d
  800841: 44 89 c3                     	movl	%r8d, %ebx
  800844: 49 89 f6                     	movq	%rsi, %r14
  800847: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  80084a: 41 89 cf                     	movl	%ecx, %r15d
  80084d: 49 39 d7                     	cmpq	%rdx, %r15
  800850: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  800854: 76 1d                        	jbe	0x800873 <printnum+0x43>
; 		while (--width > 0)
  800856: 83 fb 02                     	cmpl	$2, %ebx
  800859: 7c 37                        	jl	0x800892 <printnum+0x62>
  80085b: 83 c3 01                     	addl	$1, %ebx
  80085e: 66 90                        	nop
; 			putch(padc, putdat);
  800860: 44 89 ef                     	movl	%r13d, %edi
  800863: 4c 89 f6                     	movq	%r14, %rsi
  800866: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  800869: 83 c3 ff                     	addl	$-1, %ebx
  80086c: 83 fb 02                     	cmpl	$2, %ebx
  80086f: 7f ef                        	jg	0x800860 <printnum+0x30>
  800871: eb 1f                        	jmp	0x800892 <printnum+0x62>
  800873: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800876: 31 d2                        	xorl	%edx, %edx
  800878: 49 f7 f7                     	divq	%r15
  80087b: 83 c3 ff                     	addl	$-1, %ebx
  80087e: 4c 89 e7                     	movq	%r12, %rdi
  800881: 4c 89 f6                     	movq	%r14, %rsi
  800884: 48 89 c2                     	movq	%rax, %rdx
  800887: 41 89 d8                     	movl	%ebx, %r8d
  80088a: 45 89 e9                     	movl	%r13d, %r9d
  80088d: e8 9e ff ff ff               	callq	0x800830 <printnum>
  800892: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  800896: 31 d2                        	xorl	%edx, %edx
  800898: 49 f7 f7                     	divq	%r15
  80089b: 48 8d 05 0d 08 00 00         	leaq	2061(%rip), %rax        # 0x8010af <syscall.c+0x8010af>
  8008a2: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  8008a6: 4c 89 f6                     	movq	%r14, %rsi
  8008a9: 41 ff d4                     	callq	*%r12
; }
  8008ac: 48 83 c4 08                  	addq	$8, %rsp
  8008b0: 5b                           	popq	%rbx
  8008b1: 41 5c                        	popq	%r12
  8008b3: 41 5d                        	popq	%r13
  8008b5: 41 5e                        	popq	%r14
  8008b7: 41 5f                        	popq	%r15
  8008b9: 5d                           	popq	%rbp
  8008ba: c3                           	retq
  8008bb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008c0 <vsnprintf>:
; {
  8008c0: 55                           	pushq	%rbp
  8008c1: 48 89 e5                     	movq	%rsp, %rbp
  8008c4: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  8008c8: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  8008cc: 48 63 c6                     	movslq	%esi, %rax
  8008cf: 48 01 f8                     	addq	%rdi, %rax
  8008d2: 48 83 c0 ff                  	addq	$-1, %rax
  8008d6: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8008da: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  8008e1: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  8008e6: 48 85 ff                     	testq	%rdi, %rdi
  8008e9: 74 1e                        	je	0x800909 <vsnprintf+0x49>
  8008eb: 85 f6                        	testl	%esi, %esi
  8008ed: 7e 1a                        	jle	0x800909 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  8008ef: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800910 <sprintputch>
  8008f6: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  8008fa: e8 61 f9 ff ff               	callq	0x800260 <vprintfmt>
; 	*b.buf = '\0';
  8008ff: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800903: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800906: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800909: 48 83 c4 20                  	addq	$32, %rsp
  80090d: 5d                           	popq	%rbp
  80090e: c3                           	retq
  80090f: 90                           	nop

0000000000800910 <sprintputch>:
; {
  800910: 55                           	pushq	%rbp
  800911: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800914: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800918: 48 8b 06                     	movq	(%rsi), %rax
  80091b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80091f: 73 0a                        	jae	0x80092b <sprintputch+0x1b>
; 		*b->buf++ = ch;
  800921: 48 8d 48 01                  	leaq	1(%rax), %rcx
  800925: 48 89 0e                     	movq	%rcx, (%rsi)
  800928: 40 88 38                     	movb	%dil, (%rax)
; }
  80092b: 5d                           	popq	%rbp
  80092c: c3                           	retq
  80092d: 0f 1f 00                     	nopl	(%rax)

0000000000800930 <snprintf>:
; {
  800930: 55                           	pushq	%rbp
  800931: 48 89 e5                     	movq	%rsp, %rbp
  800934: 48 83 ec 50                  	subq	$80, %rsp
  800938: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80093c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800940: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800944: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800948: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80094c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800950: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800954: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80095e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800962: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  800966: e8 55 ff ff ff               	callq	0x8008c0 <vsnprintf>
; 	return rc;
  80096b: 48 83 c4 50                  	addq	$80, %rsp
  80096f: 5d                           	popq	%rbp
  800970: c3                           	retq
  800971: cc                           	int3
  800972: cc                           	int3
  800973: cc                           	int3
  800974: cc                           	int3
  800975: cc                           	int3
  800976: cc                           	int3
  800977: cc                           	int3
  800978: cc                           	int3
  800979: cc                           	int3
  80097a: cc                           	int3
  80097b: cc                           	int3
  80097c: cc                           	int3
  80097d: cc                           	int3
  80097e: cc                           	int3
  80097f: cc                           	int3

0000000000800980 <strlen>:
; {
  800980: 55                           	pushq	%rbp
  800981: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  800984: 80 3f 00                     	cmpb	$0, (%rdi)
  800987: 74 14                        	je	0x80099d <strlen+0x1d>
  800989: 31 c0                        	xorl	%eax, %eax
  80098b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  800990: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  800995: 48 8d 40 01                  	leaq	1(%rax), %rax
  800999: 75 f5                        	jne	0x800990 <strlen+0x10>
; 	return n;
  80099b: 5d                           	popq	%rbp
  80099c: c3                           	retq
  80099d: 31 c0                        	xorl	%eax, %eax
; 	return n;
  80099f: 5d                           	popq	%rbp
  8009a0: c3                           	retq
  8009a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8009ab: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008009b0 <strnlen>:
; {
  8009b0: 55                           	pushq	%rbp
  8009b1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8009b4: 48 85 f6                     	testq	%rsi, %rsi
  8009b7: 74 18                        	je	0x8009d1 <strnlen+0x21>
  8009b9: 48 89 f0                     	movq	%rsi, %rax
  8009bc: 31 c9                        	xorl	%ecx, %ecx
  8009be: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8009c0: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  8009c4: 74 0f                        	je	0x8009d5 <strnlen+0x25>
  8009c6: 48 83 c1 01                  	addq	$1, %rcx
  8009ca: 48 39 c8                     	cmpq	%rcx, %rax
  8009cd: 75 f1                        	jne	0x8009c0 <strnlen+0x10>
; 	return n;
  8009cf: 5d                           	popq	%rbp
  8009d0: c3                           	retq
  8009d1: 31 c0                        	xorl	%eax, %eax
; 	return n;
  8009d3: 5d                           	popq	%rbp
  8009d4: c3                           	retq
  8009d5: 89 c8                        	movl	%ecx, %eax
; 	return n;
  8009d7: 5d                           	popq	%rbp
  8009d8: c3                           	retq
  8009d9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008009e0 <strcpy>:
; {
  8009e0: 55                           	pushq	%rbp
  8009e1: 48 89 e5                     	movq	%rsp, %rbp
  8009e4: 48 89 f8                     	movq	%rdi, %rax
  8009e7: 31 c9                        	xorl	%ecx, %ecx
  8009e9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  8009f0: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  8009f4: 88 14 08                     	movb	%dl, (%rax,%rcx)
  8009f7: 48 83 c1 01                  	addq	$1, %rcx
  8009fb: 84 d2                        	testb	%dl, %dl
  8009fd: 75 f1                        	jne	0x8009f0 <strcpy+0x10>
; 	return ret;
  8009ff: 5d                           	popq	%rbp
  800a00: c3                           	retq
  800a01: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a0b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a10 <strcat>:
; {
  800a10: 55                           	pushq	%rbp
  800a11: 48 89 e5                     	movq	%rsp, %rbp
  800a14: 41 56                        	pushq	%r14
  800a16: 53                           	pushq	%rbx
  800a17: 49 89 f6                     	movq	%rsi, %r14
  800a1a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  800a1d: e8 5e ff ff ff               	callq	0x800980 <strlen>
; 	strcpy(dst + len, src);
  800a22: 48 63 f8                     	movslq	%eax, %rdi
  800a25: 48 01 df                     	addq	%rbx, %rdi
  800a28: 4c 89 f6                     	movq	%r14, %rsi
  800a2b: e8 b0 ff ff ff               	callq	0x8009e0 <strcpy>
; 	return dst;
  800a30: 48 89 d8                     	movq	%rbx, %rax
  800a33: 5b                           	popq	%rbx
  800a34: 41 5e                        	popq	%r14
  800a36: 5d                           	popq	%rbp
  800a37: c3                           	retq
  800a38: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800a40 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800a40: 55                           	pushq	%rbp
  800a41: 48 89 e5                     	movq	%rsp, %rbp
  800a44: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800a47: 48 85 d2                     	testq	%rdx, %rdx
  800a4a: 74 1a                        	je	0x800a66 <strncpy+0x26>
  800a4c: 31 ff                        	xorl	%edi, %edi
  800a4e: 66 90                        	nop
; 		*dst++ = *src;
  800a50: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800a53: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800a56: 80 3e 01                     	cmpb	$1, (%rsi)
  800a59: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  800a5d: 48 83 c7 01                  	addq	$1, %rdi
  800a61: 48 39 fa                     	cmpq	%rdi, %rdx
  800a64: 75 ea                        	jne	0x800a50 <strncpy+0x10>
; 	return ret;
  800a66: 5d                           	popq	%rbp
  800a67: c3                           	retq
  800a68: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800a70 <strlcpy>:
; {
  800a70: 55                           	pushq	%rbp
  800a71: 48 89 e5                     	movq	%rsp, %rbp
  800a74: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  800a77: 48 85 d2                     	testq	%rdx, %rdx
  800a7a: 74 2e                        	je	0x800aaa <strlcpy+0x3a>
  800a7c: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  800a7f: 48 83 c2 ff                  	addq	$-1, %rdx
  800a83: 74 22                        	je	0x800aa7 <strlcpy+0x37>
  800a85: 31 c0                        	xorl	%eax, %eax
  800a87: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  800a90: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  800a94: 84 c9                        	testb	%cl, %cl
  800a96: 74 0c                        	je	0x800aa4 <strlcpy+0x34>
; 			*dst++ = *src++;
  800a98: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  800a9b: 48 83 c0 01                  	addq	$1, %rax
  800a9f: 48 39 c2                     	cmpq	%rax, %rdx
  800aa2: 75 ec                        	jne	0x800a90 <strlcpy+0x20>
  800aa4: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  800aa7: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  800aaa: 48 29 f8                     	subq	%rdi, %rax
  800aad: 5d                           	popq	%rbp
  800aae: c3                           	retq
  800aaf: 90                           	nop

0000000000800ab0 <strcmp>:
; {
  800ab0: 55                           	pushq	%rbp
  800ab1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  800ab4: 8a 07                        	movb	(%rdi), %al
  800ab6: 84 c0                        	testb	%al, %al
  800ab8: 74 19                        	je	0x800ad3 <strcmp+0x23>
  800aba: 48 83 c7 01                  	addq	$1, %rdi
  800abe: 66 90                        	nop
  800ac0: 3a 06                        	cmpb	(%rsi), %al
  800ac2: 75 0f                        	jne	0x800ad3 <strcmp+0x23>
; 		p++, q++;
  800ac4: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800ac8: 0f b6 07                     	movzbl	(%rdi), %eax
  800acb: 48 83 c7 01                  	addq	$1, %rdi
  800acf: 84 c0                        	testb	%al, %al
  800ad1: 75 ed                        	jne	0x800ac0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800ad3: 0f b6 c0                     	movzbl	%al, %eax
  800ad6: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800ad9: 29 c8                        	subl	%ecx, %eax
  800adb: 5d                           	popq	%rbp
  800adc: c3                           	retq
  800add: 0f 1f 00                     	nopl	(%rax)

0000000000800ae0 <strncmp>:
; {
  800ae0: 55                           	pushq	%rbp
  800ae1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800ae4: 48 85 d2                     	testq	%rdx, %rdx
  800ae7: 74 1d                        	je	0x800b06 <strncmp+0x26>
  800ae9: 31 c9                        	xorl	%ecx, %ecx
  800aeb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800af0: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800af4: 85 c0                        	testl	%eax, %eax
  800af6: 74 12                        	je	0x800b0a <strncmp+0x2a>
  800af8: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800afb: 75 0d                        	jne	0x800b0a <strncmp+0x2a>
  800afd: 48 83 c1 01                  	addq	$1, %rcx
  800b01: 48 39 ca                     	cmpq	%rcx, %rdx
  800b04: 75 ea                        	jne	0x800af0 <strncmp+0x10>
  800b06: 31 c0                        	xorl	%eax, %eax
; }
  800b08: 5d                           	popq	%rbp
  800b09: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800b0a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800b0e: 29 c8                        	subl	%ecx, %eax
; }
  800b10: 5d                           	popq	%rbp
  800b11: c3                           	retq
  800b12: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b1c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800b20 <strchr>:
; {
  800b20: 55                           	pushq	%rbp
  800b21: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800b24: 8a 0f                        	movb	(%rdi), %cl
  800b26: 84 c9                        	testb	%cl, %cl
  800b28: 74 17                        	je	0x800b41 <strchr+0x21>
  800b2a: 48 89 f8                     	movq	%rdi, %rax
  800b2d: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800b30: 40 38 f1                     	cmpb	%sil, %cl
  800b33: 74 0e                        	je	0x800b43 <strchr+0x23>
; 	for (; *s; s++)
  800b35: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800b39: 48 83 c0 01                  	addq	$1, %rax
  800b3d: 84 c9                        	testb	%cl, %cl
  800b3f: 75 ef                        	jne	0x800b30 <strchr+0x10>
  800b41: 31 c0                        	xorl	%eax, %eax
; }
  800b43: 5d                           	popq	%rbp
  800b44: c3                           	retq
  800b45: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b4f: 90                           	nop

0000000000800b50 <strfind>:
; {
  800b50: 55                           	pushq	%rbp
  800b51: 48 89 e5                     	movq	%rsp, %rbp
  800b54: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800b57: 48 83 c0 ff                  	addq	$-1, %rax
  800b5b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800b60: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800b64: 48 83 c0 01                  	addq	$1, %rax
  800b68: 84 c9                        	testb	%cl, %cl
  800b6a: 74 05                        	je	0x800b71 <strfind+0x21>
  800b6c: 40 38 f1                     	cmpb	%sil, %cl
  800b6f: 75 ef                        	jne	0x800b60 <strfind+0x10>
; 	return (char *) s;
  800b71: 5d                           	popq	%rbp
  800b72: c3                           	retq
  800b73: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b7d: 0f 1f 00                     	nopl	(%rax)

0000000000800b80 <memset>:
; {
  800b80: 55                           	pushq	%rbp
  800b81: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800b84: 48 85 d2                     	testq	%rdx, %rdx
  800b87: 74 36                        	je	0x800bbf <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800b89: 89 f8                        	movl	%edi, %eax
  800b8b: 09 d0                        	orl	%edx, %eax
  800b8d: a8 03                        	testb	$3, %al
  800b8f: 74 0a                        	je	0x800b9b <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800b91: 89 f0                        	movl	%esi, %eax
  800b93: 48 89 d1                     	movq	%rdx, %rcx
  800b96: fc                           	cld
  800b97: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800b99: eb 24                        	jmp	0x800bbf <memset+0x3f>
; 		c &= 0xFF;
  800b9b: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800b9f: c1 e6 18                     	shll	$24, %esi
  800ba2: 44 89 c1                     	movl	%r8d, %ecx
  800ba5: c1 e1 10                     	shll	$16, %ecx
  800ba8: 09 f1                        	orl	%esi, %ecx
  800baa: 44 89 c0                     	movl	%r8d, %eax
  800bad: c1 e0 08                     	shll	$8, %eax
  800bb0: 09 c8                        	orl	%ecx, %eax
  800bb2: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800bb5: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800bb9: 48 89 d1                     	movq	%rdx, %rcx
  800bbc: fc                           	cld
  800bbd: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800bbf: 48 89 f8                     	movq	%rdi, %rax
  800bc2: 5d                           	popq	%rbp
  800bc3: c3                           	retq
  800bc4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bce: 66 90                        	nop

0000000000800bd0 <memmove>:
; {
  800bd0: 55                           	pushq	%rbp
  800bd1: 48 89 e5                     	movq	%rsp, %rbp
  800bd4: 48 89 d1                     	movq	%rdx, %rcx
  800bd7: 48 89 f2                     	movq	%rsi, %rdx
  800bda: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800bdd: 48 39 fe                     	cmpq	%rdi, %rsi
  800be0: 73 38                        	jae	0x800c1a <memmove+0x4a>
  800be2: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800be6: 48 39 c6                     	cmpq	%rax, %rsi
  800be9: 76 2f                        	jbe	0x800c1a <memmove+0x4a>
; 		d += n;
  800beb: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800bef: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800bf2: 75 4e                        	jne	0x800c42 <memmove+0x72>
  800bf4: 89 f2                        	movl	%esi, %edx
  800bf6: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800bf9: 48 85 d2                     	testq	%rdx, %rdx
  800bfc: 75 44                        	jne	0x800c42 <memmove+0x72>
  800bfe: 89 fa                        	movl	%edi, %edx
  800c00: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c03: 48 85 d2                     	testq	%rdx, %rdx
  800c06: 75 3a                        	jne	0x800c42 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800c08: 48 83 c7 fc                  	addq	$-4, %rdi
  800c0c: 48 83 c6 fc                  	addq	$-4, %rsi
  800c10: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800c14: fd                           	std
  800c15: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800c17: fc                           	cld
; 	return dst;
  800c18: 5d                           	popq	%rbp
  800c19: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c1a: 89 d6                        	movl	%edx, %esi
  800c1c: 09 c6                        	orl	%eax, %esi
  800c1e: 89 cf                        	movl	%ecx, %edi
  800c20: 09 f7                        	orl	%esi, %edi
  800c22: 40 f6 c7 03                  	testb	$3, %dil
  800c26: 74 0b                        	je	0x800c33 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800c28: 48 89 c7                     	movq	%rax, %rdi
  800c2b: 48 89 d6                     	movq	%rdx, %rsi
  800c2e: fc                           	cld
  800c2f: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800c31: 5d                           	popq	%rbp
  800c32: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800c33: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800c37: 48 89 c7                     	movq	%rax, %rdi
  800c3a: 48 89 d6                     	movq	%rdx, %rsi
  800c3d: fc                           	cld
  800c3e: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800c40: 5d                           	popq	%rbp
  800c41: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800c42: 48 83 c7 ff                  	addq	$-1, %rdi
  800c46: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800c4a: fd                           	std
  800c4b: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800c4d: fc                           	cld
; 	return dst;
  800c4e: 5d                           	popq	%rbp
  800c4f: c3                           	retq

0000000000800c50 <memcpy>:
; {
  800c50: 55                           	pushq	%rbp
  800c51: 48 89 e5                     	movq	%rsp, %rbp
  800c54: 53                           	pushq	%rbx
  800c55: 50                           	pushq	%rax
  800c56: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800c59: e8 72 ff ff ff               	callq	0x800bd0 <memmove>
  800c5e: 48 89 d8                     	movq	%rbx, %rax
  800c61: 48 83 c4 08                  	addq	$8, %rsp
  800c65: 5b                           	popq	%rbx
  800c66: 5d                           	popq	%rbp
  800c67: c3                           	retq
  800c68: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800c70 <memcmp>:
; {
  800c70: 55                           	pushq	%rbp
  800c71: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800c74: 48 85 d2                     	testq	%rdx, %rdx
  800c77: 74 1e                        	je	0x800c97 <memcmp+0x27>
  800c79: 31 c9                        	xorl	%ecx, %ecx
  800c7b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800c80: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800c84: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800c89: 44 38 c0                     	cmpb	%r8b, %al
  800c8c: 75 0d                        	jne	0x800c9b <memcmp+0x2b>
; 	while (n-- > 0) {
  800c8e: 48 83 c1 01                  	addq	$1, %rcx
  800c92: 48 39 ca                     	cmpq	%rcx, %rdx
  800c95: 75 e9                        	jne	0x800c80 <memcmp+0x10>
  800c97: 31 c0                        	xorl	%eax, %eax
; }
  800c99: 5d                           	popq	%rbp
  800c9a: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800c9b: 44 29 c0                     	subl	%r8d, %eax
; }
  800c9e: 5d                           	popq	%rbp
  800c9f: c3                           	retq

0000000000800ca0 <memfind>:
; {
  800ca0: 55                           	pushq	%rbp
  800ca1: 48 89 e5                     	movq	%rsp, %rbp
  800ca4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800ca7: 48 85 d2                     	testq	%rdx, %rdx
  800caa: 7e 12                        	jle	0x800cbe <memfind+0x1e>
  800cac: 48 01 c2                     	addq	%rax, %rdx
  800caf: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800cb0: 40 38 30                     	cmpb	%sil, (%rax)
  800cb3: 74 09                        	je	0x800cbe <memfind+0x1e>
; 	for (; s < ends; s++)
  800cb5: 48 83 c0 01                  	addq	$1, %rax
  800cb9: 48 39 d0                     	cmpq	%rdx, %rax
  800cbc: 72 f2                        	jb	0x800cb0 <memfind+0x10>
; 	return (void *) s;
  800cbe: 5d                           	popq	%rbp
  800cbf: c3                           	retq

0000000000800cc0 <strtol>:
; {
  800cc0: 55                           	pushq	%rbp
  800cc1: 48 89 e5                     	movq	%rsp, %rbp
  800cc4: 48 8d 05 9d 05 00 00         	leaq	1437(%rip), %rax        # 0x801268 <syscall.c+0x801268>
  800ccb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800cd0: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800cd3: 80 c1 f7                     	addb	$-9, %cl
  800cd6: 80 f9 24                     	cmpb	$36, %cl
  800cd9: 77 16                        	ja	0x800cf1 <strtol+0x31>
  800cdb: 0f b6 c9                     	movzbl	%cl, %ecx
  800cde: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800ce2: 48 01 c1                     	addq	%rax, %rcx
  800ce5: ff e1                        	jmpq	*%rcx
; 		s++;
  800ce7: 48 83 c7 01                  	addq	$1, %rdi
  800ceb: eb e3                        	jmp	0x800cd0 <strtol+0x10>
; 		s++;
  800ced: 48 83 c7 01                  	addq	$1, %rdi
  800cf1: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800cf4: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800cfa: 75 27                        	jne	0x800d23 <strtol+0x63>
  800cfc: eb 0f                        	jmp	0x800d0d <strtol+0x4d>
; 		s++, neg = 1;
  800cfe: 48 83 c7 01                  	addq	$1, %rdi
  800d02: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d05: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800d0b: 75 16                        	jne	0x800d23 <strtol+0x63>
  800d0d: 80 3f 30                     	cmpb	$48, (%rdi)
  800d10: 75 11                        	jne	0x800d23 <strtol+0x63>
  800d12: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800d16: 75 0b                        	jne	0x800d23 <strtol+0x63>
; 		s += 2, base = 16;
  800d18: 48 83 c7 02                  	addq	$2, %rdi
  800d1c: ba 10 00 00 00               	movl	$16, %edx
  800d21: eb 1a                        	jmp	0x800d3d <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d23: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800d25: 75 16                        	jne	0x800d3d <strtol+0x7d>
  800d27: 31 c0                        	xorl	%eax, %eax
  800d29: 31 c9                        	xorl	%ecx, %ecx
  800d2b: 80 3f 30                     	cmpb	$48, (%rdi)
  800d2e: 0f 95 c0                     	setne	%al
  800d31: 0f 94 c1                     	sete	%cl
  800d34: 48 01 cf                     	addq	%rcx, %rdi
  800d37: 8d 14 00                     	leal	(%rax,%rax), %edx
  800d3a: 83 c2 08                     	addl	$8, %edx
  800d3d: 4c 63 ca                     	movslq	%edx, %r9
  800d40: 45 31 d2                     	xorl	%r10d, %r10d
  800d43: eb 2f                        	jmp	0x800d74 <strtol+0xb4>
  800d45: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800d4f: 90                           	nop
  800d50: 31 c0                        	xorl	%eax, %eax
  800d52: 84 c0                        	testb	%al, %al
  800d54: 75 1e                        	jne	0x800d74 <strtol+0xb4>
  800d56: eb 51                        	jmp	0x800da9 <strtol+0xe9>
  800d58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800d60: 48 83 c7 01                  	addq	$1, %rdi
  800d64: 4d 0f af d1                  	imulq	%r9, %r10
  800d68: 48 63 c1                     	movslq	%ecx, %rax
  800d6b: 49 01 c2                     	addq	%rax, %r10
  800d6e: b0 01                        	movb	$1, %al
  800d70: 84 c0                        	testb	%al, %al
  800d72: 74 35                        	je	0x800da9 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800d74: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800d78: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800d7c: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800d81: 3c 0a                        	cmpb	$10, %al
  800d83: 72 1b                        	jb	0x800da0 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800d85: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800d89: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800d8e: 3c 1a                        	cmpb	$26, %al
  800d90: 72 0e                        	jb	0x800da0 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800d92: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800d96: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800d9b: 3c 19                        	cmpb	$25, %al
  800d9d: 77 b1                        	ja	0x800d50 <strtol+0x90>
  800d9f: 90                           	nop
  800da0: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800da3: 39 d1                        	cmpl	%edx, %ecx
  800da5: 7c b9                        	jl	0x800d60 <strtol+0xa0>
  800da7: eb a7                        	jmp	0x800d50 <strtol+0x90>
; 	if (endptr)
  800da9: 48 85 f6                     	testq	%rsi, %rsi
  800dac: 74 03                        	je	0x800db1 <strtol+0xf1>
; 		*endptr = (char *) s;
  800dae: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800db1: 4c 89 d0                     	movq	%r10, %rax
  800db4: 48 f7 d8                     	negq	%rax
  800db7: 45 84 c0                     	testb	%r8b, %r8b
  800dba: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800dbe: 5d                           	popq	%rbp
  800dbf: c3                           	retq

0000000000800dc0 <puts>:
; {
  800dc0: 55                           	pushq	%rbp
  800dc1: 48 89 e5                     	movq	%rsp, %rbp
  800dc4: 48 89 f1                     	movq	%rsi, %rcx
  800dc7: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800dca: 31 ff                        	xorl	%edi, %edi
  800dcc: 31 f6                        	xorl	%esi, %esi
  800dce: e8 0d 00 00 00               	callq	0x800de0 <syscall>
; }
  800dd3: 5d                           	popq	%rbp
  800dd4: c3                           	retq
  800dd5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800ddf: 90                           	nop

0000000000800de0 <syscall>:
; {
  800de0: 55                           	pushq	%rbp
  800de1: 48 89 e5                     	movq	%rsp, %rbp
  800de4: 48 83 ec 10                  	subq	$16, %rsp
  800de8: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800dea: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800df2: 48 89 d6                     	movq	%rdx, %rsi
  800df5: 48 89 ca                     	movq	%rcx, %rdx
  800df8: 31 c9                        	xorl	%ecx, %ecx
  800dfa: 45 31 c0                     	xorl	%r8d, %r8d
  800dfd: 45 31 c9                     	xorl	%r9d, %r9d
  800e00: e8 63 00 00 00               	callq	0x800e68 <do_syscall>
; 	return ret;
  800e05: 48 83 c4 10                  	addq	$16, %rsp
  800e09: 5d                           	popq	%rbp
  800e0a: c3                           	retq
  800e0b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800e10 <getc>:
; {
  800e10: 55                           	pushq	%rbp
  800e11: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800e14: bf 01 00 00 00               	movl	$1, %edi
  800e19: 31 f6                        	xorl	%esi, %esi
  800e1b: 31 d2                        	xorl	%edx, %edx
  800e1d: 31 c9                        	xorl	%ecx, %ecx
  800e1f: e8 bc ff ff ff               	callq	0x800de0 <syscall>
  800e24: 5d                           	popq	%rbp
  800e25: c3                           	retq
  800e26: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800e30 <kill>:
; {
  800e30: 55                           	pushq	%rbp
  800e31: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800e34: 48 63 d7                     	movslq	%edi, %rdx
  800e37: bf 03 00 00 00               	movl	$3, %edi
  800e3c: be 01 00 00 00               	movl	$1, %esi
  800e41: 31 c9                        	xorl	%ecx, %ecx
  800e43: e8 98 ff ff ff               	callq	0x800de0 <syscall>
  800e48: 5d                           	popq	%rbp
  800e49: c3                           	retq
  800e4a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800e50 <getpid>:
; {
  800e50: 55                           	pushq	%rbp
  800e51: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800e54: bf 02 00 00 00               	movl	$2, %edi
  800e59: 31 f6                        	xorl	%esi, %esi
  800e5b: 31 d2                        	xorl	%edx, %edx
  800e5d: 31 c9                        	xorl	%ecx, %ecx
  800e5f: e8 7c ff ff ff               	callq	0x800de0 <syscall>
  800e64: 5d                           	popq	%rbp
  800e65: c3                           	retq
  800e66: cc                           	int3
  800e67: cc                           	int3

0000000000800e68 <do_syscall>:
; 	pushq %rbp
  800e68: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800e69: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	movq %rcx, %r10
  800e6e: 49 89 ca                     	movq	%rcx, %r10
; 	syscall
  800e71: 0f 05                        	syscall
; 	popq %rbp
  800e73: 5d                           	popq	%rbp
; 	retq
  800e74: c3                           	retq
