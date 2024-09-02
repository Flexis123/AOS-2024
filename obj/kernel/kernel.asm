
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
ffff80000010c004: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
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
ffff80000010c03a: 48 bb 04 40 11 00 00 80 ff ff	movabsq	$-140737487224828, %rbx # imm = 0xFFFF800000114004
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
ffff80000010c121: 48 b8 0c 42 11 00 00 80 ff ff	movabsq	$-140737487224308, %rax # imm = 0xFFFF80000011420C
ffff80000010c12b: 80 08 40             	orb	$64, (%rax)
ffff80000010c12e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c131: e9 e8 00 00 00       	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c136: 48 b9 0c 42 11 00 00 80 ff ff	movabsq	$-140737487224308, %rcx # imm = 0xFFFF80000011420C
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
ffff80000010c155: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff80000010c15f: 0f b6 34 02          	movzbl	(%rdx,%rax), %esi
ffff80000010c163: 0b 31                	orl	(%rcx), %esi
;     shift ^= togglecode[data];
ffff80000010c165: 48 b8 50 01 11 00 00 80 ff ff	movabsq	$-140737487240880, %rax # imm = 0xFFFF800000110150
ffff80000010c16f: 0f b6 04 02          	movzbl	(%rdx,%rax), %eax
ffff80000010c173: 31 f0                	xorl	%esi, %eax
ffff80000010c175: 89 01                	movl	%eax, (%rcx)
;     c = charcode[shift & (CTL | SHIFT)][data];
ffff80000010c177: 89 c1                	movl	%eax, %ecx
ffff80000010c179: 83 e1 03             	andl	$3, %ecx
ffff80000010c17c: 48 be 30 00 11 00 00 80 ff ff	movabsq	$-140737487241168, %rsi # imm = 0xFFFF800000110030
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
ffff80000010c1b3: 48 be 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rsi # imm = 0xFFFF800000110050
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
ffff80000010c1f0: 48 bf 9e 0a 11 00 00 80 ff ff	movabsq	$-140737487238498, %rdi # imm = 0xFFFF800000110A9E
ffff80000010c1fa: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
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
ffff80000010c24c: 48 b9 04 40 11 00 00 80 ff ff	movabsq	$-140737487224828, %rcx # imm = 0xFFFF800000114004
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
ffff80000010c2b8: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
ffff80000010c2c2: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c2c5: 74 02                	je	0xffff80000010c2c9 <cons_init+0x39>
; }
ffff80000010c2c7: 5d                   	popq	%rbp
ffff80000010c2c8: c3                   	retq
;         cprintf("Serial port does not exist!\n");
ffff80000010c2c9: 48 bf 4b 0e 11 00 00 80 ff ff	movabsq	$-140737487237557, %rdi # imm = 0xFFFF800000110E4B
ffff80000010c2d3: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
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
ffff80000010c339: 49 be 10 42 11 00 00 80 ff ff	movabsq	$-140737487224304, %r14 # imm = 0xFFFF800000114210
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
ffff80000010c391: 48 b9 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rcx # imm = 0xFFFF800000114218
ffff80000010c39b: 4c 89 29             	movq	%r13, (%rcx)
;     crt_pos = pos;
ffff80000010c39e: 48 b9 20 42 11 00 00 80 ff ff	movabsq	$-140737487224288, %rcx # imm = 0xFFFF800000114220
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
ffff80000010c3d0: 48 b8 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rax # imm = 0xFFFF80000010D220
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
ffff80000010c45e: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
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
ffff80000010c64d: 49 be 20 42 11 00 00 80 ff ff	movabsq	$-140737487224288, %r14 # imm = 0xFFFF800000114220
ffff80000010c657: 80 f9 05             	cmpb	$5, %cl
ffff80000010c65a: 0f 87 8f 00 00 00    	ja	0xffff80000010c6ef <cga_putc+0xbf>
ffff80000010c660: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010c663: 48 ba 00 00 11 00 00 80 ff ff	movabsq	$-140737487241216, %rdx # imm = 0xFFFF800000110000
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
ffff80000010c68c: 48 ba 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rdx # imm = 0xFFFF800000114218
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
ffff80000010c6ef: 48 b9 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rcx # imm = 0xFFFF800000114218
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
ffff80000010c716: 48 bb 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rbx # imm = 0xFFFF800000114218
ffff80000010c720: 48 8b 3b             	movq	(%rbx), %rdi
ffff80000010c723: 48 8d b7 a0 00 00 00 	leaq	160(%rdi), %rsi
ffff80000010c72a: 48 b8 00 f8 10 00 00 80 ff ff	movabsq	$-140737487243264, %rax # imm = 0xFFFF80000010F800
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
ffff80000010c759: 48 bb 10 42 11 00 00 80 ff ff	movabsq	$-140737487224304, %rbx # imm = 0xFFFF800000114210
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
ffff80000010c7f9: 48 bf 00 33 11 00 00 80 ff ff	movabsq	$-140737487228160, %rdi # imm = 0xFFFF800000113300
ffff80000010c803: 48 ba f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rdx # imm = 0xFFFF8000001146F0
ffff80000010c80d: 48 29 fa             	subq	%rdi, %rdx
ffff80000010c810: 48 b8 b0 f7 10 00 00 80 ff ff	movabsq	$-140737487243344, %rax # imm = 0xFFFF80000010F7B0
ffff80000010c81a: 31 f6                	xorl	%esi, %esi
ffff80000010c81c: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010c81e: 48 b8 90 c2 10 00 00 80 ff ff	movabsq	$-140737487256944, %rax # imm = 0xFFFF80000010C290
ffff80000010c828: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c82a: 48 bf b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %rdi # imm = 0xFFFF800000110DB0
ffff80000010c834: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010c83e: 31 c0                	xorl	%eax, %eax
ffff80000010c840: ff d1                	callq	*%rcx
; 	mem_init(boot_info);
ffff80000010c842: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff80000010c84c: 48 89 df             	movq	%rbx, %rdi
ffff80000010c84f: ff d0                	callq	*%rax
ffff80000010c851: 48 bb 60 ce 10 00 00 80 ff ff	movabsq	$-140737487253920, %rbx # imm = 0xFFFF80000010CE60
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
ffff80000010c887: 48 b8 28 42 11 00 00 80 ff ff	movabsq	$-140737487224280, %rax # imm = 0xFFFF800000114228
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
ffff80000010c8c2: 48 bf 56 09 11 00 00 80 ff ff	movabsq	$-140737487238826, %rdi # imm = 0xFFFF800000110956
ffff80000010c8cc: 49 be c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r14 # imm = 0xFFFF80000010D3C0
ffff80000010c8d6: 31 c0                	xorl	%eax, %eax
ffff80000010c8d8: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c8db: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010c8e5: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c8e9: 48 89 df             	movq	%rbx, %rdi
ffff80000010c8ec: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c8ee: 48 bf b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %rdi # imm = 0xFFFF800000110DB0
ffff80000010c8f8: 31 c0                	xorl	%eax, %eax
ffff80000010c8fa: 41 ff d6             	callq	*%r14
ffff80000010c8fd: 48 bb 60 ce 10 00 00 80 ff ff	movabsq	$-140737487253920, %rbx # imm = 0xFFFF80000010CE60
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
ffff80000010c95d: 48 bf b2 0d 11 00 00 80 ff ff	movabsq	$-140737487237710, %rdi # imm = 0xFFFF800000110DB2
ffff80000010c967: 49 be c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r14 # imm = 0xFFFF80000010D3C0
ffff80000010c971: 31 c0                	xorl	%eax, %eax
ffff80000010c973: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c976: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010c980: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c984: 48 89 df             	movq	%rbx, %rdi
ffff80000010c987: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c989: 48 bf b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %rdi # imm = 0xFFFF800000110DB0
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
ffff80000010c9c0: 49 bf 50 02 11 00 00 80 ff ff	movabsq	$-140737487240624, %r15 # imm = 0xFFFF800000110250
ffff80000010c9ca: 49 be cc 0d 11 00 00 80 ff ff	movabsq	$-140737487237684, %r14 # imm = 0xFFFF800000110DCC
ffff80000010c9d4: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010c9de: 66 90                	nop
; 		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffff80000010c9e0: 4a 8b 74 3b f8       	movq	-8(%rbx,%r15), %rsi
ffff80000010c9e5: 4a 8b 14 3b          	movq	(%rbx,%r15), %rdx
ffff80000010c9e9: 4c 89 f7             	movq	%r14, %rdi
ffff80000010c9ec: 31 c0                	xorl	%eax, %eax
ffff80000010c9ee: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < NCOMMANDS; i++)
ffff80000010c9f1: 48 83 c3 18          	addq	$24, %rbx
ffff80000010c9f5: 48 81 fb 80 00 00 00 	cmpq	$128, %rbx
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
ffff80000010ca1b: 48 bf 66 0b 11 00 00 80 ff ff	movabsq	$-140737487238298, %rdi # imm = 0xFFFF800000110B66
ffff80000010ca25: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010ca2f: 31 c0                	xorl	%eax, %eax
ffff80000010ca31: 41 ff d4             	callq	*%r12
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010ca34: 48 bf 9e 0e 11 00 00 80 ff ff	movabsq	$-140737487237474, %rdi # imm = 0xFFFF800000110E9E
ffff80000010ca3e: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ca48: 31 c0                	xorl	%eax, %eax
ffff80000010ca4a: 41 ff d4             	callq	*%r12
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010ca4d: 48 bf 63 08 11 00 00 80 ff ff	movabsq	$-140737487239069, %rdi # imm = 0xFFFF800000110863
ffff80000010ca57: 49 bf 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r15 # imm = 0x800000000000
ffff80000010ca61: 49 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %r14 # imm = 0xFFFF800000100000
ffff80000010ca6b: 4b 8d 14 3e          	leaq	(%r14,%r15), %rdx
ffff80000010ca6f: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ca72: 31 c0                	xorl	%eax, %eax
ffff80000010ca74: 41 ff d4             	callq	*%r12
; 	cprintf("  etext  %016p (virt)  %016p (phys)\n", etext, etext - KERNEL_VMA);
ffff80000010ca77: 48 bf e4 09 11 00 00 80 ff ff	movabsq	$-140737487238684, %rdi # imm = 0xFFFF8000001109E4
ffff80000010ca81: 48 be e0 f9 10 00 00 80 ff ff	movabsq	$-140737487242784, %rsi # imm = 0xFFFF80000010F9E0
ffff80000010ca8b: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010ca8f: 31 c0                	xorl	%eax, %eax
ffff80000010ca91: 41 ff d4             	callq	*%r12
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010ca94: 48 bf 6e 09 11 00 00 80 ff ff	movabsq	$-140737487238802, %rdi # imm = 0xFFFF80000011096E
ffff80000010ca9e: 48 be 00 33 11 00 00 80 ff ff	movabsq	$-140737487228160, %rsi # imm = 0xFFFF800000113300
ffff80000010caa8: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010caac: 31 c0                	xorl	%eax, %eax
ffff80000010caae: 41 ff d4             	callq	*%r12
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cab1: 48 bf 88 08 11 00 00 80 ff ff	movabsq	$-140737487239032, %rdi # imm = 0xFFFF800000110888
ffff80000010cabb: 48 bb f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rbx # imm = 0xFFFF8000001146F0
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
ffff80000010caf6: 48 bf 27 0c 11 00 00 80 ff ff	movabsq	$-140737487238105, %rdi # imm = 0xFFFF800000110C27
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
ffff80000010cb2d: 48 bf 10 07 11 00 00 80 ff ff	movabsq	$-140737487239408, %rdi # imm = 0xFFFF800000110710
ffff80000010cb37: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010cb41: 31 c0                	xorl	%eax, %eax
ffff80000010cb43: 41 ff d4             	callq	*%r12
; 	while (rbp) {
ffff80000010cb46: 48 85 db             	testq	%rbx, %rbx
ffff80000010cb49: 0f 84 97 00 00 00    	je	0xffff80000010cbe6 <mon_backtrace+0xd6>
ffff80000010cb4f: 49 be d2 0c 11 00 00 80 ff ff	movabsq	$-140737487237934, %r14 # imm = 0xFFFF800000110CD2
ffff80000010cb59: 49 bf b0 0d 11 00 00 80 ff ff	movabsq	$-140737487237712, %r15 # imm = 0xFFFF800000110DB0
ffff80000010cb63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cb6d: 0f 1f 00             	nopl	(%rax)
; 		uintptr_t rip = *(rbp + 1);
ffff80000010cb70: 48 8b 73 08          	movq	8(%rbx), %rsi
; 		cprintf("  RIP: %016p ", rip);
ffff80000010cb74: 48 bf 9a 0f 11 00 00 80 ff ff	movabsq	$-140737487237222, %rdi # imm = 0xFFFF800000110F9A
ffff80000010cb7e: 31 c0                	xorl	%eax, %eax
ffff80000010cb80: 41 ff d4             	callq	*%r12
; 		cprintf("<no debug info>\t");
ffff80000010cb83: 48 bf d5 0d 11 00 00 80 ff ff	movabsq	$-140737487237675, %rdi # imm = 0xFFFF800000110DD5
ffff80000010cb8d: 31 c0                	xorl	%eax, %eax
ffff80000010cb8f: 41 ff d4             	callq	*%r12
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010cb92: 48 bf 18 0d 11 00 00 80 ff ff	movabsq	$-140737487237864, %rdi # imm = 0xFFFF800000110D18
ffff80000010cb9c: 48 89 de             	movq	%rbx, %rsi
ffff80000010cb9f: 31 c0                	xorl	%eax, %eax
ffff80000010cba1: 41 ff d4             	callq	*%r12
; 			cprintf("  args ");
ffff80000010cba4: 48 bf d4 0a 11 00 00 80 ff ff	movabsq	$-140737487238444, %rdi # imm = 0xFFFF800000110AD4
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
ffff80000010cc14: 48 b8 f0 d6 10 00 00 80 ff ff	movabsq	$-140737487251728, %rax # imm = 0xFFFF80000010D6F0
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
ffff80000010cc3e: 49 bf e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %r15 # imm = 0xFFFF8000001142E8
ffff80000010cc48: 49 83 3f 00          	cmpq	$0, (%r15)
ffff80000010cc4c: 0f 84 81 00 00 00    	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc52: 49 bc e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %r12 # imm = 0xFFFF8000001142E0
; 	if (!pages || npages == 0) {
ffff80000010cc5c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010cc61: 74 70                	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc63: 48 89 f3             	movq	%rsi, %rbx
; 	if (argc < 3) {
ffff80000010cc66: 83 ff 02             	cmpl	$2, %edi
ffff80000010cc69: 7e 4b                	jle	0xffff80000010ccb6 <mon_pageinfo+0x86>
; 	addr = strtol(argv[2], NULL, 0);
ffff80000010cc6b: 48 8b 7b 10          	movq	16(%rbx), %rdi
ffff80000010cc6f: 48 b8 f0 f8 10 00 00 80 ff ff	movabsq	$-140737487243024, %rax # imm = 0xFFFF80000010F8F0
ffff80000010cc79: 31 f6                	xorl	%esi, %esi
ffff80000010cc7b: 31 d2                	xorl	%edx, %edx
ffff80000010cc7d: ff d0                	callq	*%rax
ffff80000010cc7f: 49 89 c6             	movq	%rax, %r14
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010cc82: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cc86: 48 be 55 0c 11 00 00 80 ff ff	movabsq	$-140737487238059, %rsi # imm = 0xFFFF800000110C55
ffff80000010cc90: 49 bd e0 f6 10 00 00 80 ff ff	movabsq	$-140737487243552, %r13 # imm = 0xFFFF80000010F6E0
ffff80000010cc9a: 41 ff d5             	callq	*%r13
ffff80000010cc9d: 85 c0                	testl	%eax, %eax
ffff80000010cc9f: 74 5b                	je	0xffff80000010ccfc <mon_pageinfo+0xcc>
; 	} else if (strcmp(argv[1], "pa") == 0) {
ffff80000010cca1: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cca5: 48 be d0 0e 11 00 00 80 ff ff	movabsq	$-140737487237424, %rsi # imm = 0xFFFF800000110ED0
ffff80000010ccaf: 41 ff d5             	callq	*%r13
ffff80000010ccb2: 85 c0                	testl	%eax, %eax
ffff80000010ccb4: 74 5c                	je	0xffff80000010cd12 <mon_pageinfo+0xe2>
ffff80000010ccb6: 48 8b 33             	movq	(%rbx), %rsi
ffff80000010ccb9: 48 bf ad 08 11 00 00 80 ff ff	movabsq	$-140737487238995, %rdi # imm = 0xFFFF8000001108AD
ffff80000010ccc3: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010cccd: 31 c0                	xorl	%eax, %eax
ffff80000010cccf: ff d1                	callq	*%rcx
ffff80000010ccd1: eb 18                	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 		cprintf("error: buddy allocator not set up\n");
ffff80000010ccd3: 48 bf a0 07 11 00 00 80 ff ff	movabsq	$-140737487239264, %rdi # imm = 0xFFFF8000001107A0
ffff80000010ccdd: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
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
ffff80000010cd2e: 48 bf c3 07 11 00 00 80 ff ff	movabsq	$-140737487239229, %rdi # imm = 0xFFFF8000001107C3
ffff80000010cd38: 49 bf c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r15 # imm = 0xFFFF80000010D3C0
ffff80000010cd42: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cd45: 31 c0                	xorl	%eax, %eax
ffff80000010cd47: 41 ff d7             	callq	*%r15
; 	cprintf("  Physical address: %p\n", page2pa(page));
ffff80000010cd4a: 48 b8 40 ce 10 00 00 80 ff ff	movabsq	$-140737487253952, %rax # imm = 0xFFFF80000010CE40
ffff80000010cd54: 48 89 df             	movq	%rbx, %rdi
ffff80000010cd57: ff d0                	callq	*%rax
ffff80000010cd59: 48 bf d5 07 11 00 00 80 ff ff	movabsq	$-140737487239211, %rdi # imm = 0xFFFF8000001107D5
ffff80000010cd63: 48 89 c6             	movq	%rax, %rsi
ffff80000010cd66: 31 c0                	xorl	%eax, %eax
ffff80000010cd68: 41 ff d7             	callq	*%r15
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010cd6b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000010cd6f: 48 b8 ff 0e 11 00 00 80 ff ff	movabsq	$-140737487237377, %rax # imm = 0xFFFF800000110EFF
ffff80000010cd79: 48 be 4a 0a 11 00 00 80 ff ff	movabsq	$-140737487238582, %rsi # imm = 0xFFFF800000110A4A
ffff80000010cd83: 48 0f 49 f0          	cmovnsq	%rax, %rsi
ffff80000010cd87: 48 bf aa 0a 11 00 00 80 ff ff	movabsq	$-140737487238486, %rdi # imm = 0xFFFF800000110AAA
ffff80000010cd91: 31 c0                	xorl	%eax, %eax
ffff80000010cd93: 41 ff d7             	callq	*%r15
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010cd96: 0f b7 73 10          	movzwl	16(%rbx), %esi
ffff80000010cd9a: 48 bf 04 0f 11 00 00 80 ff ff	movabsq	$-140737487237372, %rdi # imm = 0xFFFF800000110F04
ffff80000010cda4: 31 c0                	xorl	%eax, %eax
ffff80000010cda6: 41 ff d7             	callq	*%r15
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010cda9: 0f b6 73 12          	movzbl	18(%rbx), %esi
ffff80000010cdad: 83 e6 7f             	andl	$127, %esi
ffff80000010cdb0: 48 bf 8d 0f 11 00 00 80 ff ff	movabsq	$-140737487237235, %rdi # imm = 0xFFFF800000110F8D
ffff80000010cdba: 31 c0                	xorl	%eax, %eax
ffff80000010cdbc: 41 ff d7             	callq	*%r15
ffff80000010cdbf: e9 27 ff ff ff       	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
; 			cprintf("error: index %u out of range.\n", addr);
ffff80000010cdc4: 48 bf 93 09 11 00 00 80 ff ff	movabsq	$-140737487238765, %rdi # imm = 0xFFFF800000110993
ffff80000010cdce: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010cdd8: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cddb: e9 ed fe ff ff       	jmp	0xffff80000010cccd <mon_pageinfo+0x9d>

ffff80000010cde0 <pa2page>:
; {
ffff80000010cde0: 55                   	pushq	%rbp
ffff80000010cde1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010cde4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010cde8: 48 b8 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rax # imm = 0xFFFF8000001142E0
ffff80000010cdf2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010cdf5: 73 16                	jae	0xffff80000010ce0d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010cdf7: 48 b8 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rax # imm = 0xFFFF8000001142E8
ffff80000010ce01: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ce05: 48 03 38             	addq	(%rax), %rdi
ffff80000010ce08: 48 89 f8             	movq	%rdi, %rax
ffff80000010ce0b: 5d                   	popq	%rbp
ffff80000010ce0c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010ce0d: 48 bf 23 08 11 00 00 80 ff ff	movabsq	$-140737487239133, %rdi # imm = 0xFFFF800000110823
ffff80000010ce17: 48 ba 16 0f 11 00 00 80 ff ff	movabsq	$-140737487237354, %rdx # imm = 0xFFFF800000110F16
ffff80000010ce21: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010ce2b: be 47 00 00 00       	movl	$71, %esi
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
ffff80000010ce47: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010ce51: 48 2b 01             	subq	(%rcx), %rax
ffff80000010ce54: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010ce58: 5d                   	popq	%rbp
ffff80000010ce59: c3                   	retq
ffff80000010ce5a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ce60 <monitor>:
; {
ffff80000010ce60: 55                   	pushq	%rbp
ffff80000010ce61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce64: 41 57                	pushq	%r15
ffff80000010ce66: 41 56                	pushq	%r14
ffff80000010ce68: 41 54                	pushq	%r12
ffff80000010ce6a: 53                   	pushq	%rbx
ffff80000010ce6b: 49 89 fe             	movq	%rdi, %r14
; 	cprintf("Welcome to the OpenLSD kernel monitor!\n");
ffff80000010ce6e: 48 bf 88 0d 11 00 00 80 ff ff	movabsq	$-140737487237752, %rdi # imm = 0xFFFF800000110D88
ffff80000010ce78: 48 bb c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rbx # imm = 0xFFFF80000010D3C0
ffff80000010ce82: 31 c0                	xorl	%eax, %eax
ffff80000010ce84: ff d3                	callq	*%rbx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010ce86: 48 bf 09 0a 11 00 00 80 ff ff	movabsq	$-140737487238647, %rdi # imm = 0xFFFF800000110A09
ffff80000010ce90: 31 c0                	xorl	%eax, %eax
ffff80000010ce92: ff d3                	callq	*%rbx
ffff80000010ce94: 49 bf 7f 0b 11 00 00 80 ff ff	movabsq	$-140737487238273, %r15 # imm = 0xFFFF800000110B7F
ffff80000010ce9e: 48 bb 60 f4 10 00 00 80 ff ff	movabsq	$-140737487244192, %rbx # imm = 0xFFFF80000010F460
ffff80000010cea8: 49 bc e0 ce 10 00 00 80 ff ff	movabsq	$-140737487253792, %r12 # imm = 0xFFFF80000010CEE0
ffff80000010ceb2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cebc: 0f 1f 40 00          	nopl	(%rax)
; 		buf = readline("K> ");
ffff80000010cec0: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cec3: ff d3                	callq	*%rbx
; 		if (buf != NULL)
ffff80000010cec5: 48 85 c0             	testq	%rax, %rax
ffff80000010cec8: 74 f6                	je	0xffff80000010cec0 <monitor+0x60>
; 			if (runcmd(buf, frame) < 0)
ffff80000010ceca: 48 89 c7             	movq	%rax, %rdi
ffff80000010cecd: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ced0: 41 ff d4             	callq	*%r12
ffff80000010ced3: 85 c0                	testl	%eax, %eax
ffff80000010ced5: 79 e9                	jns	0xffff80000010cec0 <monitor+0x60>
; }
ffff80000010ced7: 5b                   	popq	%rbx
ffff80000010ced8: 41 5c                	popq	%r12
ffff80000010ceda: 41 5e                	popq	%r14
ffff80000010cedc: 41 5f                	popq	%r15
ffff80000010cede: 5d                   	popq	%rbp
ffff80000010cedf: c3                   	retq

ffff80000010cee0 <runcmd>:
; {
ffff80000010cee0: 55                   	pushq	%rbp
ffff80000010cee1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cee4: 41 57                	pushq	%r15
ffff80000010cee6: 41 56                	pushq	%r14
ffff80000010cee8: 41 55                	pushq	%r13
ffff80000010ceea: 41 54                	pushq	%r12
ffff80000010ceec: 53                   	pushq	%rbx
ffff80000010ceed: 48 81 ec 88 00 00 00 	subq	$136, %rsp
ffff80000010cef4: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010cef8: 49 89 fe             	movq	%rdi, %r14
; 	argv[argc] = 0;
ffff80000010cefb: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff80000010cf06: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010cf09: 49 bc ff 0f 11 00 00 80 ff ff	movabsq	$-140737487237121, %r12 # imm = 0xFFFF800000110FFF
ffff80000010cf13: 49 bd 50 f7 10 00 00 80 ff ff	movabsq	$-140737487243440, %r13 # imm = 0xFFFF80000010F750
ffff80000010cf1d: 0f 1f 00             	nopl	(%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf20: 41 8a 06             	movb	(%r14), %al
ffff80000010cf23: 84 c0                	testb	%al, %al
ffff80000010cf25: 74 3c                	je	0xffff80000010cf63 <runcmd+0x83>
ffff80000010cf27: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf2a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf30: 0f be f0             	movsbl	%al, %esi
ffff80000010cf33: 4c 89 e7             	movq	%r12, %rdi
ffff80000010cf36: 41 ff d5             	callq	*%r13
ffff80000010cf39: 48 85 c0             	testq	%rax, %rax
ffff80000010cf3c: 74 22                	je	0xffff80000010cf60 <runcmd+0x80>
; 			*buf++ = 0;
ffff80000010cf3e: 4c 8d 73 01          	leaq	1(%rbx), %r14
ffff80000010cf42: c6 03 00             	movb	$0, (%rbx)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010cf45: 0f b6 43 01          	movzbl	1(%rbx), %eax
ffff80000010cf49: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf4c: 84 c0                	testb	%al, %al
ffff80000010cf4e: 75 e0                	jne	0xffff80000010cf30 <runcmd+0x50>
ffff80000010cf50: eb 11                	jmp	0xffff80000010cf63 <runcmd+0x83>
ffff80000010cf52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf5c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cf60: 49 89 de             	movq	%rbx, %r14
; 		if (*buf == 0)
ffff80000010cf63: 41 80 3e 00          	cmpb	$0, (%r14)
ffff80000010cf67: 74 48                	je	0xffff80000010cfb1 <runcmd+0xd1>
; 		if (argc == MAXARGS-1) {
ffff80000010cf69: 49 83 ff 0f          	cmpq	$15, %r15
ffff80000010cf6d: 0f 84 ac 00 00 00    	je	0xffff80000010d01f <runcmd+0x13f>
; 		argv[argc++] = buf;
ffff80000010cf73: 4e 89 b4 fd 50 ff ff ff      	movq	%r14, -176(%rbp,%r15,8)
ffff80000010cf7b: 49 83 c7 01          	addq	$1, %r15
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010cf7f: 41 8a 06             	movb	(%r14), %al
ffff80000010cf82: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf8c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cf90: 84 c0                	testb	%al, %al
ffff80000010cf92: 74 8c                	je	0xffff80000010cf20 <runcmd+0x40>
ffff80000010cf94: 0f be f0             	movsbl	%al, %esi
ffff80000010cf97: 4c 89 e7             	movq	%r12, %rdi
ffff80000010cf9a: 41 ff d5             	callq	*%r13
ffff80000010cf9d: 48 85 c0             	testq	%rax, %rax
ffff80000010cfa0: 0f 85 7a ff ff ff    	jne	0xffff80000010cf20 <runcmd+0x40>
ffff80000010cfa6: 41 0f b6 46 01       	movzbl	1(%r14), %eax
; 			buf++;
ffff80000010cfab: 49 83 c6 01          	addq	$1, %r14
ffff80000010cfaf: eb df                	jmp	0xffff80000010cf90 <runcmd+0xb0>
; 	argv[argc] = 0;
ffff80000010cfb1: 44 89 f8             	movl	%r15d, %eax
ffff80000010cfb4: 48 c7 84 c5 50 ff ff ff 00 00 00 00  	movq	$0, -176(%rbp,%rax,8)
; 	if (argc == 0)
ffff80000010cfc0: 45 85 ff             	testl	%r15d, %r15d
ffff80000010cfc3: 74 7b                	je	0xffff80000010d040 <runcmd+0x160>
ffff80000010cfc5: 31 db                	xorl	%ebx, %ebx
ffff80000010cfc7: 49 bc 50 02 11 00 00 80 ff ff	movabsq	$-140737487240624, %r12 # imm = 0xFFFF800000110250
ffff80000010cfd1: 49 bd e0 f6 10 00 00 80 ff ff	movabsq	$-140737487243552, %r13 # imm = 0xFFFF80000010F6E0
ffff80000010cfdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (strcmp(argv[0], commands[i].name) == 0)
ffff80000010cfe0: 48 8b bd 50 ff ff ff 	movq	-176(%rbp), %rdi
ffff80000010cfe7: 4a 8b 34 23          	movq	(%rbx,%r12), %rsi
ffff80000010cfeb: 41 ff d5             	callq	*%r13
ffff80000010cfee: 85 c0                	testl	%eax, %eax
ffff80000010cff0: 74 52                	je	0xffff80000010d044 <runcmd+0x164>
; 	for (i = 0; i < NCOMMANDS; i++) {
ffff80000010cff2: 48 83 c3 18          	addq	$24, %rbx
ffff80000010cff6: 48 83 fb 78          	cmpq	$120, %rbx
ffff80000010cffa: 75 e4                	jne	0xffff80000010cfe0 <runcmd+0x100>
; 	cprintf("Unknown command '%s'\n", argv[0]);
ffff80000010cffc: 48 8b b5 50 ff ff ff 	movq	-176(%rbp), %rsi
ffff80000010d003: 48 bf 5c 07 11 00 00 80 ff ff	movabsq	$-140737487239332, %rdi # imm = 0xFFFF80000011075C
ffff80000010d00d: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d017: 31 db                	xorl	%ebx, %ebx
ffff80000010d019: 31 c0                	xorl	%eax, %eax
ffff80000010d01b: ff d1                	callq	*%rcx
ffff80000010d01d: eb 3a                	jmp	0xffff80000010d059 <runcmd+0x179>
; 			cprintf("Too many arguments (max %d)\n", MAXARGS);
ffff80000010d01f: 48 bf b7 0a 11 00 00 80 ff ff	movabsq	$-140737487238473, %rdi # imm = 0xFFFF800000110AB7
ffff80000010d029: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d033: 31 db                	xorl	%ebx, %ebx
ffff80000010d035: be 10 00 00 00       	movl	$16, %esi
ffff80000010d03a: 31 c0                	xorl	%eax, %eax
ffff80000010d03c: ff d1                	callq	*%rcx
ffff80000010d03e: eb 19                	jmp	0xffff80000010d059 <runcmd+0x179>
ffff80000010d040: 31 db                	xorl	%ebx, %ebx
ffff80000010d042: eb 15                	jmp	0xffff80000010d059 <runcmd+0x179>
ffff80000010d044: 48 8d b5 50 ff ff ff 	leaq	-176(%rbp), %rsi
; 			return commands[i].func(argc, argv, frame);
ffff80000010d04b: 44 89 ff             	movl	%r15d, %edi
ffff80000010d04e: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff80000010d052: 41 ff 54 1c 10       	callq	*16(%r12,%rbx)
ffff80000010d057: 89 c3                	movl	%eax, %ebx
; }
ffff80000010d059: 89 d8                	movl	%ebx, %eax
ffff80000010d05b: 48 81 c4 88 00 00 00 	addq	$136, %rsp
ffff80000010d062: 5b                   	popq	%rbx
ffff80000010d063: 41 5c                	popq	%r12
ffff80000010d065: 41 5d                	popq	%r13
ffff80000010d067: 41 5e                	popq	%r14
ffff80000010d069: 41 5f                	popq	%r15
ffff80000010d06b: 5d                   	popq	%rbp
ffff80000010d06c: c3                   	retq
ffff80000010d06d: cc                   	int3
ffff80000010d06e: cc                   	int3
ffff80000010d06f: cc                   	int3

ffff80000010d070 <pic_remap>:
; {
ffff80000010d070: 55                   	pushq	%rbp
ffff80000010d071: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d074: 41 57                	pushq	%r15
ffff80000010d076: 41 56                	pushq	%r14
ffff80000010d078: 41 55                	pushq	%r13
ffff80000010d07a: 41 54                	pushq	%r12
ffff80000010d07c: 53                   	pushq	%rbx
ffff80000010d07d: 50                   	pushq	%rax
ffff80000010d07e: 41 89 f4             	movl	%esi, %r12d
ffff80000010d081: 41 89 fd             	movl	%edi, %r13d
; 	masks[0] = inb(PIC1_DATA);
ffff80000010d084: 48 bb 30 d1 10 00 00 80 ff ff	movabsq	$-140737487253200, %rbx # imm = 0xFFFF80000010D130
ffff80000010d08e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d093: ff d3                	callq	*%rbx
ffff80000010d095: 41 89 c7             	movl	%eax, %r15d
; 	masks[1] = inb(PIC2_DATA);
ffff80000010d098: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d09d: ff d3                	callq	*%rbx
ffff80000010d09f: 41 89 c6             	movl	%eax, %r14d
; 	outb(PIC1_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d0a2: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
ffff80000010d0ac: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d0b1: be 11 00 00 00       	movl	$17, %esi
ffff80000010d0b6: ff d3                	callq	*%rbx
; 	outb(PIC2_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d0b8: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d0bd: be 11 00 00 00       	movl	$17, %esi
ffff80000010d0c2: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, offset1);
ffff80000010d0c4: 41 0f b6 f5          	movzbl	%r13b, %esi
ffff80000010d0c8: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0cd: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, offset2);
ffff80000010d0cf: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff80000010d0d3: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d0d8: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, 1 << IRQ_SLAVE);
ffff80000010d0da: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0df: be 04 00 00 00       	movl	$4, %esi
ffff80000010d0e4: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, IRQ_SLAVE);
ffff80000010d0e6: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d0eb: be 02 00 00 00       	movl	$2, %esi
ffff80000010d0f0: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, PIC_ICW4_8086 | PIC_ICW4_AUTO);
ffff80000010d0f2: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0f7: be 03 00 00 00       	movl	$3, %esi
ffff80000010d0fc: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, PIC_ICW4_8086);
ffff80000010d0fe: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d103: be 01 00 00 00       	movl	$1, %esi
ffff80000010d108: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, masks[0]);
ffff80000010d10a: 41 0f b6 f7          	movzbl	%r15b, %esi
ffff80000010d10e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d113: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, masks[1]);
ffff80000010d115: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010d119: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d11e: ff d3                	callq	*%rbx
; }
ffff80000010d120: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d124: 5b                   	popq	%rbx
ffff80000010d125: 41 5c                	popq	%r12
ffff80000010d127: 41 5d                	popq	%r13
ffff80000010d129: 41 5e                	popq	%r14
ffff80000010d12b: 41 5f                	popq	%r15
ffff80000010d12d: 5d                   	popq	%rbp
ffff80000010d12e: c3                   	retq
ffff80000010d12f: 90                   	nop

ffff80000010d130 <inb>:
; {
ffff80000010d130: 55                   	pushq	%rbp
ffff80000010d131: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010d134: 89 fa                	movl	%edi, %edx
ffff80000010d136: ec                   	inb	%dx, %al
; 	return data;
ffff80000010d137: 5d                   	popq	%rbp
ffff80000010d138: c3                   	retq
ffff80000010d139: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d140 <outb>:
; {
ffff80000010d140: 55                   	pushq	%rbp
ffff80000010d141: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d144: 89 f0                	movl	%esi, %eax
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010d146: 89 fa                	movl	%edi, %edx
ffff80000010d148: ee                   	outb	%al, %dx
; }
ffff80000010d149: 5d                   	popq	%rbp
ffff80000010d14a: c3                   	retq
ffff80000010d14b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d150 <pic_get_reg>:
; {
ffff80000010d150: 55                   	pushq	%rbp
ffff80000010d151: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d154: 41 56                	pushq	%r14
ffff80000010d156: 53                   	pushq	%rbx
; 	outb(PIC1_CMD, ocw3);
ffff80000010d157: 40 0f b6 df          	movzbl	%dil, %ebx
ffff80000010d15b: 49 be 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %r14 # imm = 0xFFFF80000010D140
ffff80000010d165: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d16a: 89 de                	movl	%ebx, %esi
ffff80000010d16c: 41 ff d6             	callq	*%r14
; 	outb(PIC2_CMD, ocw3);
ffff80000010d16f: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d174: 89 de                	movl	%ebx, %esi
ffff80000010d176: 41 ff d6             	callq	*%r14
; 	return (inb(PIC2_CMD) << 8) | inb(PIC1_CMD);
ffff80000010d179: 49 be 30 d1 10 00 00 80 ff ff	movabsq	$-140737487253200, %r14 # imm = 0xFFFF80000010D130
ffff80000010d183: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d188: 41 ff d6             	callq	*%r14
ffff80000010d18b: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010d18e: c1 e3 08             	shll	$8, %ebx
ffff80000010d191: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d196: 41 ff d6             	callq	*%r14
ffff80000010d199: 0f b6 c0             	movzbl	%al, %eax
ffff80000010d19c: 09 d8                	orl	%ebx, %eax
ffff80000010d19e: 5b                   	popq	%rbx
ffff80000010d19f: 41 5e                	popq	%r14
ffff80000010d1a1: 5d                   	popq	%rbp
ffff80000010d1a2: c3                   	retq
ffff80000010d1a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d1ad: 0f 1f 00             	nopl	(%rax)

ffff80000010d1b0 <pic_get_irr>:
; {
ffff80000010d1b0: 55                   	pushq	%rbp
ffff80000010d1b1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_IRR);
ffff80000010d1b4: 48 b8 50 d1 10 00 00 80 ff ff	movabsq	$-140737487253168, %rax # imm = 0xFFFF80000010D150
ffff80000010d1be: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010d1c3: ff d0                	callq	*%rax
ffff80000010d1c5: 5d                   	popq	%rbp
ffff80000010d1c6: c3                   	retq
ffff80000010d1c7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d1d0 <pic_get_isr>:
; {
ffff80000010d1d0: 55                   	pushq	%rbp
ffff80000010d1d1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_ISR);
ffff80000010d1d4: 48 b8 50 d1 10 00 00 80 ff ff	movabsq	$-140737487253168, %rax # imm = 0xFFFF80000010D150
ffff80000010d1de: bf 0b 00 00 00       	movl	$11, %edi
ffff80000010d1e3: ff d0                	callq	*%rax
ffff80000010d1e5: 5d                   	popq	%rbp
ffff80000010d1e6: c3                   	retq
ffff80000010d1e7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d1f0 <pic_disable_all_irqs>:
; {
ffff80000010d1f0: 55                   	pushq	%rbp
ffff80000010d1f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d1f4: 53                   	pushq	%rbx
ffff80000010d1f5: 50                   	pushq	%rax
; 	outb(PIC1_DATA, 0xff);
ffff80000010d1f6: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
ffff80000010d200: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d205: be ff 00 00 00       	movl	$255, %esi
ffff80000010d20a: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, 0xff);
ffff80000010d20c: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d211: be ff 00 00 00       	movl	$255, %esi
ffff80000010d216: ff d3                	callq	*%rbx
; }
ffff80000010d218: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d21c: 5b                   	popq	%rbx
ffff80000010d21d: 5d                   	popq	%rbp
ffff80000010d21e: c3                   	retq
ffff80000010d21f: 90                   	nop

ffff80000010d220 <pic_enable_irq>:
; {
ffff80000010d220: 55                   	pushq	%rbp
ffff80000010d221: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d224: 41 56                	pushq	%r14
ffff80000010d226: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d227: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d22a: 31 db                	xorl	%ebx, %ebx
ffff80000010d22c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d22f: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) & ~(1 << irq));
ffff80000010d232: 48 b9 30 d1 10 00 00 80 ff ff	movabsq	$-140737487253200, %rcx # imm = 0xFFFF80000010D130
ffff80000010d23c: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d240: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d244: c1 e3 07             	shll	$7, %ebx
ffff80000010d247: 83 cb 21             	orl	$33, %ebx
ffff80000010d24a: 89 df                	movl	%ebx, %edi
ffff80000010d24c: ff d1                	callq	*%rcx
ffff80000010d24e: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d253: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d256: d3 e2                	shll	%cl, %edx
ffff80000010d258: f6 d2                	notb	%dl
ffff80000010d25a: 20 c2                	andb	%al, %dl
ffff80000010d25c: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d25f: 48 b8 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rax # imm = 0xFFFF80000010D140
ffff80000010d269: 89 df                	movl	%ebx, %edi
ffff80000010d26b: ff d0                	callq	*%rax
; }
ffff80000010d26d: 5b                   	popq	%rbx
ffff80000010d26e: 41 5e                	popq	%r14
ffff80000010d270: 5d                   	popq	%rbp
ffff80000010d271: c3                   	retq
ffff80000010d272: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d27c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d280 <pic_disable_irq>:
; {
ffff80000010d280: 55                   	pushq	%rbp
ffff80000010d281: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d284: 41 56                	pushq	%r14
ffff80000010d286: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d287: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d28a: 31 db                	xorl	%ebx, %ebx
ffff80000010d28c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d28f: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) | (1 << irq));
ffff80000010d292: 48 b9 30 d1 10 00 00 80 ff ff	movabsq	$-140737487253200, %rcx # imm = 0xFFFF80000010D130
ffff80000010d29c: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d2a0: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d2a4: c1 e3 07             	shll	$7, %ebx
ffff80000010d2a7: 83 cb 21             	orl	$33, %ebx
ffff80000010d2aa: 89 df                	movl	%ebx, %edi
ffff80000010d2ac: ff d1                	callq	*%rcx
ffff80000010d2ae: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d2b3: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d2b6: d3 e2                	shll	%cl, %edx
ffff80000010d2b8: 08 c2                	orb	%al, %dl
ffff80000010d2ba: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d2bd: 48 b8 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rax # imm = 0xFFFF80000010D140
ffff80000010d2c7: 89 df                	movl	%ebx, %edi
ffff80000010d2c9: ff d0                	callq	*%rax
; }
ffff80000010d2cb: 5b                   	popq	%rbx
ffff80000010d2cc: 41 5e                	popq	%r14
ffff80000010d2ce: 5d                   	popq	%rbp
ffff80000010d2cf: c3                   	retq

