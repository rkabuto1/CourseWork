	.file	"lab04.c"
# GNU C17 (Debian 12.2.0-14) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.1-p1, MPC version 1.3.1, isl version isl-0.25-GMP

# warning: MPFR header version 4.1.1-p1 differs from library version 4.2.0.
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$24, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)	# n, n
# lab04.c:6:     if (n == 0 || n == 1) {
	cmpl	$0, -20(%rbp)	#, n
	je	.L2	#,
# lab04.c:6:     if (n == 0 || n == 1) {
	cmpl	$1, -20(%rbp)	#, n
	jne	.L3	#,
.L2:
# lab04.c:7:         return 1;
	movl	$1, %eax	#, _4
	jmp	.L4	#
.L3:
# lab04.c:9:         return n * factorial(n - 1);
	movl	-20(%rbp), %eax	# n, tmp87
	movslq	%eax, %rbx	# tmp87, _1
# lab04.c:9:         return n * factorial(n - 1);
	movl	-20(%rbp), %eax	# n, tmp88
	subl	$1, %eax	#, _2
	movl	%eax, %edi	# _2,
	call	factorial	#
# lab04.c:9:         return n * factorial(n - 1);
	imulq	%rbx, %rax	# _1, _4
.L4:
# lab04.c:11: }
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.section	.rodata
	.align 8
.LC0:
	.string	"char: The largest valid x is %d, and %d! = %llu\n"
	.align 8
.LC1:
	.string	"unsigned char: The largest valid x is %u, and %u! = %llu\n"
	.align 8
.LC2:
	.string	"short: The largest valid x is %d, and %d! = %llu\n"
	.align 8
.LC3:
	.string	"unsigned short: The largest valid x is %u, and %u! = %llu\n"
	.align 8
.LC4:
	.string	"int: The largest valid x is %d, and %d! = %llu\n"
	.align 8
.LC5:
	.string	"unsigned int: The largest valid x is %u, and %u! = %llu\n"
	.align 8
.LC6:
	.string	"long: The largest valid x is %ld, and %ld! = %llu\n"
	.align 8
.LC7:
	.string	"unsigned long long: The largest valid x is %d, and %d! = %llu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$208, %rsp	#,
# lab04.c:18:     int LC = 0;
	movl	$0, -8(%rbp)	#, LC
# lab04.c:19:     unsigned long LCResult = 0;
	movq	$0, -16(%rbp)	#, LCResult
# lab04.c:21:     for (c = 0; c <= 127; c++) {
	movb	$0, -1(%rbp)	#, c
.L9:
# lab04.c:22:         unsigned long r = factorial(c);
	movsbl	-1(%rbp), %eax	# c, _1
	movl	%eax, %edi	# _1,
	call	factorial	#
	movq	%rax, -144(%rbp)	# tmp104, r
# lab04.c:23:         if (r <= 127) {
	cmpq	$127, -144(%rbp)	#, r
	ja	.L44	#,
# lab04.c:24:             LC = c;
	movsbl	-1(%rbp), %eax	# c, tmp105
	movl	%eax, -8(%rbp)	# tmp105, LC
# lab04.c:25:             LCResult = r;
	movq	-144(%rbp), %rax	# r, tmp106
	movq	%rax, -16(%rbp)	# tmp106, LCResult
# lab04.c:21:     for (c = 0; c <= 127; c++) {
	movzbl	-1(%rbp), %eax	# c, c.0_2
	addl	$1, %eax	#, _4
	movb	%al, -1(%rbp)	# _4, c
# lab04.c:21:     for (c = 0; c <= 127; c++) {
	jmp	.L9	#
.L44:
# lab04.c:27:             break;
	nop	
