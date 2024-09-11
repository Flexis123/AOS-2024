
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
ffff80000010c004: 48 b8 00 80 11 00 00 80 ff ff	movabsq	$-140737487208448, %rax # imm = 0xFFFF800000118000
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
ffff80000010c03a: 48 bb 04 80 11 00 00 80 ff ff	movabsq	$-140737487208444, %rbx # imm = 0xFFFF800000118004
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
ffff80000010c121: 48 b8 0c 82 11 00 00 80 ff ff	movabsq	$-140737487207924, %rax # imm = 0xFFFF80000011820C
ffff80000010c12b: 80 08 40             	orb	$64, (%rax)
ffff80000010c12e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c131: e9 e8 00 00 00       	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c136: 48 b9 0c 82 11 00 00 80 ff ff	movabsq	$-140737487207924, %rcx # imm = 0xFFFF80000011820C
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
ffff80000010c155: 48 b8 50 30 11 00 00 80 ff ff	movabsq	$-140737487228848, %rax # imm = 0xFFFF800000113050
ffff80000010c15f: 0f b6 34 02          	movzbl	(%rdx,%rax), %esi
ffff80000010c163: 0b 31                	orl	(%rcx), %esi
;     shift ^= togglecode[data];
ffff80000010c165: 48 b8 50 31 11 00 00 80 ff ff	movabsq	$-140737487228592, %rax # imm = 0xFFFF800000113150
ffff80000010c16f: 0f b6 04 02          	movzbl	(%rdx,%rax), %eax
ffff80000010c173: 31 f0                	xorl	%esi, %eax
ffff80000010c175: 89 01                	movl	%eax, (%rcx)
;     c = charcode[shift & (CTL | SHIFT)][data];
ffff80000010c177: 89 c1                	movl	%eax, %ecx
ffff80000010c179: 83 e1 03             	andl	$3, %ecx
ffff80000010c17c: 48 be 30 30 11 00 00 80 ff ff	movabsq	$-140737487228880, %rsi # imm = 0xFFFF800000113030
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
ffff80000010c1b3: 48 be 50 30 11 00 00 80 ff ff	movabsq	$-140737487228848, %rsi # imm = 0xFFFF800000113050
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
ffff80000010c1f0: 48 bf 7a 3e 11 00 00 80 ff ff	movabsq	$-140737487225222, %rdi # imm = 0xFFFF800000113E7A
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
ffff80000010c24c: 48 b9 04 80 11 00 00 80 ff ff	movabsq	$-140737487208444, %rcx # imm = 0xFFFF800000118004
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
ffff80000010c2b8: 48 b8 00 80 11 00 00 80 ff ff	movabsq	$-140737487208448, %rax # imm = 0xFFFF800000118000
ffff80000010c2c2: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c2c5: 74 02                	je	0xffff80000010c2c9 <cons_init+0x39>
; }
ffff80000010c2c7: 5d                   	popq	%rbp
ffff80000010c2c8: c3                   	retq
;         cprintf("Serial port does not exist!\n");
ffff80000010c2c9: 48 bf b2 44 11 00 00 80 ff ff	movabsq	$-140737487223630, %rdi # imm = 0xFFFF8000001144B2
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
ffff80000010c339: 49 be 10 82 11 00 00 80 ff ff	movabsq	$-140737487207920, %r14 # imm = 0xFFFF800000118210
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
ffff80000010c391: 48 b9 18 82 11 00 00 80 ff ff	movabsq	$-140737487207912, %rcx # imm = 0xFFFF800000118218
ffff80000010c39b: 4c 89 29             	movq	%r13, (%rcx)
;     crt_pos = pos;
ffff80000010c39e: 48 b9 20 82 11 00 00 80 ff ff	movabsq	$-140737487207904, %rcx # imm = 0xFFFF800000118220
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
ffff80000010c45e: 48 b8 00 80 11 00 00 80 ff ff	movabsq	$-140737487208448, %rax # imm = 0xFFFF800000118000
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
ffff80000010c64d: 49 be 20 82 11 00 00 80 ff ff	movabsq	$-140737487207904, %r14 # imm = 0xFFFF800000118220
ffff80000010c657: 80 f9 05             	cmpb	$5, %cl
ffff80000010c65a: 0f 87 8f 00 00 00    	ja	0xffff80000010c6ef <cga_putc+0xbf>
ffff80000010c660: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010c663: 48 ba 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rdx # imm = 0xFFFF800000113000
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
ffff80000010c68c: 48 ba 18 82 11 00 00 80 ff ff	movabsq	$-140737487207912, %rdx # imm = 0xFFFF800000118218
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
ffff80000010c6ef: 48 b9 18 82 11 00 00 80 ff ff	movabsq	$-140737487207912, %rcx # imm = 0xFFFF800000118218
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
ffff80000010c716: 48 bb 18 82 11 00 00 80 ff ff	movabsq	$-140737487207912, %rbx # imm = 0xFFFF800000118218
ffff80000010c720: 48 8b 3b             	movq	(%rbx), %rdi
ffff80000010c723: 48 8d b7 a0 00 00 00 	leaq	160(%rdi), %rsi
ffff80000010c72a: 48 b8 30 03 11 00 00 80 ff ff	movabsq	$-140737487240400, %rax # imm = 0xFFFF800000110330
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
ffff80000010c759: 48 bb 10 82 11 00 00 80 ff ff	movabsq	$-140737487207920, %rbx # imm = 0xFFFF800000118210
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
ffff80000010c7f9: 48 bf 00 73 11 00 00 80 ff ff	movabsq	$-140737487211776, %rdi # imm = 0xFFFF800000117300
ffff80000010c803: 48 ba 00 87 11 00 00 80 ff ff	movabsq	$-140737487206656, %rdx # imm = 0xFFFF800000118700
ffff80000010c80d: 48 29 fa             	subq	%rdi, %rdx
ffff80000010c810: 48 b8 e0 02 11 00 00 80 ff ff	movabsq	$-140737487240480, %rax # imm = 0xFFFF8000001102E0
ffff80000010c81a: 31 f6                	xorl	%esi, %esi
ffff80000010c81c: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010c81e: 48 b8 90 c2 10 00 00 80 ff ff	movabsq	$-140737487256944, %rax # imm = 0xFFFF80000010C290
ffff80000010c828: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c82a: 48 bf ed 43 11 00 00 80 ff ff	movabsq	$-140737487223827, %rdi # imm = 0xFFFF8000001143ED
ffff80000010c834: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010c83e: 31 c0                	xorl	%eax, %eax
ffff80000010c840: ff d1                	callq	*%rcx
; 	mem_init(boot_info);
ffff80000010c842: 48 b8 c0 e0 10 00 00 80 ff ff	movabsq	$-140737487249216, %rax # imm = 0xFFFF80000010E0C0
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
ffff80000010c887: 48 b8 28 82 11 00 00 80 ff ff	movabsq	$-140737487207896, %rax # imm = 0xFFFF800000118228
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
ffff80000010c8c2: 48 bf 79 3c 11 00 00 80 ff ff	movabsq	$-140737487225735, %rdi # imm = 0xFFFF800000113C79
ffff80000010c8cc: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff80000010c8d6: 31 c0                	xorl	%eax, %eax
ffff80000010c8d8: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c8db: 48 b8 a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rax # imm = 0xFFFF80000010D3A0
ffff80000010c8e5: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c8e9: 48 89 df             	movq	%rbx, %rdi
ffff80000010c8ec: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c8ee: 48 bf ed 43 11 00 00 80 ff ff	movabsq	$-140737487223827, %rdi # imm = 0xFFFF8000001143ED
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
ffff80000010c95d: 48 bf ef 43 11 00 00 80 ff ff	movabsq	$-140737487223825, %rdi # imm = 0xFFFF8000001143EF
ffff80000010c967: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff80000010c971: 31 c0                	xorl	%eax, %eax
ffff80000010c973: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c976: 48 b8 a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rax # imm = 0xFFFF80000010D3A0
ffff80000010c980: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c984: 48 89 df             	movq	%rbx, %rdi
ffff80000010c987: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c989: 48 bf ed 43 11 00 00 80 ff ff	movabsq	$-140737487223827, %rdi # imm = 0xFFFF8000001143ED
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
ffff80000010c9c0: 49 bf 50 32 11 00 00 80 ff ff	movabsq	$-140737487228336, %r15 # imm = 0xFFFF800000113250
ffff80000010c9ca: 49 be 28 44 11 00 00 80 ff ff	movabsq	$-140737487223768, %r14 # imm = 0xFFFF800000114428
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
ffff80000010ca1b: 48 bf 03 40 11 00 00 80 ff ff	movabsq	$-140737487224829, %rdi # imm = 0xFFFF800000114003
ffff80000010ca25: 49 bc 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r12 # imm = 0xFFFF80000010D400
ffff80000010ca2f: 31 c0                	xorl	%eax, %eax
ffff80000010ca31: 41 ff d4             	callq	*%r12
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010ca34: 48 bf 6f 45 11 00 00 80 ff ff	movabsq	$-140737487223441, %rdi # imm = 0xFFFF80000011456F
ffff80000010ca3e: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ca48: 31 c0                	xorl	%eax, %eax
ffff80000010ca4a: 41 ff d4             	callq	*%r12
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010ca4d: 48 bf cd 3a 11 00 00 80 ff ff	movabsq	$-140737487226163, %rdi # imm = 0xFFFF800000113ACD
ffff80000010ca57: 49 bf 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r15 # imm = 0x800000000000
ffff80000010ca61: 49 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %r14 # imm = 0xFFFF800000100000
ffff80000010ca6b: 4b 8d 14 3e          	leaq	(%r14,%r15), %rdx
ffff80000010ca6f: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ca72: 31 c0                	xorl	%eax, %eax
ffff80000010ca74: 41 ff d4             	callq	*%r12
; 	cprintf("  etext  %016p (virt)  %016p (phys)\n", etext, etext - KERNEL_VMA);
ffff80000010ca77: 48 bf 7b 3d 11 00 00 80 ff ff	movabsq	$-140737487225477, %rdi # imm = 0xFFFF800000113D7B
ffff80000010ca81: 48 be f3 2e 11 00 00 80 ff ff	movabsq	$-140737487229197, %rsi # imm = 0xFFFF800000112EF3
ffff80000010ca8b: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010ca8f: 31 c0                	xorl	%eax, %eax
ffff80000010ca91: 41 ff d4             	callq	*%r12
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010ca94: 48 bf 91 3c 11 00 00 80 ff ff	movabsq	$-140737487225711, %rdi # imm = 0xFFFF800000113C91
ffff80000010ca9e: 48 be 00 73 11 00 00 80 ff ff	movabsq	$-140737487211776, %rsi # imm = 0xFFFF800000117300
ffff80000010caa8: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010caac: 31 c0                	xorl	%eax, %eax
ffff80000010caae: 41 ff d4             	callq	*%r12
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cab1: 48 bf f2 3a 11 00 00 80 ff ff	movabsq	$-140737487226126, %rdi # imm = 0xFFFF800000113AF2
ffff80000010cabb: 48 bb 00 87 11 00 00 80 ff ff	movabsq	$-140737487206656, %rbx # imm = 0xFFFF800000118700
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
ffff80000010caf6: 48 bf b1 41 11 00 00 80 ff ff	movabsq	$-140737487224399, %rdi # imm = 0xFFFF8000001141B1
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
ffff80000010cb2d: 48 bf 70 38 11 00 00 80 ff ff	movabsq	$-140737487226768, %rdi # imm = 0xFFFF800000113870
ffff80000010cb37: 49 bc 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r12 # imm = 0xFFFF80000010D400
ffff80000010cb41: 31 c0                	xorl	%eax, %eax
ffff80000010cb43: 41 ff d4             	callq	*%r12
; 	while (rbp) {
ffff80000010cb46: 48 85 db             	testq	%rbx, %rbx
ffff80000010cb49: 0f 84 97 00 00 00    	je	0xffff80000010cbe6 <mon_backtrace+0xd6>
ffff80000010cb4f: 49 be 75 42 11 00 00 80 ff ff	movabsq	$-140737487224203, %r14 # imm = 0xFFFF800000114275
ffff80000010cb59: 49 bf ed 43 11 00 00 80 ff ff	movabsq	$-140737487223827, %r15 # imm = 0xFFFF8000001143ED
ffff80000010cb63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cb6d: 0f 1f 00             	nopl	(%rax)
; 		uintptr_t rip = *(rbp + 1);
ffff80000010cb70: 48 8b 73 08          	movq	8(%rbx), %rsi
; 		cprintf("  RIP: %016p ", rip);
ffff80000010cb74: 48 bf c2 46 11 00 00 80 ff ff	movabsq	$-140737487223102, %rdi # imm = 0xFFFF8000001146C2
ffff80000010cb7e: 31 c0                	xorl	%eax, %eax
ffff80000010cb80: 41 ff d4             	callq	*%r12
; 		cprintf("<no debug info>\t");
ffff80000010cb83: 48 bf 31 44 11 00 00 80 ff ff	movabsq	$-140737487223759, %rdi # imm = 0xFFFF800000114431
ffff80000010cb8d: 31 c0                	xorl	%eax, %eax
ffff80000010cb8f: 41 ff d4             	callq	*%r12
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010cb92: 48 bf 16 43 11 00 00 80 ff ff	movabsq	$-140737487224042, %rdi # imm = 0xFFFF800000114316
ffff80000010cb9c: 48 89 de             	movq	%rbx, %rsi
ffff80000010cb9f: 31 c0                	xorl	%eax, %eax
ffff80000010cba1: 41 ff d4             	callq	*%r12
; 			cprintf("  args ");
ffff80000010cba4: 48 bf b0 3e 11 00 00 80 ff ff	movabsq	$-140737487225168, %rdi # imm = 0xFFFF800000113EB0
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
ffff80000010cc3e: 49 bf e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %r15 # imm = 0xFFFF8000001182E8
ffff80000010cc48: 49 83 3f 00          	cmpq	$0, (%r15)
ffff80000010cc4c: 0f 84 81 00 00 00    	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc52: 49 bc e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %r12 # imm = 0xFFFF8000001182E0
; 	if (!pages || npages == 0) {
ffff80000010cc5c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010cc61: 74 70                	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc63: 48 89 f3             	movq	%rsi, %rbx
; 	if (argc < 3) {
ffff80000010cc66: 83 ff 02             	cmpl	$2, %edi
ffff80000010cc69: 7e 4b                	jle	0xffff80000010ccb6 <mon_pageinfo+0x86>
; 	addr = strtol(argv[2], NULL, 0);
ffff80000010cc6b: 48 8b 7b 10          	movq	16(%rbx), %rdi
ffff80000010cc6f: 48 b8 20 04 11 00 00 80 ff ff	movabsq	$-140737487240160, %rax # imm = 0xFFFF800000110420
ffff80000010cc79: 31 f6                	xorl	%esi, %esi
ffff80000010cc7b: 31 d2                	xorl	%edx, %edx
ffff80000010cc7d: ff d0                	callq	*%rax
ffff80000010cc7f: 49 89 c6             	movq	%rax, %r14
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010cc82: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cc86: 48 be df 41 11 00 00 80 ff ff	movabsq	$-140737487224353, %rsi # imm = 0xFFFF8000001141DF
ffff80000010cc90: 49 bd 10 02 11 00 00 80 ff ff	movabsq	$-140737487240688, %r13 # imm = 0xFFFF800000110210
ffff80000010cc9a: 41 ff d5             	callq	*%r13
ffff80000010cc9d: 85 c0                	testl	%eax, %eax
ffff80000010cc9f: 74 5b                	je	0xffff80000010ccfc <mon_pageinfo+0xcc>
; 	} else if (strcmp(argv[1], "pa") == 0) {
ffff80000010cca1: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cca5: 48 be a1 45 11 00 00 80 ff ff	movabsq	$-140737487223391, %rsi # imm = 0xFFFF8000001145A1
ffff80000010ccaf: 41 ff d5             	callq	*%r13
ffff80000010ccb2: 85 c0                	testl	%eax, %eax
ffff80000010ccb4: 74 5c                	je	0xffff80000010cd12 <mon_pageinfo+0xe2>
ffff80000010ccb6: 48 8b 33             	movq	(%rbx), %rsi
ffff80000010ccb9: 48 bf 17 3b 11 00 00 80 ff ff	movabsq	$-140737487226089, %rdi # imm = 0xFFFF800000113B17
ffff80000010ccc3: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010cccd: 31 c0                	xorl	%eax, %eax
ffff80000010cccf: ff d1                	callq	*%rcx
ffff80000010ccd1: eb 18                	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 		cprintf("error: buddy allocator not set up\n");
ffff80000010ccd3: 48 bf 93 39 11 00 00 80 ff ff	movabsq	$-140737487226477, %rdi # imm = 0xFFFF800000113993
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
ffff80000010cd2e: 48 bf b6 39 11 00 00 80 ff ff	movabsq	$-140737487226442, %rdi # imm = 0xFFFF8000001139B6
ffff80000010cd38: 49 bf 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r15 # imm = 0xFFFF80000010D400
ffff80000010cd42: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cd45: 31 c0                	xorl	%eax, %eax
ffff80000010cd47: 41 ff d7             	callq	*%r15
; 	cprintf("  Physical address: %p\n", page2pa(page));
ffff80000010cd4a: 48 b8 40 ce 10 00 00 80 ff ff	movabsq	$-140737487253952, %rax # imm = 0xFFFF80000010CE40
ffff80000010cd54: 48 89 df             	movq	%rbx, %rdi
ffff80000010cd57: ff d0                	callq	*%rax
ffff80000010cd59: 48 bf c8 39 11 00 00 80 ff ff	movabsq	$-140737487226424, %rdi # imm = 0xFFFF8000001139C8
ffff80000010cd63: 48 89 c6             	movq	%rax, %rsi
ffff80000010cd66: 31 c0                	xorl	%eax, %eax
ffff80000010cd68: 41 ff d7             	callq	*%r15
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010cd6b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000010cd6f: 48 b8 d0 45 11 00 00 80 ff ff	movabsq	$-140737487223344, %rax # imm = 0xFFFF8000001145D0
ffff80000010cd79: 48 be 26 3e 11 00 00 80 ff ff	movabsq	$-140737487225306, %rsi # imm = 0xFFFF800000113E26
ffff80000010cd83: 48 0f 49 f0          	cmovnsq	%rax, %rsi
ffff80000010cd87: 48 bf 86 3e 11 00 00 80 ff ff	movabsq	$-140737487225210, %rdi # imm = 0xFFFF800000113E86
ffff80000010cd91: 31 c0                	xorl	%eax, %eax
ffff80000010cd93: 41 ff d7             	callq	*%r15
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010cd96: 0f b7 73 10          	movzwl	16(%rbx), %esi
ffff80000010cd9a: 48 bf d5 45 11 00 00 80 ff ff	movabsq	$-140737487223339, %rdi # imm = 0xFFFF8000001145D5
ffff80000010cda4: 31 c0                	xorl	%eax, %eax
ffff80000010cda6: 41 ff d7             	callq	*%r15
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010cda9: 0f b6 73 12          	movzbl	18(%rbx), %esi
ffff80000010cdad: 83 e6 7f             	andl	$127, %esi
ffff80000010cdb0: 48 bf 83 46 11 00 00 80 ff ff	movabsq	$-140737487223165, %rdi # imm = 0xFFFF800000114683
ffff80000010cdba: 31 c0                	xorl	%eax, %eax
ffff80000010cdbc: 41 ff d7             	callq	*%r15
ffff80000010cdbf: e9 27 ff ff ff       	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 			cprintf("error: index %u out of range.\n", addr);
ffff80000010cdc4: 48 bf b6 3c 11 00 00 80 ff ff	movabsq	$-140737487225674, %rdi # imm = 0xFFFF800000113CB6
ffff80000010cdce: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010cdd8: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cddb: e9 ed fe ff ff       	jmp	0xffff80000010cccd <mon_pageinfo+0x9d>

ffff80000010cde0 <pa2page>:
; {
ffff80000010cde0: 55                   	pushq	%rbp
ffff80000010cde1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010cde4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010cde8: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010cdf2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010cdf5: 73 16                	jae	0xffff80000010ce0d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010cdf7: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010ce01: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ce05: 48 03 38             	addq	(%rax), %rdi
ffff80000010ce08: 48 89 f8             	movq	%rdi, %rax
ffff80000010ce0b: 5d                   	popq	%rbp
ffff80000010ce0c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010ce0d: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010ce17: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
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
ffff80000010ce47: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
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
ffff80000010ce64: 48 b8 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rax # imm = 0xFFFF8000001182F0
ffff80000010ce6e: 48 8b 38             	movq	(%rax), %rdi
ffff80000010ce71: 48 b8 10 05 11 00 00 80 ff ff	movabsq	$-140737487239920, %rax # imm = 0xFFFF800000110510
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
ffff80000010ce9e: 48 bf 92 43 11 00 00 80 ff ff	movabsq	$-140737487223918, %rdi # imm = 0xFFFF800000114392
ffff80000010cea8: 48 bb 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rbx # imm = 0xFFFF80000010D400
ffff80000010ceb2: 31 c0                	xorl	%eax, %eax
ffff80000010ceb4: ff d3                	callq	*%rbx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010ceb6: 48 bf a0 3d 11 00 00 80 ff ff	movabsq	$-140737487225440, %rdi # imm = 0xFFFF800000113DA0
ffff80000010cec0: 31 c0                	xorl	%eax, %eax
ffff80000010cec2: ff d3                	callq	*%rbx
ffff80000010cec4: 49 bf 1c 40 11 00 00 80 ff ff	movabsq	$-140737487224804, %r15 # imm = 0xFFFF80000011401C
ffff80000010cece: 48 bb 90 ff 10 00 00 80 ff ff	movabsq	$-140737487241328, %rbx # imm = 0xFFFF80000010FF90
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
ffff80000010cf39: 49 bc 44 47 11 00 00 80 ff ff	movabsq	$-140737487222972, %r12 # imm = 0xFFFF800000114744
ffff80000010cf43: 49 bd 80 02 11 00 00 80 ff ff	movabsq	$-140737487240576, %r13 # imm = 0xFFFF800000110280
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
ffff80000010cffe: 49 bc 50 32 11 00 00 80 ff ff	movabsq	$-140737487228336, %r12 # imm = 0xFFFF800000113250
ffff80000010d008: 49 bd 10 02 11 00 00 80 ff ff	movabsq	$-140737487240688, %r13 # imm = 0xFFFF800000110210
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
ffff80000010d047: 48 bf d4 38 11 00 00 80 ff ff	movabsq	$-140737487226668, %rdi # imm = 0xFFFF8000001138D4
ffff80000010d051: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d05b: 31 db                	xorl	%ebx, %ebx
ffff80000010d05d: 31 c0                	xorl	%eax, %eax
ffff80000010d05f: ff d1                	callq	*%rcx
ffff80000010d061: eb 39                	jmp	0xffff80000010d09c <runcmd+0x18c>
; 			cprintf("Too many arguments (max %d)\n", MAXARGS);
ffff80000010d063: 48 bf 93 3e 11 00 00 80 ff ff	movabsq	$-140737487225197, %rdi # imm = 0xFFFF800000113E93
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
ffff80000010d3bf: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
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
ffff80000010d454: 48 b9 30 82 11 00 00 80 ff ff	movabsq	$-140737487207888, %rcx # imm = 0xFFFF800000118230
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
ffff80000010d48e: 48 b8 00 87 11 00 00 80 ff ff	movabsq	$-140737487206656, %rax # imm = 0xFFFF800000118700
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
ffff80000010d4b0: 48 bf 49 47 11 00 00 80 ff ff	movabsq	$-140737487222967, %rdi # imm = 0xFFFF800000114749
ffff80000010d4ba: 48 ba 06 46 11 00 00 80 ff ff	movabsq	$-140737487223290, %rdx # imm = 0xFFFF800000114606
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
ffff80000010d582: 48 bf 19 46 11 00 00 80 ff ff	movabsq	$-140737487223271, %rdi # imm = 0xFFFF800000114619
ffff80000010d58c: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d596: 31 c0                	xorl	%eax, %eax
ffff80000010d598: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d59a: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d59f: 74 6a                	je	0xffff80000010d60b <show_boot_mmap+0xab>
ffff80000010d5a1: 49 83 c5 10          	addq	$16, %r13
ffff80000010d5a5: 49 bf 2b 46 11 00 00 80 ff ff	movabsq	$-140737487223253, %r15 # imm = 0xFFFF80000011462B
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
ffff80000010d5ea: 48 b9 b8 3e 11 00 00 80 ff ff	movabsq	$-140737487225160, %rcx # imm = 0xFFFF800000113EB8
ffff80000010d5f4: 83 f8 04             	cmpl	$4, %eax
ffff80000010d5f7: 77 c7                	ja	0xffff80000010d5c0 <show_boot_mmap+0x60>
ffff80000010d5f9: 48 98                	cltq
ffff80000010d5fb: 48 b9 e0 32 11 00 00 80 ff ff	movabsq	$-140737487228192, %rcx # imm = 0xFFFF8000001132E0
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
ffff80000010d62e: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
ffff80000010d638: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010d63b: 73 0f                	jae	0xffff80000010d64c <_kaddr+0x2c>
ffff80000010d63d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010d647: 48 01 c8             	addq	%rcx, %rax
ffff80000010d64a: 5d                   	popq	%rbp
ffff80000010d64b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010d64c: 48 bf 49 47 11 00 00 80 ff ff	movabsq	$-140737487222967, %rdi # imm = 0xFFFF800000114749
ffff80000010d656: 48 ba 86 42 11 00 00 80 ff ff	movabsq	$-140737487224186, %rdx # imm = 0xFFFF800000114286
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
ffff80000010d692: 48 b9 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %rcx # imm = 0xFFFF800000118240
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
ffff80000010d6ce: 48 bf 3b 3d 11 00 00 80 ff ff	movabsq	$-140737487225541, %rdi # imm = 0xFFFF800000113D3B
ffff80000010d6d8: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010d6e2: 31 c0                	xorl	%eax, %eax
ffff80000010d6e4: ff d1                	callq	*%rcx
ffff80000010d6e6: 49 bd 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %r13 # imm = 0xFFFF80000010D680
ffff80000010d6f0: 49 be 42 44 11 00 00 80 ff ff	movabsq	$-140737487223742, %r14 # imm = 0xFFFF800000114442
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
ffff80000010d73f: 48 bf 33 3b 11 00 00 80 ff ff	movabsq	$-140737487226061, %rdi # imm = 0xFFFF800000113B33
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
ffff80000010d7f4: 49 bc 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r12 # imm = 0xFFFF800000118240
ffff80000010d7fe: 49 bd b0 f1 10 00 00 80 ff ff	movabsq	$-140737487244880, %r13 # imm = 0xFFFF80000010F1B0
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
ffff80000010d88e: 48 bf c5 3d 11 00 00 80 ff ff	movabsq	$-140737487225403, %rdi # imm = 0xFFFF800000113DC5
ffff80000010d898: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010d8a2: 48 b9 62 41 11 00 00 80 ff ff	movabsq	$-140737487224478, %rcx # imm = 0xFFFF800000114162
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
ffff80000010d8c7: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
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
ffff80000010d8e8: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010d8f2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010d8f5: 73 16                	jae	0xffff80000010d90d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010d8f7: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010d901: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010d905: 48 03 38             	addq	(%rax), %rdi
ffff80000010d908: 48 89 f8             	movq	%rdi, %rax
ffff80000010d90b: 5d                   	popq	%rbp
ffff80000010d90c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010d90d: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010d917: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
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
ffff80000010d9e2: 48 b8 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %rax # imm = 0xFFFF800000118240
ffff80000010d9ec: 49 8b 3c 06          	movq	(%r14,%rax), %rdi
ffff80000010d9f0: 49 01 c6             	addq	%rax, %r14
ffff80000010d9f3: 4c 39 f7             	cmpq	%r14, %rdi
ffff80000010d9f6: 74 37                	je	0xffff80000010da2f <buddy_merge+0xef>
ffff80000010d9f8: 4c 89 eb             	movq	%r13, %rbx
ffff80000010d9fb: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010d9fe: eb 20                	jmp	0xffff80000010da20 <buddy_merge+0xe0>
; 				list_del(entry);
ffff80000010da00: 48 b8 90 f1 10 00 00 80 ff ff	movabsq	$-140737487244912, %rax # imm = 0xFFFF80000010F190
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
ffff80000010da5d: 48 b8 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %rax # imm = 0xFFFF800000118240
ffff80000010da67: 48 01 c7             	addq	%rax, %rdi
ffff80000010da6a: 4c 89 ee             	movq	%r13, %rsi
ffff80000010da6d: 48 b8 70 f1 10 00 00 80 ff ff	movabsq	$-140737487244944, %rax # imm = 0xFFFF80000010F170
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
ffff80000010daa1: 48 bf c5 3d 11 00 00 80 ff ff	movabsq	$-140737487225403, %rdi # imm = 0xFFFF800000113DC5
ffff80000010daab: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010dab5: 48 b9 43 3b 11 00 00 80 ff ff	movabsq	$-140737487226045, %rcx # imm = 0xFFFF800000113B43
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
ffff80000010db0e: 49 bc 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r12 # imm = 0xFFFF800000118240
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
ffff80000010db64: 48 b8 90 f1 10 00 00 80 ff ff	movabsq	$-140737487244912, %rax # imm = 0xFFFF80000010F190
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
ffff80000010dbe8: 48 b9 e0 02 11 00 00 80 ff ff	movabsq	$-140737487240480, %rcx # imm = 0xFFFF8000001102E0
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
ffff80000010dc62: 48 bf 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %rdi # imm = 0xFFFF800000118240
ffff80000010dc6c: 48 01 cf             	addq	%rcx, %rdi
ffff80000010dc6f: 48 b8 70 f1 10 00 00 80 ff ff	movabsq	$-140737487244944, %rax # imm = 0xFFFF80000010F170
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
ffff80000010dc94: 48 bf c5 3d 11 00 00 80 ff ff	movabsq	$-140737487225403, %rdi # imm = 0xFFFF800000113DC5
ffff80000010dc9e: 48 ba 58 44 11 00 00 80 ff ff	movabsq	$-140737487223720, %rdx # imm = 0xFFFF800000114458
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
ffff80000010dcee: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010dcf8: 4c 8b 20             	movq	(%rax), %r12
ffff80000010dcfb: 49 bf b0 dd 10 00 00 80 ff ff	movabsq	$-140737487250000, %r15 # imm = 0xFFFF80000010DDB0
ffff80000010dd05: 49 be e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %r14 # imm = 0xFFFF8000001182E8
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
ffff80000010dd4c: 49 bc 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r12 # imm = 0xFFFF800000118240
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
ffff80000010ddc5: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
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
ffff80000010de18: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
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
ffff80000010de78: 48 b8 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rax # imm = 0xFFFF800000110760
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
ffff80000010de9a: 49 be 40 f1 10 00 00 80 ff ff	movabsq	$-140737487244992, %r14 # imm = 0xFFFF80000010F140
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
ffff80000010decf: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
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
ffff80000010defe: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
ffff80000010df08: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010df0b: 73 0f                	jae	0xffff80000010df1c <_kaddr+0x2c>
ffff80000010df0d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010df17: 48 01 c8             	addq	%rcx, %rax
ffff80000010df1a: 5d                   	popq	%rbp
ffff80000010df1b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010df1c: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010df26: 48 ba 86 42 11 00 00 80 ff ff	movabsq	$-140737487224186, %rdx # imm = 0xFFFF800000114286
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
ffff80000010df54: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010df5e: 48 8b 00             	movq	(%rax), %rax
ffff80000010df61: 48 39 f8             	cmpq	%rdi, %rax
ffff80000010df64: 0f 96 c1             	setbe	%cl
ffff80000010df67: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
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
ffff80000010df98: 53                   	pushq	%rbx
ffff80000010df99: 50                   	pushq	%rax
ffff80000010df9a: 48 89 fb             	movq	%rdi, %rbx
; 	page = page_alloc(ALLOC_ZERO);
ffff80000010df9d: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff80000010dfa7: bf 01 00 00 00       	movl	$1, %edi
ffff80000010dfac: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010dfae: 48 85 c0             	testq	%rax, %rax
ffff80000010dfb1: 0f 84 a4 00 00 00    	je	0xffff80000010e05b <pml4_setup+0xcb>
; 	kernel_pml4 = page2kva(page);
ffff80000010dfb7: 48 b9 90 e0 10 00 00 80 ff ff	movabsq	$-140737487249264, %rcx # imm = 0xFFFF80000010E090
ffff80000010dfc1: 48 89 c7             	movq	%rax, %rdi
ffff80000010dfc4: ff d1                	callq	*%rcx
ffff80000010dfc6: 49 be f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r14 # imm = 0xFFFF8000001182F0
ffff80000010dfd0: 49 89 06             	movq	%rax, (%r14)
; 	boot_map_kernel(kernel_pml4, (struct elf*) boot_info->elf_hdr);
ffff80000010dfd3: 48 8b 73 08          	movq	8(%rbx), %rsi
ffff80000010dfd7: 48 b9 50 0a 11 00 00 80 ff ff	movabsq	$-140737487238576, %rcx # imm = 0xFFFF800000110A50
ffff80000010dfe1: 48 89 c7             	movq	%rax, %rdi
ffff80000010dfe4: ff d1                	callq	*%rcx
; 	boot_map_region(kernel_pml4, (void*) KSTACK_TOP, KSTACK_SIZE, (physaddr_t) bootstack, kflags);
ffff80000010dfe6: 49 8b 3e             	movq	(%r14), %rdi
ffff80000010dfe9: 48 b9 00 10 10 00 00 00 00 00	movabsq	$1052672, %rcx  # imm = 0x101000
ffff80000010dff3: 49 bf c0 08 11 00 00 80 ff ff	movabsq	$-140737487238976, %r15 # imm = 0xFFFF8000001108C0
ffff80000010dffd: 48 be 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rsi # imm = 0xFFFFFE8000000000
ffff80000010e007: 48 bb 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rbx # imm = 0x8000000000000003
ffff80000010e011: ba 00 80 00 00       	movl	$32768, %edx            # imm = 0x8000
ffff80000010e016: 49 89 d8             	movq	%rbx, %r8
ffff80000010e019: 41 ff d7             	callq	*%r15
; 	boot_map_region(kernel_pml4, (void*) KPAGES, npages * sizeof(struct page_info*), 0, kflags);
ffff80000010e01c: 49 8b 3e             	movq	(%r14), %rdi
ffff80000010e01f: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010e029: 48 8b 10             	movq	(%rax), %rdx
ffff80000010e02c: 48 c1 e2 03          	shlq	$3, %rdx
ffff80000010e030: 48 be 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rsi # imm = 0xFFFFFF8000000000
ffff80000010e03a: 31 c9                	xorl	%ecx, %ecx
ffff80000010e03c: 49 89 d8             	movq	%rbx, %r8
ffff80000010e03f: 41 ff d7             	callq	*%r15
; 	buddy_migrate();
ffff80000010e042: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010e04c: ff d0                	callq	*%rax
; 	return 0;
ffff80000010e04e: 31 c0                	xorl	%eax, %eax
ffff80000010e050: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e054: 5b                   	popq	%rbx
ffff80000010e055: 41 5e                	popq	%r14
ffff80000010e057: 41 5f                	popq	%r15
ffff80000010e059: 5d                   	popq	%rbp
ffff80000010e05a: c3                   	retq
; 		panic("unable to allocate the PML4!");
ffff80000010e05b: 48 bf a9 42 11 00 00 80 ff ff	movabsq	$-140737487224151, %rdi # imm = 0xFFFF8000001142A9
ffff80000010e065: 48 ba f9 46 11 00 00 80 ff ff	movabsq	$-140737487223047, %rdx # imm = 0xFFFF8000001146F9
ffff80000010e06f: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e079: be 19 00 00 00       	movl	$25, %esi
ffff80000010e07e: 31 c0                	xorl	%eax, %eax
ffff80000010e080: ff d1                	callq	*%rcx
ffff80000010e082: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e08c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e090 <page2kva>:
; {
ffff80000010e090: 55                   	pushq	%rbp
ffff80000010e091: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff80000010e094: 48 b8 10 e6 10 00 00 80 ff ff	movabsq	$-140737487247856, %rax # imm = 0xFFFF80000010E610
ffff80000010e09e: ff d0                	callq	*%rax
ffff80000010e0a0: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010e0aa: 48 b9 00 e4 10 00 00 80 ff ff	movabsq	$-140737487248384, %rcx # imm = 0xFFFF80000010E400
ffff80000010e0b4: be 50 00 00 00       	movl	$80, %esi
ffff80000010e0b9: 48 89 c2             	movq	%rax, %rdx
ffff80000010e0bc: ff d1                	callq	*%rcx
ffff80000010e0be: 5d                   	popq	%rbp
ffff80000010e0bf: c3                   	retq

ffff80000010e0c0 <mem_init>:
; {
ffff80000010e0c0: 55                   	pushq	%rbp
ffff80000010e0c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e0c4: 41 57                	pushq	%r15
ffff80000010e0c6: 41 56                	pushq	%r14
ffff80000010e0c8: 41 54                	pushq	%r12
ffff80000010e0ca: 53                   	pushq	%rbx
ffff80000010e0cb: 49 89 fe             	movq	%rdi, %r14
; 	align_boot_info(boot_info);
ffff80000010e0ce: 48 b8 e0 d4 10 00 00 80 ff ff	movabsq	$-140737487252256, %rax # imm = 0xFFFF80000010D4E0
ffff80000010e0d8: ff d0                	callq	*%rax
ffff80000010e0da: 31 db                	xorl	%ebx, %ebx
ffff80000010e0dc: 49 bf 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r15 # imm = 0xFFFF800000118240
ffff80000010e0e6: 49 bc 40 f1 10 00 00 80 ff ff	movabsq	$-140737487244992, %r12 # imm = 0xFFFF80000010F140
; 		list_init(buddy_free_list + i);
ffff80000010e0f0: 4a 8d 3c 3b          	leaq	(%rbx,%r15), %rdi
ffff80000010e0f4: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010e0f7: 48 83 c3 10          	addq	$16, %rbx
ffff80000010e0fb: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010e102: 75 ec                	jne	0xffff80000010e0f0 <mem_init+0x30>
ffff80000010e104: 41 8b 4e 04          	movl	4(%r14), %ecx
ffff80000010e108: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e10b: 0f 85 b1 00 00 00    	jne	0xffff80000010e1c2 <mem_init+0x102>
ffff80000010e111: 31 c9                	xorl	%ecx, %ecx
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010e113: 48 81 f9 00 00 80 00 	cmpq	$8388608, %rcx          # imm = 0x800000
ffff80000010e11a: bf 00 00 80 00       	movl	$8388608, %edi          # imm = 0x800000
ffff80000010e11f: 48 0f 42 f9          	cmovbq	%rcx, %rdi
ffff80000010e123: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e127: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010e131: 48 89 38             	movq	%rdi, (%rax)
; 	pages = boot_alloc(npages * sizeof *pages);
ffff80000010e134: c1 e7 05             	shll	$5, %edi
ffff80000010e137: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e141: ff d0                	callq	*%rax
ffff80000010e143: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
ffff80000010e14d: 48 89 01             	movq	%rax, (%rcx)
; 	page_init(boot_info);
ffff80000010e150: 48 b8 00 e2 10 00 00 80 ff ff	movabsq	$-140737487248896, %rax # imm = 0xFFFF80000010E200
ffff80000010e15a: 4c 89 f7             	movq	%r14, %rdi
ffff80000010e15d: ff d0                	callq	*%rax
; 	pml4_setup(boot_info);
ffff80000010e15f: 48 b8 90 df 10 00 00 80 ff ff	movabsq	$-140737487249520, %rax # imm = 0xFFFF80000010DF90
ffff80000010e169: 4c 89 f7             	movq	%r14, %rdi
ffff80000010e16c: ff d0                	callq	*%rax
; 	uint64_t efer = read_msr(MSR_EFER);
ffff80000010e16e: 48 b8 c0 e3 10 00 00 80 ff ff	movabsq	$-140737487248448, %rax # imm = 0xFFFF80000010E3C0
ffff80000010e178: ff d0                	callq	*%rax
; 	write_msr(MSR_EFER, efer | MSR_EFER_NXE);
ffff80000010e17a: 48 0d 00 08 00 00    	orq	$2048, %rax             # imm = 0x800
ffff80000010e180: 48 b9 e0 e3 10 00 00 80 ff ff	movabsq	$-140737487248416, %rcx # imm = 0xFFFF80000010E3E0
ffff80000010e18a: 48 89 c7             	movq	%rax, %rdi
ffff80000010e18d: ff d1                	callq	*%rcx
; 	lab2_check_pml4();
ffff80000010e18f: 48 b8 60 2e 11 00 00 80 ff ff	movabsq	$-140737487229344, %rax # imm = 0xFFFF800000112E60
ffff80000010e199: ff d0                	callq	*%rax
; 	panic("stop");
ffff80000010e19b: 48 bf a9 42 11 00 00 80 ff ff	movabsq	$-140737487224151, %rdi # imm = 0xFFFF8000001142A9
ffff80000010e1a5: 48 ba 31 3a 11 00 00 80 ff ff	movabsq	$-140737487226319, %rdx # imm = 0xFFFF800000113A31
ffff80000010e1af: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e1b9: be 87 00 00 00       	movl	$135, %esi
ffff80000010e1be: 31 c0                	xorl	%eax, %eax
ffff80000010e1c0: ff d1                	callq	*%rcx
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010e1c2: 41 8b 06             	movl	(%r14), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e1c5: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010e1c9: 48 8d 14 49          	leaq	(%rcx,%rcx,2), %rdx
ffff80000010e1cd: 31 f6                	xorl	%esi, %esi
ffff80000010e1cf: 31 c9                	xorl	%ecx, %ecx
ffff80000010e1d1: eb 1a                	jmp	0xffff80000010e1ed <mem_init+0x12d>
ffff80000010e1d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e1dd: 0f 1f 00             	nopl	(%rax)
ffff80000010e1e0: 48 83 c6 18          	addq	$24, %rsi
ffff80000010e1e4: 48 39 f2             	cmpq	%rsi, %rdx
ffff80000010e1e7: 0f 84 26 ff ff ff    	je	0xffff80000010e113 <mem_init+0x53>
; 		if (entry->type != MMAP_FREE)
ffff80000010e1ed: 83 7c 30 10 01       	cmpl	$1, 16(%rax,%rsi)
ffff80000010e1f2: 75 ec                	jne	0xffff80000010e1e0 <mem_init+0x120>
; 		highest_addr = entry->addr + entry->len;
ffff80000010e1f4: 48 8b 4c 30 08       	movq	8(%rax,%rsi), %rcx
ffff80000010e1f9: 48 03 0c 30          	addq	(%rax,%rsi), %rcx
ffff80000010e1fd: eb e1                	jmp	0xffff80000010e1e0 <mem_init+0x120>
ffff80000010e1ff: 90                   	nop

ffff80000010e200 <page_init>:
; {
ffff80000010e200: 55                   	pushq	%rbp
ffff80000010e201: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e204: 41 57                	pushq	%r15
ffff80000010e206: 41 56                	pushq	%r14
ffff80000010e208: 41 55                	pushq	%r13
ffff80000010e20a: 41 54                	pushq	%r12
ffff80000010e20c: 53                   	pushq	%rbx
ffff80000010e20d: 48 83 ec 18          	subq	$24, %rsp
ffff80000010e211: 48 89 7d d0          	movq	%rdi, -48(%rbp)
; 	for (i = 0; i < npages; ++i) {
ffff80000010e215: 49 be e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %r14 # imm = 0xFFFF8000001182E0
ffff80000010e21f: 49 83 3e 00          	cmpq	$0, (%r14)
ffff80000010e223: 49 bf e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %r15 # imm = 0xFFFF8000001182E8
ffff80000010e22d: 74 3f                	je	0xffff80000010e26e <page_init+0x6e>
ffff80000010e22f: 31 db                	xorl	%ebx, %ebx
ffff80000010e231: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010e234: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e23e: 66 90                	nop
; 		page = pages + i;
ffff80000010e240: 4d 8b 2f             	movq	(%r15), %r13
; 		list_init(&page->pp_node);
ffff80000010e243: 4a 8d 3c 2b          	leaq	(%rbx,%r13), %rdi
ffff80000010e247: 48 b8 40 f1 10 00 00 80 ff ff	movabsq	$-140737487244992, %rax # imm = 0xFFFF80000010F140
ffff80000010e251: ff d0                	callq	*%rax
; 		page->pp_ref = 0;
ffff80000010e253: 66 41 c7 44 1d 10 00 00      	movw	$0, 16(%r13,%rbx)
; 		page->pp_order = 0;
ffff80000010e25b: 41 c6 44 1d 12 00    	movb	$0, 18(%r13,%rbx)
; 	for (i = 0; i < npages; ++i) {
ffff80000010e261: 49 83 c4 01          	addq	$1, %r12
ffff80000010e265: 48 83 c3 20          	addq	$32, %rbx
ffff80000010e269: 4d 3b 26             	cmpq	(%r14), %r12
ffff80000010e26c: 72 d2                	jb	0xffff80000010e240 <page_init+0x40>
ffff80000010e26e: 4c 8b 75 d0          	movq	-48(%rbp), %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e272: 41 8b 16             	movl	(%r14), %edx
ffff80000010e275: 48 bf a9 42 11 00 00 80 ff ff	movabsq	$-140737487224151, %rdi # imm = 0xFFFF8000001142A9
ffff80000010e27f: 48 b8 00 e4 10 00 00 80 ff ff	movabsq	$-140737487248384, %rax # imm = 0xFFFF80000010E400
ffff80000010e289: be b3 00 00 00       	movl	$179, %esi
ffff80000010e28e: ff d0                	callq	*%rax
ffff80000010e290: 48 89 c3             	movq	%rax, %rbx
; 	end = PADDR(boot_alloc(0));
ffff80000010e293: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e29d: 31 ff                	xorl	%edi, %edi
ffff80000010e29f: ff d0                	callq	*%rax
ffff80000010e2a1: 48 b9 50 e4 10 00 00 80 ff ff	movabsq	$-140737487248304, %rcx # imm = 0xFFFF80000010E450
ffff80000010e2ab: bf b4 00 00 00       	movl	$180, %edi
ffff80000010e2b0: 48 89 c6             	movq	%rax, %rsi
ffff80000010e2b3: ff d1                	callq	*%rcx
ffff80000010e2b5: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e2b9: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010e2be: 0f 84 df 00 00 00    	je	0xffff80000010e3a3 <page_init+0x1a3>
ffff80000010e2c4: 4c 89 f1             	movq	%r14, %rcx
ffff80000010e2c7: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e2ca: eb 18                	jmp	0xffff80000010e2e4 <page_init+0xe4>
ffff80000010e2cc: 0f 1f 40 00          	nopl	(%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e2d0: 49 83 c5 01          	addq	$1, %r13
ffff80000010e2d4: 48 83 c3 18          	addq	$24, %rbx
ffff80000010e2d8: 8b 41 04             	movl	4(%rcx), %eax
ffff80000010e2db: 49 39 c5             	cmpq	%rax, %r13
ffff80000010e2de: 0f 83 bf 00 00 00    	jae	0xffff80000010e3a3 <page_init+0x1a3>
; 		if((entry->type & MMAP_FREE) == 0){
ffff80000010e2e4: f6 43 10 01          	testb	$1, 16(%rbx)
ffff80000010e2e8: 74 e6                	je	0xffff80000010e2d0 <page_init+0xd0>
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010e2ea: 4c 8b 33             	movq	(%rbx), %r14
ffff80000010e2ed: 48 8b 43 08          	movq	8(%rbx), %rax
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010e2f1: 4c 01 f0             	addq	%r14, %rax
ffff80000010e2f4: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010e2fa: 49 39 c6             	cmpq	%rax, %r14
ffff80000010e2fd: 73 d1                	jae	0xffff80000010e2d0 <page_init+0xd0>
ffff80000010e2ff: 4d 89 f4             	movq	%r14, %r12
ffff80000010e302: 49 c1 ec 07          	shrq	$7, %r12
ffff80000010e306: 49 83 e4 e0          	andq	$-32, %r12
ffff80000010e30a: eb 1a                	jmp	0xffff80000010e326 <page_init+0x126>
ffff80000010e30c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010e310: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010e314: 48 03 03             	addq	(%rbx), %rax
ffff80000010e317: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010e31d: 49 83 c4 20          	addq	$32, %r12
ffff80000010e321: 49 39 c6             	cmpq	%rax, %r14
ffff80000010e324: 73 aa                	jae	0xffff80000010e2d0 <page_init+0xd0>
; 			if(i + PAGE_SIZE > BOOT_MAP_LIM){
ffff80000010e326: 49 81 fe 00 f0 7f 00 	cmpq	$8384512, %r14          # imm = 0x7FF000
ffff80000010e32d: 77 a1                	ja	0xffff80000010e2d0 <page_init+0xd0>
ffff80000010e32f: 4d 89 f7             	movq	%r14, %r15
ffff80000010e332: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
; 			if(i == 0){
ffff80000010e339: 4d 85 ff             	testq	%r15, %r15
ffff80000010e33c: 74 d2                	je	0xffff80000010e310 <page_init+0x110>
; 			if(i == (physaddr_t)boot_info->elf_hdr){
ffff80000010e33e: 4c 3b 79 08          	cmpq	8(%rcx), %r15
ffff80000010e342: 74 cc                	je	0xffff80000010e310 <page_init+0x110>
; 			if(i >= KERNEL_LMA && i < (uint64_t)end){
ffff80000010e344: 49 81 ff 00 00 10 00 	cmpq	$1048576, %r15          # imm = 0x100000
ffff80000010e34b: 72 06                	jb	0xffff80000010e353 <page_init+0x153>
ffff80000010e34d: 4c 3b 7d c8          	cmpq	-56(%rbp), %r15
ffff80000010e351: 72 bd                	jb	0xffff80000010e310 <page_init+0x110>
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010e353: bf d5 00 00 00       	movl	$213, %edi
ffff80000010e358: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010e35c: 48 b8 50 e4 10 00 00 80 ff ff	movabsq	$-140737487248304, %rax # imm = 0xFFFF80000010E450
ffff80000010e366: ff d0                	callq	*%rax
ffff80000010e368: 48 8b 4d d0          	movq	-48(%rbp), %rcx
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010e36c: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010e376: 48 21 d0             	andq	%rdx, %rax
ffff80000010e379: 49 39 c7             	cmpq	%rax, %r15
ffff80000010e37c: 74 92                	je	0xffff80000010e310 <page_init+0x110>
ffff80000010e37e: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010e388: 48 8b 38             	movq	(%rax), %rdi
; 			page_free(pages + page_index);
ffff80000010e38b: 4c 01 e7             	addq	%r12, %rdi
ffff80000010e38e: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010e398: ff d0                	callq	*%rax
ffff80000010e39a: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010e39e: e9 6d ff ff ff       	jmp	0xffff80000010e310 <page_init+0x110>
; }
ffff80000010e3a3: 48 83 c4 18          	addq	$24, %rsp
ffff80000010e3a7: 5b                   	popq	%rbx
ffff80000010e3a8: 41 5c                	popq	%r12
ffff80000010e3aa: 41 5d                	popq	%r13
ffff80000010e3ac: 41 5e                	popq	%r14
ffff80000010e3ae: 41 5f                	popq	%r15
ffff80000010e3b0: 5d                   	popq	%rbp
ffff80000010e3b1: c3                   	retq
ffff80000010e3b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e3bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e3c0 <read_msr>:
; {
ffff80000010e3c0: 55                   	pushq	%rbp
ffff80000010e3c1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff80000010e3c4: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff80000010e3c9: 0f 32                	rdmsr
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff80000010e3cb: 48 c1 e2 20          	shlq	$32, %rdx
ffff80000010e3cf: 89 c0                	movl	%eax, %eax
ffff80000010e3d1: 48 09 d0             	orq	%rdx, %rax
ffff80000010e3d4: 5d                   	popq	%rbp
ffff80000010e3d5: c3                   	retq
ffff80000010e3d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010e3e0 <write_msr>:
; {
ffff80000010e3e0: 55                   	pushq	%rbp
ffff80000010e3e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e3e4: 48 89 f8             	movq	%rdi, %rax
; 		"d" ((uint32_t)((val >> 32) & 0xFFFFFFFF)));
ffff80000010e3e7: 48 89 fa             	movq	%rdi, %rdx
ffff80000010e3ea: 48 c1 ea 20          	shrq	$32, %rdx
; 	asm volatile(
ffff80000010e3ee: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff80000010e3f3: 0f 30                	wrmsr
; }
ffff80000010e3f5: 5d                   	popq	%rbp
ffff80000010e3f6: c3                   	retq
ffff80000010e3f7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e400 <_kaddr>:
; {
ffff80000010e400: 55                   	pushq	%rbp
ffff80000010e401: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e404: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e407: 48 89 d1             	movq	%rdx, %rcx
ffff80000010e40a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010e40e: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
ffff80000010e418: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010e41b: 73 0f                	jae	0xffff80000010e42c <_kaddr+0x2c>
ffff80000010e41d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010e427: 48 01 c8             	addq	%rcx, %rax
ffff80000010e42a: 5d                   	popq	%rbp
ffff80000010e42b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010e42c: 48 ba 86 42 11 00 00 80 ff ff	movabsq	$-140737487224186, %rdx # imm = 0xFFFF800000114286
ffff80000010e436: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e440: 48 89 c1             	movq	%rax, %rcx
ffff80000010e443: 31 c0                	xorl	%eax, %eax
ffff80000010e445: 41 ff d0             	callq	*%r8
ffff80000010e448: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e450 <_paddr>:
; {
ffff80000010e450: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010e453: 48 89 f1             	movq	%rsi, %rcx
ffff80000010e456: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010e45a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010e460: 76 0e                	jbe	0xffff80000010e470 <_paddr+0x20>
ffff80000010e462: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010e46c: 48 01 c8             	addq	%rcx, %rax
ffff80000010e46f: c3                   	retq
ffff80000010e470: 55                   	pushq	%rbp
ffff80000010e471: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e474: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010e476: 48 bf a9 42 11 00 00 80 ff ff	movabsq	$-140737487224151, %rdi # imm = 0xFFFF8000001142A9
ffff80000010e480: 48 ba a5 3b 11 00 00 80 ff ff	movabsq	$-140737487225947, %rdx # imm = 0xFFFF800000113BA5
ffff80000010e48a: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e494: 48 89 c1             	movq	%rax, %rcx
ffff80000010e497: 31 c0                	xorl	%eax, %eax
ffff80000010e499: 41 ff d0             	callq	*%r8
ffff80000010e49c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e4a0 <page_init_ext>:
; {
ffff80000010e4a0: 55                   	pushq	%rbp
ffff80000010e4a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e4a4: 41 57                	pushq	%r15
ffff80000010e4a6: 41 56                	pushq	%r14
ffff80000010e4a8: 41 55                	pushq	%r13
ffff80000010e4aa: 41 54                	pushq	%r12
ffff80000010e4ac: 53                   	pushq	%rbx
ffff80000010e4ad: 50                   	pushq	%rax
ffff80000010e4ae: 48 89 fb             	movq	%rdi, %rbx
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e4b1: 8b 17                	movl	(%rdi), %edx
ffff80000010e4b3: 48 bf a9 42 11 00 00 80 ff ff	movabsq	$-140737487224151, %rdi # imm = 0xFFFF8000001142A9
ffff80000010e4bd: 48 b8 00 e4 10 00 00 80 ff ff	movabsq	$-140737487248384, %rax # imm = 0xFFFF80000010E400
ffff80000010e4c7: be e8 00 00 00       	movl	$232, %esi
ffff80000010e4cc: ff d0                	callq	*%rax
ffff80000010e4ce: 49 89 c7             	movq	%rax, %r15
; 	end = PADDR(boot_alloc(0));
ffff80000010e4d1: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e4db: 31 ff                	xorl	%edi, %edi
ffff80000010e4dd: ff d0                	callq	*%rax
ffff80000010e4df: 48 b9 50 e4 10 00 00 80 ff ff	movabsq	$-140737487248304, %rcx # imm = 0xFFFF80000010E450
ffff80000010e4e9: bf e9 00 00 00       	movl	$233, %edi
ffff80000010e4ee: 48 89 c6             	movq	%rax, %rsi
ffff80000010e4f1: ff d1                	callq	*%rcx
ffff80000010e4f3: 48 89 5d d0          	movq	%rbx, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e4f7: 83 7b 04 00          	cmpl	$0, 4(%rbx)
ffff80000010e4fb: 0f 84 98 00 00 00    	je	0xffff80000010e599 <page_init_ext+0xf9>
ffff80000010e501: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e504: 49 be b0 e5 10 00 00 80 ff ff	movabsq	$-140737487247952, %r14 # imm = 0xFFFF80000010E5B0
ffff80000010e50e: eb 14                	jmp	0xffff80000010e524 <page_init_ext+0x84>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e510: 49 83 c5 01          	addq	$1, %r13
ffff80000010e514: 49 83 c7 18          	addq	$24, %r15
ffff80000010e518: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e51c: 8b 40 04             	movl	4(%rax), %eax
ffff80000010e51f: 49 39 c5             	cmpq	%rax, %r13
ffff80000010e522: 73 75                	jae	0xffff80000010e599 <page_init_ext+0xf9>
; 		if(entry->type != MMAP_FREE) continue;
ffff80000010e524: 41 83 7f 10 01       	cmpl	$1, 16(%r15)
ffff80000010e529: 75 e5                	jne	0xffff80000010e510 <page_init_ext+0x70>
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010e52b: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010e52e: 49 8b 47 08          	movq	8(%r15), %rax
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010e532: 48 01 d8             	addq	%rbx, %rax
ffff80000010e535: 73 1c                	jae	0xffff80000010e553 <page_init_ext+0xb3>
ffff80000010e537: eb d7                	jmp	0xffff80000010e510 <page_init_ext+0x70>
ffff80000010e539: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010e540: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff80000010e547: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010e54b: 49 03 07             	addq	(%r15), %rax
ffff80000010e54e: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e551: 77 bd                	ja	0xffff80000010e510 <page_init_ext+0x70>
; 			if(addr < BOOT_MAP_LIM) continue;
ffff80000010e553: 48 81 fb 00 00 80 00 	cmpq	$8388608, %rbx          # imm = 0x800000
ffff80000010e55a: 72 e4                	jb	0xffff80000010e540 <page_init_ext+0xa0>
; 			struct page_info* page = pa2page(addr);
ffff80000010e55c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e55f: 41 ff d6             	callq	*%r14
ffff80000010e562: 49 89 c4             	movq	%rax, %r12
; 			list_init(&page->pp_node);
ffff80000010e565: 48 89 c7             	movq	%rax, %rdi
ffff80000010e568: 48 b8 40 f1 10 00 00 80 ff ff	movabsq	$-140737487244992, %rax # imm = 0xFFFF80000010F140
ffff80000010e572: ff d0                	callq	*%rax
; 			page->pp_ref = 0;
ffff80000010e574: 66 41 c7 44 24 10 00 00      	movw	$0, 16(%r12)
; 			page->pp_order = 0;
ffff80000010e57c: 41 c6 44 24 12 00    	movb	$0, 18(%r12)
; 			page_free(pa2page(addr));
ffff80000010e582: 48 89 df             	movq	%rbx, %rdi
ffff80000010e585: 41 ff d6             	callq	*%r14
ffff80000010e588: 48 89 c7             	movq	%rax, %rdi
ffff80000010e58b: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010e595: ff d0                	callq	*%rax
ffff80000010e597: eb a7                	jmp	0xffff80000010e540 <page_init_ext+0xa0>
; }
ffff80000010e599: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e59d: 5b                   	popq	%rbx
ffff80000010e59e: 41 5c                	popq	%r12
ffff80000010e5a0: 41 5d                	popq	%r13
ffff80000010e5a2: 41 5e                	popq	%r14
ffff80000010e5a4: 41 5f                	popq	%r15
ffff80000010e5a6: 5d                   	popq	%rbp
ffff80000010e5a7: c3                   	retq
ffff80000010e5a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e5b0 <pa2page>:
; {
ffff80000010e5b0: 55                   	pushq	%rbp
ffff80000010e5b1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e5b4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e5b8: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010e5c2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010e5c5: 73 16                	jae	0xffff80000010e5dd <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010e5c7: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010e5d1: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010e5d5: 48 03 38             	addq	(%rax), %rdi
ffff80000010e5d8: 48 89 f8             	movq	%rdi, %rax
ffff80000010e5db: 5d                   	popq	%rbp
ffff80000010e5dc: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010e5dd: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010e5e7: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
ffff80000010e5f1: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e5fb: be 49 00 00 00       	movl	$73, %esi
ffff80000010e600: 31 c0                	xorl	%eax, %eax
ffff80000010e602: ff d1                	callq	*%rcx
ffff80000010e604: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e60e: 66 90                	nop

ffff80000010e610 <page2pa>:
; {
ffff80000010e610: 55                   	pushq	%rbp
ffff80000010e611: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e614: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010e617: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
ffff80000010e621: 48 2b 01             	subq	(%rcx), %rax
ffff80000010e624: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010e628: 5d                   	popq	%rbp
ffff80000010e629: c3                   	retq
ffff80000010e62a: cc                   	int3
ffff80000010e62b: cc                   	int3
ffff80000010e62c: cc                   	int3
ffff80000010e62d: cc                   	int3
ffff80000010e62e: cc                   	int3
ffff80000010e62f: cc                   	int3

ffff80000010e630 <lab1_check_free_list_avail>:
; {
ffff80000010e630: 55                   	pushq	%rbp
ffff80000010e631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e634: 41 57                	pushq	%r15
ffff80000010e636: 41 56                	pushq	%r14
ffff80000010e638: 41 55                	pushq	%r13
ffff80000010e63a: 41 54                	pushq	%r12
ffff80000010e63c: 53                   	pushq	%rbx
ffff80000010e63d: 50                   	pushq	%rax
ffff80000010e63e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010e641: 49 bc 50 e7 10 00 00 80 ff ff	movabsq	$-140737487247536, %r12 # imm = 0xFFFF80000010E750
ffff80000010e64b: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010e64e: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e651: eb 1b                	jmp	0xffff80000010e66e <lab1_check_free_list_avail+0x3e>
ffff80000010e653: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e65d: 0f 1f 00             	nopl	(%rax)
ffff80000010e660: 4c 8b 7d d0          	movq	-48(%rbp), %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e664: 49 83 c7 01          	addq	$1, %r15
ffff80000010e668: 49 83 ff 0a          	cmpq	$10, %r15
ffff80000010e66c: 74 46                	je	0xffff80000010e6b4 <lab1_check_free_list_avail+0x84>
ffff80000010e66e: 4c 89 7d d0          	movq	%r15, -48(%rbp)
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e672: 49 c1 e7 04          	shlq	$4, %r15
ffff80000010e676: 48 b8 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %rax # imm = 0xFFFF800000118240
ffff80000010e680: 49 8b 1c 07          	movq	(%r15,%rax), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e684: 49 01 c7             	addq	%rax, %r15
ffff80000010e687: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010e68a: 74 d4                	je	0xffff80000010e660 <lab1_check_free_list_avail+0x30>
ffff80000010e68c: 0f 1f 40 00          	nopl	(%rax)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010e690: 48 89 df             	movq	%rbx, %rdi
ffff80000010e693: 41 ff d4             	callq	*%r12
ffff80000010e696: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010e69c: 49 83 d5 00          	adcq	$0, %r13
ffff80000010e6a0: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010e6a6: 49 83 de ff          	sbbq	$-1, %r14
ffff80000010e6aa: 48 8b 1b             	movq	(%rbx), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e6ad: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010e6b0: 75 de                	jne	0xffff80000010e690 <lab1_check_free_list_avail+0x60>
ffff80000010e6b2: eb ac                	jmp	0xffff80000010e660 <lab1_check_free_list_avail+0x30>
; 	assert(nfree_basemem > 0);
ffff80000010e6b4: 4d 85 ed             	testq	%r13, %r13
ffff80000010e6b7: 74 2c                	je	0xffff80000010e6e5 <lab1_check_free_list_avail+0xb5>
; 	assert(nfree_extmem > 0);
ffff80000010e6b9: 4d 85 f6             	testq	%r14, %r14
ffff80000010e6bc: 74 58                	je	0xffff80000010e716 <lab1_check_free_list_avail+0xe6>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010e6be: 48 bf 58 3b 11 00 00 80 ff ff	movabsq	$-140737487226024, %rdi # imm = 0xFFFF800000113B58
ffff80000010e6c8: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010e6d2: 31 c0                	xorl	%eax, %eax
ffff80000010e6d4: ff d1                	callq	*%rcx
; }
ffff80000010e6d6: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e6da: 5b                   	popq	%rbx
ffff80000010e6db: 41 5c                	popq	%r12
ffff80000010e6dd: 41 5d                	popq	%r13
ffff80000010e6df: 41 5e                	popq	%r14
ffff80000010e6e1: 41 5f                	popq	%r15
ffff80000010e6e3: 5d                   	popq	%rbp
ffff80000010e6e4: c3                   	retq
; 	assert(nfree_basemem > 0);
ffff80000010e6e5: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010e6ef: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010e6f9: 48 b9 cf 44 11 00 00 80 ff ff	movabsq	$-140737487223601, %rcx # imm = 0xFFFF8000001144CF
ffff80000010e703: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e70d: be 21 00 00 00       	movl	$33, %esi
ffff80000010e712: 31 c0                	xorl	%eax, %eax
ffff80000010e714: ff d3                	callq	*%rbx
; 	assert(nfree_extmem > 0);
ffff80000010e716: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010e720: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010e72a: 48 b9 e3 41 11 00 00 80 ff ff	movabsq	$-140737487224349, %rcx # imm = 0xFFFF8000001141E3
ffff80000010e734: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e73e: be 22 00 00 00       	movl	$34, %esi
ffff80000010e743: 31 c0                	xorl	%eax, %eax
ffff80000010e745: ff d3                	callq	*%rbx
ffff80000010e747: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e750 <page2pa>:
; {
ffff80000010e750: 55                   	pushq	%rbp
ffff80000010e751: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e754: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010e757: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
ffff80000010e761: 48 2b 01             	subq	(%rcx), %rax
ffff80000010e764: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010e768: 5d                   	popq	%rbp
ffff80000010e769: c3                   	retq
ffff80000010e76a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e770 <lab1_check_free_list_order>:
; {
ffff80000010e770: 55                   	pushq	%rbp
ffff80000010e771: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e774: 31 c9                	xorl	%ecx, %ecx
ffff80000010e776: 49 b8 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r8 # imm = 0xFFFF800000118240
ffff80000010e780: 45 31 c9             	xorl	%r9d, %r9d
ffff80000010e783: eb 15                	jmp	0xffff80000010e79a <lab1_check_free_list_order+0x2a>
ffff80000010e785: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e78f: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e790: 49 83 c1 01          	addq	$1, %r9
ffff80000010e794: 49 83 f9 0a          	cmpq	$10, %r9
ffff80000010e798: 74 32                	je	0xffff80000010e7cc <lab1_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e79a: 4c 89 ce             	movq	%r9, %rsi
ffff80000010e79d: 48 c1 e6 04          	shlq	$4, %rsi
ffff80000010e7a1: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e7a5: 4c 01 c6             	addq	%r8, %rsi
ffff80000010e7a8: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010e7ab: 74 e3                	je	0xffff80000010e790 <lab1_check_free_list_order+0x20>
ffff80000010e7ad: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff80000010e7b0: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010e7b4: 83 e0 7f             	andl	$127, %eax
ffff80000010e7b7: 31 d2                	xorl	%edx, %edx
ffff80000010e7b9: 49 39 c1             	cmpq	%rax, %r9
ffff80000010e7bc: 0f 95 c2             	setne	%dl
ffff80000010e7bf: 48 01 d1             	addq	%rdx, %rcx
ffff80000010e7c2: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010e7c5: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010e7c8: 75 e6                	jne	0xffff80000010e7b0 <lab1_check_free_list_order+0x40>
ffff80000010e7ca: eb c4                	jmp	0xffff80000010e790 <lab1_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000010e7cc: 48 85 c9             	testq	%rcx, %rcx
ffff80000010e7cf: 75 1a                	jne	0xffff80000010e7eb <lab1_check_free_list_order+0x7b>
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010e7d1: 48 bf 24 43 11 00 00 80 ff ff	movabsq	$-140737487224028, %rdi # imm = 0xFFFF800000114324
ffff80000010e7db: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010e7e5: 31 c0                	xorl	%eax, %eax
ffff80000010e7e7: ff d1                	callq	*%rcx
; }
ffff80000010e7e9: 5d                   	popq	%rbp
ffff80000010e7ea: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000010e7eb: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010e7f5: 48 ba a9 45 11 00 00 80 ff ff	movabsq	$-140737487223383, %rdx # imm = 0xFFFF8000001145A9
ffff80000010e7ff: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e809: be 3b 00 00 00       	movl	$59, %esi
ffff80000010e80e: 31 c0                	xorl	%eax, %eax
ffff80000010e810: 41 ff d0             	callq	*%r8
ffff80000010e813: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e81d: 0f 1f 00             	nopl	(%rax)

ffff80000010e820 <lab1_check_memory_layout>:
; {
ffff80000010e820: 55                   	pushq	%rbp
ffff80000010e821: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e824: 41 57                	pushq	%r15
ffff80000010e826: 41 56                	pushq	%r14
ffff80000010e828: 41 55                	pushq	%r13
ffff80000010e82a: 41 54                	pushq	%r12
ffff80000010e82c: 53                   	pushq	%rbx
ffff80000010e82d: 50                   	pushq	%rax
ffff80000010e82e: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e831: 8b 3f                	movl	(%rdi), %edi
ffff80000010e833: 48 b8 a0 e9 10 00 00 80 ff ff	movabsq	$-140737487246944, %rax # imm = 0xFFFF80000010E9A0
ffff80000010e83d: ff d0                	callq	*%rax
ffff80000010e83f: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff80000010e842: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010e84c: 31 ff                	xorl	%edi, %edi
ffff80000010e84e: ff d0                	callq	*%rax
ffff80000010e850: 48 b9 00 ea 10 00 00 80 ff ff	movabsq	$-140737487246848, %rcx # imm = 0xFFFF80000010EA00
ffff80000010e85a: bf 49 00 00 00       	movl	$73, %edi
ffff80000010e85f: 48 89 c6             	movq	%rax, %rsi
ffff80000010e862: ff d1                	callq	*%rcx
ffff80000010e864: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010e868: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010e86d: 0f 84 c6 00 00 00    	je	0xffff80000010e939 <lab1_check_memory_layout+0x119>
ffff80000010e873: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e876: eb 1d                	jmp	0xffff80000010e895 <lab1_check_memory_layout+0x75>
ffff80000010e878: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010e880: 49 83 c7 01          	addq	$1, %r15
ffff80000010e884: 49 83 c4 18          	addq	$24, %r12
ffff80000010e888: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010e88c: 49 39 c7             	cmpq	%rax, %r15
ffff80000010e88f: 0f 83 a4 00 00 00    	jae	0xffff80000010e939 <lab1_check_memory_layout+0x119>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e895: 49 8b 1c 24          	movq	(%r12), %rbx
ffff80000010e899: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e89e: 48 01 d8             	addq	%rbx, %rax
ffff80000010e8a1: eb 28                	jmp	0xffff80000010e8cb <lab1_check_memory_layout+0xab>
ffff80000010e8a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e8ad: 0f 1f 00             	nopl	(%rax)
; 			    page->pp_free) {
ffff80000010e8b0: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff80000010e8b5: 0f 88 a5 00 00 00    	js	0xffff80000010e960 <lab1_check_memory_layout+0x140>
; 		     pa += PAGE_SIZE) {
ffff80000010e8bb: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010e8c2: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010e8c7: 49 03 04 24          	addq	(%r12), %rax
ffff80000010e8cb: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e8ce: 73 b0                	jae	0xffff80000010e880 <lab1_check_memory_layout+0x60>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010e8d0: 48 81 fb ff ff 7f 00 	cmpq	$8388607, %rbx          # imm = 0x7FFFFF
ffff80000010e8d7: 77 e2                	ja	0xffff80000010e8bb <lab1_check_memory_layout+0x9b>
; 			page = pa2page(pa);
ffff80000010e8d9: 48 89 df             	movq	%rbx, %rdi
ffff80000010e8dc: 48 b8 50 ea 10 00 00 80 ff ff	movabsq	$-140737487246768, %rax # imm = 0xFFFF80000010EA50
ffff80000010e8e6: ff d0                	callq	*%rax
ffff80000010e8e8: 49 89 c5             	movq	%rax, %r13
; 			if ((pa == 0 ||
ffff80000010e8eb: 48 85 db             	testq	%rbx, %rbx
ffff80000010e8ee: 74 c0                	je	0xffff80000010e8b0 <lab1_check_memory_layout+0x90>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010e8f0: bf 54 00 00 00       	movl	$84, %edi
ffff80000010e8f5: 4c 89 f6             	movq	%r14, %rsi
ffff80000010e8f8: 48 b8 00 ea 10 00 00 80 ff ff	movabsq	$-140737487246848, %rax # imm = 0xFFFF80000010EA00
ffff80000010e902: ff d0                	callq	*%rax
ffff80000010e904: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000010e90e: 48 21 c8             	andq	%rcx, %rax
ffff80000010e911: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010e914: 74 9a                	je	0xffff80000010e8b0 <lab1_check_memory_layout+0x90>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010e916: 49 3b 5e 08          	cmpq	8(%r14), %rbx
ffff80000010e91a: 74 94                	je	0xffff80000010e8b0 <lab1_check_memory_layout+0x90>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010e91c: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000010e923: 72 06                	jb	0xffff80000010e92b <lab1_check_memory_layout+0x10b>
ffff80000010e925: 48 3b 5d d0          	cmpq	-48(%rbp), %rbx
ffff80000010e929: 72 85                	jb	0xffff80000010e8b0 <lab1_check_memory_layout+0x90>
; 			    entry->type != MMAP_FREE) &&
ffff80000010e92b: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff80000010e931: 0f 85 79 ff ff ff    	jne	0xffff80000010e8b0 <lab1_check_memory_layout+0x90>
ffff80000010e937: eb 82                	jmp	0xffff80000010e8bb <lab1_check_memory_layout+0x9b>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010e939: 48 bf c9 3b 11 00 00 80 ff ff	movabsq	$-140737487225911, %rdi # imm = 0xFFFF800000113BC9
ffff80000010e943: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010e94d: 31 c0                	xorl	%eax, %eax
ffff80000010e94f: ff d1                	callq	*%rcx
; }
ffff80000010e951: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e955: 5b                   	popq	%rbx
ffff80000010e956: 41 5c                	popq	%r12
ffff80000010e958: 41 5d                	popq	%r13
ffff80000010e95a: 41 5e                	popq	%r14
ffff80000010e95c: 41 5f                	popq	%r15
ffff80000010e95e: 5d                   	popq	%rbp
ffff80000010e95f: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010e960: 48 b8 50 e7 10 00 00 80 ff ff	movabsq	$-140737487247536, %rax # imm = 0xFFFF80000010E750
ffff80000010e96a: 4c 89 ef             	movq	%r13, %rdi
ffff80000010e96d: ff d0                	callq	*%rax
ffff80000010e96f: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010e979: 48 ba de 3c 11 00 00 80 ff ff	movabsq	$-140737487225634, %rdx # imm = 0xFFFF800000113CDE
ffff80000010e983: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e98d: be 59 00 00 00       	movl	$89, %esi
ffff80000010e992: 48 89 c1             	movq	%rax, %rcx
ffff80000010e995: 31 c0                	xorl	%eax, %eax
ffff80000010e997: ff d3                	callq	*%rbx
ffff80000010e999: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010e9a0 <_kaddr>:
; {
ffff80000010e9a0: 55                   	pushq	%rbp
ffff80000010e9a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e9a4: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e9a7: 48 89 f9             	movq	%rdi, %rcx
ffff80000010e9aa: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010e9ae: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
ffff80000010e9b8: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010e9bb: 73 0f                	jae	0xffff80000010e9cc <_kaddr+0x2c>
ffff80000010e9bd: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010e9c7: 48 01 c8             	addq	%rcx, %rax
ffff80000010e9ca: 5d                   	popq	%rbp
ffff80000010e9cb: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010e9cc: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010e9d6: 48 ba 86 42 11 00 00 80 ff ff	movabsq	$-140737487224186, %rdx # imm = 0xFFFF800000114286
ffff80000010e9e0: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010e9ea: be 48 00 00 00       	movl	$72, %esi
ffff80000010e9ef: 48 89 c1             	movq	%rax, %rcx
ffff80000010e9f2: 31 c0                	xorl	%eax, %eax
ffff80000010e9f4: 41 ff d0             	callq	*%r8
ffff80000010e9f7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010ea00 <_paddr>:
; {
ffff80000010ea00: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010ea03: 48 89 f1             	movq	%rsi, %rcx
ffff80000010ea06: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010ea0a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010ea10: 76 0e                	jbe	0xffff80000010ea20 <_paddr+0x20>
ffff80000010ea12: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010ea1c: 48 01 c8             	addq	%rcx, %rax
ffff80000010ea1f: c3                   	retq
ffff80000010ea20: 55                   	pushq	%rbp
ffff80000010ea21: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ea24: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010ea26: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ea30: 48 ba a5 3b 11 00 00 80 ff ff	movabsq	$-140737487225947, %rdx # imm = 0xFFFF800000113BA5
ffff80000010ea3a: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010ea44: 48 89 c1             	movq	%rax, %rcx
ffff80000010ea47: 31 c0                	xorl	%eax, %eax
ffff80000010ea49: 41 ff d0             	callq	*%r8
ffff80000010ea4c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010ea50 <pa2page>:
; {
ffff80000010ea50: 55                   	pushq	%rbp
ffff80000010ea51: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ea54: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010ea58: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff80000010ea62: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010ea65: 73 16                	jae	0xffff80000010ea7d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010ea67: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff80000010ea71: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ea75: 48 03 38             	addq	(%rax), %rdi
ffff80000010ea78: 48 89 f8             	movq	%rdi, %rax
ffff80000010ea7b: 5d                   	popq	%rbp
ffff80000010ea7c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010ea7d: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000010ea87: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
ffff80000010ea91: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010ea9b: be 49 00 00 00       	movl	$73, %esi
ffff80000010eaa0: 31 c0                	xorl	%eax, %eax
ffff80000010eaa2: ff d1                	callq	*%rcx
ffff80000010eaa4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eaae: 66 90                	nop

ffff80000010eab0 <check_buddy_consistency>:
; {
ffff80000010eab0: 55                   	pushq	%rbp
ffff80000010eab1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eab4: 41 57                	pushq	%r15
ffff80000010eab6: 41 56                	pushq	%r14
ffff80000010eab8: 41 55                	pushq	%r13
ffff80000010eaba: 41 54                	pushq	%r12
ffff80000010eabc: 53                   	pushq	%rbx
ffff80000010eabd: 50                   	pushq	%rax
ffff80000010eabe: 49 89 d4             	movq	%rdx, %r12
ffff80000010eac1: 49 89 f7             	movq	%rsi, %r15
ffff80000010eac4: 49 89 fe             	movq	%rdi, %r14
; 	page = pa2page(addr);
ffff80000010eac7: 48 b8 50 ea 10 00 00 80 ff ff	movabsq	$-140737487246768, %rax # imm = 0xFFFF80000010EA50
ffff80000010ead1: ff d0                	callq	*%rax
ffff80000010ead3: 48 89 c3             	movq	%rax, %rbx
; 	if (parent && parent != page) {
ffff80000010ead6: 4d 85 e4             	testq	%r12, %r12
ffff80000010ead9: 74 3f                	je	0xffff80000010eb1a <check_buddy_consistency+0x6a>
ffff80000010eadb: 4c 39 e3             	cmpq	%r12, %rbx
ffff80000010eade: 74 3a                	je	0xffff80000010eb1a <check_buddy_consistency+0x6a>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010eae0: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010eae5: 45 84 ed             	testb	%r13b, %r13b
ffff80000010eae8: 0f 88 ce 00 00 00    	js	0xffff80000010ebbc <check_buddy_consistency+0x10c>
ffff80000010eaee: 48 89 df             	movq	%rbx, %rdi
ffff80000010eaf1: 48 b8 90 ec 10 00 00 80 ff ff	movabsq	$-140737487246192, %rax # imm = 0xFFFF80000010EC90
ffff80000010eafb: ff d0                	callq	*%rax
ffff80000010eafd: 85 c0                	testl	%eax, %eax
ffff80000010eaff: 0f 84 b7 00 00 00    	je	0xffff80000010ebbc <check_buddy_consistency+0x10c>
; 			page->pp_order < parent->pp_order) {
ffff80000010eb05: 44 89 e8             	movl	%r13d, %eax
ffff80000010eb08: 24 7f                	andb	$127, %al
ffff80000010eb0a: 41 8a 4c 24 12       	movb	18(%r12), %cl
ffff80000010eb0f: 80 e1 7f             	andb	$127, %cl
ffff80000010eb12: 38 c8                	cmpb	%cl, %al
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010eb14: 0f 82 a2 00 00 00    	jb	0xffff80000010ebbc <check_buddy_consistency+0x10c>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010eb1a: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010eb1f: 45 84 ed             	testb	%r13b, %r13b
ffff80000010eb22: 79 1c                	jns	0xffff80000010eb40 <check_buddy_consistency+0x90>
ffff80000010eb24: 48 89 df             	movq	%rbx, %rdi
ffff80000010eb27: 48 b8 90 ec 10 00 00 80 ff ff	movabsq	$-140737487246192, %rax # imm = 0xFFFF80000010EC90
ffff80000010eb31: ff d0                	callq	*%rax
ffff80000010eb33: 85 c0                	testl	%eax, %eax
ffff80000010eb35: 0f 85 13 01 00 00    	jne	0xffff80000010ec4e <check_buddy_consistency+0x19e>
ffff80000010eb3b: 45 84 ed             	testb	%r13b, %r13b
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff80000010eb3e: 78 1c                	js	0xffff80000010eb5c <check_buddy_consistency+0xac>
ffff80000010eb40: 48 89 df             	movq	%rbx, %rdi
ffff80000010eb43: 48 b8 90 ec 10 00 00 80 ff ff	movabsq	$-140737487246192, %rax # imm = 0xFFFF80000010EC90
ffff80000010eb4d: ff d0                	callq	*%rax
ffff80000010eb4f: 85 c0                	testl	%eax, %eax
ffff80000010eb51: 0f 84 bf 00 00 00    	je	0xffff80000010ec16 <check_buddy_consistency+0x166>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010eb57: 45 84 ed             	testb	%r13b, %r13b
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010eb5a: 79 15                	jns	0xffff80000010eb71 <check_buddy_consistency+0xc1>
ffff80000010eb5c: 48 89 df             	movq	%rbx, %rdi
ffff80000010eb5f: 48 b8 90 ec 10 00 00 80 ff ff	movabsq	$-140737487246192, %rax # imm = 0xFFFF80000010EC90
ffff80000010eb69: ff d0                	callq	*%rax
ffff80000010eb6b: 85 c0                	testl	%eax, %eax
ffff80000010eb6d: 4c 0f 45 e3          	cmovneq	%rbx, %r12
; 	if (order == 0) {
ffff80000010eb71: 4d 85 ff             	testq	%r15, %r15
ffff80000010eb74: 74 37                	je	0xffff80000010ebad <check_buddy_consistency+0xfd>
; 	--order;
ffff80000010eb76: 49 8d 5f ff          	leaq	-1(%r15), %rbx
; 	check_buddy_consistency(addr, order, parent);
ffff80000010eb7a: 49 bd b0 ea 10 00 00 80 ff ff	movabsq	$-140737487246672, %r13 # imm = 0xFFFF80000010EAB0
ffff80000010eb84: 4c 89 f7             	movq	%r14, %rdi
ffff80000010eb87: 48 89 de             	movq	%rbx, %rsi
ffff80000010eb8a: 4c 89 e2             	movq	%r12, %rdx
ffff80000010eb8d: 41 ff d5             	callq	*%r13
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff80000010eb90: 41 80 c7 0b          	addb	$11, %r15b
ffff80000010eb94: b8 01 00 00 00       	movl	$1, %eax
ffff80000010eb99: 44 89 f9             	movl	%r15d, %ecx
ffff80000010eb9c: d3 e0                	shll	%cl, %eax
ffff80000010eb9e: 48 63 f8             	movslq	%eax, %rdi
ffff80000010eba1: 4c 09 f7             	orq	%r14, %rdi
ffff80000010eba4: 48 89 de             	movq	%rbx, %rsi
ffff80000010eba7: 4c 89 e2             	movq	%r12, %rdx
ffff80000010ebaa: 41 ff d5             	callq	*%r13
; }
ffff80000010ebad: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ebb1: 5b                   	popq	%rbx
ffff80000010ebb2: 41 5c                	popq	%r12
ffff80000010ebb4: 41 5d                	popq	%r13
ffff80000010ebb6: 41 5e                	popq	%r14
ffff80000010ebb8: 41 5f                	popq	%r15
ffff80000010ebba: 5d                   	popq	%rbp
ffff80000010ebbb: c3                   	retq
; 			panic("page %p of order %u is free, while parent page "
ffff80000010ebbc: 49 be 50 e7 10 00 00 80 ff ff	movabsq	$-140737487247536, %r14 # imm = 0xFFFF80000010E750
ffff80000010ebc6: 48 89 df             	movq	%rbx, %rdi
ffff80000010ebc9: 41 ff d6             	callq	*%r14
ffff80000010ebcc: 48 89 c3             	movq	%rax, %rbx
ffff80000010ebcf: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ebd3: 4c 89 e7             	movq	%r12, %rdi
ffff80000010ebd6: 41 ff d6             	callq	*%r14
ffff80000010ebd9: 41 0f b6 4c 24 12    	movzbl	18(%r12), %ecx
ffff80000010ebdf: 83 e1 7f             	andl	$127, %ecx
ffff80000010ebe2: 89 0c 24             	movl	%ecx, (%rsp)
ffff80000010ebe5: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ebef: 48 ba f4 41 11 00 00 80 ff ff	movabsq	$-140737487224332, %rdx # imm = 0xFFFF8000001141F4
ffff80000010ebf9: 49 ba 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r10 # imm = 0xFFFF80000010C870
ffff80000010ec03: be 6d 00 00 00       	movl	$109, %esi
ffff80000010ec08: 48 89 d9             	movq	%rbx, %rcx
ffff80000010ec0b: 45 89 e8             	movl	%r13d, %r8d
ffff80000010ec0e: 49 89 c1             	movq	%rax, %r9
ffff80000010ec11: 31 c0                	xorl	%eax, %eax
ffff80000010ec13: 41 ff d2             	callq	*%r10
; 		panic("page %p of order %u is in use, but on the free list",
ffff80000010ec16: 48 b8 50 e7 10 00 00 80 ff ff	movabsq	$-140737487247536, %rax # imm = 0xFFFF80000010E750
ffff80000010ec20: 48 89 df             	movq	%rbx, %rdi
ffff80000010ec23: ff d0                	callq	*%rax
ffff80000010ec25: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ec29: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ec33: 48 ba cf 3e 11 00 00 80 ff ff	movabsq	$-140737487225137, %rdx # imm = 0xFFFF800000113ECF
ffff80000010ec3d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ec47: be 78 00 00 00       	movl	$120, %esi
ffff80000010ec4c: eb 36                	jmp	0xffff80000010ec84 <check_buddy_consistency+0x1d4>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000010ec4e: 48 b8 50 e7 10 00 00 80 ff ff	movabsq	$-140737487247536, %rax # imm = 0xFFFF80000010E750
ffff80000010ec58: 48 89 df             	movq	%rbx, %rdi
ffff80000010ec5b: ff d0                	callq	*%rax
ffff80000010ec5d: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010ec61: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ec6b: 48 ba 50 43 11 00 00 80 ff ff	movabsq	$-140737487223984, %rdx # imm = 0xFFFF800000114350
ffff80000010ec75: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ec7f: be 73 00 00 00       	movl	$115, %esi
ffff80000010ec84: 48 89 c1             	movq	%rax, %rcx
ffff80000010ec87: 45 89 e8             	movl	%r13d, %r8d
ffff80000010ec8a: 31 c0                	xorl	%eax, %eax
ffff80000010ec8c: ff d3                	callq	*%rbx
ffff80000010ec8e: 66 90                	nop

ffff80000010ec90 <list_is_empty>:
; {
ffff80000010ec90: 55                   	pushq	%rbp
ffff80000010ec91: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff80000010ec94: 31 c0                	xorl	%eax, %eax
ffff80000010ec96: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010ec99: 0f 94 c0             	sete	%al
ffff80000010ec9c: 5d                   	popq	%rbp
ffff80000010ec9d: c3                   	retq
ffff80000010ec9e: 66 90                	nop

ffff80000010eca0 <lab1_check_buddy_consistency>:
; {
ffff80000010eca0: 55                   	pushq	%rbp
ffff80000010eca1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eca4: 41 56                	pushq	%r14
ffff80000010eca6: 53                   	pushq	%rbx
ffff80000010eca7: 48 c7 c3 00 00 e0 ff 	movq	$-2097152, %rbx         # imm = 0xFFE00000
ffff80000010ecae: 49 be b0 ea 10 00 00 80 ff ff	movabsq	$-140737487246672, %r14 # imm = 0xFFFF80000010EAB0
ffff80000010ecb8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000010ecc0: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
ffff80000010ecc7: be 09 00 00 00       	movl	$9, %esi
ffff80000010eccc: 48 89 df             	movq	%rbx, %rdi
ffff80000010eccf: 31 d2                	xorl	%edx, %edx
ffff80000010ecd1: 41 ff d6             	callq	*%r14
; 	     addr < BOOT_MAP_LIM;
ffff80000010ecd4: 48 81 fb 00 00 60 00 	cmpq	$6291456, %rbx          # imm = 0x600000
; 	for (addr = 0;
ffff80000010ecdb: 72 e3                	jb	0xffff80000010ecc0 <lab1_check_buddy_consistency+0x20>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff80000010ecdd: 48 bf 16 47 11 00 00 80 ff ff	movabsq	$-140737487223018, %rdi # imm = 0xFFFF800000114716
ffff80000010ece7: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010ecf1: 31 c0                	xorl	%eax, %eax
ffff80000010ecf3: ff d1                	callq	*%rcx
; }
ffff80000010ecf5: 5b                   	popq	%rbx
ffff80000010ecf6: 41 5e                	popq	%r14
ffff80000010ecf8: 5d                   	popq	%rbp
ffff80000010ecf9: c3                   	retq
ffff80000010ecfa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ed00 <lab1_check_split_and_merge>:
; {
ffff80000010ed00: 55                   	pushq	%rbp
ffff80000010ed01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ed04: 41 57                	pushq	%r15
ffff80000010ed06: 41 56                	pushq	%r14
ffff80000010ed08: 41 55                	pushq	%r13
ffff80000010ed0a: 41 54                	pushq	%r12
ffff80000010ed0c: 53                   	pushq	%rbx
ffff80000010ed0d: 48 81 ec a8 00 00 00 	subq	$168, %rsp
ffff80000010ed14: 89 fb                	movl	%edi, %ebx
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff80000010ed16: 49 be 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %r14 # imm = 0xFFFF80000010D680
ffff80000010ed20: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ed25: 41 ff d6             	callq	*%r14
ffff80000010ed28: 49 89 c4             	movq	%rax, %r12
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010ed2b: 48 b8 f0 da 10 00 00 80 ff ff	movabsq	$-140737487250704, %rax # imm = 0xFFFF80000010DAF0
ffff80000010ed35: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ed3a: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010ed3c: 48 85 c0             	testq	%rax, %rax
ffff80000010ed3f: 0f 84 5d 02 00 00    	je	0xffff80000010efa2 <lab1_check_split_and_merge+0x2a2>
ffff80000010ed45: 49 89 c7             	movq	%rax, %r15
ffff80000010ed48: 89 5d d4             	movl	%ebx, -44(%rbp)
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010ed4b: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ed50: 41 ff d6             	callq	*%r14
ffff80000010ed53: 48 83 c0 01          	addq	$1, %rax
ffff80000010ed57: 4c 39 e0             	cmpq	%r12, %rax
ffff80000010ed5a: 0f 85 69 02 00 00    	jne	0xffff80000010efc9 <lab1_check_split_and_merge+0x2c9>
ffff80000010ed60: 31 db                	xorl	%ebx, %ebx
ffff80000010ed62: 49 bc 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r12 # imm = 0xFFFF800000118240
ffff80000010ed6c: 49 bd 40 f1 10 00 00 80 ff ff	movabsq	$-140737487244992, %r13 # imm = 0xFFFF80000010F140
ffff80000010ed76: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		stolen_free_list[order] = buddy_free_list[order];
ffff80000010ed80: 4a 8d 3c 23          	leaq	(%rbx,%r12), %rdi
ffff80000010ed84: 4a 8b 04 23          	movq	(%rbx,%r12), %rax
ffff80000010ed88: 4a 8b 4c 23 08       	movq	8(%rbx,%r12), %rcx
ffff80000010ed8d: 48 89 8c 1d 38 ff ff ff      	movq	%rcx, -200(%rbp,%rbx)
ffff80000010ed95: 48 89 84 1d 30 ff ff ff      	movq	%rax, -208(%rbp,%rbx)
; 		list_init(buddy_free_list + order);
ffff80000010ed9d: 41 ff d5             	callq	*%r13
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010eda0: 48 83 c3 10          	addq	$16, %rbx
ffff80000010eda4: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010edab: 75 d3                	jne	0xffff80000010ed80 <lab1_check_split_and_merge+0x80>
; 	page_free(page);
ffff80000010edad: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010edb7: 4c 89 ff             	movq	%r15, %rdi
ffff80000010edba: ff d0                	callq	*%rax
ffff80000010edbc: 31 db                	xorl	%ebx, %ebx
ffff80000010edbe: 66 90                	nop
; 		assert(count_free_pages(order) == 0);
ffff80000010edc0: 48 89 df             	movq	%rbx, %rdi
ffff80000010edc3: 41 ff d6             	callq	*%r14
ffff80000010edc6: 48 85 c0             	testq	%rax, %rax
ffff80000010edc9: 0f 85 40 01 00 00    	jne	0xffff80000010ef0f <lab1_check_split_and_merge+0x20f>
ffff80000010edcf: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010edd3: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010edd7: 75 e7                	jne	0xffff80000010edc0 <lab1_check_split_and_merge+0xc0>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010edd9: bf 09 00 00 00       	movl	$9, %edi
ffff80000010edde: 41 ff d6             	callq	*%r14
ffff80000010ede1: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010ede5: 0f 85 0f 02 00 00    	jne	0xffff80000010effa <lab1_check_split_and_merge+0x2fa>
; 	page = page_alloc(0);
ffff80000010edeb: 49 bd a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %r13 # imm = 0xFFFF80000010DBA0
ffff80000010edf5: 31 ff                	xorl	%edi, %edi
ffff80000010edf7: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010edfa: 48 85 c0             	testq	%rax, %rax
ffff80000010edfd: 0f 84 28 02 00 00    	je	0xffff80000010f02b <lab1_check_split_and_merge+0x32b>
ffff80000010ee03: 49 89 c7             	movq	%rax, %r15
ffff80000010ee06: 31 db                	xorl	%ebx, %ebx
ffff80000010ee08: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		assert(count_free_pages(order) == 1);
ffff80000010ee10: 48 89 df             	movq	%rbx, %rdi
ffff80000010ee13: 41 ff d6             	callq	*%r14
ffff80000010ee16: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010ee1a: 0f 85 20 01 00 00    	jne	0xffff80000010ef40 <lab1_check_split_and_merge+0x240>
ffff80000010ee20: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010ee24: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010ee28: 75 e6                	jne	0xffff80000010ee10 <lab1_check_split_and_merge+0x110>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010ee2a: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ee2f: 41 ff d6             	callq	*%r14
ffff80000010ee32: 48 85 c0             	testq	%rax, %rax
ffff80000010ee35: 0f 85 17 02 00 00    	jne	0xffff80000010f052 <lab1_check_split_and_merge+0x352>
; 	page_free(page);
ffff80000010ee3b: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ee3e: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010ee48: ff d0                	callq	*%rax
ffff80000010ee4a: 31 db                	xorl	%ebx, %ebx
ffff80000010ee4c: 0f 1f 40 00          	nopl	(%rax)
; 		assert(count_free_pages(order) == 0);
ffff80000010ee50: 48 89 df             	movq	%rbx, %rdi
ffff80000010ee53: 41 ff d6             	callq	*%r14
ffff80000010ee56: 48 85 c0             	testq	%rax, %rax
ffff80000010ee59: 0f 85 12 01 00 00    	jne	0xffff80000010ef71 <lab1_check_split_and_merge+0x271>
ffff80000010ee5f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010ee63: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010ee67: 75 e7                	jne	0xffff80000010ee50 <lab1_check_split_and_merge+0x150>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010ee69: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ee6e: 41 ff d6             	callq	*%r14
ffff80000010ee71: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010ee75: 0f 85 08 02 00 00    	jne	0xffff80000010f083 <lab1_check_split_and_merge+0x383>
; 	if (flags & ALLOC_HUGE)
ffff80000010ee7b: f6 45 d4 02          	testb	$2, -44(%rbp)
ffff80000010ee7f: 75 13                	jne	0xffff80000010ee94 <lab1_check_split_and_merge+0x194>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010ee81: bf 09 00 00 00       	movl	$9, %edi
ffff80000010ee86: 48 b8 f0 da 10 00 00 80 ff ff	movabsq	$-140737487250704, %rax # imm = 0xFFFF80000010DAF0
ffff80000010ee90: ff d0                	callq	*%rax
ffff80000010ee92: eb 08                	jmp	0xffff80000010ee9c <lab1_check_split_and_merge+0x19c>
; 		page = page_alloc(ALLOC_HUGE);
ffff80000010ee94: bf 02 00 00 00       	movl	$2, %edi
ffff80000010ee99: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010ee9c: 48 85 c0             	testq	%rax, %rax
ffff80000010ee9f: 0f 84 0f 02 00 00    	je	0xffff80000010f0b4 <lab1_check_split_and_merge+0x3b4>
ffff80000010eea5: 31 c9                	xorl	%ecx, %ecx
ffff80000010eea7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		buddy_free_list[order] = stolen_free_list[order];
ffff80000010eeb0: 48 8b 94 0d 30 ff ff ff      	movq	-208(%rbp,%rcx), %rdx
ffff80000010eeb8: 48 8b b4 0d 38 ff ff ff      	movq	-200(%rbp,%rcx), %rsi
ffff80000010eec0: 4a 89 74 21 08       	movq	%rsi, 8(%rcx,%r12)
ffff80000010eec5: 4a 89 14 21          	movq	%rdx, (%rcx,%r12)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010eec9: 48 83 c1 10          	addq	$16, %rcx
ffff80000010eecd: 48 81 f9 a0 00 00 00 	cmpq	$160, %rcx
ffff80000010eed4: 75 da                	jne	0xffff80000010eeb0 <lab1_check_split_and_merge+0x1b0>
; 	page_free(page);
ffff80000010eed6: 48 89 c7             	movq	%rax, %rdi
ffff80000010eed9: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010eee3: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff80000010eee5: 48 bf 86 44 11 00 00 80 ff ff	movabsq	$-140737487223674, %rdi # imm = 0xFFFF800000114486
ffff80000010eeef: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff80000010eef9: 31 c0                	xorl	%eax, %eax
ffff80000010eefb: ff d1                	callq	*%rcx
; }
ffff80000010eefd: 48 81 c4 a8 00 00 00 	addq	$168, %rsp
ffff80000010ef04: 5b                   	popq	%rbx
ffff80000010ef05: 41 5c                	popq	%r12
ffff80000010ef07: 41 5d                	popq	%r13
ffff80000010ef09: 41 5e                	popq	%r14
ffff80000010ef0b: 41 5f                	popq	%r15
ffff80000010ef0d: 5d                   	popq	%rbp
ffff80000010ef0e: c3                   	retq
; 		assert(count_free_pages(order) == 0);
ffff80000010ef0f: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ef19: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010ef23: 48 b9 e1 44 11 00 00 80 ff ff	movabsq	$-140737487223583, %rcx # imm = 0xFFFF8000001144E1
ffff80000010ef2d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ef37: be ba 00 00 00       	movl	$186, %esi
ffff80000010ef3c: 31 c0                	xorl	%eax, %eax
ffff80000010ef3e: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 1);
ffff80000010ef40: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ef4a: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010ef54: 48 b9 41 46 11 00 00 80 ff ff	movabsq	$-140737487223231, %rcx # imm = 0xFFFF800000114641
ffff80000010ef5e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ef68: be c8 00 00 00       	movl	$200, %esi
ffff80000010ef6d: 31 c0                	xorl	%eax, %eax
ffff80000010ef6f: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 0);
ffff80000010ef71: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010ef7b: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010ef85: 48 b9 e1 44 11 00 00 80 ff ff	movabsq	$-140737487223583, %rcx # imm = 0xFFFF8000001144E1
ffff80000010ef8f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010ef99: be d2 00 00 00       	movl	$210, %esi
ffff80000010ef9e: 31 c0                	xorl	%eax, %eax
ffff80000010efa0: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010efa2: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010efac: 48 ba 57 3f 11 00 00 80 ff ff	movabsq	$-140737487225001, %rdx # imm = 0xFFFF800000113F57
ffff80000010efb6: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010efc0: be a9 00 00 00       	movl	$169, %esi
ffff80000010efc5: 31 c0                	xorl	%eax, %eax
ffff80000010efc7: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010efc9: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010efd3: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010efdd: 48 b9 75 40 11 00 00 80 ff ff	movabsq	$-140737487224715, %rcx # imm = 0xFFFF800000114075
ffff80000010efe7: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010eff1: be ad 00 00 00       	movl	$173, %esi
ffff80000010eff6: 31 c0                	xorl	%eax, %eax
ffff80000010eff8: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010effa: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010f004: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010f00e: 48 b9 36 3a 11 00 00 80 ff ff	movabsq	$-140737487226314, %rcx # imm = 0xFFFF800000113A36
ffff80000010f018: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f022: be bd 00 00 00       	movl	$189, %esi
ffff80000010f027: 31 c0                	xorl	%eax, %eax
ffff80000010f029: ff d3                	callq	*%rbx
; 		panic("can't allocate 4K page!");
ffff80000010f02b: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010f035: 48 ba d8 3d 11 00 00 80 ff ff	movabsq	$-140737487225384, %rdx # imm = 0xFFFF800000113DD8
ffff80000010f03f: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010f049: be c3 00 00 00       	movl	$195, %esi
ffff80000010f04e: 31 c0                	xorl	%eax, %eax
ffff80000010f050: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010f052: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010f05c: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010f066: 48 b9 55 3e 11 00 00 80 ff ff	movabsq	$-140737487225259, %rcx # imm = 0xFFFF800000113E55
ffff80000010f070: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f07a: be cb 00 00 00       	movl	$203, %esi
ffff80000010f07f: 31 c0                	xorl	%eax, %eax
ffff80000010f081: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010f083: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010f08d: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000010f097: 48 b9 36 3a 11 00 00 80 ff ff	movabsq	$-140737487226314, %rcx # imm = 0xFFFF800000113A36
ffff80000010f0a1: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010f0ab: be d5 00 00 00       	movl	$213, %esi
ffff80000010f0b0: 31 c0                	xorl	%eax, %eax
ffff80000010f0b2: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010f0b4: 48 bf ea 38 11 00 00 80 ff ff	movabsq	$-140737487226646, %rdi # imm = 0xFFFF8000001138EA
ffff80000010f0be: 48 ba 57 3f 11 00 00 80 ff ff	movabsq	$-140737487225001, %rdx # imm = 0xFFFF800000113F57
ffff80000010f0c8: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010f0d2: be de 00 00 00       	movl	$222, %esi
ffff80000010f0d7: 31 c0                	xorl	%eax, %eax
ffff80000010f0d9: ff d1                	callq	*%rcx
ffff80000010f0db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f0e0 <lab1_check_mem>:
; {
ffff80000010f0e0: 55                   	pushq	%rbp
ffff80000010f0e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f0e4: 53                   	pushq	%rbx
ffff80000010f0e5: 50                   	pushq	%rax
ffff80000010f0e6: 48 89 fb             	movq	%rdi, %rbx
; 	lab1_check_free_list_avail();
ffff80000010f0e9: 48 b8 30 e6 10 00 00 80 ff ff	movabsq	$-140737487247824, %rax # imm = 0xFFFF80000010E630
ffff80000010f0f3: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff80000010f0f5: 48 b8 70 e7 10 00 00 80 ff ff	movabsq	$-140737487247504, %rax # imm = 0xFFFF80000010E770
ffff80000010f0ff: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff80000010f101: 48 b8 20 e8 10 00 00 80 ff ff	movabsq	$-140737487247328, %rax # imm = 0xFFFF80000010E820
ffff80000010f10b: 48 89 df             	movq	%rbx, %rdi
ffff80000010f10e: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff80000010f110: 48 b8 a0 ec 10 00 00 80 ff ff	movabsq	$-140737487246176, %rax # imm = 0xFFFF80000010ECA0
ffff80000010f11a: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff80000010f11c: 48 b8 00 ed 10 00 00 80 ff ff	movabsq	$-140737487246080, %rax # imm = 0xFFFF80000010ED00
ffff80000010f126: 31 ff                	xorl	%edi, %edi
ffff80000010f128: ff d0                	callq	*%rax
; }
ffff80000010f12a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f12e: 5b                   	popq	%rbx
ffff80000010f12f: 5d                   	popq	%rbp
ffff80000010f130: c3                   	retq
ffff80000010f131: cc                   	int3
ffff80000010f132: cc                   	int3
ffff80000010f133: cc                   	int3
ffff80000010f134: cc                   	int3
ffff80000010f135: cc                   	int3
ffff80000010f136: cc                   	int3
ffff80000010f137: cc                   	int3
ffff80000010f138: cc                   	int3
ffff80000010f139: cc                   	int3
ffff80000010f13a: cc                   	int3
ffff80000010f13b: cc                   	int3
ffff80000010f13c: cc                   	int3
ffff80000010f13d: cc                   	int3
ffff80000010f13e: cc                   	int3
ffff80000010f13f: cc                   	int3

ffff80000010f140 <list_init>:
; {
ffff80000010f140: 55                   	pushq	%rbp
ffff80000010f141: 48 89 e5             	movq	%rsp, %rbp
; 	head->next = head;
ffff80000010f144: 48 89 3f             	movq	%rdi, (%rdi)
; 	head->prev = head;
ffff80000010f147: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010f14b: 5d                   	popq	%rbp
ffff80000010f14c: c3                   	retq
ffff80000010f14d: 0f 1f 00             	nopl	(%rax)

ffff80000010f150 <list_insert_after>:
; {
ffff80000010f150: 55                   	pushq	%rbp
ffff80000010f151: 48 89 e5             	movq	%rsp, %rbp
; 	new->prev = after;
ffff80000010f154: 48 89 7e 08          	movq	%rdi, 8(%rsi)
; 	new->next = after->next;
ffff80000010f158: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f15b: 48 89 06             	movq	%rax, (%rsi)
; 	after->next->prev = new;
ffff80000010f15e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f161: 48 89 70 08          	movq	%rsi, 8(%rax)
; 	after->next = new;
ffff80000010f165: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff80000010f168: 5d                   	popq	%rbp
ffff80000010f169: c3                   	retq
ffff80000010f16a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010f170 <list_insert_before>:
; {
ffff80000010f170: 55                   	pushq	%rbp
ffff80000010f171: 48 89 e5             	movq	%rsp, %rbp
; 	new->next = before;
ffff80000010f174: 48 89 3e             	movq	%rdi, (%rsi)
; 	new->prev = before->prev;
ffff80000010f177: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f17b: 48 89 46 08          	movq	%rax, 8(%rsi)
; 	before->prev->next = new;
ffff80000010f17f: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f183: 48 89 30             	movq	%rsi, (%rax)
; 	before->prev = new;
ffff80000010f186: 48 89 77 08          	movq	%rsi, 8(%rdi)
; }
ffff80000010f18a: 5d                   	popq	%rbp
ffff80000010f18b: c3                   	retq
ffff80000010f18c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f190 <list_del>:
; {
ffff80000010f190: 55                   	pushq	%rbp
ffff80000010f191: 48 89 e5             	movq	%rsp, %rbp
; 	node->prev->next = node->next;
ffff80000010f194: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f197: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f19b: 48 89 01             	movq	%rax, (%rcx)
; 	node->next->prev = node->prev;
ffff80000010f19e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f1a1: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff80000010f1a5: 48 89 3f             	movq	%rdi, (%rdi)
; 	node->prev = node;
ffff80000010f1a8: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010f1ac: 5d                   	popq	%rbp
ffff80000010f1ad: c3                   	retq
ffff80000010f1ae: 66 90                	nop

ffff80000010f1b0 <list_add>:
; {
ffff80000010f1b0: 55                   	pushq	%rbp
ffff80000010f1b1: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_after(head, new);
ffff80000010f1b4: 48 b8 50 f1 10 00 00 80 ff ff	movabsq	$-140737487244976, %rax # imm = 0xFFFF80000010F150
ffff80000010f1be: ff d0                	callq	*%rax
; }
ffff80000010f1c0: 5d                   	popq	%rbp
ffff80000010f1c1: c3                   	retq
ffff80000010f1c2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f1cc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f1d0 <list_add_tail>:
; {
ffff80000010f1d0: 55                   	pushq	%rbp
ffff80000010f1d1: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_before(head, new);
ffff80000010f1d4: 48 b8 70 f1 10 00 00 80 ff ff	movabsq	$-140737487244944, %rax # imm = 0xFFFF80000010F170
ffff80000010f1de: ff d0                	callq	*%rax
; }
ffff80000010f1e0: 5d                   	popq	%rbp
ffff80000010f1e1: c3                   	retq
ffff80000010f1e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f1ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f1f0 <list_pop_tail>:
; {
ffff80000010f1f0: 55                   	pushq	%rbp
ffff80000010f1f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f1f4: 53                   	pushq	%rbx
ffff80000010f1f5: 50                   	pushq	%rax
; 	if (head->prev == head)
ffff80000010f1f6: 48 8b 5f 08          	movq	8(%rdi), %rbx
ffff80000010f1fa: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010f1fd: 74 11                	je	0xffff80000010f210 <list_pop_tail+0x20>
; 	list_del(node);
ffff80000010f1ff: 48 b8 90 f1 10 00 00 80 ff ff	movabsq	$-140737487244912, %rax # imm = 0xFFFF80000010F190
ffff80000010f209: 48 89 df             	movq	%rbx, %rdi
ffff80000010f20c: ff d0                	callq	*%rax
ffff80000010f20e: eb 02                	jmp	0xffff80000010f212 <list_pop_tail+0x22>
ffff80000010f210: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010f212: 48 89 d8             	movq	%rbx, %rax
ffff80000010f215: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f219: 5b                   	popq	%rbx
ffff80000010f21a: 5d                   	popq	%rbp
ffff80000010f21b: c3                   	retq
ffff80000010f21c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f220 <list_pop>:
; {
ffff80000010f220: 55                   	pushq	%rbp
ffff80000010f221: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f224: 53                   	pushq	%rbx
ffff80000010f225: 50                   	pushq	%rax
; 	if (head->next == head)
ffff80000010f226: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010f229: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010f22c: 74 11                	je	0xffff80000010f23f <list_pop+0x1f>
; 	list_del(node);
ffff80000010f22e: 48 b8 90 f1 10 00 00 80 ff ff	movabsq	$-140737487244912, %rax # imm = 0xFFFF80000010F190
ffff80000010f238: 48 89 df             	movq	%rbx, %rdi
ffff80000010f23b: ff d0                	callq	*%rax
ffff80000010f23d: eb 02                	jmp	0xffff80000010f241 <list_pop+0x21>
ffff80000010f23f: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010f241: 48 89 d8             	movq	%rbx, %rax
ffff80000010f244: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f248: 5b                   	popq	%rbx
ffff80000010f249: 5d                   	popq	%rbp
ffff80000010f24a: c3                   	retq
ffff80000010f24b: cc                   	int3
ffff80000010f24c: cc                   	int3
ffff80000010f24d: cc                   	int3
ffff80000010f24e: cc                   	int3
ffff80000010f24f: cc                   	int3

ffff80000010f250 <vprintfmt>:
; {
ffff80000010f250: 55                   	pushq	%rbp
ffff80000010f251: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f254: 41 57                	pushq	%r15
ffff80000010f256: 41 56                	pushq	%r14
ffff80000010f258: 41 55                	pushq	%r13
ffff80000010f25a: 41 54                	pushq	%r12
ffff80000010f25c: 53                   	pushq	%rbx
ffff80000010f25d: 48 83 ec 38          	subq	$56, %rsp
ffff80000010f261: 49 89 d6             	movq	%rdx, %r14
ffff80000010f264: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f267: 49 89 ff             	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
ffff80000010f26a: 48 8b 41 10          	movq	16(%rcx), %rax
ffff80000010f26e: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010f272: 48 8b 01             	movq	(%rcx), %rax
ffff80000010f275: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010f279: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f27d: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010f281: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010f285: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff80000010f289: eb 44                	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; 			num = getuint(&ap, lflag);
ffff80000010f28b: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f28f: 48 b8 00 f8 10 00 00 80 ff ff	movabsq	$-140737487243264, %rax # imm = 0xFFFF80000010F800
ffff80000010f299: ff d0                	callq	*%rax
ffff80000010f29b: 49 89 c4             	movq	%rax, %r12
ffff80000010f29e: 41 bf 10 00 00 00    	movl	$16, %r15d
ffff80000010f2a4: 45 0f b6 cd          	movzbl	%r13b, %r9d
ffff80000010f2a8: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f2ac: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
ffff80000010f2b0: 4c 89 e2             	movq	%r12, %rdx
ffff80000010f2b3: 44 89 f9             	movl	%r15d, %ecx
ffff80000010f2b6: 49 89 ff             	movq	%rdi, %r15
ffff80000010f2b9: 41 89 d8             	movl	%ebx, %r8d
ffff80000010f2bc: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f2bf: 48 b8 80 f8 10 00 00 80 ff ff	movabsq	$-140737487243136, %rax # imm = 0xFFFF80000010F880
ffff80000010f2c9: ff d0                	callq	*%rax
; 			break;
ffff80000010f2cb: 49 83 c6 01          	addq	$1, %r14
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff80000010f2cf: 41 0f b6 3e          	movzbl	(%r14), %edi
ffff80000010f2d3: 49 83 c6 01          	addq	$1, %r14
ffff80000010f2d7: 83 ff 25             	cmpl	$37, %edi
ffff80000010f2da: 74 14                	je	0xffff80000010f2f0 <vprintfmt+0xa0>
ffff80000010f2dc: 40 84 ff             	testb	%dil, %dil
ffff80000010f2df: 0f 84 2e 04 00 00    	je	0xffff80000010f713 <vprintfmt+0x4c3>
ffff80000010f2e5: 48 89 de             	movq	%rbx, %rsi
ffff80000010f2e8: 41 ff d7             	callq	*%r15
ffff80000010f2eb: eb e2                	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
ffff80000010f2ed: 0f 1f 00             	nopl	(%rax)
ffff80000010f2f0: 41 b5 20             	movb	$32, %r13b
ffff80000010f2f3: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010f2f8: 31 f6                	xorl	%esi, %esi
ffff80000010f2fa: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f2fe: 41 bf ff ff ff ff    	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
ffff80000010f304: c7 45 a8 00 00 00 00 	movl	$0, -88(%rbp)
ffff80000010f30b: 48 bf 10 33 11 00 00 80 ff ff	movabsq	$-140737487228144, %rdi # imm = 0xFFFF800000113310
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f315: 4d 8d 66 01          	leaq	1(%r14), %r12
ffff80000010f319: eb 10                	jmp	0xffff80000010f32b <vprintfmt+0xdb>
ffff80000010f31b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f320: 49 83 c6 01          	addq	$1, %r14
ffff80000010f324: 49 83 c4 01          	addq	$1, %r12
ffff80000010f328: 41 89 cd             	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f32b: 41 0f b6 0e          	movzbl	(%r14), %ecx
ffff80000010f32f: 8d 51 dd             	leal	-35(%rcx), %edx
ffff80000010f332: 80 fa 55             	cmpb	$85, %dl
ffff80000010f335: 0f 87 25 01 00 00    	ja	0xffff80000010f460 <vprintfmt+0x210>
ffff80000010f33b: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010f33e: ff 24 d7             	jmpq	*(%rdi,%rdx,8)
ffff80000010f341: b1 30                	movb	$48, %cl
ffff80000010f343: eb db                	jmp	0xffff80000010f320 <vprintfmt+0xd0>
ffff80000010f345: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f34f: 90                   	nop
ffff80000010f350: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010f353: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010f356: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
ffff80000010f360: 43 8d 14 bf          	leal	(%r15,%r15,4), %edx
ffff80000010f364: 44 8d 3c 51          	leal	(%rcx,%rdx,2), %r15d
ffff80000010f368: 41 83 c7 d0          	addl	$-48, %r15d
; 				ch = *fmt;
ffff80000010f36c: 41 0f be 4e 01       	movsbl	1(%r14), %ecx
; 				precision = precision * 10 + ch - '0';
ffff80000010f371: 49 83 c6 01          	addq	$1, %r14
; 				if (ch < '0' || ch > '9')
ffff80000010f375: 8d 51 c6             	leal	-58(%rcx), %edx
ffff80000010f378: 80 fa f6             	cmpb	$-10, %dl
ffff80000010f37b: 73 e3                	jae	0xffff80000010f360 <vprintfmt+0x110>
; 			if (width < 0)
ffff80000010f37d: 85 db                	testl	%ebx, %ebx
ffff80000010f37f: 41 0f 48 df          	cmovsl	%r15d, %ebx
ffff80000010f383: b9 ff ff ff ff       	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
ffff80000010f388: 44 0f 48 f9          	cmovsl	%ecx, %r15d
ffff80000010f38c: eb 87                	jmp	0xffff80000010f315 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010f38e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f392: 49 83 c6 01          	addq	$1, %r14
ffff80000010f396: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f39a: 77 39                	ja	0xffff80000010f3d5 <vprintfmt+0x185>
ffff80000010f39c: 48 89 ca             	movq	%rcx, %rdx
ffff80000010f39f: 48 01 c2             	addq	%rax, %rdx
ffff80000010f3a2: 83 c1 08             	addl	$8, %ecx
ffff80000010f3a5: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f3a8: 44 8b 3a             	movl	(%rdx), %r15d
ffff80000010f3ab: eb d0                	jmp	0xffff80000010f37d <vprintfmt+0x12d>
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010f3ad: 49 83 c6 01          	addq	$1, %r14
ffff80000010f3b1: c7 45 a8 01 00 00 00 	movl	$1, -88(%rbp)
ffff80000010f3b8: e9 58 ff ff ff       	jmp	0xffff80000010f315 <vprintfmt+0xc5>
; 			if (width < 0)
ffff80000010f3bd: 85 db                	testl	%ebx, %ebx
ffff80000010f3bf: b9 00 00 00 00       	movl	$0, %ecx
ffff80000010f3c4: 0f 48 d9             	cmovsl	%ecx, %ebx
ffff80000010f3c7: eb 03                	jmp	0xffff80000010f3cc <vprintfmt+0x17c>
; 			lflag++;
ffff80000010f3c9: 83 c6 01             	addl	$1, %esi
ffff80000010f3cc: 49 83 c6 01          	addq	$1, %r14
ffff80000010f3d0: e9 40 ff ff ff       	jmp	0xffff80000010f315 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010f3d5: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010f3d9: 48 8d 51 08          	leaq	8(%rcx), %rdx
ffff80000010f3dd: 48 89 55 b8          	movq	%rdx, -72(%rbp)
ffff80000010f3e1: 44 8b 39             	movl	(%rcx), %r15d
ffff80000010f3e4: eb 97                	jmp	0xffff80000010f37d <vprintfmt+0x12d>
; 			putch(ch, putdat);
ffff80000010f3e6: bf 25 00 00 00       	movl	$37, %edi
ffff80000010f3eb: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f3ef: 48 89 de             	movq	%rbx, %rsi
ffff80000010f3f2: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f3f6: 41 ff d7             	callq	*%r15
; 			break;
ffff80000010f3f9: 49 83 c6 01          	addq	$1, %r14
ffff80000010f3fd: e9 cd fe ff ff       	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; 			err = va_arg(ap, int);
ffff80000010f402: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f406: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f40a: 0f 87 3a 01 00 00    	ja	0xffff80000010f54a <vprintfmt+0x2fa>
ffff80000010f410: 48 89 c8             	movq	%rcx, %rax
ffff80000010f413: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f417: 83 c1 08             	addl	$8, %ecx
ffff80000010f41a: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f41d: e9 34 01 00 00       	jmp	0xffff80000010f556 <vprintfmt+0x306>
; 			num = getuint(&ap, lflag);
ffff80000010f422: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f426: 48 b8 00 f8 10 00 00 80 ff ff	movabsq	$-140737487243264, %rax # imm = 0xFFFF80000010F800
ffff80000010f430: ff d0                	callq	*%rax
ffff80000010f432: 49 89 c4             	movq	%rax, %r12
ffff80000010f435: 41 bf 08 00 00 00    	movl	$8, %r15d
ffff80000010f43b: e9 64 fe ff ff       	jmp	0xffff80000010f2a4 <vprintfmt+0x54>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010f440: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f444: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f448: 0f 87 55 01 00 00    	ja	0xffff80000010f5a3 <vprintfmt+0x353>
ffff80000010f44e: 48 89 c8             	movq	%rcx, %rax
ffff80000010f451: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f455: 83 c1 08             	addl	$8, %ecx
ffff80000010f458: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f45b: e9 4f 01 00 00       	jmp	0xffff80000010f5af <vprintfmt+0x35f>
; 			putch('%', putdat);
ffff80000010f460: bf 25 00 00 00       	movl	$37, %edi
ffff80000010f465: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f469: 48 89 de             	movq	%rbx, %rsi
ffff80000010f46c: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f470: 41 ff d7             	callq	*%r15
ffff80000010f473: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f47d: 0f 1f 00             	nopl	(%rax)
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff80000010f480: 4d 8d 74 24 ff       	leaq	-1(%r12), %r14
ffff80000010f485: 41 80 7c 24 fe 25    	cmpb	$37, -2(%r12)
ffff80000010f48b: 4d 89 f4             	movq	%r14, %r12
ffff80000010f48e: 75 f0                	jne	0xffff80000010f480 <vprintfmt+0x230>
ffff80000010f490: e9 3a fe ff ff       	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010f495: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f499: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f49d: 0f 87 07 02 00 00    	ja	0xffff80000010f6aa <vprintfmt+0x45a>
ffff80000010f4a3: 48 89 c8             	movq	%rcx, %rax
ffff80000010f4a6: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f4aa: 83 c1 08             	addl	$8, %ecx
ffff80000010f4ad: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f4b0: e9 01 02 00 00       	jmp	0xffff80000010f6b6 <vprintfmt+0x466>
; 			num = getint(&ap, lflag);
ffff80000010f4b5: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f4b9: 48 b8 80 f7 10 00 00 80 ff ff	movabsq	$-140737487243392, %rax # imm = 0xFFFF80000010F780
ffff80000010f4c3: ff d0                	callq	*%rax
ffff80000010f4c5: 49 89 c4             	movq	%rax, %r12
ffff80000010f4c8: 41 bf 0a 00 00 00    	movl	$10, %r15d
; 			if ((long long) num < 0) {
ffff80000010f4ce: 48 85 c0             	testq	%rax, %rax
ffff80000010f4d1: 0f 89 cd fd ff ff    	jns	0xffff80000010f2a4 <vprintfmt+0x54>
; 				putch('-', putdat);
ffff80000010f4d7: bf 2d 00 00 00       	movl	$45, %edi
ffff80000010f4dc: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010f4e0: ff 55 c8             	callq	*-56(%rbp)
; 				num = -(long long) num;
ffff80000010f4e3: 49 f7 dc             	negq	%r12
ffff80000010f4e6: e9 b9 fd ff ff       	jmp	0xffff80000010f2a4 <vprintfmt+0x54>
; 			putch('0', putdat);
ffff80000010f4eb: bf 30 00 00 00       	movl	$48, %edi
ffff80000010f4f0: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010f4f4: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f4f7: 4c 8b 65 c8          	movq	-56(%rbp), %r12
ffff80000010f4fb: 41 ff d4             	callq	*%r12
; 			putch('x', putdat);
ffff80000010f4fe: bf 78 00 00 00       	movl	$120, %edi
ffff80000010f503: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f506: 41 ff d4             	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010f509: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010f50d: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010f511: 0f 87 b2 01 00 00    	ja	0xffff80000010f6c9 <vprintfmt+0x479>
ffff80000010f517: 48 89 c8             	movq	%rcx, %rax
ffff80000010f51a: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010f51e: 83 c1 08             	addl	$8, %ecx
ffff80000010f521: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010f524: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f527: e9 72 fd ff ff       	jmp	0xffff80000010f29e <vprintfmt+0x4e>
; 			num = getuint(&ap, lflag);
ffff80000010f52c: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010f530: 48 b8 00 f8 10 00 00 80 ff ff	movabsq	$-140737487243264, %rax # imm = 0xFFFF80000010F800
ffff80000010f53a: ff d0                	callq	*%rax
ffff80000010f53c: 49 89 c4             	movq	%rax, %r12
ffff80000010f53f: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010f545: e9 5a fd ff ff       	jmp	0xffff80000010f2a4 <vprintfmt+0x54>
; 			err = va_arg(ap, int);
ffff80000010f54a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f54e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f552: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f556: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			err = va_arg(ap, int);
ffff80000010f55a: 49 83 c6 01          	addq	$1, %r14
ffff80000010f55e: 8b 00                	movl	(%rax), %eax
; 			if (err < 0)
ffff80000010f560: 89 c1                	movl	%eax, %ecx
ffff80000010f562: f7 d9                	negl	%ecx
ffff80000010f564: 0f 48 c8             	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010f567: 83 f9 08             	cmpl	$8, %ecx
ffff80000010f56a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f56e: 77 0d                	ja	0xffff80000010f57d <vprintfmt+0x32d>
ffff80000010f570: 83 f9 03             	cmpl	$3, %ecx
ffff80000010f573: 74 08                	je	0xffff80000010f57d <vprintfmt+0x32d>
ffff80000010f575: 85 c9                	testl	%ecx, %ecx
ffff80000010f577: 0f 85 60 01 00 00    	jne	0xffff80000010f6dd <vprintfmt+0x48d>
; 				printfmt(putch, putdat, "error %d", err);
ffff80000010f57d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f580: 48 ba 42 42 11 00 00 80 ff ff	movabsq	$-140737487224254, %rdx # imm = 0xFFFF800000114242
ffff80000010f58a: 31 c0                	xorl	%eax, %eax
ffff80000010f58c: 49 89 f4             	movq	%rsi, %r12
ffff80000010f58f: 48 bb 30 f7 10 00 00 80 ff ff	movabsq	$-140737487243472, %rbx # imm = 0xFFFF80000010F730
ffff80000010f599: ff d3                	callq	*%rbx
ffff80000010f59b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010f59e: e9 2c fd ff ff       	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010f5a3: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f5a7: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f5ab: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f5af: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f5b2: 4d 85 e4             	testq	%r12, %r12
ffff80000010f5b5: 48 b8 fe 44 11 00 00 80 ff ff	movabsq	$-140737487223554, %rax # imm = 0xFFFF8000001144FE
ffff80000010f5bf: 4c 0f 44 e0          	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
ffff80000010f5c3: 85 db                	testl	%ebx, %ebx
ffff80000010f5c5: 7e 50                	jle	0xffff80000010f617 <vprintfmt+0x3c7>
ffff80000010f5c7: 41 80 fd 2d          	cmpb	$45, %r13b
ffff80000010f5cb: 74 4a                	je	0xffff80000010f617 <vprintfmt+0x3c7>
ffff80000010f5cd: 44 88 6d ac          	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f5d1: 49 63 f7             	movslq	%r15d, %rsi
ffff80000010f5d4: 4c 89 e7             	movq	%r12, %rdi
ffff80000010f5d7: 48 b8 00 01 11 00 00 80 ff ff	movabsq	$-140737487240960, %rax # imm = 0xFFFF800000110100
ffff80000010f5e1: ff d0                	callq	*%rax
ffff80000010f5e3: 41 89 dd             	movl	%ebx, %r13d
ffff80000010f5e6: 41 29 c5             	subl	%eax, %r13d
ffff80000010f5e9: 7e 2f                	jle	0xffff80000010f61a <vprintfmt+0x3ca>
ffff80000010f5eb: 0f b6 4d ac          	movzbl	-84(%rbp), %ecx
ffff80000010f5ef: 89 4d ac             	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f5f2: 29 c3                	subl	%eax, %ebx
ffff80000010f5f4: 83 c3 01             	addl	$1, %ebx
ffff80000010f5f7: 4c 8b 6d c8          	movq	-56(%rbp), %r13
ffff80000010f5fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f600: 8b 7d ac             	movl	-84(%rbp), %edi
ffff80000010f603: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
ffff80000010f607: 41 ff d5             	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010f60a: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f60d: 83 fb 01             	cmpl	$1, %ebx
ffff80000010f610: 7f ee                	jg	0xffff80000010f600 <vprintfmt+0x3b0>
ffff80000010f612: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010f615: eb 03                	jmp	0xffff80000010f61a <vprintfmt+0x3ca>
ffff80000010f617: 41 89 dd             	movl	%ebx, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010f61a: 41 8a 04 24          	movb	(%r12), %al
ffff80000010f61e: 84 c0                	testb	%al, %al
ffff80000010f620: 74 49                	je	0xffff80000010f66b <vprintfmt+0x41b>
ffff80000010f622: 49 83 c4 01          	addq	$1, %r12
ffff80000010f626: 8b 5d a8             	movl	-88(%rbp), %ebx
ffff80000010f629: eb 35                	jmp	0xffff80000010f660 <vprintfmt+0x410>
ffff80000010f62b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f630: 0f be c0             	movsbl	%al, %eax
ffff80000010f633: 8d 48 81             	leal	-127(%rax), %ecx
ffff80000010f636: 80 f9 a1             	cmpb	$-95, %cl
ffff80000010f639: 89 c7                	movl	%eax, %edi
ffff80000010f63b: b9 3f 00 00 00       	movl	$63, %ecx
ffff80000010f640: 0f 42 f9             	cmovbl	%ecx, %edi
ffff80000010f643: 85 db                	testl	%ebx, %ebx
ffff80000010f645: 0f 44 f8             	cmovel	%eax, %edi
ffff80000010f648: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010f64c: ff 55 c8             	callq	*-56(%rbp)
; 					width--)
ffff80000010f64f: 41 83 c5 ff          	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010f653: 41 0f b6 04 24       	movzbl	(%r12), %eax
ffff80000010f658: 49 83 c4 01          	addq	$1, %r12
ffff80000010f65c: 84 c0                	testb	%al, %al
ffff80000010f65e: 74 0b                	je	0xffff80000010f66b <vprintfmt+0x41b>
ffff80000010f660: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f663: 78 cb                	js	0xffff80000010f630 <vprintfmt+0x3e0>
ffff80000010f665: 41 83 ef 01          	subl	$1, %r15d
ffff80000010f669: 73 c5                	jae	0xffff80000010f630 <vprintfmt+0x3e0>
ffff80000010f66b: 49 83 c6 01          	addq	$1, %r14
; 			for (; width > 0; width--)
ffff80000010f66f: 45 85 ed             	testl	%r13d, %r13d
ffff80000010f672: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010f676: 48 8b 5d d0          	movq	-48(%rbp), %rbx
; 			for (; width > 0; width--)
ffff80000010f67a: 0f 8e 4f fc ff ff    	jle	0xffff80000010f2cf <vprintfmt+0x7f>
; 	while (1) {
ffff80000010f680: 41 83 c5 01          	addl	$1, %r13d
ffff80000010f684: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f68e: 66 90                	nop
; 				putch(' ', putdat);
ffff80000010f690: bf 20 00 00 00       	movl	$32, %edi
ffff80000010f695: 48 89 de             	movq	%rbx, %rsi
ffff80000010f698: 41 ff d7             	callq	*%r15
; 			for (; width > 0; width--)
ffff80000010f69b: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010f69f: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010f6a3: 7f eb                	jg	0xffff80000010f690 <vprintfmt+0x440>
ffff80000010f6a5: e9 25 fc ff ff       	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010f6aa: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f6ae: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f6b2: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f6b6: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010f6ba: 4c 8b 7d c8          	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
ffff80000010f6be: 49 83 c6 01          	addq	$1, %r14
ffff80000010f6c2: 8b 38                	movl	(%rax), %edi
ffff80000010f6c4: e9 1c fc ff ff       	jmp	0xffff80000010f2e5 <vprintfmt+0x95>
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010f6c9: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010f6cd: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f6d1: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f6d5: 4c 8b 20             	movq	(%rax), %r12
ffff80000010f6d8: e9 c1 fb ff ff       	jmp	0xffff80000010f29e <vprintfmt+0x4e>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010f6dd: 89 c8                	movl	%ecx, %eax
ffff80000010f6df: 48 b9 c0 35 11 00 00 80 ff ff	movabsq	$-140737487227456, %rcx # imm = 0xFFFF8000001135C0
ffff80000010f6e9: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
ffff80000010f6ed: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f6f0: 48 ba f3 3b 11 00 00 80 ff ff	movabsq	$-140737487225869, %rdx # imm = 0xFFFF800000113BF3
ffff80000010f6fa: 31 c0                	xorl	%eax, %eax
ffff80000010f6fc: 49 89 f4             	movq	%rsi, %r12
; 				printfmt(putch, putdat, "%s", p);
ffff80000010f6ff: 48 bb 30 f7 10 00 00 80 ff ff	movabsq	$-140737487243472, %rbx # imm = 0xFFFF80000010F730
ffff80000010f709: ff d3                	callq	*%rbx
ffff80000010f70b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010f70e: e9 bc fb ff ff       	jmp	0xffff80000010f2cf <vprintfmt+0x7f>
; }
ffff80000010f713: 48 83 c4 38          	addq	$56, %rsp
ffff80000010f717: 5b                   	popq	%rbx
ffff80000010f718: 41 5c                	popq	%r12
ffff80000010f71a: 41 5d                	popq	%r13
ffff80000010f71c: 41 5e                	popq	%r14
ffff80000010f71e: 41 5f                	popq	%r15
ffff80000010f720: 5d                   	popq	%rbp
ffff80000010f721: c3                   	retq
ffff80000010f722: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f72c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f730 <printfmt>:
; {
ffff80000010f730: 55                   	pushq	%rbp
ffff80000010f731: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f734: 48 83 ec 50          	subq	$80, %rsp
ffff80000010f738: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010f73c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010f740: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010f744: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010f748: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f74c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010f750: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f754: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010f75e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000010f762: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010f76c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010f770: ff d0                	callq	*%rax
; }
ffff80000010f772: 48 83 c4 50          	addq	$80, %rsp
ffff80000010f776: 5d                   	popq	%rbp
ffff80000010f777: c3                   	retq
ffff80000010f778: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f780 <getint>:
; {
ffff80000010f780: 55                   	pushq	%rbp
ffff80000010f781: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010f784: 83 fe 02             	cmpl	$2, %esi
ffff80000010f787: 7c 17                	jl	0xffff80000010f7a0 <getint+0x20>
; 		return va_arg(*ap, long long);
ffff80000010f789: 48 63 07             	movslq	(%rdi), %rax
ffff80000010f78c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010f790: 77 2b                	ja	0xffff80000010f7bd <getint+0x3d>
ffff80000010f792: 48 89 c1             	movq	%rax, %rcx
ffff80000010f795: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f799: 83 c0 08             	addl	$8, %eax
ffff80000010f79c: 89 07                	movl	%eax, (%rdi)
ffff80000010f79e: eb 18                	jmp	0xffff80000010f7b8 <getint+0x38>
ffff80000010f7a0: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010f7a3: 85 f6                	testl	%esi, %esi
ffff80000010f7a5: 74 27                	je	0xffff80000010f7ce <getint+0x4e>
ffff80000010f7a7: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, long);
ffff80000010f7aa: 77 11                	ja	0xffff80000010f7bd <getint+0x3d>
ffff80000010f7ac: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
ffff80000010f7b0: 48 01 c1             	addq	%rax, %rcx
ffff80000010f7b3: 83 c0 08             	addl	$8, %eax
ffff80000010f7b6: 89 07                	movl	%eax, (%rdi)
ffff80000010f7b8: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010f7bb: 5d                   	popq	%rbp
ffff80000010f7bc: c3                   	retq
ffff80000010f7bd: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f7c1: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f7c5: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010f7c9: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010f7cc: 5d                   	popq	%rbp
ffff80000010f7cd: c3                   	retq
ffff80000010f7ce: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, int);
ffff80000010f7d1: 77 0e                	ja	0xffff80000010f7e1 <getint+0x61>
ffff80000010f7d3: 48 89 c1             	movq	%rax, %rcx
ffff80000010f7d6: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f7da: 83 c0 08             	addl	$8, %eax
ffff80000010f7dd: 89 07                	movl	%eax, (%rdi)
ffff80000010f7df: eb 0c                	jmp	0xffff80000010f7ed <getint+0x6d>
ffff80000010f7e1: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f7e5: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010f7e9: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010f7ed: 48 63 01             	movslq	(%rcx), %rax
; }
ffff80000010f7f0: 5d                   	popq	%rbp
ffff80000010f7f1: c3                   	retq
ffff80000010f7f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f7fc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f800 <getuint>:
; {
ffff80000010f800: 55                   	pushq	%rbp
ffff80000010f801: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010f804: 83 fe 02             	cmpl	$2, %esi
ffff80000010f807: 7c 17                	jl	0xffff80000010f820 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
ffff80000010f809: 48 63 07             	movslq	(%rdi), %rax
ffff80000010f80c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010f810: 77 2b                	ja	0xffff80000010f83d <getuint+0x3d>
ffff80000010f812: 48 89 c1             	movq	%rax, %rcx
ffff80000010f815: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f819: 83 c0 08             	addl	$8, %eax
ffff80000010f81c: 89 07                	movl	%eax, (%rdi)
ffff80000010f81e: eb 18                	jmp	0xffff80000010f838 <getuint+0x38>
ffff80000010f820: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010f823: 85 f6                	testl	%esi, %esi
ffff80000010f825: 74 27                	je	0xffff80000010f84e <getuint+0x4e>
ffff80000010f827: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
ffff80000010f82a: 77 11                	ja	0xffff80000010f83d <getuint+0x3d>
ffff80000010f82c: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000010f830: 48 01 c1             	addq	%rax, %rcx
ffff80000010f833: 83 c0 08             	addl	$8, %eax
ffff80000010f836: 89 07                	movl	%eax, (%rdi)
ffff80000010f838: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010f83b: 5d                   	popq	%rbp
ffff80000010f83c: c3                   	retq
ffff80000010f83d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010f841: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010f845: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010f849: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010f84c: 5d                   	popq	%rbp
ffff80000010f84d: c3                   	retq
ffff80000010f84e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
ffff80000010f851: 77 0e                	ja	0xffff80000010f861 <getuint+0x61>
ffff80000010f853: 48 89 c1             	movq	%rax, %rcx
ffff80000010f856: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010f85a: 83 c0 08             	addl	$8, %eax
ffff80000010f85d: 89 07                	movl	%eax, (%rdi)
ffff80000010f85f: eb 0c                	jmp	0xffff80000010f86d <getuint+0x6d>
ffff80000010f861: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010f865: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010f869: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010f86d: 8b 01                	movl	(%rcx), %eax
; }
ffff80000010f86f: 5d                   	popq	%rbp
ffff80000010f870: c3                   	retq
ffff80000010f871: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f87b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f880 <printnum>:
; {
ffff80000010f880: 55                   	pushq	%rbp
ffff80000010f881: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f884: 41 57                	pushq	%r15
ffff80000010f886: 41 56                	pushq	%r14
ffff80000010f888: 41 55                	pushq	%r13
ffff80000010f88a: 41 54                	pushq	%r12
ffff80000010f88c: 53                   	pushq	%rbx
ffff80000010f88d: 50                   	pushq	%rax
ffff80000010f88e: 45 89 cd             	movl	%r9d, %r13d
ffff80000010f891: 44 89 c3             	movl	%r8d, %ebx
ffff80000010f894: 49 89 f6             	movq	%rsi, %r14
ffff80000010f897: 49 89 fc             	movq	%rdi, %r12
; 	if (num >= base) {
ffff80000010f89a: 41 89 cf             	movl	%ecx, %r15d
ffff80000010f89d: 49 39 d7             	cmpq	%rdx, %r15
ffff80000010f8a0: 48 89 55 d0          	movq	%rdx, -48(%rbp)
ffff80000010f8a4: 76 1d                	jbe	0xffff80000010f8c3 <printnum+0x43>
; 		while (--width > 0)
ffff80000010f8a6: 83 fb 02             	cmpl	$2, %ebx
ffff80000010f8a9: 7c 3f                	jl	0xffff80000010f8ea <printnum+0x6a>
ffff80000010f8ab: 83 c3 01             	addl	$1, %ebx
ffff80000010f8ae: 66 90                	nop
; 			putch(padc, putdat);
ffff80000010f8b0: 44 89 ef             	movl	%r13d, %edi
ffff80000010f8b3: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f8b6: 41 ff d4             	callq	*%r12
; 		while (--width > 0)
ffff80000010f8b9: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f8bc: 83 fb 02             	cmpl	$2, %ebx
ffff80000010f8bf: 7f ef                	jg	0xffff80000010f8b0 <printnum+0x30>
ffff80000010f8c1: eb 27                	jmp	0xffff80000010f8ea <printnum+0x6a>
ffff80000010f8c3: 48 89 d0             	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff80000010f8c6: 31 d2                	xorl	%edx, %edx
ffff80000010f8c8: 49 f7 f7             	divq	%r15
ffff80000010f8cb: 83 c3 ff             	addl	$-1, %ebx
ffff80000010f8ce: 49 ba 80 f8 10 00 00 80 ff ff	movabsq	$-140737487243136, %r10 # imm = 0xFFFF80000010F880
ffff80000010f8d8: 4c 89 e7             	movq	%r12, %rdi
ffff80000010f8db: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f8de: 48 89 c2             	movq	%rax, %rdx
ffff80000010f8e1: 41 89 d8             	movl	%ebx, %r8d
ffff80000010f8e4: 45 89 e9             	movl	%r13d, %r9d
ffff80000010f8e7: 41 ff d2             	callq	*%r10
ffff80000010f8ea: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
ffff80000010f8ee: 31 d2                	xorl	%edx, %edx
ffff80000010f8f0: 49 f7 f7             	divq	%r15
ffff80000010f8f3: 48 b8 4b 42 11 00 00 80 ff ff	movabsq	$-140737487224245, %rax # imm = 0xFFFF80000011424B
ffff80000010f8fd: 0f be 3c 02          	movsbl	(%rdx,%rax), %edi
ffff80000010f901: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f904: 41 ff d4             	callq	*%r12
; }
ffff80000010f907: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f90b: 5b                   	popq	%rbx
ffff80000010f90c: 41 5c                	popq	%r12
ffff80000010f90e: 41 5d                	popq	%r13
ffff80000010f910: 41 5e                	popq	%r14
ffff80000010f912: 41 5f                	popq	%r15
ffff80000010f914: 5d                   	popq	%rbp
ffff80000010f915: c3                   	retq
ffff80000010f916: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f920 <vsnprintf>:
; {
ffff80000010f920: 55                   	pushq	%rbp
ffff80000010f921: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f924: 48 83 ec 20          	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff80000010f928: 48 89 7d e8          	movq	%rdi, -24(%rbp)
ffff80000010f92c: 48 63 c6             	movslq	%esi, %rax
ffff80000010f92f: 48 01 f8             	addq	%rdi, %rax
ffff80000010f932: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010f936: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f93a: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010f941: b8 fb ff ff ff       	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
ffff80000010f946: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f949: 74 28                	je	0xffff80000010f973 <vsnprintf+0x53>
ffff80000010f94b: 85 f6                	testl	%esi, %esi
ffff80000010f94d: 7e 24                	jle	0xffff80000010f973 <vsnprintf+0x53>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff80000010f94f: 48 bf 80 f9 10 00 00 80 ff ff	movabsq	$-140737487242880, %rdi # imm = 0xFFFF80000010F980
ffff80000010f959: 48 b8 50 f2 10 00 00 80 ff ff	movabsq	$-140737487244720, %rax # imm = 0xFFFF80000010F250
ffff80000010f963: 48 8d 75 e8          	leaq	-24(%rbp), %rsi
ffff80000010f967: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff80000010f969: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f96d: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff80000010f970: 8b 45 f8             	movl	-8(%rbp), %eax
; }
ffff80000010f973: 48 83 c4 20          	addq	$32, %rsp
ffff80000010f977: 5d                   	popq	%rbp
ffff80000010f978: c3                   	retq
ffff80000010f979: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f980 <sprintputch>:
; {
ffff80000010f980: 55                   	pushq	%rbp
ffff80000010f981: 48 89 e5             	movq	%rsp, %rbp
; 	b->cnt++;
ffff80000010f984: 83 46 10 01          	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
ffff80000010f988: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f98b: 48 3b 46 08          	cmpq	8(%rsi), %rax
ffff80000010f98f: 73 0a                	jae	0xffff80000010f99b <sprintputch+0x1b>
; 		*b->buf++ = ch;
ffff80000010f991: 48 8d 48 01          	leaq	1(%rax), %rcx
ffff80000010f995: 48 89 0e             	movq	%rcx, (%rsi)
ffff80000010f998: 40 88 38             	movb	%dil, (%rax)
; }
ffff80000010f99b: 5d                   	popq	%rbp
ffff80000010f99c: c3                   	retq
ffff80000010f99d: 0f 1f 00             	nopl	(%rax)

ffff80000010f9a0 <snprintf>:
; {
ffff80000010f9a0: 55                   	pushq	%rbp
ffff80000010f9a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9a4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010f9a8: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010f9ac: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010f9b0: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010f9b4: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010f9b8: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f9bc: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010f9c0: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f9c4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010f9ce: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff80000010f9d2: 48 b8 20 f9 10 00 00 80 ff ff	movabsq	$-140737487242976, %rax # imm = 0xFFFF80000010F920
ffff80000010f9dc: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010f9e0: ff d0                	callq	*%rax
; 	return rc;
ffff80000010f9e2: 48 83 c4 50          	addq	$80, %rsp
ffff80000010f9e6: 5d                   	popq	%rbp
ffff80000010f9e7: c3                   	retq
ffff80000010f9e8: cc                   	int3
ffff80000010f9e9: cc                   	int3
ffff80000010f9ea: cc                   	int3
ffff80000010f9eb: cc                   	int3
ffff80000010f9ec: cc                   	int3
ffff80000010f9ed: cc                   	int3
ffff80000010f9ee: cc                   	int3
ffff80000010f9ef: cc                   	int3

ffff80000010f9f0 <rb_first>:
; {
ffff80000010f9f0: 55                   	pushq	%rbp
ffff80000010f9f1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_LEFT);
ffff80000010f9f4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010f9f7: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010fa01: 31 f6                	xorl	%esi, %esi
ffff80000010fa03: ff d0                	callq	*%rax
ffff80000010fa05: 5d                   	popq	%rbp
ffff80000010fa06: c3                   	retq
ffff80000010fa07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fa10 <get_outermost>:
; {
ffff80000010fa10: 55                   	pushq	%rbp
ffff80000010fa11: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node) {
ffff80000010fa14: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fa17: 74 16                	je	0xffff80000010fa2f <get_outermost+0x1f>
ffff80000010fa19: 89 f1                	movl	%esi, %ecx
ffff80000010fa1b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010fa20: 48 89 f8             	movq	%rdi, %rax
; 	while (node->child[dir]) {
ffff80000010fa23: 48 8b 7c cf 08       	movq	8(%rdi,%rcx,8), %rdi
ffff80000010fa28: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fa2b: 75 f3                	jne	0xffff80000010fa20 <get_outermost+0x10>
; }
ffff80000010fa2d: 5d                   	popq	%rbp
ffff80000010fa2e: c3                   	retq
ffff80000010fa2f: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fa31: 5d                   	popq	%rbp
ffff80000010fa32: c3                   	retq
ffff80000010fa33: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fa3d: 0f 1f 00             	nopl	(%rax)

ffff80000010fa40 <rb_last>:
; {
ffff80000010fa40: 55                   	pushq	%rbp
ffff80000010fa41: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_RIGHT);
ffff80000010fa44: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010fa47: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010fa51: be 01 00 00 00       	movl	$1, %esi
ffff80000010fa56: ff d0                	callq	*%rax
ffff80000010fa58: 5d                   	popq	%rbp
ffff80000010fa59: c3                   	retq
ffff80000010fa5a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010fa60 <rb_next>:
; {
ffff80000010fa60: 55                   	pushq	%rbp
ffff80000010fa61: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_RIGHT);
ffff80000010fa64: 48 b8 80 fa 10 00 00 80 ff ff	movabsq	$-140737487242624, %rax # imm = 0xFFFF80000010FA80
ffff80000010fa6e: be 01 00 00 00       	movl	$1, %esi
ffff80000010fa73: ff d0                	callq	*%rax
ffff80000010fa75: 5d                   	popq	%rbp
ffff80000010fa76: c3                   	retq
ffff80000010fa77: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fa80 <get_closest>:
; {
ffff80000010fa80: 55                   	pushq	%rbp
ffff80000010fa81: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node)
ffff80000010fa84: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fa87: 74 3b                	je	0xffff80000010fac4 <get_closest+0x44>
; 	if (node->child[dir])
ffff80000010fa89: 89 f1                	movl	%esi, %ecx
ffff80000010fa8b: 48 8b 44 cf 08       	movq	8(%rdi,%rcx,8), %rax
ffff80000010fa90: 48 85 c0             	testq	%rax, %rax
ffff80000010fa93: 74 25                	je	0xffff80000010faba <get_closest+0x3a>
; 		return get_outermost(node->child[dir], !dir);
ffff80000010fa95: 31 c9                	xorl	%ecx, %ecx
ffff80000010fa97: 85 f6                	testl	%esi, %esi
ffff80000010fa99: 0f 94 c1             	sete	%cl
ffff80000010fa9c: 48 ba 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rdx # imm = 0xFFFF80000010FA10
ffff80000010faa6: 48 89 c7             	movq	%rax, %rdi
ffff80000010faa9: 89 ce                	movl	%ecx, %esi
ffff80000010faab: ff d2                	callq	*%rdx
; }
ffff80000010faad: 5d                   	popq	%rbp
ffff80000010faae: c3                   	retq
ffff80000010faaf: 90                   	nop
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff80000010fab0: 48 39 7c c8 08       	cmpq	%rdi, 8(%rax,%rcx,8)
ffff80000010fab5: 48 89 c7             	movq	%rax, %rdi
ffff80000010fab8: 75 08                	jne	0xffff80000010fac2 <get_closest+0x42>
ffff80000010faba: 48 8b 07             	movq	(%rdi), %rax
ffff80000010fabd: 48 85 c0             	testq	%rax, %rax
ffff80000010fac0: 75 ee                	jne	0xffff80000010fab0 <get_closest+0x30>
; }
ffff80000010fac2: 5d                   	popq	%rbp
ffff80000010fac3: c3                   	retq
ffff80000010fac4: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fac6: 5d                   	popq	%rbp
ffff80000010fac7: c3                   	retq
ffff80000010fac8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010fad0 <rb_prev>:
; {
ffff80000010fad0: 55                   	pushq	%rbp
ffff80000010fad1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_LEFT);
ffff80000010fad4: 48 b8 80 fa 10 00 00 80 ff ff	movabsq	$-140737487242624, %rax # imm = 0xFFFF80000010FA80
ffff80000010fade: 31 f6                	xorl	%esi, %esi
ffff80000010fae0: ff d0                	callq	*%rax
ffff80000010fae2: 5d                   	popq	%rbp
ffff80000010fae3: c3                   	retq
ffff80000010fae4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010faee: 66 90                	nop

ffff80000010faf0 <rb_balance>:
; {
ffff80000010faf0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010faf5: 48 85 ff             	testq	%rdi, %rdi
ffff80000010faf8: 0f 84 f0 00 00 00    	je	0xffff80000010fbee <rb_balance+0xfe>
ffff80000010fafe: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fb01: 0f 84 e7 00 00 00    	je	0xffff80000010fbee <rb_balance+0xfe>
ffff80000010fb07: 55                   	pushq	%rbp
ffff80000010fb08: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fb0b: 41 57                	pushq	%r15
ffff80000010fb0d: 41 56                	pushq	%r14
ffff80000010fb0f: 41 55                	pushq	%r13
ffff80000010fb11: 41 54                	pushq	%r12
ffff80000010fb13: 53                   	pushq	%rbx
ffff80000010fb14: 50                   	pushq	%rax
ffff80000010fb15: 49 89 fe             	movq	%rdi, %r14
; 	node->color = RB_RED;
ffff80000010fb18: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fb1f: 48 8b 1e             	movq	(%rsi), %rbx
ffff80000010fb22: 48 85 db             	testq	%rbx, %rbx
ffff80000010fb25: 0f 84 a9 00 00 00    	je	0xffff80000010fbd4 <rb_balance+0xe4>
ffff80000010fb2b: 49 bd f0 fb 10 00 00 80 ff ff	movabsq	$-140737487242256, %r13 # imm = 0xFFFF80000010FBF0
ffff80000010fb35: eb 2a                	jmp	0xffff80000010fb61 <rb_balance+0x71>
ffff80000010fb37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 			parent->color = RB_BLACK;
ffff80000010fb40: c7 43 18 00 00 00 00 	movl	$0, 24(%rbx)
; 			uncle->color = RB_BLACK;
ffff80000010fb47: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			grandparent->color = RB_RED;
ffff80000010fb4e: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fb56: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010fb59: 4c 89 fe             	movq	%r15, %rsi
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010fb5c: 48 85 db             	testq	%rbx, %rbx
ffff80000010fb5f: 74 73                	je	0xffff80000010fbd4 <rb_balance+0xe4>
ffff80000010fb61: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010fb65: 75 6d                	jne	0xffff80000010fbd4 <rb_balance+0xe4>
; 		grandparent = parent->parent;
ffff80000010fb67: 4c 8b 3b             	movq	(%rbx), %r15
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010fb6a: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010fb6e: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010fb71: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010fb74: 41 0f 94 c4          	sete	%r12b
; 		uncle = grandparent->child[dir];
ffff80000010fb78: 4b 8b 4c e7 08       	movq	8(%r15,%r12,8), %rcx
; 		if (uncle && uncle->color == RB_RED) {
ffff80000010fb7d: 48 85 c9             	testq	%rcx, %rcx
ffff80000010fb80: 74 06                	je	0xffff80000010fb88 <rb_balance+0x98>
ffff80000010fb82: 83 79 18 01          	cmpl	$1, 24(%rcx)
ffff80000010fb86: 74 b8                	je	0xffff80000010fb40 <rb_balance+0x50>
; 		if (parent->child[dir] == node) {
ffff80000010fb88: 4a 39 74 e3 08       	cmpq	%rsi, 8(%rbx,%r12,8)
ffff80000010fb8d: 74 11                	je	0xffff80000010fba0 <rb_balance+0xb0>
ffff80000010fb8f: 48 89 d8             	movq	%rbx, %rax
ffff80000010fb92: 48 89 f3             	movq	%rsi, %rbx
ffff80000010fb95: eb 1d                	jmp	0xffff80000010fbb4 <rb_balance+0xc4>
ffff80000010fb97: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010fba0: 31 d2                	xorl	%edx, %edx
ffff80000010fba2: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010fba5: 0f 95 c2             	setne	%dl
; 			rotate_node(tree, parent, !dir);
ffff80000010fba8: 4c 89 f7             	movq	%r14, %rdi
ffff80000010fbab: 48 89 de             	movq	%rbx, %rsi
ffff80000010fbae: 41 ff d5             	callq	*%r13
; 			parent = node->parent;
ffff80000010fbb1: 48 8b 03             	movq	(%rbx), %rax
; 		parent->color = RB_BLACK;
ffff80000010fbb4: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff80000010fbbb: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 		rotate_node(tree, grandparent, dir);
ffff80000010fbc3: 4c 89 f7             	movq	%r14, %rdi
ffff80000010fbc6: 4c 89 fe             	movq	%r15, %rsi
ffff80000010fbc9: 44 89 e2             	movl	%r12d, %edx
ffff80000010fbcc: 41 ff d5             	callq	*%r13
ffff80000010fbcf: 49 89 df             	movq	%rbx, %r15
ffff80000010fbd2: eb 82                	jmp	0xffff80000010fb56 <rb_balance+0x66>
; 	tree->root->color = RB_BLACK;
ffff80000010fbd4: 49 8b 06             	movq	(%r14), %rax
ffff80000010fbd7: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010fbde: 31 c0                	xorl	%eax, %eax
ffff80000010fbe0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010fbe4: 5b                   	popq	%rbx
ffff80000010fbe5: 41 5c                	popq	%r12
ffff80000010fbe7: 41 5d                	popq	%r13
ffff80000010fbe9: 41 5e                	popq	%r14
ffff80000010fbeb: 41 5f                	popq	%r15
ffff80000010fbed: 5d                   	popq	%rbp
; }
ffff80000010fbee: c3                   	retq
ffff80000010fbef: 90                   	nop

ffff80000010fbf0 <rotate_node>:
; {
ffff80000010fbf0: 55                   	pushq	%rbp
ffff80000010fbf1: 48 89 e5             	movq	%rsp, %rbp
; 	struct rb_node *parent = node->parent;
ffff80000010fbf4: 4c 8b 06             	movq	(%rsi), %r8
; 	struct rb_node *child = node->child[!dir];
ffff80000010fbf7: 31 c9                	xorl	%ecx, %ecx
ffff80000010fbf9: 85 d2                	testl	%edx, %edx
ffff80000010fbfb: 0f 94 c1             	sete	%cl
ffff80000010fbfe: 48 8b 44 ce 08       	movq	8(%rsi,%rcx,8), %rax
; 	if ((node->child[!dir] = child->child[dir])) {
ffff80000010fc03: 41 89 d1             	movl	%edx, %r9d
ffff80000010fc06: 4a 8b 54 c8 08       	movq	8(%rax,%r9,8), %rdx
ffff80000010fc0b: 48 89 54 ce 08       	movq	%rdx, 8(%rsi,%rcx,8)
ffff80000010fc10: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fc13: 74 08                	je	0xffff80000010fc1d <rotate_node+0x2d>
; 		child->child[dir]->parent = node;
ffff80000010fc15: 4a 8b 4c c8 08       	movq	8(%rax,%r9,8), %rcx
ffff80000010fc1a: 48 89 31             	movq	%rsi, (%rcx)
; 	child->child[dir] = node;
ffff80000010fc1d: 4a 89 74 c8 08       	movq	%rsi, 8(%rax,%r9,8)
; 	child->parent = parent;
ffff80000010fc22: 4c 89 00             	movq	%r8, (%rax)
; 	if (parent) {
ffff80000010fc25: 4d 85 c0             	testq	%r8, %r8
ffff80000010fc28: 74 11                	je	0xffff80000010fc3b <rotate_node+0x4b>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff80000010fc2a: 31 c9                	xorl	%ecx, %ecx
ffff80000010fc2c: 49 39 70 10          	cmpq	%rsi, 16(%r8)
ffff80000010fc30: 0f 94 c1             	sete	%cl
ffff80000010fc33: 49 8d 3c c8          	leaq	(%r8,%rcx,8), %rdi
ffff80000010fc37: 48 83 c7 08          	addq	$8, %rdi
ffff80000010fc3b: 48 89 07             	movq	%rax, (%rdi)
; 	node->parent = child;
ffff80000010fc3e: 48 89 06             	movq	%rax, (%rsi)
; }
ffff80000010fc41: 5d                   	popq	%rbp
ffff80000010fc42: c3                   	retq
ffff80000010fc43: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fc4d: 0f 1f 00             	nopl	(%rax)

ffff80000010fc50 <rb_remove>:
; {
ffff80000010fc50: 55                   	pushq	%rbp
ffff80000010fc51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fc54: 41 57                	pushq	%r15
ffff80000010fc56: 41 56                	pushq	%r14
ffff80000010fc58: 41 55                	pushq	%r13
ffff80000010fc5a: 41 54                	pushq	%r12
ffff80000010fc5c: 53                   	pushq	%rbx
ffff80000010fc5d: 50                   	pushq	%rax
ffff80000010fc5e: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010fc63: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fc66: 0f 84 b9 01 00 00    	je	0xffff80000010fe25 <rb_remove+0x1d5>
ffff80000010fc6c: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010fc6f: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fc72: 0f 84 ad 01 00 00    	je	0xffff80000010fe25 <rb_remove+0x1d5>
ffff80000010fc78: 49 89 ff             	movq	%rdi, %r15
; 	child_dir = !node->child[RB_LEFT];
ffff80000010fc7b: 31 c0                	xorl	%eax, %eax
ffff80000010fc7d: 31 c9                	xorl	%ecx, %ecx
ffff80000010fc7f: 48 83 7b 08 00       	cmpq	$0, 8(%rbx)
ffff80000010fc84: 0f 95 c0             	setne	%al
ffff80000010fc87: 0f 94 c1             	sete	%cl
; 	child = node->child[child_dir];
ffff80000010fc8a: 4c 8b 6c cb 08       	movq	8(%rbx,%rcx,8), %r13
; 	if (!child && !other)
ffff80000010fc8f: 4c 8b 74 c3 08       	movq	8(%rbx,%rax,8), %r14
; 	do_remove(tree, node);
ffff80000010fc94: 48 b8 40 fe 10 00 00 80 ff ff	movabsq	$-140737487241664, %rax # imm = 0xFFFF80000010FE40
ffff80000010fc9e: 48 89 de             	movq	%rbx, %rsi
ffff80000010fca1: ff d0                	callq	*%rax
ffff80000010fca3: 31 c0                	xorl	%eax, %eax
; 	if (!child && !other)
ffff80000010fca5: 4d 09 ee             	orq	%r13, %r14
ffff80000010fca8: 0f 84 77 01 00 00    	je	0xffff80000010fe25 <rb_remove+0x1d5>
; 	if (node->color == RB_RED)
ffff80000010fcae: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010fcb2: 0f 84 6d 01 00 00    	je	0xffff80000010fe25 <rb_remove+0x1d5>
; 	if (node->color == RB_RED) {
ffff80000010fcb8: 41 83 7d 18 01       	cmpl	$1, 24(%r13)
ffff80000010fcbd: 75 09                	jne	0xffff80000010fcc8 <rb_remove+0x78>
ffff80000010fcbf: 49 83 c5 18          	addq	$24, %r13
ffff80000010fcc3: e9 51 01 00 00       	jmp	0xffff80000010fe19 <rb_remove+0x1c9>
; 	while (node->parent) {
ffff80000010fcc8: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fccc: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fccf: 0f 84 39 01 00 00    	je	0xffff80000010fe0e <rb_remove+0x1be>
ffff80000010fcd5: 48 b9 f0 fb 10 00 00 80 ff ff	movabsq	$-140737487242256, %rcx # imm = 0xFFFF80000010FBF0
ffff80000010fcdf: eb 31                	jmp	0xffff80000010fd12 <rb_remove+0xc2>
ffff80000010fce1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fceb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 			sibling->color = RB_RED;
ffff80000010fcf0: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010fcf7: 48 b9 f0 fb 10 00 00 80 ff ff	movabsq	$-140737487242256, %rcx # imm = 0xFFFF80000010FBF0
ffff80000010fd01: 4d 8b 6d 00          	movq	(%r13), %r13
; 	while (node->parent) {
ffff80000010fd05: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fd09: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fd0c: 0f 84 fc 00 00 00    	je	0xffff80000010fe0e <rb_remove+0x1be>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fd12: 4c 8b 76 08          	movq	8(%rsi), %r14
ffff80000010fd16: 31 db                	xorl	%ebx, %ebx
ffff80000010fd18: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fd1b: 0f 94 c3             	sete	%bl
; 		sibling = node->parent->child[dir];
ffff80000010fd1e: 48 8b 44 de 08       	movq	8(%rsi,%rbx,8), %rax
; 		if (!sibling) {
ffff80000010fd23: 48 85 c0             	testq	%rax, %rax
ffff80000010fd26: 0f 84 e2 00 00 00    	je	0xffff80000010fe0e <rb_remove+0x1be>
; 		if (sibling->color == RB_RED) {
ffff80000010fd2c: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000010fd30: 75 24                	jne	0xffff80000010fd56 <rb_remove+0x106>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fd32: 31 d2                	xorl	%edx, %edx
ffff80000010fd34: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fd37: 0f 95 c2             	setne	%dl
; 			node->parent->color = RB_RED;
ffff80000010fd3a: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 			sibling->color = RB_BLACK;
ffff80000010fd41: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff80000010fd48: 4c 89 ff             	movq	%r15, %rdi
ffff80000010fd4b: ff d1                	callq	*%rcx
; 			sibling = node->parent->child[dir];
ffff80000010fd4d: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010fd51: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010fd56: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010fd59: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010fd5c: 41 0f 95 c4          	setne	%r12b
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010fd60: 4a 8b 4c e0 08       	movq	8(%rax,%r12,8), %rcx
ffff80000010fd65: 48 85 c9             	testq	%rcx, %rcx
ffff80000010fd68: 74 06                	je	0xffff80000010fd70 <rb_remove+0x120>
ffff80000010fd6a: 83 79 18 00          	cmpl	$0, 24(%rcx)
; 		    RB_BLACK) &&
ffff80000010fd6e: 75 18                	jne	0xffff80000010fd88 <rb_remove+0x138>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010fd70: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010fd75: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fd78: 0f 84 72 ff ff ff    	je	0xffff80000010fcf0 <rb_remove+0xa0>
ffff80000010fd7e: 83 7a 18 00          	cmpl	$0, 24(%rdx)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010fd82: 0f 84 68 ff ff ff    	je	0xffff80000010fcf0 <rb_remove+0xa0>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010fd88: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010fd8d: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fd90: 74 1e                	je	0xffff80000010fdb0 <rb_remove+0x160>
ffff80000010fd92: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010fd96: 74 18                	je	0xffff80000010fdb0 <rb_remove+0x160>
ffff80000010fd98: 49 be f0 fb 10 00 00 80 ff ff	movabsq	$-140737487242256, %r14 # imm = 0xFFFF80000010FBF0
ffff80000010fda2: eb 39                	jmp	0xffff80000010fddd <rb_remove+0x18d>
ffff80000010fda4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fdae: 66 90                	nop
; 			sibling->color = RB_RED;
ffff80000010fdb0: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff80000010fdb7: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			rotate_node(tree, node->parent, dir);
ffff80000010fdbe: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fdc2: 4c 89 ff             	movq	%r15, %rdi
ffff80000010fdc5: 89 da                	movl	%ebx, %edx
ffff80000010fdc7: 49 be f0 fb 10 00 00 80 ff ff	movabsq	$-140737487242256, %r14 # imm = 0xFFFF80000010FBF0
ffff80000010fdd1: 41 ff d6             	callq	*%r14
; 			sibling = node->parent->child[dir];
ffff80000010fdd4: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010fdd8: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		sibling->color = node->parent->color;
ffff80000010fddd: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010fde1: 8b 4e 18             	movl	24(%rsi), %ecx
ffff80000010fde4: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff80000010fde7: c7 46 18 00 00 00 00 	movl	$0, 24(%rsi)
; 		sibling->child[dir]->color = RB_BLACK;
ffff80000010fdee: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010fdf3: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff80000010fdfa: 4c 89 ff             	movq	%r15, %rdi
ffff80000010fdfd: 44 89 e2             	movl	%r12d, %edx
ffff80000010fe00: 41 ff d6             	callq	*%r14
ffff80000010fe03: 4d 89 fd             	movq	%r15, %r13
ffff80000010fe06: 4c 89 f1             	movq	%r14, %rcx
ffff80000010fe09: e9 f3 fe ff ff       	jmp	0xffff80000010fd01 <rb_remove+0xb1>
; 	if (node)
ffff80000010fe0e: 4d 85 ed             	testq	%r13, %r13
ffff80000010fe11: 74 10                	je	0xffff80000010fe23 <rb_remove+0x1d3>
; 		node->color = RB_BLACK;
ffff80000010fe13: 49 83 c5 18          	addq	$24, %r13
ffff80000010fe17: 31 c0                	xorl	%eax, %eax
ffff80000010fe19: 41 c7 45 00 00 00 00 00      	movl	$0, (%r13)
ffff80000010fe21: eb 02                	jmp	0xffff80000010fe25 <rb_remove+0x1d5>
ffff80000010fe23: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fe25: 48 83 c4 08          	addq	$8, %rsp
ffff80000010fe29: 5b                   	popq	%rbx
ffff80000010fe2a: 41 5c                	popq	%r12
ffff80000010fe2c: 41 5d                	popq	%r13
ffff80000010fe2e: 41 5e                	popq	%r14
ffff80000010fe30: 41 5f                	popq	%r15
ffff80000010fe32: 5d                   	popq	%rbp
ffff80000010fe33: c3                   	retq
ffff80000010fe34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fe3e: 66 90                	nop

ffff80000010fe40 <do_remove>:
; {
ffff80000010fe40: 55                   	pushq	%rbp
ffff80000010fe41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fe44: 41 57                	pushq	%r15
ffff80000010fe46: 41 56                	pushq	%r14
ffff80000010fe48: 41 54                	pushq	%r12
ffff80000010fe4a: 53                   	pushq	%rbx
; 	if (!tree || !node)
ffff80000010fe4b: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fe4e: 0f 84 b7 00 00 00    	je	0xffff80000010ff0b <do_remove+0xcb>
ffff80000010fe54: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010fe57: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fe5a: 0f 84 ab 00 00 00    	je	0xffff80000010ff0b <do_remove+0xcb>
ffff80000010fe60: 49 89 fe             	movq	%rdi, %r14
; 	parent = node->parent;
ffff80000010fe63: 4c 8b 23             	movq	(%rbx), %r12
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010fe66: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010fe6a: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fe6d: 74 57                	je	0xffff80000010fec6 <do_remove+0x86>
ffff80000010fe6f: 48 83 7b 10 00       	cmpq	$0, 16(%rbx)
ffff80000010fe74: 74 50                	je	0xffff80000010fec6 <do_remove+0x86>
; 		child = get_outermost(child, RB_RIGHT);
ffff80000010fe76: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010fe80: be 01 00 00 00       	movl	$1, %esi
ffff80000010fe85: ff d0                	callq	*%rax
ffff80000010fe87: 49 89 c7             	movq	%rax, %r15
; 		do_remove(tree, child);
ffff80000010fe8a: 48 b8 40 fe 10 00 00 80 ff ff	movabsq	$-140737487241664, %rax # imm = 0xFFFF80000010FE40
ffff80000010fe94: 4c 89 f7             	movq	%r14, %rdi
ffff80000010fe97: 4c 89 fe             	movq	%r15, %rsi
ffff80000010fe9a: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff80000010fe9c: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010fea0: 49 89 47 08          	movq	%rax, 8(%r15)
; 		if (node->child[RB_LEFT])
ffff80000010fea4: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010fea8: 48 85 c0             	testq	%rax, %rax
ffff80000010feab: 74 03                	je	0xffff80000010feb0 <do_remove+0x70>
; 			node->child[RB_LEFT]->parent = child;
ffff80000010fead: 4c 89 38             	movq	%r15, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff80000010feb0: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010feb4: 49 89 47 10          	movq	%rax, 16(%r15)
; 		if (node->child[RB_RIGHT])
ffff80000010feb8: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010febc: 48 85 c0             	testq	%rax, %rax
ffff80000010febf: 74 12                	je	0xffff80000010fed3 <do_remove+0x93>
; 			node->child[RB_RIGHT]->parent = child;
ffff80000010fec1: 4c 89 38             	movq	%r15, (%rax)
ffff80000010fec4: eb 0d                	jmp	0xffff80000010fed3 <do_remove+0x93>
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010fec6: 31 c0                	xorl	%eax, %eax
ffff80000010fec8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010fecb: 0f 94 c0             	sete	%al
; 		child = node->child[child_dir];
ffff80000010fece: 4c 8b 7c c3 08       	movq	8(%rbx,%rax,8), %r15
; 	if (parent) {
ffff80000010fed3: 4d 85 e4             	testq	%r12, %r12
ffff80000010fed6: 74 12                	je	0xffff80000010feea <do_remove+0xaa>
; 		dir = parent->child[RB_RIGHT] == node;
ffff80000010fed8: 31 c0                	xorl	%eax, %eax
ffff80000010feda: 49 39 5c 24 10       	cmpq	%rbx, 16(%r12)
ffff80000010fedf: 0f 94 c0             	sete	%al
; 		parent->child[dir] = child;
ffff80000010fee2: 4d 8d 34 c4          	leaq	(%r12,%rax,8), %r14
ffff80000010fee6: 49 83 c6 08          	addq	$8, %r14
ffff80000010feea: 4d 89 3e             	movq	%r15, (%r14)
; 	if (child)
ffff80000010feed: 4d 85 ff             	testq	%r15, %r15
ffff80000010fef0: 74 03                	je	0xffff80000010fef5 <do_remove+0xb5>
; 		child->parent = parent;
ffff80000010fef2: 4d 89 27             	movq	%r12, (%r15)
; 	memset(node, 0, sizeof *node);
ffff80000010fef5: 48 b8 e0 02 11 00 00 80 ff ff	movabsq	$-140737487240480, %rax # imm = 0xFFFF8000001102E0
ffff80000010feff: ba 20 00 00 00       	movl	$32, %edx
ffff80000010ff04: 48 89 df             	movq	%rbx, %rdi
ffff80000010ff07: 31 f6                	xorl	%esi, %esi
ffff80000010ff09: ff d0                	callq	*%rax
; }
ffff80000010ff0b: 5b                   	popq	%rbx
ffff80000010ff0c: 41 5c                	popq	%r12
ffff80000010ff0e: 41 5e                	popq	%r14
ffff80000010ff10: 41 5f                	popq	%r15
ffff80000010ff12: 5d                   	popq	%rbp
ffff80000010ff13: c3                   	retq
ffff80000010ff14: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ff1e: 66 90                	nop

ffff80000010ff20 <rb_replace>:
; {
ffff80000010ff20: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!node || !new_node)
ffff80000010ff25: 48 85 f6             	testq	%rsi, %rsi
ffff80000010ff28: 74 5e                	je	0xffff80000010ff88 <rb_replace+0x68>
ffff80000010ff2a: 48 85 d2             	testq	%rdx, %rdx
ffff80000010ff2d: 74 59                	je	0xffff80000010ff88 <rb_replace+0x68>
ffff80000010ff2f: 55                   	pushq	%rbp
ffff80000010ff30: 48 89 e5             	movq	%rsp, %rbp
; 	if (node->parent)
ffff80000010ff33: 48 8b 06             	movq	(%rsi), %rax
ffff80000010ff36: 48 85 c0             	testq	%rax, %rax
ffff80000010ff39: 74 11                	je	0xffff80000010ff4c <rb_replace+0x2c>
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff80000010ff3b: 31 c9                	xorl	%ecx, %ecx
ffff80000010ff3d: 48 39 70 10          	cmpq	%rsi, 16(%rax)
ffff80000010ff41: 0f 94 c1             	sete	%cl
ffff80000010ff44: 48 8d 3c c8          	leaq	(%rax,%rcx,8), %rdi
ffff80000010ff48: 48 83 c7 08          	addq	$8, %rdi
ffff80000010ff4c: 48 89 17             	movq	%rdx, (%rdi)
; 	if (node->child[RB_LEFT])
ffff80000010ff4f: 48 8b 46 08          	movq	8(%rsi), %rax
ffff80000010ff53: 48 85 c0             	testq	%rax, %rax
ffff80000010ff56: 74 03                	je	0xffff80000010ff5b <rb_replace+0x3b>
; 		node->child[RB_LEFT]->parent = new_node;
ffff80000010ff58: 48 89 10             	movq	%rdx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff80000010ff5b: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010ff5f: 48 85 c0             	testq	%rax, %rax
ffff80000010ff62: 74 03                	je	0xffff80000010ff67 <rb_replace+0x47>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff80000010ff64: 48 89 10             	movq	%rdx, (%rax)
; 	*new_node = *node;
ffff80000010ff67: 48 8b 46 18          	movq	24(%rsi), %rax
ffff80000010ff6b: 48 89 42 18          	movq	%rax, 24(%rdx)
ffff80000010ff6f: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010ff73: 48 89 42 10          	movq	%rax, 16(%rdx)
ffff80000010ff77: 48 8b 06             	movq	(%rsi), %rax
ffff80000010ff7a: 48 8b 4e 08          	movq	8(%rsi), %rcx
ffff80000010ff7e: 48 89 4a 08          	movq	%rcx, 8(%rdx)
ffff80000010ff82: 48 89 02             	movq	%rax, (%rdx)
ffff80000010ff85: 31 c0                	xorl	%eax, %eax
ffff80000010ff87: 5d                   	popq	%rbp
; }
ffff80000010ff88: c3                   	retq
ffff80000010ff89: cc                   	int3
ffff80000010ff8a: cc                   	int3
ffff80000010ff8b: cc                   	int3
ffff80000010ff8c: cc                   	int3
ffff80000010ff8d: cc                   	int3
ffff80000010ff8e: cc                   	int3
ffff80000010ff8f: cc                   	int3

ffff80000010ff90 <readline>:
; {
ffff80000010ff90: 55                   	pushq	%rbp
ffff80000010ff91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ff94: 41 57                	pushq	%r15
ffff80000010ff96: 41 56                	pushq	%r14
ffff80000010ff98: 41 55                	pushq	%r13
ffff80000010ff9a: 41 54                	pushq	%r12
ffff80000010ff9c: 53                   	pushq	%rbx
ffff80000010ff9d: 50                   	pushq	%rax
ffff80000010ff9e: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
; 	if (prompt != NULL)
ffff80000010ffa8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ffab: 74 11                	je	0xffff80000010ffbe <readline+0x2e>
ffff80000010ffad: 48 89 fe             	movq	%rdi, %rsi
; 		cprintf("%s", prompt);
ffff80000010ffb0: 48 bf f3 3b 11 00 00 80 ff ff	movabsq	$-140737487225869, %rdi # imm = 0xFFFF800000113BF3
ffff80000010ffba: 31 c0                	xorl	%eax, %eax
ffff80000010ffbc: ff d1                	callq	*%rcx
; 	echoing = iscons(0);
ffff80000010ffbe: 48 b8 00 c5 10 00 00 80 ff ff	movabsq	$-140737487256320, %rax # imm = 0xFFFF80000010C500
ffff80000010ffc8: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010ffcb: 31 ff                	xorl	%edi, %edi
ffff80000010ffcd: ff d0                	callq	*%rax
ffff80000010ffcf: 41 89 c7             	movl	%eax, %r15d
; 		c = getchar();
ffff80000010ffd2: 49 bc e0 c4 10 00 00 80 ff ff	movabsq	$-140737487256352, %r12 # imm = 0xFFFF80000010C4E0
ffff80000010ffdc: 41 ff d4             	callq	*%r12
ffff80000010ffdf: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff80000010ffe1: 85 c0                	testl	%eax, %eax
ffff80000010ffe3: 0f 88 b1 00 00 00    	js	0xffff80000011009a <readline+0x10a>
ffff80000010ffe9: 49 be 00 83 11 00 00 80 ff ff	movabsq	$-140737487207680, %r14 # imm = 0xFFFF800000118300
ffff80000010fff3: eb 1c                	jmp	0xffff800000110011 <readline+0x81>
ffff80000010fff5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ffff: 90                   	nop
; 			i--;
ffff800000110000: 41 83 c5 ff          	addl	$-1, %r13d
; 		c = getchar();
ffff800000110004: 41 ff d4             	callq	*%r12
ffff800000110007: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff800000110009: 85 c0                	testl	%eax, %eax
ffff80000011000b: 0f 88 89 00 00 00    	js	0xffff80000011009a <readline+0x10a>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff800000110011: 83 fb 08             	cmpl	$8, %ebx
ffff800000110014: 0f 95 c0             	setne	%al
ffff800000110017: 83 fb 7f             	cmpl	$127, %ebx
ffff80000011001a: 0f 95 c1             	setne	%cl
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000011001d: 84 c8                	testb	%cl, %al
ffff80000011001f: 75 1f                	jne	0xffff800000110040 <readline+0xb0>
ffff800000110021: 45 85 ed             	testl	%r13d, %r13d
ffff800000110024: 7e 1a                	jle	0xffff800000110040 <readline+0xb0>
ffff800000110026: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff800000110029: 74 d5                	je	0xffff800000110000 <readline+0x70>
; 				cputchar('\b');
ffff80000011002b: bf 08 00 00 00       	movl	$8, %edi
ffff800000110030: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000011003a: ff d0                	callq	*%rax
ffff80000011003c: eb c2                	jmp	0xffff800000110000 <readline+0x70>
ffff80000011003e: 66 90                	nop
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff800000110040: 83 fb 20             	cmpl	$32, %ebx
ffff800000110043: 7c 2b                	jl	0xffff800000110070 <readline+0xe0>
ffff800000110045: 41 81 fd fe 03 00 00 	cmpl	$1022, %r13d            # imm = 0x3FE
ffff80000011004c: 7f 22                	jg	0xffff800000110070 <readline+0xe0>
ffff80000011004e: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff800000110051: 74 0e                	je	0xffff800000110061 <readline+0xd1>
; 				cputchar(c);
ffff800000110053: 89 df                	movl	%ebx, %edi
ffff800000110055: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000011005f: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff800000110061: 49 63 c5             	movslq	%r13d, %rax
ffff800000110064: 41 83 c5 01          	addl	$1, %r13d
ffff800000110068: 42 88 1c 30          	movb	%bl, (%rax,%r14)
ffff80000011006c: eb 96                	jmp	0xffff800000110004 <readline+0x74>
ffff80000011006e: 66 90                	nop
; 		} else if (c == '\n' || c == '\r') {
ffff800000110070: 83 fb 0d             	cmpl	$13, %ebx
ffff800000110073: 74 05                	je	0xffff80000011007a <readline+0xea>
ffff800000110075: 83 fb 0a             	cmpl	$10, %ebx
ffff800000110078: 75 8a                	jne	0xffff800000110004 <readline+0x74>
; 			if (echoing)
ffff80000011007a: 45 85 ff             	testl	%r15d, %r15d
ffff80000011007d: 74 11                	je	0xffff800000110090 <readline+0x100>
; 				cputchar('\n');
ffff80000011007f: bf 0a 00 00 00       	movl	$10, %edi
ffff800000110084: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000011008e: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff800000110090: 49 63 c5             	movslq	%r13d, %rax
ffff800000110093: 42 c6 04 30 00       	movb	$0, (%rax,%r14)
ffff800000110098: eb 1d                	jmp	0xffff8000001100b7 <readline+0x127>
; 			cprintf("read error: %e\n", c);
ffff80000011009a: 48 bf 3e 40 11 00 00 80 ff ff	movabsq	$-140737487224770, %rdi # imm = 0xFFFF80000011403E
ffff8000001100a4: 45 31 f6             	xorl	%r14d, %r14d
ffff8000001100a7: 89 de                	movl	%ebx, %esi
ffff8000001100a9: 31 c0                	xorl	%eax, %eax
ffff8000001100ab: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001100b5: ff d1                	callq	*%rcx
; }
ffff8000001100b7: 4c 89 f0             	movq	%r14, %rax
ffff8000001100ba: 48 83 c4 08          	addq	$8, %rsp
ffff8000001100be: 5b                   	popq	%rbx
ffff8000001100bf: 41 5c                	popq	%r12
ffff8000001100c1: 41 5d                	popq	%r13
ffff8000001100c3: 41 5e                	popq	%r14
ffff8000001100c5: 41 5f                	popq	%r15
ffff8000001100c7: 5d                   	popq	%rbp
ffff8000001100c8: c3                   	retq
ffff8000001100c9: cc                   	int3
ffff8000001100ca: cc                   	int3
ffff8000001100cb: cc                   	int3
ffff8000001100cc: cc                   	int3
ffff8000001100cd: cc                   	int3
ffff8000001100ce: cc                   	int3
ffff8000001100cf: cc                   	int3

ffff8000001100d0 <strlen>:
; {
ffff8000001100d0: 55                   	pushq	%rbp
ffff8000001100d1: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
ffff8000001100d4: 80 3f 00             	cmpb	$0, (%rdi)
ffff8000001100d7: 74 14                	je	0xffff8000001100ed <strlen+0x1d>
ffff8000001100d9: 31 c0                	xorl	%eax, %eax
ffff8000001100db: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
ffff8000001100e0: 80 7c 07 01 00       	cmpb	$0, 1(%rdi,%rax)
ffff8000001100e5: 48 8d 40 01          	leaq	1(%rax), %rax
ffff8000001100e9: 75 f5                	jne	0xffff8000001100e0 <strlen+0x10>
; 	return n;
ffff8000001100eb: 5d                   	popq	%rbp
ffff8000001100ec: c3                   	retq
ffff8000001100ed: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff8000001100ef: 5d                   	popq	%rbp
ffff8000001100f0: c3                   	retq
ffff8000001100f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001100fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110100 <strnlen>:
; {
ffff800000110100: 55                   	pushq	%rbp
ffff800000110101: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff800000110104: 48 85 f6             	testq	%rsi, %rsi
ffff800000110107: 74 18                	je	0xffff800000110121 <strnlen+0x21>
ffff800000110109: 48 89 f0             	movq	%rsi, %rax
ffff80000011010c: 31 c9                	xorl	%ecx, %ecx
ffff80000011010e: 66 90                	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff800000110110: 80 3c 0f 00          	cmpb	$0, (%rdi,%rcx)
ffff800000110114: 74 0f                	je	0xffff800000110125 <strnlen+0x25>
ffff800000110116: 48 83 c1 01          	addq	$1, %rcx
ffff80000011011a: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011011d: 75 f1                	jne	0xffff800000110110 <strnlen+0x10>
; 	return n;
ffff80000011011f: 5d                   	popq	%rbp
ffff800000110120: c3                   	retq
ffff800000110121: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff800000110123: 5d                   	popq	%rbp
ffff800000110124: c3                   	retq
ffff800000110125: 89 c8                	movl	%ecx, %eax
; 	return n;
ffff800000110127: 5d                   	popq	%rbp
ffff800000110128: c3                   	retq
ffff800000110129: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000110130 <strcpy>:
; {
ffff800000110130: 55                   	pushq	%rbp
ffff800000110131: 48 89 e5             	movq	%rsp, %rbp
ffff800000110134: 48 89 f8             	movq	%rdi, %rax
ffff800000110137: 31 c9                	xorl	%ecx, %ecx
ffff800000110139: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
ffff800000110140: 0f b6 14 0e          	movzbl	(%rsi,%rcx), %edx
ffff800000110144: 88 14 08             	movb	%dl, (%rax,%rcx)
ffff800000110147: 48 83 c1 01          	addq	$1, %rcx
ffff80000011014b: 84 d2                	testb	%dl, %dl
ffff80000011014d: 75 f1                	jne	0xffff800000110140 <strcpy+0x10>
; 	return ret;
ffff80000011014f: 5d                   	popq	%rbp
ffff800000110150: c3                   	retq
ffff800000110151: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011015b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110160 <strcat>:
; {
ffff800000110160: 55                   	pushq	%rbp
ffff800000110161: 48 89 e5             	movq	%rsp, %rbp
ffff800000110164: 41 56                	pushq	%r14
ffff800000110166: 53                   	pushq	%rbx
ffff800000110167: 49 89 f6             	movq	%rsi, %r14
ffff80000011016a: 48 89 fb             	movq	%rdi, %rbx
; 	int len = strlen(dst);
ffff80000011016d: 48 b8 d0 00 11 00 00 80 ff ff	movabsq	$-140737487241008, %rax # imm = 0xFFFF8000001100D0
ffff800000110177: ff d0                	callq	*%rax
; 	strcpy(dst + len, src);
ffff800000110179: 48 63 f8             	movslq	%eax, %rdi
ffff80000011017c: 48 01 df             	addq	%rbx, %rdi
ffff80000011017f: 48 b8 30 01 11 00 00 80 ff ff	movabsq	$-140737487240912, %rax # imm = 0xFFFF800000110130
ffff800000110189: 4c 89 f6             	movq	%r14, %rsi
ffff80000011018c: ff d0                	callq	*%rax
; 	return dst;
ffff80000011018e: 48 89 d8             	movq	%rbx, %rax
ffff800000110191: 5b                   	popq	%rbx
ffff800000110192: 41 5e                	popq	%r14
ffff800000110194: 5d                   	popq	%rbp
ffff800000110195: c3                   	retq
ffff800000110196: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001101a0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff8000001101a0: 55                   	pushq	%rbp
ffff8000001101a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001101a4: 48 89 f8             	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
ffff8000001101a7: 48 85 d2             	testq	%rdx, %rdx
ffff8000001101aa: 74 1a                	je	0xffff8000001101c6 <strncpy+0x26>
ffff8000001101ac: 31 ff                	xorl	%edi, %edi
ffff8000001101ae: 66 90                	nop
; 		*dst++ = *src;
ffff8000001101b0: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff8000001101b3: 88 0c 38             	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
ffff8000001101b6: 80 3e 01             	cmpb	$1, (%rsi)
ffff8000001101b9: 48 83 de ff          	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
ffff8000001101bd: 48 83 c7 01          	addq	$1, %rdi
ffff8000001101c1: 48 39 fa             	cmpq	%rdi, %rdx
ffff8000001101c4: 75 ea                	jne	0xffff8000001101b0 <strncpy+0x10>
; 	return ret;
ffff8000001101c6: 5d                   	popq	%rbp
ffff8000001101c7: c3                   	retq
ffff8000001101c8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001101d0 <strlcpy>:
; {
ffff8000001101d0: 55                   	pushq	%rbp
ffff8000001101d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001101d4: 48 89 f8             	movq	%rdi, %rax
; 	if (size > 0) {
ffff8000001101d7: 48 85 d2             	testq	%rdx, %rdx
ffff8000001101da: 74 2e                	je	0xffff80000011020a <strlcpy+0x3a>
ffff8000001101dc: 48 89 f8             	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
ffff8000001101df: 48 83 c2 ff          	addq	$-1, %rdx
ffff8000001101e3: 74 22                	je	0xffff800000110207 <strlcpy+0x37>
ffff8000001101e5: 31 c0                	xorl	%eax, %eax
ffff8000001101e7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
ffff8000001101f0: 0f b6 0c 06          	movzbl	(%rsi,%rax), %ecx
ffff8000001101f4: 84 c9                	testb	%cl, %cl
ffff8000001101f6: 74 0c                	je	0xffff800000110204 <strlcpy+0x34>
; 			*dst++ = *src++;
ffff8000001101f8: 88 0c 07             	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
ffff8000001101fb: 48 83 c0 01          	addq	$1, %rax
ffff8000001101ff: 48 39 c2             	cmpq	%rax, %rdx
ffff800000110202: 75 ec                	jne	0xffff8000001101f0 <strlcpy+0x20>
ffff800000110204: 48 01 f8             	addq	%rdi, %rax
; 		*dst = '\0';
ffff800000110207: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff80000011020a: 48 29 f8             	subq	%rdi, %rax
ffff80000011020d: 5d                   	popq	%rbp
ffff80000011020e: c3                   	retq
ffff80000011020f: 90                   	nop

ffff800000110210 <strcmp>:
; {
ffff800000110210: 55                   	pushq	%rbp
ffff800000110211: 48 89 e5             	movq	%rsp, %rbp
; 	while (*p && *p == *q)
ffff800000110214: 8a 07                	movb	(%rdi), %al
ffff800000110216: 84 c0                	testb	%al, %al
ffff800000110218: 74 19                	je	0xffff800000110233 <strcmp+0x23>
ffff80000011021a: 48 83 c7 01          	addq	$1, %rdi
ffff80000011021e: 66 90                	nop
ffff800000110220: 3a 06                	cmpb	(%rsi), %al
ffff800000110222: 75 0f                	jne	0xffff800000110233 <strcmp+0x23>
; 		p++, q++;
ffff800000110224: 48 83 c6 01          	addq	$1, %rsi
; 	while (*p && *p == *q)
ffff800000110228: 0f b6 07             	movzbl	(%rdi), %eax
ffff80000011022b: 48 83 c7 01          	addq	$1, %rdi
ffff80000011022f: 84 c0                	testb	%al, %al
ffff800000110231: 75 ed                	jne	0xffff800000110220 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff800000110233: 0f b6 c0             	movzbl	%al, %eax
ffff800000110236: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff800000110239: 29 c8                	subl	%ecx, %eax
ffff80000011023b: 5d                   	popq	%rbp
ffff80000011023c: c3                   	retq
ffff80000011023d: 0f 1f 00             	nopl	(%rax)

ffff800000110240 <strncmp>:
; {
ffff800000110240: 55                   	pushq	%rbp
ffff800000110241: 48 89 e5             	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
ffff800000110244: 48 85 d2             	testq	%rdx, %rdx
ffff800000110247: 74 1d                	je	0xffff800000110266 <strncmp+0x26>
ffff800000110249: 31 c9                	xorl	%ecx, %ecx
ffff80000011024b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
ffff800000110250: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff800000110254: 85 c0                	testl	%eax, %eax
ffff800000110256: 74 12                	je	0xffff80000011026a <strncmp+0x2a>
ffff800000110258: 3a 04 0e             	cmpb	(%rsi,%rcx), %al
ffff80000011025b: 75 0d                	jne	0xffff80000011026a <strncmp+0x2a>
ffff80000011025d: 48 83 c1 01          	addq	$1, %rcx
ffff800000110261: 48 39 ca             	cmpq	%rcx, %rdx
ffff800000110264: 75 ea                	jne	0xffff800000110250 <strncmp+0x10>
ffff800000110266: 31 c0                	xorl	%eax, %eax
; }
ffff800000110268: 5d                   	popq	%rbp
ffff800000110269: c3                   	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000011026a: 0f b6 0c 0e          	movzbl	(%rsi,%rcx), %ecx
ffff80000011026e: 29 c8                	subl	%ecx, %eax
; }
ffff800000110270: 5d                   	popq	%rbp
ffff800000110271: c3                   	retq
ffff800000110272: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011027c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110280 <strchr>:
; {
ffff800000110280: 55                   	pushq	%rbp
ffff800000110281: 48 89 e5             	movq	%rsp, %rbp
; 	for (; *s; s++)
ffff800000110284: 8a 0f                	movb	(%rdi), %cl
ffff800000110286: 84 c9                	testb	%cl, %cl
ffff800000110288: 74 17                	je	0xffff8000001102a1 <strchr+0x21>
ffff80000011028a: 48 89 f8             	movq	%rdi, %rax
ffff80000011028d: 0f 1f 00             	nopl	(%rax)
; 		if (*s == c)
ffff800000110290: 40 38 f1             	cmpb	%sil, %cl
ffff800000110293: 74 0e                	je	0xffff8000001102a3 <strchr+0x23>
; 	for (; *s; s++)
ffff800000110295: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff800000110299: 48 83 c0 01          	addq	$1, %rax
ffff80000011029d: 84 c9                	testb	%cl, %cl
ffff80000011029f: 75 ef                	jne	0xffff800000110290 <strchr+0x10>
ffff8000001102a1: 31 c0                	xorl	%eax, %eax
; }
ffff8000001102a3: 5d                   	popq	%rbp
ffff8000001102a4: c3                   	retq
ffff8000001102a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001102af: 90                   	nop

ffff8000001102b0 <strfind>:
; {
ffff8000001102b0: 55                   	pushq	%rbp
ffff8000001102b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001102b4: 48 89 f8             	movq	%rdi, %rax
; 	for (; *s; s++)
ffff8000001102b7: 48 83 c0 ff          	addq	$-1, %rax
ffff8000001102bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff8000001102c0: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff8000001102c4: 48 83 c0 01          	addq	$1, %rax
ffff8000001102c8: 84 c9                	testb	%cl, %cl
ffff8000001102ca: 74 05                	je	0xffff8000001102d1 <strfind+0x21>
ffff8000001102cc: 40 38 f1             	cmpb	%sil, %cl
ffff8000001102cf: 75 ef                	jne	0xffff8000001102c0 <strfind+0x10>
; 	return (char *) s;
ffff8000001102d1: 5d                   	popq	%rbp
ffff8000001102d2: c3                   	retq
ffff8000001102d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001102dd: 0f 1f 00             	nopl	(%rax)

ffff8000001102e0 <memset>:
; {
ffff8000001102e0: 55                   	pushq	%rbp
ffff8000001102e1: 48 89 e5             	movq	%rsp, %rbp
; 	if (n == 0)
ffff8000001102e4: 48 85 d2             	testq	%rdx, %rdx
ffff8000001102e7: 74 36                	je	0xffff80000011031f <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff8000001102e9: 89 f8                	movl	%edi, %eax
ffff8000001102eb: 09 d0                	orl	%edx, %eax
ffff8000001102ed: a8 03                	testb	$3, %al
ffff8000001102ef: 74 0a                	je	0xffff8000001102fb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
ffff8000001102f1: 89 f0                	movl	%esi, %eax
ffff8000001102f3: 48 89 d1             	movq	%rdx, %rcx
ffff8000001102f6: fc                   	cld
ffff8000001102f7: f3 aa                	rep		stosb	%al, %es:(%rdi)
ffff8000001102f9: eb 24                	jmp	0xffff80000011031f <memset+0x3f>
; 		c &= 0xFF;
ffff8000001102fb: 44 0f b6 c6          	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff8000001102ff: c1 e6 18             	shll	$24, %esi
ffff800000110302: 44 89 c1             	movl	%r8d, %ecx
ffff800000110305: c1 e1 10             	shll	$16, %ecx
ffff800000110308: 09 f1                	orl	%esi, %ecx
ffff80000011030a: 44 89 c0             	movl	%r8d, %eax
ffff80000011030d: c1 e0 08             	shll	$8, %eax
ffff800000110310: 09 c8                	orl	%ecx, %eax
ffff800000110312: 44 09 c0             	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff800000110315: 48 c1 ea 02          	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
ffff800000110319: 48 89 d1             	movq	%rdx, %rcx
ffff80000011031c: fc                   	cld
ffff80000011031d: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; }
ffff80000011031f: 48 89 f8             	movq	%rdi, %rax
ffff800000110322: 5d                   	popq	%rbp
ffff800000110323: c3                   	retq
ffff800000110324: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011032e: 66 90                	nop

ffff800000110330 <memmove>:
; {
ffff800000110330: 55                   	pushq	%rbp
ffff800000110331: 48 89 e5             	movq	%rsp, %rbp
ffff800000110334: 48 89 d1             	movq	%rdx, %rcx
ffff800000110337: 48 89 f2             	movq	%rsi, %rdx
ffff80000011033a: 48 89 f8             	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
ffff80000011033d: 48 39 fe             	cmpq	%rdi, %rsi
ffff800000110340: 73 38                	jae	0xffff80000011037a <memmove+0x4a>
ffff800000110342: 48 8d 34 0a          	leaq	(%rdx,%rcx), %rsi
ffff800000110346: 48 39 c6             	cmpq	%rax, %rsi
ffff800000110349: 76 2f                	jbe	0xffff80000011037a <memmove+0x4a>
; 		d += n;
ffff80000011034b: 48 8d 3c 08          	leaq	(%rax,%rcx), %rdi
ffff80000011034f: f6 c1 03             	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110352: 75 4e                	jne	0xffff8000001103a2 <memmove+0x72>
ffff800000110354: 89 f2                	movl	%esi, %edx
ffff800000110356: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110359: 48 85 d2             	testq	%rdx, %rdx
ffff80000011035c: 75 44                	jne	0xffff8000001103a2 <memmove+0x72>
ffff80000011035e: 89 fa                	movl	%edi, %edx
ffff800000110360: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000110363: 48 85 d2             	testq	%rdx, %rdx
ffff800000110366: 75 3a                	jne	0xffff8000001103a2 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff800000110368: 48 83 c7 fc          	addq	$-4, %rdi
ffff80000011036c: 48 83 c6 fc          	addq	$-4, %rsi
ffff800000110370: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff800000110374: fd                   	std
ffff800000110375: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff800000110377: fc                   	cld
; 	return dst;
ffff800000110378: 5d                   	popq	%rbp
ffff800000110379: c3                   	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000011037a: 89 d6                	movl	%edx, %esi
ffff80000011037c: 09 c6                	orl	%eax, %esi
ffff80000011037e: 89 cf                	movl	%ecx, %edi
ffff800000110380: 09 f7                	orl	%esi, %edi
ffff800000110382: 40 f6 c7 03          	testb	$3, %dil
ffff800000110386: 74 0b                	je	0xffff800000110393 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
ffff800000110388: 48 89 c7             	movq	%rax, %rdi
ffff80000011038b: 48 89 d6             	movq	%rdx, %rsi
ffff80000011038e: fc                   	cld
ffff80000011038f: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
ffff800000110391: 5d                   	popq	%rbp
ffff800000110392: c3                   	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff800000110393: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff800000110397: 48 89 c7             	movq	%rax, %rdi
ffff80000011039a: 48 89 d6             	movq	%rdx, %rsi
ffff80000011039d: fc                   	cld
ffff80000011039e: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
ffff8000001103a0: 5d                   	popq	%rbp
ffff8000001103a1: c3                   	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff8000001103a2: 48 83 c7 ff          	addq	$-1, %rdi
ffff8000001103a6: 48 83 c6 ff          	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
ffff8000001103aa: fd                   	std
ffff8000001103ab: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff8000001103ad: fc                   	cld
; 	return dst;
ffff8000001103ae: 5d                   	popq	%rbp
ffff8000001103af: c3                   	retq

ffff8000001103b0 <memcpy>:
; {
ffff8000001103b0: 55                   	pushq	%rbp
ffff8000001103b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001103b4: 53                   	pushq	%rbx
ffff8000001103b5: 50                   	pushq	%rax
ffff8000001103b6: 48 89 fb             	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
ffff8000001103b9: 48 b8 30 03 11 00 00 80 ff ff	movabsq	$-140737487240400, %rax # imm = 0xFFFF800000110330
ffff8000001103c3: ff d0                	callq	*%rax
ffff8000001103c5: 48 89 d8             	movq	%rbx, %rax
ffff8000001103c8: 48 83 c4 08          	addq	$8, %rsp
ffff8000001103cc: 5b                   	popq	%rbx
ffff8000001103cd: 5d                   	popq	%rbp
ffff8000001103ce: c3                   	retq
ffff8000001103cf: 90                   	nop

ffff8000001103d0 <memcmp>:
; {
ffff8000001103d0: 55                   	pushq	%rbp
ffff8000001103d1: 48 89 e5             	movq	%rsp, %rbp
; 	while (n-- > 0) {
ffff8000001103d4: 48 85 d2             	testq	%rdx, %rdx
ffff8000001103d7: 74 1e                	je	0xffff8000001103f7 <memcmp+0x27>
ffff8000001103d9: 31 c9                	xorl	%ecx, %ecx
ffff8000001103db: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
ffff8000001103e0: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff8000001103e4: 44 0f b6 04 0e       	movzbl	(%rsi,%rcx), %r8d
ffff8000001103e9: 44 38 c0             	cmpb	%r8b, %al
ffff8000001103ec: 75 0d                	jne	0xffff8000001103fb <memcmp+0x2b>
; 	while (n-- > 0) {
ffff8000001103ee: 48 83 c1 01          	addq	$1, %rcx
ffff8000001103f2: 48 39 ca             	cmpq	%rcx, %rdx
ffff8000001103f5: 75 e9                	jne	0xffff8000001103e0 <memcmp+0x10>
ffff8000001103f7: 31 c0                	xorl	%eax, %eax
; }
ffff8000001103f9: 5d                   	popq	%rbp
ffff8000001103fa: c3                   	retq
; 			return (int) *s1 - (int) *s2;
ffff8000001103fb: 44 29 c0             	subl	%r8d, %eax
; }
ffff8000001103fe: 5d                   	popq	%rbp
ffff8000001103ff: c3                   	retq

ffff800000110400 <memfind>:
; {
ffff800000110400: 55                   	pushq	%rbp
ffff800000110401: 48 89 e5             	movq	%rsp, %rbp
ffff800000110404: 48 89 f8             	movq	%rdi, %rax
; 	for (; s < ends; s++)
ffff800000110407: 48 85 d2             	testq	%rdx, %rdx
ffff80000011040a: 7e 12                	jle	0xffff80000011041e <memfind+0x1e>
ffff80000011040c: 48 01 c2             	addq	%rax, %rdx
ffff80000011040f: 90                   	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff800000110410: 40 38 30             	cmpb	%sil, (%rax)
ffff800000110413: 74 09                	je	0xffff80000011041e <memfind+0x1e>
; 	for (; s < ends; s++)
ffff800000110415: 48 83 c0 01          	addq	$1, %rax
ffff800000110419: 48 39 d0             	cmpq	%rdx, %rax
ffff80000011041c: 72 f2                	jb	0xffff800000110410 <memfind+0x10>
; 	return (void *) s;
ffff80000011041e: 5d                   	popq	%rbp
ffff80000011041f: c3                   	retq

ffff800000110420 <strtol>:
; {
ffff800000110420: 55                   	pushq	%rbp
ffff800000110421: 48 89 e5             	movq	%rsp, %rbp
ffff800000110424: 48 b8 08 36 11 00 00 80 ff ff	movabsq	$-140737487227384, %rax # imm = 0xFFFF800000113608
ffff80000011042e: 66 90                	nop
; 	while (*s == ' ' || *s == '\t')
ffff800000110430: 0f b6 0f             	movzbl	(%rdi), %ecx
ffff800000110433: 80 c1 f7             	addb	$-9, %cl
ffff800000110436: 80 f9 24             	cmpb	$36, %cl
ffff800000110439: 77 10                	ja	0xffff80000011044b <strtol+0x2b>
ffff80000011043b: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000011043e: ff 24 c8             	jmpq	*(%rax,%rcx,8)
; 		s++;
ffff800000110441: 48 83 c7 01          	addq	$1, %rdi
ffff800000110445: eb e9                	jmp	0xffff800000110430 <strtol+0x10>
; 		s++;
ffff800000110447: 48 83 c7 01          	addq	$1, %rdi
ffff80000011044b: 41 b0 01             	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011044e: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff800000110454: 75 27                	jne	0xffff80000011047d <strtol+0x5d>
ffff800000110456: eb 0f                	jmp	0xffff800000110467 <strtol+0x47>
; 		s++, neg = 1;
ffff800000110458: 48 83 c7 01          	addq	$1, %rdi
ffff80000011045c: 45 31 c0             	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011045f: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff800000110465: 75 16                	jne	0xffff80000011047d <strtol+0x5d>
ffff800000110467: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000011046a: 75 11                	jne	0xffff80000011047d <strtol+0x5d>
ffff80000011046c: 80 7f 01 78          	cmpb	$120, 1(%rdi)
ffff800000110470: 75 0b                	jne	0xffff80000011047d <strtol+0x5d>
; 		s += 2, base = 16;
ffff800000110472: 48 83 c7 02          	addq	$2, %rdi
ffff800000110476: ba 10 00 00 00       	movl	$16, %edx
ffff80000011047b: eb 1a                	jmp	0xffff800000110497 <strtol+0x77>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000011047d: 85 d2                	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
ffff80000011047f: 75 16                	jne	0xffff800000110497 <strtol+0x77>
ffff800000110481: 31 c0                	xorl	%eax, %eax
ffff800000110483: 31 c9                	xorl	%ecx, %ecx
ffff800000110485: 80 3f 30             	cmpb	$48, (%rdi)
ffff800000110488: 0f 95 c0             	setne	%al
ffff80000011048b: 0f 94 c1             	sete	%cl
ffff80000011048e: 48 01 cf             	addq	%rcx, %rdi
ffff800000110491: 8d 14 00             	leal	(%rax,%rax), %edx
ffff800000110494: 83 c2 08             	addl	$8, %edx
ffff800000110497: 4c 63 ca             	movslq	%edx, %r9
ffff80000011049a: 45 31 d2             	xorl	%r10d, %r10d
ffff80000011049d: eb 25                	jmp	0xffff8000001104c4 <strtol+0xa4>
ffff80000011049f: 90                   	nop
ffff8000001104a0: 31 c0                	xorl	%eax, %eax
ffff8000001104a2: 84 c0                	testb	%al, %al
ffff8000001104a4: 75 1e                	jne	0xffff8000001104c4 <strtol+0xa4>
ffff8000001104a6: eb 51                	jmp	0xffff8000001104f9 <strtol+0xd9>
ffff8000001104a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
ffff8000001104b0: 48 83 c7 01          	addq	$1, %rdi
ffff8000001104b4: 4d 0f af d1          	imulq	%r9, %r10
ffff8000001104b8: 48 63 c1             	movslq	%ecx, %rax
ffff8000001104bb: 49 01 c2             	addq	%rax, %r10
ffff8000001104be: b0 01                	movb	$1, %al
ffff8000001104c0: 84 c0                	testb	%al, %al
ffff8000001104c2: 74 35                	je	0xffff8000001104f9 <strtol+0xd9>
; 		if (*s >= '0' && *s <= '9')
ffff8000001104c4: 44 0f be 1f          	movsbl	(%rdi), %r11d
ffff8000001104c8: 41 8d 43 d0          	leal	-48(%r11), %eax
ffff8000001104cc: b9 d0 ff ff ff       	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
ffff8000001104d1: 3c 0a                	cmpb	$10, %al
ffff8000001104d3: 72 1b                	jb	0xffff8000001104f0 <strtol+0xd0>
; 		else if (*s >= 'a' && *s <= 'z')
ffff8000001104d5: 41 8d 43 9f          	leal	-97(%r11), %eax
ffff8000001104d9: b9 a9 ff ff ff       	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
ffff8000001104de: 3c 1a                	cmpb	$26, %al
ffff8000001104e0: 72 0e                	jb	0xffff8000001104f0 <strtol+0xd0>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff8000001104e2: 41 8d 43 bf          	leal	-65(%r11), %eax
ffff8000001104e6: b9 c9 ff ff ff       	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
ffff8000001104eb: 3c 19                	cmpb	$25, %al
ffff8000001104ed: 77 b1                	ja	0xffff8000001104a0 <strtol+0x80>
ffff8000001104ef: 90                   	nop
ffff8000001104f0: 44 01 d9             	addl	%r11d, %ecx
; 		if (dig >= base)
ffff8000001104f3: 39 d1                	cmpl	%edx, %ecx
ffff8000001104f5: 7c b9                	jl	0xffff8000001104b0 <strtol+0x90>
ffff8000001104f7: eb a7                	jmp	0xffff8000001104a0 <strtol+0x80>
; 	if (endptr)
ffff8000001104f9: 48 85 f6             	testq	%rsi, %rsi
ffff8000001104fc: 74 03                	je	0xffff800000110501 <strtol+0xe1>
; 		*endptr = (char *) s;
ffff8000001104fe: 48 89 3e             	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
ffff800000110501: 4c 89 d0             	movq	%r10, %rax
ffff800000110504: 48 f7 d8             	negq	%rax
ffff800000110507: 45 84 c0             	testb	%r8b, %r8b
ffff80000011050a: 49 0f 45 c2          	cmovneq	%r10, %rax
ffff80000011050e: 5d                   	popq	%rbp
ffff80000011050f: c3                   	retq

ffff800000110510 <dump_page_tables>:
; {
ffff800000110510: 55                   	pushq	%rbp
ffff800000110511: 48 89 e5             	movq	%rsp, %rbp
ffff800000110514: 41 56                	pushq	%r14
ffff800000110516: 53                   	pushq	%rbx
ffff800000110517: 48 83 ec 70          	subq	$112, %rsp
; 	struct dump_info info = {
ffff80000011051b: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000110523: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000011052b: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000110533: 48 b8 07 00 00 00 00 00 00 80	movabsq	$-9223372036854775801, %rax # imm = 0x8000000000000007
; 		.mask = mask | PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC |
ffff80000011053d: 48 09 f0             	orq	%rsi, %rax
; 	struct dump_info info = {
ffff800000110540: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	struct page_walker walker = {
ffff800000110544: 48 b8 e0 05 11 00 00 80 ff ff	movabsq	$-140737487239712, %rax # imm = 0xFFFF8000001105E0
ffff80000011054e: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff800000110552: 48 b8 40 06 11 00 00 80 ff ff	movabsq	$-140737487239616, %rax # imm = 0xFFFF800000110640
ffff80000011055c: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff800000110560: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff800000110568: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000110570: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff800000110578: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000110580: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000110588: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110590: 49 be a0 06 11 00 00 80 ff ff	movabsq	$-140737487239520, %r14 # imm = 0xFFFF8000001106A0
ffff80000011059a: 4c 89 75 c0          	movq	%r14, -64(%rbp)
ffff80000011059e: 48 8d 45 d0          	leaq	-48(%rbp), %rax
ffff8000001105a2: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (walk_all_pages(pml4, &walker) < 0)
ffff8000001105a6: 48 b8 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rax # imm = 0xFFFF800000110E80
ffff8000001105b0: 48 8d 75 80          	leaq	-128(%rbp), %rsi
ffff8000001105b4: ff d0                	callq	*%rax
ffff8000001105b6: 85 c0                	testl	%eax, %eax
ffff8000001105b8: 78 0f                	js	0xffff8000001105c9 <dump_page_tables+0xb9>
ffff8000001105ba: 31 db                	xorl	%ebx, %ebx
ffff8000001105bc: 48 8d 55 80          	leaq	-128(%rbp), %rdx
; 	dump_hole(0, 0, &walker);
ffff8000001105c0: 31 ff                	xorl	%edi, %edi
ffff8000001105c2: 31 f6                	xorl	%esi, %esi
ffff8000001105c4: 41 ff d6             	callq	*%r14
ffff8000001105c7: eb 05                	jmp	0xffff8000001105ce <dump_page_tables+0xbe>
ffff8000001105c9: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
; }
ffff8000001105ce: 89 d8                	movl	%ebx, %eax
ffff8000001105d0: 48 83 c4 70          	addq	$112, %rsp
ffff8000001105d4: 5b                   	popq	%rbx
ffff8000001105d5: 41 5e                	popq	%r14
ffff8000001105d7: 5d                   	popq	%rbp
ffff8000001105d8: c3                   	retq
ffff8000001105d9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001105e0 <dump_pte>:
; {
ffff8000001105e0: 55                   	pushq	%rbp
ffff8000001105e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001105e4: 41 57                	pushq	%r15
ffff8000001105e6: 41 56                	pushq	%r14
ffff8000001105e8: 41 54                	pushq	%r12
ffff8000001105ea: 53                   	pushq	%rbx
ffff8000001105eb: 49 89 d7             	movq	%rdx, %r15
; 	struct dump_info *info = walker->udata;
ffff8000001105ee: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	flags = *entry & info->mask;
ffff8000001105f2: 4c 8b 63 18          	movq	24(%rbx), %r12
ffff8000001105f6: 4c 23 27             	andq	(%rdi), %r12
; 	if (flags == info->flags) {
ffff8000001105f9: 4c 3b 63 10          	cmpq	16(%rbx), %r12
ffff8000001105fd: 75 06                	jne	0xffff800000110605 <dump_pte+0x25>
; 		info->end = end;
ffff8000001105ff: 4c 89 7b 08          	movq	%r15, 8(%rbx)
ffff800000110603: eb 23                	jmp	0xffff800000110628 <dump_pte+0x48>
ffff800000110605: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff800000110608: 48 b8 a0 06 11 00 00 80 ff ff	movabsq	$-140737487239520, %rax # imm = 0xFFFF8000001106A0
ffff800000110612: 48 89 f7             	movq	%rsi, %rdi
ffff800000110615: 4c 89 fe             	movq	%r15, %rsi
ffff800000110618: 48 89 ca             	movq	%rcx, %rdx
ffff80000011061b: ff d0                	callq	*%rax
; 	info->base = base;
ffff80000011061d: 4c 89 33             	movq	%r14, (%rbx)
; 	info->end = end;
ffff800000110620: 4c 89 7b 08          	movq	%r15, 8(%rbx)
; 	info->flags = flags;
ffff800000110624: 4c 89 63 10          	movq	%r12, 16(%rbx)
; }
ffff800000110628: 31 c0                	xorl	%eax, %eax
ffff80000011062a: 5b                   	popq	%rbx
ffff80000011062b: 41 5c                	popq	%r12
ffff80000011062d: 41 5e                	popq	%r14
ffff80000011062f: 41 5f                	popq	%r15
ffff800000110631: 5d                   	popq	%rbp
ffff800000110632: c3                   	retq
ffff800000110633: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011063d: 0f 1f 00             	nopl	(%rax)

ffff800000110640 <dump_pde>:
; {
ffff800000110640: 55                   	pushq	%rbp
ffff800000110641: 48 89 e5             	movq	%rsp, %rbp
ffff800000110644: 41 57                	pushq	%r15
ffff800000110646: 41 56                	pushq	%r14
ffff800000110648: 41 54                	pushq	%r12
ffff80000011064a: 53                   	pushq	%rbx
; 	if (!(*entry & PAGE_HUGE))
ffff80000011064b: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000011064e: f6 c3 80             	testb	$-128, %bl
ffff800000110651: 74 40                	je	0xffff800000110693 <dump_pde+0x53>
ffff800000110653: 49 89 d7             	movq	%rdx, %r15
ffff800000110656: 4c 8b 61 48          	movq	72(%rcx), %r12
; 	flags = *entry & info->mask;
ffff80000011065a: 49 23 5c 24 18       	andq	24(%r12), %rbx
; 	if (flags == info->flags) {
ffff80000011065f: 49 3b 5c 24 10       	cmpq	16(%r12), %rbx
ffff800000110664: 75 07                	jne	0xffff80000011066d <dump_pde+0x2d>
; 		info->end = end;
ffff800000110666: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
ffff80000011066b: eb 26                	jmp	0xffff800000110693 <dump_pde+0x53>
ffff80000011066d: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff800000110670: 48 b8 a0 06 11 00 00 80 ff ff	movabsq	$-140737487239520, %rax # imm = 0xFFFF8000001106A0
ffff80000011067a: 48 89 f7             	movq	%rsi, %rdi
ffff80000011067d: 4c 89 fe             	movq	%r15, %rsi
ffff800000110680: 48 89 ca             	movq	%rcx, %rdx
ffff800000110683: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000110685: 4d 89 34 24          	movq	%r14, (%r12)
; 	info->end = end;
ffff800000110689: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
; 	info->flags = flags;
ffff80000011068e: 49 89 5c 24 10       	movq	%rbx, 16(%r12)
; }
ffff800000110693: 31 c0                	xorl	%eax, %eax
ffff800000110695: 5b                   	popq	%rbx
ffff800000110696: 41 5c                	popq	%r12
ffff800000110698: 41 5e                	popq	%r14
ffff80000011069a: 41 5f                	popq	%r15
ffff80000011069c: 5d                   	popq	%rbp
ffff80000011069d: c3                   	retq
ffff80000011069e: 66 90                	nop

ffff8000001106a0 <dump_hole>:
; {
ffff8000001106a0: 55                   	pushq	%rbp
ffff8000001106a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001106a4: 41 56                	pushq	%r14
ffff8000001106a6: 53                   	pushq	%rbx
ffff8000001106a7: 48 83 ec 10          	subq	$16, %rsp
; 	struct dump_info *info = walker->udata;
ffff8000001106ab: 48 8b 5a 48          	movq	72(%rdx), %rbx
; 	if (info->flags & PAGE_PRESENT) {
ffff8000001106af: 48 8b 43 10          	movq	16(%rbx), %rax
ffff8000001106b3: a8 01                	testb	$1, %al
ffff8000001106b5: 0f 84 90 00 00 00    	je	0xffff80000011074b <dump_hole+0xab>
; 			info->base,
ffff8000001106bb: 48 8b 33             	movq	(%rbx), %rsi
; 			info->end,
ffff8000001106be: 48 8b 53 08          	movq	8(%rbx), %rdx
; 			(info->flags & PAGE_WRITE) ? 'w' : '-',
ffff8000001106c2: a8 02                	testb	$2, %al
ffff8000001106c4: b9 2d 00 00 00       	movl	$45, %ecx
ffff8000001106c9: 41 b8 77 00 00 00    	movl	$119, %r8d
ffff8000001106cf: 44 0f 44 c1          	cmovel	%ecx, %r8d
; 			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
ffff8000001106d3: 48 85 c0             	testq	%rax, %rax
ffff8000001106d6: 41 b9 78 00 00 00    	movl	$120, %r9d
ffff8000001106dc: 44 0f 48 c9          	cmovsl	%ecx, %r9d
; 			(info->flags & PAGE_USER) ? 'u' : '-'
ffff8000001106e0: a8 04                	testb	$4, %al
ffff8000001106e2: b8 75 00 00 00       	movl	$117, %eax
ffff8000001106e7: 0f 44 c1             	cmovel	%ecx, %eax
; 		cprintf("  %016p - %016p [%c%c%c%c",
ffff8000001106ea: 89 04 24             	movl	%eax, (%rsp)
ffff8000001106ed: 48 bf 85 47 11 00 00 80 ff ff	movabsq	$-140737487222907, %rdi # imm = 0xFFFF800000114785
ffff8000001106f7: 49 be 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %r14 # imm = 0xFFFF80000010D400
ffff800000110701: b9 72 00 00 00       	movl	$114, %ecx
ffff800000110706: 31 c0                	xorl	%eax, %eax
ffff800000110708: 41 ff d6             	callq	*%r14
; 		if (info->mask & PAGE_HUGE) {
ffff80000011070b: f6 43 18 80          	testb	$-128, 24(%rbx)
ffff80000011070f: 74 2b                	je	0xffff80000011073c <dump_hole+0x9c>
; 				(info->flags & PAGE_HUGE) ? "2M" : "4K"
ffff800000110711: f6 43 10 80          	testb	$-128, 16(%rbx)
ffff800000110715: 48 b8 c1 40 11 00 00 80 ff ff	movabsq	$-140737487224639, %rax # imm = 0xFFFF8000001140C1
ffff80000011071f: 48 be 0f 39 11 00 00 80 ff ff	movabsq	$-140737487226609, %rsi # imm = 0xFFFF80000011390F
ffff800000110729: 48 0f 44 f0          	cmoveq	%rax, %rsi
; 			cprintf(" %s",
ffff80000011072d: 48 bf 84 3b 11 00 00 80 ff ff	movabsq	$-140737487225980, %rdi # imm = 0xFFFF800000113B84
ffff800000110737: 31 c0                	xorl	%eax, %eax
ffff800000110739: 41 ff d6             	callq	*%r14
; 		cprintf("]\n");
ffff80000011073c: 48 bf 4e 40 11 00 00 80 ff ff	movabsq	$-140737487224754, %rdi # imm = 0xFFFF80000011404E
ffff800000110746: 31 c0                	xorl	%eax, %eax
ffff800000110748: 41 ff d6             	callq	*%r14
; 	info->flags = 0;
ffff80000011074b: 48 c7 43 10 00 00 00 00      	movq	$0, 16(%rbx)
; 	return 0;
ffff800000110753: 31 c0                	xorl	%eax, %eax
ffff800000110755: 48 83 c4 10          	addq	$16, %rsp
ffff800000110759: 5b                   	popq	%rbx
ffff80000011075a: 41 5e                	popq	%r14
ffff80000011075c: 5d                   	popq	%rbp
ffff80000011075d: c3                   	retq
ffff80000011075e: cc                   	int3
ffff80000011075f: cc                   	int3

ffff800000110760 <page_insert>:
; {
ffff800000110760: 55                   	pushq	%rbp
ffff800000110761: 48 89 e5             	movq	%rsp, %rbp
ffff800000110764: 48 83 ec 70          	subq	$112, %rsp
; 	struct page_walker walker = {
ffff800000110768: 48 b8 f0 07 11 00 00 80 ff ff	movabsq	$-140737487239184, %rax # imm = 0xFFFF8000001107F0
ffff800000110772: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000110776: 48 b8 00 08 11 00 00 80 ff ff	movabsq	$-140737487239168, %rax # imm = 0xFFFF800000110800
ffff800000110780: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000110784: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000011078c: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110794: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000011079c: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff8000001107a4: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff8000001107ac: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff8000001107b4: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
ffff8000001107bc: 48 8d 45 98          	leaq	-104(%rbp), %rax
ffff8000001107c0: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	return walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001107c4: 48 8d 82 00 10 00 00 	leaq	4096(%rdx), %rax
ffff8000001107cb: 49 b8 10 0e 11 00 00 80 ff ff	movabsq	$-140737487237616, %r8 # imm = 0xFFFF800000110E10
ffff8000001107d5: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff8000001107d9: 48 89 d6             	movq	%rdx, %rsi
ffff8000001107dc: 48 89 c2             	movq	%rax, %rdx
ffff8000001107df: 41 ff d0             	callq	*%r8
ffff8000001107e2: 48 83 c4 70          	addq	$112, %rsp
ffff8000001107e6: 5d                   	popq	%rbp
ffff8000001107e7: c3                   	retq
ffff8000001107e8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001107f0 <insert_pte>:
; {
ffff8000001107f0: 55                   	pushq	%rbp
ffff8000001107f1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001107f4: 31 c0                	xorl	%eax, %eax
ffff8000001107f6: 5d                   	popq	%rbp
ffff8000001107f7: c3                   	retq
ffff8000001107f8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110800 <insert_pde>:
; {
ffff800000110800: 55                   	pushq	%rbp
ffff800000110801: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110804: 31 c0                	xorl	%eax, %eax
ffff800000110806: 5d                   	popq	%rbp
ffff800000110807: c3                   	retq
ffff800000110808: cc                   	int3
ffff800000110809: cc                   	int3
ffff80000011080a: cc                   	int3
ffff80000011080b: cc                   	int3
ffff80000011080c: cc                   	int3
ffff80000011080d: cc                   	int3
ffff80000011080e: cc                   	int3
ffff80000011080f: cc                   	int3

ffff800000110810 <page_lookup>:
; {
ffff800000110810: 55                   	pushq	%rbp
ffff800000110811: 48 89 e5             	movq	%rsp, %rbp
ffff800000110814: 48 83 ec 60          	subq	$96, %rsp
; 	struct lookup_info info = {
ffff800000110818: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; 	struct page_walker walker = {
ffff800000110820: 48 b8 a0 08 11 00 00 80 ff ff	movabsq	$-140737487239008, %rax # imm = 0xFFFF8000001108A0
ffff80000011082a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011082e: 48 b8 b0 08 11 00 00 80 ff ff	movabsq	$-140737487238992, %rax # imm = 0xFFFF8000001108B0
ffff800000110838: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000011083c: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110844: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000011084c: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110854: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000011085c: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000110864: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000011086c: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff800000110874: 48 8d 45 f8          	leaq	-8(%rbp), %rax
ffff800000110878: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff80000011087c: 48 8d 96 00 10 00 00 	leaq	4096(%rsi), %rdx
ffff800000110883: 48 b8 10 0e 11 00 00 80 ff ff	movabsq	$-140737487237616, %rax # imm = 0xFFFF800000110E10
ffff80000011088d: 48 8d 4d a8          	leaq	-88(%rbp), %rcx
ffff800000110891: ff d0                	callq	*%rax
; }
ffff800000110893: 31 c0                	xorl	%eax, %eax
ffff800000110895: 48 83 c4 60          	addq	$96, %rsp
ffff800000110899: 5d                   	popq	%rbp
ffff80000011089a: c3                   	retq
ffff80000011089b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001108a0 <lookup_pte>:
; {
ffff8000001108a0: 55                   	pushq	%rbp
ffff8000001108a1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001108a4: 31 c0                	xorl	%eax, %eax
ffff8000001108a6: 5d                   	popq	%rbp
ffff8000001108a7: c3                   	retq
ffff8000001108a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001108b0 <lookup_pde>:
; {
ffff8000001108b0: 55                   	pushq	%rbp
ffff8000001108b1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001108b4: 31 c0                	xorl	%eax, %eax
ffff8000001108b6: 5d                   	popq	%rbp
ffff8000001108b7: c3                   	retq
ffff8000001108b8: cc                   	int3
ffff8000001108b9: cc                   	int3
ffff8000001108ba: cc                   	int3
ffff8000001108bb: cc                   	int3
ffff8000001108bc: cc                   	int3
ffff8000001108bd: cc                   	int3
ffff8000001108be: cc                   	int3
ffff8000001108bf: cc                   	int3

ffff8000001108c0 <boot_map_region>:
; {
ffff8000001108c0: 55                   	pushq	%rbp
ffff8000001108c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001108c4: 48 81 ec 80 00 00 00 	subq	$128, %rsp
; 	struct boot_map_info info = {
ffff8000001108cb: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff8000001108d3: 4c 89 45 e0          	movq	%r8, -32(%rbp)
ffff8000001108d7: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff8000001108db: 48 89 f0             	movq	%rsi, %rax
ffff8000001108de: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
; 	struct boot_map_info info = {
ffff8000001108e4: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff8000001108e8: 48 8d 04 16          	leaq	(%rsi,%rdx), %rax
ffff8000001108ec: 48 8d 0c 16          	leaq	(%rsi,%rdx), %rcx
ffff8000001108f0: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
ffff8000001108f7: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff8000001108fe: 48 83 c1 ff          	addq	$-1, %rcx
; 	struct boot_map_info info = {
ffff800000110902: 48 89 4d f8          	movq	%rcx, -8(%rbp)
; 	struct page_walker walker = {
ffff800000110906: 48 b9 90 09 11 00 00 80 ff ff	movabsq	$-140737487238768, %rcx # imm = 0xFFFF800000110990
ffff800000110910: 48 89 4d 88          	movq	%rcx, -120(%rbp)
ffff800000110914: 48 b9 c0 09 11 00 00 80 ff ff	movabsq	$-140737487238720, %rcx # imm = 0xFFFF8000001109C0
ffff80000011091e: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff800000110922: 48 b9 10 0a 11 00 00 80 ff ff	movabsq	$-140737487238640, %rcx # imm = 0xFFFF800000110A10
ffff80000011092c: 48 89 4d 98          	movq	%rcx, -104(%rbp)
ffff800000110930: 48 b9 30 0a 11 00 00 80 ff ff	movabsq	$-140737487238608, %rcx # imm = 0xFFFF800000110A30
ffff80000011093a: 48 89 4d a0          	movq	%rcx, -96(%rbp)
ffff80000011093e: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000110946: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff80000011094e: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110956: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000011095e: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110966: 48 8d 4d d8          	leaq	-40(%rbp), %rcx
ffff80000011096a: 48 89 4d d0          	movq	%rcx, -48(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff80000011096e: 49 b8 10 0e 11 00 00 80 ff ff	movabsq	$-140737487237616, %r8 # imm = 0xFFFF800000110E10
ffff800000110978: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff80000011097c: 48 89 c2             	movq	%rax, %rdx
ffff80000011097f: 41 ff d0             	callq	*%r8
; }
ffff800000110982: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff800000110989: 5d                   	popq	%rbp
ffff80000011098a: c3                   	retq
ffff80000011098b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110990 <boot_map_pte>:
; {
ffff800000110990: 55                   	pushq	%rbp
ffff800000110991: 48 89 e5             	movq	%rsp, %rbp
ffff800000110994: 53                   	pushq	%rbx
ffff800000110995: 50                   	pushq	%rax
; 	struct boot_map_info *info = walker->udata;
ffff800000110996: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	int res = claim_entry(entry, base, end, walker);
ffff80000011099a: 48 b8 20 0b 11 00 00 80 ff ff	movabsq	$-140737487238368, %rax # imm = 0xFFFF800000110B20
ffff8000001109a4: ff d0                	callq	*%rax
; 	if(res > 0) info->pa, info->base += PAGE_SIZE;
ffff8000001109a6: 85 c0                	testl	%eax, %eax
ffff8000001109a8: 7e 08                	jle	0xffff8000001109b2 <boot_map_pte+0x22>
ffff8000001109aa: 48 81 43 18 00 10 00 00      	addq	$4096, 24(%rbx) # imm = 0x1000
; 	return res;
ffff8000001109b2: 48 83 c4 08          	addq	$8, %rsp
ffff8000001109b6: 5b                   	popq	%rbx
ffff8000001109b7: 5d                   	popq	%rbp
ffff8000001109b8: c3                   	retq
ffff8000001109b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001109c0 <boot_map_pde>:
; {
ffff8000001109c0: 55                   	pushq	%rbp
ffff8000001109c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001109c4: 41 56                	pushq	%r14
ffff8000001109c6: 53                   	pushq	%rbx
ffff8000001109c7: 48 89 fb             	movq	%rdi, %rbx
; 	struct boot_map_info *info = walker->udata;
ffff8000001109ca: 4c 8b 71 48          	movq	72(%rcx), %r14
; 	}else if(*entry & PAGE_PRESENT){
ffff8000001109ce: f6 07 01             	testb	$1, (%rdi)
ffff8000001109d1: 75 0c                	jne	0xffff8000001109df <boot_map_pde+0x1f>
; 		res = ptbl_alloc(entry, base, end, walker);
ffff8000001109d3: 48 b8 a0 0b 11 00 00 80 ff ff	movabsq	$-140737487238240, %rax # imm = 0xFFFF800000110BA0
ffff8000001109dd: eb 0a                	jmp	0xffff8000001109e9 <boot_map_pde+0x29>
; 		res = ptbl_split(entry, base, end, walker);
ffff8000001109df: 48 b8 b0 0b 11 00 00 80 ff ff	movabsq	$-140737487238224, %rax # imm = 0xFFFF800000110BB0
ffff8000001109e9: 48 89 df             	movq	%rbx, %rdi
ffff8000001109ec: ff d0                	callq	*%rax
ffff8000001109ee: 48 c7 c1 00 f0 ff ff 	movq	$-4096, %rcx            # imm = 0xF000
; 	*entry &= 0xFFFFFFFFFFFFF000; //CLEAR FLAGS //TODO MAYBE CHANGE
ffff8000001109f5: 48 23 0b             	andq	(%rbx), %rcx
ffff8000001109f8: 48 89 0b             	movq	%rcx, (%rbx)
; 	*entry |= info->flags;
ffff8000001109fb: 49 0b 4e 08          	orq	8(%r14), %rcx
ffff8000001109ff: 48 89 0b             	movq	%rcx, (%rbx)
; }
ffff800000110a02: 5b                   	popq	%rbx
ffff800000110a03: 41 5e                	popq	%r14
ffff800000110a05: 5d                   	popq	%rbp
ffff800000110a06: c3                   	retq
ffff800000110a07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000110a10 <boot_map_pdpte>:
; {
ffff800000110a10: 55                   	pushq	%rbp
ffff800000110a11: 48 89 e5             	movq	%rsp, %rbp
; 	return claim_entry(entry, base, end, walker);
ffff800000110a14: 48 b8 20 0b 11 00 00 80 ff ff	movabsq	$-140737487238368, %rax # imm = 0xFFFF800000110B20
ffff800000110a1e: ff d0                	callq	*%rax
ffff800000110a20: 5d                   	popq	%rbp
ffff800000110a21: c3                   	retq
ffff800000110a22: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110a2c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110a30 <boot_map_pml4>:
; {
ffff800000110a30: 55                   	pushq	%rbp
ffff800000110a31: 48 89 e5             	movq	%rsp, %rbp
; 	return claim_entry(entry, base, end, walker);
ffff800000110a34: 48 b8 20 0b 11 00 00 80 ff ff	movabsq	$-140737487238368, %rax # imm = 0xFFFF800000110B20
ffff800000110a3e: ff d0                	callq	*%rax
ffff800000110a40: 5d                   	popq	%rbp
ffff800000110a41: c3                   	retq
ffff800000110a42: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110a4c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110a50 <boot_map_kernel>:
; {
ffff800000110a50: 55                   	pushq	%rbp
ffff800000110a51: 48 89 e5             	movq	%rsp, %rbp
ffff800000110a54: 41 57                	pushq	%r15
ffff800000110a56: 41 56                	pushq	%r14
ffff800000110a58: 41 55                	pushq	%r13
ffff800000110a5a: 41 54                	pushq	%r12
ffff800000110a5c: 53                   	pushq	%rbx
ffff800000110a5d: 50                   	pushq	%rax
ffff800000110a5e: 48 89 f3             	movq	%rsi, %rbx
ffff800000110a61: 49 89 fe             	movq	%rdi, %r14
ffff800000110a64: 49 bf 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %r15 # imm = 0xFFFF800000000000
ffff800000110a6e: 48 b8 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
; 	    (struct elf_proghdr *)((char *)elf_hdr + elf_hdr->e_phoff);
ffff800000110a78: 4c 8b 66 20          	movq	32(%rsi), %r12
; 	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, PADDR((void*)KERNEL_VMA), PAGE_KMASK);
ffff800000110a7c: 4c 8d 40 03          	leaq	3(%rax), %r8
ffff800000110a80: 48 b8 c0 08 11 00 00 80 ff ff	movabsq	$-140737487238976, %rax # imm = 0xFFFF8000001108C0
ffff800000110a8a: ba 00 00 80 00       	movl	$8388608, %edx          # imm = 0x800000
ffff800000110a8f: 4c 89 fe             	movq	%r15, %rsi
ffff800000110a92: 31 c9                	xorl	%ecx, %ecx
ffff800000110a94: ff d0                	callq	*%rax
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000110a96: 66 83 7b 38 00       	cmpw	$0, 56(%rbx)
ffff800000110a9b: 74 6c                	je	0xffff800000110b09 <boot_map_kernel+0xb9>
ffff800000110a9d: 49 01 dc             	addq	%rbx, %r12
ffff800000110aa0: 49 83 c4 28          	addq	$40, %r12
ffff800000110aa4: 45 31 ed             	xorl	%r13d, %r13d
ffff800000110aa7: eb 18                	jmp	0xffff800000110ac1 <boot_map_kernel+0x71>
ffff800000110aa9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff800000110ab0: 49 83 c5 01          	addq	$1, %r13
ffff800000110ab4: 0f b7 43 38          	movzwl	56(%rbx), %eax
ffff800000110ab8: 49 83 c4 38          	addq	$56, %r12
ffff800000110abc: 49 39 c5             	cmpq	%rax, %r13
ffff800000110abf: 73 48                	jae	0xffff800000110b09 <boot_map_kernel+0xb9>
; 		if(prog_hdr->p_va < KERNEL_VMA) continue;
ffff800000110ac1: 49 8b 74 24 e8       	movq	-24(%r12), %rsi
ffff800000110ac6: 4c 39 fe             	cmpq	%r15, %rsi
ffff800000110ac9: 72 e5                	jb	0xffff800000110ab0 <boot_map_kernel+0x60>
; 		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
ffff800000110acb: 41 8b 44 24 dc       	movl	-36(%r12), %eax
ffff800000110ad0: 89 c1                	movl	%eax, %ecx
ffff800000110ad2: 83 e1 02             	andl	$2, %ecx
; 		if(!(prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)) flags |= PAGE_NO_EXEC; //CHECK AGAIN IF THIS IS THE CORRECT WAY TO CHECK THE FLAGS
ffff800000110ad5: 49 89 c8             	movq	%rcx, %r8
ffff800000110ad8: 48 ba 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rdx # imm = 0x8000000000000000
ffff800000110ae2: 49 09 d0             	orq	%rdx, %r8
ffff800000110ae5: a8 01                	testb	$1, %al
ffff800000110ae7: 4c 0f 45 c1          	cmovneq	%rcx, %r8
; 		flags |= PF_PRESENT;
ffff800000110aeb: 49 83 c8 01          	orq	$1, %r8
; 		boot_map_region(pml4, (void*) prog_hdr->p_va, prog_hdr->p_memsz, prog_hdr->p_pa, flags);
ffff800000110aef: 49 8b 14 24          	movq	(%r12), %rdx
ffff800000110af3: 49 8b 4c 24 f0       	movq	-16(%r12), %rcx
ffff800000110af8: 4c 89 f7             	movq	%r14, %rdi
ffff800000110afb: 48 b8 c0 08 11 00 00 80 ff ff	movabsq	$-140737487238976, %rax # imm = 0xFFFF8000001108C0
ffff800000110b05: ff d0                	callq	*%rax
ffff800000110b07: eb a7                	jmp	0xffff800000110ab0 <boot_map_kernel+0x60>
; }
ffff800000110b09: 48 83 c4 08          	addq	$8, %rsp
ffff800000110b0d: 5b                   	popq	%rbx
ffff800000110b0e: 41 5c                	popq	%r12
ffff800000110b10: 41 5d                	popq	%r13
ffff800000110b12: 41 5e                	popq	%r14
ffff800000110b14: 41 5f                	popq	%r15
ffff800000110b16: 5d                   	popq	%rbp
ffff800000110b17: c3                   	retq
ffff800000110b18: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110b20 <claim_entry>:
; static int claim_entry(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
ffff800000110b20: 55                   	pushq	%rbp
ffff800000110b21: 48 89 e5             	movq	%rsp, %rbp
ffff800000110b24: 41 57                	pushq	%r15
ffff800000110b26: 41 56                	pushq	%r14
ffff800000110b28: 53                   	pushq	%rbx
ffff800000110b29: 50                   	pushq	%rax
ffff800000110b2a: 49 89 fe             	movq	%rdi, %r14
; 	struct boot_map_info *info = walker->udata;
ffff800000110b2d: 4c 8b 79 48          	movq	72(%rcx), %r15
; 	if(!(*entry & PF_PRESENT)){
ffff800000110b31: 48 8b 07             	movq	(%rdi), %rax
ffff800000110b34: a8 01                	testb	$1, %al
ffff800000110b36: 75 17                	jne	0xffff800000110b4f <claim_entry+0x2f>
; 		res = ptbl_alloc(entry, base, end, walker);
ffff800000110b38: 48 b8 a0 0b 11 00 00 80 ff ff	movabsq	$-140737487238240, %rax # imm = 0xFFFF800000110BA0
ffff800000110b42: 4c 89 f7             	movq	%r14, %rdi
ffff800000110b45: ff d0                	callq	*%rax
ffff800000110b47: 89 c3                	movl	%eax, %ebx
; 	if(res > 0) set_entry_pa(entry, info->pa);
ffff800000110b49: 85 db                	testl	%ebx, %ebx
ffff800000110b4b: 7f 0f                	jg	0xffff800000110b5c <claim_entry+0x3c>
ffff800000110b4d: eb 20                	jmp	0xffff800000110b6f <claim_entry+0x4f>
; 		*entry |= info->flags;
ffff800000110b4f: 49 0b 47 08          	orq	8(%r15), %rax
ffff800000110b53: 49 89 06             	movq	%rax, (%r14)
ffff800000110b56: 31 db                	xorl	%ebx, %ebx
; 	if(res > 0) set_entry_pa(entry, info->pa);
ffff800000110b58: 85 db                	testl	%ebx, %ebx
ffff800000110b5a: 7e 13                	jle	0xffff800000110b6f <claim_entry+0x4f>
ffff800000110b5c: 49 8b 77 10          	movq	16(%r15), %rsi
ffff800000110b60: 48 b8 80 0b 11 00 00 80 ff ff	movabsq	$-140737487238272, %rax # imm = 0xFFFF800000110B80
ffff800000110b6a: 4c 89 f7             	movq	%r14, %rdi
ffff800000110b6d: ff d0                	callq	*%rax
; 	return res;
ffff800000110b6f: 89 d8                	movl	%ebx, %eax
ffff800000110b71: 48 83 c4 08          	addq	$8, %rsp
ffff800000110b75: 5b                   	popq	%rbx
ffff800000110b76: 41 5e                	popq	%r14
ffff800000110b78: 41 5f                	popq	%r15
ffff800000110b7a: 5d                   	popq	%rbp
ffff800000110b7b: c3                   	retq
ffff800000110b7c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110b80 <set_entry_pa>:
; static inline void set_entry_pa(physaddr_t *entry, physaddr_t pa){
ffff800000110b80: 55                   	pushq	%rbp
ffff800000110b81: 48 89 e5             	movq	%rsp, %rbp
ffff800000110b84: 48 b8 ff 0f 00 00 00 00 00 80	movabsq	$-9223372036854771713, %rax # imm = 0x8000000000000FFF
; 	*entry &= PHYS_ADD_MASK;
ffff800000110b8e: 48 23 07             	andq	(%rdi), %rax
; 	*entry |= pa & (PAGE_SIZE - 1);
ffff800000110b91: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff800000110b97: 48 09 c6             	orq	%rax, %rsi
ffff800000110b9a: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff800000110b9d: 5d                   	popq	%rbp
ffff800000110b9e: c3                   	retq
ffff800000110b9f: cc                   	int3

ffff800000110ba0 <ptbl_alloc>:
; {
ffff800000110ba0: 55                   	pushq	%rbp
ffff800000110ba1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110ba4: 31 c0                	xorl	%eax, %eax
ffff800000110ba6: 5d                   	popq	%rbp
ffff800000110ba7: c3                   	retq
ffff800000110ba8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110bb0 <ptbl_split>:
; {
ffff800000110bb0: 55                   	pushq	%rbp
ffff800000110bb1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110bb4: 31 c0                	xorl	%eax, %eax
ffff800000110bb6: 5d                   	popq	%rbp
ffff800000110bb7: c3                   	retq
ffff800000110bb8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110bc0 <ptbl_merge>:
; {
ffff800000110bc0: 55                   	pushq	%rbp
ffff800000110bc1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110bc4: 31 c0                	xorl	%eax, %eax
ffff800000110bc6: 5d                   	popq	%rbp
ffff800000110bc7: c3                   	retq
ffff800000110bc8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110bd0 <ptbl_free>:
; {
ffff800000110bd0: 55                   	pushq	%rbp
ffff800000110bd1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110bd4: 31 c0                	xorl	%eax, %eax
ffff800000110bd6: 5d                   	popq	%rbp
ffff800000110bd7: c3                   	retq
ffff800000110bd8: cc                   	int3
ffff800000110bd9: cc                   	int3
ffff800000110bda: cc                   	int3
ffff800000110bdb: cc                   	int3
ffff800000110bdc: cc                   	int3
ffff800000110bdd: cc                   	int3
ffff800000110bde: cc                   	int3
ffff800000110bdf: cc                   	int3

ffff800000110be0 <unmap_page_range>:
; {
ffff800000110be0: 55                   	pushq	%rbp
ffff800000110be1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110be4: 48 83 ec 60          	subq	$96, %rsp
; 	struct remove_info info = {
ffff800000110be8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000110bec: 48 89 75 f8          	movq	%rsi, -8(%rbp)
; 	struct page_walker walker = {
ffff800000110bf0: 48 b8 70 0c 11 00 00 80 ff ff	movabsq	$-140737487238032, %rax # imm = 0xFFFF800000110C70
ffff800000110bfa: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff800000110bfe: 48 b8 90 0c 11 00 00 80 ff ff	movabsq	$-140737487238000, %rax # imm = 0xFFFF800000110C90
ffff800000110c08: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff800000110c0c: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000110c14: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000110c1c: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000110c24: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000110c2c: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000110c34: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000110c3c: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000110c44: 48 8d 45 f0          	leaq	-16(%rbp), %rax
ffff800000110c48: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	walk_page_range(pml4, va, va + size, &walker);
ffff800000110c4c: 48 01 f2             	addq	%rsi, %rdx
ffff800000110c4f: 48 b8 10 0e 11 00 00 80 ff ff	movabsq	$-140737487237616, %rax # imm = 0xFFFF800000110E10
ffff800000110c59: 48 8d 4d a0          	leaq	-96(%rbp), %rcx
ffff800000110c5d: ff d0                	callq	*%rax
; }
ffff800000110c5f: 48 83 c4 60          	addq	$96, %rsp
ffff800000110c63: 5d                   	popq	%rbp
ffff800000110c64: c3                   	retq
ffff800000110c65: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110c6f: 90                   	nop

ffff800000110c70 <remove_pte>:
; {
ffff800000110c70: 55                   	pushq	%rbp
ffff800000110c71: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff800000110c74: f6 07 01             	testb	$1, (%rdi)
ffff800000110c77: 74 10                	je	0xffff800000110c89 <remove_pte+0x19>
; 	struct remove_info *info = walker->udata;
ffff800000110c79: 48 8b 71 48          	movq	72(%rcx), %rsi
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff800000110c7d: 48 b8 f0 0c 11 00 00 80 ff ff	movabsq	$-140737487237904, %rax # imm = 0xFFFF800000110CF0
ffff800000110c87: ff d0                	callq	*%rax
; 	return 0;
ffff800000110c89: 31 c0                	xorl	%eax, %eax
ffff800000110c8b: 5d                   	popq	%rbp
ffff800000110c8c: c3                   	retq
ffff800000110c8d: 0f 1f 00             	nopl	(%rax)

ffff800000110c90 <remove_pde>:
; {
ffff800000110c90: 55                   	pushq	%rbp
ffff800000110c91: 48 89 e5             	movq	%rsp, %rbp
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff800000110c94: 8b 07                	movl	(%rdi), %eax
ffff800000110c96: f7 d0                	notl	%eax
ffff800000110c98: a8 81                	testb	$-127, %al
ffff800000110c9a: 75 10                	jne	0xffff800000110cac <remove_pde+0x1c>
; 	struct remove_info *info = walker->udata;
ffff800000110c9c: 48 8b 71 48          	movq	72(%rcx), %rsi
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff800000110ca0: 48 b8 f0 0c 11 00 00 80 ff ff	movabsq	$-140737487237904, %rax # imm = 0xFFFF800000110CF0
ffff800000110caa: ff d0                	callq	*%rax
; 	return 0;
ffff800000110cac: 31 c0                	xorl	%eax, %eax
ffff800000110cae: 5d                   	popq	%rbp
ffff800000110caf: c3                   	retq

ffff800000110cb0 <unmap_user_pages>:
; {
ffff800000110cb0: 55                   	pushq	%rbp
ffff800000110cb1: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, 0, USER_LIM);
ffff800000110cb4: 48 b8 e0 0b 11 00 00 80 ff ff	movabsq	$-140737487238176, %rax # imm = 0xFFFF800000110BE0
ffff800000110cbe: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff800000110cc8: 31 f6                	xorl	%esi, %esi
ffff800000110cca: ff d0                	callq	*%rax
; }
ffff800000110ccc: 5d                   	popq	%rbp
ffff800000110ccd: c3                   	retq
ffff800000110cce: 66 90                	nop

ffff800000110cd0 <page_remove>:
; {
ffff800000110cd0: 55                   	pushq	%rbp
ffff800000110cd1: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, va, PAGE_SIZE);
ffff800000110cd4: 48 b8 e0 0b 11 00 00 80 ff ff	movabsq	$-140737487238176, %rax # imm = 0xFFFF800000110BE0
ffff800000110cde: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000110ce3: ff d0                	callq	*%rax
; }
ffff800000110ce5: 5d                   	popq	%rbp
ffff800000110ce6: c3                   	retq
ffff800000110ce7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000110cf0 <remove_page>:
; static void remove_page(physaddr_t *entry, struct remove_info *info){
ffff800000110cf0: 55                   	pushq	%rbp
ffff800000110cf1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110cf4: 41 57                	pushq	%r15
ffff800000110cf6: 41 56                	pushq	%r14
ffff800000110cf8: 53                   	pushq	%rbx
ffff800000110cf9: 50                   	pushq	%rax
ffff800000110cfa: 49 89 f7             	movq	%rsi, %r15
ffff800000110cfd: 49 89 fe             	movq	%rdi, %r14
; 	struct page_info *page = pa2page(get_entry_pa(entry));
ffff800000110d00: 48 b8 c0 0d 11 00 00 80 ff ff	movabsq	$-140737487237696, %rax # imm = 0xFFFF800000110DC0
ffff800000110d0a: ff d0                	callq	*%rax
ffff800000110d0c: 48 b9 60 0d 11 00 00 80 ff ff	movabsq	$-140737487237792, %rcx # imm = 0xFFFF800000110D60
ffff800000110d16: 48 89 c7             	movq	%rax, %rdi
ffff800000110d19: ff d1                	callq	*%rcx
ffff800000110d1b: 48 89 c3             	movq	%rax, %rbx
; 	page_decref(page);
ffff800000110d1e: 48 b8 c0 dc 10 00 00 80 ff ff	movabsq	$-140737487250240, %rax # imm = 0xFFFF80000010DCC0
ffff800000110d28: 48 89 df             	movq	%rbx, %rdi
ffff800000110d2b: ff d0                	callq	*%rax
; 	if(page->pp_free) *entry ^= PAGE_PRESENT;
ffff800000110d2d: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000110d31: 79 04                	jns	0xffff800000110d37 <remove_page+0x47>
ffff800000110d33: 41 80 36 01          	xorb	$1, (%r14)
; 	tlb_invalidate(info->pml4, info->va); //but invalidate tlb as virtual adress points to nothing now!
ffff800000110d37: 49 8b 3f             	movq	(%r15), %rdi
ffff800000110d3a: 49 8b 77 08          	movq	8(%r15), %rsi
ffff800000110d3e: 48 b8 e0 0d 11 00 00 80 ff ff	movabsq	$-140737487237664, %rax # imm = 0xFFFF800000110DE0
ffff800000110d48: ff d0                	callq	*%rax
; }
ffff800000110d4a: 48 83 c4 08          	addq	$8, %rsp
ffff800000110d4e: 5b                   	popq	%rbx
ffff800000110d4f: 41 5e                	popq	%r14
ffff800000110d51: 41 5f                	popq	%r15
ffff800000110d53: 5d                   	popq	%rbp
ffff800000110d54: c3                   	retq
ffff800000110d55: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110d5f: 90                   	nop

ffff800000110d60 <pa2page>:
; {
ffff800000110d60: 55                   	pushq	%rbp
ffff800000110d61: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000110d64: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000110d68: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000110d72: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000110d75: 73 16                	jae	0xffff800000110d8d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000110d77: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff800000110d81: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000110d85: 48 03 38             	addq	(%rax), %rdi
ffff800000110d88: 48 89 f8             	movq	%rdi, %rax
ffff800000110d8b: 5d                   	popq	%rbp
ffff800000110d8c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff800000110d8d: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff800000110d97: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
ffff800000110da1: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000110dab: be 49 00 00 00       	movl	$73, %esi
ffff800000110db0: 31 c0                	xorl	%eax, %eax
ffff800000110db2: ff d1                	callq	*%rcx
ffff800000110db4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110dbe: 66 90                	nop

ffff800000110dc0 <get_entry_pa>:
; static inline physaddr_t get_entry_pa(physaddr_t *entry){
ffff800000110dc0: 55                   	pushq	%rbp
ffff800000110dc1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110dc4: 48 b8 00 f0 ff ff ff ff ff 7f	movabsq	$9223372036854771712, %rax # imm = 0x7FFFFFFFFFFFF000
; 	return *entry & ~PHYS_ADD_MASK;
ffff800000110dce: 48 23 07             	andq	(%rdi), %rax
ffff800000110dd1: 5d                   	popq	%rbp
ffff800000110dd2: c3                   	retq
ffff800000110dd3: cc                   	int3
ffff800000110dd4: cc                   	int3
ffff800000110dd5: cc                   	int3
ffff800000110dd6: cc                   	int3
ffff800000110dd7: cc                   	int3
ffff800000110dd8: cc                   	int3
ffff800000110dd9: cc                   	int3
ffff800000110dda: cc                   	int3
ffff800000110ddb: cc                   	int3
ffff800000110ddc: cc                   	int3
ffff800000110ddd: cc                   	int3
ffff800000110dde: cc                   	int3
ffff800000110ddf: cc                   	int3

ffff800000110de0 <tlb_invalidate>:
; {
ffff800000110de0: 55                   	pushq	%rbp
ffff800000110de1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110de4: 48 89 f7             	movq	%rsi, %rdi
; 	flush_page(va);
ffff800000110de7: 48 b8 00 0e 11 00 00 80 ff ff	movabsq	$-140737487237632, %rax # imm = 0xFFFF800000110E00
ffff800000110df1: ff d0                	callq	*%rax
; }
ffff800000110df3: 5d                   	popq	%rbp
ffff800000110df4: c3                   	retq
ffff800000110df5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110dff: 90                   	nop

ffff800000110e00 <flush_page>:
; {
ffff800000110e00: 55                   	pushq	%rbp
ffff800000110e01: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("invlpg (%0)" :: "r" (addr) : "memory");
ffff800000110e04: 0f 01 3f             	invlpg	(%rdi)
; }
ffff800000110e07: 5d                   	popq	%rbp
ffff800000110e08: c3                   	retq
ffff800000110e09: cc                   	int3
ffff800000110e0a: cc                   	int3
ffff800000110e0b: cc                   	int3
ffff800000110e0c: cc                   	int3
ffff800000110e0d: cc                   	int3
ffff800000110e0e: cc                   	int3
ffff800000110e0f: cc                   	int3

ffff800000110e10 <walk_page_range>:
; {
ffff800000110e10: 55                   	pushq	%rbp
ffff800000110e11: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000110e14: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 		ROUNDUP((uintptr_t)end, PAGE_SIZE) - 1, walker);
ffff800000110e1b: 48 81 c2 ff 0f 00 00 	addq	$4095, %rdx             # imm = 0xFFF
ffff800000110e22: 48 81 e2 00 f0 ff ff 	andq	$-4096, %rdx            # imm = 0xF000
ffff800000110e29: 48 83 c2 ff          	addq	$-1, %rdx
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000110e2d: 48 b8 40 0e 11 00 00 80 ff ff	movabsq	$-140737487237568, %rax # imm = 0xFFFF800000110E40
ffff800000110e37: ff d0                	callq	*%rax
ffff800000110e39: 5d                   	popq	%rbp
ffff800000110e3a: c3                   	retq
ffff800000110e3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110e40 <pml4_walk_range>:
; {
ffff800000110e40: 55                   	pushq	%rbp
ffff800000110e41: 48 89 e5             	movq	%rsp, %rbp
ffff800000110e44: 48 89 c8             	movq	%rcx, %rax
; 	return __walk_range(pml4, base, end, walker->pml4e_callback, walker->pml4e_unmap, pdpt_walk_range, pml4_index, pml4_end, walker);
ffff800000110e47: 48 8b 49 18          	movq	24(%rcx), %rcx
ffff800000110e4b: 4c 8b 40 38          	movq	56(%rax), %r8
ffff800000110e4f: 49 ba 50 11 11 00 00 80 ff ff	movabsq	$-140737487236784, %r10 # imm = 0xFFFF800000111150
ffff800000110e59: 49 b9 30 11 11 00 00 80 ff ff	movabsq	$-140737487236816, %r9 # imm = 0xFFFF800000111130
ffff800000110e63: 49 bb 00 0f 11 00 00 80 ff ff	movabsq	$-140737487237376, %r11 # imm = 0xFFFF800000110F00
ffff800000110e6d: 50                   	pushq	%rax
ffff800000110e6e: 41 52                	pushq	%r10
ffff800000110e70: 41 ff d3             	callq	*%r11
ffff800000110e73: 48 83 c4 10          	addq	$16, %rsp
ffff800000110e77: 5d                   	popq	%rbp
ffff800000110e78: c3                   	retq
ffff800000110e79: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000110e80 <walk_all_pages>:
; {
ffff800000110e80: 55                   	pushq	%rbp
ffff800000110e81: 48 89 e5             	movq	%rsp, %rbp
ffff800000110e84: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
ffff800000110e87: 48 b8 40 0e 11 00 00 80 ff ff	movabsq	$-140737487237568, %rax # imm = 0xFFFF800000110E40
ffff800000110e91: 31 f6                	xorl	%esi, %esi
ffff800000110e93: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff800000110e9a: ff d0                	callq	*%rax
ffff800000110e9c: 5d                   	popq	%rbp
ffff800000110e9d: c3                   	retq
ffff800000110e9e: 66 90                	nop

ffff800000110ea0 <walk_user_pages>:
; {
ffff800000110ea0: 55                   	pushq	%rbp
ffff800000110ea1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110ea4: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, 0, USER_LIM, walker);
ffff800000110ea7: 48 b8 40 0e 11 00 00 80 ff ff	movabsq	$-140737487237568, %rax # imm = 0xFFFF800000110E40
ffff800000110eb1: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff800000110ebb: 31 f6                	xorl	%esi, %esi
ffff800000110ebd: ff d0                	callq	*%rax
ffff800000110ebf: 5d                   	popq	%rbp
ffff800000110ec0: c3                   	retq
ffff800000110ec1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110ecb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110ed0 <walk_kernel_pages>:
; {
ffff800000110ed0: 55                   	pushq	%rbp
ffff800000110ed1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110ed4: 48 89 f1             	movq	%rsi, %rcx
; 	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
ffff800000110ed7: 48 b8 40 0e 11 00 00 80 ff ff	movabsq	$-140737487237568, %rax # imm = 0xFFFF800000110E40
ffff800000110ee1: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff800000110eeb: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff800000110ef2: ff d0                	callq	*%rax
ffff800000110ef4: 5d                   	popq	%rbp
ffff800000110ef5: c3                   	retq
ffff800000110ef6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110f00 <__walk_range>:
; 	walkfn_t walkfn, int (*ptbl_index)(uintptr_t), uintptr_t (*ptbl_end)(uintptr_t), struct page_walker *walker){
ffff800000110f00: 55                   	pushq	%rbp
ffff800000110f01: 48 89 e5             	movq	%rsp, %rbp
ffff800000110f04: 41 57                	pushq	%r15
ffff800000110f06: 41 56                	pushq	%r14
ffff800000110f08: 41 55                	pushq	%r13
ffff800000110f0a: 41 54                	pushq	%r12
ffff800000110f0c: 53                   	pushq	%rbx
ffff800000110f0d: 48 83 ec 38          	subq	$56, %rsp
ffff800000110f11: 4c 89 cb             	movq	%r9, %rbx
ffff800000110f14: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff800000110f18: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff800000110f1c: 49 89 d5             	movq	%rdx, %r13
ffff800000110f1f: 49 89 f4             	movq	%rsi, %r12
ffff800000110f22: 48 89 7d c8          	movq	%rdi, -56(%rbp)
; 	uintptr_t page_entry_end = sign_extend(ptbl_end(base));
ffff800000110f26: 48 89 f7             	movq	%rsi, %rdi
ffff800000110f29: ff 55 10             	callq	*16(%rbp)
ffff800000110f2c: 49 89 c7             	movq	%rax, %r15
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff800000110f2f: 4c 89 e7             	movq	%r12, %rdi
ffff800000110f32: ff d3                	callq	*%rbx
ffff800000110f34: 41 89 c6             	movl	%eax, %r14d
ffff800000110f37: 4c 89 6d b0          	movq	%r13, -80(%rbp)
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff800000110f3b: 4c 89 ef             	movq	%r13, %rdi
ffff800000110f3e: 48 89 5d a8          	movq	%rbx, -88(%rbp)
ffff800000110f42: ff d3                	callq	*%rbx
ffff800000110f44: 31 c9                	xorl	%ecx, %ecx
ffff800000110f46: 41 39 c6             	cmpl	%eax, %r14d
ffff800000110f49: 0f 8f 8b 01 00 00    	jg	0xffff8000001110da <__walk_range+0x1da>
; 	uintptr_t page_entry_end = sign_extend(ptbl_end(base));
ffff800000110f4f: 48 bb 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %rbx # imm = 0xFFFF800000111170
ffff800000110f59: 4c 89 ff             	movq	%r15, %rdi
ffff800000110f5c: ff d3                	callq	*%rbx
ffff800000110f5e: 49 89 c7             	movq	%rax, %r15
; 	uintptr_t page_entry_base = sign_extend(base);
ffff800000110f61: 4c 89 e7             	movq	%r12, %rdi
ffff800000110f64: ff d3                	callq	*%rbx
ffff800000110f66: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff800000110f6a: 49 63 de             	movslq	%r14d, %rbx
ffff800000110f6d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000110f71: 4c 8d 34 d8          	leaq	(%rax,%rbx,8), %r14
ffff800000110f75: 48 83 c3 ff          	addq	$-1, %rbx
ffff800000110f79: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000110f80: 4d 8b 2e             	movq	(%r14), %r13
ffff800000110f83: 48 83 7d b8 00       	cmpq	$0, -72(%rbp)
ffff800000110f88: 4c 8b 65 18          	movq	24(%rbp), %r12
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_callback, ptbl_callback(entry, page_entry_base, page_entry_end, walker))
ffff800000110f8c: 74 1c                	je	0xffff800000110faa <__walk_range+0xaa>
ffff800000110f8e: 4c 89 f7             	movq	%r14, %rdi
ffff800000110f91: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000110f95: 4c 89 fa             	movq	%r15, %rdx
ffff800000110f98: 4c 89 e1             	movq	%r12, %rcx
ffff800000110f9b: ff 55 b8             	callq	*-72(%rbp)
ffff800000110f9e: 85 c0                	testl	%eax, %eax
ffff800000110fa0: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff800000110fa4: 0f 88 b6 00 00 00    	js	0xffff800000111060 <__walk_range+0x160>
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000110faa: 49 8b 44 24 40       	movq	64(%r12), %rax
ffff800000110faf: 48 85 c0             	testq	%rax, %rax
ffff800000110fb2: 4c 89 e1             	movq	%r12, %rcx
ffff800000110fb5: 74 23                	je	0xffff800000110fda <__walk_range+0xda>
ffff800000110fb7: 44 89 ea             	movl	%r13d, %edx
ffff800000110fba: 83 e2 01             	andl	$1, %edx
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000110fbd: 48 85 d2             	testq	%rdx, %rdx
ffff800000110fc0: 75 18                	jne	0xffff800000110fda <__walk_range+0xda>
ffff800000110fc2: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000110fc6: 4c 89 fe             	movq	%r15, %rsi
ffff800000110fc9: 48 89 ca             	movq	%rcx, %rdx
ffff800000110fcc: ff d0                	callq	*%rax
ffff800000110fce: 48 8b 4d 18          	movq	24(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000110fd2: 85 c0                	testl	%eax, %eax
ffff800000110fd4: 0f 88 95 00 00 00    	js	0xffff80000011106f <__walk_range+0x16f>
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000110fda: 41 f6 c5 01          	testb	$1, %r13b
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000110fde: 74 2b                	je	0xffff80000011100b <__walk_range+0x10b>
ffff800000110fe0: 49 8b 3e             	movq	(%r14), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000110fe3: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000110fed: 48 21 c7             	andq	%rax, %rdi
ffff800000110ff0: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000110ff4: 4c 89 fa             	movq	%r15, %rdx
ffff800000110ff7: 48 b8 f0 10 11 00 00 80 ff ff	movabsq	$-140737487236880, %rax # imm = 0xFFFF8000001110F0
ffff800000111001: ff d0                	callq	*%rax
ffff800000111003: 48 8b 4d 18          	movq	24(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111007: 85 c0                	testl	%eax, %eax
ffff800000111009: 78 73                	js	0xffff80000011107e <__walk_range+0x17e>
ffff80000011100b: 48 83 7d c0 00       	cmpq	$0, -64(%rbp)
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111010: 74 1e                	je	0xffff800000111030 <__walk_range+0x130>
ffff800000111012: 41 83 e5 01          	andl	$1, %r13d
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff800000111016: 4d 85 ed             	testq	%r13, %r13
ffff800000111019: 74 15                	je	0xffff800000111030 <__walk_range+0x130>
ffff80000011101b: 4c 89 f7             	movq	%r14, %rdi
ffff80000011101e: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111022: 4c 89 fa             	movq	%r15, %rdx
ffff800000111025: ff 55 c0             	callq	*-64(%rbp)
ffff800000111028: 48 8b 4d 18          	movq	24(%rbp), %rcx
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff80000011102c: 85 c0                	testl	%eax, %eax
ffff80000011102e: 78 73                	js	0xffff8000001110a3 <__walk_range+0x1a3>
; 		page_entry_base = sign_extend(page_entry_end + 1);
ffff800000111030: 49 83 c7 01          	addq	$1, %r15
ffff800000111034: 4c 89 ff             	movq	%r15, %rdi
ffff800000111037: 49 bf 70 11 11 00 00 80 ff ff	movabsq	$-140737487236752, %r15 # imm = 0xFFFF800000111170
ffff800000111041: 41 ff d7             	callq	*%r15
ffff800000111044: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page_entry_end = sign_extend(ptbl_end(page_entry_base));
ffff800000111048: 48 89 c7             	movq	%rax, %rdi
ffff80000011104b: ff 55 10             	callq	*16(%rbp)
ffff80000011104e: 48 89 c7             	movq	%rax, %rdi
ffff800000111051: 41 ff d7             	callq	*%r15
ffff800000111054: 49 89 c7             	movq	%rax, %r15
ffff800000111057: b0 01                	movb	$1, %al
ffff800000111059: 84 c0                	testb	%al, %al
ffff80000011105b: 75 5c                	jne	0xffff8000001110b9 <__walk_range+0x1b9>
ffff80000011105d: eb 78                	jmp	0xffff8000001110d7 <__walk_range+0x1d7>
ffff80000011105f: 90                   	nop
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_callback, ptbl_callback(entry, page_entry_base, page_entry_end, walker))
ffff800000111060: 4c 89 f7             	movq	%r14, %rdi
ffff800000111063: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111067: 4c 89 fa             	movq	%r15, %rdx
ffff80000011106a: 4c 89 e1             	movq	%r12, %rcx
ffff80000011106d: eb 30                	jmp	0xffff80000011109f <__walk_range+0x19f>
ffff80000011106f: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(walker->pt_hole_callback && !isPresent, walker->pt_hole_callback(page_entry_base, page_entry_end, walker))
ffff800000111073: 4c 89 fe             	movq	%r15, %rsi
ffff800000111076: 48 89 ca             	movq	%rcx, %rdx
ffff800000111079: ff 51 40             	callq	*64(%rcx)
ffff80000011107c: eb 32                	jmp	0xffff8000001110b0 <__walk_range+0x1b0>
ffff80000011107e: 49 8b 3e             	movq	(%r14), %rdi
; 		RET_ON_ERR_WALKER_CALLBACK(isPresent, walkfn((void*)PAGE_ADDR(*entry), page_entry_base, page_entry_end, walker))
ffff800000111081: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff80000011108b: 48 21 c7             	andq	%rax, %rdi
ffff80000011108e: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff800000111092: 4c 89 fa             	movq	%r15, %rdx
ffff800000111095: 48 b8 f0 10 11 00 00 80 ff ff	movabsq	$-140737487236880, %rax # imm = 0xFFFF8000001110F0
ffff80000011109f: ff d0                	callq	*%rax
ffff8000001110a1: eb 0d                	jmp	0xffff8000001110b0 <__walk_range+0x1b0>
; 		RET_ON_ERR_WALKER_CALLBACK(ptbl_unmap && isPresent, ptbl_unmap(entry, page_entry_base, page_entry_end, walker))
ffff8000001110a3: 4c 89 f7             	movq	%r14, %rdi
ffff8000001110a6: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff8000001110aa: 4c 89 fa             	movq	%r15, %rdx
ffff8000001110ad: ff 55 c0             	callq	*-64(%rbp)
ffff8000001110b0: 89 45 c8             	movl	%eax, -56(%rbp)
ffff8000001110b3: 31 c0                	xorl	%eax, %eax
ffff8000001110b5: 84 c0                	testb	%al, %al
ffff8000001110b7: 74 1e                	je	0xffff8000001110d7 <__walk_range+0x1d7>
ffff8000001110b9: 48 8b 7d b0          	movq	-80(%rbp), %rdi
; 	for(int i = ptbl_index(base); i <= ptbl_index(end); i++){
ffff8000001110bd: ff 55 a8             	callq	*-88(%rbp)
ffff8000001110c0: 48 98                	cltq
ffff8000001110c2: 48 83 c3 01          	addq	$1, %rbx
ffff8000001110c6: 49 83 c6 08          	addq	$8, %r14
ffff8000001110ca: 48 39 c3             	cmpq	%rax, %rbx
ffff8000001110cd: 0f 8c ad fe ff ff    	jl	0xffff800000110f80 <__walk_range+0x80>
ffff8000001110d3: 31 c9                	xorl	%ecx, %ecx
ffff8000001110d5: eb 03                	jmp	0xffff8000001110da <__walk_range+0x1da>
ffff8000001110d7: 8b 4d c8             	movl	-56(%rbp), %ecx
; }
ffff8000001110da: 89 c8                	movl	%ecx, %eax
ffff8000001110dc: 48 83 c4 38          	addq	$56, %rsp
ffff8000001110e0: 5b                   	popq	%rbx
ffff8000001110e1: 41 5c                	popq	%r12
ffff8000001110e3: 41 5d                	popq	%r13
ffff8000001110e5: 41 5e                	popq	%r14
ffff8000001110e7: 41 5f                	popq	%r15
ffff8000001110e9: 5d                   	popq	%rbp
ffff8000001110ea: c3                   	retq
ffff8000001110eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001110f0 <pdpt_walk_range>:
; {
ffff8000001110f0: 55                   	pushq	%rbp
ffff8000001110f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001110f4: 48 89 c8             	movq	%rcx, %rax
; 	return __walk_range(pdpt, base, end, walker->pdpte_callback, walker->pdpte_unmap, pdpt_walk_range, pdpt_index, pdpt_end, walker);
ffff8000001110f7: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff8000001110fb: 4c 8b 40 30          	movq	48(%rax), %r8
ffff8000001110ff: 49 ba c0 11 11 00 00 80 ff ff	movabsq	$-140737487236672, %r10 # imm = 0xFFFF8000001111C0
ffff800000111109: 49 b9 a0 11 11 00 00 80 ff ff	movabsq	$-140737487236704, %r9 # imm = 0xFFFF8000001111A0
ffff800000111113: 49 bb 00 0f 11 00 00 80 ff ff	movabsq	$-140737487237376, %r11 # imm = 0xFFFF800000110F00
ffff80000011111d: 50                   	pushq	%rax
ffff80000011111e: 41 52                	pushq	%r10
ffff800000111120: 41 ff d3             	callq	*%r11
ffff800000111123: 48 83 c4 10          	addq	$16, %rsp
ffff800000111127: 5d                   	popq	%rbp
ffff800000111128: c3                   	retq
ffff800000111129: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000111130 <pml4_index>:
; static inline int pml4_index(uintptr_t addr){return PML4_INDEX(addr);}
ffff800000111130: 55                   	pushq	%rbp
ffff800000111131: 48 89 e5             	movq	%rsp, %rbp
ffff800000111134: 48 89 f8             	movq	%rdi, %rax
ffff800000111137: 48 c1 e8 27          	shrq	$39, %rax
ffff80000011113b: 25 ff 01 00 00       	andl	$511, %eax              # imm = 0x1FF
ffff800000111140: 5d                   	popq	%rbp
ffff800000111141: c3                   	retq
ffff800000111142: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011114c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111150 <pml4_end>:
; {
ffff800000111150: 55                   	pushq	%rbp
ffff800000111151: 48 89 e5             	movq	%rsp, %rbp
ffff800000111154: 48 b8 ff ff ff ff 7f 00 00 00	movabsq	$549755813887, %rax # imm = 0x7FFFFFFFFF
; 	return addr | (PDPT_SPAN - 1);
ffff80000011115e: 48 09 f8             	orq	%rdi, %rax
ffff800000111161: 5d                   	popq	%rbp
ffff800000111162: c3                   	retq
ffff800000111163: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011116d: 0f 1f 00             	nopl	(%rax)

ffff800000111170 <sign_extend>:
; {
ffff800000111170: 55                   	pushq	%rbp
ffff800000111171: 48 89 e5             	movq	%rsp, %rbp
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff800000111174: 48 89 f9             	movq	%rdi, %rcx
ffff800000111177: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000011117b: 48 b8 00 00 00 00 00 00 ff ff	movabsq	$-281474976710656, %rax # imm = 0xFFFF000000000000
ffff800000111185: 48 09 f8             	orq	%rdi, %rax
ffff800000111188: 48 85 c9             	testq	%rcx, %rcx
ffff80000011118b: 48 0f 44 c7          	cmoveq	%rdi, %rax
ffff80000011118f: 5d                   	popq	%rbp
ffff800000111190: c3                   	retq
ffff800000111191: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011119b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001111a0 <pdpt_index>:
; static inline int pdpt_index(uintptr_t addr) {return PDPT_INDEX(addr);}
ffff8000001111a0: 55                   	pushq	%rbp
ffff8000001111a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001111a4: 48 89 f8             	movq	%rdi, %rax
ffff8000001111a7: 48 c1 e8 1e          	shrq	$30, %rax
ffff8000001111ab: 25 ff 01 00 00       	andl	$511, %eax              # imm = 0x1FF
ffff8000001111b0: 5d                   	popq	%rbp
ffff8000001111b1: c3                   	retq
ffff8000001111b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001111bc: 0f 1f 40 00          	nopl	(%rax)

ffff8000001111c0 <pdpt_end>:
; {
ffff8000001111c0: 55                   	pushq	%rbp
ffff8000001111c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001111c4: 48 89 f8             	movq	%rdi, %rax
; 	return addr | (PAGE_DIR_SPAN - 1);
ffff8000001111c7: 48 0d ff ff ff 3f    	orq	$1073741823, %rax       # imm = 0x3FFFFFFF
ffff8000001111cd: 5d                   	popq	%rbp
ffff8000001111ce: c3                   	retq
ffff8000001111cf: cc                   	int3

ffff8000001111d0 <lab2_do_check_ptbl_flags>:
; {
ffff8000001111d0: 55                   	pushq	%rbp
ffff8000001111d1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff8000001111d4: 48 8b 07             	movq	(%rdi), %rax
ffff8000001111d7: 89 c2                	movl	%eax, %edx
ffff8000001111d9: 81 e2 81 00 00 00    	andl	$129, %edx
ffff8000001111df: 83 fa 01             	cmpl	$1, %edx
ffff8000001111e2: 75 13                	jne	0xffff8000001111f7 <lab2_do_check_ptbl_flags+0x27>
ffff8000001111e4: 48 ba ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rdx # imm = 0xFFFF000000000FFF
ffff8000001111ee: 48 21 d0             	andq	%rdx, %rax
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff8000001111f1: 48 83 f8 07          	cmpq	$7, %rax
ffff8000001111f5: 75 04                	jne	0xffff8000001111fb <lab2_do_check_ptbl_flags+0x2b>
; }
ffff8000001111f7: 31 c0                	xorl	%eax, %eax
ffff8000001111f9: 5d                   	popq	%rbp
ffff8000001111fa: c3                   	retq
ffff8000001111fb: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p points to a page table with the wrong "
ffff8000001111fe: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111208: 48 ba 9f 47 11 00 00 80 ff ff	movabsq	$-140737487222881, %rdx # imm = 0xFFFF80000011479F
ffff800000111212: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000011121c: be 1b 00 00 00       	movl	$27, %esi
ffff800000111221: 31 c0                	xorl	%eax, %eax
ffff800000111223: 41 ff d0             	callq	*%r8
ffff800000111226: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111230 <lab2_check_ptbl_flags>:
; {
ffff800000111230: 55                   	pushq	%rbp
ffff800000111231: 48 89 e5             	movq	%rsp, %rbp
ffff800000111234: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000111238: 48 be 30 37 11 00 00 80 ff ff	movabsq	$-140737487227088, %rsi # imm = 0xFFFF800000113730
ffff800000111242: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000111246: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011124b: 48 89 c7             	movq	%rax, %rdi
ffff80000011124e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000111251: 48 b9 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rcx # imm = 0xFFFF8000001182F0
ffff80000011125b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011125e: 48 b9 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rcx # imm = 0xFFFF800000110E80
ffff800000111268: 48 89 c6             	movq	%rax, %rsi
ffff80000011126b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_ptbl_flags() succeeded!\n");
ffff80000011126d: 48 bf f5 3c 11 00 00 80 ff ff	movabsq	$-140737487225611, %rdi # imm = 0xFFFF800000113CF5
ffff800000111277: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111281: 31 c0                	xorl	%eax, %eax
ffff800000111283: ff d1                	callq	*%rcx
; }
ffff800000111285: 48 83 c4 50          	addq	$80, %rsp
ffff800000111289: 5d                   	popq	%rbp
ffff80000011128a: c3                   	retq
ffff80000011128b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111290 <lab2_check_pte_wx>:
; {
ffff800000111290: 55                   	pushq	%rbp
ffff800000111291: 48 89 e5             	movq	%rsp, %rbp
ffff800000111294: 48 b8 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rax # imm = 0x8000000000000003
; 	if (!(*entry & PAGE_PRESENT)) {
ffff80000011129e: 48 23 07             	andq	(%rdi), %rax
ffff8000001112a1: 48 83 f8 03          	cmpq	$3, %rax
ffff8000001112a5: 74 04                	je	0xffff8000001112ab <lab2_check_pte_wx+0x1b>
; }
ffff8000001112a7: 31 c0                	xorl	%eax, %eax
ffff8000001112a9: 5d                   	popq	%rbp
ffff8000001112aa: c3                   	retq
ffff8000001112ab: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff8000001112ae: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001112b8: 48 ba 12 39 11 00 00 80 ff ff	movabsq	$-140737487226606, %rdx # imm = 0xFFFF800000113912
ffff8000001112c2: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff8000001112cc: be 3c 00 00 00       	movl	$60, %esi
ffff8000001112d1: 31 c0                	xorl	%eax, %eax
ffff8000001112d3: 41 ff d0             	callq	*%r8
ffff8000001112d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001112e0 <lab2_check_pde_wx>:
; {
ffff8000001112e0: 55                   	pushq	%rbp
ffff8000001112e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001112e4: 48 b8 83 00 00 00 00 00 00 80	movabsq	$-9223372036854775677, %rax # imm = 0x8000000000000083
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001112ee: 48 23 07             	andq	(%rdi), %rax
ffff8000001112f1: 48 3d 83 00 00 00    	cmpq	$131, %rax
ffff8000001112f7: 74 04                	je	0xffff8000001112fd <lab2_check_pde_wx+0x1d>
; }
ffff8000001112f9: 31 c0                	xorl	%eax, %eax
ffff8000001112fb: 5d                   	popq	%rbp
ffff8000001112fc: c3                   	retq
ffff8000001112fd: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff800000111300: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011130a: 48 ba 12 39 11 00 00 80 ff ff	movabsq	$-140737487226606, %rdx # imm = 0xFFFF800000113912
ffff800000111314: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000011131e: be 50 00 00 00       	movl	$80, %esi
ffff800000111323: 31 c0                	xorl	%eax, %eax
ffff800000111325: 41 ff d0             	callq	*%r8
ffff800000111328: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111330 <lab2_check_wx>:
; {
ffff800000111330: 55                   	pushq	%rbp
ffff800000111331: 48 89 e5             	movq	%rsp, %rbp
ffff800000111334: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000111338: 48 be 80 37 11 00 00 80 ff ff	movabsq	$-140737487227008, %rsi # imm = 0xFFFF800000113780
ffff800000111342: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000111346: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011134b: 48 89 c7             	movq	%rax, %rdi
ffff80000011134e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000111351: 48 b9 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rcx # imm = 0xFFFF8000001182F0
ffff80000011135b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011135e: 48 b9 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rcx # imm = 0xFFFF800000110E80
ffff800000111368: 48 89 c6             	movq	%rax, %rsi
ffff80000011136b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_wx() succeeded!\n");
ffff80000011136d: 48 bf 09 44 11 00 00 80 ff ff	movabsq	$-140737487223799, %rdi # imm = 0xFFFF800000114409
ffff800000111377: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111381: 31 c0                	xorl	%eax, %eax
ffff800000111383: ff d1                	callq	*%rcx
; }
ffff800000111385: 48 83 c4 50          	addq	$80, %rsp
ffff800000111389: 5d                   	popq	%rbp
ffff80000011138a: c3                   	retq
ffff80000011138b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111390 <lab2_check_nx>:
; {
ffff800000111390: 55                   	pushq	%rbp
ffff800000111391: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(read_msr(MSR_EFER) & MSR_EFER_NXE)) {
ffff800000111394: 48 b8 f0 13 11 00 00 80 ff ff	movabsq	$-140737487236112, %rax # imm = 0xFFFF8000001113F0
ffff80000011139e: ff d0                	callq	*%rax
ffff8000001113a0: a9 00 08 00 00       	testl	$2048, %eax             # imm = 0x800
ffff8000001113a5: 74 1a                	je	0xffff8000001113c1 <lab2_check_nx+0x31>
; 	cprintf("[LAB 2] check_nx() succeeded!\n");
ffff8000001113a7: 48 bf 1c 3d 11 00 00 80 ff ff	movabsq	$-140737487225572, %rdi # imm = 0xFFFF800000113D1C
ffff8000001113b1: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001113bb: 31 c0                	xorl	%eax, %eax
ffff8000001113bd: ff d1                	callq	*%rcx
; }
ffff8000001113bf: 5d                   	popq	%rbp
ffff8000001113c0: c3                   	retq
; 		panic("No eXecute bit is disabled!");
ffff8000001113c1: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001113cb: 48 ba 5b 3a 11 00 00 80 ff ff	movabsq	$-140737487226277, %rdx # imm = 0xFFFF800000113A5B
ffff8000001113d5: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff8000001113df: be 65 00 00 00       	movl	$101, %esi
ffff8000001113e4: 31 c0                	xorl	%eax, %eax
ffff8000001113e6: ff d1                	callq	*%rcx
ffff8000001113e8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001113f0 <read_msr>:
; {
ffff8000001113f0: 55                   	pushq	%rbp
ffff8000001113f1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff8000001113f4: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff8000001113f9: 0f 32                	rdmsr
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff8000001113fb: 48 c1 e2 20          	shlq	$32, %rdx
ffff8000001113ff: 89 c0                	movl	%eax, %eax
ffff800000111401: 48 09 d0             	orq	%rdx, %rax
ffff800000111404: 5d                   	popq	%rbp
ffff800000111405: c3                   	retq
ffff800000111406: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111410 <lab2_check_pte_vas>:
; {
ffff800000111410: 55                   	pushq	%rbp
ffff800000111411: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000111414: f6 07 01             	testb	$1, (%rdi)
ffff800000111417: 74 4c                	je	0xffff800000111465 <lab2_check_pte_vas+0x55>
ffff800000111419: 49 89 d0             	movq	%rdx, %r8
ffff80000011141c: 48 89 f1             	movq	%rsi, %rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011141f: 48 89 f0             	movq	%rsi, %rax
ffff800000111422: 48 c1 e8 2f          	shrq	$47, %rax
ffff800000111426: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff80000011142b: 0f 93 c0             	setae	%al
ffff80000011142e: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000111432: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff800000111438: 0f 92 c2             	setb	%dl
ffff80000011143b: 48 c1 ee 27          	shrq	$39, %rsi
ffff80000011143f: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000111445: 77 1e                	ja	0xffff800000111465 <lab2_check_pte_vas+0x55>
ffff800000111447: 20 d0                	andb	%dl, %al
ffff800000111449: 75 1a                	jne	0xffff800000111465 <lab2_check_pte_vas+0x55>
ffff80000011144b: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000111455: 48 39 c1             	cmpq	%rax, %rcx
ffff800000111458: 76 0f                	jbe	0xffff800000111469 <lab2_check_pte_vas+0x59>
ffff80000011145a: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000111460: 49 39 c0             	cmpq	%rax, %r8
ffff800000111463: 73 04                	jae	0xffff800000111469 <lab2_check_pte_vas+0x59>
; }
ffff800000111465: 31 c0                	xorl	%eax, %eax
ffff800000111467: 5d                   	popq	%rbp
ffff800000111468: c3                   	retq
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff800000111469: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111473: 48 ba c4 40 11 00 00 80 ff ff	movabsq	$-140737487224636, %rdx # imm = 0xFFFF8000001140C4
ffff80000011147d: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff800000111487: be 81 00 00 00       	movl	$129, %esi
ffff80000011148c: 31 c0                	xorl	%eax, %eax
ffff80000011148e: 41 ff d1             	callq	*%r9
ffff800000111491: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011149b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001114a0 <lab2_check_pde_vas>:
; {
ffff8000001114a0: 55                   	pushq	%rbp
ffff8000001114a1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001114a4: 8b 07                	movl	(%rdi), %eax
ffff8000001114a6: f7 d0                	notl	%eax
ffff8000001114a8: a8 81                	testb	$-127, %al
ffff8000001114aa: 75 0c                	jne	0xffff8000001114b8 <lab2_check_pde_vas+0x18>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff8000001114ac: 48 b8 10 14 11 00 00 80 ff ff	movabsq	$-140737487236080, %rax # imm = 0xFFFF800000111410
ffff8000001114b6: ff d0                	callq	*%rax
; }
ffff8000001114b8: 31 c0                	xorl	%eax, %eax
ffff8000001114ba: 5d                   	popq	%rbp
ffff8000001114bb: c3                   	retq
ffff8000001114bc: 0f 1f 40 00          	nopl	(%rax)

ffff8000001114c0 <lab2_check_vas>:
; {
ffff8000001114c0: 55                   	pushq	%rbp
ffff8000001114c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001114c4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001114c8: 48 be d0 37 11 00 00 80 ff ff	movabsq	$-140737487226928, %rsi # imm = 0xFFFF8000001137D0
ffff8000001114d2: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff8000001114d6: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001114db: 48 89 c7             	movq	%rax, %rdi
ffff8000001114de: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001114e1: 48 b9 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rcx # imm = 0xFFFF8000001182F0
ffff8000001114eb: 48 8b 39             	movq	(%rcx), %rdi
ffff8000001114ee: 48 b9 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rcx # imm = 0xFFFF800000110E80
ffff8000001114f8: 48 89 c6             	movq	%rax, %rsi
ffff8000001114fb: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas() succeeded!\n");
ffff8000001114fd: 48 bf 4d 39 11 00 00 80 ff ff	movabsq	$-140737487226547, %rdi # imm = 0xFFFF80000011394D
ffff800000111507: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111511: 31 c0                	xorl	%eax, %eax
ffff800000111513: ff d1                	callq	*%rcx
; }
ffff800000111515: 48 83 c4 50          	addq	$80, %rsp
ffff800000111519: 5d                   	popq	%rbp
ffff80000011151a: c3                   	retq
ffff80000011151b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111520 <need_mapping>:
; int need_mapping(uintptr_t base, uintptr_t end){
ffff800000111520: 55                   	pushq	%rbp
ffff800000111521: 48 89 e5             	movq	%rsp, %rbp
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff800000111524: 48 89 f8             	movq	%rdi, %rax
ffff800000111527: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000011152b: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff800000111530: 72 2c                	jb	0xffff80000011155e <need_mapping+0x3e>
ffff800000111532: 48 b8 ff ff ff ff ff 7f ff ff	movabsq	$-140737488355329, %rax # imm = 0xFFFF7FFFFFFFFFFF
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff80000011153c: 48 b9 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rcx # imm = 0xFFFF8000001182E0
ffff800000111546: 48 8b 09             	movq	(%rcx), %rcx
ffff800000111549: 48 c1 e1 0c          	shlq	$12, %rcx
ffff80000011154d: 48 01 c1             	addq	%rax, %rcx
ffff800000111550: 48 83 c1 01          	addq	$1, %rcx
ffff800000111554: b8 01 00 00 00       	movl	$1, %eax
ffff800000111559: 48 39 f1             	cmpq	%rsi, %rcx
ffff80000011155c: 77 65                	ja	0xffff8000001115c3 <need_mapping+0xa3>
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff80000011155e: 48 89 f8             	movq	%rdi, %rax
ffff800000111561: 48 c1 e8 27          	shrq	$39, %rax
ffff800000111565: 3d ff ff ff 01       	cmpl	$33554431, %eax         # imm = 0x1FFFFFF
ffff80000011156a: 72 36                	jb	0xffff8000001115a2 <need_mapping+0x82>
ffff80000011156c: 48 b8 ff ff ff ff 7f ff ff ff	movabsq	$-549755813889, %rax # imm = 0xFFFFFF7FFFFFFFFF
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff800000111576: 48 b9 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rcx # imm = 0xFFFF8000001182E0
ffff800000111580: 48 8b 09             	movq	(%rcx), %rcx
ffff800000111583: 48 c1 e1 05          	shlq	$5, %rcx
ffff800000111587: 48 01 c1             	addq	%rax, %rcx
ffff80000011158a: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff800000111591: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff800000111598: b8 01 00 00 00       	movl	$1, %eax
ffff80000011159d: 48 39 f1             	cmpq	%rsi, %rcx
ffff8000001115a0: 77 21                	ja	0xffff8000001115c3 <need_mapping+0xa3>
ffff8000001115a2: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001115ac: 48 39 c7             	cmpq	%rax, %rdi
ffff8000001115af: 0f 97 c1             	seta	%cl
ffff8000001115b2: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
ffff8000001115b8: 48 39 c6             	cmpq	%rax, %rsi
ffff8000001115bb: 0f 92 c0             	setb	%al
ffff8000001115be: 20 c8                	andb	%cl, %al
ffff8000001115c0: 0f b6 c0             	movzbl	%al, %eax
; }
ffff8000001115c3: 5d                   	popq	%rbp
ffff8000001115c4: c3                   	retq
ffff8000001115c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001115cf: 90                   	nop

ffff8000001115d0 <lab2_check_pte_vas_ext>:
; {
ffff8000001115d0: 55                   	pushq	%rbp
ffff8000001115d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001115d4: 49 89 d0             	movq	%rdx, %r8
ffff8000001115d7: 48 89 f0             	movq	%rsi, %rax
; 	if ((end - base) != 0xfff) {
ffff8000001115da: 48 89 d1             	movq	%rdx, %rcx
ffff8000001115dd: 48 29 f1             	subq	%rsi, %rcx
ffff8000001115e0: 48 81 f9 ff 0f 00 00 	cmpq	$4095, %rcx             # imm = 0xFFF
ffff8000001115e7: 0f 85 94 00 00 00    	jne	0xffff800000111681 <lab2_check_pte_vas_ext+0xb1>
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001115ed: f6 07 01             	testb	$1, (%rdi)
ffff8000001115f0: 75 3d                	jne	0xffff80000011162f <lab2_check_pte_vas_ext+0x5f>
;                 if (need_mapping(base, end)){
ffff8000001115f2: 48 b9 20 15 11 00 00 80 ff ff	movabsq	$-140737487235808, %rcx # imm = 0xFFFF800000111520
ffff8000001115fc: 48 89 c7             	movq	%rax, %rdi
ffff8000001115ff: 4c 89 c6             	movq	%r8, %rsi
ffff800000111602: ff d1                	callq	*%rcx
ffff800000111604: 85 c0                	testl	%eax, %eax
ffff800000111606: 74 75                	je	0xffff80000011167d <lab2_check_pte_vas_ext+0xad>
;                     panic("All backing pages for the budy, page_info structs and kernel stack must be mapped\n");
ffff800000111608: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111612: 48 ba 87 3f 11 00 00 80 ff ff	movabsq	$-140737487224953, %rdx # imm = 0xFFFF800000113F87
ffff80000011161c: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000111626: be ba 00 00 00       	movl	$186, %esi
ffff80000011162b: 31 c0                	xorl	%eax, %eax
ffff80000011162d: ff d1                	callq	*%rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011162f: 48 89 c1             	movq	%rax, %rcx
ffff800000111632: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000111636: 81 f9 ff ff 01 00    	cmpl	$131071, %ecx           # imm = 0x1FFFF
ffff80000011163c: 0f 93 c1             	setae	%cl
ffff80000011163f: 4c 89 c2             	movq	%r8, %rdx
ffff800000111642: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000111646: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff80000011164c: 0f 92 c2             	setb	%dl
ffff80000011164f: 48 89 c6             	movq	%rax, %rsi
ffff800000111652: 48 c1 ee 27          	shrq	$39, %rsi
ffff800000111656: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011165c: 77 1f                	ja	0xffff80000011167d <lab2_check_pte_vas_ext+0xad>
ffff80000011165e: 20 d1                	andb	%dl, %cl
ffff800000111660: 75 1b                	jne	0xffff80000011167d <lab2_check_pte_vas_ext+0xad>
ffff800000111662: 48 b9 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rcx # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011166c: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011166f: 76 3e                	jbe	0xffff8000001116af <lab2_check_pte_vas_ext+0xdf>
ffff800000111671: 48 81 c1 01 80 00 00 	addq	$32769, %rcx            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000111678: 49 39 c8             	cmpq	%rcx, %r8
ffff80000011167b: 73 32                	jae	0xffff8000001116af <lab2_check_pte_vas_ext+0xdf>
; }
ffff80000011167d: 31 c0                	xorl	%eax, %eax
ffff80000011167f: 5d                   	popq	%rbp
ffff800000111680: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be 4kb - 1  bytes\n", end, base);
ffff800000111681: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011168b: 48 ba 05 45 11 00 00 80 ff ff	movabsq	$-140737487223547, %rdx # imm = 0xFFFF800000114505
ffff800000111695: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff80000011169f: be b4 00 00 00       	movl	$180, %esi
ffff8000001116a4: 4c 89 c1             	movq	%r8, %rcx
ffff8000001116a7: 49 89 c0             	movq	%rax, %r8
ffff8000001116aa: 31 c0                	xorl	%eax, %eax
ffff8000001116ac: 41 ff d1             	callq	*%r9
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff8000001116af: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001116b9: 48 ba c4 40 11 00 00 80 ff ff	movabsq	$-140737487224636, %rdx # imm = 0xFFFF8000001140C4
ffff8000001116c3: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff8000001116cd: be cd 00 00 00       	movl	$205, %esi
ffff8000001116d2: 48 89 c1             	movq	%rax, %rcx
ffff8000001116d5: 31 c0                	xorl	%eax, %eax
ffff8000001116d7: 41 ff d1             	callq	*%r9
ffff8000001116da: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001116e0 <lab2_check_pde_vas_ext>:
; {
ffff8000001116e0: 55                   	pushq	%rbp
ffff8000001116e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001116e4: 48 89 d1             	movq	%rdx, %rcx
ffff8000001116e7: 49 89 f0             	movq	%rsi, %r8
; 	if ((end - base) != 0x1FFFFF) {
ffff8000001116ea: 48 89 d0             	movq	%rdx, %rax
ffff8000001116ed: 48 29 f0             	subq	%rsi, %rax
ffff8000001116f0: 48 3d ff ff 1f 00    	cmpq	$2097151, %rax          # imm = 0x1FFFFF
ffff8000001116f6: 75 1e                	jne	0xffff800000111716 <lab2_check_pde_vas_ext+0x36>
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001116f8: 8b 07                	movl	(%rdi), %eax
ffff8000001116fa: f7 d0                	notl	%eax
ffff8000001116fc: a8 81                	testb	$-127, %al
ffff8000001116fe: 75 12                	jne	0xffff800000111712 <lab2_check_pde_vas_ext+0x32>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff800000111700: 48 b8 10 14 11 00 00 80 ff ff	movabsq	$-140737487236080, %rax # imm = 0xFFFF800000111410
ffff80000011170a: 4c 89 c6             	movq	%r8, %rsi
ffff80000011170d: 48 89 ca             	movq	%rcx, %rdx
ffff800000111710: ff d0                	callq	*%rax
; }
ffff800000111712: 31 c0                	xorl	%eax, %eax
ffff800000111714: 5d                   	popq	%rbp
ffff800000111715: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be a 2m page - 1\n", end, base);
ffff800000111716: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111720: 48 ba 90 46 11 00 00 80 ff ff	movabsq	$-140737487223152, %rdx # imm = 0xFFFF800000114690
ffff80000011172a: 49 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r9 # imm = 0xFFFF80000010C870
ffff800000111734: be d7 00 00 00       	movl	$215, %esi
ffff800000111739: 31 c0                	xorl	%eax, %eax
ffff80000011173b: 41 ff d1             	callq	*%r9
ffff80000011173e: 66 90                	nop

ffff800000111740 <lab2_check_vas_ext>:
; {
ffff800000111740: 55                   	pushq	%rbp
ffff800000111741: 48 89 e5             	movq	%rsp, %rbp
ffff800000111744: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000111748: 48 be 20 38 11 00 00 80 ff ff	movabsq	$-140737487226848, %rsi # imm = 0xFFFF800000113820
ffff800000111752: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000111756: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011175b: 48 89 c7             	movq	%rax, %rdi
ffff80000011175e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000111761: 48 b9 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rcx # imm = 0xFFFF8000001182F0
ffff80000011176b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011176e: 48 b9 80 0e 11 00 00 80 ff ff	movabsq	$-140737487237504, %rcx # imm = 0xFFFF800000110E80
ffff800000111778: 48 89 c6             	movq	%rax, %rsi
ffff80000011177b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas_ext() succeeded!\n");
ffff80000011177d: 48 bf 77 3a 11 00 00 80 ff ff	movabsq	$-140737487226249, %rdi # imm = 0xFFFF800000113A77
ffff800000111787: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111791: 31 c0                	xorl	%eax, %eax
ffff800000111793: ff d1                	callq	*%rcx
; }
ffff800000111795: 48 83 c4 50          	addq	$80, %rsp
ffff800000111799: 5d                   	popq	%rbp
ffff80000011179a: c3                   	retq
ffff80000011179b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001117a0 <lab2_check_4k_paging>:
; {
ffff8000001117a0: 55                   	pushq	%rbp
ffff8000001117a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001117a4: 41 57                	pushq	%r15
ffff8000001117a6: 41 56                	pushq	%r14
ffff8000001117a8: 41 55                	pushq	%r13
ffff8000001117aa: 41 54                	pushq	%r12
ffff8000001117ac: 53                   	pushq	%rbx
ffff8000001117ad: 50                   	pushq	%rax
; 	nfree = count_total_free_pages();
ffff8000001117ae: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff8000001117b8: ff d0                	callq	*%rax
ffff8000001117ba: 49 89 c4             	movq	%rax, %r12
; 	page = page_alloc(0);
ffff8000001117bd: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff8000001117c7: 31 ff                	xorl	%edi, %edi
ffff8000001117c9: ff d0                	callq	*%rax
; 	if (!page) {
ffff8000001117cb: 48 85 c0             	testq	%rax, %rax
ffff8000001117ce: 0f 84 36 01 00 00    	je	0xffff80000011190a <lab2_check_4k_paging+0x16a>
ffff8000001117d4: 48 89 c3             	movq	%rax, %rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001117d7: 49 bd f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r13 # imm = 0xFFFF8000001182F0
ffff8000001117e1: 49 8b 7d 00          	movq	(%r13), %rdi
ffff8000001117e5: 48 b8 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rax # imm = 0xFFFF800000110760
ffff8000001117ef: b9 01 00 00 00       	movl	$1, %ecx
ffff8000001117f4: 48 89 de             	movq	%rbx, %rsi
ffff8000001117f7: 31 d2                	xorl	%edx, %edx
ffff8000001117f9: ff d0                	callq	*%rax
ffff8000001117fb: 85 c0                	testl	%eax, %eax
ffff8000001117fd: 0f 85 2e 01 00 00    	jne	0xffff800000111931 <lab2_check_4k_paging+0x191>
; 	assert(page->pp_ref == 1);
ffff800000111803: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff800000111808: 0f 85 54 01 00 00    	jne	0xffff800000111962 <lab2_check_4k_paging+0x1c2>
; 	assert(!page->pp_free);
ffff80000011180e: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000111812: 0f 88 7b 01 00 00    	js	0xffff800000111993 <lab2_check_4k_paging+0x1f3>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000111818: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011181c: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000111820: 0f 84 9e 01 00 00    	je	0xffff8000001119c4 <lab2_check_4k_paging+0x224>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000111826: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000111830: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000111834: 31 f6                	xorl	%esi, %esi
ffff800000111836: ff d0                	callq	*%rax
ffff800000111838: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff80000011183b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011183f: 4c 8b 30             	movq	(%rax), %r14
ffff800000111842: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011184c: 4c 21 f0             	andq	%r14, %rax
ffff80000011184f: 48 83 f8 01          	cmpq	$1, %rax
ffff800000111853: 0f 85 9c 01 00 00    	jne	0xffff8000001119f5 <lab2_check_4k_paging+0x255>
ffff800000111859: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000111863: 49 21 c6             	andq	%rax, %r14
ffff800000111866: 48 b8 50 1b 11 00 00 80 ff ff	movabsq	$-140737487234224, %rax # imm = 0xFFFF800000111B50
ffff800000111870: 48 89 df             	movq	%rbx, %rdi
ffff800000111873: ff d0                	callq	*%rax
ffff800000111875: 49 39 c6             	cmpq	%rax, %r14
ffff800000111878: 0f 85 a8 01 00 00    	jne	0xffff800000111a26 <lab2_check_4k_paging+0x286>
; 	assert(ret == page);
ffff80000011187e: 49 39 df             	cmpq	%rbx, %r15
ffff800000111881: 0f 85 d0 01 00 00    	jne	0xffff800000111a57 <lab2_check_4k_paging+0x2b7>
; 	page_remove(kernel_pml4, 0);
ffff800000111887: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011188b: 48 b8 d0 0c 11 00 00 80 ff ff	movabsq	$-140737487237936, %rax # imm = 0xFFFF800000110CD0
ffff800000111895: 31 f6                	xorl	%esi, %esi
ffff800000111897: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000111899: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000011189d: 0f 89 e5 01 00 00    	jns	0xffff800000111a88 <lab2_check_4k_paging+0x2e8>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff8000001118a3: 49 8b 7d 00          	movq	(%r13), %rdi
ffff8000001118a7: 31 f6                	xorl	%esi, %esi
ffff8000001118a9: 31 d2                	xorl	%edx, %edx
ffff8000001118ab: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff8000001118b5: ff d0                	callq	*%rax
ffff8000001118b7: 48 85 c0             	testq	%rax, %rax
ffff8000001118ba: 0f 85 f9 01 00 00    	jne	0xffff800000111ab9 <lab2_check_4k_paging+0x319>
; 	assert(kernel_pml4->entries[0] == 0);
ffff8000001118c0: 49 8b 45 00          	movq	(%r13), %rax
ffff8000001118c4: 48 83 38 00          	cmpq	$0, (%rax)
ffff8000001118c8: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff8000001118d2: 0f 85 12 02 00 00    	jne	0xffff800000111aea <lab2_check_4k_paging+0x34a>
; 	assert(nfree == count_total_free_pages());
ffff8000001118d8: ff d0                	callq	*%rax
ffff8000001118da: 49 39 c4             	cmpq	%rax, %r12
ffff8000001118dd: 0f 85 38 02 00 00    	jne	0xffff800000111b1b <lab2_check_4k_paging+0x37b>
; 	cprintf("[LAB 2] check_4k_paging() succeeded!\n");
ffff8000001118e3: 48 bf 6d 39 11 00 00 80 ff ff	movabsq	$-140737487226515, %rdi # imm = 0xFFFF80000011396D
ffff8000001118ed: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001118f7: 31 c0                	xorl	%eax, %eax
ffff8000001118f9: ff d1                	callq	*%rcx
; }
ffff8000001118fb: 48 83 c4 08          	addq	$8, %rsp
ffff8000001118ff: 5b                   	popq	%rbx
ffff800000111900: 41 5c                	popq	%r12
ffff800000111902: 41 5d                	popq	%r13
ffff800000111904: 41 5e                	popq	%r14
ffff800000111906: 41 5f                	popq	%r15
ffff800000111908: 5d                   	popq	%rbp
ffff800000111909: c3                   	retq
; 		panic("cannot allocate 4K page!");
ffff80000011190a: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111914: 48 ba 38 45 11 00 00 80 ff ff	movabsq	$-140737487223496, %rdx # imm = 0xFFFF800000114538
ffff80000011191e: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000111928: be fa 00 00 00       	movl	$250, %esi
ffff80000011192d: 31 c0                	xorl	%eax, %eax
ffff80000011192f: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000111931: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011193b: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111945: 48 b9 bb 42 11 00 00 80 ff ff	movabsq	$-140737487224133, %rcx # imm = 0xFFFF8000001142BB
ffff80000011194f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111959: be fe 00 00 00       	movl	$254, %esi
ffff80000011195e: 31 c0                	xorl	%eax, %eax
ffff800000111960: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff800000111962: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011196c: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111976: 48 b9 7f 48 11 00 00 80 ff ff	movabsq	$-140737487222657, %rcx # imm = 0xFFFF80000011487F
ffff800000111980: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011198a: be ff 00 00 00       	movl	$255, %esi
ffff80000011198f: 31 c0                	xorl	%eax, %eax
ffff800000111991: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff800000111993: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011199d: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001119a7: 48 b9 35 39 11 00 00 80 ff ff	movabsq	$-140737487226571, %rcx # imm = 0xFFFF800000113935
ffff8000001119b1: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001119bb: be 00 01 00 00       	movl	$256, %esi              # imm = 0x100
ffff8000001119c0: 31 c0                	xorl	%eax, %eax
ffff8000001119c2: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff8000001119c4: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001119ce: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001119d8: 48 b9 88 3b 11 00 00 80 ff ff	movabsq	$-140737487225976, %rcx # imm = 0xFFFF800000113B88
ffff8000001119e2: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001119ec: be 01 01 00 00       	movl	$257, %esi              # imm = 0x101
ffff8000001119f1: 31 c0                	xorl	%eax, %eax
ffff8000001119f3: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff8000001119f5: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001119ff: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111a09: 48 b9 5e 46 11 00 00 80 ff ff	movabsq	$-140737487223202, %rcx # imm = 0xFFFF80000011465E
ffff800000111a13: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111a1d: be 05 01 00 00       	movl	$261, %esi              # imm = 0x105
ffff800000111a22: 31 c0                	xorl	%eax, %eax
ffff800000111a24: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000111a26: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111a30: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111a3a: 48 b9 da 3f 11 00 00 80 ff ff	movabsq	$-140737487224870, %rcx # imm = 0xFFFF800000113FDA
ffff800000111a44: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111a4e: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff800000111a53: 31 c0                	xorl	%eax, %eax
ffff800000111a55: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000111a57: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111a61: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111a6b: 48 b9 86 43 11 00 00 80 ff ff	movabsq	$-140737487223930, %rcx # imm = 0xFFFF800000114386
ffff800000111a75: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111a7f: be 07 01 00 00       	movl	$263, %esi              # imm = 0x107
ffff800000111a84: 31 c0                	xorl	%eax, %eax
ffff800000111a86: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000111a88: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111a92: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111a9c: 48 b9 9f 41 11 00 00 80 ff ff	movabsq	$-140737487224417, %rcx # imm = 0xFFFF80000011419F
ffff800000111aa6: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111ab0: be 0b 01 00 00       	movl	$267, %esi              # imm = 0x10B
ffff800000111ab5: 31 c0                	xorl	%eax, %eax
ffff800000111ab7: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000111ab9: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111ac3: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111acd: 48 b9 f0 3d 11 00 00 80 ff ff	movabsq	$-140737487225360, %rcx # imm = 0xFFFF800000113DF0
ffff800000111ad7: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111ae1: be 0c 01 00 00       	movl	$268, %esi              # imm = 0x10C
ffff800000111ae6: 31 c0                	xorl	%eax, %eax
ffff800000111ae8: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000111aea: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111af4: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111afe: 48 b9 51 40 11 00 00 80 ff ff	movabsq	$-140737487224751, %rcx # imm = 0xFFFF800000114051
ffff800000111b08: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111b12: be 0f 01 00 00       	movl	$271, %esi              # imm = 0x10F
ffff800000111b17: 31 c0                	xorl	%eax, %eax
ffff800000111b19: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff800000111b1b: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111b25: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111b2f: 48 b9 03 3f 11 00 00 80 ff ff	movabsq	$-140737487225085, %rcx # imm = 0xFFFF800000113F03
ffff800000111b39: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111b43: be 12 01 00 00       	movl	$274, %esi              # imm = 0x112
ffff800000111b48: 31 c0                	xorl	%eax, %eax
ffff800000111b4a: ff d3                	callq	*%rbx
ffff800000111b4c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111b50 <page2pa>:
; {
ffff800000111b50: 55                   	pushq	%rbp
ffff800000111b51: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b54: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000111b57: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
ffff800000111b61: 48 2b 01             	subq	(%rcx), %rax
ffff800000111b64: 48 c1 e0 07          	shlq	$7, %rax
ffff800000111b68: 5d                   	popq	%rbp
ffff800000111b69: c3                   	retq
ffff800000111b6a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111b70 <lab2_check_2m_paging>:
; {
ffff800000111b70: 55                   	pushq	%rbp
ffff800000111b71: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b74: 41 57                	pushq	%r15
ffff800000111b76: 41 56                	pushq	%r14
ffff800000111b78: 41 55                	pushq	%r13
ffff800000111b7a: 41 54                	pushq	%r12
ffff800000111b7c: 53                   	pushq	%rbx
ffff800000111b7d: 50                   	pushq	%rax
; 	nfree = count_total_free_pages();
ffff800000111b7e: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000111b88: ff d0                	callq	*%rax
ffff800000111b8a: 49 89 c4             	movq	%rax, %r12
; 	page = page_alloc(ALLOC_HUGE);
ffff800000111b8d: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000111b97: bf 02 00 00 00       	movl	$2, %edi
ffff800000111b9c: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000111b9e: 48 85 c0             	testq	%rax, %rax
ffff800000111ba1: 0f 84 55 01 00 00    	je	0xffff800000111cfc <lab2_check_2m_paging+0x18c>
ffff800000111ba7: 48 89 c3             	movq	%rax, %rbx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000111baa: 49 bd f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r13 # imm = 0xFFFF8000001182F0
ffff800000111bb4: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000111bb8: 49 bf 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %r15 # imm = 0xFFFF800000110760
ffff800000111bc2: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000111bc7: b9 01 00 00 00       	movl	$1, %ecx
ffff800000111bcc: 48 89 c6             	movq	%rax, %rsi
ffff800000111bcf: 41 ff d7             	callq	*%r15
ffff800000111bd2: 85 c0                	testl	%eax, %eax
ffff800000111bd4: 0f 84 49 01 00 00    	je	0xffff800000111d23 <lab2_check_2m_paging+0x1b3>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000111bda: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000111bde: b9 01 00 00 00       	movl	$1, %ecx
ffff800000111be3: 48 89 de             	movq	%rbx, %rsi
ffff800000111be6: 31 d2                	xorl	%edx, %edx
ffff800000111be8: 41 ff d7             	callq	*%r15
ffff800000111beb: 85 c0                	testl	%eax, %eax
ffff800000111bed: 0f 85 61 01 00 00    	jne	0xffff800000111d54 <lab2_check_2m_paging+0x1e4>
; 	assert(page->pp_ref == 1);
ffff800000111bf3: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff800000111bf8: 0f 85 87 01 00 00    	jne	0xffff800000111d85 <lab2_check_2m_paging+0x215>
; 	assert(!page->pp_free);
ffff800000111bfe: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000111c02: 0f 88 ae 01 00 00    	js	0xffff800000111db6 <lab2_check_2m_paging+0x246>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000111c08: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000111c0c: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000111c10: 0f 84 d1 01 00 00    	je	0xffff800000111de7 <lab2_check_2m_paging+0x277>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000111c16: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000111c20: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000111c24: 31 f6                	xorl	%esi, %esi
ffff800000111c26: ff d0                	callq	*%rax
ffff800000111c28: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000111c2b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000111c2f: 4c 8b 30             	movq	(%rax), %r14
ffff800000111c32: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000111c3c: 4c 21 f0             	andq	%r14, %rax
ffff800000111c3f: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000111c45: 0f 85 cd 01 00 00    	jne	0xffff800000111e18 <lab2_check_2m_paging+0x2a8>
ffff800000111c4b: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000111c55: 49 21 c6             	andq	%rax, %r14
ffff800000111c58: 48 b8 50 1b 11 00 00 80 ff ff	movabsq	$-140737487234224, %rax # imm = 0xFFFF800000111B50
ffff800000111c62: 48 89 df             	movq	%rbx, %rdi
ffff800000111c65: ff d0                	callq	*%rax
ffff800000111c67: 49 39 c6             	cmpq	%rax, %r14
ffff800000111c6a: 0f 85 d9 01 00 00    	jne	0xffff800000111e49 <lab2_check_2m_paging+0x2d9>
; 	assert(ret == page);
ffff800000111c70: 49 39 df             	cmpq	%rbx, %r15
ffff800000111c73: 0f 85 01 02 00 00    	jne	0xffff800000111e7a <lab2_check_2m_paging+0x30a>
; 	page_remove(kernel_pml4, 0);
ffff800000111c79: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000111c7d: 48 b8 d0 0c 11 00 00 80 ff ff	movabsq	$-140737487237936, %rax # imm = 0xFFFF800000110CD0
ffff800000111c87: 31 f6                	xorl	%esi, %esi
ffff800000111c89: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000111c8b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000111c8f: 0f 89 16 02 00 00    	jns	0xffff800000111eab <lab2_check_2m_paging+0x33b>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000111c95: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000111c99: 31 f6                	xorl	%esi, %esi
ffff800000111c9b: 31 d2                	xorl	%edx, %edx
ffff800000111c9d: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000111ca7: ff d0                	callq	*%rax
ffff800000111ca9: 48 85 c0             	testq	%rax, %rax
ffff800000111cac: 0f 85 2a 02 00 00    	jne	0xffff800000111edc <lab2_check_2m_paging+0x36c>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000111cb2: 49 8b 45 00          	movq	(%r13), %rax
ffff800000111cb6: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000111cba: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000111cc4: 0f 85 43 02 00 00    	jne	0xffff800000111f0d <lab2_check_2m_paging+0x39d>
; 	assert(nfree == count_total_free_pages());
ffff800000111cca: ff d0                	callq	*%rax
ffff800000111ccc: 49 39 c4             	cmpq	%rax, %r12
ffff800000111ccf: 0f 85 69 02 00 00    	jne	0xffff800000111f3e <lab2_check_2m_paging+0x3ce>
; 	cprintf("[LAB 2] check_2m_paging() succeeded!\n");
ffff800000111cd5: 48 bf f0 42 11 00 00 80 ff ff	movabsq	$-140737487224080, %rdi # imm = 0xFFFF8000001142F0
ffff800000111cdf: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000111ce9: 31 c0                	xorl	%eax, %eax
ffff800000111ceb: ff d1                	callq	*%rcx
; }
ffff800000111ced: 48 83 c4 08          	addq	$8, %rsp
ffff800000111cf1: 5b                   	popq	%rbx
ffff800000111cf2: 41 5c                	popq	%r12
ffff800000111cf4: 41 5d                	popq	%r13
ffff800000111cf6: 41 5e                	popq	%r14
ffff800000111cf8: 41 5f                	popq	%r15
ffff800000111cfa: 5d                   	popq	%rbp
ffff800000111cfb: c3                   	retq
; 		panic("cannot allocate 2M page!");
ffff800000111cfc: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111d06: 48 ba 5c 42 11 00 00 80 ff ff	movabsq	$-140737487224228, %rdx # imm = 0xFFFF80000011425C
ffff800000111d10: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000111d1a: be 24 01 00 00       	movl	$292, %esi              # imm = 0x124
ffff800000111d1f: 31 c0                	xorl	%eax, %eax
ffff800000111d21: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000111d23: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111d2d: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111d37: 48 b9 0a 3c 11 00 00 80 ff ff	movabsq	$-140737487225846, %rcx # imm = 0xFFFF800000113C0A
ffff800000111d41: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111d4b: be 28 01 00 00       	movl	$296, %esi              # imm = 0x128
ffff800000111d50: 31 c0                	xorl	%eax, %eax
ffff800000111d52: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000111d54: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111d5e: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111d68: 48 b9 bb 42 11 00 00 80 ff ff	movabsq	$-140737487224133, %rcx # imm = 0xFFFF8000001142BB
ffff800000111d72: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111d7c: be 2b 01 00 00       	movl	$299, %esi              # imm = 0x12B
ffff800000111d81: 31 c0                	xorl	%eax, %eax
ffff800000111d83: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff800000111d85: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111d8f: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111d99: 48 b9 7f 48 11 00 00 80 ff ff	movabsq	$-140737487222657, %rcx # imm = 0xFFFF80000011487F
ffff800000111da3: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111dad: be 2c 01 00 00       	movl	$300, %esi              # imm = 0x12C
ffff800000111db2: 31 c0                	xorl	%eax, %eax
ffff800000111db4: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff800000111db6: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111dc0: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111dca: 48 b9 35 39 11 00 00 80 ff ff	movabsq	$-140737487226571, %rcx # imm = 0xFFFF800000113935
ffff800000111dd4: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111dde: be 2d 01 00 00       	movl	$301, %esi              # imm = 0x12D
ffff800000111de3: 31 c0                	xorl	%eax, %eax
ffff800000111de5: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000111de7: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111df1: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111dfb: 48 b9 88 3b 11 00 00 80 ff ff	movabsq	$-140737487225976, %rcx # imm = 0xFFFF800000113B88
ffff800000111e05: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111e0f: be 2e 01 00 00       	movl	$302, %esi              # imm = 0x12E
ffff800000111e14: 31 c0                	xorl	%eax, %eax
ffff800000111e16: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000111e18: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111e22: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111e2c: 48 b9 14 48 11 00 00 80 ff ff	movabsq	$-140737487222764, %rcx # imm = 0xFFFF800000114814
ffff800000111e36: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111e40: be 32 01 00 00       	movl	$306, %esi              # imm = 0x132
ffff800000111e45: 31 c0                	xorl	%eax, %eax
ffff800000111e47: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000111e49: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111e53: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111e5d: 48 b9 da 3f 11 00 00 80 ff ff	movabsq	$-140737487224870, %rcx # imm = 0xFFFF800000113FDA
ffff800000111e67: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111e71: be 33 01 00 00       	movl	$307, %esi              # imm = 0x133
ffff800000111e76: 31 c0                	xorl	%eax, %eax
ffff800000111e78: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000111e7a: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111e84: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111e8e: 48 b9 86 43 11 00 00 80 ff ff	movabsq	$-140737487223930, %rcx # imm = 0xFFFF800000114386
ffff800000111e98: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111ea2: be 34 01 00 00       	movl	$308, %esi              # imm = 0x134
ffff800000111ea7: 31 c0                	xorl	%eax, %eax
ffff800000111ea9: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000111eab: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111eb5: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111ebf: 48 b9 9f 41 11 00 00 80 ff ff	movabsq	$-140737487224417, %rcx # imm = 0xFFFF80000011419F
ffff800000111ec9: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111ed3: be 38 01 00 00       	movl	$312, %esi              # imm = 0x138
ffff800000111ed8: 31 c0                	xorl	%eax, %eax
ffff800000111eda: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000111edc: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111ee6: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111ef0: 48 b9 f0 3d 11 00 00 80 ff ff	movabsq	$-140737487225360, %rcx # imm = 0xFFFF800000113DF0
ffff800000111efa: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111f04: be 39 01 00 00       	movl	$313, %esi              # imm = 0x139
ffff800000111f09: 31 c0                	xorl	%eax, %eax
ffff800000111f0b: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000111f0d: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111f17: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111f21: 48 b9 51 40 11 00 00 80 ff ff	movabsq	$-140737487224751, %rcx # imm = 0xFFFF800000114051
ffff800000111f2b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111f35: be 3c 01 00 00       	movl	$316, %esi              # imm = 0x13C
ffff800000111f3a: 31 c0                	xorl	%eax, %eax
ffff800000111f3c: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff800000111f3e: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000111f48: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000111f52: 48 b9 03 3f 11 00 00 80 ff ff	movabsq	$-140737487225085, %rcx # imm = 0xFFFF800000113F03
ffff800000111f5c: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000111f66: be 3f 01 00 00       	movl	$319, %esi              # imm = 0x13F
ffff800000111f6b: 31 c0                	xorl	%eax, %eax
ffff800000111f6d: ff d3                	callq	*%rbx
ffff800000111f6f: 90                   	nop

ffff800000111f70 <ismemset>:
; {
ffff800000111f70: 55                   	pushq	%rbp
ffff800000111f71: 48 89 e5             	movq	%rsp, %rbp
ffff800000111f74: b8 01 00 00 00       	movl	$1, %eax
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000111f79: 48 85 d2             	testq	%rdx, %rdx
ffff800000111f7c: 74 24                	je	0xffff800000111fa2 <ismemset+0x32>
ffff800000111f7e: 45 31 c0             	xorl	%r8d, %r8d
ffff800000111f81: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111f8b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*p != c) {
ffff800000111f90: 42 0f b6 0c 07       	movzbl	(%rdi,%r8), %ecx
ffff800000111f95: 39 f1                	cmpl	%esi, %ecx
ffff800000111f97: 75 0b                	jne	0xffff800000111fa4 <ismemset+0x34>
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000111f99: 49 83 c0 01          	addq	$1, %r8
ffff800000111f9d: 4c 39 c2             	cmpq	%r8, %rdx
ffff800000111fa0: 75 ee                	jne	0xffff800000111f90 <ismemset+0x20>
; }
ffff800000111fa2: 5d                   	popq	%rbp
ffff800000111fa3: c3                   	retq
ffff800000111fa4: 31 c0                	xorl	%eax, %eax
; }
ffff800000111fa6: 5d                   	popq	%rbp
ffff800000111fa7: c3                   	retq
ffff800000111fa8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111fb0 <lab2_check_transparent_2m_paging>:
; {
ffff800000111fb0: 55                   	pushq	%rbp
ffff800000111fb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111fb4: 41 57                	pushq	%r15
ffff800000111fb6: 41 56                	pushq	%r14
ffff800000111fb8: 41 55                	pushq	%r13
ffff800000111fba: 41 54                	pushq	%r12
ffff800000111fbc: 53                   	pushq	%rbx
ffff800000111fbd: 48 83 ec 18          	subq	$24, %rsp
; 	nfree = count_total_free_pages();
ffff800000111fc1: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000111fcb: ff d0                	callq	*%rax
ffff800000111fcd: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000111fd1: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000111fdb: bf 02 00 00 00       	movl	$2, %edi
ffff800000111fe0: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000111fe2: 48 85 c0             	testq	%rax, %rax
ffff800000111fe5: 0f 84 79 05 00 00    	je	0xffff800000112564 <lab2_check_transparent_2m_paging+0x5b4>
ffff800000111feb: 49 89 c7             	movq	%rax, %r15
; 	data = page2kva(page);
ffff800000111fee: 48 b8 30 28 11 00 00 80 ff ff	movabsq	$-140737487230928, %rax # imm = 0xFFFF800000112830
ffff800000111ff8: 4c 89 ff             	movq	%r15, %rdi
ffff800000111ffb: ff d0                	callq	*%rax
ffff800000111ffd: 49 89 c6             	movq	%rax, %r14
ffff800000112000: 31 db                	xorl	%ebx, %ebx
ffff800000112002: 49 bc e0 02 11 00 00 80 ff ff	movabsq	$-140737487240480, %r12 # imm = 0xFFFF8000001102E0
ffff80000011200c: 0f 1f 40 00          	nopl	(%rax)
; 		memset(data, i & 0xff, PAGE_SIZE);
ffff800000112010: 0f b6 f3             	movzbl	%bl, %esi
ffff800000112013: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112018: 4c 89 f7             	movq	%r14, %rdi
ffff80000011201b: 41 ff d4             	callq	*%r12
; 		data += PAGE_SIZE;
ffff80000011201e: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff800000112025: 48 83 c3 01          	addq	$1, %rbx
ffff800000112029: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000112030: 75 de                	jne	0xffff800000112010 <lab2_check_transparent_2m_paging+0x60>
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000112032: 49 bc f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r12 # imm = 0xFFFF8000001182F0
ffff80000011203c: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112040: 48 bb 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rbx # imm = 0xFFFF800000110760
ffff80000011204a: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011204f: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112054: 4c 89 fe             	movq	%r15, %rsi
ffff800000112057: ff d3                	callq	*%rbx
ffff800000112059: 85 c0                	testl	%eax, %eax
ffff80000011205b: 0f 84 2a 05 00 00    	je	0xffff80000011258b <lab2_check_transparent_2m_paging+0x5db>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000112061: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112065: b9 01 00 00 00       	movl	$1, %ecx
ffff80000011206a: 4c 89 fe             	movq	%r15, %rsi
ffff80000011206d: 31 d2                	xorl	%edx, %edx
ffff80000011206f: ff d3                	callq	*%rbx
ffff800000112071: 85 c0                	testl	%eax, %eax
ffff800000112073: 0f 85 43 05 00 00    	jne	0xffff8000001125bc <lab2_check_transparent_2m_paging+0x60c>
; 	assert(page->pp_ref == 1);
ffff800000112079: 66 41 83 7f 10 01    	cmpw	$1, 16(%r15)
ffff80000011207f: 0f 85 68 05 00 00    	jne	0xffff8000001125ed <lab2_check_transparent_2m_paging+0x63d>
; 	assert(!page->pp_free);
ffff800000112085: 41 80 7f 12 00       	cmpb	$0, 18(%r15)
ffff80000011208a: 0f 88 8e 05 00 00    	js	0xffff80000011261e <lab2_check_transparent_2m_paging+0x66e>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000112090: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112094: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000112098: 0f 84 b1 05 00 00    	je	0xffff80000011264f <lab2_check_transparent_2m_paging+0x69f>
ffff80000011209e: 49 bd ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %r13 # imm = 0xFFFF000000000FFF
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff8000001120a8: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff8000001120b2: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff8000001120b6: 31 f6                	xorl	%esi, %esi
ffff8000001120b8: ff d0                	callq	*%rax
ffff8000001120ba: 49 89 c6             	movq	%rax, %r14
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001120bd: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001120c1: 48 8b 18             	movq	(%rax), %rbx
ffff8000001120c4: 48 89 d8             	movq	%rbx, %rax
ffff8000001120c7: 4c 21 e8             	andq	%r13, %rax
ffff8000001120ca: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff8000001120d0: 0f 85 aa 05 00 00    	jne	0xffff800000112680 <lab2_check_transparent_2m_paging+0x6d0>
ffff8000001120d6: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001120e0: 48 21 c3             	andq	%rax, %rbx
ffff8000001120e3: 48 b8 50 1b 11 00 00 80 ff ff	movabsq	$-140737487234224, %rax # imm = 0xFFFF800000111B50
ffff8000001120ed: 4c 89 ff             	movq	%r15, %rdi
ffff8000001120f0: ff d0                	callq	*%rax
ffff8000001120f2: 48 39 c3             	cmpq	%rax, %rbx
ffff8000001120f5: 0f 85 b6 05 00 00    	jne	0xffff8000001126b1 <lab2_check_transparent_2m_paging+0x701>
; 	assert(ret == page);
ffff8000001120fb: 4d 39 fe             	cmpq	%r15, %r14
ffff8000001120fe: 0f 85 de 05 00 00    	jne	0xffff8000001126e2 <lab2_check_transparent_2m_paging+0x732>
; 	unmap_page_range(kernel_pml4, (void *)PAGE_SIZE, PAGE_SIZE);
ffff800000112104: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112108: 48 b8 e0 0b 11 00 00 80 ff ff	movabsq	$-140737487238176, %rax # imm = 0xFFFF800000110BE0
ffff800000112112: be 00 10 00 00       	movl	$4096, %esi             # imm = 0x1000
ffff800000112117: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011211c: ff d0                	callq	*%rax
ffff80000011211e: 45 31 e4             	xorl	%r12d, %r12d
ffff800000112121: 4c 8d 7d d0          	leaq	-48(%rbp), %r15
ffff800000112125: 49 be 70 1f 11 00 00 80 ff ff	movabsq	$-140737487233168, %r14 # imm = 0xFFFF800000111F70
ffff80000011212f: 31 db                	xorl	%ebx, %ebx
ffff800000112131: eb 25                	jmp	0xffff800000112158 <lab2_check_transparent_2m_paging+0x1a8>
ffff800000112133: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011213d: 0f 1f 00             	nopl	(%rax)
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff800000112140: 49 83 c4 01          	addq	$1, %r12
ffff800000112144: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff80000011214b: 49 81 fc 00 02 00 00 	cmpq	$512, %r12              # imm = 0x200
ffff800000112152: 0f 84 0d 01 00 00    	je	0xffff800000112265 <lab2_check_transparent_2m_paging+0x2b5>
; 		entry = NULL;
ffff800000112158: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
; 		ret = page_lookup(kernel_pml4, addr, &entry);
ffff800000112160: 48 b8 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rax # imm = 0xFFFF8000001182F0
ffff80000011216a: 48 8b 38             	movq	(%rax), %rdi
ffff80000011216d: 48 89 de             	movq	%rbx, %rsi
ffff800000112170: 4c 89 fa             	movq	%r15, %rdx
ffff800000112173: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff80000011217d: ff d0                	callq	*%rax
; 		if (addr == (void *)PAGE_SIZE) {
ffff80000011217f: 48 81 fb 00 10 00 00 	cmpq	$4096, %rbx             # imm = 0x1000
ffff800000112186: 0f 84 94 00 00 00    	je	0xffff800000112220 <lab2_check_transparent_2m_paging+0x270>
ffff80000011218c: 48 85 c0             	testq	%rax, %rax
; 			assert(ret);
ffff80000011218f: 0f 84 4d 02 00 00    	je	0xffff8000001123e2 <lab2_check_transparent_2m_paging+0x432>
; 			assert(entry);
ffff800000112195: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112199: 48 85 c0             	testq	%rax, %rax
ffff80000011219c: 0f 84 71 02 00 00    	je	0xffff800000112413 <lab2_check_transparent_2m_paging+0x463>
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff8000001121a2: 48 8b 38             	movq	(%rax), %rdi
ffff8000001121a5: 48 89 f8             	movq	%rdi, %rax
ffff8000001121a8: 4c 21 e8             	andq	%r13, %rax
ffff8000001121ab: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001121af: 0f 85 8f 02 00 00    	jne	0xffff800000112444 <lab2_check_transparent_2m_paging+0x494>
; 			page = pa2page(PAGE_ADDR(*entry));
ffff8000001121b5: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001121bf: 48 21 c7             	andq	%rax, %rdi
ffff8000001121c2: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff8000001121cc: ff d0                	callq	*%rax
; 			assert(page->pp_order == 0);
ffff8000001121ce: 0f b6 48 12          	movzbl	18(%rax), %ecx
ffff8000001121d2: f6 c1 7f             	testb	$127, %cl
ffff8000001121d5: 0f 85 9a 02 00 00    	jne	0xffff800000112475 <lab2_check_transparent_2m_paging+0x4c5>
; 			assert(!page->pp_free);
ffff8000001121db: 84 c9                	testb	%cl, %cl
ffff8000001121dd: 0f 88 c3 02 00 00    	js	0xffff8000001124a6 <lab2_check_transparent_2m_paging+0x4f6>
; 			assert(list_is_empty(&page->pp_node));
ffff8000001121e3: 48 89 c7             	movq	%rax, %rdi
ffff8000001121e6: 48 b8 c0 28 11 00 00 80 ff ff	movabsq	$-140737487230784, %rax # imm = 0xFFFF8000001128C0
ffff8000001121f0: ff d0                	callq	*%rax
ffff8000001121f2: 85 c0                	testl	%eax, %eax
ffff8000001121f4: 0f 84 dd 02 00 00    	je	0xffff8000001124d7 <lab2_check_transparent_2m_paging+0x527>
; 			if (!ismemset(addr, (i & 0xff), PAGE_SIZE)) {
ffff8000001121fa: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff8000001121fe: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112203: 48 89 df             	movq	%rbx, %rdi
ffff800000112206: 41 ff d6             	callq	*%r14
ffff800000112209: 85 c0                	testl	%eax, %eax
ffff80000011220b: 0f 85 2f ff ff ff    	jne	0xffff800000112140 <lab2_check_transparent_2m_paging+0x190>
ffff800000112211: e9 f2 02 00 00       	jmp	0xffff800000112508 <lab2_check_transparent_2m_paging+0x558>
ffff800000112216: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112220: 48 85 c0             	testq	%rax, %rax
; 			assert(!ret);
ffff800000112223: 0f 85 0a 03 00 00    	jne	0xffff800000112533 <lab2_check_transparent_2m_paging+0x583>
; 			assert(!entry);
ffff800000112229: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff80000011222e: 0f 84 0c ff ff ff    	je	0xffff800000112140 <lab2_check_transparent_2m_paging+0x190>
ffff800000112234: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011223e: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112248: 48 b9 a0 3a 11 00 00 80 ff ff	movabsq	$-140737487226208, %rcx # imm = 0xFFFF800000113AA0
ffff800000112252: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011225c: be 87 01 00 00       	movl	$391, %esi              # imm = 0x187
ffff800000112261: 31 c0                	xorl	%eax, %eax
ffff800000112263: ff d3                	callq	*%rbx
; 	page = page_alloc(0);
ffff800000112265: 31 ff                	xorl	%edi, %edi
ffff800000112267: 48 b8 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rax # imm = 0xFFFF80000010DBA0
ffff800000112271: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000112273: 48 85 c0             	testq	%rax, %rax
ffff800000112276: 0f 84 97 04 00 00    	je	0xffff800000112713 <lab2_check_transparent_2m_paging+0x763>
ffff80000011227c: 48 89 c3             	movq	%rax, %rbx
; 	data = page2kva(page);
ffff80000011227f: 48 89 c7             	movq	%rax, %rdi
ffff800000112282: 48 b8 30 28 11 00 00 80 ff ff	movabsq	$-140737487230928, %rax # imm = 0xFFFF800000112830
ffff80000011228c: ff d0                	callq	*%rax
; 	memset(data, 1, PAGE_SIZE);
ffff80000011228e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112293: 48 89 c7             	movq	%rax, %rdi
ffff800000112296: be 01 00 00 00       	movl	$1, %esi
ffff80000011229b: 48 b8 e0 02 11 00 00 80 ff ff	movabsq	$-140737487240480, %rax # imm = 0xFFFF8000001102E0
ffff8000001122a5: ff d0                	callq	*%rax
ffff8000001122a7: 49 bc f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r12 # imm = 0xFFFF8000001182F0
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff8000001122b1: 49 8b 3c 24          	movq	(%r12), %rdi
ffff8000001122b5: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001122ba: b9 01 00 00 00       	movl	$1, %ecx
ffff8000001122bf: 48 89 de             	movq	%rbx, %rsi
ffff8000001122c2: 48 b8 60 07 11 00 00 80 ff ff	movabsq	$-140737487239328, %rax # imm = 0xFFFF800000110760
ffff8000001122cc: ff d0                	callq	*%rax
ffff8000001122ce: 85 c0                	testl	%eax, %eax
ffff8000001122d0: 0f 85 64 04 00 00    	jne	0xffff80000011273a <lab2_check_transparent_2m_paging+0x78a>
; 	page_lookup(kernel_pml4, 0, &entry);
ffff8000001122d6: 49 8b 3c 24          	movq	(%r12), %rdi
ffff8000001122da: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
; 	page_lookup(kernel_pml4, 0, &entry);
ffff8000001122de: 31 f6                	xorl	%esi, %esi
ffff8000001122e0: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff8000001122ea: ff d0                	callq	*%rax
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001122ec: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001122f0: 4c 23 28             	andq	(%rax), %r13
ffff8000001122f3: 49 81 fd 81 00 00 00 	cmpq	$129, %r13
ffff8000001122fa: 0f 85 6b 04 00 00    	jne	0xffff80000011276b <lab2_check_transparent_2m_paging+0x7bb>
ffff800000112300: 31 db                	xorl	%ebx, %ebx
ffff800000112302: 45 31 ff             	xorl	%r15d, %r15d
ffff800000112305: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011230f: 90                   	nop
; 		if (!ismemset(data, i & 0xff, PAGE_SIZE)) {
ffff800000112310: 0f b6 f3             	movzbl	%bl, %esi
ffff800000112313: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000112318: 4c 89 ff             	movq	%r15, %rdi
ffff80000011231b: 41 ff d6             	callq	*%r14
ffff80000011231e: 85 c0                	testl	%eax, %eax
ffff800000112320: 0f 84 93 00 00 00    	je	0xffff8000001123b9 <lab2_check_transparent_2m_paging+0x409>
; 		data += PAGE_SIZE;
ffff800000112326: 49 81 c7 00 10 00 00 	addq	$4096, %r15             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff80000011232d: 48 83 c3 01          	addq	$1, %rbx
ffff800000112331: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000112338: 75 d6                	jne	0xffff800000112310 <lab2_check_transparent_2m_paging+0x360>
; 	unmap_page_range(kernel_pml4, 0, HPAGE_SIZE);
ffff80000011233a: 49 8b 3c 24          	movq	(%r12), %rdi
ffff80000011233e: ba 00 00 20 00       	movl	$2097152, %edx          # imm = 0x200000
ffff800000112343: 31 f6                	xorl	%esi, %esi
ffff800000112345: 48 b8 e0 0b 11 00 00 80 ff ff	movabsq	$-140737487238176, %rax # imm = 0xFFFF800000110BE0
ffff80000011234f: ff d0                	callq	*%rax
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000112351: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000112355: 31 f6                	xorl	%esi, %esi
ffff800000112357: 31 d2                	xorl	%edx, %edx
ffff800000112359: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000112363: ff d0                	callq	*%rax
ffff800000112365: 48 85 c0             	testq	%rax, %rax
ffff800000112368: 0f 85 2e 04 00 00    	jne	0xffff80000011279c <lab2_check_transparent_2m_paging+0x7ec>
; 	assert(kernel_pml4->entries[0] == 0);
ffff80000011236e: 49 8b 04 24          	movq	(%r12), %rax
ffff800000112372: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000112376: 0f 85 51 04 00 00    	jne	0xffff8000001127cd <lab2_check_transparent_2m_paging+0x81d>
; 	assert(nfree == count_total_free_pages());
ffff80000011237c: 48 b8 70 d7 10 00 00 80 ff ff	movabsq	$-140737487251600, %rax # imm = 0xFFFF80000010D770
ffff800000112386: ff d0                	callq	*%rax
ffff800000112388: 48 39 45 c8          	cmpq	%rax, -56(%rbp)
ffff80000011238c: 0f 85 6c 04 00 00    	jne	0xffff8000001127fe <lab2_check_transparent_2m_paging+0x84e>
; 	cprintf("[LAB 2] check_transparent_2m_paging() succeeded!\n");
ffff800000112392: 48 bf 25 3f 11 00 00 80 ff ff	movabsq	$-140737487225051, %rdi # imm = 0xFFFF800000113F25
ffff80000011239c: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff8000001123a6: 31 c0                	xorl	%eax, %eax
ffff8000001123a8: ff d1                	callq	*%rcx
; }
ffff8000001123aa: 48 83 c4 18          	addq	$24, %rsp
ffff8000001123ae: 5b                   	popq	%rbx
ffff8000001123af: 41 5c                	popq	%r12
ffff8000001123b1: 41 5d                	popq	%r13
ffff8000001123b3: 41 5e                	popq	%r14
ffff8000001123b5: 41 5f                	popq	%r15
ffff8000001123b7: 5d                   	popq	%rbp
ffff8000001123b8: c3                   	retq
; 			panic("page %p is corrupt\n", NULL);
ffff8000001123b9: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001123c3: 48 ba a8 40 11 00 00 80 ff ff	movabsq	$-140737487224664, %rdx # imm = 0xFFFF8000001140A8
ffff8000001123cd: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001123d7: be ae 01 00 00       	movl	$430, %esi              # imm = 0x1AE
ffff8000001123dc: 31 c9                	xorl	%ecx, %ecx
ffff8000001123de: 31 c0                	xorl	%eax, %eax
ffff8000001123e0: ff d3                	callq	*%rbx
; 			assert(ret);
ffff8000001123e2: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001123ec: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001123f6: 48 b9 ad 41 11 00 00 80 ff ff	movabsq	$-140737487224403, %rcx # imm = 0xFFFF8000001141AD
ffff800000112400: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011240a: be 89 01 00 00       	movl	$393, %esi              # imm = 0x189
ffff80000011240f: 31 c0                	xorl	%eax, %eax
ffff800000112411: ff d3                	callq	*%rbx
; 			assert(entry);
ffff800000112413: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011241d: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112427: 48 b9 fd 3f 11 00 00 80 ff ff	movabsq	$-140737487224835, %rcx # imm = 0xFFFF800000113FFD
ffff800000112431: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011243b: be 8a 01 00 00       	movl	$394, %esi              # imm = 0x18A
ffff800000112440: 31 c0                	xorl	%eax, %eax
ffff800000112442: ff d3                	callq	*%rbx
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000112444: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011244e: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112458: 48 b9 5e 46 11 00 00 80 ff ff	movabsq	$-140737487223202, %rcx # imm = 0xFFFF80000011465E
ffff800000112462: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011246c: be 8b 01 00 00       	movl	$395, %esi              # imm = 0x18B
ffff800000112471: 31 c0                	xorl	%eax, %eax
ffff800000112473: ff d3                	callq	*%rbx
; 			assert(page->pp_order == 0);
ffff800000112475: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011247f: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112489: 48 b9 91 48 11 00 00 80 ff ff	movabsq	$-140737487222639, %rcx # imm = 0xFFFF800000114891
ffff800000112493: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011249d: be 8d 01 00 00       	movl	$397, %esi              # imm = 0x18D
ffff8000001124a2: 31 c0                	xorl	%eax, %eax
ffff8000001124a4: ff d3                	callq	*%rbx
; 			assert(!page->pp_free);
ffff8000001124a6: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001124b0: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001124ba: 48 b9 35 39 11 00 00 80 ff ff	movabsq	$-140737487226571, %rcx # imm = 0xFFFF800000113935
ffff8000001124c4: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001124ce: be 8e 01 00 00       	movl	$398, %esi              # imm = 0x18E
ffff8000001124d3: 31 c0                	xorl	%eax, %eax
ffff8000001124d5: ff d3                	callq	*%rbx
; 			assert(list_is_empty(&page->pp_node));
ffff8000001124d7: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001124e1: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001124eb: 48 b9 51 45 11 00 00 80 ff ff	movabsq	$-140737487223471, %rcx # imm = 0xFFFF800000114551
ffff8000001124f5: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001124ff: be 8f 01 00 00       	movl	$399, %esi              # imm = 0x18F
ffff800000112504: 31 c0                	xorl	%eax, %eax
ffff800000112506: ff d3                	callq	*%rbx
; 				panic("page %p is corrupt", addr);
ffff800000112508: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112512: 48 ba 13 3e 11 00 00 80 ff ff	movabsq	$-140737487225325, %rdx # imm = 0xFFFF800000113E13
ffff80000011251c: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000112526: be 92 01 00 00       	movl	$402, %esi              # imm = 0x192
ffff80000011252b: 48 89 d9             	movq	%rbx, %rcx
ffff80000011252e: 31 c0                	xorl	%eax, %eax
ffff800000112530: 41 ff d0             	callq	*%r8
; 			assert(!ret);
ffff800000112533: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011253d: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112547: 48 b9 9b 3a 11 00 00 80 ff ff	movabsq	$-140737487226213, %rcx # imm = 0xFFFF800000113A9B
ffff800000112551: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011255b: be 86 01 00 00       	movl	$390, %esi              # imm = 0x186
ffff800000112560: 31 c0                	xorl	%eax, %eax
ffff800000112562: ff d3                	callq	*%rbx
; 		panic("cannot allocate 2M page!");
ffff800000112564: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011256e: 48 ba 5c 42 11 00 00 80 ff ff	movabsq	$-140737487224228, %rdx # imm = 0xFFFF80000011425C
ffff800000112578: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000112582: be 61 01 00 00       	movl	$353, %esi              # imm = 0x161
ffff800000112587: 31 c0                	xorl	%eax, %eax
ffff800000112589: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff80000011258b: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112595: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000011259f: 48 b9 0a 3c 11 00 00 80 ff ff	movabsq	$-140737487225846, %rcx # imm = 0xFFFF800000113C0A
ffff8000001125a9: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001125b3: be 6d 01 00 00       	movl	$365, %esi              # imm = 0x16D
ffff8000001125b8: 31 c0                	xorl	%eax, %eax
ffff8000001125ba: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001125bc: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001125c6: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001125d0: 48 b9 bb 42 11 00 00 80 ff ff	movabsq	$-140737487224133, %rcx # imm = 0xFFFF8000001142BB
ffff8000001125da: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001125e4: be 70 01 00 00       	movl	$368, %esi              # imm = 0x170
ffff8000001125e9: 31 c0                	xorl	%eax, %eax
ffff8000001125eb: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff8000001125ed: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001125f7: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112601: 48 b9 7f 48 11 00 00 80 ff ff	movabsq	$-140737487222657, %rcx # imm = 0xFFFF80000011487F
ffff80000011260b: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112615: be 71 01 00 00       	movl	$369, %esi              # imm = 0x171
ffff80000011261a: 31 c0                	xorl	%eax, %eax
ffff80000011261c: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff80000011261e: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112628: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112632: 48 b9 35 39 11 00 00 80 ff ff	movabsq	$-140737487226571, %rcx # imm = 0xFFFF800000113935
ffff80000011263c: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112646: be 72 01 00 00       	movl	$370, %esi              # imm = 0x172
ffff80000011264b: 31 c0                	xorl	%eax, %eax
ffff80000011264d: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff80000011264f: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112659: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112663: 48 b9 88 3b 11 00 00 80 ff ff	movabsq	$-140737487225976, %rcx # imm = 0xFFFF800000113B88
ffff80000011266d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112677: be 73 01 00 00       	movl	$371, %esi              # imm = 0x173
ffff80000011267c: 31 c0                	xorl	%eax, %eax
ffff80000011267e: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000112680: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011268a: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112694: 48 b9 14 48 11 00 00 80 ff ff	movabsq	$-140737487222764, %rcx # imm = 0xFFFF800000114814
ffff80000011269e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001126a8: be 77 01 00 00       	movl	$375, %esi              # imm = 0x177
ffff8000001126ad: 31 c0                	xorl	%eax, %eax
ffff8000001126af: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001126b1: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001126bb: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001126c5: 48 b9 da 3f 11 00 00 80 ff ff	movabsq	$-140737487224870, %rcx # imm = 0xFFFF800000113FDA
ffff8000001126cf: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001126d9: be 78 01 00 00       	movl	$376, %esi              # imm = 0x178
ffff8000001126de: 31 c0                	xorl	%eax, %eax
ffff8000001126e0: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff8000001126e2: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001126ec: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001126f6: 48 b9 86 43 11 00 00 80 ff ff	movabsq	$-140737487223930, %rcx # imm = 0xFFFF800000114386
ffff800000112700: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000011270a: be 79 01 00 00       	movl	$377, %esi              # imm = 0x179
ffff80000011270f: 31 c0                	xorl	%eax, %eax
ffff800000112711: ff d3                	callq	*%rbx
; 		panic("cannot allocate 4K page!");
ffff800000112713: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff80000011271d: 48 ba 38 45 11 00 00 80 ff ff	movabsq	$-140737487223496, %rdx # imm = 0xFFFF800000114538
ffff800000112727: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff800000112731: be 9b 01 00 00       	movl	$411, %esi              # imm = 0x19B
ffff800000112736: 31 c0                	xorl	%eax, %eax
ffff800000112738: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff80000011273a: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112744: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000011274e: 48 b9 1d 41 11 00 00 80 ff ff	movabsq	$-140737487224547, %rcx # imm = 0xFFFF80000011411D
ffff800000112758: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112762: be a3 01 00 00       	movl	$419, %esi              # imm = 0x1A3
ffff800000112767: 31 c0                	xorl	%eax, %eax
ffff800000112769: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff80000011276b: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112775: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff80000011277f: 48 b9 14 48 11 00 00 80 ff ff	movabsq	$-140737487222764, %rcx # imm = 0xFFFF800000114814
ffff800000112789: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112793: be a7 01 00 00       	movl	$423, %esi              # imm = 0x1A7
ffff800000112798: 31 c0                	xorl	%eax, %eax
ffff80000011279a: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff80000011279c: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001127a6: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001127b0: 48 b9 f0 3d 11 00 00 80 ff ff	movabsq	$-140737487225360, %rcx # imm = 0xFFFF800000113DF0
ffff8000001127ba: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001127c4: be b6 01 00 00       	movl	$438, %esi              # imm = 0x1B6
ffff8000001127c9: 31 c0                	xorl	%eax, %eax
ffff8000001127cb: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff8000001127cd: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001127d7: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff8000001127e1: 48 b9 51 40 11 00 00 80 ff ff	movabsq	$-140737487224751, %rcx # imm = 0xFFFF800000114051
ffff8000001127eb: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff8000001127f5: be b9 01 00 00       	movl	$441, %esi              # imm = 0x1B9
ffff8000001127fa: 31 c0                	xorl	%eax, %eax
ffff8000001127fc: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff8000001127fe: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112808: 48 ba ba 3e 11 00 00 80 ff ff	movabsq	$-140737487225158, %rdx # imm = 0xFFFF800000113EBA
ffff800000112812: 48 b9 03 3f 11 00 00 80 ff ff	movabsq	$-140737487225085, %rcx # imm = 0xFFFF800000113F03
ffff80000011281c: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112826: be bc 01 00 00       	movl	$444, %esi              # imm = 0x1BC
ffff80000011282b: 31 c0                	xorl	%eax, %eax
ffff80000011282d: ff d3                	callq	*%rbx
ffff80000011282f: 90                   	nop

ffff800000112830 <page2kva>:
; {
ffff800000112830: 55                   	pushq	%rbp
ffff800000112831: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff800000112834: 48 b8 50 1b 11 00 00 80 ff ff	movabsq	$-140737487234224, %rax # imm = 0xFFFF800000111B50
ffff80000011283e: ff d0                	callq	*%rax
ffff800000112840: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff80000011284a: 48 b9 30 2b 11 00 00 80 ff ff	movabsq	$-140737487230160, %rcx # imm = 0xFFFF800000112B30
ffff800000112854: be 50 00 00 00       	movl	$80, %esi
ffff800000112859: 48 89 c2             	movq	%rax, %rdx
ffff80000011285c: ff d1                	callq	*%rcx
ffff80000011285e: 5d                   	popq	%rbp
ffff80000011285f: c3                   	retq

ffff800000112860 <pa2page>:
; {
ffff800000112860: 55                   	pushq	%rbp
ffff800000112861: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000112864: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000112868: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000112872: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000112875: 73 16                	jae	0xffff80000011288d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000112877: 48 b8 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rax # imm = 0xFFFF8000001182E8
ffff800000112881: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000112885: 48 03 38             	addq	(%rax), %rdi
ffff800000112888: 48 89 f8             	movq	%rdi, %rax
ffff80000011288b: 5d                   	popq	%rbp
ffff80000011288c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000011288d: 48 bf 16 3a 11 00 00 80 ff ff	movabsq	$-140737487226346, %rdi # imm = 0xFFFF800000113A16
ffff800000112897: 48 ba e7 45 11 00 00 80 ff ff	movabsq	$-140737487223321, %rdx # imm = 0xFFFF8000001145E7
ffff8000001128a1: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff8000001128ab: be 49 00 00 00       	movl	$73, %esi
ffff8000001128b0: 31 c0                	xorl	%eax, %eax
ffff8000001128b2: ff d1                	callq	*%rcx
ffff8000001128b4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001128be: 66 90                	nop

ffff8000001128c0 <list_is_empty>:
; {
ffff8000001128c0: 55                   	pushq	%rbp
ffff8000001128c1: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff8000001128c4: 31 c0                	xorl	%eax, %eax
ffff8000001128c6: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff8000001128c9: 0f 94 c0             	sete	%al
ffff8000001128cc: 5d                   	popq	%rbp
ffff8000001128cd: c3                   	retq
ffff8000001128ce: 66 90                	nop

ffff8000001128d0 <lab2_check_free_list_order>:
; {
ffff8000001128d0: 55                   	pushq	%rbp
ffff8000001128d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001128d4: 31 c9                	xorl	%ecx, %ecx
ffff8000001128d6: 49 b8 40 82 11 00 00 80 ff ff	movabsq	$-140737487207872, %r8 # imm = 0xFFFF800000118240
ffff8000001128e0: 45 31 c9             	xorl	%r9d, %r9d
ffff8000001128e3: eb 15                	jmp	0xffff8000001128fa <lab2_check_free_list_order+0x2a>
ffff8000001128e5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001128ef: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001128f0: 49 83 c1 01          	addq	$1, %r9
ffff8000001128f4: 49 83 f9 0a          	cmpq	$10, %r9
ffff8000001128f8: 74 32                	je	0xffff80000011292c <lab2_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff8000001128fa: 4c 89 ce             	movq	%r9, %rsi
ffff8000001128fd: 48 c1 e6 04          	shlq	$4, %rsi
ffff800000112901: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff800000112905: 4c 01 c6             	addq	%r8, %rsi
ffff800000112908: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000011290b: 74 e3                	je	0xffff8000001128f0 <lab2_check_free_list_order+0x20>
ffff80000011290d: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff800000112910: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff800000112914: 83 e0 7f             	andl	$127, %eax
ffff800000112917: 31 d2                	xorl	%edx, %edx
ffff800000112919: 49 39 c1             	cmpq	%rax, %r9
ffff80000011291c: 0f 95 c2             	setne	%dl
ffff80000011291f: 48 01 d1             	addq	%rdx, %rcx
ffff800000112922: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff800000112925: 48 39 f7             	cmpq	%rsi, %rdi
ffff800000112928: 75 e6                	jne	0xffff800000112910 <lab2_check_free_list_order+0x40>
ffff80000011292a: eb c4                	jmp	0xffff8000001128f0 <lab2_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000011292c: 48 85 c9             	testq	%rcx, %rcx
ffff80000011292f: 75 1a                	jne	0xffff80000011294b <lab2_check_free_list_order+0x7b>
; 	cprintf("[LAB 2] check_free_list_order() succeeded!\n");
ffff800000112931: 48 bf 47 48 11 00 00 80 ff ff	movabsq	$-140737487222713, %rdi # imm = 0xFFFF800000114847
ffff80000011293b: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112945: 31 c0                	xorl	%eax, %eax
ffff800000112947: ff d1                	callq	*%rcx
; }
ffff800000112949: 5d                   	popq	%rbp
ffff80000011294a: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000011294b: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112955: 48 ba a9 45 11 00 00 80 ff ff	movabsq	$-140737487223383, %rdx # imm = 0xFFFF8000001145A9
ffff80000011295f: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000112969: be d5 01 00 00       	movl	$469, %esi              # imm = 0x1D5
ffff80000011296e: 31 c0                	xorl	%eax, %eax
ffff800000112970: 41 ff d0             	callq	*%r8
ffff800000112973: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011297d: 0f 1f 00             	nopl	(%rax)

ffff800000112980 <lab2_check_memory_layout>:
; {
ffff800000112980: 55                   	pushq	%rbp
ffff800000112981: 48 89 e5             	movq	%rsp, %rbp
ffff800000112984: 41 57                	pushq	%r15
ffff800000112986: 41 56                	pushq	%r14
ffff800000112988: 41 55                	pushq	%r13
ffff80000011298a: 41 54                	pushq	%r12
ffff80000011298c: 53                   	pushq	%rbx
ffff80000011298d: 48 83 ec 18          	subq	$24, %rsp
ffff800000112991: 48 89 fb             	movq	%rdi, %rbx
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff800000112994: 8b 17                	movl	(%rdi), %edx
ffff800000112996: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff8000001129a0: 48 b8 30 2b 11 00 00 80 ff ff	movabsq	$-140737487230160, %rax # imm = 0xFFFF800000112B30
ffff8000001129aa: be e3 01 00 00       	movl	$483, %esi              # imm = 0x1E3
ffff8000001129af: ff d0                	callq	*%rax
ffff8000001129b1: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff8000001129b4: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff8000001129be: 31 ff                	xorl	%edi, %edi
ffff8000001129c0: ff d0                	callq	*%rax
ffff8000001129c2: 48 b9 80 2b 11 00 00 80 ff ff	movabsq	$-140737487230080, %rcx # imm = 0xFFFF800000112B80
ffff8000001129cc: bf e4 01 00 00       	movl	$484, %edi              # imm = 0x1E4
ffff8000001129d1: 48 89 c6             	movq	%rax, %rsi
ffff8000001129d4: ff d1                	callq	*%rcx
ffff8000001129d6: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001129da: 48 89 5d d0          	movq	%rbx, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff8000001129de: 83 7b 04 00          	cmpl	$0, 4(%rbx)
ffff8000001129e2: 0f 84 e3 00 00 00    	je	0xffff800000112acb <lab2_check_memory_layout+0x14b>
ffff8000001129e8: 45 31 ff             	xorl	%r15d, %r15d
ffff8000001129eb: 49 be e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %r14 # imm = 0xFFFF8000001182E0
ffff8000001129f5: eb 21                	jmp	0xffff800000112a18 <lab2_check_memory_layout+0x98>
ffff8000001129f7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000112a00: 49 83 c7 01          	addq	$1, %r15
ffff800000112a04: 49 83 c4 18          	addq	$24, %r12
ffff800000112a08: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000112a0c: 8b 40 04             	movl	4(%rax), %eax
ffff800000112a0f: 49 39 c7             	cmpq	%rax, %r15
ffff800000112a12: 0f 83 b3 00 00 00    	jae	0xffff800000112acb <lab2_check_memory_layout+0x14b>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000112a18: 49 8b 1c 24          	movq	(%r12), %rbx
ffff800000112a1c: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000112a21: 48 01 d8             	addq	%rbx, %rax
ffff800000112a24: eb 25                	jmp	0xffff800000112a4b <lab2_check_memory_layout+0xcb>
ffff800000112a26: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 			    page->pp_free) {
ffff800000112a30: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff800000112a35: 0f 88 b7 00 00 00    	js	0xffff800000112af2 <lab2_check_memory_layout+0x172>
; 		     pa += PAGE_SIZE) {
ffff800000112a3b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000112a42: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff800000112a47: 49 03 04 24          	addq	(%r12), %rax
ffff800000112a4b: 48 39 c3             	cmpq	%rax, %rbx
ffff800000112a4e: 73 b0                	jae	0xffff800000112a00 <lab2_check_memory_layout+0x80>
; 			if (npages <= PAGE_INDEX(pa)) {
ffff800000112a50: 48 89 d8             	movq	%rbx, %rax
ffff800000112a53: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000112a57: 49 39 06             	cmpq	%rax, (%r14)
ffff800000112a5a: 76 df                	jbe	0xffff800000112a3b <lab2_check_memory_layout+0xbb>
; 			page = pa2page(pa);
ffff800000112a5c: 48 89 df             	movq	%rbx, %rdi
ffff800000112a5f: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff800000112a69: ff d0                	callq	*%rax
ffff800000112a6b: 49 89 c5             	movq	%rax, %r13
; 			addr = (void *)ROUNDDOWN((uintptr_t)page, PAGE_SIZE);
ffff800000112a6e: 48 89 c6             	movq	%rax, %rsi
ffff800000112a71: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 			if (!page_lookup(kernel_pml4, addr, NULL)) {
ffff800000112a78: 48 b8 f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %rax # imm = 0xFFFF8000001182F0
ffff800000112a82: 48 8b 38             	movq	(%rax), %rdi
ffff800000112a85: 31 d2                	xorl	%edx, %edx
ffff800000112a87: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000112a91: ff d0                	callq	*%rax
ffff800000112a93: 48 85 c0             	testq	%rax, %rax
ffff800000112a96: 74 a3                	je	0xffff800000112a3b <lab2_check_memory_layout+0xbb>
; 			if ((pa == 0 ||
ffff800000112a98: 48 85 db             	testq	%rbx, %rbx
ffff800000112a9b: 74 93                	je	0xffff800000112a30 <lab2_check_memory_layout+0xb0>
ffff800000112a9d: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff800000112aa1: 48 3b 58 08          	cmpq	8(%rax), %rbx
ffff800000112aa5: 74 89                	je	0xffff800000112a30 <lab2_check_memory_layout+0xb0>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff800000112aa7: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff800000112aae: 72 0a                	jb	0xffff800000112aba <lab2_check_memory_layout+0x13a>
ffff800000112ab0: 48 3b 5d c8          	cmpq	-56(%rbp), %rbx
ffff800000112ab4: 0f 82 76 ff ff ff    	jb	0xffff800000112a30 <lab2_check_memory_layout+0xb0>
; 			    entry->type != MMAP_FREE) &&
ffff800000112aba: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff800000112ac0: 0f 85 6a ff ff ff    	jne	0xffff800000112a30 <lab2_check_memory_layout+0xb0>
ffff800000112ac6: e9 70 ff ff ff       	jmp	0xffff800000112a3b <lab2_check_memory_layout+0xbb>
; 	cprintf("[LAB 2] check_memory_layout() succeeded!\n");
ffff800000112acb: 48 bf 4f 3c 11 00 00 80 ff ff	movabsq	$-140737487225777, %rdi # imm = 0xFFFF800000113C4F
ffff800000112ad5: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112adf: 31 c0                	xorl	%eax, %eax
ffff800000112ae1: ff d1                	callq	*%rcx
; }
ffff800000112ae3: 48 83 c4 18          	addq	$24, %rsp
ffff800000112ae7: 5b                   	popq	%rbx
ffff800000112ae8: 41 5c                	popq	%r12
ffff800000112aea: 41 5d                	popq	%r13
ffff800000112aec: 41 5e                	popq	%r14
ffff800000112aee: 41 5f                	popq	%r15
ffff800000112af0: 5d                   	popq	%rbp
ffff800000112af1: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff800000112af2: 48 b8 50 1b 11 00 00 80 ff ff	movabsq	$-140737487234224, %rax # imm = 0xFFFF800000111B50
ffff800000112afc: 4c 89 ef             	movq	%r13, %rdi
ffff800000112aff: ff d0                	callq	*%rax
ffff800000112b01: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112b0b: 48 ba de 3c 11 00 00 80 ff ff	movabsq	$-140737487225634, %rdx # imm = 0xFFFF800000113CDE
ffff800000112b15: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112b1f: be f9 01 00 00       	movl	$505, %esi              # imm = 0x1F9
ffff800000112b24: 48 89 c1             	movq	%rax, %rcx
ffff800000112b27: 31 c0                	xorl	%eax, %eax
ffff800000112b29: ff d3                	callq	*%rbx
ffff800000112b2b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000112b30 <_kaddr>:
; {
ffff800000112b30: 55                   	pushq	%rbp
ffff800000112b31: 48 89 e5             	movq	%rsp, %rbp
ffff800000112b34: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000112b37: 48 89 d1             	movq	%rdx, %rcx
ffff800000112b3a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000112b3e: 48 ba e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rdx # imm = 0xFFFF8000001182E0
ffff800000112b48: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff800000112b4b: 73 0f                	jae	0xffff800000112b5c <_kaddr+0x2c>
ffff800000112b4d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff800000112b57: 48 01 c8             	addq	%rcx, %rax
ffff800000112b5a: 5d                   	popq	%rbp
ffff800000112b5b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000112b5c: 48 ba 86 42 11 00 00 80 ff ff	movabsq	$-140737487224186, %rdx # imm = 0xFFFF800000114286
ffff800000112b66: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000112b70: 48 89 c1             	movq	%rax, %rcx
ffff800000112b73: 31 c0                	xorl	%eax, %eax
ffff800000112b75: 41 ff d0             	callq	*%r8
ffff800000112b78: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112b80 <_paddr>:
; {
ffff800000112b80: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000112b83: 48 89 f1             	movq	%rsi, %rcx
ffff800000112b86: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000112b8a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff800000112b90: 76 0e                	jbe	0xffff800000112ba0 <_paddr+0x20>
ffff800000112b92: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff800000112b9c: 48 01 c8             	addq	%rcx, %rax
ffff800000112b9f: c3                   	retq
ffff800000112ba0: 55                   	pushq	%rbp
ffff800000112ba1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112ba4: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff800000112ba6: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112bb0: 48 ba a5 3b 11 00 00 80 ff ff	movabsq	$-140737487225947, %rdx # imm = 0xFFFF800000113BA5
ffff800000112bba: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff800000112bc4: 48 89 c1             	movq	%rax, %rcx
ffff800000112bc7: 31 c0                	xorl	%eax, %eax
ffff800000112bc9: 41 ff d0             	callq	*%r8
ffff800000112bcc: 0f 1f 40 00          	nopl	(%rax)

ffff800000112bd0 <lab2_check_buddy_consistency>:
; {
ffff800000112bd0: 55                   	pushq	%rbp
ffff800000112bd1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112bd4: 41 57                	pushq	%r15
ffff800000112bd6: 41 56                	pushq	%r14
ffff800000112bd8: 41 55                	pushq	%r13
ffff800000112bda: 41 54                	pushq	%r12
ffff800000112bdc: 53                   	pushq	%rbx
ffff800000112bdd: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff800000112bde: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000112be8: 48 8b 00             	movq	(%rax), %rax
ffff800000112beb: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff800000112bef: 74 7e                	je	0xffff800000112c6f <lab2_check_buddy_consistency+0x9f>
ffff800000112bf1: 31 db                	xorl	%ebx, %ebx
ffff800000112bf3: 49 bc f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r12 # imm = 0xFFFF8000001182F0
ffff800000112bfd: 49 bd 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %r13 # imm = 0xFFFF800000112860
ffff800000112c07: 49 bf 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %r15 # imm = 0xFFFF800000110810
ffff800000112c11: eb 2a                	jmp	0xffff800000112c3d <lab2_check_buddy_consistency+0x6d>
ffff800000112c13: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112c1d: 0f 1f 00             	nopl	(%rax)
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff800000112c20: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
; 	     addr < npages * PAGE_SIZE;
ffff800000112c27: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000112c31: 48 8b 00             	movq	(%rax), %rax
ffff800000112c34: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000112c38: 48 39 c3             	cmpq	%rax, %rbx
; 	for (addr = 0;
ffff800000112c3b: 73 32                	jae	0xffff800000112c6f <lab2_check_buddy_consistency+0x9f>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff800000112c3d: 4d 8b 34 24          	movq	(%r12), %r14
ffff800000112c41: 48 89 df             	movq	%rbx, %rdi
ffff800000112c44: 41 ff d5             	callq	*%r13
ffff800000112c47: 4c 89 f7             	movq	%r14, %rdi
ffff800000112c4a: 48 89 c6             	movq	%rax, %rsi
ffff800000112c4d: 31 d2                	xorl	%edx, %edx
ffff800000112c4f: 41 ff d7             	callq	*%r15
ffff800000112c52: 48 85 c0             	testq	%rax, %rax
ffff800000112c55: 74 c9                	je	0xffff800000112c20 <lab2_check_buddy_consistency+0x50>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff800000112c57: be 09 00 00 00       	movl	$9, %esi
ffff800000112c5c: 48 89 df             	movq	%rbx, %rdi
ffff800000112c5f: 31 d2                	xorl	%edx, %edx
ffff800000112c61: 48 b8 b0 ea 10 00 00 80 ff ff	movabsq	$-140737487246672, %rax # imm = 0xFFFF80000010EAB0
ffff800000112c6b: ff d0                	callq	*%rax
ffff800000112c6d: eb b1                	jmp	0xffff800000112c20 <lab2_check_buddy_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_consistency() succeeded!\n");
ffff800000112c6f: 48 bf 4d 3d 11 00 00 80 ff ff	movabsq	$-140737487225523, %rdi # imm = 0xFFFF800000113D4D
ffff800000112c79: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112c83: 31 c0                	xorl	%eax, %eax
ffff800000112c85: ff d1                	callq	*%rcx
; }
ffff800000112c87: 48 83 c4 08          	addq	$8, %rsp
ffff800000112c8b: 5b                   	popq	%rbx
ffff800000112c8c: 41 5c                	popq	%r12
ffff800000112c8e: 41 5d                	popq	%r13
ffff800000112c90: 41 5e                	popq	%r14
ffff800000112c92: 41 5f                	popq	%r15
ffff800000112c94: 5d                   	popq	%rbp
ffff800000112c95: c3                   	retq
ffff800000112c96: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112ca0 <lab2_check_buddy_full_consistency>:
; {
ffff800000112ca0: 55                   	pushq	%rbp
ffff800000112ca1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112ca4: 41 57                	pushq	%r15
ffff800000112ca6: 41 56                	pushq	%r14
ffff800000112ca8: 41 55                	pushq	%r13
ffff800000112caa: 41 54                	pushq	%r12
ffff800000112cac: 53                   	pushq	%rbx
ffff800000112cad: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff800000112cae: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000112cb8: 48 8b 00             	movq	(%rax), %rax
ffff800000112cbb: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff800000112cbf: 0f 84 f3 00 00 00    	je	0xffff800000112db8 <lab2_check_buddy_full_consistency+0x118>
ffff800000112cc5: 45 31 e4             	xorl	%r12d, %r12d
ffff800000112cc8: 49 be f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r14 # imm = 0xFFFF8000001182F0
ffff800000112cd2: 48 bb 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rbx # imm = 0xFFFF800000110810
ffff800000112cdc: 49 bd 30 2b 11 00 00 80 ff ff	movabsq	$-140737487230160, %r13 # imm = 0xFFFF800000112B30
ffff800000112ce6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff800000112cf0: 4d 8b 3e             	movq	(%r14), %r15
ffff800000112cf3: 4c 89 e7             	movq	%r12, %rdi
ffff800000112cf6: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff800000112d00: ff d0                	callq	*%rax
ffff800000112d02: 4c 89 ff             	movq	%r15, %rdi
ffff800000112d05: 48 89 c6             	movq	%rax, %rsi
ffff800000112d08: 31 d2                	xorl	%edx, %edx
ffff800000112d0a: ff d3                	callq	*%rbx
ffff800000112d0c: 48 85 c0             	testq	%rax, %rax
ffff800000112d0f: 0f 84 ca 00 00 00    	je	0xffff800000112ddf <lab2_check_buddy_full_consistency+0x13f>
;                 if (!page_lookup(kernel_pml4, KADDR(addr), NULL)) {
ffff800000112d15: 4d 8b 3e             	movq	(%r14), %r15
ffff800000112d18: 49 be f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %r14 # imm = 0xFFFF800000113BF6
ffff800000112d22: 4c 89 f7             	movq	%r14, %rdi
ffff800000112d25: be 24 02 00 00       	movl	$548, %esi              # imm = 0x224
ffff800000112d2a: 4c 89 e2             	movq	%r12, %rdx
ffff800000112d2d: 41 ff d5             	callq	*%r13
ffff800000112d30: 4c 89 ff             	movq	%r15, %rdi
ffff800000112d33: 48 89 c6             	movq	%rax, %rsi
ffff800000112d36: 31 d2                	xorl	%edx, %edx
ffff800000112d38: 49 89 df             	movq	%rbx, %r15
ffff800000112d3b: ff d3                	callq	*%rbx
ffff800000112d3d: 48 85 c0             	testq	%rax, %rax
ffff800000112d40: 0f 84 de 00 00 00    	je	0xffff800000112e24 <lab2_check_buddy_full_consistency+0x184>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff800000112d46: be 09 00 00 00       	movl	$9, %esi
ffff800000112d4b: 4c 89 e7             	movq	%r12, %rdi
ffff800000112d4e: 31 d2                	xorl	%edx, %edx
ffff800000112d50: 48 bb b0 ea 10 00 00 80 ff ff	movabsq	$-140737487246672, %rbx # imm = 0xFFFF80000010EAB0
ffff800000112d5a: ff d3                	callq	*%rbx
;                 check_buddy_consistency(PADDR(KADDR(addr)), BUDDY_MAX_ORDER - 1, NULL);
ffff800000112d5c: 4c 89 f7             	movq	%r14, %rdi
ffff800000112d5f: be 2c 02 00 00       	movl	$556, %esi              # imm = 0x22C
ffff800000112d64: 4c 89 e2             	movq	%r12, %rdx
ffff800000112d67: 41 ff d5             	callq	*%r13
ffff800000112d6a: bf 2c 02 00 00       	movl	$556, %edi              # imm = 0x22C
ffff800000112d6f: 48 89 c6             	movq	%rax, %rsi
ffff800000112d72: 48 b8 80 2b 11 00 00 80 ff ff	movabsq	$-140737487230080, %rax # imm = 0xFFFF800000112B80
ffff800000112d7c: ff d0                	callq	*%rax
ffff800000112d7e: be 09 00 00 00       	movl	$9, %esi
ffff800000112d83: 48 89 c7             	movq	%rax, %rdi
ffff800000112d86: 31 d2                	xorl	%edx, %edx
ffff800000112d88: ff d3                	callq	*%rbx
; 	     addr += (1 << PAGE_TABLE_SHIFT)) {
ffff800000112d8a: 49 81 c4 00 10 00 00 	addq	$4096, %r12             # imm = 0x1000
; 	     addr < npages * PAGE_SIZE;
ffff800000112d91: 48 b8 e0 82 11 00 00 80 ff ff	movabsq	$-140737487207712, %rax # imm = 0xFFFF8000001182E0
ffff800000112d9b: 48 8b 00             	movq	(%rax), %rax
ffff800000112d9e: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000112da2: 49 39 c4             	cmpq	%rax, %r12
ffff800000112da5: 49 be f0 82 11 00 00 80 ff ff	movabsq	$-140737487207696, %r14 # imm = 0xFFFF8000001182F0
ffff800000112daf: 4c 89 fb             	movq	%r15, %rbx
; 	for (addr = 0;
ffff800000112db2: 0f 82 38 ff ff ff    	jb	0xffff800000112cf0 <lab2_check_buddy_full_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_full_consistency() succeeded!\n");
ffff800000112db8: 48 bf ba 43 11 00 00 80 ff ff	movabsq	$-140737487223878, %rdi # imm = 0xFFFF8000001143BA
ffff800000112dc2: 48 b9 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rcx # imm = 0xFFFF80000010D400
ffff800000112dcc: 31 c0                	xorl	%eax, %eax
ffff800000112dce: ff d1                	callq	*%rcx
; }
ffff800000112dd0: 48 83 c4 08          	addq	$8, %rsp
ffff800000112dd4: 5b                   	popq	%rbx
ffff800000112dd5: 41 5c                	popq	%r12
ffff800000112dd7: 41 5d                	popq	%r13
ffff800000112dd9: 41 5e                	popq	%r14
ffff800000112ddb: 41 5f                	popq	%r15
ffff800000112ddd: 5d                   	popq	%rbp
ffff800000112dde: c3                   	retq
; 	             panic("Page_info structure number %d is not mapped\n", pa2page(addr) - pages);
ffff800000112ddf: 4c 89 e7             	movq	%r12, %rdi
ffff800000112de2: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff800000112dec: ff d0                	callq	*%rax
ffff800000112dee: 48 b9 e8 82 11 00 00 80 ff ff	movabsq	$-140737487207704, %rcx # imm = 0xFFFF8000001182E8
ffff800000112df8: 48 2b 01             	subq	(%rcx), %rax
ffff800000112dfb: 48 c1 f8 05          	sarq	$5, %rax
ffff800000112dff: 48 bf f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %rdi # imm = 0xFFFF800000113BF6
ffff800000112e09: 48 ba d6 47 11 00 00 80 ff ff	movabsq	$-140737487222826, %rdx # imm = 0xFFFF8000001147D6
ffff800000112e13: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112e1d: be 21 02 00 00       	movl	$545, %esi              # imm = 0x221
ffff800000112e22: eb 34                	jmp	0xffff800000112e58 <lab2_check_buddy_full_consistency+0x1b8>
;                      panic("Kernel address %llx should be mapped\n", KADDR(addr));
ffff800000112e24: 49 be f6 3b 11 00 00 80 ff ff	movabsq	$-140737487225866, %r14 # imm = 0xFFFF800000113BF6
ffff800000112e2e: 4c 89 f7             	movq	%r14, %rdi
ffff800000112e31: be 25 02 00 00       	movl	$549, %esi              # imm = 0x225
ffff800000112e36: 4c 89 e2             	movq	%r12, %rdx
ffff800000112e39: 41 ff d5             	callq	*%r13
ffff800000112e3c: 48 ba a7 3a 11 00 00 80 ff ff	movabsq	$-140737487226201, %rdx # imm = 0xFFFF800000113AA7
ffff800000112e46: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff800000112e50: 4c 89 f7             	movq	%r14, %rdi
ffff800000112e53: be 25 02 00 00       	movl	$549, %esi              # imm = 0x225
ffff800000112e58: 48 89 c1             	movq	%rax, %rcx
ffff800000112e5b: 31 c0                	xorl	%eax, %eax
ffff800000112e5d: ff d3                	callq	*%rbx
ffff800000112e5f: 90                   	nop

ffff800000112e60 <lab2_check_pml4>:
; {
ffff800000112e60: 55                   	pushq	%rbp
ffff800000112e61: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_ptbl_flags();
ffff800000112e64: 48 b8 30 12 11 00 00 80 ff ff	movabsq	$-140737487236560, %rax # imm = 0xFFFF800000111230
ffff800000112e6e: ff d0                	callq	*%rax
; 	lab2_check_wx();
ffff800000112e70: 48 b8 30 13 11 00 00 80 ff ff	movabsq	$-140737487236304, %rax # imm = 0xFFFF800000111330
ffff800000112e7a: ff d0                	callq	*%rax
; 	lab2_check_nx();
ffff800000112e7c: 48 b8 90 13 11 00 00 80 ff ff	movabsq	$-140737487236208, %rax # imm = 0xFFFF800000111390
ffff800000112e86: ff d0                	callq	*%rax
; }
ffff800000112e88: 5d                   	popq	%rbp
ffff800000112e89: c3                   	retq
ffff800000112e8a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000112e90 <lab2_check_paging>:
; {
ffff800000112e90: 55                   	pushq	%rbp
ffff800000112e91: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_4k_paging();
ffff800000112e94: 48 b8 a0 17 11 00 00 80 ff ff	movabsq	$-140737487235168, %rax # imm = 0xFFFF8000001117A0
ffff800000112e9e: ff d0                	callq	*%rax
; }
ffff800000112ea0: 5d                   	popq	%rbp
ffff800000112ea1: c3                   	retq
ffff800000112ea2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112eac: 0f 1f 40 00          	nopl	(%rax)

ffff800000112eb0 <lab2_check_buddy>:
; {
ffff800000112eb0: 55                   	pushq	%rbp
ffff800000112eb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112eb4: 53                   	pushq	%rbx
ffff800000112eb5: 50                   	pushq	%rax
ffff800000112eb6: 48 89 fb             	movq	%rdi, %rbx
; 	lab2_check_free_list_order();
ffff800000112eb9: 48 b8 d0 28 11 00 00 80 ff ff	movabsq	$-140737487230768, %rax # imm = 0xFFFF8000001128D0
ffff800000112ec3: ff d0                	callq	*%rax
; 	lab2_check_memory_layout(boot_info);
ffff800000112ec5: 48 b8 80 29 11 00 00 80 ff ff	movabsq	$-140737487230592, %rax # imm = 0xFFFF800000112980
ffff800000112ecf: 48 89 df             	movq	%rbx, %rdi
ffff800000112ed2: ff d0                	callq	*%rax
; 	lab2_check_buddy_consistency();
ffff800000112ed4: 48 b8 d0 2b 11 00 00 80 ff ff	movabsq	$-140737487230000, %rax # imm = 0xFFFF800000112BD0
ffff800000112ede: ff d0                	callq	*%rax
; 	lab2_check_vas();
ffff800000112ee0: 48 b8 c0 14 11 00 00 80 ff ff	movabsq	$-140737487235904, %rax # imm = 0xFFFF8000001114C0
ffff800000112eea: ff d0                	callq	*%rax
; }
ffff800000112eec: 48 83 c4 08          	addq	$8, %rsp
ffff800000112ef0: 5b                   	popq	%rbx
ffff800000112ef1: 5d                   	popq	%rbp
ffff800000112ef2: c3                   	retq