ffff80000010d2d0 <pic_eoi>:
; {
ffff80000010d2d0: 55                   	pushq	%rbp
ffff80000010d2d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d2d4: 53                   	pushq	%rbx
ffff80000010d2d5: 50                   	pushq	%rax
ffff80000010d2d6: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
; 	if (irq >= 8) {
ffff80000010d2e0: 83 ff 08             	cmpl	$8, %edi
ffff80000010d2e3: 7c 0c                	jl	0xffff80000010d2f1 <pic_eoi+0x21>
; 		outb(PIC2_CMD, PIC_EOI);
ffff80000010d2e5: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d2ea: be 20 00 00 00       	movl	$32, %esi
ffff80000010d2ef: ff d3                	callq	*%rbx
; 	outb(PIC1_CMD, PIC_EOI);
ffff80000010d2f1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d2f6: be 20 00 00 00       	movl	$32, %esi
ffff80000010d2fb: ff d3                	callq	*%rbx
; }
ffff80000010d2fd: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d301: 5b                   	popq	%rbx
ffff80000010d302: 5d                   	popq	%rbp
ffff80000010d303: c3                   	retq
ffff80000010d304: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d30e: 66 90                	nop

ffff80000010d310 <pic_init>:
; {
ffff80000010d310: 55                   	pushq	%rbp
ffff80000010d311: 48 89 e5             	movq	%rsp, %rbp
; 	pic_disable_all_irqs();
ffff80000010d314: 48 b8 f0 d1 10 00 00 80 ff ff	movabsq	$-140737487253008, %rax # imm = 0xFFFF80000010D1F0
ffff80000010d31e: ff d0                	callq	*%rax
; 	pic_remap(IRQ_OFFSET, IRQ_OFFSET + 8);
ffff80000010d320: 48 b8 70 d0 10 00 00 80 ff ff	movabsq	$-140737487253392, %rax # imm = 0xFFFF80000010D070
ffff80000010d32a: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d32f: be 28 00 00 00       	movl	$40, %esi
ffff80000010d334: ff d0                	callq	*%rax
; 	pic_get_irr();
ffff80000010d336: 48 b8 b0 d1 10 00 00 80 ff ff	movabsq	$-140737487253072, %rax # imm = 0xFFFF80000010D1B0
ffff80000010d340: ff d0                	callq	*%rax
; 	pic_enable_irq(IRQ_SLAVE);
ffff80000010d342: 48 b8 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rax # imm = 0xFFFF80000010D220
ffff80000010d34c: bf 02 00 00 00       	movl	$2, %edi
ffff80000010d351: ff d0                	callq	*%rax
; }
ffff80000010d353: 5d                   	popq	%rbp
ffff80000010d354: c3                   	retq
ffff80000010d355: cc                   	int3
ffff80000010d356: cc                   	int3
ffff80000010d357: cc                   	int3
ffff80000010d358: cc                   	int3
ffff80000010d359: cc                   	int3
ffff80000010d35a: cc                   	int3
ffff80000010d35b: cc                   	int3
ffff80000010d35c: cc                   	int3
ffff80000010d35d: cc                   	int3
ffff80000010d35e: cc                   	int3
ffff80000010d35f: cc                   	int3

ffff80000010d360 <vcprintf>:
; {
ffff80000010d360: 55                   	pushq	%rbp
ffff80000010d361: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d364: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d368: 48 89 f1             	movq	%rsi, %rcx
ffff80000010d36b: 48 89 fa             	movq	%rdi, %rdx
; 	int cnt = 0;
ffff80000010d36e: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; 	vprintfmt((void*)putch, &cnt, fmt, ap);
ffff80000010d375: 48 bf a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rdi # imm = 0xFFFF80000010D3A0
ffff80000010d37f: 48 b8 20 e7 10 00 00 80 ff ff	movabsq	$-140737487247584, %rax # imm = 0xFFFF80000010E720
ffff80000010d389: 48 8d 75 fc          	leaq	-4(%rbp), %rsi
ffff80000010d38d: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d38f: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d392: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d396: 5d                   	popq	%rbp
ffff80000010d397: c3                   	retq
ffff80000010d398: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d3a0 <putch>:
; {
ffff80000010d3a0: 55                   	pushq	%rbp
ffff80000010d3a1: 48 89 e5             	movq	%rsp, %rbp
; 	cputchar(ch);
ffff80000010d3a4: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010d3ae: ff d0                	callq	*%rax
; }
ffff80000010d3b0: 5d                   	popq	%rbp
ffff80000010d3b1: c3                   	retq
ffff80000010d3b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d3bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d3c0 <cprintf>:
; {
ffff80000010d3c0: 55                   	pushq	%rbp
ffff80000010d3c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d3c4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010d3c8: 48 89 75 b8          	movq	%rsi, -72(%rbp)
ffff80000010d3cc: 48 89 55 c0          	movq	%rdx, -64(%rbp)
ffff80000010d3d0: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010d3d4: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010d3d8: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010d3dc: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010d3e0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010d3e4: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010d3e8: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010d3ec: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax # imm = 0x3000000008
ffff80000010d3f6: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	cnt = vcprintf(fmt, ap);
ffff80000010d3fa: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010d404: 48 8d 75 e0          	leaq	-32(%rbp), %rsi
ffff80000010d408: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d40a: 48 83 c4 50          	addq	$80, %rsp
ffff80000010d40e: 5d                   	popq	%rbp
ffff80000010d40f: c3                   	retq

ffff80000010d410 <boot_alloc>:
; {
ffff80000010d410: 55                   	pushq	%rbp
ffff80000010d411: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d414: 41 57                	pushq	%r15
ffff80000010d416: 41 56                	pushq	%r14
ffff80000010d418: 41 55                	pushq	%r13
ffff80000010d41a: 41 54                	pushq	%r12
ffff80000010d41c: 53                   	pushq	%rbx
ffff80000010d41d: 50                   	pushq	%rax
ffff80000010d41e: 41 89 fe             	movl	%edi, %r14d
; 	if (!next_free) next_free = kdata_pages_start;
ffff80000010d421: 49 bc 30 42 11 00 00 80 ff ff	movabsq	$-140737487224272, %r12 # imm = 0xFFFF800000114230
ffff80000010d42b: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010d430: 75 1a                	jne	0xffff80000010d44c <boot_alloc+0x3c>
ffff80000010d432: 48 b8 f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rax # imm = 0xFFFF8000001146F0
ffff80000010d43c: 48 05 ff 0f 00 00    	addq	$4095, %rax             # imm = 0xFFF
; 	if (!next_free) next_free = kdata_pages_start;
ffff80000010d442: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010d448: 49 89 04 24          	movq	%rax, (%r12)
;     cprintf("next free: %u\n", next_free);
ffff80000010d44c: 49 8b 34 24          	movq	(%r12), %rsi
ffff80000010d450: 48 bf dc 0a 11 00 00 80 ff ff	movabsq	$-140737487238436, %rdi # imm = 0xFFFF800000110ADC
ffff80000010d45a: 49 bd c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r13 # imm = 0xFFFF80000010D3C0
ffff80000010d464: 31 c0                	xorl	%eax, %eax
ffff80000010d466: 41 ff d5             	callq	*%r13
; 	if(n == 0) return next_free;
ffff80000010d469: 45 85 f6             	testl	%r14d, %r14d
ffff80000010d46c: 74 63                	je	0xffff80000010d4d1 <boot_alloc+0xc1>
; 	uint32_t pages = (n / PAGE_SIZE) + 1;
ffff80000010d46e: 41 c1 ee 0c          	shrl	$12, %r14d
ffff80000010d472: 45 8d 7e 01          	leal	1(%r14), %r15d
; 	cprintf("pages up for alloc: %u\n", pages);
ffff80000010d476: 48 bf a1 0b 11 00 00 80 ff ff	movabsq	$-140737487238239, %rdi # imm = 0xFFFF800000110BA1
ffff80000010d480: 44 89 fe             	movl	%r15d, %esi
ffff80000010d483: 31 c0                	xorl	%eax, %eax
ffff80000010d485: 41 ff d5             	callq	*%r13
ffff80000010d488: 48 b8 f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rax # imm = 0xFFFF8000001146F0
ffff80000010d492: 05 ff 0f 00 00       	addl	$4095, %eax             # imm = 0xFFF
; 	cprintf("%u\n", kdata_pages);
ffff80000010d497: 89 c3                	movl	%eax, %ebx
ffff80000010d499: 81 e3 ff 0f 00 00    	andl	$4095, %ebx             # imm = 0xFFF
ffff80000010d49f: 29 c3                	subl	%eax, %ebx
ffff80000010d4a1: 81 c3 00 00 80 00    	addl	$8388608, %ebx          # imm = 0x800000
ffff80000010d4a7: c1 eb 0c             	shrl	$12, %ebx
ffff80000010d4aa: 48 bf 2e 0a 11 00 00 80 ff ff	movabsq	$-140737487238610, %rdi # imm = 0xFFFF800000110A2E
ffff80000010d4b4: 89 de                	movl	%ebx, %esi
ffff80000010d4b6: 31 c0                	xorl	%eax, %eax
ffff80000010d4b8: 41 ff d5             	callq	*%r13
; 	if(pages > kdata_pages) panic("OOM in boot loader");
ffff80000010d4bb: 41 39 de             	cmpl	%ebx, %r14d
ffff80000010d4be: 73 24                	jae	0xffff80000010d4e4 <boot_alloc+0xd4>
; 	result = next_free;
ffff80000010d4c0: 49 8b 04 24          	movq	(%r12), %rax
; 	next_free += pages * PAGE_SIZE;
ffff80000010d4c4: 41 c1 e7 0c          	shll	$12, %r15d
ffff80000010d4c8: 49 01 c7             	addq	%rax, %r15
ffff80000010d4cb: 4d 89 3c 24          	movq	%r15, (%r12)
ffff80000010d4cf: eb 04                	jmp	0xffff80000010d4d5 <boot_alloc+0xc5>
; 	if(n == 0) return next_free;
ffff80000010d4d1: 49 8b 04 24          	movq	(%r12), %rax
; }
ffff80000010d4d5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d4d9: 5b                   	popq	%rbx
ffff80000010d4da: 41 5c                	popq	%r12
ffff80000010d4dc: 41 5d                	popq	%r13
ffff80000010d4de: 41 5e                	popq	%r14
ffff80000010d4e0: 41 5f                	popq	%r15
ffff80000010d4e2: 5d                   	popq	%rbp
ffff80000010d4e3: c3                   	retq
; 	if(pages > kdata_pages) panic("OOM in boot loader");
ffff80000010d4e4: 48 bf 04 10 11 00 00 80 ff ff	movabsq	$-140737487237116, %rdi # imm = 0xFFFF800000111004
ffff80000010d4ee: 48 ba 35 0f 11 00 00 80 ff ff	movabsq	$-140737487237323, %rdx # imm = 0xFFFF800000110F35
ffff80000010d4f8: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d502: be 3e 00 00 00       	movl	$62, %esi
ffff80000010d507: 31 c0                	xorl	%eax, %eax
ffff80000010d509: ff d1                	callq	*%rcx
ffff80000010d50b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d510 <align_boot_info>:
; {
ffff80000010d510: 55                   	pushq	%rbp
ffff80000010d511: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d514: 8b 4f 04             	movl	4(%rdi), %ecx
ffff80000010d517: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d51a: 74 6f                	je	0xffff80000010d58b <align_boot_info+0x7b>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010d51c: 8b 07                	movl	(%rdi), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d51e: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d522: 48 8d 0c 49          	leaq	(%rcx,%rcx,2), %rcx
ffff80000010d526: 31 d2                	xorl	%edx, %edx
ffff80000010d528: eb 41                	jmp	0xffff80000010d56b <align_boot_info+0x5b>
ffff80000010d52a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 			base = ROUNDDOWN(entry->addr, PAGE_SIZE);
ffff80000010d530: 48 89 f7             	movq	%rsi, %rdi
ffff80000010d533: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff80000010d539: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = entry->len + (entry->addr - base);
ffff80000010d540: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
; 			end = ROUNDUP(base + end, PAGE_SIZE);
ffff80000010d545: 48 01 fe             	addq	%rdi, %rsi
ffff80000010d548: 48 81 c6 ff 0f 00 00 	addq	$4095, %rsi             # imm = 0xFFF
ffff80000010d54f: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 		entry->addr = base;
ffff80000010d556: 48 89 3c 10          	movq	%rdi, (%rax,%rdx)
; 		entry->len = end - base;
ffff80000010d55a: 48 29 fe             	subq	%rdi, %rsi
ffff80000010d55d: 48 89 74 10 08       	movq	%rsi, 8(%rax,%rdx)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d562: 48 83 c2 18          	addq	$24, %rdx
ffff80000010d566: 48 39 d1             	cmpq	%rdx, %rcx
ffff80000010d569: 74 20                	je	0xffff80000010d58b <align_boot_info+0x7b>
; 		switch (entry->type) {
ffff80000010d56b: 83 7c 10 10 01       	cmpl	$1, 16(%rax,%rdx)
ffff80000010d570: 48 8b 34 10          	movq	(%rax,%rdx), %rsi
; 		switch (entry->type) {
ffff80000010d574: 75 ba                	jne	0xffff80000010d530 <align_boot_info+0x20>
; 			base = ROUNDUP(entry->addr, PAGE_SIZE);
ffff80000010d576: 48 8d be ff 0f 00 00 	leaq	4095(%rsi), %rdi
ffff80000010d57d: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = ROUNDDOWN(base + end, PAGE_SIZE);
ffff80000010d584: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
ffff80000010d589: eb c4                	jmp	0xffff80000010d54f <align_boot_info+0x3f>
; }
ffff80000010d58b: 5d                   	popq	%rbp
ffff80000010d58c: c3                   	retq
ffff80000010d58d: 0f 1f 00             	nopl	(%rax)

ffff80000010d590 <show_boot_mmap>:
; {
ffff80000010d590: 55                   	pushq	%rbp
ffff80000010d591: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d594: 41 57                	pushq	%r15
ffff80000010d596: 41 56                	pushq	%r14
ffff80000010d598: 41 55                	pushq	%r13
ffff80000010d59a: 41 54                	pushq	%r12
ffff80000010d59c: 53                   	pushq	%rbx
ffff80000010d59d: 50                   	pushq	%rax
ffff80000010d59e: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010d5a1: 8b 3f                	movl	(%rdi), %edi
ffff80000010d5a3: 48 b8 50 d6 10 00 00 80 ff ff	movabsq	$-140737487251888, %rax # imm = 0xFFFF80000010D650
ffff80000010d5ad: ff d0                	callq	*%rax
ffff80000010d5af: 49 89 c5             	movq	%rax, %r13
; 	cprintf("Boot memory map:\n");
ffff80000010d5b2: 48 bf 48 0f 11 00 00 80 ff ff	movabsq	$-140737487237304, %rdi # imm = 0xFFFF800000110F48
ffff80000010d5bc: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d5c6: 31 c0                	xorl	%eax, %eax
ffff80000010d5c8: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d5ca: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d5cf: 74 6a                	je	0xffff80000010d63b <show_boot_mmap+0xab>
ffff80000010d5d1: 49 83 c5 10          	addq	$16, %r13
ffff80000010d5d5: 49 bf 5a 0f 11 00 00 80 ff ff	movabsq	$-140737487237286, %r15 # imm = 0xFFFF800000110F5A
ffff80000010d5df: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010d5e2: 48 bb c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rbx # imm = 0xFFFF80000010D3C0
ffff80000010d5ec: eb 25                	jmp	0xffff80000010d613 <show_boot_mmap+0x83>
ffff80000010d5ee: 66 90                	nop
; 			entry->addr,
ffff80000010d5f0: 49 8b 75 f0          	movq	-16(%r13), %rsi
ffff80000010d5f4: 49 8b 55 f8          	movq	-8(%r13), %rdx
; 			entry->addr + entry->len,
ffff80000010d5f8: 48 01 f2             	addq	%rsi, %rdx
; 		cprintf("  %016p - %016p [%s]\n",
ffff80000010d5fb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010d5fe: 31 c0                	xorl	%eax, %eax
ffff80000010d600: ff d3                	callq	*%rbx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d602: 49 83 c4 01          	addq	$1, %r12
ffff80000010d606: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010d60a: 49 83 c5 18          	addq	$24, %r13
ffff80000010d60e: 49 39 c4             	cmpq	%rax, %r12
ffff80000010d611: 73 28                	jae	0xffff80000010d63b <show_boot_mmap+0xab>
; 		switch (entry->type) {
ffff80000010d613: 41 8b 45 00          	movl	(%r13), %eax
ffff80000010d617: 83 c0 ff             	addl	$-1, %eax
ffff80000010d61a: 48 b9 eb 0a 11 00 00 80 ff ff	movabsq	$-140737487238421, %rcx # imm = 0xFFFF800000110AEB
ffff80000010d624: 83 f8 04             	cmpl	$4, %eax
ffff80000010d627: 77 c7                	ja	0xffff80000010d5f0 <show_boot_mmap+0x60>
ffff80000010d629: 48 98                	cltq
ffff80000010d62b: 48 b9 c8 02 11 00 00 80 ff ff	movabsq	$-140737487240504, %rcx # imm = 0xFFFF8000001102C8
ffff80000010d635: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff80000010d639: eb b5                	jmp	0xffff80000010d5f0 <show_boot_mmap+0x60>
; }
ffff80000010d63b: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d63f: 5b                   	popq	%rbx
ffff80000010d640: 41 5c                	popq	%r12
ffff80000010d642: 41 5d                	popq	%r13
ffff80000010d644: 41 5e                	popq	%r14
ffff80000010d646: 41 5f                	popq	%r15
ffff80000010d648: 5d                   	popq	%rbp
ffff80000010d649: c3                   	retq
ffff80000010d64a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010d650 <_kaddr>:
; {
ffff80000010d650: 55                   	pushq	%rbp
ffff80000010d651: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d654: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010d657: 48 89 f9             	movq	%rdi, %rcx
ffff80000010d65a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010d65e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010d668: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010d66b: 73 0f                	jae	0xffff80000010d67c <_kaddr+0x2c>
ffff80000010d66d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010d677: 48 01 c8             	addq	%rcx, %rax
ffff80000010d67a: 5d                   	popq	%rbp
ffff80000010d67b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010d67c: 48 bf 04 10 11 00 00 80 ff ff	movabsq	$-140737487237116, %rdi # imm = 0xFFFF800000111004
ffff80000010d686: 48 ba e3 0c 11 00 00 80 ff ff	movabsq	$-140737487237917, %rdx # imm = 0xFFFF800000110CE3
ffff80000010d690: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010d69a: be 6f 00 00 00       	movl	$111, %esi
ffff80000010d69f: 48 89 c1             	movq	%rax, %rcx
ffff80000010d6a2: 31 c0                	xorl	%eax, %eax
ffff80000010d6a4: 41 ff d0             	callq	*%r8
ffff80000010d6a7: cc                   	int3
ffff80000010d6a8: cc                   	int3
ffff80000010d6a9: cc                   	int3
ffff80000010d6aa: cc                   	int3
ffff80000010d6ab: cc                   	int3
ffff80000010d6ac: cc                   	int3
ffff80000010d6ad: cc                   	int3
ffff80000010d6ae: cc                   	int3
ffff80000010d6af: cc                   	int3

ffff80000010d6b0 <count_free_pages>:
; {
ffff80000010d6b0: 55                   	pushq	%rbp
ffff80000010d6b1: 48 89 e5             	movq	%rsp, %rbp
; 	if (order >= BUDDY_MAX_ORDER) {
ffff80000010d6b4: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010d6b8: 76 04                	jbe	0xffff80000010d6be <count_free_pages+0xe>
ffff80000010d6ba: 31 c0                	xorl	%eax, %eax
; }
ffff80000010d6bc: 5d                   	popq	%rbp
ffff80000010d6bd: c3                   	retq
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d6be: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010d6c2: 48 b9 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %rcx # imm = 0xFFFF800000114240
ffff80000010d6cc: 48 01 f9             	addq	%rdi, %rcx
ffff80000010d6cf: 48 c7 c0 ff ff ff ff 	movq	$-1, %rax
ffff80000010d6d6: 48 89 ca             	movq	%rcx, %rdx
ffff80000010d6d9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010d6e0: 48 8b 12             	movq	(%rdx), %rdx
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d6e3: 48 83 c0 01          	addq	$1, %rax
ffff80000010d6e7: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010d6ea: 75 f4                	jne	0xffff80000010d6e0 <count_free_pages+0x30>
; }
ffff80000010d6ec: 5d                   	popq	%rbp
ffff80000010d6ed: c3                   	retq
ffff80000010d6ee: 66 90                	nop

ffff80000010d6f0 <show_buddy_info>:
; {
ffff80000010d6f0: 55                   	pushq	%rbp
ffff80000010d6f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d6f4: 41 57                	pushq	%r15
ffff80000010d6f6: 41 56                	pushq	%r14
ffff80000010d6f8: 41 55                	pushq	%r13
ffff80000010d6fa: 41 54                	pushq	%r12
ffff80000010d6fc: 53                   	pushq	%rbx
ffff80000010d6fd: 50                   	pushq	%rax
; 	cprintf("Buddy allocator:\n");
ffff80000010d6fe: 48 bf d2 09 11 00 00 80 ff ff	movabsq	$-140737487238702, %rdi # imm = 0xFFFF8000001109D2
ffff80000010d708: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d712: 31 c0                	xorl	%eax, %eax
ffff80000010d714: ff d1                	callq	*%rcx
ffff80000010d716: 49 bd b0 d6 10 00 00 80 ff ff	movabsq	$-140737487251792, %r13 # imm = 0xFFFF80000010D6B0
ffff80000010d720: 49 be e6 0d 11 00 00 80 ff ff	movabsq	$-140737487237658, %r14 # imm = 0xFFFF800000110DE6
ffff80000010d72a: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010d72d: 31 db                	xorl	%ebx, %ebx
ffff80000010d72f: 90                   	nop
; 		nfree_pages = count_free_pages(order);
ffff80000010d730: 48 89 df             	movq	%rbx, %rdi
ffff80000010d733: 41 ff d5             	callq	*%r13
ffff80000010d736: 49 89 c4             	movq	%rax, %r12
; 		cprintf("  order #%u pages=%u\n", order, nfree_pages);
ffff80000010d739: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d73c: 48 89 de             	movq	%rbx, %rsi
ffff80000010d73f: 48 89 c2             	movq	%rax, %rdx
ffff80000010d742: 31 c0                	xorl	%eax, %eax
ffff80000010d744: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d74e: ff d1                	callq	*%rcx
; 		nfree += nfree_pages * (1 << (order + 12));
ffff80000010d750: 8d 4b 0c             	leal	12(%rbx), %ecx
ffff80000010d753: b8 01 00 00 00       	movl	$1, %eax
ffff80000010d758: d3 e0                	shll	%cl, %eax
ffff80000010d75a: 49 0f af c4          	imulq	%r12, %rax
ffff80000010d75e: 49 01 c7             	addq	%rax, %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d761: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d765: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d769: 75 c5                	jne	0xffff80000010d730 <show_buddy_info+0x40>
; 	cprintf("  free: %u kiB\n", nfree / 1024);
ffff80000010d76b: 49 c1 ef 0a          	shrq	$10, %r15
ffff80000010d76f: 48 bf c9 08 11 00 00 80 ff ff	movabsq	$-140737487238967, %rdi # imm = 0xFFFF8000001108C9
ffff80000010d779: 4c 89 fe             	movq	%r15, %rsi
ffff80000010d77c: 31 c0                	xorl	%eax, %eax
ffff80000010d77e: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d788: ff d1                	callq	*%rcx
; }
ffff80000010d78a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d78e: 5b                   	popq	%rbx
ffff80000010d78f: 41 5c                	popq	%r12
ffff80000010d791: 41 5d                	popq	%r13
ffff80000010d793: 41 5e                	popq	%r14
ffff80000010d795: 41 5f                	popq	%r15
ffff80000010d797: 5d                   	popq	%rbp
ffff80000010d798: c3                   	retq
ffff80000010d799: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d7a0 <count_total_free_pages>:
; {
ffff80000010d7a0: 55                   	pushq	%rbp
ffff80000010d7a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d7a4: 41 57                	pushq	%r15
ffff80000010d7a6: 41 56                	pushq	%r14
ffff80000010d7a8: 53                   	pushq	%rbx
ffff80000010d7a9: 50                   	pushq	%rax
ffff80000010d7aa: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010d7ad: 49 bf b0 d6 10 00 00 80 ff ff	movabsq	$-140737487251792, %r15 # imm = 0xFFFF80000010D6B0
ffff80000010d7b7: 31 db                	xorl	%ebx, %ebx
ffff80000010d7b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		nfree_pages = count_free_pages(order);
ffff80000010d7c0: 48 89 df             	movq	%rbx, %rdi
ffff80000010d7c3: 41 ff d7             	callq	*%r15
; 		nfree += nfree_pages * (1 << order);
ffff80000010d7c6: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d7cb: 89 d9                	movl	%ebx, %ecx
ffff80000010d7cd: d3 e2                	shll	%cl, %edx
ffff80000010d7cf: 48 0f af d0          	imulq	%rax, %rdx
ffff80000010d7d3: 49 01 d6             	addq	%rdx, %r14
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d7d6: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d7da: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d7de: 75 e0                	jne	0xffff80000010d7c0 <count_total_free_pages+0x20>
; 	return nfree;
ffff80000010d7e0: 4c 89 f0             	movq	%r14, %rax
ffff80000010d7e3: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d7e7: 5b                   	popq	%rbx
ffff80000010d7e8: 41 5e                	popq	%r14
ffff80000010d7ea: 41 5f                	popq	%r15
ffff80000010d7ec: 5d                   	popq	%rbp
ffff80000010d7ed: c3                   	retq
ffff80000010d7ee: 66 90                	nop

ffff80000010d7f0 <buddy_split>:
; {
ffff80000010d7f0: 55                   	pushq	%rbp
ffff80000010d7f1: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d7f4: 31 c0                	xorl	%eax, %eax
ffff80000010d7f6: 5d                   	popq	%rbp
ffff80000010d7f7: c3                   	retq
ffff80000010d7f8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d800 <buddy_merge>:
; {
ffff80000010d800: 55                   	pushq	%rbp
ffff80000010d801: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d804: 31 c0                	xorl	%eax, %eax
ffff80000010d806: 5d                   	popq	%rbp
ffff80000010d807: c3                   	retq
ffff80000010d808: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d810 <buddy_find>:
; {
ffff80000010d810: 55                   	pushq	%rbp
ffff80000010d811: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d814: 31 c0                	xorl	%eax, %eax
ffff80000010d816: 5d                   	popq	%rbp
ffff80000010d817: c3                   	retq
ffff80000010d818: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d820 <page_alloc>:
; {
ffff80000010d820: 55                   	pushq	%rbp
ffff80000010d821: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d824: 31 c0                	xorl	%eax, %eax
ffff80000010d826: 5d                   	popq	%rbp
ffff80000010d827: c3                   	retq
ffff80000010d828: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d830 <page_free>:
; {
ffff80000010d830: 55                   	pushq	%rbp
ffff80000010d831: 48 89 e5             	movq	%rsp, %rbp
; }
ffff80000010d834: 5d                   	popq	%rbp
ffff80000010d835: c3                   	retq
ffff80000010d836: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010d840 <page_decref>:
; {
ffff80000010d840: 55                   	pushq	%rbp
ffff80000010d841: 48 89 e5             	movq	%rsp, %rbp
; 	if (--pp->pp_ref == 0) {
ffff80000010d844: 66 83 47 10 ff       	addw	$-1, 16(%rdi)
; }
ffff80000010d849: 5d                   	popq	%rbp
ffff80000010d84a: c3                   	retq
ffff80000010d84b: cc                   	int3
ffff80000010d84c: cc                   	int3
ffff80000010d84d: cc                   	int3
ffff80000010d84e: cc                   	int3
ffff80000010d84f: cc                   	int3

ffff80000010d850 <mem_init>:
; {
ffff80000010d850: 55                   	pushq	%rbp
ffff80000010d851: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d854: 41 57                	pushq	%r15
ffff80000010d856: 41 56                	pushq	%r14
ffff80000010d858: 41 54                	pushq	%r12
ffff80000010d85a: 53                   	pushq	%rbx
ffff80000010d85b: 49 89 fe             	movq	%rdi, %r14
; 	align_boot_info(boot_info);
ffff80000010d85e: 48 b8 10 d5 10 00 00 80 ff ff	movabsq	$-140737487252208, %rax # imm = 0xFFFF80000010D510
ffff80000010d868: ff d0                	callq	*%rax
ffff80000010d86a: 31 db                	xorl	%ebx, %ebx
ffff80000010d86c: 49 bf 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r15 # imm = 0xFFFF800000114240
ffff80000010d876: 49 bc 10 e6 10 00 00 80 ff ff	movabsq	$-140737487247856, %r12 # imm = 0xFFFF80000010E610
; 		list_init(buddy_free_list + i);
ffff80000010d880: 4a 8d 3c 3b          	leaq	(%rbx,%r15), %rdi
ffff80000010d884: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010d887: 48 83 c3 10          	addq	$16, %rbx
ffff80000010d88b: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010d892: 75 ec                	jne	0xffff80000010d880 <mem_init+0x30>
ffff80000010d894: 41 8b 4e 04          	movl	4(%r14), %ecx
ffff80000010d898: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d89b: 75 75                	jne	0xffff80000010d912 <mem_init+0xc2>
ffff80000010d89d: 31 c9                	xorl	%ecx, %ecx
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010d89f: 48 81 f9 00 00 80 00 	cmpq	$8388608, %rcx          # imm = 0x800000
ffff80000010d8a6: bf 00 00 80 00       	movl	$8388608, %edi          # imm = 0x800000
ffff80000010d8ab: 48 0f 42 f9          	cmovbq	%rcx, %rdi
ffff80000010d8af: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010d8b3: 48 b8 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rax # imm = 0xFFFF8000001142E0
ffff80000010d8bd: 48 89 38             	movq	%rdi, (%rax)
; 	pages = boot_alloc(npages * sizeof *pages);
ffff80000010d8c0: c1 e7 05             	shll	$5, %edi
ffff80000010d8c3: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010d8cd: ff d0                	callq	*%rax
ffff80000010d8cf: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010d8d9: 48 89 01             	movq	%rax, (%rcx)
; 	page_init(boot_info);
ffff80000010d8dc: 48 b8 50 d9 10 00 00 80 ff ff	movabsq	$-140737487251120, %rax # imm = 0xFFFF80000010D950
ffff80000010d8e6: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d8e9: ff d0                	callq	*%rax
; 	panic("need to implement buddy allocator\n");
ffff80000010d8eb: 48 bf 06 0d 11 00 00 80 ff ff	movabsq	$-140737487237882, %rdi # imm = 0xFFFF800000110D06
ffff80000010d8f5: 48 ba fc 0d 11 00 00 80 ff ff	movabsq	$-140737487237636, %rdx # imm = 0xFFFF800000110DFC
ffff80000010d8ff: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d909: be 4a 00 00 00       	movl	$74, %esi
ffff80000010d90e: 31 c0                	xorl	%eax, %eax
ffff80000010d910: ff d1                	callq	*%rcx
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010d912: 41 8b 06             	movl	(%r14), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d915: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d919: 48 8d 14 49          	leaq	(%rcx,%rcx,2), %rdx
ffff80000010d91d: 31 f6                	xorl	%esi, %esi
ffff80000010d91f: 31 c9                	xorl	%ecx, %ecx
ffff80000010d921: eb 1a                	jmp	0xffff80000010d93d <mem_init+0xed>
ffff80000010d923: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d92d: 0f 1f 00             	nopl	(%rax)
ffff80000010d930: 48 83 c6 18          	addq	$24, %rsi
ffff80000010d934: 48 39 f2             	cmpq	%rsi, %rdx
ffff80000010d937: 0f 84 62 ff ff ff    	je	0xffff80000010d89f <mem_init+0x4f>
; 		if (entry->type != MMAP_FREE)
ffff80000010d93d: 83 7c 30 10 01       	cmpl	$1, 16(%rax,%rsi)
ffff80000010d942: 75 ec                	jne	0xffff80000010d930 <mem_init+0xe0>
; 		highest_addr = entry->addr + entry->len;
ffff80000010d944: 48 8b 4c 30 08       	movq	8(%rax,%rsi), %rcx
ffff80000010d949: 48 03 0c 30          	addq	(%rax,%rsi), %rcx
ffff80000010d94d: eb e1                	jmp	0xffff80000010d930 <mem_init+0xe0>
ffff80000010d94f: 90                   	nop

ffff80000010d950 <page_init>:
; {
ffff80000010d950: 55                   	pushq	%rbp
ffff80000010d951: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d954: 41 57                	pushq	%r15
ffff80000010d956: 41 56                	pushq	%r14
ffff80000010d958: 41 55                	pushq	%r13
ffff80000010d95a: 41 54                	pushq	%r12
ffff80000010d95c: 53                   	pushq	%rbx
ffff80000010d95d: 50                   	pushq	%rax
ffff80000010d95e: 48 89 7d d0          	movq	%rdi, -48(%rbp)
; 	for (i = 0; i < npages; ++i) {
ffff80000010d962: 49 bc e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %r12 # imm = 0xFFFF8000001142E0
ffff80000010d96c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010d971: 74 4d                	je	0xffff80000010d9c0 <page_init+0x70>
ffff80000010d973: 31 db                	xorl	%ebx, %ebx
ffff80000010d975: 49 bd 10 e6 10 00 00 80 ff ff	movabsq	$-140737487247856, %r13 # imm = 0xFFFF80000010E610
ffff80000010d97f: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010d982: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d98c: 0f 1f 40 00          	nopl	(%rax)
; 		page = pages + i;
ffff80000010d990: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010d99a: 4c 8b 39             	movq	(%rcx), %r15
; 		list_init(&page->pp_node);
ffff80000010d99d: 49 8d 3c 1f          	leaq	(%r15,%rbx), %rdi
ffff80000010d9a1: 41 ff d5             	callq	*%r13
; 		page->pp_ref = 0;
ffff80000010d9a4: 66 41 c7 44 1f 10 00 00      	movw	$0, 16(%r15,%rbx)
; 		page->pp_order = 0;
ffff80000010d9ac: 41 c6 44 1f 12 00    	movb	$0, 18(%r15,%rbx)
; 	for (i = 0; i < npages; ++i) {
ffff80000010d9b2: 49 83 c6 01          	addq	$1, %r14
ffff80000010d9b6: 48 83 c3 20          	addq	$32, %rbx
ffff80000010d9ba: 4d 3b 34 24          	cmpq	(%r12), %r14
ffff80000010d9be: 72 d0                	jb	0xffff80000010d990 <page_init+0x40>
ffff80000010d9c0: 4c 8b 75 d0          	movq	-48(%rbp), %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010d9c4: 41 8b 3e             	movl	(%r14), %edi
ffff80000010d9c7: 48 b8 60 da 10 00 00 80 ff ff	movabsq	$-140737487250848, %rax # imm = 0xFFFF80000010DA60
ffff80000010d9d1: ff d0                	callq	*%rax
ffff80000010d9d3: 49 89 c5             	movq	%rax, %r13
; 	end = PADDR(boot_alloc(0));
ffff80000010d9d6: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010d9e0: 31 ff                	xorl	%edi, %edi
ffff80000010d9e2: ff d0                	callq	*%rax
ffff80000010d9e4: 48 b9 c0 da 10 00 00 80 ff ff	movabsq	$-140737487250752, %rcx # imm = 0xFFFF80000010DAC0
ffff80000010d9ee: 48 89 c7             	movq	%rax, %rdi
ffff80000010d9f1: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d9f3: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d9f8: 74 56                	je	0xffff80000010da50 <page_init+0x100>
ffff80000010d9fa: 49 83 c5 10          	addq	$16, %r13
ffff80000010d9fe: 49 bf 01 0c 11 00 00 80 ff ff	movabsq	$-140737487238143, %r15 # imm = 0xFFFF800000110C01
ffff80000010da08: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010da12: 31 db                	xorl	%ebx, %ebx
ffff80000010da14: eb 1b                	jmp	0xffff80000010da31 <page_init+0xe1>
ffff80000010da16: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010da20: 48 83 c3 01          	addq	$1, %rbx
ffff80000010da24: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010da28: 49 83 c5 18          	addq	$24, %r13
ffff80000010da2c: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010da2f: 73 1f                	jae	0xffff80000010da50 <page_init+0x100>
; 		if(entry->type != MMAP_FREE) continue;
ffff80000010da31: 41 83 7d 00 01       	cmpl	$1, (%r13)
ffff80000010da36: 75 e8                	jne	0xffff80000010da20 <page_init+0xd0>
; 		cprintf("%d\n", (entry->addr % PAGE_SIZE) == 0);
ffff80000010da38: 31 f6                	xorl	%esi, %esi
ffff80000010da3a: 41 f7 45 f0 ff 0f 00 00      	testl	$4095, -16(%r13) # imm = 0xFFF
ffff80000010da42: 40 0f 94 c6          	sete	%sil
ffff80000010da46: 4c 89 ff             	movq	%r15, %rdi
ffff80000010da49: 31 c0                	xorl	%eax, %eax
ffff80000010da4b: 41 ff d4             	callq	*%r12
ffff80000010da4e: eb d0                	jmp	0xffff80000010da20 <page_init+0xd0>
; }
ffff80000010da50: 48 83 c4 08          	addq	$8, %rsp
ffff80000010da54: 5b                   	popq	%rbx
ffff80000010da55: 41 5c                	popq	%r12
ffff80000010da57: 41 5d                	popq	%r13
ffff80000010da59: 41 5e                	popq	%r14
ffff80000010da5b: 41 5f                	popq	%r15
ffff80000010da5d: 5d                   	popq	%rbp
ffff80000010da5e: c3                   	retq
ffff80000010da5f: 90                   	nop

ffff80000010da60 <_kaddr>:
; {
ffff80000010da60: 55                   	pushq	%rbp
ffff80000010da61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010da64: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010da67: 48 89 f9             	movq	%rdi, %rcx
ffff80000010da6a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010da6e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010da78: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010da7b: 73 0f                	jae	0xffff80000010da8c <_kaddr+0x2c>
ffff80000010da7d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010da87: 48 01 c8             	addq	%rcx, %rax
ffff80000010da8a: 5d                   	popq	%rbp
ffff80000010da8b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010da8c: 48 bf 06 0d 11 00 00 80 ff ff	movabsq	$-140737487237882, %rdi # imm = 0xFFFF800000110D06
ffff80000010da96: 48 ba e3 0c 11 00 00 80 ff ff	movabsq	$-140737487237917, %rdx # imm = 0xFFFF800000110CE3
ffff80000010daa0: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010daaa: be 6f 00 00 00       	movl	$111, %esi
ffff80000010daaf: 48 89 c1             	movq	%rax, %rcx
ffff80000010dab2: 31 c0                	xorl	%eax, %eax
ffff80000010dab4: 41 ff d0             	callq	*%r8
ffff80000010dab7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010dac0 <_paddr>:
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010dac0: 48 89 f8             	movq	%rdi, %rax
ffff80000010dac3: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000010dac7: 3d fe ff 01 00       	cmpl	$131070, %eax           # imm = 0x1FFFE
ffff80000010dacc: 76 01                	jbe	0xffff80000010dacf <_paddr+0xf>
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010dace: c3                   	retq
ffff80000010dacf: 55                   	pushq	%rbp
ffff80000010dad0: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dad3: 48 89 f9             	movq	%rdi, %rcx
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010dad6: 48 bf 06 0d 11 00 00 80 ff ff	movabsq	$-140737487237882, %rdi # imm = 0xFFFF800000110D06
ffff80000010dae0: 48 ba 05 09 11 00 00 80 ff ff	movabsq	$-140737487238907, %rdx # imm = 0xFFFF800000110905
ffff80000010daea: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010daf4: be 70 00 00 00       	movl	$112, %esi
ffff80000010daf9: 31 c0                	xorl	%eax, %eax
ffff80000010dafb: 41 ff d0             	callq	*%r8
ffff80000010dafe: cc                   	int3
ffff80000010daff: cc                   	int3

ffff80000010db00 <lab1_check_free_list_avail>:
; {
ffff80000010db00: 55                   	pushq	%rbp
ffff80000010db01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010db04: 41 57                	pushq	%r15
ffff80000010db06: 41 56                	pushq	%r14
ffff80000010db08: 41 55                	pushq	%r13
ffff80000010db0a: 41 54                	pushq	%r12
ffff80000010db0c: 53                   	pushq	%rbx
ffff80000010db0d: 50                   	pushq	%rax
ffff80000010db0e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010db11: 49 bc 20 dc 10 00 00 80 ff ff	movabsq	$-140737487250400, %r12 # imm = 0xFFFF80000010DC20
ffff80000010db1b: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010db1e: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010db21: eb 1b                	jmp	0xffff80000010db3e <lab1_check_free_list_avail+0x3e>
ffff80000010db23: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010db2d: 0f 1f 00             	nopl	(%rax)
ffff80000010db30: 4c 8b 7d d0          	movq	-48(%rbp), %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010db34: 49 83 c7 01          	addq	$1, %r15
ffff80000010db38: 49 83 ff 0a          	cmpq	$10, %r15
ffff80000010db3c: 74 46                	je	0xffff80000010db84 <lab1_check_free_list_avail+0x84>
ffff80000010db3e: 4c 89 7d d0          	movq	%r15, -48(%rbp)
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010db42: 49 c1 e7 04          	shlq	$4, %r15
ffff80000010db46: 48 b8 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %rax # imm = 0xFFFF800000114240
ffff80000010db50: 49 8b 1c 07          	movq	(%r15,%rax), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010db54: 49 01 c7             	addq	%rax, %r15
ffff80000010db57: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010db5a: 74 d4                	je	0xffff80000010db30 <lab1_check_free_list_avail+0x30>
ffff80000010db5c: 0f 1f 40 00          	nopl	(%rax)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010db60: 48 89 df             	movq	%rbx, %rdi
ffff80000010db63: 41 ff d4             	callq	*%r12
ffff80000010db66: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010db6c: 49 83 d5 00          	adcq	$0, %r13
ffff80000010db70: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010db76: 49 83 de ff          	sbbq	$-1, %r14
ffff80000010db7a: 48 8b 1b             	movq	(%rbx), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010db7d: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010db80: 75 de                	jne	0xffff80000010db60 <lab1_check_free_list_avail+0x60>
ffff80000010db82: eb ac                	jmp	0xffff80000010db30 <lab1_check_free_list_avail+0x30>
; 	assert(nfree_basemem > 0);
ffff80000010db84: 4d 85 ed             	testq	%r13, %r13
ffff80000010db87: 74 2c                	je	0xffff80000010dbb5 <lab1_check_free_list_avail+0xb5>
; 	assert(nfree_extmem > 0);
ffff80000010db89: 4d 85 f6             	testq	%r14, %r14
ffff80000010db8c: 74 58                	je	0xffff80000010dbe6 <lab1_check_free_list_avail+0xe6>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010db8e: 48 bf d9 08 11 00 00 80 ff ff	movabsq	$-140737487238951, %rdi # imm = 0xFFFF8000001108D9
ffff80000010db98: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010dba2: 31 c0                	xorl	%eax, %eax
ffff80000010dba4: ff d1                	callq	*%rcx
; }
ffff80000010dba6: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dbaa: 5b                   	popq	%rbx
ffff80000010dbab: 41 5c                	popq	%r12
ffff80000010dbad: 41 5d                	popq	%r13
ffff80000010dbaf: 41 5e                	popq	%r14
ffff80000010dbb1: 41 5f                	popq	%r15
ffff80000010dbb3: 5d                   	popq	%rbp
ffff80000010dbb4: c3                   	retq
; 	assert(nfree_basemem > 0);
ffff80000010dbb5: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dbbf: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010dbc9: 48 b9 68 0e 11 00 00 80 ff ff	movabsq	$-140737487237528, %rcx # imm = 0xFFFF800000110E68
ffff80000010dbd3: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010dbdd: be 21 00 00 00       	movl	$33, %esi
ffff80000010dbe2: 31 c0                	xorl	%eax, %eax
ffff80000010dbe4: ff d3                	callq	*%rbx
; 	assert(nfree_extmem > 0);
ffff80000010dbe6: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dbf0: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010dbfa: 48 b9 59 0c 11 00 00 80 ff ff	movabsq	$-140737487238055, %rcx # imm = 0xFFFF800000110C59
ffff80000010dc04: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010dc0e: be 22 00 00 00       	movl	$34, %esi
ffff80000010dc13: 31 c0                	xorl	%eax, %eax
ffff80000010dc15: ff d3                	callq	*%rbx
ffff80000010dc17: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010dc20 <page2pa>:
; {
ffff80000010dc20: 55                   	pushq	%rbp
ffff80000010dc21: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc24: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010dc27: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010dc31: 48 2b 01             	subq	(%rcx), %rax
ffff80000010dc34: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010dc38: 5d                   	popq	%rbp
ffff80000010dc39: c3                   	retq
ffff80000010dc3a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010dc40 <lab1_check_free_list_order>:
; {
ffff80000010dc40: 55                   	pushq	%rbp
ffff80000010dc41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc44: 31 c9                	xorl	%ecx, %ecx
ffff80000010dc46: 49 b8 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r8 # imm = 0xFFFF800000114240
ffff80000010dc50: 45 31 c9             	xorl	%r9d, %r9d
ffff80000010dc53: eb 15                	jmp	0xffff80000010dc6a <lab1_check_free_list_order+0x2a>
ffff80000010dc55: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc5f: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010dc60: 49 83 c1 01          	addq	$1, %r9
ffff80000010dc64: 49 83 f9 0a          	cmpq	$10, %r9
ffff80000010dc68: 74 32                	je	0xffff80000010dc9c <lab1_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dc6a: 4c 89 ce             	movq	%r9, %rsi
ffff80000010dc6d: 48 c1 e6 04          	shlq	$4, %rsi
ffff80000010dc71: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dc75: 4c 01 c6             	addq	%r8, %rsi
ffff80000010dc78: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010dc7b: 74 e3                	je	0xffff80000010dc60 <lab1_check_free_list_order+0x20>
ffff80000010dc7d: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff80000010dc80: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010dc84: 83 e0 7f             	andl	$127, %eax
ffff80000010dc87: 31 d2                	xorl	%edx, %edx
ffff80000010dc89: 49 39 c1             	cmpq	%rax, %r9
ffff80000010dc8c: 0f 95 c2             	setne	%dl
ffff80000010dc8f: 48 01 d1             	addq	%rdx, %rcx
ffff80000010dc92: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dc95: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010dc98: 75 e6                	jne	0xffff80000010dc80 <lab1_check_free_list_order+0x40>
ffff80000010dc9a: eb c4                	jmp	0xffff80000010dc60 <lab1_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000010dc9c: 48 85 c9             	testq	%rcx, %rcx
ffff80000010dc9f: 75 1a                	jne	0xffff80000010dcbb <lab1_check_free_list_order+0x7b>
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010dca1: 48 bf 26 0d 11 00 00 80 ff ff	movabsq	$-140737487237850, %rdi # imm = 0xFFFF800000110D26
ffff80000010dcab: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010dcb5: 31 c0                	xorl	%eax, %eax
ffff80000010dcb7: ff d1                	callq	*%rcx
; }
ffff80000010dcb9: 5d                   	popq	%rbp
ffff80000010dcba: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000010dcbb: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dcc5: 48 ba d8 0e 11 00 00 80 ff ff	movabsq	$-140737487237416, %rdx # imm = 0xFFFF800000110ED8
ffff80000010dccf: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010dcd9: be 3b 00 00 00       	movl	$59, %esi
ffff80000010dcde: 31 c0                	xorl	%eax, %eax
ffff80000010dce0: 41 ff d0             	callq	*%r8
ffff80000010dce3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dced: 0f 1f 00             	nopl	(%rax)

ffff80000010dcf0 <lab1_check_memory_layout>:
; {
ffff80000010dcf0: 55                   	pushq	%rbp
ffff80000010dcf1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dcf4: 41 57                	pushq	%r15
ffff80000010dcf6: 41 56                	pushq	%r14
ffff80000010dcf8: 41 55                	pushq	%r13
ffff80000010dcfa: 41 54                	pushq	%r12
ffff80000010dcfc: 53                   	pushq	%rbx
ffff80000010dcfd: 50                   	pushq	%rax
ffff80000010dcfe: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010dd01: 8b 3f                	movl	(%rdi), %edi
ffff80000010dd03: 48 b8 70 de 10 00 00 80 ff ff	movabsq	$-140737487249808, %rax # imm = 0xFFFF80000010DE70
ffff80000010dd0d: ff d0                	callq	*%rax
ffff80000010dd0f: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff80000010dd12: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010dd1c: 31 ff                	xorl	%edi, %edi
ffff80000010dd1e: ff d0                	callq	*%rax
ffff80000010dd20: 48 b9 d0 de 10 00 00 80 ff ff	movabsq	$-140737487249712, %rcx # imm = 0xFFFF80000010DED0
ffff80000010dd2a: bf 49 00 00 00       	movl	$73, %edi
ffff80000010dd2f: 48 89 c6             	movq	%rax, %rsi
ffff80000010dd32: ff d1                	callq	*%rcx
ffff80000010dd34: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010dd38: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010dd3d: 0f 84 c6 00 00 00    	je	0xffff80000010de09 <lab1_check_memory_layout+0x119>
ffff80000010dd43: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010dd46: eb 1d                	jmp	0xffff80000010dd65 <lab1_check_memory_layout+0x75>
ffff80000010dd48: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010dd50: 49 83 c7 01          	addq	$1, %r15
ffff80000010dd54: 49 83 c4 18          	addq	$24, %r12
ffff80000010dd58: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010dd5c: 49 39 c7             	cmpq	%rax, %r15
ffff80000010dd5f: 0f 83 a4 00 00 00    	jae	0xffff80000010de09 <lab1_check_memory_layout+0x119>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010dd65: 49 8b 1c 24          	movq	(%r12), %rbx
ffff80000010dd69: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010dd6e: 48 01 d8             	addq	%rbx, %rax
ffff80000010dd71: eb 28                	jmp	0xffff80000010dd9b <lab1_check_memory_layout+0xab>
ffff80000010dd73: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dd7d: 0f 1f 00             	nopl	(%rax)
; 			    page->pp_free) {
ffff80000010dd80: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff80000010dd85: 0f 88 a5 00 00 00    	js	0xffff80000010de30 <lab1_check_memory_layout+0x140>
; 		     pa += PAGE_SIZE) {
ffff80000010dd8b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010dd92: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010dd97: 49 03 04 24          	addq	(%r12), %rax
ffff80000010dd9b: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010dd9e: 73 b0                	jae	0xffff80000010dd50 <lab1_check_memory_layout+0x60>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010dda0: 48 81 fb ff ff 7f 00 	cmpq	$8388607, %rbx          # imm = 0x7FFFFF
ffff80000010dda7: 77 e2                	ja	0xffff80000010dd8b <lab1_check_memory_layout+0x9b>
; 			page = pa2page(pa);
ffff80000010dda9: 48 89 df             	movq	%rbx, %rdi
ffff80000010ddac: 48 b8 20 df 10 00 00 80 ff ff	movabsq	$-140737487249632, %rax # imm = 0xFFFF80000010DF20
ffff80000010ddb6: ff d0                	callq	*%rax
ffff80000010ddb8: 49 89 c5             	movq	%rax, %r13
; 			if ((pa == 0 ||
ffff80000010ddbb: 48 85 db             	testq	%rbx, %rbx
ffff80000010ddbe: 74 c0                	je	0xffff80000010dd80 <lab1_check_memory_layout+0x90>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010ddc0: bf 54 00 00 00       	movl	$84, %edi
ffff80000010ddc5: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ddc8: 48 b8 d0 de 10 00 00 80 ff ff	movabsq	$-140737487249712, %rax # imm = 0xFFFF80000010DED0
ffff80000010ddd2: ff d0                	callq	*%rax
ffff80000010ddd4: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000010ddde: 48 21 c8             	andq	%rcx, %rax
ffff80000010dde1: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010dde4: 74 9a                	je	0xffff80000010dd80 <lab1_check_memory_layout+0x90>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010dde6: 49 3b 5e 08          	cmpq	8(%r14), %rbx
ffff80000010ddea: 74 94                	je	0xffff80000010dd80 <lab1_check_memory_layout+0x90>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010ddec: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000010ddf3: 72 06                	jb	0xffff80000010ddfb <lab1_check_memory_layout+0x10b>
ffff80000010ddf5: 48 3b 5d d0          	cmpq	-48(%rbp), %rbx
ffff80000010ddf9: 72 85                	jb	0xffff80000010dd80 <lab1_check_memory_layout+0x90>
; 			    entry->type != MMAP_FREE) &&
ffff80000010ddfb: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff80000010de01: 0f 85 79 ff ff ff    	jne	0xffff80000010dd80 <lab1_check_memory_layout+0x90>
ffff80000010de07: eb 82                	jmp	0xffff80000010dd8b <lab1_check_memory_layout+0x9b>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010de09: 48 bf 29 09 11 00 00 80 ff ff	movabsq	$-140737487238871, %rdi # imm = 0xFFFF800000110929
ffff80000010de13: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010de1d: 31 c0                	xorl	%eax, %eax
ffff80000010de1f: ff d1                	callq	*%rcx
; }
ffff80000010de21: 48 83 c4 08          	addq	$8, %rsp
ffff80000010de25: 5b                   	popq	%rbx
ffff80000010de26: 41 5c                	popq	%r12
ffff80000010de28: 41 5d                	popq	%r13
ffff80000010de2a: 41 5e                	popq	%r14
ffff80000010de2c: 41 5f                	popq	%r15
ffff80000010de2e: 5d                   	popq	%rbp
ffff80000010de2f: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010de30: 48 b8 20 dc 10 00 00 80 ff ff	movabsq	$-140737487250400, %rax # imm = 0xFFFF80000010DC20
ffff80000010de3a: 4c 89 ef             	movq	%r13, %rdi
ffff80000010de3d: ff d0                	callq	*%rax
ffff80000010de3f: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010de49: 48 ba bb 09 11 00 00 80 ff ff	movabsq	$-140737487238725, %rdx # imm = 0xFFFF8000001109BB
ffff80000010de53: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010de5d: be 59 00 00 00       	movl	$89, %esi
ffff80000010de62: 48 89 c1             	movq	%rax, %rcx
ffff80000010de65: 31 c0                	xorl	%eax, %eax
ffff80000010de67: ff d3                	callq	*%rbx
ffff80000010de69: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010de70 <_kaddr>:
; {
ffff80000010de70: 55                   	pushq	%rbp
ffff80000010de71: 48 89 e5             	movq	%rsp, %rbp
ffff80000010de74: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010de77: 48 89 f9             	movq	%rdi, %rcx
ffff80000010de7a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010de7e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010de88: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010de8b: 73 0f                	jae	0xffff80000010de9c <_kaddr+0x2c>
ffff80000010de8d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010de97: 48 01 c8             	addq	%rcx, %rax
ffff80000010de9a: 5d                   	popq	%rbp
ffff80000010de9b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010de9c: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dea6: 48 ba e3 0c 11 00 00 80 ff ff	movabsq	$-140737487237917, %rdx # imm = 0xFFFF800000110CE3
ffff80000010deb0: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010deba: be 48 00 00 00       	movl	$72, %esi
ffff80000010debf: 48 89 c1             	movq	%rax, %rcx
ffff80000010dec2: 31 c0                	xorl	%eax, %eax
ffff80000010dec4: 41 ff d0             	callq	*%r8
ffff80000010dec7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010ded0 <_paddr>:
; {
ffff80000010ded0: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010ded3: 48 89 f1             	movq	%rsi, %rcx
ffff80000010ded6: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010deda: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010dee0: 76 0e                	jbe	0xffff80000010def0 <_paddr+0x20>
ffff80000010dee2: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010deec: 48 01 c8             	addq	%rcx, %rax
ffff80000010deef: c3                   	retq
ffff80000010def0: 55                   	pushq	%rbp
ffff80000010def1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010def4: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010def6: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010df00: 48 ba 05 09 11 00 00 80 ff ff	movabsq	$-140737487238907, %rdx # imm = 0xFFFF800000110905
ffff80000010df0a: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010df14: 48 89 c1             	movq	%rax, %rcx
ffff80000010df17: 31 c0                	xorl	%eax, %eax
ffff80000010df19: 41 ff d0             	callq	*%r8
ffff80000010df1c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010df20 <pa2page>:
; {
ffff80000010df20: 55                   	pushq	%rbp
ffff80000010df21: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010df24: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010df28: 48 b8 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rax # imm = 0xFFFF8000001142E0
ffff80000010df32: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010df35: 73 16                	jae	0xffff80000010df4d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010df37: 48 b8 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rax # imm = 0xFFFF8000001142E8
ffff80000010df41: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010df45: 48 03 38             	addq	(%rax), %rdi
ffff80000010df48: 48 89 f8             	movq	%rdi, %rax
ffff80000010df4b: 5d                   	popq	%rbp
ffff80000010df4c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010df4d: 48 bf 23 08 11 00 00 80 ff ff	movabsq	$-140737487239133, %rdi # imm = 0xFFFF800000110823
ffff80000010df57: 48 ba 16 0f 11 00 00 80 ff ff	movabsq	$-140737487237354, %rdx # imm = 0xFFFF800000110F16
ffff80000010df61: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010df6b: be 47 00 00 00       	movl	$71, %esi
ffff80000010df70: 31 c0                	xorl	%eax, %eax
ffff80000010df72: ff d1                	callq	*%rcx
ffff80000010df74: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010df7e: 66 90                	nop

ffff80000010df80 <check_buddy_consistency>:
; {
ffff80000010df80: 55                   	pushq	%rbp
ffff80000010df81: 48 89 e5             	movq	%rsp, %rbp
ffff80000010df84: 41 57                	pushq	%r15
ffff80000010df86: 41 56                	pushq	%r14
ffff80000010df88: 41 55                	pushq	%r13
ffff80000010df8a: 41 54                	pushq	%r12
ffff80000010df8c: 53                   	pushq	%rbx
ffff80000010df8d: 50                   	pushq	%rax
ffff80000010df8e: 49 89 d4             	movq	%rdx, %r12
ffff80000010df91: 49 89 f7             	movq	%rsi, %r15
ffff80000010df94: 49 89 fe             	movq	%rdi, %r14
; 	page = pa2page(addr);
ffff80000010df97: 48 b8 20 df 10 00 00 80 ff ff	movabsq	$-140737487249632, %rax # imm = 0xFFFF80000010DF20
ffff80000010dfa1: ff d0                	callq	*%rax
ffff80000010dfa3: 48 89 c3             	movq	%rax, %rbx
; 	if (parent && parent != page) {
ffff80000010dfa6: 4d 85 e4             	testq	%r12, %r12
ffff80000010dfa9: 74 3f                	je	0xffff80000010dfea <check_buddy_consistency+0x6a>
ffff80000010dfab: 4c 39 e3             	cmpq	%r12, %rbx
ffff80000010dfae: 74 3a                	je	0xffff80000010dfea <check_buddy_consistency+0x6a>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010dfb0: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010dfb5: 45 84 ed             	testb	%r13b, %r13b
ffff80000010dfb8: 0f 88 ce 00 00 00    	js	0xffff80000010e08c <check_buddy_consistency+0x10c>
ffff80000010dfbe: 48 89 df             	movq	%rbx, %rdi
ffff80000010dfc1: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010dfcb: ff d0                	callq	*%rax
ffff80000010dfcd: 85 c0                	testl	%eax, %eax
ffff80000010dfcf: 0f 84 b7 00 00 00    	je	0xffff80000010e08c <check_buddy_consistency+0x10c>
; 			page->pp_order < parent->pp_order) {
ffff80000010dfd5: 44 89 e8             	movl	%r13d, %eax
ffff80000010dfd8: 24 7f                	andb	$127, %al
ffff80000010dfda: 41 8a 4c 24 12       	movb	18(%r12), %cl
ffff80000010dfdf: 80 e1 7f             	andb	$127, %cl
ffff80000010dfe2: 38 c8                	cmpb	%cl, %al
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010dfe4: 0f 82 a2 00 00 00    	jb	0xffff80000010e08c <check_buddy_consistency+0x10c>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010dfea: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010dfef: 45 84 ed             	testb	%r13b, %r13b
ffff80000010dff2: 79 1c                	jns	0xffff80000010e010 <check_buddy_consistency+0x90>
ffff80000010dff4: 48 89 df             	movq	%rbx, %rdi
ffff80000010dff7: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010e001: ff d0                	callq	*%rax
ffff80000010e003: 85 c0                	testl	%eax, %eax
ffff80000010e005: 0f 85 13 01 00 00    	jne	0xffff80000010e11e <check_buddy_consistency+0x19e>
ffff80000010e00b: 45 84 ed             	testb	%r13b, %r13b
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff80000010e00e: 78 1c                	js	0xffff80000010e02c <check_buddy_consistency+0xac>
ffff80000010e010: 48 89 df             	movq	%rbx, %rdi
ffff80000010e013: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010e01d: ff d0                	callq	*%rax
ffff80000010e01f: 85 c0                	testl	%eax, %eax
ffff80000010e021: 0f 84 bf 00 00 00    	je	0xffff80000010e0e6 <check_buddy_consistency+0x166>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010e027: 45 84 ed             	testb	%r13b, %r13b
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010e02a: 79 15                	jns	0xffff80000010e041 <check_buddy_consistency+0xc1>
ffff80000010e02c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e02f: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010e039: ff d0                	callq	*%rax
ffff80000010e03b: 85 c0                	testl	%eax, %eax
ffff80000010e03d: 4c 0f 45 e3          	cmovneq	%rbx, %r12
; 	if (order == 0) {
ffff80000010e041: 4d 85 ff             	testq	%r15, %r15
ffff80000010e044: 74 37                	je	0xffff80000010e07d <check_buddy_consistency+0xfd>
; 	--order;
ffff80000010e046: 49 8d 5f ff          	leaq	-1(%r15), %rbx
; 	check_buddy_consistency(addr, order, parent);
ffff80000010e04a: 49 bd 80 df 10 00 00 80 ff ff	movabsq	$-140737487249536, %r13 # imm = 0xFFFF80000010DF80
ffff80000010e054: 4c 89 f7             	movq	%r14, %rdi
ffff80000010e057: 48 89 de             	movq	%rbx, %rsi
ffff80000010e05a: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e05d: 41 ff d5             	callq	*%r13
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff80000010e060: 41 80 c7 0b          	addb	$11, %r15b
ffff80000010e064: b8 01 00 00 00       	movl	$1, %eax
ffff80000010e069: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e06c: d3 e0                	shll	%cl, %eax
ffff80000010e06e: 48 63 f8             	movslq	%eax, %rdi
ffff80000010e071: 4c 09 f7             	orq	%r14, %rdi
ffff80000010e074: 48 89 de             	movq	%rbx, %rsi
ffff80000010e077: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e07a: 41 ff d5             	callq	*%r13
; }
ffff80000010e07d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e081: 5b                   	popq	%rbx
ffff80000010e082: 41 5c                	popq	%r12
ffff80000010e084: 41 5d                	popq	%r13
ffff80000010e086: 41 5e                	popq	%r14
ffff80000010e088: 41 5f                	popq	%r15
ffff80000010e08a: 5d                   	popq	%rbp
ffff80000010e08b: c3                   	retq
; 			panic("page %p of order %u is free, while parent page "
ffff80000010e08c: 49 be 20 dc 10 00 00 80 ff ff	movabsq	$-140737487250400, %r14 # imm = 0xFFFF80000010DC20
ffff80000010e096: 48 89 df             	movq	%rbx, %rdi
ffff80000010e099: 41 ff d6             	callq	*%r14
ffff80000010e09c: 48 89 c3             	movq	%rax, %rbx
ffff80000010e09f: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e0a3: 4c 89 e7             	movq	%r12, %rdi
ffff80000010e0a6: 41 ff d6             	callq	*%r14
ffff80000010e0a9: 41 0f b6 4c 24 12    	movzbl	18(%r12), %ecx
ffff80000010e0af: 83 e1 7f             	andl	$127, %ecx
ffff80000010e0b2: 89 0c 24             	movl	%ecx, (%rsp)
ffff80000010e0b5: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e0bf: 48 ba 6a 0c 11 00 00 80 ff ff	movabsq	$-140737487238038, %rdx # imm = 0xFFFF800000110C6A
ffff80000010e0c9: 49 ba 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r10 # imm = 0xFFFF80000010C870
ffff80000010e0d3: be 6d 00 00 00       	movl	$109, %esi
ffff80000010e0d8: 48 89 d9             	movq	%rbx, %rcx
ffff80000010e0db: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e0de: 49 89 c1             	movq	%rax, %r9
ffff80000010e0e1: 31 c0                	xorl	%eax, %eax
ffff80000010e0e3: 41 ff d2             	callq	*%r10
; 		panic("page %p of order %u is in use, but on the free list",
ffff80000010e0e6: 48 b8 20 dc 10 00 00 80 ff ff	movabsq	$-140737487250400, %rax # imm = 0xFFFF80000010DC20
ffff80000010e0f0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e0f3: ff d0                	callq	*%rax
ffff80000010e0f5: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e0f9: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e103: 48 ba 02 0b 11 00 00 80 ff ff	movabsq	$-140737487238398, %rdx # imm = 0xFFFF800000110B02
ffff80000010e10d: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e117: be 78 00 00 00       	movl	$120, %esi
ffff80000010e11c: eb 36                	jmp	0xffff80000010e154 <check_buddy_consistency+0x1d4>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000010e11e: 48 b8 20 dc 10 00 00 80 ff ff	movabsq	$-140737487250400, %rax # imm = 0xFFFF80000010DC20
ffff80000010e128: 48 89 df             	movq	%rbx, %rdi
ffff80000010e12b: ff d0                	callq	*%rax
ffff80000010e12d: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e131: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e13b: 48 ba 52 0d 11 00 00 80 ff ff	movabsq	$-140737487237806, %rdx # imm = 0xFFFF800000110D52
ffff80000010e145: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e14f: be 73 00 00 00       	movl	$115, %esi
ffff80000010e154: 48 89 c1             	movq	%rax, %rcx
ffff80000010e157: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e15a: 31 c0                	xorl	%eax, %eax
ffff80000010e15c: ff d3                	callq	*%rbx
ffff80000010e15e: 66 90                	nop

ffff80000010e160 <list_is_empty>:
; {
ffff80000010e160: 55                   	pushq	%rbp
ffff80000010e161: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff80000010e164: 31 c0                	xorl	%eax, %eax
ffff80000010e166: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010e169: 0f 94 c0             	sete	%al
ffff80000010e16c: 5d                   	popq	%rbp
ffff80000010e16d: c3                   	retq
ffff80000010e16e: 66 90                	nop

ffff80000010e170 <lab1_check_buddy_consistency>:
; {
ffff80000010e170: 55                   	pushq	%rbp
ffff80000010e171: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e174: 41 56                	pushq	%r14
ffff80000010e176: 53                   	pushq	%rbx
ffff80000010e177: 48 c7 c3 00 00 e0 ff 	movq	$-2097152, %rbx         # imm = 0xFFE00000
ffff80000010e17e: 49 be 80 df 10 00 00 80 ff ff	movabsq	$-140737487249536, %r14 # imm = 0xFFFF80000010DF80
ffff80000010e188: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000010e190: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
ffff80000010e197: be 09 00 00 00       	movl	$9, %esi
ffff80000010e19c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e19f: 31 d2                	xorl	%edx, %edx
ffff80000010e1a1: 41 ff d6             	callq	*%r14
; 	     addr < BOOT_MAP_LIM;
ffff80000010e1a4: 48 81 fb 00 00 60 00 	cmpq	$6291456, %rbx          # imm = 0x600000
; 	for (addr = 0;
ffff80000010e1ab: 72 e3                	jb	0xffff80000010e190 <lab1_check_buddy_consistency+0x20>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff80000010e1ad: 48 bf d1 0f 11 00 00 80 ff ff	movabsq	$-140737487237167, %rdi # imm = 0xFFFF800000110FD1
ffff80000010e1b7: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010e1c1: 31 c0                	xorl	%eax, %eax
ffff80000010e1c3: ff d1                	callq	*%rcx
; }
ffff80000010e1c5: 5b                   	popq	%rbx
ffff80000010e1c6: 41 5e                	popq	%r14
ffff80000010e1c8: 5d                   	popq	%rbp
ffff80000010e1c9: c3                   	retq
ffff80000010e1ca: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e1d0 <lab1_check_split_and_merge>:
; {
ffff80000010e1d0: 55                   	pushq	%rbp
ffff80000010e1d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e1d4: 41 57                	pushq	%r15
ffff80000010e1d6: 41 56                	pushq	%r14
ffff80000010e1d8: 41 55                	pushq	%r13
ffff80000010e1da: 41 54                	pushq	%r12
ffff80000010e1dc: 53                   	pushq	%rbx
ffff80000010e1dd: 48 81 ec a8 00 00 00 	subq	$168, %rsp
ffff80000010e1e4: 89 fb                	movl	%edi, %ebx
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff80000010e1e6: 49 be b0 d6 10 00 00 80 ff ff	movabsq	$-140737487251792, %r14 # imm = 0xFFFF80000010D6B0
ffff80000010e1f0: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e1f5: 41 ff d6             	callq	*%r14
ffff80000010e1f8: 49 89 c4             	movq	%rax, %r12
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010e1fb: 48 b8 10 d8 10 00 00 80 ff ff	movabsq	$-140737487251440, %rax # imm = 0xFFFF80000010D810
ffff80000010e205: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e20a: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010e20c: 48 85 c0             	testq	%rax, %rax
ffff80000010e20f: 0f 84 5d 02 00 00    	je	0xffff80000010e472 <lab1_check_split_and_merge+0x2a2>
ffff80000010e215: 49 89 c7             	movq	%rax, %r15
ffff80000010e218: 89 5d d4             	movl	%ebx, -44(%rbp)
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010e21b: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e220: 41 ff d6             	callq	*%r14
ffff80000010e223: 48 83 c0 01          	addq	$1, %rax
ffff80000010e227: 4c 39 e0             	cmpq	%r12, %rax
ffff80000010e22a: 0f 85 69 02 00 00    	jne	0xffff80000010e499 <lab1_check_split_and_merge+0x2c9>
ffff80000010e230: 31 db                	xorl	%ebx, %ebx
ffff80000010e232: 49 bc 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r12 # imm = 0xFFFF800000114240
ffff80000010e23c: 49 bd 10 e6 10 00 00 80 ff ff	movabsq	$-140737487247856, %r13 # imm = 0xFFFF80000010E610
ffff80000010e246: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		stolen_free_list[order] = buddy_free_list[order];
ffff80000010e250: 4a 8d 3c 23          	leaq	(%rbx,%r12), %rdi
ffff80000010e254: 4a 8b 04 23          	movq	(%rbx,%r12), %rax
ffff80000010e258: 4a 8b 4c 23 08       	movq	8(%rbx,%r12), %rcx
ffff80000010e25d: 48 89 8c 1d 38 ff ff ff      	movq	%rcx, -200(%rbp,%rbx)
ffff80000010e265: 48 89 84 1d 30 ff ff ff      	movq	%rax, -208(%rbp,%rbx)
; 		list_init(buddy_free_list + order);
ffff80000010e26d: 41 ff d5             	callq	*%r13
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e270: 48 83 c3 10          	addq	$16, %rbx
ffff80000010e274: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010e27b: 75 d3                	jne	0xffff80000010e250 <lab1_check_split_and_merge+0x80>
; 	page_free(page);
ffff80000010e27d: 48 b8 30 d8 10 00 00 80 ff ff	movabsq	$-140737487251408, %rax # imm = 0xFFFF80000010D830
ffff80000010e287: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e28a: ff d0                	callq	*%rax
ffff80000010e28c: 31 db                	xorl	%ebx, %ebx
ffff80000010e28e: 66 90                	nop
; 		assert(count_free_pages(order) == 0);
ffff80000010e290: 48 89 df             	movq	%rbx, %rdi
ffff80000010e293: 41 ff d6             	callq	*%r14
ffff80000010e296: 48 85 c0             	testq	%rax, %rax
ffff80000010e299: 0f 85 40 01 00 00    	jne	0xffff80000010e3df <lab1_check_split_and_merge+0x20f>
ffff80000010e29f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e2a3: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e2a7: 75 e7                	jne	0xffff80000010e290 <lab1_check_split_and_merge+0xc0>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e2a9: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e2ae: 41 ff d6             	callq	*%r14
ffff80000010e2b1: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e2b5: 0f 85 0f 02 00 00    	jne	0xffff80000010e4ca <lab1_check_split_and_merge+0x2fa>
; 	page = page_alloc(0);
ffff80000010e2bb: 49 bd 20 d8 10 00 00 80 ff ff	movabsq	$-140737487251424, %r13 # imm = 0xFFFF80000010D820
ffff80000010e2c5: 31 ff                	xorl	%edi, %edi
ffff80000010e2c7: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010e2ca: 48 85 c0             	testq	%rax, %rax
ffff80000010e2cd: 0f 84 28 02 00 00    	je	0xffff80000010e4fb <lab1_check_split_and_merge+0x32b>
ffff80000010e2d3: 49 89 c7             	movq	%rax, %r15
ffff80000010e2d6: 31 db                	xorl	%ebx, %ebx
ffff80000010e2d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		assert(count_free_pages(order) == 1);
ffff80000010e2e0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e2e3: 41 ff d6             	callq	*%r14
ffff80000010e2e6: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e2ea: 0f 85 20 01 00 00    	jne	0xffff80000010e410 <lab1_check_split_and_merge+0x240>
ffff80000010e2f0: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e2f4: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e2f8: 75 e6                	jne	0xffff80000010e2e0 <lab1_check_split_and_merge+0x110>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010e2fa: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e2ff: 41 ff d6             	callq	*%r14
ffff80000010e302: 48 85 c0             	testq	%rax, %rax
ffff80000010e305: 0f 85 17 02 00 00    	jne	0xffff80000010e522 <lab1_check_split_and_merge+0x352>
; 	page_free(page);
ffff80000010e30b: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e30e: 48 b8 30 d8 10 00 00 80 ff ff	movabsq	$-140737487251408, %rax # imm = 0xFFFF80000010D830
ffff80000010e318: ff d0                	callq	*%rax
ffff80000010e31a: 31 db                	xorl	%ebx, %ebx
ffff80000010e31c: 0f 1f 40 00          	nopl	(%rax)
; 		assert(count_free_pages(order) == 0);
ffff80000010e320: 48 89 df             	movq	%rbx, %rdi
ffff80000010e323: 41 ff d6             	callq	*%r14
ffff80000010e326: 48 85 c0             	testq	%rax, %rax
ffff80000010e329: 0f 85 12 01 00 00    	jne	0xffff80000010e441 <lab1_check_split_and_merge+0x271>
ffff80000010e32f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e333: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e337: 75 e7                	jne	0xffff80000010e320 <lab1_check_split_and_merge+0x150>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e339: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e33e: 41 ff d6             	callq	*%r14
ffff80000010e341: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e345: 0f 85 08 02 00 00    	jne	0xffff80000010e553 <lab1_check_split_and_merge+0x383>
; 	if (flags & ALLOC_HUGE)
ffff80000010e34b: f6 45 d4 02          	testb	$2, -44(%rbp)
ffff80000010e34f: 75 13                	jne	0xffff80000010e364 <lab1_check_split_and_merge+0x194>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010e351: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e356: 48 b8 10 d8 10 00 00 80 ff ff	movabsq	$-140737487251440, %rax # imm = 0xFFFF80000010D810
ffff80000010e360: ff d0                	callq	*%rax
ffff80000010e362: eb 08                	jmp	0xffff80000010e36c <lab1_check_split_and_merge+0x19c>
; 		page = page_alloc(ALLOC_HUGE);
ffff80000010e364: bf 02 00 00 00       	movl	$2, %edi
ffff80000010e369: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010e36c: 48 85 c0             	testq	%rax, %rax
ffff80000010e36f: 0f 84 0f 02 00 00    	je	0xffff80000010e584 <lab1_check_split_and_merge+0x3b4>
ffff80000010e375: 31 c9                	xorl	%ecx, %ecx
ffff80000010e377: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		buddy_free_list[order] = stolen_free_list[order];
ffff80000010e380: 48 8b 94 0d 30 ff ff ff      	movq	-208(%rbp,%rcx), %rdx
ffff80000010e388: 48 8b b4 0d 38 ff ff ff      	movq	-200(%rbp,%rcx), %rsi
ffff80000010e390: 4a 89 74 21 08       	movq	%rsi, 8(%rcx,%r12)
ffff80000010e395: 4a 89 14 21          	movq	%rdx, (%rcx,%r12)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e399: 48 83 c1 10          	addq	$16, %rcx
ffff80000010e39d: 48 81 f9 a0 00 00 00 	cmpq	$160, %rcx
ffff80000010e3a4: 75 da                	jne	0xffff80000010e380 <lab1_check_split_and_merge+0x1b0>
; 	page_free(page);
ffff80000010e3a6: 48 89 c7             	movq	%rax, %rdi
ffff80000010e3a9: 48 b8 30 d8 10 00 00 80 ff ff	movabsq	$-140737487251408, %rax # imm = 0xFFFF80000010D830
ffff80000010e3b3: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff80000010e3b5: 48 bf 1f 0e 11 00 00 80 ff ff	movabsq	$-140737487237601, %rdi # imm = 0xFFFF800000110E1F
ffff80000010e3bf: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010e3c9: 31 c0                	xorl	%eax, %eax
ffff80000010e3cb: ff d1                	callq	*%rcx
; }
ffff80000010e3cd: 48 81 c4 a8 00 00 00 	addq	$168, %rsp
ffff80000010e3d4: 5b                   	popq	%rbx
ffff80000010e3d5: 41 5c                	popq	%r12
ffff80000010e3d7: 41 5d                	popq	%r13
ffff80000010e3d9: 41 5e                	popq	%r14
ffff80000010e3db: 41 5f                	popq	%r15
ffff80000010e3dd: 5d                   	popq	%rbp
ffff80000010e3de: c3                   	retq
; 		assert(count_free_pages(order) == 0);
ffff80000010e3df: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e3e9: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e3f3: 48 b9 7a 0e 11 00 00 80 ff ff	movabsq	$-140737487237510, %rcx # imm = 0xFFFF800000110E7A
ffff80000010e3fd: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e407: be ba 00 00 00       	movl	$186, %esi
ffff80000010e40c: 31 c0                	xorl	%eax, %eax
ffff80000010e40e: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 1);
ffff80000010e410: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e41a: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e424: 48 b9 70 0f 11 00 00 80 ff ff	movabsq	$-140737487237264, %rcx # imm = 0xFFFF800000110F70
ffff80000010e42e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e438: be c8 00 00 00       	movl	$200, %esi
ffff80000010e43d: 31 c0                	xorl	%eax, %eax
ffff80000010e43f: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 0);
ffff80000010e441: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e44b: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e455: 48 b9 7a 0e 11 00 00 80 ff ff	movabsq	$-140737487237510, %rcx # imm = 0xFFFF800000110E7A
ffff80000010e45f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e469: be d2 00 00 00       	movl	$210, %esi
ffff80000010e46e: 31 c0                	xorl	%eax, %eax
ffff80000010e470: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010e472: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e47c: 48 ba 36 0b 11 00 00 80 ff ff	movabsq	$-140737487238346, %rdx # imm = 0xFFFF800000110B36
ffff80000010e486: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e490: be a9 00 00 00       	movl	$169, %esi
ffff80000010e495: 31 c0                	xorl	%eax, %eax
ffff80000010e497: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010e499: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e4a3: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e4ad: 48 b9 c9 0b 11 00 00 80 ff ff	movabsq	$-140737487238199, %rcx # imm = 0xFFFF800000110BC9
ffff80000010e4b7: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e4c1: be ad 00 00 00       	movl	$173, %esi
ffff80000010e4c6: 31 c0                	xorl	%eax, %eax
ffff80000010e4c8: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e4ca: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e4d4: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e4de: 48 b9 3e 08 11 00 00 80 ff ff	movabsq	$-140737487239106, %rcx # imm = 0xFFFF80000011083E
ffff80000010e4e8: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e4f2: be bd 00 00 00       	movl	$189, %esi
ffff80000010e4f7: 31 c0                	xorl	%eax, %eax
ffff80000010e4f9: ff d3                	callq	*%rbx
; 		panic("can't allocate 4K page!");
ffff80000010e4fb: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e505: 48 ba 32 0a 11 00 00 80 ff ff	movabsq	$-140737487238606, %rdx # imm = 0xFFFF800000110A32
ffff80000010e50f: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e519: be c3 00 00 00       	movl	$195, %esi
ffff80000010e51e: 31 c0                	xorl	%eax, %eax
ffff80000010e520: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010e522: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e52c: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e536: 48 b9 79 0a 11 00 00 80 ff ff	movabsq	$-140737487238535, %rcx # imm = 0xFFFF800000110A79
ffff80000010e540: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e54a: be cb 00 00 00       	movl	$203, %esi
ffff80000010e54f: 31 c0                	xorl	%eax, %eax
ffff80000010e551: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e553: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e55d: 48 ba ed 0a 11 00 00 80 ff ff	movabsq	$-140737487238419, %rdx # imm = 0xFFFF800000110AED
ffff80000010e567: 48 b9 3e 08 11 00 00 80 ff ff	movabsq	$-140737487239106, %rcx # imm = 0xFFFF80000011083E
ffff80000010e571: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e57b: be d5 00 00 00       	movl	$213, %esi
ffff80000010e580: 31 c0                	xorl	%eax, %eax
ffff80000010e582: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010e584: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e58e: 48 ba 36 0b 11 00 00 80 ff ff	movabsq	$-140737487238346, %rdx # imm = 0xFFFF800000110B36
ffff80000010e598: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e5a2: be de 00 00 00       	movl	$222, %esi
ffff80000010e5a7: 31 c0                	xorl	%eax, %eax
ffff80000010e5a9: ff d1                	callq	*%rcx
ffff80000010e5ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010e5b0 <lab1_check_mem>:
; {
ffff80000010e5b0: 55                   	pushq	%rbp
ffff80000010e5b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e5b4: 53                   	pushq	%rbx
ffff80000010e5b5: 50                   	pushq	%rax
ffff80000010e5b6: 48 89 fb             	movq	%rdi, %rbx
; 	lab1_check_free_list_avail();
ffff80000010e5b9: 48 b8 00 db 10 00 00 80 ff ff	movabsq	$-140737487250688, %rax # imm = 0xFFFF80000010DB00
ffff80000010e5c3: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff80000010e5c5: 48 b8 40 dc 10 00 00 80 ff ff	movabsq	$-140737487250368, %rax # imm = 0xFFFF80000010DC40
ffff80000010e5cf: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff80000010e5d1: 48 b8 f0 dc 10 00 00 80 ff ff	movabsq	$-140737487250192, %rax # imm = 0xFFFF80000010DCF0
ffff80000010e5db: 48 89 df             	movq	%rbx, %rdi
ffff80000010e5de: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff80000010e5e0: 48 b8 70 e1 10 00 00 80 ff ff	movabsq	$-140737487249040, %rax # imm = 0xFFFF80000010E170
ffff80000010e5ea: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff80000010e5ec: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000010e5f6: 31 ff                	xorl	%edi, %edi
ffff80000010e5f8: ff d0                	callq	*%rax
; }
ffff80000010e5fa: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e5fe: 5b                   	popq	%rbx
ffff80000010e5ff: 5d                   	popq	%rbp
ffff80000010e600: c3                   	retq
ffff80000010e601: cc                   	int3
ffff80000010e602: cc                   	int3
ffff80000010e603: cc                   	int3
ffff80000010e604: cc                   	int3
ffff80000010e605: cc                   	int3
ffff80000010e606: cc                   	int3
ffff80000010e607: cc                   	int3
ffff80000010e608: cc                   	int3
ffff80000010e609: cc                   	int3
ffff80000010e60a: cc                   	int3
ffff80000010e60b: cc                   	int3
ffff80000010e60c: cc                   	int3
ffff80000010e60d: cc                   	int3
ffff80000010e60e: cc                   	int3
ffff80000010e60f: cc                   	int3

ffff80000010e610 <list_init>:
; {
ffff80000010e610: 55                   	pushq	%rbp
ffff80000010e611: 48 89 e5             	movq	%rsp, %rbp
; 	head->next = head;
ffff80000010e614: 48 89 3f             	movq	%rdi, (%rdi)
; 	head->prev = head;
ffff80000010e617: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010e61b: 5d                   	popq	%rbp
ffff80000010e61c: c3                   	retq
ffff80000010e61d: 0f 1f 00             	nopl	(%rax)

ffff80000010e620 <list_insert_after>:
; {
ffff80000010e620: 55                   	pushq	%rbp
ffff80000010e621: 48 89 e5             	movq	%rsp, %rbp
; 	new->prev = after;
ffff80000010e624: 48 89 7e 08          	movq	%rdi, 8(%rsi)
; 	new->next = after->next;
ffff80000010e628: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e62b: 48 89 06             	movq	%rax, (%rsi)
; 	after->next->prev = new;
ffff80000010e62e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e631: 48 89 70 08          	movq	%rsi, 8(%rax)
; 	after->next = new;
ffff80000010e635: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff80000010e638: 5d                   	popq	%rbp
ffff80000010e639: c3                   	retq
ffff80000010e63a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e640 <list_insert_before>:
; {
ffff80000010e640: 55                   	pushq	%rbp
ffff80000010e641: 48 89 e5             	movq	%rsp, %rbp
; 	new->next = before;
ffff80000010e644: 48 89 3e             	movq	%rdi, (%rsi)
; 	new->prev = before->prev;
ffff80000010e647: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e64b: 48 89 46 08          	movq	%rax, 8(%rsi)
; 	before->prev->next = new;
ffff80000010e64f: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e653: 48 89 30             	movq	%rsi, (%rax)
; 	before->prev = new;
ffff80000010e656: 48 89 77 08          	movq	%rsi, 8(%rdi)
; }
ffff80000010e65a: 5d                   	popq	%rbp
ffff80000010e65b: c3                   	retq
ffff80000010e65c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e660 <list_del>:
; {
ffff80000010e660: 55                   	pushq	%rbp
ffff80000010e661: 48 89 e5             	movq	%rsp, %rbp
; 	node->prev->next = node->next;
ffff80000010e664: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e667: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010e66b: 48 89 01             	movq	%rax, (%rcx)
; 	node->next->prev = node->prev;
ffff80000010e66e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e671: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff80000010e675: 48 89 3f             	movq	%rdi, (%rdi)
; 	node->prev = node;
ffff80000010e678: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010e67c: 5d                   	popq	%rbp
ffff80000010e67d: c3                   	retq
ffff80000010e67e: 66 90                	nop

ffff80000010e680 <list_add>:
; {
ffff80000010e680: 55                   	pushq	%rbp
ffff80000010e681: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_after(head, new);
ffff80000010e684: 48 b8 20 e6 10 00 00 80 ff ff	movabsq	$-140737487247840, %rax # imm = 0xFFFF80000010E620
ffff80000010e68e: ff d0                	callq	*%rax
; }
ffff80000010e690: 5d                   	popq	%rbp
ffff80000010e691: c3                   	retq
ffff80000010e692: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e69c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e6a0 <list_add_tail>:
; {
ffff80000010e6a0: 55                   	pushq	%rbp
ffff80000010e6a1: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_before(head, new);
ffff80000010e6a4: 48 b8 40 e6 10 00 00 80 ff ff	movabsq	$-140737487247808, %rax # imm = 0xFFFF80000010E640
ffff80000010e6ae: ff d0                	callq	*%rax
; }
ffff80000010e6b0: 5d                   	popq	%rbp
ffff80000010e6b1: c3                   	retq
ffff80000010e6b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e6bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e6c0 <list_pop_tail>:
; {
ffff80000010e6c0: 55                   	pushq	%rbp
ffff80000010e6c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e6c4: 53                   	pushq	%rbx
ffff80000010e6c5: 50                   	pushq	%rax
; 	if (head->prev == head)
ffff80000010e6c6: 48 8b 5f 08          	movq	8(%rdi), %rbx
ffff80000010e6ca: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e6cd: 74 11                	je	0xffff80000010e6e0 <list_pop_tail+0x20>
; 	list_del(node);
ffff80000010e6cf: 48 b8 60 e6 10 00 00 80 ff ff	movabsq	$-140737487247776, %rax # imm = 0xFFFF80000010E660
ffff80000010e6d9: 48 89 df             	movq	%rbx, %rdi
ffff80000010e6dc: ff d0                	callq	*%rax
ffff80000010e6de: eb 02                	jmp	0xffff80000010e6e2 <list_pop_tail+0x22>
ffff80000010e6e0: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010e6e2: 48 89 d8             	movq	%rbx, %rax
ffff80000010e6e5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e6e9: 5b                   	popq	%rbx
ffff80000010e6ea: 5d                   	popq	%rbp
ffff80000010e6eb: c3                   	retq
ffff80000010e6ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e6f0 <list_pop>:
; {
ffff80000010e6f0: 55                   	pushq	%rbp
ffff80000010e6f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e6f4: 53                   	pushq	%rbx
ffff80000010e6f5: 50                   	pushq	%rax
; 	if (head->next == head)
ffff80000010e6f6: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010e6f9: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e6fc: 74 11                	je	0xffff80000010e70f <list_pop+0x1f>
; 	list_del(node);
ffff80000010e6fe: 48 b8 60 e6 10 00 00 80 ff ff	movabsq	$-140737487247776, %rax # imm = 0xFFFF80000010E660
ffff80000010e708: 48 89 df             	movq	%rbx, %rdi
ffff80000010e70b: ff d0                	callq	*%rax
ffff80000010e70d: eb 02                	jmp	0xffff80000010e711 <list_pop+0x21>
ffff80000010e70f: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010e711: 48 89 d8             	movq	%rbx, %rax
ffff80000010e714: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e718: 5b                   	popq	%rbx
ffff80000010e719: 5d                   	popq	%rbp
ffff80000010e71a: c3                   	retq
ffff80000010e71b: cc                   	int3
ffff80000010e71c: cc                   	int3
ffff80000010e71d: cc                   	int3
ffff80000010e71e: cc                   	int3
ffff80000010e71f: cc                   	int3

ffff80000010e720 <vprintfmt>:
; {
ffff80000010e720: 55                   	pushq	%rbp
ffff80000010e721: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e724: 41 57                	pushq	%r15
ffff80000010e726: 41 56                	pushq	%r14
ffff80000010e728: 41 55                	pushq	%r13
ffff80000010e72a: 41 54                	pushq	%r12
ffff80000010e72c: 53                   	pushq	%rbx
ffff80000010e72d: 48 83 ec 38          	subq	$56, %rsp
ffff80000010e731: 49 89 d6             	movq	%rdx, %r14
ffff80000010e734: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e737: 49 89 ff             	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
ffff80000010e73a: 48 8b 41 10          	movq	16(%rcx), %rax
ffff80000010e73e: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010e742: 48 8b 01             	movq	(%rcx), %rax
ffff80000010e745: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010e749: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010e74d: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010e751: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010e755: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff80000010e759: eb 44                	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; 			num = getuint(&ap, lflag);
ffff80000010e75b: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e75f: 48 b8 d0 ec 10 00 00 80 ff ff	movabsq	$-140737487246128, %rax # imm = 0xFFFF80000010ECD0
ffff80000010e769: ff d0                	callq	*%rax
ffff80000010e76b: 49 89 c4             	movq	%rax, %r12
ffff80000010e76e: 41 bf 10 00 00 00    	movl	$16, %r15d
ffff80000010e774: 45 0f b6 cd          	movzbl	%r13b, %r9d
ffff80000010e778: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010e77c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
ffff80000010e780: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e783: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e786: 49 89 ff             	movq	%rdi, %r15
ffff80000010e789: 41 89 d8             	movl	%ebx, %r8d
ffff80000010e78c: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e78f: 48 b8 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %rax # imm = 0xFFFF80000010ED50
ffff80000010e799: ff d0                	callq	*%rax
; 			break;
ffff80000010e79b: 49 83 c6 01          	addq	$1, %r14
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff80000010e79f: 41 0f b6 3e          	movzbl	(%r14), %edi
ffff80000010e7a3: 49 83 c6 01          	addq	$1, %r14
ffff80000010e7a7: 83 ff 25             	cmpl	$37, %edi
ffff80000010e7aa: 74 14                	je	0xffff80000010e7c0 <vprintfmt+0xa0>
ffff80000010e7ac: 40 84 ff             	testb	%dil, %dil
ffff80000010e7af: 0f 84 2e 04 00 00    	je	0xffff80000010ebe3 <vprintfmt+0x4c3>
ffff80000010e7b5: 48 89 de             	movq	%rbx, %rsi
ffff80000010e7b8: 41 ff d7             	callq	*%r15
ffff80000010e7bb: eb e2                	jmp	0xffff80000010e79f <vprintfmt+0x7f>
ffff80000010e7bd: 0f 1f 00             	nopl	(%rax)
ffff80000010e7c0: 41 b5 20             	movb	$32, %r13b
ffff80000010e7c3: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010e7c8: 31 f6                	xorl	%esi, %esi
ffff80000010e7ca: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010e7ce: 41 bf ff ff ff ff    	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
ffff80000010e7d4: c7 45 a8 00 00 00 00 	movl	$0, -88(%rbp)
ffff80000010e7db: 48 bf f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rdi # imm = 0xFFFF8000001102F0
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010e7e5: 4d 8d 66 01          	leaq	1(%r14), %r12
ffff80000010e7e9: eb 10                	jmp	0xffff80000010e7fb <vprintfmt+0xdb>
ffff80000010e7eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010e7f0: 49 83 c6 01          	addq	$1, %r14
ffff80000010e7f4: 49 83 c4 01          	addq	$1, %r12
ffff80000010e7f8: 41 89 cd             	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010e7fb: 41 0f b6 0e          	movzbl	(%r14), %ecx
ffff80000010e7ff: 8d 51 dd             	leal	-35(%rcx), %edx
ffff80000010e802: 80 fa 55             	cmpb	$85, %dl
ffff80000010e805: 0f 87 25 01 00 00    	ja	0xffff80000010e930 <vprintfmt+0x210>
ffff80000010e80b: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010e80e: ff 24 d7             	jmpq	*(%rdi,%rdx,8)
ffff80000010e811: b1 30                	movb	$48, %cl
ffff80000010e813: eb db                	jmp	0xffff80000010e7f0 <vprintfmt+0xd0>
ffff80000010e815: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e81f: 90                   	nop
ffff80000010e820: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010e823: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e826: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
ffff80000010e830: 43 8d 14 bf          	leal	(%r15,%r15,4), %edx
ffff80000010e834: 44 8d 3c 51          	leal	(%rcx,%rdx,2), %r15d
ffff80000010e838: 41 83 c7 d0          	addl	$-48, %r15d
; 				ch = *fmt;
ffff80000010e83c: 41 0f be 4e 01       	movsbl	1(%r14), %ecx
; 				precision = precision * 10 + ch - '0';
ffff80000010e841: 49 83 c6 01          	addq	$1, %r14
; 				if (ch < '0' || ch > '9')
ffff80000010e845: 8d 51 c6             	leal	-58(%rcx), %edx
ffff80000010e848: 80 fa f6             	cmpb	$-10, %dl
ffff80000010e84b: 73 e3                	jae	0xffff80000010e830 <vprintfmt+0x110>
; 			if (width < 0)
ffff80000010e84d: 85 db                	testl	%ebx, %ebx
ffff80000010e84f: 41 0f 48 df          	cmovsl	%r15d, %ebx
ffff80000010e853: b9 ff ff ff ff       	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
ffff80000010e858: 44 0f 48 f9          	cmovsl	%ecx, %r15d
ffff80000010e85c: eb 87                	jmp	0xffff80000010e7e5 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010e85e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e862: 49 83 c6 01          	addq	$1, %r14
ffff80000010e866: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e86a: 77 39                	ja	0xffff80000010e8a5 <vprintfmt+0x185>
ffff80000010e86c: 48 89 ca             	movq	%rcx, %rdx
ffff80000010e86f: 48 01 c2             	addq	%rax, %rdx
ffff80000010e872: 83 c1 08             	addl	$8, %ecx
ffff80000010e875: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e878: 44 8b 3a             	movl	(%rdx), %r15d
ffff80000010e87b: eb d0                	jmp	0xffff80000010e84d <vprintfmt+0x12d>
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010e87d: 49 83 c6 01          	addq	$1, %r14
ffff80000010e881: c7 45 a8 01 00 00 00 	movl	$1, -88(%rbp)
ffff80000010e888: e9 58 ff ff ff       	jmp	0xffff80000010e7e5 <vprintfmt+0xc5>
; 			if (width < 0)
ffff80000010e88d: 85 db                	testl	%ebx, %ebx
ffff80000010e88f: b9 00 00 00 00       	movl	$0, %ecx
ffff80000010e894: 0f 48 d9             	cmovsl	%ecx, %ebx
ffff80000010e897: eb 03                	jmp	0xffff80000010e89c <vprintfmt+0x17c>
; 			lflag++;
ffff80000010e899: 83 c6 01             	addl	$1, %esi
ffff80000010e89c: 49 83 c6 01          	addq	$1, %r14
ffff80000010e8a0: e9 40 ff ff ff       	jmp	0xffff80000010e7e5 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010e8a5: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010e8a9: 48 8d 51 08          	leaq	8(%rcx), %rdx
ffff80000010e8ad: 48 89 55 b8          	movq	%rdx, -72(%rbp)
ffff80000010e8b1: 44 8b 39             	movl	(%rcx), %r15d
ffff80000010e8b4: eb 97                	jmp	0xffff80000010e84d <vprintfmt+0x12d>
; 			putch(ch, putdat);
ffff80000010e8b6: bf 25 00 00 00       	movl	$37, %edi
ffff80000010e8bb: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010e8bf: 48 89 de             	movq	%rbx, %rsi
ffff80000010e8c2: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010e8c6: 41 ff d7             	callq	*%r15
; 			break;
ffff80000010e8c9: 49 83 c6 01          	addq	$1, %r14
ffff80000010e8cd: e9 cd fe ff ff       	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; 			err = va_arg(ap, int);
ffff80000010e8d2: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e8d6: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e8da: 0f 87 3a 01 00 00    	ja	0xffff80000010ea1a <vprintfmt+0x2fa>
ffff80000010e8e0: 48 89 c8             	movq	%rcx, %rax
ffff80000010e8e3: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010e8e7: 83 c1 08             	addl	$8, %ecx
ffff80000010e8ea: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e8ed: e9 34 01 00 00       	jmp	0xffff80000010ea26 <vprintfmt+0x306>
; 			num = getuint(&ap, lflag);
ffff80000010e8f2: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e8f6: 48 b8 d0 ec 10 00 00 80 ff ff	movabsq	$-140737487246128, %rax # imm = 0xFFFF80000010ECD0
ffff80000010e900: ff d0                	callq	*%rax
ffff80000010e902: 49 89 c4             	movq	%rax, %r12
ffff80000010e905: 41 bf 08 00 00 00    	movl	$8, %r15d
ffff80000010e90b: e9 64 fe ff ff       	jmp	0xffff80000010e774 <vprintfmt+0x54>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010e910: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e914: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e918: 0f 87 55 01 00 00    	ja	0xffff80000010ea73 <vprintfmt+0x353>
ffff80000010e91e: 48 89 c8             	movq	%rcx, %rax
ffff80000010e921: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010e925: 83 c1 08             	addl	$8, %ecx
ffff80000010e928: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e92b: e9 4f 01 00 00       	jmp	0xffff80000010ea7f <vprintfmt+0x35f>
; 			putch('%', putdat);
ffff80000010e930: bf 25 00 00 00       	movl	$37, %edi
ffff80000010e935: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010e939: 48 89 de             	movq	%rbx, %rsi
ffff80000010e93c: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010e940: 41 ff d7             	callq	*%r15
ffff80000010e943: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e94d: 0f 1f 00             	nopl	(%rax)
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff80000010e950: 4d 8d 74 24 ff       	leaq	-1(%r12), %r14
ffff80000010e955: 41 80 7c 24 fe 25    	cmpb	$37, -2(%r12)
ffff80000010e95b: 4d 89 f4             	movq	%r14, %r12
ffff80000010e95e: 75 f0                	jne	0xffff80000010e950 <vprintfmt+0x230>
ffff80000010e960: e9 3a fe ff ff       	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010e965: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e969: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e96d: 0f 87 07 02 00 00    	ja	0xffff80000010eb7a <vprintfmt+0x45a>
ffff80000010e973: 48 89 c8             	movq	%rcx, %rax
ffff80000010e976: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010e97a: 83 c1 08             	addl	$8, %ecx
ffff80000010e97d: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e980: e9 01 02 00 00       	jmp	0xffff80000010eb86 <vprintfmt+0x466>
; 			num = getint(&ap, lflag);
ffff80000010e985: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e989: 48 b8 50 ec 10 00 00 80 ff ff	movabsq	$-140737487246256, %rax # imm = 0xFFFF80000010EC50
ffff80000010e993: ff d0                	callq	*%rax
ffff80000010e995: 49 89 c4             	movq	%rax, %r12
ffff80000010e998: 41 bf 0a 00 00 00    	movl	$10, %r15d
; 			if ((long long) num < 0) {
ffff80000010e99e: 48 85 c0             	testq	%rax, %rax
ffff80000010e9a1: 0f 89 cd fd ff ff    	jns	0xffff80000010e774 <vprintfmt+0x54>
; 				putch('-', putdat);
ffff80000010e9a7: bf 2d 00 00 00       	movl	$45, %edi
ffff80000010e9ac: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010e9b0: ff 55 c8             	callq	*-56(%rbp)
; 				num = -(long long) num;
ffff80000010e9b3: 49 f7 dc             	negq	%r12
ffff80000010e9b6: e9 b9 fd ff ff       	jmp	0xffff80000010e774 <vprintfmt+0x54>
; 			putch('0', putdat);
ffff80000010e9bb: bf 30 00 00 00       	movl	$48, %edi
ffff80000010e9c0: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010e9c4: 4c 89 fe             	movq	%r15, %rsi
ffff80000010e9c7: 4c 8b 65 c8          	movq	-56(%rbp), %r12
ffff80000010e9cb: 41 ff d4             	callq	*%r12
; 			putch('x', putdat);
ffff80000010e9ce: bf 78 00 00 00       	movl	$120, %edi
ffff80000010e9d3: 4c 89 fe             	movq	%r15, %rsi
ffff80000010e9d6: 41 ff d4             	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010e9d9: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e9dd: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e9e1: 0f 87 b2 01 00 00    	ja	0xffff80000010eb99 <vprintfmt+0x479>
ffff80000010e9e7: 48 89 c8             	movq	%rcx, %rax
ffff80000010e9ea: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010e9ee: 83 c1 08             	addl	$8, %ecx
ffff80000010e9f1: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e9f4: 4c 8b 20             	movq	(%rax), %r12
ffff80000010e9f7: e9 72 fd ff ff       	jmp	0xffff80000010e76e <vprintfmt+0x4e>
; 			num = getuint(&ap, lflag);
ffff80000010e9fc: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010ea00: 48 b8 d0 ec 10 00 00 80 ff ff	movabsq	$-140737487246128, %rax # imm = 0xFFFF80000010ECD0
ffff80000010ea0a: ff d0                	callq	*%rax
ffff80000010ea0c: 49 89 c4             	movq	%rax, %r12
ffff80000010ea0f: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010ea15: e9 5a fd ff ff       	jmp	0xffff80000010e774 <vprintfmt+0x54>
; 			err = va_arg(ap, int);
ffff80000010ea1a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ea1e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ea22: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ea26: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			err = va_arg(ap, int);
ffff80000010ea2a: 49 83 c6 01          	addq	$1, %r14
ffff80000010ea2e: 8b 00                	movl	(%rax), %eax
; 			if (err < 0)
ffff80000010ea30: 89 c1                	movl	%eax, %ecx
ffff80000010ea32: f7 d9                	negl	%ecx
ffff80000010ea34: 0f 48 c8             	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010ea37: 83 f9 08             	cmpl	$8, %ecx
ffff80000010ea3a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ea3e: 77 0d                	ja	0xffff80000010ea4d <vprintfmt+0x32d>
ffff80000010ea40: 83 f9 03             	cmpl	$3, %ecx
ffff80000010ea43: 74 08                	je	0xffff80000010ea4d <vprintfmt+0x32d>
ffff80000010ea45: 85 c9                	testl	%ecx, %ecx
ffff80000010ea47: 0f 85 60 01 00 00    	jne	0xffff80000010ebad <vprintfmt+0x48d>
; 				printfmt(putch, putdat, "error %d", err);
ffff80000010ea4d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ea50: 48 ba b8 0c 11 00 00 80 ff ff	movabsq	$-140737487237960, %rdx # imm = 0xFFFF800000110CB8
ffff80000010ea5a: 31 c0                	xorl	%eax, %eax
ffff80000010ea5c: 49 89 f4             	movq	%rsi, %r12
ffff80000010ea5f: 48 bb 00 ec 10 00 00 80 ff ff	movabsq	$-140737487246336, %rbx # imm = 0xFFFF80000010EC00
ffff80000010ea69: ff d3                	callq	*%rbx
ffff80000010ea6b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010ea6e: e9 2c fd ff ff       	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010ea73: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ea77: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ea7b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ea7f: 4c 8b 20             	movq	(%rax), %r12
ffff80000010ea82: 4d 85 e4             	testq	%r12, %r12
ffff80000010ea85: 48 b8 97 0e 11 00 00 80 ff ff	movabsq	$-140737487237481, %rax # imm = 0xFFFF800000110E97
ffff80000010ea8f: 4c 0f 44 e0          	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
ffff80000010ea93: 85 db                	testl	%ebx, %ebx
ffff80000010ea95: 7e 50                	jle	0xffff80000010eae7 <vprintfmt+0x3c7>
ffff80000010ea97: 41 80 fd 2d          	cmpb	$45, %r13b
ffff80000010ea9b: 74 4a                	je	0xffff80000010eae7 <vprintfmt+0x3c7>
ffff80000010ea9d: 44 88 6d ac          	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010eaa1: 49 63 f7             	movslq	%r15d, %rsi
ffff80000010eaa4: 4c 89 e7             	movq	%r12, %rdi
ffff80000010eaa7: 48 b8 d0 f5 10 00 00 80 ff ff	movabsq	$-140737487243824, %rax # imm = 0xFFFF80000010F5D0
ffff80000010eab1: ff d0                	callq	*%rax
ffff80000010eab3: 41 89 dd             	movl	%ebx, %r13d
ffff80000010eab6: 41 29 c5             	subl	%eax, %r13d
ffff80000010eab9: 7e 2f                	jle	0xffff80000010eaea <vprintfmt+0x3ca>
ffff80000010eabb: 0f b6 4d ac          	movzbl	-84(%rbp), %ecx
ffff80000010eabf: 89 4d ac             	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010eac2: 29 c3                	subl	%eax, %ebx
ffff80000010eac4: 83 c3 01             	addl	$1, %ebx
ffff80000010eac7: 4c 8b 6d c8          	movq	-56(%rbp), %r13
ffff80000010eacb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010ead0: 8b 7d ac             	movl	-84(%rbp), %edi
ffff80000010ead3: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
ffff80000010ead7: 41 ff d5             	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010eada: 83 c3 ff             	addl	$-1, %ebx
ffff80000010eadd: 83 fb 01             	cmpl	$1, %ebx
ffff80000010eae0: 7f ee                	jg	0xffff80000010ead0 <vprintfmt+0x3b0>
ffff80000010eae2: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010eae5: eb 03                	jmp	0xffff80000010eaea <vprintfmt+0x3ca>
ffff80000010eae7: 41 89 dd             	movl	%ebx, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010eaea: 41 8a 04 24          	movb	(%r12), %al
ffff80000010eaee: 84 c0                	testb	%al, %al
ffff80000010eaf0: 74 49                	je	0xffff80000010eb3b <vprintfmt+0x41b>
ffff80000010eaf2: 49 83 c4 01          	addq	$1, %r12
ffff80000010eaf6: 8b 5d a8             	movl	-88(%rbp), %ebx
ffff80000010eaf9: eb 35                	jmp	0xffff80000010eb30 <vprintfmt+0x410>
ffff80000010eafb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010eb00: 0f be c0             	movsbl	%al, %eax
ffff80000010eb03: 8d 48 81             	leal	-127(%rax), %ecx
ffff80000010eb06: 80 f9 a1             	cmpb	$-95, %cl
ffff80000010eb09: 89 c7                	movl	%eax, %edi
ffff80000010eb0b: b9 3f 00 00 00       	movl	$63, %ecx
ffff80000010eb10: 0f 42 f9             	cmovbl	%ecx, %edi
ffff80000010eb13: 85 db                	testl	%ebx, %ebx
ffff80000010eb15: 0f 44 f8             	cmovel	%eax, %edi
ffff80000010eb18: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010eb1c: ff 55 c8             	callq	*-56(%rbp)
; 					width--)
ffff80000010eb1f: 41 83 c5 ff          	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010eb23: 41 0f b6 04 24       	movzbl	(%r12), %eax
ffff80000010eb28: 49 83 c4 01          	addq	$1, %r12
ffff80000010eb2c: 84 c0                	testb	%al, %al
ffff80000010eb2e: 74 0b                	je	0xffff80000010eb3b <vprintfmt+0x41b>
ffff80000010eb30: 45 85 ff             	testl	%r15d, %r15d
ffff80000010eb33: 78 cb                	js	0xffff80000010eb00 <vprintfmt+0x3e0>
ffff80000010eb35: 41 83 ef 01          	subl	$1, %r15d
ffff80000010eb39: 73 c5                	jae	0xffff80000010eb00 <vprintfmt+0x3e0>
ffff80000010eb3b: 49 83 c6 01          	addq	$1, %r14
; 			for (; width > 0; width--)
ffff80000010eb3f: 45 85 ed             	testl	%r13d, %r13d
ffff80000010eb42: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010eb46: 48 8b 5d d0          	movq	-48(%rbp), %rbx
; 			for (; width > 0; width--)
ffff80000010eb4a: 0f 8e 4f fc ff ff    	jle	0xffff80000010e79f <vprintfmt+0x7f>
; 	while (1) {
ffff80000010eb50: 41 83 c5 01          	addl	$1, %r13d
ffff80000010eb54: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eb5e: 66 90                	nop
; 				putch(' ', putdat);
ffff80000010eb60: bf 20 00 00 00       	movl	$32, %edi
ffff80000010eb65: 48 89 de             	movq	%rbx, %rsi
ffff80000010eb68: 41 ff d7             	callq	*%r15
; 			for (; width > 0; width--)
ffff80000010eb6b: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010eb6f: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010eb73: 7f eb                	jg	0xffff80000010eb60 <vprintfmt+0x440>
ffff80000010eb75: e9 25 fc ff ff       	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010eb7a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010eb7e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010eb82: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010eb86: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010eb8a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
ffff80000010eb8e: 49 83 c6 01          	addq	$1, %r14
ffff80000010eb92: 8b 38                	movl	(%rax), %edi
ffff80000010eb94: e9 1c fc ff ff       	jmp	0xffff80000010e7b5 <vprintfmt+0x95>
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010eb99: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010eb9d: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010eba1: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010eba5: 4c 8b 20             	movq	(%rax), %r12
ffff80000010eba8: e9 c1 fb ff ff       	jmp	0xffff80000010e76e <vprintfmt+0x4e>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010ebad: 89 c8                	movl	%ecx, %eax
ffff80000010ebaf: 48 b9 a0 05 11 00 00 80 ff ff	movabsq	$-140737487239776, %rcx # imm = 0xFFFF8000001105A0
ffff80000010ebb9: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
ffff80000010ebbd: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ebc0: 48 ba 53 09 11 00 00 80 ff ff	movabsq	$-140737487238829, %rdx # imm = 0xFFFF800000110953
ffff80000010ebca: 31 c0                	xorl	%eax, %eax
ffff80000010ebcc: 49 89 f4             	movq	%rsi, %r12
; 				printfmt(putch, putdat, "%s", p);
ffff80000010ebcf: 48 bb 00 ec 10 00 00 80 ff ff	movabsq	$-140737487246336, %rbx # imm = 0xFFFF80000010EC00
ffff80000010ebd9: ff d3                	callq	*%rbx
ffff80000010ebdb: 4c 89 e3             	movq	%r12, %rbx
ffff80000010ebde: e9 bc fb ff ff       	jmp	0xffff80000010e79f <vprintfmt+0x7f>
; }
ffff80000010ebe3: 48 83 c4 38          	addq	$56, %rsp
ffff80000010ebe7: 5b                   	popq	%rbx
ffff80000010ebe8: 41 5c                	popq	%r12
ffff80000010ebea: 41 5d                	popq	%r13
ffff80000010ebec: 41 5e                	popq	%r14
ffff80000010ebee: 41 5f                	popq	%r15
ffff80000010ebf0: 5d                   	popq	%rbp
ffff80000010ebf1: c3                   	retq
ffff80000010ebf2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ebfc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010ec00 <printfmt>:
; {
ffff80000010ec00: 55                   	pushq	%rbp
ffff80000010ec01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ec04: 48 83 ec 50          	subq	$80, %rsp
ffff80000010ec08: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010ec0c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010ec10: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010ec14: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010ec18: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010ec1c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010ec20: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010ec24: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010ec2e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000010ec32: 48 b8 20 e7 10 00 00 80 ff ff	movabsq	$-140737487247584, %rax # imm = 0xFFFF80000010E720
ffff80000010ec3c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010ec40: ff d0                	callq	*%rax
; }
ffff80000010ec42: 48 83 c4 50          	addq	$80, %rsp
ffff80000010ec46: 5d                   	popq	%rbp
ffff80000010ec47: c3                   	retq
ffff80000010ec48: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010ec50 <getint>:
; {
ffff80000010ec50: 55                   	pushq	%rbp
ffff80000010ec51: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010ec54: 83 fe 02             	cmpl	$2, %esi
ffff80000010ec57: 7c 17                	jl	0xffff80000010ec70 <getint+0x20>
; 		return va_arg(*ap, long long);
ffff80000010ec59: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ec5c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010ec60: 77 2b                	ja	0xffff80000010ec8d <getint+0x3d>
ffff80000010ec62: 48 89 c1             	movq	%rax, %rcx
ffff80000010ec65: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ec69: 83 c0 08             	addl	$8, %eax
ffff80000010ec6c: 89 07                	movl	%eax, (%rdi)
ffff80000010ec6e: eb 18                	jmp	0xffff80000010ec88 <getint+0x38>
ffff80000010ec70: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010ec73: 85 f6                	testl	%esi, %esi
ffff80000010ec75: 74 27                	je	0xffff80000010ec9e <getint+0x4e>
ffff80000010ec77: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, long);
ffff80000010ec7a: 77 11                	ja	0xffff80000010ec8d <getint+0x3d>
ffff80000010ec7c: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
ffff80000010ec80: 48 01 c1             	addq	%rax, %rcx
ffff80000010ec83: 83 c0 08             	addl	$8, %eax
ffff80000010ec86: 89 07                	movl	%eax, (%rdi)
ffff80000010ec88: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010ec8b: 5d                   	popq	%rbp
ffff80000010ec8c: c3                   	retq
ffff80000010ec8d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010ec91: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ec95: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010ec99: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010ec9c: 5d                   	popq	%rbp
ffff80000010ec9d: c3                   	retq
ffff80000010ec9e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, int);
ffff80000010eca1: 77 0e                	ja	0xffff80000010ecb1 <getint+0x61>
ffff80000010eca3: 48 89 c1             	movq	%rax, %rcx
ffff80000010eca6: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ecaa: 83 c0 08             	addl	$8, %eax
ffff80000010ecad: 89 07                	movl	%eax, (%rdi)
ffff80000010ecaf: eb 0c                	jmp	0xffff80000010ecbd <getint+0x6d>
ffff80000010ecb1: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010ecb5: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010ecb9: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010ecbd: 48 63 01             	movslq	(%rcx), %rax
; }
ffff80000010ecc0: 5d                   	popq	%rbp
ffff80000010ecc1: c3                   	retq
ffff80000010ecc2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eccc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010ecd0 <getuint>:
; {
ffff80000010ecd0: 55                   	pushq	%rbp
ffff80000010ecd1: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010ecd4: 83 fe 02             	cmpl	$2, %esi
ffff80000010ecd7: 7c 17                	jl	0xffff80000010ecf0 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
ffff80000010ecd9: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ecdc: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010ece0: 77 2b                	ja	0xffff80000010ed0d <getuint+0x3d>
ffff80000010ece2: 48 89 c1             	movq	%rax, %rcx
ffff80000010ece5: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ece9: 83 c0 08             	addl	$8, %eax
ffff80000010ecec: 89 07                	movl	%eax, (%rdi)
ffff80000010ecee: eb 18                	jmp	0xffff80000010ed08 <getuint+0x38>
ffff80000010ecf0: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010ecf3: 85 f6                	testl	%esi, %esi
ffff80000010ecf5: 74 27                	je	0xffff80000010ed1e <getuint+0x4e>
ffff80000010ecf7: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
ffff80000010ecfa: 77 11                	ja	0xffff80000010ed0d <getuint+0x3d>
ffff80000010ecfc: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000010ed00: 48 01 c1             	addq	%rax, %rcx
ffff80000010ed03: 83 c0 08             	addl	$8, %eax
ffff80000010ed06: 89 07                	movl	%eax, (%rdi)
ffff80000010ed08: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010ed0b: 5d                   	popq	%rbp
ffff80000010ed0c: c3                   	retq
ffff80000010ed0d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010ed11: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ed15: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010ed19: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010ed1c: 5d                   	popq	%rbp
ffff80000010ed1d: c3                   	retq
ffff80000010ed1e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
ffff80000010ed21: 77 0e                	ja	0xffff80000010ed31 <getuint+0x61>
ffff80000010ed23: 48 89 c1             	movq	%rax, %rcx
ffff80000010ed26: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ed2a: 83 c0 08             	addl	$8, %eax
ffff80000010ed2d: 89 07                	movl	%eax, (%rdi)
ffff80000010ed2f: eb 0c                	jmp	0xffff80000010ed3d <getuint+0x6d>
ffff80000010ed31: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010ed35: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010ed39: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010ed3d: 8b 01                	movl	(%rcx), %eax
; }
ffff80000010ed3f: 5d                   	popq	%rbp
ffff80000010ed40: c3                   	retq
ffff80000010ed41: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ed4b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ed50 <printnum>:
; {
ffff80000010ed50: 55                   	pushq	%rbp
ffff80000010ed51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ed54: 41 57                	pushq	%r15
ffff80000010ed56: 41 56                	pushq	%r14
ffff80000010ed58: 41 55                	pushq	%r13
ffff80000010ed5a: 41 54                	pushq	%r12
ffff80000010ed5c: 53                   	pushq	%rbx
ffff80000010ed5d: 50                   	pushq	%rax
ffff80000010ed5e: 45 89 cd             	movl	%r9d, %r13d
ffff80000010ed61: 44 89 c3             	movl	%r8d, %ebx
ffff80000010ed64: 49 89 f6             	movq	%rsi, %r14
ffff80000010ed67: 49 89 fc             	movq	%rdi, %r12
; 	if (num >= base) {
ffff80000010ed6a: 41 89 cf             	movl	%ecx, %r15d
ffff80000010ed6d: 49 39 d7             	cmpq	%rdx, %r15
ffff80000010ed70: 48 89 55 d0          	movq	%rdx, -48(%rbp)
ffff80000010ed74: 76 1d                	jbe	0xffff80000010ed93 <printnum+0x43>
; 		while (--width > 0)
ffff80000010ed76: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ed79: 7c 3f                	jl	0xffff80000010edba <printnum+0x6a>
ffff80000010ed7b: 83 c3 01             	addl	$1, %ebx
ffff80000010ed7e: 66 90                	nop
; 			putch(padc, putdat);
ffff80000010ed80: 44 89 ef             	movl	%r13d, %edi
ffff80000010ed83: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ed86: 41 ff d4             	callq	*%r12
; 		while (--width > 0)
ffff80000010ed89: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ed8c: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ed8f: 7f ef                	jg	0xffff80000010ed80 <printnum+0x30>
ffff80000010ed91: eb 27                	jmp	0xffff80000010edba <printnum+0x6a>
ffff80000010ed93: 48 89 d0             	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff80000010ed96: 31 d2                	xorl	%edx, %edx
ffff80000010ed98: 49 f7 f7             	divq	%r15
ffff80000010ed9b: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ed9e: 49 ba 50 ed 10 00 00 80 ff ff	movabsq	$-140737487246000, %r10 # imm = 0xFFFF80000010ED50
ffff80000010eda8: 4c 89 e7             	movq	%r12, %rdi
ffff80000010edab: 4c 89 f6             	movq	%r14, %rsi
ffff80000010edae: 48 89 c2             	movq	%rax, %rdx
ffff80000010edb1: 41 89 d8             	movl	%ebx, %r8d
ffff80000010edb4: 45 89 e9             	movl	%r13d, %r9d
ffff80000010edb7: 41 ff d2             	callq	*%r10
ffff80000010edba: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
ffff80000010edbe: 31 d2                	xorl	%edx, %edx
ffff80000010edc0: 49 f7 f7             	divq	%r15
ffff80000010edc3: 48 b8 c1 0c 11 00 00 80 ff ff	movabsq	$-140737487237951, %rax # imm = 0xFFFF800000110CC1
ffff80000010edcd: 0f be 3c 02          	movsbl	(%rdx,%rax), %edi
ffff80000010edd1: 4c 89 f6             	movq	%r14, %rsi
ffff80000010edd4: 41 ff d4             	callq	*%r12
; }
ffff80000010edd7: 48 83 c4 08          	addq	$8, %rsp
ffff80000010eddb: 5b                   	popq	%rbx
ffff80000010eddc: 41 5c                	popq	%r12
ffff80000010edde: 41 5d                	popq	%r13
ffff80000010ede0: 41 5e                	popq	%r14
ffff80000010ede2: 41 5f                	popq	%r15
ffff80000010ede4: 5d                   	popq	%rbp
ffff80000010ede5: c3                   	retq
ffff80000010ede6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010edf0 <vsnprintf>:
; {
ffff80000010edf0: 55                   	pushq	%rbp
ffff80000010edf1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010edf4: 48 83 ec 20          	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff80000010edf8: 48 89 7d e8          	movq	%rdi, -24(%rbp)
ffff80000010edfc: 48 63 c6             	movslq	%esi, %rax
ffff80000010edff: 48 01 f8             	addq	%rdi, %rax
ffff80000010ee02: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010ee06: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010ee0a: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010ee11: b8 fb ff ff ff       	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
ffff80000010ee16: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ee19: 74 28                	je	0xffff80000010ee43 <vsnprintf+0x53>
ffff80000010ee1b: 85 f6                	testl	%esi, %esi
ffff80000010ee1d: 7e 24                	jle	0xffff80000010ee43 <vsnprintf+0x53>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff80000010ee1f: 48 bf 50 ee 10 00 00 80 ff ff	movabsq	$-140737487245744, %rdi # imm = 0xFFFF80000010EE50
ffff80000010ee29: 48 b8 20 e7 10 00 00 80 ff ff	movabsq	$-140737487247584, %rax # imm = 0xFFFF80000010E720
ffff80000010ee33: 48 8d 75 e8          	leaq	-24(%rbp), %rsi
ffff80000010ee37: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff80000010ee39: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ee3d: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff80000010ee40: 8b 45 f8             	movl	-8(%rbp), %eax
; }
ffff80000010ee43: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ee47: 5d                   	popq	%rbp
ffff80000010ee48: c3                   	retq
ffff80000010ee49: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ee50 <sprintputch>:
; {
ffff80000010ee50: 55                   	pushq	%rbp
ffff80000010ee51: 48 89 e5             	movq	%rsp, %rbp
; 	b->cnt++;
ffff80000010ee54: 83 46 10 01          	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
ffff80000010ee58: 48 8b 06             	movq	(%rsi), %rax
ffff80000010ee5b: 48 3b 46 08          	cmpq	8(%rsi), %rax
ffff80000010ee5f: 73 0a                	jae	0xffff80000010ee6b <sprintputch+0x1b>
; 		*b->buf++ = ch;
ffff80000010ee61: 48 8d 48 01          	leaq	1(%rax), %rcx
ffff80000010ee65: 48 89 0e             	movq	%rcx, (%rsi)
ffff80000010ee68: 40 88 38             	movb	%dil, (%rax)
; }
ffff80000010ee6b: 5d                   	popq	%rbp
ffff80000010ee6c: c3                   	retq
ffff80000010ee6d: 0f 1f 00             	nopl	(%rax)

ffff80000010ee70 <snprintf>:
; {
ffff80000010ee70: 55                   	pushq	%rbp
ffff80000010ee71: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ee74: 48 83 ec 50          	subq	$80, %rsp
ffff80000010ee78: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010ee7c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010ee80: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010ee84: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010ee88: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010ee8c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010ee90: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010ee94: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010ee9e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff80000010eea2: 48 b8 f0 ed 10 00 00 80 ff ff	movabsq	$-140737487245840, %rax # imm = 0xFFFF80000010EDF0
ffff80000010eeac: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010eeb0: ff d0                	callq	*%rax
; 	return rc;
ffff80000010eeb2: 48 83 c4 50          	addq	$80, %rsp
ffff80000010eeb6: 5d                   	popq	%rbp
ffff80000010eeb7: c3                   	retq
ffff80000010eeb8: cc                   	int3
ffff80000010eeb9: cc                   	int3
ffff80000010eeba: cc                   	int3
ffff80000010eebb: cc                   	int3
ffff80000010eebc: cc                   	int3
ffff80000010eebd: cc                   	int3
ffff80000010eebe: cc                   	int3
ffff80000010eebf: cc                   	int3

ffff80000010eec0 <rb_first>:
; {
ffff80000010eec0: 55                   	pushq	%rbp
ffff80000010eec1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_LEFT);
ffff80000010eec4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010eec7: 48 b8 e0 ee 10 00 00 80 ff ff	movabsq	$-140737487245600, %rax # imm = 0xFFFF80000010EEE0
ffff80000010eed1: 31 f6                	xorl	%esi, %esi
ffff80000010eed3: ff d0                	callq	*%rax
ffff80000010eed5: 5d                   	popq	%rbp
ffff80000010eed6: c3                   	retq
ffff80000010eed7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010eee0 <get_outermost>:
; {
ffff80000010eee0: 55                   	pushq	%rbp
ffff80000010eee1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node) {
ffff80000010eee4: 48 85 ff             	testq	%rdi, %rdi
ffff80000010eee7: 74 16                	je	0xffff80000010eeff <get_outermost+0x1f>
ffff80000010eee9: 89 f1                	movl	%esi, %ecx
ffff80000010eeeb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010eef0: 48 89 f8             	movq	%rdi, %rax
; 	while (node->child[dir]) {
ffff80000010eef3: 48 8b 7c cf 08       	movq	8(%rdi,%rcx,8), %rdi
ffff80000010eef8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010eefb: 75 f3                	jne	0xffff80000010eef0 <get_outermost+0x10>
; }
ffff80000010eefd: 5d                   	popq	%rbp
ffff80000010eefe: c3                   	retq
ffff80000010eeff: 31 c0                	xorl	%eax, %eax
; }
ffff80000010ef01: 5d                   	popq	%rbp
ffff80000010ef02: c3                   	retq
ffff80000010ef03: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ef0d: 0f 1f 00             	nopl	(%rax)

ffff80000010ef10 <rb_last>:
; {
ffff80000010ef10: 55                   	pushq	%rbp
ffff80000010ef11: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_RIGHT);
ffff80000010ef14: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010ef17: 48 b8 e0 ee 10 00 00 80 ff ff	movabsq	$-140737487245600, %rax # imm = 0xFFFF80000010EEE0
ffff80000010ef21: be 01 00 00 00       	movl	$1, %esi
ffff80000010ef26: ff d0                	callq	*%rax
ffff80000010ef28: 5d                   	popq	%rbp
ffff80000010ef29: c3                   	retq
ffff80000010ef2a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ef30 <rb_next>:
; {
ffff80000010ef30: 55                   	pushq	%rbp
ffff80000010ef31: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_RIGHT);
ffff80000010ef34: 48 b8 50 ef 10 00 00 80 ff ff	movabsq	$-140737487245488, %rax # imm = 0xFFFF80000010EF50
ffff80000010ef3e: be 01 00 00 00       	movl	$1, %esi
ffff80000010ef43: ff d0                	callq	*%rax
ffff80000010ef45: 5d                   	popq	%rbp
ffff80000010ef46: c3                   	retq
ffff80000010ef47: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010ef50 <get_closest>:
; {
ffff80000010ef50: 55                   	pushq	%rbp
ffff80000010ef51: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node)
ffff80000010ef54: 48 85 ff             	testq	%rdi, %rdi
ffff80000010ef57: 74 3b                	je	0xffff80000010ef94 <get_closest+0x44>
; 	if (node->child[dir])
ffff80000010ef59: 89 f1                	movl	%esi, %ecx
ffff80000010ef5b: 48 8b 44 cf 08       	movq	8(%rdi,%rcx,8), %rax
ffff80000010ef60: 48 85 c0             	testq	%rax, %rax
ffff80000010ef63: 74 25                	je	0xffff80000010ef8a <get_closest+0x3a>
; 		return get_outermost(node->child[dir], !dir);
ffff80000010ef65: 31 c9                	xorl	%ecx, %ecx
ffff80000010ef67: 85 f6                	testl	%esi, %esi
ffff80000010ef69: 0f 94 c1             	sete	%cl
ffff80000010ef6c: 48 ba e0 ee 10 00 00 80 ff ff	movabsq	$-140737487245600, %rdx # imm = 0xFFFF80000010EEE0
ffff80000010ef76: 48 89 c7             	movq	%rax, %rdi
ffff80000010ef79: 89 ce                	movl	%ecx, %esi
ffff80000010ef7b: ff d2                	callq	*%rdx
; }
ffff80000010ef7d: 5d                   	popq	%rbp
ffff80000010ef7e: c3                   	retq
ffff80000010ef7f: 90                   	nop
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff80000010ef80: 48 39 7c c8 08       	cmpq	%rdi, 8(%rax,%rcx,8)
ffff80000010ef85: 48 89 c7             	movq	%rax, %rdi
ffff80000010ef88: 75 08                	jne	0xffff80000010ef92 <get_closest+0x42>
ffff80000010ef8a: 48 8b 07             	movq	(%rdi), %rax
ffff80000010ef8d: 48 85 c0             	testq	%rax, %rax
ffff80000010ef90: 75 ee                	jne	0xffff80000010ef80 <get_closest+0x30>
; }
ffff80000010ef92: 5d                   	popq	%rbp
ffff80000010ef93: c3                   	retq
ffff80000010ef94: 31 c0                	xorl	%eax, %eax
; }
ffff80000010ef96: 5d                   	popq	%rbp
ffff80000010ef97: c3                   	retq
ffff80000010ef98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010efa0 <rb_prev>:
; {
ffff80000010efa0: 55                   	pushq	%rbp
ffff80000010efa1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_LEFT);
ffff80000010efa4: 48 b8 50 ef 10 00 00 80 ff ff	movabsq	$-140737487245488, %rax # imm = 0xFFFF80000010EF50
ffff80000010efae: 31 f6                	xorl	%esi, %esi
ffff80000010efb0: ff d0                	callq	*%rax
ffff80000010efb2: 5d                   	popq	%rbp
ffff80000010efb3: c3                   	retq
ffff80000010efb4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010efbe: 66 90                	nop

ffff80000010efc0 <rb_balance>:
; {
ffff80000010efc0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010efc5: 48 85 ff             	testq	%rdi, %rdi
ffff80000010efc8: 0f 84 f0 00 00 00    	je	0xffff80000010f0be <rb_balance+0xfe>
ffff80000010efce: 48 85 f6             	testq	%rsi, %rsi
ffff80000010efd1: 0f 84 e7 00 00 00    	je	0xffff80000010f0be <rb_balance+0xfe>
ffff80000010efd7: 55                   	pushq	%rbp
ffff80000010efd8: 48 89 e5             	movq	%rsp, %rbp
ffff80000010efdb: 41 57                	pushq	%r15
ffff80000010efdd: 41 56                	pushq	%r14
ffff80000010efdf: 41 55                	pushq	%r13
ffff80000010efe1: 41 54                	pushq	%r12
ffff80000010efe3: 53                   	pushq	%rbx
ffff80000010efe4: 50                   	pushq	%rax
ffff80000010efe5: 49 89 fe             	movq	%rdi, %r14
; 	node->color = RB_RED;
ffff80000010efe8: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010efef: 48 8b 1e             	movq	(%rsi), %rbx
ffff80000010eff2: 48 85 db             	testq	%rbx, %rbx
ffff80000010eff5: 0f 84 a9 00 00 00    	je	0xffff80000010f0a4 <rb_balance+0xe4>
ffff80000010effb: 49 bd c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %r13 # imm = 0xFFFF80000010F0C0
ffff80000010f005: eb 2a                	jmp	0xffff80000010f031 <rb_balance+0x71>
ffff80000010f007: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 			parent->color = RB_BLACK;
ffff80000010f010: c7 43 18 00 00 00 00 	movl	$0, 24(%rbx)
; 			uncle->color = RB_BLACK;
ffff80000010f017: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			grandparent->color = RB_RED;
ffff80000010f01e: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010f026: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010f029: 4c 89 fe             	movq	%r15, %rsi
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010f02c: 48 85 db             	testq	%rbx, %rbx
ffff80000010f02f: 74 73                	je	0xffff80000010f0a4 <rb_balance+0xe4>
ffff80000010f031: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f035: 75 6d                	jne	0xffff80000010f0a4 <rb_balance+0xe4>
; 		grandparent = parent->parent;
ffff80000010f037: 4c 8b 3b             	movq	(%rbx), %r15
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010f03a: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010f03e: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f041: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f044: 41 0f 94 c4          	sete	%r12b
; 		uncle = grandparent->child[dir];
ffff80000010f048: 4b 8b 4c e7 08       	movq	8(%r15,%r12,8), %rcx
; 		if (uncle && uncle->color == RB_RED) {
ffff80000010f04d: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f050: 74 06                	je	0xffff80000010f058 <rb_balance+0x98>
ffff80000010f052: 83 79 18 01          	cmpl	$1, 24(%rcx)
ffff80000010f056: 74 b8                	je	0xffff80000010f010 <rb_balance+0x50>
; 		if (parent->child[dir] == node) {
ffff80000010f058: 4a 39 74 e3 08       	cmpq	%rsi, 8(%rbx,%r12,8)
ffff80000010f05d: 74 11                	je	0xffff80000010f070 <rb_balance+0xb0>
ffff80000010f05f: 48 89 d8             	movq	%rbx, %rax
ffff80000010f062: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f065: eb 1d                	jmp	0xffff80000010f084 <rb_balance+0xc4>
ffff80000010f067: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010f070: 31 d2                	xorl	%edx, %edx
ffff80000010f072: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f075: 0f 95 c2             	setne	%dl
; 			rotate_node(tree, parent, !dir);
ffff80000010f078: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f07b: 48 89 de             	movq	%rbx, %rsi
ffff80000010f07e: 41 ff d5             	callq	*%r13
; 			parent = node->parent;
ffff80000010f081: 48 8b 03             	movq	(%rbx), %rax
; 		parent->color = RB_BLACK;
ffff80000010f084: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff80000010f08b: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 		rotate_node(tree, grandparent, dir);
ffff80000010f093: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f096: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f099: 44 89 e2             	movl	%r12d, %edx
ffff80000010f09c: 41 ff d5             	callq	*%r13
ffff80000010f09f: 49 89 df             	movq	%rbx, %r15
ffff80000010f0a2: eb 82                	jmp	0xffff80000010f026 <rb_balance+0x66>
; 	tree->root->color = RB_BLACK;
ffff80000010f0a4: 49 8b 06             	movq	(%r14), %rax
ffff80000010f0a7: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f0ae: 31 c0                	xorl	%eax, %eax
ffff80000010f0b0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f0b4: 5b                   	popq	%rbx
ffff80000010f0b5: 41 5c                	popq	%r12
ffff80000010f0b7: 41 5d                	popq	%r13
ffff80000010f0b9: 41 5e                	popq	%r14
ffff80000010f0bb: 41 5f                	popq	%r15
ffff80000010f0bd: 5d                   	popq	%rbp
; }
ffff80000010f0be: c3                   	retq
ffff80000010f0bf: 90                   	nop

ffff80000010f0c0 <rotate_node>:
; {
ffff80000010f0c0: 55                   	pushq	%rbp
ffff80000010f0c1: 48 89 e5             	movq	%rsp, %rbp
; 	struct rb_node *parent = node->parent;
ffff80000010f0c4: 4c 8b 06             	movq	(%rsi), %r8
; 	struct rb_node *child = node->child[!dir];
ffff80000010f0c7: 31 c9                	xorl	%ecx, %ecx
ffff80000010f0c9: 85 d2                	testl	%edx, %edx
ffff80000010f0cb: 0f 94 c1             	sete	%cl
ffff80000010f0ce: 48 8b 44 ce 08       	movq	8(%rsi,%rcx,8), %rax
; 	if ((node->child[!dir] = child->child[dir])) {
ffff80000010f0d3: 41 89 d1             	movl	%edx, %r9d
ffff80000010f0d6: 4a 8b 54 c8 08       	movq	8(%rax,%r9,8), %rdx
ffff80000010f0db: 48 89 54 ce 08       	movq	%rdx, 8(%rsi,%rcx,8)
ffff80000010f0e0: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f0e3: 74 08                	je	0xffff80000010f0ed <rotate_node+0x2d>
; 		child->child[dir]->parent = node;
ffff80000010f0e5: 4a 8b 4c c8 08       	movq	8(%rax,%r9,8), %rcx
ffff80000010f0ea: 48 89 31             	movq	%rsi, (%rcx)
; 	child->child[dir] = node;
ffff80000010f0ed: 4a 89 74 c8 08       	movq	%rsi, 8(%rax,%r9,8)
; 	child->parent = parent;
ffff80000010f0f2: 4c 89 00             	movq	%r8, (%rax)
; 	if (parent) {
ffff80000010f0f5: 4d 85 c0             	testq	%r8, %r8
ffff80000010f0f8: 74 11                	je	0xffff80000010f10b <rotate_node+0x4b>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff80000010f0fa: 31 c9                	xorl	%ecx, %ecx
ffff80000010f0fc: 49 39 70 10          	cmpq	%rsi, 16(%r8)
ffff80000010f100: 0f 94 c1             	sete	%cl
ffff80000010f103: 49 8d 3c c8          	leaq	(%r8,%rcx,8), %rdi
ffff80000010f107: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f10b: 48 89 07             	movq	%rax, (%rdi)
; 	node->parent = child;
ffff80000010f10e: 48 89 06             	movq	%rax, (%rsi)
; }
ffff80000010f111: 5d                   	popq	%rbp
ffff80000010f112: c3                   	retq
ffff80000010f113: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f11d: 0f 1f 00             	nopl	(%rax)

ffff80000010f120 <rb_remove>:
; {
ffff80000010f120: 55                   	pushq	%rbp
ffff80000010f121: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f124: 41 57                	pushq	%r15
ffff80000010f126: 41 56                	pushq	%r14
ffff80000010f128: 41 55                	pushq	%r13
ffff80000010f12a: 41 54                	pushq	%r12
ffff80000010f12c: 53                   	pushq	%rbx
ffff80000010f12d: 50                   	pushq	%rax
ffff80000010f12e: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010f133: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f136: 0f 84 b9 01 00 00    	je	0xffff80000010f2f5 <rb_remove+0x1d5>
ffff80000010f13c: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010f13f: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f142: 0f 84 ad 01 00 00    	je	0xffff80000010f2f5 <rb_remove+0x1d5>
ffff80000010f148: 49 89 ff             	movq	%rdi, %r15
; 	child_dir = !node->child[RB_LEFT];
ffff80000010f14b: 31 c0                	xorl	%eax, %eax
ffff80000010f14d: 31 c9                	xorl	%ecx, %ecx
ffff80000010f14f: 48 83 7b 08 00       	cmpq	$0, 8(%rbx)
ffff80000010f154: 0f 95 c0             	setne	%al
ffff80000010f157: 0f 94 c1             	sete	%cl
; 	child = node->child[child_dir];
ffff80000010f15a: 4c 8b 6c cb 08       	movq	8(%rbx,%rcx,8), %r13
; 	if (!child && !other)
ffff80000010f15f: 4c 8b 74 c3 08       	movq	8(%rbx,%rax,8), %r14
; 	do_remove(tree, node);
ffff80000010f164: 48 b8 10 f3 10 00 00 80 ff ff	movabsq	$-140737487244528, %rax # imm = 0xFFFF80000010F310
ffff80000010f16e: 48 89 de             	movq	%rbx, %rsi
ffff80000010f171: ff d0                	callq	*%rax
ffff80000010f173: 31 c0                	xorl	%eax, %eax
; 	if (!child && !other)
ffff80000010f175: 4d 09 ee             	orq	%r13, %r14
ffff80000010f178: 0f 84 77 01 00 00    	je	0xffff80000010f2f5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED)
ffff80000010f17e: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f182: 0f 84 6d 01 00 00    	je	0xffff80000010f2f5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED) {
ffff80000010f188: 41 83 7d 18 01       	cmpl	$1, 24(%r13)
ffff80000010f18d: 75 09                	jne	0xffff80000010f198 <rb_remove+0x78>
ffff80000010f18f: 49 83 c5 18          	addq	$24, %r13
ffff80000010f193: e9 51 01 00 00       	jmp	0xffff80000010f2e9 <rb_remove+0x1c9>
; 	while (node->parent) {
ffff80000010f198: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f19c: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f19f: 0f 84 39 01 00 00    	je	0xffff80000010f2de <rb_remove+0x1be>
ffff80000010f1a5: 48 b9 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rcx # imm = 0xFFFF80000010F0C0
ffff80000010f1af: eb 31                	jmp	0xffff80000010f1e2 <rb_remove+0xc2>
ffff80000010f1b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f1bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 			sibling->color = RB_RED;
ffff80000010f1c0: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010f1c7: 48 b9 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rcx # imm = 0xFFFF80000010F0C0
ffff80000010f1d1: 4d 8b 6d 00          	movq	(%r13), %r13
; 	while (node->parent) {
ffff80000010f1d5: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f1d9: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f1dc: 0f 84 fc 00 00 00    	je	0xffff80000010f2de <rb_remove+0x1be>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f1e2: 4c 8b 76 08          	movq	8(%rsi), %r14
ffff80000010f1e6: 31 db                	xorl	%ebx, %ebx
ffff80000010f1e8: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f1eb: 0f 94 c3             	sete	%bl
; 		sibling = node->parent->child[dir];
ffff80000010f1ee: 48 8b 44 de 08       	movq	8(%rsi,%rbx,8), %rax
; 		if (!sibling) {
ffff80000010f1f3: 48 85 c0             	testq	%rax, %rax
ffff80000010f1f6: 0f 84 e2 00 00 00    	je	0xffff80000010f2de <rb_remove+0x1be>
; 		if (sibling->color == RB_RED) {
ffff80000010f1fc: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000010f200: 75 24                	jne	0xffff80000010f226 <rb_remove+0x106>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f202: 31 d2                	xorl	%edx, %edx
ffff80000010f204: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f207: 0f 95 c2             	setne	%dl
; 			node->parent->color = RB_RED;
ffff80000010f20a: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 			sibling->color = RB_BLACK;
ffff80000010f211: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff80000010f218: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f21b: ff d1                	callq	*%rcx
; 			sibling = node->parent->child[dir];
ffff80000010f21d: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f221: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f226: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f229: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f22c: 41 0f 95 c4          	setne	%r12b
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010f230: 4a 8b 4c e0 08       	movq	8(%rax,%r12,8), %rcx
ffff80000010f235: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f238: 74 06                	je	0xffff80000010f240 <rb_remove+0x120>
ffff80000010f23a: 83 79 18 00          	cmpl	$0, 24(%rcx)
; 		    RB_BLACK) &&
ffff80000010f23e: 75 18                	jne	0xffff80000010f258 <rb_remove+0x138>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010f240: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f245: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f248: 0f 84 72 ff ff ff    	je	0xffff80000010f1c0 <rb_remove+0xa0>
ffff80000010f24e: 83 7a 18 00          	cmpl	$0, 24(%rdx)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010f252: 0f 84 68 ff ff ff    	je	0xffff80000010f1c0 <rb_remove+0xa0>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010f258: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f25d: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f260: 74 1e                	je	0xffff80000010f280 <rb_remove+0x160>
ffff80000010f262: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010f266: 74 18                	je	0xffff80000010f280 <rb_remove+0x160>
ffff80000010f268: 49 be c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %r14 # imm = 0xFFFF80000010F0C0
ffff80000010f272: eb 39                	jmp	0xffff80000010f2ad <rb_remove+0x18d>
ffff80000010f274: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f27e: 66 90                	nop
; 			sibling->color = RB_RED;
ffff80000010f280: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff80000010f287: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			rotate_node(tree, node->parent, dir);
ffff80000010f28e: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f292: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f295: 89 da                	movl	%ebx, %edx
ffff80000010f297: 49 be c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %r14 # imm = 0xFFFF80000010F0C0
ffff80000010f2a1: 41 ff d6             	callq	*%r14
; 			sibling = node->parent->child[dir];
ffff80000010f2a4: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f2a8: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		sibling->color = node->parent->color;
ffff80000010f2ad: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f2b1: 8b 4e 18             	movl	24(%rsi), %ecx
ffff80000010f2b4: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff80000010f2b7: c7 46 18 00 00 00 00 	movl	$0, 24(%rsi)
; 		sibling->child[dir]->color = RB_BLACK;
ffff80000010f2be: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010f2c3: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff80000010f2ca: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f2cd: 44 89 e2             	movl	%r12d, %edx
ffff80000010f2d0: 41 ff d6             	callq	*%r14
ffff80000010f2d3: 4d 89 fd             	movq	%r15, %r13
ffff80000010f2d6: 4c 89 f1             	movq	%r14, %rcx
ffff80000010f2d9: e9 f3 fe ff ff       	jmp	0xffff80000010f1d1 <rb_remove+0xb1>
; 	if (node)
ffff80000010f2de: 4d 85 ed             	testq	%r13, %r13
ffff80000010f2e1: 74 10                	je	0xffff80000010f2f3 <rb_remove+0x1d3>
; 		node->color = RB_BLACK;
ffff80000010f2e3: 49 83 c5 18          	addq	$24, %r13
ffff80000010f2e7: 31 c0                	xorl	%eax, %eax
ffff80000010f2e9: 41 c7 45 00 00 00 00 00      	movl	$0, (%r13)
ffff80000010f2f1: eb 02                	jmp	0xffff80000010f2f5 <rb_remove+0x1d5>
ffff80000010f2f3: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f2f5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f2f9: 5b                   	popq	%rbx
ffff80000010f2fa: 41 5c                	popq	%r12
ffff80000010f2fc: 41 5d                	popq	%r13
ffff80000010f2fe: 41 5e                	popq	%r14
ffff80000010f300: 41 5f                	popq	%r15
ffff80000010f302: 5d                   	popq	%rbp
ffff80000010f303: c3                   	retq
ffff80000010f304: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f30e: 66 90                	nop

ffff80000010f310 <do_remove>:
; {
ffff80000010f310: 55                   	pushq	%rbp
ffff80000010f311: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f314: 41 57                	pushq	%r15
ffff80000010f316: 41 56                	pushq	%r14
ffff80000010f318: 41 54                	pushq	%r12
ffff80000010f31a: 53                   	pushq	%rbx
; 	if (!tree || !node)
ffff80000010f31b: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f31e: 0f 84 b7 00 00 00    	je	0xffff80000010f3db <do_remove+0xcb>
ffff80000010f324: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010f327: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f32a: 0f 84 ab 00 00 00    	je	0xffff80000010f3db <do_remove+0xcb>
ffff80000010f330: 49 89 fe             	movq	%rdi, %r14
; 	parent = node->parent;
ffff80000010f333: 4c 8b 23             	movq	(%rbx), %r12
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010f336: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010f33a: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f33d: 74 57                	je	0xffff80000010f396 <do_remove+0x86>
ffff80000010f33f: 48 83 7b 10 00       	cmpq	$0, 16(%rbx)
ffff80000010f344: 74 50                	je	0xffff80000010f396 <do_remove+0x86>
; 		child = get_outermost(child, RB_RIGHT);
ffff80000010f346: 48 b8 e0 ee 10 00 00 80 ff ff	movabsq	$-140737487245600, %rax # imm = 0xFFFF80000010EEE0
ffff80000010f350: be 01 00 00 00       	movl	$1, %esi
ffff80000010f355: ff d0                	callq	*%rax
ffff80000010f357: 49 89 c7             	movq	%rax, %r15
; 		do_remove(tree, child);
ffff80000010f35a: 48 b8 10 f3 10 00 00 80 ff ff	movabsq	$-140737487244528, %rax # imm = 0xFFFF80000010F310
ffff80000010f364: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f367: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f36a: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff80000010f36c: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f370: 49 89 47 08          	movq	%rax, 8(%r15)
; 		if (node->child[RB_LEFT])
ffff80000010f374: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f378: 48 85 c0             	testq	%rax, %rax
ffff80000010f37b: 74 03                	je	0xffff80000010f380 <do_remove+0x70>
; 			node->child[RB_LEFT]->parent = child;
ffff80000010f37d: 4c 89 38             	movq	%r15, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff80000010f380: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f384: 49 89 47 10          	movq	%rax, 16(%r15)
; 		if (node->child[RB_RIGHT])
ffff80000010f388: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f38c: 48 85 c0             	testq	%rax, %rax
ffff80000010f38f: 74 12                	je	0xffff80000010f3a3 <do_remove+0x93>
; 			node->child[RB_RIGHT]->parent = child;
ffff80000010f391: 4c 89 38             	movq	%r15, (%rax)
ffff80000010f394: eb 0d                	jmp	0xffff80000010f3a3 <do_remove+0x93>
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010f396: 31 c0                	xorl	%eax, %eax
ffff80000010f398: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f39b: 0f 94 c0             	sete	%al
; 		child = node->child[child_dir];
ffff80000010f39e: 4c 8b 7c c3 08       	movq	8(%rbx,%rax,8), %r15
; 	if (parent) {
ffff80000010f3a3: 4d 85 e4             	testq	%r12, %r12
ffff80000010f3a6: 74 12                	je	0xffff80000010f3ba <do_remove+0xaa>
; 		dir = parent->child[RB_RIGHT] == node;
ffff80000010f3a8: 31 c0                	xorl	%eax, %eax
ffff80000010f3aa: 49 39 5c 24 10       	cmpq	%rbx, 16(%r12)
ffff80000010f3af: 0f 94 c0             	sete	%al
; 		parent->child[dir] = child;
ffff80000010f3b2: 4d 8d 34 c4          	leaq	(%r12,%rax,8), %r14
ffff80000010f3b6: 49 83 c6 08          	addq	$8, %r14
ffff80000010f3ba: 4d 89 3e             	movq	%r15, (%r14)
; 	if (child)
ffff80000010f3bd: 4d 85 ff             	testq	%r15, %r15
ffff80000010f3c0: 74 03                	je	0xffff80000010f3c5 <do_remove+0xb5>
; 		child->parent = parent;
ffff80000010f3c2: 4d 89 27             	movq	%r12, (%r15)
; 	memset(node, 0, sizeof *node);
ffff80000010f3c5: 48 b8 b0 f7 10 00 00 80 ff ff	movabsq	$-140737487243344, %rax # imm = 0xFFFF80000010F7B0
ffff80000010f3cf: ba 20 00 00 00       	movl	$32, %edx
ffff80000010f3d4: 48 89 df             	movq	%rbx, %rdi
ffff80000010f3d7: 31 f6                	xorl	%esi, %esi
ffff80000010f3d9: ff d0                	callq	*%rax
; }
ffff80000010f3db: 5b                   	popq	%rbx
ffff80000010f3dc: 41 5c                	popq	%r12
ffff80000010f3de: 41 5e                	popq	%r14
ffff80000010f3e0: 41 5f                	popq	%r15
ffff80000010f3e2: 5d                   	popq	%rbp
ffff80000010f3e3: c3                   	retq
ffff80000010f3e4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f3ee: 66 90                	nop

ffff80000010f3f0 <rb_replace>:
; {
ffff80000010f3f0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!node || !new_node)
ffff80000010f3f5: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f3f8: 74 5e                	je	0xffff80000010f458 <rb_replace+0x68>
ffff80000010f3fa: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f3fd: 74 59                	je	0xffff80000010f458 <rb_replace+0x68>
ffff80000010f3ff: 55                   	pushq	%rbp
ffff80000010f400: 48 89 e5             	movq	%rsp, %rbp
; 	if (node->parent)
ffff80000010f403: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f406: 48 85 c0             	testq	%rax, %rax
ffff80000010f409: 74 11                	je	0xffff80000010f41c <rb_replace+0x2c>
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff80000010f40b: 31 c9                	xorl	%ecx, %ecx
ffff80000010f40d: 48 39 70 10          	cmpq	%rsi, 16(%rax)
ffff80000010f411: 0f 94 c1             	sete	%cl
ffff80000010f414: 48 8d 3c c8          	leaq	(%rax,%rcx,8), %rdi
ffff80000010f418: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f41c: 48 89 17             	movq	%rdx, (%rdi)
; 	if (node->child[RB_LEFT])
ffff80000010f41f: 48 8b 46 08          	movq	8(%rsi), %rax
ffff80000010f423: 48 85 c0             	testq	%rax, %rax
ffff80000010f426: 74 03                	je	0xffff80000010f42b <rb_replace+0x3b>
; 		node->child[RB_LEFT]->parent = new_node;
ffff80000010f428: 48 89 10             	movq	%rdx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff80000010f42b: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f42f: 48 85 c0             	testq	%rax, %rax
ffff80000010f432: 74 03                	je	0xffff80000010f437 <rb_replace+0x47>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff80000010f434: 48 89 10             	movq	%rdx, (%rax)
; 	*new_node = *node;
ffff80000010f437: 48 8b 46 18          	movq	24(%rsi), %rax
ffff80000010f43b: 48 89 42 18          	movq	%rax, 24(%rdx)
ffff80000010f43f: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f443: 48 89 42 10          	movq	%rax, 16(%rdx)
ffff80000010f447: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f44a: 48 8b 4e 08          	movq	8(%rsi), %rcx
ffff80000010f44e: 48 89 4a 08          	movq	%rcx, 8(%rdx)
ffff80000010f452: 48 89 02             	movq	%rax, (%rdx)
ffff80000010f455: 31 c0                	xorl	%eax, %eax
ffff80000010f457: 5d                   	popq	%rbp
; }
ffff80000010f458: c3                   	retq
ffff80000010f459: cc                   	int3
ffff80000010f45a: cc                   	int3
ffff80000010f45b: cc                   	int3
ffff80000010f45c: cc                   	int3
ffff80000010f45d: cc                   	int3
ffff80000010f45e: cc                   	int3
ffff80000010f45f: cc                   	int3

ffff80000010f460 <readline>:
; {
ffff80000010f460: 55                   	pushq	%rbp
ffff80000010f461: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f464: 41 57                	pushq	%r15
ffff80000010f466: 41 56                	pushq	%r14
ffff80000010f468: 41 55                	pushq	%r13
ffff80000010f46a: 41 54                	pushq	%r12
ffff80000010f46c: 53                   	pushq	%rbx
ffff80000010f46d: 50                   	pushq	%rax
ffff80000010f46e: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
; 	if (prompt != NULL)
ffff80000010f478: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f47b: 74 11                	je	0xffff80000010f48e <readline+0x2e>
ffff80000010f47d: 48 89 fe             	movq	%rdi, %rsi
; 		cprintf("%s", prompt);
ffff80000010f480: 48 bf 53 09 11 00 00 80 ff ff	movabsq	$-140737487238829, %rdi # imm = 0xFFFF800000110953
ffff80000010f48a: 31 c0                	xorl	%eax, %eax
ffff80000010f48c: ff d1                	callq	*%rcx
; 	echoing = iscons(0);
ffff80000010f48e: 48 b8 00 c5 10 00 00 80 ff ff	movabsq	$-140737487256320, %rax # imm = 0xFFFF80000010C500
ffff80000010f498: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010f49b: 31 ff                	xorl	%edi, %edi
ffff80000010f49d: ff d0                	callq	*%rax
ffff80000010f49f: 41 89 c7             	movl	%eax, %r15d
; 		c = getchar();
ffff80000010f4a2: 49 bc e0 c4 10 00 00 80 ff ff	movabsq	$-140737487256352, %r12 # imm = 0xFFFF80000010C4E0
ffff80000010f4ac: 41 ff d4             	callq	*%r12
ffff80000010f4af: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff80000010f4b1: 85 c0                	testl	%eax, %eax
ffff80000010f4b3: 0f 88 b1 00 00 00    	js	0xffff80000010f56a <readline+0x10a>
ffff80000010f4b9: 49 be f0 42 11 00 00 80 ff ff	movabsq	$-140737487224080, %r14 # imm = 0xFFFF8000001142F0
ffff80000010f4c3: eb 1c                	jmp	0xffff80000010f4e1 <readline+0x81>
ffff80000010f4c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f4cf: 90                   	nop
; 			i--;
ffff80000010f4d0: 41 83 c5 ff          	addl	$-1, %r13d
; 		c = getchar();
ffff80000010f4d4: 41 ff d4             	callq	*%r12
ffff80000010f4d7: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff80000010f4d9: 85 c0                	testl	%eax, %eax
ffff80000010f4db: 0f 88 89 00 00 00    	js	0xffff80000010f56a <readline+0x10a>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000010f4e1: 83 fb 08             	cmpl	$8, %ebx
ffff80000010f4e4: 0f 95 c0             	setne	%al
ffff80000010f4e7: 83 fb 7f             	cmpl	$127, %ebx
ffff80000010f4ea: 0f 95 c1             	setne	%cl
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000010f4ed: 84 c8                	testb	%cl, %al
ffff80000010f4ef: 75 1f                	jne	0xffff80000010f510 <readline+0xb0>
ffff80000010f4f1: 45 85 ed             	testl	%r13d, %r13d
ffff80000010f4f4: 7e 1a                	jle	0xffff80000010f510 <readline+0xb0>
ffff80000010f4f6: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff80000010f4f9: 74 d5                	je	0xffff80000010f4d0 <readline+0x70>
; 				cputchar('\b');
ffff80000010f4fb: bf 08 00 00 00       	movl	$8, %edi
ffff80000010f500: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f50a: ff d0                	callq	*%rax
ffff80000010f50c: eb c2                	jmp	0xffff80000010f4d0 <readline+0x70>
ffff80000010f50e: 66 90                	nop
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff80000010f510: 83 fb 20             	cmpl	$32, %ebx
ffff80000010f513: 7c 2b                	jl	0xffff80000010f540 <readline+0xe0>
ffff80000010f515: 41 81 fd fe 03 00 00 	cmpl	$1022, %r13d            # imm = 0x3FE
ffff80000010f51c: 7f 22                	jg	0xffff80000010f540 <readline+0xe0>
ffff80000010f51e: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff80000010f521: 74 0e                	je	0xffff80000010f531 <readline+0xd1>
; 				cputchar(c);
ffff80000010f523: 89 df                	movl	%ebx, %edi
ffff80000010f525: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f52f: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff80000010f531: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f534: 41 83 c5 01          	addl	$1, %r13d
ffff80000010f538: 42 88 1c 30          	movb	%bl, (%rax,%r14)
ffff80000010f53c: eb 96                	jmp	0xffff80000010f4d4 <readline+0x74>
ffff80000010f53e: 66 90                	nop
; 		} else if (c == '\n' || c == '\r') {
ffff80000010f540: 83 fb 0d             	cmpl	$13, %ebx
ffff80000010f543: 74 05                	je	0xffff80000010f54a <readline+0xea>
ffff80000010f545: 83 fb 0a             	cmpl	$10, %ebx
ffff80000010f548: 75 8a                	jne	0xffff80000010f4d4 <readline+0x74>
; 			if (echoing)
ffff80000010f54a: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f54d: 74 11                	je	0xffff80000010f560 <readline+0x100>
; 				cputchar('\n');
ffff80000010f54f: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010f554: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f55e: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff80000010f560: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f563: 42 c6 04 30 00       	movb	$0, (%rax,%r14)
ffff80000010f568: eb 1d                	jmp	0xffff80000010f587 <readline+0x127>
; 			cprintf("read error: %e\n", c);
ffff80000010f56a: 48 bf b9 0b 11 00 00 80 ff ff	movabsq	$-140737487238215, %rdi # imm = 0xFFFF800000110BB9
ffff80000010f574: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010f577: 89 de                	movl	%ebx, %esi
ffff80000010f579: 31 c0                	xorl	%eax, %eax
ffff80000010f57b: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010f585: ff d1                	callq	*%rcx
; }
ffff80000010f587: 4c 89 f0             	movq	%r14, %rax
ffff80000010f58a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f58e: 5b                   	popq	%rbx
ffff80000010f58f: 41 5c                	popq	%r12
ffff80000010f591: 41 5d                	popq	%r13
ffff80000010f593: 41 5e                	popq	%r14
ffff80000010f595: 41 5f                	popq	%r15
ffff80000010f597: 5d                   	popq	%rbp
ffff80000010f598: c3                   	retq
ffff80000010f599: cc                   	int3
ffff80000010f59a: cc                   	int3
ffff80000010f59b: cc                   	int3
ffff80000010f59c: cc                   	int3
ffff80000010f59d: cc                   	int3
ffff80000010f59e: cc                   	int3
ffff80000010f59f: cc                   	int3

ffff80000010f5a0 <strlen>:
; {
ffff80000010f5a0: 55                   	pushq	%rbp
ffff80000010f5a1: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
ffff80000010f5a4: 80 3f 00             	cmpb	$0, (%rdi)
ffff80000010f5a7: 74 14                	je	0xffff80000010f5bd <strlen+0x1d>
ffff80000010f5a9: 31 c0                	xorl	%eax, %eax
ffff80000010f5ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
ffff80000010f5b0: 80 7c 07 01 00       	cmpb	$0, 1(%rdi,%rax)
ffff80000010f5b5: 48 8d 40 01          	leaq	1(%rax), %rax
ffff80000010f5b9: 75 f5                	jne	0xffff80000010f5b0 <strlen+0x10>
; 	return n;
ffff80000010f5bb: 5d                   	popq	%rbp
ffff80000010f5bc: c3                   	retq
ffff80000010f5bd: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff80000010f5bf: 5d                   	popq	%rbp
ffff80000010f5c0: c3                   	retq
ffff80000010f5c1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f5cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f5d0 <strnlen>:
; {
ffff80000010f5d0: 55                   	pushq	%rbp
ffff80000010f5d1: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000010f5d4: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f5d7: 74 18                	je	0xffff80000010f5f1 <strnlen+0x21>
ffff80000010f5d9: 48 89 f0             	movq	%rsi, %rax
ffff80000010f5dc: 31 c9                	xorl	%ecx, %ecx
ffff80000010f5de: 66 90                	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000010f5e0: 80 3c 0f 00          	cmpb	$0, (%rdi,%rcx)
ffff80000010f5e4: 74 0f                	je	0xffff80000010f5f5 <strnlen+0x25>
ffff80000010f5e6: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f5ea: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f5ed: 75 f1                	jne	0xffff80000010f5e0 <strnlen+0x10>
; 	return n;
ffff80000010f5ef: 5d                   	popq	%rbp
ffff80000010f5f0: c3                   	retq
ffff80000010f5f1: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff80000010f5f3: 5d                   	popq	%rbp
ffff80000010f5f4: c3                   	retq
ffff80000010f5f5: 89 c8                	movl	%ecx, %eax
; 	return n;
ffff80000010f5f7: 5d                   	popq	%rbp
ffff80000010f5f8: c3                   	retq
ffff80000010f5f9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f600 <strcpy>:
; {
ffff80000010f600: 55                   	pushq	%rbp
ffff80000010f601: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f604: 48 89 f8             	movq	%rdi, %rax
ffff80000010f607: 31 c9                	xorl	%ecx, %ecx
ffff80000010f609: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
ffff80000010f610: 0f b6 14 0e          	movzbl	(%rsi,%rcx), %edx
ffff80000010f614: 88 14 08             	movb	%dl, (%rax,%rcx)
ffff80000010f617: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f61b: 84 d2                	testb	%dl, %dl
ffff80000010f61d: 75 f1                	jne	0xffff80000010f610 <strcpy+0x10>
; 	return ret;
ffff80000010f61f: 5d                   	popq	%rbp
ffff80000010f620: c3                   	retq
ffff80000010f621: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f62b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f630 <strcat>:
; {
ffff80000010f630: 55                   	pushq	%rbp
ffff80000010f631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f634: 41 56                	pushq	%r14
ffff80000010f636: 53                   	pushq	%rbx
ffff80000010f637: 49 89 f6             	movq	%rsi, %r14
ffff80000010f63a: 48 89 fb             	movq	%rdi, %rbx
; 	int len = strlen(dst);
ffff80000010f63d: 48 b8 a0 f5 10 00 00 80 ff ff	movabsq	$-140737487243872, %rax # imm = 0xFFFF80000010F5A0
ffff80000010f647: ff d0                	callq	*%rax
; 	strcpy(dst + len, src);
ffff80000010f649: 48 63 f8             	movslq	%eax, %rdi
ffff80000010f64c: 48 01 df             	addq	%rbx, %rdi
ffff80000010f64f: 48 b8 00 f6 10 00 00 80 ff ff	movabsq	$-140737487243776, %rax # imm = 0xFFFF80000010F600
ffff80000010f659: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f65c: ff d0                	callq	*%rax
; 	return dst;
ffff80000010f65e: 48 89 d8             	movq	%rbx, %rax
ffff80000010f661: 5b                   	popq	%rbx
ffff80000010f662: 41 5e                	popq	%r14
ffff80000010f664: 5d                   	popq	%rbp
ffff80000010f665: c3                   	retq
ffff80000010f666: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f670 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff80000010f670: 55                   	pushq	%rbp
ffff80000010f671: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f674: 48 89 f8             	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
ffff80000010f677: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f67a: 74 1a                	je	0xffff80000010f696 <strncpy+0x26>
ffff80000010f67c: 31 ff                	xorl	%edi, %edi
ffff80000010f67e: 66 90                	nop
; 		*dst++ = *src;
ffff80000010f680: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f683: 88 0c 38             	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
ffff80000010f686: 80 3e 01             	cmpb	$1, (%rsi)
ffff80000010f689: 48 83 de ff          	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
ffff80000010f68d: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f691: 48 39 fa             	cmpq	%rdi, %rdx
ffff80000010f694: 75 ea                	jne	0xffff80000010f680 <strncpy+0x10>
; 	return ret;
ffff80000010f696: 5d                   	popq	%rbp
ffff80000010f697: c3                   	retq
ffff80000010f698: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f6a0 <strlcpy>:
; {
ffff80000010f6a0: 55                   	pushq	%rbp
ffff80000010f6a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f6a4: 48 89 f8             	movq	%rdi, %rax
; 	if (size > 0) {
ffff80000010f6a7: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f6aa: 74 2e                	je	0xffff80000010f6da <strlcpy+0x3a>
ffff80000010f6ac: 48 89 f8             	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
ffff80000010f6af: 48 83 c2 ff          	addq	$-1, %rdx
ffff80000010f6b3: 74 22                	je	0xffff80000010f6d7 <strlcpy+0x37>
ffff80000010f6b5: 31 c0                	xorl	%eax, %eax
ffff80000010f6b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
ffff80000010f6c0: 0f b6 0c 06          	movzbl	(%rsi,%rax), %ecx
ffff80000010f6c4: 84 c9                	testb	%cl, %cl
ffff80000010f6c6: 74 0c                	je	0xffff80000010f6d4 <strlcpy+0x34>
; 			*dst++ = *src++;
ffff80000010f6c8: 88 0c 07             	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
ffff80000010f6cb: 48 83 c0 01          	addq	$1, %rax
ffff80000010f6cf: 48 39 c2             	cmpq	%rax, %rdx
ffff80000010f6d2: 75 ec                	jne	0xffff80000010f6c0 <strlcpy+0x20>
ffff80000010f6d4: 48 01 f8             	addq	%rdi, %rax
; 		*dst = '\0';
ffff80000010f6d7: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff80000010f6da: 48 29 f8             	subq	%rdi, %rax
ffff80000010f6dd: 5d                   	popq	%rbp
ffff80000010f6de: c3                   	retq
ffff80000010f6df: 90                   	nop

ffff80000010f6e0 <strcmp>:
; {
ffff80000010f6e0: 55                   	pushq	%rbp
ffff80000010f6e1: 48 89 e5             	movq	%rsp, %rbp
; 	while (*p && *p == *q)
ffff80000010f6e4: 8a 07                	movb	(%rdi), %al
ffff80000010f6e6: 84 c0                	testb	%al, %al
ffff80000010f6e8: 74 19                	je	0xffff80000010f703 <strcmp+0x23>
ffff80000010f6ea: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f6ee: 66 90                	nop
ffff80000010f6f0: 3a 06                	cmpb	(%rsi), %al
ffff80000010f6f2: 75 0f                	jne	0xffff80000010f703 <strcmp+0x23>
; 		p++, q++;
ffff80000010f6f4: 48 83 c6 01          	addq	$1, %rsi
; 	while (*p && *p == *q)
ffff80000010f6f8: 0f b6 07             	movzbl	(%rdi), %eax
ffff80000010f6fb: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f6ff: 84 c0                	testb	%al, %al
ffff80000010f701: 75 ed                	jne	0xffff80000010f6f0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000010f703: 0f b6 c0             	movzbl	%al, %eax
ffff80000010f706: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f709: 29 c8                	subl	%ecx, %eax
ffff80000010f70b: 5d                   	popq	%rbp
ffff80000010f70c: c3                   	retq
ffff80000010f70d: 0f 1f 00             	nopl	(%rax)

ffff80000010f710 <strncmp>:
; {
ffff80000010f710: 55                   	pushq	%rbp
ffff80000010f711: 48 89 e5             	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
ffff80000010f714: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f717: 74 1d                	je	0xffff80000010f736 <strncmp+0x26>
ffff80000010f719: 31 c9                	xorl	%ecx, %ecx
ffff80000010f71b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
ffff80000010f720: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010f724: 85 c0                	testl	%eax, %eax
ffff80000010f726: 74 12                	je	0xffff80000010f73a <strncmp+0x2a>
ffff80000010f728: 3a 04 0e             	cmpb	(%rsi,%rcx), %al
ffff80000010f72b: 75 0d                	jne	0xffff80000010f73a <strncmp+0x2a>
ffff80000010f72d: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f731: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010f734: 75 ea                	jne	0xffff80000010f720 <strncmp+0x10>
ffff80000010f736: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f738: 5d                   	popq	%rbp
ffff80000010f739: c3                   	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000010f73a: 0f b6 0c 0e          	movzbl	(%rsi,%rcx), %ecx
ffff80000010f73e: 29 c8                	subl	%ecx, %eax
; }
ffff80000010f740: 5d                   	popq	%rbp
ffff80000010f741: c3                   	retq
ffff80000010f742: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f74c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f750 <strchr>:
; {
ffff80000010f750: 55                   	pushq	%rbp
ffff80000010f751: 48 89 e5             	movq	%rsp, %rbp
; 	for (; *s; s++)
ffff80000010f754: 8a 0f                	movb	(%rdi), %cl
ffff80000010f756: 84 c9                	testb	%cl, %cl
ffff80000010f758: 74 17                	je	0xffff80000010f771 <strchr+0x21>
ffff80000010f75a: 48 89 f8             	movq	%rdi, %rax
ffff80000010f75d: 0f 1f 00             	nopl	(%rax)
; 		if (*s == c)
ffff80000010f760: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f763: 74 0e                	je	0xffff80000010f773 <strchr+0x23>
; 	for (; *s; s++)
ffff80000010f765: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f769: 48 83 c0 01          	addq	$1, %rax
ffff80000010f76d: 84 c9                	testb	%cl, %cl
ffff80000010f76f: 75 ef                	jne	0xffff80000010f760 <strchr+0x10>
ffff80000010f771: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f773: 5d                   	popq	%rbp
ffff80000010f774: c3                   	retq
ffff80000010f775: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f77f: 90                   	nop

ffff80000010f780 <strfind>:
; {
ffff80000010f780: 55                   	pushq	%rbp
ffff80000010f781: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f784: 48 89 f8             	movq	%rdi, %rax
; 	for (; *s; s++)
ffff80000010f787: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010f78b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f790: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f794: 48 83 c0 01          	addq	$1, %rax
ffff80000010f798: 84 c9                	testb	%cl, %cl
ffff80000010f79a: 74 05                	je	0xffff80000010f7a1 <strfind+0x21>
ffff80000010f79c: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f79f: 75 ef                	jne	0xffff80000010f790 <strfind+0x10>
; 	return (char *) s;
ffff80000010f7a1: 5d                   	popq	%rbp
ffff80000010f7a2: c3                   	retq
ffff80000010f7a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f7ad: 0f 1f 00             	nopl	(%rax)

ffff80000010f7b0 <memset>:
; {
ffff80000010f7b0: 55                   	pushq	%rbp
ffff80000010f7b1: 48 89 e5             	movq	%rsp, %rbp
; 	if (n == 0)
ffff80000010f7b4: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f7b7: 74 36                	je	0xffff80000010f7ef <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff80000010f7b9: 89 f8                	movl	%edi, %eax
ffff80000010f7bb: 09 d0                	orl	%edx, %eax
ffff80000010f7bd: a8 03                	testb	$3, %al
ffff80000010f7bf: 74 0a                	je	0xffff80000010f7cb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
ffff80000010f7c1: 89 f0                	movl	%esi, %eax
ffff80000010f7c3: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f7c6: fc                   	cld
ffff80000010f7c7: f3 aa                	rep		stosb	%al, %es:(%rdi)
ffff80000010f7c9: eb 24                	jmp	0xffff80000010f7ef <memset+0x3f>
; 		c &= 0xFF;
ffff80000010f7cb: 44 0f b6 c6          	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff80000010f7cf: c1 e6 18             	shll	$24, %esi
ffff80000010f7d2: 44 89 c1             	movl	%r8d, %ecx
ffff80000010f7d5: c1 e1 10             	shll	$16, %ecx
ffff80000010f7d8: 09 f1                	orl	%esi, %ecx
ffff80000010f7da: 44 89 c0             	movl	%r8d, %eax
ffff80000010f7dd: c1 e0 08             	shll	$8, %eax
ffff80000010f7e0: 09 c8                	orl	%ecx, %eax
ffff80000010f7e2: 44 09 c0             	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff80000010f7e5: 48 c1 ea 02          	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
ffff80000010f7e9: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f7ec: fc                   	cld
ffff80000010f7ed: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; }
ffff80000010f7ef: 48 89 f8             	movq	%rdi, %rax
ffff80000010f7f2: 5d                   	popq	%rbp
ffff80000010f7f3: c3                   	retq
ffff80000010f7f4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f7fe: 66 90                	nop

ffff80000010f800 <memmove>:
; {
ffff80000010f800: 55                   	pushq	%rbp
ffff80000010f801: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f804: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f807: 48 89 f2             	movq	%rsi, %rdx
ffff80000010f80a: 48 89 f8             	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
ffff80000010f80d: 48 39 fe             	cmpq	%rdi, %rsi
ffff80000010f810: 73 38                	jae	0xffff80000010f84a <memmove+0x4a>
ffff80000010f812: 48 8d 34 0a          	leaq	(%rdx,%rcx), %rsi
ffff80000010f816: 48 39 c6             	cmpq	%rax, %rsi
ffff80000010f819: 76 2f                	jbe	0xffff80000010f84a <memmove+0x4a>
; 		d += n;
ffff80000010f81b: 48 8d 3c 08          	leaq	(%rax,%rcx), %rdi
ffff80000010f81f: f6 c1 03             	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f822: 75 4e                	jne	0xffff80000010f872 <memmove+0x72>
ffff80000010f824: 89 f2                	movl	%esi, %edx
ffff80000010f826: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f829: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f82c: 75 44                	jne	0xffff80000010f872 <memmove+0x72>
ffff80000010f82e: 89 fa                	movl	%edi, %edx
ffff80000010f830: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f833: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f836: 75 3a                	jne	0xffff80000010f872 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff80000010f838: 48 83 c7 fc          	addq	$-4, %rdi
ffff80000010f83c: 48 83 c6 fc          	addq	$-4, %rsi
ffff80000010f840: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff80000010f844: fd                   	std
ffff80000010f845: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff80000010f847: fc                   	cld
; 	return dst;
ffff80000010f848: 5d                   	popq	%rbp
ffff80000010f849: c3                   	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f84a: 89 d6                	movl	%edx, %esi
ffff80000010f84c: 09 c6                	orl	%eax, %esi
ffff80000010f84e: 89 cf                	movl	%ecx, %edi
ffff80000010f850: 09 f7                	orl	%esi, %edi
ffff80000010f852: 40 f6 c7 03          	testb	$3, %dil
ffff80000010f856: 74 0b                	je	0xffff80000010f863 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
ffff80000010f858: 48 89 c7             	movq	%rax, %rdi
ffff80000010f85b: 48 89 d6             	movq	%rdx, %rsi
ffff80000010f85e: fc                   	cld
ffff80000010f85f: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
ffff80000010f861: 5d                   	popq	%rbp
ffff80000010f862: c3                   	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff80000010f863: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff80000010f867: 48 89 c7             	movq	%rax, %rdi
ffff80000010f86a: 48 89 d6             	movq	%rdx, %rsi
ffff80000010f86d: fc                   	cld
ffff80000010f86e: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
ffff80000010f870: 5d                   	popq	%rbp
ffff80000010f871: c3                   	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff80000010f872: 48 83 c7 ff          	addq	$-1, %rdi
ffff80000010f876: 48 83 c6 ff          	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
ffff80000010f87a: fd                   	std
ffff80000010f87b: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff80000010f87d: fc                   	cld
; 	return dst;
ffff80000010f87e: 5d                   	popq	%rbp
ffff80000010f87f: c3                   	retq

ffff80000010f880 <memcpy>:
; {
ffff80000010f880: 55                   	pushq	%rbp
ffff80000010f881: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f884: 53                   	pushq	%rbx
ffff80000010f885: 50                   	pushq	%rax
ffff80000010f886: 48 89 fb             	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
ffff80000010f889: 48 b8 00 f8 10 00 00 80 ff ff	movabsq	$-140737487243264, %rax # imm = 0xFFFF80000010F800
ffff80000010f893: ff d0                	callq	*%rax
ffff80000010f895: 48 89 d8             	movq	%rbx, %rax
ffff80000010f898: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f89c: 5b                   	popq	%rbx
ffff80000010f89d: 5d                   	popq	%rbp
ffff80000010f89e: c3                   	retq
ffff80000010f89f: 90                   	nop

ffff80000010f8a0 <memcmp>:
; {
ffff80000010f8a0: 55                   	pushq	%rbp
ffff80000010f8a1: 48 89 e5             	movq	%rsp, %rbp
; 	while (n-- > 0) {
ffff80000010f8a4: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f8a7: 74 1e                	je	0xffff80000010f8c7 <memcmp+0x27>
ffff80000010f8a9: 31 c9                	xorl	%ecx, %ecx
ffff80000010f8ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
ffff80000010f8b0: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010f8b4: 44 0f b6 04 0e       	movzbl	(%rsi,%rcx), %r8d
ffff80000010f8b9: 44 38 c0             	cmpb	%r8b, %al
ffff80000010f8bc: 75 0d                	jne	0xffff80000010f8cb <memcmp+0x2b>
; 	while (n-- > 0) {
ffff80000010f8be: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f8c2: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010f8c5: 75 e9                	jne	0xffff80000010f8b0 <memcmp+0x10>
ffff80000010f8c7: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f8c9: 5d                   	popq	%rbp
ffff80000010f8ca: c3                   	retq
; 			return (int) *s1 - (int) *s2;
ffff80000010f8cb: 44 29 c0             	subl	%r8d, %eax
; }
ffff80000010f8ce: 5d                   	popq	%rbp
ffff80000010f8cf: c3                   	retq

ffff80000010f8d0 <memfind>:
; {
ffff80000010f8d0: 55                   	pushq	%rbp
ffff80000010f8d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f8d4: 48 89 f8             	movq	%rdi, %rax
; 	for (; s < ends; s++)
ffff80000010f8d7: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f8da: 7e 12                	jle	0xffff80000010f8ee <memfind+0x1e>
ffff80000010f8dc: 48 01 c2             	addq	%rax, %rdx
ffff80000010f8df: 90                   	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff80000010f8e0: 40 38 30             	cmpb	%sil, (%rax)
ffff80000010f8e3: 74 09                	je	0xffff80000010f8ee <memfind+0x1e>
; 	for (; s < ends; s++)
ffff80000010f8e5: 48 83 c0 01          	addq	$1, %rax
ffff80000010f8e9: 48 39 d0             	cmpq	%rdx, %rax
ffff80000010f8ec: 72 f2                	jb	0xffff80000010f8e0 <memfind+0x10>
; 	return (void *) s;
ffff80000010f8ee: 5d                   	popq	%rbp
ffff80000010f8ef: c3                   	retq

ffff80000010f8f0 <strtol>:
; {
ffff80000010f8f0: 55                   	pushq	%rbp
ffff80000010f8f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f8f4: 48 b8 e8 05 11 00 00 80 ff ff	movabsq	$-140737487239704, %rax # imm = 0xFFFF8000001105E8
ffff80000010f8fe: 66 90                	nop
; 	while (*s == ' ' || *s == '\t')
ffff80000010f900: 0f b6 0f             	movzbl	(%rdi), %ecx
ffff80000010f903: 80 c1 f7             	addb	$-9, %cl
ffff80000010f906: 80 f9 24             	cmpb	$36, %cl
ffff80000010f909: 77 10                	ja	0xffff80000010f91b <strtol+0x2b>
ffff80000010f90b: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010f90e: ff 24 c8             	jmpq	*(%rax,%rcx,8)
; 		s++;
ffff80000010f911: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f915: eb e9                	jmp	0xffff80000010f900 <strtol+0x10>
; 		s++;
ffff80000010f917: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f91b: 41 b0 01             	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010f91e: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010f924: 75 27                	jne	0xffff80000010f94d <strtol+0x5d>
ffff80000010f926: eb 0f                	jmp	0xffff80000010f937 <strtol+0x47>
; 		s++, neg = 1;
ffff80000010f928: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f92c: 45 31 c0             	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010f92f: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010f935: 75 16                	jne	0xffff80000010f94d <strtol+0x5d>
ffff80000010f937: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010f93a: 75 11                	jne	0xffff80000010f94d <strtol+0x5d>
ffff80000010f93c: 80 7f 01 78          	cmpb	$120, 1(%rdi)
ffff80000010f940: 75 0b                	jne	0xffff80000010f94d <strtol+0x5d>
; 		s += 2, base = 16;
ffff80000010f942: 48 83 c7 02          	addq	$2, %rdi
ffff80000010f946: ba 10 00 00 00       	movl	$16, %edx
ffff80000010f94b: eb 1a                	jmp	0xffff80000010f967 <strtol+0x77>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010f94d: 85 d2                	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
ffff80000010f94f: 75 16                	jne	0xffff80000010f967 <strtol+0x77>
ffff80000010f951: 31 c0                	xorl	%eax, %eax
ffff80000010f953: 31 c9                	xorl	%ecx, %ecx
ffff80000010f955: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010f958: 0f 95 c0             	setne	%al
ffff80000010f95b: 0f 94 c1             	sete	%cl
ffff80000010f95e: 48 01 cf             	addq	%rcx, %rdi
ffff80000010f961: 8d 14 00             	leal	(%rax,%rax), %edx
ffff80000010f964: 83 c2 08             	addl	$8, %edx
ffff80000010f967: 4c 63 ca             	movslq	%edx, %r9
ffff80000010f96a: 45 31 d2             	xorl	%r10d, %r10d
ffff80000010f96d: eb 25                	jmp	0xffff80000010f994 <strtol+0xa4>
ffff80000010f96f: 90                   	nop
ffff80000010f970: 31 c0                	xorl	%eax, %eax
ffff80000010f972: 84 c0                	testb	%al, %al
ffff80000010f974: 75 1e                	jne	0xffff80000010f994 <strtol+0xa4>
ffff80000010f976: eb 51                	jmp	0xffff80000010f9c9 <strtol+0xd9>
ffff80000010f978: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
ffff80000010f980: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f984: 4d 0f af d1          	imulq	%r9, %r10
ffff80000010f988: 48 63 c1             	movslq	%ecx, %rax
ffff80000010f98b: 49 01 c2             	addq	%rax, %r10
ffff80000010f98e: b0 01                	movb	$1, %al
ffff80000010f990: 84 c0                	testb	%al, %al
ffff80000010f992: 74 35                	je	0xffff80000010f9c9 <strtol+0xd9>
; 		if (*s >= '0' && *s <= '9')
ffff80000010f994: 44 0f be 1f          	movsbl	(%rdi), %r11d
ffff80000010f998: 41 8d 43 d0          	leal	-48(%r11), %eax
ffff80000010f99c: b9 d0 ff ff ff       	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
ffff80000010f9a1: 3c 0a                	cmpb	$10, %al
ffff80000010f9a3: 72 1b                	jb	0xffff80000010f9c0 <strtol+0xd0>
; 		else if (*s >= 'a' && *s <= 'z')
ffff80000010f9a5: 41 8d 43 9f          	leal	-97(%r11), %eax
ffff80000010f9a9: b9 a9 ff ff ff       	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
ffff80000010f9ae: 3c 1a                	cmpb	$26, %al
ffff80000010f9b0: 72 0e                	jb	0xffff80000010f9c0 <strtol+0xd0>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff80000010f9b2: 41 8d 43 bf          	leal	-65(%r11), %eax
ffff80000010f9b6: b9 c9 ff ff ff       	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
ffff80000010f9bb: 3c 19                	cmpb	$25, %al
ffff80000010f9bd: 77 b1                	ja	0xffff80000010f970 <strtol+0x80>
ffff80000010f9bf: 90                   	nop
ffff80000010f9c0: 44 01 d9             	addl	%r11d, %ecx
; 		if (dig >= base)
ffff80000010f9c3: 39 d1                	cmpl	%edx, %ecx
ffff80000010f9c5: 7c b9                	jl	0xffff80000010f980 <strtol+0x90>
ffff80000010f9c7: eb a7                	jmp	0xffff80000010f970 <strtol+0x80>
; 	if (endptr)
ffff80000010f9c9: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f9cc: 74 03                	je	0xffff80000010f9d1 <strtol+0xe1>
; 		*endptr = (char *) s;
ffff80000010f9ce: 48 89 3e             	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
ffff80000010f9d1: 4c 89 d0             	movq	%r10, %rax
ffff80000010f9d4: 48 f7 d8             	negq	%rax
ffff80000010f9d7: 45 84 c0             	testb	%r8b, %r8b
ffff80000010f9da: 49 0f 45 c2          	cmovneq	%r10, %rax
ffff80000010f9de: 5d                   	popq	%rbp
ffff80000010f9df: c3                   	retq
