
obj/kernel/kernel:	file format elf64-x86-64

Disassembly of section .boot:

0000000000100000 <_start>:
  100000: fa                           	cli
  100001: bc 00 90 10 00               	movl	$1085440, %esp          # imm = 0x109000
  100006: 6a 00                        	pushq	$0
  100008: 53                           	pushq	%rbx
  100009: b8 83 00 00 00               	movl	$131, %eax
  10000e: bf 00 b0 10 00               	movl	$1093632, %edi          # imm = 0x10B000
  100013: b9 04 00 00 00               	movl	$4, %ecx

0000000000100018 <.map_pages>:
  100018: 89 07                        	movl	%eax, (%rdi)
  10001a: 05 00 00 20 00               	addl	$2097152, %eax          # imm = 0x200000
  10001f: 83 c7 08                     	addl	$8, %edi
  100022: 49 75 f3                     	jne	0x100018 <.map_pages>
  100025: b8 00 b0 10 00               	movl	$1093632, %eax          # imm = 0x10B000
  10002a: 83 c8 03                     	orl	$3, %eax
  10002d: a3 00 a0 10 00 b8 00 a0 10   	movabsl	%eax, 1197958291155623936
  100036: 00 83 c8 03 a3 00            	addb	%al, 10683336(%rbx)
  10003c: 90                           	nop
  10003d: 10 00                        	adcb	%al, (%rax)
  10003f: a3 00 98 10 00 b8 00 90 10   	movabsl	%eax, 1193454691528251392
  100048: 00 0f                        	addb	%cl, (%rdi)
  10004a: 22 d8                        	andb	%al, %bl
  10004c: 0f 20 e0                     	movq	%cr4, %rax
  10004f: 83 c8 20                     	orl	$32, %eax
  100052: 0f 22 e0                     	movq	%rax, %cr4
  100055: b9 80 00 00 c0               	movl	$3221225600, %ecx       # imm = 0xC0000080
  10005a: 0f 32                        	rdmsr
  10005c: 0d 00 01 00 00               	orl	$256, %eax              # imm = 0x100
  100061: 0f 30                        	wrmsr
  100063: 0f 20 c0                     	movq	%cr0, %rax
  100066: 0d 00 00 00 80               	orl	$2147483648, %eax       # imm = 0x80000000
  10006b: 0f 22 c0                     	movq	%rax, %cr0
  10006e: 0f 01 15 c0 00 10 00         	lgdtq	1048768(%rip)           # 0x200135 <boot_end+0xf4135>
  100075: 66 b8 10 00                  	movw	$16, %ax
  100079: 8e d8                        	movl	%eax, %ds
  10007b: 8e c0                        	movl	%eax, %es
  10007d: 8e d0                        	movl	%eax, %ss
  10007f: ea                           	<unknown>
  100080: 86 00                        	xchgb	%al, (%rax)
  100082: 10 00                        	adcb	%al, (%rax)
  100084: 08 00                        	orb	%al, (%rax)

0000000000100086 <_start64>:
  100086: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
  100090: 48 01 c4                     	addq	%rax, %rsp
  100093: 5f                           	popq	%rdi
  100094: 48 01 c7                     	addq	%rax, %rdi
  100097: 48 b8 f0 c7 10 00 00 80 ff ff	movabsq	$-140737487255568, %rax # imm = 0xFFFF80000010C7F0
  1000a1: ff d0                        	callq	*%rax
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
ffff80000010c000: 55                   	pushq	%rbp
ffff80000010c001: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c004: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
ffff80000010c00e: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c011: 74 16                	je	0xffff80000010c029 <serial_intr+0x29>
ffff80000010c013: 48 bf 90 c0 10 00 00 80 ff ff	movabsq	$-140737487257456, %rdi # imm = 0xFFFF80000010C090
ffff80000010c01d: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c027: ff d0                	callq	*%rax
ffff80000010c029: 5d                   	popq	%rbp
ffff80000010c02a: c3                   	retq
ffff80000010c02b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c030 <cons_intr>:
ffff80000010c030: 55                   	pushq	%rbp
ffff80000010c031: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c034: 41 56                	pushq	%r14
ffff80000010c036: 53                   	pushq	%rbx
ffff80000010c037: 49 89 fe             	movq	%rdi, %r14
ffff80000010c03a: 48 bb 04 40 11 00 00 80 ff ff	movabsq	$-140737487224828, %rbx # imm = 0xFFFF800000114004
ffff80000010c044: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c04e: 66 90                	nop
ffff80000010c050: 41 ff d6             	callq	*%r14
ffff80000010c053: 85 c0                	testl	%eax, %eax
ffff80000010c055: 74 f9                	je	0xffff80000010c050 <cons_intr+0x20>
ffff80000010c057: 83 f8 ff             	cmpl	$-1, %eax
ffff80000010c05a: 74 2a                	je	0xffff80000010c086 <cons_intr+0x56>
ffff80000010c05c: 8b 8b 04 02 00 00    	movl	516(%rbx), %ecx
ffff80000010c062: 8d 51 01             	leal	1(%rcx), %edx
ffff80000010c065: 89 93 04 02 00 00    	movl	%edx, 516(%rbx)
ffff80000010c06b: 88 04 19             	movb	%al, (%rcx,%rbx)
ffff80000010c06e: 81 bb 04 02 00 00 00 02 00 00	cmpl	$512, 516(%rbx) # imm = 0x200
ffff80000010c078: 75 d6                	jne	0xffff80000010c050 <cons_intr+0x20>
ffff80000010c07a: c7 83 04 02 00 00 00 00 00 00	movl	$0, 516(%rbx)
ffff80000010c084: eb ca                	jmp	0xffff80000010c050 <cons_intr+0x20>
ffff80000010c086: 5b                   	popq	%rbx
ffff80000010c087: 41 5e                	popq	%r14
ffff80000010c089: 5d                   	popq	%rbp
ffff80000010c08a: c3                   	retq
ffff80000010c08b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c090 <serial_proc_data>:
ffff80000010c090: 55                   	pushq	%rbp
ffff80000010c091: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c094: 53                   	pushq	%rbx
ffff80000010c095: 50                   	pushq	%rax
ffff80000010c096: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c0a0: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c0a5: ff d3                	callq	*%rbx
ffff80000010c0a7: 89 c1                	movl	%eax, %ecx
ffff80000010c0a9: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010c0ae: f6 c1 01             	testb	$1, %cl
ffff80000010c0b1: 74 0a                	je	0xffff80000010c0bd <serial_proc_data+0x2d>
ffff80000010c0b3: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c0b8: ff d3                	callq	*%rbx
ffff80000010c0ba: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c0bd: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c0c1: 5b                   	popq	%rbx
ffff80000010c0c2: 5d                   	popq	%rbp
ffff80000010c0c3: c3                   	retq
ffff80000010c0c4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c0ce: 66 90                	nop

ffff80000010c0d0 <kbd_intr>:
ffff80000010c0d0: 55                   	pushq	%rbp
ffff80000010c0d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c0d4: 48 bf f0 c0 10 00 00 80 ff ff	movabsq	$-140737487257360, %rdi # imm = 0xFFFF80000010C0F0
ffff80000010c0de: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c0e8: ff d0                	callq	*%rax
ffff80000010c0ea: 5d                   	popq	%rbp
ffff80000010c0eb: c3                   	retq
ffff80000010c0ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c0f0 <kbd_proc_data>:
ffff80000010c0f0: 55                   	pushq	%rbp
ffff80000010c0f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c0f4: 41 56                	pushq	%r14
ffff80000010c0f6: 53                   	pushq	%rbx
ffff80000010c0f7: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c101: bf 64 00 00 00       	movl	$100, %edi
ffff80000010c106: ff d3                	callq	*%rbx
ffff80000010c108: 41 be ff ff ff ff    	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
ffff80000010c10e: a8 01                	testb	$1, %al
ffff80000010c110: 0f 84 08 01 00 00    	je	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c116: bf 60 00 00 00       	movl	$96, %edi
ffff80000010c11b: ff d3                	callq	*%rbx
ffff80000010c11d: 3c e0                	cmpb	$-32, %al
ffff80000010c11f: 75 15                	jne	0xffff80000010c136 <kbd_proc_data+0x46>
ffff80000010c121: 48 b8 0c 42 11 00 00 80 ff ff	movabsq	$-140737487224308, %rax # imm = 0xFFFF80000011420C
ffff80000010c12b: 80 08 40             	orb	$64, (%rax)
ffff80000010c12e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c131: e9 e8 00 00 00       	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c136: 48 b9 0c 42 11 00 00 80 ff ff	movabsq	$-140737487224308, %rcx # imm = 0xFFFF80000011420C
ffff80000010c140: 8b 11                	movl	(%rcx), %edx
ffff80000010c142: 84 c0                	testb	%al, %al
ffff80000010c144: 78 5c                	js	0xffff80000010c1a2 <kbd_proc_data+0xb2>
ffff80000010c146: f6 c2 40             	testb	$64, %dl
ffff80000010c149: 74 07                	je	0xffff80000010c152 <kbd_proc_data+0x62>
ffff80000010c14b: 0c 80                	orb	$-128, %al
ffff80000010c14d: 83 e2 bf             	andl	$-65, %edx
ffff80000010c150: 89 11                	movl	%edx, (%rcx)
ffff80000010c152: 0f b6 d0             	movzbl	%al, %edx
ffff80000010c155: 48 b8 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rax # imm = 0xFFFF800000110050
ffff80000010c15f: 0f b6 34 02          	movzbl	(%rdx,%rax), %esi
ffff80000010c163: 0b 31                	orl	(%rcx), %esi
ffff80000010c165: 48 b8 50 01 11 00 00 80 ff ff	movabsq	$-140737487240880, %rax # imm = 0xFFFF800000110150
ffff80000010c16f: 0f b6 04 02          	movzbl	(%rdx,%rax), %eax
ffff80000010c173: 31 f0                	xorl	%esi, %eax
ffff80000010c175: 89 01                	movl	%eax, (%rcx)
ffff80000010c177: 89 c1                	movl	%eax, %ecx
ffff80000010c179: 83 e1 03             	andl	$3, %ecx
ffff80000010c17c: 48 be 30 00 11 00 00 80 ff ff	movabsq	$-140737487241168, %rsi # imm = 0xFFFF800000110030
ffff80000010c186: 48 8b 0c ce          	movq	(%rsi,%rcx,8), %rcx
ffff80000010c18a: 44 0f b6 34 11       	movzbl	(%rcx,%rdx), %r14d
ffff80000010c18f: a8 08                	testb	$8, %al
ffff80000010c191: 74 4e                	je	0xffff80000010c1e1 <kbd_proc_data+0xf1>
ffff80000010c193: 41 8d 4e 9f          	leal	-97(%r14), %ecx
ffff80000010c197: 80 f9 19             	cmpb	$25, %cl
ffff80000010c19a: 77 33                	ja	0xffff80000010c1cf <kbd_proc_data+0xdf>
ffff80000010c19c: 41 83 c6 e0          	addl	$-32, %r14d
ffff80000010c1a0: eb 3f                	jmp	0xffff80000010c1e1 <kbd_proc_data+0xf1>
ffff80000010c1a2: 0f b6 f0             	movzbl	%al, %esi
ffff80000010c1a5: 24 7f                	andb	$127, %al
ffff80000010c1a7: f6 c2 40             	testb	$64, %dl
ffff80000010c1aa: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1ad: 0f 45 c6             	cmovnel	%esi, %eax
ffff80000010c1b0: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1b3: 48 be 50 00 11 00 00 80 ff ff	movabsq	$-140737487241136, %rsi # imm = 0xFFFF800000110050
ffff80000010c1bd: 0f b6 04 30          	movzbl	(%rax,%rsi), %eax
ffff80000010c1c1: f7 d0                	notl	%eax
ffff80000010c1c3: 21 d0                	andl	%edx, %eax
ffff80000010c1c5: 83 e0 bf             	andl	$-65, %eax
ffff80000010c1c8: 89 01                	movl	%eax, (%rcx)
ffff80000010c1ca: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c1cd: eb 4f                	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c1cf: 41 8d 4e bf          	leal	-65(%r14), %ecx
ffff80000010c1d3: 41 8d 56 20          	leal	32(%r14), %edx
ffff80000010c1d7: 80 f9 1a             	cmpb	$26, %cl
ffff80000010c1da: 41 0f 43 d6          	cmovael	%r14d, %edx
ffff80000010c1de: 41 89 d6             	movl	%edx, %r14d
ffff80000010c1e1: f7 d0                	notl	%eax
ffff80000010c1e3: a8 06                	testb	$6, %al
ffff80000010c1e5: 75 37                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c1e7: 41 81 fe e9 00 00 00 	cmpl	$233, %r14d
ffff80000010c1ee: 75 2e                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c1f0: 48 bf c7 0a 11 00 00 80 ff ff	movabsq	$-140737487238457, %rdi # imm = 0xFFFF800000110AC7
ffff80000010c1fa: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010c204: 31 c0                	xorl	%eax, %eax
ffff80000010c206: ff d1                	callq	*%rcx
ffff80000010c208: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c212: bf 92 00 00 00       	movl	$146, %edi
ffff80000010c217: be 03 00 00 00       	movl	$3, %esi
ffff80000010c21c: ff d0                	callq	*%rax
ffff80000010c21e: 44 89 f0             	movl	%r14d, %eax
ffff80000010c221: 5b                   	popq	%rbx
ffff80000010c222: 41 5e                	popq	%r14
ffff80000010c224: 5d                   	popq	%rbp
ffff80000010c225: c3                   	retq
ffff80000010c226: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c230 <cons_getc>:
ffff80000010c230: 55                   	pushq	%rbp
ffff80000010c231: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c234: 48 b8 00 c0 10 00 00 80 ff ff	movabsq	$-140737487257600, %rax # imm = 0xFFFF80000010C000
ffff80000010c23e: ff d0                	callq	*%rax
ffff80000010c240: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c24a: ff d0                	callq	*%rax
ffff80000010c24c: 48 b9 04 40 11 00 00 80 ff ff	movabsq	$-140737487224828, %rcx # imm = 0xFFFF800000114004
ffff80000010c256: 8b 91 00 02 00 00    	movl	512(%rcx), %edx
ffff80000010c25c: 31 c0                	xorl	%eax, %eax
ffff80000010c25e: 3b 91 04 02 00 00    	cmpl	516(%rcx), %edx
ffff80000010c264: 74 1e                	je	0xffff80000010c284 <cons_getc+0x54>
ffff80000010c266: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c269: 89 b1 00 02 00 00    	movl	%esi, 512(%rcx)
ffff80000010c26f: 0f b6 04 0a          	movzbl	(%rdx,%rcx), %eax
ffff80000010c273: 31 d2                	xorl	%edx, %edx
ffff80000010c275: 81 fe 00 02 00 00    	cmpl	$512, %esi              # imm = 0x200
ffff80000010c27b: 0f 45 d6             	cmovnel	%esi, %edx
ffff80000010c27e: 89 91 00 02 00 00    	movl	%edx, 512(%rcx)
ffff80000010c284: 5d                   	popq	%rbp
ffff80000010c285: c3                   	retq
ffff80000010c286: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c290 <cons_init>:
ffff80000010c290: 55                   	pushq	%rbp
ffff80000010c291: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c294: 48 b8 f0 c2 10 00 00 80 ff ff	movabsq	$-140737487256848, %rax # imm = 0xFFFF80000010C2F0
ffff80000010c29e: ff d0                	callq	*%rax
ffff80000010c2a0: 48 b8 c0 c3 10 00 00 80 ff ff	movabsq	$-140737487256640, %rax # imm = 0xFFFF80000010C3C0
ffff80000010c2aa: ff d0                	callq	*%rax
ffff80000010c2ac: 48 b8 f0 c3 10 00 00 80 ff ff	movabsq	$-140737487256592, %rax # imm = 0xFFFF80000010C3F0
ffff80000010c2b6: ff d0                	callq	*%rax
ffff80000010c2b8: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
ffff80000010c2c2: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c2c5: 74 02                	je	0xffff80000010c2c9 <cons_init+0x39>
ffff80000010c2c7: 5d                   	popq	%rbp
ffff80000010c2c8: c3                   	retq
ffff80000010c2c9: 48 bf 96 0e 11 00 00 80 ff ff	movabsq	$-140737487237482, %rdi # imm = 0xFFFF800000110E96
ffff80000010c2d3: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010c2dd: 31 c0                	xorl	%eax, %eax
ffff80000010c2df: ff d1                	callq	*%rcx
ffff80000010c2e1: 5d                   	popq	%rbp
ffff80000010c2e2: c3                   	retq
ffff80000010c2e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c2ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c2f0 <cga_init>:
ffff80000010c2f0: 55                   	pushq	%rbp
ffff80000010c2f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c2f4: 41 57                	pushq	%r15
ffff80000010c2f6: 41 56                	pushq	%r14
ffff80000010c2f8: 41 55                	pushq	%r13
ffff80000010c2fa: 41 54                	pushq	%r12
ffff80000010c2fc: 53                   	pushq	%rbx
ffff80000010c2fd: 50                   	pushq	%rax
ffff80000010c2fe: 49 bd 00 80 0b 00 00 80 ff ff	movabsq	$-140737487601664, %r13 # imm = 0xFFFF8000000B8000
ffff80000010c308: 41 0f b7 45 00       	movzwl	(%r13), %eax
ffff80000010c30d: 66 41 c7 45 00 5a a5 	movw	$42330, (%r13)          # imm = 0xA55A
ffff80000010c314: 41 0f b7 4d 00       	movzwl	(%r13), %ecx
ffff80000010c319: 81 f9 5a a5 00 00    	cmpl	$42330, %ecx            # imm = 0xA55A
ffff80000010c31f: 75 0c                	jne	0xffff80000010c32d <cga_init+0x3d>
ffff80000010c321: 66 41 89 45 00       	movw	%ax, (%r13)
ffff80000010c326: bf d4 03 00 00       	movl	$980, %edi              # imm = 0x3D4
ffff80000010c32b: eb 0c                	jmp	0xffff80000010c339 <cga_init+0x49>
ffff80000010c32d: 49 81 c5 00 80 ff ff 	addq	$-32768, %r13           # imm = 0x8000
ffff80000010c334: bf b4 03 00 00       	movl	$948, %edi              # imm = 0x3B4
ffff80000010c339: 49 be 10 42 11 00 00 80 ff ff	movabsq	$-140737487224304, %r14 # imm = 0xFFFF800000114210
ffff80000010c343: 41 89 3e             	movl	%edi, (%r14)
ffff80000010c346: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c350: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c355: 41 ff d7             	callq	*%r15
ffff80000010c358: 41 8b 06             	movl	(%r14), %eax
ffff80000010c35b: 83 c0 01             	addl	$1, %eax
ffff80000010c35e: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c361: 49 bc 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r12 # imm = 0xFFFF80000010C510
ffff80000010c36b: 41 ff d4             	callq	*%r12
ffff80000010c36e: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010c371: c1 e3 08             	shll	$8, %ebx
ffff80000010c374: 41 0f b7 3e          	movzwl	(%r14), %edi
ffff80000010c378: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c37d: 41 ff d7             	callq	*%r15
ffff80000010c380: 41 8b 06             	movl	(%r14), %eax
ffff80000010c383: 83 c0 01             	addl	$1, %eax
ffff80000010c386: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c389: 41 ff d4             	callq	*%r12
ffff80000010c38c: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c38f: 09 d8                	orl	%ebx, %eax
ffff80000010c391: 48 b9 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rcx # imm = 0xFFFF800000114218
ffff80000010c39b: 4c 89 29             	movq	%r13, (%rcx)
ffff80000010c39e: 48 b9 20 42 11 00 00 80 ff ff	movabsq	$-140737487224288, %rcx # imm = 0xFFFF800000114220
ffff80000010c3a8: 66 89 01             	movw	%ax, (%rcx)
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
ffff80000010c3c0: 55                   	pushq	%rbp
ffff80000010c3c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c3c4: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c3ce: ff d0                	callq	*%rax
ffff80000010c3d0: 48 b8 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rax # imm = 0xFFFF80000010D220
ffff80000010c3da: bf 01 00 00 00       	movl	$1, %edi
ffff80000010c3df: ff d0                	callq	*%rax
ffff80000010c3e1: 5d                   	popq	%rbp
ffff80000010c3e2: c3                   	retq
ffff80000010c3e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c3ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c3f0 <serial_init>:
ffff80000010c3f0: 55                   	pushq	%rbp
ffff80000010c3f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c3f4: 53                   	pushq	%rbx
ffff80000010c3f5: 50                   	pushq	%rax
ffff80000010c3f6: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c400: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c405: 31 f6                	xorl	%esi, %esi
ffff80000010c407: ff d3                	callq	*%rbx
ffff80000010c409: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c40e: be 80 00 00 00       	movl	$128, %esi
ffff80000010c413: ff d3                	callq	*%rbx
ffff80000010c415: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c41a: be 0c 00 00 00       	movl	$12, %esi
ffff80000010c41f: ff d3                	callq	*%rbx
ffff80000010c421: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c426: 31 f6                	xorl	%esi, %esi
ffff80000010c428: ff d3                	callq	*%rbx
ffff80000010c42a: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c42f: be 03 00 00 00       	movl	$3, %esi
ffff80000010c434: ff d3                	callq	*%rbx
ffff80000010c436: bf fc 03 00 00       	movl	$1020, %edi             # imm = 0x3FC
ffff80000010c43b: 31 f6                	xorl	%esi, %esi
ffff80000010c43d: ff d3                	callq	*%rbx
ffff80000010c43f: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c444: be 01 00 00 00       	movl	$1, %esi
ffff80000010c449: ff d3                	callq	*%rbx
ffff80000010c44b: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c455: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c45a: ff d3                	callq	*%rbx
ffff80000010c45c: 3c ff                	cmpb	$-1, %al
ffff80000010c45e: 48 b8 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rax # imm = 0xFFFF800000114000
ffff80000010c468: 0f 95 00             	setne	(%rax)
ffff80000010c46b: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c470: ff d3                	callq	*%rbx
ffff80000010c472: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c477: ff d3                	callq	*%rbx
ffff80000010c479: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c47d: 5b                   	popq	%rbx
ffff80000010c47e: 5d                   	popq	%rbp
ffff80000010c47f: c3                   	retq

ffff80000010c480 <cputchar>:
ffff80000010c480: 55                   	pushq	%rbp
ffff80000010c481: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c484: 48 b8 a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rax # imm = 0xFFFF80000010C4A0
ffff80000010c48e: ff d0                	callq	*%rax
ffff80000010c490: 5d                   	popq	%rbp
ffff80000010c491: c3                   	retq
ffff80000010c492: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c49c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c4a0 <cons_putc>:
ffff80000010c4a0: 55                   	pushq	%rbp
ffff80000010c4a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4a4: 53                   	pushq	%rbx
ffff80000010c4a5: 50                   	pushq	%rax
ffff80000010c4a6: 89 fb                	movl	%edi, %ebx
ffff80000010c4a8: 48 b8 30 c5 10 00 00 80 ff ff	movabsq	$-140737487256272, %rax # imm = 0xFFFF80000010C530
ffff80000010c4b2: ff d0                	callq	*%rax
ffff80000010c4b4: 48 b8 a0 c5 10 00 00 80 ff ff	movabsq	$-140737487256160, %rax # imm = 0xFFFF80000010C5A0
ffff80000010c4be: 89 df                	movl	%ebx, %edi
ffff80000010c4c0: ff d0                	callq	*%rax
ffff80000010c4c2: 48 b8 30 c6 10 00 00 80 ff ff	movabsq	$-140737487256016, %rax # imm = 0xFFFF80000010C630
ffff80000010c4cc: 89 df                	movl	%ebx, %edi
ffff80000010c4ce: ff d0                	callq	*%rax
ffff80000010c4d0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4d4: 5b                   	popq	%rbx
ffff80000010c4d5: 5d                   	popq	%rbp
ffff80000010c4d6: c3                   	retq
ffff80000010c4d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010c4e0 <getchar>:
ffff80000010c4e0: 55                   	pushq	%rbp
ffff80000010c4e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4e4: 53                   	pushq	%rbx
ffff80000010c4e5: 50                   	pushq	%rax
ffff80000010c4e6: 48 bb 30 c2 10 00 00 80 ff ff	movabsq	$-140737487257040, %rbx # imm = 0xFFFF80000010C230
ffff80000010c4f0: ff d3                	callq	*%rbx
ffff80000010c4f2: 85 c0                	testl	%eax, %eax
ffff80000010c4f4: 74 fa                	je	0xffff80000010c4f0 <getchar+0x10>
ffff80000010c4f6: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4fa: 5b                   	popq	%rbx
ffff80000010c4fb: 5d                   	popq	%rbp
ffff80000010c4fc: c3                   	retq
ffff80000010c4fd: 0f 1f 00             	nopl	(%rax)

ffff80000010c500 <iscons>:
ffff80000010c500: 55                   	pushq	%rbp
ffff80000010c501: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c504: b8 01 00 00 00       	movl	$1, %eax
ffff80000010c509: 5d                   	popq	%rbp
ffff80000010c50a: c3                   	retq
ffff80000010c50b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c510 <inb>:
ffff80000010c510: 55                   	pushq	%rbp
ffff80000010c511: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c514: 89 fa                	movl	%edi, %edx
ffff80000010c516: ec                   	inb	%dx, %al
ffff80000010c517: 5d                   	popq	%rbp
ffff80000010c518: c3                   	retq
ffff80000010c519: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010c520 <outb>:
ffff80000010c520: 55                   	pushq	%rbp
ffff80000010c521: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c524: 89 f0                	movl	%esi, %eax
ffff80000010c526: 89 fa                	movl	%edi, %edx
ffff80000010c528: ee                   	outb	%al, %dx
ffff80000010c529: 5d                   	popq	%rbp
ffff80000010c52a: c3                   	retq
ffff80000010c52b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c530 <serial_putc>:
ffff80000010c530: 55                   	pushq	%rbp
ffff80000010c531: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c534: 41 57                	pushq	%r15
ffff80000010c536: 41 56                	pushq	%r14
ffff80000010c538: 41 54                	pushq	%r12
ffff80000010c53a: 53                   	pushq	%rbx
ffff80000010c53b: 41 89 fe             	movl	%edi, %r14d
ffff80000010c53e: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c548: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c54d: 41 ff d7             	callq	*%r15
ffff80000010c550: a8 20                	testb	$32, %al
ffff80000010c552: 75 28                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c554: 31 db                	xorl	%ebx, %ebx
ffff80000010c556: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
ffff80000010c560: 41 ff d4             	callq	*%r12
ffff80000010c563: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c568: 41 ff d7             	callq	*%r15
ffff80000010c56b: a8 20                	testb	$32, %al
ffff80000010c56d: 75 0d                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c56f: 8d 43 01             	leal	1(%rbx), %eax
ffff80000010c572: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c578: 89 c3                	movl	%eax, %ebx
ffff80000010c57a: 72 e4                	jb	0xffff80000010c560 <serial_putc+0x30>
ffff80000010c57c: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c580: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c58a: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c58f: ff d0                	callq	*%rax
ffff80000010c591: 5b                   	popq	%rbx
ffff80000010c592: 41 5c                	popq	%r12
ffff80000010c594: 41 5e                	popq	%r14
ffff80000010c596: 41 5f                	popq	%r15
ffff80000010c598: 5d                   	popq	%rbp
ffff80000010c599: c3                   	retq
ffff80000010c59a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c5a0 <lpt_putc>:
ffff80000010c5a0: 55                   	pushq	%rbp
ffff80000010c5a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c5a4: 41 57                	pushq	%r15
ffff80000010c5a6: 41 56                	pushq	%r14
ffff80000010c5a8: 41 54                	pushq	%r12
ffff80000010c5aa: 53                   	pushq	%rbx
ffff80000010c5ab: 41 89 fe             	movl	%edi, %r14d
ffff80000010c5ae: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c5b8: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5bd: 41 ff d7             	callq	*%r15
ffff80000010c5c0: 84 c0                	testb	%al, %al
ffff80000010c5c2: 78 28                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5c4: 31 db                	xorl	%ebx, %ebx
ffff80000010c5c6: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
ffff80000010c5d0: 41 ff d4             	callq	*%r12
ffff80000010c5d3: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5d8: 41 ff d7             	callq	*%r15
ffff80000010c5db: 84 c0                	testb	%al, %al
ffff80000010c5dd: 78 0d                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5df: 8d 43 01             	leal	1(%rbx), %eax
ffff80000010c5e2: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c5e8: 89 c3                	movl	%eax, %ebx
ffff80000010c5ea: 72 e4                	jb	0xffff80000010c5d0 <lpt_putc+0x30>
ffff80000010c5ec: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c5f0: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c5fa: bf 78 03 00 00       	movl	$888, %edi              # imm = 0x378
ffff80000010c5ff: ff d3                	callq	*%rbx
ffff80000010c601: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c606: be 0d 00 00 00       	movl	$13, %esi
ffff80000010c60b: ff d3                	callq	*%rbx
ffff80000010c60d: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c612: be 08 00 00 00       	movl	$8, %esi
ffff80000010c617: ff d3                	callq	*%rbx
ffff80000010c619: 5b                   	popq	%rbx
ffff80000010c61a: 41 5c                	popq	%r12
ffff80000010c61c: 41 5e                	popq	%r14
ffff80000010c61e: 41 5f                	popq	%r15
ffff80000010c620: 5d                   	popq	%rbp
ffff80000010c621: c3                   	retq
ffff80000010c622: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c62c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c630 <cga_putc>:
ffff80000010c630: 55                   	pushq	%rbp
ffff80000010c631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c634: 41 57                	pushq	%r15
ffff80000010c636: 41 56                	pushq	%r14
ffff80000010c638: 53                   	pushq	%rbx
ffff80000010c639: 50                   	pushq	%rax
ffff80000010c63a: 89 f8                	movl	%edi, %eax
ffff80000010c63c: 0d 00 07 00 00       	orl	$1792, %eax             # imm = 0x700
ffff80000010c641: 81 ff 00 01 00 00    	cmpl	$256, %edi              # imm = 0x100
ffff80000010c647: 0f 43 c7             	cmovael	%edi, %eax
ffff80000010c64a: 8d 48 f8             	leal	-8(%rax), %ecx
ffff80000010c64d: 49 be 20 42 11 00 00 80 ff ff	movabsq	$-140737487224288, %r14 # imm = 0xFFFF800000114220
ffff80000010c657: 80 f9 05             	cmpb	$5, %cl
ffff80000010c65a: 0f 87 8f 00 00 00    	ja	0xffff80000010c6ef <cga_putc+0xbf>
ffff80000010c660: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010c663: 48 ba 00 00 11 00 00 80 ff ff	movabsq	$-140737487241216, %rdx # imm = 0xFFFF800000110000
ffff80000010c66d: ff 24 ca             	jmpq	*(%rdx,%rcx,8)
ffff80000010c670: 41 0f b7 0e          	movzwl	(%r14), %ecx
ffff80000010c674: 66 85 c9             	testw	%cx, %cx
ffff80000010c677: 0f 84 8e 00 00 00    	je	0xffff80000010c70b <cga_putc+0xdb>
ffff80000010c67d: 83 c1 ff             	addl	$-1, %ecx
ffff80000010c680: 66 41 89 0e          	movw	%cx, (%r14)
ffff80000010c684: 25 00 ff ff ff       	andl	$4294967040, %eax       # imm = 0xFFFFFF00
ffff80000010c689: 83 c8 20             	orl	$32, %eax
ffff80000010c68c: 48 ba 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rdx # imm = 0xFFFF800000114218
ffff80000010c696: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010c699: 0f b7 c9             	movzwl	%cx, %ecx
ffff80000010c69c: 66 89 04 4a          	movw	%ax, (%rdx,%rcx,2)
ffff80000010c6a0: eb 69                	jmp	0xffff80000010c70b <cga_putc+0xdb>
ffff80000010c6a2: 48 bb a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rbx # imm = 0xFFFF80000010C4A0
ffff80000010c6ac: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b1: ff d3                	callq	*%rbx
ffff80000010c6b3: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b8: ff d3                	callq	*%rbx
ffff80000010c6ba: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6bf: ff d3                	callq	*%rbx
ffff80000010c6c1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6c6: ff d3                	callq	*%rbx
ffff80000010c6c8: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6cd: ff d3                	callq	*%rbx
ffff80000010c6cf: eb 3a                	jmp	0xffff80000010c70b <cga_putc+0xdb>
ffff80000010c6d1: 66 41 83 06 50       	addw	$80, (%r14)
ffff80000010c6d6: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c6da: 69 c0 cd cc 00 00    	imull	$52429, %eax, %eax      # imm = 0xCCCD
ffff80000010c6e0: c1 e8 12             	shrl	$18, %eax
ffff80000010c6e3: 83 e0 f0             	andl	$-16, %eax
ffff80000010c6e6: 8d 04 80             	leal	(%rax,%rax,4), %eax
ffff80000010c6e9: 66 41 89 06          	movw	%ax, (%r14)
ffff80000010c6ed: eb 1c                	jmp	0xffff80000010c70b <cga_putc+0xdb>
ffff80000010c6ef: 48 b9 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rcx # imm = 0xFFFF800000114218
ffff80000010c6f9: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010c6fc: 41 0f b7 16          	movzwl	(%r14), %edx
ffff80000010c700: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c703: 66 41 89 36          	movw	%si, (%r14)
ffff80000010c707: 66 89 04 51          	movw	%ax, (%rcx,%rdx,2)
ffff80000010c70b: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c70f: 3d d0 07 00 00       	cmpl	$2000, %eax             # imm = 0x7D0
ffff80000010c714: 72 43                	jb	0xffff80000010c759 <cga_putc+0x129>
ffff80000010c716: 48 bb 18 42 11 00 00 80 ff ff	movabsq	$-140737487224296, %rbx # imm = 0xFFFF800000114218
ffff80000010c720: 48 8b 3b             	movq	(%rbx), %rdi
ffff80000010c723: 48 8d b7 a0 00 00 00 	leaq	160(%rdi), %rsi
ffff80000010c72a: 48 b8 e0 f8 10 00 00 80 ff ff	movabsq	$-140737487243040, %rax # imm = 0xFFFF80000010F8E0
ffff80000010c734: ba 00 0f 00 00       	movl	$3840, %edx             # imm = 0xF00
ffff80000010c739: ff d0                	callq	*%rax
ffff80000010c73b: 48 8b 03             	movq	(%rbx), %rax
ffff80000010c73e: 31 c9                	xorl	%ecx, %ecx
ffff80000010c740: 66 c7 84 48 00 0f 00 00 20 07	movw	$1824, 3840(%rax,%rcx,2) # imm = 0x720
ffff80000010c74a: 48 83 c1 01          	addq	$1, %rcx
ffff80000010c74e: 48 83 f9 50          	cmpq	$80, %rcx
ffff80000010c752: 75 ec                	jne	0xffff80000010c740 <cga_putc+0x110>
ffff80000010c754: 66 41 83 06 b0       	addw	$-80, (%r14)
ffff80000010c759: 48 bb 10 42 11 00 00 80 ff ff	movabsq	$-140737487224304, %rbx # imm = 0xFFFF800000114210
ffff80000010c763: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c766: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c770: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c775: 41 ff d7             	callq	*%r15
ffff80000010c778: 8b 03                	movl	(%rbx), %eax
ffff80000010c77a: 83 c0 01             	addl	$1, %eax
ffff80000010c77d: 41 0f b6 76 01       	movzbl	1(%r14), %esi
ffff80000010c782: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c785: 41 ff d7             	callq	*%r15
ffff80000010c788: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c78b: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c790: 41 ff d7             	callq	*%r15
ffff80000010c793: 8b 03                	movl	(%rbx), %eax
ffff80000010c795: 83 c0 01             	addl	$1, %eax
ffff80000010c798: 41 0f b6 36          	movzbl	(%r14), %esi
ffff80000010c79c: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c79f: 41 ff d7             	callq	*%r15
ffff80000010c7a2: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c7a6: 5b                   	popq	%rbx
ffff80000010c7a7: 41 5e                	popq	%r14
ffff80000010c7a9: 41 5f                	popq	%r15
ffff80000010c7ab: 5d                   	popq	%rbp
ffff80000010c7ac: c3                   	retq
ffff80000010c7ad: 0f 1f 00             	nopl	(%rax)