# lab04.c:31:     printf("char: The largest valid x is %d, and %d! = %llu\n", LC, LC, (unsigned long long)LCResult);
	movq	-16(%rbp), %rcx	# LCResult, tmp107
	movl	-8(%rbp), %edx	# LC, tmp108
	movl	-8(%rbp), %eax	# LC, tmp109
	movl	%eax, %esi	# tmp109,
	leaq	.LC0(%rip), %rax	#, tmp110
	movq	%rax, %rdi	# tmp110,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:37:     int lUC = 0;
	movl	$0, -24(%rbp)	#, lUC
# lab04.c:38:     unsigned long lc1Result = 0;
	movq	$0, -32(%rbp)	#, lc1Result
# lab04.c:40:     for (uc = 0; uc <= 255; uc++) {
	movb	$0, -17(%rbp)	#, uc
.L13:
# lab04.c:41:         unsigned long long r = factorial(uc);
	movzbl	-17(%rbp), %eax	# uc, _5
	movl	%eax, %edi	# _5,
	call	factorial	#
	movq	%rax, -152(%rbp)	# tmp111, r
# lab04.c:42:         if (r <= 255) {
	cmpq	$255, -152(%rbp)	#, r
	ja	.L45	#,
# lab04.c:43:             lUC = uc;
	movzbl	-17(%rbp), %eax	# uc, tmp112
	movl	%eax, -24(%rbp)	# tmp112, lUC
# lab04.c:44:             lc1Result = r;
	movq	-152(%rbp), %rax	# r, tmp113
	movq	%rax, -32(%rbp)	# tmp113, lc1Result
# lab04.c:40:     for (uc = 0; uc <= 255; uc++) {
	movzbl	-17(%rbp), %eax	# uc, uc.2_6
	addl	$1, %eax	#, tmp114
	movb	%al, -17(%rbp)	# tmp114, uc
# lab04.c:40:     for (uc = 0; uc <= 255; uc++) {
	jmp	.L13	#
.L45:
# lab04.c:46:             break;
	nop	
# lab04.c:50:     printf("unsigned char: The largest valid x is %u, and %u! = %llu\n", lUC, lUC, (unsigned long long)lc1Result);
	movq	-32(%rbp), %rcx	# lc1Result, tmp115
	movl	-24(%rbp), %edx	# lUC, tmp116
	movl	-24(%rbp), %eax	# lUC, tmp117
	movl	%eax, %esi	# tmp117,
	leaq	.LC1(%rip), %rax	#, tmp118
	movq	%rax, %rdi	# tmp118,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:56:     int lS = 0;
	movl	$0, -40(%rbp)	#, lS
# lab04.c:57:     unsigned long long lS2Result = 0;
	movq	$0, -48(%rbp)	#, lS2Result
# lab04.c:59:     for (s = 0; s <= 15; s++) {
	movw	$0, -34(%rbp)	#, s
# lab04.c:59:     for (s = 0; s <= 15; s++) {
	jmp	.L14	#
.L18:
# lab04.c:60:         unsigned long long r = factorial(s);
	movswl	-34(%rbp), %eax	# s, _7
	movl	%eax, %edi	# _7,
	call	factorial	#
	movq	%rax, -160(%rbp)	# tmp119, r
# lab04.c:61:         if (r <= 32767) {
	cmpq	$32767, -160(%rbp)	#, r
	ja	.L46	#,
# lab04.c:62:             lS = s;
	movswl	-34(%rbp), %eax	# s, tmp120
	movl	%eax, -40(%rbp)	# tmp120, lS
# lab04.c:63:             lS2Result = r;
	movq	-160(%rbp), %rax	# r, tmp121
	movq	%rax, -48(%rbp)	# tmp121, lS2Result
# lab04.c:59:     for (s = 0; s <= 15; s++) {
	movzwl	-34(%rbp), %eax	# s, s.3_8
	addl	$1, %eax	#, _10
	movw	%ax, -34(%rbp)	# _10, s
.L14:
# lab04.c:59:     for (s = 0; s <= 15; s++) {
	cmpw	$15, -34(%rbp)	#, s
	jle	.L18	#,
	jmp	.L17	#
.L46:
# lab04.c:65:             break;
	nop	
