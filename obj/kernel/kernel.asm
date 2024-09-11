
obj/kernel/kernel:	file format elf64-x86-64

Disassembly of section .boot:

0000000000100000 <_start>:
; 	cli
  100000: fa                           	cli
; 	movl $bootstack_top, %esp
  100001: bc 00 90 10 00               	movl	$1085440, %esp          # imm = 0x109000
; 	pushl $0
  100006: 6a 00                        	pushq	$0
; 	pushl %ebx
  100008: 53                           	pushq	%rbx
; 	movl $(PAGE_PRESENT | PAGE_WRITE | PAGE_HUGE), %eax
  100009: b8 83 00 00 00               	movl	$131, %eax
; 	movl $page_dir, %edi
  10000e: bf 00 b0 10 00               	movl	$1093632, %edi          # imm = 0x10B000
; 	movl $4, %ecx
  100013: b9 04 00 00 00               	movl	$4, %ecx

0000000000100018 <.map_pages>:
; 	movl %eax, (%edi)
  100018: 89 07                        	movl	%eax, (%rdi)
; 	addl $0x200000, %eax
  10001a: 05 00 00 20 00               	addl	$2097152, %eax          # imm = 0x200000
; 	addl $8, %edi
  10001f: 83 c7 08                     	addl	$8, %edi
; 	dec %ecx
  100022: 49 75 f3                     	jne	0x100018 <.map_pages>
; 	movl $page_dir, %eax
  100025: b8 00 b0 10 00               	movl	$1093632, %eax          # imm = 0x10B000
; 	orl $(PAGE_PRESENT | PAGE_WRITE), %eax
  10002a: 83 c8 03                     	orl	$3, %eax
; 	movl %eax, pdpt
  10002d: a3 00 a0 10 00 b8 00 a0 10   	movabsl	%eax, 1197958291155623936
; 	movl $pdpt, %eax
  100036: 00 83 c8 03 a3 00            	addb	%al, 10683336(%rbx)
; 	movl %eax, pml4
  10003c: 90                           	nop
  10003d: 10 00                        	adcb	%al, (%rax)
; 	movl %eax, pml4 + 256 * 8
  10003f: a3 00 98 10 00 b8 00 90 10   	movabsl	%eax, 1193454691528251392
; 	movl $pml4, %eax
  100048: 00 0f                        	addb	%cl, (%rdi)
; 	movl %eax, %cr3
  10004a: 22 d8                        	andb	%al, %bl
; 	movl %cr4, %eax
  10004c: 0f 20 e0                     	movq	%cr4, %rax
; 	orl $CR4_PAE, %eax
  10004f: 83 c8 20                     	orl	$32, %eax
; 	movl %eax, %cr4
  100052: 0f 22 e0                     	movq	%rax, %cr4
; 	movl $MSR_EFER, %ecx
  100055: b9 80 00 00 c0               	movl	$3221225600, %ecx       # imm = 0xC0000080
; 	rdmsr
  10005a: 0f 32                        	rdmsr
; 	orl $MSR_EFER_LME, %eax
  10005c: 0d 00 01 00 00               	orl	$256, %eax              # imm = 0x100
; 	wrmsr
  100061: 0f 30                        	wrmsr
; 	movl %cr0, %eax
  100063: 0f 20 c0                     	movq	%cr0, %rax
; 	orl $CR0_PAGING, %eax
  100066: 0d 00 00 00 80               	orl	$2147483648, %eax       # imm = 0x80000000
; 	movl %eax, %cr0
  10006b: 0f 22 c0                     	movq	%rax, %cr0
; 	lgdt gdtr64
  10006e: 0f 01 15 c0 00 10 00         	lgdtq	1048768(%rip)           # 0x200135 <boot_end+0xf4135>
; 	movw $0x10, %ax
  100075: 66 b8 10 00                  	movw	$16, %ax
; 	movw %ax, %ds
  100079: 8e d8                        	movl	%eax, %ds
; 	movw %ax, %es
  10007b: 8e c0                        	movl	%eax, %es
; 	movw %ax, %ss
  10007d: 8e d0                        	movl	%eax, %ss
; 	ljmp $0x08, $_start64
  10007f: ea                           	<unknown>
  100080: 86 00                        	xchgb	%al, (%rax)
  100082: 10 00                        	adcb	%al, (%rax)
  100084: 08 00                        	orb	%al, (%rax)

0000000000100086 <_start64>:
; 	movabs $KERNEL_VMA, %rax
  100086: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
; 	addq %rax, %rsp
  100090: 48 01 c4                     	addq	%rax, %rsp
; 	popq %rdi
  100093: 5f                           	popq	%rdi
; 	addq %rax, %rdi
  100094: 48 01 c7                     	addq	%rax, %rdi
; 	movabs $kmain, %rax
  100097: 48 b8 f0 c7 10 00 00 80 ff ff	movabsq	$-140737487255568, %rax # imm = 0xFFFF80000010C7F0
; 	call *%rax
  1000a1: ff d0                        	callq	*%rax
; 	hlt
  1000a3: f4                           	hlt
  1000a4: cc                           	int3
  1000a5: cc                           	int3
  1000a6: cc                           	int3
  1000a7: cc                           	int3

00000000001000a8 <gdt64>:
		...
  1000b4: 00 9a 20 00 00 00            	addb	%bl, 32(%rdx)
  1000ba: 00 00                        	addb	%al, (%rax)
  1000bc: 00 92 00 00 17 00            	addb	%dl, 1507328(%rdx)

00000000001000c0 <gdtr64>:
  1000c0: 17                           	<unknown>
  1000c1: 00 a8 00 10 00 cc            	addb	%ch, -872411136(%rax)
  1000c7: cc                           	int3
  1000c8: cc                           	int3
  1000c9: cc                           	int3
  1000ca: cc                           	int3
  1000cb: cc                           	int3
  1000cc: cc                           	int3
  1000cd: cc                           	int3
  1000ce: cc                           	int3
  1000cf: cc                           	int3
  1000d0: cc                           	int3
  1000d1: cc                           	int3
  1000d2: cc                           	int3
  1000d3: cc                           	int3
  1000d4: cc                           	int3
  1000d5: cc                           	int3
  1000d6: cc                           	int3
  1000d7: cc                           	int3
  1000d8: cc                           	int3
  1000d9: cc                           	int3
  1000da: cc                           	int3
  1000db: cc                           	int3
  1000dc: cc                           	int3
  1000dd: cc                           	int3
  1000de: cc                           	int3
  1000df: cc                           	int3
  1000e0: cc                           	int3
  1000e1: cc                           	int3
  1000e2: cc                           	int3
  1000e3: cc                           	int3
  1000e4: cc                           	int3
  1000e5: cc                           	int3
  1000e6: cc                           	int3
  1000e7: cc                           	int3
  1000e8: cc                           	int3
  1000e9: cc                           	int3
  1000ea: cc                           	int3
  1000eb: cc                           	int3
  1000ec: cc                           	int3
  1000ed: cc                           	int3
  1000ee: cc                           	int3
  1000ef: cc                           	int3
  1000f0: cc                           	int3
  1000f1: cc                           	int3
  1000f2: cc                           	int3
  1000f3: cc                           	int3
  1000f4: cc                           	int3
  1000f5: cc                           	int3
  1000f6: cc                           	int3
  1000f7: cc                           	int3
  1000f8: cc                           	int3
  1000f9: cc                           	int3
  1000fa: cc                           	int3
  1000fb: cc                           	int3
  1000fc: cc                           	int3
  1000fd: cc                           	int3
  1000fe: cc                           	int3
  1000ff: cc                           	int3
  100100: cc                           	int3
  100101: cc                           	int3
  100102: cc                           	int3
  100103: cc                           	int3
  100104: cc                           	int3
  100105: cc                           	int3
  100106: cc                           	int3
  100107: cc                           	int3
  100108: cc                           	int3
  100109: cc                           	int3
  10010a: cc                           	int3
  10010b: cc                           	int3
  10010c: cc                           	int3
  10010d: cc                           	int3
  10010e: cc                           	int3
  10010f: cc                           	int3
  100110: cc                           	int3
  100111: cc                           	int3
  100112: cc                           	int3
  100113: cc                           	int3
  100114: cc                           	int3
  100115: cc                           	int3
  100116: cc                           	int3
  100117: cc                           	int3
  100118: cc                           	int3
  100119: cc                           	int3
  10011a: cc                           	int3
  10011b: cc                           	int3
  10011c: cc                           	int3
  10011d: cc                           	int3
  10011e: cc                           	int3
  10011f: cc                           	int3
  100120: cc                           	int3
  100121: cc                           	int3
  100122: cc                           	int3
  100123: cc                           	int3
  100124: cc                           	int3
  100125: cc                           	int3
  100126: cc                           	int3
  100127: cc                           	int3
  100128: cc                           	int3
  100129: cc                           	int3
  10012a: cc                           	int3
  10012b: cc                           	int3
  10012c: cc                           	int3
  10012d: cc                           	int3
  10012e: cc                           	int3
  10012f: cc                           	int3
  100130: cc                           	int3
  100131: cc                           	int3
  100132: cc                           	int3
  100133: cc                           	int3
  100134: cc                           	int3
  100135: cc                           	int3
  100136: cc                           	int3
  100137: cc                           	int3
  100138: cc                           	int3
  100139: cc                           	int3
  10013a: cc                           	int3
  10013b: cc                           	int3
  10013c: cc                           	int3
  10013d: cc                           	int3
  10013e: cc                           	int3
  10013f: cc                           	int3
  100140: cc                           	int3
  100141: cc                           	int3
  100142: cc                           	int3
  100143: cc                           	int3
  100144: cc                           	int3
  100145: cc                           	int3
  100146: cc                           	int3
  100147: cc                           	int3
  100148: cc                           	int3
  100149: cc                           	int3
  10014a: cc                           	int3
  10014b: cc                           	int3
  10014c: cc                           	int3
  10014d: cc                           	int3
  10014e: cc                           	int3
  10014f: cc                           	int3
  100150: cc                           	int3
  100151: cc                           	int3
  100152: cc                           	int3
  100153: cc                           	int3
  100154: cc                           	int3
  100155: cc                           	int3
  100156: cc                           	int3
  100157: cc                           	int3
  100158: cc                           	int3
  100159: cc                           	int3
  10015a: cc                           	int3
  10015b: cc                           	int3
  10015c: cc                           	int3
  10015d: cc                           	int3
  10015e: cc                           	int3
  10015f: cc                           	int3
  100160: cc                           	int3
  100161: cc                           	int3
  100162: cc                           	int3
  100163: cc                           	int3
  100164: cc                           	int3
  100165: cc                           	int3
  100166: cc                           	int3
  100167: cc                           	int3
  100168: cc                           	int3
  100169: cc                           	int3
  10016a: cc                           	int3
  10016b: cc                           	int3
  10016c: cc                           	int3
  10016d: cc                           	int3
  10016e: cc                           	int3
  10016f: cc                           	int3
  100170: cc                           	int3
  100171: cc                           	int3
  100172: cc                           	int3
  100173: cc                           	int3
  100174: cc                           	int3
  100175: cc                           	int3
  100176: cc                           	int3
  100177: cc                           	int3
  100178: cc                           	int3
  100179: cc                           	int3
  10017a: cc                           	int3
  10017b: cc                           	int3
  10017c: cc                           	int3
  10017d: cc                           	int3
  10017e: cc                           	int3
  10017f: cc                           	int3
  100180: cc                           	int3
  100181: cc                           	int3
  100182: cc                           	int3
  100183: cc                           	int3
  100184: cc                           	int3
  100185: cc                           	int3
  100186: cc                           	int3
  100187: cc                           	int3
  100188: cc                           	int3
  100189: cc                           	int3
  10018a: cc                           	int3
  10018b: cc                           	int3
  10018c: cc                           	int3
  10018d: cc                           	int3
  10018e: cc                           	int3
  10018f: cc                           	int3
  100190: cc                           	int3
  100191: cc                           	int3
  100192: cc                           	int3
  100193: cc                           	int3
  100194: cc                           	int3
  100195: cc                           	int3
  100196: cc                           	int3
  100197: cc                           	int3
  100198: cc                           	int3
  100199: cc                           	int3
  10019a: cc                           	int3
  10019b: cc                           	int3
  10019c: cc                           	int3
  10019d: cc                           	int3
  10019e: cc                           	int3
  10019f: cc                           	int3
  1001a0: cc                           	int3
  1001a1: cc                           	int3
  1001a2: cc                           	int3
  1001a3: cc                           	int3
  1001a4: cc                           	int3
  1001a5: cc                           	int3
  1001a6: cc                           	int3
  1001a7: cc                           	int3
  1001a8: cc                           	int3
  1001a9: cc                           	int3
  1001aa: cc                           	int3
  1001ab: cc                           	int3
  1001ac: cc                           	int3
  1001ad: cc                           	int3
  1001ae: cc                           	int3
  1001af: cc                           	int3
  1001b0: cc                           	int3
  1001b1: cc                           	int3
  1001b2: cc                           	int3
  1001b3: cc                           	int3
  1001b4: cc                           	int3
  1001b5: cc                           	int3
  1001b6: cc                           	int3
  1001b7: cc                           	int3
  1001b8: cc                           	int3
  1001b9: cc                           	int3
  1001ba: cc                           	int3
  1001bb: cc                           	int3
  1001bc: cc                           	int3
  1001bd: cc                           	int3
  1001be: cc                           	int3
  1001bf: cc                           	int3
  1001c0: cc                           	int3
  1001c1: cc                           	int3
  1001c2: cc                           	int3
  1001c3: cc                           	int3
  1001c4: cc                           	int3
  1001c5: cc                           	int3
  1001c6: cc                           	int3
  1001c7: cc                           	int3
  1001c8: cc                           	int3
  1001c9: cc                           	int3
  1001ca: cc                           	int3
  1001cb: cc                           	int3
  1001cc: cc                           	int3
  1001cd: cc                           	int3
  1001ce: cc                           	int3
  1001cf: cc                           	int3
  1001d0: cc                           	int3
  1001d1: cc                           	int3
  1001d2: cc                           	int3
  1001d3: cc                           	int3
  1001d4: cc                           	int3
  1001d5: cc                           	int3
  1001d6: cc                           	int3
  1001d7: cc                           	int3
  1001d8: cc                           	int3
  1001d9: cc                           	int3
  1001da: cc                           	int3
  1001db: cc                           	int3
  1001dc: cc                           	int3
  1001dd: cc                           	int3
  1001de: cc                           	int3
  1001df: cc                           	int3
  1001e0: cc                           	int3
  1001e1: cc                           	int3
  1001e2: cc                           	int3
  1001e3: cc                           	int3
  1001e4: cc                           	int3
  1001e5: cc                           	int3
  1001e6: cc                           	int3
  1001e7: cc                           	int3
  1001e8: cc                           	int3
  1001e9: cc                           	int3
  1001ea: cc                           	int3
  1001eb: cc                           	int3
  1001ec: cc                           	int3
  1001ed: cc                           	int3
  1001ee: cc                           	int3
  1001ef: cc                           	int3
  1001f0: cc                           	int3
  1001f1: cc                           	int3
  1001f2: cc                           	int3
  1001f3: cc                           	int3
  1001f4: cc                           	int3
  1001f5: cc                           	int3
  1001f6: cc                           	int3
  1001f7: cc                           	int3
  1001f8: cc                           	int3
  1001f9: cc                           	int3
  1001fa: cc                           	int3
  1001fb: cc                           	int3
  1001fc: cc                           	int3
  1001fd: cc                           	int3
  1001fe: cc                           	int3
  1001ff: cc                           	int3
  100200: cc                           	int3
  100201: cc                           	int3
  100202: cc                           	int3
  100203: cc                           	int3
  100204: cc                           	int3
  100205: cc                           	int3
  100206: cc                           	int3
  100207: cc                           	int3
  100208: cc                           	int3
  100209: cc                           	int3
  10020a: cc                           	int3
  10020b: cc                           	int3
  10020c: cc                           	int3
  10020d: cc                           	int3
  10020e: cc                           	int3
  10020f: cc                           	int3
  100210: cc                           	int3
  100211: cc                           	int3
  100212: cc                           	int3
  100213: cc                           	int3
  100214: cc                           	int3
  100215: cc                           	int3
  100216: cc                           	int3
  100217: cc                           	int3
  100218: cc                           	int3
  100219: cc                           	int3
  10021a: cc                           	int3
  10021b: cc                           	int3
  10021c: cc                           	int3
  10021d: cc                           	int3
  10021e: cc                           	int3
  10021f: cc                           	int3
  100220: cc                           	int3
  100221: cc                           	int3
  100222: cc                           	int3
  100223: cc                           	int3
  100224: cc                           	int3
  100225: cc                           	int3
  100226: cc                           	int3
  100227: cc                           	int3
  100228: cc                           	int3
  100229: cc                           	int3
  10022a: cc                           	int3
  10022b: cc                           	int3
  10022c: cc                           	int3
  10022d: cc                           	int3
  10022e: cc                           	int3
  10022f: cc                           	int3
  100230: cc                           	int3
  100231: cc                           	int3
  100232: cc                           	int3
  100233: cc                           	int3
  100234: cc                           	int3
  100235: cc                           	int3
  100236: cc                           	int3
  100237: cc                           	int3
  100238: cc                           	int3
  100239: cc                           	int3
  10023a: cc                           	int3
  10023b: cc                           	int3
  10023c: cc                           	int3
  10023d: cc                           	int3
  10023e: cc                           	int3
  10023f: cc                           	int3
  100240: cc                           	int3
  100241: cc                           	int3
  100242: cc                           	int3
  100243: cc                           	int3
  100244: cc                           	int3
  100245: cc                           	int3
  100246: cc                           	int3
  100247: cc                           	int3
  100248: cc                           	int3
  100249: cc                           	int3
  10024a: cc                           	int3
  10024b: cc                           	int3
  10024c: cc                           	int3
  10024d: cc                           	int3
  10024e: cc                           	int3
  10024f: cc                           	int3
  100250: cc                           	int3
  100251: cc                           	int3
  100252: cc                           	int3
  100253: cc                           	int3
  100254: cc                           	int3
  100255: cc                           	int3
  100256: cc                           	int3
  100257: cc                           	int3
  100258: cc                           	int3
  100259: cc                           	int3
  10025a: cc                           	int3
  10025b: cc                           	int3
  10025c: cc                           	int3
  10025d: cc                           	int3
  10025e: cc                           	int3
  10025f: cc                           	int3
  100260: cc                           	int3
  100261: cc                           	int3
  100262: cc                           	int3
  100263: cc                           	int3
  100264: cc                           	int3
  100265: cc                           	int3
  100266: cc                           	int3
  100267: cc                           	int3
  100268: cc                           	int3
  100269: cc                           	int3
  10026a: cc                           	int3
  10026b: cc                           	int3
  10026c: cc                           	int3
  10026d: cc                           	int3
  10026e: cc                           	int3
  10026f: cc                           	int3
  100270: cc                           	int3
  100271: cc                           	int3
  100272: cc                           	int3
  100273: cc                           	int3
  100274: cc                           	int3
  100275: cc                           	int3
  100276: cc                           	int3
  100277: cc                           	int3
  100278: cc                           	int3
  100279: cc                           	int3
  10027a: cc                           	int3
  10027b: cc                           	int3
  10027c: cc                           	int3
  10027d: cc                           	int3
  10027e: cc                           	int3
  10027f: cc                           	int3
  100280: cc                           	int3
  100281: cc                           	int3
  100282: cc                           	int3
  100283: cc                           	int3
  100284: cc                           	int3
  100285: cc                           	int3
  100286: cc                           	int3
  100287: cc                           	int3
  100288: cc                           	int3
  100289: cc                           	int3
  10028a: cc                           	int3
  10028b: cc                           	int3
  10028c: cc                           	int3
  10028d: cc                           	int3
  10028e: cc                           	int3
  10028f: cc                           	int3
  100290: cc                           	int3
  100291: cc                           	int3
  100292: cc                           	int3
  100293: cc                           	int3
  100294: cc                           	int3
  100295: cc                           	int3
  100296: cc                           	int3
  100297: cc                           	int3
  100298: cc                           	int3
  100299: cc                           	int3
  10029a: cc                           	int3
  10029b: cc                           	int3
  10029c: cc                           	int3
  10029d: cc                           	int3
  10029e: cc                           	int3
  10029f: cc                           	int3
  1002a0: cc                           	int3
  1002a1: cc                           	int3
  1002a2: cc                           	int3
  1002a3: cc                           	int3
  1002a4: cc                           	int3
  1002a5: cc                           	int3
  1002a6: cc                           	int3
  1002a7: cc                           	int3
  1002a8: cc                           	int3
  1002a9: cc                           	int3
  1002aa: cc                           	int3
  1002ab: cc                           	int3
  1002ac: cc                           	int3
  1002ad: cc                           	int3
  1002ae: cc                           	int3
  1002af: cc                           	int3
  1002b0: cc                           	int3
  1002b1: cc                           	int3
  1002b2: cc                           	int3
  1002b3: cc                           	int3
  1002b4: cc                           	int3
  1002b5: cc                           	int3
  1002b6: cc                           	int3
  1002b7: cc                           	int3
  1002b8: cc                           	int3
  1002b9: cc                           	int3
  1002ba: cc                           	int3
  1002bb: cc                           	int3
  1002bc: cc                           	int3
  1002bd: cc                           	int3
  1002be: cc                           	int3
  1002bf: cc                           	int3
  1002c0: cc                           	int3
  1002c1: cc                           	int3
  1002c2: cc                           	int3
  1002c3: cc                           	int3
  1002c4: cc                           	int3
  1002c5: cc                           	int3
  1002c6: cc                           	int3
  1002c7: cc                           	int3
  1002c8: cc                           	int3
  1002c9: cc                           	int3
  1002ca: cc                           	int3
  1002cb: cc                           	int3
  1002cc: cc                           	int3
  1002cd: cc                           	int3
  1002ce: cc                           	int3
  1002cf: cc                           	int3
  1002d0: cc                           	int3
  1002d1: cc                           	int3
  1002d2: cc                           	int3
  1002d3: cc                           	int3
  1002d4: cc                           	int3
  1002d5: cc                           	int3
  1002d6: cc                           	int3
  1002d7: cc                           	int3
  1002d8: cc                           	int3
  1002d9: cc                           	int3
  1002da: cc                           	int3
  1002db: cc                           	int3
  1002dc: cc                           	int3
  1002dd: cc                           	int3
  1002de: cc                           	int3
  1002df: cc                           	int3
  1002e0: cc                           	int3
  1002e1: cc                           	int3
  1002e2: cc                           	int3
  1002e3: cc                           	int3
  1002e4: cc                           	int3
  1002e5: cc                           	int3
  1002e6: cc                           	int3
  1002e7: cc                           	int3
  1002e8: cc                           	int3
  1002e9: cc                           	int3
  1002ea: cc                           	int3
  1002eb: cc                           	int3
  1002ec: cc                           	int3
  1002ed: cc                           	int3
  1002ee: cc                           	int3
  1002ef: cc                           	int3
  1002f0: cc                           	int3
  1002f1: cc                           	int3
  1002f2: cc                           	int3
  1002f3: cc                           	int3
  1002f4: cc                           	int3
  1002f5: cc                           	int3
  1002f6: cc                           	int3
  1002f7: cc                           	int3
  1002f8: cc                           	int3
  1002f9: cc                           	int3
  1002fa: cc                           	int3
  1002fb: cc                           	int3
  1002fc: cc                           	int3
  1002fd: cc                           	int3
  1002fe: cc                           	int3
  1002ff: cc                           	int3
  100300: cc                           	int3
  100301: cc                           	int3
  100302: cc                           	int3
  100303: cc                           	int3
  100304: cc                           	int3
  100305: cc                           	int3
  100306: cc                           	int3
  100307: cc                           	int3
  100308: cc                           	int3
  100309: cc                           	int3
  10030a: cc                           	int3
  10030b: cc                           	int3
  10030c: cc                           	int3
  10030d: cc                           	int3
  10030e: cc                           	int3
  10030f: cc                           	int3
  100310: cc                           	int3
  100311: cc                           	int3
  100312: cc                           	int3
  100313: cc                           	int3
  100314: cc                           	int3
  100315: cc                           	int3
  100316: cc                           	int3
  100317: cc                           	int3
  100318: cc                           	int3
  100319: cc                           	int3
  10031a: cc                           	int3
  10031b: cc                           	int3
  10031c: cc                           	int3
  10031d: cc                           	int3
  10031e: cc                           	int3
  10031f: cc                           	int3
  100320: cc                           	int3
  100321: cc                           	int3
  100322: cc                           	int3
  100323: cc                           	int3
  100324: cc                           	int3
  100325: cc                           	int3
  100326: cc                           	int3
  100327: cc                           	int3
  100328: cc                           	int3
  100329: cc                           	int3
  10032a: cc                           	int3
  10032b: cc                           	int3
  10032c: cc                           	int3
  10032d: cc                           	int3
  10032e: cc                           	int3
  10032f: cc                           	int3
  100330: cc                           	int3
  100331: cc                           	int3
  100332: cc                           	int3
  100333: cc                           	int3
  100334: cc                           	int3
  100335: cc                           	int3
  100336: cc                           	int3
  100337: cc                           	int3
  100338: cc                           	int3
  100339: cc                           	int3
  10033a: cc                           	int3
  10033b: cc                           	int3
  10033c: cc                           	int3
  10033d: cc                           	int3
  10033e: cc                           	int3
  10033f: cc                           	int3
  100340: cc                           	int3
  100341: cc                           	int3
  100342: cc                           	int3
  100343: cc                           	int3
  100344: cc                           	int3
  100345: cc                           	int3
  100346: cc                           	int3
  100347: cc                           	int3
  100348: cc                           	int3
  100349: cc                           	int3
  10034a: cc                           	int3
  10034b: cc                           	int3
  10034c: cc                           	int3
  10034d: cc                           	int3
  10034e: cc                           	int3
  10034f: cc                           	int3
  100350: cc                           	int3
  100351: cc                           	int3
  100352: cc                           	int3
  100353: cc                           	int3
  100354: cc                           	int3
  100355: cc                           	int3
  100356: cc                           	int3
  100357: cc                           	int3
  100358: cc                           	int3
  100359: cc                           	int3
  10035a: cc                           	int3
  10035b: cc                           	int3
  10035c: cc                           	int3
  10035d: cc                           	int3
  10035e: cc                           	int3
  10035f: cc                           	int3
  100360: cc                           	int3
  100361: cc                           	int3
  100362: cc                           	int3
  100363: cc                           	int3
  100364: cc                           	int3
  100365: cc                           	int3
  100366: cc                           	int3
  100367: cc                           	int3
  100368: cc                           	int3
  100369: cc                           	int3
  10036a: cc                           	int3
  10036b: cc                           	int3
  10036c: cc                           	int3
  10036d: cc                           	int3
  10036e: cc                           	int3
  10036f: cc                           	int3
  100370: cc                           	int3
  100371: cc                           	int3
  100372: cc                           	int3
  100373: cc                           	int3
  100374: cc                           	int3
  100375: cc                           	int3
  100376: cc                           	int3
  100377: cc                           	int3
  100378: cc                           	int3
  100379: cc                           	int3
  10037a: cc                           	int3
  10037b: cc                           	int3
  10037c: cc                           	int3
  10037d: cc                           	int3
  10037e: cc                           	int3
  10037f: cc                           	int3
  100380: cc                           	int3
  100381: cc                           	int3
  100382: cc                           	int3
  100383: cc                           	int3
  100384: cc                           	int3
  100385: cc                           	int3
  100386: cc                           	int3
  100387: cc                           	int3
  100388: cc                           	int3
  100389: cc                           	int3
  10038a: cc                           	int3
  10038b: cc                           	int3
  10038c: cc                           	int3
  10038d: cc                           	int3
  10038e: cc                           	int3
  10038f: cc                           	int3
  100390: cc                           	int3
  100391: cc                           	int3
  100392: cc                           	int3
  100393: cc                           	int3
  100394: cc                           	int3
  100395: cc                           	int3
  100396: cc                           	int3
  100397: cc                           	int3
  100398: cc                           	int3
  100399: cc                           	int3
  10039a: cc                           	int3
  10039b: cc                           	int3
  10039c: cc                           	int3
  10039d: cc                           	int3
  10039e: cc                           	int3
  10039f: cc                           	int3
  1003a0: cc                           	int3
  1003a1: cc                           	int3
  1003a2: cc                           	int3
  1003a3: cc                           	int3
  1003a4: cc                           	int3
  1003a5: cc                           	int3
  1003a6: cc                           	int3
  1003a7: cc                           	int3
  1003a8: cc                           	int3
  1003a9: cc                           	int3
  1003aa: cc                           	int3
  1003ab: cc                           	int3
  1003ac: cc                           	int3
  1003ad: cc                           	int3
  1003ae: cc                           	int3
  1003af: cc                           	int3
  1003b0: cc                           	int3
  1003b1: cc                           	int3
  1003b2: cc                           	int3
  1003b3: cc                           	int3
  1003b4: cc                           	int3
  1003b5: cc                           	int3
  1003b6: cc                           	int3
  1003b7: cc                           	int3
  1003b8: cc                           	int3
  1003b9: cc                           	int3
  1003ba: cc                           	int3
  1003bb: cc                           	int3
  1003bc: cc                           	int3
  1003bd: cc                           	int3
  1003be: cc                           	int3
  1003bf: cc                           	int3
  1003c0: cc                           	int3
  1003c1: cc                           	int3
  1003c2: cc                           	int3
  1003c3: cc                           	int3
  1003c4: cc                           	int3
  1003c5: cc                           	int3
  1003c6: cc                           	int3
  1003c7: cc                           	int3
  1003c8: cc                           	int3
  1003c9: cc                           	int3
  1003ca: cc                           	int3
  1003cb: cc                           	int3
  1003cc: cc                           	int3
  1003cd: cc                           	int3
  1003ce: cc                           	int3
  1003cf: cc                           	int3
  1003d0: cc                           	int3
  1003d1: cc                           	int3
  1003d2: cc                           	int3
  1003d3: cc                           	int3
  1003d4: cc                           	int3
  1003d5: cc                           	int3
  1003d6: cc                           	int3
  1003d7: cc                           	int3
  1003d8: cc                           	int3
  1003d9: cc                           	int3
  1003da: cc                           	int3
  1003db: cc                           	int3
  1003dc: cc                           	int3
  1003dd: cc                           	int3
  1003de: cc                           	int3
  1003df: cc                           	int3
  1003e0: cc                           	int3
  1003e1: cc                           	int3
  1003e2: cc                           	int3
  1003e3: cc                           	int3
  1003e4: cc                           	int3
  1003e5: cc                           	int3
  1003e6: cc                           	int3
  1003e7: cc                           	int3
  1003e8: cc                           	int3
  1003e9: cc                           	int3
  1003ea: cc                           	int3
  1003eb: cc                           	int3
  1003ec: cc                           	int3
  1003ed: cc                           	int3
  1003ee: cc                           	int3
  1003ef: cc                           	int3
  1003f0: cc                           	int3
  1003f1: cc                           	int3
  1003f2: cc                           	int3
  1003f3: cc                           	int3
  1003f4: cc                           	int3
  1003f5: cc                           	int3
  1003f6: cc                           	int3
  1003f7: cc                           	int3
  1003f8: cc                           	int3
  1003f9: cc                           	int3
  1003fa: cc                           	int3
  1003fb: cc                           	int3
  1003fc: cc                           	int3
  1003fd: cc                           	int3
  1003fe: cc                           	int3
  1003ff: cc                           	int3
  100400: cc                           	int3
  100401: cc                           	int3
  100402: cc                           	int3
  100403: cc                           	int3
  100404: cc                           	int3
  100405: cc                           	int3
  100406: cc                           	int3
  100407: cc                           	int3
  100408: cc                           	int3
  100409: cc                           	int3
  10040a: cc                           	int3
  10040b: cc                           	int3
  10040c: cc                           	int3
  10040d: cc                           	int3
  10040e: cc                           	int3
  10040f: cc                           	int3
  100410: cc                           	int3
  100411: cc                           	int3
  100412: cc                           	int3
  100413: cc                           	int3
  100414: cc                           	int3
  100415: cc                           	int3
  100416: cc                           	int3
  100417: cc                           	int3
  100418: cc                           	int3
  100419: cc                           	int3
  10041a: cc                           	int3
  10041b: cc                           	int3
  10041c: cc                           	int3
  10041d: cc                           	int3
  10041e: cc                           	int3
  10041f: cc                           	int3
  100420: cc                           	int3
  100421: cc                           	int3
  100422: cc                           	int3
  100423: cc                           	int3
  100424: cc                           	int3
  100425: cc                           	int3
  100426: cc                           	int3
  100427: cc                           	int3
  100428: cc                           	int3
  100429: cc                           	int3
  10042a: cc                           	int3
  10042b: cc                           	int3
  10042c: cc                           	int3
  10042d: cc                           	int3
  10042e: cc                           	int3
  10042f: cc                           	int3
  100430: cc                           	int3
  100431: cc                           	int3
  100432: cc                           	int3
  100433: cc                           	int3
  100434: cc                           	int3
  100435: cc                           	int3
  100436: cc                           	int3
  100437: cc                           	int3
  100438: cc                           	int3
  100439: cc                           	int3
  10043a: cc                           	int3
  10043b: cc                           	int3
  10043c: cc                           	int3
  10043d: cc                           	int3
  10043e: cc                           	int3
  10043f: cc                           	int3
  100440: cc                           	int3
  100441: cc                           	int3
  100442: cc                           	int3
  100443: cc                           	int3
  100444: cc                           	int3
  100445: cc                           	int3
  100446: cc                           	int3
  100447: cc                           	int3
  100448: cc                           	int3
  100449: cc                           	int3
  10044a: cc                           	int3
  10044b: cc                           	int3
  10044c: cc                           	int3
  10044d: cc                           	int3
  10044e: cc                           	int3
  10044f: cc                           	int3
  100450: cc                           	int3
  100451: cc                           	int3
  100452: cc                           	int3
  100453: cc                           	int3
  100454: cc                           	int3
  100455: cc                           	int3
  100456: cc                           	int3
  100457: cc                           	int3
  100458: cc                           	int3
  100459: cc                           	int3
  10045a: cc                           	int3
  10045b: cc                           	int3
  10045c: cc                           	int3
  10045d: cc                           	int3
  10045e: cc                           	int3
  10045f: cc                           	int3
  100460: cc                           	int3
  100461: cc                           	int3
  100462: cc                           	int3
  100463: cc                           	int3
  100464: cc                           	int3
  100465: cc                           	int3
  100466: cc                           	int3
  100467: cc                           	int3
  100468: cc                           	int3
  100469: cc                           	int3
  10046a: cc                           	int3
  10046b: cc                           	int3
  10046c: cc                           	int3
  10046d: cc                           	int3
  10046e: cc                           	int3
  10046f: cc                           	int3
  100470: cc                           	int3
  100471: cc                           	int3
  100472: cc                           	int3
  100473: cc                           	int3
  100474: cc                           	int3
  100475: cc                           	int3
  100476: cc                           	int3
  100477: cc                           	int3
  100478: cc                           	int3
  100479: cc                           	int3
  10047a: cc                           	int3
  10047b: cc                           	int3
  10047c: cc                           	int3
  10047d: cc                           	int3
  10047e: cc                           	int3
  10047f: cc                           	int3
  100480: cc                           	int3
  100481: cc                           	int3
  100482: cc                           	int3
  100483: cc                           	int3
  100484: cc                           	int3
  100485: cc                           	int3
  100486: cc                           	int3
  100487: cc                           	int3
  100488: cc                           	int3
  100489: cc                           	int3
  10048a: cc                           	int3
  10048b: cc                           	int3
  10048c: cc                           	int3
  10048d: cc                           	int3
  10048e: cc                           	int3
  10048f: cc                           	int3
  100490: cc                           	int3
  100491: cc                           	int3
  100492: cc                           	int3
  100493: cc                           	int3
  100494: cc                           	int3
  100495: cc                           	int3
  100496: cc                           	int3
  100497: cc                           	int3
  100498: cc                           	int3
  100499: cc                           	int3
  10049a: cc                           	int3
  10049b: cc                           	int3
  10049c: cc                           	int3
  10049d: cc                           	int3
  10049e: cc                           	int3
  10049f: cc                           	int3
  1004a0: cc                           	int3
  1004a1: cc                           	int3
  1004a2: cc                           	int3
  1004a3: cc                           	int3
  1004a4: cc                           	int3
  1004a5: cc                           	int3
  1004a6: cc                           	int3
  1004a7: cc                           	int3
  1004a8: cc                           	int3
  1004a9: cc                           	int3
  1004aa: cc                           	int3
  1004ab: cc                           	int3
  1004ac: cc                           	int3
  1004ad: cc                           	int3
  1004ae: cc                           	int3
  1004af: cc                           	int3
  1004b0: cc                           	int3
  1004b1: cc                           	int3
  1004b2: cc                           	int3
  1004b3: cc                           	int3
  1004b4: cc                           	int3
  1004b5: cc                           	int3
  1004b6: cc                           	int3
  1004b7: cc                           	int3
  1004b8: cc                           	int3
  1004b9: cc                           	int3
  1004ba: cc                           	int3
  1004bb: cc                           	int3
  1004bc: cc                           	int3
  1004bd: cc                           	int3
  1004be: cc                           	int3
  1004bf: cc                           	int3
  1004c0: cc                           	int3
  1004c1: cc                           	int3
  1004c2: cc                           	int3
  1004c3: cc                           	int3
  1004c4: cc                           	int3
  1004c5: cc                           	int3
  1004c6: cc                           	int3
  1004c7: cc                           	int3
  1004c8: cc                           	int3
  1004c9: cc                           	int3
  1004ca: cc                           	int3
  1004cb: cc                           	int3
  1004cc: cc                           	int3
  1004cd: cc                           	int3
  1004ce: cc                           	int3
  1004cf: cc                           	int3
  1004d0: cc                           	int3
  1004d1: cc                           	int3
  1004d2: cc                           	int3
  1004d3: cc                           	int3
  1004d4: cc                           	int3
  1004d5: cc                           	int3
  1004d6: cc                           	int3
  1004d7: cc                           	int3
  1004d8: cc                           	int3
  1004d9: cc                           	int3
  1004da: cc                           	int3
  1004db: cc                           	int3
  1004dc: cc                           	int3
  1004dd: cc                           	int3
  1004de: cc                           	int3
  1004df: cc                           	int3
  1004e0: cc                           	int3
  1004e1: cc                           	int3
  1004e2: cc                           	int3
  1004e3: cc                           	int3
  1004e4: cc                           	int3
  1004e5: cc                           	int3
  1004e6: cc                           	int3
  1004e7: cc                           	int3
  1004e8: cc                           	int3
  1004e9: cc                           	int3
  1004ea: cc                           	int3
  1004eb: cc                           	int3
  1004ec: cc                           	int3
  1004ed: cc                           	int3
  1004ee: cc                           	int3
  1004ef: cc                           	int3
  1004f0: cc                           	int3
  1004f1: cc                           	int3
  1004f2: cc                           	int3
  1004f3: cc                           	int3
  1004f4: cc                           	int3
  1004f5: cc                           	int3
  1004f6: cc                           	int3
  1004f7: cc                           	int3
  1004f8: cc                           	int3
  1004f9: cc                           	int3
  1004fa: cc                           	int3
  1004fb: cc                           	int3
  1004fc: cc                           	int3
  1004fd: cc                           	int3
  1004fe: cc                           	int3
  1004ff: cc                           	int3
  100500: cc                           	int3
  100501: cc                           	int3
  100502: cc                           	int3
  100503: cc                           	int3
  100504: cc                           	int3
  100505: cc                           	int3
  100506: cc                           	int3
  100507: cc                           	int3
  100508: cc                           	int3
  100509: cc                           	int3
  10050a: cc                           	int3
  10050b: cc                           	int3
  10050c: cc                           	int3
  10050d: cc                           	int3
  10050e: cc                           	int3
  10050f: cc                           	int3
  100510: cc                           	int3
  100511: cc                           	int3
  100512: cc                           	int3
  100513: cc                           	int3
  100514: cc                           	int3
  100515: cc                           	int3
  100516: cc                           	int3
  100517: cc                           	int3
  100518: cc                           	int3
  100519: cc                           	int3
  10051a: cc                           	int3
  10051b: cc                           	int3
  10051c: cc                           	int3
  10051d: cc                           	int3
  10051e: cc                           	int3
  10051f: cc                           	int3
  100520: cc                           	int3
  100521: cc                           	int3
  100522: cc                           	int3
  100523: cc                           	int3
  100524: cc                           	int3
  100525: cc                           	int3
  100526: cc                           	int3
  100527: cc                           	int3
  100528: cc                           	int3
  100529: cc                           	int3
  10052a: cc                           	int3
  10052b: cc                           	int3
  10052c: cc                           	int3
  10052d: cc                           	int3
  10052e: cc                           	int3
  10052f: cc                           	int3
  100530: cc                           	int3
  100531: cc                           	int3
  100532: cc                           	int3
  100533: cc                           	int3
  100534: cc                           	int3
  100535: cc                           	int3
  100536: cc                           	int3
  100537: cc                           	int3
  100538: cc                           	int3
  100539: cc                           	int3
  10053a: cc                           	int3
  10053b: cc                           	int3
  10053c: cc                           	int3
  10053d: cc                           	int3
  10053e: cc                           	int3
  10053f: cc                           	int3
  100540: cc                           	int3
  100541: cc                           	int3
  100542: cc                           	int3
  100543: cc                           	int3
  100544: cc                           	int3
  100545: cc                           	int3
  100546: cc                           	int3
  100547: cc                           	int3
  100548: cc                           	int3
  100549: cc                           	int3
  10054a: cc                           	int3
  10054b: cc                           	int3
  10054c: cc                           	int3
  10054d: cc                           	int3
  10054e: cc                           	int3
  10054f: cc                           	int3
  100550: cc                           	int3
  100551: cc                           	int3
  100552: cc                           	int3
  100553: cc                           	int3
  100554: cc                           	int3
  100555: cc                           	int3
  100556: cc                           	int3
  100557: cc                           	int3
  100558: cc                           	int3
  100559: cc                           	int3
  10055a: cc                           	int3
  10055b: cc                           	int3
  10055c: cc                           	int3
  10055d: cc                           	int3
  10055e: cc                           	int3
  10055f: cc                           	int3
  100560: cc                           	int3
  100561: cc                           	int3
  100562: cc                           	int3
  100563: cc                           	int3
  100564: cc                           	int3
  100565: cc                           	int3
  100566: cc                           	int3
  100567: cc                           	int3
  100568: cc                           	int3
  100569: cc                           	int3
  10056a: cc                           	int3
  10056b: cc                           	int3
  10056c: cc                           	int3
  10056d: cc                           	int3
  10056e: cc                           	int3
  10056f: cc                           	int3
  100570: cc                           	int3
  100571: cc                           	int3
  100572: cc                           	int3
  100573: cc                           	int3
  100574: cc                           	int3
  100575: cc                           	int3
  100576: cc                           	int3
  100577: cc                           	int3
  100578: cc                           	int3
  100579: cc                           	int3
  10057a: cc                           	int3
  10057b: cc                           	int3
  10057c: cc                           	int3
  10057d: cc                           	int3
  10057e: cc                           	int3
  10057f: cc                           	int3
  100580: cc                           	int3
  100581: cc                           	int3
  100582: cc                           	int3
  100583: cc                           	int3
  100584: cc                           	int3
  100585: cc                           	int3
  100586: cc                           	int3
  100587: cc                           	int3
  100588: cc                           	int3
  100589: cc                           	int3
  10058a: cc                           	int3
  10058b: cc                           	int3
  10058c: cc                           	int3
  10058d: cc                           	int3
  10058e: cc                           	int3
  10058f: cc                           	int3
  100590: cc                           	int3
  100591: cc                           	int3
  100592: cc                           	int3
  100593: cc                           	int3
  100594: cc                           	int3
  100595: cc                           	int3
  100596: cc                           	int3
  100597: cc                           	int3
  100598: cc                           	int3
  100599: cc                           	int3
  10059a: cc                           	int3
  10059b: cc                           	int3
  10059c: cc                           	int3
  10059d: cc                           	int3
  10059e: cc                           	int3
  10059f: cc                           	int3
  1005a0: cc                           	int3
  1005a1: cc                           	int3
  1005a2: cc                           	int3
  1005a3: cc                           	int3
  1005a4: cc                           	int3
  1005a5: cc                           	int3
  1005a6: cc                           	int3
  1005a7: cc                           	int3
  1005a8: cc                           	int3
  1005a9: cc                           	int3
  1005aa: cc                           	int3
  1005ab: cc                           	int3
  1005ac: cc                           	int3
  1005ad: cc                           	int3
  1005ae: cc                           	int3
  1005af: cc                           	int3
  1005b0: cc                           	int3
  1005b1: cc                           	int3
  1005b2: cc                           	int3
  1005b3: cc                           	int3
  1005b4: cc                           	int3
  1005b5: cc                           	int3
  1005b6: cc                           	int3
  1005b7: cc                           	int3
  1005b8: cc                           	int3
  1005b9: cc                           	int3
  1005ba: cc                           	int3
  1005bb: cc                           	int3
  1005bc: cc                           	int3
  1005bd: cc                           	int3
  1005be: cc                           	int3
  1005bf: cc                           	int3
  1005c0: cc                           	int3
  1005c1: cc                           	int3
  1005c2: cc                           	int3
  1005c3: cc                           	int3
  1005c4: cc                           	int3
  1005c5: cc                           	int3
  1005c6: cc                           	int3
  1005c7: cc                           	int3
  1005c8: cc                           	int3
  1005c9: cc                           	int3
  1005ca: cc                           	int3
  1005cb: cc                           	int3
  1005cc: cc                           	int3
  1005cd: cc                           	int3
  1005ce: cc                           	int3
  1005cf: cc                           	int3
  1005d0: cc                           	int3
  1005d1: cc                           	int3
  1005d2: cc                           	int3
  1005d3: cc                           	int3
  1005d4: cc                           	int3
  1005d5: cc                           	int3
  1005d6: cc                           	int3
  1005d7: cc                           	int3
  1005d8: cc                           	int3
  1005d9: cc                           	int3
  1005da: cc                           	int3
  1005db: cc                           	int3
  1005dc: cc                           	int3
  1005dd: cc                           	int3
  1005de: cc                           	int3
  1005df: cc                           	int3
  1005e0: cc                           	int3
  1005e1: cc                           	int3
  1005e2: cc                           	int3
  1005e3: cc                           	int3
  1005e4: cc                           	int3
  1005e5: cc                           	int3
  1005e6: cc                           	int3
  1005e7: cc                           	int3
  1005e8: cc                           	int3
  1005e9: cc                           	int3
  1005ea: cc                           	int3
  1005eb: cc                           	int3
  1005ec: cc                           	int3
  1005ed: cc                           	int3
  1005ee: cc                           	int3
  1005ef: cc                           	int3
  1005f0: cc                           	int3
  1005f1: cc                           	int3
  1005f2: cc                           	int3
  1005f3: cc                           	int3
  1005f4: cc                           	int3
  1005f5: cc                           	int3
  1005f6: cc                           	int3
  1005f7: cc                           	int3
  1005f8: cc                           	int3
  1005f9: cc                           	int3
  1005fa: cc                           	int3
  1005fb: cc                           	int3
  1005fc: cc                           	int3
  1005fd: cc                           	int3
  1005fe: cc                           	int3
  1005ff: cc                           	int3
  100600: cc                           	int3
  100601: cc                           	int3
  100602: cc                           	int3
  100603: cc                           	int3
  100604: cc                           	int3
  100605: cc                           	int3
  100606: cc                           	int3
  100607: cc                           	int3
  100608: cc                           	int3
  100609: cc                           	int3
  10060a: cc                           	int3
  10060b: cc                           	int3
  10060c: cc                           	int3
  10060d: cc                           	int3
  10060e: cc                           	int3
  10060f: cc                           	int3
  100610: cc                           	int3
  100611: cc                           	int3
  100612: cc                           	int3
  100613: cc                           	int3
  100614: cc                           	int3
  100615: cc                           	int3
  100616: cc                           	int3
  100617: cc                           	int3
  100618: cc                           	int3
  100619: cc                           	int3
  10061a: cc                           	int3
  10061b: cc                           	int3
  10061c: cc                           	int3
  10061d: cc                           	int3
  10061e: cc                           	int3
  10061f: cc                           	int3
  100620: cc                           	int3
  100621: cc                           	int3
  100622: cc                           	int3
  100623: cc                           	int3
  100624: cc                           	int3
  100625: cc                           	int3
  100626: cc                           	int3
  100627: cc                           	int3
  100628: cc                           	int3
  100629: cc                           	int3
  10062a: cc                           	int3
  10062b: cc                           	int3
  10062c: cc                           	int3
  10062d: cc                           	int3
  10062e: cc                           	int3
  10062f: cc                           	int3
  100630: cc                           	int3
  100631: cc                           	int3
  100632: cc                           	int3
  100633: cc                           	int3
  100634: cc                           	int3
  100635: cc                           	int3
  100636: cc                           	int3
  100637: cc                           	int3
  100638: cc                           	int3
  100639: cc                           	int3
  10063a: cc                           	int3
  10063b: cc                           	int3
  10063c: cc                           	int3
  10063d: cc                           	int3
  10063e: cc                           	int3
  10063f: cc                           	int3
  100640: cc                           	int3
  100641: cc                           	int3
  100642: cc                           	int3
  100643: cc                           	int3
  100644: cc                           	int3
  100645: cc                           	int3
  100646: cc                           	int3
  100647: cc                           	int3
  100648: cc                           	int3
  100649: cc                           	int3
  10064a: cc                           	int3
  10064b: cc                           	int3
  10064c: cc                           	int3
  10064d: cc                           	int3
  10064e: cc                           	int3
  10064f: cc                           	int3
  100650: cc                           	int3
  100651: cc                           	int3
  100652: cc                           	int3
  100653: cc                           	int3
  100654: cc                           	int3
  100655: cc                           	int3
  100656: cc                           	int3
  100657: cc                           	int3
  100658: cc                           	int3
  100659: cc                           	int3
  10065a: cc                           	int3
  10065b: cc                           	int3
  10065c: cc                           	int3
  10065d: cc                           	int3
  10065e: cc                           	int3
  10065f: cc                           	int3
  100660: cc                           	int3
  100661: cc                           	int3
  100662: cc                           	int3
  100663: cc                           	int3
  100664: cc                           	int3
  100665: cc                           	int3
  100666: cc                           	int3
  100667: cc                           	int3
  100668: cc                           	int3
  100669: cc                           	int3
  10066a: cc                           	int3
  10066b: cc                           	int3
  10066c: cc                           	int3
  10066d: cc                           	int3
  10066e: cc                           	int3
  10066f: cc                           	int3
  100670: cc                           	int3
  100671: cc                           	int3
  100672: cc                           	int3
  100673: cc                           	int3
  100674: cc                           	int3
  100675: cc                           	int3
  100676: cc                           	int3
  100677: cc                           	int3
  100678: cc                           	int3
  100679: cc                           	int3
  10067a: cc                           	int3
  10067b: cc                           	int3
  10067c: cc                           	int3
  10067d: cc                           	int3
  10067e: cc                           	int3
  10067f: cc                           	int3
  100680: cc                           	int3
  100681: cc                           	int3
  100682: cc                           	int3
  100683: cc                           	int3
  100684: cc                           	int3
  100685: cc                           	int3
  100686: cc                           	int3
  100687: cc                           	int3
  100688: cc                           	int3
  100689: cc                           	int3
  10068a: cc                           	int3
  10068b: cc                           	int3
  10068c: cc                           	int3
  10068d: cc                           	int3
  10068e: cc                           	int3
  10068f: cc                           	int3
  100690: cc                           	int3
  100691: cc                           	int3
  100692: cc                           	int3
  100693: cc                           	int3
  100694: cc                           	int3
  100695: cc                           	int3
  100696: cc                           	int3
  100697: cc                           	int3
  100698: cc                           	int3
  100699: cc                           	int3
  10069a: cc                           	int3
  10069b: cc                           	int3
  10069c: cc                           	int3
  10069d: cc                           	int3
  10069e: cc                           	int3
  10069f: cc                           	int3
  1006a0: cc                           	int3
  1006a1: cc                           	int3
  1006a2: cc                           	int3
  1006a3: cc                           	int3
  1006a4: cc                           	int3
  1006a5: cc                           	int3
  1006a6: cc                           	int3
  1006a7: cc                           	int3
  1006a8: cc                           	int3
  1006a9: cc                           	int3
  1006aa: cc                           	int3
  1006ab: cc                           	int3
  1006ac: cc                           	int3
  1006ad: cc                           	int3
  1006ae: cc                           	int3
  1006af: cc                           	int3
  1006b0: cc                           	int3
  1006b1: cc                           	int3
  1006b2: cc                           	int3
  1006b3: cc                           	int3
  1006b4: cc                           	int3
  1006b5: cc                           	int3
  1006b6: cc                           	int3
  1006b7: cc                           	int3
  1006b8: cc                           	int3
  1006b9: cc                           	int3
  1006ba: cc                           	int3
  1006bb: cc                           	int3
  1006bc: cc                           	int3
  1006bd: cc                           	int3
  1006be: cc                           	int3
  1006bf: cc                           	int3
  1006c0: cc                           	int3
  1006c1: cc                           	int3
  1006c2: cc                           	int3
  1006c3: cc                           	int3
  1006c4: cc                           	int3
  1006c5: cc                           	int3
  1006c6: cc                           	int3
  1006c7: cc                           	int3
  1006c8: cc                           	int3
  1006c9: cc                           	int3
  1006ca: cc                           	int3
  1006cb: cc                           	int3
  1006cc: cc                           	int3
  1006cd: cc                           	int3
  1006ce: cc                           	int3
  1006cf: cc                           	int3
  1006d0: cc                           	int3
  1006d1: cc                           	int3
  1006d2: cc                           	int3
  1006d3: cc                           	int3
  1006d4: cc                           	int3
  1006d5: cc                           	int3
  1006d6: cc                           	int3
  1006d7: cc                           	int3
  1006d8: cc                           	int3
  1006d9: cc                           	int3
  1006da: cc                           	int3
  1006db: cc                           	int3
  1006dc: cc                           	int3
  1006dd: cc                           	int3
  1006de: cc                           	int3
  1006df: cc                           	int3
  1006e0: cc                           	int3
  1006e1: cc                           	int3
  1006e2: cc                           	int3
  1006e3: cc                           	int3
  1006e4: cc                           	int3
  1006e5: cc                           	int3
  1006e6: cc                           	int3
  1006e7: cc                           	int3
  1006e8: cc                           	int3
  1006e9: cc                           	int3
  1006ea: cc                           	int3
  1006eb: cc                           	int3
  1006ec: cc                           	int3
  1006ed: cc                           	int3
  1006ee: cc                           	int3
  1006ef: cc                           	int3
  1006f0: cc                           	int3
  1006f1: cc                           	int3
  1006f2: cc                           	int3
  1006f3: cc                           	int3
  1006f4: cc                           	int3
  1006f5: cc                           	int3
  1006f6: cc                           	int3
  1006f7: cc                           	int3
  1006f8: cc                           	int3
  1006f9: cc                           	int3
  1006fa: cc                           	int3
  1006fb: cc                           	int3
  1006fc: cc                           	int3
  1006fd: cc                           	int3
  1006fe: cc                           	int3
  1006ff: cc                           	int3
  100700: cc                           	int3
  100701: cc                           	int3
  100702: cc                           	int3
  100703: cc                           	int3
  100704: cc                           	int3
  100705: cc                           	int3
  100706: cc                           	int3
  100707: cc                           	int3
  100708: cc                           	int3
  100709: cc                           	int3
  10070a: cc                           	int3
  10070b: cc                           	int3
  10070c: cc                           	int3
  10070d: cc                           	int3
  10070e: cc                           	int3
  10070f: cc                           	int3
  100710: cc                           	int3
  100711: cc                           	int3
  100712: cc                           	int3
  100713: cc                           	int3
  100714: cc                           	int3
  100715: cc                           	int3
  100716: cc                           	int3
  100717: cc                           	int3
  100718: cc                           	int3
  100719: cc                           	int3
  10071a: cc                           	int3
  10071b: cc                           	int3
  10071c: cc                           	int3
  10071d: cc                           	int3
  10071e: cc                           	int3
  10071f: cc                           	int3
  100720: cc                           	int3
  100721: cc                           	int3
  100722: cc                           	int3
  100723: cc                           	int3
  100724: cc                           	int3
  100725: cc                           	int3
  100726: cc                           	int3
  100727: cc                           	int3
  100728: cc                           	int3
  100729: cc                           	int3
  10072a: cc                           	int3
  10072b: cc                           	int3
  10072c: cc                           	int3
  10072d: cc                           	int3
  10072e: cc                           	int3
  10072f: cc                           	int3
  100730: cc                           	int3
  100731: cc                           	int3
  100732: cc                           	int3
  100733: cc                           	int3
  100734: cc                           	int3
  100735: cc                           	int3
  100736: cc                           	int3
  100737: cc                           	int3
  100738: cc                           	int3
  100739: cc                           	int3
  10073a: cc                           	int3
  10073b: cc                           	int3
  10073c: cc                           	int3
  10073d: cc                           	int3
  10073e: cc                           	int3
  10073f: cc                           	int3
  100740: cc                           	int3
  100741: cc                           	int3
  100742: cc                           	int3
  100743: cc                           	int3
  100744: cc                           	int3
  100745: cc                           	int3
  100746: cc                           	int3
  100747: cc                           	int3
  100748: cc                           	int3
  100749: cc                           	int3
  10074a: cc                           	int3
  10074b: cc                           	int3
  10074c: cc                           	int3
  10074d: cc                           	int3
  10074e: cc                           	int3
  10074f: cc                           	int3
  100750: cc                           	int3
  100751: cc                           	int3
  100752: cc                           	int3
  100753: cc                           	int3
  100754: cc                           	int3
  100755: cc                           	int3
  100756: cc                           	int3
  100757: cc                           	int3
  100758: cc                           	int3
  100759: cc                           	int3
  10075a: cc                           	int3
  10075b: cc                           	int3
  10075c: cc                           	int3
  10075d: cc                           	int3
  10075e: cc                           	int3
  10075f: cc                           	int3
  100760: cc                           	int3
  100761: cc                           	int3
  100762: cc                           	int3
  100763: cc                           	int3
  100764: cc                           	int3
  100765: cc                           	int3
  100766: cc                           	int3
  100767: cc                           	int3
  100768: cc                           	int3
  100769: cc                           	int3
  10076a: cc                           	int3
  10076b: cc                           	int3
  10076c: cc                           	int3
  10076d: cc                           	int3
  10076e: cc                           	int3
  10076f: cc                           	int3
  100770: cc                           	int3
  100771: cc                           	int3
  100772: cc                           	int3
  100773: cc                           	int3
  100774: cc                           	int3
  100775: cc                           	int3
  100776: cc                           	int3
  100777: cc                           	int3
  100778: cc                           	int3
  100779: cc                           	int3
  10077a: cc                           	int3
  10077b: cc                           	int3
  10077c: cc                           	int3
  10077d: cc                           	int3
  10077e: cc                           	int3
  10077f: cc                           	int3
  100780: cc                           	int3
  100781: cc                           	int3
  100782: cc                           	int3
  100783: cc                           	int3
  100784: cc                           	int3
  100785: cc                           	int3
  100786: cc                           	int3
  100787: cc                           	int3
  100788: cc                           	int3
  100789: cc                           	int3
  10078a: cc                           	int3
  10078b: cc                           	int3
  10078c: cc                           	int3
  10078d: cc                           	int3
  10078e: cc                           	int3
  10078f: cc                           	int3
  100790: cc                           	int3
  100791: cc                           	int3
  100792: cc                           	int3
  100793: cc                           	int3
  100794: cc                           	int3
  100795: cc                           	int3
  100796: cc                           	int3
  100797: cc                           	int3
  100798: cc                           	int3
  100799: cc                           	int3
  10079a: cc                           	int3
  10079b: cc                           	int3
  10079c: cc                           	int3
  10079d: cc                           	int3
  10079e: cc                           	int3
  10079f: cc                           	int3
  1007a0: cc                           	int3
  1007a1: cc                           	int3
  1007a2: cc                           	int3
  1007a3: cc                           	int3
  1007a4: cc                           	int3
  1007a5: cc                           	int3
  1007a6: cc                           	int3
  1007a7: cc                           	int3
  1007a8: cc                           	int3
  1007a9: cc                           	int3
  1007aa: cc                           	int3
  1007ab: cc                           	int3
  1007ac: cc                           	int3
  1007ad: cc                           	int3
  1007ae: cc                           	int3
  1007af: cc                           	int3
  1007b0: cc                           	int3
  1007b1: cc                           	int3
  1007b2: cc                           	int3
  1007b3: cc                           	int3
  1007b4: cc                           	int3
  1007b5: cc                           	int3
  1007b6: cc                           	int3
  1007b7: cc                           	int3
  1007b8: cc                           	int3
  1007b9: cc                           	int3
  1007ba: cc                           	int3
  1007bb: cc                           	int3
  1007bc: cc                           	int3
  1007bd: cc                           	int3
  1007be: cc                           	int3
  1007bf: cc                           	int3
  1007c0: cc                           	int3
  1007c1: cc                           	int3
  1007c2: cc                           	int3
  1007c3: cc                           	int3
  1007c4: cc                           	int3
  1007c5: cc                           	int3
  1007c6: cc                           	int3
  1007c7: cc                           	int3
  1007c8: cc                           	int3
  1007c9: cc                           	int3
  1007ca: cc                           	int3
  1007cb: cc                           	int3
  1007cc: cc                           	int3
  1007cd: cc                           	int3
  1007ce: cc                           	int3
  1007cf: cc                           	int3
  1007d0: cc                           	int3
  1007d1: cc                           	int3
  1007d2: cc                           	int3
  1007d3: cc                           	int3
  1007d4: cc                           	int3
  1007d5: cc                           	int3
  1007d6: cc                           	int3
  1007d7: cc                           	int3
  1007d8: cc                           	int3
  1007d9: cc                           	int3
  1007da: cc                           	int3
  1007db: cc                           	int3
  1007dc: cc                           	int3
  1007dd: cc                           	int3
  1007de: cc                           	int3
  1007df: cc                           	int3
  1007e0: cc                           	int3
  1007e1: cc                           	int3
  1007e2: cc                           	int3
  1007e3: cc                           	int3
  1007e4: cc                           	int3
  1007e5: cc                           	int3
  1007e6: cc                           	int3
  1007e7: cc                           	int3
  1007e8: cc                           	int3
  1007e9: cc                           	int3
  1007ea: cc                           	int3
  1007eb: cc                           	int3
  1007ec: cc                           	int3
  1007ed: cc                           	int3
  1007ee: cc                           	int3
  1007ef: cc                           	int3
  1007f0: cc                           	int3
  1007f1: cc                           	int3
  1007f2: cc                           	int3
  1007f3: cc                           	int3
  1007f4: cc                           	int3
  1007f5: cc                           	int3
  1007f6: cc                           	int3
  1007f7: cc                           	int3
  1007f8: cc                           	int3
  1007f9: cc                           	int3
  1007fa: cc                           	int3
  1007fb: cc                           	int3
  1007fc: cc                           	int3
  1007fd: cc                           	int3
  1007fe: cc                           	int3
  1007ff: cc                           	int3
  100800: cc                           	int3
  100801: cc                           	int3
  100802: cc                           	int3
  100803: cc                           	int3
  100804: cc                           	int3
  100805: cc                           	int3
  100806: cc                           	int3
  100807: cc                           	int3
  100808: cc                           	int3
  100809: cc                           	int3
  10080a: cc                           	int3
  10080b: cc                           	int3
  10080c: cc                           	int3
  10080d: cc                           	int3
  10080e: cc                           	int3
  10080f: cc                           	int3
  100810: cc                           	int3
  100811: cc                           	int3
  100812: cc                           	int3
  100813: cc                           	int3
  100814: cc                           	int3
  100815: cc                           	int3
  100816: cc                           	int3
  100817: cc                           	int3
  100818: cc                           	int3
  100819: cc                           	int3
  10081a: cc                           	int3
  10081b: cc                           	int3
  10081c: cc                           	int3
  10081d: cc                           	int3
  10081e: cc                           	int3
  10081f: cc                           	int3
  100820: cc                           	int3
  100821: cc                           	int3
  100822: cc                           	int3
  100823: cc                           	int3
  100824: cc                           	int3
  100825: cc                           	int3
  100826: cc                           	int3
  100827: cc                           	int3
  100828: cc                           	int3
  100829: cc                           	int3
  10082a: cc                           	int3
  10082b: cc                           	int3
  10082c: cc                           	int3
  10082d: cc                           	int3
  10082e: cc                           	int3
  10082f: cc                           	int3
  100830: cc                           	int3
  100831: cc                           	int3
  100832: cc                           	int3
  100833: cc                           	int3
  100834: cc                           	int3
  100835: cc                           	int3
  100836: cc                           	int3
  100837: cc                           	int3
  100838: cc                           	int3
  100839: cc                           	int3
  10083a: cc                           	int3
  10083b: cc                           	int3
  10083c: cc                           	int3
  10083d: cc                           	int3
  10083e: cc                           	int3
  10083f: cc                           	int3
  100840: cc                           	int3
  100841: cc                           	int3
  100842: cc                           	int3
  100843: cc                           	int3
  100844: cc                           	int3
  100845: cc                           	int3
  100846: cc                           	int3
  100847: cc                           	int3
  100848: cc                           	int3
  100849: cc                           	int3
  10084a: cc                           	int3
  10084b: cc                           	int3
  10084c: cc                           	int3
  10084d: cc                           	int3
  10084e: cc                           	int3
  10084f: cc                           	int3
  100850: cc                           	int3
  100851: cc                           	int3
  100852: cc                           	int3
  100853: cc                           	int3
  100854: cc                           	int3
  100855: cc                           	int3
  100856: cc                           	int3
  100857: cc                           	int3
  100858: cc                           	int3
  100859: cc                           	int3
  10085a: cc                           	int3
  10085b: cc                           	int3
  10085c: cc                           	int3
  10085d: cc                           	int3
  10085e: cc                           	int3
  10085f: cc                           	int3
  100860: cc                           	int3
  100861: cc                           	int3
  100862: cc                           	int3
  100863: cc                           	int3
  100864: cc                           	int3
  100865: cc                           	int3
  100866: cc                           	int3
  100867: cc                           	int3
  100868: cc                           	int3
  100869: cc                           	int3
  10086a: cc                           	int3
  10086b: cc                           	int3
  10086c: cc                           	int3
  10086d: cc                           	int3
  10086e: cc                           	int3
  10086f: cc                           	int3
  100870: cc                           	int3
  100871: cc                           	int3
  100872: cc                           	int3
  100873: cc                           	int3
  100874: cc                           	int3
  100875: cc                           	int3
  100876: cc                           	int3
  100877: cc                           	int3
  100878: cc                           	int3
  100879: cc                           	int3
  10087a: cc                           	int3
  10087b: cc                           	int3
  10087c: cc                           	int3
  10087d: cc                           	int3
  10087e: cc                           	int3
  10087f: cc                           	int3
  100880: cc                           	int3
  100881: cc                           	int3
  100882: cc                           	int3
  100883: cc                           	int3
  100884: cc                           	int3
  100885: cc                           	int3
  100886: cc                           	int3
  100887: cc                           	int3
  100888: cc                           	int3
  100889: cc                           	int3
  10088a: cc                           	int3
  10088b: cc                           	int3
  10088c: cc                           	int3
  10088d: cc                           	int3
  10088e: cc                           	int3
  10088f: cc                           	int3
  100890: cc                           	int3
  100891: cc                           	int3
  100892: cc                           	int3
  100893: cc                           	int3
  100894: cc                           	int3
  100895: cc                           	int3
  100896: cc                           	int3
  100897: cc                           	int3
  100898: cc                           	int3
  100899: cc                           	int3
  10089a: cc                           	int3
  10089b: cc                           	int3
  10089c: cc                           	int3
  10089d: cc                           	int3
  10089e: cc                           	int3
  10089f: cc                           	int3
  1008a0: cc                           	int3
  1008a1: cc                           	int3
  1008a2: cc                           	int3
  1008a3: cc                           	int3
  1008a4: cc                           	int3
  1008a5: cc                           	int3
  1008a6: cc                           	int3
  1008a7: cc                           	int3
  1008a8: cc                           	int3
  1008a9: cc                           	int3
  1008aa: cc                           	int3
  1008ab: cc                           	int3
  1008ac: cc                           	int3
  1008ad: cc                           	int3
  1008ae: cc                           	int3
  1008af: cc                           	int3
  1008b0: cc                           	int3
  1008b1: cc                           	int3
  1008b2: cc                           	int3
  1008b3: cc                           	int3
  1008b4: cc                           	int3
  1008b5: cc                           	int3
  1008b6: cc                           	int3
  1008b7: cc                           	int3
  1008b8: cc                           	int3
  1008b9: cc                           	int3
  1008ba: cc                           	int3
  1008bb: cc                           	int3
  1008bc: cc                           	int3
  1008bd: cc                           	int3
  1008be: cc                           	int3
  1008bf: cc                           	int3
  1008c0: cc                           	int3
  1008c1: cc                           	int3
  1008c2: cc                           	int3
  1008c3: cc                           	int3
  1008c4: cc                           	int3
  1008c5: cc                           	int3
  1008c6: cc                           	int3
  1008c7: cc                           	int3
  1008c8: cc                           	int3
  1008c9: cc                           	int3
  1008ca: cc                           	int3
  1008cb: cc                           	int3
  1008cc: cc                           	int3
  1008cd: cc                           	int3
  1008ce: cc                           	int3
  1008cf: cc                           	int3
  1008d0: cc                           	int3
  1008d1: cc                           	int3
  1008d2: cc                           	int3
  1008d3: cc                           	int3
  1008d4: cc                           	int3
  1008d5: cc                           	int3
  1008d6: cc                           	int3
  1008d7: cc                           	int3
  1008d8: cc                           	int3
  1008d9: cc                           	int3
  1008da: cc                           	int3
  1008db: cc                           	int3
  1008dc: cc                           	int3
  1008dd: cc                           	int3
  1008de: cc                           	int3
  1008df: cc                           	int3
  1008e0: cc                           	int3
  1008e1: cc                           	int3
  1008e2: cc                           	int3
  1008e3: cc                           	int3
  1008e4: cc                           	int3
  1008e5: cc                           	int3
  1008e6: cc                           	int3
  1008e7: cc                           	int3
  1008e8: cc                           	int3
  1008e9: cc                           	int3
  1008ea: cc                           	int3
  1008eb: cc                           	int3
  1008ec: cc                           	int3
  1008ed: cc                           	int3
  1008ee: cc                           	int3
  1008ef: cc                           	int3
  1008f0: cc                           	int3
  1008f1: cc                           	int3
  1008f2: cc                           	int3
  1008f3: cc                           	int3
  1008f4: cc                           	int3
  1008f5: cc                           	int3
  1008f6: cc                           	int3
  1008f7: cc                           	int3
  1008f8: cc                           	int3
  1008f9: cc                           	int3
  1008fa: cc                           	int3
  1008fb: cc                           	int3
  1008fc: cc                           	int3
  1008fd: cc                           	int3
  1008fe: cc                           	int3
  1008ff: cc                           	int3
  100900: cc                           	int3
  100901: cc                           	int3
  100902: cc                           	int3
  100903: cc                           	int3
  100904: cc                           	int3
  100905: cc                           	int3
  100906: cc                           	int3
  100907: cc                           	int3
  100908: cc                           	int3
  100909: cc                           	int3
  10090a: cc                           	int3
  10090b: cc                           	int3
  10090c: cc                           	int3
  10090d: cc                           	int3
  10090e: cc                           	int3
  10090f: cc                           	int3
  100910: cc                           	int3
  100911: cc                           	int3
  100912: cc                           	int3
  100913: cc                           	int3
  100914: cc                           	int3
  100915: cc                           	int3
  100916: cc                           	int3
  100917: cc                           	int3
  100918: cc                           	int3
  100919: cc                           	int3
  10091a: cc                           	int3
  10091b: cc                           	int3
  10091c: cc                           	int3
  10091d: cc                           	int3
  10091e: cc                           	int3
  10091f: cc                           	int3
  100920: cc                           	int3
  100921: cc                           	int3
  100922: cc                           	int3
  100923: cc                           	int3
  100924: cc                           	int3
  100925: cc                           	int3
  100926: cc                           	int3
  100927: cc                           	int3
  100928: cc                           	int3
  100929: cc                           	int3
  10092a: cc                           	int3
  10092b: cc                           	int3
  10092c: cc                           	int3
  10092d: cc                           	int3
  10092e: cc                           	int3
  10092f: cc                           	int3
  100930: cc                           	int3
  100931: cc                           	int3
  100932: cc                           	int3
  100933: cc                           	int3
  100934: cc                           	int3
  100935: cc                           	int3
  100936: cc                           	int3
  100937: cc                           	int3
  100938: cc                           	int3
  100939: cc                           	int3
  10093a: cc                           	int3
  10093b: cc                           	int3
  10093c: cc                           	int3
  10093d: cc                           	int3
  10093e: cc                           	int3
  10093f: cc                           	int3
  100940: cc                           	int3
  100941: cc                           	int3
  100942: cc                           	int3
  100943: cc                           	int3
  100944: cc                           	int3
  100945: cc                           	int3
  100946: cc                           	int3
  100947: cc                           	int3
  100948: cc                           	int3
  100949: cc                           	int3
  10094a: cc                           	int3
  10094b: cc                           	int3
  10094c: cc                           	int3
  10094d: cc                           	int3
  10094e: cc                           	int3
  10094f: cc                           	int3
  100950: cc                           	int3
  100951: cc                           	int3
  100952: cc                           	int3
  100953: cc                           	int3
  100954: cc                           	int3
  100955: cc                           	int3
  100956: cc                           	int3
  100957: cc                           	int3
  100958: cc                           	int3
  100959: cc                           	int3
  10095a: cc                           	int3
  10095b: cc                           	int3
  10095c: cc                           	int3
  10095d: cc                           	int3
  10095e: cc                           	int3
  10095f: cc                           	int3
  100960: cc                           	int3
  100961: cc                           	int3
  100962: cc                           	int3
  100963: cc                           	int3
  100964: cc                           	int3
  100965: cc                           	int3
  100966: cc                           	int3
  100967: cc                           	int3
  100968: cc                           	int3
  100969: cc                           	int3
  10096a: cc                           	int3
  10096b: cc                           	int3
  10096c: cc                           	int3
  10096d: cc                           	int3
  10096e: cc                           	int3
  10096f: cc                           	int3
  100970: cc                           	int3
  100971: cc                           	int3
  100972: cc                           	int3
  100973: cc                           	int3
  100974: cc                           	int3
  100975: cc                           	int3
  100976: cc                           	int3
  100977: cc                           	int3
  100978: cc                           	int3
  100979: cc                           	int3
  10097a: cc                           	int3
  10097b: cc                           	int3
  10097c: cc                           	int3
  10097d: cc                           	int3
  10097e: cc                           	int3
  10097f: cc                           	int3
  100980: cc                           	int3
  100981: cc                           	int3
  100982: cc                           	int3
  100983: cc                           	int3
  100984: cc                           	int3
  100985: cc                           	int3
  100986: cc                           	int3
  100987: cc                           	int3
  100988: cc                           	int3
  100989: cc                           	int3
  10098a: cc                           	int3
  10098b: cc                           	int3
  10098c: cc                           	int3
  10098d: cc                           	int3
  10098e: cc                           	int3
  10098f: cc                           	int3
  100990: cc                           	int3
  100991: cc                           	int3
  100992: cc                           	int3
  100993: cc                           	int3
  100994: cc                           	int3
  100995: cc                           	int3
  100996: cc                           	int3
  100997: cc                           	int3
  100998: cc                           	int3
  100999: cc                           	int3
  10099a: cc                           	int3
  10099b: cc                           	int3
  10099c: cc                           	int3
  10099d: cc                           	int3
  10099e: cc                           	int3
  10099f: cc                           	int3
  1009a0: cc                           	int3
  1009a1: cc                           	int3
  1009a2: cc                           	int3
  1009a3: cc                           	int3
  1009a4: cc                           	int3
  1009a5: cc                           	int3
  1009a6: cc                           	int3
  1009a7: cc                           	int3
  1009a8: cc                           	int3
  1009a9: cc                           	int3
  1009aa: cc                           	int3
  1009ab: cc                           	int3
  1009ac: cc                           	int3
  1009ad: cc                           	int3
  1009ae: cc                           	int3
  1009af: cc                           	int3
  1009b0: cc                           	int3
  1009b1: cc                           	int3
  1009b2: cc                           	int3
  1009b3: cc                           	int3
  1009b4: cc                           	int3
  1009b5: cc                           	int3
  1009b6: cc                           	int3
  1009b7: cc                           	int3
  1009b8: cc                           	int3
  1009b9: cc                           	int3
  1009ba: cc                           	int3
  1009bb: cc                           	int3
  1009bc: cc                           	int3
  1009bd: cc                           	int3
  1009be: cc                           	int3
  1009bf: cc                           	int3
  1009c0: cc                           	int3
  1009c1: cc                           	int3
  1009c2: cc                           	int3
  1009c3: cc                           	int3
  1009c4: cc                           	int3
  1009c5: cc                           	int3
  1009c6: cc                           	int3
  1009c7: cc                           	int3
  1009c8: cc                           	int3
  1009c9: cc                           	int3
  1009ca: cc                           	int3
  1009cb: cc                           	int3
  1009cc: cc                           	int3
  1009cd: cc                           	int3
  1009ce: cc                           	int3
  1009cf: cc                           	int3
  1009d0: cc                           	int3
  1009d1: cc                           	int3
  1009d2: cc                           	int3
  1009d3: cc                           	int3
  1009d4: cc                           	int3
  1009d5: cc                           	int3
  1009d6: cc                           	int3
  1009d7: cc                           	int3
  1009d8: cc                           	int3
  1009d9: cc                           	int3
  1009da: cc                           	int3
  1009db: cc                           	int3
  1009dc: cc                           	int3
  1009dd: cc                           	int3
  1009de: cc                           	int3
  1009df: cc                           	int3
  1009e0: cc                           	int3
  1009e1: cc                           	int3
  1009e2: cc                           	int3
  1009e3: cc                           	int3
  1009e4: cc                           	int3
  1009e5: cc                           	int3
  1009e6: cc                           	int3
  1009e7: cc                           	int3
  1009e8: cc                           	int3
  1009e9: cc                           	int3
  1009ea: cc                           	int3
  1009eb: cc                           	int3
  1009ec: cc                           	int3
  1009ed: cc                           	int3
  1009ee: cc                           	int3
  1009ef: cc                           	int3
  1009f0: cc                           	int3
  1009f1: cc                           	int3
  1009f2: cc                           	int3
  1009f3: cc                           	int3
  1009f4: cc                           	int3
  1009f5: cc                           	int3
  1009f6: cc                           	int3
  1009f7: cc                           	int3
  1009f8: cc                           	int3
  1009f9: cc                           	int3
  1009fa: cc                           	int3
  1009fb: cc                           	int3
  1009fc: cc                           	int3
  1009fd: cc                           	int3
  1009fe: cc                           	int3
  1009ff: cc                           	int3
  100a00: cc                           	int3
  100a01: cc                           	int3
  100a02: cc                           	int3
  100a03: cc                           	int3
  100a04: cc                           	int3
  100a05: cc                           	int3
  100a06: cc                           	int3
  100a07: cc                           	int3
  100a08: cc                           	int3
  100a09: cc                           	int3
  100a0a: cc                           	int3
  100a0b: cc                           	int3
  100a0c: cc                           	int3
  100a0d: cc                           	int3
  100a0e: cc                           	int3
  100a0f: cc                           	int3
  100a10: cc                           	int3
  100a11: cc                           	int3
  100a12: cc                           	int3
  100a13: cc                           	int3
  100a14: cc                           	int3
  100a15: cc                           	int3
  100a16: cc                           	int3
  100a17: cc                           	int3
  100a18: cc                           	int3
  100a19: cc                           	int3
  100a1a: cc                           	int3
  100a1b: cc                           	int3
  100a1c: cc                           	int3
  100a1d: cc                           	int3
  100a1e: cc                           	int3
  100a1f: cc                           	int3
  100a20: cc                           	int3
  100a21: cc                           	int3
  100a22: cc                           	int3
  100a23: cc                           	int3
  100a24: cc                           	int3
  100a25: cc                           	int3
  100a26: cc                           	int3
  100a27: cc                           	int3
  100a28: cc                           	int3
  100a29: cc                           	int3
  100a2a: cc                           	int3
  100a2b: cc                           	int3
  100a2c: cc                           	int3
  100a2d: cc                           	int3
  100a2e: cc                           	int3
  100a2f: cc                           	int3
  100a30: cc                           	int3
  100a31: cc                           	int3
  100a32: cc                           	int3
  100a33: cc                           	int3
  100a34: cc                           	int3
  100a35: cc                           	int3
  100a36: cc                           	int3
  100a37: cc                           	int3
  100a38: cc                           	int3
  100a39: cc                           	int3
  100a3a: cc                           	int3
  100a3b: cc                           	int3
  100a3c: cc                           	int3
  100a3d: cc                           	int3
  100a3e: cc                           	int3
  100a3f: cc                           	int3
  100a40: cc                           	int3
  100a41: cc                           	int3
  100a42: cc                           	int3
  100a43: cc                           	int3
  100a44: cc                           	int3
  100a45: cc                           	int3
  100a46: cc                           	int3
  100a47: cc                           	int3
  100a48: cc                           	int3
  100a49: cc                           	int3
  100a4a: cc                           	int3
  100a4b: cc                           	int3
  100a4c: cc                           	int3
  100a4d: cc                           	int3
  100a4e: cc                           	int3
  100a4f: cc                           	int3
  100a50: cc                           	int3
  100a51: cc                           	int3
  100a52: cc                           	int3
  100a53: cc                           	int3
  100a54: cc                           	int3
  100a55: cc                           	int3
  100a56: cc                           	int3
  100a57: cc                           	int3
  100a58: cc                           	int3
  100a59: cc                           	int3
  100a5a: cc                           	int3
  100a5b: cc                           	int3
  100a5c: cc                           	int3
  100a5d: cc                           	int3
  100a5e: cc                           	int3
  100a5f: cc                           	int3
  100a60: cc                           	int3
  100a61: cc                           	int3
  100a62: cc                           	int3
  100a63: cc                           	int3
  100a64: cc                           	int3
  100a65: cc                           	int3
  100a66: cc                           	int3
  100a67: cc                           	int3
  100a68: cc                           	int3
  100a69: cc                           	int3
  100a6a: cc                           	int3
  100a6b: cc                           	int3
  100a6c: cc                           	int3
  100a6d: cc                           	int3
  100a6e: cc                           	int3
  100a6f: cc                           	int3
  100a70: cc                           	int3
  100a71: cc                           	int3
  100a72: cc                           	int3
  100a73: cc                           	int3
  100a74: cc                           	int3
  100a75: cc                           	int3
  100a76: cc                           	int3
  100a77: cc                           	int3
  100a78: cc                           	int3
  100a79: cc                           	int3
  100a7a: cc                           	int3
  100a7b: cc                           	int3
  100a7c: cc                           	int3
  100a7d: cc                           	int3
  100a7e: cc                           	int3
  100a7f: cc                           	int3
  100a80: cc                           	int3
  100a81: cc                           	int3
  100a82: cc                           	int3
  100a83: cc                           	int3
  100a84: cc                           	int3
  100a85: cc                           	int3
  100a86: cc                           	int3
  100a87: cc                           	int3
  100a88: cc                           	int3
  100a89: cc                           	int3
  100a8a: cc                           	int3
  100a8b: cc                           	int3
  100a8c: cc                           	int3
  100a8d: cc                           	int3
  100a8e: cc                           	int3
  100a8f: cc                           	int3
  100a90: cc                           	int3
  100a91: cc                           	int3
  100a92: cc                           	int3
  100a93: cc                           	int3
  100a94: cc                           	int3
  100a95: cc                           	int3
  100a96: cc                           	int3
  100a97: cc                           	int3
  100a98: cc                           	int3
  100a99: cc                           	int3
  100a9a: cc                           	int3
  100a9b: cc                           	int3
  100a9c: cc                           	int3
  100a9d: cc                           	int3
  100a9e: cc                           	int3
  100a9f: cc                           	int3
  100aa0: cc                           	int3
  100aa1: cc                           	int3
  100aa2: cc                           	int3
  100aa3: cc                           	int3
  100aa4: cc                           	int3
  100aa5: cc                           	int3
  100aa6: cc                           	int3
  100aa7: cc                           	int3
  100aa8: cc                           	int3
  100aa9: cc                           	int3
  100aaa: cc                           	int3
  100aab: cc                           	int3
  100aac: cc                           	int3
  100aad: cc                           	int3
  100aae: cc                           	int3
  100aaf: cc                           	int3
  100ab0: cc                           	int3
  100ab1: cc                           	int3
  100ab2: cc                           	int3
  100ab3: cc                           	int3
  100ab4: cc                           	int3
  100ab5: cc                           	int3
  100ab6: cc                           	int3
  100ab7: cc                           	int3
  100ab8: cc                           	int3
  100ab9: cc                           	int3
  100aba: cc                           	int3
  100abb: cc                           	int3
  100abc: cc                           	int3
  100abd: cc                           	int3
  100abe: cc                           	int3
  100abf: cc                           	int3
  100ac0: cc                           	int3
  100ac1: cc                           	int3
  100ac2: cc                           	int3
  100ac3: cc                           	int3
  100ac4: cc                           	int3
  100ac5: cc                           	int3
  100ac6: cc                           	int3
  100ac7: cc                           	int3
  100ac8: cc                           	int3
  100ac9: cc                           	int3
  100aca: cc                           	int3
  100acb: cc                           	int3
  100acc: cc                           	int3
  100acd: cc                           	int3
  100ace: cc                           	int3
  100acf: cc                           	int3
  100ad0: cc                           	int3
  100ad1: cc                           	int3
  100ad2: cc                           	int3
  100ad3: cc                           	int3
  100ad4: cc                           	int3
  100ad5: cc                           	int3
  100ad6: cc                           	int3
  100ad7: cc                           	int3
  100ad8: cc                           	int3
  100ad9: cc                           	int3
  100ada: cc                           	int3
  100adb: cc                           	int3
  100adc: cc                           	int3
  100add: cc                           	int3
  100ade: cc                           	int3
  100adf: cc                           	int3
  100ae0: cc                           	int3
  100ae1: cc                           	int3
  100ae2: cc                           	int3
  100ae3: cc                           	int3
  100ae4: cc                           	int3
  100ae5: cc                           	int3
  100ae6: cc                           	int3
  100ae7: cc                           	int3
  100ae8: cc                           	int3
  100ae9: cc                           	int3
  100aea: cc                           	int3
  100aeb: cc                           	int3
  100aec: cc                           	int3
  100aed: cc                           	int3
  100aee: cc                           	int3
  100aef: cc                           	int3
  100af0: cc                           	int3
  100af1: cc                           	int3
  100af2: cc                           	int3
  100af3: cc                           	int3
  100af4: cc                           	int3
  100af5: cc                           	int3
  100af6: cc                           	int3
  100af7: cc                           	int3
  100af8: cc                           	int3
  100af9: cc                           	int3
  100afa: cc                           	int3
  100afb: cc                           	int3
  100afc: cc                           	int3
  100afd: cc                           	int3
  100afe: cc                           	int3
  100aff: cc                           	int3
  100b00: cc                           	int3
  100b01: cc                           	int3
  100b02: cc                           	int3
  100b03: cc                           	int3
  100b04: cc                           	int3
  100b05: cc                           	int3
  100b06: cc                           	int3
  100b07: cc                           	int3
  100b08: cc                           	int3
  100b09: cc                           	int3
  100b0a: cc                           	int3
  100b0b: cc                           	int3
  100b0c: cc                           	int3
  100b0d: cc                           	int3
  100b0e: cc                           	int3
  100b0f: cc                           	int3
  100b10: cc                           	int3
  100b11: cc                           	int3
  100b12: cc                           	int3
  100b13: cc                           	int3
  100b14: cc                           	int3
  100b15: cc                           	int3
  100b16: cc                           	int3
  100b17: cc                           	int3
  100b18: cc                           	int3
  100b19: cc                           	int3
  100b1a: cc                           	int3
  100b1b: cc                           	int3
  100b1c: cc                           	int3
  100b1d: cc                           	int3
  100b1e: cc                           	int3
  100b1f: cc                           	int3
  100b20: cc                           	int3
  100b21: cc                           	int3
  100b22: cc                           	int3
  100b23: cc                           	int3
  100b24: cc                           	int3
  100b25: cc                           	int3
  100b26: cc                           	int3
  100b27: cc                           	int3
  100b28: cc                           	int3
  100b29: cc                           	int3
  100b2a: cc                           	int3
  100b2b: cc                           	int3
  100b2c: cc                           	int3
  100b2d: cc                           	int3
  100b2e: cc                           	int3
  100b2f: cc                           	int3
  100b30: cc                           	int3
  100b31: cc                           	int3
  100b32: cc                           	int3
  100b33: cc                           	int3
  100b34: cc                           	int3
  100b35: cc                           	int3
  100b36: cc                           	int3
  100b37: cc                           	int3
  100b38: cc                           	int3
  100b39: cc                           	int3
  100b3a: cc                           	int3
  100b3b: cc                           	int3
  100b3c: cc                           	int3
  100b3d: cc                           	int3
  100b3e: cc                           	int3
  100b3f: cc                           	int3
  100b40: cc                           	int3
  100b41: cc                           	int3
  100b42: cc                           	int3
  100b43: cc                           	int3
  100b44: cc                           	int3
  100b45: cc                           	int3
  100b46: cc                           	int3
  100b47: cc                           	int3
  100b48: cc                           	int3
  100b49: cc                           	int3
  100b4a: cc                           	int3
  100b4b: cc                           	int3
  100b4c: cc                           	int3
  100b4d: cc                           	int3
  100b4e: cc                           	int3
  100b4f: cc                           	int3
  100b50: cc                           	int3
  100b51: cc                           	int3
  100b52: cc                           	int3
  100b53: cc                           	int3
  100b54: cc                           	int3
  100b55: cc                           	int3
  100b56: cc                           	int3
  100b57: cc                           	int3
  100b58: cc                           	int3
  100b59: cc                           	int3
  100b5a: cc                           	int3
  100b5b: cc                           	int3
  100b5c: cc                           	int3
  100b5d: cc                           	int3
  100b5e: cc                           	int3
  100b5f: cc                           	int3
  100b60: cc                           	int3
  100b61: cc                           	int3
  100b62: cc                           	int3
  100b63: cc                           	int3
  100b64: cc                           	int3
  100b65: cc                           	int3
  100b66: cc                           	int3
  100b67: cc                           	int3
  100b68: cc                           	int3
  100b69: cc                           	int3
  100b6a: cc                           	int3
  100b6b: cc                           	int3
  100b6c: cc                           	int3
  100b6d: cc                           	int3
  100b6e: cc                           	int3
  100b6f: cc                           	int3
  100b70: cc                           	int3
  100b71: cc                           	int3
  100b72: cc                           	int3
  100b73: cc                           	int3
  100b74: cc                           	int3
  100b75: cc                           	int3
  100b76: cc                           	int3
  100b77: cc                           	int3
  100b78: cc                           	int3
  100b79: cc                           	int3
  100b7a: cc                           	int3
  100b7b: cc                           	int3
  100b7c: cc                           	int3
  100b7d: cc                           	int3
  100b7e: cc                           	int3
  100b7f: cc                           	int3
  100b80: cc                           	int3
  100b81: cc                           	int3
  100b82: cc                           	int3
  100b83: cc                           	int3
  100b84: cc                           	int3
  100b85: cc                           	int3
  100b86: cc                           	int3
  100b87: cc                           	int3
  100b88: cc                           	int3
  100b89: cc                           	int3
  100b8a: cc                           	int3
  100b8b: cc                           	int3
  100b8c: cc                           	int3
  100b8d: cc                           	int3
  100b8e: cc                           	int3
  100b8f: cc                           	int3
  100b90: cc                           	int3
  100b91: cc                           	int3
  100b92: cc                           	int3
  100b93: cc                           	int3
  100b94: cc                           	int3
  100b95: cc                           	int3
  100b96: cc                           	int3
  100b97: cc                           	int3
  100b98: cc                           	int3
  100b99: cc                           	int3
  100b9a: cc                           	int3
  100b9b: cc                           	int3
  100b9c: cc                           	int3
  100b9d: cc                           	int3
  100b9e: cc                           	int3
  100b9f: cc                           	int3
  100ba0: cc                           	int3
  100ba1: cc                           	int3
  100ba2: cc                           	int3
  100ba3: cc                           	int3
  100ba4: cc                           	int3
  100ba5: cc                           	int3
  100ba6: cc                           	int3
  100ba7: cc                           	int3
  100ba8: cc                           	int3
  100ba9: cc                           	int3
  100baa: cc                           	int3
  100bab: cc                           	int3
  100bac: cc                           	int3
  100bad: cc                           	int3
  100bae: cc                           	int3
  100baf: cc                           	int3
  100bb0: cc                           	int3
  100bb1: cc                           	int3
  100bb2: cc                           	int3
  100bb3: cc                           	int3
  100bb4: cc                           	int3
  100bb5: cc                           	int3
  100bb6: cc                           	int3
  100bb7: cc                           	int3
  100bb8: cc                           	int3
  100bb9: cc                           	int3
  100bba: cc                           	int3
  100bbb: cc                           	int3
  100bbc: cc                           	int3
  100bbd: cc                           	int3
  100bbe: cc                           	int3
  100bbf: cc                           	int3
  100bc0: cc                           	int3
  100bc1: cc                           	int3
  100bc2: cc                           	int3
  100bc3: cc                           	int3
  100bc4: cc                           	int3
  100bc5: cc                           	int3
  100bc6: cc                           	int3
  100bc7: cc                           	int3
  100bc8: cc                           	int3
  100bc9: cc                           	int3
  100bca: cc                           	int3
  100bcb: cc                           	int3
  100bcc: cc                           	int3
  100bcd: cc                           	int3
  100bce: cc                           	int3
  100bcf: cc                           	int3
  100bd0: cc                           	int3
  100bd1: cc                           	int3
  100bd2: cc                           	int3
  100bd3: cc                           	int3
  100bd4: cc                           	int3
  100bd5: cc                           	int3
  100bd6: cc                           	int3
  100bd7: cc                           	int3
  100bd8: cc                           	int3
  100bd9: cc                           	int3
  100bda: cc                           	int3
  100bdb: cc                           	int3
  100bdc: cc                           	int3
  100bdd: cc                           	int3
  100bde: cc                           	int3
  100bdf: cc                           	int3
  100be0: cc                           	int3
  100be1: cc                           	int3
  100be2: cc                           	int3
  100be3: cc                           	int3
  100be4: cc                           	int3
  100be5: cc                           	int3
  100be6: cc                           	int3
  100be7: cc                           	int3
  100be8: cc                           	int3
  100be9: cc                           	int3
  100bea: cc                           	int3
  100beb: cc                           	int3
  100bec: cc                           	int3
  100bed: cc                           	int3
  100bee: cc                           	int3
  100bef: cc                           	int3
  100bf0: cc                           	int3
  100bf1: cc                           	int3
  100bf2: cc                           	int3
  100bf3: cc                           	int3
  100bf4: cc                           	int3
  100bf5: cc                           	int3
  100bf6: cc                           	int3
  100bf7: cc                           	int3
  100bf8: cc                           	int3
  100bf9: cc                           	int3
  100bfa: cc                           	int3
  100bfb: cc                           	int3
  100bfc: cc                           	int3
  100bfd: cc                           	int3
  100bfe: cc                           	int3
  100bff: cc                           	int3
  100c00: cc                           	int3
  100c01: cc                           	int3
  100c02: cc                           	int3
  100c03: cc                           	int3
  100c04: cc                           	int3
  100c05: cc                           	int3
  100c06: cc                           	int3
  100c07: cc                           	int3
  100c08: cc                           	int3
  100c09: cc                           	int3
  100c0a: cc                           	int3
  100c0b: cc                           	int3
  100c0c: cc                           	int3
  100c0d: cc                           	int3
  100c0e: cc                           	int3
  100c0f: cc                           	int3
  100c10: cc                           	int3
  100c11: cc                           	int3
  100c12: cc                           	int3
  100c13: cc                           	int3
  100c14: cc                           	int3
  100c15: cc                           	int3
  100c16: cc                           	int3
  100c17: cc                           	int3
  100c18: cc                           	int3
  100c19: cc                           	int3
  100c1a: cc                           	int3
  100c1b: cc                           	int3
  100c1c: cc                           	int3
  100c1d: cc                           	int3
  100c1e: cc                           	int3
  100c1f: cc                           	int3
  100c20: cc                           	int3
  100c21: cc                           	int3
  100c22: cc                           	int3
  100c23: cc                           	int3
  100c24: cc                           	int3
  100c25: cc                           	int3
  100c26: cc                           	int3
  100c27: cc                           	int3
  100c28: cc                           	int3
  100c29: cc                           	int3
  100c2a: cc                           	int3
  100c2b: cc                           	int3
  100c2c: cc                           	int3
  100c2d: cc                           	int3
  100c2e: cc                           	int3
  100c2f: cc                           	int3
  100c30: cc                           	int3
  100c31: cc                           	int3
  100c32: cc                           	int3
  100c33: cc                           	int3
  100c34: cc                           	int3
  100c35: cc                           	int3
  100c36: cc                           	int3
  100c37: cc                           	int3
  100c38: cc                           	int3
  100c39: cc                           	int3
  100c3a: cc                           	int3
  100c3b: cc                           	int3
  100c3c: cc                           	int3
  100c3d: cc                           	int3
  100c3e: cc                           	int3
  100c3f: cc                           	int3
  100c40: cc                           	int3
  100c41: cc                           	int3
  100c42: cc                           	int3
  100c43: cc                           	int3
  100c44: cc                           	int3
  100c45: cc                           	int3
  100c46: cc                           	int3
  100c47: cc                           	int3
  100c48: cc                           	int3
  100c49: cc                           	int3
  100c4a: cc                           	int3
  100c4b: cc                           	int3
  100c4c: cc                           	int3
  100c4d: cc                           	int3
  100c4e: cc                           	int3
  100c4f: cc                           	int3
  100c50: cc                           	int3
  100c51: cc                           	int3
  100c52: cc                           	int3
  100c53: cc                           	int3
  100c54: cc                           	int3
  100c55: cc                           	int3
  100c56: cc                           	int3
  100c57: cc                           	int3
  100c58: cc                           	int3
  100c59: cc                           	int3
  100c5a: cc                           	int3
  100c5b: cc                           	int3
  100c5c: cc                           	int3
  100c5d: cc                           	int3
  100c5e: cc                           	int3
  100c5f: cc                           	int3
  100c60: cc                           	int3
  100c61: cc                           	int3
  100c62: cc                           	int3
  100c63: cc                           	int3
  100c64: cc                           	int3
  100c65: cc                           	int3
  100c66: cc                           	int3
  100c67: cc                           	int3
  100c68: cc                           	int3
  100c69: cc                           	int3
  100c6a: cc                           	int3
  100c6b: cc                           	int3
  100c6c: cc                           	int3
  100c6d: cc                           	int3
  100c6e: cc                           	int3
  100c6f: cc                           	int3
  100c70: cc                           	int3
  100c71: cc                           	int3
  100c72: cc                           	int3
  100c73: cc                           	int3
  100c74: cc                           	int3
  100c75: cc                           	int3
  100c76: cc                           	int3
  100c77: cc                           	int3
  100c78: cc                           	int3
  100c79: cc                           	int3
  100c7a: cc                           	int3
  100c7b: cc                           	int3
  100c7c: cc                           	int3
  100c7d: cc                           	int3
  100c7e: cc                           	int3
  100c7f: cc                           	int3
  100c80: cc                           	int3
  100c81: cc                           	int3
  100c82: cc                           	int3
  100c83: cc                           	int3
  100c84: cc                           	int3
  100c85: cc                           	int3
  100c86: cc                           	int3
  100c87: cc                           	int3
  100c88: cc                           	int3
  100c89: cc                           	int3
  100c8a: cc                           	int3
  100c8b: cc                           	int3
  100c8c: cc                           	int3
  100c8d: cc                           	int3
  100c8e: cc                           	int3
  100c8f: cc                           	int3
  100c90: cc                           	int3
  100c91: cc                           	int3
  100c92: cc                           	int3
  100c93: cc                           	int3
  100c94: cc                           	int3
  100c95: cc                           	int3
  100c96: cc                           	int3
  100c97: cc                           	int3
  100c98: cc                           	int3
  100c99: cc                           	int3
  100c9a: cc                           	int3
  100c9b: cc                           	int3
  100c9c: cc                           	int3
  100c9d: cc                           	int3
  100c9e: cc                           	int3
  100c9f: cc                           	int3
  100ca0: cc                           	int3
  100ca1: cc                           	int3
  100ca2: cc                           	int3
  100ca3: cc                           	int3
  100ca4: cc                           	int3
  100ca5: cc                           	int3
  100ca6: cc                           	int3
  100ca7: cc                           	int3
  100ca8: cc                           	int3
  100ca9: cc                           	int3
  100caa: cc                           	int3
  100cab: cc                           	int3
  100cac: cc                           	int3
  100cad: cc                           	int3
  100cae: cc                           	int3
  100caf: cc                           	int3
  100cb0: cc                           	int3
  100cb1: cc                           	int3
  100cb2: cc                           	int3
  100cb3: cc                           	int3
  100cb4: cc                           	int3
  100cb5: cc                           	int3
  100cb6: cc                           	int3
  100cb7: cc                           	int3
  100cb8: cc                           	int3
  100cb9: cc                           	int3
  100cba: cc                           	int3
  100cbb: cc                           	int3
  100cbc: cc                           	int3
  100cbd: cc                           	int3
  100cbe: cc                           	int3
  100cbf: cc                           	int3
  100cc0: cc                           	int3
  100cc1: cc                           	int3
  100cc2: cc                           	int3
  100cc3: cc                           	int3
  100cc4: cc                           	int3
  100cc5: cc                           	int3
  100cc6: cc                           	int3
  100cc7: cc                           	int3
  100cc8: cc                           	int3
  100cc9: cc                           	int3
  100cca: cc                           	int3
  100ccb: cc                           	int3
  100ccc: cc                           	int3
  100ccd: cc                           	int3
  100cce: cc                           	int3
  100ccf: cc                           	int3
  100cd0: cc                           	int3
  100cd1: cc                           	int3
  100cd2: cc                           	int3
  100cd3: cc                           	int3
  100cd4: cc                           	int3
  100cd5: cc                           	int3
  100cd6: cc                           	int3
  100cd7: cc                           	int3
  100cd8: cc                           	int3
  100cd9: cc                           	int3
  100cda: cc                           	int3
  100cdb: cc                           	int3
  100cdc: cc                           	int3
  100cdd: cc                           	int3
  100cde: cc                           	int3
  100cdf: cc                           	int3
  100ce0: cc                           	int3
  100ce1: cc                           	int3
  100ce2: cc                           	int3
  100ce3: cc                           	int3
  100ce4: cc                           	int3
  100ce5: cc                           	int3
  100ce6: cc                           	int3
  100ce7: cc                           	int3
  100ce8: cc                           	int3
  100ce9: cc                           	int3
  100cea: cc                           	int3
  100ceb: cc                           	int3
  100cec: cc                           	int3
  100ced: cc                           	int3
  100cee: cc                           	int3
  100cef: cc                           	int3
  100cf0: cc                           	int3
  100cf1: cc                           	int3
  100cf2: cc                           	int3
  100cf3: cc                           	int3
  100cf4: cc                           	int3
  100cf5: cc                           	int3
  100cf6: cc                           	int3
  100cf7: cc                           	int3
  100cf8: cc                           	int3
  100cf9: cc                           	int3
  100cfa: cc                           	int3
  100cfb: cc                           	int3
  100cfc: cc                           	int3
  100cfd: cc                           	int3
  100cfe: cc                           	int3
  100cff: cc                           	int3
  100d00: cc                           	int3
  100d01: cc                           	int3
  100d02: cc                           	int3
  100d03: cc                           	int3
  100d04: cc                           	int3
  100d05: cc                           	int3
  100d06: cc                           	int3
  100d07: cc                           	int3
  100d08: cc                           	int3
  100d09: cc                           	int3
  100d0a: cc                           	int3
  100d0b: cc                           	int3
  100d0c: cc                           	int3
  100d0d: cc                           	int3
  100d0e: cc                           	int3
  100d0f: cc                           	int3
  100d10: cc                           	int3
  100d11: cc                           	int3
  100d12: cc                           	int3
  100d13: cc                           	int3
  100d14: cc                           	int3
  100d15: cc                           	int3
  100d16: cc                           	int3
  100d17: cc                           	int3
  100d18: cc                           	int3
  100d19: cc                           	int3
  100d1a: cc                           	int3
  100d1b: cc                           	int3
  100d1c: cc                           	int3
  100d1d: cc                           	int3
  100d1e: cc                           	int3
  100d1f: cc                           	int3
  100d20: cc                           	int3
  100d21: cc                           	int3
  100d22: cc                           	int3
  100d23: cc                           	int3
  100d24: cc                           	int3
  100d25: cc                           	int3
  100d26: cc                           	int3
  100d27: cc                           	int3
  100d28: cc                           	int3
  100d29: cc                           	int3
  100d2a: cc                           	int3
  100d2b: cc                           	int3
  100d2c: cc                           	int3
  100d2d: cc                           	int3
  100d2e: cc                           	int3
  100d2f: cc                           	int3
  100d30: cc                           	int3
  100d31: cc                           	int3
  100d32: cc                           	int3
  100d33: cc                           	int3
  100d34: cc                           	int3
  100d35: cc                           	int3
  100d36: cc                           	int3
  100d37: cc                           	int3
  100d38: cc                           	int3
  100d39: cc                           	int3
  100d3a: cc                           	int3
  100d3b: cc                           	int3
  100d3c: cc                           	int3
  100d3d: cc                           	int3
  100d3e: cc                           	int3
  100d3f: cc                           	int3
  100d40: cc                           	int3
  100d41: cc                           	int3
  100d42: cc                           	int3
  100d43: cc                           	int3
  100d44: cc                           	int3
  100d45: cc                           	int3
  100d46: cc                           	int3
  100d47: cc                           	int3
  100d48: cc                           	int3
  100d49: cc                           	int3
  100d4a: cc                           	int3
  100d4b: cc                           	int3
  100d4c: cc                           	int3
  100d4d: cc                           	int3
  100d4e: cc                           	int3
  100d4f: cc                           	int3
  100d50: cc                           	int3
  100d51: cc                           	int3
  100d52: cc                           	int3
  100d53: cc                           	int3
  100d54: cc                           	int3
  100d55: cc                           	int3
  100d56: cc                           	int3
  100d57: cc                           	int3
  100d58: cc                           	int3
  100d59: cc                           	int3
  100d5a: cc                           	int3
  100d5b: cc                           	int3
  100d5c: cc                           	int3
  100d5d: cc                           	int3
  100d5e: cc                           	int3
  100d5f: cc                           	int3
  100d60: cc                           	int3
  100d61: cc                           	int3
  100d62: cc                           	int3
  100d63: cc                           	int3
  100d64: cc                           	int3
  100d65: cc                           	int3
  100d66: cc                           	int3
  100d67: cc                           	int3
  100d68: cc                           	int3
  100d69: cc                           	int3
  100d6a: cc                           	int3
  100d6b: cc                           	int3
  100d6c: cc                           	int3
  100d6d: cc                           	int3
  100d6e: cc                           	int3
  100d6f: cc                           	int3
  100d70: cc                           	int3
  100d71: cc                           	int3
  100d72: cc                           	int3
  100d73: cc                           	int3
  100d74: cc                           	int3
  100d75: cc                           	int3
  100d76: cc                           	int3
  100d77: cc                           	int3
  100d78: cc                           	int3
  100d79: cc                           	int3
  100d7a: cc                           	int3
  100d7b: cc                           	int3
  100d7c: cc                           	int3
  100d7d: cc                           	int3
  100d7e: cc                           	int3
  100d7f: cc                           	int3
  100d80: cc                           	int3
  100d81: cc                           	int3
  100d82: cc                           	int3
  100d83: cc                           	int3
  100d84: cc                           	int3
  100d85: cc                           	int3
  100d86: cc                           	int3
  100d87: cc                           	int3
  100d88: cc                           	int3
  100d89: cc                           	int3
  100d8a: cc                           	int3
  100d8b: cc                           	int3
  100d8c: cc                           	int3
  100d8d: cc                           	int3
  100d8e: cc                           	int3
  100d8f: cc                           	int3
  100d90: cc                           	int3
  100d91: cc                           	int3
  100d92: cc                           	int3
  100d93: cc                           	int3
  100d94: cc                           	int3
  100d95: cc                           	int3
  100d96: cc                           	int3
  100d97: cc                           	int3
  100d98: cc                           	int3
  100d99: cc                           	int3
  100d9a: cc                           	int3
  100d9b: cc                           	int3
  100d9c: cc                           	int3
  100d9d: cc                           	int3
  100d9e: cc                           	int3
  100d9f: cc                           	int3
  100da0: cc                           	int3
  100da1: cc                           	int3
  100da2: cc                           	int3
  100da3: cc                           	int3
  100da4: cc                           	int3
  100da5: cc                           	int3
  100da6: cc                           	int3
  100da7: cc                           	int3
  100da8: cc                           	int3
  100da9: cc                           	int3
  100daa: cc                           	int3
  100dab: cc                           	int3
  100dac: cc                           	int3
  100dad: cc                           	int3
  100dae: cc                           	int3
  100daf: cc                           	int3
  100db0: cc                           	int3
  100db1: cc                           	int3
  100db2: cc                           	int3
  100db3: cc                           	int3
  100db4: cc                           	int3
  100db5: cc                           	int3
  100db6: cc                           	int3
  100db7: cc                           	int3
  100db8: cc                           	int3
  100db9: cc                           	int3
  100dba: cc                           	int3
  100dbb: cc                           	int3
  100dbc: cc                           	int3
  100dbd: cc                           	int3
  100dbe: cc                           	int3
  100dbf: cc                           	int3
  100dc0: cc                           	int3
  100dc1: cc                           	int3
  100dc2: cc                           	int3
  100dc3: cc                           	int3
  100dc4: cc                           	int3
  100dc5: cc                           	int3
  100dc6: cc                           	int3
  100dc7: cc                           	int3
  100dc8: cc                           	int3
  100dc9: cc                           	int3
  100dca: cc                           	int3
  100dcb: cc                           	int3
  100dcc: cc                           	int3
  100dcd: cc                           	int3
  100dce: cc                           	int3
  100dcf: cc                           	int3
  100dd0: cc                           	int3
  100dd1: cc                           	int3
  100dd2: cc                           	int3
  100dd3: cc                           	int3
  100dd4: cc                           	int3
  100dd5: cc                           	int3
  100dd6: cc                           	int3
  100dd7: cc                           	int3
  100dd8: cc                           	int3
  100dd9: cc                           	int3
  100dda: cc                           	int3
  100ddb: cc                           	int3
  100ddc: cc                           	int3
  100ddd: cc                           	int3
  100dde: cc                           	int3
  100ddf: cc                           	int3
  100de0: cc                           	int3
  100de1: cc                           	int3
  100de2: cc                           	int3
  100de3: cc                           	int3
  100de4: cc                           	int3
  100de5: cc                           	int3
  100de6: cc                           	int3
  100de7: cc                           	int3
  100de8: cc                           	int3
  100de9: cc                           	int3
  100dea: cc                           	int3
  100deb: cc                           	int3
  100dec: cc                           	int3
  100ded: cc                           	int3
  100dee: cc                           	int3
  100def: cc                           	int3
  100df0: cc                           	int3
  100df1: cc                           	int3
  100df2: cc                           	int3
  100df3: cc                           	int3
  100df4: cc                           	int3
  100df5: cc                           	int3
  100df6: cc                           	int3
  100df7: cc                           	int3
  100df8: cc                           	int3
  100df9: cc                           	int3
  100dfa: cc                           	int3
  100dfb: cc                           	int3
  100dfc: cc                           	int3
  100dfd: cc                           	int3
  100dfe: cc                           	int3
  100dff: cc                           	int3
  100e00: cc                           	int3
  100e01: cc                           	int3
  100e02: cc                           	int3
  100e03: cc                           	int3
  100e04: cc                           	int3
  100e05: cc                           	int3
  100e06: cc                           	int3
  100e07: cc                           	int3
  100e08: cc                           	int3
  100e09: cc                           	int3
  100e0a: cc                           	int3
  100e0b: cc                           	int3
  100e0c: cc                           	int3
  100e0d: cc                           	int3
  100e0e: cc                           	int3
  100e0f: cc                           	int3
  100e10: cc                           	int3
  100e11: cc                           	int3
  100e12: cc                           	int3
  100e13: cc                           	int3
  100e14: cc                           	int3
  100e15: cc                           	int3
  100e16: cc                           	int3
  100e17: cc                           	int3
  100e18: cc                           	int3
  100e19: cc                           	int3
  100e1a: cc                           	int3
  100e1b: cc                           	int3
  100e1c: cc                           	int3
  100e1d: cc                           	int3
  100e1e: cc                           	int3
  100e1f: cc                           	int3
  100e20: cc                           	int3
  100e21: cc                           	int3
  100e22: cc                           	int3
  100e23: cc                           	int3
  100e24: cc                           	int3
  100e25: cc                           	int3
  100e26: cc                           	int3
  100e27: cc                           	int3
  100e28: cc                           	int3
  100e29: cc                           	int3
  100e2a: cc                           	int3
  100e2b: cc                           	int3
  100e2c: cc                           	int3
  100e2d: cc                           	int3
  100e2e: cc                           	int3
  100e2f: cc                           	int3
  100e30: cc                           	int3
  100e31: cc                           	int3
  100e32: cc                           	int3
  100e33: cc                           	int3
  100e34: cc                           	int3
  100e35: cc                           	int3
  100e36: cc                           	int3
  100e37: cc                           	int3
  100e38: cc                           	int3
  100e39: cc                           	int3
  100e3a: cc                           	int3
  100e3b: cc                           	int3
  100e3c: cc                           	int3
  100e3d: cc                           	int3
  100e3e: cc                           	int3
  100e3f: cc                           	int3
  100e40: cc                           	int3
  100e41: cc                           	int3
  100e42: cc                           	int3
  100e43: cc                           	int3
  100e44: cc                           	int3
  100e45: cc                           	int3
  100e46: cc                           	int3
  100e47: cc                           	int3
  100e48: cc                           	int3
  100e49: cc                           	int3
  100e4a: cc                           	int3
  100e4b: cc                           	int3
  100e4c: cc                           	int3
  100e4d: cc                           	int3
  100e4e: cc                           	int3
  100e4f: cc                           	int3
  100e50: cc                           	int3
  100e51: cc                           	int3
  100e52: cc                           	int3
  100e53: cc                           	int3
  100e54: cc                           	int3
  100e55: cc                           	int3
  100e56: cc                           	int3
  100e57: cc                           	int3
  100e58: cc                           	int3
  100e59: cc                           	int3
  100e5a: cc                           	int3
  100e5b: cc                           	int3
  100e5c: cc                           	int3
  100e5d: cc                           	int3
  100e5e: cc                           	int3
  100e5f: cc                           	int3
  100e60: cc                           	int3
  100e61: cc                           	int3
  100e62: cc                           	int3
  100e63: cc                           	int3
  100e64: cc                           	int3
  100e65: cc                           	int3
  100e66: cc                           	int3
  100e67: cc                           	int3
  100e68: cc                           	int3
  100e69: cc                           	int3
  100e6a: cc                           	int3
  100e6b: cc                           	int3
  100e6c: cc                           	int3
  100e6d: cc                           	int3
  100e6e: cc                           	int3
  100e6f: cc                           	int3
  100e70: cc                           	int3
  100e71: cc                           	int3
  100e72: cc                           	int3
  100e73: cc                           	int3
  100e74: cc                           	int3
  100e75: cc                           	int3
  100e76: cc                           	int3
  100e77: cc                           	int3
  100e78: cc                           	int3
  100e79: cc                           	int3
  100e7a: cc                           	int3
  100e7b: cc                           	int3
  100e7c: cc                           	int3
  100e7d: cc                           	int3
  100e7e: cc                           	int3
  100e7f: cc                           	int3
  100e80: cc                           	int3
  100e81: cc                           	int3
  100e82: cc                           	int3
  100e83: cc                           	int3
  100e84: cc                           	int3
  100e85: cc                           	int3
  100e86: cc                           	int3
  100e87: cc                           	int3
  100e88: cc                           	int3
  100e89: cc                           	int3
  100e8a: cc                           	int3
  100e8b: cc                           	int3
  100e8c: cc                           	int3
  100e8d: cc                           	int3
  100e8e: cc                           	int3
  100e8f: cc                           	int3
  100e90: cc                           	int3
  100e91: cc                           	int3
  100e92: cc                           	int3
  100e93: cc                           	int3
  100e94: cc                           	int3
  100e95: cc                           	int3
  100e96: cc                           	int3
  100e97: cc                           	int3
  100e98: cc                           	int3
  100e99: cc                           	int3
  100e9a: cc                           	int3
  100e9b: cc                           	int3
  100e9c: cc                           	int3
  100e9d: cc                           	int3
  100e9e: cc                           	int3
  100e9f: cc                           	int3
  100ea0: cc                           	int3
  100ea1: cc                           	int3
  100ea2: cc                           	int3
  100ea3: cc                           	int3
  100ea4: cc                           	int3
  100ea5: cc                           	int3
  100ea6: cc                           	int3
  100ea7: cc                           	int3
  100ea8: cc                           	int3
  100ea9: cc                           	int3
  100eaa: cc                           	int3
  100eab: cc                           	int3
  100eac: cc                           	int3
  100ead: cc                           	int3
  100eae: cc                           	int3
  100eaf: cc                           	int3
  100eb0: cc                           	int3
  100eb1: cc                           	int3
  100eb2: cc                           	int3
  100eb3: cc                           	int3
  100eb4: cc                           	int3
  100eb5: cc                           	int3
  100eb6: cc                           	int3
  100eb7: cc                           	int3
  100eb8: cc                           	int3
  100eb9: cc                           	int3
  100eba: cc                           	int3
  100ebb: cc                           	int3
  100ebc: cc                           	int3
  100ebd: cc                           	int3
  100ebe: cc                           	int3
  100ebf: cc                           	int3
  100ec0: cc                           	int3
  100ec1: cc                           	int3
  100ec2: cc                           	int3
  100ec3: cc                           	int3
  100ec4: cc                           	int3
  100ec5: cc                           	int3
  100ec6: cc                           	int3
  100ec7: cc                           	int3
  100ec8: cc                           	int3
  100ec9: cc                           	int3
  100eca: cc                           	int3
  100ecb: cc                           	int3
  100ecc: cc                           	int3
  100ecd: cc                           	int3
  100ece: cc                           	int3
  100ecf: cc                           	int3
  100ed0: cc                           	int3
  100ed1: cc                           	int3
  100ed2: cc                           	int3
  100ed3: cc                           	int3
  100ed4: cc                           	int3
  100ed5: cc                           	int3
  100ed6: cc                           	int3
  100ed7: cc                           	int3
  100ed8: cc                           	int3
  100ed9: cc                           	int3
  100eda: cc                           	int3
  100edb: cc                           	int3
  100edc: cc                           	int3
  100edd: cc                           	int3
  100ede: cc                           	int3
  100edf: cc                           	int3
  100ee0: cc                           	int3
  100ee1: cc                           	int3
  100ee2: cc                           	int3
  100ee3: cc                           	int3
  100ee4: cc                           	int3
  100ee5: cc                           	int3
  100ee6: cc                           	int3
  100ee7: cc                           	int3
  100ee8: cc                           	int3
  100ee9: cc                           	int3
  100eea: cc                           	int3
  100eeb: cc                           	int3
  100eec: cc                           	int3
  100eed: cc                           	int3
  100eee: cc                           	int3
  100eef: cc                           	int3
  100ef0: cc                           	int3
  100ef1: cc                           	int3
  100ef2: cc                           	int3
  100ef3: cc                           	int3
  100ef4: cc                           	int3
  100ef5: cc                           	int3
  100ef6: cc                           	int3
  100ef7: cc                           	int3
  100ef8: cc                           	int3
  100ef9: cc                           	int3
  100efa: cc                           	int3
  100efb: cc                           	int3
  100efc: cc                           	int3
  100efd: cc                           	int3
  100efe: cc                           	int3
  100eff: cc                           	int3
  100f00: cc                           	int3
  100f01: cc                           	int3
  100f02: cc                           	int3
  100f03: cc                           	int3
  100f04: cc                           	int3
  100f05: cc                           	int3
  100f06: cc                           	int3
  100f07: cc                           	int3
  100f08: cc                           	int3
  100f09: cc                           	int3
  100f0a: cc                           	int3
  100f0b: cc                           	int3
  100f0c: cc                           	int3
  100f0d: cc                           	int3
  100f0e: cc                           	int3
  100f0f: cc                           	int3
  100f10: cc                           	int3
  100f11: cc                           	int3
  100f12: cc                           	int3
  100f13: cc                           	int3
  100f14: cc                           	int3
  100f15: cc                           	int3
  100f16: cc                           	int3
  100f17: cc                           	int3
  100f18: cc                           	int3
  100f19: cc                           	int3
  100f1a: cc                           	int3
  100f1b: cc                           	int3
  100f1c: cc                           	int3
  100f1d: cc                           	int3
  100f1e: cc                           	int3
  100f1f: cc                           	int3
  100f20: cc                           	int3
  100f21: cc                           	int3
  100f22: cc                           	int3
  100f23: cc                           	int3
  100f24: cc                           	int3
  100f25: cc                           	int3
  100f26: cc                           	int3
  100f27: cc                           	int3
  100f28: cc                           	int3
  100f29: cc                           	int3
  100f2a: cc                           	int3
  100f2b: cc                           	int3
  100f2c: cc                           	int3
  100f2d: cc                           	int3
  100f2e: cc                           	int3
  100f2f: cc                           	int3
  100f30: cc                           	int3
  100f31: cc                           	int3
  100f32: cc                           	int3
  100f33: cc                           	int3
  100f34: cc                           	int3
  100f35: cc                           	int3
  100f36: cc                           	int3
  100f37: cc                           	int3
  100f38: cc                           	int3
  100f39: cc                           	int3
  100f3a: cc                           	int3
  100f3b: cc                           	int3
  100f3c: cc                           	int3
  100f3d: cc                           	int3
  100f3e: cc                           	int3
  100f3f: cc                           	int3
  100f40: cc                           	int3
  100f41: cc                           	int3
  100f42: cc                           	int3
  100f43: cc                           	int3
  100f44: cc                           	int3
  100f45: cc                           	int3
  100f46: cc                           	int3
  100f47: cc                           	int3
  100f48: cc                           	int3
  100f49: cc                           	int3
  100f4a: cc                           	int3
  100f4b: cc                           	int3
  100f4c: cc                           	int3
  100f4d: cc                           	int3
  100f4e: cc                           	int3
  100f4f: cc                           	int3
  100f50: cc                           	int3
  100f51: cc                           	int3
  100f52: cc                           	int3
  100f53: cc                           	int3
  100f54: cc                           	int3
  100f55: cc                           	int3
  100f56: cc                           	int3
  100f57: cc                           	int3
  100f58: cc                           	int3
  100f59: cc                           	int3
  100f5a: cc                           	int3
  100f5b: cc                           	int3
  100f5c: cc                           	int3
  100f5d: cc                           	int3
  100f5e: cc                           	int3
  100f5f: cc                           	int3
  100f60: cc                           	int3
  100f61: cc                           	int3
  100f62: cc                           	int3
  100f63: cc                           	int3
  100f64: cc                           	int3
  100f65: cc                           	int3
  100f66: cc                           	int3
  100f67: cc                           	int3
  100f68: cc                           	int3
  100f69: cc                           	int3
  100f6a: cc                           	int3
  100f6b: cc                           	int3
  100f6c: cc                           	int3
  100f6d: cc                           	int3
  100f6e: cc                           	int3
  100f6f: cc                           	int3
  100f70: cc                           	int3
  100f71: cc                           	int3
  100f72: cc                           	int3
  100f73: cc                           	int3
  100f74: cc                           	int3
  100f75: cc                           	int3
  100f76: cc                           	int3
  100f77: cc                           	int3
  100f78: cc                           	int3
  100f79: cc                           	int3
  100f7a: cc                           	int3
  100f7b: cc                           	int3
  100f7c: cc                           	int3
  100f7d: cc                           	int3
  100f7e: cc                           	int3
  100f7f: cc                           	int3
  100f80: cc                           	int3
  100f81: cc                           	int3
  100f82: cc                           	int3
  100f83: cc                           	int3
  100f84: cc                           	int3
  100f85: cc                           	int3
  100f86: cc                           	int3
  100f87: cc                           	int3
  100f88: cc                           	int3
  100f89: cc                           	int3
  100f8a: cc                           	int3
  100f8b: cc                           	int3
  100f8c: cc                           	int3
  100f8d: cc                           	int3
  100f8e: cc                           	int3
  100f8f: cc                           	int3
  100f90: cc                           	int3
  100f91: cc                           	int3
  100f92: cc                           	int3
  100f93: cc                           	int3
  100f94: cc                           	int3
  100f95: cc                           	int3
  100f96: cc                           	int3
  100f97: cc                           	int3
  100f98: cc                           	int3
  100f99: cc                           	int3
  100f9a: cc                           	int3
  100f9b: cc                           	int3
  100f9c: cc                           	int3
  100f9d: cc                           	int3
  100f9e: cc                           	int3
  100f9f: cc                           	int3
  100fa0: cc                           	int3
  100fa1: cc                           	int3
  100fa2: cc                           	int3
  100fa3: cc                           	int3
  100fa4: cc                           	int3
  100fa5: cc                           	int3
  100fa6: cc                           	int3
  100fa7: cc                           	int3
  100fa8: cc                           	int3
  100fa9: cc                           	int3
  100faa: cc                           	int3
  100fab: cc                           	int3
  100fac: cc                           	int3
  100fad: cc                           	int3
  100fae: cc                           	int3
  100faf: cc                           	int3
  100fb0: cc                           	int3
  100fb1: cc                           	int3
  100fb2: cc                           	int3
  100fb3: cc                           	int3
  100fb4: cc                           	int3
  100fb5: cc                           	int3
  100fb6: cc                           	int3
  100fb7: cc                           	int3
  100fb8: cc                           	int3
  100fb9: cc                           	int3
  100fba: cc                           	int3
  100fbb: cc                           	int3
  100fbc: cc                           	int3
  100fbd: cc                           	int3
  100fbe: cc                           	int3
  100fbf: cc                           	int3
  100fc0: cc                           	int3
  100fc1: cc                           	int3
  100fc2: cc                           	int3
  100fc3: cc                           	int3
  100fc4: cc                           	int3
  100fc5: cc                           	int3
  100fc6: cc                           	int3
  100fc7: cc                           	int3
  100fc8: cc                           	int3
  100fc9: cc                           	int3
  100fca: cc                           	int3
  100fcb: cc                           	int3
  100fcc: cc                           	int3
  100fcd: cc                           	int3
  100fce: cc                           	int3
  100fcf: cc                           	int3
  100fd0: cc                           	int3
  100fd1: cc                           	int3
  100fd2: cc                           	int3
  100fd3: cc                           	int3
  100fd4: cc                           	int3
  100fd5: cc                           	int3
  100fd6: cc                           	int3
  100fd7: cc                           	int3
  100fd8: cc                           	int3
  100fd9: cc                           	int3
  100fda: cc                           	int3
  100fdb: cc                           	int3
  100fdc: cc                           	int3
  100fdd: cc                           	int3
  100fde: cc                           	int3
  100fdf: cc                           	int3
  100fe0: cc                           	int3
  100fe1: cc                           	int3
  100fe2: cc                           	int3
  100fe3: cc                           	int3
  100fe4: cc                           	int3
  100fe5: cc                           	int3
  100fe6: cc                           	int3
  100fe7: cc                           	int3
  100fe8: cc                           	int3
  100fe9: cc                           	int3
  100fea: cc                           	int3
  100feb: cc                           	int3
  100fec: cc                           	int3
  100fed: cc                           	int3
  100fee: cc                           	int3
  100fef: cc                           	int3
  100ff0: cc                           	int3
  100ff1: cc                           	int3
  100ff2: cc                           	int3
  100ff3: cc                           	int3
  100ff4: cc                           	int3
  100ff5: cc                           	int3
  100ff6: cc                           	int3
  100ff7: cc                           	int3
  100ff8: cc                           	int3
  100ff9: cc                           	int3
  100ffa: cc                           	int3
  100ffb: cc                           	int3
  100ffc: cc                           	int3
  100ffd: cc                           	int3
  100ffe: cc                           	int3
  100fff: cc                           	int3

0000000000101000 <bootstack>:
		...

0000000000109000 <pml4>:
		...

000000000010a000 <pdpt>:
		...

000000000010b000 <page_dir>:
		...

Disassembly of section .text:

ffff80000010c000 <serial_intr>:
; {
ffff80000010c000: 55                   	pushq	%rbp
ffff80000010c001: 48 89 e5             	movq	%rsp, %rbp
;     if (serial_exists)
ffff80000010c004: 48 b8 00 a0 11 00 00 80 ff ff	movabsq	$-140737487200256, %rax # imm = 0xFFFF80000011A000
ffff80000010c00e: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c011: 74 16                	je	0xffff80000010c029 <serial_intr+0x29>
;         cons_intr(serial_proc_data);
ffff80000010c013: 48 bf 90 c0 10 00 00 80 ff ff	movabsq	$-140737487257456, %rdi # imm = 0xFFFF80000010C090
ffff80000010c01d: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c027: ff d0                	callq	*%rax
; }
ffff80000010c029: 5d                   	popq	%rbp
ffff80000010c02a: c3                   	retq
ffff80000010c02b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c030 <cons_intr>:
; {
ffff80000010c030: 55                   	pushq	%rbp
ffff80000010c031: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c034: 41 56                	pushq	%r14
ffff80000010c036: 53                   	pushq	%rbx
ffff80000010c037: 49 89 fe             	movq	%rdi, %r14
ffff80000010c03a: 48 bb 04 a0 11 00 00 80 ff ff	movabsq	$-140737487200252, %rbx # imm = 0xFFFF80000011A004
ffff80000010c044: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c04e: 66 90                	nop
;     while ((c = (*proc)()) != -1) {
ffff80000010c050: 41 ff d6             	callq	*%r14
ffff80000010c053: 85 c0                	testl	%eax, %eax
ffff80000010c055: 74 f9                	je	0xffff80000010c050 <cons_intr+0x20>
ffff80000010c057: 83 f8 ff             	cmpl	$-1, %eax
ffff80000010c05a: 74 2a                	je	0xffff80000010c086 <cons_intr+0x56>
;         cons.buf[cons.wpos++] = c;
ffff80000010c05c: 8b 8b 04 02 00 00    	movl	516(%rbx), %ecx
ffff80000010c062: 8d 51 01             	leal	1(%rcx), %edx
ffff80000010c065: 89 93 04 02 00 00    	movl	%edx, 516(%rbx)
ffff80000010c06b: 88 04 19             	movb	%al, (%rcx,%rbx)
;         if (cons.wpos == CONSBUFSIZE)
ffff80000010c06e: 81 bb 04 02 00 00 00 02 00 00	cmpl	$512, 516(%rbx) # imm = 0x200
ffff80000010c078: 75 d6                	jne	0xffff80000010c050 <cons_intr+0x20>
;             cons.wpos = 0;
ffff80000010c07a: c7 83 04 02 00 00 00 00 00 00	movl	$0, 516(%rbx)
ffff80000010c084: eb ca                	jmp	0xffff80000010c050 <cons_intr+0x20>
; }
ffff80000010c086: 5b                   	popq	%rbx
ffff80000010c087: 41 5e                	popq	%r14
ffff80000010c089: 5d                   	popq	%rbp
ffff80000010c08a: c3                   	retq
ffff80000010c08b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c090 <serial_proc_data>:
; {
ffff80000010c090: 55                   	pushq	%rbp
ffff80000010c091: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c094: 53                   	pushq	%rbx
ffff80000010c095: 50                   	pushq	%rax
;     if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
ffff80000010c096: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c0a0: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c0a5: ff d3                	callq	*%rbx
ffff80000010c0a7: 89 c1                	movl	%eax, %ecx
ffff80000010c0a9: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010c0ae: f6 c1 01             	testb	$1, %cl
ffff80000010c0b1: 74 0a                	je	0xffff80000010c0bd <serial_proc_data+0x2d>
;     return inb(COM1+COM_RX);
ffff80000010c0b3: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c0b8: ff d3                	callq	*%rbx
ffff80000010c0ba: 0f b6 c0             	movzbl	%al, %eax
; }
ffff80000010c0bd: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c0c1: 5b                   	popq	%rbx
ffff80000010c0c2: 5d                   	popq	%rbp
ffff80000010c0c3: c3                   	retq
ffff80000010c0c4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c0ce: 66 90                	nop

ffff80000010c0d0 <kbd_intr>:
; {
ffff80000010c0d0: 55                   	pushq	%rbp
ffff80000010c0d1: 48 89 e5             	movq	%rsp, %rbp
;     cons_intr(kbd_proc_data);
ffff80000010c0d4: 48 bf f0 c0 10 00 00 80 ff ff	movabsq	$-140737487257360, %rdi # imm = 0xFFFF80000010C0F0
ffff80000010c0de: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c0e8: ff d0                	callq	*%rax
; }
ffff80000010c0ea: 5d                   	popq	%rbp
ffff80000010c0eb: c3                   	retq
ffff80000010c0ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c0f0 <kbd_proc_data>:
; {
ffff80000010c0f0: 55                   	pushq	%rbp
ffff80000010c0f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c0f4: 41 56                	pushq	%r14
ffff80000010c0f6: 53                   	pushq	%rbx
;     if ((inb(KBSTATP) & KBS_DIB) == 0)
ffff80000010c0f7: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c101: bf 64 00 00 00       	movl	$100, %edi
ffff80000010c106: ff d3                	callq	*%rbx
ffff80000010c108: 41 be ff ff ff ff    	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
ffff80000010c10e: a8 01                	testb	$1, %al
ffff80000010c110: 0f 84 08 01 00 00    	je	0xffff80000010c21e <kbd_proc_data+0x12e>
;     data = inb(KBDATAP);
ffff80000010c116: bf 60 00 00 00       	movl	$96, %edi
ffff80000010c11b: ff d3                	callq	*%rbx
;     if (data == 0xE0) {
ffff80000010c11d: 3c e0                	cmpb	$-32, %al
ffff80000010c11f: 75 15                	jne	0xffff80000010c136 <kbd_proc_data+0x46>
;         shift |= E0ESC;
ffff80000010c121: 48 b8 0c a2 11 00 00 80 ff ff	movabsq	$-140737487199732, %rax # imm = 0xFFFF80000011A20C
ffff80000010c12b: 80 08 40             	orb	$64, (%rax)
ffff80000010c12e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c131: e9 e8 00 00 00       	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c136: 48 b9 0c a2 11 00 00 80 ff ff	movabsq	$-140737487199732, %rcx # imm = 0xFFFF80000011A20C
ffff80000010c140: 8b 11                	movl	(%rcx), %edx
;     } else if (data & 0x80) {
ffff80000010c142: 84 c0                	testb	%al, %al
ffff80000010c144: 78 5c                	js	0xffff80000010c1a2 <kbd_proc_data+0xb2>
ffff80000010c146: f6 c2 40             	testb	$64, %dl
;     } else if (shift & E0ESC) {
ffff80000010c149: 74 07                	je	0xffff80000010c152 <kbd_proc_data+0x62>
;         data |= 0x80;
ffff80000010c14b: 0c 80                	orb	$-128, %al
;         shift &= ~E0ESC;
ffff80000010c14d: 83 e2 bf             	andl	$-65, %edx
ffff80000010c150: 89 11                	movl	%edx, (%rcx)
;     shift |= shiftcode[data];
ffff80000010c152: 0f b6 d0             	movzbl	%al, %edx
ffff80000010c155: 48 b8 50 40 11 00 00 80 ff ff	movabsq	$-140737487224752, %rax # imm = 0xFFFF800000114050
ffff80000010c15f: 0f b6 34 02          	movzbl	(%rdx,%rax), %esi
ffff80000010c163: 0b 31                	orl	(%rcx), %esi
;     shift ^= togglecode[data];
ffff80000010c165: 48 b8 50 41 11 00 00 80 ff ff	movabsq	$-140737487224496, %rax # imm = 0xFFFF800000114150
ffff80000010c16f: 0f b6 04 02          	movzbl	(%rdx,%rax), %eax
ffff80000010c173: 31 f0                	xorl	%esi, %eax
ffff80000010c175: 89 01                	movl	%eax, (%rcx)
;     c = charcode[shift & (CTL | SHIFT)][data];
ffff80000010c177: 89 c1                	movl	%eax, %ecx
ffff80000010c179: 83 e1 03             	andl	$3, %ecx
ffff80000010c17c: 48 be 30 40 11 00 00 80 ff ff	movabsq	$-140737487224784, %rsi # imm = 0xFFFF800000114030
ffff80000010c186: 48 8b 0c ce          	movq	(%rsi,%rcx,8), %rcx
ffff80000010c18a: 44 0f b6 34 11       	movzbl	(%rcx,%rdx), %r14d
;     if (shift & CAPSLOCK) {
ffff80000010c18f: a8 08                	testb	$8, %al
ffff80000010c191: 74 4e                	je	0xffff80000010c1e1 <kbd_proc_data+0xf1>
;         if ('a' <= c && c <= 'z')
ffff80000010c193: 41 8d 4e 9f          	leal	-97(%r14), %ecx
ffff80000010c197: 80 f9 19             	cmpb	$25, %cl
ffff80000010c19a: 77 33                	ja	0xffff80000010c1cf <kbd_proc_data+0xdf>
;             c += 'A' - 'a';
ffff80000010c19c: 41 83 c6 e0          	addl	$-32, %r14d
ffff80000010c1a0: eb 3f                	jmp	0xffff80000010c1e1 <kbd_proc_data+0xf1>
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1a2: 0f b6 f0             	movzbl	%al, %esi
ffff80000010c1a5: 24 7f                	andb	$127, %al
ffff80000010c1a7: f6 c2 40             	testb	$64, %dl
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1aa: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1ad: 0f 45 c6             	cmovnel	%esi, %eax
;         shift &= ~(shiftcode[data] | E0ESC);
ffff80000010c1b0: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1b3: 48 be 50 40 11 00 00 80 ff ff	movabsq	$-140737487224752, %rsi # imm = 0xFFFF800000114050
ffff80000010c1bd: 0f b6 04 30          	movzbl	(%rax,%rsi), %eax
ffff80000010c1c1: f7 d0                	notl	%eax
ffff80000010c1c3: 21 d0                	andl	%edx, %eax
ffff80000010c1c5: 83 e0 bf             	andl	$-65, %eax
ffff80000010c1c8: 89 01                	movl	%eax, (%rcx)
ffff80000010c1ca: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c1cd: eb 4f                	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
;         else if ('A' <= c && c <= 'Z')
ffff80000010c1cf: 41 8d 4e bf          	leal	-65(%r14), %ecx
ffff80000010c1d3: 41 8d 56 20          	leal	32(%r14), %edx
ffff80000010c1d7: 80 f9 1a             	cmpb	$26, %cl
ffff80000010c1da: 41 0f 43 d6          	cmovael	%r14d, %edx
ffff80000010c1de: 41 89 d6             	movl	%edx, %r14d
;     if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
ffff80000010c1e1: f7 d0                	notl	%eax
ffff80000010c1e3: a8 06                	testb	$6, %al
ffff80000010c1e5: 75 37                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c1e7: 41 81 fe e9 00 00 00 	cmpl	$233, %r14d
ffff80000010c1ee: 75 2e                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
;         cprintf("Rebooting!\n");
ffff80000010c1f0: 48 bf 24 4f 11 00 00 80 ff ff	movabsq	$-140737487220956, %rdi # imm = 0xFFFF800000114F24
ffff80000010c1fa: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010c204: 31 c0                	xorl	%eax, %eax
ffff80000010c206: ff d1                	callq	*%rcx
;         outb(0x92, 0x3); /* courtesy of Chris Frost */
ffff80000010c208: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c212: bf 92 00 00 00       	movl	$146, %edi
ffff80000010c217: be 03 00 00 00       	movl	$3, %esi
ffff80000010c21c: ff d0                	callq	*%rax
; }
ffff80000010c21e: 44 89 f0             	movl	%r14d, %eax
ffff80000010c221: 5b                   	popq	%rbx
ffff80000010c222: 41 5e                	popq	%r14
ffff80000010c224: 5d                   	popq	%rbp
ffff80000010c225: c3                   	retq
ffff80000010c226: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c230 <cons_getc>:
; {
ffff80000010c230: 55                   	pushq	%rbp
ffff80000010c231: 48 89 e5             	movq	%rsp, %rbp
;     serial_intr();
ffff80000010c234: 48 b8 00 c0 10 00 00 80 ff ff	movabsq	$-140737487257600, %rax # imm = 0xFFFF80000010C000
ffff80000010c23e: ff d0                	callq	*%rax
;     kbd_intr();
ffff80000010c240: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c24a: ff d0                	callq	*%rax
ffff80000010c24c: 48 b9 04 a0 11 00 00 80 ff ff	movabsq	$-140737487200252, %rcx # imm = 0xFFFF80000011A004
;     if (cons.rpos != cons.wpos) {
ffff80000010c256: 8b 91 00 02 00 00    	movl	512(%rcx), %edx
ffff80000010c25c: 31 c0                	xorl	%eax, %eax
ffff80000010c25e: 3b 91 04 02 00 00    	cmpl	516(%rcx), %edx
ffff80000010c264: 74 1e                	je	0xffff80000010c284 <cons_getc+0x54>
;         c = cons.buf[cons.rpos++];
ffff80000010c266: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c269: 89 b1 00 02 00 00    	movl	%esi, 512(%rcx)
ffff80000010c26f: 0f b6 04 0a          	movzbl	(%rdx,%rcx), %eax
ffff80000010c273: 31 d2                	xorl	%edx, %edx
;         if (cons.rpos == CONSBUFSIZE)
ffff80000010c275: 81 fe 00 02 00 00    	cmpl	$512, %esi              # imm = 0x200
ffff80000010c27b: 0f 45 d6             	cmovnel	%esi, %edx
ffff80000010c27e: 89 91 00 02 00 00    	movl	%edx, 512(%rcx)
; }
ffff80000010c284: 5d                   	popq	%rbp
ffff80000010c285: c3                   	retq
ffff80000010c286: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c290 <cons_init>:
; {
ffff80000010c290: 55                   	pushq	%rbp
ffff80000010c291: 48 89 e5             	movq	%rsp, %rbp
;     cga_init();
ffff80000010c294: 48 b8 f0 c2 10 00 00 80 ff ff	movabsq	$-140737487256848, %rax # imm = 0xFFFF80000010C2F0
ffff80000010c29e: ff d0                	callq	*%rax
;     kbd_init();
ffff80000010c2a0: 48 b8 c0 c3 10 00 00 80 ff ff	movabsq	$-140737487256640, %rax # imm = 0xFFFF80000010C3C0
ffff80000010c2aa: ff d0                	callq	*%rax
;     serial_init();
ffff80000010c2ac: 48 b8 f0 c3 10 00 00 80 ff ff	movabsq	$-140737487256592, %rax # imm = 0xFFFF80000010C3F0
ffff80000010c2b6: ff d0                	callq	*%rax
;     if (!serial_exists)
ffff80000010c2b8: 48 b8 00 a0 11 00 00 80 ff ff	movabsq	$-140737487200256, %rax # imm = 0xFFFF80000011A000
ffff80000010c2c2: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c2c5: 74 02                	je	0xffff80000010c2c9 <cons_init+0x39>
; }
ffff80000010c2c7: 5d                   	popq	%rbp
ffff80000010c2c8: c3                   	retq
;         cprintf("Serial port does not exist!\n");
ffff80000010c2c9: 48 bf 73 56 11 00 00 80 ff ff	movabsq	$-140737487219085, %rdi # imm = 0xFFFF800000115673
ffff80000010c2d3: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010c2dd: 31 c0                	xorl	%eax, %eax
ffff80000010c2df: ff d1                	callq	*%rcx
; }
ffff80000010c2e1: 5d                   	popq	%rbp
ffff80000010c2e2: c3                   	retq
ffff80000010c2e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c2ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c2f0 <cga_init>:
; {
ffff80000010c2f0: 55                   	pushq	%rbp
ffff80000010c2f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c2f4: 41 57                	pushq	%r15
ffff80000010c2f6: 41 56                	pushq	%r14
ffff80000010c2f8: 41 55                	pushq	%r13
ffff80000010c2fa: 41 54                	pushq	%r12
ffff80000010c2fc: 53                   	pushq	%rbx
ffff80000010c2fd: 50                   	pushq	%rax
ffff80000010c2fe: 49 bd 00 80 0b 00 00 80 ff ff	movabsq	$-140737487601664, %r13 # imm = 0xFFFF8000000B8000
;     was = *cp;
ffff80000010c308: 41 0f b7 45 00       	movzwl	(%r13), %eax
;     *cp = (uint16_t) 0xA55A;
ffff80000010c30d: 66 41 c7 45 00 5a a5 	movw	$42330, (%r13)          # imm = 0xA55A
;     if (*cp != 0xA55A) {
ffff80000010c314: 41 0f b7 4d 00       	movzwl	(%r13), %ecx
ffff80000010c319: 81 f9 5a a5 00 00    	cmpl	$42330, %ecx            # imm = 0xA55A
ffff80000010c31f: 75 0c                	jne	0xffff80000010c32d <cga_init+0x3d>
;         *cp = was;
ffff80000010c321: 66 41 89 45 00       	movw	%ax, (%r13)
ffff80000010c326: bf d4 03 00 00       	movl	$980, %edi              # imm = 0x3D4
ffff80000010c32b: eb 0c                	jmp	0xffff80000010c339 <cga_init+0x49>
ffff80000010c32d: 49 81 c5 00 80 ff ff 	addq	$-32768, %r13           # imm = 0x8000
ffff80000010c334: bf b4 03 00 00       	movl	$948, %edi              # imm = 0x3B4
ffff80000010c339: 49 be 10 a2 11 00 00 80 ff ff	movabsq	$-140737487199728, %r14 # imm = 0xFFFF80000011A210
ffff80000010c343: 41 89 3e             	movl	%edi, (%r14)
;     outb(addr_6845, 14);
ffff80000010c346: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c350: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c355: 41 ff d7             	callq	*%r15
;     pos = inb(addr_6845 + 1) << 8;
ffff80000010c358: 41 8b 06             	movl	(%r14), %eax
ffff80000010c35b: 83 c0 01             	addl	$1, %eax
ffff80000010c35e: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c361: 49 bc 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r12 # imm = 0xFFFF80000010C510
ffff80000010c36b: 41 ff d4             	callq	*%r12
ffff80000010c36e: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010c371: c1 e3 08             	shll	$8, %ebx
;     outb(addr_6845, 15);
ffff80000010c374: 41 0f b7 3e          	movzwl	(%r14), %edi
ffff80000010c378: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c37d: 41 ff d7             	callq	*%r15
;     pos |= inb(addr_6845 + 1);
ffff80000010c380: 41 8b 06             	movl	(%r14), %eax
ffff80000010c383: 83 c0 01             	addl	$1, %eax
ffff80000010c386: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c389: 41 ff d4             	callq	*%r12
ffff80000010c38c: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c38f: 09 d8                	orl	%ebx, %eax
;     crt_buf = (uint16_t*) cp;
ffff80000010c391: 48 b9 18 a2 11 00 00 80 ff ff	movabsq	$-140737487199720, %rcx # imm = 0xFFFF80000011A218
ffff80000010c39b: 4c 89 29             	movq	%r13, (%rcx)
;     crt_pos = pos;
ffff80000010c39e: 48 b9 20 a2 11 00 00 80 ff ff	movabsq	$-140737487199712, %rcx # imm = 0xFFFF80000011A220
ffff80000010c3a8: 66 89 01             	movw	%ax, (%rcx)
; }
ffff80000010c3ab: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c3af: 5b                   	popq	%rbx
ffff80000010c3b0: 41 5c                	popq	%r12
ffff80000010c3b2: 41 5d                	popq	%r13
ffff80000010c3b4: 41 5e                	popq	%r14
ffff80000010c3b6: 41 5f                	popq	%r15
ffff80000010c3b8: 5d                   	popq	%rbp
ffff80000010c3b9: c3                   	retq
ffff80000010c3ba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c3c0 <kbd_init>:
; {
ffff80000010c3c0: 55                   	pushq	%rbp
ffff80000010c3c1: 48 89 e5             	movq	%rsp, %rbp
;     kbd_intr();
ffff80000010c3c4: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c3ce: ff d0                	callq	*%rax
;     pic_enable_irq(1);
ffff80000010c3d0: 48 b8 60 d2 10 00 00 80 ff ff	movabsq	$-140737487252896, %rax # imm = 0xFFFF80000010D260
ffff80000010c3da: bf 01 00 00 00       	movl	$1, %edi
ffff80000010c3df: ff d0                	callq	*%rax
; }
ffff80000010c3e1: 5d                   	popq	%rbp
ffff80000010c3e2: c3                   	retq
ffff80000010c3e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c3ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c3f0 <serial_init>:
; {
ffff80000010c3f0: 55                   	pushq	%rbp
ffff80000010c3f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c3f4: 53                   	pushq	%rbx
ffff80000010c3f5: 50                   	pushq	%rax
;     outb(COM1+COM_FCR, 0);
ffff80000010c3f6: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c400: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c405: 31 f6                	xorl	%esi, %esi
ffff80000010c407: ff d3                	callq	*%rbx
;     outb(COM1+COM_LCR, COM_LCR_DLAB);
ffff80000010c409: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c40e: be 80 00 00 00       	movl	$128, %esi
ffff80000010c413: ff d3                	callq	*%rbx
;     outb(COM1+COM_DLL, (uint8_t) (115200 / 9600));
ffff80000010c415: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c41a: be 0c 00 00 00       	movl	$12, %esi
ffff80000010c41f: ff d3                	callq	*%rbx
;     outb(COM1+COM_DLM, 0);
ffff80000010c421: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c426: 31 f6                	xorl	%esi, %esi
ffff80000010c428: ff d3                	callq	*%rbx
;     outb(COM1+COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
ffff80000010c42a: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c42f: be 03 00 00 00       	movl	$3, %esi
ffff80000010c434: ff d3                	callq	*%rbx
;     outb(COM1+COM_MCR, 0);
ffff80000010c436: bf fc 03 00 00       	movl	$1020, %edi             # imm = 0x3FC
ffff80000010c43b: 31 f6                	xorl	%esi, %esi
ffff80000010c43d: ff d3                	callq	*%rbx
;     outb(COM1+COM_IER, COM_IER_RDI);
ffff80000010c43f: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c444: be 01 00 00 00       	movl	$1, %esi
ffff80000010c449: ff d3                	callq	*%rbx
;     serial_exists = (inb(COM1+COM_LSR) != 0xFF);
ffff80000010c44b: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c455: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c45a: ff d3                	callq	*%rbx
ffff80000010c45c: 3c ff                	cmpb	$-1, %al
ffff80000010c45e: 48 b8 00 a0 11 00 00 80 ff ff	movabsq	$-140737487200256, %rax # imm = 0xFFFF80000011A000
ffff80000010c468: 0f 95 00             	setne	(%rax)
;     (void) inb(COM1+COM_IIR);
ffff80000010c46b: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c470: ff d3                	callq	*%rbx
;     (void) inb(COM1+COM_RX);
ffff80000010c472: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c477: ff d3                	callq	*%rbx
; }
ffff80000010c479: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c47d: 5b                   	popq	%rbx
ffff80000010c47e: 5d                   	popq	%rbp
ffff80000010c47f: c3                   	retq

ffff80000010c480 <cputchar>:
; {
ffff80000010c480: 55                   	pushq	%rbp
ffff80000010c481: 48 89 e5             	movq	%rsp, %rbp
;     cons_putc(c);
ffff80000010c484: 48 b8 a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rax # imm = 0xFFFF80000010C4A0
ffff80000010c48e: ff d0                	callq	*%rax
; }
ffff80000010c490: 5d                   	popq	%rbp
ffff80000010c491: c3                   	retq
ffff80000010c492: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c49c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c4a0 <cons_putc>:
; {
ffff80000010c4a0: 55                   	pushq	%rbp
ffff80000010c4a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4a4: 53                   	pushq	%rbx
ffff80000010c4a5: 50                   	pushq	%rax
ffff80000010c4a6: 89 fb                	movl	%edi, %ebx
;     serial_putc(c);
ffff80000010c4a8: 48 b8 30 c5 10 00 00 80 ff ff	movabsq	$-140737487256272, %rax # imm = 0xFFFF80000010C530
ffff80000010c4b2: ff d0                	callq	*%rax
;     lpt_putc(c);
ffff80000010c4b4: 48 b8 a0 c5 10 00 00 80 ff ff	movabsq	$-140737487256160, %rax # imm = 0xFFFF80000010C5A0
ffff80000010c4be: 89 df                	movl	%ebx, %edi
ffff80000010c4c0: ff d0                	callq	*%rax
;     cga_putc(c);
ffff80000010c4c2: 48 b8 30 c6 10 00 00 80 ff ff	movabsq	$-140737487256016, %rax # imm = 0xFFFF80000010C630
ffff80000010c4cc: 89 df                	movl	%ebx, %edi
ffff80000010c4ce: ff d0                	callq	*%rax
; }
ffff80000010c4d0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4d4: 5b                   	popq	%rbx
ffff80000010c4d5: 5d                   	popq	%rbp
ffff80000010c4d6: c3                   	retq
ffff80000010c4d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010c4e0 <getchar>:
; {
ffff80000010c4e0: 55                   	pushq	%rbp
ffff80000010c4e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4e4: 53                   	pushq	%rbx
ffff80000010c4e5: 50                   	pushq	%rax
ffff80000010c4e6: 48 bb 30 c2 10 00 00 80 ff ff	movabsq	$-140737487257040, %rbx # imm = 0xFFFF80000010C230
;     while ((c = cons_getc()) == 0)
ffff80000010c4f0: ff d3                	callq	*%rbx
ffff80000010c4f2: 85 c0                	testl	%eax, %eax
ffff80000010c4f4: 74 fa                	je	0xffff80000010c4f0 <getchar+0x10>
;     return c;
ffff80000010c4f6: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4fa: 5b                   	popq	%rbx
ffff80000010c4fb: 5d                   	popq	%rbp
ffff80000010c4fc: c3                   	retq
ffff80000010c4fd: 0f 1f 00             	nopl	(%rax)

ffff80000010c500 <iscons>:
; {
ffff80000010c500: 55                   	pushq	%rbp
ffff80000010c501: 48 89 e5             	movq	%rsp, %rbp
;     return 1;
ffff80000010c504: b8 01 00 00 00       	movl	$1, %eax
ffff80000010c509: 5d                   	popq	%rbp
ffff80000010c50a: c3                   	retq
ffff80000010c50b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c510 <inb>:
; {
ffff80000010c510: 55                   	pushq	%rbp
ffff80000010c511: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010c514: 89 fa                	movl	%edi, %edx
ffff80000010c516: ec                   	inb	%dx, %al
; 	return data;
ffff80000010c517: 5d                   	popq	%rbp
ffff80000010c518: c3                   	retq
ffff80000010c519: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010c520 <outb>:
; {
ffff80000010c520: 55                   	pushq	%rbp
ffff80000010c521: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c524: 89 f0                	movl	%esi, %eax
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010c526: 89 fa                	movl	%edi, %edx
ffff80000010c528: ee                   	outb	%al, %dx
; }
ffff80000010c529: 5d                   	popq	%rbp
ffff80000010c52a: c3                   	retq
ffff80000010c52b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c530 <serial_putc>:
; {
ffff80000010c530: 55                   	pushq	%rbp
ffff80000010c531: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c534: 41 57                	pushq	%r15
ffff80000010c536: 41 56                	pushq	%r14
ffff80000010c538: 41 54                	pushq	%r12
ffff80000010c53a: 53                   	pushq	%rbx
ffff80000010c53b: 41 89 fe             	movl	%edi, %r14d
;          !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
ffff80000010c53e: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c548: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c54d: 41 ff d7             	callq	*%r15
ffff80000010c550: a8 20                	testb	$32, %al
;     for (i = 0;
ffff80000010c552: 75 28                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c554: 31 db                	xorl	%ebx, %ebx
ffff80000010c556: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
;         delay();
ffff80000010c560: 41 ff d4             	callq	*%r12
;          !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
ffff80000010c563: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c568: 41 ff d7             	callq	*%r15
ffff80000010c56b: a8 20                	testb	$32, %al
;     for (i = 0;
ffff80000010c56d: 75 0d                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c56f: 8d 43 01             	leal	1(%rbx), %eax
;     for (i = 0;
ffff80000010c572: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c578: 89 c3                	movl	%eax, %ebx
ffff80000010c57a: 72 e4                	jb	0xffff80000010c560 <serial_putc+0x30>
;     outb(COM1 + COM_TX, c);
ffff80000010c57c: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c580: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c58a: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c58f: ff d0                	callq	*%rax
; }
ffff80000010c591: 5b                   	popq	%rbx
ffff80000010c592: 41 5c                	popq	%r12
ffff80000010c594: 41 5e                	popq	%r14
ffff80000010c596: 41 5f                	popq	%r15
ffff80000010c598: 5d                   	popq	%rbp
ffff80000010c599: c3                   	retq
ffff80000010c59a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c5a0 <lpt_putc>:
; {
ffff80000010c5a0: 55                   	pushq	%rbp
ffff80000010c5a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c5a4: 41 57                	pushq	%r15
ffff80000010c5a6: 41 56                	pushq	%r14
ffff80000010c5a8: 41 54                	pushq	%r12
ffff80000010c5aa: 53                   	pushq	%rbx
ffff80000010c5ab: 41 89 fe             	movl	%edi, %r14d
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5ae: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c5b8: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5bd: 41 ff d7             	callq	*%r15
ffff80000010c5c0: 84 c0                	testb	%al, %al
ffff80000010c5c2: 78 28                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5c4: 31 db                	xorl	%ebx, %ebx
ffff80000010c5c6: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
;         delay();
ffff80000010c5d0: 41 ff d4             	callq	*%r12
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5d3: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5d8: 41 ff d7             	callq	*%r15
ffff80000010c5db: 84 c0                	testb	%al, %al
ffff80000010c5dd: 78 0d                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5df: 8d 43 01             	leal	1(%rbx), %eax
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5e2: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c5e8: 89 c3                	movl	%eax, %ebx
ffff80000010c5ea: 72 e4                	jb	0xffff80000010c5d0 <lpt_putc+0x30>
;     outb(0x378+0, c);
ffff80000010c5ec: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c5f0: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c5fa: bf 78 03 00 00       	movl	$888, %edi              # imm = 0x378
ffff80000010c5ff: ff d3                	callq	*%rbx
;     outb(0x378+2, 0x08|0x04|0x01);
ffff80000010c601: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c606: be 0d 00 00 00       	movl	$13, %esi
ffff80000010c60b: ff d3                	callq	*%rbx
;     outb(0x378+2, 0x08);
ffff80000010c60d: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c612: be 08 00 00 00       	movl	$8, %esi
ffff80000010c617: ff d3                	callq	*%rbx
; }
ffff80000010c619: 5b                   	popq	%rbx
ffff80000010c61a: 41 5c                	popq	%r12
ffff80000010c61c: 41 5e                	popq	%r14
ffff80000010c61e: 41 5f                	popq	%r15
ffff80000010c620: 5d                   	popq	%rbp
ffff80000010c621: c3                   	retq
ffff80000010c622: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c62c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c630 <cga_putc>:
; {
ffff80000010c630: 55                   	pushq	%rbp
ffff80000010c631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c634: 41 57                	pushq	%r15
ffff80000010c636: 41 56                	pushq	%r14
ffff80000010c638: 53                   	pushq	%rbx
ffff80000010c639: 50                   	pushq	%rax
ffff80000010c63a: 89 f8                	movl	%edi, %eax
ffff80000010c63c: 0d 00 07 00 00       	orl	$1792, %eax             # imm = 0x700
;     if (!(c & ~0xFF))
ffff80000010c641: 81 ff 00 01 00 00    	cmpl	$256, %edi              # imm = 0x100
ffff80000010c647: 0f 43 c7             	cmovael	%edi, %eax
;     switch (c & 0xff) {
ffff80000010c64a: 8d 48 f8             	leal	-8(%rax), %ecx
ffff80000010c64d: 49 be 20 a2 11 00 00 80 ff ff	movabsq	$-140737487199712, %r14 # imm = 0xFFFF80000011A220
ffff80000010c657: 80 f9 05             	cmpb	$5, %cl
ffff80000010c65a: 0f 87 8f 00 00 00    	ja	0xffff80000010c6ef <cga_putc+0xbf>
ffff80000010c660: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010c663: 48 ba 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rdx # imm = 0xFFFF800000114000
ffff80000010c66d: ff 24 ca             	jmpq	*(%rdx,%rcx,8)
;         if (crt_pos > 0) {
ffff80000010c670: 41 0f b7 0e          	movzwl	(%r14), %ecx
ffff80000010c674: 66 85 c9             	testw	%cx, %cx
ffff80000010c677: 0f 84 8e 00 00 00    	je	0xffff80000010c70b <cga_putc+0xdb>
;             crt_pos--;
ffff80000010c67d: 83 c1 ff             	addl	$-1, %ecx
ffff80000010c680: 66 41 89 0e          	movw	%cx, (%r14)
;             crt_buf[crt_pos] = (c & ~0xff) | ' ';
ffff80000010c684: 25 00 ff ff ff       	andl	$4294967040, %eax       # imm = 0xFFFFFF00
ffff80000010c689: 83 c8 20             	orl	$32, %eax
ffff80000010c68c: 48 ba 18 a2 11 00 00 80 ff ff	movabsq	$-140737487199720, %rdx # imm = 0xFFFF80000011A218
ffff80000010c696: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010c699: 0f b7 c9             	movzwl	%cx, %ecx
ffff80000010c69c: 66 89 04 4a          	movw	%ax, (%rdx,%rcx,2)
ffff80000010c6a0: eb 69                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         cons_putc(' ');
ffff80000010c6a2: 48 bb a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rbx # imm = 0xFFFF80000010C4A0
ffff80000010c6ac: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b1: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6b3: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b8: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6ba: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6bf: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6c1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6c6: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6c8: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6cd: ff d3                	callq	*%rbx
ffff80000010c6cf: eb 3a                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         crt_pos += CRT_COLS;
ffff80000010c6d1: 66 41 83 06 50       	addw	$80, (%r14)
;         crt_pos -= (crt_pos % CRT_COLS);
ffff80000010c6d6: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c6da: 69 c0 cd cc 00 00    	imull	$52429, %eax, %eax      # imm = 0xCCCD
ffff80000010c6e0: c1 e8 12             	shrl	$18, %eax
ffff80000010c6e3: 83 e0 f0             	andl	$-16, %eax
ffff80000010c6e6: 8d 04 80             	leal	(%rax,%rax,4), %eax
ffff80000010c6e9: 66 41 89 06          	movw	%ax, (%r14)
ffff80000010c6ed: eb 1c                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         crt_buf[crt_pos++] = c;     /* write the character */
ffff80000010c6ef: 48 b9 18 a2 11 00 00 80 ff ff	movabsq	$-140737487199720, %rcx # imm = 0xFFFF80000011A218
ffff80000010c6f9: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010c6fc: 41 0f b7 16          	movzwl	(%r14), %edx
ffff80000010c700: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c703: 66 41 89 36          	movw	%si, (%r14)
ffff80000010c707: 66 89 04 51          	movw	%ax, (%rcx,%rdx,2)
;     if (crt_pos >= CRT_SIZE) {
ffff80000010c70b: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c70f: 3d d0 07 00 00       	cmpl	$2000, %eax             # imm = 0x7D0
ffff80000010c714: 72 43                	jb	0xffff80000010c759 <cga_putc+0x129>
;         memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
ffff80000010c716: 48 bb 18 a2 11 00 00 80 ff ff	movabsq	$-140737487199720, %rbx # imm = 0xFFFF80000011A218
ffff80000010c720: 48 8b 3b             	movq	(%rbx), %rdi
ffff80000010c723: 48 8d b7 a0 00 00 00 	leaq	160(%rdi), %rsi
ffff80000010c72a: 48 b8 f0 03 11 00 00 80 ff ff	movabsq	$-140737487240208, %rax # imm = 0xFFFF8000001103F0
ffff80000010c734: ba 00 0f 00 00       	movl	$3840, %edx             # imm = 0xF00
ffff80000010c739: ff d0                	callq	*%rax
ffff80000010c73b: 48 8b 03             	movq	(%rbx), %rax
ffff80000010c73e: 31 c9                	xorl	%ecx, %ecx
;             crt_buf[i] = 0x0700 | ' ';
ffff80000010c740: 66 c7 84 48 00 0f 00 00 20 07	movw	$1824, 3840(%rax,%rcx,2) # imm = 0x720
;         for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
ffff80000010c74a: 48 83 c1 01          	addq	$1, %rcx
ffff80000010c74e: 48 83 f9 50          	cmpq	$80, %rcx
ffff80000010c752: 75 ec                	jne	0xffff80000010c740 <cga_putc+0x110>
;         crt_pos -= CRT_COLS;
ffff80000010c754: 66 41 83 06 b0       	addw	$-80, (%r14)
;     outb(addr_6845, 14);
ffff80000010c759: 48 bb 10 a2 11 00 00 80 ff ff	movabsq	$-140737487199728, %rbx # imm = 0xFFFF80000011A210
ffff80000010c763: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c766: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c770: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c775: 41 ff d7             	callq	*%r15
;     outb(addr_6845 + 1, crt_pos >> 8);
ffff80000010c778: 8b 03                	movl	(%rbx), %eax
ffff80000010c77a: 83 c0 01             	addl	$1, %eax
ffff80000010c77d: 41 0f b6 76 01       	movzbl	1(%r14), %esi
ffff80000010c782: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c785: 41 ff d7             	callq	*%r15
;     outb(addr_6845, 15);
ffff80000010c788: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c78b: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c790: 41 ff d7             	callq	*%r15
;     outb(addr_6845 + 1, crt_pos);
ffff80000010c793: 8b 03                	movl	(%rbx), %eax
ffff80000010c795: 83 c0 01             	addl	$1, %eax
ffff80000010c798: 41 0f b6 36          	movzbl	(%r14), %esi
ffff80000010c79c: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c79f: 41 ff d7             	callq	*%r15
; }
ffff80000010c7a2: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c7a6: 5b                   	popq	%rbx
ffff80000010c7a7: 41 5e                	popq	%r14
ffff80000010c7a9: 41 5f                	popq	%r15
ffff80000010c7ab: 5d                   	popq	%rbp
ffff80000010c7ac: c3                   	retq
ffff80000010c7ad: 0f 1f 00             	nopl	(%rax)

ffff80000010c7b0 <delay>:
; {
ffff80000010c7b0: 55                   	pushq	%rbp
ffff80000010c7b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7b4: 53                   	pushq	%rbx
ffff80000010c7b5: 50                   	pushq	%rax
;     inb(0x84);
ffff80000010c7b6: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c7c0: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7c5: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7c7: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7cc: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7ce: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7d3: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7d5: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7da: ff d3                	callq	*%rbx
; }
ffff80000010c7dc: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c7e0: 5b                   	popq	%rbx
ffff80000010c7e1: 5d                   	popq	%rbp
ffff80000010c7e2: c3                   	retq
ffff80000010c7e3: cc                   	int3
ffff80000010c7e4: cc                   	int3
ffff80000010c7e5: cc                   	int3
ffff80000010c7e6: cc                   	int3
ffff80000010c7e7: cc                   	int3
ffff80000010c7e8: cc                   	int3
ffff80000010c7e9: cc                   	int3
ffff80000010c7ea: cc                   	int3
ffff80000010c7eb: cc                   	int3
ffff80000010c7ec: cc                   	int3
ffff80000010c7ed: cc                   	int3
ffff80000010c7ee: cc                   	int3
ffff80000010c7ef: cc                   	int3

ffff80000010c7f0 <kmain>:
; {
ffff80000010c7f0: 55                   	pushq	%rbp
ffff80000010c7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7f4: 53                   	pushq	%rbx
ffff80000010c7f5: 50                   	pushq	%rax
ffff80000010c7f6: 48 89 fb             	movq	%rdi, %rbx
; 	memset(edata, 0, end - edata);
ffff80000010c7f9: 48 bf 00 93 11 00 00 80 ff ff	movabsq	$-140737487203584, %rdi # imm = 0xFFFF800000119300
ffff80000010c803: 48 ba 00 a7 11 00 00 80 ff ff	movabsq	$-140737487198464, %rdx # imm = 0xFFFF80000011A700
ffff80000010c80d: 48 29 fa             	subq	%rdi, %rdx
ffff80000010c810: 48 b8 a0 03 11 00 00 80 ff ff	movabsq	$-140737487240288, %rax # imm = 0xFFFF8000001103A0
ffff80000010c81a: 31 f6                	xorl	%esi, %esi
ffff80000010c81c: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010c81e: 48 b8 90 c2 10 00 00 80 ff ff	movabsq	$-140737487256944, %rax # imm = 0xFFFF80000010C290
ffff80000010c828: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c82a: 48 bf ae 55 11 00 00 80 ff ff	movabsq	$-140737487219282, %rdi # imm = 0xFFFF8000001155AE
ffff80000010c834: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010c83e: 31 c0                	xorl	%eax, %eax
ffff80000010c840: ff d1                	callq	*%rcx
; 	mem_init(boot_info);
ffff80000010c842: 48 b8 30 e1 10 00 00 80 ff ff	movabsq	$-140737487249104, %rax # imm = 0xFFFF80000010E130
ffff80000010c84c: 48 89 df             	movq	%rbx, %rdi
ffff80000010c84f: ff d0                	callq	*%rax
ffff80000010c851: 48 bb 90 ce 10 00 00 80 ff ff	movabsq	$-140737487253872, %rbx # imm = 0xFFFF80000010CE90
ffff80000010c85b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		monitor(NULL);
ffff80000010c860: 31 ff                	xorl	%edi, %edi
ffff80000010c862: ff d3                	callq	*%rbx
; 	while (1)
ffff80000010c864: eb fa                	jmp	0xffff80000010c860 <kmain+0x70>
ffff80000010c866: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c870 <_panic>:
; {
ffff80000010c870: 55                   	pushq	%rbp
ffff80000010c871: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c874: 41 56                	pushq	%r14
ffff80000010c876: 53                   	pushq	%rbx
ffff80000010c877: 48 83 ec 50          	subq	$80, %rsp
ffff80000010c87b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010c87f: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010c883: 4c 89 4d c8          	movq	%r9, -56(%rbp)
; 	if (panicstr)
ffff80000010c887: 48 b8 28 a2 11 00 00 80 ff ff	movabsq	$-140737487199704, %rax # imm = 0xFFFF80000011A228
ffff80000010c891: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000010c895: 75 66                	jne	0xffff80000010c8fd <_panic+0x8d>
ffff80000010c897: 48 89 d3             	movq	%rdx, %rbx
ffff80000010c89a: 89 f2                	movl	%esi, %edx
ffff80000010c89c: 48 89 fe             	movq	%rdi, %rsi
; 	panicstr = fmt;
ffff80000010c89f: 48 89 18             	movq	%rbx, (%rax)
; 	__asm __volatile("cli; cld");
ffff80000010c8a2: fa                   	cli
ffff80000010c8a3: fc                   	cld
ffff80000010c8a4: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010c8a8: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c8ac: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c8b0: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c8b4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010c8be: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	cprintf("kernel panic at %s:%d: ", file, line);
ffff80000010c8c2: 48 bf f7 4c 11 00 00 80 ff ff	movabsq	$-140737487221513, %rdi # imm = 0xFFFF800000114CF7
ffff80000010c8cc: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff80000010c8d6: 31 c0                	xorl	%eax, %eax
ffff80000010c8d8: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c8db: 48 b8 a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rax # imm = 0xFFFF80000010D3A0
ffff80000010c8e5: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c8e9: 48 89 df             	movq	%rbx, %rdi
ffff80000010c8ec: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c8ee: 48 bf ae 55 11 00 00 80 ff ff	movabsq	$-140737487219282, %rdi # imm = 0xFFFF8000001155AE
ffff80000010c8f8: 31 c0                	xorl	%eax, %eax
ffff80000010c8fa: 41 ff d6             	callq	*%r14
ffff80000010c8fd: 48 bb 90 ce 10 00 00 80 ff ff	movabsq	$-140737487253872, %rbx # imm = 0xFFFF80000010CE90
ffff80000010c907: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		monitor(NULL);
ffff80000010c910: 31 ff                	xorl	%edi, %edi
ffff80000010c912: ff d3                	callq	*%rbx
; 	while (1)
ffff80000010c914: eb fa                	jmp	0xffff80000010c910 <_panic+0xa0>
ffff80000010c916: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c920 <_warn>:
; {
ffff80000010c920: 55                   	pushq	%rbp
ffff80000010c921: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c924: 41 56                	pushq	%r14
ffff80000010c926: 53                   	pushq	%rbx
ffff80000010c927: 48 83 ec 50          	subq	$80, %rsp
ffff80000010c92b: 48 89 d3             	movq	%rdx, %rbx
ffff80000010c92e: 89 f2                	movl	%esi, %edx
ffff80000010c930: 48 89 fe             	movq	%rdi, %rsi
ffff80000010c933: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010c937: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010c93b: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010c93f: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010c943: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c947: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c94b: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c94f: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010c959: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	cprintf("kernel warning at %s:%d: ", file, line);
ffff80000010c95d: 48 bf b0 55 11 00 00 80 ff ff	movabsq	$-140737487219280, %rdi # imm = 0xFFFF8000001155B0
ffff80000010c967: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff80000010c971: 31 c0                	xorl	%eax, %eax
ffff80000010c973: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c976: 48 b8 a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rax # imm = 0xFFFF80000010D3A0
ffff80000010c980: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c984: 48 89 df             	movq	%rbx, %rdi
ffff80000010c987: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c989: 48 bf ae 55 11 00 00 80 ff ff	movabsq	$-140737487219282, %rdi # imm = 0xFFFF8000001155AE
ffff80000010c993: 31 c0                	xorl	%eax, %eax
ffff80000010c995: 41 ff d6             	callq	*%r14
; }
ffff80000010c998: 48 83 c4 50          	addq	$80, %rsp
ffff80000010c99c: 5b                   	popq	%rbx
ffff80000010c99d: 41 5e                	popq	%r14
ffff80000010c99f: 5d                   	popq	%rbp
ffff80000010c9a0: c3                   	retq
ffff80000010c9a1: cc                   	int3
ffff80000010c9a2: cc                   	int3
ffff80000010c9a3: cc                   	int3
ffff80000010c9a4: cc                   	int3
ffff80000010c9a5: cc                   	int3
ffff80000010c9a6: cc                   	int3
ffff80000010c9a7: cc                   	int3
ffff80000010c9a8: cc                   	int3
ffff80000010c9a9: cc                   	int3
ffff80000010c9aa: cc                   	int3
ffff80000010c9ab: cc                   	int3
ffff80000010c9ac: cc                   	int3
ffff80000010c9ad: cc                   	int3
ffff80000010c9ae: cc                   	int3
ffff80000010c9af: cc                   	int3

ffff80000010c9b0 <mon_help>:
; {
ffff80000010c9b0: 55                   	pushq	%rbp
ffff80000010c9b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c9b4: 41 57                	pushq	%r15
ffff80000010c9b6: 41 56                	pushq	%r14
ffff80000010c9b8: 41 54                	pushq	%r12
ffff80000010c9ba: 53                   	pushq	%rbx
ffff80000010c9bb: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010c9c0: 49 bf 50 42 11 00 00 80 ff ff	movabsq	$-140737487224240, %r15 # imm = 0xFFFF800000114250
ffff80000010c9ca: 49 be e9 55 11 00 00 80 ff ff	movabsq	$-140737487219223, %r14 # imm = 0xFFFF8000001155E9
ffff80000010c9d4: 49 bc 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r12 # imm = 0xFFFF80000010D400
ffff80000010c9de: 66 90                	nop
; 		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffff80000010c9e0: 4a 8b 74 3b f8       	movq	-8(%rbx,%r15), %rsi
ffff80000010c9e5: 4a 8b 14 3b          	movq	(%rbx,%r15), %rdx
ffff80000010c9e9: 4c 89 f7             	movq	%r14, %rdi
ffff80000010c9ec: 31 c0                	xorl	%eax, %eax
ffff80000010c9ee: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < NCOMMANDS; i++)
ffff80000010c9f1: 48 83 c3 18          	addq	$24, %rbx
ffff80000010c9f5: 48 81 fb 98 00 00 00 	cmpq	$152, %rbx
ffff80000010c9fc: 75 e2                	jne	0xffff80000010c9e0 <mon_help+0x30>
; 	return 0;
ffff80000010c9fe: 31 c0                	xorl	%eax, %eax
ffff80000010ca00: 5b                   	popq	%rbx
ffff80000010ca01: 41 5c                	popq	%r12
ffff80000010ca03: 41 5e                	popq	%r14
ffff80000010ca05: 41 5f                	popq	%r15
ffff80000010ca07: 5d                   	popq	%rbp
ffff80000010ca08: c3                   	retq
ffff80000010ca09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ca10 <mon_kerninfo>:
; {
ffff80000010ca10: 55                   	pushq	%rbp
ffff80000010ca11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ca14: 41 57                	pushq	%r15
ffff80000010ca16: 41 56                	pushq	%r14
ffff80000010ca18: 41 54                	pushq	%r12
ffff80000010ca1a: 53                   	pushq	%rbx
; 	cprintf("Special kernel symbols:\n");
ffff80000010ca1b: 48 bf e1 50 11 00 00 80 ff ff	movabsq	$-140737487220511, %rdi # imm = 0xFFFF8000001150E1
ffff80000010ca25: 49 bc 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r12 # imm = 0xFFFF80000010D400
ffff80000010ca2f: 31 c0                	xorl	%eax, %eax
ffff80000010ca31: 41 ff d4             	callq	*%r12
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010ca34: 48 bf 30 57 11 00 00 80 ff ff	movabsq	$-140737487218896, %rdi # imm = 0xFFFF800000115730
ffff80000010ca3e: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ca48: 31 c0                	xorl	%eax, %eax
ffff80000010ca4a: 41 ff d4             	callq	*%r12
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010ca4d: 48 bf c8 4a 11 00 00 80 ff ff	movabsq	$-140737487222072, %rdi # imm = 0xFFFF800000114AC8
ffff80000010ca57: 49 bf 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r15 # imm = 0x800000000000
ffff80000010ca61: 49 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %r14 # imm = 0xFFFF800000100000
ffff80000010ca6b: 4b 8d 14 3e          	leaq	(%r14,%r15), %rdx
ffff80000010ca6f: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ca72: 31 c0                	xorl	%eax, %eax
ffff80000010ca74: 41 ff d4             	callq	*%r12
; 	cprintf("  etext  %016p (virt)  %016p (phys)\n", etext, etext - KERNEL_VMA);
ffff80000010ca77: 48 bf 11 4e 11 00 00 80 ff ff	movabsq	$-140737487221231, %rdi # imm = 0xFFFF800000114E11
ffff80000010ca81: 48 be 83 3b 11 00 00 80 ff ff	movabsq	$-140737487225981, %rsi # imm = 0xFFFF800000113B83
ffff80000010ca8b: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010ca8f: 31 c0                	xorl	%eax, %eax
ffff80000010ca91: 41 ff d4             	callq	*%r12
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010ca94: 48 bf 0f 4d 11 00 00 80 ff ff	movabsq	$-140737487221489, %rdi # imm = 0xFFFF800000114D0F
ffff80000010ca9e: 48 be 00 93 11 00 00 80 ff ff	movabsq	$-140737487203584, %rsi # imm = 0xFFFF800000119300
ffff80000010caa8: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010caac: 31 c0                	xorl	%eax, %eax
ffff80000010caae: 41 ff d4             	callq	*%r12
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cab1: 48 bf ed 4a 11 00 00 80 ff ff	movabsq	$-140737487222035, %rdi # imm = 0xFFFF800000114AED
ffff80000010cabb: 48 bb 00 a7 11 00 00 80 ff ff	movabsq	$-140737487198464, %rbx # imm = 0xFFFF80000011A700
ffff80000010cac5: 49 01 df             	addq	%rbx, %r15
ffff80000010cac8: 48 89 de             	movq	%rbx, %rsi
ffff80000010cacb: 4c 89 fa             	movq	%r15, %rdx
ffff80000010cace: 31 c0                	xorl	%eax, %eax
ffff80000010cad0: 41 ff d4             	callq	*%r12
; 	cprintf("Kernel executable memory footprint: %llu kiB\n",
ffff80000010cad3: 4c 29 f3             	subq	%r14, %rbx
ffff80000010cad6: 48 81 c3 ff 03 00 00 	addq	$1023, %rbx             # imm = 0x3FF
ffff80000010cadd: 48 81 e3 00 fc ff ff 	andq	$-1024, %rbx            # imm = 0xFC00
ffff80000010cae4: 48 8d b3 ff 03 00 00 	leaq	1023(%rbx), %rsi
ffff80000010caeb: 48 85 db             	testq	%rbx, %rbx
ffff80000010caee: 48 0f 49 f3          	cmovnsq	%rbx, %rsi
ffff80000010caf2: 48 c1 fe 0a          	sarq	$10, %rsi
ffff80000010caf6: 48 bf f5 52 11 00 00 80 ff ff	movabsq	$-140737487219979, %rdi # imm = 0xFFFF8000001152F5
ffff80000010cb00: 31 c0                	xorl	%eax, %eax
ffff80000010cb02: 41 ff d4             	callq	*%r12
; 	return 0;
ffff80000010cb05: 31 c0                	xorl	%eax, %eax
ffff80000010cb07: 5b                   	popq	%rbx
ffff80000010cb08: 41 5c                	popq	%r12
ffff80000010cb0a: 41 5e                	popq	%r14
ffff80000010cb0c: 41 5f                	popq	%r15
ffff80000010cb0e: 5d                   	popq	%rbp
ffff80000010cb0f: c3                   	retq

ffff80000010cb10 <mon_backtrace>:
; {
ffff80000010cb10: 55                   	pushq	%rbp
ffff80000010cb11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cb14: 41 57                	pushq	%r15
ffff80000010cb16: 41 56                	pushq	%r14
ffff80000010cb18: 41 55                	pushq	%r13
ffff80000010cb1a: 41 54                	pushq	%r12
ffff80000010cb1c: 53                   	pushq	%rbx
ffff80000010cb1d: 50                   	pushq	%rax
; 	uintptr_t *rbp = read_rbp();
ffff80000010cb1e: 48 b8 00 cc 10 00 00 80 ff ff	movabsq	$-140737487254528, %rax # imm = 0xFFFF80000010CC00
ffff80000010cb28: ff d0                	callq	*%rax
ffff80000010cb2a: 48 89 c3             	movq	%rax, %rbx
; 	cprintf("Stack backtrace:\n");
ffff80000010cb2d: 48 bf 70 48 11 00 00 80 ff ff	movabsq	$-140737487222672, %rdi # imm = 0xFFFF800000114870
ffff80000010cb37: 49 bc 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r12 # imm = 0xFFFF80000010D400
ffff80000010cb41: 31 c0                	xorl	%eax, %eax
ffff80000010cb43: 41 ff d4             	callq	*%r12
; 	while (rbp) {
ffff80000010cb46: 48 85 db             	testq	%rbx, %rbx
ffff80000010cb49: 0f 84 97 00 00 00    	je	0xffff80000010cbe6 <mon_backtrace+0xd6>
ffff80000010cb4f: 49 be b9 53 11 00 00 80 ff ff	movabsq	$-140737487219783, %r14 # imm = 0xFFFF8000001153B9
ffff80000010cb59: 49 bf ae 55 11 00 00 80 ff ff	movabsq	$-140737487219282, %r15 # imm = 0xFFFF8000001155AE
ffff80000010cb63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cb6d: 0f 1f 00             	nopl	(%rax)
; 		uintptr_t rip = *(rbp + 1);
ffff80000010cb70: 48 8b 73 08          	movq	8(%rbx), %rsi
; 		cprintf("  RIP: %016p ", rip);
ffff80000010cb74: 48 bf 9b 58 11 00 00 80 ff ff	movabsq	$-140737487218533, %rdi # imm = 0xFFFF80000011589B
ffff80000010cb7e: 31 c0                	xorl	%eax, %eax
ffff80000010cb80: 41 ff d4             	callq	*%r12
; 		cprintf("<no debug info>\t");
ffff80000010cb83: 48 bf f2 55 11 00 00 80 ff ff	movabsq	$-140737487219214, %rdi # imm = 0xFFFF8000001155F2
ffff80000010cb8d: 31 c0                	xorl	%eax, %eax
ffff80000010cb8f: 41 ff d4             	callq	*%r12
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010cb92: 48 bf 5a 54 11 00 00 80 ff ff	movabsq	$-140737487219622, %rdi # imm = 0xFFFF80000011545A
ffff80000010cb9c: 48 89 de             	movq	%rbx, %rsi
ffff80000010cb9f: 31 c0                	xorl	%eax, %eax
ffff80000010cba1: 41 ff d4             	callq	*%r12
; 			cprintf("  args ");
ffff80000010cba4: 48 bf 5a 4f 11 00 00 80 ff ff	movabsq	$-140737487220902, %rdi # imm = 0xFFFF800000114F5A
ffff80000010cbae: 31 c0                	xorl	%eax, %eax
ffff80000010cbb0: 41 ff d4             	callq	*%r12
ffff80000010cbb3: 41 bd 02 00 00 00    	movl	$2, %r13d
ffff80000010cbb9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 			cprintf("%016p ", args[i]);
ffff80000010cbc0: 4a 8b 34 eb          	movq	(%rbx,%r13,8), %rsi
ffff80000010cbc4: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cbc7: 31 c0                	xorl	%eax, %eax
ffff80000010cbc9: 41 ff d4             	callq	*%r12
; 		for (i = 0; i < nargs; i++)
ffff80000010cbcc: 49 83 c5 01          	addq	$1, %r13
ffff80000010cbd0: 49 83 fd 08          	cmpq	$8, %r13
ffff80000010cbd4: 75 ea                	jne	0xffff80000010cbc0 <mon_backtrace+0xb0>
; 		cprintf("\n");
ffff80000010cbd6: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cbd9: 31 c0                	xorl	%eax, %eax
ffff80000010cbdb: 41 ff d4             	callq	*%r12
; 		rbp = (uintptr_t *)*rbp;
ffff80000010cbde: 48 8b 1b             	movq	(%rbx), %rbx
; 	while (rbp) {
ffff80000010cbe1: 48 85 db             	testq	%rbx, %rbx
ffff80000010cbe4: 75 8a                	jne	0xffff80000010cb70 <mon_backtrace+0x60>
; 	return 0;
ffff80000010cbe6: 31 c0                	xorl	%eax, %eax
ffff80000010cbe8: 48 83 c4 08          	addq	$8, %rsp
ffff80000010cbec: 5b                   	popq	%rbx
ffff80000010cbed: 41 5c                	popq	%r12
ffff80000010cbef: 41 5d                	popq	%r13
ffff80000010cbf1: 41 5e                	popq	%r14
ffff80000010cbf3: 41 5f                	popq	%r15
ffff80000010cbf5: 5d                   	popq	%rbp
ffff80000010cbf6: c3                   	retq
ffff80000010cbf7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010cc00 <read_rbp>:
; {
ffff80000010cc00: 55                   	pushq	%rbp
ffff80000010cc01: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %%rbp, %0" : "=r" (ret));
ffff80000010cc04: 48 89 e8             	movq	%rbp, %rax
; 	return ret;
ffff80000010cc07: 5d                   	popq	%rbp
ffff80000010cc08: c3                   	retq
ffff80000010cc09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010cc10 <mon_buddyinfo>:
; {
ffff80000010cc10: 55                   	pushq	%rbp
ffff80000010cc11: 48 89 e5             	movq	%rsp, %rbp
; 	show_buddy_info();
ffff80000010cc14: 48 b8 c0 d6 10 00 00 80 ff ff	movabsq	$-140737487251776, %rax # imm = 0xFFFF80000010D6C0
ffff80000010cc1e: ff d0                	callq	*%rax
; 	return 0;
ffff80000010cc20: 31 c0                	xorl	%eax, %eax
ffff80000010cc22: 5d                   	popq	%rbp
ffff80000010cc23: c3                   	retq
ffff80000010cc24: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cc2e: 66 90                	nop

ffff80000010cc30 <mon_pageinfo>:
; {
ffff80000010cc30: 55                   	pushq	%rbp
ffff80000010cc31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cc34: 41 57                	pushq	%r15
ffff80000010cc36: 41 56                	pushq	%r14
ffff80000010cc38: 41 55                	pushq	%r13
ffff80000010cc3a: 41 54                	pushq	%r12
ffff80000010cc3c: 53                   	pushq	%rbx
ffff80000010cc3d: 50                   	pushq	%rax
; 	if (!pages || npages == 0) {
ffff80000010cc3e: 49 bf e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %r15 # imm = 0xFFFF80000011A2E8
ffff80000010cc48: 49 83 3f 00          	cmpq	$0, (%r15)
ffff80000010cc4c: 0f 84 81 00 00 00    	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc52: 49 bc e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %r12 # imm = 0xFFFF80000011A2E0
; 	if (!pages || npages == 0) {
ffff80000010cc5c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010cc61: 74 70                	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc63: 48 89 f3             	movq	%rsi, %rbx
; 	if (argc < 3) {
ffff80000010cc66: 83 ff 02             	cmpl	$2, %edi
ffff80000010cc69: 7e 4b                	jle	0xffff80000010ccb6 <mon_pageinfo+0x86>
; 	addr = strtol(argv[2], NULL, 0);
ffff80000010cc6b: 48 8b 7b 10          	movq	16(%rbx), %rdi
ffff80000010cc6f: 48 b8 e0 04 11 00 00 80 ff ff	movabsq	$-140737487239968, %rax # imm = 0xFFFF8000001104E0
ffff80000010cc79: 31 f6                	xorl	%esi, %esi
ffff80000010cc7b: 31 d2                	xorl	%edx, %edx
ffff80000010cc7d: ff d0                	callq	*%rax
ffff80000010cc7f: 49 89 c6             	movq	%rax, %r14
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010cc82: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cc86: 48 be 23 53 11 00 00 80 ff ff	movabsq	$-140737487219933, %rsi # imm = 0xFFFF800000115323
ffff80000010cc90: 49 bd d0 02 11 00 00 80 ff ff	movabsq	$-140737487240496, %r13 # imm = 0xFFFF8000001102D0
ffff80000010cc9a: 41 ff d5             	callq	*%r13
ffff80000010cc9d: 85 c0                	testl	%eax, %eax
ffff80000010cc9f: 74 5b                	je	0xffff80000010ccfc <mon_pageinfo+0xcc>
; 	} else if (strcmp(argv[1], "pa") == 0) {
ffff80000010cca1: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cca5: 48 be 62 57 11 00 00 80 ff ff	movabsq	$-140737487218846, %rsi # imm = 0xFFFF800000115762
ffff80000010ccaf: 41 ff d5             	callq	*%r13
ffff80000010ccb2: 85 c0                	testl	%eax, %eax
ffff80000010ccb4: 74 5c                	je	0xffff80000010cd12 <mon_pageinfo+0xe2>
ffff80000010ccb6: 48 8b 33             	movq	(%rbx), %rsi
ffff80000010ccb9: 48 bf 12 4b 11 00 00 80 ff ff	movabsq	$-140737487221998, %rdi # imm = 0xFFFF800000114B12
ffff80000010ccc3: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010cccd: 31 c0                	xorl	%eax, %eax
ffff80000010cccf: ff d1                	callq	*%rcx
ffff80000010ccd1: eb 18                	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 		cprintf("error: buddy allocator not set up\n");
ffff80000010ccd3: 48 bf 93 49 11 00 00 80 ff ff	movabsq	$-140737487222381, %rdi # imm = 0xFFFF800000114993
ffff80000010ccdd: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010cce7: 31 c0                	xorl	%eax, %eax
ffff80000010cce9: ff d1                	callq	*%rcx
; }
ffff80000010cceb: 31 c0                	xorl	%eax, %eax
ffff80000010cced: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ccf1: 5b                   	popq	%rbx
ffff80000010ccf2: 41 5c                	popq	%r12
ffff80000010ccf4: 41 5d                	popq	%r13
ffff80000010ccf6: 41 5e                	popq	%r14
ffff80000010ccf8: 41 5f                	popq	%r15
ffff80000010ccfa: 5d                   	popq	%rbp
ffff80000010ccfb: c3                   	retq
; 		if (idx >= npages) {
ffff80000010ccfc: 4d 3b 34 24          	cmpq	(%r12), %r14
ffff80000010cd00: 0f 83 be 00 00 00    	jae	0xffff80000010cdc4 <mon_pageinfo+0x194>
; 		page = pages + idx;
ffff80000010cd06: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cd09: 48 c1 e3 05          	shlq	$5, %rbx
ffff80000010cd0d: 49 03 1f             	addq	(%r15), %rbx
ffff80000010cd10: eb 1c                	jmp	0xffff80000010cd2e <mon_pageinfo+0xfe>
; 		idx = PAGE_INDEX(addr);
ffff80000010cd12: 4d 89 f7             	movq	%r14, %r15
ffff80000010cd15: 49 c1 ef 0c          	shrq	$12, %r15
; 		page = pa2page(addr);
ffff80000010cd19: 48 b8 e0 cd 10 00 00 80 ff ff	movabsq	$-140737487254048, %rax # imm = 0xFFFF80000010CDE0
ffff80000010cd23: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cd26: ff d0                	callq	*%rax
ffff80000010cd28: 48 89 c3             	movq	%rax, %rbx
ffff80000010cd2b: 4d 89 fe             	movq	%r15, %r14
; 	cprintf("  Page index: %u\n", idx);
ffff80000010cd2e: 48 bf b6 49 11 00 00 80 ff ff	movabsq	$-140737487222346, %rdi # imm = 0xFFFF8000001149B6
ffff80000010cd38: 49 bf 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r15 # imm = 0xFFFF80000010D400
ffff80000010cd42: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cd45: 31 c0                	xorl	%eax, %eax
ffff80000010cd47: 41 ff d7             	callq	*%r15
; 	cprintf("  Physical address: %p\n", page2pa(page));
ffff80000010cd4a: 48 b8 40 ce 10 00 00 80 ff ff	movabsq	$-140737487253952, %rax # imm = 0xFFFF80000010CE40
ffff80000010cd54: 48 89 df             	movq	%rbx, %rdi
ffff80000010cd57: ff d0                	callq	*%rax
ffff80000010cd59: 48 bf c8 49 11 00 00 80 ff ff	movabsq	$-140737487222328, %rdi # imm = 0xFFFF8000001149C8
ffff80000010cd63: 48 89 c6             	movq	%rax, %rsi
ffff80000010cd66: 31 c0                	xorl	%eax, %eax
ffff80000010cd68: 41 ff d7             	callq	*%r15
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010cd6b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000010cd6f: 48 b8 91 57 11 00 00 80 ff ff	movabsq	$-140737487218799, %rax # imm = 0xFFFF800000115791
ffff80000010cd79: 48 be d0 4e 11 00 00 80 ff ff	movabsq	$-140737487221040, %rsi # imm = 0xFFFF800000114ED0
ffff80000010cd83: 48 0f 49 f0          	cmovnsq	%rax, %rsi
ffff80000010cd87: 48 bf 30 4f 11 00 00 80 ff ff	movabsq	$-140737487220944, %rdi # imm = 0xFFFF800000114F30
ffff80000010cd91: 31 c0                	xorl	%eax, %eax
ffff80000010cd93: 41 ff d7             	callq	*%r15
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010cd96: 0f b7 73 10          	movzwl	16(%rbx), %esi
ffff80000010cd9a: 48 bf 96 57 11 00 00 80 ff ff	movabsq	$-140737487218794, %rdi # imm = 0xFFFF800000115796
ffff80000010cda4: 31 c0                	xorl	%eax, %eax
ffff80000010cda6: 41 ff d7             	callq	*%r15
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010cda9: 0f b6 73 12          	movzbl	18(%rbx), %esi
ffff80000010cdad: 83 e6 7f             	andl	$127, %esi
ffff80000010cdb0: 48 bf 44 58 11 00 00 80 ff ff	movabsq	$-140737487218620, %rdi # imm = 0xFFFF800000115844
ffff80000010cdba: 31 c0                	xorl	%eax, %eax
ffff80000010cdbc: 41 ff d7             	callq	*%r15
ffff80000010cdbf: e9 27 ff ff ff       	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 			cprintf("error: index %u out of range.\n", addr);
ffff80000010cdc4: 48 bf 34 4d 11 00 00 80 ff ff	movabsq	$-140737487221452, %rdi # imm = 0xFFFF800000114D34
ffff80000010cdce: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010cdd8: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cddb: e9 ed fe ff ff       	jmp	0xffff80000010cccd <mon_pageinfo+0x9d>

ffff80000010cde0 <pa2page>:
; {
ffff80000010cde0: 55                   	pushq	%rbp
ffff80000010cde1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010cde4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010cde8: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010cdf2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010cdf5: 73 16                	jae	0xffff80000010ce0d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010cdf7: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010ce01: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ce05: 48 03 38             	addq	(%rax), %rdi
ffff80000010ce08: 48 89 f8             	movq	%rdi, %rax
ffff80000010ce0b: 5d                   	popq	%rbp
ffff80000010ce0c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010ce0d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010ce17: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff80000010ce21: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010ce2b: be 49 00 00 00       	movl	$73, %esi
ffff80000010ce30: 31 c0                	xorl	%eax, %eax
ffff80000010ce32: ff d1                	callq	*%rcx
ffff80000010ce34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ce3e: 66 90                	nop

ffff80000010ce40 <page2pa>:
; {
ffff80000010ce40: 55                   	pushq	%rbp
ffff80000010ce41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce44: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010ce47: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010ce51: 48 2b 01             	subq	(%rcx), %rax
ffff80000010ce54: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010ce58: 5d                   	popq	%rbp
ffff80000010ce59: c3                   	retq
ffff80000010ce5a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ce60 <mon_ptdump>:
; {
ffff80000010ce60: 55                   	pushq	%rbp
ffff80000010ce61: 48 89 e5             	movq	%rsp, %rbp
; 	return dump_page_tables(kernel_pml4, PAGE_HUGE);
ffff80000010ce64: 48 b8 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rax # imm = 0xFFFF80000011A2F0
ffff80000010ce6e: 48 8b 38             	movq	(%rax), %rdi
ffff80000010ce71: 48 b8 d0 05 11 00 00 80 ff ff	movabsq	$-140737487239728, %rax # imm = 0xFFFF8000001105D0
ffff80000010ce7b: be 80 00 00 00       	movl	$128, %esi
ffff80000010ce80: ff d0                	callq	*%rax
ffff80000010ce82: 5d                   	popq	%rbp
ffff80000010ce83: c3                   	retq
ffff80000010ce84: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ce8e: 66 90                	nop

ffff80000010ce90 <monitor>:
; {
ffff80000010ce90: 55                   	pushq	%rbp
ffff80000010ce91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce94: 41 57                	pushq	%r15
ffff80000010ce96: 41 56                	pushq	%r14
ffff80000010ce98: 41 54                	pushq	%r12
ffff80000010ce9a: 53                   	pushq	%rbx
ffff80000010ce9b: 49 89 fe             	movq	%rdi, %r14
; 	cprintf("Welcome to the OpenLSD kernel monitor!\n");
ffff80000010ce9e: 48 bf 14 55 11 00 00 80 ff ff	movabsq	$-140737487219436, %rdi # imm = 0xFFFF800000115514
ffff80000010cea8: 48 bb 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rbx # imm = 0xFFFF80000010D400
ffff80000010ceb2: 31 c0                	xorl	%eax, %eax
ffff80000010ceb4: ff d3                	callq	*%rbx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010ceb6: 48 bf 36 4e 11 00 00 80 ff ff	movabsq	$-140737487221194, %rdi # imm = 0xFFFF800000114E36
ffff80000010cec0: 31 c0                	xorl	%eax, %eax
ffff80000010cec2: ff d3                	callq	*%rbx
ffff80000010cec4: 49 bf fa 50 11 00 00 80 ff ff	movabsq	$-140737487220486, %r15 # imm = 0xFFFF8000001150FA
ffff80000010cece: 48 bb 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rbx # imm = 0xFFFF800000110050
ffff80000010ced8: 49 bc 10 cf 10 00 00 80 ff ff	movabsq	$-140737487253744, %r12 # imm = 0xFFFF80000010CF10
ffff80000010cee2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ceec: 0f 1f 40 00          	nopl	(%rax)
; 		buf = readline("K> ");
ffff80000010cef0: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cef3: ff d3                	callq	*%rbx
; 		if (buf != NULL)
ffff80000010cef5: 48 85 c0             	testq	%rax, %rax
ffff80000010cef8: 74 f6                	je	0xffff80000010cef0 <monitor+0x60>
; 			if (runcmd(buf, frame) < 0)
ffff80000010cefa: 48 89 c7             	movq	%rax, %rdi
ffff80000010cefd: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cf00: 41 ff d4             	callq	*%r12
ffff80000010cf03: 85 c0                	testl	%eax, %eax
ffff80000010cf05: 79 e9                	jns	0xffff80000010cef0 <monitor+0x60>
; }
ffff80000010cf07: 5b                   	popq	%rbx
ffff80000010cf08: 41 5c                	popq	%r12
ffff80000010cf0a: 41 5e                	popq	%r14
ffff80000010cf0c: 41 5f                	popq	%r15
ffff80000010cf0e: 5d                   	popq	%rbp
ffff80000010cf0f: c3                   	retq

ffff80000010cf10 <runcmd>:
; {
ffff80000010cf10: 55                   	pushq	%rbp
ffff80000010cf11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cf14: 41 57                	pushq	%r15
ffff80000010cf16: 41 56                	pushq	%r14
ffff80000010cf18: 41 55                	pushq	%r13
ffff80000010cf1a: 41 54                	pushq	%r12
ffff80000010cf1c: 53                   	pushq	%rbx
ffff80000010cf1d: 48 81 ec 88 00 00 00 	subq	$136, %rsp
ffff80000010cf24: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010cf28: 49 89 fe             	movq	%rdi, %r14
; 	argv[argc] = 0;
ffff80000010cf2b: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff80000010cf36: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010cf39: 49 bc 1d 59 11 00 00 80 ff ff	movabsq	$-140737487218403, %r12 # imm = 0xFFFF80000011591D
ffff80000010cf43: 49 bd 40 03 11 00 00 80 ff ff	movabsq	$-140737487240384, %r13 # imm = 0xFFFF800000110340
ffff80000010cf4d: 0f 1f 00             	nopl	(%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf50: 41 8a 06             	movb	(%r14), %al
ffff80000010cf53: 84 c0                	testb	%al, %al
ffff80000010cf55: 74 3c                	je	0xffff80000010cf93 <runcmd+0x83>
ffff80000010cf57: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf5a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf60: 0f be f0             	movsbl	%al, %esi
ffff80000010cf63: 4c 89 e7             	movq	%r12, %rdi
ffff80000010cf66: 41 ff d5             	callq	*%r13
ffff80000010cf69: 48 85 c0             	testq	%rax, %rax
ffff80000010cf6c: 74 22                	je	0xffff80000010cf90 <runcmd+0x80>
; 			*buf++ = 0;
ffff80000010cf6e: 4c 8d 73 01          	leaq	1(%rbx), %r14
ffff80000010cf72: c6 03 00             	movb	$0, (%rbx)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf75: 0f b6 43 01          	movzbl	1(%rbx), %eax
ffff80000010cf79: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf7c: 84 c0                	testb	%al, %al
ffff80000010cf7e: 75 e0                	jne	0xffff80000010cf60 <runcmd+0x50>
ffff80000010cf80: eb 11                	jmp	0xffff80000010cf93 <runcmd+0x83>
ffff80000010cf82: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf8c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cf90: 49 89 de             	movq	%rbx, %r14
; 		if (*buf == 0)
ffff80000010cf93: 41 80 3e 00          	cmpb	$0, (%r14)
ffff80000010cf97: 74 48                	je	0xffff80000010cfe1 <runcmd+0xd1>
; 		if (argc == MAXARGS-1) {
ffff80000010cf99: 49 83 ff 0f          	cmpq	$15, %r15
ffff80000010cf9d: 0f 84 c0 00 00 00    	je	0xffff80000010d063 <runcmd+0x153>
; 		argv[argc++] = buf;
ffff80000010cfa3: 4e 89 b4 fd 50 ff ff ff      	movq	%r14, -176(%rbp,%r15,8)
ffff80000010cfab: 49 83 c7 01          	addq	$1, %r15
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010cfaf: 41 8a 06             	movb	(%r14), %al
ffff80000010cfb2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cfbc: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cfc0: 84 c0                	testb	%al, %al
ffff80000010cfc2: 74 8c                	je	0xffff80000010cf50 <runcmd+0x40>
ffff80000010cfc4: 0f be f0             	movsbl	%al, %esi
ffff80000010cfc7: 4c 89 e7             	movq	%r12, %rdi
ffff80000010cfca: 41 ff d5             	callq	*%r13
ffff80000010cfcd: 48 85 c0             	testq	%rax, %rax
ffff80000010cfd0: 0f 85 7a ff ff ff    	jne	0xffff80000010cf50 <runcmd+0x40>
ffff80000010cfd6: 41 0f b6 46 01       	movzbl	1(%r14), %eax
; 			buf++;
ffff80000010cfdb: 49 83 c6 01          	addq	$1, %r14
ffff80000010cfdf: eb df                	jmp	0xffff80000010cfc0 <runcmd+0xb0>
; 	argv[argc] = 0;
ffff80000010cfe1: 44 89 f8             	movl	%r15d, %eax
ffff80000010cfe4: 48 c7 84 c5 50 ff ff ff 00 00 00 00  	movq	$0, -176(%rbp,%rax,8)
; 	if (argc == 0)
ffff80000010cff0: 45 85 ff             	testl	%r15d, %r15d
ffff80000010cff3: 0f 84 8b 00 00 00    	je	0xffff80000010d084 <runcmd+0x174>
ffff80000010cff9: bb 10 00 00 00       	movl	$16, %ebx
ffff80000010cffe: 49 bc 50 42 11 00 00 80 ff ff	movabsq	$-140737487224240, %r12 # imm = 0xFFFF800000114250
ffff80000010d008: 49 bd d0 02 11 00 00 80 ff ff	movabsq	$-140737487240496, %r13 # imm = 0xFFFF8000001102D0
ffff80000010d012: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d01c: 0f 1f 40 00          	nopl	(%rax)
; 		if (strcmp(argv[0], commands[i].name) == 0)
ffff80000010d020: 48 8b bd 50 ff ff ff 	movq	-176(%rbp), %rdi
ffff80000010d027: 49 8b 74 1c f0       	movq	-16(%r12,%rbx), %rsi
ffff80000010d02c: 41 ff d5             	callq	*%r13
ffff80000010d02f: 85 c0                	testl	%eax, %eax
ffff80000010d031: 74 55                	je	0xffff80000010d088 <runcmd+0x178>
; 	for (i = 0; i < NCOMMANDS; i++) {
ffff80000010d033: 48 83 c3 18          	addq	$24, %rbx
ffff80000010d037: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010d03e: 75 e0                	jne	0xffff80000010d020 <runcmd+0x110>
; 	cprintf("Unknown command '%s'\n", argv[0]);
ffff80000010d040: 48 8b b5 50 ff ff ff 	movq	-176(%rbp), %rsi
ffff80000010d047: 48 bf d4 48 11 00 00 80 ff ff	movabsq	$-140737487222572, %rdi # imm = 0xFFFF8000001148D4
ffff80000010d051: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d05b: 31 db                	xorl	%ebx, %ebx
ffff80000010d05d: 31 c0                	xorl	%eax, %eax
ffff80000010d05f: ff d1                	callq	*%rcx
ffff80000010d061: eb 39                	jmp	0xffff80000010d09c <runcmd+0x18c>
; 			cprintf("Too many arguments (max %d)\n", MAXARGS);
ffff80000010d063: 48 bf 3d 4f 11 00 00 80 ff ff	movabsq	$-140737487220931, %rdi # imm = 0xFFFF800000114F3D
ffff80000010d06d: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d077: 31 db                	xorl	%ebx, %ebx
ffff80000010d079: be 10 00 00 00       	movl	$16, %esi
ffff80000010d07e: 31 c0                	xorl	%eax, %eax
ffff80000010d080: ff d1                	callq	*%rcx
ffff80000010d082: eb 18                	jmp	0xffff80000010d09c <runcmd+0x18c>
ffff80000010d084: 31 db                	xorl	%ebx, %ebx
ffff80000010d086: eb 14                	jmp	0xffff80000010d09c <runcmd+0x18c>
ffff80000010d088: 48 8d b5 50 ff ff ff 	leaq	-176(%rbp), %rsi
; 			return commands[i].func(argc, argv, frame);
ffff80000010d08f: 44 89 ff             	movl	%r15d, %edi
ffff80000010d092: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff80000010d096: 42 ff 14 23          	callq	*(%rbx,%r12)
ffff80000010d09a: 89 c3                	movl	%eax, %ebx
; }
ffff80000010d09c: 89 d8                	movl	%ebx, %eax
ffff80000010d09e: 48 81 c4 88 00 00 00 	addq	$136, %rsp
ffff80000010d0a5: 5b                   	popq	%rbx
ffff80000010d0a6: 41 5c                	popq	%r12
ffff80000010d0a8: 41 5d                	popq	%r13
ffff80000010d0aa: 41 5e                	popq	%r14
ffff80000010d0ac: 41 5f                	popq	%r15
ffff80000010d0ae: 5d                   	popq	%rbp
ffff80000010d0af: c3                   	retq

ffff80000010d0b0 <pic_remap>:
; {
ffff80000010d0b0: 55                   	pushq	%rbp
ffff80000010d0b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d0b4: 41 57                	pushq	%r15
ffff80000010d0b6: 41 56                	pushq	%r14
ffff80000010d0b8: 41 55                	pushq	%r13
ffff80000010d0ba: 41 54                	pushq	%r12
ffff80000010d0bc: 53                   	pushq	%rbx
ffff80000010d0bd: 50                   	pushq	%rax
ffff80000010d0be: 41 89 f4             	movl	%esi, %r12d
ffff80000010d0c1: 41 89 fd             	movl	%edi, %r13d
; 	masks[0] = inb(PIC1_DATA);
ffff80000010d0c4: 48 bb 70 d1 10 00 00 80 ff ff	movabsq	$-140737487253136, %rbx # imm = 0xFFFF80000010D170
ffff80000010d0ce: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0d3: ff d3                	callq	*%rbx
ffff80000010d0d5: 41 89 c7             	movl	%eax, %r15d
; 	masks[1] = inb(PIC2_DATA);
ffff80000010d0d8: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d0dd: ff d3                	callq	*%rbx
ffff80000010d0df: 41 89 c6             	movl	%eax, %r14d
; 	outb(PIC1_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d0e2: 48 bb 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %rbx # imm = 0xFFFF80000010D180
ffff80000010d0ec: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d0f1: be 11 00 00 00       	movl	$17, %esi
ffff80000010d0f6: ff d3                	callq	*%rbx
; 	outb(PIC2_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d0f8: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d0fd: be 11 00 00 00       	movl	$17, %esi
ffff80000010d102: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, offset1);
ffff80000010d104: 41 0f b6 f5          	movzbl	%r13b, %esi
ffff80000010d108: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d10d: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, offset2);
ffff80000010d10f: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff80000010d113: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d118: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, 1 << IRQ_SLAVE);
ffff80000010d11a: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d11f: be 04 00 00 00       	movl	$4, %esi
ffff80000010d124: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, IRQ_SLAVE);
ffff80000010d126: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d12b: be 02 00 00 00       	movl	$2, %esi
ffff80000010d130: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, PIC_ICW4_8086 | PIC_ICW4_AUTO);
ffff80000010d132: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d137: be 03 00 00 00       	movl	$3, %esi
ffff80000010d13c: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, PIC_ICW4_8086);
ffff80000010d13e: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d143: be 01 00 00 00       	movl	$1, %esi
ffff80000010d148: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, masks[0]);
ffff80000010d14a: 41 0f b6 f7          	movzbl	%r15b, %esi
ffff80000010d14e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d153: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, masks[1]);
ffff80000010d155: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010d159: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d15e: ff d3                	callq	*%rbx
; }
ffff80000010d160: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d164: 5b                   	popq	%rbx
ffff80000010d165: 41 5c                	popq	%r12
ffff80000010d167: 41 5d                	popq	%r13
ffff80000010d169: 41 5e                	popq	%r14
ffff80000010d16b: 41 5f                	popq	%r15
ffff80000010d16d: 5d                   	popq	%rbp
ffff80000010d16e: c3                   	retq
ffff80000010d16f: 90                   	nop

ffff80000010d170 <inb>:
; {
ffff80000010d170: 55                   	pushq	%rbp
ffff80000010d171: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010d174: 89 fa                	movl	%edi, %edx
ffff80000010d176: ec                   	inb	%dx, %al
; 	return data;
ffff80000010d177: 5d                   	popq	%rbp
ffff80000010d178: c3                   	retq
ffff80000010d179: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d180 <outb>:
; {
ffff80000010d180: 55                   	pushq	%rbp
ffff80000010d181: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d184: 89 f0                	movl	%esi, %eax
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010d186: 89 fa                	movl	%edi, %edx
ffff80000010d188: ee                   	outb	%al, %dx
; }
ffff80000010d189: 5d                   	popq	%rbp
ffff80000010d18a: c3                   	retq
ffff80000010d18b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d190 <pic_get_reg>:
; {
ffff80000010d190: 55                   	pushq	%rbp
ffff80000010d191: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d194: 41 56                	pushq	%r14
ffff80000010d196: 53                   	pushq	%rbx
; 	outb(PIC1_CMD, ocw3);
ffff80000010d197: 40 0f b6 df          	movzbl	%dil, %ebx
ffff80000010d19b: 49 be 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %r14 # imm = 0xFFFF80000010D180
ffff80000010d1a5: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d1aa: 89 de                	movl	%ebx, %esi
ffff80000010d1ac: 41 ff d6             	callq	*%r14
; 	outb(PIC2_CMD, ocw3);
ffff80000010d1af: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d1b4: 89 de                	movl	%ebx, %esi
ffff80000010d1b6: 41 ff d6             	callq	*%r14
; 	return (inb(PIC2_CMD) << 8) | inb(PIC1_CMD);
ffff80000010d1b9: 49 be 70 d1 10 00 00 80 ff ff	movabsq	$-140737487253136, %r14 # imm = 0xFFFF80000010D170
ffff80000010d1c3: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d1c8: 41 ff d6             	callq	*%r14
ffff80000010d1cb: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010d1ce: c1 e3 08             	shll	$8, %ebx
ffff80000010d1d1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d1d6: 41 ff d6             	callq	*%r14
ffff80000010d1d9: 0f b6 c0             	movzbl	%al, %eax
ffff80000010d1dc: 09 d8                	orl	%ebx, %eax
ffff80000010d1de: 5b                   	popq	%rbx
ffff80000010d1df: 41 5e                	popq	%r14
ffff80000010d1e1: 5d                   	popq	%rbp
ffff80000010d1e2: c3                   	retq
ffff80000010d1e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d1ed: 0f 1f 00             	nopl	(%rax)

ffff80000010d1f0 <pic_get_irr>:
; {
ffff80000010d1f0: 55                   	pushq	%rbp
ffff80000010d1f1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_IRR);
ffff80000010d1f4: 48 b8 90 d1 10 00 00 80 ff ff	movabsq	$-140737487253104, %rax # imm = 0xFFFF80000010D190
ffff80000010d1fe: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010d203: ff d0                	callq	*%rax
ffff80000010d205: 5d                   	popq	%rbp
ffff80000010d206: c3                   	retq
ffff80000010d207: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d210 <pic_get_isr>:
; {
ffff80000010d210: 55                   	pushq	%rbp
ffff80000010d211: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_ISR);
ffff80000010d214: 48 b8 90 d1 10 00 00 80 ff ff	movabsq	$-140737487253104, %rax # imm = 0xFFFF80000010D190
ffff80000010d21e: bf 0b 00 00 00       	movl	$11, %edi
ffff80000010d223: ff d0                	callq	*%rax
ffff80000010d225: 5d                   	popq	%rbp
ffff80000010d226: c3                   	retq
ffff80000010d227: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d230 <pic_disable_all_irqs>:
; {
ffff80000010d230: 55                   	pushq	%rbp
ffff80000010d231: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d234: 53                   	pushq	%rbx
ffff80000010d235: 50                   	pushq	%rax
; 	outb(PIC1_DATA, 0xff);
ffff80000010d236: 48 bb 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %rbx # imm = 0xFFFF80000010D180
ffff80000010d240: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d245: be ff 00 00 00       	movl	$255, %esi
ffff80000010d24a: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, 0xff);
ffff80000010d24c: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d251: be ff 00 00 00       	movl	$255, %esi
ffff80000010d256: ff d3                	callq	*%rbx
; }
ffff80000010d258: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d25c: 5b                   	popq	%rbx
ffff80000010d25d: 5d                   	popq	%rbp
ffff80000010d25e: c3                   	retq
ffff80000010d25f: 90                   	nop

ffff80000010d260 <pic_enable_irq>:
; {
ffff80000010d260: 55                   	pushq	%rbp
ffff80000010d261: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d264: 41 56                	pushq	%r14
ffff80000010d266: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d267: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d26a: 31 db                	xorl	%ebx, %ebx
ffff80000010d26c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d26f: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) & ~(1 << irq));
ffff80000010d272: 48 b9 70 d1 10 00 00 80 ff ff	movabsq	$-140737487253136, %rcx # imm = 0xFFFF80000010D170
ffff80000010d27c: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d280: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d284: c1 e3 07             	shll	$7, %ebx
ffff80000010d287: 83 cb 21             	orl	$33, %ebx
ffff80000010d28a: 89 df                	movl	%ebx, %edi
ffff80000010d28c: ff d1                	callq	*%rcx
ffff80000010d28e: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d293: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d296: d3 e2                	shll	%cl, %edx
ffff80000010d298: f6 d2                	notb	%dl
ffff80000010d29a: 20 c2                	andb	%al, %dl
ffff80000010d29c: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d29f: 48 b8 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %rax # imm = 0xFFFF80000010D180
ffff80000010d2a9: 89 df                	movl	%ebx, %edi
ffff80000010d2ab: ff d0                	callq	*%rax
; }
ffff80000010d2ad: 5b                   	popq	%rbx
ffff80000010d2ae: 41 5e                	popq	%r14
ffff80000010d2b0: 5d                   	popq	%rbp
ffff80000010d2b1: c3                   	retq
ffff80000010d2b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d2bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d2c0 <pic_disable_irq>:
; {
ffff80000010d2c0: 55                   	pushq	%rbp
ffff80000010d2c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d2c4: 41 56                	pushq	%r14
ffff80000010d2c6: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d2c7: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d2ca: 31 db                	xorl	%ebx, %ebx
ffff80000010d2cc: 83 ff 08             	cmpl	$8, %edi
ffff80000010d2cf: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) | (1 << irq));
ffff80000010d2d2: 48 b9 70 d1 10 00 00 80 ff ff	movabsq	$-140737487253136, %rcx # imm = 0xFFFF80000010D170
ffff80000010d2dc: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d2e0: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d2e4: c1 e3 07             	shll	$7, %ebx
ffff80000010d2e7: 83 cb 21             	orl	$33, %ebx
ffff80000010d2ea: 89 df                	movl	%ebx, %edi
ffff80000010d2ec: ff d1                	callq	*%rcx
ffff80000010d2ee: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d2f3: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d2f6: d3 e2                	shll	%cl, %edx
ffff80000010d2f8: 08 c2                	orb	%al, %dl
ffff80000010d2fa: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d2fd: 48 b8 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %rax # imm = 0xFFFF80000010D180
ffff80000010d307: 89 df                	movl	%ebx, %edi
ffff80000010d309: ff d0                	callq	*%rax
; }
ffff80000010d30b: 5b                   	popq	%rbx
ffff80000010d30c: 41 5e                	popq	%r14
ffff80000010d30e: 5d                   	popq	%rbp
ffff80000010d30f: c3                   	retq

ffff80000010d310 <pic_eoi>:
; {
ffff80000010d310: 55                   	pushq	%rbp
ffff80000010d311: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d314: 53                   	pushq	%rbx
ffff80000010d315: 50                   	pushq	%rax
ffff80000010d316: 48 bb 80 d1 10 00 00 80 ff ff	movabsq	$-140737487253120, %rbx # imm = 0xFFFF80000010D180
; 	if (irq >= 8) {
ffff80000010d320: 83 ff 08             	cmpl	$8, %edi
ffff80000010d323: 7c 0c                	jl	0xffff80000010d331 <pic_eoi+0x21>
; 		outb(PIC2_CMD, PIC_EOI);
ffff80000010d325: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d32a: be 20 00 00 00       	movl	$32, %esi
ffff80000010d32f: ff d3                	callq	*%rbx
; 	outb(PIC1_CMD, PIC_EOI);
ffff80000010d331: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d336: be 20 00 00 00       	movl	$32, %esi
ffff80000010d33b: ff d3                	callq	*%rbx
; }
ffff80000010d33d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d341: 5b                   	popq	%rbx
ffff80000010d342: 5d                   	popq	%rbp
ffff80000010d343: c3                   	retq
ffff80000010d344: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d34e: 66 90                	nop

ffff80000010d350 <pic_init>:
; {
ffff80000010d350: 55                   	pushq	%rbp
ffff80000010d351: 48 89 e5             	movq	%rsp, %rbp
; 	pic_disable_all_irqs();
ffff80000010d354: 48 b8 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rax # imm = 0xFFFF80000010D230
ffff80000010d35e: ff d0                	callq	*%rax
; 	pic_remap(IRQ_OFFSET, IRQ_OFFSET + 8);
ffff80000010d360: 48 b8 b0 d0 10 00 00 80 ff ff	movabsq	$-140737487253328, %rax # imm = 0xFFFF80000010D0B0
ffff80000010d36a: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d36f: be 28 00 00 00       	movl	$40, %esi
ffff80000010d374: ff d0                	callq	*%rax
; 	pic_get_irr();
ffff80000010d376: 48 b8 f0 d1 10 00 00 80 ff ff	movabsq	$-140737487253008, %rax # imm = 0xFFFF80000010D1F0
ffff80000010d380: ff d0                	callq	*%rax
; 	pic_enable_irq(IRQ_SLAVE);
ffff80000010d382: 48 b8 60 d2 10 00 00 80 ff ff	movabsq	$-140737487252896, %rax # imm = 0xFFFF80000010D260
ffff80000010d38c: bf 02 00 00 00       	movl	$2, %edi
ffff80000010d391: ff d0                	callq	*%rax
; }
ffff80000010d393: 5d                   	popq	%rbp
ffff80000010d394: c3                   	retq
ffff80000010d395: cc                   	int3
ffff80000010d396: cc                   	int3
ffff80000010d397: cc                   	int3
ffff80000010d398: cc                   	int3
ffff80000010d399: cc                   	int3
ffff80000010d39a: cc                   	int3
ffff80000010d39b: cc                   	int3
ffff80000010d39c: cc                   	int3
ffff80000010d39d: cc                   	int3
ffff80000010d39e: cc                   	int3
ffff80000010d39f: cc                   	int3

ffff80000010d3a0 <vcprintf>:
; {
ffff80000010d3a0: 55                   	pushq	%rbp
ffff80000010d3a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d3a4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d3a8: 48 89 f1             	movq	%rsi, %rcx
ffff80000010d3ab: 48 89 fa             	movq	%rdi, %rdx
; 	int cnt = 0;
ffff80000010d3ae: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; 	vprintfmt((void*)putch, &cnt, fmt, ap);
ffff80000010d3b5: 48 bf e0 d3 10 00 00 80 ff ff	movabsq	$-140737487252512, %rdi # imm = 0xFFFF80000010D3E0
ffff80000010d3bf: 48 b8 10 f3 10 00 00 80 ff ff	movabsq	$-140737487244528, %rax # imm = 0xFFFF80000010F310
ffff80000010d3c9: 48 8d 75 fc          	leaq	-4(%rbp), %rsi
ffff80000010d3cd: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d3cf: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d3d2: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d3d6: 5d                   	popq	%rbp
ffff80000010d3d7: c3                   	retq
ffff80000010d3d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d3e0 <putch>:
; {
ffff80000010d3e0: 55                   	pushq	%rbp
ffff80000010d3e1: 48 89 e5             	movq	%rsp, %rbp
; 	cputchar(ch);
ffff80000010d3e4: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010d3ee: ff d0                	callq	*%rax
; }
ffff80000010d3f0: 5d                   	popq	%rbp
ffff80000010d3f1: c3                   	retq
ffff80000010d3f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d3fc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d400 <cprintf>:
; {
ffff80000010d400: 55                   	pushq	%rbp
ffff80000010d401: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d404: 48 83 ec 50          	subq	$80, %rsp
ffff80000010d408: 48 89 75 b8          	movq	%rsi, -72(%rbp)
ffff80000010d40c: 48 89 55 c0          	movq	%rdx, -64(%rbp)
ffff80000010d410: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010d414: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010d418: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010d41c: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010d420: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010d424: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010d428: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010d42c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax # imm = 0x3000000008
ffff80000010d436: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	cnt = vcprintf(fmt, ap);
ffff80000010d43a: 48 b8 a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rax # imm = 0xFFFF80000010D3A0
ffff80000010d444: 48 8d 75 e0          	leaq	-32(%rbp), %rsi
ffff80000010d448: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d44a: 48 83 c4 50          	addq	$80, %rsp
ffff80000010d44e: 5d                   	popq	%rbp
ffff80000010d44f: c3                   	retq

ffff80000010d450 <boot_alloc>:
; {
ffff80000010d450: 55                   	pushq	%rbp
ffff80000010d451: 48 89 e5             	movq	%rsp, %rbp
; 	if (!next_free){
ffff80000010d454: 48 b9 30 a2 11 00 00 80 ff ff	movabsq	$-140737487199696, %rcx # imm = 0xFFFF80000011A230
ffff80000010d45e: 48 83 39 00          	cmpq	$0, (%rcx)
ffff80000010d462: 74 2a                	je	0xffff80000010d48e <boot_alloc+0x3e>
; 	if(n == 0) return next_free;
ffff80000010d464: 85 ff                	testl	%edi, %edi
ffff80000010d466: 74 43                	je	0xffff80000010d4ab <boot_alloc+0x5b>
; 	uint64_t n_paligned = ROUNDUP(n, PAGE_SIZE);
ffff80000010d468: 81 c7 ff 0f 00 00    	addl	$4095, %edi             # imm = 0xFFF
ffff80000010d46e: 81 e7 00 f0 ff ff    	andl	$4294963200, %edi       # imm = 0xFFFFF000
; 	if(((uintptr_t) next_free + n_paligned) > ((uintptr_t) KERNEL_VMA + BOOT_MAP_LIM)){
ffff80000010d474: 48 8b 01             	movq	(%rcx), %rax
ffff80000010d477: 48 01 c7             	addq	%rax, %rdi
ffff80000010d47a: 48 ba 01 00 80 00 00 80 ff ff	movabsq	$-140737479966719, %rdx # imm = 0xFFFF800000800001
; 	if(((uintptr_t) next_free + n_paligned) > ((uintptr_t) KERNEL_VMA + BOOT_MAP_LIM)){
ffff80000010d484: 48 39 d7             	cmpq	%rdx, %rdi
ffff80000010d487: 73 27                	jae	0xffff80000010d4b0 <boot_alloc+0x60>
; 	next_free += n_paligned;
ffff80000010d489: 48 89 39             	movq	%rdi, (%rcx)
; }
ffff80000010d48c: 5d                   	popq	%rbp
ffff80000010d48d: c3                   	retq
ffff80000010d48e: 48 b8 00 a7 11 00 00 80 ff ff	movabsq	$-140737487198464, %rax # imm = 0xFFFF80000011A700
ffff80000010d498: 48 05 ff 0f 00 00    	addq	$4095, %rax             # imm = 0xFFF
; 		next_free = ROUNDUP((char *)end, PAGE_SIZE);
ffff80000010d49e: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010d4a4: 48 89 01             	movq	%rax, (%rcx)
; 	if(n == 0) return next_free;
ffff80000010d4a7: 85 ff                	testl	%edi, %edi
ffff80000010d4a9: 75 bd                	jne	0xffff80000010d468 <boot_alloc+0x18>
ffff80000010d4ab: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010d4ae: 5d                   	popq	%rbp
ffff80000010d4af: c3                   	retq
; 		panic("OOM in boot loader");
ffff80000010d4b0: 48 bf 22 59 11 00 00 80 ff ff	movabsq	$-140737487218398, %rdi # imm = 0xFFFF800000115922
ffff80000010d4ba: 48 ba c7 57 11 00 00 80 ff ff	movabsq	$-140737487218745, %rdx # imm = 0xFFFF8000001157C7
ffff80000010d4c4: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d4ce: be 2c 00 00 00       	movl	$44, %esi
ffff80000010d4d3: 31 c0                	xorl	%eax, %eax
ffff80000010d4d5: ff d1                	callq	*%rcx
ffff80000010d4d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d4e0 <align_boot_info>:
; {
ffff80000010d4e0: 55                   	pushq	%rbp
ffff80000010d4e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d4e4: 8b 4f 04             	movl	4(%rdi), %ecx
ffff80000010d4e7: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d4ea: 74 6f                	je	0xffff80000010d55b <align_boot_info+0x7b>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010d4ec: 8b 07                	movl	(%rdi), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d4ee: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d4f2: 48 8d 0c 49          	leaq	(%rcx,%rcx,2), %rcx
ffff80000010d4f6: 31 d2                	xorl	%edx, %edx
ffff80000010d4f8: eb 41                	jmp	0xffff80000010d53b <align_boot_info+0x5b>
ffff80000010d4fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 			base = ROUNDDOWN(entry->addr, PAGE_SIZE);
ffff80000010d500: 48 89 f7             	movq	%rsi, %rdi
ffff80000010d503: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff80000010d509: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = entry->len + (entry->addr - base);
ffff80000010d510: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
; 			end = ROUNDUP(base + end, PAGE_SIZE);
ffff80000010d515: 48 01 fe             	addq	%rdi, %rsi
ffff80000010d518: 48 81 c6 ff 0f 00 00 	addq	$4095, %rsi             # imm = 0xFFF
ffff80000010d51f: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 		entry->addr = base;
ffff80000010d526: 48 89 3c 10          	movq	%rdi, (%rax,%rdx)
; 		entry->len = end - base;
ffff80000010d52a: 48 29 fe             	subq	%rdi, %rsi
ffff80000010d52d: 48 89 74 10 08       	movq	%rsi, 8(%rax,%rdx)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d532: 48 83 c2 18          	addq	$24, %rdx
ffff80000010d536: 48 39 d1             	cmpq	%rdx, %rcx
ffff80000010d539: 74 20                	je	0xffff80000010d55b <align_boot_info+0x7b>
; 		switch (entry->type) {
ffff80000010d53b: 83 7c 10 10 01       	cmpl	$1, 16(%rax,%rdx)
ffff80000010d540: 48 8b 34 10          	movq	(%rax,%rdx), %rsi
; 		switch (entry->type) {
ffff80000010d544: 75 ba                	jne	0xffff80000010d500 <align_boot_info+0x20>
; 			base = ROUNDUP(entry->addr, PAGE_SIZE);
ffff80000010d546: 48 8d be ff 0f 00 00 	leaq	4095(%rsi), %rdi
ffff80000010d54d: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = ROUNDDOWN(base + end, PAGE_SIZE);
ffff80000010d554: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
ffff80000010d559: eb c4                	jmp	0xffff80000010d51f <align_boot_info+0x3f>
; }
ffff80000010d55b: 5d                   	popq	%rbp
ffff80000010d55c: c3                   	retq
ffff80000010d55d: 0f 1f 00             	nopl	(%rax)

ffff80000010d560 <show_boot_mmap>:
; {
ffff80000010d560: 55                   	pushq	%rbp
ffff80000010d561: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d564: 41 57                	pushq	%r15
ffff80000010d566: 41 56                	pushq	%r14
ffff80000010d568: 41 55                	pushq	%r13
ffff80000010d56a: 41 54                	pushq	%r12
ffff80000010d56c: 53                   	pushq	%rbx
ffff80000010d56d: 50                   	pushq	%rax
ffff80000010d56e: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010d571: 8b 3f                	movl	(%rdi), %edi
ffff80000010d573: 48 b8 20 d6 10 00 00 80 ff ff	movabsq	$-140737487251936, %rax # imm = 0xFFFF80000010D620
ffff80000010d57d: ff d0                	callq	*%rax
ffff80000010d57f: 49 89 c5             	movq	%rax, %r13
; 	cprintf("Boot memory map:\n");
ffff80000010d582: 48 bf da 57 11 00 00 80 ff ff	movabsq	$-140737487218726, %rdi # imm = 0xFFFF8000001157DA
ffff80000010d58c: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d596: 31 c0                	xorl	%eax, %eax
ffff80000010d598: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d59a: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d59f: 74 6a                	je	0xffff80000010d60b <show_boot_mmap+0xab>
ffff80000010d5a1: 49 83 c5 10          	addq	$16, %r13
ffff80000010d5a5: 49 bf ec 57 11 00 00 80 ff ff	movabsq	$-140737487218708, %r15 # imm = 0xFFFF8000001157EC
ffff80000010d5af: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010d5b2: 48 bb 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rbx # imm = 0xFFFF80000010D400
ffff80000010d5bc: eb 25                	jmp	0xffff80000010d5e3 <show_boot_mmap+0x83>
ffff80000010d5be: 66 90                	nop
; 			entry->addr,
ffff80000010d5c0: 49 8b 75 f0          	movq	-16(%r13), %rsi
ffff80000010d5c4: 49 8b 55 f8          	movq	-8(%r13), %rdx
; 			entry->addr + entry->len,
ffff80000010d5c8: 48 01 f2             	addq	%rsi, %rdx
; 		cprintf("  %016p - %016p [%s]\n",
ffff80000010d5cb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010d5ce: 31 c0                	xorl	%eax, %eax
ffff80000010d5d0: ff d3                	callq	*%rbx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d5d2: 49 83 c4 01          	addq	$1, %r12
ffff80000010d5d6: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010d5da: 49 83 c5 18          	addq	$24, %r13
ffff80000010d5de: 49 39 c4             	cmpq	%rax, %r12
ffff80000010d5e1: 73 28                	jae	0xffff80000010d60b <show_boot_mmap+0xab>
; 		switch (entry->type) {
ffff80000010d5e3: 41 8b 45 00          	movl	(%r13), %eax
ffff80000010d5e7: 83 c0 ff             	addl	$-1, %eax
ffff80000010d5ea: 48 b9 62 4f 11 00 00 80 ff ff	movabsq	$-140737487220894, %rcx # imm = 0xFFFF800000114F62
ffff80000010d5f4: 83 f8 04             	cmpl	$4, %eax
ffff80000010d5f7: 77 c7                	ja	0xffff80000010d5c0 <show_boot_mmap+0x60>
ffff80000010d5f9: 48 98                	cltq
ffff80000010d5fb: 48 b9 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rcx # imm = 0xFFFF8000001142E0
ffff80000010d605: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff80000010d609: eb b5                	jmp	0xffff80000010d5c0 <show_boot_mmap+0x60>
; }
ffff80000010d60b: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d60f: 5b                   	popq	%rbx
ffff80000010d610: 41 5c                	popq	%r12
ffff80000010d612: 41 5d                	popq	%r13
ffff80000010d614: 41 5e                	popq	%r14
ffff80000010d616: 41 5f                	popq	%r15
ffff80000010d618: 5d                   	popq	%rbp
ffff80000010d619: c3                   	retq
ffff80000010d61a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010d620 <_kaddr>:
; {
ffff80000010d620: 55                   	pushq	%rbp
ffff80000010d621: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d624: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010d627: 48 89 f9             	movq	%rdi, %rcx
ffff80000010d62a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010d62e: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff80000010d638: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010d63b: 73 0f                	jae	0xffff80000010d64c <_kaddr+0x2c>
ffff80000010d63d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010d647: 48 01 c8             	addq	%rcx, %rax
ffff80000010d64a: 5d                   	popq	%rbp
ffff80000010d64b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010d64c: 48 bf 22 59 11 00 00 80 ff ff	movabsq	$-140737487218398, %rdi # imm = 0xFFFF800000115922
ffff80000010d656: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff80000010d660: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010d66a: be 5d 00 00 00       	movl	$93, %esi
ffff80000010d66f: 48 89 c1             	movq	%rax, %rcx
ffff80000010d672: 31 c0                	xorl	%eax, %eax
ffff80000010d674: 41 ff d0             	callq	*%r8
ffff80000010d677: cc                   	int3
ffff80000010d678: cc                   	int3
ffff80000010d679: cc                   	int3
ffff80000010d67a: cc                   	int3
ffff80000010d67b: cc                   	int3
ffff80000010d67c: cc                   	int3
ffff80000010d67d: cc                   	int3
ffff80000010d67e: cc                   	int3
ffff80000010d67f: cc                   	int3

ffff80000010d680 <count_free_pages>:
; {
ffff80000010d680: 55                   	pushq	%rbp
ffff80000010d681: 48 89 e5             	movq	%rsp, %rbp
; 	if (order >= BUDDY_MAX_ORDER) {
ffff80000010d684: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010d688: 76 04                	jbe	0xffff80000010d68e <count_free_pages+0xe>
ffff80000010d68a: 31 c0                	xorl	%eax, %eax
; }
ffff80000010d68c: 5d                   	popq	%rbp
ffff80000010d68d: c3                   	retq
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d68e: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010d692: 48 b9 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %rcx # imm = 0xFFFF80000011A240
ffff80000010d69c: 48 01 f9             	addq	%rdi, %rcx
ffff80000010d69f: 48 c7 c0 ff ff ff ff 	movq	$-1, %rax
ffff80000010d6a6: 48 89 ca             	movq	%rcx, %rdx
ffff80000010d6a9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010d6b0: 48 8b 12             	movq	(%rdx), %rdx
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d6b3: 48 83 c0 01          	addq	$1, %rax
ffff80000010d6b7: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010d6ba: 75 f4                	jne	0xffff80000010d6b0 <count_free_pages+0x30>
; }
ffff80000010d6bc: 5d                   	popq	%rbp
ffff80000010d6bd: c3                   	retq
ffff80000010d6be: 66 90                	nop

ffff80000010d6c0 <show_buddy_info>:
; {
ffff80000010d6c0: 55                   	pushq	%rbp
ffff80000010d6c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d6c4: 41 57                	pushq	%r15
ffff80000010d6c6: 41 56                	pushq	%r14
ffff80000010d6c8: 41 55                	pushq	%r13
ffff80000010d6ca: 41 54                	pushq	%r12
ffff80000010d6cc: 53                   	pushq	%rbx
ffff80000010d6cd: 50                   	pushq	%rax
; 	cprintf("Buddy allocator:\n");
ffff80000010d6ce: 48 bf b9 4d 11 00 00 80 ff ff	movabsq	$-140737487221319, %rdi # imm = 0xFFFF800000114DB9
ffff80000010d6d8: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d6e2: 31 c0                	xorl	%eax, %eax
ffff80000010d6e4: ff d1                	callq	*%rcx
ffff80000010d6e6: 49 bd 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %r13 # imm = 0xFFFF80000010D680
ffff80000010d6f0: 49 be 03 56 11 00 00 80 ff ff	movabsq	$-140737487219197, %r14 # imm = 0xFFFF800000115603
ffff80000010d6fa: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010d6fd: 31 db                	xorl	%ebx, %ebx
ffff80000010d6ff: 90                   	nop
; 		nfree_pages = count_free_pages(order);
ffff80000010d700: 48 89 df             	movq	%rbx, %rdi
ffff80000010d703: 41 ff d5             	callq	*%r13
ffff80000010d706: 49 89 c4             	movq	%rax, %r12
; 		cprintf("  order #%u pages=%u\n", order, nfree_pages);
ffff80000010d709: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d70c: 48 89 de             	movq	%rbx, %rsi
ffff80000010d70f: 48 89 c2             	movq	%rax, %rdx
ffff80000010d712: 31 c0                	xorl	%eax, %eax
ffff80000010d714: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d71e: ff d1                	callq	*%rcx
; 		nfree += nfree_pages * (1 << (order + 12));
ffff80000010d720: 8d 4b 0c             	leal	12(%rbx), %ecx
ffff80000010d723: b8 01 00 00 00       	movl	$1, %eax
ffff80000010d728: d3 e0                	shll	%cl, %eax
ffff80000010d72a: 49 0f af c4          	imulq	%r12, %rax
ffff80000010d72e: 49 01 c7             	addq	%rax, %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d731: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d735: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d739: 75 c5                	jne	0xffff80000010d700 <show_buddy_info+0x40>
; 	cprintf("  free: %u kiB\n", nfree / 1024);
ffff80000010d73b: 49 c1 ef 0a          	shrq	$10, %r15
ffff80000010d73f: 48 bf 2e 4b 11 00 00 80 ff ff	movabsq	$-140737487221970, %rdi # imm = 0xFFFF800000114B2E
ffff80000010d749: 4c 89 fe             	movq	%r15, %rsi
ffff80000010d74c: 31 c0                	xorl	%eax, %eax
ffff80000010d74e: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d758: ff d1                	callq	*%rcx
; }
ffff80000010d75a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d75e: 5b                   	popq	%rbx
ffff80000010d75f: 41 5c                	popq	%r12
ffff80000010d761: 41 5d                	popq	%r13
ffff80000010d763: 41 5e                	popq	%r14
ffff80000010d765: 41 5f                	popq	%r15
ffff80000010d767: 5d                   	popq	%rbp
ffff80000010d768: c3                   	retq
ffff80000010d769: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d770 <count_total_free_pages>:
; {
ffff80000010d770: 55                   	pushq	%rbp
ffff80000010d771: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d774: 41 57                	pushq	%r15
ffff80000010d776: 41 56                	pushq	%r14
ffff80000010d778: 53                   	pushq	%rbx
ffff80000010d779: 50                   	pushq	%rax
ffff80000010d77a: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010d77d: 49 bf 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %r15 # imm = 0xFFFF80000010D680
ffff80000010d787: 31 db                	xorl	%ebx, %ebx
ffff80000010d789: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		nfree_pages = count_free_pages(order);
ffff80000010d790: 48 89 df             	movq	%rbx, %rdi
ffff80000010d793: 41 ff d7             	callq	*%r15
; 		nfree += nfree_pages * (1 << order);
ffff80000010d796: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d79b: 89 d9                	movl	%ebx, %ecx
ffff80000010d79d: d3 e2                	shll	%cl, %edx
ffff80000010d79f: 48 0f af d0          	imulq	%rax, %rdx
ffff80000010d7a3: 49 01 d6             	addq	%rdx, %r14
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d7a6: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d7aa: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d7ae: 75 e0                	jne	0xffff80000010d790 <count_total_free_pages+0x20>
; 	return nfree;
ffff80000010d7b0: 4c 89 f0             	movq	%r14, %rax
ffff80000010d7b3: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d7b7: 5b                   	popq	%rbx
ffff80000010d7b8: 41 5e                	popq	%r14
ffff80000010d7ba: 41 5f                	popq	%r15
ffff80000010d7bc: 5d                   	popq	%rbp
ffff80000010d7bd: c3                   	retq
ffff80000010d7be: 66 90                	nop

ffff80000010d7c0 <buddy_split>:
; {
ffff80000010d7c0: 55                   	pushq	%rbp
ffff80000010d7c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d7c4: 41 57                	pushq	%r15
ffff80000010d7c6: 41 56                	pushq	%r14
ffff80000010d7c8: 41 55                	pushq	%r13
ffff80000010d7ca: 41 54                	pushq	%r12
ffff80000010d7cc: 53                   	pushq	%rbx
ffff80000010d7cd: 50                   	pushq	%rax
; 	assert(lhs->pp_order >= req_order);
ffff80000010d7ce: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010d7d2: 83 e0 7f             	andl	$127, %eax
ffff80000010d7d5: 48 39 f0             	cmpq	%rsi, %rax
ffff80000010d7d8: 0f 82 b0 00 00 00    	jb	0xffff80000010d88e <buddy_split+0xce>
ffff80000010d7de: 49 89 f6             	movq	%rsi, %r14
ffff80000010d7e1: 49 89 ff             	movq	%rdi, %r15
; 	while(lhs->pp_order > req_order){
ffff80000010d7e4: 0f b6 5f 12          	movzbl	18(%rdi), %ebx
ffff80000010d7e8: 83 e3 7f             	andl	$127, %ebx
ffff80000010d7eb: 48 39 f3             	cmpq	%rsi, %rbx
ffff80000010d7ee: 0f 86 88 00 00 00    	jbe	0xffff80000010d87c <buddy_split+0xbc>
ffff80000010d7f4: 49 bc 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r12 # imm = 0xFFFF80000011A240
ffff80000010d7fe: 49 bd 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %r13 # imm = 0xFFFF80000010F270
ffff80000010d808: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		physaddr_t page_addr = page2pa(lhs);
ffff80000010d810: 4c 89 ff             	movq	%r15, %rdi
ffff80000010d813: 48 b8 c0 d8 10 00 00 80 ff ff	movabsq	$-140737487251264, %rax # imm = 0xFFFF80000010D8C0
ffff80000010d81d: ff d0                	callq	*%rax
; 		physaddr_t buddy_addr = page_addr ^ (1 << (lhs->pp_order + PAGE_TABLE_SHIFT - 1));
ffff80000010d81f: 80 c3 0b             	addb	$11, %bl
ffff80000010d822: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d827: 89 d9                	movl	%ebx, %ecx
ffff80000010d829: d3 e2                	shll	%cl, %edx
ffff80000010d82b: 48 63 fa             	movslq	%edx, %rdi
ffff80000010d82e: 48 31 c7             	xorq	%rax, %rdi
; 		struct page_info *buddy = pa2page(buddy_addr);
ffff80000010d831: 48 b8 e0 d8 10 00 00 80 ff ff	movabsq	$-140737487251232, %rax # imm = 0xFFFF80000010D8E0
ffff80000010d83b: ff d0                	callq	*%rax
; 		buddy->pp_order = lhs->pp_order - 1;
ffff80000010d83d: 41 0f b6 4f 12       	movzbl	18(%r15), %ecx
ffff80000010d842: 80 c1 ff             	addb	$-1, %cl
; 		buddy->pp_free = true;
ffff80000010d845: 80 c9 80             	orb	$-128, %cl
ffff80000010d848: 88 48 12             	movb	%cl, 18(%rax)
; 		lhs->pp_order--;
ffff80000010d84b: 41 0f b6 4f 12       	movzbl	18(%r15), %ecx
ffff80000010d850: 8d 51 ff             	leal	-1(%rcx), %edx
ffff80000010d853: 80 e2 7f             	andb	$127, %dl
ffff80000010d856: 80 e1 80             	andb	$-128, %cl
ffff80000010d859: 08 d1                	orb	%dl, %cl
ffff80000010d85b: 41 88 4f 12          	movb	%cl, 18(%r15)
; 		list_add(&buddy_free_list[lhs->pp_order], &buddy->pp_node);
ffff80000010d85f: 0f b6 fa             	movzbl	%dl, %edi
ffff80000010d862: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010d866: 4c 01 e7             	addq	%r12, %rdi
ffff80000010d869: 48 89 c6             	movq	%rax, %rsi
ffff80000010d86c: 41 ff d5             	callq	*%r13
; 	while(lhs->pp_order > req_order){
ffff80000010d86f: 41 0f b6 5f 12       	movzbl	18(%r15), %ebx
ffff80000010d874: 80 e3 7f             	andb	$127, %bl
ffff80000010d877: 44 38 f3             	cmpb	%r14b, %bl
ffff80000010d87a: 77 94                	ja	0xffff80000010d810 <buddy_split+0x50>
; 	return lhs;
ffff80000010d87c: 4c 89 f8             	movq	%r15, %rax
ffff80000010d87f: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d883: 5b                   	popq	%rbx
ffff80000010d884: 41 5c                	popq	%r12
ffff80000010d886: 41 5d                	popq	%r13
ffff80000010d888: 41 5e                	popq	%r14
ffff80000010d88a: 41 5f                	popq	%r15
ffff80000010d88c: 5d                   	popq	%rbp
ffff80000010d88d: c3                   	retq
; 	assert(lhs->pp_order >= req_order);
ffff80000010d88e: 48 bf 5b 4e 11 00 00 80 ff ff	movabsq	$-140737487221157, %rdi # imm = 0xFFFF800000114E5B
ffff80000010d898: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010d8a2: 48 b9 a6 52 11 00 00 80 ff ff	movabsq	$-140737487220058, %rcx # imm = 0xFFFF8000001152A6
ffff80000010d8ac: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010d8b6: be 5f 00 00 00       	movl	$95, %esi
ffff80000010d8bb: 31 c0                	xorl	%eax, %eax
ffff80000010d8bd: ff d3                	callq	*%rbx
ffff80000010d8bf: 90                   	nop

ffff80000010d8c0 <page2pa>:
; {
ffff80000010d8c0: 55                   	pushq	%rbp
ffff80000010d8c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d8c4: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010d8c7: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010d8d1: 48 2b 01             	subq	(%rcx), %rax
ffff80000010d8d4: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010d8d8: 5d                   	popq	%rbp
ffff80000010d8d9: c3                   	retq
ffff80000010d8da: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010d8e0 <pa2page>:
; {
ffff80000010d8e0: 55                   	pushq	%rbp
ffff80000010d8e1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010d8e4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010d8e8: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010d8f2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010d8f5: 73 16                	jae	0xffff80000010d90d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010d8f7: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010d901: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010d905: 48 03 38             	addq	(%rax), %rdi
ffff80000010d908: 48 89 f8             	movq	%rdi, %rax
ffff80000010d90b: 5d                   	popq	%rbp
ffff80000010d90c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010d90d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010d917: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff80000010d921: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d92b: be 49 00 00 00       	movl	$73, %esi
ffff80000010d930: 31 c0                	xorl	%eax, %eax
ffff80000010d932: ff d1                	callq	*%rcx
ffff80000010d934: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d93e: 66 90                	nop

ffff80000010d940 <buddy_merge>:
; {
ffff80000010d940: 55                   	pushq	%rbp
ffff80000010d941: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d944: 41 57                	pushq	%r15
ffff80000010d946: 41 56                	pushq	%r14
ffff80000010d948: 41 55                	pushq	%r13
ffff80000010d94a: 41 54                	pushq	%r12
ffff80000010d94c: 53                   	pushq	%rbx
ffff80000010d94d: 48 83 ec 18          	subq	$24, %rsp
ffff80000010d951: 49 89 fd             	movq	%rdi, %r13
; 	unsigned int order = page->pp_order;
ffff80000010d954: 44 0f b6 67 12       	movzbl	18(%rdi), %r12d
ffff80000010d959: 41 83 e4 7f          	andl	$127, %r12d
ffff80000010d95d: 49 bf e0 d8 10 00 00 80 ff ff	movabsq	$-140737487251232, %r15 # imm = 0xFFFF80000010D8E0
ffff80000010d967: eb 12                	jmp	0xffff80000010d97b <buddy_merge+0x3b>
ffff80000010d969: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010d970: 49 89 cf             	movq	%rcx, %r15
; 		if(!buddy->pp_free){
ffff80000010d973: 84 c0                	testb	%al, %al
ffff80000010d975: 0f 89 57 01 00 00    	jns	0xffff80000010dad2 <buddy_merge+0x192>
; 	while(order < BUDDY_MAX_ORDER - 1){
ffff80000010d97b: 41 83 fc 08          	cmpl	$8, %r12d
ffff80000010d97f: 0f 87 4d 01 00 00    	ja	0xffff80000010dad2 <buddy_merge+0x192>
; 		physaddr_t page_addr = page2pa(page);
ffff80000010d985: 4c 89 ef             	movq	%r13, %rdi
ffff80000010d988: 48 b8 c0 d8 10 00 00 80 ff ff	movabsq	$-140737487251264, %rax # imm = 0xFFFF80000010D8C0
ffff80000010d992: ff d0                	callq	*%rax
ffff80000010d994: 49 89 c6             	movq	%rax, %r14
; 		physaddr_t buddy_addr = page_addr ^ (1 << (order + PAGE_TABLE_SHIFT));
ffff80000010d997: 41 8d 4c 24 0c       	leal	12(%r12), %ecx
ffff80000010d99c: bb 01 00 00 00       	movl	$1, %ebx
ffff80000010d9a1: d3 e3                	shll	%cl, %ebx
ffff80000010d9a3: 48 89 df             	movq	%rbx, %rdi
ffff80000010d9a6: 48 31 c7             	xorq	%rax, %rdi
; 		struct page_info *buddy = pa2page(buddy_addr);
ffff80000010d9a9: 41 ff d7             	callq	*%r15
ffff80000010d9ac: 4c 89 f9             	movq	%r15, %rcx
; 		struct page_info *buddy = pa2page(buddy_addr);
ffff80000010d9af: 49 89 c7             	movq	%rax, %r15
; 		if(!buddy->pp_free){
ffff80000010d9b2: 8a 40 12             	movb	18(%rax), %al
ffff80000010d9b5: 84 c0                	testb	%al, %al
ffff80000010d9b7: 79 b7                	jns	0xffff80000010d970 <buddy_merge+0x30>
ffff80000010d9b9: 88 45 d7             	movb	%al, -41(%rbp)
; 		physaddr_t merged_page_addr = page_addr & ~(1 << (order + PAGE_TABLE_SHIFT));
ffff80000010d9bc: f7 d3                	notl	%ebx
ffff80000010d9be: 48 63 c3             	movslq	%ebx, %rax
ffff80000010d9c1: 49 21 c6             	andq	%rax, %r14
; 		struct page_info *merged_page = pa2page(merged_page_addr);
ffff80000010d9c4: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d9c7: ff d1                	callq	*%rcx
ffff80000010d9c9: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		page->pp_free = false;
ffff80000010d9cd: 41 80 65 12 7f       	andb	$127, 18(%r13)
; 		buddy->pp_free = false;
ffff80000010d9d2: 41 80 67 12 7f       	andb	$127, 18(%r15)
ffff80000010d9d7: 4c 89 65 c0          	movq	%r12, -64(%rbp)
; 		list_foreach_safe(&buddy_free_list[order], entry, next){
ffff80000010d9db: 45 89 e6             	movl	%r12d, %r14d
ffff80000010d9de: 49 c1 e6 04          	shlq	$4, %r14
ffff80000010d9e2: 48 b8 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %rax # imm = 0xFFFF80000011A240
ffff80000010d9ec: 49 8b 3c 06          	movq	(%r14,%rax), %rdi
ffff80000010d9f0: 49 01 c6             	addq	%rax, %r14
ffff80000010d9f3: 4c 39 f7             	cmpq	%r14, %rdi
ffff80000010d9f6: 74 37                	je	0xffff80000010da2f <buddy_merge+0xef>
ffff80000010d9f8: 4c 89 eb             	movq	%r13, %rbx
ffff80000010d9fb: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010d9fe: eb 20                	jmp	0xffff80000010da20 <buddy_merge+0xe0>
; 				list_del(entry);
ffff80000010da00: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010da0a: ff d0                	callq	*%rax
; 				if(entries_removed == 2){
ffff80000010da0c: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010da10: 41 bd 01 00 00 00    	movl	$1, %r13d
ffff80000010da16: 74 7d                	je	0xffff80000010da95 <buddy_merge+0x155>
ffff80000010da18: 4c 89 e7             	movq	%r12, %rdi
; 		list_foreach_safe(&buddy_free_list[order], entry, next){
ffff80000010da1b: 4d 39 f4             	cmpq	%r14, %r12
ffff80000010da1e: 74 12                	je	0xffff80000010da32 <buddy_merge+0xf2>
ffff80000010da20: 4c 8b 27             	movq	(%rdi), %r12
; 			if(entry == &page->pp_node || entry == &buddy->pp_node){
ffff80000010da23: 48 39 df             	cmpq	%rbx, %rdi
ffff80000010da26: 74 d8                	je	0xffff80000010da00 <buddy_merge+0xc0>
ffff80000010da28: 4c 39 ff             	cmpq	%r15, %rdi
ffff80000010da2b: 75 eb                	jne	0xffff80000010da18 <buddy_merge+0xd8>
ffff80000010da2d: eb d1                	jmp	0xffff80000010da00 <buddy_merge+0xc0>
ffff80000010da2f: 45 31 ed             	xorl	%r13d, %r13d
; 		assert(entries_removed == 2);
ffff80000010da32: 41 83 fd 02          	cmpl	$2, %r13d
ffff80000010da36: 75 69                	jne	0xffff80000010daa1 <buddy_merge+0x161>
ffff80000010da38: 4c 8b 65 c0          	movq	-64(%rbp), %r12
; 		order++;
ffff80000010da3c: 41 83 c4 01          	addl	$1, %r12d
ffff80000010da40: 4c 8b 6d c8          	movq	-56(%rbp), %r13
; 		merged_page->pp_order = order;
ffff80000010da44: 41 8a 45 12          	movb	18(%r13), %al
ffff80000010da48: 44 89 e1             	movl	%r12d, %ecx
ffff80000010da4b: 80 e1 7f             	andb	$127, %cl
ffff80000010da4e: 24 80                	andb	$-128, %al
ffff80000010da50: 08 c8                	orb	%cl, %al
ffff80000010da52: 41 88 45 12          	movb	%al, 18(%r13)
; 		list_insert_before(&buddy_free_list[order], &merged_page->pp_node);
ffff80000010da56: 4c 89 e7             	movq	%r12, %rdi
ffff80000010da59: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010da5d: 48 b8 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %rax # imm = 0xFFFF80000011A240
ffff80000010da67: 48 01 c7             	addq	%rax, %rdi
ffff80000010da6a: 4c 89 ee             	movq	%r13, %rsi
ffff80000010da6d: 48 b8 30 f2 10 00 00 80 ff ff	movabsq	$-140737487244752, %rax # imm = 0xFFFF80000010F230
ffff80000010da77: ff d0                	callq	*%rax
; 		merged_page->pp_free = true;
ffff80000010da79: 41 80 4d 12 80       	orb	$-128, 18(%r13)
ffff80000010da7e: 49 bf e0 d8 10 00 00 80 ff ff	movabsq	$-140737487251232, %r15 # imm = 0xFFFF80000010D8E0
ffff80000010da88: 8a 45 d7             	movb	-41(%rbp), %al
; 		if(!buddy->pp_free){
ffff80000010da8b: 84 c0                	testb	%al, %al
ffff80000010da8d: 0f 88 e8 fe ff ff    	js	0xffff80000010d97b <buddy_merge+0x3b>
ffff80000010da93: eb 3d                	jmp	0xffff80000010dad2 <buddy_merge+0x192>
ffff80000010da95: 41 bd 02 00 00 00    	movl	$2, %r13d
; 		assert(entries_removed == 2);
ffff80000010da9b: 41 83 fd 02          	cmpl	$2, %r13d
ffff80000010da9f: 74 97                	je	0xffff80000010da38 <buddy_merge+0xf8>
ffff80000010daa1: 48 bf 5b 4e 11 00 00 80 ff ff	movabsq	$-140737487221157, %rdi # imm = 0xFFFF800000114E5B
ffff80000010daab: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010dab5: 48 b9 3e 4b 11 00 00 80 ff ff	movabsq	$-140737487221954, %rcx # imm = 0xFFFF800000114B3E
ffff80000010dabf: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010dac9: be a5 00 00 00       	movl	$165, %esi
ffff80000010dace: 31 c0                	xorl	%eax, %eax
ffff80000010dad0: ff d3                	callq	*%rbx
; 	return page;
ffff80000010dad2: 4c 89 e8             	movq	%r13, %rax
ffff80000010dad5: 48 83 c4 18          	addq	$24, %rsp
ffff80000010dad9: 5b                   	popq	%rbx
ffff80000010dada: 41 5c                	popq	%r12
ffff80000010dadc: 41 5d                	popq	%r13
ffff80000010dade: 41 5e                	popq	%r14
ffff80000010dae0: 41 5f                	popq	%r15
ffff80000010dae2: 5d                   	popq	%rbp
ffff80000010dae3: c3                   	retq
ffff80000010dae4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010daee: 66 90                	nop

ffff80000010daf0 <buddy_find>:
; {	
ffff80000010daf0: 55                   	pushq	%rbp
ffff80000010daf1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010daf4: 41 57                	pushq	%r15
ffff80000010daf6: 41 56                	pushq	%r14
ffff80000010daf8: 41 55                	pushq	%r13
ffff80000010dafa: 41 54                	pushq	%r12
ffff80000010dafc: 53                   	pushq	%rbx
ffff80000010dafd: 50                   	pushq	%rax
; 	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
ffff80000010dafe: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010db02: 77 45                	ja	0xffff80000010db49 <buddy_find+0x59>
ffff80000010db04: 49 89 ff             	movq	%rdi, %r15
; 	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
ffff80000010db07: 48 89 f8             	movq	%rdi, %rax
ffff80000010db0a: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010db0e: 49 bc 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r12 # imm = 0xFFFF80000011A240
ffff80000010db18: 49 01 c4             	addq	%rax, %r12
ffff80000010db1b: bb 0a 00 00 00       	movl	$10, %ebx
ffff80000010db20: 49 bd 90 db 10 00 00 80 ff ff	movabsq	$-140737487250544, %r13 # imm = 0xFFFF80000010DB90
ffff80000010db2a: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010db2d: 0f 1f 00             	nopl	(%rax)
; 		if(!list_is_empty(head)) {
ffff80000010db30: 4c 89 e7             	movq	%r12, %rdi
ffff80000010db33: 41 ff d5             	callq	*%r13
ffff80000010db36: 85 c0                	testl	%eax, %eax
ffff80000010db38: 74 14                	je	0xffff80000010db4e <buddy_find+0x5e>
; 	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
ffff80000010db3a: 48 83 c3 ff          	addq	$-1, %rbx
ffff80000010db3e: 49 83 c4 10          	addq	$16, %r12
ffff80000010db42: 49 39 df             	cmpq	%rbx, %r15
ffff80000010db45: 75 e9                	jne	0xffff80000010db30 <buddy_find+0x40>
ffff80000010db47: eb 2f                	jmp	0xffff80000010db78 <buddy_find+0x88>
ffff80000010db49: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010db4c: eb 2a                	jmp	0xffff80000010db78 <buddy_find+0x88>
; 			page = buddy_split(container_of(head->next, struct page_info, pp_node), req_order);
ffff80000010db4e: 4d 8b 34 24          	movq	(%r12), %r14
ffff80000010db52: 48 b8 c0 d7 10 00 00 80 ff ff	movabsq	$-140737487251520, %rax # imm = 0xFFFF80000010D7C0
ffff80000010db5c: 4c 89 f7             	movq	%r14, %rdi
ffff80000010db5f: 4c 89 fe             	movq	%r15, %rsi
ffff80000010db62: ff d0                	callq	*%rax
; 			list_del(&page->pp_node);
ffff80000010db64: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010db6e: 4c 89 f7             	movq	%r14, %rdi
ffff80000010db71: ff d0                	callq	*%rax
; 			page->pp_free = false;
ffff80000010db73: 41 80 66 12 7f       	andb	$127, 18(%r14)
; }
ffff80000010db78: 4c 89 f0             	movq	%r14, %rax
ffff80000010db7b: 48 83 c4 08          	addq	$8, %rsp
ffff80000010db7f: 5b                   	popq	%rbx
ffff80000010db80: 41 5c                	popq	%r12
ffff80000010db82: 41 5d                	popq	%r13
ffff80000010db84: 41 5e                	popq	%r14
ffff80000010db86: 41 5f                	popq	%r15
ffff80000010db88: 5d                   	popq	%rbp
ffff80000010db89: c3                   	retq
ffff80000010db8a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010db90 <list_is_empty>:
; {
ffff80000010db90: 55                   	pushq	%rbp
ffff80000010db91: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff80000010db94: 31 c0                	xorl	%eax, %eax
ffff80000010db96: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010db99: 0f 94 c0             	sete	%al
ffff80000010db9c: 5d                   	popq	%rbp
ffff80000010db9d: c3                   	retq
ffff80000010db9e: 66 90                	nop

ffff80000010dba0 <page_alloc>:
; {
ffff80000010dba0: 55                   	pushq	%rbp
ffff80000010dba1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dba4: 41 56                	pushq	%r14
ffff80000010dba6: 53                   	pushq	%rbx
ffff80000010dba7: 41 89 fe             	movl	%edi, %r14d
; 	page = buddy_find(0);
ffff80000010dbaa: 48 b8 f0 da 10 00 00 80 ff ff	movabsq	$-140737487250704, %rax # imm = 0xFFFF80000010DAF0
ffff80000010dbb4: 31 ff                	xorl	%edi, %edi
ffff80000010dbb6: ff d0                	callq	*%rax
ffff80000010dbb8: 48 89 c3             	movq	%rax, %rbx
ffff80000010dbbb: 41 f6 c6 01          	testb	$1, %r14b
; 	if(page) {
ffff80000010dbbf: 74 38                	je	0xffff80000010dbf9 <page_alloc+0x59>
ffff80000010dbc1: 48 85 db             	testq	%rbx, %rbx
ffff80000010dbc4: 74 33                	je	0xffff80000010dbf9 <page_alloc+0x59>
; 			memset(page2kva(page), 0, 1 << (page->pp_order + PAGE_TABLE_SHIFT));
ffff80000010dbc6: 48 b8 10 dc 10 00 00 80 ff ff	movabsq	$-140737487250416, %rax # imm = 0xFFFF80000010DC10
ffff80000010dbd0: 48 89 df             	movq	%rbx, %rdi
ffff80000010dbd3: ff d0                	callq	*%rax
ffff80000010dbd5: 8a 4b 12             	movb	18(%rbx), %cl
ffff80000010dbd8: 80 e1 7f             	andb	$127, %cl
ffff80000010dbdb: 80 c1 0c             	addb	$12, %cl
ffff80000010dbde: ba 01 00 00 00       	movl	$1, %edx
ffff80000010dbe3: d3 e2                	shll	%cl, %edx
ffff80000010dbe5: 48 63 d2             	movslq	%edx, %rdx
ffff80000010dbe8: 48 b9 a0 03 11 00 00 80 ff ff	movabsq	$-140737487240288, %rcx # imm = 0xFFFF8000001103A0
ffff80000010dbf2: 48 89 c7             	movq	%rax, %rdi
ffff80000010dbf5: 31 f6                	xorl	%esi, %esi
ffff80000010dbf7: ff d1                	callq	*%rcx
; 	return page;
ffff80000010dbf9: 48 89 d8             	movq	%rbx, %rax
ffff80000010dbfc: 5b                   	popq	%rbx
ffff80000010dbfd: 41 5e                	popq	%r14
ffff80000010dbff: 5d                   	popq	%rbp
ffff80000010dc00: c3                   	retq
ffff80000010dc01: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc0b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010dc10 <page2kva>:
; {
ffff80000010dc10: 55                   	pushq	%rbp
ffff80000010dc11: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff80000010dc14: 48 b8 c0 d8 10 00 00 80 ff ff	movabsq	$-140737487251264, %rax # imm = 0xFFFF80000010D8C0
ffff80000010dc1e: ff d0                	callq	*%rax
ffff80000010dc20: 48 b9 f0 de 10 00 00 80 ff ff	movabsq	$-140737487249680, %rcx # imm = 0xFFFF80000010DEF0
ffff80000010dc2a: 48 89 c7             	movq	%rax, %rdi
ffff80000010dc2d: ff d1                	callq	*%rcx
ffff80000010dc2f: 5d                   	popq	%rbp
ffff80000010dc30: c3                   	retq
ffff80000010dc31: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010dc40 <page_free>:
; {
ffff80000010dc40: 55                   	pushq	%rbp
ffff80000010dc41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc44: 53                   	pushq	%rbx
ffff80000010dc45: 50                   	pushq	%rax
; 	if(pp->pp_ref != 0){
ffff80000010dc46: 66 83 7f 10 00       	cmpw	$0, 16(%rdi)
ffff80000010dc4b: 75 47                	jne	0xffff80000010dc94 <page_free+0x54>
ffff80000010dc4d: 48 89 fb             	movq	%rdi, %rbx
; 	list_insert_before(&buddy_free_list[pp->pp_order], &pp->pp_node);
ffff80000010dc50: 0f b6 47 12          	movzbl	18(%rdi), %eax
; 	pp->pp_free = true;
ffff80000010dc54: 89 c1                	movl	%eax, %ecx
ffff80000010dc56: 83 e1 7f             	andl	$127, %ecx
ffff80000010dc59: 0c 80                	orb	$-128, %al
ffff80000010dc5b: 88 47 12             	movb	%al, 18(%rdi)
; 	list_insert_before(&buddy_free_list[pp->pp_order], &pp->pp_node);
ffff80000010dc5e: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010dc62: 48 bf 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %rdi # imm = 0xFFFF80000011A240
ffff80000010dc6c: 48 01 cf             	addq	%rcx, %rdi
ffff80000010dc6f: 48 b8 30 f2 10 00 00 80 ff ff	movabsq	$-140737487244752, %rax # imm = 0xFFFF80000010F230
ffff80000010dc79: 48 89 de             	movq	%rbx, %rsi
ffff80000010dc7c: ff d0                	callq	*%rax
; 	buddy_merge(pp);
ffff80000010dc7e: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010dc88: 48 89 df             	movq	%rbx, %rdi
ffff80000010dc8b: ff d0                	callq	*%rax
; }
ffff80000010dc8d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dc91: 5b                   	popq	%rbx
ffff80000010dc92: 5d                   	popq	%rbp
ffff80000010dc93: c3                   	retq
; 		panic("page_free called on page that is still in use");
ffff80000010dc94: 48 bf 5b 4e 11 00 00 80 ff ff	movabsq	$-140737487221157, %rdi # imm = 0xFFFF800000114E5B
ffff80000010dc9e: 48 ba 19 56 11 00 00 80 ff ff	movabsq	$-140737487219175, %rdx # imm = 0xFFFF800000115619
ffff80000010dca8: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010dcb2: be f7 00 00 00       	movl	$247, %esi
ffff80000010dcb7: 31 c0                	xorl	%eax, %eax
ffff80000010dcb9: ff d1                	callq	*%rcx
ffff80000010dcbb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010dcc0 <page_decref>:
; {
ffff80000010dcc0: 55                   	pushq	%rbp
ffff80000010dcc1: 48 89 e5             	movq	%rsp, %rbp
; 	if (--pp->pp_ref == 0) {
ffff80000010dcc4: 66 83 47 10 ff       	addw	$-1, 16(%rdi)
ffff80000010dcc9: 74 02                	je	0xffff80000010dccd <page_decref+0xd>
; }
ffff80000010dccb: 5d                   	popq	%rbp
ffff80000010dccc: c3                   	retq
; 		page_free(pp);
ffff80000010dccd: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010dcd7: ff d0                	callq	*%rax
; }
ffff80000010dcd9: 5d                   	popq	%rbp
ffff80000010dcda: c3                   	retq
ffff80000010dcdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010dce0 <buddy_migrate>:
; {
ffff80000010dce0: 55                   	pushq	%rbp
ffff80000010dce1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dce4: 41 57                	pushq	%r15
ffff80000010dce6: 41 56                	pushq	%r14
ffff80000010dce8: 41 55                	pushq	%r13
ffff80000010dcea: 41 54                	pushq	%r12
ffff80000010dcec: 53                   	pushq	%rbx
ffff80000010dced: 50                   	pushq	%rax
ffff80000010dcee: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010dcf8: 4c 8b 20             	movq	(%rax), %r12
ffff80000010dcfb: 49 bf b0 dd 10 00 00 80 ff ff	movabsq	$-140737487250000, %r15 # imm = 0xFFFF80000010DDB0
ffff80000010dd05: 49 be e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %r14 # imm = 0xFFFF80000011A2E8
; 	for (i = 0; i < npages; ++i) {
ffff80000010dd0f: 4d 85 e4             	testq	%r12, %r12
ffff80000010dd12: 74 33                	je	0xffff80000010dd47 <buddy_migrate+0x67>
ffff80000010dd14: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010dd19: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		page = pages + i;
ffff80000010dd20: 4d 8b 2e             	movq	(%r14), %r13
; 		node->next = update_ptr(node->next);
ffff80000010dd23: 49 8b 7c 1d f8       	movq	-8(%r13,%rbx), %rdi
ffff80000010dd28: 41 ff d7             	callq	*%r15
ffff80000010dd2b: 49 89 44 1d f8       	movq	%rax, -8(%r13,%rbx)
; 		node->prev = update_ptr(node->prev);
ffff80000010dd30: 49 8b 7c 1d 00       	movq	(%r13,%rbx), %rdi
ffff80000010dd35: 41 ff d7             	callq	*%r15
ffff80000010dd38: 49 89 44 1d 00       	movq	%rax, (%r13,%rbx)
; 	for (i = 0; i < npages; ++i) {
ffff80000010dd3d: 48 83 c3 20          	addq	$32, %rbx
ffff80000010dd41: 49 83 c4 ff          	addq	$-1, %r12
ffff80000010dd45: 75 d9                	jne	0xffff80000010dd20 <buddy_migrate+0x40>
ffff80000010dd47: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010dd4c: 49 bc 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r12 # imm = 0xFFFF80000011A240
ffff80000010dd56: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		node->next = update_ptr(node->next);
ffff80000010dd60: 4a 8b 7c 23 f8       	movq	-8(%rbx,%r12), %rdi
ffff80000010dd65: 41 ff d7             	callq	*%r15
ffff80000010dd68: 4a 89 44 23 f8       	movq	%rax, -8(%rbx,%r12)
; 		node->prev = update_ptr(node->prev);
ffff80000010dd6d: 4a 8b 3c 23          	movq	(%rbx,%r12), %rdi
ffff80000010dd71: 41 ff d7             	callq	*%r15
ffff80000010dd74: 4a 89 04 23          	movq	%rax, (%rbx,%r12)
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010dd78: 48 83 c3 10          	addq	$16, %rbx
ffff80000010dd7c: 48 81 fb a8 00 00 00 	cmpq	$168, %rbx
ffff80000010dd83: 75 db                	jne	0xffff80000010dd60 <buddy_migrate+0x80>
ffff80000010dd85: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
; 	pages = (struct page_info *)KPAGES;
ffff80000010dd8f: 49 89 06             	movq	%rax, (%r14)
; }
ffff80000010dd92: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dd96: 5b                   	popq	%rbx
ffff80000010dd97: 41 5c                	popq	%r12
ffff80000010dd99: 41 5d                	popq	%r13
ffff80000010dd9b: 41 5e                	popq	%r14
ffff80000010dd9d: 41 5f                	popq	%r15
ffff80000010dd9f: 5d                   	popq	%rbp
ffff80000010dda0: c3                   	retq
ffff80000010dda1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ddab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ddb0 <update_ptr>:
; {
ffff80000010ddb0: 55                   	pushq	%rbp
ffff80000010ddb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ddb4: 53                   	pushq	%rbx
ffff80000010ddb5: 50                   	pushq	%rax
ffff80000010ddb6: 48 89 fb             	movq	%rdi, %rbx
; 	if (!in_page_range(p))
ffff80000010ddb9: 48 b8 50 df 10 00 00 80 ff ff	movabsq	$-140737487249584, %rax # imm = 0xFFFF80000010DF50
ffff80000010ddc3: ff d0                	callq	*%rax
ffff80000010ddc5: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010ddcf: 48 89 da             	movq	%rbx, %rdx
ffff80000010ddd2: 48 2b 11             	subq	(%rcx), %rdx
ffff80000010ddd5: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff80000010dddf: 48 01 d1             	addq	%rdx, %rcx
ffff80000010dde2: 85 c0                	testl	%eax, %eax
ffff80000010dde4: 48 0f 44 cb          	cmoveq	%rbx, %rcx
; }
ffff80000010dde8: 48 89 c8             	movq	%rcx, %rax
ffff80000010ddeb: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ddef: 5b                   	popq	%rbx
ffff80000010ddf0: 5d                   	popq	%rbp
ffff80000010ddf1: c3                   	retq
ffff80000010ddf2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ddfc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010de00 <buddy_map_chunk>:
; {
ffff80000010de00: 55                   	pushq	%rbp
ffff80000010de01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010de04: 41 57                	pushq	%r15
ffff80000010de06: 41 56                	pushq	%r14
ffff80000010de08: 41 55                	pushq	%r13
ffff80000010de0a: 41 54                	pushq	%r12
ffff80000010de0c: 53                   	pushq	%rbx
ffff80000010de0d: 50                   	pushq	%rax
ffff80000010de0e: 49 89 fc             	movq	%rdi, %r12
; 	index = ROUNDDOWN(index, nblocks);
ffff80000010de11: 48 81 e6 00 fe ff ff 	andq	$-512, %rsi             # imm = 0xFE00
; 	base = pages + index;
ffff80000010de18: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010de22: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010de26: 49 89 f5             	movq	%rsi, %r13
ffff80000010de29: 49 c1 e5 05          	shlq	$5, %r13
ffff80000010de2d: 4c 03 28             	addq	(%rax), %r13
ffff80000010de30: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010de33: 49 bf 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %r15 # imm = 0x8000000000000003
ffff80000010de3d: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010de42: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010de4c: 0f 1f 40 00          	nopl	(%rax)
; 		page = page_alloc(ALLOC_ZERO);
ffff80000010de50: bf 01 00 00 00       	movl	$1, %edi
ffff80000010de55: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff80000010de5f: ff d0                	callq	*%rax
; 		if (!page) {
ffff80000010de61: 48 85 c0             	testq	%rax, %rax
ffff80000010de64: 74 78                	je	0xffff80000010dede <buddy_map_chunk+0xde>
; 		++page->pp_ref;
ffff80000010de66: 66 83 40 10 01       	addw	$1, 16(%rax)
; 		if (page_insert(pml4, page, (char *)base + i * PAGE_SIZE,
ffff80000010de6b: 4b 8d 14 2e          	leaq	(%r14,%r13), %rdx
ffff80000010de6f: 4c 89 e7             	movq	%r12, %rdi
ffff80000010de72: 48 89 c6             	movq	%rax, %rsi
ffff80000010de75: 4c 89 f9             	movq	%r15, %rcx
ffff80000010de78: 48 b8 20 08 11 00 00 80 ff ff	movabsq	$-140737487239136, %rax # imm = 0xFFFF800000110820
ffff80000010de82: ff d0                	callq	*%rax
; 		    PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC) < 0) {
ffff80000010de84: 85 c0                	testl	%eax, %eax
; 		if (page_insert(pml4, page, (char *)base + i * PAGE_SIZE,
ffff80000010de86: 78 56                	js	0xffff80000010dede <buddy_map_chunk+0xde>
; 	for (i = 0; i < nalloc; ++i) {
ffff80000010de88: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
ffff80000010de8f: 49 81 fe 00 40 00 00 	cmpq	$16384, %r14            # imm = 0x4000
ffff80000010de96: 75 b8                	jne	0xffff80000010de50 <buddy_map_chunk+0x50>
ffff80000010de98: 31 db                	xorl	%ebx, %ebx
ffff80000010de9a: 49 be 00 f2 10 00 00 80 ff ff	movabsq	$-140737487244800, %r14 # imm = 0xFFFF80000010F200
ffff80000010dea4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010deae: 66 90                	nop
; 		list_init(&page->pp_node);
ffff80000010deb0: 4a 8d 3c 2b          	leaq	(%rbx,%r13), %rdi
ffff80000010deb4: 41 ff d6             	callq	*%r14
; 	for (i = 0; i < nblocks; ++i) {
ffff80000010deb7: 48 83 c3 20          	addq	$32, %rbx
ffff80000010debb: 48 81 fb 00 40 00 00 	cmpq	$16384, %rbx            # imm = 0x4000
ffff80000010dec2: 75 ec                	jne	0xffff80000010deb0 <buddy_map_chunk+0xb0>
ffff80000010dec4: 48 8b 4d d0          	movq	-48(%rbp), %rcx
; 	npages = index + nblocks;
ffff80000010dec8: 48 81 c1 00 02 00 00 	addq	$512, %rcx              # imm = 0x200
ffff80000010decf: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010ded9: 48 89 08             	movq	%rcx, (%rax)
ffff80000010dedc: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010dede: 89 d8                	movl	%ebx, %eax
ffff80000010dee0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dee4: 5b                   	popq	%rbx
ffff80000010dee5: 41 5c                	popq	%r12
ffff80000010dee7: 41 5d                	popq	%r13
ffff80000010dee9: 41 5e                	popq	%r14
ffff80000010deeb: 41 5f                	popq	%r15
ffff80000010deed: 5d                   	popq	%rbp
ffff80000010deee: c3                   	retq
ffff80000010deef: 90                   	nop

ffff80000010def0 <_kaddr>:
; {
ffff80000010def0: 55                   	pushq	%rbp
ffff80000010def1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010def4: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010def7: 48 89 f9             	movq	%rdi, %rcx
ffff80000010defa: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010defe: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff80000010df08: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010df0b: 73 0f                	jae	0xffff80000010df1c <_kaddr+0x2c>
ffff80000010df0d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010df17: 48 01 c8             	addq	%rcx, %rax
ffff80000010df1a: 5d                   	popq	%rbp
ffff80000010df1b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010df1c: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010df26: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff80000010df30: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010df3a: be 50 00 00 00       	movl	$80, %esi
ffff80000010df3f: 48 89 c1             	movq	%rax, %rcx
ffff80000010df42: 31 c0                	xorl	%eax, %eax
ffff80000010df44: 41 ff d0             	callq	*%r8
ffff80000010df47: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010df50 <in_page_range>:
; {
ffff80000010df50: 55                   	pushq	%rbp
ffff80000010df51: 48 89 e5             	movq	%rsp, %rbp
; 	return ((uintptr_t)pages <= (uintptr_t)p &&
ffff80000010df54: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010df5e: 48 8b 00             	movq	(%rax), %rax
ffff80000010df61: 48 39 f8             	cmpq	%rdi, %rax
ffff80000010df64: 0f 96 c1             	setbe	%cl
ffff80000010df67: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff80000010df71: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010df74: 48 c1 e2 05          	shlq	$5, %rdx
ffff80000010df78: 48 01 c2             	addq	%rax, %rdx
ffff80000010df7b: 48 39 fa             	cmpq	%rdi, %rdx
ffff80000010df7e: 0f 97 c0             	seta	%al
ffff80000010df81: 20 c8                	andb	%cl, %al
ffff80000010df83: 0f b6 c0             	movzbl	%al, %eax
ffff80000010df86: 5d                   	popq	%rbp
ffff80000010df87: c3                   	retq
ffff80000010df88: cc                   	int3
ffff80000010df89: cc                   	int3
ffff80000010df8a: cc                   	int3
ffff80000010df8b: cc                   	int3
ffff80000010df8c: cc                   	int3
ffff80000010df8d: cc                   	int3
ffff80000010df8e: cc                   	int3
ffff80000010df8f: cc                   	int3

ffff80000010df90 <pml4_setup>:
; {
ffff80000010df90: 55                   	pushq	%rbp
ffff80000010df91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010df94: 41 57                	pushq	%r15
ffff80000010df96: 41 56                	pushq	%r14
ffff80000010df98: 41 55                	pushq	%r13
ffff80000010df9a: 41 54                	pushq	%r12
ffff80000010df9c: 53                   	pushq	%rbx
ffff80000010df9d: 50                   	pushq	%rax
ffff80000010df9e: 48 89 fb             	movq	%rdi, %rbx
; 	page = page_alloc(ALLOC_ZERO);
ffff80000010dfa1: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff80000010dfab: bf 01 00 00 00       	movl	$1, %edi
ffff80000010dfb0: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010dfb2: 48 85 c0             	testq	%rax, %rax
ffff80000010dfb5: 0f 84 c6 00 00 00    	je	0xffff80000010e081 <pml4_setup+0xf1>
; 	kernel_pml4 = page2kva(page);
ffff80000010dfbb: 48 b9 b0 e0 10 00 00 80 ff ff	movabsq	$-140737487249232, %rcx # imm = 0xFFFF80000010E0B0
ffff80000010dfc5: 48 89 c7             	movq	%rax, %rdi
ffff80000010dfc8: ff d1                	callq	*%rcx
ffff80000010dfca: 49 bf f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r15 # imm = 0xFFFF80000011A2F0
ffff80000010dfd4: 49 89 07             	movq	%rax, (%r15)
; 	boot_map_kernel(kernel_pml4, (struct elf*) boot_info->elf_hdr);
ffff80000010dfd7: 48 8b 73 08          	movq	8(%rbx), %rsi
ffff80000010dfdb: 48 b9 60 0f 11 00 00 80 ff ff	movabsq	$-140737487237280, %rcx # imm = 0xFFFF800000110F60
ffff80000010dfe5: 48 89 c7             	movq	%rax, %rdi
ffff80000010dfe8: ff d1                	callq	*%rcx
; 	boot_map_region(kernel_pml4, (void*) KSTACK_TOP, KSTACK_SIZE, (physaddr_t) bootstack, kflags);
ffff80000010dfea: 49 8b 3f             	movq	(%r15), %rdi
ffff80000010dfed: 48 b9 00 10 10 00 00 00 00 00	movabsq	$1052672, %rcx  # imm = 0x101000
ffff80000010dff7: 49 bd b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %r13 # imm = 0xFFFF800000110DB0
ffff80000010e001: 48 be 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rsi # imm = 0xFFFFFE8000000000
ffff80000010e00b: 49 be 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %r14 # imm = 0x8000000000000003
ffff80000010e015: ba 00 80 00 00       	movl	$32768, %edx            # imm = 0x8000
ffff80000010e01a: 4d 89 f0             	movq	%r14, %r8
ffff80000010e01d: 41 ff d5             	callq	*%r13
; 	boot_map_region(kernel_pml4, (void*) KPAGES, npages * sizeof(struct page_info*), PADDR((void*)KPAGES), kflags);
ffff80000010e020: 4d 8b 3f             	movq	(%r15), %r15
ffff80000010e023: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010e02d: 48 8b 18             	movq	(%rax), %rbx
ffff80000010e030: 48 c1 e3 03          	shlq	$3, %rbx
ffff80000010e034: 48 b8 e0 e0 10 00 00 80 ff ff	movabsq	$-140737487249184, %rax # imm = 0xFFFF80000010E0E0
ffff80000010e03e: 49 bc 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %r12 # imm = 0xFFFFFF8000000000
ffff80000010e048: bf 32 00 00 00       	movl	$50, %edi
ffff80000010e04d: 4c 89 e6             	movq	%r12, %rsi
ffff80000010e050: ff d0                	callq	*%rax
ffff80000010e052: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e055: 4c 89 e6             	movq	%r12, %rsi
ffff80000010e058: 48 89 da             	movq	%rbx, %rdx
ffff80000010e05b: 48 89 c1             	movq	%rax, %rcx
ffff80000010e05e: 4d 89 f0             	movq	%r14, %r8
ffff80000010e061: 41 ff d5             	callq	*%r13
; 	buddy_migrate();
ffff80000010e064: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010e06e: ff d0                	callq	*%rax
; 	return 0;
ffff80000010e070: 31 c0                	xorl	%eax, %eax
ffff80000010e072: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e076: 5b                   	popq	%rbx
ffff80000010e077: 41 5c                	popq	%r12
ffff80000010e079: 41 5d                	popq	%r13
ffff80000010e07b: 41 5e                	popq	%r14
ffff80000010e07d: 41 5f                	popq	%r15
ffff80000010e07f: 5d                   	popq	%rbp
ffff80000010e080: c3                   	retq
; 		panic("unable to allocate the PML4!");
ffff80000010e081: 48 bf ed 53 11 00 00 80 ff ff	movabsq	$-140737487219731, %rdi # imm = 0xFFFF8000001153ED
ffff80000010e08b: 48 ba d2 58 11 00 00 80 ff ff	movabsq	$-140737487218478, %rdx # imm = 0xFFFF8000001158D2
ffff80000010e095: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e09f: be 19 00 00 00       	movl	$25, %esi
ffff80000010e0a4: 31 c0                	xorl	%eax, %eax
ffff80000010e0a6: ff d1                	callq	*%rcx
ffff80000010e0a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e0b0 <page2kva>:
; {
ffff80000010e0b0: 55                   	pushq	%rbp
ffff80000010e0b1: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff80000010e0b4: 48 b8 00 e5 10 00 00 80 ff ff	movabsq	$-140737487248128, %rax # imm = 0xFFFF80000010E500
ffff80000010e0be: ff d0                	callq	*%rax
ffff80000010e0c0: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010e0ca: 48 b9 30 e6 10 00 00 80 ff ff	movabsq	$-140737487247824, %rcx # imm = 0xFFFF80000010E630
ffff80000010e0d4: be 50 00 00 00       	movl	$80, %esi
ffff80000010e0d9: 48 89 c2             	movq	%rax, %rdx
ffff80000010e0dc: ff d1                	callq	*%rcx
ffff80000010e0de: 5d                   	popq	%rbp
ffff80000010e0df: c3                   	retq

ffff80000010e0e0 <_paddr>:
; {
ffff80000010e0e0: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010e0e3: 48 89 f1             	movq	%rsi, %rcx
ffff80000010e0e6: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010e0ea: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010e0f0: 76 0e                	jbe	0xffff80000010e100 <_paddr+0x20>
ffff80000010e0f2: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010e0fc: 48 01 c8             	addq	%rcx, %rax
ffff80000010e0ff: c3                   	retq
ffff80000010e100: 55                   	pushq	%rbp
ffff80000010e101: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e104: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010e106: 48 bf ed 53 11 00 00 80 ff ff	movabsq	$-140737487219731, %rdi # imm = 0xFFFF8000001153ED
ffff80000010e110: 48 ba de 4b 11 00 00 80 ff ff	movabsq	$-140737487221794, %rdx # imm = 0xFFFF800000114BDE
ffff80000010e11a: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e124: 48 89 c1             	movq	%rax, %rcx
ffff80000010e127: 31 c0                	xorl	%eax, %eax
ffff80000010e129: 41 ff d0             	callq	*%r8
ffff80000010e12c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e130 <mem_init>:
; {
ffff80000010e130: 55                   	pushq	%rbp
ffff80000010e131: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e134: 41 57                	pushq	%r15
ffff80000010e136: 41 56                	pushq	%r14
ffff80000010e138: 41 54                	pushq	%r12
ffff80000010e13a: 53                   	pushq	%rbx
ffff80000010e13b: 49 89 ff             	movq	%rdi, %r15
; 	align_boot_info(boot_info);
ffff80000010e13e: 48 b8 e0 d4 10 00 00 80 ff ff	movabsq	$-140737487252256, %rax # imm = 0xFFFF80000010D4E0
ffff80000010e148: ff d0                	callq	*%rax
ffff80000010e14a: 31 db                	xorl	%ebx, %ebx
ffff80000010e14c: 49 be 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r14 # imm = 0xFFFF80000011A240
ffff80000010e156: 49 bc 00 f2 10 00 00 80 ff ff	movabsq	$-140737487244800, %r12 # imm = 0xFFFF80000010F200
; 		list_init(buddy_free_list + i);
ffff80000010e160: 4a 8d 3c 33          	leaq	(%rbx,%r14), %rdi
ffff80000010e164: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010e167: 48 83 c3 10          	addq	$16, %rbx
ffff80000010e16b: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010e172: 75 ec                	jne	0xffff80000010e160 <mem_init+0x30>
ffff80000010e174: 41 8b 4f 04          	movl	4(%r15), %ecx
ffff80000010e178: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e17b: 74 2e                	je	0xffff80000010e1ab <mem_init+0x7b>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010e17d: 41 8b 07             	movl	(%r15), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e180: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010e184: 48 8d 14 49          	leaq	(%rcx,%rcx,2), %rdx
ffff80000010e188: 31 f6                	xorl	%esi, %esi
ffff80000010e18a: 31 c9                	xorl	%ecx, %ecx
ffff80000010e18c: eb 0b                	jmp	0xffff80000010e199 <mem_init+0x69>
ffff80000010e18e: 66 90                	nop
ffff80000010e190: 48 83 c6 18          	addq	$24, %rsi
ffff80000010e194: 48 39 f2             	cmpq	%rsi, %rdx
ffff80000010e197: 74 14                	je	0xffff80000010e1ad <mem_init+0x7d>
; 		if (entry->type != MMAP_FREE)
ffff80000010e199: 83 7c 30 10 01       	cmpl	$1, 16(%rax,%rsi)
ffff80000010e19e: 75 f0                	jne	0xffff80000010e190 <mem_init+0x60>
; 		highest_addr = entry->addr + entry->len;
ffff80000010e1a0: 48 8b 4c 30 08       	movq	8(%rax,%rsi), %rcx
ffff80000010e1a5: 48 03 0c 30          	addq	(%rax,%rsi), %rcx
ffff80000010e1a9: eb e5                	jmp	0xffff80000010e190 <mem_init+0x60>
ffff80000010e1ab: 31 c9                	xorl	%ecx, %ecx
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010e1ad: 48 81 f9 00 00 80 00 	cmpq	$8388608, %rcx          # imm = 0x800000
ffff80000010e1b4: bf 00 00 80 00       	movl	$8388608, %edi          # imm = 0x800000
ffff80000010e1b9: 48 0f 42 f9          	cmovbq	%rcx, %rdi
ffff80000010e1bd: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e1c1: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010e1cb: 48 89 38             	movq	%rdi, (%rax)
; 	pages = boot_alloc(npages * sizeof *pages);
ffff80000010e1ce: c1 e7 05             	shll	$5, %edi
ffff80000010e1d1: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e1db: ff d0                	callq	*%rax
ffff80000010e1dd: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010e1e7: 48 89 01             	movq	%rax, (%rcx)
; 	page_init(boot_info);
ffff80000010e1ea: 48 b8 e0 e2 10 00 00 80 ff ff	movabsq	$-140737487248672, %rax # imm = 0xFFFF80000010E2E0
ffff80000010e1f4: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e1f7: ff d0                	callq	*%rax
; 	pml4_setup(boot_info);
ffff80000010e1f9: 48 b8 90 df 10 00 00 80 ff ff	movabsq	$-140737487249520, %rax # imm = 0xFFFF80000010DF90
ffff80000010e203: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e206: ff d0                	callq	*%rax
; 	uint64_t efer = read_msr(MSR_EFER);
ffff80000010e208: 48 b8 a0 e4 10 00 00 80 ff ff	movabsq	$-140737487248224, %rax # imm = 0xFFFF80000010E4A0
ffff80000010e212: ff d0                	callq	*%rax
; 	write_msr(MSR_EFER, efer | MSR_EFER_NXE);
ffff80000010e214: 48 0d 00 08 00 00    	orq	$2048, %rax             # imm = 0x800
ffff80000010e21a: 48 b9 c0 e4 10 00 00 80 ff ff	movabsq	$-140737487248192, %rcx # imm = 0xFFFF80000010E4C0
ffff80000010e224: 48 89 c7             	movq	%rax, %rdi
ffff80000010e227: ff d1                	callq	*%rcx
; 	lab2_check_pml4();
ffff80000010e229: 48 b8 f0 3a 11 00 00 80 ff ff	movabsq	$-140737487226128, %rax # imm = 0xFFFF800000113AF0
ffff80000010e233: ff d0                	callq	*%rax
; 	cprintf("attempting to load pml4\n");
ffff80000010e235: 48 bf c5 4b 11 00 00 80 ff ff	movabsq	$-140737487221819, %rdi # imm = 0xFFFF800000114BC5
ffff80000010e23f: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff80000010e249: 31 c0                	xorl	%eax, %eax
ffff80000010e24b: 41 ff d6             	callq	*%r14
; 	load_pml4((void*)page2pa((struct page_info*)kernel_pml4));
ffff80000010e24e: 48 b8 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rax # imm = 0xFFFF80000011A2F0
ffff80000010e258: 48 8b 38             	movq	(%rax), %rdi
ffff80000010e25b: 48 b8 00 e5 10 00 00 80 ff ff	movabsq	$-140737487248128, %rax # imm = 0xFFFF80000010E500
ffff80000010e265: ff d0                	callq	*%rax
ffff80000010e267: 48 b9 e0 e4 10 00 00 80 ff ff	movabsq	$-140737487248160, %rcx # imm = 0xFFFF80000010E4E0
ffff80000010e271: 48 89 c7             	movq	%rax, %rdi
ffff80000010e274: ff d1                	callq	*%rcx
; 	cprintf("loaded pml4");
ffff80000010e276: 48 bf 1c 51 11 00 00 80 ff ff	movabsq	$-140737487220452, %rdi # imm = 0xFFFF80000011511C
ffff80000010e280: 31 c0                	xorl	%eax, %eax
ffff80000010e282: 41 ff d6             	callq	*%r14
; 	lab2_check_paging();
ffff80000010e285: 48 b8 20 3b 11 00 00 80 ff ff	movabsq	$-140737487226080, %rax # imm = 0xFFFF800000113B20
ffff80000010e28f: ff d0                	callq	*%rax
; 	cprintf("starting page init ext\n");
ffff80000010e291: 48 bf cb 4d 11 00 00 80 ff ff	movabsq	$-140737487221301, %rdi # imm = 0xFFFF800000114DCB
ffff80000010e29b: 31 c0                	xorl	%eax, %eax
ffff80000010e29d: 41 ff d6             	callq	*%r14
; 	page_init_ext(boot_info);
ffff80000010e2a0: 48 b8 20 e5 10 00 00 80 ff ff	movabsq	$-140737487248096, %rax # imm = 0xFFFF80000010E520
ffff80000010e2aa: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e2ad: ff d0                	callq	*%rax
; 	cprintf("page init ext complete\n");
ffff80000010e2af: 48 bf 51 58 11 00 00 80 ff ff	movabsq	$-140737487218607, %rdi # imm = 0xFFFF800000115851
ffff80000010e2b9: 31 c0                	xorl	%eax, %eax
ffff80000010e2bb: 41 ff d6             	callq	*%r14
; 	lab2_check_buddy(boot_info);
ffff80000010e2be: 48 b8 40 3b 11 00 00 80 ff ff	movabsq	$-140737487226048, %rax # imm = 0xFFFF800000113B40
ffff80000010e2c8: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e2cb: ff d0                	callq	*%rax
; }
ffff80000010e2cd: 5b                   	popq	%rbx
ffff80000010e2ce: 41 5c                	popq	%r12
ffff80000010e2d0: 41 5e                	popq	%r14
ffff80000010e2d2: 41 5f                	popq	%r15
ffff80000010e2d4: 5d                   	popq	%rbp
ffff80000010e2d5: c3                   	retq
ffff80000010e2d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010e2e0 <page_init>:
; {
ffff80000010e2e0: 55                   	pushq	%rbp
ffff80000010e2e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e2e4: 41 57                	pushq	%r15
ffff80000010e2e6: 41 56                	pushq	%r14
ffff80000010e2e8: 41 55                	pushq	%r13
ffff80000010e2ea: 41 54                	pushq	%r12
ffff80000010e2ec: 53                   	pushq	%rbx
ffff80000010e2ed: 48 83 ec 18          	subq	$24, %rsp
ffff80000010e2f1: 48 89 7d d0          	movq	%rdi, -48(%rbp)
; 	for (i = 0; i < npages; ++i) {
ffff80000010e2f5: 49 be e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %r14 # imm = 0xFFFF80000011A2E0
ffff80000010e2ff: 49 83 3e 00          	cmpq	$0, (%r14)
ffff80000010e303: 49 bf e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %r15 # imm = 0xFFFF80000011A2E8
ffff80000010e30d: 74 3f                	je	0xffff80000010e34e <page_init+0x6e>
ffff80000010e30f: 31 db                	xorl	%ebx, %ebx
ffff80000010e311: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010e314: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e31e: 66 90                	nop
; 		page = pages + i;
ffff80000010e320: 4d 8b 2f             	movq	(%r15), %r13
; 		list_init(&page->pp_node);
ffff80000010e323: 4a 8d 3c 2b          	leaq	(%rbx,%r13), %rdi
ffff80000010e327: 48 b8 00 f2 10 00 00 80 ff ff	movabsq	$-140737487244800, %rax # imm = 0xFFFF80000010F200
ffff80000010e331: ff d0                	callq	*%rax
; 		page->pp_ref = 0;
ffff80000010e333: 66 41 c7 44 1d 10 00 00      	movw	$0, 16(%r13,%rbx)
; 		page->pp_order = 0;
ffff80000010e33b: 41 c6 44 1d 12 00    	movb	$0, 18(%r13,%rbx)
; 	for (i = 0; i < npages; ++i) {
ffff80000010e341: 49 83 c4 01          	addq	$1, %r12
ffff80000010e345: 48 83 c3 20          	addq	$32, %rbx
ffff80000010e349: 4d 3b 26             	cmpq	(%r14), %r12
ffff80000010e34c: 72 d2                	jb	0xffff80000010e320 <page_init+0x40>
ffff80000010e34e: 4c 8b 75 d0          	movq	-48(%rbp), %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e352: 41 8b 16             	movl	(%r14), %edx
ffff80000010e355: 48 bf ed 53 11 00 00 80 ff ff	movabsq	$-140737487219731, %rdi # imm = 0xFFFF8000001153ED
ffff80000010e35f: 48 b8 30 e6 10 00 00 80 ff ff	movabsq	$-140737487247824, %rax # imm = 0xFFFF80000010E630
ffff80000010e369: be b5 00 00 00       	movl	$181, %esi
ffff80000010e36e: ff d0                	callq	*%rax
ffff80000010e370: 48 89 c3             	movq	%rax, %rbx
; 	end = PADDR(boot_alloc(0));
ffff80000010e373: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e37d: 31 ff                	xorl	%edi, %edi
ffff80000010e37f: ff d0                	callq	*%rax
ffff80000010e381: 48 b9 e0 e0 10 00 00 80 ff ff	movabsq	$-140737487249184, %rcx # imm = 0xFFFF80000010E0E0
ffff80000010e38b: bf b6 00 00 00       	movl	$182, %edi
ffff80000010e390: 48 89 c6             	movq	%rax, %rsi
ffff80000010e393: ff d1                	callq	*%rcx
ffff80000010e395: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e399: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010e39e: 0f 84 df 00 00 00    	je	0xffff80000010e483 <page_init+0x1a3>
ffff80000010e3a4: 4c 89 f1             	movq	%r14, %rcx
ffff80000010e3a7: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e3aa: eb 18                	jmp	0xffff80000010e3c4 <page_init+0xe4>
ffff80000010e3ac: 0f 1f 40 00          	nopl	(%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e3b0: 49 83 c5 01          	addq	$1, %r13
ffff80000010e3b4: 48 83 c3 18          	addq	$24, %rbx
ffff80000010e3b8: 8b 41 04             	movl	4(%rcx), %eax
ffff80000010e3bb: 49 39 c5             	cmpq	%rax, %r13
ffff80000010e3be: 0f 83 bf 00 00 00    	jae	0xffff80000010e483 <page_init+0x1a3>
; 		if((entry->type & MMAP_FREE) == 0){
ffff80000010e3c4: f6 43 10 01          	testb	$1, 16(%rbx)
ffff80000010e3c8: 74 e6                	je	0xffff80000010e3b0 <page_init+0xd0>
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010e3ca: 4c 8b 33             	movq	(%rbx), %r14
ffff80000010e3cd: 48 8b 43 08          	movq	8(%rbx), %rax
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010e3d1: 4c 01 f0             	addq	%r14, %rax
ffff80000010e3d4: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010e3da: 49 39 c6             	cmpq	%rax, %r14
ffff80000010e3dd: 73 d1                	jae	0xffff80000010e3b0 <page_init+0xd0>
ffff80000010e3df: 4d 89 f4             	movq	%r14, %r12
ffff80000010e3e2: 49 c1 ec 07          	shrq	$7, %r12
ffff80000010e3e6: 49 83 e4 e0          	andq	$-32, %r12
ffff80000010e3ea: eb 1a                	jmp	0xffff80000010e406 <page_init+0x126>
ffff80000010e3ec: 0f 1f 40 00          	nopl	(%rax)
ffff80000010e3f0: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010e3f4: 48 03 03             	addq	(%rbx), %rax
ffff80000010e3f7: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010e3fd: 49 83 c4 20          	addq	$32, %r12
ffff80000010e401: 49 39 c6             	cmpq	%rax, %r14
ffff80000010e404: 73 aa                	jae	0xffff80000010e3b0 <page_init+0xd0>
; 			if(i + PAGE_SIZE > BOOT_MAP_LIM){
ffff80000010e406: 49 81 fe 00 f0 7f 00 	cmpq	$8384512, %r14          # imm = 0x7FF000
ffff80000010e40d: 77 a1                	ja	0xffff80000010e3b0 <page_init+0xd0>
ffff80000010e40f: 4d 89 f7             	movq	%r14, %r15
ffff80000010e412: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
; 			if(i == 0){
ffff80000010e419: 4d 85 ff             	testq	%r15, %r15
ffff80000010e41c: 74 d2                	je	0xffff80000010e3f0 <page_init+0x110>
; 			if(i == (physaddr_t)boot_info->elf_hdr){
ffff80000010e41e: 4c 3b 79 08          	cmpq	8(%rcx), %r15
ffff80000010e422: 74 cc                	je	0xffff80000010e3f0 <page_init+0x110>
; 			if(i >= KERNEL_LMA && i < (uint64_t)end){
ffff80000010e424: 49 81 ff 00 00 10 00 	cmpq	$1048576, %r15          # imm = 0x100000
ffff80000010e42b: 72 06                	jb	0xffff80000010e433 <page_init+0x153>
ffff80000010e42d: 4c 3b 7d c8          	cmpq	-56(%rbp), %r15
ffff80000010e431: 72 bd                	jb	0xffff80000010e3f0 <page_init+0x110>
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010e433: bf d7 00 00 00       	movl	$215, %edi
ffff80000010e438: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010e43c: 48 b8 e0 e0 10 00 00 80 ff ff	movabsq	$-140737487249184, %rax # imm = 0xFFFF80000010E0E0
ffff80000010e446: ff d0                	callq	*%rax
ffff80000010e448: 48 8b 4d d0          	movq	-48(%rbp), %rcx
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010e44c: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010e456: 48 21 d0             	andq	%rdx, %rax
ffff80000010e459: 49 39 c7             	cmpq	%rax, %r15
ffff80000010e45c: 74 92                	je	0xffff80000010e3f0 <page_init+0x110>
ffff80000010e45e: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010e468: 48 8b 38             	movq	(%rax), %rdi
; 			page_free(pages + page_index);
ffff80000010e46b: 4c 01 e7             	addq	%r12, %rdi
ffff80000010e46e: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010e478: ff d0                	callq	*%rax
ffff80000010e47a: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010e47e: e9 6d ff ff ff       	jmp	0xffff80000010e3f0 <page_init+0x110>
; }
ffff80000010e483: 48 83 c4 18          	addq	$24, %rsp
ffff80000010e487: 5b                   	popq	%rbx
ffff80000010e488: 41 5c                	popq	%r12
ffff80000010e48a: 41 5d                	popq	%r13
ffff80000010e48c: 41 5e                	popq	%r14
ffff80000010e48e: 41 5f                	popq	%r15
ffff80000010e490: 5d                   	popq	%rbp
ffff80000010e491: c3                   	retq
ffff80000010e492: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e49c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e4a0 <read_msr>:
; {
ffff80000010e4a0: 55                   	pushq	%rbp
ffff80000010e4a1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff80000010e4a4: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff80000010e4a9: 0f 32                	rdmsr
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff80000010e4ab: 48 c1 e2 20          	shlq	$32, %rdx
ffff80000010e4af: 89 c0                	movl	%eax, %eax
ffff80000010e4b1: 48 09 d0             	orq	%rdx, %rax
ffff80000010e4b4: 5d                   	popq	%rbp
ffff80000010e4b5: c3                   	retq
ffff80000010e4b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010e4c0 <write_msr>:
; {
ffff80000010e4c0: 55                   	pushq	%rbp
ffff80000010e4c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e4c4: 48 89 f8             	movq	%rdi, %rax
; 		"d" ((uint32_t)((val >> 32) & 0xFFFFFFFF)));
ffff80000010e4c7: 48 89 fa             	movq	%rdi, %rdx
ffff80000010e4ca: 48 c1 ea 20          	shrq	$32, %rdx
; 	asm volatile(
ffff80000010e4ce: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff80000010e4d3: 0f 30                	wrmsr
; }
ffff80000010e4d5: 5d                   	popq	%rbp
ffff80000010e4d6: c3                   	retq
ffff80000010e4d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e4e0 <load_pml4>:
; {
ffff80000010e4e0: 55                   	pushq	%rbp
ffff80000010e4e1: 48 89 e5             	movq	%rsp, %rbp
; 	write_cr3((uintptr_t)pml4);
ffff80000010e4e4: 48 b8 e0 e6 10 00 00 80 ff ff	movabsq	$-140737487247648, %rax # imm = 0xFFFF80000010E6E0
ffff80000010e4ee: ff d0                	callq	*%rax
; }
ffff80000010e4f0: 5d                   	popq	%rbp
ffff80000010e4f1: c3                   	retq
ffff80000010e4f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e4fc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e500 <page2pa>:
; {
ffff80000010e500: 55                   	pushq	%rbp
ffff80000010e501: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e504: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010e507: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010e511: 48 2b 01             	subq	(%rcx), %rax
ffff80000010e514: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010e518: 5d                   	popq	%rbp
ffff80000010e519: c3                   	retq
ffff80000010e51a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e520 <page_init_ext>:
; {
ffff80000010e520: 55                   	pushq	%rbp
ffff80000010e521: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e524: 41 57                	pushq	%r15
ffff80000010e526: 41 56                	pushq	%r14
ffff80000010e528: 41 55                	pushq	%r13
ffff80000010e52a: 41 54                	pushq	%r12
ffff80000010e52c: 53                   	pushq	%rbx
ffff80000010e52d: 50                   	pushq	%rax
ffff80000010e52e: 48 89 fb             	movq	%rdi, %rbx
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e531: 8b 17                	movl	(%rdi), %edx
ffff80000010e533: 48 bf ed 53 11 00 00 80 ff ff	movabsq	$-140737487219731, %rdi # imm = 0xFFFF8000001153ED
ffff80000010e53d: 48 b8 30 e6 10 00 00 80 ff ff	movabsq	$-140737487247824, %rax # imm = 0xFFFF80000010E630
ffff80000010e547: be ea 00 00 00       	movl	$234, %esi
ffff80000010e54c: ff d0                	callq	*%rax
ffff80000010e54e: 49 89 c7             	movq	%rax, %r15
; 	end = PADDR(boot_alloc(0));
ffff80000010e551: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e55b: 31 ff                	xorl	%edi, %edi
ffff80000010e55d: ff d0                	callq	*%rax
ffff80000010e55f: 48 b9 e0 e0 10 00 00 80 ff ff	movabsq	$-140737487249184, %rcx # imm = 0xFFFF80000010E0E0
ffff80000010e569: bf eb 00 00 00       	movl	$235, %edi
ffff80000010e56e: 48 89 c6             	movq	%rax, %rsi
ffff80000010e571: ff d1                	callq	*%rcx
ffff80000010e573: 48 89 5d d0          	movq	%rbx, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e577: 83 7b 04 00          	cmpl	$0, 4(%rbx)
ffff80000010e57b: 0f 84 98 00 00 00    	je	0xffff80000010e619 <page_init_ext+0xf9>
ffff80000010e581: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e584: 49 be 80 e6 10 00 00 80 ff ff	movabsq	$-140737487247744, %r14 # imm = 0xFFFF80000010E680
ffff80000010e58e: eb 14                	jmp	0xffff80000010e5a4 <page_init_ext+0x84>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e590: 49 83 c5 01          	addq	$1, %r13
ffff80000010e594: 49 83 c7 18          	addq	$24, %r15
ffff80000010e598: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e59c: 8b 40 04             	movl	4(%rax), %eax
ffff80000010e59f: 49 39 c5             	cmpq	%rax, %r13
ffff80000010e5a2: 73 75                	jae	0xffff80000010e619 <page_init_ext+0xf9>
; 		if(entry->type != MMAP_FREE) continue;
ffff80000010e5a4: 41 83 7f 10 01       	cmpl	$1, 16(%r15)
ffff80000010e5a9: 75 e5                	jne	0xffff80000010e590 <page_init_ext+0x70>
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010e5ab: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010e5ae: 49 8b 47 08          	movq	8(%r15), %rax
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010e5b2: 48 01 d8             	addq	%rbx, %rax
ffff80000010e5b5: 73 1c                	jae	0xffff80000010e5d3 <page_init_ext+0xb3>
ffff80000010e5b7: eb d7                	jmp	0xffff80000010e590 <page_init_ext+0x70>
ffff80000010e5b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010e5c0: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff80000010e5c7: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010e5cb: 49 03 07             	addq	(%r15), %rax
ffff80000010e5ce: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e5d1: 77 bd                	ja	0xffff80000010e590 <page_init_ext+0x70>
; 			if(addr < BOOT_MAP_LIM) continue;
ffff80000010e5d3: 48 81 fb 00 00 80 00 	cmpq	$8388608, %rbx          # imm = 0x800000
ffff80000010e5da: 72 e4                	jb	0xffff80000010e5c0 <page_init_ext+0xa0>
; 			struct page_info* page = pa2page(addr);
ffff80000010e5dc: 48 89 df             	movq	%rbx, %rdi
ffff80000010e5df: 41 ff d6             	callq	*%r14
ffff80000010e5e2: 49 89 c4             	movq	%rax, %r12
; 			list_init(&page->pp_node);
ffff80000010e5e5: 48 89 c7             	movq	%rax, %rdi
ffff80000010e5e8: 48 b8 00 f2 10 00 00 80 ff ff	movabsq	$-140737487244800, %rax # imm = 0xFFFF80000010F200
ffff80000010e5f2: ff d0                	callq	*%rax
; 			page->pp_ref = 0;
ffff80000010e5f4: 66 41 c7 44 24 10 00 00      	movw	$0, 16(%r12)
; 			page->pp_order = 0;
ffff80000010e5fc: 41 c6 44 24 12 00    	movb	$0, 18(%r12)
; 			page_free(pa2page(addr));
ffff80000010e602: 48 89 df             	movq	%rbx, %rdi
ffff80000010e605: 41 ff d6             	callq	*%r14
ffff80000010e608: 48 89 c7             	movq	%rax, %rdi
ffff80000010e60b: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010e615: ff d0                	callq	*%rax
ffff80000010e617: eb a7                	jmp	0xffff80000010e5c0 <page_init_ext+0xa0>
; }
ffff80000010e619: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e61d: 5b                   	popq	%rbx
ffff80000010e61e: 41 5c                	popq	%r12
ffff80000010e620: 41 5d                	popq	%r13
ffff80000010e622: 41 5e                	popq	%r14
ffff80000010e624: 41 5f                	popq	%r15
ffff80000010e626: 5d                   	popq	%rbp
ffff80000010e627: c3                   	retq
ffff80000010e628: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e630 <_kaddr>:
; {
ffff80000010e630: 55                   	pushq	%rbp
ffff80000010e631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e634: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e637: 48 89 d1             	movq	%rdx, %rcx
ffff80000010e63a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010e63e: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff80000010e648: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010e64b: 73 0f                	jae	0xffff80000010e65c <_kaddr+0x2c>
ffff80000010e64d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010e657: 48 01 c8             	addq	%rcx, %rax
ffff80000010e65a: 5d                   	popq	%rbp
ffff80000010e65b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010e65c: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff80000010e666: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e670: 48 89 c1             	movq	%rax, %rcx
ffff80000010e673: 31 c0                	xorl	%eax, %eax
ffff80000010e675: 41 ff d0             	callq	*%r8
ffff80000010e678: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e680 <pa2page>:
; {
ffff80000010e680: 55                   	pushq	%rbp
ffff80000010e681: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e684: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e688: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010e692: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010e695: 73 16                	jae	0xffff80000010e6ad <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010e697: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010e6a1: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010e6a5: 48 03 38             	addq	(%rax), %rdi
ffff80000010e6a8: 48 89 f8             	movq	%rdi, %rax
ffff80000010e6ab: 5d                   	popq	%rbp
ffff80000010e6ac: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010e6ad: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010e6b7: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff80000010e6c1: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e6cb: be 49 00 00 00       	movl	$73, %esi
ffff80000010e6d0: 31 c0                	xorl	%eax, %eax
ffff80000010e6d2: ff d1                	callq	*%rcx
ffff80000010e6d4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e6de: 66 90                	nop

ffff80000010e6e0 <write_cr3>:
; {
ffff80000010e6e0: 55                   	pushq	%rbp
ffff80000010e6e1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %0, %%cr3\n" :: "r" (value));
ffff80000010e6e4: 0f 22 df             	movq	%rdi, %cr3
; }
ffff80000010e6e7: 5d                   	popq	%rbp
ffff80000010e6e8: c3                   	retq
ffff80000010e6e9: cc                   	int3
ffff80000010e6ea: cc                   	int3
ffff80000010e6eb: cc                   	int3
ffff80000010e6ec: cc                   	int3
ffff80000010e6ed: cc                   	int3
ffff80000010e6ee: cc                   	int3
ffff80000010e6ef: cc                   	int3

ffff80000010e6f0 <lab1_check_free_list_avail>:
; {
ffff80000010e6f0: 55                   	pushq	%rbp
ffff80000010e6f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e6f4: 41 57                	pushq	%r15
ffff80000010e6f6: 41 56                	pushq	%r14
ffff80000010e6f8: 41 55                	pushq	%r13
ffff80000010e6fa: 41 54                	pushq	%r12
ffff80000010e6fc: 53                   	pushq	%rbx
ffff80000010e6fd: 50                   	pushq	%rax
ffff80000010e6fe: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010e701: 49 bc 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %r12 # imm = 0xFFFF80000010E810
ffff80000010e70b: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e70e: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e711: eb 1b                	jmp	0xffff80000010e72e <lab1_check_free_list_avail+0x3e>
ffff80000010e713: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e71d: 0f 1f 00             	nopl	(%rax)
ffff80000010e720: 4c 8b 7d d0          	movq	-48(%rbp), %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e724: 49 83 c7 01          	addq	$1, %r15
ffff80000010e728: 49 83 ff 0a          	cmpq	$10, %r15
ffff80000010e72c: 74 46                	je	0xffff80000010e774 <lab1_check_free_list_avail+0x84>
ffff80000010e72e: 4c 89 7d d0          	movq	%r15, -48(%rbp)
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e732: 49 c1 e7 04          	shlq	$4, %r15
ffff80000010e736: 48 b8 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %rax # imm = 0xFFFF80000011A240
ffff80000010e740: 49 8b 1c 07          	movq	(%r15,%rax), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e744: 49 01 c7             	addq	%rax, %r15
ffff80000010e747: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010e74a: 74 d4                	je	0xffff80000010e720 <lab1_check_free_list_avail+0x30>
ffff80000010e74c: 0f 1f 40 00          	nopl	(%rax)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010e750: 48 89 df             	movq	%rbx, %rdi
ffff80000010e753: 41 ff d4             	callq	*%r12
ffff80000010e756: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010e75c: 49 83 d5 00          	adcq	$0, %r13
ffff80000010e760: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010e766: 49 83 de ff          	sbbq	$-1, %r14
ffff80000010e76a: 48 8b 1b             	movq	(%rbx), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e76d: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010e770: 75 de                	jne	0xffff80000010e750 <lab1_check_free_list_avail+0x60>
ffff80000010e772: eb ac                	jmp	0xffff80000010e720 <lab1_check_free_list_avail+0x30>
; 	assert(nfree_basemem > 0);
ffff80000010e774: 4d 85 ed             	testq	%r13, %r13
ffff80000010e777: 74 2c                	je	0xffff80000010e7a5 <lab1_check_free_list_avail+0xb5>
; 	assert(nfree_extmem > 0);
ffff80000010e779: 4d 85 f6             	testq	%r14, %r14
ffff80000010e77c: 74 58                	je	0xffff80000010e7d6 <lab1_check_free_list_avail+0xe6>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010e77e: 48 bf 53 4b 11 00 00 80 ff ff	movabsq	$-140737487221933, %rdi # imm = 0xFFFF800000114B53
ffff80000010e788: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010e792: 31 c0                	xorl	%eax, %eax
ffff80000010e794: ff d1                	callq	*%rcx
; }
ffff80000010e796: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e79a: 5b                   	popq	%rbx
ffff80000010e79b: 41 5c                	popq	%r12
ffff80000010e79d: 41 5d                	popq	%r13
ffff80000010e79f: 41 5e                	popq	%r14
ffff80000010e7a1: 41 5f                	popq	%r15
ffff80000010e7a3: 5d                   	popq	%rbp
ffff80000010e7a4: c3                   	retq
; 	assert(nfree_basemem > 0);
ffff80000010e7a5: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010e7af: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010e7b9: 48 b9 90 56 11 00 00 80 ff ff	movabsq	$-140737487219056, %rcx # imm = 0xFFFF800000115690
ffff80000010e7c3: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e7cd: be 21 00 00 00       	movl	$33, %esi
ffff80000010e7d2: 31 c0                	xorl	%eax, %eax
ffff80000010e7d4: ff d3                	callq	*%rbx
; 	assert(nfree_extmem > 0);
ffff80000010e7d6: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010e7e0: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010e7ea: 48 b9 27 53 11 00 00 80 ff ff	movabsq	$-140737487219929, %rcx # imm = 0xFFFF800000115327
ffff80000010e7f4: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e7fe: be 22 00 00 00       	movl	$34, %esi
ffff80000010e803: 31 c0                	xorl	%eax, %eax
ffff80000010e805: ff d3                	callq	*%rbx
ffff80000010e807: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e810 <page2pa>:
; {
ffff80000010e810: 55                   	pushq	%rbp
ffff80000010e811: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e814: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010e817: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff80000010e821: 48 2b 01             	subq	(%rcx), %rax
ffff80000010e824: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010e828: 5d                   	popq	%rbp
ffff80000010e829: c3                   	retq
ffff80000010e82a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e830 <lab1_check_free_list_order>:
; {
ffff80000010e830: 55                   	pushq	%rbp
ffff80000010e831: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e834: 31 c9                	xorl	%ecx, %ecx
ffff80000010e836: 49 b8 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r8 # imm = 0xFFFF80000011A240
ffff80000010e840: 45 31 c9             	xorl	%r9d, %r9d
ffff80000010e843: eb 15                	jmp	0xffff80000010e85a <lab1_check_free_list_order+0x2a>
ffff80000010e845: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e84f: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e850: 49 83 c1 01          	addq	$1, %r9
ffff80000010e854: 49 83 f9 0a          	cmpq	$10, %r9
ffff80000010e858: 74 32                	je	0xffff80000010e88c <lab1_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e85a: 4c 89 ce             	movq	%r9, %rsi
ffff80000010e85d: 48 c1 e6 04          	shlq	$4, %rsi
ffff80000010e861: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e865: 4c 01 c6             	addq	%r8, %rsi
ffff80000010e868: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010e86b: 74 e3                	je	0xffff80000010e850 <lab1_check_free_list_order+0x20>
ffff80000010e86d: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff80000010e870: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010e874: 83 e0 7f             	andl	$127, %eax
ffff80000010e877: 31 d2                	xorl	%edx, %edx
ffff80000010e879: 49 39 c1             	cmpq	%rax, %r9
ffff80000010e87c: 0f 95 c2             	setne	%dl
ffff80000010e87f: 48 01 d1             	addq	%rdx, %rcx
ffff80000010e882: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e885: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010e888: 75 e6                	jne	0xffff80000010e870 <lab1_check_free_list_order+0x40>
ffff80000010e88a: eb c4                	jmp	0xffff80000010e850 <lab1_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000010e88c: 48 85 c9             	testq	%rcx, %rcx
ffff80000010e88f: 75 1a                	jne	0xffff80000010e8ab <lab1_check_free_list_order+0x7b>
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010e891: 48 bf 68 54 11 00 00 80 ff ff	movabsq	$-140737487219608, %rdi # imm = 0xFFFF800000115468
ffff80000010e89b: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010e8a5: 31 c0                	xorl	%eax, %eax
ffff80000010e8a7: ff d1                	callq	*%rcx
; }
ffff80000010e8a9: 5d                   	popq	%rbp
ffff80000010e8aa: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000010e8ab: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010e8b5: 48 ba 6a 57 11 00 00 80 ff ff	movabsq	$-140737487218838, %rdx # imm = 0xFFFF80000011576A
ffff80000010e8bf: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e8c9: be 3b 00 00 00       	movl	$59, %esi
ffff80000010e8ce: 31 c0                	xorl	%eax, %eax
ffff80000010e8d0: 41 ff d0             	callq	*%r8
ffff80000010e8d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e8dd: 0f 1f 00             	nopl	(%rax)

ffff80000010e8e0 <lab1_check_memory_layout>:
; {
ffff80000010e8e0: 55                   	pushq	%rbp
ffff80000010e8e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e8e4: 41 57                	pushq	%r15
ffff80000010e8e6: 41 56                	pushq	%r14
ffff80000010e8e8: 41 55                	pushq	%r13
ffff80000010e8ea: 41 54                	pushq	%r12
ffff80000010e8ec: 53                   	pushq	%rbx
ffff80000010e8ed: 50                   	pushq	%rax
ffff80000010e8ee: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e8f1: 8b 3f                	movl	(%rdi), %edi
ffff80000010e8f3: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000010e8fd: ff d0                	callq	*%rax
ffff80000010e8ff: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff80000010e902: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e90c: 31 ff                	xorl	%edi, %edi
ffff80000010e90e: ff d0                	callq	*%rax
ffff80000010e910: 48 b9 c0 ea 10 00 00 80 ff ff	movabsq	$-140737487246656, %rcx # imm = 0xFFFF80000010EAC0
ffff80000010e91a: bf 49 00 00 00       	movl	$73, %edi
ffff80000010e91f: 48 89 c6             	movq	%rax, %rsi
ffff80000010e922: ff d1                	callq	*%rcx
ffff80000010e924: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010e928: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010e92d: 0f 84 c6 00 00 00    	je	0xffff80000010e9f9 <lab1_check_memory_layout+0x119>
ffff80000010e933: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e936: eb 1d                	jmp	0xffff80000010e955 <lab1_check_memory_layout+0x75>
ffff80000010e938: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010e940: 49 83 c7 01          	addq	$1, %r15
ffff80000010e944: 49 83 c4 18          	addq	$24, %r12
ffff80000010e948: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010e94c: 49 39 c7             	cmpq	%rax, %r15
ffff80000010e94f: 0f 83 a4 00 00 00    	jae	0xffff80000010e9f9 <lab1_check_memory_layout+0x119>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e955: 49 8b 1c 24          	movq	(%r12), %rbx
ffff80000010e959: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e95e: 48 01 d8             	addq	%rbx, %rax
ffff80000010e961: eb 28                	jmp	0xffff80000010e98b <lab1_check_memory_layout+0xab>
ffff80000010e963: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e96d: 0f 1f 00             	nopl	(%rax)
; 			    page->pp_free) {
ffff80000010e970: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff80000010e975: 0f 88 a5 00 00 00    	js	0xffff80000010ea20 <lab1_check_memory_layout+0x140>
; 		     pa += PAGE_SIZE) {
ffff80000010e97b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e982: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010e987: 49 03 04 24          	addq	(%r12), %rax
ffff80000010e98b: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e98e: 73 b0                	jae	0xffff80000010e940 <lab1_check_memory_layout+0x60>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010e990: 48 81 fb ff ff 7f 00 	cmpq	$8388607, %rbx          # imm = 0x7FFFFF
ffff80000010e997: 77 e2                	ja	0xffff80000010e97b <lab1_check_memory_layout+0x9b>
; 			page = pa2page(pa);
ffff80000010e999: 48 89 df             	movq	%rbx, %rdi
ffff80000010e99c: 48 b8 10 eb 10 00 00 80 ff ff	movabsq	$-140737487246576, %rax # imm = 0xFFFF80000010EB10
ffff80000010e9a6: ff d0                	callq	*%rax
ffff80000010e9a8: 49 89 c5             	movq	%rax, %r13
; 			if ((pa == 0 ||
ffff80000010e9ab: 48 85 db             	testq	%rbx, %rbx
ffff80000010e9ae: 74 c0                	je	0xffff80000010e970 <lab1_check_memory_layout+0x90>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010e9b0: bf 54 00 00 00       	movl	$84, %edi
ffff80000010e9b5: 4c 89 f6             	movq	%r14, %rsi
ffff80000010e9b8: 48 b8 c0 ea 10 00 00 80 ff ff	movabsq	$-140737487246656, %rax # imm = 0xFFFF80000010EAC0
ffff80000010e9c2: ff d0                	callq	*%rax
ffff80000010e9c4: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000010e9ce: 48 21 c8             	andq	%rcx, %rax
ffff80000010e9d1: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e9d4: 74 9a                	je	0xffff80000010e970 <lab1_check_memory_layout+0x90>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010e9d6: 49 3b 5e 08          	cmpq	8(%r14), %rbx
ffff80000010e9da: 74 94                	je	0xffff80000010e970 <lab1_check_memory_layout+0x90>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010e9dc: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000010e9e3: 72 06                	jb	0xffff80000010e9eb <lab1_check_memory_layout+0x10b>
ffff80000010e9e5: 48 3b 5d d0          	cmpq	-48(%rbp), %rbx
ffff80000010e9e9: 72 85                	jb	0xffff80000010e970 <lab1_check_memory_layout+0x90>
; 			    entry->type != MMAP_FREE) &&
ffff80000010e9eb: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff80000010e9f1: 0f 85 79 ff ff ff    	jne	0xffff80000010e970 <lab1_check_memory_layout+0x90>
ffff80000010e9f7: eb 82                	jmp	0xffff80000010e97b <lab1_check_memory_layout+0x9b>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010e9f9: 48 bf 02 4c 11 00 00 80 ff ff	movabsq	$-140737487221758, %rdi # imm = 0xFFFF800000114C02
ffff80000010ea03: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010ea0d: 31 c0                	xorl	%eax, %eax
ffff80000010ea0f: ff d1                	callq	*%rcx
; }
ffff80000010ea11: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ea15: 5b                   	popq	%rbx
ffff80000010ea16: 41 5c                	popq	%r12
ffff80000010ea18: 41 5d                	popq	%r13
ffff80000010ea1a: 41 5e                	popq	%r14
ffff80000010ea1c: 41 5f                	popq	%r15
ffff80000010ea1e: 5d                   	popq	%rbp
ffff80000010ea1f: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010ea20: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff80000010ea2a: 4c 89 ef             	movq	%r13, %rdi
ffff80000010ea2d: ff d0                	callq	*%rax
ffff80000010ea2f: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010ea39: 48 ba 5c 4d 11 00 00 80 ff ff	movabsq	$-140737487221412, %rdx # imm = 0xFFFF800000114D5C
ffff80000010ea43: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ea4d: be 59 00 00 00       	movl	$89, %esi
ffff80000010ea52: 48 89 c1             	movq	%rax, %rcx
ffff80000010ea55: 31 c0                	xorl	%eax, %eax
ffff80000010ea57: ff d3                	callq	*%rbx
ffff80000010ea59: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ea60 <_kaddr>:
; {
ffff80000010ea60: 55                   	pushq	%rbp
ffff80000010ea61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ea64: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ea67: 48 89 f9             	movq	%rdi, %rcx
ffff80000010ea6a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010ea6e: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff80000010ea78: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010ea7b: 73 0f                	jae	0xffff80000010ea8c <_kaddr+0x2c>
ffff80000010ea7d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010ea87: 48 01 c8             	addq	%rcx, %rax
ffff80000010ea8a: 5d                   	popq	%rbp
ffff80000010ea8b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010ea8c: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010ea96: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff80000010eaa0: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010eaaa: be 48 00 00 00       	movl	$72, %esi
ffff80000010eaaf: 48 89 c1             	movq	%rax, %rcx
ffff80000010eab2: 31 c0                	xorl	%eax, %eax
ffff80000010eab4: 41 ff d0             	callq	*%r8
ffff80000010eab7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010eac0 <_paddr>:
; {
ffff80000010eac0: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010eac3: 48 89 f1             	movq	%rsi, %rcx
ffff80000010eac6: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010eaca: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010ead0: 76 0e                	jbe	0xffff80000010eae0 <_paddr+0x20>
ffff80000010ead2: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010eadc: 48 01 c8             	addq	%rcx, %rax
ffff80000010eadf: c3                   	retq
ffff80000010eae0: 55                   	pushq	%rbp
ffff80000010eae1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eae4: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010eae6: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010eaf0: 48 ba de 4b 11 00 00 80 ff ff	movabsq	$-140737487221794, %rdx # imm = 0xFFFF800000114BDE
ffff80000010eafa: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010eb04: 48 89 c1             	movq	%rax, %rcx
ffff80000010eb07: 31 c0                	xorl	%eax, %eax
ffff80000010eb09: 41 ff d0             	callq	*%r8
ffff80000010eb0c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010eb10 <pa2page>:
; {
ffff80000010eb10: 55                   	pushq	%rbp
ffff80000010eb11: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010eb14: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010eb18: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff80000010eb22: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010eb25: 73 16                	jae	0xffff80000010eb3d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010eb27: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff80000010eb31: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010eb35: 48 03 38             	addq	(%rax), %rdi
ffff80000010eb38: 48 89 f8             	movq	%rdi, %rax
ffff80000010eb3b: 5d                   	popq	%rbp
ffff80000010eb3c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010eb3d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff80000010eb47: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff80000010eb51: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010eb5b: be 49 00 00 00       	movl	$73, %esi
ffff80000010eb60: 31 c0                	xorl	%eax, %eax
ffff80000010eb62: ff d1                	callq	*%rcx
ffff80000010eb64: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eb6e: 66 90                	nop

ffff80000010eb70 <check_buddy_consistency>:
; {
ffff80000010eb70: 55                   	pushq	%rbp
ffff80000010eb71: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eb74: 41 57                	pushq	%r15
ffff80000010eb76: 41 56                	pushq	%r14
ffff80000010eb78: 41 55                	pushq	%r13
ffff80000010eb7a: 41 54                	pushq	%r12
ffff80000010eb7c: 53                   	pushq	%rbx
ffff80000010eb7d: 50                   	pushq	%rax
ffff80000010eb7e: 49 89 d4             	movq	%rdx, %r12
ffff80000010eb81: 49 89 f7             	movq	%rsi, %r15
ffff80000010eb84: 49 89 fe             	movq	%rdi, %r14
; 	page = pa2page(addr);
ffff80000010eb87: 48 b8 10 eb 10 00 00 80 ff ff	movabsq	$-140737487246576, %rax # imm = 0xFFFF80000010EB10
ffff80000010eb91: ff d0                	callq	*%rax
ffff80000010eb93: 48 89 c3             	movq	%rax, %rbx
; 	if (parent && parent != page) {
ffff80000010eb96: 4d 85 e4             	testq	%r12, %r12
ffff80000010eb99: 74 3f                	je	0xffff80000010ebda <check_buddy_consistency+0x6a>
ffff80000010eb9b: 4c 39 e3             	cmpq	%r12, %rbx
ffff80000010eb9e: 74 3a                	je	0xffff80000010ebda <check_buddy_consistency+0x6a>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010eba0: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010eba5: 45 84 ed             	testb	%r13b, %r13b
ffff80000010eba8: 0f 88 ce 00 00 00    	js	0xffff80000010ec7c <check_buddy_consistency+0x10c>
ffff80000010ebae: 48 89 df             	movq	%rbx, %rdi
ffff80000010ebb1: 48 b8 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %rax # imm = 0xFFFF80000010ED50
ffff80000010ebbb: ff d0                	callq	*%rax
ffff80000010ebbd: 85 c0                	testl	%eax, %eax
ffff80000010ebbf: 0f 84 b7 00 00 00    	je	0xffff80000010ec7c <check_buddy_consistency+0x10c>
; 			page->pp_order < parent->pp_order) {
ffff80000010ebc5: 44 89 e8             	movl	%r13d, %eax
ffff80000010ebc8: 24 7f                	andb	$127, %al
ffff80000010ebca: 41 8a 4c 24 12       	movb	18(%r12), %cl
ffff80000010ebcf: 80 e1 7f             	andb	$127, %cl
ffff80000010ebd2: 38 c8                	cmpb	%cl, %al
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010ebd4: 0f 82 a2 00 00 00    	jb	0xffff80000010ec7c <check_buddy_consistency+0x10c>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010ebda: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010ebdf: 45 84 ed             	testb	%r13b, %r13b
ffff80000010ebe2: 79 1c                	jns	0xffff80000010ec00 <check_buddy_consistency+0x90>
ffff80000010ebe4: 48 89 df             	movq	%rbx, %rdi
ffff80000010ebe7: 48 b8 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %rax # imm = 0xFFFF80000010ED50
ffff80000010ebf1: ff d0                	callq	*%rax
ffff80000010ebf3: 85 c0                	testl	%eax, %eax
ffff80000010ebf5: 0f 85 13 01 00 00    	jne	0xffff80000010ed0e <check_buddy_consistency+0x19e>
ffff80000010ebfb: 45 84 ed             	testb	%r13b, %r13b
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff80000010ebfe: 78 1c                	js	0xffff80000010ec1c <check_buddy_consistency+0xac>
ffff80000010ec00: 48 89 df             	movq	%rbx, %rdi
ffff80000010ec03: 48 b8 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %rax # imm = 0xFFFF80000010ED50
ffff80000010ec0d: ff d0                	callq	*%rax
ffff80000010ec0f: 85 c0                	testl	%eax, %eax
ffff80000010ec11: 0f 84 bf 00 00 00    	je	0xffff80000010ecd6 <check_buddy_consistency+0x166>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010ec17: 45 84 ed             	testb	%r13b, %r13b
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010ec1a: 79 15                	jns	0xffff80000010ec31 <check_buddy_consistency+0xc1>
ffff80000010ec1c: 48 89 df             	movq	%rbx, %rdi
ffff80000010ec1f: 48 b8 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %rax # imm = 0xFFFF80000010ED50
ffff80000010ec29: ff d0                	callq	*%rax
ffff80000010ec2b: 85 c0                	testl	%eax, %eax
ffff80000010ec2d: 4c 0f 45 e3          	cmovneq	%rbx, %r12
; 	if (order == 0) {
ffff80000010ec31: 4d 85 ff             	testq	%r15, %r15
ffff80000010ec34: 74 37                	je	0xffff80000010ec6d <check_buddy_consistency+0xfd>
; 	--order;
ffff80000010ec36: 49 8d 5f ff          	leaq	-1(%r15), %rbx
; 	check_buddy_consistency(addr, order, parent);
ffff80000010ec3a: 49 bd 70 eb 10 00 00 80 ff ff	movabsq	$-140737487246480, %r13 # imm = 0xFFFF80000010EB70
ffff80000010ec44: 4c 89 f7             	movq	%r14, %rdi
ffff80000010ec47: 48 89 de             	movq	%rbx, %rsi
ffff80000010ec4a: 4c 89 e2             	movq	%r12, %rdx
ffff80000010ec4d: 41 ff d5             	callq	*%r13
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff80000010ec50: 41 80 c7 0b          	addb	$11, %r15b
ffff80000010ec54: b8 01 00 00 00       	movl	$1, %eax
ffff80000010ec59: 44 89 f9             	movl	%r15d, %ecx
ffff80000010ec5c: d3 e0                	shll	%cl, %eax
ffff80000010ec5e: 48 63 f8             	movslq	%eax, %rdi
ffff80000010ec61: 4c 09 f7             	orq	%r14, %rdi
ffff80000010ec64: 48 89 de             	movq	%rbx, %rsi
ffff80000010ec67: 4c 89 e2             	movq	%r12, %rdx
ffff80000010ec6a: 41 ff d5             	callq	*%r13
; }
ffff80000010ec6d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ec71: 5b                   	popq	%rbx
ffff80000010ec72: 41 5c                	popq	%r12
ffff80000010ec74: 41 5d                	popq	%r13
ffff80000010ec76: 41 5e                	popq	%r14
ffff80000010ec78: 41 5f                	popq	%r15
ffff80000010ec7a: 5d                   	popq	%rbp
ffff80000010ec7b: c3                   	retq
; 			panic("page %p of order %u is free, while parent page "
ffff80000010ec7c: 49 be 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %r14 # imm = 0xFFFF80000010E810
ffff80000010ec86: 48 89 df             	movq	%rbx, %rdi
ffff80000010ec89: 41 ff d6             	callq	*%r14
ffff80000010ec8c: 48 89 c3             	movq	%rax, %rbx
ffff80000010ec8f: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ec93: 4c 89 e7             	movq	%r12, %rdi
ffff80000010ec96: 41 ff d6             	callq	*%r14
ffff80000010ec99: 41 0f b6 4c 24 12    	movzbl	18(%r12), %ecx
ffff80000010ec9f: 83 e1 7f             	andl	$127, %ecx
ffff80000010eca2: 89 0c 24             	movl	%ecx, (%rsp)
ffff80000010eca5: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010ecaf: 48 ba 38 53 11 00 00 80 ff ff	movabsq	$-140737487219912, %rdx # imm = 0xFFFF800000115338
ffff80000010ecb9: 49 ba 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r10 # imm = 0xFFFF80000010C870
ffff80000010ecc3: be 6d 00 00 00       	movl	$109, %esi
ffff80000010ecc8: 48 89 d9             	movq	%rbx, %rcx
ffff80000010eccb: 45 89 e8             	movl	%r13d, %r8d
ffff80000010ecce: 49 89 c1             	movq	%rax, %r9
ffff80000010ecd1: 31 c0                	xorl	%eax, %eax
ffff80000010ecd3: 41 ff d2             	callq	*%r10
; 		panic("page %p of order %u is in use, but on the free list",
ffff80000010ecd6: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff80000010ece0: 48 89 df             	movq	%rbx, %rdi
ffff80000010ece3: ff d0                	callq	*%rax
ffff80000010ece5: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ece9: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010ecf3: 48 ba 79 4f 11 00 00 80 ff ff	movabsq	$-140737487220871, %rdx # imm = 0xFFFF800000114F79
ffff80000010ecfd: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ed07: be 78 00 00 00       	movl	$120, %esi
ffff80000010ed0c: eb 36                	jmp	0xffff80000010ed44 <check_buddy_consistency+0x1d4>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000010ed0e: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff80000010ed18: 48 89 df             	movq	%rbx, %rdi
ffff80000010ed1b: ff d0                	callq	*%rax
ffff80000010ed1d: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ed21: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010ed2b: 48 ba 94 54 11 00 00 80 ff ff	movabsq	$-140737487219564, %rdx # imm = 0xFFFF800000115494
ffff80000010ed35: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ed3f: be 73 00 00 00       	movl	$115, %esi
ffff80000010ed44: 48 89 c1             	movq	%rax, %rcx
ffff80000010ed47: 45 89 e8             	movl	%r13d, %r8d
ffff80000010ed4a: 31 c0                	xorl	%eax, %eax
ffff80000010ed4c: ff d3                	callq	*%rbx
ffff80000010ed4e: 66 90                	nop

ffff80000010ed50 <list_is_empty>:
; {
ffff80000010ed50: 55                   	pushq	%rbp
ffff80000010ed51: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff80000010ed54: 31 c0                	xorl	%eax, %eax
ffff80000010ed56: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010ed59: 0f 94 c0             	sete	%al
ffff80000010ed5c: 5d                   	popq	%rbp
ffff80000010ed5d: c3                   	retq
ffff80000010ed5e: 66 90                	nop

ffff80000010ed60 <lab1_check_buddy_consistency>:
; {
ffff80000010ed60: 55                   	pushq	%rbp
ffff80000010ed61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ed64: 41 56                	pushq	%r14
ffff80000010ed66: 53                   	pushq	%rbx
ffff80000010ed67: 48 c7 c3 00 00 e0 ff 	movq	$-2097152, %rbx         # imm = 0xFFE00000
ffff80000010ed6e: 49 be 70 eb 10 00 00 80 ff ff	movabsq	$-140737487246480, %r14 # imm = 0xFFFF80000010EB70
ffff80000010ed78: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000010ed80: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
ffff80000010ed87: be 09 00 00 00       	movl	$9, %esi
ffff80000010ed8c: 48 89 df             	movq	%rbx, %rdi
ffff80000010ed8f: 31 d2                	xorl	%edx, %edx
ffff80000010ed91: 41 ff d6             	callq	*%r14
; 	     addr < BOOT_MAP_LIM;
ffff80000010ed94: 48 81 fb 00 00 60 00 	cmpq	$6291456, %rbx          # imm = 0x600000
; 	for (addr = 0;
ffff80000010ed9b: 72 e3                	jb	0xffff80000010ed80 <lab1_check_buddy_consistency+0x20>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff80000010ed9d: 48 bf ef 58 11 00 00 80 ff ff	movabsq	$-140737487218449, %rdi # imm = 0xFFFF8000001158EF
ffff80000010eda7: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010edb1: 31 c0                	xorl	%eax, %eax
ffff80000010edb3: ff d1                	callq	*%rcx
; }
ffff80000010edb5: 5b                   	popq	%rbx
ffff80000010edb6: 41 5e                	popq	%r14
ffff80000010edb8: 5d                   	popq	%rbp
ffff80000010edb9: c3                   	retq
ffff80000010edba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010edc0 <lab1_check_split_and_merge>:
; {
ffff80000010edc0: 55                   	pushq	%rbp
ffff80000010edc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010edc4: 41 57                	pushq	%r15
ffff80000010edc6: 41 56                	pushq	%r14
ffff80000010edc8: 41 55                	pushq	%r13
ffff80000010edca: 41 54                	pushq	%r12
ffff80000010edcc: 53                   	pushq	%rbx
ffff80000010edcd: 48 81 ec a8 00 00 00 	subq	$168, %rsp
ffff80000010edd4: 89 fb                	movl	%edi, %ebx
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff80000010edd6: 49 be 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %r14 # imm = 0xFFFF80000010D680
ffff80000010ede0: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ede5: 41 ff d6             	callq	*%r14
ffff80000010ede8: 49 89 c4             	movq	%rax, %r12
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010edeb: 48 b8 f0 da 10 00 00 80 ff ff	movabsq	$-140737487250704, %rax # imm = 0xFFFF80000010DAF0
ffff80000010edf5: bf 09 00 00 00       	movl	$9, %edi
ffff80000010edfa: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010edfc: 48 85 c0             	testq	%rax, %rax
ffff80000010edff: 0f 84 5d 02 00 00    	je	0xffff80000010f062 <lab1_check_split_and_merge+0x2a2>
ffff80000010ee05: 49 89 c7             	movq	%rax, %r15
ffff80000010ee08: 89 5d d4             	movl	%ebx, -44(%rbp)
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010ee0b: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ee10: 41 ff d6             	callq	*%r14
ffff80000010ee13: 48 83 c0 01          	addq	$1, %rax
ffff80000010ee17: 4c 39 e0             	cmpq	%r12, %rax
ffff80000010ee1a: 0f 85 69 02 00 00    	jne	0xffff80000010f089 <lab1_check_split_and_merge+0x2c9>
ffff80000010ee20: 31 db                	xorl	%ebx, %ebx
ffff80000010ee22: 49 bc 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r12 # imm = 0xFFFF80000011A240
ffff80000010ee2c: 49 bd 00 f2 10 00 00 80 ff ff	movabsq	$-140737487244800, %r13 # imm = 0xFFFF80000010F200
ffff80000010ee36: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		stolen_free_list[order] = buddy_free_list[order];
ffff80000010ee40: 4a 8d 3c 23          	leaq	(%rbx,%r12), %rdi
ffff80000010ee44: 4a 8b 04 23          	movq	(%rbx,%r12), %rax
ffff80000010ee48: 4a 8b 4c 23 08       	movq	8(%rbx,%r12), %rcx
ffff80000010ee4d: 48 89 8c 1d 38 ff ff ff      	movq	%rcx, -200(%rbp,%rbx)
ffff80000010ee55: 48 89 84 1d 30 ff ff ff      	movq	%rax, -208(%rbp,%rbx)
; 		list_init(buddy_free_list + order);
ffff80000010ee5d: 41 ff d5             	callq	*%r13
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010ee60: 48 83 c3 10          	addq	$16, %rbx
ffff80000010ee64: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010ee6b: 75 d3                	jne	0xffff80000010ee40 <lab1_check_split_and_merge+0x80>
; 	page_free(page);
ffff80000010ee6d: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010ee77: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ee7a: ff d0                	callq	*%rax
ffff80000010ee7c: 31 db                	xorl	%ebx, %ebx
ffff80000010ee7e: 66 90                	nop
; 		assert(count_free_pages(order) == 0);
ffff80000010ee80: 48 89 df             	movq	%rbx, %rdi
ffff80000010ee83: 41 ff d6             	callq	*%r14
ffff80000010ee86: 48 85 c0             	testq	%rax, %rax
ffff80000010ee89: 0f 85 40 01 00 00    	jne	0xffff80000010efcf <lab1_check_split_and_merge+0x20f>
ffff80000010ee8f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010ee93: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010ee97: 75 e7                	jne	0xffff80000010ee80 <lab1_check_split_and_merge+0xc0>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010ee99: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ee9e: 41 ff d6             	callq	*%r14
ffff80000010eea1: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010eea5: 0f 85 0f 02 00 00    	jne	0xffff80000010f0ba <lab1_check_split_and_merge+0x2fa>
; 	page = page_alloc(0);
ffff80000010eeab: 49 bd a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %r13 # imm = 0xFFFF80000010DBA0
ffff80000010eeb5: 31 ff                	xorl	%edi, %edi
ffff80000010eeb7: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010eeba: 48 85 c0             	testq	%rax, %rax
ffff80000010eebd: 0f 84 28 02 00 00    	je	0xffff80000010f0eb <lab1_check_split_and_merge+0x32b>
ffff80000010eec3: 49 89 c7             	movq	%rax, %r15
ffff80000010eec6: 31 db                	xorl	%ebx, %ebx
ffff80000010eec8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		assert(count_free_pages(order) == 1);
ffff80000010eed0: 48 89 df             	movq	%rbx, %rdi
ffff80000010eed3: 41 ff d6             	callq	*%r14
ffff80000010eed6: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010eeda: 0f 85 20 01 00 00    	jne	0xffff80000010f000 <lab1_check_split_and_merge+0x240>
ffff80000010eee0: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010eee4: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010eee8: 75 e6                	jne	0xffff80000010eed0 <lab1_check_split_and_merge+0x110>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010eeea: bf 09 00 00 00       	movl	$9, %edi
ffff80000010eeef: 41 ff d6             	callq	*%r14
ffff80000010eef2: 48 85 c0             	testq	%rax, %rax
ffff80000010eef5: 0f 85 17 02 00 00    	jne	0xffff80000010f112 <lab1_check_split_and_merge+0x352>
; 	page_free(page);
ffff80000010eefb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010eefe: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010ef08: ff d0                	callq	*%rax
ffff80000010ef0a: 31 db                	xorl	%ebx, %ebx
ffff80000010ef0c: 0f 1f 40 00          	nopl	(%rax)
; 		assert(count_free_pages(order) == 0);
ffff80000010ef10: 48 89 df             	movq	%rbx, %rdi
ffff80000010ef13: 41 ff d6             	callq	*%r14
ffff80000010ef16: 48 85 c0             	testq	%rax, %rax
ffff80000010ef19: 0f 85 12 01 00 00    	jne	0xffff80000010f031 <lab1_check_split_and_merge+0x271>
ffff80000010ef1f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010ef23: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010ef27: 75 e7                	jne	0xffff80000010ef10 <lab1_check_split_and_merge+0x150>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010ef29: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ef2e: 41 ff d6             	callq	*%r14
ffff80000010ef31: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010ef35: 0f 85 08 02 00 00    	jne	0xffff80000010f143 <lab1_check_split_and_merge+0x383>
; 	if (flags & ALLOC_HUGE)
ffff80000010ef3b: f6 45 d4 02          	testb	$2, -44(%rbp)
ffff80000010ef3f: 75 13                	jne	0xffff80000010ef54 <lab1_check_split_and_merge+0x194>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010ef41: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ef46: 48 b8 f0 da 10 00 00 80 ff ff	movabsq	$-140737487250704, %rax # imm = 0xFFFF80000010DAF0
ffff80000010ef50: ff d0                	callq	*%rax
ffff80000010ef52: eb 08                	jmp	0xffff80000010ef5c <lab1_check_split_and_merge+0x19c>
; 		page = page_alloc(ALLOC_HUGE);
ffff80000010ef54: bf 02 00 00 00       	movl	$2, %edi
ffff80000010ef59: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010ef5c: 48 85 c0             	testq	%rax, %rax
ffff80000010ef5f: 0f 84 0f 02 00 00    	je	0xffff80000010f174 <lab1_check_split_and_merge+0x3b4>
ffff80000010ef65: 31 c9                	xorl	%ecx, %ecx
ffff80000010ef67: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		buddy_free_list[order] = stolen_free_list[order];
ffff80000010ef70: 48 8b 94 0d 30 ff ff ff      	movq	-208(%rbp,%rcx), %rdx
ffff80000010ef78: 48 8b b4 0d 38 ff ff ff      	movq	-200(%rbp,%rcx), %rsi
ffff80000010ef80: 4a 89 74 21 08       	movq	%rsi, 8(%rcx,%r12)
ffff80000010ef85: 4a 89 14 21          	movq	%rdx, (%rcx,%r12)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010ef89: 48 83 c1 10          	addq	$16, %rcx
ffff80000010ef8d: 48 81 f9 a0 00 00 00 	cmpq	$160, %rcx
ffff80000010ef94: 75 da                	jne	0xffff80000010ef70 <lab1_check_split_and_merge+0x1b0>
; 	page_free(page);
ffff80000010ef96: 48 89 c7             	movq	%rax, %rdi
ffff80000010ef99: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010efa3: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff80000010efa5: 48 bf 47 56 11 00 00 80 ff ff	movabsq	$-140737487219129, %rdi # imm = 0xFFFF800000115647
ffff80000010efaf: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010efb9: 31 c0                	xorl	%eax, %eax
ffff80000010efbb: ff d1                	callq	*%rcx
; }
ffff80000010efbd: 48 81 c4 a8 00 00 00 	addq	$168, %rsp
ffff80000010efc4: 5b                   	popq	%rbx
ffff80000010efc5: 41 5c                	popq	%r12
ffff80000010efc7: 41 5d                	popq	%r13
ffff80000010efc9: 41 5e                	popq	%r14
ffff80000010efcb: 41 5f                	popq	%r15
ffff80000010efcd: 5d                   	popq	%rbp
ffff80000010efce: c3                   	retq
; 		assert(count_free_pages(order) == 0);
ffff80000010efcf: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010efd9: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010efe3: 48 b9 a2 56 11 00 00 80 ff ff	movabsq	$-140737487219038, %rcx # imm = 0xFFFF8000001156A2
ffff80000010efed: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010eff7: be ba 00 00 00       	movl	$186, %esi
ffff80000010effc: 31 c0                	xorl	%eax, %eax
ffff80000010effe: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 1);
ffff80000010f000: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f00a: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f014: 48 b9 02 58 11 00 00 80 ff ff	movabsq	$-140737487218686, %rcx # imm = 0xFFFF800000115802
ffff80000010f01e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f028: be c8 00 00 00       	movl	$200, %esi
ffff80000010f02d: 31 c0                	xorl	%eax, %eax
ffff80000010f02f: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 0);
ffff80000010f031: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f03b: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f045: 48 b9 a2 56 11 00 00 80 ff ff	movabsq	$-140737487219038, %rcx # imm = 0xFFFF8000001156A2
ffff80000010f04f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f059: be d2 00 00 00       	movl	$210, %esi
ffff80000010f05e: 31 c0                	xorl	%eax, %eax
ffff80000010f060: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010f062: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f06c: 48 ba 01 50 11 00 00 80 ff ff	movabsq	$-140737487220735, %rdx # imm = 0xFFFF800000115001
ffff80000010f076: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010f080: be a9 00 00 00       	movl	$169, %esi
ffff80000010f085: 31 c0                	xorl	%eax, %eax
ffff80000010f087: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010f089: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f093: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f09d: 48 b9 b9 51 11 00 00 80 ff ff	movabsq	$-140737487220295, %rcx # imm = 0xFFFF8000001151B9
ffff80000010f0a7: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f0b1: be ad 00 00 00       	movl	$173, %esi
ffff80000010f0b6: 31 c0                	xorl	%eax, %eax
ffff80000010f0b8: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010f0ba: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f0c4: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f0ce: 48 b9 31 4a 11 00 00 80 ff ff	movabsq	$-140737487222223, %rcx # imm = 0xFFFF800000114A31
ffff80000010f0d8: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f0e2: be bd 00 00 00       	movl	$189, %esi
ffff80000010f0e7: 31 c0                	xorl	%eax, %eax
ffff80000010f0e9: ff d3                	callq	*%rbx
; 		panic("can't allocate 4K page!");
ffff80000010f0eb: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f0f5: 48 ba 6e 4e 11 00 00 80 ff ff	movabsq	$-140737487221138, %rdx # imm = 0xFFFF800000114E6E
ffff80000010f0ff: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010f109: be c3 00 00 00       	movl	$195, %esi
ffff80000010f10e: 31 c0                	xorl	%eax, %eax
ffff80000010f110: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010f112: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f11c: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f126: 48 b9 ff 4e 11 00 00 80 ff ff	movabsq	$-140737487220993, %rcx # imm = 0xFFFF800000114EFF
ffff80000010f130: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f13a: be cb 00 00 00       	movl	$203, %esi
ffff80000010f13f: 31 c0                	xorl	%eax, %eax
ffff80000010f141: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010f143: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f14d: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000010f157: 48 b9 31 4a 11 00 00 80 ff ff	movabsq	$-140737487222223, %rcx # imm = 0xFFFF800000114A31
ffff80000010f161: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f16b: be d5 00 00 00       	movl	$213, %esi
ffff80000010f170: 31 c0                	xorl	%eax, %eax
ffff80000010f172: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010f174: 48 bf ea 48 11 00 00 80 ff ff	movabsq	$-140737487222550, %rdi # imm = 0xFFFF8000001148EA
ffff80000010f17e: 48 ba 01 50 11 00 00 80 ff ff	movabsq	$-140737487220735, %rdx # imm = 0xFFFF800000115001
ffff80000010f188: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010f192: be de 00 00 00       	movl	$222, %esi
ffff80000010f197: 31 c0                	xorl	%eax, %eax
ffff80000010f199: ff d1                	callq	*%rcx
ffff80000010f19b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f1a0 <lab1_check_mem>:
; {
ffff80000010f1a0: 55                   	pushq	%rbp
ffff80000010f1a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f1a4: 53                   	pushq	%rbx
ffff80000010f1a5: 50                   	pushq	%rax
ffff80000010f1a6: 48 89 fb             	movq	%rdi, %rbx
; 	lab1_check_free_list_avail();
ffff80000010f1a9: 48 b8 f0 e6 10 00 00 80 ff ff	movabsq	$-140737487247632, %rax # imm = 0xFFFF80000010E6F0
ffff80000010f1b3: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff80000010f1b5: 48 b8 30 e8 10 00 00 80 ff ff	movabsq	$-140737487247312, %rax # imm = 0xFFFF80000010E830
ffff80000010f1bf: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff80000010f1c1: 48 b8 e0 e8 10 00 00 80 ff ff	movabsq	$-140737487247136, %rax # imm = 0xFFFF80000010E8E0
ffff80000010f1cb: 48 89 df             	movq	%rbx, %rdi
ffff80000010f1ce: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff80000010f1d0: 48 b8 60 ed 10 00 00 80 ff ff	movabsq	$-140737487245984, %rax # imm = 0xFFFF80000010ED60
ffff80000010f1da: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff80000010f1dc: 48 b8 c0 ed 10 00 00 80 ff ff	movabsq	$-140737487245888, %rax # imm = 0xFFFF80000010EDC0
ffff80000010f1e6: 31 ff                	xorl	%edi, %edi
ffff80000010f1e8: ff d0                	callq	*%rax
; }
ffff80000010f1ea: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f1ee: 5b                   	popq	%rbx
ffff80000010f1ef: 5d                   	popq	%rbp
ffff80000010f1f0: c3                   	retq
ffff80000010f1f1: cc                   	int3
ffff80000010f1f2: cc                   	int3
ffff80000010f1f3: cc                   	int3
ffff80000010f1f4: cc                   	int3
ffff80000010f1f5: cc                   	int3
ffff80000010f1f6: cc                   	int3
ffff80000010f1f7: cc                   	int3
ffff80000010f1f8: cc                   	int3
ffff80000010f1f9: cc                   	int3
ffff80000010f1fa: cc                   	int3
ffff80000010f1fb: cc                   	int3
ffff80000010f1fc: cc                   	int3
ffff80000010f1fd: cc                   	int3
ffff80000010f1fe: cc                   	int3
ffff80000010f1ff: cc                   	int3

ffff80000010f200 <list_init>:
; {
ffff80000010f200: 55                   	pushq	%rbp
ffff80000010f201: 48 89 e5             	movq	%rsp, %rbp
; 	head->next = head;
ffff80000010f204: 48 89 3f             	movq	%rdi, (%rdi)
; 	head->prev = head;
ffff80000010f207: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010f20b: 5d                   	popq	%rbp
ffff80000010f20c: c3                   	retq
ffff80000010f20d: 0f 1f 00             	nopl	(%rax)

ffff80000010f210 <list_insert_after>:
; {
ffff80000010f210: 55                   	pushq	%rbp
ffff80000010f211: 48 89 e5             	movq	%rsp, %rbp
; 	new->prev = after;
ffff80000010f214: 48 89 7e 08          	movq	%rdi, 8(%rsi)
; 	new->next = after->next;
ffff80000010f218: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f21b: 48 89 06             	movq	%rax, (%rsi)
; 	after->next->prev = new;
ffff80000010f21e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f221: 48 89 70 08          	movq	%rsi, 8(%rax)
; 	after->next = new;
ffff80000010f225: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff80000010f228: 5d                   	popq	%rbp
ffff80000010f229: c3                   	retq
ffff80000010f22a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010f230 <list_insert_before>:
; {
ffff80000010f230: 55                   	pushq	%rbp
ffff80000010f231: 48 89 e5             	movq	%rsp, %rbp
; 	new->next = before;
ffff80000010f234: 48 89 3e             	movq	%rdi, (%rsi)
; 	new->prev = before->prev;
ffff80000010f237: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f23b: 48 89 46 08          	movq	%rax, 8(%rsi)
; 	before->prev->next = new;
ffff80000010f23f: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f243: 48 89 30             	movq	%rsi, (%rax)
; 	before->prev = new;
ffff80000010f246: 48 89 77 08          	movq	%rsi, 8(%rdi)
; }
ffff80000010f24a: 5d                   	popq	%rbp
ffff80000010f24b: c3                   	retq
ffff80000010f24c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f250 <list_del>:
; {
ffff80000010f250: 55                   	pushq	%rbp
ffff80000010f251: 48 89 e5             	movq	%rsp, %rbp
; 	node->prev->next = node->next;
ffff80000010f254: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f257: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f25b: 48 89 01             	movq	%rax, (%rcx)
; 	node->next->prev = node->prev;
ffff80000010f25e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f261: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff80000010f265: 48 89 3f             	movq	%rdi, (%rdi)
; 	node->prev = node;
ffff80000010f268: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010f26c: 5d                   	popq	%rbp
ffff80000010f26d: c3                   	retq
ffff80000010f26e: 66 90                	nop

ffff80000010f270 <list_add>:
; {
ffff80000010f270: 55                   	pushq	%rbp
ffff80000010f271: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_after(head, new);
ffff80000010f274: 48 b8 10 f2 10 00 00 80 ff ff	movabsq	$-140737487244784, %rax # imm = 0xFFFF80000010F210
ffff80000010f27e: ff d0                	callq	*%rax
; }
ffff80000010f280: 5d                   	popq	%rbp
ffff80000010f281: c3                   	retq
ffff80000010f282: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f28c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f290 <list_add_tail>:
; {
ffff80000010f290: 55                   	pushq	%rbp
ffff80000010f291: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_before(head, new);
ffff80000010f294: 48 b8 30 f2 10 00 00 80 ff ff	movabsq	$-140737487244752, %rax # imm = 0xFFFF80000010F230
ffff80000010f29e: ff d0                	callq	*%rax
; }
ffff80000010f2a0: 5d                   	popq	%rbp
ffff80000010f2a1: c3                   	retq
ffff80000010f2a2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f2ac: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f2b0 <list_pop_tail>:
; {
ffff80000010f2b0: 55                   	pushq	%rbp
ffff80000010f2b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f2b4: 53                   	pushq	%rbx
ffff80000010f2b5: 50                   	pushq	%rax
; 	if (head->prev == head)
ffff80000010f2b6: 48 8b 5f 08          	movq	8(%rdi), %rbx
ffff80000010f2ba: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010f2bd: 74 11                	je	0xffff80000010f2d0 <list_pop_tail+0x20>
; 	list_del(node);
ffff80000010f2bf: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010f2c9: 48 89 df             	movq	%rbx, %rdi
ffff80000010f2cc: ff d0                	callq	*%rax
ffff80000010f2ce: eb 02                	jmp	0xffff80000010f2d2 <list_pop_tail+0x22>
ffff80000010f2d0: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010f2d2: 48 89 d8             	movq	%rbx, %rax
ffff80000010f2d5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f2d9: 5b                   	popq	%rbx
ffff80000010f2da: 5d                   	popq	%rbp
ffff80000010f2db: c3                   	retq
ffff80000010f2dc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f2e0 <list_pop>:
; {
ffff80000010f2e0: 55                   	pushq	%rbp
ffff80000010f2e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f2e4: 53                   	pushq	%rbx
ffff80000010f2e5: 50                   	pushq	%rax
; 	if (head->next == head)
ffff80000010f2e6: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010f2e9: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010f2ec: 74 11                	je	0xffff80000010f2ff <list_pop+0x1f>
; 	list_del(node);
ffff80000010f2ee: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010f2f8: 48 89 df             	movq	%rbx, %rdi
ffff80000010f2fb: ff d0                	callq	*%rax
ffff80000010f2fd: eb 02                	jmp	0xffff80000010f301 <list_pop+0x21>
ffff80000010f2ff: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010f301: 48 89 d8             	movq	%rbx, %rax
ffff80000010f304: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f308: 5b                   	popq	%rbx
ffff80000010f309: 5d                   	popq	%rbp
ffff80000010f30a: c3                   	retq
ffff80000010f30b: cc                   	int3
ffff80000010f30c: cc                   	int3
ffff80000010f30d: cc                   	int3
ffff80000010f30e: cc                   	int3
ffff80000010f30f: cc                   	int3

ffff80000010f310 <vprintfmt>:
; {
ffff80000010f310: 55                   	pushq	%rbp
ffff80000010f311: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f314: 41 57                	pushq	%r15
ffff80000010f316: 41 56                	pushq	%r14
ffff80000010f318: 41 55                	pushq	%r13
ffff80000010f31a: 41 54                	pushq	%r12
ffff80000010f31c: 53                   	pushq	%rbx
ffff80000010f31d: 48 83 ec 38          	subq	$56, %rsp
ffff80000010f321: 49 89 d6             	movq	%rdx, %r14
ffff80000010f324: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f327: 49 89 ff             	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
ffff80000010f32a: 48 8b 41 10          	movq	16(%rcx), %rax
ffff80000010f32e: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010f332: 48 8b 01             	movq	(%rcx), %rax
ffff80000010f335: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010f339: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f33d: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010f341: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010f345: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff80000010f349: eb 44                	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; 			num = getuint(&ap, lflag);
ffff80000010f34b: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f34f: 48 b8 c0 f8 10 00 00 80 ff ff	movabsq	$-140737487243072, %rax # imm = 0xFFFF80000010F8C0
ffff80000010f359: ff d0                	callq	*%rax
ffff80000010f35b: 49 89 c4             	movq	%rax, %r12
ffff80000010f35e: 41 bf 10 00 00 00    	movl	$16, %r15d
ffff80000010f364: 45 0f b6 cd          	movzbl	%r13b, %r9d
ffff80000010f368: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f36c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
ffff80000010f370: 4c 89 e2             	movq	%r12, %rdx
ffff80000010f373: 44 89 f9             	movl	%r15d, %ecx
ffff80000010f376: 49 89 ff             	movq	%rdi, %r15
ffff80000010f379: 41 89 d8             	movl	%ebx, %r8d
ffff80000010f37c: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f37f: 48 b8 40 f9 10 00 00 80 ff ff	movabsq	$-140737487242944, %rax # imm = 0xFFFF80000010F940
ffff80000010f389: ff d0                	callq	*%rax
; 			break;
ffff80000010f38b: 49 83 c6 01          	addq	$1, %r14
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff80000010f38f: 41 0f b6 3e          	movzbl	(%r14), %edi
ffff80000010f393: 49 83 c6 01          	addq	$1, %r14
ffff80000010f397: 83 ff 25             	cmpl	$37, %edi
ffff80000010f39a: 74 14                	je	0xffff80000010f3b0 <vprintfmt+0xa0>
ffff80000010f39c: 40 84 ff             	testb	%dil, %dil
ffff80000010f39f: 0f 84 2e 04 00 00    	je	0xffff80000010f7d3 <vprintfmt+0x4c3>
ffff80000010f3a5: 48 89 de             	movq	%rbx, %rsi
ffff80000010f3a8: 41 ff d7             	callq	*%r15
ffff80000010f3ab: eb e2                	jmp	0xffff80000010f38f <vprintfmt+0x7f>
ffff80000010f3ad: 0f 1f 00             	nopl	(%rax)
ffff80000010f3b0: 41 b5 20             	movb	$32, %r13b
ffff80000010f3b3: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010f3b8: 31 f6                	xorl	%esi, %esi
ffff80000010f3ba: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f3be: 41 bf ff ff ff ff    	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
ffff80000010f3c4: c7 45 a8 00 00 00 00 	movl	$0, -88(%rbp)
ffff80000010f3cb: 48 bf 10 43 11 00 00 80 ff ff	movabsq	$-140737487224048, %rdi # imm = 0xFFFF800000114310
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f3d5: 4d 8d 66 01          	leaq	1(%r14), %r12
ffff80000010f3d9: eb 10                	jmp	0xffff80000010f3eb <vprintfmt+0xdb>
ffff80000010f3db: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f3e0: 49 83 c6 01          	addq	$1, %r14
ffff80000010f3e4: 49 83 c4 01          	addq	$1, %r12
ffff80000010f3e8: 41 89 cd             	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f3eb: 41 0f b6 0e          	movzbl	(%r14), %ecx
ffff80000010f3ef: 8d 51 dd             	leal	-35(%rcx), %edx
ffff80000010f3f2: 80 fa 55             	cmpb	$85, %dl
ffff80000010f3f5: 0f 87 25 01 00 00    	ja	0xffff80000010f520 <vprintfmt+0x210>
ffff80000010f3fb: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010f3fe: ff 24 d7             	jmpq	*(%rdi,%rdx,8)
ffff80000010f401: b1 30                	movb	$48, %cl
ffff80000010f403: eb db                	jmp	0xffff80000010f3e0 <vprintfmt+0xd0>
ffff80000010f405: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f40f: 90                   	nop
ffff80000010f410: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010f413: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010f416: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
ffff80000010f420: 43 8d 14 bf          	leal	(%r15,%r15,4), %edx
ffff80000010f424: 44 8d 3c 51          	leal	(%rcx,%rdx,2), %r15d
ffff80000010f428: 41 83 c7 d0          	addl	$-48, %r15d
; 				ch = *fmt;
ffff80000010f42c: 41 0f be 4e 01       	movsbl	1(%r14), %ecx
; 				precision = precision * 10 + ch - '0';
ffff80000010f431: 49 83 c6 01          	addq	$1, %r14
; 				if (ch < '0' || ch > '9')
ffff80000010f435: 8d 51 c6             	leal	-58(%rcx), %edx
ffff80000010f438: 80 fa f6             	cmpb	$-10, %dl
ffff80000010f43b: 73 e3                	jae	0xffff80000010f420 <vprintfmt+0x110>
; 			if (width < 0)
ffff80000010f43d: 85 db                	testl	%ebx, %ebx
ffff80000010f43f: 41 0f 48 df          	cmovsl	%r15d, %ebx
ffff80000010f443: b9 ff ff ff ff       	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
ffff80000010f448: 44 0f 48 f9          	cmovsl	%ecx, %r15d
ffff80000010f44c: eb 87                	jmp	0xffff80000010f3d5 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010f44e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f452: 49 83 c6 01          	addq	$1, %r14
ffff80000010f456: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f45a: 77 39                	ja	0xffff80000010f495 <vprintfmt+0x185>
ffff80000010f45c: 48 89 ca             	movq	%rcx, %rdx
ffff80000010f45f: 48 01 c2             	addq	%rax, %rdx
ffff80000010f462: 83 c1 08             	addl	$8, %ecx
ffff80000010f465: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f468: 44 8b 3a             	movl	(%rdx), %r15d
ffff80000010f46b: eb d0                	jmp	0xffff80000010f43d <vprintfmt+0x12d>
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f46d: 49 83 c6 01          	addq	$1, %r14
ffff80000010f471: c7 45 a8 01 00 00 00 	movl	$1, -88(%rbp)
ffff80000010f478: e9 58 ff ff ff       	jmp	0xffff80000010f3d5 <vprintfmt+0xc5>
; 			if (width < 0)
ffff80000010f47d: 85 db                	testl	%ebx, %ebx
ffff80000010f47f: b9 00 00 00 00       	movl	$0, %ecx
ffff80000010f484: 0f 48 d9             	cmovsl	%ecx, %ebx
ffff80000010f487: eb 03                	jmp	0xffff80000010f48c <vprintfmt+0x17c>
; 			lflag++;
ffff80000010f489: 83 c6 01             	addl	$1, %esi
ffff80000010f48c: 49 83 c6 01          	addq	$1, %r14
ffff80000010f490: e9 40 ff ff ff       	jmp	0xffff80000010f3d5 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010f495: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010f499: 48 8d 51 08          	leaq	8(%rcx), %rdx
ffff80000010f49d: 48 89 55 b8          	movq	%rdx, -72(%rbp)
ffff80000010f4a1: 44 8b 39             	movl	(%rcx), %r15d
ffff80000010f4a4: eb 97                	jmp	0xffff80000010f43d <vprintfmt+0x12d>
; 			putch(ch, putdat);
ffff80000010f4a6: bf 25 00 00 00       	movl	$37, %edi
ffff80000010f4ab: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f4af: 48 89 de             	movq	%rbx, %rsi
ffff80000010f4b2: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f4b6: 41 ff d7             	callq	*%r15
; 			break;
ffff80000010f4b9: 49 83 c6 01          	addq	$1, %r14
ffff80000010f4bd: e9 cd fe ff ff       	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; 			err = va_arg(ap, int);
ffff80000010f4c2: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f4c6: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f4ca: 0f 87 3a 01 00 00    	ja	0xffff80000010f60a <vprintfmt+0x2fa>
ffff80000010f4d0: 48 89 c8             	movq	%rcx, %rax
ffff80000010f4d3: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f4d7: 83 c1 08             	addl	$8, %ecx
ffff80000010f4da: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f4dd: e9 34 01 00 00       	jmp	0xffff80000010f616 <vprintfmt+0x306>
; 			num = getuint(&ap, lflag);
ffff80000010f4e2: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f4e6: 48 b8 c0 f8 10 00 00 80 ff ff	movabsq	$-140737487243072, %rax # imm = 0xFFFF80000010F8C0
ffff80000010f4f0: ff d0                	callq	*%rax
ffff80000010f4f2: 49 89 c4             	movq	%rax, %r12
ffff80000010f4f5: 41 bf 08 00 00 00    	movl	$8, %r15d
ffff80000010f4fb: e9 64 fe ff ff       	jmp	0xffff80000010f364 <vprintfmt+0x54>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010f500: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f504: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f508: 0f 87 55 01 00 00    	ja	0xffff80000010f663 <vprintfmt+0x353>
ffff80000010f50e: 48 89 c8             	movq	%rcx, %rax
ffff80000010f511: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f515: 83 c1 08             	addl	$8, %ecx
ffff80000010f518: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f51b: e9 4f 01 00 00       	jmp	0xffff80000010f66f <vprintfmt+0x35f>
; 			putch('%', putdat);
ffff80000010f520: bf 25 00 00 00       	movl	$37, %edi
ffff80000010f525: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f529: 48 89 de             	movq	%rbx, %rsi
ffff80000010f52c: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f530: 41 ff d7             	callq	*%r15
ffff80000010f533: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f53d: 0f 1f 00             	nopl	(%rax)
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff80000010f540: 4d 8d 74 24 ff       	leaq	-1(%r12), %r14
ffff80000010f545: 41 80 7c 24 fe 25    	cmpb	$37, -2(%r12)
ffff80000010f54b: 4d 89 f4             	movq	%r14, %r12
ffff80000010f54e: 75 f0                	jne	0xffff80000010f540 <vprintfmt+0x230>
ffff80000010f550: e9 3a fe ff ff       	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010f555: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f559: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f55d: 0f 87 07 02 00 00    	ja	0xffff80000010f76a <vprintfmt+0x45a>
ffff80000010f563: 48 89 c8             	movq	%rcx, %rax
ffff80000010f566: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f56a: 83 c1 08             	addl	$8, %ecx
ffff80000010f56d: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f570: e9 01 02 00 00       	jmp	0xffff80000010f776 <vprintfmt+0x466>
; 			num = getint(&ap, lflag);
ffff80000010f575: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f579: 48 b8 40 f8 10 00 00 80 ff ff	movabsq	$-140737487243200, %rax # imm = 0xFFFF80000010F840
ffff80000010f583: ff d0                	callq	*%rax
ffff80000010f585: 49 89 c4             	movq	%rax, %r12
ffff80000010f588: 41 bf 0a 00 00 00    	movl	$10, %r15d
; 			if ((long long) num < 0) {
ffff80000010f58e: 48 85 c0             	testq	%rax, %rax
ffff80000010f591: 0f 89 cd fd ff ff    	jns	0xffff80000010f364 <vprintfmt+0x54>
; 				putch('-', putdat);
ffff80000010f597: bf 2d 00 00 00       	movl	$45, %edi
ffff80000010f59c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010f5a0: ff 55 c8             	callq	*-56(%rbp)
; 				num = -(long long) num;
ffff80000010f5a3: 49 f7 dc             	negq	%r12
ffff80000010f5a6: e9 b9 fd ff ff       	jmp	0xffff80000010f364 <vprintfmt+0x54>
; 			putch('0', putdat);
ffff80000010f5ab: bf 30 00 00 00       	movl	$48, %edi
ffff80000010f5b0: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010f5b4: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f5b7: 4c 8b 65 c8          	movq	-56(%rbp), %r12
ffff80000010f5bb: 41 ff d4             	callq	*%r12
; 			putch('x', putdat);
ffff80000010f5be: bf 78 00 00 00       	movl	$120, %edi
ffff80000010f5c3: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f5c6: 41 ff d4             	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010f5c9: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f5cd: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f5d1: 0f 87 b2 01 00 00    	ja	0xffff80000010f789 <vprintfmt+0x479>
ffff80000010f5d7: 48 89 c8             	movq	%rcx, %rax
ffff80000010f5da: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f5de: 83 c1 08             	addl	$8, %ecx
ffff80000010f5e1: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f5e4: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f5e7: e9 72 fd ff ff       	jmp	0xffff80000010f35e <vprintfmt+0x4e>
; 			num = getuint(&ap, lflag);
ffff80000010f5ec: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f5f0: 48 b8 c0 f8 10 00 00 80 ff ff	movabsq	$-140737487243072, %rax # imm = 0xFFFF80000010F8C0
ffff80000010f5fa: ff d0                	callq	*%rax
ffff80000010f5fc: 49 89 c4             	movq	%rax, %r12
ffff80000010f5ff: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010f605: e9 5a fd ff ff       	jmp	0xffff80000010f364 <vprintfmt+0x54>
; 			err = va_arg(ap, int);
ffff80000010f60a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f60e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f612: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f616: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			err = va_arg(ap, int);
ffff80000010f61a: 49 83 c6 01          	addq	$1, %r14
ffff80000010f61e: 8b 00                	movl	(%rax), %eax
; 			if (err < 0)
ffff80000010f620: 89 c1                	movl	%eax, %ecx
ffff80000010f622: f7 d9                	negl	%ecx
ffff80000010f624: 0f 48 c8             	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010f627: 83 f9 08             	cmpl	$8, %ecx
ffff80000010f62a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f62e: 77 0d                	ja	0xffff80000010f63d <vprintfmt+0x32d>
ffff80000010f630: 83 f9 03             	cmpl	$3, %ecx
ffff80000010f633: 74 08                	je	0xffff80000010f63d <vprintfmt+0x32d>
ffff80000010f635: 85 c9                	testl	%ecx, %ecx
ffff80000010f637: 0f 85 60 01 00 00    	jne	0xffff80000010f79d <vprintfmt+0x48d>
; 				printfmt(putch, putdat, "error %d", err);
ffff80000010f63d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f640: 48 ba 86 53 11 00 00 80 ff ff	movabsq	$-140737487219834, %rdx # imm = 0xFFFF800000115386
ffff80000010f64a: 31 c0                	xorl	%eax, %eax
ffff80000010f64c: 49 89 f4             	movq	%rsi, %r12
ffff80000010f64f: 48 bb f0 f7 10 00 00 80 ff ff	movabsq	$-140737487243280, %rbx # imm = 0xFFFF80000010F7F0
ffff80000010f659: ff d3                	callq	*%rbx
ffff80000010f65b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010f65e: e9 2c fd ff ff       	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010f663: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f667: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f66b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f66f: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f672: 4d 85 e4             	testq	%r12, %r12
ffff80000010f675: 48 b8 bf 56 11 00 00 80 ff ff	movabsq	$-140737487219009, %rax # imm = 0xFFFF8000001156BF
ffff80000010f67f: 4c 0f 44 e0          	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
ffff80000010f683: 85 db                	testl	%ebx, %ebx
ffff80000010f685: 7e 50                	jle	0xffff80000010f6d7 <vprintfmt+0x3c7>
ffff80000010f687: 41 80 fd 2d          	cmpb	$45, %r13b
ffff80000010f68b: 74 4a                	je	0xffff80000010f6d7 <vprintfmt+0x3c7>
ffff80000010f68d: 44 88 6d ac          	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f691: 49 63 f7             	movslq	%r15d, %rsi
ffff80000010f694: 4c 89 e7             	movq	%r12, %rdi
ffff80000010f697: 48 b8 c0 01 11 00 00 80 ff ff	movabsq	$-140737487240768, %rax # imm = 0xFFFF8000001101C0
ffff80000010f6a1: ff d0                	callq	*%rax
ffff80000010f6a3: 41 89 dd             	movl	%ebx, %r13d
ffff80000010f6a6: 41 29 c5             	subl	%eax, %r13d
ffff80000010f6a9: 7e 2f                	jle	0xffff80000010f6da <vprintfmt+0x3ca>
ffff80000010f6ab: 0f b6 4d ac          	movzbl	-84(%rbp), %ecx
ffff80000010f6af: 89 4d ac             	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f6b2: 29 c3                	subl	%eax, %ebx
ffff80000010f6b4: 83 c3 01             	addl	$1, %ebx
ffff80000010f6b7: 4c 8b 6d c8          	movq	-56(%rbp), %r13
ffff80000010f6bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f6c0: 8b 7d ac             	movl	-84(%rbp), %edi
ffff80000010f6c3: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
ffff80000010f6c7: 41 ff d5             	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f6ca: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f6cd: 83 fb 01             	cmpl	$1, %ebx
ffff80000010f6d0: 7f ee                	jg	0xffff80000010f6c0 <vprintfmt+0x3b0>
ffff80000010f6d2: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010f6d5: eb 03                	jmp	0xffff80000010f6da <vprintfmt+0x3ca>
ffff80000010f6d7: 41 89 dd             	movl	%ebx, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010f6da: 41 8a 04 24          	movb	(%r12), %al
ffff80000010f6de: 84 c0                	testb	%al, %al
ffff80000010f6e0: 74 49                	je	0xffff80000010f72b <vprintfmt+0x41b>
ffff80000010f6e2: 49 83 c4 01          	addq	$1, %r12
ffff80000010f6e6: 8b 5d a8             	movl	-88(%rbp), %ebx
ffff80000010f6e9: eb 35                	jmp	0xffff80000010f720 <vprintfmt+0x410>
ffff80000010f6eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f6f0: 0f be c0             	movsbl	%al, %eax
ffff80000010f6f3: 8d 48 81             	leal	-127(%rax), %ecx
ffff80000010f6f6: 80 f9 a1             	cmpb	$-95, %cl
ffff80000010f6f9: 89 c7                	movl	%eax, %edi
ffff80000010f6fb: b9 3f 00 00 00       	movl	$63, %ecx
ffff80000010f700: 0f 42 f9             	cmovbl	%ecx, %edi
ffff80000010f703: 85 db                	testl	%ebx, %ebx
ffff80000010f705: 0f 44 f8             	cmovel	%eax, %edi
ffff80000010f708: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010f70c: ff 55 c8             	callq	*-56(%rbp)
; 					width--)
ffff80000010f70f: 41 83 c5 ff          	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010f713: 41 0f b6 04 24       	movzbl	(%r12), %eax
ffff80000010f718: 49 83 c4 01          	addq	$1, %r12
ffff80000010f71c: 84 c0                	testb	%al, %al
ffff80000010f71e: 74 0b                	je	0xffff80000010f72b <vprintfmt+0x41b>
ffff80000010f720: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f723: 78 cb                	js	0xffff80000010f6f0 <vprintfmt+0x3e0>
ffff80000010f725: 41 83 ef 01          	subl	$1, %r15d
ffff80000010f729: 73 c5                	jae	0xffff80000010f6f0 <vprintfmt+0x3e0>
ffff80000010f72b: 49 83 c6 01          	addq	$1, %r14
; 			for (; width > 0; width--)
ffff80000010f72f: 45 85 ed             	testl	%r13d, %r13d
ffff80000010f732: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f736: 48 8b 5d d0          	movq	-48(%rbp), %rbx
; 			for (; width > 0; width--)
ffff80000010f73a: 0f 8e 4f fc ff ff    	jle	0xffff80000010f38f <vprintfmt+0x7f>
; 	while (1) {
ffff80000010f740: 41 83 c5 01          	addl	$1, %r13d
ffff80000010f744: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f74e: 66 90                	nop
; 				putch(' ', putdat);
ffff80000010f750: bf 20 00 00 00       	movl	$32, %edi
ffff80000010f755: 48 89 de             	movq	%rbx, %rsi
ffff80000010f758: 41 ff d7             	callq	*%r15
; 			for (; width > 0; width--)
ffff80000010f75b: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010f75f: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010f763: 7f eb                	jg	0xffff80000010f750 <vprintfmt+0x440>
ffff80000010f765: e9 25 fc ff ff       	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010f76a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f76e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f772: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f776: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f77a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
ffff80000010f77e: 49 83 c6 01          	addq	$1, %r14
ffff80000010f782: 8b 38                	movl	(%rax), %edi
ffff80000010f784: e9 1c fc ff ff       	jmp	0xffff80000010f3a5 <vprintfmt+0x95>
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010f789: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f78d: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f791: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f795: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f798: e9 c1 fb ff ff       	jmp	0xffff80000010f35e <vprintfmt+0x4e>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010f79d: 89 c8                	movl	%ecx, %eax
ffff80000010f79f: 48 b9 c0 45 11 00 00 80 ff ff	movabsq	$-140737487223360, %rcx # imm = 0xFFFF8000001145C0
ffff80000010f7a9: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
ffff80000010f7ad: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f7b0: 48 ba 2c 4c 11 00 00 80 ff ff	movabsq	$-140737487221716, %rdx # imm = 0xFFFF800000114C2C
ffff80000010f7ba: 31 c0                	xorl	%eax, %eax
ffff80000010f7bc: 49 89 f4             	movq	%rsi, %r12
; 				printfmt(putch, putdat, "%s", p);
ffff80000010f7bf: 48 bb f0 f7 10 00 00 80 ff ff	movabsq	$-140737487243280, %rbx # imm = 0xFFFF80000010F7F0
ffff80000010f7c9: ff d3                	callq	*%rbx
ffff80000010f7cb: 4c 89 e3             	movq	%r12, %rbx
ffff80000010f7ce: e9 bc fb ff ff       	jmp	0xffff80000010f38f <vprintfmt+0x7f>
; }
ffff80000010f7d3: 48 83 c4 38          	addq	$56, %rsp
ffff80000010f7d7: 5b                   	popq	%rbx
ffff80000010f7d8: 41 5c                	popq	%r12
ffff80000010f7da: 41 5d                	popq	%r13
ffff80000010f7dc: 41 5e                	popq	%r14
ffff80000010f7de: 41 5f                	popq	%r15
ffff80000010f7e0: 5d                   	popq	%rbp
ffff80000010f7e1: c3                   	retq
ffff80000010f7e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f7ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f7f0 <printfmt>:
; {
ffff80000010f7f0: 55                   	pushq	%rbp
ffff80000010f7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7f4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010f7f8: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010f7fc: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010f800: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010f804: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010f808: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f80c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010f810: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f814: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010f81e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000010f822: 48 b8 10 f3 10 00 00 80 ff ff	movabsq	$-140737487244528, %rax # imm = 0xFFFF80000010F310
ffff80000010f82c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010f830: ff d0                	callq	*%rax
; }
ffff80000010f832: 48 83 c4 50          	addq	$80, %rsp
ffff80000010f836: 5d                   	popq	%rbp
ffff80000010f837: c3                   	retq
ffff80000010f838: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f840 <getint>:
; {
ffff80000010f840: 55                   	pushq	%rbp
ffff80000010f841: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010f844: 83 fe 02             	cmpl	$2, %esi
ffff80000010f847: 7c 17                	jl	0xffff80000010f860 <getint+0x20>
; 		return va_arg(*ap, long long);
ffff80000010f849: 48 63 07             	movslq	(%rdi), %rax
ffff80000010f84c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010f850: 77 2b                	ja	0xffff80000010f87d <getint+0x3d>
ffff80000010f852: 48 89 c1             	movq	%rax, %rcx
ffff80000010f855: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f859: 83 c0 08             	addl	$8, %eax
ffff80000010f85c: 89 07                	movl	%eax, (%rdi)
ffff80000010f85e: eb 18                	jmp	0xffff80000010f878 <getint+0x38>
ffff80000010f860: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010f863: 85 f6                	testl	%esi, %esi
ffff80000010f865: 74 27                	je	0xffff80000010f88e <getint+0x4e>
ffff80000010f867: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, long);
ffff80000010f86a: 77 11                	ja	0xffff80000010f87d <getint+0x3d>
ffff80000010f86c: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
ffff80000010f870: 48 01 c1             	addq	%rax, %rcx
ffff80000010f873: 83 c0 08             	addl	$8, %eax
ffff80000010f876: 89 07                	movl	%eax, (%rdi)
ffff80000010f878: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010f87b: 5d                   	popq	%rbp
ffff80000010f87c: c3                   	retq
ffff80000010f87d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f881: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f885: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010f889: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010f88c: 5d                   	popq	%rbp
ffff80000010f88d: c3                   	retq
ffff80000010f88e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, int);
ffff80000010f891: 77 0e                	ja	0xffff80000010f8a1 <getint+0x61>
ffff80000010f893: 48 89 c1             	movq	%rax, %rcx
ffff80000010f896: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f89a: 83 c0 08             	addl	$8, %eax
ffff80000010f89d: 89 07                	movl	%eax, (%rdi)
ffff80000010f89f: eb 0c                	jmp	0xffff80000010f8ad <getint+0x6d>
ffff80000010f8a1: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f8a5: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010f8a9: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010f8ad: 48 63 01             	movslq	(%rcx), %rax
; }
ffff80000010f8b0: 5d                   	popq	%rbp
ffff80000010f8b1: c3                   	retq
ffff80000010f8b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f8bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f8c0 <getuint>:
; {
ffff80000010f8c0: 55                   	pushq	%rbp
ffff80000010f8c1: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010f8c4: 83 fe 02             	cmpl	$2, %esi
ffff80000010f8c7: 7c 17                	jl	0xffff80000010f8e0 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
ffff80000010f8c9: 48 63 07             	movslq	(%rdi), %rax
ffff80000010f8cc: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010f8d0: 77 2b                	ja	0xffff80000010f8fd <getuint+0x3d>
ffff80000010f8d2: 48 89 c1             	movq	%rax, %rcx
ffff80000010f8d5: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f8d9: 83 c0 08             	addl	$8, %eax
ffff80000010f8dc: 89 07                	movl	%eax, (%rdi)
ffff80000010f8de: eb 18                	jmp	0xffff80000010f8f8 <getuint+0x38>
ffff80000010f8e0: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010f8e3: 85 f6                	testl	%esi, %esi
ffff80000010f8e5: 74 27                	je	0xffff80000010f90e <getuint+0x4e>
ffff80000010f8e7: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
ffff80000010f8ea: 77 11                	ja	0xffff80000010f8fd <getuint+0x3d>
ffff80000010f8ec: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000010f8f0: 48 01 c1             	addq	%rax, %rcx
ffff80000010f8f3: 83 c0 08             	addl	$8, %eax
ffff80000010f8f6: 89 07                	movl	%eax, (%rdi)
ffff80000010f8f8: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010f8fb: 5d                   	popq	%rbp
ffff80000010f8fc: c3                   	retq
ffff80000010f8fd: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f901: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f905: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010f909: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010f90c: 5d                   	popq	%rbp
ffff80000010f90d: c3                   	retq
ffff80000010f90e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
ffff80000010f911: 77 0e                	ja	0xffff80000010f921 <getuint+0x61>
ffff80000010f913: 48 89 c1             	movq	%rax, %rcx
ffff80000010f916: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f91a: 83 c0 08             	addl	$8, %eax
ffff80000010f91d: 89 07                	movl	%eax, (%rdi)
ffff80000010f91f: eb 0c                	jmp	0xffff80000010f92d <getuint+0x6d>
ffff80000010f921: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f925: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010f929: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010f92d: 8b 01                	movl	(%rcx), %eax
; }
ffff80000010f92f: 5d                   	popq	%rbp
ffff80000010f930: c3                   	retq
ffff80000010f931: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f93b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f940 <printnum>:
; {
ffff80000010f940: 55                   	pushq	%rbp
ffff80000010f941: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f944: 41 57                	pushq	%r15
ffff80000010f946: 41 56                	pushq	%r14
ffff80000010f948: 41 55                	pushq	%r13
ffff80000010f94a: 41 54                	pushq	%r12
ffff80000010f94c: 53                   	pushq	%rbx
ffff80000010f94d: 50                   	pushq	%rax
ffff80000010f94e: 45 89 cd             	movl	%r9d, %r13d
ffff80000010f951: 44 89 c3             	movl	%r8d, %ebx
ffff80000010f954: 49 89 f6             	movq	%rsi, %r14
ffff80000010f957: 49 89 fc             	movq	%rdi, %r12
; 	if (num >= base) {
ffff80000010f95a: 41 89 cf             	movl	%ecx, %r15d
ffff80000010f95d: 49 39 d7             	cmpq	%rdx, %r15
ffff80000010f960: 48 89 55 d0          	movq	%rdx, -48(%rbp)
ffff80000010f964: 76 1d                	jbe	0xffff80000010f983 <printnum+0x43>
; 		while (--width > 0)
ffff80000010f966: 83 fb 02             	cmpl	$2, %ebx
ffff80000010f969: 7c 3f                	jl	0xffff80000010f9aa <printnum+0x6a>
ffff80000010f96b: 83 c3 01             	addl	$1, %ebx
ffff80000010f96e: 66 90                	nop
; 			putch(padc, putdat);
ffff80000010f970: 44 89 ef             	movl	%r13d, %edi
ffff80000010f973: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f976: 41 ff d4             	callq	*%r12
; 		while (--width > 0)
ffff80000010f979: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f97c: 83 fb 02             	cmpl	$2, %ebx
ffff80000010f97f: 7f ef                	jg	0xffff80000010f970 <printnum+0x30>
ffff80000010f981: eb 27                	jmp	0xffff80000010f9aa <printnum+0x6a>
ffff80000010f983: 48 89 d0             	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff80000010f986: 31 d2                	xorl	%edx, %edx
ffff80000010f988: 49 f7 f7             	divq	%r15
ffff80000010f98b: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f98e: 49 ba 40 f9 10 00 00 80 ff ff	movabsq	$-140737487242944, %r10 # imm = 0xFFFF80000010F940
ffff80000010f998: 4c 89 e7             	movq	%r12, %rdi
ffff80000010f99b: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f99e: 48 89 c2             	movq	%rax, %rdx
ffff80000010f9a1: 41 89 d8             	movl	%ebx, %r8d
ffff80000010f9a4: 45 89 e9             	movl	%r13d, %r9d
ffff80000010f9a7: 41 ff d2             	callq	*%r10
ffff80000010f9aa: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
ffff80000010f9ae: 31 d2                	xorl	%edx, %edx
ffff80000010f9b0: 49 f7 f7             	divq	%r15
ffff80000010f9b3: 48 b8 8f 53 11 00 00 80 ff ff	movabsq	$-140737487219825, %rax # imm = 0xFFFF80000011538F
ffff80000010f9bd: 0f be 3c 02          	movsbl	(%rdx,%rax), %edi
ffff80000010f9c1: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f9c4: 41 ff d4             	callq	*%r12
; }
ffff80000010f9c7: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f9cb: 5b                   	popq	%rbx
ffff80000010f9cc: 41 5c                	popq	%r12
ffff80000010f9ce: 41 5d                	popq	%r13
ffff80000010f9d0: 41 5e                	popq	%r14
ffff80000010f9d2: 41 5f                	popq	%r15
ffff80000010f9d4: 5d                   	popq	%rbp
ffff80000010f9d5: c3                   	retq
ffff80000010f9d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f9e0 <vsnprintf>:
; {
ffff80000010f9e0: 55                   	pushq	%rbp
ffff80000010f9e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9e4: 48 83 ec 20          	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff80000010f9e8: 48 89 7d e8          	movq	%rdi, -24(%rbp)
ffff80000010f9ec: 48 63 c6             	movslq	%esi, %rax
ffff80000010f9ef: 48 01 f8             	addq	%rdi, %rax
ffff80000010f9f2: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010f9f6: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f9fa: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010fa01: b8 fb ff ff ff       	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
ffff80000010fa06: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fa09: 74 28                	je	0xffff80000010fa33 <vsnprintf+0x53>
ffff80000010fa0b: 85 f6                	testl	%esi, %esi
ffff80000010fa0d: 7e 24                	jle	0xffff80000010fa33 <vsnprintf+0x53>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff80000010fa0f: 48 bf 40 fa 10 00 00 80 ff ff	movabsq	$-140737487242688, %rdi # imm = 0xFFFF80000010FA40
ffff80000010fa19: 48 b8 10 f3 10 00 00 80 ff ff	movabsq	$-140737487244528, %rax # imm = 0xFFFF80000010F310
ffff80000010fa23: 48 8d 75 e8          	leaq	-24(%rbp), %rsi
ffff80000010fa27: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff80000010fa29: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fa2d: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff80000010fa30: 8b 45 f8             	movl	-8(%rbp), %eax
; }
ffff80000010fa33: 48 83 c4 20          	addq	$32, %rsp
ffff80000010fa37: 5d                   	popq	%rbp
ffff80000010fa38: c3                   	retq
ffff80000010fa39: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010fa40 <sprintputch>:
; {
ffff80000010fa40: 55                   	pushq	%rbp
ffff80000010fa41: 48 89 e5             	movq	%rsp, %rbp
; 	b->cnt++;
ffff80000010fa44: 83 46 10 01          	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
ffff80000010fa48: 48 8b 06             	movq	(%rsi), %rax
ffff80000010fa4b: 48 3b 46 08          	cmpq	8(%rsi), %rax
ffff80000010fa4f: 73 0a                	jae	0xffff80000010fa5b <sprintputch+0x1b>
; 		*b->buf++ = ch;
ffff80000010fa51: 48 8d 48 01          	leaq	1(%rax), %rcx
ffff80000010fa55: 48 89 0e             	movq	%rcx, (%rsi)
ffff80000010fa58: 40 88 38             	movb	%dil, (%rax)
; }
ffff80000010fa5b: 5d                   	popq	%rbp
ffff80000010fa5c: c3                   	retq
ffff80000010fa5d: 0f 1f 00             	nopl	(%rax)

ffff80000010fa60 <snprintf>:
; {
ffff80000010fa60: 55                   	pushq	%rbp
ffff80000010fa61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa64: 48 83 ec 50          	subq	$80, %rsp
ffff80000010fa68: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010fa6c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010fa70: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010fa74: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010fa78: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fa7c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010fa80: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010fa84: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010fa8e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff80000010fa92: 48 b8 e0 f9 10 00 00 80 ff ff	movabsq	$-140737487242784, %rax # imm = 0xFFFF80000010F9E0
ffff80000010fa9c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010faa0: ff d0                	callq	*%rax
; 	return rc;
ffff80000010faa2: 48 83 c4 50          	addq	$80, %rsp
ffff80000010faa6: 5d                   	popq	%rbp
ffff80000010faa7: c3                   	retq
ffff80000010faa8: cc                   	int3
ffff80000010faa9: cc                   	int3
ffff80000010faaa: cc                   	int3
ffff80000010faab: cc                   	int3
ffff80000010faac: cc                   	int3
ffff80000010faad: cc                   	int3
ffff80000010faae: cc                   	int3
ffff80000010faaf: cc                   	int3

ffff80000010fab0 <rb_first>:
; {
ffff80000010fab0: 55                   	pushq	%rbp
ffff80000010fab1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_LEFT);
ffff80000010fab4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010fab7: 48 b8 d0 fa 10 00 00 80 ff ff	movabsq	$-140737487242544, %rax # imm = 0xFFFF80000010FAD0
ffff80000010fac1: 31 f6                	xorl	%esi, %esi
ffff80000010fac3: ff d0                	callq	*%rax
ffff80000010fac5: 5d                   	popq	%rbp
ffff80000010fac6: c3                   	retq
ffff80000010fac7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fad0 <get_outermost>:
; {
ffff80000010fad0: 55                   	pushq	%rbp
ffff80000010fad1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node) {
ffff80000010fad4: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fad7: 74 16                	je	0xffff80000010faef <get_outermost+0x1f>
ffff80000010fad9: 89 f1                	movl	%esi, %ecx
ffff80000010fadb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010fae0: 48 89 f8             	movq	%rdi, %rax
; 	while (node->child[dir]) {
ffff80000010fae3: 48 8b 7c cf 08       	movq	8(%rdi,%rcx,8), %rdi
ffff80000010fae8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010faeb: 75 f3                	jne	0xffff80000010fae0 <get_outermost+0x10>
; }
ffff80000010faed: 5d                   	popq	%rbp
ffff80000010faee: c3                   	retq
ffff80000010faef: 31 c0                	xorl	%eax, %eax
; }
ffff80000010faf1: 5d                   	popq	%rbp
ffff80000010faf2: c3                   	retq
ffff80000010faf3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fafd: 0f 1f 00             	nopl	(%rax)

ffff80000010fb00 <rb_last>:
; {
ffff80000010fb00: 55                   	pushq	%rbp
ffff80000010fb01: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_RIGHT);
ffff80000010fb04: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010fb07: 48 b8 d0 fa 10 00 00 80 ff ff	movabsq	$-140737487242544, %rax # imm = 0xFFFF80000010FAD0
ffff80000010fb11: be 01 00 00 00       	movl	$1, %esi
ffff80000010fb16: ff d0                	callq	*%rax
ffff80000010fb18: 5d                   	popq	%rbp
ffff80000010fb19: c3                   	retq
ffff80000010fb1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010fb20 <rb_next>:
; {
ffff80000010fb20: 55                   	pushq	%rbp
ffff80000010fb21: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_RIGHT);
ffff80000010fb24: 48 b8 40 fb 10 00 00 80 ff ff	movabsq	$-140737487242432, %rax # imm = 0xFFFF80000010FB40
ffff80000010fb2e: be 01 00 00 00       	movl	$1, %esi
ffff80000010fb33: ff d0                	callq	*%rax
ffff80000010fb35: 5d                   	popq	%rbp
ffff80000010fb36: c3                   	retq
ffff80000010fb37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fb40 <get_closest>:
; {
ffff80000010fb40: 55                   	pushq	%rbp
ffff80000010fb41: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node)
ffff80000010fb44: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fb47: 74 3b                	je	0xffff80000010fb84 <get_closest+0x44>
; 	if (node->child[dir])
ffff80000010fb49: 89 f1                	movl	%esi, %ecx
ffff80000010fb4b: 48 8b 44 cf 08       	movq	8(%rdi,%rcx,8), %rax
ffff80000010fb50: 48 85 c0             	testq	%rax, %rax
ffff80000010fb53: 74 25                	je	0xffff80000010fb7a <get_closest+0x3a>
; 		return get_outermost(node->child[dir], !dir);
ffff80000010fb55: 31 c9                	xorl	%ecx, %ecx
ffff80000010fb57: 85 f6                	testl	%esi, %esi
ffff80000010fb59: 0f 94 c1             	sete	%cl
ffff80000010fb5c: 48 ba d0 fa 10 00 00 80 ff ff	movabsq	$-140737487242544, %rdx # imm = 0xFFFF80000010FAD0
ffff80000010fb66: 48 89 c7             	movq	%rax, %rdi
ffff80000010fb69: 89 ce                	movl	%ecx, %esi
ffff80000010fb6b: ff d2                	callq	*%rdx
; }
ffff80000010fb6d: 5d                   	popq	%rbp
ffff80000010fb6e: c3                   	retq
ffff80000010fb6f: 90                   	nop
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff80000010fb70: 48 39 7c c8 08       	cmpq	%rdi, 8(%rax,%rcx,8)
ffff80000010fb75: 48 89 c7             	movq	%rax, %rdi
ffff80000010fb78: 75 08                	jne	0xffff80000010fb82 <get_closest+0x42>
ffff80000010fb7a: 48 8b 07             	movq	(%rdi), %rax
ffff80000010fb7d: 48 85 c0             	testq	%rax, %rax
ffff80000010fb80: 75 ee                	jne	0xffff80000010fb70 <get_closest+0x30>
; }
ffff80000010fb82: 5d                   	popq	%rbp
ffff80000010fb83: c3                   	retq
ffff80000010fb84: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fb86: 5d                   	popq	%rbp
ffff80000010fb87: c3                   	retq
ffff80000010fb88: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010fb90 <rb_prev>:
; {
ffff80000010fb90: 55                   	pushq	%rbp
ffff80000010fb91: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_LEFT);
ffff80000010fb94: 48 b8 40 fb 10 00 00 80 ff ff	movabsq	$-140737487242432, %rax # imm = 0xFFFF80000010FB40
ffff80000010fb9e: 31 f6                	xorl	%esi, %esi
ffff80000010fba0: ff d0                	callq	*%rax
ffff80000010fba2: 5d                   	popq	%rbp
ffff80000010fba3: c3                   	retq
ffff80000010fba4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fbae: 66 90                	nop

ffff80000010fbb0 <rb_balance>:
; {
ffff80000010fbb0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010fbb5: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fbb8: 0f 84 f0 00 00 00    	je	0xffff80000010fcae <rb_balance+0xfe>
ffff80000010fbbe: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fbc1: 0f 84 e7 00 00 00    	je	0xffff80000010fcae <rb_balance+0xfe>
ffff80000010fbc7: 55                   	pushq	%rbp
ffff80000010fbc8: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fbcb: 41 57                	pushq	%r15
ffff80000010fbcd: 41 56                	pushq	%r14
ffff80000010fbcf: 41 55                	pushq	%r13
ffff80000010fbd1: 41 54                	pushq	%r12
ffff80000010fbd3: 53                   	pushq	%rbx
ffff80000010fbd4: 50                   	pushq	%rax
ffff80000010fbd5: 49 89 fe             	movq	%rdi, %r14
; 	node->color = RB_RED;
ffff80000010fbd8: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fbdf: 48 8b 1e             	movq	(%rsi), %rbx
ffff80000010fbe2: 48 85 db             	testq	%rbx, %rbx
ffff80000010fbe5: 0f 84 a9 00 00 00    	je	0xffff80000010fc94 <rb_balance+0xe4>
ffff80000010fbeb: 49 bd b0 fc 10 00 00 80 ff ff	movabsq	$-140737487242064, %r13 # imm = 0xFFFF80000010FCB0
ffff80000010fbf5: eb 2a                	jmp	0xffff80000010fc21 <rb_balance+0x71>
ffff80000010fbf7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 			parent->color = RB_BLACK;
ffff80000010fc00: c7 43 18 00 00 00 00 	movl	$0, 24(%rbx)
; 			uncle->color = RB_BLACK;
ffff80000010fc07: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			grandparent->color = RB_RED;
ffff80000010fc0e: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fc16: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010fc19: 4c 89 fe             	movq	%r15, %rsi
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fc1c: 48 85 db             	testq	%rbx, %rbx
ffff80000010fc1f: 74 73                	je	0xffff80000010fc94 <rb_balance+0xe4>
ffff80000010fc21: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010fc25: 75 6d                	jne	0xffff80000010fc94 <rb_balance+0xe4>
; 		grandparent = parent->parent;
ffff80000010fc27: 4c 8b 3b             	movq	(%rbx), %r15
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010fc2a: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010fc2e: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010fc31: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010fc34: 41 0f 94 c4          	sete	%r12b
; 		uncle = grandparent->child[dir];
ffff80000010fc38: 4b 8b 4c e7 08       	movq	8(%r15,%r12,8), %rcx
; 		if (uncle && uncle->color == RB_RED) {
ffff80000010fc3d: 48 85 c9             	testq	%rcx, %rcx
ffff80000010fc40: 74 06                	je	0xffff80000010fc48 <rb_balance+0x98>
ffff80000010fc42: 83 79 18 01          	cmpl	$1, 24(%rcx)
ffff80000010fc46: 74 b8                	je	0xffff80000010fc00 <rb_balance+0x50>
; 		if (parent->child[dir] == node) {
ffff80000010fc48: 4a 39 74 e3 08       	cmpq	%rsi, 8(%rbx,%r12,8)
ffff80000010fc4d: 74 11                	je	0xffff80000010fc60 <rb_balance+0xb0>
ffff80000010fc4f: 48 89 d8             	movq	%rbx, %rax
ffff80000010fc52: 48 89 f3             	movq	%rsi, %rbx
ffff80000010fc55: eb 1d                	jmp	0xffff80000010fc74 <rb_balance+0xc4>
ffff80000010fc57: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010fc60: 31 d2                	xorl	%edx, %edx
ffff80000010fc62: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010fc65: 0f 95 c2             	setne	%dl
; 			rotate_node(tree, parent, !dir);
ffff80000010fc68: 4c 89 f7             	movq	%r14, %rdi
ffff80000010fc6b: 48 89 de             	movq	%rbx, %rsi
ffff80000010fc6e: 41 ff d5             	callq	*%r13
; 			parent = node->parent;
ffff80000010fc71: 48 8b 03             	movq	(%rbx), %rax
; 		parent->color = RB_BLACK;
ffff80000010fc74: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff80000010fc7b: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 		rotate_node(tree, grandparent, dir);
ffff80000010fc83: 4c 89 f7             	movq	%r14, %rdi
ffff80000010fc86: 4c 89 fe             	movq	%r15, %rsi
ffff80000010fc89: 44 89 e2             	movl	%r12d, %edx
ffff80000010fc8c: 41 ff d5             	callq	*%r13
ffff80000010fc8f: 49 89 df             	movq	%rbx, %r15
ffff80000010fc92: eb 82                	jmp	0xffff80000010fc16 <rb_balance+0x66>
; 	tree->root->color = RB_BLACK;
ffff80000010fc94: 49 8b 06             	movq	(%r14), %rax
ffff80000010fc97: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010fc9e: 31 c0                	xorl	%eax, %eax
ffff80000010fca0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010fca4: 5b                   	popq	%rbx
ffff80000010fca5: 41 5c                	popq	%r12
ffff80000010fca7: 41 5d                	popq	%r13
ffff80000010fca9: 41 5e                	popq	%r14
ffff80000010fcab: 41 5f                	popq	%r15
ffff80000010fcad: 5d                   	popq	%rbp
; }
ffff80000010fcae: c3                   	retq
ffff80000010fcaf: 90                   	nop

ffff80000010fcb0 <rotate_node>:
; {
ffff80000010fcb0: 55                   	pushq	%rbp
ffff80000010fcb1: 48 89 e5             	movq	%rsp, %rbp
; 	struct rb_node *parent = node->parent;
ffff80000010fcb4: 4c 8b 06             	movq	(%rsi), %r8
; 	struct rb_node *child = node->child[!dir];
ffff80000010fcb7: 31 c9                	xorl	%ecx, %ecx
ffff80000010fcb9: 85 d2                	testl	%edx, %edx
ffff80000010fcbb: 0f 94 c1             	sete	%cl
ffff80000010fcbe: 48 8b 44 ce 08       	movq	8(%rsi,%rcx,8), %rax
; 	if ((node->child[!dir] = child->child[dir])) {
ffff80000010fcc3: 41 89 d1             	movl	%edx, %r9d
ffff80000010fcc6: 4a 8b 54 c8 08       	movq	8(%rax,%r9,8), %rdx
ffff80000010fccb: 48 89 54 ce 08       	movq	%rdx, 8(%rsi,%rcx,8)
ffff80000010fcd0: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fcd3: 74 08                	je	0xffff80000010fcdd <rotate_node+0x2d>
; 		child->child[dir]->parent = node;
ffff80000010fcd5: 4a 8b 4c c8 08       	movq	8(%rax,%r9,8), %rcx
ffff80000010fcda: 48 89 31             	movq	%rsi, (%rcx)
; 	child->child[dir] = node;
ffff80000010fcdd: 4a 89 74 c8 08       	movq	%rsi, 8(%rax,%r9,8)
; 	child->parent = parent;
ffff80000010fce2: 4c 89 00             	movq	%r8, (%rax)
; 	if (parent) {
ffff80000010fce5: 4d 85 c0             	testq	%r8, %r8
ffff80000010fce8: 74 11                	je	0xffff80000010fcfb <rotate_node+0x4b>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff80000010fcea: 31 c9                	xorl	%ecx, %ecx
ffff80000010fcec: 49 39 70 10          	cmpq	%rsi, 16(%r8)
ffff80000010fcf0: 0f 94 c1             	sete	%cl
ffff80000010fcf3: 49 8d 3c c8          	leaq	(%r8,%rcx,8), %rdi
ffff80000010fcf7: 48 83 c7 08          	addq	$8, %rdi
ffff80000010fcfb: 48 89 07             	movq	%rax, (%rdi)
; 	node->parent = child;
ffff80000010fcfe: 48 89 06             	movq	%rax, (%rsi)
; }
ffff80000010fd01: 5d                   	popq	%rbp
ffff80000010fd02: c3                   	retq
ffff80000010fd03: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fd0d: 0f 1f 00             	nopl	(%rax)

ffff80000010fd10 <rb_remove>:
; {
ffff80000010fd10: 55                   	pushq	%rbp
ffff80000010fd11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fd14: 41 57                	pushq	%r15
ffff80000010fd16: 41 56                	pushq	%r14
ffff80000010fd18: 41 55                	pushq	%r13
ffff80000010fd1a: 41 54                	pushq	%r12
ffff80000010fd1c: 53                   	pushq	%rbx
ffff80000010fd1d: 50                   	pushq	%rax
ffff80000010fd1e: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010fd23: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fd26: 0f 84 b9 01 00 00    	je	0xffff80000010fee5 <rb_remove+0x1d5>
ffff80000010fd2c: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010fd2f: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fd32: 0f 84 ad 01 00 00    	je	0xffff80000010fee5 <rb_remove+0x1d5>
ffff80000010fd38: 49 89 ff             	movq	%rdi, %r15
; 	child_dir = !node->child[RB_LEFT];
ffff80000010fd3b: 31 c0                	xorl	%eax, %eax
ffff80000010fd3d: 31 c9                	xorl	%ecx, %ecx
ffff80000010fd3f: 48 83 7b 08 00       	cmpq	$0, 8(%rbx)
ffff80000010fd44: 0f 95 c0             	setne	%al
ffff80000010fd47: 0f 94 c1             	sete	%cl
; 	child = node->child[child_dir];
ffff80000010fd4a: 4c 8b 6c cb 08       	movq	8(%rbx,%rcx,8), %r13
; 	if (!child && !other)
ffff80000010fd4f: 4c 8b 74 c3 08       	movq	8(%rbx,%rax,8), %r14
; 	do_remove(tree, node);
ffff80000010fd54: 48 b8 00 ff 10 00 00 80 ff ff	movabsq	$-140737487241472, %rax # imm = 0xFFFF80000010FF00
ffff80000010fd5e: 48 89 de             	movq	%rbx, %rsi
ffff80000010fd61: ff d0                	callq	*%rax
ffff80000010fd63: 31 c0                	xorl	%eax, %eax
; 	if (!child && !other)
ffff80000010fd65: 4d 09 ee             	orq	%r13, %r14
ffff80000010fd68: 0f 84 77 01 00 00    	je	0xffff80000010fee5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED)
ffff80000010fd6e: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010fd72: 0f 84 6d 01 00 00    	je	0xffff80000010fee5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED) {
ffff80000010fd78: 41 83 7d 18 01       	cmpl	$1, 24(%r13)
ffff80000010fd7d: 75 09                	jne	0xffff80000010fd88 <rb_remove+0x78>
ffff80000010fd7f: 49 83 c5 18          	addq	$24, %r13
ffff80000010fd83: e9 51 01 00 00       	jmp	0xffff80000010fed9 <rb_remove+0x1c9>
; 	while (node->parent) {
ffff80000010fd88: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fd8c: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fd8f: 0f 84 39 01 00 00    	je	0xffff80000010fece <rb_remove+0x1be>
ffff80000010fd95: 48 b9 b0 fc 10 00 00 80 ff ff	movabsq	$-140737487242064, %rcx # imm = 0xFFFF80000010FCB0
ffff80000010fd9f: eb 31                	jmp	0xffff80000010fdd2 <rb_remove+0xc2>
ffff80000010fda1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fdab: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 			sibling->color = RB_RED;
ffff80000010fdb0: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010fdb7: 48 b9 b0 fc 10 00 00 80 ff ff	movabsq	$-140737487242064, %rcx # imm = 0xFFFF80000010FCB0
ffff80000010fdc1: 4d 8b 6d 00          	movq	(%r13), %r13
; 	while (node->parent) {
ffff80000010fdc5: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fdc9: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fdcc: 0f 84 fc 00 00 00    	je	0xffff80000010fece <rb_remove+0x1be>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fdd2: 4c 8b 76 08          	movq	8(%rsi), %r14
ffff80000010fdd6: 31 db                	xorl	%ebx, %ebx
ffff80000010fdd8: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fddb: 0f 94 c3             	sete	%bl
; 		sibling = node->parent->child[dir];
ffff80000010fdde: 48 8b 44 de 08       	movq	8(%rsi,%rbx,8), %rax
; 		if (!sibling) {
ffff80000010fde3: 48 85 c0             	testq	%rax, %rax
ffff80000010fde6: 0f 84 e2 00 00 00    	je	0xffff80000010fece <rb_remove+0x1be>
; 		if (sibling->color == RB_RED) {
ffff80000010fdec: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000010fdf0: 75 24                	jne	0xffff80000010fe16 <rb_remove+0x106>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fdf2: 31 d2                	xorl	%edx, %edx
ffff80000010fdf4: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fdf7: 0f 95 c2             	setne	%dl
; 			node->parent->color = RB_RED;
ffff80000010fdfa: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 			sibling->color = RB_BLACK;
ffff80000010fe01: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff80000010fe08: 4c 89 ff             	movq	%r15, %rdi
ffff80000010fe0b: ff d1                	callq	*%rcx
; 			sibling = node->parent->child[dir];
ffff80000010fe0d: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010fe11: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fe16: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010fe19: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fe1c: 41 0f 95 c4          	setne	%r12b
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010fe20: 4a 8b 4c e0 08       	movq	8(%rax,%r12,8), %rcx
ffff80000010fe25: 48 85 c9             	testq	%rcx, %rcx
ffff80000010fe28: 74 06                	je	0xffff80000010fe30 <rb_remove+0x120>
ffff80000010fe2a: 83 79 18 00          	cmpl	$0, 24(%rcx)
; 		    RB_BLACK) &&
ffff80000010fe2e: 75 18                	jne	0xffff80000010fe48 <rb_remove+0x138>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010fe30: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010fe35: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fe38: 0f 84 72 ff ff ff    	je	0xffff80000010fdb0 <rb_remove+0xa0>
ffff80000010fe3e: 83 7a 18 00          	cmpl	$0, 24(%rdx)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010fe42: 0f 84 68 ff ff ff    	je	0xffff80000010fdb0 <rb_remove+0xa0>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010fe48: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010fe4d: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fe50: 74 1e                	je	0xffff80000010fe70 <rb_remove+0x160>
ffff80000010fe52: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010fe56: 74 18                	je	0xffff80000010fe70 <rb_remove+0x160>
ffff80000010fe58: 49 be b0 fc 10 00 00 80 ff ff	movabsq	$-140737487242064, %r14 # imm = 0xFFFF80000010FCB0
ffff80000010fe62: eb 39                	jmp	0xffff80000010fe9d <rb_remove+0x18d>
ffff80000010fe64: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fe6e: 66 90                	nop
; 			sibling->color = RB_RED;
ffff80000010fe70: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff80000010fe77: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			rotate_node(tree, node->parent, dir);
ffff80000010fe7e: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fe82: 4c 89 ff             	movq	%r15, %rdi
ffff80000010fe85: 89 da                	movl	%ebx, %edx
ffff80000010fe87: 49 be b0 fc 10 00 00 80 ff ff	movabsq	$-140737487242064, %r14 # imm = 0xFFFF80000010FCB0
ffff80000010fe91: 41 ff d6             	callq	*%r14
; 			sibling = node->parent->child[dir];
ffff80000010fe94: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010fe98: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		sibling->color = node->parent->color;
ffff80000010fe9d: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fea1: 8b 4e 18             	movl	24(%rsi), %ecx
ffff80000010fea4: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff80000010fea7: c7 46 18 00 00 00 00 	movl	$0, 24(%rsi)
; 		sibling->child[dir]->color = RB_BLACK;
ffff80000010feae: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010feb3: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff80000010feba: 4c 89 ff             	movq	%r15, %rdi
ffff80000010febd: 44 89 e2             	movl	%r12d, %edx
ffff80000010fec0: 41 ff d6             	callq	*%r14
ffff80000010fec3: 4d 89 fd             	movq	%r15, %r13
ffff80000010fec6: 4c 89 f1             	movq	%r14, %rcx
ffff80000010fec9: e9 f3 fe ff ff       	jmp	0xffff80000010fdc1 <rb_remove+0xb1>
; 	if (node)
ffff80000010fece: 4d 85 ed             	testq	%r13, %r13
ffff80000010fed1: 74 10                	je	0xffff80000010fee3 <rb_remove+0x1d3>
; 		node->color = RB_BLACK;
ffff80000010fed3: 49 83 c5 18          	addq	$24, %r13
ffff80000010fed7: 31 c0                	xorl	%eax, %eax
ffff80000010fed9: 41 c7 45 00 00 00 00 00      	movl	$0, (%r13)
ffff80000010fee1: eb 02                	jmp	0xffff80000010fee5 <rb_remove+0x1d5>
ffff80000010fee3: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fee5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010fee9: 5b                   	popq	%rbx
ffff80000010feea: 41 5c                	popq	%r12
ffff80000010feec: 41 5d                	popq	%r13
ffff80000010feee: 41 5e                	popq	%r14
ffff80000010fef0: 41 5f                	popq	%r15
ffff80000010fef2: 5d                   	popq	%rbp
ffff80000010fef3: c3                   	retq
ffff80000010fef4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fefe: 66 90                	nop

ffff80000010ff00 <do_remove>:
; {
ffff80000010ff00: 55                   	pushq	%rbp
ffff80000010ff01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ff04: 41 57                	pushq	%r15
ffff80000010ff06: 41 56                	pushq	%r14
ffff80000010ff08: 41 54                	pushq	%r12
ffff80000010ff0a: 53                   	pushq	%rbx
; 	if (!tree || !node)
ffff80000010ff0b: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ff0e: 0f 84 b7 00 00 00    	je	0xffff80000010ffcb <do_remove+0xcb>
ffff80000010ff14: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010ff17: 48 85 f6             	testq	%rsi, %rsi
ffff80000010ff1a: 0f 84 ab 00 00 00    	je	0xffff80000010ffcb <do_remove+0xcb>
ffff80000010ff20: 49 89 fe             	movq	%rdi, %r14
; 	parent = node->parent;
ffff80000010ff23: 4c 8b 23             	movq	(%rbx), %r12
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010ff26: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010ff2a: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ff2d: 74 57                	je	0xffff80000010ff86 <do_remove+0x86>
ffff80000010ff2f: 48 83 7b 10 00       	cmpq	$0, 16(%rbx)
ffff80000010ff34: 74 50                	je	0xffff80000010ff86 <do_remove+0x86>
; 		child = get_outermost(child, RB_RIGHT);
ffff80000010ff36: 48 b8 d0 fa 10 00 00 80 ff ff	movabsq	$-140737487242544, %rax # imm = 0xFFFF80000010FAD0
ffff80000010ff40: be 01 00 00 00       	movl	$1, %esi
ffff80000010ff45: ff d0                	callq	*%rax
ffff80000010ff47: 49 89 c7             	movq	%rax, %r15
; 		do_remove(tree, child);
ffff80000010ff4a: 48 b8 00 ff 10 00 00 80 ff ff	movabsq	$-140737487241472, %rax # imm = 0xFFFF80000010FF00
ffff80000010ff54: 4c 89 f7             	movq	%r14, %rdi
ffff80000010ff57: 4c 89 fe             	movq	%r15, %rsi
ffff80000010ff5a: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff80000010ff5c: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010ff60: 49 89 47 08          	movq	%rax, 8(%r15)
; 		if (node->child[RB_LEFT])
ffff80000010ff64: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010ff68: 48 85 c0             	testq	%rax, %rax
ffff80000010ff6b: 74 03                	je	0xffff80000010ff70 <do_remove+0x70>
; 			node->child[RB_LEFT]->parent = child;
ffff80000010ff6d: 4c 89 38             	movq	%r15, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff80000010ff70: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010ff74: 49 89 47 10          	movq	%rax, 16(%r15)
; 		if (node->child[RB_RIGHT])
ffff80000010ff78: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010ff7c: 48 85 c0             	testq	%rax, %rax
ffff80000010ff7f: 74 12                	je	0xffff80000010ff93 <do_remove+0x93>
; 			node->child[RB_RIGHT]->parent = child;
ffff80000010ff81: 4c 89 38             	movq	%r15, (%rax)
ffff80000010ff84: eb 0d                	jmp	0xffff80000010ff93 <do_remove+0x93>
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010ff86: 31 c0                	xorl	%eax, %eax
ffff80000010ff88: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ff8b: 0f 94 c0             	sete	%al
; 		child = node->child[child_dir];
ffff80000010ff8e: 4c 8b 7c c3 08       	movq	8(%rbx,%rax,8), %r15
; 	if (parent) {
ffff80000010ff93: 4d 85 e4             	testq	%r12, %r12
ffff80000010ff96: 74 12                	je	0xffff80000010ffaa <do_remove+0xaa>
; 		dir = parent->child[RB_RIGHT] == node;
ffff80000010ff98: 31 c0                	xorl	%eax, %eax
ffff80000010ff9a: 49 39 5c 24 10       	cmpq	%rbx, 16(%r12)
ffff80000010ff9f: 0f 94 c0             	sete	%al
; 		parent->child[dir] = child;
ffff80000010ffa2: 4d 8d 34 c4          	leaq	(%r12,%rax,8), %r14
ffff80000010ffa6: 49 83 c6 08          	addq	$8, %r14
ffff80000010ffaa: 4d 89 3e             	movq	%r15, (%r14)
; 	if (child)
ffff80000010ffad: 4d 85 ff             	testq	%r15, %r15
ffff80000010ffb0: 74 03                	je	0xffff80000010ffb5 <do_remove+0xb5>
; 		child->parent = parent;
ffff80000010ffb2: 4d 89 27             	movq	%r12, (%r15)
; 	memset(node, 0, sizeof *node);
ffff80000010ffb5: 48 b8 a0 03 11 00 00 80 ff ff	movabsq	$-140737487240288, %rax # imm = 0xFFFF8000001103A0
ffff80000010ffbf: ba 20 00 00 00       	movl	$32, %edx
ffff80000010ffc4: 48 89 df             	movq	%rbx, %rdi
ffff80000010ffc7: 31 f6                	xorl	%esi, %esi
ffff80000010ffc9: ff d0                	callq	*%rax
; }
ffff80000010ffcb: 5b                   	popq	%rbx
ffff80000010ffcc: 41 5c                	popq	%r12
ffff80000010ffce: 41 5e                	popq	%r14
ffff80000010ffd0: 41 5f                	popq	%r15
ffff80000010ffd2: 5d                   	popq	%rbp
ffff80000010ffd3: c3                   	retq
ffff80000010ffd4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ffde: 66 90                	nop

ffff80000010ffe0 <rb_replace>:
; {
ffff80000010ffe0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!node || !new_node)
ffff80000010ffe5: 48 85 f6             	testq	%rsi, %rsi
ffff80000010ffe8: 74 5e                	je	0xffff800000110048 <rb_replace+0x68>
ffff80000010ffea: 48 85 d2             	testq	%rdx, %rdx
ffff80000010ffed: 74 59                	je	0xffff800000110048 <rb_replace+0x68>
ffff80000010ffef: 55                   	pushq	%rbp
ffff80000010fff0: 48 89 e5             	movq	%rsp, %rbp
; 	if (node->parent)
ffff80000010fff3: 48 8b 06             	movq	(%rsi), %rax
ffff80000010fff6: 48 85 c0             	testq	%rax, %rax
ffff80000010fff9: 74 11                	je	0xffff80000011000c <rb_replace+0x2c>
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff80000010fffb: 31 c9                	xorl	%ecx, %ecx
ffff80000010fffd: 48 39 70 10          	cmpq	%rsi, 16(%rax)
ffff800000110001: 0f 94 c1             	sete	%cl
ffff800000110004: 48 8d 3c c8          	leaq	(%rax,%rcx,8), %rdi
ffff800000110008: 48 83 c7 08          	addq	$8, %rdi
ffff80000011000c: 48 89 17             	movq	%rdx, (%rdi)
; 	if (node->child[RB_LEFT])
ffff80000011000f: 48 8b 46 08          	movq	8(%rsi), %rax
ffff800000110013: 48 85 c0             	testq	%rax, %rax
ffff800000110016: 74 03                	je	0xffff80000011001b <rb_replace+0x3b>
; 		node->child[RB_LEFT]->parent = new_node;
ffff800000110018: 48 89 10             	movq	%rdx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff80000011001b: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000011001f: 48 85 c0             	testq	%rax, %rax
ffff800000110022: 74 03                	je	0xffff800000110027 <rb_replace+0x47>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff800000110024: 48 89 10             	movq	%rdx, (%rax)
; 	*new_node = *node;
ffff800000110027: 48 8b 46 18          	movq	24(%rsi), %rax
ffff80000011002b: 48 89 42 18          	movq	%rax, 24(%rdx)
ffff80000011002f: 48 8b 46 10          	movq	16(%rsi), %rax
ffff800000110033: 48 89 42 10          	movq	%rax, 16(%rdx)
ffff800000110037: 48 8b 06             	movq	(%rsi), %rax
ffff80000011003a: 48 8b 4e 08          	movq	8(%rsi), %rcx
ffff80000011003e: 48 89 4a 08          	movq	%rcx, 8(%rdx)
ffff800000110042: 48 89 02             	movq	%rax, (%rdx)
ffff800000110045: 31 c0                	xorl	%eax, %eax
ffff800000110047: 5d                   	popq	%rbp
; }
ffff800000110048: c3                   	retq
ffff800000110049: cc                   	int3
ffff80000011004a: cc                   	int3
ffff80000011004b: cc                   	int3
ffff80000011004c: cc                   	int3
ffff80000011004d: cc                   	int3
ffff80000011004e: cc                   	int3
ffff80000011004f: cc                   	int3

ffff800000110050 <readline>:
; {
ffff800000110050: 55                   	pushq	%rbp
ffff800000110051: 48 89 e5             	movq	%rsp, %rbp
ffff800000110054: 41 57                	pushq	%r15
ffff800000110056: 41 56                	pushq	%r14
ffff800000110058: 41 55                	pushq	%r13
ffff80000011005a: 41 54                	pushq	%r12
ffff80000011005c: 53                   	pushq	%rbx
ffff80000011005d: 50                   	pushq	%rax
ffff80000011005e: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
; 	if (prompt != NULL)
ffff800000110068: 48 85 ff             	testq	%rdi, %rdi
ffff80000011006b: 74 11                	je	0xffff80000011007e <readline+0x2e>
ffff80000011006d: 48 89 fe             	movq	%rdi, %rsi
; 		cprintf("%s", prompt);
ffff800000110070: 48 bf 2c 4c 11 00 00 80 ff ff	movabsq	$-140737487221716, %rdi # imm = 0xFFFF800000114C2C
ffff80000011007a: 31 c0                	xorl	%eax, %eax
ffff80000011007c: ff d1                	callq	*%rcx
; 	echoing = iscons(0);
ffff80000011007e: 48 b8 00 c5 10 00 00 80 ff ff	movabsq	$-140737487256320, %rax # imm = 0xFFFF80000010C500
ffff800000110088: 45 31 ed             	xorl	%r13d, %r13d
ffff80000011008b: 31 ff                	xorl	%edi, %edi
ffff80000011008d: ff d0                	callq	*%rax
ffff80000011008f: 41 89 c7             	movl	%eax, %r15d
; 		c = getchar();
ffff800000110092: 49 bc e0 c4 10 00 00 80 ff ff	movabsq	$-140737487256352, %r12 # imm = 0xFFFF80000010C4E0
ffff80000011009c: 41 ff d4             	callq	*%r12
ffff80000011009f: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff8000001100a1: 85 c0                	testl	%eax, %eax
ffff8000001100a3: 0f 88 b1 00 00 00    	js	0xffff80000011015a <readline+0x10a>
ffff8000001100a9: 49 be 00 a3 11 00 00 80 ff ff	movabsq	$-140737487199488, %r14 # imm = 0xFFFF80000011A300
ffff8000001100b3: eb 1c                	jmp	0xffff8000001100d1 <readline+0x81>
ffff8000001100b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001100bf: 90                   	nop
; 			i--;
ffff8000001100c0: 41 83 c5 ff          	addl	$-1, %r13d
; 		c = getchar();
ffff8000001100c4: 41 ff d4             	callq	*%r12
ffff8000001100c7: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff8000001100c9: 85 c0                	testl	%eax, %eax
ffff8000001100cb: 0f 88 89 00 00 00    	js	0xffff80000011015a <readline+0x10a>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff8000001100d1: 83 fb 08             	cmpl	$8, %ebx
ffff8000001100d4: 0f 95 c0             	setne	%al
ffff8000001100d7: 83 fb 7f             	cmpl	$127, %ebx
ffff8000001100da: 0f 95 c1             	setne	%cl
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff8000001100dd: 84 c8                	testb	%cl, %al
ffff8000001100df: 75 1f                	jne	0xffff800000110100 <readline+0xb0>
ffff8000001100e1: 45 85 ed             	testl	%r13d, %r13d
ffff8000001100e4: 7e 1a                	jle	0xffff800000110100 <readline+0xb0>
ffff8000001100e6: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff8000001100e9: 74 d5                	je	0xffff8000001100c0 <readline+0x70>
; 				cputchar('\b');
ffff8000001100eb: bf 08 00 00 00       	movl	$8, %edi
ffff8000001100f0: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff8000001100fa: ff d0                	callq	*%rax
ffff8000001100fc: eb c2                	jmp	0xffff8000001100c0 <readline+0x70>
ffff8000001100fe: 66 90                	nop
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff800000110100: 83 fb 20             	cmpl	$32, %ebx
ffff800000110103: 7c 2b                	jl	0xffff800000110130 <readline+0xe0>
ffff800000110105: 41 81 fd fe 03 00 00 	cmpl	$1022, %r13d            # imm = 0x3FE
ffff80000011010c: 7f 22                	jg	0xffff800000110130 <readline+0xe0>
ffff80000011010e: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff800000110111: 74 0e                	je	0xffff800000110121 <readline+0xd1>
; 				cputchar(c);
ffff800000110113: 89 df                	movl	%ebx, %edi
ffff800000110115: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000011011f: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff800000110121: 49 63 c5             	movslq	%r13d, %rax
ffff800000110124: 41 83 c5 01          	addl	$1, %r13d
ffff800000110128: 42 88 1c 30          	movb	%bl, (%rax,%r14)
ffff80000011012c: eb 96                	jmp	0xffff8000001100c4 <readline+0x74>
ffff80000011012e: 66 90                	nop
; 		} else if (c == '\n' || c == '\r') {
ffff800000110130: 83 fb 0d             	cmpl	$13, %ebx
ffff800000110133: 74 05                	je	0xffff80000011013a <readline+0xea>
ffff800000110135: 83 fb 0a             	cmpl	$10, %ebx
ffff800000110138: 75 8a                	jne	0xffff8000001100c4 <readline+0x74>
; 			if (echoing)
ffff80000011013a: 45 85 ff             	testl	%r15d, %r15d
ffff80000011013d: 74 11                	je	0xffff800000110150 <readline+0x100>
; 				cputchar('\n');
ffff80000011013f: bf 0a 00 00 00       	movl	$10, %edi
ffff800000110144: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000011014e: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff800000110150: 49 63 c5             	movslq	%r13d, %rax
ffff800000110153: 42 c6 04 30 00       	movb	$0, (%rax,%r14)
ffff800000110158: eb 1d                	jmp	0xffff800000110177 <readline+0x127>
; 			cprintf("read error: %e\n", c);
ffff80000011015a: 48 bf 28 51 11 00 00 80 ff ff	movabsq	$-140737487220440, %rdi # imm = 0xFFFF800000115128
ffff800000110164: 45 31 f6             	xorl	%r14d, %r14d
ffff800000110167: 89 de                	movl	%ebx, %esi
ffff800000110169: 31 c0                	xorl	%eax, %eax
ffff80000011016b: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000110175: ff d1                	callq	*%rcx
; }
ffff800000110177: 4c 89 f0             	movq	%r14, %rax
ffff80000011017a: 48 83 c4 08          	addq	$8, %rsp
ffff80000011017e: 5b                   	popq	%rbx
ffff80000011017f: 41 5c                	popq	%r12
ffff800000110181: 41 5d                	popq	%r13
ffff800000110183: 41 5e                	popq	%r14
ffff800000110185: 41 5f                	popq	%r15
ffff800000110187: 5d                   	popq	%rbp
ffff800000110188: c3                   	retq
ffff800000110189: cc                   	int3
ffff80000011018a: cc                   	int3
ffff80000011018b: cc                   	int3
ffff80000011018c: cc                   	int3
ffff80000011018d: cc                   	int3
ffff80000011018e: cc                   	int3
ffff80000011018f: cc                   	int3

ffff800000110190 <strlen>:
; {
ffff800000110190: 55                   	pushq	%rbp
ffff800000110191: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
ffff800000110194: 80 3f 00             	cmpb	$0, (%rdi)
ffff800000110197: 74 14                	je	0xffff8000001101ad <strlen+0x1d>
ffff800000110199: 31 c0                	xorl	%eax, %eax
ffff80000011019b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
ffff8000001101a0: 80 7c 07 01 00       	cmpb	$0, 1(%rdi,%rax)
ffff8000001101a5: 48 8d 40 01          	leaq	1(%rax), %rax
ffff8000001101a9: 75 f5                	jne	0xffff8000001101a0 <strlen+0x10>
; 	return n;
ffff8000001101ab: 5d                   	popq	%rbp
ffff8000001101ac: c3                   	retq
ffff8000001101ad: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff8000001101af: 5d                   	popq	%rbp
ffff8000001101b0: c3                   	retq
ffff8000001101b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001101bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001101c0 <strnlen>:
; {
ffff8000001101c0: 55                   	pushq	%rbp
ffff8000001101c1: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff8000001101c4: 48 85 f6             	testq	%rsi, %rsi
ffff8000001101c7: 74 18                	je	0xffff8000001101e1 <strnlen+0x21>
ffff8000001101c9: 48 89 f0             	movq	%rsi, %rax
ffff8000001101cc: 31 c9                	xorl	%ecx, %ecx
ffff8000001101ce: 66 90                	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff8000001101d0: 80 3c 0f 00          	cmpb	$0, (%rdi,%rcx)
ffff8000001101d4: 74 0f                	je	0xffff8000001101e5 <strnlen+0x25>
ffff8000001101d6: 48 83 c1 01          	addq	$1, %rcx
ffff8000001101da: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001101dd: 75 f1                	jne	0xffff8000001101d0 <strnlen+0x10>
; 	return n;
ffff8000001101df: 5d                   	popq	%rbp
ffff8000001101e0: c3                   	retq
ffff8000001101e1: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff8000001101e3: 5d                   	popq	%rbp
ffff8000001101e4: c3                   	retq
ffff8000001101e5: 89 c8                	movl	%ecx, %eax
; 	return n;
ffff8000001101e7: 5d                   	popq	%rbp
ffff8000001101e8: c3                   	retq
ffff8000001101e9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001101f0 <strcpy>:
; {
ffff8000001101f0: 55                   	pushq	%rbp
ffff8000001101f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001101f4: 48 89 f8             	movq	%rdi, %rax
ffff8000001101f7: 31 c9                	xorl	%ecx, %ecx
ffff8000001101f9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
ffff800000110200: 0f b6 14 0e          	movzbl	(%rsi,%rcx), %edx
ffff800000110204: 88 14 08             	movb	%dl, (%rax,%rcx)
ffff800000110207: 48 83 c1 01          	addq	$1, %rcx
ffff80000011020b: 84 d2                	testb	%dl, %dl
ffff80000011020d: 75 f1                	jne	0xffff800000110200 <strcpy+0x10>
; 	return ret;
ffff80000011020f: 5d                   	popq	%rbp
ffff800000110210: c3                   	retq
ffff800000110211: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011021b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110220 <strcat>:
; {
ffff800000110220: 55                   	pushq	%rbp
ffff800000110221: 48 89 e5             	movq	%rsp, %rbp
ffff800000110224: 41 56                	pushq	%r14
ffff800000110226: 53                   	pushq	%rbx
ffff800000110227: 49 89 f6             	movq	%rsi, %r14
ffff80000011022a: 48 89 fb             	movq	%rdi, %rbx
; 	int len = strlen(dst);
ffff80000011022d: 48 b8 90 01 11 00 00 80 ff ff	movabsq	$-140737487240816, %rax # imm = 0xFFFF800000110190
ffff800000110237: ff d0                	callq	*%rax
; 	strcpy(dst + len, src);
ffff800000110239: 48 63 f8             	movslq	%eax, %rdi
ffff80000011023c: 48 01 df             	addq	%rbx, %rdi
ffff80000011023f: 48 b8 f0 01 11 00 00 80 ff ff	movabsq	$-140737487240720, %rax # imm = 0xFFFF8000001101F0
ffff800000110249: 4c 89 f6             	movq	%r14, %rsi
ffff80000011024c: ff d0                	callq	*%rax
; 	return dst;
ffff80000011024e: 48 89 d8             	movq	%rbx, %rax
ffff800000110251: 5b                   	popq	%rbx
ffff800000110252: 41 5e                	popq	%r14
ffff800000110254: 5d                   	popq	%rbp
ffff800000110255: c3                   	retq
ffff800000110256: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110260 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff800000110260: 55                   	pushq	%rbp
ffff800000110261: 48 89 e5             	movq	%rsp, %rbp
ffff800000110264: 48 89 f8             	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
ffff800000110267: 48 85 d2             	testq	%rdx, %rdx
ffff80000011026a: 74 1a                	je	0xffff800000110286 <strncpy+0x26>
ffff80000011026c: 31 ff                	xorl	%edi, %edi
ffff80000011026e: 66 90                	nop
; 		*dst++ = *src;
ffff800000110270: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff800000110273: 88 0c 38             	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
ffff800000110276: 80 3e 01             	cmpb	$1, (%rsi)
ffff800000110279: 48 83 de ff          	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
ffff80000011027d: 48 83 c7 01          	addq	$1, %rdi
ffff800000110281: 48 39 fa             	cmpq	%rdi, %rdx
ffff800000110284: 75 ea                	jne	0xffff800000110270 <strncpy+0x10>
; 	return ret;
ffff800000110286: 5d                   	popq	%rbp
ffff800000110287: c3                   	retq
ffff800000110288: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110290 <strlcpy>:
; {
ffff800000110290: 55                   	pushq	%rbp
ffff800000110291: 48 89 e5             	movq	%rsp, %rbp
ffff800000110294: 48 89 f8             	movq	%rdi, %rax
; 	if (size > 0) {
ffff800000110297: 48 85 d2             	testq	%rdx, %rdx
ffff80000011029a: 74 2e                	je	0xffff8000001102ca <strlcpy+0x3a>
ffff80000011029c: 48 89 f8             	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
ffff80000011029f: 48 83 c2 ff          	addq	$-1, %rdx
ffff8000001102a3: 74 22                	je	0xffff8000001102c7 <strlcpy+0x37>
ffff8000001102a5: 31 c0                	xorl	%eax, %eax
ffff8000001102a7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
ffff8000001102b0: 0f b6 0c 06          	movzbl	(%rsi,%rax), %ecx
ffff8000001102b4: 84 c9                	testb	%cl, %cl
ffff8000001102b6: 74 0c                	je	0xffff8000001102c4 <strlcpy+0x34>
; 			*dst++ = *src++;
ffff8000001102b8: 88 0c 07             	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
ffff8000001102bb: 48 83 c0 01          	addq	$1, %rax
ffff8000001102bf: 48 39 c2             	cmpq	%rax, %rdx
ffff8000001102c2: 75 ec                	jne	0xffff8000001102b0 <strlcpy+0x20>
ffff8000001102c4: 48 01 f8             	addq	%rdi, %rax
; 		*dst = '\0';
ffff8000001102c7: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff8000001102ca: 48 29 f8             	subq	%rdi, %rax
ffff8000001102cd: 5d                   	popq	%rbp
ffff8000001102ce: c3                   	retq
ffff8000001102cf: 90                   	nop

ffff8000001102d0 <strcmp>:
; {
ffff8000001102d0: 55                   	pushq	%rbp
ffff8000001102d1: 48 89 e5             	movq	%rsp, %rbp
; 	while (*p && *p == *q)
ffff8000001102d4: 8a 07                	movb	(%rdi), %al
ffff8000001102d6: 84 c0                	testb	%al, %al
ffff8000001102d8: 74 19                	je	0xffff8000001102f3 <strcmp+0x23>
ffff8000001102da: 48 83 c7 01          	addq	$1, %rdi
ffff8000001102de: 66 90                	nop
ffff8000001102e0: 3a 06                	cmpb	(%rsi), %al
ffff8000001102e2: 75 0f                	jne	0xffff8000001102f3 <strcmp+0x23>
; 		p++, q++;
ffff8000001102e4: 48 83 c6 01          	addq	$1, %rsi
; 	while (*p && *p == *q)
ffff8000001102e8: 0f b6 07             	movzbl	(%rdi), %eax
ffff8000001102eb: 48 83 c7 01          	addq	$1, %rdi
ffff8000001102ef: 84 c0                	testb	%al, %al
ffff8000001102f1: 75 ed                	jne	0xffff8000001102e0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff8000001102f3: 0f b6 c0             	movzbl	%al, %eax
ffff8000001102f6: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff8000001102f9: 29 c8                	subl	%ecx, %eax
ffff8000001102fb: 5d                   	popq	%rbp
ffff8000001102fc: c3                   	retq
ffff8000001102fd: 0f 1f 00             	nopl	(%rax)

ffff800000110300 <strncmp>:
; {
ffff800000110300: 55                   	pushq	%rbp
ffff800000110301: 48 89 e5             	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
ffff800000110304: 48 85 d2             	testq	%rdx, %rdx
ffff800000110307: 74 1d                	je	0xffff800000110326 <strncmp+0x26>
ffff800000110309: 31 c9                	xorl	%ecx, %ecx
ffff80000011030b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
ffff800000110310: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff800000110314: 85 c0                	testl	%eax, %eax
ffff800000110316: 74 12                	je	0xffff80000011032a <strncmp+0x2a>
ffff800000110318: 3a 04 0e             	cmpb	(%rsi,%rcx), %al
ffff80000011031b: 75 0d                	jne	0xffff80000011032a <strncmp+0x2a>
ffff80000011031d: 48 83 c1 01          	addq	$1, %rcx
ffff800000110321: 48 39 ca             	cmpq	%rcx, %rdx
ffff800000110324: 75 ea                	jne	0xffff800000110310 <strncmp+0x10>
ffff800000110326: 31 c0                	xorl	%eax, %eax
; }
ffff800000110328: 5d                   	popq	%rbp
ffff800000110329: c3                   	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000011032a: 0f b6 0c 0e          	movzbl	(%rsi,%rcx), %ecx
ffff80000011032e: 29 c8                	subl	%ecx, %eax
; }
ffff800000110330: 5d                   	popq	%rbp
ffff800000110331: c3                   	retq
ffff800000110332: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011033c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110340 <strchr>:
; {
ffff800000110340: 55                   	pushq	%rbp
ffff800000110341: 48 89 e5             	movq	%rsp, %rbp
; 	for (; *s; s++)
ffff800000110344: 8a 0f                	movb	(%rdi), %cl
ffff800000110346: 84 c9                	testb	%cl, %cl
ffff800000110348: 74 17                	je	0xffff800000110361 <strchr+0x21>
ffff80000011034a: 48 89 f8             	movq	%rdi, %rax
ffff80000011034d: 0f 1f 00             	nopl	(%rax)
; 		if (*s == c)
ffff800000110350: 40 38 f1             	cmpb	%sil, %cl
ffff800000110353: 74 0e                	je	0xffff800000110363 <strchr+0x23>
; 	for (; *s; s++)
ffff800000110355: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff800000110359: 48 83 c0 01          	addq	$1, %rax
ffff80000011035d: 84 c9                	testb	%cl, %cl
ffff80000011035f: 75 ef                	jne	0xffff800000110350 <strchr+0x10>
ffff800000110361: 31 c0                	xorl	%eax, %eax
; }
ffff800000110363: 5d                   	popq	%rbp
ffff800000110364: c3                   	retq
ffff800000110365: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011036f: 90                   	nop

ffff800000110370 <strfind>:
; {
ffff800000110370: 55                   	pushq	%rbp
ffff800000110371: 48 89 e5             	movq	%rsp, %rbp
ffff800000110374: 48 89 f8             	movq	%rdi, %rax
; 	for (; *s; s++)
ffff800000110377: 48 83 c0 ff          	addq	$-1, %rax
ffff80000011037b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff800000110380: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff800000110384: 48 83 c0 01          	addq	$1, %rax
ffff800000110388: 84 c9                	testb	%cl, %cl
ffff80000011038a: 74 05                	je	0xffff800000110391 <strfind+0x21>
ffff80000011038c: 40 38 f1             	cmpb	%sil, %cl
ffff80000011038f: 75 ef                	jne	0xffff800000110380 <strfind+0x10>
; 	return (char *) s;
ffff800000110391: 5d                   	popq	%rbp
ffff800000110392: c3                   	retq
ffff800000110393: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011039d: 0f 1f 00             	nopl	(%rax)

ffff8000001103a0 <memset>:
; {
ffff8000001103a0: 55                   	pushq	%rbp
ffff8000001103a1: 48 89 e5             	movq	%rsp, %rbp
; 	if (n == 0)
ffff8000001103a4: 48 85 d2             	testq	%rdx, %rdx
ffff8000001103a7: 74 36                	je	0xffff8000001103df <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff8000001103a9: 89 f8                	movl	%edi, %eax
ffff8000001103ab: 09 d0                	orl	%edx, %eax
ffff8000001103ad: a8 03                	testb	$3, %al
ffff8000001103af: 74 0a                	je	0xffff8000001103bb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
ffff8000001103b1: 89 f0                	movl	%esi, %eax
ffff8000001103b3: 48 89 d1             	movq	%rdx, %rcx
ffff8000001103b6: fc                   	cld
ffff8000001103b7: f3 aa                	rep		stosb	%al, %es:(%rdi)
ffff8000001103b9: eb 24                	jmp	0xffff8000001103df <memset+0x3f>
; 		c &= 0xFF;
ffff8000001103bb: 44 0f b6 c6          	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff8000001103bf: c1 e6 18             	shll	$24, %esi
ffff8000001103c2: 44 89 c1             	movl	%r8d, %ecx
ffff8000001103c5: c1 e1 10             	shll	$16, %ecx
ffff8000001103c8: 09 f1                	orl	%esi, %ecx
ffff8000001103ca: 44 89 c0             	movl	%r8d, %eax
ffff8000001103cd: c1 e0 08             	shll	$8, %eax
ffff8000001103d0: 09 c8                	orl	%ecx, %eax
ffff8000001103d2: 44 09 c0             	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff8000001103d5: 48 c1 ea 02          	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
ffff8000001103d9: 48 89 d1             	movq	%rdx, %rcx
ffff8000001103dc: fc                   	cld
ffff8000001103dd: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; }
ffff8000001103df: 48 89 f8             	movq	%rdi, %rax
ffff8000001103e2: 5d                   	popq	%rbp
ffff8000001103e3: c3                   	retq
ffff8000001103e4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001103ee: 66 90                	nop

ffff8000001103f0 <memmove>:
; {
ffff8000001103f0: 55                   	pushq	%rbp
ffff8000001103f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001103f4: 48 89 d1             	movq	%rdx, %rcx
ffff8000001103f7: 48 89 f2             	movq	%rsi, %rdx
ffff8000001103fa: 48 89 f8             	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
ffff8000001103fd: 48 39 fe             	cmpq	%rdi, %rsi
ffff800000110400: 73 38                	jae	0xffff80000011043a <memmove+0x4a>
ffff800000110402: 48 8d 34 0a          	leaq	(%rdx,%rcx), %rsi
ffff800000110406: 48 39 c6             	cmpq	%rax, %rsi
ffff800000110409: 76 2f                	jbe	0xffff80000011043a <memmove+0x4a>
; 		d += n;
ffff80000011040b: 48 8d 3c 08          	leaq	(%rax,%rcx), %rdi
ffff80000011040f: f6 c1 03             	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110412: 75 4e                	jne	0xffff800000110462 <memmove+0x72>
ffff800000110414: 89 f2                	movl	%esi, %edx
ffff800000110416: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110419: 48 85 d2             	testq	%rdx, %rdx
ffff80000011041c: 75 44                	jne	0xffff800000110462 <memmove+0x72>
ffff80000011041e: 89 fa                	movl	%edi, %edx
ffff800000110420: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110423: 48 85 d2             	testq	%rdx, %rdx
ffff800000110426: 75 3a                	jne	0xffff800000110462 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff800000110428: 48 83 c7 fc          	addq	$-4, %rdi
ffff80000011042c: 48 83 c6 fc          	addq	$-4, %rsi
ffff800000110430: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff800000110434: fd                   	std
ffff800000110435: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff800000110437: fc                   	cld
; 	return dst;
ffff800000110438: 5d                   	popq	%rbp
ffff800000110439: c3                   	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000011043a: 89 d6                	movl	%edx, %esi
ffff80000011043c: 09 c6                	orl	%eax, %esi
ffff80000011043e: 89 cf                	movl	%ecx, %edi
ffff800000110440: 09 f7                	orl	%esi, %edi
ffff800000110442: 40 f6 c7 03          	testb	$3, %dil
ffff800000110446: 74 0b                	je	0xffff800000110453 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
ffff800000110448: 48 89 c7             	movq	%rax, %rdi
ffff80000011044b: 48 89 d6             	movq	%rdx, %rsi
ffff80000011044e: fc                   	cld
ffff80000011044f: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
ffff800000110451: 5d                   	popq	%rbp
ffff800000110452: c3                   	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff800000110453: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff800000110457: 48 89 c7             	movq	%rax, %rdi
ffff80000011045a: 48 89 d6             	movq	%rdx, %rsi
ffff80000011045d: fc                   	cld
ffff80000011045e: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
ffff800000110460: 5d                   	popq	%rbp
ffff800000110461: c3                   	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff800000110462: 48 83 c7 ff          	addq	$-1, %rdi
ffff800000110466: 48 83 c6 ff          	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
ffff80000011046a: fd                   	std
ffff80000011046b: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff80000011046d: fc                   	cld
; 	return dst;
ffff80000011046e: 5d                   	popq	%rbp
ffff80000011046f: c3                   	retq

ffff800000110470 <memcpy>:
; {
ffff800000110470: 55                   	pushq	%rbp
ffff800000110471: 48 89 e5             	movq	%rsp, %rbp
ffff800000110474: 53                   	pushq	%rbx
ffff800000110475: 50                   	pushq	%rax
ffff800000110476: 48 89 fb             	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
ffff800000110479: 48 b8 f0 03 11 00 00 80 ff ff	movabsq	$-140737487240208, %rax # imm = 0xFFFF8000001103F0
ffff800000110483: ff d0                	callq	*%rax
ffff800000110485: 48 89 d8             	movq	%rbx, %rax
ffff800000110488: 48 83 c4 08          	addq	$8, %rsp
ffff80000011048c: 5b                   	popq	%rbx
ffff80000011048d: 5d                   	popq	%rbp
ffff80000011048e: c3                   	retq
ffff80000011048f: 90                   	nop

ffff800000110490 <memcmp>:
; {
ffff800000110490: 55                   	pushq	%rbp
ffff800000110491: 48 89 e5             	movq	%rsp, %rbp
; 	while (n-- > 0) {
ffff800000110494: 48 85 d2             	testq	%rdx, %rdx
ffff800000110497: 74 1e                	je	0xffff8000001104b7 <memcmp+0x27>
ffff800000110499: 31 c9                	xorl	%ecx, %ecx
ffff80000011049b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
ffff8000001104a0: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff8000001104a4: 44 0f b6 04 0e       	movzbl	(%rsi,%rcx), %r8d
ffff8000001104a9: 44 38 c0             	cmpb	%r8b, %al
ffff8000001104ac: 75 0d                	jne	0xffff8000001104bb <memcmp+0x2b>
; 	while (n-- > 0) {
ffff8000001104ae: 48 83 c1 01          	addq	$1, %rcx
ffff8000001104b2: 48 39 ca             	cmpq	%rcx, %rdx
ffff8000001104b5: 75 e9                	jne	0xffff8000001104a0 <memcmp+0x10>
ffff8000001104b7: 31 c0                	xorl	%eax, %eax
; }
ffff8000001104b9: 5d                   	popq	%rbp
ffff8000001104ba: c3                   	retq
; 			return (int) *s1 - (int) *s2;
ffff8000001104bb: 44 29 c0             	subl	%r8d, %eax
; }
ffff8000001104be: 5d                   	popq	%rbp
ffff8000001104bf: c3                   	retq

ffff8000001104c0 <memfind>:
; {
ffff8000001104c0: 55                   	pushq	%rbp
ffff8000001104c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001104c4: 48 89 f8             	movq	%rdi, %rax
; 	for (; s < ends; s++)
ffff8000001104c7: 48 85 d2             	testq	%rdx, %rdx
ffff8000001104ca: 7e 12                	jle	0xffff8000001104de <memfind+0x1e>
ffff8000001104cc: 48 01 c2             	addq	%rax, %rdx
ffff8000001104cf: 90                   	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff8000001104d0: 40 38 30             	cmpb	%sil, (%rax)
ffff8000001104d3: 74 09                	je	0xffff8000001104de <memfind+0x1e>
; 	for (; s < ends; s++)
ffff8000001104d5: 48 83 c0 01          	addq	$1, %rax
ffff8000001104d9: 48 39 d0             	cmpq	%rdx, %rax
ffff8000001104dc: 72 f2                	jb	0xffff8000001104d0 <memfind+0x10>
; 	return (void *) s;
ffff8000001104de: 5d                   	popq	%rbp
ffff8000001104df: c3                   	retq

ffff8000001104e0 <strtol>:
; {
ffff8000001104e0: 55                   	pushq	%rbp
ffff8000001104e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001104e4: 48 b8 08 46 11 00 00 80 ff ff	movabsq	$-140737487223288, %rax # imm = 0xFFFF800000114608
ffff8000001104ee: 66 90                	nop
; 	while (*s == ' ' || *s == '\t')
ffff8000001104f0: 0f b6 0f             	movzbl	(%rdi), %ecx
ffff8000001104f3: 80 c1 f7             	addb	$-9, %cl
ffff8000001104f6: 80 f9 24             	cmpb	$36, %cl
ffff8000001104f9: 77 10                	ja	0xffff80000011050b <strtol+0x2b>
ffff8000001104fb: 0f b6 c9             	movzbl	%cl, %ecx
ffff8000001104fe: ff 24 c8             	jmpq	*(%rax,%rcx,8)
; 		s++;
ffff800000110501: 48 83 c7 01          	addq	$1, %rdi
ffff800000110505: eb e9                	jmp	0xffff8000001104f0 <strtol+0x10>
; 		s++;
ffff800000110507: 48 83 c7 01          	addq	$1, %rdi
ffff80000011050b: 41 b0 01             	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011050e: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff800000110514: 75 27                	jne	0xffff80000011053d <strtol+0x5d>
ffff800000110516: eb 0f                	jmp	0xffff800000110527 <strtol+0x47>
; 		s++, neg = 1;
ffff800000110518: 48 83 c7 01          	addq	$1, %rdi
ffff80000011051c: 45 31 c0             	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011051f: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff800000110525: 75 16                	jne	0xffff80000011053d <strtol+0x5d>
ffff800000110527: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000011052a: 75 11                	jne	0xffff80000011053d <strtol+0x5d>
ffff80000011052c: 80 7f 01 78          	cmpb	$120, 1(%rdi)
ffff800000110530: 75 0b                	jne	0xffff80000011053d <strtol+0x5d>
; 		s += 2, base = 16;
ffff800000110532: 48 83 c7 02          	addq	$2, %rdi
ffff800000110536: ba 10 00 00 00       	movl	$16, %edx
ffff80000011053b: eb 1a                	jmp	0xffff800000110557 <strtol+0x77>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011053d: 85 d2                	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
ffff80000011053f: 75 16                	jne	0xffff800000110557 <strtol+0x77>
ffff800000110541: 31 c0                	xorl	%eax, %eax
ffff800000110543: 31 c9                	xorl	%ecx, %ecx
ffff800000110545: 80 3f 30             	cmpb	$48, (%rdi)
ffff800000110548: 0f 95 c0             	setne	%al
ffff80000011054b: 0f 94 c1             	sete	%cl
ffff80000011054e: 48 01 cf             	addq	%rcx, %rdi
ffff800000110551: 8d 14 00             	leal	(%rax,%rax), %edx
ffff800000110554: 83 c2 08             	addl	$8, %edx
ffff800000110557: 4c 63 ca             	movslq	%edx, %r9
ffff80000011055a: 45 31 d2             	xorl	%r10d, %r10d
ffff80000011055d: eb 25                	jmp	0xffff800000110584 <strtol+0xa4>
ffff80000011055f: 90                   	nop
ffff800000110560: 31 c0                	xorl	%eax, %eax
ffff800000110562: 84 c0                	testb	%al, %al
ffff800000110564: 75 1e                	jne	0xffff800000110584 <strtol+0xa4>
ffff800000110566: eb 51                	jmp	0xffff8000001105b9 <strtol+0xd9>
ffff800000110568: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
ffff800000110570: 48 83 c7 01          	addq	$1, %rdi
ffff800000110574: 4d 0f af d1          	imulq	%r9, %r10
ffff800000110578: 48 63 c1             	movslq	%ecx, %rax
ffff80000011057b: 49 01 c2             	addq	%rax, %r10
ffff80000011057e: b0 01                	movb	$1, %al
ffff800000110580: 84 c0                	testb	%al, %al
ffff800000110582: 74 35                	je	0xffff8000001105b9 <strtol+0xd9>
; 		if (*s >= '0' && *s <= '9')
ffff800000110584: 44 0f be 1f          	movsbl	(%rdi), %r11d
ffff800000110588: 41 8d 43 d0          	leal	-48(%r11), %eax
ffff80000011058c: b9 d0 ff ff ff       	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
ffff800000110591: 3c 0a                	cmpb	$10, %al
ffff800000110593: 72 1b                	jb	0xffff8000001105b0 <strtol+0xd0>
; 		else if (*s >= 'a' && *s <= 'z')
ffff800000110595: 41 8d 43 9f          	leal	-97(%r11), %eax
ffff800000110599: b9 a9 ff ff ff       	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
ffff80000011059e: 3c 1a                	cmpb	$26, %al
ffff8000001105a0: 72 0e                	jb	0xffff8000001105b0 <strtol+0xd0>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff8000001105a2: 41 8d 43 bf          	leal	-65(%r11), %eax
ffff8000001105a6: b9 c9 ff ff ff       	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
ffff8000001105ab: 3c 19                	cmpb	$25, %al
ffff8000001105ad: 77 b1                	ja	0xffff800000110560 <strtol+0x80>
ffff8000001105af: 90                   	nop
ffff8000001105b0: 44 01 d9             	addl	%r11d, %ecx
; 		if (dig >= base)
ffff8000001105b3: 39 d1                	cmpl	%edx, %ecx
ffff8000001105b5: 7c b9                	jl	0xffff800000110570 <strtol+0x90>
ffff8000001105b7: eb a7                	jmp	0xffff800000110560 <strtol+0x80>
; 	if (endptr)
ffff8000001105b9: 48 85 f6             	testq	%rsi, %rsi
ffff8000001105bc: 74 03                	je	0xffff8000001105c1 <strtol+0xe1>
; 		*endptr = (char *) s;
ffff8000001105be: 48 89 3e             	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
ffff8000001105c1: 4c 89 d0             	movq	%r10, %rax
ffff8000001105c4: 48 f7 d8             	negq	%rax
ffff8000001105c7: 45 84 c0             	testb	%r8b, %r8b
ffff8000001105ca: 49 0f 45 c2          	cmovneq	%r10, %rax
ffff8000001105ce: 5d                   	popq	%rbp
ffff8000001105cf: c3                   	retq

ffff8000001105d0 <dump_page_tables>:
; {
ffff8000001105d0: 55                   	pushq	%rbp
ffff8000001105d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001105d4: 41 56                	pushq	%r14
ffff8000001105d6: 53                   	pushq	%rbx
ffff8000001105d7: 48 83 ec 70          	subq	$112, %rsp
; 	struct dump_info info = {
ffff8000001105db: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff8000001105e3: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff8000001105eb: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001105f3: 48 b8 07 00 00 00 00 00 00 80	movabsq	$-9223372036854775801, %rax # imm = 0x8000000000000007
; 		.mask = mask | PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC |
ffff8000001105fd: 48 09 f0             	orq	%rsi, %rax
; 	struct dump_info info = {
ffff800000110600: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	struct page_walker walker = {
ffff800000110604: 48 b8 a0 06 11 00 00 80 ff ff	movabsq	$-140737487239520, %rax # imm = 0xFFFF8000001106A0
ffff80000011060e: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff800000110612: 48 b8 00 07 11 00 00 80 ff ff	movabsq	$-140737487239424, %rax # imm = 0xFFFF800000110700
ffff80000011061c: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff800000110620: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff800000110628: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000110630: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff800000110638: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000110640: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000110648: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110650: 49 be 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %r14 # imm = 0xFFFF800000110760
ffff80000011065a: 4c 89 75 c0          	movq	%r14, -64(%rbp)
ffff80000011065e: 48 8d 45 d0          	leaq	-48(%rbp), %rax
ffff800000110662: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (walk_all_pages(pml4, &walker) < 0)
ffff800000110666: 48 b8 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rax # imm = 0xFFFF800000111840
ffff800000110670: 48 8d 75 80          	leaq	-128(%rbp), %rsi
ffff800000110674: ff d0                	callq	*%rax
ffff800000110676: 85 c0                	testl	%eax, %eax
ffff800000110678: 78 0f                	js	0xffff800000110689 <dump_page_tables+0xb9>
ffff80000011067a: 31 db                	xorl	%ebx, %ebx
ffff80000011067c: 48 8d 55 80          	leaq	-128(%rbp), %rdx
; 	dump_hole(0, 0, &walker);
ffff800000110680: 31 ff                	xorl	%edi, %edi
ffff800000110682: 31 f6                	xorl	%esi, %esi
ffff800000110684: 41 ff d6             	callq	*%r14
ffff800000110687: eb 05                	jmp	0xffff80000011068e <dump_page_tables+0xbe>
ffff800000110689: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
; }
ffff80000011068e: 89 d8                	movl	%ebx, %eax
ffff800000110690: 48 83 c4 70          	addq	$112, %rsp
ffff800000110694: 5b                   	popq	%rbx
ffff800000110695: 41 5e                	popq	%r14
ffff800000110697: 5d                   	popq	%rbp
ffff800000110698: c3                   	retq
ffff800000110699: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001106a0 <dump_pte>:
; {
ffff8000001106a0: 55                   	pushq	%rbp
ffff8000001106a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001106a4: 41 57                	pushq	%r15
ffff8000001106a6: 41 56                	pushq	%r14
ffff8000001106a8: 41 54                	pushq	%r12
ffff8000001106aa: 53                   	pushq	%rbx
ffff8000001106ab: 49 89 d7             	movq	%rdx, %r15
; 	struct dump_info *info = walker->udata;
ffff8000001106ae: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	flags = *entry & info->mask;
ffff8000001106b2: 4c 8b 63 18          	movq	24(%rbx), %r12
ffff8000001106b6: 4c 23 27             	andq	(%rdi), %r12
; 	if (flags == info->flags) {
ffff8000001106b9: 4c 3b 63 10          	cmpq	16(%rbx), %r12
ffff8000001106bd: 75 06                	jne	0xffff8000001106c5 <dump_pte+0x25>
; 		info->end = end;
ffff8000001106bf: 4c 89 7b 08          	movq	%r15, 8(%rbx)
ffff8000001106c3: eb 23                	jmp	0xffff8000001106e8 <dump_pte+0x48>
ffff8000001106c5: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff8000001106c8: 48 b8 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rax # imm = 0xFFFF800000110760
ffff8000001106d2: 48 89 f7             	movq	%rsi, %rdi
ffff8000001106d5: 4c 89 fe             	movq	%r15, %rsi
ffff8000001106d8: 48 89 ca             	movq	%rcx, %rdx
ffff8000001106db: ff d0                	callq	*%rax
; 	info->base = base;
ffff8000001106dd: 4c 89 33             	movq	%r14, (%rbx)
; 	info->end = end;
ffff8000001106e0: 4c 89 7b 08          	movq	%r15, 8(%rbx)
; 	info->flags = flags;
ffff8000001106e4: 4c 89 63 10          	movq	%r12, 16(%rbx)
; }
ffff8000001106e8: 31 c0                	xorl	%eax, %eax
ffff8000001106ea: 5b                   	popq	%rbx
ffff8000001106eb: 41 5c                	popq	%r12
ffff8000001106ed: 41 5e                	popq	%r14
ffff8000001106ef: 41 5f                	popq	%r15
ffff8000001106f1: 5d                   	popq	%rbp
ffff8000001106f2: c3                   	retq
ffff8000001106f3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001106fd: 0f 1f 00             	nopl	(%rax)

ffff800000110700 <dump_pde>:
; {
ffff800000110700: 55                   	pushq	%rbp
ffff800000110701: 48 89 e5             	movq	%rsp, %rbp
ffff800000110704: 41 57                	pushq	%r15
ffff800000110706: 41 56                	pushq	%r14
ffff800000110708: 41 54                	pushq	%r12
ffff80000011070a: 53                   	pushq	%rbx
; 	if (!(*entry & PAGE_HUGE))
ffff80000011070b: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000011070e: f6 c3 80             	testb	$-128, %bl
ffff800000110711: 74 40                	je	0xffff800000110753 <dump_pde+0x53>
ffff800000110713: 49 89 d7             	movq	%rdx, %r15
ffff800000110716: 4c 8b 61 48          	movq	72(%rcx), %r12
; 	flags = *entry & info->mask;
ffff80000011071a: 49 23 5c 24 18       	andq	24(%r12), %rbx
; 	if (flags == info->flags) {
ffff80000011071f: 49 3b 5c 24 10       	cmpq	16(%r12), %rbx
ffff800000110724: 75 07                	jne	0xffff80000011072d <dump_pde+0x2d>
; 		info->end = end;
ffff800000110726: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
ffff80000011072b: eb 26                	jmp	0xffff800000110753 <dump_pde+0x53>
ffff80000011072d: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff800000110730: 48 b8 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rax # imm = 0xFFFF800000110760
ffff80000011073a: 48 89 f7             	movq	%rsi, %rdi
ffff80000011073d: 4c 89 fe             	movq	%r15, %rsi
ffff800000110740: 48 89 ca             	movq	%rcx, %rdx
ffff800000110743: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000110745: 4d 89 34 24          	movq	%r14, (%r12)
; 	info->end = end;
ffff800000110749: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
; 	info->flags = flags;
ffff80000011074e: 49 89 5c 24 10       	movq	%rbx, 16(%r12)
; }
ffff800000110753: 31 c0                	xorl	%eax, %eax
ffff800000110755: 5b                   	popq	%rbx
ffff800000110756: 41 5c                	popq	%r12
ffff800000110758: 41 5e                	popq	%r14
ffff80000011075a: 41 5f                	popq	%r15
ffff80000011075c: 5d                   	popq	%rbp
ffff80000011075d: c3                   	retq
ffff80000011075e: 66 90                	nop

ffff800000110760 <dump_hole>:
; {
ffff800000110760: 55                   	pushq	%rbp
ffff800000110761: 48 89 e5             	movq	%rsp, %rbp
ffff800000110764: 41 56                	pushq	%r14
ffff800000110766: 53                   	pushq	%rbx
ffff800000110767: 48 83 ec 10          	subq	$16, %rsp
; 	struct dump_info *info = walker->udata;
ffff80000011076b: 48 8b 5a 48          	movq	72(%rdx), %rbx
; 	if (info->flags & PAGE_PRESENT) {
ffff80000011076f: 48 8b 43 10          	movq	16(%rbx), %rax
ffff800000110773: a8 01                	testb	$1, %al
ffff800000110775: 0f 84 90 00 00 00    	je	0xffff80000011080b <dump_hole+0xab>
; 			info->base,
ffff80000011077b: 48 8b 33             	movq	(%rbx), %rsi
; 			info->end,
ffff80000011077e: 48 8b 53 08          	movq	8(%rbx), %rdx
; 			(info->flags & PAGE_WRITE) ? 'w' : '-',
ffff800000110782: a8 02                	testb	$2, %al
ffff800000110784: b9 2d 00 00 00       	movl	$45, %ecx
ffff800000110789: 41 b8 77 00 00 00    	movl	$119, %r8d
ffff80000011078f: 44 0f 44 c1          	cmovel	%ecx, %r8d
; 			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
ffff800000110793: 48 85 c0             	testq	%rax, %rax
ffff800000110796: 41 b9 78 00 00 00    	movl	$120, %r9d
ffff80000011079c: 44 0f 48 c9          	cmovsl	%ecx, %r9d
; 			(info->flags & PAGE_USER) ? 'u' : '-'
ffff8000001107a0: a8 04                	testb	$4, %al
ffff8000001107a2: b8 75 00 00 00       	movl	$117, %eax
ffff8000001107a7: 0f 44 c1             	cmovel	%ecx, %eax
; 		cprintf("  %016p - %016p [%c%c%c%c",
ffff8000001107aa: 89 04 24             	movl	%eax, (%rsp)
ffff8000001107ad: 48 bf 5e 59 11 00 00 80 ff ff	movabsq	$-140737487218338, %rdi # imm = 0xFFFF80000011595E
ffff8000001107b7: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff8000001107c1: b9 72 00 00 00       	movl	$114, %ecx
ffff8000001107c6: 31 c0                	xorl	%eax, %eax
ffff8000001107c8: 41 ff d6             	callq	*%r14
; 		if (info->mask & PAGE_HUGE) {
ffff8000001107cb: f6 43 18 80          	testb	$-128, 24(%rbx)
ffff8000001107cf: 74 2b                	je	0xffff8000001107fc <dump_hole+0x9c>
; 				(info->flags & PAGE_HUGE) ? "2M" : "4K"
ffff8000001107d1: f6 43 10 80          	testb	$-128, 16(%rbx)
ffff8000001107d5: 48 b8 05 52 11 00 00 80 ff ff	movabsq	$-140737487220219, %rax # imm = 0xFFFF800000115205
ffff8000001107df: 48 be 0f 49 11 00 00 80 ff ff	movabsq	$-140737487222513, %rsi # imm = 0xFFFF80000011490F
ffff8000001107e9: 48 0f 44 f0          	cmoveq	%rax, %rsi
; 			cprintf(" %s",
ffff8000001107ed: 48 bf 7f 4b 11 00 00 80 ff ff	movabsq	$-140737487221889, %rdi # imm = 0xFFFF800000114B7F
ffff8000001107f7: 31 c0                	xorl	%eax, %eax
ffff8000001107f9: 41 ff d6             	callq	*%r14
; 		cprintf("]\n");
ffff8000001107fc: 48 bf 92 51 11 00 00 80 ff ff	movabsq	$-140737487220334, %rdi # imm = 0xFFFF800000115192
ffff800000110806: 31 c0                	xorl	%eax, %eax
ffff800000110808: 41 ff d6             	callq	*%r14
; 	info->flags = 0;
ffff80000011080b: 48 c7 43 10 00 00 00 00      	movq	$0, 16(%rbx)
; 	return 0;
ffff800000110813: 31 c0                	xorl	%eax, %eax
ffff800000110815: 48 83 c4 10          	addq	$16, %rsp
ffff800000110819: 5b                   	popq	%rbx
ffff80000011081a: 41 5e                	popq	%r14
ffff80000011081c: 5d                   	popq	%rbp
ffff80000011081d: c3                   	retq
ffff80000011081e: cc                   	int3
ffff80000011081f: cc                   	int3

ffff800000110820 <page_insert>:
; {
ffff800000110820: 55                   	pushq	%rbp
ffff800000110821: 48 89 e5             	movq	%rsp, %rbp
ffff800000110824: 41 57                	pushq	%r15
ffff800000110826: 41 56                	pushq	%r14
ffff800000110828: 41 54                	pushq	%r12
ffff80000011082a: 53                   	pushq	%rbx
ffff80000011082b: 48 83 ec 70          	subq	$112, %rsp
ffff80000011082f: 48 89 cb             	movq	%rcx, %rbx
; 	if((flags & PAGE_PRESENT) == 0){
ffff800000110832: f6 c3 01             	testb	$1, %bl
ffff800000110835: 0f 84 d4 00 00 00    	je	0xffff80000011090f <page_insert+0xef>
ffff80000011083b: 49 89 d7             	movq	%rdx, %r15
ffff80000011083e: 49 89 f4             	movq	%rsi, %r12
ffff800000110841: 49 89 fe             	movq	%rdi, %r14
; 	if(!page_aligned((uintptr_t)va)){
ffff800000110844: 48 b8 90 09 11 00 00 80 ff ff	movabsq	$-140737487238768, %rax # imm = 0xFFFF800000110990
ffff80000011084e: 48 89 d7             	movq	%rdx, %rdi
ffff800000110851: ff d0                	callq	*%rax
ffff800000110853: 85 c0                	testl	%eax, %eax
ffff800000110855: 0f 84 db 00 00 00    	je	0xffff800000110936 <page_insert+0x116>
; 	if((flags & PAGE_HUGE) && !hpage_aligned((uintptr_t)va)){
ffff80000011085b: f6 c3 80             	testb	$-128, %bl
ffff80000011085e: 74 17                	je	0xffff800000110877 <page_insert+0x57>
ffff800000110860: 48 b8 b0 09 11 00 00 80 ff ff	movabsq	$-140737487238736, %rax # imm = 0xFFFF8000001109B0
ffff80000011086a: 4c 89 ff             	movq	%r15, %rdi
ffff80000011086d: ff d0                	callq	*%rax
ffff80000011086f: 85 c0                	testl	%eax, %eax
ffff800000110871: 0f 84 e6 00 00 00    	je	0xffff80000011095d <page_insert+0x13d>
; 	struct insert_info info = {pml4, page, flags};
ffff800000110877: 4c 89 75 c8          	movq	%r14, -56(%rbp)
ffff80000011087b: 4c 89 65 d0          	movq	%r12, -48(%rbp)
ffff80000011087f: 48 89 5d d8          	movq	%rbx, -40(%rbp)
; 	struct page_walker walker = {
ffff800000110883: 48 b8 d0 09 11 00 00 80 ff ff	movabsq	$-140737487238704, %rax # imm = 0xFFFF8000001109D0
ffff80000011088d: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000110894: 48 b8 70 0a 11 00 00 80 ff ff	movabsq	$-140737487238544, %rax # imm = 0xFFFF800000110A70
ffff80000011089e: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff8000001108a2: 48 c7 45 88 00 00 00 00      	movq	$0, -120(%rbp)
ffff8000001108aa: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff8000001108b2: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff8000001108ba: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff8000001108c2: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff8000001108ca: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001108d2: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff8000001108da: 48 8d 45 c8          	leaq	-56(%rbp), %rax
ffff8000001108de: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	return walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001108e2: 49 8d 97 00 10 00 00 	leaq	4096(%r15), %rdx
ffff8000001108e9: 48 b8 c0 17 11 00 00 80 ff ff	movabsq	$-140737487235136, %rax # imm = 0xFFFF8000001117C0
ffff8000001108f3: 48 8d 8d 78 ff ff ff 	leaq	-136(%rbp), %rcx
ffff8000001108fa: 4c 89 f7             	movq	%r14, %rdi
ffff8000001108fd: 4c 89 fe             	movq	%r15, %rsi
ffff800000110900: ff d0                	callq	*%rax
ffff800000110902: 48 83 c4 70          	addq	$112, %rsp
ffff800000110906: 5b                   	popq	%rbx
ffff800000110907: 41 5c                	popq	%r12
ffff800000110909: 41 5e                	popq	%r14
ffff80000011090b: 41 5f                	popq	%r15
ffff80000011090d: 5d                   	popq	%rbp
ffff80000011090e: c3                   	retq
; 		panic("page_insert called with present bit 0");
ffff80000011090f: 48 bf 86 4e 11 00 00 80 ff ff	movabsq	$-140737487221114, %rdi # imm = 0xFFFF800000114E86
ffff800000110919: 48 ba 38 51 11 00 00 80 ff ff	movabsq	$-140737487220424, %rdx # imm = 0xFFFF800000115138
ffff800000110923: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011092d: be 57 00 00 00       	movl	$87, %esi
ffff800000110932: 31 c0                	xorl	%eax, %eax
ffff800000110934: ff d1                	callq	*%rcx
; 		panic("page_insert called with non-aligned virtual address");
ffff800000110936: 48 bf 86 4e 11 00 00 80 ff ff	movabsq	$-140737487221114, %rdi # imm = 0xFFFF800000114E86
ffff800000110940: 48 ba 5e 51 11 00 00 80 ff ff	movabsq	$-140737487220386, %rdx # imm = 0xFFFF80000011515E
ffff80000011094a: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000110954: be 5a 00 00 00       	movl	$90, %esi
ffff800000110959: 31 c0                	xorl	%eax, %eax
ffff80000011095b: ff d1                	callq	*%rcx
; 		panic("page_insert called with huge page non-aligned virtual address");
ffff80000011095d: 48 bf 86 4e 11 00 00 80 ff ff	movabsq	$-140737487221114, %rdi # imm = 0xFFFF800000114E86
ffff800000110967: 48 ba ca 54 11 00 00 80 ff ff	movabsq	$-140737487219510, %rdx # imm = 0xFFFF8000001154CA
ffff800000110971: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011097b: be 5d 00 00 00       	movl	$93, %esi
ffff800000110980: 31 c0                	xorl	%eax, %eax
ffff800000110982: ff d1                	callq	*%rcx
ffff800000110984: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011098e: 66 90                	nop

ffff800000110990 <page_aligned>:
; {
ffff800000110990: 55                   	pushq	%rbp
ffff800000110991: 48 89 e5             	movq	%rsp, %rbp
; 	return !(p & (PAGE_SIZE - 1));
ffff800000110994: 31 c0                	xorl	%eax, %eax
ffff800000110996: f7 c7 ff 0f 00 00    	testl	$4095, %edi             # imm = 0xFFF
ffff80000011099c: 0f 94 c0             	sete	%al
ffff80000011099f: 5d                   	popq	%rbp
ffff8000001109a0: c3                   	retq
ffff8000001109a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001109ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001109b0 <hpage_aligned>:
; {
ffff8000001109b0: 55                   	pushq	%rbp
ffff8000001109b1: 48 89 e5             	movq	%rsp, %rbp
; 	return !(p & (HPAGE_SIZE - 1));
ffff8000001109b4: 31 c0                	xorl	%eax, %eax
ffff8000001109b6: f7 c7 ff ff 1f 00    	testl	$2097151, %edi          # imm = 0x1FFFFF
ffff8000001109bc: 0f 94 c0             	sete	%al
ffff8000001109bf: 5d                   	popq	%rbp
ffff8000001109c0: c3                   	retq
ffff8000001109c1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001109cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001109d0 <insert_pte>:
; {
ffff8000001109d0: 55                   	pushq	%rbp
ffff8000001109d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001109d4: 41 57                	pushq	%r15
ffff8000001109d6: 41 56                	pushq	%r14
ffff8000001109d8: 41 54                	pushq	%r12
ffff8000001109da: 53                   	pushq	%rbx
ffff8000001109db: 49 89 fe             	movq	%rdi, %r14
; 	struct insert_info *info = walker->udata;
ffff8000001109de: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	if(*entry & PAGE_PRESENT){
ffff8000001109e2: 48 8b 3f             	movq	(%rdi), %rdi
ffff8000001109e5: 40 f6 c7 01          	testb	$1, %dil
ffff8000001109e9: 74 4f                	je	0xffff800000110a3a <insert_pte+0x6a>
ffff8000001109eb: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff8000001109f5: 48 21 c7             	andq	%rax, %rdi
ffff8000001109f8: 48 b8 40 0b 11 00 00 80 ff ff	movabsq	$-140737487238336, %rax # imm = 0xFFFF800000110B40
ffff800000110a02: ff d0                	callq	*%rax
ffff800000110a04: 49 89 c4             	movq	%rax, %r12
; 		page_decref(page);
ffff800000110a07: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff800000110a11: 4c 89 e7             	movq	%r12, %rdi
ffff800000110a14: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff800000110a16: 4c 8b 3b             	movq	(%rbx), %r15
ffff800000110a19: 48 b8 a0 0b 11 00 00 80 ff ff	movabsq	$-140737487238240, %rax # imm = 0xFFFF800000110BA0
ffff800000110a23: 4c 89 e7             	movq	%r12, %rdi
ffff800000110a26: ff d0                	callq	*%rax
ffff800000110a28: 48 b9 90 17 11 00 00 80 ff ff	movabsq	$-140737487235184, %rcx # imm = 0xFFFF800000111790
ffff800000110a32: 4c 89 ff             	movq	%r15, %rdi
ffff800000110a35: 48 89 c6             	movq	%rax, %rsi
ffff800000110a38: ff d1                	callq	*%rcx
; 	info->page->pp_ref++;
ffff800000110a3a: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff800000110a3e: 66 83 47 10 01       	addw	$1, 16(%rdi)
; 	*entry = page2pa(info->page) | info->flags;
ffff800000110a43: 48 b8 d0 0b 11 00 00 80 ff ff	movabsq	$-140737487238192, %rax # imm = 0xFFFF800000110BD0
ffff800000110a4d: ff d0                	callq	*%rax
ffff800000110a4f: 48 0b 43 10          	orq	16(%rbx), %rax
ffff800000110a53: 49 89 06             	movq	%rax, (%r14)
; 	return 0;
ffff800000110a56: 31 c0                	xorl	%eax, %eax
ffff800000110a58: 5b                   	popq	%rbx
ffff800000110a59: 41 5c                	popq	%r12
ffff800000110a5b: 41 5e                	popq	%r14
ffff800000110a5d: 41 5f                	popq	%r15
ffff800000110a5f: 5d                   	popq	%rbp
ffff800000110a60: c3                   	retq
ffff800000110a61: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110a6b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110a70 <insert_pde>:
; {
ffff800000110a70: 55                   	pushq	%rbp
ffff800000110a71: 48 89 e5             	movq	%rsp, %rbp
ffff800000110a74: 41 57                	pushq	%r15
ffff800000110a76: 41 56                	pushq	%r14
ffff800000110a78: 41 55                	pushq	%r13
ffff800000110a7a: 41 54                	pushq	%r12
ffff800000110a7c: 53                   	pushq	%rbx
ffff800000110a7d: 48 83 ec 18          	subq	$24, %rsp
ffff800000110a81: 49 89 ce             	movq	%rcx, %r14
ffff800000110a84: 49 89 fd             	movq	%rdi, %r13
; 	struct insert_info *info = walker->udata;
ffff800000110a87: 4c 8b 61 48          	movq	72(%rcx), %r12
; 	if(*entry & PAGE_HUGE){
ffff800000110a8b: 48 8b 3f             	movq	(%rdi), %rdi
ffff800000110a8e: 40 f6 c7 80          	testb	$-128, %dil
ffff800000110a92: 74 60                	je	0xffff800000110af4 <insert_pde+0x84>
ffff800000110a94: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff800000110a9e: 48 21 c7             	andq	%rax, %rdi
ffff800000110aa1: 48 b8 40 0b 11 00 00 80 ff ff	movabsq	$-140737487238336, %rax # imm = 0xFFFF800000110B40
ffff800000110aab: 48 89 55 c8          	movq	%rdx, -56(%rbp)
ffff800000110aaf: 48 89 75 d0          	movq	%rsi, -48(%rbp)
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff800000110ab3: ff d0                	callq	*%rax
ffff800000110ab5: 48 89 c3             	movq	%rax, %rbx
; 		page_decref(page);
ffff800000110ab8: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff800000110ac2: 48 89 df             	movq	%rbx, %rdi
ffff800000110ac5: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff800000110ac7: 4d 8b 3c 24          	movq	(%r12), %r15
ffff800000110acb: 48 b8 a0 0b 11 00 00 80 ff ff	movabsq	$-140737487238240, %rax # imm = 0xFFFF800000110BA0
ffff800000110ad5: 48 89 df             	movq	%rbx, %rdi
ffff800000110ad8: ff d0                	callq	*%rax
ffff800000110ada: 48 b9 90 17 11 00 00 80 ff ff	movabsq	$-140737487235184, %rcx # imm = 0xFFFF800000111790
ffff800000110ae4: 4c 89 ff             	movq	%r15, %rdi
ffff800000110ae7: 48 89 c6             	movq	%rax, %rsi
ffff800000110aea: ff d1                	callq	*%rcx
ffff800000110aec: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000110af0: 48 8b 55 c8          	movq	-56(%rbp), %rdx
; 	if((info->flags & PAGE_HUGE) == 0){
ffff800000110af4: 49 8b 5c 24 10       	movq	16(%r12), %rbx
ffff800000110af9: f6 c3 80             	testb	$-128, %bl
ffff800000110afc: 75 14                	jne	0xffff800000110b12 <insert_pde+0xa2>
; 		return ptbl_alloc(entry, base, end, walker);
ffff800000110afe: 48 b8 10 11 11 00 00 80 ff ff	movabsq	$-140737487236848, %rax # imm = 0xFFFF800000111110
ffff800000110b08: 4c 89 ef             	movq	%r13, %rdi
ffff800000110b0b: 4c 89 f1             	movq	%r14, %rcx
ffff800000110b0e: ff d0                	callq	*%rax
ffff800000110b10: eb 1f                	jmp	0xffff800000110b31 <insert_pde+0xc1>
; 	info->page->pp_ref++;
ffff800000110b12: 49 8b 7c 24 08       	movq	8(%r12), %rdi
ffff800000110b17: 66 83 47 10 01       	addw	$1, 16(%rdi)
; 	*entry = page2pa(info->page) | info->flags;
ffff800000110b1c: 48 b8 d0 0b 11 00 00 80 ff ff	movabsq	$-140737487238192, %rax # imm = 0xFFFF800000110BD0
ffff800000110b26: ff d0                	callq	*%rax
ffff800000110b28: 48 09 d8             	orq	%rbx, %rax
ffff800000110b2b: 49 89 45 00          	movq	%rax, (%r13)
ffff800000110b2f: 31 c0                	xorl	%eax, %eax
; }
ffff800000110b31: 48 83 c4 18          	addq	$24, %rsp
ffff800000110b35: 5b                   	popq	%rbx
ffff800000110b36: 41 5c                	popq	%r12
ffff800000110b38: 41 5d                	popq	%r13
ffff800000110b3a: 41 5e                	popq	%r14
ffff800000110b3c: 41 5f                	popq	%r15
ffff800000110b3e: 5d                   	popq	%rbp
ffff800000110b3f: c3                   	retq

ffff800000110b40 <pa2page>:
; {
ffff800000110b40: 55                   	pushq	%rbp
ffff800000110b41: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000110b44: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000110b48: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000110b52: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000110b55: 73 16                	jae	0xffff800000110b6d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000110b57: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff800000110b61: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000110b65: 48 03 38             	addq	(%rax), %rdi
ffff800000110b68: 48 89 f8             	movq	%rdi, %rax
ffff800000110b6b: 5d                   	popq	%rbp
ffff800000110b6c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff800000110b6d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000110b77: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff800000110b81: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000110b8b: be 49 00 00 00       	movl	$73, %esi
ffff800000110b90: 31 c0                	xorl	%eax, %eax
ffff800000110b92: ff d1                	callq	*%rcx
ffff800000110b94: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110b9e: 66 90                	nop

ffff800000110ba0 <page2kva>:
; {
ffff800000110ba0: 55                   	pushq	%rbp
ffff800000110ba1: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff800000110ba4: 48 b8 d0 0b 11 00 00 80 ff ff	movabsq	$-140737487238192, %rax # imm = 0xFFFF800000110BD0
ffff800000110bae: ff d0                	callq	*%rax
ffff800000110bb0: 48 b9 f0 0b 11 00 00 80 ff ff	movabsq	$-140737487238160, %rcx # imm = 0xFFFF800000110BF0
ffff800000110bba: 48 89 c7             	movq	%rax, %rdi
ffff800000110bbd: ff d1                	callq	*%rcx
ffff800000110bbf: 5d                   	popq	%rbp
ffff800000110bc0: c3                   	retq
ffff800000110bc1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110bcb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110bd0 <page2pa>:
; {
ffff800000110bd0: 55                   	pushq	%rbp
ffff800000110bd1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110bd4: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000110bd7: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff800000110be1: 48 2b 01             	subq	(%rcx), %rax
ffff800000110be4: 48 c1 e0 07          	shlq	$7, %rax
ffff800000110be8: 5d                   	popq	%rbp
ffff800000110be9: c3                   	retq
ffff800000110bea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110bf0 <_kaddr>:
; {
ffff800000110bf0: 55                   	pushq	%rbp
ffff800000110bf1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110bf4: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000110bf7: 48 89 f9             	movq	%rdi, %rcx
ffff800000110bfa: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000110bfe: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff800000110c08: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff800000110c0b: 73 0f                	jae	0xffff800000110c1c <_kaddr+0x2c>
ffff800000110c0d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff800000110c17: 48 01 c8             	addq	%rcx, %rax
ffff800000110c1a: 5d                   	popq	%rbp
ffff800000110c1b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000110c1c: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000110c26: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff800000110c30: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000110c3a: be 50 00 00 00       	movl	$80, %esi
ffff800000110c3f: 48 89 c1             	movq	%rax, %rcx
ffff800000110c42: 31 c0                	xorl	%eax, %eax
ffff800000110c44: 41 ff d0             	callq	*%r8
ffff800000110c47: cc                   	int3
ffff800000110c48: cc                   	int3
ffff800000110c49: cc                   	int3
ffff800000110c4a: cc                   	int3
ffff800000110c4b: cc                   	int3
ffff800000110c4c: cc                   	int3
ffff800000110c4d: cc                   	int3
ffff800000110c4e: cc                   	int3
ffff800000110c4f: cc                   	int3

ffff800000110c50 <page_lookup>:
; {
ffff800000110c50: 55                   	pushq	%rbp
ffff800000110c51: 48 89 e5             	movq	%rsp, %rbp
ffff800000110c54: 53                   	pushq	%rbx
ffff800000110c55: 48 83 ec 58          	subq	$88, %rsp
ffff800000110c59: 48 89 d3             	movq	%rdx, %rbx
; 	struct lookup_info info = {
ffff800000110c5c: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	struct page_walker walker = {
ffff800000110c64: 48 b8 10 0d 11 00 00 80 ff ff	movabsq	$-140737487237872, %rax # imm = 0xFFFF800000110D10
ffff800000110c6e: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff800000110c72: 48 b8 30 0d 11 00 00 80 ff ff	movabsq	$-140737487237840, %rax # imm = 0xFFFF800000110D30
ffff800000110c7c: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff800000110c80: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000110c88: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110c90: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000110c98: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110ca0: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000110ca8: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000110cb0: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000110cb8: 48 8d 45 f0          	leaq	-16(%rbp), %rax
ffff800000110cbc: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff800000110cc0: 48 8d 96 00 10 00 00 	leaq	4096(%rsi), %rdx
ffff800000110cc7: 48 b8 c0 17 11 00 00 80 ff ff	movabsq	$-140737487235136, %rax # imm = 0xFFFF8000001117C0
ffff800000110cd1: 48 8d 4d a0          	leaq	-96(%rbp), %rcx
ffff800000110cd5: ff d0                	callq	*%rax
; 			    &walker) < 0)
ffff800000110cd7: 85 c0                	testl	%eax, %eax
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff800000110cd9: 78 2c                	js	0xffff800000110d07 <page_lookup+0xb7>
; 	if(info.entry == NULL) return NULL;
ffff800000110cdb: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110cdf: 48 85 c0             	testq	%rax, %rax
ffff800000110ce2: 74 23                	je	0xffff800000110d07 <page_lookup+0xb7>
; 	if(entry_store != NULL) *entry_store = info.entry;
ffff800000110ce4: 48 85 db             	testq	%rbx, %rbx
ffff800000110ce7: 74 03                	je	0xffff800000110cec <page_lookup+0x9c>
ffff800000110ce9: 48 89 03             	movq	%rax, (%rbx)
ffff800000110cec: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
; 	return pa2page(PAGE_ADDR(*info.entry));
ffff800000110cf6: 48 23 38             	andq	(%rax), %rdi
ffff800000110cf9: 48 b8 50 0d 11 00 00 80 ff ff	movabsq	$-140737487237808, %rax # imm = 0xFFFF800000110D50
ffff800000110d03: ff d0                	callq	*%rax
ffff800000110d05: eb 02                	jmp	0xffff800000110d09 <page_lookup+0xb9>
ffff800000110d07: 31 c0                	xorl	%eax, %eax
; }
ffff800000110d09: 48 83 c4 58          	addq	$88, %rsp
ffff800000110d0d: 5b                   	popq	%rbx
ffff800000110d0e: 5d                   	popq	%rbp
ffff800000110d0f: c3                   	retq

ffff800000110d10 <lookup_pte>:
; {
ffff800000110d10: 55                   	pushq	%rbp
ffff800000110d11: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & PAGE_PRESENT){
ffff800000110d14: f6 07 01             	testb	$1, (%rdi)
ffff800000110d17: 74 07                	je	0xffff800000110d20 <lookup_pte+0x10>
; 	struct lookup_info *info = walker->udata;
ffff800000110d19: 48 8b 41 48          	movq	72(%rcx), %rax
; 		info->entry = entry;
ffff800000110d1d: 48 89 38             	movq	%rdi, (%rax)
; 	return 0;
ffff800000110d20: 31 c0                	xorl	%eax, %eax
ffff800000110d22: 5d                   	popq	%rbp
ffff800000110d23: c3                   	retq
ffff800000110d24: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110d2e: 66 90                	nop

ffff800000110d30 <lookup_pde>:
; {
ffff800000110d30: 55                   	pushq	%rbp
ffff800000110d31: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & (PAGE_HUGE | PAGE_PRESENT)){
ffff800000110d34: f6 07 81             	testb	$-127, (%rdi)
ffff800000110d37: 74 07                	je	0xffff800000110d40 <lookup_pde+0x10>
; 	struct lookup_info *info = walker->udata;
ffff800000110d39: 48 8b 41 48          	movq	72(%rcx), %rax
; 		info->entry = entry;
ffff800000110d3d: 48 89 38             	movq	%rdi, (%rax)
; 	return 0;
ffff800000110d40: 31 c0                	xorl	%eax, %eax
ffff800000110d42: 5d                   	popq	%rbp
ffff800000110d43: c3                   	retq
ffff800000110d44: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110d4e: 66 90                	nop

ffff800000110d50 <pa2page>:
; {
ffff800000110d50: 55                   	pushq	%rbp
ffff800000110d51: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000110d54: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000110d58: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000110d62: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000110d65: 73 16                	jae	0xffff800000110d7d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000110d67: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff800000110d71: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000110d75: 48 03 38             	addq	(%rax), %rdi
ffff800000110d78: 48 89 f8             	movq	%rdi, %rax
ffff800000110d7b: 5d                   	popq	%rbp
ffff800000110d7c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff800000110d7d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000110d87: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff800000110d91: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000110d9b: be 49 00 00 00       	movl	$73, %esi
ffff800000110da0: 31 c0                	xorl	%eax, %eax
ffff800000110da2: ff d1                	callq	*%rcx
ffff800000110da4: cc                   	int3
ffff800000110da5: cc                   	int3
ffff800000110da6: cc                   	int3
ffff800000110da7: cc                   	int3
ffff800000110da8: cc                   	int3
ffff800000110da9: cc                   	int3
ffff800000110daa: cc                   	int3
ffff800000110dab: cc                   	int3
ffff800000110dac: cc                   	int3
ffff800000110dad: cc                   	int3
ffff800000110dae: cc                   	int3
ffff800000110daf: cc                   	int3

ffff800000110db0 <boot_map_region>:
; {
ffff800000110db0: 55                   	pushq	%rbp
ffff800000110db1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110db4: 48 81 ec 80 00 00 00 	subq	$128, %rsp
; 	struct boot_map_info info = {
ffff800000110dbb: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000110dc3: 4c 89 45 e0          	movq	%r8, -32(%rbp)
ffff800000110dc7: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff800000110dcb: 48 89 f0             	movq	%rsi, %rax
ffff800000110dce: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
; 	struct boot_map_info info = {
ffff800000110dd4: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff800000110dd8: 48 8d 04 16          	leaq	(%rsi,%rdx), %rax
ffff800000110ddc: 48 8d 0c 16          	leaq	(%rsi,%rdx), %rcx
ffff800000110de0: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
ffff800000110de7: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff800000110dee: 48 83 c1 ff          	addq	$-1, %rcx
; 	struct boot_map_info info = {
ffff800000110df2: 48 89 4d f8          	movq	%rcx, -8(%rbp)
; 	struct page_walker walker = {
ffff800000110df6: 48 b9 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rcx # imm = 0xFFFF800000110E80
ffff800000110e00: 48 89 4d 88          	movq	%rcx, -120(%rbp)
ffff800000110e04: 48 b9 b0 0e 11 00 00 80 ff ff	movabsq	$-140737487237456, %rcx # imm = 0xFFFF800000110EB0
ffff800000110e0e: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff800000110e12: 48 b9 20 0f 11 00 00 80 ff ff	movabsq	$-140737487237344, %rcx # imm = 0xFFFF800000110F20
ffff800000110e1c: 48 89 4d 98          	movq	%rcx, -104(%rbp)
ffff800000110e20: 48 b9 40 0f 11 00 00 80 ff ff	movabsq	$-140737487237312, %rcx # imm = 0xFFFF800000110F40
ffff800000110e2a: 48 89 4d a0          	movq	%rcx, -96(%rbp)
ffff800000110e2e: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000110e36: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000110e3e: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110e46: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000110e4e: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110e56: 48 8d 4d d8          	leaq	-40(%rbp), %rcx
ffff800000110e5a: 48 89 4d d0          	movq	%rcx, -48(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff800000110e5e: 49 b8 c0 17 11 00 00 80 ff ff	movabsq	$-140737487235136, %r8 # imm = 0xFFFF8000001117C0
ffff800000110e68: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff800000110e6c: 48 89 c2             	movq	%rax, %rdx
ffff800000110e6f: 41 ff d0             	callq	*%r8
; }
ffff800000110e72: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff800000110e79: 5d                   	popq	%rbp
ffff800000110e7a: c3                   	retq
ffff800000110e7b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110e80 <boot_map_pte>:
; {
ffff800000110e80: 55                   	pushq	%rbp
ffff800000110e81: 48 89 e5             	movq	%rsp, %rbp
ffff800000110e84: 53                   	pushq	%rbx
ffff800000110e85: 50                   	pushq	%rax
; 	struct boot_map_info *info = walker->udata;
ffff800000110e86: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	int res = claim_entry(entry, base, end, walker);
ffff800000110e8a: 48 b8 30 10 11 00 00 80 ff ff	movabsq	$-140737487237072, %rax # imm = 0xFFFF800000111030
ffff800000110e94: ff d0                	callq	*%rax
; 	if(res > 0) info->pa, info->base += PAGE_SIZE;
ffff800000110e96: 85 c0                	testl	%eax, %eax
ffff800000110e98: 7e 08                	jle	0xffff800000110ea2 <boot_map_pte+0x22>
ffff800000110e9a: 48 81 43 18 00 10 00 00      	addq	$4096, 24(%rbx) # imm = 0x1000
; 	return res;
ffff800000110ea2: 48 83 c4 08          	addq	$8, %rsp
ffff800000110ea6: 5b                   	popq	%rbx
ffff800000110ea7: 5d                   	popq	%rbp
ffff800000110ea8: c3                   	retq
ffff800000110ea9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000110eb0 <boot_map_pde>:
; {
ffff800000110eb0: 55                   	pushq	%rbp
ffff800000110eb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110eb4: 41 57                	pushq	%r15
ffff800000110eb6: 41 56                	pushq	%r14
ffff800000110eb8: 53                   	pushq	%rbx
ffff800000110eb9: 50                   	pushq	%rax
ffff800000110eba: 48 89 fb             	movq	%rdi, %rbx
; 	struct boot_map_info *info = walker->udata;
ffff800000110ebd: 4c 8b 79 48          	movq	72(%rcx), %r15
; 		if(*entry & PAGE_PRESENT){
ffff800000110ec1: f6 07 01             	testb	$1, (%rdi)
ffff800000110ec4: 75 0c                	jne	0xffff800000110ed2 <boot_map_pde+0x22>
; 			res = ptbl_alloc(entry, base, end, walker);
ffff800000110ec6: 48 b8 10 11 11 00 00 80 ff ff	movabsq	$-140737487236848, %rax # imm = 0xFFFF800000111110
ffff800000110ed0: eb 0a                	jmp	0xffff800000110edc <boot_map_pde+0x2c>
; 			res = ptbl_split(entry, base, end, walker);
ffff800000110ed2: 48 b8 90 11 11 00 00 80 ff ff	movabsq	$-140737487236720, %rax # imm = 0xFFFF800000111190
ffff800000110edc: 48 89 df             	movq	%rbx, %rdi
ffff800000110edf: ff d0                	callq	*%rax
ffff800000110ee1: 41 89 c6             	movl	%eax, %r14d
; 		if(res >= 0) {
ffff800000110ee4: 85 c0                	testl	%eax, %eax
ffff800000110ee6: 78 26                	js	0xffff800000110f0e <boot_map_pde+0x5e>
; 			set_entry_pa(entry, info->pa);
ffff800000110ee8: 49 8b 77 10          	movq	16(%r15), %rsi
ffff800000110eec: 48 b8 d0 10 11 00 00 80 ff ff	movabsq	$-140737487236912, %rax # imm = 0xFFFF8000001110D0
ffff800000110ef6: 48 89 df             	movq	%rbx, %rdi
ffff800000110ef9: ff d0                	callq	*%rax
; 			ovveride_flags(entry, info->flags);
ffff800000110efb: 49 8b 77 08          	movq	8(%r15), %rsi
ffff800000110eff: 48 b8 f0 10 11 00 00 80 ff ff	movabsq	$-140737487236880, %rax # imm = 0xFFFF8000001110F0
ffff800000110f09: 48 89 df             	movq	%rbx, %rdi
ffff800000110f0c: ff d0                	callq	*%rax
; 	return res;
ffff800000110f0e: 44 89 f0             	movl	%r14d, %eax
ffff800000110f11: 48 83 c4 08          	addq	$8, %rsp
ffff800000110f15: 5b                   	popq	%rbx
ffff800000110f16: 41 5e                	popq	%r14
ffff800000110f18: 41 5f                	popq	%r15
ffff800000110f1a: 5d                   	popq	%rbp
ffff800000110f1b: c3                   	retq
ffff800000110f1c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110f20 <boot_map_pdpte>:
; {
ffff800000110f20: 55                   	pushq	%rbp
ffff800000110f21: 48 89 e5             	movq	%rsp, %rbp
; 	return claim_entry(entry, base, end, walker);
ffff800000110f24: 48 b8 30 10 11 00 00 80 ff ff	movabsq	$-140737487237072, %rax # imm = 0xFFFF800000111030
ffff800000110f2e: ff d0                	callq	*%rax
ffff800000110f30: 5d                   	popq	%rbp
ffff800000110f31: c3                   	retq
ffff800000110f32: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110f3c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110f40 <boot_map_pml4>:
; {
ffff800000110f40: 55                   	pushq	%rbp
ffff800000110f41: 48 89 e5             	movq	%rsp, %rbp
; 	return claim_entry(entry, base, end, walker);
ffff800000110f44: 48 b8 30 10 11 00 00 80 ff ff	movabsq	$-140737487237072, %rax # imm = 0xFFFF800000111030
ffff800000110f4e: ff d0                	callq	*%rax
ffff800000110f50: 5d                   	popq	%rbp
ffff800000110f51: c3                   	retq
ffff800000110f52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110f5c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110f60 <boot_map_kernel>:
; {
ffff800000110f60: 55                   	pushq	%rbp
ffff800000110f61: 48 89 e5             	movq	%rsp, %rbp
ffff800000110f64: 41 57                	pushq	%r15
ffff800000110f66: 41 56                	pushq	%r14
ffff800000110f68: 41 55                	pushq	%r13
ffff800000110f6a: 41 54                	pushq	%r12
ffff800000110f6c: 53                   	pushq	%rbx
ffff800000110f6d: 50                   	pushq	%rax
ffff800000110f6e: 48 89 f3             	movq	%rsi, %rbx
ffff800000110f71: 49 89 fe             	movq	%rdi, %r14
ffff800000110f74: 49 bf 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %r15 # imm = 0xFFFF800000000000
ffff800000110f7e: 48 b8 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
; 	    (struct elf_proghdr *)((char *)elf_hdr + elf_hdr->e_phoff);
ffff800000110f88: 4c 8b 66 20          	movq	32(%rsi), %r12
; 	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, PADDR((void*)KERNEL_VMA), PAGE_KMASK);
ffff800000110f8c: 4c 8d 40 03          	leaq	3(%rax), %r8
ffff800000110f90: 48 b8 b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %rax # imm = 0xFFFF800000110DB0
ffff800000110f9a: ba 00 00 80 00       	movl	$8388608, %edx          # imm = 0x800000
ffff800000110f9f: 4c 89 fe             	movq	%r15, %rsi
ffff800000110fa2: 31 c9                	xorl	%ecx, %ecx
ffff800000110fa4: ff d0                	callq	*%rax
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000110fa6: 66 83 7b 38 00       	cmpw	$0, 56(%rbx)
ffff800000110fab: 74 6c                	je	0xffff800000111019 <boot_map_kernel+0xb9>
ffff800000110fad: 49 01 dc             	addq	%rbx, %r12
ffff800000110fb0: 49 83 c4 28          	addq	$40, %r12
ffff800000110fb4: 45 31 ed             	xorl	%r13d, %r13d
ffff800000110fb7: eb 18                	jmp	0xffff800000110fd1 <boot_map_kernel+0x71>
ffff800000110fb9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff800000110fc0: 49 83 c5 01          	addq	$1, %r13
ffff800000110fc4: 0f b7 43 38          	movzwl	56(%rbx), %eax
ffff800000110fc8: 49 83 c4 38          	addq	$56, %r12
ffff800000110fcc: 49 39 c5             	cmpq	%rax, %r13
ffff800000110fcf: 73 48                	jae	0xffff800000111019 <boot_map_kernel+0xb9>
; 		if(prog_hdr->p_va < KERNEL_VMA) continue;
ffff800000110fd1: 49 8b 74 24 e8       	movq	-24(%r12), %rsi
ffff800000110fd6: 4c 39 fe             	cmpq	%r15, %rsi
ffff800000110fd9: 72 e5                	jb	0xffff800000110fc0 <boot_map_kernel+0x60>
; 		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
ffff800000110fdb: 41 8b 44 24 dc       	movl	-36(%r12), %eax
ffff800000110fe0: 89 c1                	movl	%eax, %ecx
ffff800000110fe2: 83 e1 02             	andl	$2, %ecx
; 		if(!(prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)) flags |= PAGE_NO_EXEC; //CHECK AGAIN IF THIS IS THE CORRECT WAY TO CHECK THE FLAGS
ffff800000110fe5: 49 89 c8             	movq	%rcx, %r8
ffff800000110fe8: 48 ba 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rdx # imm = 0x8000000000000000
ffff800000110ff2: 49 09 d0             	orq	%rdx, %r8
ffff800000110ff5: a8 01                	testb	$1, %al
ffff800000110ff7: 4c 0f 45 c1          	cmovneq	%rcx, %r8
; 		flags |= PF_PRESENT;
ffff800000110ffb: 49 83 c8 01          	orq	$1, %r8
; 		boot_map_region(pml4, (void*) prog_hdr->p_va, prog_hdr->p_memsz, prog_hdr->p_pa, flags);
ffff800000110fff: 49 8b 14 24          	movq	(%r12), %rdx
ffff800000111003: 49 8b 4c 24 f0       	movq	-16(%r12), %rcx
ffff800000111008: 4c 89 f7             	movq	%r14, %rdi
ffff80000011100b: 48 b8 b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %rax # imm = 0xFFFF800000110DB0
ffff800000111015: ff d0                	callq	*%rax
ffff800000111017: eb a7                	jmp	0xffff800000110fc0 <boot_map_kernel+0x60>
; }
ffff800000111019: 48 83 c4 08          	addq	$8, %rsp
ffff80000011101d: 5b                   	popq	%rbx
ffff80000011101e: 41 5c                	popq	%r12
ffff800000111020: 41 5d                	popq	%r13
ffff800000111022: 41 5e                	popq	%r14
ffff800000111024: 41 5f                	popq	%r15
ffff800000111026: 5d                   	popq	%rbp
ffff800000111027: c3                   	retq
ffff800000111028: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111030 <claim_entry>:
; static int claim_entry(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
ffff800000111030: 55                   	pushq	%rbp
ffff800000111031: 48 89 e5             	movq	%rsp, %rbp
ffff800000111034: 41 57                	pushq	%r15
ffff800000111036: 41 56                	pushq	%r14
ffff800000111038: 41 55                	pushq	%r13
ffff80000011103a: 41 54                	pushq	%r12
ffff80000011103c: 53                   	pushq	%rbx
ffff80000011103d: 50                   	pushq	%rax
ffff80000011103e: 49 89 fe             	movq	%rdi, %r14
; 	struct boot_map_info *info = walker->udata;
ffff800000111041: 4c 8b 61 48          	movq	72(%rcx), %r12
ffff800000111045: 31 db                	xorl	%ebx, %ebx
; 	if(!(*entry & PAGE_PRESENT)) {
ffff800000111047: f6 07 01             	testb	$1, (%rdi)
ffff80000011104a: 75 3b                	jne	0xffff800000111087 <claim_entry+0x57>
ffff80000011104c: 49 89 cf             	movq	%rcx, %r15
ffff80000011104f: 49 89 f5             	movq	%rsi, %r13
; 		cprintf("attempting to do ptbl_alloc\n");
ffff800000111052: 48 bf 78 59 11 00 00 80 ff ff	movabsq	$-140737487218312, %rdi # imm = 0xFFFF800000115978
ffff80000011105c: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111066: 31 c0                	xorl	%eax, %eax
ffff800000111068: 48 89 d3             	movq	%rdx, %rbx
ffff80000011106b: ff d1                	callq	*%rcx
; 		res = ptbl_alloc(entry, base, end, walker);
ffff80000011106d: 48 b8 10 11 11 00 00 80 ff ff	movabsq	$-140737487236848, %rax # imm = 0xFFFF800000111110
ffff800000111077: 4c 89 f7             	movq	%r14, %rdi
ffff80000011107a: 4c 89 ee             	movq	%r13, %rsi
ffff80000011107d: 48 89 da             	movq	%rbx, %rdx
ffff800000111080: 4c 89 f9             	movq	%r15, %rcx
ffff800000111083: ff d0                	callq	*%rax
ffff800000111085: 89 c3                	movl	%eax, %ebx
; 	if(res >= 0) {
ffff800000111087: 85 db                	testl	%ebx, %ebx
ffff800000111089: 78 28                	js	0xffff8000001110b3 <claim_entry+0x83>
; 		set_entry_pa(entry, info->pa);
ffff80000011108b: 49 8b 74 24 10       	movq	16(%r12), %rsi
ffff800000111090: 48 b8 d0 10 11 00 00 80 ff ff	movabsq	$-140737487236912, %rax # imm = 0xFFFF8000001110D0
ffff80000011109a: 4c 89 f7             	movq	%r14, %rdi
ffff80000011109d: ff d0                	callq	*%rax
; 		ovveride_flags(entry, info->flags);
ffff80000011109f: 49 8b 74 24 08       	movq	8(%r12), %rsi
ffff8000001110a4: 48 b8 f0 10 11 00 00 80 ff ff	movabsq	$-140737487236880, %rax # imm = 0xFFFF8000001110F0
ffff8000001110ae: 4c 89 f7             	movq	%r14, %rdi
ffff8000001110b1: ff d0                	callq	*%rax
; 	return res;
ffff8000001110b3: 89 d8                	movl	%ebx, %eax
ffff8000001110b5: 48 83 c4 08          	addq	$8, %rsp
ffff8000001110b9: 5b                   	popq	%rbx
ffff8000001110ba: 41 5c                	popq	%r12
ffff8000001110bc: 41 5d                	popq	%r13
ffff8000001110be: 41 5e                	popq	%r14
ffff8000001110c0: 41 5f                	popq	%r15
ffff8000001110c2: 5d                   	popq	%rbp
ffff8000001110c3: c3                   	retq
ffff8000001110c4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001110ce: 66 90                	nop

ffff8000001110d0 <set_entry_pa>:
; static inline void set_entry_pa(physaddr_t *entry, physaddr_t pa){
ffff8000001110d0: 55                   	pushq	%rbp
ffff8000001110d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001110d4: 48 b8 ff 0f 00 00 00 00 00 80	movabsq	$-9223372036854771713, %rax # imm = 0x8000000000000FFF
; 	*entry &= PHYS_ADD_MASK;
ffff8000001110de: 48 23 07             	andq	(%rdi), %rax
; 	*entry |= pa & (PAGE_SIZE - 1);
ffff8000001110e1: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff8000001110e7: 48 09 c6             	orq	%rax, %rsi
ffff8000001110ea: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff8000001110ed: 5d                   	popq	%rbp
ffff8000001110ee: c3                   	retq
ffff8000001110ef: 90                   	nop

ffff8000001110f0 <ovveride_flags>:
; static void ovveride_flags(physaddr_t* entry, uint64_t flags){
ffff8000001110f0: 55                   	pushq	%rbp
ffff8000001110f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001110f4: 48 b8 00 f0 ff ff ff ff ff 7f	movabsq	$9223372036854771712, %rax # imm = 0x7FFFFFFFFFFFF000
; 	*entry &= 0x7FFFFFFFFFFFF000; 
ffff8000001110fe: 48 23 07             	andq	(%rdi), %rax
; 	*entry |= flags;
ffff800000111101: 48 09 f0             	orq	%rsi, %rax
ffff800000111104: 48 89 07             	movq	%rax, (%rdi)
; }
ffff800000111107: 5d                   	popq	%rbp
ffff800000111108: c3                   	retq
ffff800000111109: cc                   	int3
ffff80000011110a: cc                   	int3
ffff80000011110b: cc                   	int3
ffff80000011110c: cc                   	int3
ffff80000011110d: cc                   	int3
ffff80000011110e: cc                   	int3
ffff80000011110f: cc                   	int3

ffff800000111110 <ptbl_alloc>:
; {
ffff800000111110: 55                   	pushq	%rbp
ffff800000111111: 48 89 e5             	movq	%rsp, %rbp
ffff800000111114: 41 56                	pushq	%r14
ffff800000111116: 53                   	pushq	%rbx
ffff800000111117: 45 31 f6             	xorl	%r14d, %r14d
; 	if(*entry & PAGE_PRESENT) return 0;
ffff80000011111a: f6 07 01             	testb	$1, (%rdi)
ffff80000011111d: 75 3c                	jne	0xffff80000011115b <ptbl_alloc+0x4b>
ffff80000011111f: 48 89 fb             	movq	%rdi, %rbx
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff800000111122: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff80000011112c: bf 01 00 00 00       	movl	$1, %edi
ffff800000111131: ff d0                	callq	*%rax
; 	if(new_table == NULL) return -1;
ffff800000111133: 48 85 c0             	testq	%rax, %rax
ffff800000111136: 74 1d                	je	0xffff800000111155 <ptbl_alloc+0x45>
; 	new_table->pp_ref++;
ffff800000111138: 66 83 40 10 01       	addw	$1, 16(%rax)
; 	physaddr_t table_addr = page2pa(new_table);
ffff80000011113d: 48 b9 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rcx # imm = 0xFFFF800000111170
ffff800000111147: 48 89 c7             	movq	%rax, %rdi
ffff80000011114a: ff d1                	callq	*%rcx
; 	*entry = table_addr | PAGE_PRESENT | PAGE_WRITE | PAGE_USER;
ffff80000011114c: 48 83 c8 07          	orq	$7, %rax
ffff800000111150: 48 89 03             	movq	%rax, (%rbx)
ffff800000111153: eb 06                	jmp	0xffff80000011115b <ptbl_alloc+0x4b>
ffff800000111155: 41 be ff ff ff ff    	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
; }
ffff80000011115b: 44 89 f0             	movl	%r14d, %eax
ffff80000011115e: 5b                   	popq	%rbx
ffff80000011115f: 41 5e                	popq	%r14
ffff800000111161: 5d                   	popq	%rbp
ffff800000111162: c3                   	retq
ffff800000111163: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011116d: 0f 1f 00             	nopl	(%rax)

ffff800000111170 <page2pa>:
; {
ffff800000111170: 55                   	pushq	%rbp
ffff800000111171: 48 89 e5             	movq	%rsp, %rbp
ffff800000111174: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000111177: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff800000111181: 48 2b 01             	subq	(%rcx), %rax
ffff800000111184: 48 c1 e0 07          	shlq	$7, %rax
ffff800000111188: 5d                   	popq	%rbp
ffff800000111189: c3                   	retq
ffff80000011118a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111190 <ptbl_split>:
; {
ffff800000111190: 55                   	pushq	%rbp
ffff800000111191: 48 89 e5             	movq	%rsp, %rbp
ffff800000111194: 41 57                	pushq	%r15
ffff800000111196: 41 56                	pushq	%r14
ffff800000111198: 41 55                	pushq	%r13
ffff80000011119a: 41 54                	pushq	%r12
ffff80000011119c: 53                   	pushq	%rbx
ffff80000011119d: 50                   	pushq	%rax
ffff80000011119e: 49 89 fd             	movq	%rdi, %r13
; 	if((*entry & PAGE_PRESENT) == 0){
ffff8000001111a1: 48 8b 07             	movq	(%rdi), %rax
ffff8000001111a4: a8 01                	testb	$1, %al
ffff8000001111a6: 75 16                	jne	0xffff8000001111be <ptbl_split+0x2e>
; 		return ptbl_alloc(entry, base, end, walker);
ffff8000001111a8: 48 b8 10 11 11 00 00 80 ff ff	movabsq	$-140737487236848, %rax # imm = 0xFFFF800000111110
ffff8000001111b2: 4c 89 ef             	movq	%r13, %rdi
ffff8000001111b5: ff d0                	callq	*%rax
ffff8000001111b7: 89 c3                	movl	%eax, %ebx
ffff8000001111b9: e9 47 01 00 00       	jmp	0xffff800000111305 <ptbl_split+0x175>
ffff8000001111be: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
; 	if((*entry & PAGE_HUGE) == 0){
ffff8000001111c3: a8 80                	testb	$-128, %al
ffff8000001111c5: 0f 84 3a 01 00 00    	je	0xffff800000111305 <ptbl_split+0x175>
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff8000001111cb: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff8000001111d5: bf 01 00 00 00       	movl	$1, %edi
ffff8000001111da: ff d0                	callq	*%rax
; 	if(new_table == NULL) return -1;
ffff8000001111dc: 48 85 c0             	testq	%rax, %rax
ffff8000001111df: 0f 84 20 01 00 00    	je	0xffff800000111305 <ptbl_split+0x175>
ffff8000001111e5: 49 be 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %r14 # imm = 0xFFFFFFFFF000
; 	new_table->pp_ref++;
ffff8000001111ef: 66 83 40 10 01       	addw	$1, 16(%rax)
; 	physaddr_t *new_table_entries = page2kva(new_table);
ffff8000001111f4: 49 bf 20 13 11 00 00 80 ff ff	movabsq	$-140737487236320, %r15 # imm = 0xFFFF800000111320
ffff8000001111fe: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000111202: 48 89 c7             	movq	%rax, %rdi
ffff800000111205: 41 ff d7             	callq	*%r15
ffff800000111208: 48 89 c3             	movq	%rax, %rbx
ffff80000011120b: 49 8b 7d 00          	movq	(%r13), %rdi
; 	void *old_data = page2kva(pa2page(PAGE_ADDR(*entry)));
ffff80000011120f: 4c 21 f7             	andq	%r14, %rdi
ffff800000111212: 48 b8 50 13 11 00 00 80 ff ff	movabsq	$-140737487236272, %rax # imm = 0xFFFF800000111350
ffff80000011121c: ff d0                	callq	*%rax
ffff80000011121e: 48 89 c7             	movq	%rax, %rdi
ffff800000111221: 41 ff d7             	callq	*%r15
ffff800000111224: 49 89 c4             	movq	%rax, %r12
ffff800000111227: 45 31 f6             	xorl	%r14d, %r14d
ffff80000011122a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		struct page_info *new_page = page_alloc(ALLOC_ZERO);
ffff800000111230: bf 01 00 00 00       	movl	$1, %edi
ffff800000111235: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff80000011123f: ff d0                	callq	*%rax
; 		if(new_page == NULL){
ffff800000111241: 48 85 c0             	testq	%rax, %rax
ffff800000111244: 0f 84 b6 00 00 00    	je	0xffff800000111300 <ptbl_split+0x170>
ffff80000011124a: 49 89 c7             	movq	%rax, %r15
; 		new_table_entries[i] = page2pa(new_page) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff80000011124d: 48 89 c7             	movq	%rax, %rdi
ffff800000111250: 48 b8 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rax # imm = 0xFFFF800000111170
ffff80000011125a: ff d0                	callq	*%rax
ffff80000011125c: 49 8b 4d 00          	movq	(%r13), %rcx
ffff800000111260: 48 ba 7f 0f 00 00 00 00 ff ff	movabsq	$-281474976706689, %rdx # imm = 0xFFFF000000000F7F
ffff80000011126a: 48 21 d1             	andq	%rdx, %rcx
ffff80000011126d: 48 09 c1             	orq	%rax, %rcx
ffff800000111270: 4a 89 0c f3          	movq	%rcx, (%rbx,%r14,8)
; 		memcpy(page2kva(new_page), old_data + i * PAGE_SIZE, PAGE_SIZE);
ffff800000111274: 4c 89 ff             	movq	%r15, %rdi
ffff800000111277: 48 b8 20 13 11 00 00 80 ff ff	movabsq	$-140737487236320, %rax # imm = 0xFFFF800000111320
ffff800000111281: ff d0                	callq	*%rax
ffff800000111283: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000111288: 48 89 c7             	movq	%rax, %rdi
ffff80000011128b: 4c 89 e6             	movq	%r12, %rsi
ffff80000011128e: 48 b8 70 04 11 00 00 80 ff ff	movabsq	$-140737487240080, %rax # imm = 0xFFFF800000110470
ffff800000111298: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff80000011129a: 49 83 c6 01          	addq	$1, %r14
ffff80000011129e: 49 81 c4 00 10 00 00 	addq	$4096, %r12             # imm = 0x1000
ffff8000001112a5: 49 81 fe 00 02 00 00 	cmpq	$512, %r14              # imm = 0x200
ffff8000001112ac: 75 82                	jne	0xffff800000111230 <ptbl_split+0xa0>
ffff8000001112ae: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
; 	page_decref(pa2page(PAGE_ADDR(*entry)));
ffff8000001112b8: 49 23 7d 00          	andq	(%r13), %rdi
ffff8000001112bc: 48 b8 50 13 11 00 00 80 ff ff	movabsq	$-140737487236272, %rax # imm = 0xFFFF800000111350
ffff8000001112c6: ff d0                	callq	*%rax
ffff8000001112c8: 48 b9 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rcx # imm = 0xFFFF80000010DCC0
ffff8000001112d2: 48 89 c7             	movq	%rax, %rdi
ffff8000001112d5: ff d1                	callq	*%rcx
ffff8000001112d7: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 	*entry = page2pa(new_table) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff8000001112db: 48 b8 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rax # imm = 0xFFFF800000111170
ffff8000001112e5: ff d0                	callq	*%rax
ffff8000001112e7: 48 b9 7f 0f 00 00 00 00 ff ff	movabsq	$-281474976706689, %rcx # imm = 0xFFFF000000000F7F
; 	*entry = page2pa(new_table) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff8000001112f1: 49 23 4d 00          	andq	(%r13), %rcx
ffff8000001112f5: 48 09 c1             	orq	%rax, %rcx
ffff8000001112f8: 49 89 4d 00          	movq	%rcx, (%r13)
ffff8000001112fc: 31 db                	xorl	%ebx, %ebx
ffff8000001112fe: eb 05                	jmp	0xffff800000111305 <ptbl_split+0x175>
ffff800000111300: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
; }
ffff800000111305: 89 d8                	movl	%ebx, %eax
ffff800000111307: 48 83 c4 08          	addq	$8, %rsp
ffff80000011130b: 5b                   	popq	%rbx
ffff80000011130c: 41 5c                	popq	%r12
ffff80000011130e: 41 5d                	popq	%r13
ffff800000111310: 41 5e                	popq	%r14
ffff800000111312: 41 5f                	popq	%r15
ffff800000111314: 5d                   	popq	%rbp
ffff800000111315: c3                   	retq
ffff800000111316: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111320 <page2kva>:
; {
ffff800000111320: 55                   	pushq	%rbp
ffff800000111321: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff800000111324: 48 b8 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rax # imm = 0xFFFF800000111170
ffff80000011132e: ff d0                	callq	*%rax
ffff800000111330: 48 b9 30 15 11 00 00 80 ff ff	movabsq	$-140737487235792, %rcx # imm = 0xFFFF800000111530
ffff80000011133a: 48 89 c7             	movq	%rax, %rdi
ffff80000011133d: ff d1                	callq	*%rcx
ffff80000011133f: 5d                   	popq	%rbp
ffff800000111340: c3                   	retq
ffff800000111341: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011134b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111350 <pa2page>:
; {
ffff800000111350: 55                   	pushq	%rbp
ffff800000111351: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000111354: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000111358: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000111362: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000111365: 73 16                	jae	0xffff80000011137d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000111367: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff800000111371: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000111375: 48 03 38             	addq	(%rax), %rdi
ffff800000111378: 48 89 f8             	movq	%rdi, %rax
ffff80000011137b: 5d                   	popq	%rbp
ffff80000011137c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000011137d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000111387: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff800000111391: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011139b: be 49 00 00 00       	movl	$73, %esi
ffff8000001113a0: 31 c0                	xorl	%eax, %eax
ffff8000001113a2: ff d1                	callq	*%rcx
ffff8000001113a4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001113ae: 66 90                	nop

ffff8000001113b0 <ptbl_merge>:
; {
ffff8000001113b0: 55                   	pushq	%rbp
ffff8000001113b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001113b4: 41 57                	pushq	%r15
ffff8000001113b6: 41 56                	pushq	%r14
ffff8000001113b8: 41 55                	pushq	%r13
ffff8000001113ba: 41 54                	pushq	%r12
ffff8000001113bc: 53                   	pushq	%rbx
ffff8000001113bd: 48 83 ec 18          	subq	$24, %rsp
; 	if(*entry & PAGE_HUGE){
ffff8000001113c1: 4c 8b 27             	movq	(%rdi), %r12
ffff8000001113c4: 31 c0                	xorl	%eax, %eax
ffff8000001113c6: 41 f6 c4 80          	testb	$-128, %r12b
ffff8000001113ca: 0f 85 41 01 00 00    	jne	0xffff800000111511 <ptbl_merge+0x161>
ffff8000001113d0: 48 bb ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rbx # imm = 0xFFFF000000000FFF
; 	physaddr_t flags = *entry & PAGE_MASK;
ffff8000001113da: 4c 21 e3             	andq	%r12, %rbx
; 	if((flags ^ PAGE_PRESENT) == 0) return 0;
ffff8000001113dd: 48 83 fb 01          	cmpq	$1, %rbx
ffff8000001113e1: 0f 84 2a 01 00 00    	je	0xffff800000111511 <ptbl_merge+0x161>
ffff8000001113e7: 49 89 fe             	movq	%rdi, %r14
ffff8000001113ea: 49 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %r15 # imm = 0xFFFFFFFFF000
ffff8000001113f4: 4d 21 fc             	andq	%r15, %r12
ffff8000001113f7: 31 c0                	xorl	%eax, %eax
ffff8000001113f9: 49 8d 8f ff 1f 00 00 	leaq	8191(%r15), %rcx
ffff800000111400: 31 d2                	xorl	%edx, %edx
ffff800000111402: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011140c: 0f 1f 40 00          	nopl	(%rax)
; 		if((table_entry & PAGE_MASK) != flags) return 0;
ffff800000111410: 49 8d 34 14          	leaq	(%r12,%rdx), %rsi
ffff800000111414: 48 21 ce             	andq	%rcx, %rsi
ffff800000111417: 48 39 de             	cmpq	%rbx, %rsi
ffff80000011141a: 0f 85 f1 00 00 00    	jne	0xffff800000111511 <ptbl_merge+0x161>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000111420: 48 83 c2 01          	addq	$1, %rdx
ffff800000111424: 48 81 fa 00 02 00 00 	cmpq	$512, %rdx              # imm = 0x200
ffff80000011142b: 75 e3                	jne	0xffff800000111410 <ptbl_merge+0x60>
; 	struct page_info *huge_page = page_alloc(ALLOC_HUGE);
ffff80000011142d: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000111437: bf 02 00 00 00       	movl	$2, %edi
ffff80000011143c: ff d0                	callq	*%rax
; 	if(huge_page == NULL) return -1;
ffff80000011143e: 48 85 c0             	testq	%rax, %rax
ffff800000111441: 0f 84 c5 00 00 00    	je	0xffff80000011150c <ptbl_merge+0x15c>
ffff800000111447: 48 89 5d c8          	movq	%rbx, -56(%rbp)
ffff80000011144b: 4c 89 75 c0          	movq	%r14, -64(%rbp)
; 	void* huge_page_addr = page2kva(huge_page);
ffff80000011144f: 48 b9 20 13 11 00 00 80 ff ff	movabsq	$-140737487236320, %rcx # imm = 0xFFFF800000111320
ffff800000111459: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011145d: 48 89 c7             	movq	%rax, %rdi
; 	void* huge_page_addr = page2kva(huge_page);
ffff800000111460: ff d1                	callq	*%rcx
ffff800000111462: 48 89 c3             	movq	%rax, %rbx
ffff800000111465: 45 31 f6             	xorl	%r14d, %r14d
ffff800000111468: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		struct page_info *entry_page = pa2page(PAGE_ADDR(table_entry));
ffff800000111470: 4b 8d 3c 34          	leaq	(%r12,%r14), %rdi
ffff800000111474: 4c 21 ff             	andq	%r15, %rdi
ffff800000111477: 48 b8 50 13 11 00 00 80 ff ff	movabsq	$-140737487236272, %rax # imm = 0xFFFF800000111350
ffff800000111481: ff d0                	callq	*%rax
ffff800000111483: 49 89 c5             	movq	%rax, %r13
; 		memcpy(page2kva(entry_page), huge_page_addr + i * PAGE_SIZE, PAGE_SIZE);
ffff800000111486: 48 89 c7             	movq	%rax, %rdi
ffff800000111489: 48 b8 20 13 11 00 00 80 ff ff	movabsq	$-140737487236320, %rax # imm = 0xFFFF800000111320
ffff800000111493: ff d0                	callq	*%rax
ffff800000111495: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011149a: 48 89 c7             	movq	%rax, %rdi
ffff80000011149d: 48 89 de             	movq	%rbx, %rsi
ffff8000001114a0: 48 b8 70 04 11 00 00 80 ff ff	movabsq	$-140737487240080, %rax # imm = 0xFFFF800000110470
ffff8000001114aa: ff d0                	callq	*%rax
; 		page_decref(entry_page);
ffff8000001114ac: 4c 89 ef             	movq	%r13, %rdi
ffff8000001114af: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff8000001114b9: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff8000001114bb: 49 83 c6 01          	addq	$1, %r14
ffff8000001114bf: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff8000001114c6: 49 81 fe 00 02 00 00 	cmpq	$512, %r14              # imm = 0x200
ffff8000001114cd: 75 a1                	jne	0xffff800000111470 <ptbl_merge+0xc0>
; 	struct page_info *table_page = pa2page(table);
ffff8000001114cf: 4c 89 e7             	movq	%r12, %rdi
ffff8000001114d2: 48 b8 50 13 11 00 00 80 ff ff	movabsq	$-140737487236272, %rax # imm = 0xFFFF800000111350
ffff8000001114dc: ff d0                	callq	*%rax
; 	page_decref(table_page);
ffff8000001114de: 48 89 c7             	movq	%rax, %rdi
ffff8000001114e1: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff8000001114eb: ff d0                	callq	*%rax
; 	*entry = page2pa(huge_page) | flags;
ffff8000001114ed: 48 b8 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rax # imm = 0xFFFF800000111170
ffff8000001114f7: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff8000001114fb: ff d0                	callq	*%rax
ffff8000001114fd: 48 0b 45 c8          	orq	-56(%rbp), %rax
ffff800000111501: 48 8b 4d c0          	movq	-64(%rbp), %rcx
ffff800000111505: 48 89 01             	movq	%rax, (%rcx)
ffff800000111508: 31 c0                	xorl	%eax, %eax
ffff80000011150a: eb 05                	jmp	0xffff800000111511 <ptbl_merge+0x161>
ffff80000011150c: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; }
ffff800000111511: 48 83 c4 18          	addq	$24, %rsp
ffff800000111515: 5b                   	popq	%rbx
ffff800000111516: 41 5c                	popq	%r12
ffff800000111518: 41 5d                	popq	%r13
ffff80000011151a: 41 5e                	popq	%r14
ffff80000011151c: 41 5f                	popq	%r15
ffff80000011151e: 5d                   	popq	%rbp
ffff80000011151f: c3                   	retq

ffff800000111520 <ptbl_free>:
; {
ffff800000111520: 55                   	pushq	%rbp
ffff800000111521: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000111524: 31 c0                	xorl	%eax, %eax
ffff800000111526: 5d                   	popq	%rbp
ffff800000111527: c3                   	retq
ffff800000111528: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111530 <_kaddr>:
; {
ffff800000111530: 55                   	pushq	%rbp
ffff800000111531: 48 89 e5             	movq	%rsp, %rbp
ffff800000111534: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000111537: 48 89 f9             	movq	%rdi, %rcx
ffff80000011153a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000011153e: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff800000111548: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000011154b: 73 0f                	jae	0xffff80000011155c <_kaddr+0x2c>
ffff80000011154d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff800000111557: 48 01 c8             	addq	%rcx, %rax
ffff80000011155a: 5d                   	popq	%rbp
ffff80000011155b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000011155c: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000111566: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff800000111570: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000011157a: be 50 00 00 00       	movl	$80, %esi
ffff80000011157f: 48 89 c1             	movq	%rax, %rcx
ffff800000111582: 31 c0                	xorl	%eax, %eax
ffff800000111584: 41 ff d0             	callq	*%r8
ffff800000111587: cc                   	int3
ffff800000111588: cc                   	int3
ffff800000111589: cc                   	int3
ffff80000011158a: cc                   	int3
ffff80000011158b: cc                   	int3
ffff80000011158c: cc                   	int3
ffff80000011158d: cc                   	int3
ffff80000011158e: cc                   	int3
ffff80000011158f: cc                   	int3

ffff800000111590 <unmap_page_range>:
; {
ffff800000111590: 55                   	pushq	%rbp
ffff800000111591: 48 89 e5             	movq	%rsp, %rbp
ffff800000111594: 48 83 ec 60          	subq	$96, %rsp
; 	struct remove_info info = {
ffff800000111598: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011159c: 48 89 75 f8          	movq	%rsi, -8(%rbp)
; 	struct page_walker walker = {
ffff8000001115a0: 48 b8 20 16 11 00 00 80 ff ff	movabsq	$-140737487235552, %rax # imm = 0xFFFF800000111620
ffff8000001115aa: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff8000001115ae: 48 b8 40 16 11 00 00 80 ff ff	movabsq	$-140737487235520, %rax # imm = 0xFFFF800000111640
ffff8000001115b8: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001115bc: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001115c4: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff8000001115cc: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff8000001115d4: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff8000001115dc: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001115e4: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff8000001115ec: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff8000001115f4: 48 8d 45 f0          	leaq	-16(%rbp), %rax
ffff8000001115f8: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	walk_page_range(pml4, va, va + size, &walker);
ffff8000001115fc: 48 01 f2             	addq	%rsi, %rdx
ffff8000001115ff: 48 b8 c0 17 11 00 00 80 ff ff	movabsq	$-140737487235136, %rax # imm = 0xFFFF8000001117C0
ffff800000111609: 48 8d 4d a0          	leaq	-96(%rbp), %rcx
ffff80000011160d: ff d0                	callq	*%rax
; }
ffff80000011160f: 48 83 c4 60          	addq	$96, %rsp
ffff800000111613: 5d                   	popq	%rbp
ffff800000111614: c3                   	retq
ffff800000111615: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011161f: 90                   	nop

ffff800000111620 <remove_pte>:
; {
ffff800000111620: 55                   	pushq	%rbp
ffff800000111621: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff800000111624: f6 07 01             	testb	$1, (%rdi)
ffff800000111627: 74 10                	je	0xffff800000111639 <remove_pte+0x19>
; 	struct remove_info *info = walker->udata;
ffff800000111629: 48 8b 71 48          	movq	72(%rcx), %rsi
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff80000011162d: 48 b8 a0 16 11 00 00 80 ff ff	movabsq	$-140737487235424, %rax # imm = 0xFFFF8000001116A0
ffff800000111637: ff d0                	callq	*%rax
; 	return 0;
ffff800000111639: 31 c0                	xorl	%eax, %eax
ffff80000011163b: 5d                   	popq	%rbp
ffff80000011163c: c3                   	retq
ffff80000011163d: 0f 1f 00             	nopl	(%rax)

ffff800000111640 <remove_pde>:
; {
ffff800000111640: 55                   	pushq	%rbp
ffff800000111641: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff800000111644: 8b 07                	movl	(%rdi), %eax
ffff800000111646: f7 d0                	notl	%eax
ffff800000111648: a8 81                	testb	$-127, %al
ffff80000011164a: 75 10                	jne	0xffff80000011165c <remove_pde+0x1c>
; 	struct remove_info *info = walker->udata;
ffff80000011164c: 48 8b 71 48          	movq	72(%rcx), %rsi
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff800000111650: 48 b8 a0 16 11 00 00 80 ff ff	movabsq	$-140737487235424, %rax # imm = 0xFFFF8000001116A0
ffff80000011165a: ff d0                	callq	*%rax
; 	return 0;
ffff80000011165c: 31 c0                	xorl	%eax, %eax
ffff80000011165e: 5d                   	popq	%rbp
ffff80000011165f: c3                   	retq

ffff800000111660 <unmap_user_pages>:
; {
ffff800000111660: 55                   	pushq	%rbp
ffff800000111661: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, 0, USER_LIM);
ffff800000111664: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff80000011166e: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff800000111678: 31 f6                	xorl	%esi, %esi
ffff80000011167a: ff d0                	callq	*%rax
; }
ffff80000011167c: 5d                   	popq	%rbp
ffff80000011167d: c3                   	retq
ffff80000011167e: 66 90                	nop

ffff800000111680 <page_remove>:
; {
ffff800000111680: 55                   	pushq	%rbp
ffff800000111681: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, va, PAGE_SIZE);
ffff800000111684: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff80000011168e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000111693: ff d0                	callq	*%rax
; }
ffff800000111695: 5d                   	popq	%rbp
ffff800000111696: c3                   	retq
ffff800000111697: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001116a0 <remove_page>:
; static void remove_page(physaddr_t *entry, struct remove_info *info){
ffff8000001116a0: 55                   	pushq	%rbp
ffff8000001116a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001116a4: 41 57                	pushq	%r15
ffff8000001116a6: 41 56                	pushq	%r14
ffff8000001116a8: 53                   	pushq	%rbx
ffff8000001116a9: 50                   	pushq	%rax
ffff8000001116aa: 49 89 f7             	movq	%rsi, %r15
ffff8000001116ad: 49 89 fe             	movq	%rdi, %r14
; 	struct page_info *page = pa2page(get_entry_pa(entry));
ffff8000001116b0: 48 b8 70 17 11 00 00 80 ff ff	movabsq	$-140737487235216, %rax # imm = 0xFFFF800000111770
ffff8000001116ba: ff d0                	callq	*%rax
ffff8000001116bc: 48 b9 10 17 11 00 00 80 ff ff	movabsq	$-140737487235312, %rcx # imm = 0xFFFF800000111710
ffff8000001116c6: 48 89 c7             	movq	%rax, %rdi
ffff8000001116c9: ff d1                	callq	*%rcx
ffff8000001116cb: 48 89 c3             	movq	%rax, %rbx
; 	page_decref(page);
ffff8000001116ce: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff8000001116d8: 48 89 df             	movq	%rbx, %rdi
ffff8000001116db: ff d0                	callq	*%rax
; 	if(page->pp_free) *entry ^= PAGE_PRESENT;
ffff8000001116dd: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff8000001116e1: 79 04                	jns	0xffff8000001116e7 <remove_page+0x47>
ffff8000001116e3: 41 80 36 01          	xorb	$1, (%r14)
; 	tlb_invalidate(info->pml4, info->va); //but invalidate tlb as virtual adress points to nothing now!
ffff8000001116e7: 49 8b 3f             	movq	(%r15), %rdi
ffff8000001116ea: 49 8b 77 08          	movq	8(%r15), %rsi
ffff8000001116ee: 48 b8 90 17 11 00 00 80 ff ff	movabsq	$-140737487235184, %rax # imm = 0xFFFF800000111790
ffff8000001116f8: ff d0                	callq	*%rax
; }
ffff8000001116fa: 48 83 c4 08          	addq	$8, %rsp
ffff8000001116fe: 5b                   	popq	%rbx
ffff8000001116ff: 41 5e                	popq	%r14
ffff800000111701: 41 5f                	popq	%r15
ffff800000111703: 5d                   	popq	%rbp
ffff800000111704: c3                   	retq
ffff800000111705: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011170f: 90                   	nop

ffff800000111710 <pa2page>:
; {
ffff800000111710: 55                   	pushq	%rbp
ffff800000111711: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000111714: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000111718: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000111722: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000111725: 73 16                	jae	0xffff80000011173d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000111727: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff800000111731: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000111735: 48 03 38             	addq	(%rax), %rdi
ffff800000111738: 48 89 f8             	movq	%rdi, %rax
ffff80000011173b: 5d                   	popq	%rbp
ffff80000011173c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000011173d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000111747: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff800000111751: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011175b: be 49 00 00 00       	movl	$73, %esi
ffff800000111760: 31 c0                	xorl	%eax, %eax
ffff800000111762: ff d1                	callq	*%rcx
ffff800000111764: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011176e: 66 90                	nop

ffff800000111770 <get_entry_pa>:
; static inline physaddr_t get_entry_pa(physaddr_t *entry){
ffff800000111770: 55                   	pushq	%rbp
ffff800000111771: 48 89 e5             	movq	%rsp, %rbp
ffff800000111774: 48 b8 00 f0 ff ff ff ff ff 7f	movabsq	$9223372036854771712, %rax # imm = 0x7FFFFFFFFFFFF000
; 	return *entry & ~PHYS_ADD_MASK;
ffff80000011177e: 48 23 07             	andq	(%rdi), %rax
ffff800000111781: 5d                   	popq	%rbp
ffff800000111782: c3                   	retq
ffff800000111783: cc                   	int3
ffff800000111784: cc                   	int3
ffff800000111785: cc                   	int3
ffff800000111786: cc                   	int3
ffff800000111787: cc                   	int3
ffff800000111788: cc                   	int3
ffff800000111789: cc                   	int3
ffff80000011178a: cc                   	int3
ffff80000011178b: cc                   	int3
ffff80000011178c: cc                   	int3
ffff80000011178d: cc                   	int3
ffff80000011178e: cc                   	int3
ffff80000011178f: cc                   	int3

ffff800000111790 <tlb_invalidate>:
; {
ffff800000111790: 55                   	pushq	%rbp
ffff800000111791: 48 89 e5             	movq	%rsp, %rbp
ffff800000111794: 48 89 f7             	movq	%rsi, %rdi
; 	flush_page(va);
ffff800000111797: 48 b8 b0 17 11 00 00 80 ff ff	movabsq	$-140737487235152, %rax # imm = 0xFFFF8000001117B0
ffff8000001117a1: ff d0                	callq	*%rax
; }
ffff8000001117a3: 5d                   	popq	%rbp
ffff8000001117a4: c3                   	retq
ffff8000001117a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001117af: 90                   	nop

ffff8000001117b0 <flush_page>:
; {
ffff8000001117b0: 55                   	pushq	%rbp
ffff8000001117b1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("invlpg (%0)" :: "r" (addr) : "memory");
ffff8000001117b4: 0f 01 3f             	invlpg	(%rdi)
; }
ffff8000001117b7: 5d                   	popq	%rbp
ffff8000001117b8: c3                   	retq
ffff8000001117b9: cc                   	int3
ffff8000001117ba: cc                   	int3
ffff8000001117bb: cc                   	int3
ffff8000001117bc: cc                   	int3
ffff8000001117bd: cc                   	int3
ffff8000001117be: cc                   	int3
ffff8000001117bf: cc                   	int3

ffff8000001117c0 <walk_page_range>:
; {
ffff8000001117c0: 55                   	pushq	%rbp
ffff8000001117c1: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff8000001117c4: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 		ROUNDUP((uintptr_t)end, PAGE_SIZE) - 1, walker);
ffff8000001117cb: 48 81 c2 ff 0f 00 00 	addq	$4095, %rdx             # imm = 0xFFF
ffff8000001117d2: 48 81 e2 00 f0 ff ff 	andq	$-4096, %rdx            # imm = 0xF000
ffff8000001117d9: 48 83 c2 ff          	addq	$-1, %rdx
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff8000001117dd: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff8000001117e7: ff d0                	callq	*%rax
ffff8000001117e9: 5d                   	popq	%rbp
ffff8000001117ea: c3                   	retq
ffff8000001117eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001117f0 <pml4_walk_range>:
; {
ffff8000001117f0: 55                   	pushq	%rbp
ffff8000001117f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001117f4: 53                   	pushq	%rbx
ffff8000001117f5: 50                   	pushq	%rax
ffff8000001117f6: 48 89 c8             	movq	%rcx, %rax
; 	return __walk_range(pml4, base, end, walker->pml4e_callback, walker->pml4e_unmap, pdpt_walk_range, pml4_index, pml4_end, walker, "pml4");
ffff8000001117f9: 48 8b 49 18          	movq	24(%rcx), %rcx
ffff8000001117fd: 4c 8b 40 38          	movq	56(%rax), %r8
ffff800000111801: 48 83 ec 08          	subq	$8, %rsp
ffff800000111805: 49 ba f0 1a 11 00 00 80 ff ff	movabsq	$-140737487234320, %r10 # imm = 0xFFFF800000111AF0
ffff80000011180f: 49 bb d0 1a 11 00 00 80 ff ff	movabsq	$-140737487234352, %r11 # imm = 0xFFFF800000111AD0
ffff800000111819: 49 b9 80 1a 11 00 00 80 ff ff	movabsq	$-140737487234432, %r9 # imm = 0xFFFF800000111A80
ffff800000111823: 48 bb c0 18 11 00 00 80 ff ff	movabsq	$-140737487234880, %rbx # imm = 0xFFFF8000001118C0
ffff80000011182d: 50                   	pushq	%rax
ffff80000011182e: 41 52                	pushq	%r10
ffff800000111830: 41 53                	pushq	%r11
ffff800000111832: ff d3                	callq	*%rbx
ffff800000111834: 48 83 c4 28          	addq	$40, %rsp
ffff800000111838: 5b                   	popq	%rbx
ffff800000111839: 5d                   	popq	%rbp
ffff80000011183a: c3                   	retq
ffff80000011183b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111840 <walk_all_pages>:
; {
ffff800000111840: 55                   	pushq	%rbp
ffff800000111841: 48 89 e5             	movq	%rsp, %rbp
ffff800000111844: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
ffff800000111847: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff800000111851: 31 f6                	xorl	%esi, %esi
ffff800000111853: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff80000011185a: ff d0                	callq	*%rax
ffff80000011185c: 5d                   	popq	%rbp
ffff80000011185d: c3                   	retq
ffff80000011185e: 66 90                	nop

ffff800000111860 <walk_user_pages>:
; {
ffff800000111860: 55                   	pushq	%rbp
ffff800000111861: 48 89 e5             	movq	%rsp, %rbp
ffff800000111864: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, 0, USER_LIM, walker);
ffff800000111867: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff800000111871: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff80000011187b: 31 f6                	xorl	%esi, %esi
ffff80000011187d: ff d0                	callq	*%rax
ffff80000011187f: 5d                   	popq	%rbp
ffff800000111880: c3                   	retq
ffff800000111881: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011188b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111890 <walk_kernel_pages>:
; {
ffff800000111890: 55                   	pushq	%rbp
ffff800000111891: 48 89 e5             	movq	%rsp, %rbp
ffff800000111894: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
ffff800000111897: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff8000001118a1: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff8000001118ab: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff8000001118b2: ff d0                	callq	*%rax
ffff8000001118b4: 5d                   	popq	%rbp
ffff8000001118b5: c3                   	retq
ffff8000001118b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001118c0 <__walk_range>:
; 	walkfn_t walkfn, int (*ptbl_index)(uintptr_t), uintptr_t (*ptbl_end)(uintptr_t), struct page_walker *walker, char* tblName){
ffff8000001118c0: 55                   	pushq	%rbp
ffff8000001118c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001118c4: 41 57                	pushq	%r15
ffff8000001118c6: 41 56                	pushq	%r14
ffff8000001118c8: 41 55                	pushq	%r13
ffff8000001118ca: 41 54                	pushq	%r12
ffff8000001118cc: 53                   	pushq	%rbx
ffff8000001118cd: 48 83 ec 38          	subq	$56, %rsp
ffff8000001118d1: 4c 89 4d b8          	movq	%r9, -72(%rbp)
ffff8000001118d5: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff8000001118d9: 48 89 4d a8          	movq	%rcx, -88(%rbp)
ffff8000001118dd: 48 89 d3             	movq	%rdx, %rbx
ffff8000001118e0: 49 89 f5             	movq	%rsi, %r13
ffff8000001118e3: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff8000001118e7: 4c 8b 65 10          	movq	16(%rbp), %r12
; 	uintptr_t page_entry_end = sign_extend(ptbl_end(base));
ffff8000001118eb: 48 89 f7             	movq	%rsi, %rdi
ffff8000001118ee: ff 55 18             	callq	*24(%rbp)
ffff8000001118f1: 49 89 c7             	movq	%rax, %r15
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff8000001118f4: 4c 89 ef             	movq	%r13, %rdi
ffff8000001118f7: 41 ff d4             	callq	*%r12
ffff8000001118fa: 41 89 c6             	movl	%eax, %r14d
ffff8000001118fd: 48 89 5d b0          	movq	%rbx, -80(%rbp)
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff800000111901: 48 89 df             	movq	%rbx, %rdi
ffff800000111904: 41 ff d4             	callq	*%r12
ffff800000111907: 31 c9                	xorl	%ecx, %ecx
ffff800000111909: 41 39 c6             	cmpl	%eax, %r14d
ffff80000011190c: 0f 8f 57 01 00 00    	jg	0xffff800000111a69 <__walk_range+0x1a9>
; 	uintptr_t page_entry_end = sign_extend(ptbl_end(base));
ffff800000111912: 48 bb 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %rbx # imm = 0xFFFF800000111B10
ffff80000011191c: 4c 89 ff             	movq	%r15, %rdi
ffff80000011191f: ff d3                	callq	*%rbx
ffff800000111921: 49 89 c7             	movq	%rax, %r15
; 	uintptr_t page_entry_base = sign_extend(base);
ffff800000111924: 4c 89 ef             	movq	%r13, %rdi
ffff800000111927: ff d3                	callq	*%rbx
ffff800000111929: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff80000011192d: 49 63 de             	movslq	%r14d, %rbx
ffff800000111930: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000111934: 4c 8d 34 d8          	leaq	(%rax,%rbx,8), %r14
ffff800000111938: 48 83 c3 ff          	addq	$-1, %rbx
ffff80000011193c: 0f 1f 40 00          	nopl	(%rax)
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000111940: 4d 8b 2e             	movq	(%r14), %r13
ffff800000111943: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff800000111947: 48 85 c0             	testq	%rax, %rax
ffff80000011194a: 4c 8b 65 20          	movq	32(%rbp), %r12
; 		if(ptbl_callback) {
ffff80000011194e: 74 0f                	je	0xffff80000011195f <__walk_range+0x9f>
; 			ptbl_callback(entry, page_entry_base, page_entry_end, walker);
ffff800000111950: 4c 89 f7             	movq	%r14, %rdi
ffff800000111953: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111957: 4c 89 fa             	movq	%r15, %rdx
ffff80000011195a: 4c 89 e1             	movq	%r12, %rcx
ffff80000011195d: ff d0                	callq	*%rax
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff80000011195f: 49 8b 44 24 40       	movq	64(%r12), %rax
ffff800000111964: 48 85 c0             	testq	%rax, %rax
ffff800000111967: 4c 89 e1             	movq	%r12, %rcx
ffff80000011196a: 74 1f                	je	0xffff80000011198b <__walk_range+0xcb>
ffff80000011196c: 44 89 ea             	movl	%r13d, %edx
ffff80000011196f: 83 e2 01             	andl	$1, %edx
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111972: 48 85 d2             	testq	%rdx, %rdx
ffff800000111975: 75 14                	jne	0xffff80000011198b <__walk_range+0xcb>
ffff800000111977: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff80000011197b: 4c 89 fe             	movq	%r15, %rsi
ffff80000011197e: 48 89 ca             	movq	%rcx, %rdx
ffff800000111981: ff d0                	callq	*%rax
ffff800000111983: 48 8b 4d 20          	movq	32(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111987: 85 c0                	testl	%eax, %eax
ffff800000111989: 78 7c                	js	0xffff800000111a07 <__walk_range+0x147>
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff80000011198b: 41 f6 c5 01          	testb	$1, %r13b
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff80000011198f: 74 22                	je	0xffff8000001119b3 <__walk_range+0xf3>
ffff800000111991: 49 8b 3e             	movq	(%r14), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111994: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff80000011199e: 48 21 c7             	andq	%rax, %rdi
ffff8000001119a1: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff8000001119a5: 4c 89 fa             	movq	%r15, %rdx
ffff8000001119a8: ff 55 b8             	callq	*-72(%rbp)
ffff8000001119ab: 48 8b 4d 20          	movq	32(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff8000001119af: 85 c0                	testl	%eax, %eax
ffff8000001119b1: 78 63                	js	0xffff800000111a16 <__walk_range+0x156>
ffff8000001119b3: 48 83 7d c0 00       	cmpq	$0, -64(%rbp)
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff8000001119b8: 74 1e                	je	0xffff8000001119d8 <__walk_range+0x118>
ffff8000001119ba: 41 83 e5 01          	andl	$1, %r13d
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff8000001119be: 4d 85 ed             	testq	%r13, %r13
ffff8000001119c1: 74 15                	je	0xffff8000001119d8 <__walk_range+0x118>
ffff8000001119c3: 4c 89 f7             	movq	%r14, %rdi
ffff8000001119c6: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff8000001119ca: 4c 89 fa             	movq	%r15, %rdx
ffff8000001119cd: ff 55 c0             	callq	*-64(%rbp)
ffff8000001119d0: 48 8b 4d 20          	movq	32(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff8000001119d4: 85 c0                	testl	%eax, %eax
ffff8000001119d6: 78 5a                	js	0xffff800000111a32 <__walk_range+0x172>
; 		page_entry_base = sign_extend(page_entry_end + 1);
ffff8000001119d8: 49 83 c7 01          	addq	$1, %r15
ffff8000001119dc: 4c 89 ff             	movq	%r15, %rdi
ffff8000001119df: 49 bf 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %r15 # imm = 0xFFFF800000111B10
ffff8000001119e9: 41 ff d7             	callq	*%r15
ffff8000001119ec: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page_entry_end = sign_extend(ptbl_end(page_entry_base));
ffff8000001119f0: 48 89 c7             	movq	%rax, %rdi
ffff8000001119f3: ff 55 18             	callq	*24(%rbp)
ffff8000001119f6: 48 89 c7             	movq	%rax, %rdi
ffff8000001119f9: 41 ff d7             	callq	*%r15
ffff8000001119fc: 49 89 c7             	movq	%rax, %r15
ffff8000001119ff: b0 01                	movb	$1, %al
ffff800000111a01: 84 c0                	testb	%al, %al
ffff800000111a03: 75 43                	jne	0xffff800000111a48 <__walk_range+0x188>
ffff800000111a05: eb 5f                	jmp	0xffff800000111a66 <__walk_range+0x1a6>
ffff800000111a07: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111a0b: 4c 89 fe             	movq	%r15, %rsi
ffff800000111a0e: 48 89 ca             	movq	%rcx, %rdx
ffff800000111a11: ff 51 40             	callq	*64(%rcx)
ffff800000111a14: eb 29                	jmp	0xffff800000111a3f <__walk_range+0x17f>
ffff800000111a16: 49 8b 3e             	movq	(%r14), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111a19: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000111a23: 48 21 c7             	andq	%rax, %rdi
ffff800000111a26: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111a2a: 4c 89 fa             	movq	%r15, %rdx
ffff800000111a2d: ff 55 b8             	callq	*-72(%rbp)
ffff800000111a30: eb 0d                	jmp	0xffff800000111a3f <__walk_range+0x17f>
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111a32: 4c 89 f7             	movq	%r14, %rdi
ffff800000111a35: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111a39: 4c 89 fa             	movq	%r15, %rdx
ffff800000111a3c: ff 55 c0             	callq	*-64(%rbp)
ffff800000111a3f: 89 45 c8             	movl	%eax, -56(%rbp)
ffff800000111a42: 31 c0                	xorl	%eax, %eax
ffff800000111a44: 84 c0                	testb	%al, %al
ffff800000111a46: 74 1e                	je	0xffff800000111a66 <__walk_range+0x1a6>
ffff800000111a48: 48 8b 7d b0          	movq	-80(%rbp), %rdi
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff800000111a4c: ff 55 10             	callq	*16(%rbp)
ffff800000111a4f: 48 98                	cltq
ffff800000111a51: 48 83 c3 01          	addq	$1, %rbx
ffff800000111a55: 49 83 c6 08          	addq	$8, %r14
ffff800000111a59: 48 39 c3             	cmpq	%rax, %rbx
ffff800000111a5c: 0f 8c de fe ff ff    	jl	0xffff800000111940 <__walk_range+0x80>
ffff800000111a62: 31 c9                	xorl	%ecx, %ecx
ffff800000111a64: eb 03                	jmp	0xffff800000111a69 <__walk_range+0x1a9>
ffff800000111a66: 8b 4d c8             	movl	-56(%rbp), %ecx
; }
ffff800000111a69: 89 c8                	movl	%ecx, %eax
ffff800000111a6b: 48 83 c4 38          	addq	$56, %rsp
ffff800000111a6f: 5b                   	popq	%rbx
ffff800000111a70: 41 5c                	popq	%r12
ffff800000111a72: 41 5d                	popq	%r13
ffff800000111a74: 41 5e                	popq	%r14
ffff800000111a76: 41 5f                	popq	%r15
ffff800000111a78: 5d                   	popq	%rbp
ffff800000111a79: c3                   	retq
ffff800000111a7a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111a80 <pdpt_walk_range>:
; {
ffff800000111a80: 55                   	pushq	%rbp
ffff800000111a81: 48 89 e5             	movq	%rsp, %rbp
ffff800000111a84: 53                   	pushq	%rbx
ffff800000111a85: 50                   	pushq	%rax
ffff800000111a86: 48 89 c8             	movq	%rcx, %rax
; 	return __walk_range(pdpt, base, end, walker->pdpte_callback, walker->pdpte_unmap, pdir_walk_range, pdpt_index, pdpt_end, walker, "pdpt");
ffff800000111a89: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff800000111a8d: 4c 8b 40 30          	movq	48(%rax), %r8
ffff800000111a91: 48 83 ec 08          	subq	$8, %rsp
ffff800000111a95: 49 ba 40 1d 11 00 00 80 ff ff	movabsq	$-140737487233728, %r10 # imm = 0xFFFF800000111D40
ffff800000111a9f: 49 bb 20 1d 11 00 00 80 ff ff	movabsq	$-140737487233760, %r11 # imm = 0xFFFF800000111D20
ffff800000111aa9: 49 b9 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %r9 # imm = 0xFFFF800000111B40
ffff800000111ab3: 48 bb c0 18 11 00 00 80 ff ff	movabsq	$-140737487234880, %rbx # imm = 0xFFFF8000001118C0
ffff800000111abd: 50                   	pushq	%rax
ffff800000111abe: 41 52                	pushq	%r10
ffff800000111ac0: 41 53                	pushq	%r11
ffff800000111ac2: ff d3                	callq	*%rbx
ffff800000111ac4: 48 83 c4 28          	addq	$40, %rsp
ffff800000111ac8: 5b                   	popq	%rbx
ffff800000111ac9: 5d                   	popq	%rbp
ffff800000111aca: c3                   	retq
ffff800000111acb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111ad0 <pml4_index>:
; static inline int pml4_index(uintptr_t addr){return PML4_INDEX(addr);}
ffff800000111ad0: 55                   	pushq	%rbp
ffff800000111ad1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111ad4: 48 89 f8             	movq	%rdi, %rax
ffff800000111ad7: 48 c1 e8 27          	shrq	$39, %rax
ffff800000111adb: 25 ff 01 00 00       	andl	$511, %eax              # imm = 0x1FF
ffff800000111ae0: 5d                   	popq	%rbp
ffff800000111ae1: c3                   	retq
ffff800000111ae2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111aec: 0f 1f 40 00          	nopl	(%rax)

ffff800000111af0 <pml4_end>:
; {
ffff800000111af0: 55                   	pushq	%rbp
ffff800000111af1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111af4: 48 b8 ff ff ff ff 7f 00 00 00	movabsq	$549755813887, %rax # imm = 0x7FFFFFFFFF
; 	return addr | (PDPT_SPAN - 1);
ffff800000111afe: 48 09 f8             	orq	%rdi, %rax
ffff800000111b01: 5d                   	popq	%rbp
ffff800000111b02: c3                   	retq
ffff800000111b03: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111b0d: 0f 1f 00             	nopl	(%rax)

ffff800000111b10 <sign_extend>:
; {
ffff800000111b10: 55                   	pushq	%rbp
ffff800000111b11: 48 89 e5             	movq	%rsp, %rbp
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff800000111b14: 48 89 f9             	movq	%rdi, %rcx
ffff800000111b17: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000111b1b: 48 b8 00 00 00 00 00 00 ff ff	movabsq	$-281474976710656, %rax # imm = 0xFFFF000000000000
ffff800000111b25: 48 09 f8             	orq	%rdi, %rax
ffff800000111b28: 48 85 c9             	testq	%rcx, %rcx
ffff800000111b2b: 48 0f 44 c7          	cmoveq	%rdi, %rax
ffff800000111b2f: 5d                   	popq	%rbp
ffff800000111b30: c3                   	retq
ffff800000111b31: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111b3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111b40 <pdir_walk_range>:
; {
ffff800000111b40: 55                   	pushq	%rbp
ffff800000111b41: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b44: 41 57                	pushq	%r15
ffff800000111b46: 41 56                	pushq	%r14
ffff800000111b48: 41 55                	pushq	%r13
ffff800000111b4a: 41 54                	pushq	%r12
ffff800000111b4c: 53                   	pushq	%rbx
ffff800000111b4d: 48 83 ec 18          	subq	$24, %rsp
ffff800000111b51: 49 89 d4             	movq	%rdx, %r12
ffff800000111b54: 49 89 f5             	movq	%rsi, %r13
; 	for(int i = PAGE_DIR_INDEX(base); i <= PAGE_DIR_INDEX(end); i++){
ffff800000111b57: 44 89 eb             	movl	%r13d, %ebx
ffff800000111b5a: c1 eb 15             	shrl	$21, %ebx
ffff800000111b5d: 81 e3 ff 01 00 00    	andl	$511, %ebx              # imm = 0x1FF
ffff800000111b63: 41 c1 ec 15          	shrl	$21, %r12d
ffff800000111b67: 41 81 e4 ff 01 00 00 	andl	$511, %r12d             # imm = 0x1FF
ffff800000111b6e: 31 c0                	xorl	%eax, %eax
; 	for(int i = PAGE_DIR_INDEX(base); i <= PAGE_DIR_INDEX(end); i++){
ffff800000111b70: 49 29 dc             	subq	%rbx, %r12
ffff800000111b73: 0f 82 95 01 00 00    	jb	0xffff800000111d0e <pdir_walk_range+0x1ce>
ffff800000111b79: 49 89 ce             	movq	%rcx, %r14
; 	uintptr_t page_entry_end = sign_extend(pdir_end(base));
ffff800000111b7c: 48 b8 50 1d 11 00 00 80 ff ff	movabsq	$-140737487233712, %rax # imm = 0xFFFF800000111D50
ffff800000111b86: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff800000111b8a: 4c 89 ef             	movq	%r13, %rdi
ffff800000111b8d: ff d0                	callq	*%rax
ffff800000111b8f: 49 bf 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %r15 # imm = 0xFFFF800000111B10
ffff800000111b99: 48 89 c7             	movq	%rax, %rdi
ffff800000111b9c: 41 ff d7             	callq	*%r15
ffff800000111b9f: 4c 89 f9             	movq	%r15, %rcx
ffff800000111ba2: 49 89 c7             	movq	%rax, %r15
; 	uintptr_t page_entry_base = sign_extend(base);
ffff800000111ba5: 4c 89 ef             	movq	%r13, %rdi
ffff800000111ba8: ff d1                	callq	*%rcx
ffff800000111baa: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for(int i = PAGE_DIR_INDEX(base); i <= PAGE_DIR_INDEX(end); i++){
ffff800000111bae: 49 83 c4 01          	addq	$1, %r12
ffff800000111bb2: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000111bb6: 48 8d 1c d8          	leaq	(%rax,%rbx,8), %rbx
ffff800000111bba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000111bc0: 4c 8b 2b             	movq	(%rbx), %r13
; 		if(walker->pde_callback){
ffff800000111bc3: 49 8b 46 08          	movq	8(%r14), %rax
ffff800000111bc7: 48 85 c0             	testq	%rax, %rax
ffff800000111bca: 74 0f                	je	0xffff800000111bdb <pdir_walk_range+0x9b>
; 			walker->pde_callback(entry, page_entry_base, page_entry_end, walker);
ffff800000111bcc: 48 89 df             	movq	%rbx, %rdi
ffff800000111bcf: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111bd3: 4c 89 fa             	movq	%r15, %rdx
ffff800000111bd6: 4c 89 f1             	movq	%r14, %rcx
ffff800000111bd9: ff d0                	callq	*%rax
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pde_unmap && isPresent, walker->pde_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111bdb: 49 8b 46 28          	movq	40(%r14), %rax
ffff800000111bdf: 48 85 c0             	testq	%rax, %rax
ffff800000111be2: 74 22                	je	0xffff800000111c06 <pdir_walk_range+0xc6>
ffff800000111be4: 44 89 e9             	movl	%r13d, %ecx
ffff800000111be7: 83 e1 01             	andl	$1, %ecx
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pde_unmap && isPresent, walker->pde_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111bea: 48 85 c9             	testq	%rcx, %rcx
ffff800000111bed: 74 17                	je	0xffff800000111c06 <pdir_walk_range+0xc6>
ffff800000111bef: 48 89 df             	movq	%rbx, %rdi
ffff800000111bf2: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111bf6: 4c 89 fa             	movq	%r15, %rdx
ffff800000111bf9: 4c 89 f1             	movq	%r14, %rcx
ffff800000111bfc: ff d0                	callq	*%rax
ffff800000111bfe: 85 c0                	testl	%eax, %eax
ffff800000111c00: 0f 88 94 00 00 00    	js	0xffff800000111c9a <pdir_walk_range+0x15a>
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000111c06: 41 f6 c5 01          	testb	$1, %r13b
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent && !(*entry & PAGE_HUGE), ptbl_walk_range((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111c0a: 74 34                	je	0xffff800000111c40 <pdir_walk_range+0x100>
ffff800000111c0c: 48 8b 3b             	movq	(%rbx), %rdi
ffff800000111c0f: 40 f6 c7 80          	testb	$-128, %dil
ffff800000111c13: 75 2b                	jne	0xffff800000111c40 <pdir_walk_range+0x100>
ffff800000111c15: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000111c1f: 48 21 c7             	andq	%rax, %rdi
ffff800000111c22: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111c26: 4c 89 fa             	movq	%r15, %rdx
ffff800000111c29: 4c 89 f1             	movq	%r14, %rcx
ffff800000111c2c: 48 b8 60 1d 11 00 00 80 ff ff	movabsq	$-140737487233696, %rax # imm = 0xFFFF800000111D60
ffff800000111c36: ff d0                	callq	*%rax
ffff800000111c38: 85 c0                	testl	%eax, %eax
ffff800000111c3a: 0f 88 7d 00 00 00    	js	0xffff800000111cbd <pdir_walk_range+0x17d>
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111c40: 49 8b 46 40          	movq	64(%r14), %rax
ffff800000111c44: 48 85 c0             	testq	%rax, %rax
ffff800000111c47: 74 19                	je	0xffff800000111c62 <pdir_walk_range+0x122>
ffff800000111c49: 41 83 e5 01          	andl	$1, %r13d
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111c4d: 4d 85 ed             	testq	%r13, %r13
ffff800000111c50: 75 10                	jne	0xffff800000111c62 <pdir_walk_range+0x122>
ffff800000111c52: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111c56: 4c 89 fe             	movq	%r15, %rsi
ffff800000111c59: 4c 89 f2             	movq	%r14, %rdx
ffff800000111c5c: ff d0                	callq	*%rax
ffff800000111c5e: 85 c0                	testl	%eax, %eax
ffff800000111c60: 78 4b                	js	0xffff800000111cad <pdir_walk_range+0x16d>
; 		page_entry_base = sign_extend(page_entry_end + 1);
ffff800000111c62: 49 83 c7 01          	addq	$1, %r15
ffff800000111c66: 4c 89 ff             	movq	%r15, %rdi
ffff800000111c69: 49 bf 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %r15 # imm = 0xFFFF800000111B10
ffff800000111c73: 41 ff d7             	callq	*%r15
ffff800000111c76: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page_entry_end = sign_extend(pdir_end(page_entry_base));
ffff800000111c7a: 48 89 c7             	movq	%rax, %rdi
ffff800000111c7d: 48 b8 50 1d 11 00 00 80 ff ff	movabsq	$-140737487233712, %rax # imm = 0xFFFF800000111D50
ffff800000111c87: ff d0                	callq	*%rax
ffff800000111c89: 48 89 c7             	movq	%rax, %rdi
ffff800000111c8c: 41 ff d7             	callq	*%r15
ffff800000111c8f: 49 89 c7             	movq	%rax, %r15
ffff800000111c92: b0 01                	movb	$1, %al
ffff800000111c94: 84 c0                	testb	%al, %al
ffff800000111c96: 75 61                	jne	0xffff800000111cf9 <pdir_walk_range+0x1b9>
ffff800000111c98: eb 71                	jmp	0xffff800000111d0b <pdir_walk_range+0x1cb>
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pde_unmap && isPresent, walker->pde_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111c9a: 48 89 df             	movq	%rbx, %rdi
ffff800000111c9d: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111ca1: 4c 89 fa             	movq	%r15, %rdx
ffff800000111ca4: 4c 89 f1             	movq	%r14, %rcx
ffff800000111ca7: 41 ff 56 28          	callq	*40(%r14)
ffff800000111cab: eb 43                	jmp	0xffff800000111cf0 <pdir_walk_range+0x1b0>
ffff800000111cad: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111cb1: 4c 89 fe             	movq	%r15, %rsi
ffff800000111cb4: 4c 89 f2             	movq	%r14, %rdx
ffff800000111cb7: 41 ff 56 40          	callq	*64(%r14)
ffff800000111cbb: eb 33                	jmp	0xffff800000111cf0 <pdir_walk_range+0x1b0>
ffff800000111cbd: 48 8b 3b             	movq	(%rbx), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent && !(*entry & PAGE_HUGE), ptbl_walk_range((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111cc0: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000111cca: 48 21 c7             	andq	%rax, %rdi
ffff800000111ccd: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111cd1: 4c 89 fa             	movq	%r15, %rdx
ffff800000111cd4: 4c 89 f1             	movq	%r14, %rcx
ffff800000111cd7: 48 b8 60 1d 11 00 00 80 ff ff	movabsq	$-140737487233696, %rax # imm = 0xFFFF800000111D60
ffff800000111ce1: ff d0                	callq	*%rax
ffff800000111ce3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111ced: 0f 1f 00             	nopl	(%rax)
ffff800000111cf0: 89 45 c8             	movl	%eax, -56(%rbp)
ffff800000111cf3: 31 c0                	xorl	%eax, %eax
ffff800000111cf5: 84 c0                	testb	%al, %al
ffff800000111cf7: 74 12                	je	0xffff800000111d0b <pdir_walk_range+0x1cb>
; 	for(int i = PAGE_DIR_INDEX(base); i <= PAGE_DIR_INDEX(end); i++){
ffff800000111cf9: 48 83 c3 08          	addq	$8, %rbx
ffff800000111cfd: 49 83 c4 ff          	addq	$-1, %r12
ffff800000111d01: 0f 85 b9 fe ff ff    	jne	0xffff800000111bc0 <pdir_walk_range+0x80>
ffff800000111d07: 31 c0                	xorl	%eax, %eax
ffff800000111d09: eb 03                	jmp	0xffff800000111d0e <pdir_walk_range+0x1ce>
ffff800000111d0b: 8b 45 c8             	movl	-56(%rbp), %eax
; }
ffff800000111d0e: 48 83 c4 18          	addq	$24, %rsp
ffff800000111d12: 5b                   	popq	%rbx
ffff800000111d13: 41 5c                	popq	%r12
ffff800000111d15: 41 5d                	popq	%r13
ffff800000111d17: 41 5e                	popq	%r14
ffff800000111d19: 41 5f                	popq	%r15
ffff800000111d1b: 5d                   	popq	%rbp
ffff800000111d1c: c3                   	retq
ffff800000111d1d: 0f 1f 00             	nopl	(%rax)

ffff800000111d20 <pdpt_index>:
; static inline int pdpt_index(uintptr_t addr) {return PDPT_INDEX(addr);}
ffff800000111d20: 55                   	pushq	%rbp
ffff800000111d21: 48 89 e5             	movq	%rsp, %rbp
ffff800000111d24: 48 89 f8             	movq	%rdi, %rax
ffff800000111d27: 48 c1 e8 1e          	shrq	$30, %rax
ffff800000111d2b: 25 ff 01 00 00       	andl	$511, %eax              # imm = 0x1FF
ffff800000111d30: 5d                   	popq	%rbp
ffff800000111d31: c3                   	retq
ffff800000111d32: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111d3c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111d40 <pdpt_end>:
; {
ffff800000111d40: 55                   	pushq	%rbp
ffff800000111d41: 48 89 e5             	movq	%rsp, %rbp
ffff800000111d44: 48 89 f8             	movq	%rdi, %rax
; 	return addr | (PAGE_DIR_SPAN - 1);
ffff800000111d47: 48 0d ff ff ff 3f    	orq	$1073741823, %rax       # imm = 0x3FFFFFFF
ffff800000111d4d: 5d                   	popq	%rbp
ffff800000111d4e: c3                   	retq
ffff800000111d4f: 90                   	nop

ffff800000111d50 <pdir_end>:
; {
ffff800000111d50: 55                   	pushq	%rbp
ffff800000111d51: 48 89 e5             	movq	%rsp, %rbp
ffff800000111d54: 48 89 f8             	movq	%rdi, %rax
; 	return addr | (PAGE_TABLE_SPAN - 1);
ffff800000111d57: 48 0d ff ff 1f 00    	orq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000111d5d: 5d                   	popq	%rbp
ffff800000111d5e: c3                   	retq
ffff800000111d5f: 90                   	nop

ffff800000111d60 <ptbl_walk_range>:
; {
ffff800000111d60: 55                   	pushq	%rbp
ffff800000111d61: 48 89 e5             	movq	%rsp, %rbp
ffff800000111d64: 53                   	pushq	%rbx
ffff800000111d65: 50                   	pushq	%rax
ffff800000111d66: 48 89 c8             	movq	%rcx, %rax
; 	return __walk_range(ptbl, base, end, walker->pte_callback, walker->pte_unmap, NULL, pt_index, pt_end, walker, "ptbl");
ffff800000111d69: 48 8b 09             	movq	(%rcx), %rcx
ffff800000111d6c: 4c 8b 40 20          	movq	32(%rax), %r8
ffff800000111d70: 48 83 ec 08          	subq	$8, %rsp
ffff800000111d74: 49 ba d0 1d 11 00 00 80 ff ff	movabsq	$-140737487233584, %r10 # imm = 0xFFFF800000111DD0
ffff800000111d7e: 49 bb b0 1d 11 00 00 80 ff ff	movabsq	$-140737487233616, %r11 # imm = 0xFFFF800000111DB0
ffff800000111d88: 48 bb c0 18 11 00 00 80 ff ff	movabsq	$-140737487234880, %rbx # imm = 0xFFFF8000001118C0
ffff800000111d92: 45 31 c9             	xorl	%r9d, %r9d
ffff800000111d95: 50                   	pushq	%rax
ffff800000111d96: 41 52                	pushq	%r10
ffff800000111d98: 41 53                	pushq	%r11
ffff800000111d9a: ff d3                	callq	*%rbx
ffff800000111d9c: 48 83 c4 28          	addq	$40, %rsp
ffff800000111da0: 5b                   	popq	%rbx
ffff800000111da1: 5d                   	popq	%rbp
ffff800000111da2: c3                   	retq
ffff800000111da3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111dad: 0f 1f 00             	nopl	(%rax)

ffff800000111db0 <pt_index>:
; static inline int pt_index(uintptr_t addr) {return PAGE_TABLE_INDEX(addr);}
ffff800000111db0: 55                   	pushq	%rbp
ffff800000111db1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111db4: 48 89 f8             	movq	%rdi, %rax
ffff800000111db7: c1 e8 0c             	shrl	$12, %eax
ffff800000111dba: 25 ff 01 00 00       	andl	$511, %eax              # imm = 0x1FF
ffff800000111dbf: 5d                   	popq	%rbp
ffff800000111dc0: c3                   	retq
ffff800000111dc1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111dcb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111dd0 <pt_end>:
; {
ffff800000111dd0: 55                   	pushq	%rbp
ffff800000111dd1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111dd4: 48 89 f8             	movq	%rdi, %rax
; 	return addr | (PAGE_SIZE - 1);
ffff800000111dd7: 48 0d ff 0f 00 00    	orq	$4095, %rax             # imm = 0xFFF
ffff800000111ddd: 5d                   	popq	%rbp
ffff800000111dde: c3                   	retq
ffff800000111ddf: cc                   	int3

ffff800000111de0 <lab2_do_check_ptbl_flags>:
; {
ffff800000111de0: 55                   	pushq	%rbp
ffff800000111de1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111de4: 41 56                	pushq	%r14
ffff800000111de6: 53                   	pushq	%rbx
ffff800000111de7: 49 89 f6             	movq	%rsi, %r14
ffff800000111dea: 48 89 fb             	movq	%rdi, %rbx
; 	if(*entry & PAGE_PRESENT) cprintf("entry present in va range %p - %p\n", base, end);
ffff800000111ded: f6 07 01             	testb	$1, (%rdi)
ffff800000111df0: 74 1b                	je	0xffff800000111e0d <lab2_do_check_ptbl_flags+0x2d>
ffff800000111df2: 48 bf 2f 4c 11 00 00 80 ff ff	movabsq	$-140737487221713, %rdi # imm = 0xFFFF800000114C2F
ffff800000111dfc: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111e06: 4c 89 f6             	movq	%r14, %rsi
ffff800000111e09: 31 c0                	xorl	%eax, %eax
ffff800000111e0b: ff d1                	callq	*%rcx
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff800000111e0d: 48 8b 03             	movq	(%rbx), %rax
ffff800000111e10: 89 c1                	movl	%eax, %ecx
ffff800000111e12: 81 e1 81 00 00 00    	andl	$129, %ecx
ffff800000111e18: 83 f9 01             	cmpl	$1, %ecx
ffff800000111e1b: 75 13                	jne	0xffff800000111e30 <lab2_do_check_ptbl_flags+0x50>
ffff800000111e1d: 48 b9 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rcx # imm = 0xFFFF000000000FFF
ffff800000111e27: 48 21 c8             	andq	%rcx, %rax
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff800000111e2a: 48 83 f8 07          	cmpq	$7, %rax
ffff800000111e2e: 75 07                	jne	0xffff800000111e37 <lab2_do_check_ptbl_flags+0x57>
; }
ffff800000111e30: 31 c0                	xorl	%eax, %eax
ffff800000111e32: 5b                   	popq	%rbx
ffff800000111e33: 41 5e                	popq	%r14
ffff800000111e35: 5d                   	popq	%rbp
ffff800000111e36: c3                   	retq
; 		panic("%p points to a page table with the wrong "
ffff800000111e37: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000111e41: 48 ba 95 59 11 00 00 80 ff ff	movabsq	$-140737487218283, %rdx # imm = 0xFFFF800000115995
ffff800000111e4b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111e55: be 1d 00 00 00       	movl	$29, %esi
ffff800000111e5a: 4c 89 f1             	movq	%r14, %rcx
ffff800000111e5d: 31 c0                	xorl	%eax, %eax
ffff800000111e5f: ff d3                	callq	*%rbx
ffff800000111e61: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111e6b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111e70 <lab2_check_ptbl_flags>:
; {
ffff800000111e70: 55                   	pushq	%rbp
ffff800000111e71: 48 89 e5             	movq	%rsp, %rbp
ffff800000111e74: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000111e78: 48 be 30 47 11 00 00 80 ff ff	movabsq	$-140737487222992, %rsi # imm = 0xFFFF800000114730
ffff800000111e82: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000111e86: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000111e8b: 48 89 c7             	movq	%rax, %rdi
ffff800000111e8e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000111e91: 48 b9 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rcx # imm = 0xFFFF80000011A2F0
ffff800000111e9b: 48 8b 39             	movq	(%rcx), %rdi
ffff800000111e9e: 48 b9 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rcx # imm = 0xFFFF800000111840
ffff800000111ea8: 48 89 c6             	movq	%rax, %rsi
ffff800000111eab: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_ptbl_flags() succeeded!\n");
ffff800000111ead: 48 bf 73 4d 11 00 00 80 ff ff	movabsq	$-140737487221389, %rdi # imm = 0xFFFF800000114D73
ffff800000111eb7: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111ec1: 31 c0                	xorl	%eax, %eax
ffff800000111ec3: ff d1                	callq	*%rcx
; }
ffff800000111ec5: 48 83 c4 50          	addq	$80, %rsp
ffff800000111ec9: 5d                   	popq	%rbp
ffff800000111eca: c3                   	retq
ffff800000111ecb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111ed0 <lab2_check_pte_wx>:
; {
ffff800000111ed0: 55                   	pushq	%rbp
ffff800000111ed1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111ed4: 48 b8 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rax # imm = 0x8000000000000003
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000111ede: 48 23 07             	andq	(%rdi), %rax
ffff800000111ee1: 48 83 f8 03          	cmpq	$3, %rax
ffff800000111ee5: 74 04                	je	0xffff800000111eeb <lab2_check_pte_wx+0x1b>
; }
ffff800000111ee7: 31 c0                	xorl	%eax, %eax
ffff800000111ee9: 5d                   	popq	%rbp
ffff800000111eea: c3                   	retq
ffff800000111eeb: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff800000111eee: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000111ef8: 48 ba 12 49 11 00 00 80 ff ff	movabsq	$-140737487222510, %rdx # imm = 0xFFFF800000114912
ffff800000111f02: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000111f0c: be 3e 00 00 00       	movl	$62, %esi
ffff800000111f11: 31 c0                	xorl	%eax, %eax
ffff800000111f13: 41 ff d0             	callq	*%r8
ffff800000111f16: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111f20 <lab2_check_pde_wx>:
; {
ffff800000111f20: 55                   	pushq	%rbp
ffff800000111f21: 48 89 e5             	movq	%rsp, %rbp
ffff800000111f24: 48 b8 83 00 00 00 00 00 00 80	movabsq	$-9223372036854775677, %rax # imm = 0x8000000000000083
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff800000111f2e: 48 23 07             	andq	(%rdi), %rax
ffff800000111f31: 48 3d 83 00 00 00    	cmpq	$131, %rax
ffff800000111f37: 74 04                	je	0xffff800000111f3d <lab2_check_pde_wx+0x1d>
; }
ffff800000111f39: 31 c0                	xorl	%eax, %eax
ffff800000111f3b: 5d                   	popq	%rbp
ffff800000111f3c: c3                   	retq
ffff800000111f3d: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff800000111f40: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000111f4a: 48 ba 12 49 11 00 00 80 ff ff	movabsq	$-140737487222510, %rdx # imm = 0xFFFF800000114912
ffff800000111f54: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000111f5e: be 52 00 00 00       	movl	$82, %esi
ffff800000111f63: 31 c0                	xorl	%eax, %eax
ffff800000111f65: 41 ff d0             	callq	*%r8
ffff800000111f68: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111f70 <lab2_check_wx>:
; {
ffff800000111f70: 55                   	pushq	%rbp
ffff800000111f71: 48 89 e5             	movq	%rsp, %rbp
ffff800000111f74: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000111f78: 48 be 80 47 11 00 00 80 ff ff	movabsq	$-140737487222912, %rsi # imm = 0xFFFF800000114780
ffff800000111f82: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000111f86: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000111f8b: 48 89 c7             	movq	%rax, %rdi
ffff800000111f8e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000111f91: 48 b9 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rcx # imm = 0xFFFF80000011A2F0
ffff800000111f9b: 48 8b 39             	movq	(%rcx), %rdi
ffff800000111f9e: 48 b9 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rcx # imm = 0xFFFF800000111840
ffff800000111fa8: 48 89 c6             	movq	%rax, %rsi
ffff800000111fab: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_wx() succeeded!\n");
ffff800000111fad: 48 bf ca 55 11 00 00 80 ff ff	movabsq	$-140737487219254, %rdi # imm = 0xFFFF8000001155CA
ffff800000111fb7: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111fc1: 31 c0                	xorl	%eax, %eax
ffff800000111fc3: ff d1                	callq	*%rcx
; }
ffff800000111fc5: 48 83 c4 50          	addq	$80, %rsp
ffff800000111fc9: 5d                   	popq	%rbp
ffff800000111fca: c3                   	retq
ffff800000111fcb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111fd0 <lab2_check_nx>:
; {
ffff800000111fd0: 55                   	pushq	%rbp
ffff800000111fd1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(read_msr(MSR_EFER) & MSR_EFER_NXE)) {
ffff800000111fd4: 48 b8 30 20 11 00 00 80 ff ff	movabsq	$-140737487232976, %rax # imm = 0xFFFF800000112030
ffff800000111fde: ff d0                	callq	*%rax
ffff800000111fe0: a9 00 08 00 00       	testl	$2048, %eax             # imm = 0x800
ffff800000111fe5: 74 1a                	je	0xffff800000112001 <lab2_check_nx+0x31>
; 	cprintf("[LAB 2] check_nx() succeeded!\n");
ffff800000111fe7: 48 bf 9a 4d 11 00 00 80 ff ff	movabsq	$-140737487221350, %rdi # imm = 0xFFFF800000114D9A
ffff800000111ff1: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111ffb: 31 c0                	xorl	%eax, %eax
ffff800000111ffd: ff d1                	callq	*%rcx
; }
ffff800000111fff: 5d                   	popq	%rbp
ffff800000112000: c3                   	retq
; 		panic("No eXecute bit is disabled!");
ffff800000112001: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011200b: 48 ba 56 4a 11 00 00 80 ff ff	movabsq	$-140737487222186, %rdx # imm = 0xFFFF800000114A56
ffff800000112015: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011201f: be 67 00 00 00       	movl	$103, %esi
ffff800000112024: 31 c0                	xorl	%eax, %eax
ffff800000112026: ff d1                	callq	*%rcx
ffff800000112028: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112030 <read_msr>:
; {
ffff800000112030: 55                   	pushq	%rbp
ffff800000112031: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff800000112034: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff800000112039: 0f 32                	rdmsr
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff80000011203b: 48 c1 e2 20          	shlq	$32, %rdx
ffff80000011203f: 89 c0                	movl	%eax, %eax
ffff800000112041: 48 09 d0             	orq	%rdx, %rax
ffff800000112044: 5d                   	popq	%rbp
ffff800000112045: c3                   	retq
ffff800000112046: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112050 <lab2_check_pte_vas>:
; {
ffff800000112050: 55                   	pushq	%rbp
ffff800000112051: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000112054: f6 07 01             	testb	$1, (%rdi)
ffff800000112057: 74 4c                	je	0xffff8000001120a5 <lab2_check_pte_vas+0x55>
ffff800000112059: 49 89 d0             	movq	%rdx, %r8
ffff80000011205c: 48 89 f1             	movq	%rsi, %rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011205f: 48 89 f0             	movq	%rsi, %rax
ffff800000112062: 48 c1 e8 2f          	shrq	$47, %rax
ffff800000112066: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff80000011206b: 0f 93 c0             	setae	%al
ffff80000011206e: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000112072: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff800000112078: 0f 92 c2             	setb	%dl
ffff80000011207b: 48 c1 ee 27          	shrq	$39, %rsi
ffff80000011207f: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000112085: 77 1e                	ja	0xffff8000001120a5 <lab2_check_pte_vas+0x55>
ffff800000112087: 20 d0                	andb	%dl, %al
ffff800000112089: 75 1a                	jne	0xffff8000001120a5 <lab2_check_pte_vas+0x55>
ffff80000011208b: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000112095: 48 39 c1             	cmpq	%rax, %rcx
ffff800000112098: 76 0f                	jbe	0xffff8000001120a9 <lab2_check_pte_vas+0x59>
ffff80000011209a: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001120a0: 49 39 c0             	cmpq	%rax, %r8
ffff8000001120a3: 73 04                	jae	0xffff8000001120a9 <lab2_check_pte_vas+0x59>
; }
ffff8000001120a5: 31 c0                	xorl	%eax, %eax
ffff8000001120a7: 5d                   	popq	%rbp
ffff8000001120a8: c3                   	retq
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff8000001120a9: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001120b3: 48 ba 08 52 11 00 00 80 ff ff	movabsq	$-140737487220216, %rdx # imm = 0xFFFF800000115208
ffff8000001120bd: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff8000001120c7: be 83 00 00 00       	movl	$131, %esi
ffff8000001120cc: 31 c0                	xorl	%eax, %eax
ffff8000001120ce: 41 ff d1             	callq	*%r9
ffff8000001120d1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001120db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001120e0 <lab2_check_pde_vas>:
; {
ffff8000001120e0: 55                   	pushq	%rbp
ffff8000001120e1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001120e4: 8b 07                	movl	(%rdi), %eax
ffff8000001120e6: f7 d0                	notl	%eax
ffff8000001120e8: a8 81                	testb	$-127, %al
ffff8000001120ea: 75 0c                	jne	0xffff8000001120f8 <lab2_check_pde_vas+0x18>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff8000001120ec: 48 b8 50 20 11 00 00 80 ff ff	movabsq	$-140737487232944, %rax # imm = 0xFFFF800000112050
ffff8000001120f6: ff d0                	callq	*%rax
; }
ffff8000001120f8: 31 c0                	xorl	%eax, %eax
ffff8000001120fa: 5d                   	popq	%rbp
ffff8000001120fb: c3                   	retq
ffff8000001120fc: 0f 1f 40 00          	nopl	(%rax)

ffff800000112100 <lab2_check_vas>:
; {
ffff800000112100: 55                   	pushq	%rbp
ffff800000112101: 48 89 e5             	movq	%rsp, %rbp
ffff800000112104: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000112108: 48 be d0 47 11 00 00 80 ff ff	movabsq	$-140737487222832, %rsi # imm = 0xFFFF8000001147D0
ffff800000112112: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000112116: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011211b: 48 89 c7             	movq	%rax, %rdi
ffff80000011211e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000112121: 48 b9 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rcx # imm = 0xFFFF80000011A2F0
ffff80000011212b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011212e: 48 b9 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rcx # imm = 0xFFFF800000111840
ffff800000112138: 48 89 c6             	movq	%rax, %rsi
ffff80000011213b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas() succeeded!\n");
ffff80000011213d: 48 bf 4d 49 11 00 00 80 ff ff	movabsq	$-140737487222451, %rdi # imm = 0xFFFF80000011494D
ffff800000112147: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112151: 31 c0                	xorl	%eax, %eax
ffff800000112153: ff d1                	callq	*%rcx
; }
ffff800000112155: 48 83 c4 50          	addq	$80, %rsp
ffff800000112159: 5d                   	popq	%rbp
ffff80000011215a: c3                   	retq
ffff80000011215b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000112160 <need_mapping>:
; int need_mapping(uintptr_t base, uintptr_t end){
ffff800000112160: 55                   	pushq	%rbp
ffff800000112161: 48 89 e5             	movq	%rsp, %rbp
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff800000112164: 48 89 f8             	movq	%rdi, %rax
ffff800000112167: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000011216b: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff800000112170: 72 2c                	jb	0xffff80000011219e <need_mapping+0x3e>
ffff800000112172: 48 b8 ff ff ff ff ff 7f ff ff	movabsq	$-140737488355329, %rax # imm = 0xFFFF7FFFFFFFFFFF
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff80000011217c: 48 b9 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rcx # imm = 0xFFFF80000011A2E0
ffff800000112186: 48 8b 09             	movq	(%rcx), %rcx
ffff800000112189: 48 c1 e1 0c          	shlq	$12, %rcx
ffff80000011218d: 48 01 c1             	addq	%rax, %rcx
ffff800000112190: 48 83 c1 01          	addq	$1, %rcx
ffff800000112194: b8 01 00 00 00       	movl	$1, %eax
ffff800000112199: 48 39 f1             	cmpq	%rsi, %rcx
ffff80000011219c: 77 65                	ja	0xffff800000112203 <need_mapping+0xa3>
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff80000011219e: 48 89 f8             	movq	%rdi, %rax
ffff8000001121a1: 48 c1 e8 27          	shrq	$39, %rax
ffff8000001121a5: 3d ff ff ff 01       	cmpl	$33554431, %eax         # imm = 0x1FFFFFF
ffff8000001121aa: 72 36                	jb	0xffff8000001121e2 <need_mapping+0x82>
ffff8000001121ac: 48 b8 ff ff ff ff 7f ff ff ff	movabsq	$-549755813889, %rax # imm = 0xFFFFFF7FFFFFFFFF
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff8000001121b6: 48 b9 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rcx # imm = 0xFFFF80000011A2E0
ffff8000001121c0: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001121c3: 48 c1 e1 05          	shlq	$5, %rcx
ffff8000001121c7: 48 01 c1             	addq	%rax, %rcx
ffff8000001121ca: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff8000001121d1: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff8000001121d8: b8 01 00 00 00       	movl	$1, %eax
ffff8000001121dd: 48 39 f1             	cmpq	%rsi, %rcx
ffff8000001121e0: 77 21                	ja	0xffff800000112203 <need_mapping+0xa3>
ffff8000001121e2: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001121ec: 48 39 c7             	cmpq	%rax, %rdi
ffff8000001121ef: 0f 97 c1             	seta	%cl
ffff8000001121f2: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
ffff8000001121f8: 48 39 c6             	cmpq	%rax, %rsi
ffff8000001121fb: 0f 92 c0             	setb	%al
ffff8000001121fe: 20 c8                	andb	%cl, %al
ffff800000112200: 0f b6 c0             	movzbl	%al, %eax
; }
ffff800000112203: 5d                   	popq	%rbp
ffff800000112204: c3                   	retq
ffff800000112205: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011220f: 90                   	nop

ffff800000112210 <lab2_check_pte_vas_ext>:
; {
ffff800000112210: 55                   	pushq	%rbp
ffff800000112211: 48 89 e5             	movq	%rsp, %rbp
ffff800000112214: 49 89 d0             	movq	%rdx, %r8
ffff800000112217: 48 89 f0             	movq	%rsi, %rax
; 	if ((end - base) != 0xfff) {
ffff80000011221a: 48 89 d1             	movq	%rdx, %rcx
ffff80000011221d: 48 29 f1             	subq	%rsi, %rcx
ffff800000112220: 48 81 f9 ff 0f 00 00 	cmpq	$4095, %rcx             # imm = 0xFFF
ffff800000112227: 0f 85 94 00 00 00    	jne	0xffff8000001122c1 <lab2_check_pte_vas_ext+0xb1>
; 	if (!(*entry & PAGE_PRESENT)) {
ffff80000011222d: f6 07 01             	testb	$1, (%rdi)
ffff800000112230: 75 3d                	jne	0xffff80000011226f <lab2_check_pte_vas_ext+0x5f>
;                 if (need_mapping(base, end)){
ffff800000112232: 48 b9 60 21 11 00 00 80 ff ff	movabsq	$-140737487232672, %rcx # imm = 0xFFFF800000112160
ffff80000011223c: 48 89 c7             	movq	%rax, %rdi
ffff80000011223f: 4c 89 c6             	movq	%r8, %rsi
ffff800000112242: ff d1                	callq	*%rcx
ffff800000112244: 85 c0                	testl	%eax, %eax
ffff800000112246: 74 75                	je	0xffff8000001122bd <lab2_check_pte_vas_ext+0xad>
;                     panic("All backing pages for the budy, page_info structs and kernel stack must be mapped\n");
ffff800000112248: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112252: 48 ba 31 50 11 00 00 80 ff ff	movabsq	$-140737487220687, %rdx # imm = 0xFFFF800000115031
ffff80000011225c: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000112266: be bc 00 00 00       	movl	$188, %esi
ffff80000011226b: 31 c0                	xorl	%eax, %eax
ffff80000011226d: ff d1                	callq	*%rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011226f: 48 89 c1             	movq	%rax, %rcx
ffff800000112272: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000112276: 81 f9 ff ff 01 00    	cmpl	$131071, %ecx           # imm = 0x1FFFF
ffff80000011227c: 0f 93 c1             	setae	%cl
ffff80000011227f: 4c 89 c2             	movq	%r8, %rdx
ffff800000112282: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000112286: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff80000011228c: 0f 92 c2             	setb	%dl
ffff80000011228f: 48 89 c6             	movq	%rax, %rsi
ffff800000112292: 48 c1 ee 27          	shrq	$39, %rsi
ffff800000112296: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011229c: 77 1f                	ja	0xffff8000001122bd <lab2_check_pte_vas_ext+0xad>
ffff80000011229e: 20 d1                	andb	%dl, %cl
ffff8000001122a0: 75 1b                	jne	0xffff8000001122bd <lab2_check_pte_vas_ext+0xad>
ffff8000001122a2: 48 b9 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rcx # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001122ac: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001122af: 76 3e                	jbe	0xffff8000001122ef <lab2_check_pte_vas_ext+0xdf>
ffff8000001122b1: 48 81 c1 01 80 00 00 	addq	$32769, %rcx            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001122b8: 49 39 c8             	cmpq	%rcx, %r8
ffff8000001122bb: 73 32                	jae	0xffff8000001122ef <lab2_check_pte_vas_ext+0xdf>
; }
ffff8000001122bd: 31 c0                	xorl	%eax, %eax
ffff8000001122bf: 5d                   	popq	%rbp
ffff8000001122c0: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be 4kb - 1  bytes\n", end, base);
ffff8000001122c1: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001122cb: 48 ba c6 56 11 00 00 80 ff ff	movabsq	$-140737487219002, %rdx # imm = 0xFFFF8000001156C6
ffff8000001122d5: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff8000001122df: be b6 00 00 00       	movl	$182, %esi
ffff8000001122e4: 4c 89 c1             	movq	%r8, %rcx
ffff8000001122e7: 49 89 c0             	movq	%rax, %r8
ffff8000001122ea: 31 c0                	xorl	%eax, %eax
ffff8000001122ec: 41 ff d1             	callq	*%r9
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff8000001122ef: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001122f9: 48 ba 08 52 11 00 00 80 ff ff	movabsq	$-140737487220216, %rdx # imm = 0xFFFF800000115208
ffff800000112303: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff80000011230d: be cf 00 00 00       	movl	$207, %esi
ffff800000112312: 48 89 c1             	movq	%rax, %rcx
ffff800000112315: 31 c0                	xorl	%eax, %eax
ffff800000112317: 41 ff d1             	callq	*%r9
ffff80000011231a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000112320 <lab2_check_pde_vas_ext>:
; {
ffff800000112320: 55                   	pushq	%rbp
ffff800000112321: 48 89 e5             	movq	%rsp, %rbp
ffff800000112324: 48 89 d1             	movq	%rdx, %rcx
ffff800000112327: 49 89 f0             	movq	%rsi, %r8
; 	if ((end - base) != 0x1FFFFF) {
ffff80000011232a: 48 89 d0             	movq	%rdx, %rax
ffff80000011232d: 48 29 f0             	subq	%rsi, %rax
ffff800000112330: 48 3d ff ff 1f 00    	cmpq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000112336: 75 1e                	jne	0xffff800000112356 <lab2_check_pde_vas_ext+0x36>
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff800000112338: 8b 07                	movl	(%rdi), %eax
ffff80000011233a: f7 d0                	notl	%eax
ffff80000011233c: a8 81                	testb	$-127, %al
ffff80000011233e: 75 12                	jne	0xffff800000112352 <lab2_check_pde_vas_ext+0x32>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff800000112340: 48 b8 50 20 11 00 00 80 ff ff	movabsq	$-140737487232944, %rax # imm = 0xFFFF800000112050
ffff80000011234a: 4c 89 c6             	movq	%r8, %rsi
ffff80000011234d: 48 89 ca             	movq	%rcx, %rdx
ffff800000112350: ff d0                	callq	*%rax
; }
ffff800000112352: 31 c0                	xorl	%eax, %eax
ffff800000112354: 5d                   	popq	%rbp
ffff800000112355: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be a 2m page - 1\n", end, base);
ffff800000112356: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112360: 48 ba 69 58 11 00 00 80 ff ff	movabsq	$-140737487218583, %rdx # imm = 0xFFFF800000115869
ffff80000011236a: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff800000112374: be d9 00 00 00       	movl	$217, %esi
ffff800000112379: 31 c0                	xorl	%eax, %eax
ffff80000011237b: 41 ff d1             	callq	*%r9
ffff80000011237e: 66 90                	nop

ffff800000112380 <lab2_check_vas_ext>:
; {
ffff800000112380: 55                   	pushq	%rbp
ffff800000112381: 48 89 e5             	movq	%rsp, %rbp
ffff800000112384: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000112388: 48 be 20 48 11 00 00 80 ff ff	movabsq	$-140737487222752, %rsi # imm = 0xFFFF800000114820
ffff800000112392: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000112396: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011239b: 48 89 c7             	movq	%rax, %rdi
ffff80000011239e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001123a1: 48 b9 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rcx # imm = 0xFFFF80000011A2F0
ffff8000001123ab: 48 8b 39             	movq	(%rcx), %rdi
ffff8000001123ae: 48 b9 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rcx # imm = 0xFFFF800000111840
ffff8000001123b8: 48 89 c6             	movq	%rax, %rsi
ffff8000001123bb: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas_ext() succeeded!\n");
ffff8000001123bd: 48 bf 72 4a 11 00 00 80 ff ff	movabsq	$-140737487222158, %rdi # imm = 0xFFFF800000114A72
ffff8000001123c7: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001123d1: 31 c0                	xorl	%eax, %eax
ffff8000001123d3: ff d1                	callq	*%rcx
; }
ffff8000001123d5: 48 83 c4 50          	addq	$80, %rsp
ffff8000001123d9: 5d                   	popq	%rbp
ffff8000001123da: c3                   	retq
ffff8000001123db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001123e0 <lab2_check_4k_paging>:
; {
ffff8000001123e0: 55                   	pushq	%rbp
ffff8000001123e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001123e4: 41 57                	pushq	%r15
ffff8000001123e6: 41 56                	pushq	%r14
ffff8000001123e8: 41 55                	pushq	%r13
ffff8000001123ea: 41 54                	pushq	%r12
ffff8000001123ec: 53                   	pushq	%rbx
ffff8000001123ed: 48 83 ec 18          	subq	$24, %rsp
; 	cprintf("attempting to count number of free pages in lab2 check paging\n");
ffff8000001123f1: 48 bf 3c 55 11 00 00 80 ff ff	movabsq	$-140737487219396, %rdi # imm = 0xFFFF80000011553C
ffff8000001123fb: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff800000112405: 31 c0                	xorl	%eax, %eax
ffff800000112407: 41 ff d6             	callq	*%r14
; 	nfree = count_total_free_pages();
ffff80000011240a: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000112414: ff d0                	callq	*%rax
ffff800000112416: 49 89 c7             	movq	%rax, %r15
; 	cprintf("counted total number of pages in lab2 check paging\n");
ffff800000112419: 48 bf 84 50 11 00 00 80 ff ff	movabsq	$-140737487220604, %rdi # imm = 0xFFFF800000115084
ffff800000112423: 31 c0                	xorl	%eax, %eax
ffff800000112425: 41 ff d6             	callq	*%r14
; 	page = page_alloc(0);
ffff800000112428: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000112432: 31 ff                	xorl	%edi, %edi
ffff800000112434: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000112436: 48 85 c0             	testq	%rax, %rax
ffff800000112439: 0f 84 56 01 00 00    	je	0xffff800000112595 <lab2_check_4k_paging+0x1b5>
ffff80000011243f: 48 89 c3             	movq	%rax, %rbx
; 	cprintf("page allocated in lab2 check paging\n");
ffff800000112442: 48 bf 83 4b 11 00 00 80 ff ff	movabsq	$-140737487221885, %rdi # imm = 0xFFFF800000114B83
ffff80000011244c: 31 c0                	xorl	%eax, %eax
ffff80000011244e: 41 ff d6             	callq	*%r14
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000112451: 49 bd f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r13 # imm = 0xFFFF80000011A2F0
ffff80000011245b: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011245f: 48 b8 20 08 11 00 00 80 ff ff	movabsq	$-140737487239136, %rax # imm = 0xFFFF800000110820
ffff800000112469: b9 01 00 00 00       	movl	$1, %ecx
ffff80000011246e: 48 89 de             	movq	%rbx, %rsi
ffff800000112471: 31 d2                	xorl	%edx, %edx
ffff800000112473: ff d0                	callq	*%rax
ffff800000112475: 85 c0                	testl	%eax, %eax
ffff800000112477: 0f 85 3f 01 00 00    	jne	0xffff8000001125bc <lab2_check_4k_paging+0x1dc>
; 	assert(page->pp_ref == 1);
ffff80000011247d: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff800000112482: 0f 85 65 01 00 00    	jne	0xffff8000001125ed <lab2_check_4k_paging+0x20d>
; 	assert(!page->pp_free);
ffff800000112488: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000011248c: 0f 88 8c 01 00 00    	js	0xffff80000011261e <lab2_check_4k_paging+0x23e>
ffff800000112492: 4c 89 7d d0          	movq	%r15, -48(%rbp)
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000112496: 49 8b 45 00          	movq	(%r13), %rax
ffff80000011249a: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000011249e: 0f 84 ab 01 00 00    	je	0xffff80000011264f <lab2_check_4k_paging+0x26f>
; 	cprintf("page mapped in lab2 check paging\n");
ffff8000001124a4: 48 bf 66 4c 11 00 00 80 ff ff	movabsq	$-140737487221658, %rdi # imm = 0xFFFF800000114C66
ffff8000001124ae: 31 c0                	xorl	%eax, %eax
ffff8000001124b0: 41 ff d6             	callq	*%r14
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff8000001124b3: 49 8b 7d 00          	movq	(%r13), %rdi
ffff8000001124b7: 49 be 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %r14 # imm = 0xFFFF800000110C50
ffff8000001124c1: 48 8d 55 c8          	leaq	-56(%rbp), %rdx
ffff8000001124c5: 31 f6                	xorl	%esi, %esi
ffff8000001124c7: 41 ff d6             	callq	*%r14
ffff8000001124ca: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff8000001124cd: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff8000001124d1: 4c 8b 20             	movq	(%rax), %r12
ffff8000001124d4: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001124de: 4c 21 e0             	andq	%r12, %rax
ffff8000001124e1: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001124e5: 0f 85 95 01 00 00    	jne	0xffff800000112680 <lab2_check_4k_paging+0x2a0>
ffff8000001124eb: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001124f5: 49 21 c4             	andq	%rax, %r12
ffff8000001124f8: 48 b8 e0 27 11 00 00 80 ff ff	movabsq	$-140737487231008, %rax # imm = 0xFFFF8000001127E0
ffff800000112502: 48 89 df             	movq	%rbx, %rdi
ffff800000112505: ff d0                	callq	*%rax
ffff800000112507: 49 39 c4             	cmpq	%rax, %r12
ffff80000011250a: 0f 85 a1 01 00 00    	jne	0xffff8000001126b1 <lab2_check_4k_paging+0x2d1>
; 	assert(ret == page);
ffff800000112510: 49 39 df             	cmpq	%rbx, %r15
ffff800000112513: 0f 85 c9 01 00 00    	jne	0xffff8000001126e2 <lab2_check_4k_paging+0x302>
; 	page_remove(kernel_pml4, 0);
ffff800000112519: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011251d: 48 b8 80 16 11 00 00 80 ff ff	movabsq	$-140737487235456, %rax # imm = 0xFFFF800000111680
ffff800000112527: 31 f6                	xorl	%esi, %esi
ffff800000112529: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff80000011252b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000011252f: 49 bf 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %r15 # imm = 0xFFFF80000010D770
ffff800000112539: 0f 89 d4 01 00 00    	jns	0xffff800000112713 <lab2_check_4k_paging+0x333>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff80000011253f: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000112543: 31 f6                	xorl	%esi, %esi
ffff800000112545: 31 d2                	xorl	%edx, %edx
ffff800000112547: 41 ff d6             	callq	*%r14
ffff80000011254a: 48 85 c0             	testq	%rax, %rax
ffff80000011254d: 0f 85 f1 01 00 00    	jne	0xffff800000112744 <lab2_check_4k_paging+0x364>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000112553: 49 8b 45 00          	movq	(%r13), %rax
ffff800000112557: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000011255b: 48 bb 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rbx # imm = 0xFFFF80000010D400
ffff800000112565: 0f 85 0a 02 00 00    	jne	0xffff800000112775 <lab2_check_4k_paging+0x395>
; 	assert(nfree == count_total_free_pages());
ffff80000011256b: 41 ff d7             	callq	*%r15
ffff80000011256e: 48 39 45 d0          	cmpq	%rax, -48(%rbp)
ffff800000112572: 0f 85 2e 02 00 00    	jne	0xffff8000001127a6 <lab2_check_4k_paging+0x3c6>
; 	cprintf("[LAB 2] check_4k_paging() succeeded!\n");
ffff800000112578: 48 bf 6d 49 11 00 00 80 ff ff	movabsq	$-140737487222419, %rdi # imm = 0xFFFF80000011496D
ffff800000112582: 31 c0                	xorl	%eax, %eax
ffff800000112584: ff d3                	callq	*%rbx
; }
ffff800000112586: 48 83 c4 18          	addq	$24, %rsp
ffff80000011258a: 5b                   	popq	%rbx
ffff80000011258b: 41 5c                	popq	%r12
ffff80000011258d: 41 5d                	popq	%r13
ffff80000011258f: 41 5e                	popq	%r14
ffff800000112591: 41 5f                	popq	%r15
ffff800000112593: 5d                   	popq	%rbp
ffff800000112594: c3                   	retq
; 		panic("cannot allocate 4K page!");
ffff800000112595: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011259f: 48 ba f9 56 11 00 00 80 ff ff	movabsq	$-140737487218951, %rdx # imm = 0xFFFF8000001156F9
ffff8000001125a9: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff8000001125b3: be 00 01 00 00       	movl	$256, %esi              # imm = 0x100
ffff8000001125b8: 31 c0                	xorl	%eax, %eax
ffff8000001125ba: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001125bc: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001125c6: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001125d0: 48 b9 ff 53 11 00 00 80 ff ff	movabsq	$-140737487219713, %rcx # imm = 0xFFFF8000001153FF
ffff8000001125da: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001125e4: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff8000001125e9: 31 c0                	xorl	%eax, %eax
ffff8000001125eb: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff8000001125ed: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001125f7: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112601: 48 b9 75 5a 11 00 00 80 ff ff	movabsq	$-140737487218059, %rcx # imm = 0xFFFF800000115A75
ffff80000011260b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112615: be 07 01 00 00       	movl	$263, %esi              # imm = 0x107
ffff80000011261a: 31 c0                	xorl	%eax, %eax
ffff80000011261c: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff80000011261e: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112628: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112632: 48 b9 35 49 11 00 00 80 ff ff	movabsq	$-140737487222475, %rcx # imm = 0xFFFF800000114935
ffff80000011263c: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112646: be 08 01 00 00       	movl	$264, %esi              # imm = 0x108
ffff80000011264b: 31 c0                	xorl	%eax, %eax
ffff80000011264d: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff80000011264f: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112659: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112663: 48 b9 a8 4b 11 00 00 80 ff ff	movabsq	$-140737487221848, %rcx # imm = 0xFFFF800000114BA8
ffff80000011266d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112677: be 09 01 00 00       	movl	$265, %esi              # imm = 0x109
ffff80000011267c: 31 c0                	xorl	%eax, %eax
ffff80000011267e: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000112680: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011268a: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112694: 48 b9 1f 58 11 00 00 80 ff ff	movabsq	$-140737487218657, %rcx # imm = 0xFFFF80000011581F
ffff80000011269e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001126a8: be 0f 01 00 00       	movl	$271, %esi              # imm = 0x10F
ffff8000001126ad: 31 c0                	xorl	%eax, %eax
ffff8000001126af: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001126b1: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001126bb: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001126c5: 48 b9 b8 50 11 00 00 80 ff ff	movabsq	$-140737487220552, %rcx # imm = 0xFFFF8000001150B8
ffff8000001126cf: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001126d9: be 10 01 00 00       	movl	$272, %esi              # imm = 0x110
ffff8000001126de: 31 c0                	xorl	%eax, %eax
ffff8000001126e0: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff8000001126e2: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001126ec: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001126f6: 48 b9 08 55 11 00 00 80 ff ff	movabsq	$-140737487219448, %rcx # imm = 0xFFFF800000115508
ffff800000112700: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011270a: be 11 01 00 00       	movl	$273, %esi              # imm = 0x111
ffff80000011270f: 31 c0                	xorl	%eax, %eax
ffff800000112711: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000112713: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011271d: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112727: 48 b9 e3 52 11 00 00 80 ff ff	movabsq	$-140737487219997, %rcx # imm = 0xFFFF8000001152E3
ffff800000112731: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011273b: be 15 01 00 00       	movl	$277, %esi              # imm = 0x115
ffff800000112740: 31 c0                	xorl	%eax, %eax
ffff800000112742: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000112744: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011274e: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112758: 48 b9 9a 4e 11 00 00 80 ff ff	movabsq	$-140737487221094, %rcx # imm = 0xFFFF800000114E9A
ffff800000112762: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011276c: be 16 01 00 00       	movl	$278, %esi              # imm = 0x116
ffff800000112771: 31 c0                	xorl	%eax, %eax
ffff800000112773: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000112775: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011277f: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112789: 48 b9 95 51 11 00 00 80 ff ff	movabsq	$-140737487220331, %rcx # imm = 0xFFFF800000115195
ffff800000112793: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011279d: be 19 01 00 00       	movl	$281, %esi              # imm = 0x119
ffff8000001127a2: 31 c0                	xorl	%eax, %eax
ffff8000001127a4: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff8000001127a6: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001127b0: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001127ba: 48 b9 ad 4f 11 00 00 80 ff ff	movabsq	$-140737487220819, %rcx # imm = 0xFFFF800000114FAD
ffff8000001127c4: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001127ce: be 1c 01 00 00       	movl	$284, %esi              # imm = 0x11C
ffff8000001127d3: 31 c0                	xorl	%eax, %eax
ffff8000001127d5: ff d3                	callq	*%rbx
ffff8000001127d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001127e0 <page2pa>:
; {
ffff8000001127e0: 55                   	pushq	%rbp
ffff8000001127e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001127e4: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff8000001127e7: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff8000001127f1: 48 2b 01             	subq	(%rcx), %rax
ffff8000001127f4: 48 c1 e0 07          	shlq	$7, %rax
ffff8000001127f8: 5d                   	popq	%rbp
ffff8000001127f9: c3                   	retq
ffff8000001127fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000112800 <lab2_check_2m_paging>:
; {
ffff800000112800: 55                   	pushq	%rbp
ffff800000112801: 48 89 e5             	movq	%rsp, %rbp
ffff800000112804: 41 57                	pushq	%r15
ffff800000112806: 41 56                	pushq	%r14
ffff800000112808: 41 55                	pushq	%r13
ffff80000011280a: 41 54                	pushq	%r12
ffff80000011280c: 53                   	pushq	%rbx
ffff80000011280d: 50                   	pushq	%rax
; 	nfree = count_total_free_pages();
ffff80000011280e: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000112818: ff d0                	callq	*%rax
ffff80000011281a: 49 89 c4             	movq	%rax, %r12
; 	page = page_alloc(ALLOC_HUGE);
ffff80000011281d: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000112827: bf 02 00 00 00       	movl	$2, %edi
ffff80000011282c: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000011282e: 48 85 c0             	testq	%rax, %rax
ffff800000112831: 0f 84 55 01 00 00    	je	0xffff80000011298c <lab2_check_2m_paging+0x18c>
ffff800000112837: 48 89 c3             	movq	%rax, %rbx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff80000011283a: 49 bd f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r13 # imm = 0xFFFF80000011A2F0
ffff800000112844: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000112848: 49 bf 20 08 11 00 00 80 ff ff	movabsq	$-140737487239136, %r15 # imm = 0xFFFF800000110820
ffff800000112852: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112857: b9 01 00 00 00       	movl	$1, %ecx
ffff80000011285c: 48 89 c6             	movq	%rax, %rsi
ffff80000011285f: 41 ff d7             	callq	*%r15
ffff800000112862: 85 c0                	testl	%eax, %eax
ffff800000112864: 0f 84 49 01 00 00    	je	0xffff8000001129b3 <lab2_check_2m_paging+0x1b3>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff80000011286a: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011286e: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112873: 48 89 de             	movq	%rbx, %rsi
ffff800000112876: 31 d2                	xorl	%edx, %edx
ffff800000112878: 41 ff d7             	callq	*%r15
ffff80000011287b: 85 c0                	testl	%eax, %eax
ffff80000011287d: 0f 85 61 01 00 00    	jne	0xffff8000001129e4 <lab2_check_2m_paging+0x1e4>
; 	assert(page->pp_ref == 1);
ffff800000112883: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff800000112888: 0f 85 87 01 00 00    	jne	0xffff800000112a15 <lab2_check_2m_paging+0x215>
; 	assert(!page->pp_free);
ffff80000011288e: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000112892: 0f 88 ae 01 00 00    	js	0xffff800000112a46 <lab2_check_2m_paging+0x246>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000112898: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011289c: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff8000001128a0: 0f 84 d1 01 00 00    	je	0xffff800000112a77 <lab2_check_2m_paging+0x277>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff8000001128a6: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff8000001128b0: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff8000001128b4: 31 f6                	xorl	%esi, %esi
ffff8000001128b6: ff d0                	callq	*%rax
ffff8000001128b8: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001128bb: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001128bf: 4c 8b 30             	movq	(%rax), %r14
ffff8000001128c2: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001128cc: 4c 21 f0             	andq	%r14, %rax
ffff8000001128cf: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff8000001128d5: 0f 85 cd 01 00 00    	jne	0xffff800000112aa8 <lab2_check_2m_paging+0x2a8>
ffff8000001128db: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001128e5: 49 21 c6             	andq	%rax, %r14
ffff8000001128e8: 48 b8 e0 27 11 00 00 80 ff ff	movabsq	$-140737487231008, %rax # imm = 0xFFFF8000001127E0
ffff8000001128f2: 48 89 df             	movq	%rbx, %rdi
ffff8000001128f5: ff d0                	callq	*%rax
ffff8000001128f7: 49 39 c6             	cmpq	%rax, %r14
ffff8000001128fa: 0f 85 d9 01 00 00    	jne	0xffff800000112ad9 <lab2_check_2m_paging+0x2d9>
; 	assert(ret == page);
ffff800000112900: 49 39 df             	cmpq	%rbx, %r15
ffff800000112903: 0f 85 01 02 00 00    	jne	0xffff800000112b0a <lab2_check_2m_paging+0x30a>
; 	page_remove(kernel_pml4, 0);
ffff800000112909: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011290d: 48 b8 80 16 11 00 00 80 ff ff	movabsq	$-140737487235456, %rax # imm = 0xFFFF800000111680
ffff800000112917: 31 f6                	xorl	%esi, %esi
ffff800000112919: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff80000011291b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000011291f: 0f 89 16 02 00 00    	jns	0xffff800000112b3b <lab2_check_2m_paging+0x33b>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000112925: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000112929: 31 f6                	xorl	%esi, %esi
ffff80000011292b: 31 d2                	xorl	%edx, %edx
ffff80000011292d: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000112937: ff d0                	callq	*%rax
ffff800000112939: 48 85 c0             	testq	%rax, %rax
ffff80000011293c: 0f 85 2a 02 00 00    	jne	0xffff800000112b6c <lab2_check_2m_paging+0x36c>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000112942: 49 8b 45 00          	movq	(%r13), %rax
ffff800000112946: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000011294a: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000112954: 0f 85 43 02 00 00    	jne	0xffff800000112b9d <lab2_check_2m_paging+0x39d>
; 	assert(nfree == count_total_free_pages());
ffff80000011295a: ff d0                	callq	*%rax
ffff80000011295c: 49 39 c4             	cmpq	%rax, %r12
ffff80000011295f: 0f 85 69 02 00 00    	jne	0xffff800000112bce <lab2_check_2m_paging+0x3ce>
; 	cprintf("[LAB 2] check_2m_paging() succeeded!\n");
ffff800000112965: 48 bf 34 54 11 00 00 80 ff ff	movabsq	$-140737487219660, %rdi # imm = 0xFFFF800000115434
ffff80000011296f: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112979: 31 c0                	xorl	%eax, %eax
ffff80000011297b: ff d1                	callq	*%rcx
; }
ffff80000011297d: 48 83 c4 08          	addq	$8, %rsp
ffff800000112981: 5b                   	popq	%rbx
ffff800000112982: 41 5c                	popq	%r12
ffff800000112984: 41 5d                	popq	%r13
ffff800000112986: 41 5e                	popq	%r14
ffff800000112988: 41 5f                	popq	%r15
ffff80000011298a: 5d                   	popq	%rbp
ffff80000011298b: c3                   	retq
; 		panic("cannot allocate 2M page!");
ffff80000011298c: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112996: 48 ba a0 53 11 00 00 80 ff ff	movabsq	$-140737487219808, %rdx # imm = 0xFFFF8000001153A0
ffff8000001129a0: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff8000001129aa: be 2e 01 00 00       	movl	$302, %esi              # imm = 0x12E
ffff8000001129af: 31 c0                	xorl	%eax, %eax
ffff8000001129b1: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff8000001129b3: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001129bd: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001129c7: 48 b9 88 4c 11 00 00 80 ff ff	movabsq	$-140737487221624, %rcx # imm = 0xFFFF800000114C88
ffff8000001129d1: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001129db: be 32 01 00 00       	movl	$306, %esi              # imm = 0x132
ffff8000001129e0: 31 c0                	xorl	%eax, %eax
ffff8000001129e2: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001129e4: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001129ee: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001129f8: 48 b9 ff 53 11 00 00 80 ff ff	movabsq	$-140737487219713, %rcx # imm = 0xFFFF8000001153FF
ffff800000112a02: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112a0c: be 35 01 00 00       	movl	$309, %esi              # imm = 0x135
ffff800000112a11: 31 c0                	xorl	%eax, %eax
ffff800000112a13: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff800000112a15: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112a1f: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112a29: 48 b9 75 5a 11 00 00 80 ff ff	movabsq	$-140737487218059, %rcx # imm = 0xFFFF800000115A75
ffff800000112a33: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112a3d: be 36 01 00 00       	movl	$310, %esi              # imm = 0x136
ffff800000112a42: 31 c0                	xorl	%eax, %eax
ffff800000112a44: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff800000112a46: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112a50: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112a5a: 48 b9 35 49 11 00 00 80 ff ff	movabsq	$-140737487222475, %rcx # imm = 0xFFFF800000114935
ffff800000112a64: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112a6e: be 37 01 00 00       	movl	$311, %esi              # imm = 0x137
ffff800000112a73: 31 c0                	xorl	%eax, %eax
ffff800000112a75: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000112a77: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112a81: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112a8b: 48 b9 a8 4b 11 00 00 80 ff ff	movabsq	$-140737487221848, %rcx # imm = 0xFFFF800000114BA8
ffff800000112a95: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112a9f: be 38 01 00 00       	movl	$312, %esi              # imm = 0x138
ffff800000112aa4: 31 c0                	xorl	%eax, %eax
ffff800000112aa6: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000112aa8: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112ab2: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112abc: 48 b9 0a 5a 11 00 00 80 ff ff	movabsq	$-140737487218166, %rcx # imm = 0xFFFF800000115A0A
ffff800000112ac6: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112ad0: be 3c 01 00 00       	movl	$316, %esi              # imm = 0x13C
ffff800000112ad5: 31 c0                	xorl	%eax, %eax
ffff800000112ad7: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000112ad9: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112ae3: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112aed: 48 b9 b8 50 11 00 00 80 ff ff	movabsq	$-140737487220552, %rcx # imm = 0xFFFF8000001150B8
ffff800000112af7: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112b01: be 3d 01 00 00       	movl	$317, %esi              # imm = 0x13D
ffff800000112b06: 31 c0                	xorl	%eax, %eax
ffff800000112b08: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000112b0a: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112b14: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112b1e: 48 b9 08 55 11 00 00 80 ff ff	movabsq	$-140737487219448, %rcx # imm = 0xFFFF800000115508
ffff800000112b28: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112b32: be 3e 01 00 00       	movl	$318, %esi              # imm = 0x13E
ffff800000112b37: 31 c0                	xorl	%eax, %eax
ffff800000112b39: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000112b3b: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112b45: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112b4f: 48 b9 e3 52 11 00 00 80 ff ff	movabsq	$-140737487219997, %rcx # imm = 0xFFFF8000001152E3
ffff800000112b59: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112b63: be 42 01 00 00       	movl	$322, %esi              # imm = 0x142
ffff800000112b68: 31 c0                	xorl	%eax, %eax
ffff800000112b6a: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000112b6c: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112b76: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112b80: 48 b9 9a 4e 11 00 00 80 ff ff	movabsq	$-140737487221094, %rcx # imm = 0xFFFF800000114E9A
ffff800000112b8a: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112b94: be 43 01 00 00       	movl	$323, %esi              # imm = 0x143
ffff800000112b99: 31 c0                	xorl	%eax, %eax
ffff800000112b9b: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000112b9d: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112ba7: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112bb1: 48 b9 95 51 11 00 00 80 ff ff	movabsq	$-140737487220331, %rcx # imm = 0xFFFF800000115195
ffff800000112bbb: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112bc5: be 46 01 00 00       	movl	$326, %esi              # imm = 0x146
ffff800000112bca: 31 c0                	xorl	%eax, %eax
ffff800000112bcc: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff800000112bce: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112bd8: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112be2: 48 b9 ad 4f 11 00 00 80 ff ff	movabsq	$-140737487220819, %rcx # imm = 0xFFFF800000114FAD
ffff800000112bec: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112bf6: be 49 01 00 00       	movl	$329, %esi              # imm = 0x149
ffff800000112bfb: 31 c0                	xorl	%eax, %eax
ffff800000112bfd: ff d3                	callq	*%rbx
ffff800000112bff: 90                   	nop

ffff800000112c00 <ismemset>:
; {
ffff800000112c00: 55                   	pushq	%rbp
ffff800000112c01: 48 89 e5             	movq	%rsp, %rbp
ffff800000112c04: b8 01 00 00 00       	movl	$1, %eax
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000112c09: 48 85 d2             	testq	%rdx, %rdx
ffff800000112c0c: 74 24                	je	0xffff800000112c32 <ismemset+0x32>
ffff800000112c0e: 45 31 c0             	xorl	%r8d, %r8d
ffff800000112c11: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112c1b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*p != c) {
ffff800000112c20: 42 0f b6 0c 07       	movzbl	(%rdi,%r8), %ecx
ffff800000112c25: 39 f1                	cmpl	%esi, %ecx
ffff800000112c27: 75 0b                	jne	0xffff800000112c34 <ismemset+0x34>
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000112c29: 49 83 c0 01          	addq	$1, %r8
ffff800000112c2d: 4c 39 c2             	cmpq	%r8, %rdx
ffff800000112c30: 75 ee                	jne	0xffff800000112c20 <ismemset+0x20>
; }
ffff800000112c32: 5d                   	popq	%rbp
ffff800000112c33: c3                   	retq
ffff800000112c34: 31 c0                	xorl	%eax, %eax
; }
ffff800000112c36: 5d                   	popq	%rbp
ffff800000112c37: c3                   	retq
ffff800000112c38: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112c40 <lab2_check_transparent_2m_paging>:
; {
ffff800000112c40: 55                   	pushq	%rbp
ffff800000112c41: 48 89 e5             	movq	%rsp, %rbp
ffff800000112c44: 41 57                	pushq	%r15
ffff800000112c46: 41 56                	pushq	%r14
ffff800000112c48: 41 55                	pushq	%r13
ffff800000112c4a: 41 54                	pushq	%r12
ffff800000112c4c: 53                   	pushq	%rbx
ffff800000112c4d: 48 83 ec 18          	subq	$24, %rsp
; 	nfree = count_total_free_pages();
ffff800000112c51: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000112c5b: ff d0                	callq	*%rax
ffff800000112c5d: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000112c61: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000112c6b: bf 02 00 00 00       	movl	$2, %edi
ffff800000112c70: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000112c72: 48 85 c0             	testq	%rax, %rax
ffff800000112c75: 0f 84 79 05 00 00    	je	0xffff8000001131f4 <lab2_check_transparent_2m_paging+0x5b4>
ffff800000112c7b: 49 89 c7             	movq	%rax, %r15
; 	data = page2kva(page);
ffff800000112c7e: 48 b8 c0 34 11 00 00 80 ff ff	movabsq	$-140737487227712, %rax # imm = 0xFFFF8000001134C0
ffff800000112c88: 4c 89 ff             	movq	%r15, %rdi
ffff800000112c8b: ff d0                	callq	*%rax
ffff800000112c8d: 49 89 c6             	movq	%rax, %r14
ffff800000112c90: 31 db                	xorl	%ebx, %ebx
ffff800000112c92: 49 bc a0 03 11 00 00 80 ff ff	movabsq	$-140737487240288, %r12 # imm = 0xFFFF8000001103A0
ffff800000112c9c: 0f 1f 40 00          	nopl	(%rax)
; 		memset(data, i & 0xff, PAGE_SIZE);
ffff800000112ca0: 0f b6 f3             	movzbl	%bl, %esi
ffff800000112ca3: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112ca8: 4c 89 f7             	movq	%r14, %rdi
ffff800000112cab: 41 ff d4             	callq	*%r12
; 		data += PAGE_SIZE;
ffff800000112cae: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff800000112cb5: 48 83 c3 01          	addq	$1, %rbx
ffff800000112cb9: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000112cc0: 75 de                	jne	0xffff800000112ca0 <lab2_check_transparent_2m_paging+0x60>
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000112cc2: 49 bc f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r12 # imm = 0xFFFF80000011A2F0
ffff800000112ccc: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112cd0: 48 bb 20 08 11 00 00 80 ff ff	movabsq	$-140737487239136, %rbx # imm = 0xFFFF800000110820
ffff800000112cda: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112cdf: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112ce4: 4c 89 fe             	movq	%r15, %rsi
ffff800000112ce7: ff d3                	callq	*%rbx
ffff800000112ce9: 85 c0                	testl	%eax, %eax
ffff800000112ceb: 0f 84 2a 05 00 00    	je	0xffff80000011321b <lab2_check_transparent_2m_paging+0x5db>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000112cf1: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112cf5: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112cfa: 4c 89 fe             	movq	%r15, %rsi
ffff800000112cfd: 31 d2                	xorl	%edx, %edx
ffff800000112cff: ff d3                	callq	*%rbx
ffff800000112d01: 85 c0                	testl	%eax, %eax
ffff800000112d03: 0f 85 43 05 00 00    	jne	0xffff80000011324c <lab2_check_transparent_2m_paging+0x60c>
; 	assert(page->pp_ref == 1);
ffff800000112d09: 66 41 83 7f 10 01    	cmpw	$1, 16(%r15)
ffff800000112d0f: 0f 85 68 05 00 00    	jne	0xffff80000011327d <lab2_check_transparent_2m_paging+0x63d>
; 	assert(!page->pp_free);
ffff800000112d15: 41 80 7f 12 00       	cmpb	$0, 18(%r15)
ffff800000112d1a: 0f 88 8e 05 00 00    	js	0xffff8000001132ae <lab2_check_transparent_2m_paging+0x66e>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000112d20: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112d24: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000112d28: 0f 84 b1 05 00 00    	je	0xffff8000001132df <lab2_check_transparent_2m_paging+0x69f>
ffff800000112d2e: 49 bd ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %r13 # imm = 0xFFFF000000000FFF
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000112d38: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000112d42: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000112d46: 31 f6                	xorl	%esi, %esi
ffff800000112d48: ff d0                	callq	*%rax
ffff800000112d4a: 49 89 c6             	movq	%rax, %r14
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000112d4d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112d51: 48 8b 18             	movq	(%rax), %rbx
ffff800000112d54: 48 89 d8             	movq	%rbx, %rax
ffff800000112d57: 4c 21 e8             	andq	%r13, %rax
ffff800000112d5a: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000112d60: 0f 85 aa 05 00 00    	jne	0xffff800000113310 <lab2_check_transparent_2m_paging+0x6d0>
ffff800000112d66: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000112d70: 48 21 c3             	andq	%rax, %rbx
ffff800000112d73: 48 b8 e0 27 11 00 00 80 ff ff	movabsq	$-140737487231008, %rax # imm = 0xFFFF8000001127E0
ffff800000112d7d: 4c 89 ff             	movq	%r15, %rdi
ffff800000112d80: ff d0                	callq	*%rax
ffff800000112d82: 48 39 c3             	cmpq	%rax, %rbx
ffff800000112d85: 0f 85 b6 05 00 00    	jne	0xffff800000113341 <lab2_check_transparent_2m_paging+0x701>
; 	assert(ret == page);
ffff800000112d8b: 4d 39 fe             	cmpq	%r15, %r14
ffff800000112d8e: 0f 85 de 05 00 00    	jne	0xffff800000113372 <lab2_check_transparent_2m_paging+0x732>
; 	unmap_page_range(kernel_pml4, (void *)PAGE_SIZE, PAGE_SIZE);
ffff800000112d94: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112d98: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff800000112da2: be 00 10 00 00       	movl	$4096, %esi             # imm = 0x1000
ffff800000112da7: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112dac: ff d0                	callq	*%rax
ffff800000112dae: 45 31 e4             	xorl	%r12d, %r12d
ffff800000112db1: 4c 8d 7d d0          	leaq	-48(%rbp), %r15
ffff800000112db5: 49 be 00 2c 11 00 00 80 ff ff	movabsq	$-140737487229952, %r14 # imm = 0xFFFF800000112C00
ffff800000112dbf: 31 db                	xorl	%ebx, %ebx
ffff800000112dc1: eb 25                	jmp	0xffff800000112de8 <lab2_check_transparent_2m_paging+0x1a8>
ffff800000112dc3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112dcd: 0f 1f 00             	nopl	(%rax)
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff800000112dd0: 49 83 c4 01          	addq	$1, %r12
ffff800000112dd4: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff800000112ddb: 49 81 fc 00 02 00 00 	cmpq	$512, %r12              # imm = 0x200
ffff800000112de2: 0f 84 0d 01 00 00    	je	0xffff800000112ef5 <lab2_check_transparent_2m_paging+0x2b5>
; 		entry = NULL;
ffff800000112de8: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
; 		ret = page_lookup(kernel_pml4, addr, &entry);
ffff800000112df0: 48 b8 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rax # imm = 0xFFFF80000011A2F0
ffff800000112dfa: 48 8b 38             	movq	(%rax), %rdi
ffff800000112dfd: 48 89 de             	movq	%rbx, %rsi
ffff800000112e00: 4c 89 fa             	movq	%r15, %rdx
ffff800000112e03: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000112e0d: ff d0                	callq	*%rax
; 		if (addr == (void *)PAGE_SIZE) {
ffff800000112e0f: 48 81 fb 00 10 00 00 	cmpq	$4096, %rbx             # imm = 0x1000
ffff800000112e16: 0f 84 94 00 00 00    	je	0xffff800000112eb0 <lab2_check_transparent_2m_paging+0x270>
ffff800000112e1c: 48 85 c0             	testq	%rax, %rax
; 			assert(ret);
ffff800000112e1f: 0f 84 4d 02 00 00    	je	0xffff800000113072 <lab2_check_transparent_2m_paging+0x432>
; 			assert(entry);
ffff800000112e25: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112e29: 48 85 c0             	testq	%rax, %rax
ffff800000112e2c: 0f 84 71 02 00 00    	je	0xffff8000001130a3 <lab2_check_transparent_2m_paging+0x463>
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000112e32: 48 8b 38             	movq	(%rax), %rdi
ffff800000112e35: 48 89 f8             	movq	%rdi, %rax
ffff800000112e38: 4c 21 e8             	andq	%r13, %rax
ffff800000112e3b: 48 83 f8 01          	cmpq	$1, %rax
ffff800000112e3f: 0f 85 8f 02 00 00    	jne	0xffff8000001130d4 <lab2_check_transparent_2m_paging+0x494>
; 			page = pa2page(PAGE_ADDR(*entry));
ffff800000112e45: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000112e4f: 48 21 c7             	andq	%rax, %rdi
ffff800000112e52: 48 b8 f0 34 11 00 00 80 ff ff	movabsq	$-140737487227664, %rax # imm = 0xFFFF8000001134F0
ffff800000112e5c: ff d0                	callq	*%rax
; 			assert(page->pp_order == 0);
ffff800000112e5e: 0f b6 48 12          	movzbl	18(%rax), %ecx
ffff800000112e62: f6 c1 7f             	testb	$127, %cl
ffff800000112e65: 0f 85 9a 02 00 00    	jne	0xffff800000113105 <lab2_check_transparent_2m_paging+0x4c5>
; 			assert(!page->pp_free);
ffff800000112e6b: 84 c9                	testb	%cl, %cl
ffff800000112e6d: 0f 88 c3 02 00 00    	js	0xffff800000113136 <lab2_check_transparent_2m_paging+0x4f6>
; 			assert(list_is_empty(&page->pp_node));
ffff800000112e73: 48 89 c7             	movq	%rax, %rdi
ffff800000112e76: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000112e80: ff d0                	callq	*%rax
ffff800000112e82: 85 c0                	testl	%eax, %eax
ffff800000112e84: 0f 84 dd 02 00 00    	je	0xffff800000113167 <lab2_check_transparent_2m_paging+0x527>
; 			if (!ismemset(addr, (i & 0xff), PAGE_SIZE)) {
ffff800000112e8a: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff800000112e8e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112e93: 48 89 df             	movq	%rbx, %rdi
ffff800000112e96: 41 ff d6             	callq	*%r14
ffff800000112e99: 85 c0                	testl	%eax, %eax
ffff800000112e9b: 0f 85 2f ff ff ff    	jne	0xffff800000112dd0 <lab2_check_transparent_2m_paging+0x190>
ffff800000112ea1: e9 f2 02 00 00       	jmp	0xffff800000113198 <lab2_check_transparent_2m_paging+0x558>
ffff800000112ea6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112eb0: 48 85 c0             	testq	%rax, %rax
; 			assert(!ret);
ffff800000112eb3: 0f 85 0a 03 00 00    	jne	0xffff8000001131c3 <lab2_check_transparent_2m_paging+0x583>
; 			assert(!entry);
ffff800000112eb9: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000112ebe: 0f 84 0c ff ff ff    	je	0xffff800000112dd0 <lab2_check_transparent_2m_paging+0x190>
ffff800000112ec4: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000112ece: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000112ed8: 48 b9 9b 4a 11 00 00 80 ff ff	movabsq	$-140737487222117, %rcx # imm = 0xFFFF800000114A9B
ffff800000112ee2: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112eec: be 91 01 00 00       	movl	$401, %esi              # imm = 0x191
ffff800000112ef1: 31 c0                	xorl	%eax, %eax
ffff800000112ef3: ff d3                	callq	*%rbx
; 	page = page_alloc(0);
ffff800000112ef5: 31 ff                	xorl	%edi, %edi
ffff800000112ef7: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000112f01: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000112f03: 48 85 c0             	testq	%rax, %rax
ffff800000112f06: 0f 84 97 04 00 00    	je	0xffff8000001133a3 <lab2_check_transparent_2m_paging+0x763>
ffff800000112f0c: 48 89 c3             	movq	%rax, %rbx
; 	data = page2kva(page);
ffff800000112f0f: 48 89 c7             	movq	%rax, %rdi
ffff800000112f12: 48 b8 c0 34 11 00 00 80 ff ff	movabsq	$-140737487227712, %rax # imm = 0xFFFF8000001134C0
ffff800000112f1c: ff d0                	callq	*%rax
; 	memset(data, 1, PAGE_SIZE);
ffff800000112f1e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112f23: 48 89 c7             	movq	%rax, %rdi
ffff800000112f26: be 01 00 00 00       	movl	$1, %esi
ffff800000112f2b: 48 b8 a0 03 11 00 00 80 ff ff	movabsq	$-140737487240288, %rax # imm = 0xFFFF8000001103A0
ffff800000112f35: ff d0                	callq	*%rax
ffff800000112f37: 49 bc f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r12 # imm = 0xFFFF80000011A2F0
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff800000112f41: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112f45: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112f4a: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112f4f: 48 89 de             	movq	%rbx, %rsi
ffff800000112f52: 48 b8 20 08 11 00 00 80 ff ff	movabsq	$-140737487239136, %rax # imm = 0xFFFF800000110820
ffff800000112f5c: ff d0                	callq	*%rax
ffff800000112f5e: 85 c0                	testl	%eax, %eax
ffff800000112f60: 0f 85 64 04 00 00    	jne	0xffff8000001133ca <lab2_check_transparent_2m_paging+0x78a>
; 	page_lookup(kernel_pml4, 0, &entry);
ffff800000112f66: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112f6a: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
; 	page_lookup(kernel_pml4, 0, &entry);
ffff800000112f6e: 31 f6                	xorl	%esi, %esi
ffff800000112f70: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000112f7a: ff d0                	callq	*%rax
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000112f7c: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112f80: 4c 23 28             	andq	(%rax), %r13
ffff800000112f83: 49 81 fd 81 00 00 00 	cmpq	$129, %r13
ffff800000112f8a: 0f 85 6b 04 00 00    	jne	0xffff8000001133fb <lab2_check_transparent_2m_paging+0x7bb>
ffff800000112f90: 31 db                	xorl	%ebx, %ebx
ffff800000112f92: 45 31 ff             	xorl	%r15d, %r15d
ffff800000112f95: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112f9f: 90                   	nop
; 		if (!ismemset(data, i & 0xff, PAGE_SIZE)) {
ffff800000112fa0: 0f b6 f3             	movzbl	%bl, %esi
ffff800000112fa3: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112fa8: 4c 89 ff             	movq	%r15, %rdi
ffff800000112fab: 41 ff d6             	callq	*%r14
ffff800000112fae: 85 c0                	testl	%eax, %eax
ffff800000112fb0: 0f 84 93 00 00 00    	je	0xffff800000113049 <lab2_check_transparent_2m_paging+0x409>
; 		data += PAGE_SIZE;
ffff800000112fb6: 49 81 c7 00 10 00 00 	addq	$4096, %r15             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff800000112fbd: 48 83 c3 01          	addq	$1, %rbx
ffff800000112fc1: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000112fc8: 75 d6                	jne	0xffff800000112fa0 <lab2_check_transparent_2m_paging+0x360>
; 	unmap_page_range(kernel_pml4, 0, HPAGE_SIZE);
ffff800000112fca: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112fce: ba 00 00 20 00       	movl	$2097152, %edx          # imm = 0x200000
ffff800000112fd3: 31 f6                	xorl	%esi, %esi
ffff800000112fd5: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff800000112fdf: ff d0                	callq	*%rax
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000112fe1: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112fe5: 31 f6                	xorl	%esi, %esi
ffff800000112fe7: 31 d2                	xorl	%edx, %edx
ffff800000112fe9: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000112ff3: ff d0                	callq	*%rax
ffff800000112ff5: 48 85 c0             	testq	%rax, %rax
ffff800000112ff8: 0f 85 2e 04 00 00    	jne	0xffff80000011342c <lab2_check_transparent_2m_paging+0x7ec>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000112ffe: 49 8b 04 24          	movq	(%r12), %rax
ffff800000113002: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000113006: 0f 85 51 04 00 00    	jne	0xffff80000011345d <lab2_check_transparent_2m_paging+0x81d>
; 	assert(nfree == count_total_free_pages());
ffff80000011300c: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000113016: ff d0                	callq	*%rax
ffff800000113018: 48 39 45 c8          	cmpq	%rax, -56(%rbp)
ffff80000011301c: 0f 85 6c 04 00 00    	jne	0xffff80000011348e <lab2_check_transparent_2m_paging+0x84e>
; 	cprintf("[LAB 2] check_transparent_2m_paging() succeeded!\n");
ffff800000113022: 48 bf cf 4f 11 00 00 80 ff ff	movabsq	$-140737487220785, %rdi # imm = 0xFFFF800000114FCF
ffff80000011302c: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000113036: 31 c0                	xorl	%eax, %eax
ffff800000113038: ff d1                	callq	*%rcx
; }
ffff80000011303a: 48 83 c4 18          	addq	$24, %rsp
ffff80000011303e: 5b                   	popq	%rbx
ffff80000011303f: 41 5c                	popq	%r12
ffff800000113041: 41 5d                	popq	%r13
ffff800000113043: 41 5e                	popq	%r14
ffff800000113045: 41 5f                	popq	%r15
ffff800000113047: 5d                   	popq	%rbp
ffff800000113048: c3                   	retq
; 			panic("page %p is corrupt\n", NULL);
ffff800000113049: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113053: 48 ba ec 51 11 00 00 80 ff ff	movabsq	$-140737487220244, %rdx # imm = 0xFFFF8000001151EC
ffff80000011305d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113067: be b8 01 00 00       	movl	$440, %esi              # imm = 0x1B8
ffff80000011306c: 31 c9                	xorl	%ecx, %ecx
ffff80000011306e: 31 c0                	xorl	%eax, %eax
ffff800000113070: ff d3                	callq	*%rbx
; 			assert(ret);
ffff800000113072: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011307c: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113086: 48 b9 f1 52 11 00 00 80 ff ff	movabsq	$-140737487219983, %rcx # imm = 0xFFFF8000001152F1
ffff800000113090: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011309a: be 93 01 00 00       	movl	$403, %esi              # imm = 0x193
ffff80000011309f: 31 c0                	xorl	%eax, %eax
ffff8000001130a1: ff d3                	callq	*%rbx
; 			assert(entry);
ffff8000001130a3: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001130ad: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001130b7: 48 b9 db 50 11 00 00 80 ff ff	movabsq	$-140737487220517, %rcx # imm = 0xFFFF8000001150DB
ffff8000001130c1: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001130cb: be 94 01 00 00       	movl	$404, %esi              # imm = 0x194
ffff8000001130d0: 31 c0                	xorl	%eax, %eax
ffff8000001130d2: ff d3                	callq	*%rbx
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff8000001130d4: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001130de: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001130e8: 48 b9 1f 58 11 00 00 80 ff ff	movabsq	$-140737487218657, %rcx # imm = 0xFFFF80000011581F
ffff8000001130f2: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001130fc: be 95 01 00 00       	movl	$405, %esi              # imm = 0x195
ffff800000113101: 31 c0                	xorl	%eax, %eax
ffff800000113103: ff d3                	callq	*%rbx
; 			assert(page->pp_order == 0);
ffff800000113105: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011310f: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113119: 48 b9 87 5a 11 00 00 80 ff ff	movabsq	$-140737487218041, %rcx # imm = 0xFFFF800000115A87
ffff800000113123: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011312d: be 97 01 00 00       	movl	$407, %esi              # imm = 0x197
ffff800000113132: 31 c0                	xorl	%eax, %eax
ffff800000113134: ff d3                	callq	*%rbx
; 			assert(!page->pp_free);
ffff800000113136: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113140: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000011314a: 48 b9 35 49 11 00 00 80 ff ff	movabsq	$-140737487222475, %rcx # imm = 0xFFFF800000114935
ffff800000113154: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011315e: be 98 01 00 00       	movl	$408, %esi              # imm = 0x198
ffff800000113163: 31 c0                	xorl	%eax, %eax
ffff800000113165: ff d3                	callq	*%rbx
; 			assert(list_is_empty(&page->pp_node));
ffff800000113167: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113171: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000011317b: 48 b9 12 57 11 00 00 80 ff ff	movabsq	$-140737487218926, %rcx # imm = 0xFFFF800000115712
ffff800000113185: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011318f: be 99 01 00 00       	movl	$409, %esi              # imm = 0x199
ffff800000113194: 31 c0                	xorl	%eax, %eax
ffff800000113196: ff d3                	callq	*%rbx
; 				panic("page %p is corrupt", addr);
ffff800000113198: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001131a2: 48 ba bd 4e 11 00 00 80 ff ff	movabsq	$-140737487221059, %rdx # imm = 0xFFFF800000114EBD
ffff8000001131ac: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff8000001131b6: be 9c 01 00 00       	movl	$412, %esi              # imm = 0x19C
ffff8000001131bb: 48 89 d9             	movq	%rbx, %rcx
ffff8000001131be: 31 c0                	xorl	%eax, %eax
ffff8000001131c0: 41 ff d0             	callq	*%r8
; 			assert(!ret);
ffff8000001131c3: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001131cd: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001131d7: 48 b9 96 4a 11 00 00 80 ff ff	movabsq	$-140737487222122, %rcx # imm = 0xFFFF800000114A96
ffff8000001131e1: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001131eb: be 90 01 00 00       	movl	$400, %esi              # imm = 0x190
ffff8000001131f0: 31 c0                	xorl	%eax, %eax
ffff8000001131f2: ff d3                	callq	*%rbx
; 		panic("cannot allocate 2M page!");
ffff8000001131f4: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001131fe: 48 ba a0 53 11 00 00 80 ff ff	movabsq	$-140737487219808, %rdx # imm = 0xFFFF8000001153A0
ffff800000113208: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000113212: be 6b 01 00 00       	movl	$363, %esi              # imm = 0x16B
ffff800000113217: 31 c0                	xorl	%eax, %eax
ffff800000113219: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff80000011321b: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113225: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000011322f: 48 b9 88 4c 11 00 00 80 ff ff	movabsq	$-140737487221624, %rcx # imm = 0xFFFF800000114C88
ffff800000113239: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113243: be 77 01 00 00       	movl	$375, %esi              # imm = 0x177
ffff800000113248: 31 c0                	xorl	%eax, %eax
ffff80000011324a: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff80000011324c: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113256: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113260: 48 b9 ff 53 11 00 00 80 ff ff	movabsq	$-140737487219713, %rcx # imm = 0xFFFF8000001153FF
ffff80000011326a: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113274: be 7a 01 00 00       	movl	$378, %esi              # imm = 0x17A
ffff800000113279: 31 c0                	xorl	%eax, %eax
ffff80000011327b: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff80000011327d: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113287: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113291: 48 b9 75 5a 11 00 00 80 ff ff	movabsq	$-140737487218059, %rcx # imm = 0xFFFF800000115A75
ffff80000011329b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001132a5: be 7b 01 00 00       	movl	$379, %esi              # imm = 0x17B
ffff8000001132aa: 31 c0                	xorl	%eax, %eax
ffff8000001132ac: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff8000001132ae: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001132b8: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001132c2: 48 b9 35 49 11 00 00 80 ff ff	movabsq	$-140737487222475, %rcx # imm = 0xFFFF800000114935
ffff8000001132cc: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001132d6: be 7c 01 00 00       	movl	$380, %esi              # imm = 0x17C
ffff8000001132db: 31 c0                	xorl	%eax, %eax
ffff8000001132dd: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff8000001132df: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001132e9: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001132f3: 48 b9 a8 4b 11 00 00 80 ff ff	movabsq	$-140737487221848, %rcx # imm = 0xFFFF800000114BA8
ffff8000001132fd: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113307: be 7d 01 00 00       	movl	$381, %esi              # imm = 0x17D
ffff80000011330c: 31 c0                	xorl	%eax, %eax
ffff80000011330e: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000113310: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011331a: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113324: 48 b9 0a 5a 11 00 00 80 ff ff	movabsq	$-140737487218166, %rcx # imm = 0xFFFF800000115A0A
ffff80000011332e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113338: be 81 01 00 00       	movl	$385, %esi              # imm = 0x181
ffff80000011333d: 31 c0                	xorl	%eax, %eax
ffff80000011333f: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000113341: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011334b: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113355: 48 b9 b8 50 11 00 00 80 ff ff	movabsq	$-140737487220552, %rcx # imm = 0xFFFF8000001150B8
ffff80000011335f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113369: be 82 01 00 00       	movl	$386, %esi              # imm = 0x182
ffff80000011336e: 31 c0                	xorl	%eax, %eax
ffff800000113370: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000113372: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011337c: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113386: 48 b9 08 55 11 00 00 80 ff ff	movabsq	$-140737487219448, %rcx # imm = 0xFFFF800000115508
ffff800000113390: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011339a: be 83 01 00 00       	movl	$387, %esi              # imm = 0x183
ffff80000011339f: 31 c0                	xorl	%eax, %eax
ffff8000001133a1: ff d3                	callq	*%rbx
; 		panic("cannot allocate 4K page!");
ffff8000001133a3: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001133ad: 48 ba f9 56 11 00 00 80 ff ff	movabsq	$-140737487218951, %rdx # imm = 0xFFFF8000001156F9
ffff8000001133b7: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff8000001133c1: be a5 01 00 00       	movl	$421, %esi              # imm = 0x1A5
ffff8000001133c6: 31 c0                	xorl	%eax, %eax
ffff8000001133c8: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff8000001133ca: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001133d4: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001133de: 48 b9 61 52 11 00 00 80 ff ff	movabsq	$-140737487220127, %rcx # imm = 0xFFFF800000115261
ffff8000001133e8: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001133f2: be ad 01 00 00       	movl	$429, %esi              # imm = 0x1AD
ffff8000001133f7: 31 c0                	xorl	%eax, %eax
ffff8000001133f9: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001133fb: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113405: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff80000011340f: 48 b9 0a 5a 11 00 00 80 ff ff	movabsq	$-140737487218166, %rcx # imm = 0xFFFF800000115A0A
ffff800000113419: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113423: be b1 01 00 00       	movl	$433, %esi              # imm = 0x1B1
ffff800000113428: 31 c0                	xorl	%eax, %eax
ffff80000011342a: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff80000011342c: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113436: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113440: 48 b9 9a 4e 11 00 00 80 ff ff	movabsq	$-140737487221094, %rcx # imm = 0xFFFF800000114E9A
ffff80000011344a: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113454: be c0 01 00 00       	movl	$448, %esi              # imm = 0x1C0
ffff800000113459: 31 c0                	xorl	%eax, %eax
ffff80000011345b: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff80000011345d: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113467: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff800000113471: 48 b9 95 51 11 00 00 80 ff ff	movabsq	$-140737487220331, %rcx # imm = 0xFFFF800000115195
ffff80000011347b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113485: be c3 01 00 00       	movl	$451, %esi              # imm = 0x1C3
ffff80000011348a: 31 c0                	xorl	%eax, %eax
ffff80000011348c: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff80000011348e: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113498: 48 ba 64 4f 11 00 00 80 ff ff	movabsq	$-140737487220892, %rdx # imm = 0xFFFF800000114F64
ffff8000001134a2: 48 b9 ad 4f 11 00 00 80 ff ff	movabsq	$-140737487220819, %rcx # imm = 0xFFFF800000114FAD
ffff8000001134ac: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001134b6: be c6 01 00 00       	movl	$454, %esi              # imm = 0x1C6
ffff8000001134bb: 31 c0                	xorl	%eax, %eax
ffff8000001134bd: ff d3                	callq	*%rbx
ffff8000001134bf: 90                   	nop

ffff8000001134c0 <page2kva>:
; {
ffff8000001134c0: 55                   	pushq	%rbp
ffff8000001134c1: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff8000001134c4: 48 b8 e0 27 11 00 00 80 ff ff	movabsq	$-140737487231008, %rax # imm = 0xFFFF8000001127E0
ffff8000001134ce: ff d0                	callq	*%rax
ffff8000001134d0: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff8000001134da: 48 b9 c0 37 11 00 00 80 ff ff	movabsq	$-140737487226944, %rcx # imm = 0xFFFF8000001137C0
ffff8000001134e4: be 50 00 00 00       	movl	$80, %esi
ffff8000001134e9: 48 89 c2             	movq	%rax, %rdx
ffff8000001134ec: ff d1                	callq	*%rcx
ffff8000001134ee: 5d                   	popq	%rbp
ffff8000001134ef: c3                   	retq

ffff8000001134f0 <pa2page>:
; {
ffff8000001134f0: 55                   	pushq	%rbp
ffff8000001134f1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001134f4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff8000001134f8: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000113502: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000113505: 73 16                	jae	0xffff80000011351d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000113507: 48 b8 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rax # imm = 0xFFFF80000011A2E8
ffff800000113511: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000113515: 48 03 38             	addq	(%rax), %rdi
ffff800000113518: 48 89 f8             	movq	%rdi, %rax
ffff80000011351b: 5d                   	popq	%rbp
ffff80000011351c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000011351d: 48 bf 16 4a 11 00 00 80 ff ff	movabsq	$-140737487222250, %rdi # imm = 0xFFFF800000114A16
ffff800000113527: 48 ba a8 57 11 00 00 80 ff ff	movabsq	$-140737487218776, %rdx # imm = 0xFFFF8000001157A8
ffff800000113531: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000011353b: be 49 00 00 00       	movl	$73, %esi
ffff800000113540: 31 c0                	xorl	%eax, %eax
ffff800000113542: ff d1                	callq	*%rcx
ffff800000113544: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011354e: 66 90                	nop

ffff800000113550 <list_is_empty>:
; {
ffff800000113550: 55                   	pushq	%rbp
ffff800000113551: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff800000113554: 31 c0                	xorl	%eax, %eax
ffff800000113556: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff800000113559: 0f 94 c0             	sete	%al
ffff80000011355c: 5d                   	popq	%rbp
ffff80000011355d: c3                   	retq
ffff80000011355e: 66 90                	nop

ffff800000113560 <lab2_check_free_list_order>:
; {
ffff800000113560: 55                   	pushq	%rbp
ffff800000113561: 48 89 e5             	movq	%rsp, %rbp
ffff800000113564: 31 c9                	xorl	%ecx, %ecx
ffff800000113566: 49 b8 40 a2 11 00 00 80 ff ff	movabsq	$-140737487199680, %r8 # imm = 0xFFFF80000011A240
ffff800000113570: 45 31 c9             	xorl	%r9d, %r9d
ffff800000113573: eb 15                	jmp	0xffff80000011358a <lab2_check_free_list_order+0x2a>
ffff800000113575: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011357f: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000113580: 49 83 c1 01          	addq	$1, %r9
ffff800000113584: 49 83 f9 0a          	cmpq	$10, %r9
ffff800000113588: 74 32                	je	0xffff8000001135bc <lab2_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000011358a: 4c 89 ce             	movq	%r9, %rsi
ffff80000011358d: 48 c1 e6 04          	shlq	$4, %rsi
ffff800000113591: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff800000113595: 4c 01 c6             	addq	%r8, %rsi
ffff800000113598: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000011359b: 74 e3                	je	0xffff800000113580 <lab2_check_free_list_order+0x20>
ffff80000011359d: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff8000001135a0: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff8000001135a4: 83 e0 7f             	andl	$127, %eax
ffff8000001135a7: 31 d2                	xorl	%edx, %edx
ffff8000001135a9: 49 39 c1             	cmpq	%rax, %r9
ffff8000001135ac: 0f 95 c2             	setne	%dl
ffff8000001135af: 48 01 d1             	addq	%rdx, %rcx
ffff8000001135b2: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff8000001135b5: 48 39 f7             	cmpq	%rsi, %rdi
ffff8000001135b8: 75 e6                	jne	0xffff8000001135a0 <lab2_check_free_list_order+0x40>
ffff8000001135ba: eb c4                	jmp	0xffff800000113580 <lab2_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff8000001135bc: 48 85 c9             	testq	%rcx, %rcx
ffff8000001135bf: 75 1a                	jne	0xffff8000001135db <lab2_check_free_list_order+0x7b>
; 	cprintf("[LAB 2] check_free_list_order() succeeded!\n");
ffff8000001135c1: 48 bf 3d 5a 11 00 00 80 ff ff	movabsq	$-140737487218115, %rdi # imm = 0xFFFF800000115A3D
ffff8000001135cb: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001135d5: 31 c0                	xorl	%eax, %eax
ffff8000001135d7: ff d1                	callq	*%rcx
; }
ffff8000001135d9: 5d                   	popq	%rbp
ffff8000001135da: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff8000001135db: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff8000001135e5: 48 ba 6a 57 11 00 00 80 ff ff	movabsq	$-140737487218838, %rdx # imm = 0xFFFF80000011576A
ffff8000001135ef: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff8000001135f9: be df 01 00 00       	movl	$479, %esi              # imm = 0x1DF
ffff8000001135fe: 31 c0                	xorl	%eax, %eax
ffff800000113600: 41 ff d0             	callq	*%r8
ffff800000113603: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011360d: 0f 1f 00             	nopl	(%rax)

ffff800000113610 <lab2_check_memory_layout>:
; {
ffff800000113610: 55                   	pushq	%rbp
ffff800000113611: 48 89 e5             	movq	%rsp, %rbp
ffff800000113614: 41 57                	pushq	%r15
ffff800000113616: 41 56                	pushq	%r14
ffff800000113618: 41 55                	pushq	%r13
ffff80000011361a: 41 54                	pushq	%r12
ffff80000011361c: 53                   	pushq	%rbx
ffff80000011361d: 48 83 ec 18          	subq	$24, %rsp
ffff800000113621: 48 89 fb             	movq	%rdi, %rbx
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff800000113624: 8b 17                	movl	(%rdi), %edx
ffff800000113626: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113630: 48 b8 c0 37 11 00 00 80 ff ff	movabsq	$-140737487226944, %rax # imm = 0xFFFF8000001137C0
ffff80000011363a: be ed 01 00 00       	movl	$493, %esi              # imm = 0x1ED
ffff80000011363f: ff d0                	callq	*%rax
ffff800000113641: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff800000113644: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000011364e: 31 ff                	xorl	%edi, %edi
ffff800000113650: ff d0                	callq	*%rax
ffff800000113652: 48 b9 10 38 11 00 00 80 ff ff	movabsq	$-140737487226864, %rcx # imm = 0xFFFF800000113810
ffff80000011365c: bf ee 01 00 00       	movl	$494, %edi              # imm = 0x1EE
ffff800000113661: 48 89 c6             	movq	%rax, %rsi
ffff800000113664: ff d1                	callq	*%rcx
ffff800000113666: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000011366a: 48 89 5d d0          	movq	%rbx, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000011366e: 83 7b 04 00          	cmpl	$0, 4(%rbx)
ffff800000113672: 0f 84 e3 00 00 00    	je	0xffff80000011375b <lab2_check_memory_layout+0x14b>
ffff800000113678: 45 31 ff             	xorl	%r15d, %r15d
ffff80000011367b: 49 be e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %r14 # imm = 0xFFFF80000011A2E0
ffff800000113685: eb 21                	jmp	0xffff8000001136a8 <lab2_check_memory_layout+0x98>
ffff800000113687: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000113690: 49 83 c7 01          	addq	$1, %r15
ffff800000113694: 49 83 c4 18          	addq	$24, %r12
ffff800000113698: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000011369c: 8b 40 04             	movl	4(%rax), %eax
ffff80000011369f: 49 39 c7             	cmpq	%rax, %r15
ffff8000001136a2: 0f 83 b3 00 00 00    	jae	0xffff80000011375b <lab2_check_memory_layout+0x14b>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff8000001136a8: 49 8b 1c 24          	movq	(%r12), %rbx
ffff8000001136ac: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff8000001136b1: 48 01 d8             	addq	%rbx, %rax
ffff8000001136b4: eb 25                	jmp	0xffff8000001136db <lab2_check_memory_layout+0xcb>
ffff8000001136b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 			    page->pp_free) {
ffff8000001136c0: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff8000001136c5: 0f 88 b7 00 00 00    	js	0xffff800000113782 <lab2_check_memory_layout+0x172>
; 		     pa += PAGE_SIZE) {
ffff8000001136cb: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff8000001136d2: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff8000001136d7: 49 03 04 24          	addq	(%r12), %rax
ffff8000001136db: 48 39 c3             	cmpq	%rax, %rbx
ffff8000001136de: 73 b0                	jae	0xffff800000113690 <lab2_check_memory_layout+0x80>
; 			if (npages <= PAGE_INDEX(pa)) {
ffff8000001136e0: 48 89 d8             	movq	%rbx, %rax
ffff8000001136e3: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001136e7: 49 39 06             	cmpq	%rax, (%r14)
ffff8000001136ea: 76 df                	jbe	0xffff8000001136cb <lab2_check_memory_layout+0xbb>
; 			page = pa2page(pa);
ffff8000001136ec: 48 89 df             	movq	%rbx, %rdi
ffff8000001136ef: 48 b8 f0 34 11 00 00 80 ff ff	movabsq	$-140737487227664, %rax # imm = 0xFFFF8000001134F0
ffff8000001136f9: ff d0                	callq	*%rax
ffff8000001136fb: 49 89 c5             	movq	%rax, %r13
; 			addr = (void *)ROUNDDOWN((uintptr_t)page, PAGE_SIZE);
ffff8000001136fe: 48 89 c6             	movq	%rax, %rsi
ffff800000113701: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 			if (!page_lookup(kernel_pml4, addr, NULL)) {
ffff800000113708: 48 b8 f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %rax # imm = 0xFFFF80000011A2F0
ffff800000113712: 48 8b 38             	movq	(%rax), %rdi
ffff800000113715: 31 d2                	xorl	%edx, %edx
ffff800000113717: 48 b8 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rax # imm = 0xFFFF800000110C50
ffff800000113721: ff d0                	callq	*%rax
ffff800000113723: 48 85 c0             	testq	%rax, %rax
ffff800000113726: 74 a3                	je	0xffff8000001136cb <lab2_check_memory_layout+0xbb>
; 			if ((pa == 0 ||
ffff800000113728: 48 85 db             	testq	%rbx, %rbx
ffff80000011372b: 74 93                	je	0xffff8000001136c0 <lab2_check_memory_layout+0xb0>
ffff80000011372d: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff800000113731: 48 3b 58 08          	cmpq	8(%rax), %rbx
ffff800000113735: 74 89                	je	0xffff8000001136c0 <lab2_check_memory_layout+0xb0>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff800000113737: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000011373e: 72 0a                	jb	0xffff80000011374a <lab2_check_memory_layout+0x13a>
ffff800000113740: 48 3b 5d c8          	cmpq	-56(%rbp), %rbx
ffff800000113744: 0f 82 76 ff ff ff    	jb	0xffff8000001136c0 <lab2_check_memory_layout+0xb0>
; 			    entry->type != MMAP_FREE) &&
ffff80000011374a: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff800000113750: 0f 85 6a ff ff ff    	jne	0xffff8000001136c0 <lab2_check_memory_layout+0xb0>
ffff800000113756: e9 70 ff ff ff       	jmp	0xffff8000001136cb <lab2_check_memory_layout+0xbb>
; 	cprintf("[LAB 2] check_memory_layout() succeeded!\n");
ffff80000011375b: 48 bf cd 4c 11 00 00 80 ff ff	movabsq	$-140737487221555, %rdi # imm = 0xFFFF800000114CCD
ffff800000113765: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000011376f: 31 c0                	xorl	%eax, %eax
ffff800000113771: ff d1                	callq	*%rcx
; }
ffff800000113773: 48 83 c4 18          	addq	$24, %rsp
ffff800000113777: 5b                   	popq	%rbx
ffff800000113778: 41 5c                	popq	%r12
ffff80000011377a: 41 5d                	popq	%r13
ffff80000011377c: 41 5e                	popq	%r14
ffff80000011377e: 41 5f                	popq	%r15
ffff800000113780: 5d                   	popq	%rbp
ffff800000113781: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff800000113782: 48 b8 e0 27 11 00 00 80 ff ff	movabsq	$-140737487231008, %rax # imm = 0xFFFF8000001127E0
ffff80000011378c: 4c 89 ef             	movq	%r13, %rdi
ffff80000011378f: ff d0                	callq	*%rax
ffff800000113791: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff80000011379b: 48 ba 5c 4d 11 00 00 80 ff ff	movabsq	$-140737487221412, %rdx # imm = 0xFFFF800000114D5C
ffff8000001137a5: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001137af: be 03 02 00 00       	movl	$515, %esi              # imm = 0x203
ffff8000001137b4: 48 89 c1             	movq	%rax, %rcx
ffff8000001137b7: 31 c0                	xorl	%eax, %eax
ffff8000001137b9: ff d3                	callq	*%rbx
ffff8000001137bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001137c0 <_kaddr>:
; {
ffff8000001137c0: 55                   	pushq	%rbp
ffff8000001137c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001137c4: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001137c7: 48 89 d1             	movq	%rdx, %rcx
ffff8000001137ca: 48 c1 e9 0c          	shrq	$12, %rcx
ffff8000001137ce: 48 ba e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rdx # imm = 0xFFFF80000011A2E0
ffff8000001137d8: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff8000001137db: 73 0f                	jae	0xffff8000001137ec <_kaddr+0x2c>
ffff8000001137dd: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff8000001137e7: 48 01 c8             	addq	%rcx, %rax
ffff8000001137ea: 5d                   	popq	%rbp
ffff8000001137eb: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff8000001137ec: 48 ba ca 53 11 00 00 80 ff ff	movabsq	$-140737487219766, %rdx # imm = 0xFFFF8000001153CA
ffff8000001137f6: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000113800: 48 89 c1             	movq	%rax, %rcx
ffff800000113803: 31 c0                	xorl	%eax, %eax
ffff800000113805: 41 ff d0             	callq	*%r8
ffff800000113808: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000113810 <_paddr>:
; {
ffff800000113810: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000113813: 48 89 f1             	movq	%rsi, %rcx
ffff800000113816: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000011381a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff800000113820: 76 0e                	jbe	0xffff800000113830 <_paddr+0x20>
ffff800000113822: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000011382c: 48 01 c8             	addq	%rcx, %rax
ffff80000011382f: c3                   	retq
ffff800000113830: 55                   	pushq	%rbp
ffff800000113831: 48 89 e5             	movq	%rsp, %rbp
ffff800000113834: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff800000113836: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113840: 48 ba de 4b 11 00 00 80 ff ff	movabsq	$-140737487221794, %rdx # imm = 0xFFFF800000114BDE
ffff80000011384a: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000113854: 48 89 c1             	movq	%rax, %rcx
ffff800000113857: 31 c0                	xorl	%eax, %eax
ffff800000113859: 41 ff d0             	callq	*%r8
ffff80000011385c: 0f 1f 40 00          	nopl	(%rax)

ffff800000113860 <lab2_check_buddy_consistency>:
; {
ffff800000113860: 55                   	pushq	%rbp
ffff800000113861: 48 89 e5             	movq	%rsp, %rbp
ffff800000113864: 41 57                	pushq	%r15
ffff800000113866: 41 56                	pushq	%r14
ffff800000113868: 41 55                	pushq	%r13
ffff80000011386a: 41 54                	pushq	%r12
ffff80000011386c: 53                   	pushq	%rbx
ffff80000011386d: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff80000011386e: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000113878: 48 8b 00             	movq	(%rax), %rax
ffff80000011387b: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff80000011387f: 74 7e                	je	0xffff8000001138ff <lab2_check_buddy_consistency+0x9f>
ffff800000113881: 31 db                	xorl	%ebx, %ebx
ffff800000113883: 49 bc f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r12 # imm = 0xFFFF80000011A2F0
ffff80000011388d: 49 bd f0 34 11 00 00 80 ff ff	movabsq	$-140737487227664, %r13 # imm = 0xFFFF8000001134F0
ffff800000113897: 49 bf 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %r15 # imm = 0xFFFF800000110C50
ffff8000001138a1: eb 2a                	jmp	0xffff8000001138cd <lab2_check_buddy_consistency+0x6d>
ffff8000001138a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001138ad: 0f 1f 00             	nopl	(%rax)
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff8000001138b0: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
; 	     addr < npages * PAGE_SIZE;
ffff8000001138b7: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff8000001138c1: 48 8b 00             	movq	(%rax), %rax
ffff8000001138c4: 48 c1 e0 0c          	shlq	$12, %rax
ffff8000001138c8: 48 39 c3             	cmpq	%rax, %rbx
; 	for (addr = 0;
ffff8000001138cb: 73 32                	jae	0xffff8000001138ff <lab2_check_buddy_consistency+0x9f>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff8000001138cd: 4d 8b 34 24          	movq	(%r12), %r14
ffff8000001138d1: 48 89 df             	movq	%rbx, %rdi
ffff8000001138d4: 41 ff d5             	callq	*%r13
ffff8000001138d7: 4c 89 f7             	movq	%r14, %rdi
ffff8000001138da: 48 89 c6             	movq	%rax, %rsi
ffff8000001138dd: 31 d2                	xorl	%edx, %edx
ffff8000001138df: 41 ff d7             	callq	*%r15
ffff8000001138e2: 48 85 c0             	testq	%rax, %rax
ffff8000001138e5: 74 c9                	je	0xffff8000001138b0 <lab2_check_buddy_consistency+0x50>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff8000001138e7: be 09 00 00 00       	movl	$9, %esi
ffff8000001138ec: 48 89 df             	movq	%rbx, %rdi
ffff8000001138ef: 31 d2                	xorl	%edx, %edx
ffff8000001138f1: 48 b8 70 eb 10 00 00 80 ff ff	movabsq	$-140737487246480, %rax # imm = 0xFFFF80000010EB70
ffff8000001138fb: ff d0                	callq	*%rax
ffff8000001138fd: eb b1                	jmp	0xffff8000001138b0 <lab2_check_buddy_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_consistency() succeeded!\n");
ffff8000001138ff: 48 bf e3 4d 11 00 00 80 ff ff	movabsq	$-140737487221277, %rdi # imm = 0xFFFF800000114DE3
ffff800000113909: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000113913: 31 c0                	xorl	%eax, %eax
ffff800000113915: ff d1                	callq	*%rcx
; }
ffff800000113917: 48 83 c4 08          	addq	$8, %rsp
ffff80000011391b: 5b                   	popq	%rbx
ffff80000011391c: 41 5c                	popq	%r12
ffff80000011391e: 41 5d                	popq	%r13
ffff800000113920: 41 5e                	popq	%r14
ffff800000113922: 41 5f                	popq	%r15
ffff800000113924: 5d                   	popq	%rbp
ffff800000113925: c3                   	retq
ffff800000113926: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113930 <lab2_check_buddy_full_consistency>:
; {
ffff800000113930: 55                   	pushq	%rbp
ffff800000113931: 48 89 e5             	movq	%rsp, %rbp
ffff800000113934: 41 57                	pushq	%r15
ffff800000113936: 41 56                	pushq	%r14
ffff800000113938: 41 55                	pushq	%r13
ffff80000011393a: 41 54                	pushq	%r12
ffff80000011393c: 53                   	pushq	%rbx
ffff80000011393d: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff80000011393e: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000113948: 48 8b 00             	movq	(%rax), %rax
ffff80000011394b: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff80000011394f: 0f 84 f3 00 00 00    	je	0xffff800000113a48 <lab2_check_buddy_full_consistency+0x118>
ffff800000113955: 45 31 e4             	xorl	%r12d, %r12d
ffff800000113958: 49 be f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r14 # imm = 0xFFFF80000011A2F0
ffff800000113962: 48 bb 50 0c 11 00 00 80 ff ff	movabsq	$-140737487238064, %rbx # imm = 0xFFFF800000110C50
ffff80000011396c: 49 bd c0 37 11 00 00 80 ff ff	movabsq	$-140737487226944, %r13 # imm = 0xFFFF8000001137C0
ffff800000113976: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff800000113980: 4d 8b 3e             	movq	(%r14), %r15
ffff800000113983: 4c 89 e7             	movq	%r12, %rdi
ffff800000113986: 48 b8 f0 34 11 00 00 80 ff ff	movabsq	$-140737487227664, %rax # imm = 0xFFFF8000001134F0
ffff800000113990: ff d0                	callq	*%rax
ffff800000113992: 4c 89 ff             	movq	%r15, %rdi
ffff800000113995: 48 89 c6             	movq	%rax, %rsi
ffff800000113998: 31 d2                	xorl	%edx, %edx
ffff80000011399a: ff d3                	callq	*%rbx
ffff80000011399c: 48 85 c0             	testq	%rax, %rax
ffff80000011399f: 0f 84 ca 00 00 00    	je	0xffff800000113a6f <lab2_check_buddy_full_consistency+0x13f>
;                 if (!page_lookup(kernel_pml4, KADDR(addr), NULL)) {
ffff8000001139a5: 4d 8b 3e             	movq	(%r14), %r15
ffff8000001139a8: 49 be 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %r14 # imm = 0xFFFF800000114C52
ffff8000001139b2: 4c 89 f7             	movq	%r14, %rdi
ffff8000001139b5: be 2e 02 00 00       	movl	$558, %esi              # imm = 0x22E
ffff8000001139ba: 4c 89 e2             	movq	%r12, %rdx
ffff8000001139bd: 41 ff d5             	callq	*%r13
ffff8000001139c0: 4c 89 ff             	movq	%r15, %rdi
ffff8000001139c3: 48 89 c6             	movq	%rax, %rsi
ffff8000001139c6: 31 d2                	xorl	%edx, %edx
ffff8000001139c8: 49 89 df             	movq	%rbx, %r15
ffff8000001139cb: ff d3                	callq	*%rbx
ffff8000001139cd: 48 85 c0             	testq	%rax, %rax
ffff8000001139d0: 0f 84 de 00 00 00    	je	0xffff800000113ab4 <lab2_check_buddy_full_consistency+0x184>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff8000001139d6: be 09 00 00 00       	movl	$9, %esi
ffff8000001139db: 4c 89 e7             	movq	%r12, %rdi
ffff8000001139de: 31 d2                	xorl	%edx, %edx
ffff8000001139e0: 48 bb 70 eb 10 00 00 80 ff ff	movabsq	$-140737487246480, %rbx # imm = 0xFFFF80000010EB70
ffff8000001139ea: ff d3                	callq	*%rbx
;                 check_buddy_consistency(PADDR(KADDR(addr)), BUDDY_MAX_ORDER - 1, NULL);
ffff8000001139ec: 4c 89 f7             	movq	%r14, %rdi
ffff8000001139ef: be 36 02 00 00       	movl	$566, %esi              # imm = 0x236
ffff8000001139f4: 4c 89 e2             	movq	%r12, %rdx
ffff8000001139f7: 41 ff d5             	callq	*%r13
ffff8000001139fa: bf 36 02 00 00       	movl	$566, %edi              # imm = 0x236
ffff8000001139ff: 48 89 c6             	movq	%rax, %rsi
ffff800000113a02: 48 b8 10 38 11 00 00 80 ff ff	movabsq	$-140737487226864, %rax # imm = 0xFFFF800000113810
ffff800000113a0c: ff d0                	callq	*%rax
ffff800000113a0e: be 09 00 00 00       	movl	$9, %esi
ffff800000113a13: 48 89 c7             	movq	%rax, %rdi
ffff800000113a16: 31 d2                	xorl	%edx, %edx
ffff800000113a18: ff d3                	callq	*%rbx
; 	     addr += (1 << PAGE_TABLE_SHIFT)) {
ffff800000113a1a: 49 81 c4 00 10 00 00 	addq	$4096, %r12             # imm = 0x1000
; 	     addr < npages * PAGE_SIZE;
ffff800000113a21: 48 b8 e0 a2 11 00 00 80 ff ff	movabsq	$-140737487199520, %rax # imm = 0xFFFF80000011A2E0
ffff800000113a2b: 48 8b 00             	movq	(%rax), %rax
ffff800000113a2e: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000113a32: 49 39 c4             	cmpq	%rax, %r12
ffff800000113a35: 49 be f0 a2 11 00 00 80 ff ff	movabsq	$-140737487199504, %r14 # imm = 0xFFFF80000011A2F0
ffff800000113a3f: 4c 89 fb             	movq	%r15, %rbx
; 	for (addr = 0;
ffff800000113a42: 0f 82 38 ff ff ff    	jb	0xffff800000113980 <lab2_check_buddy_full_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_full_consistency() succeeded!\n");
ffff800000113a48: 48 bf 7b 55 11 00 00 80 ff ff	movabsq	$-140737487219333, %rdi # imm = 0xFFFF80000011557B
ffff800000113a52: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000113a5c: 31 c0                	xorl	%eax, %eax
ffff800000113a5e: ff d1                	callq	*%rcx
; }
ffff800000113a60: 48 83 c4 08          	addq	$8, %rsp
ffff800000113a64: 5b                   	popq	%rbx
ffff800000113a65: 41 5c                	popq	%r12
ffff800000113a67: 41 5d                	popq	%r13
ffff800000113a69: 41 5e                	popq	%r14
ffff800000113a6b: 41 5f                	popq	%r15
ffff800000113a6d: 5d                   	popq	%rbp
ffff800000113a6e: c3                   	retq
; 	             panic("Page_info structure number %d is not mapped\n", pa2page(addr) - pages);
ffff800000113a6f: 4c 89 e7             	movq	%r12, %rdi
ffff800000113a72: 48 b8 f0 34 11 00 00 80 ff ff	movabsq	$-140737487227664, %rax # imm = 0xFFFF8000001134F0
ffff800000113a7c: ff d0                	callq	*%rax
ffff800000113a7e: 48 b9 e8 a2 11 00 00 80 ff ff	movabsq	$-140737487199512, %rcx # imm = 0xFFFF80000011A2E8
ffff800000113a88: 48 2b 01             	subq	(%rcx), %rax
ffff800000113a8b: 48 c1 f8 05          	sarq	$5, %rax
ffff800000113a8f: 48 bf 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %rdi # imm = 0xFFFF800000114C52
ffff800000113a99: 48 ba cc 59 11 00 00 80 ff ff	movabsq	$-140737487218228, %rdx # imm = 0xFFFF8000001159CC
ffff800000113aa3: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113aad: be 2b 02 00 00       	movl	$555, %esi              # imm = 0x22B
ffff800000113ab2: eb 34                	jmp	0xffff800000113ae8 <lab2_check_buddy_full_consistency+0x1b8>
;                      panic("Kernel address %llx should be mapped\n", KADDR(addr));
ffff800000113ab4: 49 be 52 4c 11 00 00 80 ff ff	movabsq	$-140737487221678, %r14 # imm = 0xFFFF800000114C52
ffff800000113abe: 4c 89 f7             	movq	%r14, %rdi
ffff800000113ac1: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff800000113ac6: 4c 89 e2             	movq	%r12, %rdx
ffff800000113ac9: 41 ff d5             	callq	*%r13
ffff800000113acc: 48 ba a2 4a 11 00 00 80 ff ff	movabsq	$-140737487222110, %rdx # imm = 0xFFFF800000114AA2
ffff800000113ad6: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000113ae0: 4c 89 f7             	movq	%r14, %rdi
ffff800000113ae3: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff800000113ae8: 48 89 c1             	movq	%rax, %rcx
ffff800000113aeb: 31 c0                	xorl	%eax, %eax
ffff800000113aed: ff d3                	callq	*%rbx
ffff800000113aef: 90                   	nop

ffff800000113af0 <lab2_check_pml4>:
; {
ffff800000113af0: 55                   	pushq	%rbp
ffff800000113af1: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_ptbl_flags();
ffff800000113af4: 48 b8 70 1e 11 00 00 80 ff ff	movabsq	$-140737487233424, %rax # imm = 0xFFFF800000111E70
ffff800000113afe: ff d0                	callq	*%rax
; 	lab2_check_wx();
ffff800000113b00: 48 b8 70 1f 11 00 00 80 ff ff	movabsq	$-140737487233168, %rax # imm = 0xFFFF800000111F70
ffff800000113b0a: ff d0                	callq	*%rax
; 	lab2_check_nx();
ffff800000113b0c: 48 b8 d0 1f 11 00 00 80 ff ff	movabsq	$-140737487233072, %rax # imm = 0xFFFF800000111FD0
ffff800000113b16: ff d0                	callq	*%rax
; }
ffff800000113b18: 5d                   	popq	%rbp
ffff800000113b19: c3                   	retq
ffff800000113b1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000113b20 <lab2_check_paging>:
; {
ffff800000113b20: 55                   	pushq	%rbp
ffff800000113b21: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_4k_paging();
ffff800000113b24: 48 b8 e0 23 11 00 00 80 ff ff	movabsq	$-140737487232032, %rax # imm = 0xFFFF8000001123E0
ffff800000113b2e: ff d0                	callq	*%rax
; }
ffff800000113b30: 5d                   	popq	%rbp
ffff800000113b31: c3                   	retq
ffff800000113b32: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000113b3c: 0f 1f 40 00          	nopl	(%rax)

ffff800000113b40 <lab2_check_buddy>:
; {
ffff800000113b40: 55                   	pushq	%rbp
ffff800000113b41: 48 89 e5             	movq	%rsp, %rbp
ffff800000113b44: 53                   	pushq	%rbx
ffff800000113b45: 50                   	pushq	%rax
ffff800000113b46: 48 89 fb             	movq	%rdi, %rbx
; 	lab2_check_free_list_order();
ffff800000113b49: 48 b8 60 35 11 00 00 80 ff ff	movabsq	$-140737487227552, %rax # imm = 0xFFFF800000113560
ffff800000113b53: ff d0                	callq	*%rax
; 	lab2_check_memory_layout(boot_info);
ffff800000113b55: 48 b8 10 36 11 00 00 80 ff ff	movabsq	$-140737487227376, %rax # imm = 0xFFFF800000113610
ffff800000113b5f: 48 89 df             	movq	%rbx, %rdi
ffff800000113b62: ff d0                	callq	*%rax
; 	lab2_check_buddy_consistency();
ffff800000113b64: 48 b8 60 38 11 00 00 80 ff ff	movabsq	$-140737487226784, %rax # imm = 0xFFFF800000113860
ffff800000113b6e: ff d0                	callq	*%rax
; 	lab2_check_vas();
ffff800000113b70: 48 b8 00 21 11 00 00 80 ff ff	movabsq	$-140737487232768, %rax # imm = 0xFFFF800000112100
ffff800000113b7a: ff d0                	callq	*%rax
; }
ffff800000113b7c: 48 83 c4 08          	addq	$8, %rsp
ffff800000113b80: 5b                   	popq	%rbx
ffff800000113b81: 5d                   	popq	%rbp
ffff800000113b82: c3                   	retq
