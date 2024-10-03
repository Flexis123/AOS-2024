#include <assert.h>
#include <stdio.h>

#include <x86-64/asm.h>
#include <x86-64/gdt.h>
#include <x86-64/idt.h>

#include <kernel/acpi.h>
#include <kernel/sched/idt.h>
#include <kernel/monitor.h>
#include <kernel/sched/syscall.h>

#include <kernel/sched/task.h>
#include <kernel/mem/insert.h>
#include <kernel/vma/pfault.h>

#define __DEF_INT_HANDLER(int_no) \
	void isr##int_no();

#define DEF_INT_HANDLER(int_no) __DEF_INT_HANDLER(int_no)

DEF_INT_HANDLER(INT_DIVIDE)
DEF_INT_HANDLER(INT_DEBUG)
DEF_INT_HANDLER(INT_NMI)
DEF_INT_HANDLER(INT_BREAK)
DEF_INT_HANDLER(INT_OVERFLOW)
DEF_INT_HANDLER(INT_BOUND)
DEF_INT_HANDLER(INT_INVALID_OP)
DEF_INT_HANDLER(INT_DEVICE)
DEF_INT_HANDLER(INT_DOUBLE_FAULT)
DEF_INT_HANDLER(INT_TSS)
DEF_INT_HANDLER(INT_NO_SEG_PRESENT)
DEF_INT_HANDLER(INT_SS)
DEF_INT_HANDLER(INT_GPF)
DEF_INT_HANDLER(INT_PAGE_FAULT)
DEF_INT_HANDLER(INT_FPU)
DEF_INT_HANDLER(INT_ALIGNMENT)
DEF_INT_HANDLER(INT_MCE)
DEF_INT_HANDLER(INT_SIMD)
DEF_INT_HANDLER(INT_SECURITY)
DEF_INT_HANDLER(INT_SYSCALL)

//IRQS
DEF_INT_HANDLER(IRQ_TIMER)
DEF_INT_HANDLER(IRQ_KBD)
DEF_INT_HANDLER(IRQ_SERIAL)
DEF_INT_HANDLER(IRQ_SPURIOUS)
DEF_INT_HANDLER(IRQ_IDE)
DEF_INT_HANDLER(IRQ_ERROR)

