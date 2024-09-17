
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
  800042: e8 59 01 00 00               	callq	0x8001a0 <libmain>
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
  800058: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  80005f: 89 7d f8                     	movl	%edi, -8(%rbp)
  800062: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	printf("Making sure bss works right...\n");
  800066: 48 8d 3d 06 20 00 00         	leaq	8198(%rip), %rdi        # 0x802073 <testbss.c+0x802073>
  80006d: b0 00                        	movb	$0, %al
  80006f: e8 fc 02 00 00               	callq	0x800370 <printf>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  800074: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  80007b: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  800082: 0f 8d 45 00 00 00            	jge	0x8000cd <main+0x7d>
; 		if (big_array[i] != 0) {
  800088: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  80008c: 48 8d 05 6d 3f 00 00         	leaq	16237(%rip), %rax       # 0x804000 <big_array>
  800093: 83 3c 88 00                  	cmpl	$0, (%rax,%rcx,4)
  800097: 0f 84 1d 00 00 00            	je	0x8000ba <main+0x6a>
; 			panic("big_array[%d] isn't cleared!\n", i);
  80009d: 8b 4d ec                     	movl	-20(%rbp), %ecx
  8000a0: 48 8d 3d 63 20 00 00         	leaq	8291(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  8000a7: be 10 00 00 00               	movl	$16, %esi
  8000ac: 48 8d 15 e0 1f 00 00         	leaq	8160(%rip), %rdx        # 0x802093 <testbss.c+0x802093>
  8000b3: b0 00                        	movb	$0, %al
  8000b5: e8 46 01 00 00               	callq	0x800200 <_panic>
; 	}
  8000ba: e9 00 00 00 00               	jmp	0x8000bf <main+0x6f>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000bf: 8b 45 ec                     	movl	-20(%rbp), %eax
  8000c2: 83 c0 01                     	addl	$1, %eax
  8000c5: 89 45 ec                     	movl	%eax, -20(%rbp)
  8000c8: e9 ae ff ff ff               	jmp	0x80007b <main+0x2b>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000cd: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  8000d4: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  8000db: 0f 8d 1f 00 00 00            	jge	0x800100 <main+0xb0>
; 		big_array[i] = i;
  8000e1: 8b 55 ec                     	movl	-20(%rbp), %edx
  8000e4: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  8000e8: 48 8d 05 11 3f 00 00         	leaq	16145(%rip), %rax       # 0x804000 <big_array>
  8000ef: 89 14 88                     	movl	%edx, (%rax,%rcx,4)
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000f2: 8b 45 ec                     	movl	-20(%rbp), %eax
  8000f5: 83 c0 01                     	addl	$1, %eax
  8000f8: 89 45 ec                     	movl	%eax, -20(%rbp)
  8000fb: e9 d4 ff ff ff               	jmp	0x8000d4 <main+0x84>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  800100: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  800107: 81 7d ec 00 00 10 00         	cmpl	$1048576, -20(%rbp)     # imm = 0x100000
  80010e: 0f 8d 47 00 00 00            	jge	0x80015b <main+0x10b>
; 		if (big_array[i] != i) {
  800114: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800118: 48 8d 05 e1 3e 00 00         	leaq	16097(%rip), %rax       # 0x804000 <big_array>
  80011f: 8b 04 88                     	movl	(%rax,%rcx,4), %eax
  800122: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  800125: 0f 84 1d 00 00 00            	je	0x800148 <main+0xf8>
; 			panic("big_array[%d] didn't hold its value!\n", i);
  80012b: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80012e: 48 8d 3d d5 1f 00 00         	leaq	8149(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  800135: be 1a 00 00 00               	movl	$26, %esi
  80013a: 48 8d 15 5c 20 00 00         	leaq	8284(%rip), %rdx        # 0x80219d <testbss.c+0x80219d>
  800141: b0 00                        	movb	$0, %al
  800143: e8 b8 00 00 00               	callq	0x800200 <_panic>
; 	}
  800148: e9 00 00 00 00               	jmp	0x80014d <main+0xfd>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  80014d: 8b 45 ec                     	movl	-20(%rbp), %eax
  800150: 83 c0 01                     	addl	$1, %eax
  800153: 89 45 ec                     	movl	%eax, -20(%rbp)
  800156: e9 ac ff ff ff               	jmp	0x800107 <main+0xb7>
; 	printf("Yes, good. Now doing a wild write off the end...\n");
  80015b: 48 8d 3d b7 1f 00 00         	leaq	8119(%rip), %rdi        # 0x802119 <testbss.c+0x802119>
  800162: b0 00                        	movb	$0, %al
  800164: e8 07 02 00 00               	callq	0x800370 <printf>
; 	big_array[ARRAY_SIZE + 1024] = 0;
  800169: 48 8d 05 90 3e 00 00         	leaq	16016(%rip), %rax       # 0x804000 <big_array>
  800170: c7 80 00 10 40 00 00 00 00 00	movl	$0, 4198400(%rax)
; 	panic("Why are we still here?");
  80017a: 48 8d 3d 89 1f 00 00         	leaq	8073(%rip), %rdi        # 0x80210a <testbss.c+0x80210a>
  800181: be 20 00 00 00               	movl	$32, %esi
  800186: 48 8d 15 8e 1e 00 00         	leaq	7822(%rip), %rdx        # 0x80201b <testbss.c+0x80201b>
  80018d: b0 00                        	movb	$0, %al
  80018f: e8 6c 00 00 00               	callq	0x800200 <_panic>
  800194: cc                           	int3
  800195: cc                           	int3
  800196: cc                           	int3
  800197: cc                           	int3
  800198: cc                           	int3
  800199: cc                           	int3
  80019a: cc                           	int3
  80019b: cc                           	int3
  80019c: cc                           	int3
  80019d: cc                           	int3
  80019e: cc                           	int3
  80019f: cc                           	int3

00000000008001a0 <libmain>:
; {
  8001a0: 55                           	pushq	%rbp
  8001a1: 48 89 e5                     	movq	%rsp, %rbp
  8001a4: 48 83 ec 10                  	subq	$16, %rsp
  8001a8: 89 7d fc                     	movl	%edi, -4(%rbp)
  8001ab: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	if (argc > 0) {
  8001af: 83 7d fc 00                  	cmpl	$0, -4(%rbp)
  8001b3: 0f 8e 11 00 00 00            	jle	0x8001ca <libmain+0x2a>
; 		binary_name = argv[0];
  8001b9: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8001bd: 48 8b 08                     	movq	(%rax), %rcx
  8001c0: 48 8d 05 39 2e 00 00         	leaq	11833(%rip), %rax       # 0x803000 <binary_name>
  8001c7: 48 89 08                     	movq	%rcx, (%rax)
; 	main(argc, argv);
  8001ca: 8b 7d fc                     	movl	-4(%rbp), %edi
  8001cd: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8001d1: e8 7a fe ff ff               	callq	0x800050 <main>
; 	exit();
  8001d6: e8 15 00 00 00               	callq	0x8001f0 <exit>
; }
  8001db: 48 83 c4 10                  	addq	$16, %rsp
  8001df: 5d                           	popq	%rbp
  8001e0: c3                           	retq
  8001e1: cc                           	int3
  8001e2: cc                           	int3
  8001e3: cc                           	int3
  8001e4: cc                           	int3
  8001e5: cc                           	int3
  8001e6: cc                           	int3
  8001e7: cc                           	int3
  8001e8: cc                           	int3
  8001e9: cc                           	int3
  8001ea: cc                           	int3
  8001eb: cc                           	int3
  8001ec: cc                           	int3
  8001ed: cc                           	int3
  8001ee: cc                           	int3
  8001ef: cc                           	int3

00000000008001f0 <exit>:
; {
  8001f0: 55                           	pushq	%rbp
  8001f1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8001f4: 31 ff                        	xorl	%edi, %edi
  8001f6: e8 55 18 00 00               	callq	0x801a50 <kill>
; }
  8001fb: 5d                           	popq	%rbp
  8001fc: c3                           	retq
  8001fd: cc                           	int3
  8001fe: cc                           	int3
  8001ff: cc                           	int3

0000000000800200 <_panic>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 83 ec 60                  	subq	$96, %rsp
  800208: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80020c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800210: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800214: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800218: 89 75 f4                     	movl	%esi, -12(%rbp)
  80021b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	va_start(ap, fmt);
  80021f: 48 8d 45 d0                  	leaq	-48(%rbp), %rax
  800223: 48 8d 4d a0                  	leaq	-96(%rbp), %rcx
  800227: 48 89 48 10                  	movq	%rcx, 16(%rax)
  80022b: 48 8d 4d 10                  	leaq	16(%rbp), %rcx
  80022f: 48 89 48 08                  	movq	%rcx, 8(%rax)
  800233: c7 40 04 30 00 00 00         	movl	$48, 4(%rax)
  80023a: c7 00 18 00 00 00            	movl	$24, (%rax)
; 		getpid(), binary_name, file, line);
  800240: e8 4b 18 00 00               	callq	0x801a90 <getpid>
  800245: 89 c6                        	movl	%eax, %esi
  800247: 48 8d 05 b2 2d 00 00         	leaq	11698(%rip), %rax       # 0x803000 <binary_name>
  80024e: 48 8b 10                     	movq	(%rax), %rdx
  800251: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  800255: 44 8b 45 f4                  	movl	-12(%rbp), %r8d
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  800259: 48 8d 3d d5 1d 00 00         	leaq	7637(%rip), %rdi        # 0x802035 <testbss.c+0x802035>
  800260: b0 00                        	movb	$0, %al
  800262: e8 09 01 00 00               	callq	0x800370 <printf>
; 	vprintf(fmt, ap);
  800267: 48 8b 7d e8                  	movq	-24(%rbp), %rdi
  80026b: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
  80026f: e8 1c 00 00 00               	callq	0x800290 <vprintf>
; 	printf("\n");
  800274: 48 8d 3d d0 1e 00 00         	leaq	7888(%rip), %rdi        # 0x80214b <testbss.c+0x80214b>
  80027b: b0 00                        	movb	$0, %al
  80027d: e8 ee 00 00 00               	callq	0x800370 <printf>
; 		asm volatile("int3");
  800282: cc                           	int3
; 	while (1) {
  800283: e9 fa ff ff ff               	jmp	0x800282 <_panic+0x82>
  800288: cc                           	int3
  800289: cc                           	int3
  80028a: cc                           	int3
  80028b: cc                           	int3
  80028c: cc                           	int3
  80028d: cc                           	int3
  80028e: cc                           	int3
  80028f: cc                           	int3

0000000000800290 <vprintf>:
; {
  800290: 55                           	pushq	%rbp
  800291: 48 89 e5                     	movq	%rsp, %rbp
  800294: 48 81 ec 20 01 00 00         	subq	$288, %rsp              # imm = 0x120
  80029b: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80029f: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b.idx = 0;
  8002a3: c7 85 e8 fe ff ff 00 00 00 00	movl	$0, -280(%rbp)
; 	b.cnt = 0;
  8002ad: c7 85 ec fe ff ff 00 00 00 00	movl	$0, -276(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8002b7: 48 8d b5 e8 fe ff ff         	leaq	-280(%rbp), %rsi
  8002be: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  8002c2: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8002c6: 48 8d 3d 33 00 00 00         	leaq	51(%rip), %rdi          # 0x800300 <putch>
  8002cd: e8 fe 00 00 00               	callq	0x8003d0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8002d2: 48 8d bd e8 fe ff ff         	leaq	-280(%rbp), %rdi
  8002d9: 48 83 c7 08                  	addq	$8, %rdi
  8002dd: 48 63 b5 e8 fe ff ff         	movslq	-280(%rbp), %rsi
  8002e4: e8 57 16 00 00               	callq	0x801940 <puts>
; 	return b.cnt;
  8002e9: 8b 85 ec fe ff ff            	movl	-276(%rbp), %eax
  8002ef: 48 81 c4 20 01 00 00         	addq	$288, %rsp              # imm = 0x120
  8002f6: 5d                           	popq	%rbp
  8002f7: c3                           	retq
  8002f8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800300 <putch>:
; {
  800300: 55                           	pushq	%rbp
  800301: 48 89 e5                     	movq	%rsp, %rbp
  800304: 48 83 ec 10                  	subq	$16, %rsp
  800308: 89 7d fc                     	movl	%edi, -4(%rbp)
  80030b: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->buf[b->idx++] = ch;
  80030f: 8b 45 fc                     	movl	-4(%rbp), %eax
  800312: 88 c2                        	movb	%al, %dl
  800314: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800318: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80031c: 8b 0e                        	movl	(%rsi), %ecx
  80031e: 89 cf                        	movl	%ecx, %edi
  800320: 83 c7 01                     	addl	$1, %edi
  800323: 89 3e                        	movl	%edi, (%rsi)
  800325: 48 63 c9                     	movslq	%ecx, %rcx
  800328: 88 54 08 08                  	movb	%dl, 8(%rax,%rcx)
; 	if (b->idx == 256-1) {
  80032c: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800330: 81 38 ff 00 00 00            	cmpl	$255, (%rax)
  800336: 0f 85 1e 00 00 00            	jne	0x80035a <putch+0x5a>
; 		puts(b->buf, b->idx);
  80033c: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  800340: 48 83 c7 08                  	addq	$8, %rdi
  800344: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800348: 48 63 30                     	movslq	(%rax), %rsi
  80034b: e8 f0 15 00 00               	callq	0x801940 <puts>
; 		b->idx = 0;
  800350: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800354: c7 00 00 00 00 00            	movl	$0, (%rax)
; 	b->cnt++;
  80035a: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80035e: 8b 48 04                     	movl	4(%rax), %ecx
  800361: 83 c1 01                     	addl	$1, %ecx
  800364: 89 48 04                     	movl	%ecx, 4(%rax)
; }
  800367: 48 83 c4 10                  	addq	$16, %rsp
  80036b: 5d                           	popq	%rbp
  80036c: c3                           	retq
  80036d: 0f 1f 00                     	nopl	(%rax)

0000000000800370 <printf>:
; {
  800370: 55                           	pushq	%rbp
  800371: 48 89 e5                     	movq	%rsp, %rbp
  800374: 48 83 ec 60                  	subq	$96, %rsp
  800378: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  80037c: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800380: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800384: 48 89 55 b0                  	movq	%rdx, -80(%rbp)
  800388: 48 89 75 a8                  	movq	%rsi, -88(%rbp)
  80038c: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800390: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800394: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800398: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80039c: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8003a0: c7 45 e4 30 00 00 00         	movl	$48, -28(%rbp)
  8003a7: c7 45 e0 08 00 00 00         	movl	$8, -32(%rbp)
; 	cnt = vprintf(fmt, ap);
  8003ae: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8003b2: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
  8003b6: e8 d5 fe ff ff               	callq	0x800290 <vprintf>
  8003bb: 89 45 dc                     	movl	%eax, -36(%rbp)
; 	return cnt;
  8003be: 8b 45 dc                     	movl	-36(%rbp), %eax
  8003c1: 48 83 c4 60                  	addq	$96, %rsp
  8003c5: 5d                           	popq	%rbp
  8003c6: c3                           	retq
  8003c7: cc                           	int3
  8003c8: cc                           	int3
  8003c9: cc                           	int3
  8003ca: cc                           	int3
  8003cb: cc                           	int3
  8003cc: cc                           	int3
  8003cd: cc                           	int3
  8003ce: cc                           	int3
  8003cf: cc                           	int3

00000000008003d0 <vprintfmt>:
; {
  8003d0: 55                           	pushq	%rbp
  8003d1: 48 89 e5                     	movq	%rsp, %rbp
  8003d4: 48 81 ec 00 01 00 00         	subq	$256, %rsp              # imm = 0x100
  8003db: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8003df: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8003e3: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  8003e7: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
  8003eb: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8003ef: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  8003f3: 48 8b 4a 10                  	movq	16(%rdx), %rcx
  8003f7: 48 89 48 10                  	movq	%rcx, 16(%rax)
  8003fb: 48 8b 0a                     	movq	(%rdx), %rcx
  8003fe: 48 8b 52 08                  	movq	8(%rdx), %rdx
  800402: 48 89 50 08                  	movq	%rdx, 8(%rax)
  800406: 48 89 08                     	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800409: e9 00 00 00 00               	jmp	0x80040e <vprintfmt+0x3e>
  80040e: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800412: 48 89 c1                     	movq	%rax, %rcx
  800415: 48 83 c1 01                  	addq	$1, %rcx
  800419: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80041d: 0f b6 00                     	movzbl	(%rax), %eax
  800420: 89 45 b4                     	movl	%eax, -76(%rbp)
  800423: 83 f8 25                     	cmpl	$37, %eax
  800426: 0f 84 25 00 00 00            	je	0x800451 <vprintfmt+0x81>
; 			if (ch == '\0')
  80042c: 83 7d b4 00                  	cmpl	$0, -76(%rbp)
  800430: 0f 85 09 00 00 00            	jne	0x80043f <vprintfmt+0x6f>
; 				return;
  800436: 48 81 c4 00 01 00 00         	addq	$256, %rsp              # imm = 0x100
  80043d: 5d                           	popq	%rbp
  80043e: c3                           	retq
; 			putch(ch, putdat);
  80043f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800443: 8b 7d b4                     	movl	-76(%rbp), %edi
  800446: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80044a: ff d0                        	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  80044c: e9 bd ff ff ff               	jmp	0x80040e <vprintfmt+0x3e>
; 		padc = ' ';
  800451: c6 45 93 20                  	movb	$32, -109(%rbp)
; 		width = -1;
  800455: c7 45 9c ff ff ff ff         	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
  80045c: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
  800463: c7 45 a0 00 00 00 00         	movl	$0, -96(%rbp)
; 		altflag = 0;
  80046a: c7 45 94 00 00 00 00         	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
  800471: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800475: 48 89 c1                     	movq	%rax, %rcx
  800478: 48 83 c1 01                  	addq	$1, %rcx
  80047c: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  800480: 0f b6 00                     	movzbl	(%rax), %eax
  800483: 89 45 b4                     	movl	%eax, -76(%rbp)
  800486: 83 c0 dd                     	addl	$-35, %eax
  800489: 89 c1                        	movl	%eax, %ecx
  80048b: 48 89 4d 88                  	movq	%rcx, -120(%rbp)
  80048f: 83 e8 55                     	subl	$85, %eax
  800492: 0f 87 c1 05 00 00            	ja	0x800a59 <vprintfmt+0x689>
  800498: 48 8b 45 88                  	movq	-120(%rbp), %rax
  80049c: 48 8d 0d 2d 1d 00 00         	leaq	7469(%rip), %rcx        # 0x8021d0 <testbss.c+0x8021d0>
  8004a3: 48 63 04 81                  	movslq	(%rcx,%rax,4), %rax
  8004a7: 48 01 c8                     	addq	%rcx, %rax
  8004aa: ff e0                        	jmpq	*%rax
; 			padc = '-';
  8004ac: c6 45 93 2d                  	movb	$45, -109(%rbp)
; 			goto reswitch;
  8004b0: e9 bc ff ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			padc = '0';
  8004b5: c6 45 93 30                  	movb	$48, -109(%rbp)
; 			goto reswitch;
  8004b9: e9 b3 ff ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
  8004be: c7 45 98 00 00 00 00         	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
  8004c5: 6b 45 98 0a                  	imull	$10, -104(%rbp), %eax
  8004c9: 03 45 b4                     	addl	-76(%rbp), %eax
  8004cc: 83 e8 30                     	subl	$48, %eax
  8004cf: 89 45 98                     	movl	%eax, -104(%rbp)
; 				ch = *fmt;
  8004d2: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004d6: 0f be 00                     	movsbl	(%rax), %eax
  8004d9: 89 45 b4                     	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
  8004dc: 83 7d b4 30                  	cmpl	$48, -76(%rbp)
  8004e0: 0f 8c 0a 00 00 00            	jl	0x8004f0 <vprintfmt+0x120>
  8004e6: 83 7d b4 39                  	cmpl	$57, -76(%rbp)
  8004ea: 0f 8e 05 00 00 00            	jle	0x8004f5 <vprintfmt+0x125>
; 					break;
  8004f0: e9 16 00 00 00               	jmp	0x80050b <vprintfmt+0x13b>
; 			}
  8004f5: e9 00 00 00 00               	jmp	0x8004fa <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
  8004fa: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8004fe: 48 83 c0 01                  	addq	$1, %rax
  800502: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800506: e9 ba ff ff ff               	jmp	0x8004c5 <vprintfmt+0xf5>
; 			goto process_precision;
  80050b: e9 8c 00 00 00               	jmp	0x80059c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
  800510: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800514: 48 89 85 78 ff ff ff         	movq	%rax, -136(%rbp)
  80051b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80051e: 89 45 84                     	movl	%eax, -124(%rbp)
  800521: 83 f8 28                     	cmpl	$40, %eax
  800524: 0f 87 22 00 00 00            	ja	0x80054c <vprintfmt+0x17c>
  80052a: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
  800531: 8b 55 84                     	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
  800534: 48 63 c2                     	movslq	%edx, %rax
  800537: 48 03 41 10                  	addq	16(%rcx), %rax
  80053b: 83 c2 08                     	addl	$8, %edx
  80053e: 89 11                        	movl	%edx, (%rcx)
  800540: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800547: e9 1d 00 00 00               	jmp	0x800569 <vprintfmt+0x199>
  80054c: 48 8b 8d 78 ff ff ff         	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
  800553: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800557: 48 89 d0                     	movq	%rdx, %rax
  80055a: 48 83 c2 08                  	addq	$8, %rdx
  80055e: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800562: 48 89 85 70 ff ff ff         	movq	%rax, -144(%rbp)
  800569: 48 8b 85 70 ff ff ff         	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
  800570: 8b 00                        	movl	(%rax), %eax
  800572: 89 45 98                     	movl	%eax, -104(%rbp)
; 			goto process_precision;
  800575: e9 22 00 00 00               	jmp	0x80059c <vprintfmt+0x1cc>
; 			if (width < 0)
  80057a: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  80057e: 0f 8d 07 00 00 00            	jge	0x80058b <vprintfmt+0x1bb>
; 				width = 0;
  800584: c7 45 9c 00 00 00 00         	movl	$0, -100(%rbp)
; 			goto reswitch;
  80058b: e9 e1 fe ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			altflag = 1;
  800590: c7 45 94 01 00 00 00         	movl	$1, -108(%rbp)
; 			goto reswitch;
  800597: e9 d5 fe ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			if (width < 0)
  80059c: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8005a0: 0f 8d 0d 00 00 00            	jge	0x8005b3 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
  8005a6: 8b 45 98                     	movl	-104(%rbp), %eax
  8005a9: 89 45 9c                     	movl	%eax, -100(%rbp)
  8005ac: c7 45 98 ff ff ff ff         	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
  8005b3: e9 b9 fe ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			lflag++;
  8005b8: 8b 45 a0                     	movl	-96(%rbp), %eax
  8005bb: 83 c0 01                     	addl	$1, %eax
  8005be: 89 45 a0                     	movl	%eax, -96(%rbp)
; 			goto reswitch;
  8005c1: e9 ab fe ff ff               	jmp	0x800471 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
  8005c6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8005ca: 48 89 85 58 ff ff ff         	movq	%rax, -168(%rbp)
  8005d1: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  8005d5: 48 89 85 60 ff ff ff         	movq	%rax, -160(%rbp)
  8005dc: 8b 45 c0                     	movl	-64(%rbp), %eax
  8005df: 89 85 6c ff ff ff            	movl	%eax, -148(%rbp)
  8005e5: 83 f8 28                     	cmpl	$40, %eax
  8005e8: 0f 87 25 00 00 00            	ja	0x800613 <vprintfmt+0x243>
  8005ee: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
  8005f5: 8b 95 6c ff ff ff            	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
  8005fb: 48 63 c2                     	movslq	%edx, %rax
  8005fe: 48 03 41 10                  	addq	16(%rcx), %rax
  800602: 83 c2 08                     	addl	$8, %edx
  800605: 89 11                        	movl	%edx, (%rcx)
  800607: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  80060e: e9 1d 00 00 00               	jmp	0x800630 <vprintfmt+0x260>
  800613: 48 8b 8d 60 ff ff ff         	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80061a: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80061e: 48 89 d0                     	movq	%rdx, %rax
  800621: 48 83 c2 08                  	addq	$8, %rdx
  800625: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800629: 48 89 85 50 ff ff ff         	movq	%rax, -176(%rbp)
  800630: 48 8b 85 58 ff ff ff         	movq	-168(%rbp), %rax
  800637: 48 8b 8d 50 ff ff ff         	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
  80063e: 8b 39                        	movl	(%rcx), %edi
  800640: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800644: ff d0                        	callq	*%rax
; 			break;
  800646: e9 55 04 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 			err = va_arg(ap, int);
  80064b: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  80064f: 48 89 85 40 ff ff ff         	movq	%rax, -192(%rbp)
  800656: 8b 45 c0                     	movl	-64(%rbp), %eax
  800659: 89 85 4c ff ff ff            	movl	%eax, -180(%rbp)
  80065f: 83 f8 28                     	cmpl	$40, %eax
  800662: 0f 87 25 00 00 00            	ja	0x80068d <vprintfmt+0x2bd>
  800668: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
  80066f: 8b 95 4c ff ff ff            	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
  800675: 48 63 c2                     	movslq	%edx, %rax
  800678: 48 03 41 10                  	addq	16(%rcx), %rax
  80067c: 83 c2 08                     	addl	$8, %edx
  80067f: 89 11                        	movl	%edx, (%rcx)
  800681: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  800688: e9 1d 00 00 00               	jmp	0x8006aa <vprintfmt+0x2da>
  80068d: 48 8b 8d 40 ff ff ff         	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
  800694: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800698: 48 89 d0                     	movq	%rdx, %rax
  80069b: 48 83 c2 08                  	addq	$8, %rdx
  80069f: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8006a3: 48 89 85 38 ff ff ff         	movq	%rax, -200(%rbp)
  8006aa: 48 8b 85 38 ff ff ff         	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
  8006b1: 8b 00                        	movl	(%rax), %eax
  8006b3: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err < 0)
  8006b6: 83 7d b0 00                  	cmpl	$0, -80(%rbp)
  8006ba: 0f 8d 08 00 00 00            	jge	0x8006c8 <vprintfmt+0x2f8>
; 				err = -err;
  8006c0: 31 c0                        	xorl	%eax, %eax
  8006c2: 2b 45 b0                     	subl	-80(%rbp), %eax
  8006c5: 89 45 b0                     	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8006c8: 48 63 45 b0                  	movslq	-80(%rbp), %rax
  8006cc: 48 83 f8 09                  	cmpq	$9, %rax
  8006d0: 0f 83 1d 00 00 00            	jae	0x8006f3 <vprintfmt+0x323>
  8006d6: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8006da: 48 8d 05 2f 29 00 00         	leaq	10543(%rip), %rax       # 0x803010 <error_string>
  8006e1: 48 8b 04 c8                  	movq	(%rax,%rcx,8), %rax
  8006e5: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  8006e9: 48 83 f8 00                  	cmpq	$0, %rax
  8006ed: 0f 85 1e 00 00 00            	jne	0x800711 <vprintfmt+0x341>
; 				printfmt(putch, putdat, "error %d", err);
  8006f3: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8006f7: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8006fb: 8b 4d b0                     	movl	-80(%rbp), %ecx
  8006fe: 48 8d 15 eb 19 00 00         	leaq	6635(%rip), %rdx        # 0x8020f0 <testbss.c+0x8020f0>
  800705: b0 00                        	movb	$0, %al
  800707: e8 a4 03 00 00               	callq	0x800ab0 <printfmt>
  80070c: e9 1a 00 00 00               	jmp	0x80072b <vprintfmt+0x35b>
; 				printfmt(putch, putdat, "%s", p);
  800711: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800715: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800719: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80071d: 48 8d 15 0e 19 00 00         	leaq	6414(%rip), %rdx        # 0x802032 <testbss.c+0x802032>
  800724: b0 00                        	movb	$0, %al
  800726: e8 85 03 00 00               	callq	0x800ab0 <printfmt>
; 			break;
  80072b: e9 70 03 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800730: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800734: 48 89 85 28 ff ff ff         	movq	%rax, -216(%rbp)
  80073b: 8b 45 c0                     	movl	-64(%rbp), %eax
  80073e: 89 85 34 ff ff ff            	movl	%eax, -204(%rbp)
  800744: 83 f8 28                     	cmpl	$40, %eax
  800747: 0f 87 25 00 00 00            	ja	0x800772 <vprintfmt+0x3a2>
  80074d: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
  800754: 8b 95 34 ff ff ff            	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
  80075a: 48 63 c2                     	movslq	%edx, %rax
  80075d: 48 03 41 10                  	addq	16(%rcx), %rax
  800761: 83 c2 08                     	addl	$8, %edx
  800764: 89 11                        	movl	%edx, (%rcx)
  800766: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80076d: e9 1d 00 00 00               	jmp	0x80078f <vprintfmt+0x3bf>
  800772: 48 8b 8d 28 ff ff ff         	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
  800779: 48 8b 51 08                  	movq	8(%rcx), %rdx
  80077d: 48 89 d0                     	movq	%rdx, %rax
  800780: 48 83 c2 08                  	addq	$8, %rdx
  800784: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800788: 48 89 85 20 ff ff ff         	movq	%rax, -224(%rbp)
  80078f: 48 8b 85 20 ff ff ff         	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
  800796: 48 8b 00                     	movq	(%rax), %rax
  800799: 48 89 45 b8                  	movq	%rax, -72(%rbp)
  80079d: 48 83 f8 00                  	cmpq	$0, %rax
  8007a1: 0f 85 0b 00 00 00            	jne	0x8007b2 <vprintfmt+0x3e2>
; 				p = "(null)";
  8007a7: 48 8d 05 9f 19 00 00         	leaq	6559(%rip), %rax        # 0x80214d <testbss.c+0x80214d>
  8007ae: 48 89 45 b8                  	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
  8007b2: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8007b6: 0f 8e 4f 00 00 00            	jle	0x80080b <vprintfmt+0x43b>
  8007bc: 0f be 45 93                  	movsbl	-109(%rbp), %eax
  8007c0: 83 f8 2d                     	cmpl	$45, %eax
  8007c3: 0f 84 42 00 00 00            	je	0x80080b <vprintfmt+0x43b>
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8007c9: 48 8b 7d b8                  	movq	-72(%rbp), %rdi
  8007cd: 48 63 75 98                  	movslq	-104(%rbp), %rsi
  8007d1: e8 da 07 00 00               	callq	0x800fb0 <strnlen>
  8007d6: 89 c1                        	movl	%eax, %ecx
  8007d8: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007db: 29 c8                        	subl	%ecx, %eax
  8007dd: 89 45 9c                     	movl	%eax, -100(%rbp)
  8007e0: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8007e4: 0f 8e 1c 00 00 00            	jle	0x800806 <vprintfmt+0x436>
; 					putch(padc, putdat);
  8007ea: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8007ee: 0f be 7d 93                  	movsbl	-109(%rbp), %edi
  8007f2: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8007f6: ff d0                        	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8007f8: 8b 45 9c                     	movl	-100(%rbp), %eax
  8007fb: 83 c0 ff                     	addl	$-1, %eax
  8007fe: 89 45 9c                     	movl	%eax, -100(%rbp)
  800801: e9 da ff ff ff               	jmp	0x8007e0 <vprintfmt+0x410>
; 					putch(padc, putdat);
  800806: e9 00 00 00 00               	jmp	0x80080b <vprintfmt+0x43b>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80080b: e9 00 00 00 00               	jmp	0x800810 <vprintfmt+0x440>
  800810: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800814: 48 89 c1                     	movq	%rax, %rcx
  800817: 48 83 c1 01                  	addq	$1, %rcx
  80081b: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80081f: 0f be 08                     	movsbl	(%rax), %ecx
  800822: 89 4d b4                     	movl	%ecx, -76(%rbp)
  800825: 31 c0                        	xorl	%eax, %eax
  800827: 83 f9 00                     	cmpl	$0, %ecx
  80082a: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800830: 0f 84 33 00 00 00            	je	0x800869 <vprintfmt+0x499>
  800836: b0 01                        	movb	$1, %al
  800838: 83 7d 98 00                  	cmpl	$0, -104(%rbp)
  80083c: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  800842: 0f 8c 15 00 00 00            	jl	0x80085d <vprintfmt+0x48d>
  800848: 8b 45 98                     	movl	-104(%rbp), %eax
  80084b: 83 c0 ff                     	addl	$-1, %eax
  80084e: 89 45 98                     	movl	%eax, -104(%rbp)
  800851: 83 f8 00                     	cmpl	$0, %eax
  800854: 0f 9d c0                     	setge	%al
  800857: 88 85 1e ff ff ff            	movb	%al, -226(%rbp)
  80085d: 8a 85 1e ff ff ff            	movb	-226(%rbp), %al
  800863: 88 85 1f ff ff ff            	movb	%al, -225(%rbp)
  800869: 8a 85 1f ff ff ff            	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80086f: a8 01                        	testb	$1, %al
  800871: 0f 85 05 00 00 00            	jne	0x80087c <vprintfmt+0x4ac>
  800877: e9 52 00 00 00               	jmp	0x8008ce <vprintfmt+0x4fe>
; 				if (altflag && (ch < ' ' || ch > '~'))
  80087c: 83 7d 94 00                  	cmpl	$0, -108(%rbp)
  800880: 0f 84 28 00 00 00            	je	0x8008ae <vprintfmt+0x4de>
  800886: 83 7d b4 20                  	cmpl	$32, -76(%rbp)
  80088a: 0f 8c 0a 00 00 00            	jl	0x80089a <vprintfmt+0x4ca>
  800890: 83 7d b4 7e                  	cmpl	$126, -76(%rbp)
  800894: 0f 8e 14 00 00 00            	jle	0x8008ae <vprintfmt+0x4de>
; 					putch('?', putdat);
  80089a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80089e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008a2: bf 3f 00 00 00               	movl	$63, %edi
  8008a7: ff d0                        	callq	*%rax
  8008a9: e9 0d 00 00 00               	jmp	0x8008bb <vprintfmt+0x4eb>
; 					putch(ch, putdat);
  8008ae: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008b2: 8b 7d b4                     	movl	-76(%rbp), %edi
  8008b5: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008b9: ff d0                        	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
  8008bb: e9 00 00 00 00               	jmp	0x8008c0 <vprintfmt+0x4f0>
; 					width--)
  8008c0: 8b 45 9c                     	movl	-100(%rbp), %eax
  8008c3: 83 c0 ff                     	addl	$-1, %eax
  8008c6: 89 45 9c                     	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8008c9: e9 42 ff ff ff               	jmp	0x800810 <vprintfmt+0x440>
; 			for (; width > 0; width--)
  8008ce: e9 00 00 00 00               	jmp	0x8008d3 <vprintfmt+0x503>
  8008d3: 83 7d 9c 00                  	cmpl	$0, -100(%rbp)
  8008d7: 0f 8e 1d 00 00 00            	jle	0x8008fa <vprintfmt+0x52a>
; 				putch(' ', putdat);
  8008dd: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8008e1: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8008e5: bf 20 00 00 00               	movl	$32, %edi
  8008ea: ff d0                        	callq	*%rax
; 			for (; width > 0; width--)
  8008ec: 8b 45 9c                     	movl	-100(%rbp), %eax
  8008ef: 83 c0 ff                     	addl	$-1, %eax
  8008f2: 89 45 9c                     	movl	%eax, -100(%rbp)
  8008f5: e9 d9 ff ff ff               	jmp	0x8008d3 <vprintfmt+0x503>
; 			break;
  8008fa: e9 a1 01 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 			num = getint(&ap, lflag);
  8008ff: 8b 75 a0                     	movl	-96(%rbp), %esi
  800902: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800906: e8 05 02 00 00               	callq	0x800b10 <getint>
  80090b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
  80090f: 48 83 7d a8 00               	cmpq	$0, -88(%rbp)
  800914: 0f 8d 19 00 00 00            	jge	0x800933 <vprintfmt+0x563>
; 				putch('-', putdat);
  80091a: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80091e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800922: bf 2d 00 00 00               	movl	$45, %edi
  800927: ff d0                        	callq	*%rax
; 				num = -(long long) num;
  800929: 31 c0                        	xorl	%eax, %eax
  80092b: 48 2b 45 a8                  	subq	-88(%rbp), %rax
  80092f: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  800933: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  80093a: e9 e6 00 00 00               	jmp	0x800a25 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80093f: 8b 75 a0                     	movl	-96(%rbp), %esi
  800942: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800946: e8 f5 02 00 00               	callq	0x800c40 <getuint>
  80094b: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 10;
  80094f: c7 45 a4 0a 00 00 00         	movl	$10, -92(%rbp)
; 			goto number;
  800956: e9 ca 00 00 00               	jmp	0x800a25 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  80095b: 8b 75 a0                     	movl	-96(%rbp), %esi
  80095e: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800962: e8 d9 02 00 00               	callq	0x800c40 <getuint>
  800967: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 8;
  80096b: c7 45 a4 08 00 00 00         	movl	$8, -92(%rbp)
; 			goto number;
  800972: e9 ae 00 00 00               	jmp	0x800a25 <vprintfmt+0x655>
; 			putch('0', putdat);
  800977: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80097b: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80097f: bf 30 00 00 00               	movl	$48, %edi
  800984: ff d0                        	callq	*%rax
; 			putch('x', putdat);
  800986: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80098a: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80098e: bf 78 00 00 00               	movl	$120, %edi
  800993: ff d0                        	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
  800995: 48 8d 45 c0                  	leaq	-64(%rbp), %rax
  800999: 48 89 85 10 ff ff ff         	movq	%rax, -240(%rbp)
  8009a0: 8b 45 c0                     	movl	-64(%rbp), %eax
  8009a3: 89 85 18 ff ff ff            	movl	%eax, -232(%rbp)
  8009a9: 83 f8 28                     	cmpl	$40, %eax
  8009ac: 0f 87 25 00 00 00            	ja	0x8009d7 <vprintfmt+0x607>
  8009b2: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
  8009b9: 8b 95 18 ff ff ff            	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
  8009bf: 48 63 c2                     	movslq	%edx, %rax
  8009c2: 48 03 41 10                  	addq	16(%rcx), %rax
  8009c6: 83 c2 08                     	addl	$8, %edx
  8009c9: 89 11                        	movl	%edx, (%rcx)
  8009cb: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  8009d2: e9 1d 00 00 00               	jmp	0x8009f4 <vprintfmt+0x624>
  8009d7: 48 8b 8d 10 ff ff ff         	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
  8009de: 48 8b 51 08                  	movq	8(%rcx), %rdx
  8009e2: 48 89 d0                     	movq	%rdx, %rax
  8009e5: 48 83 c2 08                  	addq	$8, %rdx
  8009e9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  8009ed: 48 89 85 08 ff ff ff         	movq	%rax, -248(%rbp)
  8009f4: 48 8b 85 08 ff ff ff         	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
  8009fb: 48 8b 00                     	movq	(%rax), %rax
; 			num = (unsigned long long)
  8009fe: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a02: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			goto number;
  800a09: e9 17 00 00 00               	jmp	0x800a25 <vprintfmt+0x655>
; 			num = getuint(&ap, lflag);
  800a0e: 8b 75 a0                     	movl	-96(%rbp), %esi
  800a11: 48 8d 7d c0                  	leaq	-64(%rbp), %rdi
  800a15: e8 26 02 00 00               	callq	0x800c40 <getuint>
  800a1a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
; 			base = 16;
  800a1e: c7 45 a4 10 00 00 00         	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
  800a25: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800a29: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a2d: 48 8b 55 a8                  	movq	-88(%rbp), %rdx
  800a31: 8b 4d a4                     	movl	-92(%rbp), %ecx
  800a34: 44 8b 45 9c                  	movl	-100(%rbp), %r8d
  800a38: 44 0f be 4d 93               	movsbl	-109(%rbp), %r9d
  800a3d: e8 2e 03 00 00               	callq	0x800d70 <printnum>
; 			break;
  800a42: e9 59 00 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 			putch(ch, putdat);
  800a47: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a4b: 8b 7d b4                     	movl	-76(%rbp), %edi
  800a4e: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a52: ff d0                        	callq	*%rax
; 			break;
  800a54: e9 47 00 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 			putch('%', putdat);
  800a59: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800a5d: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800a61: bf 25 00 00 00               	movl	$37, %edi
  800a66: ff d0                        	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800a68: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a6c: 48 83 c0 ff                  	addq	$-1, %rax
  800a70: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800a74: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a78: 0f be 40 ff                  	movsbl	-1(%rax), %eax
  800a7c: 83 f8 25                     	cmpl	$37, %eax
  800a7f: 0f 84 16 00 00 00            	je	0x800a9b <vprintfmt+0x6cb>
  800a85: e9 00 00 00 00               	jmp	0x800a8a <vprintfmt+0x6ba>
  800a8a: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800a8e: 48 83 c0 ff                  	addq	$-1, %rax
  800a92: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800a96: e9 d9 ff ff ff               	jmp	0x800a74 <vprintfmt+0x6a4>
; 			break;
  800a9b: e9 00 00 00 00               	jmp	0x800aa0 <vprintfmt+0x6d0>
; 	while (1) {
  800aa0: e9 64 f9 ff ff               	jmp	0x800409 <vprintfmt+0x39>
  800aa5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800aaf: 90                           	nop

0000000000800ab0 <printfmt>:
; {
  800ab0: 55                           	pushq	%rbp
  800ab1: 48 89 e5                     	movq	%rsp, %rbp
  800ab4: 48 83 ec 60                  	subq	$96, %rsp
  800ab8: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800abc: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  800ac0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800ac4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800ac8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800acc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800ad0: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800ad4: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800ad8: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800adc: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800ae0: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800ae7: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
  800aee: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800af2: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800af6: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800afa: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800afe: e8 cd f8 ff ff               	callq	0x8003d0 <vprintfmt>
; }
  800b03: 48 83 c4 60                  	addq	$96, %rsp
  800b07: 5d                           	popq	%rbp
  800b08: c3                           	retq
  800b09: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800b10 <getint>:
; {
  800b10: 55                           	pushq	%rbp
  800b11: 48 89 e5                     	movq	%rsp, %rbp
  800b14: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800b18: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800b1b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800b1f: 0f 8c 59 00 00 00            	jl	0x800b7e <getint+0x6e>
; 		return va_arg(*ap, long long);
  800b25: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b29: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800b2d: 8b 00                        	movl	(%rax), %eax
  800b2f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800b32: 83 f8 28                     	cmpl	$40, %eax
  800b35: 0f 87 1c 00 00 00            	ja	0x800b57 <getint+0x47>
  800b3b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800b3f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
  800b42: 48 63 c2                     	movslq	%edx, %rax
  800b45: 48 03 41 10                  	addq	16(%rcx), %rax
  800b49: 83 c2 08                     	addl	$8, %edx
  800b4c: 89 11                        	movl	%edx, (%rcx)
  800b4e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b52: e9 17 00 00 00               	jmp	0x800b6e <getint+0x5e>
  800b57: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
  800b5b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800b5f: 48 89 d0                     	movq	%rdx, %rax
  800b62: 48 83 c2 08                  	addq	$8, %rdx
  800b66: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800b6a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800b6e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
  800b72: 48 8b 00                     	movq	(%rax), %rax
  800b75: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800b79: e9 b7 00 00 00               	jmp	0x800c35 <getint+0x125>
; 	else if (lflag)
  800b7e: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800b82: 0f 84 59 00 00 00            	je	0x800be1 <getint+0xd1>
; 		return va_arg(*ap, long);
  800b88: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800b8c: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800b90: 8b 00                        	movl	(%rax), %eax
  800b92: 89 45 d4                     	movl	%eax, -44(%rbp)
  800b95: 83 f8 28                     	cmpl	$40, %eax
  800b98: 0f 87 1c 00 00 00            	ja	0x800bba <getint+0xaa>
  800b9e: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800ba2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
  800ba5: 48 63 c2                     	movslq	%edx, %rax
  800ba8: 48 03 41 10                  	addq	16(%rcx), %rax
  800bac: 83 c2 08                     	addl	$8, %edx
  800baf: 89 11                        	movl	%edx, (%rcx)
  800bb1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800bb5: e9 17 00 00 00               	jmp	0x800bd1 <getint+0xc1>
  800bba: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
  800bbe: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800bc2: 48 89 d0                     	movq	%rdx, %rax
  800bc5: 48 83 c2 08                  	addq	$8, %rdx
  800bc9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800bcd: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800bd1: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
  800bd5: 48 8b 00                     	movq	(%rax), %rax
  800bd8: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800bdc: e9 54 00 00 00               	jmp	0x800c35 <getint+0x125>
; 		return va_arg(*ap, int);
  800be1: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800be5: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800be9: 8b 00                        	movl	(%rax), %eax
  800beb: 89 45 bc                     	movl	%eax, -68(%rbp)
  800bee: 83 f8 28                     	cmpl	$40, %eax
  800bf1: 0f 87 1c 00 00 00            	ja	0x800c13 <getint+0x103>
  800bf7: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800bfb: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
  800bfe: 48 63 c2                     	movslq	%edx, %rax
  800c01: 48 03 41 10                  	addq	16(%rcx), %rax
  800c05: 83 c2 08                     	addl	$8, %edx
  800c08: 89 11                        	movl	%edx, (%rcx)
  800c0a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c0e: e9 17 00 00 00               	jmp	0x800c2a <getint+0x11a>
  800c13: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
  800c17: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c1b: 48 89 d0                     	movq	%rdx, %rax
  800c1e: 48 83 c2 08                  	addq	$8, %rdx
  800c22: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c26: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800c2a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
  800c2e: 48 63 00                     	movslq	(%rax), %rax
  800c31: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800c35: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800c39: 5d                           	popq	%rbp
  800c3a: c3                           	retq
  800c3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800c40 <getuint>:
; {
  800c40: 55                           	pushq	%rbp
  800c41: 48 89 e5                     	movq	%rsp, %rbp
  800c44: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800c48: 89 75 ec                     	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
  800c4b: 83 7d ec 02                  	cmpl	$2, -20(%rbp)
  800c4f: 0f 8c 59 00 00 00            	jl	0x800cae <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
  800c55: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800c59: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800c5d: 8b 00                        	movl	(%rax), %eax
  800c5f: 89 45 e8                     	movl	%eax, -24(%rbp)
  800c62: 83 f8 28                     	cmpl	$40, %eax
  800c65: 0f 87 1c 00 00 00            	ja	0x800c87 <getuint+0x47>
  800c6b: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  800c6f: 8b 55 e8                     	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
  800c72: 48 63 c2                     	movslq	%edx, %rax
  800c75: 48 03 41 10                  	addq	16(%rcx), %rax
  800c79: 83 c2 08                     	addl	$8, %edx
  800c7c: 89 11                        	movl	%edx, (%rcx)
  800c7e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800c82: e9 17 00 00 00               	jmp	0x800c9e <getuint+0x5e>
  800c87: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
  800c8b: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800c8f: 48 89 d0                     	movq	%rdx, %rax
  800c92: 48 83 c2 08                  	addq	$8, %rdx
  800c96: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800c9a: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800c9e: 48 8b 45 d8                  	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
  800ca2: 48 8b 00                     	movq	(%rax), %rax
  800ca5: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800ca9: e9 b6 00 00 00               	jmp	0x800d64 <getuint+0x124>
; 	else if (lflag)
  800cae: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  800cb2: 0f 84 59 00 00 00            	je	0x800d11 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
  800cb8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800cbc: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800cc0: 8b 00                        	movl	(%rax), %eax
  800cc2: 89 45 d4                     	movl	%eax, -44(%rbp)
  800cc5: 83 f8 28                     	cmpl	$40, %eax
  800cc8: 0f 87 1c 00 00 00            	ja	0x800cea <getuint+0xaa>
  800cce: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
  800cd2: 8b 55 d4                     	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
  800cd5: 48 63 c2                     	movslq	%edx, %rax
  800cd8: 48 03 41 10                  	addq	16(%rcx), %rax
  800cdc: 83 c2 08                     	addl	$8, %edx
  800cdf: 89 11                        	movl	%edx, (%rcx)
  800ce1: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800ce5: e9 17 00 00 00               	jmp	0x800d01 <getuint+0xc1>
  800cea: 48 8b 4d c8                  	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
  800cee: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800cf2: 48 89 d0                     	movq	%rdx, %rax
  800cf5: 48 83 c2 08                  	addq	$8, %rdx
  800cf9: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800cfd: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800d01: 48 8b 45 c0                  	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
  800d05: 48 8b 00                     	movq	(%rax), %rax
  800d08: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800d0c: e9 53 00 00 00               	jmp	0x800d64 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
  800d11: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800d15: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800d19: 8b 00                        	movl	(%rax), %eax
  800d1b: 89 45 bc                     	movl	%eax, -68(%rbp)
  800d1e: 83 f8 28                     	cmpl	$40, %eax
  800d21: 0f 87 1c 00 00 00            	ja	0x800d43 <getuint+0x103>
  800d27: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
  800d2b: 8b 55 bc                     	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
  800d2e: 48 63 c2                     	movslq	%edx, %rax
  800d31: 48 03 41 10                  	addq	16(%rcx), %rax
  800d35: 83 c2 08                     	addl	$8, %edx
  800d38: 89 11                        	movl	%edx, (%rcx)
  800d3a: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d3e: e9 17 00 00 00               	jmp	0x800d5a <getuint+0x11a>
  800d43: 48 8b 4d b0                  	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
  800d47: 48 8b 51 08                  	movq	8(%rcx), %rdx
  800d4b: 48 89 d0                     	movq	%rdx, %rax
  800d4e: 48 83 c2 08                  	addq	$8, %rdx
  800d52: 48 89 51 08                  	movq	%rdx, 8(%rcx)
  800d56: 48 89 45 a8                  	movq	%rax, -88(%rbp)
  800d5a: 48 8b 45 a8                  	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
  800d5e: 8b 00                        	movl	(%rax), %eax
  800d60: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  800d64: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800d68: 5d                           	popq	%rbp
  800d69: c3                           	retq
  800d6a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800d70 <printnum>:
; {
  800d70: 55                           	pushq	%rbp
  800d71: 48 89 e5                     	movq	%rsp, %rbp
  800d74: 48 83 ec 30                  	subq	$48, %rsp
  800d78: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800d7c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  800d80: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800d84: 89 4d e4                     	movl	%ecx, -28(%rbp)
  800d87: 44 89 45 e0                  	movl	%r8d, -32(%rbp)
  800d8b: 44 89 4d dc                  	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
  800d8f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800d93: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800d96: 48 39 c8                     	cmpq	%rcx, %rax
  800d99: 0f 82 30 00 00 00            	jb	0x800dcf <printnum+0x5f>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800d9f: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800da3: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800da7: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800dab: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800dae: 31 d2                        	xorl	%edx, %edx
  800db0: 48 f7 f1                     	divq	%rcx
  800db3: 48 89 c2                     	movq	%rax, %rdx
  800db6: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800db9: 44 8b 45 e0                  	movl	-32(%rbp), %r8d
  800dbd: 41 83 e8 01                  	subl	$1, %r8d
  800dc1: 44 8b 4d dc                  	movl	-36(%rbp), %r9d
  800dc5: e8 a6 ff ff ff               	callq	0x800d70 <printnum>
; 	} else {
  800dca: e9 2e 00 00 00               	jmp	0x800dfd <printnum+0x8d>
; 		while (--width > 0)
  800dcf: e9 00 00 00 00               	jmp	0x800dd4 <printnum+0x64>
  800dd4: 8b 45 e0                     	movl	-32(%rbp), %eax
  800dd7: 83 c0 ff                     	addl	$-1, %eax
  800dda: 89 45 e0                     	movl	%eax, -32(%rbp)
  800ddd: 83 f8 00                     	cmpl	$0, %eax
  800de0: 0f 8e 12 00 00 00            	jle	0x800df8 <printnum+0x88>
; 			putch(padc, putdat);
  800de6: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800dea: 8b 7d dc                     	movl	-36(%rbp), %edi
  800ded: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800df1: ff d0                        	callq	*%rax
; 		while (--width > 0)
  800df3: e9 dc ff ff ff               	jmp	0x800dd4 <printnum+0x64>
  800df8: e9 00 00 00 00               	jmp	0x800dfd <printnum+0x8d>
; 	putch("0123456789abcdef"[num % base], putdat);
  800dfd: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800e01: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  800e05: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800e09: 8b 4d e4                     	movl	-28(%rbp), %ecx
  800e0c: 31 d2                        	xorl	%edx, %edx
  800e0e: 48 f7 f1                     	divq	%rcx
  800e11: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  800e15: 48 8d 0d dd 12 00 00         	leaq	4829(%rip), %rcx        # 0x8020f9 <testbss.c+0x8020f9>
  800e1c: 0f be 3c 11                  	movsbl	(%rcx,%rdx), %edi
  800e20: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  800e24: ff d0                        	callq	*%rax
; }
  800e26: 48 83 c4 30                  	addq	$48, %rsp
  800e2a: 5d                           	popq	%rbp
  800e2b: c3                           	retq
  800e2c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800e30 <vsnprintf>:
; {
  800e30: 55                           	pushq	%rbp
  800e31: 48 89 e5                     	movq	%rsp, %rbp
  800e34: 48 83 ec 40                  	subq	$64, %rsp
  800e38: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  800e3c: 89 75 ec                     	movl	%esi, -20(%rbp)
  800e3f: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
  800e43: 48 89 4d d8                  	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800e47: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e4b: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800e4f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800e53: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  800e57: 48 01 c8                     	addq	%rcx, %rax
  800e5a: 48 83 c0 ff                  	addq	$-1, %rax
  800e5e: 48 89 45 c8                  	movq	%rax, -56(%rbp)
  800e62: c7 45 d0 00 00 00 00         	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
  800e69: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800e6e: 0f 84 0a 00 00 00            	je	0x800e7e <vsnprintf+0x4e>
  800e74: 83 7d ec 01                  	cmpl	$1, -20(%rbp)
  800e78: 0f 8d 0c 00 00 00            	jge	0x800e8a <vsnprintf+0x5a>
; 		return -EINVAL;
  800e7e: c7 45 fc fb ff ff ff         	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
  800e85: e9 25 00 00 00               	jmp	0x800eaf <vsnprintf+0x7f>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  800e8a: 48 8d 75 c0                  	leaq	-64(%rbp), %rsi
  800e8e: 48 8b 55 e0                  	movq	-32(%rbp), %rdx
  800e92: 48 8b 4d d8                  	movq	-40(%rbp), %rcx
  800e96: 48 8d 3d 23 00 00 00         	leaq	35(%rip), %rdi          # 0x800ec0 <sprintputch>
  800e9d: e8 2e f5 ff ff               	callq	0x8003d0 <vprintfmt>
; 	*b.buf = '\0';
  800ea2: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  800ea6: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800ea9: 8b 45 d0                     	movl	-48(%rbp), %eax
  800eac: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  800eaf: 8b 45 fc                     	movl	-4(%rbp), %eax
  800eb2: 48 83 c4 40                  	addq	$64, %rsp
  800eb6: 5d                           	popq	%rbp
  800eb7: c3                           	retq
  800eb8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800ec0 <sprintputch>:
; {
  800ec0: 55                           	pushq	%rbp
  800ec1: 48 89 e5                     	movq	%rsp, %rbp
  800ec4: 89 7d fc                     	movl	%edi, -4(%rbp)
  800ec7: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	b->cnt++;
  800ecb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800ecf: 8b 48 10                     	movl	16(%rax), %ecx
  800ed2: 83 c1 01                     	addl	$1, %ecx
  800ed5: 89 48 10                     	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
  800ed8: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  800edc: 48 8b 00                     	movq	(%rax), %rax
  800edf: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  800ee3: 48 3b 41 08                  	cmpq	8(%rcx), %rax
  800ee7: 0f 83 18 00 00 00            	jae	0x800f05 <sprintputch+0x45>
; 		*b->buf++ = ch;
  800eed: 8b 45 fc                     	movl	-4(%rbp), %eax
  800ef0: 88 c1                        	movb	%al, %cl
  800ef2: 48 8b 55 f0                  	movq	-16(%rbp), %rdx
  800ef6: 48 8b 02                     	movq	(%rdx), %rax
  800ef9: 48 89 c6                     	movq	%rax, %rsi
  800efc: 48 83 c6 01                  	addq	$1, %rsi
  800f00: 48 89 32                     	movq	%rsi, (%rdx)
  800f03: 88 08                        	movb	%cl, (%rax)
; }
  800f05: 5d                           	popq	%rbp
  800f06: c3                           	retq
  800f07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

0000000000800f10 <snprintf>:
; {
  800f10: 55                           	pushq	%rbp
  800f11: 48 89 e5                     	movq	%rsp, %rbp
  800f14: 48 83 ec 70                  	subq	$112, %rsp
  800f18: 4c 89 4d b8                  	movq	%r9, -72(%rbp)
  800f1c: 4c 89 45 b0                  	movq	%r8, -80(%rbp)
  800f20: 48 89 4d a8                  	movq	%rcx, -88(%rbp)
  800f24: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800f28: 89 75 f4                     	movl	%esi, -12(%rbp)
  800f2b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
  800f2f: 48 8d 45 90                  	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
  800f33: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800f37: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800f3b: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800f3f: c7 45 d4 30 00 00 00         	movl	$48, -44(%rbp)
  800f46: c7 45 d0 18 00 00 00         	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
  800f4d: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  800f51: 8b 75 f4                     	movl	-12(%rbp), %esi
  800f54: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  800f58: 48 8d 4d d0                  	leaq	-48(%rbp), %rcx
  800f5c: e8 cf fe ff ff               	callq	0x800e30 <vsnprintf>
  800f61: 89 45 cc                     	movl	%eax, -52(%rbp)
; 	return rc;
  800f64: 8b 45 cc                     	movl	-52(%rbp), %eax
  800f67: 48 83 c4 70                  	addq	$112, %rsp
  800f6b: 5d                           	popq	%rbp
  800f6c: c3                           	retq
  800f6d: cc                           	int3
  800f6e: cc                           	int3
  800f6f: cc                           	int3

0000000000800f70 <strlen>:
; {
  800f70: 55                           	pushq	%rbp
  800f71: 48 89 e5                     	movq	%rsp, %rbp
  800f74: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800f78: c7 45 f4 00 00 00 00         	movl	$0, -12(%rbp)
  800f7f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f83: 0f be 00                     	movsbl	(%rax), %eax
  800f86: 83 f8 00                     	cmpl	$0, %eax
  800f89: 0f 84 1a 00 00 00            	je	0x800fa9 <strlen+0x39>
; 		n++;
  800f8f: 8b 45 f4                     	movl	-12(%rbp), %eax
  800f92: 83 c0 01                     	addl	$1, %eax
  800f95: 89 45 f4                     	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
  800f98: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800f9c: 48 83 c0 01                  	addq	$1, %rax
  800fa0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  800fa4: e9 d6 ff ff ff               	jmp	0x800f7f <strlen+0xf>
; 	return n;
  800fa9: 8b 45 f4                     	movl	-12(%rbp), %eax
  800fac: 5d                           	popq	%rbp
  800fad: c3                           	retq
  800fae: 66 90                        	nop

0000000000800fb0 <strnlen>:
; {
  800fb0: 55                           	pushq	%rbp
  800fb1: 48 89 e5                     	movq	%rsp, %rbp
  800fb4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  800fb8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800fbc: c7 45 ec 00 00 00 00         	movl	$0, -20(%rbp)
  800fc3: 31 c0                        	xorl	%eax, %eax
  800fc5: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  800fca: 88 45 eb                     	movb	%al, -21(%rbp)
  800fcd: 0f 86 10 00 00 00            	jbe	0x800fe3 <strnlen+0x33>
  800fd3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  800fd7: 0f be 00                     	movsbl	(%rax), %eax
  800fda: 83 f8 00                     	cmpl	$0, %eax
  800fdd: 0f 95 c0                     	setne	%al
  800fe0: 88 45 eb                     	movb	%al, -21(%rbp)
  800fe3: 8a 45 eb                     	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800fe6: a8 01                        	testb	$1, %al
  800fe8: 0f 85 05 00 00 00            	jne	0x800ff3 <strnlen+0x43>
  800fee: e9 26 00 00 00               	jmp	0x801019 <strnlen+0x69>
; 		n++;
  800ff3: 8b 45 ec                     	movl	-20(%rbp), %eax
  800ff6: 83 c0 01                     	addl	$1, %eax
  800ff9: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800ffc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801000: 48 83 c0 01                  	addq	$1, %rax
  801004: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801008: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80100c: 48 83 c0 ff                  	addq	$-1, %rax
  801010: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  801014: e9 aa ff ff ff               	jmp	0x800fc3 <strnlen+0x13>
; 	return n;
  801019: 8b 45 ec                     	movl	-20(%rbp), %eax
  80101c: 5d                           	popq	%rbp
  80101d: c3                           	retq
  80101e: 66 90                        	nop

0000000000801020 <strcpy>:
; {
  801020: 55                           	pushq	%rbp
  801021: 48 89 e5                     	movq	%rsp, %rbp
  801024: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801028: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	ret = dst;
  80102c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801030: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
  801034: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801038: 48 89 c1                     	movq	%rax, %rcx
  80103b: 48 83 c1 01                  	addq	$1, %rcx
  80103f: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  801043: 8a 00                        	movb	(%rax), %al
  801045: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  801049: 48 89 ca                     	movq	%rcx, %rdx
  80104c: 48 83 c2 01                  	addq	$1, %rdx
  801050: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  801054: 88 01                        	movb	%al, (%rcx)
  801056: 0f be c0                     	movsbl	%al, %eax
  801059: 83 f8 00                     	cmpl	$0, %eax
  80105c: 0f 84 05 00 00 00            	je	0x801067 <strcpy+0x47>
  801062: e9 cd ff ff ff               	jmp	0x801034 <strcpy+0x14>
; 	return ret;
  801067: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  80106b: 5d                           	popq	%rbp
  80106c: c3                           	retq
  80106d: 0f 1f 00                     	nopl	(%rax)

0000000000801070 <strcat>:
; {
  801070: 55                           	pushq	%rbp
  801071: 48 89 e5                     	movq	%rsp, %rbp
  801074: 48 83 ec 20                  	subq	$32, %rsp
  801078: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80107c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
  801080: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801084: e8 e7 fe ff ff               	callq	0x800f70 <strlen>
  801089: 89 45 ec                     	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
  80108c: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  801090: 48 63 45 ec                  	movslq	-20(%rbp), %rax
  801094: 48 01 c7                     	addq	%rax, %rdi
  801097: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  80109b: e8 80 ff ff ff               	callq	0x801020 <strcpy>
; 	return dst;
  8010a0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010a4: 48 83 c4 20                  	addq	$32, %rsp
  8010a8: 5d                           	popq	%rbp
  8010a9: c3                           	retq
  8010aa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

00000000008010b0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  8010b0: 55                           	pushq	%rbp
  8010b1: 48 89 e5                     	movq	%rsp, %rbp
  8010b4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8010b8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8010bc: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	ret = dst;
  8010c0: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010c4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
  8010c8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
  8010d0: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8010d4: 48 3b 45 e8                  	cmpq	-24(%rbp), %rax
  8010d8: 0f 83 49 00 00 00            	jae	0x801127 <strncpy+0x77>
; 		*dst++ = *src;
  8010de: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010e2: 8a 08                        	movb	(%rax), %cl
  8010e4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8010e8: 48 89 c2                     	movq	%rax, %rdx
  8010eb: 48 83 c2 01                  	addq	$1, %rdx
  8010ef: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8010f3: 88 08                        	movb	%cl, (%rax)
; 		if (*src != '\0')
  8010f5: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8010f9: 0f be 00                     	movsbl	(%rax), %eax
  8010fc: 83 f8 00                     	cmpl	$0, %eax
  8010ff: 0f 84 0c 00 00 00            	je	0x801111 <strncpy+0x61>
; 			src++;
  801105: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801109: 48 83 c0 01                  	addq	$1, %rax
  80110d: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	}
  801111: e9 00 00 00 00               	jmp	0x801116 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
  801116: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80111a: 48 83 c0 01                  	addq	$1, %rax
  80111e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  801122: e9 a9 ff ff ff               	jmp	0x8010d0 <strncpy+0x20>
; 	return ret;
  801127: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80112b: 5d                           	popq	%rbp
  80112c: c3                           	retq
  80112d: 0f 1f 00                     	nopl	(%rax)

0000000000801130 <strlcpy>:
; {
  801130: 55                           	pushq	%rbp
  801131: 48 89 e5                     	movq	%rsp, %rbp
  801134: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801138: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80113c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
  801140: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801144: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	if (size > 0) {
  801148: 48 83 7d e8 00               	cmpq	$0, -24(%rbp)
  80114d: 0f 86 6e 00 00 00            	jbe	0x8011c1 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
  801153: e9 00 00 00 00               	jmp	0x801158 <strlcpy+0x28>
  801158: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80115c: 48 83 c1 ff                  	addq	$-1, %rcx
  801160: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  801164: 31 c0                        	xorl	%eax, %eax
  801166: 48 83 f9 00                  	cmpq	$0, %rcx
  80116a: 88 45 df                     	movb	%al, -33(%rbp)
  80116d: 0f 86 10 00 00 00            	jbe	0x801183 <strlcpy+0x53>
  801173: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801177: 0f be 00                     	movsbl	(%rax), %eax
  80117a: 83 f8 00                     	cmpl	$0, %eax
  80117d: 0f 95 c0                     	setne	%al
  801180: 88 45 df                     	movb	%al, -33(%rbp)
  801183: 8a 45 df                     	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
  801186: a8 01                        	testb	$1, %al
  801188: 0f 85 05 00 00 00            	jne	0x801193 <strlcpy+0x63>
  80118e: e9 27 00 00 00               	jmp	0x8011ba <strlcpy+0x8a>
; 			*dst++ = *src++;
  801193: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801197: 48 89 c1                     	movq	%rax, %rcx
  80119a: 48 83 c1 01                  	addq	$1, %rcx
  80119e: 48 89 4d f0                  	movq	%rcx, -16(%rbp)
  8011a2: 8a 08                        	movb	(%rax), %cl
  8011a4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011a8: 48 89 c2                     	movq	%rax, %rdx
  8011ab: 48 83 c2 01                  	addq	$1, %rdx
  8011af: 48 89 55 f8                  	movq	%rdx, -8(%rbp)
  8011b3: 88 08                        	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
  8011b5: e9 9e ff ff ff               	jmp	0x801158 <strlcpy+0x28>
; 		*dst = '\0';
  8011ba: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011be: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8011c1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011c5: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8011c9: 48 29 c8                     	subq	%rcx, %rax
  8011cc: 5d                           	popq	%rbp
  8011cd: c3                           	retq
  8011ce: 66 90                        	nop

00000000008011d0 <strcmp>:
; {
  8011d0: 55                           	pushq	%rbp
  8011d1: 48 89 e5                     	movq	%rsp, %rbp
  8011d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8011d8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
  8011dc: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011e0: 0f be 08                     	movsbl	(%rax), %ecx
  8011e3: 31 c0                        	xorl	%eax, %eax
  8011e5: 83 f9 00                     	cmpl	$0, %ecx
  8011e8: 88 45 ef                     	movb	%al, -17(%rbp)
  8011eb: 0f 84 16 00 00 00            	je	0x801207 <strcmp+0x37>
  8011f1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8011f5: 0f be 00                     	movsbl	(%rax), %eax
  8011f8: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  8011fc: 0f be 09                     	movsbl	(%rcx), %ecx
  8011ff: 39 c8                        	cmpl	%ecx, %eax
  801201: 0f 94 c0                     	sete	%al
  801204: 88 45 ef                     	movb	%al, -17(%rbp)
  801207: 8a 45 ef                     	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
  80120a: a8 01                        	testb	$1, %al
  80120c: 0f 85 05 00 00 00            	jne	0x801217 <strcmp+0x47>
  801212: e9 1d 00 00 00               	jmp	0x801234 <strcmp+0x64>
; 		p++, q++;
  801217: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80121b: 48 83 c0 01                  	addq	$1, %rax
  80121f: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801223: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801227: 48 83 c0 01                  	addq	$1, %rax
  80122b: 48 89 45 f0                  	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
  80122f: e9 a8 ff ff ff               	jmp	0x8011dc <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  801234: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801238: 0f b6 00                     	movzbl	(%rax), %eax
  80123b: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  80123f: 0f b6 09                     	movzbl	(%rcx), %ecx
  801242: 29 c8                        	subl	%ecx, %eax
  801244: 5d                           	popq	%rbp
  801245: c3                           	retq
  801246: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000801250 <strncmp>:
; {
  801250: 55                           	pushq	%rbp
  801251: 48 89 e5                     	movq	%rsp, %rbp
  801254: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  801258: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  80125c: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
  801260: 31 c0                        	xorl	%eax, %eax
  801262: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  801267: 88 45 df                     	movb	%al, -33(%rbp)
  80126a: 0f 86 2b 00 00 00            	jbe	0x80129b <strncmp+0x4b>
  801270: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801274: 0f be 08                     	movsbl	(%rax), %ecx
  801277: 31 c0                        	xorl	%eax, %eax
  801279: 83 f9 00                     	cmpl	$0, %ecx
  80127c: 88 45 df                     	movb	%al, -33(%rbp)
  80127f: 0f 84 16 00 00 00            	je	0x80129b <strncmp+0x4b>
  801285: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801289: 0f be 00                     	movsbl	(%rax), %eax
  80128c: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801290: 0f be 09                     	movsbl	(%rcx), %ecx
  801293: 39 c8                        	cmpl	%ecx, %eax
  801295: 0f 94 c0                     	sete	%al
  801298: 88 45 df                     	movb	%al, -33(%rbp)
  80129b: 8a 45 df                     	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
  80129e: a8 01                        	testb	$1, %al
  8012a0: 0f 85 05 00 00 00            	jne	0x8012ab <strncmp+0x5b>
  8012a6: e9 29 00 00 00               	jmp	0x8012d4 <strncmp+0x84>
; 		n--, p++, q++;
  8012ab: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8012af: 48 83 c0 ff                  	addq	$-1, %rax
  8012b3: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8012b7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012bb: 48 83 c0 01                  	addq	$1, %rax
  8012bf: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8012c3: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8012c7: 48 83 c0 01                  	addq	$1, %rax
  8012cb: 48 89 45 e8                  	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
  8012cf: e9 8c ff ff ff               	jmp	0x801260 <strncmp+0x10>
; 	if (n == 0)
  8012d4: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8012d9: 0f 85 0c 00 00 00            	jne	0x8012eb <strncmp+0x9b>
; 		return 0;
  8012df: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
  8012e6: e9 13 00 00 00               	jmp	0x8012fe <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  8012eb: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8012ef: 0f b6 00                     	movzbl	(%rax), %eax
  8012f2: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  8012f6: 0f b6 09                     	movzbl	(%rcx), %ecx
  8012f9: 29 c8                        	subl	%ecx, %eax
  8012fb: 89 45 fc                     	movl	%eax, -4(%rbp)
; }
  8012fe: 8b 45 fc                     	movl	-4(%rbp), %eax
  801301: 5d                           	popq	%rbp
  801302: c3                           	retq
  801303: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80130d: 0f 1f 00                     	nopl	(%rax)

0000000000801310 <strchr>:
; {
  801310: 55                           	pushq	%rbp
  801311: 48 89 e5                     	movq	%rsp, %rbp
  801314: 40 88 f0                     	movb	%sil, %al
  801317: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  80131b: 88 45 ef                     	movb	%al, -17(%rbp)
; 	for (; *s; s++)
  80131e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801322: 80 38 00                     	cmpb	$0, (%rax)
  801325: 0f 84 36 00 00 00            	je	0x801361 <strchr+0x51>
; 		if (*s == c)
  80132b: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80132f: 0f be 00                     	movsbl	(%rax), %eax
  801332: 0f be 4d ef                  	movsbl	-17(%rbp), %ecx
  801336: 39 c8                        	cmpl	%ecx, %eax
  801338: 0f 85 0d 00 00 00            	jne	0x80134b <strchr+0x3b>
; 			return (char *) s;
  80133e: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801342: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801346: e9 1e 00 00 00               	jmp	0x801369 <strchr+0x59>
; 		if (*s == c)
  80134b: e9 00 00 00 00               	jmp	0x801350 <strchr+0x40>
; 	for (; *s; s++)
  801350: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801354: 48 83 c0 01                  	addq	$1, %rax
  801358: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80135c: e9 bd ff ff ff               	jmp	0x80131e <strchr+0xe>
; 	return 0;
  801361: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
  801369: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80136d: 5d                           	popq	%rbp
  80136e: c3                           	retq
  80136f: 90                           	nop

0000000000801370 <strfind>:
; {
  801370: 55                           	pushq	%rbp
  801371: 48 89 e5                     	movq	%rsp, %rbp
  801374: 40 88 f0                     	movb	%sil, %al
  801377: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80137b: 88 45 f7                     	movb	%al, -9(%rbp)
; 	for (; *s; s++)
  80137e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801382: 80 38 00                     	cmpb	$0, (%rax)
  801385: 0f 84 2e 00 00 00            	je	0x8013b9 <strfind+0x49>
; 		if (*s == c)
  80138b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80138f: 0f be 00                     	movsbl	(%rax), %eax
  801392: 0f be 4d f7                  	movsbl	-9(%rbp), %ecx
  801396: 39 c8                        	cmpl	%ecx, %eax
  801398: 0f 85 05 00 00 00            	jne	0x8013a3 <strfind+0x33>
; 			break;
  80139e: e9 16 00 00 00               	jmp	0x8013b9 <strfind+0x49>
; 		if (*s == c)
  8013a3: e9 00 00 00 00               	jmp	0x8013a8 <strfind+0x38>
; 	for (; *s; s++)
  8013a8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013ac: 48 83 c0 01                  	addq	$1, %rax
  8013b0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013b4: e9 c5 ff ff ff               	jmp	0x80137e <strfind+0xe>
; 	return (char *) s;
  8013b9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8013bd: 5d                           	popq	%rbp
  8013be: c3                           	retq
  8013bf: 90                           	nop

00000000008013c0 <memset>:
; {
  8013c0: 55                           	pushq	%rbp
  8013c1: 48 89 e5                     	movq	%rsp, %rbp
  8013c4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8013c8: 89 75 ec                     	movl	%esi, -20(%rbp)
  8013cb: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	if (n == 0)
  8013cf: 48 83 7d e0 00               	cmpq	$0, -32(%rbp)
  8013d4: 0f 85 0d 00 00 00            	jne	0x8013e7 <memset+0x27>
; 		return v;
  8013da: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013de: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8013e2: e9 78 00 00 00               	jmp	0x80145f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  8013e7: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8013eb: 48 83 e0 03                  	andq	$3, %rax
  8013ef: 48 83 f8 00                  	cmpq	$0, %rax
  8013f3: 0f 85 50 00 00 00            	jne	0x801449 <memset+0x89>
  8013f9: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8013fd: 48 83 e0 03                  	andq	$3, %rax
  801401: 48 83 f8 00                  	cmpq	$0, %rax
  801405: 0f 85 3e 00 00 00            	jne	0x801449 <memset+0x89>
; 		c &= 0xFF;
  80140b: 8b 45 ec                     	movl	-20(%rbp), %eax
  80140e: 25 ff 00 00 00               	andl	$255, %eax
  801413: 89 45 ec                     	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  801416: 8b 45 ec                     	movl	-20(%rbp), %eax
  801419: c1 e0 18                     	shll	$24, %eax
  80141c: 8b 4d ec                     	movl	-20(%rbp), %ecx
  80141f: c1 e1 10                     	shll	$16, %ecx
  801422: 09 c8                        	orl	%ecx, %eax
  801424: 8b 4d ec                     	movl	-20(%rbp), %ecx
  801427: c1 e1 08                     	shll	$8, %ecx
  80142a: 09 c8                        	orl	%ecx, %eax
  80142c: 0b 45 ec                     	orl	-20(%rbp), %eax
  80142f: 89 45 ec                     	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
  801432: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  801436: 8b 45 ec                     	movl	-20(%rbp), %eax
  801439: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  80143d: 48 c1 e9 02                  	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
  801441: fc                           	cld
  801442: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; 	} else
  801444: e9 0e 00 00 00               	jmp	0x801457 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
  801449: 48 8b 7d f0                  	movq	-16(%rbp), %rdi
  80144d: 8b 45 ec                     	movl	-20(%rbp), %eax
  801450: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
  801454: fc                           	cld
  801455: f3 aa                        	rep		stosb	%al, %es:(%rdi)
; 	return v;
  801457: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  80145b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; }
  80145f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801463: 5d                           	popq	%rbp
  801464: c3                           	retq
  801465: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80146f: 90                           	nop

0000000000801470 <memmove>:
; {
  801470: 55                           	pushq	%rbp
  801471: 48 89 e5                     	movq	%rsp, %rbp
  801474: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801478: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  80147c: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	s = src;
  801480: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801484: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	d = dst;
  801488: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80148c: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
  801490: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801494: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  801498: 0f 83 9d 00 00 00            	jae	0x80153b <memmove+0xcb>
  80149e: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014a2: 48 03 45 e8                  	addq	-24(%rbp), %rax
  8014a6: 48 3b 45 d8                  	cmpq	-40(%rbp), %rax
  8014aa: 0f 86 8b 00 00 00            	jbe	0x80153b <memmove+0xcb>
; 		s += n;
  8014b0: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014b4: 48 03 45 e0                  	addq	-32(%rbp), %rax
  8014b8: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 		d += n;
  8014bc: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014c0: 48 03 45 d8                  	addq	-40(%rbp), %rax
  8014c4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  8014c8: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8014cc: 48 83 e0 03                  	andq	$3, %rax
  8014d0: 48 83 f8 00                  	cmpq	$0, %rax
  8014d4: 0f 85 44 00 00 00            	jne	0x80151e <memmove+0xae>
  8014da: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  8014de: 48 83 e0 03                  	andq	$3, %rax
  8014e2: 48 83 f8 00                  	cmpq	$0, %rax
  8014e6: 0f 85 32 00 00 00            	jne	0x80151e <memmove+0xae>
  8014ec: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8014f0: 48 83 e0 03                  	andq	$3, %rax
  8014f4: 48 83 f8 00                  	cmpq	$0, %rax
  8014f8: 0f 85 20 00 00 00            	jne	0x80151e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  8014fe: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801502: 48 83 c7 fc                  	addq	$-4, %rdi
  801506: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80150a: 48 83 c6 fc                  	addq	$-4, %rsi
  80150e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  801512: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  801516: fd                           	std
  801517: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801519: e9 17 00 00 00               	jmp	0x801535 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  80151e: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801522: 48 83 c7 ff                  	addq	$-1, %rdi
  801526: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  80152a: 48 83 c6 ff                  	addq	$-1, %rsi
  80152e: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
  801532: fd                           	std
  801533: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  801535: fc                           	cld
; 	} else {
  801536: e9 62 00 00 00               	jmp	0x80159d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  80153b: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  80153f: 48 83 e0 03                  	andq	$3, %rax
  801543: 48 83 f8 00                  	cmpq	$0, %rax
  801547: 0f 85 3c 00 00 00            	jne	0x801589 <memmove+0x119>
  80154d: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801551: 48 83 e0 03                  	andq	$3, %rax
  801555: 48 83 f8 00                  	cmpq	$0, %rax
  801559: 0f 85 2a 00 00 00            	jne	0x801589 <memmove+0x119>
  80155f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  801563: 48 83 e0 03                  	andq	$3, %rax
  801567: 48 83 f8 00                  	cmpq	$0, %rax
  80156b: 0f 85 18 00 00 00            	jne	0x801589 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  801571: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  801575: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801579: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
  80157d: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  801581: fc                           	cld
  801582: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
  801584: e9 0f 00 00 00               	jmp	0x801598 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
  801589: 48 8b 7d d8                  	movq	-40(%rbp), %rdi
  80158d: 48 8b 75 e0                  	movq	-32(%rbp), %rsi
  801591: 48 8b 4d e8                  	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
  801595: fc                           	cld
  801596: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
  801598: e9 00 00 00 00               	jmp	0x80159d <memmove+0x12d>
; 	return dst;
  80159d: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8015a1: 5d                           	popq	%rbp
  8015a2: c3                           	retq
  8015a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8015ad: 0f 1f 00                     	nopl	(%rax)

00000000008015b0 <memcpy>:
; {
  8015b0: 55                           	pushq	%rbp
  8015b1: 48 89 e5                     	movq	%rsp, %rbp
  8015b4: 48 83 ec 20                  	subq	$32, %rsp
  8015b8: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8015bc: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8015c0: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
  8015c4: 48 8b 7d f8                  	movq	-8(%rbp), %rdi
  8015c8: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8015cc: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8015d0: e8 9b fe ff ff               	callq	0x801470 <memmove>
  8015d5: 48 83 c4 20                  	addq	$32, %rsp
  8015d9: 5d                           	popq	%rbp
  8015da: c3                           	retq
  8015db: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008015e0 <memcmp>:
; {
  8015e0: 55                           	pushq	%rbp
  8015e1: 48 89 e5                     	movq	%rsp, %rbp
  8015e4: 48 89 7d f0                  	movq	%rdi, -16(%rbp)
  8015e8: 48 89 75 e8                  	movq	%rsi, -24(%rbp)
  8015ec: 48 89 55 e0                  	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
  8015f0: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  8015f4: 48 89 45 d8                  	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
  8015f8: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8015fc: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  801600: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801604: 48 89 c1                     	movq	%rax, %rcx
  801607: 48 83 c1 ff                  	addq	$-1, %rcx
  80160b: 48 89 4d e0                  	movq	%rcx, -32(%rbp)
  80160f: 48 83 f8 00                  	cmpq	$0, %rax
  801613: 0f 86 4b 00 00 00            	jbe	0x801664 <memcmp+0x84>
; 		if (*s1 != *s2)
  801619: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80161d: 0f b6 00                     	movzbl	(%rax), %eax
  801620: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  801624: 0f b6 09                     	movzbl	(%rcx), %ecx
  801627: 39 c8                        	cmpl	%ecx, %eax
  801629: 0f 84 18 00 00 00            	je	0x801647 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
  80162f: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  801633: 0f b6 00                     	movzbl	(%rax), %eax
  801636: 48 8b 4d d0                  	movq	-48(%rbp), %rcx
  80163a: 0f b6 09                     	movzbl	(%rcx), %ecx
  80163d: 29 c8                        	subl	%ecx, %eax
  80163f: 89 45 fc                     	movl	%eax, -4(%rbp)
  801642: e9 24 00 00 00               	jmp	0x80166b <memcmp+0x8b>
; 		s1++, s2++;
  801647: 48 8b 45 d8                  	movq	-40(%rbp), %rax
  80164b: 48 83 c0 01                  	addq	$1, %rax
  80164f: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  801653: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801657: 48 83 c0 01                  	addq	$1, %rax
  80165b: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
  80165f: e9 9c ff ff ff               	jmp	0x801600 <memcmp+0x20>
; 	return 0;
  801664: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
; }
  80166b: 8b 45 fc                     	movl	-4(%rbp), %eax
  80166e: 5d                           	popq	%rbp
  80166f: c3                           	retq

0000000000801670 <memfind>:
; {
  801670: 55                           	pushq	%rbp
  801671: 48 89 e5                     	movq	%rsp, %rbp
  801674: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  801678: 89 75 f4                     	movl	%esi, -12(%rbp)
  80167b: 48 89 55 e8                  	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
  80167f: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801683: 48 03 45 e8                  	addq	-24(%rbp), %rax
  801687: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
  80168b: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80168f: 48 3b 45 e0                  	cmpq	-32(%rbp), %rax
  801693: 0f 83 30 00 00 00            	jae	0x8016c9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  801699: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  80169d: 0f b6 00                     	movzbl	(%rax), %eax
  8016a0: 8b 4d f4                     	movl	-12(%rbp), %ecx
  8016a3: 0f b6 c9                     	movzbl	%cl, %ecx
  8016a6: 39 c8                        	cmpl	%ecx, %eax
  8016a8: 0f 85 05 00 00 00            	jne	0x8016b3 <memfind+0x43>
; 			break;
  8016ae: e9 16 00 00 00               	jmp	0x8016c9 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
  8016b3: e9 00 00 00 00               	jmp	0x8016b8 <memfind+0x48>
; 	for (; s < ends; s++)
  8016b8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016bc: 48 83 c0 01                  	addq	$1, %rax
  8016c0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8016c4: e9 c2 ff ff ff               	jmp	0x80168b <memfind+0x1b>
; 	return (void *) s;
  8016c9: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016cd: 5d                           	popq	%rbp
  8016ce: c3                           	retq
  8016cf: 90                           	nop

00000000008016d0 <strtol>:
; {
  8016d0: 55                           	pushq	%rbp
  8016d1: 48 89 e5                     	movq	%rsp, %rbp
  8016d4: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  8016d8: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
  8016dc: 89 55 ec                     	movl	%edx, -20(%rbp)
; 	int neg = 0;
  8016df: c7 45 e8 00 00 00 00         	movl	$0, -24(%rbp)
; 	long val = 0;
  8016e6: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
  8016ee: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8016f2: 0f be 08                     	movsbl	(%rax), %ecx
  8016f5: b0 01                        	movb	$1, %al
  8016f7: 83 f9 20                     	cmpl	$32, %ecx
  8016fa: 88 45 db                     	movb	%al, -37(%rbp)
  8016fd: 0f 84 10 00 00 00            	je	0x801713 <strtol+0x43>
  801703: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801707: 0f be 00                     	movsbl	(%rax), %eax
  80170a: 83 f8 09                     	cmpl	$9, %eax
  80170d: 0f 94 c0                     	sete	%al
  801710: 88 45 db                     	movb	%al, -37(%rbp)
  801713: 8a 45 db                     	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
  801716: a8 01                        	testb	$1, %al
  801718: 0f 85 05 00 00 00            	jne	0x801723 <strtol+0x53>
  80171e: e9 11 00 00 00               	jmp	0x801734 <strtol+0x64>
; 		s++;
  801723: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801727: 48 83 c0 01                  	addq	$1, %rax
  80172b: 48 89 45 f8                  	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
  80172f: e9 ba ff ff ff               	jmp	0x8016ee <strtol+0x1e>
; 	if (*s == '+')
  801734: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801738: 0f be 00                     	movsbl	(%rax), %eax
  80173b: 83 f8 2b                     	cmpl	$43, %eax
  80173e: 0f 85 11 00 00 00            	jne	0x801755 <strtol+0x85>
; 		s++;
  801744: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801748: 48 83 c0 01                  	addq	$1, %rax
  80174c: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801750: e9 28 00 00 00               	jmp	0x80177d <strtol+0xad>
; 	else if (*s == '-')
  801755: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801759: 0f be 00                     	movsbl	(%rax), %eax
  80175c: 83 f8 2d                     	cmpl	$45, %eax
  80175f: 0f 85 13 00 00 00            	jne	0x801778 <strtol+0xa8>
; 		s++, neg = 1;
  801765: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801769: 48 83 c0 01                  	addq	$1, %rax
  80176d: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  801771: c7 45 e8 01 00 00 00         	movl	$1, -24(%rbp)
  801778: e9 00 00 00 00               	jmp	0x80177d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  80177d: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801781: 0f 84 0a 00 00 00            	je	0x801791 <strtol+0xc1>
  801787: 83 7d ec 10                  	cmpl	$16, -20(%rbp)
  80178b: 0f 85 39 00 00 00            	jne	0x8017ca <strtol+0xfa>
  801791: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801795: 0f be 00                     	movsbl	(%rax), %eax
  801798: 83 f8 30                     	cmpl	$48, %eax
  80179b: 0f 85 29 00 00 00            	jne	0x8017ca <strtol+0xfa>
  8017a1: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017a5: 0f be 40 01                  	movsbl	1(%rax), %eax
  8017a9: 83 f8 78                     	cmpl	$120, %eax
  8017ac: 0f 85 18 00 00 00            	jne	0x8017ca <strtol+0xfa>
; 		s += 2, base = 16;
  8017b2: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017b6: 48 83 c0 02                  	addq	$2, %rax
  8017ba: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017be: c7 45 ec 10 00 00 00         	movl	$16, -20(%rbp)
  8017c5: e9 4d 00 00 00               	jmp	0x801817 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
  8017ca: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  8017ce: 0f 85 28 00 00 00            	jne	0x8017fc <strtol+0x12c>
  8017d4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017d8: 0f be 00                     	movsbl	(%rax), %eax
  8017db: 83 f8 30                     	cmpl	$48, %eax
  8017de: 0f 85 18 00 00 00            	jne	0x8017fc <strtol+0x12c>
; 		s++, base = 8;
  8017e4: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8017e8: 48 83 c0 01                  	addq	$1, %rax
  8017ec: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8017f0: c7 45 ec 08 00 00 00         	movl	$8, -20(%rbp)
  8017f7: e9 16 00 00 00               	jmp	0x801812 <strtol+0x142>
; 	else if (base == 0)
  8017fc: 83 7d ec 00                  	cmpl	$0, -20(%rbp)
  801800: 0f 85 07 00 00 00            	jne	0x80180d <strtol+0x13d>
; 		base = 10;
  801806: c7 45 ec 0a 00 00 00         	movl	$10, -20(%rbp)
  80180d: e9 00 00 00 00               	jmp	0x801812 <strtol+0x142>
  801812: e9 00 00 00 00               	jmp	0x801817 <strtol+0x147>
; 	while (1) {
  801817: e9 00 00 00 00               	jmp	0x80181c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
  80181c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801820: 0f be 00                     	movsbl	(%rax), %eax
  801823: 83 f8 30                     	cmpl	$48, %eax
  801826: 0f 8c 22 00 00 00            	jl	0x80184e <strtol+0x17e>
  80182c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801830: 0f be 00                     	movsbl	(%rax), %eax
  801833: 83 f8 39                     	cmpl	$57, %eax
  801836: 0f 8f 12 00 00 00            	jg	0x80184e <strtol+0x17e>
; 			dig = *s - '0';
  80183c: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801840: 0f be 00                     	movsbl	(%rax), %eax
  801843: 83 e8 30                     	subl	$48, %eax
  801846: 89 45 dc                     	movl	%eax, -36(%rbp)
  801849: e9 79 00 00 00               	jmp	0x8018c7 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
  80184e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801852: 0f be 00                     	movsbl	(%rax), %eax
  801855: 83 f8 61                     	cmpl	$97, %eax
  801858: 0f 8c 25 00 00 00            	jl	0x801883 <strtol+0x1b3>
  80185e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801862: 0f be 00                     	movsbl	(%rax), %eax
  801865: 83 f8 7a                     	cmpl	$122, %eax
  801868: 0f 8f 15 00 00 00            	jg	0x801883 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
  80186e: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801872: 0f be 00                     	movsbl	(%rax), %eax
  801875: 83 e8 61                     	subl	$97, %eax
  801878: 83 c0 0a                     	addl	$10, %eax
  80187b: 89 45 dc                     	movl	%eax, -36(%rbp)
  80187e: e9 3f 00 00 00               	jmp	0x8018c2 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
  801883: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801887: 0f be 00                     	movsbl	(%rax), %eax
  80188a: 83 f8 41                     	cmpl	$65, %eax
  80188d: 0f 8c 25 00 00 00            	jl	0x8018b8 <strtol+0x1e8>
  801893: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  801897: 0f be 00                     	movsbl	(%rax), %eax
  80189a: 83 f8 5a                     	cmpl	$90, %eax
  80189d: 0f 8f 15 00 00 00            	jg	0x8018b8 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
  8018a3: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018a7: 0f be 00                     	movsbl	(%rax), %eax
  8018aa: 83 e8 41                     	subl	$65, %eax
  8018ad: 83 c0 0a                     	addl	$10, %eax
  8018b0: 89 45 dc                     	movl	%eax, -36(%rbp)
  8018b3: e9 05 00 00 00               	jmp	0x8018bd <strtol+0x1ed>
; 			break;
  8018b8: e9 43 00 00 00               	jmp	0x801900 <strtol+0x230>
  8018bd: e9 00 00 00 00               	jmp	0x8018c2 <strtol+0x1f2>
  8018c2: e9 00 00 00 00               	jmp	0x8018c7 <strtol+0x1f7>
; 		if (dig >= base)
  8018c7: 8b 45 dc                     	movl	-36(%rbp), %eax
  8018ca: 3b 45 ec                     	cmpl	-20(%rbp), %eax
  8018cd: 0f 8c 05 00 00 00            	jl	0x8018d8 <strtol+0x208>
; 			break;
  8018d3: e9 28 00 00 00               	jmp	0x801900 <strtol+0x230>
; 		s++, val = (val * base) + dig;
  8018d8: 48 8b 45 f8                  	movq	-8(%rbp), %rax
  8018dc: 48 83 c0 01                  	addq	$1, %rax
  8018e0: 48 89 45 f8                  	movq	%rax, -8(%rbp)
  8018e4: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  8018e8: 48 63 4d ec                  	movslq	-20(%rbp), %rcx
  8018ec: 48 0f af c1                  	imulq	%rcx, %rax
  8018f0: 48 63 4d dc                  	movslq	-36(%rbp), %rcx
  8018f4: 48 01 c8                     	addq	%rcx, %rax
  8018f7: 48 89 45 e0                  	movq	%rax, -32(%rbp)
; 	while (1) {
  8018fb: e9 1c ff ff ff               	jmp	0x80181c <strtol+0x14c>
; 	if (endptr)
  801900: 48 83 7d f0 00               	cmpq	$0, -16(%rbp)
  801905: 0f 84 0b 00 00 00            	je	0x801916 <strtol+0x246>
; 		*endptr = (char *) s;
  80190b: 48 8b 4d f8                  	movq	-8(%rbp), %rcx
  80190f: 48 8b 45 f0                  	movq	-16(%rbp), %rax
  801913: 48 89 08                     	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
  801916: 83 7d e8 00                  	cmpl	$0, -24(%rbp)
  80191a: 0f 84 0f 00 00 00            	je	0x80192f <strtol+0x25f>
  801920: 31 c0                        	xorl	%eax, %eax
  801922: 48 2b 45 e0                  	subq	-32(%rbp), %rax
  801926: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  80192a: e9 08 00 00 00               	jmp	0x801937 <strtol+0x267>
  80192f: 48 8b 45 e0                  	movq	-32(%rbp), %rax
  801933: 48 89 45 d0                  	movq	%rax, -48(%rbp)
  801937: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
  80193b: 5d                           	popq	%rbp
  80193c: c3                           	retq
  80193d: cc                           	int3
  80193e: cc                           	int3
  80193f: cc                           	int3

0000000000801940 <puts>:
; {
  801940: 55                           	pushq	%rbp
  801941: 48 89 e5                     	movq	%rsp, %rbp
  801944: 48 83 ec 20                  	subq	$32, %rsp
  801948: 48 89 7d f8                  	movq	%rdi, -8(%rbp)
  80194c: 48 89 75 f0                  	movq	%rsi, -16(%rbp)
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  801950: 48 8b 55 f8                  	movq	-8(%rbp), %rdx
  801954: 48 8b 4d f0                  	movq	-16(%rbp), %rcx
  801958: 31 f6                        	xorl	%esi, %esi
  80195a: 31 c0                        	xorl	%eax, %eax
  80195c: 41 89 c1                     	movl	%eax, %r9d
  80195f: 89 f7                        	movl	%esi, %edi
  801961: 4d 89 c8                     	movq	%r9, %r8
  801964: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  80196c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801975: e8 06 00 00 00               	callq	0x801980 <syscall>
; }
  80197a: 48 83 c4 20                  	addq	$32, %rsp
  80197e: 5d                           	popq	%rbp
  80197f: c3                           	retq

0000000000801980 <syscall>:
; {
  801980: 55                           	pushq	%rbp
  801981: 48 89 e5                     	movq	%rsp, %rbp
  801984: 48 83 ec 40                  	subq	$64, %rsp
  801988: 48 8b 45 18                  	movq	24(%rbp), %rax
  80198c: 48 8b 45 10                  	movq	16(%rbp), %rax
  801990: 89 7d fc                     	movl	%edi, -4(%rbp)
  801993: 89 75 f8                     	movl	%esi, -8(%rbp)
  801996: 48 89 55 f0                  	movq	%rdx, -16(%rbp)
  80199a: 48 89 4d e8                  	movq	%rcx, -24(%rbp)
  80199e: 4c 89 45 e0                  	movq	%r8, -32(%rbp)
  8019a2: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8019a6: 48 63 7d fc                  	movslq	-4(%rbp), %rdi
  8019aa: 48 8b 75 f0                  	movq	-16(%rbp), %rsi
  8019ae: 48 8b 55 e8                  	movq	-24(%rbp), %rdx
  8019b2: 48 8b 4d e0                  	movq	-32(%rbp), %rcx
  8019b6: 4c 8b 45 d8                  	movq	-40(%rbp), %r8
  8019ba: 4c 8b 4d 10                  	movq	16(%rbp), %r9
  8019be: 48 8b 45 18                  	movq	24(%rbp), %rax
  8019c2: 48 89 04 24                  	movq	%rax, (%rsp)
  8019c6: e8 01 01 00 00               	callq	0x801acc <do_syscall>
  8019cb: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 	if(check && ret < 0) {
  8019cf: 83 7d f8 00                  	cmpl	$0, -8(%rbp)
  8019d3: 0f 84 2c 00 00 00            	je	0x801a05 <syscall+0x85>
  8019d9: 48 83 7d d0 00               	cmpq	$0, -48(%rbp)
  8019de: 0f 83 21 00 00 00            	jae	0x801a05 <syscall+0x85>
; 		panic("syscall %d returned %d (> 0)", num, ret);
  8019e4: 8b 4d fc                     	movl	-4(%rbp), %ecx
  8019e7: 4c 8b 45 d0                  	movq	-48(%rbp), %r8
  8019eb: 48 8d 3d 62 07 00 00         	leaq	1890(%rip), %rdi        # 0x802154 <testbss.c+0x802154>
  8019f2: be 1f 00 00 00               	movl	$31, %esi
  8019f7: 48 8d 15 d5 06 00 00         	leaq	1749(%rip), %rdx        # 0x8020d3 <testbss.c+0x8020d3>
  8019fe: b0 00                        	movb	$0, %al
  801a00: e8 fb e7 ff ff               	callq	0x800200 <_panic>
; 	return ret;
  801a05: 48 8b 45 d0                  	movq	-48(%rbp), %rax
  801a09: 48 83 c4 40                  	addq	$64, %rsp
  801a0d: 5d                           	popq	%rbp
  801a0e: c3                           	retq
  801a0f: 90                           	nop

0000000000801a10 <getc>:
; {
  801a10: 55                           	pushq	%rbp
  801a11: 48 89 e5                     	movq	%rsp, %rbp
  801a14: 48 83 ec 10                  	subq	$16, %rsp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  801a18: bf 01 00 00 00               	movl	$1, %edi
  801a1d: 31 f6                        	xorl	%esi, %esi
  801a1f: 31 c0                        	xorl	%eax, %eax
  801a21: 41 89 c1                     	movl	%eax, %r9d
  801a24: 4c 89 ca                     	movq	%r9, %rdx
  801a27: 4c 89 c9                     	movq	%r9, %rcx
  801a2a: 4d 89 c8                     	movq	%r9, %r8
  801a2d: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801a35: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801a3e: e8 3d ff ff ff               	callq	0x801980 <syscall>
  801a43: 48 83 c4 10                  	addq	$16, %rsp
  801a47: 5d                           	popq	%rbp
  801a48: c3                           	retq
  801a49: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000801a50 <kill>:
; {
  801a50: 55                           	pushq	%rbp
  801a51: 48 89 e5                     	movq	%rsp, %rbp
  801a54: 48 83 ec 20                  	subq	$32, %rsp
  801a58: 89 7d fc                     	movl	%edi, -4(%rbp)
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  801a5b: 48 63 55 fc                  	movslq	-4(%rbp), %rdx
  801a5f: bf 03 00 00 00               	movl	$3, %edi
  801a64: be 01 00 00 00               	movl	$1, %esi
  801a69: 31 c0                        	xorl	%eax, %eax
  801a6b: 41 89 c1                     	movl	%eax, %r9d
  801a6e: 4c 89 c9                     	movq	%r9, %rcx
  801a71: 4d 89 c8                     	movq	%r9, %r8
  801a74: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801a7c: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801a85: e8 f6 fe ff ff               	callq	0x801980 <syscall>
  801a8a: 48 83 c4 20                  	addq	$32, %rsp
  801a8e: 5d                           	popq	%rbp
  801a8f: c3                           	retq

0000000000801a90 <getpid>:
; {
  801a90: 55                           	pushq	%rbp
  801a91: 48 89 e5                     	movq	%rsp, %rbp
  801a94: 48 83 ec 10                  	subq	$16, %rsp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  801a98: bf 02 00 00 00               	movl	$2, %edi
  801a9d: 31 f6                        	xorl	%esi, %esi
  801a9f: 31 c0                        	xorl	%eax, %eax
  801aa1: 41 89 c1                     	movl	%eax, %r9d
  801aa4: 4c 89 ca                     	movq	%r9, %rdx
  801aa7: 4c 89 c9                     	movq	%r9, %rcx
  801aaa: 4d 89 c8                     	movq	%r9, %r8
  801aad: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  801ab5: 48 c7 44 24 08 00 00 00 00   	movq	$0, 8(%rsp)
  801abe: e8 bd fe ff ff               	callq	0x801980 <syscall>
  801ac3: 48 83 c4 10                  	addq	$16, %rsp
  801ac7: 5d                           	popq	%rbp
  801ac8: c3                           	retq
  801ac9: cc                           	int3
  801aca: cc                           	int3
  801acb: cc                           	int3

0000000000801acc <do_syscall>:
; 	pushq %rbp
  801acc: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  801acd: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  801ad2: cd 80                        	int	$128
; 	popq %rbp
  801ad4: 5d                           	popq	%rbp
; 	retq
  801ad5: c3                           	retq
