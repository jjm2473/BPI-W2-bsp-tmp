	.cpu generic+fp+simd
	.file	"rtl865x_asicBasic.c"
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
	.type	_rtl8651_asicTableAccessForward, %function
_rtl8651_asicTableAccessForward:
.LFB1453:
	.file 1 "drivers/soc/realtek/rtd129x/hw_nat/rtl865x/../AsicDriver/rtl865x_asicBasic.c"
	.loc 1 87 0
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	mov	w21, w0
	mov	w22, w1
	mov	x20, x2
	.loc 1 90 0
	adrp	x1, rtl_hwnat_mmio
	.loc 1 88 0
	cbnz	x2, .L6
	.loc 1 88 0 is_stmt 0 discriminator 1
	mov	w2, 88
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printk
.L3:
	b	.L3
.L6:
	.loc 1 90 0 is_stmt 1 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3328
.LBB215:
.LBB216:
.LBB217:
.LBB218:
.LBB219:
	.file 2 "./arch/arm64/include/asm/io.h"
	.loc 2 91 0 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE219:
.LBE218:
.LBE217:
	.file 3 "include/asm-generic/io.h"
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE216:
.LBE215:
	.loc 1 90 0 discriminator 1
	tbnz	x0, 0, .L6
.LBB220:
	.loc 1 97 0 discriminator 1
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	ldr	w0, [x0, w21, uxtw 2]
	cbz	w0, .L4
	.loc 1 97 0 is_stmt 0
	mov	w19, 0
	.loc 1 99 0 is_stmt 1
	adrp	x26, rtl_hwnat_mmio
	.loc 1 97 0
	adrp	x25, .LANCHOR0
	uxtw	x24, w21