ffff80000010c7b0 <delay>:
ffff80000010c7b0: 55                   	pushq	%rbp
ffff80000010c7b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7b4: 53                   	pushq	%rbx
ffff80000010c7b5: 50                   	pushq	%rax
ffff80000010c7b6: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c7c0: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7c5: ff d3                	callq	*%rbx
ffff80000010c7c7: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7cc: ff d3                	callq	*%rbx
ffff80000010c7ce: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7d3: ff d3                	callq	*%rbx
ffff80000010c7d5: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7da: ff d3                	callq	*%rbx
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
ffff80000010c7f0: 55                   	pushq	%rbp
ffff80000010c7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7f4: 53                   	pushq	%rbx
ffff80000010c7f5: 50                   	pushq	%rax
ffff80000010c7f6: 48 89 fb             	movq	%rdi, %rbx
ffff80000010c7f9: 48 bf 00 33 11 00 00 80 ff ff	movabsq	$-140737487228160, %rdi # imm = 0xFFFF800000113300
ffff80000010c803: 48 ba f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rdx # imm = 0xFFFF8000001146F0
ffff80000010c80d: 48 29 fa             	subq	%rdi, %rdx
ffff80000010c810: 48 b8 90 f8 10 00 00 80 ff ff	movabsq	$-140737487243120, %rax # imm = 0xFFFF80000010F890
ffff80000010c81a: 31 f6                	xorl	%esi, %esi
ffff80000010c81c: ff d0                	callq	*%rax
ffff80000010c81e: 48 b8 90 c2 10 00 00 80 ff ff	movabsq	$-140737487256944, %rax # imm = 0xFFFF80000010C290
ffff80000010c828: ff d0                	callq	*%rax
ffff80000010c82a: 48 bf fb 0d 11 00 00 80 ff ff	movabsq	$-140737487237637, %rdi # imm = 0xFFFF800000110DFB
ffff80000010c834: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010c83e: 31 c0                	xorl	%eax, %eax
ffff80000010c840: ff d1                	callq	*%rcx
ffff80000010c842: 48 b8 d0 d8 10 00 00 80 ff ff	movabsq	$-140737487251248, %rax # imm = 0xFFFF80000010D8D0
ffff80000010c84c: 48 89 df             	movq	%rbx, %rdi
ffff80000010c84f: ff d0                	callq	*%rax
ffff80000010c851: 48 bb 60 ce 10 00 00 80 ff ff	movabsq	$-140737487253920, %rbx # imm = 0xFFFF80000010CE60
ffff80000010c85b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010c860: 31 ff                	xorl	%edi, %edi
ffff80000010c862: ff d3                	callq	*%rbx
ffff80000010c864: eb fa                	jmp	0xffff80000010c860 <kmain+0x70>
ffff80000010c866: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c870 <_panic>:
ffff80000010c870: 55                   	pushq	%rbp
ffff80000010c871: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c874: 41 56                	pushq	%r14
ffff80000010c876: 53                   	pushq	%rbx
ffff80000010c877: 48 83 ec 50          	subq	$80, %rsp
ffff80000010c87b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010c87f: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010c883: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010c887: 48 b8 28 42 11 00 00 80 ff ff	movabsq	$-140737487224280, %rax # imm = 0xFFFF800000114228
ffff80000010c891: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000010c895: 75 66                	jne	0xffff80000010c8fd <_panic+0x8d>
ffff80000010c897: 48 89 d3             	movq	%rdx, %rbx
ffff80000010c89a: 89 f2                	movl	%esi, %edx
ffff80000010c89c: 48 89 fe             	movq	%rdi, %rsi
ffff80000010c89f: 48 89 18             	movq	%rbx, (%rax)
ffff80000010c8a2: fa                   	cli
ffff80000010c8a3: fc                   	cld
ffff80000010c8a4: 48 8d 45 a0          	leaq	-96(%rbp), %rax
ffff80000010c8a8: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c8ac: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c8b0: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c8b4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010c8be: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010c8c2: 48 bf 67 09 11 00 00 80 ff ff	movabsq	$-140737487238809, %rdi # imm = 0xFFFF800000110967
ffff80000010c8cc: 49 be c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r14 # imm = 0xFFFF80000010D3C0
ffff80000010c8d6: 31 c0                	xorl	%eax, %eax
ffff80000010c8d8: 41 ff d6             	callq	*%r14
ffff80000010c8db: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010c8e5: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c8e9: 48 89 df             	movq	%rbx, %rdi
ffff80000010c8ec: ff d0                	callq	*%rax
ffff80000010c8ee: 48 bf fb 0d 11 00 00 80 ff ff	movabsq	$-140737487237637, %rdi # imm = 0xFFFF800000110DFB
ffff80000010c8f8: 31 c0                	xorl	%eax, %eax
ffff80000010c8fa: 41 ff d6             	callq	*%r14
ffff80000010c8fd: 48 bb 60 ce 10 00 00 80 ff ff	movabsq	$-140737487253920, %rbx # imm = 0xFFFF80000010CE60
ffff80000010c907: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
ffff80000010c910: 31 ff                	xorl	%edi, %edi
ffff80000010c912: ff d3                	callq	*%rbx
ffff80000010c914: eb fa                	jmp	0xffff80000010c910 <_panic+0xa0>
ffff80000010c916: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c920 <_warn>:
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
ffff80000010c943: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c947: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c94b: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c94f: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010c959: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010c95d: 48 bf fd 0d 11 00 00 80 ff ff	movabsq	$-140737487237635, %rdi # imm = 0xFFFF800000110DFD
ffff80000010c967: 49 be c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r14 # imm = 0xFFFF80000010D3C0
ffff80000010c971: 31 c0                	xorl	%eax, %eax
ffff80000010c973: 41 ff d6             	callq	*%r14
ffff80000010c976: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010c980: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c984: 48 89 df             	movq	%rbx, %rdi
ffff80000010c987: ff d0                	callq	*%rax
ffff80000010c989: 48 bf fb 0d 11 00 00 80 ff ff	movabsq	$-140737487237637, %rdi # imm = 0xFFFF800000110DFB
ffff80000010c993: 31 c0                	xorl	%eax, %eax
ffff80000010c995: 41 ff d6             	callq	*%r14
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
ffff80000010c9b0: 55                   	pushq	%rbp
ffff80000010c9b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c9b4: 41 57                	pushq	%r15
ffff80000010c9b6: 41 56                	pushq	%r14
ffff80000010c9b8: 41 54                	pushq	%r12
ffff80000010c9ba: 53                   	pushq	%rbx
ffff80000010c9bb: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010c9c0: 49 bf 50 02 11 00 00 80 ff ff	movabsq	$-140737487240624, %r15 # imm = 0xFFFF800000110250
ffff80000010c9ca: 49 be 17 0e 11 00 00 80 ff ff	movabsq	$-140737487237609, %r14 # imm = 0xFFFF800000110E17
ffff80000010c9d4: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010c9de: 66 90                	nop
ffff80000010c9e0: 4a 8b 74 3b f8       	movq	-8(%rbx,%r15), %rsi
ffff80000010c9e5: 4a 8b 14 3b          	movq	(%rbx,%r15), %rdx
ffff80000010c9e9: 4c 89 f7             	movq	%r14, %rdi
ffff80000010c9ec: 31 c0                	xorl	%eax, %eax
ffff80000010c9ee: 41 ff d4             	callq	*%r12
ffff80000010c9f1: 48 83 c3 18          	addq	$24, %rbx
ffff80000010c9f5: 48 81 fb 80 00 00 00 	cmpq	$128, %rbx
ffff80000010c9fc: 75 e2                	jne	0xffff80000010c9e0 <mon_help+0x30>
ffff80000010c9fe: 31 c0                	xorl	%eax, %eax
ffff80000010ca00: 5b                   	popq	%rbx
ffff80000010ca01: 41 5c                	popq	%r12
ffff80000010ca03: 41 5e                	popq	%r14
ffff80000010ca05: 41 5f                	popq	%r15
ffff80000010ca07: 5d                   	popq	%rbp
ffff80000010ca08: c3                   	retq
ffff80000010ca09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ca10 <mon_kerninfo>:
ffff80000010ca10: 55                   	pushq	%rbp
ffff80000010ca11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ca14: 41 57                	pushq	%r15
ffff80000010ca16: 41 56                	pushq	%r14
ffff80000010ca18: 41 54                	pushq	%r12
ffff80000010ca1a: 53                   	pushq	%rbx
ffff80000010ca1b: 48 bf 8f 0b 11 00 00 80 ff ff	movabsq	$-140737487238257, %rdi # imm = 0xFFFF800000110B8F
ffff80000010ca25: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010ca2f: 31 c0                	xorl	%eax, %eax
ffff80000010ca31: 41 ff d4             	callq	*%r12
ffff80000010ca34: 48 bf e9 0e 11 00 00 80 ff ff	movabsq	$-140737487237399, %rdi # imm = 0xFFFF800000110EE9
ffff80000010ca3e: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010ca48: 31 c0                	xorl	%eax, %eax
ffff80000010ca4a: 41 ff d4             	callq	*%r12
ffff80000010ca4d: 48 bf 74 08 11 00 00 80 ff ff	movabsq	$-140737487239052, %rdi # imm = 0xFFFF800000110874
ffff80000010ca57: 49 bf 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r15 # imm = 0x800000000000
ffff80000010ca61: 49 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %r14 # imm = 0xFFFF800000100000
ffff80000010ca6b: 4b 8d 14 3e          	leaq	(%r14,%r15), %rdx
ffff80000010ca6f: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ca72: 31 c0                	xorl	%eax, %eax
ffff80000010ca74: 41 ff d4             	callq	*%r12
ffff80000010ca77: 48 bf 0d 0a 11 00 00 80 ff ff	movabsq	$-140737487238643, %rdi # imm = 0xFFFF800000110A0D
ffff80000010ca81: 48 be c0 fa 10 00 00 80 ff ff	movabsq	$-140737487242560, %rsi # imm = 0xFFFF80000010FAC0
ffff80000010ca8b: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010ca8f: 31 c0                	xorl	%eax, %eax
ffff80000010ca91: 41 ff d4             	callq	*%r12
ffff80000010ca94: 48 bf 7f 09 11 00 00 80 ff ff	movabsq	$-140737487238785, %rdi # imm = 0xFFFF80000011097F
ffff80000010ca9e: 48 be 00 33 11 00 00 80 ff ff	movabsq	$-140737487228160, %rsi # imm = 0xFFFF800000113300
ffff80000010caa8: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010caac: 31 c0                	xorl	%eax, %eax
ffff80000010caae: 41 ff d4             	callq	*%r12
ffff80000010cab1: 48 bf 99 08 11 00 00 80 ff ff	movabsq	$-140737487239015, %rdi # imm = 0xFFFF800000110899
ffff80000010cabb: 48 bb f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rbx # imm = 0xFFFF8000001146F0
ffff80000010cac5: 49 01 df             	addq	%rbx, %r15
ffff80000010cac8: 48 89 de             	movq	%rbx, %rsi
ffff80000010cacb: 4c 89 fa             	movq	%r15, %rdx
ffff80000010cace: 31 c0                	xorl	%eax, %eax
ffff80000010cad0: 41 ff d4             	callq	*%r12
ffff80000010cad3: 4c 29 f3             	subq	%r14, %rbx
ffff80000010cad6: 48 81 c3 ff 03 00 00 	addq	$1023, %rbx             # imm = 0x3FF
ffff80000010cadd: 48 81 e3 00 fc ff ff 	andq	$-1024, %rbx            # imm = 0xFC00
ffff80000010cae4: 48 8d b3 ff 03 00 00 	leaq	1023(%rbx), %rsi
ffff80000010caeb: 48 85 db             	testq	%rbx, %rbx
ffff80000010caee: 48 0f 49 f3          	cmovnsq	%rbx, %rsi
ffff80000010caf2: 48 c1 fe 0a          	sarq	$10, %rsi
ffff80000010caf6: 48 bf 72 0c 11 00 00 80 ff ff	movabsq	$-140737487238030, %rdi # imm = 0xFFFF800000110C72
ffff80000010cb00: 31 c0                	xorl	%eax, %eax
ffff80000010cb02: 41 ff d4             	callq	*%r12
ffff80000010cb05: 31 c0                	xorl	%eax, %eax
ffff80000010cb07: 5b                   	popq	%rbx
ffff80000010cb08: 41 5c                	popq	%r12
ffff80000010cb0a: 41 5e                	popq	%r14
ffff80000010cb0c: 41 5f                	popq	%r15
ffff80000010cb0e: 5d                   	popq	%rbp
ffff80000010cb0f: c3                   	retq

ffff80000010cb10 <mon_backtrace>:
ffff80000010cb10: 55                   	pushq	%rbp
ffff80000010cb11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cb14: 41 57                	pushq	%r15
ffff80000010cb16: 41 56                	pushq	%r14
ffff80000010cb18: 41 55                	pushq	%r13
ffff80000010cb1a: 41 54                	pushq	%r12
ffff80000010cb1c: 53                   	pushq	%rbx
ffff80000010cb1d: 50                   	pushq	%rax
ffff80000010cb1e: 48 b8 00 cc 10 00 00 80 ff ff	movabsq	$-140737487254528, %rax # imm = 0xFFFF80000010CC00
ffff80000010cb28: ff d0                	callq	*%rax
ffff80000010cb2a: 48 89 c3             	movq	%rax, %rbx
ffff80000010cb2d: 48 bf 10 07 11 00 00 80 ff ff	movabsq	$-140737487239408, %rdi # imm = 0xFFFF800000110710
ffff80000010cb37: 49 bc c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r12 # imm = 0xFFFF80000010D3C0
ffff80000010cb41: 31 c0                	xorl	%eax, %eax
ffff80000010cb43: 41 ff d4             	callq	*%r12
ffff80000010cb46: 48 85 db             	testq	%rbx, %rbx
ffff80000010cb49: 0f 84 97 00 00 00    	je	0xffff80000010cbe6 <mon_backtrace+0xd6>
ffff80000010cb4f: 49 be 1d 0d 11 00 00 80 ff ff	movabsq	$-140737487237859, %r14 # imm = 0xFFFF800000110D1D
ffff80000010cb59: 49 bf fb 0d 11 00 00 80 ff ff	movabsq	$-140737487237637, %r15 # imm = 0xFFFF800000110DFB
ffff80000010cb63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cb6d: 0f 1f 00             	nopl	(%rax)
ffff80000010cb70: 48 8b 73 08          	movq	8(%rbx), %rsi
ffff80000010cb74: 48 bf f7 0f 11 00 00 80 ff ff	movabsq	$-140737487237129, %rdi # imm = 0xFFFF800000110FF7
ffff80000010cb7e: 31 c0                	xorl	%eax, %eax
ffff80000010cb80: 41 ff d4             	callq	*%r12
ffff80000010cb83: 48 bf 20 0e 11 00 00 80 ff ff	movabsq	$-140737487237600, %rdi # imm = 0xFFFF800000110E20
ffff80000010cb8d: 31 c0                	xorl	%eax, %eax
ffff80000010cb8f: 41 ff d4             	callq	*%r12
ffff80000010cb92: 48 bf 63 0d 11 00 00 80 ff ff	movabsq	$-140737487237789, %rdi # imm = 0xFFFF800000110D63
ffff80000010cb9c: 48 89 de             	movq	%rbx, %rsi
ffff80000010cb9f: 31 c0                	xorl	%eax, %eax
ffff80000010cba1: 41 ff d4             	callq	*%r12
ffff80000010cba4: 48 bf fd 0a 11 00 00 80 ff ff	movabsq	$-140737487238403, %rdi # imm = 0xFFFF800000110AFD
ffff80000010cbae: 31 c0                	xorl	%eax, %eax
ffff80000010cbb0: 41 ff d4             	callq	*%r12
ffff80000010cbb3: 41 bd 02 00 00 00    	movl	$2, %r13d
ffff80000010cbb9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010cbc0: 4a 8b 34 eb          	movq	(%rbx,%r13,8), %rsi
ffff80000010cbc4: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cbc7: 31 c0                	xorl	%eax, %eax
ffff80000010cbc9: 41 ff d4             	callq	*%r12
ffff80000010cbcc: 49 83 c5 01          	addq	$1, %r13
ffff80000010cbd0: 49 83 fd 08          	cmpq	$8, %r13
ffff80000010cbd4: 75 ea                	jne	0xffff80000010cbc0 <mon_backtrace+0xb0>
ffff80000010cbd6: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cbd9: 31 c0                	xorl	%eax, %eax
ffff80000010cbdb: 41 ff d4             	callq	*%r12
ffff80000010cbde: 48 8b 1b             	movq	(%rbx), %rbx
ffff80000010cbe1: 48 85 db             	testq	%rbx, %rbx
ffff80000010cbe4: 75 8a                	jne	0xffff80000010cb70 <mon_backtrace+0x60>
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
ffff80000010cc00: 55                   	pushq	%rbp
ffff80000010cc01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cc04: 48 89 e8             	movq	%rbp, %rax
ffff80000010cc07: 5d                   	popq	%rbp
ffff80000010cc08: c3                   	retq
ffff80000010cc09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010cc10 <mon_buddyinfo>:
ffff80000010cc10: 55                   	pushq	%rbp
ffff80000010cc11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cc14: 48 b8 f0 d6 10 00 00 80 ff ff	movabsq	$-140737487251728, %rax # imm = 0xFFFF80000010D6F0
ffff80000010cc1e: ff d0                	callq	*%rax
ffff80000010cc20: 31 c0                	xorl	%eax, %eax
ffff80000010cc22: 5d                   	popq	%rbp
ffff80000010cc23: c3                   	retq
ffff80000010cc24: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cc2e: 66 90                	nop

ffff80000010cc30 <mon_pageinfo>:
ffff80000010cc30: 55                   	pushq	%rbp
ffff80000010cc31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cc34: 41 57                	pushq	%r15
ffff80000010cc36: 41 56                	pushq	%r14
ffff80000010cc38: 41 55                	pushq	%r13
ffff80000010cc3a: 41 54                	pushq	%r12
ffff80000010cc3c: 53                   	pushq	%rbx
ffff80000010cc3d: 50                   	pushq	%rax
ffff80000010cc3e: 49 bf e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %r15 # imm = 0xFFFF8000001142E8
ffff80000010cc48: 49 83 3f 00          	cmpq	$0, (%r15)
ffff80000010cc4c: 0f 84 81 00 00 00    	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc52: 49 bc e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %r12 # imm = 0xFFFF8000001142E0
ffff80000010cc5c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010cc61: 74 70                	je	0xffff80000010ccd3 <mon_pageinfo+0xa3>
ffff80000010cc63: 48 89 f3             	movq	%rsi, %rbx
ffff80000010cc66: 83 ff 02             	cmpl	$2, %edi
ffff80000010cc69: 7e 4b                	jle	0xffff80000010ccb6 <mon_pageinfo+0x86>
ffff80000010cc6b: 48 8b 7b 10          	movq	16(%rbx), %rdi
ffff80000010cc6f: 48 b8 d0 f9 10 00 00 80 ff ff	movabsq	$-140737487242800, %rax # imm = 0xFFFF80000010F9D0
ffff80000010cc79: 31 f6                	xorl	%esi, %esi
ffff80000010cc7b: 31 d2                	xorl	%edx, %edx
ffff80000010cc7d: ff d0                	callq	*%rax
ffff80000010cc7f: 49 89 c6             	movq	%rax, %r14
ffff80000010cc82: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cc86: 48 be a0 0c 11 00 00 80 ff ff	movabsq	$-140737487237984, %rsi # imm = 0xFFFF800000110CA0
ffff80000010cc90: 49 bd c0 f7 10 00 00 80 ff ff	movabsq	$-140737487243328, %r13 # imm = 0xFFFF80000010F7C0
ffff80000010cc9a: 41 ff d5             	callq	*%r13
ffff80000010cc9d: 85 c0                	testl	%eax, %eax
ffff80000010cc9f: 74 5b                	je	0xffff80000010ccfc <mon_pageinfo+0xcc>
ffff80000010cca1: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cca5: 48 be 1b 0f 11 00 00 80 ff ff	movabsq	$-140737487237349, %rsi # imm = 0xFFFF800000110F1B
ffff80000010ccaf: 41 ff d5             	callq	*%r13
ffff80000010ccb2: 85 c0                	testl	%eax, %eax
ffff80000010ccb4: 74 5c                	je	0xffff80000010cd12 <mon_pageinfo+0xe2>
ffff80000010ccb6: 48 8b 33             	movq	(%rbx), %rsi
ffff80000010ccb9: 48 bf be 08 11 00 00 80 ff ff	movabsq	$-140737487238978, %rdi # imm = 0xFFFF8000001108BE
ffff80000010ccc3: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010cccd: 31 c0                	xorl	%eax, %eax
ffff80000010cccf: ff d1                	callq	*%rcx
ffff80000010ccd1: eb 18                	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
ffff80000010ccd3: 48 bf a0 07 11 00 00 80 ff ff	movabsq	$-140737487239264, %rdi # imm = 0xFFFF8000001107A0
ffff80000010ccdd: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010cce7: 31 c0                	xorl	%eax, %eax
ffff80000010cce9: ff d1                	callq	*%rcx
ffff80000010cceb: 31 c0                	xorl	%eax, %eax
ffff80000010cced: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ccf1: 5b                   	popq	%rbx
ffff80000010ccf2: 41 5c                	popq	%r12
ffff80000010ccf4: 41 5d                	popq	%r13
ffff80000010ccf6: 41 5e                	popq	%r14
ffff80000010ccf8: 41 5f                	popq	%r15
ffff80000010ccfa: 5d                   	popq	%rbp
ffff80000010ccfb: c3                   	retq
ffff80000010ccfc: 4d 3b 34 24          	cmpq	(%r12), %r14
ffff80000010cd00: 0f 83 be 00 00 00    	jae	0xffff80000010cdc4 <mon_pageinfo+0x194>
ffff80000010cd06: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cd09: 48 c1 e3 05          	shlq	$5, %rbx
ffff80000010cd0d: 49 03 1f             	addq	(%r15), %rbx
ffff80000010cd10: eb 1c                	jmp	0xffff80000010cd2e <mon_pageinfo+0xfe>
ffff80000010cd12: 4d 89 f7             	movq	%r14, %r15
ffff80000010cd15: 49 c1 ef 0c          	shrq	$12, %r15
ffff80000010cd19: 48 b8 e0 cd 10 00 00 80 ff ff	movabsq	$-140737487254048, %rax # imm = 0xFFFF80000010CDE0
ffff80000010cd23: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cd26: ff d0                	callq	*%rax
ffff80000010cd28: 48 89 c3             	movq	%rax, %rbx
ffff80000010cd2b: 4d 89 fe             	movq	%r15, %r14
ffff80000010cd2e: 48 bf c3 07 11 00 00 80 ff ff	movabsq	$-140737487239229, %rdi # imm = 0xFFFF8000001107C3
ffff80000010cd38: 49 bf c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r15 # imm = 0xFFFF80000010D3C0
ffff80000010cd42: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cd45: 31 c0                	xorl	%eax, %eax
ffff80000010cd47: 41 ff d7             	callq	*%r15
ffff80000010cd4a: 48 b8 40 ce 10 00 00 80 ff ff	movabsq	$-140737487253952, %rax # imm = 0xFFFF80000010CE40
ffff80000010cd54: 48 89 df             	movq	%rbx, %rdi
ffff80000010cd57: ff d0                	callq	*%rax
ffff80000010cd59: 48 bf d5 07 11 00 00 80 ff ff	movabsq	$-140737487239211, %rdi # imm = 0xFFFF8000001107D5
ffff80000010cd63: 48 89 c6             	movq	%rax, %rsi
ffff80000010cd66: 31 c0                	xorl	%eax, %eax
ffff80000010cd68: 41 ff d7             	callq	*%r15
ffff80000010cd6b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000010cd6f: 48 b8 4a 0f 11 00 00 80 ff ff	movabsq	$-140737487237302, %rax # imm = 0xFFFF800000110F4A
ffff80000010cd79: 48 be 73 0a 11 00 00 80 ff ff	movabsq	$-140737487238541, %rsi # imm = 0xFFFF800000110A73
ffff80000010cd83: 48 0f 49 f0          	cmovnsq	%rax, %rsi
ffff80000010cd87: 48 bf d3 0a 11 00 00 80 ff ff	movabsq	$-140737487238445, %rdi # imm = 0xFFFF800000110AD3
ffff80000010cd91: 31 c0                	xorl	%eax, %eax
ffff80000010cd93: 41 ff d7             	callq	*%r15
ffff80000010cd96: 0f b7 73 10          	movzwl	16(%rbx), %esi
ffff80000010cd9a: 48 bf 4f 0f 11 00 00 80 ff ff	movabsq	$-140737487237297, %rdi # imm = 0xFFFF800000110F4F
ffff80000010cda4: 31 c0                	xorl	%eax, %eax
ffff80000010cda6: 41 ff d7             	callq	*%r15
ffff80000010cda9: 0f b6 73 12          	movzbl	18(%rbx), %esi
ffff80000010cdad: 83 e6 7f             	andl	$127, %esi
ffff80000010cdb0: 48 bf d8 0f 11 00 00 80 ff ff	movabsq	$-140737487237160, %rdi # imm = 0xFFFF800000110FD8
ffff80000010cdba: 31 c0                	xorl	%eax, %eax
ffff80000010cdbc: 41 ff d7             	callq	*%r15
ffff80000010cdbf: e9 27 ff ff ff       	jmp	0xffff80000010cceb <mon_pageinfo+0xbb>
ffff80000010cdc4: 48 bf a4 09 11 00 00 80 ff ff	movabsq	$-140737487238748, %rdi # imm = 0xFFFF8000001109A4
ffff80000010cdce: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010cdd8: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cddb: e9 ed fe ff ff       	jmp	0xffff80000010cccd <mon_pageinfo+0x9d>

ffff80000010cde0 <pa2page>:
ffff80000010cde0: 55                   	pushq	%rbp
ffff80000010cde1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cde4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010cde8: 48 b8 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rax # imm = 0xFFFF8000001142E0
ffff80000010cdf2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010cdf5: 73 16                	jae	0xffff80000010ce0d <pa2page+0x2d>
ffff80000010cdf7: 48 b8 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rax # imm = 0xFFFF8000001142E8
ffff80000010ce01: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ce05: 48 03 38             	addq	(%rax), %rdi
ffff80000010ce08: 48 89 f8             	movq	%rdi, %rax
ffff80000010ce0b: 5d                   	popq	%rbp
ffff80000010ce0c: c3                   	retq
ffff80000010ce0d: 48 bf 23 08 11 00 00 80 ff ff	movabsq	$-140737487239133, %rdi # imm = 0xFFFF800000110823
ffff80000010ce17: 48 ba 61 0f 11 00 00 80 ff ff	movabsq	$-140737487237279, %rdx # imm = 0xFFFF800000110F61
ffff80000010ce21: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010ce2b: be 47 00 00 00       	movl	$71, %esi
ffff80000010ce30: 31 c0                	xorl	%eax, %eax
ffff80000010ce32: ff d1                	callq	*%rcx
ffff80000010ce34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ce3e: 66 90                	nop

ffff80000010ce40 <page2pa>:
ffff80000010ce40: 55                   	pushq	%rbp
ffff80000010ce41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce44: 48 89 f8             	movq	%rdi, %rax
ffff80000010ce47: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010ce51: 48 2b 01             	subq	(%rcx), %rax
ffff80000010ce54: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010ce58: 5d                   	popq	%rbp
ffff80000010ce59: c3                   	retq
ffff80000010ce5a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ce60 <monitor>:
ffff80000010ce60: 55                   	pushq	%rbp
ffff80000010ce61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ce64: 41 57                	pushq	%r15
ffff80000010ce66: 41 56                	pushq	%r14
ffff80000010ce68: 41 54                	pushq	%r12
ffff80000010ce6a: 53                   	pushq	%rbx
ffff80000010ce6b: 49 89 fe             	movq	%rdi, %r14
ffff80000010ce6e: 48 bf d3 0d 11 00 00 80 ff ff	movabsq	$-140737487237677, %rdi # imm = 0xFFFF800000110DD3
ffff80000010ce78: 48 bb c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rbx # imm = 0xFFFF80000010D3C0
ffff80000010ce82: 31 c0                	xorl	%eax, %eax
ffff80000010ce84: ff d3                	callq	*%rbx
ffff80000010ce86: 48 bf 32 0a 11 00 00 80 ff ff	movabsq	$-140737487238606, %rdi # imm = 0xFFFF800000110A32
ffff80000010ce90: 31 c0                	xorl	%eax, %eax
ffff80000010ce92: ff d3                	callq	*%rbx
ffff80000010ce94: 49 bf a8 0b 11 00 00 80 ff ff	movabsq	$-140737487238232, %r15 # imm = 0xFFFF800000110BA8
ffff80000010ce9e: 48 bb 40 f5 10 00 00 80 ff ff	movabsq	$-140737487243968, %rbx # imm = 0xFFFF80000010F540
ffff80000010cea8: 49 bc e0 ce 10 00 00 80 ff ff	movabsq	$-140737487253792, %r12 # imm = 0xFFFF80000010CEE0
ffff80000010ceb2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cebc: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cec0: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cec3: ff d3                	callq	*%rbx
ffff80000010cec5: 48 85 c0             	testq	%rax, %rax
ffff80000010cec8: 74 f6                	je	0xffff80000010cec0 <monitor+0x60>
ffff80000010ceca: 48 89 c7             	movq	%rax, %rdi
ffff80000010cecd: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ced0: 41 ff d4             	callq	*%r12
ffff80000010ced3: 85 c0                	testl	%eax, %eax
ffff80000010ced5: 79 e9                	jns	0xffff80000010cec0 <monitor+0x60>
ffff80000010ced7: 5b                   	popq	%rbx
ffff80000010ced8: 41 5c                	popq	%r12
ffff80000010ceda: 41 5e                	popq	%r14
ffff80000010cedc: 41 5f                	popq	%r15
ffff80000010cede: 5d                   	popq	%rbp
ffff80000010cedf: c3                   	retq

