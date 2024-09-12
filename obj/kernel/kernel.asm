
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
  100097: 48 b8 c0 cb 10 00 00 80 ff ff	movabsq	$-140737487254592, %rax # imm = 0xFFFF80000010CBC0
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
ffff80000010c004: 48 b8 00 d0 11 00 00 80 ff ff	movabsq	$-140737487187968, %rax # imm = 0xFFFF80000011D000
ffff80000010c00e: 8a 00                	movb	(%rax), %al
ffff80000010c010: a8 01                	testb	$1, %al
ffff80000010c012: 0f 84 16 00 00 00    	je	0xffff80000010c02e <serial_intr+0x2e>
;         cons_intr(serial_proc_data);
ffff80000010c018: 48 bf b0 c0 10 00 00 80 ff ff	movabsq	$-140737487257424, %rdi # imm = 0xFFFF80000010C0B0
ffff80000010c022: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c02c: ff d0                	callq	*%rax
; }
ffff80000010c02e: 5d                   	popq	%rbp
ffff80000010c02f: c3                   	retq

ffff80000010c030 <cons_intr>:
; {
ffff80000010c030: 55                   	pushq	%rbp
ffff80000010c031: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c034: 48 83 ec 10          	subq	$16, %rsp
ffff80000010c038: 48 89 7d f8          	movq	%rdi, -8(%rbp)
;     while ((c = (*proc)()) != -1) {
ffff80000010c03c: ff 55 f8             	callq	*-8(%rbp)
ffff80000010c03f: 89 45 f4             	movl	%eax, -12(%rbp)
ffff80000010c042: 83 f8 ff             	cmpl	$-1, %eax
ffff80000010c045: 0f 84 5a 00 00 00    	je	0xffff80000010c0a5 <cons_intr+0x75>
;         if (c == 0)
ffff80000010c04b: 83 7d f4 00          	cmpl	$0, -12(%rbp)
ffff80000010c04f: 0f 85 05 00 00 00    	jne	0xffff80000010c05a <cons_intr+0x2a>
;             continue;
ffff80000010c055: e9 e2 ff ff ff       	jmp	0xffff80000010c03c <cons_intr+0xc>
;         cons.buf[cons.wpos++] = c;
ffff80000010c05a: 8a 55 f4             	movb	-12(%rbp), %dl
ffff80000010c05d: 48 b8 04 d0 11 00 00 80 ff ff	movabsq	$-140737487187964, %rax # imm = 0xFFFF80000011D004
ffff80000010c067: 8b 88 04 02 00 00    	movl	516(%rax), %ecx
ffff80000010c06d: 89 ce                	movl	%ecx, %esi
ffff80000010c06f: 83 c6 01             	addl	$1, %esi
ffff80000010c072: 89 b0 04 02 00 00    	movl	%esi, 516(%rax)
ffff80000010c078: 88 14 01             	movb	%dl, (%rcx,%rax)
;         if (cons.wpos == CONSBUFSIZE)
ffff80000010c07b: 8b 80 04 02 00 00    	movl	516(%rax), %eax
ffff80000010c081: 3d 00 02 00 00       	cmpl	$512, %eax              # imm = 0x200
ffff80000010c086: 0f 85 14 00 00 00    	jne	0xffff80000010c0a0 <cons_intr+0x70>
ffff80000010c08c: 48 b8 04 d0 11 00 00 80 ff ff	movabsq	$-140737487187964, %rax # imm = 0xFFFF80000011D004
;             cons.wpos = 0;
ffff80000010c096: c7 80 04 02 00 00 00 00 00 00	movl	$0, 516(%rax)
;     while ((c = (*proc)()) != -1) {
ffff80000010c0a0: e9 97 ff ff ff       	jmp	0xffff80000010c03c <cons_intr+0xc>
; }
ffff80000010c0a5: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c0a9: 5d                   	popq	%rbp
ffff80000010c0aa: c3                   	retq
ffff80000010c0ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c0b0 <serial_proc_data>:
; {
ffff80000010c0b0: 55                   	pushq	%rbp
ffff80000010c0b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c0b4: 48 83 ec 10          	subq	$16, %rsp
;     if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
ffff80000010c0b8: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c0c2: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c0c7: ff d0                	callq	*%rax
ffff80000010c0c9: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c0cc: 83 e0 01             	andl	$1, %eax
ffff80000010c0cf: 83 f8 00             	cmpl	$0, %eax
ffff80000010c0d2: 0f 85 0c 00 00 00    	jne	0xffff80000010c0e4 <serial_proc_data+0x34>
;         return -1;
ffff80000010c0d8: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000010c0df: e9 17 00 00 00       	jmp	0xffff80000010c0fb <serial_proc_data+0x4b>
;     return inb(COM1+COM_RX);
ffff80000010c0e4: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c0ee: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c0f3: ff d0                	callq	*%rax
ffff80000010c0f5: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c0f8: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff80000010c0fb: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c0fe: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c102: 5d                   	popq	%rbp
ffff80000010c103: c3                   	retq
ffff80000010c104: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c10e: 66 90                	nop

ffff80000010c110 <kbd_intr>:
; {
ffff80000010c110: 55                   	pushq	%rbp
ffff80000010c111: 48 89 e5             	movq	%rsp, %rbp
;     cons_intr(kbd_proc_data);
ffff80000010c114: 48 bf 30 c1 10 00 00 80 ff ff	movabsq	$-140737487257296, %rdi # imm = 0xFFFF80000010C130
ffff80000010c11e: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c128: ff d0                	callq	*%rax
; }
ffff80000010c12a: 5d                   	popq	%rbp
ffff80000010c12b: c3                   	retq
ffff80000010c12c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c130 <kbd_proc_data>:
; {
ffff80000010c130: 55                   	pushq	%rbp
ffff80000010c131: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c134: 48 83 ec 10          	subq	$16, %rsp
;     if ((inb(KBSTATP) & KBS_DIB) == 0)
ffff80000010c138: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c142: bf 64 00 00 00       	movl	$100, %edi
ffff80000010c147: ff d0                	callq	*%rax
ffff80000010c149: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c14c: 83 e0 01             	andl	$1, %eax
ffff80000010c14f: 83 f8 00             	cmpl	$0, %eax
ffff80000010c152: 0f 85 0c 00 00 00    	jne	0xffff80000010c164 <kbd_proc_data+0x34>
;         return -1;
ffff80000010c158: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000010c15f: e9 09 02 00 00       	jmp	0xffff80000010c36d <kbd_proc_data+0x23d>
;     data = inb(KBDATAP);
ffff80000010c164: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c16e: bf 60 00 00 00       	movl	$96, %edi
ffff80000010c173: ff d0                	callq	*%rax
ffff80000010c175: 88 45 f7             	movb	%al, -9(%rbp)
;     if (data == 0xE0) {
ffff80000010c178: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c17c: 3d e0 00 00 00       	cmpl	$224, %eax
ffff80000010c181: 0f 85 1d 00 00 00    	jne	0xffff80000010c1a4 <kbd_proc_data+0x74>
;         shift |= E0ESC;
ffff80000010c187: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c191: 8a 08                	movb	(%rax), %cl
ffff80000010c193: 80 c9 40             	orb	$64, %cl
ffff80000010c196: 88 08                	movb	%cl, (%rax)
;         return 0;
ffff80000010c198: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010c19f: e9 c9 01 00 00       	jmp	0xffff80000010c36d <kbd_proc_data+0x23d>
;     } else if (data & 0x80) {
ffff80000010c1a4: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c1a8: 25 80 00 00 00       	andl	$128, %eax
ffff80000010c1ad: 83 f8 00             	cmpl	$0, %eax
ffff80000010c1b0: 0f 84 67 00 00 00    	je	0xffff80000010c21d <kbd_proc_data+0xed>
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1b6: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c1c0: 8b 00                	movl	(%rax), %eax
ffff80000010c1c2: 83 e0 40             	andl	$64, %eax
ffff80000010c1c5: 83 f8 00             	cmpl	$0, %eax
ffff80000010c1c8: 0f 84 0c 00 00 00    	je	0xffff80000010c1da <kbd_proc_data+0xaa>
ffff80000010c1ce: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c1d2: 89 45 f0             	movl	%eax, -16(%rbp)
ffff80000010c1d5: e9 0a 00 00 00       	jmp	0xffff80000010c1e4 <kbd_proc_data+0xb4>
ffff80000010c1da: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c1de: 83 e0 7f             	andl	$127, %eax
ffff80000010c1e1: 89 45 f0             	movl	%eax, -16(%rbp)
ffff80000010c1e4: 8b 45 f0             	movl	-16(%rbp), %eax
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1e7: 88 45 f7             	movb	%al, -9(%rbp)
;         shift &= ~(shiftcode[data] | E0ESC);
ffff80000010c1ea: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c1ee: 48 b9 20 c0 11 00 00 80 ff ff	movabsq	$-140737487192032, %rcx # imm = 0xFFFF80000011C020
ffff80000010c1f8: 0f b6 0c 08          	movzbl	(%rax,%rcx), %ecx
ffff80000010c1fc: f7 d1                	notl	%ecx
ffff80000010c1fe: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c208: 8b 10                	movl	(%rax), %edx
ffff80000010c20a: 21 d1                	andl	%edx, %ecx
ffff80000010c20c: 83 e1 bf             	andl	$-65, %ecx
ffff80000010c20f: 89 08                	movl	%ecx, (%rax)
;         return 0;
ffff80000010c211: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010c218: e9 50 01 00 00       	jmp	0xffff80000010c36d <kbd_proc_data+0x23d>
;     } else if (shift & E0ESC) {
ffff80000010c21d: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c227: 8b 00                	movl	(%rax), %eax
ffff80000010c229: 83 e0 40             	andl	$64, %eax
ffff80000010c22c: 83 f8 00             	cmpl	$0, %eax
ffff80000010c22f: 0f 84 19 00 00 00    	je	0xffff80000010c24e <kbd_proc_data+0x11e>
;         data |= 0x80;
ffff80000010c235: 8a 45 f7             	movb	-9(%rbp), %al
ffff80000010c238: 0c 80                	orb	$-128, %al
ffff80000010c23a: 88 45 f7             	movb	%al, -9(%rbp)
;         shift &= ~E0ESC;
ffff80000010c23d: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c247: 8a 08                	movb	(%rax), %cl
ffff80000010c249: 80 e1 bf             	andb	$-65, %cl
ffff80000010c24c: 88 08                	movb	%cl, (%rax)
ffff80000010c24e: e9 00 00 00 00       	jmp	0xffff80000010c253 <kbd_proc_data+0x123>
ffff80000010c253: e9 00 00 00 00       	jmp	0xffff80000010c258 <kbd_proc_data+0x128>
;     shift |= shiftcode[data];
ffff80000010c258: 0f b6 45 f7          	movzbl	-9(%rbp), %eax
ffff80000010c25c: 48 b9 20 c0 11 00 00 80 ff ff	movabsq	$-140737487192032, %rcx # imm = 0xFFFF80000011C020
ffff80000010c266: 0f b6 14 08          	movzbl	(%rax,%rcx), %edx
ffff80000010c26a: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c274: 8b 08                	movl	(%rax), %ecx
ffff80000010c276: 09 d1                	orl	%edx, %ecx
ffff80000010c278: 89 08                	movl	%ecx, (%rax)
;     shift ^= togglecode[data];
ffff80000010c27a: 0f b6 4d f7          	movzbl	-9(%rbp), %ecx
ffff80000010c27e: 48 ba 20 c1 11 00 00 80 ff ff	movabsq	$-140737487191776, %rdx # imm = 0xFFFF80000011C120
ffff80000010c288: 0f b6 14 11          	movzbl	(%rcx,%rdx), %edx
ffff80000010c28c: 8b 08                	movl	(%rax), %ecx
ffff80000010c28e: 31 d1                	xorl	%edx, %ecx
ffff80000010c290: 89 08                	movl	%ecx, (%rax)
;     c = charcode[shift & (CTL | SHIFT)][data];
ffff80000010c292: 8b 08                	movl	(%rax), %ecx
ffff80000010c294: 83 e1 03             	andl	$3, %ecx
ffff80000010c297: 89 ca                	movl	%ecx, %edx
ffff80000010c299: 48 b9 00 c0 11 00 00 80 ff ff	movabsq	$-140737487192064, %rcx # imm = 0xFFFF80000011C000
ffff80000010c2a3: 48 8b 0c d1          	movq	(%rcx,%rdx,8), %rcx
ffff80000010c2a7: 0f b6 55 f7          	movzbl	-9(%rbp), %edx
ffff80000010c2ab: 0f b6 0c 11          	movzbl	(%rcx,%rdx), %ecx
ffff80000010c2af: 89 4d f8             	movl	%ecx, -8(%rbp)
;     if (shift & CAPSLOCK) {
ffff80000010c2b2: 8b 00                	movl	(%rax), %eax
ffff80000010c2b4: 83 e0 08             	andl	$8, %eax
ffff80000010c2b7: 83 f8 00             	cmpl	$0, %eax
ffff80000010c2ba: 0f 84 51 00 00 00    	je	0xffff80000010c311 <kbd_proc_data+0x1e1>
;         if ('a' <= c && c <= 'z')
ffff80000010c2c0: b8 61 00 00 00       	movl	$97, %eax
ffff80000010c2c5: 3b 45 f8             	cmpl	-8(%rbp), %eax
ffff80000010c2c8: 0f 8f 18 00 00 00    	jg	0xffff80000010c2e6 <kbd_proc_data+0x1b6>
ffff80000010c2ce: 83 7d f8 7a          	cmpl	$122, -8(%rbp)
ffff80000010c2d2: 0f 8f 0e 00 00 00    	jg	0xffff80000010c2e6 <kbd_proc_data+0x1b6>
;             c += 'A' - 'a';
ffff80000010c2d8: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c2db: 83 c0 e0             	addl	$-32, %eax
ffff80000010c2de: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010c2e1: e9 26 00 00 00       	jmp	0xffff80000010c30c <kbd_proc_data+0x1dc>
;         else if ('A' <= c && c <= 'Z')
ffff80000010c2e6: b8 41 00 00 00       	movl	$65, %eax
ffff80000010c2eb: 3b 45 f8             	cmpl	-8(%rbp), %eax
ffff80000010c2ee: 0f 8f 13 00 00 00    	jg	0xffff80000010c307 <kbd_proc_data+0x1d7>
ffff80000010c2f4: 83 7d f8 5a          	cmpl	$90, -8(%rbp)
ffff80000010c2f8: 0f 8f 09 00 00 00    	jg	0xffff80000010c307 <kbd_proc_data+0x1d7>
;             c += 'a' - 'A';
ffff80000010c2fe: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c301: 83 c0 20             	addl	$32, %eax
ffff80000010c304: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010c307: e9 00 00 00 00       	jmp	0xffff80000010c30c <kbd_proc_data+0x1dc>
;     }
ffff80000010c30c: e9 00 00 00 00       	jmp	0xffff80000010c311 <kbd_proc_data+0x1e1>
;     if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
ffff80000010c311: 48 b8 0c d2 11 00 00 80 ff ff	movabsq	$-140737487187444, %rax # imm = 0xFFFF80000011D20C
ffff80000010c31b: 8b 00                	movl	(%rax), %eax
ffff80000010c31d: 83 f0 ff             	xorl	$-1, %eax
ffff80000010c320: 83 e0 06             	andl	$6, %eax
ffff80000010c323: 83 f8 00             	cmpl	$0, %eax
ffff80000010c326: 0f 85 3b 00 00 00    	jne	0xffff80000010c367 <kbd_proc_data+0x237>
ffff80000010c32c: 81 7d f8 e9 00 00 00 	cmpl	$233, -8(%rbp)
ffff80000010c333: 0f 85 2e 00 00 00    	jne	0xffff80000010c367 <kbd_proc_data+0x237>
;         cprintf("Rebooting!\n");
ffff80000010c339: 48 bf 4d 8b 11 00 00 80 ff ff	movabsq	$-140737487205555, %rdi # imm = 0xFFFF800000118B4D
ffff80000010c343: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010c34d: 31 c0                	xorl	%eax, %eax
ffff80000010c34f: ff d1                	callq	*%rcx
;         outb(0x92, 0x3); /* courtesy of Chris Frost */
ffff80000010c351: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c35b: bf 92 00 00 00       	movl	$146, %edi
ffff80000010c360: be 03 00 00 00       	movl	$3, %esi
ffff80000010c365: ff d0                	callq	*%rax
;     return c;
ffff80000010c367: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c36a: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff80000010c36d: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c370: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c374: 5d                   	popq	%rbp
ffff80000010c375: c3                   	retq
ffff80000010c376: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c380 <cons_getc>:
; {
ffff80000010c380: 55                   	pushq	%rbp
ffff80000010c381: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c384: 48 83 ec 10          	subq	$16, %rsp
;     serial_intr();
ffff80000010c388: 48 b8 00 c0 10 00 00 80 ff ff	movabsq	$-140737487257600, %rax # imm = 0xFFFF80000010C000
ffff80000010c392: ff d0                	callq	*%rax
;     kbd_intr();
ffff80000010c394: 48 b8 10 c1 10 00 00 80 ff ff	movabsq	$-140737487257328, %rax # imm = 0xFFFF80000010C110
ffff80000010c39e: ff d0                	callq	*%rax
ffff80000010c3a0: 48 b9 04 d0 11 00 00 80 ff ff	movabsq	$-140737487187964, %rcx # imm = 0xFFFF80000011D004
;     if (cons.rpos != cons.wpos) {
ffff80000010c3aa: 8b 81 00 02 00 00    	movl	512(%rcx), %eax
ffff80000010c3b0: 8b 89 04 02 00 00    	movl	516(%rcx), %ecx
ffff80000010c3b6: 39 c8                	cmpl	%ecx, %eax
ffff80000010c3b8: 0f 84 52 00 00 00    	je	0xffff80000010c410 <cons_getc+0x90>
ffff80000010c3be: 48 b8 04 d0 11 00 00 80 ff ff	movabsq	$-140737487187964, %rax # imm = 0xFFFF80000011D004
;         c = cons.buf[cons.rpos++];
ffff80000010c3c8: 8b 88 00 02 00 00    	movl	512(%rax), %ecx
ffff80000010c3ce: 89 ca                	movl	%ecx, %edx
ffff80000010c3d0: 83 c2 01             	addl	$1, %edx
ffff80000010c3d3: 89 90 00 02 00 00    	movl	%edx, 512(%rax)
ffff80000010c3d9: 0f b6 0c 01          	movzbl	(%rcx,%rax), %ecx
ffff80000010c3dd: 89 4d f8             	movl	%ecx, -8(%rbp)
;         if (cons.rpos == CONSBUFSIZE)
ffff80000010c3e0: 8b 80 00 02 00 00    	movl	512(%rax), %eax
ffff80000010c3e6: 3d 00 02 00 00       	cmpl	$512, %eax              # imm = 0x200
ffff80000010c3eb: 0f 85 14 00 00 00    	jne	0xffff80000010c405 <cons_getc+0x85>
ffff80000010c3f1: 48 b8 04 d0 11 00 00 80 ff ff	movabsq	$-140737487187964, %rax # imm = 0xFFFF80000011D004
;             cons.rpos = 0;
ffff80000010c3fb: c7 80 00 02 00 00 00 00 00 00	movl	$0, 512(%rax)
;         return c;
ffff80000010c405: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c408: 89 45 fc             	movl	%eax, -4(%rbp)
ffff80000010c40b: e9 07 00 00 00       	jmp	0xffff80000010c417 <cons_getc+0x97>
;     return 0;
ffff80000010c410: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000010c417: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c41a: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c41e: 5d                   	popq	%rbp
ffff80000010c41f: c3                   	retq

ffff80000010c420 <cons_init>:
; {
ffff80000010c420: 55                   	pushq	%rbp
ffff80000010c421: 48 89 e5             	movq	%rsp, %rbp
;     cga_init();
ffff80000010c424: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010c42e: ff d0                	callq	*%rax
;     kbd_init();
ffff80000010c430: 48 b8 b0 c5 10 00 00 80 ff ff	movabsq	$-140737487256144, %rax # imm = 0xFFFF80000010C5B0
ffff80000010c43a: ff d0                	callq	*%rax
;     serial_init();
ffff80000010c43c: 48 b8 e0 c5 10 00 00 80 ff ff	movabsq	$-140737487256096, %rax # imm = 0xFFFF80000010C5E0
ffff80000010c446: ff d0                	callq	*%rax
;     if (!serial_exists)
ffff80000010c448: 48 b8 00 d0 11 00 00 80 ff ff	movabsq	$-140737487187968, %rax # imm = 0xFFFF80000011D000
ffff80000010c452: 8a 00                	movb	(%rax), %al
ffff80000010c454: a8 01                	testb	$1, %al
ffff80000010c456: 0f 85 18 00 00 00    	jne	0xffff80000010c474 <cons_init+0x54>
;         cprintf("Serial port does not exist!\n");
ffff80000010c45c: 48 bf 9c 92 11 00 00 80 ff ff	movabsq	$-140737487203684, %rdi # imm = 0xFFFF80000011929C
ffff80000010c466: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010c470: 31 c0                	xorl	%eax, %eax
ffff80000010c472: ff d1                	callq	*%rcx
; }
ffff80000010c474: 5d                   	popq	%rbp
ffff80000010c475: c3                   	retq
ffff80000010c476: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c480 <cga_init>:
; {
ffff80000010c480: 55                   	pushq	%rbp
ffff80000010c481: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c484: 48 83 ec 30          	subq	$48, %rsp
;     cp = (uint16_t*)(KERNEL_VMA + CGA_BUF);
ffff80000010c488: 48 b8 00 80 0b 00 00 80 ff ff	movabsq	$-140737487601664, %rax # imm = 0xFFFF8000000B8000
ffff80000010c492: 48 89 45 f8          	movq	%rax, -8(%rbp)
;     was = *cp;
ffff80000010c496: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c49a: 66 8b 00             	movw	(%rax), %ax
ffff80000010c49d: 66 89 45 f6          	movw	%ax, -10(%rbp)
;     *cp = (uint16_t) 0xA55A;
ffff80000010c4a1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c4a5: 66 c7 00 5a a5       	movw	$42330, (%rax)          # imm = 0xA55A
;     if (*cp != 0xA55A) {
ffff80000010c4aa: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c4ae: 66 8b 00             	movw	(%rax), %ax
ffff80000010c4b1: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010c4b4: 3d 5a a5 00 00       	cmpl	$42330, %eax            # imm = 0xA55A
ffff80000010c4b9: 0f 84 23 00 00 00    	je	0xffff80000010c4e2 <cga_init+0x62>
ffff80000010c4bf: 48 b8 00 00 0b 00 00 80 ff ff	movabsq	$-140737487634432, %rax # imm = 0xFFFF8000000B0000
;         cp = (uint16_t*) (KERNEL_VMA + MONO_BUF);
ffff80000010c4c9: 48 89 45 f8          	movq	%rax, -8(%rbp)
;         addr_6845 = MONO_BASE;
ffff80000010c4cd: 48 b8 10 d2 11 00 00 80 ff ff	movabsq	$-140737487187440, %rax # imm = 0xFFFF80000011D210
ffff80000010c4d7: c7 00 b4 03 00 00    	movl	$948, (%rax)            # imm = 0x3B4
;     } else {
ffff80000010c4dd: e9 1b 00 00 00       	jmp	0xffff80000010c4fd <cga_init+0x7d>
;         *cp = was;
ffff80000010c4e2: 66 8b 4d f6          	movw	-10(%rbp), %cx
ffff80000010c4e6: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c4ea: 66 89 08             	movw	%cx, (%rax)
;         addr_6845 = CGA_BASE;
ffff80000010c4ed: 48 b8 10 d2 11 00 00 80 ff ff	movabsq	$-140737487187440, %rax # imm = 0xFFFF80000011D210
ffff80000010c4f7: c7 00 d4 03 00 00    	movl	$980, (%rax)            # imm = 0x3D4
;     outb(addr_6845, 14);
ffff80000010c4fd: 48 b8 10 d2 11 00 00 80 ff ff	movabsq	$-140737487187440, %rax # imm = 0xFFFF80000011D210
ffff80000010c507: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c50b: 0f b7 38             	movzwl	(%rax), %edi
ffff80000010c50e: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c518: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c51c: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c521: ff d0                	callq	*%rax
ffff80000010c523: 48 8b 45 e0          	movq	-32(%rbp), %rax
;     pos = inb(addr_6845 + 1) << 8;
ffff80000010c527: 8b 00                	movl	(%rax), %eax
ffff80000010c529: 83 c0 01             	addl	$1, %eax
ffff80000010c52c: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c52f: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c539: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010c53d: ff d0                	callq	*%rax
ffff80000010c53f: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010c543: 88 c2                	movb	%al, %dl
ffff80000010c545: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010c549: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010c54c: c1 e2 08             	shll	$8, %edx
ffff80000010c54f: 89 55 f0             	movl	%edx, -16(%rbp)
;     outb(addr_6845, 15);
ffff80000010c552: 0f b7 39             	movzwl	(%rcx), %edi
ffff80000010c555: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c55a: ff d0                	callq	*%rax
ffff80000010c55c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010c560: 48 8b 45 e8          	movq	-24(%rbp), %rax
;     pos |= inb(addr_6845 + 1);
ffff80000010c564: 8b 09                	movl	(%rcx), %ecx
ffff80000010c566: 83 c1 01             	addl	$1, %ecx
ffff80000010c569: 0f b7 f9             	movzwl	%cx, %edi
ffff80000010c56c: ff d0                	callq	*%rax
ffff80000010c56e: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010c571: 8b 45 f0             	movl	-16(%rbp), %eax
ffff80000010c574: 09 c8                	orl	%ecx, %eax
ffff80000010c576: 89 45 f0             	movl	%eax, -16(%rbp)
;     crt_buf = (uint16_t*) cp;
ffff80000010c579: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010c57d: 48 b8 18 d2 11 00 00 80 ff ff	movabsq	$-140737487187432, %rax # imm = 0xFFFF80000011D218
ffff80000010c587: 48 89 08             	movq	%rcx, (%rax)
;     crt_pos = pos;
ffff80000010c58a: 66 8b 4d f0          	movw	-16(%rbp), %cx
ffff80000010c58e: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010c598: 66 89 08             	movw	%cx, (%rax)
; }
ffff80000010c59b: 48 83 c4 30          	addq	$48, %rsp
ffff80000010c59f: 5d                   	popq	%rbp
ffff80000010c5a0: c3                   	retq
ffff80000010c5a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c5ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c5b0 <kbd_init>:
; {
ffff80000010c5b0: 55                   	pushq	%rbp
ffff80000010c5b1: 48 89 e5             	movq	%rsp, %rbp
;     kbd_intr();
ffff80000010c5b4: 48 b8 10 c1 10 00 00 80 ff ff	movabsq	$-140737487257328, %rax # imm = 0xFFFF80000010C110
ffff80000010c5be: ff d0                	callq	*%rax
;     pic_enable_irq(1);
ffff80000010c5c0: 48 b8 60 da 10 00 00 80 ff ff	movabsq	$-140737487250848, %rax # imm = 0xFFFF80000010DA60
ffff80000010c5ca: bf 01 00 00 00       	movl	$1, %edi
ffff80000010c5cf: ff d0                	callq	*%rax
; }
ffff80000010c5d1: 5d                   	popq	%rbp
ffff80000010c5d2: c3                   	retq
ffff80000010c5d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c5dd: 0f 1f 00             	nopl	(%rax)

ffff80000010c5e0 <serial_init>:
; {
ffff80000010c5e0: 55                   	pushq	%rbp
ffff80000010c5e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c5e4: 48 83 ec 20          	subq	$32, %rsp
;     outb(COM1+COM_FCR, 0);
ffff80000010c5e8: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c5f2: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000010c5f6: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c5fb: 31 f6                	xorl	%esi, %esi
ffff80000010c5fd: 89 75 f0             	movl	%esi, -16(%rbp)
ffff80000010c600: ff d0                	callq	*%rax
ffff80000010c602: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c606: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c60b: 89 7d ec             	movl	%edi, -20(%rbp)
ffff80000010c60e: be 80 00 00 00       	movl	$128, %esi
;     outb(COM1+COM_LCR, COM_LCR_DLAB);
ffff80000010c613: ff d0                	callq	*%rax
ffff80000010c615: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c619: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c61e: be 0c 00 00 00       	movl	$12, %esi
;     outb(COM1+COM_DLL, (uint8_t) (115200 / 9600));
ffff80000010c623: ff d0                	callq	*%rax
ffff80000010c625: 8b 75 f0             	movl	-16(%rbp), %esi
ffff80000010c628: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c62c: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c631: 89 7d f4             	movl	%edi, -12(%rbp)
;     outb(COM1+COM_DLM, 0);
ffff80000010c634: ff d0                	callq	*%rax
ffff80000010c636: 8b 7d ec             	movl	-20(%rbp), %edi
ffff80000010c639: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c63d: be 03 00 00 00       	movl	$3, %esi
;     outb(COM1+COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
ffff80000010c642: ff d0                	callq	*%rax
ffff80000010c644: 8b 75 f0             	movl	-16(%rbp), %esi
ffff80000010c647: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c64b: bf fc 03 00 00       	movl	$1020, %edi             # imm = 0x3FC
;     outb(COM1+COM_MCR, 0);
ffff80000010c650: ff d0                	callq	*%rax
ffff80000010c652: 8b 7d f4             	movl	-12(%rbp), %edi
ffff80000010c655: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010c659: be 01 00 00 00       	movl	$1, %esi
;     outb(COM1+COM_IER, COM_IER_RDI);
ffff80000010c65e: ff d0                	callq	*%rax
;     serial_exists = (inb(COM1+COM_LSR) != 0xFF);
ffff80000010c660: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c66a: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c66f: ff d0                	callq	*%rax
ffff80000010c671: 2c ff                	subb	$-1, %al
ffff80000010c673: 48 b8 00 d0 11 00 00 80 ff ff	movabsq	$-140737487187968, %rax # imm = 0xFFFF80000011D000
ffff80000010c67d: 0f 95 00             	setne	(%rax)
;     (void) inb(COM1+COM_IIR);
ffff80000010c680: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c68a: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c68f: ff d0                	callq	*%rax
;     (void) inb(COM1+COM_RX);
ffff80000010c691: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c69b: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c6a0: ff d0                	callq	*%rax
; }
ffff80000010c6a2: 48 83 c4 20          	addq	$32, %rsp
ffff80000010c6a6: 5d                   	popq	%rbp
ffff80000010c6a7: c3                   	retq
ffff80000010c6a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010c6b0 <cputchar>:
; {
ffff80000010c6b0: 55                   	pushq	%rbp
ffff80000010c6b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c6b4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010c6b8: 89 7d fc             	movl	%edi, -4(%rbp)
;     cons_putc(c);
ffff80000010c6bb: 8b 7d fc             	movl	-4(%rbp), %edi
ffff80000010c6be: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010c6c8: ff d0                	callq	*%rax
; }
ffff80000010c6ca: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c6ce: 5d                   	popq	%rbp
ffff80000010c6cf: c3                   	retq

ffff80000010c6d0 <cons_putc>:
; {
ffff80000010c6d0: 55                   	pushq	%rbp
ffff80000010c6d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c6d4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010c6d8: 89 7d fc             	movl	%edi, -4(%rbp)
;     serial_putc(c);
ffff80000010c6db: 8b 7d fc             	movl	-4(%rbp), %edi
ffff80000010c6de: 48 b8 90 c7 10 00 00 80 ff ff	movabsq	$-140737487255664, %rax # imm = 0xFFFF80000010C790
ffff80000010c6e8: ff d0                	callq	*%rax
;     lpt_putc(c);
ffff80000010c6ea: 8b 7d fc             	movl	-4(%rbp), %edi
ffff80000010c6ed: 48 b8 20 c8 10 00 00 80 ff ff	movabsq	$-140737487255520, %rax # imm = 0xFFFF80000010C820
ffff80000010c6f7: ff d0                	callq	*%rax
;     cga_putc(c);
ffff80000010c6f9: 8b 7d fc             	movl	-4(%rbp), %edi
ffff80000010c6fc: 48 b8 e0 c8 10 00 00 80 ff ff	movabsq	$-140737487255328, %rax # imm = 0xFFFF80000010C8E0
ffff80000010c706: ff d0                	callq	*%rax
; }
ffff80000010c708: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c70c: 5d                   	popq	%rbp
ffff80000010c70d: c3                   	retq
ffff80000010c70e: 66 90                	nop

ffff80000010c710 <getchar>:
; {
ffff80000010c710: 55                   	pushq	%rbp
ffff80000010c711: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c714: 48 83 ec 10          	subq	$16, %rsp
;     while ((c = cons_getc()) == 0)
ffff80000010c718: 48 b8 80 c3 10 00 00 80 ff ff	movabsq	$-140737487256704, %rax # imm = 0xFFFF80000010C380
ffff80000010c722: ff d0                	callq	*%rax
ffff80000010c724: 89 45 fc             	movl	%eax, -4(%rbp)
ffff80000010c727: 83 f8 00             	cmpl	$0, %eax
ffff80000010c72a: 0f 85 05 00 00 00    	jne	0xffff80000010c735 <getchar+0x25>
ffff80000010c730: e9 e3 ff ff ff       	jmp	0xffff80000010c718 <getchar+0x8>
;     return c;
ffff80000010c735: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c738: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c73c: 5d                   	popq	%rbp
ffff80000010c73d: c3                   	retq
ffff80000010c73e: 66 90                	nop

ffff80000010c740 <iscons>:
; {
ffff80000010c740: 55                   	pushq	%rbp
ffff80000010c741: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c744: 89 7d fc             	movl	%edi, -4(%rbp)
;     return 1;
ffff80000010c747: b8 01 00 00 00       	movl	$1, %eax
ffff80000010c74c: 5d                   	popq	%rbp
ffff80000010c74d: c3                   	retq
ffff80000010c74e: 66 90                	nop

ffff80000010c750 <inb>:
; {
ffff80000010c750: 55                   	pushq	%rbp
ffff80000010c751: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c754: 66 89 f8             	movw	%di, %ax
ffff80000010c757: 66 89 45 fe          	movw	%ax, -2(%rbp)
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010c75b: 66 8b 55 fe          	movw	-2(%rbp), %dx
ffff80000010c75f: ec                   	inb	%dx, %al
ffff80000010c760: 88 45 fd             	movb	%al, -3(%rbp)
; 	return data;
ffff80000010c763: 0f b6 45 fd          	movzbl	-3(%rbp), %eax
ffff80000010c767: 5d                   	popq	%rbp
ffff80000010c768: c3                   	retq
ffff80000010c769: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010c770 <outb>:
; {
ffff80000010c770: 55                   	pushq	%rbp
ffff80000010c771: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c774: 40 88 f0             	movb	%sil, %al
ffff80000010c777: 66 89 f9             	movw	%di, %cx
ffff80000010c77a: 66 89 4d fe          	movw	%cx, -2(%rbp)
ffff80000010c77e: 88 45 fd             	movb	%al, -3(%rbp)
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010c781: 8a 45 fd             	movb	-3(%rbp), %al
ffff80000010c784: 66 8b 55 fe          	movw	-2(%rbp), %dx
ffff80000010c788: ee                   	outb	%al, %dx
; }
ffff80000010c789: 5d                   	popq	%rbp
ffff80000010c78a: c3                   	retq
ffff80000010c78b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c790 <serial_putc>:
; {
ffff80000010c790: 55                   	pushq	%rbp
ffff80000010c791: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c794: 48 83 ec 10          	subq	$16, %rsp
ffff80000010c798: 89 7d fc             	movl	%edi, -4(%rbp)
;     for (i = 0;
ffff80000010c79b: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
;          !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
ffff80000010c7a2: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c7ac: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c7b1: ff d0                	callq	*%rax
ffff80000010c7b3: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010c7b6: 83 e1 20             	andl	$32, %ecx
ffff80000010c7b9: 31 c0                	xorl	%eax, %eax
ffff80000010c7bb: 83 f9 00             	cmpl	$0, %ecx
ffff80000010c7be: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010c7c1: 0f 85 0d 00 00 00    	jne	0xffff80000010c7d4 <serial_putc+0x44>
ffff80000010c7c7: 81 7d f8 00 32 00 00 	cmpl	$12800, -8(%rbp)        # imm = 0x3200
ffff80000010c7ce: 0f 9c c0             	setl	%al
ffff80000010c7d1: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010c7d4: 8a 45 f7             	movb	-9(%rbp), %al
;     for (i = 0;
ffff80000010c7d7: a8 01                	testb	$1, %al
ffff80000010c7d9: 0f 85 05 00 00 00    	jne	0xffff80000010c7e4 <serial_putc+0x54>
ffff80000010c7df: e9 1a 00 00 00       	jmp	0xffff80000010c7fe <serial_putc+0x6e>
;         delay();
ffff80000010c7e4: 48 b8 70 cb 10 00 00 80 ff ff	movabsq	$-140737487254672, %rax # imm = 0xFFFF80000010CB70
ffff80000010c7ee: ff d0                	callq	*%rax
;          i++)
ffff80000010c7f0: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c7f3: 83 c0 01             	addl	$1, %eax
ffff80000010c7f6: 89 45 f8             	movl	%eax, -8(%rbp)
;     for (i = 0;
ffff80000010c7f9: e9 a4 ff ff ff       	jmp	0xffff80000010c7a2 <serial_putc+0x12>
;     outb(COM1 + COM_TX, c);
ffff80000010c7fe: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c801: 0f b6 f0             	movzbl	%al, %esi
ffff80000010c804: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c80e: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c813: ff d0                	callq	*%rax
; }
ffff80000010c815: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c819: 5d                   	popq	%rbp
ffff80000010c81a: c3                   	retq
ffff80000010c81b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c820 <lpt_putc>:
; {
ffff80000010c820: 55                   	pushq	%rbp
ffff80000010c821: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c824: 48 83 ec 10          	subq	$16, %rsp
ffff80000010c828: 89 7d fc             	movl	%edi, -4(%rbp)
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c82b: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010c832: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010c83c: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c841: ff d0                	callq	*%rax
ffff80000010c843: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010c846: 81 e1 80 00 00 00    	andl	$128, %ecx
ffff80000010c84c: 31 c0                	xorl	%eax, %eax
ffff80000010c84e: 83 f9 00             	cmpl	$0, %ecx
ffff80000010c851: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010c854: 0f 85 0d 00 00 00    	jne	0xffff80000010c867 <lpt_putc+0x47>
ffff80000010c85a: 81 7d f8 00 32 00 00 	cmpl	$12800, -8(%rbp)        # imm = 0x3200
ffff80000010c861: 0f 9c c0             	setl	%al
ffff80000010c864: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010c867: 8a 45 f7             	movb	-9(%rbp), %al
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c86a: a8 01                	testb	$1, %al
ffff80000010c86c: 0f 85 05 00 00 00    	jne	0xffff80000010c877 <lpt_putc+0x57>
ffff80000010c872: e9 1a 00 00 00       	jmp	0xffff80000010c891 <lpt_putc+0x71>
;         delay();
ffff80000010c877: 48 b8 70 cb 10 00 00 80 ff ff	movabsq	$-140737487254672, %rax # imm = 0xFFFF80000010CB70
ffff80000010c881: ff d0                	callq	*%rax
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c883: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010c886: 83 c0 01             	addl	$1, %eax
ffff80000010c889: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010c88c: e9 a1 ff ff ff       	jmp	0xffff80000010c832 <lpt_putc+0x12>
;     outb(0x378+0, c);
ffff80000010c891: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c894: 0f b6 f0             	movzbl	%al, %esi
ffff80000010c897: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c8a1: bf 78 03 00 00       	movl	$888, %edi              # imm = 0x378
ffff80000010c8a6: ff d0                	callq	*%rax
;     outb(0x378+2, 0x08|0x04|0x01);
ffff80000010c8a8: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c8b2: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c8b7: be 0d 00 00 00       	movl	$13, %esi
ffff80000010c8bc: ff d0                	callq	*%rax
;     outb(0x378+2, 0x08);
ffff80000010c8be: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010c8c8: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c8cd: be 08 00 00 00       	movl	$8, %esi
ffff80000010c8d2: ff d0                	callq	*%rax
; }
ffff80000010c8d4: 48 83 c4 10          	addq	$16, %rsp
ffff80000010c8d8: 5d                   	popq	%rbp
ffff80000010c8d9: c3                   	retq
ffff80000010c8da: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c8e0 <cga_putc>:
; {
ffff80000010c8e0: 55                   	pushq	%rbp
ffff80000010c8e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c8e4: 48 83 ec 30          	subq	$48, %rsp
ffff80000010c8e8: 89 7d fc             	movl	%edi, -4(%rbp)
;     if (!(c & ~0xFF))
ffff80000010c8eb: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c8ee: 25 00 ff ff ff       	andl	$4294967040, %eax       # imm = 0xFFFFFF00
ffff80000010c8f3: 83 f8 00             	cmpl	$0, %eax
ffff80000010c8f6: 0f 85 0b 00 00 00    	jne	0xffff80000010c907 <cga_putc+0x27>
;         c |= 0x0700;
ffff80000010c8fc: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010c8ff: 0d 00 07 00 00       	orl	$1792, %eax             # imm = 0x700
ffff80000010c904: 89 45 fc             	movl	%eax, -4(%rbp)
;     switch (c & 0xff) {
ffff80000010c907: 0f b6 45 fc          	movzbl	-4(%rbp), %eax
ffff80000010c90b: 83 c0 f8             	addl	$-8, %eax
ffff80000010c90e: 89 c1                	movl	%eax, %ecx
ffff80000010c910: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff80000010c914: 83 e8 05             	subl	$5, %eax
ffff80000010c917: 0f 87 04 01 00 00    	ja	0xffff80000010ca21 <cga_putc+0x141>
ffff80000010c91d: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010c921: 48 b8 00 80 11 00 00 80 ff ff	movabsq	$-140737487208448, %rax # imm = 0xFFFF800000118000
ffff80000010c92b: 48 8b 04 c8          	movq	(%rax,%rcx,8), %rax
ffff80000010c92f: ff e0                	jmpq	*%rax
;         if (crt_pos > 0) {
ffff80000010c931: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010c93b: 66 8b 00             	movw	(%rax), %ax
ffff80000010c93e: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010c941: 83 f8 00             	cmpl	$0, %eax
ffff80000010c944: 0f 8e 38 00 00 00    	jle	0xffff80000010c982 <cga_putc+0xa2>
;             crt_pos--;
ffff80000010c94a: 48 b9 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rcx # imm = 0xFFFF80000011D220
ffff80000010c954: 66 8b 01             	movw	(%rcx), %ax
ffff80000010c957: 66 83 c0 ff          	addw	$-1, %ax
ffff80000010c95b: 66 89 01             	movw	%ax, (%rcx)
;             crt_buf[crt_pos] = (c & ~0xff) | ' ';
ffff80000010c95e: 0f b6 45 fd          	movzbl	-3(%rbp), %eax
ffff80000010c962: c1 e0 08             	shll	$8, %eax
ffff80000010c965: 83 c8 20             	orl	$32, %eax
ffff80000010c968: 66 89 c2             	movw	%ax, %dx
ffff80000010c96b: 48 b8 18 d2 11 00 00 80 ff ff	movabsq	$-140737487187432, %rax # imm = 0xFFFF80000011D218
ffff80000010c975: 48 8b 00             	movq	(%rax), %rax
ffff80000010c978: 66 8b 09             	movw	(%rcx), %cx
ffff80000010c97b: 0f b7 c9             	movzwl	%cx, %ecx
ffff80000010c97e: 66 89 14 48          	movw	%dx, (%rax,%rcx,2)
;         break;
ffff80000010c982: e9 c8 00 00 00       	jmp	0xffff80000010ca4f <cga_putc+0x16f>
;         crt_pos += CRT_COLS;
ffff80000010c987: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010c991: 66 8b 08             	movw	(%rax), %cx
ffff80000010c994: 66 83 c1 50          	addw	$80, %cx
ffff80000010c998: 66 89 08             	movw	%cx, (%rax)
;         crt_pos -= (crt_pos % CRT_COLS);
ffff80000010c99b: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010c9a5: 0f b7 08             	movzwl	(%rax), %ecx
ffff80000010c9a8: ba cd cc cc cc       	movl	$3435973837, %edx       # imm = 0xCCCCCCCD
ffff80000010c9ad: 48 0f af ca          	imulq	%rdx, %rcx
ffff80000010c9b1: 48 c1 e9 26          	shrq	$38, %rcx
ffff80000010c9b5: 89 ca                	movl	%ecx, %edx
ffff80000010c9b7: c1 e2 04             	shll	$4, %edx
ffff80000010c9ba: 89 d1                	movl	%edx, %ecx
ffff80000010c9bc: 8d 0c 89             	leal	(%rcx,%rcx,4), %ecx
ffff80000010c9bf: 66 89 08             	movw	%cx, (%rax)
;         break;
ffff80000010c9c2: e9 88 00 00 00       	jmp	0xffff80000010ca4f <cga_putc+0x16f>
;         cons_putc(' ');
ffff80000010c9c7: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010c9d1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c9d6: ff d0                	callq	*%rax
;         cons_putc(' ');
ffff80000010c9d8: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010c9e2: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c9e7: ff d0                	callq	*%rax
;         cons_putc(' ');
ffff80000010c9e9: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010c9f3: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c9f8: ff d0                	callq	*%rax
;         cons_putc(' ');
ffff80000010c9fa: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010ca04: bf 20 00 00 00       	movl	$32, %edi
ffff80000010ca09: ff d0                	callq	*%rax
;         cons_putc(' ');
ffff80000010ca0b: 48 b8 d0 c6 10 00 00 80 ff ff	movabsq	$-140737487255856, %rax # imm = 0xFFFF80000010C6D0
ffff80000010ca15: bf 20 00 00 00       	movl	$32, %edi
ffff80000010ca1a: ff d0                	callq	*%rax
;         break;
ffff80000010ca1c: e9 2e 00 00 00       	jmp	0xffff80000010ca4f <cga_putc+0x16f>
;         crt_buf[crt_pos++] = c;     /* write the character */
ffff80000010ca21: 66 8b 55 fc          	movw	-4(%rbp), %dx
ffff80000010ca25: 48 b8 18 d2 11 00 00 80 ff ff	movabsq	$-140737487187432, %rax # imm = 0xFFFF80000011D218
ffff80000010ca2f: 48 8b 00             	movq	(%rax), %rax
ffff80000010ca32: 48 be 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rsi # imm = 0xFFFF80000011D220
ffff80000010ca3c: 0f b7 3e             	movzwl	(%rsi), %edi
ffff80000010ca3f: 66 89 f9             	movw	%di, %cx
ffff80000010ca42: 83 c7 01             	addl	$1, %edi
ffff80000010ca45: 66 89 3e             	movw	%di, (%rsi)
ffff80000010ca48: 0f b7 c9             	movzwl	%cx, %ecx
ffff80000010ca4b: 66 89 14 48          	movw	%dx, (%rax,%rcx,2)
;     if (crt_pos >= CRT_SIZE) {
ffff80000010ca4f: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010ca59: 66 8b 00             	movw	(%rax), %ax
ffff80000010ca5c: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010ca5f: 3d d0 07 00 00       	cmpl	$2000, %eax             # imm = 0x7D0
ffff80000010ca64: 0f 8c 75 00 00 00    	jl	0xffff80000010cadf <cga_putc+0x1ff>
;         memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
ffff80000010ca6a: 48 b8 18 d2 11 00 00 80 ff ff	movabsq	$-140737487187432, %rax # imm = 0xFFFF80000011D218
ffff80000010ca74: 48 8b 30             	movq	(%rax), %rsi
ffff80000010ca77: 48 89 f7             	movq	%rsi, %rdi
ffff80000010ca7a: 48 81 c6 a0 00 00 00 	addq	$160, %rsi
ffff80000010ca81: 48 b8 b0 28 11 00 00 80 ff ff	movabsq	$-140737487230800, %rax # imm = 0xFFFF8000001128B0
ffff80000010ca8b: ba 00 0f 00 00       	movl	$3840, %edx             # imm = 0xF00
ffff80000010ca90: ff d0                	callq	*%rax
;         for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
ffff80000010ca92: c7 45 f8 80 07 00 00 	movl	$1920, -8(%rbp)         # imm = 0x780
ffff80000010ca99: 81 7d f8 d0 07 00 00 	cmpl	$2000, -8(%rbp)         # imm = 0x7D0
ffff80000010caa0: 0f 8d 25 00 00 00    	jge	0xffff80000010cacb <cga_putc+0x1eb>
;             crt_buf[i] = 0x0700 | ' ';
ffff80000010caa6: 48 b8 18 d2 11 00 00 80 ff ff	movabsq	$-140737487187432, %rax # imm = 0xFFFF80000011D218
ffff80000010cab0: 48 8b 00             	movq	(%rax), %rax
ffff80000010cab3: 48 63 4d f8          	movslq	-8(%rbp), %rcx
ffff80000010cab7: 66 c7 04 48 20 07    	movw	$1824, (%rax,%rcx,2)    # imm = 0x720
;         for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
ffff80000010cabd: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010cac0: 83 c0 01             	addl	$1, %eax
ffff80000010cac3: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010cac6: e9 ce ff ff ff       	jmp	0xffff80000010ca99 <cga_putc+0x1b9>
;         crt_pos -= CRT_COLS;
ffff80000010cacb: 48 b8 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rax # imm = 0xFFFF80000011D220
ffff80000010cad5: 66 8b 08             	movw	(%rax), %cx
ffff80000010cad8: 66 83 c1 b0          	addw	$-80, %cx
ffff80000010cadc: 66 89 08             	movw	%cx, (%rax)
;     outb(addr_6845, 14);
ffff80000010cadf: 48 b8 10 d2 11 00 00 80 ff ff	movabsq	$-140737487187440, %rax # imm = 0xFFFF80000011D210
ffff80000010cae9: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010caed: 0f b7 38             	movzwl	(%rax), %edi
ffff80000010caf0: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010cafa: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010cafe: be 0e 00 00 00       	movl	$14, %esi
ffff80000010cb03: ff d0                	callq	*%rax
ffff80000010cb05: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010cb09: 48 8b 4d e0          	movq	-32(%rbp), %rcx
;     outb(addr_6845 + 1, crt_pos >> 8);
ffff80000010cb0d: 8b 09                	movl	(%rcx), %ecx
ffff80000010cb0f: 83 c1 01             	addl	$1, %ecx
ffff80000010cb12: 48 ba 20 d2 11 00 00 80 ff ff	movabsq	$-140737487187424, %rdx # imm = 0xFFFF80000011D220
ffff80000010cb1c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff80000010cb20: 0f b6 72 01          	movzbl	1(%rdx), %esi
ffff80000010cb24: 0f b7 f9             	movzwl	%cx, %edi
ffff80000010cb27: ff d0                	callq	*%rax
ffff80000010cb29: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010cb2d: 48 8b 4d e0          	movq	-32(%rbp), %rcx
;     outb(addr_6845, 15);
ffff80000010cb31: 0f b7 39             	movzwl	(%rcx), %edi
ffff80000010cb34: be 0f 00 00 00       	movl	$15, %esi
ffff80000010cb39: ff d0                	callq	*%rax
ffff80000010cb3b: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010cb3f: 48 8b 45 e8          	movq	-24(%rbp), %rax
;     outb(addr_6845 + 1, crt_pos);
ffff80000010cb43: 8b 09                	movl	(%rcx), %ecx
ffff80000010cb45: 83 c1 01             	addl	$1, %ecx
ffff80000010cb48: 66 8b 00             	movw	(%rax), %ax
ffff80000010cb4b: 0f b7 f9             	movzwl	%cx, %edi
ffff80000010cb4e: 0f b6 f0             	movzbl	%al, %esi
ffff80000010cb51: 48 b8 70 c7 10 00 00 80 ff ff	movabsq	$-140737487255696, %rax # imm = 0xFFFF80000010C770
ffff80000010cb5b: ff d0                	callq	*%rax
; }
ffff80000010cb5d: 48 83 c4 30          	addq	$48, %rsp
ffff80000010cb61: 5d                   	popq	%rbp
ffff80000010cb62: c3                   	retq
ffff80000010cb63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cb6d: 0f 1f 00             	nopl	(%rax)

ffff80000010cb70 <delay>:
; {
ffff80000010cb70: 55                   	pushq	%rbp
ffff80000010cb71: 48 89 e5             	movq	%rsp, %rbp
;     inb(0x84);
ffff80000010cb74: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010cb7e: bf 84 00 00 00       	movl	$132, %edi
ffff80000010cb83: ff d0                	callq	*%rax
;     inb(0x84);
ffff80000010cb85: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010cb8f: bf 84 00 00 00       	movl	$132, %edi
ffff80000010cb94: ff d0                	callq	*%rax
;     inb(0x84);
ffff80000010cb96: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010cba0: bf 84 00 00 00       	movl	$132, %edi
ffff80000010cba5: ff d0                	callq	*%rax
;     inb(0x84);
ffff80000010cba7: 48 b8 50 c7 10 00 00 80 ff ff	movabsq	$-140737487255728, %rax # imm = 0xFFFF80000010C750
ffff80000010cbb1: bf 84 00 00 00       	movl	$132, %edi
ffff80000010cbb6: ff d0                	callq	*%rax
; }
ffff80000010cbb8: 5d                   	popq	%rbp
ffff80000010cbb9: c3                   	retq
ffff80000010cbba: cc                   	int3
ffff80000010cbbb: cc                   	int3
ffff80000010cbbc: cc                   	int3
ffff80000010cbbd: cc                   	int3
ffff80000010cbbe: cc                   	int3
ffff80000010cbbf: cc                   	int3

ffff80000010cbc0 <kmain>:
; {
ffff80000010cbc0: 55                   	pushq	%rbp
ffff80000010cbc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cbc4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010cbc8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	memset(edata, 0, end - edata);
ffff80000010cbcc: 48 bf b0 c5 11 00 00 80 ff ff	movabsq	$-140737487190608, %rdi # imm = 0xFFFF80000011C5B0
ffff80000010cbd6: 48 ba 00 d7 11 00 00 80 ff ff	movabsq	$-140737487186176, %rdx # imm = 0xFFFF80000011D700
ffff80000010cbe0: 48 29 fa             	subq	%rdi, %rdx
ffff80000010cbe3: 48 b8 00 28 11 00 00 80 ff ff	movabsq	$-140737487230976, %rax # imm = 0xFFFF800000112800
ffff80000010cbed: 31 f6                	xorl	%esi, %esi
ffff80000010cbef: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010cbf1: 48 b8 20 c4 10 00 00 80 ff ff	movabsq	$-140737487256544, %rax # imm = 0xFFFF80000010C420
ffff80000010cbfb: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010cbfd: 48 bf d7 91 11 00 00 80 ff ff	movabsq	$-140737487203881, %rdi # imm = 0xFFFF8000001191D7
ffff80000010cc07: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010cc11: 31 c0                	xorl	%eax, %eax
ffff80000010cc13: ff d1                	callq	*%rcx
; 	mem_init(boot_info);
ffff80000010cc15: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010cc19: 48 b8 30 f1 10 00 00 80 ff ff	movabsq	$-140737487245008, %rax # imm = 0xFFFF80000010F130
ffff80000010cc23: ff d0                	callq	*%rax
; 		monitor(NULL);
ffff80000010cc25: 31 c0                	xorl	%eax, %eax
ffff80000010cc27: 48 b8 f0 d4 10 00 00 80 ff ff	movabsq	$-140737487252240, %rax # imm = 0xFFFF80000010D4F0
ffff80000010cc31: 31 c9                	xorl	%ecx, %ecx
ffff80000010cc33: 89 cf                	movl	%ecx, %edi
ffff80000010cc35: ff d0                	callq	*%rax
; 	while (1)
ffff80000010cc37: e9 e9 ff ff ff       	jmp	0xffff80000010cc25 <kmain+0x65>
ffff80000010cc3c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010cc40 <_panic>:
; {
ffff80000010cc40: 55                   	pushq	%rbp
ffff80000010cc41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cc44: 48 83 ec 60          	subq	$96, %rsp
ffff80000010cc48: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010cc4c: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010cc50: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010cc54: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010cc58: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010cc5b: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (panicstr)
ffff80000010cc5f: 48 b8 28 d2 11 00 00 80 ff ff	movabsq	$-140737487187416, %rax # imm = 0xFFFF80000011D228
ffff80000010cc69: 48 8b 00             	movq	(%rax), %rax
ffff80000010cc6c: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010cc70: 0f 84 05 00 00 00    	je	0xffff80000010cc7b <_panic+0x3b>
; 		goto dead;
ffff80000010cc76: e9 83 00 00 00       	jmp	0xffff80000010ccfe <_panic+0xbe>
; 	panicstr = fmt;
ffff80000010cc7b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010cc7f: 48 b8 28 d2 11 00 00 80 ff ff	movabsq	$-140737487187416, %rax # imm = 0xFFFF80000011D228
ffff80000010cc89: 48 89 08             	movq	%rcx, (%rax)
; 	__asm __volatile("cli; cld");
ffff80000010cc8c: fa                   	cli
ffff80000010cc8d: fc                   	cld
; 	va_start(ap, fmt);
ffff80000010cc8e: 48 8d 45 d0          	leaq	-48(%rbp), %rax
ffff80000010cc92: 48 8d 4d a0          	leaq	-96(%rbp), %rcx
ffff80000010cc96: 48 89 48 10          	movq	%rcx, 16(%rax)
ffff80000010cc9a: 48 8d 4d 10          	leaq	16(%rbp), %rcx
ffff80000010cc9e: 48 89 48 08          	movq	%rcx, 8(%rax)
ffff80000010cca2: c7 40 04 30 00 00 00 	movl	$48, 4(%rax)
ffff80000010cca9: c7 00 18 00 00 00    	movl	$24, (%rax)
; 	cprintf("kernel panic at %s:%d: ", file, line);
ffff80000010ccaf: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000010ccb3: 8b 55 f4             	movl	-12(%rbp), %edx
ffff80000010ccb6: 48 bf 20 89 11 00 00 80 ff ff	movabsq	$-140737487206112, %rdi # imm = 0xFFFF800000118920
ffff80000010ccc0: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ccca: 31 c0                	xorl	%eax, %eax
ffff80000010cccc: ff d1                	callq	*%rcx
; 	vcprintf(fmt, ap);
ffff80000010ccce: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010ccd2: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010ccd6: 48 b8 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rax # imm = 0xFFFF80000010DC00
ffff80000010cce0: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010cce2: 48 bf d7 91 11 00 00 80 ff ff	movabsq	$-140737487203881, %rdi # imm = 0xFFFF8000001191D7
ffff80000010ccec: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ccf6: 31 c0                	xorl	%eax, %eax
ffff80000010ccf8: ff d1                	callq	*%rcx
; 	va_end(ap);
ffff80000010ccfa: 48 8d 45 d0          	leaq	-48(%rbp), %rax
; 	while (1)
ffff80000010ccfe: e9 00 00 00 00       	jmp	0xffff80000010cd03 <_panic+0xc3>
; 		monitor(NULL);
ffff80000010cd03: 31 c0                	xorl	%eax, %eax
ffff80000010cd05: 48 b8 f0 d4 10 00 00 80 ff ff	movabsq	$-140737487252240, %rax # imm = 0xFFFF80000010D4F0
ffff80000010cd0f: 31 c9                	xorl	%ecx, %ecx
ffff80000010cd11: 89 cf                	movl	%ecx, %edi
ffff80000010cd13: ff d0                	callq	*%rax
; 	while (1)
ffff80000010cd15: e9 e9 ff ff ff       	jmp	0xffff80000010cd03 <_panic+0xc3>
ffff80000010cd1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010cd20 <_warn>:
; {
ffff80000010cd20: 55                   	pushq	%rbp
ffff80000010cd21: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cd24: 48 83 ec 70          	subq	$112, %rsp
ffff80000010cd28: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010cd2c: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010cd30: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010cd34: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010cd38: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010cd3b: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff80000010cd3f: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010cd43: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010cd47: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010cd4b: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010cd4f: c7 45 d4 30 00 00 00 	movl	$48, -44(%rbp)
ffff80000010cd56: c7 45 d0 18 00 00 00 	movl	$24, -48(%rbp)
; 	cprintf("kernel warning at %s:%d: ", file, line);
ffff80000010cd5d: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000010cd61: 8b 55 f4             	movl	-12(%rbp), %edx
ffff80000010cd64: 48 bf d9 91 11 00 00 80 ff ff	movabsq	$-140737487203879, %rdi # imm = 0xFFFF8000001191D9
ffff80000010cd6e: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010cd78: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff80000010cd7c: 31 c0                	xorl	%eax, %eax
ffff80000010cd7e: 88 45 9f             	movb	%al, -97(%rbp)
ffff80000010cd81: ff d1                	callq	*%rcx
; 	vcprintf(fmt, ap);
ffff80000010cd83: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010cd87: 48 b8 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rax # imm = 0xFFFF80000010DC00
ffff80000010cd91: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010cd95: ff d0                	callq	*%rax
ffff80000010cd97: 48 8b 4d 90          	movq	-112(%rbp), %rcx
ffff80000010cd9b: 8a 45 9f             	movb	-97(%rbp), %al
; 	cprintf("\n");
ffff80000010cd9e: 48 bf d7 91 11 00 00 80 ff ff	movabsq	$-140737487203881, %rdi # imm = 0xFFFF8000001191D7
ffff80000010cda8: ff d1                	callq	*%rcx
; }
ffff80000010cdaa: 48 83 c4 70          	addq	$112, %rsp
ffff80000010cdae: 5d                   	popq	%rbp
ffff80000010cdaf: c3                   	retq

ffff80000010cdb0 <mon_help>:
; {
ffff80000010cdb0: 55                   	pushq	%rbp
ffff80000010cdb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cdb4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010cdb8: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010cdbb: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010cdbf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	for (i = 0; i < NCOMMANDS; i++)
ffff80000010cdc3: c7 45 e4 00 00 00 00 	movl	$0, -28(%rbp)
ffff80000010cdca: 48 63 45 e4          	movslq	-28(%rbp), %rax
ffff80000010cdce: 48 83 f8 06          	cmpq	$6, %rax
ffff80000010cdd2: 0f 83 44 00 00 00    	jae	0xffff80000010ce1c <mon_help+0x6c>
; 		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffff80000010cdd8: 48 63 45 e4          	movslq	-28(%rbp), %rax
ffff80000010cddc: 48 8d 14 40          	leaq	(%rax,%rax,2), %rdx
ffff80000010cde0: 48 b9 20 c5 11 00 00 80 ff ff	movabsq	$-140737487190752, %rcx # imm = 0xFFFF80000011C520
ffff80000010cdea: 48 8d 04 d1          	leaq	(%rcx,%rdx,8), %rax
ffff80000010cdee: 48 8b 34 d1          	movq	(%rcx,%rdx,8), %rsi
ffff80000010cdf2: 48 8b 50 08          	movq	8(%rax), %rdx
ffff80000010cdf6: 48 bf 12 92 11 00 00 80 ff ff	movabsq	$-140737487203822, %rdi # imm = 0xFFFF800000119212
ffff80000010ce00: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ce0a: 31 c0                	xorl	%eax, %eax
ffff80000010ce0c: ff d1                	callq	*%rcx
; 	for (i = 0; i < NCOMMANDS; i++)
ffff80000010ce0e: 8b 45 e4             	movl	-28(%rbp), %eax
ffff80000010ce11: 83 c0 01             	addl	$1, %eax
ffff80000010ce14: 89 45 e4             	movl	%eax, -28(%rbp)
ffff80000010ce17: e9 ae ff ff ff       	jmp	0xffff80000010cdca <mon_help+0x1a>
; 	return 0;
ffff80000010ce1c: 31 c0                	xorl	%eax, %eax
ffff80000010ce1e: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ce22: 5d                   	popq	%rbp
ffff80000010ce23: c3                   	retq
ffff80000010ce24: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ce2e: 66 90                	nop

ffff80000010ce30 <mon_kerninfo>:
; {
ffff80000010ce30: 55                   	pushq	%rbp
ffff80000010ce31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce34: 48 83 ec 70          	subq	$112, %rsp
ffff80000010ce38: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010ce3b: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010ce3f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	cprintf("Special kernel symbols:\n");
ffff80000010ce43: 48 bf 0a 8d 11 00 00 80 ff ff	movabsq	$-140737487205110, %rdi # imm = 0xFFFF800000118D0A
ffff80000010ce4d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ce57: 48 89 4d a0          	movq	%rcx, -96(%rbp)
ffff80000010ce5b: 31 c0                	xorl	%eax, %eax
ffff80000010ce5d: 88 45 af             	movb	%al, -81(%rbp)
ffff80000010ce60: ff d1                	callq	*%rcx
ffff80000010ce62: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010ce66: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010ce69: 48 bf 6d 93 11 00 00 80 ff ff	movabsq	$-140737487203475, %rdi # imm = 0xFFFF80000011936D
ffff80000010ce73: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ce7d: ff d1                	callq	*%rcx
ffff80000010ce7f: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010ce83: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010ce86: 48 bf 02 87 11 00 00 80 ff ff	movabsq	$-140737487206654, %rdi # imm = 0xFFFF800000118702
ffff80000010ce90: 49 b8 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r8 # imm = 0x800000000000
ffff80000010ce9a: 4c 89 45 98          	movq	%r8, -104(%rbp)
ffff80000010ce9e: 48 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %rsi # imm = 0xFFFF800000100000
ffff80000010cea8: 48 89 75 b0          	movq	%rsi, -80(%rbp)
ffff80000010ceac: 48 89 f2             	movq	%rsi, %rdx
ffff80000010ceaf: 4c 01 c2             	addq	%r8, %rdx
ffff80000010ceb2: ff d1                	callq	*%rcx
ffff80000010ceb4: 4c 8b 45 98          	movq	-104(%rbp), %r8
ffff80000010ceb8: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010cebc: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  etext  %016p (virt)  %016p (phys)\n", etext, etext - KERNEL_VMA);
ffff80000010cebf: 48 bf 3a 8a 11 00 00 80 ff ff	movabsq	$-140737487205830, %rdi # imm = 0xFFFF800000118A3A
ffff80000010cec9: 48 be 36 77 11 00 00 80 ff ff	movabsq	$-140737487210698, %rsi # imm = 0xFFFF800000117736
ffff80000010ced3: 48 89 f2             	movq	%rsi, %rdx
ffff80000010ced6: 4c 01 c2             	addq	%r8, %rdx
ffff80000010ced9: ff d1                	callq	*%rcx
ffff80000010cedb: 4c 8b 45 98          	movq	-104(%rbp), %r8
ffff80000010cedf: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010cee3: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010cee6: 48 bf 38 89 11 00 00 80 ff ff	movabsq	$-140737487206088, %rdi # imm = 0xFFFF800000118938
ffff80000010cef0: 48 be b0 c5 11 00 00 80 ff ff	movabsq	$-140737487190608, %rsi # imm = 0xFFFF80000011C5B0
ffff80000010cefa: 48 89 f2             	movq	%rsi, %rdx
ffff80000010cefd: 4c 01 c2             	addq	%r8, %rdx
ffff80000010cf00: ff d1                	callq	*%rcx
ffff80000010cf02: 4c 8b 45 98          	movq	-104(%rbp), %r8
ffff80000010cf06: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010cf0a: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cf0d: 48 bf 27 87 11 00 00 80 ff ff	movabsq	$-140737487206617, %rdi # imm = 0xFFFF800000118727
ffff80000010cf17: 48 be 00 d7 11 00 00 80 ff ff	movabsq	$-140737487186176, %rsi # imm = 0xFFFF80000011D700
ffff80000010cf21: 48 89 75 b8          	movq	%rsi, -72(%rbp)
ffff80000010cf25: 48 89 f2             	movq	%rsi, %rdx
ffff80000010cf28: 4c 01 c2             	addq	%r8, %rdx
ffff80000010cf2b: ff d1                	callq	*%rcx
ffff80000010cf2d: 48 8b 55 b0          	movq	-80(%rbp), %rdx
ffff80000010cf31: 48 8b 45 b8          	movq	-72(%rbp), %rax
; 		ROUNDUP(end - entry, 1024) / 1024);
ffff80000010cf35: 48 c7 45 e0 00 04 00 00      	movq	$1024, -32(%rbp) # imm = 0x400
ffff80000010cf3d: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010cf41: 48 29 d0             	subq	%rdx, %rax
ffff80000010cf44: 48 01 c8             	addq	%rcx, %rax
ffff80000010cf47: 48 83 e8 01          	subq	$1, %rax
ffff80000010cf4b: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010cf4f: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010cf53: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010cf57: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010cf5b: 31 c9                	xorl	%ecx, %ecx
ffff80000010cf5d: 89 ca                	movl	%ecx, %edx
ffff80000010cf5f: 48 f7 75 e0          	divq	-32(%rbp)
ffff80000010cf63: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010cf67: 48 29 d0             	subq	%rdx, %rax
ffff80000010cf6a: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010cf6e: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010cf72: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010cf76: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010cf7a: b9 00 04 00 00       	movl	$1024, %ecx             # imm = 0x400
ffff80000010cf7f: 48 99                	cqto
ffff80000010cf81: 48 f7 f9             	idivq	%rcx
ffff80000010cf84: 48 89 c6             	movq	%rax, %rsi
; 	cprintf("Kernel executable memory footprint: %llu kiB\n",
ffff80000010cf87: 48 bf 1e 8f 11 00 00 80 ff ff	movabsq	$-140737487204578, %rdi # imm = 0xFFFF800000118F1E
ffff80000010cf91: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010cf9b: 31 c0                	xorl	%eax, %eax
ffff80000010cf9d: ff d1                	callq	*%rcx
; 	return 0;
ffff80000010cf9f: 31 c0                	xorl	%eax, %eax
ffff80000010cfa1: 48 83 c4 70          	addq	$112, %rsp
ffff80000010cfa5: 5d                   	popq	%rbp
ffff80000010cfa6: c3                   	retq
ffff80000010cfa7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010cfb0 <mon_backtrace>:
; {
ffff80000010cfb0: 55                   	pushq	%rbp
ffff80000010cfb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cfb4: 48 83 ec 40          	subq	$64, %rsp
ffff80000010cfb8: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010cfbb: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010cfbf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	uintptr_t *rbp = read_rbp();
ffff80000010cfc3: 48 b8 00 d1 10 00 00 80 ff ff	movabsq	$-140737487253248, %rax # imm = 0xFFFF80000010D100
ffff80000010cfcd: ff d0                	callq	*%rax
ffff80000010cfcf: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	cprintf("Stack backtrace:\n");
ffff80000010cfd3: 48 bf 98 84 11 00 00 80 ff ff	movabsq	$-140737487207272, %rdi # imm = 0xFFFF800000118498
ffff80000010cfdd: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010cfe7: 31 c0                	xorl	%eax, %eax
ffff80000010cfe9: ff d1                	callq	*%rcx
; 	while (rbp) {
ffff80000010cfeb: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff80000010cff0: 0f 84 02 01 00 00    	je	0xffff80000010d0f8 <mon_backtrace+0x148>
; 		uintptr_t rip = *(rbp + 1);
ffff80000010cff6: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010cffa: 48 8b 40 08          	movq	8(%rax), %rax
ffff80000010cffe: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		uintptr_t *args = rbp + 2;
ffff80000010d002: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010d006: 48 83 c0 10          	addq	$16, %rax
ffff80000010d00a: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		cprintf("  RIP: %016p ", rip);
ffff80000010d00e: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010d012: 48 bf d9 94 11 00 00 80 ff ff	movabsq	$-140737487203111, %rdi # imm = 0xFFFF8000001194D9
ffff80000010d01c: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d026: 31 c0                	xorl	%eax, %eax
ffff80000010d028: ff d1                	callq	*%rcx
; 		cprintf("<no debug info>\t");
ffff80000010d02a: 48 bf 1b 92 11 00 00 80 ff ff	movabsq	$-140737487203813, %rdi # imm = 0xFFFF80000011921B
ffff80000010d034: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d03e: 31 c0                	xorl	%eax, %eax
ffff80000010d040: ff d1                	callq	*%rcx
; 		nargs = 6;
ffff80000010d042: 48 c7 45 c0 06 00 00 00      	movq	$6, -64(%rbp)
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010d04a: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff80000010d04e: 48 bf 83 90 11 00 00 80 ff ff	movabsq	$-140737487204221, %rdi # imm = 0xFFFF800000119083
ffff80000010d058: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d062: 31 c0                	xorl	%eax, %eax
ffff80000010d064: ff d1                	callq	*%rcx
; 		if (nargs)
ffff80000010d066: 48 83 7d c0 00       	cmpq	$0, -64(%rbp)
ffff80000010d06b: 0f 84 18 00 00 00    	je	0xffff80000010d089 <mon_backtrace+0xd9>
; 			cprintf("  args ");
ffff80000010d071: 48 bf 83 8b 11 00 00 80 ff ff	movabsq	$-140737487205501, %rdi # imm = 0xFFFF800000118B83
ffff80000010d07b: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d085: 31 c0                	xorl	%eax, %eax
ffff80000010d087: ff d1                	callq	*%rcx
; 		for (i = 0; i < nargs; i++)
ffff80000010d089: c7 45 e4 00 00 00 00 	movl	$0, -28(%rbp)
ffff80000010d090: 48 63 45 e4          	movslq	-28(%rbp), %rax
ffff80000010d094: 48 3b 45 c0          	cmpq	-64(%rbp), %rax
ffff80000010d098: 0f 83 32 00 00 00    	jae	0xffff80000010d0d0 <mon_backtrace+0x120>
; 			cprintf("%016p ", args[i]);
ffff80000010d09e: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010d0a2: 48 63 4d e4          	movslq	-28(%rbp), %rcx
ffff80000010d0a6: 48 8b 34 c8          	movq	(%rax,%rcx,8), %rsi
ffff80000010d0aa: 48 bf e2 8f 11 00 00 80 ff ff	movabsq	$-140737487204382, %rdi # imm = 0xFFFF800000118FE2
ffff80000010d0b4: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d0be: 31 c0                	xorl	%eax, %eax
ffff80000010d0c0: ff d1                	callq	*%rcx
; 		for (i = 0; i < nargs; i++)
ffff80000010d0c2: 8b 45 e4             	movl	-28(%rbp), %eax
ffff80000010d0c5: 83 c0 01             	addl	$1, %eax
ffff80000010d0c8: 89 45 e4             	movl	%eax, -28(%rbp)
ffff80000010d0cb: e9 c0 ff ff ff       	jmp	0xffff80000010d090 <mon_backtrace+0xe0>
; 		cprintf("\n");
ffff80000010d0d0: 48 bf d7 91 11 00 00 80 ff ff	movabsq	$-140737487203881, %rdi # imm = 0xFFFF8000001191D7
ffff80000010d0da: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d0e4: 31 c0                	xorl	%eax, %eax
ffff80000010d0e6: ff d1                	callq	*%rcx
; 		rbp = (uintptr_t *)*rbp;
ffff80000010d0e8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010d0ec: 48 8b 00             	movq	(%rax), %rax
ffff80000010d0ef: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	while (rbp) {
ffff80000010d0f3: e9 f3 fe ff ff       	jmp	0xffff80000010cfeb <mon_backtrace+0x3b>
; 	return 0;
ffff80000010d0f8: 31 c0                	xorl	%eax, %eax
ffff80000010d0fa: 48 83 c4 40          	addq	$64, %rsp
ffff80000010d0fe: 5d                   	popq	%rbp
ffff80000010d0ff: c3                   	retq

ffff80000010d100 <read_rbp>:
; {
ffff80000010d100: 55                   	pushq	%rbp
ffff80000010d101: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %%rbp, %0" : "=r" (ret));
ffff80000010d104: 48 89 e8             	movq	%rbp, %rax
ffff80000010d107: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	return ret;
ffff80000010d10b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010d10f: 5d                   	popq	%rbp
ffff80000010d110: c3                   	retq
ffff80000010d111: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d11b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d120 <mon_buddyinfo>:
; {
ffff80000010d120: 55                   	pushq	%rbp
ffff80000010d121: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d124: 48 83 ec 20          	subq	$32, %rsp
ffff80000010d128: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010d12b: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010d12f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	show_buddy_info();
ffff80000010d133: 48 b8 60 e2 10 00 00 80 ff ff	movabsq	$-140737487248800, %rax # imm = 0xFFFF80000010E260
ffff80000010d13d: ff d0                	callq	*%rax
; 	return 0;
ffff80000010d13f: 31 c0                	xorl	%eax, %eax
ffff80000010d141: 48 83 c4 20          	addq	$32, %rsp
ffff80000010d145: 5d                   	popq	%rbp
ffff80000010d146: c3                   	retq
ffff80000010d147: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d150 <mon_pageinfo>:
; {
ffff80000010d150: 55                   	pushq	%rbp
ffff80000010d151: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d154: 48 83 ec 40          	subq	$64, %rsp
ffff80000010d158: 89 7d f8             	movl	%edi, -8(%rbp)
ffff80000010d15b: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010d15f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (!pages || npages == 0) {
ffff80000010d163: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010d16d: 48 8b 00             	movq	(%rax), %rax
ffff80000010d170: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010d174: 0f 84 17 00 00 00    	je	0xffff80000010d191 <mon_pageinfo+0x41>
ffff80000010d17a: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010d184: 48 8b 00             	movq	(%rax), %rax
ffff80000010d187: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010d18b: 0f 85 24 00 00 00    	jne	0xffff80000010d1b5 <mon_pageinfo+0x65>
; 		cprintf("error: buddy allocator not set up\n");
ffff80000010d191: 48 bf cd 85 11 00 00 80 ff ff	movabsq	$-140737487206963, %rdi # imm = 0xFFFF8000001185CD
ffff80000010d19b: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d1a5: 31 c0                	xorl	%eax, %eax
ffff80000010d1a7: ff d1                	callq	*%rcx
; 		return 0;
ffff80000010d1a9: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d1b0: e9 36 02 00 00       	jmp	0xffff80000010d3eb <mon_pageinfo+0x29b>
; 	if (argc < 3) {
ffff80000010d1b5: 83 7d f8 03          	cmpl	$3, -8(%rbp)
ffff80000010d1b9: 0f 8d 2b 00 00 00    	jge	0xffff80000010d1ea <mon_pageinfo+0x9a>
; 		cprintf("usage: %s [idx|pa] <index>\n", argv[0]);
ffff80000010d1bf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d1c3: 48 8b 30             	movq	(%rax), %rsi
ffff80000010d1c6: 48 bf 4c 87 11 00 00 80 ff ff	movabsq	$-140737487206580, %rdi # imm = 0xFFFF80000011874C
ffff80000010d1d0: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d1da: 31 c0                	xorl	%eax, %eax
ffff80000010d1dc: ff d1                	callq	*%rcx
; 		return 0;
ffff80000010d1de: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d1e5: e9 01 02 00 00       	jmp	0xffff80000010d3eb <mon_pageinfo+0x29b>
; 	addr = strtol(argv[2], NULL, 0);
ffff80000010d1ea: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d1ee: 48 8b 78 10          	movq	16(%rax), %rdi
ffff80000010d1f2: 31 c0                	xorl	%eax, %eax
ffff80000010d1f4: 31 c0                	xorl	%eax, %eax
ffff80000010d1f6: 48 b8 20 2b 11 00 00 80 ff ff	movabsq	$-140737487230176, %rax # imm = 0xFFFF800000112B20
ffff80000010d200: 31 d2                	xorl	%edx, %edx
ffff80000010d202: 89 d6                	movl	%edx, %esi
ffff80000010d204: ff d0                	callq	*%rax
ffff80000010d206: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010d20a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d20e: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000010d212: 48 be 4c 8f 11 00 00 80 ff ff	movabsq	$-140737487204532, %rsi # imm = 0xFFFF800000118F4C
ffff80000010d21c: 48 b8 10 26 11 00 00 80 ff ff	movabsq	$-140737487231472, %rax # imm = 0xFFFF800000112610
ffff80000010d226: ff d0                	callq	*%rax
ffff80000010d228: 83 f8 00             	cmpl	$0, %eax
ffff80000010d22b: 0f 85 6b 00 00 00    	jne	0xffff80000010d29c <mon_pageinfo+0x14c>
; 		idx = addr;
ffff80000010d231: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010d235: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		if (idx >= npages) {
ffff80000010d239: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010d23d: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010d247: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010d24a: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010d24d: 0f 82 28 00 00 00    	jb	0xffff80000010d27b <mon_pageinfo+0x12b>
; 			cprintf("error: index %u out of range.\n", addr);
ffff80000010d253: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff80000010d257: 48 bf 5d 89 11 00 00 80 ff ff	movabsq	$-140737487206051, %rdi # imm = 0xFFFF80000011895D
ffff80000010d261: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d26b: 31 c0                	xorl	%eax, %eax
ffff80000010d26d: ff d1                	callq	*%rcx
; 			return 0;
ffff80000010d26f: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d276: e9 70 01 00 00       	jmp	0xffff80000010d3eb <mon_pageinfo+0x29b>
; 		page = pages + idx;
ffff80000010d27b: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010d285: 48 8b 00             	movq	(%rax), %rax
ffff80000010d288: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010d28c: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010d290: 48 01 c8             	addq	%rcx, %rax
ffff80000010d293: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	} else if (strcmp(argv[1], "pa") == 0) {
ffff80000010d297: e9 7c 00 00 00       	jmp	0xffff80000010d318 <mon_pageinfo+0x1c8>
ffff80000010d29c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d2a0: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000010d2a4: 48 be 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rsi # imm = 0xFFFF80000011939F
ffff80000010d2ae: 48 b8 10 26 11 00 00 80 ff ff	movabsq	$-140737487231472, %rax # imm = 0xFFFF800000112610
ffff80000010d2b8: ff d0                	callq	*%rax
ffff80000010d2ba: 83 f8 00             	cmpl	$0, %eax
ffff80000010d2bd: 0f 85 25 00 00 00    	jne	0xffff80000010d2e8 <mon_pageinfo+0x198>
; 		idx = PAGE_INDEX(addr);
ffff80000010d2c3: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010d2c7: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010d2cb: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page = pa2page(addr);
ffff80000010d2cf: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010d2d3: 48 b8 00 d4 10 00 00 80 ff ff	movabsq	$-140737487252480, %rax # imm = 0xFFFF80000010D400
ffff80000010d2dd: ff d0                	callq	*%rax
ffff80000010d2df: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	} else {
ffff80000010d2e3: e9 2b 00 00 00       	jmp	0xffff80000010d313 <mon_pageinfo+0x1c3>
; 		cprintf("usage: %s [idx|pa] <index>\n", argv[0]);
ffff80000010d2e8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d2ec: 48 8b 30             	movq	(%rax), %rsi
ffff80000010d2ef: 48 bf 4c 87 11 00 00 80 ff ff	movabsq	$-140737487206580, %rdi # imm = 0xFFFF80000011874C
ffff80000010d2f9: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d303: 31 c0                	xorl	%eax, %eax
ffff80000010d305: ff d1                	callq	*%rcx
; 		return 0;
ffff80000010d307: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d30e: e9 d8 00 00 00       	jmp	0xffff80000010d3eb <mon_pageinfo+0x29b>
ffff80000010d313: e9 00 00 00 00       	jmp	0xffff80000010d318 <mon_pageinfo+0x1c8>
; 	cprintf("  Page index: %u\n", idx);
ffff80000010d318: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010d31c: 48 bf f0 85 11 00 00 80 ff ff	movabsq	$-140737487206928, %rdi # imm = 0xFFFF8000001185F0
ffff80000010d326: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d330: 48 89 4d c0          	movq	%rcx, -64(%rbp)
ffff80000010d334: 31 c0                	xorl	%eax, %eax
ffff80000010d336: 88 45 cf             	movb	%al, -49(%rbp)
ffff80000010d339: ff d1                	callq	*%rcx
; 	cprintf("  Physical address: %p\n", page2pa(page));
ffff80000010d33b: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010d33f: 48 b8 80 d4 10 00 00 80 ff ff	movabsq	$-140737487252352, %rax # imm = 0xFFFF80000010D480
ffff80000010d349: ff d0                	callq	*%rax
ffff80000010d34b: 48 8b 4d c0          	movq	-64(%rbp), %rcx
ffff80000010d34f: 48 89 c6             	movq	%rax, %rsi
ffff80000010d352: 8a 45 cf             	movb	-49(%rbp), %al
ffff80000010d355: 48 bf 02 86 11 00 00 80 ff ff	movabsq	$-140737487206910, %rdi # imm = 0xFFFF800000118602
ffff80000010d35f: ff d1                	callq	*%rcx
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010d361: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d365: 8a 40 12             	movb	18(%rax), %al
ffff80000010d368: c0 e8 07             	shrb	$7, %al
ffff80000010d36b: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010d36e: 84 c0                	testb	%al, %al
ffff80000010d370: 48 b8 f9 8a 11 00 00 80 ff ff	movabsq	$-140737487205639, %rax # imm = 0xFFFF800000118AF9
ffff80000010d37a: 48 be ce 93 11 00 00 80 ff ff	movabsq	$-140737487203378, %rsi # imm = 0xFFFF8000001193CE
ffff80000010d384: 48 0f 45 f0          	cmovneq	%rax, %rsi
ffff80000010d388: 48 bf 59 8b 11 00 00 80 ff ff	movabsq	$-140737487205543, %rdi # imm = 0xFFFF800000118B59
ffff80000010d392: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d39c: 31 c0                	xorl	%eax, %eax
ffff80000010d39e: ff d1                	callq	*%rcx
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010d3a0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d3a4: 0f b7 70 10          	movzwl	16(%rax), %esi
ffff80000010d3a8: 48 bf d3 93 11 00 00 80 ff ff	movabsq	$-140737487203373, %rdi # imm = 0xFFFF8000001193D3
ffff80000010d3b2: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d3bc: 31 c0                	xorl	%eax, %eax
ffff80000010d3be: ff d1                	callq	*%rcx
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010d3c0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d3c4: 8a 40 12             	movb	18(%rax), %al
ffff80000010d3c7: 24 7f                	andb	$127, %al
ffff80000010d3c9: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d3cc: 48 bf 81 94 11 00 00 80 ff ff	movabsq	$-140737487203199, %rdi # imm = 0xFFFF800000119481
ffff80000010d3d6: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d3e0: 31 c0                	xorl	%eax, %eax
ffff80000010d3e2: ff d1                	callq	*%rcx
; 	return 0;
ffff80000010d3e4: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000010d3eb: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d3ee: 48 83 c4 40          	addq	$64, %rsp
ffff80000010d3f2: 5d                   	popq	%rbp
ffff80000010d3f3: c3                   	retq
ffff80000010d3f4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d3fe: 66 90                	nop

ffff80000010d400 <pa2page>:
; {
ffff80000010d400: 55                   	pushq	%rbp
ffff80000010d401: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d404: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d408: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010d40c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010d410: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010d414: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010d41e: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010d421: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010d424: 0f 82 27 00 00 00    	jb	0xffff80000010d451 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010d42a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff80000010d434: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000010d43e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010d448: 31 c0                	xorl	%eax, %eax
ffff80000010d44a: be 49 00 00 00       	movl	$73, %esi
ffff80000010d44f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff80000010d451: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010d45b: 48 8b 00             	movq	(%rax), %rax
ffff80000010d45e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010d462: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010d466: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010d46a: 48 01 c8             	addq	%rcx, %rax
ffff80000010d46d: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d471: 5d                   	popq	%rbp
ffff80000010d472: c3                   	retq
ffff80000010d473: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d47d: 0f 1f 00             	nopl	(%rax)

ffff80000010d480 <page2pa>:
; {
ffff80000010d480: 55                   	pushq	%rbp
ffff80000010d481: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d484: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010d488: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010d48c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010d496: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010d499: 48 29 c8             	subq	%rcx, %rax
ffff80000010d49c: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010d4a0: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010d4a4: 5d                   	popq	%rbp
ffff80000010d4a5: c3                   	retq
ffff80000010d4a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010d4b0 <mon_ptdump>:
; {
ffff80000010d4b0: 55                   	pushq	%rbp
ffff80000010d4b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d4b4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010d4b8: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010d4bb: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010d4bf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	return dump_page_tables(kernel_pml4, PAGE_HUGE);
ffff80000010d4c3: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000010d4cd: 48 8b 38             	movq	(%rax), %rdi
ffff80000010d4d0: 48 b8 90 2d 11 00 00 80 ff ff	movabsq	$-140737487229552, %rax # imm = 0xFFFF800000112D90
ffff80000010d4da: be 80 00 00 00       	movl	$128, %esi
ffff80000010d4df: ff d0                	callq	*%rax
ffff80000010d4e1: 48 83 c4 20          	addq	$32, %rsp
ffff80000010d4e5: 5d                   	popq	%rbp
ffff80000010d4e6: c3                   	retq
ffff80000010d4e7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d4f0 <monitor>:
; {
ffff80000010d4f0: 55                   	pushq	%rbp
ffff80000010d4f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d4f4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d4f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	cprintf("Welcome to the OpenLSD kernel monitor!\n");
ffff80000010d4fc: 48 bf 3d 91 11 00 00 80 ff ff	movabsq	$-140737487204035, %rdi # imm = 0xFFFF80000011913D
ffff80000010d506: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d510: 31 c0                	xorl	%eax, %eax
ffff80000010d512: ff d1                	callq	*%rcx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010d514: 48 bf 5f 8a 11 00 00 80 ff ff	movabsq	$-140737487205793, %rdi # imm = 0xFFFF800000118A5F
ffff80000010d51e: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d528: 31 c0                	xorl	%eax, %eax
ffff80000010d52a: ff d1                	callq	*%rcx
; 		buf = readline("K> ");
ffff80000010d52c: 48 bf 23 8d 11 00 00 80 ff ff	movabsq	$-140737487205085, %rdi # imm = 0xFFFF800000118D23
ffff80000010d536: 48 b8 10 22 11 00 00 80 ff ff	movabsq	$-140737487232496, %rax # imm = 0xFFFF800000112210
ffff80000010d540: ff d0                	callq	*%rax
ffff80000010d542: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		if (buf != NULL)
ffff80000010d546: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000010d54b: 0f 84 27 00 00 00    	je	0xffff80000010d578 <monitor+0x88>
; 			if (runcmd(buf, frame) < 0)
ffff80000010d551: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010d555: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000010d559: 48 b8 90 d5 10 00 00 80 ff ff	movabsq	$-140737487252080, %rax # imm = 0xFFFF80000010D590
ffff80000010d563: ff d0                	callq	*%rax
ffff80000010d565: 83 f8 00             	cmpl	$0, %eax
ffff80000010d568: 0f 8d 05 00 00 00    	jge	0xffff80000010d573 <monitor+0x83>
; 				break;
ffff80000010d56e: e9 0a 00 00 00       	jmp	0xffff80000010d57d <monitor+0x8d>
; 			if (runcmd(buf, frame) < 0)
ffff80000010d573: e9 00 00 00 00       	jmp	0xffff80000010d578 <monitor+0x88>
; 	while (1) {
ffff80000010d578: e9 af ff ff ff       	jmp	0xffff80000010d52c <monitor+0x3c>
; }
ffff80000010d57d: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d581: 5d                   	popq	%rbp
ffff80000010d582: c3                   	retq
ffff80000010d583: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d58d: 0f 1f 00             	nopl	(%rax)

ffff80000010d590 <runcmd>:
; {
ffff80000010d590: 55                   	pushq	%rbp
ffff80000010d591: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d594: 48 81 ec b0 00 00 00 	subq	$176, %rsp
ffff80000010d59b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000010d59f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	argc = 0;
ffff80000010d5a3: c7 45 e4 00 00 00 00 	movl	$0, -28(%rbp)
; 	argv[argc] = 0;
ffff80000010d5aa: 48 63 45 e4          	movslq	-28(%rbp), %rax
ffff80000010d5ae: 48 c7 84 c5 60 ff ff ff 00 00 00 00  	movq	$0, -160(%rbp,%rax,8)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d5ba: e9 00 00 00 00       	jmp	0xffff80000010d5bf <runcmd+0x2f>
ffff80000010d5bf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d5c3: 0f be 08             	movsbl	(%rax), %ecx
ffff80000010d5c6: 31 c0                	xorl	%eax, %eax
ffff80000010d5c8: 83 f9 00             	cmpl	$0, %ecx
ffff80000010d5cb: 88 85 5b ff ff ff    	movb	%al, -165(%rbp)
ffff80000010d5d1: 0f 84 2c 00 00 00    	je	0xffff80000010d603 <runcmd+0x73>
ffff80000010d5d7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d5db: 8a 00                	movb	(%rax), %al
ffff80000010d5dd: 0f be f0             	movsbl	%al, %esi
ffff80000010d5e0: 48 bf 5b 95 11 00 00 80 ff ff	movabsq	$-140737487202981, %rdi # imm = 0xFFFF80000011955B
ffff80000010d5ea: 48 b8 50 27 11 00 00 80 ff ff	movabsq	$-140737487231152, %rax # imm = 0xFFFF800000112750
ffff80000010d5f4: ff d0                	callq	*%rax
ffff80000010d5f6: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010d5fa: 0f 95 c0             	setne	%al
ffff80000010d5fd: 88 85 5b ff ff ff    	movb	%al, -165(%rbp)
ffff80000010d603: 8a 85 5b ff ff ff    	movb	-165(%rbp), %al
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d609: a8 01                	testb	$1, %al
ffff80000010d60b: 0f 85 05 00 00 00    	jne	0xffff80000010d616 <runcmd+0x86>
ffff80000010d611: e9 17 00 00 00       	jmp	0xffff80000010d62d <runcmd+0x9d>
; 			*buf++ = 0;
ffff80000010d616: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d61a: 48 89 c1             	movq	%rax, %rcx
ffff80000010d61d: 48 83 c1 01          	addq	$1, %rcx
ffff80000010d621: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff80000010d625: c6 00 00             	movb	$0, (%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d628: e9 92 ff ff ff       	jmp	0xffff80000010d5bf <runcmd+0x2f>
; 		if (*buf == 0)
ffff80000010d62d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d631: 0f be 00             	movsbl	(%rax), %eax
ffff80000010d634: 83 f8 00             	cmpl	$0, %eax
ffff80000010d637: 0f 85 05 00 00 00    	jne	0xffff80000010d642 <runcmd+0xb2>
; 			break;
ffff80000010d63d: e9 bb 00 00 00       	jmp	0xffff80000010d6fd <runcmd+0x16d>
; 		if (argc == MAXARGS-1) {
ffff80000010d642: 83 7d e4 0f          	cmpl	$15, -28(%rbp)
ffff80000010d646: 0f 85 29 00 00 00    	jne	0xffff80000010d675 <runcmd+0xe5>
; 			cprintf("Too many arguments (max %d)\n", MAXARGS);
ffff80000010d64c: 48 bf 66 8b 11 00 00 80 ff ff	movabsq	$-140737487205530, %rdi # imm = 0xFFFF800000118B66
ffff80000010d656: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d660: 31 c0                	xorl	%eax, %eax
ffff80000010d662: be 10 00 00 00       	movl	$16, %esi
ffff80000010d667: ff d1                	callq	*%rcx
; 			return 0;
ffff80000010d669: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d670: e9 75 01 00 00       	jmp	0xffff80000010d7ea <runcmd+0x25a>
; 		argv[argc++] = buf;
ffff80000010d675: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010d679: 8b 45 e4             	movl	-28(%rbp), %eax
ffff80000010d67c: 89 c2                	movl	%eax, %edx
ffff80000010d67e: 83 c2 01             	addl	$1, %edx
ffff80000010d681: 89 55 e4             	movl	%edx, -28(%rbp)
ffff80000010d684: 48 98                	cltq
ffff80000010d686: 48 89 8c c5 60 ff ff ff      	movq	%rcx, -160(%rbp,%rax,8)
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010d68e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d692: 0f be 08             	movsbl	(%rax), %ecx
ffff80000010d695: 31 c0                	xorl	%eax, %eax
ffff80000010d697: 83 f9 00             	cmpl	$0, %ecx
ffff80000010d69a: 88 85 5a ff ff ff    	movb	%al, -166(%rbp)
ffff80000010d6a0: 0f 84 2e 00 00 00    	je	0xffff80000010d6d4 <runcmd+0x144>
ffff80000010d6a6: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d6aa: 8a 00                	movb	(%rax), %al
ffff80000010d6ac: 0f be f0             	movsbl	%al, %esi
ffff80000010d6af: 48 bf 5b 95 11 00 00 80 ff ff	movabsq	$-140737487202981, %rdi # imm = 0xFFFF80000011955B
ffff80000010d6b9: 48 b8 50 27 11 00 00 80 ff ff	movabsq	$-140737487231152, %rax # imm = 0xFFFF800000112750
ffff80000010d6c3: ff d0                	callq	*%rax
ffff80000010d6c5: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010d6c9: 0f 95 c0             	setne	%al
ffff80000010d6cc: 34 ff                	xorb	$-1, %al
ffff80000010d6ce: 88 85 5a ff ff ff    	movb	%al, -166(%rbp)
ffff80000010d6d4: 8a 85 5a ff ff ff    	movb	-166(%rbp), %al
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010d6da: a8 01                	testb	$1, %al
ffff80000010d6dc: 0f 85 05 00 00 00    	jne	0xffff80000010d6e7 <runcmd+0x157>
ffff80000010d6e2: e9 11 00 00 00       	jmp	0xffff80000010d6f8 <runcmd+0x168>
; 			buf++;
ffff80000010d6e7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d6eb: 48 83 c0 01          	addq	$1, %rax
ffff80000010d6ef: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010d6f3: e9 96 ff ff ff       	jmp	0xffff80000010d68e <runcmd+0xfe>
; 	while (1) {
ffff80000010d6f8: e9 bd fe ff ff       	jmp	0xffff80000010d5ba <runcmd+0x2a>
; 	argv[argc] = 0;
ffff80000010d6fd: 48 63 45 e4          	movslq	-28(%rbp), %rax
ffff80000010d701: 48 c7 84 c5 60 ff ff ff 00 00 00 00  	movq	$0, -160(%rbp,%rax,8)
; 	if (argc == 0)
ffff80000010d70d: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff80000010d711: 0f 85 0c 00 00 00    	jne	0xffff80000010d723 <runcmd+0x193>
; 		return 0;
ffff80000010d717: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d71e: e9 c7 00 00 00       	jmp	0xffff80000010d7ea <runcmd+0x25a>
; 	for (i = 0; i < NCOMMANDS; i++) {
ffff80000010d723: c7 85 5c ff ff ff 00 00 00 00	movl	$0, -164(%rbp)
ffff80000010d72d: 48 63 85 5c ff ff ff 	movslq	-164(%rbp), %rax
ffff80000010d734: 48 83 f8 06          	cmpq	$6, %rax
ffff80000010d738: 0f 83 86 00 00 00    	jae	0xffff80000010d7c4 <runcmd+0x234>
; 		if (strcmp(argv[0], commands[i].name) == 0)
ffff80000010d73e: 48 8b bd 60 ff ff ff 	movq	-160(%rbp), %rdi
ffff80000010d745: 48 63 85 5c ff ff ff 	movslq	-164(%rbp), %rax
ffff80000010d74c: 48 8d 0c 40          	leaq	(%rax,%rax,2), %rcx
ffff80000010d750: 48 b8 20 c5 11 00 00 80 ff ff	movabsq	$-140737487190752, %rax # imm = 0xFFFF80000011C520
ffff80000010d75a: 48 8d 04 c8          	leaq	(%rax,%rcx,8), %rax
ffff80000010d75e: 48 8b 30             	movq	(%rax), %rsi
ffff80000010d761: 48 b8 10 26 11 00 00 80 ff ff	movabsq	$-140737487231472, %rax # imm = 0xFFFF800000112610
ffff80000010d76b: ff d0                	callq	*%rax
ffff80000010d76d: 83 f8 00             	cmpl	$0, %eax
ffff80000010d770: 0f 85 35 00 00 00    	jne	0xffff80000010d7ab <runcmd+0x21b>
; 			return commands[i].func(argc, argv, frame);
ffff80000010d776: 48 63 85 5c ff ff ff 	movslq	-164(%rbp), %rax
ffff80000010d77d: 48 8d 0c 40          	leaq	(%rax,%rax,2), %rcx
ffff80000010d781: 48 b8 20 c5 11 00 00 80 ff ff	movabsq	$-140737487190752, %rax # imm = 0xFFFF80000011C520
ffff80000010d78b: 48 8d 04 c8          	leaq	(%rax,%rcx,8), %rax
ffff80000010d78f: 48 8b 40 10          	movq	16(%rax), %rax
ffff80000010d793: 8b 7d e4             	movl	-28(%rbp), %edi
ffff80000010d796: 48 8d b5 60 ff ff ff 	leaq	-160(%rbp), %rsi
ffff80000010d79d: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000010d7a1: ff d0                	callq	*%rax
ffff80000010d7a3: 89 45 fc             	movl	%eax, -4(%rbp)
ffff80000010d7a6: e9 3f 00 00 00       	jmp	0xffff80000010d7ea <runcmd+0x25a>
; 	}
ffff80000010d7ab: e9 00 00 00 00       	jmp	0xffff80000010d7b0 <runcmd+0x220>
; 	for (i = 0; i < NCOMMANDS; i++) {
ffff80000010d7b0: 8b 85 5c ff ff ff    	movl	-164(%rbp), %eax
ffff80000010d7b6: 83 c0 01             	addl	$1, %eax
ffff80000010d7b9: 89 85 5c ff ff ff    	movl	%eax, -164(%rbp)
ffff80000010d7bf: e9 69 ff ff ff       	jmp	0xffff80000010d72d <runcmd+0x19d>
; 	cprintf("Unknown command '%s'\n", argv[0]);
ffff80000010d7c4: 48 8b b5 60 ff ff ff 	movq	-160(%rbp), %rsi
ffff80000010d7cb: 48 bf fc 84 11 00 00 80 ff ff	movabsq	$-140737487207172, %rdi # imm = 0xFFFF8000001184FC
ffff80000010d7d5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d7df: 31 c0                	xorl	%eax, %eax
ffff80000010d7e1: ff d1                	callq	*%rcx
; 	return 0;
ffff80000010d7e3: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000010d7ea: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d7ed: 48 81 c4 b0 00 00 00 	addq	$176, %rsp
ffff80000010d7f4: 5d                   	popq	%rbp
ffff80000010d7f5: c3                   	retq
ffff80000010d7f6: cc                   	int3
ffff80000010d7f7: cc                   	int3
ffff80000010d7f8: cc                   	int3
ffff80000010d7f9: cc                   	int3
ffff80000010d7fa: cc                   	int3
ffff80000010d7fb: cc                   	int3
ffff80000010d7fc: cc                   	int3
ffff80000010d7fd: cc                   	int3
ffff80000010d7fe: cc                   	int3
ffff80000010d7ff: cc                   	int3

ffff80000010d800 <pic_remap>:
; {
ffff80000010d800: 55                   	pushq	%rbp
ffff80000010d801: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d804: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d808: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010d80b: 89 75 f8             	movl	%esi, -8(%rbp)
; 	masks[0] = inb(PIC1_DATA);
ffff80000010d80e: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010d818: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d81d: ff d0                	callq	*%rax
ffff80000010d81f: 88 45 f6             	movb	%al, -10(%rbp)
; 	masks[1] = inb(PIC2_DATA);
ffff80000010d822: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010d82c: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d831: ff d0                	callq	*%rax
ffff80000010d833: 88 45 f7             	movb	%al, -9(%rbp)
; 	outb(PIC1_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d836: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d840: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d845: be 11 00 00 00       	movl	$17, %esi
ffff80000010d84a: ff d0                	callq	*%rax
; 	outb(PIC2_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d84c: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d856: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d85b: be 11 00 00 00       	movl	$17, %esi
ffff80000010d860: ff d0                	callq	*%rax
; 	outb(PIC1_DATA, offset1);
ffff80000010d862: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d865: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d868: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d872: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d877: ff d0                	callq	*%rax
; 	outb(PIC2_DATA, offset2);
ffff80000010d879: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010d87c: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d87f: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d889: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d88e: ff d0                	callq	*%rax
; 	outb(PIC1_DATA, 1 << IRQ_SLAVE);
ffff80000010d890: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d89a: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d89f: be 04 00 00 00       	movl	$4, %esi
ffff80000010d8a4: ff d0                	callq	*%rax
; 	outb(PIC2_DATA, IRQ_SLAVE);
ffff80000010d8a6: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d8b0: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d8b5: be 02 00 00 00       	movl	$2, %esi
ffff80000010d8ba: ff d0                	callq	*%rax
; 	outb(PIC1_DATA, PIC_ICW4_8086 | PIC_ICW4_AUTO);
ffff80000010d8bc: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d8c6: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d8cb: be 03 00 00 00       	movl	$3, %esi
ffff80000010d8d0: ff d0                	callq	*%rax
; 	outb(PIC2_DATA, PIC_ICW4_8086);
ffff80000010d8d2: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d8dc: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d8e1: be 01 00 00 00       	movl	$1, %esi
ffff80000010d8e6: ff d0                	callq	*%rax
; 	outb(PIC1_DATA, masks[0]);
ffff80000010d8e8: 8a 45 f6             	movb	-10(%rbp), %al
ffff80000010d8eb: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d8ee: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d8f8: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d8fd: ff d0                	callq	*%rax
; 	outb(PIC2_DATA, masks[1]);
ffff80000010d8ff: 8a 45 f7             	movb	-9(%rbp), %al
ffff80000010d902: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d905: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d90f: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d914: ff d0                	callq	*%rax
; }
ffff80000010d916: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d91a: 5d                   	popq	%rbp
ffff80000010d91b: c3                   	retq
ffff80000010d91c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d920 <inb>:
; {
ffff80000010d920: 55                   	pushq	%rbp
ffff80000010d921: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d924: 66 89 f8             	movw	%di, %ax
ffff80000010d927: 66 89 45 fe          	movw	%ax, -2(%rbp)
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010d92b: 66 8b 55 fe          	movw	-2(%rbp), %dx
ffff80000010d92f: ec                   	inb	%dx, %al
ffff80000010d930: 88 45 fd             	movb	%al, -3(%rbp)
; 	return data;
ffff80000010d933: 0f b6 45 fd          	movzbl	-3(%rbp), %eax
ffff80000010d937: 5d                   	popq	%rbp
ffff80000010d938: c3                   	retq
ffff80000010d939: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d940 <outb>:
; {
ffff80000010d940: 55                   	pushq	%rbp
ffff80000010d941: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d944: 40 88 f0             	movb	%sil, %al
ffff80000010d947: 66 89 f9             	movw	%di, %cx
ffff80000010d94a: 66 89 4d fe          	movw	%cx, -2(%rbp)
ffff80000010d94e: 88 45 fd             	movb	%al, -3(%rbp)
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010d951: 8a 45 fd             	movb	-3(%rbp), %al
ffff80000010d954: 66 8b 55 fe          	movw	-2(%rbp), %dx
ffff80000010d958: ee                   	outb	%al, %dx
; }
ffff80000010d959: 5d                   	popq	%rbp
ffff80000010d95a: c3                   	retq
ffff80000010d95b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d960 <pic_get_reg>:
; {
ffff80000010d960: 55                   	pushq	%rbp
ffff80000010d961: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d964: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d968: 89 7d fc             	movl	%edi, -4(%rbp)
; 	outb(PIC1_CMD, ocw3);
ffff80000010d96b: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d96e: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d971: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d97b: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d980: ff d0                	callq	*%rax
; 	outb(PIC2_CMD, ocw3);
ffff80000010d982: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d985: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d988: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010d992: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d997: ff d0                	callq	*%rax
; 	return (inb(PIC2_CMD) << 8) | inb(PIC1_CMD);
ffff80000010d999: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010d9a3: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d9a8: ff d0                	callq	*%rax
ffff80000010d9aa: 0f b6 c0             	movzbl	%al, %eax
ffff80000010d9ad: c1 e0 08             	shll	$8, %eax
ffff80000010d9b0: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010d9b3: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010d9bd: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d9c2: ff d0                	callq	*%rax
ffff80000010d9c4: 88 c1                	movb	%al, %cl
ffff80000010d9c6: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010d9c9: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010d9cc: 09 c8                	orl	%ecx, %eax
ffff80000010d9ce: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010d9d1: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d9d5: 5d                   	popq	%rbp
ffff80000010d9d6: c3                   	retq
ffff80000010d9d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d9e0 <pic_get_irr>:
; {
ffff80000010d9e0: 55                   	pushq	%rbp
ffff80000010d9e1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_IRR);
ffff80000010d9e4: 48 b8 60 d9 10 00 00 80 ff ff	movabsq	$-140737487251104, %rax # imm = 0xFFFF80000010D960
ffff80000010d9ee: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010d9f3: ff d0                	callq	*%rax
ffff80000010d9f5: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010d9f8: 5d                   	popq	%rbp
ffff80000010d9f9: c3                   	retq
ffff80000010d9fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010da00 <pic_get_isr>:
; {
ffff80000010da00: 55                   	pushq	%rbp
ffff80000010da01: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_ISR);
ffff80000010da04: 48 b8 60 d9 10 00 00 80 ff ff	movabsq	$-140737487251104, %rax # imm = 0xFFFF80000010D960
ffff80000010da0e: bf 0b 00 00 00       	movl	$11, %edi
ffff80000010da13: ff d0                	callq	*%rax
ffff80000010da15: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010da18: 5d                   	popq	%rbp
ffff80000010da19: c3                   	retq
ffff80000010da1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010da20 <pic_disable_all_irqs>:
; {
ffff80000010da20: 55                   	pushq	%rbp
ffff80000010da21: 48 89 e5             	movq	%rsp, %rbp
; 	outb(PIC1_DATA, 0xff);
ffff80000010da24: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010da2e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010da33: be ff 00 00 00       	movl	$255, %esi
ffff80000010da38: ff d0                	callq	*%rax
; 	outb(PIC2_DATA, 0xff);
ffff80000010da3a: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010da44: bf a1 00 00 00       	movl	$161, %edi
ffff80000010da49: be ff 00 00 00       	movl	$255, %esi
ffff80000010da4e: ff d0                	callq	*%rax
; }
ffff80000010da50: 5d                   	popq	%rbp
ffff80000010da51: c3                   	retq
ffff80000010da52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010da5c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010da60 <pic_enable_irq>:
; {
ffff80000010da60: 55                   	pushq	%rbp
ffff80000010da61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010da64: 48 83 ec 10          	subq	$16, %rsp
ffff80000010da68: 89 7d fc             	movl	%edi, -4(%rbp)
; 	if (irq < 8) {
ffff80000010da6b: 83 7d fc 08          	cmpl	$8, -4(%rbp)
ffff80000010da6f: 0f 8d 0b 00 00 00    	jge	0xffff80000010da80 <pic_enable_irq+0x20>
; 		port = PIC1_DATA;
ffff80000010da75: 66 c7 45 fa 21 00    	movw	$33, -6(%rbp)
; 	} else {
ffff80000010da7b: e9 0f 00 00 00       	jmp	0xffff80000010da8f <pic_enable_irq+0x2f>
; 		port = PIC2_DATA;
ffff80000010da80: 66 c7 45 fa a1 00    	movw	$161, -6(%rbp)
; 		irq -= 8;
ffff80000010da86: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010da89: 83 e8 08             	subl	$8, %eax
ffff80000010da8c: 89 45 fc             	movl	%eax, -4(%rbp)
; 	outb(port, inb(port) & ~(1 << irq));
ffff80000010da8f: 66 8b 45 fa          	movw	-6(%rbp), %ax
ffff80000010da93: 66 89 45 f8          	movw	%ax, -8(%rbp)
ffff80000010da97: 66 8b 45 fa          	movw	-6(%rbp), %ax
ffff80000010da9b: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010da9e: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010daa8: ff d0                	callq	*%rax
ffff80000010daaa: 0f b6 c0             	movzbl	%al, %eax
ffff80000010daad: 8b 4d fc             	movl	-4(%rbp), %ecx
ffff80000010dab0: ba 01 00 00 00       	movl	$1, %edx
ffff80000010dab5: d3 e2                	shll	%cl, %edx
ffff80000010dab7: 66 8b 4d f8          	movw	-8(%rbp), %cx
ffff80000010dabb: 83 f2 ff             	xorl	$-1, %edx
ffff80000010dabe: 21 d0                	andl	%edx, %eax
ffff80000010dac0: 0f b7 f9             	movzwl	%cx, %edi
ffff80000010dac3: 0f b6 f0             	movzbl	%al, %esi
ffff80000010dac6: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010dad0: ff d0                	callq	*%rax
; }
ffff80000010dad2: 48 83 c4 10          	addq	$16, %rsp
ffff80000010dad6: 5d                   	popq	%rbp
ffff80000010dad7: c3                   	retq
ffff80000010dad8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010dae0 <pic_disable_irq>:
; {
ffff80000010dae0: 55                   	pushq	%rbp
ffff80000010dae1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dae4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010dae8: 89 7d fc             	movl	%edi, -4(%rbp)
; 	if (irq < 8) {
ffff80000010daeb: 83 7d fc 08          	cmpl	$8, -4(%rbp)
ffff80000010daef: 0f 8d 0b 00 00 00    	jge	0xffff80000010db00 <pic_disable_irq+0x20>
; 		port = PIC1_DATA;
ffff80000010daf5: 66 c7 45 fa 21 00    	movw	$33, -6(%rbp)
; 	} else {
ffff80000010dafb: e9 0f 00 00 00       	jmp	0xffff80000010db0f <pic_disable_irq+0x2f>
; 		port = PIC2_DATA;
ffff80000010db00: 66 c7 45 fa a1 00    	movw	$161, -6(%rbp)
; 		irq -= 8;
ffff80000010db06: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010db09: 83 e8 08             	subl	$8, %eax
ffff80000010db0c: 89 45 fc             	movl	%eax, -4(%rbp)
; 	outb(port, inb(port) | (1 << irq));
ffff80000010db0f: 66 8b 45 fa          	movw	-6(%rbp), %ax
ffff80000010db13: 66 89 45 f8          	movw	%ax, -8(%rbp)
ffff80000010db17: 66 8b 45 fa          	movw	-6(%rbp), %ax
ffff80000010db1b: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010db1e: 48 b8 20 d9 10 00 00 80 ff ff	movabsq	$-140737487251168, %rax # imm = 0xFFFF80000010D920
ffff80000010db28: ff d0                	callq	*%rax
ffff80000010db2a: 0f b6 c0             	movzbl	%al, %eax
ffff80000010db2d: 8b 4d fc             	movl	-4(%rbp), %ecx
ffff80000010db30: ba 01 00 00 00       	movl	$1, %edx
ffff80000010db35: d3 e2                	shll	%cl, %edx
ffff80000010db37: 66 8b 4d f8          	movw	-8(%rbp), %cx
ffff80000010db3b: 09 d0                	orl	%edx, %eax
ffff80000010db3d: 0f b7 f9             	movzwl	%cx, %edi
ffff80000010db40: 0f b6 f0             	movzbl	%al, %esi
ffff80000010db43: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010db4d: ff d0                	callq	*%rax
; }
ffff80000010db4f: 48 83 c4 10          	addq	$16, %rsp
ffff80000010db53: 5d                   	popq	%rbp
ffff80000010db54: c3                   	retq
ffff80000010db55: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010db5f: 90                   	nop

ffff80000010db60 <pic_eoi>:
; {
ffff80000010db60: 55                   	pushq	%rbp
ffff80000010db61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010db64: 48 83 ec 10          	subq	$16, %rsp
ffff80000010db68: 89 7d fc             	movl	%edi, -4(%rbp)
; 	if (irq >= 8) {
ffff80000010db6b: 83 7d fc 08          	cmpl	$8, -4(%rbp)
ffff80000010db6f: 0f 8c 16 00 00 00    	jl	0xffff80000010db8b <pic_eoi+0x2b>
; 		outb(PIC2_CMD, PIC_EOI);
ffff80000010db75: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010db7f: bf a0 00 00 00       	movl	$160, %edi
ffff80000010db84: be 20 00 00 00       	movl	$32, %esi
ffff80000010db89: ff d0                	callq	*%rax
; 	outb(PIC1_CMD, PIC_EOI);
ffff80000010db8b: 48 b8 40 d9 10 00 00 80 ff ff	movabsq	$-140737487251136, %rax # imm = 0xFFFF80000010D940
ffff80000010db95: be 20 00 00 00       	movl	$32, %esi
ffff80000010db9a: 89 f7                	movl	%esi, %edi
ffff80000010db9c: ff d0                	callq	*%rax
; }
ffff80000010db9e: 48 83 c4 10          	addq	$16, %rsp
ffff80000010dba2: 5d                   	popq	%rbp
ffff80000010dba3: c3                   	retq
ffff80000010dba4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dbae: 66 90                	nop

ffff80000010dbb0 <pic_init>:
; {
ffff80000010dbb0: 55                   	pushq	%rbp
ffff80000010dbb1: 48 89 e5             	movq	%rsp, %rbp
; 	pic_disable_all_irqs();
ffff80000010dbb4: 48 b8 20 da 10 00 00 80 ff ff	movabsq	$-140737487250912, %rax # imm = 0xFFFF80000010DA20
ffff80000010dbbe: ff d0                	callq	*%rax
; 	pic_remap(IRQ_OFFSET, IRQ_OFFSET + 8);
ffff80000010dbc0: 48 b8 00 d8 10 00 00 80 ff ff	movabsq	$-140737487251456, %rax # imm = 0xFFFF80000010D800
ffff80000010dbca: bf 20 00 00 00       	movl	$32, %edi
ffff80000010dbcf: be 28 00 00 00       	movl	$40, %esi
ffff80000010dbd4: ff d0                	callq	*%rax
; 	pic_get_irr();
ffff80000010dbd6: 48 b8 e0 d9 10 00 00 80 ff ff	movabsq	$-140737487250976, %rax # imm = 0xFFFF80000010D9E0
ffff80000010dbe0: ff d0                	callq	*%rax
; 	pic_enable_irq(IRQ_SLAVE);
ffff80000010dbe2: 48 b8 60 da 10 00 00 80 ff ff	movabsq	$-140737487250848, %rax # imm = 0xFFFF80000010DA60
ffff80000010dbec: bf 02 00 00 00       	movl	$2, %edi
ffff80000010dbf1: ff d0                	callq	*%rax
; }
ffff80000010dbf3: 5d                   	popq	%rbp
ffff80000010dbf4: c3                   	retq
ffff80000010dbf5: cc                   	int3
ffff80000010dbf6: cc                   	int3
ffff80000010dbf7: cc                   	int3
ffff80000010dbf8: cc                   	int3
ffff80000010dbf9: cc                   	int3
ffff80000010dbfa: cc                   	int3
ffff80000010dbfb: cc                   	int3
ffff80000010dbfc: cc                   	int3
ffff80000010dbfd: cc                   	int3
ffff80000010dbfe: cc                   	int3
ffff80000010dbff: cc                   	int3

ffff80000010dc00 <vcprintf>:
; {
ffff80000010dc00: 55                   	pushq	%rbp
ffff80000010dc01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc04: 48 83 ec 20          	subq	$32, %rsp
ffff80000010dc08: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010dc0c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	int cnt = 0;
ffff80000010dc10: c7 45 ec 00 00 00 00 	movl	$0, -20(%rbp)
; 	vprintfmt((void*)putch, &cnt, fmt, ap);
ffff80000010dc17: 48 8d 75 ec          	leaq	-20(%rbp), %rsi
ffff80000010dc1b: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010dc1f: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010dc23: 48 bf 50 dc 10 00 00 80 ff ff	movabsq	$-140737487250352, %rdi # imm = 0xFFFF80000010DC50
ffff80000010dc2d: 48 b8 b0 0b 11 00 00 80 ff ff	movabsq	$-140737487238224, %rax # imm = 0xFFFF800000110BB0
ffff80000010dc37: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010dc39: 8b 45 ec             	movl	-20(%rbp), %eax
ffff80000010dc3c: 48 83 c4 20          	addq	$32, %rsp
ffff80000010dc40: 5d                   	popq	%rbp
ffff80000010dc41: c3                   	retq
ffff80000010dc42: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc4c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010dc50 <putch>:
; {
ffff80000010dc50: 55                   	pushq	%rbp
ffff80000010dc51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc54: 48 83 ec 10          	subq	$16, %rsp
ffff80000010dc58: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010dc5b: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	cputchar(ch);
ffff80000010dc5f: 8b 7d fc             	movl	-4(%rbp), %edi
ffff80000010dc62: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff80000010dc6c: ff d0                	callq	*%rax
; 	*cnt++;
ffff80000010dc6e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010dc72: 48 83 c0 04          	addq	$4, %rax
ffff80000010dc76: 48 89 45 f0          	movq	%rax, -16(%rbp)
; }
ffff80000010dc7a: 48 83 c4 10          	addq	$16, %rsp
ffff80000010dc7e: 5d                   	popq	%rbp
ffff80000010dc7f: c3                   	retq

ffff80000010dc80 <cprintf>:
; {
ffff80000010dc80: 55                   	pushq	%rbp
ffff80000010dc81: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc84: 48 83 ec 60          	subq	$96, %rsp
ffff80000010dc88: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010dc8c: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010dc90: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010dc94: 48 89 55 b0          	movq	%rdx, -80(%rbp)
ffff80000010dc98: 48 89 75 a8          	movq	%rsi, -88(%rbp)
ffff80000010dc9c: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010dca0: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010dca4: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010dca8: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010dcac: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010dcb0: c7 45 e4 30 00 00 00 	movl	$48, -28(%rbp)
ffff80000010dcb7: c7 45 e0 08 00 00 00 	movl	$8, -32(%rbp)
; 	cnt = vcprintf(fmt, ap);
ffff80000010dcbe: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010dcc2: 48 b8 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rax # imm = 0xFFFF80000010DC00
ffff80000010dccc: 48 8d 75 e0          	leaq	-32(%rbp), %rsi
ffff80000010dcd0: ff d0                	callq	*%rax
ffff80000010dcd2: 89 45 dc             	movl	%eax, -36(%rbp)
; 	return cnt;
ffff80000010dcd5: 8b 45 dc             	movl	-36(%rbp), %eax
ffff80000010dcd8: 48 83 c4 60          	addq	$96, %rsp
ffff80000010dcdc: 5d                   	popq	%rbp
ffff80000010dcdd: c3                   	retq
ffff80000010dcde: cc                   	int3
ffff80000010dcdf: cc                   	int3

ffff80000010dce0 <boot_alloc>:
; {
ffff80000010dce0: 55                   	pushq	%rbp
ffff80000010dce1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dce4: 48 83 ec 70          	subq	$112, %rsp
ffff80000010dce8: 89 7d f4             	movl	%edi, -12(%rbp)
; 	if (!next_free){
ffff80000010dceb: 48 b8 30 d2 11 00 00 80 ff ff	movabsq	$-140737487187408, %rax # imm = 0xFFFF80000011D230
ffff80000010dcf5: 48 8b 00             	movq	(%rax), %rax
ffff80000010dcf8: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010dcfc: 0f 85 54 00 00 00    	jne	0xffff80000010dd56 <boot_alloc+0x76>
; 		next_free = ROUNDUP((char *)end, PAGE_SIZE);
ffff80000010dd02: 48 c7 45 e0 00 10 00 00      	movq	$4096, -32(%rbp) # imm = 0x1000
ffff80000010dd0a: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010dd0e: 48 b8 00 d7 11 00 00 80 ff ff	movabsq	$-140737487186176, %rax # imm = 0xFFFF80000011D700
ffff80000010dd18: 48 8d 44 08 ff       	leaq	-1(%rax,%rcx), %rax
ffff80000010dd1d: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010dd21: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010dd25: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff80000010dd29: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010dd2d: 31 d2                	xorl	%edx, %edx
ffff80000010dd2f: 48 f7 f1             	divq	%rcx
ffff80000010dd32: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010dd36: 48 29 d0             	subq	%rdx, %rax
ffff80000010dd39: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010dd3d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010dd41: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010dd45: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000010dd49: 48 b8 30 d2 11 00 00 80 ff ff	movabsq	$-140737487187408, %rax # imm = 0xFFFF80000011D230
ffff80000010dd53: 48 89 08             	movq	%rcx, (%rax)
; 	if(n == 0) return next_free;
ffff80000010dd56: 83 7d f4 00          	cmpl	$0, -12(%rbp)
ffff80000010dd5a: 0f 85 16 00 00 00    	jne	0xffff80000010dd76 <boot_alloc+0x96>
ffff80000010dd60: 48 b8 30 d2 11 00 00 80 ff ff	movabsq	$-140737487187408, %rax # imm = 0xFFFF80000011D230
ffff80000010dd6a: 48 8b 00             	movq	(%rax), %rax
ffff80000010dd6d: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000010dd71: e9 b2 00 00 00       	jmp	0xffff80000010de28 <boot_alloc+0x148>
; 	uint64_t n_paligned = ROUNDUP(n, PAGE_SIZE);
ffff80000010dd76: 48 c7 45 b8 00 10 00 00      	movq	$4096, -72(%rbp) # imm = 0x1000
ffff80000010dd7e: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010dd81: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010dd85: 48 8d 44 08 ff       	leaq	-1(%rax,%rcx), %rax
ffff80000010dd8a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010dd8e: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000010dd92: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff80000010dd96: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010dd9a: 31 d2                	xorl	%edx, %edx
ffff80000010dd9c: 48 f7 f1             	divq	%rcx
ffff80000010dd9f: 48 8b 45 90          	movq	-112(%rbp), %rax
ffff80000010dda3: 48 29 d0             	subq	%rdx, %rax
ffff80000010dda6: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff80000010ddaa: 8b 45 a0             	movl	-96(%rbp), %eax
ffff80000010ddad: 89 45 b4             	movl	%eax, -76(%rbp)
ffff80000010ddb0: 8b 45 b4             	movl	-76(%rbp), %eax
ffff80000010ddb3: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	if(((uintptr_t) next_free + n_paligned) > ((uintptr_t) KERNEL_VMA + BOOT_MAP_LIM)){
ffff80000010ddb7: 48 b8 30 d2 11 00 00 80 ff ff	movabsq	$-140737487187408, %rax # imm = 0xFFFF80000011D230
ffff80000010ddc1: 48 8b 00             	movq	(%rax), %rax
ffff80000010ddc4: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010ddc8: 48 b9 00 00 80 00 00 80 ff ff	movabsq	$-140737479966720, %rcx # imm = 0xFFFF800000800000
ffff80000010ddd2: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010ddd5: 0f 86 27 00 00 00    	jbe	0xffff80000010de02 <boot_alloc+0x122>
; 		panic("OOM in boot loader");
ffff80000010dddb: 48 bf 60 95 11 00 00 80 ff ff	movabsq	$-140737487202976, %rdi # imm = 0xFFFF800000119560
ffff80000010dde5: 48 ba 04 94 11 00 00 80 ff ff	movabsq	$-140737487203324, %rdx # imm = 0xFFFF800000119404
ffff80000010ddef: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010ddf9: 31 c0                	xorl	%eax, %eax
ffff80000010ddfb: be 2c 00 00 00       	movl	$44, %esi
ffff80000010de00: ff d1                	callq	*%rcx
; 	result = next_free;
ffff80000010de02: 48 b8 30 d2 11 00 00 80 ff ff	movabsq	$-140737487187408, %rax # imm = 0xFFFF80000011D230
ffff80000010de0c: 48 8b 08             	movq	(%rax), %rcx
ffff80000010de0f: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 	next_free += n_paligned;
ffff80000010de13: 48 8b 55 c0          	movq	-64(%rbp), %rdx
ffff80000010de17: 48 8b 08             	movq	(%rax), %rcx
ffff80000010de1a: 48 01 d1             	addq	%rdx, %rcx
ffff80000010de1d: 48 89 08             	movq	%rcx, (%rax)
; 	return result;
ffff80000010de20: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010de24: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff80000010de28: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010de2c: 48 83 c4 70          	addq	$112, %rsp
ffff80000010de30: 5d                   	popq	%rbp
ffff80000010de31: c3                   	retq
ffff80000010de32: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010de3c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010de40 <align_boot_info>:
; {
ffff80000010de40: 55                   	pushq	%rbp
ffff80000010de41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010de44: 48 83 ec 18          	subq	$24, %rsp
ffff80000010de48: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010de4c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010de50: 8b 00                	movl	(%rax), %eax
ffff80000010de52: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010de56: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010de5e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010de62: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010de66: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010de69: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010de6c: 0f 83 80 01 00 00    	jae	0xffff80000010dff2 <align_boot_info+0x1b2>
; 		switch (entry->type) {
ffff80000010de72: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010de76: 8b 40 10             	movl	16(%rax), %eax
ffff80000010de79: 83 e8 01             	subl	$1, %eax
ffff80000010de7c: 0f 85 9e 00 00 00    	jne	0xffff80000010df20 <align_boot_info+0xe0>
ffff80000010de82: e9 00 00 00 00       	jmp	0xffff80000010de87 <align_boot_info+0x47>
; 			base = ROUNDUP(entry->addr, PAGE_SIZE);
ffff80000010de87: 48 c7 45 d0 00 10 00 00      	movq	$4096, -48(%rbp) # imm = 0x1000
ffff80000010de8f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010de93: 48 8b 00             	movq	(%rax), %rax
ffff80000010de96: 48 03 45 d0          	addq	-48(%rbp), %rax
ffff80000010de9a: 48 83 e8 01          	subq	$1, %rax
ffff80000010de9e: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010dea2: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010dea6: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff80000010dead: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010deb1: 31 c9                	xorl	%ecx, %ecx
ffff80000010deb3: 89 ca                	movl	%ecx, %edx
ffff80000010deb5: 48 f7 75 d0          	divq	-48(%rbp)
ffff80000010deb9: 48 8b 85 70 ff ff ff 	movq	-144(%rbp), %rax
ffff80000010dec0: 48 29 d0             	subq	%rdx, %rax
ffff80000010dec3: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010dec7: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010decb: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010decf: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010ded3: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 			end = entry->len - (base - entry->addr);
ffff80000010ded7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010dedb: 48 8b 40 08          	movq	8(%rax), %rax
ffff80000010dedf: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010dee3: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000010dee7: 48 2b 0a             	subq	(%rdx), %rcx
ffff80000010deea: 48 29 c8             	subq	%rcx, %rax
ffff80000010deed: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 			end = ROUNDDOWN(base + end, PAGE_SIZE);
ffff80000010def1: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010def5: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff80000010def9: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010defd: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff80000010df01: 48 8b 4d b0          	movq	-80(%rbp), %rcx
ffff80000010df05: 48 81 e1 ff 0f 00 00 	andq	$4095, %rcx             # imm = 0xFFF
ffff80000010df0c: 48 29 c8             	subq	%rcx, %rax
ffff80000010df0f: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010df13: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000010df17: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 			break;
ffff80000010df1b: e9 9a 00 00 00       	jmp	0xffff80000010dfba <align_boot_info+0x17a>
; 			base = ROUNDDOWN(entry->addr, PAGE_SIZE);
ffff80000010df20: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010df24: 48 8b 00             	movq	(%rax), %rax
ffff80000010df27: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff80000010df2b: 48 8b 45 a0          	movq	-96(%rbp), %rax
ffff80000010df2f: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010df33: 48 81 e1 ff 0f 00 00 	andq	$4095, %rcx             # imm = 0xFFF
ffff80000010df3a: 48 29 c8             	subq	%rcx, %rax
ffff80000010df3d: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff80000010df41: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010df45: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 			end = entry->len + (entry->addr - base);
ffff80000010df49: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010df4d: 48 8b 40 08          	movq	8(%rax), %rax
ffff80000010df51: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010df55: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010df58: 48 2b 4d e0          	subq	-32(%rbp), %rcx
ffff80000010df5c: 48 01 c8             	addq	%rcx, %rax
ffff80000010df5f: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 			end = ROUNDUP(base + end, PAGE_SIZE);
ffff80000010df63: 48 c7 45 90 00 10 00 00      	movq	$4096, -112(%rbp) # imm = 0x1000
ffff80000010df6b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010df6f: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff80000010df73: 48 03 45 90          	addq	-112(%rbp), %rax
ffff80000010df77: 48 83 e8 01          	subq	$1, %rax
ffff80000010df7b: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff80000010df7f: 48 8b 45 80          	movq	-128(%rbp), %rax
ffff80000010df83: 48 89 85 68 ff ff ff 	movq	%rax, -152(%rbp)
ffff80000010df8a: 48 8b 45 80          	movq	-128(%rbp), %rax
ffff80000010df8e: 31 c9                	xorl	%ecx, %ecx
ffff80000010df90: 89 ca                	movl	%ecx, %edx
ffff80000010df92: 48 f7 75 90          	divq	-112(%rbp)
ffff80000010df96: 48 8b 85 68 ff ff ff 	movq	-152(%rbp), %rax
ffff80000010df9d: 48 29 d0             	subq	%rdx, %rax
ffff80000010dfa0: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff80000010dfa7: 48 8b 85 78 ff ff ff 	movq	-136(%rbp), %rax
ffff80000010dfae: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff80000010dfb2: 48 8b 45 88          	movq	-120(%rbp), %rax
ffff80000010dfb6: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		entry->addr = base;
ffff80000010dfba: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010dfbe: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010dfc2: 48 89 08             	movq	%rcx, (%rax)
; 		entry->len = end - base;
ffff80000010dfc5: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000010dfc9: 48 2b 4d e0          	subq	-32(%rbp), %rcx
ffff80000010dfcd: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010dfd1: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010dfd5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010dfd9: 48 83 c0 01          	addq	$1, %rax
ffff80000010dfdd: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010dfe1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010dfe5: 48 83 c0 18          	addq	$24, %rax
ffff80000010dfe9: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010dfed: e9 6c fe ff ff       	jmp	0xffff80000010de5e <align_boot_info+0x1e>
; }
ffff80000010dff2: 48 83 c4 18          	addq	$24, %rsp
ffff80000010dff6: 5d                   	popq	%rbp
ffff80000010dff7: c3                   	retq
ffff80000010dff8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010e000 <show_boot_mmap>:
; {
ffff80000010e000: 55                   	pushq	%rbp
ffff80000010e001: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e004: 48 83 ec 40          	subq	$64, %rsp
ffff80000010e008: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010e00c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e010: 8b 00                	movl	(%rax), %eax
ffff80000010e012: 89 c2                	movl	%eax, %edx
ffff80000010e014: 48 bf 60 95 11 00 00 80 ff ff	movabsq	$-140737487202976, %rdi # imm = 0xFFFF800000119560
ffff80000010e01e: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010e028: be 5d 00 00 00       	movl	$93, %esi
ffff80000010e02d: ff d0                	callq	*%rax
ffff80000010e02f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	cprintf("Boot memory map:\n");
ffff80000010e033: 48 bf 17 94 11 00 00 80 ff ff	movabsq	$-140737487203305, %rdi # imm = 0xFFFF800000119417
ffff80000010e03d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010e047: 31 c0                	xorl	%eax, %eax
ffff80000010e049: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e04b: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010e053: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e057: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010e05b: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010e05e: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e061: 0f 83 ea 00 00 00    	jae	0xffff80000010e151 <show_boot_mmap+0x151>
; 		switch (entry->type) {
ffff80000010e067: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e06b: 8b 40 10             	movl	16(%rax), %eax
ffff80000010e06e: 83 c0 ff             	addl	$-1, %eax
ffff80000010e071: 89 c1                	movl	%eax, %ecx
ffff80000010e073: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010e077: 83 e8 04             	subl	$4, %eax
ffff80000010e07a: 0f 87 73 00 00 00    	ja	0xffff80000010e0f3 <show_boot_mmap+0xf3>
ffff80000010e080: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff80000010e084: 48 b8 30 80 11 00 00 80 ff ff	movabsq	$-140737487208400, %rax # imm = 0xFFFF800000118030
ffff80000010e08e: 48 8b 04 c8          	movq	(%rax,%rcx,8), %rax
ffff80000010e092: ff e0                	jmpq	*%rax
; 		case MMAP_FREE: region = "free"; break;
ffff80000010e094: 48 b8 f9 8a 11 00 00 80 ff ff	movabsq	$-140737487205639, %rax # imm = 0xFFFF800000118AF9
ffff80000010e09e: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0a2: e9 5a 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_RESERVED: region = "reserved"; break;
ffff80000010e0a7: 48 b8 1f 8b 11 00 00 80 ff ff	movabsq	$-140737487205601, %rax # imm = 0xFFFF800000118B1F
ffff80000010e0b1: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0b5: e9 47 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_ACPI_RECLAIMABLE: region = "ACPI"; break;
ffff80000010e0ba: 48 b8 29 8e 11 00 00 80 ff ff	movabsq	$-140737487204823, %rax # imm = 0xFFFF800000118E29
ffff80000010e0c4: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0c8: e9 34 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_ACPI_NVS: region = "ACPI NVS"; break;
ffff80000010e0cd: 48 b8 7c 89 11 00 00 80 ff ff	movabsq	$-140737487206020, %rax # imm = 0xFFFF80000011897C
ffff80000010e0d7: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0db: e9 21 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_BAD: region = "bad"; break;
ffff80000010e0e0: 48 b8 0c 95 11 00 00 80 ff ff	movabsq	$-140737487203060, %rax # imm = 0xFFFF80000011950C
ffff80000010e0ea: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0ee: e9 0e 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		default: region = "?"; break;
ffff80000010e0f3: 48 b8 8b 8b 11 00 00 80 ff ff	movabsq	$-140737487205493, %rax # imm = 0xFFFF800000118B8B
ffff80000010e0fd: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 			entry->addr,
ffff80000010e101: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e105: 48 8b 30             	movq	(%rax), %rsi
; 			entry->addr + entry->len,
ffff80000010e108: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e10c: 48 8b 10             	movq	(%rax), %rdx
ffff80000010e10f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e113: 48 03 50 08          	addq	8(%rax), %rdx
; 			region);
ffff80000010e117: 48 8b 4d d0          	movq	-48(%rbp), %rcx
; 		cprintf("  %016p - %016p [%s]\n",
ffff80000010e11b: 48 bf 29 94 11 00 00 80 ff ff	movabsq	$-140737487203287, %rdi # imm = 0xFFFF800000119429
ffff80000010e125: 49 b8 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %r8 # imm = 0xFFFF80000010DC80
ffff80000010e12f: 31 c0                	xorl	%eax, %eax
ffff80000010e131: 41 ff d0             	callq	*%r8
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010e134: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e138: 48 83 c0 01          	addq	$1, %rax
ffff80000010e13c: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010e140: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e144: 48 83 c0 18          	addq	$24, %rax
ffff80000010e148: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010e14c: e9 02 ff ff ff       	jmp	0xffff80000010e053 <show_boot_mmap+0x53>
; }
ffff80000010e151: 48 83 c4 40          	addq	$64, %rsp
ffff80000010e155: 5d                   	popq	%rbp
ffff80000010e156: c3                   	retq
ffff80000010e157: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e160 <_kaddr>:
; {
ffff80000010e160: 55                   	pushq	%rbp
ffff80000010e161: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e164: 48 83 ec 20          	subq	$32, %rsp
ffff80000010e168: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010e16c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010e16f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e173: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e177: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010e17b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010e185: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010e188: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e18b: 0f 82 24 00 00 00    	jb	0xffff80000010e1b5 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010e191: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010e195: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010e198: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010e19c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff80000010e1a6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010e1b0: 31 c0                	xorl	%eax, %eax
ffff80000010e1b2: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010e1b5: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010e1bf: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010e1c3: 48 83 c4 20          	addq	$32, %rsp
ffff80000010e1c7: 5d                   	popq	%rbp
ffff80000010e1c8: c3                   	retq
ffff80000010e1c9: cc                   	int3
ffff80000010e1ca: cc                   	int3
ffff80000010e1cb: cc                   	int3
ffff80000010e1cc: cc                   	int3
ffff80000010e1cd: cc                   	int3
ffff80000010e1ce: cc                   	int3
ffff80000010e1cf: cc                   	int3

ffff80000010e1d0 <count_free_pages>:
; {
ffff80000010e1d0: 55                   	pushq	%rbp
ffff80000010e1d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e1d4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	size_t nfree_pages = 0;
ffff80000010e1d8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	if (order >= BUDDY_MAX_ORDER) {
ffff80000010e1e0: 48 83 7d f0 0a       	cmpq	$10, -16(%rbp)
ffff80000010e1e5: 0f 82 0d 00 00 00    	jb	0xffff80000010e1f8 <count_free_pages+0x28>
; 		return 0;
ffff80000010e1eb: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff80000010e1f3: e9 62 00 00 00       	jmp	0xffff80000010e25a <count_free_pages+0x8a>
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010e1f8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e1fc: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010e200: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010e20a: 48 01 c8             	addq	%rcx, %rax
ffff80000010e20d: 48 8b 00             	movq	(%rax), %rax
ffff80000010e210: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010e214: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e218: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010e21c: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010e220: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010e22a: 48 01 d1             	addq	%rdx, %rcx
ffff80000010e22d: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e230: 0f 84 1c 00 00 00    	je	0xffff80000010e252 <count_free_pages+0x82>
; 		++nfree_pages;
ffff80000010e236: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e23a: 48 83 c0 01          	addq	$1, %rax
ffff80000010e23e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010e242: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e246: 48 8b 00             	movq	(%rax), %rax
ffff80000010e249: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010e24d: e9 c2 ff ff ff       	jmp	0xffff80000010e214 <count_free_pages+0x44>
; 	return nfree_pages;
ffff80000010e252: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e256: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff80000010e25a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e25e: 5d                   	popq	%rbp
ffff80000010e25f: c3                   	retq

ffff80000010e260 <show_buddy_info>:
; {
ffff80000010e260: 55                   	pushq	%rbp
ffff80000010e261: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e264: 48 83 ec 30          	subq	$48, %rsp
; 	size_t nfree = 0;
ffff80000010e268: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	cprintf("Buddy allocator:\n");
ffff80000010e270: 48 bf e2 89 11 00 00 80 ff ff	movabsq	$-140737487205918, %rdi # imm = 0xFFFF8000001189E2
ffff80000010e27a: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010e284: 31 c0                	xorl	%eax, %eax
ffff80000010e286: ff d1                	callq	*%rcx
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e288: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010e290: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010e295: 0f 83 69 00 00 00    	jae	0xffff80000010e304 <show_buddy_info+0xa4>
; 		nfree_pages = count_free_pages(order);
ffff80000010e29b: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010e29f: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000010e2a9: ff d0                	callq	*%rax
ffff80000010e2ab: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		cprintf("  order #%u pages=%u\n", order, nfree_pages);
ffff80000010e2af: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff80000010e2b3: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000010e2b7: 48 bf 2c 92 11 00 00 80 ff ff	movabsq	$-140737487203796, %rdi # imm = 0xFFFF80000011922C
ffff80000010e2c1: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010e2cb: 31 c0                	xorl	%eax, %eax
ffff80000010e2cd: ff d1                	callq	*%rcx
; 		nfree += nfree_pages * (1 << (order + 12));
ffff80000010e2cf: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e2d3: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010e2d7: 48 83 c1 0c          	addq	$12, %rcx
ffff80000010e2db: ba 01 00 00 00       	movl	$1, %edx
ffff80000010e2e0: d3 e2                	shll	%cl, %edx
ffff80000010e2e2: 89 d1                	movl	%edx, %ecx
ffff80000010e2e4: 48 63 c9             	movslq	%ecx, %rcx
ffff80000010e2e7: 48 0f af c1          	imulq	%rcx, %rax
ffff80000010e2eb: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff80000010e2ef: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e2f3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e2f7: 48 83 c0 01          	addq	$1, %rax
ffff80000010e2fb: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010e2ff: e9 8c ff ff ff       	jmp	0xffff80000010e290 <show_buddy_info+0x30>
; 	cprintf("  free: %u kiB\n", nfree / 1024);
ffff80000010e304: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff80000010e308: 48 c1 ee 0a          	shrq	$10, %rsi
ffff80000010e30c: 48 bf 68 87 11 00 00 80 ff ff	movabsq	$-140737487206552, %rdi # imm = 0xFFFF800000118768
ffff80000010e316: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010e320: 31 c0                	xorl	%eax, %eax
ffff80000010e322: ff d1                	callq	*%rcx
; }
ffff80000010e324: 48 83 c4 30          	addq	$48, %rsp
ffff80000010e328: 5d                   	popq	%rbp
ffff80000010e329: c3                   	retq
ffff80000010e32a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e330 <count_total_free_pages>:
; {
ffff80000010e330: 55                   	pushq	%rbp
ffff80000010e331: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e334: 48 83 ec 30          	subq	$48, %rsp
; 	size_t nfree = 0;
ffff80000010e338: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e340: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010e348: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010e34d: 0f 83 45 00 00 00    	jae	0xffff80000010e398 <count_total_free_pages+0x68>
; 		nfree_pages = count_free_pages(order);
ffff80000010e353: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010e357: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000010e361: ff d0                	callq	*%rax
ffff80000010e363: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		nfree += nfree_pages * (1 << order);
ffff80000010e367: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e36b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010e36f: ba 01 00 00 00       	movl	$1, %edx
ffff80000010e374: d3 e2                	shll	%cl, %edx
ffff80000010e376: 89 d1                	movl	%edx, %ecx
ffff80000010e378: 48 63 c9             	movslq	%ecx, %rcx
ffff80000010e37b: 48 0f af c1          	imulq	%rcx, %rax
ffff80000010e37f: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff80000010e383: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e387: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e38b: 48 83 c0 01          	addq	$1, %rax
ffff80000010e38f: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010e393: e9 b0 ff ff ff       	jmp	0xffff80000010e348 <count_total_free_pages+0x18>
; 	return nfree;
ffff80000010e398: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e39c: 48 83 c4 30          	addq	$48, %rsp
ffff80000010e3a0: 5d                   	popq	%rbp
ffff80000010e3a1: c3                   	retq
ffff80000010e3a2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e3ac: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e3b0 <buddy_split>:
; {
ffff80000010e3b0: 55                   	pushq	%rbp
ffff80000010e3b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e3b4: 48 83 ec 30          	subq	$48, %rsp
ffff80000010e3b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010e3bc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	assert(lhs->pp_order >= req_order);
ffff80000010e3c0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e3c4: 8a 40 12             	movb	18(%rax), %al
ffff80000010e3c7: 24 7f                	andb	$127, %al
ffff80000010e3c9: 0f b6 c0             	movzbl	%al, %eax
ffff80000010e3cc: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff80000010e3d0: 0f 83 32 00 00 00    	jae	0xffff80000010e408 <buddy_split+0x58>
ffff80000010e3d6: 48 bf 84 8a 11 00 00 80 ff ff	movabsq	$-140737487205756, %rdi # imm = 0xFFFF800000118A84
ffff80000010e3e0: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000010e3ea: 48 b9 cf 8e 11 00 00 80 ff ff	movabsq	$-140737487204657, %rcx # imm = 0xFFFF800000118ECF
ffff80000010e3f4: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010e3fe: 31 c0                	xorl	%eax, %eax
ffff80000010e400: be 5f 00 00 00       	movl	$95, %esi
ffff80000010e405: 41 ff d0             	callq	*%r8
ffff80000010e408: e9 00 00 00 00       	jmp	0xffff80000010e40d <buddy_split+0x5d>
; 	while(lhs->pp_order > req_order){
ffff80000010e40d: e9 00 00 00 00       	jmp	0xffff80000010e412 <buddy_split+0x62>
ffff80000010e412: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e416: 8a 40 12             	movb	18(%rax), %al
ffff80000010e419: 24 7f                	andb	$127, %al
ffff80000010e41b: 0f b6 c0             	movzbl	%al, %eax
ffff80000010e41e: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff80000010e422: 0f 86 bf 00 00 00    	jbe	0xffff80000010e4e7 <buddy_split+0x137>
; 		physaddr_t page_addr = page2pa(lhs);
ffff80000010e428: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010e42c: 48 b8 00 e5 10 00 00 80 ff ff	movabsq	$-140737487248128, %rax # imm = 0xFFFF80000010E500
ffff80000010e436: ff d0                	callq	*%rax
ffff80000010e438: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 		physaddr_t buddy_addr = page_addr ^ (1 << (lhs->pp_order + PAGE_TABLE_SHIFT - 1));
ffff80000010e43c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e440: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010e444: 8a 49 12             	movb	18(%rcx), %cl
ffff80000010e447: 80 e1 7f             	andb	$127, %cl
ffff80000010e44a: 80 c1 0b             	addb	$11, %cl
ffff80000010e44d: ba 01 00 00 00       	movl	$1, %edx
ffff80000010e452: d3 e2                	shll	%cl, %edx
ffff80000010e454: 89 d1                	movl	%edx, %ecx
ffff80000010e456: 48 63 c9             	movslq	%ecx, %rcx
ffff80000010e459: 48 31 c8             	xorq	%rcx, %rax
ffff80000010e45c: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		struct page_info *buddy = pa2page(buddy_addr);
ffff80000010e460: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010e464: 48 b8 30 e5 10 00 00 80 ff ff	movabsq	$-140737487248080, %rax # imm = 0xFFFF80000010E530
ffff80000010e46e: ff d0                	callq	*%rax
ffff80000010e470: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		buddy->pp_order = lhs->pp_order - 1;
ffff80000010e474: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e478: 8a 50 12             	movb	18(%rax), %dl
ffff80000010e47b: 80 c2 ff             	addb	$-1, %dl
ffff80000010e47e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e482: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e485: 80 e2 7f             	andb	$127, %dl
ffff80000010e488: 80 e1 80             	andb	$-128, %cl
ffff80000010e48b: 08 d1                	orb	%dl, %cl
ffff80000010e48d: 88 48 12             	movb	%cl, 18(%rax)
; 		buddy->pp_free = true;
ffff80000010e490: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e494: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e497: 80 c9 80             	orb	$-128, %cl
ffff80000010e49a: 88 48 12             	movb	%cl, 18(%rax)
; 		lhs->pp_order--;
ffff80000010e49d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e4a1: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e4a4: 88 ca                	movb	%cl, %dl
ffff80000010e4a6: 80 c2 ff             	addb	$-1, %dl
ffff80000010e4a9: 80 e2 7f             	andb	$127, %dl
ffff80000010e4ac: 80 e1 80             	andb	$-128, %cl
ffff80000010e4af: 08 d1                	orb	%dl, %cl
ffff80000010e4b1: 88 48 12             	movb	%cl, 18(%rax)
; 		list_add(&buddy_free_list[lhs->pp_order], &buddy->pp_node);
ffff80000010e4b4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e4b8: 0f b6 40 12          	movzbl	18(%rax), %eax
ffff80000010e4bc: 83 e0 7f             	andl	$127, %eax
ffff80000010e4bf: 89 c7                	movl	%eax, %edi
ffff80000010e4c1: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010e4c5: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000010e4cf: 48 01 c7             	addq	%rax, %rdi
ffff80000010e4d2: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff80000010e4d6: 48 b8 90 0a 11 00 00 80 ff ff	movabsq	$-140737487238512, %rax # imm = 0xFFFF800000110A90
ffff80000010e4e0: ff d0                	callq	*%rax
; 	while(lhs->pp_order > req_order){
ffff80000010e4e2: e9 2b ff ff ff       	jmp	0xffff80000010e412 <buddy_split+0x62>
; 	return lhs;
ffff80000010e4e7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e4eb: 48 83 c4 30          	addq	$48, %rsp
ffff80000010e4ef: 5d                   	popq	%rbp
ffff80000010e4f0: c3                   	retq
ffff80000010e4f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e4fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010e500 <page2pa>:
; {
ffff80000010e500: 55                   	pushq	%rbp
ffff80000010e501: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e504: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010e508: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e50c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010e516: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010e519: 48 29 c8             	subq	%rcx, %rax
ffff80000010e51c: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010e520: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010e524: 5d                   	popq	%rbp
ffff80000010e525: c3                   	retq
ffff80000010e526: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010e530 <pa2page>:
; {
ffff80000010e530: 55                   	pushq	%rbp
ffff80000010e531: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e534: 48 83 ec 10          	subq	$16, %rsp
ffff80000010e538: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e53c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e540: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010e544: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010e54e: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010e551: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e554: 0f 82 27 00 00 00    	jb	0xffff80000010e581 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010e55a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff80000010e564: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000010e56e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010e578: 31 c0                	xorl	%eax, %eax
ffff80000010e57a: be 49 00 00 00       	movl	$73, %esi
ffff80000010e57f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff80000010e581: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010e58b: 48 8b 00             	movq	(%rax), %rax
ffff80000010e58e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010e592: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010e596: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010e59a: 48 01 c8             	addq	%rcx, %rax
ffff80000010e59d: 48 83 c4 10          	addq	$16, %rsp
ffff80000010e5a1: 5d                   	popq	%rbp
ffff80000010e5a2: c3                   	retq
ffff80000010e5a3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e5ad: 0f 1f 00             	nopl	(%rax)

ffff80000010e5b0 <buddy_merge>:
; {
ffff80000010e5b0: 55                   	pushq	%rbp
ffff80000010e5b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e5b4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010e5b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	unsigned int order = page->pp_order;
ffff80000010e5bc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e5c0: 8a 40 12             	movb	18(%rax), %al
ffff80000010e5c3: 24 7f                	andb	$127, %al
ffff80000010e5c5: 0f b6 c0             	movzbl	%al, %eax
ffff80000010e5c8: 89 45 f4             	movl	%eax, -12(%rbp)
; 	while(order < BUDDY_MAX_ORDER - 1){
ffff80000010e5cb: 83 7d f4 09          	cmpl	$9, -12(%rbp)
ffff80000010e5cf: 0f 83 18 02 00 00    	jae	0xffff80000010e7ed <buddy_merge+0x23d>
; 		physaddr_t page_addr = page2pa(page);
ffff80000010e5d5: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010e5d9: 48 b8 00 e5 10 00 00 80 ff ff	movabsq	$-140737487248128, %rax # imm = 0xFFFF80000010E500
ffff80000010e5e3: ff d0                	callq	*%rax
ffff80000010e5e5: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 		physaddr_t buddy_addr = page_addr ^ (1 << (order + PAGE_TABLE_SHIFT));
ffff80000010e5e9: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e5ed: 8b 4d f4             	movl	-12(%rbp), %ecx
ffff80000010e5f0: 83 c1 0c             	addl	$12, %ecx
ffff80000010e5f3: ba 01 00 00 00       	movl	$1, %edx
ffff80000010e5f8: d3 e2                	shll	%cl, %edx
ffff80000010e5fa: 89 d1                	movl	%edx, %ecx
ffff80000010e5fc: 48 63 c9             	movslq	%ecx, %rcx
ffff80000010e5ff: 48 31 c8             	xorq	%rcx, %rax
ffff80000010e602: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		struct page_info *buddy = pa2page(buddy_addr);
ffff80000010e606: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010e60a: 48 b8 30 e5 10 00 00 80 ff ff	movabsq	$-140737487248080, %rax # imm = 0xFFFF80000010E530
ffff80000010e614: ff d0                	callq	*%rax
ffff80000010e616: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		if(!buddy->pp_free){
ffff80000010e61a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e61e: 8a 40 12             	movb	18(%rax), %al
ffff80000010e621: c0 e8 07             	shrb	$7, %al
ffff80000010e624: 3c 00                	cmpb	$0, %al
ffff80000010e626: 0f 85 05 00 00 00    	jne	0xffff80000010e631 <buddy_merge+0x81>
; 			break;
ffff80000010e62c: e9 bc 01 00 00       	jmp	0xffff80000010e7ed <buddy_merge+0x23d>
; 		physaddr_t merged_page_addr = page_addr & ~(1 << (order + PAGE_TABLE_SHIFT));
ffff80000010e631: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e635: 8a 4d f4             	movb	-12(%rbp), %cl
ffff80000010e638: 80 c1 0c             	addb	$12, %cl
ffff80000010e63b: ba fe ff ff ff       	movl	$4294967294, %edx       # imm = 0xFFFFFFFE
ffff80000010e640: d3 c2                	roll	%cl, %edx
ffff80000010e642: 89 d1                	movl	%edx, %ecx
ffff80000010e644: 48 63 c9             	movslq	%ecx, %rcx
ffff80000010e647: 48 21 c8             	andq	%rcx, %rax
ffff80000010e64a: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		struct page_info *merged_page = pa2page(merged_page_addr);
ffff80000010e64e: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff80000010e652: 48 b8 30 e5 10 00 00 80 ff ff	movabsq	$-140737487248080, %rax # imm = 0xFFFF80000010E530
ffff80000010e65c: ff d0                	callq	*%rax
ffff80000010e65e: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		struct list *next = NULL;
ffff80000010e662: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
; 		struct list* entry = &page->pp_node;
ffff80000010e66a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e66e: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		page->pp_free = false;
ffff80000010e672: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e676: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e679: 80 e1 7f             	andb	$127, %cl
ffff80000010e67c: 88 48 12             	movb	%cl, 18(%rax)
; 		buddy->pp_free = false;
ffff80000010e67f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e683: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e686: 80 e1 7f             	andb	$127, %cl
ffff80000010e689: 88 48 12             	movb	%cl, 18(%rax)
; 		int entries_removed = 0;
ffff80000010e68c: c7 45 b4 00 00 00 00 	movl	$0, -76(%rbp)
; 		list_foreach_safe(&buddy_free_list[order], entry, next){
ffff80000010e693: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010e696: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010e69a: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010e6a4: 48 01 c8             	addq	%rcx, %rax
ffff80000010e6a7: 48 8b 00             	movq	(%rax), %rax
ffff80000010e6aa: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010e6ae: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010e6b2: 48 8b 00             	movq	(%rax), %rax
ffff80000010e6b5: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010e6b9: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010e6bd: 8b 4d f4             	movl	-12(%rbp), %ecx
ffff80000010e6c0: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010e6c4: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010e6ce: 48 01 d1             	addq	%rdx, %rcx
ffff80000010e6d1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e6d4: 0f 84 6c 00 00 00    	je	0xffff80000010e746 <buddy_merge+0x196>
; 			if(entry == &page->pp_node || entry == &buddy->pp_node){
ffff80000010e6da: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010e6de: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010e6e2: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e6e5: 0f 84 11 00 00 00    	je	0xffff80000010e6fc <buddy_merge+0x14c>
ffff80000010e6eb: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010e6ef: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000010e6f3: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010e6f6: 0f 85 2d 00 00 00    	jne	0xffff80000010e729 <buddy_merge+0x179>
; 				list_del(entry);
ffff80000010e6fc: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff80000010e700: 48 b8 40 0a 11 00 00 80 ff ff	movabsq	$-140737487238592, %rax # imm = 0xFFFF800000110A40
ffff80000010e70a: ff d0                	callq	*%rax
; 				entries_removed++;
ffff80000010e70c: 8b 45 b4             	movl	-76(%rbp), %eax
ffff80000010e70f: 83 c0 01             	addl	$1, %eax
ffff80000010e712: 89 45 b4             	movl	%eax, -76(%rbp)
; 				if(entries_removed == 2){
ffff80000010e715: 83 7d b4 02          	cmpl	$2, -76(%rbp)
ffff80000010e719: 0f 85 05 00 00 00    	jne	0xffff80000010e724 <buddy_merge+0x174>
; 					break;
ffff80000010e71f: e9 22 00 00 00       	jmp	0xffff80000010e746 <buddy_merge+0x196>
; 			}	
ffff80000010e724: e9 00 00 00 00       	jmp	0xffff80000010e729 <buddy_merge+0x179>
; 		}
ffff80000010e729: e9 00 00 00 00       	jmp	0xffff80000010e72e <buddy_merge+0x17e>
; 		list_foreach_safe(&buddy_free_list[order], entry, next){
ffff80000010e72e: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010e732: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010e736: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010e73a: 48 8b 00             	movq	(%rax), %rax
ffff80000010e73d: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010e741: e9 73 ff ff ff       	jmp	0xffff80000010e6b9 <buddy_merge+0x109>
; 		assert(entries_removed == 2);
ffff80000010e746: e9 00 00 00 00       	jmp	0xffff80000010e74b <buddy_merge+0x19b>
ffff80000010e74b: 83 7d b4 02          	cmpl	$2, -76(%rbp)
ffff80000010e74f: 0f 84 32 00 00 00    	je	0xffff80000010e787 <buddy_merge+0x1d7>
ffff80000010e755: 48 bf 84 8a 11 00 00 80 ff ff	movabsq	$-140737487205756, %rdi # imm = 0xFFFF800000118A84
ffff80000010e75f: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000010e769: 48 b9 78 87 11 00 00 80 ff ff	movabsq	$-140737487206536, %rcx # imm = 0xFFFF800000118778
ffff80000010e773: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010e77d: 31 c0                	xorl	%eax, %eax
ffff80000010e77f: be a5 00 00 00       	movl	$165, %esi
ffff80000010e784: 41 ff d0             	callq	*%r8
ffff80000010e787: e9 00 00 00 00       	jmp	0xffff80000010e78c <buddy_merge+0x1dc>
; 		order++;
ffff80000010e78c: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010e78f: 83 c0 01             	addl	$1, %eax
ffff80000010e792: 89 45 f4             	movl	%eax, -12(%rbp)
; 		merged_page->pp_order = order;
ffff80000010e795: 8a 55 f4             	movb	-12(%rbp), %dl
ffff80000010e798: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010e79c: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e79f: 80 e2 7f             	andb	$127, %dl
ffff80000010e7a2: 80 e1 80             	andb	$-128, %cl
ffff80000010e7a5: 08 d1                	orb	%dl, %cl
ffff80000010e7a7: 88 48 12             	movb	%cl, 18(%rax)
; 		list_insert_before(&buddy_free_list[order], &merged_page->pp_node);
ffff80000010e7aa: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010e7ad: 89 c7                	movl	%eax, %edi
ffff80000010e7af: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010e7b3: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000010e7bd: 48 01 c7             	addq	%rax, %rdi
ffff80000010e7c0: 48 8b 75 c8          	movq	-56(%rbp), %rsi
ffff80000010e7c4: 48 b8 f0 09 11 00 00 80 ff ff	movabsq	$-140737487238672, %rax # imm = 0xFFFF8000001109F0
ffff80000010e7ce: ff d0                	callq	*%rax
; 		merged_page->pp_free = true;
ffff80000010e7d0: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010e7d4: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e7d7: 80 e1 7f             	andb	$127, %cl
ffff80000010e7da: 80 c9 80             	orb	$-128, %cl
ffff80000010e7dd: 88 48 12             	movb	%cl, 18(%rax)
; 		page = merged_page;
ffff80000010e7e0: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010e7e4: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	while(order < BUDDY_MAX_ORDER - 1){
ffff80000010e7e8: e9 de fd ff ff       	jmp	0xffff80000010e5cb <buddy_merge+0x1b>
; 	return page;
ffff80000010e7ed: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e7f1: 48 83 c4 50          	addq	$80, %rsp
ffff80000010e7f5: 5d                   	popq	%rbp
ffff80000010e7f6: c3                   	retq
ffff80000010e7f7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e800 <buddy_find>:
; {	
ffff80000010e800: 55                   	pushq	%rbp
ffff80000010e801: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e804: 48 83 ec 30          	subq	$48, %rsp
ffff80000010e808: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
ffff80000010e80c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e810: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010e814: 48 83 7d d8 0a       	cmpq	$10, -40(%rbp)
ffff80000010e819: 0f 83 90 00 00 00    	jae	0xffff80000010e8af <buddy_find+0xaf>
; 		head = &buddy_free_list[ord]; 
ffff80000010e81f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e823: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010e827: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010e831: 48 01 c8             	addq	%rcx, %rax
ffff80000010e834: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 		if(!list_is_empty(head)) {
ffff80000010e838: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010e83c: 48 b8 d0 e8 10 00 00 80 ff ff	movabsq	$-140737487247152, %rax # imm = 0xFFFF80000010E8D0
ffff80000010e846: ff d0                	callq	*%rax
ffff80000010e848: 83 f8 00             	cmpl	$0, %eax
ffff80000010e84b: 0f 85 48 00 00 00    	jne	0xffff80000010e899 <buddy_find+0x99>
; 			page = buddy_split(container_of(head->next, struct page_info, pp_node), req_order);
ffff80000010e851: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010e855: 48 8b 38             	movq	(%rax), %rdi
ffff80000010e858: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000010e85c: 48 b8 b0 e3 10 00 00 80 ff ff	movabsq	$-140737487248464, %rax # imm = 0xFFFF80000010E3B0
ffff80000010e866: ff d0                	callq	*%rax
ffff80000010e868: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 			list_del(&page->pp_node);
ffff80000010e86c: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010e870: 48 b8 40 0a 11 00 00 80 ff ff	movabsq	$-140737487238592, %rax # imm = 0xFFFF800000110A40
ffff80000010e87a: ff d0                	callq	*%rax
; 			page->pp_free = false;
ffff80000010e87c: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e880: 8a 48 12             	movb	18(%rax), %cl
ffff80000010e883: 80 e1 7f             	andb	$127, %cl
ffff80000010e886: 80 c9 00             	orb	$0, %cl
ffff80000010e889: 88 48 12             	movb	%cl, 18(%rax)
; 			return page;
ffff80000010e88c: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010e890: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000010e894: e9 1e 00 00 00       	jmp	0xffff80000010e8b7 <buddy_find+0xb7>
; 	}
ffff80000010e899: e9 00 00 00 00       	jmp	0xffff80000010e89e <buddy_find+0x9e>
; 	for(size_t ord = req_order; ord < BUDDY_MAX_ORDER; ord++){
ffff80000010e89e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010e8a2: 48 83 c0 01          	addq	$1, %rax
ffff80000010e8a6: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010e8aa: e9 65 ff ff ff       	jmp	0xffff80000010e814 <buddy_find+0x14>
; 	return NULL;
ffff80000010e8af: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
ffff80000010e8b7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e8bb: 48 83 c4 30          	addq	$48, %rsp
ffff80000010e8bf: 5d                   	popq	%rbp
ffff80000010e8c0: c3                   	retq
ffff80000010e8c1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e8cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010e8d0 <list_is_empty>:
; {
ffff80000010e8d0: 55                   	pushq	%rbp
ffff80000010e8d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e8d4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return head->next == head;
ffff80000010e8d8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e8dc: 48 8b 00             	movq	(%rax), %rax
ffff80000010e8df: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff80000010e8e3: 0f 94 c0             	sete	%al
ffff80000010e8e6: 24 01                	andb	$1, %al
ffff80000010e8e8: 0f b6 c0             	movzbl	%al, %eax
ffff80000010e8eb: 5d                   	popq	%rbp
ffff80000010e8ec: c3                   	retq
ffff80000010e8ed: 0f 1f 00             	nopl	(%rax)

ffff80000010e8f0 <page_alloc>:
; {
ffff80000010e8f0: 55                   	pushq	%rbp
ffff80000010e8f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e8f4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010e8f8: 89 7d fc             	movl	%edi, -4(%rbp)
; 	page = buddy_find(0);
ffff80000010e8fb: 31 c0                	xorl	%eax, %eax
ffff80000010e8fd: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff80000010e907: 31 c9                	xorl	%ecx, %ecx
ffff80000010e909: 89 cf                	movl	%ecx, %edi
ffff80000010e90b: ff d0                	callq	*%rax
ffff80000010e90d: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	if(page) {
ffff80000010e911: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000010e916: 0f 84 50 00 00 00    	je	0xffff80000010e96c <page_alloc+0x7c>
; 		if(alloc_flags & ALLOC_ZERO) {
ffff80000010e91c: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010e91f: 83 e0 01             	andl	$1, %eax
ffff80000010e922: 83 f8 00             	cmpl	$0, %eax
ffff80000010e925: 0f 84 3c 00 00 00    	je	0xffff80000010e967 <page_alloc+0x77>
; 			memset(page2kva(page), 0, 1 << (page->pp_order + PAGE_TABLE_SHIFT));
ffff80000010e92b: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010e92f: 48 b8 80 e9 10 00 00 80 ff ff	movabsq	$-140737487246976, %rax # imm = 0xFFFF80000010E980
ffff80000010e939: ff d0                	callq	*%rax
ffff80000010e93b: 48 89 c7             	movq	%rax, %rdi
ffff80000010e93e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e942: 8a 40 12             	movb	18(%rax), %al
ffff80000010e945: 24 7f                	andb	$127, %al
ffff80000010e947: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010e94a: 83 c1 0c             	addl	$12, %ecx
ffff80000010e94d: b8 01 00 00 00       	movl	$1, %eax
ffff80000010e952: d3 e0                	shll	%cl, %eax
ffff80000010e954: 48 63 d0             	movslq	%eax, %rdx
ffff80000010e957: 31 c0                	xorl	%eax, %eax
ffff80000010e959: 48 b8 00 28 11 00 00 80 ff ff	movabsq	$-140737487230976, %rax # imm = 0xFFFF800000112800
ffff80000010e963: 31 f6                	xorl	%esi, %esi
ffff80000010e965: ff d0                	callq	*%rax
; 	}
ffff80000010e967: e9 00 00 00 00       	jmp	0xffff80000010e96c <page_alloc+0x7c>
; 	return page;
ffff80000010e96c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010e970: 48 83 c4 10          	addq	$16, %rsp
ffff80000010e974: 5d                   	popq	%rbp
ffff80000010e975: c3                   	retq
ffff80000010e976: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010e980 <page2kva>:
; {
ffff80000010e980: 55                   	pushq	%rbp
ffff80000010e981: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e984: 48 83 ec 10          	subq	$16, %rsp
ffff80000010e988: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000010e98c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010e990: 48 b8 00 e5 10 00 00 80 ff ff	movabsq	$-140737487248128, %rax # imm = 0xFFFF80000010E500
ffff80000010e99a: ff d0                	callq	*%rax
ffff80000010e99c: 48 89 c2             	movq	%rax, %rdx
ffff80000010e99f: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff80000010e9a9: 48 b8 40 ee 10 00 00 80 ff ff	movabsq	$-140737487245760, %rax # imm = 0xFFFF80000010EE40
ffff80000010e9b3: be 50 00 00 00       	movl	$80, %esi
ffff80000010e9b8: ff d0                	callq	*%rax
ffff80000010e9ba: 48 83 c4 10          	addq	$16, %rsp
ffff80000010e9be: 5d                   	popq	%rbp
ffff80000010e9bf: c3                   	retq

ffff80000010e9c0 <page_free>:
; {
ffff80000010e9c0: 55                   	pushq	%rbp
ffff80000010e9c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e9c4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010e9c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if(pp->pp_ref != 0){
ffff80000010e9cc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010e9d0: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff80000010e9d4: 83 f8 00             	cmpl	$0, %eax
ffff80000010e9d7: 0f 84 27 00 00 00    	je	0xffff80000010ea04 <page_free+0x44>
; 		panic("page_free called on page that is still in use");
ffff80000010e9dd: 48 bf 84 8a 11 00 00 80 ff ff	movabsq	$-140737487205756, %rdi # imm = 0xFFFF800000118A84
ffff80000010e9e7: 48 ba 42 92 11 00 00 80 ff ff	movabsq	$-140737487203774, %rdx # imm = 0xFFFF800000119242
ffff80000010e9f1: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010e9fb: 31 c0                	xorl	%eax, %eax
ffff80000010e9fd: be f7 00 00 00       	movl	$247, %esi
ffff80000010ea02: ff d1                	callq	*%rcx
; 	pp->pp_free = true;
ffff80000010ea04: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010ea08: 8a 48 12             	movb	18(%rax), %cl
ffff80000010ea0b: 80 c9 80             	orb	$-128, %cl
ffff80000010ea0e: 88 48 12             	movb	%cl, 18(%rax)
; 	list_insert_before(&buddy_free_list[pp->pp_order], &pp->pp_node);
ffff80000010ea11: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010ea15: 0f b6 40 12          	movzbl	18(%rax), %eax
ffff80000010ea19: 83 e0 7f             	andl	$127, %eax
ffff80000010ea1c: 89 c7                	movl	%eax, %edi
ffff80000010ea1e: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010ea22: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000010ea2c: 48 01 c7             	addq	%rax, %rdi
ffff80000010ea2f: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000010ea33: 48 b8 f0 09 11 00 00 80 ff ff	movabsq	$-140737487238672, %rax # imm = 0xFFFF8000001109F0
ffff80000010ea3d: ff d0                	callq	*%rax
; 	buddy_merge(pp);
ffff80000010ea3f: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010ea43: 48 b8 b0 e5 10 00 00 80 ff ff	movabsq	$-140737487247952, %rax # imm = 0xFFFF80000010E5B0
ffff80000010ea4d: ff d0                	callq	*%rax
; }
ffff80000010ea4f: 48 83 c4 10          	addq	$16, %rsp
ffff80000010ea53: 5d                   	popq	%rbp
ffff80000010ea54: c3                   	retq
ffff80000010ea55: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ea5f: 90                   	nop

ffff80000010ea60 <page_decref>:
; {
ffff80000010ea60: 55                   	pushq	%rbp
ffff80000010ea61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ea64: 48 83 ec 10          	subq	$16, %rsp
ffff80000010ea68: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (--pp->pp_ref == 0) {
ffff80000010ea6c: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010ea70: 66 8b 41 10          	movw	16(%rcx), %ax
ffff80000010ea74: 66 83 c0 ff          	addw	$-1, %ax
ffff80000010ea78: 66 89 41 10          	movw	%ax, 16(%rcx)
ffff80000010ea7c: 0f b7 c0             	movzwl	%ax, %eax
ffff80000010ea7f: 83 f8 00             	cmpl	$0, %eax
ffff80000010ea82: 0f 85 10 00 00 00    	jne	0xffff80000010ea98 <page_decref+0x38>
; 		page_free(pp);
ffff80000010ea88: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010ea8c: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000010ea96: ff d0                	callq	*%rax
; }
ffff80000010ea98: 48 83 c4 10          	addq	$16, %rsp
ffff80000010ea9c: 5d                   	popq	%rbp
ffff80000010ea9d: c3                   	retq
ffff80000010ea9e: 66 90                	nop

ffff80000010eaa0 <buddy_migrate>:
; {
ffff80000010eaa0: 55                   	pushq	%rbp
ffff80000010eaa1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eaa4: 48 83 ec 20          	subq	$32, %rsp
; 	for (i = 0; i < npages; ++i) {
ffff80000010eaa8: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010eab0: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010eab4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010eabe: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010eac1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010eac4: 0f 83 71 00 00 00    	jae	0xffff80000010eb3b <buddy_migrate+0x9b>
; 		page = pages + i;
ffff80000010eaca: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010ead4: 48 8b 00             	movq	(%rax), %rax
ffff80000010ead7: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010eadb: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010eadf: 48 01 c8             	addq	%rcx, %rax
ffff80000010eae2: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 		node = &page->pp_node;
ffff80000010eae6: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010eaea: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		node->next = update_ptr(node->next);
ffff80000010eaee: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eaf2: 48 8b 38             	movq	(%rax), %rdi
ffff80000010eaf5: 48 b8 e0 eb 10 00 00 80 ff ff	movabsq	$-140737487246368, %rax # imm = 0xFFFF80000010EBE0
ffff80000010eaff: ff d0                	callq	*%rax
ffff80000010eb01: 48 89 c1             	movq	%rax, %rcx
ffff80000010eb04: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb08: 48 89 08             	movq	%rcx, (%rax)
; 		node->prev = update_ptr(node->prev);
ffff80000010eb0b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb0f: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000010eb13: 48 b8 e0 eb 10 00 00 80 ff ff	movabsq	$-140737487246368, %rax # imm = 0xFFFF80000010EBE0
ffff80000010eb1d: ff d0                	callq	*%rax
ffff80000010eb1f: 48 89 c1             	movq	%rax, %rcx
ffff80000010eb22: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb26: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	for (i = 0; i < npages; ++i) {
ffff80000010eb2a: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010eb2e: 48 83 c0 01          	addq	$1, %rax
ffff80000010eb32: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010eb36: e9 75 ff ff ff       	jmp	0xffff80000010eab0 <buddy_migrate+0x10>
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010eb3b: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010eb43: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010eb48: 0f 83 66 00 00 00    	jae	0xffff80000010ebb4 <buddy_migrate+0x114>
; 		node = buddy_free_list + i;
ffff80000010eb4e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010eb52: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010eb56: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010eb60: 48 01 c8             	addq	%rcx, %rax
ffff80000010eb63: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		node->next = update_ptr(node->next);
ffff80000010eb67: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb6b: 48 8b 38             	movq	(%rax), %rdi
ffff80000010eb6e: 48 b8 e0 eb 10 00 00 80 ff ff	movabsq	$-140737487246368, %rax # imm = 0xFFFF80000010EBE0
ffff80000010eb78: ff d0                	callq	*%rax
ffff80000010eb7a: 48 89 c1             	movq	%rax, %rcx
ffff80000010eb7d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb81: 48 89 08             	movq	%rcx, (%rax)
; 		node->prev = update_ptr(node->prev);
ffff80000010eb84: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb88: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000010eb8c: 48 b8 e0 eb 10 00 00 80 ff ff	movabsq	$-140737487246368, %rax # imm = 0xFFFF80000010EBE0
ffff80000010eb96: ff d0                	callq	*%rax
ffff80000010eb98: 48 89 c1             	movq	%rax, %rcx
ffff80000010eb9b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010eb9f: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010eba3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010eba7: 48 83 c0 01          	addq	$1, %rax
ffff80000010ebab: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010ebaf: e9 8f ff ff ff       	jmp	0xffff80000010eb43 <buddy_migrate+0xa3>
; 	pages = (struct page_info *)KPAGES;
ffff80000010ebb4: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010ebbe: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff80000010ebc8: 48 89 08             	movq	%rcx, (%rax)
; }
ffff80000010ebcb: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ebcf: 5d                   	popq	%rbp
ffff80000010ebd0: c3                   	retq
ffff80000010ebd1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ebdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ebe0 <update_ptr>:
; {
ffff80000010ebe0: 55                   	pushq	%rbp
ffff80000010ebe1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ebe4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010ebe8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (!in_page_range(p))
ffff80000010ebec: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010ebf0: 48 b8 b0 ee 10 00 00 80 ff ff	movabsq	$-140737487245648, %rax # imm = 0xFFFF80000010EEB0
ffff80000010ebfa: ff d0                	callq	*%rax
ffff80000010ebfc: 83 f8 00             	cmpl	$0, %eax
ffff80000010ebff: 0f 85 0d 00 00 00    	jne	0xffff80000010ec12 <update_ptr+0x32>
; 		return p;
ffff80000010ec05: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010ec09: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000010ec0d: e9 25 00 00 00       	jmp	0xffff80000010ec37 <update_ptr+0x57>
; 	return (void *)((uintptr_t)p + KPAGES - (uintptr_t)pages);
ffff80000010ec12: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010ec16: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff80000010ec20: 48 01 c8             	addq	%rcx, %rax
ffff80000010ec23: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010ec2d: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010ec30: 48 29 c8             	subq	%rcx, %rax
ffff80000010ec33: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff80000010ec37: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010ec3b: 48 83 c4 10          	addq	$16, %rsp
ffff80000010ec3f: 5d                   	popq	%rbp
ffff80000010ec40: c3                   	retq
ffff80000010ec41: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ec4b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ec50 <buddy_map_chunk>:
; {
ffff80000010ec50: 55                   	pushq	%rbp
ffff80000010ec51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ec54: 48 81 ec 90 00 00 00 	subq	$144, %rsp
ffff80000010ec5b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000010ec5f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	size_t nblocks = (1 << (12 + BUDDY_MAX_ORDER - 1)) / PAGE_SIZE;
ffff80000010ec63: 48 c7 45 c8 00 02 00 00      	movq	$512, -56(%rbp) # imm = 0x200
; 	size_t nalloc = ROUNDUP(nblocks * sizeof *page, PAGE_SIZE) / PAGE_SIZE;
ffff80000010ec6b: 48 c7 45 b8 00 10 00 00      	movq	$4096, -72(%rbp) # imm = 0x1000
ffff80000010ec73: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010ec77: 48 c1 e0 05          	shlq	$5, %rax
ffff80000010ec7b: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010ec7f: 48 8d 44 08 ff       	leaq	-1(%rax,%rcx), %rax
ffff80000010ec84: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010ec88: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000010ec8c: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff80000010ec93: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010ec97: 31 d2                	xorl	%edx, %edx
ffff80000010ec99: 48 89 95 78 ff ff ff 	movq	%rdx, -136(%rbp)
ffff80000010eca0: 48 f7 f1             	divq	%rcx
ffff80000010eca3: 48 8b 85 70 ff ff ff 	movq	-144(%rbp), %rax
ffff80000010ecaa: 48 89 d1             	movq	%rdx, %rcx
ffff80000010ecad: 48 8b 95 78 ff ff ff 	movq	-136(%rbp), %rdx
ffff80000010ecb4: 48 29 c8             	subq	%rcx, %rax
ffff80000010ecb7: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff80000010ecbb: 48 8b 45 a0          	movq	-96(%rbp), %rax
ffff80000010ecbf: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010ecc3: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff80000010ecc7: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010eccb: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	index = ROUNDDOWN(index, nblocks);
ffff80000010eccf: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ecd3: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff80000010ecd7: 48 8b 45 90          	movq	-112(%rbp), %rax
ffff80000010ecdb: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff80000010ecdf: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff80000010ece3: 48 f7 f1             	divq	%rcx
ffff80000010ece6: 48 8b 45 80          	movq	-128(%rbp), %rax
ffff80000010ecea: 48 29 d0             	subq	%rdx, %rax
ffff80000010eced: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff80000010ecf1: 48 8b 45 88          	movq	-120(%rbp), %rax
ffff80000010ecf5: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	base = pages + index;
ffff80000010ecf9: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010ed03: 48 8b 00             	movq	(%rax), %rax
ffff80000010ed06: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ed0a: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010ed0e: 48 01 c8             	addq	%rcx, %rax
ffff80000010ed11: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < nalloc; ++i) {
ffff80000010ed15: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff80000010ed1d: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010ed21: 48 3b 45 c0          	cmpq	-64(%rbp), %rax
ffff80000010ed25: 0f 83 94 00 00 00    	jae	0xffff80000010edbf <buddy_map_chunk+0x16f>
; 		page = page_alloc(ALLOC_ZERO);
ffff80000010ed2b: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000010ed35: bf 01 00 00 00       	movl	$1, %edi
ffff80000010ed3a: ff d0                	callq	*%rax
ffff80000010ed3c: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if (!page) {
ffff80000010ed40: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000010ed45: 0f 85 0c 00 00 00    	jne	0xffff80000010ed57 <buddy_map_chunk+0x107>
; 			return -1;
ffff80000010ed4b: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000010ed52: e9 d1 00 00 00       	jmp	0xffff80000010ee28 <buddy_map_chunk+0x1d8>
; 		++page->pp_ref;
ffff80000010ed57: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010ed5b: 66 8b 48 10          	movw	16(%rax), %cx
ffff80000010ed5f: 66 83 c1 01          	addw	$1, %cx
ffff80000010ed63: 66 89 48 10          	movw	%cx, 16(%rax)
; 		if (page_insert(pml4, page, (char *)base + i * PAGE_SIZE,
ffff80000010ed67: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010ed6b: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff80000010ed6f: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff80000010ed73: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010ed77: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010ed7b: 48 01 c2             	addq	%rax, %rdx
ffff80000010ed7e: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff80000010ed88: 48 b9 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rcx # imm = 0x8000000000000003
ffff80000010ed92: ff d0                	callq	*%rax
; 		    PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC) < 0) {
ffff80000010ed94: 83 f8 00             	cmpl	$0, %eax
; 		if (page_insert(pml4, page, (char *)base + i * PAGE_SIZE,
ffff80000010ed97: 0f 8d 0c 00 00 00    	jge	0xffff80000010eda9 <buddy_map_chunk+0x159>
; 			return -1;
ffff80000010ed9d: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000010eda4: e9 7f 00 00 00       	jmp	0xffff80000010ee28 <buddy_map_chunk+0x1d8>
; 	}
ffff80000010eda9: e9 00 00 00 00       	jmp	0xffff80000010edae <buddy_map_chunk+0x15e>
; 	for (i = 0; i < nalloc; ++i) {
ffff80000010edae: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010edb2: 48 83 c0 01          	addq	$1, %rax
ffff80000010edb6: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff80000010edba: e9 5e ff ff ff       	jmp	0xffff80000010ed1d <buddy_map_chunk+0xcd>
; 	for (i = 0; i < nblocks; ++i) {
ffff80000010edbf: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff80000010edc7: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010edcb: 48 3b 45 c8          	cmpq	-56(%rbp), %rax
ffff80000010edcf: 0f 83 34 00 00 00    	jae	0xffff80000010ee09 <buddy_map_chunk+0x1b9>
; 		page = base + i;
ffff80000010edd5: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010edd9: 48 8b 4d 98          	movq	-104(%rbp), %rcx
ffff80000010eddd: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010ede1: 48 01 c8             	addq	%rcx, %rax
ffff80000010ede4: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		list_init(&page->pp_node);
ffff80000010ede8: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010edec: 48 b8 70 09 11 00 00 80 ff ff	movabsq	$-140737487238800, %rax # imm = 0xFFFF800000110970
ffff80000010edf6: ff d0                	callq	*%rax
; 	for (i = 0; i < nblocks; ++i) {
ffff80000010edf8: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000010edfc: 48 83 c0 01          	addq	$1, %rax
ffff80000010ee00: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff80000010ee04: e9 be ff ff ff       	jmp	0xffff80000010edc7 <buddy_map_chunk+0x177>
; 	npages = index + nblocks;
ffff80000010ee09: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ee0d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010ee11: 48 01 c1             	addq	%rax, %rcx
ffff80000010ee14: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010ee1e: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff80000010ee21: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000010ee28: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010ee2b: 48 81 c4 90 00 00 00 	addq	$144, %rsp
ffff80000010ee32: 5d                   	popq	%rbp
ffff80000010ee33: c3                   	retq
ffff80000010ee34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ee3e: 66 90                	nop

ffff80000010ee40 <_kaddr>:
; {
ffff80000010ee40: 55                   	pushq	%rbp
ffff80000010ee41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ee44: 48 83 ec 20          	subq	$32, %rsp
ffff80000010ee48: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010ee4c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010ee4f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ee53: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ee57: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010ee5b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010ee65: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010ee68: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010ee6b: 0f 82 24 00 00 00    	jb	0xffff80000010ee95 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010ee71: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010ee75: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010ee78: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ee7c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff80000010ee86: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010ee90: 31 c0                	xorl	%eax, %eax
ffff80000010ee92: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010ee95: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010ee9f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010eea3: 48 83 c4 20          	addq	$32, %rsp
ffff80000010eea7: 5d                   	popq	%rbp
ffff80000010eea8: c3                   	retq
ffff80000010eea9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010eeb0 <in_page_range>:
; {
ffff80000010eeb0: 55                   	pushq	%rbp
ffff80000010eeb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eeb4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return ((uintptr_t)pages <= (uintptr_t)p &&
ffff80000010eeb8: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010eec2: 48 8b 08             	movq	(%rax), %rcx
ffff80000010eec5: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010eec9: 31 c0                	xorl	%eax, %eax
ffff80000010eecb: 48 39 d1             	cmpq	%rdx, %rcx
ffff80000010eece: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010eed1: 0f 87 2e 00 00 00    	ja	0xffff80000010ef05 <in_page_range+0x55>
; 	        (uintptr_t)p < (uintptr_t)(pages + npages));
ffff80000010eed7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010eedb: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010eee5: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010eee8: 48 ba e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rdx # imm = 0xFFFF80000011D2E0
ffff80000010eef2: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010eef5: 48 c1 e2 05          	shlq	$5, %rdx
ffff80000010eef9: 48 01 d1             	addq	%rdx, %rcx
ffff80000010eefc: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010eeff: 0f 92 c0             	setb	%al
ffff80000010ef02: 88 45 f7             	movb	%al, -9(%rbp)
ffff80000010ef05: 8a 45 f7             	movb	-9(%rbp), %al
; 	return ((uintptr_t)pages <= (uintptr_t)p &&
ffff80000010ef08: 24 01                	andb	$1, %al
ffff80000010ef0a: 0f b6 c0             	movzbl	%al, %eax
ffff80000010ef0d: 5d                   	popq	%rbp
ffff80000010ef0e: c3                   	retq
ffff80000010ef0f: cc                   	int3

ffff80000010ef10 <pml4_setup>:
; {
ffff80000010ef10: 55                   	pushq	%rbp
ffff80000010ef11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ef14: 48 83 ec 30          	subq	$48, %rsp
ffff80000010ef18: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	kernel_pml4_page = page_alloc(ALLOC_ZERO);
ffff80000010ef1c: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000010ef26: bf 01 00 00 00       	movl	$1, %edi
ffff80000010ef2b: ff d0                	callq	*%rax
ffff80000010ef2d: 48 89 c1             	movq	%rax, %rcx
ffff80000010ef30: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000010ef3a: 48 89 08             	movq	%rcx, (%rax)
; 	if (!kernel_pml4_page) {
ffff80000010ef3d: 48 8b 00             	movq	(%rax), %rax
ffff80000010ef40: 48 83 f8 00          	cmpq	$0, %rax
ffff80000010ef44: 0f 85 27 00 00 00    	jne	0xffff80000010ef71 <pml4_setup+0x61>
; 		panic("unable to allocate the PML4!");
ffff80000010ef4a: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010ef54: 48 ba 10 95 11 00 00 80 ff ff	movabsq	$-140737487203056, %rdx # imm = 0xFFFF800000119510
ffff80000010ef5e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010ef68: 31 c0                	xorl	%eax, %eax
ffff80000010ef6a: be 1b 00 00 00       	movl	$27, %esi
ffff80000010ef6f: ff d1                	callq	*%rcx
; 	kernel_pml4 = page2kva(kernel_pml4_page);
ffff80000010ef71: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000010ef7b: 48 8b 38             	movq	(%rax), %rdi
ffff80000010ef7e: 48 b8 80 f0 10 00 00 80 ff ff	movabsq	$-140737487245184, %rax # imm = 0xFFFF80000010F080
ffff80000010ef88: ff d0                	callq	*%rax
ffff80000010ef8a: 48 89 c1             	movq	%rax, %rcx
ffff80000010ef8d: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000010ef97: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010ef9b: 48 89 08             	movq	%rcx, (%rax)
ffff80000010ef9e: 48 b9 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rcx # imm = 0x8000000000000003
; 	uint64_t kflags = PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC;
ffff80000010efa8: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 	boot_map_kernel(kernel_pml4, (struct elf*) boot_info->elf_hdr);
ffff80000010efac: 48 8b 38             	movq	(%rax), %rdi
ffff80000010efaf: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010efb3: 48 8b 70 08          	movq	8(%rax), %rsi
ffff80000010efb7: 48 b8 20 3c 11 00 00 80 ff ff	movabsq	$-140737487225824, %rax # imm = 0xFFFF800000113C20
ffff80000010efc1: ff d0                	callq	*%rax
ffff80000010efc3: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	boot_map_region(kernel_pml4, (void*) KSTACK_TOP, KSTACK_SIZE, (physaddr_t) bootstack, kflags);
ffff80000010efc7: 48 8b 38             	movq	(%rax), %rdi
ffff80000010efca: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff80000010efce: 48 b9 00 10 10 00 00 00 00 00	movabsq	$1052672, %rcx  # imm = 0x101000
ffff80000010efd8: 48 b8 30 39 11 00 00 80 ff ff	movabsq	$-140737487226576, %rax # imm = 0xFFFF800000113930
ffff80000010efe2: 48 be 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rsi # imm = 0xFFFFFE8000000000
ffff80000010efec: ba 00 80 00 00       	movl	$32768, %edx            # imm = 0x8000
ffff80000010eff1: ff d0                	callq	*%rax
ffff80000010eff3: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	boot_map_region(kernel_pml4, (void*) KPAGES, npages * sizeof(struct page_info), PADDR(pages), kflags);
ffff80000010eff7: 48 8b 00             	movq	(%rax), %rax
ffff80000010effa: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010effe: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010f008: 48 8b 00             	movq	(%rax), %rax
ffff80000010f00b: 48 c1 e0 05          	shlq	$5, %rax
ffff80000010f00f: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010f013: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f01d: 48 8b 10             	movq	(%rax), %rdx
ffff80000010f020: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f02a: 48 b8 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rax # imm = 0xFFFF80000010F0C0
ffff80000010f034: be 34 00 00 00       	movl	$52, %esi
ffff80000010f039: ff d0                	callq	*%rax
ffff80000010f03b: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010f03f: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000010f043: 48 89 c1             	movq	%rax, %rcx
ffff80000010f046: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff80000010f04a: 48 b8 30 39 11 00 00 80 ff ff	movabsq	$-140737487226576, %rax # imm = 0xFFFF800000113930
ffff80000010f054: 48 be 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rsi # imm = 0xFFFFFF8000000000
ffff80000010f05e: ff d0                	callq	*%rax
; 	buddy_migrate();
ffff80000010f060: 48 b8 a0 ea 10 00 00 80 ff ff	movabsq	$-140737487246688, %rax # imm = 0xFFFF80000010EAA0
ffff80000010f06a: ff d0                	callq	*%rax
; 	return 0;
ffff80000010f06c: 31 c0                	xorl	%eax, %eax
ffff80000010f06e: 48 83 c4 30          	addq	$48, %rsp
ffff80000010f072: 5d                   	popq	%rbp
ffff80000010f073: c3                   	retq
ffff80000010f074: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f07e: 66 90                	nop

ffff80000010f080 <page2kva>:
; {
ffff80000010f080: 55                   	pushq	%rbp
ffff80000010f081: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f084: 48 83 ec 10          	subq	$16, %rsp
ffff80000010f088: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000010f08c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f090: 48 b8 c0 f9 10 00 00 80 ff ff	movabsq	$-140737487242816, %rax # imm = 0xFFFF80000010F9C0
ffff80000010f09a: ff d0                	callq	*%rax
ffff80000010f09c: 48 89 c2             	movq	%rax, %rdx
ffff80000010f09f: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff80000010f0a9: 48 b8 d0 f8 10 00 00 80 ff ff	movabsq	$-140737487243056, %rax # imm = 0xFFFF80000010F8D0
ffff80000010f0b3: be 50 00 00 00       	movl	$80, %esi
ffff80000010f0b8: ff d0                	callq	*%rax
ffff80000010f0ba: 48 83 c4 10          	addq	$16, %rsp
ffff80000010f0be: 5d                   	popq	%rbp
ffff80000010f0bf: c3                   	retq

ffff80000010f0c0 <_paddr>:
; {
ffff80000010f0c0: 55                   	pushq	%rbp
ffff80000010f0c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f0c4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010f0c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010f0cc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010f0cf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010f0d3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f0d7: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010f0e1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f0e4: 0f 83 24 00 00 00    	jae	0xffff80000010f10e <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010f0ea: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f0ee: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010f0f1: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f0f5: 48 ba 2a 88 11 00 00 80 ff ff	movabsq	$-140737487206358, %rdx # imm = 0xFFFF80000011882A
ffff80000010f0ff: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f109: 31 c0                	xorl	%eax, %eax
ffff80000010f10b: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010f10e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f112: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010f11c: 48 29 c8             	subq	%rcx, %rax
ffff80000010f11f: 48 83 c4 20          	addq	$32, %rsp
ffff80000010f123: 5d                   	popq	%rbp
ffff80000010f124: c3                   	retq
ffff80000010f125: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f12f: 90                   	nop

ffff80000010f130 <mem_init>:
; {
ffff80000010f130: 55                   	pushq	%rbp
ffff80000010f131: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f134: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff80000010f13b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	uintptr_t highest_addr = 0;
ffff80000010f13f: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
; 	align_boot_info(boot_info);
ffff80000010f147: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f14b: 48 b8 40 de 10 00 00 80 ff ff	movabsq	$-140737487249856, %rax # imm = 0xFFFF80000010DE40
ffff80000010f155: ff d0                	callq	*%rax
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010f157: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010f15f: 48 83 7d d8 0a       	cmpq	$10, -40(%rbp)
ffff80000010f164: 0f 83 32 00 00 00    	jae	0xffff80000010f19c <mem_init+0x6c>
; 		list_init(buddy_free_list + i);
ffff80000010f16a: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010f16e: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010f172: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000010f17c: 48 01 c7             	addq	%rax, %rdi
ffff80000010f17f: 48 b8 70 09 11 00 00 80 ff ff	movabsq	$-140737487238800, %rax # imm = 0xFFFF800000110970
ffff80000010f189: ff d0                	callq	*%rax
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010f18b: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f18f: 48 83 c0 01          	addq	$1, %rax
ffff80000010f193: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010f197: e9 c3 ff ff ff       	jmp	0xffff80000010f15f <mem_init+0x2f>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010f19c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f1a0: 8b 00                	movl	(%rax), %eax
ffff80000010f1a2: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f1a6: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010f1ae: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f1b2: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f1b6: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f1b9: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f1bc: 0f 83 43 00 00 00    	jae	0xffff80000010f205 <mem_init+0xd5>
; 		if (entry->type != MMAP_FREE)
ffff80000010f1c2: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1c6: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010f1ca: 0f 84 05 00 00 00    	je	0xffff80000010f1d5 <mem_init+0xa5>
; 			continue;
ffff80000010f1d0: e9 13 00 00 00       	jmp	0xffff80000010f1e8 <mem_init+0xb8>
; 		highest_addr = entry->addr + entry->len;
ffff80000010f1d5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1d9: 48 8b 00             	movq	(%rax), %rax
ffff80000010f1dc: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010f1e0: 48 03 41 08          	addq	8(%rcx), %rax
ffff80000010f1e4: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f1e8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f1ec: 48 83 c0 01          	addq	$1, %rax
ffff80000010f1f0: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010f1f4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1f8: 48 83 c0 18          	addq	$24, %rax
ffff80000010f1fc: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f200: e9 a9 ff ff ff       	jmp	0xffff80000010f1ae <mem_init+0x7e>
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010f205: c7 45 cc 00 00 80 00 	movl	$8388608, -52(%rbp)     # imm = 0x800000
ffff80000010f20c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f210: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010f214: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff80000010f218: 48 3b 45 c0          	cmpq	-64(%rbp), %rax
ffff80000010f21c: 0f 87 0d 00 00 00    	ja	0xffff80000010f22f <mem_init+0xff>
ffff80000010f222: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff80000010f226: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f22a: e9 08 00 00 00       	jmp	0xffff80000010f237 <mem_init+0x107>
ffff80000010f22f: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f233: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f237: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010f23b: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010f23f: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010f243: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010f247: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010f251: 48 89 08             	movq	%rcx, (%rax)
; 	pages = boot_alloc(npages * sizeof *pages);
ffff80000010f254: 8b 38                	movl	(%rax), %edi
ffff80000010f256: c1 e7 05             	shll	$5, %edi
ffff80000010f259: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f263: ff d0                	callq	*%rax
ffff80000010f265: 48 89 c1             	movq	%rax, %rcx
ffff80000010f268: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f272: 48 89 08             	movq	%rcx, (%rax)
; 	page_init(boot_info);
ffff80000010f275: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f279: 48 b8 f0 f3 10 00 00 80 ff ff	movabsq	$-140737487244304, %rax # imm = 0xFFFF80000010F3F0
ffff80000010f283: ff d0                	callq	*%rax
; 	pml4_setup(boot_info);
ffff80000010f285: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f289: 48 b8 10 ef 10 00 00 80 ff ff	movabsq	$-140737487245552, %rax # imm = 0xFFFF80000010EF10
ffff80000010f293: ff d0                	callq	*%rax
; 	uint64_t efer = read_msr(MSR_EFER);
ffff80000010f295: 48 b8 70 f6 10 00 00 80 ff ff	movabsq	$-140737487243664, %rax # imm = 0xFFFF80000010F670
ffff80000010f29f: bf 80 00 00 c0       	movl	$3221225600, %edi       # imm = 0xC0000080
ffff80000010f2a4: 89 7d 8c             	movl	%edi, -116(%rbp)
ffff80000010f2a7: ff d0                	callq	*%rax
ffff80000010f2a9: 8b 7d 8c             	movl	-116(%rbp), %edi
ffff80000010f2ac: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 	write_msr(MSR_EFER, efer | MSR_EFER_NXE);
ffff80000010f2b0: 48 8b 75 b0          	movq	-80(%rbp), %rsi
ffff80000010f2b4: 48 81 ce 00 08 00 00 	orq	$2048, %rsi             # imm = 0x800
ffff80000010f2bb: 48 b8 a0 f6 10 00 00 80 ff ff	movabsq	$-140737487243616, %rax # imm = 0xFFFF80000010F6A0
ffff80000010f2c5: ff d0                	callq	*%rax
; 	dump_page_tables(kernel_pml4, PAGE_PRESENT);
ffff80000010f2c7: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000010f2d1: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff80000010f2d5: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f2d8: 48 b8 90 2d 11 00 00 80 ff ff	movabsq	$-140737487229552, %rax # imm = 0xFFFF800000112D90
ffff80000010f2e2: be 01 00 00 00       	movl	$1, %esi
ffff80000010f2e7: ff d0                	callq	*%rax
; 	lab2_check_pml4();
ffff80000010f2e9: 48 b8 a0 76 11 00 00 80 ff ff	movabsq	$-140737487210848, %rax # imm = 0xFFFF8000001176A0
ffff80000010f2f3: ff d0                	callq	*%rax
; 	cprintf("attempting to load pml4\n");
ffff80000010f2f5: 48 bf 11 88 11 00 00 80 ff ff	movabsq	$-140737487206383, %rdi # imm = 0xFFFF800000118811
ffff80000010f2ff: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f309: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff80000010f30d: 31 c0                	xorl	%eax, %eax
ffff80000010f30f: 88 45 9f             	movb	%al, -97(%rbp)
ffff80000010f312: ff d1                	callq	*%rcx
ffff80000010f314: 48 8b 4d 90          	movq	-112(%rbp), %rcx
ffff80000010f318: 48 8b 55 a0          	movq	-96(%rbp), %rdx
ffff80000010f31c: 8a 45 9f             	movb	-97(%rbp), %al
; 	cprintf("pml4 phys addr: %16p\n", PAGE_ADDR((uintptr_t)kernel_pml4));
ffff80000010f31f: 48 8b 32             	movq	(%rdx), %rsi
ffff80000010f322: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010f32c: 48 21 d6             	andq	%rdx, %rsi
ffff80000010f32f: 48 bf 8a 96 11 00 00 80 ff ff	movabsq	$-140737487202678, %rdi # imm = 0xFFFF80000011968A
ffff80000010f339: ff d1                	callq	*%rcx
ffff80000010f33b: 48 8b 45 a0          	movq	-96(%rbp), %rax
; 	load_pml4((void*) PAGE_ADDR((uintptr_t)kernel_pml4));
ffff80000010f33f: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f342: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff80000010f34c: 48 21 c7             	andq	%rax, %rdi
ffff80000010f34f: 48 b8 e0 f6 10 00 00 80 ff ff	movabsq	$-140737487243552, %rax # imm = 0xFFFF80000010F6E0
ffff80000010f359: ff d0                	callq	*%rax
; 	cprintf("loaded pml4 in cr3\n");
ffff80000010f35b: 48 bf b9 92 11 00 00 80 ff ff	movabsq	$-140737487203655, %rdi # imm = 0xFFFF8000001192B9
ffff80000010f365: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f36f: 31 c0                	xorl	%eax, %eax
ffff80000010f371: ff d1                	callq	*%rcx
; 	cprintf("loaded pml4");
ffff80000010f373: 48 bf 45 8d 11 00 00 80 ff ff	movabsq	$-140737487205051, %rdi # imm = 0xFFFF800000118D45
ffff80000010f37d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f387: 31 c0                	xorl	%eax, %eax
ffff80000010f389: ff d1                	callq	*%rcx
; 	lab2_check_paging();
ffff80000010f38b: 48 b8 d0 76 11 00 00 80 ff ff	movabsq	$-140737487210800, %rax # imm = 0xFFFF8000001176D0
ffff80000010f395: ff d0                	callq	*%rax
; 	cprintf("starting page init ext\n");
ffff80000010f397: 48 bf f4 89 11 00 00 80 ff ff	movabsq	$-140737487205900, %rdi # imm = 0xFFFF8000001189F4
ffff80000010f3a1: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f3ab: 31 c0                	xorl	%eax, %eax
ffff80000010f3ad: ff d1                	callq	*%rcx
; 	page_init_ext(boot_info);
ffff80000010f3af: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f3b3: 48 b8 10 f7 10 00 00 80 ff ff	movabsq	$-140737487243504, %rax # imm = 0xFFFF80000010F710
ffff80000010f3bd: ff d0                	callq	*%rax
; 	cprintf("page init ext complete\n");
ffff80000010f3bf: 48 bf 8e 94 11 00 00 80 ff ff	movabsq	$-140737487203186, %rdi # imm = 0xFFFF80000011948E
ffff80000010f3c9: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f3d3: 31 c0                	xorl	%eax, %eax
ffff80000010f3d5: ff d1                	callq	*%rcx
; 	lab2_check_buddy(boot_info);
ffff80000010f3d7: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f3db: 48 b8 f0 76 11 00 00 80 ff ff	movabsq	$-140737487210768, %rax # imm = 0xFFFF8000001176F0
ffff80000010f3e5: ff d0                	callq	*%rax
; }
ffff80000010f3e7: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000010f3ee: 5d                   	popq	%rbp
ffff80000010f3ef: c3                   	retq

ffff80000010f3f0 <page_init>:
; {
ffff80000010f3f0: 55                   	pushq	%rbp
ffff80000010f3f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f3f4: 48 83 ec 60          	subq	$96, %rsp
ffff80000010f3f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	for (i = 0; i < npages; ++i) {
ffff80000010f3fc: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f404: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f408: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f412: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f415: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f418: 0f 83 67 00 00 00    	jae	0xffff80000010f485 <page_init+0x95>
; 		page = pages + i;
ffff80000010f41e: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f428: 48 8b 00             	movq	(%rax), %rax
ffff80000010f42b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010f42f: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010f433: 48 01 c8             	addq	%rcx, %rax
ffff80000010f436: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		list_init(&page->pp_node);
ffff80000010f43a: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010f43e: 48 b8 70 09 11 00 00 80 ff ff	movabsq	$-140737487238800, %rax # imm = 0xFFFF800000110970
ffff80000010f448: ff d0                	callq	*%rax
; 		page->pp_ref = 0;
ffff80000010f44a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f44e: 66 c7 40 10 00 00    	movw	$0, 16(%rax)
; 		page->pp_free = false;
ffff80000010f454: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f458: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f45b: 80 e1 7f             	andb	$127, %cl
ffff80000010f45e: 80 c9 00             	orb	$0, %cl
ffff80000010f461: 88 48 12             	movb	%cl, 18(%rax)
; 		page->pp_order = 0;
ffff80000010f464: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f468: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f46b: 80 e1 80             	andb	$-128, %cl
ffff80000010f46e: 80 c9 00             	orb	$0, %cl
ffff80000010f471: 88 48 12             	movb	%cl, 18(%rax)
; 	for (i = 0; i < npages; ++i) {
ffff80000010f474: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f478: 48 83 c0 01          	addq	$1, %rax
ffff80000010f47c: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f480: e9 7f ff ff ff       	jmp	0xffff80000010f404 <page_init+0x14>
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010f485: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f489: 8b 00                	movl	(%rax), %eax
ffff80000010f48b: 89 c2                	movl	%eax, %edx
ffff80000010f48d: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f497: 48 b8 d0 f8 10 00 00 80 ff ff	movabsq	$-140737487243056, %rax # imm = 0xFFFF80000010F8D0
ffff80000010f4a1: be be 00 00 00       	movl	$190, %esi
ffff80000010f4a6: ff d0                	callq	*%rax
ffff80000010f4a8: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010f4ac: 31 c0                	xorl	%eax, %eax
ffff80000010f4ae: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f4b8: 31 ff                	xorl	%edi, %edi
ffff80000010f4ba: ff d0                	callq	*%rax
ffff80000010f4bc: 48 89 c2             	movq	%rax, %rdx
ffff80000010f4bf: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f4c9: 48 b8 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rax # imm = 0xFFFF80000010F0C0
ffff80000010f4d3: be bf 00 00 00       	movl	$191, %esi
ffff80000010f4d8: ff d0                	callq	*%rax
ffff80000010f4da: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f4de: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f4e6: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f4ea: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f4ee: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f4f1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f4f4: 0f 83 6e 01 00 00    	jae	0xffff80000010f668 <page_init+0x278>
; 		if((entry->type & MMAP_FREE) == 0){
ffff80000010f4fa: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f4fe: 8b 40 10             	movl	16(%rax), %eax
ffff80000010f501: 83 e0 01             	andl	$1, %eax
ffff80000010f504: 83 f8 00             	cmpl	$0, %eax
ffff80000010f507: 0f 85 05 00 00 00    	jne	0xffff80000010f512 <page_init+0x122>
; 			continue;
ffff80000010f50d: e9 39 01 00 00       	jmp	0xffff80000010f64b <page_init+0x25b>
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010f512: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f516: 48 8b 00             	movq	(%rax), %rax
ffff80000010f519: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f51d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f521: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f525: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f528: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000010f52c: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010f530: 48 89 4d c0          	movq	%rcx, -64(%rbp)
ffff80000010f534: 48 8b 4d c0          	movq	-64(%rbp), %rcx
ffff80000010f538: 48 8b 55 c0          	movq	-64(%rbp), %rdx
ffff80000010f53c: 48 81 e2 ff 0f 00 00 	andq	$4095, %rdx             # imm = 0xFFF
ffff80000010f543: 48 29 d1             	subq	%rdx, %rcx
ffff80000010f546: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f54a: 48 3b 45 b8          	cmpq	-72(%rbp), %rax
ffff80000010f54e: 0f 83 f2 00 00 00    	jae	0xffff80000010f646 <page_init+0x256>
; 			if(i + PAGE_SIZE > BOOT_MAP_LIM){
ffff80000010f554: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f558: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f55e: 48 3d 00 00 80 00    	cmpq	$8388608, %rax          # imm = 0x800000
ffff80000010f564: 0f 86 05 00 00 00    	jbe	0xffff80000010f56f <page_init+0x17f>
; 				break;
ffff80000010f56a: e9 d7 00 00 00       	jmp	0xffff80000010f646 <page_init+0x256>
; 			if(i == 0){
ffff80000010f56f: 48 83 7d c8 00       	cmpq	$0, -56(%rbp)
ffff80000010f574: 0f 85 05 00 00 00    	jne	0xffff80000010f57f <page_init+0x18f>
; 				continue;
ffff80000010f57a: e9 b4 00 00 00       	jmp	0xffff80000010f633 <page_init+0x243>
; 			if(i == (physaddr_t)boot_info->elf_hdr){
ffff80000010f57f: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f583: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f587: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010f58b: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f58e: 0f 85 05 00 00 00    	jne	0xffff80000010f599 <page_init+0x1a9>
; 				continue;
ffff80000010f594: e9 9a 00 00 00       	jmp	0xffff80000010f633 <page_init+0x243>
; 			if(i >= KERNEL_LMA && i < (uint64_t)end){
ffff80000010f599: 48 81 7d c8 00 00 10 00      	cmpq	$1048576, -56(%rbp) # imm = 0x100000
ffff80000010f5a1: 0f 82 13 00 00 00    	jb	0xffff80000010f5ba <page_init+0x1ca>
ffff80000010f5a7: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f5ab: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff80000010f5af: 0f 83 05 00 00 00    	jae	0xffff80000010f5ba <page_init+0x1ca>
; 				continue;
ffff80000010f5b5: e9 79 00 00 00       	jmp	0xffff80000010f633 <page_init+0x243>
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010f5ba: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f5be: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f5c2: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010f5c6: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f5d0: 48 b8 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rax # imm = 0xFFFF80000010F0C0
ffff80000010f5da: be e0 00 00 00       	movl	$224, %esi
ffff80000010f5df: ff d0                	callq	*%rax
ffff80000010f5e1: 48 89 c1             	movq	%rax, %rcx
ffff80000010f5e4: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000010f5e8: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010f5f2: 48 21 d1             	andq	%rdx, %rcx
ffff80000010f5f5: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f5f8: 0f 85 05 00 00 00    	jne	0xffff80000010f603 <page_init+0x213>
; 				continue;
ffff80000010f5fe: e9 30 00 00 00       	jmp	0xffff80000010f633 <page_init+0x243>
; 			size_t page_index = i >> 12;
ffff80000010f603: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f607: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f60b: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 			page_free(pages + page_index);
ffff80000010f60f: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f619: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f61c: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff80000010f620: 48 c1 e0 05          	shlq	$5, %rax
ffff80000010f624: 48 01 c7             	addq	%rax, %rdi
ffff80000010f627: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000010f631: ff d0                	callq	*%rax
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010f633: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f637: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f63d: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f641: e9 d7 fe ff ff       	jmp	0xffff80000010f51d <page_init+0x12d>
; 	}
ffff80000010f646: e9 00 00 00 00       	jmp	0xffff80000010f64b <page_init+0x25b>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f64b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f64f: 48 83 c0 01          	addq	$1, %rax
ffff80000010f653: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f657: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f65b: 48 83 c0 18          	addq	$24, %rax
ffff80000010f65f: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f663: e9 7e fe ff ff       	jmp	0xffff80000010f4e6 <page_init+0xf6>
; }
ffff80000010f668: 48 83 c4 60          	addq	$96, %rsp
ffff80000010f66c: 5d                   	popq	%rbp
ffff80000010f66d: c3                   	retq
ffff80000010f66e: 66 90                	nop

ffff80000010f670 <read_msr>:
; {
ffff80000010f670: 55                   	pushq	%rbp
ffff80000010f671: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f674: 89 7d fc             	movl	%edi, -4(%rbp)
; 		"c" (reg));
ffff80000010f677: 8b 4d fc             	movl	-4(%rbp), %ecx
; 	asm volatile(
ffff80000010f67a: 0f 32                	rdmsr
ffff80000010f67c: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010f67f: 89 55 f4             	movl	%edx, -12(%rbp)
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff80000010f682: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010f685: 48 c1 e0 20          	shlq	$32, %rax
ffff80000010f689: 8b 4d f8             	movl	-8(%rbp), %ecx
ffff80000010f68c: 48 09 c8             	orq	%rcx, %rax
ffff80000010f68f: 5d                   	popq	%rbp
ffff80000010f690: c3                   	retq
ffff80000010f691: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f69b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f6a0 <write_msr>:
; {
ffff80000010f6a0: 55                   	pushq	%rbp
ffff80000010f6a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f6a4: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010f6a7: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 		"c" (reg),
ffff80000010f6ab: 8b 4d fc             	movl	-4(%rbp), %ecx
; 		"a" ((uint32_t)(val & 0xFFFFFFFF)),
ffff80000010f6ae: 48 b8 ff ff ff ff 00 00 00 00	movabsq	$4294967295, %rax # imm = 0xFFFFFFFF
ffff80000010f6b8: 48 23 45 f0          	andq	-16(%rbp), %rax
; 		"d" ((uint32_t)((val >> 32) & 0xFFFFFFFF)));
ffff80000010f6bc: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000010f6c0: 48 c1 ea 20          	shrq	$32, %rdx
ffff80000010f6c4: 48 be ff ff ff ff 00 00 00 00	movabsq	$4294967295, %rsi # imm = 0xFFFFFFFF
ffff80000010f6ce: 48 21 f2             	andq	%rsi, %rdx
; 	asm volatile(
ffff80000010f6d1: 0f 30                	wrmsr
; }
ffff80000010f6d3: 5d                   	popq	%rbp
ffff80000010f6d4: c3                   	retq
ffff80000010f6d5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f6df: 90                   	nop

ffff80000010f6e0 <load_pml4>:
; {
ffff80000010f6e0: 55                   	pushq	%rbp
ffff80000010f6e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f6e4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010f6e8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	write_cr3((uintptr_t)pml4);
ffff80000010f6ec: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f6f0: 48 b8 f0 f9 10 00 00 80 ff ff	movabsq	$-140737487242768, %rax # imm = 0xFFFF80000010F9F0
ffff80000010f6fa: ff d0                	callq	*%rax
; }
ffff80000010f6fc: 48 83 c4 10          	addq	$16, %rsp
ffff80000010f700: 5d                   	popq	%rbp
ffff80000010f701: c3                   	retq
ffff80000010f702: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f70c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f710 <page_init_ext>:
; {
ffff80000010f710: 55                   	pushq	%rbp
ffff80000010f711: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f714: 48 83 ec 40          	subq	$64, %rsp
ffff80000010f718: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010f71c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f720: 8b 00                	movl	(%rax), %eax
ffff80000010f722: 89 c2                	movl	%eax, %edx
ffff80000010f724: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f72e: 48 b8 d0 f8 10 00 00 80 ff ff	movabsq	$-140737487243056, %rax # imm = 0xFFFF80000010F8D0
ffff80000010f738: be f3 00 00 00       	movl	$243, %esi
ffff80000010f73d: ff d0                	callq	*%rax
ffff80000010f73f: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010f743: 31 c0                	xorl	%eax, %eax
ffff80000010f745: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f74f: 31 ff                	xorl	%edi, %edi
ffff80000010f751: ff d0                	callq	*%rax
ffff80000010f753: 48 89 c2             	movq	%rax, %rdx
ffff80000010f756: 48 bf 16 90 11 00 00 80 ff ff	movabsq	$-140737487204330, %rdi # imm = 0xFFFF800000119016
ffff80000010f760: 48 b8 c0 f0 10 00 00 80 ff ff	movabsq	$-140737487245120, %rax # imm = 0xFFFF80000010F0C0
ffff80000010f76a: be f4 00 00 00       	movl	$244, %esi
ffff80000010f76f: ff d0                	callq	*%rax
ffff80000010f771: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f775: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f77d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f781: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f785: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f788: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f78b: 0f 83 2e 01 00 00    	jae	0xffff80000010f8bf <page_init_ext+0x1af>
; 		if(entry->type != MMAP_FREE) continue;
ffff80000010f791: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f795: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010f799: 0f 84 05 00 00 00    	je	0xffff80000010f7a4 <page_init_ext+0x94>
ffff80000010f79f: e9 fe 00 00 00       	jmp	0xffff80000010f8a2 <page_init_ext+0x192>
; 		for(physaddr_t addr = entry->addr; addr < entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010f7a4: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f7a8: 48 8b 00             	movq	(%rax), %rax
ffff80000010f7ab: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f7af: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f7b3: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f7b7: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f7ba: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000010f7be: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010f7c2: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f7c5: 0f 83 d2 00 00 00    	jae	0xffff80000010f89d <page_init_ext+0x18d>
; 			if(addr < BOOT_MAP_LIM) continue;
ffff80000010f7cb: 48 81 7d c8 00 00 80 00      	cmpq	$8388608, -56(%rbp) # imm = 0x800000
ffff80000010f7d3: 0f 83 05 00 00 00    	jae	0xffff80000010f7de <page_init_ext+0xce>
ffff80000010f7d9: e9 ac 00 00 00       	jmp	0xffff80000010f88a <page_init_ext+0x17a>
; 			if(PAGE_INDEX(addr) >= npages){
ffff80000010f7de: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f7e2: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f7e6: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f7f0: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f7f3: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f7f6: 0f 82 21 00 00 00    	jb	0xffff80000010f81d <page_init_ext+0x10d>
; 				buddy_map_chunk(kernel_pml4, PAGE_INDEX(addr));
ffff80000010f7fc: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000010f806: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f809: 48 8b 75 c8          	movq	-56(%rbp), %rsi
ffff80000010f80d: 48 c1 ee 0c          	shrq	$12, %rsi
ffff80000010f811: 48 b8 50 ec 10 00 00 80 ff ff	movabsq	$-140737487246256, %rax # imm = 0xFFFF80000010EC50
ffff80000010f81b: ff d0                	callq	*%rax
; 			struct page_info* page = pa2page(addr);
ffff80000010f81d: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f821: 48 b8 40 f9 10 00 00 80 ff ff	movabsq	$-140737487242944, %rax # imm = 0xFFFF80000010F940
ffff80000010f82b: ff d0                	callq	*%rax
ffff80000010f82d: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 			list_init(&page->pp_node);
ffff80000010f831: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff80000010f835: 48 b8 70 09 11 00 00 80 ff ff	movabsq	$-140737487238800, %rax # imm = 0xFFFF800000110970
ffff80000010f83f: ff d0                	callq	*%rax
; 			page->pp_ref = 0;
ffff80000010f841: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f845: 66 c7 40 10 00 00    	movw	$0, 16(%rax)
; 			page->pp_free = false;
ffff80000010f84b: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f84f: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f852: 80 e1 7f             	andb	$127, %cl
ffff80000010f855: 80 c9 00             	orb	$0, %cl
ffff80000010f858: 88 48 12             	movb	%cl, 18(%rax)
; 			page->pp_order = 0;
ffff80000010f85b: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f85f: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f862: 80 e1 80             	andb	$-128, %cl
ffff80000010f865: 80 c9 00             	orb	$0, %cl
ffff80000010f868: 88 48 12             	movb	%cl, 18(%rax)
; 			page_free(pa2page(addr));
ffff80000010f86b: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f86f: 48 b8 40 f9 10 00 00 80 ff ff	movabsq	$-140737487242944, %rax # imm = 0xFFFF80000010F940
ffff80000010f879: ff d0                	callq	*%rax
ffff80000010f87b: 48 89 c7             	movq	%rax, %rdi
ffff80000010f87e: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000010f888: ff d0                	callq	*%rax
; 		for(physaddr_t addr = entry->addr; addr < entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010f88a: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f88e: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f894: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f898: e9 12 ff ff ff       	jmp	0xffff80000010f7af <page_init_ext+0x9f>
; 	}
ffff80000010f89d: e9 00 00 00 00       	jmp	0xffff80000010f8a2 <page_init_ext+0x192>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f8a2: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f8a6: 48 83 c0 01          	addq	$1, %rax
ffff80000010f8aa: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f8ae: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f8b2: 48 83 c0 18          	addq	$24, %rax
ffff80000010f8b6: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f8ba: e9 be fe ff ff       	jmp	0xffff80000010f77d <page_init_ext+0x6d>
; }
ffff80000010f8bf: 48 83 c4 40          	addq	$64, %rsp
ffff80000010f8c3: 5d                   	popq	%rbp
ffff80000010f8c4: c3                   	retq
ffff80000010f8c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f8cf: 90                   	nop

ffff80000010f8d0 <_kaddr>:
; {
ffff80000010f8d0: 55                   	pushq	%rbp
ffff80000010f8d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f8d4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010f8d8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010f8dc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010f8df: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010f8e3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f8e7: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f8eb: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f8f5: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f8f8: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f8fb: 0f 82 24 00 00 00    	jb	0xffff80000010f925 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010f901: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f905: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010f908: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f90c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff80000010f916: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f920: 31 c0                	xorl	%eax, %eax
ffff80000010f922: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010f925: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010f92f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010f933: 48 83 c4 20          	addq	$32, %rsp
ffff80000010f937: 5d                   	popq	%rbp
ffff80000010f938: c3                   	retq
ffff80000010f939: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f940 <pa2page>:
; {
ffff80000010f940: 55                   	pushq	%rbp
ffff80000010f941: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f944: 48 83 ec 10          	subq	$16, %rsp
ffff80000010f948: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010f94c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f950: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f954: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f95e: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f961: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f964: 0f 82 27 00 00 00    	jb	0xffff80000010f991 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010f96a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff80000010f974: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000010f97e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010f988: 31 c0                	xorl	%eax, %eax
ffff80000010f98a: be 49 00 00 00       	movl	$73, %esi
ffff80000010f98f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff80000010f991: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f99b: 48 8b 00             	movq	(%rax), %rax
ffff80000010f99e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f9a2: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010f9a6: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010f9aa: 48 01 c8             	addq	%rcx, %rax
ffff80000010f9ad: 48 83 c4 10          	addq	$16, %rsp
ffff80000010f9b1: 5d                   	popq	%rbp
ffff80000010f9b2: c3                   	retq
ffff80000010f9b3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f9bd: 0f 1f 00             	nopl	(%rax)

ffff80000010f9c0 <page2pa>:
; {
ffff80000010f9c0: 55                   	pushq	%rbp
ffff80000010f9c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9c4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010f9c8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f9cc: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010f9d6: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f9d9: 48 29 c8             	subq	%rcx, %rax
ffff80000010f9dc: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010f9e0: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010f9e4: 5d                   	popq	%rbp
ffff80000010f9e5: c3                   	retq
ffff80000010f9e6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f9f0 <write_cr3>:
; {
ffff80000010f9f0: 55                   	pushq	%rbp
ffff80000010f9f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9f4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	asm volatile("movq %0, %%cr3\n" :: "r" (value));
ffff80000010f9f8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f9fc: 0f 22 d8             	movq	%rax, %cr3
; }
ffff80000010f9ff: 5d                   	popq	%rbp
ffff80000010fa00: c3                   	retq
ffff80000010fa01: cc                   	int3
ffff80000010fa02: cc                   	int3
ffff80000010fa03: cc                   	int3
ffff80000010fa04: cc                   	int3
ffff80000010fa05: cc                   	int3
ffff80000010fa06: cc                   	int3
ffff80000010fa07: cc                   	int3
ffff80000010fa08: cc                   	int3
ffff80000010fa09: cc                   	int3
ffff80000010fa0a: cc                   	int3
ffff80000010fa0b: cc                   	int3
ffff80000010fa0c: cc                   	int3
ffff80000010fa0d: cc                   	int3
ffff80000010fa0e: cc                   	int3
ffff80000010fa0f: cc                   	int3

ffff80000010fa10 <lab1_check_free_list_avail>:
; {
ffff80000010fa10: 55                   	pushq	%rbp
ffff80000010fa11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa14: 48 83 ec 30          	subq	$48, %rsp
; 	size_t nfree_basemem = 0;
ffff80000010fa18: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	size_t nfree_extmem = 0;
ffff80000010fa20: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fa28: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010fa30: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010fa35: 0f 83 aa 00 00 00    	jae	0xffff80000010fae5 <lab1_check_free_list_avail+0xd5>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fa3b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fa3f: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010fa43: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010fa4d: 48 01 c8             	addq	%rcx, %rax
ffff80000010fa50: 48 8b 00             	movq	(%rax), %rax
ffff80000010fa53: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fa57: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fa5b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010fa5f: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010fa63: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010fa6d: 48 01 d1             	addq	%rdx, %rcx
ffff80000010fa70: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fa73: 0f 84 56 00 00 00    	je	0xffff80000010facf <lab1_check_free_list_avail+0xbf>
; 			page = container_of(node, struct page_info, pp_node);
ffff80000010fa79: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fa7d: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010fa81: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010fa85: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff80000010fa8f: ff d0                	callq	*%rax
ffff80000010fa91: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010fa97: 0f 83 11 00 00 00    	jae	0xffff80000010faae <lab1_check_free_list_avail+0x9e>
; 				++nfree_basemem;
ffff80000010fa9d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010faa1: 48 83 c0 01          	addq	$1, %rax
ffff80000010faa5: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 			} else {
ffff80000010faa9: e9 0c 00 00 00       	jmp	0xffff80000010faba <lab1_check_free_list_avail+0xaa>
; 				++nfree_extmem;
ffff80000010faae: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fab2: 48 83 c0 01          	addq	$1, %rax
ffff80000010fab6: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		}
ffff80000010faba: e9 00 00 00 00       	jmp	0xffff80000010fabf <lab1_check_free_list_avail+0xaf>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fabf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fac3: 48 8b 00             	movq	(%rax), %rax
ffff80000010fac6: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010faca: e9 88 ff ff ff       	jmp	0xffff80000010fa57 <lab1_check_free_list_avail+0x47>
; 	}
ffff80000010facf: e9 00 00 00 00       	jmp	0xffff80000010fad4 <lab1_check_free_list_avail+0xc4>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fad4: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fad8: 48 83 c0 01          	addq	$1, %rax
ffff80000010fadc: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010fae0: e9 4b ff ff ff       	jmp	0xffff80000010fa30 <lab1_check_free_list_avail+0x20>
; 	assert(nfree_basemem > 0);
ffff80000010fae5: e9 00 00 00 00       	jmp	0xffff80000010faea <lab1_check_free_list_avail+0xda>
ffff80000010faea: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000010faef: 0f 87 32 00 00 00    	ja	0xffff80000010fb27 <lab1_check_free_list_avail+0x117>
ffff80000010faf5: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010faff: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000010fb09: 48 b9 cd 92 11 00 00 80 ff ff	movabsq	$-140737487203635, %rcx # imm = 0xFFFF8000001192CD
ffff80000010fb13: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fb1d: 31 c0                	xorl	%eax, %eax
ffff80000010fb1f: be 21 00 00 00       	movl	$33, %esi
ffff80000010fb24: 41 ff d0             	callq	*%r8
ffff80000010fb27: e9 00 00 00 00       	jmp	0xffff80000010fb2c <lab1_check_free_list_avail+0x11c>
; 	assert(nfree_extmem > 0);
ffff80000010fb2c: e9 00 00 00 00       	jmp	0xffff80000010fb31 <lab1_check_free_list_avail+0x121>
ffff80000010fb31: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff80000010fb36: 0f 87 32 00 00 00    	ja	0xffff80000010fb6e <lab1_check_free_list_avail+0x15e>
ffff80000010fb3c: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fb46: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000010fb50: 48 b9 50 8f 11 00 00 80 ff ff	movabsq	$-140737487204528, %rcx # imm = 0xFFFF800000118F50
ffff80000010fb5a: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fb64: 31 c0                	xorl	%eax, %eax
ffff80000010fb66: be 22 00 00 00       	movl	$34, %esi
ffff80000010fb6b: 41 ff d0             	callq	*%r8
ffff80000010fb6e: e9 00 00 00 00       	jmp	0xffff80000010fb73 <lab1_check_free_list_avail+0x163>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010fb73: 48 bf 8d 87 11 00 00 80 ff ff	movabsq	$-140737487206515, %rdi # imm = 0xFFFF80000011878D
ffff80000010fb7d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010fb87: 31 c0                	xorl	%eax, %eax
ffff80000010fb89: ff d1                	callq	*%rcx
; }
ffff80000010fb8b: 48 83 c4 30          	addq	$48, %rsp
ffff80000010fb8f: 5d                   	popq	%rbp
ffff80000010fb90: c3                   	retq
ffff80000010fb91: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fb9b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010fba0 <page2pa>:
; {
ffff80000010fba0: 55                   	pushq	%rbp
ffff80000010fba1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fba4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010fba8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fbac: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010fbb6: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fbb9: 48 29 c8             	subq	%rcx, %rax
ffff80000010fbbc: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010fbc0: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010fbc4: 5d                   	popq	%rbp
ffff80000010fbc5: c3                   	retq
ffff80000010fbc6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010fbd0 <lab1_check_free_list_order>:
; {
ffff80000010fbd0: 55                   	pushq	%rbp
ffff80000010fbd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fbd4: 48 83 ec 20          	subq	$32, %rsp
; 	size_t nviolations = 0;
ffff80000010fbd8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fbe0: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010fbe8: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010fbed: 0f 83 93 00 00 00    	jae	0xffff80000010fc86 <lab1_check_free_list_order+0xb6>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fbf3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fbf7: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010fbfb: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010fc05: 48 01 c8             	addq	%rcx, %rax
ffff80000010fc08: 48 8b 00             	movq	(%rax), %rax
ffff80000010fc0b: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fc0f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fc13: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010fc17: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010fc1b: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010fc25: 48 01 d1             	addq	%rdx, %rcx
ffff80000010fc28: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fc2b: 0f 84 3f 00 00 00    	je	0xffff80000010fc70 <lab1_check_free_list_order+0xa0>
; 			page = container_of(node, struct page_info, pp_node);
ffff80000010fc31: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fc35: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page->pp_order != order)
ffff80000010fc39: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fc3d: 8a 40 12             	movb	18(%rax), %al
ffff80000010fc40: 24 7f                	andb	$127, %al
ffff80000010fc42: 0f b6 c0             	movzbl	%al, %eax
ffff80000010fc45: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000010fc49: 0f 84 0c 00 00 00    	je	0xffff80000010fc5b <lab1_check_free_list_order+0x8b>
; 				++nviolations;
ffff80000010fc4f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010fc53: 48 83 c0 01          	addq	$1, %rax
ffff80000010fc57: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		}
ffff80000010fc5b: e9 00 00 00 00       	jmp	0xffff80000010fc60 <lab1_check_free_list_order+0x90>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fc60: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fc64: 48 8b 00             	movq	(%rax), %rax
ffff80000010fc67: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fc6b: e9 9f ff ff ff       	jmp	0xffff80000010fc0f <lab1_check_free_list_order+0x3f>
; 	}
ffff80000010fc70: e9 00 00 00 00       	jmp	0xffff80000010fc75 <lab1_check_free_list_order+0xa5>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fc75: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fc79: 48 83 c0 01          	addq	$1, %rax
ffff80000010fc7d: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010fc81: e9 62 ff ff ff       	jmp	0xffff80000010fbe8 <lab1_check_free_list_order+0x18>
; 	if (nviolations != 0) {
ffff80000010fc86: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000010fc8b: 0f 84 2c 00 00 00    	je	0xffff80000010fcbd <lab1_check_free_list_order+0xed>
; 		panic("found %u order violations in free list", nviolations);
ffff80000010fc91: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010fc95: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fc9f: 48 ba a7 93 11 00 00 80 ff ff	movabsq	$-140737487203417, %rdx # imm = 0xFFFF8000001193A7
ffff80000010fca9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fcb3: 31 c0                	xorl	%eax, %eax
ffff80000010fcb5: be 3b 00 00 00       	movl	$59, %esi
ffff80000010fcba: 41 ff d0             	callq	*%r8
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010fcbd: 48 bf 91 90 11 00 00 80 ff ff	movabsq	$-140737487204207, %rdi # imm = 0xFFFF800000119091
ffff80000010fcc7: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010fcd1: 31 c0                	xorl	%eax, %eax
ffff80000010fcd3: ff d1                	callq	*%rcx
; }
ffff80000010fcd5: 48 83 c4 20          	addq	$32, %rsp
ffff80000010fcd9: 5d                   	popq	%rbp
ffff80000010fcda: c3                   	retq
ffff80000010fcdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010fce0 <lab1_check_memory_layout>:
; {
ffff80000010fce0: 55                   	pushq	%rbp
ffff80000010fce1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fce4: 48 83 ec 40          	subq	$64, %rsp
ffff80000010fce8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010fcec: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fcf0: 8b 00                	movl	(%rax), %eax
ffff80000010fcf2: 89 c2                	movl	%eax, %edx
ffff80000010fcf4: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fcfe: 48 b8 f0 fe 10 00 00 80 ff ff	movabsq	$-140737487241488, %rax # imm = 0xFFFF80000010FEF0
ffff80000010fd08: be 48 00 00 00       	movl	$72, %esi
ffff80000010fd0d: ff d0                	callq	*%rax
ffff80000010fd0f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010fd13: 31 c0                	xorl	%eax, %eax
ffff80000010fd15: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010fd1f: 31 ff                	xorl	%edi, %edi
ffff80000010fd21: ff d0                	callq	*%rax
ffff80000010fd23: 48 89 c2             	movq	%rax, %rdx
ffff80000010fd26: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fd30: 48 b8 60 ff 10 00 00 80 ff ff	movabsq	$-140737487241376, %rax # imm = 0xFFFF80000010FF60
ffff80000010fd3a: be 49 00 00 00       	movl	$73, %esi
ffff80000010fd3f: ff d0                	callq	*%rax
ffff80000010fd41: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010fd45: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000010fd4d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010fd51: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010fd55: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010fd58: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fd5b: 0f 83 68 01 00 00    	jae	0xffff80000010fec9 <lab1_check_memory_layout+0x1e9>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010fd61: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fd65: 48 8b 00             	movq	(%rax), %rax
ffff80000010fd68: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010fd6c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fd70: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010fd74: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fd77: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000010fd7b: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010fd7f: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fd82: 0f 83 1f 01 00 00    	jae	0xffff80000010fea7 <lab1_check_memory_layout+0x1c7>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010fd88: 48 81 7d d8 00 00 80 00      	cmpq	$8388608, -40(%rbp) # imm = 0x800000
ffff80000010fd90: 0f 82 05 00 00 00    	jb	0xffff80000010fd9b <lab1_check_memory_layout+0xbb>
; 				continue;
ffff80000010fd96: e9 f9 00 00 00       	jmp	0xffff80000010fe94 <lab1_check_memory_layout+0x1b4>
; 			page = pa2page(pa);
ffff80000010fd9b: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010fd9f: 48 b8 d0 ff 10 00 00 80 ff ff	movabsq	$-140737487241264, %rax # imm = 0xFFFF80000010FFD0
ffff80000010fda9: ff d0                	callq	*%rax
ffff80000010fdab: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			if ((pa == 0 ||
ffff80000010fdaf: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff80000010fdb4: 0f 84 84 00 00 00    	je	0xffff80000010fe3e <lab1_check_memory_layout+0x15e>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010fdba: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fdbe: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010fdc2: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010fdc6: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fdd0: 48 b8 60 ff 10 00 00 80 ff ff	movabsq	$-140737487241376, %rax # imm = 0xFFFF80000010FF60
ffff80000010fdda: be 54 00 00 00       	movl	$84, %esi
ffff80000010fddf: ff d0                	callq	*%rax
ffff80000010fde1: 48 89 c1             	movq	%rax, %rcx
ffff80000010fde4: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010fde8: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010fdf2: 48 21 d1             	andq	%rdx, %rcx
ffff80000010fdf5: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fdf8: 0f 84 40 00 00 00    	je	0xffff80000010fe3e <lab1_check_memory_layout+0x15e>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010fdfe: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fe02: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010fe06: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010fe0a: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fe0d: 0f 84 2b 00 00 00    	je	0xffff80000010fe3e <lab1_check_memory_layout+0x15e>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010fe13: b8 00 00 10 00       	movl	$1048576, %eax          # imm = 0x100000
ffff80000010fe18: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff80000010fe1c: 0f 87 0e 00 00 00    	ja	0xffff80000010fe30 <lab1_check_memory_layout+0x150>
ffff80000010fe22: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fe26: 48 3b 45 d0          	cmpq	-48(%rbp), %rax
ffff80000010fe2a: 0f 82 0e 00 00 00    	jb	0xffff80000010fe3e <lab1_check_memory_layout+0x15e>
; 			    entry->type != MMAP_FREE) &&
ffff80000010fe30: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fe34: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010fe38: 0f 84 51 00 00 00    	je	0xffff80000010fe8f <lab1_check_memory_layout+0x1af>
; 			    page->pp_free) {
ffff80000010fe3e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fe42: 8a 40 12             	movb	18(%rax), %al
ffff80000010fe45: c0 e8 07             	shrb	$7, %al
ffff80000010fe48: 0f b6 c0             	movzbl	%al, %eax
ffff80000010fe4b: 83 f8 00             	cmpl	$0, %eax
; 			if ((pa == 0 ||
ffff80000010fe4e: 0f 84 3b 00 00 00    	je	0xffff80000010fe8f <lab1_check_memory_layout+0x1af>
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010fe54: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010fe58: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff80000010fe62: ff d0                	callq	*%rax
ffff80000010fe64: 48 89 c1             	movq	%rax, %rcx
ffff80000010fe67: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fe71: 48 ba 85 89 11 00 00 80 ff ff	movabsq	$-140737487206011, %rdx # imm = 0xFFFF800000118985
ffff80000010fe7b: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fe85: 31 c0                	xorl	%eax, %eax
ffff80000010fe87: be 59 00 00 00       	movl	$89, %esi
ffff80000010fe8c: 41 ff d0             	callq	*%r8
; 		}
ffff80000010fe8f: e9 00 00 00 00       	jmp	0xffff80000010fe94 <lab1_check_memory_layout+0x1b4>
; 		     pa += PAGE_SIZE) {
ffff80000010fe94: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fe98: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010fe9e: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010fea2: e9 c5 fe ff ff       	jmp	0xffff80000010fd6c <lab1_check_memory_layout+0x8c>
; 	}
ffff80000010fea7: e9 00 00 00 00       	jmp	0xffff80000010feac <lab1_check_memory_layout+0x1cc>
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010feac: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010feb0: 48 83 c0 01          	addq	$1, %rax
ffff80000010feb4: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010feb8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010febc: 48 83 c0 18          	addq	$24, %rax
ffff80000010fec0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fec4: e9 84 fe ff ff       	jmp	0xffff80000010fd4d <lab1_check_memory_layout+0x6d>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010fec9: 48 bf 4e 88 11 00 00 80 ff ff	movabsq	$-140737487206322, %rdi # imm = 0xFFFF80000011884E
ffff80000010fed3: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010fedd: 31 c0                	xorl	%eax, %eax
ffff80000010fedf: ff d1                	callq	*%rcx
; }
ffff80000010fee1: 48 83 c4 40          	addq	$64, %rsp
ffff80000010fee5: 5d                   	popq	%rbp
ffff80000010fee6: c3                   	retq
ffff80000010fee7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fef0 <_kaddr>:
; {
ffff80000010fef0: 55                   	pushq	%rbp
ffff80000010fef1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fef4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010fef8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010fefc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010feff: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ff03: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ff07: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010ff0b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010ff15: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010ff18: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010ff1b: 0f 82 24 00 00 00    	jb	0xffff80000010ff45 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010ff21: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010ff25: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010ff28: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ff2c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff80000010ff36: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010ff40: 31 c0                	xorl	%eax, %eax
ffff80000010ff42: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010ff45: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010ff4f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010ff53: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ff57: 5d                   	popq	%rbp
ffff80000010ff58: c3                   	retq
ffff80000010ff59: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ff60 <_paddr>:
; {
ffff80000010ff60: 55                   	pushq	%rbp
ffff80000010ff61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ff64: 48 83 ec 20          	subq	$32, %rsp
ffff80000010ff68: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010ff6c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010ff6f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010ff73: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ff77: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010ff81: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010ff84: 0f 83 24 00 00 00    	jae	0xffff80000010ffae <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010ff8a: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010ff8e: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010ff91: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ff95: 48 ba 2a 88 11 00 00 80 ff ff	movabsq	$-140737487206358, %rdx # imm = 0xFFFF80000011882A
ffff80000010ff9f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010ffa9: 31 c0                	xorl	%eax, %eax
ffff80000010ffab: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010ffae: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ffb2: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010ffbc: 48 29 c8             	subq	%rcx, %rax
ffff80000010ffbf: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ffc3: 5d                   	popq	%rbp
ffff80000010ffc4: c3                   	retq
ffff80000010ffc5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ffcf: 90                   	nop

ffff80000010ffd0 <pa2page>:
; {
ffff80000010ffd0: 55                   	pushq	%rbp
ffff80000010ffd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ffd4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010ffd8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ffdc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010ffe0: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010ffe4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010ffee: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fff1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fff4: 0f 82 27 00 00 00    	jb	0xffff800000110021 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010fffa: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000110004: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000011000e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000110018: 31 c0                	xorl	%eax, %eax
ffff80000011001a: be 49 00 00 00       	movl	$73, %esi
ffff80000011001f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000110021: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011002b: 48 8b 00             	movq	(%rax), %rax
ffff80000011002e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110032: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000110036: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011003a: 48 01 c8             	addq	%rcx, %rax
ffff80000011003d: 48 83 c4 10          	addq	$16, %rsp
ffff800000110041: 5d                   	popq	%rbp
ffff800000110042: c3                   	retq
ffff800000110043: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011004d: 0f 1f 00             	nopl	(%rax)

ffff800000110050 <check_buddy_consistency>:
; {
ffff800000110050: 55                   	pushq	%rbp
ffff800000110051: 48 89 e5             	movq	%rsp, %rbp
ffff800000110054: 48 83 ec 40          	subq	$64, %rsp
ffff800000110058: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011005c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000110060: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	page = pa2page(addr);
ffff800000110064: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110068: 48 b8 d0 ff 10 00 00 80 ff ff	movabsq	$-140737487241264, %rax # imm = 0xFFFF80000010FFD0
ffff800000110072: ff d0                	callq	*%rax
ffff800000110074: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (parent && parent != page) {
ffff800000110078: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff80000011007d: 0f 84 da 00 00 00    	je	0xffff80000011015d <check_buddy_consistency+0x10d>
ffff800000110083: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110087: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff80000011008b: 0f 84 cc 00 00 00    	je	0xffff80000011015d <check_buddy_consistency+0x10d>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff800000110091: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110095: 8a 40 12             	movb	18(%rax), %al
ffff800000110098: c0 e8 07             	shrb	$7, %al
ffff80000011009b: 0f b6 c0             	movzbl	%al, %eax
ffff80000011009e: 83 f8 00             	cmpl	$0, %eax
ffff8000001100a1: 0f 85 3a 00 00 00    	jne	0xffff8000001100e1 <check_buddy_consistency+0x91>
ffff8000001100a7: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff8000001100ab: 48 b8 f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rax # imm = 0xFFFF8000001102F0
ffff8000001100b5: ff d0                	callq	*%rax
ffff8000001100b7: 83 f8 00             	cmpl	$0, %eax
ffff8000001100ba: 0f 84 21 00 00 00    	je	0xffff8000001100e1 <check_buddy_consistency+0x91>
; 			page->pp_order < parent->pp_order) {
ffff8000001100c0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001100c4: 8a 40 12             	movb	18(%rax), %al
ffff8000001100c7: 24 7f                	andb	$127, %al
ffff8000001100c9: 0f b6 c0             	movzbl	%al, %eax
ffff8000001100cc: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001100d0: 8a 49 12             	movb	18(%rcx), %cl
ffff8000001100d3: 80 e1 7f             	andb	$127, %cl
ffff8000001100d6: 0f b6 c9             	movzbl	%cl, %ecx
ffff8000001100d9: 39 c8                	cmpl	%ecx, %eax
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff8000001100db: 0f 8d 77 00 00 00    	jge	0xffff800000110158 <check_buddy_consistency+0x108>
; 			panic("page %p of order %u is free, while parent page "
ffff8000001100e1: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff8000001100e5: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff8000001100ef: ff d0                	callq	*%rax
ffff8000001100f1: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001100f5: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001100f9: 8a 40 12             	movb	18(%rax), %al
ffff8000001100fc: 24 7f                	andb	$127, %al
ffff8000001100fe: 0f b6 c0             	movzbl	%al, %eax
ffff800000110101: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000110104: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000110108: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff800000110112: ff d0                	callq	*%rax
ffff800000110114: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000110118: 44 8b 45 dc          	movl	-36(%rbp), %r8d
ffff80000011011c: 49 89 c1             	movq	%rax, %r9
ffff80000011011f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110123: 8a 40 12             	movb	18(%rax), %al
ffff800000110126: 24 7f                	andb	$127, %al
ffff800000110128: 0f b6 d0             	movzbl	%al, %edx
ffff80000011012b: 48 89 e0             	movq	%rsp, %rax
ffff80000011012e: 89 10                	movl	%edx, (%rax)
ffff800000110130: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000011013a: 48 ba 61 8f 11 00 00 80 ff ff	movabsq	$-140737487204511, %rdx # imm = 0xFFFF800000118F61
ffff800000110144: 49 ba 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r10 # imm = 0xFFFF80000010CC40
ffff80000011014e: 31 c0                	xorl	%eax, %eax
ffff800000110150: be 6d 00 00 00       	movl	$109, %esi
ffff800000110155: 41 ff d2             	callq	*%r10
; 	}
ffff800000110158: e9 00 00 00 00       	jmp	0xffff80000011015d <check_buddy_consistency+0x10d>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000011015d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110161: 8a 40 12             	movb	18(%rax), %al
ffff800000110164: c0 e8 07             	shrb	$7, %al
ffff800000110167: 0f b6 c0             	movzbl	%al, %eax
ffff80000011016a: 83 f8 00             	cmpl	$0, %eax
ffff80000011016d: 0f 84 61 00 00 00    	je	0xffff8000001101d4 <check_buddy_consistency+0x184>
ffff800000110173: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110177: 48 b8 f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rax # imm = 0xFFFF8000001102F0
ffff800000110181: ff d0                	callq	*%rax
ffff800000110183: 83 f8 00             	cmpl	$0, %eax
ffff800000110186: 0f 84 48 00 00 00    	je	0xffff8000001101d4 <check_buddy_consistency+0x184>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000011018c: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110190: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff80000011019a: ff d0                	callq	*%rax
ffff80000011019c: 48 89 c1             	movq	%rax, %rcx
ffff80000011019f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001101a3: 8a 40 12             	movb	18(%rax), %al
ffff8000001101a6: 24 7f                	andb	$127, %al
ffff8000001101a8: 44 0f b6 c0          	movzbl	%al, %r8d
ffff8000001101ac: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001101b6: 48 ba bd 90 11 00 00 80 ff ff	movabsq	$-140737487204163, %rdx # imm = 0xFFFF8000001190BD
ffff8000001101c0: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001101ca: 31 c0                	xorl	%eax, %eax
ffff8000001101cc: be 73 00 00 00       	movl	$115, %esi
ffff8000001101d1: 41 ff d1             	callq	*%r9
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff8000001101d4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001101d8: 8a 40 12             	movb	18(%rax), %al
ffff8000001101db: c0 e8 07             	shrb	$7, %al
ffff8000001101de: 3c 00                	cmpb	$0, %al
ffff8000001101e0: 0f 85 61 00 00 00    	jne	0xffff800000110247 <check_buddy_consistency+0x1f7>
ffff8000001101e6: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff8000001101ea: 48 b8 f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rax # imm = 0xFFFF8000001102F0
ffff8000001101f4: ff d0                	callq	*%rax
ffff8000001101f6: 83 f8 00             	cmpl	$0, %eax
ffff8000001101f9: 0f 85 48 00 00 00    	jne	0xffff800000110247 <check_buddy_consistency+0x1f7>
; 		panic("page %p of order %u is in use, but on the free list",
ffff8000001101ff: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110203: 48 b8 a0 fb 10 00 00 80 ff ff	movabsq	$-140737487242336, %rax # imm = 0xFFFF80000010FBA0
ffff80000011020d: ff d0                	callq	*%rax
ffff80000011020f: 48 89 c1             	movq	%rax, %rcx
ffff800000110212: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110216: 8a 40 12             	movb	18(%rax), %al
ffff800000110219: 24 7f                	andb	$127, %al
ffff80000011021b: 44 0f b6 c0          	movzbl	%al, %r8d
ffff80000011021f: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110229: 48 ba a2 8b 11 00 00 80 ff ff	movabsq	$-140737487205470, %rdx # imm = 0xFFFF800000118BA2
ffff800000110233: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff80000011023d: 31 c0                	xorl	%eax, %eax
ffff80000011023f: be 78 00 00 00       	movl	$120, %esi
ffff800000110244: 41 ff d1             	callq	*%r9
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff800000110247: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011024b: 8a 40 12             	movb	18(%rax), %al
ffff80000011024e: c0 e8 07             	shrb	$7, %al
ffff800000110251: 0f b6 c0             	movzbl	%al, %eax
ffff800000110254: 83 f8 00             	cmpl	$0, %eax
ffff800000110257: 0f 84 21 00 00 00    	je	0xffff80000011027e <check_buddy_consistency+0x22e>
ffff80000011025d: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110261: 48 b8 f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rax # imm = 0xFFFF8000001102F0
ffff80000011026b: ff d0                	callq	*%rax
ffff80000011026d: 83 f8 00             	cmpl	$0, %eax
ffff800000110270: 0f 84 08 00 00 00    	je	0xffff80000011027e <check_buddy_consistency+0x22e>
; 		parent = page;
ffff800000110276: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011027a: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	if (order == 0) {
ffff80000011027e: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000110283: 0f 85 05 00 00 00    	jne	0xffff80000011028e <check_buddy_consistency+0x23e>
; 		return;
ffff800000110289: e9 52 00 00 00       	jmp	0xffff8000001102e0 <check_buddy_consistency+0x290>
; 	--order;
ffff80000011028e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110292: 48 83 c0 ff          	addq	$-1, %rax
ffff800000110296: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	check_buddy_consistency(addr, order, parent);
ffff80000011029a: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011029e: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001102a2: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff8000001102a6: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff8000001102b0: ff d0                	callq	*%rax
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff8000001102b2: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001102b6: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001102ba: 48 83 c0 0c          	addq	$12, %rax
ffff8000001102be: 89 c1                	movl	%eax, %ecx
ffff8000001102c0: b8 01 00 00 00       	movl	$1, %eax
ffff8000001102c5: d3 e0                	shll	%cl, %eax
ffff8000001102c7: 48 98                	cltq
ffff8000001102c9: 48 09 c7             	orq	%rax, %rdi
ffff8000001102cc: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001102d0: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff8000001102d4: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff8000001102de: ff d0                	callq	*%rax
; }
ffff8000001102e0: 48 83 c4 40          	addq	$64, %rsp
ffff8000001102e4: 5d                   	popq	%rbp
ffff8000001102e5: c3                   	retq
ffff8000001102e6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001102f0 <list_is_empty>:
; {
ffff8000001102f0: 55                   	pushq	%rbp
ffff8000001102f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001102f4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return head->next == head;
ffff8000001102f8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001102fc: 48 8b 00             	movq	(%rax), %rax
ffff8000001102ff: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000110303: 0f 94 c0             	sete	%al
ffff800000110306: 24 01                	andb	$1, %al
ffff800000110308: 0f b6 c0             	movzbl	%al, %eax
ffff80000011030b: 5d                   	popq	%rbp
ffff80000011030c: c3                   	retq
ffff80000011030d: 0f 1f 00             	nopl	(%rax)

ffff800000110310 <lab1_check_buddy_consistency>:
; {
ffff800000110310: 55                   	pushq	%rbp
ffff800000110311: 48 89 e5             	movq	%rsp, %rbp
ffff800000110314: 48 83 ec 10          	subq	$16, %rsp
; 	for (addr = 0;
ffff800000110318: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < BOOT_MAP_LIM;
ffff800000110320: 48 81 7d f0 00 00 80 00      	cmpq	$8388608, -16(%rbp) # imm = 0x800000
; 	for (addr = 0;
ffff800000110328: 0f 83 2e 00 00 00    	jae	0xffff80000011035c <lab1_check_buddy_consistency+0x4c>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000011032e: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000110332: 31 c0                	xorl	%eax, %eax
ffff800000110334: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff80000011033e: 31 c9                	xorl	%ecx, %ecx
ffff800000110340: 89 ca                	movl	%ecx, %edx
ffff800000110342: be 09 00 00 00       	movl	$9, %esi
ffff800000110347: ff d0                	callq	*%rax
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff800000110349: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011034d: 48 05 00 00 20 00    	addq	$2097152, %rax          # imm = 0x200000
ffff800000110353: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff800000110357: e9 c4 ff ff ff       	jmp	0xffff800000110320 <lab1_check_buddy_consistency+0x10>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff80000011035c: 48 bf 2d 95 11 00 00 80 ff ff	movabsq	$-140737487203027, %rdi # imm = 0xFFFF80000011952D
ffff800000110366: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000110370: 31 c0                	xorl	%eax, %eax
ffff800000110372: ff d1                	callq	*%rcx
; }
ffff800000110374: 48 83 c4 10          	addq	$16, %rsp
ffff800000110378: 5d                   	popq	%rbp
ffff800000110379: c3                   	retq
ffff80000011037a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110380 <lab1_check_split_and_merge>:
; {
ffff800000110380: 55                   	pushq	%rbp
ffff800000110381: 48 89 e5             	movq	%rsp, %rbp
ffff800000110384: 48 81 ec d0 00 00 00 	subq	$208, %rsp
ffff80000011038b: 89 7d fc             	movl	%edi, -4(%rbp)
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff80000011038e: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110398: bf 09 00 00 00       	movl	$9, %edi
ffff80000011039d: ff d0                	callq	*%rax
ffff80000011039f: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff8000001103a6: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff8000001103b0: bf 09 00 00 00       	movl	$9, %edi
ffff8000001103b5: ff d0                	callq	*%rax
ffff8000001103b7: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff8000001103be: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff8000001103c6: 0f 85 27 00 00 00    	jne	0xffff8000001103f3 <lab1_check_split_and_merge+0x73>
; 		panic("can't allocate 2M page!");
ffff8000001103cc: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001103d6: 48 ba 2a 8c 11 00 00 80 ff ff	movabsq	$-140737487205334, %rdx # imm = 0xFFFF800000118C2A
ffff8000001103e0: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001103ea: 31 c0                	xorl	%eax, %eax
ffff8000001103ec: be a9 00 00 00       	movl	$169, %esi
ffff8000001103f1: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff8000001103f3: e9 00 00 00 00       	jmp	0xffff8000001103f8 <lab1_check_split_and_merge+0x78>
ffff8000001103f8: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110402: bf 09 00 00 00       	movl	$9, %edi
ffff800000110407: ff d0                	callq	*%rax
ffff800000110409: 48 83 c0 01          	addq	$1, %rax
ffff80000011040d: 48 3b 85 38 ff ff ff 	cmpq	-200(%rbp), %rax
ffff800000110414: 0f 84 32 00 00 00    	je	0xffff80000011044c <lab1_check_split_and_merge+0xcc>
ffff80000011041a: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110424: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011042e: 48 b9 e2 8d 11 00 00 80 ff ff	movabsq	$-140737487204894, %rcx # imm = 0xFFFF800000118DE2
ffff800000110438: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000110442: 31 c0                	xorl	%eax, %eax
ffff800000110444: be ad 00 00 00       	movl	$173, %esi
ffff800000110449: 41 ff d0             	callq	*%r8
ffff80000011044c: e9 00 00 00 00       	jmp	0xffff800000110451 <lab1_check_split_and_merge+0xd1>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000110451: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff80000011045c: 48 83 bd 40 ff ff ff 0a      	cmpq	$10, -192(%rbp)
ffff800000110464: 0f 83 5f 00 00 00    	jae	0xffff8000001104c9 <lab1_check_split_and_merge+0x149>
; 		stolen_free_list[order] = buddy_free_list[order];
ffff80000011046a: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
ffff800000110471: 48 c1 e1 04          	shlq	$4, %rcx
ffff800000110475: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000011047f: 48 8b 14 01          	movq	(%rcx,%rax), %rdx
ffff800000110483: 48 8b 74 01 08       	movq	8(%rcx,%rax), %rsi
ffff800000110488: 48 89 b4 0d 58 ff ff ff      	movq	%rsi, -168(%rbp,%rcx)
ffff800000110490: 48 89 94 0d 50 ff ff ff      	movq	%rdx, -176(%rbp,%rcx)
; 		list_init(buddy_free_list + order);
ffff800000110498: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff80000011049f: 48 c1 e7 04          	shlq	$4, %rdi
ffff8000001104a3: 48 01 c7             	addq	%rax, %rdi
ffff8000001104a6: 48 b8 70 09 11 00 00 80 ff ff	movabsq	$-140737487238800, %rax # imm = 0xFFFF800000110970
ffff8000001104b0: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001104b2: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001104b9: 48 83 c0 01          	addq	$1, %rax
ffff8000001104bd: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff8000001104c4: e9 93 ff ff ff       	jmp	0xffff80000011045c <lab1_check_split_and_merge+0xdc>
; 	page_free(page);
ffff8000001104c9: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff8000001104d0: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff8000001104da: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff8000001104dc: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff8000001104e7: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff8000001104ef: 0f 83 75 00 00 00    	jae	0xffff80000011056a <lab1_check_split_and_merge+0x1ea>
; 		assert(count_free_pages(order) == 0);
ffff8000001104f5: e9 00 00 00 00       	jmp	0xffff8000001104fa <lab1_check_split_and_merge+0x17a>
ffff8000001104fa: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff800000110501: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000011050b: ff d0                	callq	*%rax
ffff80000011050d: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110511: 0f 84 32 00 00 00    	je	0xffff800000110549 <lab1_check_split_and_merge+0x1c9>
ffff800000110517: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110521: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011052b: 48 b9 df 92 11 00 00 80 ff ff	movabsq	$-140737487203617, %rcx # imm = 0xFFFF8000001192DF
ffff800000110535: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011053f: 31 c0                	xorl	%eax, %eax
ffff800000110541: be ba 00 00 00       	movl	$186, %esi
ffff800000110546: 41 ff d0             	callq	*%r8
ffff800000110549: e9 00 00 00 00       	jmp	0xffff80000011054e <lab1_check_split_and_merge+0x1ce>
; 	}
ffff80000011054e: e9 00 00 00 00       	jmp	0xffff800000110553 <lab1_check_split_and_merge+0x1d3>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff800000110553: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff80000011055a: 48 83 c0 01          	addq	$1, %rax
ffff80000011055e: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110565: e9 7d ff ff ff       	jmp	0xffff8000001104e7 <lab1_check_split_and_merge+0x167>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000011056a: e9 00 00 00 00       	jmp	0xffff80000011056f <lab1_check_split_and_merge+0x1ef>
ffff80000011056f: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110579: bf 09 00 00 00       	movl	$9, %edi
ffff80000011057e: ff d0                	callq	*%rax
ffff800000110580: 48 83 f8 01          	cmpq	$1, %rax
ffff800000110584: 0f 84 32 00 00 00    	je	0xffff8000001105bc <lab1_check_split_and_merge+0x23c>
ffff80000011058a: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110594: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011059e: 48 b9 6b 86 11 00 00 80 ff ff	movabsq	$-140737487206805, %rcx # imm = 0xFFFF80000011866B
ffff8000001105a8: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001105b2: 31 c0                	xorl	%eax, %eax
ffff8000001105b4: be bd 00 00 00       	movl	$189, %esi
ffff8000001105b9: 41 ff d0             	callq	*%r8
ffff8000001105bc: e9 00 00 00 00       	jmp	0xffff8000001105c1 <lab1_check_split_and_merge+0x241>
; 	page = page_alloc(0);
ffff8000001105c1: 31 c0                	xorl	%eax, %eax
ffff8000001105c3: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff8000001105cd: 31 ff                	xorl	%edi, %edi
ffff8000001105cf: ff d0                	callq	*%rax
ffff8000001105d1: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff8000001105d8: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff8000001105e0: 0f 85 27 00 00 00    	jne	0xffff80000011060d <lab1_check_split_and_merge+0x28d>
; 		panic("can't allocate 4K page!");
ffff8000001105e6: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001105f0: 48 ba 97 8a 11 00 00 80 ff ff	movabsq	$-140737487205737, %rdx # imm = 0xFFFF800000118A97
ffff8000001105fa: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000110604: 31 c0                	xorl	%eax, %eax
ffff800000110606: be c3 00 00 00       	movl	$195, %esi
ffff80000011060b: ff d1                	callq	*%rcx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000011060d: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff800000110618: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff800000110620: 0f 83 75 00 00 00    	jae	0xffff80000011069b <lab1_check_split_and_merge+0x31b>
; 		assert(count_free_pages(order) == 1);
ffff800000110626: e9 00 00 00 00       	jmp	0xffff80000011062b <lab1_check_split_and_merge+0x2ab>
ffff80000011062b: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff800000110632: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000011063c: ff d0                	callq	*%rax
ffff80000011063e: 48 83 f8 01          	cmpq	$1, %rax
ffff800000110642: 0f 84 32 00 00 00    	je	0xffff80000011067a <lab1_check_split_and_merge+0x2fa>
ffff800000110648: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110652: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011065c: 48 b9 3f 94 11 00 00 80 ff ff	movabsq	$-140737487203265, %rcx # imm = 0xFFFF80000011943F
ffff800000110666: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000110670: 31 c0                	xorl	%eax, %eax
ffff800000110672: be c8 00 00 00       	movl	$200, %esi
ffff800000110677: 41 ff d0             	callq	*%r8
ffff80000011067a: e9 00 00 00 00       	jmp	0xffff80000011067f <lab1_check_split_and_merge+0x2ff>
; 	}
ffff80000011067f: e9 00 00 00 00       	jmp	0xffff800000110684 <lab1_check_split_and_merge+0x304>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff800000110684: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff80000011068b: 48 83 c0 01          	addq	$1, %rax
ffff80000011068f: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110696: e9 7d ff ff ff       	jmp	0xffff800000110618 <lab1_check_split_and_merge+0x298>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000011069b: e9 00 00 00 00       	jmp	0xffff8000001106a0 <lab1_check_split_and_merge+0x320>
ffff8000001106a0: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff8000001106aa: bf 09 00 00 00       	movl	$9, %edi
ffff8000001106af: ff d0                	callq	*%rax
ffff8000001106b1: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001106b5: 0f 84 32 00 00 00    	je	0xffff8000001106ed <lab1_check_split_and_merge+0x36d>
ffff8000001106bb: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001106c5: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001106cf: 48 b9 28 8b 11 00 00 80 ff ff	movabsq	$-140737487205592, %rcx # imm = 0xFFFF800000118B28
ffff8000001106d9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001106e3: 31 c0                	xorl	%eax, %eax
ffff8000001106e5: be cb 00 00 00       	movl	$203, %esi
ffff8000001106ea: 41 ff d0             	callq	*%r8
ffff8000001106ed: e9 00 00 00 00       	jmp	0xffff8000001106f2 <lab1_check_split_and_merge+0x372>
; 	page_free(page);
ffff8000001106f2: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff8000001106f9: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff800000110703: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff800000110705: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff800000110710: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff800000110718: 0f 83 75 00 00 00    	jae	0xffff800000110793 <lab1_check_split_and_merge+0x413>
; 		assert(count_free_pages(order) == 0);
ffff80000011071e: e9 00 00 00 00       	jmp	0xffff800000110723 <lab1_check_split_and_merge+0x3a3>
ffff800000110723: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff80000011072a: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110734: ff d0                	callq	*%rax
ffff800000110736: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011073a: 0f 84 32 00 00 00    	je	0xffff800000110772 <lab1_check_split_and_merge+0x3f2>
ffff800000110740: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000011074a: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000110754: 48 b9 df 92 11 00 00 80 ff ff	movabsq	$-140737487203617, %rcx # imm = 0xFFFF8000001192DF
ffff80000011075e: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000110768: 31 c0                	xorl	%eax, %eax
ffff80000011076a: be d2 00 00 00       	movl	$210, %esi
ffff80000011076f: 41 ff d0             	callq	*%r8
ffff800000110772: e9 00 00 00 00       	jmp	0xffff800000110777 <lab1_check_split_and_merge+0x3f7>
; 	}
ffff800000110777: e9 00 00 00 00       	jmp	0xffff80000011077c <lab1_check_split_and_merge+0x3fc>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000011077c: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff800000110783: 48 83 c0 01          	addq	$1, %rax
ffff800000110787: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff80000011078e: e9 7d ff ff ff       	jmp	0xffff800000110710 <lab1_check_split_and_merge+0x390>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff800000110793: e9 00 00 00 00       	jmp	0xffff800000110798 <lab1_check_split_and_merge+0x418>
ffff800000110798: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff8000001107a2: bf 09 00 00 00       	movl	$9, %edi
ffff8000001107a7: ff d0                	callq	*%rax
ffff8000001107a9: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001107ad: 0f 84 32 00 00 00    	je	0xffff8000001107e5 <lab1_check_split_and_merge+0x465>
ffff8000001107b3: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001107bd: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001107c7: 48 b9 6b 86 11 00 00 80 ff ff	movabsq	$-140737487206805, %rcx # imm = 0xFFFF80000011866B
ffff8000001107d1: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001107db: 31 c0                	xorl	%eax, %eax
ffff8000001107dd: be d5 00 00 00       	movl	$213, %esi
ffff8000001107e2: 41 ff d0             	callq	*%r8
ffff8000001107e5: e9 00 00 00 00       	jmp	0xffff8000001107ea <lab1_check_split_and_merge+0x46a>
; 	if (flags & ALLOC_HUGE)
ffff8000001107ea: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001107ed: 83 e0 02             	andl	$2, %eax
ffff8000001107f0: 83 f8 00             	cmpl	$0, %eax
ffff8000001107f3: 0f 84 1d 00 00 00    	je	0xffff800000110816 <lab1_check_split_and_merge+0x496>
; 		page = page_alloc(ALLOC_HUGE);
ffff8000001107f9: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000110803: bf 02 00 00 00       	movl	$2, %edi
ffff800000110808: ff d0                	callq	*%rax
ffff80000011080a: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
ffff800000110811: e9 18 00 00 00       	jmp	0xffff80000011082e <lab1_check_split_and_merge+0x4ae>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff800000110816: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff800000110820: bf 09 00 00 00       	movl	$9, %edi
ffff800000110825: ff d0                	callq	*%rax
ffff800000110827: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff80000011082e: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff800000110836: 0f 85 27 00 00 00    	jne	0xffff800000110863 <lab1_check_split_and_merge+0x4e3>
; 		panic("can't allocate 2M page!");
ffff80000011083c: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110846: 48 ba 2a 8c 11 00 00 80 ff ff	movabsq	$-140737487205334, %rdx # imm = 0xFFFF800000118C2A
ffff800000110850: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011085a: 31 c0                	xorl	%eax, %eax
ffff80000011085c: be de 00 00 00       	movl	$222, %esi
ffff800000110861: ff d1                	callq	*%rcx
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000110863: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff80000011086e: 48 83 bd 40 ff ff ff 0a      	cmpq	$10, -192(%rbp)
ffff800000110876: 0f 83 52 00 00 00    	jae	0xffff8000001108ce <lab1_check_split_and_merge+0x54e>
; 		buddy_free_list[order] = stolen_free_list[order];
ffff80000011087c: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff800000110883: 48 c1 e0 04          	shlq	$4, %rax
ffff800000110887: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff800000110891: 48 01 c8             	addq	%rcx, %rax
ffff800000110894: 48 8b 95 40 ff ff ff 	movq	-192(%rbp), %rdx
ffff80000011089b: 48 8d 8d 50 ff ff ff 	leaq	-176(%rbp), %rcx
ffff8000001108a2: 48 c1 e2 04          	shlq	$4, %rdx
ffff8000001108a6: 48 01 d1             	addq	%rdx, %rcx
ffff8000001108a9: 48 8b 11             	movq	(%rcx), %rdx
ffff8000001108ac: 48 89 10             	movq	%rdx, (%rax)
ffff8000001108af: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff8000001108b3: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001108b7: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001108be: 48 83 c0 01          	addq	$1, %rax
ffff8000001108c2: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff8000001108c9: e9 a0 ff ff ff       	jmp	0xffff80000011086e <lab1_check_split_and_merge+0x4ee>
; 	page_free(page);
ffff8000001108ce: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff8000001108d5: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff8000001108df: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff8000001108e1: 48 bf 70 92 11 00 00 80 ff ff	movabsq	$-140737487203728, %rdi # imm = 0xFFFF800000119270
ffff8000001108eb: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001108f5: 31 c0                	xorl	%eax, %eax
ffff8000001108f7: ff d1                	callq	*%rcx
; }
ffff8000001108f9: 48 81 c4 d0 00 00 00 	addq	$208, %rsp
ffff800000110900: 5d                   	popq	%rbp
ffff800000110901: c3                   	retq
ffff800000110902: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011090c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110910 <lab1_check_mem>:
; {
ffff800000110910: 55                   	pushq	%rbp
ffff800000110911: 48 89 e5             	movq	%rsp, %rbp
ffff800000110914: 48 83 ec 10          	subq	$16, %rsp
ffff800000110918: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	lab1_check_free_list_avail();
ffff80000011091c: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff800000110926: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff800000110928: 48 b8 d0 fb 10 00 00 80 ff ff	movabsq	$-140737487242288, %rax # imm = 0xFFFF80000010FBD0
ffff800000110932: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff800000110934: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110938: 48 b8 e0 fc 10 00 00 80 ff ff	movabsq	$-140737487242016, %rax # imm = 0xFFFF80000010FCE0
ffff800000110942: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff800000110944: 48 b8 10 03 11 00 00 80 ff ff	movabsq	$-140737487240432, %rax # imm = 0xFFFF800000110310
ffff80000011094e: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff800000110950: 31 c0                	xorl	%eax, %eax
ffff800000110952: 48 b8 80 03 11 00 00 80 ff ff	movabsq	$-140737487240320, %rax # imm = 0xFFFF800000110380
ffff80000011095c: 31 ff                	xorl	%edi, %edi
ffff80000011095e: ff d0                	callq	*%rax
; }
ffff800000110960: 48 83 c4 10          	addq	$16, %rsp
ffff800000110964: 5d                   	popq	%rbp
ffff800000110965: c3                   	retq
ffff800000110966: cc                   	int3
ffff800000110967: cc                   	int3
ffff800000110968: cc                   	int3
ffff800000110969: cc                   	int3
ffff80000011096a: cc                   	int3
ffff80000011096b: cc                   	int3
ffff80000011096c: cc                   	int3
ffff80000011096d: cc                   	int3
ffff80000011096e: cc                   	int3
ffff80000011096f: cc                   	int3

ffff800000110970 <list_init>:
; {
ffff800000110970: 55                   	pushq	%rbp
ffff800000110971: 48 89 e5             	movq	%rsp, %rbp
ffff800000110974: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	head->next = head;
ffff800000110978: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000011097c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110980: 48 89 08             	movq	%rcx, (%rax)
; 	head->prev = head;
ffff800000110983: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110987: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011098b: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff80000011098f: 5d                   	popq	%rbp
ffff800000110990: c3                   	retq
ffff800000110991: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011099b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001109a0 <list_insert_after>:
; {
ffff8000001109a0: 55                   	pushq	%rbp
ffff8000001109a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001109a4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001109a8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	new->prev = after;
ffff8000001109ac: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001109b0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001109b4: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	new->next = after->next;
ffff8000001109b8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001109bc: 48 8b 08             	movq	(%rax), %rcx
ffff8000001109bf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001109c3: 48 89 08             	movq	%rcx, (%rax)
; 	after->next->prev = new;
ffff8000001109c6: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001109ca: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001109ce: 48 8b 00             	movq	(%rax), %rax
ffff8000001109d1: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	after->next = new;
ffff8000001109d5: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001109d9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001109dd: 48 89 08             	movq	%rcx, (%rax)
; }
ffff8000001109e0: 5d                   	popq	%rbp
ffff8000001109e1: c3                   	retq
ffff8000001109e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001109ec: 0f 1f 40 00          	nopl	(%rax)

ffff8000001109f0 <list_insert_before>:
; {
ffff8000001109f0: 55                   	pushq	%rbp
ffff8000001109f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001109f4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001109f8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	new->next = before;
ffff8000001109fc: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110a00: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110a04: 48 89 08             	movq	%rcx, (%rax)
; 	new->prev = before->prev;
ffff800000110a07: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a0b: 48 8b 48 08          	movq	8(%rax), %rcx
ffff800000110a0f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110a13: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	before->prev->next = new;
ffff800000110a17: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000110a1b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a1f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110a23: 48 89 08             	movq	%rcx, (%rax)
; 	before->prev = new;
ffff800000110a26: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000110a2a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a2e: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff800000110a32: 5d                   	popq	%rbp
ffff800000110a33: c3                   	retq
ffff800000110a34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110a3e: 66 90                	nop

ffff800000110a40 <list_del>:
; {
ffff800000110a40: 55                   	pushq	%rbp
ffff800000110a41: 48 89 e5             	movq	%rsp, %rbp
ffff800000110a44: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	node->prev->next = node->next;
ffff800000110a48: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a4c: 48 8b 08             	movq	(%rax), %rcx
ffff800000110a4f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a53: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110a57: 48 89 08             	movq	%rcx, (%rax)
; 	node->next->prev = node->prev;
ffff800000110a5a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a5e: 48 8b 48 08          	movq	8(%rax), %rcx
ffff800000110a62: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a66: 48 8b 00             	movq	(%rax), %rax
ffff800000110a69: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff800000110a6d: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110a71: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a75: 48 89 08             	movq	%rcx, (%rax)
; 	node->prev = node;
ffff800000110a78: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110a7c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a80: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff800000110a84: 5d                   	popq	%rbp
ffff800000110a85: c3                   	retq
ffff800000110a86: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110a90 <list_add>:
; {
ffff800000110a90: 55                   	pushq	%rbp
ffff800000110a91: 48 89 e5             	movq	%rsp, %rbp
ffff800000110a94: 48 83 ec 10          	subq	$16, %rsp
ffff800000110a98: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110a9c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	list_insert_after(head, new);
ffff800000110aa0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110aa4: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110aa8: 48 b8 a0 09 11 00 00 80 ff ff	movabsq	$-140737487238752, %rax # imm = 0xFFFF8000001109A0
ffff800000110ab2: ff d0                	callq	*%rax
; }
ffff800000110ab4: 48 83 c4 10          	addq	$16, %rsp
ffff800000110ab8: 5d                   	popq	%rbp
ffff800000110ab9: c3                   	retq
ffff800000110aba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110ac0 <list_add_tail>:
; {
ffff800000110ac0: 55                   	pushq	%rbp
ffff800000110ac1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110ac4: 48 83 ec 10          	subq	$16, %rsp
ffff800000110ac8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110acc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	list_insert_before(head, new);
ffff800000110ad0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110ad4: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110ad8: 48 b8 f0 09 11 00 00 80 ff ff	movabsq	$-140737487238672, %rax # imm = 0xFFFF8000001109F0
ffff800000110ae2: ff d0                	callq	*%rax
; }
ffff800000110ae4: 48 83 c4 10          	addq	$16, %rsp
ffff800000110ae8: 5d                   	popq	%rbp
ffff800000110ae9: c3                   	retq
ffff800000110aea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110af0 <list_pop_tail>:
; {
ffff800000110af0: 55                   	pushq	%rbp
ffff800000110af1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110af4: 48 83 ec 20          	subq	$32, %rsp
ffff800000110af8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (head->prev == head)
ffff800000110afc: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110b00: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110b04: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff800000110b08: 0f 85 0d 00 00 00    	jne	0xffff800000110b1b <list_pop_tail+0x2b>
; 		return NULL;
ffff800000110b0e: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000110b16: e9 24 00 00 00       	jmp	0xffff800000110b3f <list_pop_tail+0x4f>
; 	node = head->prev;
ffff800000110b1b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110b1f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110b23: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	list_del(node);
ffff800000110b27: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000110b2b: 48 b8 40 0a 11 00 00 80 ff ff	movabsq	$-140737487238592, %rax # imm = 0xFFFF800000110A40
ffff800000110b35: ff d0                	callq	*%rax
; 	return node;
ffff800000110b37: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110b3b: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000110b3f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110b43: 48 83 c4 20          	addq	$32, %rsp
ffff800000110b47: 5d                   	popq	%rbp
ffff800000110b48: c3                   	retq
ffff800000110b49: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000110b50 <list_pop>:
; {
ffff800000110b50: 55                   	pushq	%rbp
ffff800000110b51: 48 89 e5             	movq	%rsp, %rbp
ffff800000110b54: 48 83 ec 20          	subq	$32, %rsp
ffff800000110b58: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (head->next == head)
ffff800000110b5c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110b60: 48 8b 00             	movq	(%rax), %rax
ffff800000110b63: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff800000110b67: 0f 85 0d 00 00 00    	jne	0xffff800000110b7a <list_pop+0x2a>
; 		return NULL;
ffff800000110b6d: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000110b75: e9 23 00 00 00       	jmp	0xffff800000110b9d <list_pop+0x4d>
; 	node = head->next;
ffff800000110b7a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110b7e: 48 8b 00             	movq	(%rax), %rax
ffff800000110b81: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	list_del(node);
ffff800000110b85: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000110b89: 48 b8 40 0a 11 00 00 80 ff ff	movabsq	$-140737487238592, %rax # imm = 0xFFFF800000110A40
ffff800000110b93: ff d0                	callq	*%rax
; 	return node;
ffff800000110b95: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110b99: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000110b9d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110ba1: 48 83 c4 20          	addq	$32, %rsp
ffff800000110ba5: 5d                   	popq	%rbp
ffff800000110ba6: c3                   	retq
ffff800000110ba7: cc                   	int3
ffff800000110ba8: cc                   	int3
ffff800000110ba9: cc                   	int3
ffff800000110baa: cc                   	int3
ffff800000110bab: cc                   	int3
ffff800000110bac: cc                   	int3
ffff800000110bad: cc                   	int3
ffff800000110bae: cc                   	int3
ffff800000110baf: cc                   	int3

ffff800000110bb0 <vprintfmt>:
; {
ffff800000110bb0: 55                   	pushq	%rbp
ffff800000110bb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000110bb4: 48 81 ec 00 01 00 00 	subq	$256, %rsp              # imm = 0x100
ffff800000110bbb: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110bbf: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000110bc3: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000110bc7: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
ffff800000110bcb: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110bcf: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000110bd3: 48 8b 4a 10          	movq	16(%rdx), %rcx
ffff800000110bd7: 48 89 48 10          	movq	%rcx, 16(%rax)
ffff800000110bdb: 48 8b 0a             	movq	(%rdx), %rcx
ffff800000110bde: 48 8b 52 08          	movq	8(%rdx), %rdx
ffff800000110be2: 48 89 50 08          	movq	%rdx, 8(%rax)
ffff800000110be6: 48 89 08             	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff800000110be9: e9 00 00 00 00       	jmp	0xffff800000110bee <vprintfmt+0x3e>
ffff800000110bee: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110bf2: 48 89 c1             	movq	%rax, %rcx
ffff800000110bf5: 48 83 c1 01          	addq	$1, %rcx
ffff800000110bf9: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff800000110bfd: 0f b6 00             	movzbl	(%rax), %eax
ffff800000110c00: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000110c03: 83 f8 25             	cmpl	$37, %eax
ffff800000110c06: 0f 84 25 00 00 00    	je	0xffff800000110c31 <vprintfmt+0x81>
; 			if (ch == '\0')
ffff800000110c0c: 83 7d b4 00          	cmpl	$0, -76(%rbp)
ffff800000110c10: 0f 85 09 00 00 00    	jne	0xffff800000110c1f <vprintfmt+0x6f>
; 				return;
ffff800000110c16: 48 81 c4 00 01 00 00 	addq	$256, %rsp              # imm = 0x100
ffff800000110c1d: 5d                   	popq	%rbp
ffff800000110c1e: c3                   	retq
; 			putch(ch, putdat);
ffff800000110c1f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110c23: 8b 7d b4             	movl	-76(%rbp), %edi
ffff800000110c26: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110c2a: ff d0                	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff800000110c2c: e9 bd ff ff ff       	jmp	0xffff800000110bee <vprintfmt+0x3e>
; 		padc = ' ';
ffff800000110c31: c6 45 93 20          	movb	$32, -109(%rbp)
; 		width = -1;
ffff800000110c35: c7 45 9c ff ff ff ff 	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
ffff800000110c3c: c7 45 98 ff ff ff ff 	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
ffff800000110c43: c7 45 a0 00 00 00 00 	movl	$0, -96(%rbp)
; 		altflag = 0;
ffff800000110c4a: c7 45 94 00 00 00 00 	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
ffff800000110c51: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110c55: 48 89 c1             	movq	%rax, %rcx
ffff800000110c58: 48 83 c1 01          	addq	$1, %rcx
ffff800000110c5c: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff800000110c60: 0f b6 00             	movzbl	(%rax), %eax
ffff800000110c63: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000110c66: 83 c0 dd             	addl	$-35, %eax
ffff800000110c69: 89 c1                	movl	%eax, %ecx
ffff800000110c6b: 48 89 4d 88          	movq	%rcx, -120(%rbp)
ffff800000110c6f: 83 e8 55             	subl	$85, %eax
ffff800000110c72: 0f 87 0a 06 00 00    	ja	0xffff800000111282 <vprintfmt+0x6d2>
ffff800000110c78: 48 8b 4d 88          	movq	-120(%rbp), %rcx
ffff800000110c7c: 48 b8 60 80 11 00 00 80 ff ff	movabsq	$-140737487208352, %rax # imm = 0xFFFF800000118060
ffff800000110c86: 48 8b 04 c8          	movq	(%rax,%rcx,8), %rax
ffff800000110c8a: ff e0                	jmpq	*%rax
; 			padc = '-';
ffff800000110c8c: c6 45 93 2d          	movb	$45, -109(%rbp)
; 			goto reswitch;
ffff800000110c90: e9 bc ff ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			padc = '0';
ffff800000110c95: c6 45 93 30          	movb	$48, -109(%rbp)
; 			goto reswitch;
ffff800000110c99: e9 b3 ff ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
ffff800000110c9e: c7 45 98 00 00 00 00 	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
ffff800000110ca5: 6b 45 98 0a          	imull	$10, -104(%rbp), %eax
ffff800000110ca9: 03 45 b4             	addl	-76(%rbp), %eax
ffff800000110cac: 83 e8 30             	subl	$48, %eax
ffff800000110caf: 89 45 98             	movl	%eax, -104(%rbp)
; 				ch = *fmt;
ffff800000110cb2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110cb6: 0f be 00             	movsbl	(%rax), %eax
ffff800000110cb9: 89 45 b4             	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
ffff800000110cbc: 83 7d b4 30          	cmpl	$48, -76(%rbp)
ffff800000110cc0: 0f 8c 0a 00 00 00    	jl	0xffff800000110cd0 <vprintfmt+0x120>
ffff800000110cc6: 83 7d b4 39          	cmpl	$57, -76(%rbp)
ffff800000110cca: 0f 8e 05 00 00 00    	jle	0xffff800000110cd5 <vprintfmt+0x125>
; 					break;
ffff800000110cd0: e9 16 00 00 00       	jmp	0xffff800000110ceb <vprintfmt+0x13b>
; 			}
ffff800000110cd5: e9 00 00 00 00       	jmp	0xffff800000110cda <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
ffff800000110cda: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110cde: 48 83 c0 01          	addq	$1, %rax
ffff800000110ce2: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff800000110ce6: e9 ba ff ff ff       	jmp	0xffff800000110ca5 <vprintfmt+0xf5>
; 			goto process_precision;
ffff800000110ceb: e9 8c 00 00 00       	jmp	0xffff800000110d7c <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
ffff800000110cf0: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110cf4: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000110cfb: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110cfe: 89 45 84             	movl	%eax, -124(%rbp)
ffff800000110d01: 83 f8 28             	cmpl	$40, %eax
ffff800000110d04: 0f 87 22 00 00 00    	ja	0xffff800000110d2c <vprintfmt+0x17c>
ffff800000110d0a: 48 8b 8d 78 ff ff ff 	movq	-136(%rbp), %rcx
ffff800000110d11: 8b 55 84             	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
ffff800000110d14: 48 63 c2             	movslq	%edx, %rax
ffff800000110d17: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110d1b: 83 c2 08             	addl	$8, %edx
ffff800000110d1e: 89 11                	movl	%edx, (%rcx)
ffff800000110d20: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff800000110d27: e9 1d 00 00 00       	jmp	0xffff800000110d49 <vprintfmt+0x199>
ffff800000110d2c: 48 8b 8d 78 ff ff ff 	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
ffff800000110d33: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110d37: 48 89 d0             	movq	%rdx, %rax
ffff800000110d3a: 48 83 c2 08          	addq	$8, %rdx
ffff800000110d3e: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110d42: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff800000110d49: 48 8b 85 70 ff ff ff 	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
ffff800000110d50: 8b 00                	movl	(%rax), %eax
ffff800000110d52: 89 45 98             	movl	%eax, -104(%rbp)
; 			goto process_precision;
ffff800000110d55: e9 22 00 00 00       	jmp	0xffff800000110d7c <vprintfmt+0x1cc>
; 			if (width < 0)
ffff800000110d5a: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110d5e: 0f 8d 07 00 00 00    	jge	0xffff800000110d6b <vprintfmt+0x1bb>
; 				width = 0;
ffff800000110d64: c7 45 9c 00 00 00 00 	movl	$0, -100(%rbp)
; 			goto reswitch;
ffff800000110d6b: e9 e1 fe ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			altflag = 1;
ffff800000110d70: c7 45 94 01 00 00 00 	movl	$1, -108(%rbp)
; 			goto reswitch;
ffff800000110d77: e9 d5 fe ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			if (width < 0)
ffff800000110d7c: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110d80: 0f 8d 0d 00 00 00    	jge	0xffff800000110d93 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
ffff800000110d86: 8b 45 98             	movl	-104(%rbp), %eax
ffff800000110d89: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110d8c: c7 45 98 ff ff ff ff 	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
ffff800000110d93: e9 b9 fe ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			lflag++;
ffff800000110d98: 8b 45 a0             	movl	-96(%rbp), %eax
ffff800000110d9b: 83 c0 01             	addl	$1, %eax
ffff800000110d9e: 89 45 a0             	movl	%eax, -96(%rbp)
; 			goto reswitch;
ffff800000110da1: e9 ab fe ff ff       	jmp	0xffff800000110c51 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
ffff800000110da6: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110daa: 48 89 85 58 ff ff ff 	movq	%rax, -168(%rbp)
ffff800000110db1: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110db5: 48 89 85 60 ff ff ff 	movq	%rax, -160(%rbp)
ffff800000110dbc: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110dbf: 89 85 6c ff ff ff    	movl	%eax, -148(%rbp)
ffff800000110dc5: 83 f8 28             	cmpl	$40, %eax
ffff800000110dc8: 0f 87 25 00 00 00    	ja	0xffff800000110df3 <vprintfmt+0x243>
ffff800000110dce: 48 8b 8d 60 ff ff ff 	movq	-160(%rbp), %rcx
ffff800000110dd5: 8b 95 6c ff ff ff    	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
ffff800000110ddb: 48 63 c2             	movslq	%edx, %rax
ffff800000110dde: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110de2: 83 c2 08             	addl	$8, %edx
ffff800000110de5: 89 11                	movl	%edx, (%rcx)
ffff800000110de7: 48 89 85 50 ff ff ff 	movq	%rax, -176(%rbp)
ffff800000110dee: e9 1d 00 00 00       	jmp	0xffff800000110e10 <vprintfmt+0x260>
ffff800000110df3: 48 8b 8d 60 ff ff ff 	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
ffff800000110dfa: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110dfe: 48 89 d0             	movq	%rdx, %rax
ffff800000110e01: 48 83 c2 08          	addq	$8, %rdx
ffff800000110e05: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110e09: 48 89 85 50 ff ff ff 	movq	%rax, -176(%rbp)
ffff800000110e10: 48 8b 85 58 ff ff ff 	movq	-168(%rbp), %rax
ffff800000110e17: 48 8b 8d 50 ff ff ff 	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
ffff800000110e1e: 8b 39                	movl	(%rcx), %edi
ffff800000110e20: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110e24: ff d0                	callq	*%rax
; 			break;
ffff800000110e26: e9 9e 04 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 			err = va_arg(ap, int);
ffff800000110e2b: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110e2f: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110e36: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110e39: 89 85 4c ff ff ff    	movl	%eax, -180(%rbp)
ffff800000110e3f: 83 f8 28             	cmpl	$40, %eax
ffff800000110e42: 0f 87 25 00 00 00    	ja	0xffff800000110e6d <vprintfmt+0x2bd>
ffff800000110e48: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
ffff800000110e4f: 8b 95 4c ff ff ff    	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
ffff800000110e55: 48 63 c2             	movslq	%edx, %rax
ffff800000110e58: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110e5c: 83 c2 08             	addl	$8, %edx
ffff800000110e5f: 89 11                	movl	%edx, (%rcx)
ffff800000110e61: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff800000110e68: e9 1d 00 00 00       	jmp	0xffff800000110e8a <vprintfmt+0x2da>
ffff800000110e6d: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
ffff800000110e74: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110e78: 48 89 d0             	movq	%rdx, %rax
ffff800000110e7b: 48 83 c2 08          	addq	$8, %rdx
ffff800000110e7f: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110e83: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff800000110e8a: 48 8b 85 38 ff ff ff 	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
ffff800000110e91: 8b 00                	movl	(%rax), %eax
ffff800000110e93: 89 45 b0             	movl	%eax, -80(%rbp)
; 			if (err < 0)
ffff800000110e96: 83 7d b0 00          	cmpl	$0, -80(%rbp)
ffff800000110e9a: 0f 8d 08 00 00 00    	jge	0xffff800000110ea8 <vprintfmt+0x2f8>
; 				err = -err;
ffff800000110ea0: 31 c0                	xorl	%eax, %eax
ffff800000110ea2: 2b 45 b0             	subl	-80(%rbp), %eax
ffff800000110ea5: 89 45 b0             	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff800000110ea8: 48 63 45 b0          	movslq	-80(%rbp), %rax
ffff800000110eac: 48 83 f8 09          	cmpq	$9, %rax
ffff800000110eb0: 0f 83 23 00 00 00    	jae	0xffff800000110ed9 <vprintfmt+0x329>
ffff800000110eb6: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff800000110eba: 48 b8 10 83 11 00 00 80 ff ff	movabsq	$-140737487207664, %rax # imm = 0xFFFF800000118310
ffff800000110ec4: 48 8d 04 c8          	leaq	(%rax,%rcx,8), %rax
ffff800000110ec8: 48 8b 00             	movq	(%rax), %rax
ffff800000110ecb: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000110ecf: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110ed3: 0f 85 29 00 00 00    	jne	0xffff800000110f02 <vprintfmt+0x352>
; 				printfmt(putch, putdat, "error %d", err);
ffff800000110ed9: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110edd: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110ee1: 8b 4d b0             	movl	-80(%rbp), %ecx
ffff800000110ee4: 48 ba af 8f 11 00 00 80 ff ff	movabsq	$-140737487204433, %rdx # imm = 0xFFFF800000118FAF
ffff800000110eee: 49 b8 d0 12 11 00 00 80 ff ff	movabsq	$-140737487236400, %r8 # imm = 0xFFFF8000001112D0
ffff800000110ef8: 31 c0                	xorl	%eax, %eax
ffff800000110efa: 41 ff d0             	callq	*%r8
ffff800000110efd: e9 25 00 00 00       	jmp	0xffff800000110f27 <vprintfmt+0x377>
; 				printfmt(putch, putdat, "%s", p);
ffff800000110f02: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110f06: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110f0a: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff800000110f0e: 48 ba 78 88 11 00 00 80 ff ff	movabsq	$-140737487206280, %rdx # imm = 0xFFFF800000118878
ffff800000110f18: 49 b8 d0 12 11 00 00 80 ff ff	movabsq	$-140737487236400, %r8 # imm = 0xFFFF8000001112D0
ffff800000110f22: 31 c0                	xorl	%eax, %eax
ffff800000110f24: 41 ff d0             	callq	*%r8
; 			break;
ffff800000110f27: e9 9d 03 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110f2c: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110f30: 48 89 85 28 ff ff ff 	movq	%rax, -216(%rbp)
ffff800000110f37: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110f3a: 89 85 34 ff ff ff    	movl	%eax, -204(%rbp)
ffff800000110f40: 83 f8 28             	cmpl	$40, %eax
ffff800000110f43: 0f 87 25 00 00 00    	ja	0xffff800000110f6e <vprintfmt+0x3be>
ffff800000110f49: 48 8b 8d 28 ff ff ff 	movq	-216(%rbp), %rcx
ffff800000110f50: 8b 95 34 ff ff ff    	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110f56: 48 63 c2             	movslq	%edx, %rax
ffff800000110f59: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110f5d: 83 c2 08             	addl	$8, %edx
ffff800000110f60: 89 11                	movl	%edx, (%rcx)
ffff800000110f62: 48 89 85 20 ff ff ff 	movq	%rax, -224(%rbp)
ffff800000110f69: e9 1d 00 00 00       	jmp	0xffff800000110f8b <vprintfmt+0x3db>
ffff800000110f6e: 48 8b 8d 28 ff ff ff 	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110f75: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110f79: 48 89 d0             	movq	%rdx, %rax
ffff800000110f7c: 48 83 c2 08          	addq	$8, %rdx
ffff800000110f80: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110f84: 48 89 85 20 ff ff ff 	movq	%rax, -224(%rbp)
ffff800000110f8b: 48 8b 85 20 ff ff ff 	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110f92: 48 8b 00             	movq	(%rax), %rax
ffff800000110f95: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000110f99: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110f9d: 0f 85 0e 00 00 00    	jne	0xffff800000110fb1 <vprintfmt+0x401>
; 				p = "(null)";
ffff800000110fa3: 48 b8 fc 92 11 00 00 80 ff ff	movabsq	$-140737487203588, %rax # imm = 0xFFFF8000001192FC
ffff800000110fad: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
ffff800000110fb1: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110fb5: 0f 8e 56 00 00 00    	jle	0xffff800000111011 <vprintfmt+0x461>
ffff800000110fbb: 0f be 45 93          	movsbl	-109(%rbp), %eax
ffff800000110fbf: 83 f8 2d             	cmpl	$45, %eax
ffff800000110fc2: 0f 84 49 00 00 00    	je	0xffff800000111011 <vprintfmt+0x461>
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff800000110fc8: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff800000110fcc: 48 63 75 98          	movslq	-104(%rbp), %rsi
ffff800000110fd0: 48 b8 e0 23 11 00 00 80 ff ff	movabsq	$-140737487232032, %rax # imm = 0xFFFF8000001123E0
ffff800000110fda: ff d0                	callq	*%rax
ffff800000110fdc: 89 c1                	movl	%eax, %ecx
ffff800000110fde: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000110fe1: 29 c8                	subl	%ecx, %eax
ffff800000110fe3: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110fe6: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110fea: 0f 8e 1c 00 00 00    	jle	0xffff80000011100c <vprintfmt+0x45c>
; 					putch(padc, putdat);
ffff800000110ff0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110ff4: 0f be 7d 93          	movsbl	-109(%rbp), %edi
ffff800000110ff8: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110ffc: ff d0                	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff800000110ffe: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000111001: 83 c0 ff             	addl	$-1, %eax
ffff800000111004: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000111007: e9 da ff ff ff       	jmp	0xffff800000110fe6 <vprintfmt+0x436>
; 					putch(padc, putdat);
ffff80000011100c: e9 00 00 00 00       	jmp	0xffff800000111011 <vprintfmt+0x461>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff800000111011: e9 00 00 00 00       	jmp	0xffff800000111016 <vprintfmt+0x466>
ffff800000111016: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000011101a: 48 89 c1             	movq	%rax, %rcx
ffff80000011101d: 48 83 c1 01          	addq	$1, %rcx
ffff800000111021: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff800000111025: 0f be 08             	movsbl	(%rax), %ecx
ffff800000111028: 89 4d b4             	movl	%ecx, -76(%rbp)
ffff80000011102b: 31 c0                	xorl	%eax, %eax
ffff80000011102d: 83 f9 00             	cmpl	$0, %ecx
ffff800000111030: 88 85 1f ff ff ff    	movb	%al, -225(%rbp)
ffff800000111036: 0f 84 33 00 00 00    	je	0xffff80000011106f <vprintfmt+0x4bf>
ffff80000011103c: b0 01                	movb	$1, %al
ffff80000011103e: 83 7d 98 00          	cmpl	$0, -104(%rbp)
ffff800000111042: 88 85 1e ff ff ff    	movb	%al, -226(%rbp)
ffff800000111048: 0f 8c 15 00 00 00    	jl	0xffff800000111063 <vprintfmt+0x4b3>
ffff80000011104e: 8b 45 98             	movl	-104(%rbp), %eax
ffff800000111051: 83 c0 ff             	addl	$-1, %eax
ffff800000111054: 89 45 98             	movl	%eax, -104(%rbp)
ffff800000111057: 83 f8 00             	cmpl	$0, %eax
ffff80000011105a: 0f 9d c0             	setge	%al
ffff80000011105d: 88 85 1e ff ff ff    	movb	%al, -226(%rbp)
ffff800000111063: 8a 85 1e ff ff ff    	movb	-226(%rbp), %al
ffff800000111069: 88 85 1f ff ff ff    	movb	%al, -225(%rbp)
ffff80000011106f: 8a 85 1f ff ff ff    	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff800000111075: a8 01                	testb	$1, %al
ffff800000111077: 0f 85 05 00 00 00    	jne	0xffff800000111082 <vprintfmt+0x4d2>
ffff80000011107d: e9 52 00 00 00       	jmp	0xffff8000001110d4 <vprintfmt+0x524>
; 				if (altflag && (ch < ' ' || ch > '~'))
ffff800000111082: 83 7d 94 00          	cmpl	$0, -108(%rbp)
ffff800000111086: 0f 84 28 00 00 00    	je	0xffff8000001110b4 <vprintfmt+0x504>
ffff80000011108c: 83 7d b4 20          	cmpl	$32, -76(%rbp)
ffff800000111090: 0f 8c 0a 00 00 00    	jl	0xffff8000001110a0 <vprintfmt+0x4f0>
ffff800000111096: 83 7d b4 7e          	cmpl	$126, -76(%rbp)
ffff80000011109a: 0f 8e 14 00 00 00    	jle	0xffff8000001110b4 <vprintfmt+0x504>
; 					putch('?', putdat);
ffff8000001110a0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001110a4: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110a8: bf 3f 00 00 00       	movl	$63, %edi
ffff8000001110ad: ff d0                	callq	*%rax
ffff8000001110af: e9 0d 00 00 00       	jmp	0xffff8000001110c1 <vprintfmt+0x511>
; 					putch(ch, putdat);
ffff8000001110b4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001110b8: 8b 7d b4             	movl	-76(%rbp), %edi
ffff8000001110bb: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110bf: ff d0                	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
ffff8000001110c1: e9 00 00 00 00       	jmp	0xffff8000001110c6 <vprintfmt+0x516>
; 					width--)
ffff8000001110c6: 8b 45 9c             	movl	-100(%rbp), %eax
ffff8000001110c9: 83 c0 ff             	addl	$-1, %eax
ffff8000001110cc: 89 45 9c             	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff8000001110cf: e9 42 ff ff ff       	jmp	0xffff800000111016 <vprintfmt+0x466>
; 			for (; width > 0; width--)
ffff8000001110d4: e9 00 00 00 00       	jmp	0xffff8000001110d9 <vprintfmt+0x529>
ffff8000001110d9: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff8000001110dd: 0f 8e 1d 00 00 00    	jle	0xffff800000111100 <vprintfmt+0x550>
; 				putch(' ', putdat);
ffff8000001110e3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001110e7: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110eb: bf 20 00 00 00       	movl	$32, %edi
ffff8000001110f0: ff d0                	callq	*%rax
; 			for (; width > 0; width--)
ffff8000001110f2: 8b 45 9c             	movl	-100(%rbp), %eax
ffff8000001110f5: 83 c0 ff             	addl	$-1, %eax
ffff8000001110f8: 89 45 9c             	movl	%eax, -100(%rbp)
ffff8000001110fb: e9 d9 ff ff ff       	jmp	0xffff8000001110d9 <vprintfmt+0x529>
; 			break;
ffff800000111100: e9 c4 01 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 			num = getint(&ap, lflag);
ffff800000111105: 8b 75 a0             	movl	-96(%rbp), %esi
ffff800000111108: 48 b8 30 13 11 00 00 80 ff ff	movabsq	$-140737487236304, %rax # imm = 0xFFFF800000111330
ffff800000111112: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff800000111116: ff d0                	callq	*%rax
ffff800000111118: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
ffff80000011111c: 48 83 7d a8 00       	cmpq	$0, -88(%rbp)
ffff800000111121: 0f 8d 19 00 00 00    	jge	0xffff800000111140 <vprintfmt+0x590>
; 				putch('-', putdat);
ffff800000111127: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011112b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011112f: bf 2d 00 00 00       	movl	$45, %edi
ffff800000111134: ff d0                	callq	*%rax
; 				num = -(long long) num;
ffff800000111136: 31 c0                	xorl	%eax, %eax
ffff800000111138: 48 2b 45 a8          	subq	-88(%rbp), %rax
ffff80000011113c: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 10;
ffff800000111140: c7 45 a4 0a 00 00 00 	movl	$10, -92(%rbp)
; 			goto number;
ffff800000111147: e9 fb 00 00 00       	jmp	0xffff800000111247 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff80000011114c: 8b 75 a0             	movl	-96(%rbp), %esi
ffff80000011114f: 48 b8 60 14 11 00 00 80 ff ff	movabsq	$-140737487236000, %rax # imm = 0xFFFF800000111460
ffff800000111159: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff80000011115d: ff d0                	callq	*%rax
ffff80000011115f: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 10;
ffff800000111163: c7 45 a4 0a 00 00 00 	movl	$10, -92(%rbp)
; 			goto number;
ffff80000011116a: e9 d8 00 00 00       	jmp	0xffff800000111247 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff80000011116f: 8b 75 a0             	movl	-96(%rbp), %esi
ffff800000111172: 48 b8 60 14 11 00 00 80 ff ff	movabsq	$-140737487236000, %rax # imm = 0xFFFF800000111460
ffff80000011117c: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff800000111180: ff d0                	callq	*%rax
ffff800000111182: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 8;
ffff800000111186: c7 45 a4 08 00 00 00 	movl	$8, -92(%rbp)
; 			goto number;
ffff80000011118d: e9 b5 00 00 00       	jmp	0xffff800000111247 <vprintfmt+0x697>
; 			putch('0', putdat);
ffff800000111192: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111196: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011119a: bf 30 00 00 00       	movl	$48, %edi
ffff80000011119f: ff d0                	callq	*%rax
; 			putch('x', putdat);
ffff8000001111a1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001111a5: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001111a9: bf 78 00 00 00       	movl	$120, %edi
ffff8000001111ae: ff d0                	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
ffff8000001111b0: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff8000001111b4: 48 89 85 10 ff ff ff 	movq	%rax, -240(%rbp)
ffff8000001111bb: 8b 45 c0             	movl	-64(%rbp), %eax
ffff8000001111be: 89 85 18 ff ff ff    	movl	%eax, -232(%rbp)
ffff8000001111c4: 83 f8 28             	cmpl	$40, %eax
ffff8000001111c7: 0f 87 25 00 00 00    	ja	0xffff8000001111f2 <vprintfmt+0x642>
ffff8000001111cd: 48 8b 8d 10 ff ff ff 	movq	-240(%rbp), %rcx
ffff8000001111d4: 8b 95 18 ff ff ff    	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
ffff8000001111da: 48 63 c2             	movslq	%edx, %rax
ffff8000001111dd: 48 03 41 10          	addq	16(%rcx), %rax
ffff8000001111e1: 83 c2 08             	addl	$8, %edx
ffff8000001111e4: 89 11                	movl	%edx, (%rcx)
ffff8000001111e6: 48 89 85 08 ff ff ff 	movq	%rax, -248(%rbp)
ffff8000001111ed: e9 1d 00 00 00       	jmp	0xffff80000011120f <vprintfmt+0x65f>
ffff8000001111f2: 48 8b 8d 10 ff ff ff 	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
ffff8000001111f9: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001111fd: 48 89 d0             	movq	%rdx, %rax
ffff800000111200: 48 83 c2 08          	addq	$8, %rdx
ffff800000111204: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000111208: 48 89 85 08 ff ff ff 	movq	%rax, -248(%rbp)
ffff80000011120f: 48 8b 85 08 ff ff ff 	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
ffff800000111216: 48 8b 00             	movq	(%rax), %rax
; 			num = (unsigned long long)
ffff800000111219: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 16;
ffff80000011121d: c7 45 a4 10 00 00 00 	movl	$16, -92(%rbp)
; 			goto number;
ffff800000111224: e9 1e 00 00 00       	jmp	0xffff800000111247 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff800000111229: 8b 75 a0             	movl	-96(%rbp), %esi
ffff80000011122c: 48 b8 60 14 11 00 00 80 ff ff	movabsq	$-140737487236000, %rax # imm = 0xFFFF800000111460
ffff800000111236: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff80000011123a: ff d0                	callq	*%rax
ffff80000011123c: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 16;
ffff800000111240: c7 45 a4 10 00 00 00 	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
ffff800000111247: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011124b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011124f: 48 8b 55 a8          	movq	-88(%rbp), %rdx
ffff800000111253: 8b 4d a4             	movl	-92(%rbp), %ecx
ffff800000111256: 44 8b 45 9c          	movl	-100(%rbp), %r8d
ffff80000011125a: 44 0f be 4d 93       	movsbl	-109(%rbp), %r9d
ffff80000011125f: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff800000111269: ff d0                	callq	*%rax
; 			break;
ffff80000011126b: e9 59 00 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 			putch(ch, putdat);
ffff800000111270: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111274: 8b 7d b4             	movl	-76(%rbp), %edi
ffff800000111277: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011127b: ff d0                	callq	*%rax
; 			break;
ffff80000011127d: e9 47 00 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 			putch('%', putdat);
ffff800000111282: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111286: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011128a: bf 25 00 00 00       	movl	$37, %edi
ffff80000011128f: ff d0                	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff800000111291: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111295: 48 83 c0 ff          	addq	$-1, %rax
ffff800000111299: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000011129d: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001112a1: 0f be 40 ff          	movsbl	-1(%rax), %eax
ffff8000001112a5: 83 f8 25             	cmpl	$37, %eax
ffff8000001112a8: 0f 84 16 00 00 00    	je	0xffff8000001112c4 <vprintfmt+0x714>
ffff8000001112ae: e9 00 00 00 00       	jmp	0xffff8000001112b3 <vprintfmt+0x703>
ffff8000001112b3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001112b7: 48 83 c0 ff          	addq	$-1, %rax
ffff8000001112bb: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff8000001112bf: e9 d9 ff ff ff       	jmp	0xffff80000011129d <vprintfmt+0x6ed>
; 			break;
ffff8000001112c4: e9 00 00 00 00       	jmp	0xffff8000001112c9 <vprintfmt+0x719>
; 	while (1) {
ffff8000001112c9: e9 1b f9 ff ff       	jmp	0xffff800000110be9 <vprintfmt+0x39>
ffff8000001112ce: 66 90                	nop

ffff8000001112d0 <printfmt>:
; {
ffff8000001112d0: 55                   	pushq	%rbp
ffff8000001112d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001112d4: 48 83 ec 60          	subq	$96, %rsp
ffff8000001112d8: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff8000001112dc: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff8000001112e0: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff8000001112e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001112e8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001112ec: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001112f0: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff8000001112f4: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001112f8: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff8000001112fc: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000111300: c7 45 d4 30 00 00 00 	movl	$48, -44(%rbp)
ffff800000111307: c7 45 d0 18 00 00 00 	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000011130e: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111312: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111316: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000011131a: 48 b8 b0 0b 11 00 00 80 ff ff	movabsq	$-140737487238224, %rax # imm = 0xFFFF800000110BB0
ffff800000111324: 48 8d 4d d0          	leaq	-48(%rbp), %rcx
ffff800000111328: ff d0                	callq	*%rax
; }
ffff80000011132a: 48 83 c4 60          	addq	$96, %rsp
ffff80000011132e: 5d                   	popq	%rbp
ffff80000011132f: c3                   	retq

ffff800000111330 <getint>:
; {
ffff800000111330: 55                   	pushq	%rbp
ffff800000111331: 48 89 e5             	movq	%rsp, %rbp
ffff800000111334: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111338: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
ffff80000011133b: 83 7d ec 02          	cmpl	$2, -20(%rbp)
ffff80000011133f: 0f 8c 59 00 00 00    	jl	0xffff80000011139e <getint+0x6e>
; 		return va_arg(*ap, long long);
ffff800000111345: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111349: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000011134d: 8b 00                	movl	(%rax), %eax
ffff80000011134f: 89 45 e8             	movl	%eax, -24(%rbp)
ffff800000111352: 83 f8 28             	cmpl	$40, %eax
ffff800000111355: 0f 87 1c 00 00 00    	ja	0xffff800000111377 <getint+0x47>
ffff80000011135b: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000011135f: 8b 55 e8             	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
ffff800000111362: 48 63 c2             	movslq	%edx, %rax
ffff800000111365: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111369: 83 c2 08             	addl	$8, %edx
ffff80000011136c: 89 11                	movl	%edx, (%rcx)
ffff80000011136e: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000111372: e9 17 00 00 00       	jmp	0xffff80000011138e <getint+0x5e>
ffff800000111377: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
ffff80000011137b: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff80000011137f: 48 89 d0             	movq	%rdx, %rax
ffff800000111382: 48 83 c2 08          	addq	$8, %rdx
ffff800000111386: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff80000011138a: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000011138e: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
ffff800000111392: 48 8b 00             	movq	(%rax), %rax
ffff800000111395: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000111399: e9 b7 00 00 00       	jmp	0xffff800000111455 <getint+0x125>
; 	else if (lflag)
ffff80000011139e: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001113a2: 0f 84 59 00 00 00    	je	0xffff800000111401 <getint+0xd1>
; 		return va_arg(*ap, long);
ffff8000001113a8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001113ac: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001113b0: 8b 00                	movl	(%rax), %eax
ffff8000001113b2: 89 45 d4             	movl	%eax, -44(%rbp)
ffff8000001113b5: 83 f8 28             	cmpl	$40, %eax
ffff8000001113b8: 0f 87 1c 00 00 00    	ja	0xffff8000001113da <getint+0xaa>
ffff8000001113be: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff8000001113c2: 8b 55 d4             	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
ffff8000001113c5: 48 63 c2             	movslq	%edx, %rax
ffff8000001113c8: 48 03 41 10          	addq	16(%rcx), %rax
ffff8000001113cc: 83 c2 08             	addl	$8, %edx
ffff8000001113cf: 89 11                	movl	%edx, (%rcx)
ffff8000001113d1: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001113d5: e9 17 00 00 00       	jmp	0xffff8000001113f1 <getint+0xc1>
ffff8000001113da: 48 8b 4d c8          	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
ffff8000001113de: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001113e2: 48 89 d0             	movq	%rdx, %rax
ffff8000001113e5: 48 83 c2 08          	addq	$8, %rdx
ffff8000001113e9: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff8000001113ed: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001113f1: 48 8b 45 c0          	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
ffff8000001113f5: 48 8b 00             	movq	(%rax), %rax
ffff8000001113f8: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001113fc: e9 54 00 00 00       	jmp	0xffff800000111455 <getint+0x125>
; 		return va_arg(*ap, int);
ffff800000111401: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111405: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000111409: 8b 00                	movl	(%rax), %eax
ffff80000011140b: 89 45 bc             	movl	%eax, -68(%rbp)
ffff80000011140e: 83 f8 28             	cmpl	$40, %eax
ffff800000111411: 0f 87 1c 00 00 00    	ja	0xffff800000111433 <getint+0x103>
ffff800000111417: 48 8b 4d b0          	movq	-80(%rbp), %rcx
ffff80000011141b: 8b 55 bc             	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
ffff80000011141e: 48 63 c2             	movslq	%edx, %rax
ffff800000111421: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111425: 83 c2 08             	addl	$8, %edx
ffff800000111428: 89 11                	movl	%edx, (%rcx)
ffff80000011142a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011142e: e9 17 00 00 00       	jmp	0xffff80000011144a <getint+0x11a>
ffff800000111433: 48 8b 4d b0          	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
ffff800000111437: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff80000011143b: 48 89 d0             	movq	%rdx, %rax
ffff80000011143e: 48 83 c2 08          	addq	$8, %rdx
ffff800000111442: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000111446: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011144a: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
ffff80000011144e: 48 63 00             	movslq	(%rax), %rax
ffff800000111451: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000111455: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111459: 5d                   	popq	%rbp
ffff80000011145a: c3                   	retq
ffff80000011145b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111460 <getuint>:
; {
ffff800000111460: 55                   	pushq	%rbp
ffff800000111461: 48 89 e5             	movq	%rsp, %rbp
ffff800000111464: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111468: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
ffff80000011146b: 83 7d ec 02          	cmpl	$2, -20(%rbp)
ffff80000011146f: 0f 8c 59 00 00 00    	jl	0xffff8000001114ce <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
ffff800000111475: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111479: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000011147d: 8b 00                	movl	(%rax), %eax
ffff80000011147f: 89 45 e8             	movl	%eax, -24(%rbp)
ffff800000111482: 83 f8 28             	cmpl	$40, %eax
ffff800000111485: 0f 87 1c 00 00 00    	ja	0xffff8000001114a7 <getuint+0x47>
ffff80000011148b: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000011148f: 8b 55 e8             	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
ffff800000111492: 48 63 c2             	movslq	%edx, %rax
ffff800000111495: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111499: 83 c2 08             	addl	$8, %edx
ffff80000011149c: 89 11                	movl	%edx, (%rcx)
ffff80000011149e: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001114a2: e9 17 00 00 00       	jmp	0xffff8000001114be <getuint+0x5e>
ffff8000001114a7: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
ffff8000001114ab: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001114af: 48 89 d0             	movq	%rdx, %rax
ffff8000001114b2: 48 83 c2 08          	addq	$8, %rdx
ffff8000001114b6: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff8000001114ba: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001114be: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
ffff8000001114c2: 48 8b 00             	movq	(%rax), %rax
ffff8000001114c5: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001114c9: e9 b6 00 00 00       	jmp	0xffff800000111584 <getuint+0x124>
; 	else if (lflag)
ffff8000001114ce: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001114d2: 0f 84 59 00 00 00    	je	0xffff800000111531 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
ffff8000001114d8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001114dc: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001114e0: 8b 00                	movl	(%rax), %eax
ffff8000001114e2: 89 45 d4             	movl	%eax, -44(%rbp)
ffff8000001114e5: 83 f8 28             	cmpl	$40, %eax
ffff8000001114e8: 0f 87 1c 00 00 00    	ja	0xffff80000011150a <getuint+0xaa>
ffff8000001114ee: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff8000001114f2: 8b 55 d4             	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
ffff8000001114f5: 48 63 c2             	movslq	%edx, %rax
ffff8000001114f8: 48 03 41 10          	addq	16(%rcx), %rax
ffff8000001114fc: 83 c2 08             	addl	$8, %edx
ffff8000001114ff: 89 11                	movl	%edx, (%rcx)
ffff800000111501: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111505: e9 17 00 00 00       	jmp	0xffff800000111521 <getuint+0xc1>
ffff80000011150a: 48 8b 4d c8          	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000011150e: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000111512: 48 89 d0             	movq	%rdx, %rax
ffff800000111515: 48 83 c2 08          	addq	$8, %rdx
ffff800000111519: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff80000011151d: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111521: 48 8b 45 c0          	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
ffff800000111525: 48 8b 00             	movq	(%rax), %rax
ffff800000111528: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000011152c: e9 53 00 00 00       	jmp	0xffff800000111584 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
ffff800000111531: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111535: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000111539: 8b 00                	movl	(%rax), %eax
ffff80000011153b: 89 45 bc             	movl	%eax, -68(%rbp)
ffff80000011153e: 83 f8 28             	cmpl	$40, %eax
ffff800000111541: 0f 87 1c 00 00 00    	ja	0xffff800000111563 <getuint+0x103>
ffff800000111547: 48 8b 4d b0          	movq	-80(%rbp), %rcx
ffff80000011154b: 8b 55 bc             	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
ffff80000011154e: 48 63 c2             	movslq	%edx, %rax
ffff800000111551: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111555: 83 c2 08             	addl	$8, %edx
ffff800000111558: 89 11                	movl	%edx, (%rcx)
ffff80000011155a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011155e: e9 17 00 00 00       	jmp	0xffff80000011157a <getuint+0x11a>
ffff800000111563: 48 8b 4d b0          	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
ffff800000111567: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff80000011156b: 48 89 d0             	movq	%rdx, %rax
ffff80000011156e: 48 83 c2 08          	addq	$8, %rdx
ffff800000111572: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000111576: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011157a: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
ffff80000011157e: 8b 00                	movl	(%rax), %eax
ffff800000111580: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000111584: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111588: 5d                   	popq	%rbp
ffff800000111589: c3                   	retq
ffff80000011158a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111590 <printnum>:
; {
ffff800000111590: 55                   	pushq	%rbp
ffff800000111591: 48 89 e5             	movq	%rsp, %rbp
ffff800000111594: 48 83 ec 30          	subq	$48, %rsp
ffff800000111598: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011159c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001115a0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001115a4: 89 4d e4             	movl	%ecx, -28(%rbp)
ffff8000001115a7: 44 89 45 e0          	movl	%r8d, -32(%rbp)
ffff8000001115ab: 44 89 4d dc          	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
ffff8000001115af: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001115b3: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff8000001115b6: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001115b9: 0f 82 37 00 00 00    	jb	0xffff8000001115f6 <printnum+0x66>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff8000001115bf: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001115c3: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001115c7: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001115cb: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff8000001115ce: 31 d2                	xorl	%edx, %edx
ffff8000001115d0: 48 f7 f1             	divq	%rcx
ffff8000001115d3: 48 89 c2             	movq	%rax, %rdx
ffff8000001115d6: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff8000001115d9: 44 8b 45 e0          	movl	-32(%rbp), %r8d
ffff8000001115dd: 41 83 e8 01          	subl	$1, %r8d
ffff8000001115e1: 44 8b 4d dc          	movl	-36(%rbp), %r9d
ffff8000001115e5: 48 b8 90 15 11 00 00 80 ff ff	movabsq	$-140737487235696, %rax # imm = 0xFFFF800000111590
ffff8000001115ef: ff d0                	callq	*%rax
; 	} else {
ffff8000001115f1: e9 2e 00 00 00       	jmp	0xffff800000111624 <printnum+0x94>
; 		while (--width > 0)
ffff8000001115f6: e9 00 00 00 00       	jmp	0xffff8000001115fb <printnum+0x6b>
ffff8000001115fb: 8b 45 e0             	movl	-32(%rbp), %eax
ffff8000001115fe: 83 c0 ff             	addl	$-1, %eax
ffff800000111601: 89 45 e0             	movl	%eax, -32(%rbp)
ffff800000111604: 83 f8 00             	cmpl	$0, %eax
ffff800000111607: 0f 8e 12 00 00 00    	jle	0xffff80000011161f <printnum+0x8f>
; 			putch(padc, putdat);
ffff80000011160d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111611: 8b 7d dc             	movl	-36(%rbp), %edi
ffff800000111614: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111618: ff d0                	callq	*%rax
; 		while (--width > 0)
ffff80000011161a: e9 dc ff ff ff       	jmp	0xffff8000001115fb <printnum+0x6b>
ffff80000011161f: e9 00 00 00 00       	jmp	0xffff800000111624 <printnum+0x94>
; 	putch("0123456789abcdef"[num % base], putdat);
ffff800000111624: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111628: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011162c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111630: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff800000111633: 31 d2                	xorl	%edx, %edx
ffff800000111635: 48 f7 f1             	divq	%rcx
ffff800000111638: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011163c: 48 b9 b8 8f 11 00 00 80 ff ff	movabsq	$-140737487204424, %rcx # imm = 0xFFFF800000118FB8
ffff800000111646: 48 01 ca             	addq	%rcx, %rdx
ffff800000111649: 0f be 3a             	movsbl	(%rdx), %edi
ffff80000011164c: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111650: ff d0                	callq	*%rax
; }
ffff800000111652: 48 83 c4 30          	addq	$48, %rsp
ffff800000111656: 5d                   	popq	%rbp
ffff800000111657: c3                   	retq
ffff800000111658: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111660 <vsnprintf>:
; {
ffff800000111660: 55                   	pushq	%rbp
ffff800000111661: 48 89 e5             	movq	%rsp, %rbp
ffff800000111664: 48 83 ec 40          	subq	$64, %rsp
ffff800000111668: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011166c: 89 75 ec             	movl	%esi, -20(%rbp)
ffff80000011166f: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000111673: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff800000111677: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011167b: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000011167f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111683: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff800000111687: 48 01 c8             	addq	%rcx, %rax
ffff80000011168a: 48 83 c0 ff          	addq	$-1, %rax
ffff80000011168e: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000111692: c7 45 d0 00 00 00 00 	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
ffff800000111699: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011169e: 0f 84 0a 00 00 00    	je	0xffff8000001116ae <vsnprintf+0x4e>
ffff8000001116a4: 83 7d ec 01          	cmpl	$1, -20(%rbp)
ffff8000001116a8: 0f 8d 0c 00 00 00    	jge	0xffff8000001116ba <vsnprintf+0x5a>
; 		return -EINVAL;
ffff8000001116ae: c7 45 fc fb ff ff ff 	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
ffff8000001116b5: e9 2f 00 00 00       	jmp	0xffff8000001116e9 <vsnprintf+0x89>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff8000001116ba: 48 8d 75 c0          	leaq	-64(%rbp), %rsi
ffff8000001116be: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff8000001116c2: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001116c6: 48 bf 00 17 11 00 00 80 ff ff	movabsq	$-140737487235328, %rdi # imm = 0xFFFF800000111700
ffff8000001116d0: 48 b8 b0 0b 11 00 00 80 ff ff	movabsq	$-140737487238224, %rax # imm = 0xFFFF800000110BB0
ffff8000001116da: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff8000001116dc: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff8000001116e0: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff8000001116e3: 8b 45 d0             	movl	-48(%rbp), %eax
ffff8000001116e6: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff8000001116e9: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001116ec: 48 83 c4 40          	addq	$64, %rsp
ffff8000001116f0: 5d                   	popq	%rbp
ffff8000001116f1: c3                   	retq
ffff8000001116f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001116fc: 0f 1f 40 00          	nopl	(%rax)

ffff800000111700 <sprintputch>:
; {
ffff800000111700: 55                   	pushq	%rbp
ffff800000111701: 48 89 e5             	movq	%rsp, %rbp
ffff800000111704: 89 7d fc             	movl	%edi, -4(%rbp)
ffff800000111707: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	b->cnt++;
ffff80000011170b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011170f: 8b 48 10             	movl	16(%rax), %ecx
ffff800000111712: 83 c1 01             	addl	$1, %ecx
ffff800000111715: 89 48 10             	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
ffff800000111718: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011171c: 48 8b 00             	movq	(%rax), %rax
ffff80000011171f: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000111723: 48 3b 41 08          	cmpq	8(%rcx), %rax
ffff800000111727: 0f 83 18 00 00 00    	jae	0xffff800000111745 <sprintputch+0x45>
; 		*b->buf++ = ch;
ffff80000011172d: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000111730: 88 c1                	movb	%al, %cl
ffff800000111732: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000111736: 48 8b 02             	movq	(%rdx), %rax
ffff800000111739: 48 89 c6             	movq	%rax, %rsi
ffff80000011173c: 48 83 c6 01          	addq	$1, %rsi
ffff800000111740: 48 89 32             	movq	%rsi, (%rdx)
ffff800000111743: 88 08                	movb	%cl, (%rax)
; }
ffff800000111745: 5d                   	popq	%rbp
ffff800000111746: c3                   	retq
ffff800000111747: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000111750 <snprintf>:
; {
ffff800000111750: 55                   	pushq	%rbp
ffff800000111751: 48 89 e5             	movq	%rsp, %rbp
ffff800000111754: 48 83 ec 70          	subq	$112, %rsp
ffff800000111758: 4c 89 4d b8          	movq	%r9, -72(%rbp)
ffff80000011175c: 4c 89 45 b0          	movq	%r8, -80(%rbp)
ffff800000111760: 48 89 4d a8          	movq	%rcx, -88(%rbp)
ffff800000111764: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000111768: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011176b: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff80000011176f: 48 8d 45 90          	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
ffff800000111773: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000111777: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000011177b: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000011177f: c7 45 d4 30 00 00 00 	movl	$48, -44(%rbp)
ffff800000111786: c7 45 d0 18 00 00 00 	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff80000011178d: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111791: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000111794: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000111798: 48 b8 60 16 11 00 00 80 ff ff	movabsq	$-140737487235488, %rax # imm = 0xFFFF800000111660
ffff8000001117a2: 48 8d 4d d0          	leaq	-48(%rbp), %rcx
ffff8000001117a6: ff d0                	callq	*%rax
ffff8000001117a8: 89 45 cc             	movl	%eax, -52(%rbp)
; 	return rc;
ffff8000001117ab: 8b 45 cc             	movl	-52(%rbp), %eax
ffff8000001117ae: 48 83 c4 70          	addq	$112, %rsp
ffff8000001117b2: 5d                   	popq	%rbp
ffff8000001117b3: c3                   	retq
ffff8000001117b4: cc                   	int3
ffff8000001117b5: cc                   	int3
ffff8000001117b6: cc                   	int3
ffff8000001117b7: cc                   	int3
ffff8000001117b8: cc                   	int3
ffff8000001117b9: cc                   	int3
ffff8000001117ba: cc                   	int3
ffff8000001117bb: cc                   	int3
ffff8000001117bc: cc                   	int3
ffff8000001117bd: cc                   	int3
ffff8000001117be: cc                   	int3
ffff8000001117bf: cc                   	int3

ffff8000001117c0 <rb_first>:
; {
ffff8000001117c0: 55                   	pushq	%rbp
ffff8000001117c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001117c4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001117c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_outermost(tree->root, RB_LEFT);
ffff8000001117cc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001117d0: 48 8b 38             	movq	(%rax), %rdi
ffff8000001117d3: 31 c0                	xorl	%eax, %eax
ffff8000001117d5: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff8000001117df: 31 f6                	xorl	%esi, %esi
ffff8000001117e1: ff d0                	callq	*%rax
ffff8000001117e3: 48 83 c4 10          	addq	$16, %rsp
ffff8000001117e7: 5d                   	popq	%rbp
ffff8000001117e8: c3                   	retq
ffff8000001117e9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001117f0 <get_outermost>:
; {
ffff8000001117f0: 55                   	pushq	%rbp
ffff8000001117f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001117f4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001117f8: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (!node) {
ffff8000001117fb: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111800: 0f 85 0d 00 00 00    	jne	0xffff800000111813 <get_outermost+0x23>
; 		return NULL;
ffff800000111806: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff80000011180e: e9 35 00 00 00       	jmp	0xffff800000111848 <get_outermost+0x58>
; 	while (node->child[dir]) {
ffff800000111813: e9 00 00 00 00       	jmp	0xffff800000111818 <get_outermost+0x28>
ffff800000111818: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011181c: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff80000011181f: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111825: 0f 84 15 00 00 00    	je	0xffff800000111840 <get_outermost+0x50>
; 		node = node->child[dir];
ffff80000011182b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011182f: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000111832: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111837: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while (node->child[dir]) {
ffff80000011183b: e9 d8 ff ff ff       	jmp	0xffff800000111818 <get_outermost+0x28>
; 	return node;
ffff800000111840: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111844: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000111848: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011184c: 5d                   	popq	%rbp
ffff80000011184d: c3                   	retq
ffff80000011184e: 66 90                	nop

ffff800000111850 <rb_last>:
; {
ffff800000111850: 55                   	pushq	%rbp
ffff800000111851: 48 89 e5             	movq	%rsp, %rbp
ffff800000111854: 48 83 ec 10          	subq	$16, %rsp
ffff800000111858: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_outermost(tree->root, RB_RIGHT);
ffff80000011185c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111860: 48 8b 38             	movq	(%rax), %rdi
ffff800000111863: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff80000011186d: be 01 00 00 00       	movl	$1, %esi
ffff800000111872: ff d0                	callq	*%rax
ffff800000111874: 48 83 c4 10          	addq	$16, %rsp
ffff800000111878: 5d                   	popq	%rbp
ffff800000111879: c3                   	retq
ffff80000011187a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111880 <rb_next>:
; {
ffff800000111880: 55                   	pushq	%rbp
ffff800000111881: 48 89 e5             	movq	%rsp, %rbp
ffff800000111884: 48 83 ec 10          	subq	$16, %rsp
ffff800000111888: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_closest(node, RB_RIGHT);
ffff80000011188c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111890: 48 b8 b0 18 11 00 00 80 ff ff	movabsq	$-140737487234896, %rax # imm = 0xFFFF8000001118B0
ffff80000011189a: be 01 00 00 00       	movl	$1, %esi
ffff80000011189f: ff d0                	callq	*%rax
ffff8000001118a1: 48 83 c4 10          	addq	$16, %rsp
ffff8000001118a5: 5d                   	popq	%rbp
ffff8000001118a6: c3                   	retq
ffff8000001118a7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001118b0 <get_closest>:
; {
ffff8000001118b0: 55                   	pushq	%rbp
ffff8000001118b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001118b4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001118b8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001118bc: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (!node)
ffff8000001118bf: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff8000001118c4: 0f 85 0d 00 00 00    	jne	0xffff8000001118d7 <get_closest+0x27>
; 		return NULL;
ffff8000001118ca: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff8000001118d2: e9 9c 00 00 00       	jmp	0xffff800000111973 <get_closest+0xc3>
; 	if (node->child[dir])
ffff8000001118d7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001118db: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001118de: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff8000001118e4: 0f 84 2f 00 00 00    	je	0xffff800000111919 <get_closest+0x69>
; 		return get_outermost(node->child[dir], !dir);
ffff8000001118ea: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001118ee: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001118f1: 48 8b 7c c8 08       	movq	8(%rax,%rcx,8), %rdi
ffff8000001118f6: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001118fa: 0f 95 c0             	setne	%al
ffff8000001118fd: 34 ff                	xorb	$-1, %al
ffff8000001118ff: 24 01                	andb	$1, %al
ffff800000111901: 0f b6 f0             	movzbl	%al, %esi
ffff800000111904: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff80000011190e: ff d0                	callq	*%rax
ffff800000111910: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000111914: e9 5a 00 00 00       	jmp	0xffff800000111973 <get_closest+0xc3>
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff800000111919: e9 00 00 00 00       	jmp	0xffff80000011191e <get_closest+0x6e>
ffff80000011191e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111922: 48 8b 08             	movq	(%rax), %rcx
ffff800000111925: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff800000111929: 31 c0                	xorl	%eax, %eax
ffff80000011192b: 48 83 f9 00          	cmpq	$0, %rcx
ffff80000011192f: 88 45 df             	movb	%al, -33(%rbp)
ffff800000111932: 0f 84 16 00 00 00    	je	0xffff80000011194e <get_closest+0x9e>
ffff800000111938: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011193c: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff80000011193f: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111944: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff800000111948: 0f 94 c0             	sete	%al
ffff80000011194b: 88 45 df             	movb	%al, -33(%rbp)
ffff80000011194e: 8a 45 df             	movb	-33(%rbp), %al
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff800000111951: a8 01                	testb	$1, %al
ffff800000111953: 0f 85 05 00 00 00    	jne	0xffff80000011195e <get_closest+0xae>
ffff800000111959: e9 0d 00 00 00       	jmp	0xffff80000011196b <get_closest+0xbb>
; 		node = parent;
ffff80000011195e: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111962: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff800000111966: e9 b3 ff ff ff       	jmp	0xffff80000011191e <get_closest+0x6e>
; 	return parent;
ffff80000011196b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011196f: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000111973: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111977: 48 83 c4 30          	addq	$48, %rsp
ffff80000011197b: 5d                   	popq	%rbp
ffff80000011197c: c3                   	retq
ffff80000011197d: 0f 1f 00             	nopl	(%rax)

ffff800000111980 <rb_prev>:
; {
ffff800000111980: 55                   	pushq	%rbp
ffff800000111981: 48 89 e5             	movq	%rsp, %rbp
ffff800000111984: 48 83 ec 10          	subq	$16, %rsp
ffff800000111988: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_closest(node, RB_LEFT);
ffff80000011198c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111990: 31 c0                	xorl	%eax, %eax
ffff800000111992: 48 b8 b0 18 11 00 00 80 ff ff	movabsq	$-140737487234896, %rax # imm = 0xFFFF8000001118B0
ffff80000011199c: 31 f6                	xorl	%esi, %esi
ffff80000011199e: ff d0                	callq	*%rax
ffff8000001119a0: 48 83 c4 10          	addq	$16, %rsp
ffff8000001119a4: 5d                   	popq	%rbp
ffff8000001119a5: c3                   	retq
ffff8000001119a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001119b0 <rb_balance>:
; {
ffff8000001119b0: 55                   	pushq	%rbp
ffff8000001119b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001119b4: 48 83 ec 40          	subq	$64, %rsp
ffff8000001119b8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001119bc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff8000001119c0: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff8000001119c5: 0f 84 0b 00 00 00    	je	0xffff8000001119d6 <rb_balance+0x26>
ffff8000001119cb: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff8000001119d0: 0f 85 0c 00 00 00    	jne	0xffff8000001119e2 <rb_balance+0x32>
; 		return -1;
ffff8000001119d6: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff8000001119dd: e9 4e 01 00 00       	jmp	0xffff800000111b30 <rb_balance+0x180>
; 	node->color = RB_RED;
ffff8000001119e2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001119e6: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff8000001119ed: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001119f1: 48 8b 08             	movq	(%rax), %rcx
ffff8000001119f4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff8000001119f8: 31 c0                	xorl	%eax, %eax
ffff8000001119fa: 48 83 f9 00          	cmpq	$0, %rcx
ffff8000001119fe: 88 45 cb             	movb	%al, -53(%rbp)
ffff800000111a01: 0f 84 0e 00 00 00    	je	0xffff800000111a15 <rb_balance+0x65>
ffff800000111a07: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111a0b: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111a0f: 0f 94 c0             	sete	%al
ffff800000111a12: 88 45 cb             	movb	%al, -53(%rbp)
ffff800000111a15: 8a 45 cb             	movb	-53(%rbp), %al
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff800000111a18: a8 01                	testb	$1, %al
ffff800000111a1a: 0f 85 05 00 00 00    	jne	0xffff800000111a25 <rb_balance+0x75>
ffff800000111a20: e9 f6 00 00 00       	jmp	0xffff800000111b1b <rb_balance+0x16b>
; 		grandparent = parent->parent;
ffff800000111a25: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111a29: 48 8b 00             	movq	(%rax), %rax
ffff800000111a2c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff800000111a30: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a34: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111a38: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff800000111a3c: 0f 94 c0             	sete	%al
ffff800000111a3f: 24 01                	andb	$1, %al
ffff800000111a41: 0f b6 c0             	movzbl	%al, %eax
ffff800000111a44: 89 45 cc             	movl	%eax, -52(%rbp)
; 		uncle = grandparent->child[dir];
ffff800000111a47: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a4b: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111a4e: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111a53: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		if (uncle && uncle->color == RB_RED) {
ffff800000111a57: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000111a5c: 0f 84 3c 00 00 00    	je	0xffff800000111a9e <rb_balance+0xee>
ffff800000111a62: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000111a66: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111a6a: 0f 85 2e 00 00 00    	jne	0xffff800000111a9e <rb_balance+0xee>
; 			parent->color = RB_BLACK;
ffff800000111a70: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111a74: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			uncle->color = RB_BLACK;
ffff800000111a7b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000111a7f: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			grandparent->color = RB_RED;
ffff800000111a86: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a8a: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			node = grandparent;
ffff800000111a91: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a95: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			continue;
ffff800000111a99: e9 4f ff ff ff       	jmp	0xffff8000001119ed <rb_balance+0x3d>
; 		if (parent->child[dir] == node) {
ffff800000111a9e: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111aa2: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111aa5: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111aaa: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000111aae: 0f 85 35 00 00 00    	jne	0xffff800000111ae9 <rb_balance+0x139>
; 			rotate_node(tree, parent, !dir);
ffff800000111ab4: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111ab8: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000111abc: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111ac0: 0f 95 c0             	setne	%al
ffff800000111ac3: 34 ff                	xorb	$-1, %al
ffff800000111ac5: 24 01                	andb	$1, %al
ffff800000111ac7: 0f b6 d0             	movzbl	%al, %edx
ffff800000111aca: 48 b8 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %rax # imm = 0xFFFF800000111B40
ffff800000111ad4: ff d0                	callq	*%rax
; 			node = parent;
ffff800000111ad6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111ada: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			parent = node->parent;
ffff800000111ade: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ae2: 48 8b 00             	movq	(%rax), %rax
ffff800000111ae5: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		parent->color = RB_BLACK;
ffff800000111ae9: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111aed: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff800000111af4: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111af8: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 		rotate_node(tree, grandparent, dir);
ffff800000111aff: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111b03: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000111b07: 8b 55 cc             	movl	-52(%rbp), %edx
ffff800000111b0a: 48 b8 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %rax # imm = 0xFFFF800000111B40
ffff800000111b14: ff d0                	callq	*%rax
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff800000111b16: e9 d2 fe ff ff       	jmp	0xffff8000001119ed <rb_balance+0x3d>
; 	tree->root->color = RB_BLACK;
ffff800000111b1b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111b1f: 48 8b 00             	movq	(%rax), %rax
ffff800000111b22: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 	return 0;
ffff800000111b29: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000111b30: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000111b33: 48 83 c4 40          	addq	$64, %rsp
ffff800000111b37: 5d                   	popq	%rbp
ffff800000111b38: c3                   	retq
ffff800000111b39: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000111b40 <rotate_node>:
; {
ffff800000111b40: 55                   	pushq	%rbp
ffff800000111b41: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b44: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000111b48: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000111b4c: 89 55 ec             	movl	%edx, -20(%rbp)
; 	struct rb_node *parent = node->parent;
ffff800000111b4f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111b53: 48 8b 00             	movq	(%rax), %rax
ffff800000111b56: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct rb_node *child = node->child[!dir];
ffff800000111b5a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111b5e: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000111b62: 0f 95 c1             	setne	%cl
ffff800000111b65: 80 f1 ff             	xorb	$-1, %cl
ffff800000111b68: 80 e1 01             	andb	$1, %cl
ffff800000111b6b: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111b6e: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111b71: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111b76: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if ((node->child[!dir] = child->child[dir])) {
ffff800000111b7a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111b7e: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000111b81: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111b86: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000111b8a: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000111b8e: 0f 95 c2             	setne	%dl
ffff800000111b91: 80 f2 ff             	xorb	$-1, %dl
ffff800000111b94: 80 e2 01             	andb	$1, %dl
ffff800000111b97: 0f b6 d2             	movzbl	%dl, %edx
ffff800000111b9a: 48 63 d2             	movslq	%edx, %rdx
ffff800000111b9d: 48 89 44 d1 08       	movq	%rax, 8(%rcx,%rdx,8)
ffff800000111ba2: 48 83 f8 00          	cmpq	$0, %rax
ffff800000111ba6: 0f 84 13 00 00 00    	je	0xffff800000111bbf <rotate_node+0x7f>
; 		child->child[dir]->parent = node;
ffff800000111bac: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000111bb0: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111bb4: 8b 55 ec             	movl	-20(%rbp), %edx
ffff800000111bb7: 48 8b 44 d0 08       	movq	8(%rax,%rdx,8), %rax
ffff800000111bbc: 48 89 08             	movq	%rcx, (%rax)
; 	child->child[dir] = node;
ffff800000111bbf: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000111bc3: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111bc7: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000111bca: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	child->parent = parent;
ffff800000111bcf: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000111bd3: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111bd7: 48 89 08             	movq	%rcx, (%rax)
; 	if (parent) {
ffff800000111bda: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111bdf: 0f 84 2a 00 00 00    	je	0xffff800000111c0f <rotate_node+0xcf>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff800000111be5: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000111be9: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111bed: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000111bf1: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff800000111bf5: 48 3b 4d f0          	cmpq	-16(%rbp), %rcx
ffff800000111bf9: 0f 94 c1             	sete	%cl
ffff800000111bfc: 80 e1 01             	andb	$1, %cl
ffff800000111bff: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111c02: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111c05: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	} else {
ffff800000111c0a: e9 0b 00 00 00       	jmp	0xffff800000111c1a <rotate_node+0xda>
; 		tree->root = child;
ffff800000111c0f: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111c13: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111c17: 48 89 08             	movq	%rcx, (%rax)
; 	node->parent = child;
ffff800000111c1a: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111c1e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111c22: 48 89 08             	movq	%rcx, (%rax)
; }
ffff800000111c25: 5d                   	popq	%rbp
ffff800000111c26: c3                   	retq
ffff800000111c27: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000111c30 <rb_remove>:
; {
ffff800000111c30: 55                   	pushq	%rbp
ffff800000111c31: 48 89 e5             	movq	%rsp, %rbp
ffff800000111c34: 48 83 ec 40          	subq	$64, %rsp
ffff800000111c38: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111c3c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff800000111c40: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111c45: 0f 84 0b 00 00 00    	je	0xffff800000111c56 <rb_remove+0x26>
ffff800000111c4b: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111c50: 0f 85 0c 00 00 00    	jne	0xffff800000111c62 <rb_remove+0x32>
; 		return -1;
ffff800000111c56: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000111c5d: e9 07 03 00 00       	jmp	0xffff800000111f69 <rb_remove+0x339>
; 	child_dir = !node->child[RB_LEFT];
ffff800000111c62: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111c66: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111c6b: 0f 95 c0             	setne	%al
ffff800000111c6e: 34 ff                	xorb	$-1, %al
ffff800000111c70: 24 01                	andb	$1, %al
ffff800000111c72: 0f b6 c0             	movzbl	%al, %eax
ffff800000111c75: 89 45 c8             	movl	%eax, -56(%rbp)
; 	child = node->child[child_dir];
ffff800000111c78: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111c7c: 8b 4d c8             	movl	-56(%rbp), %ecx
ffff800000111c7f: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111c84: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	other = node->child[!child_dir];
ffff800000111c88: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111c8c: 83 7d c8 00          	cmpl	$0, -56(%rbp)
ffff800000111c90: 0f 95 c1             	setne	%cl
ffff800000111c93: 80 f1 ff             	xorb	$-1, %cl
ffff800000111c96: 80 e1 01             	andb	$1, %cl
ffff800000111c99: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111c9c: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111c9f: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111ca4: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	do_remove(tree, node);
ffff800000111ca8: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111cac: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000111cb0: 48 b8 80 1f 11 00 00 80 ff ff	movabsq	$-140737487233152, %rax # imm = 0xFFFF800000111F80
ffff800000111cba: ff d0                	callq	*%rax
; 	if (!child && !other)
ffff800000111cbc: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff800000111cc1: 0f 85 17 00 00 00    	jne	0xffff800000111cde <rb_remove+0xae>
ffff800000111cc7: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000111ccc: 0f 85 0c 00 00 00    	jne	0xffff800000111cde <rb_remove+0xae>
; 		return 0;
ffff800000111cd2: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111cd9: e9 8b 02 00 00       	jmp	0xffff800000111f69 <rb_remove+0x339>
; 	if (node->color == RB_RED)
ffff800000111cde: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ce2: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111ce6: 0f 85 0c 00 00 00    	jne	0xffff800000111cf8 <rb_remove+0xc8>
; 		return 0;
ffff800000111cec: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111cf3: e9 71 02 00 00       	jmp	0xffff800000111f69 <rb_remove+0x339>
; 	node = child;
ffff800000111cf8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111cfc: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	if (node->color == RB_RED) {
ffff800000111d00: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d04: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111d08: 0f 85 17 00 00 00    	jne	0xffff800000111d25 <rb_remove+0xf5>
; 		node->color = RB_BLACK;
ffff800000111d0e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d12: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		return 0;
ffff800000111d19: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111d20: e9 44 02 00 00       	jmp	0xffff800000111f69 <rb_remove+0x339>
; 	while (node->parent) {
ffff800000111d25: e9 00 00 00 00       	jmp	0xffff800000111d2a <rb_remove+0xfa>
ffff800000111d2a: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d2e: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000111d32: 0f 84 14 02 00 00    	je	0xffff800000111f4c <rb_remove+0x31c>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff800000111d38: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d3c: 48 8b 00             	movq	(%rax), %rax
ffff800000111d3f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111d43: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000111d47: 0f 94 c0             	sete	%al
ffff800000111d4a: 24 01                	andb	$1, %al
ffff800000111d4c: 0f b6 c0             	movzbl	%al, %eax
ffff800000111d4f: 89 45 cc             	movl	%eax, -52(%rbp)
; 		sibling = node->parent->child[dir];
ffff800000111d52: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d56: 48 8b 00             	movq	(%rax), %rax
ffff800000111d59: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111d5c: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111d61: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if (!sibling) {
ffff800000111d65: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111d6a: 0f 85 05 00 00 00    	jne	0xffff800000111d75 <rb_remove+0x145>
; 			break;
ffff800000111d70: e9 d7 01 00 00       	jmp	0xffff800000111f4c <rb_remove+0x31c>
; 		if (sibling->color == RB_RED) {
ffff800000111d75: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111d79: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111d7d: 0f 85 51 00 00 00    	jne	0xffff800000111dd4 <rb_remove+0x1a4>
; 			node->parent->color = RB_RED;
ffff800000111d83: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d87: 48 8b 00             	movq	(%rax), %rax
ffff800000111d8a: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->color = RB_BLACK;
ffff800000111d91: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111d95: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff800000111d9c: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111da0: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111da4: 48 8b 30             	movq	(%rax), %rsi
ffff800000111da7: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111dab: 0f 95 c0             	setne	%al
ffff800000111dae: 34 ff                	xorb	$-1, %al
ffff800000111db0: 24 01                	andb	$1, %al
ffff800000111db2: 0f b6 d0             	movzbl	%al, %edx
ffff800000111db5: 48 b8 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %rax # imm = 0xFFFF800000111B40
ffff800000111dbf: ff d0                	callq	*%rax
; 			sibling = node->parent->child[dir];
ffff800000111dc1: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111dc5: 48 8b 00             	movq	(%rax), %rax
ffff800000111dc8: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111dcb: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111dd0: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff800000111dd4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111dd8: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111ddc: 0f 95 c1             	setne	%cl
ffff800000111ddf: 80 f1 ff             	xorb	$-1, %cl
ffff800000111de2: 80 e1 01             	andb	$1, %cl
ffff800000111de5: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111de8: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111deb: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111df1: 0f 84 26 00 00 00    	je	0xffff800000111e1d <rb_remove+0x1ed>
ffff800000111df7: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111dfb: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111dff: 0f 95 c1             	setne	%cl
ffff800000111e02: 80 f1 ff             	xorb	$-1, %cl
ffff800000111e05: 80 e1 01             	andb	$1, %cl
ffff800000111e08: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111e0b: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111e0e: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111e13: 83 78 18 00          	cmpl	$0, 24(%rax)
; 		    RB_BLACK) &&
ffff800000111e17: 0f 85 44 00 00 00    	jne	0xffff800000111e61 <rb_remove+0x231>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff800000111e1d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e21: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111e24: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111e2a: 0f 84 16 00 00 00    	je	0xffff800000111e46 <rb_remove+0x216>
ffff800000111e30: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e34: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111e37: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111e3c: 83 78 18 00          	cmpl	$0, 24(%rax)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff800000111e40: 0f 85 1b 00 00 00    	jne	0xffff800000111e61 <rb_remove+0x231>
; 			sibling->color = RB_RED;
ffff800000111e46: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e4a: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			node = node->parent;
ffff800000111e51: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e55: 48 8b 00             	movq	(%rax), %rax
ffff800000111e58: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			continue;
ffff800000111e5c: e9 c9 fe ff ff       	jmp	0xffff800000111d2a <rb_remove+0xfa>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff800000111e61: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e65: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111e68: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111e6e: 0f 84 16 00 00 00    	je	0xffff800000111e8a <rb_remove+0x25a>
ffff800000111e74: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e78: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111e7b: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111e80: 83 78 18 00          	cmpl	$0, 24(%rax)
ffff800000111e84: 0f 85 5b 00 00 00    	jne	0xffff800000111ee5 <rb_remove+0x2b5>
; 			sibling->color = RB_RED;
ffff800000111e8a: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e8e: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff800000111e95: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111e99: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111e9d: 0f 95 c1             	setne	%cl
ffff800000111ea0: 80 f1 ff             	xorb	$-1, %cl
ffff800000111ea3: 80 e1 01             	andb	$1, %cl
ffff800000111ea6: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111ea9: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111eac: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111eb1: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, dir);
ffff800000111eb8: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111ebc: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ec0: 48 8b 30             	movq	(%rax), %rsi
ffff800000111ec3: 8b 55 cc             	movl	-52(%rbp), %edx
ffff800000111ec6: 48 b8 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %rax # imm = 0xFFFF800000111B40
ffff800000111ed0: ff d0                	callq	*%rax
; 			sibling = node->parent->child[dir];
ffff800000111ed2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ed6: 48 8b 00             	movq	(%rax), %rax
ffff800000111ed9: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111edc: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111ee1: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		sibling->color = node->parent->color;
ffff800000111ee5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ee9: 48 8b 00             	movq	(%rax), %rax
ffff800000111eec: 8b 48 18             	movl	24(%rax), %ecx
ffff800000111eef: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111ef3: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff800000111ef6: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111efa: 48 8b 00             	movq	(%rax), %rax
ffff800000111efd: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		sibling->child[dir]->color = RB_BLACK;
ffff800000111f04: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111f08: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111f0b: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111f10: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff800000111f17: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111f1b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111f1f: 48 8b 30             	movq	(%rax), %rsi
ffff800000111f22: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111f26: 0f 95 c0             	setne	%al
ffff800000111f29: 34 ff                	xorb	$-1, %al
ffff800000111f2b: 24 01                	andb	$1, %al
ffff800000111f2d: 0f b6 d0             	movzbl	%al, %edx
ffff800000111f30: 48 b8 40 1b 11 00 00 80 ff ff	movabsq	$-140737487234240, %rax # imm = 0xFFFF800000111B40
ffff800000111f3a: ff d0                	callq	*%rax
; 		node = tree->root;
ffff800000111f3c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111f40: 48 8b 00             	movq	(%rax), %rax
ffff800000111f43: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while (node->parent) {
ffff800000111f47: e9 de fd ff ff       	jmp	0xffff800000111d2a <rb_remove+0xfa>
; 	if (node)
ffff800000111f4c: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111f51: 0f 84 0b 00 00 00    	je	0xffff800000111f62 <rb_remove+0x332>
; 		node->color = RB_BLACK;
ffff800000111f57: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111f5b: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 	return 0;
ffff800000111f62: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000111f69: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000111f6c: 48 83 c4 40          	addq	$64, %rsp
ffff800000111f70: 5d                   	popq	%rbp
ffff800000111f71: c3                   	retq
ffff800000111f72: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111f7c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111f80 <do_remove>:
; {
ffff800000111f80: 55                   	pushq	%rbp
ffff800000111f81: 48 89 e5             	movq	%rsp, %rbp
ffff800000111f84: 48 83 ec 30          	subq	$48, %rsp
ffff800000111f88: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111f8c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff800000111f90: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111f95: 0f 84 0b 00 00 00    	je	0xffff800000111fa6 <do_remove+0x26>
ffff800000111f9b: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111fa0: 0f 85 0c 00 00 00    	jne	0xffff800000111fb2 <do_remove+0x32>
; 		return -1;
ffff800000111fa6: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000111fad: e9 61 01 00 00       	jmp	0xffff800000112113 <do_remove+0x193>
; 	parent = node->parent;
ffff800000111fb2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fb6: 48 8b 00             	movq	(%rax), %rax
ffff800000111fb9: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff800000111fbd: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fc1: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111fc6: 0f 84 a9 00 00 00    	je	0xffff800000112075 <do_remove+0xf5>
ffff800000111fcc: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fd0: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000111fd5: 0f 84 9a 00 00 00    	je	0xffff800000112075 <do_remove+0xf5>
; 		child = node->child[RB_LEFT];
ffff800000111fdb: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fdf: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111fe3: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		child = get_outermost(child, RB_RIGHT);
ffff800000111fe7: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000111feb: 48 b8 f0 17 11 00 00 80 ff ff	movabsq	$-140737487235088, %rax # imm = 0xFFFF8000001117F0
ffff800000111ff5: be 01 00 00 00       	movl	$1, %esi
ffff800000111ffa: ff d0                	callq	*%rax
ffff800000111ffc: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		do_remove(tree, child);
ffff800000112000: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000112004: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000112008: 48 b8 80 1f 11 00 00 80 ff ff	movabsq	$-140737487233152, %rax # imm = 0xFFFF800000111F80
ffff800000112012: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff800000112014: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112018: 48 8b 48 08          	movq	8(%rax), %rcx
ffff80000011201c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112020: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		if (node->child[RB_LEFT])
ffff800000112024: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112028: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff80000011202d: 0f 84 0f 00 00 00    	je	0xffff800000112042 <do_remove+0xc2>
; 			node->child[RB_LEFT]->parent = child;
ffff800000112033: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000112037: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011203b: 48 8b 40 08          	movq	8(%rax), %rax
ffff80000011203f: 48 89 08             	movq	%rcx, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff800000112042: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112046: 48 8b 48 10          	movq	16(%rax), %rcx
ffff80000011204a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011204e: 48 89 48 10          	movq	%rcx, 16(%rax)
; 		if (node->child[RB_RIGHT])
ffff800000112052: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112056: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff80000011205b: 0f 84 0f 00 00 00    	je	0xffff800000112070 <do_remove+0xf0>
; 			node->child[RB_RIGHT]->parent = child;
ffff800000112061: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000112065: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112069: 48 8b 40 10          	movq	16(%rax), %rax
ffff80000011206d: 48 89 08             	movq	%rcx, (%rax)
; 	} else {
ffff800000112070: e9 26 00 00 00       	jmp	0xffff80000011209b <do_remove+0x11b>
; 		child_dir = !node->child[RB_LEFT];
ffff800000112075: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112079: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff80000011207e: 0f 95 c0             	setne	%al
ffff800000112081: 34 ff                	xorb	$-1, %al
ffff800000112083: 24 01                	andb	$1, %al
ffff800000112085: 0f b6 c0             	movzbl	%al, %eax
ffff800000112088: 89 45 d0             	movl	%eax, -48(%rbp)
; 		child = node->child[child_dir];
ffff80000011208b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011208f: 8b 4d d0             	movl	-48(%rbp), %ecx
ffff800000112092: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000112097: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (parent) {
ffff80000011209b: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff8000001120a0: 0f 84 2c 00 00 00    	je	0xffff8000001120d2 <do_remove+0x152>
; 		dir = parent->child[RB_RIGHT] == node;
ffff8000001120a6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001120aa: 48 8b 40 10          	movq	16(%rax), %rax
ffff8000001120ae: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001120b2: 0f 94 c0             	sete	%al
ffff8000001120b5: 24 01                	andb	$1, %al
ffff8000001120b7: 0f b6 c0             	movzbl	%al, %eax
ffff8000001120ba: 89 45 d4             	movl	%eax, -44(%rbp)
; 		parent->child[dir] = child;
ffff8000001120bd: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff8000001120c1: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001120c5: 8b 4d d4             	movl	-44(%rbp), %ecx
ffff8000001120c8: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	} else {
ffff8000001120cd: e9 0b 00 00 00       	jmp	0xffff8000001120dd <do_remove+0x15d>
; 		tree->root = child;
ffff8000001120d2: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001120d6: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001120da: 48 89 08             	movq	%rcx, (%rax)
; 	if (child)
ffff8000001120dd: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff8000001120e2: 0f 84 0b 00 00 00    	je	0xffff8000001120f3 <do_remove+0x173>
; 		child->parent = parent;
ffff8000001120e8: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001120ec: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001120f0: 48 89 08             	movq	%rcx, (%rax)
; 	memset(node, 0, sizeof *node);
ffff8000001120f3: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001120f7: 31 c0                	xorl	%eax, %eax
ffff8000001120f9: 48 b8 00 28 11 00 00 80 ff ff	movabsq	$-140737487230976, %rax # imm = 0xFFFF800000112800
ffff800000112103: 31 f6                	xorl	%esi, %esi
ffff800000112105: ba 20 00 00 00       	movl	$32, %edx
ffff80000011210a: ff d0                	callq	*%rax
; 	return 0;
ffff80000011210c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112113: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112116: 48 83 c4 30          	addq	$48, %rsp
ffff80000011211a: 5d                   	popq	%rbp
ffff80000011211b: c3                   	retq
ffff80000011211c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112120 <rb_replace>:
; {
ffff800000112120: 55                   	pushq	%rbp
ffff800000112121: 48 89 e5             	movq	%rsp, %rbp
ffff800000112124: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112128: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff80000011212c: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	if (!node || !new_node)
ffff800000112130: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000112135: 0f 84 0b 00 00 00    	je	0xffff800000112146 <rb_replace+0x26>
ffff80000011213b: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112140: 0f 85 0c 00 00 00    	jne	0xffff800000112152 <rb_replace+0x32>
; 		return -1;
ffff800000112146: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000011214d: e9 b2 00 00 00       	jmp	0xffff800000112204 <rb_replace+0xe4>
; 	if (node->parent)
ffff800000112152: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112156: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000011215a: 0f 84 30 00 00 00    	je	0xffff800000112190 <rb_replace+0x70>
; 			new_node;
ffff800000112160: 48 8b 55 e0          	movq	-32(%rbp), %rdx
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff800000112164: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112168: 48 8b 00             	movq	(%rax), %rax
ffff80000011216b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011216f: 48 8b 09             	movq	(%rcx), %rcx
ffff800000112172: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff800000112176: 48 3b 4d e8          	cmpq	-24(%rbp), %rcx
ffff80000011217a: 0f 94 c1             	sete	%cl
ffff80000011217d: 80 e1 01             	andb	$1, %cl
ffff800000112180: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000112183: 48 63 c9             	movslq	%ecx, %rcx
ffff800000112186: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
ffff80000011218b: e9 0b 00 00 00       	jmp	0xffff80000011219b <rb_replace+0x7b>
; 		tree->root = new_node;
ffff800000112190: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112194: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112198: 48 89 08             	movq	%rcx, (%rax)
; 	if (node->child[RB_LEFT])
ffff80000011219b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011219f: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff8000001121a4: 0f 84 0f 00 00 00    	je	0xffff8000001121b9 <rb_replace+0x99>
; 		node->child[RB_LEFT]->parent = new_node;
ffff8000001121aa: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001121ae: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001121b2: 48 8b 40 08          	movq	8(%rax), %rax
ffff8000001121b6: 48 89 08             	movq	%rcx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff8000001121b9: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001121bd: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff8000001121c2: 0f 84 0f 00 00 00    	je	0xffff8000001121d7 <rb_replace+0xb7>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff8000001121c8: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001121cc: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001121d0: 48 8b 40 10          	movq	16(%rax), %rax
ffff8000001121d4: 48 89 08             	movq	%rcx, (%rax)
; 	*new_node = *node;
ffff8000001121d7: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001121db: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001121df: 48 8b 11             	movq	(%rcx), %rdx
ffff8000001121e2: 48 89 10             	movq	%rdx, (%rax)
ffff8000001121e5: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001121e9: 48 89 50 08          	movq	%rdx, 8(%rax)
ffff8000001121ed: 48 8b 51 10          	movq	16(%rcx), %rdx
ffff8000001121f1: 48 89 50 10          	movq	%rdx, 16(%rax)
ffff8000001121f5: 48 8b 49 18          	movq	24(%rcx), %rcx
ffff8000001121f9: 48 89 48 18          	movq	%rcx, 24(%rax)
; 	return 0;
ffff8000001121fd: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112204: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112207: 5d                   	popq	%rbp
ffff800000112208: c3                   	retq
ffff800000112209: cc                   	int3
ffff80000011220a: cc                   	int3
ffff80000011220b: cc                   	int3
ffff80000011220c: cc                   	int3
ffff80000011220d: cc                   	int3
ffff80000011220e: cc                   	int3
ffff80000011220f: cc                   	int3

ffff800000112210 <readline>:
; {
ffff800000112210: 55                   	pushq	%rbp
ffff800000112211: 48 89 e5             	movq	%rsp, %rbp
ffff800000112214: 48 83 ec 20          	subq	$32, %rsp
ffff800000112218: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (prompt != NULL)
ffff80000011221c: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000112221: 0f 84 1c 00 00 00    	je	0xffff800000112243 <readline+0x33>
; 		cprintf("%s", prompt);
ffff800000112227: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011222b: 48 bf 78 88 11 00 00 80 ff ff	movabsq	$-140737487206280, %rdi # imm = 0xFFFF800000118878
ffff800000112235: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011223f: 31 c0                	xorl	%eax, %eax
ffff800000112241: ff d1                	callq	*%rcx
; 	i = 0;
ffff800000112243: c7 45 ec 00 00 00 00 	movl	$0, -20(%rbp)
; 	echoing = iscons(0);
ffff80000011224a: 31 c0                	xorl	%eax, %eax
ffff80000011224c: 48 b8 40 c7 10 00 00 80 ff ff	movabsq	$-140737487255744, %rax # imm = 0xFFFF80000010C740
ffff800000112256: 31 ff                	xorl	%edi, %edi
ffff800000112258: ff d0                	callq	*%rax
ffff80000011225a: 89 45 e4             	movl	%eax, -28(%rbp)
; 		c = getchar();
ffff80000011225d: 48 b8 10 c7 10 00 00 80 ff ff	movabsq	$-140737487255792, %rax # imm = 0xFFFF80000010C710
ffff800000112267: ff d0                	callq	*%rax
ffff800000112269: 89 45 e8             	movl	%eax, -24(%rbp)
; 		if (c < 0) {
ffff80000011226c: 83 7d e8 00          	cmpl	$0, -24(%rbp)
ffff800000112270: 0f 8d 28 00 00 00    	jge	0xffff80000011229e <readline+0x8e>
; 			cprintf("read error: %e\n", c);
ffff800000112276: 8b 75 e8             	movl	-24(%rbp), %esi
ffff800000112279: 48 bf 51 8d 11 00 00 80 ff ff	movabsq	$-140737487205039, %rdi # imm = 0xFFFF800000118D51
ffff800000112283: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011228d: 31 c0                	xorl	%eax, %eax
ffff80000011228f: ff d1                	callq	*%rcx
; 			return NULL;
ffff800000112291: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000112299: e9 f8 00 00 00       	jmp	0xffff800000112396 <readline+0x186>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000011229e: 83 7d e8 08          	cmpl	$8, -24(%rbp)
ffff8000001122a2: 0f 84 0a 00 00 00    	je	0xffff8000001122b2 <readline+0xa2>
ffff8000001122a8: 83 7d e8 7f          	cmpl	$127, -24(%rbp)
ffff8000001122ac: 0f 85 33 00 00 00    	jne	0xffff8000001122e5 <readline+0xd5>
ffff8000001122b2: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001122b6: 0f 8e 29 00 00 00    	jle	0xffff8000001122e5 <readline+0xd5>
; 			if (echoing)
ffff8000001122bc: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff8000001122c0: 0f 84 11 00 00 00    	je	0xffff8000001122d7 <readline+0xc7>
; 				cputchar('\b');
ffff8000001122c6: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff8000001122d0: bf 08 00 00 00       	movl	$8, %edi
ffff8000001122d5: ff d0                	callq	*%rax
; 			i--;
ffff8000001122d7: 8b 45 ec             	movl	-20(%rbp), %eax
ffff8000001122da: 83 c0 ff             	addl	$-1, %eax
ffff8000001122dd: 89 45 ec             	movl	%eax, -20(%rbp)
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff8000001122e0: e9 a7 00 00 00       	jmp	0xffff80000011238c <readline+0x17c>
ffff8000001122e5: 83 7d e8 20          	cmpl	$32, -24(%rbp)
ffff8000001122e9: 0f 8c 49 00 00 00    	jl	0xffff800000112338 <readline+0x128>
ffff8000001122ef: 81 7d ec ff 03 00 00 	cmpl	$1023, -20(%rbp)        # imm = 0x3FF
ffff8000001122f6: 0f 8d 3c 00 00 00    	jge	0xffff800000112338 <readline+0x128>
; 			if (echoing)
ffff8000001122fc: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff800000112300: 0f 84 0f 00 00 00    	je	0xffff800000112315 <readline+0x105>
; 				cputchar(c);
ffff800000112306: 8b 7d e8             	movl	-24(%rbp), %edi
ffff800000112309: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff800000112313: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff800000112315: 8a 4d e8             	movb	-24(%rbp), %cl
ffff800000112318: 48 63 45 ec          	movslq	-20(%rbp), %rax
ffff80000011231c: 89 c2                	movl	%eax, %edx
ffff80000011231e: 83 c2 01             	addl	$1, %edx
ffff800000112321: 89 55 ec             	movl	%edx, -20(%rbp)
ffff800000112324: 48 ba 00 d3 11 00 00 80 ff ff	movabsq	$-140737487187200, %rdx # imm = 0xFFFF80000011D300
ffff80000011232e: 48 01 d0             	addq	%rdx, %rax
ffff800000112331: 88 08                	movb	%cl, (%rax)
; 		} else if (c == '\n' || c == '\r') {
ffff800000112333: e9 4f 00 00 00       	jmp	0xffff800000112387 <readline+0x177>
ffff800000112338: 83 7d e8 0a          	cmpl	$10, -24(%rbp)
ffff80000011233c: 0f 84 0a 00 00 00    	je	0xffff80000011234c <readline+0x13c>
ffff800000112342: 83 7d e8 0d          	cmpl	$13, -24(%rbp)
ffff800000112346: 0f 85 36 00 00 00    	jne	0xffff800000112382 <readline+0x172>
; 			if (echoing)
ffff80000011234c: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff800000112350: 0f 84 11 00 00 00    	je	0xffff800000112367 <readline+0x157>
; 				cputchar('\n');
ffff800000112356: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff800000112360: bf 0a 00 00 00       	movl	$10, %edi
ffff800000112365: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff800000112367: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff80000011236b: 48 b8 00 d3 11 00 00 80 ff ff	movabsq	$-140737487187200, %rax # imm = 0xFFFF80000011D300
ffff800000112375: c6 04 01 00          	movb	$0, (%rcx,%rax)
; 			return buf;
ffff800000112379: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000011237d: e9 14 00 00 00       	jmp	0xffff800000112396 <readline+0x186>
ffff800000112382: e9 00 00 00 00       	jmp	0xffff800000112387 <readline+0x177>
ffff800000112387: e9 00 00 00 00       	jmp	0xffff80000011238c <readline+0x17c>
ffff80000011238c: e9 00 00 00 00       	jmp	0xffff800000112391 <readline+0x181>
; 	while (1) {
ffff800000112391: e9 c7 fe ff ff       	jmp	0xffff80000011225d <readline+0x4d>
; }
ffff800000112396: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011239a: 48 83 c4 20          	addq	$32, %rsp
ffff80000011239e: 5d                   	popq	%rbp
ffff80000011239f: c3                   	retq

ffff8000001123a0 <strlen>:
; {
ffff8000001123a0: 55                   	pushq	%rbp
ffff8000001123a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001123a4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
ffff8000001123a8: c7 45 f4 00 00 00 00 	movl	$0, -12(%rbp)
ffff8000001123af: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001123b3: 0f be 00             	movsbl	(%rax), %eax
ffff8000001123b6: 83 f8 00             	cmpl	$0, %eax
ffff8000001123b9: 0f 84 1a 00 00 00    	je	0xffff8000001123d9 <strlen+0x39>
; 		n++;
ffff8000001123bf: 8b 45 f4             	movl	-12(%rbp), %eax
ffff8000001123c2: 83 c0 01             	addl	$1, %eax
ffff8000001123c5: 89 45 f4             	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
ffff8000001123c8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001123cc: 48 83 c0 01          	addq	$1, %rax
ffff8000001123d0: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001123d4: e9 d6 ff ff ff       	jmp	0xffff8000001123af <strlen+0xf>
; 	return n;
ffff8000001123d9: 8b 45 f4             	movl	-12(%rbp), %eax
ffff8000001123dc: 5d                   	popq	%rbp
ffff8000001123dd: c3                   	retq
ffff8000001123de: 66 90                	nop

ffff8000001123e0 <strnlen>:
; {
ffff8000001123e0: 55                   	pushq	%rbp
ffff8000001123e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001123e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001123e8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff8000001123ec: c7 45 ec 00 00 00 00 	movl	$0, -20(%rbp)
ffff8000001123f3: 31 c0                	xorl	%eax, %eax
ffff8000001123f5: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff8000001123fa: 88 45 eb             	movb	%al, -21(%rbp)
ffff8000001123fd: 0f 86 10 00 00 00    	jbe	0xffff800000112413 <strnlen+0x33>
ffff800000112403: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112407: 0f be 00             	movsbl	(%rax), %eax
ffff80000011240a: 83 f8 00             	cmpl	$0, %eax
ffff80000011240d: 0f 95 c0             	setne	%al
ffff800000112410: 88 45 eb             	movb	%al, -21(%rbp)
ffff800000112413: 8a 45 eb             	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff800000112416: a8 01                	testb	$1, %al
ffff800000112418: 0f 85 05 00 00 00    	jne	0xffff800000112423 <strnlen+0x43>
ffff80000011241e: e9 26 00 00 00       	jmp	0xffff800000112449 <strnlen+0x69>
; 		n++;
ffff800000112423: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112426: 83 c0 01             	addl	$1, %eax
ffff800000112429: 89 45 ec             	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000011242c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112430: 48 83 c0 01          	addq	$1, %rax
ffff800000112434: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112438: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011243c: 48 83 c0 ff          	addq	$-1, %rax
ffff800000112440: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000112444: e9 aa ff ff ff       	jmp	0xffff8000001123f3 <strnlen+0x13>
; 	return n;
ffff800000112449: 8b 45 ec             	movl	-20(%rbp), %eax
ffff80000011244c: 5d                   	popq	%rbp
ffff80000011244d: c3                   	retq
ffff80000011244e: 66 90                	nop

ffff800000112450 <strcpy>:
; {
ffff800000112450: 55                   	pushq	%rbp
ffff800000112451: 48 89 e5             	movq	%rsp, %rbp
ffff800000112454: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112458: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	ret = dst;
ffff80000011245c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112460: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
ffff800000112464: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112468: 48 89 c1             	movq	%rax, %rcx
ffff80000011246b: 48 83 c1 01          	addq	$1, %rcx
ffff80000011246f: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff800000112473: 8a 00                	movb	(%rax), %al
ffff800000112475: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000112479: 48 89 ca             	movq	%rcx, %rdx
ffff80000011247c: 48 83 c2 01          	addq	$1, %rdx
ffff800000112480: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff800000112484: 88 01                	movb	%al, (%rcx)
ffff800000112486: 0f be c0             	movsbl	%al, %eax
ffff800000112489: 83 f8 00             	cmpl	$0, %eax
ffff80000011248c: 0f 84 05 00 00 00    	je	0xffff800000112497 <strcpy+0x47>
ffff800000112492: e9 cd ff ff ff       	jmp	0xffff800000112464 <strcpy+0x14>
; 	return ret;
ffff800000112497: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011249b: 5d                   	popq	%rbp
ffff80000011249c: c3                   	retq
ffff80000011249d: 0f 1f 00             	nopl	(%rax)

ffff8000001124a0 <strcat>:
; {
ffff8000001124a0: 55                   	pushq	%rbp
ffff8000001124a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001124a4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001124a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001124ac: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
ffff8000001124b0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001124b4: 48 b8 a0 23 11 00 00 80 ff ff	movabsq	$-140737487232096, %rax # imm = 0xFFFF8000001123A0
ffff8000001124be: ff d0                	callq	*%rax
ffff8000001124c0: 89 45 ec             	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
ffff8000001124c3: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001124c7: 48 63 45 ec          	movslq	-20(%rbp), %rax
ffff8000001124cb: 48 01 c7             	addq	%rax, %rdi
ffff8000001124ce: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001124d2: 48 b8 50 24 11 00 00 80 ff ff	movabsq	$-140737487231920, %rax # imm = 0xFFFF800000112450
ffff8000001124dc: ff d0                	callq	*%rax
; 	return dst;
ffff8000001124de: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001124e2: 48 83 c4 20          	addq	$32, %rsp
ffff8000001124e6: 5d                   	popq	%rbp
ffff8000001124e7: c3                   	retq
ffff8000001124e8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001124f0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff8000001124f0: 55                   	pushq	%rbp
ffff8000001124f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001124f4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001124f8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001124fc: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	ret = dst;
ffff800000112500: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112504: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
ffff800000112508: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000112510: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112514: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000112518: 0f 83 49 00 00 00    	jae	0xffff800000112567 <strncpy+0x77>
; 		*dst++ = *src;
ffff80000011251e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112522: 8a 08                	movb	(%rax), %cl
ffff800000112524: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112528: 48 89 c2             	movq	%rax, %rdx
ffff80000011252b: 48 83 c2 01          	addq	$1, %rdx
ffff80000011252f: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff800000112533: 88 08                	movb	%cl, (%rax)
; 		if (*src != '\0')
ffff800000112535: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112539: 0f be 00             	movsbl	(%rax), %eax
ffff80000011253c: 83 f8 00             	cmpl	$0, %eax
ffff80000011253f: 0f 84 0c 00 00 00    	je	0xffff800000112551 <strncpy+0x61>
; 			src++;
ffff800000112545: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112549: 48 83 c0 01          	addq	$1, %rax
ffff80000011254d: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	}
ffff800000112551: e9 00 00 00 00       	jmp	0xffff800000112556 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
ffff800000112556: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011255a: 48 83 c0 01          	addq	$1, %rax
ffff80000011255e: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000112562: e9 a9 ff ff ff       	jmp	0xffff800000112510 <strncpy+0x20>
; 	return ret;
ffff800000112567: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011256b: 5d                   	popq	%rbp
ffff80000011256c: c3                   	retq
ffff80000011256d: 0f 1f 00             	nopl	(%rax)

ffff800000112570 <strlcpy>:
; {
ffff800000112570: 55                   	pushq	%rbp
ffff800000112571: 48 89 e5             	movq	%rsp, %rbp
ffff800000112574: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112578: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011257c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
ffff800000112580: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112584: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (size > 0) {
ffff800000112588: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff80000011258d: 0f 86 6e 00 00 00    	jbe	0xffff800000112601 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
ffff800000112593: e9 00 00 00 00       	jmp	0xffff800000112598 <strlcpy+0x28>
ffff800000112598: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011259c: 48 83 c1 ff          	addq	$-1, %rcx
ffff8000001125a0: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff8000001125a4: 31 c0                	xorl	%eax, %eax
ffff8000001125a6: 48 83 f9 00          	cmpq	$0, %rcx
ffff8000001125aa: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001125ad: 0f 86 10 00 00 00    	jbe	0xffff8000001125c3 <strlcpy+0x53>
ffff8000001125b3: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001125b7: 0f be 00             	movsbl	(%rax), %eax
ffff8000001125ba: 83 f8 00             	cmpl	$0, %eax
ffff8000001125bd: 0f 95 c0             	setne	%al
ffff8000001125c0: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001125c3: 8a 45 df             	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
ffff8000001125c6: a8 01                	testb	$1, %al
ffff8000001125c8: 0f 85 05 00 00 00    	jne	0xffff8000001125d3 <strlcpy+0x63>
ffff8000001125ce: e9 27 00 00 00       	jmp	0xffff8000001125fa <strlcpy+0x8a>
; 			*dst++ = *src++;
ffff8000001125d3: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001125d7: 48 89 c1             	movq	%rax, %rcx
ffff8000001125da: 48 83 c1 01          	addq	$1, %rcx
ffff8000001125de: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff8000001125e2: 8a 08                	movb	(%rax), %cl
ffff8000001125e4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001125e8: 48 89 c2             	movq	%rax, %rdx
ffff8000001125eb: 48 83 c2 01          	addq	$1, %rdx
ffff8000001125ef: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff8000001125f3: 88 08                	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
ffff8000001125f5: e9 9e ff ff ff       	jmp	0xffff800000112598 <strlcpy+0x28>
; 		*dst = '\0';
ffff8000001125fa: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001125fe: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff800000112601: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112605: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112609: 48 29 c8             	subq	%rcx, %rax
ffff80000011260c: 5d                   	popq	%rbp
ffff80000011260d: c3                   	retq
ffff80000011260e: 66 90                	nop

ffff800000112610 <strcmp>:
; {
ffff800000112610: 55                   	pushq	%rbp
ffff800000112611: 48 89 e5             	movq	%rsp, %rbp
ffff800000112614: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112618: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
ffff80000011261c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112620: 0f be 08             	movsbl	(%rax), %ecx
ffff800000112623: 31 c0                	xorl	%eax, %eax
ffff800000112625: 83 f9 00             	cmpl	$0, %ecx
ffff800000112628: 88 45 ef             	movb	%al, -17(%rbp)
ffff80000011262b: 0f 84 16 00 00 00    	je	0xffff800000112647 <strcmp+0x37>
ffff800000112631: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112635: 0f be 00             	movsbl	(%rax), %eax
ffff800000112638: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011263c: 0f be 09             	movsbl	(%rcx), %ecx
ffff80000011263f: 39 c8                	cmpl	%ecx, %eax
ffff800000112641: 0f 94 c0             	sete	%al
ffff800000112644: 88 45 ef             	movb	%al, -17(%rbp)
ffff800000112647: 8a 45 ef             	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
ffff80000011264a: a8 01                	testb	$1, %al
ffff80000011264c: 0f 85 05 00 00 00    	jne	0xffff800000112657 <strcmp+0x47>
ffff800000112652: e9 1d 00 00 00       	jmp	0xffff800000112674 <strcmp+0x64>
; 		p++, q++;
ffff800000112657: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011265b: 48 83 c0 01          	addq	$1, %rax
ffff80000011265f: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112663: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112667: 48 83 c0 01          	addq	$1, %rax
ffff80000011266b: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
ffff80000011266f: e9 a8 ff ff ff       	jmp	0xffff80000011261c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff800000112674: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112678: 0f b6 00             	movzbl	(%rax), %eax
ffff80000011267b: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011267f: 0f b6 09             	movzbl	(%rcx), %ecx
ffff800000112682: 29 c8                	subl	%ecx, %eax
ffff800000112684: 5d                   	popq	%rbp
ffff800000112685: c3                   	retq
ffff800000112686: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112690 <strncmp>:
; {
ffff800000112690: 55                   	pushq	%rbp
ffff800000112691: 48 89 e5             	movq	%rsp, %rbp
ffff800000112694: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112698: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff80000011269c: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
ffff8000001126a0: 31 c0                	xorl	%eax, %eax
ffff8000001126a2: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff8000001126a7: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001126aa: 0f 86 2b 00 00 00    	jbe	0xffff8000001126db <strncmp+0x4b>
ffff8000001126b0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001126b4: 0f be 08             	movsbl	(%rax), %ecx
ffff8000001126b7: 31 c0                	xorl	%eax, %eax
ffff8000001126b9: 83 f9 00             	cmpl	$0, %ecx
ffff8000001126bc: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001126bf: 0f 84 16 00 00 00    	je	0xffff8000001126db <strncmp+0x4b>
ffff8000001126c5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001126c9: 0f be 00             	movsbl	(%rax), %eax
ffff8000001126cc: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001126d0: 0f be 09             	movsbl	(%rcx), %ecx
ffff8000001126d3: 39 c8                	cmpl	%ecx, %eax
ffff8000001126d5: 0f 94 c0             	sete	%al
ffff8000001126d8: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001126db: 8a 45 df             	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
ffff8000001126de: a8 01                	testb	$1, %al
ffff8000001126e0: 0f 85 05 00 00 00    	jne	0xffff8000001126eb <strncmp+0x5b>
ffff8000001126e6: e9 29 00 00 00       	jmp	0xffff800000112714 <strncmp+0x84>
; 		n--, p++, q++;
ffff8000001126eb: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001126ef: 48 83 c0 ff          	addq	$-1, %rax
ffff8000001126f3: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001126f7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001126fb: 48 83 c0 01          	addq	$1, %rax
ffff8000001126ff: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000112703: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112707: 48 83 c0 01          	addq	$1, %rax
ffff80000011270b: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
ffff80000011270f: e9 8c ff ff ff       	jmp	0xffff8000001126a0 <strncmp+0x10>
; 	if (n == 0)
ffff800000112714: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112719: 0f 85 0c 00 00 00    	jne	0xffff80000011272b <strncmp+0x9b>
; 		return 0;
ffff80000011271f: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112726: e9 13 00 00 00       	jmp	0xffff80000011273e <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000011272b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011272f: 0f b6 00             	movzbl	(%rax), %eax
ffff800000112732: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112736: 0f b6 09             	movzbl	(%rcx), %ecx
ffff800000112739: 29 c8                	subl	%ecx, %eax
ffff80000011273b: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff80000011273e: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112741: 5d                   	popq	%rbp
ffff800000112742: c3                   	retq
ffff800000112743: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011274d: 0f 1f 00             	nopl	(%rax)

ffff800000112750 <strchr>:
; {
ffff800000112750: 55                   	pushq	%rbp
ffff800000112751: 48 89 e5             	movq	%rsp, %rbp
ffff800000112754: 40 88 f0             	movb	%sil, %al
ffff800000112757: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011275b: 88 45 ef             	movb	%al, -17(%rbp)
; 	for (; *s; s++)
ffff80000011275e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112762: 80 38 00             	cmpb	$0, (%rax)
ffff800000112765: 0f 84 36 00 00 00    	je	0xffff8000001127a1 <strchr+0x51>
; 		if (*s == c)
ffff80000011276b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011276f: 0f be 00             	movsbl	(%rax), %eax
ffff800000112772: 0f be 4d ef          	movsbl	-17(%rbp), %ecx
ffff800000112776: 39 c8                	cmpl	%ecx, %eax
ffff800000112778: 0f 85 0d 00 00 00    	jne	0xffff80000011278b <strchr+0x3b>
; 			return (char *) s;
ffff80000011277e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112782: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112786: e9 1e 00 00 00       	jmp	0xffff8000001127a9 <strchr+0x59>
; 		if (*s == c)
ffff80000011278b: e9 00 00 00 00       	jmp	0xffff800000112790 <strchr+0x40>
; 	for (; *s; s++)
ffff800000112790: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112794: 48 83 c0 01          	addq	$1, %rax
ffff800000112798: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000011279c: e9 bd ff ff ff       	jmp	0xffff80000011275e <strchr+0xe>
; 	return 0;
ffff8000001127a1: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
ffff8000001127a9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001127ad: 5d                   	popq	%rbp
ffff8000001127ae: c3                   	retq
ffff8000001127af: 90                   	nop

ffff8000001127b0 <strfind>:
; {
ffff8000001127b0: 55                   	pushq	%rbp
ffff8000001127b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001127b4: 40 88 f0             	movb	%sil, %al
ffff8000001127b7: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001127bb: 88 45 f7             	movb	%al, -9(%rbp)
; 	for (; *s; s++)
ffff8000001127be: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001127c2: 80 38 00             	cmpb	$0, (%rax)
ffff8000001127c5: 0f 84 2e 00 00 00    	je	0xffff8000001127f9 <strfind+0x49>
; 		if (*s == c)
ffff8000001127cb: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001127cf: 0f be 00             	movsbl	(%rax), %eax
ffff8000001127d2: 0f be 4d f7          	movsbl	-9(%rbp), %ecx
ffff8000001127d6: 39 c8                	cmpl	%ecx, %eax
ffff8000001127d8: 0f 85 05 00 00 00    	jne	0xffff8000001127e3 <strfind+0x33>
; 			break;
ffff8000001127de: e9 16 00 00 00       	jmp	0xffff8000001127f9 <strfind+0x49>
; 		if (*s == c)
ffff8000001127e3: e9 00 00 00 00       	jmp	0xffff8000001127e8 <strfind+0x38>
; 	for (; *s; s++)
ffff8000001127e8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001127ec: 48 83 c0 01          	addq	$1, %rax
ffff8000001127f0: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001127f4: e9 c5 ff ff ff       	jmp	0xffff8000001127be <strfind+0xe>
; 	return (char *) s;
ffff8000001127f9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001127fd: 5d                   	popq	%rbp
ffff8000001127fe: c3                   	retq
ffff8000001127ff: 90                   	nop

ffff800000112800 <memset>:
; {
ffff800000112800: 55                   	pushq	%rbp
ffff800000112801: 48 89 e5             	movq	%rsp, %rbp
ffff800000112804: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112808: 89 75 ec             	movl	%esi, -20(%rbp)
ffff80000011280b: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	if (n == 0)
ffff80000011280f: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112814: 0f 85 0d 00 00 00    	jne	0xffff800000112827 <memset+0x27>
; 		return v;
ffff80000011281a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011281e: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112822: e9 78 00 00 00       	jmp	0xffff80000011289f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff800000112827: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011282b: 48 83 e0 03          	andq	$3, %rax
ffff80000011282f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112833: 0f 85 50 00 00 00    	jne	0xffff800000112889 <memset+0x89>
ffff800000112839: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011283d: 48 83 e0 03          	andq	$3, %rax
ffff800000112841: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112845: 0f 85 3e 00 00 00    	jne	0xffff800000112889 <memset+0x89>
; 		c &= 0xFF;
ffff80000011284b: 8b 45 ec             	movl	-20(%rbp), %eax
ffff80000011284e: 25 ff 00 00 00       	andl	$255, %eax
ffff800000112853: 89 45 ec             	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff800000112856: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112859: c1 e0 18             	shll	$24, %eax
ffff80000011285c: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff80000011285f: c1 e1 10             	shll	$16, %ecx
ffff800000112862: 09 c8                	orl	%ecx, %eax
ffff800000112864: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000112867: c1 e1 08             	shll	$8, %ecx
ffff80000011286a: 09 c8                	orl	%ecx, %eax
ffff80000011286c: 0b 45 ec             	orl	-20(%rbp), %eax
ffff80000011286f: 89 45 ec             	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff800000112872: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000112876: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112879: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000011287d: 48 c1 e9 02          	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
ffff800000112881: fc                   	cld
ffff800000112882: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; 	} else
ffff800000112884: e9 0e 00 00 00       	jmp	0xffff800000112897 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
ffff800000112889: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000011288d: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112890: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
ffff800000112894: fc                   	cld
ffff800000112895: f3 aa                	rep		stosb	%al, %es:(%rdi)
; 	return v;
ffff800000112897: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011289b: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff80000011289f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001128a3: 5d                   	popq	%rbp
ffff8000001128a4: c3                   	retq
ffff8000001128a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001128af: 90                   	nop

ffff8000001128b0 <memmove>:
; {
ffff8000001128b0: 55                   	pushq	%rbp
ffff8000001128b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001128b4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001128b8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001128bc: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	s = src;
ffff8000001128c0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001128c4: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	d = dst;
ffff8000001128c8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001128cc: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
ffff8000001128d0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001128d4: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff8000001128d8: 0f 83 9d 00 00 00    	jae	0xffff80000011297b <memmove+0xcb>
ffff8000001128de: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001128e2: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff8000001128e6: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff8000001128ea: 0f 86 8b 00 00 00    	jbe	0xffff80000011297b <memmove+0xcb>
; 		s += n;
ffff8000001128f0: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001128f4: 48 03 45 e0          	addq	-32(%rbp), %rax
ffff8000001128f8: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		d += n;
ffff8000001128fc: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112900: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff800000112904: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000112908: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011290c: 48 83 e0 03          	andq	$3, %rax
ffff800000112910: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112914: 0f 85 44 00 00 00    	jne	0xffff80000011295e <memmove+0xae>
ffff80000011291a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011291e: 48 83 e0 03          	andq	$3, %rax
ffff800000112922: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112926: 0f 85 32 00 00 00    	jne	0xffff80000011295e <memmove+0xae>
ffff80000011292c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112930: 48 83 e0 03          	andq	$3, %rax
ffff800000112934: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112938: 0f 85 20 00 00 00    	jne	0xffff80000011295e <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff80000011293e: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000112942: 48 83 c7 fc          	addq	$-4, %rdi
ffff800000112946: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff80000011294a: 48 83 c6 fc          	addq	$-4, %rsi
ffff80000011294e: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112952: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff800000112956: fd                   	std
ffff800000112957: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff800000112959: e9 17 00 00 00       	jmp	0xffff800000112975 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff80000011295e: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000112962: 48 83 c7 ff          	addq	$-1, %rdi
ffff800000112966: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff80000011296a: 48 83 c6 ff          	addq	$-1, %rsi
ffff80000011296e: 48 8b 4d e8          	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
ffff800000112972: fd                   	std
ffff800000112973: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff800000112975: fc                   	cld
; 	} else {
ffff800000112976: e9 62 00 00 00       	jmp	0xffff8000001129dd <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000011297b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011297f: 48 83 e0 03          	andq	$3, %rax
ffff800000112983: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112987: 0f 85 3c 00 00 00    	jne	0xffff8000001129c9 <memmove+0x119>
ffff80000011298d: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112991: 48 83 e0 03          	andq	$3, %rax
ffff800000112995: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112999: 0f 85 2a 00 00 00    	jne	0xffff8000001129c9 <memmove+0x119>
ffff80000011299f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001129a3: 48 83 e0 03          	andq	$3, %rax
ffff8000001129a7: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001129ab: 0f 85 18 00 00 00    	jne	0xffff8000001129c9 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff8000001129b1: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001129b5: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001129b9: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001129bd: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff8000001129c1: fc                   	cld
ffff8000001129c2: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff8000001129c4: e9 0f 00 00 00       	jmp	0xffff8000001129d8 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
ffff8000001129c9: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001129cd: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001129d1: 48 8b 4d e8          	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
ffff8000001129d5: fc                   	cld
ffff8000001129d6: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
ffff8000001129d8: e9 00 00 00 00       	jmp	0xffff8000001129dd <memmove+0x12d>
; 	return dst;
ffff8000001129dd: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001129e1: 5d                   	popq	%rbp
ffff8000001129e2: c3                   	retq
ffff8000001129e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001129ed: 0f 1f 00             	nopl	(%rax)

ffff8000001129f0 <memcpy>:
; {
ffff8000001129f0: 55                   	pushq	%rbp
ffff8000001129f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001129f4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001129f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001129fc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000112a00: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
ffff800000112a04: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000112a08: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000112a0c: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000112a10: 48 b8 b0 28 11 00 00 80 ff ff	movabsq	$-140737487230800, %rax # imm = 0xFFFF8000001128B0
ffff800000112a1a: ff d0                	callq	*%rax
ffff800000112a1c: 48 83 c4 20          	addq	$32, %rsp
ffff800000112a20: 5d                   	popq	%rbp
ffff800000112a21: c3                   	retq
ffff800000112a22: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112a2c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112a30 <memcmp>:
; {
ffff800000112a30: 55                   	pushq	%rbp
ffff800000112a31: 48 89 e5             	movq	%rsp, %rbp
ffff800000112a34: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112a38: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000112a3c: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
ffff800000112a40: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112a44: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
ffff800000112a48: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112a4c: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
ffff800000112a50: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112a54: 48 89 c1             	movq	%rax, %rcx
ffff800000112a57: 48 83 c1 ff          	addq	$-1, %rcx
ffff800000112a5b: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff800000112a5f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112a63: 0f 86 4b 00 00 00    	jbe	0xffff800000112ab4 <memcmp+0x84>
; 		if (*s1 != *s2)
ffff800000112a69: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112a6d: 0f b6 00             	movzbl	(%rax), %eax
ffff800000112a70: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112a74: 0f b6 09             	movzbl	(%rcx), %ecx
ffff800000112a77: 39 c8                	cmpl	%ecx, %eax
ffff800000112a79: 0f 84 18 00 00 00    	je	0xffff800000112a97 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
ffff800000112a7f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112a83: 0f b6 00             	movzbl	(%rax), %eax
ffff800000112a86: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112a8a: 0f b6 09             	movzbl	(%rcx), %ecx
ffff800000112a8d: 29 c8                	subl	%ecx, %eax
ffff800000112a8f: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000112a92: e9 24 00 00 00       	jmp	0xffff800000112abb <memcmp+0x8b>
; 		s1++, s2++;
ffff800000112a97: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112a9b: 48 83 c0 01          	addq	$1, %rax
ffff800000112a9f: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000112aa3: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112aa7: 48 83 c0 01          	addq	$1, %rax
ffff800000112aab: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
ffff800000112aaf: e9 9c ff ff ff       	jmp	0xffff800000112a50 <memcmp+0x20>
; 	return 0;
ffff800000112ab4: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112abb: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112abe: 5d                   	popq	%rbp
ffff800000112abf: c3                   	retq

ffff800000112ac0 <memfind>:
; {
ffff800000112ac0: 55                   	pushq	%rbp
ffff800000112ac1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112ac4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112ac8: 89 75 f4             	movl	%esi, -12(%rbp)
ffff800000112acb: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
ffff800000112acf: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112ad3: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000112ad7: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
ffff800000112adb: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112adf: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff800000112ae3: 0f 83 30 00 00 00    	jae	0xffff800000112b19 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff800000112ae9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112aed: 0f b6 00             	movzbl	(%rax), %eax
ffff800000112af0: 8b 4d f4             	movl	-12(%rbp), %ecx
ffff800000112af3: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000112af6: 39 c8                	cmpl	%ecx, %eax
ffff800000112af8: 0f 85 05 00 00 00    	jne	0xffff800000112b03 <memfind+0x43>
; 			break;
ffff800000112afe: e9 16 00 00 00       	jmp	0xffff800000112b19 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff800000112b03: e9 00 00 00 00       	jmp	0xffff800000112b08 <memfind+0x48>
; 	for (; s < ends; s++)
ffff800000112b08: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b0c: 48 83 c0 01          	addq	$1, %rax
ffff800000112b10: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112b14: e9 c2 ff ff ff       	jmp	0xffff800000112adb <memfind+0x1b>
; 	return (void *) s;
ffff800000112b19: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b1d: 5d                   	popq	%rbp
ffff800000112b1e: c3                   	retq
ffff800000112b1f: 90                   	nop

ffff800000112b20 <strtol>:
; {
ffff800000112b20: 55                   	pushq	%rbp
ffff800000112b21: 48 89 e5             	movq	%rsp, %rbp
ffff800000112b24: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112b28: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000112b2c: 89 55 ec             	movl	%edx, -20(%rbp)
; 	int neg = 0;
ffff800000112b2f: c7 45 e8 00 00 00 00 	movl	$0, -24(%rbp)
; 	long val = 0;
ffff800000112b36: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
ffff800000112b3e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b42: 0f be 08             	movsbl	(%rax), %ecx
ffff800000112b45: b0 01                	movb	$1, %al
ffff800000112b47: 83 f9 20             	cmpl	$32, %ecx
ffff800000112b4a: 88 45 db             	movb	%al, -37(%rbp)
ffff800000112b4d: 0f 84 10 00 00 00    	je	0xffff800000112b63 <strtol+0x43>
ffff800000112b53: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b57: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b5a: 83 f8 09             	cmpl	$9, %eax
ffff800000112b5d: 0f 94 c0             	sete	%al
ffff800000112b60: 88 45 db             	movb	%al, -37(%rbp)
ffff800000112b63: 8a 45 db             	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
ffff800000112b66: a8 01                	testb	$1, %al
ffff800000112b68: 0f 85 05 00 00 00    	jne	0xffff800000112b73 <strtol+0x53>
ffff800000112b6e: e9 11 00 00 00       	jmp	0xffff800000112b84 <strtol+0x64>
; 		s++;
ffff800000112b73: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b77: 48 83 c0 01          	addq	$1, %rax
ffff800000112b7b: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
ffff800000112b7f: e9 ba ff ff ff       	jmp	0xffff800000112b3e <strtol+0x1e>
; 	if (*s == '+')
ffff800000112b84: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b88: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b8b: 83 f8 2b             	cmpl	$43, %eax
ffff800000112b8e: 0f 85 11 00 00 00    	jne	0xffff800000112ba5 <strtol+0x85>
; 		s++;
ffff800000112b94: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b98: 48 83 c0 01          	addq	$1, %rax
ffff800000112b9c: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112ba0: e9 28 00 00 00       	jmp	0xffff800000112bcd <strtol+0xad>
; 	else if (*s == '-')
ffff800000112ba5: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112ba9: 0f be 00             	movsbl	(%rax), %eax
ffff800000112bac: 83 f8 2d             	cmpl	$45, %eax
ffff800000112baf: 0f 85 13 00 00 00    	jne	0xffff800000112bc8 <strtol+0xa8>
; 		s++, neg = 1;
ffff800000112bb5: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112bb9: 48 83 c0 01          	addq	$1, %rax
ffff800000112bbd: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112bc1: c7 45 e8 01 00 00 00 	movl	$1, -24(%rbp)
ffff800000112bc8: e9 00 00 00 00       	jmp	0xffff800000112bcd <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff800000112bcd: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112bd1: 0f 84 0a 00 00 00    	je	0xffff800000112be1 <strtol+0xc1>
ffff800000112bd7: 83 7d ec 10          	cmpl	$16, -20(%rbp)
ffff800000112bdb: 0f 85 39 00 00 00    	jne	0xffff800000112c1a <strtol+0xfa>
ffff800000112be1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112be5: 0f be 00             	movsbl	(%rax), %eax
ffff800000112be8: 83 f8 30             	cmpl	$48, %eax
ffff800000112beb: 0f 85 29 00 00 00    	jne	0xffff800000112c1a <strtol+0xfa>
ffff800000112bf1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112bf5: 0f be 40 01          	movsbl	1(%rax), %eax
ffff800000112bf9: 83 f8 78             	cmpl	$120, %eax
ffff800000112bfc: 0f 85 18 00 00 00    	jne	0xffff800000112c1a <strtol+0xfa>
; 		s += 2, base = 16;
ffff800000112c02: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c06: 48 83 c0 02          	addq	$2, %rax
ffff800000112c0a: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112c0e: c7 45 ec 10 00 00 00 	movl	$16, -20(%rbp)
ffff800000112c15: e9 4d 00 00 00       	jmp	0xffff800000112c67 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
ffff800000112c1a: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112c1e: 0f 85 28 00 00 00    	jne	0xffff800000112c4c <strtol+0x12c>
ffff800000112c24: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c28: 0f be 00             	movsbl	(%rax), %eax
ffff800000112c2b: 83 f8 30             	cmpl	$48, %eax
ffff800000112c2e: 0f 85 18 00 00 00    	jne	0xffff800000112c4c <strtol+0x12c>
; 		s++, base = 8;
ffff800000112c34: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c38: 48 83 c0 01          	addq	$1, %rax
ffff800000112c3c: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112c40: c7 45 ec 08 00 00 00 	movl	$8, -20(%rbp)
ffff800000112c47: e9 16 00 00 00       	jmp	0xffff800000112c62 <strtol+0x142>
; 	else if (base == 0)
ffff800000112c4c: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112c50: 0f 85 07 00 00 00    	jne	0xffff800000112c5d <strtol+0x13d>
; 		base = 10;
ffff800000112c56: c7 45 ec 0a 00 00 00 	movl	$10, -20(%rbp)
ffff800000112c5d: e9 00 00 00 00       	jmp	0xffff800000112c62 <strtol+0x142>
ffff800000112c62: e9 00 00 00 00       	jmp	0xffff800000112c67 <strtol+0x147>
; 	while (1) {
ffff800000112c67: e9 00 00 00 00       	jmp	0xffff800000112c6c <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
ffff800000112c6c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c70: 0f be 00             	movsbl	(%rax), %eax
ffff800000112c73: 83 f8 30             	cmpl	$48, %eax
ffff800000112c76: 0f 8c 22 00 00 00    	jl	0xffff800000112c9e <strtol+0x17e>
ffff800000112c7c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c80: 0f be 00             	movsbl	(%rax), %eax
ffff800000112c83: 83 f8 39             	cmpl	$57, %eax
ffff800000112c86: 0f 8f 12 00 00 00    	jg	0xffff800000112c9e <strtol+0x17e>
; 			dig = *s - '0';
ffff800000112c8c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112c90: 0f be 00             	movsbl	(%rax), %eax
ffff800000112c93: 83 e8 30             	subl	$48, %eax
ffff800000112c96: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112c99: e9 79 00 00 00       	jmp	0xffff800000112d17 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
ffff800000112c9e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112ca2: 0f be 00             	movsbl	(%rax), %eax
ffff800000112ca5: 83 f8 61             	cmpl	$97, %eax
ffff800000112ca8: 0f 8c 25 00 00 00    	jl	0xffff800000112cd3 <strtol+0x1b3>
ffff800000112cae: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112cb2: 0f be 00             	movsbl	(%rax), %eax
ffff800000112cb5: 83 f8 7a             	cmpl	$122, %eax
ffff800000112cb8: 0f 8f 15 00 00 00    	jg	0xffff800000112cd3 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
ffff800000112cbe: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112cc2: 0f be 00             	movsbl	(%rax), %eax
ffff800000112cc5: 83 e8 61             	subl	$97, %eax
ffff800000112cc8: 83 c0 0a             	addl	$10, %eax
ffff800000112ccb: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112cce: e9 3f 00 00 00       	jmp	0xffff800000112d12 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff800000112cd3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112cd7: 0f be 00             	movsbl	(%rax), %eax
ffff800000112cda: 83 f8 41             	cmpl	$65, %eax
ffff800000112cdd: 0f 8c 25 00 00 00    	jl	0xffff800000112d08 <strtol+0x1e8>
ffff800000112ce3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112ce7: 0f be 00             	movsbl	(%rax), %eax
ffff800000112cea: 83 f8 5a             	cmpl	$90, %eax
ffff800000112ced: 0f 8f 15 00 00 00    	jg	0xffff800000112d08 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
ffff800000112cf3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112cf7: 0f be 00             	movsbl	(%rax), %eax
ffff800000112cfa: 83 e8 41             	subl	$65, %eax
ffff800000112cfd: 83 c0 0a             	addl	$10, %eax
ffff800000112d00: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112d03: e9 05 00 00 00       	jmp	0xffff800000112d0d <strtol+0x1ed>
; 			break;
ffff800000112d08: e9 43 00 00 00       	jmp	0xffff800000112d50 <strtol+0x230>
ffff800000112d0d: e9 00 00 00 00       	jmp	0xffff800000112d12 <strtol+0x1f2>
ffff800000112d12: e9 00 00 00 00       	jmp	0xffff800000112d17 <strtol+0x1f7>
; 		if (dig >= base)
ffff800000112d17: 8b 45 dc             	movl	-36(%rbp), %eax
ffff800000112d1a: 3b 45 ec             	cmpl	-20(%rbp), %eax
ffff800000112d1d: 0f 8c 05 00 00 00    	jl	0xffff800000112d28 <strtol+0x208>
; 			break;
ffff800000112d23: e9 28 00 00 00       	jmp	0xffff800000112d50 <strtol+0x230>
; 		s++, val = (val * base) + dig;
ffff800000112d28: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112d2c: 48 83 c0 01          	addq	$1, %rax
ffff800000112d30: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112d34: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112d38: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff800000112d3c: 48 0f af c1          	imulq	%rcx, %rax
ffff800000112d40: 48 63 4d dc          	movslq	-36(%rbp), %rcx
ffff800000112d44: 48 01 c8             	addq	%rcx, %rax
ffff800000112d47: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	while (1) {
ffff800000112d4b: e9 1c ff ff ff       	jmp	0xffff800000112c6c <strtol+0x14c>
; 	if (endptr)
ffff800000112d50: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000112d55: 0f 84 0b 00 00 00    	je	0xffff800000112d66 <strtol+0x246>
; 		*endptr = (char *) s;
ffff800000112d5b: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000112d5f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112d63: 48 89 08             	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
ffff800000112d66: 83 7d e8 00          	cmpl	$0, -24(%rbp)
ffff800000112d6a: 0f 84 0f 00 00 00    	je	0xffff800000112d7f <strtol+0x25f>
ffff800000112d70: 31 c0                	xorl	%eax, %eax
ffff800000112d72: 48 2b 45 e0          	subq	-32(%rbp), %rax
ffff800000112d76: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000112d7a: e9 08 00 00 00       	jmp	0xffff800000112d87 <strtol+0x267>
ffff800000112d7f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112d83: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000112d87: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
ffff800000112d8b: 5d                   	popq	%rbp
ffff800000112d8c: c3                   	retq
ffff800000112d8d: cc                   	int3
ffff800000112d8e: cc                   	int3
ffff800000112d8f: cc                   	int3

ffff800000112d90 <dump_page_tables>:
; {
ffff800000112d90: 55                   	pushq	%rbp
ffff800000112d91: 48 89 e5             	movq	%rsp, %rbp
ffff800000112d94: 48 81 ec 90 00 00 00 	subq	$144, %rsp
ffff800000112d9b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112d9f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	struct dump_info info = {
ffff800000112da3: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000112dab: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000112db3: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000112dbb: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.mask = mask,
ffff800000112dc3: 48 8b 45 e8          	movq	-24(%rbp), %rax
; 	struct dump_info info = {
ffff800000112dc7: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct page_walker walker = {
ffff800000112dcb: 48 b8 90 2e 11 00 00 80 ff ff	movabsq	$-140737487229296, %rax # imm = 0xFFFF800000112E90
ffff800000112dd5: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000112ddc: 48 b8 40 2f 11 00 00 80 ff ff	movabsq	$-140737487229120, %rax # imm = 0xFFFF800000112F40
ffff800000112de6: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff800000112dea: 48 c7 45 88 00 00 00 00      	movq	$0, -120(%rbp)
ffff800000112df2: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff800000112dfa: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000112e02: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff800000112e0a: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000112e12: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000112e1a: 48 b8 10 30 11 00 00 80 ff ff	movabsq	$-140737487228912, %rax # imm = 0xFFFF800000113010
ffff800000112e24: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		.udata = &info,
ffff800000112e28: 48 8d 45 c8          	leaq	-56(%rbp), %rax
; 	struct page_walker walker = {
ffff800000112e2c: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	if (walk_all_pages(pml4, &walker) < 0)
ffff800000112e30: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000112e34: 48 b8 30 49 11 00 00 80 ff ff	movabsq	$-140737487222480, %rax # imm = 0xFFFF800000114930
ffff800000112e3e: 48 8d b5 78 ff ff ff 	leaq	-136(%rbp), %rsi
ffff800000112e45: ff d0                	callq	*%rax
ffff800000112e47: 83 f8 00             	cmpl	$0, %eax
ffff800000112e4a: 0f 8d 0c 00 00 00    	jge	0xffff800000112e5c <dump_page_tables+0xcc>
; 		return -1;
ffff800000112e50: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000112e57: e9 23 00 00 00       	jmp	0xffff800000112e7f <dump_page_tables+0xef>
; 	dump_hole(0, 0, &walker);
ffff800000112e5c: 31 c0                	xorl	%eax, %eax
ffff800000112e5e: 48 b8 10 30 11 00 00 80 ff ff	movabsq	$-140737487228912, %rax # imm = 0xFFFF800000113010
ffff800000112e68: 31 c9                	xorl	%ecx, %ecx
ffff800000112e6a: 89 ce                	movl	%ecx, %esi
ffff800000112e6c: 48 8d 95 78 ff ff ff 	leaq	-136(%rbp), %rdx
ffff800000112e73: 48 89 f7             	movq	%rsi, %rdi
ffff800000112e76: ff d0                	callq	*%rax
; 	return 0;
ffff800000112e78: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112e7f: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112e82: 48 81 c4 90 00 00 00 	addq	$144, %rsp
ffff800000112e89: 5d                   	popq	%rbp
ffff800000112e8a: c3                   	retq
ffff800000112e8b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000112e90 <dump_pte>:
; {
ffff800000112e90: 55                   	pushq	%rbp
ffff800000112e91: 48 89 e5             	movq	%rsp, %rbp
ffff800000112e94: 48 83 ec 40          	subq	$64, %rsp
ffff800000112e98: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112e9c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000112ea0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000112ea4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000112ea8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112eac: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000112eb0: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	flags = *entry & info->mask;
ffff800000112eb4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112eb8: 48 8b 00             	movq	(%rax), %rax
ffff800000112ebb: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112ebf: 48 23 41 18          	andq	24(%rcx), %rax
ffff800000112ec3: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (flags == info->flags) {
ffff800000112ec7: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000112ecb: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112ecf: 48 3b 41 10          	cmpq	16(%rcx), %rax
ffff800000112ed3: 0f 85 18 00 00 00    	jne	0xffff800000112ef1 <dump_pte+0x61>
; 		info->end = end;
ffff800000112ed9: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112edd: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112ee1: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		return 0;
ffff800000112ee5: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112eec: e9 42 00 00 00       	jmp	0xffff800000112f33 <dump_pte+0xa3>
; 	dump_hole(base, end, walker);
ffff800000112ef1: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000112ef5: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112ef9: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000112efd: 48 b8 10 30 11 00 00 80 ff ff	movabsq	$-140737487228912, %rax # imm = 0xFFFF800000113010
ffff800000112f07: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000112f09: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112f0d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112f11: 48 89 08             	movq	%rcx, (%rax)
; 	info->end = end;
ffff800000112f14: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112f18: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112f1c: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	info->flags = flags;
ffff800000112f20: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000112f24: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112f28: 48 89 48 10          	movq	%rcx, 16(%rax)
; 	return 0;
ffff800000112f2c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112f33: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112f36: 48 83 c4 40          	addq	$64, %rsp
ffff800000112f3a: 5d                   	popq	%rbp
ffff800000112f3b: c3                   	retq
ffff800000112f3c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112f40 <dump_pde>:
; {
ffff800000112f40: 55                   	pushq	%rbp
ffff800000112f41: 48 89 e5             	movq	%rsp, %rbp
ffff800000112f44: 48 83 ec 40          	subq	$64, %rsp
ffff800000112f48: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112f4c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000112f50: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000112f54: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000112f58: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112f5c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000112f60: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (!(*entry & PAGE_HUGE))
ffff800000112f64: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112f68: 48 8b 00             	movq	(%rax), %rax
ffff800000112f6b: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000112f71: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112f75: 0f 85 0c 00 00 00    	jne	0xffff800000112f87 <dump_pde+0x47>
; 		return 0;
ffff800000112f7b: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112f82: e9 7f 00 00 00       	jmp	0xffff800000113006 <dump_pde+0xc6>
; 	flags = *entry & info->mask;
ffff800000112f87: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112f8b: 48 8b 00             	movq	(%rax), %rax
ffff800000112f8e: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112f92: 48 23 41 18          	andq	24(%rcx), %rax
ffff800000112f96: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (flags == info->flags) {
ffff800000112f9a: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000112f9e: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112fa2: 48 3b 41 10          	cmpq	16(%rcx), %rax
ffff800000112fa6: 0f 85 18 00 00 00    	jne	0xffff800000112fc4 <dump_pde+0x84>
; 		info->end = end;
ffff800000112fac: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112fb0: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112fb4: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		return 0;
ffff800000112fb8: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112fbf: e9 42 00 00 00       	jmp	0xffff800000113006 <dump_pde+0xc6>
; 	dump_hole(base, end, walker);
ffff800000112fc4: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000112fc8: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112fcc: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000112fd0: 48 b8 10 30 11 00 00 80 ff ff	movabsq	$-140737487228912, %rax # imm = 0xFFFF800000113010
ffff800000112fda: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000112fdc: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112fe0: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112fe4: 48 89 08             	movq	%rcx, (%rax)
; 	info->end = end;
ffff800000112fe7: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112feb: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112fef: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	info->flags = flags;
ffff800000112ff3: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000112ff7: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112ffb: 48 89 48 10          	movq	%rcx, 16(%rax)
; 	return 0;
ffff800000112fff: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000113006: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000113009: 48 83 c4 40          	addq	$64, %rsp
ffff80000011300d: 5d                   	popq	%rbp
ffff80000011300e: c3                   	retq
ffff80000011300f: 90                   	nop

ffff800000113010 <dump_hole>:
; {
ffff800000113010: 55                   	pushq	%rbp
ffff800000113011: 48 89 e5             	movq	%rsp, %rbp
ffff800000113014: 48 83 ec 30          	subq	$48, %rsp
ffff800000113018: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011301c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113020: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000113024: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113028: 48 8b 40 48          	movq	72(%rax), %rax
ffff80000011302c: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (info->flags & PAGE_PRESENT) {
ffff800000113030: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113034: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000113038: 48 83 e0 01          	andq	$1, %rax
ffff80000011303c: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113040: 0f 84 1d 01 00 00    	je	0xffff800000113163 <dump_hole+0x153>
; 			info->base,
ffff800000113046: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011304a: 48 8b 30             	movq	(%rax), %rsi
; 			info->end,
ffff80000011304d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113051: 48 8b 50 08          	movq	8(%rax), %rdx
; 			(info->flags & PAGE_PRESENT) ? 'r' : '-',
ffff800000113055: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113059: 48 8b 78 10          	movq	16(%rax), %rdi
ffff80000011305d: 48 83 e7 01          	andq	$1, %rdi
ffff800000113061: b9 2d 00 00 00       	movl	$45, %ecx
ffff800000113066: b8 72 00 00 00       	movl	$114, %eax
ffff80000011306b: 48 83 ff 00          	cmpq	$0, %rdi
ffff80000011306f: 0f 45 c8             	cmovnel	%eax, %ecx
; 			(info->flags & PAGE_WRITE) ? 'w' : '-',
ffff800000113072: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113076: 48 8b 78 10          	movq	16(%rax), %rdi
ffff80000011307a: 48 83 e7 02          	andq	$2, %rdi
ffff80000011307e: 41 b8 2d 00 00 00    	movl	$45, %r8d
ffff800000113084: b8 77 00 00 00       	movl	$119, %eax
ffff800000113089: 48 83 ff 00          	cmpq	$0, %rdi
ffff80000011308d: 44 0f 45 c0          	cmovnel	%eax, %r8d
; 			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
ffff800000113091: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113095: 48 bf 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rdi # imm = 0x8000000000000000
ffff80000011309f: 48 23 78 10          	andq	16(%rax), %rdi
ffff8000001130a3: 41 b9 78 00 00 00    	movl	$120, %r9d
ffff8000001130a9: b8 2d 00 00 00       	movl	$45, %eax
ffff8000001130ae: 48 83 ff 00          	cmpq	$0, %rdi
ffff8000001130b2: 44 0f 45 c8          	cmovnel	%eax, %r9d
; 			(info->flags & PAGE_USER) ? 'u' : '-'
ffff8000001130b6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001130ba: 4c 8b 50 10          	movq	16(%rax), %r10
ffff8000001130be: 49 83 e2 04          	andq	$4, %r10
ffff8000001130c2: bf 2d 00 00 00       	movl	$45, %edi
ffff8000001130c7: b8 75 00 00 00       	movl	$117, %eax
ffff8000001130cc: 49 83 fa 00          	cmpq	$0, %r10
ffff8000001130d0: 0f 45 f8             	cmovnel	%eax, %edi
; 		cprintf("  %016p - %016p [%c%c%c%c",
ffff8000001130d3: 48 89 e0             	movq	%rsp, %rax
ffff8000001130d6: 89 38                	movl	%edi, (%rax)
ffff8000001130d8: 48 bf 9c 95 11 00 00 80 ff ff	movabsq	$-140737487202916, %rdi # imm = 0xFFFF80000011959C
ffff8000001130e2: 49 ba 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %r10 # imm = 0xFFFF80000010DC80
ffff8000001130ec: 31 c0                	xorl	%eax, %eax
ffff8000001130ee: 41 ff d2             	callq	*%r10
; 		if (info->mask & PAGE_HUGE) {
ffff8000001130f1: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001130f5: 48 8b 40 18          	movq	24(%rax), %rax
ffff8000001130f9: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001130ff: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113103: 0f 84 42 00 00 00    	je	0xffff80000011314b <dump_hole+0x13b>
; 				(info->flags & PAGE_HUGE) ? "2M" : "4K"
ffff800000113109: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011310d: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000113111: 25 80 00 00 00       	andl	$128, %eax
ffff800000113116: 89 c1                	movl	%eax, %ecx
ffff800000113118: 48 b8 37 85 11 00 00 80 ff ff	movabsq	$-140737487207113, %rax # imm = 0xFFFF800000118537
ffff800000113122: 48 be 2e 8e 11 00 00 80 ff ff	movabsq	$-140737487204818, %rsi # imm = 0xFFFF800000118E2E
ffff80000011312c: 48 85 c9             	testq	%rcx, %rcx
ffff80000011312f: 48 0f 45 f0          	cmovneq	%rax, %rsi
; 			cprintf(" %s",
ffff800000113133: 48 bf b9 87 11 00 00 80 ff ff	movabsq	$-140737487206471, %rdi # imm = 0xFFFF8000001187B9
ffff80000011313d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000113147: 31 c0                	xorl	%eax, %eax
ffff800000113149: ff d1                	callq	*%rcx
; 		cprintf("]\n");
ffff80000011314b: 48 bf bb 8d 11 00 00 80 ff ff	movabsq	$-140737487204933, %rdi # imm = 0xFFFF800000118DBB
ffff800000113155: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011315f: 31 c0                	xorl	%eax, %eax
ffff800000113161: ff d1                	callq	*%rcx
; 	info->flags = 0;
ffff800000113163: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113167: 48 c7 40 10 00 00 00 00      	movq	$0, 16(%rax)
; 	return 0;
ffff80000011316f: 31 c0                	xorl	%eax, %eax
ffff800000113171: 48 83 c4 30          	addq	$48, %rsp
ffff800000113175: 5d                   	popq	%rbp
ffff800000113176: c3                   	retq
ffff800000113177: cc                   	int3
ffff800000113178: cc                   	int3
ffff800000113179: cc                   	int3
ffff80000011317a: cc                   	int3
ffff80000011317b: cc                   	int3
ffff80000011317c: cc                   	int3
ffff80000011317d: cc                   	int3
ffff80000011317e: cc                   	int3
ffff80000011317f: cc                   	int3

ffff800000113180 <page_insert>:
; {
ffff800000113180: 55                   	pushq	%rbp
ffff800000113181: 48 89 e5             	movq	%rsp, %rbp
ffff800000113184: 48 81 ec 90 00 00 00 	subq	$144, %rsp
ffff80000011318b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011318f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113193: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113197: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	if((flags & PAGE_PRESENT) == 0){
ffff80000011319b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011319f: 48 83 e0 01          	andq	$1, %rax
ffff8000001131a3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001131a7: 0f 85 27 00 00 00    	jne	0xffff8000001131d4 <page_insert+0x54>
; 		panic("page_insert called with present bit 0");
ffff8000001131ad: 48 bf af 8a 11 00 00 80 ff ff	movabsq	$-140737487205713, %rdi # imm = 0xFFFF800000118AAF
ffff8000001131b7: 48 ba 61 8d 11 00 00 80 ff ff	movabsq	$-140737487205023, %rdx # imm = 0xFFFF800000118D61
ffff8000001131c1: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001131cb: 31 c0                	xorl	%eax, %eax
ffff8000001131cd: be 59 00 00 00       	movl	$89, %esi
ffff8000001131d2: ff d1                	callq	*%rcx
; 	if(!page_aligned((uintptr_t)va)){
ffff8000001131d4: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001131d8: 48 b8 10 33 11 00 00 80 ff ff	movabsq	$-140737487228144, %rax # imm = 0xFFFF800000113310
ffff8000001131e2: ff d0                	callq	*%rax
ffff8000001131e4: 83 f8 00             	cmpl	$0, %eax
ffff8000001131e7: 0f 85 27 00 00 00    	jne	0xffff800000113214 <page_insert+0x94>
; 		panic("page_insert called with non-aligned virtual address");
ffff8000001131ed: 48 bf af 8a 11 00 00 80 ff ff	movabsq	$-140737487205713, %rdi # imm = 0xFFFF800000118AAF
ffff8000001131f7: 48 ba 87 8d 11 00 00 80 ff ff	movabsq	$-140737487204985, %rdx # imm = 0xFFFF800000118D87
ffff800000113201: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011320b: 31 c0                	xorl	%eax, %eax
ffff80000011320d: be 5c 00 00 00       	movl	$92, %esi
ffff800000113212: ff d1                	callq	*%rcx
; 	if((flags & PAGE_HUGE) && !hpage_aligned((uintptr_t)va)){
ffff800000113214: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113218: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011321e: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113222: 0f 84 40 00 00 00    	je	0xffff800000113268 <page_insert+0xe8>
ffff800000113228: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000011322c: 48 b8 40 33 11 00 00 80 ff ff	movabsq	$-140737487228096, %rax # imm = 0xFFFF800000113340
ffff800000113236: ff d0                	callq	*%rax
ffff800000113238: 83 f8 00             	cmpl	$0, %eax
ffff80000011323b: 0f 85 27 00 00 00    	jne	0xffff800000113268 <page_insert+0xe8>
; 		panic("page_insert called with huge page non-aligned virtual address");
ffff800000113241: 48 bf af 8a 11 00 00 80 ff ff	movabsq	$-140737487205713, %rdi # imm = 0xFFFF800000118AAF
ffff80000011324b: 48 ba f3 90 11 00 00 80 ff ff	movabsq	$-140737487204109, %rdx # imm = 0xFFFF8000001190F3
ffff800000113255: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011325f: 31 c0                	xorl	%eax, %eax
ffff800000113261: be 5f 00 00 00       	movl	$95, %esi
ffff800000113266: ff d1                	callq	*%rcx
; 	struct insert_info info = {pml4, page, flags};
ffff800000113268: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011326c: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000113270: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113274: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000113278: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011327c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	struct page_walker walker = {
ffff800000113280: 48 b8 70 33 11 00 00 80 ff ff	movabsq	$-140737487228048, %rax # imm = 0xFFFF800000113370
ffff80000011328a: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000113291: 48 b8 50 34 11 00 00 80 ff ff	movabsq	$-140737487227824, %rax # imm = 0xFFFF800000113450
ffff80000011329b: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff80000011329f: 48 b8 60 3d 11 00 00 80 ff ff	movabsq	$-140737487225504, %rax # imm = 0xFFFF800000113D60
ffff8000001132a9: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff8000001132ad: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff8000001132b1: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff8000001132b9: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff8000001132c1: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff8000001132c9: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001132d1: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
; 		.udata = &info,
ffff8000001132d9: 48 8d 45 c8          	leaq	-56(%rbp), %rax
; 	struct page_walker walker = {
ffff8000001132dd: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	return walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001132e1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001132e5: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff8000001132e9: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff8000001132ed: 48 81 c2 00 10 00 00 	addq	$4096, %rdx             # imm = 0x1000
ffff8000001132f4: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff8000001132fe: 48 8d 8d 78 ff ff ff 	leaq	-136(%rbp), %rcx
ffff800000113305: ff d0                	callq	*%rax
ffff800000113307: 48 81 c4 90 00 00 00 	addq	$144, %rsp
ffff80000011330e: 5d                   	popq	%rbp
ffff80000011330f: c3                   	retq

ffff800000113310 <page_aligned>:
; {
ffff800000113310: 55                   	pushq	%rbp
ffff800000113311: 48 89 e5             	movq	%rsp, %rbp
ffff800000113314: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (PAGE_SIZE - 1));
ffff800000113318: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011331c: 48 25 ff 0f 00 00    	andq	$4095, %rax             # imm = 0xFFF
ffff800000113322: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113326: 0f 95 c0             	setne	%al
ffff800000113329: 34 ff                	xorb	$-1, %al
ffff80000011332b: 24 01                	andb	$1, %al
ffff80000011332d: 0f b6 c0             	movzbl	%al, %eax
ffff800000113330: 5d                   	popq	%rbp
ffff800000113331: c3                   	retq
ffff800000113332: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011333c: 0f 1f 40 00          	nopl	(%rax)

ffff800000113340 <hpage_aligned>:
; {
ffff800000113340: 55                   	pushq	%rbp
ffff800000113341: 48 89 e5             	movq	%rsp, %rbp
ffff800000113344: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (HPAGE_SIZE - 1));
ffff800000113348: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011334c: 48 25 ff ff 1f 00    	andq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000113352: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113356: 0f 95 c0             	setne	%al
ffff800000113359: 34 ff                	xorb	$-1, %al
ffff80000011335b: 24 01                	andb	$1, %al
ffff80000011335d: 0f b6 c0             	movzbl	%al, %eax
ffff800000113360: 5d                   	popq	%rbp
ffff800000113361: c3                   	retq
ffff800000113362: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011336c: 0f 1f 40 00          	nopl	(%rax)

ffff800000113370 <insert_pte>:
; {
ffff800000113370: 55                   	pushq	%rbp
ffff800000113371: 48 89 e5             	movq	%rsp, %rbp
ffff800000113374: 48 83 ec 40          	subq	$64, %rsp
ffff800000113378: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011337c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113380: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113384: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct insert_info *info = walker->udata;
ffff800000113388: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011338c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113390: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT){
ffff800000113394: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113398: 48 8b 00             	movq	(%rax), %rax
ffff80000011339b: 48 83 e0 01          	andq	$1, %rax
ffff80000011339f: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001133a3: 0f 84 5f 00 00 00    	je	0xffff800000113408 <insert_pte+0x98>
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff8000001133a9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001133ad: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff8000001133b7: 48 23 38             	andq	(%rax), %rdi
ffff8000001133ba: 48 b8 a0 35 11 00 00 80 ff ff	movabsq	$-140737487227488, %rax # imm = 0xFFFF8000001135A0
ffff8000001133c4: ff d0                	callq	*%rax
ffff8000001133c6: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page_decref(page);
ffff8000001133ca: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff8000001133ce: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff8000001133d8: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff8000001133da: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001133de: 48 8b 00             	movq	(%rax), %rax
ffff8000001133e1: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001133e5: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff8000001133e9: 48 b8 20 36 11 00 00 80 ff ff	movabsq	$-140737487227360, %rax # imm = 0xFFFF800000113620
ffff8000001133f3: ff d0                	callq	*%rax
ffff8000001133f5: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff8000001133f9: 48 89 c6             	movq	%rax, %rsi
ffff8000001133fc: 48 b8 b0 47 11 00 00 80 ff ff	movabsq	$-140737487222864, %rax # imm = 0xFFFF8000001147B0
ffff800000113406: ff d0                	callq	*%rax
; 	info->page->pp_ref++;
ffff800000113408: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011340c: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000113410: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113414: 66 83 c1 01          	addw	$1, %cx
ffff800000113418: 66 89 48 10          	movw	%cx, 16(%rax)
; 	*entry = page2pa(info->page) | info->flags;
ffff80000011341c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113420: 48 8b 78 08          	movq	8(%rax), %rdi
ffff800000113424: 48 b8 60 36 11 00 00 80 ff ff	movabsq	$-140737487227296, %rax # imm = 0xFFFF800000113660
ffff80000011342e: ff d0                	callq	*%rax
ffff800000113430: 48 89 c1             	movq	%rax, %rcx
ffff800000113433: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113437: 48 0b 48 10          	orq	16(%rax), %rcx
ffff80000011343b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011343f: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000113442: 31 c0                	xorl	%eax, %eax
ffff800000113444: 48 83 c4 40          	addq	$64, %rsp
ffff800000113448: 5d                   	popq	%rbp
ffff800000113449: c3                   	retq
ffff80000011344a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000113450 <insert_pde>:
; {
ffff800000113450: 55                   	pushq	%rbp
ffff800000113451: 48 89 e5             	movq	%rsp, %rbp
ffff800000113454: 48 83 ec 50          	subq	$80, %rsp
ffff800000113458: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011345c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113460: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113464: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct insert_info *info = walker->udata;
ffff800000113468: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011346c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113470: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(*entry & PAGE_HUGE){
ffff800000113474: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113478: 48 8b 00             	movq	(%rax), %rax
ffff80000011347b: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000113481: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113485: 0f 84 5f 00 00 00    	je	0xffff8000001134ea <insert_pde+0x9a>
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff80000011348b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011348f: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113499: 48 23 38             	andq	(%rax), %rdi
ffff80000011349c: 48 b8 a0 35 11 00 00 80 ff ff	movabsq	$-140737487227488, %rax # imm = 0xFFFF8000001135A0
ffff8000001134a6: ff d0                	callq	*%rax
ffff8000001134a8: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		page_decref(page);
ffff8000001134ac: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff8000001134b0: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff8000001134ba: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff8000001134bc: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001134c0: 48 8b 00             	movq	(%rax), %rax
ffff8000001134c3: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff8000001134c7: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff8000001134cb: 48 b8 20 36 11 00 00 80 ff ff	movabsq	$-140737487227360, %rax # imm = 0xFFFF800000113620
ffff8000001134d5: ff d0                	callq	*%rax
ffff8000001134d7: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff8000001134db: 48 89 c6             	movq	%rax, %rsi
ffff8000001134de: 48 b8 b0 47 11 00 00 80 ff ff	movabsq	$-140737487222864, %rax # imm = 0xFFFF8000001147B0
ffff8000001134e8: ff d0                	callq	*%rax
; 	if((info->flags & PAGE_HUGE) == 0){
ffff8000001134ea: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001134ee: 48 8b 40 10          	movq	16(%rax), %rax
ffff8000001134f2: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001134f8: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001134fc: 0f 85 4a 00 00 00    	jne	0xffff80000011354c <insert_pde+0xfc>
; 		int ok = ptbl_alloc(entry, base, end, walker);
ffff800000113502: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113506: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff80000011350a: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000011350e: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113512: 48 b8 60 3d 11 00 00 80 ff ff	movabsq	$-140737487225504, %rax # imm = 0xFFFF800000113D60
ffff80000011351c: ff d0                	callq	*%rax
ffff80000011351e: 89 45 bc             	movl	%eax, -68(%rbp)
; 		*entry = PAGE_ADDR(*entry) | info->flags;
ffff800000113521: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113525: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000011352f: 48 23 08             	andq	(%rax), %rcx
ffff800000113532: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113536: 48 0b 48 10          	orq	16(%rax), %rcx
ffff80000011353a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011353e: 48 89 08             	movq	%rcx, (%rax)
; 		return ok;
ffff800000113541: 8b 45 bc             	movl	-68(%rbp), %eax
ffff800000113544: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000113547: e9 41 00 00 00       	jmp	0xffff80000011358d <insert_pde+0x13d>
; 	info->page->pp_ref++;
ffff80000011354c: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113550: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000113554: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113558: 66 83 c1 01          	addw	$1, %cx
ffff80000011355c: 66 89 48 10          	movw	%cx, 16(%rax)
; 	*entry = page2pa(info->page) | info->flags;
ffff800000113560: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113564: 48 8b 78 08          	movq	8(%rax), %rdi
ffff800000113568: 48 b8 60 36 11 00 00 80 ff ff	movabsq	$-140737487227296, %rax # imm = 0xFFFF800000113660
ffff800000113572: ff d0                	callq	*%rax
ffff800000113574: 48 89 c1             	movq	%rax, %rcx
ffff800000113577: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011357b: 48 0b 48 10          	orq	16(%rax), %rcx
ffff80000011357f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113583: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000113586: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000011358d: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000113590: 48 83 c4 50          	addq	$80, %rsp
ffff800000113594: 5d                   	popq	%rbp
ffff800000113595: c3                   	retq
ffff800000113596: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001135a0 <pa2page>:
; {
ffff8000001135a0: 55                   	pushq	%rbp
ffff8000001135a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001135a4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001135a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001135ac: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001135b0: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001135b4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001135be: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001135c1: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001135c4: 0f 82 27 00 00 00    	jb	0xffff8000001135f1 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff8000001135ca: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff8000001135d4: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff8000001135de: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001135e8: 31 c0                	xorl	%eax, %eax
ffff8000001135ea: be 49 00 00 00       	movl	$73, %esi
ffff8000001135ef: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff8000001135f1: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff8000001135fb: 48 8b 00             	movq	(%rax), %rax
ffff8000001135fe: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113602: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000113606: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011360a: 48 01 c8             	addq	%rcx, %rax
ffff80000011360d: 48 83 c4 10          	addq	$16, %rsp
ffff800000113611: 5d                   	popq	%rbp
ffff800000113612: c3                   	retq
ffff800000113613: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011361d: 0f 1f 00             	nopl	(%rax)

ffff800000113620 <page2kva>:
; {
ffff800000113620: 55                   	pushq	%rbp
ffff800000113621: 48 89 e5             	movq	%rsp, %rbp
ffff800000113624: 48 83 ec 10          	subq	$16, %rsp
ffff800000113628: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000011362c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113630: 48 b8 60 36 11 00 00 80 ff ff	movabsq	$-140737487227296, %rax # imm = 0xFFFF800000113660
ffff80000011363a: ff d0                	callq	*%rax
ffff80000011363c: 48 89 c2             	movq	%rax, %rdx
ffff80000011363f: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000113649: 48 b8 90 36 11 00 00 80 ff ff	movabsq	$-140737487227248, %rax # imm = 0xFFFF800000113690
ffff800000113653: be 50 00 00 00       	movl	$80, %esi
ffff800000113658: ff d0                	callq	*%rax
ffff80000011365a: 48 83 c4 10          	addq	$16, %rsp
ffff80000011365e: 5d                   	popq	%rbp
ffff80000011365f: c3                   	retq

ffff800000113660 <page2pa>:
; {
ffff800000113660: 55                   	pushq	%rbp
ffff800000113661: 48 89 e5             	movq	%rsp, %rbp
ffff800000113664: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000113668: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011366c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff800000113676: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113679: 48 29 c8             	subq	%rcx, %rax
ffff80000011367c: 48 c1 f8 05          	sarq	$5, %rax
ffff800000113680: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000113684: 5d                   	popq	%rbp
ffff800000113685: c3                   	retq
ffff800000113686: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113690 <_kaddr>:
; {
ffff800000113690: 55                   	pushq	%rbp
ffff800000113691: 48 89 e5             	movq	%rsp, %rbp
ffff800000113694: 48 83 ec 20          	subq	$32, %rsp
ffff800000113698: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011369c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011369f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001136a3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001136a7: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001136ab: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001136b5: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001136b8: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001136bb: 0f 82 24 00 00 00    	jb	0xffff8000001136e5 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff8000001136c1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001136c5: 8b 75 f4             	movl	-12(%rbp), %esi
ffff8000001136c8: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001136cc: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff8000001136d6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001136e0: 31 c0                	xorl	%eax, %eax
ffff8000001136e2: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff8000001136e5: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001136ef: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff8000001136f3: 48 83 c4 20          	addq	$32, %rsp
ffff8000001136f7: 5d                   	popq	%rbp
ffff8000001136f8: c3                   	retq
ffff8000001136f9: cc                   	int3
ffff8000001136fa: cc                   	int3
ffff8000001136fb: cc                   	int3
ffff8000001136fc: cc                   	int3
ffff8000001136fd: cc                   	int3
ffff8000001136fe: cc                   	int3
ffff8000001136ff: cc                   	int3

ffff800000113700 <page_lookup>:
; {
ffff800000113700: 55                   	pushq	%rbp
ffff800000113701: 48 89 e5             	movq	%rsp, %rbp
ffff800000113704: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff80000011370b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011370f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113713: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	struct lookup_info info = {
ffff800000113717: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	struct page_walker walker = {
ffff80000011371f: 48 b8 10 38 11 00 00 80 ff ff	movabsq	$-140737487226864, %rax # imm = 0xFFFF800000113810
ffff800000113729: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff80000011372d: 48 b8 60 38 11 00 00 80 ff ff	movabsq	$-140737487226784, %rax # imm = 0xFFFF800000113860
ffff800000113737: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff80000011373b: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000113743: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff80000011374b: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000113753: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff80000011375b: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000113763: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000011376b: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.udata = &info,
ffff800000113773: 48 8d 45 d8          	leaq	-40(%rbp), %rax
; 	struct page_walker walker = {
ffff800000113777: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff80000011377b: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000011377f: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113783: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113787: 48 81 c2 00 10 00 00 	addq	$4096, %rdx             # imm = 0x1000
ffff80000011378e: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff800000113798: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
ffff80000011379c: ff d0                	callq	*%rax
; 			    &walker) < 0)
ffff80000011379e: 83 f8 00             	cmpl	$0, %eax
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001137a1: 0f 8d 0d 00 00 00    	jge	0xffff8000001137b4 <page_lookup+0xb4>
; 		return NULL;
ffff8000001137a7: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff8000001137af: e9 4f 00 00 00       	jmp	0xffff800000113803 <page_lookup+0x103>
; 	if(info.entry == NULL) return NULL;
ffff8000001137b4: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff8000001137b9: 0f 85 0d 00 00 00    	jne	0xffff8000001137cc <page_lookup+0xcc>
ffff8000001137bf: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff8000001137c7: e9 37 00 00 00       	jmp	0xffff800000113803 <page_lookup+0x103>
; 	if(entry_store != NULL) *entry_store = info.entry;
ffff8000001137cc: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff8000001137d1: 0f 84 0b 00 00 00    	je	0xffff8000001137e2 <page_lookup+0xe2>
ffff8000001137d7: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001137db: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001137df: 48 89 08             	movq	%rcx, (%rax)
; 	return pa2page(PAGE_ADDR(*info.entry));
ffff8000001137e2: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001137e6: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff8000001137f0: 48 23 38             	andq	(%rax), %rdi
ffff8000001137f3: 48 b8 b0 38 11 00 00 80 ff ff	movabsq	$-140737487226704, %rax # imm = 0xFFFF8000001138B0
ffff8000001137fd: ff d0                	callq	*%rax
ffff8000001137ff: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000113803: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113807: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000011380e: 5d                   	popq	%rbp
ffff80000011380f: c3                   	retq

ffff800000113810 <lookup_pte>:
; {
ffff800000113810: 55                   	pushq	%rbp
ffff800000113811: 48 89 e5             	movq	%rsp, %rbp
ffff800000113814: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113818: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011381c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113820: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct lookup_info *info = walker->udata;
ffff800000113824: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113828: 48 8b 40 48          	movq	72(%rax), %rax
ffff80000011382c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT){
ffff800000113830: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113834: 48 8b 00             	movq	(%rax), %rax
ffff800000113837: 48 83 e0 01          	andq	$1, %rax
ffff80000011383b: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011383f: 0f 84 0b 00 00 00    	je	0xffff800000113850 <lookup_pte+0x40>
; 		info->entry = entry;
ffff800000113845: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113849: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011384d: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000113850: 31 c0                	xorl	%eax, %eax
ffff800000113852: 5d                   	popq	%rbp
ffff800000113853: c3                   	retq
ffff800000113854: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011385e: 66 90                	nop

ffff800000113860 <lookup_pde>:
; {
ffff800000113860: 55                   	pushq	%rbp
ffff800000113861: 48 89 e5             	movq	%rsp, %rbp
ffff800000113864: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113868: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011386c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113870: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct lookup_info *info = walker->udata;
ffff800000113874: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113878: 48 8b 40 48          	movq	72(%rax), %rax
ffff80000011387c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & (PAGE_HUGE | PAGE_PRESENT)){
ffff800000113880: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113884: 48 8b 00             	movq	(%rax), %rax
ffff800000113887: 48 25 81 00 00 00    	andq	$129, %rax
ffff80000011388d: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113891: 0f 84 0b 00 00 00    	je	0xffff8000001138a2 <lookup_pde+0x42>
; 		info->entry = entry;
ffff800000113897: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000011389b: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011389f: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001138a2: 31 c0                	xorl	%eax, %eax
ffff8000001138a4: 5d                   	popq	%rbp
ffff8000001138a5: c3                   	retq
ffff8000001138a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001138b0 <pa2page>:
; {
ffff8000001138b0: 55                   	pushq	%rbp
ffff8000001138b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001138b4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001138b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001138bc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001138c0: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001138c4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001138ce: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001138d1: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001138d4: 0f 82 27 00 00 00    	jb	0xffff800000113901 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff8000001138da: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff8000001138e4: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff8000001138ee: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001138f8: 31 c0                	xorl	%eax, %eax
ffff8000001138fa: be 49 00 00 00       	movl	$73, %esi
ffff8000001138ff: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000113901: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011390b: 48 8b 00             	movq	(%rax), %rax
ffff80000011390e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113912: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000113916: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011391a: 48 01 c8             	addq	%rcx, %rax
ffff80000011391d: 48 83 c4 10          	addq	$16, %rsp
ffff800000113921: 5d                   	popq	%rbp
ffff800000113922: c3                   	retq
ffff800000113923: cc                   	int3
ffff800000113924: cc                   	int3
ffff800000113925: cc                   	int3
ffff800000113926: cc                   	int3
ffff800000113927: cc                   	int3
ffff800000113928: cc                   	int3
ffff800000113929: cc                   	int3
ffff80000011392a: cc                   	int3
ffff80000011392b: cc                   	int3
ffff80000011392c: cc                   	int3
ffff80000011392d: cc                   	int3
ffff80000011392e: cc                   	int3
ffff80000011392f: cc                   	int3

ffff800000113930 <boot_map_region>:
; {
ffff800000113930: 55                   	pushq	%rbp
ffff800000113931: 48 89 e5             	movq	%rsp, %rbp
ffff800000113934: 48 81 ec e0 00 00 00 	subq	$224, %rsp
ffff80000011393b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011393f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113943: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113947: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff80000011394b: 4c 89 45 d8          	movq	%r8, -40(%rbp)
; 	struct boot_map_info info = {
ffff80000011394f: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
; 		.flags = flags,
ffff800000113957: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 	struct boot_map_info info = {
ffff80000011395b: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		.pa = pa,
ffff80000011395f: 48 8b 45 e0          	movq	-32(%rbp), %rax
; 	struct boot_map_info info = {
ffff800000113963: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff800000113967: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011396b: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011396f: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff800000113973: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff800000113979: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff80000011397d: 48 8b 45 a0          	movq	-96(%rbp), %rax
; 	struct boot_map_info info = {
ffff800000113981: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff800000113985: 48 c7 45 98 00 10 00 00      	movq	$4096, -104(%rbp) # imm = 0x1000
ffff80000011398d: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113991: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113995: 48 01 c1             	addq	%rax, %rcx
ffff800000113998: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff80000011399c: 48 8d 44 08 ff       	leaq	-1(%rax,%rcx), %rax
ffff8000001139a1: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff8000001139a5: 48 8b 45 88          	movq	-120(%rbp), %rax
ffff8000001139a9: 48 89 85 28 ff ff ff 	movq	%rax, -216(%rbp)
ffff8000001139b0: 48 8b 4d 98          	movq	-104(%rbp), %rcx
ffff8000001139b4: 31 d2                	xorl	%edx, %edx
ffff8000001139b6: 48 f7 f1             	divq	%rcx
ffff8000001139b9: 48 8b 85 28 ff ff ff 	movq	-216(%rbp), %rax
ffff8000001139c0: 48 29 d0             	subq	%rdx, %rax
ffff8000001139c3: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff8000001139c7: 48 8b 45 80          	movq	-128(%rbp), %rax
ffff8000001139cb: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff8000001139cf: 48 8b 45 90          	movq	-112(%rbp), %rax
ffff8000001139d3: 48 83 c0 ff          	addq	$-1, %rax
; 	struct boot_map_info info = {
ffff8000001139d7: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	struct page_walker walker = {
ffff8000001139db: 48 b8 90 3a 11 00 00 80 ff ff	movabsq	$-140737487226224, %rax # imm = 0xFFFF800000113A90
ffff8000001139e5: 48 89 85 30 ff ff ff 	movq	%rax, -208(%rbp)
ffff8000001139ec: 48 b8 00 3b 11 00 00 80 ff ff	movabsq	$-140737487226112, %rax # imm = 0xFFFF800000113B00
ffff8000001139f6: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff8000001139fd: 48 b8 60 3d 11 00 00 80 ff ff	movabsq	$-140737487225504, %rax # imm = 0xFFFF800000113D60
ffff800000113a07: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000113a0e: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
ffff800000113a15: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff800000113a20: 48 c7 85 58 ff ff ff 00 00 00 00     	movq	$0, -168(%rbp)
ffff800000113a2b: 48 c7 85 60 ff ff ff 00 00 00 00     	movq	$0, -160(%rbp)
ffff800000113a36: 48 c7 85 68 ff ff ff 00 00 00 00     	movq	$0, -152(%rbp)
ffff800000113a41: 48 c7 85 70 ff ff ff 00 00 00 00     	movq	$0, -144(%rbp)
; 		.udata = &info,
ffff800000113a4c: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	struct page_walker walker = {
ffff800000113a50: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff800000113a57: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113a5b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113a5f: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000113a63: 48 03 55 e8          	addq	-24(%rbp), %rdx
ffff800000113a67: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff800000113a71: 48 8d 8d 30 ff ff ff 	leaq	-208(%rbp), %rcx
ffff800000113a78: ff d0                	callq	*%rax
; }
ffff800000113a7a: 48 81 c4 e0 00 00 00 	addq	$224, %rsp
ffff800000113a81: 5d                   	popq	%rbp
ffff800000113a82: c3                   	retq
ffff800000113a83: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000113a8d: 0f 1f 00             	nopl	(%rax)

ffff800000113a90 <boot_map_pte>:
; {
ffff800000113a90: 55                   	pushq	%rbp
ffff800000113a91: 48 89 e5             	movq	%rsp, %rbp
ffff800000113a94: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113a98: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113a9c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113aa0: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff800000113aa4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113aa8: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113aac: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	*entry = info->pa | info->flags;
ffff800000113ab0: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113ab4: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113ab8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113abc: 48 0b 48 08          	orq	8(%rax), %rcx
ffff800000113ac0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113ac4: 48 89 08             	movq	%rcx, (%rax)
; 	info->pa += PAGE_SIZE;
ffff800000113ac7: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113acb: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113acf: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff800000113ad6: 48 89 48 10          	movq	%rcx, 16(%rax)
; 	info->base += PAGE_SIZE;
ffff800000113ada: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113ade: 48 8b 48 18          	movq	24(%rax), %rcx
ffff800000113ae2: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff800000113ae9: 48 89 48 18          	movq	%rcx, 24(%rax)
; 	return 0;
ffff800000113aed: 31 c0                	xorl	%eax, %eax
ffff800000113aef: 5d                   	popq	%rbp
ffff800000113af0: c3                   	retq
ffff800000113af1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000113afb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000113b00 <boot_map_pde>:
; {
ffff800000113b00: 55                   	pushq	%rbp
ffff800000113b01: 48 89 e5             	movq	%rsp, %rbp
ffff800000113b04: 48 83 ec 40          	subq	$64, %rsp
ffff800000113b08: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000113b0c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113b10: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113b14: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff800000113b18: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113b1c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113b20: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(hpage_aligned((uintptr_t)info->pa) && (info->end - info->base) + 1 >= HPAGE_SIZE){ //check for last 2mb page if  the second condition in and works
ffff800000113b24: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b28: 48 8b 78 10          	movq	16(%rax), %rdi
ffff800000113b2c: 48 b8 30 3d 11 00 00 80 ff ff	movabsq	$-140737487225552, %rax # imm = 0xFFFF800000113D30
ffff800000113b36: ff d0                	callq	*%rax
ffff800000113b38: 83 f8 00             	cmpl	$0, %eax
ffff800000113b3b: 0f 84 70 00 00 00    	je	0xffff800000113bb1 <boot_map_pde+0xb1>
ffff800000113b41: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b45: 48 8b 40 20          	movq	32(%rax), %rax
ffff800000113b49: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000113b4d: 48 2b 41 18          	subq	24(%rcx), %rax
ffff800000113b51: 48 83 c0 01          	addq	$1, %rax
ffff800000113b55: 48 3d 00 00 20 00    	cmpq	$2097152, %rax          # imm = 0x200000
ffff800000113b5b: 0f 82 50 00 00 00    	jb	0xffff800000113bb1 <boot_map_pde+0xb1>
; 		*entry = info->pa | info->flags | PAGE_HUGE;
ffff800000113b61: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b65: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113b69: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b6d: 48 0b 48 08          	orq	8(%rax), %rcx
ffff800000113b71: 48 81 c9 80 00 00 00 	orq	$128, %rcx
ffff800000113b78: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113b7c: 48 89 08             	movq	%rcx, (%rax)
; 		info->pa += HPAGE_SIZE;
ffff800000113b7f: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b83: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113b87: 48 81 c1 00 00 20 00 	addq	$2097152, %rcx          # imm = 0x200000
ffff800000113b8e: 48 89 48 10          	movq	%rcx, 16(%rax)
; 		info->base += HPAGE_SIZE;
ffff800000113b92: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113b96: 48 8b 48 18          	movq	24(%rax), %rcx
ffff800000113b9a: 48 81 c1 00 00 20 00 	addq	$2097152, %rcx          # imm = 0x200000
ffff800000113ba1: 48 89 48 18          	movq	%rcx, 24(%rax)
; 		return 0;
ffff800000113ba5: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000113bac: e9 65 00 00 00       	jmp	0xffff800000113c16 <boot_map_pde+0x116>
; 	int res = 0;
ffff800000113bb1: c7 45 cc 00 00 00 00 	movl	$0, -52(%rbp)
; 	if(*entry & PAGE_PRESENT) res = ptbl_split(entry, base, end, walker);
ffff800000113bb8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113bbc: 48 8b 00             	movq	(%rax), %rax
ffff800000113bbf: 48 83 e0 01          	andq	$1, %rax
ffff800000113bc3: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113bc7: 0f 84 24 00 00 00    	je	0xffff800000113bf1 <boot_map_pde+0xf1>
ffff800000113bcd: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113bd1: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113bd5: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000113bd9: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113bdd: 48 b8 40 3e 11 00 00 80 ff ff	movabsq	$-140737487225280, %rax # imm = 0xFFFF800000113E40
ffff800000113be7: ff d0                	callq	*%rax
ffff800000113be9: 89 45 cc             	movl	%eax, -52(%rbp)
ffff800000113bec: e9 1f 00 00 00       	jmp	0xffff800000113c10 <boot_map_pde+0x110>
; 	else res = ptbl_alloc(entry, base, end, walker);
ffff800000113bf1: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113bf5: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113bf9: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000113bfd: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113c01: 48 b8 60 3d 11 00 00 80 ff ff	movabsq	$-140737487225504, %rax # imm = 0xFFFF800000113D60
ffff800000113c0b: ff d0                	callq	*%rax
ffff800000113c0d: 89 45 cc             	movl	%eax, -52(%rbp)
; 	return res;
ffff800000113c10: 8b 45 cc             	movl	-52(%rbp), %eax
ffff800000113c13: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff800000113c16: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000113c19: 48 83 c4 40          	addq	$64, %rsp
ffff800000113c1d: 5d                   	popq	%rbp
ffff800000113c1e: c3                   	retq
ffff800000113c1f: 90                   	nop

ffff800000113c20 <boot_map_kernel>:
; {
ffff800000113c20: 55                   	pushq	%rbp
ffff800000113c21: 48 89 e5             	movq	%rsp, %rbp
ffff800000113c24: 48 83 ec 30          	subq	$48, %rsp
ffff800000113c28: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113c2c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	    (struct elf_proghdr *)((char *)elf_hdr + elf_hdr->e_phoff);
ffff800000113c30: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113c34: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113c38: 48 03 41 20          	addq	32(%rcx), %rax
; 	struct elf_proghdr *prog_start =
ffff800000113c3c: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, 0, PAGE_KMASK | PAGE_USER);
ffff800000113c40: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113c44: 31 c0                	xorl	%eax, %eax
ffff800000113c46: 48 b8 30 39 11 00 00 80 ff ff	movabsq	$-140737487226576, %rax # imm = 0xFFFF800000113930
ffff800000113c50: 31 c9                	xorl	%ecx, %ecx
ffff800000113c52: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff800000113c5c: ba 00 00 80 00       	movl	$8388608, %edx          # imm = 0x800000
ffff800000113c61: 49 b8 07 00 00 00 00 00 00 80	movabsq	$-9223372036854775801, %r8 # imm = 0x8000000000000007
ffff800000113c6b: ff d0                	callq	*%rax
; 	uint64_t flags = 0;
ffff800000113c6d: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000113c75: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000113c7d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113c81: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113c85: 0f b7 49 38          	movzwl	56(%rcx), %ecx
ffff800000113c89: 48 39 c8             	cmpq	%rcx, %rax
ffff800000113c8c: 0f 83 96 00 00 00    	jae	0xffff800000113d28 <boot_map_kernel+0x108>
; 		prog_hdr = prog_start + i;
ffff800000113c92: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113c96: 48 6b 4d d0 38       	imulq	$56, -48(%rbp), %rcx
ffff800000113c9b: 48 01 c8             	addq	%rcx, %rax
ffff800000113c9e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if(prog_hdr->p_va < KERNEL_VMA) continue;
ffff800000113ca2: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113ca6: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff800000113cb0: 48 39 48 10          	cmpq	%rcx, 16(%rax)
ffff800000113cb4: 0f 83 05 00 00 00    	jae	0xffff800000113cbf <boot_map_kernel+0x9f>
ffff800000113cba: e9 58 00 00 00       	jmp	0xffff800000113d17 <boot_map_kernel+0xf7>
; 		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
ffff800000113cbf: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113cc3: 8b 40 04             	movl	4(%rax), %eax
ffff800000113cc6: 83 e0 02             	andl	$2, %eax
ffff800000113cc9: 83 f8 00             	cmpl	$0, %eax
ffff800000113ccc: 0f 84 0c 00 00 00    	je	0xffff800000113cde <boot_map_kernel+0xbe>
ffff800000113cd2: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113cd6: 48 83 c8 02          	orq	$2, %rax
ffff800000113cda: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		if(!(prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)) flags |= PAGE_NO_EXEC; //CHECK AGAIN IF THIS IS THE CORRECT WAY TO CHECK THE FLAGS
ffff800000113cde: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113ce2: 8b 40 04             	movl	4(%rax), %eax
ffff800000113ce5: 83 e0 01             	andl	$1, %eax
ffff800000113ce8: 83 f8 00             	cmpl	$0, %eax
ffff800000113ceb: 0f 85 12 00 00 00    	jne	0xffff800000113d03 <boot_map_kernel+0xe3>
ffff800000113cf1: 48 b8 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
ffff800000113cfb: 48 0b 45 d8          	orq	-40(%rbp), %rax
ffff800000113cff: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		flags |= PF_PRESENT;
ffff800000113d03: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113d07: 48 83 c8 01          	orq	$1, %rax
ffff800000113d0b: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		flags = 0;
ffff800000113d0f: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000113d17: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113d1b: 48 83 c0 01          	addq	$1, %rax
ffff800000113d1f: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000113d23: e9 55 ff ff ff       	jmp	0xffff800000113c7d <boot_map_kernel+0x5d>
; }
ffff800000113d28: 48 83 c4 30          	addq	$48, %rsp
ffff800000113d2c: 5d                   	popq	%rbp
ffff800000113d2d: c3                   	retq
ffff800000113d2e: 66 90                	nop

ffff800000113d30 <hpage_aligned>:
; {
ffff800000113d30: 55                   	pushq	%rbp
ffff800000113d31: 48 89 e5             	movq	%rsp, %rbp
ffff800000113d34: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (HPAGE_SIZE - 1));
ffff800000113d38: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d3c: 48 25 ff ff 1f 00    	andq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000113d42: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113d46: 0f 95 c0             	setne	%al
ffff800000113d49: 34 ff                	xorb	$-1, %al
ffff800000113d4b: 24 01                	andb	$1, %al
ffff800000113d4d: 0f b6 c0             	movzbl	%al, %eax
ffff800000113d50: 5d                   	popq	%rbp
ffff800000113d51: c3                   	retq
ffff800000113d52: cc                   	int3
ffff800000113d53: cc                   	int3
ffff800000113d54: cc                   	int3
ffff800000113d55: cc                   	int3
ffff800000113d56: cc                   	int3
ffff800000113d57: cc                   	int3
ffff800000113d58: cc                   	int3
ffff800000113d59: cc                   	int3
ffff800000113d5a: cc                   	int3
ffff800000113d5b: cc                   	int3
ffff800000113d5c: cc                   	int3
ffff800000113d5d: cc                   	int3
ffff800000113d5e: cc                   	int3
ffff800000113d5f: cc                   	int3

ffff800000113d60 <ptbl_alloc>:
; {
ffff800000113d60: 55                   	pushq	%rbp
ffff800000113d61: 48 89 e5             	movq	%rsp, %rbp
ffff800000113d64: 48 83 ec 40          	subq	$64, %rsp
ffff800000113d68: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000113d6c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113d70: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113d74: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if(*entry & PAGE_PRESENT) return 0;
ffff800000113d78: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113d7c: 48 8b 00             	movq	(%rax), %rax
ffff800000113d7f: 48 83 e0 01          	andq	$1, %rax
ffff800000113d83: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113d87: 0f 84 0c 00 00 00    	je	0xffff800000113d99 <ptbl_alloc+0x39>
ffff800000113d8d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000113d94: e9 6e 00 00 00       	jmp	0xffff800000113e07 <ptbl_alloc+0xa7>
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff800000113d99: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113da3: bf 01 00 00 00       	movl	$1, %edi
ffff800000113da8: ff d0                	callq	*%rax
ffff800000113daa: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(new_table == NULL) return -1;
ffff800000113dae: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000113db3: 0f 85 0c 00 00 00    	jne	0xffff800000113dc5 <ptbl_alloc+0x65>
ffff800000113db9: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113dc0: e9 42 00 00 00       	jmp	0xffff800000113e07 <ptbl_alloc+0xa7>
; 	new_table->pp_ref++;
ffff800000113dc5: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113dc9: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113dcd: 66 83 c1 01          	addw	$1, %cx
ffff800000113dd1: 66 89 48 10          	movw	%cx, 16(%rax)
; 	physaddr_t table_addr = page2pa(new_table);
ffff800000113dd5: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113dd9: 48 b8 10 3e 11 00 00 80 ff ff	movabsq	$-140737487225328, %rax # imm = 0xFFFF800000113E10
ffff800000113de3: ff d0                	callq	*%rax
ffff800000113de5: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	*entry = table_addr | PAGE_PRESENT | PAGE_WRITE | PAGE_USER;
ffff800000113de9: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000113ded: 48 83 c9 01          	orq	$1, %rcx
ffff800000113df1: 48 83 c9 02          	orq	$2, %rcx
ffff800000113df5: 48 83 c9 04          	orq	$4, %rcx
ffff800000113df9: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113dfd: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000113e00: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000113e07: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000113e0a: 48 83 c4 40          	addq	$64, %rsp
ffff800000113e0e: 5d                   	popq	%rbp
ffff800000113e0f: c3                   	retq

ffff800000113e10 <page2pa>:
; {
ffff800000113e10: 55                   	pushq	%rbp
ffff800000113e11: 48 89 e5             	movq	%rsp, %rbp
ffff800000113e14: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000113e18: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113e1c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff800000113e26: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113e29: 48 29 c8             	subq	%rcx, %rax
ffff800000113e2c: 48 c1 f8 05          	sarq	$5, %rax
ffff800000113e30: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000113e34: 5d                   	popq	%rbp
ffff800000113e35: c3                   	retq
ffff800000113e36: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113e40 <ptbl_split>:
; {
ffff800000113e40: 55                   	pushq	%rbp
ffff800000113e41: 48 89 e5             	movq	%rsp, %rbp
ffff800000113e44: 48 83 ec 50          	subq	$80, %rsp
ffff800000113e48: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000113e4c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113e50: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113e54: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if((*entry & PAGE_PRESENT) == 0){
ffff800000113e58: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113e5c: 48 8b 00             	movq	(%rax), %rax
ffff800000113e5f: 48 83 e0 01          	andq	$1, %rax
ffff800000113e63: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113e67: 0f 85 24 00 00 00    	jne	0xffff800000113e91 <ptbl_split+0x51>
; 		return ptbl_alloc(entry, base, end, walker);
ffff800000113e6d: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113e71: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113e75: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000113e79: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113e7d: 48 b8 60 3d 11 00 00 80 ff ff	movabsq	$-140737487225504, %rax # imm = 0xFFFF800000113D60
ffff800000113e87: ff d0                	callq	*%rax
ffff800000113e89: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000113e8c: e9 c7 01 00 00       	jmp	0xffff800000114058 <ptbl_split+0x218>
; 	if((*entry & PAGE_HUGE) == 0){
ffff800000113e91: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113e95: 48 8b 00             	movq	(%rax), %rax
ffff800000113e98: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000113e9e: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113ea2: 0f 85 0c 00 00 00    	jne	0xffff800000113eb4 <ptbl_split+0x74>
; 		return -1;
ffff800000113ea8: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113eaf: e9 a4 01 00 00       	jmp	0xffff800000114058 <ptbl_split+0x218>
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff800000113eb4: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113ebe: bf 01 00 00 00       	movl	$1, %edi
ffff800000113ec3: ff d0                	callq	*%rax
ffff800000113ec5: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(new_table == NULL) return -1;
ffff800000113ec9: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000113ece: 0f 85 0c 00 00 00    	jne	0xffff800000113ee0 <ptbl_split+0xa0>
ffff800000113ed4: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113edb: e9 78 01 00 00       	jmp	0xffff800000114058 <ptbl_split+0x218>
; 	new_table->pp_ref++;
ffff800000113ee0: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113ee4: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113ee8: 66 83 c1 01          	addw	$1, %cx
ffff800000113eec: 66 89 48 10          	movw	%cx, 16(%rax)
; 	physaddr_t *new_table_entries = page2kva(new_table);
ffff800000113ef0: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113ef4: 48 b8 70 40 11 00 00 80 ff ff	movabsq	$-140737487224720, %rax # imm = 0xFFFF800000114070
ffff800000113efe: ff d0                	callq	*%rax
ffff800000113f00: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	void *old_data = KADDR(PAGE_ADDR(*entry));
ffff800000113f04: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113f08: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff800000113f12: 48 23 10             	andq	(%rax), %rdx
ffff800000113f15: 48 bf 3a 85 11 00 00 80 ff ff	movabsq	$-140737487207110, %rdi # imm = 0xFFFF80000011853A
ffff800000113f1f: 48 b8 b0 40 11 00 00 80 ff ff	movabsq	$-140737487224656, %rax # imm = 0xFFFF8000001140B0
ffff800000113f29: be 3b 00 00 00       	movl	$59, %esi
ffff800000113f2e: ff d0                	callq	*%rax
ffff800000113f30: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000113f34: c7 45 bc 00 00 00 00 	movl	$0, -68(%rbp)
ffff800000113f3b: 48 63 45 bc          	movslq	-68(%rbp), %rax
ffff800000113f3f: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff800000113f45: 0f 83 a6 00 00 00    	jae	0xffff800000113ff1 <ptbl_split+0x1b1>
; 		struct page_info *new_page = page_alloc(ALLOC_ZERO);
ffff800000113f4b: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113f55: bf 01 00 00 00       	movl	$1, %edi
ffff800000113f5a: ff d0                	callq	*%rax
ffff800000113f5c: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		if(new_page == NULL){
ffff800000113f60: 48 83 7d b0 00       	cmpq	$0, -80(%rbp)
ffff800000113f65: 0f 85 0c 00 00 00    	jne	0xffff800000113f77 <ptbl_split+0x137>
; 			return -1;
ffff800000113f6b: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113f72: e9 e1 00 00 00       	jmp	0xffff800000114058 <ptbl_split+0x218>
; 		new_table_entries[i] = page2pa(new_page) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff800000113f77: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000113f7b: 48 b8 10 3e 11 00 00 80 ff ff	movabsq	$-140737487225328, %rax # imm = 0xFFFF800000113E10
ffff800000113f85: ff d0                	callq	*%rax
ffff800000113f87: 48 89 c2             	movq	%rax, %rdx
ffff800000113f8a: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113f8e: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000113f98: 48 23 01             	andq	(%rcx), %rax
ffff800000113f9b: 48 25 7f ff ff ff    	andq	$-129, %rax
ffff800000113fa1: 48 09 c2             	orq	%rax, %rdx
ffff800000113fa4: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000113fa8: 48 63 4d bc          	movslq	-68(%rbp), %rcx
ffff800000113fac: 48 89 14 c8          	movq	%rdx, (%rax,%rcx,8)
; 		memcpy(page2kva(new_page), old_data + i * PAGE_SIZE, PAGE_SIZE);
ffff800000113fb0: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000113fb4: 48 b8 70 40 11 00 00 80 ff ff	movabsq	$-140737487224720, %rax # imm = 0xFFFF800000114070
ffff800000113fbe: ff d0                	callq	*%rax
ffff800000113fc0: 48 89 c7             	movq	%rax, %rdi
ffff800000113fc3: 48 8b 75 c0          	movq	-64(%rbp), %rsi
ffff800000113fc7: 8b 45 bc             	movl	-68(%rbp), %eax
ffff800000113fca: c1 e0 0c             	shll	$12, %eax
ffff800000113fcd: 48 98                	cltq
ffff800000113fcf: 48 01 c6             	addq	%rax, %rsi
ffff800000113fd2: 48 b8 f0 29 11 00 00 80 ff ff	movabsq	$-140737487230480, %rax # imm = 0xFFFF8000001129F0
ffff800000113fdc: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000113fe1: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000113fe3: 8b 45 bc             	movl	-68(%rbp), %eax
ffff800000113fe6: 83 c0 01             	addl	$1, %eax
ffff800000113fe9: 89 45 bc             	movl	%eax, -68(%rbp)
ffff800000113fec: e9 4a ff ff ff       	jmp	0xffff800000113f3b <ptbl_split+0xfb>
; 	page_decref(pa2page(PAGE_ADDR(*entry)));
ffff800000113ff1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113ff5: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113fff: 48 23 38             	andq	(%rax), %rdi
ffff800000114002: 48 b8 20 41 11 00 00 80 ff ff	movabsq	$-140737487224544, %rax # imm = 0xFFFF800000114120
ffff80000011400c: ff d0                	callq	*%rax
ffff80000011400e: 48 89 c7             	movq	%rax, %rdi
ffff800000114011: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000011401b: ff d0                	callq	*%rax
; 	*entry = page2pa(new_table) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff80000011401d: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000114021: 48 b8 10 3e 11 00 00 80 ff ff	movabsq	$-140737487225328, %rax # imm = 0xFFFF800000113E10
ffff80000011402b: ff d0                	callq	*%rax
ffff80000011402d: 48 89 c1             	movq	%rax, %rcx
ffff800000114030: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000114034: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011403e: 48 23 02             	andq	(%rdx), %rax
ffff800000114041: 48 25 7f ff ff ff    	andq	$-129, %rax
ffff800000114047: 48 09 c1             	orq	%rax, %rcx
ffff80000011404a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011404e: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000114051: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000114058: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011405b: 48 83 c4 50          	addq	$80, %rsp
ffff80000011405f: 5d                   	popq	%rbp
ffff800000114060: c3                   	retq
ffff800000114061: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011406b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000114070 <page2kva>:
; {
ffff800000114070: 55                   	pushq	%rbp
ffff800000114071: 48 89 e5             	movq	%rsp, %rbp
ffff800000114074: 48 83 ec 10          	subq	$16, %rsp
ffff800000114078: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000011407c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114080: 48 b8 10 3e 11 00 00 80 ff ff	movabsq	$-140737487225328, %rax # imm = 0xFFFF800000113E10
ffff80000011408a: ff d0                	callq	*%rax
ffff80000011408c: 48 89 c2             	movq	%rax, %rdx
ffff80000011408f: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000114099: 48 b8 b0 40 11 00 00 80 ff ff	movabsq	$-140737487224656, %rax # imm = 0xFFFF8000001140B0
ffff8000001140a3: be 50 00 00 00       	movl	$80, %esi
ffff8000001140a8: ff d0                	callq	*%rax
ffff8000001140aa: 48 83 c4 10          	addq	$16, %rsp
ffff8000001140ae: 5d                   	popq	%rbp
ffff8000001140af: c3                   	retq

ffff8000001140b0 <_kaddr>:
; {
ffff8000001140b0: 55                   	pushq	%rbp
ffff8000001140b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001140b4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001140b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001140bc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff8000001140bf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001140c3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001140c7: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001140cb: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001140d5: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001140d8: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001140db: 0f 82 24 00 00 00    	jb	0xffff800000114105 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff8000001140e1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001140e5: 8b 75 f4             	movl	-12(%rbp), %esi
ffff8000001140e8: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001140ec: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff8000001140f6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000114100: 31 c0                	xorl	%eax, %eax
ffff800000114102: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff800000114105: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000011410f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000114113: 48 83 c4 20          	addq	$32, %rsp
ffff800000114117: 5d                   	popq	%rbp
ffff800000114118: c3                   	retq
ffff800000114119: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000114120 <pa2page>:
; {
ffff800000114120: 55                   	pushq	%rbp
ffff800000114121: 48 89 e5             	movq	%rsp, %rbp
ffff800000114124: 48 83 ec 10          	subq	$16, %rsp
ffff800000114128: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011412c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114130: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114134: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011413e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000114141: 48 39 c8             	cmpq	%rcx, %rax
ffff800000114144: 0f 82 27 00 00 00    	jb	0xffff800000114171 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011414a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000114154: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000011415e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000114168: 31 c0                	xorl	%eax, %eax
ffff80000011416a: be 49 00 00 00       	movl	$73, %esi
ffff80000011416f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000114171: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011417b: 48 8b 00             	movq	(%rax), %rax
ffff80000011417e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000114182: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000114186: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011418a: 48 01 c8             	addq	%rcx, %rax
ffff80000011418d: 48 83 c4 10          	addq	$16, %rsp
ffff800000114191: 5d                   	popq	%rbp
ffff800000114192: c3                   	retq
ffff800000114193: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011419d: 0f 1f 00             	nopl	(%rax)

ffff8000001141a0 <ptbl_merge>:
; {
ffff8000001141a0: 55                   	pushq	%rbp
ffff8000001141a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001141a4: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff8000001141ab: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001141af: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001141b3: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001141b7: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if(*entry & PAGE_HUGE){
ffff8000001141bb: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001141bf: 48 8b 00             	movq	(%rax), %rax
ffff8000001141c2: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001141c8: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001141cc: 0f 84 0c 00 00 00    	je	0xffff8000001141de <ptbl_merge+0x3e>
; 		return 0;
ffff8000001141d2: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001141d9: e9 c3 01 00 00       	jmp	0xffff8000001143a1 <ptbl_merge+0x201>
; 	physaddr_t table = PAGE_ADDR(*entry);
ffff8000001141de: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001141e2: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001141ec: 48 23 01             	andq	(%rcx), %rax
ffff8000001141ef: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	physaddr_t flags = *entry & PAGE_MASK;
ffff8000001141f3: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001141f7: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000114201: 48 23 01             	andq	(%rcx), %rax
ffff800000114204: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if((flags ^ PAGE_PRESENT) == 0) return 0;
ffff800000114208: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000011420c: 48 83 f0 01          	xorq	$1, %rax
ffff800000114210: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114214: 0f 85 0c 00 00 00    	jne	0xffff800000114226 <ptbl_merge+0x86>
ffff80000011421a: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000114221: e9 7b 01 00 00       	jmp	0xffff8000001143a1 <ptbl_merge+0x201>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114226: c7 45 c4 00 00 00 00 	movl	$0, -60(%rbp)
ffff80000011422d: 48 63 45 c4          	movslq	-60(%rbp), %rax
ffff800000114231: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff800000114237: 0f 83 46 00 00 00    	jae	0xffff800000114283 <ptbl_merge+0xe3>
; 		physaddr_t table_entry = table + i;
ffff80000011423d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114241: 48 63 4d c4          	movslq	-60(%rbp), %rcx
ffff800000114245: 48 01 c8             	addq	%rcx, %rax
ffff800000114248: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		if((table_entry & PAGE_MASK) != flags) return 0;
ffff80000011424c: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000114256: 48 23 45 b8          	andq	-72(%rbp), %rax
ffff80000011425a: 48 3b 45 c8          	cmpq	-56(%rbp), %rax
ffff80000011425e: 0f 84 0c 00 00 00    	je	0xffff800000114270 <ptbl_merge+0xd0>
ffff800000114264: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011426b: e9 31 01 00 00       	jmp	0xffff8000001143a1 <ptbl_merge+0x201>
; 	}
ffff800000114270: e9 00 00 00 00       	jmp	0xffff800000114275 <ptbl_merge+0xd5>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114275: 8b 45 c4             	movl	-60(%rbp), %eax
ffff800000114278: 83 c0 01             	addl	$1, %eax
ffff80000011427b: 89 45 c4             	movl	%eax, -60(%rbp)
ffff80000011427e: e9 aa ff ff ff       	jmp	0xffff80000011422d <ptbl_merge+0x8d>
; 	struct page_info *huge_page = page_alloc(ALLOC_HUGE);
ffff800000114283: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000011428d: bf 02 00 00 00       	movl	$2, %edi
ffff800000114292: ff d0                	callq	*%rax
ffff800000114294: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 	if(huge_page == NULL) return -1;
ffff800000114298: 48 83 7d b0 00       	cmpq	$0, -80(%rbp)
ffff80000011429d: 0f 85 0c 00 00 00    	jne	0xffff8000001142af <ptbl_merge+0x10f>
ffff8000001142a3: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff8000001142aa: e9 f2 00 00 00       	jmp	0xffff8000001143a1 <ptbl_merge+0x201>
; 	void* huge_page_addr = page2kva(huge_page);
ffff8000001142af: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff8000001142b3: 48 b8 70 40 11 00 00 80 ff ff	movabsq	$-140737487224720, %rax # imm = 0xFFFF800000114070
ffff8000001142bd: ff d0                	callq	*%rax
ffff8000001142bf: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff8000001142c3: c7 45 a4 00 00 00 00 	movl	$0, -92(%rbp)
ffff8000001142ca: 48 63 45 a4          	movslq	-92(%rbp), %rax
ffff8000001142ce: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff8000001142d4: 0f 83 7e 00 00 00    	jae	0xffff800000114358 <ptbl_merge+0x1b8>
; 		physaddr_t table_entry = table + i;
ffff8000001142da: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001142de: 48 63 4d a4          	movslq	-92(%rbp), %rcx
ffff8000001142e2: 48 01 c8             	addq	%rcx, %rax
ffff8000001142e5: 48 89 45 98          	movq	%rax, -104(%rbp)
; 		struct page_info *entry_page = pa2page(PAGE_ADDR(table_entry));
ffff8000001142e9: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff8000001142f3: 48 23 7d 98          	andq	-104(%rbp), %rdi
ffff8000001142f7: 48 b8 20 41 11 00 00 80 ff ff	movabsq	$-140737487224544, %rax # imm = 0xFFFF800000114120
ffff800000114301: ff d0                	callq	*%rax
ffff800000114303: 48 89 45 90          	movq	%rax, -112(%rbp)
; 		memcpy(page2kva(entry_page), huge_page_addr + i * PAGE_SIZE, PAGE_SIZE);
ffff800000114307: 48 8b 7d 90          	movq	-112(%rbp), %rdi
ffff80000011430b: 48 b8 70 40 11 00 00 80 ff ff	movabsq	$-140737487224720, %rax # imm = 0xFFFF800000114070
ffff800000114315: ff d0                	callq	*%rax
ffff800000114317: 48 89 c7             	movq	%rax, %rdi
ffff80000011431a: 48 8b 75 a8          	movq	-88(%rbp), %rsi
ffff80000011431e: 8b 45 a4             	movl	-92(%rbp), %eax
ffff800000114321: c1 e0 0c             	shll	$12, %eax
ffff800000114324: 48 98                	cltq
ffff800000114326: 48 01 c6             	addq	%rax, %rsi
ffff800000114329: 48 b8 f0 29 11 00 00 80 ff ff	movabsq	$-140737487230480, %rax # imm = 0xFFFF8000001129F0
ffff800000114333: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000114338: ff d0                	callq	*%rax
; 		page_decref(entry_page);
ffff80000011433a: 48 8b 7d 90          	movq	-112(%rbp), %rdi
ffff80000011433e: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000114348: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff80000011434a: 8b 45 a4             	movl	-92(%rbp), %eax
ffff80000011434d: 83 c0 01             	addl	$1, %eax
ffff800000114350: 89 45 a4             	movl	%eax, -92(%rbp)
ffff800000114353: e9 72 ff ff ff       	jmp	0xffff8000001142ca <ptbl_merge+0x12a>
; 	struct page_info *table_page = pa2page(table);
ffff800000114358: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff80000011435c: 48 b8 20 41 11 00 00 80 ff ff	movabsq	$-140737487224544, %rax # imm = 0xFFFF800000114120
ffff800000114366: ff d0                	callq	*%rax
ffff800000114368: 48 89 45 88          	movq	%rax, -120(%rbp)
; 	page_decref(table_page);
ffff80000011436c: 48 8b 7d 88          	movq	-120(%rbp), %rdi
ffff800000114370: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000011437a: ff d0                	callq	*%rax
; 	*entry = page2pa(huge_page) | flags;
ffff80000011437c: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000114380: 48 b8 10 3e 11 00 00 80 ff ff	movabsq	$-140737487225328, %rax # imm = 0xFFFF800000113E10
ffff80000011438a: ff d0                	callq	*%rax
ffff80000011438c: 48 89 c1             	movq	%rax, %rcx
ffff80000011438f: 48 0b 4d c8          	orq	-56(%rbp), %rcx
ffff800000114393: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114397: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff80000011439a: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001143a1: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001143a4: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff8000001143ab: 5d                   	popq	%rbp
ffff8000001143ac: c3                   	retq
ffff8000001143ad: 0f 1f 00             	nopl	(%rax)

ffff8000001143b0 <ptbl_free>:
; {
ffff8000001143b0: 55                   	pushq	%rbp
ffff8000001143b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001143b4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001143b8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001143bc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001143c0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001143c4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if((*entry & PAGE_PRESENT) == 0) return 0;
ffff8000001143c8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001143cc: 48 8b 00             	movq	(%rax), %rax
ffff8000001143cf: 48 83 e0 01          	andq	$1, %rax
ffff8000001143d3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001143d7: 0f 85 0c 00 00 00    	jne	0xffff8000001143e9 <ptbl_free+0x39>
ffff8000001143dd: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001143e4: e9 97 00 00 00       	jmp	0xffff800000114480 <ptbl_free+0xd0>
; 	physaddr_t table = PAGE_ADDR(*entry);
ffff8000001143e9: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001143ed: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001143f7: 48 23 01             	andq	(%rcx), %rax
ffff8000001143fa: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff8000001143fe: c7 45 cc 00 00 00 00 	movl	$0, -52(%rbp)
ffff800000114405: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff800000114409: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff80000011440f: 0f 83 40 00 00 00    	jae	0xffff800000114455 <ptbl_free+0xa5>
; 		physaddr_t table_entry = table + i;
ffff800000114415: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114419: 48 63 4d cc          	movslq	-52(%rbp), %rcx
ffff80000011441d: 48 01 c8             	addq	%rcx, %rax
ffff800000114420: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		if(table_entry & PAGE_PRESENT) return 0;
ffff800000114424: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff800000114428: 48 83 e0 01          	andq	$1, %rax
ffff80000011442c: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114430: 0f 84 0c 00 00 00    	je	0xffff800000114442 <ptbl_free+0x92>
ffff800000114436: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011443d: e9 3e 00 00 00       	jmp	0xffff800000114480 <ptbl_free+0xd0>
; 	}
ffff800000114442: e9 00 00 00 00       	jmp	0xffff800000114447 <ptbl_free+0x97>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114447: 8b 45 cc             	movl	-52(%rbp), %eax
ffff80000011444a: 83 c0 01             	addl	$1, %eax
ffff80000011444d: 89 45 cc             	movl	%eax, -52(%rbp)
ffff800000114450: e9 b0 ff ff ff       	jmp	0xffff800000114405 <ptbl_free+0x55>
; 	struct page_info *table_page = pa2page(table);
ffff800000114455: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000114459: 48 b8 20 41 11 00 00 80 ff ff	movabsq	$-140737487224544, %rax # imm = 0xFFFF800000114120
ffff800000114463: ff d0                	callq	*%rax
ffff800000114465: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	page_decref(table_page);
ffff800000114469: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff80000011446d: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000114477: ff d0                	callq	*%rax
; 	return 0;
ffff800000114479: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000114480: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000114483: 48 83 c4 50          	addq	$80, %rsp
ffff800000114487: 5d                   	popq	%rbp
ffff800000114488: c3                   	retq
ffff800000114489: cc                   	int3
ffff80000011448a: cc                   	int3
ffff80000011448b: cc                   	int3
ffff80000011448c: cc                   	int3
ffff80000011448d: cc                   	int3
ffff80000011448e: cc                   	int3
ffff80000011448f: cc                   	int3

ffff800000114490 <unmap_page_range>:
; {
ffff800000114490: 55                   	pushq	%rbp
ffff800000114491: 48 89 e5             	movq	%rsp, %rbp
ffff800000114494: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff80000011449b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011449f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001144a3: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 		.pml4 = pml4,
ffff8000001144a7: 48 8b 45 f8          	movq	-8(%rbp), %rax
; 	struct remove_info info = {
ffff8000001144ab: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		.va = va
ffff8000001144af: 48 8b 45 f0          	movq	-16(%rbp), %rax
; 	struct remove_info info = {
ffff8000001144b3: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct page_walker walker = {
ffff8000001144b7: 48 b8 40 45 11 00 00 80 ff ff	movabsq	$-140737487223488, %rax # imm = 0xFFFF800000114540
ffff8000001144c1: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff8000001144c5: 48 b8 a0 45 11 00 00 80 ff ff	movabsq	$-140737487223392, %rax # imm = 0xFFFF8000001145A0
ffff8000001144cf: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff8000001144d3: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff8000001144db: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff8000001144e3: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff8000001144eb: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001144f3: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff8000001144fb: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000114503: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.udata = &info,
ffff80000011450b: 48 8d 45 d8          	leaq	-40(%rbp), %rax
; 	struct page_walker walker = {
ffff80000011450f: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	walk_page_range(pml4, va, va + size, &walker);
ffff800000114513: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114517: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011451b: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000011451f: 48 03 55 e8          	addq	-24(%rbp), %rdx
ffff800000114523: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff80000011452d: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
ffff800000114531: ff d0                	callq	*%rax
; }
ffff800000114533: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000011453a: 5d                   	popq	%rbp
ffff80000011453b: c3                   	retq
ffff80000011453c: 0f 1f 40 00          	nopl	(%rax)

ffff800000114540 <remove_pte>:
; {
ffff800000114540: 55                   	pushq	%rbp
ffff800000114541: 48 89 e5             	movq	%rsp, %rbp
ffff800000114544: 48 83 ec 30          	subq	$48, %rsp
ffff800000114548: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011454c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114550: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114554: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct remove_info *info = walker->udata;
ffff800000114558: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011455c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000114560: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff800000114564: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114568: 48 8b 00             	movq	(%rax), %rax
ffff80000011456b: 48 83 e0 01          	andq	$1, %rax
ffff80000011456f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114573: 0f 84 14 00 00 00    	je	0xffff80000011458d <remove_pte+0x4d>
ffff800000114579: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011457d: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000114581: 48 b8 80 46 11 00 00 80 ff ff	movabsq	$-140737487223168, %rax # imm = 0xFFFF800000114680
ffff80000011458b: ff d0                	callq	*%rax
; 	return 0;
ffff80000011458d: 31 c0                	xorl	%eax, %eax
ffff80000011458f: 48 83 c4 30          	addq	$48, %rsp
ffff800000114593: 5d                   	popq	%rbp
ffff800000114594: c3                   	retq
ffff800000114595: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011459f: 90                   	nop

ffff8000001145a0 <remove_pde>:
; {
ffff8000001145a0: 55                   	pushq	%rbp
ffff8000001145a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001145a4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001145a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001145ac: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001145b0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001145b4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct remove_info *info = walker->udata;
ffff8000001145b8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001145bc: 48 8b 40 48          	movq	72(%rax), %rax
ffff8000001145c0: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff8000001145c4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001145c8: 48 8b 00             	movq	(%rax), %rax
ffff8000001145cb: 48 83 e0 01          	andq	$1, %rax
ffff8000001145cf: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001145d3: 0f 84 2b 00 00 00    	je	0xffff800000114604 <remove_pde+0x64>
ffff8000001145d9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001145dd: 48 8b 00             	movq	(%rax), %rax
ffff8000001145e0: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001145e6: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001145ea: 0f 84 14 00 00 00    	je	0xffff800000114604 <remove_pde+0x64>
ffff8000001145f0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001145f4: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff8000001145f8: 48 b8 80 46 11 00 00 80 ff ff	movabsq	$-140737487223168, %rax # imm = 0xFFFF800000114680
ffff800000114602: ff d0                	callq	*%rax
; 	return 0;
ffff800000114604: 31 c0                	xorl	%eax, %eax
ffff800000114606: 48 83 c4 30          	addq	$48, %rsp
ffff80000011460a: 5d                   	popq	%rbp
ffff80000011460b: c3                   	retq
ffff80000011460c: 0f 1f 40 00          	nopl	(%rax)

ffff800000114610 <unmap_user_pages>:
; {
ffff800000114610: 55                   	pushq	%rbp
ffff800000114611: 48 89 e5             	movq	%rsp, %rbp
ffff800000114614: 48 83 ec 10          	subq	$16, %rsp
ffff800000114618: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	unmap_page_range(pml4, 0, USER_LIM);
ffff80000011461c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114620: 31 c0                	xorl	%eax, %eax
ffff800000114622: 48 b8 90 44 11 00 00 80 ff ff	movabsq	$-140737487223664, %rax # imm = 0xFFFF800000114490
ffff80000011462c: 31 c9                	xorl	%ecx, %ecx
ffff80000011462e: 89 ce                	movl	%ecx, %esi
ffff800000114630: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff80000011463a: ff d0                	callq	*%rax
; }
ffff80000011463c: 48 83 c4 10          	addq	$16, %rsp
ffff800000114640: 5d                   	popq	%rbp
ffff800000114641: c3                   	retq
ffff800000114642: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011464c: 0f 1f 40 00          	nopl	(%rax)

ffff800000114650 <page_remove>:
; {
ffff800000114650: 55                   	pushq	%rbp
ffff800000114651: 48 89 e5             	movq	%rsp, %rbp
ffff800000114654: 48 83 ec 10          	subq	$16, %rsp
ffff800000114658: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011465c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	unmap_page_range(pml4, va, PAGE_SIZE);
ffff800000114660: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114664: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114668: 48 b8 90 44 11 00 00 80 ff ff	movabsq	$-140737487223664, %rax # imm = 0xFFFF800000114490
ffff800000114672: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000114677: ff d0                	callq	*%rax
; }
ffff800000114679: 48 83 c4 10          	addq	$16, %rsp
ffff80000011467d: 5d                   	popq	%rbp
ffff80000011467e: c3                   	retq
ffff80000011467f: 90                   	nop

ffff800000114680 <remove_page>:
; static void remove_page(physaddr_t *entry, struct remove_info *info){
ffff800000114680: 55                   	pushq	%rbp
ffff800000114681: 48 89 e5             	movq	%rsp, %rbp
ffff800000114684: 48 83 ec 20          	subq	$32, %rsp
ffff800000114688: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011468c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	struct page_info *page = pa2page(get_entry_pa(entry));
ffff800000114690: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114694: 48 b8 90 47 11 00 00 80 ff ff	movabsq	$-140737487222896, %rax # imm = 0xFFFF800000114790
ffff80000011469e: ff d0                	callq	*%rax
ffff8000001146a0: 48 89 c7             	movq	%rax, %rdi
ffff8000001146a3: 48 b8 10 47 11 00 00 80 ff ff	movabsq	$-140737487223024, %rax # imm = 0xFFFF800000114710
ffff8000001146ad: ff d0                	callq	*%rax
ffff8000001146af: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	page_decref(page);
ffff8000001146b3: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001146b7: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff8000001146c1: ff d0                	callq	*%rax
; 	if(page->pp_free) *entry ^= PAGE_PRESENT;
ffff8000001146c3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001146c7: 8a 40 12             	movb	18(%rax), %al
ffff8000001146ca: c0 e8 07             	shrb	$7, %al
ffff8000001146cd: 3c 00                	cmpb	$0, %al
ffff8000001146cf: 0f 84 0e 00 00 00    	je	0xffff8000001146e3 <remove_page+0x63>
ffff8000001146d5: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001146d9: 48 8b 08             	movq	(%rax), %rcx
ffff8000001146dc: 48 83 f1 01          	xorq	$1, %rcx
ffff8000001146e0: 48 89 08             	movq	%rcx, (%rax)
; 	tlb_invalidate(info->pml4, info->va); //but invalidate tlb as virtual adress points to nothing now!
ffff8000001146e3: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001146e7: 48 8b 38             	movq	(%rax), %rdi
ffff8000001146ea: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001146ee: 48 8b 70 08          	movq	8(%rax), %rsi
ffff8000001146f2: 48 b8 b0 47 11 00 00 80 ff ff	movabsq	$-140737487222864, %rax # imm = 0xFFFF8000001147B0
ffff8000001146fc: ff d0                	callq	*%rax
; }
ffff8000001146fe: 48 83 c4 20          	addq	$32, %rsp
ffff800000114702: 5d                   	popq	%rbp
ffff800000114703: c3                   	retq
ffff800000114704: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011470e: 66 90                	nop

ffff800000114710 <pa2page>:
; {
ffff800000114710: 55                   	pushq	%rbp
ffff800000114711: 48 89 e5             	movq	%rsp, %rbp
ffff800000114714: 48 83 ec 10          	subq	$16, %rsp
ffff800000114718: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011471c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114720: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114724: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011472e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000114731: 48 39 c8             	cmpq	%rcx, %rax
ffff800000114734: 0f 82 27 00 00 00    	jb	0xffff800000114761 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011473a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000114744: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff80000011474e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000114758: 31 c0                	xorl	%eax, %eax
ffff80000011475a: be 49 00 00 00       	movl	$73, %esi
ffff80000011475f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000114761: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011476b: 48 8b 00             	movq	(%rax), %rax
ffff80000011476e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000114772: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000114776: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011477a: 48 01 c8             	addq	%rcx, %rax
ffff80000011477d: 48 83 c4 10          	addq	$16, %rsp
ffff800000114781: 5d                   	popq	%rbp
ffff800000114782: c3                   	retq
ffff800000114783: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011478d: 0f 1f 00             	nopl	(%rax)

ffff800000114790 <get_entry_pa>:
; static inline physaddr_t get_entry_pa(physaddr_t *entry){
ffff800000114790: 55                   	pushq	%rbp
ffff800000114791: 48 89 e5             	movq	%rsp, %rbp
ffff800000114794: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return *entry & ~PHYS_ADD_MASK;
ffff800000114798: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000011479c: 48 b8 00 f0 ff ff ff ff ff 7f	movabsq	$9223372036854771712, %rax # imm = 0x7FFFFFFFFFFFF000
ffff8000001147a6: 48 23 01             	andq	(%rcx), %rax
ffff8000001147a9: 5d                   	popq	%rbp
ffff8000001147aa: c3                   	retq
ffff8000001147ab: cc                   	int3
ffff8000001147ac: cc                   	int3
ffff8000001147ad: cc                   	int3
ffff8000001147ae: cc                   	int3
ffff8000001147af: cc                   	int3

ffff8000001147b0 <tlb_invalidate>:
; {
ffff8000001147b0: 55                   	pushq	%rbp
ffff8000001147b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001147b4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001147b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001147bc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	flush_page(va);
ffff8000001147c0: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001147c4: 48 b8 e0 47 11 00 00 80 ff ff	movabsq	$-140737487222816, %rax # imm = 0xFFFF8000001147E0
ffff8000001147ce: ff d0                	callq	*%rax
; }
ffff8000001147d0: 48 83 c4 10          	addq	$16, %rsp
ffff8000001147d4: 5d                   	popq	%rbp
ffff8000001147d5: c3                   	retq
ffff8000001147d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001147e0 <flush_page>:
; {
ffff8000001147e0: 55                   	pushq	%rbp
ffff8000001147e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001147e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	asm volatile("invlpg (%0)" :: "r" (addr) : "memory");
ffff8000001147e8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001147ec: 0f 01 38             	invlpg	(%rax)
; }
ffff8000001147ef: 5d                   	popq	%rbp
ffff8000001147f0: c3                   	retq
ffff8000001147f1: cc                   	int3
ffff8000001147f2: cc                   	int3
ffff8000001147f3: cc                   	int3
ffff8000001147f4: cc                   	int3
ffff8000001147f5: cc                   	int3
ffff8000001147f6: cc                   	int3
ffff8000001147f7: cc                   	int3
ffff8000001147f8: cc                   	int3
ffff8000001147f9: cc                   	int3
ffff8000001147fa: cc                   	int3
ffff8000001147fb: cc                   	int3
ffff8000001147fc: cc                   	int3
ffff8000001147fd: cc                   	int3
ffff8000001147fe: cc                   	int3
ffff8000001147ff: cc                   	int3

ffff800000114800 <walk_page_range>:
; {
ffff800000114800: 55                   	pushq	%rbp
ffff800000114801: 48 89 e5             	movq	%rsp, %rbp
ffff800000114804: 48 83 ec 60          	subq	$96, %rsp
ffff800000114808: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011480c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114810: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114814: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000114818: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011481c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114820: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000114824: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114828: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000011482c: 48 81 e1 ff 0f 00 00 	andq	$4095, %rcx             # imm = 0xFFF
ffff800000114833: 48 29 c8             	subq	%rcx, %rax
ffff800000114836: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011483a: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 		ROUNDUP((uintptr_t)end, PAGE_SIZE) - 1, walker);
ffff80000011483e: 48 c7 45 c8 00 10 00 00      	movq	$4096, -56(%rbp) # imm = 0x1000
ffff800000114846: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011484a: 48 03 45 c8          	addq	-56(%rbp), %rax
ffff80000011484e: 48 83 e8 01          	subq	$1, %rax
ffff800000114852: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114856: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000011485a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011485e: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff800000114862: 31 c9                	xorl	%ecx, %ecx
ffff800000114864: 89 ca                	movl	%ecx, %edx
ffff800000114866: 48 f7 75 c8          	divq	-56(%rbp)
ffff80000011486a: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000011486e: 48 29 d0             	subq	%rdx, %rax
ffff800000114871: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000114875: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff800000114879: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000011487d: 48 8b 55 c0          	movq	-64(%rbp), %rdx
ffff800000114881: 48 83 ea 01          	subq	$1, %rdx
ffff800000114885: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000114889: 48 b8 a0 48 11 00 00 80 ff ff	movabsq	$-140737487222624, %rax # imm = 0xFFFF8000001148A0
ffff800000114893: ff d0                	callq	*%rax
ffff800000114895: 48 83 c4 60          	addq	$96, %rsp
ffff800000114899: 5d                   	popq	%rbp
ffff80000011489a: c3                   	retq
ffff80000011489b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001148a0 <pml4_walk_range>:
; {
ffff8000001148a0: 55                   	pushq	%rbp
ffff8000001148a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001148a4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001148a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001148ac: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001148b0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001148b4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pml4e_callback,
ffff8000001148b8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001148bc: 48 8b 40 18          	movq	24(%rax), %rax
; 	{
ffff8000001148c0: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pml4e_unmap,
ffff8000001148c4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001148c8: 48 8b 40 38          	movq	56(%rax), %rax
; 	{
ffff8000001148cc: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff8000001148d0: 48 b8 f0 49 11 00 00 80 ff ff	movabsq	$-140737487222288, %rax # imm = 0xFFFF8000001149F0
ffff8000001148da: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001148de: 48 b8 80 4a 11 00 00 80 ff ff	movabsq	$-140737487222144, %rax # imm = 0xFFFF800000114A80
ffff8000001148e8: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001148ec: 48 b8 a0 4a 11 00 00 80 ff ff	movabsq	$-140737487222112, %rax # imm = 0xFFFF800000114AA0
ffff8000001148f6: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001148fa: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(pml4, base, end, &ptbl_fns, walker);
ffff800000114902: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114906: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011490a: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000011490e: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114912: 48 b8 c0 4a 11 00 00 80 ff ff	movabsq	$-140737487222080, %rax # imm = 0xFFFF800000114AC0
ffff80000011491c: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114920: ff d0                	callq	*%rax
ffff800000114922: 48 83 c4 50          	addq	$80, %rsp
ffff800000114926: 5d                   	popq	%rbp
ffff800000114927: c3                   	retq
ffff800000114928: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114930 <walk_all_pages>:
; {
ffff800000114930: 55                   	pushq	%rbp
ffff800000114931: 48 89 e5             	movq	%rsp, %rbp
ffff800000114934: 48 83 ec 10          	subq	$16, %rsp
ffff800000114938: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011493c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
ffff800000114940: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114944: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000114948: 31 c0                	xorl	%eax, %eax
ffff80000011494a: 48 b8 a0 48 11 00 00 80 ff ff	movabsq	$-140737487222624, %rax # imm = 0xFFFF8000001148A0
ffff800000114954: 31 d2                	xorl	%edx, %edx
ffff800000114956: 89 d6                	movl	%edx, %esi
ffff800000114958: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff80000011495f: ff d0                	callq	*%rax
ffff800000114961: 48 83 c4 10          	addq	$16, %rsp
ffff800000114965: 5d                   	popq	%rbp
ffff800000114966: c3                   	retq
ffff800000114967: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000114970 <walk_user_pages>:
; {
ffff800000114970: 55                   	pushq	%rbp
ffff800000114971: 48 89 e5             	movq	%rsp, %rbp
ffff800000114974: 48 83 ec 10          	subq	$16, %rsp
ffff800000114978: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011497c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, 0, USER_LIM, walker);
ffff800000114980: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114984: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000114988: 31 c0                	xorl	%eax, %eax
ffff80000011498a: 48 b8 a0 48 11 00 00 80 ff ff	movabsq	$-140737487222624, %rax # imm = 0xFFFF8000001148A0
ffff800000114994: 31 d2                	xorl	%edx, %edx
ffff800000114996: 89 d6                	movl	%edx, %esi
ffff800000114998: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff8000001149a2: ff d0                	callq	*%rax
ffff8000001149a4: 48 83 c4 10          	addq	$16, %rsp
ffff8000001149a8: 5d                   	popq	%rbp
ffff8000001149a9: c3                   	retq
ffff8000001149aa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001149b0 <walk_kernel_pages>:
; {
ffff8000001149b0: 55                   	pushq	%rbp
ffff8000001149b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001149b4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001149b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001149bc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
ffff8000001149c0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001149c4: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001149c8: 48 b8 a0 48 11 00 00 80 ff ff	movabsq	$-140737487222624, %rax # imm = 0xFFFF8000001148A0
ffff8000001149d2: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff8000001149dc: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff8000001149e3: ff d0                	callq	*%rax
ffff8000001149e5: 48 83 c4 10          	addq	$16, %rsp
ffff8000001149e9: 5d                   	popq	%rbp
ffff8000001149ea: c3                   	retq
ffff8000001149eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001149f0 <pdpt_walk_range>:
; {
ffff8000001149f0: 55                   	pushq	%rbp
ffff8000001149f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001149f4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001149f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001149fc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114a00: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114a04: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pdpte_callback,
ffff800000114a08: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114a0c: 48 8b 40 10          	movq	16(%rax), %rax
; 	{
ffff800000114a10: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pdpte_unmap,
ffff800000114a14: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114a18: 48 8b 40 30          	movq	48(%rax), %rax
; 	{
ffff800000114a1c: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114a20: 48 b8 b0 4d 11 00 00 80 ff ff	movabsq	$-140737487221328, %rax # imm = 0xFFFF800000114DB0
ffff800000114a2a: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000114a2e: 48 b8 40 4e 11 00 00 80 ff ff	movabsq	$-140737487221184, %rax # imm = 0xFFFF800000114E40
ffff800000114a38: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114a3c: 48 b8 60 4e 11 00 00 80 ff ff	movabsq	$-140737487221152, %rax # imm = 0xFFFF800000114E60
ffff800000114a46: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114a4a: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(pdpt, base, end, &ptbl_fns, walker);
ffff800000114a52: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114a56: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114a5a: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114a5e: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114a62: 48 b8 c0 4a 11 00 00 80 ff ff	movabsq	$-140737487222080, %rax # imm = 0xFFFF800000114AC0
ffff800000114a6c: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114a70: ff d0                	callq	*%rax
ffff800000114a72: 48 83 c4 50          	addq	$80, %rsp
ffff800000114a76: 5d                   	popq	%rbp
ffff800000114a77: c3                   	retq
ffff800000114a78: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114a80 <pml4_index>:
; static inline int pml4_index(uintptr_t addr){return PML4_INDEX(addr);}
ffff800000114a80: 55                   	pushq	%rbp
ffff800000114a81: 48 89 e5             	movq	%rsp, %rbp
ffff800000114a84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114a88: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114a8c: 48 c1 e8 27          	shrq	$39, %rax
ffff800000114a90: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114a96: 5d                   	popq	%rbp
ffff800000114a97: c3                   	retq
ffff800000114a98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114aa0 <pml4_end>:
; {
ffff800000114aa0: 55                   	pushq	%rbp
ffff800000114aa1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114aa4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PDPT_SPAN - 1);
ffff800000114aa8: 48 b8 ff ff ff ff 7f 00 00 00	movabsq	$549755813887, %rax # imm = 0x7FFFFFFFFF
ffff800000114ab2: 48 0b 45 f8          	orq	-8(%rbp), %rax
ffff800000114ab6: 5d                   	popq	%rbp
ffff800000114ab7: c3                   	retq
ffff800000114ab8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114ac0 <__walk_range>:
; static int __walk_range(struct page_table *ptbl, uintptr_t base, uintptr_t end, struct ptbl_functions* ptbl_fn, struct page_walker *walker){
ffff800000114ac0: 55                   	pushq	%rbp
ffff800000114ac1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114ac4: 48 83 ec 60          	subq	$96, %rsp
ffff800000114ac8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000114acc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000114ad0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000114ad4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
ffff800000114ad8: 4c 89 45 d0          	movq	%r8, -48(%rbp)
; 	uintptr_t page_entry_base = sign_extend(base);
ffff800000114adc: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114ae0: 48 b8 c0 4f 11 00 00 80 ff ff	movabsq	$-140737487220800, %rax # imm = 0xFFFF800000114FC0
ffff800000114aea: ff d0                	callq	*%rax
ffff800000114aec: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	uintptr_t page_entry_end = sign_extend(ptbl_fn->ptbl_end(base));
ffff800000114af0: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114af4: 48 8b 40 20          	movq	32(%rax), %rax
ffff800000114af8: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114afc: ff d0                	callq	*%rax
ffff800000114afe: 48 89 c7             	movq	%rax, %rdi
ffff800000114b01: 48 b8 c0 4f 11 00 00 80 ff ff	movabsq	$-140737487220800, %rax # imm = 0xFFFF800000114FC0
ffff800000114b0b: ff d0                	callq	*%rax
ffff800000114b0d: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	int ret = 0;
ffff800000114b11: c7 45 b4 00 00 00 00 	movl	$0, -76(%rbp)
; 	for(int i = ptbl_fn->ptbl_index(base); i <= ptbl_fn->ptbl_index(end); i++){
ffff800000114b18: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b1c: 48 8b 40 18          	movq	24(%rax), %rax
ffff800000114b20: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114b24: ff d0                	callq	*%rax
ffff800000114b26: 89 45 b0             	movl	%eax, -80(%rbp)
ffff800000114b29: 8b 45 b0             	movl	-80(%rbp), %eax
ffff800000114b2c: 89 45 a8             	movl	%eax, -88(%rbp)
ffff800000114b2f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b33: 48 8b 40 18          	movq	24(%rax), %rax
ffff800000114b37: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000114b3b: ff d0                	callq	*%rax
ffff800000114b3d: 89 c1                	movl	%eax, %ecx
ffff800000114b3f: 8b 45 a8             	movl	-88(%rbp), %eax
ffff800000114b42: 39 c8                	cmpl	%ecx, %eax
ffff800000114b44: 0f 8f 55 02 00 00    	jg	0xffff800000114d9f <__walk_range+0x2df>
; 		entry = ptbl->entries + i;
ffff800000114b4a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114b4e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff800000114b52: 48 c1 e1 03          	shlq	$3, %rcx
ffff800000114b56: 48 01 c8             	addq	%rcx, %rax
ffff800000114b59: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000114b5d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114b61: 48 8b 00             	movq	(%rax), %rax
ffff800000114b64: 48 83 e0 01          	andq	$1, %rax
ffff800000114b68: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114b6c: 0f 95 c0             	setne	%al
ffff800000114b6f: 24 01                	andb	$1, %al
ffff800000114b71: 88 45 af             	movb	%al, -81(%rbp)
; 		if(isPresent){
ffff800000114b74: f6 45 af 01          	testb	$1, -81(%rbp)
ffff800000114b78: 0f 84 18 00 00 00    	je	0xffff800000114b96 <__walk_range+0xd6>
; 			cprintf("");
ffff800000114b7e: 48 bf a6 94 11 00 00 80 ff ff	movabsq	$-140737487203162, %rdi # imm = 0xFFFF8000001194A6
ffff800000114b88: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000114b92: 31 c0                	xorl	%eax, %eax
ffff800000114b94: ff d1                	callq	*%rcx
; 		if(ptbl_fn->ptbl_callback && (ret = ptbl_fn->ptbl_callback(entry, page_entry_base, page_entry_end, walker)) < 0) {
ffff800000114b96: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b9a: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000114b9e: 0f 84 30 00 00 00    	je	0xffff800000114bd4 <__walk_range+0x114>
ffff800000114ba4: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114ba8: 48 8b 00             	movq	(%rax), %rax
ffff800000114bab: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114baf: 48 8b 75 c0          	movq	-64(%rbp), %rsi
ffff800000114bb3: 48 8b 55 b8          	movq	-72(%rbp), %rdx
ffff800000114bb7: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114bbb: ff d0                	callq	*%rax
ffff800000114bbd: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114bc0: 83 f8 00             	cmpl	$0, %eax
ffff800000114bc3: 0f 8d 0b 00 00 00    	jge	0xffff800000114bd4 <__walk_range+0x114>
; 			return ret;
ffff800000114bc9: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114bcc: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114bcf: e9 d1 01 00 00       	jmp	0xffff800000114da5 <__walk_range+0x2e5>
; 		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT) && (ret = walker->pt_hole_callback(base, end, walker)) < 0){
ffff800000114bd4: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114bd8: 48 83 78 40 00       	cmpq	$0, 64(%rax)
ffff800000114bdd: 0f 84 42 00 00 00    	je	0xffff800000114c25 <__walk_range+0x165>
ffff800000114be3: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114be7: 48 8b 00             	movq	(%rax), %rax
ffff800000114bea: 48 83 e0 01          	andq	$1, %rax
ffff800000114bee: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114bf2: 0f 85 2d 00 00 00    	jne	0xffff800000114c25 <__walk_range+0x165>
ffff800000114bf8: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114bfc: 48 8b 40 40          	movq	64(%rax), %rax
ffff800000114c00: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114c04: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000114c08: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff800000114c0c: ff d0                	callq	*%rax
ffff800000114c0e: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114c11: 83 f8 00             	cmpl	$0, %eax
ffff800000114c14: 0f 8d 0b 00 00 00    	jge	0xffff800000114c25 <__walk_range+0x165>
; 			return ret;
ffff800000114c1a: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114c1d: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114c20: e9 80 01 00 00       	jmp	0xffff800000114da5 <__walk_range+0x2e5>
; 		bool doWalk = true;
ffff800000114c25: c6 45 ae 01          	movb	$1, -82(%rbp)
; 		if(ptbl_fn->stop_walk){
ffff800000114c29: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c2d: 48 83 78 28 00       	cmpq	$0, 40(%rax)
ffff800000114c32: 0f 84 27 00 00 00    	je	0xffff800000114c5f <__walk_range+0x19f>
; 			doWalk = !ptbl_fn->stop_walk(entry, base, end, walker);
ffff800000114c38: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c3c: 48 8b 40 28          	movq	40(%rax), %rax
ffff800000114c40: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114c44: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114c48: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114c4c: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114c50: ff d0                	callq	*%rax
ffff800000114c52: 83 f8 00             	cmpl	$0, %eax
ffff800000114c55: 0f 95 c0             	setne	%al
ffff800000114c58: 34 ff                	xorb	$-1, %al
ffff800000114c5a: 24 01                	andb	$1, %al
ffff800000114c5c: 88 45 ae             	movb	%al, -82(%rbp)
; 		if(ptbl_fn->walkfn && doWalk && (*entry & PAGE_PRESENT) 
ffff800000114c5f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c63: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000114c68: 0f 84 83 00 00 00    	je	0xffff800000114cf1 <__walk_range+0x231>
ffff800000114c6e: f6 45 ae 01          	testb	$1, -82(%rbp)
ffff800000114c72: 0f 84 79 00 00 00    	je	0xffff800000114cf1 <__walk_range+0x231>
ffff800000114c78: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114c7c: 48 8b 00             	movq	(%rax), %rax
ffff800000114c7f: 48 83 e0 01          	andq	$1, %rax
ffff800000114c83: 48 83 f8 00          	cmpq	$0, %rax
; 			&& (ret = ptbl_fn->walkfn(KADDR(PAGE_ADDR(*entry)), base, end, walker)) < 0){
ffff800000114c87: 0f 84 64 00 00 00    	je	0xffff800000114cf1 <__walk_range+0x231>
ffff800000114c8d: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c91: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000114c95: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff800000114c99: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114c9d: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff800000114ca7: 48 23 10             	andq	(%rax), %rdx
ffff800000114caa: 48 bf bd 87 11 00 00 80 ff ff	movabsq	$-140737487206467, %rdi # imm = 0xFFFF8000001187BD
ffff800000114cb4: 48 b8 10 50 11 00 00 80 ff ff	movabsq	$-140737487220720, %rax # imm = 0xFFFF800000115010
ffff800000114cbe: be 53 00 00 00       	movl	$83, %esi
ffff800000114cc3: ff d0                	callq	*%rax
ffff800000114cc5: 48 89 c7             	movq	%rax, %rdi
ffff800000114cc8: 48 8b 45 a0          	movq	-96(%rbp), %rax
ffff800000114ccc: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114cd0: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114cd4: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114cd8: ff d0                	callq	*%rax
ffff800000114cda: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114cdd: 83 f8 00             	cmpl	$0, %eax
; 		if(ptbl_fn->walkfn && doWalk && (*entry & PAGE_PRESENT) 
ffff800000114ce0: 0f 8d 0b 00 00 00    	jge	0xffff800000114cf1 <__walk_range+0x231>
; 			return ret;
ffff800000114ce6: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114ce9: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114cec: e9 b4 00 00 00       	jmp	0xffff800000114da5 <__walk_range+0x2e5>
; 		if(ptbl_fn->ptbl_unmap && (*entry & PAGE_PRESENT) && (ret = ptbl_fn->ptbl_unmap(entry, base, end, walker) < 0)){
ffff800000114cf1: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114cf5: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000114cfa: 0f 84 58 00 00 00    	je	0xffff800000114d58 <__walk_range+0x298>
ffff800000114d00: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114d04: 48 8b 00             	movq	(%rax), %rax
ffff800000114d07: 48 83 e0 01          	andq	$1, %rax
ffff800000114d0b: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114d0f: 0f 84 43 00 00 00    	je	0xffff800000114d58 <__walk_range+0x298>
ffff800000114d15: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114d19: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000114d1d: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114d21: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114d25: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114d29: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114d2d: ff d0                	callq	*%rax
ffff800000114d2f: 83 f8 00             	cmpl	$0, %eax
ffff800000114d32: 0f 9c c0             	setl	%al
ffff800000114d35: 88 c1                	movb	%al, %cl
ffff800000114d37: 80 e1 01             	andb	$1, %cl
ffff800000114d3a: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000114d3d: 89 4d b4             	movl	%ecx, -76(%rbp)
ffff800000114d40: a8 01                	testb	$1, %al
ffff800000114d42: 0f 85 05 00 00 00    	jne	0xffff800000114d4d <__walk_range+0x28d>
ffff800000114d48: e9 0b 00 00 00       	jmp	0xffff800000114d58 <__walk_range+0x298>
; 			return ret;
ffff800000114d4d: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114d50: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114d53: e9 4d 00 00 00       	jmp	0xffff800000114da5 <__walk_range+0x2e5>
; 		page_entry_base = sign_extend(page_entry_end + 1);
ffff800000114d58: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff800000114d5c: 48 83 c7 01          	addq	$1, %rdi
ffff800000114d60: 48 b8 c0 4f 11 00 00 80 ff ff	movabsq	$-140737487220800, %rax # imm = 0xFFFF800000114FC0
ffff800000114d6a: ff d0                	callq	*%rax
ffff800000114d6c: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		page_entry_end = sign_extend(ptbl_fn->ptbl_end(page_entry_base));
ffff800000114d70: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114d74: 48 8b 40 20          	movq	32(%rax), %rax
ffff800000114d78: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff800000114d7c: ff d0                	callq	*%rax
ffff800000114d7e: 48 89 c7             	movq	%rax, %rdi
ffff800000114d81: 48 b8 c0 4f 11 00 00 80 ff ff	movabsq	$-140737487220800, %rax # imm = 0xFFFF800000114FC0
ffff800000114d8b: ff d0                	callq	*%rax
ffff800000114d8d: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	for(int i = ptbl_fn->ptbl_index(base); i <= ptbl_fn->ptbl_index(end); i++){
ffff800000114d91: 8b 45 b0             	movl	-80(%rbp), %eax
ffff800000114d94: 83 c0 01             	addl	$1, %eax
ffff800000114d97: 89 45 b0             	movl	%eax, -80(%rbp)
ffff800000114d9a: e9 8a fd ff ff       	jmp	0xffff800000114b29 <__walk_range+0x69>
; 	return ret;
ffff800000114d9f: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114da2: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff800000114da5: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000114da8: 48 83 c4 60          	addq	$96, %rsp
ffff800000114dac: 5d                   	popq	%rbp
ffff800000114dad: c3                   	retq
ffff800000114dae: 66 90                	nop

ffff800000114db0 <pdir_walk_range>:
; {
ffff800000114db0: 55                   	pushq	%rbp
ffff800000114db1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114db4: 48 83 ec 50          	subq	$80, %rsp
ffff800000114db8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114dbc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114dc0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114dc4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pde_callback,
ffff800000114dc8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114dcc: 48 8b 40 08          	movq	8(%rax), %rax
; 	{
ffff800000114dd0: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pde_unmap,
ffff800000114dd4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114dd8: 48 8b 40 28          	movq	40(%rax), %rax
; 	{
ffff800000114ddc: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114de0: 48 b8 80 4e 11 00 00 80 ff ff	movabsq	$-140737487221120, %rax # imm = 0xFFFF800000114E80
ffff800000114dea: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000114dee: 48 b8 10 4f 11 00 00 80 ff ff	movabsq	$-140737487220976, %rax # imm = 0xFFFF800000114F10
ffff800000114df8: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114dfc: 48 b8 30 4f 11 00 00 80 ff ff	movabsq	$-140737487220944, %rax # imm = 0xFFFF800000114F30
ffff800000114e06: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114e0a: 48 b8 50 4f 11 00 00 80 ff ff	movabsq	$-140737487220912, %rax # imm = 0xFFFF800000114F50
ffff800000114e14: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	return __walk_range(pdir, base, end, &ptbl_fns, walker);
ffff800000114e18: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114e1c: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114e20: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114e24: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114e28: 48 b8 c0 4a 11 00 00 80 ff ff	movabsq	$-140737487222080, %rax # imm = 0xFFFF800000114AC0
ffff800000114e32: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114e36: ff d0                	callq	*%rax
ffff800000114e38: 48 83 c4 50          	addq	$80, %rsp
ffff800000114e3c: 5d                   	popq	%rbp
ffff800000114e3d: c3                   	retq
ffff800000114e3e: 66 90                	nop

ffff800000114e40 <pdpt_index>:
; static inline int pdpt_index(uintptr_t addr) {return PDPT_INDEX(addr);}
ffff800000114e40: 55                   	pushq	%rbp
ffff800000114e41: 48 89 e5             	movq	%rsp, %rbp
ffff800000114e44: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114e48: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114e4c: 48 c1 e8 1e          	shrq	$30, %rax
ffff800000114e50: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114e56: 5d                   	popq	%rbp
ffff800000114e57: c3                   	retq
ffff800000114e58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114e60 <pdpt_end>:
; {
ffff800000114e60: 55                   	pushq	%rbp
ffff800000114e61: 48 89 e5             	movq	%rsp, %rbp
ffff800000114e64: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_DIR_SPAN - 1);
ffff800000114e68: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114e6c: 48 0d ff ff ff 3f    	orq	$1073741823, %rax       # imm = 0x3FFFFFFF
ffff800000114e72: 5d                   	popq	%rbp
ffff800000114e73: c3                   	retq
ffff800000114e74: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114e7e: 66 90                	nop

ffff800000114e80 <ptbl_walk_range>:
; {
ffff800000114e80: 55                   	pushq	%rbp
ffff800000114e81: 48 89 e5             	movq	%rsp, %rbp
ffff800000114e84: 48 83 ec 50          	subq	$80, %rsp
ffff800000114e88: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114e8c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114e90: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114e94: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pte_callback,
ffff800000114e98: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114e9c: 48 8b 00             	movq	(%rax), %rax
; 	{
ffff800000114e9f: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pte_unmap,
ffff800000114ea3: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114ea7: 48 8b 40 20          	movq	32(%rax), %rax
; 	{
ffff800000114eab: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114eaf: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000114eb7: 48 b8 80 4f 11 00 00 80 ff ff	movabsq	$-140737487220864, %rax # imm = 0xFFFF800000114F80
ffff800000114ec1: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114ec5: 48 b8 a0 4f 11 00 00 80 ff ff	movabsq	$-140737487220832, %rax # imm = 0xFFFF800000114FA0
ffff800000114ecf: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114ed3: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(ptbl, base, end, &ptbl_fns, walker);
ffff800000114edb: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114edf: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114ee3: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114ee7: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114eeb: 48 b8 c0 4a 11 00 00 80 ff ff	movabsq	$-140737487222080, %rax # imm = 0xFFFF800000114AC0
ffff800000114ef5: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114ef9: ff d0                	callq	*%rax
ffff800000114efb: 48 83 c4 50          	addq	$80, %rsp
ffff800000114eff: 5d                   	popq	%rbp
ffff800000114f00: c3                   	retq
ffff800000114f01: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114f0b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000114f10 <pd_index>:
; static inline int pd_index(uintptr_t addr) {return PAGE_DIR_INDEX(addr);}
ffff800000114f10: 55                   	pushq	%rbp
ffff800000114f11: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f14: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114f18: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f1c: 48 c1 e8 15          	shrq	$21, %rax
ffff800000114f20: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114f26: 5d                   	popq	%rbp
ffff800000114f27: c3                   	retq
ffff800000114f28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114f30 <pdir_end>:
; {
ffff800000114f30: 55                   	pushq	%rbp
ffff800000114f31: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f34: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_TABLE_SPAN - 1);
ffff800000114f38: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f3c: 48 0d ff ff 1f 00    	orq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000114f42: 5d                   	popq	%rbp
ffff800000114f43: c3                   	retq
ffff800000114f44: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114f4e: 66 90                	nop

ffff800000114f50 <stop_walk_pdir>:
; static inline int stop_walk_pdir(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
ffff800000114f50: 55                   	pushq	%rbp
ffff800000114f51: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f54: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114f58: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114f5c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114f60: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	return *entry & PAGE_HUGE;
ffff800000114f64: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f68: 48 8b 00             	movq	(%rax), %rax
ffff800000114f6b: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000114f71: 5d                   	popq	%rbp
ffff800000114f72: c3                   	retq
ffff800000114f73: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114f7d: 0f 1f 00             	nopl	(%rax)

ffff800000114f80 <pt_index>:
; static inline int pt_index(uintptr_t addr) {return PAGE_TABLE_INDEX(addr);}
ffff800000114f80: 55                   	pushq	%rbp
ffff800000114f81: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114f88: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f8c: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114f90: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114f96: 5d                   	popq	%rbp
ffff800000114f97: c3                   	retq
ffff800000114f98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114fa0 <pt_end>:
; {
ffff800000114fa0: 55                   	pushq	%rbp
ffff800000114fa1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114fa4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_SIZE - 1);
ffff800000114fa8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114fac: 48 0d ff 0f 00 00    	orq	$4095, %rax             # imm = 0xFFF
ffff800000114fb2: 5d                   	popq	%rbp
ffff800000114fb3: c3                   	retq
ffff800000114fb4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114fbe: 66 90                	nop

ffff800000114fc0 <sign_extend>:
; {
ffff800000114fc0: 55                   	pushq	%rbp
ffff800000114fc1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114fc4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff800000114fc8: 48 b8 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rax # imm = 0x800000000000
ffff800000114fd2: 48 39 45 f8          	cmpq	%rax, -8(%rbp)
ffff800000114fd6: 0f 83 0d 00 00 00    	jae	0xffff800000114fe9 <sign_extend+0x29>
ffff800000114fdc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114fe0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000114fe4: e9 12 00 00 00       	jmp	0xffff800000114ffb <sign_extend+0x3b>
ffff800000114fe9: 48 b8 00 00 00 00 00 00 ff ff	movabsq	$-281474976710656, %rax # imm = 0xFFFF000000000000
ffff800000114ff3: 48 0b 45 f8          	orq	-8(%rbp), %rax
ffff800000114ff7: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000114ffb: 48 8b 45 f0          	movq	-16(%rbp), %rax
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff800000114fff: 5d                   	popq	%rbp
ffff800000115000: c3                   	retq
ffff800000115001: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011500b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000115010 <_kaddr>:
; {
ffff800000115010: 55                   	pushq	%rbp
ffff800000115011: 48 89 e5             	movq	%rsp, %rbp
ffff800000115014: 48 83 ec 20          	subq	$32, %rsp
ffff800000115018: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011501c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011501f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000115023: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000115027: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000011502b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000115035: 48 8b 09             	movq	(%rcx), %rcx
ffff800000115038: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011503b: 0f 82 24 00 00 00    	jb	0xffff800000115065 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000115041: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000115045: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000115048: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011504c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff800000115056: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115060: 31 c0                	xorl	%eax, %eax
ffff800000115062: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff800000115065: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000011506f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000115073: 48 83 c4 20          	addq	$32, %rsp
ffff800000115077: 5d                   	popq	%rbp
ffff800000115078: c3                   	retq
ffff800000115079: cc                   	int3
ffff80000011507a: cc                   	int3
ffff80000011507b: cc                   	int3
ffff80000011507c: cc                   	int3
ffff80000011507d: cc                   	int3
ffff80000011507e: cc                   	int3
ffff80000011507f: cc                   	int3

ffff800000115080 <lab2_do_check_ptbl_flags>:
; {
ffff800000115080: 55                   	pushq	%rbp
ffff800000115081: 48 89 e5             	movq	%rsp, %rbp
ffff800000115084: 48 83 ec 30          	subq	$48, %rsp
ffff800000115088: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011508c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115090: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115094: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff800000115098: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011509c: 48 8b 00             	movq	(%rax), %rax
ffff80000011509f: 48 83 e0 01          	andq	$1, %rax
ffff8000001150a3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001150a7: 0f 84 17 00 00 00    	je	0xffff8000001150c4 <lab2_do_check_ptbl_flags+0x44>
ffff8000001150ad: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001150b1: 48 8b 00             	movq	(%rax), %rax
ffff8000001150b4: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001150ba: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001150be: 0f 84 0c 00 00 00    	je	0xffff8000001150d0 <lab2_do_check_ptbl_flags+0x50>
; 		return 0;
ffff8000001150c4: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001150cb: e9 53 00 00 00       	jmp	0xffff800000115123 <lab2_do_check_ptbl_flags+0xa3>
; 	flags = *entry & PAGE_MASK;
ffff8000001150d0: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001150d4: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001150de: 48 23 01             	andq	(%rcx), %rax
ffff8000001150e1: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags != (PAGE_PRESENT | PAGE_WRITE | PAGE_USER)) {
ffff8000001150e5: 48 83 7d d0 07       	cmpq	$7, -48(%rbp)
ffff8000001150ea: 0f 84 2c 00 00 00    	je	0xffff80000011511c <lab2_do_check_ptbl_flags+0x9c>
; 		panic("%p points to a page table with the wrong "
ffff8000001150f0: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001150f4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001150fe: 48 ba b6 95 11 00 00 80 ff ff	movabsq	$-140737487202890, %rdx # imm = 0xFFFF8000001195B6
ffff800000115108: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115112: 31 c0                	xorl	%eax, %eax
ffff800000115114: be 1d 00 00 00       	movl	$29, %esi
ffff800000115119: 41 ff d0             	callq	*%r8
; 	return 0;
ffff80000011511c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000115123: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000115126: 48 83 c4 30          	addq	$48, %rsp
ffff80000011512a: 5d                   	popq	%rbp
ffff80000011512b: c3                   	retq
ffff80000011512c: 0f 1f 40 00          	nopl	(%rax)

ffff800000115130 <lab2_check_ptbl_flags>:
; {
ffff800000115130: 55                   	pushq	%rbp
ffff800000115131: 48 89 e5             	movq	%rsp, %rbp
ffff800000115134: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000115138: 48 be 58 83 11 00 00 80 ff ff	movabsq	$-140737487207592, %rsi # imm = 0xFFFF800000118358
ffff800000115142: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000115147: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000011514b: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff80000011514e: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115158: 48 8b 38             	movq	(%rax), %rdi
ffff80000011515b: 48 b8 30 49 11 00 00 80 ff ff	movabsq	$-140737487222480, %rax # imm = 0xFFFF800000114930
ffff800000115165: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115169: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_ptbl_flags() succeeded!\n");
ffff80000011516b: 48 bf 9c 89 11 00 00 80 ff ff	movabsq	$-140737487205988, %rdi # imm = 0xFFFF80000011899C
ffff800000115175: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011517f: 31 c0                	xorl	%eax, %eax
ffff800000115181: ff d1                	callq	*%rcx
; }
ffff800000115183: 48 83 c4 50          	addq	$80, %rsp
ffff800000115187: 5d                   	popq	%rbp
ffff800000115188: c3                   	retq
ffff800000115189: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115190 <lab2_check_pte_wx>:
; {
ffff800000115190: 55                   	pushq	%rbp
ffff800000115191: 48 89 e5             	movq	%rsp, %rbp
ffff800000115194: 48 83 ec 30          	subq	$48, %rsp
ffff800000115198: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011519c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001151a0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001151a4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001151a8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001151ac: 48 8b 00             	movq	(%rax), %rax
ffff8000001151af: 48 83 e0 01          	andq	$1, %rax
ffff8000001151b3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001151b7: 0f 85 0c 00 00 00    	jne	0xffff8000001151c9 <lab2_check_pte_wx+0x39>
; 		return 0;
ffff8000001151bd: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001151c4: e9 53 00 00 00       	jmp	0xffff80000011521c <lab2_check_pte_wx+0x8c>
; 	flags = *entry & (PAGE_WRITE | PAGE_NO_EXEC);
ffff8000001151c9: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001151cd: 48 b8 02 00 00 00 00 00 00 80	movabsq	$-9223372036854775806, %rax # imm = 0x8000000000000002
ffff8000001151d7: 48 23 01             	andq	(%rcx), %rax
ffff8000001151da: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags == PAGE_WRITE) {
ffff8000001151de: 48 83 7d d0 02       	cmpq	$2, -48(%rbp)
ffff8000001151e3: 0f 85 2c 00 00 00    	jne	0xffff800000115215 <lab2_check_pte_wx+0x85>
; 		panic("%p is mapped as write executable!\n", base);
ffff8000001151e9: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001151ed: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001151f7: 48 ba 4c 85 11 00 00 80 ff ff	movabsq	$-140737487207092, %rdx # imm = 0xFFFF80000011854C
ffff800000115201: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011520b: 31 c0                	xorl	%eax, %eax
ffff80000011520d: be 3e 00 00 00       	movl	$62, %esi
ffff800000115212: 41 ff d0             	callq	*%r8
; 	return 0;
ffff800000115215: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000011521c: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011521f: 48 83 c4 30          	addq	$48, %rsp
ffff800000115223: 5d                   	popq	%rbp
ffff800000115224: c3                   	retq
ffff800000115225: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011522f: 90                   	nop

ffff800000115230 <lab2_check_pde_wx>:
; {
ffff800000115230: 55                   	pushq	%rbp
ffff800000115231: 48 89 e5             	movq	%rsp, %rbp
ffff800000115234: 48 83 ec 30          	subq	$48, %rsp
ffff800000115238: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011523c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115240: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115244: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff800000115248: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011524c: 48 8b 00             	movq	(%rax), %rax
ffff80000011524f: 48 83 e0 01          	andq	$1, %rax
ffff800000115253: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115257: 0f 84 17 00 00 00    	je	0xffff800000115274 <lab2_check_pde_wx+0x44>
ffff80000011525d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115261: 48 8b 00             	movq	(%rax), %rax
ffff800000115264: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011526a: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011526e: 0f 85 0c 00 00 00    	jne	0xffff800000115280 <lab2_check_pde_wx+0x50>
; 		return 0;
ffff800000115274: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011527b: e9 53 00 00 00       	jmp	0xffff8000001152d3 <lab2_check_pde_wx+0xa3>
; 	flags = *entry & (PAGE_WRITE | PAGE_NO_EXEC);
ffff800000115280: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000115284: 48 b8 02 00 00 00 00 00 00 80	movabsq	$-9223372036854775806, %rax # imm = 0x8000000000000002
ffff80000011528e: 48 23 01             	andq	(%rcx), %rax
ffff800000115291: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags == PAGE_WRITE) {
ffff800000115295: 48 83 7d d0 02       	cmpq	$2, -48(%rbp)
ffff80000011529a: 0f 85 2c 00 00 00    	jne	0xffff8000001152cc <lab2_check_pde_wx+0x9c>
; 		panic("%p is mapped as write executable!\n", base);
ffff8000001152a0: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001152a4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001152ae: 48 ba 4c 85 11 00 00 80 ff ff	movabsq	$-140737487207092, %rdx # imm = 0xFFFF80000011854C
ffff8000001152b8: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001152c2: 31 c0                	xorl	%eax, %eax
ffff8000001152c4: be 52 00 00 00       	movl	$82, %esi
ffff8000001152c9: 41 ff d0             	callq	*%r8
; 	return 0;
ffff8000001152cc: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001152d3: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001152d6: 48 83 c4 30          	addq	$48, %rsp
ffff8000001152da: 5d                   	popq	%rbp
ffff8000001152db: c3                   	retq
ffff8000001152dc: 0f 1f 40 00          	nopl	(%rax)

ffff8000001152e0 <lab2_check_wx>:
; {
ffff8000001152e0: 55                   	pushq	%rbp
ffff8000001152e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001152e4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001152e8: 48 be a8 83 11 00 00 80 ff ff	movabsq	$-140737487207512, %rsi # imm = 0xFFFF8000001183A8
ffff8000001152f2: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001152f7: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff8000001152fb: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001152fe: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115308: 48 8b 38             	movq	(%rax), %rdi
ffff80000011530b: 48 b8 30 49 11 00 00 80 ff ff	movabsq	$-140737487222480, %rax # imm = 0xFFFF800000114930
ffff800000115315: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115319: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_wx() succeeded!\n");
ffff80000011531b: 48 bf f3 91 11 00 00 80 ff ff	movabsq	$-140737487203853, %rdi # imm = 0xFFFF8000001191F3
ffff800000115325: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011532f: 31 c0                	xorl	%eax, %eax
ffff800000115331: ff d1                	callq	*%rcx
; }
ffff800000115333: 48 83 c4 50          	addq	$80, %rsp
ffff800000115337: 5d                   	popq	%rbp
ffff800000115338: c3                   	retq
ffff800000115339: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115340 <lab2_check_nx>:
; {
ffff800000115340: 55                   	pushq	%rbp
ffff800000115341: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(read_msr(MSR_EFER) & MSR_EFER_NXE)) {
ffff800000115344: 48 b8 b0 53 11 00 00 80 ff ff	movabsq	$-140737487219792, %rax # imm = 0xFFFF8000001153B0
ffff80000011534e: bf 80 00 00 c0       	movl	$3221225600, %edi       # imm = 0xC0000080
ffff800000115353: ff d0                	callq	*%rax
ffff800000115355: 48 25 00 08 00 00    	andq	$2048, %rax             # imm = 0x800
ffff80000011535b: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011535f: 0f 85 27 00 00 00    	jne	0xffff80000011538c <lab2_check_nx+0x4c>
; 		panic("No eXecute bit is disabled!");
ffff800000115365: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011536f: 48 ba 90 86 11 00 00 80 ff ff	movabsq	$-140737487206768, %rdx # imm = 0xFFFF800000118690
ffff800000115379: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115383: 31 c0                	xorl	%eax, %eax
ffff800000115385: be 67 00 00 00       	movl	$103, %esi
ffff80000011538a: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_nx() succeeded!\n");
ffff80000011538c: 48 bf c3 89 11 00 00 80 ff ff	movabsq	$-140737487205949, %rdi # imm = 0xFFFF8000001189C3
ffff800000115396: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001153a0: 31 c0                	xorl	%eax, %eax
ffff8000001153a2: ff d1                	callq	*%rcx
; }
ffff8000001153a4: 5d                   	popq	%rbp
ffff8000001153a5: c3                   	retq
ffff8000001153a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001153b0 <read_msr>:
; {
ffff8000001153b0: 55                   	pushq	%rbp
ffff8000001153b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001153b4: 89 7d fc             	movl	%edi, -4(%rbp)
; 		"c" (reg));
ffff8000001153b7: 8b 4d fc             	movl	-4(%rbp), %ecx
; 	asm volatile(
ffff8000001153ba: 0f 32                	rdmsr
ffff8000001153bc: 89 45 f8             	movl	%eax, -8(%rbp)
ffff8000001153bf: 89 55 f4             	movl	%edx, -12(%rbp)
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff8000001153c2: 8b 45 f4             	movl	-12(%rbp), %eax
ffff8000001153c5: 48 c1 e0 20          	shlq	$32, %rax
ffff8000001153c9: 8b 4d f8             	movl	-8(%rbp), %ecx
ffff8000001153cc: 48 09 c8             	orq	%rcx, %rax
ffff8000001153cf: 5d                   	popq	%rbp
ffff8000001153d0: c3                   	retq
ffff8000001153d1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001153db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001153e0 <lab2_check_pte_vas>:
; {
ffff8000001153e0: 55                   	pushq	%rbp
ffff8000001153e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001153e4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001153e8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001153ec: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001153f0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001153f4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001153f8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001153fc: 48 8b 00             	movq	(%rax), %rax
ffff8000001153ff: 48 83 e0 01          	andq	$1, %rax
ffff800000115403: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115407: 0f 85 0c 00 00 00    	jne	0xffff800000115419 <lab2_check_pte_vas+0x39>
; 		return 0;
ffff80000011540d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115414: e9 b8 00 00 00       	jmp	0xffff8000001154d1 <lab2_check_pte_vas+0xf1>
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000115419: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff800000115423: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000115427: 0f 87 20 00 00 00    	ja	0xffff80000011544d <lab2_check_pte_vas+0x6d>
ffff80000011542d: 48 b8 00 00 00 00 10 80 ff ff	movabsq	$-140668768878592, %rax # imm = 0xFFFF801000000000
ffff800000115437: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff80000011543b: 0f 83 0c 00 00 00    	jae	0xffff80000011544d <lab2_check_pte_vas+0x6d>
; 		return 0;
ffff800000115441: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115448: e9 84 00 00 00       	jmp	0xffff8000001154d1 <lab2_check_pte_vas+0xf1>
; 	if (KPAGES <= base) {
ffff80000011544d: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff800000115457: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000011545b: 0f 87 0c 00 00 00    	ja	0xffff80000011546d <lab2_check_pte_vas+0x8d>
; 		return 0;
ffff800000115461: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115468: e9 64 00 00 00       	jmp	0xffff8000001154d1 <lab2_check_pte_vas+0xf1>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011546d: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff800000115477: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000011547b: 0f 87 20 00 00 00    	ja	0xffff8000001154a1 <lab2_check_pte_vas+0xc1>
ffff800000115481: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff80000011548b: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff80000011548f: 0f 83 0c 00 00 00    	jae	0xffff8000001154a1 <lab2_check_pte_vas+0xc1>
; 		return 0;
ffff800000115495: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011549c: e9 30 00 00 00       	jmp	0xffff8000001154d1 <lab2_check_pte_vas+0xf1>
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff8000001154a1: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001154a5: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff8000001154a9: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001154b3: 48 ba 31 8e 11 00 00 80 ff ff	movabsq	$-140737487204815, %rdx # imm = 0xFFFF800000118E31
ffff8000001154bd: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001154c7: 31 c0                	xorl	%eax, %eax
ffff8000001154c9: be 83 00 00 00       	movl	$131, %esi
ffff8000001154ce: 41 ff d1             	callq	*%r9
; }
ffff8000001154d1: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001154d4: 48 83 c4 30          	addq	$48, %rsp
ffff8000001154d8: 5d                   	popq	%rbp
ffff8000001154d9: c3                   	retq
ffff8000001154da: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001154e0 <lab2_check_pde_vas>:
; {
ffff8000001154e0: 55                   	pushq	%rbp
ffff8000001154e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001154e4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001154e8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001154ec: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001154f0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001154f4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001154f8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001154fc: 48 8b 00             	movq	(%rax), %rax
ffff8000001154ff: 48 83 e0 01          	andq	$1, %rax
ffff800000115503: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115507: 0f 84 17 00 00 00    	je	0xffff800000115524 <lab2_check_pde_vas+0x44>
ffff80000011550d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115511: 48 8b 00             	movq	(%rax), %rax
ffff800000115514: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011551a: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011551e: 0f 85 0c 00 00 00    	jne	0xffff800000115530 <lab2_check_pde_vas+0x50>
; 		return 0;
ffff800000115524: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011552b: e9 1f 00 00 00       	jmp	0xffff80000011554f <lab2_check_pde_vas+0x6f>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff800000115530: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000115534: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000115538: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000011553c: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000115540: 48 b8 e0 53 11 00 00 80 ff ff	movabsq	$-140737487219744, %rax # imm = 0xFFFF8000001153E0
ffff80000011554a: ff d0                	callq	*%rax
ffff80000011554c: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff80000011554f: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000115552: 48 83 c4 30          	addq	$48, %rsp
ffff800000115556: 5d                   	popq	%rbp
ffff800000115557: c3                   	retq
ffff800000115558: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000115560 <lab2_check_vas>:
; {
ffff800000115560: 55                   	pushq	%rbp
ffff800000115561: 48 89 e5             	movq	%rsp, %rbp
ffff800000115564: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000115568: 48 be f8 83 11 00 00 80 ff ff	movabsq	$-140737487207432, %rsi # imm = 0xFFFF8000001183F8
ffff800000115572: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000115577: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000011557b: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff80000011557e: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115588: 48 8b 38             	movq	(%rax), %rdi
ffff80000011558b: 48 b8 30 49 11 00 00 80 ff ff	movabsq	$-140737487222480, %rax # imm = 0xFFFF800000114930
ffff800000115595: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115599: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_vas() succeeded!\n");
ffff80000011559b: 48 bf 87 85 11 00 00 80 ff ff	movabsq	$-140737487207033, %rdi # imm = 0xFFFF800000118587
ffff8000001155a5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001155af: 31 c0                	xorl	%eax, %eax
ffff8000001155b1: ff d1                	callq	*%rcx
; }
ffff8000001155b3: 48 83 c4 50          	addq	$80, %rsp
ffff8000001155b7: 5d                   	popq	%rbp
ffff8000001155b8: c3                   	retq
ffff8000001155b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001155c0 <need_mapping>:
; int need_mapping(uintptr_t base, uintptr_t end){
ffff8000001155c0: 55                   	pushq	%rbp
ffff8000001155c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001155c4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001155c8: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff8000001155cc: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001155d6: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff8000001155da: 0f 87 37 00 00 00    	ja	0xffff800000115617 <need_mapping+0x57>
ffff8000001155e0: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001155e4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001155ee: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001155f1: 48 c1 e1 0c          	shlq	$12, %rcx
ffff8000001155f5: 48 ba 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rdx # imm = 0xFFFF800000000000
ffff8000001155ff: 48 01 d1             	addq	%rdx, %rcx
ffff800000115602: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115605: 0f 83 0c 00 00 00    	jae	0xffff800000115617 <need_mapping+0x57>
; 		return 1;
ffff80000011560b: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff800000115612: e9 c0 00 00 00       	jmp	0xffff8000001156d7 <need_mapping+0x117>
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff800000115617: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff800000115621: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff800000115625: 0f 87 71 00 00 00    	ja	0xffff80000011569c <need_mapping+0xdc>
ffff80000011562b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011562f: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000115633: 48 c7 45 e0 00 10 00 00      	movq	$4096, -32(%rbp) # imm = 0x1000
ffff80000011563b: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff800000115645: 48 8b 00             	movq	(%rax), %rax
ffff800000115648: 48 c1 e0 05          	shlq	$5, %rax
ffff80000011564c: 48 03 45 e0          	addq	-32(%rbp), %rax
ffff800000115650: 48 83 e8 01          	subq	$1, %rax
ffff800000115654: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000115658: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000011565c: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000115660: 31 d2                	xorl	%edx, %edx
ffff800000115662: 48 f7 75 e0          	divq	-32(%rbp)
ffff800000115666: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000011566a: 48 29 d1             	subq	%rdx, %rcx
ffff80000011566d: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff800000115671: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000115675: 48 89 4d d8          	movq	%rcx, -40(%rbp)
ffff800000115679: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff800000115683: 48 03 4d d8          	addq	-40(%rbp), %rcx
ffff800000115687: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011568a: 0f 83 0c 00 00 00    	jae	0xffff80000011569c <need_mapping+0xdc>
; 		return 1;
ffff800000115690: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff800000115697: e9 3b 00 00 00       	jmp	0xffff8000001156d7 <need_mapping+0x117>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011569c: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff8000001156a6: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff8000001156aa: 0f 87 20 00 00 00    	ja	0xffff8000001156d0 <need_mapping+0x110>
ffff8000001156b0: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff8000001156ba: 48 39 45 e8          	cmpq	%rax, -24(%rbp)
ffff8000001156be: 0f 83 0c 00 00 00    	jae	0xffff8000001156d0 <need_mapping+0x110>
; 		return 1;
ffff8000001156c4: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff8000001156cb: e9 07 00 00 00       	jmp	0xffff8000001156d7 <need_mapping+0x117>
; 	return 0;
ffff8000001156d0: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001156d7: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001156da: 5d                   	popq	%rbp
ffff8000001156db: c3                   	retq
ffff8000001156dc: 0f 1f 40 00          	nopl	(%rax)

ffff8000001156e0 <lab2_check_pte_vas_ext>:
; {
ffff8000001156e0: 55                   	pushq	%rbp
ffff8000001156e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001156e4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001156e8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001156ec: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001156f0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001156f4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if ((end - base) != 0xfff) {
ffff8000001156f8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001156fc: 48 2b 45 e8          	subq	-24(%rbp), %rax
ffff800000115700: 48 3d ff 0f 00 00    	cmpq	$4095, %rax             # imm = 0xFFF
ffff800000115706: 0f 84 30 00 00 00    	je	0xffff80000011573c <lab2_check_pte_vas_ext+0x5c>
; 		panic("end [%llx] - base [%llx] should be 4kb - 1  bytes\n", end, base);
ffff80000011570c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000115710: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff800000115714: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011571e: 48 ba 03 93 11 00 00 80 ff ff	movabsq	$-140737487203581, %rdx # imm = 0xFFFF800000119303
ffff800000115728: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff800000115732: 31 c0                	xorl	%eax, %eax
ffff800000115734: be b6 00 00 00       	movl	$182, %esi
ffff800000115739: 41 ff d1             	callq	*%r9
; 	if (!(*entry & PAGE_PRESENT)) {
ffff80000011573c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115740: 48 8b 00             	movq	(%rax), %rax
ffff800000115743: 48 83 e0 01          	andq	$1, %rax
ffff800000115747: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011574b: 0f 85 50 00 00 00    	jne	0xffff8000001157a1 <lab2_check_pte_vas_ext+0xc1>
;                 if (need_mapping(base, end)){
ffff800000115751: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000115755: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000115759: 48 b8 c0 55 11 00 00 80 ff ff	movabsq	$-140737487219264, %rax # imm = 0xFFFF8000001155C0
ffff800000115763: ff d0                	callq	*%rax
ffff800000115765: 83 f8 00             	cmpl	$0, %eax
ffff800000115768: 0f 84 27 00 00 00    	je	0xffff800000115795 <lab2_check_pte_vas_ext+0xb5>
;                     panic("All backing pages for the budy, page_info structs and kernel stack must be mapped\n");
ffff80000011576e: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115778: 48 ba 5a 8c 11 00 00 80 ff ff	movabsq	$-140737487205286, %rdx # imm = 0xFFFF800000118C5A
ffff800000115782: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011578c: 31 c0                	xorl	%eax, %eax
ffff80000011578e: be bc 00 00 00       	movl	$188, %esi
ffff800000115793: ff d1                	callq	*%rcx
; 		return 0;
ffff800000115795: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011579c: e9 b8 00 00 00       	jmp	0xffff800000115859 <lab2_check_pte_vas_ext+0x179>
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff8000001157a1: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001157ab: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001157af: 0f 87 20 00 00 00    	ja	0xffff8000001157d5 <lab2_check_pte_vas_ext+0xf5>
ffff8000001157b5: 48 b8 00 00 00 00 10 80 ff ff	movabsq	$-140668768878592, %rax # imm = 0xFFFF801000000000
ffff8000001157bf: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff8000001157c3: 0f 83 0c 00 00 00    	jae	0xffff8000001157d5 <lab2_check_pte_vas_ext+0xf5>
; 		return 0;
ffff8000001157c9: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001157d0: e9 84 00 00 00       	jmp	0xffff800000115859 <lab2_check_pte_vas_ext+0x179>
; 	if (KPAGES <= base) {
ffff8000001157d5: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff8000001157df: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001157e3: 0f 87 0c 00 00 00    	ja	0xffff8000001157f5 <lab2_check_pte_vas_ext+0x115>
; 		return 0;
ffff8000001157e9: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001157f0: e9 64 00 00 00       	jmp	0xffff800000115859 <lab2_check_pte_vas_ext+0x179>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001157f5: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff8000001157ff: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000115803: 0f 87 20 00 00 00    	ja	0xffff800000115829 <lab2_check_pte_vas_ext+0x149>
ffff800000115809: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff800000115813: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff800000115817: 0f 83 0c 00 00 00    	jae	0xffff800000115829 <lab2_check_pte_vas_ext+0x149>
; 		return 0;
ffff80000011581d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115824: e9 30 00 00 00       	jmp	0xffff800000115859 <lab2_check_pte_vas_ext+0x179>
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff800000115829: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011582d: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000115831: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011583b: 48 ba 31 8e 11 00 00 80 ff ff	movabsq	$-140737487204815, %rdx # imm = 0xFFFF800000118E31
ffff800000115845: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff80000011584f: 31 c0                	xorl	%eax, %eax
ffff800000115851: be cf 00 00 00       	movl	$207, %esi
ffff800000115856: 41 ff d1             	callq	*%r9
; }
ffff800000115859: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011585c: 48 83 c4 30          	addq	$48, %rsp
ffff800000115860: 5d                   	popq	%rbp
ffff800000115861: c3                   	retq
ffff800000115862: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011586c: 0f 1f 40 00          	nopl	(%rax)

ffff800000115870 <lab2_check_pde_vas_ext>:
; {
ffff800000115870: 55                   	pushq	%rbp
ffff800000115871: 48 89 e5             	movq	%rsp, %rbp
ffff800000115874: 48 83 ec 30          	subq	$48, %rsp
ffff800000115878: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011587c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115880: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115884: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if ((end - base) != 0x1FFFFF) {
ffff800000115888: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011588c: 48 2b 45 e8          	subq	-24(%rbp), %rax
ffff800000115890: 48 3d ff ff 1f 00    	cmpq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000115896: 0f 84 30 00 00 00    	je	0xffff8000001158cc <lab2_check_pde_vas_ext+0x5c>
; 		panic("end [%llx] - base [%llx] should be a 2m page - 1\n", end, base);
ffff80000011589c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001158a0: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff8000001158a4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001158ae: 48 ba a7 94 11 00 00 80 ff ff	movabsq	$-140737487203161, %rdx # imm = 0xFFFF8000001194A7
ffff8000001158b8: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001158c2: 31 c0                	xorl	%eax, %eax
ffff8000001158c4: be d9 00 00 00       	movl	$217, %esi
ffff8000001158c9: 41 ff d1             	callq	*%r9
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001158cc: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001158d0: 48 8b 00             	movq	(%rax), %rax
ffff8000001158d3: 48 83 e0 01          	andq	$1, %rax
ffff8000001158d7: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001158db: 0f 84 17 00 00 00    	je	0xffff8000001158f8 <lab2_check_pde_vas_ext+0x88>
ffff8000001158e1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001158e5: 48 8b 00             	movq	(%rax), %rax
ffff8000001158e8: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001158ee: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001158f2: 0f 85 0c 00 00 00    	jne	0xffff800000115904 <lab2_check_pde_vas_ext+0x94>
; 		return 0;
ffff8000001158f8: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001158ff: e9 1f 00 00 00       	jmp	0xffff800000115923 <lab2_check_pde_vas_ext+0xb3>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff800000115904: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000115908: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff80000011590c: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000115910: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000115914: 48 b8 e0 53 11 00 00 80 ff ff	movabsq	$-140737487219744, %rax # imm = 0xFFFF8000001153E0
ffff80000011591e: ff d0                	callq	*%rax
ffff800000115920: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff800000115923: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000115926: 48 83 c4 30          	addq	$48, %rsp
ffff80000011592a: 5d                   	popq	%rbp
ffff80000011592b: c3                   	retq
ffff80000011592c: 0f 1f 40 00          	nopl	(%rax)

ffff800000115930 <lab2_check_vas_ext>:
; {
ffff800000115930: 55                   	pushq	%rbp
ffff800000115931: 48 89 e5             	movq	%rsp, %rbp
ffff800000115934: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000115938: 48 be 48 84 11 00 00 80 ff ff	movabsq	$-140737487207352, %rsi # imm = 0xFFFF800000118448
ffff800000115942: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000115947: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000011594b: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff80000011594e: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115958: 48 8b 38             	movq	(%rax), %rdi
ffff80000011595b: 48 b8 30 49 11 00 00 80 ff ff	movabsq	$-140737487222480, %rax # imm = 0xFFFF800000114930
ffff800000115965: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115969: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_vas_ext() succeeded!\n");
ffff80000011596b: 48 bf ac 86 11 00 00 80 ff ff	movabsq	$-140737487206740, %rdi # imm = 0xFFFF8000001186AC
ffff800000115975: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011597f: 31 c0                	xorl	%eax, %eax
ffff800000115981: ff d1                	callq	*%rcx
; }
ffff800000115983: 48 83 c4 50          	addq	$80, %rsp
ffff800000115987: 5d                   	popq	%rbp
ffff800000115988: c3                   	retq
ffff800000115989: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115990 <lab2_check_4k_paging>:
; {
ffff800000115990: 55                   	pushq	%rbp
ffff800000115991: 48 89 e5             	movq	%rsp, %rbp
ffff800000115994: 48 83 ec 30          	subq	$48, %rsp
; 	cprintf("attempting to count number of free pages in lab2 check paging\n");
ffff800000115998: 48 bf 65 91 11 00 00 80 ff ff	movabsq	$-140737487203995, %rdi # imm = 0xFFFF800000119165
ffff8000001159a2: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001159ac: 31 c0                	xorl	%eax, %eax
ffff8000001159ae: ff d1                	callq	*%rcx
; 	nfree = count_total_free_pages();
ffff8000001159b0: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff8000001159ba: ff d0                	callq	*%rax
ffff8000001159bc: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	cprintf("counted total number of pages in lab2 check paging\n");
ffff8000001159c0: 48 bf ad 8c 11 00 00 80 ff ff	movabsq	$-140737487205203, %rdi # imm = 0xFFFF800000118CAD
ffff8000001159ca: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001159d4: 31 c0                	xorl	%eax, %eax
ffff8000001159d6: ff d1                	callq	*%rcx
; 	page = page_alloc(0);
ffff8000001159d8: 31 c0                	xorl	%eax, %eax
ffff8000001159da: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff8000001159e4: 31 ff                	xorl	%edi, %edi
ffff8000001159e6: ff d0                	callq	*%rax
ffff8000001159e8: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff8000001159ec: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff8000001159f1: 0f 85 27 00 00 00    	jne	0xffff800000115a1e <lab2_check_4k_paging+0x8e>
; 		panic("cannot allocate 4K page!");
ffff8000001159f7: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115a01: 48 ba 36 93 11 00 00 80 ff ff	movabsq	$-140737487203530, %rdx # imm = 0xFFFF800000119336
ffff800000115a0b: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115a15: 31 c0                	xorl	%eax, %eax
ffff800000115a17: be 00 01 00 00       	movl	$256, %esi              # imm = 0x100
ffff800000115a1c: ff d1                	callq	*%rcx
; 	cprintf("page allocated in lab2 check paging\n");
ffff800000115a1e: 48 bf cf 87 11 00 00 80 ff ff	movabsq	$-140737487206449, %rdi # imm = 0xFFFF8000001187CF
ffff800000115a28: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115a32: 31 c0                	xorl	%eax, %eax
ffff800000115a34: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000115a36: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115a40: 48 8b 38             	movq	(%rax), %rdi
ffff800000115a43: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000115a47: 31 c0                	xorl	%eax, %eax
ffff800000115a49: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000115a53: 31 c9                	xorl	%ecx, %ecx
ffff800000115a55: 89 ca                	movl	%ecx, %edx
ffff800000115a57: b9 01 00 00 00       	movl	$1, %ecx
ffff800000115a5c: ff d0                	callq	*%rax
ffff800000115a5e: 83 f8 00             	cmpl	$0, %eax
ffff800000115a61: 0f 84 32 00 00 00    	je	0xffff800000115a99 <lab2_check_4k_paging+0x109>
ffff800000115a67: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115a71: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115a7b: 48 b9 28 90 11 00 00 80 ff ff	movabsq	$-140737487204312, %rcx # imm = 0xFFFF800000119028
ffff800000115a85: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115a8f: 31 c0                	xorl	%eax, %eax
ffff800000115a91: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff800000115a96: 41 ff d0             	callq	*%r8
ffff800000115a99: e9 00 00 00 00       	jmp	0xffff800000115a9e <lab2_check_4k_paging+0x10e>
; 	assert(page->pp_ref == 1);
ffff800000115a9e: e9 00 00 00 00       	jmp	0xffff800000115aa3 <lab2_check_4k_paging+0x113>
ffff800000115aa3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115aa7: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff800000115aab: 83 f8 01             	cmpl	$1, %eax
ffff800000115aae: 0f 84 32 00 00 00    	je	0xffff800000115ae6 <lab2_check_4k_paging+0x156>
ffff800000115ab4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115abe: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115ac8: 48 b9 ac 96 11 00 00 80 ff ff	movabsq	$-140737487202644, %rcx # imm = 0xFFFF8000001196AC
ffff800000115ad2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115adc: 31 c0                	xorl	%eax, %eax
ffff800000115ade: be 07 01 00 00       	movl	$263, %esi              # imm = 0x107
ffff800000115ae3: 41 ff d0             	callq	*%r8
ffff800000115ae6: e9 00 00 00 00       	jmp	0xffff800000115aeb <lab2_check_4k_paging+0x15b>
; 	assert(!page->pp_free);
ffff800000115aeb: e9 00 00 00 00       	jmp	0xffff800000115af0 <lab2_check_4k_paging+0x160>
ffff800000115af0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115af4: 8a 40 12             	movb	18(%rax), %al
ffff800000115af7: c0 e8 07             	shrb	$7, %al
ffff800000115afa: 3c 00                	cmpb	$0, %al
ffff800000115afc: 0f 84 32 00 00 00    	je	0xffff800000115b34 <lab2_check_4k_paging+0x1a4>
ffff800000115b02: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115b0c: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115b16: 48 b9 6f 85 11 00 00 80 ff ff	movabsq	$-140737487207057, %rcx # imm = 0xFFFF80000011856F
ffff800000115b20: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115b2a: 31 c0                	xorl	%eax, %eax
ffff800000115b2c: be 08 01 00 00       	movl	$264, %esi              # imm = 0x108
ffff800000115b31: 41 ff d0             	callq	*%r8
ffff800000115b34: e9 00 00 00 00       	jmp	0xffff800000115b39 <lab2_check_4k_paging+0x1a9>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000115b39: e9 00 00 00 00       	jmp	0xffff800000115b3e <lab2_check_4k_paging+0x1ae>
ffff800000115b3e: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115b48: 48 8b 00             	movq	(%rax), %rax
ffff800000115b4b: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000115b4f: 0f 85 32 00 00 00    	jne	0xffff800000115b87 <lab2_check_4k_paging+0x1f7>
ffff800000115b55: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115b5f: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115b69: 48 b9 f4 87 11 00 00 80 ff ff	movabsq	$-140737487206412, %rcx # imm = 0xFFFF8000001187F4
ffff800000115b73: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115b7d: 31 c0                	xorl	%eax, %eax
ffff800000115b7f: be 09 01 00 00       	movl	$265, %esi              # imm = 0x109
ffff800000115b84: 41 ff d0             	callq	*%r8
ffff800000115b87: e9 00 00 00 00       	jmp	0xffff800000115b8c <lab2_check_4k_paging+0x1fc>
; 	cprintf("page mapped in lab2 check paging\n");
ffff800000115b8c: 48 bf 8f 88 11 00 00 80 ff ff	movabsq	$-140737487206257, %rdi # imm = 0xFFFF80000011888F
ffff800000115b96: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115ba0: 31 c0                	xorl	%eax, %eax
ffff800000115ba2: ff d1                	callq	*%rcx
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000115ba4: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115bae: 48 8b 38             	movq	(%rax), %rdi
ffff800000115bb1: 31 c0                	xorl	%eax, %eax
ffff800000115bb3: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000115bbd: 31 c9                	xorl	%ecx, %ecx
ffff800000115bbf: 89 ce                	movl	%ecx, %esi
ffff800000115bc1: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000115bc5: ff d0                	callq	*%rax
ffff800000115bc7: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000115bcb: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115bcf: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000115bd9: 48 23 01             	andq	(%rcx), %rax
ffff800000115bdc: 48 83 f8 01          	cmpq	$1, %rax
ffff800000115be0: 0f 84 32 00 00 00    	je	0xffff800000115c18 <lab2_check_4k_paging+0x288>
ffff800000115be6: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115bf0: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115bfa: 48 b9 5c 94 11 00 00 80 ff ff	movabsq	$-140737487203236, %rcx # imm = 0xFFFF80000011945C
ffff800000115c04: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115c0e: 31 c0                	xorl	%eax, %eax
ffff800000115c10: be 0f 01 00 00       	movl	$271, %esi              # imm = 0x10F
ffff800000115c15: 41 ff d0             	callq	*%r8
ffff800000115c18: e9 00 00 00 00       	jmp	0xffff800000115c1d <lab2_check_4k_paging+0x28d>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000115c1d: e9 00 00 00 00       	jmp	0xffff800000115c22 <lab2_check_4k_paging+0x292>
ffff800000115c22: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115c26: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000115c30: 48 23 01             	andq	(%rcx), %rax
ffff800000115c33: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000115c37: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000115c3b: 48 b8 80 5e 11 00 00 80 ff ff	movabsq	$-140737487217024, %rax # imm = 0xFFFF800000115E80
ffff800000115c45: ff d0                	callq	*%rax
ffff800000115c47: 48 89 c1             	movq	%rax, %rcx
ffff800000115c4a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000115c4e: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115c51: 0f 84 32 00 00 00    	je	0xffff800000115c89 <lab2_check_4k_paging+0x2f9>
ffff800000115c57: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115c61: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115c6b: 48 b9 e1 8c 11 00 00 80 ff ff	movabsq	$-140737487205151, %rcx # imm = 0xFFFF800000118CE1
ffff800000115c75: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115c7f: 31 c0                	xorl	%eax, %eax
ffff800000115c81: be 10 01 00 00       	movl	$272, %esi              # imm = 0x110
ffff800000115c86: 41 ff d0             	callq	*%r8
ffff800000115c89: e9 00 00 00 00       	jmp	0xffff800000115c8e <lab2_check_4k_paging+0x2fe>
; 	assert(ret == page);
ffff800000115c8e: e9 00 00 00 00       	jmp	0xffff800000115c93 <lab2_check_4k_paging+0x303>
ffff800000115c93: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115c97: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000115c9b: 0f 84 32 00 00 00    	je	0xffff800000115cd3 <lab2_check_4k_paging+0x343>
ffff800000115ca1: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115cab: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115cb5: 48 b9 31 91 11 00 00 80 ff ff	movabsq	$-140737487204047, %rcx # imm = 0xFFFF800000119131
ffff800000115cbf: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115cc9: 31 c0                	xorl	%eax, %eax
ffff800000115ccb: be 11 01 00 00       	movl	$273, %esi              # imm = 0x111
ffff800000115cd0: 41 ff d0             	callq	*%r8
ffff800000115cd3: e9 00 00 00 00       	jmp	0xffff800000115cd8 <lab2_check_4k_paging+0x348>
; 	page_remove(kernel_pml4, 0);
ffff800000115cd8: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115ce2: 48 8b 38             	movq	(%rax), %rdi
ffff800000115ce5: 31 c0                	xorl	%eax, %eax
ffff800000115ce7: 48 b8 50 46 11 00 00 80 ff ff	movabsq	$-140737487223216, %rax # imm = 0xFFFF800000114650
ffff800000115cf1: 31 c9                	xorl	%ecx, %ecx
ffff800000115cf3: 89 ce                	movl	%ecx, %esi
ffff800000115cf5: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000115cf7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115cfb: 8a 40 12             	movb	18(%rax), %al
ffff800000115cfe: c0 e8 07             	shrb	$7, %al
ffff800000115d01: 3c 00                	cmpb	$0, %al
ffff800000115d03: 0f 85 32 00 00 00    	jne	0xffff800000115d3b <lab2_check_4k_paging+0x3ab>
ffff800000115d09: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115d13: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115d1d: 48 b9 0c 8f 11 00 00 80 ff ff	movabsq	$-140737487204596, %rcx # imm = 0xFFFF800000118F0C
ffff800000115d27: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115d31: 31 c0                	xorl	%eax, %eax
ffff800000115d33: be 15 01 00 00       	movl	$277, %esi              # imm = 0x115
ffff800000115d38: 41 ff d0             	callq	*%r8
ffff800000115d3b: e9 00 00 00 00       	jmp	0xffff800000115d40 <lab2_check_4k_paging+0x3b0>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000115d40: e9 00 00 00 00       	jmp	0xffff800000115d45 <lab2_check_4k_paging+0x3b5>
ffff800000115d45: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115d4f: 48 8b 38             	movq	(%rax), %rdi
ffff800000115d52: 31 c0                	xorl	%eax, %eax
ffff800000115d54: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000115d5e: 31 c9                	xorl	%ecx, %ecx
ffff800000115d60: 89 ca                	movl	%ecx, %edx
ffff800000115d62: 48 89 d6             	movq	%rdx, %rsi
ffff800000115d65: ff d0                	callq	*%rax
ffff800000115d67: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115d6b: 0f 84 32 00 00 00    	je	0xffff800000115da3 <lab2_check_4k_paging+0x413>
ffff800000115d71: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115d7b: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115d85: 48 b9 c3 8a 11 00 00 80 ff ff	movabsq	$-140737487205693, %rcx # imm = 0xFFFF800000118AC3
ffff800000115d8f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115d99: 31 c0                	xorl	%eax, %eax
ffff800000115d9b: be 16 01 00 00       	movl	$278, %esi              # imm = 0x116
ffff800000115da0: 41 ff d0             	callq	*%r8
ffff800000115da3: e9 00 00 00 00       	jmp	0xffff800000115da8 <lab2_check_4k_paging+0x418>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000115da8: e9 00 00 00 00       	jmp	0xffff800000115dad <lab2_check_4k_paging+0x41d>
ffff800000115dad: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115db7: 48 8b 00             	movq	(%rax), %rax
ffff800000115dba: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000115dbe: 0f 84 32 00 00 00    	je	0xffff800000115df6 <lab2_check_4k_paging+0x466>
ffff800000115dc4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115dce: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115dd8: 48 b9 be 8d 11 00 00 80 ff ff	movabsq	$-140737487204930, %rcx # imm = 0xFFFF800000118DBE
ffff800000115de2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115dec: 31 c0                	xorl	%eax, %eax
ffff800000115dee: be 19 01 00 00       	movl	$281, %esi              # imm = 0x119
ffff800000115df3: 41 ff d0             	callq	*%r8
ffff800000115df6: e9 00 00 00 00       	jmp	0xffff800000115dfb <lab2_check_4k_paging+0x46b>
; 	assert(nfree == count_total_free_pages());
ffff800000115dfb: e9 00 00 00 00       	jmp	0xffff800000115e00 <lab2_check_4k_paging+0x470>
ffff800000115e00: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000115e04: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000115e08: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000115e12: ff d0                	callq	*%rax
ffff800000115e14: 48 89 c1             	movq	%rax, %rcx
ffff800000115e17: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000115e1b: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115e1e: 0f 84 32 00 00 00    	je	0xffff800000115e56 <lab2_check_4k_paging+0x4c6>
ffff800000115e24: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115e2e: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115e38: 48 b9 d6 8b 11 00 00 80 ff ff	movabsq	$-140737487205418, %rcx # imm = 0xFFFF800000118BD6
ffff800000115e42: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115e4c: 31 c0                	xorl	%eax, %eax
ffff800000115e4e: be 1c 01 00 00       	movl	$284, %esi              # imm = 0x11C
ffff800000115e53: 41 ff d0             	callq	*%r8
ffff800000115e56: e9 00 00 00 00       	jmp	0xffff800000115e5b <lab2_check_4k_paging+0x4cb>
; 	cprintf("[LAB 2] check_4k_paging() succeeded!\n");
ffff800000115e5b: 48 bf a7 85 11 00 00 80 ff ff	movabsq	$-140737487207001, %rdi # imm = 0xFFFF8000001185A7
ffff800000115e65: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115e6f: 31 c0                	xorl	%eax, %eax
ffff800000115e71: ff d1                	callq	*%rcx
; }
ffff800000115e73: 48 83 c4 30          	addq	$48, %rsp
ffff800000115e77: 5d                   	popq	%rbp
ffff800000115e78: c3                   	retq
ffff800000115e79: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115e80 <page2pa>:
; {
ffff800000115e80: 55                   	pushq	%rbp
ffff800000115e81: 48 89 e5             	movq	%rsp, %rbp
ffff800000115e84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000115e88: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115e8c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff800000115e96: 48 8b 09             	movq	(%rcx), %rcx
ffff800000115e99: 48 29 c8             	subq	%rcx, %rax
ffff800000115e9c: 48 c1 f8 05          	sarq	$5, %rax
ffff800000115ea0: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000115ea4: 5d                   	popq	%rbp
ffff800000115ea5: c3                   	retq
ffff800000115ea6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000115eb0 <lab2_check_2m_paging>:
; {
ffff800000115eb0: 55                   	pushq	%rbp
ffff800000115eb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000115eb4: 48 83 ec 30          	subq	$48, %rsp
; 	nfree = count_total_free_pages();
ffff800000115eb8: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000115ec2: ff d0                	callq	*%rax
ffff800000115ec4: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000115ec8: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000115ed2: bf 02 00 00 00       	movl	$2, %edi
ffff800000115ed7: ff d0                	callq	*%rax
ffff800000115ed9: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff800000115edd: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000115ee2: 0f 85 27 00 00 00    	jne	0xffff800000115f0f <lab2_check_2m_paging+0x5f>
; 		panic("cannot allocate 2M page!");
ffff800000115ee8: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115ef2: 48 ba c9 8f 11 00 00 80 ff ff	movabsq	$-140737487204407, %rdx # imm = 0xFFFF800000118FC9
ffff800000115efc: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115f06: 31 c0                	xorl	%eax, %eax
ffff800000115f08: be 2e 01 00 00       	movl	$302, %esi              # imm = 0x12E
ffff800000115f0d: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000115f0f: e9 00 00 00 00       	jmp	0xffff800000115f14 <lab2_check_2m_paging+0x64>
ffff800000115f14: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115f1e: 48 8b 38             	movq	(%rax), %rdi
ffff800000115f21: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000115f25: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000115f2f: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000115f34: b9 01 00 00 00       	movl	$1, %ecx
ffff800000115f39: ff d0                	callq	*%rax
ffff800000115f3b: 83 f8 00             	cmpl	$0, %eax
ffff800000115f3e: 0f 85 32 00 00 00    	jne	0xffff800000115f76 <lab2_check_2m_paging+0xc6>
ffff800000115f44: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115f4e: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115f58: 48 b9 b1 88 11 00 00 80 ff ff	movabsq	$-140737487206223, %rcx # imm = 0xFFFF8000001188B1
ffff800000115f62: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115f6c: 31 c0                	xorl	%eax, %eax
ffff800000115f6e: be 32 01 00 00       	movl	$306, %esi              # imm = 0x132
ffff800000115f73: 41 ff d0             	callq	*%r8
ffff800000115f76: e9 00 00 00 00       	jmp	0xffff800000115f7b <lab2_check_2m_paging+0xcb>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000115f7b: e9 00 00 00 00       	jmp	0xffff800000115f80 <lab2_check_2m_paging+0xd0>
ffff800000115f80: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000115f8a: 48 8b 38             	movq	(%rax), %rdi
ffff800000115f8d: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000115f91: 31 c0                	xorl	%eax, %eax
ffff800000115f93: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000115f9d: 31 c9                	xorl	%ecx, %ecx
ffff800000115f9f: 89 ca                	movl	%ecx, %edx
ffff800000115fa1: b9 01 00 00 00       	movl	$1, %ecx
ffff800000115fa6: ff d0                	callq	*%rax
ffff800000115fa8: 83 f8 00             	cmpl	$0, %eax
ffff800000115fab: 0f 84 32 00 00 00    	je	0xffff800000115fe3 <lab2_check_2m_paging+0x133>
ffff800000115fb1: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000115fbb: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000115fc5: 48 b9 28 90 11 00 00 80 ff ff	movabsq	$-140737487204312, %rcx # imm = 0xFFFF800000119028
ffff800000115fcf: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115fd9: 31 c0                	xorl	%eax, %eax
ffff800000115fdb: be 35 01 00 00       	movl	$309, %esi              # imm = 0x135
ffff800000115fe0: 41 ff d0             	callq	*%r8
ffff800000115fe3: e9 00 00 00 00       	jmp	0xffff800000115fe8 <lab2_check_2m_paging+0x138>
; 	assert(page->pp_ref == 1);
ffff800000115fe8: e9 00 00 00 00       	jmp	0xffff800000115fed <lab2_check_2m_paging+0x13d>
ffff800000115fed: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115ff1: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff800000115ff5: 83 f8 01             	cmpl	$1, %eax
ffff800000115ff8: 0f 84 32 00 00 00    	je	0xffff800000116030 <lab2_check_2m_paging+0x180>
ffff800000115ffe: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116008: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116012: 48 b9 ac 96 11 00 00 80 ff ff	movabsq	$-140737487202644, %rcx # imm = 0xFFFF8000001196AC
ffff80000011601c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116026: 31 c0                	xorl	%eax, %eax
ffff800000116028: be 36 01 00 00       	movl	$310, %esi              # imm = 0x136
ffff80000011602d: 41 ff d0             	callq	*%r8
ffff800000116030: e9 00 00 00 00       	jmp	0xffff800000116035 <lab2_check_2m_paging+0x185>
; 	assert(!page->pp_free);
ffff800000116035: e9 00 00 00 00       	jmp	0xffff80000011603a <lab2_check_2m_paging+0x18a>
ffff80000011603a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011603e: 8a 40 12             	movb	18(%rax), %al
ffff800000116041: c0 e8 07             	shrb	$7, %al
ffff800000116044: 3c 00                	cmpb	$0, %al
ffff800000116046: 0f 84 32 00 00 00    	je	0xffff80000011607e <lab2_check_2m_paging+0x1ce>
ffff80000011604c: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116056: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116060: 48 b9 6f 85 11 00 00 80 ff ff	movabsq	$-140737487207057, %rcx # imm = 0xFFFF80000011856F
ffff80000011606a: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116074: 31 c0                	xorl	%eax, %eax
ffff800000116076: be 37 01 00 00       	movl	$311, %esi              # imm = 0x137
ffff80000011607b: 41 ff d0             	callq	*%r8
ffff80000011607e: e9 00 00 00 00       	jmp	0xffff800000116083 <lab2_check_2m_paging+0x1d3>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000116083: e9 00 00 00 00       	jmp	0xffff800000116088 <lab2_check_2m_paging+0x1d8>
ffff800000116088: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116092: 48 8b 00             	movq	(%rax), %rax
ffff800000116095: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116099: 0f 85 32 00 00 00    	jne	0xffff8000001160d1 <lab2_check_2m_paging+0x221>
ffff80000011609f: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001160a9: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001160b3: 48 b9 f4 87 11 00 00 80 ff ff	movabsq	$-140737487206412, %rcx # imm = 0xFFFF8000001187F4
ffff8000001160bd: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001160c7: 31 c0                	xorl	%eax, %eax
ffff8000001160c9: be 38 01 00 00       	movl	$312, %esi              # imm = 0x138
ffff8000001160ce: 41 ff d0             	callq	*%r8
ffff8000001160d1: e9 00 00 00 00       	jmp	0xffff8000001160d6 <lab2_check_2m_paging+0x226>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff8000001160d6: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001160e0: 48 8b 38             	movq	(%rax), %rdi
ffff8000001160e3: 31 c0                	xorl	%eax, %eax
ffff8000001160e5: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff8000001160ef: 31 c9                	xorl	%ecx, %ecx
ffff8000001160f1: 89 ce                	movl	%ecx, %esi
ffff8000001160f3: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff8000001160f7: ff d0                	callq	*%rax
ffff8000001160f9: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001160fd: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116101: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011610b: 48 23 01             	andq	(%rcx), %rax
ffff80000011610e: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000116114: 0f 84 32 00 00 00    	je	0xffff80000011614c <lab2_check_2m_paging+0x29c>
ffff80000011611a: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116124: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011612e: 48 b9 2b 96 11 00 00 80 ff ff	movabsq	$-140737487202773, %rcx # imm = 0xFFFF80000011962B
ffff800000116138: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116142: 31 c0                	xorl	%eax, %eax
ffff800000116144: be 3c 01 00 00       	movl	$316, %esi              # imm = 0x13C
ffff800000116149: 41 ff d0             	callq	*%r8
ffff80000011614c: e9 00 00 00 00       	jmp	0xffff800000116151 <lab2_check_2m_paging+0x2a1>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000116151: e9 00 00 00 00       	jmp	0xffff800000116156 <lab2_check_2m_paging+0x2a6>
ffff800000116156: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011615a: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000116164: 48 23 01             	andq	(%rcx), %rax
ffff800000116167: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000011616b: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011616f: 48 b8 80 5e 11 00 00 80 ff ff	movabsq	$-140737487217024, %rax # imm = 0xFFFF800000115E80
ffff800000116179: ff d0                	callq	*%rax
ffff80000011617b: 48 89 c1             	movq	%rax, %rcx
ffff80000011617e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000116182: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116185: 0f 84 32 00 00 00    	je	0xffff8000001161bd <lab2_check_2m_paging+0x30d>
ffff80000011618b: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116195: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011619f: 48 b9 e1 8c 11 00 00 80 ff ff	movabsq	$-140737487205151, %rcx # imm = 0xFFFF800000118CE1
ffff8000001161a9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001161b3: 31 c0                	xorl	%eax, %eax
ffff8000001161b5: be 3d 01 00 00       	movl	$317, %esi              # imm = 0x13D
ffff8000001161ba: 41 ff d0             	callq	*%r8
ffff8000001161bd: e9 00 00 00 00       	jmp	0xffff8000001161c2 <lab2_check_2m_paging+0x312>
; 	assert(ret == page);
ffff8000001161c2: e9 00 00 00 00       	jmp	0xffff8000001161c7 <lab2_check_2m_paging+0x317>
ffff8000001161c7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001161cb: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff8000001161cf: 0f 84 32 00 00 00    	je	0xffff800000116207 <lab2_check_2m_paging+0x357>
ffff8000001161d5: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001161df: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001161e9: 48 b9 31 91 11 00 00 80 ff ff	movabsq	$-140737487204047, %rcx # imm = 0xFFFF800000119131
ffff8000001161f3: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001161fd: 31 c0                	xorl	%eax, %eax
ffff8000001161ff: be 3e 01 00 00       	movl	$318, %esi              # imm = 0x13E
ffff800000116204: 41 ff d0             	callq	*%r8
ffff800000116207: e9 00 00 00 00       	jmp	0xffff80000011620c <lab2_check_2m_paging+0x35c>
; 	page_remove(kernel_pml4, 0);
ffff80000011620c: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116216: 48 8b 38             	movq	(%rax), %rdi
ffff800000116219: 31 c0                	xorl	%eax, %eax
ffff80000011621b: 48 b8 50 46 11 00 00 80 ff ff	movabsq	$-140737487223216, %rax # imm = 0xFFFF800000114650
ffff800000116225: 31 c9                	xorl	%ecx, %ecx
ffff800000116227: 89 ce                	movl	%ecx, %esi
ffff800000116229: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff80000011622b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011622f: 8a 40 12             	movb	18(%rax), %al
ffff800000116232: c0 e8 07             	shrb	$7, %al
ffff800000116235: 3c 00                	cmpb	$0, %al
ffff800000116237: 0f 85 32 00 00 00    	jne	0xffff80000011626f <lab2_check_2m_paging+0x3bf>
ffff80000011623d: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116247: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116251: 48 b9 0c 8f 11 00 00 80 ff ff	movabsq	$-140737487204596, %rcx # imm = 0xFFFF800000118F0C
ffff80000011625b: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116265: 31 c0                	xorl	%eax, %eax
ffff800000116267: be 42 01 00 00       	movl	$322, %esi              # imm = 0x142
ffff80000011626c: 41 ff d0             	callq	*%r8
ffff80000011626f: e9 00 00 00 00       	jmp	0xffff800000116274 <lab2_check_2m_paging+0x3c4>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000116274: e9 00 00 00 00       	jmp	0xffff800000116279 <lab2_check_2m_paging+0x3c9>
ffff800000116279: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116283: 48 8b 38             	movq	(%rax), %rdi
ffff800000116286: 31 c0                	xorl	%eax, %eax
ffff800000116288: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000116292: 31 c9                	xorl	%ecx, %ecx
ffff800000116294: 89 ca                	movl	%ecx, %edx
ffff800000116296: 48 89 d6             	movq	%rdx, %rsi
ffff800000116299: ff d0                	callq	*%rax
ffff80000011629b: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011629f: 0f 84 32 00 00 00    	je	0xffff8000001162d7 <lab2_check_2m_paging+0x427>
ffff8000001162a5: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001162af: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001162b9: 48 b9 c3 8a 11 00 00 80 ff ff	movabsq	$-140737487205693, %rcx # imm = 0xFFFF800000118AC3
ffff8000001162c3: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001162cd: 31 c0                	xorl	%eax, %eax
ffff8000001162cf: be 43 01 00 00       	movl	$323, %esi              # imm = 0x143
ffff8000001162d4: 41 ff d0             	callq	*%r8
ffff8000001162d7: e9 00 00 00 00       	jmp	0xffff8000001162dc <lab2_check_2m_paging+0x42c>
; 	assert(kernel_pml4->entries[0] == 0);
ffff8000001162dc: e9 00 00 00 00       	jmp	0xffff8000001162e1 <lab2_check_2m_paging+0x431>
ffff8000001162e1: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001162eb: 48 8b 00             	movq	(%rax), %rax
ffff8000001162ee: 48 83 38 00          	cmpq	$0, (%rax)
ffff8000001162f2: 0f 84 32 00 00 00    	je	0xffff80000011632a <lab2_check_2m_paging+0x47a>
ffff8000001162f8: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116302: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011630c: 48 b9 be 8d 11 00 00 80 ff ff	movabsq	$-140737487204930, %rcx # imm = 0xFFFF800000118DBE
ffff800000116316: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116320: 31 c0                	xorl	%eax, %eax
ffff800000116322: be 46 01 00 00       	movl	$326, %esi              # imm = 0x146
ffff800000116327: 41 ff d0             	callq	*%r8
ffff80000011632a: e9 00 00 00 00       	jmp	0xffff80000011632f <lab2_check_2m_paging+0x47f>
; 	assert(nfree == count_total_free_pages());
ffff80000011632f: e9 00 00 00 00       	jmp	0xffff800000116334 <lab2_check_2m_paging+0x484>
ffff800000116334: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000116338: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011633c: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000116346: ff d0                	callq	*%rax
ffff800000116348: 48 89 c1             	movq	%rax, %rcx
ffff80000011634b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011634f: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116352: 0f 84 32 00 00 00    	je	0xffff80000011638a <lab2_check_2m_paging+0x4da>
ffff800000116358: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116362: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011636c: 48 b9 d6 8b 11 00 00 80 ff ff	movabsq	$-140737487205418, %rcx # imm = 0xFFFF800000118BD6
ffff800000116376: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116380: 31 c0                	xorl	%eax, %eax
ffff800000116382: be 49 01 00 00       	movl	$329, %esi              # imm = 0x149
ffff800000116387: 41 ff d0             	callq	*%r8
ffff80000011638a: e9 00 00 00 00       	jmp	0xffff80000011638f <lab2_check_2m_paging+0x4df>
; 	cprintf("[LAB 2] check_2m_paging() succeeded!\n");
ffff80000011638f: 48 bf 5d 90 11 00 00 80 ff ff	movabsq	$-140737487204259, %rdi # imm = 0xFFFF80000011905D
ffff800000116399: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001163a3: 31 c0                	xorl	%eax, %eax
ffff8000001163a5: ff d1                	callq	*%rcx
; }
ffff8000001163a7: 48 83 c4 30          	addq	$48, %rsp
ffff8000001163ab: 5d                   	popq	%rbp
ffff8000001163ac: c3                   	retq
ffff8000001163ad: 0f 1f 00             	nopl	(%rax)

ffff8000001163b0 <ismemset>:
; {
ffff8000001163b0: 55                   	pushq	%rbp
ffff8000001163b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001163b4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001163b8: 89 75 ec             	movl	%esi, -20(%rbp)
ffff8000001163bb: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	unsigned char *p = s;
ffff8000001163bf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001163c3: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < n; ++i, ++p) {
ffff8000001163c7: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001163cf: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001163d3: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff8000001163d7: 0f 83 3e 00 00 00    	jae	0xffff80000011641b <ismemset+0x6b>
; 		if (*p != c) {
ffff8000001163dd: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001163e1: 0f b6 00             	movzbl	(%rax), %eax
ffff8000001163e4: 3b 45 ec             	cmpl	-20(%rbp), %eax
ffff8000001163e7: 0f 84 0c 00 00 00    	je	0xffff8000001163f9 <ismemset+0x49>
; 			return 0;
ffff8000001163ed: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001163f4: e9 29 00 00 00       	jmp	0xffff800000116422 <ismemset+0x72>
; 	}
ffff8000001163f9: e9 00 00 00 00       	jmp	0xffff8000001163fe <ismemset+0x4e>
; 	for (i = 0; i < n; ++i, ++p) {
ffff8000001163fe: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116402: 48 83 c0 01          	addq	$1, %rax
ffff800000116406: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011640a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011640e: 48 83 c0 01          	addq	$1, %rax
ffff800000116412: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000116416: e9 b4 ff ff ff       	jmp	0xffff8000001163cf <ismemset+0x1f>
; 	return 1;
ffff80000011641b: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
; }
ffff800000116422: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000116425: 5d                   	popq	%rbp
ffff800000116426: c3                   	retq
ffff800000116427: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000116430 <lab2_check_transparent_2m_paging>:
; {
ffff800000116430: 55                   	pushq	%rbp
ffff800000116431: 48 89 e5             	movq	%rsp, %rbp
ffff800000116434: 48 83 ec 50          	subq	$80, %rsp
; 	nfree = count_total_free_pages();
ffff800000116438: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000116442: ff d0                	callq	*%rax
ffff800000116444: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000116448: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000116452: bf 02 00 00 00       	movl	$2, %edi
ffff800000116457: ff d0                	callq	*%rax
ffff800000116459: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff80000011645d: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000116462: 0f 85 27 00 00 00    	jne	0xffff80000011648f <lab2_check_transparent_2m_paging+0x5f>
; 		panic("cannot allocate 2M page!");
ffff800000116468: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116472: 48 ba c9 8f 11 00 00 80 ff ff	movabsq	$-140737487204407, %rdx # imm = 0xFFFF800000118FC9
ffff80000011647c: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116486: 31 c0                	xorl	%eax, %eax
ffff800000116488: be 6b 01 00 00       	movl	$363, %esi              # imm = 0x16B
ffff80000011648d: ff d1                	callq	*%rcx
; 	data = page2kva(page);
ffff80000011648f: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116493: 48 b8 c0 6e 11 00 00 80 ff ff	movabsq	$-140737487212864, %rax # imm = 0xFFFF800000116EC0
ffff80000011649d: ff d0                	callq	*%rax
ffff80000011649f: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff8000001164a3: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001164ab: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff8000001164b3: 0f 83 40 00 00 00    	jae	0xffff8000001164f9 <lab2_check_transparent_2m_paging+0xc9>
; 		memset(data, i & 0xff, PAGE_SIZE);
ffff8000001164b9: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001164bd: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001164c1: 48 25 ff 00 00 00    	andq	$255, %rax
ffff8000001164c7: 89 c6                	movl	%eax, %esi
ffff8000001164c9: 48 b8 00 28 11 00 00 80 ff ff	movabsq	$-140737487230976, %rax # imm = 0xFFFF800000112800
ffff8000001164d3: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001164d8: ff d0                	callq	*%rax
; 		data += PAGE_SIZE;
ffff8000001164da: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001164de: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff8000001164e4: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff8000001164e8: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001164ec: 48 83 c0 01          	addq	$1, %rax
ffff8000001164f0: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001164f4: e9 b2 ff ff ff       	jmp	0xffff8000001164ab <lab2_check_transparent_2m_paging+0x7b>
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff8000001164f9: e9 00 00 00 00       	jmp	0xffff8000001164fe <lab2_check_transparent_2m_paging+0xce>
ffff8000001164fe: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116508: 48 8b 38             	movq	(%rax), %rdi
ffff80000011650b: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000011650f: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000116519: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011651e: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116523: ff d0                	callq	*%rax
ffff800000116525: 83 f8 00             	cmpl	$0, %eax
ffff800000116528: 0f 85 32 00 00 00    	jne	0xffff800000116560 <lab2_check_transparent_2m_paging+0x130>
ffff80000011652e: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116538: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116542: 48 b9 b1 88 11 00 00 80 ff ff	movabsq	$-140737487206223, %rcx # imm = 0xFFFF8000001188B1
ffff80000011654c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116556: 31 c0                	xorl	%eax, %eax
ffff800000116558: be 77 01 00 00       	movl	$375, %esi              # imm = 0x177
ffff80000011655d: 41 ff d0             	callq	*%r8
ffff800000116560: e9 00 00 00 00       	jmp	0xffff800000116565 <lab2_check_transparent_2m_paging+0x135>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000116565: e9 00 00 00 00       	jmp	0xffff80000011656a <lab2_check_transparent_2m_paging+0x13a>
ffff80000011656a: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116574: 48 8b 38             	movq	(%rax), %rdi
ffff800000116577: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000011657b: 31 c0                	xorl	%eax, %eax
ffff80000011657d: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000116587: 31 c9                	xorl	%ecx, %ecx
ffff800000116589: 89 ca                	movl	%ecx, %edx
ffff80000011658b: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116590: ff d0                	callq	*%rax
ffff800000116592: 83 f8 00             	cmpl	$0, %eax
ffff800000116595: 0f 84 32 00 00 00    	je	0xffff8000001165cd <lab2_check_transparent_2m_paging+0x19d>
ffff80000011659b: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001165a5: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001165af: 48 b9 28 90 11 00 00 80 ff ff	movabsq	$-140737487204312, %rcx # imm = 0xFFFF800000119028
ffff8000001165b9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001165c3: 31 c0                	xorl	%eax, %eax
ffff8000001165c5: be 7a 01 00 00       	movl	$378, %esi              # imm = 0x17A
ffff8000001165ca: 41 ff d0             	callq	*%r8
ffff8000001165cd: e9 00 00 00 00       	jmp	0xffff8000001165d2 <lab2_check_transparent_2m_paging+0x1a2>
; 	assert(page->pp_ref == 1);
ffff8000001165d2: e9 00 00 00 00       	jmp	0xffff8000001165d7 <lab2_check_transparent_2m_paging+0x1a7>
ffff8000001165d7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001165db: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff8000001165df: 83 f8 01             	cmpl	$1, %eax
ffff8000001165e2: 0f 84 32 00 00 00    	je	0xffff80000011661a <lab2_check_transparent_2m_paging+0x1ea>
ffff8000001165e8: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001165f2: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001165fc: 48 b9 ac 96 11 00 00 80 ff ff	movabsq	$-140737487202644, %rcx # imm = 0xFFFF8000001196AC
ffff800000116606: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116610: 31 c0                	xorl	%eax, %eax
ffff800000116612: be 7b 01 00 00       	movl	$379, %esi              # imm = 0x17B
ffff800000116617: 41 ff d0             	callq	*%r8
ffff80000011661a: e9 00 00 00 00       	jmp	0xffff80000011661f <lab2_check_transparent_2m_paging+0x1ef>
; 	assert(!page->pp_free);
ffff80000011661f: e9 00 00 00 00       	jmp	0xffff800000116624 <lab2_check_transparent_2m_paging+0x1f4>
ffff800000116624: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116628: 8a 40 12             	movb	18(%rax), %al
ffff80000011662b: c0 e8 07             	shrb	$7, %al
ffff80000011662e: 3c 00                	cmpb	$0, %al
ffff800000116630: 0f 84 32 00 00 00    	je	0xffff800000116668 <lab2_check_transparent_2m_paging+0x238>
ffff800000116636: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116640: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011664a: 48 b9 6f 85 11 00 00 80 ff ff	movabsq	$-140737487207057, %rcx # imm = 0xFFFF80000011856F
ffff800000116654: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011665e: 31 c0                	xorl	%eax, %eax
ffff800000116660: be 7c 01 00 00       	movl	$380, %esi              # imm = 0x17C
ffff800000116665: 41 ff d0             	callq	*%r8
ffff800000116668: e9 00 00 00 00       	jmp	0xffff80000011666d <lab2_check_transparent_2m_paging+0x23d>
; 	assert(kernel_pml4->entries[0] != 0);
ffff80000011666d: e9 00 00 00 00       	jmp	0xffff800000116672 <lab2_check_transparent_2m_paging+0x242>
ffff800000116672: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000011667c: 48 8b 00             	movq	(%rax), %rax
ffff80000011667f: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116683: 0f 85 32 00 00 00    	jne	0xffff8000001166bb <lab2_check_transparent_2m_paging+0x28b>
ffff800000116689: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116693: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011669d: 48 b9 f4 87 11 00 00 80 ff ff	movabsq	$-140737487206412, %rcx # imm = 0xFFFF8000001187F4
ffff8000001166a7: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001166b1: 31 c0                	xorl	%eax, %eax
ffff8000001166b3: be 7d 01 00 00       	movl	$381, %esi              # imm = 0x17D
ffff8000001166b8: 41 ff d0             	callq	*%r8
ffff8000001166bb: e9 00 00 00 00       	jmp	0xffff8000001166c0 <lab2_check_transparent_2m_paging+0x290>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff8000001166c0: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001166ca: 48 8b 38             	movq	(%rax), %rdi
ffff8000001166cd: 31 c0                	xorl	%eax, %eax
ffff8000001166cf: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff8000001166d9: 31 c9                	xorl	%ecx, %ecx
ffff8000001166db: 89 ce                	movl	%ecx, %esi
ffff8000001166dd: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff8000001166e1: ff d0                	callq	*%rax
ffff8000001166e3: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001166e7: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001166eb: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001166f5: 48 23 01             	andq	(%rcx), %rax
ffff8000001166f8: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff8000001166fe: 0f 84 32 00 00 00    	je	0xffff800000116736 <lab2_check_transparent_2m_paging+0x306>
ffff800000116704: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011670e: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116718: 48 b9 2b 96 11 00 00 80 ff ff	movabsq	$-140737487202773, %rcx # imm = 0xFFFF80000011962B
ffff800000116722: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011672c: 31 c0                	xorl	%eax, %eax
ffff80000011672e: be 81 01 00 00       	movl	$385, %esi              # imm = 0x181
ffff800000116733: 41 ff d0             	callq	*%r8
ffff800000116736: e9 00 00 00 00       	jmp	0xffff80000011673b <lab2_check_transparent_2m_paging+0x30b>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff80000011673b: e9 00 00 00 00       	jmp	0xffff800000116740 <lab2_check_transparent_2m_paging+0x310>
ffff800000116740: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116744: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff80000011674e: 48 23 01             	andq	(%rcx), %rax
ffff800000116751: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000116755: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116759: 48 b8 80 5e 11 00 00 80 ff ff	movabsq	$-140737487217024, %rax # imm = 0xFFFF800000115E80
ffff800000116763: ff d0                	callq	*%rax
ffff800000116765: 48 89 c1             	movq	%rax, %rcx
ffff800000116768: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000011676c: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011676f: 0f 84 32 00 00 00    	je	0xffff8000001167a7 <lab2_check_transparent_2m_paging+0x377>
ffff800000116775: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011677f: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116789: 48 b9 e1 8c 11 00 00 80 ff ff	movabsq	$-140737487205151, %rcx # imm = 0xFFFF800000118CE1
ffff800000116793: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011679d: 31 c0                	xorl	%eax, %eax
ffff80000011679f: be 82 01 00 00       	movl	$386, %esi              # imm = 0x182
ffff8000001167a4: 41 ff d0             	callq	*%r8
ffff8000001167a7: e9 00 00 00 00       	jmp	0xffff8000001167ac <lab2_check_transparent_2m_paging+0x37c>
; 	assert(ret == page);
ffff8000001167ac: e9 00 00 00 00       	jmp	0xffff8000001167b1 <lab2_check_transparent_2m_paging+0x381>
ffff8000001167b1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001167b5: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff8000001167b9: 0f 84 32 00 00 00    	je	0xffff8000001167f1 <lab2_check_transparent_2m_paging+0x3c1>
ffff8000001167bf: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001167c9: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001167d3: 48 b9 31 91 11 00 00 80 ff ff	movabsq	$-140737487204047, %rcx # imm = 0xFFFF800000119131
ffff8000001167dd: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001167e7: 31 c0                	xorl	%eax, %eax
ffff8000001167e9: be 83 01 00 00       	movl	$387, %esi              # imm = 0x183
ffff8000001167ee: 41 ff d0             	callq	*%r8
ffff8000001167f1: e9 00 00 00 00       	jmp	0xffff8000001167f6 <lab2_check_transparent_2m_paging+0x3c6>
; 	unmap_page_range(kernel_pml4, (void *)PAGE_SIZE, PAGE_SIZE);
ffff8000001167f6: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116800: 48 8b 38             	movq	(%rax), %rdi
ffff800000116803: 48 b8 90 44 11 00 00 80 ff ff	movabsq	$-140737487223664, %rax # imm = 0xFFFF800000114490
ffff80000011680d: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116812: 48 89 d6             	movq	%rdx, %rsi
ffff800000116815: ff d0                	callq	*%rax
; 	addr = NULL;
ffff800000116817: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff80000011681f: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000116827: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff80000011682f: 0f 83 43 03 00 00    	jae	0xffff800000116b78 <lab2_check_transparent_2m_paging+0x748>
; 		entry = NULL;
ffff800000116835: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
; 		ret = page_lookup(kernel_pml4, addr, &entry);
ffff80000011683d: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116847: 48 8b 38             	movq	(%rax), %rdi
ffff80000011684a: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff80000011684e: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000116858: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff80000011685c: ff d0                	callq	*%rax
ffff80000011685e: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		if (addr == (void *)PAGE_SIZE) {
ffff800000116862: b8 00 10 00 00       	movl	$4096, %eax             # imm = 0x1000
ffff800000116867: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff80000011686b: 0f 85 93 00 00 00    	jne	0xffff800000116904 <lab2_check_transparent_2m_paging+0x4d4>
; 			assert(!ret);
ffff800000116871: e9 00 00 00 00       	jmp	0xffff800000116876 <lab2_check_transparent_2m_paging+0x446>
ffff800000116876: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011687b: 0f 84 32 00 00 00    	je	0xffff8000001168b3 <lab2_check_transparent_2m_paging+0x483>
ffff800000116881: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011688b: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116895: 48 b9 d0 86 11 00 00 80 ff ff	movabsq	$-140737487206704, %rcx # imm = 0xFFFF8000001186D0
ffff80000011689f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001168a9: 31 c0                	xorl	%eax, %eax
ffff8000001168ab: be 90 01 00 00       	movl	$400, %esi              # imm = 0x190
ffff8000001168b0: 41 ff d0             	callq	*%r8
ffff8000001168b3: e9 00 00 00 00       	jmp	0xffff8000001168b8 <lab2_check_transparent_2m_paging+0x488>
; 			assert(!entry);
ffff8000001168b8: e9 00 00 00 00       	jmp	0xffff8000001168bd <lab2_check_transparent_2m_paging+0x48d>
ffff8000001168bd: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff8000001168c2: 0f 84 32 00 00 00    	je	0xffff8000001168fa <lab2_check_transparent_2m_paging+0x4ca>
ffff8000001168c8: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001168d2: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001168dc: 48 b9 d5 86 11 00 00 80 ff ff	movabsq	$-140737487206699, %rcx # imm = 0xFFFF8000001186D5
ffff8000001168e6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001168f0: 31 c0                	xorl	%eax, %eax
ffff8000001168f2: be 91 01 00 00       	movl	$401, %esi              # imm = 0x191
ffff8000001168f7: 41 ff d0             	callq	*%r8
ffff8000001168fa: e9 00 00 00 00       	jmp	0xffff8000001168ff <lab2_check_transparent_2m_paging+0x4cf>
; 		} else {
ffff8000001168ff: e9 50 02 00 00       	jmp	0xffff800000116b54 <lab2_check_transparent_2m_paging+0x724>
; 			assert(ret);
ffff800000116904: e9 00 00 00 00       	jmp	0xffff800000116909 <lab2_check_transparent_2m_paging+0x4d9>
ffff800000116909: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011690e: 0f 85 32 00 00 00    	jne	0xffff800000116946 <lab2_check_transparent_2m_paging+0x516>
ffff800000116914: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011691e: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116928: 48 b9 1a 8f 11 00 00 80 ff ff	movabsq	$-140737487204582, %rcx # imm = 0xFFFF800000118F1A
ffff800000116932: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011693c: 31 c0                	xorl	%eax, %eax
ffff80000011693e: be 93 01 00 00       	movl	$403, %esi              # imm = 0x193
ffff800000116943: 41 ff d0             	callq	*%r8
ffff800000116946: e9 00 00 00 00       	jmp	0xffff80000011694b <lab2_check_transparent_2m_paging+0x51b>
; 			assert(entry);
ffff80000011694b: e9 00 00 00 00       	jmp	0xffff800000116950 <lab2_check_transparent_2m_paging+0x520>
ffff800000116950: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000116955: 0f 85 32 00 00 00    	jne	0xffff80000011698d <lab2_check_transparent_2m_paging+0x55d>
ffff80000011695b: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116965: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff80000011696f: 48 b9 04 8d 11 00 00 80 ff ff	movabsq	$-140737487205116, %rcx # imm = 0xFFFF800000118D04
ffff800000116979: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116983: 31 c0                	xorl	%eax, %eax
ffff800000116985: be 94 01 00 00       	movl	$404, %esi              # imm = 0x194
ffff80000011698a: 41 ff d0             	callq	*%r8
ffff80000011698d: e9 00 00 00 00       	jmp	0xffff800000116992 <lab2_check_transparent_2m_paging+0x562>
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000116992: e9 00 00 00 00       	jmp	0xffff800000116997 <lab2_check_transparent_2m_paging+0x567>
ffff800000116997: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011699b: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001169a5: 48 23 01             	andq	(%rcx), %rax
ffff8000001169a8: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001169ac: 0f 84 32 00 00 00    	je	0xffff8000001169e4 <lab2_check_transparent_2m_paging+0x5b4>
ffff8000001169b2: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001169bc: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff8000001169c6: 48 b9 5c 94 11 00 00 80 ff ff	movabsq	$-140737487203236, %rcx # imm = 0xFFFF80000011945C
ffff8000001169d0: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001169da: 31 c0                	xorl	%eax, %eax
ffff8000001169dc: be 95 01 00 00       	movl	$405, %esi              # imm = 0x195
ffff8000001169e1: 41 ff d0             	callq	*%r8
ffff8000001169e4: e9 00 00 00 00       	jmp	0xffff8000001169e9 <lab2_check_transparent_2m_paging+0x5b9>
; 			page = pa2page(PAGE_ADDR(*entry));
ffff8000001169e9: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001169ed: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff8000001169f7: 48 23 38             	andq	(%rax), %rdi
ffff8000001169fa: 48 b8 00 6f 11 00 00 80 ff ff	movabsq	$-140737487212800, %rax # imm = 0xFFFF800000116F00
ffff800000116a04: ff d0                	callq	*%rax
ffff800000116a06: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			assert(page->pp_order == 0);
ffff800000116a0a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116a0e: 8a 40 12             	movb	18(%rax), %al
ffff800000116a11: 24 7f                	andb	$127, %al
ffff800000116a13: 0f b6 c0             	movzbl	%al, %eax
ffff800000116a16: 83 f8 00             	cmpl	$0, %eax
ffff800000116a19: 0f 84 32 00 00 00    	je	0xffff800000116a51 <lab2_check_transparent_2m_paging+0x621>
ffff800000116a1f: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116a29: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116a33: 48 b9 be 96 11 00 00 80 ff ff	movabsq	$-140737487202626, %rcx # imm = 0xFFFF8000001196BE
ffff800000116a3d: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116a47: 31 c0                	xorl	%eax, %eax
ffff800000116a49: be 97 01 00 00       	movl	$407, %esi              # imm = 0x197
ffff800000116a4e: 41 ff d0             	callq	*%r8
ffff800000116a51: e9 00 00 00 00       	jmp	0xffff800000116a56 <lab2_check_transparent_2m_paging+0x626>
; 			assert(!page->pp_free);
ffff800000116a56: e9 00 00 00 00       	jmp	0xffff800000116a5b <lab2_check_transparent_2m_paging+0x62b>
ffff800000116a5b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116a5f: 8a 40 12             	movb	18(%rax), %al
ffff800000116a62: c0 e8 07             	shrb	$7, %al
ffff800000116a65: 3c 00                	cmpb	$0, %al
ffff800000116a67: 0f 84 32 00 00 00    	je	0xffff800000116a9f <lab2_check_transparent_2m_paging+0x66f>
ffff800000116a6d: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116a77: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116a81: 48 b9 6f 85 11 00 00 80 ff ff	movabsq	$-140737487207057, %rcx # imm = 0xFFFF80000011856F
ffff800000116a8b: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116a95: 31 c0                	xorl	%eax, %eax
ffff800000116a97: be 98 01 00 00       	movl	$408, %esi              # imm = 0x198
ffff800000116a9c: 41 ff d0             	callq	*%r8
ffff800000116a9f: e9 00 00 00 00       	jmp	0xffff800000116aa4 <lab2_check_transparent_2m_paging+0x674>
; 			assert(list_is_empty(&page->pp_node));
ffff800000116aa4: e9 00 00 00 00       	jmp	0xffff800000116aa9 <lab2_check_transparent_2m_paging+0x679>
ffff800000116aa9: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116aad: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff800000116ab7: ff d0                	callq	*%rax
ffff800000116ab9: 83 f8 00             	cmpl	$0, %eax
ffff800000116abc: 0f 85 32 00 00 00    	jne	0xffff800000116af4 <lab2_check_transparent_2m_paging+0x6c4>
ffff800000116ac2: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116acc: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116ad6: 48 b9 4f 93 11 00 00 80 ff ff	movabsq	$-140737487203505, %rcx # imm = 0xFFFF80000011934F
ffff800000116ae0: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116aea: 31 c0                	xorl	%eax, %eax
ffff800000116aec: be 99 01 00 00       	movl	$409, %esi              # imm = 0x199
ffff800000116af1: 41 ff d0             	callq	*%r8
ffff800000116af4: e9 00 00 00 00       	jmp	0xffff800000116af9 <lab2_check_transparent_2m_paging+0x6c9>
; 			if (!ismemset(addr, (i & 0xff), PAGE_SIZE)) {
ffff800000116af9: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000116afd: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116b01: 48 25 ff 00 00 00    	andq	$255, %rax
ffff800000116b07: 89 c6                	movl	%eax, %esi
ffff800000116b09: 48 b8 b0 63 11 00 00 80 ff ff	movabsq	$-140737487215696, %rax # imm = 0xFFFF8000001163B0
ffff800000116b13: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116b18: ff d0                	callq	*%rax
ffff800000116b1a: 83 f8 00             	cmpl	$0, %eax
ffff800000116b1d: 0f 85 2c 00 00 00    	jne	0xffff800000116b4f <lab2_check_transparent_2m_paging+0x71f>
; 				panic("page %p is corrupt", addr);
ffff800000116b23: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000116b27: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116b31: 48 ba e6 8a 11 00 00 80 ff ff	movabsq	$-140737487205658, %rdx # imm = 0xFFFF800000118AE6
ffff800000116b3b: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116b45: 31 c0                	xorl	%eax, %eax
ffff800000116b47: be 9c 01 00 00       	movl	$412, %esi              # imm = 0x19C
ffff800000116b4c: 41 ff d0             	callq	*%r8
ffff800000116b4f: e9 00 00 00 00       	jmp	0xffff800000116b54 <lab2_check_transparent_2m_paging+0x724>
; 	}
ffff800000116b54: e9 00 00 00 00       	jmp	0xffff800000116b59 <lab2_check_transparent_2m_paging+0x729>
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff800000116b59: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116b5d: 48 83 c0 01          	addq	$1, %rax
ffff800000116b61: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000116b65: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000116b69: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff800000116b6f: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000116b73: e9 af fc ff ff       	jmp	0xffff800000116827 <lab2_check_transparent_2m_paging+0x3f7>
; 	page = page_alloc(0);
ffff800000116b78: 31 c0                	xorl	%eax, %eax
ffff800000116b7a: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000116b84: 31 ff                	xorl	%edi, %edi
ffff800000116b86: ff d0                	callq	*%rax
ffff800000116b88: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff800000116b8c: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000116b91: 0f 85 27 00 00 00    	jne	0xffff800000116bbe <lab2_check_transparent_2m_paging+0x78e>
; 		panic("cannot allocate 4K page!");
ffff800000116b97: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116ba1: 48 ba 36 93 11 00 00 80 ff ff	movabsq	$-140737487203530, %rdx # imm = 0xFFFF800000119336
ffff800000116bab: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116bb5: 31 c0                	xorl	%eax, %eax
ffff800000116bb7: be a5 01 00 00       	movl	$421, %esi              # imm = 0x1A5
ffff800000116bbc: ff d1                	callq	*%rcx
; 	data = page2kva(page);
ffff800000116bbe: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116bc2: 48 b8 c0 6e 11 00 00 80 ff ff	movabsq	$-140737487212864, %rax # imm = 0xFFFF800000116EC0
ffff800000116bcc: ff d0                	callq	*%rax
ffff800000116bce: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	memset(data, 1, PAGE_SIZE);
ffff800000116bd2: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000116bd6: 48 b8 00 28 11 00 00 80 ff ff	movabsq	$-140737487230976, %rax # imm = 0xFFFF800000112800
ffff800000116be0: be 01 00 00 00       	movl	$1, %esi
ffff800000116be5: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116bea: ff d0                	callq	*%rax
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff800000116bec: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116bf6: 48 8b 38             	movq	(%rax), %rdi
ffff800000116bf9: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000116bfd: 48 b8 80 31 11 00 00 80 ff ff	movabsq	$-140737487228544, %rax # imm = 0xFFFF800000113180
ffff800000116c07: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116c0c: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116c11: ff d0                	callq	*%rax
ffff800000116c13: 83 f8 00             	cmpl	$0, %eax
ffff800000116c16: 0f 84 32 00 00 00    	je	0xffff800000116c4e <lab2_check_transparent_2m_paging+0x81e>
ffff800000116c1c: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116c26: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116c30: 48 b9 8a 8e 11 00 00 80 ff ff	movabsq	$-140737487204726, %rcx # imm = 0xFFFF800000118E8A
ffff800000116c3a: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116c44: 31 c0                	xorl	%eax, %eax
ffff800000116c46: be ad 01 00 00       	movl	$429, %esi              # imm = 0x1AD
ffff800000116c4b: 41 ff d0             	callq	*%r8
ffff800000116c4e: e9 00 00 00 00       	jmp	0xffff800000116c53 <lab2_check_transparent_2m_paging+0x823>
; 	page_lookup(kernel_pml4, 0, &entry);
ffff800000116c53: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116c5d: 48 8b 38             	movq	(%rax), %rdi
ffff800000116c60: 31 c0                	xorl	%eax, %eax
ffff800000116c62: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000116c6c: 31 c9                	xorl	%ecx, %ecx
ffff800000116c6e: 89 ce                	movl	%ecx, %esi
ffff800000116c70: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000116c74: ff d0                	callq	*%rax
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000116c76: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116c7a: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000116c84: 48 23 01             	andq	(%rcx), %rax
ffff800000116c87: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000116c8d: 0f 84 32 00 00 00    	je	0xffff800000116cc5 <lab2_check_transparent_2m_paging+0x895>
ffff800000116c93: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116c9d: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116ca7: 48 b9 2b 96 11 00 00 80 ff ff	movabsq	$-140737487202773, %rcx # imm = 0xFFFF80000011962B
ffff800000116cb1: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116cbb: 31 c0                	xorl	%eax, %eax
ffff800000116cbd: be b1 01 00 00       	movl	$433, %esi              # imm = 0x1B1
ffff800000116cc2: 41 ff d0             	callq	*%r8
ffff800000116cc5: e9 00 00 00 00       	jmp	0xffff800000116cca <lab2_check_transparent_2m_paging+0x89a>
; 	data = NULL;
ffff800000116cca: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116cd2: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000116cda: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff800000116ce2: 0f 83 73 00 00 00    	jae	0xffff800000116d5b <lab2_check_transparent_2m_paging+0x92b>
; 		if (!ismemset(data, i & 0xff, PAGE_SIZE)) {
ffff800000116ce8: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000116cec: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116cf0: 48 25 ff 00 00 00    	andq	$255, %rax
ffff800000116cf6: 89 c6                	movl	%eax, %esi
ffff800000116cf8: 48 b8 b0 63 11 00 00 80 ff ff	movabsq	$-140737487215696, %rax # imm = 0xFFFF8000001163B0
ffff800000116d02: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116d07: ff d0                	callq	*%rax
ffff800000116d09: 83 f8 00             	cmpl	$0, %eax
ffff800000116d0c: 0f 85 2a 00 00 00    	jne	0xffff800000116d3c <lab2_check_transparent_2m_paging+0x90c>
; 			panic("page %p is corrupt\n", NULL);
ffff800000116d12: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116d1c: 48 ba 15 8e 11 00 00 80 ff ff	movabsq	$-140737487204843, %rdx # imm = 0xFFFF800000118E15
ffff800000116d26: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116d30: 31 c0                	xorl	%eax, %eax
ffff800000116d32: 89 c1                	movl	%eax, %ecx
ffff800000116d34: be b8 01 00 00       	movl	$440, %esi              # imm = 0x1B8
ffff800000116d39: 41 ff d0             	callq	*%r8
; 		data += PAGE_SIZE;
ffff800000116d3c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000116d40: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff800000116d46: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116d4a: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116d4e: 48 83 c0 01          	addq	$1, %rax
ffff800000116d52: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000116d56: e9 7f ff ff ff       	jmp	0xffff800000116cda <lab2_check_transparent_2m_paging+0x8aa>
; 	unmap_page_range(kernel_pml4, 0, HPAGE_SIZE);
ffff800000116d5b: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116d65: 48 8b 38             	movq	(%rax), %rdi
ffff800000116d68: 31 c0                	xorl	%eax, %eax
ffff800000116d6a: 48 b8 90 44 11 00 00 80 ff ff	movabsq	$-140737487223664, %rax # imm = 0xFFFF800000114490
ffff800000116d74: 31 c9                	xorl	%ecx, %ecx
ffff800000116d76: 89 ce                	movl	%ecx, %esi
ffff800000116d78: ba 00 00 20 00       	movl	$2097152, %edx          # imm = 0x200000
ffff800000116d7d: ff d0                	callq	*%rax
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000116d7f: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116d89: 48 8b 38             	movq	(%rax), %rdi
ffff800000116d8c: 31 c0                	xorl	%eax, %eax
ffff800000116d8e: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000116d98: 31 c9                	xorl	%ecx, %ecx
ffff800000116d9a: 89 ca                	movl	%ecx, %edx
ffff800000116d9c: 48 89 d6             	movq	%rdx, %rsi
ffff800000116d9f: ff d0                	callq	*%rax
ffff800000116da1: 48 83 f8 00          	cmpq	$0, %rax
ffff800000116da5: 0f 84 32 00 00 00    	je	0xffff800000116ddd <lab2_check_transparent_2m_paging+0x9ad>
ffff800000116dab: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116db5: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116dbf: 48 b9 c3 8a 11 00 00 80 ff ff	movabsq	$-140737487205693, %rcx # imm = 0xFFFF800000118AC3
ffff800000116dc9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116dd3: 31 c0                	xorl	%eax, %eax
ffff800000116dd5: be c0 01 00 00       	movl	$448, %esi              # imm = 0x1C0
ffff800000116dda: 41 ff d0             	callq	*%r8
ffff800000116ddd: e9 00 00 00 00       	jmp	0xffff800000116de2 <lab2_check_transparent_2m_paging+0x9b2>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000116de2: e9 00 00 00 00       	jmp	0xffff800000116de7 <lab2_check_transparent_2m_paging+0x9b7>
ffff800000116de7: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff800000116df1: 48 8b 00             	movq	(%rax), %rax
ffff800000116df4: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116df8: 0f 84 32 00 00 00    	je	0xffff800000116e30 <lab2_check_transparent_2m_paging+0xa00>
ffff800000116dfe: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116e08: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116e12: 48 b9 be 8d 11 00 00 80 ff ff	movabsq	$-140737487204930, %rcx # imm = 0xFFFF800000118DBE
ffff800000116e1c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116e26: 31 c0                	xorl	%eax, %eax
ffff800000116e28: be c3 01 00 00       	movl	$451, %esi              # imm = 0x1C3
ffff800000116e2d: 41 ff d0             	callq	*%r8
ffff800000116e30: e9 00 00 00 00       	jmp	0xffff800000116e35 <lab2_check_transparent_2m_paging+0xa05>
; 	assert(nfree == count_total_free_pages());
ffff800000116e35: e9 00 00 00 00       	jmp	0xffff800000116e3a <lab2_check_transparent_2m_paging+0xa0a>
ffff800000116e3a: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff800000116e3e: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000116e42: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000116e4c: ff d0                	callq	*%rax
ffff800000116e4e: 48 89 c1             	movq	%rax, %rcx
ffff800000116e51: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff800000116e55: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116e58: 0f 84 32 00 00 00    	je	0xffff800000116e90 <lab2_check_transparent_2m_paging+0xa60>
ffff800000116e5e: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000116e68: 48 ba 8d 8b 11 00 00 80 ff ff	movabsq	$-140737487205491, %rdx # imm = 0xFFFF800000118B8D
ffff800000116e72: 48 b9 d6 8b 11 00 00 80 ff ff	movabsq	$-140737487205418, %rcx # imm = 0xFFFF800000118BD6
ffff800000116e7c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116e86: 31 c0                	xorl	%eax, %eax
ffff800000116e88: be c6 01 00 00       	movl	$454, %esi              # imm = 0x1C6
ffff800000116e8d: 41 ff d0             	callq	*%r8
ffff800000116e90: e9 00 00 00 00       	jmp	0xffff800000116e95 <lab2_check_transparent_2m_paging+0xa65>
; 	cprintf("[LAB 2] check_transparent_2m_paging() succeeded!\n");
ffff800000116e95: 48 bf f8 8b 11 00 00 80 ff ff	movabsq	$-140737487205384, %rdi # imm = 0xFFFF800000118BF8
ffff800000116e9f: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000116ea9: 31 c0                	xorl	%eax, %eax
ffff800000116eab: ff d1                	callq	*%rcx
; }
ffff800000116ead: 48 83 c4 50          	addq	$80, %rsp
ffff800000116eb1: 5d                   	popq	%rbp
ffff800000116eb2: c3                   	retq
ffff800000116eb3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000116ebd: 0f 1f 00             	nopl	(%rax)

ffff800000116ec0 <page2kva>:
; {
ffff800000116ec0: 55                   	pushq	%rbp
ffff800000116ec1: 48 89 e5             	movq	%rsp, %rbp
ffff800000116ec4: 48 83 ec 10          	subq	$16, %rsp
ffff800000116ec8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff800000116ecc: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116ed0: 48 b8 80 5e 11 00 00 80 ff ff	movabsq	$-140737487217024, %rax # imm = 0xFFFF800000115E80
ffff800000116eda: ff d0                	callq	*%rax
ffff800000116edc: 48 89 c2             	movq	%rax, %rdx
ffff800000116edf: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000116ee9: 48 b8 e0 72 11 00 00 80 ff ff	movabsq	$-140737487211808, %rax # imm = 0xFFFF8000001172E0
ffff800000116ef3: be 50 00 00 00       	movl	$80, %esi
ffff800000116ef8: ff d0                	callq	*%rax
ffff800000116efa: 48 83 c4 10          	addq	$16, %rsp
ffff800000116efe: 5d                   	popq	%rbp
ffff800000116eff: c3                   	retq

ffff800000116f00 <pa2page>:
; {
ffff800000116f00: 55                   	pushq	%rbp
ffff800000116f01: 48 89 e5             	movq	%rsp, %rbp
ffff800000116f04: 48 83 ec 10          	subq	$16, %rsp
ffff800000116f08: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000116f0c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116f10: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000116f14: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000116f1e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000116f21: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116f24: 0f 82 27 00 00 00    	jb	0xffff800000116f51 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff800000116f2a: 48 bf 50 86 11 00 00 80 ff ff	movabsq	$-140737487206832, %rdi # imm = 0xFFFF800000118650
ffff800000116f34: 48 ba e5 93 11 00 00 80 ff ff	movabsq	$-140737487203355, %rdx # imm = 0xFFFF8000001193E5
ffff800000116f3e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116f48: 31 c0                	xorl	%eax, %eax
ffff800000116f4a: be 49 00 00 00       	movl	$73, %esi
ffff800000116f4f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000116f51: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff800000116f5b: 48 8b 00             	movq	(%rax), %rax
ffff800000116f5e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000116f62: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000116f66: 48 c1 e1 05          	shlq	$5, %rcx
ffff800000116f6a: 48 01 c8             	addq	%rcx, %rax
ffff800000116f6d: 48 83 c4 10          	addq	$16, %rsp
ffff800000116f71: 5d                   	popq	%rbp
ffff800000116f72: c3                   	retq
ffff800000116f73: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000116f7d: 0f 1f 00             	nopl	(%rax)

ffff800000116f80 <list_is_empty>:
; {
ffff800000116f80: 55                   	pushq	%rbp
ffff800000116f81: 48 89 e5             	movq	%rsp, %rbp
ffff800000116f84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return head->next == head;
ffff800000116f88: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116f8c: 48 8b 00             	movq	(%rax), %rax
ffff800000116f8f: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000116f93: 0f 94 c0             	sete	%al
ffff800000116f96: 24 01                	andb	$1, %al
ffff800000116f98: 0f b6 c0             	movzbl	%al, %eax
ffff800000116f9b: 5d                   	popq	%rbp
ffff800000116f9c: c3                   	retq
ffff800000116f9d: 0f 1f 00             	nopl	(%rax)

ffff800000116fa0 <lab2_check_free_list_order>:
; {
ffff800000116fa0: 55                   	pushq	%rbp
ffff800000116fa1: 48 89 e5             	movq	%rsp, %rbp
ffff800000116fa4: 48 83 ec 20          	subq	$32, %rsp
; 	size_t nviolations = 0;
ffff800000116fa8: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000116fb0: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff800000116fb8: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff800000116fbd: 0f 83 93 00 00 00    	jae	0xffff800000117056 <lab2_check_free_list_order+0xb6>
; 		list_foreach(buddy_free_list + order, node) {
ffff800000116fc3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000116fc7: 48 c1 e0 04          	shlq	$4, %rax
ffff800000116fcb: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff800000116fd5: 48 01 c8             	addq	%rcx, %rax
ffff800000116fd8: 48 8b 00             	movq	(%rax), %rax
ffff800000116fdb: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000116fdf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000116fe3: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116fe7: 48 c1 e1 04          	shlq	$4, %rcx
ffff800000116feb: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff800000116ff5: 48 01 d1             	addq	%rdx, %rcx
ffff800000116ff8: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116ffb: 0f 84 3f 00 00 00    	je	0xffff800000117040 <lab2_check_free_list_order+0xa0>
; 			page = container_of(node, struct page_info, pp_node);
ffff800000117001: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117005: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page->pp_order != order)
ffff800000117009: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011700d: 8a 40 12             	movb	18(%rax), %al
ffff800000117010: 24 7f                	andb	$127, %al
ffff800000117012: 0f b6 c0             	movzbl	%al, %eax
ffff800000117015: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000117019: 0f 84 0c 00 00 00    	je	0xffff80000011702b <lab2_check_free_list_order+0x8b>
; 				++nviolations;
ffff80000011701f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000117023: 48 83 c0 01          	addq	$1, %rax
ffff800000117027: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		}
ffff80000011702b: e9 00 00 00 00       	jmp	0xffff800000117030 <lab2_check_free_list_order+0x90>
; 		list_foreach(buddy_free_list + order, node) {
ffff800000117030: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117034: 48 8b 00             	movq	(%rax), %rax
ffff800000117037: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000011703b: e9 9f ff ff ff       	jmp	0xffff800000116fdf <lab2_check_free_list_order+0x3f>
; 	}
ffff800000117040: e9 00 00 00 00       	jmp	0xffff800000117045 <lab2_check_free_list_order+0xa5>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000117045: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117049: 48 83 c0 01          	addq	$1, %rax
ffff80000011704d: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff800000117051: e9 62 ff ff ff       	jmp	0xffff800000116fb8 <lab2_check_free_list_order+0x18>
; 	if (nviolations != 0) {
ffff800000117056: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000011705b: 0f 84 2c 00 00 00    	je	0xffff80000011708d <lab2_check_free_list_order+0xed>
; 		panic("found %u order violations in free list", nviolations);
ffff800000117061: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000117065: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011706f: 48 ba a7 93 11 00 00 80 ff ff	movabsq	$-140737487203417, %rdx # imm = 0xFFFF8000001193A7
ffff800000117079: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117083: 31 c0                	xorl	%eax, %eax
ffff800000117085: be df 01 00 00       	movl	$479, %esi              # imm = 0x1DF
ffff80000011708a: 41 ff d0             	callq	*%r8
; 	cprintf("[LAB 2] check_free_list_order() succeeded!\n");
ffff80000011708d: 48 bf 5e 96 11 00 00 80 ff ff	movabsq	$-140737487202722, %rdi # imm = 0xFFFF80000011965E
ffff800000117097: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001170a1: 31 c0                	xorl	%eax, %eax
ffff8000001170a3: ff d1                	callq	*%rcx
; }
ffff8000001170a5: 48 83 c4 20          	addq	$32, %rsp
ffff8000001170a9: 5d                   	popq	%rbp
ffff8000001170aa: c3                   	retq
ffff8000001170ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001170b0 <lab2_check_memory_layout>:
; {
ffff8000001170b0: 55                   	pushq	%rbp
ffff8000001170b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001170b4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001170b8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff8000001170bc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001170c0: 8b 00                	movl	(%rax), %eax
ffff8000001170c2: 89 c2                	movl	%eax, %edx
ffff8000001170c4: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001170ce: 48 b8 e0 72 11 00 00 80 ff ff	movabsq	$-140737487211808, %rax # imm = 0xFFFF8000001172E0
ffff8000001170d8: be ed 01 00 00       	movl	$493, %esi              # imm = 0x1ED
ffff8000001170dd: ff d0                	callq	*%rax
ffff8000001170df: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff8000001170e3: 31 c0                	xorl	%eax, %eax
ffff8000001170e5: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff8000001170ef: 31 ff                	xorl	%edi, %edi
ffff8000001170f1: ff d0                	callq	*%rax
ffff8000001170f3: 48 89 c2             	movq	%rax, %rdx
ffff8000001170f6: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000117100: 48 b8 50 73 11 00 00 80 ff ff	movabsq	$-140737487211696, %rax # imm = 0xFFFF800000117350
ffff80000011710a: be ee 01 00 00       	movl	$494, %esi              # imm = 0x1EE
ffff80000011710f: ff d0                	callq	*%rax
ffff800000117111: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000117115: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000011711d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000117121: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000117125: 8b 49 04             	movl	4(%rcx), %ecx
ffff800000117128: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011712b: 0f 83 84 01 00 00    	jae	0xffff8000001172b5 <lab2_check_memory_layout+0x205>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000117131: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117135: 48 8b 00             	movq	(%rax), %rax
ffff800000117138: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000011713c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000117140: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000117144: 48 8b 09             	movq	(%rcx), %rcx
ffff800000117147: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000011714b: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000011714f: 48 39 c8             	cmpq	%rcx, %rax
ffff800000117152: 0f 83 3b 01 00 00    	jae	0xffff800000117293 <lab2_check_memory_layout+0x1e3>
; 			if (npages <= PAGE_INDEX(pa)) {
ffff800000117158: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff800000117162: 48 8b 00             	movq	(%rax), %rax
ffff800000117165: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000117169: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000011716d: 48 39 c8             	cmpq	%rcx, %rax
ffff800000117170: 0f 87 05 00 00 00    	ja	0xffff80000011717b <lab2_check_memory_layout+0xcb>
; 				continue;
ffff800000117176: e9 05 01 00 00       	jmp	0xffff800000117280 <lab2_check_memory_layout+0x1d0>
; 			page = pa2page(pa);
ffff80000011717b: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000011717f: 48 b8 00 6f 11 00 00 80 ff ff	movabsq	$-140737487212800, %rax # imm = 0xFFFF800000116F00
ffff800000117189: ff d0                	callq	*%rax
ffff80000011718b: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			addr = (void *)ROUNDDOWN((uintptr_t)page, PAGE_SIZE);
ffff80000011718f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117193: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000117197: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000011719b: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff8000001171a1: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff8000001171a5: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff8000001171a9: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 			if (!page_lookup(kernel_pml4, addr, NULL)) {
ffff8000001171ad: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001171b7: 48 8b 38             	movq	(%rax), %rdi
ffff8000001171ba: 48 8b 75 c8          	movq	-56(%rbp), %rsi
ffff8000001171be: 31 c0                	xorl	%eax, %eax
ffff8000001171c0: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff8000001171ca: 31 c9                	xorl	%ecx, %ecx
ffff8000001171cc: 89 ca                	movl	%ecx, %edx
ffff8000001171ce: ff d0                	callq	*%rax
ffff8000001171d0: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001171d4: 0f 85 05 00 00 00    	jne	0xffff8000001171df <lab2_check_memory_layout+0x12f>
; 				continue;
ffff8000001171da: e9 a1 00 00 00       	jmp	0xffff800000117280 <lab2_check_memory_layout+0x1d0>
; 			if ((pa == 0 ||
ffff8000001171df: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff8000001171e4: 0f 84 40 00 00 00    	je	0xffff80000011722a <lab2_check_memory_layout+0x17a>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff8000001171ea: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001171ee: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001171f2: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff8000001171f6: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001171f9: 0f 84 2b 00 00 00    	je	0xffff80000011722a <lab2_check_memory_layout+0x17a>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff8000001171ff: b8 00 00 10 00       	movl	$1048576, %eax          # imm = 0x100000
ffff800000117204: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff800000117208: 0f 87 0e 00 00 00    	ja	0xffff80000011721c <lab2_check_memory_layout+0x16c>
ffff80000011720e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000117212: 48 3b 45 d0          	cmpq	-48(%rbp), %rax
ffff800000117216: 0f 82 0e 00 00 00    	jb	0xffff80000011722a <lab2_check_memory_layout+0x17a>
; 			    entry->type != MMAP_FREE) &&
ffff80000011721c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117220: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff800000117224: 0f 84 51 00 00 00    	je	0xffff80000011727b <lab2_check_memory_layout+0x1cb>
; 			    page->pp_free) {
ffff80000011722a: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011722e: 8a 40 12             	movb	18(%rax), %al
ffff800000117231: c0 e8 07             	shrb	$7, %al
ffff800000117234: 0f b6 c0             	movzbl	%al, %eax
ffff800000117237: 83 f8 00             	cmpl	$0, %eax
; 			if ((pa == 0 ||
ffff80000011723a: 0f 84 3b 00 00 00    	je	0xffff80000011727b <lab2_check_memory_layout+0x1cb>
; 				panic("%p should not be free\n", page2pa(page));
ffff800000117240: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000117244: 48 b8 80 5e 11 00 00 80 ff ff	movabsq	$-140737487217024, %rax # imm = 0xFFFF800000115E80
ffff80000011724e: ff d0                	callq	*%rax
ffff800000117250: 48 89 c1             	movq	%rax, %rcx
ffff800000117253: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff80000011725d: 48 ba 85 89 11 00 00 80 ff ff	movabsq	$-140737487206011, %rdx # imm = 0xFFFF800000118985
ffff800000117267: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117271: 31 c0                	xorl	%eax, %eax
ffff800000117273: be 03 02 00 00       	movl	$515, %esi              # imm = 0x203
ffff800000117278: 41 ff d0             	callq	*%r8
; 		}
ffff80000011727b: e9 00 00 00 00       	jmp	0xffff800000117280 <lab2_check_memory_layout+0x1d0>
; 		     pa += PAGE_SIZE) {
ffff800000117280: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000117284: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000011728a: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000011728e: e9 a9 fe ff ff       	jmp	0xffff80000011713c <lab2_check_memory_layout+0x8c>
; 	}
ffff800000117293: e9 00 00 00 00       	jmp	0xffff800000117298 <lab2_check_memory_layout+0x1e8>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000117298: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011729c: 48 83 c0 01          	addq	$1, %rax
ffff8000001172a0: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001172a4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001172a8: 48 83 c0 18          	addq	$24, %rax
ffff8000001172ac: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff8000001172b0: e9 68 fe ff ff       	jmp	0xffff80000011711d <lab2_check_memory_layout+0x6d>
; 	cprintf("[LAB 2] check_memory_layout() succeeded!\n");
ffff8000001172b5: 48 bf f6 88 11 00 00 80 ff ff	movabsq	$-140737487206154, %rdi # imm = 0xFFFF8000001188F6
ffff8000001172bf: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001172c9: 31 c0                	xorl	%eax, %eax
ffff8000001172cb: ff d1                	callq	*%rcx
; }
ffff8000001172cd: 48 83 c4 50          	addq	$80, %rsp
ffff8000001172d1: 5d                   	popq	%rbp
ffff8000001172d2: c3                   	retq
ffff8000001172d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001172dd: 0f 1f 00             	nopl	(%rax)

ffff8000001172e0 <_kaddr>:
; {
ffff8000001172e0: 55                   	pushq	%rbp
ffff8000001172e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001172e4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001172e8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001172ec: 89 75 f4             	movl	%esi, -12(%rbp)
ffff8000001172ef: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001172f3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001172f7: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001172fb: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000117305: 48 8b 09             	movq	(%rcx), %rcx
ffff800000117308: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011730b: 0f 82 24 00 00 00    	jb	0xffff800000117335 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000117311: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000117315: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000117318: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011731c: 48 ba f3 8f 11 00 00 80 ff ff	movabsq	$-140737487204365, %rdx # imm = 0xFFFF800000118FF3
ffff800000117326: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117330: 31 c0                	xorl	%eax, %eax
ffff800000117332: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff800000117335: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000011733f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000117343: 48 83 c4 20          	addq	$32, %rsp
ffff800000117347: 5d                   	popq	%rbp
ffff800000117348: c3                   	retq
ffff800000117349: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000117350 <_paddr>:
; {
ffff800000117350: 55                   	pushq	%rbp
ffff800000117351: 48 89 e5             	movq	%rsp, %rbp
ffff800000117354: 48 83 ec 20          	subq	$32, %rsp
ffff800000117358: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011735c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011735f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000117363: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117367: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff800000117371: 48 39 c8             	cmpq	%rcx, %rax
ffff800000117374: 0f 83 24 00 00 00    	jae	0xffff80000011739e <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000011737a: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011737e: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000117381: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000117385: 48 ba 2a 88 11 00 00 80 ff ff	movabsq	$-140737487206358, %rdx # imm = 0xFFFF80000011882A
ffff80000011738f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117399: 31 c0                	xorl	%eax, %eax
ffff80000011739b: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000011739e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001173a2: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff8000001173ac: 48 29 c8             	subq	%rcx, %rax
ffff8000001173af: 48 83 c4 20          	addq	$32, %rsp
ffff8000001173b3: 5d                   	popq	%rbp
ffff8000001173b4: c3                   	retq
ffff8000001173b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001173bf: 90                   	nop

ffff8000001173c0 <lab2_check_buddy_consistency>:
; {
ffff8000001173c0: 55                   	pushq	%rbp
ffff8000001173c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001173c4: 48 83 ec 20          	subq	$32, %rsp
; 	for (addr = 0;
ffff8000001173c8: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < npages * PAGE_SIZE;
ffff8000001173d0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001173d4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001173de: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001173e1: 48 c1 e1 0c          	shlq	$12, %rcx
ffff8000001173e5: 48 39 c8             	cmpq	%rcx, %rax
; 	for (addr = 0;
ffff8000001173e8: 0f 83 77 00 00 00    	jae	0xffff800000117465 <lab2_check_buddy_consistency+0xa5>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff8000001173ee: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001173f8: 48 8b 00             	movq	(%rax), %rax
ffff8000001173fb: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff8000001173ff: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117403: 48 b8 00 6f 11 00 00 80 ff ff	movabsq	$-140737487212800, %rax # imm = 0xFFFF800000116F00
ffff80000011740d: ff d0                	callq	*%rax
ffff80000011740f: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000117413: 48 89 c6             	movq	%rax, %rsi
ffff800000117416: 31 c0                	xorl	%eax, %eax
ffff800000117418: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000117422: 31 c9                	xorl	%ecx, %ecx
ffff800000117424: 89 ca                	movl	%ecx, %edx
ffff800000117426: ff d0                	callq	*%rax
ffff800000117428: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011742c: 0f 85 05 00 00 00    	jne	0xffff800000117437 <lab2_check_buddy_consistency+0x77>
; 			continue;
ffff800000117432: e9 1b 00 00 00       	jmp	0xffff800000117452 <lab2_check_buddy_consistency+0x92>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff800000117437: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000011743b: 31 c0                	xorl	%eax, %eax
ffff80000011743d: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff800000117447: 31 c9                	xorl	%ecx, %ecx
ffff800000117449: 89 ca                	movl	%ecx, %edx
ffff80000011744b: be 09 00 00 00       	movl	$9, %esi
ffff800000117450: ff d0                	callq	*%rax
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff800000117452: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117456: 48 05 00 00 20 00    	addq	$2097152, %rax          # imm = 0x200000
ffff80000011745c: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff800000117460: e9 6b ff ff ff       	jmp	0xffff8000001173d0 <lab2_check_buddy_consistency+0x10>
; 	cprintf("[LAB 2] check_buddy_consistency() succeeded!\n");
ffff800000117465: 48 bf 0c 8a 11 00 00 80 ff ff	movabsq	$-140737487205876, %rdi # imm = 0xFFFF800000118A0C
ffff80000011746f: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000117479: 31 c0                	xorl	%eax, %eax
ffff80000011747b: ff d1                	callq	*%rcx
; }
ffff80000011747d: 48 83 c4 20          	addq	$32, %rsp
ffff800000117481: 5d                   	popq	%rbp
ffff800000117482: c3                   	retq
ffff800000117483: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011748d: 0f 1f 00             	nopl	(%rax)

ffff800000117490 <lab2_check_buddy_full_consistency>:
; {
ffff800000117490: 55                   	pushq	%rbp
ffff800000117491: 48 89 e5             	movq	%rsp, %rbp
ffff800000117494: 48 83 ec 20          	subq	$32, %rsp
; 	for (addr = 0;
ffff800000117498: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < npages * PAGE_SIZE;
ffff8000001174a0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001174a4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff8000001174ae: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001174b1: 48 c1 e1 0c          	shlq	$12, %rcx
ffff8000001174b5: 48 39 c8             	cmpq	%rcx, %rax
; 	for (addr = 0;
ffff8000001174b8: 0f 83 b5 01 00 00    	jae	0xffff800000117673 <lab2_check_buddy_full_consistency+0x1e3>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff8000001174be: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff8000001174c8: 48 8b 00             	movq	(%rax), %rax
ffff8000001174cb: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff8000001174cf: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001174d3: 48 b8 00 6f 11 00 00 80 ff ff	movabsq	$-140737487212800, %rax # imm = 0xFFFF800000116F00
ffff8000001174dd: ff d0                	callq	*%rax
ffff8000001174df: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001174e3: 48 89 c6             	movq	%rax, %rsi
ffff8000001174e6: 31 c0                	xorl	%eax, %eax
ffff8000001174e8: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff8000001174f2: 31 c9                	xorl	%ecx, %ecx
ffff8000001174f4: 89 ca                	movl	%ecx, %edx
ffff8000001174f6: ff d0                	callq	*%rax
ffff8000001174f8: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001174fc: 0f 85 4f 00 00 00    	jne	0xffff800000117551 <lab2_check_buddy_full_consistency+0xc1>
; 	             panic("Page_info structure number %d is not mapped\n", pa2page(addr) - pages);
ffff800000117502: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117506: 48 b8 00 6f 11 00 00 80 ff ff	movabsq	$-140737487212800, %rax # imm = 0xFFFF800000116F00
ffff800000117510: ff d0                	callq	*%rax
ffff800000117512: 48 89 c1             	movq	%rax, %rcx
ffff800000117515: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011751f: 48 8b 00             	movq	(%rax), %rax
ffff800000117522: 48 29 c1             	subq	%rax, %rcx
ffff800000117525: 48 c1 f9 05          	sarq	$5, %rcx
ffff800000117529: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000117533: 48 ba ed 95 11 00 00 80 ff ff	movabsq	$-140737487202835, %rdx # imm = 0xFFFF8000001195ED
ffff80000011753d: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117547: 31 c0                	xorl	%eax, %eax
ffff800000117549: be 2b 02 00 00       	movl	$555, %esi              # imm = 0x22B
ffff80000011754e: 41 ff d0             	callq	*%r8
;                 if (!page_lookup(kernel_pml4, KADDR(addr), NULL)) {
ffff800000117551: 48 b8 f8 d2 11 00 00 80 ff ff	movabsq	$-140737487187208, %rax # imm = 0xFFFF80000011D2F8
ffff80000011755b: 48 8b 00             	movq	(%rax), %rax
ffff80000011755e: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000117562: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000117566: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000117570: 48 b8 e0 72 11 00 00 80 ff ff	movabsq	$-140737487211808, %rax # imm = 0xFFFF8000001172E0
ffff80000011757a: be 2e 02 00 00       	movl	$558, %esi              # imm = 0x22E
ffff80000011757f: ff d0                	callq	*%rax
ffff800000117581: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000117585: 48 89 c6             	movq	%rax, %rsi
ffff800000117588: 31 c0                	xorl	%eax, %eax
ffff80000011758a: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff800000117594: 31 c9                	xorl	%ecx, %ecx
ffff800000117596: 89 ca                	movl	%ecx, %edx
ffff800000117598: ff d0                	callq	*%rax
ffff80000011759a: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011759e: 0f 85 4a 00 00 00    	jne	0xffff8000001175ee <lab2_check_buddy_full_consistency+0x15e>
;                      panic("Kernel address %llx should be mapped\n", KADDR(addr));
ffff8000001175a4: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff8000001175a8: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001175b2: 48 b8 e0 72 11 00 00 80 ff ff	movabsq	$-140737487211808, %rax # imm = 0xFFFF8000001172E0
ffff8000001175bc: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff8000001175c1: ff d0                	callq	*%rax
ffff8000001175c3: 48 89 c1             	movq	%rax, %rcx
ffff8000001175c6: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff8000001175d0: 48 ba dc 86 11 00 00 80 ff ff	movabsq	$-140737487206692, %rdx # imm = 0xFFFF8000001186DC
ffff8000001175da: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001175e4: 31 c0                	xorl	%eax, %eax
ffff8000001175e6: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff8000001175eb: 41 ff d0             	callq	*%r8
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff8000001175ee: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001175f2: 31 c0                	xorl	%eax, %eax
ffff8000001175f4: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff8000001175fe: 31 c9                	xorl	%ecx, %ecx
ffff800000117600: 89 ca                	movl	%ecx, %edx
ffff800000117602: be 09 00 00 00       	movl	$9, %esi
ffff800000117607: ff d0                	callq	*%rax
;                 check_buddy_consistency(PADDR(KADDR(addr)), BUDDY_MAX_ORDER - 1, NULL);
ffff800000117609: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000011760d: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000117617: 48 b8 e0 72 11 00 00 80 ff ff	movabsq	$-140737487211808, %rax # imm = 0xFFFF8000001172E0
ffff800000117621: be 36 02 00 00       	movl	$566, %esi              # imm = 0x236
ffff800000117626: ff d0                	callq	*%rax
ffff800000117628: 48 89 c2             	movq	%rax, %rdx
ffff80000011762b: 48 bf 7b 88 11 00 00 80 ff ff	movabsq	$-140737487206277, %rdi # imm = 0xFFFF80000011887B
ffff800000117635: 48 b8 50 73 11 00 00 80 ff ff	movabsq	$-140737487211696, %rax # imm = 0xFFFF800000117350
ffff80000011763f: be 36 02 00 00       	movl	$566, %esi              # imm = 0x236
ffff800000117644: ff d0                	callq	*%rax
ffff800000117646: 48 89 c7             	movq	%rax, %rdi
ffff800000117649: 31 c0                	xorl	%eax, %eax
ffff80000011764b: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff800000117655: 31 c9                	xorl	%ecx, %ecx
ffff800000117657: 89 ca                	movl	%ecx, %edx
ffff800000117659: be 09 00 00 00       	movl	$9, %esi
ffff80000011765e: ff d0                	callq	*%rax
; 	     addr += (1 << PAGE_TABLE_SHIFT)) {
ffff800000117660: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117664: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000011766a: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff80000011766e: e9 2d fe ff ff       	jmp	0xffff8000001174a0 <lab2_check_buddy_full_consistency+0x10>
; 	cprintf("[LAB 2] check_buddy_full_consistency() succeeded!\n");
ffff800000117673: 48 bf a4 91 11 00 00 80 ff ff	movabsq	$-140737487203932, %rdi # imm = 0xFFFF8000001191A4
ffff80000011767d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000117687: 31 c0                	xorl	%eax, %eax
ffff800000117689: ff d1                	callq	*%rcx
; }
ffff80000011768b: 48 83 c4 20          	addq	$32, %rsp
ffff80000011768f: 5d                   	popq	%rbp
ffff800000117690: c3                   	retq
ffff800000117691: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011769b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001176a0 <lab2_check_pml4>:
; {
ffff8000001176a0: 55                   	pushq	%rbp
ffff8000001176a1: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_ptbl_flags();
ffff8000001176a4: 48 b8 30 51 11 00 00 80 ff ff	movabsq	$-140737487220432, %rax # imm = 0xFFFF800000115130
ffff8000001176ae: ff d0                	callq	*%rax
; 	lab2_check_wx();
ffff8000001176b0: 48 b8 e0 52 11 00 00 80 ff ff	movabsq	$-140737487220000, %rax # imm = 0xFFFF8000001152E0
ffff8000001176ba: ff d0                	callq	*%rax
; 	lab2_check_nx();
ffff8000001176bc: 48 b8 40 53 11 00 00 80 ff ff	movabsq	$-140737487219904, %rax # imm = 0xFFFF800000115340
ffff8000001176c6: ff d0                	callq	*%rax
; }
ffff8000001176c8: 5d                   	popq	%rbp
ffff8000001176c9: c3                   	retq
ffff8000001176ca: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001176d0 <lab2_check_paging>:
; {
ffff8000001176d0: 55                   	pushq	%rbp
ffff8000001176d1: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_4k_paging();
ffff8000001176d4: 48 b8 90 59 11 00 00 80 ff ff	movabsq	$-140737487218288, %rax # imm = 0xFFFF800000115990
ffff8000001176de: ff d0                	callq	*%rax
; }
ffff8000001176e0: 5d                   	popq	%rbp
ffff8000001176e1: c3                   	retq
ffff8000001176e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001176ec: 0f 1f 40 00          	nopl	(%rax)

ffff8000001176f0 <lab2_check_buddy>:
; {
ffff8000001176f0: 55                   	pushq	%rbp
ffff8000001176f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001176f4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001176f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	lab2_check_free_list_order();
ffff8000001176fc: 48 b8 a0 6f 11 00 00 80 ff ff	movabsq	$-140737487212640, %rax # imm = 0xFFFF800000116FA0
ffff800000117706: ff d0                	callq	*%rax
; 	lab2_check_memory_layout(boot_info);
ffff800000117708: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011770c: 48 b8 b0 70 11 00 00 80 ff ff	movabsq	$-140737487212368, %rax # imm = 0xFFFF8000001170B0
ffff800000117716: ff d0                	callq	*%rax
; 	lab2_check_buddy_consistency();
ffff800000117718: 48 b8 c0 73 11 00 00 80 ff ff	movabsq	$-140737487211584, %rax # imm = 0xFFFF8000001173C0
ffff800000117722: ff d0                	callq	*%rax
; 	lab2_check_vas();
ffff800000117724: 48 b8 60 55 11 00 00 80 ff ff	movabsq	$-140737487219360, %rax # imm = 0xFFFF800000115560
ffff80000011772e: ff d0                	callq	*%rax
; }
ffff800000117730: 48 83 c4 10          	addq	$16, %rsp
ffff800000117734: 5d                   	popq	%rbp
ffff800000117735: c3                   	retq
