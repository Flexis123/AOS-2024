
obj/user/testbss:	file format elf64-x86-64

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
  800033: e8 58 01 00 00               	callq	0x800190 <libmain>
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
  800044: 48 83 ec 20                  	subq	$32, %rsp
  800048: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  80004f: 89 7d f8                     	movl	%edi, -8(%rbp)
  800052: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	printf("Making sure bss works right...\n");
  800056: 48 8d 3d 16 20 00 00         	leaq	8214(%rip), %rdi        # 0x802073 <testbss.c+0x802073>
  80005d: b0 00                        	movb	$0, %al
  80005f: e8 fc 02 00 00               	callq	0x800360 <printf>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  800064: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  80006b: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  800072: 0f 8d 45 00 00 00            	jge	0x8000bd <main+0x7d>
; 		if (big_array[i] != 0) {
  800078: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80007c: 48 8d 05 7d 3f 00 00         	leaq	16253(%rip), %rax       # 0x804000 <big_array>
  800083: 83 3c 88 00                  	cmpl	$0, (%rax,%rcx,4)
  800087: 0f 84 1d 00 00 00            	je	0x8000aa <main+0x6a>
; 			panic("big_array[%d] isn't cleared!\n", i);
  80008d: 8b 4d ec                     	movl	-20(%rbp), %ecx
  800090: 48 8d 3d 73 20 00 00         	leaq	8307(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  800097: be 10 00 00 00               	movl	$16, %esi
  80009c: 48 8d 15 f0 1f 00 00         	leaq	8176(%rip), %rdx        # 0x802093 <testbss.c+0x802093>
  8000a3: b0 00                        	movb	$0, %al
  8000a5: e8 46 01 00 00               	callq	0x8001f0 <_panic>
; 	}
  8000aa: e9 00 00 00 00               	jmp	0x8000af <main+0x6f>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000af: 8b 45 ec                     	movl	-20(%rbp), %eax
  8000b2: 83 c0 01                     	addl	$1, %eax
  8000b5: 89 45 ec                     	movl	%eax, -20(%rbp)
  8000b8: e9 ae ff ff ff               	jmp	0x80006b <main+0x2b>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000bd: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  8000c4: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  8000cb: 0f 8d 1f 00 00 00            	jge	0x8000f0 <main+0xb0>
; 		big_array[i] = i;
  8000d1: 8b 55 ec                     	movl	-20(%rbp), %edx
  8000d4: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  8000d8: 48 8d 05 21 3f 00 00         	leaq	16161(%rip), %rax       # 0x804000 <big_array>
  8000df: 89 14 88                     	movl	%edx, (%rax,%rcx,4)
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000e2: 8b 45 ec                     	movl	-20(%rbp), %eax
  8000e5: 83 c0 01                     	addl	$1, %eax
  8000e8: 89 45 ec                     	movl	%eax, -20(%rbp)
  8000eb: e9 d4 ff ff ff               	jmp	0x8000c4 <main+0x84>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000f0: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  8000f7: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  8000fe: 0f 8d 47 00 00 00            	jge	0x80014b <main+0x10b>
; 		if (big_array[i] != i) {
  800104: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800108: 48 8d 05 f1 3e 00 00         	leaq	16113(%rip), %rax       # 0x804000 <big_array>
  80010f: 8b 04 88                     	movl	(%rax,%rcx,4), %eax
  800112: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  800115: 0f 84 1d 00 00 00            	je	0x800138 <main+0xf8>
; 			panic("big_array[%d] didn't hold its value!\n", i);
  80011b: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80011e: 48 8d 3d e5 1f 00 00         	leaq	8165(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  800125: be 1a 00 00 00               	movl	$26, %esi
  80012a: 48 8d 15 6c 20 00 00         	leaq	8300(%rip), %rdx        # 0x80219d <testbss.c+0x80219d>
  800131: b0 00                        	movb	$0, %al
  800133: e8 b8 00 00 00               	callq	0x8001f0 <_panic>
; 	}
  800138: e9 00 00 00 00               	jmp	0x80013d <main+0xfd>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  80013d: 8b 45 ec                     	movl	-20(%rbp), %eax
  800140: 83 c0 01                     	addl	$1, %eax
  800143: 89 45 ec                     	movl	%eax, -20(%rbp)
  800146: e9 ac ff ff ff               	jmp	0x8000f7 <main+0xb7>
; 	printf("Yes, good. Now doing a wild write off the end...\n");
  80014b: 48 8d 3d c7 1f 00 00         	leaq	8135(%rip), %rdi        # 0x802119 <testbss.c+0x802119>
  800152: b0 00                        	movb	$0, %al
  800154: e8 07 02 00 00               	callq	0x800360 <printf>
; 	big_array[ARRAY_SIZE + 1024] = 0;
  800159: 48 8d 05 a0 3e 00 00         	leaq	16032(%rip), %rax       # 0x804000 <big_array>
  800160: c7 80 00 10 40 00 00 00 00 00	movl	$0, 4198400(%rax)
; 	panic("Why are we still here?");
  80016a: 48 8d 3d 99 1f 00 00         	leaq	8089(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  800171: be 20 00 00 00               	movl	$32, %esi
  800176: 48 8d 15 9e 1e 00 00         	leaq	7838(%rip), %rdx        # 0x80201b <testbss.c+0x80201b>
  80017d: b0 00                        	movb	$0, %al
  80017f: e8 6c 00 00 00               	callq	0x8001f0 <_panic>
  800184: cc                           	int3
  800185: cc                           	int3
  800186: cc                           	int3
  800187: cc                           	int3
  800188: cc                           	int3
  800189: cc                           	int3
  80018a: cc                           	int3
  80018b: cc                           	int3
  80018c: cc                           	int3
  80018d: cc                           	int3
  80018e: cc                           	int3
  80018f: cc                           	int3

0000000000800190 <libmain>:
; {
  800190: 55                           	pushq	%rbp
  800191: 48 89 e5                     	movq	%rsp, %rbp
  800194: 48 83 ec 10                  	subq	$16, %rsp
  800198: 89 7d fc                     	movl	%edi, -4(%rbp)
  80019b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  80019f: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  8001a3: 0f 8e 11 00 00 00            	jle	0x8001ba <libmain+0x2a>
; 		binary_name = argv[0];
  8001a9: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8001ad: 48 8b 08                     	movq	(%rax), %rcx
  8001b0: 48 8d 05 49 2e 00 00         	leaq	11849(%rip), %rax       # 0x803000 <binary_name>
  8001b7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8001ba: 8b 7d fc                     	movl	-4(%rbp), %edi
  8001bd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8001c1: e8 7a fe ff ff               	callq	0x800040 <main>
; 	exit();
  8001c6: e8 15 00 00 00               	callq	0x8001e0 <exit>
; }
  8001cb: 48 83 c4 10                  	addq	$16, %rsp
  8001cf: 5d                           	popq	%rbp
  8001d0: c3                           	retq
  8001d1: cc                           	int3
  8001d2: cc                           	int3
  8001d3: cc                           	int3
  8001d4: cc                           	int3
  8001d5: cc                           	int3
  8001d6: cc                           	int3
  8001d7: cc                           	int3
  8001d8: cc                           	int3
  8001d9: cc                           	int3
  8001da: cc                           	int3
  8001db: cc                           	int3
  8001dc: cc                           	int3
  8001dd: cc                           	int3
  8001de: cc                           	int3
  8001df: cc                           	int3

00000000008001e0 <exit>:
; {
  8001e0: 55                           	pushq	%rbp
  8001e1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8001e4: 31 ff                        	xorl	%edi, %edi
  8001e6: e8 55 18 00 00               	callq	0x801a40 <kill>
; }
  8001eb: 5d                           	popq	%rbp
  8001ec: c3                           	retq
  8001ed: cc                           	int3
  8001ee: cc                           	int3
  8001ef: cc                           	int3

00000000008001f0 <_panic>:
; {
  8001f0: 55                           	pushq	%rbp
  8001f1: 48 89 e5                     	movq	%rsp, %rbp
  8001f4: 48 83 ec 60                  	subq	$96, %rsp
  8001f8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8001fc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800200: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800204: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800208: 89 75 f4                     	movl	%esi, -12(%rbp)
  80020b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80020f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800213: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800217: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80021b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80021f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  800223: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80022a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  800230: e8 4b 18 00 00               	callq	0x801a80 <getpid>
  800235: 89 c6                        	movl	%eax, %esi
  800237: 48 8d 05 c2 2d 00 00         	leaq	11714(%rip), %rax       # 0x803000 <binary_name>
  80023e: 48 8b 10                     	movq	(%rax), %rdx
  800241: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  800245: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  800249: 48 8d 3d e5 1d 00 00         	leaq	7653(%rip), %rdi        # 0x802035 <testbss.c+0x802035>
  800250: b0 00                        	movb	$0, %al
  800252: e8 09 01 00 00               	callq	0x800360 <printf>
; 	vprintf(fmt, ap);
  800257: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  80025b: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  80025f: e8 1c 00 00 00               	callq	0x800280 <vprintf>
; 	printf("\n");
  800264: 48 8d 3d e0 1e 00 00         	leaq	7904(%rip), %rdi        # 0x80214b <testbss.c+0x80214b>
  80026b: b0 00                        	movb	$0, %al
  80026d: e8 ee 00 00 00               	callq	0x800360 <printf>
; 		asm volatile("int3");
  800272: cc                           	int3
; 	while (1) {
  800273: e9 fa ff ff ff               	jmp	0x800272 <_panic+0x82>
  800278: cc                           	int3
  800279: cc                           	int3
  80027a: cc                           	int3
  80027b: cc                           	int3
  80027c: cc                           	int3
  80027d: cc                           	int3
  80027e: cc                           	int3
  80027f: cc                           	int3

0000000000800280 <vprintf>:
; {
  800280: 55                           	pushq	%rbp
  800281: 48 89 e5                     	movq	%rsp, %rbp
  800284: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  80028b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80028f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  800293: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  80029d: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8002a7: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  8002ae: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8002b2: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8002b6: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x8002f0 <putch>
  8002bd: e8 fe 00 00 00               	callq	0x8003c0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8002c2: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  8002c9: 48 83 c7 08                  	addq	$8, %rdi
  8002cd: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  8002d4: e8 57 16 00 00               	callq	0x801930 <puts>
; 	return b.cnt;
  8002d9: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  8002df: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  8002e6: 5d                           	popq	%rbp
  8002e7: c3                           	retq
  8002e8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

00000000008002f0 <putch>:
; {
  8002f0: 55                           	pushq	%rbp
  8002f1: 48 89 e5                     	movq	%rsp, %rbp
  8002f4: 48 83 ec 10                  	subq	$16, %rsp
  8002f8: 89 7d fc                     	movl	%edi, -4(%rbp)
  8002fb: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  8002ff: 8b 45 fc                     	movl	-4(%rbp), %eax
  800302: 88 c2                        	movb	%al, %dl
  800304: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800308: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80030c: 8b 0e                        	movl	(%rsi), %ecx
  80030e: 89 cf                        	movl	%ecx, %edi
  800310: 83 c7 01                     	addl	$1, %edi
  800313: 89 3e                        	movl	%edi, (%rsi)
  800315: 48 63 c9                     	movslq	%ecx, %rcx
  800318: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80031c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800320: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800326: 0f 85 1e 00 00 00            	jne	0x80034a <putch+0x5a>
; 		puts(b->buf, b->idx);
  80032c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  800330: 48 83 c7 08                  	addq	$8, %rdi
  800334: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800338: 48 63 30                     	movslq	(%rax), %rsi
  80033b: e8 f0 15 00 00               	callq	0x801930 <puts>
; 		b->idx = 0;
  800340: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800344: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  80034a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80034e: 8b 48 04                     	movl	4(%rax), %ecx
  800351: 83 c1 01                     	addl	$1, %ecx
  800354: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  800357: 48 83 c4 10                  	addq	$16, %rsp
  80035b: 5d                           	popq	%rbp
  80035c: c3                           	retq
  80035d: 0f 1f 00                     	nopl	(%rax)

0000000000800360 <printf>:
; {
  800360: 55                           	pushq	%rbp
  800361: 48 89 e5                     	movq	%rsp, %rbp
  800364: 48 83 ec 60                  	subq	$96, %rsp
  800368: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80036c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800370: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800374: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  800378: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  80037c: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800380: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800384: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800388: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80038c: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800390: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  800397: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  80039e: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8003a2: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  8003a6: e8 d5 fe ff ff               	callq	0x800280 <vprintf>
  8003ab: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  8003ae: 8b 45 dc                     	movl	-36(%rbp), %eax
  8003b1: 48 83 c4 60                  	addq	$96, %rsp
  8003b5: 5d                           	popq	%rbp
  8003b6: c3                           	retq
  8003b7: cc                           	int3
  8003b8: cc                           	int3
  8003b9: cc                           	int3
  8003ba: cc                           	int3
  8003bb: cc                           	int3
  8003bc: cc                           	int3
  8003bd: cc                           	int3
  8003be: cc                           	int3
  8003bf: cc                           	int3

00000000008003c0 <vprintfmt>:
; {
  8003c0: 55                           	pushq	%rbp
  8003c1: 48 89 e5                     	movq	%rsp, %rbp
  8003c4: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  8003cb: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8003cf: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8003d3: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  8003d7: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  8003db: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8003df: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  8003e3: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  8003e7: 48 89 48 10                  	movq	%rcx, 16(%rax)
  8003eb: 48 8b 0a                     	movq	(%rdx), %rcx
  8003ee: 48 8b 52 08                  	movq	8(%rdx), %rdx
  8003f2: 48 89 50 08                  	movq	%rdx, 8(%rax)
  8003f6: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8003f9: e9 00 00 00 00               	jmp	0x8003fe <vprintfmt+0x3e>
  8003fe: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800402: 48 89 c1                     	movq	%rax, %rcx
  800405: 48 83 c1 01                  	addq	$1, %rcx
  800409: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80040d: 0f b6 00                     	movzbl	(%rax), %eax
  800410: 89 45 b4                     	movl	%eax, -76(%rbp)
  800413: 83 f8 25                     	cmpl	$37, %eax
  800416: 0f 84 25 00 00 00            	je	0x800441 <vprintfmt+0x81>
; 			if (ch == '\0')
  80041c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800420: 0f 85 09 00 00 00            	jne	0x80042f <vprintfmt+0x6f>
; 				return;
  800426: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80042d: 5d                           	popq	%rbp
  80042e: c3                           	retq
; 			putch(ch, putdat);
  80042f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800433: 8b 7d b4                     	movl	-76(%rbp), %edi
  800436: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80043a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80043c: e9 bd ff ff ff               	jmp	0x8003fe <vprintfmt+0x3e>
; 		padc = ' ';
  800441: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  800445: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  80044c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  800453: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  80045a: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  800461: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800465: 48 89 c1                     	movq	%rax, %rcx
  800468: 48 83 c1 01                  	addq	$1, %rcx
  80046c: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800470: 0f b6 00                     	movzbl	(%rax), %eax
  800473: 89 45 b4                     	movl	%eax, -76(%rbp)
  800476: 83 c0 dd                     	addl	$-35, %eax
  800479: 89 c1                        	movl	%eax, %ecx
  80047b: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  80047f: 83 e8 55                     	subl	$85, %eax
  800482: 0f 87 c1 05 00 00            	ja	0x800a49 <vprintfmt+0x689>
  800488: 48 8b 45 88                  	movq	-120(%rbp), %rax
  80048c: 48 8d 0d 3d 1d 00 00         	leaq	7485(%rip), %rcx        # 0x8021d0 <testbss.c+0x8021d0>
  800493: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  800497: 48 01 c8                     	addq	%rcx, %rax
  80049a: ff e0                        	jmpq	*%rax
; 			padc = '-';
  80049c: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  8004a0: e9 bc ff ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			padc = '0';
  8004a5: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  8004a9: e9 b3 ff ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  8004ae: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  8004b5: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  8004b9: 03 45 b4                     	addl	-76(%rbp), %eax
  8004bc: 83 e8 30                     	subl	$48, %eax
  8004bf: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  8004c2: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004c6: 0f be 00                     	movsbl	(%rax), %eax
  8004c9: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  8004cc: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  8004d0: 0f 8c 0a 00 00 00            	jl	0x8004e0 <vprintfmt+0x120>
  8004d6: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  8004da: 0f 8e 05 00 00 00            	jle	0x8004e5 <vprintfmt+0x125>
; 					break;
  8004e0: e9 16 00 00 00               	jmp	0x8004fb <vprintfmt+0x13b>
; 			}
  8004e5: e9 00 00 00 00               	jmp	0x8004ea <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  8004ea: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004ee: 48 83 c0 01                  	addq	$1, %rax
  8004f2: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8004f6: e9 ba ff ff ff               	jmp	0x8004b5 <vprintfmt+0xf5>
; 			goto process_precision;
  8004fb: e9 8c 00 00 00               	jmp	0x80058c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800500: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800504: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80050b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80050e: 89 45 84                     	movl	%eax, -124(%rbp)
  800511: 83 f8 28                     	cmpl	$40, %eax
  800514: 0f 87 22 00 00 00            	ja	0x80053c <vprintfmt+0x17c>
  80051a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800521: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800524: 48 63 c2                     	movslq	%edx, %rax
  800527: 48 03 41 10                  	addq	16(%rcx), %rax
  80052b: 83 c2 08                     	addl	$8, %edx
  80052e: 89 11                        	movl	%edx, (%rcx)
  800530: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800537: e9 1d 00 00 00               	jmp	0x800559 <vprintfmt+0x199>
  80053c: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  800543: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800547: 48 89 d0                     	movq	%rdx, %rax
  80054a: 48 83 c2 08                  	addq	$8, %rdx
  80054e: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800552: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800559: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  800560: 8b 00                        	movl	(%rax), %eax
  800562: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  800565: e9 22 00 00 00               	jmp	0x80058c <vprintfmt+0x1cc>
; 			if (width < 0)
  80056a: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  80056e: 0f 8d 07 00 00 00            	jge	0x80057b <vprintfmt+0x1bb>
; 				width = 0;
  800574: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  80057b: e9 e1 fe ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			altflag = 1;
  800580: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  800587: e9 d5 fe ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			if (width < 0)
  80058c: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  800590: 0f 8d 0d 00 00 00            	jge	0x8005a3 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  800596: 8b 45 98                     	movl	-104(%rbp), %eax
  800599: 89 45 9c                     	movl	%eax, -100(%rbp)
  80059c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  8005a3: e9 b9 fe ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			lflag++;
  8005a8: 8b 45 a0                     	movl	-96(%rbp), %eax
  8005ab: 83 c0 01                     	addl	$1, %eax
  8005ae: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  8005b1: e9 ab fe ff ff               	jmp	0x800461 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  8005b6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8005ba: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  8005c1: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8005c5: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  8005cc: 8b 45 c0                     	movl	-64(%rbp), %eax
  8005cf: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  8005d5: 83 f8 28                     	cmpl	$40, %eax
  8005d8: 0f 87 25 00 00 00            	ja	0x800603 <vprintfmt+0x243>
  8005de: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  8005e5: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  8005eb: 48 63 c2                     	movslq	%edx, %rax
  8005ee: 48 03 41 10                  	addq	16(%rcx), %rax
  8005f2: 83 c2 08                     	addl	$8, %edx
  8005f5: 89 11                        	movl	%edx, (%rcx)
  8005f7: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  8005fe: e9 1d 00 00 00               	jmp	0x800620 <vprintfmt+0x260>
  800603: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80060a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80060e: 48 89 d0                     	movq	%rdx, %rax
  800611: 48 83 c2 08                  	addq	$8, %rdx
  800615: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800619: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800620: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800627: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80062e: 8b 39                        	movl	(%rcx), %edi
  800630: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800634: ff d0                        	callq	*%rax
; 			break;
  800636: e9 55 04 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80063b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80063f: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  800646: 8b 45 c0                     	movl	-64(%rbp), %eax
  800649: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  80064f: 83 f8 28                     	cmpl	$40, %eax
  800652: 0f 87 25 00 00 00            	ja	0x80067d <vprintfmt+0x2bd>
  800658: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  80065f: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  800665: 48 63 c2                     	movslq	%edx, %rax
  800668: 48 03 41 10                  	addq	16(%rcx), %rax
  80066c: 83 c2 08                     	addl	$8, %edx
  80066f: 89 11                        	movl	%edx, (%rcx)
  800671: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  800678: e9 1d 00 00 00               	jmp	0x80069a <vprintfmt+0x2da>
  80067d: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  800684: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800688: 48 89 d0                     	movq	%rdx, %rax
  80068b: 48 83 c2 08                  	addq	$8, %rdx
  80068f: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800693: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  80069a: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  8006a1: 8b 00                        	movl	(%rax), %eax
  8006a3: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  8006a6: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  8006aa: 0f 8d 08 00 00 00            	jge	0x8006b8 <vprintfmt+0x2f8>
; 				err = -err;
  8006b0: 31 c0                        	xorl	%eax, %eax
  8006b2: 2b 45 b0                     	subl	-80(%rbp), %eax
  8006b5: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8006b8: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  8006bc: 48 83 f8 09                  	cmpq	$9, %rax
  8006c0: 0f 83 1d 00 00 00            	jae	0x8006e3 <vprintfmt+0x323>
  8006c6: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8006ca: 48 8d 05 3f 29 00 00         	leaq	10559(%rip), %rax       # 0x803010 <error_string>
  8006d1: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  8006d5: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8006d9: 48 83 f8 00                  	cmpq	$0, %rax
  8006dd: 0f 85 1e 00 00 00            	jne	0x800701 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  8006e3: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8006e7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006eb: 8b 4d b0                     	movl	-80(%rbp), %ecx
  8006ee: 48 8d 15 fb 19 00 00         	leaq	6651(%rip), %rdx        # 0x8020f0 <testbss.c+0x8020f0>
  8006f5: b0 00                        	movb	$0, %al
  8006f7: e8 a4 03 00 00               	callq	0x800aa0 <printfmt>
  8006fc: e9 1a 00 00 00               	jmp	0x80071b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800701: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800705: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800709: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80070d: 48 8d 15 1e 19 00 00         	leaq	6430(%rip), %rdx        # 0x802032 <testbss.c+0x802032>
  800714: b0 00                        	movb	$0, %al
  800716: e8 85 03 00 00               	callq	0x800aa0 <printfmt>
; 			break;
  80071b: e9 70 03 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800720: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800724: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80072b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80072e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  800734: 83 f8 28                     	cmpl	$40, %eax
  800737: 0f 87 25 00 00 00            	ja	0x800762 <vprintfmt+0x3a2>
  80073d: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  800744: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  80074a: 48 63 c2                     	movslq	%edx, %rax
  80074d: 48 03 41 10                  	addq	16(%rcx), %rax
  800751: 83 c2 08                     	addl	$8, %edx
  800754: 89 11                        	movl	%edx, (%rcx)
  800756: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80075d: e9 1d 00 00 00               	jmp	0x80077f <vprintfmt+0x3bf>
  800762: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  800769: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80076d: 48 89 d0                     	movq	%rdx, %rax
  800770: 48 83 c2 08                  	addq	$8, %rdx
  800774: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800778: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80077f: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800786: 48 8b 00                     	movq	(%rax), %rax
  800789: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  80078d: 48 83 f8 00                  	cmpq	$0, %rax
  800791: 0f 85 0b 00 00 00            	jne	0x8007a2 <vprintfmt+0x3e2>
; 				p = "(null)";
  800797: 48 8d 05 af 19 00 00         	leaq	6575(%rip), %rax        # 0x80214d <testbss.c+0x80214d>
  80079e: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  8007a2: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8007a6: 0f 8e 4f 00 00 00            	jle	0x8007fb <vprintfmt+0x43b>
  8007ac: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  8007b0: 83 f8 2d                     	cmpl	$45, %eax
  8007b3: 0f 84 42 00 00 00            	je	0x8007fb <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8007b9: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  8007bd: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  8007c1: e8 da 07 00 00               	callq	0x800fa0 <strnlen>
  8007c6: 89 c1                        	movl	%eax, %ecx
  8007c8: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007cb: 29 c8                        	subl	%ecx, %eax
  8007cd: 89 45 9c                     	movl	%eax, -100(%rbp)
  8007d0: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8007d4: 0f 8e 1c 00 00 00            	jle	0x8007f6 <vprintfmt+0x436>
; 					putch(padc, putdat);
  8007da: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007de: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  8007e2: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007e6: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8007e8: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007eb: 83 c0 ff                     	addl	$-1, %eax
  8007ee: 89 45 9c                     	movl	%eax, -100(%rbp)
  8007f1: e9 da ff ff ff               	jmp	0x8007d0 <vprintfmt+0x410>
; 					putch(padc, putdat);
  8007f6: e9 00 00 00 00               	jmp	0x8007fb <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8007fb: e9 00 00 00 00               	jmp	0x800800 <vprintfmt+0x440>
  800800: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800804: 48 89 c1                     	movq	%rax, %rcx
  800807: 48 83 c1 01                  	addq	$1, %rcx
  80080b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80080f: 0f be 08                     	movsbl	(%rax), %ecx
  800812: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800815: 31 c0                        	xorl	%eax, %eax
  800817: 83 f9 00                     	cmpl	$0, %ecx
  80081a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800820: 0f 84 33 00 00 00            	je	0x800859 <vprintfmt+0x499>
  800826: b0 01                        	movb	$1, %al
  800828: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80082c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  800832: 0f 8c 15 00 00 00            	jl	0x80084d <vprintfmt+0x48d>
  800838: 8b 45 98                     	movl	-104(%rbp), %eax
  80083b: 83 c0 ff                     	addl	$-1, %eax
  80083e: 89 45 98                     	movl	%eax, -104(%rbp)
  800841: 83 f8 00                     	cmpl	$0, %eax
  800844: 0f 9d c0                     	setge	%al
  800847: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  80084d: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  800853: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800859: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80085f: a8 01                        	testb	$1, %al
  800861: 0f 85 05 00 00 00            	jne	0x80086c <vprintfmt+0x4ac>
  800867: e9 52 00 00 00               	jmp	0x8008be <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  80086c: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  800870: 0f 84 28 00 00 00            	je	0x80089e <vprintfmt+0x4de>
  800876: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  80087a: 0f 8c 0a 00 00 00            	jl	0x80088a <vprintfmt+0x4ca>
  800880: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  800884: 0f 8e 14 00 00 00            	jle	0x80089e <vprintfmt+0x4de>
; 					putch('?', putdat);
  80088a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80088e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800892: bf 3f 00 00 00               	movl	$63, %edi
  800897: ff d0                        	callq	*%rax
  800899: e9 0d 00 00 00               	jmp	0x8008ab <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  80089e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008a2: 8b 7d b4                     	movl	-76(%rbp), %edi
  8008a5: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008a9: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008ab: e9 00 00 00 00               	jmp	0x8008b0 <vprintfmt+0x4f0>
; 					width--)
  8008b0: 8b 45 9c                     	movl	-100(%rbp), %eax
  8008b3: 83 c0 ff                     	addl	$-1, %eax
  8008b6: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008b9: e9 42 ff ff ff               	jmp	0x800800 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  8008be: e9 00 00 00 00               	jmp	0x8008c3 <vprintfmt+0x503>
  8008c3: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8008c7: 0f 8e 1d 00 00 00            	jle	0x8008ea <vprintfmt+0x52a>
; 				putch(' ', putdat);
  8008cd: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008d1: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008d5: bf 20 00 00 00               	movl	$32, %edi
  8008da: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  8008dc: 8b 45 9c                     	movl	-100(%rbp), %eax
  8008df: 83 c0 ff                     	addl	$-1, %eax
  8008e2: 89 45 9c                     	movl	%eax, -100(%rbp)
  8008e5: e9 d9 ff ff ff               	jmp	0x8008c3 <vprintfmt+0x503>
; 			break;
  8008ea: e9 a1 01 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  8008ef: 8b 75 a0                     	movl	-96(%rbp), %esi
  8008f2: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  8008f6: e8 05 02 00 00               	callq	0x800b00 <getint>
  8008fb: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  8008ff: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800904: 0f 8d 19 00 00 00            	jge	0x800923 <vprintfmt+0x563>
; 				putch('-', putdat);
  80090a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80090e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800912: bf 2d 00 00 00               	movl	$45, %edi
  800917: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800919: 31 c0                        	xorl	%eax, %eax
  80091b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80091f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800923: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80092a: e9 e6 00 00 00               	jmp	0x800a15 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80092f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800932: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800936: e8 f5 02 00 00               	callq	0x800c30 <getuint>
  80093b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  80093f: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  800946: e9 ca 00 00 00               	jmp	0x800a15 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80094b: 8b 75 a0                     	movl	-96(%rbp), %esi
  80094e: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800952: e8 d9 02 00 00               	callq	0x800c30 <getuint>
  800957: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  80095b: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  800962: e9 ae 00 00 00               	jmp	0x800a15 <vprintfmt+0x655>
; 			putch('0', putdat);
  800967: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80096b: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80096f: bf 30 00 00 00               	movl	$48, %edi
  800974: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800976: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80097a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80097e: bf 78 00 00 00               	movl	$120, %edi
  800983: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800985: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800989: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  800990: 8b 45 c0                     	movl	-64(%rbp), %eax
  800993: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  800999: 83 f8 28                     	cmpl	$40, %eax
  80099c: 0f 87 25 00 00 00            	ja	0x8009c7 <vprintfmt+0x607>
  8009a2: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  8009a9: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  8009af: 48 63 c2                     	movslq	%edx, %rax
  8009b2: 48 03 41 10                  	addq	16(%rcx), %rax
  8009b6: 83 c2 08                     	addl	$8, %edx
  8009b9: 89 11                        	movl	%edx, (%rcx)
  8009bb: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  8009c2: e9 1d 00 00 00               	jmp	0x8009e4 <vprintfmt+0x624>
  8009c7: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  8009ce: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8009d2: 48 89 d0                     	movq	%rdx, %rax
  8009d5: 48 83 c2 08                  	addq	$8, %rdx
  8009d9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8009dd: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  8009e4: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  8009eb: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  8009ee: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  8009f2: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  8009f9: e9 17 00 00 00               	jmp	0x800a15 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  8009fe: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a01: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a05: e8 26 02 00 00               	callq	0x800c30 <getuint>
  800a0a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a0e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800a15: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a19: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a1d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800a21: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800a24: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800a28: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800a2d: e8 2e 03 00 00               	callq	0x800d60 <printnum>
; 			break;
  800a32: e9 59 00 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800a37: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a3b: 8b 7d b4                     	movl	-76(%rbp), %edi
  800a3e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a42: ff d0                        	callq	*%rax
; 			break;
  800a44: e9 47 00 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800a49: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a4d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a51: bf 25 00 00 00               	movl	$37, %edi
  800a56: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800a58: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a5c: 48 83 c0 ff                  	addq	$-1, %rax
  800a60: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800a64: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a68: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800a6c: 83 f8 25                     	cmpl	$37, %eax
  800a6f: 0f 84 16 00 00 00            	je	0x800a8b <vprintfmt+0x6cb>
  800a75: e9 00 00 00 00               	jmp	0x800a7a <vprintfmt+0x6ba>
  800a7a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a7e: 48 83 c0 ff                  	addq	$-1, %rax
  800a82: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800a86: e9 d9 ff ff ff               	jmp	0x800a64 <vprintfmt+0x6a4>
; 			break;
  800a8b: e9 00 00 00 00               	jmp	0x800a90 <vprintfmt+0x6d0>
; 	while (1) {
  800a90: e9 64 f9 ff ff               	jmp	0x8003f9 <vprintfmt+0x39>
  800a95: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a9f: 90                           	nop

0000000000800aa0 <printfmt>:
; {
  800aa0: 55                           	pushq	%rbp
  800aa1: 48 89 e5                     	movq	%rsp, %rbp
  800aa4: 48 83 ec 60                  	subq	$96, %rsp
  800aa8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800aac: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800ab0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800ab4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800ab8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800abc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800ac0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800ac4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800ac8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800acc: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800ad0: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800ad7: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800ade: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800ae2: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800ae6: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800aea: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800aee: e8 cd f8 ff ff               	callq	0x8003c0 <vprintfmt>
; }
  800af3: 48 83 c4 60                  	addq	$96, %rsp
  800af7: 5d                           	popq	%rbp
  800af8: c3                           	retq
  800af9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b00 <getint>:
; {
  800b00: 55                           	pushq	%rbp
  800b01: 48 89 e5                     	movq	%rsp, %rbp
  800b04: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b08: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b0b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b0f: 0f 8c 59 00 00 00            	jl	0x800b6e <getint+0x6e>
; 		return va_arg(*ap, long long);
  800b15: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b19: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b1d: 8b 00                        	movl	(%rax), %eax
  800b1f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800b22: 83 f8 28                     	cmpl	$40, %eax
  800b25: 0f 87 1c 00 00 00            	ja	0x800b47 <getint+0x47>
  800b2b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800b2f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800b32: 48 63 c2                     	movslq	%edx, %rax
  800b35: 48 03 41 10                  	addq	16(%rcx), %rax
  800b39: 83 c2 08                     	addl	$8, %edx
  800b3c: 89 11                        	movl	%edx, (%rcx)
  800b3e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b42: e9 17 00 00 00               	jmp	0x800b5e <getint+0x5e>
  800b47: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800b4b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800b4f: 48 89 d0                     	movq	%rdx, %rax
  800b52: 48 83 c2 08                  	addq	$8, %rdx
  800b56: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800b5a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b5e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800b62: 48 8b 00                     	movq	(%rax), %rax
  800b65: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800b69: e9 b7 00 00 00               	jmp	0x800c25 <getint+0x125>
; 	else if (lflag)
  800b6e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800b72: 0f 84 59 00 00 00            	je	0x800bd1 <getint+0xd1>
; 		return va_arg(*ap, long);
  800b78: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b7c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800b80: 8b 00                        	movl	(%rax), %eax
  800b82: 89 45 d4                     	movl	%eax, -44(%rbp)
  800b85: 83 f8 28                     	cmpl	$40, %eax
  800b88: 0f 87 1c 00 00 00            	ja	0x800baa <getint+0xaa>
  800b8e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800b92: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800b95: 48 63 c2                     	movslq	%edx, %rax
  800b98: 48 03 41 10                  	addq	16(%rcx), %rax
  800b9c: 83 c2 08                     	addl	$8, %edx
  800b9f: 89 11                        	movl	%edx, (%rcx)
  800ba1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ba5: e9 17 00 00 00               	jmp	0x800bc1 <getint+0xc1>
  800baa: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800bae: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bb2: 48 89 d0                     	movq	%rdx, %rax
  800bb5: 48 83 c2 08                  	addq	$8, %rdx
  800bb9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bbd: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800bc1: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800bc5: 48 8b 00                     	movq	(%rax), %rax
  800bc8: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bcc: e9 54 00 00 00               	jmp	0x800c25 <getint+0x125>
; 		return va_arg(*ap, int);
  800bd1: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800bd5: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800bd9: 8b 00                        	movl	(%rax), %eax
  800bdb: 89 45 bc                     	movl	%eax, -68(%rbp)
  800bde: 83 f8 28                     	cmpl	$40, %eax
  800be1: 0f 87 1c 00 00 00            	ja	0x800c03 <getint+0x103>
  800be7: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800beb: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800bee: 48 63 c2                     	movslq	%edx, %rax
  800bf1: 48 03 41 10                  	addq	16(%rcx), %rax
  800bf5: 83 c2 08                     	addl	$8, %edx
  800bf8: 89 11                        	movl	%edx, (%rcx)
  800bfa: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800bfe: e9 17 00 00 00               	jmp	0x800c1a <getint+0x11a>
  800c03: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c07: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c0b: 48 89 d0                     	movq	%rdx, %rax
  800c0e: 48 83 c2 08                  	addq	$8, %rdx
  800c12: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c16: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c1a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800c1e: 48 63 00                     	movslq	(%rax), %rax
  800c21: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800c25: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c29: 5d                           	popq	%rbp
  800c2a: c3                           	retq
  800c2b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800c30 <getuint>:
; {
  800c30: 55                           	pushq	%rbp
  800c31: 48 89 e5                     	movq	%rsp, %rbp
  800c34: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800c38: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800c3b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800c3f: 0f 8c 59 00 00 00            	jl	0x800c9e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800c45: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c49: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800c4d: 8b 00                        	movl	(%rax), %eax
  800c4f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800c52: 83 f8 28                     	cmpl	$40, %eax
  800c55: 0f 87 1c 00 00 00            	ja	0x800c77 <getuint+0x47>
  800c5b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800c5f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800c62: 48 63 c2                     	movslq	%edx, %rax
  800c65: 48 03 41 10                  	addq	16(%rcx), %rax
  800c69: 83 c2 08                     	addl	$8, %edx
  800c6c: 89 11                        	movl	%edx, (%rcx)
  800c6e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800c72: e9 17 00 00 00               	jmp	0x800c8e <getuint+0x5e>
  800c77: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800c7b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c7f: 48 89 d0                     	movq	%rdx, %rax
  800c82: 48 83 c2 08                  	addq	$8, %rdx
  800c86: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c8a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800c8e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800c92: 48 8b 00                     	movq	(%rax), %rax
  800c95: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800c99: e9 b6 00 00 00               	jmp	0x800d54 <getuint+0x124>
; 	else if (lflag)
  800c9e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800ca2: 0f 84 59 00 00 00            	je	0x800d01 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800ca8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cac: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800cb0: 8b 00                        	movl	(%rax), %eax
  800cb2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800cb5: 83 f8 28                     	cmpl	$40, %eax
  800cb8: 0f 87 1c 00 00 00            	ja	0x800cda <getuint+0xaa>
  800cbe: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800cc2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800cc5: 48 63 c2                     	movslq	%edx, %rax
  800cc8: 48 03 41 10                  	addq	16(%rcx), %rax
  800ccc: 83 c2 08                     	addl	$8, %edx
  800ccf: 89 11                        	movl	%edx, (%rcx)
  800cd1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800cd5: e9 17 00 00 00               	jmp	0x800cf1 <getuint+0xc1>
  800cda: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800cde: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800ce2: 48 89 d0                     	movq	%rdx, %rax
  800ce5: 48 83 c2 08                  	addq	$8, %rdx
  800ce9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800ced: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800cf1: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800cf5: 48 8b 00                     	movq	(%rax), %rax
  800cf8: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800cfc: e9 53 00 00 00               	jmp	0x800d54 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d01: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d05: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d09: 8b 00                        	movl	(%rax), %eax
  800d0b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d0e: 83 f8 28                     	cmpl	$40, %eax
  800d11: 0f 87 1c 00 00 00            	ja	0x800d33 <getuint+0x103>
  800d17: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800d1b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800d1e: 48 63 c2                     	movslq	%edx, %rax
  800d21: 48 03 41 10                  	addq	16(%rcx), %rax
  800d25: 83 c2 08                     	addl	$8, %edx
  800d28: 89 11                        	movl	%edx, (%rcx)
  800d2a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d2e: e9 17 00 00 00               	jmp	0x800d4a <getuint+0x11a>
  800d33: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800d37: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d3b: 48 89 d0                     	movq	%rdx, %rax
  800d3e: 48 83 c2 08                  	addq	$8, %rdx
  800d42: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d46: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d4a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800d4e: 8b 00                        	movl	(%rax), %eax
  800d50: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800d54: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800d58: 5d                           	popq	%rbp
  800d59: c3                           	retq
  800d5a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800d60 <printnum>:
; {
  800d60: 55                           	pushq	%rbp
  800d61: 48 89 e5                     	movq	%rsp, %rbp
  800d64: 48 83 ec 30                  	subq	$48, %rsp
  800d68: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800d6c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800d70: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800d74: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800d77: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800d7b: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800d7f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800d83: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800d86: 48 39 c8                     	cmpq	%rcx, %rax
  800d89: 0f 82 30 00 00 00            	jb	0x800dbf <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800d8f: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800d93: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800d97: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800d9b: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800d9e: 31 d2                        	xorl	%edx, %edx
  800da0: 48 f7 f1                     	divq	%rcx
  800da3: 48 89 c2                     	movq	%rax, %rdx
  800da6: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800da9: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800dad: 41 83 e8 01                  	subl	$1, %r8d
  800db1: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800db5: e8 a6 ff ff ff               	callq	0x800d60 <printnum>
; 	} else {
  800dba: e9 2e 00 00 00               	jmp	0x800ded <printnum+0x8d>
; 		while (--width > 0)
  800dbf: e9 00 00 00 00               	jmp	0x800dc4 <printnum+0x64>
  800dc4: 8b 45 e0                     	movl	-32(%rbp), %eax
  800dc7: 83 c0 ff                     	addl	$-1, %eax
  800dca: 89 45 e0                     	movl	%eax, -32(%rbp)
  800dcd: 83 f8 00                     	cmpl	$0, %eax
  800dd0: 0f 8e 12 00 00 00            	jle	0x800de8 <printnum+0x88>
; 			putch(padc, putdat);
  800dd6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800dda: 8b 7d dc                     	movl	-36(%rbp), %edi
  800ddd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800de1: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800de3: e9 dc ff ff ff               	jmp	0x800dc4 <printnum+0x64>
  800de8: e9 00 00 00 00               	jmp	0x800ded <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800ded: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800df1: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800df5: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800df9: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800dfc: 31 d2                        	xorl	%edx, %edx
  800dfe: 48 f7 f1                     	divq	%rcx
  800e01: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e05: 48 8d 0d ed 12 00 00         	leaq	4845(%rip), %rcx        # 0x8020f9 <testbss.c+0x8020f9>
  800e0c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800e10: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e14: ff d0                        	callq	*%rax
; }
  800e16: 48 83 c4 30                  	addq	$48, %rsp
  800e1a: 5d                           	popq	%rbp
  800e1b: c3                           	retq
  800e1c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800e20 <vsnprintf>:
; {
  800e20: 55                           	pushq	%rbp
  800e21: 48 89 e5                     	movq	%rsp, %rbp
  800e24: 48 83 ec 40                  	subq	$64, %rsp
  800e28: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800e2c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800e2f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800e33: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800e37: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e3b: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800e3f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e43: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800e47: 48 01 c8                     	addq	%rcx, %rax
  800e4a: 48 83 c0 ff                  	addq	$-1, %rax
  800e4e: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800e52: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800e59: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800e5e: 0f 84 0a 00 00 00            	je	0x800e6e <vsnprintf+0x4e>
  800e64: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800e68: 0f 8d 0c 00 00 00            	jge	0x800e7a <vsnprintf+0x5a>
; 		return -EINVAL;
  800e6e: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800e75: e9 25 00 00 00               	jmp	0x800e9f <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800e7a: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800e7e: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800e82: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800e86: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800eb0 <sprintputch>
  800e8d: e8 2e f5 ff ff               	callq	0x8003c0 <vprintfmt>
; 	*b.buf = '\0';
  800e92: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800e96: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800e99: 8b 45 d0                     	movl	-48(%rbp), %eax
  800e9c: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800e9f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800ea2: 48 83 c4 40                  	addq	$64, %rsp
  800ea6: 5d                           	popq	%rbp
  800ea7: c3                           	retq
  800ea8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800eb0 <sprintputch>:
; {
  800eb0: 55                           	pushq	%rbp
  800eb1: 48 89 e5                     	movq	%rsp, %rbp
  800eb4: 89 7d fc                     	movl	%edi, -4(%rbp)
  800eb7: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800ebb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ebf: 8b 48 10                     	movl	16(%rax), %ecx
  800ec2: 83 c1 01                     	addl	$1, %ecx
  800ec5: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800ec8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ecc: 48 8b 00                     	movq	(%rax), %rax
  800ecf: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800ed3: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800ed7: 0f 83 18 00 00 00            	jae	0x800ef5 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800edd: 8b 45 fc                     	movl	-4(%rbp), %eax
  800ee0: 88 c1                        	movb	%al, %cl
  800ee2: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800ee6: 48 8b 02                     	movq	(%rdx), %rax
  800ee9: 48 89 c6                     	movq	%rax, %rsi
  800eec: 48 83 c6 01                  	addq	$1, %rsi
  800ef0: 48 89 32                     	movq	%rsi, (%rdx)
  800ef3: 88 08                        	movb	%cl, (%rax)
; }
  800ef5: 5d                           	popq	%rbp
  800ef6: c3                           	retq
  800ef7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f00 <snprintf>:
; {
  800f00: 55                           	pushq	%rbp
  800f01: 48 89 e5                     	movq	%rsp, %rbp
  800f04: 48 83 ec 70                  	subq	$112, %rsp
  800f08: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f0c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800f10: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800f14: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f18: 89 75 f4                     	movl	%esi, -12(%rbp)
  800f1b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800f1f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800f23: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800f27: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800f2b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800f2f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800f36: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800f3d: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800f41: 8b 75 f4                     	movl	-12(%rbp), %esi
  800f44: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800f48: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800f4c: e8 cf fe ff ff               	callq	0x800e20 <vsnprintf>
  800f51: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800f54: 8b 45 cc                     	movl	-52(%rbp), %eax
  800f57: 48 83 c4 70                  	addq	$112, %rsp
  800f5b: 5d                           	popq	%rbp
  800f5c: c3                           	retq
  800f5d: cc                           	int3
  800f5e: cc                           	int3
  800f5f: cc                           	int3

0000000000800f60 <strlen>:
; {
  800f60: 55                           	pushq	%rbp
  800f61: 48 89 e5                     	movq	%rsp, %rbp
  800f64: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800f68: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800f6f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f73: 0f be 00                     	movsbl	(%rax), %eax
  800f76: 83 f8 00                     	cmpl	$0, %eax
  800f79: 0f 84 1a 00 00 00            	je	0x800f99 <strlen+0x39>
; 		n++;
  800f7f: 8b 45 f4                     	movl	-12(%rbp), %eax
  800f82: 83 c0 01                     	addl	$1, %eax
  800f85: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800f88: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f8c: 48 83 c0 01                  	addq	$1, %rax
  800f90: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800f94: e9 d6 ff ff ff               	jmp	0x800f6f <strlen+0xf>
; 	return n;
  800f99: 8b 45 f4                     	movl	-12(%rbp), %eax
  800f9c: 5d                           	popq	%rbp
  800f9d: c3                           	retq
  800f9e: 66 90                        	nop

0000000000800fa0 <strnlen>:
; {
  800fa0: 55                           	pushq	%rbp
  800fa1: 48 89 e5                     	movq	%rsp, %rbp
  800fa4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800fa8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800fac: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  800fb3: 31 c0                        	xorl	%eax, %eax
  800fb5: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800fba: 88 45 eb                     	movb	%al, -21(%rbp)
  800fbd: 0f 86 10 00 00 00            	jbe	0x800fd3 <strnlen+0x33>
  800fc3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fc7: 0f be 00                     	movsbl	(%rax), %eax
  800fca: 83 f8 00                     	cmpl	$0, %eax
  800fcd: 0f 95 c0                     	setne	%al
  800fd0: 88 45 eb                     	movb	%al, -21(%rbp)
  800fd3: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800fd6: a8 01                        	testb	$1, %al
  800fd8: 0f 85 05 00 00 00            	jne	0x800fe3 <strnlen+0x43>
  800fde: e9 26 00 00 00               	jmp	0x801009 <strnlen+0x69>
; 		n++;
  800fe3: 8b 45 ec                     	movl	-20(%rbp), %eax
  800fe6: 83 c0 01                     	addl	$1, %eax
  800fe9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800fec: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800ff0: 48 83 c0 01                  	addq	$1, %rax
  800ff4: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800ff8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ffc: 48 83 c0 ff                  	addq	$-1, %rax
  801000: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801004: e9 aa ff ff ff               	jmp	0x800fb3 <strnlen+0x13>
; 	return n;
  801009: 8b 45 ec                     	movl	-20(%rbp), %eax
  80100c: 5d                           	popq	%rbp
  80100d: c3                           	retq
  80100e: 66 90                        	nop

0000000000801010 <strcpy>:
; {
  801010: 55                           	pushq	%rbp
  801011: 48 89 e5                     	movq	%rsp, %rbp
  801014: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801018: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  80101c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801020: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  801024: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801028: 48 89 c1                     	movq	%rax, %rcx
  80102b: 48 83 c1 01                  	addq	$1, %rcx
  80102f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801033: 8a 00                        	movb	(%rax), %al
  801035: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  801039: 48 89 ca                     	movq	%rcx, %rdx
  80103c: 48 83 c2 01                  	addq	$1, %rdx
  801040: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801044: 88 01                        	movb	%al, (%rcx)
  801046: 0f be c0                     	movsbl	%al, %eax
  801049: 83 f8 00                     	cmpl	$0, %eax
  80104c: 0f 84 05 00 00 00            	je	0x801057 <strcpy+0x47>
  801052: e9 cd ff ff ff               	jmp	0x801024 <strcpy+0x14>
; 	return ret;
  801057: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80105b: 5d                           	popq	%rbp
  80105c: c3                           	retq
  80105d: 0f 1f 00                     	nopl	(%rax)

0000000000801060 <strcat>:
; {
  801060: 55                           	pushq	%rbp
  801061: 48 89 e5                     	movq	%rsp, %rbp
  801064: 48 83 ec 20                  	subq	$32, %rsp
  801068: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80106c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  801070: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801074: e8 e7 fe ff ff               	callq	0x800f60 <strlen>
  801079: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  80107c: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801080: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  801084: 48 01 c7                     	addq	%rax, %rdi
  801087: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80108b: e8 80 ff ff ff               	callq	0x801010 <strcpy>
; 	return dst;
  801090: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801094: 48 83 c4 20                  	addq	$32, %rsp
  801098: 5d                           	popq	%rbp
  801099: c3                           	retq
  80109a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

00000000008010a0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  8010a0: 55                           	pushq	%rbp
  8010a1: 48 89 e5                     	movq	%rsp, %rbp
  8010a4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010a8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8010ac: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  8010b0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010b4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  8010b8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  8010c0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8010c4: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  8010c8: 0f 83 49 00 00 00            	jae	0x801117 <strncpy+0x77>
; 		*dst++ = *src;
  8010ce: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010d2: 8a 08                        	movb	(%rax), %cl
  8010d4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010d8: 48 89 c2                     	movq	%rax, %rdx
  8010db: 48 83 c2 01                  	addq	$1, %rdx
  8010df: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010e3: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  8010e5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010e9: 0f be 00                     	movsbl	(%rax), %eax
  8010ec: 83 f8 00                     	cmpl	$0, %eax
  8010ef: 0f 84 0c 00 00 00            	je	0x801101 <strncpy+0x61>
; 			src++;
  8010f5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010f9: 48 83 c0 01                  	addq	$1, %rax
  8010fd: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801101: e9 00 00 00 00               	jmp	0x801106 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801106: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80110a: 48 83 c0 01                  	addq	$1, %rax
  80110e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801112: e9 a9 ff ff ff               	jmp	0x8010c0 <strncpy+0x20>
; 	return ret;
  801117: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80111b: 5d                           	popq	%rbp
  80111c: c3                           	retq
  80111d: 0f 1f 00                     	nopl	(%rax)

0000000000801120 <strlcpy>:
; {
  801120: 55                           	pushq	%rbp
  801121: 48 89 e5                     	movq	%rsp, %rbp
  801124: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801128: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80112c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  801130: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801134: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  801138: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  80113d: 0f 86 6e 00 00 00            	jbe	0x8011b1 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  801143: e9 00 00 00 00               	jmp	0x801148 <strlcpy+0x28>
  801148: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80114c: 48 83 c1 ff                  	addq	$-1, %rcx
  801150: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  801154: 31 c0                        	xorl	%eax, %eax
  801156: 48 83 f9 00                  	cmpq	$0, %rcx
  80115a: 88 45 df                     	movb	%al, -33(%rbp)
  80115d: 0f 86 10 00 00 00            	jbe	0x801173 <strlcpy+0x53>
  801163: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801167: 0f be 00                     	movsbl	(%rax), %eax
  80116a: 83 f8 00                     	cmpl	$0, %eax
  80116d: 0f 95 c0                     	setne	%al
  801170: 88 45 df                     	movb	%al, -33(%rbp)
  801173: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801176: a8 01                        	testb	$1, %al
  801178: 0f 85 05 00 00 00            	jne	0x801183 <strlcpy+0x63>
  80117e: e9 27 00 00 00               	jmp	0x8011aa <strlcpy+0x8a>
; 			*dst++ = *src++;
  801183: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801187: 48 89 c1                     	movq	%rax, %rcx
  80118a: 48 83 c1 01                  	addq	$1, %rcx
  80118e: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801192: 8a 08                        	movb	(%rax), %cl
  801194: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801198: 48 89 c2                     	movq	%rax, %rdx
  80119b: 48 83 c2 01                  	addq	$1, %rdx
  80119f: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8011a3: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  8011a5: e9 9e ff ff ff               	jmp	0x801148 <strlcpy+0x28>
; 		*dst = '\0';
  8011aa: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011ae: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8011b1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011b5: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8011b9: 48 29 c8                     	subq	%rcx, %rax
  8011bc: 5d                           	popq	%rbp
  8011bd: c3                           	retq
  8011be: 66 90                        	nop

00000000008011c0 <strcmp>:
; {
  8011c0: 55                           	pushq	%rbp
  8011c1: 48 89 e5                     	movq	%rsp, %rbp
  8011c4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011c8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  8011cc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011d0: 0f be 08                     	movsbl	(%rax), %ecx
  8011d3: 31 c0                        	xorl	%eax, %eax
  8011d5: 83 f9 00                     	cmpl	$0, %ecx
  8011d8: 88 45 ef                     	movb	%al, -17(%rbp)
  8011db: 0f 84 16 00 00 00            	je	0x8011f7 <strcmp+0x37>
  8011e1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011e5: 0f be 00                     	movsbl	(%rax), %eax
  8011e8: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8011ec: 0f be 09                     	movsbl	(%rcx), %ecx
  8011ef: 39 c8                        	cmpl	%ecx, %eax
  8011f1: 0f 94 c0                     	sete	%al
  8011f4: 88 45 ef                     	movb	%al, -17(%rbp)
  8011f7: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  8011fa: a8 01                        	testb	$1, %al
  8011fc: 0f 85 05 00 00 00            	jne	0x801207 <strcmp+0x47>
  801202: e9 1d 00 00 00               	jmp	0x801224 <strcmp+0x64>
; 		p++, q++;
  801207: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80120b: 48 83 c0 01                  	addq	$1, %rax
  80120f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801213: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801217: 48 83 c0 01                  	addq	$1, %rax
  80121b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80121f: e9 a8 ff ff ff               	jmp	0x8011cc <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801224: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801228: 0f b6 00                     	movzbl	(%rax), %eax
  80122b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80122f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801232: 29 c8                        	subl	%ecx, %eax
  801234: 5d                           	popq	%rbp
  801235: c3                           	retq
  801236: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000801240 <strncmp>:
; {
  801240: 55                           	pushq	%rbp
  801241: 48 89 e5                     	movq	%rsp, %rbp
  801244: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801248: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80124c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  801250: 31 c0                        	xorl	%eax, %eax
  801252: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801257: 88 45 df                     	movb	%al, -33(%rbp)
  80125a: 0f 86 2b 00 00 00            	jbe	0x80128b <strncmp+0x4b>
  801260: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801264: 0f be 08                     	movsbl	(%rax), %ecx
  801267: 31 c0                        	xorl	%eax, %eax
  801269: 83 f9 00                     	cmpl	$0, %ecx
  80126c: 88 45 df                     	movb	%al, -33(%rbp)
  80126f: 0f 84 16 00 00 00            	je	0x80128b <strncmp+0x4b>
  801275: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801279: 0f be 00                     	movsbl	(%rax), %eax
  80127c: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801280: 0f be 09                     	movsbl	(%rcx), %ecx
  801283: 39 c8                        	cmpl	%ecx, %eax
  801285: 0f 94 c0                     	sete	%al
  801288: 88 45 df                     	movb	%al, -33(%rbp)
  80128b: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80128e: a8 01                        	testb	$1, %al
  801290: 0f 85 05 00 00 00            	jne	0x80129b <strncmp+0x5b>
  801296: e9 29 00 00 00               	jmp	0x8012c4 <strncmp+0x84>
; 		n--, p++, q++;
  80129b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80129f: 48 83 c0 ff                  	addq	$-1, %rax
  8012a3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8012a7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012ab: 48 83 c0 01                  	addq	$1, %rax
  8012af: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8012b3: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8012b7: 48 83 c0 01                  	addq	$1, %rax
  8012bb: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012bf: e9 8c ff ff ff               	jmp	0x801250 <strncmp+0x10>
; 	if (n == 0)
  8012c4: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012c9: 0f 85 0c 00 00 00            	jne	0x8012db <strncmp+0x9b>
; 		return 0;
  8012cf: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  8012d6: e9 13 00 00 00               	jmp	0x8012ee <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  8012db: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012df: 0f b6 00                     	movzbl	(%rax), %eax
  8012e2: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8012e6: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012e9: 29 c8                        	subl	%ecx, %eax
  8012eb: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  8012ee: 8b 45 fc                     	movl	-4(%rbp), %eax
  8012f1: 5d                           	popq	%rbp
  8012f2: c3                           	retq
  8012f3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8012fd: 0f 1f 00                     	nopl	(%rax)

0000000000801300 <strchr>:
; {
  801300: 55                           	pushq	%rbp
  801301: 48 89 e5                     	movq	%rsp, %rbp
  801304: 40 88 f0                     	movb	%sil, %al
  801307: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80130b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80130e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801312: 80 38 00                     	cmpb	$0, (%rax)
  801315: 0f 84 36 00 00 00            	je	0x801351 <strchr+0x51>
; 		if (*s == c)
  80131b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80131f: 0f be 00                     	movsbl	(%rax), %eax
  801322: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801326: 39 c8                        	cmpl	%ecx, %eax
  801328: 0f 85 0d 00 00 00            	jne	0x80133b <strchr+0x3b>
; 			return (char *) s;
  80132e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801332: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801336: e9 1e 00 00 00               	jmp	0x801359 <strchr+0x59>
; 		if (*s == c)
  80133b: e9 00 00 00 00               	jmp	0x801340 <strchr+0x40>
; 	for (; *s; s++)
  801340: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801344: 48 83 c0 01                  	addq	$1, %rax
  801348: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80134c: e9 bd ff ff ff               	jmp	0x80130e <strchr+0xe>
; 	return 0;
  801351: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  801359: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80135d: 5d                           	popq	%rbp
  80135e: c3                           	retq
  80135f: 90                           	nop

0000000000801360 <strfind>:
; {
  801360: 55                           	pushq	%rbp
  801361: 48 89 e5                     	movq	%rsp, %rbp
  801364: 40 88 f0                     	movb	%sil, %al
  801367: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80136b: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  80136e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801372: 80 38 00                     	cmpb	$0, (%rax)
  801375: 0f 84 2e 00 00 00            	je	0x8013a9 <strfind+0x49>
; 		if (*s == c)
  80137b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80137f: 0f be 00                     	movsbl	(%rax), %eax
  801382: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  801386: 39 c8                        	cmpl	%ecx, %eax
  801388: 0f 85 05 00 00 00            	jne	0x801393 <strfind+0x33>
; 			break;
  80138e: e9 16 00 00 00               	jmp	0x8013a9 <strfind+0x49>
; 		if (*s == c)
  801393: e9 00 00 00 00               	jmp	0x801398 <strfind+0x38>
; 	for (; *s; s++)
  801398: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80139c: 48 83 c0 01                  	addq	$1, %rax
  8013a0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013a4: e9 c5 ff ff ff               	jmp	0x80136e <strfind+0xe>
; 	return (char *) s;
  8013a9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013ad: 5d                           	popq	%rbp
  8013ae: c3                           	retq
  8013af: 90                           	nop

00000000008013b0 <memset>:
; {
  8013b0: 55                           	pushq	%rbp
  8013b1: 48 89 e5                     	movq	%rsp, %rbp
  8013b4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8013b8: 89 75 ec                     	movl	%esi, -20(%rbp)
  8013bb: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  8013bf: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8013c4: 0f 85 0d 00 00 00            	jne	0x8013d7 <memset+0x27>
; 		return v;
  8013ca: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013ce: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013d2: e9 78 00 00 00               	jmp	0x80144f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  8013d7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013db: 48 83 e0 03                  	andq	$3, %rax
  8013df: 48 83 f8 00                  	cmpq	$0, %rax
  8013e3: 0f 85 50 00 00 00            	jne	0x801439 <memset+0x89>
  8013e9: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8013ed: 48 83 e0 03                  	andq	$3, %rax
  8013f1: 48 83 f8 00                  	cmpq	$0, %rax
  8013f5: 0f 85 3e 00 00 00            	jne	0x801439 <memset+0x89>
; 		c &= 0xFF;
  8013fb: 8b 45 ec                     	movl	-20(%rbp), %eax
  8013fe: 25 ff 00 00 00               	andl	$255, %eax
  801403: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801406: 8b 45 ec                     	movl	-20(%rbp), %eax
  801409: c1 e0 18                     	shll	$24, %eax
  80140c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80140f: c1 e1 10                     	shll	$16, %ecx
  801412: 09 c8                        	orl	%ecx, %eax
  801414: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801417: c1 e1 08                     	shll	$8, %ecx
  80141a: 09 c8                        	orl	%ecx, %eax
  80141c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80141f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801422: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801426: 8b 45 ec                     	movl	-20(%rbp), %eax
  801429: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80142d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801431: fc                           	cld
  801432: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801434: e9 0e 00 00 00               	jmp	0x801447 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801439: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  80143d: 8b 45 ec                     	movl	-20(%rbp), %eax
  801440: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  801444: fc                           	cld
  801445: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  801447: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80144b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  80144f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801453: 5d                           	popq	%rbp
  801454: c3                           	retq
  801455: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80145f: 90                           	nop

0000000000801460 <memmove>:
; {
  801460: 55                           	pushq	%rbp
  801461: 48 89 e5                     	movq	%rsp, %rbp
  801464: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801468: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80146c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  801470: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801474: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  801478: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80147c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  801480: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801484: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  801488: 0f 83 9d 00 00 00            	jae	0x80152b <memmove+0xcb>
  80148e: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801492: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801496: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  80149a: 0f 86 8b 00 00 00            	jbe	0x80152b <memmove+0xcb>
; 		s += n;
  8014a0: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014a4: 48 03 45 e0                  	addq	-32(%rbp), %rax
  8014a8: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  8014ac: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014b0: 48 03 45 d8                  	addq	-40(%rbp), %rax
  8014b4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8014b8: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014bc: 48 83 e0 03                  	andq	$3, %rax
  8014c0: 48 83 f8 00                  	cmpq	$0, %rax
  8014c4: 0f 85 44 00 00 00            	jne	0x80150e <memmove+0xae>
  8014ca: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8014ce: 48 83 e0 03                  	andq	$3, %rax
  8014d2: 48 83 f8 00                  	cmpq	$0, %rax
  8014d6: 0f 85 32 00 00 00            	jne	0x80150e <memmove+0xae>
  8014dc: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014e0: 48 83 e0 03                  	andq	$3, %rax
  8014e4: 48 83 f8 00                  	cmpq	$0, %rax
  8014e8: 0f 85 20 00 00 00            	jne	0x80150e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  8014ee: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  8014f2: 48 83 c7 fc                  	addq	$-4, %rdi
  8014f6: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  8014fa: 48 83 c6 fc                  	addq	$-4, %rsi
  8014fe: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801502: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801506: fd                           	std
  801507: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801509: e9 17 00 00 00               	jmp	0x801525 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80150e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801512: 48 83 c7 ff                  	addq	$-1, %rdi
  801516: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80151a: 48 83 c6 ff                  	addq	$-1, %rsi
  80151e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801522: fd                           	std
  801523: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801525: fc                           	cld
; 	} else {
  801526: e9 62 00 00 00               	jmp	0x80158d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80152b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80152f: 48 83 e0 03                  	andq	$3, %rax
  801533: 48 83 f8 00                  	cmpq	$0, %rax
  801537: 0f 85 3c 00 00 00            	jne	0x801579 <memmove+0x119>
  80153d: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801541: 48 83 e0 03                  	andq	$3, %rax
  801545: 48 83 f8 00                  	cmpq	$0, %rax
  801549: 0f 85 2a 00 00 00            	jne	0x801579 <memmove+0x119>
  80154f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801553: 48 83 e0 03                  	andq	$3, %rax
  801557: 48 83 f8 00                  	cmpq	$0, %rax
  80155b: 0f 85 18 00 00 00            	jne	0x801579 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  801561: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801565: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801569: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80156d: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801571: fc                           	cld
  801572: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801574: e9 0f 00 00 00               	jmp	0x801588 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801579: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  80157d: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801581: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801585: fc                           	cld
  801586: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801588: e9 00 00 00 00               	jmp	0x80158d <memmove+0x12d>
; 	return dst;
  80158d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801591: 5d                           	popq	%rbp
  801592: c3                           	retq
  801593: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80159d: 0f 1f 00                     	nopl	(%rax)

00000000008015a0 <memcpy>:
; {
  8015a0: 55                           	pushq	%rbp
  8015a1: 48 89 e5                     	movq	%rsp, %rbp
  8015a4: 48 83 ec 20                  	subq	$32, %rsp
  8015a8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8015ac: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8015b0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  8015b4: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8015b8: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8015bc: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8015c0: e8 9b fe ff ff               	callq	0x801460 <memmove>
  8015c5: 48 83 c4 20                  	addq	$32, %rsp
  8015c9: 5d                           	popq	%rbp
  8015ca: c3                           	retq
  8015cb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008015d0 <memcmp>:
; {
  8015d0: 55                           	pushq	%rbp
  8015d1: 48 89 e5                     	movq	%rsp, %rbp
  8015d4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8015d8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8015dc: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  8015e0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8015e4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  8015e8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015ec: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  8015f0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8015f4: 48 89 c1                     	movq	%rax, %rcx
  8015f7: 48 83 c1 ff                  	addq	$-1, %rcx
  8015fb: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  8015ff: 48 83 f8 00                  	cmpq	$0, %rax
  801603: 0f 86 4b 00 00 00            	jbe	0x801654 <memcmp+0x84>
; 		if (*s1 != *s2)
  801609: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80160d: 0f b6 00                     	movzbl	(%rax), %eax
  801610: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801614: 0f b6 09                     	movzbl	(%rcx), %ecx
  801617: 39 c8                        	cmpl	%ecx, %eax
  801619: 0f 84 18 00 00 00            	je	0x801637 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80161f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801623: 0f b6 00                     	movzbl	(%rax), %eax
  801626: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80162a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80162d: 29 c8                        	subl	%ecx, %eax
  80162f: 89 45 fc                     	movl	%eax, -4(%rbp)
  801632: e9 24 00 00 00               	jmp	0x80165b <memcmp+0x8b>
; 		s1++, s2++;
  801637: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80163b: 48 83 c0 01                  	addq	$1, %rax
  80163f: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  801643: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801647: 48 83 c0 01                  	addq	$1, %rax
  80164b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  80164f: e9 9c ff ff ff               	jmp	0x8015f0 <memcmp+0x20>
; 	return 0;
  801654: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  80165b: 8b 45 fc                     	movl	-4(%rbp), %eax
  80165e: 5d                           	popq	%rbp
  80165f: c3                           	retq

0000000000801660 <memfind>:
; {
  801660: 55                           	pushq	%rbp
  801661: 48 89 e5                     	movq	%rsp, %rbp
  801664: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801668: 89 75 f4                     	movl	%esi, -12(%rbp)
  80166b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  80166f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801673: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801677: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  80167b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80167f: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  801683: 0f 83 30 00 00 00            	jae	0x8016b9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801689: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80168d: 0f b6 00                     	movzbl	(%rax), %eax
  801690: 8b 4d f4                     	movl	-12(%rbp), %ecx
  801693: 0f b6 c9                     	movzbl	%cl, %ecx
  801696: 39 c8                        	cmpl	%ecx, %eax
  801698: 0f 85 05 00 00 00            	jne	0x8016a3 <memfind+0x43>
; 			break;
  80169e: e9 16 00 00 00               	jmp	0x8016b9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8016a3: e9 00 00 00 00               	jmp	0x8016a8 <memfind+0x48>
; 	for (; s < ends; s++)
  8016a8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016ac: 48 83 c0 01                  	addq	$1, %rax
  8016b0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8016b4: e9 c2 ff ff ff               	jmp	0x80167b <memfind+0x1b>
; 	return (void *) s;
  8016b9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016bd: 5d                           	popq	%rbp
  8016be: c3                           	retq
  8016bf: 90                           	nop

00000000008016c0 <strtol>:
; {
  8016c0: 55                           	pushq	%rbp
  8016c1: 48 89 e5                     	movq	%rsp, %rbp
  8016c4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016c8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8016cc: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  8016cf: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  8016d6: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8016de: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016e2: 0f be 08                     	movsbl	(%rax), %ecx
  8016e5: b0 01                        	movb	$1, %al
  8016e7: 83 f9 20                     	cmpl	$32, %ecx
  8016ea: 88 45 db                     	movb	%al, -37(%rbp)
  8016ed: 0f 84 10 00 00 00            	je	0x801703 <strtol+0x43>
  8016f3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016f7: 0f be 00                     	movsbl	(%rax), %eax
  8016fa: 83 f8 09                     	cmpl	$9, %eax
  8016fd: 0f 94 c0                     	sete	%al
  801700: 88 45 db                     	movb	%al, -37(%rbp)
  801703: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801706: a8 01                        	testb	$1, %al
  801708: 0f 85 05 00 00 00            	jne	0x801713 <strtol+0x53>
  80170e: e9 11 00 00 00               	jmp	0x801724 <strtol+0x64>
; 		s++;
  801713: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801717: 48 83 c0 01                  	addq	$1, %rax
  80171b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80171f: e9 ba ff ff ff               	jmp	0x8016de <strtol+0x1e>
; 	if (*s == '+')
  801724: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801728: 0f be 00                     	movsbl	(%rax), %eax
  80172b: 83 f8 2b                     	cmpl	$43, %eax
  80172e: 0f 85 11 00 00 00            	jne	0x801745 <strtol+0x85>
; 		s++;
  801734: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801738: 48 83 c0 01                  	addq	$1, %rax
  80173c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801740: e9 28 00 00 00               	jmp	0x80176d <strtol+0xad>
; 	else if (*s == '-')
  801745: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801749: 0f be 00                     	movsbl	(%rax), %eax
  80174c: 83 f8 2d                     	cmpl	$45, %eax
  80174f: 0f 85 13 00 00 00            	jne	0x801768 <strtol+0xa8>
; 		s++, neg = 1;
  801755: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801759: 48 83 c0 01                  	addq	$1, %rax
  80175d: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801761: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  801768: e9 00 00 00 00               	jmp	0x80176d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  80176d: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801771: 0f 84 0a 00 00 00            	je	0x801781 <strtol+0xc1>
  801777: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  80177b: 0f 85 39 00 00 00            	jne	0x8017ba <strtol+0xfa>
  801781: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801785: 0f be 00                     	movsbl	(%rax), %eax
  801788: 83 f8 30                     	cmpl	$48, %eax
  80178b: 0f 85 29 00 00 00            	jne	0x8017ba <strtol+0xfa>
  801791: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801795: 0f be 40 01                  	movsbl	1(%rax), %eax
  801799: 83 f8 78                     	cmpl	$120, %eax
  80179c: 0f 85 18 00 00 00            	jne	0x8017ba <strtol+0xfa>
; 		s += 2, base = 16;
  8017a2: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a6: 48 83 c0 02                  	addq	$2, %rax
  8017aa: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017ae: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  8017b5: e9 4d 00 00 00               	jmp	0x801807 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  8017ba: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017be: 0f 85 28 00 00 00            	jne	0x8017ec <strtol+0x12c>
  8017c4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017c8: 0f be 00                     	movsbl	(%rax), %eax
  8017cb: 83 f8 30                     	cmpl	$48, %eax
  8017ce: 0f 85 18 00 00 00            	jne	0x8017ec <strtol+0x12c>
; 		s++, base = 8;
  8017d4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017d8: 48 83 c0 01                  	addq	$1, %rax
  8017dc: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017e0: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  8017e7: e9 16 00 00 00               	jmp	0x801802 <strtol+0x142>
; 	else if (base == 0)
  8017ec: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017f0: 0f 85 07 00 00 00            	jne	0x8017fd <strtol+0x13d>
; 		base = 10;
  8017f6: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  8017fd: e9 00 00 00 00               	jmp	0x801802 <strtol+0x142>
  801802: e9 00 00 00 00               	jmp	0x801807 <strtol+0x147>
; 	while (1) {
  801807: e9 00 00 00 00               	jmp	0x80180c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80180c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801810: 0f be 00                     	movsbl	(%rax), %eax
  801813: 83 f8 30                     	cmpl	$48, %eax
  801816: 0f 8c 22 00 00 00            	jl	0x80183e <strtol+0x17e>
  80181c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801820: 0f be 00                     	movsbl	(%rax), %eax
  801823: 83 f8 39                     	cmpl	$57, %eax
  801826: 0f 8f 12 00 00 00            	jg	0x80183e <strtol+0x17e>
; 			dig = *s - '0';
  80182c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801830: 0f be 00                     	movsbl	(%rax), %eax
  801833: 83 e8 30                     	subl	$48, %eax
  801836: 89 45 dc                     	movl	%eax, -36(%rbp)
  801839: e9 79 00 00 00               	jmp	0x8018b7 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80183e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801842: 0f be 00                     	movsbl	(%rax), %eax
  801845: 83 f8 61                     	cmpl	$97, %eax
  801848: 0f 8c 25 00 00 00            	jl	0x801873 <strtol+0x1b3>
  80184e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801852: 0f be 00                     	movsbl	(%rax), %eax
  801855: 83 f8 7a                     	cmpl	$122, %eax
  801858: 0f 8f 15 00 00 00            	jg	0x801873 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  80185e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801862: 0f be 00                     	movsbl	(%rax), %eax
  801865: 83 e8 61                     	subl	$97, %eax
  801868: 83 c0 0a                     	addl	$10, %eax
  80186b: 89 45 dc                     	movl	%eax, -36(%rbp)
  80186e: e9 3f 00 00 00               	jmp	0x8018b2 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801873: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801877: 0f be 00                     	movsbl	(%rax), %eax
  80187a: 83 f8 41                     	cmpl	$65, %eax
  80187d: 0f 8c 25 00 00 00            	jl	0x8018a8 <strtol+0x1e8>
  801883: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801887: 0f be 00                     	movsbl	(%rax), %eax
  80188a: 83 f8 5a                     	cmpl	$90, %eax
  80188d: 0f 8f 15 00 00 00            	jg	0x8018a8 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  801893: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801897: 0f be 00                     	movsbl	(%rax), %eax
  80189a: 83 e8 41                     	subl	$65, %eax
  80189d: 83 c0 0a                     	addl	$10, %eax
  8018a0: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018a3: e9 05 00 00 00               	jmp	0x8018ad <strtol+0x1ed>
; 			break;
  8018a8: e9 43 00 00 00               	jmp	0x8018f0 <strtol+0x230>
  8018ad: e9 00 00 00 00               	jmp	0x8018b2 <strtol+0x1f2>
  8018b2: e9 00 00 00 00               	jmp	0x8018b7 <strtol+0x1f7>
; 		if (dig >= base)
  8018b7: 8b 45 dc                     	movl	-36(%rbp), %eax
  8018ba: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  8018bd: 0f 8c 05 00 00 00            	jl	0x8018c8 <strtol+0x208>
; 			break;
  8018c3: e9 28 00 00 00               	jmp	0x8018f0 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  8018c8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018cc: 48 83 c0 01                  	addq	$1, %rax
  8018d0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8018d4: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8018d8: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  8018dc: 48 0f af c1                  	imulq	%rcx, %rax
  8018e0: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  8018e4: 48 01 c8                     	addq	%rcx, %rax
  8018e7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  8018eb: e9 1c ff ff ff               	jmp	0x80180c <strtol+0x14c>
; 	if (endptr)
  8018f0: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  8018f5: 0f 84 0b 00 00 00            	je	0x801906 <strtol+0x246>
; 		*endptr = (char *) s;
  8018fb: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  8018ff: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801903: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801906: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80190a: 0f 84 0f 00 00 00            	je	0x80191f <strtol+0x25f>
  801910: 31 c0                        	xorl	%eax, %eax
  801912: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801916: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80191a: e9 08 00 00 00               	jmp	0x801927 <strtol+0x267>
  80191f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801923: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801927: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80192b: 5d                           	popq	%rbp
  80192c: c3                           	retq
  80192d: cc                           	int3
  80192e: cc                           	int3
  80192f: cc                           	int3

0000000000801930 <puts>:
; {
  801930: 55                           	pushq	%rbp
  801931: 48 89 e5                     	movq	%rsp, %rbp
  801934: 48 83 ec 20                  	subq	$32, %rsp
  801938: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80193c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  801940: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  801944: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  801948: 31 f6                        	xorl	%esi, %esi
  80194a: 31 c0                        	xorl	%eax, %eax
  80194c: 41 89 c1                     	movl	%eax, %r9d
  80194f: 89 f7                        	movl	%esi, %edi
  801951: 4d 89 c8                     	movq	%r9, %r8
  801954: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80195c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801965: e8 06 00 00 00               	callq	0x801970 <syscall>
; }
  80196a: 48 83 c4 20                  	addq	$32, %rsp
  80196e: 5d                           	popq	%rbp
  80196f: c3                           	retq

0000000000801970 <syscall>:
; {
  801970: 55                           	pushq	%rbp
  801971: 48 89 e5                     	movq	%rsp, %rbp
  801974: 48 83 ec 40                  	subq	$64, %rsp
  801978: 48 8b 45 18                  	movq	24(%rbp), %rax
  80197c: 48 8b 45 10                  	movq	16(%rbp), %rax
  801980: 89 7d fc                     	movl	%edi, -4(%rbp)
  801983: 89 75 f8                     	movl	%esi, -8(%rbp)
  801986: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80198a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80198e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  801992: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  801996: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  80199a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80199e: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8019a2: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8019a6: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  8019aa: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  8019ae: 48 8b 45 18                  	movq	24(%rbp), %rax
  8019b2: 48 89 04 24                  	movq	%rax, (%rsp)
  8019b6: e8 01 01 00 00               	callq	0x801abc <do_syscall>
  8019bb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  8019bf: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  8019c3: 0f 84 2c 00 00 00            	je	0x8019f5 <syscall+0x85>
  8019c9: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  8019ce: 0f 83 21 00 00 00            	jae	0x8019f5 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  8019d4: 8b 4d fc                     	movl	-4(%rbp), %ecx
  8019d7: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  8019db: 48 8d 3d 72 07 00 00         	leaq	1906(%rip), %rdi        # 0x802154 <testbss.c+0x802154>
  8019e2: be 1f 00 00 00               	movl	$31, %esi
  8019e7: 48 8d 15 e5 06 00 00         	leaq	1765(%rip), %rdx        # 0x8020d3 <testbss.c+0x8020d3>
  8019ee: b0 00                        	movb	$0, %al
  8019f0: e8 fb e7 ff ff               	callq	0x8001f0 <_panic>
; 	return ret;
  8019f5: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  8019f9: 48 83 c4 40                  	addq	$64, %rsp
  8019fd: 5d                           	popq	%rbp
  8019fe: c3                           	retq
  8019ff: 90                           	nop

0000000000801a00 <getc>:
; {
  801a00: 55                           	pushq	%rbp
  801a01: 48 89 e5                     	movq	%rsp, %rbp
  801a04: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801a08: bf 01 00 00 00               	movl	$1, %edi
  801a0d: 31 f6                        	xorl	%esi, %esi
  801a0f: 31 c0                        	xorl	%eax, %eax
  801a11: 41 89 c1                     	movl	%eax, %r9d
  801a14: 4c 89 ca                     	movq	%r9, %rdx
  801a17: 4c 89 c9                     	movq	%r9, %rcx
  801a1a: 4d 89 c8                     	movq	%r9, %r8
  801a1d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801a25: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801a2e: e8 3d ff ff ff               	callq	0x801970 <syscall>
  801a33: 48 83 c4 10                  	addq	$16, %rsp
  801a37: 5d                           	popq	%rbp
  801a38: c3                           	retq
  801a39: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000801a40 <kill>:
; {
  801a40: 55                           	pushq	%rbp
  801a41: 48 89 e5                     	movq	%rsp, %rbp
  801a44: 48 83 ec 20                  	subq	$32, %rsp
  801a48: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  801a4b: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  801a4f: bf 03 00 00 00               	movl	$3, %edi
  801a54: be 01 00 00 00               	movl	$1, %esi
  801a59: 31 c0                        	xorl	%eax, %eax
  801a5b: 41 89 c1                     	movl	%eax, %r9d
  801a5e: 4c 89 c9                     	movq	%r9, %rcx
  801a61: 4d 89 c8                     	movq	%r9, %r8
  801a64: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801a6c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801a75: e8 f6 fe ff ff               	callq	0x801970 <syscall>
  801a7a: 48 83 c4 20                  	addq	$32, %rsp
  801a7e: 5d                           	popq	%rbp
  801a7f: c3                           	retq

0000000000801a80 <getpid>:
; {
  801a80: 55                           	pushq	%rbp
  801a81: 48 89 e5                     	movq	%rsp, %rbp
  801a84: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  801a88: bf 02 00 00 00               	movl	$2, %edi
  801a8d: 31 f6                        	xorl	%esi, %esi
  801a8f: 31 c0                        	xorl	%eax, %eax
  801a91: 41 89 c1                     	movl	%eax, %r9d
  801a94: 4c 89 ca                     	movq	%r9, %rdx
  801a97: 4c 89 c9                     	movq	%r9, %rcx
  801a9a: 4d 89 c8                     	movq	%r9, %r8
  801a9d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801aa5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801aae: e8 bd fe ff ff               	callq	0x801970 <syscall>
  801ab3: 48 83 c4 10                  	addq	$16, %rsp
  801ab7: 5d                           	popq	%rbp
  801ab8: c3                           	retq
  801ab9: cc                           	int3
  801aba: cc                           	int3
  801abb: cc                           	int3

0000000000801abc <do_syscall>:
; 	pushq %rbp
  801abc: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  801abd: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  801ac2: cd 80                        	int	$128
; 	popq %rbp
  801ac4: 5d                           	popq	%rbp
; 	retq
  801ac5: c3                           	retq