DEF_INT_HANDLER(20)
DEF_INT_HANDLER(21)
DEF_INT_HANDLER(22)
DEF_INT_HANDLER(23)
DEF_INT_HANDLER(24)
DEF_INT_HANDLER(25)
DEF_INT_HANDLER(26)
DEF_INT_HANDLER(27)
DEF_INT_HANDLER(28)
DEF_INT_HANDLER(29)
DEF_INT_HANDLER(31)
DEF_INT_HANDLER(34)
DEF_INT_HANDLER(35)
DEF_INT_HANDLER(37)
DEF_INT_HANDLER(38)
DEF_INT_HANDLER(40)
DEF_INT_HANDLER(41)
DEF_INT_HANDLER(42)
DEF_INT_HANDLER(43)
DEF_INT_HANDLER(44)
DEF_INT_HANDLER(45)
DEF_INT_HANDLER(47)
DEF_INT_HANDLER(48)
DEF_INT_HANDLER(49)
DEF_INT_HANDLER(50)
DEF_INT_HANDLER(52)
DEF_INT_HANDLER(53)
DEF_INT_HANDLER(54)
DEF_INT_HANDLER(55)
DEF_INT_HANDLER(56)
DEF_INT_HANDLER(57)
DEF_INT_HANDLER(58)
DEF_INT_HANDLER(59)
DEF_INT_HANDLER(60)
DEF_INT_HANDLER(61)
DEF_INT_HANDLER(62)
DEF_INT_HANDLER(63)
DEF_INT_HANDLER(64)
DEF_INT_HANDLER(65)
DEF_INT_HANDLER(66)
DEF_INT_HANDLER(67)
DEF_INT_HANDLER(68)
DEF_INT_HANDLER(69)
DEF_INT_HANDLER(70)
DEF_INT_HANDLER(71)
DEF_INT_HANDLER(72)
DEF_INT_HANDLER(73)
DEF_INT_HANDLER(74)
DEF_INT_HANDLER(75)
DEF_INT_HANDLER(76)
DEF_INT_HANDLER(77)
DEF_INT_HANDLER(78)
DEF_INT_HANDLER(79)
DEF_INT_HANDLER(80)
DEF_INT_HANDLER(81)
DEF_INT_HANDLER(82)
DEF_INT_HANDLER(83)
DEF_INT_HANDLER(84)
DEF_INT_HANDLER(85)
DEF_INT_HANDLER(86)
DEF_INT_HANDLER(87)
DEF_INT_HANDLER(88)
DEF_INT_HANDLER(89)
DEF_INT_HANDLER(90)
DEF_INT_HANDLER(91)
DEF_INT_HANDLER(92)
DEF_INT_HANDLER(93)
DEF_INT_HANDLER(94)
DEF_INT_HANDLER(95)
DEF_INT_HANDLER(96)
DEF_INT_HANDLER(97)
DEF_INT_HANDLER(98)
DEF_INT_HANDLER(99)
DEF_INT_HANDLER(100)
DEF_INT_HANDLER(101)
DEF_INT_HANDLER(102)
DEF_INT_HANDLER(103)
DEF_INT_HANDLER(104)
DEF_INT_HANDLER(105)
DEF_INT_HANDLER(106)
DEF_INT_HANDLER(107)
DEF_INT_HANDLER(108)
DEF_INT_HANDLER(109)
DEF_INT_HANDLER(110)
DEF_INT_HANDLER(111)
DEF_INT_HANDLER(112)
DEF_INT_HANDLER(113)
DEF_INT_HANDLER(114)
DEF_INT_HANDLER(115)
DEF_INT_HANDLER(116)
DEF_INT_HANDLER(117)
DEF_INT_HANDLER(118)
DEF_INT_HANDLER(119)
DEF_INT_HANDLER(120)
DEF_INT_HANDLER(121)
DEF_INT_HANDLER(122)
DEF_INT_HANDLER(123)
DEF_INT_HANDLER(124)
DEF_INT_HANDLER(125)
DEF_INT_HANDLER(126)
DEF_INT_HANDLER(127)
DEF_INT_HANDLER(129)
DEF_INT_HANDLER(130)
DEF_INT_HANDLER(131)
DEF_INT_HANDLER(132)
DEF_INT_HANDLER(133)
DEF_INT_HANDLER(134)
DEF_INT_HANDLER(135)
DEF_INT_HANDLER(136)
DEF_INT_HANDLER(137)
DEF_INT_HANDLER(138)
DEF_INT_HANDLER(139)
DEF_INT_HANDLER(140)
DEF_INT_HANDLER(141)
DEF_INT_HANDLER(142)
DEF_INT_HANDLER(143)
DEF_INT_HANDLER(144)
DEF_INT_HANDLER(145)
DEF_INT_HANDLER(146)
DEF_INT_HANDLER(147)
DEF_INT_HANDLER(148)
DEF_INT_HANDLER(149)
DEF_INT_HANDLER(150)
DEF_INT_HANDLER(151)
DEF_INT_HANDLER(152)
DEF_INT_HANDLER(153)
DEF_INT_HANDLER(154)
DEF_INT_HANDLER(155)
DEF_INT_HANDLER(156)
DEF_INT_HANDLER(157)
DEF_INT_HANDLER(158)
DEF_INT_HANDLER(159)
DEF_INT_HANDLER(160)
DEF_INT_HANDLER(161)
DEF_INT_HANDLER(162)
DEF_INT_HANDLER(163)
DEF_INT_HANDLER(164)
DEF_INT_HANDLER(165)
DEF_INT_HANDLER(166)
DEF_INT_HANDLER(167)
DEF_INT_HANDLER(168)
DEF_INT_HANDLER(169)
DEF_INT_HANDLER(170)
DEF_INT_HANDLER(171)
DEF_INT_HANDLER(172)
DEF_INT_HANDLER(173)
DEF_INT_HANDLER(174)
DEF_INT_HANDLER(175)
DEF_INT_HANDLER(176)
DEF_INT_HANDLER(177)
DEF_INT_HANDLER(178)
DEF_INT_HANDLER(179)
DEF_INT_HANDLER(180)
DEF_INT_HANDLER(181)
DEF_INT_HANDLER(182)
DEF_INT_HANDLER(183)
DEF_INT_HANDLER(184)
DEF_INT_HANDLER(185)
DEF_INT_HANDLER(186)
DEF_INT_HANDLER(187)
DEF_INT_HANDLER(188)
DEF_INT_HANDLER(189)
DEF_INT_HANDLER(190)
DEF_INT_HANDLER(191)
DEF_INT_HANDLER(192)
DEF_INT_HANDLER(193)
DEF_INT_HANDLER(194)
DEF_INT_HANDLER(195)
DEF_INT_HANDLER(196)
DEF_INT_HANDLER(197)
DEF_INT_HANDLER(198)
DEF_INT_HANDLER(199)
DEF_INT_HANDLER(200)
DEF_INT_HANDLER(201)
DEF_INT_HANDLER(202)
DEF_INT_HANDLER(203)
DEF_INT_HANDLER(204)
DEF_INT_HANDLER(205)
DEF_INT_HANDLER(206)
DEF_INT_HANDLER(207)
DEF_INT_HANDLER(208)
DEF_INT_HANDLER(209)
DEF_INT_HANDLER(210)
DEF_INT_HANDLER(211)
DEF_INT_HANDLER(212)
DEF_INT_HANDLER(213)
DEF_INT_HANDLER(214)
DEF_INT_HANDLER(215)
DEF_INT_HANDLER(216)
DEF_INT_HANDLER(217)
DEF_INT_HANDLER(218)
DEF_INT_HANDLER(219)
DEF_INT_HANDLER(220)
DEF_INT_HANDLER(221)
DEF_INT_HANDLER(222)
DEF_INT_HANDLER(223)
DEF_INT_HANDLER(224)
DEF_INT_HANDLER(225)
DEF_INT_HANDLER(226)
DEF_INT_HANDLER(227)
DEF_INT_HANDLER(228)
DEF_INT_HANDLER(229)
DEF_INT_HANDLER(230)
DEF_INT_HANDLER(231)
DEF_INT_HANDLER(232)
DEF_INT_HANDLER(233)
DEF_INT_HANDLER(234)
DEF_INT_HANDLER(235)
DEF_INT_HANDLER(236)
DEF_INT_HANDLER(237)
DEF_INT_HANDLER(238)
DEF_INT_HANDLER(239)
DEF_INT_HANDLER(240)
DEF_INT_HANDLER(241)
DEF_INT_HANDLER(242)
DEF_INT_HANDLER(243)
DEF_INT_HANDLER(244)
DEF_INT_HANDLER(245)
DEF_INT_HANDLER(246)
DEF_INT_HANDLER(247)
DEF_INT_HANDLER(248)
DEF_INT_HANDLER(249)
DEF_INT_HANDLER(250)
DEF_INT_HANDLER(251)
DEF_INT_HANDLER(252)
DEF_INT_HANDLER(253)
DEF_INT_HANDLER(254)
DEF_INT_HANDLER(255)