ffff80000010cee0 <runcmd>:
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
ffff80000010cefb: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff80000010cf06: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010cf09: 49 bc 5c 10 11 00 00 80 ff ff	movabsq	$-140737487237028, %r12 # imm = 0xFFFF80000011105C
ffff80000010cf13: 49 bd 30 f8 10 00 00 80 ff ff	movabsq	$-140737487243216, %r13 # imm = 0xFFFF80000010F830
ffff80000010cf1d: 0f 1f 00             	nopl	(%rax)
ffff80000010cf20: 41 8a 06             	movb	(%r14), %al
ffff80000010cf23: 84 c0                	testb	%al, %al
ffff80000010cf25: 74 3c                	je	0xffff80000010cf63 <runcmd+0x83>
ffff80000010cf27: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf2a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
ffff80000010cf30: 0f be f0             	movsbl	%al, %esi
ffff80000010cf33: 4c 89 e7             	movq	%r12, %rdi
ffff80000010cf36: 41 ff d5             	callq	*%r13
ffff80000010cf39: 48 85 c0             	testq	%rax, %rax
ffff80000010cf3c: 74 22                	je	0xffff80000010cf60 <runcmd+0x80>
ffff80000010cf3e: 4c 8d 73 01          	leaq	1(%rbx), %r14
ffff80000010cf42: c6 03 00             	movb	$0, (%rbx)
ffff80000010cf45: 0f b6 43 01          	movzbl	1(%rbx), %eax
ffff80000010cf49: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cf4c: 84 c0                	testb	%al, %al
ffff80000010cf4e: 75 e0                	jne	0xffff80000010cf30 <runcmd+0x50>
ffff80000010cf50: eb 11                	jmp	0xffff80000010cf63 <runcmd+0x83>
ffff80000010cf52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf5c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010cf60: 49 89 de             	movq	%rbx, %r14
ffff80000010cf63: 41 80 3e 00          	cmpb	$0, (%r14)
ffff80000010cf67: 74 48                	je	0xffff80000010cfb1 <runcmd+0xd1>
ffff80000010cf69: 49 83 ff 0f          	cmpq	$15, %r15
ffff80000010cf6d: 0f 84 ac 00 00 00    	je	0xffff80000010d01f <runcmd+0x13f>
ffff80000010cf73: 4e 89 b4 fd 50 ff ff ff      	movq	%r14, -176(%rbp,%r15,8)
ffff80000010cf7b: 49 83 c7 01          	addq	$1, %r15
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
ffff80000010cfab: 49 83 c6 01          	addq	$1, %r14
ffff80000010cfaf: eb df                	jmp	0xffff80000010cf90 <runcmd+0xb0>
ffff80000010cfb1: 44 89 f8             	movl	%r15d, %eax
ffff80000010cfb4: 48 c7 84 c5 50 ff ff ff 00 00 00 00  	movq	$0, -176(%rbp,%rax,8)
ffff80000010cfc0: 45 85 ff             	testl	%r15d, %r15d
ffff80000010cfc3: 74 7b                	je	0xffff80000010d040 <runcmd+0x160>
ffff80000010cfc5: 31 db                	xorl	%ebx, %ebx
ffff80000010cfc7: 49 bc 50 02 11 00 00 80 ff ff	movabsq	$-140737487240624, %r12 # imm = 0xFFFF800000110250
ffff80000010cfd1: 49 bd c0 f7 10 00 00 80 ff ff	movabsq	$-140737487243328, %r13 # imm = 0xFFFF80000010F7C0
ffff80000010cfdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010cfe0: 48 8b bd 50 ff ff ff 	movq	-176(%rbp), %rdi
ffff80000010cfe7: 4a 8b 34 23          	movq	(%rbx,%r12), %rsi
ffff80000010cfeb: 41 ff d5             	callq	*%r13
ffff80000010cfee: 85 c0                	testl	%eax, %eax
ffff80000010cff0: 74 52                	je	0xffff80000010d044 <runcmd+0x164>
ffff80000010cff2: 48 83 c3 18          	addq	$24, %rbx
ffff80000010cff6: 48 83 fb 78          	cmpq	$120, %rbx
ffff80000010cffa: 75 e4                	jne	0xffff80000010cfe0 <runcmd+0x100>
ffff80000010cffc: 48 8b b5 50 ff ff ff 	movq	-176(%rbp), %rsi
ffff80000010d003: 48 bf 5c 07 11 00 00 80 ff ff	movabsq	$-140737487239332, %rdi # imm = 0xFFFF80000011075C
ffff80000010d00d: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d017: 31 db                	xorl	%ebx, %ebx
ffff80000010d019: 31 c0                	xorl	%eax, %eax
ffff80000010d01b: ff d1                	callq	*%rcx
ffff80000010d01d: eb 3a                	jmp	0xffff80000010d059 <runcmd+0x179>
ffff80000010d01f: 48 bf e0 0a 11 00 00 80 ff ff	movabsq	$-140737487238432, %rdi # imm = 0xFFFF800000110AE0
ffff80000010d029: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d033: 31 db                	xorl	%ebx, %ebx
ffff80000010d035: be 10 00 00 00       	movl	$16, %esi
ffff80000010d03a: 31 c0                	xorl	%eax, %eax
ffff80000010d03c: ff d1                	callq	*%rcx
ffff80000010d03e: eb 19                	jmp	0xffff80000010d059 <runcmd+0x179>
ffff80000010d040: 31 db                	xorl	%ebx, %ebx
ffff80000010d042: eb 15                	jmp	0xffff80000010d059 <runcmd+0x179>
ffff80000010d044: 48 8d b5 50 ff ff ff 	leaq	-176(%rbp), %rsi
ffff80000010d04b: 44 89 ff             	movl	%r15d, %edi
ffff80000010d04e: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff80000010d052: 41 ff 54 1c 10       	callq	*16(%r12,%rbx)
ffff80000010d057: 89 c3                	movl	%eax, %ebx
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
ffff80000010d084: 48 bb 30 d1 10 00 00 80 ff ff	movabsq	$-140737487253200, %rbx # imm = 0xFFFF80000010D130
ffff80000010d08e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d093: ff d3                	callq	*%rbx
ffff80000010d095: 41 89 c7             	movl	%eax, %r15d
ffff80000010d098: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d09d: ff d3                	callq	*%rbx
ffff80000010d09f: 41 89 c6             	movl	%eax, %r14d
ffff80000010d0a2: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
ffff80000010d0ac: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d0b1: be 11 00 00 00       	movl	$17, %esi
ffff80000010d0b6: ff d3                	callq	*%rbx
ffff80000010d0b8: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d0bd: be 11 00 00 00       	movl	$17, %esi
ffff80000010d0c2: ff d3                	callq	*%rbx
ffff80000010d0c4: 41 0f b6 f5          	movzbl	%r13b, %esi
ffff80000010d0c8: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0cd: ff d3                	callq	*%rbx
ffff80000010d0cf: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff80000010d0d3: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d0d8: ff d3                	callq	*%rbx
ffff80000010d0da: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0df: be 04 00 00 00       	movl	$4, %esi
ffff80000010d0e4: ff d3                	callq	*%rbx
ffff80000010d0e6: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d0eb: be 02 00 00 00       	movl	$2, %esi
ffff80000010d0f0: ff d3                	callq	*%rbx
ffff80000010d0f2: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d0f7: be 03 00 00 00       	movl	$3, %esi
ffff80000010d0fc: ff d3                	callq	*%rbx
ffff80000010d0fe: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d103: be 01 00 00 00       	movl	$1, %esi
ffff80000010d108: ff d3                	callq	*%rbx
ffff80000010d10a: 41 0f b6 f7          	movzbl	%r15b, %esi
ffff80000010d10e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d113: ff d3                	callq	*%rbx
ffff80000010d115: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010d119: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d11e: ff d3                	callq	*%rbx
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
ffff80000010d130: 55                   	pushq	%rbp
ffff80000010d131: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d134: 89 fa                	movl	%edi, %edx
ffff80000010d136: ec                   	inb	%dx, %al
ffff80000010d137: 5d                   	popq	%rbp
ffff80000010d138: c3                   	retq
ffff80000010d139: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d140 <outb>:
ffff80000010d140: 55                   	pushq	%rbp
ffff80000010d141: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d144: 89 f0                	movl	%esi, %eax
ffff80000010d146: 89 fa                	movl	%edi, %edx
ffff80000010d148: ee                   	outb	%al, %dx
ffff80000010d149: 5d                   	popq	%rbp
ffff80000010d14a: c3                   	retq
ffff80000010d14b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d150 <pic_get_reg>:
ffff80000010d150: 55                   	pushq	%rbp
ffff80000010d151: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d154: 41 56                	pushq	%r14
ffff80000010d156: 53                   	pushq	%rbx
ffff80000010d157: 40 0f b6 df          	movzbl	%dil, %ebx
ffff80000010d15b: 49 be 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %r14 # imm = 0xFFFF80000010D140
ffff80000010d165: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d16a: 89 de                	movl	%ebx, %esi
ffff80000010d16c: 41 ff d6             	callq	*%r14
ffff80000010d16f: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d174: 89 de                	movl	%ebx, %esi
ffff80000010d176: 41 ff d6             	callq	*%r14
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
ffff80000010d1b0: 55                   	pushq	%rbp
ffff80000010d1b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d1b4: 48 b8 50 d1 10 00 00 80 ff ff	movabsq	$-140737487253168, %rax # imm = 0xFFFF80000010D150
ffff80000010d1be: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010d1c3: ff d0                	callq	*%rax
ffff80000010d1c5: 5d                   	popq	%rbp
ffff80000010d1c6: c3                   	retq
ffff80000010d1c7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d1d0 <pic_get_isr>:
ffff80000010d1d0: 55                   	pushq	%rbp
ffff80000010d1d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d1d4: 48 b8 50 d1 10 00 00 80 ff ff	movabsq	$-140737487253168, %rax # imm = 0xFFFF80000010D150
ffff80000010d1de: bf 0b 00 00 00       	movl	$11, %edi
ffff80000010d1e3: ff d0                	callq	*%rax
ffff80000010d1e5: 5d                   	popq	%rbp
ffff80000010d1e6: c3                   	retq
ffff80000010d1e7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d1f0 <pic_disable_all_irqs>:
ffff80000010d1f0: 55                   	pushq	%rbp
ffff80000010d1f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d1f4: 53                   	pushq	%rbx
ffff80000010d1f5: 50                   	pushq	%rax
ffff80000010d1f6: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
ffff80000010d200: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d205: be ff 00 00 00       	movl	$255, %esi
ffff80000010d20a: ff d3                	callq	*%rbx
ffff80000010d20c: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d211: be ff 00 00 00       	movl	$255, %esi
ffff80000010d216: ff d3                	callq	*%rbx
ffff80000010d218: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d21c: 5b                   	popq	%rbx
ffff80000010d21d: 5d                   	popq	%rbp
ffff80000010d21e: c3                   	retq
ffff80000010d21f: 90                   	nop

ffff80000010d220 <pic_enable_irq>:
ffff80000010d220: 55                   	pushq	%rbp
ffff80000010d221: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d224: 41 56                	pushq	%r14
ffff80000010d226: 53                   	pushq	%rbx
ffff80000010d227: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d22a: 31 db                	xorl	%ebx, %ebx
ffff80000010d22c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d22f: 0f 9d c3             	setge	%bl
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
ffff80000010d26d: 5b                   	popq	%rbx
ffff80000010d26e: 41 5e                	popq	%r14
ffff80000010d270: 5d                   	popq	%rbp
ffff80000010d271: c3                   	retq
ffff80000010d272: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d27c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d280 <pic_disable_irq>:
ffff80000010d280: 55                   	pushq	%rbp
ffff80000010d281: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d284: 41 56                	pushq	%r14
ffff80000010d286: 53                   	pushq	%rbx
ffff80000010d287: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d28a: 31 db                	xorl	%ebx, %ebx
ffff80000010d28c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d28f: 0f 9d c3             	setge	%bl
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
ffff80000010d2cb: 5b                   	popq	%rbx
ffff80000010d2cc: 41 5e                	popq	%r14
ffff80000010d2ce: 5d                   	popq	%rbp
ffff80000010d2cf: c3                   	retq

ffff80000010d2d0 <pic_eoi>:
ffff80000010d2d0: 55                   	pushq	%rbp
ffff80000010d2d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d2d4: 53                   	pushq	%rbx
ffff80000010d2d5: 50                   	pushq	%rax
ffff80000010d2d6: 48 bb 40 d1 10 00 00 80 ff ff	movabsq	$-140737487253184, %rbx # imm = 0xFFFF80000010D140
ffff80000010d2e0: 83 ff 08             	cmpl	$8, %edi
ffff80000010d2e3: 7c 0c                	jl	0xffff80000010d2f1 <pic_eoi+0x21>
ffff80000010d2e5: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d2ea: be 20 00 00 00       	movl	$32, %esi
ffff80000010d2ef: ff d3                	callq	*%rbx
ffff80000010d2f1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d2f6: be 20 00 00 00       	movl	$32, %esi
ffff80000010d2fb: ff d3                	callq	*%rbx
ffff80000010d2fd: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d301: 5b                   	popq	%rbx
ffff80000010d302: 5d                   	popq	%rbp
ffff80000010d303: c3                   	retq
ffff80000010d304: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d30e: 66 90                	nop

ffff80000010d310 <pic_init>:
ffff80000010d310: 55                   	pushq	%rbp
ffff80000010d311: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d314: 48 b8 f0 d1 10 00 00 80 ff ff	movabsq	$-140737487253008, %rax # imm = 0xFFFF80000010D1F0
ffff80000010d31e: ff d0                	callq	*%rax
ffff80000010d320: 48 b8 70 d0 10 00 00 80 ff ff	movabsq	$-140737487253392, %rax # imm = 0xFFFF80000010D070
ffff80000010d32a: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d32f: be 28 00 00 00       	movl	$40, %esi
ffff80000010d334: ff d0                	callq	*%rax
ffff80000010d336: 48 b8 b0 d1 10 00 00 80 ff ff	movabsq	$-140737487253072, %rax # imm = 0xFFFF80000010D1B0
ffff80000010d340: ff d0                	callq	*%rax
ffff80000010d342: 48 b8 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rax # imm = 0xFFFF80000010D220
ffff80000010d34c: bf 02 00 00 00       	movl	$2, %edi
ffff80000010d351: ff d0                	callq	*%rax
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
ffff80000010d360: 55                   	pushq	%rbp
ffff80000010d361: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d364: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d368: 48 89 f1             	movq	%rsi, %rcx
ffff80000010d36b: 48 89 fa             	movq	%rdi, %rdx
ffff80000010d36e: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
ffff80000010d375: 48 bf a0 d3 10 00 00 80 ff ff	movabsq	$-140737487252576, %rdi # imm = 0xFFFF80000010D3A0
ffff80000010d37f: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff80000010d389: 48 8d 75 fc          	leaq	-4(%rbp), %rsi
ffff80000010d38d: ff d0                	callq	*%rax
ffff80000010d38f: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d392: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d396: 5d                   	popq	%rbp
ffff80000010d397: c3                   	retq
ffff80000010d398: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d3a0 <putch>:
ffff80000010d3a0: 55                   	pushq	%rbp
ffff80000010d3a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d3a4: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010d3ae: ff d0                	callq	*%rax
ffff80000010d3b0: 5d                   	popq	%rbp
ffff80000010d3b1: c3                   	retq
ffff80000010d3b2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d3bc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d3c0 <cprintf>:
ffff80000010d3c0: 55                   	pushq	%rbp
ffff80000010d3c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d3c4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010d3c8: 48 89 75 b8          	movq	%rsi, -72(%rbp)
ffff80000010d3cc: 48 89 55 c0          	movq	%rdx, -64(%rbp)
ffff80000010d3d0: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010d3d4: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010d3d8: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010d3dc: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff80000010d3e0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010d3e4: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010d3e8: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010d3ec: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax # imm = 0x3000000008
ffff80000010d3f6: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010d3fa: 48 b8 60 d3 10 00 00 80 ff ff	movabsq	$-140737487252640, %rax # imm = 0xFFFF80000010D360
ffff80000010d404: 48 8d 75 e0          	leaq	-32(%rbp), %rsi
ffff80000010d408: ff d0                	callq	*%rax
ffff80000010d40a: 48 83 c4 50          	addq	$80, %rsp
ffff80000010d40e: 5d                   	popq	%rbp
ffff80000010d40f: c3                   	retq

ffff80000010d410 <boot_alloc>:
ffff80000010d410: 55                   	pushq	%rbp
ffff80000010d411: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d414: 41 57                	pushq	%r15
ffff80000010d416: 41 56                	pushq	%r14
ffff80000010d418: 41 55                	pushq	%r13
ffff80000010d41a: 41 54                	pushq	%r12
ffff80000010d41c: 53                   	pushq	%rbx
ffff80000010d41d: 50                   	pushq	%rax
ffff80000010d41e: 41 89 fe             	movl	%edi, %r14d
ffff80000010d421: 49 bc 30 42 11 00 00 80 ff ff	movabsq	$-140737487224272, %r12 # imm = 0xFFFF800000114230
ffff80000010d42b: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010d430: 75 1a                	jne	0xffff80000010d44c <boot_alloc+0x3c>
ffff80000010d432: 48 b8 f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rax # imm = 0xFFFF8000001146F0
ffff80000010d43c: 48 05 ff 0f 00 00    	addq	$4095, %rax             # imm = 0xFFF
ffff80000010d442: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
ffff80000010d448: 49 89 04 24          	movq	%rax, (%r12)
ffff80000010d44c: 49 8b 34 24          	movq	(%r12), %rsi
ffff80000010d450: 48 bf 05 0b 11 00 00 80 ff ff	movabsq	$-140737487238395, %rdi # imm = 0xFFFF800000110B05
ffff80000010d45a: 49 bd c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r13 # imm = 0xFFFF80000010D3C0
ffff80000010d464: 31 c0                	xorl	%eax, %eax
ffff80000010d466: 41 ff d5             	callq	*%r13
ffff80000010d469: 45 85 f6             	testl	%r14d, %r14d
ffff80000010d46c: 74 63                	je	0xffff80000010d4d1 <boot_alloc+0xc1>
ffff80000010d46e: 41 c1 ee 0c          	shrl	$12, %r14d
ffff80000010d472: 45 8d 7e 01          	leal	1(%r14), %r15d
ffff80000010d476: 48 bf ca 0b 11 00 00 80 ff ff	movabsq	$-140737487238198, %rdi # imm = 0xFFFF800000110BCA
ffff80000010d480: 44 89 fe             	movl	%r15d, %esi
ffff80000010d483: 31 c0                	xorl	%eax, %eax
ffff80000010d485: 41 ff d5             	callq	*%r13
ffff80000010d488: 48 b8 f0 46 11 00 00 80 ff ff	movabsq	$-140737487223056, %rax # imm = 0xFFFF8000001146F0
ffff80000010d492: 05 ff 0f 00 00       	addl	$4095, %eax             # imm = 0xFFF
ffff80000010d497: 89 c3                	movl	%eax, %ebx
ffff80000010d499: 81 e3 ff 0f 00 00    	andl	$4095, %ebx             # imm = 0xFFF
ffff80000010d49f: 29 c3                	subl	%eax, %ebx
ffff80000010d4a1: 81 c3 00 00 80 00    	addl	$8388608, %ebx          # imm = 0x800000
ffff80000010d4a7: c1 eb 0c             	shrl	$12, %ebx
ffff80000010d4aa: 48 bf 57 0a 11 00 00 80 ff ff	movabsq	$-140737487238569, %rdi # imm = 0xFFFF800000110A57
ffff80000010d4b4: 89 de                	movl	%ebx, %esi
ffff80000010d4b6: 31 c0                	xorl	%eax, %eax
ffff80000010d4b8: 41 ff d5             	callq	*%r13
ffff80000010d4bb: 41 39 de             	cmpl	%ebx, %r14d
ffff80000010d4be: 73 24                	jae	0xffff80000010d4e4 <boot_alloc+0xd4>
ffff80000010d4c0: 49 8b 04 24          	movq	(%r12), %rax
ffff80000010d4c4: 41 c1 e7 0c          	shll	$12, %r15d
ffff80000010d4c8: 49 01 c7             	addq	%rax, %r15
ffff80000010d4cb: 4d 89 3c 24          	movq	%r15, (%r12)
ffff80000010d4cf: eb 04                	jmp	0xffff80000010d4d5 <boot_alloc+0xc5>
ffff80000010d4d1: 49 8b 04 24          	movq	(%r12), %rax
ffff80000010d4d5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d4d9: 5b                   	popq	%rbx
ffff80000010d4da: 41 5c                	popq	%r12
ffff80000010d4dc: 41 5d                	popq	%r13
ffff80000010d4de: 41 5e                	popq	%r14
ffff80000010d4e0: 41 5f                	popq	%r15
ffff80000010d4e2: 5d                   	popq	%rbp
ffff80000010d4e3: c3                   	retq
ffff80000010d4e4: 48 bf 61 10 11 00 00 80 ff ff	movabsq	$-140737487237023, %rdi # imm = 0xFFFF800000111061
ffff80000010d4ee: 48 ba 80 0f 11 00 00 80 ff ff	movabsq	$-140737487237248, %rdx # imm = 0xFFFF800000110F80
ffff80000010d4f8: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d502: be 3f 00 00 00       	movl	$63, %esi
ffff80000010d507: 31 c0                	xorl	%eax, %eax
ffff80000010d509: ff d1                	callq	*%rcx
ffff80000010d50b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d510 <align_boot_info>:
ffff80000010d510: 55                   	pushq	%rbp
ffff80000010d511: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d514: 8b 4f 04             	movl	4(%rdi), %ecx
ffff80000010d517: 48 85 c9             	testq	%rcx, %rcx
ffff80000010d51a: 74 6f                	je	0xffff80000010d58b <align_boot_info+0x7b>
ffff80000010d51c: 8b 07                	movl	(%rdi), %eax
ffff80000010d51e: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d522: 48 8d 0c 49          	leaq	(%rcx,%rcx,2), %rcx
ffff80000010d526: 31 d2                	xorl	%edx, %edx
ffff80000010d528: eb 41                	jmp	0xffff80000010d56b <align_boot_info+0x5b>
ffff80000010d52a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
ffff80000010d530: 48 89 f7             	movq	%rsi, %rdi
ffff80000010d533: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff80000010d539: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
ffff80000010d540: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
ffff80000010d545: 48 01 fe             	addq	%rdi, %rsi
ffff80000010d548: 48 81 c6 ff 0f 00 00 	addq	$4095, %rsi             # imm = 0xFFF
ffff80000010d54f: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
ffff80000010d556: 48 89 3c 10          	movq	%rdi, (%rax,%rdx)
ffff80000010d55a: 48 29 fe             	subq	%rdi, %rsi
ffff80000010d55d: 48 89 74 10 08       	movq	%rsi, 8(%rax,%rdx)
ffff80000010d562: 48 83 c2 18          	addq	$24, %rdx
ffff80000010d566: 48 39 d1             	cmpq	%rdx, %rcx
ffff80000010d569: 74 20                	je	0xffff80000010d58b <align_boot_info+0x7b>
ffff80000010d56b: 83 7c 10 10 01       	cmpl	$1, 16(%rax,%rdx)
ffff80000010d570: 48 8b 34 10          	movq	(%rax,%rdx), %rsi
ffff80000010d574: 75 ba                	jne	0xffff80000010d530 <align_boot_info+0x20>
ffff80000010d576: 48 8d be ff 0f 00 00 	leaq	4095(%rsi), %rdi
ffff80000010d57d: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
ffff80000010d584: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
ffff80000010d589: eb c4                	jmp	0xffff80000010d54f <align_boot_info+0x3f>
ffff80000010d58b: 5d                   	popq	%rbp
ffff80000010d58c: c3                   	retq
ffff80000010d58d: 0f 1f 00             	nopl	(%rax)

ffff80000010d590 <show_boot_mmap>:
ffff80000010d590: 55                   	pushq	%rbp
ffff80000010d591: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d594: 41 57                	pushq	%r15
ffff80000010d596: 41 56                	pushq	%r14
ffff80000010d598: 41 55                	pushq	%r13
ffff80000010d59a: 41 54                	pushq	%r12
ffff80000010d59c: 53                   	pushq	%rbx
ffff80000010d59d: 50                   	pushq	%rax
ffff80000010d59e: 49 89 fe             	movq	%rdi, %r14
ffff80000010d5a1: 8b 3f                	movl	(%rdi), %edi
ffff80000010d5a3: 48 b8 50 d6 10 00 00 80 ff ff	movabsq	$-140737487251888, %rax # imm = 0xFFFF80000010D650
ffff80000010d5ad: ff d0                	callq	*%rax
ffff80000010d5af: 49 89 c5             	movq	%rax, %r13
ffff80000010d5b2: 48 bf 93 0f 11 00 00 80 ff ff	movabsq	$-140737487237229, %rdi # imm = 0xFFFF800000110F93
ffff80000010d5bc: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d5c6: 31 c0                	xorl	%eax, %eax
ffff80000010d5c8: ff d1                	callq	*%rcx
ffff80000010d5ca: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d5cf: 74 6a                	je	0xffff80000010d63b <show_boot_mmap+0xab>
ffff80000010d5d1: 49 83 c5 10          	addq	$16, %r13
ffff80000010d5d5: 49 bf a5 0f 11 00 00 80 ff ff	movabsq	$-140737487237211, %r15 # imm = 0xFFFF800000110FA5
ffff80000010d5df: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010d5e2: 48 bb c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rbx # imm = 0xFFFF80000010D3C0
ffff80000010d5ec: eb 25                	jmp	0xffff80000010d613 <show_boot_mmap+0x83>
ffff80000010d5ee: 66 90                	nop
ffff80000010d5f0: 49 8b 75 f0          	movq	-16(%r13), %rsi
ffff80000010d5f4: 49 8b 55 f8          	movq	-8(%r13), %rdx
ffff80000010d5f8: 48 01 f2             	addq	%rsi, %rdx
ffff80000010d5fb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010d5fe: 31 c0                	xorl	%eax, %eax
ffff80000010d600: ff d3                	callq	*%rbx
ffff80000010d602: 49 83 c4 01          	addq	$1, %r12
ffff80000010d606: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010d60a: 49 83 c5 18          	addq	$24, %r13
ffff80000010d60e: 49 39 c4             	cmpq	%rax, %r12
ffff80000010d611: 73 28                	jae	0xffff80000010d63b <show_boot_mmap+0xab>
ffff80000010d613: 41 8b 45 00          	movl	(%r13), %eax
ffff80000010d617: 83 c0 ff             	addl	$-1, %eax
ffff80000010d61a: 48 b9 14 0b 11 00 00 80 ff ff	movabsq	$-140737487238380, %rcx # imm = 0xFFFF800000110B14
ffff80000010d624: 83 f8 04             	cmpl	$4, %eax
ffff80000010d627: 77 c7                	ja	0xffff80000010d5f0 <show_boot_mmap+0x60>
ffff80000010d629: 48 98                	cltq
ffff80000010d62b: 48 b9 c8 02 11 00 00 80 ff ff	movabsq	$-140737487240504, %rcx # imm = 0xFFFF8000001102C8
ffff80000010d635: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff80000010d639: eb b5                	jmp	0xffff80000010d5f0 <show_boot_mmap+0x60>
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
ffff80000010d650: 55                   	pushq	%rbp
ffff80000010d651: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d654: 48 89 f8             	movq	%rdi, %rax
ffff80000010d657: 48 89 f9             	movq	%rdi, %rcx
ffff80000010d65a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010d65e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010d668: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010d66b: 73 0f                	jae	0xffff80000010d67c <_kaddr+0x2c>
ffff80000010d66d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010d677: 48 01 c8             	addq	%rcx, %rax
ffff80000010d67a: 5d                   	popq	%rbp
ffff80000010d67b: c3                   	retq
ffff80000010d67c: 48 bf 61 10 11 00 00 80 ff ff	movabsq	$-140737487237023, %rdi # imm = 0xFFFF800000111061
ffff80000010d686: 48 ba 2e 0d 11 00 00 80 ff ff	movabsq	$-140737487237842, %rdx # imm = 0xFFFF800000110D2E
ffff80000010d690: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010d69a: be 70 00 00 00       	movl	$112, %esi
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
ffff80000010d6b0: 55                   	pushq	%rbp
ffff80000010d6b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d6b4: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010d6b8: 76 04                	jbe	0xffff80000010d6be <count_free_pages+0xe>
ffff80000010d6ba: 31 c0                	xorl	%eax, %eax
ffff80000010d6bc: 5d                   	popq	%rbp
ffff80000010d6bd: c3                   	retq
ffff80000010d6be: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010d6c2: 48 b9 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %rcx # imm = 0xFFFF800000114240
ffff80000010d6cc: 48 01 f9             	addq	%rdi, %rcx
ffff80000010d6cf: 48 c7 c0 ff ff ff ff 	movq	$-1, %rax
ffff80000010d6d6: 48 89 ca             	movq	%rcx, %rdx
ffff80000010d6d9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010d6e0: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010d6e3: 48 83 c0 01          	addq	$1, %rax
ffff80000010d6e7: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010d6ea: 75 f4                	jne	0xffff80000010d6e0 <count_free_pages+0x30>
ffff80000010d6ec: 5d                   	popq	%rbp
ffff80000010d6ed: c3                   	retq
ffff80000010d6ee: 66 90                	nop

ffff80000010d6f0 <show_buddy_info>:
ffff80000010d6f0: 55                   	pushq	%rbp
ffff80000010d6f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d6f4: 41 57                	pushq	%r15
ffff80000010d6f6: 41 56                	pushq	%r14
ffff80000010d6f8: 41 55                	pushq	%r13
ffff80000010d6fa: 41 54                	pushq	%r12
ffff80000010d6fc: 53                   	pushq	%rbx
ffff80000010d6fd: 50                   	pushq	%rax
ffff80000010d6fe: 48 bf fb 09 11 00 00 80 ff ff	movabsq	$-140737487238661, %rdi # imm = 0xFFFF8000001109FB
ffff80000010d708: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d712: 31 c0                	xorl	%eax, %eax
ffff80000010d714: ff d1                	callq	*%rcx
ffff80000010d716: 49 bd b0 d6 10 00 00 80 ff ff	movabsq	$-140737487251792, %r13 # imm = 0xFFFF80000010D6B0
ffff80000010d720: 49 be 31 0e 11 00 00 80 ff ff	movabsq	$-140737487237583, %r14 # imm = 0xFFFF800000110E31
ffff80000010d72a: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010d72d: 31 db                	xorl	%ebx, %ebx
ffff80000010d72f: 90                   	nop
ffff80000010d730: 48 89 df             	movq	%rbx, %rdi
ffff80000010d733: 41 ff d5             	callq	*%r13
ffff80000010d736: 49 89 c4             	movq	%rax, %r12
ffff80000010d739: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d73c: 48 89 de             	movq	%rbx, %rsi
ffff80000010d73f: 48 89 c2             	movq	%rax, %rdx
ffff80000010d742: 31 c0                	xorl	%eax, %eax
ffff80000010d744: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d74e: ff d1                	callq	*%rcx
ffff80000010d750: 8d 4b 0c             	leal	12(%rbx), %ecx
ffff80000010d753: b8 01 00 00 00       	movl	$1, %eax
ffff80000010d758: d3 e0                	shll	%cl, %eax
ffff80000010d75a: 49 0f af c4          	imulq	%r12, %rax
ffff80000010d75e: 49 01 c7             	addq	%rax, %r15
ffff80000010d761: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d765: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d769: 75 c5                	jne	0xffff80000010d730 <show_buddy_info+0x40>
ffff80000010d76b: 49 c1 ef 0a          	shrq	$10, %r15
ffff80000010d76f: 48 bf da 08 11 00 00 80 ff ff	movabsq	$-140737487238950, %rdi # imm = 0xFFFF8000001108DA
ffff80000010d779: 4c 89 fe             	movq	%r15, %rsi
ffff80000010d77c: 31 c0                	xorl	%eax, %eax
ffff80000010d77e: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010d788: ff d1                	callq	*%rcx
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
ffff80000010d7c0: 48 89 df             	movq	%rbx, %rdi
ffff80000010d7c3: 41 ff d7             	callq	*%r15
ffff80000010d7c6: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d7cb: 89 d9                	movl	%ebx, %ecx
ffff80000010d7cd: d3 e2                	shll	%cl, %edx
ffff80000010d7cf: 48 0f af d0          	imulq	%rax, %rdx
ffff80000010d7d3: 49 01 d6             	addq	%rdx, %r14
ffff80000010d7d6: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d7da: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d7de: 75 e0                	jne	0xffff80000010d7c0 <count_total_free_pages+0x20>
ffff80000010d7e0: 4c 89 f0             	movq	%r14, %rax
ffff80000010d7e3: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d7e7: 5b                   	popq	%rbx
ffff80000010d7e8: 41 5e                	popq	%r14
ffff80000010d7ea: 41 5f                	popq	%r15
ffff80000010d7ec: 5d                   	popq	%rbp
ffff80000010d7ed: c3                   	retq
ffff80000010d7ee: 66 90                	nop