.L17:
# lab04.c:69:     printf("short: The largest valid x is %d, and %d! = %llu\n", lS, lS, lS2Result);
	movq	-48(%rbp), %rcx	# lS2Result, tmp122
	movl	-40(%rbp), %edx	# lS, tmp123
	movl	-40(%rbp), %eax	# lS, tmp124
	movl	%eax, %esi	# tmp124,
	leaq	.LC2(%rip), %rax	#, tmp125
	movq	%rax, %rdi	# tmp125,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:74:     int larUS = 0;
	movl	$0, -56(%rbp)	#, larUS
# lab04.c:75:     unsigned long long VUS = 0;
	movq	$0, -64(%rbp)	#, VUS
# lab04.c:77:     for (us = 0; us <= 255; us++) {
	movw	$0, -50(%rbp)	#, us
# lab04.c:77:     for (us = 0; us <= 255; us++) {
	jmp	.L19	#
.L23:
# lab04.c:78:         unsigned long long r = factorial(us);
	movzwl	-50(%rbp), %eax	# us, _11
	movl	%eax, %edi	# _11,
	call	factorial	#
	movq	%rax, -168(%rbp)	# tmp126, r
# lab04.c:79:         if (r <= 65535) {
	cmpq	$65535, -168(%rbp)	#, r
	ja	.L47	#,
# lab04.c:80:             larUS = us;
	movzwl	-50(%rbp), %eax	# us, tmp127
	movl	%eax, -56(%rbp)	# tmp127, larUS
# lab04.c:81:             VUS = r;
	movq	-168(%rbp), %rax	# r, tmp128
	movq	%rax, -64(%rbp)	# tmp128, VUS
# lab04.c:77:     for (us = 0; us <= 255; us++) {
	movzwl	-50(%rbp), %eax	# us, us.5_12
	addl	$1, %eax	#, tmp129
	movw	%ax, -50(%rbp)	# tmp129, us
.L19:
# lab04.c:77:     for (us = 0; us <= 255; us++) {
	cmpw	$255, -50(%rbp)	#, us
	jbe	.L23	#,
	jmp	.L22	#
.L47:
# lab04.c:83:             break;
	nop	
.L22:
# lab04.c:87:     printf("unsigned short: The largest valid x is %u, and %u! = %llu\n", larUS, larUS, VUS);
	movq	-64(%rbp), %rcx	# VUS, tmp130
	movl	-56(%rbp), %edx	# larUS, tmp131
	movl	-56(%rbp), %eax	# larUS, tmp132
	movl	%eax, %esi	# tmp132,
	leaq	.LC3(%rip), %rax	#, tmp133
	movq	%rax, %rdi	# tmp133,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:92:     int VI = 0;
	movl	$0, -72(%rbp)	#, VI
# lab04.c:93:     unsigned long long VIRESULT = 0;
	movq	$0, -80(%rbp)	#, VIRESULT
# lab04.c:95:     for (i = 0; i <= 25; i++) {
	movl	$0, -68(%rbp)	#, i
# lab04.c:95:     for (i = 0; i <= 25; i++) {
	jmp	.L24	#
.L28:
# lab04.c:96:         unsigned long long r = factorial(i);
	movl	-68(%rbp), %eax	# i, tmp134
	movl	%eax, %edi	# tmp134,
	call	factorial	#
	movq	%rax, -176(%rbp)	# tmp135, r
# lab04.c:97:         if (r <= 2147483647) {
	movl	$2147483648, %eax	#, tmp136
	cmpq	%rax, -176(%rbp)	# tmp136, r
	jnb	.L48	#,
# lab04.c:98:             VI = i;
	movl	-68(%rbp), %eax	# i, tmp137
	movl	%eax, -72(%rbp)	# tmp137, VI
# lab04.c:99:             VIRESULT = r;
	movq	-176(%rbp), %rax	# r, tmp138
	movq	%rax, -80(%rbp)	# tmp138, VIRESULT
