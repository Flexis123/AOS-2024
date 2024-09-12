
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
ffff80000010c339: 48 bf 1b 8b 11 00 00 80 ff ff	movabsq	$-140737487205605, %rdi # imm = 0xFFFF800000118B1B
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
ffff80000010c45c: 48 bf 6a 92 11 00 00 80 ff ff	movabsq	$-140737487203734, %rdi # imm = 0xFFFF80000011926A
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
ffff80000010ca81: 48 b8 20 27 11 00 00 80 ff ff	movabsq	$-140737487231200, %rax # imm = 0xFFFF800000112720
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
ffff80000010cbe3: 48 b8 70 26 11 00 00 80 ff ff	movabsq	$-140737487231376, %rax # imm = 0xFFFF800000112670
ffff80000010cbed: 31 f6                	xorl	%esi, %esi
ffff80000010cbef: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010cbf1: 48 b8 20 c4 10 00 00 80 ff ff	movabsq	$-140737487256544, %rax # imm = 0xFFFF80000010C420
ffff80000010cbfb: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010cbfd: 48 bf a5 91 11 00 00 80 ff ff	movabsq	$-140737487203931, %rdi # imm = 0xFFFF8000001191A5
ffff80000010cc07: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010cc11: 31 c0                	xorl	%eax, %eax
ffff80000010cc13: ff d1                	callq	*%rcx
; 	mem_init(boot_info);
ffff80000010cc15: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010cc19: 48 b8 10 f1 10 00 00 80 ff ff	movabsq	$-140737487245040, %rax # imm = 0xFFFF80000010F110
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
ffff80000010ccb6: 48 bf 06 89 11 00 00 80 ff ff	movabsq	$-140737487206138, %rdi # imm = 0xFFFF800000118906
ffff80000010ccc0: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ccca: 31 c0                	xorl	%eax, %eax
ffff80000010cccc: ff d1                	callq	*%rcx
; 	vcprintf(fmt, ap);
ffff80000010ccce: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010ccd2: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010ccd6: 48 b8 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rax # imm = 0xFFFF80000010DC00
ffff80000010cce0: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010cce2: 48 bf a5 91 11 00 00 80 ff ff	movabsq	$-140737487203931, %rdi # imm = 0xFFFF8000001191A5
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
ffff80000010cd64: 48 bf a7 91 11 00 00 80 ff ff	movabsq	$-140737487203929, %rdi # imm = 0xFFFF8000001191A7
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
ffff80000010cd9e: 48 bf a5 91 11 00 00 80 ff ff	movabsq	$-140737487203931, %rdi # imm = 0xFFFF8000001191A5
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
ffff80000010cdf6: 48 bf e0 91 11 00 00 80 ff ff	movabsq	$-140737487203872, %rdi # imm = 0xFFFF8000001191E0
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
ffff80000010ce43: 48 bf e4 8c 11 00 00 80 ff ff	movabsq	$-140737487205148, %rdi # imm = 0xFFFF800000118CE4
ffff80000010ce4d: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010ce57: 48 89 4d a0          	movq	%rcx, -96(%rbp)
ffff80000010ce5b: 31 c0                	xorl	%eax, %eax
ffff80000010ce5d: 88 45 af             	movb	%al, -81(%rbp)
ffff80000010ce60: ff d1                	callq	*%rcx
ffff80000010ce62: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010ce66: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010ce69: 48 bf 27 93 11 00 00 80 ff ff	movabsq	$-140737487203545, %rdi # imm = 0xFFFF800000119327
ffff80000010ce73: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ce7d: ff d1                	callq	*%rcx
ffff80000010ce7f: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010ce83: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010ce86: 48 bf f0 86 11 00 00 80 ff ff	movabsq	$-140737487206672, %rdi # imm = 0xFFFF8000001186F0
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
ffff80000010cebf: 48 bf 08 8a 11 00 00 80 ff ff	movabsq	$-140737487205880, %rdi # imm = 0xFFFF800000118A08
ffff80000010cec9: 48 be b6 77 11 00 00 80 ff ff	movabsq	$-140737487210570, %rsi # imm = 0xFFFF8000001177B6
ffff80000010ced3: 48 89 f2             	movq	%rsi, %rdx
ffff80000010ced6: 4c 01 c2             	addq	%r8, %rdx
ffff80000010ced9: ff d1                	callq	*%rcx
ffff80000010cedb: 4c 8b 45 98          	movq	-104(%rbp), %r8
ffff80000010cedf: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010cee3: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010cee6: 48 bf 1e 89 11 00 00 80 ff ff	movabsq	$-140737487206114, %rdi # imm = 0xFFFF80000011891E
ffff80000010cef0: 48 be b0 c5 11 00 00 80 ff ff	movabsq	$-140737487190608, %rsi # imm = 0xFFFF80000011C5B0
ffff80000010cefa: 48 89 f2             	movq	%rsi, %rdx
ffff80000010cefd: 4c 01 c2             	addq	%r8, %rdx
ffff80000010cf00: ff d1                	callq	*%rcx
ffff80000010cf02: 4c 8b 45 98          	movq	-104(%rbp), %r8
ffff80000010cf06: 48 8b 4d a0          	movq	-96(%rbp), %rcx
ffff80000010cf0a: 8a 45 af             	movb	-81(%rbp), %al
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cf0d: 48 bf 15 87 11 00 00 80 ff ff	movabsq	$-140737487206635, %rdi # imm = 0xFFFF800000118715
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
ffff80000010cf87: 48 bf ec 8e 11 00 00 80 ff ff	movabsq	$-140737487204628, %rdi # imm = 0xFFFF800000118EEC
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
ffff80000010d012: 48 bf 7a 94 11 00 00 80 ff ff	movabsq	$-140737487203206, %rdi # imm = 0xFFFF80000011947A
ffff80000010d01c: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d026: 31 c0                	xorl	%eax, %eax
ffff80000010d028: ff d1                	callq	*%rcx
; 		cprintf("<no debug info>\t");
ffff80000010d02a: 48 bf e9 91 11 00 00 80 ff ff	movabsq	$-140737487203863, %rdi # imm = 0xFFFF8000001191E9
ffff80000010d034: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d03e: 31 c0                	xorl	%eax, %eax
ffff80000010d040: ff d1                	callq	*%rcx
; 		nargs = 6;
ffff80000010d042: 48 c7 45 c0 06 00 00 00      	movq	$6, -64(%rbp)
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010d04a: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff80000010d04e: 48 bf 51 90 11 00 00 80 ff ff	movabsq	$-140737487204271, %rdi # imm = 0xFFFF800000119051
ffff80000010d058: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d062: 31 c0                	xorl	%eax, %eax
ffff80000010d064: ff d1                	callq	*%rcx
; 		if (nargs)
ffff80000010d066: 48 83 7d c0 00       	cmpq	$0, -64(%rbp)
ffff80000010d06b: 0f 84 18 00 00 00    	je	0xffff80000010d089 <mon_backtrace+0xd9>
; 			cprintf("  args ");
ffff80000010d071: 48 bf 5d 8b 11 00 00 80 ff ff	movabsq	$-140737487205539, %rdi # imm = 0xFFFF800000118B5D
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
ffff80000010d0aa: 48 bf b0 8f 11 00 00 80 ff ff	movabsq	$-140737487204432, %rdi # imm = 0xFFFF800000118FB0
ffff80000010d0b4: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d0be: 31 c0                	xorl	%eax, %eax
ffff80000010d0c0: ff d1                	callq	*%rcx
; 		for (i = 0; i < nargs; i++)
ffff80000010d0c2: 8b 45 e4             	movl	-28(%rbp), %eax
ffff80000010d0c5: 83 c0 01             	addl	$1, %eax
ffff80000010d0c8: 89 45 e4             	movl	%eax, -28(%rbp)
ffff80000010d0cb: e9 c0 ff ff ff       	jmp	0xffff80000010d090 <mon_backtrace+0xe0>
; 		cprintf("\n");
ffff80000010d0d0: 48 bf a5 91 11 00 00 80 ff ff	movabsq	$-140737487203931, %rdi # imm = 0xFFFF8000001191A5
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
ffff80000010d191: 48 bf bb 85 11 00 00 80 ff ff	movabsq	$-140737487206981, %rdi # imm = 0xFFFF8000001185BB
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
ffff80000010d1c6: 48 bf 3a 87 11 00 00 80 ff ff	movabsq	$-140737487206598, %rdi # imm = 0xFFFF80000011873A
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
ffff80000010d1f6: 48 b8 90 29 11 00 00 80 ff ff	movabsq	$-140737487230576, %rax # imm = 0xFFFF800000112990
ffff80000010d200: 31 d2                	xorl	%edx, %edx
ffff80000010d202: 89 d6                	movl	%edx, %esi
ffff80000010d204: ff d0                	callq	*%rax
ffff80000010d206: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010d20a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010d20e: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000010d212: 48 be 1a 8f 11 00 00 80 ff ff	movabsq	$-140737487204582, %rsi # imm = 0xFFFF800000118F1A
ffff80000010d21c: 48 b8 80 24 11 00 00 80 ff ff	movabsq	$-140737487231872, %rax # imm = 0xFFFF800000112480
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
ffff80000010d257: 48 bf 43 89 11 00 00 80 ff ff	movabsq	$-140737487206077, %rdi # imm = 0xFFFF800000118943
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
ffff80000010d2a4: 48 be 59 93 11 00 00 80 ff ff	movabsq	$-140737487203495, %rsi # imm = 0xFFFF800000119359
ffff80000010d2ae: 48 b8 80 24 11 00 00 80 ff ff	movabsq	$-140737487231872, %rax # imm = 0xFFFF800000112480
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
ffff80000010d2ef: 48 bf 3a 87 11 00 00 80 ff ff	movabsq	$-140737487206598, %rdi # imm = 0xFFFF80000011873A
ffff80000010d2f9: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d303: 31 c0                	xorl	%eax, %eax
ffff80000010d305: ff d1                	callq	*%rcx
; 		return 0;
ffff80000010d307: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d30e: e9 d8 00 00 00       	jmp	0xffff80000010d3eb <mon_pageinfo+0x29b>
ffff80000010d313: e9 00 00 00 00       	jmp	0xffff80000010d318 <mon_pageinfo+0x1c8>
; 	cprintf("  Page index: %u\n", idx);
ffff80000010d318: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010d31c: 48 bf de 85 11 00 00 80 ff ff	movabsq	$-140737487206946, %rdi # imm = 0xFFFF8000001185DE
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
ffff80000010d355: 48 bf f0 85 11 00 00 80 ff ff	movabsq	$-140737487206928, %rdi # imm = 0xFFFF8000001185F0
ffff80000010d35f: ff d1                	callq	*%rcx
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010d361: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d365: 8a 40 12             	movb	18(%rax), %al
ffff80000010d368: c0 e8 07             	shrb	$7, %al
ffff80000010d36b: 0f b6 c8             	movzbl	%al, %ecx
ffff80000010d36e: 84 c0                	testb	%al, %al
ffff80000010d370: 48 b8 c7 8a 11 00 00 80 ff ff	movabsq	$-140737487205689, %rax # imm = 0xFFFF800000118AC7
ffff80000010d37a: 48 be 88 93 11 00 00 80 ff ff	movabsq	$-140737487203448, %rsi # imm = 0xFFFF800000119388
ffff80000010d384: 48 0f 45 f0          	cmovneq	%rax, %rsi
ffff80000010d388: 48 bf 27 8b 11 00 00 80 ff ff	movabsq	$-140737487205593, %rdi # imm = 0xFFFF800000118B27
ffff80000010d392: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d39c: 31 c0                	xorl	%eax, %eax
ffff80000010d39e: ff d1                	callq	*%rcx
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010d3a0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d3a4: 0f b7 70 10          	movzwl	16(%rax), %esi
ffff80000010d3a8: 48 bf 8d 93 11 00 00 80 ff ff	movabsq	$-140737487203443, %rdi # imm = 0xFFFF80000011938D
ffff80000010d3b2: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d3bc: 31 c0                	xorl	%eax, %eax
ffff80000010d3be: ff d1                	callq	*%rcx
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010d3c0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010d3c4: 8a 40 12             	movb	18(%rax), %al
ffff80000010d3c7: 24 7f                	andb	$127, %al
ffff80000010d3c9: 0f b6 f0             	movzbl	%al, %esi
ffff80000010d3cc: 48 bf 3b 94 11 00 00 80 ff ff	movabsq	$-140737487203269, %rdi # imm = 0xFFFF80000011943B
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
ffff80000010d42a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff80000010d434: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
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
ffff80000010d4c3: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000010d4cd: 48 8b 38             	movq	(%rax), %rdi
ffff80000010d4d0: 48 b8 00 2c 11 00 00 80 ff ff	movabsq	$-140737487229952, %rax # imm = 0xFFFF800000112C00
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
ffff80000010d4fc: 48 bf 0b 91 11 00 00 80 ff ff	movabsq	$-140737487204085, %rdi # imm = 0xFFFF80000011910B
ffff80000010d506: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d510: 31 c0                	xorl	%eax, %eax
ffff80000010d512: ff d1                	callq	*%rcx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010d514: 48 bf 2d 8a 11 00 00 80 ff ff	movabsq	$-140737487205843, %rdi # imm = 0xFFFF800000118A2D
ffff80000010d51e: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010d528: 31 c0                	xorl	%eax, %eax
ffff80000010d52a: ff d1                	callq	*%rcx
; 		buf = readline("K> ");
ffff80000010d52c: 48 bf fd 8c 11 00 00 80 ff ff	movabsq	$-140737487205123, %rdi # imm = 0xFFFF800000118CFD
ffff80000010d536: 48 b8 80 20 11 00 00 80 ff ff	movabsq	$-140737487232896, %rax # imm = 0xFFFF800000112080
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
ffff80000010d5e0: 48 bf fc 94 11 00 00 80 ff ff	movabsq	$-140737487203076, %rdi # imm = 0xFFFF8000001194FC
ffff80000010d5ea: 48 b8 c0 25 11 00 00 80 ff ff	movabsq	$-140737487231552, %rax # imm = 0xFFFF8000001125C0
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
ffff80000010d64c: 48 bf 34 8b 11 00 00 80 ff ff	movabsq	$-140737487205580, %rdi # imm = 0xFFFF800000118B34
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
ffff80000010d6af: 48 bf fc 94 11 00 00 80 ff ff	movabsq	$-140737487203076, %rdi # imm = 0xFFFF8000001194FC
ffff80000010d6b9: 48 b8 c0 25 11 00 00 80 ff ff	movabsq	$-140737487231552, %rax # imm = 0xFFFF8000001125C0
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
ffff80000010d761: 48 b8 80 24 11 00 00 80 ff ff	movabsq	$-140737487231872, %rax # imm = 0xFFFF800000112480
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
ffff80000010dc2d: 48 b8 20 0a 11 00 00 80 ff ff	movabsq	$-140737487238624, %rax # imm = 0xFFFF800000110A20
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
ffff80000010dddb: 48 bf 01 95 11 00 00 80 ff ff	movabsq	$-140737487203071, %rdi # imm = 0xFFFF800000119501
ffff80000010dde5: 48 ba be 93 11 00 00 80 ff ff	movabsq	$-140737487203394, %rdx # imm = 0xFFFF8000001193BE
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
ffff80000010e014: 48 bf 01 95 11 00 00 80 ff ff	movabsq	$-140737487203071, %rdi # imm = 0xFFFF800000119501
ffff80000010e01e: 48 b8 60 e1 10 00 00 80 ff ff	movabsq	$-140737487249056, %rax # imm = 0xFFFF80000010E160
ffff80000010e028: be 5d 00 00 00       	movl	$93, %esi
ffff80000010e02d: ff d0                	callq	*%rax
ffff80000010e02f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	cprintf("Boot memory map:\n");
ffff80000010e033: 48 bf d1 93 11 00 00 80 ff ff	movabsq	$-140737487203375, %rdi # imm = 0xFFFF8000001193D1
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
ffff80000010e094: 48 b8 c7 8a 11 00 00 80 ff ff	movabsq	$-140737487205689, %rax # imm = 0xFFFF800000118AC7
ffff80000010e09e: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0a2: e9 5a 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_RESERVED: region = "reserved"; break;
ffff80000010e0a7: 48 b8 ed 8a 11 00 00 80 ff ff	movabsq	$-140737487205651, %rax # imm = 0xFFFF800000118AED
ffff80000010e0b1: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0b5: e9 47 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_ACPI_RECLAIMABLE: region = "ACPI"; break;
ffff80000010e0ba: 48 b8 f7 8d 11 00 00 80 ff ff	movabsq	$-140737487204873, %rax # imm = 0xFFFF800000118DF7
ffff80000010e0c4: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0c8: e9 34 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_ACPI_NVS: region = "ACPI NVS"; break;
ffff80000010e0cd: 48 b8 62 89 11 00 00 80 ff ff	movabsq	$-140737487206046, %rax # imm = 0xFFFF800000118962
ffff80000010e0d7: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0db: e9 21 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		case MMAP_BAD: region = "bad"; break;
ffff80000010e0e0: 48 b8 ad 94 11 00 00 80 ff ff	movabsq	$-140737487203155, %rax # imm = 0xFFFF8000001194AD
ffff80000010e0ea: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010e0ee: e9 0e 00 00 00       	jmp	0xffff80000010e101 <show_boot_mmap+0x101>
; 		default: region = "?"; break;
ffff80000010e0f3: 48 b8 65 8b 11 00 00 80 ff ff	movabsq	$-140737487205531, %rax # imm = 0xFFFF800000118B65
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
ffff80000010e11b: 48 bf e3 93 11 00 00 80 ff ff	movabsq	$-140737487203357, %rdi # imm = 0xFFFF8000001193E3
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
ffff80000010e19c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
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
ffff80000010e270: 48 bf c8 89 11 00 00 80 ff ff	movabsq	$-140737487205944, %rdi # imm = 0xFFFF8000001189C8
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
ffff80000010e2b7: 48 bf fa 91 11 00 00 80 ff ff	movabsq	$-140737487203846, %rdi # imm = 0xFFFF8000001191FA
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
ffff80000010e30c: 48 bf 56 87 11 00 00 80 ff ff	movabsq	$-140737487206570, %rdi # imm = 0xFFFF800000118756
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
ffff80000010e3d6: 48 bf 52 8a 11 00 00 80 ff ff	movabsq	$-140737487205806, %rdi # imm = 0xFFFF800000118A52
ffff80000010e3e0: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000010e3ea: 48 b9 9d 8e 11 00 00 80 ff ff	movabsq	$-140737487204707, %rcx # imm = 0xFFFF800000118E9D
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
ffff80000010e4d6: 48 b8 00 09 11 00 00 80 ff ff	movabsq	$-140737487238912, %rax # imm = 0xFFFF800000110900
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
ffff80000010e55a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff80000010e564: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
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
ffff80000010e700: 48 b8 b0 08 11 00 00 80 ff ff	movabsq	$-140737487238992, %rax # imm = 0xFFFF8000001108B0
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
ffff80000010e755: 48 bf 52 8a 11 00 00 80 ff ff	movabsq	$-140737487205806, %rdi # imm = 0xFFFF800000118A52
ffff80000010e75f: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000010e769: 48 b9 66 87 11 00 00 80 ff ff	movabsq	$-140737487206554, %rcx # imm = 0xFFFF800000118766
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
ffff80000010e7c4: 48 b8 60 08 11 00 00 80 ff ff	movabsq	$-140737487239072, %rax # imm = 0xFFFF800000110860
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
ffff80000010e870: 48 b8 b0 08 11 00 00 80 ff ff	movabsq	$-140737487238992, %rax # imm = 0xFFFF8000001108B0
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
ffff80000010e959: 48 b8 70 26 11 00 00 80 ff ff	movabsq	$-140737487231376, %rax # imm = 0xFFFF800000112670
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
ffff80000010e99f: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
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
ffff80000010e9dd: 48 bf 52 8a 11 00 00 80 ff ff	movabsq	$-140737487205806, %rdi # imm = 0xFFFF800000118A52
ffff80000010e9e7: 48 ba 10 92 11 00 00 80 ff ff	movabsq	$-140737487203824, %rdx # imm = 0xFFFF800000119210
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
ffff80000010ea33: 48 b8 60 08 11 00 00 80 ff ff	movabsq	$-140737487239072, %rax # imm = 0xFFFF800000110860
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
ffff80000010ed7e: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
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
ffff80000010edec: 48 b8 e0 07 11 00 00 80 ff ff	movabsq	$-140737487239200, %rax # imm = 0xFFFF8000001107E0
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
ffff80000010ee7c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
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
; 	page = page_alloc(ALLOC_ZERO);
ffff80000010ef1c: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000010ef26: bf 01 00 00 00       	movl	$1, %edi
ffff80000010ef2b: ff d0                	callq	*%rax
ffff80000010ef2d: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	if (!page) {
ffff80000010ef31: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000010ef36: 0f 85 27 00 00 00    	jne	0xffff80000010ef63 <pml4_setup+0x53>
; 		panic("unable to allocate the PML4!");
ffff80000010ef3c: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010ef46: 48 ba b1 94 11 00 00 80 ff ff	movabsq	$-140737487203151, %rdx # imm = 0xFFFF8000001194B1
ffff80000010ef50: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010ef5a: 31 c0                	xorl	%eax, %eax
ffff80000010ef5c: be 19 00 00 00       	movl	$25, %esi
ffff80000010ef61: ff d1                	callq	*%rcx
; 	kernel_pml4 = page2kva(page);
ffff80000010ef63: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010ef67: 48 b8 60 f0 10 00 00 80 ff ff	movabsq	$-140737487245216, %rax # imm = 0xFFFF80000010F060
ffff80000010ef71: ff d0                	callq	*%rax
ffff80000010ef73: 48 89 c1             	movq	%rax, %rcx
ffff80000010ef76: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000010ef80: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010ef84: 48 89 08             	movq	%rcx, (%rax)
ffff80000010ef87: 48 b9 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rcx # imm = 0x8000000000000003
; 	uint64_t kflags = PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC;
ffff80000010ef91: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 	boot_map_kernel(kernel_pml4, (struct elf*) boot_info->elf_hdr);
ffff80000010ef95: 48 8b 38             	movq	(%rax), %rdi
ffff80000010ef98: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010ef9c: 48 8b 70 08          	movq	8(%rax), %rsi
ffff80000010efa0: 48 b8 30 3b 11 00 00 80 ff ff	movabsq	$-140737487226064, %rax # imm = 0xFFFF800000113B30
ffff80000010efaa: ff d0                	callq	*%rax
ffff80000010efac: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	boot_map_region(kernel_pml4, (void*) KSTACK_TOP, KSTACK_SIZE, (physaddr_t) bootstack, kflags);
ffff80000010efb0: 48 8b 38             	movq	(%rax), %rdi
ffff80000010efb3: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff80000010efb7: 48 b9 00 10 10 00 00 00 00 00	movabsq	$1052672, %rcx  # imm = 0x101000
ffff80000010efc1: 48 b8 80 37 11 00 00 80 ff ff	movabsq	$-140737487227008, %rax # imm = 0xFFFF800000113780
ffff80000010efcb: 48 be 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rsi # imm = 0xFFFFFE8000000000
ffff80000010efd5: ba 00 80 00 00       	movl	$32768, %edx            # imm = 0x8000
ffff80000010efda: ff d0                	callq	*%rax
ffff80000010efdc: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	boot_map_region(kernel_pml4, (void*) KPAGES, npages * sizeof(struct page_info), PADDR(pages), kflags);
ffff80000010efe0: 48 8b 00             	movq	(%rax), %rax
ffff80000010efe3: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010efe7: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010eff1: 48 8b 00             	movq	(%rax), %rax
ffff80000010eff4: 48 c1 e0 05          	shlq	$5, %rax
ffff80000010eff8: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010effc: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f006: 48 8b 10             	movq	(%rax), %rdx
ffff80000010f009: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f013: 48 b8 a0 f0 10 00 00 80 ff ff	movabsq	$-140737487245152, %rax # imm = 0xFFFF80000010F0A0
ffff80000010f01d: be 32 00 00 00       	movl	$50, %esi
ffff80000010f022: ff d0                	callq	*%rax
ffff80000010f024: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010f028: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000010f02c: 48 89 c1             	movq	%rax, %rcx
ffff80000010f02f: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff80000010f033: 48 b8 80 37 11 00 00 80 ff ff	movabsq	$-140737487227008, %rax # imm = 0xFFFF800000113780
ffff80000010f03d: 48 be 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rsi # imm = 0xFFFFFF8000000000
ffff80000010f047: ff d0                	callq	*%rax
; 	buddy_migrate();
ffff80000010f049: 48 b8 a0 ea 10 00 00 80 ff ff	movabsq	$-140737487246688, %rax # imm = 0xFFFF80000010EAA0
ffff80000010f053: ff d0                	callq	*%rax
; 	return 0;
ffff80000010f055: 31 c0                	xorl	%eax, %eax
ffff80000010f057: 48 83 c4 30          	addq	$48, %rsp
ffff80000010f05b: 5d                   	popq	%rbp
ffff80000010f05c: c3                   	retq
ffff80000010f05d: 0f 1f 00             	nopl	(%rax)

ffff80000010f060 <page2kva>:
; {
ffff80000010f060: 55                   	pushq	%rbp
ffff80000010f061: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f064: 48 83 ec 10          	subq	$16, %rsp
ffff80000010f068: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000010f06c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f070: 48 b8 50 f8 10 00 00 80 ff ff	movabsq	$-140737487243184, %rax # imm = 0xFFFF80000010F850
ffff80000010f07a: ff d0                	callq	*%rax
ffff80000010f07c: 48 89 c2             	movq	%rax, %rdx
ffff80000010f07f: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff80000010f089: 48 b8 e0 f5 10 00 00 80 ff ff	movabsq	$-140737487243808, %rax # imm = 0xFFFF80000010F5E0
ffff80000010f093: be 50 00 00 00       	movl	$80, %esi
ffff80000010f098: ff d0                	callq	*%rax
ffff80000010f09a: 48 83 c4 10          	addq	$16, %rsp
ffff80000010f09e: 5d                   	popq	%rbp
ffff80000010f09f: c3                   	retq

ffff80000010f0a0 <_paddr>:
; {
ffff80000010f0a0: 55                   	pushq	%rbp
ffff80000010f0a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f0a4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010f0a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010f0ac: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010f0af: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010f0b3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f0b7: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010f0c1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f0c4: 0f 83 24 00 00 00    	jae	0xffff80000010f0ee <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010f0ca: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f0ce: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010f0d1: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f0d5: 48 ba ed 87 11 00 00 80 ff ff	movabsq	$-140737487206419, %rdx # imm = 0xFFFF8000001187ED
ffff80000010f0df: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f0e9: 31 c0                	xorl	%eax, %eax
ffff80000010f0eb: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010f0ee: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f0f2: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010f0fc: 48 29 c8             	subq	%rcx, %rax
ffff80000010f0ff: 48 83 c4 20          	addq	$32, %rsp
ffff80000010f103: 5d                   	popq	%rbp
ffff80000010f104: c3                   	retq
ffff80000010f105: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f10f: 90                   	nop

ffff80000010f110 <mem_init>:
; {
ffff80000010f110: 55                   	pushq	%rbp
ffff80000010f111: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f114: 48 83 ec 60          	subq	$96, %rsp
ffff80000010f118: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	uintptr_t highest_addr = 0;
ffff80000010f11c: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
; 	align_boot_info(boot_info);
ffff80000010f124: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f128: 48 b8 40 de 10 00 00 80 ff ff	movabsq	$-140737487249856, %rax # imm = 0xFFFF80000010DE40
ffff80000010f132: ff d0                	callq	*%rax
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010f134: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010f13c: 48 83 7d d8 0a       	cmpq	$10, -40(%rbp)
ffff80000010f141: 0f 83 32 00 00 00    	jae	0xffff80000010f179 <mem_init+0x69>
; 		list_init(buddy_free_list + i);
ffff80000010f147: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010f14b: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010f14f: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff80000010f159: 48 01 c7             	addq	%rax, %rdi
ffff80000010f15c: 48 b8 e0 07 11 00 00 80 ff ff	movabsq	$-140737487239200, %rax # imm = 0xFFFF8000001107E0
ffff80000010f166: ff d0                	callq	*%rax
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010f168: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f16c: 48 83 c0 01          	addq	$1, %rax
ffff80000010f170: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010f174: e9 c3 ff ff ff       	jmp	0xffff80000010f13c <mem_init+0x2c>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010f179: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f17d: 8b 00                	movl	(%rax), %eax
ffff80000010f17f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f183: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010f18b: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f18f: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f193: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f196: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f199: 0f 83 43 00 00 00    	jae	0xffff80000010f1e2 <mem_init+0xd2>
; 		if (entry->type != MMAP_FREE)
ffff80000010f19f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1a3: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010f1a7: 0f 84 05 00 00 00    	je	0xffff80000010f1b2 <mem_init+0xa2>
; 			continue;
ffff80000010f1ad: e9 13 00 00 00       	jmp	0xffff80000010f1c5 <mem_init+0xb5>
; 		highest_addr = entry->addr + entry->len;
ffff80000010f1b2: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1b6: 48 8b 00             	movq	(%rax), %rax
ffff80000010f1b9: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010f1bd: 48 03 41 08          	addq	8(%rcx), %rax
ffff80000010f1c1: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f1c5: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f1c9: 48 83 c0 01          	addq	$1, %rax
ffff80000010f1cd: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010f1d1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f1d5: 48 83 c0 18          	addq	$24, %rax
ffff80000010f1d9: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f1dd: e9 a9 ff ff ff       	jmp	0xffff80000010f18b <mem_init+0x7b>
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010f1e2: c7 45 cc 00 00 80 00 	movl	$8388608, -52(%rbp)     # imm = 0x800000
ffff80000010f1e9: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f1ed: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010f1f1: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff80000010f1f5: 48 3b 45 c0          	cmpq	-64(%rbp), %rax
ffff80000010f1f9: 0f 87 0d 00 00 00    	ja	0xffff80000010f20c <mem_init+0xfc>
ffff80000010f1ff: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff80000010f203: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f207: e9 08 00 00 00       	jmp	0xffff80000010f214 <mem_init+0x104>
ffff80000010f20c: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f210: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f214: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010f218: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010f21c: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010f220: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010f224: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff80000010f22e: 48 89 08             	movq	%rcx, (%rax)
; 	pages = boot_alloc(npages * sizeof *pages);
ffff80000010f231: 8b 38                	movl	(%rax), %edi
ffff80000010f233: c1 e7 05             	shll	$5, %edi
ffff80000010f236: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f240: ff d0                	callq	*%rax
ffff80000010f242: 48 89 c1             	movq	%rax, %rcx
ffff80000010f245: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f24f: 48 89 08             	movq	%rcx, (%rax)
; 	page_init(boot_info);
ffff80000010f252: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f256: 48 b8 f0 f2 10 00 00 80 ff ff	movabsq	$-140737487244560, %rax # imm = 0xFFFF80000010F2F0
ffff80000010f260: ff d0                	callq	*%rax
; 	pml4_setup(boot_info);
ffff80000010f262: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f266: 48 b8 10 ef 10 00 00 80 ff ff	movabsq	$-140737487245552, %rax # imm = 0xFFFF80000010EF10
ffff80000010f270: ff d0                	callq	*%rax
; 	uint64_t efer = read_msr(MSR_EFER);
ffff80000010f272: 48 b8 70 f5 10 00 00 80 ff ff	movabsq	$-140737487243920, %rax # imm = 0xFFFF80000010F570
ffff80000010f27c: bf 80 00 00 c0       	movl	$3221225600, %edi       # imm = 0xC0000080
ffff80000010f281: 89 7d a4             	movl	%edi, -92(%rbp)
ffff80000010f284: ff d0                	callq	*%rax
ffff80000010f286: 8b 7d a4             	movl	-92(%rbp), %edi
ffff80000010f289: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 	write_msr(MSR_EFER, efer | MSR_EFER_NXE);
ffff80000010f28d: 48 8b 75 b0          	movq	-80(%rbp), %rsi
ffff80000010f291: 48 81 ce 00 08 00 00 	orq	$2048, %rsi             # imm = 0x800
ffff80000010f298: 48 b8 a0 f5 10 00 00 80 ff ff	movabsq	$-140737487243872, %rax # imm = 0xFFFF80000010F5A0
ffff80000010f2a2: ff d0                	callq	*%rax
; 	dump_page_tables(kernel_pml4, PAGE_PRESENT);
ffff80000010f2a4: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000010f2ae: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f2b1: 48 b8 00 2c 11 00 00 80 ff ff	movabsq	$-140737487229952, %rax # imm = 0xFFFF800000112C00
ffff80000010f2bb: be 01 00 00 00       	movl	$1, %esi
ffff80000010f2c0: ff d0                	callq	*%rax
; 	panic("debug panic");
ffff80000010f2c2: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f2cc: 48 ba 51 8b 11 00 00 80 ff ff	movabsq	$-140737487205551, %rdx # imm = 0xFFFF800000118B51
ffff80000010f2d6: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010f2e0: 31 c0                	xorl	%eax, %eax
ffff80000010f2e2: be 88 00 00 00       	movl	$136, %esi
ffff80000010f2e7: ff d1                	callq	*%rcx
ffff80000010f2e9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f2f0 <page_init>:
; {
ffff80000010f2f0: 55                   	pushq	%rbp
ffff80000010f2f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f2f4: 48 83 ec 60          	subq	$96, %rsp
ffff80000010f2f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	for (i = 0; i < npages; ++i) {
ffff80000010f2fc: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f304: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f308: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f312: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f315: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f318: 0f 83 67 00 00 00    	jae	0xffff80000010f385 <page_init+0x95>
; 		page = pages + i;
ffff80000010f31e: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f328: 48 8b 00             	movq	(%rax), %rax
ffff80000010f32b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010f32f: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010f333: 48 01 c8             	addq	%rcx, %rax
ffff80000010f336: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		list_init(&page->pp_node);
ffff80000010f33a: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff80000010f33e: 48 b8 e0 07 11 00 00 80 ff ff	movabsq	$-140737487239200, %rax # imm = 0xFFFF8000001107E0
ffff80000010f348: ff d0                	callq	*%rax
; 		page->pp_ref = 0;
ffff80000010f34a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f34e: 66 c7 40 10 00 00    	movw	$0, 16(%rax)
; 		page->pp_free = false;
ffff80000010f354: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f358: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f35b: 80 e1 7f             	andb	$127, %cl
ffff80000010f35e: 80 c9 00             	orb	$0, %cl
ffff80000010f361: 88 48 12             	movb	%cl, 18(%rax)
; 		page->pp_order = 0;
ffff80000010f364: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f368: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f36b: 80 e1 80             	andb	$-128, %cl
ffff80000010f36e: 80 c9 00             	orb	$0, %cl
ffff80000010f371: 88 48 12             	movb	%cl, 18(%rax)
; 	for (i = 0; i < npages; ++i) {
ffff80000010f374: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f378: 48 83 c0 01          	addq	$1, %rax
ffff80000010f37c: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f380: e9 7f ff ff ff       	jmp	0xffff80000010f304 <page_init+0x14>
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010f385: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f389: 8b 00                	movl	(%rax), %eax
ffff80000010f38b: 89 c2                	movl	%eax, %edx
ffff80000010f38d: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f397: 48 b8 e0 f5 10 00 00 80 ff ff	movabsq	$-140737487243808, %rax # imm = 0xFFFF80000010F5E0
ffff80000010f3a1: be bb 00 00 00       	movl	$187, %esi
ffff80000010f3a6: ff d0                	callq	*%rax
ffff80000010f3a8: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010f3ac: 31 c0                	xorl	%eax, %eax
ffff80000010f3ae: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f3b8: 31 ff                	xorl	%edi, %edi
ffff80000010f3ba: ff d0                	callq	*%rax
ffff80000010f3bc: 48 89 c2             	movq	%rax, %rdx
ffff80000010f3bf: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f3c9: 48 b8 a0 f0 10 00 00 80 ff ff	movabsq	$-140737487245152, %rax # imm = 0xFFFF80000010F0A0
ffff80000010f3d3: be bc 00 00 00       	movl	$188, %esi
ffff80000010f3d8: ff d0                	callq	*%rax
ffff80000010f3da: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f3de: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f3e6: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f3ea: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f3ee: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f3f1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f3f4: 0f 83 6e 01 00 00    	jae	0xffff80000010f568 <page_init+0x278>
; 		if((entry->type & MMAP_FREE) == 0){
ffff80000010f3fa: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f3fe: 8b 40 10             	movl	16(%rax), %eax
ffff80000010f401: 83 e0 01             	andl	$1, %eax
ffff80000010f404: 83 f8 00             	cmpl	$0, %eax
ffff80000010f407: 0f 85 05 00 00 00    	jne	0xffff80000010f412 <page_init+0x122>
; 			continue;
ffff80000010f40d: e9 39 01 00 00       	jmp	0xffff80000010f54b <page_init+0x25b>
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010f412: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f416: 48 8b 00             	movq	(%rax), %rax
ffff80000010f419: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f41d: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f421: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f425: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f428: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000010f42c: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010f430: 48 89 4d c0          	movq	%rcx, -64(%rbp)
ffff80000010f434: 48 8b 4d c0          	movq	-64(%rbp), %rcx
ffff80000010f438: 48 8b 55 c0          	movq	-64(%rbp), %rdx
ffff80000010f43c: 48 81 e2 ff 0f 00 00 	andq	$4095, %rdx             # imm = 0xFFF
ffff80000010f443: 48 29 d1             	subq	%rdx, %rcx
ffff80000010f446: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010f44a: 48 3b 45 b8          	cmpq	-72(%rbp), %rax
ffff80000010f44e: 0f 83 f2 00 00 00    	jae	0xffff80000010f546 <page_init+0x256>
; 			if(i + PAGE_SIZE > BOOT_MAP_LIM){
ffff80000010f454: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f458: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f45e: 48 3d 00 00 80 00    	cmpq	$8388608, %rax          # imm = 0x800000
ffff80000010f464: 0f 86 05 00 00 00    	jbe	0xffff80000010f46f <page_init+0x17f>
; 				break;
ffff80000010f46a: e9 d7 00 00 00       	jmp	0xffff80000010f546 <page_init+0x256>
; 			if(i == 0){
ffff80000010f46f: 48 83 7d c8 00       	cmpq	$0, -56(%rbp)
ffff80000010f474: 0f 85 05 00 00 00    	jne	0xffff80000010f47f <page_init+0x18f>
; 				continue;
ffff80000010f47a: e9 b4 00 00 00       	jmp	0xffff80000010f533 <page_init+0x243>
; 			if(i == (physaddr_t)boot_info->elf_hdr){
ffff80000010f47f: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f483: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f487: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010f48b: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f48e: 0f 85 05 00 00 00    	jne	0xffff80000010f499 <page_init+0x1a9>
; 				continue;
ffff80000010f494: e9 9a 00 00 00       	jmp	0xffff80000010f533 <page_init+0x243>
; 			if(i >= KERNEL_LMA && i < (uint64_t)end){
ffff80000010f499: 48 81 7d c8 00 00 10 00      	cmpq	$1048576, -56(%rbp) # imm = 0x100000
ffff80000010f4a1: 0f 82 13 00 00 00    	jb	0xffff80000010f4ba <page_init+0x1ca>
ffff80000010f4a7: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f4ab: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff80000010f4af: 0f 83 05 00 00 00    	jae	0xffff80000010f4ba <page_init+0x1ca>
; 				continue;
ffff80000010f4b5: e9 79 00 00 00       	jmp	0xffff80000010f533 <page_init+0x243>
; 			if(i == PAGE_ADDR(PADDR(boot_info))){
ffff80000010f4ba: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f4be: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010f4c2: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010f4c6: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f4d0: 48 b8 a0 f0 10 00 00 80 ff ff	movabsq	$-140737487245152, %rax # imm = 0xFFFF80000010F0A0
ffff80000010f4da: be dd 00 00 00       	movl	$221, %esi
ffff80000010f4df: ff d0                	callq	*%rax
ffff80000010f4e1: 48 89 c1             	movq	%rax, %rcx
ffff80000010f4e4: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff80000010f4e8: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010f4f2: 48 21 d1             	andq	%rdx, %rcx
ffff80000010f4f5: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f4f8: 0f 85 05 00 00 00    	jne	0xffff80000010f503 <page_init+0x213>
; 				continue;
ffff80000010f4fe: e9 30 00 00 00       	jmp	0xffff80000010f533 <page_init+0x243>
; 			size_t page_index = i >> 12;
ffff80000010f503: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f507: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f50b: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 			page_free(pages + page_index);
ffff80000010f50f: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f519: 48 8b 38             	movq	(%rax), %rdi
ffff80000010f51c: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff80000010f520: 48 c1 e0 05          	shlq	$5, %rax
ffff80000010f524: 48 01 c7             	addq	%rax, %rdi
ffff80000010f527: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000010f531: ff d0                	callq	*%rax
; 		for(physaddr_t i = entry->addr; i < ROUNDDOWN(entry->addr + entry->len, PAGE_SIZE); i += PAGE_SIZE){
ffff80000010f533: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f537: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f53d: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f541: e9 d7 fe ff ff       	jmp	0xffff80000010f41d <page_init+0x12d>
; 	}
ffff80000010f546: e9 00 00 00 00       	jmp	0xffff80000010f54b <page_init+0x25b>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f54b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f54f: 48 83 c0 01          	addq	$1, %rax
ffff80000010f553: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f557: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f55b: 48 83 c0 18          	addq	$24, %rax
ffff80000010f55f: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f563: e9 7e fe ff ff       	jmp	0xffff80000010f3e6 <page_init+0xf6>
; }
ffff80000010f568: 48 83 c4 60          	addq	$96, %rsp
ffff80000010f56c: 5d                   	popq	%rbp
ffff80000010f56d: c3                   	retq
ffff80000010f56e: 66 90                	nop

ffff80000010f570 <read_msr>:
; {
ffff80000010f570: 55                   	pushq	%rbp
ffff80000010f571: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f574: 89 7d fc             	movl	%edi, -4(%rbp)
; 		"c" (reg));
ffff80000010f577: 8b 4d fc             	movl	-4(%rbp), %ecx
; 	asm volatile(
ffff80000010f57a: 0f 32                	rdmsr
ffff80000010f57c: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000010f57f: 89 55 f4             	movl	%edx, -12(%rbp)
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff80000010f582: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000010f585: 48 c1 e0 20          	shlq	$32, %rax
ffff80000010f589: 8b 4d f8             	movl	-8(%rbp), %ecx
ffff80000010f58c: 48 09 c8             	orq	%rcx, %rax
ffff80000010f58f: 5d                   	popq	%rbp
ffff80000010f590: c3                   	retq
ffff80000010f591: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f59b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f5a0 <write_msr>:
; {
ffff80000010f5a0: 55                   	pushq	%rbp
ffff80000010f5a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f5a4: 89 7d fc             	movl	%edi, -4(%rbp)
ffff80000010f5a7: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 		"c" (reg),
ffff80000010f5ab: 8b 4d fc             	movl	-4(%rbp), %ecx
; 		"a" ((uint32_t)(val & 0xFFFFFFFF)),
ffff80000010f5ae: 48 b8 ff ff ff ff 00 00 00 00	movabsq	$4294967295, %rax # imm = 0xFFFFFFFF
ffff80000010f5b8: 48 23 45 f0          	andq	-16(%rbp), %rax
; 		"d" ((uint32_t)((val >> 32) & 0xFFFFFFFF)));
ffff80000010f5bc: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000010f5c0: 48 c1 ea 20          	shrq	$32, %rdx
ffff80000010f5c4: 48 be ff ff ff ff 00 00 00 00	movabsq	$4294967295, %rsi # imm = 0xFFFFFFFF
ffff80000010f5ce: 48 21 f2             	andq	%rsi, %rdx
; 	asm volatile(
ffff80000010f5d1: 0f 30                	wrmsr
; }
ffff80000010f5d3: 5d                   	popq	%rbp
ffff80000010f5d4: c3                   	retq
ffff80000010f5d5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f5df: 90                   	nop

ffff80000010f5e0 <_kaddr>:
; {
ffff80000010f5e0: 55                   	pushq	%rbp
ffff80000010f5e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f5e4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010f5e8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010f5ec: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010f5ef: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010f5f3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f5f7: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f5fb: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f605: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f608: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f60b: 0f 82 24 00 00 00    	jb	0xffff80000010f635 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010f611: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f615: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010f618: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f61c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
ffff80000010f626: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f630: 31 c0                	xorl	%eax, %eax
ffff80000010f632: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010f635: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010f63f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010f643: 48 83 c4 20          	addq	$32, %rsp
ffff80000010f647: 5d                   	popq	%rbp
ffff80000010f648: c3                   	retq
ffff80000010f649: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f650 <page_init_ext>:
; {
ffff80000010f650: 55                   	pushq	%rbp
ffff80000010f651: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f654: 48 83 ec 40          	subq	$64, %rsp
ffff80000010f658: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010f65c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f660: 8b 00                	movl	(%rax), %eax
ffff80000010f662: 89 c2                	movl	%eax, %edx
ffff80000010f664: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f66e: 48 b8 e0 f5 10 00 00 80 ff ff	movabsq	$-140737487243808, %rax # imm = 0xFFFF80000010F5E0
ffff80000010f678: be f0 00 00 00       	movl	$240, %esi
ffff80000010f67d: ff d0                	callq	*%rax
ffff80000010f67f: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010f683: 31 c0                	xorl	%eax, %eax
ffff80000010f685: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010f68f: 31 ff                	xorl	%edi, %edi
ffff80000010f691: ff d0                	callq	*%rax
ffff80000010f693: 48 89 c2             	movq	%rax, %rdx
ffff80000010f696: 48 bf e4 8f 11 00 00 80 ff ff	movabsq	$-140737487204380, %rdi # imm = 0xFFFF800000118FE4
ffff80000010f6a0: 48 b8 a0 f0 10 00 00 80 ff ff	movabsq	$-140737487245152, %rax # imm = 0xFFFF80000010F0A0
ffff80000010f6aa: be f1 00 00 00       	movl	$241, %esi
ffff80000010f6af: ff d0                	callq	*%rax
ffff80000010f6b1: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f6b5: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010f6bd: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f6c1: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f6c5: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010f6c8: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f6cb: 0f 83 ef 00 00 00    	jae	0xffff80000010f7c0 <page_init_ext+0x170>
; 		if(entry->type != MMAP_FREE) continue;
ffff80000010f6d1: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f6d5: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010f6d9: 0f 84 05 00 00 00    	je	0xffff80000010f6e4 <page_init_ext+0x94>
ffff80000010f6df: e9 bf 00 00 00       	jmp	0xffff80000010f7a3 <page_init_ext+0x153>
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010f6e4: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f6e8: 48 8b 00             	movq	(%rax), %rax
ffff80000010f6eb: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f6ef: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f6f3: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f6f7: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f6fa: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000010f6fe: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010f702: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f705: 0f 87 93 00 00 00    	ja	0xffff80000010f79e <page_init_ext+0x14e>
; 			if(addr < BOOT_MAP_LIM) continue;
ffff80000010f70b: 48 81 7d c8 00 00 80 00      	cmpq	$8388608, -56(%rbp) # imm = 0x800000
ffff80000010f713: 0f 83 05 00 00 00    	jae	0xffff80000010f71e <page_init_ext+0xce>
ffff80000010f719: e9 6d 00 00 00       	jmp	0xffff80000010f78b <page_init_ext+0x13b>
; 			struct page_info* page = pa2page(addr);
ffff80000010f71e: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f722: 48 b8 d0 f7 10 00 00 80 ff ff	movabsq	$-140737487243312, %rax # imm = 0xFFFF80000010F7D0
ffff80000010f72c: ff d0                	callq	*%rax
ffff80000010f72e: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 			list_init(&page->pp_node);
ffff80000010f732: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff80000010f736: 48 b8 e0 07 11 00 00 80 ff ff	movabsq	$-140737487239200, %rax # imm = 0xFFFF8000001107E0
ffff80000010f740: ff d0                	callq	*%rax
; 			page->pp_ref = 0;
ffff80000010f742: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f746: 66 c7 40 10 00 00    	movw	$0, 16(%rax)
; 			page->pp_free = false;
ffff80000010f74c: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f750: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f753: 80 e1 7f             	andb	$127, %cl
ffff80000010f756: 80 c9 00             	orb	$0, %cl
ffff80000010f759: 88 48 12             	movb	%cl, 18(%rax)
; 			page->pp_order = 0;
ffff80000010f75c: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010f760: 8a 48 12             	movb	18(%rax), %cl
ffff80000010f763: 80 e1 80             	andb	$-128, %cl
ffff80000010f766: 80 c9 00             	orb	$0, %cl
ffff80000010f769: 88 48 12             	movb	%cl, 18(%rax)
; 			page_free(pa2page(addr));
ffff80000010f76c: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010f770: 48 b8 d0 f7 10 00 00 80 ff ff	movabsq	$-140737487243312, %rax # imm = 0xFFFF80000010F7D0
ffff80000010f77a: ff d0                	callq	*%rax
ffff80000010f77c: 48 89 c7             	movq	%rax, %rdi
ffff80000010f77f: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000010f789: ff d0                	callq	*%rax
; 		for(physaddr_t addr = entry->addr; addr <= entry->addr + entry->len; addr += PAGE_SIZE){
ffff80000010f78b: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010f78f: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010f795: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010f799: e9 51 ff ff ff       	jmp	0xffff80000010f6ef <page_init_ext+0x9f>
; 	}
ffff80000010f79e: e9 00 00 00 00       	jmp	0xffff80000010f7a3 <page_init_ext+0x153>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010f7a3: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010f7a7: 48 83 c0 01          	addq	$1, %rax
ffff80000010f7ab: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010f7af: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f7b3: 48 83 c0 18          	addq	$24, %rax
ffff80000010f7b7: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f7bb: e9 fd fe ff ff       	jmp	0xffff80000010f6bd <page_init_ext+0x6d>
; }
ffff80000010f7c0: 48 83 c4 40          	addq	$64, %rsp
ffff80000010f7c4: 5d                   	popq	%rbp
ffff80000010f7c5: c3                   	retq
ffff80000010f7c6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f7d0 <pa2page>:
; {
ffff80000010f7d0: 55                   	pushq	%rbp
ffff80000010f7d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7d4: 48 83 ec 10          	subq	$16, %rsp
ffff80000010f7d8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010f7dc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f7e0: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010f7e4: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010f7ee: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f7f1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f7f4: 0f 82 27 00 00 00    	jb	0xffff80000010f821 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010f7fa: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff80000010f804: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000010f80e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010f818: 31 c0                	xorl	%eax, %eax
ffff80000010f81a: be 49 00 00 00       	movl	$73, %esi
ffff80000010f81f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff80000010f821: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010f82b: 48 8b 00             	movq	(%rax), %rax
ffff80000010f82e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010f832: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010f836: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010f83a: 48 01 c8             	addq	%rcx, %rax
ffff80000010f83d: 48 83 c4 10          	addq	$16, %rsp
ffff80000010f841: 5d                   	popq	%rbp
ffff80000010f842: c3                   	retq
ffff80000010f843: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f84d: 0f 1f 00             	nopl	(%rax)

ffff80000010f850 <page2pa>:
; {
ffff80000010f850: 55                   	pushq	%rbp
ffff80000010f851: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f854: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010f858: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010f85c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010f866: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010f869: 48 29 c8             	subq	%rcx, %rax
ffff80000010f86c: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010f870: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010f874: 5d                   	popq	%rbp
ffff80000010f875: c3                   	retq
ffff80000010f876: cc                   	int3
ffff80000010f877: cc                   	int3
ffff80000010f878: cc                   	int3
ffff80000010f879: cc                   	int3
ffff80000010f87a: cc                   	int3
ffff80000010f87b: cc                   	int3
ffff80000010f87c: cc                   	int3
ffff80000010f87d: cc                   	int3
ffff80000010f87e: cc                   	int3
ffff80000010f87f: cc                   	int3

ffff80000010f880 <lab1_check_free_list_avail>:
; {
ffff80000010f880: 55                   	pushq	%rbp
ffff80000010f881: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f884: 48 83 ec 30          	subq	$48, %rsp
; 	size_t nfree_basemem = 0;
ffff80000010f888: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	size_t nfree_extmem = 0;
ffff80000010f890: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010f898: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010f8a0: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010f8a5: 0f 83 aa 00 00 00    	jae	0xffff80000010f955 <lab1_check_free_list_avail+0xd5>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010f8ab: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f8af: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010f8b3: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010f8bd: 48 01 c8             	addq	%rcx, %rax
ffff80000010f8c0: 48 8b 00             	movq	(%rax), %rax
ffff80000010f8c3: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f8c7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f8cb: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010f8cf: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010f8d3: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010f8dd: 48 01 d1             	addq	%rdx, %rcx
ffff80000010f8e0: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f8e3: 0f 84 56 00 00 00    	je	0xffff80000010f93f <lab1_check_free_list_avail+0xbf>
; 			page = container_of(node, struct page_info, pp_node);
ffff80000010f8e9: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f8ed: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010f8f1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010f8f5: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010f8ff: ff d0                	callq	*%rax
ffff80000010f901: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010f907: 0f 83 11 00 00 00    	jae	0xffff80000010f91e <lab1_check_free_list_avail+0x9e>
; 				++nfree_basemem;
ffff80000010f90d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010f911: 48 83 c0 01          	addq	$1, %rax
ffff80000010f915: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 			} else {
ffff80000010f919: e9 0c 00 00 00       	jmp	0xffff80000010f92a <lab1_check_free_list_avail+0xaa>
; 				++nfree_extmem;
ffff80000010f91e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010f922: 48 83 c0 01          	addq	$1, %rax
ffff80000010f926: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		}
ffff80000010f92a: e9 00 00 00 00       	jmp	0xffff80000010f92f <lab1_check_free_list_avail+0xaf>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010f92f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010f933: 48 8b 00             	movq	(%rax), %rax
ffff80000010f936: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f93a: e9 88 ff ff ff       	jmp	0xffff80000010f8c7 <lab1_check_free_list_avail+0x47>
; 	}
ffff80000010f93f: e9 00 00 00 00       	jmp	0xffff80000010f944 <lab1_check_free_list_avail+0xc4>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010f944: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010f948: 48 83 c0 01          	addq	$1, %rax
ffff80000010f94c: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f950: e9 4b ff ff ff       	jmp	0xffff80000010f8a0 <lab1_check_free_list_avail+0x20>
; 	assert(nfree_basemem > 0);
ffff80000010f955: e9 00 00 00 00       	jmp	0xffff80000010f95a <lab1_check_free_list_avail+0xda>
ffff80000010f95a: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000010f95f: 0f 87 32 00 00 00    	ja	0xffff80000010f997 <lab1_check_free_list_avail+0x117>
ffff80000010f965: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010f96f: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000010f979: 48 b9 87 92 11 00 00 80 ff ff	movabsq	$-140737487203705, %rcx # imm = 0xFFFF800000119287
ffff80000010f983: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f98d: 31 c0                	xorl	%eax, %eax
ffff80000010f98f: be 21 00 00 00       	movl	$33, %esi
ffff80000010f994: 41 ff d0             	callq	*%r8
ffff80000010f997: e9 00 00 00 00       	jmp	0xffff80000010f99c <lab1_check_free_list_avail+0x11c>
; 	assert(nfree_extmem > 0);
ffff80000010f99c: e9 00 00 00 00       	jmp	0xffff80000010f9a1 <lab1_check_free_list_avail+0x121>
ffff80000010f9a1: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff80000010f9a6: 0f 87 32 00 00 00    	ja	0xffff80000010f9de <lab1_check_free_list_avail+0x15e>
ffff80000010f9ac: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010f9b6: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000010f9c0: 48 b9 1e 8f 11 00 00 80 ff ff	movabsq	$-140737487204578, %rcx # imm = 0xFFFF800000118F1E
ffff80000010f9ca: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010f9d4: 31 c0                	xorl	%eax, %eax
ffff80000010f9d6: be 22 00 00 00       	movl	$34, %esi
ffff80000010f9db: 41 ff d0             	callq	*%r8
ffff80000010f9de: e9 00 00 00 00       	jmp	0xffff80000010f9e3 <lab1_check_free_list_avail+0x163>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010f9e3: 48 bf 7b 87 11 00 00 80 ff ff	movabsq	$-140737487206533, %rdi # imm = 0xFFFF80000011877B
ffff80000010f9ed: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010f9f7: 31 c0                	xorl	%eax, %eax
ffff80000010f9f9: ff d1                	callq	*%rcx
; }
ffff80000010f9fb: 48 83 c4 30          	addq	$48, %rsp
ffff80000010f9ff: 5d                   	popq	%rbp
ffff80000010fa00: c3                   	retq
ffff80000010fa01: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fa0b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010fa10 <page2pa>:
; {
ffff80000010fa10: 55                   	pushq	%rbp
ffff80000010fa11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa14: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010fa18: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fa1c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff80000010fa26: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fa29: 48 29 c8             	subq	%rcx, %rax
ffff80000010fa2c: 48 c1 f8 05          	sarq	$5, %rax
ffff80000010fa30: 48 c1 e0 0c          	shlq	$12, %rax
ffff80000010fa34: 5d                   	popq	%rbp
ffff80000010fa35: c3                   	retq
ffff80000010fa36: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010fa40 <lab1_check_free_list_order>:
; {
ffff80000010fa40: 55                   	pushq	%rbp
ffff80000010fa41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa44: 48 83 ec 20          	subq	$32, %rsp
; 	size_t nviolations = 0;
ffff80000010fa48: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fa50: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010fa58: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000010fa5d: 0f 83 93 00 00 00    	jae	0xffff80000010faf6 <lab1_check_free_list_order+0xb6>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fa63: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fa67: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010fa6b: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff80000010fa75: 48 01 c8             	addq	%rcx, %rax
ffff80000010fa78: 48 8b 00             	movq	(%rax), %rax
ffff80000010fa7b: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fa7f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fa83: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010fa87: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000010fa8b: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff80000010fa95: 48 01 d1             	addq	%rdx, %rcx
ffff80000010fa98: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fa9b: 0f 84 3f 00 00 00    	je	0xffff80000010fae0 <lab1_check_free_list_order+0xa0>
; 			page = container_of(node, struct page_info, pp_node);
ffff80000010faa1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010faa5: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page->pp_order != order)
ffff80000010faa9: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010faad: 8a 40 12             	movb	18(%rax), %al
ffff80000010fab0: 24 7f                	andb	$127, %al
ffff80000010fab2: 0f b6 c0             	movzbl	%al, %eax
ffff80000010fab5: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000010fab9: 0f 84 0c 00 00 00    	je	0xffff80000010facb <lab1_check_free_list_order+0x8b>
; 				++nviolations;
ffff80000010fabf: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010fac3: 48 83 c0 01          	addq	$1, %rax
ffff80000010fac7: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		}
ffff80000010facb: e9 00 00 00 00       	jmp	0xffff80000010fad0 <lab1_check_free_list_order+0x90>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010fad0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fad4: 48 8b 00             	movq	(%rax), %rax
ffff80000010fad7: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fadb: e9 9f ff ff ff       	jmp	0xffff80000010fa7f <lab1_check_free_list_order+0x3f>
; 	}
ffff80000010fae0: e9 00 00 00 00       	jmp	0xffff80000010fae5 <lab1_check_free_list_order+0xa5>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010fae5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fae9: 48 83 c0 01          	addq	$1, %rax
ffff80000010faed: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010faf1: e9 62 ff ff ff       	jmp	0xffff80000010fa58 <lab1_check_free_list_order+0x18>
; 	if (nviolations != 0) {
ffff80000010faf6: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff80000010fafb: 0f 84 2c 00 00 00    	je	0xffff80000010fb2d <lab1_check_free_list_order+0xed>
; 		panic("found %u order violations in free list", nviolations);
ffff80000010fb01: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000010fb05: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fb0f: 48 ba 61 93 11 00 00 80 ff ff	movabsq	$-140737487203487, %rdx # imm = 0xFFFF800000119361
ffff80000010fb19: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fb23: 31 c0                	xorl	%eax, %eax
ffff80000010fb25: be 3b 00 00 00       	movl	$59, %esi
ffff80000010fb2a: 41 ff d0             	callq	*%r8
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010fb2d: 48 bf 5f 90 11 00 00 80 ff ff	movabsq	$-140737487204257, %rdi # imm = 0xFFFF80000011905F
ffff80000010fb37: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010fb41: 31 c0                	xorl	%eax, %eax
ffff80000010fb43: ff d1                	callq	*%rcx
; }
ffff80000010fb45: 48 83 c4 20          	addq	$32, %rsp
ffff80000010fb49: 5d                   	popq	%rbp
ffff80000010fb4a: c3                   	retq
ffff80000010fb4b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010fb50 <lab1_check_memory_layout>:
; {
ffff80000010fb50: 55                   	pushq	%rbp
ffff80000010fb51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fb54: 48 83 ec 40          	subq	$64, %rsp
ffff80000010fb58: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010fb5c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fb60: 8b 00                	movl	(%rax), %eax
ffff80000010fb62: 89 c2                	movl	%eax, %edx
ffff80000010fb64: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fb6e: 48 b8 60 fd 10 00 00 80 ff ff	movabsq	$-140737487241888, %rax # imm = 0xFFFF80000010FD60
ffff80000010fb78: be 48 00 00 00       	movl	$72, %esi
ffff80000010fb7d: ff d0                	callq	*%rax
ffff80000010fb7f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff80000010fb83: 31 c0                	xorl	%eax, %eax
ffff80000010fb85: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000010fb8f: 31 ff                	xorl	%edi, %edi
ffff80000010fb91: ff d0                	callq	*%rax
ffff80000010fb93: 48 89 c2             	movq	%rax, %rdx
ffff80000010fb96: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fba0: 48 b8 d0 fd 10 00 00 80 ff ff	movabsq	$-140737487241776, %rax # imm = 0xFFFF80000010FDD0
ffff80000010fbaa: be 49 00 00 00       	movl	$73, %esi
ffff80000010fbaf: ff d0                	callq	*%rax
ffff80000010fbb1: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010fbb5: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000010fbbd: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010fbc1: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010fbc5: 8b 49 04             	movl	4(%rcx), %ecx
ffff80000010fbc8: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fbcb: 0f 83 68 01 00 00    	jae	0xffff80000010fd39 <lab1_check_memory_layout+0x1e9>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010fbd1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fbd5: 48 8b 00             	movq	(%rax), %rax
ffff80000010fbd8: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010fbdc: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fbe0: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000010fbe4: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fbe7: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000010fbeb: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff80000010fbef: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fbf2: 0f 83 1f 01 00 00    	jae	0xffff80000010fd17 <lab1_check_memory_layout+0x1c7>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010fbf8: 48 81 7d d8 00 00 80 00      	cmpq	$8388608, -40(%rbp) # imm = 0x800000
ffff80000010fc00: 0f 82 05 00 00 00    	jb	0xffff80000010fc0b <lab1_check_memory_layout+0xbb>
; 				continue;
ffff80000010fc06: e9 f9 00 00 00       	jmp	0xffff80000010fd04 <lab1_check_memory_layout+0x1b4>
; 			page = pa2page(pa);
ffff80000010fc0b: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000010fc0f: 48 b8 40 fe 10 00 00 80 ff ff	movabsq	$-140737487241664, %rax # imm = 0xFFFF80000010FE40
ffff80000010fc19: ff d0                	callq	*%rax
ffff80000010fc1b: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			if ((pa == 0 ||
ffff80000010fc1f: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff80000010fc24: 0f 84 84 00 00 00    	je	0xffff80000010fcae <lab1_check_memory_layout+0x15e>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010fc2a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fc2e: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000010fc32: 48 8b 55 f8          	movq	-8(%rbp), %rdx
ffff80000010fc36: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fc40: 48 b8 d0 fd 10 00 00 80 ff ff	movabsq	$-140737487241776, %rax # imm = 0xFFFF80000010FDD0
ffff80000010fc4a: be 54 00 00 00       	movl	$84, %esi
ffff80000010fc4f: ff d0                	callq	*%rax
ffff80000010fc51: 48 89 c1             	movq	%rax, %rcx
ffff80000010fc54: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff80000010fc58: 48 ba 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdx # imm = 0xFFFFFFFFF000
ffff80000010fc62: 48 21 d1             	andq	%rdx, %rcx
ffff80000010fc65: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fc68: 0f 84 40 00 00 00    	je	0xffff80000010fcae <lab1_check_memory_layout+0x15e>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010fc6e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fc72: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010fc76: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010fc7a: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fc7d: 0f 84 2b 00 00 00    	je	0xffff80000010fcae <lab1_check_memory_layout+0x15e>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010fc83: b8 00 00 10 00       	movl	$1048576, %eax          # imm = 0x100000
ffff80000010fc88: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff80000010fc8c: 0f 87 0e 00 00 00    	ja	0xffff80000010fca0 <lab1_check_memory_layout+0x150>
ffff80000010fc92: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fc96: 48 3b 45 d0          	cmpq	-48(%rbp), %rax
ffff80000010fc9a: 0f 82 0e 00 00 00    	jb	0xffff80000010fcae <lab1_check_memory_layout+0x15e>
; 			    entry->type != MMAP_FREE) &&
ffff80000010fca0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fca4: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff80000010fca8: 0f 84 51 00 00 00    	je	0xffff80000010fcff <lab1_check_memory_layout+0x1af>
; 			    page->pp_free) {
ffff80000010fcae: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fcb2: 8a 40 12             	movb	18(%rax), %al
ffff80000010fcb5: c0 e8 07             	shrb	$7, %al
ffff80000010fcb8: 0f b6 c0             	movzbl	%al, %eax
ffff80000010fcbb: 83 f8 00             	cmpl	$0, %eax
; 			if ((pa == 0 ||
ffff80000010fcbe: 0f 84 3b 00 00 00    	je	0xffff80000010fcff <lab1_check_memory_layout+0x1af>
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010fcc4: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010fcc8: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010fcd2: ff d0                	callq	*%rax
ffff80000010fcd4: 48 89 c1             	movq	%rax, %rcx
ffff80000010fcd7: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010fce1: 48 ba 6b 89 11 00 00 80 ff ff	movabsq	$-140737487206037, %rdx # imm = 0xFFFF80000011896B
ffff80000010fceb: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fcf5: 31 c0                	xorl	%eax, %eax
ffff80000010fcf7: be 59 00 00 00       	movl	$89, %esi
ffff80000010fcfc: 41 ff d0             	callq	*%r8
; 		}
ffff80000010fcff: e9 00 00 00 00       	jmp	0xffff80000010fd04 <lab1_check_memory_layout+0x1b4>
; 		     pa += PAGE_SIZE) {
ffff80000010fd04: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000010fd08: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000010fd0e: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010fd12: e9 c5 fe ff ff       	jmp	0xffff80000010fbdc <lab1_check_memory_layout+0x8c>
; 	}
ffff80000010fd17: e9 00 00 00 00       	jmp	0xffff80000010fd1c <lab1_check_memory_layout+0x1cc>
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010fd1c: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010fd20: 48 83 c0 01          	addq	$1, %rax
ffff80000010fd24: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010fd28: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000010fd2c: 48 83 c0 18          	addq	$24, %rax
ffff80000010fd30: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010fd34: e9 84 fe ff ff       	jmp	0xffff80000010fbbd <lab1_check_memory_layout+0x6d>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010fd39: 48 bf 11 88 11 00 00 80 ff ff	movabsq	$-140737487206383, %rdi # imm = 0xFFFF800000118811
ffff80000010fd43: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000010fd4d: 31 c0                	xorl	%eax, %eax
ffff80000010fd4f: ff d1                	callq	*%rcx
; }
ffff80000010fd51: 48 83 c4 40          	addq	$64, %rsp
ffff80000010fd55: 5d                   	popq	%rbp
ffff80000010fd56: c3                   	retq
ffff80000010fd57: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010fd60 <_kaddr>:
; {
ffff80000010fd60: 55                   	pushq	%rbp
ffff80000010fd61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fd64: 48 83 ec 20          	subq	$32, %rsp
ffff80000010fd68: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010fd6c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010fd6f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010fd73: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fd77: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010fd7b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010fd85: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fd88: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fd8b: 0f 82 24 00 00 00    	jb	0xffff80000010fdb5 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010fd91: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010fd95: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010fd98: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010fd9c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
ffff80000010fda6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fdb0: 31 c0                	xorl	%eax, %eax
ffff80000010fdb2: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010fdb5: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000010fdbf: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff80000010fdc3: 48 83 c4 20          	addq	$32, %rsp
ffff80000010fdc7: 5d                   	popq	%rbp
ffff80000010fdc8: c3                   	retq
ffff80000010fdc9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010fdd0 <_paddr>:
; {
ffff80000010fdd0: 55                   	pushq	%rbp
ffff80000010fdd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fdd4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010fdd8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010fddc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000010fddf: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010fde3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fde7: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010fdf1: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fdf4: 0f 83 24 00 00 00    	jae	0xffff80000010fe1e <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010fdfa: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010fdfe: 8b 75 f4             	movl	-12(%rbp), %esi
ffff80000010fe01: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010fe05: 48 ba ed 87 11 00 00 80 ff ff	movabsq	$-140737487206419, %rdx # imm = 0xFFFF8000001187ED
ffff80000010fe0f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000010fe19: 31 c0                	xorl	%eax, %eax
ffff80000010fe1b: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010fe1e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fe22: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010fe2c: 48 29 c8             	subq	%rcx, %rax
ffff80000010fe2f: 48 83 c4 20          	addq	$32, %rsp
ffff80000010fe33: 5d                   	popq	%rbp
ffff80000010fe34: c3                   	retq
ffff80000010fe35: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fe3f: 90                   	nop

ffff80000010fe40 <pa2page>:
; {
ffff80000010fe40: 55                   	pushq	%rbp
ffff80000010fe41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fe44: 48 83 ec 10          	subq	$16, %rsp
ffff80000010fe48: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010fe4c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000010fe50: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010fe54: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000010fe5e: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010fe61: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010fe64: 0f 82 27 00 00 00    	jb	0xffff80000010fe91 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000010fe6a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff80000010fe74: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000010fe7e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000010fe88: 31 c0                	xorl	%eax, %eax
ffff80000010fe8a: be 49 00 00 00       	movl	$73, %esi
ffff80000010fe8f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff80000010fe91: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000010fe9b: 48 8b 00             	movq	(%rax), %rax
ffff80000010fe9e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff80000010fea2: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010fea6: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000010feaa: 48 01 c8             	addq	%rcx, %rax
ffff80000010fead: 48 83 c4 10          	addq	$16, %rsp
ffff80000010feb1: 5d                   	popq	%rbp
ffff80000010feb2: c3                   	retq
ffff80000010feb3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010febd: 0f 1f 00             	nopl	(%rax)

ffff80000010fec0 <check_buddy_consistency>:
; {
ffff80000010fec0: 55                   	pushq	%rbp
ffff80000010fec1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fec4: 48 83 ec 40          	subq	$64, %rsp
ffff80000010fec8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000010fecc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000010fed0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	page = pa2page(addr);
ffff80000010fed4: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000010fed8: 48 b8 40 fe 10 00 00 80 ff ff	movabsq	$-140737487241664, %rax # imm = 0xFFFF80000010FE40
ffff80000010fee2: ff d0                	callq	*%rax
ffff80000010fee4: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (parent && parent != page) {
ffff80000010fee8: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff80000010feed: 0f 84 da 00 00 00    	je	0xffff80000010ffcd <check_buddy_consistency+0x10d>
ffff80000010fef3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010fef7: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff80000010fefb: 0f 84 cc 00 00 00    	je	0xffff80000010ffcd <check_buddy_consistency+0x10d>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010ff01: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010ff05: 8a 40 12             	movb	18(%rax), %al
ffff80000010ff08: c0 e8 07             	shrb	$7, %al
ffff80000010ff0b: 0f b6 c0             	movzbl	%al, %eax
ffff80000010ff0e: 83 f8 00             	cmpl	$0, %eax
ffff80000010ff11: 0f 85 3a 00 00 00    	jne	0xffff80000010ff51 <check_buddy_consistency+0x91>
ffff80000010ff17: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010ff1b: 48 b8 60 01 11 00 00 80 ff ff	movabsq	$-140737487240864, %rax # imm = 0xFFFF800000110160
ffff80000010ff25: ff d0                	callq	*%rax
ffff80000010ff27: 83 f8 00             	cmpl	$0, %eax
ffff80000010ff2a: 0f 84 21 00 00 00    	je	0xffff80000010ff51 <check_buddy_consistency+0x91>
; 			page->pp_order < parent->pp_order) {
ffff80000010ff30: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010ff34: 8a 40 12             	movb	18(%rax), %al
ffff80000010ff37: 24 7f                	andb	$127, %al
ffff80000010ff39: 0f b6 c0             	movzbl	%al, %eax
ffff80000010ff3c: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000010ff40: 8a 49 12             	movb	18(%rcx), %cl
ffff80000010ff43: 80 e1 7f             	andb	$127, %cl
ffff80000010ff46: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010ff49: 39 c8                	cmpl	%ecx, %eax
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010ff4b: 0f 8d 77 00 00 00    	jge	0xffff80000010ffc8 <check_buddy_consistency+0x108>
; 			panic("page %p of order %u is free, while parent page "
ffff80000010ff51: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010ff55: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010ff5f: ff d0                	callq	*%rax
ffff80000010ff61: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010ff65: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010ff69: 8a 40 12             	movb	18(%rax), %al
ffff80000010ff6c: 24 7f                	andb	$127, %al
ffff80000010ff6e: 0f b6 c0             	movzbl	%al, %eax
ffff80000010ff71: 89 45 dc             	movl	%eax, -36(%rbp)
ffff80000010ff74: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000010ff78: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000010ff82: ff d0                	callq	*%rax
ffff80000010ff84: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000010ff88: 44 8b 45 dc          	movl	-36(%rbp), %r8d
ffff80000010ff8c: 49 89 c1             	movq	%rax, %r9
ffff80000010ff8f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ff93: 8a 40 12             	movb	18(%rax), %al
ffff80000010ff96: 24 7f                	andb	$127, %al
ffff80000010ff98: 0f b6 d0             	movzbl	%al, %edx
ffff80000010ff9b: 48 89 e0             	movq	%rsp, %rax
ffff80000010ff9e: 89 10                	movl	%edx, (%rax)
ffff80000010ffa0: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000010ffaa: 48 ba 2f 8f 11 00 00 80 ff ff	movabsq	$-140737487204561, %rdx # imm = 0xFFFF800000118F2F
ffff80000010ffb4: 49 ba 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r10 # imm = 0xFFFF80000010CC40
ffff80000010ffbe: 31 c0                	xorl	%eax, %eax
ffff80000010ffc0: be 6d 00 00 00       	movl	$109, %esi
ffff80000010ffc5: 41 ff d2             	callq	*%r10
; 	}
ffff80000010ffc8: e9 00 00 00 00       	jmp	0xffff80000010ffcd <check_buddy_consistency+0x10d>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010ffcd: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000010ffd1: 8a 40 12             	movb	18(%rax), %al
ffff80000010ffd4: c0 e8 07             	shrb	$7, %al
ffff80000010ffd7: 0f b6 c0             	movzbl	%al, %eax
ffff80000010ffda: 83 f8 00             	cmpl	$0, %eax
ffff80000010ffdd: 0f 84 61 00 00 00    	je	0xffff800000110044 <check_buddy_consistency+0x184>
ffff80000010ffe3: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000010ffe7: 48 b8 60 01 11 00 00 80 ff ff	movabsq	$-140737487240864, %rax # imm = 0xFFFF800000110160
ffff80000010fff1: ff d0                	callq	*%rax
ffff80000010fff3: 83 f8 00             	cmpl	$0, %eax
ffff80000010fff6: 0f 84 48 00 00 00    	je	0xffff800000110044 <check_buddy_consistency+0x184>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000010fffc: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110000: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000011000a: ff d0                	callq	*%rax
ffff80000011000c: 48 89 c1             	movq	%rax, %rcx
ffff80000011000f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110013: 8a 40 12             	movb	18(%rax), %al
ffff800000110016: 24 7f                	andb	$127, %al
ffff800000110018: 44 0f b6 c0          	movzbl	%al, %r8d
ffff80000011001c: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110026: 48 ba 8b 90 11 00 00 80 ff ff	movabsq	$-140737487204213, %rdx # imm = 0xFFFF80000011908B
ffff800000110030: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff80000011003a: 31 c0                	xorl	%eax, %eax
ffff80000011003c: be 73 00 00 00       	movl	$115, %esi
ffff800000110041: 41 ff d1             	callq	*%r9
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff800000110044: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110048: 8a 40 12             	movb	18(%rax), %al
ffff80000011004b: c0 e8 07             	shrb	$7, %al
ffff80000011004e: 3c 00                	cmpb	$0, %al
ffff800000110050: 0f 85 61 00 00 00    	jne	0xffff8000001100b7 <check_buddy_consistency+0x1f7>
ffff800000110056: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff80000011005a: 48 b8 60 01 11 00 00 80 ff ff	movabsq	$-140737487240864, %rax # imm = 0xFFFF800000110160
ffff800000110064: ff d0                	callq	*%rax
ffff800000110066: 83 f8 00             	cmpl	$0, %eax
ffff800000110069: 0f 85 48 00 00 00    	jne	0xffff8000001100b7 <check_buddy_consistency+0x1f7>
; 		panic("page %p of order %u is in use, but on the free list",
ffff80000011006f: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000110073: 48 b8 10 fa 10 00 00 80 ff ff	movabsq	$-140737487242736, %rax # imm = 0xFFFF80000010FA10
ffff80000011007d: ff d0                	callq	*%rax
ffff80000011007f: 48 89 c1             	movq	%rax, %rcx
ffff800000110082: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000110086: 8a 40 12             	movb	18(%rax), %al
ffff800000110089: 24 7f                	andb	$127, %al
ffff80000011008b: 44 0f b6 c0          	movzbl	%al, %r8d
ffff80000011008f: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110099: 48 ba 7c 8b 11 00 00 80 ff ff	movabsq	$-140737487205508, %rdx # imm = 0xFFFF800000118B7C
ffff8000001100a3: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001100ad: 31 c0                	xorl	%eax, %eax
ffff8000001100af: be 78 00 00 00       	movl	$120, %esi
ffff8000001100b4: 41 ff d1             	callq	*%r9
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff8000001100b7: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001100bb: 8a 40 12             	movb	18(%rax), %al
ffff8000001100be: c0 e8 07             	shrb	$7, %al
ffff8000001100c1: 0f b6 c0             	movzbl	%al, %eax
ffff8000001100c4: 83 f8 00             	cmpl	$0, %eax
ffff8000001100c7: 0f 84 21 00 00 00    	je	0xffff8000001100ee <check_buddy_consistency+0x22e>
ffff8000001100cd: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff8000001100d1: 48 b8 60 01 11 00 00 80 ff ff	movabsq	$-140737487240864, %rax # imm = 0xFFFF800000110160
ffff8000001100db: ff d0                	callq	*%rax
ffff8000001100dd: 83 f8 00             	cmpl	$0, %eax
ffff8000001100e0: 0f 84 08 00 00 00    	je	0xffff8000001100ee <check_buddy_consistency+0x22e>
; 		parent = page;
ffff8000001100e6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001100ea: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	if (order == 0) {
ffff8000001100ee: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff8000001100f3: 0f 85 05 00 00 00    	jne	0xffff8000001100fe <check_buddy_consistency+0x23e>
; 		return;
ffff8000001100f9: e9 52 00 00 00       	jmp	0xffff800000110150 <check_buddy_consistency+0x290>
; 	--order;
ffff8000001100fe: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110102: 48 83 c0 ff          	addq	$-1, %rax
ffff800000110106: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	check_buddy_consistency(addr, order, parent);
ffff80000011010a: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011010e: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110112: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000110116: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff800000110120: ff d0                	callq	*%rax
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff800000110122: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110126: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011012a: 48 83 c0 0c          	addq	$12, %rax
ffff80000011012e: 89 c1                	movl	%eax, %ecx
ffff800000110130: b8 01 00 00 00       	movl	$1, %eax
ffff800000110135: d3 e0                	shll	%cl, %eax
ffff800000110137: 48 98                	cltq
ffff800000110139: 48 09 c7             	orq	%rax, %rdi
ffff80000011013c: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110140: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000110144: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff80000011014e: ff d0                	callq	*%rax
; }
ffff800000110150: 48 83 c4 40          	addq	$64, %rsp
ffff800000110154: 5d                   	popq	%rbp
ffff800000110155: c3                   	retq
ffff800000110156: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110160 <list_is_empty>:
; {
ffff800000110160: 55                   	pushq	%rbp
ffff800000110161: 48 89 e5             	movq	%rsp, %rbp
ffff800000110164: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return head->next == head;
ffff800000110168: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011016c: 48 8b 00             	movq	(%rax), %rax
ffff80000011016f: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000110173: 0f 94 c0             	sete	%al
ffff800000110176: 24 01                	andb	$1, %al
ffff800000110178: 0f b6 c0             	movzbl	%al, %eax
ffff80000011017b: 5d                   	popq	%rbp
ffff80000011017c: c3                   	retq
ffff80000011017d: 0f 1f 00             	nopl	(%rax)

ffff800000110180 <lab1_check_buddy_consistency>:
; {
ffff800000110180: 55                   	pushq	%rbp
ffff800000110181: 48 89 e5             	movq	%rsp, %rbp
ffff800000110184: 48 83 ec 10          	subq	$16, %rsp
; 	for (addr = 0;
ffff800000110188: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < BOOT_MAP_LIM;
ffff800000110190: 48 81 7d f0 00 00 80 00      	cmpq	$8388608, -16(%rbp) # imm = 0x800000
; 	for (addr = 0;
ffff800000110198: 0f 83 2e 00 00 00    	jae	0xffff8000001101cc <lab1_check_buddy_consistency+0x4c>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000011019e: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001101a2: 31 c0                	xorl	%eax, %eax
ffff8000001101a4: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff8000001101ae: 31 c9                	xorl	%ecx, %ecx
ffff8000001101b0: 89 ca                	movl	%ecx, %edx
ffff8000001101b2: be 09 00 00 00       	movl	$9, %esi
ffff8000001101b7: ff d0                	callq	*%rax
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff8000001101b9: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001101bd: 48 05 00 00 20 00    	addq	$2097152, %rax          # imm = 0x200000
ffff8000001101c3: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff8000001101c7: e9 c4 ff ff ff       	jmp	0xffff800000110190 <lab1_check_buddy_consistency+0x10>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff8000001101cc: 48 bf ce 94 11 00 00 80 ff ff	movabsq	$-140737487203122, %rdi # imm = 0xFFFF8000001194CE
ffff8000001101d6: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001101e0: 31 c0                	xorl	%eax, %eax
ffff8000001101e2: ff d1                	callq	*%rcx
; }
ffff8000001101e4: 48 83 c4 10          	addq	$16, %rsp
ffff8000001101e8: 5d                   	popq	%rbp
ffff8000001101e9: c3                   	retq
ffff8000001101ea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001101f0 <lab1_check_split_and_merge>:
; {
ffff8000001101f0: 55                   	pushq	%rbp
ffff8000001101f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001101f4: 48 81 ec d0 00 00 00 	subq	$208, %rsp
ffff8000001101fb: 89 7d fc             	movl	%edi, -4(%rbp)
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff8000001101fe: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110208: bf 09 00 00 00       	movl	$9, %edi
ffff80000011020d: ff d0                	callq	*%rax
ffff80000011020f: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff800000110216: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff800000110220: bf 09 00 00 00       	movl	$9, %edi
ffff800000110225: ff d0                	callq	*%rax
ffff800000110227: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff80000011022e: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff800000110236: 0f 85 27 00 00 00    	jne	0xffff800000110263 <lab1_check_split_and_merge+0x73>
; 		panic("can't allocate 2M page!");
ffff80000011023c: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110246: 48 ba 04 8c 11 00 00 80 ff ff	movabsq	$-140737487205372, %rdx # imm = 0xFFFF800000118C04
ffff800000110250: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011025a: 31 c0                	xorl	%eax, %eax
ffff80000011025c: be a9 00 00 00       	movl	$169, %esi
ffff800000110261: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff800000110263: e9 00 00 00 00       	jmp	0xffff800000110268 <lab1_check_split_and_merge+0x78>
ffff800000110268: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110272: bf 09 00 00 00       	movl	$9, %edi
ffff800000110277: ff d0                	callq	*%rax
ffff800000110279: 48 83 c0 01          	addq	$1, %rax
ffff80000011027d: 48 3b 85 38 ff ff ff 	cmpq	-200(%rbp), %rax
ffff800000110284: 0f 84 32 00 00 00    	je	0xffff8000001102bc <lab1_check_split_and_merge+0xcc>
ffff80000011028a: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110294: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011029e: 48 b9 b0 8d 11 00 00 80 ff ff	movabsq	$-140737487204944, %rcx # imm = 0xFFFF800000118DB0
ffff8000001102a8: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001102b2: 31 c0                	xorl	%eax, %eax
ffff8000001102b4: be ad 00 00 00       	movl	$173, %esi
ffff8000001102b9: 41 ff d0             	callq	*%r8
ffff8000001102bc: e9 00 00 00 00       	jmp	0xffff8000001102c1 <lab1_check_split_and_merge+0xd1>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001102c1: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff8000001102cc: 48 83 bd 40 ff ff ff 0a      	cmpq	$10, -192(%rbp)
ffff8000001102d4: 0f 83 5f 00 00 00    	jae	0xffff800000110339 <lab1_check_split_and_merge+0x149>
; 		stolen_free_list[order] = buddy_free_list[order];
ffff8000001102da: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
ffff8000001102e1: 48 c1 e1 04          	shlq	$4, %rcx
ffff8000001102e5: 48 b8 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rax # imm = 0xFFFF80000011D240
ffff8000001102ef: 48 8b 14 01          	movq	(%rcx,%rax), %rdx
ffff8000001102f3: 48 8b 74 01 08       	movq	8(%rcx,%rax), %rsi
ffff8000001102f8: 48 89 b4 0d 58 ff ff ff      	movq	%rsi, -168(%rbp,%rcx)
ffff800000110300: 48 89 94 0d 50 ff ff ff      	movq	%rdx, -176(%rbp,%rcx)
; 		list_init(buddy_free_list + order);
ffff800000110308: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff80000011030f: 48 c1 e7 04          	shlq	$4, %rdi
ffff800000110313: 48 01 c7             	addq	%rax, %rdi
ffff800000110316: 48 b8 e0 07 11 00 00 80 ff ff	movabsq	$-140737487239200, %rax # imm = 0xFFFF8000001107E0
ffff800000110320: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000110322: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff800000110329: 48 83 c0 01          	addq	$1, %rax
ffff80000011032d: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110334: e9 93 ff ff ff       	jmp	0xffff8000001102cc <lab1_check_split_and_merge+0xdc>
; 	page_free(page);
ffff800000110339: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff800000110340: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000011034a: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000011034c: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff800000110357: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff80000011035f: 0f 83 75 00 00 00    	jae	0xffff8000001103da <lab1_check_split_and_merge+0x1ea>
; 		assert(count_free_pages(order) == 0);
ffff800000110365: e9 00 00 00 00       	jmp	0xffff80000011036a <lab1_check_split_and_merge+0x17a>
ffff80000011036a: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff800000110371: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000011037b: ff d0                	callq	*%rax
ffff80000011037d: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110381: 0f 84 32 00 00 00    	je	0xffff8000001103b9 <lab1_check_split_and_merge+0x1c9>
ffff800000110387: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110391: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011039b: 48 b9 99 92 11 00 00 80 ff ff	movabsq	$-140737487203687, %rcx # imm = 0xFFFF800000119299
ffff8000001103a5: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001103af: 31 c0                	xorl	%eax, %eax
ffff8000001103b1: be ba 00 00 00       	movl	$186, %esi
ffff8000001103b6: 41 ff d0             	callq	*%r8
ffff8000001103b9: e9 00 00 00 00       	jmp	0xffff8000001103be <lab1_check_split_and_merge+0x1ce>
; 	}
ffff8000001103be: e9 00 00 00 00       	jmp	0xffff8000001103c3 <lab1_check_split_and_merge+0x1d3>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff8000001103c3: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001103ca: 48 83 c0 01          	addq	$1, %rax
ffff8000001103ce: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff8000001103d5: e9 7d ff ff ff       	jmp	0xffff800000110357 <lab1_check_split_and_merge+0x167>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff8000001103da: e9 00 00 00 00       	jmp	0xffff8000001103df <lab1_check_split_and_merge+0x1ef>
ffff8000001103df: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff8000001103e9: bf 09 00 00 00       	movl	$9, %edi
ffff8000001103ee: ff d0                	callq	*%rax
ffff8000001103f0: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001103f4: 0f 84 32 00 00 00    	je	0xffff80000011042c <lab1_check_split_and_merge+0x23c>
ffff8000001103fa: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110404: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011040e: 48 b9 59 86 11 00 00 80 ff ff	movabsq	$-140737487206823, %rcx # imm = 0xFFFF800000118659
ffff800000110418: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000110422: 31 c0                	xorl	%eax, %eax
ffff800000110424: be bd 00 00 00       	movl	$189, %esi
ffff800000110429: 41 ff d0             	callq	*%r8
ffff80000011042c: e9 00 00 00 00       	jmp	0xffff800000110431 <lab1_check_split_and_merge+0x241>
; 	page = page_alloc(0);
ffff800000110431: 31 c0                	xorl	%eax, %eax
ffff800000110433: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000011043d: 31 ff                	xorl	%edi, %edi
ffff80000011043f: ff d0                	callq	*%rax
ffff800000110441: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff800000110448: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff800000110450: 0f 85 27 00 00 00    	jne	0xffff80000011047d <lab1_check_split_and_merge+0x28d>
; 		panic("can't allocate 4K page!");
ffff800000110456: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110460: 48 ba 65 8a 11 00 00 80 ff ff	movabsq	$-140737487205787, %rdx # imm = 0xFFFF800000118A65
ffff80000011046a: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000110474: 31 c0                	xorl	%eax, %eax
ffff800000110476: be c3 00 00 00       	movl	$195, %esi
ffff80000011047b: ff d1                	callq	*%rcx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000011047d: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff800000110488: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff800000110490: 0f 83 75 00 00 00    	jae	0xffff80000011050b <lab1_check_split_and_merge+0x31b>
; 		assert(count_free_pages(order) == 1);
ffff800000110496: e9 00 00 00 00       	jmp	0xffff80000011049b <lab1_check_split_and_merge+0x2ab>
ffff80000011049b: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff8000001104a2: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff8000001104ac: ff d0                	callq	*%rax
ffff8000001104ae: 48 83 f8 01          	cmpq	$1, %rax
ffff8000001104b2: 0f 84 32 00 00 00    	je	0xffff8000001104ea <lab1_check_split_and_merge+0x2fa>
ffff8000001104b8: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001104c2: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001104cc: 48 b9 f9 93 11 00 00 80 ff ff	movabsq	$-140737487203335, %rcx # imm = 0xFFFF8000001193F9
ffff8000001104d6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001104e0: 31 c0                	xorl	%eax, %eax
ffff8000001104e2: be c8 00 00 00       	movl	$200, %esi
ffff8000001104e7: 41 ff d0             	callq	*%r8
ffff8000001104ea: e9 00 00 00 00       	jmp	0xffff8000001104ef <lab1_check_split_and_merge+0x2ff>
; 	}
ffff8000001104ef: e9 00 00 00 00       	jmp	0xffff8000001104f4 <lab1_check_split_and_merge+0x304>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff8000001104f4: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001104fb: 48 83 c0 01          	addq	$1, %rax
ffff8000001104ff: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110506: e9 7d ff ff ff       	jmp	0xffff800000110488 <lab1_check_split_and_merge+0x298>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000011050b: e9 00 00 00 00       	jmp	0xffff800000110510 <lab1_check_split_and_merge+0x320>
ffff800000110510: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff80000011051a: bf 09 00 00 00       	movl	$9, %edi
ffff80000011051f: ff d0                	callq	*%rax
ffff800000110521: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110525: 0f 84 32 00 00 00    	je	0xffff80000011055d <lab1_check_split_and_merge+0x36d>
ffff80000011052b: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff800000110535: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011053f: 48 b9 f6 8a 11 00 00 80 ff ff	movabsq	$-140737487205642, %rcx # imm = 0xFFFF800000118AF6
ffff800000110549: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000110553: 31 c0                	xorl	%eax, %eax
ffff800000110555: be cb 00 00 00       	movl	$203, %esi
ffff80000011055a: 41 ff d0             	callq	*%r8
ffff80000011055d: e9 00 00 00 00       	jmp	0xffff800000110562 <lab1_check_split_and_merge+0x372>
; 	page_free(page);
ffff800000110562: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff800000110569: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff800000110573: ff d0                	callq	*%rax
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff800000110575: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff800000110580: 48 83 bd 40 ff ff ff 09      	cmpq	$9, -192(%rbp)
ffff800000110588: 0f 83 75 00 00 00    	jae	0xffff800000110603 <lab1_check_split_and_merge+0x413>
; 		assert(count_free_pages(order) == 0);
ffff80000011058e: e9 00 00 00 00       	jmp	0xffff800000110593 <lab1_check_split_and_merge+0x3a3>
ffff800000110593: 48 8b bd 40 ff ff ff 	movq	-192(%rbp), %rdi
ffff80000011059a: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff8000001105a4: ff d0                	callq	*%rax
ffff8000001105a6: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001105aa: 0f 84 32 00 00 00    	je	0xffff8000001105e2 <lab1_check_split_and_merge+0x3f2>
ffff8000001105b0: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001105ba: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001105c4: 48 b9 99 92 11 00 00 80 ff ff	movabsq	$-140737487203687, %rcx # imm = 0xFFFF800000119299
ffff8000001105ce: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001105d8: 31 c0                	xorl	%eax, %eax
ffff8000001105da: be d2 00 00 00       	movl	$210, %esi
ffff8000001105df: 41 ff d0             	callq	*%r8
ffff8000001105e2: e9 00 00 00 00       	jmp	0xffff8000001105e7 <lab1_check_split_and_merge+0x3f7>
; 	}
ffff8000001105e7: e9 00 00 00 00       	jmp	0xffff8000001105ec <lab1_check_split_and_merge+0x3fc>
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff8000001105ec: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001105f3: 48 83 c0 01          	addq	$1, %rax
ffff8000001105f7: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff8000001105fe: e9 7d ff ff ff       	jmp	0xffff800000110580 <lab1_check_split_and_merge+0x390>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff800000110603: e9 00 00 00 00       	jmp	0xffff800000110608 <lab1_check_split_and_merge+0x418>
ffff800000110608: 48 b8 d0 e1 10 00 00 80 ff ff	movabsq	$-140737487248944, %rax # imm = 0xFFFF80000010E1D0
ffff800000110612: bf 09 00 00 00       	movl	$9, %edi
ffff800000110617: ff d0                	callq	*%rax
ffff800000110619: 48 83 f8 01          	cmpq	$1, %rax
ffff80000011061d: 0f 84 32 00 00 00    	je	0xffff800000110655 <lab1_check_split_and_merge+0x465>
ffff800000110623: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff80000011062d: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000110637: 48 b9 59 86 11 00 00 80 ff ff	movabsq	$-140737487206823, %rcx # imm = 0xFFFF800000118659
ffff800000110641: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011064b: 31 c0                	xorl	%eax, %eax
ffff80000011064d: be d5 00 00 00       	movl	$213, %esi
ffff800000110652: 41 ff d0             	callq	*%r8
ffff800000110655: e9 00 00 00 00       	jmp	0xffff80000011065a <lab1_check_split_and_merge+0x46a>
; 	if (flags & ALLOC_HUGE)
ffff80000011065a: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011065d: 83 e0 02             	andl	$2, %eax
ffff800000110660: 83 f8 00             	cmpl	$0, %eax
ffff800000110663: 0f 84 1d 00 00 00    	je	0xffff800000110686 <lab1_check_split_and_merge+0x496>
; 		page = page_alloc(ALLOC_HUGE);
ffff800000110669: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000110673: bf 02 00 00 00       	movl	$2, %edi
ffff800000110678: ff d0                	callq	*%rax
ffff80000011067a: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
ffff800000110681: e9 18 00 00 00       	jmp	0xffff80000011069e <lab1_check_split_and_merge+0x4ae>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff800000110686: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff800000110690: bf 09 00 00 00       	movl	$9, %edi
ffff800000110695: ff d0                	callq	*%rax
ffff800000110697: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
; 	if (!page) {
ffff80000011069e: 48 83 bd 48 ff ff ff 00      	cmpq	$0, -184(%rbp)
ffff8000001106a6: 0f 85 27 00 00 00    	jne	0xffff8000001106d3 <lab1_check_split_and_merge+0x4e3>
; 		panic("can't allocate 2M page!");
ffff8000001106ac: 48 bf 12 85 11 00 00 80 ff ff	movabsq	$-140737487207150, %rdi # imm = 0xFFFF800000118512
ffff8000001106b6: 48 ba 04 8c 11 00 00 80 ff ff	movabsq	$-140737487205372, %rdx # imm = 0xFFFF800000118C04
ffff8000001106c0: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001106ca: 31 c0                	xorl	%eax, %eax
ffff8000001106cc: be de 00 00 00       	movl	$222, %esi
ffff8000001106d1: ff d1                	callq	*%rcx
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001106d3: 48 c7 85 40 ff ff ff 00 00 00 00     	movq	$0, -192(%rbp)
ffff8000001106de: 48 83 bd 40 ff ff ff 0a      	cmpq	$10, -192(%rbp)
ffff8000001106e6: 0f 83 52 00 00 00    	jae	0xffff80000011073e <lab1_check_split_and_merge+0x54e>
; 		buddy_free_list[order] = stolen_free_list[order];
ffff8000001106ec: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff8000001106f3: 48 c1 e0 04          	shlq	$4, %rax
ffff8000001106f7: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff800000110701: 48 01 c8             	addq	%rcx, %rax
ffff800000110704: 48 8b 95 40 ff ff ff 	movq	-192(%rbp), %rdx
ffff80000011070b: 48 8d 8d 50 ff ff ff 	leaq	-176(%rbp), %rcx
ffff800000110712: 48 c1 e2 04          	shlq	$4, %rdx
ffff800000110716: 48 01 d1             	addq	%rdx, %rcx
ffff800000110719: 48 8b 11             	movq	(%rcx), %rdx
ffff80000011071c: 48 89 10             	movq	%rdx, (%rax)
ffff80000011071f: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff800000110723: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000110727: 48 8b 85 40 ff ff ff 	movq	-192(%rbp), %rax
ffff80000011072e: 48 83 c0 01          	addq	$1, %rax
ffff800000110732: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110739: e9 a0 ff ff ff       	jmp	0xffff8000001106de <lab1_check_split_and_merge+0x4ee>
; 	page_free(page);
ffff80000011073e: 48 8b bd 48 ff ff ff 	movq	-184(%rbp), %rdi
ffff800000110745: 48 b8 c0 e9 10 00 00 80 ff ff	movabsq	$-140737487246912, %rax # imm = 0xFFFF80000010E9C0
ffff80000011074f: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff800000110751: 48 bf 3e 92 11 00 00 80 ff ff	movabsq	$-140737487203778, %rdi # imm = 0xFFFF80000011923E
ffff80000011075b: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000110765: 31 c0                	xorl	%eax, %eax
ffff800000110767: ff d1                	callq	*%rcx
; }
ffff800000110769: 48 81 c4 d0 00 00 00 	addq	$208, %rsp
ffff800000110770: 5d                   	popq	%rbp
ffff800000110771: c3                   	retq
ffff800000110772: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011077c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110780 <lab1_check_mem>:
; {
ffff800000110780: 55                   	pushq	%rbp
ffff800000110781: 48 89 e5             	movq	%rsp, %rbp
ffff800000110784: 48 83 ec 10          	subq	$16, %rsp
ffff800000110788: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	lab1_check_free_list_avail();
ffff80000011078c: 48 b8 80 f8 10 00 00 80 ff ff	movabsq	$-140737487243136, %rax # imm = 0xFFFF80000010F880
ffff800000110796: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff800000110798: 48 b8 40 fa 10 00 00 80 ff ff	movabsq	$-140737487242688, %rax # imm = 0xFFFF80000010FA40
ffff8000001107a2: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff8000001107a4: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001107a8: 48 b8 50 fb 10 00 00 80 ff ff	movabsq	$-140737487242416, %rax # imm = 0xFFFF80000010FB50
ffff8000001107b2: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff8000001107b4: 48 b8 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rax # imm = 0xFFFF800000110180
ffff8000001107be: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff8000001107c0: 31 c0                	xorl	%eax, %eax
ffff8000001107c2: 48 b8 f0 01 11 00 00 80 ff ff	movabsq	$-140737487240720, %rax # imm = 0xFFFF8000001101F0
ffff8000001107cc: 31 ff                	xorl	%edi, %edi
ffff8000001107ce: ff d0                	callq	*%rax
; }
ffff8000001107d0: 48 83 c4 10          	addq	$16, %rsp
ffff8000001107d4: 5d                   	popq	%rbp
ffff8000001107d5: c3                   	retq
ffff8000001107d6: cc                   	int3
ffff8000001107d7: cc                   	int3
ffff8000001107d8: cc                   	int3
ffff8000001107d9: cc                   	int3
ffff8000001107da: cc                   	int3
ffff8000001107db: cc                   	int3
ffff8000001107dc: cc                   	int3
ffff8000001107dd: cc                   	int3
ffff8000001107de: cc                   	int3
ffff8000001107df: cc                   	int3

ffff8000001107e0 <list_init>:
; {
ffff8000001107e0: 55                   	pushq	%rbp
ffff8000001107e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001107e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	head->next = head;
ffff8000001107e8: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001107ec: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001107f0: 48 89 08             	movq	%rcx, (%rax)
; 	head->prev = head;
ffff8000001107f3: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001107f7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001107fb: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff8000001107ff: 5d                   	popq	%rbp
ffff800000110800: c3                   	retq
ffff800000110801: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011080b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110810 <list_insert_after>:
; {
ffff800000110810: 55                   	pushq	%rbp
ffff800000110811: 48 89 e5             	movq	%rsp, %rbp
ffff800000110814: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110818: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	new->prev = after;
ffff80000011081c: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110820: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110824: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	new->next = after->next;
ffff800000110828: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011082c: 48 8b 08             	movq	(%rax), %rcx
ffff80000011082f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110833: 48 89 08             	movq	%rcx, (%rax)
; 	after->next->prev = new;
ffff800000110836: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011083a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011083e: 48 8b 00             	movq	(%rax), %rax
ffff800000110841: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	after->next = new;
ffff800000110845: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000110849: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011084d: 48 89 08             	movq	%rcx, (%rax)
; }
ffff800000110850: 5d                   	popq	%rbp
ffff800000110851: c3                   	retq
ffff800000110852: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011085c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110860 <list_insert_before>:
; {
ffff800000110860: 55                   	pushq	%rbp
ffff800000110861: 48 89 e5             	movq	%rsp, %rbp
ffff800000110864: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110868: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	new->next = before;
ffff80000011086c: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000110870: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110874: 48 89 08             	movq	%rcx, (%rax)
; 	new->prev = before->prev;
ffff800000110877: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011087b: 48 8b 48 08          	movq	8(%rax), %rcx
ffff80000011087f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110883: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	before->prev->next = new;
ffff800000110887: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011088b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011088f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110893: 48 89 08             	movq	%rcx, (%rax)
; 	before->prev = new;
ffff800000110896: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011089a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011089e: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff8000001108a2: 5d                   	popq	%rbp
ffff8000001108a3: c3                   	retq
ffff8000001108a4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001108ae: 66 90                	nop

ffff8000001108b0 <list_del>:
; {
ffff8000001108b0: 55                   	pushq	%rbp
ffff8000001108b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001108b4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	node->prev->next = node->next;
ffff8000001108b8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108bc: 48 8b 08             	movq	(%rax), %rcx
ffff8000001108bf: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108c3: 48 8b 40 08          	movq	8(%rax), %rax
ffff8000001108c7: 48 89 08             	movq	%rcx, (%rax)
; 	node->next->prev = node->prev;
ffff8000001108ca: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108ce: 48 8b 48 08          	movq	8(%rax), %rcx
ffff8000001108d2: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108d6: 48 8b 00             	movq	(%rax), %rax
ffff8000001108d9: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff8000001108dd: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001108e1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108e5: 48 89 08             	movq	%rcx, (%rax)
; 	node->prev = node;
ffff8000001108e8: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001108ec: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001108f0: 48 89 48 08          	movq	%rcx, 8(%rax)
; }
ffff8000001108f4: 5d                   	popq	%rbp
ffff8000001108f5: c3                   	retq
ffff8000001108f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110900 <list_add>:
; {
ffff800000110900: 55                   	pushq	%rbp
ffff800000110901: 48 89 e5             	movq	%rsp, %rbp
ffff800000110904: 48 83 ec 10          	subq	$16, %rsp
ffff800000110908: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011090c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	list_insert_after(head, new);
ffff800000110910: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110914: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110918: 48 b8 10 08 11 00 00 80 ff ff	movabsq	$-140737487239152, %rax # imm = 0xFFFF800000110810
ffff800000110922: ff d0                	callq	*%rax
; }
ffff800000110924: 48 83 c4 10          	addq	$16, %rsp
ffff800000110928: 5d                   	popq	%rbp
ffff800000110929: c3                   	retq
ffff80000011092a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110930 <list_add_tail>:
; {
ffff800000110930: 55                   	pushq	%rbp
ffff800000110931: 48 89 e5             	movq	%rsp, %rbp
ffff800000110934: 48 83 ec 10          	subq	$16, %rsp
ffff800000110938: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011093c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	list_insert_before(head, new);
ffff800000110940: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110944: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110948: 48 b8 60 08 11 00 00 80 ff ff	movabsq	$-140737487239072, %rax # imm = 0xFFFF800000110860
ffff800000110952: ff d0                	callq	*%rax
; }
ffff800000110954: 48 83 c4 10          	addq	$16, %rsp
ffff800000110958: 5d                   	popq	%rbp
ffff800000110959: c3                   	retq
ffff80000011095a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110960 <list_pop_tail>:
; {
ffff800000110960: 55                   	pushq	%rbp
ffff800000110961: 48 89 e5             	movq	%rsp, %rbp
ffff800000110964: 48 83 ec 20          	subq	$32, %rsp
ffff800000110968: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (head->prev == head)
ffff80000011096c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000110970: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110974: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff800000110978: 0f 85 0d 00 00 00    	jne	0xffff80000011098b <list_pop_tail+0x2b>
; 		return NULL;
ffff80000011097e: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000110986: e9 24 00 00 00       	jmp	0xffff8000001109af <list_pop_tail+0x4f>
; 	node = head->prev;
ffff80000011098b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011098f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000110993: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	list_del(node);
ffff800000110997: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff80000011099b: 48 b8 b0 08 11 00 00 80 ff ff	movabsq	$-140737487238992, %rax # imm = 0xFFFF8000001108B0
ffff8000001109a5: ff d0                	callq	*%rax
; 	return node;
ffff8000001109a7: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001109ab: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff8000001109af: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001109b3: 48 83 c4 20          	addq	$32, %rsp
ffff8000001109b7: 5d                   	popq	%rbp
ffff8000001109b8: c3                   	retq
ffff8000001109b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001109c0 <list_pop>:
; {
ffff8000001109c0: 55                   	pushq	%rbp
ffff8000001109c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001109c4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001109c8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (head->next == head)
ffff8000001109cc: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001109d0: 48 8b 00             	movq	(%rax), %rax
ffff8000001109d3: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff8000001109d7: 0f 85 0d 00 00 00    	jne	0xffff8000001109ea <list_pop+0x2a>
; 		return NULL;
ffff8000001109dd: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff8000001109e5: e9 23 00 00 00       	jmp	0xffff800000110a0d <list_pop+0x4d>
; 	node = head->next;
ffff8000001109ea: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001109ee: 48 8b 00             	movq	(%rax), %rax
ffff8000001109f1: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	list_del(node);
ffff8000001109f5: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001109f9: 48 b8 b0 08 11 00 00 80 ff ff	movabsq	$-140737487238992, %rax # imm = 0xFFFF8000001108B0
ffff800000110a03: ff d0                	callq	*%rax
; 	return node;
ffff800000110a05: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110a09: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000110a0d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a11: 48 83 c4 20          	addq	$32, %rsp
ffff800000110a15: 5d                   	popq	%rbp
ffff800000110a16: c3                   	retq
ffff800000110a17: cc                   	int3
ffff800000110a18: cc                   	int3
ffff800000110a19: cc                   	int3
ffff800000110a1a: cc                   	int3
ffff800000110a1b: cc                   	int3
ffff800000110a1c: cc                   	int3
ffff800000110a1d: cc                   	int3
ffff800000110a1e: cc                   	int3
ffff800000110a1f: cc                   	int3

ffff800000110a20 <vprintfmt>:
; {
ffff800000110a20: 55                   	pushq	%rbp
ffff800000110a21: 48 89 e5             	movq	%rsp, %rbp
ffff800000110a24: 48 81 ec 00 01 00 00 	subq	$256, %rsp              # imm = 0x100
ffff800000110a2b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000110a2f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000110a33: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000110a37: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	va_copy(ap, tmp_ap);
ffff800000110a3b: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110a3f: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000110a43: 48 8b 4a 10          	movq	16(%rdx), %rcx
ffff800000110a47: 48 89 48 10          	movq	%rcx, 16(%rax)
ffff800000110a4b: 48 8b 0a             	movq	(%rdx), %rcx
ffff800000110a4e: 48 8b 52 08          	movq	8(%rdx), %rdx
ffff800000110a52: 48 89 50 08          	movq	%rdx, 8(%rax)
ffff800000110a56: 48 89 08             	movq	%rcx, (%rax)
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff800000110a59: e9 00 00 00 00       	jmp	0xffff800000110a5e <vprintfmt+0x3e>
ffff800000110a5e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110a62: 48 89 c1             	movq	%rax, %rcx
ffff800000110a65: 48 83 c1 01          	addq	$1, %rcx
ffff800000110a69: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff800000110a6d: 0f b6 00             	movzbl	(%rax), %eax
ffff800000110a70: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000110a73: 83 f8 25             	cmpl	$37, %eax
ffff800000110a76: 0f 84 25 00 00 00    	je	0xffff800000110aa1 <vprintfmt+0x81>
; 			if (ch == '\0')
ffff800000110a7c: 83 7d b4 00          	cmpl	$0, -76(%rbp)
ffff800000110a80: 0f 85 09 00 00 00    	jne	0xffff800000110a8f <vprintfmt+0x6f>
; 				return;
ffff800000110a86: 48 81 c4 00 01 00 00 	addq	$256, %rsp              # imm = 0x100
ffff800000110a8d: 5d                   	popq	%rbp
ffff800000110a8e: c3                   	retq
; 			putch(ch, putdat);
ffff800000110a8f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110a93: 8b 7d b4             	movl	-76(%rbp), %edi
ffff800000110a96: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110a9a: ff d0                	callq	*%rax
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff800000110a9c: e9 bd ff ff ff       	jmp	0xffff800000110a5e <vprintfmt+0x3e>
; 		padc = ' ';
ffff800000110aa1: c6 45 93 20          	movb	$32, -109(%rbp)
; 		width = -1;
ffff800000110aa5: c7 45 9c ff ff ff ff 	movl	$4294967295, -100(%rbp) # imm = 0xFFFFFFFF
; 		precision = -1;
ffff800000110aac: c7 45 98 ff ff ff ff 	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 		lflag = 0;
ffff800000110ab3: c7 45 a0 00 00 00 00 	movl	$0, -96(%rbp)
; 		altflag = 0;
ffff800000110aba: c7 45 94 00 00 00 00 	movl	$0, -108(%rbp)
; 		switch (ch = *(unsigned char *) fmt++) {
ffff800000110ac1: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110ac5: 48 89 c1             	movq	%rax, %rcx
ffff800000110ac8: 48 83 c1 01          	addq	$1, %rcx
ffff800000110acc: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff800000110ad0: 0f b6 00             	movzbl	(%rax), %eax
ffff800000110ad3: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000110ad6: 83 c0 dd             	addl	$-35, %eax
ffff800000110ad9: 89 c1                	movl	%eax, %ecx
ffff800000110adb: 48 89 4d 88          	movq	%rcx, -120(%rbp)
ffff800000110adf: 83 e8 55             	subl	$85, %eax
ffff800000110ae2: 0f 87 0a 06 00 00    	ja	0xffff8000001110f2 <vprintfmt+0x6d2>
ffff800000110ae8: 48 8b 4d 88          	movq	-120(%rbp), %rcx
ffff800000110aec: 48 b8 60 80 11 00 00 80 ff ff	movabsq	$-140737487208352, %rax # imm = 0xFFFF800000118060
ffff800000110af6: 48 8b 04 c8          	movq	(%rax,%rcx,8), %rax
ffff800000110afa: ff e0                	jmpq	*%rax
; 			padc = '-';
ffff800000110afc: c6 45 93 2d          	movb	$45, -109(%rbp)
; 			goto reswitch;
ffff800000110b00: e9 bc ff ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			padc = '0';
ffff800000110b05: c6 45 93 30          	movb	$48, -109(%rbp)
; 			goto reswitch;
ffff800000110b09: e9 b3 ff ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			for (precision = 0; ; ++fmt) {
ffff800000110b0e: c7 45 98 00 00 00 00 	movl	$0, -104(%rbp)
; 				precision = precision * 10 + ch - '0';
ffff800000110b15: 6b 45 98 0a          	imull	$10, -104(%rbp), %eax
ffff800000110b19: 03 45 b4             	addl	-76(%rbp), %eax
ffff800000110b1c: 83 e8 30             	subl	$48, %eax
ffff800000110b1f: 89 45 98             	movl	%eax, -104(%rbp)
; 				ch = *fmt;
ffff800000110b22: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110b26: 0f be 00             	movsbl	(%rax), %eax
ffff800000110b29: 89 45 b4             	movl	%eax, -76(%rbp)
; 				if (ch < '0' || ch > '9')
ffff800000110b2c: 83 7d b4 30          	cmpl	$48, -76(%rbp)
ffff800000110b30: 0f 8c 0a 00 00 00    	jl	0xffff800000110b40 <vprintfmt+0x120>
ffff800000110b36: 83 7d b4 39          	cmpl	$57, -76(%rbp)
ffff800000110b3a: 0f 8e 05 00 00 00    	jle	0xffff800000110b45 <vprintfmt+0x125>
; 					break;
ffff800000110b40: e9 16 00 00 00       	jmp	0xffff800000110b5b <vprintfmt+0x13b>
; 			}
ffff800000110b45: e9 00 00 00 00       	jmp	0xffff800000110b4a <vprintfmt+0x12a>
; 			for (precision = 0; ; ++fmt) {
ffff800000110b4a: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000110b4e: 48 83 c0 01          	addq	$1, %rax
ffff800000110b52: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff800000110b56: e9 ba ff ff ff       	jmp	0xffff800000110b15 <vprintfmt+0xf5>
; 			goto process_precision;
ffff800000110b5b: e9 8c 00 00 00       	jmp	0xffff800000110bec <vprintfmt+0x1cc>
; 			precision = va_arg(ap, int);
ffff800000110b60: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110b64: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000110b6b: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110b6e: 89 45 84             	movl	%eax, -124(%rbp)
ffff800000110b71: 83 f8 28             	cmpl	$40, %eax
ffff800000110b74: 0f 87 22 00 00 00    	ja	0xffff800000110b9c <vprintfmt+0x17c>
ffff800000110b7a: 48 8b 8d 78 ff ff ff 	movq	-136(%rbp), %rcx
ffff800000110b81: 8b 55 84             	movl	-124(%rbp), %edx
; 			precision = va_arg(ap, int);
ffff800000110b84: 48 63 c2             	movslq	%edx, %rax
ffff800000110b87: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110b8b: 83 c2 08             	addl	$8, %edx
ffff800000110b8e: 89 11                	movl	%edx, (%rcx)
ffff800000110b90: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff800000110b97: e9 1d 00 00 00       	jmp	0xffff800000110bb9 <vprintfmt+0x199>
ffff800000110b9c: 48 8b 8d 78 ff ff ff 	movq	-136(%rbp), %rcx
; 			precision = va_arg(ap, int);
ffff800000110ba3: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110ba7: 48 89 d0             	movq	%rdx, %rax
ffff800000110baa: 48 83 c2 08          	addq	$8, %rdx
ffff800000110bae: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110bb2: 48 89 85 70 ff ff ff 	movq	%rax, -144(%rbp)
ffff800000110bb9: 48 8b 85 70 ff ff ff 	movq	-144(%rbp), %rax
; 			precision = va_arg(ap, int);
ffff800000110bc0: 8b 00                	movl	(%rax), %eax
ffff800000110bc2: 89 45 98             	movl	%eax, -104(%rbp)
; 			goto process_precision;
ffff800000110bc5: e9 22 00 00 00       	jmp	0xffff800000110bec <vprintfmt+0x1cc>
; 			if (width < 0)
ffff800000110bca: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110bce: 0f 8d 07 00 00 00    	jge	0xffff800000110bdb <vprintfmt+0x1bb>
; 				width = 0;
ffff800000110bd4: c7 45 9c 00 00 00 00 	movl	$0, -100(%rbp)
; 			goto reswitch;
ffff800000110bdb: e9 e1 fe ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			altflag = 1;
ffff800000110be0: c7 45 94 01 00 00 00 	movl	$1, -108(%rbp)
; 			goto reswitch;
ffff800000110be7: e9 d5 fe ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			if (width < 0)
ffff800000110bec: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110bf0: 0f 8d 0d 00 00 00    	jge	0xffff800000110c03 <vprintfmt+0x1e3>
; 				width = precision, precision = -1;
ffff800000110bf6: 8b 45 98             	movl	-104(%rbp), %eax
ffff800000110bf9: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110bfc: c7 45 98 ff ff ff ff 	movl	$4294967295, -104(%rbp) # imm = 0xFFFFFFFF
; 			goto reswitch;
ffff800000110c03: e9 b9 fe ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			lflag++;
ffff800000110c08: 8b 45 a0             	movl	-96(%rbp), %eax
ffff800000110c0b: 83 c0 01             	addl	$1, %eax
ffff800000110c0e: 89 45 a0             	movl	%eax, -96(%rbp)
; 			goto reswitch;
ffff800000110c11: e9 ab fe ff ff       	jmp	0xffff800000110ac1 <vprintfmt+0xa1>
; 			putch(va_arg(ap, int), putdat);
ffff800000110c16: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110c1a: 48 89 85 58 ff ff ff 	movq	%rax, -168(%rbp)
ffff800000110c21: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110c25: 48 89 85 60 ff ff ff 	movq	%rax, -160(%rbp)
ffff800000110c2c: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110c2f: 89 85 6c ff ff ff    	movl	%eax, -148(%rbp)
ffff800000110c35: 83 f8 28             	cmpl	$40, %eax
ffff800000110c38: 0f 87 25 00 00 00    	ja	0xffff800000110c63 <vprintfmt+0x243>
ffff800000110c3e: 48 8b 8d 60 ff ff ff 	movq	-160(%rbp), %rcx
ffff800000110c45: 8b 95 6c ff ff ff    	movl	-148(%rbp), %edx
; 			putch(va_arg(ap, int), putdat);
ffff800000110c4b: 48 63 c2             	movslq	%edx, %rax
ffff800000110c4e: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110c52: 83 c2 08             	addl	$8, %edx
ffff800000110c55: 89 11                	movl	%edx, (%rcx)
ffff800000110c57: 48 89 85 50 ff ff ff 	movq	%rax, -176(%rbp)
ffff800000110c5e: e9 1d 00 00 00       	jmp	0xffff800000110c80 <vprintfmt+0x260>
ffff800000110c63: 48 8b 8d 60 ff ff ff 	movq	-160(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
ffff800000110c6a: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110c6e: 48 89 d0             	movq	%rdx, %rax
ffff800000110c71: 48 83 c2 08          	addq	$8, %rdx
ffff800000110c75: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110c79: 48 89 85 50 ff ff ff 	movq	%rax, -176(%rbp)
ffff800000110c80: 48 8b 85 58 ff ff ff 	movq	-168(%rbp), %rax
ffff800000110c87: 48 8b 8d 50 ff ff ff 	movq	-176(%rbp), %rcx
; 			putch(va_arg(ap, int), putdat);
ffff800000110c8e: 8b 39                	movl	(%rcx), %edi
ffff800000110c90: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110c94: ff d0                	callq	*%rax
; 			break;
ffff800000110c96: e9 9e 04 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 			err = va_arg(ap, int);
ffff800000110c9b: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110c9f: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff800000110ca6: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110ca9: 89 85 4c ff ff ff    	movl	%eax, -180(%rbp)
ffff800000110caf: 83 f8 28             	cmpl	$40, %eax
ffff800000110cb2: 0f 87 25 00 00 00    	ja	0xffff800000110cdd <vprintfmt+0x2bd>
ffff800000110cb8: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
ffff800000110cbf: 8b 95 4c ff ff ff    	movl	-180(%rbp), %edx
; 			err = va_arg(ap, int);
ffff800000110cc5: 48 63 c2             	movslq	%edx, %rax
ffff800000110cc8: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110ccc: 83 c2 08             	addl	$8, %edx
ffff800000110ccf: 89 11                	movl	%edx, (%rcx)
ffff800000110cd1: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff800000110cd8: e9 1d 00 00 00       	jmp	0xffff800000110cfa <vprintfmt+0x2da>
ffff800000110cdd: 48 8b 8d 40 ff ff ff 	movq	-192(%rbp), %rcx
; 			err = va_arg(ap, int);
ffff800000110ce4: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110ce8: 48 89 d0             	movq	%rdx, %rax
ffff800000110ceb: 48 83 c2 08          	addq	$8, %rdx
ffff800000110cef: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110cf3: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff800000110cfa: 48 8b 85 38 ff ff ff 	movq	-200(%rbp), %rax
; 			err = va_arg(ap, int);
ffff800000110d01: 8b 00                	movl	(%rax), %eax
ffff800000110d03: 89 45 b0             	movl	%eax, -80(%rbp)
; 			if (err < 0)
ffff800000110d06: 83 7d b0 00          	cmpl	$0, -80(%rbp)
ffff800000110d0a: 0f 8d 08 00 00 00    	jge	0xffff800000110d18 <vprintfmt+0x2f8>
; 				err = -err;
ffff800000110d10: 31 c0                	xorl	%eax, %eax
ffff800000110d12: 2b 45 b0             	subl	-80(%rbp), %eax
ffff800000110d15: 89 45 b0             	movl	%eax, -80(%rbp)
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff800000110d18: 48 63 45 b0          	movslq	-80(%rbp), %rax
ffff800000110d1c: 48 83 f8 09          	cmpq	$9, %rax
ffff800000110d20: 0f 83 23 00 00 00    	jae	0xffff800000110d49 <vprintfmt+0x329>
ffff800000110d26: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff800000110d2a: 48 b8 10 83 11 00 00 80 ff ff	movabsq	$-140737487207664, %rax # imm = 0xFFFF800000118310
ffff800000110d34: 48 8d 04 c8          	leaq	(%rax,%rcx,8), %rax
ffff800000110d38: 48 8b 00             	movq	(%rax), %rax
ffff800000110d3b: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000110d3f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110d43: 0f 85 29 00 00 00    	jne	0xffff800000110d72 <vprintfmt+0x352>
; 				printfmt(putch, putdat, "error %d", err);
ffff800000110d49: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110d4d: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110d51: 8b 4d b0             	movl	-80(%rbp), %ecx
ffff800000110d54: 48 ba 7d 8f 11 00 00 80 ff ff	movabsq	$-140737487204483, %rdx # imm = 0xFFFF800000118F7D
ffff800000110d5e: 49 b8 40 11 11 00 00 80 ff ff	movabsq	$-140737487236800, %r8 # imm = 0xFFFF800000111140
ffff800000110d68: 31 c0                	xorl	%eax, %eax
ffff800000110d6a: 41 ff d0             	callq	*%r8
ffff800000110d6d: e9 25 00 00 00       	jmp	0xffff800000110d97 <vprintfmt+0x377>
; 				printfmt(putch, putdat, "%s", p);
ffff800000110d72: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000110d76: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110d7a: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff800000110d7e: 48 ba 3b 88 11 00 00 80 ff ff	movabsq	$-140737487206341, %rdx # imm = 0xFFFF80000011883B
ffff800000110d88: 49 b8 40 11 11 00 00 80 ff ff	movabsq	$-140737487236800, %r8 # imm = 0xFFFF800000111140
ffff800000110d92: 31 c0                	xorl	%eax, %eax
ffff800000110d94: 41 ff d0             	callq	*%r8
; 			break;
ffff800000110d97: e9 9d 03 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110d9c: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000110da0: 48 89 85 28 ff ff ff 	movq	%rax, -216(%rbp)
ffff800000110da7: 8b 45 c0             	movl	-64(%rbp), %eax
ffff800000110daa: 89 85 34 ff ff ff    	movl	%eax, -204(%rbp)
ffff800000110db0: 83 f8 28             	cmpl	$40, %eax
ffff800000110db3: 0f 87 25 00 00 00    	ja	0xffff800000110dde <vprintfmt+0x3be>
ffff800000110db9: 48 8b 8d 28 ff ff ff 	movq	-216(%rbp), %rcx
ffff800000110dc0: 8b 95 34 ff ff ff    	movl	-204(%rbp), %edx
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110dc6: 48 63 c2             	movslq	%edx, %rax
ffff800000110dc9: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000110dcd: 83 c2 08             	addl	$8, %edx
ffff800000110dd0: 89 11                	movl	%edx, (%rcx)
ffff800000110dd2: 48 89 85 20 ff ff ff 	movq	%rax, -224(%rbp)
ffff800000110dd9: e9 1d 00 00 00       	jmp	0xffff800000110dfb <vprintfmt+0x3db>
ffff800000110dde: 48 8b 8d 28 ff ff ff 	movq	-216(%rbp), %rcx
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110de5: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000110de9: 48 89 d0             	movq	%rdx, %rax
ffff800000110dec: 48 83 c2 08          	addq	$8, %rdx
ffff800000110df0: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000110df4: 48 89 85 20 ff ff ff 	movq	%rax, -224(%rbp)
ffff800000110dfb: 48 8b 85 20 ff ff ff 	movq	-224(%rbp), %rax
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff800000110e02: 48 8b 00             	movq	(%rax), %rax
ffff800000110e05: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000110e09: 48 83 f8 00          	cmpq	$0, %rax
ffff800000110e0d: 0f 85 0e 00 00 00    	jne	0xffff800000110e21 <vprintfmt+0x401>
; 				p = "(null)";
ffff800000110e13: 48 b8 b6 92 11 00 00 80 ff ff	movabsq	$-140737487203658, %rax # imm = 0xFFFF8000001192B6
ffff800000110e1d: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 			if (width > 0 && padc != '-')
ffff800000110e21: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110e25: 0f 8e 56 00 00 00    	jle	0xffff800000110e81 <vprintfmt+0x461>
ffff800000110e2b: 0f be 45 93          	movsbl	-109(%rbp), %eax
ffff800000110e2f: 83 f8 2d             	cmpl	$45, %eax
ffff800000110e32: 0f 84 49 00 00 00    	je	0xffff800000110e81 <vprintfmt+0x461>
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff800000110e38: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff800000110e3c: 48 63 75 98          	movslq	-104(%rbp), %rsi
ffff800000110e40: 48 b8 50 22 11 00 00 80 ff ff	movabsq	$-140737487232432, %rax # imm = 0xFFFF800000112250
ffff800000110e4a: ff d0                	callq	*%rax
ffff800000110e4c: 89 c1                	movl	%eax, %ecx
ffff800000110e4e: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000110e51: 29 c8                	subl	%ecx, %eax
ffff800000110e53: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110e56: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110e5a: 0f 8e 1c 00 00 00    	jle	0xffff800000110e7c <vprintfmt+0x45c>
; 					putch(padc, putdat);
ffff800000110e60: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110e64: 0f be 7d 93          	movsbl	-109(%rbp), %edi
ffff800000110e68: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110e6c: ff d0                	callq	*%rax
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff800000110e6e: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000110e71: 83 c0 ff             	addl	$-1, %eax
ffff800000110e74: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110e77: e9 da ff ff ff       	jmp	0xffff800000110e56 <vprintfmt+0x436>
; 					putch(padc, putdat);
ffff800000110e7c: e9 00 00 00 00       	jmp	0xffff800000110e81 <vprintfmt+0x461>
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff800000110e81: e9 00 00 00 00       	jmp	0xffff800000110e86 <vprintfmt+0x466>
ffff800000110e86: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff800000110e8a: 48 89 c1             	movq	%rax, %rcx
ffff800000110e8d: 48 83 c1 01          	addq	$1, %rcx
ffff800000110e91: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff800000110e95: 0f be 08             	movsbl	(%rax), %ecx
ffff800000110e98: 89 4d b4             	movl	%ecx, -76(%rbp)
ffff800000110e9b: 31 c0                	xorl	%eax, %eax
ffff800000110e9d: 83 f9 00             	cmpl	$0, %ecx
ffff800000110ea0: 88 85 1f ff ff ff    	movb	%al, -225(%rbp)
ffff800000110ea6: 0f 84 33 00 00 00    	je	0xffff800000110edf <vprintfmt+0x4bf>
ffff800000110eac: b0 01                	movb	$1, %al
ffff800000110eae: 83 7d 98 00          	cmpl	$0, -104(%rbp)
ffff800000110eb2: 88 85 1e ff ff ff    	movb	%al, -226(%rbp)
ffff800000110eb8: 0f 8c 15 00 00 00    	jl	0xffff800000110ed3 <vprintfmt+0x4b3>
ffff800000110ebe: 8b 45 98             	movl	-104(%rbp), %eax
ffff800000110ec1: 83 c0 ff             	addl	$-1, %eax
ffff800000110ec4: 89 45 98             	movl	%eax, -104(%rbp)
ffff800000110ec7: 83 f8 00             	cmpl	$0, %eax
ffff800000110eca: 0f 9d c0             	setge	%al
ffff800000110ecd: 88 85 1e ff ff ff    	movb	%al, -226(%rbp)
ffff800000110ed3: 8a 85 1e ff ff ff    	movb	-226(%rbp), %al
ffff800000110ed9: 88 85 1f ff ff ff    	movb	%al, -225(%rbp)
ffff800000110edf: 8a 85 1f ff ff ff    	movb	-225(%rbp), %al
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff800000110ee5: a8 01                	testb	$1, %al
ffff800000110ee7: 0f 85 05 00 00 00    	jne	0xffff800000110ef2 <vprintfmt+0x4d2>
ffff800000110eed: e9 52 00 00 00       	jmp	0xffff800000110f44 <vprintfmt+0x524>
; 				if (altflag && (ch < ' ' || ch > '~'))
ffff800000110ef2: 83 7d 94 00          	cmpl	$0, -108(%rbp)
ffff800000110ef6: 0f 84 28 00 00 00    	je	0xffff800000110f24 <vprintfmt+0x504>
ffff800000110efc: 83 7d b4 20          	cmpl	$32, -76(%rbp)
ffff800000110f00: 0f 8c 0a 00 00 00    	jl	0xffff800000110f10 <vprintfmt+0x4f0>
ffff800000110f06: 83 7d b4 7e          	cmpl	$126, -76(%rbp)
ffff800000110f0a: 0f 8e 14 00 00 00    	jle	0xffff800000110f24 <vprintfmt+0x504>
; 					putch('?', putdat);
ffff800000110f10: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110f14: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110f18: bf 3f 00 00 00       	movl	$63, %edi
ffff800000110f1d: ff d0                	callq	*%rax
ffff800000110f1f: e9 0d 00 00 00       	jmp	0xffff800000110f31 <vprintfmt+0x511>
; 					putch(ch, putdat);
ffff800000110f24: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110f28: 8b 7d b4             	movl	-76(%rbp), %edi
ffff800000110f2b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110f2f: ff d0                	callq	*%rax
; 				if (altflag && (ch < ' ' || ch > '~'))
ffff800000110f31: e9 00 00 00 00       	jmp	0xffff800000110f36 <vprintfmt+0x516>
; 					width--)
ffff800000110f36: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000110f39: 83 c0 ff             	addl	$-1, %eax
ffff800000110f3c: 89 45 9c             	movl	%eax, -100(%rbp)
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff800000110f3f: e9 42 ff ff ff       	jmp	0xffff800000110e86 <vprintfmt+0x466>
; 			for (; width > 0; width--)
ffff800000110f44: e9 00 00 00 00       	jmp	0xffff800000110f49 <vprintfmt+0x529>
ffff800000110f49: 83 7d 9c 00          	cmpl	$0, -100(%rbp)
ffff800000110f4d: 0f 8e 1d 00 00 00    	jle	0xffff800000110f70 <vprintfmt+0x550>
; 				putch(' ', putdat);
ffff800000110f53: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110f57: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110f5b: bf 20 00 00 00       	movl	$32, %edi
ffff800000110f60: ff d0                	callq	*%rax
; 			for (; width > 0; width--)
ffff800000110f62: 8b 45 9c             	movl	-100(%rbp), %eax
ffff800000110f65: 83 c0 ff             	addl	$-1, %eax
ffff800000110f68: 89 45 9c             	movl	%eax, -100(%rbp)
ffff800000110f6b: e9 d9 ff ff ff       	jmp	0xffff800000110f49 <vprintfmt+0x529>
; 			break;
ffff800000110f70: e9 c4 01 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 			num = getint(&ap, lflag);
ffff800000110f75: 8b 75 a0             	movl	-96(%rbp), %esi
ffff800000110f78: 48 b8 a0 11 11 00 00 80 ff ff	movabsq	$-140737487236704, %rax # imm = 0xFFFF8000001111A0
ffff800000110f82: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff800000110f86: ff d0                	callq	*%rax
ffff800000110f88: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			if ((long long) num < 0) {
ffff800000110f8c: 48 83 7d a8 00       	cmpq	$0, -88(%rbp)
ffff800000110f91: 0f 8d 19 00 00 00    	jge	0xffff800000110fb0 <vprintfmt+0x590>
; 				putch('-', putdat);
ffff800000110f97: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000110f9b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000110f9f: bf 2d 00 00 00       	movl	$45, %edi
ffff800000110fa4: ff d0                	callq	*%rax
; 				num = -(long long) num;
ffff800000110fa6: 31 c0                	xorl	%eax, %eax
ffff800000110fa8: 48 2b 45 a8          	subq	-88(%rbp), %rax
ffff800000110fac: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 10;
ffff800000110fb0: c7 45 a4 0a 00 00 00 	movl	$10, -92(%rbp)
; 			goto number;
ffff800000110fb7: e9 fb 00 00 00       	jmp	0xffff8000001110b7 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff800000110fbc: 8b 75 a0             	movl	-96(%rbp), %esi
ffff800000110fbf: 48 b8 d0 12 11 00 00 80 ff ff	movabsq	$-140737487236400, %rax # imm = 0xFFFF8000001112D0
ffff800000110fc9: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff800000110fcd: ff d0                	callq	*%rax
ffff800000110fcf: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 10;
ffff800000110fd3: c7 45 a4 0a 00 00 00 	movl	$10, -92(%rbp)
; 			goto number;
ffff800000110fda: e9 d8 00 00 00       	jmp	0xffff8000001110b7 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff800000110fdf: 8b 75 a0             	movl	-96(%rbp), %esi
ffff800000110fe2: 48 b8 d0 12 11 00 00 80 ff ff	movabsq	$-140737487236400, %rax # imm = 0xFFFF8000001112D0
ffff800000110fec: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff800000110ff0: ff d0                	callq	*%rax
ffff800000110ff2: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 8;
ffff800000110ff6: c7 45 a4 08 00 00 00 	movl	$8, -92(%rbp)
; 			goto number;
ffff800000110ffd: e9 b5 00 00 00       	jmp	0xffff8000001110b7 <vprintfmt+0x697>
; 			putch('0', putdat);
ffff800000111002: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111006: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011100a: bf 30 00 00 00       	movl	$48, %edi
ffff80000011100f: ff d0                	callq	*%rax
; 			putch('x', putdat);
ffff800000111011: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111015: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111019: bf 78 00 00 00       	movl	$120, %edi
ffff80000011101e: ff d0                	callq	*%rax
; 				(uintptr_t) va_arg(ap, void *);
ffff800000111020: 48 8d 45 c0          	leaq	-64(%rbp), %rax
ffff800000111024: 48 89 85 10 ff ff ff 	movq	%rax, -240(%rbp)
ffff80000011102b: 8b 45 c0             	movl	-64(%rbp), %eax
ffff80000011102e: 89 85 18 ff ff ff    	movl	%eax, -232(%rbp)
ffff800000111034: 83 f8 28             	cmpl	$40, %eax
ffff800000111037: 0f 87 25 00 00 00    	ja	0xffff800000111062 <vprintfmt+0x642>
ffff80000011103d: 48 8b 8d 10 ff ff ff 	movq	-240(%rbp), %rcx
ffff800000111044: 8b 95 18 ff ff ff    	movl	-232(%rbp), %edx
; 				(uintptr_t) va_arg(ap, void *);
ffff80000011104a: 48 63 c2             	movslq	%edx, %rax
ffff80000011104d: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111051: 83 c2 08             	addl	$8, %edx
ffff800000111054: 89 11                	movl	%edx, (%rcx)
ffff800000111056: 48 89 85 08 ff ff ff 	movq	%rax, -248(%rbp)
ffff80000011105d: e9 1d 00 00 00       	jmp	0xffff80000011107f <vprintfmt+0x65f>
ffff800000111062: 48 8b 8d 10 ff ff ff 	movq	-240(%rbp), %rcx
; 				(uintptr_t) va_arg(ap, void *);
ffff800000111069: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff80000011106d: 48 89 d0             	movq	%rdx, %rax
ffff800000111070: 48 83 c2 08          	addq	$8, %rdx
ffff800000111074: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff800000111078: 48 89 85 08 ff ff ff 	movq	%rax, -248(%rbp)
ffff80000011107f: 48 8b 85 08 ff ff ff 	movq	-248(%rbp), %rax
; 				(uintptr_t) va_arg(ap, void *);
ffff800000111086: 48 8b 00             	movq	(%rax), %rax
; 			num = (unsigned long long)
ffff800000111089: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 16;
ffff80000011108d: c7 45 a4 10 00 00 00 	movl	$16, -92(%rbp)
; 			goto number;
ffff800000111094: e9 1e 00 00 00       	jmp	0xffff8000001110b7 <vprintfmt+0x697>
; 			num = getuint(&ap, lflag);
ffff800000111099: 8b 75 a0             	movl	-96(%rbp), %esi
ffff80000011109c: 48 b8 d0 12 11 00 00 80 ff ff	movabsq	$-140737487236400, %rax # imm = 0xFFFF8000001112D0
ffff8000001110a6: 48 8d 7d c0          	leaq	-64(%rbp), %rdi
ffff8000001110aa: ff d0                	callq	*%rax
ffff8000001110ac: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 			base = 16;
ffff8000001110b0: c7 45 a4 10 00 00 00 	movl	$16, -92(%rbp)
; 			printnum(putch, putdat, num, base, width, padc);
ffff8000001110b7: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001110bb: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110bf: 48 8b 55 a8          	movq	-88(%rbp), %rdx
ffff8000001110c3: 8b 4d a4             	movl	-92(%rbp), %ecx
ffff8000001110c6: 44 8b 45 9c          	movl	-100(%rbp), %r8d
ffff8000001110ca: 44 0f be 4d 93       	movsbl	-109(%rbp), %r9d
ffff8000001110cf: 48 b8 00 14 11 00 00 80 ff ff	movabsq	$-140737487236096, %rax # imm = 0xFFFF800000111400
ffff8000001110d9: ff d0                	callq	*%rax
; 			break;
ffff8000001110db: e9 59 00 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 			putch(ch, putdat);
ffff8000001110e0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001110e4: 8b 7d b4             	movl	-76(%rbp), %edi
ffff8000001110e7: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110eb: ff d0                	callq	*%rax
; 			break;
ffff8000001110ed: e9 47 00 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 			putch('%', putdat);
ffff8000001110f2: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001110f6: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001110fa: bf 25 00 00 00       	movl	$37, %edi
ffff8000001110ff: ff d0                	callq	*%rax
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff800000111101: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111105: 48 83 c0 ff          	addq	$-1, %rax
ffff800000111109: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000011110d: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111111: 0f be 40 ff          	movsbl	-1(%rax), %eax
ffff800000111115: 83 f8 25             	cmpl	$37, %eax
ffff800000111118: 0f 84 16 00 00 00    	je	0xffff800000111134 <vprintfmt+0x714>
ffff80000011111e: e9 00 00 00 00       	jmp	0xffff800000111123 <vprintfmt+0x703>
ffff800000111123: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111127: 48 83 c0 ff          	addq	$-1, %rax
ffff80000011112b: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000011112f: e9 d9 ff ff ff       	jmp	0xffff80000011110d <vprintfmt+0x6ed>
; 			break;
ffff800000111134: e9 00 00 00 00       	jmp	0xffff800000111139 <vprintfmt+0x719>
; 	while (1) {
ffff800000111139: e9 1b f9 ff ff       	jmp	0xffff800000110a59 <vprintfmt+0x39>
ffff80000011113e: 66 90                	nop

ffff800000111140 <printfmt>:
; {
ffff800000111140: 55                   	pushq	%rbp
ffff800000111141: 48 89 e5             	movq	%rsp, %rbp
ffff800000111144: 48 83 ec 60          	subq	$96, %rsp
ffff800000111148: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000011114c: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff800000111150: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff800000111154: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000111158: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011115c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000111160: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff800000111164: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000111168: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000011116c: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000111170: c7 45 d4 30 00 00 00 	movl	$48, -44(%rbp)
ffff800000111177: c7 45 d0 18 00 00 00 	movl	$24, -48(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000011117e: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111182: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111186: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000011118a: 48 b8 20 0a 11 00 00 80 ff ff	movabsq	$-140737487238624, %rax # imm = 0xFFFF800000110A20
ffff800000111194: 48 8d 4d d0          	leaq	-48(%rbp), %rcx
ffff800000111198: ff d0                	callq	*%rax
; }
ffff80000011119a: 48 83 c4 60          	addq	$96, %rsp
ffff80000011119e: 5d                   	popq	%rbp
ffff80000011119f: c3                   	retq

ffff8000001111a0 <getint>:
; {
ffff8000001111a0: 55                   	pushq	%rbp
ffff8000001111a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001111a4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001111a8: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
ffff8000001111ab: 83 7d ec 02          	cmpl	$2, -20(%rbp)
ffff8000001111af: 0f 8c 59 00 00 00    	jl	0xffff80000011120e <getint+0x6e>
; 		return va_arg(*ap, long long);
ffff8000001111b5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001111b9: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001111bd: 8b 00                	movl	(%rax), %eax
ffff8000001111bf: 89 45 e8             	movl	%eax, -24(%rbp)
ffff8000001111c2: 83 f8 28             	cmpl	$40, %eax
ffff8000001111c5: 0f 87 1c 00 00 00    	ja	0xffff8000001111e7 <getint+0x47>
ffff8000001111cb: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001111cf: 8b 55 e8             	movl	-24(%rbp), %edx
; 		return va_arg(*ap, long long);
ffff8000001111d2: 48 63 c2             	movslq	%edx, %rax
ffff8000001111d5: 48 03 41 10          	addq	16(%rcx), %rax
ffff8000001111d9: 83 c2 08             	addl	$8, %edx
ffff8000001111dc: 89 11                	movl	%edx, (%rcx)
ffff8000001111de: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001111e2: e9 17 00 00 00       	jmp	0xffff8000001111fe <getint+0x5e>
ffff8000001111e7: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, long long);
ffff8000001111eb: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001111ef: 48 89 d0             	movq	%rdx, %rax
ffff8000001111f2: 48 83 c2 08          	addq	$8, %rdx
ffff8000001111f6: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff8000001111fa: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001111fe: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 		return va_arg(*ap, long long);
ffff800000111202: 48 8b 00             	movq	(%rax), %rax
ffff800000111205: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000111209: e9 b7 00 00 00       	jmp	0xffff8000001112c5 <getint+0x125>
; 	else if (lflag)
ffff80000011120e: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000111212: 0f 84 59 00 00 00    	je	0xffff800000111271 <getint+0xd1>
; 		return va_arg(*ap, long);
ffff800000111218: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011121c: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000111220: 8b 00                	movl	(%rax), %eax
ffff800000111222: 89 45 d4             	movl	%eax, -44(%rbp)
ffff800000111225: 83 f8 28             	cmpl	$40, %eax
ffff800000111228: 0f 87 1c 00 00 00    	ja	0xffff80000011124a <getint+0xaa>
ffff80000011122e: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000111232: 8b 55 d4             	movl	-44(%rbp), %edx
; 		return va_arg(*ap, long);
ffff800000111235: 48 63 c2             	movslq	%edx, %rax
ffff800000111238: 48 03 41 10          	addq	16(%rcx), %rax
ffff80000011123c: 83 c2 08             	addl	$8, %edx
ffff80000011123f: 89 11                	movl	%edx, (%rcx)
ffff800000111241: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111245: e9 17 00 00 00       	jmp	0xffff800000111261 <getint+0xc1>
ffff80000011124a: 48 8b 4d c8          	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, long);
ffff80000011124e: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000111252: 48 89 d0             	movq	%rdx, %rax
ffff800000111255: 48 83 c2 08          	addq	$8, %rdx
ffff800000111259: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff80000011125d: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111261: 48 8b 45 c0          	movq	-64(%rbp), %rax
; 		return va_arg(*ap, long);
ffff800000111265: 48 8b 00             	movq	(%rax), %rax
ffff800000111268: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000011126c: e9 54 00 00 00       	jmp	0xffff8000001112c5 <getint+0x125>
; 		return va_arg(*ap, int);
ffff800000111271: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111275: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000111279: 8b 00                	movl	(%rax), %eax
ffff80000011127b: 89 45 bc             	movl	%eax, -68(%rbp)
ffff80000011127e: 83 f8 28             	cmpl	$40, %eax
ffff800000111281: 0f 87 1c 00 00 00    	ja	0xffff8000001112a3 <getint+0x103>
ffff800000111287: 48 8b 4d b0          	movq	-80(%rbp), %rcx
ffff80000011128b: 8b 55 bc             	movl	-68(%rbp), %edx
; 		return va_arg(*ap, int);
ffff80000011128e: 48 63 c2             	movslq	%edx, %rax
ffff800000111291: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111295: 83 c2 08             	addl	$8, %edx
ffff800000111298: 89 11                	movl	%edx, (%rcx)
ffff80000011129a: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011129e: e9 17 00 00 00       	jmp	0xffff8000001112ba <getint+0x11a>
ffff8000001112a3: 48 8b 4d b0          	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, int);
ffff8000001112a7: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001112ab: 48 89 d0             	movq	%rdx, %rax
ffff8000001112ae: 48 83 c2 08          	addq	$8, %rdx
ffff8000001112b2: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff8000001112b6: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001112ba: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 		return va_arg(*ap, int);
ffff8000001112be: 48 63 00             	movslq	(%rax), %rax
ffff8000001112c1: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff8000001112c5: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001112c9: 5d                   	popq	%rbp
ffff8000001112ca: c3                   	retq
ffff8000001112cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001112d0 <getuint>:
; {
ffff8000001112d0: 55                   	pushq	%rbp
ffff8000001112d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001112d4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001112d8: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (lflag >= 2)
ffff8000001112db: 83 7d ec 02          	cmpl	$2, -20(%rbp)
ffff8000001112df: 0f 8c 59 00 00 00    	jl	0xffff80000011133e <getuint+0x6e>
; 		return va_arg(*ap, unsigned long long);
ffff8000001112e5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001112e9: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001112ed: 8b 00                	movl	(%rax), %eax
ffff8000001112ef: 89 45 e8             	movl	%eax, -24(%rbp)
ffff8000001112f2: 83 f8 28             	cmpl	$40, %eax
ffff8000001112f5: 0f 87 1c 00 00 00    	ja	0xffff800000111317 <getuint+0x47>
ffff8000001112fb: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001112ff: 8b 55 e8             	movl	-24(%rbp), %edx
; 		return va_arg(*ap, unsigned long long);
ffff800000111302: 48 63 c2             	movslq	%edx, %rax
ffff800000111305: 48 03 41 10          	addq	16(%rcx), %rax
ffff800000111309: 83 c2 08             	addl	$8, %edx
ffff80000011130c: 89 11                	movl	%edx, (%rcx)
ffff80000011130e: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000111312: e9 17 00 00 00       	jmp	0xffff80000011132e <getuint+0x5e>
ffff800000111317: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		return va_arg(*ap, unsigned long long);
ffff80000011131b: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff80000011131f: 48 89 d0             	movq	%rdx, %rax
ffff800000111322: 48 83 c2 08          	addq	$8, %rdx
ffff800000111326: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff80000011132a: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000011132e: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 		return va_arg(*ap, unsigned long long);
ffff800000111332: 48 8b 00             	movq	(%rax), %rax
ffff800000111335: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000111339: e9 b6 00 00 00       	jmp	0xffff8000001113f4 <getuint+0x124>
; 	else if (lflag)
ffff80000011133e: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000111342: 0f 84 59 00 00 00    	je	0xffff8000001113a1 <getuint+0xd1>
; 		return va_arg(*ap, unsigned long);
ffff800000111348: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011134c: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000111350: 8b 00                	movl	(%rax), %eax
ffff800000111352: 89 45 d4             	movl	%eax, -44(%rbp)
ffff800000111355: 83 f8 28             	cmpl	$40, %eax
ffff800000111358: 0f 87 1c 00 00 00    	ja	0xffff80000011137a <getuint+0xaa>
ffff80000011135e: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000111362: 8b 55 d4             	movl	-44(%rbp), %edx
; 		return va_arg(*ap, unsigned long);
ffff800000111365: 48 63 c2             	movslq	%edx, %rax
ffff800000111368: 48 03 41 10          	addq	16(%rcx), %rax
ffff80000011136c: 83 c2 08             	addl	$8, %edx
ffff80000011136f: 89 11                	movl	%edx, (%rcx)
ffff800000111371: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111375: e9 17 00 00 00       	jmp	0xffff800000111391 <getuint+0xc1>
ffff80000011137a: 48 8b 4d c8          	movq	-56(%rbp), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000011137e: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000111382: 48 89 d0             	movq	%rdx, %rax
ffff800000111385: 48 83 c2 08          	addq	$8, %rdx
ffff800000111389: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff80000011138d: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000111391: 48 8b 45 c0          	movq	-64(%rbp), %rax
; 		return va_arg(*ap, unsigned long);
ffff800000111395: 48 8b 00             	movq	(%rax), %rax
ffff800000111398: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff80000011139c: e9 53 00 00 00       	jmp	0xffff8000001113f4 <getuint+0x124>
; 		return va_arg(*ap, unsigned int);
ffff8000001113a1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001113a5: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff8000001113a9: 8b 00                	movl	(%rax), %eax
ffff8000001113ab: 89 45 bc             	movl	%eax, -68(%rbp)
ffff8000001113ae: 83 f8 28             	cmpl	$40, %eax
ffff8000001113b1: 0f 87 1c 00 00 00    	ja	0xffff8000001113d3 <getuint+0x103>
ffff8000001113b7: 48 8b 4d b0          	movq	-80(%rbp), %rcx
ffff8000001113bb: 8b 55 bc             	movl	-68(%rbp), %edx
; 		return va_arg(*ap, unsigned int);
ffff8000001113be: 48 63 c2             	movslq	%edx, %rax
ffff8000001113c1: 48 03 41 10          	addq	16(%rcx), %rax
ffff8000001113c5: 83 c2 08             	addl	$8, %edx
ffff8000001113c8: 89 11                	movl	%edx, (%rcx)
ffff8000001113ca: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001113ce: e9 17 00 00 00       	jmp	0xffff8000001113ea <getuint+0x11a>
ffff8000001113d3: 48 8b 4d b0          	movq	-80(%rbp), %rcx
; 		return va_arg(*ap, unsigned int);
ffff8000001113d7: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff8000001113db: 48 89 d0             	movq	%rdx, %rax
ffff8000001113de: 48 83 c2 08          	addq	$8, %rdx
ffff8000001113e2: 48 89 51 08          	movq	%rdx, 8(%rcx)
ffff8000001113e6: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001113ea: 48 8b 45 a8          	movq	-88(%rbp), %rax
; 		return va_arg(*ap, unsigned int);
ffff8000001113ee: 8b 00                	movl	(%rax), %eax
ffff8000001113f0: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff8000001113f4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001113f8: 5d                   	popq	%rbp
ffff8000001113f9: c3                   	retq
ffff8000001113fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111400 <printnum>:
; {
ffff800000111400: 55                   	pushq	%rbp
ffff800000111401: 48 89 e5             	movq	%rsp, %rbp
ffff800000111404: 48 83 ec 30          	subq	$48, %rsp
ffff800000111408: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011140c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000111410: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000111414: 89 4d e4             	movl	%ecx, -28(%rbp)
ffff800000111417: 44 89 45 e0          	movl	%r8d, -32(%rbp)
ffff80000011141b: 44 89 4d dc          	movl	%r9d, -36(%rbp)
; 	if (num >= base) {
ffff80000011141f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111423: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff800000111426: 48 39 c8             	cmpq	%rcx, %rax
ffff800000111429: 0f 82 37 00 00 00    	jb	0xffff800000111466 <printnum+0x66>
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff80000011142f: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111433: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111437: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011143b: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff80000011143e: 31 d2                	xorl	%edx, %edx
ffff800000111440: 48 f7 f1             	divq	%rcx
ffff800000111443: 48 89 c2             	movq	%rax, %rdx
ffff800000111446: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff800000111449: 44 8b 45 e0          	movl	-32(%rbp), %r8d
ffff80000011144d: 41 83 e8 01          	subl	$1, %r8d
ffff800000111451: 44 8b 4d dc          	movl	-36(%rbp), %r9d
ffff800000111455: 48 b8 00 14 11 00 00 80 ff ff	movabsq	$-140737487236096, %rax # imm = 0xFFFF800000111400
ffff80000011145f: ff d0                	callq	*%rax
; 	} else {
ffff800000111461: e9 2e 00 00 00       	jmp	0xffff800000111494 <printnum+0x94>
; 		while (--width > 0)
ffff800000111466: e9 00 00 00 00       	jmp	0xffff80000011146b <printnum+0x6b>
ffff80000011146b: 8b 45 e0             	movl	-32(%rbp), %eax
ffff80000011146e: 83 c0 ff             	addl	$-1, %eax
ffff800000111471: 89 45 e0             	movl	%eax, -32(%rbp)
ffff800000111474: 83 f8 00             	cmpl	$0, %eax
ffff800000111477: 0f 8e 12 00 00 00    	jle	0xffff80000011148f <printnum+0x8f>
; 			putch(padc, putdat);
ffff80000011147d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111481: 8b 7d dc             	movl	-36(%rbp), %edi
ffff800000111484: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000111488: ff d0                	callq	*%rax
; 		while (--width > 0)
ffff80000011148a: e9 dc ff ff ff       	jmp	0xffff80000011146b <printnum+0x6b>
ffff80000011148f: e9 00 00 00 00       	jmp	0xffff800000111494 <printnum+0x94>
; 	putch("0123456789abcdef"[num % base], putdat);
ffff800000111494: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111498: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011149c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001114a0: 8b 4d e4             	movl	-28(%rbp), %ecx
ffff8000001114a3: 31 d2                	xorl	%edx, %edx
ffff8000001114a5: 48 f7 f1             	divq	%rcx
ffff8000001114a8: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001114ac: 48 b9 86 8f 11 00 00 80 ff ff	movabsq	$-140737487204474, %rcx # imm = 0xFFFF800000118F86
ffff8000001114b6: 48 01 ca             	addq	%rcx, %rdx
ffff8000001114b9: 0f be 3a             	movsbl	(%rdx), %edi
ffff8000001114bc: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001114c0: ff d0                	callq	*%rax
; }
ffff8000001114c2: 48 83 c4 30          	addq	$48, %rsp
ffff8000001114c6: 5d                   	popq	%rbp
ffff8000001114c7: c3                   	retq
ffff8000001114c8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001114d0 <vsnprintf>:
; {
ffff8000001114d0: 55                   	pushq	%rbp
ffff8000001114d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001114d4: 48 83 ec 40          	subq	$64, %rsp
ffff8000001114d8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001114dc: 89 75 ec             	movl	%esi, -20(%rbp)
ffff8000001114df: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001114e3: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff8000001114e7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001114eb: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001114ef: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001114f3: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff8000001114f7: 48 01 c8             	addq	%rcx, %rax
ffff8000001114fa: 48 83 c0 ff          	addq	$-1, %rax
ffff8000001114fe: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000111502: c7 45 d0 00 00 00 00 	movl	$0, -48(%rbp)
; 	if (buf == NULL || n < 1)
ffff800000111509: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011150e: 0f 84 0a 00 00 00    	je	0xffff80000011151e <vsnprintf+0x4e>
ffff800000111514: 83 7d ec 01          	cmpl	$1, -20(%rbp)
ffff800000111518: 0f 8d 0c 00 00 00    	jge	0xffff80000011152a <vsnprintf+0x5a>
; 		return -EINVAL;
ffff80000011151e: c7 45 fc fb ff ff ff 	movl	$4294967291, -4(%rbp)   # imm = 0xFFFFFFFB
ffff800000111525: e9 2f 00 00 00       	jmp	0xffff800000111559 <vsnprintf+0x89>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff80000011152a: 48 8d 75 c0          	leaq	-64(%rbp), %rsi
ffff80000011152e: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000111532: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111536: 48 bf 70 15 11 00 00 80 ff ff	movabsq	$-140737487235728, %rdi # imm = 0xFFFF800000111570
ffff800000111540: 48 b8 20 0a 11 00 00 80 ff ff	movabsq	$-140737487238624, %rax # imm = 0xFFFF800000110A20
ffff80000011154a: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff80000011154c: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff800000111550: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff800000111553: 8b 45 d0             	movl	-48(%rbp), %eax
ffff800000111556: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff800000111559: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011155c: 48 83 c4 40          	addq	$64, %rsp
ffff800000111560: 5d                   	popq	%rbp
ffff800000111561: c3                   	retq
ffff800000111562: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011156c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111570 <sprintputch>:
; {
ffff800000111570: 55                   	pushq	%rbp
ffff800000111571: 48 89 e5             	movq	%rsp, %rbp
ffff800000111574: 89 7d fc             	movl	%edi, -4(%rbp)
ffff800000111577: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	b->cnt++;
ffff80000011157b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011157f: 8b 48 10             	movl	16(%rax), %ecx
ffff800000111582: 83 c1 01             	addl	$1, %ecx
ffff800000111585: 89 48 10             	movl	%ecx, 16(%rax)
; 	if (b->buf < b->ebuf)
ffff800000111588: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011158c: 48 8b 00             	movq	(%rax), %rax
ffff80000011158f: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000111593: 48 3b 41 08          	cmpq	8(%rcx), %rax
ffff800000111597: 0f 83 18 00 00 00    	jae	0xffff8000001115b5 <sprintputch+0x45>
; 		*b->buf++ = ch;
ffff80000011159d: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001115a0: 88 c1                	movb	%al, %cl
ffff8000001115a2: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff8000001115a6: 48 8b 02             	movq	(%rdx), %rax
ffff8000001115a9: 48 89 c6             	movq	%rax, %rsi
ffff8000001115ac: 48 83 c6 01          	addq	$1, %rsi
ffff8000001115b0: 48 89 32             	movq	%rsi, (%rdx)
ffff8000001115b3: 88 08                	movb	%cl, (%rax)
; }
ffff8000001115b5: 5d                   	popq	%rbp
ffff8000001115b6: c3                   	retq
ffff8000001115b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001115c0 <snprintf>:
; {
ffff8000001115c0: 55                   	pushq	%rbp
ffff8000001115c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001115c4: 48 83 ec 70          	subq	$112, %rsp
ffff8000001115c8: 4c 89 4d b8          	movq	%r9, -72(%rbp)
ffff8000001115cc: 4c 89 45 b0          	movq	%r8, -80(%rbp)
ffff8000001115d0: 48 89 4d a8          	movq	%rcx, -88(%rbp)
ffff8000001115d4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001115d8: 89 75 f4             	movl	%esi, -12(%rbp)
ffff8000001115db: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001115df: 48 8d 45 90          	leaq	-112(%rbp), %rax
; 	va_start(ap, fmt);
ffff8000001115e3: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001115e7: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff8000001115eb: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001115ef: c7 45 d4 30 00 00 00 	movl	$48, -44(%rbp)
ffff8000001115f6: c7 45 d0 18 00 00 00 	movl	$24, -48(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff8000001115fd: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111601: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000111604: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000111608: 48 b8 d0 14 11 00 00 80 ff ff	movabsq	$-140737487235888, %rax # imm = 0xFFFF8000001114D0
ffff800000111612: 48 8d 4d d0          	leaq	-48(%rbp), %rcx
ffff800000111616: ff d0                	callq	*%rax
ffff800000111618: 89 45 cc             	movl	%eax, -52(%rbp)
; 	return rc;
ffff80000011161b: 8b 45 cc             	movl	-52(%rbp), %eax
ffff80000011161e: 48 83 c4 70          	addq	$112, %rsp
ffff800000111622: 5d                   	popq	%rbp
ffff800000111623: c3                   	retq
ffff800000111624: cc                   	int3
ffff800000111625: cc                   	int3
ffff800000111626: cc                   	int3
ffff800000111627: cc                   	int3
ffff800000111628: cc                   	int3
ffff800000111629: cc                   	int3
ffff80000011162a: cc                   	int3
ffff80000011162b: cc                   	int3
ffff80000011162c: cc                   	int3
ffff80000011162d: cc                   	int3
ffff80000011162e: cc                   	int3
ffff80000011162f: cc                   	int3

ffff800000111630 <rb_first>:
; {
ffff800000111630: 55                   	pushq	%rbp
ffff800000111631: 48 89 e5             	movq	%rsp, %rbp
ffff800000111634: 48 83 ec 10          	subq	$16, %rsp
ffff800000111638: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_outermost(tree->root, RB_LEFT);
ffff80000011163c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111640: 48 8b 38             	movq	(%rax), %rdi
ffff800000111643: 31 c0                	xorl	%eax, %eax
ffff800000111645: 48 b8 60 16 11 00 00 80 ff ff	movabsq	$-140737487235488, %rax # imm = 0xFFFF800000111660
ffff80000011164f: 31 f6                	xorl	%esi, %esi
ffff800000111651: ff d0                	callq	*%rax
ffff800000111653: 48 83 c4 10          	addq	$16, %rsp
ffff800000111657: 5d                   	popq	%rbp
ffff800000111658: c3                   	retq
ffff800000111659: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000111660 <get_outermost>:
; {
ffff800000111660: 55                   	pushq	%rbp
ffff800000111661: 48 89 e5             	movq	%rsp, %rbp
ffff800000111664: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111668: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (!node) {
ffff80000011166b: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111670: 0f 85 0d 00 00 00    	jne	0xffff800000111683 <get_outermost+0x23>
; 		return NULL;
ffff800000111676: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff80000011167e: e9 35 00 00 00       	jmp	0xffff8000001116b8 <get_outermost+0x58>
; 	while (node->child[dir]) {
ffff800000111683: e9 00 00 00 00       	jmp	0xffff800000111688 <get_outermost+0x28>
ffff800000111688: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011168c: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff80000011168f: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111695: 0f 84 15 00 00 00    	je	0xffff8000001116b0 <get_outermost+0x50>
; 		node = node->child[dir];
ffff80000011169b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011169f: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001116a2: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff8000001116a7: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while (node->child[dir]) {
ffff8000001116ab: e9 d8 ff ff ff       	jmp	0xffff800000111688 <get_outermost+0x28>
; 	return node;
ffff8000001116b0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001116b4: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff8000001116b8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001116bc: 5d                   	popq	%rbp
ffff8000001116bd: c3                   	retq
ffff8000001116be: 66 90                	nop

ffff8000001116c0 <rb_last>:
; {
ffff8000001116c0: 55                   	pushq	%rbp
ffff8000001116c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001116c4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001116c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_outermost(tree->root, RB_RIGHT);
ffff8000001116cc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001116d0: 48 8b 38             	movq	(%rax), %rdi
ffff8000001116d3: 48 b8 60 16 11 00 00 80 ff ff	movabsq	$-140737487235488, %rax # imm = 0xFFFF800000111660
ffff8000001116dd: be 01 00 00 00       	movl	$1, %esi
ffff8000001116e2: ff d0                	callq	*%rax
ffff8000001116e4: 48 83 c4 10          	addq	$16, %rsp
ffff8000001116e8: 5d                   	popq	%rbp
ffff8000001116e9: c3                   	retq
ffff8000001116ea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001116f0 <rb_next>:
; {
ffff8000001116f0: 55                   	pushq	%rbp
ffff8000001116f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001116f4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001116f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_closest(node, RB_RIGHT);
ffff8000001116fc: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111700: 48 b8 20 17 11 00 00 80 ff ff	movabsq	$-140737487235296, %rax # imm = 0xFFFF800000111720
ffff80000011170a: be 01 00 00 00       	movl	$1, %esi
ffff80000011170f: ff d0                	callq	*%rax
ffff800000111711: 48 83 c4 10          	addq	$16, %rsp
ffff800000111715: 5d                   	popq	%rbp
ffff800000111716: c3                   	retq
ffff800000111717: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000111720 <get_closest>:
; {
ffff800000111720: 55                   	pushq	%rbp
ffff800000111721: 48 89 e5             	movq	%rsp, %rbp
ffff800000111724: 48 83 ec 30          	subq	$48, %rsp
ffff800000111728: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011172c: 89 75 ec             	movl	%esi, -20(%rbp)
; 	if (!node)
ffff80000011172f: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111734: 0f 85 0d 00 00 00    	jne	0xffff800000111747 <get_closest+0x27>
; 		return NULL;
ffff80000011173a: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000111742: e9 9c 00 00 00       	jmp	0xffff8000001117e3 <get_closest+0xc3>
; 	if (node->child[dir])
ffff800000111747: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011174b: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff80000011174e: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111754: 0f 84 2f 00 00 00    	je	0xffff800000111789 <get_closest+0x69>
; 		return get_outermost(node->child[dir], !dir);
ffff80000011175a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011175e: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000111761: 48 8b 7c c8 08       	movq	8(%rax,%rcx,8), %rdi
ffff800000111766: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff80000011176a: 0f 95 c0             	setne	%al
ffff80000011176d: 34 ff                	xorb	$-1, %al
ffff80000011176f: 24 01                	andb	$1, %al
ffff800000111771: 0f b6 f0             	movzbl	%al, %esi
ffff800000111774: 48 b8 60 16 11 00 00 80 ff ff	movabsq	$-140737487235488, %rax # imm = 0xFFFF800000111660
ffff80000011177e: ff d0                	callq	*%rax
ffff800000111780: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000111784: e9 5a 00 00 00       	jmp	0xffff8000001117e3 <get_closest+0xc3>
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff800000111789: e9 00 00 00 00       	jmp	0xffff80000011178e <get_closest+0x6e>
ffff80000011178e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111792: 48 8b 08             	movq	(%rax), %rcx
ffff800000111795: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff800000111799: 31 c0                	xorl	%eax, %eax
ffff80000011179b: 48 83 f9 00          	cmpq	$0, %rcx
ffff80000011179f: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001117a2: 0f 84 16 00 00 00    	je	0xffff8000001117be <get_closest+0x9e>
ffff8000001117a8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001117ac: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001117af: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff8000001117b4: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff8000001117b8: 0f 94 c0             	sete	%al
ffff8000001117bb: 88 45 df             	movb	%al, -33(%rbp)
ffff8000001117be: 8a 45 df             	movb	-33(%rbp), %al
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff8000001117c1: a8 01                	testb	$1, %al
ffff8000001117c3: 0f 85 05 00 00 00    	jne	0xffff8000001117ce <get_closest+0xae>
ffff8000001117c9: e9 0d 00 00 00       	jmp	0xffff8000001117db <get_closest+0xbb>
; 		node = parent;
ffff8000001117ce: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001117d2: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff8000001117d6: e9 b3 ff ff ff       	jmp	0xffff80000011178e <get_closest+0x6e>
; 	return parent;
ffff8000001117db: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001117df: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff8000001117e3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001117e7: 48 83 c4 30          	addq	$48, %rsp
ffff8000001117eb: 5d                   	popq	%rbp
ffff8000001117ec: c3                   	retq
ffff8000001117ed: 0f 1f 00             	nopl	(%rax)

ffff8000001117f0 <rb_prev>:
; {
ffff8000001117f0: 55                   	pushq	%rbp
ffff8000001117f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001117f4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001117f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return get_closest(node, RB_LEFT);
ffff8000001117fc: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000111800: 31 c0                	xorl	%eax, %eax
ffff800000111802: 48 b8 20 17 11 00 00 80 ff ff	movabsq	$-140737487235296, %rax # imm = 0xFFFF800000111720
ffff80000011180c: 31 f6                	xorl	%esi, %esi
ffff80000011180e: ff d0                	callq	*%rax
ffff800000111810: 48 83 c4 10          	addq	$16, %rsp
ffff800000111814: 5d                   	popq	%rbp
ffff800000111815: c3                   	retq
ffff800000111816: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111820 <rb_balance>:
; {
ffff800000111820: 55                   	pushq	%rbp
ffff800000111821: 48 89 e5             	movq	%rsp, %rbp
ffff800000111824: 48 83 ec 40          	subq	$64, %rsp
ffff800000111828: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011182c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff800000111830: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111835: 0f 84 0b 00 00 00    	je	0xffff800000111846 <rb_balance+0x26>
ffff80000011183b: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111840: 0f 85 0c 00 00 00    	jne	0xffff800000111852 <rb_balance+0x32>
; 		return -1;
ffff800000111846: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000011184d: e9 4e 01 00 00       	jmp	0xffff8000001119a0 <rb_balance+0x180>
; 	node->color = RB_RED;
ffff800000111852: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111856: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000011185d: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111861: 48 8b 08             	movq	(%rax), %rcx
ffff800000111864: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff800000111868: 31 c0                	xorl	%eax, %eax
ffff80000011186a: 48 83 f9 00          	cmpq	$0, %rcx
ffff80000011186e: 88 45 cb             	movb	%al, -53(%rbp)
ffff800000111871: 0f 84 0e 00 00 00    	je	0xffff800000111885 <rb_balance+0x65>
ffff800000111877: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011187b: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000011187f: 0f 94 c0             	sete	%al
ffff800000111882: 88 45 cb             	movb	%al, -53(%rbp)
ffff800000111885: 8a 45 cb             	movb	-53(%rbp), %al
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff800000111888: a8 01                	testb	$1, %al
ffff80000011188a: 0f 85 05 00 00 00    	jne	0xffff800000111895 <rb_balance+0x75>
ffff800000111890: e9 f6 00 00 00       	jmp	0xffff80000011198b <rb_balance+0x16b>
; 		grandparent = parent->parent;
ffff800000111895: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111899: 48 8b 00             	movq	(%rax), %rax
ffff80000011189c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff8000001118a0: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001118a4: 48 8b 40 08          	movq	8(%rax), %rax
ffff8000001118a8: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff8000001118ac: 0f 94 c0             	sete	%al
ffff8000001118af: 24 01                	andb	$1, %al
ffff8000001118b1: 0f b6 c0             	movzbl	%al, %eax
ffff8000001118b4: 89 45 cc             	movl	%eax, -52(%rbp)
; 		uncle = grandparent->child[dir];
ffff8000001118b7: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001118bb: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff8000001118be: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff8000001118c3: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		if (uncle && uncle->color == RB_RED) {
ffff8000001118c7: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff8000001118cc: 0f 84 3c 00 00 00    	je	0xffff80000011190e <rb_balance+0xee>
ffff8000001118d2: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001118d6: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff8000001118da: 0f 85 2e 00 00 00    	jne	0xffff80000011190e <rb_balance+0xee>
; 			parent->color = RB_BLACK;
ffff8000001118e0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001118e4: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			uncle->color = RB_BLACK;
ffff8000001118eb: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001118ef: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			grandparent->color = RB_RED;
ffff8000001118f6: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001118fa: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			node = grandparent;
ffff800000111901: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111905: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			continue;
ffff800000111909: e9 4f ff ff ff       	jmp	0xffff80000011185d <rb_balance+0x3d>
; 		if (parent->child[dir] == node) {
ffff80000011190e: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111912: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111915: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff80000011191a: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000011191e: 0f 85 35 00 00 00    	jne	0xffff800000111959 <rb_balance+0x139>
; 			rotate_node(tree, parent, !dir);
ffff800000111924: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111928: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff80000011192c: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111930: 0f 95 c0             	setne	%al
ffff800000111933: 34 ff                	xorb	$-1, %al
ffff800000111935: 24 01                	andb	$1, %al
ffff800000111937: 0f b6 d0             	movzbl	%al, %edx
ffff80000011193a: 48 b8 b0 19 11 00 00 80 ff ff	movabsq	$-140737487234640, %rax # imm = 0xFFFF8000001119B0
ffff800000111944: ff d0                	callq	*%rax
; 			node = parent;
ffff800000111946: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011194a: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			parent = node->parent;
ffff80000011194e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111952: 48 8b 00             	movq	(%rax), %rax
ffff800000111955: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		parent->color = RB_BLACK;
ffff800000111959: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011195d: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff800000111964: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111968: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 		rotate_node(tree, grandparent, dir);
ffff80000011196f: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111973: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000111977: 8b 55 cc             	movl	-52(%rbp), %edx
ffff80000011197a: 48 b8 b0 19 11 00 00 80 ff ff	movabsq	$-140737487234640, %rax # imm = 0xFFFF8000001119B0
ffff800000111984: ff d0                	callq	*%rax
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff800000111986: e9 d2 fe ff ff       	jmp	0xffff80000011185d <rb_balance+0x3d>
; 	tree->root->color = RB_BLACK;
ffff80000011198b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011198f: 48 8b 00             	movq	(%rax), %rax
ffff800000111992: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 	return 0;
ffff800000111999: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001119a0: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001119a3: 48 83 c4 40          	addq	$64, %rsp
ffff8000001119a7: 5d                   	popq	%rbp
ffff8000001119a8: c3                   	retq
ffff8000001119a9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001119b0 <rotate_node>:
; {
ffff8000001119b0: 55                   	pushq	%rbp
ffff8000001119b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001119b4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001119b8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001119bc: 89 55 ec             	movl	%edx, -20(%rbp)
; 	struct rb_node *parent = node->parent;
ffff8000001119bf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001119c3: 48 8b 00             	movq	(%rax), %rax
ffff8000001119c6: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct rb_node *child = node->child[!dir];
ffff8000001119ca: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001119ce: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001119d2: 0f 95 c1             	setne	%cl
ffff8000001119d5: 80 f1 ff             	xorb	$-1, %cl
ffff8000001119d8: 80 e1 01             	andb	$1, %cl
ffff8000001119db: 0f b6 c9             	movzbl	%cl, %ecx
ffff8000001119de: 48 63 c9             	movslq	%ecx, %rcx
ffff8000001119e1: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff8000001119e6: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if ((node->child[!dir] = child->child[dir])) {
ffff8000001119ea: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001119ee: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001119f1: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff8000001119f6: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001119fa: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff8000001119fe: 0f 95 c2             	setne	%dl
ffff800000111a01: 80 f2 ff             	xorb	$-1, %dl
ffff800000111a04: 80 e2 01             	andb	$1, %dl
ffff800000111a07: 0f b6 d2             	movzbl	%dl, %edx
ffff800000111a0a: 48 63 d2             	movslq	%edx, %rdx
ffff800000111a0d: 48 89 44 d1 08       	movq	%rax, 8(%rcx,%rdx,8)
ffff800000111a12: 48 83 f8 00          	cmpq	$0, %rax
ffff800000111a16: 0f 84 13 00 00 00    	je	0xffff800000111a2f <rotate_node+0x7f>
; 		child->child[dir]->parent = node;
ffff800000111a1c: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000111a20: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a24: 8b 55 ec             	movl	-20(%rbp), %edx
ffff800000111a27: 48 8b 44 d0 08       	movq	8(%rax,%rdx,8), %rax
ffff800000111a2c: 48 89 08             	movq	%rcx, (%rax)
; 	child->child[dir] = node;
ffff800000111a2f: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000111a33: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a37: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff800000111a3a: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	child->parent = parent;
ffff800000111a3f: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000111a43: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111a47: 48 89 08             	movq	%rcx, (%rax)
; 	if (parent) {
ffff800000111a4a: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111a4f: 0f 84 2a 00 00 00    	je	0xffff800000111a7f <rotate_node+0xcf>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff800000111a55: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000111a59: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111a5d: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000111a61: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff800000111a65: 48 3b 4d f0          	cmpq	-16(%rbp), %rcx
ffff800000111a69: 0f 94 c1             	sete	%cl
ffff800000111a6c: 80 e1 01             	andb	$1, %cl
ffff800000111a6f: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111a72: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111a75: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	} else {
ffff800000111a7a: e9 0b 00 00 00       	jmp	0xffff800000111a8a <rotate_node+0xda>
; 		tree->root = child;
ffff800000111a7f: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111a83: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000111a87: 48 89 08             	movq	%rcx, (%rax)
; 	node->parent = child;
ffff800000111a8a: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111a8e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111a92: 48 89 08             	movq	%rcx, (%rax)
; }
ffff800000111a95: 5d                   	popq	%rbp
ffff800000111a96: c3                   	retq
ffff800000111a97: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000111aa0 <rb_remove>:
; {
ffff800000111aa0: 55                   	pushq	%rbp
ffff800000111aa1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111aa4: 48 83 ec 40          	subq	$64, %rsp
ffff800000111aa8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111aac: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff800000111ab0: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111ab5: 0f 84 0b 00 00 00    	je	0xffff800000111ac6 <rb_remove+0x26>
ffff800000111abb: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111ac0: 0f 85 0c 00 00 00    	jne	0xffff800000111ad2 <rb_remove+0x32>
; 		return -1;
ffff800000111ac6: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000111acd: e9 07 03 00 00       	jmp	0xffff800000111dd9 <rb_remove+0x339>
; 	child_dir = !node->child[RB_LEFT];
ffff800000111ad2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ad6: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111adb: 0f 95 c0             	setne	%al
ffff800000111ade: 34 ff                	xorb	$-1, %al
ffff800000111ae0: 24 01                	andb	$1, %al
ffff800000111ae2: 0f b6 c0             	movzbl	%al, %eax
ffff800000111ae5: 89 45 c8             	movl	%eax, -56(%rbp)
; 	child = node->child[child_dir];
ffff800000111ae8: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111aec: 8b 4d c8             	movl	-56(%rbp), %ecx
ffff800000111aef: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111af4: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	other = node->child[!child_dir];
ffff800000111af8: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111afc: 83 7d c8 00          	cmpl	$0, -56(%rbp)
ffff800000111b00: 0f 95 c1             	setne	%cl
ffff800000111b03: 80 f1 ff             	xorb	$-1, %cl
ffff800000111b06: 80 e1 01             	andb	$1, %cl
ffff800000111b09: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111b0c: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111b0f: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111b14: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	do_remove(tree, node);
ffff800000111b18: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111b1c: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000111b20: 48 b8 f0 1d 11 00 00 80 ff ff	movabsq	$-140737487233552, %rax # imm = 0xFFFF800000111DF0
ffff800000111b2a: ff d0                	callq	*%rax
; 	if (!child && !other)
ffff800000111b2c: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff800000111b31: 0f 85 17 00 00 00    	jne	0xffff800000111b4e <rb_remove+0xae>
ffff800000111b37: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000111b3c: 0f 85 0c 00 00 00    	jne	0xffff800000111b4e <rb_remove+0xae>
; 		return 0;
ffff800000111b42: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111b49: e9 8b 02 00 00       	jmp	0xffff800000111dd9 <rb_remove+0x339>
; 	if (node->color == RB_RED)
ffff800000111b4e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111b52: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111b56: 0f 85 0c 00 00 00    	jne	0xffff800000111b68 <rb_remove+0xc8>
; 		return 0;
ffff800000111b5c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111b63: e9 71 02 00 00       	jmp	0xffff800000111dd9 <rb_remove+0x339>
; 	node = child;
ffff800000111b68: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111b6c: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	if (node->color == RB_RED) {
ffff800000111b70: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111b74: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111b78: 0f 85 17 00 00 00    	jne	0xffff800000111b95 <rb_remove+0xf5>
; 		node->color = RB_BLACK;
ffff800000111b7e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111b82: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		return 0;
ffff800000111b89: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000111b90: e9 44 02 00 00       	jmp	0xffff800000111dd9 <rb_remove+0x339>
; 	while (node->parent) {
ffff800000111b95: e9 00 00 00 00       	jmp	0xffff800000111b9a <rb_remove+0xfa>
ffff800000111b9a: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111b9e: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000111ba2: 0f 84 14 02 00 00    	je	0xffff800000111dbc <rb_remove+0x31c>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff800000111ba8: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111bac: 48 8b 00             	movq	(%rax), %rax
ffff800000111baf: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111bb3: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000111bb7: 0f 94 c0             	sete	%al
ffff800000111bba: 24 01                	andb	$1, %al
ffff800000111bbc: 0f b6 c0             	movzbl	%al, %eax
ffff800000111bbf: 89 45 cc             	movl	%eax, -52(%rbp)
; 		sibling = node->parent->child[dir];
ffff800000111bc2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111bc6: 48 8b 00             	movq	(%rax), %rax
ffff800000111bc9: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111bcc: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111bd1: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if (!sibling) {
ffff800000111bd5: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111bda: 0f 85 05 00 00 00    	jne	0xffff800000111be5 <rb_remove+0x145>
; 			break;
ffff800000111be0: e9 d7 01 00 00       	jmp	0xffff800000111dbc <rb_remove+0x31c>
; 		if (sibling->color == RB_RED) {
ffff800000111be5: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111be9: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff800000111bed: 0f 85 51 00 00 00    	jne	0xffff800000111c44 <rb_remove+0x1a4>
; 			node->parent->color = RB_RED;
ffff800000111bf3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111bf7: 48 8b 00             	movq	(%rax), %rax
ffff800000111bfa: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->color = RB_BLACK;
ffff800000111c01: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111c05: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff800000111c0c: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111c10: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111c14: 48 8b 30             	movq	(%rax), %rsi
ffff800000111c17: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111c1b: 0f 95 c0             	setne	%al
ffff800000111c1e: 34 ff                	xorb	$-1, %al
ffff800000111c20: 24 01                	andb	$1, %al
ffff800000111c22: 0f b6 d0             	movzbl	%al, %edx
ffff800000111c25: 48 b8 b0 19 11 00 00 80 ff ff	movabsq	$-140737487234640, %rax # imm = 0xFFFF8000001119B0
ffff800000111c2f: ff d0                	callq	*%rax
; 			sibling = node->parent->child[dir];
ffff800000111c31: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111c35: 48 8b 00             	movq	(%rax), %rax
ffff800000111c38: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111c3b: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111c40: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff800000111c44: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111c48: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111c4c: 0f 95 c1             	setne	%cl
ffff800000111c4f: 80 f1 ff             	xorb	$-1, %cl
ffff800000111c52: 80 e1 01             	andb	$1, %cl
ffff800000111c55: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111c58: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111c5b: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111c61: 0f 84 26 00 00 00    	je	0xffff800000111c8d <rb_remove+0x1ed>
ffff800000111c67: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111c6b: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111c6f: 0f 95 c1             	setne	%cl
ffff800000111c72: 80 f1 ff             	xorb	$-1, %cl
ffff800000111c75: 80 e1 01             	andb	$1, %cl
ffff800000111c78: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111c7b: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111c7e: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111c83: 83 78 18 00          	cmpl	$0, 24(%rax)
; 		    RB_BLACK) &&
ffff800000111c87: 0f 85 44 00 00 00    	jne	0xffff800000111cd1 <rb_remove+0x231>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff800000111c8d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111c91: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111c94: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111c9a: 0f 84 16 00 00 00    	je	0xffff800000111cb6 <rb_remove+0x216>
ffff800000111ca0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111ca4: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111ca7: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111cac: 83 78 18 00          	cmpl	$0, 24(%rax)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff800000111cb0: 0f 85 1b 00 00 00    	jne	0xffff800000111cd1 <rb_remove+0x231>
; 			sibling->color = RB_RED;
ffff800000111cb6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111cba: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			node = node->parent;
ffff800000111cc1: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111cc5: 48 8b 00             	movq	(%rax), %rax
ffff800000111cc8: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			continue;
ffff800000111ccc: e9 c9 fe ff ff       	jmp	0xffff800000111b9a <rb_remove+0xfa>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff800000111cd1: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111cd5: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111cd8: 48 83 7c c8 08 00    	cmpq	$0, 8(%rax,%rcx,8)
ffff800000111cde: 0f 84 16 00 00 00    	je	0xffff800000111cfa <rb_remove+0x25a>
ffff800000111ce4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111ce8: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111ceb: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111cf0: 83 78 18 00          	cmpl	$0, 24(%rax)
ffff800000111cf4: 0f 85 5b 00 00 00    	jne	0xffff800000111d55 <rb_remove+0x2b5>
; 			sibling->color = RB_RED;
ffff800000111cfa: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111cfe: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff800000111d05: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111d09: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111d0d: 0f 95 c1             	setne	%cl
ffff800000111d10: 80 f1 ff             	xorb	$-1, %cl
ffff800000111d13: 80 e1 01             	andb	$1, %cl
ffff800000111d16: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111d19: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111d1c: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111d21: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, dir);
ffff800000111d28: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111d2c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d30: 48 8b 30             	movq	(%rax), %rsi
ffff800000111d33: 8b 55 cc             	movl	-52(%rbp), %edx
ffff800000111d36: 48 b8 b0 19 11 00 00 80 ff ff	movabsq	$-140737487234640, %rax # imm = 0xFFFF8000001119B0
ffff800000111d40: ff d0                	callq	*%rax
; 			sibling = node->parent->child[dir];
ffff800000111d42: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d46: 48 8b 00             	movq	(%rax), %rax
ffff800000111d49: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111d4c: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111d51: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		sibling->color = node->parent->color;
ffff800000111d55: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d59: 48 8b 00             	movq	(%rax), %rax
ffff800000111d5c: 8b 48 18             	movl	24(%rax), %ecx
ffff800000111d5f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111d63: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff800000111d66: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d6a: 48 8b 00             	movq	(%rax), %rax
ffff800000111d6d: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		sibling->child[dir]->color = RB_BLACK;
ffff800000111d74: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111d78: 8b 4d cc             	movl	-52(%rbp), %ecx
ffff800000111d7b: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111d80: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff800000111d87: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111d8b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111d8f: 48 8b 30             	movq	(%rax), %rsi
ffff800000111d92: 83 7d cc 00          	cmpl	$0, -52(%rbp)
ffff800000111d96: 0f 95 c0             	setne	%al
ffff800000111d99: 34 ff                	xorb	$-1, %al
ffff800000111d9b: 24 01                	andb	$1, %al
ffff800000111d9d: 0f b6 d0             	movzbl	%al, %edx
ffff800000111da0: 48 b8 b0 19 11 00 00 80 ff ff	movabsq	$-140737487234640, %rax # imm = 0xFFFF8000001119B0
ffff800000111daa: ff d0                	callq	*%rax
; 		node = tree->root;
ffff800000111dac: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111db0: 48 8b 00             	movq	(%rax), %rax
ffff800000111db3: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while (node->parent) {
ffff800000111db7: e9 de fd ff ff       	jmp	0xffff800000111b9a <rb_remove+0xfa>
; 	if (node)
ffff800000111dbc: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111dc1: 0f 84 0b 00 00 00    	je	0xffff800000111dd2 <rb_remove+0x332>
; 		node->color = RB_BLACK;
ffff800000111dc7: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111dcb: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 	return 0;
ffff800000111dd2: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000111dd9: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000111ddc: 48 83 c4 40          	addq	$64, %rsp
ffff800000111de0: 5d                   	popq	%rbp
ffff800000111de1: c3                   	retq
ffff800000111de2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111dec: 0f 1f 40 00          	nopl	(%rax)

ffff800000111df0 <do_remove>:
; {
ffff800000111df0: 55                   	pushq	%rbp
ffff800000111df1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111df4: 48 83 ec 30          	subq	$48, %rsp
ffff800000111df8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111dfc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (!tree || !node)
ffff800000111e00: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000111e05: 0f 84 0b 00 00 00    	je	0xffff800000111e16 <do_remove+0x26>
ffff800000111e0b: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111e10: 0f 85 0c 00 00 00    	jne	0xffff800000111e22 <do_remove+0x32>
; 		return -1;
ffff800000111e16: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000111e1d: e9 61 01 00 00       	jmp	0xffff800000111f83 <do_remove+0x193>
; 	parent = node->parent;
ffff800000111e22: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e26: 48 8b 00             	movq	(%rax), %rax
ffff800000111e29: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff800000111e2d: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e31: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111e36: 0f 84 a9 00 00 00    	je	0xffff800000111ee5 <do_remove+0xf5>
ffff800000111e3c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e40: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000111e45: 0f 84 9a 00 00 00    	je	0xffff800000111ee5 <do_remove+0xf5>
; 		child = node->child[RB_LEFT];
ffff800000111e4b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e4f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111e53: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		child = get_outermost(child, RB_RIGHT);
ffff800000111e57: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000111e5b: 48 b8 60 16 11 00 00 80 ff ff	movabsq	$-140737487235488, %rax # imm = 0xFFFF800000111660
ffff800000111e65: be 01 00 00 00       	movl	$1, %esi
ffff800000111e6a: ff d0                	callq	*%rax
ffff800000111e6c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		do_remove(tree, child);
ffff800000111e70: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000111e74: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000111e78: 48 b8 f0 1d 11 00 00 80 ff ff	movabsq	$-140737487233552, %rax # imm = 0xFFFF800000111DF0
ffff800000111e82: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff800000111e84: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e88: 48 8b 48 08          	movq	8(%rax), %rcx
ffff800000111e8c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111e90: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		if (node->child[RB_LEFT])
ffff800000111e94: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111e98: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111e9d: 0f 84 0f 00 00 00    	je	0xffff800000111eb2 <do_remove+0xc2>
; 			node->child[RB_LEFT]->parent = child;
ffff800000111ea3: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111ea7: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111eab: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000111eaf: 48 89 08             	movq	%rcx, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff800000111eb2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111eb6: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000111eba: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111ebe: 48 89 48 10          	movq	%rcx, 16(%rax)
; 		if (node->child[RB_RIGHT])
ffff800000111ec2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ec6: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000111ecb: 0f 84 0f 00 00 00    	je	0xffff800000111ee0 <do_remove+0xf0>
; 			node->child[RB_RIGHT]->parent = child;
ffff800000111ed1: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111ed5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ed9: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000111edd: 48 89 08             	movq	%rcx, (%rax)
; 	} else {
ffff800000111ee0: e9 26 00 00 00       	jmp	0xffff800000111f0b <do_remove+0x11b>
; 		child_dir = !node->child[RB_LEFT];
ffff800000111ee5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111ee9: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000111eee: 0f 95 c0             	setne	%al
ffff800000111ef1: 34 ff                	xorb	$-1, %al
ffff800000111ef3: 24 01                	andb	$1, %al
ffff800000111ef5: 0f b6 c0             	movzbl	%al, %eax
ffff800000111ef8: 89 45 d0             	movl	%eax, -48(%rbp)
; 		child = node->child[child_dir];
ffff800000111efb: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111eff: 8b 4d d0             	movl	-48(%rbp), %ecx
ffff800000111f02: 48 8b 44 c8 08       	movq	8(%rax,%rcx,8), %rax
ffff800000111f07: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (parent) {
ffff800000111f0b: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111f10: 0f 84 2c 00 00 00    	je	0xffff800000111f42 <do_remove+0x152>
; 		dir = parent->child[RB_RIGHT] == node;
ffff800000111f16: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111f1a: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000111f1e: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000111f22: 0f 94 c0             	sete	%al
ffff800000111f25: 24 01                	andb	$1, %al
ffff800000111f27: 0f b6 c0             	movzbl	%al, %eax
ffff800000111f2a: 89 45 d4             	movl	%eax, -44(%rbp)
; 		parent->child[dir] = child;
ffff800000111f2d: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000111f31: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000111f35: 8b 4d d4             	movl	-44(%rbp), %ecx
ffff800000111f38: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
; 	} else {
ffff800000111f3d: e9 0b 00 00 00       	jmp	0xffff800000111f4d <do_remove+0x15d>
; 		tree->root = child;
ffff800000111f42: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000111f46: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000111f4a: 48 89 08             	movq	%rcx, (%rax)
; 	if (child)
ffff800000111f4d: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff800000111f52: 0f 84 0b 00 00 00    	je	0xffff800000111f63 <do_remove+0x173>
; 		child->parent = parent;
ffff800000111f58: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000111f5c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000111f60: 48 89 08             	movq	%rcx, (%rax)
; 	memset(node, 0, sizeof *node);
ffff800000111f63: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000111f67: 31 c0                	xorl	%eax, %eax
ffff800000111f69: 48 b8 70 26 11 00 00 80 ff ff	movabsq	$-140737487231376, %rax # imm = 0xFFFF800000112670
ffff800000111f73: 31 f6                	xorl	%esi, %esi
ffff800000111f75: ba 20 00 00 00       	movl	$32, %edx
ffff800000111f7a: ff d0                	callq	*%rax
; 	return 0;
ffff800000111f7c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000111f83: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000111f86: 48 83 c4 30          	addq	$48, %rsp
ffff800000111f8a: 5d                   	popq	%rbp
ffff800000111f8b: c3                   	retq
ffff800000111f8c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111f90 <rb_replace>:
; {
ffff800000111f90: 55                   	pushq	%rbp
ffff800000111f91: 48 89 e5             	movq	%rsp, %rbp
ffff800000111f94: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000111f98: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000111f9c: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	if (!node || !new_node)
ffff800000111fa0: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000111fa5: 0f 84 0b 00 00 00    	je	0xffff800000111fb6 <rb_replace+0x26>
ffff800000111fab: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000111fb0: 0f 85 0c 00 00 00    	jne	0xffff800000111fc2 <rb_replace+0x32>
; 		return -1;
ffff800000111fb6: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000111fbd: e9 b2 00 00 00       	jmp	0xffff800000112074 <rb_replace+0xe4>
; 	if (node->parent)
ffff800000111fc2: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fc6: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000111fca: 0f 84 30 00 00 00    	je	0xffff800000112000 <rb_replace+0x70>
; 			new_node;
ffff800000111fd0: 48 8b 55 e0          	movq	-32(%rbp), %rdx
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff800000111fd4: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000111fd8: 48 8b 00             	movq	(%rax), %rax
ffff800000111fdb: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000111fdf: 48 8b 09             	movq	(%rcx), %rcx
ffff800000111fe2: 48 8b 49 10          	movq	16(%rcx), %rcx
ffff800000111fe6: 48 3b 4d e8          	cmpq	-24(%rbp), %rcx
ffff800000111fea: 0f 94 c1             	sete	%cl
ffff800000111fed: 80 e1 01             	andb	$1, %cl
ffff800000111ff0: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000111ff3: 48 63 c9             	movslq	%ecx, %rcx
ffff800000111ff6: 48 89 54 c8 08       	movq	%rdx, 8(%rax,%rcx,8)
ffff800000111ffb: e9 0b 00 00 00       	jmp	0xffff80000011200b <rb_replace+0x7b>
; 		tree->root = new_node;
ffff800000112000: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112004: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112008: 48 89 08             	movq	%rcx, (%rax)
; 	if (node->child[RB_LEFT])
ffff80000011200b: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011200f: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000112014: 0f 84 0f 00 00 00    	je	0xffff800000112029 <rb_replace+0x99>
; 		node->child[RB_LEFT]->parent = new_node;
ffff80000011201a: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000011201e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112022: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000112026: 48 89 08             	movq	%rcx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff800000112029: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011202d: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000112032: 0f 84 0f 00 00 00    	je	0xffff800000112047 <rb_replace+0xb7>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff800000112038: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff80000011203c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112040: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000112044: 48 89 08             	movq	%rcx, (%rax)
; 	*new_node = *node;
ffff800000112047: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011204b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011204f: 48 8b 11             	movq	(%rcx), %rdx
ffff800000112052: 48 89 10             	movq	%rdx, (%rax)
ffff800000112055: 48 8b 51 08          	movq	8(%rcx), %rdx
ffff800000112059: 48 89 50 08          	movq	%rdx, 8(%rax)
ffff80000011205d: 48 8b 51 10          	movq	16(%rcx), %rdx
ffff800000112061: 48 89 50 10          	movq	%rdx, 16(%rax)
ffff800000112065: 48 8b 49 18          	movq	24(%rcx), %rcx
ffff800000112069: 48 89 48 18          	movq	%rcx, 24(%rax)
; 	return 0;
ffff80000011206d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112074: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112077: 5d                   	popq	%rbp
ffff800000112078: c3                   	retq
ffff800000112079: cc                   	int3
ffff80000011207a: cc                   	int3
ffff80000011207b: cc                   	int3
ffff80000011207c: cc                   	int3
ffff80000011207d: cc                   	int3
ffff80000011207e: cc                   	int3
ffff80000011207f: cc                   	int3

ffff800000112080 <readline>:
; {
ffff800000112080: 55                   	pushq	%rbp
ffff800000112081: 48 89 e5             	movq	%rsp, %rbp
ffff800000112084: 48 83 ec 20          	subq	$32, %rsp
ffff800000112088: 48 89 7d f0          	movq	%rdi, -16(%rbp)
; 	if (prompt != NULL)
ffff80000011208c: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000112091: 0f 84 1c 00 00 00    	je	0xffff8000001120b3 <readline+0x33>
; 		cprintf("%s", prompt);
ffff800000112097: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011209b: 48 bf 3b 88 11 00 00 80 ff ff	movabsq	$-140737487206341, %rdi # imm = 0xFFFF80000011883B
ffff8000001120a5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001120af: 31 c0                	xorl	%eax, %eax
ffff8000001120b1: ff d1                	callq	*%rcx
; 	i = 0;
ffff8000001120b3: c7 45 ec 00 00 00 00 	movl	$0, -20(%rbp)
; 	echoing = iscons(0);
ffff8000001120ba: 31 c0                	xorl	%eax, %eax
ffff8000001120bc: 48 b8 40 c7 10 00 00 80 ff ff	movabsq	$-140737487255744, %rax # imm = 0xFFFF80000010C740
ffff8000001120c6: 31 ff                	xorl	%edi, %edi
ffff8000001120c8: ff d0                	callq	*%rax
ffff8000001120ca: 89 45 e4             	movl	%eax, -28(%rbp)
; 		c = getchar();
ffff8000001120cd: 48 b8 10 c7 10 00 00 80 ff ff	movabsq	$-140737487255792, %rax # imm = 0xFFFF80000010C710
ffff8000001120d7: ff d0                	callq	*%rax
ffff8000001120d9: 89 45 e8             	movl	%eax, -24(%rbp)
; 		if (c < 0) {
ffff8000001120dc: 83 7d e8 00          	cmpl	$0, -24(%rbp)
ffff8000001120e0: 0f 8d 28 00 00 00    	jge	0xffff80000011210e <readline+0x8e>
; 			cprintf("read error: %e\n", c);
ffff8000001120e6: 8b 75 e8             	movl	-24(%rbp), %esi
ffff8000001120e9: 48 bf 1f 8d 11 00 00 80 ff ff	movabsq	$-140737487205089, %rdi # imm = 0xFFFF800000118D1F
ffff8000001120f3: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001120fd: 31 c0                	xorl	%eax, %eax
ffff8000001120ff: ff d1                	callq	*%rcx
; 			return NULL;
ffff800000112101: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000112109: e9 f8 00 00 00       	jmp	0xffff800000112206 <readline+0x186>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000011210e: 83 7d e8 08          	cmpl	$8, -24(%rbp)
ffff800000112112: 0f 84 0a 00 00 00    	je	0xffff800000112122 <readline+0xa2>
ffff800000112118: 83 7d e8 7f          	cmpl	$127, -24(%rbp)
ffff80000011211c: 0f 85 33 00 00 00    	jne	0xffff800000112155 <readline+0xd5>
ffff800000112122: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112126: 0f 8e 29 00 00 00    	jle	0xffff800000112155 <readline+0xd5>
; 			if (echoing)
ffff80000011212c: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff800000112130: 0f 84 11 00 00 00    	je	0xffff800000112147 <readline+0xc7>
; 				cputchar('\b');
ffff800000112136: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff800000112140: bf 08 00 00 00       	movl	$8, %edi
ffff800000112145: ff d0                	callq	*%rax
; 			i--;
ffff800000112147: 8b 45 ec             	movl	-20(%rbp), %eax
ffff80000011214a: 83 c0 ff             	addl	$-1, %eax
ffff80000011214d: 89 45 ec             	movl	%eax, -20(%rbp)
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff800000112150: e9 a7 00 00 00       	jmp	0xffff8000001121fc <readline+0x17c>
ffff800000112155: 83 7d e8 20          	cmpl	$32, -24(%rbp)
ffff800000112159: 0f 8c 49 00 00 00    	jl	0xffff8000001121a8 <readline+0x128>
ffff80000011215f: 81 7d ec ff 03 00 00 	cmpl	$1023, -20(%rbp)        # imm = 0x3FF
ffff800000112166: 0f 8d 3c 00 00 00    	jge	0xffff8000001121a8 <readline+0x128>
; 			if (echoing)
ffff80000011216c: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff800000112170: 0f 84 0f 00 00 00    	je	0xffff800000112185 <readline+0x105>
; 				cputchar(c);
ffff800000112176: 8b 7d e8             	movl	-24(%rbp), %edi
ffff800000112179: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff800000112183: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff800000112185: 8a 4d e8             	movb	-24(%rbp), %cl
ffff800000112188: 48 63 45 ec          	movslq	-20(%rbp), %rax
ffff80000011218c: 89 c2                	movl	%eax, %edx
ffff80000011218e: 83 c2 01             	addl	$1, %edx
ffff800000112191: 89 55 ec             	movl	%edx, -20(%rbp)
ffff800000112194: 48 ba 00 d3 11 00 00 80 ff ff	movabsq	$-140737487187200, %rdx # imm = 0xFFFF80000011D300
ffff80000011219e: 48 01 d0             	addq	%rdx, %rax
ffff8000001121a1: 88 08                	movb	%cl, (%rax)
; 		} else if (c == '\n' || c == '\r') {
ffff8000001121a3: e9 4f 00 00 00       	jmp	0xffff8000001121f7 <readline+0x177>
ffff8000001121a8: 83 7d e8 0a          	cmpl	$10, -24(%rbp)
ffff8000001121ac: 0f 84 0a 00 00 00    	je	0xffff8000001121bc <readline+0x13c>
ffff8000001121b2: 83 7d e8 0d          	cmpl	$13, -24(%rbp)
ffff8000001121b6: 0f 85 36 00 00 00    	jne	0xffff8000001121f2 <readline+0x172>
; 			if (echoing)
ffff8000001121bc: 83 7d e4 00          	cmpl	$0, -28(%rbp)
ffff8000001121c0: 0f 84 11 00 00 00    	je	0xffff8000001121d7 <readline+0x157>
; 				cputchar('\n');
ffff8000001121c6: 48 b8 b0 c6 10 00 00 80 ff ff	movabsq	$-140737487255888, %rax # imm = 0xFFFF80000010C6B0
ffff8000001121d0: bf 0a 00 00 00       	movl	$10, %edi
ffff8000001121d5: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff8000001121d7: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff8000001121db: 48 b8 00 d3 11 00 00 80 ff ff	movabsq	$-140737487187200, %rax # imm = 0xFFFF80000011D300
ffff8000001121e5: c6 04 01 00          	movb	$0, (%rcx,%rax)
; 			return buf;
ffff8000001121e9: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001121ed: e9 14 00 00 00       	jmp	0xffff800000112206 <readline+0x186>
ffff8000001121f2: e9 00 00 00 00       	jmp	0xffff8000001121f7 <readline+0x177>
ffff8000001121f7: e9 00 00 00 00       	jmp	0xffff8000001121fc <readline+0x17c>
ffff8000001121fc: e9 00 00 00 00       	jmp	0xffff800000112201 <readline+0x181>
; 	while (1) {
ffff800000112201: e9 c7 fe ff ff       	jmp	0xffff8000001120cd <readline+0x4d>
; }
ffff800000112206: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011220a: 48 83 c4 20          	addq	$32, %rsp
ffff80000011220e: 5d                   	popq	%rbp
ffff80000011220f: c3                   	retq

ffff800000112210 <strlen>:
; {
ffff800000112210: 55                   	pushq	%rbp
ffff800000112211: 48 89 e5             	movq	%rsp, %rbp
ffff800000112214: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	for (n = 0; *s != '\0'; s++)
ffff800000112218: c7 45 f4 00 00 00 00 	movl	$0, -12(%rbp)
ffff80000011221f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112223: 0f be 00             	movsbl	(%rax), %eax
ffff800000112226: 83 f8 00             	cmpl	$0, %eax
ffff800000112229: 0f 84 1a 00 00 00    	je	0xffff800000112249 <strlen+0x39>
; 		n++;
ffff80000011222f: 8b 45 f4             	movl	-12(%rbp), %eax
ffff800000112232: 83 c0 01             	addl	$1, %eax
ffff800000112235: 89 45 f4             	movl	%eax, -12(%rbp)
; 	for (n = 0; *s != '\0'; s++)
ffff800000112238: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011223c: 48 83 c0 01          	addq	$1, %rax
ffff800000112240: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112244: e9 d6 ff ff ff       	jmp	0xffff80000011221f <strlen+0xf>
; 	return n;
ffff800000112249: 8b 45 f4             	movl	-12(%rbp), %eax
ffff80000011224c: 5d                   	popq	%rbp
ffff80000011224d: c3                   	retq
ffff80000011224e: 66 90                	nop

ffff800000112250 <strnlen>:
; {
ffff800000112250: 55                   	pushq	%rbp
ffff800000112251: 48 89 e5             	movq	%rsp, %rbp
ffff800000112254: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112258: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000011225c: c7 45 ec 00 00 00 00 	movl	$0, -20(%rbp)
ffff800000112263: 31 c0                	xorl	%eax, %eax
ffff800000112265: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011226a: 88 45 eb             	movb	%al, -21(%rbp)
ffff80000011226d: 0f 86 10 00 00 00    	jbe	0xffff800000112283 <strnlen+0x33>
ffff800000112273: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112277: 0f be 00             	movsbl	(%rax), %eax
ffff80000011227a: 83 f8 00             	cmpl	$0, %eax
ffff80000011227d: 0f 95 c0             	setne	%al
ffff800000112280: 88 45 eb             	movb	%al, -21(%rbp)
ffff800000112283: 8a 45 eb             	movb	-21(%rbp), %al
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff800000112286: a8 01                	testb	$1, %al
ffff800000112288: 0f 85 05 00 00 00    	jne	0xffff800000112293 <strnlen+0x43>
ffff80000011228e: e9 26 00 00 00       	jmp	0xffff8000001122b9 <strnlen+0x69>
; 		n++;
ffff800000112293: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112296: 83 c0 01             	addl	$1, %eax
ffff800000112299: 89 45 ec             	movl	%eax, -20(%rbp)
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000011229c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001122a0: 48 83 c0 01          	addq	$1, %rax
ffff8000001122a4: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001122a8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001122ac: 48 83 c0 ff          	addq	$-1, %rax
ffff8000001122b0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff8000001122b4: e9 aa ff ff ff       	jmp	0xffff800000112263 <strnlen+0x13>
; 	return n;
ffff8000001122b9: 8b 45 ec             	movl	-20(%rbp), %eax
ffff8000001122bc: 5d                   	popq	%rbp
ffff8000001122bd: c3                   	retq
ffff8000001122be: 66 90                	nop

ffff8000001122c0 <strcpy>:
; {
ffff8000001122c0: 55                   	pushq	%rbp
ffff8000001122c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001122c4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001122c8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	ret = dst;
ffff8000001122cc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001122d0: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while ((*dst++ = *src++) != '\0')
ffff8000001122d4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001122d8: 48 89 c1             	movq	%rax, %rcx
ffff8000001122db: 48 83 c1 01          	addq	$1, %rcx
ffff8000001122df: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff8000001122e3: 8a 00                	movb	(%rax), %al
ffff8000001122e5: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001122e9: 48 89 ca             	movq	%rcx, %rdx
ffff8000001122ec: 48 83 c2 01          	addq	$1, %rdx
ffff8000001122f0: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff8000001122f4: 88 01                	movb	%al, (%rcx)
ffff8000001122f6: 0f be c0             	movsbl	%al, %eax
ffff8000001122f9: 83 f8 00             	cmpl	$0, %eax
ffff8000001122fc: 0f 84 05 00 00 00    	je	0xffff800000112307 <strcpy+0x47>
ffff800000112302: e9 cd ff ff ff       	jmp	0xffff8000001122d4 <strcpy+0x14>
; 	return ret;
ffff800000112307: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011230b: 5d                   	popq	%rbp
ffff80000011230c: c3                   	retq
ffff80000011230d: 0f 1f 00             	nopl	(%rax)

ffff800000112310 <strcat>:
; {
ffff800000112310: 55                   	pushq	%rbp
ffff800000112311: 48 89 e5             	movq	%rsp, %rbp
ffff800000112314: 48 83 ec 20          	subq	$32, %rsp
ffff800000112318: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011231c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	int len = strlen(dst);
ffff800000112320: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000112324: 48 b8 10 22 11 00 00 80 ff ff	movabsq	$-140737487232496, %rax # imm = 0xFFFF800000112210
ffff80000011232e: ff d0                	callq	*%rax
ffff800000112330: 89 45 ec             	movl	%eax, -20(%rbp)
; 	strcpy(dst + len, src);
ffff800000112333: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000112337: 48 63 45 ec          	movslq	-20(%rbp), %rax
ffff80000011233b: 48 01 c7             	addq	%rax, %rdi
ffff80000011233e: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000112342: 48 b8 c0 22 11 00 00 80 ff ff	movabsq	$-140737487232320, %rax # imm = 0xFFFF8000001122C0
ffff80000011234c: ff d0                	callq	*%rax
; 	return dst;
ffff80000011234e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112352: 48 83 c4 20          	addq	$32, %rsp
ffff800000112356: 5d                   	popq	%rbp
ffff800000112357: c3                   	retq
ffff800000112358: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112360 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff800000112360: 55                   	pushq	%rbp
ffff800000112361: 48 89 e5             	movq	%rsp, %rbp
ffff800000112364: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112368: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011236c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	ret = dst;
ffff800000112370: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112374: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < size; i++) {
ffff800000112378: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000112380: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112384: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000112388: 0f 83 49 00 00 00    	jae	0xffff8000001123d7 <strncpy+0x77>
; 		*dst++ = *src;
ffff80000011238e: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112392: 8a 08                	movb	(%rax), %cl
ffff800000112394: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112398: 48 89 c2             	movq	%rax, %rdx
ffff80000011239b: 48 83 c2 01          	addq	$1, %rdx
ffff80000011239f: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff8000001123a3: 88 08                	movb	%cl, (%rax)
; 		if (*src != '\0')
ffff8000001123a5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001123a9: 0f be 00             	movsbl	(%rax), %eax
ffff8000001123ac: 83 f8 00             	cmpl	$0, %eax
ffff8000001123af: 0f 84 0c 00 00 00    	je	0xffff8000001123c1 <strncpy+0x61>
; 			src++;
ffff8000001123b5: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001123b9: 48 83 c0 01          	addq	$1, %rax
ffff8000001123bd: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	}
ffff8000001123c1: e9 00 00 00 00       	jmp	0xffff8000001123c6 <strncpy+0x66>
; 	for (i = 0; i < size; i++) {
ffff8000001123c6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001123ca: 48 83 c0 01          	addq	$1, %rax
ffff8000001123ce: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001123d2: e9 a9 ff ff ff       	jmp	0xffff800000112380 <strncpy+0x20>
; 	return ret;
ffff8000001123d7: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001123db: 5d                   	popq	%rbp
ffff8000001123dc: c3                   	retq
ffff8000001123dd: 0f 1f 00             	nopl	(%rax)

ffff8000001123e0 <strlcpy>:
; {
ffff8000001123e0: 55                   	pushq	%rbp
ffff8000001123e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001123e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001123e8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001123ec: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	dst_in = dst;
ffff8000001123f0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001123f4: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (size > 0) {
ffff8000001123f8: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff8000001123fd: 0f 86 6e 00 00 00    	jbe	0xffff800000112471 <strlcpy+0x91>
; 		while (--size > 0 && *src != '\0')
ffff800000112403: e9 00 00 00 00       	jmp	0xffff800000112408 <strlcpy+0x28>
ffff800000112408: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011240c: 48 83 c1 ff          	addq	$-1, %rcx
ffff800000112410: 48 89 4d e8          	movq	%rcx, -24(%rbp)
ffff800000112414: 31 c0                	xorl	%eax, %eax
ffff800000112416: 48 83 f9 00          	cmpq	$0, %rcx
ffff80000011241a: 88 45 df             	movb	%al, -33(%rbp)
ffff80000011241d: 0f 86 10 00 00 00    	jbe	0xffff800000112433 <strlcpy+0x53>
ffff800000112423: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112427: 0f be 00             	movsbl	(%rax), %eax
ffff80000011242a: 83 f8 00             	cmpl	$0, %eax
ffff80000011242d: 0f 95 c0             	setne	%al
ffff800000112430: 88 45 df             	movb	%al, -33(%rbp)
ffff800000112433: 8a 45 df             	movb	-33(%rbp), %al
; 		while (--size > 0 && *src != '\0')
ffff800000112436: a8 01                	testb	$1, %al
ffff800000112438: 0f 85 05 00 00 00    	jne	0xffff800000112443 <strlcpy+0x63>
ffff80000011243e: e9 27 00 00 00       	jmp	0xffff80000011246a <strlcpy+0x8a>
; 			*dst++ = *src++;
ffff800000112443: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112447: 48 89 c1             	movq	%rax, %rcx
ffff80000011244a: 48 83 c1 01          	addq	$1, %rcx
ffff80000011244e: 48 89 4d f0          	movq	%rcx, -16(%rbp)
ffff800000112452: 8a 08                	movb	(%rax), %cl
ffff800000112454: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112458: 48 89 c2             	movq	%rax, %rdx
ffff80000011245b: 48 83 c2 01          	addq	$1, %rdx
ffff80000011245f: 48 89 55 f8          	movq	%rdx, -8(%rbp)
ffff800000112463: 88 08                	movb	%cl, (%rax)
; 		while (--size > 0 && *src != '\0')
ffff800000112465: e9 9e ff ff ff       	jmp	0xffff800000112408 <strlcpy+0x28>
; 		*dst = '\0';
ffff80000011246a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011246e: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff800000112471: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112475: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112479: 48 29 c8             	subq	%rcx, %rax
ffff80000011247c: 5d                   	popq	%rbp
ffff80000011247d: c3                   	retq
ffff80000011247e: 66 90                	nop

ffff800000112480 <strcmp>:
; {
ffff800000112480: 55                   	pushq	%rbp
ffff800000112481: 48 89 e5             	movq	%rsp, %rbp
ffff800000112484: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112488: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	while (*p && *p == *q)
ffff80000011248c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112490: 0f be 08             	movsbl	(%rax), %ecx
ffff800000112493: 31 c0                	xorl	%eax, %eax
ffff800000112495: 83 f9 00             	cmpl	$0, %ecx
ffff800000112498: 88 45 ef             	movb	%al, -17(%rbp)
ffff80000011249b: 0f 84 16 00 00 00    	je	0xffff8000001124b7 <strcmp+0x37>
ffff8000001124a1: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001124a5: 0f be 00             	movsbl	(%rax), %eax
ffff8000001124a8: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001124ac: 0f be 09             	movsbl	(%rcx), %ecx
ffff8000001124af: 39 c8                	cmpl	%ecx, %eax
ffff8000001124b1: 0f 94 c0             	sete	%al
ffff8000001124b4: 88 45 ef             	movb	%al, -17(%rbp)
ffff8000001124b7: 8a 45 ef             	movb	-17(%rbp), %al
; 	while (*p && *p == *q)
ffff8000001124ba: a8 01                	testb	$1, %al
ffff8000001124bc: 0f 85 05 00 00 00    	jne	0xffff8000001124c7 <strcmp+0x47>
ffff8000001124c2: e9 1d 00 00 00       	jmp	0xffff8000001124e4 <strcmp+0x64>
; 		p++, q++;
ffff8000001124c7: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001124cb: 48 83 c0 01          	addq	$1, %rax
ffff8000001124cf: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001124d3: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001124d7: 48 83 c0 01          	addq	$1, %rax
ffff8000001124db: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	while (*p && *p == *q)
ffff8000001124df: e9 a8 ff ff ff       	jmp	0xffff80000011248c <strcmp+0xc>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff8000001124e4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001124e8: 0f b6 00             	movzbl	(%rax), %eax
ffff8000001124eb: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001124ef: 0f b6 09             	movzbl	(%rcx), %ecx
ffff8000001124f2: 29 c8                	subl	%ecx, %eax
ffff8000001124f4: 5d                   	popq	%rbp
ffff8000001124f5: c3                   	retq
ffff8000001124f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112500 <strncmp>:
; {
ffff800000112500: 55                   	pushq	%rbp
ffff800000112501: 48 89 e5             	movq	%rsp, %rbp
ffff800000112504: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112508: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff80000011250c: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	while (n > 0 && *p && *p == *q)
ffff800000112510: 31 c0                	xorl	%eax, %eax
ffff800000112512: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112517: 88 45 df             	movb	%al, -33(%rbp)
ffff80000011251a: 0f 86 2b 00 00 00    	jbe	0xffff80000011254b <strncmp+0x4b>
ffff800000112520: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112524: 0f be 08             	movsbl	(%rax), %ecx
ffff800000112527: 31 c0                	xorl	%eax, %eax
ffff800000112529: 83 f9 00             	cmpl	$0, %ecx
ffff80000011252c: 88 45 df             	movb	%al, -33(%rbp)
ffff80000011252f: 0f 84 16 00 00 00    	je	0xffff80000011254b <strncmp+0x4b>
ffff800000112535: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112539: 0f be 00             	movsbl	(%rax), %eax
ffff80000011253c: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112540: 0f be 09             	movsbl	(%rcx), %ecx
ffff800000112543: 39 c8                	cmpl	%ecx, %eax
ffff800000112545: 0f 94 c0             	sete	%al
ffff800000112548: 88 45 df             	movb	%al, -33(%rbp)
ffff80000011254b: 8a 45 df             	movb	-33(%rbp), %al
; 	while (n > 0 && *p && *p == *q)
ffff80000011254e: a8 01                	testb	$1, %al
ffff800000112550: 0f 85 05 00 00 00    	jne	0xffff80000011255b <strncmp+0x5b>
ffff800000112556: e9 29 00 00 00       	jmp	0xffff800000112584 <strncmp+0x84>
; 		n--, p++, q++;
ffff80000011255b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011255f: 48 83 c0 ff          	addq	$-1, %rax
ffff800000112563: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000112567: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011256b: 48 83 c0 01          	addq	$1, %rax
ffff80000011256f: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000112573: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112577: 48 83 c0 01          	addq	$1, %rax
ffff80000011257b: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	while (n > 0 && *p && *p == *q)
ffff80000011257f: e9 8c ff ff ff       	jmp	0xffff800000112510 <strncmp+0x10>
; 	if (n == 0)
ffff800000112584: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112589: 0f 85 0c 00 00 00    	jne	0xffff80000011259b <strncmp+0x9b>
; 		return 0;
ffff80000011258f: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112596: e9 13 00 00 00       	jmp	0xffff8000001125ae <strncmp+0xae>
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000011259b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011259f: 0f b6 00             	movzbl	(%rax), %eax
ffff8000001125a2: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001125a6: 0f b6 09             	movzbl	(%rcx), %ecx
ffff8000001125a9: 29 c8                	subl	%ecx, %eax
ffff8000001125ab: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff8000001125ae: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001125b1: 5d                   	popq	%rbp
ffff8000001125b2: c3                   	retq
ffff8000001125b3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001125bd: 0f 1f 00             	nopl	(%rax)

ffff8000001125c0 <strchr>:
; {
ffff8000001125c0: 55                   	pushq	%rbp
ffff8000001125c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001125c4: 40 88 f0             	movb	%sil, %al
ffff8000001125c7: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001125cb: 88 45 ef             	movb	%al, -17(%rbp)
; 	for (; *s; s++)
ffff8000001125ce: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001125d2: 80 38 00             	cmpb	$0, (%rax)
ffff8000001125d5: 0f 84 36 00 00 00    	je	0xffff800000112611 <strchr+0x51>
; 		if (*s == c)
ffff8000001125db: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001125df: 0f be 00             	movsbl	(%rax), %eax
ffff8000001125e2: 0f be 4d ef          	movsbl	-17(%rbp), %ecx
ffff8000001125e6: 39 c8                	cmpl	%ecx, %eax
ffff8000001125e8: 0f 85 0d 00 00 00    	jne	0xffff8000001125fb <strchr+0x3b>
; 			return (char *) s;
ffff8000001125ee: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001125f2: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff8000001125f6: e9 1e 00 00 00       	jmp	0xffff800000112619 <strchr+0x59>
; 		if (*s == c)
ffff8000001125fb: e9 00 00 00 00       	jmp	0xffff800000112600 <strchr+0x40>
; 	for (; *s; s++)
ffff800000112600: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112604: 48 83 c0 01          	addq	$1, %rax
ffff800000112608: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000011260c: e9 bd ff ff ff       	jmp	0xffff8000001125ce <strchr+0xe>
; 	return 0;
ffff800000112611: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; }
ffff800000112619: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011261d: 5d                   	popq	%rbp
ffff80000011261e: c3                   	retq
ffff80000011261f: 90                   	nop

ffff800000112620 <strfind>:
; {
ffff800000112620: 55                   	pushq	%rbp
ffff800000112621: 48 89 e5             	movq	%rsp, %rbp
ffff800000112624: 40 88 f0             	movb	%sil, %al
ffff800000112627: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011262b: 88 45 f7             	movb	%al, -9(%rbp)
; 	for (; *s; s++)
ffff80000011262e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112632: 80 38 00             	cmpb	$0, (%rax)
ffff800000112635: 0f 84 2e 00 00 00    	je	0xffff800000112669 <strfind+0x49>
; 		if (*s == c)
ffff80000011263b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011263f: 0f be 00             	movsbl	(%rax), %eax
ffff800000112642: 0f be 4d f7          	movsbl	-9(%rbp), %ecx
ffff800000112646: 39 c8                	cmpl	%ecx, %eax
ffff800000112648: 0f 85 05 00 00 00    	jne	0xffff800000112653 <strfind+0x33>
; 			break;
ffff80000011264e: e9 16 00 00 00       	jmp	0xffff800000112669 <strfind+0x49>
; 		if (*s == c)
ffff800000112653: e9 00 00 00 00       	jmp	0xffff800000112658 <strfind+0x38>
; 	for (; *s; s++)
ffff800000112658: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011265c: 48 83 c0 01          	addq	$1, %rax
ffff800000112660: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112664: e9 c5 ff ff ff       	jmp	0xffff80000011262e <strfind+0xe>
; 	return (char *) s;
ffff800000112669: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011266d: 5d                   	popq	%rbp
ffff80000011266e: c3                   	retq
ffff80000011266f: 90                   	nop

ffff800000112670 <memset>:
; {
ffff800000112670: 55                   	pushq	%rbp
ffff800000112671: 48 89 e5             	movq	%rsp, %rbp
ffff800000112674: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112678: 89 75 ec             	movl	%esi, -20(%rbp)
ffff80000011267b: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	if (n == 0)
ffff80000011267f: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000112684: 0f 85 0d 00 00 00    	jne	0xffff800000112697 <memset+0x27>
; 		return v;
ffff80000011268a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011268e: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112692: e9 78 00 00 00       	jmp	0xffff80000011270f <memset+0x9f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff800000112697: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011269b: 48 83 e0 03          	andq	$3, %rax
ffff80000011269f: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001126a3: 0f 85 50 00 00 00    	jne	0xffff8000001126f9 <memset+0x89>
ffff8000001126a9: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001126ad: 48 83 e0 03          	andq	$3, %rax
ffff8000001126b1: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001126b5: 0f 85 3e 00 00 00    	jne	0xffff8000001126f9 <memset+0x89>
; 		c &= 0xFF;
ffff8000001126bb: 8b 45 ec             	movl	-20(%rbp), %eax
ffff8000001126be: 25 ff 00 00 00       	andl	$255, %eax
ffff8000001126c3: 89 45 ec             	movl	%eax, -20(%rbp)
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff8000001126c6: 8b 45 ec             	movl	-20(%rbp), %eax
ffff8000001126c9: c1 e0 18             	shll	$24, %eax
ffff8000001126cc: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001126cf: c1 e1 10             	shll	$16, %ecx
ffff8000001126d2: 09 c8                	orl	%ecx, %eax
ffff8000001126d4: 8b 4d ec             	movl	-20(%rbp), %ecx
ffff8000001126d7: c1 e1 08             	shll	$8, %ecx
ffff8000001126da: 09 c8                	orl	%ecx, %eax
ffff8000001126dc: 0b 45 ec             	orl	-20(%rbp), %eax
ffff8000001126df: 89 45 ec             	movl	%eax, -20(%rbp)
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff8000001126e2: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001126e6: 8b 45 ec             	movl	-20(%rbp), %eax
ffff8000001126e9: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001126ed: 48 c1 e9 02          	shrq	$2, %rcx
; 		asm volatile("cld; rep stosl\n"
ffff8000001126f1: fc                   	cld
ffff8000001126f2: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; 	} else
ffff8000001126f4: e9 0e 00 00 00       	jmp	0xffff800000112707 <memset+0x97>
; 			:: "D" (v), "a" (c), "c" (n)
ffff8000001126f9: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001126fd: 8b 45 ec             	movl	-20(%rbp), %eax
ffff800000112700: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 		asm volatile("cld; rep stosb\n"
ffff800000112704: fc                   	cld
ffff800000112705: f3 aa                	rep		stosb	%al, %es:(%rdi)
; 	return v;
ffff800000112707: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011270b: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff80000011270f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112713: 5d                   	popq	%rbp
ffff800000112714: c3                   	retq
ffff800000112715: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011271f: 90                   	nop

ffff800000112720 <memmove>:
; {
ffff800000112720: 55                   	pushq	%rbp
ffff800000112721: 48 89 e5             	movq	%rsp, %rbp
ffff800000112724: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112728: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011272c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	s = src;
ffff800000112730: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112734: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	d = dst;
ffff800000112738: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011273c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if (s < d && s + n > d) {
ffff800000112740: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112744: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff800000112748: 0f 83 9d 00 00 00    	jae	0xffff8000001127eb <memmove+0xcb>
ffff80000011274e: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112752: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000112756: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff80000011275a: 0f 86 8b 00 00 00    	jbe	0xffff8000001127eb <memmove+0xcb>
; 		s += n;
ffff800000112760: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112764: 48 03 45 e0          	addq	-32(%rbp), %rax
ffff800000112768: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		d += n;
ffff80000011276c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112770: 48 03 45 d8          	addq	-40(%rbp), %rax
ffff800000112774: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff800000112778: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011277c: 48 83 e0 03          	andq	$3, %rax
ffff800000112780: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112784: 0f 85 44 00 00 00    	jne	0xffff8000001127ce <memmove+0xae>
ffff80000011278a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011278e: 48 83 e0 03          	andq	$3, %rax
ffff800000112792: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112796: 0f 85 32 00 00 00    	jne	0xffff8000001127ce <memmove+0xae>
ffff80000011279c: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001127a0: 48 83 e0 03          	andq	$3, %rax
ffff8000001127a4: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001127a8: 0f 85 20 00 00 00    	jne	0xffff8000001127ce <memmove+0xae>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff8000001127ae: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001127b2: 48 83 c7 fc          	addq	$-4, %rdi
ffff8000001127b6: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001127ba: 48 83 c6 fc          	addq	$-4, %rsi
ffff8000001127be: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001127c2: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff8000001127c6: fd                   	std
ffff8000001127c7: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff8000001127c9: e9 17 00 00 00       	jmp	0xffff8000001127e5 <memmove+0xc5>
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff8000001127ce: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001127d2: 48 83 c7 ff          	addq	$-1, %rdi
ffff8000001127d6: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001127da: 48 83 c6 ff          	addq	$-1, %rsi
ffff8000001127de: 48 8b 4d e8          	movq	-24(%rbp), %rcx
; 			asm volatile("std; rep movsb\n"
ffff8000001127e2: fd                   	std
ffff8000001127e3: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff8000001127e5: fc                   	cld
; 	} else {
ffff8000001127e6: e9 62 00 00 00       	jmp	0xffff80000011284d <memmove+0x12d>
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff8000001127eb: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001127ef: 48 83 e0 03          	andq	$3, %rax
ffff8000001127f3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001127f7: 0f 85 3c 00 00 00    	jne	0xffff800000112839 <memmove+0x119>
ffff8000001127fd: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112801: 48 83 e0 03          	andq	$3, %rax
ffff800000112805: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112809: 0f 85 2a 00 00 00    	jne	0xffff800000112839 <memmove+0x119>
ffff80000011280f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112813: 48 83 e0 03          	andq	$3, %rax
ffff800000112817: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011281b: 0f 85 18 00 00 00    	jne	0xffff800000112839 <memmove+0x119>
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff800000112821: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000112825: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112829: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011282d: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff800000112831: fc                   	cld
ffff800000112832: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff800000112834: e9 0f 00 00 00       	jmp	0xffff800000112848 <memmove+0x128>
; 				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
ffff800000112839: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000011283d: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112841: 48 8b 4d e8          	movq	-24(%rbp), %rcx
; 			asm volatile("cld; rep movsb\n"
ffff800000112845: fc                   	cld
ffff800000112846: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
ffff800000112848: e9 00 00 00 00       	jmp	0xffff80000011284d <memmove+0x12d>
; 	return dst;
ffff80000011284d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112851: 5d                   	popq	%rbp
ffff800000112852: c3                   	retq
ffff800000112853: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011285d: 0f 1f 00             	nopl	(%rax)

ffff800000112860 <memcpy>:
; {
ffff800000112860: 55                   	pushq	%rbp
ffff800000112861: 48 89 e5             	movq	%rsp, %rbp
ffff800000112864: 48 83 ec 20          	subq	$32, %rsp
ffff800000112868: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011286c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000112870: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	return memmove(dst, src, n);
ffff800000112874: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000112878: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011287c: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000112880: 48 b8 20 27 11 00 00 80 ff ff	movabsq	$-140737487231200, %rax # imm = 0xFFFF800000112720
ffff80000011288a: ff d0                	callq	*%rax
ffff80000011288c: 48 83 c4 20          	addq	$32, %rsp
ffff800000112890: 5d                   	popq	%rbp
ffff800000112891: c3                   	retq
ffff800000112892: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011289c: 0f 1f 40 00          	nopl	(%rax)

ffff8000001128a0 <memcmp>:
; {
ffff8000001128a0: 55                   	pushq	%rbp
ffff8000001128a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001128a4: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001128a8: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001128ac: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	const uint8_t *s1 = (const uint8_t *) v1;
ffff8000001128b0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001128b4: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	const uint8_t *s2 = (const uint8_t *) v2;
ffff8000001128b8: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001128bc: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
ffff8000001128c0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001128c4: 48 89 c1             	movq	%rax, %rcx
ffff8000001128c7: 48 83 c1 ff          	addq	$-1, %rcx
ffff8000001128cb: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff8000001128cf: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001128d3: 0f 86 4b 00 00 00    	jbe	0xffff800000112924 <memcmp+0x84>
; 		if (*s1 != *s2)
ffff8000001128d9: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001128dd: 0f b6 00             	movzbl	(%rax), %eax
ffff8000001128e0: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff8000001128e4: 0f b6 09             	movzbl	(%rcx), %ecx
ffff8000001128e7: 39 c8                	cmpl	%ecx, %eax
ffff8000001128e9: 0f 84 18 00 00 00    	je	0xffff800000112907 <memcmp+0x67>
; 			return (int) *s1 - (int) *s2;
ffff8000001128ef: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001128f3: 0f b6 00             	movzbl	(%rax), %eax
ffff8000001128f6: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff8000001128fa: 0f b6 09             	movzbl	(%rcx), %ecx
ffff8000001128fd: 29 c8                	subl	%ecx, %eax
ffff8000001128ff: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000112902: e9 24 00 00 00       	jmp	0xffff80000011292b <memcmp+0x8b>
; 		s1++, s2++;
ffff800000112907: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011290b: 48 83 c0 01          	addq	$1, %rax
ffff80000011290f: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000112913: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112917: 48 83 c0 01          	addq	$1, %rax
ffff80000011291b: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	while (n-- > 0) {
ffff80000011291f: e9 9c ff ff ff       	jmp	0xffff8000001128c0 <memcmp+0x20>
; 	return 0;
ffff800000112924: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000011292b: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011292e: 5d                   	popq	%rbp
ffff80000011292f: c3                   	retq

ffff800000112930 <memfind>:
; {
ffff800000112930: 55                   	pushq	%rbp
ffff800000112931: 48 89 e5             	movq	%rsp, %rbp
ffff800000112934: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112938: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011293b: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	const void *ends = (const char *) s + n;
ffff80000011293f: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112943: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000112947: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	for (; s < ends; s++)
ffff80000011294b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011294f: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff800000112953: 0f 83 30 00 00 00    	jae	0xffff800000112989 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff800000112959: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011295d: 0f b6 00             	movzbl	(%rax), %eax
ffff800000112960: 8b 4d f4             	movl	-12(%rbp), %ecx
ffff800000112963: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000112966: 39 c8                	cmpl	%ecx, %eax
ffff800000112968: 0f 85 05 00 00 00    	jne	0xffff800000112973 <memfind+0x43>
; 			break;
ffff80000011296e: e9 16 00 00 00       	jmp	0xffff800000112989 <memfind+0x59>
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff800000112973: e9 00 00 00 00       	jmp	0xffff800000112978 <memfind+0x48>
; 	for (; s < ends; s++)
ffff800000112978: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011297c: 48 83 c0 01          	addq	$1, %rax
ffff800000112980: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112984: e9 c2 ff ff ff       	jmp	0xffff80000011294b <memfind+0x1b>
; 	return (void *) s;
ffff800000112989: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011298d: 5d                   	popq	%rbp
ffff80000011298e: c3                   	retq
ffff80000011298f: 90                   	nop

ffff800000112990 <strtol>:
; {
ffff800000112990: 55                   	pushq	%rbp
ffff800000112991: 48 89 e5             	movq	%rsp, %rbp
ffff800000112994: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112998: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011299c: 89 55 ec             	movl	%edx, -20(%rbp)
; 	int neg = 0;
ffff80000011299f: c7 45 e8 00 00 00 00 	movl	$0, -24(%rbp)
; 	long val = 0;
ffff8000001129a6: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	while (*s == ' ' || *s == '\t')
ffff8000001129ae: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001129b2: 0f be 08             	movsbl	(%rax), %ecx
ffff8000001129b5: b0 01                	movb	$1, %al
ffff8000001129b7: 83 f9 20             	cmpl	$32, %ecx
ffff8000001129ba: 88 45 db             	movb	%al, -37(%rbp)
ffff8000001129bd: 0f 84 10 00 00 00    	je	0xffff8000001129d3 <strtol+0x43>
ffff8000001129c3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001129c7: 0f be 00             	movsbl	(%rax), %eax
ffff8000001129ca: 83 f8 09             	cmpl	$9, %eax
ffff8000001129cd: 0f 94 c0             	sete	%al
ffff8000001129d0: 88 45 db             	movb	%al, -37(%rbp)
ffff8000001129d3: 8a 45 db             	movb	-37(%rbp), %al
; 	while (*s == ' ' || *s == '\t')
ffff8000001129d6: a8 01                	testb	$1, %al
ffff8000001129d8: 0f 85 05 00 00 00    	jne	0xffff8000001129e3 <strtol+0x53>
ffff8000001129de: e9 11 00 00 00       	jmp	0xffff8000001129f4 <strtol+0x64>
; 		s++;
ffff8000001129e3: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001129e7: 48 83 c0 01          	addq	$1, %rax
ffff8000001129eb: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	while (*s == ' ' || *s == '\t')
ffff8000001129ef: e9 ba ff ff ff       	jmp	0xffff8000001129ae <strtol+0x1e>
; 	if (*s == '+')
ffff8000001129f4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001129f8: 0f be 00             	movsbl	(%rax), %eax
ffff8000001129fb: 83 f8 2b             	cmpl	$43, %eax
ffff8000001129fe: 0f 85 11 00 00 00    	jne	0xffff800000112a15 <strtol+0x85>
; 		s++;
ffff800000112a04: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a08: 48 83 c0 01          	addq	$1, %rax
ffff800000112a0c: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112a10: e9 28 00 00 00       	jmp	0xffff800000112a3d <strtol+0xad>
; 	else if (*s == '-')
ffff800000112a15: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a19: 0f be 00             	movsbl	(%rax), %eax
ffff800000112a1c: 83 f8 2d             	cmpl	$45, %eax
ffff800000112a1f: 0f 85 13 00 00 00    	jne	0xffff800000112a38 <strtol+0xa8>
; 		s++, neg = 1;
ffff800000112a25: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a29: 48 83 c0 01          	addq	$1, %rax
ffff800000112a2d: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112a31: c7 45 e8 01 00 00 00 	movl	$1, -24(%rbp)
ffff800000112a38: e9 00 00 00 00       	jmp	0xffff800000112a3d <strtol+0xad>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff800000112a3d: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112a41: 0f 84 0a 00 00 00    	je	0xffff800000112a51 <strtol+0xc1>
ffff800000112a47: 83 7d ec 10          	cmpl	$16, -20(%rbp)
ffff800000112a4b: 0f 85 39 00 00 00    	jne	0xffff800000112a8a <strtol+0xfa>
ffff800000112a51: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a55: 0f be 00             	movsbl	(%rax), %eax
ffff800000112a58: 83 f8 30             	cmpl	$48, %eax
ffff800000112a5b: 0f 85 29 00 00 00    	jne	0xffff800000112a8a <strtol+0xfa>
ffff800000112a61: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a65: 0f be 40 01          	movsbl	1(%rax), %eax
ffff800000112a69: 83 f8 78             	cmpl	$120, %eax
ffff800000112a6c: 0f 85 18 00 00 00    	jne	0xffff800000112a8a <strtol+0xfa>
; 		s += 2, base = 16;
ffff800000112a72: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a76: 48 83 c0 02          	addq	$2, %rax
ffff800000112a7a: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112a7e: c7 45 ec 10 00 00 00 	movl	$16, -20(%rbp)
ffff800000112a85: e9 4d 00 00 00       	jmp	0xffff800000112ad7 <strtol+0x147>
; 	else if (base == 0 && s[0] == '0')
ffff800000112a8a: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112a8e: 0f 85 28 00 00 00    	jne	0xffff800000112abc <strtol+0x12c>
ffff800000112a94: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112a98: 0f be 00             	movsbl	(%rax), %eax
ffff800000112a9b: 83 f8 30             	cmpl	$48, %eax
ffff800000112a9e: 0f 85 18 00 00 00    	jne	0xffff800000112abc <strtol+0x12c>
; 		s++, base = 8;
ffff800000112aa4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112aa8: 48 83 c0 01          	addq	$1, %rax
ffff800000112aac: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112ab0: c7 45 ec 08 00 00 00 	movl	$8, -20(%rbp)
ffff800000112ab7: e9 16 00 00 00       	jmp	0xffff800000112ad2 <strtol+0x142>
; 	else if (base == 0)
ffff800000112abc: 83 7d ec 00          	cmpl	$0, -20(%rbp)
ffff800000112ac0: 0f 85 07 00 00 00    	jne	0xffff800000112acd <strtol+0x13d>
; 		base = 10;
ffff800000112ac6: c7 45 ec 0a 00 00 00 	movl	$10, -20(%rbp)
ffff800000112acd: e9 00 00 00 00       	jmp	0xffff800000112ad2 <strtol+0x142>
ffff800000112ad2: e9 00 00 00 00       	jmp	0xffff800000112ad7 <strtol+0x147>
; 	while (1) {
ffff800000112ad7: e9 00 00 00 00       	jmp	0xffff800000112adc <strtol+0x14c>
; 		if (*s >= '0' && *s <= '9')
ffff800000112adc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112ae0: 0f be 00             	movsbl	(%rax), %eax
ffff800000112ae3: 83 f8 30             	cmpl	$48, %eax
ffff800000112ae6: 0f 8c 22 00 00 00    	jl	0xffff800000112b0e <strtol+0x17e>
ffff800000112aec: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112af0: 0f be 00             	movsbl	(%rax), %eax
ffff800000112af3: 83 f8 39             	cmpl	$57, %eax
ffff800000112af6: 0f 8f 12 00 00 00    	jg	0xffff800000112b0e <strtol+0x17e>
; 			dig = *s - '0';
ffff800000112afc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b00: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b03: 83 e8 30             	subl	$48, %eax
ffff800000112b06: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112b09: e9 79 00 00 00       	jmp	0xffff800000112b87 <strtol+0x1f7>
; 		else if (*s >= 'a' && *s <= 'z')
ffff800000112b0e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b12: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b15: 83 f8 61             	cmpl	$97, %eax
ffff800000112b18: 0f 8c 25 00 00 00    	jl	0xffff800000112b43 <strtol+0x1b3>
ffff800000112b1e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b22: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b25: 83 f8 7a             	cmpl	$122, %eax
ffff800000112b28: 0f 8f 15 00 00 00    	jg	0xffff800000112b43 <strtol+0x1b3>
; 			dig = *s - 'a' + 10;
ffff800000112b2e: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b32: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b35: 83 e8 61             	subl	$97, %eax
ffff800000112b38: 83 c0 0a             	addl	$10, %eax
ffff800000112b3b: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112b3e: e9 3f 00 00 00       	jmp	0xffff800000112b82 <strtol+0x1f2>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff800000112b43: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b47: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b4a: 83 f8 41             	cmpl	$65, %eax
ffff800000112b4d: 0f 8c 25 00 00 00    	jl	0xffff800000112b78 <strtol+0x1e8>
ffff800000112b53: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b57: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b5a: 83 f8 5a             	cmpl	$90, %eax
ffff800000112b5d: 0f 8f 15 00 00 00    	jg	0xffff800000112b78 <strtol+0x1e8>
; 			dig = *s - 'A' + 10;
ffff800000112b63: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b67: 0f be 00             	movsbl	(%rax), %eax
ffff800000112b6a: 83 e8 41             	subl	$65, %eax
ffff800000112b6d: 83 c0 0a             	addl	$10, %eax
ffff800000112b70: 89 45 dc             	movl	%eax, -36(%rbp)
ffff800000112b73: e9 05 00 00 00       	jmp	0xffff800000112b7d <strtol+0x1ed>
; 			break;
ffff800000112b78: e9 43 00 00 00       	jmp	0xffff800000112bc0 <strtol+0x230>
ffff800000112b7d: e9 00 00 00 00       	jmp	0xffff800000112b82 <strtol+0x1f2>
ffff800000112b82: e9 00 00 00 00       	jmp	0xffff800000112b87 <strtol+0x1f7>
; 		if (dig >= base)
ffff800000112b87: 8b 45 dc             	movl	-36(%rbp), %eax
ffff800000112b8a: 3b 45 ec             	cmpl	-20(%rbp), %eax
ffff800000112b8d: 0f 8c 05 00 00 00    	jl	0xffff800000112b98 <strtol+0x208>
; 			break;
ffff800000112b93: e9 28 00 00 00       	jmp	0xffff800000112bc0 <strtol+0x230>
; 		s++, val = (val * base) + dig;
ffff800000112b98: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000112b9c: 48 83 c0 01          	addq	$1, %rax
ffff800000112ba0: 48 89 45 f8          	movq	%rax, -8(%rbp)
ffff800000112ba4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112ba8: 48 63 4d ec          	movslq	-20(%rbp), %rcx
ffff800000112bac: 48 0f af c1          	imulq	%rcx, %rax
ffff800000112bb0: 48 63 4d dc          	movslq	-36(%rbp), %rcx
ffff800000112bb4: 48 01 c8             	addq	%rcx, %rax
ffff800000112bb7: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	while (1) {
ffff800000112bbb: e9 1c ff ff ff       	jmp	0xffff800000112adc <strtol+0x14c>
; 	if (endptr)
ffff800000112bc0: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff800000112bc5: 0f 84 0b 00 00 00    	je	0xffff800000112bd6 <strtol+0x246>
; 		*endptr = (char *) s;
ffff800000112bcb: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000112bcf: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112bd3: 48 89 08             	movq	%rcx, (%rax)
; 	return (neg ? -val : val);
ffff800000112bd6: 83 7d e8 00          	cmpl	$0, -24(%rbp)
ffff800000112bda: 0f 84 0f 00 00 00    	je	0xffff800000112bef <strtol+0x25f>
ffff800000112be0: 31 c0                	xorl	%eax, %eax
ffff800000112be2: 48 2b 45 e0          	subq	-32(%rbp), %rax
ffff800000112be6: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000112bea: e9 08 00 00 00       	jmp	0xffff800000112bf7 <strtol+0x267>
ffff800000112bef: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112bf3: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000112bf7: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	return (neg ? -val : val);
ffff800000112bfb: 5d                   	popq	%rbp
ffff800000112bfc: c3                   	retq
ffff800000112bfd: cc                   	int3
ffff800000112bfe: cc                   	int3
ffff800000112bff: cc                   	int3

ffff800000112c00 <dump_page_tables>:
; {
ffff800000112c00: 55                   	pushq	%rbp
ffff800000112c01: 48 89 e5             	movq	%rsp, %rbp
ffff800000112c04: 48 81 ec 90 00 00 00 	subq	$144, %rsp
ffff800000112c0b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112c0f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	struct dump_info info = {
ffff800000112c13: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff800000112c1b: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff800000112c23: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000112c2b: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.mask = mask | PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC |
ffff800000112c33: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112c37: 48 b9 07 00 00 00 00 00 00 80	movabsq	$-9223372036854775801, %rcx # imm = 0x8000000000000007
ffff800000112c41: 48 09 c8             	orq	%rcx, %rax
; 	struct dump_info info = {
ffff800000112c44: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct page_walker walker = {
ffff800000112c48: 48 b8 10 2d 11 00 00 80 ff ff	movabsq	$-140737487229680, %rax # imm = 0xFFFF800000112D10
ffff800000112c52: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000112c59: 48 b8 c0 2d 11 00 00 80 ff ff	movabsq	$-140737487229504, %rax # imm = 0xFFFF800000112DC0
ffff800000112c63: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff800000112c67: 48 c7 45 88 00 00 00 00      	movq	$0, -120(%rbp)
ffff800000112c6f: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff800000112c77: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000112c7f: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff800000112c87: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000112c8f: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000112c97: 48 b8 90 2e 11 00 00 80 ff ff	movabsq	$-140737487229296, %rax # imm = 0xFFFF800000112E90
ffff800000112ca1: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		.udata = &info,
ffff800000112ca5: 48 8d 45 c8          	leaq	-56(%rbp), %rax
; 	struct page_walker walker = {
ffff800000112ca9: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	if (walk_all_pages(pml4, &walker) < 0)
ffff800000112cad: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000112cb1: 48 b8 80 49 11 00 00 80 ff ff	movabsq	$-140737487222400, %rax # imm = 0xFFFF800000114980
ffff800000112cbb: 48 8d b5 78 ff ff ff 	leaq	-136(%rbp), %rsi
ffff800000112cc2: ff d0                	callq	*%rax
ffff800000112cc4: 83 f8 00             	cmpl	$0, %eax
ffff800000112cc7: 0f 8d 0c 00 00 00    	jge	0xffff800000112cd9 <dump_page_tables+0xd9>
; 		return -1;
ffff800000112ccd: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000112cd4: e9 23 00 00 00       	jmp	0xffff800000112cfc <dump_page_tables+0xfc>
; 	dump_hole(0, 0, &walker);
ffff800000112cd9: 31 c0                	xorl	%eax, %eax
ffff800000112cdb: 48 b8 90 2e 11 00 00 80 ff ff	movabsq	$-140737487229296, %rax # imm = 0xFFFF800000112E90
ffff800000112ce5: 31 c9                	xorl	%ecx, %ecx
ffff800000112ce7: 89 ce                	movl	%ecx, %esi
ffff800000112ce9: 48 8d 95 78 ff ff ff 	leaq	-136(%rbp), %rdx
ffff800000112cf0: 48 89 f7             	movq	%rsi, %rdi
ffff800000112cf3: ff d0                	callq	*%rax
; 	return 0;
ffff800000112cf5: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112cfc: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112cff: 48 81 c4 90 00 00 00 	addq	$144, %rsp
ffff800000112d06: 5d                   	popq	%rbp
ffff800000112d07: c3                   	retq
ffff800000112d08: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112d10 <dump_pte>:
; {
ffff800000112d10: 55                   	pushq	%rbp
ffff800000112d11: 48 89 e5             	movq	%rsp, %rbp
ffff800000112d14: 48 83 ec 40          	subq	$64, %rsp
ffff800000112d18: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112d1c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000112d20: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000112d24: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000112d28: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112d2c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000112d30: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	flags = *entry & info->mask;
ffff800000112d34: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112d38: 48 8b 00             	movq	(%rax), %rax
ffff800000112d3b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112d3f: 48 23 41 18          	andq	24(%rcx), %rax
ffff800000112d43: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (flags == info->flags) {
ffff800000112d47: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000112d4b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112d4f: 48 3b 41 10          	cmpq	16(%rcx), %rax
ffff800000112d53: 0f 85 18 00 00 00    	jne	0xffff800000112d71 <dump_pte+0x61>
; 		info->end = end;
ffff800000112d59: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112d5d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112d61: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		return 0;
ffff800000112d65: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112d6c: e9 42 00 00 00       	jmp	0xffff800000112db3 <dump_pte+0xa3>
; 	dump_hole(base, end, walker);
ffff800000112d71: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000112d75: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112d79: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000112d7d: 48 b8 90 2e 11 00 00 80 ff ff	movabsq	$-140737487229296, %rax # imm = 0xFFFF800000112E90
ffff800000112d87: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000112d89: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112d8d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112d91: 48 89 08             	movq	%rcx, (%rax)
; 	info->end = end;
ffff800000112d94: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112d98: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112d9c: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	info->flags = flags;
ffff800000112da0: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000112da4: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112da8: 48 89 48 10          	movq	%rcx, 16(%rax)
; 	return 0;
ffff800000112dac: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112db3: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112db6: 48 83 c4 40          	addq	$64, %rsp
ffff800000112dba: 5d                   	popq	%rbp
ffff800000112dbb: c3                   	retq
ffff800000112dbc: 0f 1f 40 00          	nopl	(%rax)

ffff800000112dc0 <dump_pde>:
; {
ffff800000112dc0: 55                   	pushq	%rbp
ffff800000112dc1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112dc4: 48 83 ec 40          	subq	$64, %rsp
ffff800000112dc8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000112dcc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000112dd0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000112dd4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000112dd8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000112ddc: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000112de0: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (!(*entry & PAGE_HUGE))
ffff800000112de4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112de8: 48 8b 00             	movq	(%rax), %rax
ffff800000112deb: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000112df1: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112df5: 0f 85 0c 00 00 00    	jne	0xffff800000112e07 <dump_pde+0x47>
; 		return 0;
ffff800000112dfb: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112e02: e9 7f 00 00 00       	jmp	0xffff800000112e86 <dump_pde+0xc6>
; 	flags = *entry & info->mask;
ffff800000112e07: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000112e0b: 48 8b 00             	movq	(%rax), %rax
ffff800000112e0e: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112e12: 48 23 41 18          	andq	24(%rcx), %rax
ffff800000112e16: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (flags == info->flags) {
ffff800000112e1a: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000112e1e: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000112e22: 48 3b 41 10          	cmpq	16(%rcx), %rax
ffff800000112e26: 0f 85 18 00 00 00    	jne	0xffff800000112e44 <dump_pde+0x84>
; 		info->end = end;
ffff800000112e2c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112e30: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112e34: 48 89 48 08          	movq	%rcx, 8(%rax)
; 		return 0;
ffff800000112e38: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000112e3f: e9 42 00 00 00       	jmp	0xffff800000112e86 <dump_pde+0xc6>
; 	dump_hole(base, end, walker);
ffff800000112e44: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000112e48: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000112e4c: 48 8b 55 d8          	movq	-40(%rbp), %rdx
ffff800000112e50: 48 b8 90 2e 11 00 00 80 ff ff	movabsq	$-140737487229296, %rax # imm = 0xFFFF800000112E90
ffff800000112e5a: ff d0                	callq	*%rax
; 	info->base = base;
ffff800000112e5c: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000112e60: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112e64: 48 89 08             	movq	%rcx, (%rax)
; 	info->end = end;
ffff800000112e67: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000112e6b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112e6f: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	info->flags = flags;
ffff800000112e73: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000112e77: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000112e7b: 48 89 48 10          	movq	%rcx, 16(%rax)
; 	return 0;
ffff800000112e7f: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000112e86: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000112e89: 48 83 c4 40          	addq	$64, %rsp
ffff800000112e8d: 5d                   	popq	%rbp
ffff800000112e8e: c3                   	retq
ffff800000112e8f: 90                   	nop

ffff800000112e90 <dump_hole>:
; {
ffff800000112e90: 55                   	pushq	%rbp
ffff800000112e91: 48 89 e5             	movq	%rsp, %rbp
ffff800000112e94: 48 83 ec 30          	subq	$48, %rsp
ffff800000112e98: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000112e9c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000112ea0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	struct dump_info *info = walker->udata;
ffff800000112ea4: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000112ea8: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000112eac: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	if (info->flags & PAGE_PRESENT) {
ffff800000112eb0: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112eb4: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000112eb8: 48 83 e0 01          	andq	$1, %rax
ffff800000112ebc: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112ec0: 0f 84 1d 01 00 00    	je	0xffff800000112fe3 <dump_hole+0x153>
; 			info->base,
ffff800000112ec6: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112eca: 48 8b 30             	movq	(%rax), %rsi
; 			info->end,
ffff800000112ecd: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112ed1: 48 8b 50 08          	movq	8(%rax), %rdx
; 			(info->flags & PAGE_PRESENT) ? 'r' : '-',
ffff800000112ed5: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112ed9: 48 8b 78 10          	movq	16(%rax), %rdi
ffff800000112edd: 48 83 e7 01          	andq	$1, %rdi
ffff800000112ee1: b9 2d 00 00 00       	movl	$45, %ecx
ffff800000112ee6: b8 72 00 00 00       	movl	$114, %eax
ffff800000112eeb: 48 83 ff 00          	cmpq	$0, %rdi
ffff800000112eef: 0f 45 c8             	cmovnel	%eax, %ecx
; 			(info->flags & PAGE_WRITE) ? 'w' : '-',
ffff800000112ef2: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112ef6: 48 8b 78 10          	movq	16(%rax), %rdi
ffff800000112efa: 48 83 e7 02          	andq	$2, %rdi
ffff800000112efe: 41 b8 2d 00 00 00    	movl	$45, %r8d
ffff800000112f04: b8 77 00 00 00       	movl	$119, %eax
ffff800000112f09: 48 83 ff 00          	cmpq	$0, %rdi
ffff800000112f0d: 44 0f 45 c0          	cmovnel	%eax, %r8d
; 			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
ffff800000112f11: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112f15: 48 bf 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rdi # imm = 0x8000000000000000
ffff800000112f1f: 48 23 78 10          	andq	16(%rax), %rdi
ffff800000112f23: 41 b9 78 00 00 00    	movl	$120, %r9d
ffff800000112f29: b8 2d 00 00 00       	movl	$45, %eax
ffff800000112f2e: 48 83 ff 00          	cmpq	$0, %rdi
ffff800000112f32: 44 0f 45 c8          	cmovnel	%eax, %r9d
; 			(info->flags & PAGE_USER) ? 'u' : '-'
ffff800000112f36: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112f3a: 4c 8b 50 10          	movq	16(%rax), %r10
ffff800000112f3e: 49 83 e2 04          	andq	$4, %r10
ffff800000112f42: bf 2d 00 00 00       	movl	$45, %edi
ffff800000112f47: b8 75 00 00 00       	movl	$117, %eax
ffff800000112f4c: 49 83 fa 00          	cmpq	$0, %r10
ffff800000112f50: 0f 45 f8             	cmovnel	%eax, %edi
; 		cprintf("  %016p - %016p [%c%c%c%c",
ffff800000112f53: 48 89 e0             	movq	%rsp, %rax
ffff800000112f56: 89 38                	movl	%edi, (%rax)
ffff800000112f58: 48 bf 3d 95 11 00 00 80 ff ff	movabsq	$-140737487203011, %rdi # imm = 0xFFFF80000011953D
ffff800000112f62: 49 ba 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %r10 # imm = 0xFFFF80000010DC80
ffff800000112f6c: 31 c0                	xorl	%eax, %eax
ffff800000112f6e: 41 ff d2             	callq	*%r10
; 		if (info->mask & PAGE_HUGE) {
ffff800000112f71: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112f75: 48 8b 40 18          	movq	24(%rax), %rax
ffff800000112f79: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000112f7f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000112f83: 0f 84 42 00 00 00    	je	0xffff800000112fcb <dump_hole+0x13b>
; 				(info->flags & PAGE_HUGE) ? "2M" : "4K"
ffff800000112f89: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112f8d: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000112f91: 25 80 00 00 00       	andl	$128, %eax
ffff800000112f96: 89 c1                	movl	%eax, %ecx
ffff800000112f98: 48 b8 37 85 11 00 00 80 ff ff	movabsq	$-140737487207113, %rax # imm = 0xFFFF800000118537
ffff800000112fa2: 48 be fc 8d 11 00 00 80 ff ff	movabsq	$-140737487204868, %rsi # imm = 0xFFFF800000118DFC
ffff800000112fac: 48 85 c9             	testq	%rcx, %rcx
ffff800000112faf: 48 0f 45 f0          	cmovneq	%rax, %rsi
; 			cprintf(" %s",
ffff800000112fb3: 48 bf a7 87 11 00 00 80 ff ff	movabsq	$-140737487206489, %rdi # imm = 0xFFFF8000001187A7
ffff800000112fbd: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000112fc7: 31 c0                	xorl	%eax, %eax
ffff800000112fc9: ff d1                	callq	*%rcx
; 		cprintf("]\n");
ffff800000112fcb: 48 bf 89 8d 11 00 00 80 ff ff	movabsq	$-140737487204983, %rdi # imm = 0xFFFF800000118D89
ffff800000112fd5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000112fdf: 31 c0                	xorl	%eax, %eax
ffff800000112fe1: ff d1                	callq	*%rcx
; 	info->flags = 0;
ffff800000112fe3: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000112fe7: 48 c7 40 10 00 00 00 00      	movq	$0, 16(%rax)
; 	return 0;
ffff800000112fef: 31 c0                	xorl	%eax, %eax
ffff800000112ff1: 48 83 c4 30          	addq	$48, %rsp
ffff800000112ff5: 5d                   	popq	%rbp
ffff800000112ff6: c3                   	retq
ffff800000112ff7: cc                   	int3
ffff800000112ff8: cc                   	int3
ffff800000112ff9: cc                   	int3
ffff800000112ffa: cc                   	int3
ffff800000112ffb: cc                   	int3
ffff800000112ffc: cc                   	int3
ffff800000112ffd: cc                   	int3
ffff800000112ffe: cc                   	int3
ffff800000112fff: cc                   	int3

ffff800000113000 <page_insert>:
; {
ffff800000113000: 55                   	pushq	%rbp
ffff800000113001: 48 89 e5             	movq	%rsp, %rbp
ffff800000113004: 48 81 ec 90 00 00 00 	subq	$144, %rsp
ffff80000011300b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011300f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113013: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113017: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	if((flags & PAGE_PRESENT) == 0){
ffff80000011301b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011301f: 48 83 e0 01          	andq	$1, %rax
ffff800000113023: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113027: 0f 85 27 00 00 00    	jne	0xffff800000113054 <page_insert+0x54>
; 		panic("page_insert called with present bit 0");
ffff80000011302d: 48 bf 7d 8a 11 00 00 80 ff ff	movabsq	$-140737487205763, %rdi # imm = 0xFFFF800000118A7D
ffff800000113037: 48 ba 2f 8d 11 00 00 80 ff ff	movabsq	$-140737487205073, %rdx # imm = 0xFFFF800000118D2F
ffff800000113041: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011304b: 31 c0                	xorl	%eax, %eax
ffff80000011304d: be 57 00 00 00       	movl	$87, %esi
ffff800000113052: ff d1                	callq	*%rcx
; 	if(!page_aligned((uintptr_t)va)){
ffff800000113054: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000113058: 48 b8 90 31 11 00 00 80 ff ff	movabsq	$-140737487228528, %rax # imm = 0xFFFF800000113190
ffff800000113062: ff d0                	callq	*%rax
ffff800000113064: 83 f8 00             	cmpl	$0, %eax
ffff800000113067: 0f 85 27 00 00 00    	jne	0xffff800000113094 <page_insert+0x94>
; 		panic("page_insert called with non-aligned virtual address");
ffff80000011306d: 48 bf 7d 8a 11 00 00 80 ff ff	movabsq	$-140737487205763, %rdi # imm = 0xFFFF800000118A7D
ffff800000113077: 48 ba 55 8d 11 00 00 80 ff ff	movabsq	$-140737487205035, %rdx # imm = 0xFFFF800000118D55
ffff800000113081: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011308b: 31 c0                	xorl	%eax, %eax
ffff80000011308d: be 5a 00 00 00       	movl	$90, %esi
ffff800000113092: ff d1                	callq	*%rcx
; 	if((flags & PAGE_HUGE) && !hpage_aligned((uintptr_t)va)){
ffff800000113094: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113098: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011309e: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001130a2: 0f 84 40 00 00 00    	je	0xffff8000001130e8 <page_insert+0xe8>
ffff8000001130a8: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001130ac: 48 b8 c0 31 11 00 00 80 ff ff	movabsq	$-140737487228480, %rax # imm = 0xFFFF8000001131C0
ffff8000001130b6: ff d0                	callq	*%rax
ffff8000001130b8: 83 f8 00             	cmpl	$0, %eax
ffff8000001130bb: 0f 85 27 00 00 00    	jne	0xffff8000001130e8 <page_insert+0xe8>
; 		panic("page_insert called with huge page non-aligned virtual address");
ffff8000001130c1: 48 bf 7d 8a 11 00 00 80 ff ff	movabsq	$-140737487205763, %rdi # imm = 0xFFFF800000118A7D
ffff8000001130cb: 48 ba c1 90 11 00 00 80 ff ff	movabsq	$-140737487204159, %rdx # imm = 0xFFFF8000001190C1
ffff8000001130d5: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001130df: 31 c0                	xorl	%eax, %eax
ffff8000001130e1: be 5d 00 00 00       	movl	$93, %esi
ffff8000001130e6: ff d1                	callq	*%rcx
; 	struct insert_info info = {pml4, page, flags};
ffff8000001130e8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001130ec: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001130f0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001130f4: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001130f8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001130fc: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	struct page_walker walker = {
ffff800000113100: 48 b8 f0 31 11 00 00 80 ff ff	movabsq	$-140737487228432, %rax # imm = 0xFFFF8000001131F0
ffff80000011310a: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
ffff800000113111: 48 b8 d0 32 11 00 00 80 ff ff	movabsq	$-140737487228208, %rax # imm = 0xFFFF8000001132D0
ffff80000011311b: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff80000011311f: 48 c7 45 88 00 00 00 00      	movq	$0, -120(%rbp)
ffff800000113127: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff80000011312f: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000113137: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff80000011313f: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000113147: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff80000011314f: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
; 		.udata = &info, 
ffff800000113157: 48 8d 45 c8          	leaq	-56(%rbp), %rax
; 	struct page_walker walker = {
ffff80000011315b: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	return walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff80000011315f: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113163: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113167: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000011316b: 48 81 c2 00 10 00 00 	addq	$4096, %rdx             # imm = 0x1000
ffff800000113172: 48 b8 50 48 11 00 00 80 ff ff	movabsq	$-140737487222704, %rax # imm = 0xFFFF800000114850
ffff80000011317c: 48 8d 8d 78 ff ff ff 	leaq	-136(%rbp), %rcx
ffff800000113183: ff d0                	callq	*%rax
ffff800000113185: 48 81 c4 90 00 00 00 	addq	$144, %rsp
ffff80000011318c: 5d                   	popq	%rbp
ffff80000011318d: c3                   	retq
ffff80000011318e: 66 90                	nop

ffff800000113190 <page_aligned>:
; {
ffff800000113190: 55                   	pushq	%rbp
ffff800000113191: 48 89 e5             	movq	%rsp, %rbp
ffff800000113194: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (PAGE_SIZE - 1));
ffff800000113198: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011319c: 48 25 ff 0f 00 00    	andq	$4095, %rax             # imm = 0xFFF
ffff8000001131a2: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001131a6: 0f 95 c0             	setne	%al
ffff8000001131a9: 34 ff                	xorb	$-1, %al
ffff8000001131ab: 24 01                	andb	$1, %al
ffff8000001131ad: 0f b6 c0             	movzbl	%al, %eax
ffff8000001131b0: 5d                   	popq	%rbp
ffff8000001131b1: c3                   	retq
ffff8000001131b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001131bc: 0f 1f 40 00          	nopl	(%rax)

ffff8000001131c0 <hpage_aligned>:
; {
ffff8000001131c0: 55                   	pushq	%rbp
ffff8000001131c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001131c4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (HPAGE_SIZE - 1));
ffff8000001131c8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001131cc: 48 25 ff ff 1f 00    	andq	$2097151, %rax          # imm = 0x1FFFFF
ffff8000001131d2: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001131d6: 0f 95 c0             	setne	%al
ffff8000001131d9: 34 ff                	xorb	$-1, %al
ffff8000001131db: 24 01                	andb	$1, %al
ffff8000001131dd: 0f b6 c0             	movzbl	%al, %eax
ffff8000001131e0: 5d                   	popq	%rbp
ffff8000001131e1: c3                   	retq
ffff8000001131e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001131ec: 0f 1f 40 00          	nopl	(%rax)

ffff8000001131f0 <insert_pte>:
; {
ffff8000001131f0: 55                   	pushq	%rbp
ffff8000001131f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001131f4: 48 83 ec 40          	subq	$64, %rsp
ffff8000001131f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001131fc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113200: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113204: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct insert_info *info = walker->udata;
ffff800000113208: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011320c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113210: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT){
ffff800000113214: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113218: 48 8b 00             	movq	(%rax), %rax
ffff80000011321b: 48 83 e0 01          	andq	$1, %rax
ffff80000011321f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113223: 0f 84 5f 00 00 00    	je	0xffff800000113288 <insert_pte+0x98>
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff800000113229: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011322d: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113237: 48 23 38             	andq	(%rax), %rdi
ffff80000011323a: 48 b8 f0 33 11 00 00 80 ff ff	movabsq	$-140737487227920, %rax # imm = 0xFFFF8000001133F0
ffff800000113244: ff d0                	callq	*%rax
ffff800000113246: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		page_decref(page);
ffff80000011324a: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff80000011324e: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000113258: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff80000011325a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011325e: 48 8b 00             	movq	(%rax), %rax
ffff800000113261: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000113265: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113269: 48 b8 70 34 11 00 00 80 ff ff	movabsq	$-140737487227792, %rax # imm = 0xFFFF800000113470
ffff800000113273: ff d0                	callq	*%rax
ffff800000113275: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000113279: 48 89 c6             	movq	%rax, %rsi
ffff80000011327c: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff800000113286: ff d0                	callq	*%rax
; 	info->page->pp_ref++;
ffff800000113288: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011328c: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000113290: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113294: 66 83 c1 01          	addw	$1, %cx
ffff800000113298: 66 89 48 10          	movw	%cx, 16(%rax)
; 	*entry = page2pa(info->page) | info->flags;
ffff80000011329c: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001132a0: 48 8b 78 08          	movq	8(%rax), %rdi
ffff8000001132a4: 48 b8 b0 34 11 00 00 80 ff ff	movabsq	$-140737487227728, %rax # imm = 0xFFFF8000001134B0
ffff8000001132ae: ff d0                	callq	*%rax
ffff8000001132b0: 48 89 c1             	movq	%rax, %rcx
ffff8000001132b3: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001132b7: 48 0b 48 10          	orq	16(%rax), %rcx
ffff8000001132bb: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001132bf: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001132c2: 31 c0                	xorl	%eax, %eax
ffff8000001132c4: 48 83 c4 40          	addq	$64, %rsp
ffff8000001132c8: 5d                   	popq	%rbp
ffff8000001132c9: c3                   	retq
ffff8000001132ca: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001132d0 <insert_pde>:
; {
ffff8000001132d0: 55                   	pushq	%rbp
ffff8000001132d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001132d4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001132d8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001132dc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001132e0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001132e4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	struct insert_info *info = walker->udata;
ffff8000001132e8: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001132ec: 48 8b 40 48          	movq	72(%rax), %rax
ffff8000001132f0: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(*entry & PAGE_HUGE){
ffff8000001132f4: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001132f8: 48 8b 00             	movq	(%rax), %rax
ffff8000001132fb: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000113301: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113305: 0f 84 5f 00 00 00    	je	0xffff80000011336a <insert_pde+0x9a>
; 		struct page_info *page = pa2page(PAGE_ADDR(*entry));
ffff80000011330b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011330f: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113319: 48 23 38             	andq	(%rax), %rdi
ffff80000011331c: 48 b8 f0 33 11 00 00 80 ff ff	movabsq	$-140737487227920, %rax # imm = 0xFFFF8000001133F0
ffff800000113326: ff d0                	callq	*%rax
ffff800000113328: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		page_decref(page);
ffff80000011332c: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff800000113330: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000011333a: ff d0                	callq	*%rax
; 		tlb_invalidate(info->pml4, page2kva(page));
ffff80000011333c: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113340: 48 8b 00             	movq	(%rax), %rax
ffff800000113343: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000113347: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff80000011334b: 48 b8 70 34 11 00 00 80 ff ff	movabsq	$-140737487227792, %rax # imm = 0xFFFF800000113470
ffff800000113355: ff d0                	callq	*%rax
ffff800000113357: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff80000011335b: 48 89 c6             	movq	%rax, %rsi
ffff80000011335e: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff800000113368: ff d0                	callq	*%rax
; 	if((info->flags & PAGE_HUGE) == 0){
ffff80000011336a: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011336e: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000113372: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000113378: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011337c: 0f 85 24 00 00 00    	jne	0xffff8000001133a6 <insert_pde+0xd6>
; 		return ptbl_alloc(entry, base, end, walker);
ffff800000113382: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113386: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff80000011338a: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff80000011338e: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113392: 48 b8 b0 3d 11 00 00 80 ff ff	movabsq	$-140737487225424, %rax # imm = 0xFFFF800000113DB0
ffff80000011339c: ff d0                	callq	*%rax
ffff80000011339e: 89 45 fc             	movl	%eax, -4(%rbp)
ffff8000001133a1: e9 41 00 00 00       	jmp	0xffff8000001133e7 <insert_pde+0x117>
; 	info->page->pp_ref++;
ffff8000001133a6: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001133aa: 48 8b 40 08          	movq	8(%rax), %rax
ffff8000001133ae: 66 8b 48 10          	movw	16(%rax), %cx
ffff8000001133b2: 66 83 c1 01          	addw	$1, %cx
ffff8000001133b6: 66 89 48 10          	movw	%cx, 16(%rax)
; 	*entry = page2pa(info->page) | info->flags;
ffff8000001133ba: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001133be: 48 8b 78 08          	movq	8(%rax), %rdi
ffff8000001133c2: 48 b8 b0 34 11 00 00 80 ff ff	movabsq	$-140737487227728, %rax # imm = 0xFFFF8000001134B0
ffff8000001133cc: ff d0                	callq	*%rax
ffff8000001133ce: 48 89 c1             	movq	%rax, %rcx
ffff8000001133d1: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001133d5: 48 0b 48 10          	orq	16(%rax), %rcx
ffff8000001133d9: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001133dd: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001133e0: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001133e7: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001133ea: 48 83 c4 50          	addq	$80, %rsp
ffff8000001133ee: 5d                   	popq	%rbp
ffff8000001133ef: c3                   	retq

ffff8000001133f0 <pa2page>:
; {
ffff8000001133f0: 55                   	pushq	%rbp
ffff8000001133f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001133f4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001133f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001133fc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113400: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000113404: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011340e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113411: 48 39 c8             	cmpq	%rcx, %rax
ffff800000113414: 0f 82 27 00 00 00    	jb	0xffff800000113441 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011341a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000113424: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000011342e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000113438: 31 c0                	xorl	%eax, %eax
ffff80000011343a: be 49 00 00 00       	movl	$73, %esi
ffff80000011343f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000113441: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011344b: 48 8b 00             	movq	(%rax), %rax
ffff80000011344e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113452: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000113456: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011345a: 48 01 c8             	addq	%rcx, %rax
ffff80000011345d: 48 83 c4 10          	addq	$16, %rsp
ffff800000113461: 5d                   	popq	%rbp
ffff800000113462: c3                   	retq
ffff800000113463: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011346d: 0f 1f 00             	nopl	(%rax)

ffff800000113470 <page2kva>:
; {
ffff800000113470: 55                   	pushq	%rbp
ffff800000113471: 48 89 e5             	movq	%rsp, %rbp
ffff800000113474: 48 83 ec 10          	subq	$16, %rsp
ffff800000113478: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff80000011347c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113480: 48 b8 b0 34 11 00 00 80 ff ff	movabsq	$-140737487227728, %rax # imm = 0xFFFF8000001134B0
ffff80000011348a: ff d0                	callq	*%rax
ffff80000011348c: 48 89 c2             	movq	%rax, %rdx
ffff80000011348f: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000113499: 48 b8 e0 34 11 00 00 80 ff ff	movabsq	$-140737487227680, %rax # imm = 0xFFFF8000001134E0
ffff8000001134a3: be 50 00 00 00       	movl	$80, %esi
ffff8000001134a8: ff d0                	callq	*%rax
ffff8000001134aa: 48 83 c4 10          	addq	$16, %rsp
ffff8000001134ae: 5d                   	popq	%rbp
ffff8000001134af: c3                   	retq

ffff8000001134b0 <page2pa>:
; {
ffff8000001134b0: 55                   	pushq	%rbp
ffff8000001134b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001134b4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff8000001134b8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001134bc: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff8000001134c6: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001134c9: 48 29 c8             	subq	%rcx, %rax
ffff8000001134cc: 48 c1 f8 05          	sarq	$5, %rax
ffff8000001134d0: 48 c1 e0 0c          	shlq	$12, %rax
ffff8000001134d4: 5d                   	popq	%rbp
ffff8000001134d5: c3                   	retq
ffff8000001134d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001134e0 <_kaddr>:
; {
ffff8000001134e0: 55                   	pushq	%rbp
ffff8000001134e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001134e4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001134e8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001134ec: 89 75 f4             	movl	%esi, -12(%rbp)
ffff8000001134ef: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff8000001134f3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001134f7: 48 c1 e8 0c          	shrq	$12, %rax
ffff8000001134fb: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000113505: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113508: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011350b: 0f 82 24 00 00 00    	jb	0xffff800000113535 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000113511: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113515: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000113518: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011351c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
ffff800000113526: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000113530: 31 c0                	xorl	%eax, %eax
ffff800000113532: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff800000113535: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000011353f: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff800000113543: 48 83 c4 20          	addq	$32, %rsp
ffff800000113547: 5d                   	popq	%rbp
ffff800000113548: c3                   	retq
ffff800000113549: cc                   	int3
ffff80000011354a: cc                   	int3
ffff80000011354b: cc                   	int3
ffff80000011354c: cc                   	int3
ffff80000011354d: cc                   	int3
ffff80000011354e: cc                   	int3
ffff80000011354f: cc                   	int3

ffff800000113550 <page_lookup>:
; {
ffff800000113550: 55                   	pushq	%rbp
ffff800000113551: 48 89 e5             	movq	%rsp, %rbp
ffff800000113554: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff80000011355b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011355f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113563: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	struct lookup_info info = {
ffff800000113567: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	struct page_walker walker = {
ffff80000011356f: 48 b8 60 36 11 00 00 80 ff ff	movabsq	$-140737487227296, %rax # imm = 0xFFFF800000113660
ffff800000113579: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff80000011357d: 48 b8 b0 36 11 00 00 80 ff ff	movabsq	$-140737487227216, %rax # imm = 0xFFFF8000001136B0
ffff800000113587: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff80000011358b: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff800000113593: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff80000011359b: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff8000001135a3: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001135ab: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff8000001135b3: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff8000001135bb: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.udata = &info,
ffff8000001135c3: 48 8d 45 d8          	leaq	-40(%rbp), %rax
; 	struct page_walker walker = {
ffff8000001135c7: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001135cb: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001135cf: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff8000001135d3: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff8000001135d7: 48 81 c2 00 10 00 00 	addq	$4096, %rdx             # imm = 0x1000
ffff8000001135de: 48 b8 50 48 11 00 00 80 ff ff	movabsq	$-140737487222704, %rax # imm = 0xFFFF800000114850
ffff8000001135e8: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
ffff8000001135ec: ff d0                	callq	*%rax
; 			    &walker) < 0)
ffff8000001135ee: 83 f8 00             	cmpl	$0, %eax
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff8000001135f1: 0f 8d 0d 00 00 00    	jge	0xffff800000113604 <page_lookup+0xb4>
; 		return NULL;
ffff8000001135f7: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff8000001135ff: e9 4f 00 00 00       	jmp	0xffff800000113653 <page_lookup+0x103>
; 	if(info.entry == NULL) return NULL;
ffff800000113604: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff800000113609: 0f 85 0d 00 00 00    	jne	0xffff80000011361c <page_lookup+0xcc>
ffff80000011360f: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
ffff800000113617: e9 37 00 00 00       	jmp	0xffff800000113653 <page_lookup+0x103>
; 	if(entry_store != NULL) *entry_store = info.entry;
ffff80000011361c: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff800000113621: 0f 84 0b 00 00 00    	je	0xffff800000113632 <page_lookup+0xe2>
ffff800000113627: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000011362b: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011362f: 48 89 08             	movq	%rcx, (%rax)
; 	return pa2page(PAGE_ADDR(*info.entry));
ffff800000113632: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113636: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113640: 48 23 38             	andq	(%rax), %rdi
ffff800000113643: 48 b8 00 37 11 00 00 80 ff ff	movabsq	$-140737487227136, %rax # imm = 0xFFFF800000113700
ffff80000011364d: ff d0                	callq	*%rax
ffff80000011364f: 48 89 45 f8          	movq	%rax, -8(%rbp)
; }
ffff800000113653: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113657: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000011365e: 5d                   	popq	%rbp
ffff80000011365f: c3                   	retq

ffff800000113660 <lookup_pte>:
; {
ffff800000113660: 55                   	pushq	%rbp
ffff800000113661: 48 89 e5             	movq	%rsp, %rbp
ffff800000113664: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113668: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff80000011366c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113670: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct lookup_info *info = walker->udata;
ffff800000113674: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113678: 48 8b 40 48          	movq	72(%rax), %rax
ffff80000011367c: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT){
ffff800000113680: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113684: 48 8b 00             	movq	(%rax), %rax
ffff800000113687: 48 83 e0 01          	andq	$1, %rax
ffff80000011368b: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011368f: 0f 84 0b 00 00 00    	je	0xffff8000001136a0 <lookup_pte+0x40>
; 		info->entry = entry;
ffff800000113695: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113699: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011369d: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001136a0: 31 c0                	xorl	%eax, %eax
ffff8000001136a2: 5d                   	popq	%rbp
ffff8000001136a3: c3                   	retq
ffff8000001136a4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001136ae: 66 90                	nop

ffff8000001136b0 <lookup_pde>:
; {
ffff8000001136b0: 55                   	pushq	%rbp
ffff8000001136b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001136b4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001136b8: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001136bc: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001136c0: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct lookup_info *info = walker->udata;
ffff8000001136c4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001136c8: 48 8b 40 48          	movq	72(%rax), %rax
ffff8000001136cc: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & (PAGE_HUGE | PAGE_PRESENT)){
ffff8000001136d0: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001136d4: 48 8b 00             	movq	(%rax), %rax
ffff8000001136d7: 48 25 81 00 00 00    	andq	$129, %rax
ffff8000001136dd: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001136e1: 0f 84 0b 00 00 00    	je	0xffff8000001136f2 <lookup_pde+0x42>
; 		info->entry = entry;
ffff8000001136e7: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001136eb: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001136ef: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001136f2: 31 c0                	xorl	%eax, %eax
ffff8000001136f4: 5d                   	popq	%rbp
ffff8000001136f5: c3                   	retq
ffff8000001136f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113700 <pa2page>:
; {
ffff800000113700: 55                   	pushq	%rbp
ffff800000113701: 48 89 e5             	movq	%rsp, %rbp
ffff800000113704: 48 83 ec 10          	subq	$16, %rsp
ffff800000113708: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011370c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113710: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000113714: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011371e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113721: 48 39 c8             	cmpq	%rcx, %rax
ffff800000113724: 0f 82 27 00 00 00    	jb	0xffff800000113751 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011372a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000113734: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000011373e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000113748: 31 c0                	xorl	%eax, %eax
ffff80000011374a: be 49 00 00 00       	movl	$73, %esi
ffff80000011374f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000113751: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011375b: 48 8b 00             	movq	(%rax), %rax
ffff80000011375e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000113762: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000113766: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011376a: 48 01 c8             	addq	%rcx, %rax
ffff80000011376d: 48 83 c4 10          	addq	$16, %rsp
ffff800000113771: 5d                   	popq	%rbp
ffff800000113772: c3                   	retq
ffff800000113773: cc                   	int3
ffff800000113774: cc                   	int3
ffff800000113775: cc                   	int3
ffff800000113776: cc                   	int3
ffff800000113777: cc                   	int3
ffff800000113778: cc                   	int3
ffff800000113779: cc                   	int3
ffff80000011377a: cc                   	int3
ffff80000011377b: cc                   	int3
ffff80000011377c: cc                   	int3
ffff80000011377d: cc                   	int3
ffff80000011377e: cc                   	int3
ffff80000011377f: cc                   	int3

ffff800000113780 <boot_map_region>:
; {
ffff800000113780: 55                   	pushq	%rbp
ffff800000113781: 48 89 e5             	movq	%rsp, %rbp
ffff800000113784: 48 81 ec e0 00 00 00 	subq	$224, %rsp
ffff80000011378b: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011378f: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113793: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113797: 48 89 4d e0          	movq	%rcx, -32(%rbp)
ffff80000011379b: 4c 89 45 d8          	movq	%r8, -40(%rbp)
; 	struct boot_map_info info = {
ffff80000011379f: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
; 		.flags = flags,
ffff8000001137a7: 48 8b 45 d8          	movq	-40(%rbp), %rax
; 	struct boot_map_info info = {
ffff8000001137ab: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		.pa = pa,
ffff8000001137af: 48 8b 45 e0          	movq	-32(%rbp), %rax
; 	struct boot_map_info info = {
ffff8000001137b3: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff8000001137b7: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001137bb: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001137bf: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff8000001137c3: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff8000001137c9: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff8000001137cd: 48 8b 45 a0          	movq	-96(%rbp), %rax
; 	struct boot_map_info info = {
ffff8000001137d1: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff8000001137d5: 48 c7 45 98 00 10 00 00      	movq	$4096, -104(%rbp) # imm = 0x1000
ffff8000001137dd: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001137e1: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001137e5: 48 01 c1             	addq	%rax, %rcx
ffff8000001137e8: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff8000001137ec: 48 8d 44 08 ff       	leaq	-1(%rax,%rcx), %rax
ffff8000001137f1: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff8000001137f5: 48 8b 45 88          	movq	-120(%rbp), %rax
ffff8000001137f9: 48 89 85 28 ff ff ff 	movq	%rax, -216(%rbp)
ffff800000113800: 48 8b 4d 98          	movq	-104(%rbp), %rcx
ffff800000113804: 31 d2                	xorl	%edx, %edx
ffff800000113806: 48 f7 f1             	divq	%rcx
ffff800000113809: 48 8b 85 28 ff ff ff 	movq	-216(%rbp), %rax
ffff800000113810: 48 29 d0             	subq	%rdx, %rax
ffff800000113813: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff800000113817: 48 8b 45 80          	movq	-128(%rbp), %rax
ffff80000011381b: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff80000011381f: 48 8b 45 90          	movq	-112(%rbp), %rax
ffff800000113823: 48 83 c0 ff          	addq	$-1, %rax
; 	struct boot_map_info info = {
ffff800000113827: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	struct page_walker walker = {
ffff80000011382b: 48 b8 e0 38 11 00 00 80 ff ff	movabsq	$-140737487226656, %rax # imm = 0xFFFF8000001138E0
ffff800000113835: 48 89 85 30 ff ff ff 	movq	%rax, -208(%rbp)
ffff80000011383c: 48 b8 50 39 11 00 00 80 ff ff	movabsq	$-140737487226544, %rax # imm = 0xFFFF800000113950
ffff800000113846: 48 89 85 38 ff ff ff 	movq	%rax, -200(%rbp)
ffff80000011384d: 48 b8 a0 3a 11 00 00 80 ff ff	movabsq	$-140737487226208, %rax # imm = 0xFFFF800000113AA0
ffff800000113857: 48 89 85 40 ff ff ff 	movq	%rax, -192(%rbp)
ffff80000011385e: 48 b8 e0 3a 11 00 00 80 ff ff	movabsq	$-140737487226144, %rax # imm = 0xFFFF800000113AE0
ffff800000113868: 48 89 85 48 ff ff ff 	movq	%rax, -184(%rbp)
ffff80000011386f: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff80000011387a: 48 c7 85 58 ff ff ff 00 00 00 00     	movq	$0, -168(%rbp)
ffff800000113885: 48 c7 85 60 ff ff ff 00 00 00 00     	movq	$0, -160(%rbp)
ffff800000113890: 48 c7 85 68 ff ff ff 00 00 00 00     	movq	$0, -152(%rbp)
ffff80000011389b: 48 c7 85 70 ff ff ff 00 00 00 00     	movq	$0, -144(%rbp)
; 		.udata = &info,
ffff8000001138a6: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	struct page_walker walker = {
ffff8000001138aa: 48 89 85 78 ff ff ff 	movq	%rax, -136(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff8000001138b1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001138b5: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001138b9: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff8000001138bd: 48 03 55 e8          	addq	-24(%rbp), %rdx
ffff8000001138c1: 48 b8 50 48 11 00 00 80 ff ff	movabsq	$-140737487222704, %rax # imm = 0xFFFF800000114850
ffff8000001138cb: 48 8d 8d 30 ff ff ff 	leaq	-208(%rbp), %rcx
ffff8000001138d2: ff d0                	callq	*%rax
; }
ffff8000001138d4: 48 81 c4 e0 00 00 00 	addq	$224, %rsp
ffff8000001138db: 5d                   	popq	%rbp
ffff8000001138dc: c3                   	retq
ffff8000001138dd: 0f 1f 00             	nopl	(%rax)

ffff8000001138e0 <boot_map_pte>:
; {
ffff8000001138e0: 55                   	pushq	%rbp
ffff8000001138e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001138e4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001138e8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001138ec: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001138f0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001138f4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff8000001138f8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001138fc: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113900: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	int res = claim_entry(entry, base, end, walker);
ffff800000113904: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113908: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011390c: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113910: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113914: 48 b8 e0 3c 11 00 00 80 ff ff	movabsq	$-140737487225632, %rax # imm = 0xFFFF800000113CE0
ffff80000011391e: ff d0                	callq	*%rax
ffff800000113920: 89 45 d4             	movl	%eax, -44(%rbp)
; 	if(res >= 0) info->pa, info->base += PAGE_SIZE;
ffff800000113923: 83 7d d4 00          	cmpl	$0, -44(%rbp)
ffff800000113927: 0f 8c 13 00 00 00    	jl	0xffff800000113940 <boot_map_pte+0x60>
ffff80000011392d: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113931: 48 8b 48 18          	movq	24(%rax), %rcx
ffff800000113935: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff80000011393c: 48 89 48 18          	movq	%rcx, 24(%rax)
; 	return res;
ffff800000113940: 8b 45 d4             	movl	-44(%rbp), %eax
ffff800000113943: 48 83 c4 30          	addq	$48, %rsp
ffff800000113947: 5d                   	popq	%rbp
ffff800000113948: c3                   	retq
ffff800000113949: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000113950 <boot_map_pde>:
; {
ffff800000113950: 55                   	pushq	%rbp
ffff800000113951: 48 89 e5             	movq	%rsp, %rbp
ffff800000113954: 48 83 ec 30          	subq	$48, %rsp
ffff800000113958: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011395c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113960: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113964: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff800000113968: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011396c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113970: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	int res = 0;
ffff800000113974: c7 45 d4 00 00 00 00 	movl	$0, -44(%rbp)
; 	if(hpage_aligned(info->pa) && (info->end - info->base) > HPAGE_SIZE){
ffff80000011397b: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011397f: 48 8b 78 10          	movq	16(%rax), %rdi
ffff800000113983: 48 b8 80 3d 11 00 00 80 ff ff	movabsq	$-140737487225472, %rax # imm = 0xFFFF800000113D80
ffff80000011398d: ff d0                	callq	*%rax
ffff80000011398f: 83 f8 00             	cmpl	$0, %eax
ffff800000113992: 0f 84 66 00 00 00    	je	0xffff8000001139fe <boot_map_pde+0xae>
ffff800000113998: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011399c: 48 8b 40 20          	movq	32(%rax), %rax
ffff8000001139a0: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001139a4: 48 2b 41 18          	subq	24(%rcx), %rax
ffff8000001139a8: 48 3d 00 00 20 00    	cmpq	$2097152, %rax          # imm = 0x200000
ffff8000001139ae: 0f 86 4a 00 00 00    	jbe	0xffff8000001139fe <boot_map_pde+0xae>
; 		*entry ^= *entry;
ffff8000001139b4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001139b8: 48 8b 08             	movq	(%rax), %rcx
ffff8000001139bb: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001139bf: 48 33 08             	xorq	(%rax), %rcx
ffff8000001139c2: 48 89 08             	movq	%rcx, (%rax)
; 		*entry |= info->pa | info->flags | PAGE_HUGE;
ffff8000001139c5: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001139c9: 48 8b 48 10          	movq	16(%rax), %rcx
ffff8000001139cd: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001139d1: 48 0b 48 08          	orq	8(%rax), %rcx
ffff8000001139d5: 48 81 c9 80 00 00 00 	orq	$128, %rcx
ffff8000001139dc: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001139e0: 48 0b 08             	orq	(%rax), %rcx
ffff8000001139e3: 48 89 08             	movq	%rcx, (%rax)
; 		info->pa, info->base += HPAGE_SIZE;
ffff8000001139e6: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001139ea: 48 8b 48 18          	movq	24(%rax), %rcx
ffff8000001139ee: 48 81 c1 00 00 20 00 	addq	$2097152, %rcx          # imm = 0x200000
ffff8000001139f5: 48 89 48 18          	movq	%rcx, 24(%rax)
; 	}else{
ffff8000001139f9: e9 92 00 00 00       	jmp	0xffff800000113a90 <boot_map_pde+0x140>
; 		if(*entry & PAGE_PRESENT){
ffff8000001139fe: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113a02: 48 8b 00             	movq	(%rax), %rax
ffff800000113a05: 48 83 e0 01          	andq	$1, %rax
ffff800000113a09: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113a0d: 0f 84 24 00 00 00    	je	0xffff800000113a37 <boot_map_pde+0xe7>
; 			res = ptbl_split(entry, base, end, walker);
ffff800000113a13: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113a17: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113a1b: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113a1f: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113a23: 48 b8 90 3e 11 00 00 80 ff ff	movabsq	$-140737487225200, %rax # imm = 0xFFFF800000113E90
ffff800000113a2d: ff d0                	callq	*%rax
ffff800000113a2f: 89 45 d4             	movl	%eax, -44(%rbp)
; 		}else{
ffff800000113a32: e9 1f 00 00 00       	jmp	0xffff800000113a56 <boot_map_pde+0x106>
; 			res = ptbl_alloc(entry, base, end, walker);
ffff800000113a37: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113a3b: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113a3f: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113a43: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113a47: 48 b8 b0 3d 11 00 00 80 ff ff	movabsq	$-140737487225424, %rax # imm = 0xFFFF800000113DB0
ffff800000113a51: ff d0                	callq	*%rax
ffff800000113a53: 89 45 d4             	movl	%eax, -44(%rbp)
; 		if(res >= 0) {
ffff800000113a56: 83 7d d4 00          	cmpl	$0, -44(%rbp)
ffff800000113a5a: 0f 8c 2b 00 00 00    	jl	0xffff800000113a8b <boot_map_pde+0x13b>
; 			*entry ^= *entry;
ffff800000113a60: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113a64: 48 8b 08             	movq	(%rax), %rcx
ffff800000113a67: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113a6b: 48 33 08             	xorq	(%rax), %rcx
ffff800000113a6e: 48 89 08             	movq	%rcx, (%rax)
; 			*entry |= info->pa | info->flags;
ffff800000113a71: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113a75: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113a79: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113a7d: 48 0b 48 08          	orq	8(%rax), %rcx
ffff800000113a81: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113a85: 48 0b 08             	orq	(%rax), %rcx
ffff800000113a88: 48 89 08             	movq	%rcx, (%rax)
ffff800000113a8b: e9 00 00 00 00       	jmp	0xffff800000113a90 <boot_map_pde+0x140>
; 	return res;
ffff800000113a90: 8b 45 d4             	movl	-44(%rbp), %eax
ffff800000113a93: 48 83 c4 30          	addq	$48, %rsp
ffff800000113a97: 5d                   	popq	%rbp
ffff800000113a98: c3                   	retq
ffff800000113a99: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000113aa0 <boot_map_pdpte>:
; {
ffff800000113aa0: 55                   	pushq	%rbp
ffff800000113aa1: 48 89 e5             	movq	%rsp, %rbp
ffff800000113aa4: 48 83 ec 20          	subq	$32, %rsp
ffff800000113aa8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113aac: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113ab0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113ab4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	return claim_entry(entry, base, end, walker);
ffff800000113ab8: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113abc: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113ac0: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113ac4: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113ac8: 48 b8 e0 3c 11 00 00 80 ff ff	movabsq	$-140737487225632, %rax # imm = 0xFFFF800000113CE0
ffff800000113ad2: ff d0                	callq	*%rax
ffff800000113ad4: 48 83 c4 20          	addq	$32, %rsp
ffff800000113ad8: 5d                   	popq	%rbp
ffff800000113ad9: c3                   	retq
ffff800000113ada: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000113ae0 <boot_map_pml4>:
; {
ffff800000113ae0: 55                   	pushq	%rbp
ffff800000113ae1: 48 89 e5             	movq	%rsp, %rbp
ffff800000113ae4: 48 83 ec 30          	subq	$48, %rsp
ffff800000113ae8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113aec: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113af0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113af4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff800000113af8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113afc: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113b00: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	return claim_entry(entry, base, end, walker);
ffff800000113b04: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113b08: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113b0c: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113b10: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113b14: 48 b8 e0 3c 11 00 00 80 ff ff	movabsq	$-140737487225632, %rax # imm = 0xFFFF800000113CE0
ffff800000113b1e: ff d0                	callq	*%rax
ffff800000113b20: 48 83 c4 30          	addq	$48, %rsp
ffff800000113b24: 5d                   	popq	%rbp
ffff800000113b25: c3                   	retq
ffff800000113b26: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113b30 <boot_map_kernel>:
; {
ffff800000113b30: 55                   	pushq	%rbp
ffff800000113b31: 48 89 e5             	movq	%rsp, %rbp
ffff800000113b34: 48 83 ec 40          	subq	$64, %rsp
ffff800000113b38: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113b3c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	    (struct elf_proghdr *)((char *)elf_hdr + elf_hdr->e_phoff);
ffff800000113b40: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113b44: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113b48: 48 03 41 20          	addq	32(%rcx), %rax
; 	struct elf_proghdr *prog_start =
ffff800000113b4c: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	boot_map_region(pml4, (void*) KERNEL_VMA, BOOT_MAP_LIM, PADDR((void*)KERNEL_VMA), PAGE_KMASK);
ffff800000113b50: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113b54: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000113b58: 48 bf 37 96 11 00 00 80 ff ff	movabsq	$-140737487202761, %rdi # imm = 0xFFFF800000119637
ffff800000113b62: 48 b8 70 3c 11 00 00 80 ff ff	movabsq	$-140737487225744, %rax # imm = 0xFFFF800000113C70
ffff800000113b6c: be 95 00 00 00       	movl	$149, %esi
ffff800000113b71: 48 ba 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rdx # imm = 0xFFFF800000000000
ffff800000113b7b: ff d0                	callq	*%rax
ffff800000113b7d: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000113b81: 48 89 c1             	movq	%rax, %rcx
ffff800000113b84: 48 b8 80 37 11 00 00 80 ff ff	movabsq	$-140737487227008, %rax # imm = 0xFFFF800000113780
ffff800000113b8e: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff800000113b98: ba 00 00 80 00       	movl	$8388608, %edx          # imm = 0x800000
ffff800000113b9d: 49 b8 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %r8 # imm = 0x8000000000000003
ffff800000113ba7: ff d0                	callq	*%rax
; 	uint64_t flags = 0;
ffff800000113ba9: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000113bb1: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000113bb9: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113bbd: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113bc1: 0f b7 49 38          	movzwl	56(%rcx), %ecx
ffff800000113bc5: 48 39 c8             	cmpq	%rcx, %rax
ffff800000113bc8: 0f 83 96 00 00 00    	jae	0xffff800000113c64 <boot_map_kernel+0x134>
; 		prog_hdr = prog_start + i;
ffff800000113bce: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113bd2: 48 6b 4d d0 38       	imulq	$56, -48(%rbp), %rcx
ffff800000113bd7: 48 01 c8             	addq	%rcx, %rax
ffff800000113bda: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		if(prog_hdr->p_va < KERNEL_VMA) continue;
ffff800000113bde: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113be2: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff800000113bec: 48 39 48 10          	cmpq	%rcx, 16(%rax)
ffff800000113bf0: 0f 83 05 00 00 00    	jae	0xffff800000113bfb <boot_map_kernel+0xcb>
ffff800000113bf6: e9 58 00 00 00       	jmp	0xffff800000113c53 <boot_map_kernel+0x123>
; 		if(prog_hdr->p_flags & ELF_PROG_FLAG_WRITE) flags |= PAGE_WRITE;
ffff800000113bfb: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113bff: 8b 40 04             	movl	4(%rax), %eax
ffff800000113c02: 83 e0 02             	andl	$2, %eax
ffff800000113c05: 83 f8 00             	cmpl	$0, %eax
ffff800000113c08: 0f 84 0c 00 00 00    	je	0xffff800000113c1a <boot_map_kernel+0xea>
ffff800000113c0e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113c12: 48 83 c8 02          	orq	$2, %rax
ffff800000113c16: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		if(!(prog_hdr->p_flags & ELF_PROG_FLAG_EXEC)) flags |= PAGE_NO_EXEC; //CHECK AGAIN IF THIS IS THE CORRECT WAY TO CHECK THE FLAGS
ffff800000113c1a: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113c1e: 8b 40 04             	movl	4(%rax), %eax
ffff800000113c21: 83 e0 01             	andl	$1, %eax
ffff800000113c24: 83 f8 00             	cmpl	$0, %eax
ffff800000113c27: 0f 85 12 00 00 00    	jne	0xffff800000113c3f <boot_map_kernel+0x10f>
ffff800000113c2d: 48 b8 00 00 00 00 00 00 00 80	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
ffff800000113c37: 48 0b 45 d8          	orq	-40(%rbp), %rax
ffff800000113c3b: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		flags |= PF_PRESENT;
ffff800000113c3f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113c43: 48 83 c8 01          	orq	$1, %rax
ffff800000113c47: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		flags = 0;
ffff800000113c4b: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for(size_t i = 0; i < elf_hdr->e_phnum; i++){
ffff800000113c53: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113c57: 48 83 c0 01          	addq	$1, %rax
ffff800000113c5b: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000113c5f: e9 55 ff ff ff       	jmp	0xffff800000113bb9 <boot_map_kernel+0x89>
; }
ffff800000113c64: 48 83 c4 40          	addq	$64, %rsp
ffff800000113c68: 5d                   	popq	%rbp
ffff800000113c69: c3                   	retq
ffff800000113c6a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000113c70 <_paddr>:
; {
ffff800000113c70: 55                   	pushq	%rbp
ffff800000113c71: 48 89 e5             	movq	%rsp, %rbp
ffff800000113c74: 48 83 ec 20          	subq	$32, %rsp
ffff800000113c78: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113c7c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff800000113c7f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000113c83: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113c87: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff800000113c91: 48 39 c8             	cmpq	%rcx, %rax
ffff800000113c94: 0f 83 24 00 00 00    	jae	0xffff800000113cbe <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff800000113c9a: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113c9e: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000113ca1: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000113ca5: 48 ba ed 87 11 00 00 80 ff ff	movabsq	$-140737487206419, %rdx # imm = 0xFFFF8000001187ED
ffff800000113caf: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000113cb9: 31 c0                	xorl	%eax, %eax
ffff800000113cbb: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff800000113cbe: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000113cc2: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff800000113ccc: 48 29 c8             	subq	%rcx, %rax
ffff800000113ccf: 48 83 c4 20          	addq	$32, %rsp
ffff800000113cd3: 5d                   	popq	%rbp
ffff800000113cd4: c3                   	retq
ffff800000113cd5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000113cdf: 90                   	nop

ffff800000113ce0 <claim_entry>:
; static int claim_entry(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
ffff800000113ce0: 55                   	pushq	%rbp
ffff800000113ce1: 48 89 e5             	movq	%rsp, %rbp
ffff800000113ce4: 48 83 ec 30          	subq	$48, %rsp
ffff800000113ce8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000113cec: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000113cf0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000113cf4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct boot_map_info *info = walker->udata;
ffff800000113cf8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000113cfc: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000113d00: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	int res = 0;
ffff800000113d04: c7 45 d4 00 00 00 00 	movl	$0, -44(%rbp)
; 	if(!(*entry & PAGE_PRESENT)) {
ffff800000113d0b: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d0f: 48 8b 00             	movq	(%rax), %rax
ffff800000113d12: 48 83 e0 01          	andq	$1, %rax
ffff800000113d16: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113d1a: 0f 85 1f 00 00 00    	jne	0xffff800000113d3f <claim_entry+0x5f>
; 		res = ptbl_alloc(entry, base, end, walker);
ffff800000113d20: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000113d24: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000113d28: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000113d2c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000113d30: 48 b8 b0 3d 11 00 00 80 ff ff	movabsq	$-140737487225424, %rax # imm = 0xFFFF800000113DB0
ffff800000113d3a: ff d0                	callq	*%rax
ffff800000113d3c: 89 45 d4             	movl	%eax, -44(%rbp)
; 	if(res >= 0) {
ffff800000113d3f: 83 7d d4 00          	cmpl	$0, -44(%rbp)
ffff800000113d43: 0f 8c 2b 00 00 00    	jl	0xffff800000113d74 <claim_entry+0x94>
; 		*entry ^= *entry;
ffff800000113d49: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d4d: 48 8b 08             	movq	(%rax), %rcx
ffff800000113d50: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d54: 48 33 08             	xorq	(%rax), %rcx
ffff800000113d57: 48 89 08             	movq	%rcx, (%rax)
; 		*entry |= info->pa | info->flags;
ffff800000113d5a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113d5e: 48 8b 48 10          	movq	16(%rax), %rcx
ffff800000113d62: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000113d66: 48 0b 48 08          	orq	8(%rax), %rcx
ffff800000113d6a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d6e: 48 0b 08             	orq	(%rax), %rcx
ffff800000113d71: 48 89 08             	movq	%rcx, (%rax)
; 	return res;
ffff800000113d74: 8b 45 d4             	movl	-44(%rbp), %eax
ffff800000113d77: 48 83 c4 30          	addq	$48, %rsp
ffff800000113d7b: 5d                   	popq	%rbp
ffff800000113d7c: c3                   	retq
ffff800000113d7d: 0f 1f 00             	nopl	(%rax)

ffff800000113d80 <hpage_aligned>:
; {
ffff800000113d80: 55                   	pushq	%rbp
ffff800000113d81: 48 89 e5             	movq	%rsp, %rbp
ffff800000113d84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return !(p & (HPAGE_SIZE - 1));
ffff800000113d88: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113d8c: 48 25 ff ff 1f 00    	andq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000113d92: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113d96: 0f 95 c0             	setne	%al
ffff800000113d99: 34 ff                	xorb	$-1, %al
ffff800000113d9b: 24 01                	andb	$1, %al
ffff800000113d9d: 0f b6 c0             	movzbl	%al, %eax
ffff800000113da0: 5d                   	popq	%rbp
ffff800000113da1: c3                   	retq
ffff800000113da2: cc                   	int3
ffff800000113da3: cc                   	int3
ffff800000113da4: cc                   	int3
ffff800000113da5: cc                   	int3
ffff800000113da6: cc                   	int3
ffff800000113da7: cc                   	int3
ffff800000113da8: cc                   	int3
ffff800000113da9: cc                   	int3
ffff800000113daa: cc                   	int3
ffff800000113dab: cc                   	int3
ffff800000113dac: cc                   	int3
ffff800000113dad: cc                   	int3
ffff800000113dae: cc                   	int3
ffff800000113daf: cc                   	int3

ffff800000113db0 <ptbl_alloc>:
; {
ffff800000113db0: 55                   	pushq	%rbp
ffff800000113db1: 48 89 e5             	movq	%rsp, %rbp
ffff800000113db4: 48 83 ec 40          	subq	$64, %rsp
ffff800000113db8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000113dbc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113dc0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113dc4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if(*entry & PAGE_PRESENT) return 0;
ffff800000113dc8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113dcc: 48 8b 00             	movq	(%rax), %rax
ffff800000113dcf: 48 83 e0 01          	andq	$1, %rax
ffff800000113dd3: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113dd7: 0f 84 0c 00 00 00    	je	0xffff800000113de9 <ptbl_alloc+0x39>
ffff800000113ddd: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000113de4: e9 6e 00 00 00       	jmp	0xffff800000113e57 <ptbl_alloc+0xa7>
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff800000113de9: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113df3: bf 01 00 00 00       	movl	$1, %edi
ffff800000113df8: ff d0                	callq	*%rax
ffff800000113dfa: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(new_table == NULL) return -1;
ffff800000113dfe: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000113e03: 0f 85 0c 00 00 00    	jne	0xffff800000113e15 <ptbl_alloc+0x65>
ffff800000113e09: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113e10: e9 42 00 00 00       	jmp	0xffff800000113e57 <ptbl_alloc+0xa7>
; 	new_table->pp_ref++;
ffff800000113e15: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113e19: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113e1d: 66 83 c1 01          	addw	$1, %cx
ffff800000113e21: 66 89 48 10          	movw	%cx, 16(%rax)
; 	physaddr_t table_addr = page2pa(new_table);
ffff800000113e25: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113e29: 48 b8 60 3e 11 00 00 80 ff ff	movabsq	$-140737487225248, %rax # imm = 0xFFFF800000113E60
ffff800000113e33: ff d0                	callq	*%rax
ffff800000113e35: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	*entry = table_addr | PAGE_PRESENT | PAGE_WRITE | PAGE_USER;
ffff800000113e39: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff800000113e3d: 48 83 c9 01          	orq	$1, %rcx
ffff800000113e41: 48 83 c9 02          	orq	$2, %rcx
ffff800000113e45: 48 83 c9 04          	orq	$4, %rcx
ffff800000113e49: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113e4d: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff800000113e50: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000113e57: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000113e5a: 48 83 c4 40          	addq	$64, %rsp
ffff800000113e5e: 5d                   	popq	%rbp
ffff800000113e5f: c3                   	retq

ffff800000113e60 <page2pa>:
; {
ffff800000113e60: 55                   	pushq	%rbp
ffff800000113e61: 48 89 e5             	movq	%rsp, %rbp
ffff800000113e64: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000113e68: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000113e6c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff800000113e76: 48 8b 09             	movq	(%rcx), %rcx
ffff800000113e79: 48 29 c8             	subq	%rcx, %rax
ffff800000113e7c: 48 c1 f8 05          	sarq	$5, %rax
ffff800000113e80: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000113e84: 5d                   	popq	%rbp
ffff800000113e85: c3                   	retq
ffff800000113e86: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113e90 <ptbl_split>:
; {
ffff800000113e90: 55                   	pushq	%rbp
ffff800000113e91: 48 89 e5             	movq	%rsp, %rbp
ffff800000113e94: 48 83 ec 50          	subq	$80, %rsp
ffff800000113e98: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000113e9c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000113ea0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000113ea4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if((*entry & PAGE_PRESENT) == 0){
ffff800000113ea8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113eac: 48 8b 00             	movq	(%rax), %rax
ffff800000113eaf: 48 83 e0 01          	andq	$1, %rax
ffff800000113eb3: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113eb7: 0f 85 24 00 00 00    	jne	0xffff800000113ee1 <ptbl_split+0x51>
; 		return ptbl_alloc(entry, base, end, walker);
ffff800000113ebd: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000113ec1: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000113ec5: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000113ec9: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000113ecd: 48 b8 b0 3d 11 00 00 80 ff ff	movabsq	$-140737487225424, %rax # imm = 0xFFFF800000113DB0
ffff800000113ed7: ff d0                	callq	*%rax
ffff800000113ed9: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000113edc: e9 c7 01 00 00       	jmp	0xffff8000001140a8 <ptbl_split+0x218>
; 	if((*entry & PAGE_HUGE) == 0){
ffff800000113ee1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113ee5: 48 8b 00             	movq	(%rax), %rax
ffff800000113ee8: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000113eee: 48 83 f8 00          	cmpq	$0, %rax
ffff800000113ef2: 0f 85 0c 00 00 00    	jne	0xffff800000113f04 <ptbl_split+0x74>
; 		return -1;
ffff800000113ef8: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113eff: e9 a4 01 00 00       	jmp	0xffff8000001140a8 <ptbl_split+0x218>
; 	struct page_info *new_table = page_alloc(ALLOC_ZERO);
ffff800000113f04: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113f0e: bf 01 00 00 00       	movl	$1, %edi
ffff800000113f13: ff d0                	callq	*%rax
ffff800000113f15: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if(new_table == NULL) return -1;
ffff800000113f19: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff800000113f1e: 0f 85 0c 00 00 00    	jne	0xffff800000113f30 <ptbl_split+0xa0>
ffff800000113f24: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113f2b: e9 78 01 00 00       	jmp	0xffff8000001140a8 <ptbl_split+0x218>
; 	new_table->pp_ref++;
ffff800000113f30: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000113f34: 66 8b 48 10          	movw	16(%rax), %cx
ffff800000113f38: 66 83 c1 01          	addw	$1, %cx
ffff800000113f3c: 66 89 48 10          	movw	%cx, 16(%rax)
; 	physaddr_t *new_table_entries = page2kva(new_table);
ffff800000113f40: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113f44: 48 b8 c0 40 11 00 00 80 ff ff	movabsq	$-140737487224640, %rax # imm = 0xFFFF8000001140C0
ffff800000113f4e: ff d0                	callq	*%rax
ffff800000113f50: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	void *old_data = page2kva(pa2page(PAGE_ADDR(*entry)));
ffff800000113f54: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000113f58: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000113f62: 48 23 38             	andq	(%rax), %rdi
ffff800000113f65: 48 b8 00 41 11 00 00 80 ff ff	movabsq	$-140737487224576, %rax # imm = 0xFFFF800000114100
ffff800000113f6f: ff d0                	callq	*%rax
ffff800000113f71: 48 89 c7             	movq	%rax, %rdi
ffff800000113f74: 48 b8 c0 40 11 00 00 80 ff ff	movabsq	$-140737487224640, %rax # imm = 0xFFFF8000001140C0
ffff800000113f7e: ff d0                	callq	*%rax
ffff800000113f80: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000113f84: c7 45 bc 00 00 00 00 	movl	$0, -68(%rbp)
ffff800000113f8b: 48 63 45 bc          	movslq	-68(%rbp), %rax
ffff800000113f8f: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff800000113f95: 0f 83 a6 00 00 00    	jae	0xffff800000114041 <ptbl_split+0x1b1>
; 		struct page_info *new_page = page_alloc(ALLOC_ZERO);
ffff800000113f9b: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000113fa5: bf 01 00 00 00       	movl	$1, %edi
ffff800000113faa: ff d0                	callq	*%rax
ffff800000113fac: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		if(new_page == NULL){
ffff800000113fb0: 48 83 7d b0 00       	cmpq	$0, -80(%rbp)
ffff800000113fb5: 0f 85 0c 00 00 00    	jne	0xffff800000113fc7 <ptbl_split+0x137>
; 			return -1;
ffff800000113fbb: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff800000113fc2: e9 e1 00 00 00       	jmp	0xffff8000001140a8 <ptbl_split+0x218>
; 		new_table_entries[i] = page2pa(new_page) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff800000113fc7: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000113fcb: 48 b8 60 3e 11 00 00 80 ff ff	movabsq	$-140737487225248, %rax # imm = 0xFFFF800000113E60
ffff800000113fd5: ff d0                	callq	*%rax
ffff800000113fd7: 48 89 c2             	movq	%rax, %rdx
ffff800000113fda: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000113fde: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000113fe8: 48 23 01             	andq	(%rcx), %rax
ffff800000113feb: 48 25 7f ff ff ff    	andq	$-129, %rax
ffff800000113ff1: 48 09 c2             	orq	%rax, %rdx
ffff800000113ff4: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000113ff8: 48 63 4d bc          	movslq	-68(%rbp), %rcx
ffff800000113ffc: 48 89 14 c8          	movq	%rdx, (%rax,%rcx,8)
; 		memcpy(page2kva(new_page), old_data + i * PAGE_SIZE, PAGE_SIZE);
ffff800000114000: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000114004: 48 b8 c0 40 11 00 00 80 ff ff	movabsq	$-140737487224640, %rax # imm = 0xFFFF8000001140C0
ffff80000011400e: ff d0                	callq	*%rax
ffff800000114010: 48 89 c7             	movq	%rax, %rdi
ffff800000114013: 48 8b 75 c0          	movq	-64(%rbp), %rsi
ffff800000114017: 8b 45 bc             	movl	-68(%rbp), %eax
ffff80000011401a: c1 e0 0c             	shll	$12, %eax
ffff80000011401d: 48 98                	cltq
ffff80000011401f: 48 01 c6             	addq	%rax, %rsi
ffff800000114022: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff80000011402c: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000114031: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114033: 8b 45 bc             	movl	-68(%rbp), %eax
ffff800000114036: 83 c0 01             	addl	$1, %eax
ffff800000114039: 89 45 bc             	movl	%eax, -68(%rbp)
ffff80000011403c: e9 4a ff ff ff       	jmp	0xffff800000113f8b <ptbl_split+0xfb>
; 	page_decref(pa2page(PAGE_ADDR(*entry)));
ffff800000114041: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114045: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff80000011404f: 48 23 38             	andq	(%rax), %rdi
ffff800000114052: 48 b8 00 41 11 00 00 80 ff ff	movabsq	$-140737487224576, %rax # imm = 0xFFFF800000114100
ffff80000011405c: ff d0                	callq	*%rax
ffff80000011405e: 48 89 c7             	movq	%rax, %rdi
ffff800000114061: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000011406b: ff d0                	callq	*%rax
; 	*entry = page2pa(new_table) | (*entry & PAGE_MASK & ~PAGE_HUGE);
ffff80000011406d: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000114071: 48 b8 60 3e 11 00 00 80 ff ff	movabsq	$-140737487225248, %rax # imm = 0xFFFF800000113E60
ffff80000011407b: ff d0                	callq	*%rax
ffff80000011407d: 48 89 c1             	movq	%rax, %rcx
ffff800000114080: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000114084: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011408e: 48 23 02             	andq	(%rdx), %rax
ffff800000114091: 48 25 7f ff ff ff    	andq	$-129, %rax
ffff800000114097: 48 09 c1             	orq	%rax, %rcx
ffff80000011409a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011409e: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff8000001140a1: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff8000001140a8: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001140ab: 48 83 c4 50          	addq	$80, %rsp
ffff8000001140af: 5d                   	popq	%rbp
ffff8000001140b0: c3                   	retq
ffff8000001140b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001140bb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001140c0 <page2kva>:
; {
ffff8000001140c0: 55                   	pushq	%rbp
ffff8000001140c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001140c4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001140c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff8000001140cc: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001140d0: 48 b8 60 3e 11 00 00 80 ff ff	movabsq	$-140737487225248, %rax # imm = 0xFFFF800000113E60
ffff8000001140da: ff d0                	callq	*%rax
ffff8000001140dc: 48 89 c2             	movq	%rax, %rdx
ffff8000001140df: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff8000001140e9: 48 b8 70 44 11 00 00 80 ff ff	movabsq	$-140737487223696, %rax # imm = 0xFFFF800000114470
ffff8000001140f3: be 50 00 00 00       	movl	$80, %esi
ffff8000001140f8: ff d0                	callq	*%rax
ffff8000001140fa: 48 83 c4 10          	addq	$16, %rsp
ffff8000001140fe: 5d                   	popq	%rbp
ffff8000001140ff: c3                   	retq

ffff800000114100 <pa2page>:
; {
ffff800000114100: 55                   	pushq	%rbp
ffff800000114101: 48 89 e5             	movq	%rsp, %rbp
ffff800000114104: 48 83 ec 10          	subq	$16, %rsp
ffff800000114108: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011410c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114110: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114114: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011411e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000114121: 48 39 c8             	cmpq	%rcx, %rax
ffff800000114124: 0f 82 27 00 00 00    	jb	0xffff800000114151 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011412a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000114134: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000011413e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000114148: 31 c0                	xorl	%eax, %eax
ffff80000011414a: be 49 00 00 00       	movl	$73, %esi
ffff80000011414f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000114151: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011415b: 48 8b 00             	movq	(%rax), %rax
ffff80000011415e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000114162: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000114166: 48 c1 e1 05          	shlq	$5, %rcx
ffff80000011416a: 48 01 c8             	addq	%rcx, %rax
ffff80000011416d: 48 83 c4 10          	addq	$16, %rsp
ffff800000114171: 5d                   	popq	%rbp
ffff800000114172: c3                   	retq
ffff800000114173: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011417d: 0f 1f 00             	nopl	(%rax)

ffff800000114180 <ptbl_merge>:
; {
ffff800000114180: 55                   	pushq	%rbp
ffff800000114181: 48 89 e5             	movq	%rsp, %rbp
ffff800000114184: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff80000011418b: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011418f: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000114193: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000114197: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if(*entry & PAGE_HUGE){
ffff80000011419b: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011419f: 48 8b 00             	movq	(%rax), %rax
ffff8000001141a2: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001141a8: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001141ac: 0f 84 0c 00 00 00    	je	0xffff8000001141be <ptbl_merge+0x3e>
; 		return 0;
ffff8000001141b2: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001141b9: e9 c3 01 00 00       	jmp	0xffff800000114381 <ptbl_merge+0x201>
; 	physaddr_t table = PAGE_ADDR(*entry);
ffff8000001141be: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001141c2: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001141cc: 48 23 01             	andq	(%rcx), %rax
ffff8000001141cf: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	physaddr_t flags = *entry & PAGE_MASK;
ffff8000001141d3: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001141d7: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff8000001141e1: 48 23 01             	andq	(%rcx), %rax
ffff8000001141e4: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if((flags ^ PAGE_PRESENT) == 0) return 0;
ffff8000001141e8: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff8000001141ec: 48 83 f0 01          	xorq	$1, %rax
ffff8000001141f0: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001141f4: 0f 85 0c 00 00 00    	jne	0xffff800000114206 <ptbl_merge+0x86>
ffff8000001141fa: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000114201: e9 7b 01 00 00       	jmp	0xffff800000114381 <ptbl_merge+0x201>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114206: c7 45 c4 00 00 00 00 	movl	$0, -60(%rbp)
ffff80000011420d: 48 63 45 c4          	movslq	-60(%rbp), %rax
ffff800000114211: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff800000114217: 0f 83 46 00 00 00    	jae	0xffff800000114263 <ptbl_merge+0xe3>
; 		physaddr_t table_entry = table + i;
ffff80000011421d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114221: 48 63 4d c4          	movslq	-60(%rbp), %rcx
ffff800000114225: 48 01 c8             	addq	%rcx, %rax
ffff800000114228: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 		if((table_entry & PAGE_MASK) != flags) return 0;
ffff80000011422c: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000114236: 48 23 45 b8          	andq	-72(%rbp), %rax
ffff80000011423a: 48 3b 45 c8          	cmpq	-56(%rbp), %rax
ffff80000011423e: 0f 84 0c 00 00 00    	je	0xffff800000114250 <ptbl_merge+0xd0>
ffff800000114244: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011424b: e9 31 01 00 00       	jmp	0xffff800000114381 <ptbl_merge+0x201>
; 	}
ffff800000114250: e9 00 00 00 00       	jmp	0xffff800000114255 <ptbl_merge+0xd5>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114255: 8b 45 c4             	movl	-60(%rbp), %eax
ffff800000114258: 83 c0 01             	addl	$1, %eax
ffff80000011425b: 89 45 c4             	movl	%eax, -60(%rbp)
ffff80000011425e: e9 aa ff ff ff       	jmp	0xffff80000011420d <ptbl_merge+0x8d>
; 	struct page_info *huge_page = page_alloc(ALLOC_HUGE);
ffff800000114263: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff80000011426d: bf 02 00 00 00       	movl	$2, %edi
ffff800000114272: ff d0                	callq	*%rax
ffff800000114274: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 	if(huge_page == NULL) return -1;
ffff800000114278: 48 83 7d b0 00       	cmpq	$0, -80(%rbp)
ffff80000011427d: 0f 85 0c 00 00 00    	jne	0xffff80000011428f <ptbl_merge+0x10f>
ffff800000114283: c7 45 fc ff ff ff ff 	movl	$4294967295, -4(%rbp)   # imm = 0xFFFFFFFF
ffff80000011428a: e9 f2 00 00 00       	jmp	0xffff800000114381 <ptbl_merge+0x201>
; 	void* huge_page_addr = page2kva(huge_page);
ffff80000011428f: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000114293: 48 b8 c0 40 11 00 00 80 ff ff	movabsq	$-140737487224640, %rax # imm = 0xFFFF8000001140C0
ffff80000011429d: ff d0                	callq	*%rax
ffff80000011429f: 48 89 45 a8          	movq	%rax, -88(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff8000001142a3: c7 45 a4 00 00 00 00 	movl	$0, -92(%rbp)
ffff8000001142aa: 48 63 45 a4          	movslq	-92(%rbp), %rax
ffff8000001142ae: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff8000001142b4: 0f 83 7e 00 00 00    	jae	0xffff800000114338 <ptbl_merge+0x1b8>
; 		physaddr_t table_entry = table + i;
ffff8000001142ba: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001142be: 48 63 4d a4          	movslq	-92(%rbp), %rcx
ffff8000001142c2: 48 01 c8             	addq	%rcx, %rax
ffff8000001142c5: 48 89 45 98          	movq	%rax, -104(%rbp)
; 		struct page_info *entry_page = pa2page(PAGE_ADDR(table_entry));
ffff8000001142c9: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff8000001142d3: 48 23 7d 98          	andq	-104(%rbp), %rdi
ffff8000001142d7: 48 b8 00 41 11 00 00 80 ff ff	movabsq	$-140737487224576, %rax # imm = 0xFFFF800000114100
ffff8000001142e1: ff d0                	callq	*%rax
ffff8000001142e3: 48 89 45 90          	movq	%rax, -112(%rbp)
; 		memcpy(page2kva(entry_page), huge_page_addr + i * PAGE_SIZE, PAGE_SIZE);
ffff8000001142e7: 48 8b 7d 90          	movq	-112(%rbp), %rdi
ffff8000001142eb: 48 b8 c0 40 11 00 00 80 ff ff	movabsq	$-140737487224640, %rax # imm = 0xFFFF8000001140C0
ffff8000001142f5: ff d0                	callq	*%rax
ffff8000001142f7: 48 89 c7             	movq	%rax, %rdi
ffff8000001142fa: 48 8b 75 a8          	movq	-88(%rbp), %rsi
ffff8000001142fe: 8b 45 a4             	movl	-92(%rbp), %eax
ffff800000114301: c1 e0 0c             	shll	$12, %eax
ffff800000114304: 48 98                	cltq
ffff800000114306: 48 01 c6             	addq	%rax, %rsi
ffff800000114309: 48 b8 60 28 11 00 00 80 ff ff	movabsq	$-140737487230880, %rax # imm = 0xFFFF800000112860
ffff800000114313: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000114318: ff d0                	callq	*%rax
; 		page_decref(entry_page);
ffff80000011431a: 48 8b 7d 90          	movq	-112(%rbp), %rdi
ffff80000011431e: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000114328: ff d0                	callq	*%rax
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff80000011432a: 8b 45 a4             	movl	-92(%rbp), %eax
ffff80000011432d: 83 c0 01             	addl	$1, %eax
ffff800000114330: 89 45 a4             	movl	%eax, -92(%rbp)
ffff800000114333: e9 72 ff ff ff       	jmp	0xffff8000001142aa <ptbl_merge+0x12a>
; 	struct page_info *table_page = pa2page(table);
ffff800000114338: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff80000011433c: 48 b8 00 41 11 00 00 80 ff ff	movabsq	$-140737487224576, %rax # imm = 0xFFFF800000114100
ffff800000114346: ff d0                	callq	*%rax
ffff800000114348: 48 89 45 88          	movq	%rax, -120(%rbp)
; 	page_decref(table_page);
ffff80000011434c: 48 8b 7d 88          	movq	-120(%rbp), %rdi
ffff800000114350: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff80000011435a: ff d0                	callq	*%rax
; 	*entry = page2pa(huge_page) | flags;
ffff80000011435c: 48 8b 7d b0          	movq	-80(%rbp), %rdi
ffff800000114360: 48 b8 60 3e 11 00 00 80 ff ff	movabsq	$-140737487225248, %rax # imm = 0xFFFF800000113E60
ffff80000011436a: ff d0                	callq	*%rax
ffff80000011436c: 48 89 c1             	movq	%rax, %rcx
ffff80000011436f: 48 0b 4d c8          	orq	-56(%rbp), %rcx
ffff800000114373: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114377: 48 89 08             	movq	%rcx, (%rax)
; 	return 0;
ffff80000011437a: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000114381: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000114384: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000011438b: 5d                   	popq	%rbp
ffff80000011438c: c3                   	retq
ffff80000011438d: 0f 1f 00             	nopl	(%rax)

ffff800000114390 <ptbl_free>:
; {
ffff800000114390: 55                   	pushq	%rbp
ffff800000114391: 48 89 e5             	movq	%rsp, %rbp
ffff800000114394: 48 83 ec 50          	subq	$80, %rsp
ffff800000114398: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011439c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001143a0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001143a4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if((*entry & PAGE_PRESENT) == 0) return 0;
ffff8000001143a8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001143ac: 48 8b 00             	movq	(%rax), %rax
ffff8000001143af: 48 83 e0 01          	andq	$1, %rax
ffff8000001143b3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001143b7: 0f 85 0c 00 00 00    	jne	0xffff8000001143c9 <ptbl_free+0x39>
ffff8000001143bd: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001143c4: e9 97 00 00 00       	jmp	0xffff800000114460 <ptbl_free+0xd0>
; 	physaddr_t table = PAGE_ADDR(*entry);
ffff8000001143c9: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001143cd: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001143d7: 48 23 01             	andq	(%rcx), %rax
ffff8000001143da: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff8000001143de: c7 45 cc 00 00 00 00 	movl	$0, -52(%rbp)
ffff8000001143e5: 48 63 45 cc          	movslq	-52(%rbp), %rax
ffff8000001143e9: 48 3d 00 02 00 00    	cmpq	$512, %rax              # imm = 0x200
ffff8000001143ef: 0f 83 40 00 00 00    	jae	0xffff800000114435 <ptbl_free+0xa5>
; 		physaddr_t table_entry = table + i;
ffff8000001143f5: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001143f9: 48 63 4d cc          	movslq	-52(%rbp), %rcx
ffff8000001143fd: 48 01 c8             	addq	%rcx, %rax
ffff800000114400: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		if(table_entry & PAGE_PRESENT) return 0;
ffff800000114404: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff800000114408: 48 83 e0 01          	andq	$1, %rax
ffff80000011440c: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114410: 0f 84 0c 00 00 00    	je	0xffff800000114422 <ptbl_free+0x92>
ffff800000114416: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011441d: e9 3e 00 00 00       	jmp	0xffff800000114460 <ptbl_free+0xd0>
; 	}
ffff800000114422: e9 00 00 00 00       	jmp	0xffff800000114427 <ptbl_free+0x97>
; 	for(int i = 0; i < PAGE_TABLE_ENTRIES; i++){
ffff800000114427: 8b 45 cc             	movl	-52(%rbp), %eax
ffff80000011442a: 83 c0 01             	addl	$1, %eax
ffff80000011442d: 89 45 cc             	movl	%eax, -52(%rbp)
ffff800000114430: e9 b0 ff ff ff       	jmp	0xffff8000001143e5 <ptbl_free+0x55>
; 	struct page_info *table_page = pa2page(table);
ffff800000114435: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000114439: 48 b8 00 41 11 00 00 80 ff ff	movabsq	$-140737487224576, %rax # imm = 0xFFFF800000114100
ffff800000114443: ff d0                	callq	*%rax
ffff800000114445: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	page_decref(table_page);
ffff800000114449: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff80000011444d: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000114457: ff d0                	callq	*%rax
; 	return 0;
ffff800000114459: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000114460: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000114463: 48 83 c4 50          	addq	$80, %rsp
ffff800000114467: 5d                   	popq	%rbp
ffff800000114468: c3                   	retq
ffff800000114469: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000114470 <_kaddr>:
; {
ffff800000114470: 55                   	pushq	%rbp
ffff800000114471: 48 89 e5             	movq	%rsp, %rbp
ffff800000114474: 48 83 ec 20          	subq	$32, %rsp
ffff800000114478: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011447c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011447f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000114483: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000114487: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000011448b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000114495: 48 8b 09             	movq	(%rcx), %rcx
ffff800000114498: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011449b: 0f 82 24 00 00 00    	jb	0xffff8000001144c5 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff8000001144a1: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001144a5: 8b 75 f4             	movl	-12(%rbp), %esi
ffff8000001144a8: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001144ac: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
ffff8000001144b6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001144c0: 31 c0                	xorl	%eax, %eax
ffff8000001144c2: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff8000001144c5: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001144cf: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff8000001144d3: 48 83 c4 20          	addq	$32, %rsp
ffff8000001144d7: 5d                   	popq	%rbp
ffff8000001144d8: c3                   	retq
ffff8000001144d9: cc                   	int3
ffff8000001144da: cc                   	int3
ffff8000001144db: cc                   	int3
ffff8000001144dc: cc                   	int3
ffff8000001144dd: cc                   	int3
ffff8000001144de: cc                   	int3
ffff8000001144df: cc                   	int3

ffff8000001144e0 <unmap_page_range>:
; {
ffff8000001144e0: 55                   	pushq	%rbp
ffff8000001144e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001144e4: 48 81 ec 80 00 00 00 	subq	$128, %rsp
ffff8000001144eb: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001144ef: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001144f3: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 		.pml4 = pml4,
ffff8000001144f7: 48 8b 45 f8          	movq	-8(%rbp), %rax
; 	struct remove_info info = {
ffff8000001144fb: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		.va = va
ffff8000001144ff: 48 8b 45 f0          	movq	-16(%rbp), %rax
; 	struct remove_info info = {
ffff800000114503: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	struct page_walker walker = {
ffff800000114507: 48 b8 90 45 11 00 00 80 ff ff	movabsq	$-140737487223408, %rax # imm = 0xFFFF800000114590
ffff800000114511: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff800000114515: 48 b8 f0 45 11 00 00 80 ff ff	movabsq	$-140737487223312, %rax # imm = 0xFFFF8000001145F0
ffff80000011451f: 48 89 45 90          	movq	%rax, -112(%rbp)
ffff800000114523: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff80000011452b: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff800000114533: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff80000011453b: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000114543: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff80000011454b: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000114553: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
; 		.udata = &info,
ffff80000011455b: 48 8d 45 d8          	leaq	-40(%rbp), %rax
; 	struct page_walker walker = {
ffff80000011455f: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	walk_page_range(pml4, va, va + size, &walker);
ffff800000114563: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114567: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011456b: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000011456f: 48 03 55 e8          	addq	-24(%rbp), %rdx
ffff800000114573: 48 b8 50 48 11 00 00 80 ff ff	movabsq	$-140737487222704, %rax # imm = 0xFFFF800000114850
ffff80000011457d: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
ffff800000114581: ff d0                	callq	*%rax
; }
ffff800000114583: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000011458a: 5d                   	popq	%rbp
ffff80000011458b: c3                   	retq
ffff80000011458c: 0f 1f 40 00          	nopl	(%rax)

ffff800000114590 <remove_pte>:
; {
ffff800000114590: 55                   	pushq	%rbp
ffff800000114591: 48 89 e5             	movq	%rsp, %rbp
ffff800000114594: 48 83 ec 30          	subq	$48, %rsp
ffff800000114598: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011459c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff8000001145a0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff8000001145a4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct remove_info *info = walker->udata;
ffff8000001145a8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001145ac: 48 8b 40 48          	movq	72(%rax), %rax
ffff8000001145b0: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT) remove_page(entry, info);
ffff8000001145b4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001145b8: 48 8b 00             	movq	(%rax), %rax
ffff8000001145bb: 48 83 e0 01          	andq	$1, %rax
ffff8000001145bf: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001145c3: 0f 84 14 00 00 00    	je	0xffff8000001145dd <remove_pte+0x4d>
ffff8000001145c9: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001145cd: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff8000001145d1: 48 b8 d0 46 11 00 00 80 ff ff	movabsq	$-140737487223088, %rax # imm = 0xFFFF8000001146D0
ffff8000001145db: ff d0                	callq	*%rax
; 	return 0;
ffff8000001145dd: 31 c0                	xorl	%eax, %eax
ffff8000001145df: 48 83 c4 30          	addq	$48, %rsp
ffff8000001145e3: 5d                   	popq	%rbp
ffff8000001145e4: c3                   	retq
ffff8000001145e5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001145ef: 90                   	nop

ffff8000001145f0 <remove_pde>:
; {
ffff8000001145f0: 55                   	pushq	%rbp
ffff8000001145f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001145f4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001145f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001145fc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114600: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114604: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	struct remove_info *info = walker->udata;
ffff800000114608: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011460c: 48 8b 40 48          	movq	72(%rax), %rax
ffff800000114610: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	if(*entry & PAGE_PRESENT && *entry & PAGE_HUGE) remove_page(entry, info);
ffff800000114614: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114618: 48 8b 00             	movq	(%rax), %rax
ffff80000011461b: 48 83 e0 01          	andq	$1, %rax
ffff80000011461f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114623: 0f 84 2b 00 00 00    	je	0xffff800000114654 <remove_pde+0x64>
ffff800000114629: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011462d: 48 8b 00             	movq	(%rax), %rax
ffff800000114630: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000114636: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011463a: 0f 84 14 00 00 00    	je	0xffff800000114654 <remove_pde+0x64>
ffff800000114640: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114644: 48 8b 75 d8          	movq	-40(%rbp), %rsi
ffff800000114648: 48 b8 d0 46 11 00 00 80 ff ff	movabsq	$-140737487223088, %rax # imm = 0xFFFF8000001146D0
ffff800000114652: ff d0                	callq	*%rax
; 	return 0;
ffff800000114654: 31 c0                	xorl	%eax, %eax
ffff800000114656: 48 83 c4 30          	addq	$48, %rsp
ffff80000011465a: 5d                   	popq	%rbp
ffff80000011465b: c3                   	retq
ffff80000011465c: 0f 1f 40 00          	nopl	(%rax)

ffff800000114660 <unmap_user_pages>:
; {
ffff800000114660: 55                   	pushq	%rbp
ffff800000114661: 48 89 e5             	movq	%rsp, %rbp
ffff800000114664: 48 83 ec 10          	subq	$16, %rsp
ffff800000114668: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	unmap_page_range(pml4, 0, USER_LIM);
ffff80000011466c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114670: 31 c0                	xorl	%eax, %eax
ffff800000114672: 48 b8 e0 44 11 00 00 80 ff ff	movabsq	$-140737487223584, %rax # imm = 0xFFFF8000001144E0
ffff80000011467c: 31 c9                	xorl	%ecx, %ecx
ffff80000011467e: 89 ce                	movl	%ecx, %esi
ffff800000114680: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff80000011468a: ff d0                	callq	*%rax
; }
ffff80000011468c: 48 83 c4 10          	addq	$16, %rsp
ffff800000114690: 5d                   	popq	%rbp
ffff800000114691: c3                   	retq
ffff800000114692: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011469c: 0f 1f 40 00          	nopl	(%rax)

ffff8000001146a0 <page_remove>:
; {
ffff8000001146a0: 55                   	pushq	%rbp
ffff8000001146a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001146a4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001146a8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001146ac: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	unmap_page_range(pml4, va, PAGE_SIZE);
ffff8000001146b0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001146b4: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff8000001146b8: 48 b8 e0 44 11 00 00 80 ff ff	movabsq	$-140737487223584, %rax # imm = 0xFFFF8000001144E0
ffff8000001146c2: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001146c7: ff d0                	callq	*%rax
; }
ffff8000001146c9: 48 83 c4 10          	addq	$16, %rsp
ffff8000001146cd: 5d                   	popq	%rbp
ffff8000001146ce: c3                   	retq
ffff8000001146cf: 90                   	nop

ffff8000001146d0 <remove_page>:
; static void remove_page(physaddr_t *entry, struct remove_info *info){
ffff8000001146d0: 55                   	pushq	%rbp
ffff8000001146d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001146d4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001146d8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001146dc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	struct page_info *page = pa2page(get_entry_pa(entry));
ffff8000001146e0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001146e4: 48 b8 e0 47 11 00 00 80 ff ff	movabsq	$-140737487222816, %rax # imm = 0xFFFF8000001147E0
ffff8000001146ee: ff d0                	callq	*%rax
ffff8000001146f0: 48 89 c7             	movq	%rax, %rdi
ffff8000001146f3: 48 b8 60 47 11 00 00 80 ff ff	movabsq	$-140737487222944, %rax # imm = 0xFFFF800000114760
ffff8000001146fd: ff d0                	callq	*%rax
ffff8000001146ff: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	page_decref(page);
ffff800000114703: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114707: 48 b8 60 ea 10 00 00 80 ff ff	movabsq	$-140737487246752, %rax # imm = 0xFFFF80000010EA60
ffff800000114711: ff d0                	callq	*%rax
; 	if(page->pp_free) *entry ^= PAGE_PRESENT;
ffff800000114713: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000114717: 8a 40 12             	movb	18(%rax), %al
ffff80000011471a: c0 e8 07             	shrb	$7, %al
ffff80000011471d: 3c 00                	cmpb	$0, %al
ffff80000011471f: 0f 84 0e 00 00 00    	je	0xffff800000114733 <remove_page+0x63>
ffff800000114725: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114729: 48 8b 08             	movq	(%rax), %rcx
ffff80000011472c: 48 83 f1 01          	xorq	$1, %rcx
ffff800000114730: 48 89 08             	movq	%rcx, (%rax)
; 	tlb_invalidate(info->pml4, info->va); //but invalidate tlb as virtual adress points to nothing now!
ffff800000114733: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114737: 48 8b 38             	movq	(%rax), %rdi
ffff80000011473a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011473e: 48 8b 70 08          	movq	8(%rax), %rsi
ffff800000114742: 48 b8 00 48 11 00 00 80 ff ff	movabsq	$-140737487222784, %rax # imm = 0xFFFF800000114800
ffff80000011474c: ff d0                	callq	*%rax
; }
ffff80000011474e: 48 83 c4 20          	addq	$32, %rsp
ffff800000114752: 5d                   	popq	%rbp
ffff800000114753: c3                   	retq
ffff800000114754: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011475e: 66 90                	nop

ffff800000114760 <pa2page>:
; {
ffff800000114760: 55                   	pushq	%rbp
ffff800000114761: 48 89 e5             	movq	%rsp, %rbp
ffff800000114764: 48 83 ec 10          	subq	$16, %rsp
ffff800000114768: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011476c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114770: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114774: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011477e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000114781: 48 39 c8             	cmpq	%rcx, %rax
ffff800000114784: 0f 82 27 00 00 00    	jb	0xffff8000001147b1 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011478a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000114794: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000011479e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff8000001147a8: 31 c0                	xorl	%eax, %eax
ffff8000001147aa: be 49 00 00 00       	movl	$73, %esi
ffff8000001147af: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff8000001147b1: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff8000001147bb: 48 8b 00             	movq	(%rax), %rax
ffff8000001147be: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001147c2: 48 c1 e9 0c          	shrq	$12, %rcx
ffff8000001147c6: 48 c1 e1 05          	shlq	$5, %rcx
ffff8000001147ca: 48 01 c8             	addq	%rcx, %rax
ffff8000001147cd: 48 83 c4 10          	addq	$16, %rsp
ffff8000001147d1: 5d                   	popq	%rbp
ffff8000001147d2: c3                   	retq
ffff8000001147d3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001147dd: 0f 1f 00             	nopl	(%rax)

ffff8000001147e0 <get_entry_pa>:
; static inline physaddr_t get_entry_pa(physaddr_t *entry){
ffff8000001147e0: 55                   	pushq	%rbp
ffff8000001147e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001147e4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return *entry & ~PHYS_ADD_MASK;
ffff8000001147e8: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001147ec: 48 b8 00 f0 ff ff ff ff ff 7f	movabsq	$9223372036854771712, %rax # imm = 0x7FFFFFFFFFFFF000
ffff8000001147f6: 48 23 01             	andq	(%rcx), %rax
ffff8000001147f9: 5d                   	popq	%rbp
ffff8000001147fa: c3                   	retq
ffff8000001147fb: cc                   	int3
ffff8000001147fc: cc                   	int3
ffff8000001147fd: cc                   	int3
ffff8000001147fe: cc                   	int3
ffff8000001147ff: cc                   	int3

ffff800000114800 <tlb_invalidate>:
; {
ffff800000114800: 55                   	pushq	%rbp
ffff800000114801: 48 89 e5             	movq	%rsp, %rbp
ffff800000114804: 48 83 ec 10          	subq	$16, %rsp
ffff800000114808: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011480c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	flush_page(va);
ffff800000114810: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000114814: 48 b8 30 48 11 00 00 80 ff ff	movabsq	$-140737487222736, %rax # imm = 0xFFFF800000114830
ffff80000011481e: ff d0                	callq	*%rax
; }
ffff800000114820: 48 83 c4 10          	addq	$16, %rsp
ffff800000114824: 5d                   	popq	%rbp
ffff800000114825: c3                   	retq
ffff800000114826: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000114830 <flush_page>:
; {
ffff800000114830: 55                   	pushq	%rbp
ffff800000114831: 48 89 e5             	movq	%rsp, %rbp
ffff800000114834: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	asm volatile("invlpg (%0)" :: "r" (addr) : "memory");
ffff800000114838: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011483c: 0f 01 38             	invlpg	(%rax)
; }
ffff80000011483f: 5d                   	popq	%rbp
ffff800000114840: c3                   	retq
ffff800000114841: cc                   	int3
ffff800000114842: cc                   	int3
ffff800000114843: cc                   	int3
ffff800000114844: cc                   	int3
ffff800000114845: cc                   	int3
ffff800000114846: cc                   	int3
ffff800000114847: cc                   	int3
ffff800000114848: cc                   	int3
ffff800000114849: cc                   	int3
ffff80000011484a: cc                   	int3
ffff80000011484b: cc                   	int3
ffff80000011484c: cc                   	int3
ffff80000011484d: cc                   	int3
ffff80000011484e: cc                   	int3
ffff80000011484f: cc                   	int3

ffff800000114850 <walk_page_range>:
; {
ffff800000114850: 55                   	pushq	%rbp
ffff800000114851: 48 89 e5             	movq	%rsp, %rbp
ffff800000114854: 48 83 ec 60          	subq	$96, %rsp
ffff800000114858: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011485c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114860: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114864: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000114868: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011486c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114870: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000114874: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114878: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff80000011487c: 48 81 e1 ff 0f 00 00 	andq	$4095, %rcx             # imm = 0xFFF
ffff800000114883: 48 29 c8             	subq	%rcx, %rax
ffff800000114886: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011488a: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 		ROUNDUP((uintptr_t)end, PAGE_SIZE) - 1, walker);
ffff80000011488e: 48 c7 45 c8 00 10 00 00      	movq	$4096, -56(%rbp) # imm = 0x1000
ffff800000114896: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000011489a: 48 03 45 c8          	addq	-56(%rbp), %rax
ffff80000011489e: 48 83 e8 01          	subq	$1, %rax
ffff8000001148a2: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff8000001148a6: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff8000001148aa: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff8000001148ae: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff8000001148b2: 31 c9                	xorl	%ecx, %ecx
ffff8000001148b4: 89 ca                	movl	%ecx, %edx
ffff8000001148b6: 48 f7 75 c8          	divq	-56(%rbp)
ffff8000001148ba: 48 8b 45 a8          	movq	-88(%rbp), %rax
ffff8000001148be: 48 29 d0             	subq	%rdx, %rax
ffff8000001148c1: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff8000001148c5: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff8000001148c9: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001148cd: 48 8b 55 c0          	movq	-64(%rbp), %rdx
ffff8000001148d1: 48 83 ea 01          	subq	$1, %rdx
ffff8000001148d5: 48 8b 4d e0          	movq	-32(%rbp), %rcx
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff8000001148d9: 48 b8 f0 48 11 00 00 80 ff ff	movabsq	$-140737487222544, %rax # imm = 0xFFFF8000001148F0
ffff8000001148e3: ff d0                	callq	*%rax
ffff8000001148e5: 48 83 c4 60          	addq	$96, %rsp
ffff8000001148e9: 5d                   	popq	%rbp
ffff8000001148ea: c3                   	retq
ffff8000001148eb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001148f0 <pml4_walk_range>:
; {
ffff8000001148f0: 55                   	pushq	%rbp
ffff8000001148f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001148f4: 48 83 ec 50          	subq	$80, %rsp
ffff8000001148f8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001148fc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114900: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114904: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pml4e_callback,
ffff800000114908: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011490c: 48 8b 40 18          	movq	24(%rax), %rax
; 	{
ffff800000114910: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pml4e_unmap,
ffff800000114914: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114918: 48 8b 40 38          	movq	56(%rax), %rax
; 	{
ffff80000011491c: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114920: 48 b8 40 4a 11 00 00 80 ff ff	movabsq	$-140737487222208, %rax # imm = 0xFFFF800000114A40
ffff80000011492a: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000011492e: 48 b8 d0 4a 11 00 00 80 ff ff	movabsq	$-140737487222064, %rax # imm = 0xFFFF800000114AD0
ffff800000114938: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff80000011493c: 48 b8 f0 4a 11 00 00 80 ff ff	movabsq	$-140737487222032, %rax # imm = 0xFFFF800000114AF0
ffff800000114946: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011494a: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(pml4, base, end, &ptbl_fns, walker);
ffff800000114952: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114956: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff80000011495a: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff80000011495e: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114962: 48 b8 10 4b 11 00 00 80 ff ff	movabsq	$-140737487222000, %rax # imm = 0xFFFF800000114B10
ffff80000011496c: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114970: ff d0                	callq	*%rax
ffff800000114972: 48 83 c4 50          	addq	$80, %rsp
ffff800000114976: 5d                   	popq	%rbp
ffff800000114977: c3                   	retq
ffff800000114978: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114980 <walk_all_pages>:
; {
ffff800000114980: 55                   	pushq	%rbp
ffff800000114981: 48 89 e5             	movq	%rsp, %rbp
ffff800000114984: 48 83 ec 10          	subq	$16, %rsp
ffff800000114988: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011498c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
ffff800000114990: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114994: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000114998: 31 c0                	xorl	%eax, %eax
ffff80000011499a: 48 b8 f0 48 11 00 00 80 ff ff	movabsq	$-140737487222544, %rax # imm = 0xFFFF8000001148F0
ffff8000001149a4: 31 d2                	xorl	%edx, %edx
ffff8000001149a6: 89 d6                	movl	%edx, %esi
ffff8000001149a8: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff8000001149af: ff d0                	callq	*%rax
ffff8000001149b1: 48 83 c4 10          	addq	$16, %rsp
ffff8000001149b5: 5d                   	popq	%rbp
ffff8000001149b6: c3                   	retq
ffff8000001149b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001149c0 <walk_user_pages>:
; {
ffff8000001149c0: 55                   	pushq	%rbp
ffff8000001149c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001149c4: 48 83 ec 10          	subq	$16, %rsp
ffff8000001149c8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001149cc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, 0, USER_LIM, walker);
ffff8000001149d0: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001149d4: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001149d8: 31 c0                	xorl	%eax, %eax
ffff8000001149da: 48 b8 f0 48 11 00 00 80 ff ff	movabsq	$-140737487222544, %rax # imm = 0xFFFF8000001148F0
ffff8000001149e4: 31 d2                	xorl	%edx, %edx
ffff8000001149e6: 89 d6                	movl	%edx, %esi
ffff8000001149e8: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff8000001149f2: ff d0                	callq	*%rax
ffff8000001149f4: 48 83 c4 10          	addq	$16, %rsp
ffff8000001149f8: 5d                   	popq	%rbp
ffff8000001149f9: c3                   	retq
ffff8000001149fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000114a00 <walk_kernel_pages>:
; {
ffff800000114a00: 55                   	pushq	%rbp
ffff800000114a01: 48 89 e5             	movq	%rsp, %rbp
ffff800000114a04: 48 83 ec 10          	subq	$16, %rsp
ffff800000114a08: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114a0c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
; 	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
ffff800000114a10: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114a14: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000114a18: 48 b8 f0 48 11 00 00 80 ff ff	movabsq	$-140737487222544, %rax # imm = 0xFFFF8000001148F0
ffff800000114a22: 48 be 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rsi # imm = 0xFFFF800000000000
ffff800000114a2c: 48 c7 c2 ff ff ff ff 	movq	$-1, %rdx
ffff800000114a33: ff d0                	callq	*%rax
ffff800000114a35: 48 83 c4 10          	addq	$16, %rsp
ffff800000114a39: 5d                   	popq	%rbp
ffff800000114a3a: c3                   	retq
ffff800000114a3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000114a40 <pdpt_walk_range>:
; {
ffff800000114a40: 55                   	pushq	%rbp
ffff800000114a41: 48 89 e5             	movq	%rsp, %rbp
ffff800000114a44: 48 83 ec 50          	subq	$80, %rsp
ffff800000114a48: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114a4c: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114a50: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114a54: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pdpte_callback,
ffff800000114a58: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114a5c: 48 8b 40 10          	movq	16(%rax), %rax
; 	{
ffff800000114a60: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pdpte_unmap,
ffff800000114a64: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114a68: 48 8b 40 30          	movq	48(%rax), %rax
; 	{
ffff800000114a6c: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114a70: 48 b8 e0 4d 11 00 00 80 ff ff	movabsq	$-140737487221280, %rax # imm = 0xFFFF800000114DE0
ffff800000114a7a: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000114a7e: 48 b8 70 4e 11 00 00 80 ff ff	movabsq	$-140737487221136, %rax # imm = 0xFFFF800000114E70
ffff800000114a88: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114a8c: 48 b8 90 4e 11 00 00 80 ff ff	movabsq	$-140737487221104, %rax # imm = 0xFFFF800000114E90
ffff800000114a96: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114a9a: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(pdpt, base, end, &ptbl_fns, walker);
ffff800000114aa2: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114aa6: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114aaa: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114aae: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114ab2: 48 b8 10 4b 11 00 00 80 ff ff	movabsq	$-140737487222000, %rax # imm = 0xFFFF800000114B10
ffff800000114abc: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114ac0: ff d0                	callq	*%rax
ffff800000114ac2: 48 83 c4 50          	addq	$80, %rsp
ffff800000114ac6: 5d                   	popq	%rbp
ffff800000114ac7: c3                   	retq
ffff800000114ac8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114ad0 <pml4_index>:
; static inline int pml4_index(uintptr_t addr){return PML4_INDEX(addr);}
ffff800000114ad0: 55                   	pushq	%rbp
ffff800000114ad1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114ad4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114ad8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114adc: 48 c1 e8 27          	shrq	$39, %rax
ffff800000114ae0: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114ae6: 5d                   	popq	%rbp
ffff800000114ae7: c3                   	retq
ffff800000114ae8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114af0 <pml4_end>:
; {
ffff800000114af0: 55                   	pushq	%rbp
ffff800000114af1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114af4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PDPT_SPAN - 1);
ffff800000114af8: 48 b8 ff ff ff ff 7f 00 00 00	movabsq	$549755813887, %rax # imm = 0x7FFFFFFFFF
ffff800000114b02: 48 0b 45 f8          	orq	-8(%rbp), %rax
ffff800000114b06: 5d                   	popq	%rbp
ffff800000114b07: c3                   	retq
ffff800000114b08: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114b10 <__walk_range>:
; static int __walk_range(struct page_table *ptbl, uintptr_t base, uintptr_t end, struct ptbl_functions* ptbl_fn, struct page_walker *walker){
ffff800000114b10: 55                   	pushq	%rbp
ffff800000114b11: 48 89 e5             	movq	%rsp, %rbp
ffff800000114b14: 48 83 ec 70          	subq	$112, %rsp
ffff800000114b18: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000114b1c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000114b20: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000114b24: 48 89 4d d8          	movq	%rcx, -40(%rbp)
ffff800000114b28: 4c 89 45 d0          	movq	%r8, -48(%rbp)
; 	uintptr_t page_entry_base = sign_extend(base);
ffff800000114b2c: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114b30: 48 b8 f0 4f 11 00 00 80 ff ff	movabsq	$-140737487220752, %rax # imm = 0xFFFF800000114FF0
ffff800000114b3a: ff d0                	callq	*%rax
ffff800000114b3c: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	uintptr_t page_entry_end = sign_extend(ptbl_fn->ptbl_end(base));
ffff800000114b40: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b44: 48 8b 40 20          	movq	32(%rax), %rax
ffff800000114b48: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114b4c: ff d0                	callq	*%rax
ffff800000114b4e: 48 89 c7             	movq	%rax, %rdi
ffff800000114b51: 48 b8 f0 4f 11 00 00 80 ff ff	movabsq	$-140737487220752, %rax # imm = 0xFFFF800000114FF0
ffff800000114b5b: ff d0                	callq	*%rax
ffff800000114b5d: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	int ret = 0;
ffff800000114b61: c7 45 b4 00 00 00 00 	movl	$0, -76(%rbp)
; 	for(int i = ptbl_fn->ptbl_index(base); i <= ptbl_fn->ptbl_index(end); i++){
ffff800000114b68: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b6c: 48 8b 40 18          	movq	24(%rax), %rax
ffff800000114b70: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114b74: ff d0                	callq	*%rax
ffff800000114b76: 89 45 b0             	movl	%eax, -80(%rbp)
ffff800000114b79: 8b 45 b0             	movl	-80(%rbp), %eax
ffff800000114b7c: 89 45 a8             	movl	%eax, -88(%rbp)
ffff800000114b7f: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114b83: 48 8b 40 18          	movq	24(%rax), %rax
ffff800000114b87: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000114b8b: ff d0                	callq	*%rax
ffff800000114b8d: 89 c1                	movl	%eax, %ecx
ffff800000114b8f: 8b 45 a8             	movl	-88(%rbp), %eax
ffff800000114b92: 39 c8                	cmpl	%ecx, %eax
ffff800000114b94: 0f 8f 2b 02 00 00    	jg	0xffff800000114dc5 <__walk_range+0x2b5>
; 		entry = ptbl->entries + i;
ffff800000114b9a: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000114b9e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff800000114ba2: 48 c1 e1 03          	shlq	$3, %rcx
ffff800000114ba6: 48 01 c8             	addq	%rcx, %rax
ffff800000114ba9: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 		bool isPresent = *entry & PAGE_PRESENT;
ffff800000114bad: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114bb1: 48 8b 00             	movq	(%rax), %rax
ffff800000114bb4: 48 83 e0 01          	andq	$1, %rax
ffff800000114bb8: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114bbc: 0f 95 c0             	setne	%al
ffff800000114bbf: 24 01                	andb	$1, %al
ffff800000114bc1: 88 45 af             	movb	%al, -81(%rbp)
; 		if(ptbl_fn->ptbl_callback && (ret = ptbl_fn->ptbl_callback(entry, page_entry_base, page_entry_end, walker)) < 0) {
ffff800000114bc4: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114bc8: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000114bcc: 0f 84 30 00 00 00    	je	0xffff800000114c02 <__walk_range+0xf2>
ffff800000114bd2: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114bd6: 48 8b 00             	movq	(%rax), %rax
ffff800000114bd9: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114bdd: 48 8b 75 c0          	movq	-64(%rbp), %rsi
ffff800000114be1: 48 8b 55 b8          	movq	-72(%rbp), %rdx
ffff800000114be5: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114be9: ff d0                	callq	*%rax
ffff800000114beb: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114bee: 83 f8 00             	cmpl	$0, %eax
ffff800000114bf1: 0f 8d 0b 00 00 00    	jge	0xffff800000114c02 <__walk_range+0xf2>
; 			return ret;
ffff800000114bf7: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114bfa: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114bfd: e9 c9 01 00 00       	jmp	0xffff800000114dcb <__walk_range+0x2bb>
; 		if(walker->pt_hole_callback && !(*entry & PAGE_PRESENT) && (ret = walker->pt_hole_callback(base, end, walker)) < 0){
ffff800000114c02: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114c06: 48 83 78 40 00       	cmpq	$0, 64(%rax)
ffff800000114c0b: 0f 84 42 00 00 00    	je	0xffff800000114c53 <__walk_range+0x143>
ffff800000114c11: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114c15: 48 8b 00             	movq	(%rax), %rax
ffff800000114c18: 48 83 e0 01          	andq	$1, %rax
ffff800000114c1c: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114c20: 0f 85 2d 00 00 00    	jne	0xffff800000114c53 <__walk_range+0x143>
ffff800000114c26: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000114c2a: 48 8b 40 40          	movq	64(%rax), %rax
ffff800000114c2e: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000114c32: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff800000114c36: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff800000114c3a: ff d0                	callq	*%rax
ffff800000114c3c: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114c3f: 83 f8 00             	cmpl	$0, %eax
ffff800000114c42: 0f 8d 0b 00 00 00    	jge	0xffff800000114c53 <__walk_range+0x143>
; 			return ret;
ffff800000114c48: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114c4b: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114c4e: e9 78 01 00 00       	jmp	0xffff800000114dcb <__walk_range+0x2bb>
; 		bool stopWalk = ptbl_fn->stop_walk && !ptbl_fn->stop_walk(entry, base, end, walker);
ffff800000114c53: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000114c57: 31 c0                	xorl	%eax, %eax
ffff800000114c59: 48 83 79 28 00       	cmpq	$0, 40(%rcx)
ffff800000114c5e: 88 45 a7             	movb	%al, -89(%rbp)
ffff800000114c61: 0f 84 25 00 00 00    	je	0xffff800000114c8c <__walk_range+0x17c>
ffff800000114c67: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c6b: 48 8b 40 28          	movq	40(%rax), %rax
ffff800000114c6f: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114c73: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114c77: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114c7b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114c7f: ff d0                	callq	*%rax
ffff800000114c81: 83 f8 00             	cmpl	$0, %eax
ffff800000114c84: 0f 95 c0             	setne	%al
ffff800000114c87: 34 ff                	xorb	$-1, %al
ffff800000114c89: 88 45 a7             	movb	%al, -89(%rbp)
ffff800000114c8c: 8a 45 a7             	movb	-89(%rbp), %al
; 		bool stopWalk = ptbl_fn->stop_walk && !ptbl_fn->stop_walk(entry, base, end, walker);
ffff800000114c8f: 24 01                	andb	$1, %al
ffff800000114c91: 88 45 ae             	movb	%al, -82(%rbp)
; 		if(ptbl_fn->walkfn && (*entry & PAGE_PRESENT) && stopWalk
ffff800000114c94: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114c98: 48 83 78 10 00       	cmpq	$0, 16(%rax)
ffff800000114c9d: 0f 84 74 00 00 00    	je	0xffff800000114d17 <__walk_range+0x207>
ffff800000114ca3: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114ca7: 48 8b 00             	movq	(%rax), %rax
ffff800000114caa: 48 83 e0 01          	andq	$1, %rax
ffff800000114cae: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114cb2: 0f 84 5f 00 00 00    	je	0xffff800000114d17 <__walk_range+0x207>
; 			&& (ret = ptbl_fn->walkfn((struct page_table *) pa2page(PAGE_ADDR(*entry)), base, end, walker)) < 0){
ffff800000114cb8: f6 45 ae 01          	testb	$1, -82(%rbp)
ffff800000114cbc: 0f 84 55 00 00 00    	je	0xffff800000114d17 <__walk_range+0x207>
ffff800000114cc2: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114cc6: 48 8b 40 10          	movq	16(%rax), %rax
ffff800000114cca: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff800000114cce: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114cd2: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000114cdc: 48 23 38             	andq	(%rax), %rdi
ffff800000114cdf: 48 b8 40 50 11 00 00 80 ff ff	movabsq	$-140737487220672, %rax # imm = 0xFFFF800000115040
ffff800000114ce9: ff d0                	callq	*%rax
ffff800000114ceb: 48 89 c7             	movq	%rax, %rdi
ffff800000114cee: 48 8b 45 98          	movq	-104(%rbp), %rax
ffff800000114cf2: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114cf6: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114cfa: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114cfe: ff d0                	callq	*%rax
ffff800000114d00: 89 45 b4             	movl	%eax, -76(%rbp)
ffff800000114d03: 83 f8 00             	cmpl	$0, %eax
; 		if(ptbl_fn->walkfn && (*entry & PAGE_PRESENT) && stopWalk
ffff800000114d06: 0f 8d 0b 00 00 00    	jge	0xffff800000114d17 <__walk_range+0x207>
; 			return ret;
ffff800000114d0c: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114d0f: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114d12: e9 b4 00 00 00       	jmp	0xffff800000114dcb <__walk_range+0x2bb>
; 		if(ptbl_fn->ptbl_unmap && (*entry & PAGE_PRESENT) && (ret = ptbl_fn->ptbl_unmap(entry, base, end, walker) < 0)){
ffff800000114d17: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114d1b: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff800000114d20: 0f 84 58 00 00 00    	je	0xffff800000114d7e <__walk_range+0x26e>
ffff800000114d26: 48 8b 45 c8          	movq	-56(%rbp), %rax
ffff800000114d2a: 48 8b 00             	movq	(%rax), %rax
ffff800000114d2d: 48 83 e0 01          	andq	$1, %rax
ffff800000114d31: 48 83 f8 00          	cmpq	$0, %rax
ffff800000114d35: 0f 84 43 00 00 00    	je	0xffff800000114d7e <__walk_range+0x26e>
ffff800000114d3b: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114d3f: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000114d43: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff800000114d47: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff800000114d4b: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000114d4f: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff800000114d53: ff d0                	callq	*%rax
ffff800000114d55: 83 f8 00             	cmpl	$0, %eax
ffff800000114d58: 0f 9c c0             	setl	%al
ffff800000114d5b: 88 c1                	movb	%al, %cl
ffff800000114d5d: 80 e1 01             	andb	$1, %cl
ffff800000114d60: 0f b6 c9             	movzbl	%cl, %ecx
ffff800000114d63: 89 4d b4             	movl	%ecx, -76(%rbp)
ffff800000114d66: a8 01                	testb	$1, %al
ffff800000114d68: 0f 85 05 00 00 00    	jne	0xffff800000114d73 <__walk_range+0x263>
ffff800000114d6e: e9 0b 00 00 00       	jmp	0xffff800000114d7e <__walk_range+0x26e>
; 			return ret;
ffff800000114d73: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114d76: 89 45 fc             	movl	%eax, -4(%rbp)
ffff800000114d79: e9 4d 00 00 00       	jmp	0xffff800000114dcb <__walk_range+0x2bb>
; 		page_entry_base = sign_extend(page_entry_end + 1);
ffff800000114d7e: 48 8b 7d b8          	movq	-72(%rbp), %rdi
ffff800000114d82: 48 83 c7 01          	addq	$1, %rdi
ffff800000114d86: 48 b8 f0 4f 11 00 00 80 ff ff	movabsq	$-140737487220752, %rax # imm = 0xFFFF800000114FF0
ffff800000114d90: ff d0                	callq	*%rax
ffff800000114d92: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 		page_entry_end = sign_extend(ptbl_fn->ptbl_end(page_entry_base));
ffff800000114d96: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000114d9a: 48 8b 40 20          	movq	32(%rax), %rax
ffff800000114d9e: 48 8b 7d c0          	movq	-64(%rbp), %rdi
ffff800000114da2: ff d0                	callq	*%rax
ffff800000114da4: 48 89 c7             	movq	%rax, %rdi
ffff800000114da7: 48 b8 f0 4f 11 00 00 80 ff ff	movabsq	$-140737487220752, %rax # imm = 0xFFFF800000114FF0
ffff800000114db1: ff d0                	callq	*%rax
ffff800000114db3: 48 89 45 b8          	movq	%rax, -72(%rbp)
; 	for(int i = ptbl_fn->ptbl_index(base); i <= ptbl_fn->ptbl_index(end); i++){
ffff800000114db7: 8b 45 b0             	movl	-80(%rbp), %eax
ffff800000114dba: 83 c0 01             	addl	$1, %eax
ffff800000114dbd: 89 45 b0             	movl	%eax, -80(%rbp)
ffff800000114dc0: e9 b4 fd ff ff       	jmp	0xffff800000114b79 <__walk_range+0x69>
; 	return ret;
ffff800000114dc5: 8b 45 b4             	movl	-76(%rbp), %eax
ffff800000114dc8: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff800000114dcb: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000114dce: 48 83 c4 70          	addq	$112, %rsp
ffff800000114dd2: 5d                   	popq	%rbp
ffff800000114dd3: c3                   	retq
ffff800000114dd4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114dde: 66 90                	nop

ffff800000114de0 <pdir_walk_range>:
; {
ffff800000114de0: 55                   	pushq	%rbp
ffff800000114de1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114de4: 48 83 ec 50          	subq	$80, %rsp
ffff800000114de8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114dec: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114df0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114df4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pde_callback,
ffff800000114df8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114dfc: 48 8b 40 08          	movq	8(%rax), %rax
; 	{
ffff800000114e00: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pde_unmap,
ffff800000114e04: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114e08: 48 8b 40 28          	movq	40(%rax), %rax
; 	{
ffff800000114e0c: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114e10: 48 b8 b0 4e 11 00 00 80 ff ff	movabsq	$-140737487221072, %rax # imm = 0xFFFF800000114EB0
ffff800000114e1a: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000114e1e: 48 b8 40 4f 11 00 00 80 ff ff	movabsq	$-140737487220928, %rax # imm = 0xFFFF800000114F40
ffff800000114e28: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114e2c: 48 b8 60 4f 11 00 00 80 ff ff	movabsq	$-140737487220896, %rax # imm = 0xFFFF800000114F60
ffff800000114e36: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114e3a: 48 b8 80 4f 11 00 00 80 ff ff	movabsq	$-140737487220864, %rax # imm = 0xFFFF800000114F80
ffff800000114e44: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	return __walk_range(pdir, base, end, &ptbl_fns, walker);
ffff800000114e48: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114e4c: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114e50: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114e54: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114e58: 48 b8 10 4b 11 00 00 80 ff ff	movabsq	$-140737487222000, %rax # imm = 0xFFFF800000114B10
ffff800000114e62: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114e66: ff d0                	callq	*%rax
ffff800000114e68: 48 83 c4 50          	addq	$80, %rsp
ffff800000114e6c: 5d                   	popq	%rbp
ffff800000114e6d: c3                   	retq
ffff800000114e6e: 66 90                	nop

ffff800000114e70 <pdpt_index>:
; static inline int pdpt_index(uintptr_t addr) {return PDPT_INDEX(addr);}
ffff800000114e70: 55                   	pushq	%rbp
ffff800000114e71: 48 89 e5             	movq	%rsp, %rbp
ffff800000114e74: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114e78: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114e7c: 48 c1 e8 1e          	shrq	$30, %rax
ffff800000114e80: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114e86: 5d                   	popq	%rbp
ffff800000114e87: c3                   	retq
ffff800000114e88: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114e90 <pdpt_end>:
; {
ffff800000114e90: 55                   	pushq	%rbp
ffff800000114e91: 48 89 e5             	movq	%rsp, %rbp
ffff800000114e94: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_DIR_SPAN - 1);
ffff800000114e98: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114e9c: 48 0d ff ff ff 3f    	orq	$1073741823, %rax       # imm = 0x3FFFFFFF
ffff800000114ea2: 5d                   	popq	%rbp
ffff800000114ea3: c3                   	retq
ffff800000114ea4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114eae: 66 90                	nop

ffff800000114eb0 <ptbl_walk_range>:
; {
ffff800000114eb0: 55                   	pushq	%rbp
ffff800000114eb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114eb4: 48 83 ec 50          	subq	$80, %rsp
ffff800000114eb8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114ebc: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114ec0: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114ec4: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 		.ptbl_callback = walker->pte_callback,
ffff800000114ec8: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114ecc: 48 8b 00             	movq	(%rax), %rax
; 	{
ffff800000114ecf: 48 89 45 b0          	movq	%rax, -80(%rbp)
; 		.ptbl_unmap = walker->pte_unmap,
ffff800000114ed3: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000114ed7: 48 8b 40 20          	movq	32(%rax), %rax
; 	{
ffff800000114edb: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000114edf: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000114ee7: 48 b8 b0 4f 11 00 00 80 ff ff	movabsq	$-140737487220816, %rax # imm = 0xFFFF800000114FB0
ffff800000114ef1: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff800000114ef5: 48 b8 d0 4f 11 00 00 80 ff ff	movabsq	$-140737487220784, %rax # imm = 0xFFFF800000114FD0
ffff800000114eff: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000114f03: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	return __walk_range(ptbl, base, end, &ptbl_fns, walker);
ffff800000114f0b: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000114f0f: 48 8b 75 f0          	movq	-16(%rbp), %rsi
ffff800000114f13: 48 8b 55 e8          	movq	-24(%rbp), %rdx
ffff800000114f17: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000114f1b: 48 b8 10 4b 11 00 00 80 ff ff	movabsq	$-140737487222000, %rax # imm = 0xFFFF800000114B10
ffff800000114f25: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff800000114f29: ff d0                	callq	*%rax
ffff800000114f2b: 48 83 c4 50          	addq	$80, %rsp
ffff800000114f2f: 5d                   	popq	%rbp
ffff800000114f30: c3                   	retq
ffff800000114f31: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114f3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000114f40 <pd_index>:
; static inline int pd_index(uintptr_t addr) {return PAGE_DIR_INDEX(addr);}
ffff800000114f40: 55                   	pushq	%rbp
ffff800000114f41: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f44: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114f48: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f4c: 48 c1 e8 15          	shrq	$21, %rax
ffff800000114f50: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114f56: 5d                   	popq	%rbp
ffff800000114f57: c3                   	retq
ffff800000114f58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114f60 <pdir_end>:
; {
ffff800000114f60: 55                   	pushq	%rbp
ffff800000114f61: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f64: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_TABLE_SPAN - 1);
ffff800000114f68: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f6c: 48 0d ff ff 1f 00    	orq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000114f72: 5d                   	popq	%rbp
ffff800000114f73: c3                   	retq
ffff800000114f74: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114f7e: 66 90                	nop

ffff800000114f80 <stop_walk_pdir>:
; static inline int stop_walk_pdir(physaddr_t *entry, uintptr_t base, uintptr_t end, struct page_walker *walker){
ffff800000114f80: 55                   	pushq	%rbp
ffff800000114f81: 48 89 e5             	movq	%rsp, %rbp
ffff800000114f84: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114f88: 48 89 75 f0          	movq	%rsi, -16(%rbp)
ffff800000114f8c: 48 89 55 e8          	movq	%rdx, -24(%rbp)
ffff800000114f90: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	return *entry & PAGE_HUGE;
ffff800000114f94: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114f98: 48 8b 00             	movq	(%rax), %rax
ffff800000114f9b: 48 25 80 00 00 00    	andq	$128, %rax
ffff800000114fa1: 5d                   	popq	%rbp
ffff800000114fa2: c3                   	retq
ffff800000114fa3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114fad: 0f 1f 00             	nopl	(%rax)

ffff800000114fb0 <pt_index>:
; static inline int pt_index(uintptr_t addr) {return PAGE_TABLE_INDEX(addr);}
ffff800000114fb0: 55                   	pushq	%rbp
ffff800000114fb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114fb4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff800000114fb8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114fbc: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000114fc0: 48 25 ff 01 00 00    	andq	$511, %rax              # imm = 0x1FF
ffff800000114fc6: 5d                   	popq	%rbp
ffff800000114fc7: c3                   	retq
ffff800000114fc8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000114fd0 <pt_end>:
; {
ffff800000114fd0: 55                   	pushq	%rbp
ffff800000114fd1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114fd4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return addr | (PAGE_SIZE - 1);
ffff800000114fd8: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000114fdc: 48 0d ff 0f 00 00    	orq	$4095, %rax             # imm = 0xFFF
ffff800000114fe2: 5d                   	popq	%rbp
ffff800000114fe3: c3                   	retq
ffff800000114fe4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000114fee: 66 90                	nop

ffff800000114ff0 <sign_extend>:
; {
ffff800000114ff0: 55                   	pushq	%rbp
ffff800000114ff1: 48 89 e5             	movq	%rsp, %rbp
ffff800000114ff4: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff800000114ff8: 48 b8 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rax # imm = 0x800000000000
ffff800000115002: 48 39 45 f8          	cmpq	%rax, -8(%rbp)
ffff800000115006: 0f 83 0d 00 00 00    	jae	0xffff800000115019 <sign_extend+0x29>
ffff80000011500c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115010: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000115014: e9 12 00 00 00       	jmp	0xffff80000011502b <sign_extend+0x3b>
ffff800000115019: 48 b8 00 00 00 00 00 00 ff ff	movabsq	$-281474976710656, %rax # imm = 0xFFFF000000000000
ffff800000115023: 48 0b 45 f8          	orq	-8(%rbp), %rax
ffff800000115027: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000011502b: 48 8b 45 f0          	movq	-16(%rbp), %rax
; 	return (addr < USER_LIM) ? addr : (0xffff000000000000ull | addr); //TODO check edge case of USER_LIM
ffff80000011502f: 5d                   	popq	%rbp
ffff800000115030: c3                   	retq
ffff800000115031: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011503b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000115040 <pa2page>:
; {
ffff800000115040: 55                   	pushq	%rbp
ffff800000115041: 48 89 e5             	movq	%rsp, %rbp
ffff800000115044: 48 83 ec 10          	subq	$16, %rsp
ffff800000115048: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000011504c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115050: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000115054: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011505e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000115061: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115064: 0f 82 27 00 00 00    	jb	0xffff800000115091 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff80000011506a: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000115074: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff80000011507e: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115088: 31 c0                	xorl	%eax, %eax
ffff80000011508a: be 49 00 00 00       	movl	$73, %esi
ffff80000011508f: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000115091: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011509b: 48 8b 00             	movq	(%rax), %rax
ffff80000011509e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001150a2: 48 c1 e9 0c          	shrq	$12, %rcx
ffff8000001150a6: 48 c1 e1 05          	shlq	$5, %rcx
ffff8000001150aa: 48 01 c8             	addq	%rcx, %rax
ffff8000001150ad: 48 83 c4 10          	addq	$16, %rsp
ffff8000001150b1: 5d                   	popq	%rbp
ffff8000001150b2: c3                   	retq
ffff8000001150b3: cc                   	int3
ffff8000001150b4: cc                   	int3
ffff8000001150b5: cc                   	int3
ffff8000001150b6: cc                   	int3
ffff8000001150b7: cc                   	int3
ffff8000001150b8: cc                   	int3
ffff8000001150b9: cc                   	int3
ffff8000001150ba: cc                   	int3
ffff8000001150bb: cc                   	int3
ffff8000001150bc: cc                   	int3
ffff8000001150bd: cc                   	int3
ffff8000001150be: cc                   	int3
ffff8000001150bf: cc                   	int3

ffff8000001150c0 <lab2_do_check_ptbl_flags>:
; {
ffff8000001150c0: 55                   	pushq	%rbp
ffff8000001150c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001150c4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001150c8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001150cc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001150d0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001150d4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if(*entry & PAGE_PRESENT) cprintf("entry present in va range %p - %p\n", base, end);
ffff8000001150d8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001150dc: 48 8b 00             	movq	(%rax), %rax
ffff8000001150df: 48 83 e0 01          	andq	$1, %rax
ffff8000001150e3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001150e7: 0f 84 20 00 00 00    	je	0xffff80000011510d <lab2_do_check_ptbl_flags+0x4d>
ffff8000001150ed: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff8000001150f1: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff8000001150f5: 48 bf 3e 88 11 00 00 80 ff ff	movabsq	$-140737487206338, %rdi # imm = 0xFFFF80000011883E
ffff8000001150ff: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115109: 31 c0                	xorl	%eax, %eax
ffff80000011510b: ff d1                	callq	*%rcx
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff80000011510d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115111: 48 8b 00             	movq	(%rax), %rax
ffff800000115114: 48 83 e0 01          	andq	$1, %rax
ffff800000115118: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011511c: 0f 84 17 00 00 00    	je	0xffff800000115139 <lab2_do_check_ptbl_flags+0x79>
ffff800000115122: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115126: 48 8b 00             	movq	(%rax), %rax
ffff800000115129: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011512f: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115133: 0f 84 0c 00 00 00    	je	0xffff800000115145 <lab2_do_check_ptbl_flags+0x85>
; 		return 0;
ffff800000115139: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115140: e9 53 00 00 00       	jmp	0xffff800000115198 <lab2_do_check_ptbl_flags+0xd8>
; 	flags = *entry & PAGE_MASK;
ffff800000115145: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000115149: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000115153: 48 23 01             	andq	(%rcx), %rax
ffff800000115156: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags != (PAGE_PRESENT | PAGE_WRITE | PAGE_USER)) {
ffff80000011515a: 48 83 7d d0 07       	cmpq	$7, -48(%rbp)
ffff80000011515f: 0f 84 2c 00 00 00    	je	0xffff800000115191 <lab2_do_check_ptbl_flags+0xd1>
; 		panic("%p points to a page table with the wrong "
ffff800000115165: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115169: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115173: 48 ba 57 95 11 00 00 80 ff ff	movabsq	$-140737487202985, %rdx # imm = 0xFFFF800000119557
ffff80000011517d: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115187: 31 c0                	xorl	%eax, %eax
ffff800000115189: be 1d 00 00 00       	movl	$29, %esi
ffff80000011518e: 41 ff d0             	callq	*%r8
; 	return 0;
ffff800000115191: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000115198: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011519b: 48 83 c4 30          	addq	$48, %rsp
ffff80000011519f: 5d                   	popq	%rbp
ffff8000001151a0: c3                   	retq
ffff8000001151a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001151ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001151b0 <lab2_check_ptbl_flags>:
; {
ffff8000001151b0: 55                   	pushq	%rbp
ffff8000001151b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001151b4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001151b8: 48 be 58 83 11 00 00 80 ff ff	movabsq	$-140737487207592, %rsi # imm = 0xFFFF800000118358
ffff8000001151c2: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001151c7: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff8000001151cb: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001151ce: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001151d8: 48 8b 38             	movq	(%rax), %rdi
ffff8000001151db: 48 b8 80 49 11 00 00 80 ff ff	movabsq	$-140737487222400, %rax # imm = 0xFFFF800000114980
ffff8000001151e5: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff8000001151e9: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_ptbl_flags() succeeded!\n");
ffff8000001151eb: 48 bf 82 89 11 00 00 80 ff ff	movabsq	$-140737487206014, %rdi # imm = 0xFFFF800000118982
ffff8000001151f5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001151ff: 31 c0                	xorl	%eax, %eax
ffff800000115201: ff d1                	callq	*%rcx
; }
ffff800000115203: 48 83 c4 50          	addq	$80, %rsp
ffff800000115207: 5d                   	popq	%rbp
ffff800000115208: c3                   	retq
ffff800000115209: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115210 <lab2_check_pte_wx>:
; {
ffff800000115210: 55                   	pushq	%rbp
ffff800000115211: 48 89 e5             	movq	%rsp, %rbp
ffff800000115214: 48 83 ec 30          	subq	$48, %rsp
ffff800000115218: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011521c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115220: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115224: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000115228: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011522c: 48 8b 00             	movq	(%rax), %rax
ffff80000011522f: 48 83 e0 01          	andq	$1, %rax
ffff800000115233: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115237: 0f 85 0c 00 00 00    	jne	0xffff800000115249 <lab2_check_pte_wx+0x39>
; 		return 0;
ffff80000011523d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115244: e9 53 00 00 00       	jmp	0xffff80000011529c <lab2_check_pte_wx+0x8c>
; 	flags = *entry & (PAGE_WRITE | PAGE_NO_EXEC);
ffff800000115249: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff80000011524d: 48 b8 02 00 00 00 00 00 00 80	movabsq	$-9223372036854775806, %rax # imm = 0x8000000000000002
ffff800000115257: 48 23 01             	andq	(%rcx), %rax
ffff80000011525a: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags == PAGE_WRITE) {
ffff80000011525e: 48 83 7d d0 02       	cmpq	$2, -48(%rbp)
ffff800000115263: 0f 85 2c 00 00 00    	jne	0xffff800000115295 <lab2_check_pte_wx+0x85>
; 		panic("%p is mapped as write executable!\n", base);
ffff800000115269: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011526d: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115277: 48 ba 3a 85 11 00 00 80 ff ff	movabsq	$-140737487207110, %rdx # imm = 0xFFFF80000011853A
ffff800000115281: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011528b: 31 c0                	xorl	%eax, %eax
ffff80000011528d: be 3e 00 00 00       	movl	$62, %esi
ffff800000115292: 41 ff d0             	callq	*%r8
; 	return 0;
ffff800000115295: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff80000011529c: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011529f: 48 83 c4 30          	addq	$48, %rsp
ffff8000001152a3: 5d                   	popq	%rbp
ffff8000001152a4: c3                   	retq
ffff8000001152a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001152af: 90                   	nop

ffff8000001152b0 <lab2_check_pde_wx>:
; {
ffff8000001152b0: 55                   	pushq	%rbp
ffff8000001152b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001152b4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001152b8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001152bc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff8000001152c0: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff8000001152c4: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001152c8: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001152cc: 48 8b 00             	movq	(%rax), %rax
ffff8000001152cf: 48 83 e0 01          	andq	$1, %rax
ffff8000001152d3: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001152d7: 0f 84 17 00 00 00    	je	0xffff8000001152f4 <lab2_check_pde_wx+0x44>
ffff8000001152dd: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001152e1: 48 8b 00             	movq	(%rax), %rax
ffff8000001152e4: 48 25 80 00 00 00    	andq	$128, %rax
ffff8000001152ea: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001152ee: 0f 85 0c 00 00 00    	jne	0xffff800000115300 <lab2_check_pde_wx+0x50>
; 		return 0;
ffff8000001152f4: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001152fb: e9 53 00 00 00       	jmp	0xffff800000115353 <lab2_check_pde_wx+0xa3>
; 	flags = *entry & (PAGE_WRITE | PAGE_NO_EXEC);
ffff800000115300: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff800000115304: 48 b8 02 00 00 00 00 00 00 80	movabsq	$-9223372036854775806, %rax # imm = 0x8000000000000002
ffff80000011530e: 48 23 01             	andq	(%rcx), %rax
ffff800000115311: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	if (flags == PAGE_WRITE) {
ffff800000115315: 48 83 7d d0 02       	cmpq	$2, -48(%rbp)
ffff80000011531a: 0f 85 2c 00 00 00    	jne	0xffff80000011534c <lab2_check_pde_wx+0x9c>
; 		panic("%p is mapped as write executable!\n", base);
ffff800000115320: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115324: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011532e: 48 ba 3a 85 11 00 00 80 ff ff	movabsq	$-140737487207110, %rdx # imm = 0xFFFF80000011853A
ffff800000115338: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115342: 31 c0                	xorl	%eax, %eax
ffff800000115344: be 52 00 00 00       	movl	$82, %esi
ffff800000115349: 41 ff d0             	callq	*%r8
; 	return 0;
ffff80000011534c: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000115353: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000115356: 48 83 c4 30          	addq	$48, %rsp
ffff80000011535a: 5d                   	popq	%rbp
ffff80000011535b: c3                   	retq
ffff80000011535c: 0f 1f 40 00          	nopl	(%rax)

ffff800000115360 <lab2_check_wx>:
; {
ffff800000115360: 55                   	pushq	%rbp
ffff800000115361: 48 89 e5             	movq	%rsp, %rbp
ffff800000115364: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000115368: 48 be a8 83 11 00 00 80 ff ff	movabsq	$-140737487207512, %rsi # imm = 0xFFFF8000001183A8
ffff800000115372: b9 0a 00 00 00       	movl	$10, %ecx
ffff800000115377: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000011537b: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff80000011537e: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115388: 48 8b 38             	movq	(%rax), %rdi
ffff80000011538b: 48 b8 80 49 11 00 00 80 ff ff	movabsq	$-140737487222400, %rax # imm = 0xFFFF800000114980
ffff800000115395: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115399: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_wx() succeeded!\n");
ffff80000011539b: 48 bf c1 91 11 00 00 80 ff ff	movabsq	$-140737487203903, %rdi # imm = 0xFFFF8000001191C1
ffff8000001153a5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001153af: 31 c0                	xorl	%eax, %eax
ffff8000001153b1: ff d1                	callq	*%rcx
; }
ffff8000001153b3: 48 83 c4 50          	addq	$80, %rsp
ffff8000001153b7: 5d                   	popq	%rbp
ffff8000001153b8: c3                   	retq
ffff8000001153b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001153c0 <lab2_check_nx>:
; {
ffff8000001153c0: 55                   	pushq	%rbp
ffff8000001153c1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(read_msr(MSR_EFER) & MSR_EFER_NXE)) {
ffff8000001153c4: 48 b8 30 54 11 00 00 80 ff ff	movabsq	$-140737487219664, %rax # imm = 0xFFFF800000115430
ffff8000001153ce: bf 80 00 00 c0       	movl	$3221225600, %edi       # imm = 0xC0000080
ffff8000001153d3: ff d0                	callq	*%rax
ffff8000001153d5: 48 25 00 08 00 00    	andq	$2048, %rax             # imm = 0x800
ffff8000001153db: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001153df: 0f 85 27 00 00 00    	jne	0xffff80000011540c <lab2_check_nx+0x4c>
; 		panic("No eXecute bit is disabled!");
ffff8000001153e5: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001153ef: 48 ba 7e 86 11 00 00 80 ff ff	movabsq	$-140737487206786, %rdx # imm = 0xFFFF80000011867E
ffff8000001153f9: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115403: 31 c0                	xorl	%eax, %eax
ffff800000115405: be 67 00 00 00       	movl	$103, %esi
ffff80000011540a: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_nx() succeeded!\n");
ffff80000011540c: 48 bf a9 89 11 00 00 80 ff ff	movabsq	$-140737487205975, %rdi # imm = 0xFFFF8000001189A9
ffff800000115416: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115420: 31 c0                	xorl	%eax, %eax
ffff800000115422: ff d1                	callq	*%rcx
; }
ffff800000115424: 5d                   	popq	%rbp
ffff800000115425: c3                   	retq
ffff800000115426: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000115430 <read_msr>:
; {
ffff800000115430: 55                   	pushq	%rbp
ffff800000115431: 48 89 e5             	movq	%rsp, %rbp
ffff800000115434: 89 7d fc             	movl	%edi, -4(%rbp)
; 		"c" (reg));
ffff800000115437: 8b 4d fc             	movl	-4(%rbp), %ecx
; 	asm volatile(
ffff80000011543a: 0f 32                	rdmsr
ffff80000011543c: 89 45 f8             	movl	%eax, -8(%rbp)
ffff80000011543f: 89 55 f4             	movl	%edx, -12(%rbp)
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff800000115442: 8b 45 f4             	movl	-12(%rbp), %eax
ffff800000115445: 48 c1 e0 20          	shlq	$32, %rax
ffff800000115449: 8b 4d f8             	movl	-8(%rbp), %ecx
ffff80000011544c: 48 09 c8             	orq	%rcx, %rax
ffff80000011544f: 5d                   	popq	%rbp
ffff800000115450: c3                   	retq
ffff800000115451: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011545b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000115460 <lab2_check_pte_vas>:
; {
ffff800000115460: 55                   	pushq	%rbp
ffff800000115461: 48 89 e5             	movq	%rsp, %rbp
ffff800000115464: 48 83 ec 30          	subq	$48, %rsp
ffff800000115468: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011546c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115470: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115474: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000115478: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011547c: 48 8b 00             	movq	(%rax), %rax
ffff80000011547f: 48 83 e0 01          	andq	$1, %rax
ffff800000115483: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115487: 0f 85 0c 00 00 00    	jne	0xffff800000115499 <lab2_check_pte_vas+0x39>
; 		return 0;
ffff80000011548d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115494: e9 b8 00 00 00       	jmp	0xffff800000115551 <lab2_check_pte_vas+0xf1>
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000115499: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001154a3: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001154a7: 0f 87 20 00 00 00    	ja	0xffff8000001154cd <lab2_check_pte_vas+0x6d>
ffff8000001154ad: 48 b8 00 00 00 00 10 80 ff ff	movabsq	$-140668768878592, %rax # imm = 0xFFFF801000000000
ffff8000001154b7: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff8000001154bb: 0f 83 0c 00 00 00    	jae	0xffff8000001154cd <lab2_check_pte_vas+0x6d>
; 		return 0;
ffff8000001154c1: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001154c8: e9 84 00 00 00       	jmp	0xffff800000115551 <lab2_check_pte_vas+0xf1>
; 	if (KPAGES <= base) {
ffff8000001154cd: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff8000001154d7: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001154db: 0f 87 0c 00 00 00    	ja	0xffff8000001154ed <lab2_check_pte_vas+0x8d>
; 		return 0;
ffff8000001154e1: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001154e8: e9 64 00 00 00       	jmp	0xffff800000115551 <lab2_check_pte_vas+0xf1>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff8000001154ed: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff8000001154f7: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff8000001154fb: 0f 87 20 00 00 00    	ja	0xffff800000115521 <lab2_check_pte_vas+0xc1>
ffff800000115501: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff80000011550b: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff80000011550f: 0f 83 0c 00 00 00    	jae	0xffff800000115521 <lab2_check_pte_vas+0xc1>
; 		return 0;
ffff800000115515: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011551c: e9 30 00 00 00       	jmp	0xffff800000115551 <lab2_check_pte_vas+0xf1>
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff800000115521: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115525: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff800000115529: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115533: 48 ba ff 8d 11 00 00 80 ff ff	movabsq	$-140737487204865, %rdx # imm = 0xFFFF800000118DFF
ffff80000011553d: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff800000115547: 31 c0                	xorl	%eax, %eax
ffff800000115549: be 83 00 00 00       	movl	$131, %esi
ffff80000011554e: 41 ff d1             	callq	*%r9
; }
ffff800000115551: 8b 45 fc             	movl	-4(%rbp), %eax
ffff800000115554: 48 83 c4 30          	addq	$48, %rsp
ffff800000115558: 5d                   	popq	%rbp
ffff800000115559: c3                   	retq
ffff80000011555a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000115560 <lab2_check_pde_vas>:
; {
ffff800000115560: 55                   	pushq	%rbp
ffff800000115561: 48 89 e5             	movq	%rsp, %rbp
ffff800000115564: 48 83 ec 30          	subq	$48, %rsp
ffff800000115568: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011556c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115570: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115574: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff800000115578: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011557c: 48 8b 00             	movq	(%rax), %rax
ffff80000011557f: 48 83 e0 01          	andq	$1, %rax
ffff800000115583: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115587: 0f 84 17 00 00 00    	je	0xffff8000001155a4 <lab2_check_pde_vas+0x44>
ffff80000011558d: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115591: 48 8b 00             	movq	(%rax), %rax
ffff800000115594: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011559a: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011559e: 0f 85 0c 00 00 00    	jne	0xffff8000001155b0 <lab2_check_pde_vas+0x50>
; 		return 0;
ffff8000001155a4: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001155ab: e9 1f 00 00 00       	jmp	0xffff8000001155cf <lab2_check_pde_vas+0x6f>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff8000001155b0: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001155b4: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff8000001155b8: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff8000001155bc: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001155c0: 48 b8 60 54 11 00 00 80 ff ff	movabsq	$-140737487219616, %rax # imm = 0xFFFF800000115460
ffff8000001155ca: ff d0                	callq	*%rax
ffff8000001155cc: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff8000001155cf: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001155d2: 48 83 c4 30          	addq	$48, %rsp
ffff8000001155d6: 5d                   	popq	%rbp
ffff8000001155d7: c3                   	retq
ffff8000001155d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001155e0 <lab2_check_vas>:
; {
ffff8000001155e0: 55                   	pushq	%rbp
ffff8000001155e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001155e4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001155e8: 48 be f8 83 11 00 00 80 ff ff	movabsq	$-140737487207432, %rsi # imm = 0xFFFF8000001183F8
ffff8000001155f2: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001155f7: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff8000001155fb: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001155fe: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115608: 48 8b 38             	movq	(%rax), %rdi
ffff80000011560b: 48 b8 80 49 11 00 00 80 ff ff	movabsq	$-140737487222400, %rax # imm = 0xFFFF800000114980
ffff800000115615: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff800000115619: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_vas() succeeded!\n");
ffff80000011561b: 48 bf 75 85 11 00 00 80 ff ff	movabsq	$-140737487207051, %rdi # imm = 0xFFFF800000118575
ffff800000115625: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff80000011562f: 31 c0                	xorl	%eax, %eax
ffff800000115631: ff d1                	callq	*%rcx
; }
ffff800000115633: 48 83 c4 50          	addq	$80, %rsp
ffff800000115637: 5d                   	popq	%rbp
ffff800000115638: c3                   	retq
ffff800000115639: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115640 <need_mapping>:
; int need_mapping(uintptr_t base, uintptr_t end){
ffff800000115640: 55                   	pushq	%rbp
ffff800000115641: 48 89 e5             	movq	%rsp, %rbp
ffff800000115644: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000115648: 48 89 75 e8          	movq	%rsi, -24(%rbp)
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff80000011564c: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff800000115656: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff80000011565a: 0f 87 37 00 00 00    	ja	0xffff800000115697 <need_mapping+0x57>
ffff800000115660: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000115664: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011566e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000115671: 48 c1 e1 0c          	shlq	$12, %rcx
ffff800000115675: 48 ba 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rdx # imm = 0xFFFF800000000000
ffff80000011567f: 48 01 d1             	addq	%rdx, %rcx
ffff800000115682: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115685: 0f 83 0c 00 00 00    	jae	0xffff800000115697 <need_mapping+0x57>
; 		return 1;
ffff80000011568b: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff800000115692: e9 c0 00 00 00       	jmp	0xffff800000115757 <need_mapping+0x117>
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff800000115697: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff8000001156a1: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff8000001156a5: 0f 87 71 00 00 00    	ja	0xffff80000011571c <need_mapping+0xdc>
ffff8000001156ab: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001156af: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff8000001156b3: 48 c7 45 e0 00 10 00 00      	movq	$4096, -32(%rbp) # imm = 0x1000
ffff8000001156bb: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff8000001156c5: 48 8b 00             	movq	(%rax), %rax
ffff8000001156c8: 48 c1 e0 05          	shlq	$5, %rax
ffff8000001156cc: 48 03 45 e0          	addq	-32(%rbp), %rax
ffff8000001156d0: 48 83 e8 01          	subq	$1, %rax
ffff8000001156d4: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001156d8: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff8000001156dc: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001156e0: 31 d2                	xorl	%edx, %edx
ffff8000001156e2: 48 f7 75 e0          	divq	-32(%rbp)
ffff8000001156e6: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff8000001156ea: 48 29 d1             	subq	%rdx, %rcx
ffff8000001156ed: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff8000001156f1: 48 8b 4d c8          	movq	-56(%rbp), %rcx
ffff8000001156f5: 48 89 4d d8          	movq	%rcx, -40(%rbp)
ffff8000001156f9: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff800000115703: 48 03 4d d8          	addq	-40(%rbp), %rcx
ffff800000115707: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011570a: 0f 83 0c 00 00 00    	jae	0xffff80000011571c <need_mapping+0xdc>
; 		return 1;
ffff800000115710: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff800000115717: e9 3b 00 00 00       	jmp	0xffff800000115757 <need_mapping+0x117>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011571c: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff800000115726: 48 3b 45 f0          	cmpq	-16(%rbp), %rax
ffff80000011572a: 0f 87 20 00 00 00    	ja	0xffff800000115750 <need_mapping+0x110>
ffff800000115730: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff80000011573a: 48 39 45 e8          	cmpq	%rax, -24(%rbp)
ffff80000011573e: 0f 83 0c 00 00 00    	jae	0xffff800000115750 <need_mapping+0x110>
; 		return 1;
ffff800000115744: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
ffff80000011574b: e9 07 00 00 00       	jmp	0xffff800000115757 <need_mapping+0x117>
; 	return 0;
ffff800000115750: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; }
ffff800000115757: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000011575a: 5d                   	popq	%rbp
ffff80000011575b: c3                   	retq
ffff80000011575c: 0f 1f 40 00          	nopl	(%rax)

ffff800000115760 <lab2_check_pte_vas_ext>:
; {
ffff800000115760: 55                   	pushq	%rbp
ffff800000115761: 48 89 e5             	movq	%rsp, %rbp
ffff800000115764: 48 83 ec 30          	subq	$48, %rsp
ffff800000115768: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff80000011576c: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115770: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115774: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if ((end - base) != 0xfff) {
ffff800000115778: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011577c: 48 2b 45 e8          	subq	-24(%rbp), %rax
ffff800000115780: 48 3d ff 0f 00 00    	cmpq	$4095, %rax             # imm = 0xFFF
ffff800000115786: 0f 84 30 00 00 00    	je	0xffff8000001157bc <lab2_check_pte_vas_ext+0x5c>
; 		panic("end [%llx] - base [%llx] should be 4kb - 1  bytes\n", end, base);
ffff80000011578c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000115790: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff800000115794: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011579e: 48 ba bd 92 11 00 00 80 ff ff	movabsq	$-140737487203651, %rdx # imm = 0xFFFF8000001192BD
ffff8000001157a8: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001157b2: 31 c0                	xorl	%eax, %eax
ffff8000001157b4: be b6 00 00 00       	movl	$182, %esi
ffff8000001157b9: 41 ff d1             	callq	*%r9
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001157bc: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001157c0: 48 8b 00             	movq	(%rax), %rax
ffff8000001157c3: 48 83 e0 01          	andq	$1, %rax
ffff8000001157c7: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001157cb: 0f 85 50 00 00 00    	jne	0xffff800000115821 <lab2_check_pte_vas_ext+0xc1>
;                 if (need_mapping(base, end)){
ffff8000001157d1: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001157d5: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001157d9: 48 b8 40 56 11 00 00 80 ff ff	movabsq	$-140737487219136, %rax # imm = 0xFFFF800000115640
ffff8000001157e3: ff d0                	callq	*%rax
ffff8000001157e5: 83 f8 00             	cmpl	$0, %eax
ffff8000001157e8: 0f 84 27 00 00 00    	je	0xffff800000115815 <lab2_check_pte_vas_ext+0xb5>
;                     panic("All backing pages for the budy, page_info structs and kernel stack must be mapped\n");
ffff8000001157ee: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001157f8: 48 ba 34 8c 11 00 00 80 ff ff	movabsq	$-140737487205324, %rdx # imm = 0xFFFF800000118C34
ffff800000115802: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff80000011580c: 31 c0                	xorl	%eax, %eax
ffff80000011580e: be bc 00 00 00       	movl	$188, %esi
ffff800000115813: ff d1                	callq	*%rcx
; 		return 0;
ffff800000115815: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011581c: e9 b8 00 00 00       	jmp	0xffff8000001158d9 <lab2_check_pte_vas_ext+0x179>
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000115821: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff80000011582b: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff80000011582f: 0f 87 20 00 00 00    	ja	0xffff800000115855 <lab2_check_pte_vas_ext+0xf5>
ffff800000115835: 48 b8 00 00 00 00 10 80 ff ff	movabsq	$-140668768878592, %rax # imm = 0xFFFF801000000000
ffff80000011583f: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff800000115843: 0f 83 0c 00 00 00    	jae	0xffff800000115855 <lab2_check_pte_vas_ext+0xf5>
; 		return 0;
ffff800000115849: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115850: e9 84 00 00 00       	jmp	0xffff8000001158d9 <lab2_check_pte_vas_ext+0x179>
; 	if (KPAGES <= base) {
ffff800000115855: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
ffff80000011585f: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000115863: 0f 87 0c 00 00 00    	ja	0xffff800000115875 <lab2_check_pte_vas_ext+0x115>
; 		return 0;
ffff800000115869: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000115870: e9 64 00 00 00       	jmp	0xffff8000001158d9 <lab2_check_pte_vas_ext+0x179>
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000115875: 48 b8 00 80 ff ff 7f fe ff ff	movabsq	$-1649267474432, %rax # imm = 0xFFFFFE7FFFFF8000
ffff80000011587f: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000115883: 0f 87 20 00 00 00    	ja	0xffff8000001158a9 <lab2_check_pte_vas_ext+0x149>
ffff800000115889: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff800000115893: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff800000115897: 0f 83 0c 00 00 00    	jae	0xffff8000001158a9 <lab2_check_pte_vas_ext+0x149>
; 		return 0;
ffff80000011589d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff8000001158a4: e9 30 00 00 00       	jmp	0xffff8000001158d9 <lab2_check_pte_vas_ext+0x179>
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff8000001158a9: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001158ad: 4c 8b 45 e0          	movq	-32(%rbp), %r8
ffff8000001158b1: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001158bb: 48 ba ff 8d 11 00 00 80 ff ff	movabsq	$-140737487204865, %rdx # imm = 0xFFFF800000118DFF
ffff8000001158c5: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff8000001158cf: 31 c0                	xorl	%eax, %eax
ffff8000001158d1: be cf 00 00 00       	movl	$207, %esi
ffff8000001158d6: 41 ff d1             	callq	*%r9
; }
ffff8000001158d9: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001158dc: 48 83 c4 30          	addq	$48, %rsp
ffff8000001158e0: 5d                   	popq	%rbp
ffff8000001158e1: c3                   	retq
ffff8000001158e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001158ec: 0f 1f 40 00          	nopl	(%rax)

ffff8000001158f0 <lab2_check_pde_vas_ext>:
; {
ffff8000001158f0: 55                   	pushq	%rbp
ffff8000001158f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001158f4: 48 83 ec 30          	subq	$48, %rsp
ffff8000001158f8: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff8000001158fc: 48 89 75 e8          	movq	%rsi, -24(%rbp)
ffff800000115900: 48 89 55 e0          	movq	%rdx, -32(%rbp)
ffff800000115904: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	if ((end - base) != 0x1FFFFF) {
ffff800000115908: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011590c: 48 2b 45 e8          	subq	-24(%rbp), %rax
ffff800000115910: 48 3d ff ff 1f 00    	cmpq	$2097151, %rax          # imm = 0x1FFFFF
ffff800000115916: 0f 84 30 00 00 00    	je	0xffff80000011594c <lab2_check_pde_vas_ext+0x5c>
; 		panic("end [%llx] - base [%llx] should be a 2m page - 1\n", end, base);
ffff80000011591c: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000115920: 4c 8b 45 e8          	movq	-24(%rbp), %r8
ffff800000115924: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011592e: 48 ba 48 94 11 00 00 80 ff ff	movabsq	$-140737487203256, %rdx # imm = 0xFFFF800000119448
ffff800000115938: 49 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r9 # imm = 0xFFFF80000010CC40
ffff800000115942: 31 c0                	xorl	%eax, %eax
ffff800000115944: be d9 00 00 00       	movl	$217, %esi
ffff800000115949: 41 ff d1             	callq	*%r9
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff80000011594c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115950: 48 8b 00             	movq	(%rax), %rax
ffff800000115953: 48 83 e0 01          	andq	$1, %rax
ffff800000115957: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011595b: 0f 84 17 00 00 00    	je	0xffff800000115978 <lab2_check_pde_vas_ext+0x88>
ffff800000115961: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115965: 48 8b 00             	movq	(%rax), %rax
ffff800000115968: 48 25 80 00 00 00    	andq	$128, %rax
ffff80000011596e: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115972: 0f 85 0c 00 00 00    	jne	0xffff800000115984 <lab2_check_pde_vas_ext+0x94>
; 		return 0;
ffff800000115978: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000011597f: e9 1f 00 00 00       	jmp	0xffff8000001159a3 <lab2_check_pde_vas_ext+0xb3>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff800000115984: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000115988: 48 8b 75 e8          	movq	-24(%rbp), %rsi
ffff80000011598c: 48 8b 55 e0          	movq	-32(%rbp), %rdx
ffff800000115990: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff800000115994: 48 b8 60 54 11 00 00 80 ff ff	movabsq	$-140737487219616, %rax # imm = 0xFFFF800000115460
ffff80000011599e: ff d0                	callq	*%rax
ffff8000001159a0: 89 45 fc             	movl	%eax, -4(%rbp)
; }
ffff8000001159a3: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001159a6: 48 83 c4 30          	addq	$48, %rsp
ffff8000001159aa: 5d                   	popq	%rbp
ffff8000001159ab: c3                   	retq
ffff8000001159ac: 0f 1f 40 00          	nopl	(%rax)

ffff8000001159b0 <lab2_check_vas_ext>:
; {
ffff8000001159b0: 55                   	pushq	%rbp
ffff8000001159b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001159b4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001159b8: 48 be 48 84 11 00 00 80 ff ff	movabsq	$-140737487207352, %rsi # imm = 0xFFFF800000118448
ffff8000001159c2: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001159c7: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff8000001159cb: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001159ce: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001159d8: 48 8b 38             	movq	(%rax), %rdi
ffff8000001159db: 48 b8 80 49 11 00 00 80 ff ff	movabsq	$-140737487222400, %rax # imm = 0xFFFF800000114980
ffff8000001159e5: 48 8d 75 b0          	leaq	-80(%rbp), %rsi
ffff8000001159e9: ff d0                	callq	*%rax
; 	cprintf("[LAB 2] check_vas_ext() succeeded!\n");
ffff8000001159eb: 48 bf 9a 86 11 00 00 80 ff ff	movabsq	$-140737487206758, %rdi # imm = 0xFFFF80000011869A
ffff8000001159f5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001159ff: 31 c0                	xorl	%eax, %eax
ffff800000115a01: ff d1                	callq	*%rcx
; }
ffff800000115a03: 48 83 c4 50          	addq	$80, %rsp
ffff800000115a07: 5d                   	popq	%rbp
ffff800000115a08: c3                   	retq
ffff800000115a09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115a10 <lab2_check_4k_paging>:
; {
ffff800000115a10: 55                   	pushq	%rbp
ffff800000115a11: 48 89 e5             	movq	%rsp, %rbp
ffff800000115a14: 48 83 ec 30          	subq	$48, %rsp
; 	cprintf("attempting to count number of free pages in lab2 check paging\n");
ffff800000115a18: 48 bf 33 91 11 00 00 80 ff ff	movabsq	$-140737487204045, %rdi # imm = 0xFFFF800000119133
ffff800000115a22: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115a2c: 31 c0                	xorl	%eax, %eax
ffff800000115a2e: ff d1                	callq	*%rcx
; 	nfree = count_total_free_pages();
ffff800000115a30: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000115a3a: ff d0                	callq	*%rax
ffff800000115a3c: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	cprintf("counted total number of pages in lab2 check paging\n");
ffff800000115a40: 48 bf 87 8c 11 00 00 80 ff ff	movabsq	$-140737487205241, %rdi # imm = 0xFFFF800000118C87
ffff800000115a4a: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115a54: 31 c0                	xorl	%eax, %eax
ffff800000115a56: ff d1                	callq	*%rcx
; 	page = page_alloc(0);
ffff800000115a58: 31 c0                	xorl	%eax, %eax
ffff800000115a5a: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000115a64: 31 ff                	xorl	%edi, %edi
ffff800000115a66: ff d0                	callq	*%rax
ffff800000115a68: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff800000115a6c: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000115a71: 0f 85 27 00 00 00    	jne	0xffff800000115a9e <lab2_check_4k_paging+0x8e>
; 		panic("cannot allocate 4K page!");
ffff800000115a77: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115a81: 48 ba f0 92 11 00 00 80 ff ff	movabsq	$-140737487203600, %rdx # imm = 0xFFFF8000001192F0
ffff800000115a8b: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115a95: 31 c0                	xorl	%eax, %eax
ffff800000115a97: be 00 01 00 00       	movl	$256, %esi              # imm = 0x100
ffff800000115a9c: ff d1                	callq	*%rcx
; 	cprintf("page allocated in lab2 check paging\n");
ffff800000115a9e: 48 bf ab 87 11 00 00 80 ff ff	movabsq	$-140737487206485, %rdi # imm = 0xFFFF8000001187AB
ffff800000115aa8: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115ab2: 31 c0                	xorl	%eax, %eax
ffff800000115ab4: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000115ab6: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115ac0: 48 8b 38             	movq	(%rax), %rdi
ffff800000115ac3: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000115ac7: 31 c0                	xorl	%eax, %eax
ffff800000115ac9: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff800000115ad3: 31 c9                	xorl	%ecx, %ecx
ffff800000115ad5: 89 ca                	movl	%ecx, %edx
ffff800000115ad7: b9 01 00 00 00       	movl	$1, %ecx
ffff800000115adc: ff d0                	callq	*%rax
ffff800000115ade: 83 f8 00             	cmpl	$0, %eax
ffff800000115ae1: 0f 84 32 00 00 00    	je	0xffff800000115b19 <lab2_check_4k_paging+0x109>
ffff800000115ae7: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115af1: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115afb: 48 b9 f6 8f 11 00 00 80 ff ff	movabsq	$-140737487204362, %rcx # imm = 0xFFFF800000118FF6
ffff800000115b05: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115b0f: 31 c0                	xorl	%eax, %eax
ffff800000115b11: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff800000115b16: 41 ff d0             	callq	*%r8
ffff800000115b19: e9 00 00 00 00       	jmp	0xffff800000115b1e <lab2_check_4k_paging+0x10e>
; 	assert(page->pp_ref == 1);
ffff800000115b1e: e9 00 00 00 00       	jmp	0xffff800000115b23 <lab2_check_4k_paging+0x113>
ffff800000115b23: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115b27: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff800000115b2b: 83 f8 01             	cmpl	$1, %eax
ffff800000115b2e: 0f 84 32 00 00 00    	je	0xffff800000115b66 <lab2_check_4k_paging+0x156>
ffff800000115b34: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115b3e: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115b48: 48 b9 48 96 11 00 00 80 ff ff	movabsq	$-140737487202744, %rcx # imm = 0xFFFF800000119648
ffff800000115b52: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115b5c: 31 c0                	xorl	%eax, %eax
ffff800000115b5e: be 07 01 00 00       	movl	$263, %esi              # imm = 0x107
ffff800000115b63: 41 ff d0             	callq	*%r8
ffff800000115b66: e9 00 00 00 00       	jmp	0xffff800000115b6b <lab2_check_4k_paging+0x15b>
; 	assert(!page->pp_free);
ffff800000115b6b: e9 00 00 00 00       	jmp	0xffff800000115b70 <lab2_check_4k_paging+0x160>
ffff800000115b70: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115b74: 8a 40 12             	movb	18(%rax), %al
ffff800000115b77: c0 e8 07             	shrb	$7, %al
ffff800000115b7a: 3c 00                	cmpb	$0, %al
ffff800000115b7c: 0f 84 32 00 00 00    	je	0xffff800000115bb4 <lab2_check_4k_paging+0x1a4>
ffff800000115b82: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115b8c: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115b96: 48 b9 5d 85 11 00 00 80 ff ff	movabsq	$-140737487207075, %rcx # imm = 0xFFFF80000011855D
ffff800000115ba0: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115baa: 31 c0                	xorl	%eax, %eax
ffff800000115bac: be 08 01 00 00       	movl	$264, %esi              # imm = 0x108
ffff800000115bb1: 41 ff d0             	callq	*%r8
ffff800000115bb4: e9 00 00 00 00       	jmp	0xffff800000115bb9 <lab2_check_4k_paging+0x1a9>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000115bb9: e9 00 00 00 00       	jmp	0xffff800000115bbe <lab2_check_4k_paging+0x1ae>
ffff800000115bbe: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115bc8: 48 8b 00             	movq	(%rax), %rax
ffff800000115bcb: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000115bcf: 0f 85 32 00 00 00    	jne	0xffff800000115c07 <lab2_check_4k_paging+0x1f7>
ffff800000115bd5: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115bdf: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115be9: 48 b9 d0 87 11 00 00 80 ff ff	movabsq	$-140737487206448, %rcx # imm = 0xFFFF8000001187D0
ffff800000115bf3: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115bfd: 31 c0                	xorl	%eax, %eax
ffff800000115bff: be 09 01 00 00       	movl	$265, %esi              # imm = 0x109
ffff800000115c04: 41 ff d0             	callq	*%r8
ffff800000115c07: e9 00 00 00 00       	jmp	0xffff800000115c0c <lab2_check_4k_paging+0x1fc>
; 	cprintf("page mapped in lab2 check paging\n");
ffff800000115c0c: 48 bf 75 88 11 00 00 80 ff ff	movabsq	$-140737487206283, %rdi # imm = 0xFFFF800000118875
ffff800000115c16: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115c20: 31 c0                	xorl	%eax, %eax
ffff800000115c22: ff d1                	callq	*%rcx
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000115c24: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115c2e: 48 8b 38             	movq	(%rax), %rdi
ffff800000115c31: 31 c0                	xorl	%eax, %eax
ffff800000115c33: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000115c3d: 31 c9                	xorl	%ecx, %ecx
ffff800000115c3f: 89 ce                	movl	%ecx, %esi
ffff800000115c41: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000115c45: ff d0                	callq	*%rax
ffff800000115c47: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000115c4b: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115c4f: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000115c59: 48 23 01             	andq	(%rcx), %rax
ffff800000115c5c: 48 83 f8 01          	cmpq	$1, %rax
ffff800000115c60: 0f 84 32 00 00 00    	je	0xffff800000115c98 <lab2_check_4k_paging+0x288>
ffff800000115c66: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115c70: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115c7a: 48 b9 16 94 11 00 00 80 ff ff	movabsq	$-140737487203306, %rcx # imm = 0xFFFF800000119416
ffff800000115c84: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115c8e: 31 c0                	xorl	%eax, %eax
ffff800000115c90: be 0f 01 00 00       	movl	$271, %esi              # imm = 0x10F
ffff800000115c95: 41 ff d0             	callq	*%r8
ffff800000115c98: e9 00 00 00 00       	jmp	0xffff800000115c9d <lab2_check_4k_paging+0x28d>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000115c9d: e9 00 00 00 00       	jmp	0xffff800000115ca2 <lab2_check_4k_paging+0x292>
ffff800000115ca2: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000115ca6: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff800000115cb0: 48 23 01             	andq	(%rcx), %rax
ffff800000115cb3: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000115cb7: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000115cbb: 48 b8 00 5f 11 00 00 80 ff ff	movabsq	$-140737487216896, %rax # imm = 0xFFFF800000115F00
ffff800000115cc5: ff d0                	callq	*%rax
ffff800000115cc7: 48 89 c1             	movq	%rax, %rcx
ffff800000115cca: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000115cce: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115cd1: 0f 84 32 00 00 00    	je	0xffff800000115d09 <lab2_check_4k_paging+0x2f9>
ffff800000115cd7: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115ce1: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115ceb: 48 b9 bb 8c 11 00 00 80 ff ff	movabsq	$-140737487205189, %rcx # imm = 0xFFFF800000118CBB
ffff800000115cf5: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115cff: 31 c0                	xorl	%eax, %eax
ffff800000115d01: be 10 01 00 00       	movl	$272, %esi              # imm = 0x110
ffff800000115d06: 41 ff d0             	callq	*%r8
ffff800000115d09: e9 00 00 00 00       	jmp	0xffff800000115d0e <lab2_check_4k_paging+0x2fe>
; 	assert(ret == page);
ffff800000115d0e: e9 00 00 00 00       	jmp	0xffff800000115d13 <lab2_check_4k_paging+0x303>
ffff800000115d13: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000115d17: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000115d1b: 0f 84 32 00 00 00    	je	0xffff800000115d53 <lab2_check_4k_paging+0x343>
ffff800000115d21: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115d2b: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115d35: 48 b9 ff 90 11 00 00 80 ff ff	movabsq	$-140737487204097, %rcx # imm = 0xFFFF8000001190FF
ffff800000115d3f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115d49: 31 c0                	xorl	%eax, %eax
ffff800000115d4b: be 11 01 00 00       	movl	$273, %esi              # imm = 0x111
ffff800000115d50: 41 ff d0             	callq	*%r8
ffff800000115d53: e9 00 00 00 00       	jmp	0xffff800000115d58 <lab2_check_4k_paging+0x348>
; 	page_remove(kernel_pml4, 0);
ffff800000115d58: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115d62: 48 8b 38             	movq	(%rax), %rdi
ffff800000115d65: 31 c0                	xorl	%eax, %eax
ffff800000115d67: 48 b8 a0 46 11 00 00 80 ff ff	movabsq	$-140737487223136, %rax # imm = 0xFFFF8000001146A0
ffff800000115d71: 31 c9                	xorl	%ecx, %ecx
ffff800000115d73: 89 ce                	movl	%ecx, %esi
ffff800000115d75: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000115d77: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115d7b: 8a 40 12             	movb	18(%rax), %al
ffff800000115d7e: c0 e8 07             	shrb	$7, %al
ffff800000115d81: 3c 00                	cmpb	$0, %al
ffff800000115d83: 0f 85 32 00 00 00    	jne	0xffff800000115dbb <lab2_check_4k_paging+0x3ab>
ffff800000115d89: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115d93: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115d9d: 48 b9 da 8e 11 00 00 80 ff ff	movabsq	$-140737487204646, %rcx # imm = 0xFFFF800000118EDA
ffff800000115da7: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115db1: 31 c0                	xorl	%eax, %eax
ffff800000115db3: be 15 01 00 00       	movl	$277, %esi              # imm = 0x115
ffff800000115db8: 41 ff d0             	callq	*%r8
ffff800000115dbb: e9 00 00 00 00       	jmp	0xffff800000115dc0 <lab2_check_4k_paging+0x3b0>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000115dc0: e9 00 00 00 00       	jmp	0xffff800000115dc5 <lab2_check_4k_paging+0x3b5>
ffff800000115dc5: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115dcf: 48 8b 38             	movq	(%rax), %rdi
ffff800000115dd2: 31 c0                	xorl	%eax, %eax
ffff800000115dd4: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000115dde: 31 c9                	xorl	%ecx, %ecx
ffff800000115de0: 89 ca                	movl	%ecx, %edx
ffff800000115de2: 48 89 d6             	movq	%rdx, %rsi
ffff800000115de5: ff d0                	callq	*%rax
ffff800000115de7: 48 83 f8 00          	cmpq	$0, %rax
ffff800000115deb: 0f 84 32 00 00 00    	je	0xffff800000115e23 <lab2_check_4k_paging+0x413>
ffff800000115df1: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115dfb: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115e05: 48 b9 91 8a 11 00 00 80 ff ff	movabsq	$-140737487205743, %rcx # imm = 0xFFFF800000118A91
ffff800000115e0f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115e19: 31 c0                	xorl	%eax, %eax
ffff800000115e1b: be 16 01 00 00       	movl	$278, %esi              # imm = 0x116
ffff800000115e20: 41 ff d0             	callq	*%r8
ffff800000115e23: e9 00 00 00 00       	jmp	0xffff800000115e28 <lab2_check_4k_paging+0x418>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000115e28: e9 00 00 00 00       	jmp	0xffff800000115e2d <lab2_check_4k_paging+0x41d>
ffff800000115e2d: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115e37: 48 8b 00             	movq	(%rax), %rax
ffff800000115e3a: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000115e3e: 0f 84 32 00 00 00    	je	0xffff800000115e76 <lab2_check_4k_paging+0x466>
ffff800000115e44: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115e4e: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115e58: 48 b9 8c 8d 11 00 00 80 ff ff	movabsq	$-140737487204980, %rcx # imm = 0xFFFF800000118D8C
ffff800000115e62: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115e6c: 31 c0                	xorl	%eax, %eax
ffff800000115e6e: be 19 01 00 00       	movl	$281, %esi              # imm = 0x119
ffff800000115e73: 41 ff d0             	callq	*%r8
ffff800000115e76: e9 00 00 00 00       	jmp	0xffff800000115e7b <lab2_check_4k_paging+0x46b>
; 	assert(nfree == count_total_free_pages());
ffff800000115e7b: e9 00 00 00 00       	jmp	0xffff800000115e80 <lab2_check_4k_paging+0x470>
ffff800000115e80: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000115e84: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000115e88: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000115e92: ff d0                	callq	*%rax
ffff800000115e94: 48 89 c1             	movq	%rax, %rcx
ffff800000115e97: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000115e9b: 48 39 c8             	cmpq	%rcx, %rax
ffff800000115e9e: 0f 84 32 00 00 00    	je	0xffff800000115ed6 <lab2_check_4k_paging+0x4c6>
ffff800000115ea4: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115eae: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115eb8: 48 b9 b0 8b 11 00 00 80 ff ff	movabsq	$-140737487205456, %rcx # imm = 0xFFFF800000118BB0
ffff800000115ec2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115ecc: 31 c0                	xorl	%eax, %eax
ffff800000115ece: be 1c 01 00 00       	movl	$284, %esi              # imm = 0x11C
ffff800000115ed3: 41 ff d0             	callq	*%r8
ffff800000115ed6: e9 00 00 00 00       	jmp	0xffff800000115edb <lab2_check_4k_paging+0x4cb>
; 	cprintf("[LAB 2] check_4k_paging() succeeded!\n");
ffff800000115edb: 48 bf 95 85 11 00 00 80 ff ff	movabsq	$-140737487207019, %rdi # imm = 0xFFFF800000118595
ffff800000115ee5: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000115eef: 31 c0                	xorl	%eax, %eax
ffff800000115ef1: ff d1                	callq	*%rcx
; }
ffff800000115ef3: 48 83 c4 30          	addq	$48, %rsp
ffff800000115ef7: 5d                   	popq	%rbp
ffff800000115ef8: c3                   	retq
ffff800000115ef9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000115f00 <page2pa>:
; {
ffff800000115f00: 55                   	pushq	%rbp
ffff800000115f01: 48 89 e5             	movq	%rsp, %rbp
ffff800000115f04: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000115f08: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000115f0c: 48 b9 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rcx # imm = 0xFFFF80000011D2E8
ffff800000115f16: 48 8b 09             	movq	(%rcx), %rcx
ffff800000115f19: 48 29 c8             	subq	%rcx, %rax
ffff800000115f1c: 48 c1 f8 05          	sarq	$5, %rax
ffff800000115f20: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000115f24: 5d                   	popq	%rbp
ffff800000115f25: c3                   	retq
ffff800000115f26: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000115f30 <lab2_check_2m_paging>:
; {
ffff800000115f30: 55                   	pushq	%rbp
ffff800000115f31: 48 89 e5             	movq	%rsp, %rbp
ffff800000115f34: 48 83 ec 30          	subq	$48, %rsp
; 	nfree = count_total_free_pages();
ffff800000115f38: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000115f42: ff d0                	callq	*%rax
ffff800000115f44: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000115f48: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000115f52: bf 02 00 00 00       	movl	$2, %edi
ffff800000115f57: ff d0                	callq	*%rax
ffff800000115f59: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff800000115f5d: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000115f62: 0f 85 27 00 00 00    	jne	0xffff800000115f8f <lab2_check_2m_paging+0x5f>
; 		panic("cannot allocate 2M page!");
ffff800000115f68: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115f72: 48 ba 97 8f 11 00 00 80 ff ff	movabsq	$-140737487204457, %rdx # imm = 0xFFFF800000118F97
ffff800000115f7c: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000115f86: 31 c0                	xorl	%eax, %eax
ffff800000115f88: be 2e 01 00 00       	movl	$302, %esi              # imm = 0x12E
ffff800000115f8d: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000115f8f: e9 00 00 00 00       	jmp	0xffff800000115f94 <lab2_check_2m_paging+0x64>
ffff800000115f94: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000115f9e: 48 8b 38             	movq	(%rax), %rdi
ffff800000115fa1: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000115fa5: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff800000115faf: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000115fb4: b9 01 00 00 00       	movl	$1, %ecx
ffff800000115fb9: ff d0                	callq	*%rax
ffff800000115fbb: 83 f8 00             	cmpl	$0, %eax
ffff800000115fbe: 0f 85 32 00 00 00    	jne	0xffff800000115ff6 <lab2_check_2m_paging+0xc6>
ffff800000115fc4: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000115fce: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000115fd8: 48 b9 97 88 11 00 00 80 ff ff	movabsq	$-140737487206249, %rcx # imm = 0xFFFF800000118897
ffff800000115fe2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000115fec: 31 c0                	xorl	%eax, %eax
ffff800000115fee: be 32 01 00 00       	movl	$306, %esi              # imm = 0x132
ffff800000115ff3: 41 ff d0             	callq	*%r8
ffff800000115ff6: e9 00 00 00 00       	jmp	0xffff800000115ffb <lab2_check_2m_paging+0xcb>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000115ffb: e9 00 00 00 00       	jmp	0xffff800000116000 <lab2_check_2m_paging+0xd0>
ffff800000116000: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000011600a: 48 8b 38             	movq	(%rax), %rdi
ffff80000011600d: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000116011: 31 c0                	xorl	%eax, %eax
ffff800000116013: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff80000011601d: 31 c9                	xorl	%ecx, %ecx
ffff80000011601f: 89 ca                	movl	%ecx, %edx
ffff800000116021: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116026: ff d0                	callq	*%rax
ffff800000116028: 83 f8 00             	cmpl	$0, %eax
ffff80000011602b: 0f 84 32 00 00 00    	je	0xffff800000116063 <lab2_check_2m_paging+0x133>
ffff800000116031: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011603b: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116045: 48 b9 f6 8f 11 00 00 80 ff ff	movabsq	$-140737487204362, %rcx # imm = 0xFFFF800000118FF6
ffff80000011604f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116059: 31 c0                	xorl	%eax, %eax
ffff80000011605b: be 35 01 00 00       	movl	$309, %esi              # imm = 0x135
ffff800000116060: 41 ff d0             	callq	*%r8
ffff800000116063: e9 00 00 00 00       	jmp	0xffff800000116068 <lab2_check_2m_paging+0x138>
; 	assert(page->pp_ref == 1);
ffff800000116068: e9 00 00 00 00       	jmp	0xffff80000011606d <lab2_check_2m_paging+0x13d>
ffff80000011606d: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116071: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff800000116075: 83 f8 01             	cmpl	$1, %eax
ffff800000116078: 0f 84 32 00 00 00    	je	0xffff8000001160b0 <lab2_check_2m_paging+0x180>
ffff80000011607e: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116088: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116092: 48 b9 48 96 11 00 00 80 ff ff	movabsq	$-140737487202744, %rcx # imm = 0xFFFF800000119648
ffff80000011609c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001160a6: 31 c0                	xorl	%eax, %eax
ffff8000001160a8: be 36 01 00 00       	movl	$310, %esi              # imm = 0x136
ffff8000001160ad: 41 ff d0             	callq	*%r8
ffff8000001160b0: e9 00 00 00 00       	jmp	0xffff8000001160b5 <lab2_check_2m_paging+0x185>
; 	assert(!page->pp_free);
ffff8000001160b5: e9 00 00 00 00       	jmp	0xffff8000001160ba <lab2_check_2m_paging+0x18a>
ffff8000001160ba: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001160be: 8a 40 12             	movb	18(%rax), %al
ffff8000001160c1: c0 e8 07             	shrb	$7, %al
ffff8000001160c4: 3c 00                	cmpb	$0, %al
ffff8000001160c6: 0f 84 32 00 00 00    	je	0xffff8000001160fe <lab2_check_2m_paging+0x1ce>
ffff8000001160cc: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001160d6: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001160e0: 48 b9 5d 85 11 00 00 80 ff ff	movabsq	$-140737487207075, %rcx # imm = 0xFFFF80000011855D
ffff8000001160ea: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001160f4: 31 c0                	xorl	%eax, %eax
ffff8000001160f6: be 37 01 00 00       	movl	$311, %esi              # imm = 0x137
ffff8000001160fb: 41 ff d0             	callq	*%r8
ffff8000001160fe: e9 00 00 00 00       	jmp	0xffff800000116103 <lab2_check_2m_paging+0x1d3>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000116103: e9 00 00 00 00       	jmp	0xffff800000116108 <lab2_check_2m_paging+0x1d8>
ffff800000116108: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116112: 48 8b 00             	movq	(%rax), %rax
ffff800000116115: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116119: 0f 85 32 00 00 00    	jne	0xffff800000116151 <lab2_check_2m_paging+0x221>
ffff80000011611f: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116129: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116133: 48 b9 d0 87 11 00 00 80 ff ff	movabsq	$-140737487206448, %rcx # imm = 0xFFFF8000001187D0
ffff80000011613d: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116147: 31 c0                	xorl	%eax, %eax
ffff800000116149: be 38 01 00 00       	movl	$312, %esi              # imm = 0x138
ffff80000011614e: 41 ff d0             	callq	*%r8
ffff800000116151: e9 00 00 00 00       	jmp	0xffff800000116156 <lab2_check_2m_paging+0x226>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000116156: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116160: 48 8b 38             	movq	(%rax), %rdi
ffff800000116163: 31 c0                	xorl	%eax, %eax
ffff800000116165: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff80000011616f: 31 c9                	xorl	%ecx, %ecx
ffff800000116171: 89 ce                	movl	%ecx, %esi
ffff800000116173: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000116177: ff d0                	callq	*%rax
ffff800000116179: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff80000011617d: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116181: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011618b: 48 23 01             	andq	(%rcx), %rax
ffff80000011618e: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000116194: 0f 84 32 00 00 00    	je	0xffff8000001161cc <lab2_check_2m_paging+0x29c>
ffff80000011619a: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001161a4: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001161ae: 48 b9 cc 95 11 00 00 80 ff ff	movabsq	$-140737487202868, %rcx # imm = 0xFFFF8000001195CC
ffff8000001161b8: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001161c2: 31 c0                	xorl	%eax, %eax
ffff8000001161c4: be 3c 01 00 00       	movl	$316, %esi              # imm = 0x13C
ffff8000001161c9: 41 ff d0             	callq	*%r8
ffff8000001161cc: e9 00 00 00 00       	jmp	0xffff8000001161d1 <lab2_check_2m_paging+0x2a1>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001161d1: e9 00 00 00 00       	jmp	0xffff8000001161d6 <lab2_check_2m_paging+0x2a6>
ffff8000001161d6: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001161da: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001161e4: 48 23 01             	andq	(%rcx), %rax
ffff8000001161e7: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001161eb: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001161ef: 48 b8 00 5f 11 00 00 80 ff ff	movabsq	$-140737487216896, %rax # imm = 0xFFFF800000115F00
ffff8000001161f9: ff d0                	callq	*%rax
ffff8000001161fb: 48 89 c1             	movq	%rax, %rcx
ffff8000001161fe: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000116202: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116205: 0f 84 32 00 00 00    	je	0xffff80000011623d <lab2_check_2m_paging+0x30d>
ffff80000011620b: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116215: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011621f: 48 b9 bb 8c 11 00 00 80 ff ff	movabsq	$-140737487205189, %rcx # imm = 0xFFFF800000118CBB
ffff800000116229: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116233: 31 c0                	xorl	%eax, %eax
ffff800000116235: be 3d 01 00 00       	movl	$317, %esi              # imm = 0x13D
ffff80000011623a: 41 ff d0             	callq	*%r8
ffff80000011623d: e9 00 00 00 00       	jmp	0xffff800000116242 <lab2_check_2m_paging+0x312>
; 	assert(ret == page);
ffff800000116242: e9 00 00 00 00       	jmp	0xffff800000116247 <lab2_check_2m_paging+0x317>
ffff800000116247: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff80000011624b: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff80000011624f: 0f 84 32 00 00 00    	je	0xffff800000116287 <lab2_check_2m_paging+0x357>
ffff800000116255: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011625f: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116269: 48 b9 ff 90 11 00 00 80 ff ff	movabsq	$-140737487204097, %rcx # imm = 0xFFFF8000001190FF
ffff800000116273: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011627d: 31 c0                	xorl	%eax, %eax
ffff80000011627f: be 3e 01 00 00       	movl	$318, %esi              # imm = 0x13E
ffff800000116284: 41 ff d0             	callq	*%r8
ffff800000116287: e9 00 00 00 00       	jmp	0xffff80000011628c <lab2_check_2m_paging+0x35c>
; 	page_remove(kernel_pml4, 0);
ffff80000011628c: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116296: 48 8b 38             	movq	(%rax), %rdi
ffff800000116299: 31 c0                	xorl	%eax, %eax
ffff80000011629b: 48 b8 a0 46 11 00 00 80 ff ff	movabsq	$-140737487223136, %rax # imm = 0xFFFF8000001146A0
ffff8000001162a5: 31 c9                	xorl	%ecx, %ecx
ffff8000001162a7: 89 ce                	movl	%ecx, %esi
ffff8000001162a9: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff8000001162ab: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001162af: 8a 40 12             	movb	18(%rax), %al
ffff8000001162b2: c0 e8 07             	shrb	$7, %al
ffff8000001162b5: 3c 00                	cmpb	$0, %al
ffff8000001162b7: 0f 85 32 00 00 00    	jne	0xffff8000001162ef <lab2_check_2m_paging+0x3bf>
ffff8000001162bd: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001162c7: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001162d1: 48 b9 da 8e 11 00 00 80 ff ff	movabsq	$-140737487204646, %rcx # imm = 0xFFFF800000118EDA
ffff8000001162db: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001162e5: 31 c0                	xorl	%eax, %eax
ffff8000001162e7: be 42 01 00 00       	movl	$322, %esi              # imm = 0x142
ffff8000001162ec: 41 ff d0             	callq	*%r8
ffff8000001162ef: e9 00 00 00 00       	jmp	0xffff8000001162f4 <lab2_check_2m_paging+0x3c4>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff8000001162f4: e9 00 00 00 00       	jmp	0xffff8000001162f9 <lab2_check_2m_paging+0x3c9>
ffff8000001162f9: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116303: 48 8b 38             	movq	(%rax), %rdi
ffff800000116306: 31 c0                	xorl	%eax, %eax
ffff800000116308: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000116312: 31 c9                	xorl	%ecx, %ecx
ffff800000116314: 89 ca                	movl	%ecx, %edx
ffff800000116316: 48 89 d6             	movq	%rdx, %rsi
ffff800000116319: ff d0                	callq	*%rax
ffff80000011631b: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011631f: 0f 84 32 00 00 00    	je	0xffff800000116357 <lab2_check_2m_paging+0x427>
ffff800000116325: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011632f: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116339: 48 b9 91 8a 11 00 00 80 ff ff	movabsq	$-140737487205743, %rcx # imm = 0xFFFF800000118A91
ffff800000116343: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011634d: 31 c0                	xorl	%eax, %eax
ffff80000011634f: be 43 01 00 00       	movl	$323, %esi              # imm = 0x143
ffff800000116354: 41 ff d0             	callq	*%r8
ffff800000116357: e9 00 00 00 00       	jmp	0xffff80000011635c <lab2_check_2m_paging+0x42c>
; 	assert(kernel_pml4->entries[0] == 0);
ffff80000011635c: e9 00 00 00 00       	jmp	0xffff800000116361 <lab2_check_2m_paging+0x431>
ffff800000116361: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000011636b: 48 8b 00             	movq	(%rax), %rax
ffff80000011636e: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116372: 0f 84 32 00 00 00    	je	0xffff8000001163aa <lab2_check_2m_paging+0x47a>
ffff800000116378: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116382: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011638c: 48 b9 8c 8d 11 00 00 80 ff ff	movabsq	$-140737487204980, %rcx # imm = 0xFFFF800000118D8C
ffff800000116396: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001163a0: 31 c0                	xorl	%eax, %eax
ffff8000001163a2: be 46 01 00 00       	movl	$326, %esi              # imm = 0x146
ffff8000001163a7: 41 ff d0             	callq	*%r8
ffff8000001163aa: e9 00 00 00 00       	jmp	0xffff8000001163af <lab2_check_2m_paging+0x47f>
; 	assert(nfree == count_total_free_pages());
ffff8000001163af: e9 00 00 00 00       	jmp	0xffff8000001163b4 <lab2_check_2m_paging+0x484>
ffff8000001163b4: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001163b8: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff8000001163bc: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff8000001163c6: ff d0                	callq	*%rax
ffff8000001163c8: 48 89 c1             	movq	%rax, %rcx
ffff8000001163cb: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001163cf: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001163d2: 0f 84 32 00 00 00    	je	0xffff80000011640a <lab2_check_2m_paging+0x4da>
ffff8000001163d8: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001163e2: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001163ec: 48 b9 b0 8b 11 00 00 80 ff ff	movabsq	$-140737487205456, %rcx # imm = 0xFFFF800000118BB0
ffff8000001163f6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116400: 31 c0                	xorl	%eax, %eax
ffff800000116402: be 49 01 00 00       	movl	$329, %esi              # imm = 0x149
ffff800000116407: 41 ff d0             	callq	*%r8
ffff80000011640a: e9 00 00 00 00       	jmp	0xffff80000011640f <lab2_check_2m_paging+0x4df>
; 	cprintf("[LAB 2] check_2m_paging() succeeded!\n");
ffff80000011640f: 48 bf 2b 90 11 00 00 80 ff ff	movabsq	$-140737487204309, %rdi # imm = 0xFFFF80000011902B
ffff800000116419: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000116423: 31 c0                	xorl	%eax, %eax
ffff800000116425: ff d1                	callq	*%rcx
; }
ffff800000116427: 48 83 c4 30          	addq	$48, %rsp
ffff80000011642b: 5d                   	popq	%rbp
ffff80000011642c: c3                   	retq
ffff80000011642d: 0f 1f 00             	nopl	(%rax)

ffff800000116430 <ismemset>:
; {
ffff800000116430: 55                   	pushq	%rbp
ffff800000116431: 48 89 e5             	movq	%rsp, %rbp
ffff800000116434: 48 89 7d f0          	movq	%rdi, -16(%rbp)
ffff800000116438: 89 75 ec             	movl	%esi, -20(%rbp)
ffff80000011643b: 48 89 55 e0          	movq	%rdx, -32(%rbp)
; 	unsigned char *p = s;
ffff80000011643f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000116443: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000116447: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000011644f: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116453: 48 3b 45 e0          	cmpq	-32(%rbp), %rax
ffff800000116457: 0f 83 3e 00 00 00    	jae	0xffff80000011649b <ismemset+0x6b>
; 		if (*p != c) {
ffff80000011645d: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000116461: 0f b6 00             	movzbl	(%rax), %eax
ffff800000116464: 3b 45 ec             	cmpl	-20(%rbp), %eax
ffff800000116467: 0f 84 0c 00 00 00    	je	0xffff800000116479 <ismemset+0x49>
; 			return 0;
ffff80000011646d: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff800000116474: e9 29 00 00 00       	jmp	0xffff8000001164a2 <ismemset+0x72>
; 	}
ffff800000116479: e9 00 00 00 00       	jmp	0xffff80000011647e <ismemset+0x4e>
; 	for (i = 0; i < n; ++i, ++p) {
ffff80000011647e: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116482: 48 83 c0 01          	addq	$1, %rax
ffff800000116486: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000011648a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011648e: 48 83 c0 01          	addq	$1, %rax
ffff800000116492: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000116496: e9 b4 ff ff ff       	jmp	0xffff80000011644f <ismemset+0x1f>
; 	return 1;
ffff80000011649b: c7 45 fc 01 00 00 00 	movl	$1, -4(%rbp)
; }
ffff8000001164a2: 8b 45 fc             	movl	-4(%rbp), %eax
ffff8000001164a5: 5d                   	popq	%rbp
ffff8000001164a6: c3                   	retq
ffff8000001164a7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff8000001164b0 <lab2_check_transparent_2m_paging>:
; {
ffff8000001164b0: 55                   	pushq	%rbp
ffff8000001164b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001164b4: 48 83 ec 50          	subq	$80, %rsp
; 	nfree = count_total_free_pages();
ffff8000001164b8: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff8000001164c2: ff d0                	callq	*%rax
ffff8000001164c4: 48 89 45 c0          	movq	%rax, -64(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff8000001164c8: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff8000001164d2: bf 02 00 00 00       	movl	$2, %edi
ffff8000001164d7: ff d0                	callq	*%rax
ffff8000001164d9: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff8000001164dd: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff8000001164e2: 0f 85 27 00 00 00    	jne	0xffff80000011650f <lab2_check_transparent_2m_paging+0x5f>
; 		panic("cannot allocate 2M page!");
ffff8000001164e8: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001164f2: 48 ba 97 8f 11 00 00 80 ff ff	movabsq	$-140737487204457, %rdx # imm = 0xFFFF800000118F97
ffff8000001164fc: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116506: 31 c0                	xorl	%eax, %eax
ffff800000116508: be 6b 01 00 00       	movl	$363, %esi              # imm = 0x16B
ffff80000011650d: ff d1                	callq	*%rcx
; 	data = page2kva(page);
ffff80000011650f: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116513: 48 b8 40 6f 11 00 00 80 ff ff	movabsq	$-140737487212736, %rax # imm = 0xFFFF800000116F40
ffff80000011651d: ff d0                	callq	*%rax
ffff80000011651f: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116523: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000011652b: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff800000116533: 0f 83 40 00 00 00    	jae	0xffff800000116579 <lab2_check_transparent_2m_paging+0xc9>
; 		memset(data, i & 0xff, PAGE_SIZE);
ffff800000116539: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff80000011653d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116541: 48 25 ff 00 00 00    	andq	$255, %rax
ffff800000116547: 89 c6                	movl	%eax, %esi
ffff800000116549: 48 b8 70 26 11 00 00 80 ff ff	movabsq	$-140737487231376, %rax # imm = 0xFFFF800000112670
ffff800000116553: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116558: ff d0                	callq	*%rax
; 		data += PAGE_SIZE;
ffff80000011655a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011655e: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff800000116564: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116568: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011656c: 48 83 c0 01          	addq	$1, %rax
ffff800000116570: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000116574: e9 b2 ff ff ff       	jmp	0xffff80000011652b <lab2_check_transparent_2m_paging+0x7b>
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000116579: e9 00 00 00 00       	jmp	0xffff80000011657e <lab2_check_transparent_2m_paging+0xce>
ffff80000011657e: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116588: 48 8b 38             	movq	(%rax), %rdi
ffff80000011658b: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff80000011658f: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff800000116599: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011659e: b9 01 00 00 00       	movl	$1, %ecx
ffff8000001165a3: ff d0                	callq	*%rax
ffff8000001165a5: 83 f8 00             	cmpl	$0, %eax
ffff8000001165a8: 0f 85 32 00 00 00    	jne	0xffff8000001165e0 <lab2_check_transparent_2m_paging+0x130>
ffff8000001165ae: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001165b8: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001165c2: 48 b9 97 88 11 00 00 80 ff ff	movabsq	$-140737487206249, %rcx # imm = 0xFFFF800000118897
ffff8000001165cc: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001165d6: 31 c0                	xorl	%eax, %eax
ffff8000001165d8: be 77 01 00 00       	movl	$375, %esi              # imm = 0x177
ffff8000001165dd: 41 ff d0             	callq	*%r8
ffff8000001165e0: e9 00 00 00 00       	jmp	0xffff8000001165e5 <lab2_check_transparent_2m_paging+0x135>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001165e5: e9 00 00 00 00       	jmp	0xffff8000001165ea <lab2_check_transparent_2m_paging+0x13a>
ffff8000001165ea: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001165f4: 48 8b 38             	movq	(%rax), %rdi
ffff8000001165f7: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff8000001165fb: 31 c0                	xorl	%eax, %eax
ffff8000001165fd: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff800000116607: 31 c9                	xorl	%ecx, %ecx
ffff800000116609: 89 ca                	movl	%ecx, %edx
ffff80000011660b: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116610: ff d0                	callq	*%rax
ffff800000116612: 83 f8 00             	cmpl	$0, %eax
ffff800000116615: 0f 84 32 00 00 00    	je	0xffff80000011664d <lab2_check_transparent_2m_paging+0x19d>
ffff80000011661b: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116625: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011662f: 48 b9 f6 8f 11 00 00 80 ff ff	movabsq	$-140737487204362, %rcx # imm = 0xFFFF800000118FF6
ffff800000116639: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116643: 31 c0                	xorl	%eax, %eax
ffff800000116645: be 7a 01 00 00       	movl	$378, %esi              # imm = 0x17A
ffff80000011664a: 41 ff d0             	callq	*%r8
ffff80000011664d: e9 00 00 00 00       	jmp	0xffff800000116652 <lab2_check_transparent_2m_paging+0x1a2>
; 	assert(page->pp_ref == 1);
ffff800000116652: e9 00 00 00 00       	jmp	0xffff800000116657 <lab2_check_transparent_2m_paging+0x1a7>
ffff800000116657: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011665b: 0f b7 40 10          	movzwl	16(%rax), %eax
ffff80000011665f: 83 f8 01             	cmpl	$1, %eax
ffff800000116662: 0f 84 32 00 00 00    	je	0xffff80000011669a <lab2_check_transparent_2m_paging+0x1ea>
ffff800000116668: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116672: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011667c: 48 b9 48 96 11 00 00 80 ff ff	movabsq	$-140737487202744, %rcx # imm = 0xFFFF800000119648
ffff800000116686: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116690: 31 c0                	xorl	%eax, %eax
ffff800000116692: be 7b 01 00 00       	movl	$379, %esi              # imm = 0x17B
ffff800000116697: 41 ff d0             	callq	*%r8
ffff80000011669a: e9 00 00 00 00       	jmp	0xffff80000011669f <lab2_check_transparent_2m_paging+0x1ef>
; 	assert(!page->pp_free);
ffff80000011669f: e9 00 00 00 00       	jmp	0xffff8000001166a4 <lab2_check_transparent_2m_paging+0x1f4>
ffff8000001166a4: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff8000001166a8: 8a 40 12             	movb	18(%rax), %al
ffff8000001166ab: c0 e8 07             	shrb	$7, %al
ffff8000001166ae: 3c 00                	cmpb	$0, %al
ffff8000001166b0: 0f 84 32 00 00 00    	je	0xffff8000001166e8 <lab2_check_transparent_2m_paging+0x238>
ffff8000001166b6: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001166c0: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001166ca: 48 b9 5d 85 11 00 00 80 ff ff	movabsq	$-140737487207075, %rcx # imm = 0xFFFF80000011855D
ffff8000001166d4: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001166de: 31 c0                	xorl	%eax, %eax
ffff8000001166e0: be 7c 01 00 00       	movl	$380, %esi              # imm = 0x17C
ffff8000001166e5: 41 ff d0             	callq	*%r8
ffff8000001166e8: e9 00 00 00 00       	jmp	0xffff8000001166ed <lab2_check_transparent_2m_paging+0x23d>
; 	assert(kernel_pml4->entries[0] != 0);
ffff8000001166ed: e9 00 00 00 00       	jmp	0xffff8000001166f2 <lab2_check_transparent_2m_paging+0x242>
ffff8000001166f2: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001166fc: 48 8b 00             	movq	(%rax), %rax
ffff8000001166ff: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116703: 0f 85 32 00 00 00    	jne	0xffff80000011673b <lab2_check_transparent_2m_paging+0x28b>
ffff800000116709: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116713: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011671d: 48 b9 d0 87 11 00 00 80 ff ff	movabsq	$-140737487206448, %rcx # imm = 0xFFFF8000001187D0
ffff800000116727: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116731: 31 c0                	xorl	%eax, %eax
ffff800000116733: be 7d 01 00 00       	movl	$381, %esi              # imm = 0x17D
ffff800000116738: 41 ff d0             	callq	*%r8
ffff80000011673b: e9 00 00 00 00       	jmp	0xffff800000116740 <lab2_check_transparent_2m_paging+0x290>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000116740: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff80000011674a: 48 8b 38             	movq	(%rax), %rdi
ffff80000011674d: 31 c0                	xorl	%eax, %eax
ffff80000011674f: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000116759: 31 c9                	xorl	%ecx, %ecx
ffff80000011675b: 89 ce                	movl	%ecx, %esi
ffff80000011675d: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000116761: ff d0                	callq	*%rax
ffff800000116763: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000116767: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011676b: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000116775: 48 23 01             	andq	(%rcx), %rax
ffff800000116778: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff80000011677e: 0f 84 32 00 00 00    	je	0xffff8000001167b6 <lab2_check_transparent_2m_paging+0x306>
ffff800000116784: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011678e: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116798: 48 b9 cc 95 11 00 00 80 ff ff	movabsq	$-140737487202868, %rcx # imm = 0xFFFF8000001195CC
ffff8000001167a2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001167ac: 31 c0                	xorl	%eax, %eax
ffff8000001167ae: be 81 01 00 00       	movl	$385, %esi              # imm = 0x181
ffff8000001167b3: 41 ff d0             	callq	*%r8
ffff8000001167b6: e9 00 00 00 00       	jmp	0xffff8000001167bb <lab2_check_transparent_2m_paging+0x30b>
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001167bb: e9 00 00 00 00       	jmp	0xffff8000001167c0 <lab2_check_transparent_2m_paging+0x310>
ffff8000001167c0: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001167c4: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff8000001167ce: 48 23 01             	andq	(%rcx), %rax
ffff8000001167d1: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff8000001167d5: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001167d9: 48 b8 00 5f 11 00 00 80 ff ff	movabsq	$-140737487216896, %rax # imm = 0xFFFF800000115F00
ffff8000001167e3: ff d0                	callq	*%rax
ffff8000001167e5: 48 89 c1             	movq	%rax, %rcx
ffff8000001167e8: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff8000001167ec: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001167ef: 0f 84 32 00 00 00    	je	0xffff800000116827 <lab2_check_transparent_2m_paging+0x377>
ffff8000001167f5: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001167ff: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116809: 48 b9 bb 8c 11 00 00 80 ff ff	movabsq	$-140737487205189, %rcx # imm = 0xFFFF800000118CBB
ffff800000116813: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff80000011681d: 31 c0                	xorl	%eax, %eax
ffff80000011681f: be 82 01 00 00       	movl	$386, %esi              # imm = 0x182
ffff800000116824: 41 ff d0             	callq	*%r8
ffff800000116827: e9 00 00 00 00       	jmp	0xffff80000011682c <lab2_check_transparent_2m_paging+0x37c>
; 	assert(ret == page);
ffff80000011682c: e9 00 00 00 00       	jmp	0xffff800000116831 <lab2_check_transparent_2m_paging+0x381>
ffff800000116831: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000116835: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000116839: 0f 84 32 00 00 00    	je	0xffff800000116871 <lab2_check_transparent_2m_paging+0x3c1>
ffff80000011683f: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116849: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116853: 48 b9 ff 90 11 00 00 80 ff ff	movabsq	$-140737487204097, %rcx # imm = 0xFFFF8000001190FF
ffff80000011685d: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116867: 31 c0                	xorl	%eax, %eax
ffff800000116869: be 83 01 00 00       	movl	$387, %esi              # imm = 0x183
ffff80000011686e: 41 ff d0             	callq	*%r8
ffff800000116871: e9 00 00 00 00       	jmp	0xffff800000116876 <lab2_check_transparent_2m_paging+0x3c6>
; 	unmap_page_range(kernel_pml4, (void *)PAGE_SIZE, PAGE_SIZE);
ffff800000116876: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116880: 48 8b 38             	movq	(%rax), %rdi
ffff800000116883: 48 b8 e0 44 11 00 00 80 ff ff	movabsq	$-140737487223584, %rax # imm = 0xFFFF8000001144E0
ffff80000011688d: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116892: 48 89 d6             	movq	%rdx, %rsi
ffff800000116895: ff d0                	callq	*%rax
; 	addr = NULL;
ffff800000116897: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff80000011689f: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001168a7: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff8000001168af: 0f 83 43 03 00 00    	jae	0xffff800000116bf8 <lab2_check_transparent_2m_paging+0x748>
; 		entry = NULL;
ffff8000001168b5: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
; 		ret = page_lookup(kernel_pml4, addr, &entry);
ffff8000001168bd: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001168c7: 48 8b 38             	movq	(%rax), %rdi
ffff8000001168ca: 48 8b 75 e0          	movq	-32(%rbp), %rsi
ffff8000001168ce: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff8000001168d8: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff8000001168dc: ff d0                	callq	*%rax
ffff8000001168de: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		if (addr == (void *)PAGE_SIZE) {
ffff8000001168e2: b8 00 10 00 00       	movl	$4096, %eax             # imm = 0x1000
ffff8000001168e7: 48 39 45 e0          	cmpq	%rax, -32(%rbp)
ffff8000001168eb: 0f 85 93 00 00 00    	jne	0xffff800000116984 <lab2_check_transparent_2m_paging+0x4d4>
; 			assert(!ret);
ffff8000001168f1: e9 00 00 00 00       	jmp	0xffff8000001168f6 <lab2_check_transparent_2m_paging+0x446>
ffff8000001168f6: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff8000001168fb: 0f 84 32 00 00 00    	je	0xffff800000116933 <lab2_check_transparent_2m_paging+0x483>
ffff800000116901: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011690b: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116915: 48 b9 be 86 11 00 00 80 ff ff	movabsq	$-140737487206722, %rcx # imm = 0xFFFF8000001186BE
ffff80000011691f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116929: 31 c0                	xorl	%eax, %eax
ffff80000011692b: be 90 01 00 00       	movl	$400, %esi              # imm = 0x190
ffff800000116930: 41 ff d0             	callq	*%r8
ffff800000116933: e9 00 00 00 00       	jmp	0xffff800000116938 <lab2_check_transparent_2m_paging+0x488>
; 			assert(!entry);
ffff800000116938: e9 00 00 00 00       	jmp	0xffff80000011693d <lab2_check_transparent_2m_paging+0x48d>
ffff80000011693d: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff800000116942: 0f 84 32 00 00 00    	je	0xffff80000011697a <lab2_check_transparent_2m_paging+0x4ca>
ffff800000116948: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116952: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff80000011695c: 48 b9 c3 86 11 00 00 80 ff ff	movabsq	$-140737487206717, %rcx # imm = 0xFFFF8000001186C3
ffff800000116966: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116970: 31 c0                	xorl	%eax, %eax
ffff800000116972: be 91 01 00 00       	movl	$401, %esi              # imm = 0x191
ffff800000116977: 41 ff d0             	callq	*%r8
ffff80000011697a: e9 00 00 00 00       	jmp	0xffff80000011697f <lab2_check_transparent_2m_paging+0x4cf>
; 		} else {
ffff80000011697f: e9 50 02 00 00       	jmp	0xffff800000116bd4 <lab2_check_transparent_2m_paging+0x724>
; 			assert(ret);
ffff800000116984: e9 00 00 00 00       	jmp	0xffff800000116989 <lab2_check_transparent_2m_paging+0x4d9>
ffff800000116989: 48 83 7d f0 00       	cmpq	$0, -16(%rbp)
ffff80000011698e: 0f 85 32 00 00 00    	jne	0xffff8000001169c6 <lab2_check_transparent_2m_paging+0x516>
ffff800000116994: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011699e: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001169a8: 48 b9 e8 8e 11 00 00 80 ff ff	movabsq	$-140737487204632, %rcx # imm = 0xFFFF800000118EE8
ffff8000001169b2: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001169bc: 31 c0                	xorl	%eax, %eax
ffff8000001169be: be 93 01 00 00       	movl	$403, %esi              # imm = 0x193
ffff8000001169c3: 41 ff d0             	callq	*%r8
ffff8000001169c6: e9 00 00 00 00       	jmp	0xffff8000001169cb <lab2_check_transparent_2m_paging+0x51b>
; 			assert(entry);
ffff8000001169cb: e9 00 00 00 00       	jmp	0xffff8000001169d0 <lab2_check_transparent_2m_paging+0x520>
ffff8000001169d0: 48 83 7d e8 00       	cmpq	$0, -24(%rbp)
ffff8000001169d5: 0f 85 32 00 00 00    	jne	0xffff800000116a0d <lab2_check_transparent_2m_paging+0x55d>
ffff8000001169db: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001169e5: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff8000001169ef: 48 b9 de 8c 11 00 00 80 ff ff	movabsq	$-140737487205154, %rcx # imm = 0xFFFF800000118CDE
ffff8000001169f9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116a03: 31 c0                	xorl	%eax, %eax
ffff800000116a05: be 94 01 00 00       	movl	$404, %esi              # imm = 0x194
ffff800000116a0a: 41 ff d0             	callq	*%r8
ffff800000116a0d: e9 00 00 00 00       	jmp	0xffff800000116a12 <lab2_check_transparent_2m_paging+0x562>
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000116a12: e9 00 00 00 00       	jmp	0xffff800000116a17 <lab2_check_transparent_2m_paging+0x567>
ffff800000116a17: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116a1b: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000116a25: 48 23 01             	andq	(%rcx), %rax
ffff800000116a28: 48 83 f8 01          	cmpq	$1, %rax
ffff800000116a2c: 0f 84 32 00 00 00    	je	0xffff800000116a64 <lab2_check_transparent_2m_paging+0x5b4>
ffff800000116a32: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116a3c: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116a46: 48 b9 16 94 11 00 00 80 ff ff	movabsq	$-140737487203306, %rcx # imm = 0xFFFF800000119416
ffff800000116a50: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116a5a: 31 c0                	xorl	%eax, %eax
ffff800000116a5c: be 95 01 00 00       	movl	$405, %esi              # imm = 0x195
ffff800000116a61: 41 ff d0             	callq	*%r8
ffff800000116a64: e9 00 00 00 00       	jmp	0xffff800000116a69 <lab2_check_transparent_2m_paging+0x5b9>
; 			page = pa2page(PAGE_ADDR(*entry));
ffff800000116a69: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000116a6d: 48 bf 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rdi # imm = 0xFFFFFFFFF000
ffff800000116a77: 48 23 38             	andq	(%rax), %rdi
ffff800000116a7a: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff800000116a84: ff d0                	callq	*%rax
ffff800000116a86: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			assert(page->pp_order == 0);
ffff800000116a8a: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116a8e: 8a 40 12             	movb	18(%rax), %al
ffff800000116a91: 24 7f                	andb	$127, %al
ffff800000116a93: 0f b6 c0             	movzbl	%al, %eax
ffff800000116a96: 83 f8 00             	cmpl	$0, %eax
ffff800000116a99: 0f 84 32 00 00 00    	je	0xffff800000116ad1 <lab2_check_transparent_2m_paging+0x621>
ffff800000116a9f: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116aa9: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116ab3: 48 b9 5a 96 11 00 00 80 ff ff	movabsq	$-140737487202726, %rcx # imm = 0xFFFF80000011965A
ffff800000116abd: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116ac7: 31 c0                	xorl	%eax, %eax
ffff800000116ac9: be 97 01 00 00       	movl	$407, %esi              # imm = 0x197
ffff800000116ace: 41 ff d0             	callq	*%r8
ffff800000116ad1: e9 00 00 00 00       	jmp	0xffff800000116ad6 <lab2_check_transparent_2m_paging+0x626>
; 			assert(!page->pp_free);
ffff800000116ad6: e9 00 00 00 00       	jmp	0xffff800000116adb <lab2_check_transparent_2m_paging+0x62b>
ffff800000116adb: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116adf: 8a 40 12             	movb	18(%rax), %al
ffff800000116ae2: c0 e8 07             	shrb	$7, %al
ffff800000116ae5: 3c 00                	cmpb	$0, %al
ffff800000116ae7: 0f 84 32 00 00 00    	je	0xffff800000116b1f <lab2_check_transparent_2m_paging+0x66f>
ffff800000116aed: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116af7: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116b01: 48 b9 5d 85 11 00 00 80 ff ff	movabsq	$-140737487207075, %rcx # imm = 0xFFFF80000011855D
ffff800000116b0b: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116b15: 31 c0                	xorl	%eax, %eax
ffff800000116b17: be 98 01 00 00       	movl	$408, %esi              # imm = 0x198
ffff800000116b1c: 41 ff d0             	callq	*%r8
ffff800000116b1f: e9 00 00 00 00       	jmp	0xffff800000116b24 <lab2_check_transparent_2m_paging+0x674>
; 			assert(list_is_empty(&page->pp_node));
ffff800000116b24: e9 00 00 00 00       	jmp	0xffff800000116b29 <lab2_check_transparent_2m_paging+0x679>
ffff800000116b29: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116b2d: 48 b8 00 70 11 00 00 80 ff ff	movabsq	$-140737487212544, %rax # imm = 0xFFFF800000117000
ffff800000116b37: ff d0                	callq	*%rax
ffff800000116b39: 83 f8 00             	cmpl	$0, %eax
ffff800000116b3c: 0f 85 32 00 00 00    	jne	0xffff800000116b74 <lab2_check_transparent_2m_paging+0x6c4>
ffff800000116b42: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116b4c: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116b56: 48 b9 09 93 11 00 00 80 ff ff	movabsq	$-140737487203575, %rcx # imm = 0xFFFF800000119309
ffff800000116b60: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116b6a: 31 c0                	xorl	%eax, %eax
ffff800000116b6c: be 99 01 00 00       	movl	$409, %esi              # imm = 0x199
ffff800000116b71: 41 ff d0             	callq	*%r8
ffff800000116b74: e9 00 00 00 00       	jmp	0xffff800000116b79 <lab2_check_transparent_2m_paging+0x6c9>
; 			if (!ismemset(addr, (i & 0xff), PAGE_SIZE)) {
ffff800000116b79: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000116b7d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116b81: 48 25 ff 00 00 00    	andq	$255, %rax
ffff800000116b87: 89 c6                	movl	%eax, %esi
ffff800000116b89: 48 b8 30 64 11 00 00 80 ff ff	movabsq	$-140737487215568, %rax # imm = 0xFFFF800000116430
ffff800000116b93: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116b98: ff d0                	callq	*%rax
ffff800000116b9a: 83 f8 00             	cmpl	$0, %eax
ffff800000116b9d: 0f 85 2c 00 00 00    	jne	0xffff800000116bcf <lab2_check_transparent_2m_paging+0x71f>
; 				panic("page %p is corrupt", addr);
ffff800000116ba3: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff800000116ba7: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116bb1: 48 ba b4 8a 11 00 00 80 ff ff	movabsq	$-140737487205708, %rdx # imm = 0xFFFF800000118AB4
ffff800000116bbb: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116bc5: 31 c0                	xorl	%eax, %eax
ffff800000116bc7: be 9c 01 00 00       	movl	$412, %esi              # imm = 0x19C
ffff800000116bcc: 41 ff d0             	callq	*%r8
ffff800000116bcf: e9 00 00 00 00       	jmp	0xffff800000116bd4 <lab2_check_transparent_2m_paging+0x724>
; 	}
ffff800000116bd4: e9 00 00 00 00       	jmp	0xffff800000116bd9 <lab2_check_transparent_2m_paging+0x729>
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff800000116bd9: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116bdd: 48 83 c0 01          	addq	$1, %rax
ffff800000116be1: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000116be5: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff800000116be9: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff800000116bef: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000116bf3: e9 af fc ff ff       	jmp	0xffff8000001168a7 <lab2_check_transparent_2m_paging+0x3f7>
; 	page = page_alloc(0);
ffff800000116bf8: 31 c0                	xorl	%eax, %eax
ffff800000116bfa: 48 b8 f0 e8 10 00 00 80 ff ff	movabsq	$-140737487247120, %rax # imm = 0xFFFF80000010E8F0
ffff800000116c04: 31 ff                	xorl	%edi, %edi
ffff800000116c06: ff d0                	callq	*%rax
ffff800000116c08: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	if (!page) {
ffff800000116c0c: 48 83 7d f8 00       	cmpq	$0, -8(%rbp)
ffff800000116c11: 0f 85 27 00 00 00    	jne	0xffff800000116c3e <lab2_check_transparent_2m_paging+0x78e>
; 		panic("cannot allocate 4K page!");
ffff800000116c17: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116c21: 48 ba f0 92 11 00 00 80 ff ff	movabsq	$-140737487203600, %rdx # imm = 0xFFFF8000001192F0
ffff800000116c2b: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116c35: 31 c0                	xorl	%eax, %eax
ffff800000116c37: be a5 01 00 00       	movl	$421, %esi              # imm = 0x1A5
ffff800000116c3c: ff d1                	callq	*%rcx
; 	data = page2kva(page);
ffff800000116c3e: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116c42: 48 b8 40 6f 11 00 00 80 ff ff	movabsq	$-140737487212736, %rax # imm = 0xFFFF800000116F40
ffff800000116c4c: ff d0                	callq	*%rax
ffff800000116c4e: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	memset(data, 1, PAGE_SIZE);
ffff800000116c52: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000116c56: 48 b8 70 26 11 00 00 80 ff ff	movabsq	$-140737487231376, %rax # imm = 0xFFFF800000112670
ffff800000116c60: be 01 00 00 00       	movl	$1, %esi
ffff800000116c65: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116c6a: ff d0                	callq	*%rax
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff800000116c6c: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116c76: 48 8b 38             	movq	(%rax), %rdi
ffff800000116c79: 48 8b 75 f8          	movq	-8(%rbp), %rsi
ffff800000116c7d: 48 b8 00 30 11 00 00 80 ff ff	movabsq	$-140737487228928, %rax # imm = 0xFFFF800000113000
ffff800000116c87: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116c8c: b9 01 00 00 00       	movl	$1, %ecx
ffff800000116c91: ff d0                	callq	*%rax
ffff800000116c93: 83 f8 00             	cmpl	$0, %eax
ffff800000116c96: 0f 84 32 00 00 00    	je	0xffff800000116cce <lab2_check_transparent_2m_paging+0x81e>
ffff800000116c9c: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116ca6: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116cb0: 48 b9 58 8e 11 00 00 80 ff ff	movabsq	$-140737487204776, %rcx # imm = 0xFFFF800000118E58
ffff800000116cba: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116cc4: 31 c0                	xorl	%eax, %eax
ffff800000116cc6: be ad 01 00 00       	movl	$429, %esi              # imm = 0x1AD
ffff800000116ccb: 41 ff d0             	callq	*%r8
ffff800000116cce: e9 00 00 00 00       	jmp	0xffff800000116cd3 <lab2_check_transparent_2m_paging+0x823>
; 	page_lookup(kernel_pml4, 0, &entry);
ffff800000116cd3: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116cdd: 48 8b 38             	movq	(%rax), %rdi
ffff800000116ce0: 31 c0                	xorl	%eax, %eax
ffff800000116ce2: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000116cec: 31 c9                	xorl	%ecx, %ecx
ffff800000116cee: 89 ce                	movl	%ecx, %esi
ffff800000116cf0: 48 8d 55 e8          	leaq	-24(%rbp), %rdx
ffff800000116cf4: ff d0                	callq	*%rax
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000116cf6: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000116cfa: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000116d04: 48 23 01             	andq	(%rcx), %rax
ffff800000116d07: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000116d0d: 0f 84 32 00 00 00    	je	0xffff800000116d45 <lab2_check_transparent_2m_paging+0x895>
ffff800000116d13: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116d1d: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116d27: 48 b9 cc 95 11 00 00 80 ff ff	movabsq	$-140737487202868, %rcx # imm = 0xFFFF8000001195CC
ffff800000116d31: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116d3b: 31 c0                	xorl	%eax, %eax
ffff800000116d3d: be b1 01 00 00       	movl	$433, %esi              # imm = 0x1B1
ffff800000116d42: 41 ff d0             	callq	*%r8
ffff800000116d45: e9 00 00 00 00       	jmp	0xffff800000116d4a <lab2_check_transparent_2m_paging+0x89a>
; 	data = NULL;
ffff800000116d4a: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116d52: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000116d5a: 48 81 7d d0 00 02 00 00      	cmpq	$512, -48(%rbp) # imm = 0x200
ffff800000116d62: 0f 83 73 00 00 00    	jae	0xffff800000116ddb <lab2_check_transparent_2m_paging+0x92b>
; 		if (!ismemset(data, i & 0xff, PAGE_SIZE)) {
ffff800000116d68: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff800000116d6c: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116d70: 48 25 ff 00 00 00    	andq	$255, %rax
ffff800000116d76: 89 c6                	movl	%eax, %esi
ffff800000116d78: 48 b8 30 64 11 00 00 80 ff ff	movabsq	$-140737487215568, %rax # imm = 0xFFFF800000116430
ffff800000116d82: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000116d87: ff d0                	callq	*%rax
ffff800000116d89: 83 f8 00             	cmpl	$0, %eax
ffff800000116d8c: 0f 85 2a 00 00 00    	jne	0xffff800000116dbc <lab2_check_transparent_2m_paging+0x90c>
; 			panic("page %p is corrupt\n", NULL);
ffff800000116d92: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116d9c: 48 ba e3 8d 11 00 00 80 ff ff	movabsq	$-140737487204893, %rdx # imm = 0xFFFF800000118DE3
ffff800000116da6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116db0: 31 c0                	xorl	%eax, %eax
ffff800000116db2: 89 c1                	movl	%eax, %ecx
ffff800000116db4: be b8 01 00 00       	movl	$440, %esi              # imm = 0x1B8
ffff800000116db9: 41 ff d0             	callq	*%r8
; 		data += PAGE_SIZE;
ffff800000116dbc: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000116dc0: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff800000116dc6: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 	for (i = 0; i < 512; ++i) {
ffff800000116dca: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000116dce: 48 83 c0 01          	addq	$1, %rax
ffff800000116dd2: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff800000116dd6: e9 7f ff ff ff       	jmp	0xffff800000116d5a <lab2_check_transparent_2m_paging+0x8aa>
; 	unmap_page_range(kernel_pml4, 0, HPAGE_SIZE);
ffff800000116ddb: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116de5: 48 8b 38             	movq	(%rax), %rdi
ffff800000116de8: 31 c0                	xorl	%eax, %eax
ffff800000116dea: 48 b8 e0 44 11 00 00 80 ff ff	movabsq	$-140737487223584, %rax # imm = 0xFFFF8000001144E0
ffff800000116df4: 31 c9                	xorl	%ecx, %ecx
ffff800000116df6: 89 ce                	movl	%ecx, %esi
ffff800000116df8: ba 00 00 20 00       	movl	$2097152, %edx          # imm = 0x200000
ffff800000116dfd: ff d0                	callq	*%rax
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000116dff: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116e09: 48 8b 38             	movq	(%rax), %rdi
ffff800000116e0c: 31 c0                	xorl	%eax, %eax
ffff800000116e0e: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000116e18: 31 c9                	xorl	%ecx, %ecx
ffff800000116e1a: 89 ca                	movl	%ecx, %edx
ffff800000116e1c: 48 89 d6             	movq	%rdx, %rsi
ffff800000116e1f: ff d0                	callq	*%rax
ffff800000116e21: 48 83 f8 00          	cmpq	$0, %rax
ffff800000116e25: 0f 84 32 00 00 00    	je	0xffff800000116e5d <lab2_check_transparent_2m_paging+0x9ad>
ffff800000116e2b: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116e35: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116e3f: 48 b9 91 8a 11 00 00 80 ff ff	movabsq	$-140737487205743, %rcx # imm = 0xFFFF800000118A91
ffff800000116e49: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116e53: 31 c0                	xorl	%eax, %eax
ffff800000116e55: be c0 01 00 00       	movl	$448, %esi              # imm = 0x1C0
ffff800000116e5a: 41 ff d0             	callq	*%r8
ffff800000116e5d: e9 00 00 00 00       	jmp	0xffff800000116e62 <lab2_check_transparent_2m_paging+0x9b2>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000116e62: e9 00 00 00 00       	jmp	0xffff800000116e67 <lab2_check_transparent_2m_paging+0x9b7>
ffff800000116e67: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000116e71: 48 8b 00             	movq	(%rax), %rax
ffff800000116e74: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000116e78: 0f 84 32 00 00 00    	je	0xffff800000116eb0 <lab2_check_transparent_2m_paging+0xa00>
ffff800000116e7e: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116e88: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116e92: 48 b9 8c 8d 11 00 00 80 ff ff	movabsq	$-140737487204980, %rcx # imm = 0xFFFF800000118D8C
ffff800000116e9c: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116ea6: 31 c0                	xorl	%eax, %eax
ffff800000116ea8: be c3 01 00 00       	movl	$451, %esi              # imm = 0x1C3
ffff800000116ead: 41 ff d0             	callq	*%r8
ffff800000116eb0: e9 00 00 00 00       	jmp	0xffff800000116eb5 <lab2_check_transparent_2m_paging+0xa05>
; 	assert(nfree == count_total_free_pages());
ffff800000116eb5: e9 00 00 00 00       	jmp	0xffff800000116eba <lab2_check_transparent_2m_paging+0xa0a>
ffff800000116eba: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff800000116ebe: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000116ec2: 48 b8 30 e3 10 00 00 80 ff ff	movabsq	$-140737487248592, %rax # imm = 0xFFFF80000010E330
ffff800000116ecc: ff d0                	callq	*%rax
ffff800000116ece: 48 89 c1             	movq	%rax, %rcx
ffff800000116ed1: 48 8b 45 b0          	movq	-80(%rbp), %rax
ffff800000116ed5: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116ed8: 0f 84 32 00 00 00    	je	0xffff800000116f10 <lab2_check_transparent_2m_paging+0xa60>
ffff800000116ede: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000116ee8: 48 ba 67 8b 11 00 00 80 ff ff	movabsq	$-140737487205529, %rdx # imm = 0xFFFF800000118B67
ffff800000116ef2: 48 b9 b0 8b 11 00 00 80 ff ff	movabsq	$-140737487205456, %rcx # imm = 0xFFFF800000118BB0
ffff800000116efc: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000116f06: 31 c0                	xorl	%eax, %eax
ffff800000116f08: be c6 01 00 00       	movl	$454, %esi              # imm = 0x1C6
ffff800000116f0d: 41 ff d0             	callq	*%r8
ffff800000116f10: e9 00 00 00 00       	jmp	0xffff800000116f15 <lab2_check_transparent_2m_paging+0xa65>
; 	cprintf("[LAB 2] check_transparent_2m_paging() succeeded!\n");
ffff800000116f15: 48 bf d2 8b 11 00 00 80 ff ff	movabsq	$-140737487205422, %rdi # imm = 0xFFFF800000118BD2
ffff800000116f1f: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000116f29: 31 c0                	xorl	%eax, %eax
ffff800000116f2b: ff d1                	callq	*%rcx
; }
ffff800000116f2d: 48 83 c4 50          	addq	$80, %rsp
ffff800000116f31: 5d                   	popq	%rbp
ffff800000116f32: c3                   	retq
ffff800000116f33: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000116f3d: 0f 1f 00             	nopl	(%rax)

ffff800000116f40 <page2kva>:
; {
ffff800000116f40: 55                   	pushq	%rbp
ffff800000116f41: 48 89 e5             	movq	%rsp, %rbp
ffff800000116f44: 48 83 ec 10          	subq	$16, %rsp
ffff800000116f48: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return KADDR(page2pa(pp));
ffff800000116f4c: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000116f50: 48 b8 00 5f 11 00 00 80 ff ff	movabsq	$-140737487216896, %rax # imm = 0xFFFF800000115F00
ffff800000116f5a: ff d0                	callq	*%rax
ffff800000116f5c: 48 89 c2             	movq	%rax, %rdx
ffff800000116f5f: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000116f69: 48 b8 60 73 11 00 00 80 ff ff	movabsq	$-140737487211680, %rax # imm = 0xFFFF800000117360
ffff800000116f73: be 50 00 00 00       	movl	$80, %esi
ffff800000116f78: ff d0                	callq	*%rax
ffff800000116f7a: 48 83 c4 10          	addq	$16, %rsp
ffff800000116f7e: 5d                   	popq	%rbp
ffff800000116f7f: c3                   	retq

ffff800000116f80 <pa2page>:
; {
ffff800000116f80: 55                   	pushq	%rbp
ffff800000116f81: 48 89 e5             	movq	%rsp, %rbp
ffff800000116f84: 48 83 ec 10          	subq	$16, %rsp
ffff800000116f88: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000116f8c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000116f90: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000116f94: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000116f9e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000116fa1: 48 39 c8             	cmpq	%rcx, %rax
ffff800000116fa4: 0f 82 27 00 00 00    	jb	0xffff800000116fd1 <pa2page+0x51>
; 		panic("pa2page called with invalid pa");
ffff800000116faa: 48 bf 3e 86 11 00 00 80 ff ff	movabsq	$-140737487206850, %rdi # imm = 0xFFFF80000011863E
ffff800000116fb4: 48 ba 9f 93 11 00 00 80 ff ff	movabsq	$-140737487203425, %rdx # imm = 0xFFFF80000011939F
ffff800000116fbe: 48 b9 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %rcx # imm = 0xFFFF80000010CC40
ffff800000116fc8: 31 c0                	xorl	%eax, %eax
ffff800000116fca: be 49 00 00 00       	movl	$73, %esi
ffff800000116fcf: ff d1                	callq	*%rcx
; 	return pages + PAGE_INDEX(pa);
ffff800000116fd1: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff800000116fdb: 48 8b 00             	movq	(%rax), %rax
ffff800000116fde: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000116fe2: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000116fe6: 48 c1 e1 05          	shlq	$5, %rcx
ffff800000116fea: 48 01 c8             	addq	%rcx, %rax
ffff800000116fed: 48 83 c4 10          	addq	$16, %rsp
ffff800000116ff1: 5d                   	popq	%rbp
ffff800000116ff2: c3                   	retq
ffff800000116ff3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000116ffd: 0f 1f 00             	nopl	(%rax)

ffff800000117000 <list_is_empty>:
; {
ffff800000117000: 55                   	pushq	%rbp
ffff800000117001: 48 89 e5             	movq	%rsp, %rbp
ffff800000117004: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	return head->next == head;
ffff800000117008: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011700c: 48 8b 00             	movq	(%rax), %rax
ffff80000011700f: 48 3b 45 f8          	cmpq	-8(%rbp), %rax
ffff800000117013: 0f 94 c0             	sete	%al
ffff800000117016: 24 01                	andb	$1, %al
ffff800000117018: 0f b6 c0             	movzbl	%al, %eax
ffff80000011701b: 5d                   	popq	%rbp
ffff80000011701c: c3                   	retq
ffff80000011701d: 0f 1f 00             	nopl	(%rax)

ffff800000117020 <lab2_check_free_list_order>:
; {
ffff800000117020: 55                   	pushq	%rbp
ffff800000117021: 48 89 e5             	movq	%rsp, %rbp
ffff800000117024: 48 83 ec 20          	subq	$32, %rsp
; 	size_t nviolations = 0;
ffff800000117028: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff800000117030: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff800000117038: 48 83 7d e8 0a       	cmpq	$10, -24(%rbp)
ffff80000011703d: 0f 83 93 00 00 00    	jae	0xffff8000001170d6 <lab2_check_free_list_order+0xb6>
; 		list_foreach(buddy_free_list + order, node) {
ffff800000117043: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117047: 48 c1 e0 04          	shlq	$4, %rax
ffff80000011704b: 48 b9 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rcx # imm = 0xFFFF80000011D240
ffff800000117055: 48 01 c8             	addq	%rcx, %rax
ffff800000117058: 48 8b 00             	movq	(%rax), %rax
ffff80000011705b: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000011705f: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117063: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000117067: 48 c1 e1 04          	shlq	$4, %rcx
ffff80000011706b: 48 ba 40 d2 11 00 00 80 ff ff	movabsq	$-140737487187392, %rdx # imm = 0xFFFF80000011D240
ffff800000117075: 48 01 d1             	addq	%rdx, %rcx
ffff800000117078: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011707b: 0f 84 3f 00 00 00    	je	0xffff8000001170c0 <lab2_check_free_list_order+0xa0>
; 			page = container_of(node, struct page_info, pp_node);
ffff800000117081: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117085: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 			if (page->pp_order != order)
ffff800000117089: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff80000011708d: 8a 40 12             	movb	18(%rax), %al
ffff800000117090: 24 7f                	andb	$127, %al
ffff800000117092: 0f b6 c0             	movzbl	%al, %eax
ffff800000117095: 48 3b 45 e8          	cmpq	-24(%rbp), %rax
ffff800000117099: 0f 84 0c 00 00 00    	je	0xffff8000001170ab <lab2_check_free_list_order+0x8b>
; 				++nviolations;
ffff80000011709f: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001170a3: 48 83 c0 01          	addq	$1, %rax
ffff8000001170a7: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 		}
ffff8000001170ab: e9 00 00 00 00       	jmp	0xffff8000001170b0 <lab2_check_free_list_order+0x90>
; 		list_foreach(buddy_free_list + order, node) {
ffff8000001170b0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001170b4: 48 8b 00             	movq	(%rax), %rax
ffff8000001170b7: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff8000001170bb: e9 9f ff ff ff       	jmp	0xffff80000011705f <lab2_check_free_list_order+0x3f>
; 	}
ffff8000001170c0: e9 00 00 00 00       	jmp	0xffff8000001170c5 <lab2_check_free_list_order+0xa5>
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001170c5: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001170c9: 48 83 c0 01          	addq	$1, %rax
ffff8000001170cd: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff8000001170d1: e9 62 ff ff ff       	jmp	0xffff800000117038 <lab2_check_free_list_order+0x18>
; 	if (nviolations != 0) {
ffff8000001170d6: 48 83 7d e0 00       	cmpq	$0, -32(%rbp)
ffff8000001170db: 0f 84 2c 00 00 00    	je	0xffff80000011710d <lab2_check_free_list_order+0xed>
; 		panic("found %u order violations in free list", nviolations);
ffff8000001170e1: 48 8b 4d e0          	movq	-32(%rbp), %rcx
ffff8000001170e5: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001170ef: 48 ba 61 93 11 00 00 80 ff ff	movabsq	$-140737487203487, %rdx # imm = 0xFFFF800000119361
ffff8000001170f9: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117103: 31 c0                	xorl	%eax, %eax
ffff800000117105: be df 01 00 00       	movl	$479, %esi              # imm = 0x1DF
ffff80000011710a: 41 ff d0             	callq	*%r8
; 	cprintf("[LAB 2] check_free_list_order() succeeded!\n");
ffff80000011710d: 48 bf ff 95 11 00 00 80 ff ff	movabsq	$-140737487202817, %rdi # imm = 0xFFFF8000001195FF
ffff800000117117: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000117121: 31 c0                	xorl	%eax, %eax
ffff800000117123: ff d1                	callq	*%rcx
; }
ffff800000117125: 48 83 c4 20          	addq	$32, %rsp
ffff800000117129: 5d                   	popq	%rbp
ffff80000011712a: c3                   	retq
ffff80000011712b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000117130 <lab2_check_memory_layout>:
; {
ffff800000117130: 55                   	pushq	%rbp
ffff800000117131: 48 89 e5             	movq	%rsp, %rbp
ffff800000117134: 48 83 ec 50          	subq	$80, %rsp
ffff800000117138: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000011713c: 48 8b 45 f8          	movq	-8(%rbp), %rax
ffff800000117140: 8b 00                	movl	(%rax), %eax
ffff800000117142: 89 c2                	movl	%eax, %edx
ffff800000117144: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff80000011714e: 48 b8 60 73 11 00 00 80 ff ff	movabsq	$-140737487211680, %rax # imm = 0xFFFF800000117360
ffff800000117158: be ed 01 00 00       	movl	$493, %esi              # imm = 0x1ED
ffff80000011715d: ff d0                	callq	*%rax
ffff80000011715f: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	end = PADDR(boot_alloc(0));
ffff800000117163: 31 c0                	xorl	%eax, %eax
ffff800000117165: 48 b8 e0 dc 10 00 00 80 ff ff	movabsq	$-140737487250208, %rax # imm = 0xFFFF80000010DCE0
ffff80000011716f: 31 ff                	xorl	%edi, %edi
ffff800000117171: ff d0                	callq	*%rax
ffff800000117173: 48 89 c2             	movq	%rax, %rdx
ffff800000117176: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000117180: 48 b8 d0 73 11 00 00 80 ff ff	movabsq	$-140737487211568, %rax # imm = 0xFFFF8000001173D0
ffff80000011718a: be ee 01 00 00       	movl	$494, %esi              # imm = 0x1EE
ffff80000011718f: ff d0                	callq	*%rax
ffff800000117191: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000117195: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000011719d: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff8000001171a1: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff8000001171a5: 8b 49 04             	movl	4(%rcx), %ecx
ffff8000001171a8: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001171ab: 0f 83 84 01 00 00    	jae	0xffff800000117335 <lab2_check_memory_layout+0x205>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff8000001171b1: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001171b5: 48 8b 00             	movq	(%rax), %rax
ffff8000001171b8: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff8000001171bc: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff8000001171c0: 48 8b 4d f0          	movq	-16(%rbp), %rcx
ffff8000001171c4: 48 8b 09             	movq	(%rcx), %rcx
ffff8000001171c7: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff8000001171cb: 48 03 4a 08          	addq	8(%rdx), %rcx
ffff8000001171cf: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001171d2: 0f 83 3b 01 00 00    	jae	0xffff800000117313 <lab2_check_memory_layout+0x1e3>
; 			if (npages <= PAGE_INDEX(pa)) {
ffff8000001171d8: 48 b8 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rax # imm = 0xFFFF80000011D2E0
ffff8000001171e2: 48 8b 00             	movq	(%rax), %rax
ffff8000001171e5: 48 8b 4d d8          	movq	-40(%rbp), %rcx
ffff8000001171e9: 48 c1 e9 0c          	shrq	$12, %rcx
ffff8000001171ed: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001171f0: 0f 87 05 00 00 00    	ja	0xffff8000001171fb <lab2_check_memory_layout+0xcb>
; 				continue;
ffff8000001171f6: e9 05 01 00 00       	jmp	0xffff800000117300 <lab2_check_memory_layout+0x1d0>
; 			page = pa2page(pa);
ffff8000001171fb: 48 8b 7d d8          	movq	-40(%rbp), %rdi
ffff8000001171ff: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff800000117209: ff d0                	callq	*%rax
ffff80000011720b: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 			addr = (void *)ROUNDDOWN((uintptr_t)page, PAGE_SIZE);
ffff80000011720f: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117213: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff800000117217: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000011721b: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff800000117221: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff800000117225: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff800000117229: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 			if (!page_lookup(kernel_pml4, addr, NULL)) {
ffff80000011722d: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000117237: 48 8b 38             	movq	(%rax), %rdi
ffff80000011723a: 48 8b 75 c8          	movq	-56(%rbp), %rsi
ffff80000011723e: 31 c0                	xorl	%eax, %eax
ffff800000117240: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff80000011724a: 31 c9                	xorl	%ecx, %ecx
ffff80000011724c: 89 ca                	movl	%ecx, %edx
ffff80000011724e: ff d0                	callq	*%rax
ffff800000117250: 48 83 f8 00          	cmpq	$0, %rax
ffff800000117254: 0f 85 05 00 00 00    	jne	0xffff80000011725f <lab2_check_memory_layout+0x12f>
; 				continue;
ffff80000011725a: e9 a1 00 00 00       	jmp	0xffff800000117300 <lab2_check_memory_layout+0x1d0>
; 			if ((pa == 0 ||
ffff80000011725f: 48 83 7d d8 00       	cmpq	$0, -40(%rbp)
ffff800000117264: 0f 84 40 00 00 00    	je	0xffff8000001172aa <lab2_check_memory_layout+0x17a>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000011726a: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff80000011726e: 48 8b 4d f8          	movq	-8(%rbp), %rcx
ffff800000117272: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff800000117276: 48 39 c8             	cmpq	%rcx, %rax
ffff800000117279: 0f 84 2b 00 00 00    	je	0xffff8000001172aa <lab2_check_memory_layout+0x17a>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000011727f: b8 00 00 10 00       	movl	$1048576, %eax          # imm = 0x100000
ffff800000117284: 48 3b 45 d8          	cmpq	-40(%rbp), %rax
ffff800000117288: 0f 87 0e 00 00 00    	ja	0xffff80000011729c <lab2_check_memory_layout+0x16c>
ffff80000011728e: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000117292: 48 3b 45 d0          	cmpq	-48(%rbp), %rax
ffff800000117296: 0f 82 0e 00 00 00    	jb	0xffff8000001172aa <lab2_check_memory_layout+0x17a>
; 			    entry->type != MMAP_FREE) &&
ffff80000011729c: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001172a0: 83 78 10 01          	cmpl	$1, 16(%rax)
ffff8000001172a4: 0f 84 51 00 00 00    	je	0xffff8000001172fb <lab2_check_memory_layout+0x1cb>
; 			    page->pp_free) {
ffff8000001172aa: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001172ae: 8a 40 12             	movb	18(%rax), %al
ffff8000001172b1: c0 e8 07             	shrb	$7, %al
ffff8000001172b4: 0f b6 c0             	movzbl	%al, %eax
ffff8000001172b7: 83 f8 00             	cmpl	$0, %eax
; 			if ((pa == 0 ||
ffff8000001172ba: 0f 84 3b 00 00 00    	je	0xffff8000001172fb <lab2_check_memory_layout+0x1cb>
; 				panic("%p should not be free\n", page2pa(page));
ffff8000001172c0: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff8000001172c4: 48 b8 00 5f 11 00 00 80 ff ff	movabsq	$-140737487216896, %rax # imm = 0xFFFF800000115F00
ffff8000001172ce: ff d0                	callq	*%rax
ffff8000001172d0: 48 89 c1             	movq	%rax, %rcx
ffff8000001172d3: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001172dd: 48 ba 6b 89 11 00 00 80 ff ff	movabsq	$-140737487206037, %rdx # imm = 0xFFFF80000011896B
ffff8000001172e7: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001172f1: 31 c0                	xorl	%eax, %eax
ffff8000001172f3: be 03 02 00 00       	movl	$515, %esi              # imm = 0x203
ffff8000001172f8: 41 ff d0             	callq	*%r8
; 		}
ffff8000001172fb: e9 00 00 00 00       	jmp	0xffff800000117300 <lab2_check_memory_layout+0x1d0>
; 		     pa += PAGE_SIZE) {
ffff800000117300: 48 8b 45 d8          	movq	-40(%rbp), %rax
ffff800000117304: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff80000011730a: 48 89 45 d8          	movq	%rax, -40(%rbp)
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000011730e: e9 a9 fe ff ff       	jmp	0xffff8000001171bc <lab2_check_memory_layout+0x8c>
; 	}
ffff800000117313: e9 00 00 00 00       	jmp	0xffff800000117318 <lab2_check_memory_layout+0x1e8>
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff800000117318: 48 8b 45 e0          	movq	-32(%rbp), %rax
ffff80000011731c: 48 83 c0 01          	addq	$1, %rax
ffff800000117320: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff800000117324: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117328: 48 83 c0 18          	addq	$24, %rax
ffff80000011732c: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff800000117330: e9 68 fe ff ff       	jmp	0xffff80000011719d <lab2_check_memory_layout+0x6d>
; 	cprintf("[LAB 2] check_memory_layout() succeeded!\n");
ffff800000117335: 48 bf dc 88 11 00 00 80 ff ff	movabsq	$-140737487206180, %rdi # imm = 0xFFFF8000001188DC
ffff80000011733f: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000117349: 31 c0                	xorl	%eax, %eax
ffff80000011734b: ff d1                	callq	*%rcx
; }
ffff80000011734d: 48 83 c4 50          	addq	$80, %rsp
ffff800000117351: 5d                   	popq	%rbp
ffff800000117352: c3                   	retq
ffff800000117353: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011735d: 0f 1f 00             	nopl	(%rax)

ffff800000117360 <_kaddr>:
; {
ffff800000117360: 55                   	pushq	%rbp
ffff800000117361: 48 89 e5             	movq	%rsp, %rbp
ffff800000117364: 48 83 ec 20          	subq	$32, %rsp
ffff800000117368: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff80000011736c: 89 75 f4             	movl	%esi, -12(%rbp)
ffff80000011736f: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000117373: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117377: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000011737b: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff800000117385: 48 8b 09             	movq	(%rcx), %rcx
ffff800000117388: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011738b: 0f 82 24 00 00 00    	jb	0xffff8000001173b5 <_kaddr+0x55>
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000117391: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff800000117395: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000117398: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff80000011739c: 48 ba c1 8f 11 00 00 80 ff ff	movabsq	$-140737487204415, %rdx # imm = 0xFFFF800000118FC1
ffff8000001173a6: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001173b0: 31 c0                	xorl	%eax, %eax
ffff8000001173b2: 41 ff d0             	callq	*%r8
; 	return (void *)(pa + KERNEL_VMA);
ffff8000001173b5: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
ffff8000001173bf: 48 03 45 e8          	addq	-24(%rbp), %rax
ffff8000001173c3: 48 83 c4 20          	addq	$32, %rsp
ffff8000001173c7: 5d                   	popq	%rbp
ffff8000001173c8: c3                   	retq
ffff8000001173c9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001173d0 <_paddr>:
; {
ffff8000001173d0: 55                   	pushq	%rbp
ffff8000001173d1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001173d4: 48 83 ec 20          	subq	$32, %rsp
ffff8000001173d8: 48 89 7d f8          	movq	%rdi, -8(%rbp)
ffff8000001173dc: 89 75 f4             	movl	%esi, -12(%rbp)
ffff8000001173df: 48 89 55 e8          	movq	%rdx, -24(%rbp)
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff8000001173e3: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff8000001173e7: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff8000001173f1: 48 39 c8             	cmpq	%rcx, %rax
ffff8000001173f4: 0f 83 24 00 00 00    	jae	0xffff80000011741e <_paddr+0x4e>
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff8000001173fa: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff8000001173fe: 8b 75 f4             	movl	-12(%rbp), %esi
ffff800000117401: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff800000117405: 48 ba ed 87 11 00 00 80 ff ff	movabsq	$-140737487206419, %rdx # imm = 0xFFFF8000001187ED
ffff80000011740f: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117419: 31 c0                	xorl	%eax, %eax
ffff80000011741b: 41 ff d0             	callq	*%r8
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000011741e: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff800000117422: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000011742c: 48 29 c8             	subq	%rcx, %rax
ffff80000011742f: 48 83 c4 20          	addq	$32, %rsp
ffff800000117433: 5d                   	popq	%rbp
ffff800000117434: c3                   	retq
ffff800000117435: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011743f: 90                   	nop

ffff800000117440 <lab2_check_buddy_consistency>:
; {
ffff800000117440: 55                   	pushq	%rbp
ffff800000117441: 48 89 e5             	movq	%rsp, %rbp
ffff800000117444: 48 83 ec 20          	subq	$32, %rsp
; 	for (addr = 0;
ffff800000117448: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < npages * PAGE_SIZE;
ffff800000117450: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117454: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011745e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000117461: 48 c1 e1 0c          	shlq	$12, %rcx
ffff800000117465: 48 39 c8             	cmpq	%rcx, %rax
; 	for (addr = 0;
ffff800000117468: 0f 83 77 00 00 00    	jae	0xffff8000001174e5 <lab2_check_buddy_consistency+0xa5>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff80000011746e: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000117478: 48 8b 00             	movq	(%rax), %rax
ffff80000011747b: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000011747f: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117483: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff80000011748d: ff d0                	callq	*%rax
ffff80000011748f: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000117493: 48 89 c6             	movq	%rax, %rsi
ffff800000117496: 31 c0                	xorl	%eax, %eax
ffff800000117498: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff8000001174a2: 31 c9                	xorl	%ecx, %ecx
ffff8000001174a4: 89 ca                	movl	%ecx, %edx
ffff8000001174a6: ff d0                	callq	*%rax
ffff8000001174a8: 48 83 f8 00          	cmpq	$0, %rax
ffff8000001174ac: 0f 85 05 00 00 00    	jne	0xffff8000001174b7 <lab2_check_buddy_consistency+0x77>
; 			continue;
ffff8000001174b2: e9 1b 00 00 00       	jmp	0xffff8000001174d2 <lab2_check_buddy_consistency+0x92>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff8000001174b7: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff8000001174bb: 31 c0                	xorl	%eax, %eax
ffff8000001174bd: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff8000001174c7: 31 c9                	xorl	%ecx, %ecx
ffff8000001174c9: 89 ca                	movl	%ecx, %edx
ffff8000001174cb: be 09 00 00 00       	movl	$9, %esi
ffff8000001174d0: ff d0                	callq	*%rax
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff8000001174d2: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001174d6: 48 05 00 00 20 00    	addq	$2097152, %rax          # imm = 0x200000
ffff8000001174dc: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff8000001174e0: e9 6b ff ff ff       	jmp	0xffff800000117450 <lab2_check_buddy_consistency+0x10>
; 	cprintf("[LAB 2] check_buddy_consistency() succeeded!\n");
ffff8000001174e5: 48 bf da 89 11 00 00 80 ff ff	movabsq	$-140737487205926, %rdi # imm = 0xFFFF8000001189DA
ffff8000001174ef: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff8000001174f9: 31 c0                	xorl	%eax, %eax
ffff8000001174fb: ff d1                	callq	*%rcx
; }
ffff8000001174fd: 48 83 c4 20          	addq	$32, %rsp
ffff800000117501: 5d                   	popq	%rbp
ffff800000117502: c3                   	retq
ffff800000117503: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011750d: 0f 1f 00             	nopl	(%rax)

ffff800000117510 <lab2_check_buddy_full_consistency>:
; {
ffff800000117510: 55                   	pushq	%rbp
ffff800000117511: 48 89 e5             	movq	%rsp, %rbp
ffff800000117514: 48 83 ec 20          	subq	$32, %rsp
; 	for (addr = 0;
ffff800000117518: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
; 	     addr < npages * PAGE_SIZE;
ffff800000117520: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff800000117524: 48 b9 e0 d2 11 00 00 80 ff ff	movabsq	$-140737487187232, %rcx # imm = 0xFFFF80000011D2E0
ffff80000011752e: 48 8b 09             	movq	(%rcx), %rcx
ffff800000117531: 48 c1 e1 0c          	shlq	$12, %rcx
ffff800000117535: 48 39 c8             	cmpq	%rcx, %rax
; 	for (addr = 0;
ffff800000117538: 0f 83 b5 01 00 00    	jae	0xffff8000001176f3 <lab2_check_buddy_full_consistency+0x1e3>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff80000011753e: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff800000117548: 48 8b 00             	movq	(%rax), %rax
ffff80000011754b: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000011754f: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117553: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff80000011755d: ff d0                	callq	*%rax
ffff80000011755f: 48 8b 7d e8          	movq	-24(%rbp), %rdi
ffff800000117563: 48 89 c6             	movq	%rax, %rsi
ffff800000117566: 31 c0                	xorl	%eax, %eax
ffff800000117568: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000117572: 31 c9                	xorl	%ecx, %ecx
ffff800000117574: 89 ca                	movl	%ecx, %edx
ffff800000117576: ff d0                	callq	*%rax
ffff800000117578: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011757c: 0f 85 4f 00 00 00    	jne	0xffff8000001175d1 <lab2_check_buddy_full_consistency+0xc1>
; 	             panic("Page_info structure number %d is not mapped\n", pa2page(addr) - pages);
ffff800000117582: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117586: 48 b8 80 6f 11 00 00 80 ff ff	movabsq	$-140737487212672, %rax # imm = 0xFFFF800000116F80
ffff800000117590: ff d0                	callq	*%rax
ffff800000117592: 48 89 c1             	movq	%rax, %rcx
ffff800000117595: 48 b8 e8 d2 11 00 00 80 ff ff	movabsq	$-140737487187224, %rax # imm = 0xFFFF80000011D2E8
ffff80000011759f: 48 8b 00             	movq	(%rax), %rax
ffff8000001175a2: 48 29 c1             	subq	%rax, %rcx
ffff8000001175a5: 48 c1 f9 05          	sarq	$5, %rcx
ffff8000001175a9: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001175b3: 48 ba 8e 95 11 00 00 80 ff ff	movabsq	$-140737487202930, %rdx # imm = 0xFFFF80000011958E
ffff8000001175bd: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff8000001175c7: 31 c0                	xorl	%eax, %eax
ffff8000001175c9: be 2b 02 00 00       	movl	$555, %esi              # imm = 0x22B
ffff8000001175ce: 41 ff d0             	callq	*%r8
;                 if (!page_lookup(kernel_pml4, KADDR(addr), NULL)) {
ffff8000001175d1: 48 b8 f0 d2 11 00 00 80 ff ff	movabsq	$-140737487187216, %rax # imm = 0xFFFF80000011D2F0
ffff8000001175db: 48 8b 00             	movq	(%rax), %rax
ffff8000001175de: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff8000001175e2: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff8000001175e6: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001175f0: 48 b8 60 73 11 00 00 80 ff ff	movabsq	$-140737487211680, %rax # imm = 0xFFFF800000117360
ffff8000001175fa: be 2e 02 00 00       	movl	$558, %esi              # imm = 0x22E
ffff8000001175ff: ff d0                	callq	*%rax
ffff800000117601: 48 8b 7d e0          	movq	-32(%rbp), %rdi
ffff800000117605: 48 89 c6             	movq	%rax, %rsi
ffff800000117608: 31 c0                	xorl	%eax, %eax
ffff80000011760a: 48 b8 50 35 11 00 00 80 ff ff	movabsq	$-140737487227568, %rax # imm = 0xFFFF800000113550
ffff800000117614: 31 c9                	xorl	%ecx, %ecx
ffff800000117616: 89 ca                	movl	%ecx, %edx
ffff800000117618: ff d0                	callq	*%rax
ffff80000011761a: 48 83 f8 00          	cmpq	$0, %rax
ffff80000011761e: 0f 85 4a 00 00 00    	jne	0xffff80000011766e <lab2_check_buddy_full_consistency+0x15e>
;                      panic("Kernel address %llx should be mapped\n", KADDR(addr));
ffff800000117624: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff800000117628: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000117632: 48 b8 60 73 11 00 00 80 ff ff	movabsq	$-140737487211680, %rax # imm = 0xFFFF800000117360
ffff80000011763c: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff800000117641: ff d0                	callq	*%rax
ffff800000117643: 48 89 c1             	movq	%rax, %rcx
ffff800000117646: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000117650: 48 ba ca 86 11 00 00 80 ff ff	movabsq	$-140737487206710, %rdx # imm = 0xFFFF8000001186CA
ffff80000011765a: 49 b8 40 cc 10 00 00 80 ff ff	movabsq	$-140737487254464, %r8 # imm = 0xFFFF80000010CC40
ffff800000117664: 31 c0                	xorl	%eax, %eax
ffff800000117666: be 2f 02 00 00       	movl	$559, %esi              # imm = 0x22F
ffff80000011766b: 41 ff d0             	callq	*%r8
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000011766e: 48 8b 7d f0          	movq	-16(%rbp), %rdi
ffff800000117672: 31 c0                	xorl	%eax, %eax
ffff800000117674: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff80000011767e: 31 c9                	xorl	%ecx, %ecx
ffff800000117680: 89 ca                	movl	%ecx, %edx
ffff800000117682: be 09 00 00 00       	movl	$9, %esi
ffff800000117687: ff d0                	callq	*%rax
;                 check_buddy_consistency(PADDR(KADDR(addr)), BUDDY_MAX_ORDER - 1, NULL);
ffff800000117689: 48 8b 55 f0          	movq	-16(%rbp), %rdx
ffff80000011768d: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff800000117697: 48 b8 60 73 11 00 00 80 ff ff	movabsq	$-140737487211680, %rax # imm = 0xFFFF800000117360
ffff8000001176a1: be 36 02 00 00       	movl	$566, %esi              # imm = 0x236
ffff8000001176a6: ff d0                	callq	*%rax
ffff8000001176a8: 48 89 c2             	movq	%rax, %rdx
ffff8000001176ab: 48 bf 61 88 11 00 00 80 ff ff	movabsq	$-140737487206303, %rdi # imm = 0xFFFF800000118861
ffff8000001176b5: 48 b8 d0 73 11 00 00 80 ff ff	movabsq	$-140737487211568, %rax # imm = 0xFFFF8000001173D0
ffff8000001176bf: be 36 02 00 00       	movl	$566, %esi              # imm = 0x236
ffff8000001176c4: ff d0                	callq	*%rax
ffff8000001176c6: 48 89 c7             	movq	%rax, %rdi
ffff8000001176c9: 31 c0                	xorl	%eax, %eax
ffff8000001176cb: 48 b8 c0 fe 10 00 00 80 ff ff	movabsq	$-140737487241536, %rax # imm = 0xFFFF80000010FEC0
ffff8000001176d5: 31 c9                	xorl	%ecx, %ecx
ffff8000001176d7: 89 ca                	movl	%ecx, %edx
ffff8000001176d9: be 09 00 00 00       	movl	$9, %esi
ffff8000001176de: ff d0                	callq	*%rax
; 	     addr += (1 << PAGE_TABLE_SHIFT)) {
ffff8000001176e0: 48 8b 45 f0          	movq	-16(%rbp), %rax
ffff8000001176e4: 48 05 00 10 00 00    	addq	$4096, %rax             # imm = 0x1000
ffff8000001176ea: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	for (addr = 0;
ffff8000001176ee: e9 2d fe ff ff       	jmp	0xffff800000117520 <lab2_check_buddy_full_consistency+0x10>
; 	cprintf("[LAB 2] check_buddy_full_consistency() succeeded!\n");
ffff8000001176f3: 48 bf 72 91 11 00 00 80 ff ff	movabsq	$-140737487203982, %rdi # imm = 0xFFFF800000119172
ffff8000001176fd: 48 b9 80 dc 10 00 00 80 ff ff	movabsq	$-140737487250304, %rcx # imm = 0xFFFF80000010DC80
ffff800000117707: 31 c0                	xorl	%eax, %eax
ffff800000117709: ff d1                	callq	*%rcx
; }
ffff80000011770b: 48 83 c4 20          	addq	$32, %rsp
ffff80000011770f: 5d                   	popq	%rbp
ffff800000117710: c3                   	retq
ffff800000117711: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011771b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000117720 <lab2_check_pml4>:
; {
ffff800000117720: 55                   	pushq	%rbp
ffff800000117721: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_ptbl_flags();
ffff800000117724: 48 b8 b0 51 11 00 00 80 ff ff	movabsq	$-140737487220304, %rax # imm = 0xFFFF8000001151B0
ffff80000011772e: ff d0                	callq	*%rax
; 	lab2_check_wx();
ffff800000117730: 48 b8 60 53 11 00 00 80 ff ff	movabsq	$-140737487219872, %rax # imm = 0xFFFF800000115360
ffff80000011773a: ff d0                	callq	*%rax
; 	lab2_check_nx();
ffff80000011773c: 48 b8 c0 53 11 00 00 80 ff ff	movabsq	$-140737487219776, %rax # imm = 0xFFFF8000001153C0
ffff800000117746: ff d0                	callq	*%rax
; }
ffff800000117748: 5d                   	popq	%rbp
ffff800000117749: c3                   	retq
ffff80000011774a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000117750 <lab2_check_paging>:
; {
ffff800000117750: 55                   	pushq	%rbp
ffff800000117751: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_4k_paging();
ffff800000117754: 48 b8 10 5a 11 00 00 80 ff ff	movabsq	$-140737487218160, %rax # imm = 0xFFFF800000115A10
ffff80000011775e: ff d0                	callq	*%rax
; }
ffff800000117760: 5d                   	popq	%rbp
ffff800000117761: c3                   	retq
ffff800000117762: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011776c: 0f 1f 40 00          	nopl	(%rax)

ffff800000117770 <lab2_check_buddy>:
; {
ffff800000117770: 55                   	pushq	%rbp
ffff800000117771: 48 89 e5             	movq	%rsp, %rbp
ffff800000117774: 48 83 ec 10          	subq	$16, %rsp
ffff800000117778: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	lab2_check_free_list_order();
ffff80000011777c: 48 b8 20 70 11 00 00 80 ff ff	movabsq	$-140737487212512, %rax # imm = 0xFFFF800000117020
ffff800000117786: ff d0                	callq	*%rax
; 	lab2_check_memory_layout(boot_info);
ffff800000117788: 48 8b 7d f8          	movq	-8(%rbp), %rdi
ffff80000011778c: 48 b8 30 71 11 00 00 80 ff ff	movabsq	$-140737487212240, %rax # imm = 0xFFFF800000117130
ffff800000117796: ff d0                	callq	*%rax
; 	lab2_check_buddy_consistency();
ffff800000117798: 48 b8 40 74 11 00 00 80 ff ff	movabsq	$-140737487211456, %rax # imm = 0xFFFF800000117440
ffff8000001177a2: ff d0                	callq	*%rax
; 	lab2_check_vas();
ffff8000001177a4: 48 b8 e0 55 11 00 00 80 ff ff	movabsq	$-140737487219232, %rax # imm = 0xFFFF8000001155E0
ffff8000001177ae: ff d0                	callq	*%rax
; }
ffff8000001177b0: 48 83 c4 10          	addq	$16, %rsp
ffff8000001177b4: 5d                   	popq	%rbp
ffff8000001177b5: c3                   	retq