ffff80000010d7f0 <buddy_split>:
ffff80000010d7f0: 55                   	pushq	%rbp
ffff80000010d7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d7f4: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010d7f8: 83 e0 7f             	andl	$127, %eax
ffff80000010d7fb: 48 39 f0             	cmpq	%rsi, %rax
ffff80000010d7fe: 75 10                	jne	0xffff80000010d810 <buddy_split+0x20>
ffff80000010d800: 48 89 f8             	movq	%rdi, %rax
ffff80000010d803: 5d                   	popq	%rbp
ffff80000010d804: c3                   	retq
ffff80000010d805: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d80f: 90                   	nop
ffff80000010d810: eb fe                	jmp	0xffff80000010d810 <buddy_split+0x20>
ffff80000010d812: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d81c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d820 <buddy_merge>:
ffff80000010d820: 55                   	pushq	%rbp
ffff80000010d821: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d824: 31 c0                	xorl	%eax, %eax
ffff80000010d826: 5d                   	popq	%rbp
ffff80000010d827: c3                   	retq
ffff80000010d828: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d830 <buddy_find>:
ffff80000010d830: 55                   	pushq	%rbp
ffff80000010d831: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d834: 53                   	pushq	%rbx
ffff80000010d835: 50                   	pushq	%rax
ffff80000010d836: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010d83a: 77 3b                	ja	0xffff80000010d877 <buddy_find+0x47>
ffff80000010d83c: 48 89 fe             	movq	%rdi, %rsi
ffff80000010d83f: 48 89 f8             	movq	%rdi, %rax
ffff80000010d842: 48 c1 e0 04          	shlq	$4, %rax
ffff80000010d846: 48 b9 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %rcx # imm = 0xFFFF800000114240
ffff80000010d850: 48 01 c1             	addq	%rax, %rcx
ffff80000010d853: ba 0a 00 00 00       	movl	$10, %edx
ffff80000010d858: 31 c0                	xorl	%eax, %eax
ffff80000010d85a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
ffff80000010d860: 48 8b 19             	movq	(%rcx), %rbx
ffff80000010d863: 48 85 db             	testq	%rbx, %rbx
ffff80000010d866: 75 13                	jne	0xffff80000010d87b <buddy_find+0x4b>
ffff80000010d868: 48 83 c2 ff          	addq	$-1, %rdx
ffff80000010d86c: 48 83 c1 10          	addq	$16, %rcx
ffff80000010d870: 48 39 d6             	cmpq	%rdx, %rsi
ffff80000010d873: 75 eb                	jne	0xffff80000010d860 <buddy_find+0x30>
ffff80000010d875: eb 16                	jmp	0xffff80000010d88d <buddy_find+0x5d>
ffff80000010d877: 31 c0                	xorl	%eax, %eax
ffff80000010d879: eb 12                	jmp	0xffff80000010d88d <buddy_find+0x5d>
ffff80000010d87b: 48 b8 f0 d7 10 00 00 80 ff ff	movabsq	$-140737487251472, %rax # imm = 0xFFFF80000010D7F0
ffff80000010d885: 48 89 df             	movq	%rbx, %rdi
ffff80000010d888: ff d0                	callq	*%rax
ffff80000010d88a: 48 89 d8             	movq	%rbx, %rax
ffff80000010d88d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d891: 5b                   	popq	%rbx
ffff80000010d892: 5d                   	popq	%rbp
ffff80000010d893: c3                   	retq
ffff80000010d894: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d89e: 66 90                	nop

ffff80000010d8a0 <page_alloc>:
ffff80000010d8a0: 55                   	pushq	%rbp
ffff80000010d8a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d8a4: 31 c0                	xorl	%eax, %eax
ffff80000010d8a6: 5d                   	popq	%rbp
ffff80000010d8a7: c3                   	retq
ffff80000010d8a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d8b0 <page_free>:
ffff80000010d8b0: 55                   	pushq	%rbp
ffff80000010d8b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d8b4: 5d                   	popq	%rbp
ffff80000010d8b5: c3                   	retq
ffff80000010d8b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010d8c0 <page_decref>:
ffff80000010d8c0: 55                   	pushq	%rbp
ffff80000010d8c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d8c4: 66 83 47 10 ff       	addw	$-1, 16(%rdi)
ffff80000010d8c9: 5d                   	popq	%rbp
ffff80000010d8ca: c3                   	retq
ffff80000010d8cb: cc                   	int3
ffff80000010d8cc: cc                   	int3
ffff80000010d8cd: cc                   	int3
ffff80000010d8ce: cc                   	int3
ffff80000010d8cf: cc                   	int3

ffff80000010d8d0 <mem_init>:
ffff80000010d8d0: 55                   	pushq	%rbp
ffff80000010d8d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d8d4: 41 57                	pushq	%r15
ffff80000010d8d6: 41 56                	pushq	%r14
ffff80000010d8d8: 41 54                	pushq	%r12
ffff80000010d8da: 53                   	pushq	%rbx
ffff80000010d8db: 49 89 fe             	movq	%rdi, %r14
ffff80000010d8de: 48 b8 10 d5 10 00 00 80 ff ff	movabsq	$-140737487252208, %rax # imm = 0xFFFF80000010D510
ffff80000010d8e8: ff d0                	callq	*%rax
ffff80000010d8ea: 31 db                	xorl	%ebx, %ebx
ffff80000010d8ec: 49 bf 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r15 # imm = 0xFFFF800000114240
ffff80000010d8f6: 49 bc f0 e6 10 00 00 80 ff ff	movabsq	$-140737487247632, %r12 # imm = 0xFFFF80000010E6F0
ffff80000010d900: 4a 8d 3c 3b          	leaq	(%rbx,%r15), %rdi
ffff80000010d904: 41 ff d4             	callq	*%r12
ffff80000010d907: 48 83 c3 10          	addq	$16, %rbx
ffff80000010d90b: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010d912: 75 ec                	jne	0xffff80000010d900 <mem_init+0x30>
ffff80000010d914: 41 8b 4e 04          	movl	4(%r14), %ecx
ffff80000010d918: 48 85 c9             	testq	%rcx, %rcx
ffff80000010d91b: 0f 85 b8 00 00 00    	jne	0xffff80000010d9d9 <mem_init+0x109>
ffff80000010d921: 31 c9                	xorl	%ecx, %ecx
ffff80000010d923: 48 81 f9 00 00 80 00 	cmpq	$8388608, %rcx          # imm = 0x800000
ffff80000010d92a: be 00 00 80 00       	movl	$8388608, %esi          # imm = 0x800000
ffff80000010d92f: 48 0f 42 f1          	cmovbq	%rcx, %rsi
ffff80000010d933: 48 c1 ee 0c          	shrq	$12, %rsi
ffff80000010d937: 49 bf e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %r15 # imm = 0xFFFF8000001142E0
ffff80000010d941: 49 89 37             	movq	%rsi, (%r15)
ffff80000010d944: 48 bf 2a 0c 11 00 00 80 ff ff	movabsq	$-140737487238102, %rdi # imm = 0xFFFF800000110C2A
ffff80000010d94e: 48 bb c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rbx # imm = 0xFFFF80000010D3C0
ffff80000010d958: 31 c0                	xorl	%eax, %eax
ffff80000010d95a: ff d3                	callq	*%rbx
ffff80000010d95c: 49 8b 37             	movq	(%r15), %rsi
ffff80000010d95f: 48 c1 e6 05          	shlq	$5, %rsi
ffff80000010d963: 48 bf e5 0f 11 00 00 80 ff ff	movabsq	$-140737487237147, %rdi # imm = 0xFFFF800000110FE5
ffff80000010d96d: 31 c0                	xorl	%eax, %eax
ffff80000010d96f: ff d3                	callq	*%rbx
ffff80000010d971: 48 bf cc 09 11 00 00 80 ff ff	movabsq	$-140737487238708, %rdi # imm = 0xFFFF8000001109CC
ffff80000010d97b: be 20 00 00 00       	movl	$32, %esi
ffff80000010d980: 31 c0                	xorl	%eax, %eax
ffff80000010d982: ff d3                	callq	*%rbx
ffff80000010d984: 41 8b 3f             	movl	(%r15), %edi
ffff80000010d987: c1 e7 05             	shll	$5, %edi
ffff80000010d98a: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010d994: ff d0                	callq	*%rax
ffff80000010d996: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010d9a0: 48 89 01             	movq	%rax, (%rcx)
ffff80000010d9a3: 48 b8 10 da 10 00 00 80 ff ff	movabsq	$-140737487250928, %rax # imm = 0xFFFF80000010DA10
ffff80000010d9ad: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d9b0: ff d0                	callq	*%rax
ffff80000010d9b2: 48 bf 51 0d 11 00 00 80 ff ff	movabsq	$-140737487237807, %rdi # imm = 0xFFFF800000110D51
ffff80000010d9bc: 48 ba 47 0e 11 00 00 80 ff ff	movabsq	$-140737487237561, %rdx # imm = 0xFFFF800000110E47
ffff80000010d9c6: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010d9d0: be 4d 00 00 00       	movl	$77, %esi
ffff80000010d9d5: 31 c0                	xorl	%eax, %eax
ffff80000010d9d7: ff d1                	callq	*%rcx
ffff80000010d9d9: 41 8b 06             	movl	(%r14), %eax
ffff80000010d9dc: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d9e0: 48 8d 14 49          	leaq	(%rcx,%rcx,2), %rdx
ffff80000010d9e4: 31 f6                	xorl	%esi, %esi
ffff80000010d9e6: 31 c9                	xorl	%ecx, %ecx
ffff80000010d9e8: eb 13                	jmp	0xffff80000010d9fd <mem_init+0x12d>
ffff80000010d9ea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
ffff80000010d9f0: 48 83 c6 18          	addq	$24, %rsi
ffff80000010d9f4: 48 39 f2             	cmpq	%rsi, %rdx
ffff80000010d9f7: 0f 84 26 ff ff ff    	je	0xffff80000010d923 <mem_init+0x53>
ffff80000010d9fd: 83 7c 30 10 01       	cmpl	$1, 16(%rax,%rsi)
ffff80000010da02: 75 ec                	jne	0xffff80000010d9f0 <mem_init+0x120>
ffff80000010da04: 48 8b 4c 30 08       	movq	8(%rax,%rsi), %rcx
ffff80000010da09: 48 03 0c 30          	addq	(%rax,%rsi), %rcx
ffff80000010da0d: eb e1                	jmp	0xffff80000010d9f0 <mem_init+0x120>
ffff80000010da0f: 90                   	nop

ffff80000010da10 <page_init>:
ffff80000010da10: 55                   	pushq	%rbp
ffff80000010da11: 48 89 e5             	movq	%rsp, %rbp
ffff80000010da14: 41 57                	pushq	%r15
ffff80000010da16: 41 56                	pushq	%r14
ffff80000010da18: 41 55                	pushq	%r13
ffff80000010da1a: 41 54                	pushq	%r12
ffff80000010da1c: 53                   	pushq	%rbx
ffff80000010da1d: 50                   	pushq	%rax
ffff80000010da1e: 48 89 7d d0          	movq	%rdi, -48(%rbp)
ffff80000010da22: 49 bc e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %r12 # imm = 0xFFFF8000001142E0
ffff80000010da2c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010da31: 74 4d                	je	0xffff80000010da80 <page_init+0x70>
ffff80000010da33: 31 db                	xorl	%ebx, %ebx
ffff80000010da35: 49 bd f0 e6 10 00 00 80 ff ff	movabsq	$-140737487247632, %r13 # imm = 0xFFFF80000010E6F0
ffff80000010da3f: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010da42: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010da4c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010da50: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010da5a: 4c 8b 39             	movq	(%rcx), %r15
ffff80000010da5d: 49 8d 3c 1f          	leaq	(%r15,%rbx), %rdi
ffff80000010da61: 41 ff d5             	callq	*%r13
ffff80000010da64: 66 41 c7 44 1f 10 00 00      	movw	$0, 16(%r15,%rbx)
ffff80000010da6c: 41 c6 44 1f 12 00    	movb	$0, 18(%r15,%rbx)
ffff80000010da72: 49 83 c6 01          	addq	$1, %r14
ffff80000010da76: 48 83 c3 20          	addq	$32, %rbx
ffff80000010da7a: 4d 3b 34 24          	cmpq	(%r12), %r14
ffff80000010da7e: 72 d0                	jb	0xffff80000010da50 <page_init+0x40>
ffff80000010da80: 4c 8b 75 d0          	movq	-48(%rbp), %r14
ffff80000010da84: 41 8b 3e             	movl	(%r14), %edi
ffff80000010da87: 48 b8 40 db 10 00 00 80 ff ff	movabsq	$-140737487250624, %rax # imm = 0xFFFF80000010DB40
ffff80000010da91: ff d0                	callq	*%rax
ffff80000010da93: 48 89 c3             	movq	%rax, %rbx
ffff80000010da96: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010daa0: 31 ff                	xorl	%edi, %edi
ffff80000010daa2: ff d0                	callq	*%rax
ffff80000010daa4: 48 b9 a0 db 10 00 00 80 ff ff	movabsq	$-140737487250528, %rcx # imm = 0xFFFF80000010DBA0
ffff80000010daae: 48 89 c7             	movq	%rax, %rdi
ffff80000010dab1: ff d1                	callq	*%rcx
ffff80000010dab3: 49 8b 76 08          	movq	8(%r14), %rsi
ffff80000010dab7: 48 bf 37 0c 11 00 00 80 ff ff	movabsq	$-140737487238089, %rdi # imm = 0xFFFF800000110C37
ffff80000010dac1: 49 bd c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %r13 # imm = 0xFFFF80000010D3C0
ffff80000010dacb: 31 c0                	xorl	%eax, %eax
ffff80000010dacd: 41 ff d5             	callq	*%r13
ffff80000010dad0: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010dad5: 74 55                	je	0xffff80000010db2c <page_init+0x11c>
ffff80000010dad7: 48 83 c3 10          	addq	$16, %rbx
ffff80000010dadb: 49 bc 3e 08 11 00 00 80 ff ff	movabsq	$-140737487239106, %r12 # imm = 0xFFFF80000011083E
ffff80000010dae5: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010dae8: eb 17                	jmp	0xffff80000010db01 <page_init+0xf1>
ffff80000010daea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
ffff80000010daf0: 49 83 c7 01          	addq	$1, %r15
ffff80000010daf4: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010daf8: 48 83 c3 18          	addq	$24, %rbx
ffff80000010dafc: 49 39 c7             	cmpq	%rax, %r15
ffff80000010daff: 73 2b                	jae	0xffff80000010db2c <page_init+0x11c>
ffff80000010db01: 83 3b 01             	cmpl	$1, (%rbx)
ffff80000010db04: 75 ea                	jne	0xffff80000010daf0 <page_init+0xe0>
ffff80000010db06: 48 8b 73 f0          	movq	-16(%rbx), %rsi
ffff80000010db0a: 48 8b 53 f8          	movq	-8(%rbx), %rdx
ffff80000010db0e: 48 01 f2             	addq	%rsi, %rdx
ffff80000010db11: 48 bf 47 0c 11 00 00 80 ff ff	movabsq	$-140737487238073, %rdi # imm = 0xFFFF800000110C47
ffff80000010db1b: 31 c0                	xorl	%eax, %eax
ffff80000010db1d: 41 ff d5             	callq	*%r13
ffff80000010db20: 8b 33                	movl	(%rbx), %esi
ffff80000010db22: 4c 89 e7             	movq	%r12, %rdi
ffff80000010db25: 31 c0                	xorl	%eax, %eax
ffff80000010db27: 41 ff d5             	callq	*%r13
ffff80000010db2a: eb c4                	jmp	0xffff80000010daf0 <page_init+0xe0>
ffff80000010db2c: 48 83 c4 08          	addq	$8, %rsp
ffff80000010db30: 5b                   	popq	%rbx
ffff80000010db31: 41 5c                	popq	%r12
ffff80000010db33: 41 5d                	popq	%r13
ffff80000010db35: 41 5e                	popq	%r14
ffff80000010db37: 41 5f                	popq	%r15
ffff80000010db39: 5d                   	popq	%rbp
ffff80000010db3a: c3                   	retq
ffff80000010db3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010db40 <_kaddr>:
ffff80000010db40: 55                   	pushq	%rbp
ffff80000010db41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010db44: 48 89 f8             	movq	%rdi, %rax
ffff80000010db47: 48 89 f9             	movq	%rdi, %rcx
ffff80000010db4a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010db4e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010db58: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010db5b: 73 0f                	jae	0xffff80000010db6c <_kaddr+0x2c>
ffff80000010db5d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010db67: 48 01 c8             	addq	%rcx, %rax
ffff80000010db6a: 5d                   	popq	%rbp
ffff80000010db6b: c3                   	retq
ffff80000010db6c: 48 bf 51 0d 11 00 00 80 ff ff	movabsq	$-140737487237807, %rdi # imm = 0xFFFF800000110D51
ffff80000010db76: 48 ba 2e 0d 11 00 00 80 ff ff	movabsq	$-140737487237842, %rdx # imm = 0xFFFF800000110D2E
ffff80000010db80: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010db8a: be 72 00 00 00       	movl	$114, %esi
ffff80000010db8f: 48 89 c1             	movq	%rax, %rcx
ffff80000010db92: 31 c0                	xorl	%eax, %eax
ffff80000010db94: 41 ff d0             	callq	*%r8
ffff80000010db97: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010dba0 <_paddr>:
ffff80000010dba0: 48 89 f8             	movq	%rdi, %rax
ffff80000010dba3: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000010dba7: 3d fe ff 01 00       	cmpl	$131070, %eax           # imm = 0x1FFFE
ffff80000010dbac: 76 01                	jbe	0xffff80000010dbaf <_paddr+0xf>
ffff80000010dbae: c3                   	retq
ffff80000010dbaf: 55                   	pushq	%rbp
ffff80000010dbb0: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dbb3: 48 89 f9             	movq	%rdi, %rcx
ffff80000010dbb6: 48 bf 51 0d 11 00 00 80 ff ff	movabsq	$-140737487237807, %rdi # imm = 0xFFFF800000110D51
ffff80000010dbc0: 48 ba 16 09 11 00 00 80 ff ff	movabsq	$-140737487238890, %rdx # imm = 0xFFFF800000110916
ffff80000010dbca: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010dbd4: be 73 00 00 00       	movl	$115, %esi
ffff80000010dbd9: 31 c0                	xorl	%eax, %eax
ffff80000010dbdb: 41 ff d0             	callq	*%r8
ffff80000010dbde: cc                   	int3
ffff80000010dbdf: cc                   	int3

ffff80000010dbe0 <lab1_check_free_list_avail>:
ffff80000010dbe0: 55                   	pushq	%rbp
ffff80000010dbe1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dbe4: 41 57                	pushq	%r15
ffff80000010dbe6: 41 56                	pushq	%r14
ffff80000010dbe8: 41 55                	pushq	%r13
ffff80000010dbea: 41 54                	pushq	%r12
ffff80000010dbec: 53                   	pushq	%rbx
ffff80000010dbed: 50                   	pushq	%rax
ffff80000010dbee: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010dbf1: 49 bc 00 dd 10 00 00 80 ff ff	movabsq	$-140737487250176, %r12 # imm = 0xFFFF80000010DD00
ffff80000010dbfb: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010dbfe: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010dc01: eb 1b                	jmp	0xffff80000010dc1e <lab1_check_free_list_avail+0x3e>
ffff80000010dc03: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc0d: 0f 1f 00             	nopl	(%rax)
ffff80000010dc10: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010dc14: 49 83 c7 01          	addq	$1, %r15
ffff80000010dc18: 49 83 ff 0a          	cmpq	$10, %r15
ffff80000010dc1c: 74 46                	je	0xffff80000010dc64 <lab1_check_free_list_avail+0x84>
ffff80000010dc1e: 4c 89 7d d0          	movq	%r15, -48(%rbp)
ffff80000010dc22: 49 c1 e7 04          	shlq	$4, %r15
ffff80000010dc26: 48 b8 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %rax # imm = 0xFFFF800000114240
ffff80000010dc30: 49 8b 1c 07          	movq	(%r15,%rax), %rbx
ffff80000010dc34: 49 01 c7             	addq	%rax, %r15
ffff80000010dc37: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010dc3a: 74 d4                	je	0xffff80000010dc10 <lab1_check_free_list_avail+0x30>
ffff80000010dc3c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010dc40: 48 89 df             	movq	%rbx, %rdi
ffff80000010dc43: 41 ff d4             	callq	*%r12
ffff80000010dc46: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010dc4c: 49 83 d5 00          	adcq	$0, %r13
ffff80000010dc50: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010dc56: 49 83 de ff          	sbbq	$-1, %r14
ffff80000010dc5a: 48 8b 1b             	movq	(%rbx), %rbx
ffff80000010dc5d: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010dc60: 75 de                	jne	0xffff80000010dc40 <lab1_check_free_list_avail+0x60>
ffff80000010dc62: eb ac                	jmp	0xffff80000010dc10 <lab1_check_free_list_avail+0x30>
ffff80000010dc64: 4d 85 ed             	testq	%r13, %r13
ffff80000010dc67: 74 2c                	je	0xffff80000010dc95 <lab1_check_free_list_avail+0xb5>
ffff80000010dc69: 4d 85 f6             	testq	%r14, %r14
ffff80000010dc6c: 74 58                	je	0xffff80000010dcc6 <lab1_check_free_list_avail+0xe6>
ffff80000010dc6e: 48 bf ea 08 11 00 00 80 ff ff	movabsq	$-140737487238934, %rdi # imm = 0xFFFF8000001108EA
ffff80000010dc78: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010dc82: 31 c0                	xorl	%eax, %eax
ffff80000010dc84: ff d1                	callq	*%rcx
ffff80000010dc86: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dc8a: 5b                   	popq	%rbx
ffff80000010dc8b: 41 5c                	popq	%r12
ffff80000010dc8d: 41 5d                	popq	%r13
ffff80000010dc8f: 41 5e                	popq	%r14
ffff80000010dc91: 41 5f                	popq	%r15
ffff80000010dc93: 5d                   	popq	%rbp
ffff80000010dc94: c3                   	retq
ffff80000010dc95: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dc9f: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010dca9: 48 b9 b3 0e 11 00 00 80 ff ff	movabsq	$-140737487237453, %rcx # imm = 0xFFFF800000110EB3
ffff80000010dcb3: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010dcbd: be 21 00 00 00       	movl	$33, %esi
ffff80000010dcc2: 31 c0                	xorl	%eax, %eax
ffff80000010dcc4: ff d3                	callq	*%rbx
ffff80000010dcc6: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dcd0: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010dcda: 48 b9 a4 0c 11 00 00 80 ff ff	movabsq	$-140737487237980, %rcx # imm = 0xFFFF800000110CA4
ffff80000010dce4: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010dcee: be 22 00 00 00       	movl	$34, %esi
ffff80000010dcf3: 31 c0                	xorl	%eax, %eax
ffff80000010dcf5: ff d3                	callq	*%rbx
ffff80000010dcf7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010dd00 <page2pa>:
ffff80000010dd00: 55                   	pushq	%rbp
ffff80000010dd01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dd04: 48 89 f8             	movq	%rdi, %rax
ffff80000010dd07: 48 b9 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rcx # imm = 0xFFFF8000001142E8
ffff80000010dd11: 48 2b 01             	subq	(%rcx), %rax
ffff80000010dd14: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010dd18: 5d                   	popq	%rbp
ffff80000010dd19: c3                   	retq
ffff80000010dd1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010dd20 <lab1_check_free_list_order>:
ffff80000010dd20: 55                   	pushq	%rbp
ffff80000010dd21: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dd24: 31 c9                	xorl	%ecx, %ecx
ffff80000010dd26: 49 b8 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r8 # imm = 0xFFFF800000114240
ffff80000010dd30: 45 31 c9             	xorl	%r9d, %r9d
ffff80000010dd33: eb 15                	jmp	0xffff80000010dd4a <lab1_check_free_list_order+0x2a>
ffff80000010dd35: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dd3f: 90                   	nop
ffff80000010dd40: 49 83 c1 01          	addq	$1, %r9
ffff80000010dd44: 49 83 f9 0a          	cmpq	$10, %r9
ffff80000010dd48: 74 32                	je	0xffff80000010dd7c <lab1_check_free_list_order+0x5c>
ffff80000010dd4a: 4c 89 ce             	movq	%r9, %rsi
ffff80000010dd4d: 48 c1 e6 04          	shlq	$4, %rsi
ffff80000010dd51: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
ffff80000010dd55: 4c 01 c6             	addq	%r8, %rsi
ffff80000010dd58: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010dd5b: 74 e3                	je	0xffff80000010dd40 <lab1_check_free_list_order+0x20>
ffff80000010dd5d: 0f 1f 00             	nopl	(%rax)
ffff80000010dd60: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010dd64: 83 e0 7f             	andl	$127, %eax
ffff80000010dd67: 31 d2                	xorl	%edx, %edx
ffff80000010dd69: 49 39 c1             	cmpq	%rax, %r9
ffff80000010dd6c: 0f 95 c2             	setne	%dl
ffff80000010dd6f: 48 01 d1             	addq	%rdx, %rcx
ffff80000010dd72: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010dd75: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010dd78: 75 e6                	jne	0xffff80000010dd60 <lab1_check_free_list_order+0x40>
ffff80000010dd7a: eb c4                	jmp	0xffff80000010dd40 <lab1_check_free_list_order+0x20>
ffff80000010dd7c: 48 85 c9             	testq	%rcx, %rcx
ffff80000010dd7f: 75 1a                	jne	0xffff80000010dd9b <lab1_check_free_list_order+0x7b>
ffff80000010dd81: 48 bf 71 0d 11 00 00 80 ff ff	movabsq	$-140737487237775, %rdi # imm = 0xFFFF800000110D71
ffff80000010dd8b: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010dd95: 31 c0                	xorl	%eax, %eax
ffff80000010dd97: ff d1                	callq	*%rcx
ffff80000010dd99: 5d                   	popq	%rbp
ffff80000010dd9a: c3                   	retq
ffff80000010dd9b: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dda5: 48 ba 23 0f 11 00 00 80 ff ff	movabsq	$-140737487237341, %rdx # imm = 0xFFFF800000110F23
ffff80000010ddaf: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010ddb9: be 3b 00 00 00       	movl	$59, %esi
ffff80000010ddbe: 31 c0                	xorl	%eax, %eax
ffff80000010ddc0: 41 ff d0             	callq	*%r8
ffff80000010ddc3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ddcd: 0f 1f 00             	nopl	(%rax)

ffff80000010ddd0 <lab1_check_memory_layout>:
ffff80000010ddd0: 55                   	pushq	%rbp
ffff80000010ddd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ddd4: 41 57                	pushq	%r15
ffff80000010ddd6: 41 56                	pushq	%r14
ffff80000010ddd8: 41 55                	pushq	%r13
ffff80000010ddda: 41 54                	pushq	%r12
ffff80000010dddc: 53                   	pushq	%rbx
ffff80000010dddd: 50                   	pushq	%rax
ffff80000010ddde: 49 89 fe             	movq	%rdi, %r14
ffff80000010dde1: 8b 3f                	movl	(%rdi), %edi
ffff80000010dde3: 48 b8 50 df 10 00 00 80 ff ff	movabsq	$-140737487249584, %rax # imm = 0xFFFF80000010DF50
ffff80000010dded: ff d0                	callq	*%rax
ffff80000010ddef: 49 89 c4             	movq	%rax, %r12
ffff80000010ddf2: 48 b8 10 d4 10 00 00 80 ff ff	movabsq	$-140737487252464, %rax # imm = 0xFFFF80000010D410
ffff80000010ddfc: 31 ff                	xorl	%edi, %edi
ffff80000010ddfe: ff d0                	callq	*%rax
ffff80000010de00: 48 b9 b0 df 10 00 00 80 ff ff	movabsq	$-140737487249488, %rcx # imm = 0xFFFF80000010DFB0
ffff80000010de0a: bf 49 00 00 00       	movl	$73, %edi
ffff80000010de0f: 48 89 c6             	movq	%rax, %rsi
ffff80000010de12: ff d1                	callq	*%rcx
ffff80000010de14: 48 89 45 d0          	movq	%rax, -48(%rbp)
ffff80000010de18: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010de1d: 0f 84 c6 00 00 00    	je	0xffff80000010dee9 <lab1_check_memory_layout+0x119>
ffff80000010de23: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010de26: eb 1d                	jmp	0xffff80000010de45 <lab1_check_memory_layout+0x75>
ffff80000010de28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
ffff80000010de30: 49 83 c7 01          	addq	$1, %r15
ffff80000010de34: 49 83 c4 18          	addq	$24, %r12
ffff80000010de38: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010de3c: 49 39 c7             	cmpq	%rax, %r15
ffff80000010de3f: 0f 83 a4 00 00 00    	jae	0xffff80000010dee9 <lab1_check_memory_layout+0x119>
ffff80000010de45: 49 8b 1c 24          	movq	(%r12), %rbx
ffff80000010de49: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010de4e: 48 01 d8             	addq	%rbx, %rax
ffff80000010de51: eb 28                	jmp	0xffff80000010de7b <lab1_check_memory_layout+0xab>
ffff80000010de53: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010de5d: 0f 1f 00             	nopl	(%rax)
ffff80000010de60: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
ffff80000010de65: 0f 88 a5 00 00 00    	js	0xffff80000010df10 <lab1_check_memory_layout+0x140>
ffff80000010de6b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff80000010de72: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010de77: 49 03 04 24          	addq	(%r12), %rax
ffff80000010de7b: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010de7e: 73 b0                	jae	0xffff80000010de30 <lab1_check_memory_layout+0x60>
ffff80000010de80: 48 81 fb ff ff 7f 00 	cmpq	$8388607, %rbx          # imm = 0x7FFFFF
ffff80000010de87: 77 e2                	ja	0xffff80000010de6b <lab1_check_memory_layout+0x9b>
ffff80000010de89: 48 89 df             	movq	%rbx, %rdi
ffff80000010de8c: 48 b8 00 e0 10 00 00 80 ff ff	movabsq	$-140737487249408, %rax # imm = 0xFFFF80000010E000
ffff80000010de96: ff d0                	callq	*%rax
ffff80000010de98: 49 89 c5             	movq	%rax, %r13
ffff80000010de9b: 48 85 db             	testq	%rbx, %rbx
ffff80000010de9e: 74 c0                	je	0xffff80000010de60 <lab1_check_memory_layout+0x90>
ffff80000010dea0: bf 54 00 00 00       	movl	$84, %edi
ffff80000010dea5: 4c 89 f6             	movq	%r14, %rsi
ffff80000010dea8: 48 b8 b0 df 10 00 00 80 ff ff	movabsq	$-140737487249488, %rax # imm = 0xFFFF80000010DFB0
ffff80000010deb2: ff d0                	callq	*%rax
ffff80000010deb4: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000010debe: 48 21 c8             	andq	%rcx, %rax
ffff80000010dec1: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010dec4: 74 9a                	je	0xffff80000010de60 <lab1_check_memory_layout+0x90>
ffff80000010dec6: 49 3b 5e 08          	cmpq	8(%r14), %rbx
ffff80000010deca: 74 94                	je	0xffff80000010de60 <lab1_check_memory_layout+0x90>
ffff80000010decc: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000010ded3: 72 06                	jb	0xffff80000010dedb <lab1_check_memory_layout+0x10b>
ffff80000010ded5: 48 3b 5d d0          	cmpq	-48(%rbp), %rbx
ffff80000010ded9: 72 85                	jb	0xffff80000010de60 <lab1_check_memory_layout+0x90>
ffff80000010dedb: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff80000010dee1: 0f 85 79 ff ff ff    	jne	0xffff80000010de60 <lab1_check_memory_layout+0x90>
ffff80000010dee7: eb 82                	jmp	0xffff80000010de6b <lab1_check_memory_layout+0x9b>
ffff80000010dee9: 48 bf 3a 09 11 00 00 80 ff ff	movabsq	$-140737487238854, %rdi # imm = 0xFFFF80000011093A
ffff80000010def3: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010defd: 31 c0                	xorl	%eax, %eax
ffff80000010deff: ff d1                	callq	*%rcx
ffff80000010df01: 48 83 c4 08          	addq	$8, %rsp
ffff80000010df05: 5b                   	popq	%rbx
ffff80000010df06: 41 5c                	popq	%r12
ffff80000010df08: 41 5d                	popq	%r13
ffff80000010df0a: 41 5e                	popq	%r14
ffff80000010df0c: 41 5f                	popq	%r15
ffff80000010df0e: 5d                   	popq	%rbp
ffff80000010df0f: c3                   	retq
ffff80000010df10: 48 b8 00 dd 10 00 00 80 ff ff	movabsq	$-140737487250176, %rax # imm = 0xFFFF80000010DD00
ffff80000010df1a: 4c 89 ef             	movq	%r13, %rdi
ffff80000010df1d: ff d0                	callq	*%rax
ffff80000010df1f: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010df29: 48 ba e4 09 11 00 00 80 ff ff	movabsq	$-140737487238684, %rdx # imm = 0xFFFF8000001109E4
ffff80000010df33: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010df3d: be 59 00 00 00       	movl	$89, %esi
ffff80000010df42: 48 89 c1             	movq	%rax, %rcx
ffff80000010df45: 31 c0                	xorl	%eax, %eax
ffff80000010df47: ff d3                	callq	*%rbx
ffff80000010df49: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010df50 <_kaddr>:
ffff80000010df50: 55                   	pushq	%rbp
ffff80000010df51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010df54: 48 89 f8             	movq	%rdi, %rax
ffff80000010df57: 48 89 f9             	movq	%rdi, %rcx
ffff80000010df5a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010df5e: 48 ba e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rdx # imm = 0xFFFF8000001142E0
ffff80000010df68: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010df6b: 73 0f                	jae	0xffff80000010df7c <_kaddr+0x2c>
ffff80000010df6d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
ffff80000010df77: 48 01 c8             	addq	%rcx, %rax
ffff80000010df7a: 5d                   	popq	%rbp
ffff80000010df7b: c3                   	retq
ffff80000010df7c: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010df86: 48 ba 2e 0d 11 00 00 80 ff ff	movabsq	$-140737487237842, %rdx # imm = 0xFFFF800000110D2E
ffff80000010df90: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010df9a: be 48 00 00 00       	movl	$72, %esi
ffff80000010df9f: 48 89 c1             	movq	%rax, %rcx
ffff80000010dfa2: 31 c0                	xorl	%eax, %eax
ffff80000010dfa4: 41 ff d0             	callq	*%r8
ffff80000010dfa7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010dfb0 <_paddr>:
ffff80000010dfb0: 48 89 f0             	movq	%rsi, %rax
ffff80000010dfb3: 48 89 f1             	movq	%rsi, %rcx
ffff80000010dfb6: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010dfba: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010dfc0: 76 0e                	jbe	0xffff80000010dfd0 <_paddr+0x20>
ffff80000010dfc2: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
ffff80000010dfcc: 48 01 c8             	addq	%rcx, %rax
ffff80000010dfcf: c3                   	retq
ffff80000010dfd0: 55                   	pushq	%rbp
ffff80000010dfd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dfd4: 89 fe                	movl	%edi, %esi
ffff80000010dfd6: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010dfe0: 48 ba 16 09 11 00 00 80 ff ff	movabsq	$-140737487238890, %rdx # imm = 0xFFFF800000110916
ffff80000010dfea: 49 b8 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r8 # imm = 0xFFFF80000010C870
ffff80000010dff4: 48 89 c1             	movq	%rax, %rcx
ffff80000010dff7: 31 c0                	xorl	%eax, %eax
ffff80000010dff9: 41 ff d0             	callq	*%r8
ffff80000010dffc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e000 <pa2page>:
ffff80000010e000: 55                   	pushq	%rbp
ffff80000010e001: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e004: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e008: 48 b8 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rax # imm = 0xFFFF8000001142E0
ffff80000010e012: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010e015: 73 16                	jae	0xffff80000010e02d <pa2page+0x2d>
ffff80000010e017: 48 b8 e8 42 11 00 00 80 ff ff	movabsq	$-140737487224088, %rax # imm = 0xFFFF8000001142E8
ffff80000010e021: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010e025: 48 03 38             	addq	(%rax), %rdi
ffff80000010e028: 48 89 f8             	movq	%rdi, %rax
ffff80000010e02b: 5d                   	popq	%rbp
ffff80000010e02c: c3                   	retq
ffff80000010e02d: 48 bf 23 08 11 00 00 80 ff ff	movabsq	$-140737487239133, %rdi # imm = 0xFFFF800000110823
ffff80000010e037: 48 ba 61 0f 11 00 00 80 ff ff	movabsq	$-140737487237279, %rdx # imm = 0xFFFF800000110F61
ffff80000010e041: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e04b: be 47 00 00 00       	movl	$71, %esi
ffff80000010e050: 31 c0                	xorl	%eax, %eax
ffff80000010e052: ff d1                	callq	*%rcx
ffff80000010e054: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e05e: 66 90                	nop