# lab04.c:95:     for (i = 0; i <= 25; i++) {
	addl	$1, -68(%rbp)	#, i
.L24:
# lab04.c:95:     for (i = 0; i <= 25; i++) {
	cmpl	$25, -68(%rbp)	#, i
	jle	.L28	#,
	jmp	.L27	#
.L48:
# lab04.c:101:             break;
	nop	
.L27:
# lab04.c:105:     printf("int: The largest valid x is %d, and %d! = %llu\n", VI, VI, VIRESULT);
	movq	-80(%rbp), %rcx	# VIRESULT, tmp139
	movl	-72(%rbp), %edx	# VI, tmp140
	movl	-72(%rbp), %eax	# VI, tmp141
	movl	%eax, %esi	# tmp141,
	leaq	.LC4(%rip), %rax	#, tmp142
	movq	%rax, %rdi	# tmp142,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:110:     int VUI = 0;
	movl	$0, -88(%rbp)	#, VUI
# lab04.c:111:     unsigned long long VUI1 = 0;
	movq	$0, -96(%rbp)	#, VUI1
# lab04.c:113:     for (ui = 0; ui <= 25; ui++) {
	movl	$0, -84(%rbp)	#, ui
# lab04.c:113:     for (ui = 0; ui <= 25; ui++) {
	jmp	.L29	#
.L33:
# lab04.c:114:         unsigned long long r = factorial(ui);
	movl	-84(%rbp), %eax	# ui, ui.6_13
	movl	%eax, %edi	# ui.6_13,
	call	factorial	#
	movq	%rax, -184(%rbp)	# tmp143, r
# lab04.c:115:         if (r <= 4294967295) {
	movl	$4294967295, %eax	#, tmp144
	cmpq	-184(%rbp), %rax	# r, tmp144
	jb	.L49	#,
# lab04.c:116:             VUI = ui;
	movl	-84(%rbp), %eax	# ui, tmp145
	movl	%eax, -88(%rbp)	# tmp145, VUI
# lab04.c:117:             VUI1  = r;
	movq	-184(%rbp), %rax	# r, tmp146
	movq	%rax, -96(%rbp)	# tmp146, VUI1
# lab04.c:113:     for (ui = 0; ui <= 25; ui++) {
	addl	$1, -84(%rbp)	#, ui
.L29:
# lab04.c:113:     for (ui = 0; ui <= 25; ui++) {
	cmpl	$25, -84(%rbp)	#, ui
	jbe	.L33	#,
	jmp	.L32	#
.L49:
# lab04.c:119:             break;
	nop	
.L32:
# lab04.c:123:     printf("unsigned int: The largest valid x is %u, and %u! = %llu\n", VUI, VUI, VUI1 );
	movq	-96(%rbp), %rcx	# VUI1, tmp147
	movl	-88(%rbp), %edx	# VUI, tmp148
	movl	-88(%rbp), %eax	# VUI, tmp149
	movl	%eax, %esi	# tmp149,
	leaq	.LC5(%rip), %rax	#, tmp150
	movq	%rax, %rdi	# tmp150,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:128:     int VL = 0;
	movl	$0, -108(%rbp)	#, VL
# lab04.c:129:     unsigned long long VLResult = 0;
	movq	$0, -120(%rbp)	#, VLResult
# lab04.c:131:     for (l = 0; l <= 25; l++) {
	movq	$0, -104(%rbp)	#, l
# lab04.c:131:     for (l = 0; l <= 25; l++) {
	jmp	.L34	#
.L38:
# lab04.c:132:         unsigned long long r = factorial(l);
	movq	-104(%rbp), %rax	# l, tmp151
	movl	%eax, %edi	# _14,
	call	factorial	#
	movq	%rax, -192(%rbp)	# tmp152, r
# lab04.c:133:         if (r <= 9223372036854775807) {
	movq	-192(%rbp), %rax	# r, r.7_15