DEF_INT_HANDLER(15)


#define __INT_HANDLER(int_no) isr##int_no
#define INT_HANDLER(int_no) __INT_HANDLER(int_no)

struct int_info{
	void (*handler)();
	char* name;
};

#define INT_INFO(_int_no, _name) {INT_HANDLER(_int_no), _name}

static const struct int_info int_infos[256] = {
	[INT_DIVIDE] = INT_INFO(INT_DIVIDE,  "Divide-by-Zero Error Exception (#DE)"),
	[INT_DEBUG] = INT_INFO(INT_DEBUG, "Debug (#DB)"),
	[INT_NMI] = INT_INFO(INT_NMI, "Non-Maskable Interrupt"),
	[INT_BREAK] = INT_INFO(INT_BREAK, "Breakpoint (#BP)"),
	[INT_OVERFLOW] = INT_INFO(INT_OVERFLOW, "Overflow (#OF)"),
	[INT_BOUND] = INT_INFO(INT_BOUND, "Bound Range (#BR)"),
	[INT_INVALID_OP] = INT_INFO(INT_INVALID_OP, "Invalid Opcode (#UD)"),
	[INT_DEVICE] = INT_INFO(INT_DEVICE, "Device Not Available (#NM)"),
	[INT_DOUBLE_FAULT] = INT_INFO(INT_DOUBLE_FAULT, "Double Fault (#DF)"),
	[INT_TSS] = INT_INFO(INT_TSS, "Invalid TSS (#TS)"),
	[INT_NO_SEG_PRESENT] = INT_INFO(INT_NO_SEG_PRESENT, "Segment Not Present (#NP)"),
	[INT_SS] = INT_INFO(INT_SS, "Stack (#SS)"),
	[INT_GPF] = INT_INFO(INT_GPF, "General Protection (#GP)"),
	[INT_PAGE_FAULT] = INT_INFO(INT_PAGE_FAULT, "Page Fault (#PF)"),
	[INT_FPU] = INT_INFO(INT_FPU, "x86 FPU Floating-Point (#MF)"),
	[INT_ALIGNMENT] = INT_INFO(INT_ALIGNMENT, "Alignment Check (#AC)"),
	[INT_MCE] = INT_INFO(INT_MCE, "Machine Check (#MC)"),
	[INT_SIMD] = INT_INFO(INT_SIMD, "SIMD Floating-Point (#XF)"),
	[INT_SECURITY] = INT_INFO(INT_SECURITY, "Security (#SX)"),
	[INT_SYSCALL] = INT_INFO(INT_SYSCALL, "Sys call"),
	[IRQ_TIMER] = INT_INFO(IRQ_TIMER, "hardware timer interrupt"),
	[IRQ_KBD] = INT_INFO(IRQ_KBD, "kbd interrupt"),
	[IRQ_SERIAL] = INT_INFO(IRQ_SERIAL, "sertial irq"),
	[IRQ_SPURIOUS] = INT_INFO(IRQ_SPURIOUS, "spurious irq"),
	[IRQ_IDE] = INT_INFO(IRQ_IDE, "ide irq"),
	[IRQ_ERROR] = INT_INFO(IRQ_ERROR, "error irq"),
	[15] = INT_INFO(15, "15"),
[34] = INT_INFO(34, "34"),
[35] = INT_INFO(35, "35"),
[37] = INT_INFO(37, "37"),
[38] = INT_INFO(38, "38"),
[40] = INT_INFO(40, "40"),
[41] = INT_INFO(41, "41"),
[42] = INT_INFO(42, "42"),
[43] = INT_INFO(43, "43"),
[44] = INT_INFO(44, "44"),
[45] = INT_INFO(45, "45"),
[47] = INT_INFO(47, "47"),
[48] = INT_INFO(48, "48"),
[49] = INT_INFO(49, "49"),
[50] = INT_INFO(50, "50"),
[52] = INT_INFO(52, "52"),
[53] = INT_INFO(53, "53"),
[54] = INT_INFO(54, "54"),
[55] = INT_INFO(55, "55"),
[56] = INT_INFO(56, "56"),
[57] = INT_INFO(57, "57"),
[58] = INT_INFO(58, "58"),
[59] = INT_INFO(59, "59"),
[60] = INT_INFO(60, "60"),
[61] = INT_INFO(61, "61"),
[62] = INT_INFO(62, "62"),
[63] = INT_INFO(63, "63"),
[64] = INT_INFO(64, "64"),
[65] = INT_INFO(65, "65"),
[66] = INT_INFO(66, "66"),
[67] = INT_INFO(67, "67"),
[68] = INT_INFO(68, "68"),
[69] = INT_INFO(69, "69"),
[70] = INT_INFO(70, "70"),
[71] = INT_INFO(71, "71"),
[72] = INT_INFO(72, "72"),
[73] = INT_INFO(73, "73"),
[74] = INT_INFO(74, "74"),
[75] = INT_INFO(75, "75"),
[76] = INT_INFO(76, "76"),
[77] = INT_INFO(77, "77"),
[78] = INT_INFO(78, "78"),
[79] = INT_INFO(79, "79"),
[80] = INT_INFO(80, "80"),
[81] = INT_INFO(81, "81"),
[82] = INT_INFO(82, "82"),
[83] = INT_INFO(83, "83"),
[84] = INT_INFO(84, "84"),
[85] = INT_INFO(85, "85"),
[86] = INT_INFO(86, "86"),
[87] = INT_INFO(87, "87"),
[88] = INT_INFO(88, "88"),
[89] = INT_INFO(89, "89"),
[90] = INT_INFO(90, "90"),
[91] = INT_INFO(91, "91"),
[92] = INT_INFO(92, "92"),
[93] = INT_INFO(93, "93"),
[94] = INT_INFO(94, "94"),
[95] = INT_INFO(95, "95"),
[96] = INT_INFO(96, "96"),
[97] = INT_INFO(97, "97"),
[98] = INT_INFO(98, "98"),
[99] = INT_INFO(99, "99"),
[100] = INT_INFO(100, "100"),
[101] = INT_INFO(101, "101"),
[102] = INT_INFO(102, "102"),
[103] = INT_INFO(103, "103"),
[104] = INT_INFO(104, "104"),
[105] = INT_INFO(105, "105"),
[106] = INT_INFO(106, "106"),
[107] = INT_INFO(107, "107"),
[108] = INT_INFO(108, "108"),
[109] = INT_INFO(109, "109"),
[110] = INT_INFO(110, "110"),
[111] = INT_INFO(111, "111"),
[112] = INT_INFO(112, "112"),
[113] = INT_INFO(113, "113"),
[114] = INT_INFO(114, "114"),
[115] = INT_INFO(115, "115"),
[116] = INT_INFO(116, "116"),
[117] = INT_INFO(117, "117"),
[118] = INT_INFO(118, "118"),
[119] = INT_INFO(119, "119"),
[120] = INT_INFO(120, "120"),
[121] = INT_INFO(121, "121"),
[122] = INT_INFO(122, "122"),
[123] = INT_INFO(123, "123"),
[124] = INT_INFO(124, "124"),
[125] = INT_INFO(125, "125"),
[126] = INT_INFO(126, "126"),
[127] = INT_INFO(127, "127"),
[129] = INT_INFO(129, "129"),
[130] = INT_INFO(130, "130"),
[131] = INT_INFO(131, "131"),
[132] = INT_INFO(132, "132"),
[133] = INT_INFO(133, "133"),
[134] = INT_INFO(134, "134"),
[135] = INT_INFO(135, "135"),
[136] = INT_INFO(136, "136"),
[137] = INT_INFO(137, "137"),
[138] = INT_INFO(138, "138"),
[139] = INT_INFO(139, "139"),
[140] = INT_INFO(140, "140"),
[141] = INT_INFO(141, "141"),
[142] = INT_INFO(142, "142"),
[143] = INT_INFO(143, "143"),
[144] = INT_INFO(144, "144"),
[145] = INT_INFO(145, "145"),
[146] = INT_INFO(146, "146"),
[147] = INT_INFO(147, "147"),
[148] = INT_INFO(148, "148"),
[149] = INT_INFO(149, "149"),
[150] = INT_INFO(150, "150"),
[151] = INT_INFO(151, "151"),
[152] = INT_INFO(152, "152"),
[153] = INT_INFO(153, "153"),
[154] = INT_INFO(154, "154"),
[155] = INT_INFO(155, "155"),
[156] = INT_INFO(156, "156"),
[157] = INT_INFO(157, "157"),
[158] = INT_INFO(158, "158"),
[159] = INT_INFO(159, "159"),
[160] = INT_INFO(160, "160"),
[161] = INT_INFO(161, "161"),
[162] = INT_INFO(162, "162"),
[163] = INT_INFO(163, "163"),
[164] = INT_INFO(164, "164"),
[165] = INT_INFO(165, "165"),
[166] = INT_INFO(166, "166"),
[167] = INT_INFO(167, "167"),
[168] = INT_INFO(168, "168"),
[169] = INT_INFO(169, "169"),
[170] = INT_INFO(170, "170"),
[171] = INT_INFO(171, "171"),
[172] = INT_INFO(172, "172"),
[173] = INT_INFO(173, "173"),
[174] = INT_INFO(174, "174"),
[175] = INT_INFO(175, "175"),
[176] = INT_INFO(176, "176"),
[177] = INT_INFO(177, "177"),
[178] = INT_INFO(178, "178"),
[179] = INT_INFO(179, "179"),
[180] = INT_INFO(180, "180"),
[181] = INT_INFO(181, "181"),
[182] = INT_INFO(182, "182"),
[183] = INT_INFO(183, "183"),
[184] = INT_INFO(184, "184"),
[185] = INT_INFO(185, "185"),
[186] = INT_INFO(186, "186"),
[187] = INT_INFO(187, "187"),
[188] = INT_INFO(188, "188"),
[189] = INT_INFO(189, "189"),
[190] = INT_INFO(190, "190"),
[191] = INT_INFO(191, "191"),
[192] = INT_INFO(192, "192"),
[193] = INT_INFO(193, "193"),
[194] = INT_INFO(194, "194"),
[195] = INT_INFO(195, "195"),
[196] = INT_INFO(196, "196"),
[197] = INT_INFO(197, "197"),
[198] = INT_INFO(198, "198"),
[199] = INT_INFO(199, "199"),
[200] = INT_INFO(200, "200"),
[201] = INT_INFO(201, "201"),
[202] = INT_INFO(202, "202"),
[203] = INT_INFO(203, "203"),
[204] = INT_INFO(204, "204"),
[205] = INT_INFO(205, "205"),
[206] = INT_INFO(206, "206"),
[207] = INT_INFO(207, "207"),
[208] = INT_INFO(208, "208"),
[209] = INT_INFO(209, "209"),
[210] = INT_INFO(210, "210"),
[211] = INT_INFO(211, "211"),
[212] = INT_INFO(212, "212"),
[213] = INT_INFO(213, "213"),
[214] = INT_INFO(214, "214"),
[215] = INT_INFO(215, "215"),
[216] = INT_INFO(216, "216"),
[217] = INT_INFO(217, "217"),
[218] = INT_INFO(218, "218"),
[219] = INT_INFO(219, "219"),
[220] = INT_INFO(220, "220"),
[221] = INT_INFO(221, "221"),
[222] = INT_INFO(222, "222"),
[223] = INT_INFO(223, "223"),
[224] = INT_INFO(224, "224"),
[225] = INT_INFO(225, "225"),
[226] = INT_INFO(226, "226"),
[227] = INT_INFO(227, "227"),
[228] = INT_INFO(228, "228"),
[229] = INT_INFO(229, "229"),
[230] = INT_INFO(230, "230"),
[231] = INT_INFO(231, "231"),
[232] = INT_INFO(232, "232"),
[233] = INT_INFO(233, "233"),
[234] = INT_INFO(234, "234"),
[235] = INT_INFO(235, "235"),
[236] = INT_INFO(236, "236"),
[237] = INT_INFO(237, "237"),
[238] = INT_INFO(238, "238"),
[239] = INT_INFO(239, "239"),
[240] = INT_INFO(240, "240"),
[241] = INT_INFO(241, "241"),
[242] = INT_INFO(242, "242"),
[243] = INT_INFO(243, "243"),
[244] = INT_INFO(244, "244"),
[245] = INT_INFO(245, "245"),
[246] = INT_INFO(246, "246"),
[247] = INT_INFO(247, "247"),
[248] = INT_INFO(248, "248"),
[249] = INT_INFO(249, "249"),
[250] = INT_INFO(250, "250"),
[251] = INT_INFO(251, "251"),
[252] = INT_INFO(252, "252"),
[253] = INT_INFO(253, "253"),
[254] = INT_INFO(254, "254"),
[255] = INT_INFO(255, "255"),
};