ffff80000010e060 <check_buddy_consistency>:
ffff80000010e060: 55                   	pushq	%rbp
ffff80000010e061: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e064: 41 57                	pushq	%r15
ffff80000010e066: 41 56                	pushq	%r14
ffff80000010e068: 41 55                	pushq	%r13
ffff80000010e06a: 41 54                	pushq	%r12
ffff80000010e06c: 53                   	pushq	%rbx
ffff80000010e06d: 50                   	pushq	%rax
ffff80000010e06e: 49 89 d4             	movq	%rdx, %r12
ffff80000010e071: 49 89 f7             	movq	%rsi, %r15
ffff80000010e074: 49 89 fe             	movq	%rdi, %r14
ffff80000010e077: 48 b8 00 e0 10 00 00 80 ff ff	movabsq	$-140737487249408, %rax # imm = 0xFFFF80000010E000
ffff80000010e081: ff d0                	callq	*%rax
ffff80000010e083: 48 89 c3             	movq	%rax, %rbx
ffff80000010e086: 4d 85 e4             	testq	%r12, %r12
ffff80000010e089: 74 3f                	je	0xffff80000010e0ca <check_buddy_consistency+0x6a>
ffff80000010e08b: 4c 39 e3             	cmpq	%r12, %rbx
ffff80000010e08e: 74 3a                	je	0xffff80000010e0ca <check_buddy_consistency+0x6a>
ffff80000010e090: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010e095: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e098: 0f 88 ce 00 00 00    	js	0xffff80000010e16c <check_buddy_consistency+0x10c>
ffff80000010e09e: 48 89 df             	movq	%rbx, %rdi
ffff80000010e0a1: 48 b8 40 e2 10 00 00 80 ff ff	movabsq	$-140737487248832, %rax # imm = 0xFFFF80000010E240
ffff80000010e0ab: ff d0                	callq	*%rax
ffff80000010e0ad: 85 c0                	testl	%eax, %eax
ffff80000010e0af: 0f 84 b7 00 00 00    	je	0xffff80000010e16c <check_buddy_consistency+0x10c>
ffff80000010e0b5: 44 89 e8             	movl	%r13d, %eax
ffff80000010e0b8: 24 7f                	andb	$127, %al
ffff80000010e0ba: 41 8a 4c 24 12       	movb	18(%r12), %cl
ffff80000010e0bf: 80 e1 7f             	andb	$127, %cl
ffff80000010e0c2: 38 c8                	cmpb	%cl, %al
ffff80000010e0c4: 0f 82 a2 00 00 00    	jb	0xffff80000010e16c <check_buddy_consistency+0x10c>
ffff80000010e0ca: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010e0cf: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e0d2: 79 1c                	jns	0xffff80000010e0f0 <check_buddy_consistency+0x90>
ffff80000010e0d4: 48 89 df             	movq	%rbx, %rdi
ffff80000010e0d7: 48 b8 40 e2 10 00 00 80 ff ff	movabsq	$-140737487248832, %rax # imm = 0xFFFF80000010E240
ffff80000010e0e1: ff d0                	callq	*%rax
ffff80000010e0e3: 85 c0                	testl	%eax, %eax
ffff80000010e0e5: 0f 85 13 01 00 00    	jne	0xffff80000010e1fe <check_buddy_consistency+0x19e>
ffff80000010e0eb: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e0ee: 78 1c                	js	0xffff80000010e10c <check_buddy_consistency+0xac>
ffff80000010e0f0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e0f3: 48 b8 40 e2 10 00 00 80 ff ff	movabsq	$-140737487248832, %rax # imm = 0xFFFF80000010E240
ffff80000010e0fd: ff d0                	callq	*%rax
ffff80000010e0ff: 85 c0                	testl	%eax, %eax
ffff80000010e101: 0f 84 bf 00 00 00    	je	0xffff80000010e1c6 <check_buddy_consistency+0x166>
ffff80000010e107: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e10a: 79 15                	jns	0xffff80000010e121 <check_buddy_consistency+0xc1>
ffff80000010e10c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e10f: 48 b8 40 e2 10 00 00 80 ff ff	movabsq	$-140737487248832, %rax # imm = 0xFFFF80000010E240
ffff80000010e119: ff d0                	callq	*%rax
ffff80000010e11b: 85 c0                	testl	%eax, %eax
ffff80000010e11d: 4c 0f 45 e3          	cmovneq	%rbx, %r12
ffff80000010e121: 4d 85 ff             	testq	%r15, %r15
ffff80000010e124: 74 37                	je	0xffff80000010e15d <check_buddy_consistency+0xfd>
ffff80000010e126: 49 8d 5f ff          	leaq	-1(%r15), %rbx
ffff80000010e12a: 49 bd 60 e0 10 00 00 80 ff ff	movabsq	$-140737487249312, %r13 # imm = 0xFFFF80000010E060
ffff80000010e134: 4c 89 f7             	movq	%r14, %rdi
ffff80000010e137: 48 89 de             	movq	%rbx, %rsi
ffff80000010e13a: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e13d: 41 ff d5             	callq	*%r13
ffff80000010e140: 41 80 c7 0b          	addb	$11, %r15b
ffff80000010e144: b8 01 00 00 00       	movl	$1, %eax
ffff80000010e149: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e14c: d3 e0                	shll	%cl, %eax
ffff80000010e14e: 48 63 f8             	movslq	%eax, %rdi
ffff80000010e151: 4c 09 f7             	orq	%r14, %rdi
ffff80000010e154: 48 89 de             	movq	%rbx, %rsi
ffff80000010e157: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e15a: 41 ff d5             	callq	*%r13
ffff80000010e15d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e161: 5b                   	popq	%rbx
ffff80000010e162: 41 5c                	popq	%r12
ffff80000010e164: 41 5d                	popq	%r13
ffff80000010e166: 41 5e                	popq	%r14
ffff80000010e168: 41 5f                	popq	%r15
ffff80000010e16a: 5d                   	popq	%rbp
ffff80000010e16b: c3                   	retq
ffff80000010e16c: 49 be 00 dd 10 00 00 80 ff ff	movabsq	$-140737487250176, %r14 # imm = 0xFFFF80000010DD00
ffff80000010e176: 48 89 df             	movq	%rbx, %rdi
ffff80000010e179: 41 ff d6             	callq	*%r14
ffff80000010e17c: 48 89 c3             	movq	%rax, %rbx
ffff80000010e17f: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e183: 4c 89 e7             	movq	%r12, %rdi
ffff80000010e186: 41 ff d6             	callq	*%r14
ffff80000010e189: 41 0f b6 4c 24 12    	movzbl	18(%r12), %ecx
ffff80000010e18f: 83 e1 7f             	andl	$127, %ecx
ffff80000010e192: 89 0c 24             	movl	%ecx, (%rsp)
ffff80000010e195: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e19f: 48 ba b5 0c 11 00 00 80 ff ff	movabsq	$-140737487237963, %rdx # imm = 0xFFFF800000110CB5
ffff80000010e1a9: 49 ba 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %r10 # imm = 0xFFFF80000010C870
ffff80000010e1b3: be 6d 00 00 00       	movl	$109, %esi
ffff80000010e1b8: 48 89 d9             	movq	%rbx, %rcx
ffff80000010e1bb: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e1be: 49 89 c1             	movq	%rax, %r9
ffff80000010e1c1: 31 c0                	xorl	%eax, %eax
ffff80000010e1c3: 41 ff d2             	callq	*%r10
ffff80000010e1c6: 48 b8 00 dd 10 00 00 80 ff ff	movabsq	$-140737487250176, %rax # imm = 0xFFFF80000010DD00
ffff80000010e1d0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e1d3: ff d0                	callq	*%rax
ffff80000010e1d5: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e1d9: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e1e3: 48 ba 2b 0b 11 00 00 80 ff ff	movabsq	$-140737487238357, %rdx # imm = 0xFFFF800000110B2B
ffff80000010e1ed: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e1f7: be 78 00 00 00       	movl	$120, %esi
ffff80000010e1fc: eb 36                	jmp	0xffff80000010e234 <check_buddy_consistency+0x1d4>
ffff80000010e1fe: 48 b8 00 dd 10 00 00 80 ff ff	movabsq	$-140737487250176, %rax # imm = 0xFFFF80000010DD00
ffff80000010e208: 48 89 df             	movq	%rbx, %rdi
ffff80000010e20b: ff d0                	callq	*%rax
ffff80000010e20d: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e211: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e21b: 48 ba 9d 0d 11 00 00 80 ff ff	movabsq	$-140737487237731, %rdx # imm = 0xFFFF800000110D9D
ffff80000010e225: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e22f: be 73 00 00 00       	movl	$115, %esi
ffff80000010e234: 48 89 c1             	movq	%rax, %rcx
ffff80000010e237: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e23a: 31 c0                	xorl	%eax, %eax
ffff80000010e23c: ff d3                	callq	*%rbx
ffff80000010e23e: 66 90                	nop

ffff80000010e240 <list_is_empty>:
ffff80000010e240: 55                   	pushq	%rbp
ffff80000010e241: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e244: 31 c0                	xorl	%eax, %eax
ffff80000010e246: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010e249: 0f 94 c0             	sete	%al
ffff80000010e24c: 5d                   	popq	%rbp
ffff80000010e24d: c3                   	retq
ffff80000010e24e: 66 90                	nop

ffff80000010e250 <lab1_check_buddy_consistency>:
ffff80000010e250: 55                   	pushq	%rbp
ffff80000010e251: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e254: 41 56                	pushq	%r14
ffff80000010e256: 53                   	pushq	%rbx
ffff80000010e257: 48 c7 c3 00 00 e0 ff 	movq	$-2097152, %rbx         # imm = 0xFFE00000
ffff80000010e25e: 49 be 60 e0 10 00 00 80 ff ff	movabsq	$-140737487249312, %r14 # imm = 0xFFFF80000010E060
ffff80000010e268: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
ffff80000010e270: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
ffff80000010e277: be 09 00 00 00       	movl	$9, %esi
ffff80000010e27c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e27f: 31 d2                	xorl	%edx, %edx
ffff80000010e281: 41 ff d6             	callq	*%r14
ffff80000010e284: 48 81 fb 00 00 60 00 	cmpq	$6291456, %rbx          # imm = 0x600000
ffff80000010e28b: 72 e3                	jb	0xffff80000010e270 <lab1_check_buddy_consistency+0x20>
ffff80000010e28d: 48 bf 2e 10 11 00 00 80 ff ff	movabsq	$-140737487237074, %rdi # imm = 0xFFFF80000011102E
ffff80000010e297: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010e2a1: 31 c0                	xorl	%eax, %eax
ffff80000010e2a3: ff d1                	callq	*%rcx
ffff80000010e2a5: 5b                   	popq	%rbx
ffff80000010e2a6: 41 5e                	popq	%r14
ffff80000010e2a8: 5d                   	popq	%rbp
ffff80000010e2a9: c3                   	retq
ffff80000010e2aa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e2b0 <lab1_check_split_and_merge>:
ffff80000010e2b0: 55                   	pushq	%rbp
ffff80000010e2b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e2b4: 41 57                	pushq	%r15
ffff80000010e2b6: 41 56                	pushq	%r14
ffff80000010e2b8: 41 55                	pushq	%r13
ffff80000010e2ba: 41 54                	pushq	%r12
ffff80000010e2bc: 53                   	pushq	%rbx
ffff80000010e2bd: 48 81 ec a8 00 00 00 	subq	$168, %rsp
ffff80000010e2c4: 89 fb                	movl	%edi, %ebx
ffff80000010e2c6: 49 be b0 d6 10 00 00 80 ff ff	movabsq	$-140737487251792, %r14 # imm = 0xFFFF80000010D6B0
ffff80000010e2d0: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e2d5: 41 ff d6             	callq	*%r14
ffff80000010e2d8: 49 89 c4             	movq	%rax, %r12
ffff80000010e2db: 48 b8 30 d8 10 00 00 80 ff ff	movabsq	$-140737487251408, %rax # imm = 0xFFFF80000010D830
ffff80000010e2e5: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e2ea: ff d0                	callq	*%rax
ffff80000010e2ec: 48 85 c0             	testq	%rax, %rax
ffff80000010e2ef: 0f 84 5d 02 00 00    	je	0xffff80000010e552 <lab1_check_split_and_merge+0x2a2>
ffff80000010e2f5: 49 89 c7             	movq	%rax, %r15
ffff80000010e2f8: 89 5d d4             	movl	%ebx, -44(%rbp)
ffff80000010e2fb: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e300: 41 ff d6             	callq	*%r14
ffff80000010e303: 48 83 c0 01          	addq	$1, %rax
ffff80000010e307: 4c 39 e0             	cmpq	%r12, %rax
ffff80000010e30a: 0f 85 69 02 00 00    	jne	0xffff80000010e579 <lab1_check_split_and_merge+0x2c9>
ffff80000010e310: 31 db                	xorl	%ebx, %ebx
ffff80000010e312: 49 bc 40 42 11 00 00 80 ff ff	movabsq	$-140737487224256, %r12 # imm = 0xFFFF800000114240
ffff80000010e31c: 49 bd f0 e6 10 00 00 80 ff ff	movabsq	$-140737487247632, %r13 # imm = 0xFFFF80000010E6F0
ffff80000010e326: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e330: 4a 8d 3c 23          	leaq	(%rbx,%r12), %rdi
ffff80000010e334: 4a 8b 04 23          	movq	(%rbx,%r12), %rax
ffff80000010e338: 4a 8b 4c 23 08       	movq	8(%rbx,%r12), %rcx
ffff80000010e33d: 48 89 8c 1d 38 ff ff ff      	movq	%rcx, -200(%rbp,%rbx)
ffff80000010e345: 48 89 84 1d 30 ff ff ff      	movq	%rax, -208(%rbp,%rbx)
ffff80000010e34d: 41 ff d5             	callq	*%r13
ffff80000010e350: 48 83 c3 10          	addq	$16, %rbx
ffff80000010e354: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010e35b: 75 d3                	jne	0xffff80000010e330 <lab1_check_split_and_merge+0x80>
ffff80000010e35d: 48 b8 b0 d8 10 00 00 80 ff ff	movabsq	$-140737487251280, %rax # imm = 0xFFFF80000010D8B0
ffff80000010e367: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e36a: ff d0                	callq	*%rax
ffff80000010e36c: 31 db                	xorl	%ebx, %ebx
ffff80000010e36e: 66 90                	nop
ffff80000010e370: 48 89 df             	movq	%rbx, %rdi
ffff80000010e373: 41 ff d6             	callq	*%r14
ffff80000010e376: 48 85 c0             	testq	%rax, %rax
ffff80000010e379: 0f 85 40 01 00 00    	jne	0xffff80000010e4bf <lab1_check_split_and_merge+0x20f>
ffff80000010e37f: 48 83 c3 01          	addq	$1, %rbx
ffff80000010e383: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e387: 75 e7                	jne	0xffff80000010e370 <lab1_check_split_and_merge+0xc0>
ffff80000010e389: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e38e: 41 ff d6             	callq	*%r14
ffff80000010e391: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e395: 0f 85 0f 02 00 00    	jne	0xffff80000010e5aa <lab1_check_split_and_merge+0x2fa>
ffff80000010e39b: 49 bd a0 d8 10 00 00 80 ff ff	movabsq	$-140737487251296, %r13 # imm = 0xFFFF80000010D8A0
ffff80000010e3a5: 31 ff                	xorl	%edi, %edi
ffff80000010e3a7: 41 ff d5             	callq	*%r13
ffff80000010e3aa: 48 85 c0             	testq	%rax, %rax
ffff80000010e3ad: 0f 84 28 02 00 00    	je	0xffff80000010e5db <lab1_check_split_and_merge+0x32b>
ffff80000010e3b3: 49 89 c7             	movq	%rax, %r15
ffff80000010e3b6: 31 db                	xorl	%ebx, %ebx
ffff80000010e3b8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
ffff80000010e3c0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e3c3: 41 ff d6             	callq	*%r14
ffff80000010e3c6: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e3ca: 0f 85 20 01 00 00    	jne	0xffff80000010e4f0 <lab1_check_split_and_merge+0x240>
ffff80000010e3d0: 48 83 c3 01          	addq	$1, %rbx
ffff80000010e3d4: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e3d8: 75 e6                	jne	0xffff80000010e3c0 <lab1_check_split_and_merge+0x110>
ffff80000010e3da: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e3df: 41 ff d6             	callq	*%r14
ffff80000010e3e2: 48 85 c0             	testq	%rax, %rax
ffff80000010e3e5: 0f 85 17 02 00 00    	jne	0xffff80000010e602 <lab1_check_split_and_merge+0x352>
ffff80000010e3eb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e3ee: 48 b8 b0 d8 10 00 00 80 ff ff	movabsq	$-140737487251280, %rax # imm = 0xFFFF80000010D8B0
ffff80000010e3f8: ff d0                	callq	*%rax
ffff80000010e3fa: 31 db                	xorl	%ebx, %ebx
ffff80000010e3fc: 0f 1f 40 00          	nopl	(%rax)
ffff80000010e400: 48 89 df             	movq	%rbx, %rdi
ffff80000010e403: 41 ff d6             	callq	*%r14
ffff80000010e406: 48 85 c0             	testq	%rax, %rax
ffff80000010e409: 0f 85 12 01 00 00    	jne	0xffff80000010e521 <lab1_check_split_and_merge+0x271>
ffff80000010e40f: 48 83 c3 01          	addq	$1, %rbx
ffff80000010e413: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e417: 75 e7                	jne	0xffff80000010e400 <lab1_check_split_and_merge+0x150>
ffff80000010e419: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e41e: 41 ff d6             	callq	*%r14
ffff80000010e421: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e425: 0f 85 08 02 00 00    	jne	0xffff80000010e633 <lab1_check_split_and_merge+0x383>
ffff80000010e42b: f6 45 d4 02          	testb	$2, -44(%rbp)
ffff80000010e42f: 75 13                	jne	0xffff80000010e444 <lab1_check_split_and_merge+0x194>
ffff80000010e431: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e436: 48 b8 30 d8 10 00 00 80 ff ff	movabsq	$-140737487251408, %rax # imm = 0xFFFF80000010D830
ffff80000010e440: ff d0                	callq	*%rax
ffff80000010e442: eb 08                	jmp	0xffff80000010e44c <lab1_check_split_and_merge+0x19c>
ffff80000010e444: bf 02 00 00 00       	movl	$2, %edi
ffff80000010e449: 41 ff d5             	callq	*%r13
ffff80000010e44c: 48 85 c0             	testq	%rax, %rax
ffff80000010e44f: 0f 84 0f 02 00 00    	je	0xffff80000010e664 <lab1_check_split_and_merge+0x3b4>
ffff80000010e455: 31 c9                	xorl	%ecx, %ecx
ffff80000010e457: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
ffff80000010e460: 48 8b 94 0d 30 ff ff ff      	movq	-208(%rbp,%rcx), %rdx
ffff80000010e468: 48 8b b4 0d 38 ff ff ff      	movq	-200(%rbp,%rcx), %rsi
ffff80000010e470: 4a 89 74 21 08       	movq	%rsi, 8(%rcx,%r12)
ffff80000010e475: 4a 89 14 21          	movq	%rdx, (%rcx,%r12)
ffff80000010e479: 48 83 c1 10          	addq	$16, %rcx
ffff80000010e47d: 48 81 f9 a0 00 00 00 	cmpq	$160, %rcx
ffff80000010e484: 75 da                	jne	0xffff80000010e460 <lab1_check_split_and_merge+0x1b0>
ffff80000010e486: 48 89 c7             	movq	%rax, %rdi
ffff80000010e489: 48 b8 b0 d8 10 00 00 80 ff ff	movabsq	$-140737487251280, %rax # imm = 0xFFFF80000010D8B0
ffff80000010e493: ff d0                	callq	*%rax
ffff80000010e495: 48 bf 6a 0e 11 00 00 80 ff ff	movabsq	$-140737487237526, %rdi # imm = 0xFFFF800000110E6A
ffff80000010e49f: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010e4a9: 31 c0                	xorl	%eax, %eax
ffff80000010e4ab: ff d1                	callq	*%rcx
ffff80000010e4ad: 48 81 c4 a8 00 00 00 	addq	$168, %rsp
ffff80000010e4b4: 5b                   	popq	%rbx
ffff80000010e4b5: 41 5c                	popq	%r12
ffff80000010e4b7: 41 5d                	popq	%r13
ffff80000010e4b9: 41 5e                	popq	%r14
ffff80000010e4bb: 41 5f                	popq	%r15
ffff80000010e4bd: 5d                   	popq	%rbp
ffff80000010e4be: c3                   	retq
ffff80000010e4bf: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e4c9: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e4d3: 48 b9 c5 0e 11 00 00 80 ff ff	movabsq	$-140737487237435, %rcx # imm = 0xFFFF800000110EC5
ffff80000010e4dd: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e4e7: be ba 00 00 00       	movl	$186, %esi
ffff80000010e4ec: 31 c0                	xorl	%eax, %eax
ffff80000010e4ee: ff d3                	callq	*%rbx
ffff80000010e4f0: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e4fa: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e504: 48 b9 bb 0f 11 00 00 80 ff ff	movabsq	$-140737487237189, %rcx # imm = 0xFFFF800000110FBB
ffff80000010e50e: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e518: be c8 00 00 00       	movl	$200, %esi
ffff80000010e51d: 31 c0                	xorl	%eax, %eax
ffff80000010e51f: ff d3                	callq	*%rbx
ffff80000010e521: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e52b: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e535: 48 b9 c5 0e 11 00 00 80 ff ff	movabsq	$-140737487237435, %rcx # imm = 0xFFFF800000110EC5
ffff80000010e53f: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e549: be d2 00 00 00       	movl	$210, %esi
ffff80000010e54e: 31 c0                	xorl	%eax, %eax
ffff80000010e550: ff d3                	callq	*%rbx
ffff80000010e552: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e55c: 48 ba 5f 0b 11 00 00 80 ff ff	movabsq	$-140737487238305, %rdx # imm = 0xFFFF800000110B5F
ffff80000010e566: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e570: be a9 00 00 00       	movl	$169, %esi
ffff80000010e575: 31 c0                	xorl	%eax, %eax
ffff80000010e577: ff d1                	callq	*%rcx
ffff80000010e579: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e583: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e58d: 48 b9 f2 0b 11 00 00 80 ff ff	movabsq	$-140737487238158, %rcx # imm = 0xFFFF800000110BF2
ffff80000010e597: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e5a1: be ad 00 00 00       	movl	$173, %esi
ffff80000010e5a6: 31 c0                	xorl	%eax, %eax
ffff80000010e5a8: ff d3                	callq	*%rbx
ffff80000010e5aa: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e5b4: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e5be: 48 b9 4f 08 11 00 00 80 ff ff	movabsq	$-140737487239089, %rcx # imm = 0xFFFF80000011084F
ffff80000010e5c8: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e5d2: be bd 00 00 00       	movl	$189, %esi
ffff80000010e5d7: 31 c0                	xorl	%eax, %eax
ffff80000010e5d9: ff d3                	callq	*%rbx
ffff80000010e5db: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e5e5: 48 ba 5b 0a 11 00 00 80 ff ff	movabsq	$-140737487238565, %rdx # imm = 0xFFFF800000110A5B
ffff80000010e5ef: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e5f9: be c3 00 00 00       	movl	$195, %esi
ffff80000010e5fe: 31 c0                	xorl	%eax, %eax
ffff80000010e600: ff d1                	callq	*%rcx
ffff80000010e602: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e60c: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e616: 48 b9 a2 0a 11 00 00 80 ff ff	movabsq	$-140737487238494, %rcx # imm = 0xFFFF800000110AA2
ffff80000010e620: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e62a: be cb 00 00 00       	movl	$203, %esi
ffff80000010e62f: 31 c0                	xorl	%eax, %eax
ffff80000010e631: ff d3                	callq	*%rbx
ffff80000010e633: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e63d: 48 ba 16 0b 11 00 00 80 ff ff	movabsq	$-140737487238378, %rdx # imm = 0xFFFF800000110B16
ffff80000010e647: 48 b9 4f 08 11 00 00 80 ff ff	movabsq	$-140737487239089, %rcx # imm = 0xFFFF80000011084F
ffff80000010e651: 48 bb 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rbx # imm = 0xFFFF80000010C870
ffff80000010e65b: be d5 00 00 00       	movl	$213, %esi
ffff80000010e660: 31 c0                	xorl	%eax, %eax
ffff80000010e662: ff d3                	callq	*%rbx
ffff80000010e664: 48 bf 72 07 11 00 00 80 ff ff	movabsq	$-140737487239310, %rdi # imm = 0xFFFF800000110772
ffff80000010e66e: 48 ba 5f 0b 11 00 00 80 ff ff	movabsq	$-140737487238305, %rdx # imm = 0xFFFF800000110B5F
ffff80000010e678: 48 b9 70 c8 10 00 00 80 ff ff	movabsq	$-140737487255440, %rcx # imm = 0xFFFF80000010C870
ffff80000010e682: be de 00 00 00       	movl	$222, %esi
ffff80000010e687: 31 c0                	xorl	%eax, %eax
ffff80000010e689: ff d1                	callq	*%rcx
ffff80000010e68b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010e690 <lab1_check_mem>:
ffff80000010e690: 55                   	pushq	%rbp
ffff80000010e691: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e694: 53                   	pushq	%rbx
ffff80000010e695: 50                   	pushq	%rax
ffff80000010e696: 48 89 fb             	movq	%rdi, %rbx
ffff80000010e699: 48 b8 e0 db 10 00 00 80 ff ff	movabsq	$-140737487250464, %rax # imm = 0xFFFF80000010DBE0
ffff80000010e6a3: ff d0                	callq	*%rax
ffff80000010e6a5: 48 b8 20 dd 10 00 00 80 ff ff	movabsq	$-140737487250144, %rax # imm = 0xFFFF80000010DD20
ffff80000010e6af: ff d0                	callq	*%rax
ffff80000010e6b1: 48 b8 d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %rax # imm = 0xFFFF80000010DDD0
ffff80000010e6bb: 48 89 df             	movq	%rbx, %rdi
ffff80000010e6be: ff d0                	callq	*%rax
ffff80000010e6c0: 48 b8 50 e2 10 00 00 80 ff ff	movabsq	$-140737487248816, %rax # imm = 0xFFFF80000010E250
ffff80000010e6ca: ff d0                	callq	*%rax
ffff80000010e6cc: 48 b8 b0 e2 10 00 00 80 ff ff	movabsq	$-140737487248720, %rax # imm = 0xFFFF80000010E2B0
ffff80000010e6d6: 31 ff                	xorl	%edi, %edi
ffff80000010e6d8: ff d0                	callq	*%rax
ffff80000010e6da: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e6de: 5b                   	popq	%rbx
ffff80000010e6df: 5d                   	popq	%rbp
ffff80000010e6e0: c3                   	retq
ffff80000010e6e1: cc                   	int3
ffff80000010e6e2: cc                   	int3
ffff80000010e6e3: cc                   	int3
ffff80000010e6e4: cc                   	int3
ffff80000010e6e5: cc                   	int3
ffff80000010e6e6: cc                   	int3
ffff80000010e6e7: cc                   	int3
ffff80000010e6e8: cc                   	int3
ffff80000010e6e9: cc                   	int3
ffff80000010e6ea: cc                   	int3
ffff80000010e6eb: cc                   	int3
ffff80000010e6ec: cc                   	int3
ffff80000010e6ed: cc                   	int3
ffff80000010e6ee: cc                   	int3
ffff80000010e6ef: cc                   	int3

ffff80000010e6f0 <list_init>:
ffff80000010e6f0: 55                   	pushq	%rbp
ffff80000010e6f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e6f4: 48 89 3f             	movq	%rdi, (%rdi)
ffff80000010e6f7: 48 89 7f 08          	movq	%rdi, 8(%rdi)
ffff80000010e6fb: 5d                   	popq	%rbp
ffff80000010e6fc: c3                   	retq
ffff80000010e6fd: 0f 1f 00             	nopl	(%rax)

