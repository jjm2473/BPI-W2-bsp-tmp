	.cpu generic+fp+simd
	.file	"fast_pptp_core.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
#APP
	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
	.equ	.L__reg_num_x\num, \num
	.endr
	.equ	.L__reg_num_xzr, 31

	.macro	mrs_s, rt, sreg
	.inst	0xd5200000|(\sreg)|(.L__reg_num_\rt)
	.endm

	.macro	msr_s, sreg, rt
	.inst	0xd5000000|(\sreg)|(.L__reg_num_\rt)
	.endm

#NO_APP
	.align	2
	.global	sync_tx_pptp_gre_seqno
	.type	sync_tx_pptp_gre_seqno, %function
sync_tx_pptp_gre_seqno:
.LFB3833:
	.file 1 "net/rtl/fastpath/fast_pptp_core.c"
	.loc 1 812 0
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.loc 1 819 0
	adrp	x19, .LANCHOR0
	.loc 1 812 0
	stp	x23, x24, [sp, 48]
	stp	x21, x22, [sp, 32]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.loc 1 812 0
	mov	x23, x0
	.loc 1 813 0
	bl	rtl_get_skb_data
	mov	x20, x0
	.loc 1 819 0
	ldr	w0, [x19, #:lo12:.LANCHOR0]
	add	x24, x19, :lo12:.LANCHOR0
	cbz	w0, .L1
.LBB159:
.LBB160:
	.file 2 "./arch/arm64/include/asm/irqflags.h"
	.loc 2 29 0
#APP
// 29 "./arch/arm64/include/asm/irqflags.h" 1
	mrs	x22, daif		// arch_local_irq_save
msr	daifset, #2
// 0 "" 2
#NO_APP
.LBE160:
.LBE159:
	.loc 1 824 0
	add	x21, x20, 14
	ldrb	w0, [x21, 9]
	cmp	w0, 47
	bne	.L4
	.loc 1 824 0 is_stmt 0 discriminator 1
	mov	x0, x23
	bl	rtl_get_skb_len
	cmp	w0, 34
	bls	.L4
.LBB161:
	.loc 1 833 0 is_stmt 1
	mov	x0, x23
	bl	rtl_get_skb_data
	ldrb	w1, [x20, 14]
	mov	x2, 14
	and	w1, w1, 15
	add	x1, x2, x1, uxtw 2
	add	x2, x0, x1
.LBB162:
.LBB163:
	.loc 1 97 0
	ldrb	w4, [x2, 2]
.LBE163:
.LBE162:
	.loc 1 836 0
	ldrb	w3, [x2, 1]
.LBB165:
.LBB164:
	.loc 1 97 0
	strb	w4, [x29, 74]
	ldrb	w4, [x2, 3]
	strb	w4, [x29, 75]
.LBE164:
.LBE165:
	.loc 1 836 0
	and	w4, w3, 7
	cmp	w4, 1
	bne	.L4
	ldrh	w4, [x29, 74]
	mov	w5, 34827
	rev16	w4, w4
	cmp	w5, w4, uxth
	bne	.L4
	.loc 1 873 0
	ldrb	w0, [x0, x1]
	tbz	x0, 4, .L9
	.loc 1 874 0
	ldrh	w0, [x24, 66]
	add	x24, x24, 8
	ldrh	w1, [x21, 4]
	cmp	w1, w0
	beq	.L10
	.loc 1 875 0
	ldrh	w1, [x2, 6]
	ldrh	w0, [x24, 30]
	cmp	w1, w0
	bne	.L10
	.loc 1 875 0 is_stmt 0 discriminator 1
	ldr	w1, [x24, 44]
	ldr	w0, [x21, 16]
	cmp	w1, w0
	bne	.L4
	ldr	w1, [x2, 8]
	.loc 1 880 0 is_stmt 1
	ldr	w0, [x24, 48]
	rev	w1, w1
.LBB166:
.LBB167:
	.loc 1 97 0
	strb	w1, [x24, 60]
.LBE167:
.LBE166:
	.loc 1 880 0
	add	w3, w0, 1
.LBB170:
.LBB168:
	.loc 1 97 0
	lsr	w4, w1, 8
.LBE168:
.LBE170:
	.loc 1 880 0
	str	w3, [x24, 48]
	rev	w0, w0
.LBB171:
.LBB169:
	.loc 1 97 0
	strb	w4, [x24, 61]
	lsr	w3, w1, 16
	lsr	w1, w1, 24
	strb	w3, [x24, 62]
	strb	w1, [x24, 63]
.LBE169:
.LBE171:
.LBB172:
.LBB173:
	lsr	w3, w0, 16
	lsr	w4, w0, 8
	lsr	w1, w0, 24
	strb	w3, [x2, 10]
.LBE173:
.LBE172:
	.loc 1 880 0
	str	w0, [x29, 76]
.LBB175:
.LBB174:
	.loc 1 97 0
	strb	w0, [x2, 8]
	strb	w4, [x2, 9]
	strb	w1, [x2, 11]
	ldrb	w3, [x2, 1]
	b	.L9
.L22:
.LBE174:
.LBE175:
	.loc 1 887 0
	mov	w1, 0
	b	.L11
.L23:
	mov	w1, 1
.L11:
	.loc 1 888 0
	add	x0, x19, :lo12:.LANCHOR0
	ldrh	w4, [x2, 6]
	add	x0, x0, 8
	ldrh	w3, [x0, 30]
	cmp	w4, w3
	bne	.L4
	.loc 1 888 0 is_stmt 0 discriminator 1
	ldr	w4, [x0, 44]
	ldr	w3, [x21, 16]
	cmp	w4, w3
	bne	.L4
	ldr	w0, [x0, 52]
	rev	w0, w0
	.loc 1 891 0 is_stmt 1
	str	w0, [x29, 76]
.LBB176:
.LBB177:
	.loc 1 97 0
	lsr	w5, w0, 8
	lsr	w4, w0, 16
	lsr	w3, w0, 24
	strb	w0, [x2, 12]
	strb	w5, [x2, 13]
	strb	w4, [x2, 14]
	strb	w3, [x2, 15]
.LBE177:
.LBE176:
	.loc 1 896 0
	cbnz	w1, .L4
.L12:
	.loc 1 897 0
	add	x2, x19, :lo12:.LANCHOR0
	.loc 1 901 0
	mov	x0, x21
	.loc 1 897 0
	ldrh	w1, [x2, 64]
	add	w1, w1, 1
	uxth	w1, w1
	strh	w1, [x2, 64]
	.loc 1 898 0
	strh	wzr, [x21, 10]
	rev16	w1, w1
	.loc 1 897 0
	strh	w1, [x21, 4]
	.loc 1 901 0
	ldrb	w1, [x20, 14]
	and	w1, w1, 15
	bl	ip_fast_csum
	strh	w0, [x21, 10]
.L4:
.LBE161:
.LBB178:
.LBB179:
	.loc 2 81 0
#APP
// 81 "./arch/arm64/include/asm/irqflags.h" 1
	msr	daif, x22		// arch_local_irq_restore
// 0 "" 2
#NO_APP
	b	.L1
.L9:
.LBE179:
.LBE178:
.LBB180:
	.loc 1 887 0
	tbz	x3, 7, .L12
	b	.L22
.L10:
	tbz	x3, 7, .L4
	b	.L23
.L1:
.LBE180:
	.loc 1 908 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3833:
	.size	sync_tx_pptp_gre_seqno, .-sync_tx_pptp_gre_seqno
	.align	2
	.global	ppfw_read_proc
	.type	ppfw_read_proc, %function
ppfw_read_proc:
.LFB3837:
	.loc 1 1007 0
	.cfi_startproc
	.loc 1 1008 0
	adrp	x2, .LANCHOR0
	adrp	x1, .LC0
	.loc 1 1007 0
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	.loc 1 1008 0
	add	x1, x1, :lo12:.LC0
	.loc 1 1007 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1008 0
	ldr	w2, [x2, #:lo12:.LANCHOR0]
	bl	seq_printf
	.loc 1 1011 0
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3837:
	.size	ppfw_read_proc, .-ppfw_read_proc
	.align	2
	.global	pptpconn_read_proc
	.type	pptpconn_read_proc, %function
pptpconn_read_proc:
.LFB3838:
	.loc 1 1014 0
	.cfi_startproc
	.loc 1 1015 0
	adrp	x2, .LANCHOR0+96
	adrp	x1, .LC0
	.loc 1 1014 0
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	.loc 1 1015 0
	add	x1, x1, :lo12:.LC0
	.loc 1 1014 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1015 0
	ldr	w2, [x2, #:lo12:.LANCHOR0+96]
	bl	seq_printf
	.loc 1 1018 0
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3838:
	.size	pptpconn_read_proc, .-pptpconn_read_proc
	.align	2
	.global	fastpath_pptp_single_open
	.type	fastpath_pptp_single_open, %function
fastpath_pptp_single_open:
.LFB3839:
	.loc 1 1021 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x0, x1
	.loc 1 1022 0
	adrp	x1, ppfw_read_proc
	.loc 1 1021 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1022 0
	mov	x2, 0
	add	x1, x1, :lo12:ppfw_read_proc
	.loc 1 1021 0
	.loc 1 1022 0
	bl	single_open
	.loc 1 1023 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3839:
	.size	fastpath_pptp_single_open, .-fastpath_pptp_single_open
	.align	2
	.global	pptp_conn_single_open
	.type	pptp_conn_single_open, %function
pptp_conn_single_open:
.LFB3841:
	.loc 1 1041 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x0, x1
	.loc 1 1042 0
	adrp	x1, pptpconn_read_proc
	.loc 1 1041 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1042 0
	mov	x2, 0
	add	x1, x1, :lo12:pptpconn_read_proc
	.loc 1 1041 0
	.loc 1 1042 0
	bl	single_open
	.loc 1 1043 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3841:
	.size	pptp_conn_single_open, .-pptp_conn_single_open
	.align	2
	.global	is_pptp_device
	.type	is_pptp_device, %function
is_pptp_device:
.LFB3824:
	.loc 1 75 0
	.cfi_startproc
	.loc 1 76 0
	adrp	x1, .LANCHOR0+80
	.loc 1 75 0
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 76 0
	ldr	x1, [x1, #:lo12:.LANCHOR0+80]
	.loc 1 75 0
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	.loc 1 76 0
	cbz	x1, .L30
	mov	x19, x0
	.loc 1 76 0 is_stmt 0 discriminator 1
	mov	x0, x1
	bl	rtl_get_ppp_dev_name
	mov	x1, x19
	bl	strcmp
	cmp	w0, wzr
	cset	w0, eq
	b	.L29
.L30:
	.loc 1 81 0 is_stmt 1
	mov	w0, 0
.L29:
	.loc 1 82 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3824:
	.size	is_pptp_device, .-is_pptp_device
	.align	2
	.global	set_pptp_device
	.type	set_pptp_device, %function
set_pptp_device:
.LFB3825:
	.loc 1 85 0
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	.loc 1 86 0
	adrp	x1, .LANCHOR0
	.loc 1 85 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	.loc 1 86 0
	add	x19, x1, :lo12:.LANCHOR0
	ldr	w1, [x1, #:lo12:.LANCHOR0]
	cbz	w1, .L31
	.loc 1 89 0
	bl	rtl_get_dev_by_name
	str	x0, [x19, 80]
.L31:
	.loc 1 91 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3825:
	.size	set_pptp_device, .-set_pptp_device
	.align	2
	.global	Check_GRE_rx_net_device
	.type	Check_GRE_rx_net_device, %function
Check_GRE_rx_net_device:
.LFB3827:
	.loc 1 101 0
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.loc 1 107 0
	adrp	x19, .LANCHOR0
	.loc 1 101 0
	str	x23, [sp, 48]
	stp	x21, x22, [sp, 32]
	.cfi_offset 23, -16
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.loc 1 107 0
	add	x19, x19, :lo12:.LANCHOR0
	.loc 1 101 0
	mov	x22, x0
	.loc 1 104 0
	bl	rtl_ip_hdr
	mov	x20, x0
	.loc 1 105 0
	mov	x0, x22
	.loc 1 107 0
	add	x19, x19, 8
	.loc 1 105 0
	bl	rtl_get_skb_data
	.loc 1 107 0
	ldr	x21, [x19, 16]
	.loc 1 105 0
	mov	x23, x0
	ldrb	w0, [x20]
	and	w20, w0, 15
	.loc 1 107 0
	cbz	x21, .L38
	.loc 1 110 0
	mov	x0, x22
	bl	rtl_get_skb_dev
	cmp	x21, x0
	.loc 1 113 0
	mov	w0, 0
	.loc 1 110 0
	bne	.L37
	.loc 1 105 0 discriminator 1
	ubfiz	x0, x20, 2, 4
	.loc 1 110 0 discriminator 1
	ldrh	w1, [x19, 42]
	add	x0, x23, x0
	ldrh	w0, [x0, 6]
	cmp	w0, w1
	cset	w0, eq
	b	.L37
.L38:
	.loc 1 115 0
	mov	w0, 0
.L37:
	.loc 1 116 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3827:
	.size	Check_GRE_rx_net_device, .-Check_GRE_rx_net_device
	.align	2
	.global	fast_pptp_filter
	.type	fast_pptp_filter, %function
fast_pptp_filter:
.LFB3828:
	.loc 1 120 0
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x20, x0
	str	x23, [sp, 48]
	.cfi_offset 23, -16
	.loc 1 128 0
	bl	rtl_ip_hdr
	mov	x19, x0
	.loc 1 130 0
	mov	x0, x20
	bl	rtl_get_skb_len
	cmp	w0, 55
	bls	.L40
.LBB181:
	.loc 1 133 0
	ldrb	w1, [x19, 9]
	.loc 1 131 0
	ldrb	w0, [x19]
	.loc 1 133 0
	cmp	w1, 6
	.loc 1 131 0
	and	w0, w0, 15
	.loc 1 133 0
	bne	.L40
	.loc 1 131 0 discriminator 1
	ubfiz	x0, x0, 2, 4
	.loc 1 133 0 discriminator 1
	mov	w1, 47878
	.loc 1 131 0 discriminator 1
	add	x3, x19, x0
	.loc 1 133 0 discriminator 1
	ldrh	w2, [x19, x0]
	cmp	w2, w1
	bne	.L40
	.loc 1 134 0
	ldrb	w0, [x3, 12]
	ubfx	x0, x0, 4, 4
	sub	w0, w0, #5
	lsl	w0, w0, 2
	sxtw	x0, w0
	add	x0, x0, 20
	add	x0, x3, x0
	ldrh	w1, [x0, 2]
	rev16	w1, w1
	uxth	w1, w1
	.loc 1 138 0
	cmp	w1, 1
	bne	.L40
	ldrh	w1, [x0, 8]
	rev16	w2, w1
	uxth	w2, w2
	.loc 1 139 0 discriminator 3
	cmp	w2, 8
	bne	.L42
	.loc 1 140 0 discriminator 1
	add	x2, x0, 12
	.loc 1 139 0 discriminator 1
	ldrb	w3, [x2, 4]
	cmp	w3, 1
	bne	.L42
	.loc 1 147 0
	adrp	x1, .LANCHOR0
	add	x3, x1, :lo12:.LANCHOR0
	add	x3, x3, 8
	ldr	w4, [x3, 48]
	cbz	w4, .L64
	.loc 1 147 0 is_stmt 0 discriminator 1
	ldr	w4, [x3, 32]
	cbz	w4, .L64
	.loc 1 147 0 discriminator 2
	ldr	w4, [x3, 44]
	cbnz	w4, .L62
.L64:
	ldrh	w3, [x0, 12]
	b	.L43
.L62:
	.loc 1 148 0 is_stmt 1
	ldrh	w4, [x3, 30]
	ldrh	w3, [x0, 12]
	cmp	w4, w3
	bne	.L40
	.loc 1 148 0 is_stmt 0 discriminator 1
	add	x0, x1, :lo12:.LANCHOR0
	ldrh	w4, [x2, 2]
	ldrh	w0, [x0, 50]
	cmp	w0, w4
	bne	.L40
.L43:
	.loc 1 154 0 is_stmt 1
	add	x21, x1, :lo12:.LANCHOR0
	.loc 1 163 0
	mov	x0, x20
	.loc 1 154 0
	mov	w23, 1
	.loc 1 155 0
	strh	w3, [x21, 38]
	.loc 1 154 0
	str	w23, [x21, 100]
	.loc 1 156 0
	ldrh	w1, [x2, 2]
	strh	w1, [x21, 50]
	.loc 1 160 0
	ldr	w1, [x19, 16]
	str	w1, [x21, 40]
	.loc 1 161 0
	ldr	w1, [x19, 12]
	str	w1, [x21, 52]
	.loc 1 162 0
	str	w23, [x21, 56]
	.loc 1 163 0
	bl	rtl_get_skb_dev
	str	x0, [x21, 24]
	.loc 1 166 0
	mov	x0, x20
	bl	rtl_get_skb_data
	mov	x1, x0
	.loc 1 167 0
	mov	x0, x20
	.loc 1 166 0
	ldr	w2, [x1, -8]
	str	w2, [x21, 44]
	ldr	w1, [x1, -6]
	str	w1, [x21, 46]
	.loc 1 167 0
	bl	rtl_get_skb_data
	ldr	w1, [x0, -14]
	str	w1, [x21, 32]
	ldr	w0, [x0, -12]
	str	w0, [x21, 34]
	.loc 1 186 0
	str	w23, [x21, 16]
	b	.L40
.L42:
	rev16	w1, w1
	uxth	w1, w1
	.loc 1 193 0
	cmp	w1, 13
	bne	.L40
	.loc 1 199 0
	adrp	x1, .LANCHOR0
	add	x2, x1, :lo12:.LANCHOR0
	add	x2, x2, 8
	ldr	w3, [x2, 48]
	cbz	w3, .L44
	.loc 1 199 0 is_stmt 0 discriminator 1
	ldr	w3, [x2, 32]
	cbz	w3, .L44
	.loc 1 199 0 discriminator 2
	ldr	w3, [x2, 44]
	cbz	w3, .L44
	.loc 1 200 0 is_stmt 1
	ldrh	w2, [x2, 30]
	ldrh	w0, [x0, 12]
	cmp	w2, w0
	bne	.L40
.L44:
	.loc 1 205 0
	add	x1, x1, :lo12:.LANCHOR0
	str	wzr, [x1, 100]
	.loc 1 206 0
	str	wzr, [x1, 16]
.L40:
.LBE181:
	.loc 1 297 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3828:
	.size	fast_pptp_filter, .-fast_pptp_filter
	.align	2
	.global	fast_pptp_to_lan
	.type	fast_pptp_to_lan, %function
fast_pptp_to_lan:
.LFB3829:
	.loc 1 474 0
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x21, x22, [sp, 32]
	stp	x19, x20, [sp, 16]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	.loc 1 488 0
	adrp	x21, .LANCHOR0
	.loc 1 474 0
	mov	x22, x0
	.loc 1 479 0
	ldr	x20, [x0]
	.loc 1 488 0
	add	x19, x21, :lo12:.LANCHOR0
	add	x19, x19, 8
	mov	x0, x20
	bl	rtl_get_skb_dev
	ldr	x1, [x19, 16]
	cmp	x1, x0
	beq	.L66
.L68:
	.loc 1 489 0
	mov	w0, 0
	b	.L67
.L66:
	.loc 1 488 0 discriminator 1
	mov	x0, x20
	bl	rtl_ip_hdr
	ldrb	w0, [x0, 9]
	cmp	w0, 47
	bne	.L68
	.loc 1 488 0 is_stmt 0 discriminator 2
	mov	x0, x20
	bl	rtl_get_skb_len
	cmp	w0, 19
	bls	.L68
	.loc 1 491 0 is_stmt 1
	mov	x0, x20
	bl	rtl_ip_hdr
	mov	x23, x0
	.loc 1 492 0
	mov	x0, x20
	bl	rtl_get_skb_data
	.loc 1 493 0
	ldrb	w1, [x23]
	ubfiz	x1, x1, 2, 4
	add	x3, x0, x1
	.loc 1 495 0
	ldrb	w2, [x3, 1]
	and	w2, w2, 7
	cmp	w2, 1
	bne	.L68
	ldrh	w2, [x3, 2]
	mov	w4, 34827
	rev16	w2, w2
	cmp	w4, w2, uxth
	bne	.L68
.LBB182:
	.loc 1 501 0
	ldrh	w4, [x3, 6]
	ldrh	w2, [x19, 42]
	cmp	w4, w2
	bne	.L68
	.loc 1 506 0
	ldrb	w1, [x0, x1]
	.loc 1 498 0
	mov	w0, 8
	.loc 1 506 0
	tbz	x1, 4, .L69
	ldr	w1, [x3, 8]
	.loc 1 508 0
	mov	w0, 12
	rev	w1, w1
	.loc 1 507 0
	str	w1, [x19, 52]
.L69:
	.loc 1 511 0
	ldrsb	w4, [x3, 1]
	.loc 1 512 0
	add	w2, w0, 4
	.loc 1 517 0
	ldrh	w1, [x3, 4]
	.loc 1 512 0
	cmp	w4, wzr
	csel	w0, w2, w0, lt
	.loc 1 517 0
	cbz	w1, .L68
	.loc 1 514 0
	sxtw	x1, w0
	add	x2, x3, x1
	.loc 1 545 0
	ldrb	w1, [x3, x1]
	cbnz	w1, .L71
	.loc 1 547 0
	add	x2, x2, 1
	.loc 1 546 0
	mov	w1, 1
	b	.L72
.L71:
	.loc 1 549 0
	cmp	w1, 255
	.loc 1 516 0
	mov	w1, 0
	.loc 1 549 0
	bne	.L72
	.loc 1 549 0 is_stmt 0 discriminator 1
	ldrb	w1, [x2, 1]
	cmp	w1, 3
	bne	.L68
	.loc 1 552 0 is_stmt 1
	ldrb	w4, [x2, 2]
	.loc 1 551 0
	add	x3, x2, 2
	.loc 1 554 0
	add	x2, x2, 3
	.loc 1 552 0
	cbz	w4, .L72
	.loc 1 551 0
	mov	x2, x3
	.loc 1 550 0
	mov	w1, 2
.L72:
	.loc 1 557 0
	ldrb	w24, [x2]
	cmp	w24, 253
	beq	.L86
	cmp	w24, 33
	bne	.L68
.L86:
	.loc 1 568 0
	ldrb	w19, [x23]
	.loc 1 570 0
	cmp	w24, 33
	.loc 1 558 0
	add	w1, w1, 1
	.loc 1 568 0
	ubfiz	w19, w19, 2, 4
	add	w0, w19, w0
	add	w19, w1, w0
	.loc 1 570 0
	beq	.L74
	.loc 1 571 0
	add	x23, x21, :lo12:.LANCHOR0
	add	x23, x23, 8
	ldr	x0, [x23, 72]
	cbz	x0, .L68
	.loc 1 571 0 is_stmt 0 discriminator 1
	bl	rtl_get_ppp_dev_priv
	cbz	x0, .L68
	.loc 1 574 0 is_stmt 1
	sub	w1, w19, #2
	mov	x0, x20
	bl	skb_pull
	.loc 1 575 0
	mov	x0, x20
	bl	rtl_get_skb_data
	.loc 1 576 0
	strb	wzr, [x0]
	.loc 1 577 0
	strb	w24, [x0, 1]
	.loc 1 578 0
	ldr	x0, [x23, 72]
	bl	rtl_get_ppp_dev_priv
	mov	x19, x0
	.loc 1 580 0
	bl	rtl_ppp_recv_lock
	.loc 1 581 0
	mov	x1, x20
	mov	w2, 1
	mov	x0, x19
	bl	rtl_ppp_receive_nonmp_frame
	mov	x20, x0
	.loc 1 582 0
	mov	x0, x19
	bl	rtl_ppp_recv_unlock
	.loc 1 583 0
	cbz	x20, .L85
	.loc 1 587 0
	str	x20, [x22]
	.loc 1 589 0
	mov	w23, 1
	b	.L75
.L74:
	.loc 1 593 0
	mov	w1, w19
	mov	x0, x20
.LBE182:
	.loc 1 482 0
	mov	w23, 0
.LBB183:
	.loc 1 593 0
	bl	skb_pull
.L75:
	.loc 1 600 0
	mov	x0, x20
	bl	rtl_get_skb_data
	.loc 1 601 0
	ands	w19, w0, 3
	beq	.L77
	.loc 1 602 0
	mov	x0, x20
	bl	rtl_skb_headroom
	cmp	w0, w19
	bcc	.L77
	.loc 1 604 0
	mov	x0, x20
	sxtw	x22, w19
	bl	rtl_get_skb_data
	sub	x22, x0, x22
	mov	x0, x20
	bl	rtl_get_skb_data
	mov	x24, x0
	mov	x0, x20
	bl	rtl_get_skb_len
	uxtw	x2, w0
	mov	x1, x24
	mov	x0, x22
	bl	memmove
	.loc 1 605 0
	mov	w2, 1
	mov	w1, w19
	mov	x0, x20
	bl	rtl_set_skb_data
	.loc 1 606 0
	mov	w2, 1
	mov	w1, w19
	mov	x0, x20
	bl	rtl_set_skb_tail
.L77:
	.loc 1 612 0
	mov	x0, x20
	.loc 1 619 0
	add	x19, x21, :lo12:.LANCHOR0
	add	x19, x19, 8
	.loc 1 612 0
	bl	rtl_skb_reset_network_header
	.loc 1 613 0
	mov	x0, x20
	bl	rtl_skb_reset_transport_header
	.loc 1 619 0
	ldr	x0, [x19, 72]
	cbz	x0, .L68
	.loc 1 621 0
	cbnz	w23, .L80
	.loc 1 622 0
	bl	rtl_get_ppp_dev_priv
	cbz	x0, .L80
	.loc 1 623 0
	ldr	x0, [x19, 72]
	bl	rtl_get_ppp_dev_priv
	mov	x19, x0
	.loc 1 624 0
	mov	x0, x20
	bl	rtl_get_skb_len
	sub	w2, w0, #2
	mov	w1, 0
	mov	x0, x19
	bl	rtl_inc_ppp_stats
.L80:
	.loc 1 632 0
	add	x1, x21, :lo12:.LANCHOR0
	mov	x0, x20
	ldr	x1, [x1, 80]
	bl	rtl_set_skb_dev
	.loc 1 633 0
	mov	w0, 1
	b	.L67
.L85:
	.loc 1 585 0
	mov	w0, -2
.L67:
.LBE183:
	.loc 1 650 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3829:
	.size	fast_pptp_to_lan, .-fast_pptp_to_lan
	.align	2
	.global	get_fastpptp_lastxmit
	.type	get_fastpptp_lastxmit, %function
get_fastpptp_lastxmit:
.LFB3830:
	.loc 1 653 0
	.cfi_startproc
	.loc 1 654 0
	adrp	x1, .LANCHOR0
	.loc 1 657 0
	mov	x0, 0
	.loc 1 654 0
	add	x2, x1, :lo12:.LANCHOR0
	ldr	w1, [x1, #:lo12:.LANCHOR0]
	cbz	w1, .L107
	.loc 1 654 0 is_stmt 0 discriminator 1
	ldr	w1, [x2, 16]
	cmp	w1, 1
	bne	.L107
	.loc 1 655 0 is_stmt 1
	ldr	x0, [x2, 8]
.L107:
	.loc 1 658 0
	ret
	.cfi_endproc
.LFE3830:
	.size	get_fastpptp_lastxmit, .-get_fastpptp_lastxmit
	.align	2
	.global	fast_pptp_to_wan
	.type	fast_pptp_to_wan, %function
fast_pptp_to_wan:
.LFB3831:
	.loc 1 663 0
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x20, x0
	str	x25, [sp, 64]
	stp	x23, x24, [sp, 48]
	.cfi_offset 25, -48
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	.loc 1 672 0
	bl	rtl_ip_hdr
	ldrb	w21, [x0, 12]
	.loc 1 673 0
	mov	x0, x20
	adrp	x22, .LANCHOR0
	bl	rtl_ip_hdr
	ldr	w19, [x0, 12]
	.loc 1 674 0
	mov	x0, x20
	.loc 1 673 0
	and	w19, w19, 65280
	.loc 1 674 0
	bl	rtl_ip_hdr
	.loc 1 675 0
	cmp	w21, 10
	cset	w2, eq
	cmp	w19, 16384
	cset	w1, eq
	tst	w2, w1
	beq	.L112
	.loc 1 674 0
	ldr	w0, [x0, 12]
	adrp	x22, .LANCHOR0
	and	w0, w0, 16711680
	.loc 1 675 0
	cmp	w0, 4194304
	bne	.L112
	.loc 1 675 0 is_stmt 0 discriminator 2
	add	x0, x22, :lo12:.LANCHOR0
	ldr	w0, [x0, 96]
	cmp	w0, 3
	bne	.L112
.L114:
	.loc 1 678 0 is_stmt 1
	mov	w21, 0
	b	.L113
.L112:
	.loc 1 681 0
	add	x19, x22, :lo12:.LANCHOR0
	add	x19, x19, 8
	ldr	x0, [x19, 72]
	cbz	x0, .L114
	.loc 1 681 0 is_stmt 0 discriminator 1
	bl	rtl_get_ppp_dev_name
	cbz	x0, .L114
	.loc 1 681 0 discriminator 2
	ldr	x0, [x19, 72]
	bl	rtl_get_ppp_dev_name
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	bl	strcmp
	mov	w21, w0
	cbnz	w0, .L114
	.loc 1 684 0 is_stmt 1
	ldr	w0, [x19, 8]
	cbz	w0, .L115
	.loc 1 684 0 is_stmt 0 discriminator 1
	ldr	x0, [x19, 72]
	cbnz	x0, .L116
.L124:
	.loc 1 773 0 is_stmt 1
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printk
	b	.L113
.L116:
	.loc 1 684 0 discriminator 2
	bl	rtl_get_ppp_dev_priv
	cbz	x0, .L115
.LBB184:
	.loc 1 687 0
	ldr	x0, [x19, 72]
	bl	rtl_get_ppp_dev_priv
	mov	x23, x0
	.loc 1 690 0
	bl	rtl_ppp_vj_check
	cmp	w0, 1
	beq	.L114
	.loc 1 695 0
	mov	x0, x20
	bl	rtl_ip_hdr
	ldrb	w24, [x0, 1]
	.loc 1 697 0
	mov	x0, x23
	bl	rtl_ppp_xmit_lock
	.loc 1 698 0
	mov	x0, x23
	bl	rtl_get_ppp_xmit_pending
	cbz	x0, .L117
	.loc 1 700 0
	mov	x0, x23
	bl	rtl_ppp_xmit_unlock
	.loc 1 701 0
	b	.L113
.L117:
	.loc 1 703 0
	adrp	x1, .LC3
	mov	w2, 3
	add	x1, x1, :lo12:.LC3
	mov	x0, x20
	bl	rtl_set_skb_cb
	.loc 1 704 0
	ldr	x1, [x19, 72]
	mov	x0, x20
	bl	rtl_ppp_start_xmit
	.loc 1 705 0
	mov	x0, x23
	bl	rtl_get_ppp_xmit_pending
	cbnz	x0, .L118
	.loc 1 707 0
	mov	x0, x23
	.loc 1 708 0
	mov	w21, 1
	.loc 1 707 0
	bl	rtl_ppp_xmit_unlock
	.loc 1 708 0
	b	.L113
.L118:
	.loc 1 711 0
	mov	x0, x23
	bl	rtl_get_ppp_xmit_pending
	mov	x19, x0
	.loc 1 713 0
	mov	x1, 0
	mov	x0, x23
	bl	rtl_set_ppp_xmit_pending
	.loc 1 714 0
	mov	x0, x23
	bl	rtl_ppp_xmit_unlock
	.loc 1 717 0
	mov	x0, x19
	bl	rtl_skb_headroom
	cmp	w0, 49
	bhi	.L119
.L122:
.LBB185:
	.loc 1 718 0
	mov	w1, 50
	mov	x0, x19
	bl	skb_realloc_headroom
	mov	x20, x0
	.loc 1 719 0
	cbnz	x0, .L149
	b	.L150
.L119:
.LBE185:
	.loc 1 717 0 discriminator 1
	mov	x0, x19
	bl	rtl_skb_cloned
	cbnz	w0, .L122
	.loc 1 717 0 is_stmt 0 discriminator 2
	mov	x0, x19
	.loc 1 711 0 is_stmt 1 discriminator 2
	mov	x20, x19
	.loc 1 717 0 discriminator 2
	bl	rtl_skb_shared
	cbz	w0, .L123
	b	.L122
.L150:
.LBB186:
	.loc 1 721 0
	mov	x0, x19
	.loc 1 722 0
	mov	w21, 1
	.loc 1 721 0
	bl	consume_skb
	.loc 1 722 0
	b	.L113
.L149:
	.loc 1 724 0
	mov	x0, x19
	bl	consume_skb
.L123:
.LBE186:
	.loc 1 730 0
	mov	w1, 50
	mov	x0, x20
	.loc 1 731 0
	add	x22, x22, :lo12:.LANCHOR0
	.loc 1 730 0
	bl	skb_push
	mov	x3, x0
	.loc 1 733 0
	mov	w2, 8
	.loc 1 737 0
	mov	w4, 4
	.loc 1 731 0
	ldr	w0, [x22, 44]
	.loc 1 738 0
	mov	w6, 5
	.loc 1 731 0
	str	w0, [x3]
	.loc 1 745 0
	mov	w1, 0
	mov	x0, x20
	.loc 1 741 0
	strb	w24, [x29, 89]
	.loc 1 731 0
	ldr	w5, [x22, 46]
	str	w5, [x3, 2]
	.loc 1 732 0
	ldr	w5, [x22, 32]
	str	w5, [x3, 6]
	ldr	w5, [x22, 34]
	.loc 1 733 0
	strh	w2, [x3, 12]
	.loc 1 737 0
	ldrb	w2, [x29, 88]
	.loc 1 732 0
	str	w5, [x3, 8]
	.loc 1 739 0
	mov	w3, 64
	.loc 1 737 0
	bfi	w2, w4, 4, 4
	.loc 1 739 0
	strh	w3, [x29, 94]
	.loc 1 738 0
	bfi	w2, w6, 0, 4
	.loc 1 742 0
	ldr	w5, [x22, 52]
	.loc 1 743 0
	ldr	w4, [x22, 40]
	.loc 1 738 0
	strb	w2, [x29, 88]
	.loc 1 740 0
	mov	w2, 47
	.loc 1 742 0
	str	w5, [x29, 104]
	.loc 1 743 0
	str	w4, [x29, 100]
	.loc 1 740 0
	strb	w2, [x29, 97]
	.loc 1 744 0
	strb	w3, [x29, 96]
	.loc 1 745 0
	bl	rtl_set_skb_ip_summed
	.loc 1 746 0
	mov	x0, x20
	bl	rtl_get_skb_len
	sub	w0, w0, #14
	.loc 1 749 0
	add	x3, x29, 112
	.loc 1 747 0
	ldrh	w2, [x22, 64]
	rev16	w0, w0
	.loc 1 746 0
	strh	w0, [x29, 90]
	.loc 1 747 0
	add	w2, w2, 1
	.loc 1 748 0
	strh	wzr, [x29, 98]
	.loc 1 749 0
	ldrb	w1, [x3, -24]!
	.loc 1 747 0
	uxth	w2, w2
	strh	w2, [x22, 64]
	.loc 1 749 0
	mov	x0, x3
	rev16	w2, w2
	and	w1, w1, 15
	.loc 1 747 0
	strh	w2, [x29, 92]
	.loc 1 749 0
	bl	ip_fast_csum
	strh	w0, [x29, 98]
	.loc 1 750 0
	ldrh	w1, [x29, 92]
	.loc 1 751 0
	mov	x0, x20
	.loc 1 750 0
	strh	w1, [x22, 66]
	.loc 1 751 0
	bl	rtl_get_skb_data
	add	x1, x29, 88
	ldp	x2, x3, [x1]
	add	x1, x0, 14
	.loc 1 759 0
	mov	x0, x20
	.loc 1 751 0
	stp	x2, x3, [x1]
	ldr	w2, [x29, 104]
	str	w2, [x1, 16]
	.loc 1 759 0
	bl	rtl_get_skb_len
	sub	w24, w0, #50
	.loc 1 761 0
	ldr	w1, [x22, 56]
	.loc 1 763 0
	mov	x0, x20
	ldr	w21, [x22, 60]
	rev16	w24, w24
	.loc 1 761 0
	add	w2, w1, 1
	rev	w23, w1
	.loc 1 760 0
	ldrh	w25, [x22, 38]
	rev	w21, w21
	.loc 1 761 0
	str	w2, [x22, 56]
	.loc 1 763 0
	bl	rtl_get_skb_data
	.loc 1 764 0
	adrp	x2, jiffies
	.loc 1 767 0
	ldr	x1, [x22, 24]
	.loc 1 763 0
	mov	w3, 48
	mov	w4, -127
	strh	w24, [x0, 38]
	.loc 1 764 0
	ldr	x2, [x2, #:lo12:jiffies]
	.loc 1 763 0
	strb	w4, [x0, 35]
	strb	w3, [x0, 34]
	mov	w3, 2952
	strh	w25, [x0, 40]
	strh	w3, [x0, 36]
	str	w23, [x0, 42]
	str	w21, [x0, 46]
	.loc 1 767 0
	mov	x0, x20
	.loc 1 764 0
	str	x2, [x22, 8]
	.loc 1 769 0
	mov	w21, 1
	.loc 1 767 0
	bl	rtl_set_skb_dev
	.loc 1 768 0
	mov	x0, x20
	bl	dev_queue_xmit
	.loc 1 769 0
	b	.L113
.L115:
.LBE184:
	.loc 1 772 0
	add	x0, x22, :lo12:.LANCHOR0
	ldr	x0, [x0, 80]
	cbz	x0, .L124
	.loc 1 774 0
	bl	rtl_get_ppp_dev_priv
	cbnz	x0, .L114
	.loc 1 775 0
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printk
.L113:
	.loc 1 779 0
	mov	w0, w21
	ldr	x25, [sp, 64]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3831:
	.size	fast_pptp_to_wan, .-fast_pptp_to_wan
	.align	2
	.global	fast_pptp_sync_rx_seq
	.type	fast_pptp_sync_rx_seq, %function
fast_pptp_sync_rx_seq:
.LFB3832:
	.loc 1 784 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 786 0
	bl	rtl_ip_hdr
	.loc 1 790 0
	add	x1, x0, 20
	ldrb	w2, [x1, 1]
	and	w3, w2, 7
	cmp	w3, 1
	bne	.L151
	ldrh	w3, [x1, 2]
	mov	w4, 34827
	rev16	w3, w3
	cmp	w4, w3, uxth
	bne	.L151
	.loc 1 796 0
	ldrb	w0, [x0, 20]
	tbz	x0, 4, .L155
	.loc 1 798 0
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 8
	ldr	w2, [x0, 64]
	add	w3, w2, 1
	str	w3, [x0, 64]
	rev	w2, w2
	str	w2, [x1, 8]
	.loc 1 800 0
	ldrsb	w2, [x1, 1]
	tbz	w2, #31, .L151
	.loc 1 802 0
	ldr	w0, [x0, 60]
.L156:
	rev	w0, w0
	.loc 1 802 0 is_stmt 0 discriminator 2
	str	w0, [x1, 12]
	b	.L151
.L157:
	.loc 1 802 0
	adrp	x0, .LANCHOR0+68
	ldr	w0, [x0, #:lo12:.LANCHOR0+68]
	b	.L156
.L155:
	.loc 1 800 0 is_stmt 1
	tbnz	x2, 7, .L157
.L151:
	.loc 1 806 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3832:
	.size	fast_pptp_sync_rx_seq, .-fast_pptp_sync_rx_seq
	.align	2
	.global	pptpconn_write_proc
	.type	pptpconn_write_proc, %function
pptpconn_write_proc:
.LFB3835:
	.loc 1 924 0
	.cfi_startproc
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	.loc 1 930 0
	cmp	x2, 1
	.loc 1 924 0
	mov	x0, x1
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 930 0
	bls	.L161
	cbz	x1, .L161
.LBB187:
.LBB188:
.LBB189:
.LBB190:
.LBB191:
	.file 3 "./arch/arm64/include/asm/thread_info.h"
	.loc 3 83 0
#APP
// 83 "./arch/arm64/include/asm/thread_info.h" 1
	mrs x4, sp_el0
// 0 "" 2
#NO_APP
.LBE191:
.LBE190:
	.file 4 "./arch/arm64/include/asm/uaccess.h"
	.loc 4 291 0
	ldr	x4, [x4, 8]
#APP
// 291 "./arch/arm64/include/asm/uaccess.h" 1
	adds x0, x0, x2; ccmp x0, x4, #2, cc; cset x5, ls
// 0 "" 2
#NO_APP
.LBE189:
	cbz	x5, .L162
	.loc 4 293 0
	add	x0, x29, 24
	bl	__arch_copy_from_user
.LBE188:
.LBE187:
	mov	x3, 0
	add	x2, x29, 24
	.loc 1 930 0
	cbz	x0, .L169
	b	.L161
.L162:
.LBB193:
.LBB192:
	.loc 4 295 0
	mov	w1, 0
	add	x0, x29, 24
	bl	memset
	b	.L161
.L165:
.LBE192:
.LBE193:
.LBB194:
.LBB195:
	.loc 1 916 0
	add	x3, x1, x0, sxtw
.L169:
	.loc 1 915 0
	ldrb	w0, [x2]
	.loc 1 916 0
	lsl	x1, x3, 3
	add	x1, x1, x3, lsl 1
	.loc 1 917 0
	add	x2, x2, 1
	.loc 1 915 0
	sub	w0, w0, #48
	uxtb	w4, w0
	cmp	w4, 9
	bls	.L165
.LBE195:
.LBE194:
	.loc 1 931 0
	adrp	x0, .LANCHOR0+96
	str	w3, [x0, #:lo12:.LANCHOR0+96]
.L161:
	.loc 1 934 0
	mov	w0, -14
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3835:
	.size	pptpconn_write_proc, .-pptpconn_write_proc
	.align	2
	.type	pptp_conn_single_write, %function
pptp_conn_single_write:
.LFB3842:
	.loc 1 1047 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1048 0
	bl	pptpconn_write_proc
	.loc 1 1049 0
	sxtw	x0, w0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3842:
	.size	pptp_conn_single_write, .-pptp_conn_single_write
	.align	2
	.global	ppfw_write_proc
	.type	ppfw_write_proc, %function
ppfw_write_proc:
.LFB3836:
	.loc 1 938 0
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	.loc 1 949 0
	cmp	x2, 1
	.loc 1 938 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.loc 1 938 0
	mov	x19, x2
	mov	x21, x1
	.loc 1 949 0
	bls	.L190
.LBB196:
.LBB197:
	.file 5 "include/linux/slab.h"
	.loc 5 475 0
	mov	w1, 32
	add	x0, x2, 32
	movk	w1, 0x208, lsl 16
	bl	__kmalloc
	mov	x20, x0
.LBE197:
.LBE196:
	.loc 1 953 0
	cbz	x0, .L190
	.loc 1 956 0
	cbz	x21, .L180
.LBB198:
.LBB199:
.LBB200:
.LBB201:
.LBB202:
	.loc 3 83 0
#APP
// 83 "./arch/arm64/include/asm/thread_info.h" 1
	mrs x2, sp_el0
// 0 "" 2
#NO_APP
.LBE202:
.LBE201:
	.loc 4 291 0
	ldr	x2, [x2, 8]
	mov	x1, x21
#APP
// 291 "./arch/arm64/include/asm/uaccess.h" 1
	adds x1, x1, x19; ccmp x1, x2, #2, cc; cset x3, ls
// 0 "" 2
#NO_APP
.LBE200:
	.loc 4 293 0
	mov	x2, x19
	.loc 4 291 0
	cbz	x3, .L178
	.loc 4 293 0
	mov	x1, x21
	bl	__arch_copy_from_user
.LBE199:
.LBE198:
	.loc 1 956 0
	cbnz	x0, .L180
	mov	x4, x20
	mov	x3, 0
	b	.L179
.L178:
.LBB204:
.LBB203:
	.loc 4 295 0
	mov	w1, 0
	bl	memset
	b	.L180
.L181:
.LBE203:
.LBE204:
.LBB205:
.LBB206:
	.loc 1 916 0
	add	x3, x2, x1, sxtw
.L179:
	.loc 1 915 0
	ldrb	w1, [x4]
	.loc 1 916 0
	lsl	x2, x3, 3
	add	x2, x2, x3, lsl 1
	.loc 1 917 0
	add	x4, x4, 1
	.loc 1 915 0
	sub	w1, w1, #48
	uxtb	w5, w1
	cmp	w5, 9
	bls	.L181
.LBE206:
.LBE205:
	.loc 1 957 0
	adrp	x1, .LANCHOR0
	add	x0, x1, :lo12:.LANCHOR0
	.loc 1 960 0
	add	x0, x0, 8
	.loc 1 957 0
	str	w3, [x1, #:lo12:.LANCHOR0]
	.loc 1 960 0
	str	xzr, [x0, 80]
	stp	xzr, xzr, [x0]
	stp	xzr, xzr, [x0, 16]
	stp	xzr, xzr, [x0, 32]
	stp	xzr, xzr, [x0, 48]
	stp	xzr, xzr, [x0, 64]
	.loc 1 987 0
	cbz	w3, .L182
	.loc 1 989 0
	adrp	x1, sync_tx_pptp_gre_seqno_hook
	adrp	x0, sync_tx_pptp_gre_seqno
	add	x0, x0, :lo12:sync_tx_pptp_gre_seqno
	str	x0, [x1, #:lo12:sync_tx_pptp_gre_seqno_hook]
	b	.L183
.L182:
	.loc 1 993 0
	adrp	x0, sync_tx_pptp_gre_seqno_hook
	str	xzr, [x0, #:lo12:sync_tx_pptp_gre_seqno_hook]
.L183:
	.loc 1 996 0
	mov	x0, x20
	bl	kfree
	.loc 1 997 0
	mov	w0, w19
	b	.L175
.L180:
	.loc 1 1000 0
	mov	x0, x20
	bl	kfree
.L190:
	.loc 1 1001 0
	mov	w0, -14
.L175:
	.loc 1 1002 0
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3836:
	.size	ppfw_write_proc, .-ppfw_write_proc
	.align	2
	.type	fastpath_pptp_single_write, %function
fastpath_pptp_single_write:
.LFB3840:
	.loc 1 1027 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 1028 0
	bl	ppfw_write_proc
	.loc 1 1029 0
	sxtw	x0, w0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3840:
	.size	fastpath_pptp_single_write, .-fastpath_pptp_single_write
	.section	.init.text,"ax",%progbits
	.align	2
	.global	fast_pptp_init
	.type	fast_pptp_init, %function
fast_pptp_init:
.LFB3843:
	.loc 1 1099 0
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	.loc 1 1102 0
	adrp	x0, .LC5
	mov	x4, 0
	.loc 1 1099 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.loc 1 1102 0
	adrp	x20, proc_root
	adrp	x21, .LANCHOR1
	add	x20, x20, :lo12:proc_root
	add	x21, x21, :lo12:.LANCHOR1
	mov	x2, x20
	mov	x3, x21
	mov	w1, 0
	add	x0, x0, :lo12:.LC5
	adrp	x19, .LANCHOR0
	add	x19, x19, :lo12:.LANCHOR0
	bl	proc_create_data
	.loc 1 1105 0
	adrp	x5, .LC6
	add	x3, x21, 224
	mov	x2, x20
	.loc 1 1102 0
	str	x0, [x19, 104]
	.loc 1 1105 0
	mov	x4, 0
	mov	w1, 0
	add	x0, x5, :lo12:.LC6
	bl	proc_create_data
	str	x0, [x19, 112]
	.loc 1 1122 0
	add	x1, x19, 8
	.loc 1 1124 0
	mov	w0, 0
	.loc 1 1122 0
	stp	xzr, xzr, [x1]
	stp	xzr, xzr, [x1, 16]
	stp	xzr, xzr, [x1, 32]
	stp	xzr, xzr, [x1, 48]
	stp	xzr, xzr, [x1, 64]
	str	xzr, [x19, 88]
	.loc 1 1124 0
	ldr	x21, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3843:
	.size	fast_pptp_init, .-fast_pptp_init
	.section	.exit.text,"ax",%progbits
	.align	2
	.global	fast_pptp_exit
	.type	fast_pptp_exit, %function
fast_pptp_exit:
.LFB3844:
	.loc 1 1131 0
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	.loc 1 1133 0
	adrp	x0, .LANCHOR0
	.loc 1 1131 0
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	.loc 1 1133 0
	add	x20, x0, :lo12:.LANCHOR0
	mov	x19, x0
	ldr	x0, [x20, 104]
	cbz	x0, .L194
	.loc 1 1135 0
	adrp	x1, proc_root
	adrp	x0, .LC5
	add	x1, x1, :lo12:proc_root
	add	x0, x0, :lo12:.LC5
	bl	remove_proc_entry
	.loc 1 1139 0
	str	xzr, [x20, 104]
.L194:
	.loc 1 1142 0
	add	x19, x19, :lo12:.LANCHOR0
	ldr	x0, [x19, 112]
	cbz	x0, .L193
	.loc 1 1144 0
	adrp	x1, proc_root
	adrp	x0, .LC6
	add	x1, x1, :lo12:proc_root
	add	x0, x0, :lo12:.LC6
	bl	remove_proc_entry
	.loc 1 1148 0
	str	xzr, [x19, 112]
.L193:
	.loc 1 1151 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3844:
	.size	fast_pptp_exit, .-fast_pptp_exit
	.global	pptp_conn_proc_fops
	.global	fastpath_pptp_proc_fops
	.global	fast_pptp_fw
	.global	pptp_tcp_finished
	.data
	.align	3
.LANCHOR1 = . + 0
	.type	fastpath_pptp_proc_fops, %object
	.size	fastpath_pptp_proc_fops, 224
fastpath_pptp_proc_fops:
	.zero	8
	.xword	seq_lseek
	.xword	seq_read
	.xword	fastpath_pptp_single_write
	.zero	56
	.xword	fastpath_pptp_single_open
	.zero	8
	.xword	single_release
	.zero	112
	.type	pptp_conn_proc_fops, %object
	.size	pptp_conn_proc_fops, 224
pptp_conn_proc_fops:
	.zero	8
	.xword	seq_lseek
	.xword	seq_read
	.xword	pptp_conn_single_write
	.zero	56
	.xword	pptp_conn_single_open
	.zero	8
	.xword	single_release
	.zero	112
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"%d\n"
	.zero	4
.LC1:
	.string	"ppp0"
	.zero	3
.LC2:
	.string	"pptpInfo.ppp0_dev == NULL\n"
	.zero	5
.LC3:
	.string	"RTL"
	.zero	4
.LC4:
	.string	"pptpInfo.ppp0_dev->priv == NULL\n"
	.zero	7
.LC5:
	.string	"fast_pptp"
	.zero	6
.LC6:
	.string	"pptp_conn_ck"
	.bss
	.align	3
.LANCHOR0 = . + 0
	.type	fast_pptp_fw, %object
	.size	fast_pptp_fw, 4
fast_pptp_fw:
	.zero	4
	.zero	4
	.type	pptpAccInfo, %object
	.size	pptpAccInfo, 88
pptpAccInfo:
	.zero	88
	.type	pptp_conn_check, %object
	.size	pptp_conn_check, 4
pptp_conn_check:
	.zero	4
	.type	pptp_tcp_finished, %object
	.size	pptp_tcp_finished, 4
pptp_tcp_finished:
	.zero	4
	.type	res1, %object
	.size	res1, 8
res1:
	.zero	8
	.type	res_check_pptp, %object
	.size	res_check_pptp, 8
res_check_pptp:
	.zero	8
	.text
.Letext0:
	.file 6 "include/uapi/asm-generic/int-ll64.h"
	.file 7 "include/asm-generic/int-ll64.h"
	.file 8 "./include/uapi/asm-generic/posix_types.h"
	.file 9 "include/uapi/linux/types.h"
	.file 10 "include/linux/types.h"
	.file 11 "include/asm-generic/atomic-long.h"
	.file 12 "include/linux/seqlock.h"
	.file 13 "include/linux/mm.h"
	.file 14 "include/linux/stddef.h"
	.file 15 "include/uapi/linux/in.h"
	.file 16 "include/uapi/linux/netfilter.h"
	.file 17 "include/uapi/linux/ip.h"
	.file 18 "include/linux/backing-dev-defs.h"
	.file 19 "include/uapi/linux/rtnetlink.h"
	.file 20 "include/net/neighbour.h"
	.file 21 "include/net/ndisc.h"
	.file 22 "include/asm-generic/bitops/builtin-__fls.h"
	.file 23 "include/asm-generic/bitops/fls64.h"
	.file 24 "include/linux/thread_info.h"
	.file 25 "include/linux/kasan.h"
	.file 26 "include/linux/log2.h"
	.file 27 "include/asm-generic/getorder.h"
	.file 28 "include/uapi/linux/swab.h"
	.file 29 "include/net/inet_frag.h"
	.file 30 "include/linux/etherdevice.h"
	.file 31 "./arch/arm64/include/asm/cachetype.h"
	.file 32 "include/linux/printk.h"
	.file 33 "include/linux/kernel.h"
	.file 34 "./arch/arm64/include/asm/hwcap.h"
	.file 35 "./arch/arm64/include/asm/cpufeature.h"
	.file 36 "include/linux/jiffies.h"
	.file 37 "include/linux/cpumask.h"
	.file 38 "./arch/arm64/include/asm/memory.h"
	.file 39 "include/linux/highuid.h"
	.file 40 "include/linux/seq_file.h"
	.file 41 "include/linux/sched.h"
	.file 42 "include/asm-generic/percpu.h"
	.file 43 "include/linux/mmzone.h"
	.file 44 "include/linux/workqueue.h"
	.file 45 "./arch/arm64/include/asm/topology.h"
	.file 46 "include/linux/percpu_counter.h"
	.file 47 "include/linux/hrtimer.h"
	.file 48 "include/linux/dcache.h"
	.file 49 "include/linux/quota.h"
	.file 50 "include/linux/fs.h"
	.file 51 "./arch/arm64/include/asm/irq.h"
	.file 52 "./arch/arm64/include/asm/hardirq.h"
	.file 53 "include/linux/interrupt.h"
	.file 54 "include/linux/kernel_stat.h"
	.file 55 "include/linux/debug_locks.h"
	.file 56 "include/asm-generic/pgtable.h"
	.file 57 "include/linux/vmstat.h"
	.file 58 "./arch/arm64/include/../../arm/include/asm/xen/hypervisor.h"
	.file 59 "./arch/arm64/include/asm/dma-mapping.h"
	.file 60 "include/net/flow_dissector.h"
	.file 61 "include/net/net_namespace.h"
	.file 62 "include/linux/of.h"
	.file 63 "include/linux/netdevice.h"
	.file 64 "include/net/sch_generic.h"
	.file 65 "include/net/sock.h"
	.file 66 "include/net/inet_connection_sock.h"
	.file 67 "include/net/ip_fib.h"
	.file 68 "include/net/route.h"
	.file 69 "include/net/arp.h"
	.file 70 "include/linux/netfilter.h"
	.file 71 "include/linux/netfilter/x_tables.h"
	.file 72 "include/net/rtl/fastpath/fastpath_core.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1860
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF357
	.byte	0x1
	.4byte	.LASF358
	.4byte	.LASF359
	.4byte	.Ldebug_ranges0+0x190
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x6
	.byte	0x14
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x6
	.byte	0x17
	.4byte	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x6
	.byte	0x1a
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x6
	.byte	0x1e
	.4byte	0x86
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.string	"u8"
	.byte	0x7
	.byte	0x10
	.4byte	0x3b
	.uleb128 0x5
	.string	"u16"
	.byte	0x7
	.byte	0x13
	.4byte	0x54
	.uleb128 0x5
	.string	"u32"
	.byte	0x7
	.byte	0x16
	.4byte	0x6d
	.uleb128 0x5
	.string	"s64"
	.byte	0x7
	.byte	0x18
	.4byte	0x74
	.uleb128 0x5
	.string	"u64"
	.byte	0x7
	.byte	0x19
	.4byte	0x86
	.uleb128 0x6
	.byte	0x4
	.byte	0xe
	.byte	0x9
	.4byte	0xd8
	.uleb128 0x7
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF12
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x8
	.byte	0xe
	.4byte	0xe3
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x8
	.byte	0xf
	.4byte	0xf5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x8
	.byte	0x47
	.4byte	0xea
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x8
	.byte	0x48
	.4byte	0xd8
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x8
	.byte	0x57
	.4byte	0x74
	.uleb128 0x8
	.byte	0x8
	.4byte	0x123
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF20
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x9
	.byte	0x21
	.4byte	0x49
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x9
	.byte	0x23
	.4byte	0x62
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0xa
	.byte	0x1d
	.4byte	0x14b
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF24
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0xa
	.byte	0x2d
	.4byte	0x112
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0xa
	.byte	0x36
	.4byte	0xfc
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0xa
	.byte	0x3b
	.4byte	0x107
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0xa
	.byte	0x9d
	.4byte	0x6d
	.uleb128 0x9
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0xa
	.byte	0xb6
	.4byte	0x17e
	.uleb128 0x8
	.byte	0x8
	.4byte	0x190
	.uleb128 0xa
	.4byte	0x123
	.uleb128 0xb
	.4byte	.LASF31
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0xb
	.byte	0x17
	.4byte	0x17f
	.uleb128 0xb
	.4byte	.LASF32
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0xc
	.byte	0x34
	.4byte	0x1a5
	.uleb128 0xb
	.4byte	.LASF34
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF35
	.uleb128 0xc
	.byte	0x8
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1c9
	.uleb128 0xb
	.4byte	.LASF36
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1d4
	.uleb128 0xd
	.4byte	0x1df
	.uleb128 0xe
	.4byte	0x1c1
	.byte	0
	.uleb128 0xf
	.string	"pid"
	.uleb128 0xb
	.4byte	.LASF37
	.uleb128 0x8
	.byte	0x8
	.4byte	0x152
	.uleb128 0xb
	.4byte	.LASF38
	.uleb128 0xb
	.4byte	.LASF39
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1ff
	.uleb128 0xa
	.4byte	0x1b5
	.uleb128 0xb
	.4byte	.LASF40
	.uleb128 0xb
	.4byte	.LASF41
	.uleb128 0xb
	.4byte	.LASF42
	.uleb128 0x8
	.byte	0x8
	.4byte	0x219
	.uleb128 0xb
	.4byte	.LASF43
	.uleb128 0xb
	.4byte	.LASF44
	.uleb128 0xb
	.4byte	.LASF45
	.uleb128 0xb
	.4byte	.LASF46
	.uleb128 0xb
	.4byte	.LASF47
	.uleb128 0xb
	.4byte	.LASF48
	.uleb128 0xb
	.4byte	.LASF49
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0xd
	.2byte	0x21a
	.4byte	0x248
	.uleb128 0xd
	.4byte	0x253
	.uleb128 0xe
	.4byte	0x1c3
	.byte	0
	.uleb128 0xb
	.4byte	.LASF51
	.uleb128 0xb
	.4byte	.LASF52
	.uleb128 0xb
	.4byte	.LASF53
	.uleb128 0xb
	.4byte	.LASF54
	.uleb128 0x8
	.byte	0x8
	.4byte	0x26d
	.uleb128 0xf
	.string	"net"
	.uleb128 0xb
	.4byte	.LASF55
	.uleb128 0x6
	.byte	0x4
	.byte	0xf
	.byte	0x1b
	.4byte	0x326
	.uleb128 0x7
	.4byte	.LASF56
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF57
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF58
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF59
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF60
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF61
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF62
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF63
	.sleb128 17
	.uleb128 0x7
	.4byte	.LASF64
	.sleb128 22
	.uleb128 0x7
	.4byte	.LASF65
	.sleb128 29
	.uleb128 0x7
	.4byte	.LASF66
	.sleb128 33
	.uleb128 0x7
	.4byte	.LASF67
	.sleb128 41
	.uleb128 0x7
	.4byte	.LASF68
	.sleb128 46
	.uleb128 0x7
	.4byte	.LASF69
	.sleb128 47
	.uleb128 0x7
	.4byte	.LASF70
	.sleb128 50
	.uleb128 0x7
	.4byte	.LASF71
	.sleb128 51
	.uleb128 0x7
	.4byte	.LASF72
	.sleb128 92
	.uleb128 0x7
	.4byte	.LASF73
	.sleb128 94
	.uleb128 0x7
	.4byte	.LASF74
	.sleb128 98
	.uleb128 0x7
	.4byte	.LASF75
	.sleb128 103
	.uleb128 0x7
	.4byte	.LASF76
	.sleb128 108
	.uleb128 0x7
	.4byte	.LASF77
	.sleb128 132
	.uleb128 0x7
	.4byte	.LASF78
	.sleb128 136
	.uleb128 0x7
	.4byte	.LASF79
	.sleb128 137
	.uleb128 0x7
	.4byte	.LASF80
	.sleb128 255
	.uleb128 0x7
	.4byte	.LASF81
	.sleb128 256
	.byte	0
	.uleb128 0x11
	.4byte	.LASF130
	.byte	0x4
	.byte	0x10
	.byte	0x2e
	.4byte	0x357
	.uleb128 0x7
	.4byte	.LASF82
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF83
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF84
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF85
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF86
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF87
	.sleb128 5
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x10
	.byte	0x3c
	.4byte	0x396
	.uleb128 0x7
	.4byte	.LASF88
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF89
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF90
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF91
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF92
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF93
	.sleb128 7
	.uleb128 0x7
	.4byte	.LASF94
	.sleb128 10
	.uleb128 0x7
	.4byte	.LASF95
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF96
	.sleb128 13
	.byte	0
	.uleb128 0xb
	.4byte	.LASF97
	.uleb128 0x8
	.byte	0x8
	.4byte	0x396
	.uleb128 0x8
	.byte	0x8
	.4byte	0x272
	.uleb128 0xb
	.4byte	.LASF98
	.uleb128 0xb
	.4byte	.LASF99
	.uleb128 0x6
	.byte	0x4
	.byte	0x11
	.byte	0x8a
	.4byte	0x46e
	.uleb128 0x7
	.4byte	.LASF100
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF101
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF102
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF103
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF104
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF105
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF106
	.sleb128 7
	.uleb128 0x7
	.4byte	.LASF107
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF108
	.sleb128 9
	.uleb128 0x7
	.4byte	.LASF109
	.sleb128 10
	.uleb128 0x7
	.4byte	.LASF110
	.sleb128 11
	.uleb128 0x7
	.4byte	.LASF111
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF112
	.sleb128 13
	.uleb128 0x7
	.4byte	.LASF113
	.sleb128 14
	.uleb128 0x7
	.4byte	.LASF114
	.sleb128 15
	.uleb128 0x7
	.4byte	.LASF115
	.sleb128 16
	.uleb128 0x7
	.4byte	.LASF116
	.sleb128 17
	.uleb128 0x7
	.4byte	.LASF117
	.sleb128 18
	.uleb128 0x7
	.4byte	.LASF118
	.sleb128 19
	.uleb128 0x7
	.4byte	.LASF119
	.sleb128 20
	.uleb128 0x7
	.4byte	.LASF120
	.sleb128 21
	.uleb128 0x7
	.4byte	.LASF121
	.sleb128 22
	.uleb128 0x7
	.4byte	.LASF122
	.sleb128 23
	.uleb128 0x7
	.4byte	.LASF123
	.sleb128 24
	.uleb128 0x7
	.4byte	.LASF124
	.sleb128 25
	.uleb128 0x7
	.4byte	.LASF125
	.sleb128 26
	.uleb128 0x7
	.4byte	.LASF126
	.sleb128 27
	.uleb128 0x7
	.4byte	.LASF127
	.sleb128 28
	.uleb128 0x7
	.4byte	.LASF128
	.sleb128 29
	.uleb128 0x7
	.4byte	.LASF129
	.sleb128 30
	.byte	0
	.uleb128 0x11
	.4byte	.LASF131
	.byte	0x4
	.byte	0x12
	.byte	0x22
	.4byte	0x499
	.uleb128 0x7
	.4byte	.LASF132
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF133
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF134
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF135
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF136
	.sleb128 4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.byte	0x13
	.2byte	0x182
	.4byte	0x50f
	.uleb128 0x7
	.4byte	.LASF137
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF138
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF139
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF140
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF141
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF142
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF143
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF144
	.sleb128 7
	.uleb128 0x7
	.4byte	.LASF145
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF146
	.sleb128 9
	.uleb128 0x7
	.4byte	.LASF147
	.sleb128 10
	.uleb128 0x7
	.4byte	.LASF148
	.sleb128 11
	.uleb128 0x7
	.4byte	.LASF149
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF150
	.sleb128 13
	.uleb128 0x7
	.4byte	.LASF151
	.sleb128 14
	.uleb128 0x7
	.4byte	.LASF152
	.sleb128 15
	.uleb128 0x7
	.4byte	.LASF153
	.sleb128 16
	.uleb128 0x7
	.4byte	.LASF154
	.sleb128 17
	.byte	0
	.uleb128 0xb
	.4byte	.LASF155
	.uleb128 0x8
	.byte	0x8
	.4byte	0x223
	.uleb128 0x6
	.byte	0x4
	.byte	0x14
	.byte	0x29
	.4byte	0x5a1
	.uleb128 0x7
	.4byte	.LASF156
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF157
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF158
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF159
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF160
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF161
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF162
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF163
	.sleb128 7
	.uleb128 0x7
	.4byte	.LASF164
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF165
	.sleb128 9
	.uleb128 0x7
	.4byte	.LASF166
	.sleb128 10
	.uleb128 0x7
	.4byte	.LASF167
	.sleb128 11
	.uleb128 0x7
	.4byte	.LASF168
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF169
	.sleb128 13
	.uleb128 0x7
	.4byte	.LASF170
	.sleb128 14
	.uleb128 0x7
	.4byte	.LASF171
	.sleb128 15
	.uleb128 0x7
	.4byte	.LASF172
	.sleb128 16
	.uleb128 0x7
	.4byte	.LASF173
	.sleb128 17
	.uleb128 0x7
	.4byte	.LASF174
	.sleb128 18
	.uleb128 0x7
	.4byte	.LASF175
	.sleb128 19
	.uleb128 0x7
	.4byte	.LASF176
	.sleb128 20
	.byte	0
	.uleb128 0xb
	.4byte	.LASF177
	.uleb128 0xb
	.4byte	.LASF178
	.uleb128 0x6
	.byte	0x4
	.byte	0x15
	.byte	0x1b
	.4byte	0x5f6
	.uleb128 0x7
	.4byte	.LASF179
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF180
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF181
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF182
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF183
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF184
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF185
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF186
	.sleb128 24
	.uleb128 0x7
	.4byte	.LASF187
	.sleb128 25
	.uleb128 0x7
	.4byte	.LASF188
	.sleb128 31
	.uleb128 0x7
	.4byte	.LASF189
	.sleb128 32
	.byte	0
	.uleb128 0xb
	.4byte	.LASF190
	.uleb128 0xb
	.4byte	.LASF191
	.uleb128 0xb
	.4byte	.LASF192
	.uleb128 0xb
	.4byte	.LASF193
	.uleb128 0xb
	.4byte	.LASF194
	.uleb128 0xb
	.4byte	.LASF195
	.uleb128 0xb
	.4byte	.LASF196
	.uleb128 0xb
	.4byte	.LASF197
	.uleb128 0xb
	.4byte	.LASF198
	.uleb128 0x13
	.4byte	.LASF199
	.byte	0x16
	.byte	0xa
	.4byte	0xf5
	.byte	0x3
	.4byte	0x63f
	.uleb128 0x14
	.4byte	.LASF201
	.byte	0x16
	.byte	0xa
	.4byte	0xf5
	.byte	0
	.uleb128 0x13
	.4byte	.LASF200
	.byte	0x17
	.byte	0x1a
	.4byte	0x5b
	.byte	0x3
	.4byte	0x659
	.uleb128 0x15
	.string	"x"
	.byte	0x17
	.byte	0x1a
	.4byte	0x7b
	.byte	0
	.uleb128 0x16
	.4byte	.LASF203
	.byte	0x18
	.byte	0xa7
	.byte	0x3
	.4byte	0x685
	.uleb128 0x15
	.string	"ptr"
	.byte	0x18
	.byte	0xa7
	.4byte	0x685
	.uleb128 0x15
	.string	"n"
	.byte	0x18
	.byte	0xa7
	.4byte	0xf5
	.uleb128 0x14
	.4byte	.LASF202
	.byte	0x18
	.byte	0xa8
	.4byte	0x140
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x68b
	.uleb128 0x17
	.uleb128 0x16
	.4byte	.LASF204
	.byte	0x19
	.byte	0x54
	.byte	0x3
	.4byte	0x6b8
	.uleb128 0x15
	.string	"s"
	.byte	0x19
	.byte	0x54
	.4byte	0x6bd
	.uleb128 0x14
	.4byte	.LASF205
	.byte	0x19
	.byte	0x54
	.4byte	0x685
	.uleb128 0x14
	.4byte	.LASF206
	.byte	0x19
	.byte	0x55
	.4byte	0x15d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF207
	.uleb128 0x8
	.byte	0x8
	.4byte	0x6b8
	.uleb128 0x18
	.4byte	.LASF208
	.byte	0x5
	.2byte	0x16e
	.4byte	0x1c1
	.byte	0x3
	.4byte	0x703
	.uleb128 0x19
	.string	"s"
	.byte	0x5
	.2byte	0x16e
	.4byte	0x6bd
	.uleb128 0x1a
	.4byte	.LASF209
	.byte	0x5
	.2byte	0x16f
	.4byte	0x173
	.uleb128 0x1a
	.4byte	.LASF206
	.byte	0x5
	.2byte	0x16f
	.4byte	0x15d
	.uleb128 0x1b
	.string	"ret"
	.byte	0x5
	.2byte	0x171
	.4byte	0x1c1
	.byte	0
	.uleb128 0x13
	.4byte	.LASF210
	.byte	0x1a
	.byte	0x28
	.4byte	0x5b
	.byte	0x3
	.4byte	0x71d
	.uleb128 0x15
	.string	"n"
	.byte	0x1a
	.byte	0x28
	.4byte	0xb8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF211
	.byte	0x1b
	.byte	0xd
	.4byte	0x5b
	.byte	0x3
	.4byte	0x744
	.uleb128 0x14
	.4byte	.LASF206
	.byte	0x1b
	.byte	0xd
	.4byte	0xf5
	.uleb128 0x1c
	.4byte	.LASF212
	.byte	0x1b
	.byte	0xf
	.4byte	0x5b
	.byte	0
	.uleb128 0x18
	.4byte	.LASF213
	.byte	0x5
	.2byte	0x189
	.4byte	0x1c1
	.byte	0x3
	.4byte	0x77a
	.uleb128 0x1a
	.4byte	.LASF206
	.byte	0x5
	.2byte	0x189
	.4byte	0x15d
	.uleb128 0x1a
	.4byte	.LASF209
	.byte	0x5
	.2byte	0x189
	.4byte	0x173
	.uleb128 0x1a
	.4byte	.LASF212
	.byte	0x5
	.2byte	0x189
	.4byte	0x6d
	.byte	0
	.uleb128 0x18
	.4byte	.LASF214
	.byte	0x5
	.2byte	0x18f
	.4byte	0x1c1
	.byte	0x3
	.4byte	0x7b0
	.uleb128 0x1a
	.4byte	.LASF206
	.byte	0x5
	.2byte	0x18f
	.4byte	0x15d
	.uleb128 0x1a
	.4byte	.LASF209
	.byte	0x5
	.2byte	0x18f
	.4byte	0x173
	.uleb128 0x1d
	.4byte	.LASF212
	.byte	0x5
	.2byte	0x191
	.4byte	0x6d
	.byte	0
	.uleb128 0x18
	.4byte	.LASF215
	.byte	0x5
	.2byte	0x114
	.4byte	0x5b
	.byte	0x3
	.4byte	0x7ce
	.uleb128 0x1a
	.4byte	.LASF206
	.byte	0x5
	.2byte	0x114
	.4byte	0x15d
	.byte	0
	.uleb128 0x13
	.4byte	.LASF216
	.byte	0x3
	.byte	0x4f
	.4byte	0x7ea
	.byte	0x3
	.4byte	0x7ea
	.uleb128 0x1c
	.4byte	.LASF217
	.byte	0x3
	.byte	0x51
	.4byte	0xf5
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x195
	.uleb128 0x13
	.4byte	.LASF218
	.byte	0x2
	.byte	0x1a
	.4byte	0xf5
	.byte	0x3
	.4byte	0x80c
	.uleb128 0x1c
	.4byte	.LASF209
	.byte	0x2
	.byte	0x1c
	.4byte	0xf5
	.byte	0
	.uleb128 0x16
	.4byte	.LASF219
	.byte	0x1
	.byte	0x5e
	.byte	0x3
	.4byte	0x843
	.uleb128 0x15
	.string	"dst"
	.byte	0x1
	.byte	0x5e
	.4byte	0x843
	.uleb128 0x15
	.string	"src"
	.byte	0x1
	.byte	0x5e
	.4byte	0x843
	.uleb128 0x15
	.string	"len"
	.byte	0x1
	.byte	0x5e
	.4byte	0x5b
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.byte	0x5f
	.4byte	0x5b
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x3b
	.uleb128 0x13
	.4byte	.LASF220
	.byte	0x1c
	.byte	0x2e
	.4byte	0x49
	.byte	0x3
	.4byte	0x865
	.uleb128 0x15
	.string	"val"
	.byte	0x1c
	.byte	0x2e
	.4byte	0x49
	.byte	0
	.uleb128 0x13
	.4byte	.LASF221
	.byte	0x1c
	.byte	0x39
	.4byte	0x62
	.byte	0x3
	.4byte	0x881
	.uleb128 0x15
	.string	"val"
	.byte	0x1c
	.byte	0x39
	.4byte	0x62
	.byte	0
	.uleb128 0x16
	.4byte	.LASF222
	.byte	0x2
	.byte	0x4f
	.byte	0x3
	.4byte	0x899
	.uleb128 0x14
	.4byte	.LASF209
	.byte	0x2
	.byte	0x4f
	.4byte	0xf5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF223
	.byte	0x4
	.2byte	0x121
	.4byte	0xf5
	.byte	0x3
	.4byte	0x8e6
	.uleb128 0x19
	.string	"to"
	.byte	0x4
	.2byte	0x121
	.4byte	0x1c1
	.uleb128 0x1a
	.4byte	.LASF224
	.byte	0x4
	.2byte	0x121
	.4byte	0x685
	.uleb128 0x19
	.string	"n"
	.byte	0x4
	.2byte	0x121
	.4byte	0xf5
	.uleb128 0x1f
	.uleb128 0x1d
	.4byte	.LASF225
	.byte	0x4
	.2byte	0x123
	.4byte	0xf5
	.uleb128 0x1d
	.4byte	.LASF226
	.byte	0x4
	.2byte	0x123
	.4byte	0xf5
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF227
	.byte	0x1
	.2byte	0x38e
	.4byte	0xf5
	.byte	0x1
	.4byte	0x90c
	.uleb128 0x19
	.string	"s"
	.byte	0x1
	.2byte	0x38e
	.4byte	0x11d
	.uleb128 0x1b
	.string	"k"
	.byte	0x1
	.2byte	0x390
	.4byte	0xf5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF228
	.byte	0x5
	.2byte	0x1ca
	.4byte	0x1c1
	.byte	0x3
	.4byte	0x944
	.uleb128 0x1a
	.4byte	.LASF206
	.byte	0x5
	.2byte	0x1ca
	.4byte	0x15d
	.uleb128 0x1a
	.4byte	.LASF209
	.byte	0x5
	.2byte	0x1ca
	.4byte	0x173
	.uleb128 0x1f
	.uleb128 0x1d
	.4byte	.LASF229
	.byte	0x5
	.2byte	0x1d1
	.4byte	0x5b
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF241
	.byte	0x1
	.2byte	0x32b
	.8byte	.LFB3833
	.8byte	.LFE3833-.LFB3833
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb0c
	.uleb128 0x21
	.string	"skb"
	.byte	0x1
	.2byte	0x32b
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x67
	.uleb128 0x1b
	.string	"iph"
	.byte	0x1
	.2byte	0x32d
	.4byte	0xb0c
	.uleb128 0x1b
	.string	"x"
	.byte	0x1
	.2byte	0x32e
	.4byte	0xf5
	.uleb128 0x22
	.4byte	0x7f0
	.8byte	.LBB159
	.8byte	.LBE159-.LBB159
	.byte	0x1
	.2byte	0x336
	.4byte	0x9ba
	.uleb128 0x23
	.8byte	.LBB160
	.8byte	.LBE160-.LBB160
	.uleb128 0x24
	.4byte	0x800
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	.Ldebug_ranges0+0
	.4byte	0xaed
	.uleb128 0x26
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x339
	.4byte	0xb12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x26
	.4byte	.LASF231
	.byte	0x1
	.2byte	0x33a
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x27
	.string	"lv"
	.byte	0x1
	.2byte	0x33b
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x26
	.4byte	.LASF232
	.byte	0x1
	.2byte	0x33c
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x1d
	.4byte	.LASF233
	.byte	0x1
	.2byte	0x33e
	.4byte	0xb18
	.uleb128 0x1d
	.4byte	.LASF234
	.byte	0x1
	.2byte	0x33f
	.4byte	0x5b
	.uleb128 0x28
	.4byte	0x80c
	.8byte	.LBB162
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.2byte	0x342
	.4byte	0xa47
	.uleb128 0x29
	.4byte	0x82e
	.uleb128 0x29
	.4byte	0x823
	.uleb128 0x29
	.4byte	0x818
	.uleb128 0x2a
	.4byte	.Ldebug_ranges0+0x30
	.uleb128 0x24
	.4byte	0x839
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	0x80c
	.8byte	.LBB166
	.4byte	.Ldebug_ranges0+0x60
	.byte	0x1
	.2byte	0x36f
	.4byte	0xa7a
	.uleb128 0x29
	.4byte	0x82e
	.uleb128 0x29
	.4byte	0x823
	.uleb128 0x29
	.4byte	0x818
	.uleb128 0x2a
	.4byte	.Ldebug_ranges0+0x60
	.uleb128 0x24
	.4byte	0x839
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	0x80c
	.8byte	.LBB172
	.4byte	.Ldebug_ranges0+0xa0
	.byte	0x1
	.2byte	0x371
	.4byte	0xaad
	.uleb128 0x29
	.4byte	0x82e
	.uleb128 0x29
	.4byte	0x823
	.uleb128 0x29
	.4byte	0x818
	.uleb128 0x2a
	.4byte	.Ldebug_ranges0+0xa0
	.uleb128 0x24
	.4byte	0x839
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	0x80c
	.8byte	.LBB176
	.8byte	.LBE176-.LBB176
	.byte	0x1
	.2byte	0x37c
	.uleb128 0x29
	.4byte	0x82e
	.uleb128 0x29
	.4byte	0x823
	.uleb128 0x29
	.4byte	0x818
	.uleb128 0x23
	.8byte	.LBB177
	.8byte	.LBE177-.LBB177
	.uleb128 0x24
	.4byte	0x839
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	0x881
	.8byte	.LBB178
	.8byte	.LBE178-.LBB178
	.byte	0x1
	.2byte	0x38b
	.uleb128 0x29
	.4byte	0x88d
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x3ac
	.uleb128 0x8
	.byte	0x8
	.4byte	0x5fb
	.uleb128 0x8
	.byte	0x8
	.4byte	0x49
	.uleb128 0x2c
	.4byte	.LASF235
	.byte	0x1
	.2byte	0x3ee
	.4byte	0x5b
	.8byte	.LFB3837
	.8byte	.LFE3837-.LFB3837
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb59
	.uleb128 0x21
	.string	"s"
	.byte	0x1
	.2byte	0x3ee
	.4byte	0xb59
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x21
	.string	"v"
	.byte	0x1
	.2byte	0x3ee
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x237
	.uleb128 0x2c
	.4byte	.LASF236
	.byte	0x1
	.2byte	0x3f5
	.4byte	0x5b
	.8byte	.LFB3838
	.8byte	.LFE3838-.LFB3838
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb9a
	.uleb128 0x21
	.string	"s"
	.byte	0x1
	.2byte	0x3f5
	.4byte	0xb59
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x21
	.string	"v"
	.byte	0x1
	.2byte	0x3f5
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF237
	.byte	0x1
	.2byte	0x3fc
	.4byte	0x5b
	.8byte	.LFB3839
	.8byte	.LFE3839-.LFB3839
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbd9
	.uleb128 0x2d
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x3fc
	.4byte	0x213
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x3fc
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF238
	.byte	0x1
	.2byte	0x410
	.4byte	0x5b
	.8byte	.LFB3841
	.8byte	.LFE3841-.LFB3841
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc18
	.uleb128 0x2d
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x410
	.4byte	0x213
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x410
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF239
	.byte	0x1
	.byte	0x4a
	.4byte	0x5b
	.8byte	.LFB3824
	.8byte	.LFE3824-.LFB3824
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc47
	.uleb128 0x2f
	.4byte	.LASF240
	.byte	0x1
	.byte	0x4a
	.4byte	0x11d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x30
	.4byte	.LASF242
	.byte	0x1
	.byte	0x54
	.8byte	.LFB3825
	.8byte	.LFE3825-.LFB3825
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc72
	.uleb128 0x2f
	.4byte	.LASF240
	.byte	0x1
	.byte	0x54
	.4byte	0x11d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF243
	.byte	0x1
	.byte	0x64
	.4byte	0x5b
	.8byte	.LFB3827
	.8byte	.LFE3827-.LFB3827
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb9
	.uleb128 0x31
	.string	"skb"
	.byte	0x1
	.byte	0x64
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x32
	.string	"iph"
	.byte	0x1
	.byte	0x66
	.4byte	0xb0c
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x1c
	.4byte	.LASF230
	.byte	0x1
	.byte	0x67
	.4byte	0xb12
	.byte	0
	.uleb128 0x30
	.4byte	.LASF244
	.byte	0x1
	.byte	0x77
	.8byte	.LFB3828
	.8byte	.LFE3828-.LFB3828
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd53
	.uleb128 0x31
	.string	"skb"
	.byte	0x1
	.byte	0x77
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x33
	.4byte	.LASF245
	.byte	0x1
	.byte	0x79
	.4byte	0xd53
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF246
	.byte	0x1
	.byte	0x7a
	.4byte	0xd59
	.uleb128 0x1c
	.4byte	.LASF247
	.byte	0x1
	.byte	0x7b
	.4byte	0xd5f
	.uleb128 0x1c
	.4byte	.LASF248
	.byte	0x1
	.byte	0x7c
	.4byte	0xd65
	.uleb128 0x1c
	.4byte	.LASF249
	.byte	0x1
	.byte	0x7d
	.4byte	0xd6b
	.uleb128 0x1c
	.4byte	.LASF250
	.byte	0x1
	.byte	0x7e
	.4byte	0xd71
	.uleb128 0x32
	.string	"iph"
	.byte	0x1
	.byte	0x7f
	.4byte	0xb0c
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x23
	.8byte	.LBB181
	.8byte	.LBE181-.LBB181
	.uleb128 0x32
	.string	"th"
	.byte	0x1
	.byte	0x83
	.4byte	0xd77
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x600
	.uleb128 0x8
	.byte	0x8
	.4byte	0x605
	.uleb128 0x8
	.byte	0x8
	.4byte	0x60f
	.uleb128 0x8
	.byte	0x8
	.4byte	0x60a
	.uleb128 0x8
	.byte	0x8
	.4byte	0x619
	.uleb128 0x8
	.byte	0x8
	.4byte	0x614
	.uleb128 0x8
	.byte	0x8
	.4byte	0x5a6
	.uleb128 0x2c
	.4byte	.LASF251
	.byte	0x1
	.2byte	0x1d9
	.4byte	0x5b
	.8byte	.LFB3829
	.8byte	.LFE3829-.LFB3829
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe44
	.uleb128 0x2d
	.4byte	.LASF252
	.byte	0x1
	.2byte	0x1d9
	.4byte	0xe44
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x27
	.string	"iph"
	.byte	0x1
	.2byte	0x1db
	.4byte	0xb0c
	.uleb128 0x1
	.byte	0x67
	.uleb128 0x26
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x1dc
	.4byte	0xb12
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x26
	.4byte	.LASF253
	.byte	0x1
	.2byte	0x1dd
	.4byte	0x3b
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x1b
	.string	"ppp"
	.byte	0x1
	.2byte	0x1de
	.4byte	0x1c1
	.uleb128 0x27
	.string	"skb"
	.byte	0x1
	.2byte	0x1df
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x26
	.4byte	.LASF254
	.byte	0x1
	.2byte	0x1e0
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x26
	.4byte	.LASF255
	.byte	0x1
	.2byte	0x1e2
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x67
	.uleb128 0x1d
	.4byte	.LASF256
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x843
	.uleb128 0x2a
	.4byte	.Ldebug_ranges0+0xd0
	.uleb128 0x1d
	.4byte	.LASF257
	.byte	0x1
	.2byte	0x1f1
	.4byte	0x843
	.uleb128 0x1d
	.4byte	.LASF258
	.byte	0x1
	.2byte	0x1f2
	.4byte	0x5b
	.uleb128 0x1d
	.4byte	.LASF259
	.byte	0x1
	.2byte	0x1f3
	.4byte	0x5b
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1c1
	.uleb128 0x34
	.4byte	.LASF279
	.byte	0x1
	.2byte	0x28c
	.4byte	0xf5
	.8byte	.LFB3830
	.8byte	.LFE3830-.LFB3830
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF260
	.byte	0x1
	.2byte	0x296
	.4byte	0x5b
	.8byte	.LFB3831
	.8byte	.LFE3831-.LFB3831
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf5a
	.uleb128 0x21
	.string	"skb"
	.byte	0x1
	.2byte	0x296
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x1d
	.4byte	.LASF261
	.byte	0x1
	.2byte	0x298
	.4byte	0x5b
	.uleb128 0x1d
	.4byte	.LASF262
	.byte	0x1
	.2byte	0x299
	.4byte	0xb0c
	.uleb128 0x26
	.4byte	.LASF263
	.byte	0x1
	.2byte	0x299
	.4byte	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x29a
	.4byte	0xb12
	.uleb128 0x1d
	.4byte	.LASF264
	.byte	0x1
	.2byte	0x29a
	.4byte	0x5fb
	.uleb128 0x27
	.string	"tos"
	.byte	0x1
	.2byte	0x29b
	.4byte	0x3b
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x27
	.string	"eth"
	.byte	0x1
	.2byte	0x29c
	.4byte	0xf5a
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1d
	.4byte	.LASF265
	.byte	0x1
	.2byte	0x29d
	.4byte	0x5b
	.uleb128 0x26
	.4byte	.LASF266
	.byte	0x1
	.2byte	0x29e
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x26
	.4byte	.LASF267
	.byte	0x1
	.2byte	0x29e
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1d
	.4byte	.LASF268
	.byte	0x1
	.2byte	0x29e
	.4byte	0x5b
	.uleb128 0x23
	.8byte	.LBB184
	.8byte	.LBE184-.LBB184
	.uleb128 0x27
	.string	"ppp"
	.byte	0x1
	.2byte	0x2af
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x67
	.uleb128 0x2a
	.4byte	.Ldebug_ranges0+0x100
	.uleb128 0x1d
	.4byte	.LASF269
	.byte	0x1
	.2byte	0x2ce
	.4byte	0x1c1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x258
	.uleb128 0x20
	.4byte	.LASF270
	.byte	0x1
	.2byte	0x30f
	.8byte	.LFB3832
	.8byte	.LFE3832-.LFB3832
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfa7
	.uleb128 0x21
	.string	"skb"
	.byte	0x1
	.2byte	0x30f
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1d
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x311
	.4byte	0xb12
	.uleb128 0x27
	.string	"iph"
	.byte	0x1
	.2byte	0x312
	.4byte	0x843
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF271
	.byte	0x1
	.2byte	0x39a
	.4byte	0x5b
	.8byte	.LFB3835
	.8byte	.LFE3835-.LFB3835
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10bf
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x39a
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF272
	.byte	0x1
	.2byte	0x39a
	.4byte	0x18a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x39b
	.4byte	0xf5
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2d
	.4byte	.LASF256
	.byte	0x1
	.2byte	0x39b
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x26
	.4byte	.LASF274
	.byte	0x1
	.2byte	0x39d
	.4byte	0x10bf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x28
	.4byte	0x899
	.8byte	.LBB187
	.4byte	.Ldebug_ranges0+0x130
	.byte	0x1
	.2byte	0x3a2
	.4byte	0x1085
	.uleb128 0x29
	.4byte	0x8c1
	.uleb128 0x29
	.4byte	0x8b5
	.uleb128 0x29
	.4byte	0x8aa
	.uleb128 0x23
	.8byte	.LBB189
	.8byte	.LBE189-.LBB189
	.uleb128 0x24
	.4byte	0x8cc
	.uleb128 0x24
	.4byte	0x8d8
	.uleb128 0x2b
	.4byte	0x7ce
	.8byte	.LBB190
	.8byte	.LBE190-.LBB190
	.byte	0x4
	.2byte	0x123
	.uleb128 0x23
	.8byte	.LBB191
	.8byte	.LBE191-.LBB191
	.uleb128 0x24
	.4byte	0x7de
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	0x8e6
	.8byte	.LBB194
	.8byte	.LBE194-.LBB194
	.byte	0x1
	.2byte	0x3a3
	.uleb128 0x35
	.4byte	0x8f7
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x23
	.8byte	.LBB195
	.8byte	.LBE195-.LBB195
	.uleb128 0x36
	.4byte	0x901
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x37
	.4byte	0x123
	.4byte	0x10cf
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0xc7
	.byte	0
	.uleb128 0x39
	.4byte	.LASF277
	.byte	0x1
	.2byte	0x415
	.4byte	0x168
	.8byte	.LFB3842
	.8byte	.LFE3842-.LFB3842
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x112a
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x415
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF275
	.byte	0x1
	.2byte	0x415
	.4byte	0x18a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2d
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x416
	.4byte	0x15d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x21
	.string	"off"
	.byte	0x1
	.2byte	0x416
	.4byte	0x1e9
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF276
	.byte	0x1
	.2byte	0x3a8
	.4byte	0x5b
	.8byte	.LFB3836
	.8byte	.LFE3836-.LFB3836
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1263
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x3a8
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF272
	.byte	0x1
	.2byte	0x3a8
	.4byte	0x18a
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x2d
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x3a9
	.4byte	0xf5
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x2d
	.4byte	.LASF256
	.byte	0x1
	.2byte	0x3a9
	.4byte	0x1c1
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1d
	.4byte	.LASF274
	.byte	0x1
	.2byte	0x3ab
	.4byte	0x11d
	.uleb128 0x22
	.4byte	0x90c
	.8byte	.LBB196
	.8byte	.LBE196-.LBB196
	.byte	0x1
	.2byte	0x3b8
	.4byte	0x11b7
	.uleb128 0x29
	.4byte	0x929
	.uleb128 0x29
	.4byte	0x91d
	.byte	0
	.uleb128 0x28
	.4byte	0x899
	.8byte	.LBB198
	.4byte	.Ldebug_ranges0+0x160
	.byte	0x1
	.2byte	0x3bc
	.4byte	0x122b
	.uleb128 0x29
	.4byte	0x8c1
	.uleb128 0x29
	.4byte	0x8b5
	.uleb128 0x29
	.4byte	0x8aa
	.uleb128 0x23
	.8byte	.LBB200
	.8byte	.LBE200-.LBB200
	.uleb128 0x24
	.4byte	0x8cc
	.uleb128 0x24
	.4byte	0x8d8
	.uleb128 0x2b
	.4byte	0x7ce
	.8byte	.LBB201
	.8byte	.LBE201-.LBB201
	.byte	0x4
	.2byte	0x123
	.uleb128 0x23
	.8byte	.LBB202
	.8byte	.LBE202-.LBB202
	.uleb128 0x24
	.4byte	0x7de
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	0x8e6
	.8byte	.LBB205
	.8byte	.LBE205-.LBB205
	.byte	0x1
	.2byte	0x3bd
	.uleb128 0x29
	.4byte	0x8f7
	.uleb128 0x23
	.8byte	.LBB206
	.8byte	.LBE206-.LBB206
	.uleb128 0x36
	.4byte	0x901
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x39
	.4byte	.LASF278
	.byte	0x1
	.2byte	0x401
	.4byte	0x168
	.8byte	.LFB3840
	.8byte	.LFE3840-.LFB3840
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12be
	.uleb128 0x2d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x401
	.4byte	0x514
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2d
	.4byte	.LASF275
	.byte	0x1
	.2byte	0x401
	.4byte	0x18a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2d
	.4byte	.LASF273
	.byte	0x1
	.2byte	0x402
	.4byte	0x15d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x21
	.string	"off"
	.byte	0x1
	.2byte	0x402
	.4byte	0x1e9
	.uleb128 0x1
	.byte	0x53
	.byte	0
	.uleb128 0x3a
	.4byte	.LASF280
	.byte	0x1
	.2byte	0x449
	.4byte	0x5b
	.8byte	.LFB3843
	.8byte	.LFE3843-.LFB3843
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3b
	.4byte	.LASF360
	.byte	0x1
	.2byte	0x469
	.8byte	.LFB3844
	.8byte	.LFE3844-.LFB3844
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF281
	.uleb128 0xb
	.4byte	.LASF282
	.uleb128 0xb
	.4byte	.LASF283
	.uleb128 0xb
	.4byte	.LASF284
	.uleb128 0x3c
	.4byte	.LASF285
	.byte	0x1d
	.byte	0x94
	.4byte	0x6d
	.4byte	0x1fbd0
	.uleb128 0x37
	.4byte	0x8d
	.4byte	0x1329
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x5
	.byte	0
	.uleb128 0x3d
	.4byte	.LASF286
	.byte	0x1e
	.byte	0x3b
	.4byte	0x133b
	.byte	0x6
	.byte	0x1
	.byte	0x80
	.byte	0xc2
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	0x1319
	.uleb128 0x33
	.4byte	.LASF287
	.byte	0x1
	.byte	0x30
	.4byte	0x61e
	.uleb128 0x9
	.byte	0x3
	.8byte	pptpAccInfo
	.uleb128 0x33
	.4byte	.LASF288
	.byte	0x1
	.byte	0x3d
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	pptp_conn_check
	.uleb128 0x26
	.4byte	.LASF289
	.byte	0x1
	.2byte	0x442
	.4byte	0x1380
	.uleb128 0x9
	.byte	0x3
	.8byte	res1
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1305
	.uleb128 0x26
	.4byte	.LASF290
	.byte	0x1
	.2byte	0x443
	.4byte	0x1380
	.uleb128 0x9
	.byte	0x3
	.8byte	res_check_pptp
	.uleb128 0x3e
	.4byte	.LASF291
	.byte	0x1f
	.byte	0x28
	.4byte	0xf5
	.uleb128 0x37
	.4byte	0x5b
	.4byte	0x13b2
	.uleb128 0x3f
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF292
	.byte	0x20
	.byte	0x2e
	.4byte	0x13a7
	.uleb128 0x40
	.4byte	.LASF293
	.byte	0x21
	.2byte	0x1b7
	.4byte	0x5b
	.uleb128 0x37
	.4byte	0x123
	.4byte	0x13d4
	.uleb128 0x3f
	.byte	0
	.uleb128 0x40
	.4byte	.LASF294
	.byte	0x21
	.2byte	0x1ef
	.4byte	0x13e0
	.uleb128 0xa
	.4byte	0x13c9
	.uleb128 0x40
	.4byte	.LASF295
	.byte	0x21
	.2byte	0x1fa
	.4byte	0x13f1
	.uleb128 0xa
	.4byte	0x13c9
	.uleb128 0x41
	.4byte	.LASF296
	.byte	0x3
	.byte	0x45
	.4byte	0xf5
	.uleb128 0x1
	.byte	0x6f
	.uleb128 0x3e
	.4byte	.LASF297
	.byte	0x22
	.byte	0x3f
	.4byte	0xf5
	.uleb128 0x37
	.4byte	0xf5
	.4byte	0x141e
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF298
	.byte	0x23
	.byte	0x63
	.4byte	0x140e
	.uleb128 0x3e
	.4byte	.LASF299
	.byte	0x24
	.byte	0x4e
	.4byte	0x1434
	.uleb128 0x42
	.4byte	0xf5
	.uleb128 0x3e
	.4byte	.LASF300
	.byte	0x25
	.byte	0x25
	.4byte	0x5b
	.uleb128 0x3e
	.4byte	.LASF301
	.byte	0x25
	.byte	0x59
	.4byte	0x144f
	.uleb128 0xa
	.4byte	0x1f9
	.uleb128 0x37
	.4byte	0xf5
	.4byte	0x146a
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x40
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0
	.byte	0
	.uleb128 0x40
	.4byte	.LASF302
	.byte	0x25
	.2byte	0x2f2
	.4byte	0x1476
	.uleb128 0xa
	.4byte	0x1454
	.uleb128 0x3e
	.4byte	.LASF303
	.byte	0x26
	.byte	0x8a
	.4byte	0xad
	.uleb128 0x3e
	.4byte	.LASF304
	.byte	0x26
	.byte	0x92
	.4byte	0xb8
	.uleb128 0x3e
	.4byte	.LASF305
	.byte	0x27
	.byte	0x22
	.4byte	0x5b
	.uleb128 0x3e
	.4byte	.LASF306
	.byte	0x27
	.byte	0x23
	.4byte	0x5b
	.uleb128 0x3e
	.4byte	.LASF307
	.byte	0x28
	.byte	0x98
	.4byte	0x12f6
	.uleb128 0x40
	.4byte	.LASF308
	.byte	0x29
	.2byte	0x978
	.4byte	0x12fb
	.uleb128 0x37
	.4byte	0xf5
	.4byte	0x14ce
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x3
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF309
	.byte	0x2a
	.byte	0x12
	.4byte	0x14be
	.uleb128 0x3e
	.4byte	.LASF310
	.byte	0x2b
	.byte	0x4e
	.4byte	0x5b
	.uleb128 0x40
	.4byte	.LASF311
	.byte	0x2c
	.2byte	0x160
	.4byte	0x14f0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1300
	.uleb128 0x40
	.4byte	.LASF312
	.byte	0x2b
	.2byte	0x354
	.4byte	0x1e4
	.uleb128 0x37
	.4byte	0x1513
	.4byte	0x1513
	.uleb128 0x43
	.4byte	0x1ba
	.2byte	0x3ff
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1ef
	.uleb128 0x40
	.4byte	.LASF38
	.byte	0x2b
	.2byte	0x42f
	.4byte	0x1502
	.uleb128 0x37
	.4byte	0x1f4
	.4byte	0x1535
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x3
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF39
	.byte	0x2d
	.byte	0xe
	.4byte	0x1525
	.uleb128 0x3e
	.4byte	.LASF313
	.byte	0x2e
	.byte	0x1c
	.4byte	0x5b
	.uleb128 0x40
	.4byte	.LASF314
	.byte	0x2f
	.2byte	0x132
	.4byte	0x6d
	.uleb128 0x40
	.4byte	.LASF315
	.byte	0x29
	.2byte	0x7e5
	.4byte	0x1563
	.uleb128 0x8
	.byte	0x8
	.4byte	0x1df
	.uleb128 0x40
	.4byte	.LASF316
	.byte	0x30
	.2byte	0x20d
	.4byte	0x5b
	.uleb128 0x40
	.4byte	.LASF44
	.byte	0x31
	.2byte	0x105
	.4byte	0x21e
	.uleb128 0x40
	.4byte	.LASF317
	.byte	0x32
	.2byte	0x8ee
	.4byte	0x158d
	.uleb128 0x8
	.byte	0x8
	.4byte	0x228
	.uleb128 0x37
	.4byte	0xf5
	.4byte	0x15a4
	.uleb128 0x43
	.4byte	0x1ba
	.2byte	0x7ff
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF318
	.byte	0x33
	.byte	0x10
	.4byte	0x1593
	.uleb128 0x3e
	.4byte	.LASF319
	.byte	0x34
	.byte	0x2a
	.4byte	0xf5
	.uleb128 0x40
	.4byte	.LASF320
	.byte	0x35
	.2byte	0x1cc
	.4byte	0x15c6
	.uleb128 0x8
	.byte	0x8
	.4byte	0x204
	.uleb128 0x3e
	.4byte	.LASF321
	.byte	0x36
	.byte	0x2b
	.4byte	0x232
	.uleb128 0x37
	.4byte	0x6bd
	.4byte	0x15e7
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x16
	.byte	0
	.uleb128 0x40
	.4byte	.LASF322
	.byte	0x5
	.2byte	0x107
	.4byte	0x15d7
	.uleb128 0x3e
	.4byte	.LASF323
	.byte	0x37
	.byte	0xa
	.4byte	0x5b
	.uleb128 0x3e
	.4byte	.LASF324
	.byte	0xd
	.byte	0x22
	.4byte	0xf5
	.uleb128 0x40
	.4byte	.LASF325
	.byte	0x38
	.2byte	0x262
	.4byte	0xf5
	.uleb128 0x37
	.4byte	0x1620
	.4byte	0x1620
	.uleb128 0x3f
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x23c
	.uleb128 0x40
	.4byte	.LASF326
	.byte	0xd
	.2byte	0x225
	.4byte	0x1632
	.uleb128 0xa
	.4byte	0x1615
	.uleb128 0x37
	.4byte	0x19a
	.4byte	0x1647
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x20
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF327
	.byte	0x39
	.byte	0x6f
	.4byte	0x1637
	.uleb128 0x40
	.4byte	.LASF328
	.byte	0xd
	.2byte	0x6cd
	.4byte	0x13c9
	.uleb128 0x40
	.4byte	.LASF329
	.byte	0xd
	.2byte	0x6cd
	.4byte	0x13c9
	.uleb128 0x3e
	.4byte	.LASF330
	.byte	0x3a
	.byte	0x15
	.4byte	0x1675
	.uleb128 0x8
	.byte	0x8
	.4byte	0x253
	.uleb128 0x3e
	.4byte	.LASF331
	.byte	0x3b
	.byte	0x1d
	.4byte	0x253
	.uleb128 0x3e
	.4byte	.LASF332
	.byte	0x3c
	.byte	0xa2
	.4byte	0x25d
	.uleb128 0x3e
	.4byte	.LASF333
	.byte	0x3c
	.byte	0xa3
	.4byte	0x25d
	.uleb128 0x3e
	.4byte	.LASF334
	.byte	0x3d
	.byte	0x93
	.4byte	0x26d
	.uleb128 0xd
	.4byte	0x16b2
	.uleb128 0xe
	.4byte	0x267
	.byte	0
	.uleb128 0x40
	.4byte	.LASF335
	.byte	0x3d
	.2byte	0x15c
	.4byte	0x16be
	.uleb128 0x8
	.byte	0x8
	.4byte	0x16a7
	.uleb128 0x3e
	.4byte	.LASF336
	.byte	0x3e
	.byte	0x55
	.4byte	0x209
	.uleb128 0x3e
	.4byte	.LASF337
	.byte	0x3e
	.byte	0x75
	.4byte	0x39b
	.uleb128 0x40
	.4byte	.LASF338
	.byte	0x3f
	.2byte	0x2a5
	.4byte	0xa2
	.uleb128 0x40
	.4byte	.LASF98
	.byte	0x3f
	.2byte	0x2a6
	.4byte	0x16f2
	.uleb128 0x8
	.byte	0x8
	.4byte	0x3a7
	.uleb128 0x40
	.4byte	.LASF339
	.byte	0x3f
	.2byte	0x8e1
	.4byte	0x5b
	.uleb128 0x40
	.4byte	.LASF340
	.byte	0x40
	.2byte	0x15e
	.4byte	0x50f
	.uleb128 0x40
	.4byte	.LASF341
	.byte	0x41
	.2byte	0x2ff
	.4byte	0x20e
	.uleb128 0x3e
	.4byte	.LASF342
	.byte	0x42
	.byte	0xc1
	.4byte	0x1727
	.uleb128 0xa
	.4byte	0x13c9
	.uleb128 0x3e
	.4byte	.LASF343
	.byte	0x15
	.byte	0x3e
	.4byte	0x5a1
	.uleb128 0x40
	.4byte	.LASF344
	.byte	0x43
	.2byte	0x145
	.4byte	0xa2
	.uleb128 0x37
	.4byte	0x30
	.4byte	0x1753
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0xf
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF345
	.byte	0x44
	.byte	0xe5
	.4byte	0x175e
	.uleb128 0xa
	.4byte	0x1743
	.uleb128 0x40
	.4byte	.LASF346
	.byte	0x44
	.2byte	0x14e
	.4byte	0x5b
	.uleb128 0x3e
	.4byte	.LASF347
	.byte	0x45
	.byte	0xa
	.4byte	0x5a1
	.uleb128 0x37
	.4byte	0x20e
	.4byte	0x1790
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0xc
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0x7
	.byte	0
	.uleb128 0x3e
	.4byte	.LASF348
	.byte	0x46
	.byte	0x91
	.4byte	0x177a
	.uleb128 0x37
	.4byte	0x17ab
	.4byte	0x17ab
	.uleb128 0x38
	.4byte	0x1ba
	.byte	0xc
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x17b1
	.uleb128 0xa
	.4byte	0x5f6
	.uleb128 0x40
	.4byte	.LASF190
	.byte	0x46
	.2byte	0x124
	.4byte	0x179b
	.uleb128 0xd
	.4byte	0x17d2
	.uleb128 0xe
	.4byte	0x3a1
	.uleb128 0xe
	.4byte	0x17d2
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.4byte	0x262
	.uleb128 0x40
	.4byte	.LASF349
	.byte	0x46
	.2byte	0x14e
	.4byte	0x17e4
	.uleb128 0x8
	.byte	0x8
	.4byte	0x17c2
	.uleb128 0x40
	.4byte	.LASF350
	.byte	0x47
	.2byte	0x122
	.4byte	0x1aa
	.uleb128 0x3e
	.4byte	.LASF351
	.byte	0x48
	.byte	0x18
	.4byte	0x1305
	.uleb128 0x41
	.4byte	.LASF352
	.byte	0x1
	.byte	0x3e
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	fast_pptp_fw
	.uleb128 0x40
	.4byte	.LASF353
	.byte	0x48
	.2byte	0x1ac
	.4byte	0x1ce
	.uleb128 0x41
	.4byte	.LASF354
	.byte	0x1
	.byte	0x31
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	pptp_tcp_finished
	.uleb128 0x44
	.4byte	.LASF355
	.byte	0x1
	.2byte	0x408
	.4byte	0x22d
	.uleb128 0x9
	.byte	0x3
	.8byte	fastpath_pptp_proc_fops
	.uleb128 0x44
	.4byte	.LASF356
	.byte	0x1
	.2byte	0x41c
	.4byte	0x22d
	.uleb128 0x9
	.byte	0x3
	.8byte	pptp_conn_proc_fops
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x4c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	.LFB3843
	.8byte	.LFE3843-.LFB3843
	.8byte	.LFB3844
	.8byte	.LFE3844-.LFB3844
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.8byte	.LBB161
	.8byte	.LBE161
	.8byte	.LBB180
	.8byte	.LBE180
	.8byte	0
	.8byte	0
	.8byte	.LBB162
	.8byte	.LBE162
	.8byte	.LBB165
	.8byte	.LBE165
	.8byte	0
	.8byte	0
	.8byte	.LBB166
	.8byte	.LBE166
	.8byte	.LBB170
	.8byte	.LBE170
	.8byte	.LBB171
	.8byte	.LBE171
	.8byte	0
	.8byte	0
	.8byte	.LBB172
	.8byte	.LBE172
	.8byte	.LBB175
	.8byte	.LBE175
	.8byte	0
	.8byte	0
	.8byte	.LBB182
	.8byte	.LBE182
	.8byte	.LBB183
	.8byte	.LBE183
	.8byte	0
	.8byte	0
	.8byte	.LBB185
	.8byte	.LBE185
	.8byte	.LBB186
	.8byte	.LBE186
	.8byte	0
	.8byte	0
	.8byte	.LBB187
	.8byte	.LBE187
	.8byte	.LBB193
	.8byte	.LBE193
	.8byte	0
	.8byte	0
	.8byte	.LBB198
	.8byte	.LBE198
	.8byte	.LBB204
	.8byte	.LBE204
	.8byte	0
	.8byte	0
	.8byte	.Ltext0
	.8byte	.Letext0
	.8byte	.LFB3843
	.8byte	.LFE3843
	.8byte	.LFB3844
	.8byte	.LFE3844
	.8byte	0
	.8byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF213:
	.string	"kmalloc_order_trace"
.LASF100:
	.string	"IPV4_DEVCONF_FORWARDING"
.LASF86:
	.string	"NF_INET_POST_ROUTING"
.LASF340:
	.string	"noop_qdisc"
.LASF198:
	.string	"pptp_acc_info"
.LASF147:
	.string	"RTAX_HOPLIMIT"
.LASF261:
	.string	"header_len"
.LASF320:
	.string	"ksoftirqd"
.LASF176:
	.string	"NEIGH_VAR_MAX"
.LASF306:
	.string	"overflowgid"
.LASF274:
	.string	"tmpbuf"
.LASF121:
	.string	"IPV4_DEVCONF_ARP_NOTIFY"
.LASF112:
	.string	"IPV4_DEVCONF_ARPFILTER"
.LASF307:
	.string	"init_user_ns"
.LASF127:
	.string	"IPV4_DEVCONF_IGMPV3_UNSOLICITED_REPORT_INTERVAL"
.LASF156:
	.string	"NEIGH_VAR_MCAST_PROBES"
.LASF292:
	.string	"console_printk"
.LASF220:
	.string	"__fswab16"
.LASF186:
	.string	"ND_OPT_ROUTE_INFO"
.LASF209:
	.string	"flags"
.LASF104:
	.string	"IPV4_DEVCONF_SECURE_REDIRECTS"
.LASF179:
	.string	"__ND_OPT_PREFIX_INFO_END"
.LASF255:
	.string	"check_stats"
.LASF160:
	.string	"NEIGH_VAR_RETRANS_TIME"
.LASF197:
	.string	"PptpCallDisconnectNotify"
.LASF221:
	.string	"__fswab32"
.LASF146:
	.string	"RTAX_REORDERING"
.LASF322:
	.string	"kmalloc_caches"
.LASF7:
	.string	"unsigned int"
.LASF224:
	.string	"from"
.LASF245:
	.string	"pptph"
.LASF37:
	.string	"pglist_data"
.LASF217:
	.string	"sp_el0"
.LASF282:
	.string	"pid_namespace"
.LASF154:
	.string	"__RTAX_MAX"
.LASF111:
	.string	"IPV4_DEVCONF_TAG"
.LASF58:
	.string	"IPPROTO_IGMP"
.LASF172:
	.string	"NEIGH_VAR_GC_INTERVAL"
.LASF202:
	.string	"to_user"
.LASF162:
	.string	"NEIGH_VAR_DELAY_PROBE_TIME"
.LASF181:
	.string	"ND_OPT_TARGET_LL_ADDR"
.LASF287:
	.string	"pptpAccInfo"
.LASF41:
	.string	"kobj_type"
.LASF125:
	.string	"IPV4_DEVCONF_ROUTE_LOCALNET"
.LASF113:
	.string	"IPV4_DEVCONF_MEDIUM_ID"
.LASF85:
	.string	"NF_INET_LOCAL_OUT"
.LASF234:
	.string	"gre_len"
.LASF346:
	.string	"sysctl_ip_default_ttl"
.LASF257:
	.string	"ppp_data"
.LASF188:
	.string	"ND_OPT_DNSSL"
.LASF122:
	.string	"IPV4_DEVCONF_ACCEPT_LOCAL"
.LASF32:
	.string	"seqcount"
.LASF27:
	.string	"ssize_t"
.LASF132:
	.string	"WB_RECLAIMABLE"
.LASF119:
	.string	"IPV4_DEVCONF_PROMOTE_SECONDARIES"
.LASF344:
	.string	"fib_multipath_secret"
.LASF276:
	.string	"ppfw_write_proc"
.LASF91:
	.string	"NFPROTO_ARP"
.LASF56:
	.string	"IPPROTO_IP"
.LASF131:
	.string	"wb_stat_item"
.LASF227:
	.string	"atoi_dec"
.LASF270:
	.string	"fast_pptp_sync_rx_seq"
.LASF183:
	.string	"ND_OPT_REDIRECT_HDR"
.LASF151:
	.string	"RTAX_INITRWND"
.LASF279:
	.string	"get_fastpptp_lastxmit"
.LASF185:
	.string	"__ND_OPT_ARRAY_MAX"
.LASF168:
	.string	"NEIGH_VAR_LOCKTIME"
.LASF337:
	.string	"of_root"
.LASF70:
	.string	"IPPROTO_ESP"
.LASF165:
	.string	"NEIGH_VAR_PROXY_QLEN"
.LASF93:
	.string	"NFPROTO_BRIDGE"
.LASF286:
	.string	"eth_reserved_addr_base"
.LASF92:
	.string	"NFPROTO_NETDEV"
.LASF334:
	.string	"init_net"
.LASF61:
	.string	"IPPROTO_EGP"
.LASF17:
	.string	"__kernel_size_t"
.LASF273:
	.string	"count"
.LASF229:
	.string	"index"
.LASF254:
	.string	"pull_offset"
.LASF295:
	.string	"hex_asc_upper"
.LASF260:
	.string	"fast_pptp_to_wan"
.LASF10:
	.string	"long long unsigned int"
.LASF45:
	.string	"file"
.LASF258:
	.string	"offset"
.LASF240:
	.string	"ppp_device"
.LASF314:
	.string	"hrtimer_resolution"
.LASF31:
	.string	"thread_info"
.LASF15:
	.string	"__kernel_ulong_t"
.LASF81:
	.string	"IPPROTO_MAX"
.LASF266:
	.string	"wanip1"
.LASF94:
	.string	"NFPROTO_IPV6"
.LASF268:
	.string	"wanip3"
.LASF159:
	.string	"NEIGH_VAR_MCAST_REPROBES"
.LASF46:
	.string	"super_block"
.LASF193:
	.string	"PptpControlHeader"
.LASF96:
	.string	"NFPROTO_NUMPROTO"
.LASF356:
	.string	"pptp_conn_proc_fops"
.LASF50:
	.string	"compound_page_dtor"
.LASF243:
	.string	"Check_GRE_rx_net_device"
.LASF129:
	.string	"__IPV4_DEVCONF_MAX"
.LASF171:
	.string	"NEIGH_VAR_BASE_REACHABLE_TIME_MS"
.LASF95:
	.string	"NFPROTO_DECNET"
.LASF218:
	.string	"arch_local_irq_save"
.LASF199:
	.string	"__fls"
.LASF130:
	.string	"nf_inet_hooks"
.LASF267:
	.string	"wanip2"
.LASF48:
	.string	"kernel_stat"
.LASF26:
	.string	"size_t"
.LASF331:
	.string	"swiotlb_dma_ops"
.LASF359:
	.string	"/home2/terry/914/NVRSDK/linux-4.4.18"
.LASF158:
	.string	"NEIGH_VAR_APP_PROBES"
.LASF203:
	.string	"check_object_size"
.LASF296:
	.string	"current_stack_pointer"
.LASF73:
	.string	"IPPROTO_BEETPH"
.LASF330:
	.string	"xen_dma_ops"
.LASF102:
	.string	"IPV4_DEVCONF_PROXY_ARP"
.LASF248:
	.string	"ocreq"
.LASF327:
	.string	"vm_stat"
.LASF24:
	.string	"_Bool"
.LASF283:
	.string	"workqueue_struct"
.LASF239:
	.string	"is_pptp_device"
.LASF205:
	.string	"object"
.LASF182:
	.string	"ND_OPT_PREFIX_INFO"
.LASF177:
	.string	"neigh_table"
.LASF18:
	.string	"__kernel_ssize_t"
.LASF63:
	.string	"IPPROTO_UDP"
.LASF302:
	.string	"cpu_bit_bitmap"
.LASF107:
	.string	"IPV4_DEVCONF_RP_FILTER"
.LASF12:
	.string	"true"
.LASF194:
	.string	"PptpOutCallRequest"
.LASF4:
	.string	"__u16"
.LASF309:
	.string	"__per_cpu_offset"
.LASF349:
	.string	"nf_nat_decode_session_hook"
.LASF291:
	.string	"__icache_flags"
.LASF180:
	.string	"ND_OPT_SOURCE_LL_ADDR"
.LASF238:
	.string	"pptp_conn_single_open"
.LASF219:
	.string	"bcopy"
.LASF263:
	.string	"iph_newone"
.LASF20:
	.string	"char"
.LASF339:
	.string	"xmit_recursion"
.LASF59:
	.string	"IPPROTO_IPIP"
.LASF47:
	.string	"file_operations"
.LASF149:
	.string	"RTAX_FEATURES"
.LASF278:
	.string	"fastpath_pptp_single_write"
.LASF212:
	.string	"order"
.LASF256:
	.string	"data"
.LASF98:
	.string	"rps_sock_flow_table"
.LASF169:
	.string	"NEIGH_VAR_QUEUE_LEN"
.LASF38:
	.string	"mem_section"
.LASF352:
	.string	"fast_pptp_fw"
.LASF135:
	.string	"WB_WRITTEN"
.LASF335:
	.string	"__fib6_flush_trees"
.LASF6:
	.string	"__u32"
.LASF247:
	.string	"ocack"
.LASF338:
	.string	"rps_cpu_mask"
.LASF106:
	.string	"IPV4_DEVCONF_SHARED_MEDIA"
.LASF207:
	.string	"kmem_cache"
.LASF133:
	.string	"WB_WRITEBACK"
.LASF208:
	.string	"kmem_cache_alloc_trace"
.LASF351:
	.string	"proc_root"
.LASF345:
	.string	"ip_tos2prio"
.LASF40:
	.string	"task_struct"
.LASF51:
	.string	"dma_map_ops"
.LASF83:
	.string	"NF_INET_LOCAL_IN"
.LASF271:
	.string	"pptpconn_write_proc"
.LASF67:
	.string	"IPPROTO_IPV6"
.LASF8:
	.string	"long long int"
.LASF321:
	.string	"kstat"
.LASF189:
	.string	"__ND_OPT_MAX"
.LASF142:
	.string	"RTAX_RTTVAR"
.LASF62:
	.string	"IPPROTO_PUP"
.LASF88:
	.string	"NFPROTO_UNSPEC"
.LASF249:
	.string	"occlrnotify"
.LASF49:
	.string	"seq_file"
.LASF43:
	.string	"inode"
.LASF71:
	.string	"IPPROTO_AH"
.LASF223:
	.string	"copy_from_user"
.LASF87:
	.string	"NF_INET_NUMHOOKS"
.LASF187:
	.string	"ND_OPT_RDNSS"
.LASF36:
	.string	"page"
.LASF145:
	.string	"RTAX_ADVMSS"
.LASF57:
	.string	"IPPROTO_ICMP"
.LASF23:
	.string	"bool"
.LASF105:
	.string	"IPV4_DEVCONF_SEND_REDIRECTS"
.LASF103:
	.string	"IPV4_DEVCONF_ACCEPT_REDIRECTS"
.LASF118:
	.string	"IPV4_DEVCONF_ARP_IGNORE"
.LASF68:
	.string	"IPPROTO_RSVP"
.LASF357:
	.ascii	"GNU C 4.9.4 -mlittle-endian -mgeneral-regs-only -mabi=lp64 -"
	.ascii	"g -O2 -std=gnu90 -fno-strict-aliasing -fno-common -fno-async"
	.ascii	"hronous-unwind-tables -fno-pic -fno-delete-null-pointer-chec"
	.ascii	"ks -fno-reorder-bl"
	.string	"ocks -fno-tree-ch -fno-caller-saves -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -femit-struct-debug-baseonly -fno-var-tracking -fno-strict-overflow -fconserve-stack --param allow-store-data-races=0"
.LASF110:
	.string	"IPV4_DEVCONF_LOG_MARTIANS"
.LASF215:
	.string	"kmalloc_index"
.LASF152:
	.string	"RTAX_QUICKACK"
.LASF233:
	.string	"ppp_protocol"
.LASF164:
	.string	"NEIGH_VAR_QUEUE_LEN_BYTES"
.LASF272:
	.string	"buffer"
.LASF206:
	.string	"size"
.LASF355:
	.string	"fastpath_pptp_proc_fops"
.LASF138:
	.string	"RTAX_LOCK"
.LASF235:
	.string	"ppfw_read_proc"
.LASF2:
	.string	"short int"
.LASF44:
	.string	"dqstats"
.LASF305:
	.string	"overflowuid"
.LASF53:
	.string	"flow_dissector"
.LASF69:
	.string	"IPPROTO_GRE"
.LASF82:
	.string	"NF_INET_PRE_ROUTING"
.LASF310:
	.string	"page_group_by_mobility_disabled"
.LASF312:
	.string	"contig_page_data"
.LASF275:
	.string	"userbuf"
.LASF264:
	.string	"grehone"
.LASF148:
	.string	"RTAX_INITCWND"
.LASF301:
	.string	"cpu_online_mask"
.LASF304:
	.string	"kimage_voffset"
.LASF64:
	.string	"IPPROTO_IDP"
.LASF281:
	.string	"user_namespace"
.LASF236:
	.string	"pptpconn_read_proc"
.LASF173:
	.string	"NEIGH_VAR_GC_THRESH1"
.LASF174:
	.string	"NEIGH_VAR_GC_THRESH2"
.LASF175:
	.string	"NEIGH_VAR_GC_THRESH3"
.LASF280:
	.string	"fast_pptp_init"
.LASF253:
	.string	"ppp_type"
.LASF153:
	.string	"RTAX_CC_ALGO"
.LASF342:
	.string	"inet_csk_timer_bug_msg"
.LASF84:
	.string	"NF_INET_FORWARD"
.LASF140:
	.string	"RTAX_WINDOW"
.LASF196:
	.string	"PptpClearCallRequest"
.LASF163:
	.string	"NEIGH_VAR_GC_STALETIME"
.LASF311:
	.string	"system_wq"
.LASF343:
	.string	"nd_tbl"
.LASF54:
	.string	"flowi"
.LASF336:
	.string	"of_node_ktype"
.LASF9:
	.string	"__u64"
.LASF277:
	.string	"pptp_conn_single_write"
.LASF231:
	.string	"is_forward"
.LASF35:
	.string	"sizetype"
.LASF214:
	.string	"kmalloc_large"
.LASF52:
	.string	"ethhdr"
.LASF167:
	.string	"NEIGH_VAR_PROXY_DELAY"
.LASF128:
	.string	"IPV4_DEVCONF_IGNORE_ROUTES_WITH_LINKDOWN"
.LASF348:
	.string	"nf_hooks_needed"
.LASF360:
	.string	"fast_pptp_exit"
.LASF14:
	.string	"long int"
.LASF141:
	.string	"RTAX_RTT"
.LASF114:
	.string	"IPV4_DEVCONF_NOXFRM"
.LASF137:
	.string	"RTAX_UNSPEC"
.LASF124:
	.string	"IPV4_DEVCONF_PROXY_ARP_PVLAN"
.LASF143:
	.string	"RTAX_SSTHRESH"
.LASF341:
	.string	"memalloc_socks"
.LASF139:
	.string	"RTAX_MTU"
.LASF241:
	.string	"sync_tx_pptp_gre_seqno"
.LASF120:
	.string	"IPV4_DEVCONF_ARP_ACCEPT"
.LASF155:
	.string	"Qdisc"
.LASF75:
	.string	"IPPROTO_PIM"
.LASF116:
	.string	"IPV4_DEVCONF_FORCE_IGMP_VERSION"
.LASF297:
	.string	"elf_hwcap"
.LASF225:
	.string	"flag"
.LASF90:
	.string	"NFPROTO_IPV4"
.LASF201:
	.string	"word"
.LASF108:
	.string	"IPV4_DEVCONF_ACCEPT_SOURCE_ROUTE"
.LASF324:
	.string	"max_mapnr"
.LASF232:
	.string	"protocol"
.LASF315:
	.string	"cad_pid"
.LASF294:
	.string	"hex_asc"
.LASF192:
	.string	"pptp_pkt_hdr"
.LASF262:
	.string	"iph_new"
.LASF21:
	.string	"__be16"
.LASF77:
	.string	"IPPROTO_SCTP"
.LASF72:
	.string	"IPPROTO_MTP"
.LASF34:
	.string	"cpumask"
.LASF358:
	.string	"net/rtl/fastpath/fast_pptp_core.c"
.LASF204:
	.string	"kasan_kmalloc"
.LASF323:
	.string	"debug_locks"
.LASF65:
	.string	"IPPROTO_TP"
.LASF316:
	.string	"sysctl_vfs_cache_pressure"
.LASF211:
	.string	"__get_order"
.LASF170:
	.string	"NEIGH_VAR_RETRANS_TIME_MS"
.LASF293:
	.string	"panic_timeout"
.LASF242:
	.string	"set_pptp_device"
.LASF290:
	.string	"res_check_pptp"
.LASF16:
	.string	"long unsigned int"
.LASF3:
	.string	"__u8"
.LASF299:
	.string	"jiffies"
.LASF29:
	.string	"atomic64_t"
.LASF328:
	.string	"__init_begin"
.LASF190:
	.string	"nf_afinfo"
.LASF39:
	.string	"cpu_topology"
.LASF333:
	.string	"flow_keys_buf_dissector"
.LASF178:
	.string	"tcphdr"
.LASF284:
	.string	"proc_dir_entry"
.LASF78:
	.string	"IPPROTO_UDPLITE"
.LASF317:
	.string	"blockdev_superblock"
.LASF60:
	.string	"IPPROTO_TCP"
.LASF195:
	.string	"PptpOutCallReply"
.LASF166:
	.string	"NEIGH_VAR_ANYCAST_DELAY"
.LASF97:
	.string	"device_node"
.LASF76:
	.string	"IPPROTO_COMP"
.LASF74:
	.string	"IPPROTO_ENCAP"
.LASF109:
	.string	"IPV4_DEVCONF_BOOTP_RELAY"
.LASF25:
	.string	"loff_t"
.LASF1:
	.string	"unsigned char"
.LASF19:
	.string	"__kernel_loff_t"
.LASF265:
	.string	"ppp_hdr_len"
.LASF350:
	.string	"xt_recseq"
.LASF228:
	.string	"kmalloc"
.LASF89:
	.string	"NFPROTO_INET"
.LASF13:
	.string	"__kernel_long_t"
.LASF288:
	.string	"pptp_conn_check"
.LASF161:
	.string	"NEIGH_VAR_BASE_REACHABLE_TIME"
.LASF11:
	.string	"false"
.LASF150:
	.string	"RTAX_RTO_MIN"
.LASF144:
	.string	"RTAX_CWND"
.LASF285:
	.string	"frag_percpu_counter_batch"
.LASF329:
	.string	"__init_end"
.LASF308:
	.string	"init_pid_ns"
.LASF259:
	.string	"ppp_offset"
.LASF298:
	.string	"cpu_hwcaps"
.LASF22:
	.string	"__be32"
.LASF353:
	.string	"sync_tx_pptp_gre_seqno_hook"
.LASF303:
	.string	"memstart_addr"
.LASF251:
	.string	"fast_pptp_to_lan"
.LASF244:
	.string	"fast_pptp_filter"
.LASF246:
	.string	"ctlh"
.LASF347:
	.string	"arp_tbl"
.LASF289:
	.string	"res1"
.LASF157:
	.string	"NEIGH_VAR_UCAST_PROBES"
.LASF42:
	.string	"static_key"
.LASF134:
	.string	"WB_DIRTIED"
.LASF99:
	.string	"iphdr"
.LASF326:
	.string	"compound_page_dtors"
.LASF123:
	.string	"IPV4_DEVCONF_SRC_VMARK"
.LASF117:
	.string	"IPV4_DEVCONF_ARP_ANNOUNCE"
.LASF0:
	.string	"signed char"
.LASF184:
	.string	"ND_OPT_MTU"
.LASF252:
	.string	"pskb"
.LASF5:
	.string	"short unsigned int"
.LASF200:
	.string	"fls64"
.LASF354:
	.string	"pptp_tcp_finished"
.LASF79:
	.string	"IPPROTO_MPLS"
.LASF28:
	.string	"gfp_t"
.LASF226:
	.string	"roksum"
.LASF101:
	.string	"IPV4_DEVCONF_MC_FORWARDING"
.LASF126:
	.string	"IPV4_DEVCONF_IGMPV2_UNSOLICITED_REPORT_INTERVAL"
.LASF33:
	.string	"seqcount_t"
.LASF300:
	.string	"nr_cpu_ids"
.LASF230:
	.string	"greh"
.LASF216:
	.string	"current_thread_info"
.LASF325:
	.string	"zero_pfn"
.LASF210:
	.string	"__ilog2_u64"
.LASF115:
	.string	"IPV4_DEVCONF_NOPOLICY"
.LASF313:
	.string	"percpu_counter_batch"
.LASF319:
	.string	"irq_err_count"
.LASF237:
	.string	"fastpath_pptp_single_open"
.LASF30:
	.string	"atomic_long_t"
.LASF250:
	.string	"occlrreq"
.LASF269:
	.string	"new_skb"
.LASF191:
	.string	"pptp_gre_hdr"
.LASF66:
	.string	"IPPROTO_DCCP"
.LASF318:
	.string	"irq_stack"
.LASF55:
	.string	"sk_buff"
.LASF332:
	.string	"flow_keys_dissector"
.LASF80:
	.string	"IPPROTO_RAW"
.LASF222:
	.string	"arch_local_irq_restore"
.LASF136:
	.string	"NR_WB_STAT_ITEMS"
	.ident	"GCC: (OpenWrt/Linaro GCC 4.9-2015.06 r46836) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