static struct idt_entry entries[256];
static struct idtr idtr = {
	.limit = sizeof(entries) - 1,
	.entries = entries,
};

static const char *get_int_name(unsigned int_no)
{
	if (!int_infos[int_no].name)
		return "Unknown Interrupt";

	return int_infos[int_no].name;
}

void print_int_frame(struct int_frame *frame)
{
	cprintf("INT frame at %p\n", frame);

	/* Print the interrupt number and the name. */
	cprintf(" INT %u: %s\n",
		frame->int_no,
		get_int_name(frame->int_no));

	/* Print the error code. */
	switch (frame->int_no) {
	case INT_PAGE_FAULT:
		cprintf(" CR2 %p\n", read_cr2());
		
		cprintf(" ERR 0x%016llx (%s, %s, %s, %s)\n",
			frame->err_code,
			frame->err_code & 4 ? "user" : "kernel",
			frame->err_code & 2 ? "write" : "read",
			frame->err_code & 1 ? "present" : "not present",
			frame->err_code & PF_IFETCH ? "ifetch" : "not ifetch"
		);
		break;
	default:
		cprintf(" ERR 0x%016llx\n", frame->err_code);
	}

	/* Print the general-purpose registers. */
	cprintf(" RAX 0x%016llx"
		" RCX 0x%016llx"
		" RDX 0x%016llx"
		" RBX 0x%016llx\n"
		" RSP 0x%016llx"
		" RBP 0x%016llx"
		" RSI 0x%016llx"
		" RDI 0x%016llx\n"
		" R8  0x%016llx"
		" R9  0x%016llx"
		" R10 0x%016llx"
		" R11 0x%016llx\n"
		" R12 0x%016llx"
		" R13 0x%016llx"
		" R14 0x%016llx"
		" R15 0x%016llx\n",
		frame->rax, frame->rcx, frame->rdx, frame->rbx,
		frame->rsp, frame->rbp, frame->rsi, frame->rdi,
		frame->r8,  frame->r9,  frame->r10, frame->r11,
		frame->r12, frame->r13, frame->r14, frame->r15);

	/* Print the IP, segment selectors and the RFLAGS register. */
	cprintf(" RIP 0x%016llx"
		" RFL 0x%016llx\n"
		" CS  0x%04x"
		"            "
		" DS  0x%04x"
		"            "
		" SS  0x%04x\n",
		frame->rip, frame->rflags,
		frame->cs, frame->ds, frame->ss);
}