ffff80000010e700 <list_insert_after>:
ffff80000010e700: 55                   	pushq	%rbp
ffff80000010e701: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e704: 48 89 7e 08          	movq	%rdi, 8(%rsi)
ffff80000010e708: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e70b: 48 89 06             	movq	%rax, (%rsi)
ffff80000010e70e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e711: 48 89 70 08          	movq	%rsi, 8(%rax)
ffff80000010e715: 48 89 37             	movq	%rsi, (%rdi)
ffff80000010e718: 5d                   	popq	%rbp
ffff80000010e719: c3                   	retq
ffff80000010e71a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e720 <list_insert_before>:
ffff80000010e720: 55                   	pushq	%rbp
ffff80000010e721: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e724: 48 89 3e             	movq	%rdi, (%rsi)
ffff80000010e727: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e72b: 48 89 46 08          	movq	%rax, 8(%rsi)
ffff80000010e72f: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e733: 48 89 30             	movq	%rsi, (%rax)
ffff80000010e736: 48 89 77 08          	movq	%rsi, 8(%rdi)
ffff80000010e73a: 5d                   	popq	%rbp
ffff80000010e73b: c3                   	retq
ffff80000010e73c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e740 <list_del>:
ffff80000010e740: 55                   	pushq	%rbp
ffff80000010e741: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e744: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e747: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010e74b: 48 89 01             	movq	%rax, (%rcx)
ffff80000010e74e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e751: 48 89 48 08          	movq	%rcx, 8(%rax)
ffff80000010e755: 48 89 3f             	movq	%rdi, (%rdi)
ffff80000010e758: 48 89 7f 08          	movq	%rdi, 8(%rdi)
ffff80000010e75c: 5d                   	popq	%rbp
ffff80000010e75d: c3                   	retq
ffff80000010e75e: 66 90                	nop

ffff80000010e760 <list_add>:
ffff80000010e760: 55                   	pushq	%rbp
ffff80000010e761: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e764: 48 b8 00 e7 10 00 00 80 ff ff	movabsq	$-140737487247616, %rax # imm = 0xFFFF80000010E700
ffff80000010e76e: ff d0                	callq	*%rax
ffff80000010e770: 5d                   	popq	%rbp
ffff80000010e771: c3                   	retq
ffff80000010e772: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e77c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e780 <list_add_tail>:
ffff80000010e780: 55                   	pushq	%rbp
ffff80000010e781: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e784: 48 b8 20 e7 10 00 00 80 ff ff	movabsq	$-140737487247584, %rax # imm = 0xFFFF80000010E720
ffff80000010e78e: ff d0                	callq	*%rax
ffff80000010e790: 5d                   	popq	%rbp
ffff80000010e791: c3                   	retq
ffff80000010e792: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e79c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e7a0 <list_pop_tail>:
ffff80000010e7a0: 55                   	pushq	%rbp
ffff80000010e7a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e7a4: 53                   	pushq	%rbx
ffff80000010e7a5: 50                   	pushq	%rax
ffff80000010e7a6: 48 8b 5f 08          	movq	8(%rdi), %rbx
ffff80000010e7aa: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e7ad: 74 11                	je	0xffff80000010e7c0 <list_pop_tail+0x20>
ffff80000010e7af: 48 b8 40 e7 10 00 00 80 ff ff	movabsq	$-140737487247552, %rax # imm = 0xFFFF80000010E740
ffff80000010e7b9: 48 89 df             	movq	%rbx, %rdi
ffff80000010e7bc: ff d0                	callq	*%rax
ffff80000010e7be: eb 02                	jmp	0xffff80000010e7c2 <list_pop_tail+0x22>
ffff80000010e7c0: 31 db                	xorl	%ebx, %ebx
ffff80000010e7c2: 48 89 d8             	movq	%rbx, %rax
ffff80000010e7c5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e7c9: 5b                   	popq	%rbx
ffff80000010e7ca: 5d                   	popq	%rbp
ffff80000010e7cb: c3                   	retq
ffff80000010e7cc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e7d0 <list_pop>:
ffff80000010e7d0: 55                   	pushq	%rbp
ffff80000010e7d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e7d4: 53                   	pushq	%rbx
ffff80000010e7d5: 50                   	pushq	%rax
ffff80000010e7d6: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010e7d9: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e7dc: 74 11                	je	0xffff80000010e7ef <list_pop+0x1f>
ffff80000010e7de: 48 b8 40 e7 10 00 00 80 ff ff	movabsq	$-140737487247552, %rax # imm = 0xFFFF80000010E740
ffff80000010e7e8: 48 89 df             	movq	%rbx, %rdi
ffff80000010e7eb: ff d0                	callq	*%rax
ffff80000010e7ed: eb 02                	jmp	0xffff80000010e7f1 <list_pop+0x21>
ffff80000010e7ef: 31 db                	xorl	%ebx, %ebx
ffff80000010e7f1: 48 89 d8             	movq	%rbx, %rax
ffff80000010e7f4: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e7f8: 5b                   	popq	%rbx
ffff80000010e7f9: 5d                   	popq	%rbp
ffff80000010e7fa: c3                   	retq
ffff80000010e7fb: cc                   	int3
ffff80000010e7fc: cc                   	int3
ffff80000010e7fd: cc                   	int3
ffff80000010e7fe: cc                   	int3
ffff80000010e7ff: cc                   	int3

ffff80000010e800 <vprintfmt>:
ffff80000010e800: 55                   	pushq	%rbp
ffff80000010e801: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e804: 41 57                	pushq	%r15
ffff80000010e806: 41 56                	pushq	%r14
ffff80000010e808: 41 55                	pushq	%r13
ffff80000010e80a: 41 54                	pushq	%r12
ffff80000010e80c: 53                   	pushq	%rbx
ffff80000010e80d: 48 83 ec 38          	subq	$56, %rsp
ffff80000010e811: 49 89 d6             	movq	%rdx, %r14
ffff80000010e814: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e817: 49 89 ff             	movq	%rdi, %r15
ffff80000010e81a: 48 8b 41 10          	movq	16(%rcx), %rax
ffff80000010e81e: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010e822: 48 8b 01             	movq	(%rcx), %rax
ffff80000010e825: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010e829: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010e82d: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010e831: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010e835: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff80000010e839: eb 44                	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010e83b: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e83f: 48 b8 b0 ed 10 00 00 80 ff ff	movabsq	$-140737487245904, %rax # imm = 0xFFFF80000010EDB0
ffff80000010e849: ff d0                	callq	*%rax
ffff80000010e84b: 49 89 c4             	movq	%rax, %r12
ffff80000010e84e: 41 bf 10 00 00 00    	movl	$16, %r15d
ffff80000010e854: 45 0f b6 cd          	movzbl	%r13b, %r9d
ffff80000010e858: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010e85c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010e860: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e863: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e866: 49 89 ff             	movq	%rdi, %r15
ffff80000010e869: 41 89 d8             	movl	%ebx, %r8d
ffff80000010e86c: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e86f: 48 b8 30 ee 10 00 00 80 ff ff	movabsq	$-140737487245776, %rax # imm = 0xFFFF80000010EE30
ffff80000010e879: ff d0                	callq	*%rax
ffff80000010e87b: 49 83 c6 01          	addq	$1, %r14
ffff80000010e87f: 41 0f b6 3e          	movzbl	(%r14), %edi
ffff80000010e883: 49 83 c6 01          	addq	$1, %r14
ffff80000010e887: 83 ff 25             	cmpl	$37, %edi
ffff80000010e88a: 74 14                	je	0xffff80000010e8a0 <vprintfmt+0xa0>
ffff80000010e88c: 40 84 ff             	testb	%dil, %dil
ffff80000010e88f: 0f 84 2e 04 00 00    	je	0xffff80000010ecc3 <vprintfmt+0x4c3>
ffff80000010e895: 48 89 de             	movq	%rbx, %rsi
ffff80000010e898: 41 ff d7             	callq	*%r15
ffff80000010e89b: eb e2                	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010e89d: 0f 1f 00             	nopl	(%rax)
ffff80000010e8a0: 41 b5 20             	movb	$32, %r13b
ffff80000010e8a3: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010e8a8: 31 f6                	xorl	%esi, %esi
ffff80000010e8aa: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010e8ae: 41 bf ff ff ff ff    	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
ffff80000010e8b4: c7 45 a8 00 00 00 00 	movl	$0, -88(%rbp)
ffff80000010e8bb: 48 bf f0 02 11 00 00 80 ff ff	movabsq	$-140737487240464, %rdi # imm = 0xFFFF8000001102F0
ffff80000010e8c5: 4d 8d 66 01          	leaq	1(%r14), %r12
ffff80000010e8c9: eb 10                	jmp	0xffff80000010e8db <vprintfmt+0xdb>
ffff80000010e8cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010e8d0: 49 83 c6 01          	addq	$1, %r14
ffff80000010e8d4: 49 83 c4 01          	addq	$1, %r12
ffff80000010e8d8: 41 89 cd             	movl	%ecx, %r13d
ffff80000010e8db: 41 0f b6 0e          	movzbl	(%r14), %ecx
ffff80000010e8df: 8d 51 dd             	leal	-35(%rcx), %edx
ffff80000010e8e2: 80 fa 55             	cmpb	$85, %dl
ffff80000010e8e5: 0f 87 25 01 00 00    	ja	0xffff80000010ea10 <vprintfmt+0x210>
ffff80000010e8eb: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010e8ee: ff 24 d7             	jmpq	*(%rdi,%rdx,8)
ffff80000010e8f1: b1 30                	movb	$48, %cl
ffff80000010e8f3: eb db                	jmp	0xffff80000010e8d0 <vprintfmt+0xd0>
ffff80000010e8f5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e8ff: 90                   	nop
ffff80000010e900: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010e903: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e906: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e910: 43 8d 14 bf          	leal	(%r15,%r15,4), %edx
ffff80000010e914: 44 8d 3c 51          	leal	(%rcx,%rdx,2), %r15d
ffff80000010e918: 41 83 c7 d0          	addl	$-48, %r15d
ffff80000010e91c: 41 0f be 4e 01       	movsbl	1(%r14), %ecx
ffff80000010e921: 49 83 c6 01          	addq	$1, %r14
ffff80000010e925: 8d 51 c6             	leal	-58(%rcx), %edx
ffff80000010e928: 80 fa f6             	cmpb	$-10, %dl
ffff80000010e92b: 73 e3                	jae	0xffff80000010e910 <vprintfmt+0x110>
ffff80000010e92d: 85 db                	testl	%ebx, %ebx
ffff80000010e92f: 41 0f 48 df          	cmovsl	%r15d, %ebx
ffff80000010e933: b9 ff ff ff ff       	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
ffff80000010e938: 44 0f 48 f9          	cmovsl	%ecx, %r15d
ffff80000010e93c: eb 87                	jmp	0xffff80000010e8c5 <vprintfmt+0xc5>
ffff80000010e93e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e942: 49 83 c6 01          	addq	$1, %r14
ffff80000010e946: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e94a: 77 39                	ja	0xffff80000010e985 <vprintfmt+0x185>
ffff80000010e94c: 48 89 ca             	movq	%rcx, %rdx
ffff80000010e94f: 48 01 c2             	addq	%rax, %rdx
ffff80000010e952: 83 c1 08             	addl	$8, %ecx
ffff80000010e955: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e958: 44 8b 3a             	movl	(%rdx), %r15d
ffff80000010e95b: eb d0                	jmp	0xffff80000010e92d <vprintfmt+0x12d>
ffff80000010e95d: 49 83 c6 01          	addq	$1, %r14
ffff80000010e961: c7 45 a8 01 00 00 00 	movl	$1, -88(%rbp)
ffff80000010e968: e9 58 ff ff ff       	jmp	0xffff80000010e8c5 <vprintfmt+0xc5>
ffff80000010e96d: 85 db                	testl	%ebx, %ebx
ffff80000010e96f: b9 00 00 00 00       	movl	$0, %ecx
ffff80000010e974: 0f 48 d9             	cmovsl	%ecx, %ebx
ffff80000010e977: eb 03                	jmp	0xffff80000010e97c <vprintfmt+0x17c>
ffff80000010e979: 83 c6 01             	addl	$1, %esi
ffff80000010e97c: 49 83 c6 01          	addq	$1, %r14
ffff80000010e980: e9 40 ff ff ff       	jmp	0xffff80000010e8c5 <vprintfmt+0xc5>
ffff80000010e985: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010e989: 48 8d 51 08          	leaq	8(%rcx), %rdx
ffff80000010e98d: 48 89 55 b8          	movq	%rdx, -72(%rbp)
ffff80000010e991: 44 8b 39             	movl	(%rcx), %r15d
ffff80000010e994: eb 97                	jmp	0xffff80000010e92d <vprintfmt+0x12d>
ffff80000010e996: bf 25 00 00 00       	movl	$37, %edi
ffff80000010e99b: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010e99f: 48 89 de             	movq	%rbx, %rsi
ffff80000010e9a2: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010e9a6: 41 ff d7             	callq	*%r15
ffff80000010e9a9: 49 83 c6 01          	addq	$1, %r14
ffff80000010e9ad: e9 cd fe ff ff       	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010e9b2: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e9b6: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e9ba: 0f 87 3a 01 00 00    	ja	0xffff80000010eafa <vprintfmt+0x2fa>
ffff80000010e9c0: 48 89 c8             	movq	%rcx, %rax
ffff80000010e9c3: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010e9c7: 83 c1 08             	addl	$8, %ecx
ffff80000010e9ca: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010e9cd: e9 34 01 00 00       	jmp	0xffff80000010eb06 <vprintfmt+0x306>
ffff80000010e9d2: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e9d6: 48 b8 b0 ed 10 00 00 80 ff ff	movabsq	$-140737487245904, %rax # imm = 0xFFFF80000010EDB0
ffff80000010e9e0: ff d0                	callq	*%rax
ffff80000010e9e2: 49 89 c4             	movq	%rax, %r12
ffff80000010e9e5: 41 bf 08 00 00 00    	movl	$8, %r15d
ffff80000010e9eb: e9 64 fe ff ff       	jmp	0xffff80000010e854 <vprintfmt+0x54>
ffff80000010e9f0: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010e9f4: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010e9f8: 0f 87 55 01 00 00    	ja	0xffff80000010eb53 <vprintfmt+0x353>
ffff80000010e9fe: 48 89 c8             	movq	%rcx, %rax
ffff80000010ea01: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010ea05: 83 c1 08             	addl	$8, %ecx
ffff80000010ea08: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010ea0b: e9 4f 01 00 00       	jmp	0xffff80000010eb5f <vprintfmt+0x35f>
ffff80000010ea10: bf 25 00 00 00       	movl	$37, %edi
ffff80000010ea15: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010ea19: 48 89 de             	movq	%rbx, %rsi
ffff80000010ea1c: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ea20: 41 ff d7             	callq	*%r15
ffff80000010ea23: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ea2d: 0f 1f 00             	nopl	(%rax)
ffff80000010ea30: 4d 8d 74 24 ff       	leaq	-1(%r12), %r14
ffff80000010ea35: 41 80 7c 24 fe 25    	cmpb	$37, -2(%r12)
ffff80000010ea3b: 4d 89 f4             	movq	%r14, %r12
ffff80000010ea3e: 75 f0                	jne	0xffff80000010ea30 <vprintfmt+0x230>
ffff80000010ea40: e9 3a fe ff ff       	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010ea45: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010ea49: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010ea4d: 0f 87 07 02 00 00    	ja	0xffff80000010ec5a <vprintfmt+0x45a>
ffff80000010ea53: 48 89 c8             	movq	%rcx, %rax
ffff80000010ea56: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010ea5a: 83 c1 08             	addl	$8, %ecx
ffff80000010ea5d: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010ea60: e9 01 02 00 00       	jmp	0xffff80000010ec66 <vprintfmt+0x466>
ffff80000010ea65: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010ea69: 48 b8 30 ed 10 00 00 80 ff ff	movabsq	$-140737487246032, %rax # imm = 0xFFFF80000010ED30
ffff80000010ea73: ff d0                	callq	*%rax
ffff80000010ea75: 49 89 c4             	movq	%rax, %r12
ffff80000010ea78: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010ea7e: 48 85 c0             	testq	%rax, %rax
ffff80000010ea81: 0f 89 cd fd ff ff    	jns	0xffff80000010e854 <vprintfmt+0x54>
ffff80000010ea87: bf 2d 00 00 00       	movl	$45, %edi
ffff80000010ea8c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010ea90: ff 55 c8             	callq	*-56(%rbp)
ffff80000010ea93: 49 f7 dc             	negq	%r12
ffff80000010ea96: e9 b9 fd ff ff       	jmp	0xffff80000010e854 <vprintfmt+0x54>
ffff80000010ea9b: bf 30 00 00 00       	movl	$48, %edi
ffff80000010eaa0: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010eaa4: 4c 89 fe             	movq	%r15, %rsi
ffff80000010eaa7: 4c 8b 65 c8          	movq	-56(%rbp), %r12
ffff80000010eaab: 41 ff d4             	callq	*%r12
ffff80000010eaae: bf 78 00 00 00       	movl	$120, %edi
ffff80000010eab3: 4c 89 fe             	movq	%r15, %rsi
ffff80000010eab6: 41 ff d4             	callq	*%r12
ffff80000010eab9: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010eabd: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010eac1: 0f 87 b2 01 00 00    	ja	0xffff80000010ec79 <vprintfmt+0x479>
ffff80000010eac7: 48 89 c8             	movq	%rcx, %rax
ffff80000010eaca: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010eace: 83 c1 08             	addl	$8, %ecx
ffff80000010ead1: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010ead4: 4c 8b 20             	movq	(%rax), %r12
ffff80000010ead7: e9 72 fd ff ff       	jmp	0xffff80000010e84e <vprintfmt+0x4e>
ffff80000010eadc: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010eae0: 48 b8 b0 ed 10 00 00 80 ff ff	movabsq	$-140737487245904, %rax # imm = 0xFFFF80000010EDB0
ffff80000010eaea: ff d0                	callq	*%rax
ffff80000010eaec: 49 89 c4             	movq	%rax, %r12
ffff80000010eaef: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010eaf5: e9 5a fd ff ff       	jmp	0xffff80000010e854 <vprintfmt+0x54>
ffff80000010eafa: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010eafe: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010eb02: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010eb06: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010eb0a: 49 83 c6 01          	addq	$1, %r14
ffff80000010eb0e: 8b 00                	movl	(%rax), %eax
ffff80000010eb10: 89 c1                	movl	%eax, %ecx
ffff80000010eb12: f7 d9                	negl	%ecx
ffff80000010eb14: 0f 48 c8             	cmovsl	%eax, %ecx
ffff80000010eb17: 83 f9 08             	cmpl	$8, %ecx
ffff80000010eb1a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010eb1e: 77 0d                	ja	0xffff80000010eb2d <vprintfmt+0x32d>
ffff80000010eb20: 83 f9 03             	cmpl	$3, %ecx
ffff80000010eb23: 74 08                	je	0xffff80000010eb2d <vprintfmt+0x32d>
ffff80000010eb25: 85 c9                	testl	%ecx, %ecx
ffff80000010eb27: 0f 85 60 01 00 00    	jne	0xffff80000010ec8d <vprintfmt+0x48d>
ffff80000010eb2d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010eb30: 48 ba 03 0d 11 00 00 80 ff ff	movabsq	$-140737487237885, %rdx # imm = 0xFFFF800000110D03
ffff80000010eb3a: 31 c0                	xorl	%eax, %eax
ffff80000010eb3c: 49 89 f4             	movq	%rsi, %r12
ffff80000010eb3f: 48 bb e0 ec 10 00 00 80 ff ff	movabsq	$-140737487246112, %rbx # imm = 0xFFFF80000010ECE0
ffff80000010eb49: ff d3                	callq	*%rbx
ffff80000010eb4b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010eb4e: e9 2c fd ff ff       	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010eb53: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010eb57: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010eb5b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010eb5f: 4c 8b 20             	movq	(%rax), %r12
ffff80000010eb62: 4d 85 e4             	testq	%r12, %r12
ffff80000010eb65: 48 b8 e2 0e 11 00 00 80 ff ff	movabsq	$-140737487237406, %rax # imm = 0xFFFF800000110EE2
ffff80000010eb6f: 4c 0f 44 e0          	cmoveq	%rax, %r12
ffff80000010eb73: 85 db                	testl	%ebx, %ebx
ffff80000010eb75: 7e 50                	jle	0xffff80000010ebc7 <vprintfmt+0x3c7>
ffff80000010eb77: 41 80 fd 2d          	cmpb	$45, %r13b
ffff80000010eb7b: 74 4a                	je	0xffff80000010ebc7 <vprintfmt+0x3c7>
ffff80000010eb7d: 44 88 6d ac          	movb	%r13b, -84(%rbp)
ffff80000010eb81: 49 63 f7             	movslq	%r15d, %rsi
ffff80000010eb84: 4c 89 e7             	movq	%r12, %rdi
ffff80000010eb87: 48 b8 b0 f6 10 00 00 80 ff ff	movabsq	$-140737487243600, %rax # imm = 0xFFFF80000010F6B0
ffff80000010eb91: ff d0                	callq	*%rax
ffff80000010eb93: 41 89 dd             	movl	%ebx, %r13d
ffff80000010eb96: 41 29 c5             	subl	%eax, %r13d
ffff80000010eb99: 7e 2f                	jle	0xffff80000010ebca <vprintfmt+0x3ca>
ffff80000010eb9b: 0f b6 4d ac          	movzbl	-84(%rbp), %ecx
ffff80000010eb9f: 89 4d ac             	movl	%ecx, -84(%rbp)
ffff80000010eba2: 29 c3                	subl	%eax, %ebx
ffff80000010eba4: 83 c3 01             	addl	$1, %ebx
ffff80000010eba7: 4c 8b 6d c8          	movq	-56(%rbp), %r13
ffff80000010ebab: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010ebb0: 8b 7d ac             	movl	-84(%rbp), %edi
ffff80000010ebb3: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010ebb7: 41 ff d5             	callq	*%r13
ffff80000010ebba: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ebbd: 83 fb 01             	cmpl	$1, %ebx
ffff80000010ebc0: 7f ee                	jg	0xffff80000010ebb0 <vprintfmt+0x3b0>
ffff80000010ebc2: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010ebc5: eb 03                	jmp	0xffff80000010ebca <vprintfmt+0x3ca>
ffff80000010ebc7: 41 89 dd             	movl	%ebx, %r13d
ffff80000010ebca: 41 8a 04 24          	movb	(%r12), %al
ffff80000010ebce: 84 c0                	testb	%al, %al
ffff80000010ebd0: 74 49                	je	0xffff80000010ec1b <vprintfmt+0x41b>
ffff80000010ebd2: 49 83 c4 01          	addq	$1, %r12
ffff80000010ebd6: 8b 5d a8             	movl	-88(%rbp), %ebx
ffff80000010ebd9: eb 35                	jmp	0xffff80000010ec10 <vprintfmt+0x410>
ffff80000010ebdb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010ebe0: 0f be c0             	movsbl	%al, %eax
ffff80000010ebe3: 8d 48 81             	leal	-127(%rax), %ecx
ffff80000010ebe6: 80 f9 a1             	cmpb	$-95, %cl
ffff80000010ebe9: 89 c7                	movl	%eax, %edi
ffff80000010ebeb: b9 3f 00 00 00       	movl	$63, %ecx
ffff80000010ebf0: 0f 42 f9             	cmovbl	%ecx, %edi
ffff80000010ebf3: 85 db                	testl	%ebx, %ebx
ffff80000010ebf5: 0f 44 f8             	cmovel	%eax, %edi
ffff80000010ebf8: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010ebfc: ff 55 c8             	callq	*-56(%rbp)
ffff80000010ebff: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010ec03: 41 0f b6 04 24       	movzbl	(%r12), %eax
ffff80000010ec08: 49 83 c4 01          	addq	$1, %r12
ffff80000010ec0c: 84 c0                	testb	%al, %al
ffff80000010ec0e: 74 0b                	je	0xffff80000010ec1b <vprintfmt+0x41b>
ffff80000010ec10: 45 85 ff             	testl	%r15d, %r15d
ffff80000010ec13: 78 cb                	js	0xffff80000010ebe0 <vprintfmt+0x3e0>
ffff80000010ec15: 41 83 ef 01          	subl	$1, %r15d
ffff80000010ec19: 73 c5                	jae	0xffff80000010ebe0 <vprintfmt+0x3e0>
ffff80000010ec1b: 49 83 c6 01          	addq	$1, %r14
ffff80000010ec1f: 45 85 ed             	testl	%r13d, %r13d
ffff80000010ec22: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ec26: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010ec2a: 0f 8e 4f fc ff ff    	jle	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010ec30: 41 83 c5 01          	addl	$1, %r13d
ffff80000010ec34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ec3e: 66 90                	nop
ffff80000010ec40: bf 20 00 00 00       	movl	$32, %edi
ffff80000010ec45: 48 89 de             	movq	%rbx, %rsi
ffff80000010ec48: 41 ff d7             	callq	*%r15
ffff80000010ec4b: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010ec4f: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010ec53: 7f eb                	jg	0xffff80000010ec40 <vprintfmt+0x440>
ffff80000010ec55: e9 25 fc ff ff       	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010ec5a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ec5e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ec62: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ec66: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010ec6a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ec6e: 49 83 c6 01          	addq	$1, %r14
ffff80000010ec72: 8b 38                	movl	(%rax), %edi
ffff80000010ec74: e9 1c fc ff ff       	jmp	0xffff80000010e895 <vprintfmt+0x95>
ffff80000010ec79: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ec7d: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ec81: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ec85: 4c 8b 20             	movq	(%rax), %r12
ffff80000010ec88: e9 c1 fb ff ff       	jmp	0xffff80000010e84e <vprintfmt+0x4e>
ffff80000010ec8d: 89 c8                	movl	%ecx, %eax
ffff80000010ec8f: 48 b9 a0 05 11 00 00 80 ff ff	movabsq	$-140737487239776, %rcx # imm = 0xFFFF8000001105A0
ffff80000010ec99: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff80000010ec9d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010eca0: 48 ba 64 09 11 00 00 80 ff ff	movabsq	$-140737487238812, %rdx # imm = 0xFFFF800000110964
ffff80000010ecaa: 31 c0                	xorl	%eax, %eax
ffff80000010ecac: 49 89 f4             	movq	%rsi, %r12
ffff80000010ecaf: 48 bb e0 ec 10 00 00 80 ff ff	movabsq	$-140737487246112, %rbx # imm = 0xFFFF80000010ECE0
ffff80000010ecb9: ff d3                	callq	*%rbx
ffff80000010ecbb: 4c 89 e3             	movq	%r12, %rbx
ffff80000010ecbe: e9 bc fb ff ff       	jmp	0xffff80000010e87f <vprintfmt+0x7f>
ffff80000010ecc3: 48 83 c4 38          	addq	$56, %rsp
ffff80000010ecc7: 5b                   	popq	%rbx
ffff80000010ecc8: 41 5c                	popq	%r12
ffff80000010ecca: 41 5d                	popq	%r13
ffff80000010eccc: 41 5e                	popq	%r14
ffff80000010ecce: 41 5f                	popq	%r15
ffff80000010ecd0: 5d                   	popq	%rbp
ffff80000010ecd1: c3                   	retq
ffff80000010ecd2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ecdc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010ece0 <printfmt>:
ffff80000010ece0: 55                   	pushq	%rbp
ffff80000010ece1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ece4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010ece8: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010ecec: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010ecf0: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010ecf4: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff80000010ecf8: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010ecfc: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010ed00: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010ed04: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010ed0e: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010ed12: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff80000010ed1c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010ed20: ff d0                	callq	*%rax
ffff80000010ed22: 48 83 c4 50          	addq	$80, %rsp
ffff80000010ed26: 5d                   	popq	%rbp
ffff80000010ed27: c3                   	retq
ffff80000010ed28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010ed30 <getint>:
ffff80000010ed30: 55                   	pushq	%rbp
ffff80000010ed31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ed34: 83 fe 02             	cmpl	$2, %esi
ffff80000010ed37: 7c 17                	jl	0xffff80000010ed50 <getint+0x20>
ffff80000010ed39: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ed3c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010ed40: 77 2b                	ja	0xffff80000010ed6d <getint+0x3d>
ffff80000010ed42: 48 89 c1             	movq	%rax, %rcx
ffff80000010ed45: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ed49: 83 c0 08             	addl	$8, %eax
ffff80000010ed4c: 89 07                	movl	%eax, (%rdi)
ffff80000010ed4e: eb 18                	jmp	0xffff80000010ed68 <getint+0x38>
ffff80000010ed50: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ed53: 85 f6                	testl	%esi, %esi
ffff80000010ed55: 74 27                	je	0xffff80000010ed7e <getint+0x4e>
ffff80000010ed57: 83 f8 28             	cmpl	$40, %eax
ffff80000010ed5a: 77 11                	ja	0xffff80000010ed6d <getint+0x3d>
ffff80000010ed5c: 48 8b 4f 10          	movq	16(%rdi), %rcx
ffff80000010ed60: 48 01 c1             	addq	%rax, %rcx
ffff80000010ed63: 83 c0 08             	addl	$8, %eax
ffff80000010ed66: 89 07                	movl	%eax, (%rdi)
ffff80000010ed68: 48 8b 01             	movq	(%rcx), %rax
ffff80000010ed6b: 5d                   	popq	%rbp
ffff80000010ed6c: c3                   	retq
ffff80000010ed6d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010ed71: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ed75: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010ed79: 48 8b 00             	movq	(%rax), %rax
ffff80000010ed7c: 5d                   	popq	%rbp
ffff80000010ed7d: c3                   	retq
ffff80000010ed7e: 83 f8 28             	cmpl	$40, %eax
ffff80000010ed81: 77 0e                	ja	0xffff80000010ed91 <getint+0x61>
ffff80000010ed83: 48 89 c1             	movq	%rax, %rcx
ffff80000010ed86: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ed8a: 83 c0 08             	addl	$8, %eax
ffff80000010ed8d: 89 07                	movl	%eax, (%rdi)
ffff80000010ed8f: eb 0c                	jmp	0xffff80000010ed9d <getint+0x6d>
ffff80000010ed91: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010ed95: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010ed99: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010ed9d: 48 63 01             	movslq	(%rcx), %rax
ffff80000010eda0: 5d                   	popq	%rbp
ffff80000010eda1: c3                   	retq
ffff80000010eda2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010edac: 0f 1f 40 00          	nopl	(%rax)