# lab04.c:133:         if (r <= 9223372036854775807) {
	testq	%rax, %rax	# r.7_15
	js	.L50	#,
# lab04.c:134:             VL = l;
	movq	-104(%rbp), %rax	# l, tmp153
	movl	%eax, -108(%rbp)	# tmp153, VL
# lab04.c:135:             VLResult = r;
	movq	-192(%rbp), %rax	# r, tmp154
	movq	%rax, -120(%rbp)	# tmp154, VLResult
# lab04.c:131:     for (l = 0; l <= 25; l++) {
	addq	$1, -104(%rbp)	#, l
.L34:
# lab04.c:131:     for (l = 0; l <= 25; l++) {
	cmpq	$25, -104(%rbp)	#, l
	jle	.L38	#,
	jmp	.L37	#
.L50:
# lab04.c:139:             break;
	nop	
.L37:
# lab04.c:143:    printf("long: The largest valid x is %ld, and %ld! = %llu\n", (long)VL, (long)VL, (unsigned long long)VLResult);
	movl	-108(%rbp), %eax	# VL, tmp155
	movslq	%eax, %rdx	# tmp155, _16
	movl	-108(%rbp), %eax	# VL, tmp156
	cltq
	movq	-120(%rbp), %rcx	# VLResult, tmp157
	movq	%rax, %rsi	# _17,
	leaq	.LC6(%rip), %rax	#, tmp158
	movq	%rax, %rdi	# tmp158,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:150:     unsigned long long LLUL1 = 1;
	movq	$1, -128(%rbp)	#, LLUL1
# lab04.c:151:     int ULL = 0;
	movl	$0, -132(%rbp)	#, ULL
# lab04.c:152:     const unsigned long long maxValue = 18446744073709551615ULL; 
	movq	$-1, -200(%rbp)	#, maxValue
# lab04.c:154:     for (int ul = 1; ; ul++) 
	movl	$1, -136(%rbp)	#, ul
.L42:
# lab04.c:156:         if (LLUL1 <= maxValue / ul) 
	movl	-136(%rbp), %eax	# ul, tmp159
	movslq	%eax, %rsi	# tmp159, _18
	movq	-200(%rbp), %rax	# maxValue, tmp162
	movl	$0, %edx	#, tmp161
	divq	%rsi	# _18
# lab04.c:156:         if (LLUL1 <= maxValue / ul) 
	cmpq	-128(%rbp), %rax	# LLUL1, _19
	jb	.L51	#,
# lab04.c:158:             LLUL1 *= ul;
	movl	-136(%rbp), %eax	# ul, tmp163
	cltq
	movq	-128(%rbp), %rdx	# LLUL1, tmp165
	imulq	%rdx, %rax	# tmp165, tmp164
	movq	%rax, -128(%rbp)	# tmp164, LLUL1
# lab04.c:159:             ULL = ul;
	movl	-136(%rbp), %eax	# ul, tmp166
	movl	%eax, -132(%rbp)	# tmp166, ULL
# lab04.c:154:     for (int ul = 1; ; ul++) 
	addl	$1, -136(%rbp)	#, ul
# lab04.c:156:         if (LLUL1 <= maxValue / ul) 
	jmp	.L42	#
.L51:
# lab04.c:162:             break;
	nop	
# lab04.c:166:     printf("unsigned long long: The largest valid x is %d, and %d! = %llu\n", ULL, ULL, LLUL1);
	movq	-128(%rbp), %rcx	# LLUL1, tmp167
	movl	-132(%rbp), %edx	# ULL, tmp168
	movl	-132(%rbp), %eax	# ULL, tmp169
	movl	%eax, %esi	# tmp169,
	leaq	.LC7(%rip), %rax	#, tmp170
	movq	%rax, %rdi	# tmp170,
	movl	$0, %eax	#,
	call	printf@PLT	#
# lab04.c:168:     return 0;
	movl	$0, %eax	#, _120
# lab04.c:169: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