void isr_invalid();

/* Set up the interrupt handlers. */
void idt_init(void)
{
	struct idt_entry* entry;
	unsigned int flags = 0;
	struct int_info inf;
	for(int i = 0; i < 256; i++){
		inf = int_infos[i];
		if(inf.handler){
			entry = entries + i;
			
			flags = IDT_PRESENT;
			switch (i)
			{
			case INT_DEBUG:
			case INT_BREAK:
			case INT_OVERFLOW:
				flags |= IDT_TRAP_GATE32;
				break;
			
			default:
				flags |= IDT_INT_GATE32;
				break;
			}

			switch (i)
			{
			case INT_SYSCALL:
			case INT_BREAK:
			case INT_OVERFLOW:
				flags |= IDT_PRIVL(3);
				break;
			
			default:
				flags |= IDT_PRIVL(0);
				break;
			}
			set_idt_entry(entry, inf.handler, flags, GDT_KCODE); 
		}else{
			set_idt_entry(entry, isr_invalid, IDT_PRESENT | IDT_INT_GATE32 | IDT_PRIVL(0), GDT_KCODE);
			//cprintf("ISR_NOERRCODE %d\n", i);
			//cprintf("DEF_INT_HANDLER(%d)\n", i);
			//cprintf("[%d] = INT_INFO(%d, \"%d\"),\n", i, i, i);
		}
	}
	load_idt(&idtr);
}