ffff80000010edb0 <getuint>:
ffff80000010edb0: 55                   	pushq	%rbp
ffff80000010edb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010edb4: 83 fe 02             	cmpl	$2, %esi
ffff80000010edb7: 7c 17                	jl	0xffff80000010edd0 <getuint+0x20>
ffff80000010edb9: 48 63 07             	movslq	(%rdi), %rax
ffff80000010edbc: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010edc0: 77 2b                	ja	0xffff80000010eded <getuint+0x3d>
ffff80000010edc2: 48 89 c1             	movq	%rax, %rcx
ffff80000010edc5: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010edc9: 83 c0 08             	addl	$8, %eax
ffff80000010edcc: 89 07                	movl	%eax, (%rdi)
ffff80000010edce: eb 18                	jmp	0xffff80000010ede8 <getuint+0x38>
ffff80000010edd0: 48 63 07             	movslq	(%rdi), %rax
ffff80000010edd3: 85 f6                	testl	%esi, %esi
ffff80000010edd5: 74 27                	je	0xffff80000010edfe <getuint+0x4e>
ffff80000010edd7: 83 f8 28             	cmpl	$40, %eax
ffff80000010edda: 77 11                	ja	0xffff80000010eded <getuint+0x3d>
ffff80000010eddc: 48 8b 4f 10          	movq	16(%rdi), %rcx
ffff80000010ede0: 48 01 c1             	addq	%rax, %rcx
ffff80000010ede3: 83 c0 08             	addl	$8, %eax
ffff80000010ede6: 89 07                	movl	%eax, (%rdi)
ffff80000010ede8: 48 8b 01             	movq	(%rcx), %rax
ffff80000010edeb: 5d                   	popq	%rbp
ffff80000010edec: c3                   	retq
ffff80000010eded: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010edf1: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010edf5: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010edf9: 48 8b 00             	movq	(%rax), %rax
ffff80000010edfc: 5d                   	popq	%rbp
ffff80000010edfd: c3                   	retq
ffff80000010edfe: 83 f8 28             	cmpl	$40, %eax
ffff80000010ee01: 77 0e                	ja	0xffff80000010ee11 <getuint+0x61>
ffff80000010ee03: 48 89 c1             	movq	%rax, %rcx
ffff80000010ee06: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ee0a: 83 c0 08             	addl	$8, %eax
ffff80000010ee0d: 89 07                	movl	%eax, (%rdi)
ffff80000010ee0f: eb 0c                	jmp	0xffff80000010ee1d <getuint+0x6d>
ffff80000010ee11: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010ee15: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010ee19: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010ee1d: 8b 01                	movl	(%rcx), %eax
ffff80000010ee1f: 5d                   	popq	%rbp
ffff80000010ee20: c3                   	retq
ffff80000010ee21: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ee2b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ee30 <printnum>:
ffff80000010ee30: 55                   	pushq	%rbp
ffff80000010ee31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ee34: 41 57                	pushq	%r15
ffff80000010ee36: 41 56                	pushq	%r14
ffff80000010ee38: 41 55                	pushq	%r13
ffff80000010ee3a: 41 54                	pushq	%r12
ffff80000010ee3c: 53                   	pushq	%rbx
ffff80000010ee3d: 50                   	pushq	%rax
ffff80000010ee3e: 45 89 cd             	movl	%r9d, %r13d
ffff80000010ee41: 44 89 c3             	movl	%r8d, %ebx
ffff80000010ee44: 49 89 f6             	movq	%rsi, %r14
ffff80000010ee47: 49 89 fc             	movq	%rdi, %r12
ffff80000010ee4a: 41 89 cf             	movl	%ecx, %r15d
ffff80000010ee4d: 49 39 d7             	cmpq	%rdx, %r15
ffff80000010ee50: 48 89 55 d0          	movq	%rdx, -48(%rbp)
ffff80000010ee54: 76 1d                	jbe	0xffff80000010ee73 <printnum+0x43>
ffff80000010ee56: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ee59: 7c 3f                	jl	0xffff80000010ee9a <printnum+0x6a>
ffff80000010ee5b: 83 c3 01             	addl	$1, %ebx
ffff80000010ee5e: 66 90                	nop
ffff80000010ee60: 44 89 ef             	movl	%r13d, %edi
ffff80000010ee63: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ee66: 41 ff d4             	callq	*%r12
ffff80000010ee69: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ee6c: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ee6f: 7f ef                	jg	0xffff80000010ee60 <printnum+0x30>
ffff80000010ee71: eb 27                	jmp	0xffff80000010ee9a <printnum+0x6a>
ffff80000010ee73: 48 89 d0             	movq	%rdx, %rax
ffff80000010ee76: 31 d2                	xorl	%edx, %edx
ffff80000010ee78: 49 f7 f7             	divq	%r15
ffff80000010ee7b: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ee7e: 49 ba 30 ee 10 00 00 80 ff ff	movabsq	$-140737487245776, %r10 # imm = 0xFFFF80000010EE30
ffff80000010ee88: 4c 89 e7             	movq	%r12, %rdi
ffff80000010ee8b: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ee8e: 48 89 c2             	movq	%rax, %rdx
ffff80000010ee91: 41 89 d8             	movl	%ebx, %r8d
ffff80000010ee94: 45 89 e9             	movl	%r13d, %r9d
ffff80000010ee97: 41 ff d2             	callq	*%r10
ffff80000010ee9a: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000010ee9e: 31 d2                	xorl	%edx, %edx
ffff80000010eea0: 49 f7 f7             	divq	%r15
ffff80000010eea3: 48 b8 0c 0d 11 00 00 80 ff ff	movabsq	$-140737487237876, %rax # imm = 0xFFFF800000110D0C
ffff80000010eead: 0f be 3c 02          	movsbl	(%rdx,%rax), %edi
ffff80000010eeb1: 4c 89 f6             	movq	%r14, %rsi
ffff80000010eeb4: 41 ff d4             	callq	*%r12
ffff80000010eeb7: 48 83 c4 08          	addq	$8, %rsp
ffff80000010eebb: 5b                   	popq	%rbx
ffff80000010eebc: 41 5c                	popq	%r12
ffff80000010eebe: 41 5d                	popq	%r13
ffff80000010eec0: 41 5e                	popq	%r14
ffff80000010eec2: 41 5f                	popq	%r15
ffff80000010eec4: 5d                   	popq	%rbp
ffff80000010eec5: c3                   	retq
ffff80000010eec6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010eed0 <vsnprintf>:
ffff80000010eed0: 55                   	pushq	%rbp
ffff80000010eed1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eed4: 48 83 ec 20          	subq	$32, %rsp
ffff80000010eed8: 48 89 7d e8          	movq	%rdi, -24(%rbp)
ffff80000010eedc: 48 63 c6             	movslq	%esi, %rax
ffff80000010eedf: 48 01 f8             	addq	%rdi, %rax
ffff80000010eee2: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010eee6: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010eeea: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010eef1: b8 fb ff ff ff       	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
ffff80000010eef6: 48 85 ff             	testq	%rdi, %rdi
ffff80000010eef9: 74 28                	je	0xffff80000010ef23 <vsnprintf+0x53>
ffff80000010eefb: 85 f6                	testl	%esi, %esi
ffff80000010eefd: 7e 24                	jle	0xffff80000010ef23 <vsnprintf+0x53>
ffff80000010eeff: 48 bf 30 ef 10 00 00 80 ff ff	movabsq	$-140737487245520, %rdi # imm = 0xFFFF80000010EF30
ffff80000010ef09: 48 b8 00 e8 10 00 00 80 ff ff	movabsq	$-140737487247360, %rax # imm = 0xFFFF80000010E800
ffff80000010ef13: 48 8d 75 e8          	leaq	-24(%rbp), %rsi
ffff80000010ef17: ff d0                	callq	*%rax
ffff80000010ef19: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010ef1d: c6 00 00             	movb	$0, (%rax)
ffff80000010ef20: 8b 45 f8             	movl	-8(%rbp), %eax
ffff80000010ef23: 48 83 c4 20          	addq	$32, %rsp
ffff80000010ef27: 5d                   	popq	%rbp
ffff80000010ef28: c3                   	retq
ffff80000010ef29: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ef30 <sprintputch>:
ffff80000010ef30: 55                   	pushq	%rbp
ffff80000010ef31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ef34: 83 46 10 01          	addl	$1, 16(%rsi)
ffff80000010ef38: 48 8b 06             	movq	(%rsi), %rax
ffff80000010ef3b: 48 3b 46 08          	cmpq	8(%rsi), %rax
ffff80000010ef3f: 73 0a                	jae	0xffff80000010ef4b <sprintputch+0x1b>
ffff80000010ef41: 48 8d 48 01          	leaq	1(%rax), %rcx
ffff80000010ef45: 48 89 0e             	movq	%rcx, (%rsi)
ffff80000010ef48: 40 88 38             	movb	%dil, (%rax)
ffff80000010ef4b: 5d                   	popq	%rbp
ffff80000010ef4c: c3                   	retq
ffff80000010ef4d: 0f 1f 00             	nopl	(%rax)

ffff80000010ef50 <snprintf>:
ffff80000010ef50: 55                   	pushq	%rbp
ffff80000010ef51: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ef54: 48 83 ec 50          	subq	$80, %rsp
ffff80000010ef58: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010ef5c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010ef60: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010ef64: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff80000010ef68: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010ef6c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010ef70: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010ef74: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010ef7e: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010ef82: 48 b8 d0 ee 10 00 00 80 ff ff	movabsq	$-140737487245616, %rax # imm = 0xFFFF80000010EED0
ffff80000010ef8c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010ef90: ff d0                	callq	*%rax
ffff80000010ef92: 48 83 c4 50          	addq	$80, %rsp
ffff80000010ef96: 5d                   	popq	%rbp
ffff80000010ef97: c3                   	retq
ffff80000010ef98: cc                   	int3
ffff80000010ef99: cc                   	int3
ffff80000010ef9a: cc                   	int3
ffff80000010ef9b: cc                   	int3
ffff80000010ef9c: cc                   	int3
ffff80000010ef9d: cc                   	int3
ffff80000010ef9e: cc                   	int3
ffff80000010ef9f: cc                   	int3

ffff80000010efa0 <rb_first>:
ffff80000010efa0: 55                   	pushq	%rbp
ffff80000010efa1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010efa4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010efa7: 48 b8 c0 ef 10 00 00 80 ff ff	movabsq	$-140737487245376, %rax # imm = 0xFFFF80000010EFC0
ffff80000010efb1: 31 f6                	xorl	%esi, %esi
ffff80000010efb3: ff d0                	callq	*%rax
ffff80000010efb5: 5d                   	popq	%rbp
ffff80000010efb6: c3                   	retq
ffff80000010efb7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010efc0 <get_outermost>:
ffff80000010efc0: 55                   	pushq	%rbp
ffff80000010efc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010efc4: 48 85 ff             	testq	%rdi, %rdi
ffff80000010efc7: 74 16                	je	0xffff80000010efdf <get_outermost+0x1f>
ffff80000010efc9: 89 f1                	movl	%esi, %ecx
ffff80000010efcb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010efd0: 48 89 f8             	movq	%rdi, %rax
ffff80000010efd3: 48 8b 7c cf 08       	movq	8(%rdi,%rcx,8), %rdi
ffff80000010efd8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010efdb: 75 f3                	jne	0xffff80000010efd0 <get_outermost+0x10>
ffff80000010efdd: 5d                   	popq	%rbp
ffff80000010efde: c3                   	retq
ffff80000010efdf: 31 c0                	xorl	%eax, %eax
ffff80000010efe1: 5d                   	popq	%rbp
ffff80000010efe2: c3                   	retq
ffff80000010efe3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010efed: 0f 1f 00             	nopl	(%rax)

ffff80000010eff0 <rb_last>:
ffff80000010eff0: 55                   	pushq	%rbp
ffff80000010eff1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010eff4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010eff7: 48 b8 c0 ef 10 00 00 80 ff ff	movabsq	$-140737487245376, %rax # imm = 0xFFFF80000010EFC0
ffff80000010f001: be 01 00 00 00       	movl	$1, %esi
ffff80000010f006: ff d0                	callq	*%rax
ffff80000010f008: 5d                   	popq	%rbp
ffff80000010f009: c3                   	retq
ffff80000010f00a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010f010 <rb_next>:
ffff80000010f010: 55                   	pushq	%rbp
ffff80000010f011: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f014: 48 b8 30 f0 10 00 00 80 ff ff	movabsq	$-140737487245264, %rax # imm = 0xFFFF80000010F030
ffff80000010f01e: be 01 00 00 00       	movl	$1, %esi
ffff80000010f023: ff d0                	callq	*%rax
ffff80000010f025: 5d                   	popq	%rbp
ffff80000010f026: c3                   	retq
ffff80000010f027: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010f030 <get_closest>:
ffff80000010f030: 55                   	pushq	%rbp
ffff80000010f031: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f034: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f037: 74 3b                	je	0xffff80000010f074 <get_closest+0x44>
ffff80000010f039: 89 f1                	movl	%esi, %ecx
ffff80000010f03b: 48 8b 44 cf 08       	movq	8(%rdi,%rcx,8), %rax
ffff80000010f040: 48 85 c0             	testq	%rax, %rax
ffff80000010f043: 74 25                	je	0xffff80000010f06a <get_closest+0x3a>
ffff80000010f045: 31 c9                	xorl	%ecx, %ecx
ffff80000010f047: 85 f6                	testl	%esi, %esi
ffff80000010f049: 0f 94 c1             	sete	%cl
ffff80000010f04c: 48 ba c0 ef 10 00 00 80 ff ff	movabsq	$-140737487245376, %rdx # imm = 0xFFFF80000010EFC0
ffff80000010f056: 48 89 c7             	movq	%rax, %rdi
ffff80000010f059: 89 ce                	movl	%ecx, %esi
ffff80000010f05b: ff d2                	callq	*%rdx
ffff80000010f05d: 5d                   	popq	%rbp
ffff80000010f05e: c3                   	retq
ffff80000010f05f: 90                   	nop
ffff80000010f060: 48 39 7c c8 08       	cmpq	%rdi, 8(%rax,%rcx,8)
ffff80000010f065: 48 89 c7             	movq	%rax, %rdi
ffff80000010f068: 75 08                	jne	0xffff80000010f072 <get_closest+0x42>
ffff80000010f06a: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f06d: 48 85 c0             	testq	%rax, %rax
ffff80000010f070: 75 ee                	jne	0xffff80000010f060 <get_closest+0x30>
ffff80000010f072: 5d                   	popq	%rbp
ffff80000010f073: c3                   	retq
ffff80000010f074: 31 c0                	xorl	%eax, %eax
ffff80000010f076: 5d                   	popq	%rbp
ffff80000010f077: c3                   	retq
ffff80000010f078: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f080 <rb_prev>:
ffff80000010f080: 55                   	pushq	%rbp
ffff80000010f081: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f084: 48 b8 30 f0 10 00 00 80 ff ff	movabsq	$-140737487245264, %rax # imm = 0xFFFF80000010F030
ffff80000010f08e: 31 f6                	xorl	%esi, %esi
ffff80000010f090: ff d0                	callq	*%rax
ffff80000010f092: 5d                   	popq	%rbp
ffff80000010f093: c3                   	retq
ffff80000010f094: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f09e: 66 90                	nop

ffff80000010f0a0 <rb_balance>:
ffff80000010f0a0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010f0a5: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f0a8: 0f 84 f0 00 00 00    	je	0xffff80000010f19e <rb_balance+0xfe>
ffff80000010f0ae: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f0b1: 0f 84 e7 00 00 00    	je	0xffff80000010f19e <rb_balance+0xfe>
ffff80000010f0b7: 55                   	pushq	%rbp
ffff80000010f0b8: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f0bb: 41 57                	pushq	%r15
ffff80000010f0bd: 41 56                	pushq	%r14
ffff80000010f0bf: 41 55                	pushq	%r13
ffff80000010f0c1: 41 54                	pushq	%r12
ffff80000010f0c3: 53                   	pushq	%rbx
ffff80000010f0c4: 50                   	pushq	%rax
ffff80000010f0c5: 49 89 fe             	movq	%rdi, %r14
ffff80000010f0c8: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
ffff80000010f0cf: 48 8b 1e             	movq	(%rsi), %rbx
ffff80000010f0d2: 48 85 db             	testq	%rbx, %rbx
ffff80000010f0d5: 0f 84 a9 00 00 00    	je	0xffff80000010f184 <rb_balance+0xe4>
ffff80000010f0db: 49 bd a0 f1 10 00 00 80 ff ff	movabsq	$-140737487244896, %r13 # imm = 0xFFFF80000010F1A0
ffff80000010f0e5: eb 2a                	jmp	0xffff80000010f111 <rb_balance+0x71>
ffff80000010f0e7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
ffff80000010f0f0: c7 43 18 00 00 00 00 	movl	$0, 24(%rbx)
ffff80000010f0f7: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
ffff80000010f0fe: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
ffff80000010f106: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010f109: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f10c: 48 85 db             	testq	%rbx, %rbx
ffff80000010f10f: 74 73                	je	0xffff80000010f184 <rb_balance+0xe4>
ffff80000010f111: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f115: 75 6d                	jne	0xffff80000010f184 <rb_balance+0xe4>
ffff80000010f117: 4c 8b 3b             	movq	(%rbx), %r15
ffff80000010f11a: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010f11e: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f121: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f124: 41 0f 94 c4          	sete	%r12b
ffff80000010f128: 4b 8b 4c e7 08       	movq	8(%r15,%r12,8), %rcx
ffff80000010f12d: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f130: 74 06                	je	0xffff80000010f138 <rb_balance+0x98>
ffff80000010f132: 83 79 18 01          	cmpl	$1, 24(%rcx)
ffff80000010f136: 74 b8                	je	0xffff80000010f0f0 <rb_balance+0x50>
ffff80000010f138: 4a 39 74 e3 08       	cmpq	%rsi, 8(%rbx,%r12,8)
ffff80000010f13d: 74 11                	je	0xffff80000010f150 <rb_balance+0xb0>
ffff80000010f13f: 48 89 d8             	movq	%rbx, %rax
ffff80000010f142: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f145: eb 1d                	jmp	0xffff80000010f164 <rb_balance+0xc4>
ffff80000010f147: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
ffff80000010f150: 31 d2                	xorl	%edx, %edx
ffff80000010f152: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f155: 0f 95 c2             	setne	%dl
ffff80000010f158: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f15b: 48 89 de             	movq	%rbx, %rsi
ffff80000010f15e: 41 ff d5             	callq	*%r13
ffff80000010f161: 48 8b 03             	movq	(%rbx), %rax
ffff80000010f164: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f16b: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
ffff80000010f173: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f176: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f179: 44 89 e2             	movl	%r12d, %edx
ffff80000010f17c: 41 ff d5             	callq	*%r13
ffff80000010f17f: 49 89 df             	movq	%rbx, %r15
ffff80000010f182: eb 82                	jmp	0xffff80000010f106 <rb_balance+0x66>
ffff80000010f184: 49 8b 06             	movq	(%r14), %rax
ffff80000010f187: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f18e: 31 c0                	xorl	%eax, %eax
ffff80000010f190: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f194: 5b                   	popq	%rbx
ffff80000010f195: 41 5c                	popq	%r12
ffff80000010f197: 41 5d                	popq	%r13
ffff80000010f199: 41 5e                	popq	%r14
ffff80000010f19b: 41 5f                	popq	%r15
ffff80000010f19d: 5d                   	popq	%rbp
ffff80000010f19e: c3                   	retq
ffff80000010f19f: 90                   	nop

ffff80000010f1a0 <rotate_node>:
ffff80000010f1a0: 55                   	pushq	%rbp
ffff80000010f1a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f1a4: 4c 8b 06             	movq	(%rsi), %r8
ffff80000010f1a7: 31 c9                	xorl	%ecx, %ecx
ffff80000010f1a9: 85 d2                	testl	%edx, %edx
ffff80000010f1ab: 0f 94 c1             	sete	%cl
ffff80000010f1ae: 48 8b 44 ce 08       	movq	8(%rsi,%rcx,8), %rax
ffff80000010f1b3: 41 89 d1             	movl	%edx, %r9d
ffff80000010f1b6: 4a 8b 54 c8 08       	movq	8(%rax,%r9,8), %rdx
ffff80000010f1bb: 48 89 54 ce 08       	movq	%rdx, 8(%rsi,%rcx,8)
ffff80000010f1c0: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f1c3: 74 08                	je	0xffff80000010f1cd <rotate_node+0x2d>
ffff80000010f1c5: 4a 8b 4c c8 08       	movq	8(%rax,%r9,8), %rcx
ffff80000010f1ca: 48 89 31             	movq	%rsi, (%rcx)
ffff80000010f1cd: 4a 89 74 c8 08       	movq	%rsi, 8(%rax,%r9,8)
ffff80000010f1d2: 4c 89 00             	movq	%r8, (%rax)
ffff80000010f1d5: 4d 85 c0             	testq	%r8, %r8
ffff80000010f1d8: 74 11                	je	0xffff80000010f1eb <rotate_node+0x4b>
ffff80000010f1da: 31 c9                	xorl	%ecx, %ecx
ffff80000010f1dc: 49 39 70 10          	cmpq	%rsi, 16(%r8)
ffff80000010f1e0: 0f 94 c1             	sete	%cl
ffff80000010f1e3: 49 8d 3c c8          	leaq	(%r8,%rcx,8), %rdi
ffff80000010f1e7: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f1eb: 48 89 07             	movq	%rax, (%rdi)
ffff80000010f1ee: 48 89 06             	movq	%rax, (%rsi)
ffff80000010f1f1: 5d                   	popq	%rbp
ffff80000010f1f2: c3                   	retq
ffff80000010f1f3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f1fd: 0f 1f 00             	nopl	(%rax)

ffff80000010f200 <rb_remove>:
ffff80000010f200: 55                   	pushq	%rbp
ffff80000010f201: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f204: 41 57                	pushq	%r15
ffff80000010f206: 41 56                	pushq	%r14
ffff80000010f208: 41 55                	pushq	%r13
ffff80000010f20a: 41 54                	pushq	%r12
ffff80000010f20c: 53                   	pushq	%rbx
ffff80000010f20d: 50                   	pushq	%rax
ffff80000010f20e: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010f213: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f216: 0f 84 b9 01 00 00    	je	0xffff80000010f3d5 <rb_remove+0x1d5>
ffff80000010f21c: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f21f: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f222: 0f 84 ad 01 00 00    	je	0xffff80000010f3d5 <rb_remove+0x1d5>
ffff80000010f228: 49 89 ff             	movq	%rdi, %r15
ffff80000010f22b: 31 c0                	xorl	%eax, %eax
ffff80000010f22d: 31 c9                	xorl	%ecx, %ecx
ffff80000010f22f: 48 83 7b 08 00       	cmpq	$0, 8(%rbx)
ffff80000010f234: 0f 95 c0             	setne	%al
ffff80000010f237: 0f 94 c1             	sete	%cl
ffff80000010f23a: 4c 8b 6c cb 08       	movq	8(%rbx,%rcx,8), %r13
ffff80000010f23f: 4c 8b 74 c3 08       	movq	8(%rbx,%rax,8), %r14
ffff80000010f244: 48 b8 f0 f3 10 00 00 80 ff ff	movabsq	$-140737487244304, %rax # imm = 0xFFFF80000010F3F0
ffff80000010f24e: 48 89 de             	movq	%rbx, %rsi
ffff80000010f251: ff d0                	callq	*%rax
ffff80000010f253: 31 c0                	xorl	%eax, %eax
ffff80000010f255: 4d 09 ee             	orq	%r13, %r14
ffff80000010f258: 0f 84 77 01 00 00    	je	0xffff80000010f3d5 <rb_remove+0x1d5>
ffff80000010f25e: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f262: 0f 84 6d 01 00 00    	je	0xffff80000010f3d5 <rb_remove+0x1d5>
ffff80000010f268: 41 83 7d 18 01       	cmpl	$1, 24(%r13)
ffff80000010f26d: 75 09                	jne	0xffff80000010f278 <rb_remove+0x78>
ffff80000010f26f: 49 83 c5 18          	addq	$24, %r13
ffff80000010f273: e9 51 01 00 00       	jmp	0xffff80000010f3c9 <rb_remove+0x1c9>
ffff80000010f278: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f27c: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f27f: 0f 84 39 01 00 00    	je	0xffff80000010f3be <rb_remove+0x1be>
ffff80000010f285: 48 b9 a0 f1 10 00 00 80 ff ff	movabsq	$-140737487244896, %rcx # imm = 0xFFFF80000010F1A0
ffff80000010f28f: eb 31                	jmp	0xffff80000010f2c2 <rb_remove+0xc2>
ffff80000010f291: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f29b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f2a0: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010f2a7: 48 b9 a0 f1 10 00 00 80 ff ff	movabsq	$-140737487244896, %rcx # imm = 0xFFFF80000010F1A0
ffff80000010f2b1: 4d 8b 6d 00          	movq	(%r13), %r13
ffff80000010f2b5: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f2b9: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f2bc: 0f 84 fc 00 00 00    	je	0xffff80000010f3be <rb_remove+0x1be>
ffff80000010f2c2: 4c 8b 76 08          	movq	8(%rsi), %r14
ffff80000010f2c6: 31 db                	xorl	%ebx, %ebx
ffff80000010f2c8: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f2cb: 0f 94 c3             	sete	%bl
ffff80000010f2ce: 48 8b 44 de 08       	movq	8(%rsi,%rbx,8), %rax
ffff80000010f2d3: 48 85 c0             	testq	%rax, %rax
ffff80000010f2d6: 0f 84 e2 00 00 00    	je	0xffff80000010f3be <rb_remove+0x1be>
ffff80000010f2dc: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000010f2e0: 75 24                	jne	0xffff80000010f306 <rb_remove+0x106>
ffff80000010f2e2: 31 d2                	xorl	%edx, %edx
ffff80000010f2e4: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f2e7: 0f 95 c2             	setne	%dl
ffff80000010f2ea: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
ffff80000010f2f1: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f2f8: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f2fb: ff d1                	callq	*%rcx
ffff80000010f2fd: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f301: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010f306: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f309: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f30c: 41 0f 95 c4          	setne	%r12b
ffff80000010f310: 4a 8b 4c e0 08       	movq	8(%rax,%r12,8), %rcx
ffff80000010f315: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f318: 74 06                	je	0xffff80000010f320 <rb_remove+0x120>
ffff80000010f31a: 83 79 18 00          	cmpl	$0, 24(%rcx)
ffff80000010f31e: 75 18                	jne	0xffff80000010f338 <rb_remove+0x138>
ffff80000010f320: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f325: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f328: 0f 84 72 ff ff ff    	je	0xffff80000010f2a0 <rb_remove+0xa0>
ffff80000010f32e: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010f332: 0f 84 68 ff ff ff    	je	0xffff80000010f2a0 <rb_remove+0xa0>
ffff80000010f338: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f33d: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f340: 74 1e                	je	0xffff80000010f360 <rb_remove+0x160>
ffff80000010f342: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010f346: 74 18                	je	0xffff80000010f360 <rb_remove+0x160>
ffff80000010f348: 49 be a0 f1 10 00 00 80 ff ff	movabsq	$-140737487244896, %r14 # imm = 0xFFFF80000010F1A0
ffff80000010f352: eb 39                	jmp	0xffff80000010f38d <rb_remove+0x18d>
ffff80000010f354: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f35e: 66 90                	nop
ffff80000010f360: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010f367: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
ffff80000010f36e: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f372: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f375: 89 da                	movl	%ebx, %edx
ffff80000010f377: 49 be a0 f1 10 00 00 80 ff ff	movabsq	$-140737487244896, %r14 # imm = 0xFFFF80000010F1A0
ffff80000010f381: 41 ff d6             	callq	*%r14
ffff80000010f384: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f388: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010f38d: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f391: 8b 4e 18             	movl	24(%rsi), %ecx
ffff80000010f394: 89 48 18             	movl	%ecx, 24(%rax)
ffff80000010f397: c7 46 18 00 00 00 00 	movl	$0, 24(%rsi)
ffff80000010f39e: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010f3a3: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f3aa: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f3ad: 44 89 e2             	movl	%r12d, %edx
ffff80000010f3b0: 41 ff d6             	callq	*%r14
ffff80000010f3b3: 4d 89 fd             	movq	%r15, %r13
ffff80000010f3b6: 4c 89 f1             	movq	%r14, %rcx
ffff80000010f3b9: e9 f3 fe ff ff       	jmp	0xffff80000010f2b1 <rb_remove+0xb1>
ffff80000010f3be: 4d 85 ed             	testq	%r13, %r13
ffff80000010f3c1: 74 10                	je	0xffff80000010f3d3 <rb_remove+0x1d3>
ffff80000010f3c3: 49 83 c5 18          	addq	$24, %r13
ffff80000010f3c7: 31 c0                	xorl	%eax, %eax
ffff80000010f3c9: 41 c7 45 00 00 00 00 00      	movl	$0, (%r13)
ffff80000010f3d1: eb 02                	jmp	0xffff80000010f3d5 <rb_remove+0x1d5>
ffff80000010f3d3: 31 c0                	xorl	%eax, %eax
ffff80000010f3d5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f3d9: 5b                   	popq	%rbx
ffff80000010f3da: 41 5c                	popq	%r12
ffff80000010f3dc: 41 5d                	popq	%r13
ffff80000010f3de: 41 5e                	popq	%r14
ffff80000010f3e0: 41 5f                	popq	%r15
ffff80000010f3e2: 5d                   	popq	%rbp
ffff80000010f3e3: c3                   	retq
ffff80000010f3e4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f3ee: 66 90                	nop

ffff80000010f3f0 <do_remove>:
ffff80000010f3f0: 55                   	pushq	%rbp
ffff80000010f3f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f3f4: 41 57                	pushq	%r15
ffff80000010f3f6: 41 56                	pushq	%r14
ffff80000010f3f8: 41 54                	pushq	%r12
ffff80000010f3fa: 53                   	pushq	%rbx
ffff80000010f3fb: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f3fe: 0f 84 b7 00 00 00    	je	0xffff80000010f4bb <do_remove+0xcb>
ffff80000010f404: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f407: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f40a: 0f 84 ab 00 00 00    	je	0xffff80000010f4bb <do_remove+0xcb>
ffff80000010f410: 49 89 fe             	movq	%rdi, %r14
ffff80000010f413: 4c 8b 23             	movq	(%rbx), %r12
ffff80000010f416: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010f41a: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f41d: 74 57                	je	0xffff80000010f476 <do_remove+0x86>
ffff80000010f41f: 48 83 7b 10 00       	cmpq	$0, 16(%rbx)
ffff80000010f424: 74 50                	je	0xffff80000010f476 <do_remove+0x86>
ffff80000010f426: 48 b8 c0 ef 10 00 00 80 ff ff	movabsq	$-140737487245376, %rax # imm = 0xFFFF80000010EFC0
ffff80000010f430: be 01 00 00 00       	movl	$1, %esi
ffff80000010f435: ff d0                	callq	*%rax
ffff80000010f437: 49 89 c7             	movq	%rax, %r15
ffff80000010f43a: 48 b8 f0 f3 10 00 00 80 ff ff	movabsq	$-140737487244304, %rax # imm = 0xFFFF80000010F3F0
ffff80000010f444: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f447: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f44a: ff d0                	callq	*%rax
ffff80000010f44c: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f450: 49 89 47 08          	movq	%rax, 8(%r15)
ffff80000010f454: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f458: 48 85 c0             	testq	%rax, %rax
ffff80000010f45b: 74 03                	je	0xffff80000010f460 <do_remove+0x70>
ffff80000010f45d: 4c 89 38             	movq	%r15, (%rax)
ffff80000010f460: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f464: 49 89 47 10          	movq	%rax, 16(%r15)
ffff80000010f468: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f46c: 48 85 c0             	testq	%rax, %rax
ffff80000010f46f: 74 12                	je	0xffff80000010f483 <do_remove+0x93>
ffff80000010f471: 4c 89 38             	movq	%r15, (%rax)
ffff80000010f474: eb 0d                	jmp	0xffff80000010f483 <do_remove+0x93>
ffff80000010f476: 31 c0                	xorl	%eax, %eax
ffff80000010f478: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f47b: 0f 94 c0             	sete	%al
ffff80000010f47e: 4c 8b 7c c3 08       	movq	8(%rbx,%rax,8), %r15
ffff80000010f483: 4d 85 e4             	testq	%r12, %r12
ffff80000010f486: 74 12                	je	0xffff80000010f49a <do_remove+0xaa>
ffff80000010f488: 31 c0                	xorl	%eax, %eax
ffff80000010f48a: 49 39 5c 24 10       	cmpq	%rbx, 16(%r12)
ffff80000010f48f: 0f 94 c0             	sete	%al
ffff80000010f492: 4d 8d 34 c4          	leaq	(%r12,%rax,8), %r14
ffff80000010f496: 49 83 c6 08          	addq	$8, %r14
ffff80000010f49a: 4d 89 3e             	movq	%r15, (%r14)
ffff80000010f49d: 4d 85 ff             	testq	%r15, %r15
ffff80000010f4a0: 74 03                	je	0xffff80000010f4a5 <do_remove+0xb5>
ffff80000010f4a2: 4d 89 27             	movq	%r12, (%r15)
ffff80000010f4a5: 48 b8 90 f8 10 00 00 80 ff ff	movabsq	$-140737487243120, %rax # imm = 0xFFFF80000010F890
ffff80000010f4af: ba 20 00 00 00       	movl	$32, %edx
ffff80000010f4b4: 48 89 df             	movq	%rbx, %rdi
ffff80000010f4b7: 31 f6                	xorl	%esi, %esi
ffff80000010f4b9: ff d0                	callq	*%rax
ffff80000010f4bb: 5b                   	popq	%rbx
ffff80000010f4bc: 41 5c                	popq	%r12
ffff80000010f4be: 41 5e                	popq	%r14
ffff80000010f4c0: 41 5f                	popq	%r15
ffff80000010f4c2: 5d                   	popq	%rbp
ffff80000010f4c3: c3                   	retq
ffff80000010f4c4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f4ce: 66 90                	nop

ffff80000010f4d0 <rb_replace>:
ffff80000010f4d0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010f4d5: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f4d8: 74 5e                	je	0xffff80000010f538 <rb_replace+0x68>
ffff80000010f4da: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f4dd: 74 59                	je	0xffff80000010f538 <rb_replace+0x68>
ffff80000010f4df: 55                   	pushq	%rbp
ffff80000010f4e0: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f4e3: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f4e6: 48 85 c0             	testq	%rax, %rax
ffff80000010f4e9: 74 11                	je	0xffff80000010f4fc <rb_replace+0x2c>
ffff80000010f4eb: 31 c9                	xorl	%ecx, %ecx
ffff80000010f4ed: 48 39 70 10          	cmpq	%rsi, 16(%rax)
ffff80000010f4f1: 0f 94 c1             	sete	%cl
ffff80000010f4f4: 48 8d 3c c8          	leaq	(%rax,%rcx,8), %rdi
ffff80000010f4f8: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f4fc: 48 89 17             	movq	%rdx, (%rdi)
ffff80000010f4ff: 48 8b 46 08          	movq	8(%rsi), %rax
ffff80000010f503: 48 85 c0             	testq	%rax, %rax
ffff80000010f506: 74 03                	je	0xffff80000010f50b <rb_replace+0x3b>
ffff80000010f508: 48 89 10             	movq	%rdx, (%rax)
ffff80000010f50b: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f50f: 48 85 c0             	testq	%rax, %rax
ffff80000010f512: 74 03                	je	0xffff80000010f517 <rb_replace+0x47>
ffff80000010f514: 48 89 10             	movq	%rdx, (%rax)
ffff80000010f517: 48 8b 46 18          	movq	24(%rsi), %rax
ffff80000010f51b: 48 89 42 18          	movq	%rax, 24(%rdx)
ffff80000010f51f: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f523: 48 89 42 10          	movq	%rax, 16(%rdx)
ffff80000010f527: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f52a: 48 8b 4e 08          	movq	8(%rsi), %rcx
ffff80000010f52e: 48 89 4a 08          	movq	%rcx, 8(%rdx)
ffff80000010f532: 48 89 02             	movq	%rax, (%rdx)
ffff80000010f535: 31 c0                	xorl	%eax, %eax
ffff80000010f537: 5d                   	popq	%rbp
ffff80000010f538: c3                   	retq
ffff80000010f539: cc                   	int3
ffff80000010f53a: cc                   	int3
ffff80000010f53b: cc                   	int3
ffff80000010f53c: cc                   	int3
ffff80000010f53d: cc                   	int3
ffff80000010f53e: cc                   	int3
ffff80000010f53f: cc                   	int3