.L5:
	.loc 1 99 0 discriminator 3
	ldr	w23, [x20, w19, uxtw 2]
	ldr	x0, [x26, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3360
	ubfiz	x27, x19, 2, 30
	add	x27, x0, x27
.LBB221:
.LBB222:
	.loc 3 608 0 discriminator 3
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB223:
.LBB224:
	.loc 2 55 0 discriminator 3
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w23, [x27]
// 0 "" 2
#NO_APP
.LBE224:
.LBE223:
.LBE222:
.LBE221:
	.loc 1 97 0 discriminator 3
	add	w19, w19, 1
	add	x0, x25, :lo12:.LANCHOR0
	ldr	w0, [x0, x24, lsl 2]
	cmp	w0, w19
	bhi	.L5
.L4:
.LBE220:
	.loc 1 124 0
	adrp	x0, rtl_hwnat_base
	ldr	w0, [x0, #:lo12:rtl_hwnat_base]
	add	w22, w0, w22, lsl 5
	add	w21, w22, w21, lsl 16
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 3336
.LBB225:
.LBB226:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB227:
.LBB228:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w21, [x19]
// 0 "" 2
#NO_APP
.LBE228:
.LBE227:
.LBE226:
.LBE225:
	.loc 1 128 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1453:
	.size	_rtl8651_asicTableAccessForward, .-_rtl8651_asicTableAccessForward
	.align	2
	.global	_rtl8651_addAsicEntry
	.type	_rtl8651_addAsicEntry, %function
_rtl8651_addAsicEntry:
.LFB1454:
	.loc 1 131 0
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	.loc 1 132 0
	bl	_rtl8651_asicTableAccessForward
	.loc 1 137 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB229:
.LBB230:
.LBB231:
.LBB232:
.LBB233:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE233:
.LBE232:
.LBE231:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE230:
.LBE229:
	.loc 1 137 0
	ldr	x20, [x0, #:lo12:rtl_hwnat_mmio]
	add	x20, x20, 1458176
	add	x20, x20, 1048
.LBB234:
.LBB235:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE235:
.LBE234:
	.loc 1 137 0
	orr	w19, w19, 262144
.LBB239:
.LBB238:
.LBB236:
.LBB237:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x20]
// 0 "" 2
#NO_APP
.LBE237:
.LBE236:
.LBE238:
.LBE239:
	.loc 1 138 0
	adrp	x1, rtl_hwnat_mmio
.L10:
	.loc 1 138 0 is_stmt 0 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 1048
.LBB240:
.LBB241:
.LBB242:
.LBB243:
.LBB244:
	.loc 2 91 0 is_stmt 1 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE244:
.LBE243:
.LBE242:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE241:
.LBE240:
	.loc 1 138 0 discriminator 1
	tbz	x0, 19, .L10
	.loc 1 142 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 3328
.LBB245:
.LBB246:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB247:
.LBB248:
	.loc 2 55 0
	mov	w0, 3
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w0, [x19]
// 0 "" 2
#NO_APP
.LBE248:
.LBE247:
.LBE246:
.LBE245:
	.loc 1 144 0
	adrp	x1, rtl_hwnat_mmio
.L11:
	.loc 1 144 0 is_stmt 0 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3328
.LBB249:
.LBB250:
.LBB251:
.LBB252:
.LBB253:
	.loc 2 91 0 is_stmt 1 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE253:
.LBE252:
.LBE251:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE250:
.LBE249:
	.loc 1 144 0 discriminator 1
	tbnz	x0, 0, .L11
	.loc 1 146 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x0, [x0, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3332
.LBB254:
.LBB255:
.LBB256:
.LBB257:
.LBB258:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE258:
.LBE257:
.LBE256:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE255:
.LBE254:
	.loc 1 146 0
	tbz	x0, 0, .L12
	.loc 1 151 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB259:
.LBB260:
.LBB261:
.LBB262:
.LBB263:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE263:
.LBE262:
.LBE261:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE260:
.LBE259:
	.loc 1 151 0
	ldr	x20, [x0, #:lo12:rtl_hwnat_mmio]
	add	x20, x20, 1458176
	add	x20, x20, 1048
.LBB264:
.LBB265:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE265:
.LBE264:
	.loc 1 151 0
	and	w19, w19, -262145
.LBB269:
.LBB268:
.LBB266:
.LBB267:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x20]
// 0 "" 2
#NO_APP
.LBE267:
.LBE266:
.LBE268:
.LBE269:
	.loc 1 155 0
	mov	w0, -1
	b	.L13
.L12:
	.loc 1 161 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB270:
.LBB271:
.LBB272:
.LBB273:
.LBB274:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE274:
.LBE273:
.LBE272:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE271:
.LBE270:
	.loc 1 161 0
	ldr	x20, [x0, #:lo12:rtl_hwnat_mmio]
	add	x20, x20, 1458176
	add	x20, x20, 1048
.LBB275:
.LBB276:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE276:
.LBE275:
	.loc 1 161 0
	and	w19, w19, -262145
.LBB280:
.LBB279:
.LBB277:
.LBB278:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x20]
// 0 "" 2
#NO_APP
.LBE278:
.LBE277:
.LBE279:
.LBE280:
	.loc 1 165 0
	mov	w0, 0
.L13:
	.loc 1 166 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1454:
	.size	_rtl8651_addAsicEntry, .-_rtl8651_addAsicEntry
	.align	2
	.global	_rtl865x_getForceAddMcastOpCnt
	.type	_rtl865x_getForceAddMcastOpCnt, %function
_rtl865x_getForceAddMcastOpCnt:
.LFB1455:
	.loc 1 172 0
	.cfi_startproc
	.loc 1 174 0
	adrp	x0, .LANCHOR1
	ldr	w0, [x0, #:lo12:.LANCHOR1]
	ret
	.cfi_endproc
.LFE1455:
	.size	_rtl865x_getForceAddMcastOpCnt, .-_rtl865x_getForceAddMcastOpCnt
	.align	2
	.global	_rtl8198C_getForceAddMcastv6OpCnt
	.type	_rtl8198C_getForceAddMcastv6OpCnt, %function
_rtl8198C_getForceAddMcastv6OpCnt:
.LFB1456:
	.loc 1 177 0
	.cfi_startproc
	.loc 1 179 0
	adrp	x0, .LANCHOR1+4
	ldr	w0, [x0, #:lo12:.LANCHOR1+4]
	ret
	.cfi_endproc
.LFE1456:
	.size	_rtl8198C_getForceAddMcastv6OpCnt, .-_rtl8198C_getForceAddMcastv6OpCnt
	.align	2
	.global	_rtl8651_forceAddAsicEntry
	.type	_rtl8651_forceAddAsicEntry, %function
_rtl8651_forceAddAsicEntry:
.LFB1457:
	.loc 1 182 0
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	mov	w20, w0
	mov	w21, w1
	mov	x22, x2
	.loc 1 183 0
	cmp	w0, 3
	bne	.L19
	.loc 1 185 0
	adrp	x1, .LANCHOR1
	ldr	w0, [x1, #:lo12:.LANCHOR1]
	add	w0, w0, 1
	str	w0, [x1, #:lo12:.LANCHOR1]
	b	.L20
.L19:
	.loc 1 188 0
	cmp	w0, 21
	bne	.L20
	.loc 1 190 0
	adrp	x0, .LANCHOR1
	add	x0, x0, :lo12:.LANCHOR1
	ldr	w1, [x0, 4]
	add	w1, w1, 1
	str	w1, [x0, 4]
.L20:
	.loc 1 196 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB281:
.LBB282:
.LBB283:
.LBB284:
.LBB285:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE285:
.LBE284:
.LBE283:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE282:
.LBE281:
	.loc 1 196 0
	ldr	x23, [x0, #:lo12:rtl_hwnat_mmio]
	add	x23, x23, 1458176
	add	x23, x23, 1048
.LBB286:
.LBB287:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE287:
.LBE286:
	.loc 1 196 0
	orr	w19, w19, 262144
.LBB291:
.LBB290:
.LBB288:
.LBB289:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x23]
// 0 "" 2
#NO_APP
.LBE289:
.LBE288:
.LBE290:
.LBE291:
	.loc 1 197 0
	adrp	x1, rtl_hwnat_mmio
.L21:
	.loc 1 197 0 is_stmt 0 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 1048
.LBB292:
.LBB293:
.LBB294:
.LBB295:
.LBB296:
	.loc 2 91 0 is_stmt 1 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE296:
.LBE295:
.LBE294:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE293:
.LBE292:
	.loc 1 197 0 discriminator 1
	tbz	x0, 19, .L21
	.loc 1 201 0
	mov	x2, x22
	mov	w1, w21
	mov	w0, w20
	bl	_rtl8651_asicTableAccessForward
	.loc 1 203 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 3328
.LBB297:
.LBB298:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB299:
.LBB300:
	.loc 2 55 0
	mov	w0, 9
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w0, [x19]
// 0 "" 2
#NO_APP
.LBE300:
.LBE299:
.LBE298:
.LBE297:
	.loc 1 204 0
	adrp	x1, rtl_hwnat_mmio
.L22:
	.loc 1 204 0 is_stmt 0 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3328
.LBB301:
.LBB302:
.LBB303:
.LBB304:
.LBB305:
	.loc 2 91 0 is_stmt 1 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE305:
.LBE304:
.LBE303:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE302:
.LBE301:
	.loc 1 204 0 discriminator 1
	tbnz	x0, 0, .L22
	.loc 1 209 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB306:
.LBB307:
.LBB308:
.LBB309:
.LBB310:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE310:
.LBE309:
.LBE308:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE307:
.LBE306:
	.loc 1 209 0
	ldr	x20, [x0, #:lo12:rtl_hwnat_mmio]
	add	x20, x20, 1458176
	add	x20, x20, 1048
.LBB311:
.LBB312:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE312:
.LBE311:
	.loc 1 209 0
	and	w19, w19, -262145
.LBB316:
.LBB315:
.LBB313:
.LBB314:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x20]
// 0 "" 2
#NO_APP
.LBE314:
.LBE313:
.LBE315:
.LBE316:
	.loc 1 214 0
	mov	w0, 0
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
.LFE1457:
	.size	_rtl8651_forceAddAsicEntry, .-_rtl8651_forceAddAsicEntry
	.align	2
	.global	_rtl8651_readAsicEntry
	.type	_rtl8651_readAsicEntry, %function
_rtl8651_readAsicEntry:
.LFB1458:
	.loc 1 223 0
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 246 0
	cbnz	x2, .L26
	.loc 1 246 0 is_stmt 0 discriminator 1
	mov	w2, 246
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printk
.L27:
	b	.L27
.L26:
	.loc 1 249 0 is_stmt 1
	ubfiz	x1, x1, 5, 27
	adrp	x3, rtl_hwnat_mmio
	ldr	x4, [x3, #:lo12:rtl_hwnat_mmio]
	add	x4, x4, x1
	ubfiz	x5, x0, 16, 16
	add	x7, x4, x5
.L28:
	.loc 1 257 0 discriminator 1
	ldr	x1, [x3, #:lo12:rtl_hwnat_mmio]
	add	x1, x1, 1458176
	add	x1, x1, 3328
.LBB317:
.LBB318:
.LBB319:
.LBB320:
.LBB321:
	.loc 2 91 0 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w1, [x1]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE321:
.LBE320:
.LBE319:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE318:
.LBE317:
	.loc 1 257 0 discriminator 1
	tbnz	x1, 0, .L28
	.loc 1 266 0
	ldr	w17, [x4, x5]
	.loc 1 267 0
	ldr	w16, [x7, 4]
	.loc 1 268 0
	ldr	w15, [x7, 8]
	.loc 1 269 0
	ldr	w14, [x7, 12]
	.loc 1 270 0
	ldr	w13, [x7, 16]
	.loc 1 271 0
	ldr	w12, [x7, 20]
	.loc 1 272 0
	ldr	w11, [x7, 24]
	.loc 1 273 0
	ldr	w10, [x7, 28]
	.loc 1 275 0
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	ldr	w9, [x1, w0, uxtw 2]
	mov	w18, 10
	add	x8, x29, 112
	.loc 1 287 0
	add	x7, x7, 32768
	add	x5, x29, 64
.L35:
	add	x6, x29, 24
	.loc 1 275 0
	mov	x1, x6
.L30:
	.loc 1 266 0
	str	w17, [x1]
	.loc 1 267 0
	str	w16, [x1, 4]
	.loc 1 268 0
	str	w15, [x1, 8]
	.loc 1 269 0
	str	w14, [x1, 12]
	.loc 1 270 0
	str	w13, [x1, 16]
	.loc 1 271 0
	str	w12, [x1, 20]
	.loc 1 272 0
	str	w11, [x1, 24]
	.loc 1 273 0
	str	w10, [x1, 28]
	.loc 1 275 0
	cmp	w9, 8
	bls	.L29
	.loc 1 287 0
	ldr	w3, [x7]
	str	w3, [x1, 32]
	.loc 1 288 0
	ldr	w3, [x7, 4]
	str	w3, [x1, 36]
	.loc 1 289 0
	ldr	w3, [x7, 8]
	str	w3, [x1, 40]
.L29:
	add	x1, x1, 44
	.loc 1 262 0
	cmp	x1, x8
	bne	.L30
	b	.L43
.L33:
.LBB322:
	.loc 1 306 0
	ldr	w4, [x1, 48]
	ldr	w3, [x1, 4]
	cmp	w4, w3
	bne	.L32
	add	x1, x1, 4
	.loc 1 304 0 discriminator 2
	cmp	x1, x5
	bne	.L33
	b	.L34
.L43:
	.loc 1 306 0 discriminator 1
	ldr	w1, [x29, 24]
	ldr	w3, [x29, 68]
	cmp	w3, w1
	bne	.L32
	.loc 1 306 0 is_stmt 0
	add	x1, x29, 24
	b	.L33
.L32:
.LBE322:
	.loc 1 317 0 is_stmt 1
	subs	w18, w18, #1
	bne	.L35
.L34:
	.loc 1 325 0 discriminator 1
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	ldr	w3, [x1, w0, uxtw 2]
	cbz	w3, .L36
	.loc 1 325 0 is_stmt 0
	mov	x0, 0
.L37:
	.loc 1 327 0 is_stmt 1 discriminator 3
	ldr	w1, [x6, 44]
	str	w1, [x2, x0, lsl 2]
	add	x0, x0, 1
	add	x6, x6, 4
	.loc 1 325 0 discriminator 3
	cmp	w3, w0
	bhi	.L37
.L36:
	.loc 1 388 0
	mov	w0, 0
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1458:
	.size	_rtl8651_readAsicEntry, .-_rtl8651_readAsicEntry
	.align	2
	.global	_rtl8651_readAsicEntryStopTLU
	.type	_rtl8651_readAsicEntryStopTLU, %function
_rtl8651_readAsicEntryStopTLU:
.LFB1459:
	.loc 1 391 0
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	str	x23, [sp, 48]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	mov	w23, w0
	mov	x20, x2
	.loc 1 395 0
	cbnz	x2, .L45
	.loc 1 395 0 is_stmt 0 discriminator 1
	mov	w2, 395
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printk
.L46:
	b	.L46
.L45:
	.loc 1 398 0 is_stmt 1
	adrp	x2, rtl_hwnat_mmio
	ldr	x0, [x2, #:lo12:rtl_hwnat_mmio]
	ubfiz	x1, x1, 5, 27
	add	x1, x1, x0
	ubfiz	x19, x23, 16, 16
	add	x19, x1, x19
	.loc 1 411 0
	add	x21, x0, 1458176
	add	x21, x21, 1048
.LBB323:
.LBB324:
.LBB325:
.LBB326:
.LBB327:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w21, [x21]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w21, [x21]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE327:
.LBE326:
.LBE325:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE324:
.LBE323:
	.loc 1 411 0
	ldr	x22, [x2, #:lo12:rtl_hwnat_mmio]
	add	x22, x22, 1458176
	add	x22, x22, 1048
.LBB328:
.LBB329:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE329:
.LBE328:
	.loc 1 411 0
	orr	w21, w21, 262144
.LBB333:
.LBB332:
.LBB330:
.LBB331:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w21, [x22]
// 0 "" 2
#NO_APP
.LBE331:
.LBE330:
.LBE332:
.LBE333:
.LBB334:
	.loc 1 421 0
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	ldr	w0, [x0, w23, uxtw 2]
	cbz	w0, .L47
	mov	w0, 0
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	ldr	w2, [x1, w23, uxtw 2]
.L50:
	.loc 1 425 0
	cmp	w0, 7
	bhi	.L48
	.loc 1 426 0
	add	x1, x19, x0, uxtw 2
.LBB335:
.LBB336:
.LBB337:
.LBB338:
.LBB339:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w1, [x1]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE339:
.LBE338:
.LBE337:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE336:
.LBE335:
	.loc 1 426 0
	str	w1, [x20, w0, uxtw 2]
	b	.L49
.L48:
	.loc 1 428 0
	ubfiz	x1, x0, 2, 32
	add	x1, x1, 28672
	add	x1, x1, 4064
	add	x1, x19, x1
.LBB340:
.LBB341:
.LBB342:
.LBB343:
.LBB344:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w1, [x1]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w1, [x1]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE344:
.LBE343:
.LBE342:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE341:
.LBE340:
	.loc 1 428 0
	str	w1, [x20, w0, uxtw 2]
.L49:
	.loc 1 421 0 discriminator 2
	add	w0, w0, 1
	cmp	w2, w0
	bhi	.L50
.L47:
.LBE334:
	.loc 1 464 0
	adrp	x0, rtl_hwnat_mmio
	ldr	x19, [x0, #:lo12:rtl_hwnat_mmio]
	add	x19, x19, 1458176
	add	x19, x19, 1048
.LBB345:
.LBB346:
.LBB347:
.LBB348:
.LBB349:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w19, [x19]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w19, [x19]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE349:
.LBE348:
.LBE347:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE346:
.LBE345:
	.loc 1 464 0
	ldr	x20, [x0, #:lo12:rtl_hwnat_mmio]
	add	x20, x20, 1458176
	add	x20, x20, 1048
.LBB350:
.LBB351:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBE351:
.LBE350:
	.loc 1 464 0
	and	w19, w19, -262145
.LBB355:
.LBB354:
.LBB352:
.LBB353:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w19, [x20]
// 0 "" 2
#NO_APP
.LBE353:
.LBE352:
.LBE354:
.LBE355:
	.loc 1 475 0
	mov	w0, 0
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
.LFE1459:
	.size	_rtl8651_readAsicEntryStopTLU, .-_rtl8651_readAsicEntryStopTLU
	.align	2
	.global	_rtl8651_delAsicEntry
	.type	_rtl8651_delAsicEntry, %function
_rtl8651_delAsicEntry:
.LFB1460:
	.loc 1 478 0
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	mov	w22, w0
	mov	w20, w1
	mov	w24, w2
	.loc 1 481 0
	adrp	x1, rtl_hwnat_mmio
.L53:
	.loc 1 481 0 is_stmt 0 discriminator 1
	ldr	x0, [x1, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3328
.LBB356:
.LBB357:
.LBB358:
.LBB359:
.LBB360:
	.loc 2 91 0 is_stmt 1 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE360:
.LBE359:
.LBE358:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE357:
.LBE356:
	.loc 1 481 0 discriminator 1
	tbnz	x0, 0, .L53
.LBB361:
	.loc 1 487 0 discriminator 1
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	ldr	w0, [x0, w22, uxtw 2]
	cbz	w0, .L54
	.loc 1 487 0 is_stmt 0
	mov	w19, 0
	.loc 1 489 0 is_stmt 1
	adrp	x26, rtl_hwnat_mmio
.LBB362:
.LBB363:
.LBB364:
.LBB365:
	.loc 2 55 0
	mov	w25, 0
.LBE365:
.LBE364:
.LBE363:
.LBE362:
	.loc 1 487 0
	adrp	x23, .LANCHOR0
	uxtw	x21, w22
.L55:
	ldr	x0, [x26, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3360
	.loc 1 489 0 discriminator 3
	ubfiz	x27, x19, 2, 30
	add	x27, x0, x27
.LBB369:
.LBB368:
	.loc 3 608 0 discriminator 3
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB367:
.LBB366:
	.loc 2 55 0 discriminator 3
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w25, [x27]
// 0 "" 2
#NO_APP
.LBE366:
.LBE367:
.LBE368:
.LBE369:
	.loc 1 487 0 discriminator 3
	add	w19, w19, 1
	add	x0, x23, :lo12:.LANCHOR0
	ldr	w0, [x0, x21, lsl 2]
	cmp	w0, w19
	bhi	.L55
.L54:
.LBE361:
	.loc 1 513 0
	cmp	w20, w24
	bhi	.L59
	.loc 1 515 0
	lsl	w22, w22, 16
	lsl	w21, w20, 5
	adrp	x23, rtl_hwnat_base
	add	x23, x23, :lo12:rtl_hwnat_base
	adrp	x19, rtl_hwnat_mmio
.LBB370:
.LBB371:
.LBB372:
.LBB373:
	.loc 2 55 0
	mov	w25, 9
.L58:
.LBE373:
.LBE372:
.LBE371:
.LBE370:
	.loc 1 515 0
	ldr	w26, [x23]
	add	w26, w22, w26
	add	w26, w21, w26
	ldr	x27, [x19, #:lo12:rtl_hwnat_mmio]
	add	x27, x27, 1458176
	add	x27, x27, 3336
.LBB377:
.LBB378:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB379:
.LBB380:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w26, [x27]
// 0 "" 2
#NO_APP
.LBE380:
.LBE379:
.LBE378:
.LBE377:
	.loc 1 520 0
	ldr	x26, [x19, #:lo12:rtl_hwnat_mmio]
	add	x26, x26, 1458176
	add	x26, x26, 3328
.LBB381:
.LBB376:
	.loc 3 608 0
#APP
// 608 "include/asm-generic/io.h" 1
	dmb ishst
// 0 "" 2
#NO_APP
	bl	rtk_bus_sync
.LBB375:
.LBB374:
	.loc 2 55 0
#APP
// 55 "./arch/arm64/include/asm/io.h" 1
	str w25, [x26]
// 0 "" 2
#NO_APP
.L57:
.LBE374:
.LBE375:
.LBE376:
.LBE381:
	.loc 1 522 0 discriminator 1
	ldr	x0, [x19, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3328
.LBB382:
.LBB383:
.LBB384:
.LBB385:
.LBB386:
	.loc 2 91 0 discriminator 1
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE386:
.LBE385:
.LBE384:
	.loc 3 584 0 discriminator 1
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE383:
.LBE382:
	.loc 1 522 0 discriminator 1
	tbnz	x0, 0, .L57
	.loc 1 524 0
	ldr	x0, [x19, #:lo12:rtl_hwnat_mmio]
	add	x0, x0, 1458176
	add	x0, x0, 3332
.LBB387:
.LBB388:
.LBB389:
.LBB390:
.LBB391:
	.loc 2 91 0
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w0, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w0, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE391:
.LBE390:
.LBE389:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE388:
.LBE387:
	.loc 1 524 0
	tbnz	x0, 0, .L60
	.loc 1 527 0
	add	w20, w20, 1
	add	w21, w21, 32
	.loc 1 513 0
	cmp	w24, w20
	bcs	.L58
	.loc 1 529 0
	mov	w0, 0
	b	.L56
.L59:
	mov	w0, 0
	b	.L56
.L60:
	.loc 1 525 0
	mov	w0, -1
.L56:
	.loc 1 530 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1460:
	.size	_rtl8651_delAsicEntry, .-_rtl8651_delAsicEntry
	.align	2
	.global	rtl819x_poll_sw
	.type	rtl819x_poll_sw, %function
rtl819x_poll_sw:
.LFB1461:
	.loc 1 538 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
.LBB392:
.LBB393:
.LBB394:
.LBB395:
.LBB396:
	.loc 2 91 0
	mov	x0, 24844
	movk	x0, 0xbb80, lsl 16
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w4, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w4, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE396:
.LBE395:
.LBE394:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE393:
.LBE392:
.LBB397:
.LBB398:
.LBB399:
.LBB400:
.LBB401:
	.loc 2 91 0
	mov	x0, 4
	movk	x0, 0xb801, lsl 16
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w1, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w1, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE401:
.LBE400:
.LBE399:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE398:
.LBE397:
.LBB402:
.LBB403:
.LBB404:
.LBB405:
.LBB406:
	.loc 2 91 0
	add	x0, x0, 28
#APP
// 91 "./arch/arm64/include/asm/io.h" 1
	.if (1 || 0) == 1
661:
	ldr w2, [x0]
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 1
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldar w2, [x0]
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

// 0 "" 2
#NO_APP
.LBE406:
.LBE405:
.LBE404:
	.loc 3 584 0
#APP
// 584 "include/asm-generic/io.h" 1
	dsb ld
// 0 "" 2
#NO_APP
.LBE403:
.LBE402:
	.loc 1 543 0
	adrp	x0, .LANCHOR1
	add	x0, x0, :lo12:.LANCHOR1
	ldr	w3, [x0, 8]
	add	w5, w3, 1
	str	w5, [x0, 8]
	mov	w0, 52429
	movk	w0, 0xcccc, lsl 16
	umull	x0, w3, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 4
	lsl	w5, w0, 4
	add	w0, w5, w0, lsl 2
	cmp	w3, w0
	bne	.L65
	.loc 1 540 0
	and	w0, w1, -4
	.loc 1 541 0
	and	w2, w2, -4
	.loc 1 547 0
	tbnz	x4, 16, .L67
	.loc 1 549 0
	adrp	x1, .LANCHOR1+12
	str	wzr, [x1, #:lo12:.LANCHOR1+12]
	b	.L68
.L67:
	.loc 1 554 0
	adrp	x1, .LANCHOR1+16
	ldr	w1, [x1, #:lo12:.LANCHOR1+16]
	cbz	w1, .L69
	.loc 1 554 0 is_stmt 0 discriminator 1
	adrp	x3, .LANCHOR1+20
	ldr	w3, [x3, #:lo12:.LANCHOR1+20]
	cbnz	w3, .L70
.L69:
	.loc 1 558 0 is_stmt 1
	adrp	x1, .LANCHOR1+12
	str	wzr, [x1, #:lo12:.LANCHOR1+12]
	b	.L68
.L70:
	.loc 1 562 0 discriminator 1
	cmp	w0, w3
	bne	.L71
	cmp	w2, w1
	bne	.L71
	.loc 1 564 0
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	ldr	w3, [x1, 12]
	add	w3, w3, 1
	str	w3, [x1, 12]
	b	.L68
.L71:
	.loc 1 568 0
	adrp	x1, .LANCHOR1+12
	str	wzr, [x1, #:lo12:.LANCHOR1+12]
.L68:
	.loc 1 576 0
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	str	w0, [x1, 20]
	.loc 1 577 0
	str	w2, [x1, 16]
	.loc 1 579 0
	ldr	w0, [x1, 12]
	cmp	w0, 2
	bls	.L65
	.loc 1 581 0
	adrp	x0, .LANCHOR1+12
	str	wzr, [x0, #:lo12:.LANCHOR1+12]
	.loc 1 582 0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printk
	.loc 1 583 0
	mov	x0, 0
	bl	machine_restart
.L65:
	.loc 1 589 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1461:
	.size	rtl819x_poll_sw, .-rtl819x_poll_sw
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
	.type	_rtl8651_asicTableSize, %object
	.size	_rtl8651_asicTableSize, 88
_rtl8651_asicTableSize:
	.word	2
	.word	1
	.word	3
	.word	3
	.word	5
	.word	3
	.word	3
	.word	3
	.word	4
	.word	3
	.word	3
	.word	1
	.word	11
	.word	1
	.word	3
	.word	1
	.word	9
	.word	6
	.word	6
	.word	1
	.word	3
	.word	9
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"drivers/soc/realtek/rtd129x/hw_nat/rtl865x/../AsicDriver/rtl865x_asicBasic.c"
	.zero	3
.LC1:
	.string	"\nAssert Fail: %s %d"
	.zero	4
.LC2:
	.string	".........................................\n"
	.bss
	.align	2
.LANCHOR1 = . + 0
	.type	mcastForceAddOpCnt, %object
	.size	mcastForceAddOpCnt, 4
mcastForceAddOpCnt:
	.zero	4
	.type	mcastForceAddOpCnt6, %object
	.size	mcastForceAddOpCnt6, 4
mcastForceAddOpCnt6:
	.zero	4
	.type	rtl819x_checkSwCoreTimer, %object
	.size	rtl819x_checkSwCoreTimer, 4
rtl819x_checkSwCoreTimer:
	.zero	4
	.type	rtl819x_swHangCnt, %object
	.size	rtl819x_swHangCnt, 4
rtl819x_swHangCnt:
	.zero	4
	.type	rtl819x_lastTxDesc, %object
	.size	rtl819x_lastTxDesc, 4
rtl819x_lastTxDesc:
	.zero	4
	.type	rtl819x_lastRxDesc, %object
	.size	rtl819x_lastRxDesc, 4
rtl819x_lastRxDesc:
	.zero	4
	.text
.Letext0:
	.file 4 "include/asm-generic/int-ll64.h"
	.file 5 "include/uapi/asm-generic/int-ll64.h"
	.file 6 "include/uapi/linux/types.h"
	.file 7 "include/linux/types.h"
	.file 8 "include/uapi/linux/personality.h"
	.file 9 "include/linux/mm_types.h"
	.file 10 "include/linux/nodemask.h"
	.file 11 "include/linux/pid.h"
	.file 12 "include/linux/percpu.h"
	.file 13 "include/linux/mmzone.h"
	.file 14 "include/linux/hrtimer.h"
	.file 15 "include/net/rtl/rtl_types.h"
	.file 16 "drivers/soc/realtek/rtd129x/hw_nat/rtl865x/../AsicDriver/rtl865xc_asicregs.h"
	.file 17 "drivers/soc/realtek/rtd129x/hw_nat/rtl865x/../AsicDriver/rtl865x_asicBasic.h"
	.file 18 "./arch/arm64/include/asm/cachetype.h"
	.file 19 "include/linux/printk.h"
	.file 20 "include/linux/kernel.h"
	.file 21 "./arch/arm64/include/asm/thread_info.h"
	.file 22 "./arch/arm64/include/asm/hwcap.h"
	.file 23 "./arch/arm64/include/asm/cpufeature.h"
	.file 24 "include/linux/jiffies.h"
	.file 25 "include/linux/cpumask.h"
	.file 26 "./arch/arm64/include/asm/memory.h"
	.file 27 "./arch/arm64/include/asm/smp.h"
	.file 28 "include/linux/highuid.h"
	.file 29 "include/linux/sched.h"
	.file 30 "include/linux/workqueue.h"
	.file 31 "./arch/arm64/include/asm/topology.h"
	.file 32 "include/linux/percpu_counter.h"
	.file 33 "include/asm-generic/pgtable.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1a87
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF215
	.byte	0x1
	.4byte	.LASF216
	.4byte	.LASF217
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x5
	.byte	0x1a
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x5
	.string	"u32"
	.byte	0x4
	.byte	0x16
	.4byte	0x5b
	.uleb128 0x5
	.string	"s64"
	.byte	0x4
	.byte	0x18
	.4byte	0x62
	.uleb128 0x5
	.string	"u64"
	.byte	0x4
	.byte	0x19
	.4byte	0x69
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x6
	.byte	0x22
	.4byte	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x7
	.byte	0x24
	.4byte	0x98
	.uleb128 0x6
	.4byte	.LASF37
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x7
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x4
	.byte	0xa
	.2byte	0x174
	.4byte	0x109
	.uleb128 0x9
	.4byte	.LASF15
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF16
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF17
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF18
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF19
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF20
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF21
	.sleb128 4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x8
	.byte	0xa
	.4byte	0x173
	.uleb128 0x9
	.4byte	.LASF22
	.sleb128 131072
	.uleb128 0x9
	.4byte	.LASF23
	.sleb128 262144
	.uleb128 0x9
	.4byte	.LASF24
	.sleb128 524288
	.uleb128 0x9
	.4byte	.LASF25
	.sleb128 1048576
	.uleb128 0x9
	.4byte	.LASF26
	.sleb128 2097152
	.uleb128 0x9
	.4byte	.LASF27
	.sleb128 4194304
	.uleb128 0x9
	.4byte	.LASF28
	.sleb128 8388608
	.uleb128 0x9
	.4byte	.LASF29
	.sleb128 16777216
	.uleb128 0x9
	.4byte	.LASF30
	.sleb128 33554432
	.uleb128 0x9
	.4byte	.LASF31
	.sleb128 67108864
	.uleb128 0x9
	.4byte	.LASF32
	.sleb128 134217728
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x9
	.2byte	0x17a
	.4byte	0x195
	.uleb128 0x9
	.4byte	.LASF33
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF34
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF35
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF36
	.sleb128 3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF38
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x4
	.byte	0xb
	.byte	0x6
	.4byte	0x1bf
	.uleb128 0x9
	.4byte	.LASF41
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF42
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF43
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF44
	.sleb128 3
	.byte	0
	.uleb128 0xd
	.string	"pid"
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x4
	.byte	0xc
	.byte	0x4f
	.4byte	0x1e9
	.uleb128 0x9
	.4byte	.LASF46
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF47
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF48
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF49
	.sleb128 3
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0xd
	.byte	0x26
	.4byte	0x222
	.uleb128 0x9
	.4byte	.LASF50
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF51
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF52
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF53
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF54
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF55
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF56
	.sleb128 5
	.uleb128 0x9
	.4byte	.LASF57
	.sleb128 6
	.byte	0
	.uleb128 0xc
	.4byte	.LASF58
	.byte	0x4
	.byte	0xd
	.byte	0x74
	.4byte	0x301
	.uleb128 0x9
	.4byte	.LASF59
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF60
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF61
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF62
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF63
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF64
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF65
	.sleb128 5
	.uleb128 0x9
	.4byte	.LASF66
	.sleb128 6
	.uleb128 0x9
	.4byte	.LASF67
	.sleb128 7
	.uleb128 0x9
	.4byte	.LASF68
	.sleb128 8
	.uleb128 0x9
	.4byte	.LASF69
	.sleb128 9
	.uleb128 0x9
	.4byte	.LASF70
	.sleb128 10
	.uleb128 0x9
	.4byte	.LASF71
	.sleb128 11
	.uleb128 0x9
	.4byte	.LASF72
	.sleb128 12
	.uleb128 0x9
	.4byte	.LASF73
	.sleb128 13
	.uleb128 0x9
	.4byte	.LASF74
	.sleb128 14
	.uleb128 0x9
	.4byte	.LASF75
	.sleb128 15
	.uleb128 0x9
	.4byte	.LASF76
	.sleb128 16
	.uleb128 0x9
	.4byte	.LASF77
	.sleb128 17
	.uleb128 0x9
	.4byte	.LASF78
	.sleb128 18
	.uleb128 0x9
	.4byte	.LASF79
	.sleb128 19
	.uleb128 0x9
	.4byte	.LASF80
	.sleb128 20
	.uleb128 0x9
	.4byte	.LASF81
	.sleb128 21
	.uleb128 0x9
	.4byte	.LASF82
	.sleb128 22
	.uleb128 0x9
	.4byte	.LASF83
	.sleb128 23
	.uleb128 0x9
	.4byte	.LASF84
	.sleb128 24
	.uleb128 0x9
	.4byte	.LASF85
	.sleb128 25
	.uleb128 0x9
	.4byte	.LASF86
	.sleb128 26
	.uleb128 0x9
	.4byte	.LASF87
	.sleb128 27
	.uleb128 0x9
	.4byte	.LASF88
	.sleb128 28
	.uleb128 0x9
	.4byte	.LASF89
	.sleb128 29
	.uleb128 0x9
	.4byte	.LASF90
	.sleb128 30
	.uleb128 0x9
	.4byte	.LASF91
	.sleb128 31
	.uleb128 0x9
	.4byte	.LASF92
	.sleb128 32
	.uleb128 0x9
	.4byte	.LASF93
	.sleb128 33
	.byte	0
	.uleb128 0xc
	.4byte	.LASF94
	.byte	0x4
	.byte	0xd
	.byte	0xb1
	.4byte	0x332
	.uleb128 0x9
	.4byte	.LASF95
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF96
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF97
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF98
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF99
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF100
	.sleb128 5
	.byte	0
	.uleb128 0xc
	.4byte	.LASF101
	.byte	0x4
	.byte	0xd
	.byte	0xf3
	.4byte	0x357
	.uleb128 0x9
	.4byte	.LASF102
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF103
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF104
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF105
	.sleb128 3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF106
	.uleb128 0x6
	.4byte	.LASF107
	.uleb128 0x6
	.4byte	.LASF108
	.uleb128 0xc
	.4byte	.LASF109
	.byte	0x4
	.byte	0xe
	.byte	0x97
	.4byte	0x391
	.uleb128 0x9
	.4byte	.LASF110
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF111
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF112
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF113
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF114
	.sleb128 4
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x397
	.uleb128 0xf
	.4byte	0xc3
	.uleb128 0x10
	.4byte	.LASF115
	.byte	0xf
	.2byte	0x188
	.4byte	0x5b
	.uleb128 0x10
	.4byte	.LASF116
	.byte	0xf
	.2byte	0x18e
	.4byte	0x49
	.uleb128 0xc
	.4byte	.LASF117
	.byte	0x4
	.byte	0x10
	.byte	0xc6
	.4byte	0x42a
	.uleb128 0x9
	.4byte	.LASF118
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF119
	.sleb128 1441792
	.uleb128 0x9
	.4byte	.LASF120
	.sleb128 1445888
	.uleb128 0x9
	.4byte	.LASF121
	.sleb128 1458176
	.uleb128 0x9
	.4byte	.LASF122
	.sleb128 1462272
	.uleb128 0x9
	.4byte	.LASF123
	.sleb128 1466624
	.uleb128 0x9
	.4byte	.LASF124
	.sleb128 1466880
	.uleb128 0x9
	.4byte	.LASF125
	.sleb128 1467392
	.uleb128 0x9
	.4byte	.LASF126
	.sleb128 1474560
	.uleb128 0x9
	.4byte	.LASF127
	.sleb128 1478656
	.uleb128 0x9
	.4byte	.LASF128
	.sleb128 1480704
	.uleb128 0x9
	.4byte	.LASF129
	.sleb128 1482752
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x11
	.byte	0x20
	.4byte	0x4b7
	.uleb128 0x9
	.4byte	.LASF130
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF131
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF132
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF133
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF134
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF135
	.sleb128 5
	.uleb128 0x9
	.4byte	.LASF136
	.sleb128 6
	.uleb128 0x9
	.4byte	.LASF137
	.sleb128 7
	.uleb128 0x9
	.4byte	.LASF138
	.sleb128 8
	.uleb128 0x9
	.4byte	.LASF139
	.sleb128 9
	.uleb128 0x9
	.4byte	.LASF140
	.sleb128 10
	.uleb128 0x9
	.4byte	.LASF141
	.sleb128 11
	.uleb128 0x9
	.4byte	.LASF142
	.sleb128 12
	.uleb128 0x9
	.4byte	.LASF143
	.sleb128 13
	.uleb128 0x9
	.4byte	.LASF144
	.sleb128 14
	.uleb128 0x9
	.4byte	.LASF145
	.sleb128 15
	.uleb128 0x9
	.4byte	.LASF146
	.sleb128 16
	.uleb128 0x9
	.4byte	.LASF147
	.sleb128 17
	.uleb128 0x9
	.4byte	.LASF148
	.sleb128 18
	.uleb128 0x9
	.4byte	.LASF149
	.sleb128 19
	.uleb128 0x9
	.4byte	.LASF150
	.sleb128 20
	.uleb128 0x9
	.4byte	.LASF151
	.sleb128 21
	.byte	0
	.uleb128 0x11
	.4byte	.LASF153
	.byte	0x2
	.byte	0x58
	.4byte	0x70
	.byte	0x3
	.4byte	0x4de
	.uleb128 0x12
	.4byte	.LASF152
	.byte	0x2
	.byte	0x58
	.4byte	0x4de
	.uleb128 0x13
	.string	"val"
	.byte	0x2
	.byte	0x5a
	.4byte	0x70
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x4e4
	.uleb128 0xf
	.4byte	0x4e9
	.uleb128 0x14
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x2
	.byte	0x35
	.byte	0x3
	.4byte	0x50d
	.uleb128 0x16
	.string	"val"
	.byte	0x2
	.byte	0x35
	.4byte	0x70
	.uleb128 0x12
	.4byte	.LASF152
	.byte	0x2
	.byte	0x35
	.4byte	0x50d
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x4e9
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x3
	.2byte	0x246
	.4byte	0x70
	.byte	0x3
	.4byte	0x54d
	.uleb128 0x18
	.4byte	.LASF152
	.byte	0x3
	.2byte	0x246
	.4byte	0x4de
	.uleb128 0x19
	.uleb128 0x1a
	.string	"__v"
	.byte	0x3
	.2byte	0x248
	.4byte	0x70
	.uleb128 0x19
	.uleb128 0x1a
	.string	"__r"
	.byte	0x3
	.2byte	0x248
	.4byte	0x70
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF156
	.byte	0x3
	.2byte	0x25e
	.byte	0x3
	.4byte	0x573
	.uleb128 0x18
	.4byte	.LASF157
	.byte	0x3
	.2byte	0x25e
	.4byte	0x70
	.uleb128 0x18
	.4byte	.LASF152
	.byte	0x3
	.2byte	0x25e
	.4byte	0x50d
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF218
	.byte	0x1
	.byte	0x56
	.8byte	.LFB1453
	.8byte	.LFE1453-.LFB1453
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e9
	.uleb128 0x1d
	.4byte	.LASF158
	.byte	0x1
	.byte	0x56
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x1d
	.4byte	.LASF159
	.byte	0x1
	.byte	0x56
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x1d
	.4byte	.LASF160
	.byte	0x1
	.byte	0x56
	.4byte	0xcf
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB215
	.8byte	.LBE215-.LBB215
	.byte	0x1
	.byte	0x5a
	.4byte	0x63b
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB216
	.8byte	.LBE216-.LBB216
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB217
	.8byte	.LBE217-.LBB217
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB218
	.8byte	.LBE218-.LBB218
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB219
	.8byte	.LBE219-.LBB219
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.8byte	.LBB220
	.8byte	.LBE220-.LBB220
	.4byte	0x6a3
	.uleb128 0x24
	.4byte	.LASF166
	.byte	0x1
	.byte	0x5f
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x25
	.4byte	0x54d
	.8byte	.LBB221
	.8byte	.LBE221-.LBB221
	.byte	0x1
	.byte	0x63
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB223
	.8byte	.LBE223-.LBB223
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	0x54d
	.8byte	.LBB225
	.8byte	.LBE225-.LBB225
	.byte	0x1
	.byte	0x7c
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB227
	.8byte	.LBE227-.LBB227
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.4byte	.LASF163
	.byte	0x1
	.byte	0x82
	.4byte	0x3a8
	.8byte	.LFB1454
	.8byte	.LFE1454-.LFB1454
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb5e
	.uleb128 0x1d
	.4byte	.LASF158
	.byte	0x1
	.byte	0x82
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1d
	.4byte	.LASF159
	.byte	0x1
	.byte	0x82
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1d
	.4byte	.LASF160
	.byte	0x1
	.byte	0x82
	.4byte	0xcf
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB229
	.8byte	.LBE229-.LBB229
	.byte	0x1
	.byte	0x89
	.4byte	0x7b5
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB230
	.8byte	.LBE230-.LBB230
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB231
	.8byte	.LBE231-.LBB231
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB232
	.8byte	.LBE232-.LBB232
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB233
	.8byte	.LBE233-.LBB233
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x54d
	.8byte	.LBB234
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x89
	.4byte	0x7fa
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB236
	.8byte	.LBE236-.LBB236
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB240
	.8byte	.LBE240-.LBB240
	.byte	0x1
	.byte	0x8a
	.4byte	0x87e
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB241
	.8byte	.LBE241-.LBB241
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB242
	.8byte	.LBE242-.LBB242
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB243
	.8byte	.LBE243-.LBB243
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB244
	.8byte	.LBE244-.LBB244
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x54d
	.8byte	.LBB245
	.8byte	.LBE245-.LBB245
	.byte	0x1
	.byte	0x8e
	.4byte	0x8c7
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB247
	.8byte	.LBE247-.LBB247
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB249
	.8byte	.LBE249-.LBB249
	.byte	0x1
	.byte	0x90
	.4byte	0x94b
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB250
	.8byte	.LBE250-.LBB250
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB251
	.8byte	.LBE251-.LBB251
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB252
	.8byte	.LBE252-.LBB252
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB253
	.8byte	.LBE253-.LBB253
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB254
	.8byte	.LBE254-.LBB254
	.byte	0x1
	.byte	0x92
	.4byte	0x9cf
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB255
	.8byte	.LBE255-.LBB255
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB256
	.8byte	.LBE256-.LBB256
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB257
	.8byte	.LBE257-.LBB257
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB258
	.8byte	.LBE258-.LBB258
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB259
	.8byte	.LBE259-.LBB259
	.byte	0x1
	.byte	0x97
	.4byte	0xa53
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB260
	.8byte	.LBE260-.LBB260
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB261
	.8byte	.LBE261-.LBB261
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB262
	.8byte	.LBE262-.LBB262
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB263
	.8byte	.LBE263-.LBB263
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x54d
	.8byte	.LBB264
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x97
	.4byte	0xa98
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB266
	.8byte	.LBE266-.LBB266
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB270
	.8byte	.LBE270-.LBB270
	.byte	0x1
	.byte	0xa1
	.4byte	0xb1c
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB271
	.8byte	.LBE271-.LBB271
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB272
	.8byte	.LBE272-.LBB272
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB273
	.8byte	.LBE273-.LBB273
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB274
	.8byte	.LBE274-.LBB274
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	0x54d
	.8byte	.LBB275
	.4byte	.Ldebug_ranges0+0x60
	.byte	0x1
	.byte	0xa1
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB277
	.8byte	.LBE277-.LBB277
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	.LASF161
	.byte	0x1
	.byte	0xab
	.4byte	0x5b
	.8byte	.LFB1455
	.8byte	.LFE1455-.LFB1455
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x29
	.4byte	.LASF162
	.byte	0x1
	.byte	0xb0
	.4byte	0x5b
	.8byte	.LFB1456
	.8byte	.LFE1456-.LFB1456
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x26
	.4byte	.LASF164
	.byte	0x1
	.byte	0xb5
	.4byte	0x3a8
	.8byte	.LFB1457
	.8byte	.LFE1457-.LFB1457
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xec0
	.uleb128 0x1d
	.4byte	.LASF158
	.byte	0x1
	.byte	0xb5
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x1d
	.4byte	.LASF159
	.byte	0x1
	.byte	0xb5
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x1d
	.4byte	.LASF160
	.byte	0x1
	.byte	0xb5
	.4byte	0xcf
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB281
	.8byte	.LBE281-.LBB281
	.byte	0x1
	.byte	0xc4
	.4byte	0xc64
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB282
	.8byte	.LBE282-.LBB282
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB283
	.8byte	.LBE283-.LBB283
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB284
	.8byte	.LBE284-.LBB284
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB285
	.8byte	.LBE285-.LBB285
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.4byte	0x54d
	.8byte	.LBB286
	.4byte	.Ldebug_ranges0+0x90
	.byte	0x1
	.byte	0xc4
	.4byte	0xca9
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB288
	.8byte	.LBE288-.LBB288
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB292
	.8byte	.LBE292-.LBB292
	.byte	0x1
	.byte	0xc5
	.4byte	0xd2d
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB293
	.8byte	.LBE293-.LBB293
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB294
	.8byte	.LBE294-.LBB294
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB295
	.8byte	.LBE295-.LBB295
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB296
	.8byte	.LBE296-.LBB296
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x54d
	.8byte	.LBB297
	.8byte	.LBE297-.LBB297
	.byte	0x1
	.byte	0xcb
	.4byte	0xd76
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB299
	.8byte	.LBE299-.LBB299
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB301
	.8byte	.LBE301-.LBB301
	.byte	0x1
	.byte	0xcc
	.4byte	0xdfa
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB302
	.8byte	.LBE302-.LBB302
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB303
	.8byte	.LBE303-.LBB303
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB304
	.8byte	.LBE304-.LBB304
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB305
	.8byte	.LBE305-.LBB305
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x513
	.8byte	.LBB306
	.8byte	.LBE306-.LBB306
	.byte	0x1
	.byte	0xd1
	.4byte	0xe7e
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB307
	.8byte	.LBE307-.LBB307
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB308
	.8byte	.LBE308-.LBB308
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB309
	.8byte	.LBE309-.LBB309
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB310
	.8byte	.LBE310-.LBB310
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	0x54d
	.8byte	.LBB311
	.4byte	.Ldebug_ranges0+0xc0
	.byte	0x1
	.byte	0xd1
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB313
	.8byte	.LBE313-.LBB313
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.4byte	.LASF165
	.byte	0x1
	.byte	0xde
	.4byte	0x3a8
	.8byte	.LFB1458
	.8byte	.LFE1458-.LFB1458
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1018
	.uleb128 0x1d
	.4byte	.LASF158
	.byte	0x1
	.byte	0xde
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1d
	.4byte	.LASF159
	.byte	0x1
	.byte	0xde
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1d
	.4byte	.LASF160
	.byte	0x1
	.byte	0xde
	.4byte	0xcf
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x24
	.4byte	.LASF167
	.byte	0x1
	.byte	0xe0
	.4byte	0x1018
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x13
	.string	"tmp"
	.byte	0x1
	.byte	0xe1
	.4byte	0x39c
	.uleb128 0x24
	.4byte	.LASF168
	.byte	0x1
	.byte	0xe4
	.4byte	0x101e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x2a
	.4byte	.LASF169
	.byte	0x1
	.byte	0xe5
	.4byte	0x39c
	.uleb128 0x2a
	.4byte	.LASF170
	.byte	0x1
	.byte	0xe6
	.4byte	0x39c
	.uleb128 0x2a
	.4byte	.LASF171
	.byte	0x1
	.byte	0xe7
	.4byte	0x39c
	.uleb128 0x2a
	.4byte	.LASF172
	.byte	0x1
	.byte	0xe8
	.4byte	0x39c
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0xeb
	.4byte	0x49
	.uleb128 0x2b
	.4byte	.LASF219
	.byte	0x1
	.2byte	0x13a
	.8byte	.L32
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB317
	.8byte	.LBE317-.LBB317
	.byte	0x1
	.2byte	0x101
	.4byte	0xff9
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB318
	.8byte	.LBE318-.LBB318
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB319
	.8byte	.LBE319-.LBB319
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB320
	.8byte	.LBE320-.LBB320
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB321
	.8byte	.LBE321-.LBB321
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.8byte	.LBB322
	.8byte	.LBE322-.LBB322
	.uleb128 0x1a
	.string	"idx"
	.byte	0x1
	.2byte	0x12e
	.4byte	0x3a8
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x39c
	.uleb128 0x2d
	.4byte	0x39c
	.4byte	0x1034
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0x1
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0xa
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF173
	.byte	0x1
	.2byte	0x186
	.4byte	0x3a8
	.8byte	.LFB1459
	.8byte	.LFE1459-.LFB1459
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1357
	.uleb128 0x30
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x186
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x67
	.uleb128 0x30
	.4byte	.LASF159
	.byte	0x1
	.2byte	0x186
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x30
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x186
	.4byte	0xcf
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x31
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x188
	.4byte	0x1018
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x1a
	.string	"tmp"
	.byte	0x1
	.2byte	0x189
	.4byte	0x39c
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB323
	.8byte	.LBE323-.LBB323
	.byte	0x1
	.2byte	0x19b
	.4byte	0x111f
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB324
	.8byte	.LBE324-.LBB324
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB325
	.8byte	.LBE325-.LBB325
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB326
	.8byte	.LBE326-.LBB326
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB327
	.8byte	.LBE327-.LBB327
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x32
	.4byte	0x54d
	.8byte	.LBB328
	.4byte	.Ldebug_ranges0+0xf0
	.byte	0x1
	.2byte	0x19b
	.4byte	0x1165
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB330
	.8byte	.LBE330-.LBB330
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x23
	.8byte	.LBB334
	.8byte	.LBE334-.LBB334
	.4byte	0x128f
	.uleb128 0x31
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x1a3
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB335
	.8byte	.LBE335-.LBB335
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x120d
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB336
	.8byte	.LBE336-.LBB336
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB337
	.8byte	.LBE337-.LBB337
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB338
	.8byte	.LBE338-.LBB338
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB339
	.8byte	.LBE339-.LBB339
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	0x513
	.8byte	.LBB340
	.8byte	.LBE340-.LBB340
	.byte	0x1
	.2byte	0x1ac
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB341
	.8byte	.LBE341-.LBB341
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB342
	.8byte	.LBE342-.LBB342
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB343
	.8byte	.LBE343-.LBB343
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB344
	.8byte	.LBE344-.LBB344
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB345
	.8byte	.LBE345-.LBB345
	.byte	0x1
	.2byte	0x1d0
	.4byte	0x1314
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB346
	.8byte	.LBE346-.LBB346
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB347
	.8byte	.LBE347-.LBB347
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB348
	.8byte	.LBE348-.LBB348
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB349
	.8byte	.LBE349-.LBB349
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x33
	.4byte	0x54d
	.8byte	.LBB350
	.4byte	.Ldebug_ranges0+0x120
	.byte	0x1
	.2byte	0x1d0
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB352
	.8byte	.LBE352-.LBB352
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x1dd
	.4byte	0x3a8
	.8byte	.LFB1460
	.8byte	.LFE1460-.LFB1460
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1629
	.uleb128 0x30
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x1dd
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x66
	.uleb128 0x30
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x1dd
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x30
	.4byte	.LASF176
	.byte	0x1
	.2byte	0x1dd
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x68
	.uleb128 0x34
	.4byte	.LASF159
	.byte	0x1
	.2byte	0x1df
	.4byte	0x39c
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB356
	.8byte	.LBE356-.LBB356
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x1434
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB357
	.8byte	.LBE357-.LBB357
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB358
	.8byte	.LBE358-.LBB358
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB359
	.8byte	.LBE359-.LBB359
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB360
	.8byte	.LBE360-.LBB360
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.8byte	.LBB361
	.8byte	.LBE361-.LBB361
	.4byte	0x1496
	.uleb128 0x31
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x1e5
	.4byte	0x39c
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x33
	.4byte	0x54d
	.8byte	.LBB362
	.4byte	.Ldebug_ranges0+0x150
	.byte	0x1
	.2byte	0x1e9
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x33
	.4byte	0x4ea
	.8byte	.LBB364
	.4byte	.Ldebug_ranges0+0x180
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x32
	.4byte	0x54d
	.8byte	.LBB370
	.4byte	.Ldebug_ranges0+0x1b0
	.byte	0x1
	.2byte	0x208
	.4byte	0x14d8
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x33
	.4byte	0x4ea
	.8byte	.LBB372
	.4byte	.Ldebug_ranges0+0x1e0
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	0x54d
	.8byte	.LBB377
	.8byte	.LBE377-.LBB377
	.byte	0x1
	.2byte	0x203
	.4byte	0x1522
	.uleb128 0x1f
	.4byte	0x566
	.uleb128 0x1f
	.4byte	0x55a
	.uleb128 0x22
	.4byte	0x4ea
	.8byte	.LBB379
	.8byte	.LBE379-.LBB379
	.byte	0x3
	.2byte	0x260
	.uleb128 0x1f
	.4byte	0x501
	.uleb128 0x1f
	.4byte	0x4f6
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB382
	.8byte	.LBE382-.LBB382
	.byte	0x1
	.2byte	0x20a
	.4byte	0x15a7
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB383
	.8byte	.LBE383-.LBB383
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB384
	.8byte	.LBE384-.LBB384
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB385
	.8byte	.LBE385-.LBB385
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB386
	.8byte	.LBE386-.LBB386
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	0x513
	.8byte	.LBB387
	.8byte	.LBE387-.LBB387
	.byte	0x1
	.2byte	0x20c
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB388
	.8byte	.LBE388-.LBB388
	.uleb128 0x21
	.4byte	0x531
	.uleb128 0x20
	.8byte	.LBB389
	.8byte	.LBE389-.LBB389
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB390
	.8byte	.LBE390-.LBB390
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB391
	.8byte	.LBE391-.LBB391
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x35
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x219
	.8byte	.LFB1461
	.8byte	.LFE1461-.LFB1461
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1801
	.uleb128 0x34
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x21b
	.4byte	0x5b
	.uleb128 0x31
	.4byte	.LASF178
	.byte	0x1
	.2byte	0x21c
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x31
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x21d
	.4byte	0x5b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB392
	.8byte	.LBE392-.LBB392
	.byte	0x1
	.2byte	0x21b
	.4byte	0x16f6
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB393
	.8byte	.LBE393-.LBB393
	.uleb128 0x36
	.4byte	0x531
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x20
	.8byte	.LBB394
	.8byte	.LBE394-.LBB394
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB395
	.8byte	.LBE395-.LBB395
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB396
	.8byte	.LBE396-.LBB396
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	0x513
	.8byte	.LBB397
	.8byte	.LBE397-.LBB397
	.byte	0x1
	.2byte	0x21c
	.4byte	0x177d
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB398
	.8byte	.LBE398-.LBB398
	.uleb128 0x36
	.4byte	0x531
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x20
	.8byte	.LBB399
	.8byte	.LBE399-.LBB399
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB400
	.8byte	.LBE400-.LBB400
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB401
	.8byte	.LBE401-.LBB401
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	0x513
	.8byte	.LBB402
	.8byte	.LBE402-.LBB402
	.byte	0x1
	.2byte	0x21d
	.uleb128 0x1f
	.4byte	0x524
	.uleb128 0x20
	.8byte	.LBB403
	.8byte	.LBE403-.LBB403
	.uleb128 0x36
	.4byte	0x531
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x20
	.8byte	.LBB404
	.8byte	.LBE404-.LBB404
	.uleb128 0x21
	.4byte	0x53e
	.uleb128 0x22
	.4byte	0x4b7
	.8byte	.LBB405
	.8byte	.LBE405-.LBB405
	.byte	0x3
	.2byte	0x248
	.uleb128 0x1f
	.4byte	0x4c7
	.uleb128 0x20
	.8byte	.LBB406
	.8byte	.LBE406-.LBB406
	.uleb128 0x21
	.4byte	0x4d2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF180
	.uleb128 0x6
	.4byte	.LASF181
	.uleb128 0x2d
	.4byte	0x39c
	.4byte	0x181b
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0x15
	.byte	0
	.uleb128 0x24
	.4byte	.LASF182
	.byte	0x1
	.byte	0x31
	.4byte	0x1830
	.uleb128 0x9
	.byte	0x3
	.8byte	_rtl8651_asicTableSize
	.uleb128 0xf
	.4byte	0x180b
	.uleb128 0x24
	.4byte	.LASF183
	.byte	0x1
	.byte	0xa7
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	mcastForceAddOpCnt
	.uleb128 0x24
	.4byte	.LASF184
	.byte	0x1
	.byte	0xa9
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	mcastForceAddOpCnt6
	.uleb128 0x31
	.4byte	.LASF185
	.byte	0x1
	.2byte	0x215
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	rtl819x_lastTxDesc
	.uleb128 0x31
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x216
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	rtl819x_lastRxDesc
	.uleb128 0x31
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x217
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	rtl819x_swHangCnt
	.uleb128 0x31
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x218
	.4byte	0x5b
	.uleb128 0x9
	.byte	0x3
	.8byte	rtl819x_checkSwCoreTimer
	.uleb128 0x37
	.4byte	.LASF189
	.byte	0x12
	.byte	0x28
	.4byte	0x98
	.uleb128 0x2d
	.4byte	0x49
	.4byte	0x18cd
	.uleb128 0x38
	.byte	0
	.uleb128 0x37
	.4byte	.LASF190
	.byte	0x13
	.byte	0x2e
	.4byte	0x18c2
	.uleb128 0x39
	.4byte	.LASF191
	.byte	0x14
	.2byte	0x1b7
	.4byte	0x49
	.uleb128 0x2d
	.4byte	0x9f
	.4byte	0x18ef
	.uleb128 0x38
	.byte	0
	.uleb128 0x39
	.4byte	.LASF192
	.byte	0x14
	.2byte	0x1ef
	.4byte	0x18fb
	.uleb128 0xf
	.4byte	0x18e4
	.uleb128 0x39
	.4byte	.LASF193
	.byte	0x14
	.2byte	0x1fa
	.4byte	0x190c
	.uleb128 0xf
	.4byte	0x18e4
	.uleb128 0x3a
	.4byte	.LASF194
	.byte	0x15
	.byte	0x45
	.4byte	0x98
	.uleb128 0x1
	.byte	0x6f
	.uleb128 0x37
	.4byte	.LASF195
	.byte	0x16
	.byte	0x3f
	.4byte	0x98
	.uleb128 0x2d
	.4byte	0x98
	.4byte	0x1939
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0
	.byte	0
	.uleb128 0x37
	.4byte	.LASF196
	.byte	0x17
	.byte	0x63
	.4byte	0x1929
	.uleb128 0x37
	.4byte	.LASF197
	.byte	0x18
	.byte	0x4e
	.4byte	0x194f
	.uleb128 0x3b
	.4byte	0x98
	.uleb128 0x37
	.4byte	.LASF198
	.byte	0x19
	.byte	0x25
	.4byte	0x49
	.uleb128 0x37
	.4byte	.LASF199
	.byte	0x19
	.byte	0x59
	.4byte	0x196a
	.uleb128 0xf
	.4byte	0x391
	.uleb128 0x2d
	.4byte	0x98
	.4byte	0x1985
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0x40
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0
	.byte	0
	.uleb128 0x39
	.4byte	.LASF200
	.byte	0x19
	.2byte	0x2f2
	.4byte	0x1991
	.uleb128 0xf
	.4byte	0x196f
	.uleb128 0x37
	.4byte	.LASF201
	.byte	0x1a
	.byte	0x8a
	.4byte	0x7b
	.uleb128 0x37
	.4byte	.LASF202
	.byte	0x1a
	.byte	0x92
	.4byte	0x86
	.uleb128 0x37
	.4byte	.LASF38
	.byte	0x1b
	.byte	0x4f
	.4byte	0x195
	.uleb128 0x37
	.4byte	.LASF203
	.byte	0x1c
	.byte	0x22
	.4byte	0x49
	.uleb128 0x37
	.4byte	.LASF204
	.byte	0x1c
	.byte	0x23
	.4byte	0x49
	.uleb128 0x39
	.4byte	.LASF205
	.byte	0x1d
	.2byte	0x978
	.4byte	0x1801
	.uleb128 0x37
	.4byte	.LASF206
	.byte	0xd
	.byte	0x4e
	.4byte	0x49
	.uleb128 0x39
	.4byte	.LASF207
	.byte	0x1e
	.2byte	0x160
	.4byte	0x19f0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x1806
	.uleb128 0x39
	.4byte	.LASF208
	.byte	0xd
	.2byte	0x354
	.4byte	0x357
	.uleb128 0x2d
	.4byte	0x1a12
	.4byte	0x1a12
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0x3f
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.4byte	0x35c
	.uleb128 0x39
	.4byte	.LASF107
	.byte	0xd
	.2byte	0x42f
	.4byte	0x1a02
	.uleb128 0x2d
	.4byte	0x361
	.4byte	0x1a34
	.uleb128 0x2e
	.4byte	0xc8
	.byte	0x3
	.byte	0
	.uleb128 0x37
	.4byte	.LASF108
	.byte	0x1f
	.byte	0xe
	.4byte	0x1a24
	.uleb128 0x37
	.4byte	.LASF209
	.byte	0x20
	.byte	0x1c
	.4byte	0x49
	.uleb128 0x39
	.4byte	.LASF210
	.byte	0xe
	.2byte	0x132
	.4byte	0x5b
	.uleb128 0x39
	.4byte	.LASF211
	.byte	0x1d
	.2byte	0x7e5
	.4byte	0x1a62
	.uleb128 0xe
	.byte	0x8
	.4byte	0x1bf
	.uleb128 0x39
	.4byte	.LASF212
	.byte	0x21
	.2byte	0x262
	.4byte	0x98
	.uleb128 0x37
	.4byte	.LASF213
	.byte	0x10
	.byte	0xd5
	.4byte	0xcf
	.uleb128 0x37
	.4byte	.LASF214
	.byte	0x10
	.byte	0xd6
	.4byte	0x5b
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x4
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x35
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.byte	0
	.byte	0
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x38
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3a
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
	.uleb128 0x3b
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.8byte	.LBB234-.Ltext0
	.8byte	.LBE234-.Ltext0
	.8byte	.LBB239-.Ltext0
	.8byte	.LBE239-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB264-.Ltext0
	.8byte	.LBE264-.Ltext0
	.8byte	.LBB269-.Ltext0
	.8byte	.LBE269-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB275-.Ltext0
	.8byte	.LBE275-.Ltext0
	.8byte	.LBB280-.Ltext0
	.8byte	.LBE280-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB286-.Ltext0
	.8byte	.LBE286-.Ltext0
	.8byte	.LBB291-.Ltext0
	.8byte	.LBE291-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB311-.Ltext0
	.8byte	.LBE311-.Ltext0
	.8byte	.LBB316-.Ltext0
	.8byte	.LBE316-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB328-.Ltext0
	.8byte	.LBE328-.Ltext0
	.8byte	.LBB333-.Ltext0
	.8byte	.LBE333-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB350-.Ltext0
	.8byte	.LBE350-.Ltext0
	.8byte	.LBB355-.Ltext0
	.8byte	.LBE355-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB362-.Ltext0
	.8byte	.LBE362-.Ltext0
	.8byte	.LBB369-.Ltext0
	.8byte	.LBE369-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB364-.Ltext0
	.8byte	.LBE364-.Ltext0
	.8byte	.LBB367-.Ltext0
	.8byte	.LBE367-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB370-.Ltext0
	.8byte	.LBE370-.Ltext0
	.8byte	.LBB381-.Ltext0
	.8byte	.LBE381-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB372-.Ltext0
	.8byte	.LBE372-.Ltext0
	.8byte	.LBB375-.Ltext0
	.8byte	.LBE375-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF78:
	.string	"NR_BOUNCE"
.LASF59:
	.string	"NR_FREE_PAGES"
.LASF63:
	.string	"NR_ACTIVE_ANON"
.LASF150:
	.string	"TYPE_ARP_V6_TABLE"
.LASF220:
	.string	"rtl819x_poll_sw"
.LASF13:
	.string	"uintptr_t"
.LASF160:
	.string	"entryContent_P"
.LASF177:
	.string	"port6Queue0Cgst"
.LASF197:
	.string	"jiffies"
.LASF168:
	.string	"entryContent"
.LASF64:
	.string	"NR_INACTIVE_FILE"
.LASF136:
	.string	"TYPE_VLAN_TABLE"
.LASF181:
	.string	"workqueue_struct"
.LASF33:
	.string	"MM_FILEPAGES"
.LASF90:
	.string	"WORKINGSET_NODERECLAIM"
.LASF8:
	.string	"long int"
.LASF193:
	.string	"hex_asc_upper"
.LASF70:
	.string	"NR_FILE_PAGES"
.LASF133:
	.string	"TYPE_MULTICAST_TABLE"
.LASF6:
	.string	"long long unsigned int"
.LASF156:
	.string	"iowrite32"
.LASF137:
	.string	"TYPE_VLAN1_TABLE"
.LASF152:
	.string	"addr"
.LASF84:
	.string	"NR_SHMEM"
.LASF11:
	.string	"__le32"
.LASF147:
	.string	"TYPE_6RD_TABLE"
.LASF145:
	.string	"TYPE_ALG_TABLE"
.LASF119:
	.string	"HWNAT_CPUIR_OFFSET"
.LASF55:
	.string	"MIGRATE_CMA"
.LASF132:
	.string	"TYPE_L3_ROUTING_TABLE"
.LASF18:
	.string	"N_HIGH_MEMORY"
.LASF0:
	.string	"signed char"
.LASF15:
	.string	"N_POSSIBLE"
.LASF98:
	.string	"LRU_ACTIVE_FILE"
.LASF85:
	.string	"NR_DIRTIED"
.LASF115:
	.string	"uint32"
.LASF37:
	.string	"cpumask"
.LASF43:
	.string	"PIDTYPE_SID"
.LASF213:
	.string	"rtl_hwnat_mmio"
.LASF178:
	.string	"curRing0RxDesc"
.LASF105:
	.string	"NR_WMARK"
.LASF143:
	.string	"TYPE_NEXT_HOP_TABLE"
.LASF202:
	.string	"kimage_voffset"
.LASF75:
	.string	"NR_PAGETABLE"
.LASF120:
	.string	"HWNAT_MIB_OFFSET"
.LASF186:
	.string	"rtl819x_lastRxDesc"
.LASF96:
	.string	"LRU_ACTIVE_ANON"
.LASF92:
	.string	"NR_FREE_CMA_PAGES"
.LASF76:
	.string	"NR_KERNEL_STACK"
.LASF65:
	.string	"NR_ACTIVE_FILE"
.LASF131:
	.string	"TYPE_ARP_TABLE"
.LASF101:
	.string	"zone_watermarks"
.LASF44:
	.string	"PIDTYPE_MAX"
.LASF38:
	.string	"secondary_data"
.LASF100:
	.string	"NR_LRU_LISTS"
.LASF66:
	.string	"NR_UNEVICTABLE"
.LASF67:
	.string	"NR_MLOCK"
.LASF144:
	.string	"TYPE_RATE_LIMIT_TABLE"
.LASF176:
	.string	"endEidx"
.LASF49:
	.string	"PCPU_FC_NR"
.LASF30:
	.string	"WHOLE_SECONDS"
.LASF198:
	.string	"nr_cpu_ids"
.LASF24:
	.string	"FDPIC_FUNCPTRS"
.LASF109:
	.string	"hrtimer_base_type"
.LASF56:
	.string	"MIGRATE_ISOLATE"
.LASF121:
	.string	"HWNAT_GPCR_OFFSET"
.LASF139:
	.string	"TYPE_L4_TCP_UDP_TABLE"
.LASF27:
	.string	"READ_IMPLIES_EXEC"
.LASF164:
	.string	"_rtl8651_forceAddAsicEntry"
.LASF5:
	.string	"long long int"
.LASF157:
	.string	"value"
.LASF46:
	.string	"PCPU_FC_AUTO"
.LASF52:
	.string	"MIGRATE_RECLAIMABLE"
.LASF174:
	.string	"_rtl8651_delAsicEntry"
.LASF4:
	.string	"unsigned int"
.LASF170:
	.string	"entryContent_new"
.LASF103:
	.string	"WMARK_LOW"
.LASF80:
	.string	"NR_VMSCAN_IMMEDIATE"
.LASF102:
	.string	"WMARK_MIN"
.LASF218:
	.string	"_rtl8651_asicTableAccessForward"
.LASF111:
	.string	"HRTIMER_BASE_REALTIME"
.LASF74:
	.string	"NR_SLAB_UNRECLAIMABLE"
.LASF141:
	.string	"TYPE_PPPOE_TABLE"
.LASF114:
	.string	"HRTIMER_MAX_CLOCK_BASES"
.LASF204:
	.string	"overflowgid"
.LASF163:
	.string	"_rtl8651_addAsicEntry"
.LASF62:
	.string	"NR_INACTIVE_ANON"
.LASF190:
	.string	"console_printk"
.LASF82:
	.string	"NR_ISOLATED_ANON"
.LASF194:
	.string	"current_stack_pointer"
.LASF3:
	.string	"short unsigned int"
.LASF113:
	.string	"HRTIMER_BASE_TAI"
.LASF196:
	.string	"cpu_hwcaps"
.LASF215:
	.ascii	"GNU C 4.9.4 -mlittle-endian -mgeneral-regs-only -mabi=lp64 -"
	.ascii	"g -O2 -O1 -std=gnu90 -fno-strict-aliasing -fno-common -fno-p"
	.ascii	"ic -fno-asynchronous-unwind-tab"
	.string	"les -fno-delete-null-pointer-checks -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -femit-struct-debug-baseonly -fno-var-tracking -fno-strict-overflow -fconserve-stack --param allow-store-data-races=0"
.LASF171:
	.string	"entryCompare_max_count"
.LASF169:
	.string	"entryContentIdx"
.LASF19:
	.string	"N_MEMORY"
.LASF165:
	.string	"_rtl8651_readAsicEntry"
.LASF183:
	.string	"mcastForceAddOpCnt"
.LASF127:
	.string	"HWNAT_NAT_WRP_OFFSET"
.LASF116:
	.string	"int32"
.LASF175:
	.string	"startEidx"
.LASF45:
	.string	"pcpu_fc"
.LASF50:
	.string	"MIGRATE_UNMOVABLE"
.LASF99:
	.string	"LRU_UNEVICTABLE"
.LASF94:
	.string	"lru_list"
.LASF151:
	.string	"TYPE_MULTICAST_V6_TABLE"
.LASF58:
	.string	"zone_stat_item"
.LASF201:
	.string	"memstart_addr"
.LASF154:
	.string	"ioread32"
.LASF28:
	.string	"ADDR_LIMIT_32BIT"
.LASF53:
	.string	"MIGRATE_PCPTYPES"
.LASF14:
	.string	"sizetype"
.LASF146:
	.string	"TYPE_DS_LITE_TABLE"
.LASF54:
	.string	"MIGRATE_HIGHATOMIC"
.LASF207:
	.string	"system_wq"
.LASF23:
	.string	"ADDR_NO_RANDOMIZE"
.LASF88:
	.string	"WORKINGSET_REFAULT"
.LASF206:
	.string	"page_group_by_mobility_disabled"
.LASF112:
	.string	"HRTIMER_BASE_BOOTTIME"
.LASF34:
	.string	"MM_ANONPAGES"
.LASF81:
	.string	"NR_WRITEBACK_TEMP"
.LASF72:
	.string	"NR_WRITEBACK"
.LASF48:
	.string	"PCPU_FC_PAGE"
.LASF107:
	.string	"mem_section"
.LASF191:
	.string	"panic_timeout"
.LASF87:
	.string	"NR_PAGES_SCANNED"
.LASF219:
	.string	"retry"
.LASF61:
	.string	"NR_LRU_BASE"
.LASF200:
	.string	"cpu_bit_bitmap"
.LASF184:
	.string	"mcastForceAddOpCnt6"
.LASF20:
	.string	"N_CPU"
.LASF153:
	.string	"__raw_readl"
.LASF69:
	.string	"NR_FILE_MAPPED"
.LASF162:
	.string	"_rtl8198C_getForceAddMcastv6OpCnt"
.LASF36:
	.string	"NR_MM_COUNTERS"
.LASF110:
	.string	"HRTIMER_BASE_MONOTONIC"
.LASF140:
	.string	"TYPE_L4_ICMP_TABLE"
.LASF182:
	.string	"_rtl8651_asicTableSize"
.LASF73:
	.string	"NR_SLAB_RECLAIMABLE"
.LASF86:
	.string	"NR_WRITTEN"
.LASF130:
	.string	"TYPE_L2_SWITCH_TABLE"
.LASF149:
	.string	"TYPE_NEXT_HOP_V6_TABLE"
.LASF42:
	.string	"PIDTYPE_PGID"
.LASF60:
	.string	"NR_ALLOC_BATCH"
.LASF173:
	.string	"_rtl8651_readAsicEntryStopTLU"
.LASF217:
	.string	"/home/ericwang/pj/qnap/nvr_0524/linux-4.4.18"
.LASF12:
	.string	"_Bool"
.LASF16:
	.string	"N_ONLINE"
.LASF1:
	.string	"unsigned char"
.LASF71:
	.string	"NR_FILE_DIRTY"
.LASF57:
	.string	"MIGRATE_TYPES"
.LASF35:
	.string	"MM_SWAPENTS"
.LASF108:
	.string	"cpu_topology"
.LASF2:
	.string	"short int"
.LASF126:
	.string	"HWNAT_SERDES_OFFSET"
.LASF26:
	.string	"ADDR_COMPAT_LAYOUT"
.LASF212:
	.string	"zero_pfn"
.LASF135:
	.string	"TYPE_EXT_INT_IP_TABLE"
.LASF25:
	.string	"MMAP_PAGE_ZERO"
.LASF158:
	.string	"tableType"
.LASF89:
	.string	"WORKINGSET_ACTIVATE"
.LASF188:
	.string	"rtl819x_checkSwCoreTimer"
.LASF40:
	.string	"pid_type"
.LASF155:
	.string	"__raw_writel"
.LASF209:
	.string	"percpu_counter_batch"
.LASF203:
	.string	"overflowuid"
.LASF41:
	.string	"PIDTYPE_PID"
.LASF93:
	.string	"NR_VM_ZONE_STAT_ITEMS"
.LASF22:
	.string	"UNAME26"
.LASF83:
	.string	"NR_ISOLATED_FILE"
.LASF167:
	.string	"entryAddr"
.LASF172:
	.string	"needRetry"
.LASF7:
	.string	"__u32"
.LASF185:
	.string	"rtl819x_lastTxDesc"
.LASF9:
	.string	"long unsigned int"
.LASF10:
	.string	"char"
.LASF159:
	.string	"eidx"
.LASF180:
	.string	"pid_namespace"
.LASF166:
	.string	"index"
.LASF142:
	.string	"TYPE_ACL_RULE_TABLE"
.LASF91:
	.string	"NR_ANON_TRANSPARENT_HUGEPAGES"
.LASF77:
	.string	"NR_UNSTABLE_NFS"
.LASF129:
	.string	"HWNAT_SERDES_ANA_OFFSET"
.LASF210:
	.string	"hrtimer_resolution"
.LASF124:
	.string	"HWNAT_DDR2_OFFSET"
.LASF134:
	.string	"TYPE_NETINTERFACE_TABLE"
.LASF118:
	.string	"HWNAT_SWTBL_OFFSET"
.LASF104:
	.string	"WMARK_HIGH"
.LASF68:
	.string	"NR_ANON_PAGES"
.LASF17:
	.string	"N_NORMAL_MEMORY"
.LASF199:
	.string	"cpu_online_mask"
.LASF216:
	.string	"drivers/soc/realtek/rtd129x/hw_nat/rtl865x/../AsicDriver/rtl865x_asicBasic.c"
.LASF214:
	.string	"rtl_hwnat_base"
.LASF138:
	.string	"TYPE_SERVER_PORT_TABLE"
.LASF21:
	.string	"NR_NODE_STATES"
.LASF195:
	.string	"elf_hwcap"
.LASF179:
	.string	"curRing0TxDesc"
.LASF117:
	.string	"rtl_hwnat_mmio_offset"
.LASF31:
	.string	"STICKY_TIMEOUTS"
.LASF189:
	.string	"__icache_flags"
.LASF122:
	.string	"HWNAT_EXT_MACCR_OFFSET"
.LASF192:
	.string	"hex_asc"
.LASF123:
	.string	"HWNAT_DDR1_OFFSET"
.LASF97:
	.string	"LRU_INACTIVE_FILE"
.LASF47:
	.string	"PCPU_FC_EMBED"
.LASF51:
	.string	"MIGRATE_MOVABLE"
.LASF39:
	.string	"node_states"
.LASF211:
	.string	"cad_pid"
.LASF79:
	.string	"NR_VMSCAN_WRITE"
.LASF125:
	.string	"HWNAT_GMII_TM_OFFSET"
.LASF128:
	.string	"HWNAT_SERDES_WRP_OFFSET"
.LASF106:
	.string	"pglist_data"
.LASF208:
	.string	"contig_page_data"
.LASF32:
	.string	"ADDR_LIMIT_3GB"
.LASF187:
	.string	"rtl819x_swHangCnt"
.LASF205:
	.string	"init_pid_ns"
.LASF148:
	.string	"TYPE_L3_V6_ROUTING_TABLE"
.LASF29:
	.string	"SHORT_INODE"
.LASF95:
	.string	"LRU_INACTIVE_ANON"
.LASF161:
	.string	"_rtl865x_getForceAddMcastOpCnt"
	.ident	"GCC: (OpenWrt/Linaro GCC 4.9-2015.06 r46836) 4.9.4"
	.section	.note.GNU-stack,"",%progbits