void int_dispatch(struct int_frame *frame)
{
	switch (frame->int_no) {

		case INT_BREAK:
			return monitor(frame);

		//now that some page faults are valid do we need to do iret64?
		case INT_PAGE_FAULT:
			//print_int_frame(frame);
			page_fault_handler(frame);
			iret64(frame);

		case INT_SYSCALL:
			//print_int_frame(frame);
			frame->rax = syscall(frame->rdi, frame->rsi, frame->rdx, frame->rcx, frame->r8, frame->r9, frame->rbp);
			return;

		case IRQ_TIMER:
			cprintf("IRQ timer received\n");
			irq_timer_handler(frame);
	
		default: break;
	}

	/* Unexpected trap: The user process or the kernel has a bug. */
	cprintf("Unxpected intterupt with id\n");
	print_int_frame(frame);
	lapic_eoi();

	if (frame->cs == GDT_KCODE) {
		panic("unhandled interrupt in kernel");
	} else {
		task_destroy(cur_task);
		return;
	}
}

void int_handler(struct int_frame *frame)
{
	/* The task may have set DF and some versions of GCC rely on DF being
	 * clear. */
	asm volatile("cld" ::: "cc");
	/* Check if interrupts are disabled.
	 * If this assertion fails, DO NOT be tempted to fix it by inserting a
	 * "cli" in the interrupt path.
	 */
	assert(!(read_rflags() & FLAGS_IF));

	if ((frame->cs & 3) == 3) {
		/* Interrupt from user mode. */
		assert(cur_task);

		/* Copy interrupt frame (which is currently on the stack) into
		 * 'cur_task->task_frame', so that running the task will restart at
		 * the point of interrupt. */
		cur_task->task_frame = *frame;

		/* Avoid using the frame on the stack. */
		frame = &cur_task->task_frame;
	}

	/* Dispatch based on the type of interrupt that occurred. */
	cur_task->task_frame.rflags |= FLAGS_IF;
	int_dispatch(frame);

	/* Return to the current task, which should be running. */
	task_run(cur_task);
}

#include <kernel/mem.h>

void page_fault_handler(struct int_frame *frame)
{
	void *fault_va;
	unsigned perm = 0;
	int ret;

	/* Read the CR2 register to find the faulting address. */
	fault_va = (void *)read_cr2();


	/* Handle kernel-mode page faults. */
	if(!(frame->err_code & PF_USER)){
		print_int_frame(frame);
		cprintf("using pml4: pa:%p, kernel pml4: pa %p\n", read_cr3(), PADDR(kernel_pml4));
		panic("Page fault originated from the kernel");
	}

	if(task_page_fault_handler(cur_task, fault_va, frame->err_code) < 0){
	//	cprintf("entry pa: %p\n", page2pa(page));

		cprintf("[PID %5u] user fault is invalid!\n", cur_task->task_pid);
		print_int_frame(frame);
		task_destroy(cur_task);
	}
	//show_vmas(cur_task);
}

void irq_timer_handler(struct int_frame *frame){
	cprintf("got an irq timer\n");
	lapic_eoi();
	sched_yield();
}