ffff80000010f540 <readline>:
ffff80000010f540: 55                   	pushq	%rbp
ffff80000010f541: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f544: 41 57                	pushq	%r15
ffff80000010f546: 41 56                	pushq	%r14
ffff80000010f548: 41 55                	pushq	%r13
ffff80000010f54a: 41 54                	pushq	%r12
ffff80000010f54c: 53                   	pushq	%rbx
ffff80000010f54d: 50                   	pushq	%rax
ffff80000010f54e: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010f558: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f55b: 74 11                	je	0xffff80000010f56e <readline+0x2e>
ffff80000010f55d: 48 89 fe             	movq	%rdi, %rsi
ffff80000010f560: 48 bf 64 09 11 00 00 80 ff ff	movabsq	$-140737487238812, %rdi # imm = 0xFFFF800000110964
ffff80000010f56a: 31 c0                	xorl	%eax, %eax
ffff80000010f56c: ff d1                	callq	*%rcx
ffff80000010f56e: 48 b8 00 c5 10 00 00 80 ff ff	movabsq	$-140737487256320, %rax # imm = 0xFFFF80000010C500
ffff80000010f578: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010f57b: 31 ff                	xorl	%edi, %edi
ffff80000010f57d: ff d0                	callq	*%rax
ffff80000010f57f: 41 89 c7             	movl	%eax, %r15d
ffff80000010f582: 49 bc e0 c4 10 00 00 80 ff ff	movabsq	$-140737487256352, %r12 # imm = 0xFFFF80000010C4E0
ffff80000010f58c: 41 ff d4             	callq	*%r12
ffff80000010f58f: 89 c3                	movl	%eax, %ebx
ffff80000010f591: 85 c0                	testl	%eax, %eax
ffff80000010f593: 0f 88 b1 00 00 00    	js	0xffff80000010f64a <readline+0x10a>
ffff80000010f599: 49 be f0 42 11 00 00 80 ff ff	movabsq	$-140737487224080, %r14 # imm = 0xFFFF8000001142F0
ffff80000010f5a3: eb 1c                	jmp	0xffff80000010f5c1 <readline+0x81>
ffff80000010f5a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f5af: 90                   	nop
ffff80000010f5b0: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010f5b4: 41 ff d4             	callq	*%r12
ffff80000010f5b7: 89 c3                	movl	%eax, %ebx
ffff80000010f5b9: 85 c0                	testl	%eax, %eax
ffff80000010f5bb: 0f 88 89 00 00 00    	js	0xffff80000010f64a <readline+0x10a>
ffff80000010f5c1: 83 fb 08             	cmpl	$8, %ebx
ffff80000010f5c4: 0f 95 c0             	setne	%al
ffff80000010f5c7: 83 fb 7f             	cmpl	$127, %ebx
ffff80000010f5ca: 0f 95 c1             	setne	%cl
ffff80000010f5cd: 84 c8                	testb	%cl, %al
ffff80000010f5cf: 75 1f                	jne	0xffff80000010f5f0 <readline+0xb0>
ffff80000010f5d1: 45 85 ed             	testl	%r13d, %r13d
ffff80000010f5d4: 7e 1a                	jle	0xffff80000010f5f0 <readline+0xb0>
ffff80000010f5d6: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f5d9: 74 d5                	je	0xffff80000010f5b0 <readline+0x70>
ffff80000010f5db: bf 08 00 00 00       	movl	$8, %edi
ffff80000010f5e0: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f5ea: ff d0                	callq	*%rax
ffff80000010f5ec: eb c2                	jmp	0xffff80000010f5b0 <readline+0x70>
ffff80000010f5ee: 66 90                	nop
ffff80000010f5f0: 83 fb 20             	cmpl	$32, %ebx
ffff80000010f5f3: 7c 2b                	jl	0xffff80000010f620 <readline+0xe0>
ffff80000010f5f5: 41 81 fd fe 03 00 00 	cmpl	$1022, %r13d            # imm = 0x3FE
ffff80000010f5fc: 7f 22                	jg	0xffff80000010f620 <readline+0xe0>
ffff80000010f5fe: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f601: 74 0e                	je	0xffff80000010f611 <readline+0xd1>
ffff80000010f603: 89 df                	movl	%ebx, %edi
ffff80000010f605: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f60f: ff d0                	callq	*%rax
ffff80000010f611: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f614: 41 83 c5 01          	addl	$1, %r13d
ffff80000010f618: 42 88 1c 30          	movb	%bl, (%rax,%r14)
ffff80000010f61c: eb 96                	jmp	0xffff80000010f5b4 <readline+0x74>
ffff80000010f61e: 66 90                	nop
ffff80000010f620: 83 fb 0d             	cmpl	$13, %ebx
ffff80000010f623: 74 05                	je	0xffff80000010f62a <readline+0xea>
ffff80000010f625: 83 fb 0a             	cmpl	$10, %ebx
ffff80000010f628: 75 8a                	jne	0xffff80000010f5b4 <readline+0x74>
ffff80000010f62a: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f62d: 74 11                	je	0xffff80000010f640 <readline+0x100>
ffff80000010f62f: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010f634: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f63e: ff d0                	callq	*%rax
ffff80000010f640: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f643: 42 c6 04 30 00       	movb	$0, (%rax,%r14)
ffff80000010f648: eb 1d                	jmp	0xffff80000010f667 <readline+0x127>
ffff80000010f64a: 48 bf e2 0b 11 00 00 80 ff ff	movabsq	$-140737487238174, %rdi # imm = 0xFFFF800000110BE2
ffff80000010f654: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010f657: 89 de                	movl	%ebx, %esi
ffff80000010f659: 31 c0                	xorl	%eax, %eax
ffff80000010f65b: 48 b9 c0 d3 10 00 00 80 ff ff	movabsq	$-140737487252544, %rcx # imm = 0xFFFF80000010D3C0
ffff80000010f665: ff d1                	callq	*%rcx
ffff80000010f667: 4c 89 f0             	movq	%r14, %rax
ffff80000010f66a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f66e: 5b                   	popq	%rbx
ffff80000010f66f: 41 5c                	popq	%r12
ffff80000010f671: 41 5d                	popq	%r13
ffff80000010f673: 41 5e                	popq	%r14
ffff80000010f675: 41 5f                	popq	%r15
ffff80000010f677: 5d                   	popq	%rbp
ffff80000010f678: c3                   	retq
ffff80000010f679: cc                   	int3
ffff80000010f67a: cc                   	int3
ffff80000010f67b: cc                   	int3
ffff80000010f67c: cc                   	int3
ffff80000010f67d: cc                   	int3
ffff80000010f67e: cc                   	int3
ffff80000010f67f: cc                   	int3

ffff80000010f680 <strlen>:
ffff80000010f680: 55                   	pushq	%rbp
ffff80000010f681: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f684: 80 3f 00             	cmpb	$0, (%rdi)
ffff80000010f687: 74 14                	je	0xffff80000010f69d <strlen+0x1d>
ffff80000010f689: 31 c0                	xorl	%eax, %eax
ffff80000010f68b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f690: 80 7c 07 01 00       	cmpb	$0, 1(%rdi,%rax)
ffff80000010f695: 48 8d 40 01          	leaq	1(%rax), %rax
ffff80000010f699: 75 f5                	jne	0xffff80000010f690 <strlen+0x10>
ffff80000010f69b: 5d                   	popq	%rbp
ffff80000010f69c: c3                   	retq
ffff80000010f69d: 31 c0                	xorl	%eax, %eax
ffff80000010f69f: 5d                   	popq	%rbp
ffff80000010f6a0: c3                   	retq
ffff80000010f6a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f6ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f6b0 <strnlen>:
ffff80000010f6b0: 55                   	pushq	%rbp
ffff80000010f6b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f6b4: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f6b7: 74 18                	je	0xffff80000010f6d1 <strnlen+0x21>
ffff80000010f6b9: 48 89 f0             	movq	%rsi, %rax
ffff80000010f6bc: 31 c9                	xorl	%ecx, %ecx
ffff80000010f6be: 66 90                	nop
ffff80000010f6c0: 80 3c 0f 00          	cmpb	$0, (%rdi,%rcx)
ffff80000010f6c4: 74 0f                	je	0xffff80000010f6d5 <strnlen+0x25>
ffff80000010f6c6: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f6ca: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f6cd: 75 f1                	jne	0xffff80000010f6c0 <strnlen+0x10>
ffff80000010f6cf: 5d                   	popq	%rbp
ffff80000010f6d0: c3                   	retq
ffff80000010f6d1: 31 c0                	xorl	%eax, %eax
ffff80000010f6d3: 5d                   	popq	%rbp
ffff80000010f6d4: c3                   	retq
ffff80000010f6d5: 89 c8                	movl	%ecx, %eax
ffff80000010f6d7: 5d                   	popq	%rbp
ffff80000010f6d8: c3                   	retq
ffff80000010f6d9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f6e0 <strcpy>:
ffff80000010f6e0: 55                   	pushq	%rbp
ffff80000010f6e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f6e4: 48 89 f8             	movq	%rdi, %rax
ffff80000010f6e7: 31 c9                	xorl	%ecx, %ecx
ffff80000010f6e9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010f6f0: 0f b6 14 0e          	movzbl	(%rsi,%rcx), %edx
ffff80000010f6f4: 88 14 08             	movb	%dl, (%rax,%rcx)
ffff80000010f6f7: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f6fb: 84 d2                	testb	%dl, %dl
ffff80000010f6fd: 75 f1                	jne	0xffff80000010f6f0 <strcpy+0x10>
ffff80000010f6ff: 5d                   	popq	%rbp
ffff80000010f700: c3                   	retq
ffff80000010f701: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f70b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f710 <strcat>:
ffff80000010f710: 55                   	pushq	%rbp
ffff80000010f711: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f714: 41 56                	pushq	%r14
ffff80000010f716: 53                   	pushq	%rbx
ffff80000010f717: 49 89 f6             	movq	%rsi, %r14
ffff80000010f71a: 48 89 fb             	movq	%rdi, %rbx
ffff80000010f71d: 48 b8 80 f6 10 00 00 80 ff ff	movabsq	$-140737487243648, %rax # imm = 0xFFFF80000010F680
ffff80000010f727: ff d0                	callq	*%rax
ffff80000010f729: 48 63 f8             	movslq	%eax, %rdi
ffff80000010f72c: 48 01 df             	addq	%rbx, %rdi
ffff80000010f72f: 48 b8 e0 f6 10 00 00 80 ff ff	movabsq	$-140737487243552, %rax # imm = 0xFFFF80000010F6E0
ffff80000010f739: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f73c: ff d0                	callq	*%rax
ffff80000010f73e: 48 89 d8             	movq	%rbx, %rax
ffff80000010f741: 5b                   	popq	%rbx
ffff80000010f742: 41 5e                	popq	%r14
ffff80000010f744: 5d                   	popq	%rbp
ffff80000010f745: c3                   	retq
ffff80000010f746: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f750 <strncpy>:
ffff80000010f750: 55                   	pushq	%rbp
ffff80000010f751: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f754: 48 89 f8             	movq	%rdi, %rax
ffff80000010f757: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f75a: 74 1a                	je	0xffff80000010f776 <strncpy+0x26>
ffff80000010f75c: 31 ff                	xorl	%edi, %edi
ffff80000010f75e: 66 90                	nop
ffff80000010f760: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f763: 88 0c 38             	movb	%cl, (%rax,%rdi)
ffff80000010f766: 80 3e 01             	cmpb	$1, (%rsi)
ffff80000010f769: 48 83 de ff          	sbbq	$-1, %rsi
ffff80000010f76d: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f771: 48 39 fa             	cmpq	%rdi, %rdx
ffff80000010f774: 75 ea                	jne	0xffff80000010f760 <strncpy+0x10>
ffff80000010f776: 5d                   	popq	%rbp
ffff80000010f777: c3                   	retq
ffff80000010f778: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f780 <strlcpy>:
ffff80000010f780: 55                   	pushq	%rbp
ffff80000010f781: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f784: 48 89 f8             	movq	%rdi, %rax
ffff80000010f787: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f78a: 74 2e                	je	0xffff80000010f7ba <strlcpy+0x3a>
ffff80000010f78c: 48 89 f8             	movq	%rdi, %rax
ffff80000010f78f: 48 83 c2 ff          	addq	$-1, %rdx
ffff80000010f793: 74 22                	je	0xffff80000010f7b7 <strlcpy+0x37>
ffff80000010f795: 31 c0                	xorl	%eax, %eax
ffff80000010f797: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
ffff80000010f7a0: 0f b6 0c 06          	movzbl	(%rsi,%rax), %ecx
ffff80000010f7a4: 84 c9                	testb	%cl, %cl
ffff80000010f7a6: 74 0c                	je	0xffff80000010f7b4 <strlcpy+0x34>
ffff80000010f7a8: 88 0c 07             	movb	%cl, (%rdi,%rax)
ffff80000010f7ab: 48 83 c0 01          	addq	$1, %rax
ffff80000010f7af: 48 39 c2             	cmpq	%rax, %rdx
ffff80000010f7b2: 75 ec                	jne	0xffff80000010f7a0 <strlcpy+0x20>
ffff80000010f7b4: 48 01 f8             	addq	%rdi, %rax
ffff80000010f7b7: c6 00 00             	movb	$0, (%rax)
ffff80000010f7ba: 48 29 f8             	subq	%rdi, %rax
ffff80000010f7bd: 5d                   	popq	%rbp
ffff80000010f7be: c3                   	retq
ffff80000010f7bf: 90                   	nop

ffff80000010f7c0 <strcmp>:
ffff80000010f7c0: 55                   	pushq	%rbp
ffff80000010f7c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7c4: 8a 07                	movb	(%rdi), %al
ffff80000010f7c6: 84 c0                	testb	%al, %al
ffff80000010f7c8: 74 19                	je	0xffff80000010f7e3 <strcmp+0x23>
ffff80000010f7ca: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f7ce: 66 90                	nop
ffff80000010f7d0: 3a 06                	cmpb	(%rsi), %al
ffff80000010f7d2: 75 0f                	jne	0xffff80000010f7e3 <strcmp+0x23>
ffff80000010f7d4: 48 83 c6 01          	addq	$1, %rsi
ffff80000010f7d8: 0f b6 07             	movzbl	(%rdi), %eax
ffff80000010f7db: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f7df: 84 c0                	testb	%al, %al
ffff80000010f7e1: 75 ed                	jne	0xffff80000010f7d0 <strcmp+0x10>
ffff80000010f7e3: 0f b6 c0             	movzbl	%al, %eax
ffff80000010f7e6: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f7e9: 29 c8                	subl	%ecx, %eax
ffff80000010f7eb: 5d                   	popq	%rbp
ffff80000010f7ec: c3                   	retq
ffff80000010f7ed: 0f 1f 00             	nopl	(%rax)

ffff80000010f7f0 <strncmp>:
ffff80000010f7f0: 55                   	pushq	%rbp
ffff80000010f7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7f4: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f7f7: 74 1d                	je	0xffff80000010f816 <strncmp+0x26>
ffff80000010f7f9: 31 c9                	xorl	%ecx, %ecx
ffff80000010f7fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f800: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010f804: 85 c0                	testl	%eax, %eax
ffff80000010f806: 74 12                	je	0xffff80000010f81a <strncmp+0x2a>
ffff80000010f808: 3a 04 0e             	cmpb	(%rsi,%rcx), %al
ffff80000010f80b: 75 0d                	jne	0xffff80000010f81a <strncmp+0x2a>
ffff80000010f80d: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f811: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010f814: 75 ea                	jne	0xffff80000010f800 <strncmp+0x10>
ffff80000010f816: 31 c0                	xorl	%eax, %eax
ffff80000010f818: 5d                   	popq	%rbp
ffff80000010f819: c3                   	retq
ffff80000010f81a: 0f b6 0c 0e          	movzbl	(%rsi,%rcx), %ecx
ffff80000010f81e: 29 c8                	subl	%ecx, %eax
ffff80000010f820: 5d                   	popq	%rbp
ffff80000010f821: c3                   	retq
ffff80000010f822: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f82c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f830 <strchr>:
ffff80000010f830: 55                   	pushq	%rbp
ffff80000010f831: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f834: 8a 0f                	movb	(%rdi), %cl
ffff80000010f836: 84 c9                	testb	%cl, %cl
ffff80000010f838: 74 17                	je	0xffff80000010f851 <strchr+0x21>
ffff80000010f83a: 48 89 f8             	movq	%rdi, %rax
ffff80000010f83d: 0f 1f 00             	nopl	(%rax)
ffff80000010f840: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f843: 74 0e                	je	0xffff80000010f853 <strchr+0x23>
ffff80000010f845: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f849: 48 83 c0 01          	addq	$1, %rax
ffff80000010f84d: 84 c9                	testb	%cl, %cl
ffff80000010f84f: 75 ef                	jne	0xffff80000010f840 <strchr+0x10>
ffff80000010f851: 31 c0                	xorl	%eax, %eax
ffff80000010f853: 5d                   	popq	%rbp
ffff80000010f854: c3                   	retq
ffff80000010f855: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f85f: 90                   	nop

ffff80000010f860 <strfind>:
ffff80000010f860: 55                   	pushq	%rbp
ffff80000010f861: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f864: 48 89 f8             	movq	%rdi, %rax
ffff80000010f867: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010f86b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f870: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f874: 48 83 c0 01          	addq	$1, %rax
ffff80000010f878: 84 c9                	testb	%cl, %cl
ffff80000010f87a: 74 05                	je	0xffff80000010f881 <strfind+0x21>
ffff80000010f87c: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f87f: 75 ef                	jne	0xffff80000010f870 <strfind+0x10>
ffff80000010f881: 5d                   	popq	%rbp
ffff80000010f882: c3                   	retq
ffff80000010f883: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f88d: 0f 1f 00             	nopl	(%rax)

ffff80000010f890 <memset>:
ffff80000010f890: 55                   	pushq	%rbp
ffff80000010f891: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f894: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f897: 74 36                	je	0xffff80000010f8cf <memset+0x3f>
ffff80000010f899: 89 f8                	movl	%edi, %eax
ffff80000010f89b: 09 d0                	orl	%edx, %eax
ffff80000010f89d: a8 03                	testb	$3, %al
ffff80000010f89f: 74 0a                	je	0xffff80000010f8ab <memset+0x1b>
ffff80000010f8a1: 89 f0                	movl	%esi, %eax
ffff80000010f8a3: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f8a6: fc                   	cld
ffff80000010f8a7: f3 aa                	rep		stosb	%al, %es:(%rdi)
ffff80000010f8a9: eb 24                	jmp	0xffff80000010f8cf <memset+0x3f>
ffff80000010f8ab: 44 0f b6 c6          	movzbl	%sil, %r8d
ffff80000010f8af: c1 e6 18             	shll	$24, %esi
ffff80000010f8b2: 44 89 c1             	movl	%r8d, %ecx
ffff80000010f8b5: c1 e1 10             	shll	$16, %ecx
ffff80000010f8b8: 09 f1                	orl	%esi, %ecx
ffff80000010f8ba: 44 89 c0             	movl	%r8d, %eax
ffff80000010f8bd: c1 e0 08             	shll	$8, %eax
ffff80000010f8c0: 09 c8                	orl	%ecx, %eax
ffff80000010f8c2: 44 09 c0             	orl	%r8d, %eax
ffff80000010f8c5: 48 c1 ea 02          	shrq	$2, %rdx
ffff80000010f8c9: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f8cc: fc                   	cld
ffff80000010f8cd: f3 ab                	rep		stosl	%eax, %es:(%rdi)
ffff80000010f8cf: 48 89 f8             	movq	%rdi, %rax
ffff80000010f8d2: 5d                   	popq	%rbp
ffff80000010f8d3: c3                   	retq
ffff80000010f8d4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f8de: 66 90                	nop

ffff80000010f8e0 <memmove>:
ffff80000010f8e0: 55                   	pushq	%rbp
ffff80000010f8e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f8e4: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f8e7: 48 89 f2             	movq	%rsi, %rdx
ffff80000010f8ea: 48 89 f8             	movq	%rdi, %rax
ffff80000010f8ed: 48 39 fe             	cmpq	%rdi, %rsi
ffff80000010f8f0: 73 38                	jae	0xffff80000010f92a <memmove+0x4a>
ffff80000010f8f2: 48 8d 34 0a          	leaq	(%rdx,%rcx), %rsi
ffff80000010f8f6: 48 39 c6             	cmpq	%rax, %rsi
ffff80000010f8f9: 76 2f                	jbe	0xffff80000010f92a <memmove+0x4a>
ffff80000010f8fb: 48 8d 3c 08          	leaq	(%rax,%rcx), %rdi
ffff80000010f8ff: f6 c1 03             	testb	$3, %cl
ffff80000010f902: 75 4e                	jne	0xffff80000010f952 <memmove+0x72>
ffff80000010f904: 89 f2                	movl	%esi, %edx
ffff80000010f906: 83 e2 03             	andl	$3, %edx
ffff80000010f909: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f90c: 75 44                	jne	0xffff80000010f952 <memmove+0x72>
ffff80000010f90e: 89 fa                	movl	%edi, %edx
ffff80000010f910: 83 e2 03             	andl	$3, %edx
ffff80000010f913: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f916: 75 3a                	jne	0xffff80000010f952 <memmove+0x72>
ffff80000010f918: 48 83 c7 fc          	addq	$-4, %rdi
ffff80000010f91c: 48 83 c6 fc          	addq	$-4, %rsi
ffff80000010f920: 48 c1 e9 02          	shrq	$2, %rcx
ffff80000010f924: fd                   	std
ffff80000010f925: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff80000010f927: fc                   	cld
ffff80000010f928: 5d                   	popq	%rbp
ffff80000010f929: c3                   	retq
ffff80000010f92a: 89 d6                	movl	%edx, %esi
ffff80000010f92c: 09 c6                	orl	%eax, %esi
ffff80000010f92e: 89 cf                	movl	%ecx, %edi
ffff80000010f930: 09 f7                	orl	%esi, %edi
ffff80000010f932: 40 f6 c7 03          	testb	$3, %dil
ffff80000010f936: 74 0b                	je	0xffff80000010f943 <memmove+0x63>
ffff80000010f938: 48 89 c7             	movq	%rax, %rdi
ffff80000010f93b: 48 89 d6             	movq	%rdx, %rsi
ffff80000010f93e: fc                   	cld
ffff80000010f93f: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
ffff80000010f941: 5d                   	popq	%rbp
ffff80000010f942: c3                   	retq
ffff80000010f943: 48 c1 e9 02          	shrq	$2, %rcx
ffff80000010f947: 48 89 c7             	movq	%rax, %rdi
ffff80000010f94a: 48 89 d6             	movq	%rdx, %rsi
ffff80000010f94d: fc                   	cld
ffff80000010f94e: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
ffff80000010f950: 5d                   	popq	%rbp
ffff80000010f951: c3                   	retq
ffff80000010f952: 48 83 c7 ff          	addq	$-1, %rdi
ffff80000010f956: 48 83 c6 ff          	addq	$-1, %rsi
ffff80000010f95a: fd                   	std
ffff80000010f95b: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
ffff80000010f95d: fc                   	cld
ffff80000010f95e: 5d                   	popq	%rbp
ffff80000010f95f: c3                   	retq

ffff80000010f960 <memcpy>:
ffff80000010f960: 55                   	pushq	%rbp
ffff80000010f961: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f964: 53                   	pushq	%rbx
ffff80000010f965: 50                   	pushq	%rax
ffff80000010f966: 48 89 fb             	movq	%rdi, %rbx
ffff80000010f969: 48 b8 e0 f8 10 00 00 80 ff ff	movabsq	$-140737487243040, %rax # imm = 0xFFFF80000010F8E0
ffff80000010f973: ff d0                	callq	*%rax
ffff80000010f975: 48 89 d8             	movq	%rbx, %rax
ffff80000010f978: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f97c: 5b                   	popq	%rbx
ffff80000010f97d: 5d                   	popq	%rbp
ffff80000010f97e: c3                   	retq
ffff80000010f97f: 90                   	nop

ffff80000010f980 <memcmp>:
ffff80000010f980: 55                   	pushq	%rbp
ffff80000010f981: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f984: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f987: 74 1e                	je	0xffff80000010f9a7 <memcmp+0x27>
ffff80000010f989: 31 c9                	xorl	%ecx, %ecx
ffff80000010f98b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f990: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010f994: 44 0f b6 04 0e       	movzbl	(%rsi,%rcx), %r8d
ffff80000010f999: 44 38 c0             	cmpb	%r8b, %al
ffff80000010f99c: 75 0d                	jne	0xffff80000010f9ab <memcmp+0x2b>
ffff80000010f99e: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f9a2: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010f9a5: 75 e9                	jne	0xffff80000010f990 <memcmp+0x10>
ffff80000010f9a7: 31 c0                	xorl	%eax, %eax
ffff80000010f9a9: 5d                   	popq	%rbp
ffff80000010f9aa: c3                   	retq
ffff80000010f9ab: 44 29 c0             	subl	%r8d, %eax
ffff80000010f9ae: 5d                   	popq	%rbp
ffff80000010f9af: c3                   	retq

ffff80000010f9b0 <memfind>:
ffff80000010f9b0: 55                   	pushq	%rbp
ffff80000010f9b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9b4: 48 89 f8             	movq	%rdi, %rax
ffff80000010f9b7: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f9ba: 7e 12                	jle	0xffff80000010f9ce <memfind+0x1e>
ffff80000010f9bc: 48 01 c2             	addq	%rax, %rdx
ffff80000010f9bf: 90                   	nop
ffff80000010f9c0: 40 38 30             	cmpb	%sil, (%rax)
ffff80000010f9c3: 74 09                	je	0xffff80000010f9ce <memfind+0x1e>
ffff80000010f9c5: 48 83 c0 01          	addq	$1, %rax
ffff80000010f9c9: 48 39 d0             	cmpq	%rdx, %rax
ffff80000010f9cc: 72 f2                	jb	0xffff80000010f9c0 <memfind+0x10>
ffff80000010f9ce: 5d                   	popq	%rbp
ffff80000010f9cf: c3                   	retq

ffff80000010f9d0 <strtol>:
ffff80000010f9d0: 55                   	pushq	%rbp
ffff80000010f9d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9d4: 48 b8 e8 05 11 00 00 80 ff ff	movabsq	$-140737487239704, %rax # imm = 0xFFFF8000001105E8
ffff80000010f9de: 66 90                	nop
ffff80000010f9e0: 0f b6 0f             	movzbl	(%rdi), %ecx
ffff80000010f9e3: 80 c1 f7             	addb	$-9, %cl
ffff80000010f9e6: 80 f9 24             	cmpb	$36, %cl
ffff80000010f9e9: 77 10                	ja	0xffff80000010f9fb <strtol+0x2b>
ffff80000010f9eb: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010f9ee: ff 24 c8             	jmpq	*(%rax,%rcx,8)
ffff80000010f9f1: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f9f5: eb e9                	jmp	0xffff80000010f9e0 <strtol+0x10>
ffff80000010f9f7: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f9fb: 41 b0 01             	movb	$1, %r8b
ffff80000010f9fe: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010fa04: 75 27                	jne	0xffff80000010fa2d <strtol+0x5d>
ffff80000010fa06: eb 0f                	jmp	0xffff80000010fa17 <strtol+0x47>
ffff80000010fa08: 48 83 c7 01          	addq	$1, %rdi
ffff80000010fa0c: 45 31 c0             	xorl	%r8d, %r8d
ffff80000010fa0f: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010fa15: 75 16                	jne	0xffff80000010fa2d <strtol+0x5d>
ffff80000010fa17: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010fa1a: 75 11                	jne	0xffff80000010fa2d <strtol+0x5d>
ffff80000010fa1c: 80 7f 01 78          	cmpb	$120, 1(%rdi)
ffff80000010fa20: 75 0b                	jne	0xffff80000010fa2d <strtol+0x5d>
ffff80000010fa22: 48 83 c7 02          	addq	$2, %rdi
ffff80000010fa26: ba 10 00 00 00       	movl	$16, %edx
ffff80000010fa2b: eb 1a                	jmp	0xffff80000010fa47 <strtol+0x77>
ffff80000010fa2d: 85 d2                	testl	%edx, %edx
ffff80000010fa2f: 75 16                	jne	0xffff80000010fa47 <strtol+0x77>
ffff80000010fa31: 31 c0                	xorl	%eax, %eax
ffff80000010fa33: 31 c9                	xorl	%ecx, %ecx
ffff80000010fa35: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010fa38: 0f 95 c0             	setne	%al
ffff80000010fa3b: 0f 94 c1             	sete	%cl
ffff80000010fa3e: 48 01 cf             	addq	%rcx, %rdi
ffff80000010fa41: 8d 14 00             	leal	(%rax,%rax), %edx
ffff80000010fa44: 83 c2 08             	addl	$8, %edx
ffff80000010fa47: 4c 63 ca             	movslq	%edx, %r9
ffff80000010fa4a: 45 31 d2             	xorl	%r10d, %r10d
ffff80000010fa4d: eb 25                	jmp	0xffff80000010fa74 <strtol+0xa4>
ffff80000010fa4f: 90                   	nop
ffff80000010fa50: 31 c0                	xorl	%eax, %eax
ffff80000010fa52: 84 c0                	testb	%al, %al
ffff80000010fa54: 75 1e                	jne	0xffff80000010fa74 <strtol+0xa4>
ffff80000010fa56: eb 51                	jmp	0xffff80000010faa9 <strtol+0xd9>
ffff80000010fa58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
ffff80000010fa60: 48 83 c7 01          	addq	$1, %rdi
ffff80000010fa64: 4d 0f af d1          	imulq	%r9, %r10
ffff80000010fa68: 48 63 c1             	movslq	%ecx, %rax
ffff80000010fa6b: 49 01 c2             	addq	%rax, %r10
ffff80000010fa6e: b0 01                	movb	$1, %al
ffff80000010fa70: 84 c0                	testb	%al, %al
ffff80000010fa72: 74 35                	je	0xffff80000010faa9 <strtol+0xd9>
ffff80000010fa74: 44 0f be 1f          	movsbl	(%rdi), %r11d
ffff80000010fa78: 41 8d 43 d0          	leal	-48(%r11), %eax
ffff80000010fa7c: b9 d0 ff ff ff       	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
ffff80000010fa81: 3c 0a                	cmpb	$10, %al
ffff80000010fa83: 72 1b                	jb	0xffff80000010faa0 <strtol+0xd0>
ffff80000010fa85: 41 8d 43 9f          	leal	-97(%r11), %eax
ffff80000010fa89: b9 a9 ff ff ff       	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
ffff80000010fa8e: 3c 1a                	cmpb	$26, %al
ffff80000010fa90: 72 0e                	jb	0xffff80000010faa0 <strtol+0xd0>
ffff80000010fa92: 41 8d 43 bf          	leal	-65(%r11), %eax
ffff80000010fa96: b9 c9 ff ff ff       	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
ffff80000010fa9b: 3c 19                	cmpb	$25, %al
ffff80000010fa9d: 77 b1                	ja	0xffff80000010fa50 <strtol+0x80>
ffff80000010fa9f: 90                   	nop
ffff80000010faa0: 44 01 d9             	addl	%r11d, %ecx
ffff80000010faa3: 39 d1                	cmpl	%edx, %ecx
ffff80000010faa5: 7c b9                	jl	0xffff80000010fa60 <strtol+0x90>
ffff80000010faa7: eb a7                	jmp	0xffff80000010fa50 <strtol+0x80>
ffff80000010faa9: 48 85 f6             	testq	%rsi, %rsi
ffff80000010faac: 74 03                	je	0xffff80000010fab1 <strtol+0xe1>
ffff80000010faae: 48 89 3e             	movq	%rdi, (%rsi)
ffff80000010fab1: 4c 89 d0             	movq	%r10, %rax
ffff80000010fab4: 48 f7 d8             	negq	%rax
ffff80000010fab7: 45 84 c0             	testb	%r8b, %r8b
ffff80000010faba: 49 0f 45 c2          	cmovneq	%r10, %rax
ffff80000010fabe: 5d                   	popq	%rbp
ffff80000010fabf: c3                   	retq
