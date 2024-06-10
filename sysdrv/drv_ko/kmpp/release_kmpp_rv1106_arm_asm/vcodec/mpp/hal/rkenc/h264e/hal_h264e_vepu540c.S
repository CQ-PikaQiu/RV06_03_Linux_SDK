	.arch armv7-a
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 2
	.file	"hal_h264e_vepu540c.c"
	.text
	.syntax unified
	.syntax unified
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_ret_task, %function
hal_h264e_vepu540c_ret_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r3, [r0, #160]
	mov	r10, r1
	ldr	r7, [r0, #308]
	mov	r5, r0
	ldr	r8, [r1, #4]
	ldrd	r2, r3, [r3, #60]
	mul	r9, r3, r2
	add	r3, r7, #5600
	adds	r3, r3, #8
	ldrh	r2, [r3, #192]
	ldrh	r1, [r3, #194]
	str	r2, [sp, #24]
	ldrh	r2, [r3, #200]
	str	r2, [sp, #28]
	ldrh	r2, [r3, #208]
	str	r2, [sp, #32]
	ldrh	r2, [r3, #216]
	str	r2, [sp, #36]
	ldrh	r2, [r3, #202]
	add	r1, r1, r2
	ldrh	r2, [r3, #210]
	add	r1, r1, r2
	ldrh	r2, [r3, #218]
	adds	r2, r1, r2
	ldrh	r1, [r3, #196]
	str	r2, [sp, #12]
	ldrh	r2, [r3, #204]
	add	r1, r1, r2
	ldrh	r2, [r3, #212]
	add	r1, r1, r2
	ldrh	r2, [r3, #220]
	adds	r2, r1, r2
	ldrh	r1, [r3, #198]
	str	r2, [sp, #16]
	ldrh	r2, [r3, #206]
	add	r1, r1, r2
	ldrh	r2, [r3, #214]
	add	r1, r1, r2
	ldrh	r2, [r3, #222]
	adds	r2, r1, r2
	str	r2, [sp, #20]
	ldrh	r2, [r3, #224]
	str	r2, [sp, #40]
	ldrh	r2, [r3, #232]
	str	r2, [sp, #44]
	ldrh	r2, [r3, #240]
	ldrh	r6, [r3, #226]
	ldrh	r1, [r3, #250]
	str	r2, [sp, #48]
	ldrh	r2, [r3, #248]
	str	r2, [sp, #52]
	ldrh	r2, [r3, #234]
	add	r6, r6, r2
	ldrh	r2, [r3, #242]
	add	r6, r6, r2
	ldrh	r2, [r3, #236]
	add	r6, r6, r1
	ldrh	r1, [r3, #228]
	add	r1, r1, r2
	ldrh	r2, [r3, #244]
	add	r1, r1, r2
	ldrh	r2, [r3, #252]
	adds	r2, r1, r2
	ldrh	r1, [r3, #230]
	str	r2, [sp, #4]
	ldrh	r2, [r3, #238]
	add	r1, r1, r2
	ldrh	r2, [r3, #246]
	ldrh	r3, [r3, #254]
	add	r1, r1, r2
	adds	r3, r1, r3
	str	r3, [sp, #8]
	ldr	r3, [r0, #952]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [sp, #4]
	add	r4, r6, r6, lsl #4
	movs	r2, #22
	mla	r3, r2, r3, r4
	ldr	r2, [sp, #8]
	movs	r4, #24
	mla	r4, r4, r2, r3
.L57:
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	lsrs	r4, r4, #2
	add	fp, r3, r3, lsl #2
	movs	r3, #6
	mla	fp, r3, r2, fp
	ldr	r3, [sp, #12]
	add	fp, fp, r3, lsl #2
	ldr	r3, .L63
	lsr	fp, fp, #2
	ldr	r3, [r3]
	lsls	r1, r3, #30
	bpl	.L4
	mov	r3, r5
	movw	r2, #2719
	ldr	r1, .L63+4
	ldr	r0, .L63+8
	bl	printk
.L4:
	movs	r3, #100
	rsb	r2, r9, r9, lsl #4
	muls	r4, r3, r4
	cmp	r4, r2
	bls	.L5
	movs	r3, #200
.L58:
	str	r3, [r8, #204]
	movs	r3, #100
	mul	fp, r3, fp
	movs	r3, #30
	mul	r3, r3, r9
	cmp	fp, r3
	bls	.L9
	movs	r3, #2
.L59:
	str	r3, [r8, #208]
	ldr	fp, [r5, #308]
	ldrb	r3, [fp, #44]	@ zero_extendqisi2
	lsls	r2, r3, #30
	bpl	.L12
	ldr	r3, .L63
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L12
	movw	r2, #2610
	ldr	r1, .L63+12
	ldr	r0, .L63+16
	bl	printk
.L12:
	ldrb	r3, [fp, #44]	@ zero_extendqisi2
	lsls	r4, r3, #31
	bpl	.L13
	ldr	r3, .L63
	ldr	r3, [r3]
	lsls	r0, r3, #28
	bpl	.L13
	movw	r2, #2613
	ldr	r1, .L63+12
	ldr	r0, .L63+20
	bl	printk
.L13:
	ldrb	r3, [fp, #44]	@ zero_extendqisi2
	lsls	r1, r3, #28
	bpl	.L14
	ldr	r3, .L63
	ldr	r3, [r3]
	lsls	r2, r3, #28
	bpl	.L14
	movw	r2, #2616
	ldr	r1, .L63+12
	ldr	r0, .L63+24
	bl	printk
.L14:
	ldrb	r3, [fp, #44]	@ zero_extendqisi2
	lsls	r3, r3, #29
	bpl	.L15
	ldr	r3, .L63
	ldr	r3, [r3]
	lsls	r4, r3, #28
	bpl	.L15
	movw	r2, #2619
	ldr	r1, .L63+12
	ldr	r0, .L63+28
	bl	printk
.L15:
	ldrb	r3, [fp, #44]	@ zero_extendqisi2
	ldr	r2, .L63
	lsls	r0, r3, #27
	ldr	r4, [r2]
	bpl	.L16
	lsls	r1, r4, #22
	bpl	.L25
	movw	r2, #2622
	ldr	r1, .L63+12
	ldr	r0, .L63+32
	bl	printk
.L25:
	mvn	r0, #100
	b	.L1
.L2:
	ldr	r3, [sp, #4]
	movs	r4, #11
	ldr	r2, [sp, #8]
	muls	r3, r4, r3
	movs	r4, #12
	mla	r4, r4, r2, r3
	add	r4, r4, r6, lsl #3
	b	.L57
.L5:
	add	r2, r9, r9, lsl #2
	cmp	r4, r2
	bhi	.L58
	cmp	r4, r9, lsr #2
	ite	ls
	movls	r3, #0
	movhi	r3, #1
	b	.L58
.L9:
	movs	r3, #13
	mul	r3, r3, r9
	cmp	fp, r3
	ite	ls
	movls	r3, #0
	movhi	r3, #1
	b	.L59
.L16:
	lsls	r2, r3, #26
	bpl	.L18
	lsls	r4, r4, #22
	bpl	.L28
	ldr	r1, .L63+12
	movw	r2, #2627
	ldr	r0, .L63+36
.L62:
	bl	printk
.L28:
	mov	r0, #-1
	b	.L1
.L18:
	lsls	r0, r3, #25
	bpl	.L19
	lsls	r1, r4, #22
	bpl	.L28
	movw	r2, #2632
	ldr	r1, .L63+12
	ldr	r0, .L63+40
	b	.L62
.L19:
	ldrb	r3, [fp, #45]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L20
	lsls	r3, r4, #22
	bpl	.L28
	movw	r2, #2637
	ldr	r1, .L63+12
	ldr	r0, .L63+44
	b	.L62
.L20:
	ldrd	r3, r2, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [r10, #44]
	mov	r1, r3
	ldr	r3, [sp, #28]
	add	r1, r1, r3
	ldr	r3, [sp, #24]
	add	r3, r3, r1
	movw	r1, #5608
	ldr	r1, [r7, r1]
	str	r3, [sp, #24]
	add	r2, r2, r1
	ldr	r1, [r10, #48]
	str	r2, [r10, #44]
	add	r1, r1, r2
	lsl	fp, r2, #3
	str	r1, [r10, #48]
	movw	r2, #5620
	str	fp, [r8, #184]
	mov	r1, r9
	ldr	r0, [r7, r2]
	bl	__aeabi_uidiv
	str	r0, [r8, #188]
	ldrb	r2, [r7, #732]	@ zero_extendqisi2
	ldrb	ip, [r7, #733]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	add	r0, r2, ip
	ldrb	r1, [r7, #734]	@ zero_extendqisi2
	mul	lr, r3, r0
	ldr	r3, [sp, #20]
	mul	r0, r3, r1
	ldr	r3, [sp, #24]
	add	r1, r1, ip
	mla	r0, r3, r2, r0
	ldr	r2, [sp, #16]
	muls	r1, r2, r1
	add	r0, r0, lr, lsr #1
	add	r0, r0, r1, lsr #1
	ldrd	r2, r1, [sp, #12]
	adds	r1, r2, r1
	ldr	r2, [sp, #20]
	add	r1, r1, r2
	adds	r1, r1, r3
	bne	.L21
.L60:
	ldrd	r3, r2, [sp, #48]
	str	r0, [r8, #192]
	add	r3, r3, r2
	ldrh	r2, [r7, #738]
	mov	r1, r3
	ldr	r3, [sp, #44]
	ubfx	ip, r2, #0, #12
	ldrh	r2, [r7, #740]
	add	r1, r1, r3
	ldr	r3, [sp, #40]
	ubfx	r2, r2, #0, #12
	add	r1, r1, r3
	ldrh	r3, [r7, #736]
	ubfx	r3, r3, #0, #12
	add	r0, r3, ip
	mul	lr, r6, r0
	ldr	r0, [sp, #8]
	muls	r0, r2, r0
	add	r2, r2, ip
	mla	r0, r1, r3, r0
	ldr	r3, [sp, #4]
	add	r6, r6, r3
	muls	r2, r3, r2
	ldr	r3, [sp, #8]
	add	r0, r0, lr, lsr #1
	add	r6, r6, r3
	adds	r1, r6, r1
	add	r0, r0, r2, lsr #1
	bne	.L23
.L61:
	str	r0, [r8, #196]
	movw	r3, #5764
	ldr	r0, [r7, r3]
	add	r3, r7, #5760
	mov	r1, r9
	ldr	r3, [r3]
	ubfx	r0, r0, #0, #23
	ubfx	r3, r3, #0, #23
	add	r0, r0, r3
	movw	r3, #5756
	ldr	r3, [r7, r3]
	ubfx	r3, r3, #0, #21
	add	r0, r0, r3
	lsls	r0, r0, #8
	bl	__aeabi_uidiv
	str	r0, [r8, #200]
	str	fp, [r5, #212]
	ldr	r3, [r8, #188]
	str	r3, [r5, #216]
	ldr	r3, [r8, #200]
	str	r9, [r5, #592]
	str	r3, [r5, #228]
	movw	r3, #5772
	ldrb	r1, [r7, r3]	@ zero_extendqisi2
	movs	r3, #4
	smulbb	r2, r1, r3
	str	r2, [r5, #600]
	movw	r2, #5773
	ldrb	r0, [r7, r2]	@ zero_extendqisi2
	movw	r2, #5774
	lsls	r0, r0, #2
	str	r0, [r5, #604]
	ldrb	r2, [r7, r2]	@ zero_extendqisi2
	smlabb	r1, r3, r1, r0
	ands	r0, r4, #2
	smulbb	r6, r2, r3
	smlabb	r2, r3, r2, r1
	str	r6, [r5, #608]
	movw	r6, #5775
	ldrb	r6, [r7, r6]	@ zero_extendqisi2
	smulbb	r7, r6, r3
	smlabb	r3, r3, r6, r2
	str	r7, [r5, #612]
	str	r3, [r5, #616]
	ldr	r3, [r5, #168]
	ldr	r3, [r3, #44]
	str	r3, [r5, #316]
	add	r3, r5, #188
	str	r3, [r10, #24]
	mov	r3, #1
	str	r3, [r10, #20]
	beq	.L1
	mov	r3, r5
	movw	r2, #2797
	ldr	r1, .L63+4
	ldr	r0, .L63+48
	bl	printk
	movs	r0, #0
.L1:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L21:
	bl	__aeabi_uidiv
	b	.L60
.L23:
	bl	__aeabi_uidiv
	b	.L61
.L64:
	.align	2
.L63:
	.word	hal_h264e_debug
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+28
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_ret_task, .-hal_h264e_vepu540c_ret_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_ret_comb_task, %function
hal_h264e_vepu540c_ret_comb_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r6, .L80
	mov	r5, r0
	mov	r4, r2
	ldr	r8, [r2, #4]
	ldr	r9, [r0, #308]
	ldr	r3, [r6]
	lsls	r1, r3, #30
	bpl	.L66
	mov	r3, r0
	movw	r2, #2840
	ldr	r1, .L80+4
	ldr	r0, .L80+8
	bl	printk
.L66:
	mov	r1, r7
	mov	r0, r5
	bl	hal_h264e_vepu540c_ret_task
	mov	r7, r0
	cbnz	r0, .L65
	ldrb	r3, [r9, #45]	@ zero_extendqisi2
	lsls	r2, r3, #26
	movw	r2, #5708
	itt	mi
	movmi	r3, #1
	strmi	r3, [r4, #96]
	ldr	r3, [r4, #44]
	ldr	r2, [r9, r2]
	add	r3, r3, r2
	ldr	r2, [r4, #48]
	str	r3, [r4, #44]
	add	r2, r2, r3
	lsls	r3, r3, #3
	str	r2, [r4, #48]
	str	r3, [r8, #184]
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L65
	mov	r3, r5
	movw	r2, #2854
	ldr	r1, .L80+4
	ldr	r0, .L80+12
	bl	printk
.L65:
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L81:
	.align	2
.L80:
	.word	hal_h264e_debug
	.word	.LANCHOR0+60
	.word	.LC0
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_ret_comb_task, .-hal_h264e_vepu540c_ret_comb_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_start, %function
hal_h264e_vepu540c_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r6, .L108
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r6]
	lsls	r1, r3, #30
	bpl	.L83
	mov	r3, r0
	movw	r2, #2486
	ldr	r1, .L108+4
	ldr	r0, .L108+8
	bl	printk
.L83:
	ldr	r3, [r5, #308]
	movs	r1, #0
	mov	r2, sp
	ldr	r0, [r5, #4]
	str	r3, [sp]
	movs	r3, #100
	strd	r3, r1, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L84
	mov	r3, r0
	movw	r2, #2511
.L107:
	ldr	r1, .L108+4
	ldr	r0, .L108+12
.L106:
	bl	printk
.L95:
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L82
	mov	r3, r5
	movw	r2, #2599
	ldr	r1, .L108+4
	ldr	r0, .L108+16
	bl	printk
.L82:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L84:
	ldr	r3, [r5, #308]
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #4]
	adds	r3, r3, #100
	mov	r7, #624
	str	r3, [sp]
	mov	r3, #532
	strd	r3, r7, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L86
	mov	r3, r0
	movw	r2, #2520
	b	.L107
.L86:
	ldr	r3, [r5, #308]
	mov	r2, #272
	mov	r1, r0
	ldr	r0, [r5, #4]
	add	r3, r3, #632
	str	r3, [sp]
	mov	r3, #4096
	strd	r2, r3, [sp, #4]
	mov	r2, sp
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L87
	mov	r3, r0
	movw	r2, #2529
	b	.L107
.L87:
	ldr	r3, [r5, #308]
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #4]
	add	r3, r3, #904
	mov	lr, #720
	str	r3, [sp]
	mov	r3, #5888
	strd	lr, r3, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L88
	mov	r3, r0
	movw	r2, #2538
	b	.L107
.L88:
	ldr	r3, [r5, #308]
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #4]
	add	r3, r3, #1624
	mov	ip, #256
	str	r3, [sp]
	mov	r3, #8192
	strd	ip, r3, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L89
	mov	r3, r0
	movw	r2, #2547
	b	.L107
.L89:
	ldr	r3, [r5, #308]
	mov	r0, #2720
	mov	r1, r4
	mov	r2, sp
	add	r3, r3, #1880
	str	r3, [sp]
	movw	r3, #8672
	strd	r0, r3, [sp, #4]
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L90
	mov	r3, r0
	movw	r2, #2557
	b	.L107
.L90:
	ldr	r3, [r5, #308]
	mov	r1, #384
	mov	r2, sp
	add	r3, r3, #4576
	adds	r3, r3, #24
	str	r3, [sp]
	mov	r3, #11392
	strd	r1, r3, [sp, #4]
	mov	r1, r0
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L91
	mov	r3, r0
	movw	r2, #2567
	b	.L107
.L91:
	ldr	r3, [r5, #308]
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #4]
	add	r3, r3, #4960
	adds	r3, r3, #24
	strd	r3, r7, [sp]
	mov	r3, #12288
	str	r3, [sp, #8]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L92
	mov	r3, r0
	movw	r2, #2577
	b	.L107
.L92:
	ldr	r3, [r5, #308]
	mov	r2, #592
	movs	r1, #1
	ldr	r0, [r5, #4]
	add	r3, r3, #5600
	adds	r3, r3, #8
	str	r3, [sp, #12]
	mov	r3, #16384
	strd	r2, r3, [sp, #16]
	add	r2, sp, #12
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L93
	mov	r3, r0
	movw	r2, #2587
	ldr	r1, .L108+4
	ldr	r0, .L108+20
	b	.L106
.L93:
	mov	r2, r0
	movs	r1, #5
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cmp	r0, #0
	beq	.L95
	mov	r3, r0
	movw	r2, #2594
	ldr	r1, .L108+4
	ldr	r0, .L108+24
	b	.L106
.L109:
	.align	2
.L108:
	.word	hal_h264e_debug
	.word	.LANCHOR0+93
	.word	.LC0
	.word	.LC10
	.word	.LC9
	.word	.LC11
	.word	.LC12
	.fnend
	.size	hal_h264e_vepu540c_start, .-hal_h264e_vepu540c_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_comb_start, %function
hal_h264e_vepu540c_comb_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, r2
	ldr	r3, [r0]
	.pad #56
	sub	sp, sp, #56
	ldr	r5, .L127
	mov	r4, r0
	mov	r8, r1
	ldr	r6, [r0, #308]
	ldr	r9, [r3, #36]
	ldr	r3, [r5]
	lsls	r2, r3, #30
	bpl	.L111
	mov	r3, r0
	movw	r2, #2811
	ldr	r1, .L127+4
	ldr	r0, .L127+8
	bl	printk
.L111:
	ldrb	r3, [r6, #48]	@ zero_extendqisi2
	add	r10, sp, #28
	mov	r1, r9
	movs	r2, #7
	mov	r0, r10
	bfi	r3, r2, #0, #4
	strb	r3, [r6, #48]
	movw	r9, #4600
	bl	vepu541_set_fmt
	ldr	r3, [r4, #4]
	str	r3, [sp]
	mov	r0, sp
	ldr	r3, [r4, #308]
	str	r10, [sp, #16]
	add	r2, r3, #500
	add	r3, r3, r9
	strd	r3, r7, [sp, #8]
	ldr	r3, [r4, #940]
	str	r2, [sp, #4]
	str	r3, [sp, #20]
	bl	vepu540c_set_jpeg_reg
	ldr	r1, [r7, #92]
	cbz	r1, .L112
	mov	r2, #384
	add	r0, r6, r9
	bl	memcpy
.L112:
	ldr	r1, [r7, #88]
	cbz	r1, .L113
	add	r0, r6, #5280
	mov	r2, #312
	adds	r0, r0, #16
	bl	memcpy
.L113:
	ldr	r3, [r5]
	lsls	r3, r3, #30
	bpl	.L114
	mov	r3, r4
	movw	r2, #2827
	ldr	r1, .L127+4
	ldr	r0, .L127+12
	bl	printk
.L114:
	mov	r1, r8
	mov	r0, r4
	bl	hal_h264e_vepu540c_start
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L128:
	.align	2
.L127:
	.word	hal_h264e_debug
	.word	.LANCHOR0+118
	.word	.LC0
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_comb_start, .-hal_h264e_vepu540c_comb_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_get_task, %function
hal_h264e_vepu540c_get_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	ldr	r5, [r1, #16]
	.pad #52
	sub	sp, sp, #52
	ldr	r3, [r1, #12]
	mov	r4, r0
	ldr	r6, .L222
	adds	r5, r5, #8
	ldr	fp, .L222+52
	mov	r8, r1
	ldr	r7, .L222+4
	mov	r10, r9
	str	r3, [sp, #16]
.L130:
	ldr	r3, [sp, #16]
	cmp	r3, r9
	bgt	.L146
	ldr	r3, .L222+4
	ldr	r5, [r8, #4]
	ldr	r3, [r3]
	lsls	r0, r3, #30
	bpl	.L147
	mov	r3, r4
	movw	r2, #733
	ldr	r1, .L222+8
	ldr	r0, .L222+12
	bl	printk
.L147:
	ldr	r3, [r4, #308]
	add	r3, r3, #4960
	adds	r3, r3, #24
	str	r3, [r4, #296]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_roi
	str	r0, [r4, #292]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_osd
	str	r0, [r4, #304]
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	lsls	r1, r3, #29
	bmi	.L148
	tst	r10, #1
	beq	.L150
	ldr	r2, [r4]
	movw	r9, #8191
	ldr	r3, [r2, #28]
	ldr	r7, [r2, #32]
	add	r10, r3, #63
	adds	r7, r7, #63
	bic	r6, r10, #63
	bic	r7, r7, #63
	asr	r10, r10, #6
	mul	r3, r7, r6
	cmp	r3, #0
	mov	r1, r3
	it	lt
	addlt	r1, r3, #63
	add	r3, r3, r3, lsl #1
	add	r9, r9, r1, asr #6
	ldr	r1, .L222+16
	asrs	r3, r3, #1
	str	r3, [sp, #16]
	and	r9, r9, r1
	add	fp, r9, r3
	mov	r3, r10
	muls	r3, r7, r3
	it	mi
	addmi	r3, r3, #63
	asrs	r5, r3, #6
	ldr	r3, [r4, #40]
	lsls	r5, r5, #8
	str	r3, [sp, #20]
	movw	r3, #4724
	ldr	r0, [r2, r3]
	add	r5, r5, #8160
	adds	r5, r5, #31
	ands	r5, r5, r1
	cmp	r0, #0
	beq	.L181
	bl	mpp_enc_ref_cfg_get_cpb_info
	ldr	r3, [r0]
	add	r8, r3, #1
	ldr	r3, [r0, #4]
	cmp	r8, #2
	it	lt
	movlt	r8, #2
	str	r3, [sp, #24]
.L153:
	cmp	r6, #3072
	ble	.L155
	mov	r3, #896
	mul	r10, r3, r10
	ldr	r3, [r4, #944]
	ldr	r3, [r3, #8]
	sub	r10, r10, #32256
	cmp	r3, #0
	bne	.L156
	ldr	r2, [r4, #148]
	str	r3, [sp, #28]
	cmp	r10, r2
	ldr	r0, [r4, #936]
	beq	.L157
	ldr	r1, .L222+20
	bl	mpp_buffer_put_with_caller
	ldr	r3, [sp, #28]
	str	r3, [r4, #936]
.L158:
	ldr	r3, .L222+20
	mov	r2, r10
	add	r1, r4, #936
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L222+24
	bl	mpp_buffer_get_with_tag
	b	.L159
.L146:
	ldr	r3, [r5, #-8]
	cmp	r3, #6
	bhi	.L131
	tbb	[pc, r3]
.L133:
	.byte	(.L138-.L133)/2
	.byte	(.L137-.L133)/2
	.byte	(.L136-.L133)/2
	.byte	(.L131-.L133)/2
	.byte	(.L135-.L133)/2
	.byte	(.L134-.L133)/2
	.byte	(.L132-.L133)/2
	.p2align 1
.L138:
	ldr	r3, [r7]
	lsls	r2, r3, #28
	bpl	.L139
	movw	r2, #685
	mov	r1, r6
	ldr	r0, .L222+28
	bl	printk
.L139:
	ldr	r3, [r5, #-4]
	str	r3, [r4]
.L140:
	ldr	r2, [r5, #-8]
	movs	r3, #1
	add	r9, r9, #1
	adds	r5, r5, #8
	lsls	r3, r3, r2
	orr	r10, r10, r3
	b	.L130
.L137:
	ldr	r3, [r7]
	lsls	r3, r3, #28
	bpl	.L141
	movw	r2, #690
	mov	r1, r6
	ldr	r0, .L222+32
	bl	printk
.L141:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #160]
	b	.L140
.L136:
	ldr	r3, [r7]
	lsls	r0, r3, #28
	bpl	.L142
	movw	r2, #695
	mov	r1, r6
	ldr	r0, .L222+36
	bl	printk
.L142:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #164]
	b	.L140
.L135:
	ldr	r3, [r7]
	lsls	r1, r3, #28
	bpl	.L143
	mov	r2, #700
	mov	r1, r6
	ldr	r0, .L222+40
	bl	printk
.L143:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #168]
	b	.L140
.L134:
	ldr	r3, [r7]
	lsls	r2, r3, #28
	bpl	.L144
	movw	r2, #705
	mov	r1, r6
	ldr	r0, .L222+44
	bl	printk
.L144:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #172]
	b	.L140
.L132:
	ldr	r3, [r7]
	lsls	r3, r3, #28
	bpl	.L145
	movw	r2, #710
	mov	r1, r6
	ldr	r0, .L222+48
	bl	printk
.L145:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #184]
	b	.L140
.L131:
	mov	r2, #716
	mov	r1, r6
	mov	r0, fp
	bl	printk
	b	.L140
.L181:
	mov	r8, #2
	b	.L153
.L223:
	.align	2
.L222:
	.word	.LANCHOR0+148
	.word	hal_h264e_debug
	.word	.LANCHOR0+171
	.word	.LC0
	.word	-8192
	.word	.LANCHOR0+199
	.word	.LC20
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
.L157:
	cmp	r0, #0
	beq	.L158
.L159:
	str	r10, [r4, #148]
.L160:
	addw	r3, r6, #1023
	asrs	r3, r3, #10
	muls	r3, r7, r3
	addw	r7, r7, #1023
	it	mi
	addmi	r3, r3, #15
	bic	r3, r3, #15
	asrs	r7, r7, #10
	muls	r6, r7, r6
	it	mi
	addmi	r6, r6, #15
	bic	r6, r6, #15
	cmp	r6, r3
	it	cc
	movcc	r6, r3
	ldr	r3, [r4, #16]
	cmp	r9, r3
	bne	.L164
	ldr	r3, [r4, #20]
	ldr	r2, [sp, #16]
	cmp	r2, r3
	bne	.L164
	ldr	r3, [r4, #28]
	cmp	fp, r3
	bne	.L164
	ldr	r3, [r4, #32]
	cmp	r5, r3
	bne	.L164
	ldr	r3, [r4, #36]
	cmp	r6, r3
	bne	.L164
	ldr	r3, [sp, #20]
	cmp	r3, r8
	bge	.L150
.L164:
	ldr	r3, .L224
	ldr	r3, [r3]
	lsls	r2, r3, #28
	bpl	.L166
	ldr	r3, [sp, #20]
	movw	r2, #614
	str	r8, [sp, #8]
	ldr	r1, .L224+4
	strd	fp, r3, [sp]
	ldr	r0, .L224+8
	ldr	r3, [r4, #28]
	bl	printk
.L166:
	ldr	r3, [sp, #20]
	str	r9, [r4, #16]
	cmp	r3, r8
	it	lt
	movlt	r3, r8
	mov	r8, r3
	ldr	r3, [sp, #16]
	str	r3, [r4, #20]
	ldr	r3, [r4, #944]
	ldr	r3, [r3]
	cbnz	r3, .L167
	add	r0, r4, #12
	bl	hal_bufs_init
.L167:
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #944]
	str	r5, [sp, #32]
	cmp	r2, #0
	beq	.L168
	movs	r2, #0
	strd	r2, r6, [sp, #36]
	str	r2, [sp, #44]
	ldr	r3, [r3]
	cbnz	r3, .L169
	add	r3, sp, #32
	movs	r2, #4
	mov	r1, r8
	ldr	r0, [r4, #12]
	bl	hal_bufs_setup
.L169:
	ldr	r3, [r4]
	movs	r0, #48
	movs	r1, #240
	ldr	r7, .L224+12
	ldr	r2, [r3, #28]
	ldr	r3, [r3, #32]
	adds	r2, r2, #63
	adds	r3, r3, #63
	bic	r2, r2, #63
	bic	r3, r3, #63
	cmp	r2, r3
	mul	ip, r3, r2
	it	lt
	movlt	r2, r3
	muls	r0, r2, r0
	muls	r1, r2, r1
	add	r3, ip, ip, lsl #1
	cmp	ip, #0
	it	lt
	addlt	ip, ip, #63
	addw	r0, r0, #4095
	add	r0, r0, r3, asr #1
	asrs	r3, r2, #1
	add	r2, r2, r2, lsl #1
	add	ip, r3, ip, asr #6
	addw	r3, r2, #4095
	ldr	r2, [sp, #24]
	addw	r1, r1, #4095
	addw	ip, ip, #4095
	ands	r0, r0, r7
	and	ip, ip, r7
	ands	r1, r1, r7
	ands	r3, r3, r7
	cmp	r2, #0
	add	r1, r1, r0
	add	r3, r3, ip
	str	r0, [r4, #140]
	str	r1, [r4, #144]
	add	r7, r1, r3
	str	ip, [r4, #92]
	str	r3, [r4, #96]
	ble	.L171
	ldr	r2, [r4, #960]
	strd	r0, r1, [r4, #116]
	strd	ip, r3, [r4, #68]
	cbz	r2, .L172
	str	r0, [r4, #120]
	str	ip, [r4, #72]
.L172:
	ldr	r0, [r4, #72]
	ldr	r2, [r4, #120]
	add	r3, r3, r0
	str	r3, [r4, #100]
	add	ip, r2, r0
	add	r2, r2, r3
	add	r7, r7, ip
	add	r1, r1, r2
	mov	ip, #0
	str	r0, [r4, #76]
	strd	ip, r0, [r4, #52]
	str	ip, [r4, #60]
	strd	r3, r0, [r4, #80]
	strd	r2, r3, [r4, #104]
	str	r2, [r4, #124]
	strd	r1, r2, [r4, #128]
.L180:
	ldr	r3, [r4, #944]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L173
	ldr	r0, [r4, #48]
	cbz	r0, .L174
	ldr	r1, .L224+16
	bl	mpp_buffer_put_with_caller
.L174:
	ldr	r3, .L224+16
	mov	r2, r7
	add	r1, r4, #48
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L224+20
	bl	mpp_buffer_get_with_tag
.L176:
	ldr	r3, [r4, #944]
	ldr	r3, [r3]
	cbz	r3, .L178
	str	r3, [r4, #12]
.L178:
	strd	fp, r5, [r4, #28]
	strd	r6, r8, [r4, #36]
.L150:
	mov	r2, #312
	add	r0, r4, #624
	adds	r1, r4, r2
	bl	memcpy
.L148:
	ldr	r3, .L224
	ldr	r3, [r3]
	lsls	r3, r3, #30
	bpl	.L208
	mov	r3, r4
	movw	r2, #746
	ldr	r1, .L224+24
	ldr	r0, .L224+28
	bl	printk
.L208:
	movs	r0, #0
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L156:
	str	r3, [r4, #936]
	b	.L159
.L155:
	ldr	r0, [r4, #936]
	cbz	r0, .L161
	ldr	r3, [r4, #944]
	ldr	r10, [r3, #8]
	cmp	r10, #0
	bne	.L161
	ldr	r1, .L224+32
	bl	mpp_buffer_put_with_caller
	str	r10, [r4, #936]
.L161:
	movs	r3, #0
	str	r3, [r4, #148]
	b	.L160
.L173:
	str	r3, [r4, #48]
	b	.L176
.L168:
	strd	r2, r6, [sp, #36]
	str	fp, [sp, #44]
	ldr	r3, [r3]
	cbnz	r3, .L177
	add	r3, sp, #32
	movs	r2, #4
	mov	r1, r8
	ldr	r0, [r4, #12]
	bl	hal_bufs_setup
.L177:
	strd	r9, fp, [r4, #24]
	b	.L176
.L171:
	movs	r2, #0
	strd	r3, r7, [r4, #124]
	strd	r2, r3, [r4, #76]
	str	r2, [r4, #84]
	str	r3, [r4, #132]
	b	.L180
.L225:
	.align	2
.L224:
	.word	hal_h264e_debug
	.word	.LANCHOR0+214
	.word	.LC21
	.word	-4096
	.word	.LANCHOR0+229
	.word	.LC20
	.word	.LANCHOR0+171
	.word	.LC9
	.word	.LANCHOR0+199
	.fnend
	.size	hal_h264e_vepu540c_get_task, .-hal_h264e_vepu540c_get_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_deinit, %function
hal_h264e_vepu540c_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L259
	ldr	r3, [r5]
	lsls	r2, r3, #30
	bpl	.L227
	mov	r3, r0
	movs	r2, #205
	ldr	r1, .L259+4
	ldr	r0, .L259+8
	bl	printk
.L227:
	ldr	r0, [r4, #4]
	cbz	r0, .L228
	bl	mpp_dev_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L228:
	ldr	r3, [r4, #944]
	ldr	r6, [r3, #8]
	cbnz	r6, .L229
	ldr	r0, [r4, #936]
	cbz	r0, .L229
	ldr	r1, .L259+12
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #936]
.L229:
	ldr	r3, [r4, #944]
	ldr	r6, [r3]
	cbnz	r6, .L230
	ldr	r0, [r4, #12]
	cbz	r0, .L230
	bl	hal_bufs_deinit
	str	r6, [r4, #12]
.L230:
	ldr	r0, [r4, #152]
	cbz	r0, .L231
	ldr	r1, .L259+12
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #152]
.L231:
	ldr	r3, [r4, #944]
	ldr	r6, [r3, #4]
	cbnz	r6, .L232
	ldr	r0, [r4, #48]
	cbz	r0, .L232
	ldr	r1, .L259+12
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #48]
.L232:
	ldr	r1, [r4, #308]
	cbz	r1, .L233
	ldr	r0, .L259+12
	bl	mpp_osal_free
.L233:
	movs	r3, #0
	str	r3, [r4, #308]
	ldr	r3, [r5]
	lsls	r3, r3, #30
	bpl	.L234
	mov	r3, r4
	movs	r2, #233
	ldr	r1, .L259+4
	ldr	r0, .L259+16
	bl	printk
.L234:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L260:
	.align	2
.L259:
	.word	hal_h264e_debug
	.word	.LANCHOR0+242
	.word	.LC0
	.word	.LANCHOR0+268
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_deinit, .-hal_h264e_vepu540c_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_init, %function
hal_h264e_vepu540c_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r7, .L299
	mov	r4, r1
	ldr	r3, [r7]
	lsls	r6, r3, #30
	bpl	.L262
	mov	r3, r0
	movs	r2, #242
	ldr	r1, .L299+4
	ldr	r0, .L299+8
	bl	printk
.L262:
	ldr	r3, [r4, #4]
	movs	r1, #16
	add	r0, r4, #32
	str	r3, [r5]
	ldr	r3, [r4, #8]
	str	r3, [r5, #940]
	ldr	r3, [r4, #12]
	str	r3, [r5, #44]
	ldr	r3, [r4, #36]
	str	r3, [r5, #944]
	ldr	r3, [r4, #16]
	str	r3, [r5, #948]
	ldr	r3, [r4, #20]
	str	r3, [r5, #952]
	ldr	r3, [r4, #24]
	str	r3, [r5, #960]
	str	r1, [r4, #28]
	bl	mpp_dev_init
	mov	r6, r0
	cbz	r0, .L263
	mov	r3, r0
	movs	r2, #255
	ldr	r1, .L299+4
	ldr	r0, .L299+12
	bl	printk
	mov	r0, r5
	bl	hal_h264e_vepu540c_deinit
.L264:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L261
	mov	r3, r5
	mov	r2, #308
	ldr	r1, .L299+4
	ldr	r0, .L299+16
	bl	printk
	b	.L261
.L263:
	ldr	r3, [r4, #32]
	movs	r2, #2
	movs	r1, #1
	movw	r0, #683
	str	r3, [r5, #4]
	str	r3, [r5, #300]
	ldr	r3, [r4, #4]
	strd	r2, r1, [r3, #308]
	movw	r2, #341
	strd	r6, r6, [r3, #324]
	strd	r0, r2, [r3, #316]
	add	r2, r3, #336
	str	r6, [r3, #332]
	ldr	r1, [r5, #952]
	cmp	r1, #0
	beq	.L265
	ldr	ip, .L299+40
	add	lr, ip, #64
	mov	r8, lr
.L266:
	mov	r4, ip
	adds	r2, r2, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, lr
	str	r0, [r2, #-8]	@ unaligned
	mov	ip, r4
	str	r1, [r2, #-4]	@ unaligned
	bne	.L266
	ldr	ip, .L299+40
	add	r4, r3, #400
.L267:
	mov	r2, ip
	adds	r4, r4, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [r4, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r4, #-4]	@ unaligned
	bne	.L267
	ldr	ip, .L299+44
	add	r4, r3, #464
	add	lr, ip, #64
.L268:
	mov	r2, ip
	adds	r4, r4, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r4, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r4, #-4]	@ unaligned
	bne	.L268
	ldr	r4, .L299+20
	add	r3, r3, #528
	add	ip, r4, #64
.L269:
	mov	r2, r4
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, ip
	str	r0, [r3, #-8]	@ unaligned
	mov	r4, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L269
.L270:
	movw	r1, #6200
	ldr	r0, .L299+24
	bl	mpp_osal_calloc
	str	r0, [r5, #308]
	cmp	r0, #0
	bne	.L264
	movw	r1, #301
	ldr	r0, .L299+28
	bl	printk
	mvn	r6, #3
.L261:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L265:
	ldr	r1, [r5]
	movw	r0, #4732
	add	r8, r3, #400
	add	r4, r3, #464
	add	r3, r3, #528
	ldr	r1, [r1, r0]
	cmp	r1, #1
	bne	.L271
	ldr	r9, .L299+48
	mov	lr, r2
	add	r2, r9, #64
	mov	r10, r2
.L272:
	mov	ip, r9
	add	lr, lr, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r2
	str	r0, [lr, #-8]	@ unaligned
	mov	r9, ip
	str	r1, [lr, #-4]	@ unaligned
	bne	.L272
	ldr	lr, .L299+48
	mov	r2, r8
.L273:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r10
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L273
	ldr	lr, .L299+52
	mov	r2, r4
	add	r4, lr, #64
.L274:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r4
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L274
	ldr	r4, .L299+32
	add	ip, r4, #64
.L275:
	mov	r2, r4
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, ip
	str	r0, [r3, #-8]	@ unaligned
	mov	r4, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L275
	b	.L270
.L271:
	ldr	lr, .L299+56
	add	r10, lr, #64
	mov	r9, r10
.L276:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r10
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L276
	ldr	lr, .L299+56
	mov	r2, r8
.L277:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r9
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L277
	ldr	ip, .L299+60
	mov	r2, r4
	add	lr, ip, #64
.L278:
	mov	r4, ip
	adds	r2, r2, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, lr
	str	r0, [r2, #-8]	@ unaligned
	mov	ip, r4
	str	r1, [r2, #-4]	@ unaligned
	bne	.L278
	ldr	r4, .L299+36
	add	ip, r4, #64
.L279:
	mov	r2, r4
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, ip
	str	r0, [r3, #-8]	@ unaligned
	mov	r4, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L279
	b	.L270
.L300:
	.align	2
.L299:
	.word	hal_h264e_debug
	.word	.LANCHOR0+294
	.word	.LC0
	.word	.LC22
	.word	.LC9
	.word	.LANCHOR1+128
	.word	.LANCHOR0+318
	.word	.LC23
	.word	.LANCHOR1+320
	.word	.LANCHOR1+512
	.word	.LANCHOR1
	.word	.LANCHOR1+64
	.word	.LANCHOR1+192
	.word	.LANCHOR1+256
	.word	.LANCHOR1+384
	.word	.LANCHOR1+448
	.fnend
	.size	hal_h264e_vepu540c_init, .-hal_h264e_vepu540c_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_prepare, %function
hal_h264e_vepu540c_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L314
	ldr	r6, [r0]
	ldr	r2, [r4]
	lsls	r2, r2, #30
	bpl	.L302
	mov	r3, r0
	movw	r2, #654
	ldr	r1, .L314+4
	ldr	r0, .L314+8
	bl	printk
.L302:
	ldr	r3, [r6, #8]
	tst	r3, #5
	itt	ne
	movne	r3, #0
	strne	r3, [r6, #8]
	ldr	r3, [r4]
	lsls	r3, r3, #30
	bpl	.L304
	mov	r3, r5
	movw	r2, #669
	ldr	r1, .L314+4
	ldr	r0, .L314+12
	bl	printk
.L304:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L315:
	.align	2
.L314:
	.word	hal_h264e_debug
	.word	.LANCHOR0+342
	.word	.LC0
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_prepare, .-hal_h264e_vepu540c_prepare
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_wait, %function
hal_h264e_vepu540c_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r5, .L329
	ldr	r2, [r5]
	lsls	r2, r2, #30
	bpl	.L317
	mov	r3, r0
	movw	r2, #2649
	ldr	r1, .L329+4
	ldr	r0, .L329+8
	bl	printk
.L317:
	movs	r2, #0
	movs	r1, #6
	ldr	r0, [r6, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L318
	mov	r3, r0
	movw	r2, #2652
	ldr	r1, .L329+4
	mvn	r4, #1008
	ldr	r0, .L329+12
	bl	printk
.L318:
	ldr	r3, [r5]
	lsls	r3, r3, #30
	bpl	.L316
	mov	r3, r6
	movw	r2, #2655
	ldr	r1, .L329+4
	ldr	r0, .L329+16
	bl	printk
.L316:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L330:
	.align	2
.L329:
	.word	hal_h264e_debug
	.word	.LANCHOR0+369
	.word	.LC0
	.word	.LC24
	.word	.LC9
	.fnend
	.size	hal_h264e_vepu540c_wait, .-hal_h264e_vepu540c_wait
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu540c_gen_regs, %function
hal_h264e_vepu540c_gen_regs:
	.fnstart
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #148
	sub	sp, sp, #148
	ldr	r3, [r1, #4]
	mov	r5, r0
	ldr	r4, [r0, #308]
	ldr	r10, [r0]
	ldrd	fp, r6, [r0, #160]
	ldr	r9, [r0, #168]
	ldr	r0, [r1, #52]
	str	r3, [sp, #76]
	str	r1, [sp, #24]
	bl	mpp_frame_get_is_full
	ldr	r7, .L740
	ldr	r3, [r7]
	str	r0, [sp, #84]
	lsls	r0, r3, #30
	bpl	.L332
	mov	r3, r5
	movw	r2, #2367
	ldr	r1, .L740+4
	ldr	r0, .L740+8
	bl	printk
.L332:
	ldr	r3, [r7]
	lsls	r1, r3, #28
	bpl	.L333
	ldr	r3, [r5, #172]
	mov	r2, #2368
	ldr	r1, .L740+4
	ldr	r0, .L740+12
	ldr	r3, [r3]
	bl	printk
.L333:
	movw	r2, #6200
	movs	r1, #0
	mov	r0, r4
	bl	memset
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L334
	movw	r2, #753
	ldr	r1, .L740+16
	ldr	r0, .L740+20
	bl	printk
.L334:
	ldrh	r3, [r4, #16]
	movs	r2, #0
	strh	r2, [r4, #36]	@ movhi
	and	r3, r3, #64512
	orr	r3, r3, #256
	strh	r3, [r4, #16]	@ movhi
	ldrb	r3, [r4, #20]	@ zero_extendqisi2
	bic	r3, r3, #3
	strb	r3, [r4, #20]
	movw	r3, #32767
	strh	r3, [r4, #32]	@ movhi
	mov	r3, #28672
	str	r3, [r4, #48]
	ldrh	r3, [r4, #54]
	bfi	r3, r2, #0, #10
	strh	r3, [r4, #54]	@ movhi
	movw	r3, #65535
	str	r3, [r4, #56]
	ldrb	r3, [r4, #84]	@ zero_extendqisi2
	bic	r3, r3, #7
	orr	r3, r3, #7
	strb	r3, [r4, #84]
	mov	r3, #-1
	str	r3, [r4, #88]
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L335
	movw	r2, #830
	ldr	r1, .L740+16
	ldr	r0, .L740+24
	bl	printk
.L335:
	ldr	r3, [r10, #36]
	add	r0, sp, #108
	mov	r1, r3
	str	r3, [sp, #36]
	bl	vepu541_set_fmt
	ldr	r3, [r7]
	str	r0, [sp, #80]
	lsls	r0, r3, #30
	ldr	r8, [sp, #108]
	bpl	.L336
	movw	r2, #843
	ldr	r1, .L740+28
	ldr	r0, .L740+20
	bl	printk
.L336:
	ldr	r3, [sp, #80]
	cmp	r3, #0
	bne	.L331
	ldr	r3, [r10, #12]
	ldrh	r2, [r4, #260]
	adds	r3, r3, #15
	bics	r3, r3, #15
	it	mi
	addmi	r3, r3, #7
	asrs	r3, r3, #3
	subs	r3, r3, #1
	bfi	r2, r3, #0, #11
	strh	r2, [r4, #260]	@ movhi
	ldrsb	r2, [r10, #12]
	add	r3, r2, #15
	bic	r3, r3, #15
	subs	r3, r3, r2
	ldrb	r2, [r4, #264]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #264]
	ldr	r3, [r10, #16]
	ldrh	r2, [r4, #262]
	adds	r3, r3, #15
	bics	r3, r3, #15
	it	mi
	addmi	r3, r3, #7
	asrs	r3, r3, #3
	subs	r3, r3, #1
	bfi	r2, r3, #0, #11
	strh	r2, [r4, #262]	@ movhi
	ldrsb	r2, [r10, #16]
	add	r3, r2, #15
	bic	r3, r3, #15
	subs	r3, r3, r2
	ldrb	r2, [r4, #266]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #266]
	ldr	r2, [sp, #124]
	ldrb	r3, [r4, #48]	@ zero_extendqisi2
	bfi	r3, r2, #4, #4
	strb	r3, [r4, #48]
	ldrb	r3, [r4, #268]	@ zero_extendqisi2
	bfi	r3, r8, #2, #4
	strb	r3, [r4, #268]
	ldr	r2, [sp, #112]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #268]
	ldr	r2, [sp, #116]
	bfi	r3, r2, #1, #1
	orn	r3, r3, #127
	strb	r3, [r4, #268]
	ldr	r3, [sp, #36]
	tst	r3, #15728640
	beq	.L340
	ldr	r3, [r10, #12]
	adds	r3, r3, #15
	bic	r3, r3, #15
.L341:
	sub	r2, r8, #4
	cmp	r2, #9
	bhi	.L343
	tbh	[pc, r2, lsl #1]
.L351:
	.2byte	(.L549-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L549-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L343-.L351)/2
	.2byte	(.L349-.L351)/2
	.2byte	(.L549-.L351)/2
	.p2align 1
.L741:
	.align	2
.L740:
	.word	hal_h264e_debug
	.word	.LANCHOR0+393
	.word	.LC0
	.word	.LC25
	.word	.LANCHOR0+421
	.word	.LC26
	.word	.LC27
	.word	.LANCHOR0+443
.L340:
	ldr	r3, [r10, #20]
	cmp	r3, #0
	bne	.L341
	ldr	r3, [r10, #12]
	cmp	r8, #0
	bne	.L342
	lsls	r3, r3, #2
.L343:
	add	r2, r3, r3, lsr #31
	mov	r1, r3
	asrs	r3, r2, #1
.L350:
	cmp	r8, #2
	bhi	.L550
	ldr	r2, [r4, #272]
	and	r0, r2, #-134217728
	ldr	r2, .L742
	orrs	r2, r2, r0
	str	r2, [r4, #272]
	ldr	r2, [r4, #276]
	and	r0, r2, #-134217728
	ldr	r2, .L742+4
	orrs	r2, r2, r0
	str	r2, [r4, #276]
	ldr	r2, [r4, #280]
	and	r0, r2, #-134217728
	ldr	r2, .L742+8
	orrs	r2, r2, r0
	str	r2, [r4, #280]
	ldr	r2, [r4, #284]
	lsrs	r2, r2, #21
	lsls	r2, r2, #21
	orr	r2, r2, #32768
	orr	r2, r2, #128
	str	r2, [r4, #284]
.L352:
	ldr	r2, [r4, #296]
	strh	r3, [r4, #300]	@ movhi
	bfi	r2, r1, #0, #17
	str	r2, [r4, #296]
	ldr	r3, [r10, #60]
	ldr	r7, .L742+12
	cmp	r3, #0
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #291]
	ldr	r2, [r10, #56]
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #291]
	ldr	r2, [r7]
	ldrh	r3, [r4, #484]
	lsls	r1, r2, #30
	and	r3, r3, #16384
	strh	r3, [r4, #484]	@ movhi
	ldr	r3, [r4, #292]
	and	r3, r3, #-1073692672
	str	r3, [r4, #292]
	bpl	.L353
	mov	r2, #944
	ldr	r1, .L742+16
	ldr	r0, .L742+20
	bl	printk
.L353:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L546
	mov	r2, #952
	ldr	r1, .L742+24
	ldr	r0, .L742+28
	bl	printk
.L546:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	bfc	r3, #0, #2
	strb	r3, [r4, #244]
	ldr	r3, [r9, #32]
	cmp	r3, #0
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	orr	r3, r3, #16
	strb	r3, [r4, #244]
	ldrb	r3, [r4, #420]	@ zero_extendqisi2
	ldr	r2, [r9, #32]
	bfi	r3, r2, #0, #2
	strb	r3, [r4, #420]
	ldr	r2, [r9, #36]
	bfi	r3, r2, #2, #5
	strb	r3, [r4, #420]
	ldrb	r3, [r4, #424]	@ zero_extendqisi2
	ldr	r2, [fp, #40]
	bfi	r3, r2, #0, #4
	strb	r3, [r4, #424]
	ldr	r2, [fp, #72]
	bfi	r3, r2, #4, #1
	strb	r3, [r4, #424]
	ldr	r2, [fp, #48]
	ldrh	r3, [r4, #424]
	bfi	r3, r2, #5, #4
	strh	r3, [r4, #424]	@ movhi
	ldrb	r3, [r4, #428]	@ zero_extendqisi2
	ldr	r2, [r6, #8]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #428]
	ldr	r2, [r6, #68]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #428]
	ldr	r2, [r6, #60]
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #428]
	ldr	r3, [r6, #20]
	ldrb	r2, [r4, #428]	@ zero_extendqisi2
	subs	r3, r3, #1
	bfi	r2, r3, #3, #2
	strb	r2, [r4, #428]
	ldr	r3, [r6, #24]
	uxtb	r2, r2
	subs	r3, r3, #1
	bfi	r2, r3, #5, #2
	strb	r2, [r4, #428]
	ldr	r2, [r6, #36]
	ldrh	r3, [r4, #428]
	bfi	r3, r2, #7, #6
	strh	r3, [r4, #428]	@ movhi
	ldr	r2, [r6, #44]
	ldr	r3, [r4, #428]
	bfi	r3, r2, #13, #5
	str	r3, [r4, #428]
	ldr	r2, [r6, #52]
	ubfx	r3, r3, #16, #8
	bfi	r3, r2, #2, #5
	strb	r3, [r4, #430]
	ldrb	r3, [r4, #431]	@ zero_extendqisi2
	ldr	r2, [r6, #56]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #431]
	ldr	r3, [r9, #44]
	cmp	r3, #2
	ldrb	r3, [r4, #432]	@ zero_extendqisi2
	ite	eq
	moveq	r2, #2
	movne	r2, #0
	bfi	r3, r2, #0, #2
	strb	r3, [r4, #432]
	ldr	r2, [r9, #52]
	ldrh	r3, [r4, #432]
	bfi	r3, r2, #2, #8
	strh	r3, [r4, #432]	@ movhi
	ubfx	r3, r3, #8, #8
	bfc	r3, #2, #1
	strb	r3, [r4, #433]
	ldr	r2, [r9, #60]
	bfi	r3, r2, #3, #1
	strb	r3, [r4, #433]
	ldr	r2, [r9, #68]
	bfi	r3, r2, #4, #2
	strb	r3, [r4, #433]
	ldr	r3, [r9, #56]
	strh	r3, [r4, #434]	@ movhi
	ldr	r3, [r9, #44]
	cmp	r3, #2
	ite	eq
	ldrheq	r3, [r9, #100]
	movwne	r3, #65535
	strh	r3, [r4, #436]	@ movhi
	ldr	r3, [r9, #108]
	strh	r3, [r4, #438]	@ movhi
	ldrb	r3, [r4, #441]	@ zero_extendqisi2
	ldr	r2, [r9, #72]
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #441]
	ldr	r2, [r9, #76]
	ldrh	r3, [r4, #440]
	bfi	r3, r2, #7, #4
	strh	r3, [r4, #440]	@ movhi
	ldr	r0, [r9, #88]
	bl	h264e_reorder_rd_rewind
	ldr	r0, [r9, #88]
	add	r1, sp, #108
	bl	h264e_reorder_rd_op
	cmp	r0, #0
	bne	.L356
	ldrb	r3, [r4, #440]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #440]
	ldr	r3, [sp, #108]
	ldrb	r2, [r4, #440]	@ zero_extendqisi2
	cmp	r3, #0
	bfi	r2, r3, #0, #2
	strb	r2, [r4, #440]
	blt	.L357
	cmp	r3, #1
	ble	.L358
	cmp	r3, #2
	beq	.L359
.L357:
	movw	r2, #1025
	ldr	r1, .L742+24
	ldr	r0, .L742+32
	bl	printk
	b	.L360
.L342:
	cmp	r8, #1
	bne	.L344
	add	r3, r3, r3, lsl #1
	b	.L343
.L344:
	cmp	r8, #2
	beq	.L345
	sub	r2, r8, #8
	cmp	r2, #1
	bhi	.L346
.L345:
	lsls	r3, r3, #1
	b	.L341
.L346:
	sub	r2, r8, #4
	cmp	r2, #9
	bhi	.L343
	adr	r1, .L348
	ldr	pc, [r1, r2, lsl #2]
	.p2align 2
.L348:
	.word	.L548+1
	.word	.L343+1
	.word	.L548+1
	.word	.L343+1
	.word	.L343+1
	.word	.L343+1
	.word	.L343+1
	.word	.L343+1
	.word	.L349+1
	.word	.L548+1
	.p2align 1
.L349:
	lsls	r7, r3, #1
.L347:
	ldr	r2, [sp, #128]
	ldrh	r0, [r4, #272]
	ldr	r1, [r2]
	bfi	r0, r1, #0, #9
	strh	r0, [r4, #272]	@ movhi
	ldr	r1, [r2, #4]
	ldr	r0, [r4, #272]
	bfi	r0, r1, #9, #9
	str	r0, [r4, #272]
	ldr	r1, [r2, #8]
	ubfx	r0, r0, #16, #16
	bfi	r0, r1, #2, #9
	strh	r0, [r4, #274]	@ movhi
	ldrh	r0, [r4, #276]
	ldr	r1, [r2, #12]
	bfi	r0, r1, #0, #9
	strh	r0, [r4, #276]	@ movhi
	ldr	r1, [r2, #16]
	ldr	r0, [r4, #276]
	bfi	r0, r1, #9, #9
	str	r0, [r4, #276]
	ldr	r1, [r2, #20]
	ubfx	r0, r0, #16, #16
	bfi	r0, r1, #2, #9
	strh	r0, [r4, #278]	@ movhi
	ldrh	r0, [r4, #280]
	ldr	r1, [r2, #24]
	bfi	r0, r1, #0, #9
	strh	r0, [r4, #280]	@ movhi
	ldr	r0, [r2, #28]
	ldr	r1, [r4, #280]
	bfi	r1, r0, #9, #9
	str	r1, [r4, #280]
	ldr	r2, [r2, #32]
	ubfx	r1, r1, #16, #16
	ldrb	r0, [r4, #286]	@ zero_extendqisi2
	bfi	r1, r2, #2, #9
	strh	r1, [r4, #282]	@ movhi
	ldr	r2, [sp, #132]
	ldr	r1, [r2]
	bfi	r0, r1, #0, #5
	strb	r0, [r4, #286]
	ldr	r1, [r2, #4]
	strb	r1, [r4, #285]
	mov	r1, r3
	ldr	r2, [r2, #8]
	mov	r3, r7
	strb	r2, [r4, #284]
	b	.L352
.L549:
	mov	r1, r3
	b	.L350
.L743:
	.align	2
.L742:
	.word	20261917
	.word	123164288
	.word	33762283
	.word	hal_h264e_debug
	.word	.LANCHOR0+443
	.word	.LC27
	.word	.LANCHOR0+463
	.word	.LC26
	.word	.LC28
.L548:
	mov	r7, r3
	b	.L347
.L550:
	mov	r7, r3
	mov	r3, r1
	b	.L347
.L358:
	ldr	r3, [sp, #112]
.L724:
	strh	r3, [r4, #442]	@ movhi
.L360:
	ldr	r3, [r4, #444]
	and	r3, r3, #-536870912
	str	r3, [r4, #444]
	movs	r3, #0
	str	r3, [r4, #448]
	ldrh	r3, [r4, #452]
	and	r3, r3, #61440
	strh	r3, [r4, #452]	@ movhi
	ldr	r0, [r9, #92]
	bl	h264e_marking_rd_rewind
	ldr	r3, [r9, #44]
	cmp	r3, #2
	bne	.L361
	ldr	r2, [r9, #116]
	ldrb	r3, [r4, #444]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #444]
	ldr	r2, [r9, #120]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #444]
.L362:
	ldr	r3, .L744
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #2
	beq	.L390
	movw	r2, #1234
	ldr	r1, .L744+4
	ldr	r0, .L744+8
	bl	printk
.L390:
	ldr	r3, [r8]
	ldr	r7, [r5, #308]
	lsls	r3, r3, #30
	bpl	.L391
	movw	r2, #1241
	ldr	r1, .L744+12
	ldr	r0, .L744+16
	bl	printk
.L391:
	ldr	r3, [r9, #44]
	cmp	r3, #2
	bne	.L392
	ldrb	r3, [r7, #756]	@ zero_extendqisi2
	movs	r2, #6
.L725:
	bfi	r3, r2, #0, #4
	strb	r3, [r7, #756]
	ldr	r3, [fp]
	cmp	r3, #66
	bne	.L557
	ldr	r3, [fp, #28]
	cmp	r3, #30
	ite	gt
	movgt	r3, #0
	movle	r3, #1
.L395:
	ldrb	r2, [r7, #404]	@ zero_extendqisi2
	bfi	r2, r3, #0, #1
	strb	r2, [r7, #404]
	ldr	r3, [fp]
	ldrb	r2, [r7, #404]	@ zero_extendqisi2
	cmp	r3, #76
	itett	le
	ldrle	r3, [r6, #8]
	movgt	r3, #0
	clzle	r3, r3
	lsrle	r3, r3, #5
	bfi	r2, r3, #3, #1
	strb	r2, [r7, #404]
	ldrh	r3, [r7, #404]
	orr	r3, r3, #8192
	orr	r3, r3, #16
	strh	r3, [r7, #404]	@ movhi
	ldrb	r3, [r7, #406]	@ zero_extendqisi2
	ldr	r2, [r6, #72]
	bfi	r3, r2, #4, #2
	strb	r3, [r7, #406]
	ldr	r2, [r5]
	movw	r3, #4732
	ldr	r3, [r2, r3]
	ldrb	r2, [r7, #407]	@ zero_extendqisi2
	subs	r6, r3, #1
	rsbs	r3, r6, #0
	adcs	r3, r3, r6
	bfi	r2, r3, #4, #1
	strb	r2, [r7, #407]
	ldr	r3, [r7, #404]
	orr	r3, r3, #536870912
	orr	r3, r3, #32768
	str	r3, [r7, #404]
	ldrh	r3, [r7, #408]
	bfc	r3, #0, #9
	strh	r3, [r7, #408]	@ movhi
	ldr	r3, [r8]
	lsls	r7, r3, #30
	bpl	.L397
	movw	r2, #1263
	ldr	r1, .L744+12
	ldr	r0, .L744+8
	bl	printk
.L397:
	ldr	r3, [r5, #168]
	ldr	r6, [r5, #308]
	ldr	r8, [r5, #904]
	str	r3, [sp, #36]
	ldr	r3, [sp, #24]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_ppinfo
	ldr	r3, .L744
	ldr	r3, [r3]
	mov	r7, r0
	lsls	r0, r3, #30
	bpl	.L398
	movw	r2, #1278
	ldr	r1, .L744+20
	ldr	r0, .L744+16
	bl	printk
.L398:
	ldr	r2, [r5]
	movw	r3, #4732
	ldr	r3, [r2, r3]
	cmp	r3, #1
	ldrh	r3, [r6, #1644]
	and	r3, r3, #32512
	bne	.L399
	orr	r3, r3, #32768
	orr	r3, r3, #9
	strh	r3, [r6, #1644]	@ movhi
	ldr	r3, [r5, #952]
	cbz	r3, .L400
	movs	r3, #16
	strb	r3, [r6, #1644]
.L400:
	ldr	r2, [r5, #928]
	ldrd	r3, r1, [r5, #920]
	add	r3, r3, r1
	cmp	r3, r2, lsr #1
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	cmp	r2, r8, lsr #8
	bcs	.L401
	subs	r3, r3, #8
.L402:
	ldrb	r2, [r6, #1645]	@ zero_extendqisi2
	bfi	r2, r3, #0, #4
	mov	r3, r2
	bfc	r3, #4, #1
	strb	r3, [r6, #1645]
	ldr	r3, [sp, #36]
	ldr	r3, [r3, #44]
	cmp	r3, #2
	ldrb	r3, [r6, #1645]	@ zero_extendqisi2
	bne	.L405
.L739:
	movs	r2, #1
.L726:
	bfi	r3, r2, #5, #2
	ldr	r1, .L744+24
	strb	r3, [r6, #1645]
	ldr	r3, [r6, #1628]
	ldrh	r2, [r6, #1624]
	ands	r1, r1, r3
	ldr	r3, .L744+28
	bic	r2, r2, #1016
	orrs	r3, r3, r1
	ldr	r1, [r6, #1632]
	str	r3, [r6, #1628]
	orr	r2, r2, #256
	ldr	r3, .L744+32
	strh	r2, [r6, #1624]	@ movhi
	ands	r3, r3, r1
	str	r3, [r6, #1632]
	ldrh	r3, [r6, #1646]
	and	r3, r3, #14
	orr	r3, r3, #1
	strh	r3, [r6, #1646]	@ movhi
	cmp	r7, #0
	bne	.L408
.L409:
	ldr	r3, [r6, #1648]
	and	r3, r3, #-268374016
	orr	r3, r3, #1572864
	str	r3, [r6, #1648]
	ldr	r3, [r6, #1652]
	and	r3, r3, #-268374016
	orr	r3, r3, #4194304
	orr	r3, r3, #48
	str	r3, [r6, #1652]
	ldr	r3, [r6, #1656]
	and	r3, r3, #-268374016
	orr	r3, r3, #2097152
	orr	r3, r3, #16
	str	r3, [r6, #1656]
	ldr	r3, [r6, #1660]
	and	r3, r3, #-268374016
	orr	r3, r3, #6291456
	orr	r3, r3, #48
	str	r3, [r6, #1660]
	ldr	r3, [r6, #1664]
	and	r3, r3, #-268374016
	orr	r3, r3, #1572864
	orr	r3, r3, #48
	str	r3, [r6, #1664]
	ldr	r3, [r6, #1668]
	and	r3, r3, #-268374016
	orr	r3, r3, #3145728
	orr	r3, r3, #96
	str	r3, [r6, #1668]
	ldr	r3, [r6, #1672]
	and	r3, r3, #-252645136
	orr	r3, r3, #16843009
	orr	r3, r3, #33554944
	str	r3, [r6, #1672]
	ldr	r3, [r6, #1676]
	and	r3, r3, #-252645136
	orr	r3, r3, #67109888
	orr	r3, r3, #65537
	str	r3, [r6, #1676]
	ldr	r3, [r6, #1680]
	and	r3, r3, #-252645136
	orr	r3, r3, #50332416
	str	r3, [r6, #1680]
	ldrh	r3, [r6, #1684]
	bic	r3, r3, #3840
	bic	r3, r3, #15
	orr	r3, r3, #768
	orr	r3, r3, #1
	strh	r3, [r6, #1684]	@ movhi
	ldr	r3, [r6, #1688]
	and	r3, r3, #-1061109568
	orr	r3, r3, #150997248
	orr	r3, r3, #393222
	str	r3, [r6, #1688]
	ldr	r3, [r6, #1692]
	and	r2, r3, #-1061109568
	ldr	r3, .L744+36
	orrs	r3, r3, r2
	str	r3, [r6, #1692]
	ldr	r3, [r6, #1696]
	and	r2, r3, #-1061109568
	ldr	r3, .L744+40
	orrs	r3, r3, r2
	str	r3, [r6, #1696]
	ldrh	r3, [r6, #1700]
	bic	r3, r3, #16128
	bic	r3, r3, #63
	orr	r3, r3, #4096
	orr	r3, r3, #7
	strh	r3, [r6, #1700]	@ movhi
	ldr	r3, [r6, #1704]
	and	r3, r3, #-16711936
	orr	r3, r3, #393216
	orr	r3, r3, #10
	str	r3, [r6, #1704]
	ldr	r3, [r6, #1708]
	and	r2, r3, #-16777216
	ldr	r3, .L744+44
	orrs	r3, r3, r2
	str	r3, [r6, #1708]
	ldr	r3, [r6, #1736]
	and	r3, r3, #-268374016
	orr	r3, r3, #655360
	orr	r3, r3, #1
	str	r3, [r6, #1736]
	ldr	r3, [r6, #1740]
	and	r3, r3, #-268374016
	orr	r3, r3, #1638400
	orr	r3, r3, #15
	str	r3, [r6, #1740]
	ldr	r3, .L744+48
	str	r3, [r6, #1744]
	movs	r3, #16
	strb	r3, [r6, #1748]
	ldr	r3, [r5, #952]
	cbz	r3, .L410
	ldrh	r3, [r6, #1738]
	movs	r2, #7
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #1738]	@ movhi
	movs	r3, #14
	strb	r3, [r6, #1745]
.L410:
	ldr	r3, [r6, #1764]
	movs	r1, #72
	ldr	r0, .L744+52
	mov	r2, #269488144
	and	r3, r3, #-268374016
	str	r2, [r6, #1772]
	orrs	r3, r3, r0
	str	r3, [r6, #1764]
	ldrh	r3, [r6, #1768]
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1768]	@ movhi
	ldr	r3, [r6, #1788]
	and	r3, r3, #-268374016
	b	.L745
.L746:
	.align	2
.L744:
	.word	hal_h264e_debug
	.word	.LANCHOR0+463
	.word	.LC27
	.word	.LANCHOR0+484
	.word	.LC26
	.word	.LANCHOR0+508
	.word	-536346112
	.word	1049601
	.word	-267648256
	.word	134613766
	.word	335942665
	.word	11088209
	.word	269488148
	.word	2621460
.L745:
	orrs	r3, r3, r0
	str	r3, [r6, #1788]
	ldrh	r3, [r6, #1792]
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1792]	@ movhi
	ldr	r3, .L747
	str	r3, [r6, #1796]
	ldr	r3, [r6, #1804]
	and	r3, r3, #-252645136
	orr	r3, r3, #67109888
	orr	r3, r3, #65537
	str	r3, [r6, #1804]
	ldr	r3, [r6, #1808]
	and	r1, r3, #-1061109568
	ldr	r3, .L747+4
	orrs	r3, r3, r1
	str	r3, [r6, #1808]
	ldr	r1, [r5]
	movw	r3, #4732
	ldr	r3, [r1, r3]
	cmp	r3, #1
	ittt	ne
	strne	r2, [r6, #1796]
	movne	r3, #16
	strbne	r3, [r6, #1744]
	ldr	r6, .L747+8
	ldr	r3, [r6]
	lsls	r2, r3, #30
	bpl	.L412
	movw	r2, #1450
	ldr	r1, .L747+12
	ldr	r0, .L747+16
	bl	printk
.L412:
	ldr	r3, [r6]
	ldr	r7, [r5, #308]
	lsls	r3, r3, #30
	bpl	.L413
	movw	r2, #1514
	ldr	r1, .L747+20
	ldr	r0, .L747+24
	bl	printk
.L413:
	ldr	r3, [r5, #164]
	add	r0, r7, #1912
	mov	r2, #2304
	ldr	r3, [r3, #72]
	cmp	r3, #2
	bne	.L414
	ldr	r1, .L747+28
.L727:
	bl	memcpy
	ldr	r3, [r6]
	lsls	r0, r3, #30
	bpl	.L417
	movw	r2, #1523
	ldr	r1, .L747+20
	ldr	r0, .L747+16
	bl	printk
.L417:
	ldr	r3, [sp, #24]
	ldr	r8, [fp, #60]
	ldr	r1, [fp, #64]
	ldr	r3, [r3, #4]
	mul	r1, r1, r8
	ldr	r2, [r3, #172]
	ldr	r7, [r3, #160]
	str	r2, [sp, #36]
	ldr	r2, [r3, #180]
	lsls	r0, r7, #4
	str	r2, [sp, #56]
	ldr	r2, [r3, #176]
	str	r2, [sp, #60]
	bl	__aeabi_idiv
	ldr	r3, .L747+8
	ldr	r6, [r5, #308]
	ldr	r3, [r3]
	lsls	r1, r3, #23
	mov	fp, r0
	bpl	.L418
	ldr	r3, [sp, #60]
	movw	r2, #1545
	ldr	r1, .L747+32
	ldr	r0, .L747+36
	str	r3, [sp, #8]
	ldr	r3, [sp, #36]
	str	r3, [sp, #4]
	ldr	r3, [sp, #56]
	str	r3, [sp]
	mov	r3, r7
	bl	printk
.L418:
	cmp	fp, #1048576
	ldr	r2, .L747+8
	it	ge
	movge	fp, #327680
	mul	r7, fp, r8
	ldr	r2, [r2]
	asrs	r7, r7, #4
	add	r7, r7, r7, lsl #2
	cmp	r7, #0
	mov	r3, r7
	it	lt
	addlt	r3, r7, #15
	cmp	r7, #0
	it	lt
	addlt	r7, r7, #15
	lsls	r2, r2, #30
	asr	r3, r3, #4
	rsb	r3, r3, #0
	asr	r7, r7, #4
	bpl	.L422
	movw	r2, #1554
	ldr	r1, .L747+32
	ldr	r0, .L747+24
	str	r3, [sp, #72]
	bl	printk
	ldr	r3, [sp, #72]
.L422:
	ldr	r1, [sp, #36]
	ldrb	r2, [r6, #245]	@ zero_extendqisi2
	bfi	r2, r1, #0, #6
	strb	r2, [r6, #245]
	ldrb	r2, [r6, #324]	@ zero_extendqisi2
	ldrb	r1, [r6, #330]	@ zero_extendqisi2
	bic	r2, r2, #7
	orr	r2, r2, #3
	strb	r2, [r6, #324]
	ldr	r2, [r6, #324]
	bfi	r2, r8, #12, #20
	str	r2, [r6, #324]
	ldr	r2, [r9, #44]
	cmp	r2, #2
	ite	eq
	ldreq	r2, [r10, #312]
	ldrne	r2, [r10, #308]
	and	r2, r2, #15
	bfi	r1, r2, #0, #4
	strb	r1, [r6, #330]
	ldr	r2, [r5, #952]
	cbz	r2, .L425
	uxtb	r2, r1
	bfc	r2, #0, #4
	strb	r2, [r6, #330]
.L425:
	ldr	r2, [sp, #60]
	ldrh	r1, [r6, #330]
	and	r8, r2, #63
	str	r7, [r6, #648]
	bfi	r1, r8, #4, #6
	strh	r1, [r6, #330]	@ movhi
	ldr	r2, [sp, #56]
	ubfx	r1, r1, #8, #8
	lsls	r7, r7, #2
	str	r7, [r6, #652]
	and	r2, r2, #63
	bfi	r1, r2, #2, #6
	strb	r1, [r6, #331]
	ldr	r1, [r6, #332]
	bfi	r1, fp, #0, #20
	str	r1, [r6, #332]
	ldr	r1, [r6, #632]
	and	r0, r1, #-33554432
	ldr	r1, .L747+40
	orrs	r1, r1, r0
	str	r1, [r6, #632]
	ldr	r1, [r6, #636]
	lsrs	r1, r1, #20
	lsls	r1, r1, #20
	str	r1, [r6, #636]
	lsls	r1, r3, #2
	strd	r1, r3, [r6, #640]
	mvn	r3, #-2147483648
	strd	r3, r3, [r6, #656]
	strd	r3, r3, [r6, #664]
	str	r3, [r6, #672]
	ldrb	r3, [r6, #680]	@ zero_extendqisi2
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #680]
	ldrh	r3, [r6, #680]
	bfi	r3, r8, #6, #6
	strh	r3, [r6, #680]	@ movhi
	ldr	r3, [r6, #680]
	bfi	r3, r2, #12, #6
	str	r3, [r6, #680]
	ubfx	r1, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #683]
	ldrb	r3, [r6, #684]	@ zero_extendqisi2
	bfi	r1, r8, #2, #6
	strb	r1, [r6, #682]
	bfi	r3, r8, #0, #6
	strb	r3, [r6, #684]
	ldrh	r3, [r6, #684]
	bfi	r3, r2, #6, #6
	strh	r3, [r6, #684]	@ movhi
	ldr	r3, [r6, #684]
	bfi	r3, r8, #12, #6
	str	r3, [r6, #684]
	ubfx	r1, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r3, r8, #0, #6
	strb	r3, [r6, #687]
	ldrb	r3, [r6, #688]	@ zero_extendqisi2
	bfi	r1, r2, #2, #6
	strb	r1, [r6, #686]
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #688]
	ldrh	r3, [r6, #688]
	bfi	r3, r8, #6, #6
	strh	r3, [r6, #688]	@ movhi
	ldr	r3, [r6, #688]
	bfi	r3, r2, #12, #6
	str	r3, [r6, #688]
	ubfx	r1, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #691]
	ldrb	r3, [r6, #692]	@ zero_extendqisi2
	movs	r2, #1
	bfi	r1, r8, #2, #6
	strb	r1, [r6, #690]
	bfi	r3, r8, #0, #6
	strb	r3, [r6, #692]
	ldrb	r3, [r6, #695]	@ zero_extendqisi2
	bfi	r3, r2, #6, #2
	strb	r3, [r6, #695]
	ldr	r3, .L747+8
	ldr	r3, [r3]
	lsls	r6, r3, #30
	bpl	.L426
	movw	r2, #1613
	ldr	r1, .L747+32
	ldr	r0, .L747+16
	bl	printk
.L426:
	ldr	r3, [r5, #4]
	ldr	r6, [r5, #308]
	str	r3, [sp, #72]
	ldr	r3, [sp, #24]
	ldr	fp, [r3, #52]
	ldr	r8, [r3, #28]
	mov	r0, fp
	bl	mpp_frame_get_buffer
	ldr	r3, [sp, #24]
	str	r0, [sp, #88]
	mov	r0, fp
	ldr	r7, [r3, #32]
	bl	mpp_frame_get_fmt
	str	r0, [sp, #100]
	mov	r0, fp
	bl	mpp_frame_get_hor_stride
	str	r0, [sp, #36]
	mov	r0, fp
	bl	mpp_frame_get_ver_stride
	str	r0, [sp, #56]
	mov	r0, r8
	bl	mpp_packet_get_length
	ldr	r3, [r7, #24]
	str	r3, [sp, #92]
	ldr	r3, [sp, #24]
	str	r0, [sp, #60]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_is_full
	ldr	r2, .L747+8
	ldr	r2, [r2]
	tst	r2, #2
	str	r0, [sp, #96]
	ldr	r3, [sp, #100]
	beq	.L427
	movw	r2, #1633
	ldr	r1, .L747+44
	ldr	r0, .L747+24
	bl	printk
	ldr	r3, [sp, #100]
	b	.L748
.L749:
	.align	2
.L747:
	.word	269752603
	.word	134746128
	.word	hal_h264e_debug
	.word	.LANCHOR0+508
	.word	.LC27
	.word	.LANCHOR0+531
	.word	.LC26
	.word	vepu540c_h264_customer_scl_tab
	.word	.LANCHOR0+554
	.word	.LC30
	.word	2130942
	.word	.LANCHOR0+577
.L748:
.L427:
	ands	r8, r3, #15728640
	beq	.L428
	mov	r0, fp
	bl	mpp_frame_get_fbc_offset
	mov	r8, r0
.L729:
	mov	fp, #0
.L429:
	ldr	r3, [r5, #940]
	ldr	r2, [sp, #96]
	orrs	r3, r2, r3
	beq	.L438
	movs	r3, #0
	strd	r3, r3, [r6, #116]
	str	r3, [r6, #124]
.L439:
	ldr	r3, [r7, #28]
	ldr	r0, [r7]
	cmp	r3, #0
	bne	.L440
	cmp	r0, #0
	beq	.L441
	mov	r1, r0
	movs	r2, #173
	ldr	r0, [sp, #72]
	bl	mpp_dev_get_iova_address
	str	r0, [r6, #168]
.L442:
	ldr	r2, [r7, #12]
	ldr	r3, [r6, #168]
	add	r3, r3, r2
	ldr	r2, [sp, #92]
	str	r3, [r6, #168]
	subs	r2, r2, #1
	str	r3, [r6, #176]
	add	r2, r2, r3
	str	r2, [r6, #164]
	ldr	r2, [sp, #60]
	add	r3, r3, r2
	str	r3, [r6, #172]
.L443:
	ldr	r3, [sp, #60]
	cbz	r3, .L444
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #32]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L445
	ldr	r2, [sp, #60]
	ldr	r1, .L750
	str	r2, [r3, #20]
	ldr	r3, [sp, #24]
	ldr	r0, [r3, #32]
	bl	mpp_buffer_flush_for_device_with_caller
.L444:
	ldr	r3, .L750+4
	ldr	r3, [r3]
	lsls	r0, r3, #30
	bpl	.L446
	movw	r2, #1729
	ldr	r1, .L750+8
	ldr	r0, .L750+12
	bl	printk
.L446:
	ldr	r3, [r5, #940]
	ldr	r2, [sp, #84]
	orrs	r3, r2, r3
	beq	.L447
	ldr	r3, [sp, #24]
	ldr	r6, [r3, #52]
	mov	r0, r6
	bl	mpp_frame_get_is_full
	cmp	r0, #0
	bne	.L448
	add	r2, sp, #108
	movs	r1, #19
	bl	rk_dvbm_ctrl
	ldrb	r3, [r4, #96]	@ zero_extendqisi2
	and	r3, r3, #8
	orn	r3, r3, #120
	strb	r3, [r4, #96]
	ldrh	r3, [r4, #24]
	ldr	r2, [sp, #136]
	bfi	r3, r2, #0, #14
	strh	r3, [r4, #24]	@ movhi
	ldrb	r2, [sp, #132]	@ zero_extendqisi2
	ldr	r3, [r4, #24]
	bfi	r3, r2, #14, #8
	str	r3, [r4, #24]
	strb	r2, [r4, #252]
	lsrs	r3, r3, #24
	bic	r3, r3, #7
	orr	r3, r3, #7
	strb	r3, [r4, #27]
	ldrb	r3, [r4, #254]	@ zero_extendqisi2
	bic	r3, r3, #7
	orr	r3, r3, #5
	strb	r3, [r4, #254]
	ldr	r3, [sp, #108]
	str	r3, [r4, #100]
	ldr	r3, [sp, #120]
	str	r3, [r4, #104]
	ldr	r3, [sp, #112]
	str	r3, [r4, #108]
	ldr	r3, [sp, #124]
	str	r3, [r4, #112]
	ldr	r3, [sp, #116]
	str	r3, [r4, #116]
	ldr	r3, [sp, #128]
	strd	r3, r3, [r4, #120]
.L447:
	ldr	r3, [r5, #4]
	ldr	r8, [r5, #172]
	ldr	r7, [r5, #44]
	str	r3, [sp, #36]
	ldrd	r6, r3, [r5, #12]
	ldr	r1, [r8, #4]
	mov	r0, r6
	str	r3, [sp, #56]
	bl	hal_bufs_get_buf
	ldr	r1, [r8, #20]
	mov	fp, r0
	mov	r0, r6
	bl	hal_bufs_get_buf
	ldr	r3, [sp, #24]
	mov	r8, r0
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_ppinfo
	ldr	r3, .L750+4
	ldr	r3, [r3]
	lsls	r1, r3, #30
	bpl	.L451
	movw	r2, #1745
	ldr	r1, .L750+16
	ldr	r0, .L750+20
	bl	printk
.L451:
	cmp	fp, #0
	beq	.L453
	ldr	r3, [fp]
	cmp	r3, #0
	beq	.L453
	ldr	r3, [fp, #4]
	ldr	r6, [r3]
	cbnz	r6, .L455
	movw	r1, #1749
	ldr	r3, .L750+24
	str	r1, [sp]
	ldr	r2, .L750+28
	ldr	r0, .L750+32
	bl	printk
.L455:
	movs	r2, #169
	mov	r1, r6
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #152]
	cbnz	r7, .L453
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #12]
	str	r3, [sp, #60]
	cbnz	r3, .L456
	movw	r1, #1754
	ldr	r3, .L750+24
	str	r1, [sp]
	ldr	r2, .L750+36
	ldr	r0, .L750+32
	bl	printk
.L456:
	movs	r2, #163
	ldr	r1, [sp, #60]
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	movs	r2, #169
	mov	r1, r6
	ldr	r3, [sp, #56]
	str	r0, [r4, #128]
	add	r0, r0, r3
	str	r0, [r4, #132]
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #152]
.L453:
	cmp	r8, #0
	beq	.L458
	ldr	r3, [r8]
	cbz	r3, .L458
	ldr	r3, [r8, #4]
	ldr	r6, [r3]
	cbnz	r6, .L460
	movw	r1, #1767
	ldr	r3, .L750+24
	str	r1, [sp]
	ldr	r2, .L750+28
	ldr	r0, .L750+32
	bl	printk
.L460:
	movs	r2, #170
	mov	r1, r6
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #156]
	cbnz	r7, .L458
	ldr	r3, [r8, #4]
	ldr	r6, [r3, #12]
	cbnz	r6, .L461
	movw	r1, #1772
	ldr	r3, .L750+24
	str	r1, [sp]
	ldr	r2, .L750+36
	ldr	r0, .L750+32
	bl	printk
.L461:
	movs	r2, #165
	mov	r1, r6
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	ldr	r3, [sp, #56]
	str	r0, [r4, #136]
	add	r3, r3, r0
	str	r3, [r4, #140]
.L458:
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L462
	ldr	r7, [r5, #172]
	movs	r2, #163
	ldr	r1, [r5, #48]
	ldr	r0, [r5, #4]
	ldr	r3, [r7, #8]
	str	r3, [sp, #56]
	ldr	r3, [r7, #24]
	str	r3, [sp, #72]
	ldr	r3, [r7, #12]
	str	r3, [sp, #60]
	bl	mpp_dev_get_iova_address
	ldr	r3, [r7, #16]
	mov	r6, r0
	cmp	r3, #0
	beq	.L463
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne	.L463
	ldr	r3, .L750+4
	ldr	r3, [r3]
	lsls	r2, r3, #24
	bpl	.L464
	ldr	r3, [sp, #56]
	movw	r2, #417
	ldr	r1, .L750+40
	ldr	r0, .L750+44
	bl	printk
.L464:
	ldr	r3, [r5, #76]
	str	r3, [sp, #44]
	ldr	r3, [r5, #80]
	str	r3, [sp, #40]
	ldr	r3, [r5, #124]
	str	r3, [sp, #52]
	ldr	r3, [r5, #128]
	str	r3, [sp, #48]
	ldr	r3, [sp, #56]
	cmp	r3, #0
	beq	.L465
	ldr	r3, [r5, #60]
	ldr	r2, [sp, #44]
	str	r3, [sp, #28]
	ldr	r3, [r5, #108]
	str	r3, [sp, #32]
	ldr	r3, [r5, #52]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r5, #56]
	str	r2, [sp, #44]
	ldr	r2, [sp, #40]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r5, #100]
	str	r2, [sp, #40]
	ldr	r2, [sp, #52]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r5, #104]
	str	r2, [sp, #52]
	ldr	r2, [sp, #48]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [sp, #32]
	str	r2, [sp, #48]
.L730:
	str	r3, [sp, #68]
	ldr	r3, [sp, #28]
	str	r3, [sp, #64]
.L466:
	ldr	r3, [sp, #28]
	ldrb	r2, [r4, #244]	@ zero_extendqisi2
	add	r3, r3, r6
	str	r3, [r4, #128]
	ldr	r3, [sp, #32]
	add	r3, r3, r6
	str	r3, [r4, #132]
	ldr	r3, [sp, #64]
	add	r3, r3, r6
	str	r3, [r4, #136]
	ldr	r3, [sp, #68]
	add	r3, r3, r6
	str	r3, [r4, #140]
	ldr	r3, [sp, #40]
	add	r3, r3, r6
	str	r3, [r4, #196]
	ldr	r3, [sp, #44]
	add	r3, r3, r6
	str	r3, [r4, #200]
	ldr	r3, [sp, #48]
	add	r3, r3, r6
	str	r3, [r4, #204]
	ldr	r3, [sp, #52]
	add	r6, r6, r3
	ldr	r3, [sp, #60]
	str	r6, [r4, #208]
	clz	r3, r3
	ldr	r6, .L750+4
	lsrs	r3, r3, #5
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #244]
	b	.L751
.L752:
	.align	2
.L750:
	.word	.LANCHOR0+599
	.word	hal_h264e_debug
	.word	.LANCHOR0+577
	.word	.LC27
	.word	.LANCHOR0+621
	.word	.LC26
	.word	.LANCHOR0+646
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LANCHOR0+671
	.word	.LC35
.L751:
	ldr	r2, [r6]
	lsls	r7, r2, #24
	bpl	.L547
	movw	r2, #527
	ldr	r1, .L753
	ldr	r0, .L753+4
	bl	printk
	ldr	r3, [r6]
	lsls	r0, r3, #24
	bpl	.L547
	ldr	r3, [r5, #88]
	movw	r2, #529
	ldr	r1, .L753
	ldr	r0, .L753+8
	str	r3, [sp, #12]
	ldr	r3, [r5, #84]
	str	r3, [sp, #8]
	ldr	r3, [r5, #76]
	str	r3, [sp, #4]
	ldr	r3, [r5, #80]
	str	r3, [sp]
	ldr	r3, [r5, #92]
	bl	printk
	ldr	r3, [r6]
	lsls	r1, r3, #24
	bpl	.L547
	ldr	r3, [r5, #136]
	movw	r2, #531
	ldr	r1, .L753
	ldr	r0, .L753+12
	str	r3, [sp, #12]
	ldr	r3, [r5, #132]
	str	r3, [sp, #8]
	ldr	r3, [r5, #124]
	str	r3, [sp, #4]
	ldr	r3, [r5, #128]
	str	r3, [sp]
	ldr	r3, [r5, #140]
	bl	printk
.L547:
	ldr	r3, [sp, #60]
	cbnz	r3, .L482
	ldr	r3, [r5, #84]
	ldr	r2, [r5, #92]
	str	r3, [r5, #88]
	add	r3, r3, r2
	ldr	r2, [r5, #80]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r5, #76]
	addcs	r3, r3, r2
	str	r3, [r5, #84]
	ldr	r3, [r5, #132]
	ldr	r2, [r5, #140]
	str	r3, [r5, #136]
	add	r3, r3, r2
	ldr	r2, [r5, #128]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r5, #124]
	addcs	r3, r3, r2
	str	r3, [r5, #132]
.L482:
	ldr	r3, [fp, #4]
	movs	r2, #185
	ldr	r0, [sp, #36]
	ldr	r6, .L753+16
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	movs	r2, #184
	str	r0, [r4, #216]
	ldr	r3, [r8, #4]
	ldr	r0, [sp, #36]
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	ldr	r3, [r6]
	lsls	r2, r3, #30
	str	r0, [r4, #212]
	bpl	.L485
	movw	r2, #1794
	ldr	r1, .L753+20
	ldr	r0, .L753+24
	bl	printk
.L485:
	ldr	r3, [sp, #24]
	ldr	r1, [r3, #64]
	cmp	r1, #0
	beq	.L562
	movs	r2, #171
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
.L486:
	ldr	r3, [sp, #24]
	str	r0, [r4, #160]
	ldrb	r2, [r4, #244]	@ zero_extendqisi2
	ldr	r3, [r3, #64]
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	bfi	r2, r3, #3, #1
	ldr	r3, [sp, #24]
	strb	r2, [r4, #244]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r3, [r4, #294]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #294]	@ movhi
	ldr	r3, [sp, #24]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r3, [r4, #292]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #292]	@ movhi
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L487
	mov	r2, #1800
	ldr	r1, .L753+28
	ldr	r0, .L753+32
	bl	printk
.L487:
	ldr	r3, [r10, #3428]
	cmp	r3, #1
	beq	.L488
	cmp	r3, #0
	beq	.L489
	cmp	r3, #2
	beq	.L490
	movw	r2, #1842
	ldr	r1, .L753+28
	ldr	r0, .L753+36
	bl	printk
	b	.L492
.L359:
	ldr	r3, [sp, #116]
	b	.L724
.L356:
	ldr	r3, [r4, #440]
	bic	r3, r3, #7
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	str	r3, [r4, #440]
	b	.L360
.L361:
	ldr	r0, [r9, #92]
	bl	h264e_marking_is_empty
	mov	r7, r0
	cmp	r0, #0
	bne	.L362
	ldrb	r3, [r4, #444]	@ zero_extendqisi2
	add	r1, sp, #108
	orr	r3, r3, #4
	strb	r3, [r4, #444]
	ldr	r0, [r9, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #108]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L363
	tbb	[pc, r2]
.L365:
	.byte	(.L370-.L365)/2
	.byte	(.L369-.L365)/2
	.byte	(.L368-.L365)/2
	.byte	(.L367-.L365)/2
	.byte	(.L553-.L365)/2
	.byte	(.L364-.L365)/2
	.p2align 1
.L370:
	ldr	r2, [sp, #112]
.L366:
	ldrb	r1, [r4, #444]	@ zero_extendqisi2
	bfi	r1, r3, #4, #3
	strb	r1, [r4, #444]
	ldr	r3, [r4, #444]
	bfi	r3, r2, #7, #16
	str	r3, [r4, #444]
	ldrb	r3, [r4, #452]	@ zero_extendqisi2
	bfi	r3, r7, #0, #4
	strb	r3, [r4, #452]
	ldr	r0, [r9, #92]
	bl	h264e_marking_is_empty
	mov	r7, r0
	cmp	r0, #0
	bne	.L362
	add	r1, sp, #108
	ldr	r0, [r9, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #108]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L373
	tbb	[pc, r2]
.L375:
	.byte	(.L380-.L375)/2
	.byte	(.L379-.L375)/2
	.byte	(.L378-.L375)/2
	.byte	(.L377-.L375)/2
	.byte	(.L554-.L375)/2
	.byte	(.L374-.L375)/2
	.p2align 1
.L369:
	ldr	r2, [sp, #116]
	b	.L366
.L368:
	ldr	r2, [sp, #112]
	ldr	r7, [sp, #120]
	b	.L366
.L367:
	ldr	r2, [sp, #124]
	b	.L366
.L364:
	ldr	r2, [sp, #120]
	b	.L366
.L363:
	movw	r2, #1111
	ldr	r1, .L753+40
	ldr	r0, .L753+44
	bl	printk
	movs	r3, #0
.L553:
	movs	r2, #0
	b	.L366
.L380:
	ldr	r2, [sp, #112]
.L376:
	ldrh	r1, [r4, #446]
	strh	r2, [r4, #448]	@ movhi
	bfi	r1, r3, #7, #3
	ldrb	r3, [r4, #452]	@ zero_extendqisi2
	strh	r1, [r4, #446]	@ movhi
	bfi	r3, r7, #4, #4
	strb	r3, [r4, #452]
	ldr	r0, [r9, #92]
	bl	h264e_marking_is_empty
	mov	r7, r0
	cmp	r0, #0
	bne	.L362
	add	r1, sp, #108
	ldr	r0, [r9, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #108]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L382
	tbb	[pc, r2]
.L384:
	.byte	(.L389-.L384)/2
	.byte	(.L388-.L384)/2
	.byte	(.L387-.L384)/2
	.byte	(.L386-.L384)/2
	.byte	(.L555-.L384)/2
	.byte	(.L383-.L384)/2
	.p2align 1
.L379:
	ldr	r2, [sp, #116]
	b	.L376
.L378:
	ldr	r2, [sp, #112]
	ldr	r7, [sp, #120]
	b	.L376
.L377:
	ldr	r2, [sp, #124]
	b	.L376
.L374:
	ldr	r2, [sp, #120]
	b	.L376
.L373:
	movw	r2, #1166
	ldr	r1, .L753+40
	ldr	r0, .L753+44
	bl	printk
	movs	r3, #0
.L554:
	movs	r2, #0
	b	.L376
.L389:
	ldr	r2, [sp, #112]
.L385:
	ldrb	r1, [r4, #447]	@ zero_extendqisi2
	strh	r2, [r4, #450]	@ movhi
	bfi	r1, r3, #2, #3
	ldrb	r3, [r4, #453]	@ zero_extendqisi2
	strb	r1, [r4, #447]
	bfi	r3, r7, #0, #4
	strb	r3, [r4, #453]
	b	.L362
.L388:
	ldr	r2, [sp, #116]
	b	.L385
.L387:
	ldr	r2, [sp, #112]
	ldr	r7, [sp, #120]
	b	.L385
.L754:
	.align	2
.L753:
	.word	.LANCHOR0+671
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	hal_h264e_debug
	.word	.LANCHOR0+621
	.word	.LC27
	.word	.LANCHOR0+708
	.word	.LC26
	.word	.LC42
	.word	.LANCHOR0+463
	.word	.LC29
.L386:
	ldr	r2, [sp, #124]
	b	.L385
.L383:
	ldr	r2, [sp, #120]
	b	.L385
.L382:
	movw	r2, #1220
	ldr	r1, .L755
	ldr	r0, .L755+4
	bl	printk
	movs	r3, #0
.L555:
	movs	r2, #0
	b	.L385
.L392:
	ldr	r2, [r5]
	movw	r3, #4732
	ldr	r3, [r2, r3]
	cmp	r3, #1
	ldrb	r3, [r7, #756]	@ zero_extendqisi2
	ite	eq
	moveq	r2, #9
	movne	r2, #6
	b	.L725
.L557:
	movs	r3, #0
	b	.L395
.L399:
	orr	r3, r3, #16
	strh	r3, [r6, #1644]	@ movhi
	b	.L400
.L401:
	cmp	r2, r8, lsr #7
	bcs	.L403
	subs	r3, r3, #6
	b	.L402
.L403:
	cmp	r2, r8, lsr #6
	ite	cc
	subcc	r3, r3, #4
	addcs	r3, r3, #-1
	b	.L402
.L405:
	ldr	r2, [r5, #628]
	cmp	r2, #2
	beq	.L739
	movs	r2, #2
	b	.L726
.L408:
	ldr	r3, [r7, #8]
	lsls	r1, r3, #31
	bpl	.L409
	orr	r2, r2, #640
	strh	r2, [r6, #1624]	@ movhi
	ldr	r3, [r7, #8]
	ldrb	r2, [r6, #1624]	@ zero_extendqisi2
	asrs	r3, r3, #1
	bfi	r2, r3, #3, #3
	strb	r2, [r6, #1624]
	ldr	r3, [r7, #8]
	ldrh	r2, [r6, #1630]
	asrs	r3, r3, #4
	bfi	r2, r3, #4, #9
	ldrh	r3, [r6, #1634]
	strh	r2, [r6, #1630]	@ movhi
	ldrsh	r2, [r7, #10]
	bfi	r3, r2, #4, #8
	strh	r3, [r6, #1634]	@ movhi
	b	.L409
.L414:
	cmp	r3, #1
	ite	eq
	ldreq	r1, .L755+8
	ldrne	r1, .L755+12
	b	.L727
.L428:
	ands	fp, r3, #983040
	bne	.L729
	ubfx	r2, r3, #0, #20
	cmp	r2, #17
	bhi	.L560
	mov	r1, r3
	add	r0, sp, #108
	bl	vepu541_set_fmt
	ldr	r2, [sp, #108]
	subs	r2, r2, #4
	cmp	r2, #9
	bhi	.L561
	tbb	[pc, r2]
.L432:
	.byte	(.L433-.L432)/2
	.byte	(.L436-.L432)/2
	.byte	(.L433-.L432)/2
	.byte	(.L434-.L432)/2
	.byte	(.L561-.L432)/2
	.byte	(.L561-.L432)/2
	.byte	(.L561-.L432)/2
	.byte	(.L561-.L432)/2
	.byte	(.L433-.L432)/2
	.byte	(.L431-.L432)/2
	.p2align 1
.L436:
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #36]
	mul	fp, r3, r2
	add	r3, fp, fp, lsl #1
	add	r3, r3, r3, lsr #31
	asrs	r3, r3, #1
.L430:
	mov	r8, fp
	mov	fp, r3
	b	.L429
.L434:
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #36]
	mul	fp, r3, r2
	adds	r3, fp, fp, lsl #2
	it	mi
	addmi	r3, r3, #3
	asrs	r3, r3, #2
	b	.L430
.L433:
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #36]
	mul	fp, r3, r2
	mov	r3, fp
	b	.L430
.L431:
	ldr	r3, [sp, #56]
	ldr	r2, [sp, #36]
	mul	fp, r3, r2
	lsl	r3, fp, #1
	b	.L430
.L561:
	movs	r3, #0
	b	.L430
.L560:
	mov	r8, fp
	b	.L429
.L438:
	movs	r2, #160
	ldr	r1, [sp, #88]
	ldr	r0, [sp, #72]
	bl	mpp_dev_get_iova_address
	add	r3, r0, r8
	str	r0, [r6, #116]
	str	r3, [r6, #120]
	add	r0, r0, fp
	str	r0, [r6, #124]
	b	.L439
.L441:
	ldr	r3, [r7, #4]
	str	r3, [r6, #168]
	b	.L442
.L440:
	ldr	r1, .L755+16
	bl	mpp_buffer_get_size_with_caller
	movs	r2, #173
	ldr	r1, [r7]
	mov	r8, r0
	ldr	r0, [sp, #72]
	bl	mpp_dev_get_iova_address
	mov	r1, r8
	str	r0, [r6, #168]
	mov	fp, r0
	ldr	r3, [sp, #60]
	ldr	r0, [r7, #12]
	add	r0, r0, r3
	bl	__aeabi_uidivmod
	add	r0, r8, fp
	add	r1, r1, fp
	str	r1, [r6, #172]
	ldr	r3, [r7, #16]
	str	r0, [r6, #164]
	add	r3, r3, fp
	str	r3, [r6, #176]
	b	.L443
.L445:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L444
	ldr	r0, [r5, #4]
	bl	mpp_get_dev
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #60]
	ldr	r1, [r3, #32]
	movs	r3, #1
	ldr	r1, [r1, #4]
	bl	dma_sync_single_for_device
	b	.L444
.L448:
	mov	r0, r6
	bl	mpp_frame_get_phy_addr
	mov	r7, r0
	mov	r0, r6
	bl	mpp_frame_get_hor_stride
	mov	r8, r0
	mov	r0, r6
	bl	mpp_frame_get_ver_stride
	mul	r0, r0, r8
	cbz	r7, .L450
	str	r7, [r4, #116]
	add	r7, r7, r0
	strd	r7, r7, [r4, #120]
	b	.L447
.L450:
	movw	r1, #2340
	ldr	r0, .L755+20
	bl	printk
	b	.L447
.L465:
	ldr	r3, [r5, #84]
	str	r3, [sp, #28]
	ldr	r3, [r5, #132]
	str	r3, [sp, #32]
	b	.L730
.L463:
	ldr	r2, [sp, #56]
	ldr	r3, [sp, #72]
	ldr	r1, .L755+24
	add	r3, r3, r2, lsl #1
	add	r3, r1, r3, lsl #2
	ldr	r7, [r3, #692]
	ldr	r3, .L755+28
	ldr	r3, [r3]
	lsls	r3, r3, #24
	bpl	.L467
	mov	r3, r7
	mov	r2, #442
	addw	r1, r1, #671
	ldr	r0, .L755+32
	bl	printk
.L467:
	cmp	r7, #3
	bhi	.L466
	tbb	[pc, r7]
.L469:
	.byte	(.L472-.L469)/2
	.byte	(.L471-.L469)/2
	.byte	(.L470-.L469)/2
	.byte	(.L468-.L469)/2
	.p2align 1
.L472:
	ldr	r3, [r5, #88]
	str	r3, [sp, #64]
	ldr	r3, [r5, #136]
	str	r3, [sp, #68]
	ldr	r3, [r5, #84]
	str	r3, [sp, #28]
	ldr	r3, [r5, #132]
	str	r3, [sp, #32]
	ldr	r3, [r5, #76]
	str	r3, [sp, #44]
	ldr	r3, [r5, #80]
	str	r3, [sp, #40]
	ldr	r3, [r5, #124]
	str	r3, [sp, #52]
	ldr	r3, [r5, #128]
.L731:
	str	r3, [sp, #48]
	b	.L466
.L471:
	ldr	r3, [r5, #60]
	str	r3, [sp, #64]
	ldr	r3, [r5, #108]
	str	r3, [sp, #68]
	ldr	r3, [r5, #76]
	str	r3, [sp, #28]
	str	r3, [r5, #84]
	ldr	r3, [r5, #124]
	ldr	r2, [sp, #28]
	str	r3, [sp, #32]
	str	r3, [r5, #132]
	ldr	r3, [r5, #52]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	ldr	r2, [r5, #56]
	str	r3, [sp, #44]
	ldr	r3, [r5, #80]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r5, #100]
	str	r2, [sp, #40]
	ldr	r2, [sp, #32]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	ldr	r2, [r5, #104]
	str	r3, [sp, #52]
	ldr	r3, [r5, #128]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	mov	r3, r2
	b	.L731
.L470:
	ldr	r0, .L755+36
	mov	r1, #474
.L732:
	bl	printk
	b	.L466
.L756:
	.align	2
.L755:
	.word	.LANCHOR0+463
	.word	.LC29
	.word	vepu540c_h264_jvt_scl_tab
	.word	vepu540c_h264_flat_scl_tab
	.word	.LANCHOR0+599
	.word	.LC31
	.word	.LANCHOR0
	.word	hal_h264e_debug
	.word	.LC36
	.word	.LC37
.L468:
	ldr	r3, [r5, #960]
	cmp	r3, #0
	bne	.L473
	add	r1, r5, #76
	str	r1, [sp, #72]
	ldr	r1, [r5, #60]
	add	r3, r5, #100
	ldr	lr, [sp, #72]
	add	r2, r5, #52
	add	r7, r5, #124
	str	r1, [sp, #64]
	ldr	r1, [r5, #108]
	str	r1, [sp, #68]
	ldr	r1, [r5, #76]
	str	r1, [sp, #28]
	str	r1, [r5, #84]
	ldr	r1, [r5, #124]
	ldr	r0, [sp, #28]
	str	r1, [sp, #32]
	str	r1, [r5, #132]
	ldr	r1, [r5, #52]
	cmp	r1, r0
	it	cs
	movcs	r1, r0
	ldr	r0, [r5, #56]
	str	r1, [sp, #44]
	ldr	r1, [r5, #80]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	ldr	r1, [r5, #100]
	str	r0, [sp, #40]
	ldr	r0, [sp, #32]
	cmp	r1, r0
	it	cs
	movcs	r1, r0
	ldr	r0, [r5, #104]
	str	r1, [sp, #52]
	ldr	r1, [r5, #128]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	add	r1, sp, #108
	str	r0, [sp, #48]
	str	r1, [sp, #56]
.L474:
	ldr	r1, [lr, #4]	@ unaligned
	add	lr, lr, #8
	ldr	r0, [lr, #-8]	@ unaligned
	cmp	lr, r3
	ldr	ip, [sp, #56]
	stmia	ip!, {r0, r1}
	ldr	r1, [sp, #56]
	add	r1, r1, #8
	str	r1, [sp, #56]
	bne	.L474
	ldr	ip, [sp, #72]
	add	r0, r2, #24
	mov	r1, r2
.L475:
	ldr	lr, [r1], #4	@ unaligned
	cmp	r1, r0
	str	lr, [ip], #4	@ unaligned
	bne	.L475
	add	lr, sp, #108
.L476:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	str	r1, [r2, #-4]	@ unaligned
	add	r1, sp, #132
	cmp	ip, r1
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	bne	.L476
	add	lr, sp, #108
	mov	r2, r7
	add	r1, r7, #24
	str	r1, [sp, #56]
.L477:
	ldr	r1, [r2, #4]	@ unaligned
	mov	ip, lr
	ldr	r0, [r2]	@ unaligned
	adds	r2, r2, #8
	stmia	ip!, {r0, r1}
	mov	lr, ip
	ldr	r1, [sp, #56]
	cmp	r2, r1
	bne	.L477
	add	r1, r3, #24
	mov	r2, r3
.L478:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [r7], #4	@ unaligned
	bne	.L478
	add	r7, sp, #108
	add	ip, sp, #132
.L479:
	mov	r2, r7
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, ip
	str	r0, [r3, #-8]	@ unaligned
	mov	r7, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L479
	b	.L466
.L473:
	mov	r1, #502
	ldr	r0, .L757
	b	.L732
.L462:
	mov	r2, #-1
	strd	r2, r3, [r4, #196]
	strd	r2, r3, [r4, #204]
	b	.L482
.L562:
	mov	r0, r1
	b	.L486
.L758:
	.align	2
.L757:
	.word	.LC38
.L489:
	ldr	r1, [r4, #340]
	ldr	r2, .L759
	ands	r2, r2, r1
	str	r2, [r4, #340]
	ldr	r2, [r4, #344]
	bfi	r2, r3, #0, #20
	str	r2, [r4, #344]
	ldr	r2, [r4, #348]
	bfi	r2, r3, #0, #20
	str	r2, [r4, #348]
	ldrb	r2, [r4, #247]	@ zero_extendqisi2
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #247]
.L492:
	movs	r3, #0
	str	r3, [r10, #3424]
	ldr	r3, [r6]
	lsls	r7, r3, #30
	bpl	.L493
	movw	r2, #1849
	ldr	r1, .L759+4
	ldr	r0, .L759+8
	bl	printk
.L493:
	ldrh	r2, [r4, #260]
	movw	r3, #52463
	str	r3, [r4, #356]
	movs	r0, #0
	ubfx	r2, r2, #0, #11
	ldr	r3, [r4, #360]
	movs	r1, #31
	mov	r8, #14
	lsls	r2, r2, #3
	and	r3, r3, #-2013265920
	adds	r2, r2, #71
	orr	r3, r3, #15859712
	orr	r3, r3, #72
	str	r3, [r4, #360]
	asrs	r2, r2, #6
	movw	fp, #1795
	lsls	r2, r2, #1
	adds	r3, r2, #2
	subs	r2, r2, #1
	cmp	r2, r3
	it	ge
	movge	r2, r3
	adds	r3, r2, #1
	ldrh	r2, [r4, #366]
	lsl	lr, r3, #1
	bfi	r2, r3, #2, #10
	strh	r2, [r4, #366]	@ movhi
	movs	r2, #2
.L494:
	mla	r7, r8, r1, r0
	sub	ip, r2, #2
	cmp	r7, fp
	bhi	.L496
	cmp	r2, #32
	bne	.L497
.L498:
	subs	r1, r2, #2
	lsrs	r2, r2, #1
	muls	r3, r1, r3
	ldrh	r1, [r4, #364]
	adds	r3, r3, #28
	lsrs	r3, r3, #1
	bfi	r1, r3, #0, #10
	ldrb	r3, [r4, #367]	@ zero_extendqisi2
	strh	r1, [r4, #364]	@ movhi
	ubfx	r1, r1, #8, #8
	bfc	r3, #4, #2
	bfi	r1, r2, #3, #5
	strb	r3, [r4, #367]
	strb	r1, [r4, #365]
	ldr	r3, [r6]
	lsls	r0, r3, #30
	bpl	.L499
	movw	r2, #1973
	ldr	r1, .L759+12
	ldr	r0, .L759+8
	bl	printk
.L499:
	ldr	r1, [r5, #936]
	cmp	r1, #0
	beq	.L500
	movs	r2, #179
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #192]
	ldr	r3, [r5, #148]
	add	r3, r3, r0
	str	r3, [r4, #188]
.L501:
	ldr	r3, [r5, #304]
	cbz	r3, .L502
	add	r0, r5, #296
	bl	vepu540c_set_osd
.L502:
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #4]
	ldr	fp, [r3, #212]
	cmp	fp, #0
	bne	.L504
	ldr	r3, [r5, #948]
	cbz	r3, .L504
	ldr	r2, [r5]
	movw	r3, #4732
	ldr	r3, [r2, r3]
	cmp	r3, #1
	bne	.L504
	ldr	r3, [sp, #24]
	ldr	r8, [r9, #96]
	ldrb	r6, [r4, #245]	@ zero_extendqisi2
	ldr	r0, [r5, #308]
	ldr	lr, [r5, #952]
	and	r6, r6, #63
	ldrd	r1, r2, [r3, #64]
	add	r0, r0, #760
	ldr	r3, [r3, #72]
	ldrd	r7, ip, [r10, #12]
	str	r8, [sp, #16]
	cmp	lr, #0
	beq	.L506
	strd	ip, fp, [sp, #8]
	strd	r6, r7, [sp]
	bl	vepu540c_set_qpmap_smart
.L507:
	ldr	r3, [sp, #24]
	movs	r2, #186
	ldr	r0, [r5, #4]
	ldr	r1, [r3, #68]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #220]
.L504:
	ldr	r1, [r5, #292]
	cbz	r1, .L508
	ldr	r0, [r5, #308]
	ldrd	r2, r3, [r10, #12]
	add	r0, r0, #760
	bl	vepu540c_set_roi
.L508:
	ldr	r3, [sp, #24]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_is_gray
	ldr	r3, [r5, #956]
	cmp	r3, r0
	beq	.L509
	cbnz	r3, .L511
	ldrb	r2, [r4, #1645]	@ zero_extendqisi2
	str	r3, [r4, #1796]
	bfi	r2, r3, #7, #1
	ldrb	r3, [r4, #245]	@ zero_extendqisi2
	strb	r2, [r4, #1645]
	and	r2, r3, #63
	cmp	r2, #29
	bhi	.L512
	movs	r2, #30
.L734:
	bfi	r3, r2, #0, #6
	strb	r3, [r4, #245]
.L511:
	str	r0, [r5, #956]
.L509:
	ldr	r7, .L759+16
	ldr	r6, [r5, #308]
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L515
	movw	r2, #2020
	ldr	r1, .L759+20
	ldr	r0, .L759+24
	bl	printk
.L515:
	ldr	r3, [r6, #952]
	add	r0, r6, #1416
	ldr	r2, .L759+28
	lsrs	r3, r3, #20
	lsls	r3, r3, #20
	orrs	r2, r2, r3
	str	r2, [r6, #952]
	ldr	r3, [r5]
	movw	r2, #4732
	ldr	r2, [r3, r2]
	cmp	r2, #1
	bne	.L516
	ldr	r2, [r5, #952]
	cmp	r2, #0
	beq	.L517
	add	r3, r3, #4736
	ldrh	r2, [r6, #952]
	ldr	r1, .L759+32
	ldr	r3, [r3]
	cmp	r3, #0
	movw	r3, #341
	it	eq
	moveq	r3, #500
	bfi	r2, r3, #0, #10
	strh	r2, [r6, #952]	@ movhi
	movs	r2, #208
.L735:
	bl	memcpy
	ldr	r3, [r10, #324]
	cbz	r3, .L520
	ldr	r2, [r5]
	ldrh	r3, [r6, #952]
	ldr	r2, [r2, #316]
	bfi	r3, r2, #0, #10
	strh	r3, [r6, #952]	@ movhi
	ldr	r2, [r5]
	ldr	r3, [r6, #952]
	ldr	r2, [r2, #320]
	bfi	r3, r2, #10, #10
	str	r3, [r6, #952]
.L520:
	ldr	r3, [r9, #44]
	ldrb	r2, [r6, #305]	@ zero_extendqisi2
	cmp	r3, #2
	ldrb	r3, [r6, #304]	@ zero_extendqisi2
	bne	.L521
	ldr	r1, [r10, #328]
	bfi	r3, r1, #0, #2
	strb	r3, [r6, #304]
	ldr	r1, [r10, #328]
	bfi	r3, r1, #4, #2
	strb	r3, [r6, #304]
	mov	r3, r2
	ldr	r2, [r10, #328]
.L736:
	bfi	r3, r2, #0, #2
	strb	r3, [r6, #305]
	ldr	r3, [r6, #904]
	ldr	r0, .L759+36
	and	r3, r3, #-268374016
	ldr	r1, .L759+40
	orrs	r3, r3, r0
	str	r3, [r6, #904]
	ldr	r3, [r6, #908]
	ldr	r2, [r6, #920]
	and	r3, r3, #-268374016
	orrs	r3, r3, r1
	str	r3, [r6, #908]
	ldr	r3, [r6, #912]
	and	r2, r2, #-268374016
	orrs	r2, r2, r0
	str	r2, [r6, #920]
	and	r3, r3, #-268374016
	movs	r2, #4
	orrs	r3, r3, r0
	str	r3, [r6, #912]
	ldr	r3, [r6, #916]
	and	r3, r3, #-268374016
	orrs	r3, r3, r1
	str	r3, [r6, #916]
	ldr	r3, [r6, #924]
	and	r3, r3, #-268374016
	orrs	r3, r3, r1
	str	r3, [r6, #924]
	ldrh	r3, [r6, #928]
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #928]	@ movhi
	ldr	r3, .L759+44
	ldrh	r2, [r6, #972]
	str	r3, [r6, #932]
	add	r3, r3, #768
	strd	r3, r3, [r6, #936]
	add	r3, r3, #-50331648
	subw	r3, r3, #1284
	str	r3, [r6, #944]
	ldr	r3, [r9, #44]
	cmp	r3, #2
	ldr	r3, [r6, #968]
	and	r3, r3, #-268374016
	bne	.L523
	orr	r3, r3, #131072
	orr	r3, r3, #1
	str	r3, [r6, #968]
	mov	r3, r2	@ movhi
	movs	r2, #6
	b	.L760
.L761:
	.align	2
.L759:
	.word	-2147450888
	.word	.LANCHOR0+708
	.word	.LC27
	.word	.LANCHOR0+729
	.word	hal_h264e_debug
	.word	.LANCHOR0+747
	.word	.LC26
	.word	349867
	.word	.LANCHOR1+604
	.word	196609
	.word	524294
	.word	370415382
.L760:
.L737:
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #972]	@ movhi
	ldrb	r3, [r6, #974]	@ zero_extendqisi2
	movs	r2, #32
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #974]
	ldr	r3, [r9, #44]
	ldr	r2, [r6, #992]
	cmp	r3, #2
	ldrd	r3, r1, [r6, #984]
	and	r3, r3, #-16777216
	bne	.L525
	orr	r3, r3, #1048592
	and	r1, r1, #-16777216
	orr	r3, r3, #4096
	str	r3, [r6, #984]
	ldr	r3, .L762
	and	r2, r2, #-16777216
	orrs	r3, r3, r1
	str	r3, [r6, #988]
	ldr	r3, .L762+4
	orrs	r3, r3, r2
	str	r3, [r6, #992]
.L526:
	ldrh	r3, [r6, #1000]
	add	ip, r10, #400
	ldr	r2, .L762+8
	bic	r3, r3, #32640
	bic	r3, r3, #119
	orr	r3, r3, #3
	strh	r3, [r6, #1000]	@ movhi
	ldr	r3, [r6, #1004]
	ands	r2, r2, r3
	ldr	r3, .L762+12
	orrs	r3, r3, r2
	str	r3, [r6, #1004]
	ldrh	r3, [r6, #1008]
	movs	r2, #16
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #1008]	@ movhi
	ldr	r3, .L762+16
	ldr	r2, [r6, #1016]
	str	r3, [r6, #1012]
	ldr	r3, .L762+20
	ands	r3, r3, r2
	orr	r3, r3, #33
	str	r3, [r6, #1016]
	ldr	r3, [r6, #1020]
	and	r3, r3, #-268374016
	orr	r3, r3, #1048576
	orr	r3, r3, #8
	str	r3, [r6, #1020]
	ldr	r3, [r6, #1024]
	and	r2, r3, #-1073741824
	ldr	r3, .L762+24
	orrs	r3, r3, r2
	str	r3, [r6, #1024]
	ldr	r3, [r6, #1028]
	and	r2, r3, #-16777216
	ldr	r3, .L762+28
	orrs	r3, r3, r2
	str	r3, [r6, #1028]
	ldr	r3, [r6, #732]
	and	r2, r3, #-16777216
	ldr	r3, .L762+32
	orrs	r3, r3, r2
	str	r3, [r6, #732]
	ldr	r3, [r6, #736]
	movs	r2, #240
	and	r3, r3, #-268374016
	orr	r3, r3, #9437184
	orr	r3, r3, #64
	str	r3, [r6, #736]
	ldrh	r3, [r6, #740]
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #740]	@ movhi
	ldr	r3, [r9, #44]
	cmp	r3, #2
	addw	r3, r6, #699
	bne	.L527
	add	r2, r10, #336
.L528:
	ldr	r1, [r2], #4
	cmp	ip, r2
	strb	r1, [r3, #1]!
	ldr	r0, [r2, #124]
	and	r1, r0, #63
	strb	r1, [r3, #16]
	bne	.L528
.L532:
	ldr	r2, [r5]
	movw	r3, #4732
	ldr	r3, [r2, r3]
	cmp	r3, #1
	bne	.L529
.L530:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L535
	movw	r2, #2250
	ldr	r1, .L762+36
	ldr	r0, .L762+40
	bl	printk
.L535:
	ldr	r1, [r5, #936]
	cmp	r1, #0
	beq	.L536
	movs	r2, #179
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #192]
	ldr	r3, [r5, #148]
	add	r3, r3, r0
	str	r3, [r4, #188]
.L537:
	ldr	r3, [sp, #76]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r3, r3, #29
	bpl	.L538
	ldr	r0, [r5, #152]
	cmp	r0, #0
	bne	.L539
	mov	r1, r5
	ldr	r6, [r1], #152
	ldr	r2, [r6, #12]
	adds	r2, r2, #15
	bic	r3, r2, #15
	ldr	r2, [r6, #16]
	adds	r2, r2, #15
	bic	r2, r2, #15
	muls	r2, r3, r2
	ldr	r3, .L762+44
	str	r3, [sp]
	ldr	r3, .L762+48
	add	r2, r2, r2, lsl #1
	asrs	r2, r2, #1
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #152]
	cmp	r3, #0
	bne	.L539
	movw	r1, #1461
	ldr	r0, .L762+52
	bl	printk
.L538:
	ldr	r3, [sp, #76]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r6, r3, #28
	bpl	.L541
	ldr	r3, [r7]
	ldr	r6, [r5]
	lsls	r0, r3, #30
	bpl	.L542
	mov	r2, #1480
	ldr	r1, .L762+56
	ldr	r0, .L762+60
	bl	printk
.L542:
	movs	r3, #216
	strb	r3, [r4, #268]
	ldr	r3, [r6, #12]
	ldr	r2, [r4, #296]
	adds	r3, r3, #15
	bic	r3, r3, #15
	bfi	r2, r3, #0, #17
	str	r2, [r4, #296]
	lsls	r6, r3, #1
	movs	r2, #160
	add	r3, r3, r6
	strh	r3, [r4, #300]	@ movhi
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	bic	r3, r3, #28
	strb	r3, [r4, #291]
	ldr	r3, [r4, #292]
	and	r3, r3, #-1073692672
	str	r3, [r4, #292]
	ldr	r1, [r5, #152]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	movs	r3, #0
	str	r3, [r4, #124]
	ldr	r3, [r7]
	lsls	r1, r3, #30
	str	r0, [r4, #116]
	add	r0, r0, r6
	str	r0, [r4, #120]
	bpl	.L541
	movw	r2, #1505
	ldr	r1, .L762+56
	ldr	r0, .L762+40
	bl	printk
.L541:
	ldr	r3, [r5, #8]
	adds	r3, r3, #1
	str	r3, [r5, #8]
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L331
	mov	r3, r5
	movw	r2, #2475
	ldr	r1, .L762+64
	ldr	r0, .L762+68
	bl	printk
.L331:
	ldr	r0, [sp, #80]
	add	sp, sp, #148
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L488:
	ldr	r3, [r4, #340]
	ldr	r2, .L762+72
	ands	r2, r2, r3
	ldr	r3, .L762+76
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [r4, #348]
	bfc	r3, #0, #20
	str	r3, [r4, #348]
	ldr	r3, [r4, #344]
	ldr	r2, [r10, #3432]
	bfi	r3, r2, #0, #20
.L733:
	str	r3, [r4, #344]
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	bfc	r3, #6, #1
	strb	r3, [r4, #247]
	b	.L492
.L490:
	ldr	r3, [r4, #340]
	ldr	r2, .L762+72
	ands	r2, r2, r3
	ldr	r3, .L762+80
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [r10, #3432]
	ldr	r2, [r4, #348]
	subs	r3, r3, #1
	bfi	r2, r3, #0, #20
	ldr	r3, [r4, #344]
	str	r2, [r4, #348]
	bfc	r3, #0, #20
	b	.L733
.L497:
	cmp	r1, #4
	add	r2, r2, #2
	it	hi
	subhi	r1, r1, #2
	add	r0, r0, lr
	it	ls
	movls	r1, #2
	b	.L494
.L496:
	movw	r1, #1796
	cmp	r7, r1
	it	ne
	movne	r2, ip
	b	.L498
.L500:
	str	r1, [r4, #192]
	b	.L501
.L506:
	strd	ip, lr, [sp, #8]
	strd	r6, r7, [sp]
	bl	vepu540c_set_qpmap_normal
	b	.L507
.L512:
	cmp	r2, #31
	bhi	.L513
	movs	r2, #32
	b	.L734
.L513:
	cmp	r2, #33
	bhi	.L511
	movs	r2, #34
	b	.L734
.L517:
	movs	r2, #208
	ldr	r1, .L762+84
	b	.L735
.L516:
	movs	r2, #208
	ldr	r1, .L762+88
	b	.L735
.L521:
	ldr	r1, [r10, #332]
	bfi	r3, r1, #0, #2
	strb	r3, [r6, #304]
	ldr	r1, [r10, #332]
	bfi	r3, r1, #4, #2
	strb	r3, [r6, #304]
	mov	r3, r2
	ldr	r2, [r10, #332]
	b	.L736
.L523:
	orr	r3, r3, #262144
	orr	r3, r3, #2
	str	r3, [r6, #968]
	mov	r3, r2	@ movhi
	movs	r2, #9
	b	.L737
.L525:
	ldr	r0, .L762+92
	and	r1, r1, #-16777216
	and	r2, r2, #-16777216
	orrs	r3, r3, r0
	str	r3, [r6, #984]
	ldr	r3, .L762+96
	orrs	r2, r2, r0
	str	r2, [r6, #992]
	orrs	r3, r3, r1
	str	r3, [r6, #988]
	b	.L526
.L527:
	add	r0, r10, #464
	mov	r1, ip
.L531:
	ldr	r2, [r1], #4
	cmp	r0, r1
	strb	r2, [r3, #1]!
	ldr	r2, [r1, #124]
	and	r2, r2, #63
	strb	r2, [r3, #16]
	bne	.L531
	b	.L532
.L763:
	.align	2
.L762:
	.word	1316118
	.word	1053204
	.word	-536346112
	.word	83935248
	.word	336595976
	.word	-268370040
	.word	12591108
	.word	8413248
	.word	1313797
	.word	.LANCHOR0+747
	.word	.LC27
	.word	.LANCHOR0+765
	.word	.LC20
	.word	.LC43
	.word	.LANCHOR0+797
	.word	.LC26
	.word	.LANCHOR0+393
	.word	.LC9
	.word	-2147450888
	.word	32800769
	.word	32800771
	.word	.LANCHOR1+600
	.word	.LANCHOR1+840
	.word	1053721
	.word	1184793
.L529:
	ldrb	r3, [r6, #974]	@ zero_extendqisi2
	movs	r2, #45
	bfi	r3, r2, #0, #6
	strb	r3, [r6, #974]
	ldr	r3, [r9, #44]
	ldr	r2, [r6, #992]
	cmp	r3, #2
	ldrd	r3, r0, [r6, #984]
	bne	.L533
	ldr	r1, .L764
	and	r0, r0, #-16777216
	and	r3, r3, #-16777216
	orr	r0, r0, #1179666
	orrs	r3, r3, r1
	orr	r0, r0, #4352
	str	r3, [r6, #984]
	str	r0, [r6, #988]
.L738:
	ldrh	r3, [r6, #928]
	and	r2, r2, #-16777216
	orrs	r2, r2, r1
	str	r2, [r6, #992]
	movw	r2, #4095
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #928]	@ movhi
	ldrh	r3, [r6, #1008]
	bfc	r3, #0, #12
	strh	r3, [r6, #1008]	@ movhi
	mov	r3, #67372036
	str	r3, [r6, #1012]
	ldr	r3, [r6, #1020]
	and	r3, r3, #-268374016
	str	r3, [r6, #1020]
	ldr	r3, [r6, #1024]
	and	r2, r3, #-1073741824
	ldr	r3, .L764+4
	orrs	r3, r3, r2
	str	r3, [r6, #1024]
	b	.L530
.L533:
	ldr	r1, [r6, #968]
	mov	ip, #7
	and	r3, r3, #-16777216
	and	r1, r1, #-268374016
	orr	r1, r1, #131072
	orr	r1, r1, #1
	str	r1, [r6, #968]
	ldrh	r1, [r6, #972]
	bfi	r1, ip, #0, #12
	strh	r1, [r6, #972]	@ movhi
	ldr	r1, .L764+8
	orrs	r3, r3, r1
	str	r3, [r6, #984]
	and	r3, r0, #-16777216
	orr	r3, r3, #1572888
	orr	r3, r3, #6144
	str	r3, [r6, #988]
	b	.L738
.L536:
	str	r1, [r4, #192]
	b	.L537
.L539:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	movs	r2, #163
	orr	r3, r3, #4
	strb	r3, [r4, #244]
	movs	r3, #0
	str	r3, [r4, #128]
	ldr	r1, [r5, #152]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	orr	r3, r3, #128
	strb	r3, [r4, #247]
	str	r0, [r4, #132]
	b	.L538
.L765:
	.align	2
.L764:
	.word	1052688
	.word	4198404
	.word	1316375
	.fnend
	.size	hal_h264e_vepu540c_gen_regs, .-hal_h264e_vepu540c_gen_regs
	.global	hal_h264e_vepu540c
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37661, %object
	.size	__func__.37661, 28
__func__.37661:
	.ascii	"hal_h264e_vepu540c_ret_task\000"
	.type	__func__.37629, %object
	.size	__func__.37629, 32
__func__.37629:
	.ascii	"hal_h264e_vepu540c_status_check\000"
	.type	__func__.37683, %object
	.size	__func__.37683, 33
__func__.37683:
	.ascii	"hal_h264e_vepu540c_ret_comb_task\000"
	.type	__func__.37620, %object
	.size	__func__.37620, 25
__func__.37620:
	.ascii	"hal_h264e_vepu540c_start\000"
	.type	__func__.37673, %object
	.size	__func__.37673, 30
__func__.37673:
	.ascii	"hal_h264e_vepu540c_comb_start\000"
	.type	__func__.37303, %object
	.size	__func__.37303, 23
__func__.37303:
	.ascii	"update_vepu540c_syntax\000"
	.type	__func__.37321, %object
	.size	__func__.37321, 28
__func__.37321:
	.ascii	"hal_h264e_vepu540c_get_task\000"
	.type	__FUNCTION__.37284, %object
	.size	__FUNCTION__.37284, 15
__FUNCTION__.37284:
	.ascii	"setup_hal_bufs\000"
	.type	__func__.37285, %object
	.size	__func__.37285, 15
__func__.37285:
	.ascii	"setup_hal_bufs\000"
	.type	__FUNCTION__.37229, %object
	.size	__FUNCTION__.37229, 13
__FUNCTION__.37229:
	.ascii	"get_wrap_buf\000"
	.type	__func__.37201, %object
	.size	__func__.37201, 26
__func__.37201:
	.ascii	"hal_h264e_vepu540c_deinit\000"
	.type	__FUNCTION__.37202, %object
	.size	__FUNCTION__.37202, 26
__FUNCTION__.37202:
	.ascii	"hal_h264e_vepu540c_deinit\000"
	.type	__func__.37209, %object
	.size	__func__.37209, 24
__func__.37209:
	.ascii	"hal_h264e_vepu540c_init\000"
	.type	__FUNCTION__.37212, %object
	.size	__FUNCTION__.37212, 24
__FUNCTION__.37212:
	.ascii	"hal_h264e_vepu540c_init\000"
	.type	__func__.37293, %object
	.size	__func__.37293, 27
__func__.37293:
	.ascii	"hal_h264e_vepu540c_prepare\000"
	.type	__func__.37636, %object
	.size	__func__.37636, 24
__func__.37636:
	.ascii	"hal_h264e_vepu540c_wait\000"
	.type	__func__.37606, %object
	.size	__func__.37606, 28
__func__.37606:
	.ascii	"hal_h264e_vepu540c_gen_regs\000"
	.type	__func__.37325, %object
	.size	__func__.37325, 22
__func__.37325:
	.ascii	"setup_vepu540c_normal\000"
	.type	__func__.37337, %object
	.size	__func__.37337, 20
__func__.37337:
	.ascii	"setup_vepu540c_prep\000"
	.type	__func__.37350, %object
	.size	__func__.37350, 21
__func__.37350:
	.ascii	"setup_vepu540c_codec\000"
	.type	__func__.37394, %object
	.size	__func__.37394, 24
__func__.37394:
	.ascii	"setup_vepu540c_rdo_pred\000"
	.type	__func__.37408, %object
	.size	__func__.37408, 23
__func__.37408:
	.ascii	"setup_vepu540c_rdo_cfg\000"
	.type	__func__.37429, %object
	.size	__func__.37429, 23
__func__.37429:
	.ascii	"setup_vepu540c_scl_cfg\000"
	.type	__func__.37449, %object
	.size	__func__.37449, 23
__func__.37449:
	.ascii	"setup_vepu540c_rc_base\000"
	.type	__func__.37467, %object
	.size	__func__.37467, 22
__func__.37467:
	.ascii	"setup_vepu540c_io_buf\000"
	.type	__FUNCTION__.37484, %object
	.size	__FUNCTION__.37484, 22
__FUNCTION__.37484:
	.ascii	"setup_vepu540c_io_buf\000"
	.type	__func__.37499, %object
	.size	__func__.37499, 25
__func__.37499:
	.ascii	"setup_vepu540c_recn_refr\000"
	.type	__FUNCTION__.37501, %object
	.size	__FUNCTION__.37501, 25
__FUNCTION__.37501:
	.ascii	"setup_vepu540c_recn_refr\000"
	.type	__func__.37253, %object
	.size	__func__.37253, 21
__func__.37253:
	.ascii	"setup_recn_refr_wrap\000"
	.type	ref_type_map, %object
	.size	ref_type_map, 16
ref_type_map:
	.word	0
	.word	1
	.word	2
	.word	3
	.type	__func__.37517, %object
	.size	__func__.37517, 21
__func__.37517:
	.ascii	"setup_vepu540c_split\000"
	.type	__func__.37551, %object
	.size	__func__.37551, 18
__func__.37551:
	.ascii	"setup_vepu540c_me\000"
	.type	__func__.37561, %object
	.size	__func__.37561, 18
__func__.37561:
	.ascii	"setup_vepu540c_l2\000"
	.type	__FUNCTION__.37416, %object
	.size	__FUNCTION__.37416, 32
__FUNCTION__.37416:
	.ascii	"vepu540c_h264e_save_pass1_patch\000"
	.type	__func__.37424, %object
	.size	__func__.37424, 31
__func__.37424:
	.ascii	"vepu540c_h264e_use_pass1_patch\000"
	.type	hal_h264e_vepu540c, %object
	.size	hal_h264e_vepu540c, 64
hal_h264e_vepu540c:
	.word	.LC20
	.word	7
	.word	968
	.word	0
	.word	hal_h264e_vepu540c_init
	.word	hal_h264e_vepu540c_deinit
	.word	hal_h264e_vepu540c_prepare
	.word	hal_h264e_vepu540c_get_task
	.word	hal_h264e_vepu540c_gen_regs
	.word	hal_h264e_vepu540c_start
	.word	hal_h264e_vepu540c_wait
	.word	0
	.word	0
	.word	hal_h264e_vepu540c_ret_task
	.word	hal_h264e_vepu540c_comb_start
	.word	hal_h264e_vepu540c_ret_comb_task
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	h264_aq_tthd_smart, %object
	.size	h264_aq_tthd_smart, 64
h264_aq_tthd_smart:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	8
	.word	15
	.word	15
	.word	20
	.word	25
	.word	28
	.type	h264_I_aq_step_smart, %object
	.size	h264_I_aq_step_smart, 64
h264_I_aq_step_smart:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	6
	.word	8
	.word	10
	.type	h264_P_aq_step_smart, %object
	.size	h264_P_aq_step_smart, 64
h264_P_aq_step_smart:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	6
	.word	8
	.word	10
	.type	h264_aq_tthd_default, %object
	.size	h264_aq_tthd_default, 64
h264_aq_tthd_default:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	8
	.word	15
	.word	15
	.word	20
	.word	25
	.word	25
	.type	h264_I_aq_step_default, %object
	.size	h264_I_aq_step_default, 64
h264_I_aq_step_default:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	7
	.word	8
	.type	h264_P_aq_step_default, %object
	.size	h264_P_aq_step_default, 64
h264_P_aq_step_default:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	7
	.word	8
	.type	h264_aq_tthd_cvr, %object
	.size	h264_aq_tthd_cvr, 64
h264_aq_tthd_cvr:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	8
	.word	15
	.word	15
	.word	20
	.word	25
	.word	35
	.type	h264_I_aq_step_cvr, %object
	.size	h264_I_aq_step_cvr, 64
h264_I_aq_step_cvr:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	6
	.word	7
	.word	8
	.type	h264_P_aq_step_cvr, %object
	.size	h264_P_aq_step_cvr, 64
h264_P_aq_step_cvr:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	8
	.type	h264e_lambda_default, %object
	.size	h264e_lambda_default, 240
h264e_lambda_default:
	.word	3
	.word	5
	.word	6
	.word	7
	.word	9
	.word	11
	.word	14
	.word	18
	.word	22
	.word	28
	.word	36
	.word	45
	.word	57
	.word	72
	.word	91
	.word	115
	.word	145
	.word	182
	.word	230
	.word	290
	.word	365
	.word	460
	.word	580
	.word	731
	.word	921
	.word	1161
	.word	1462
	.word	1843
	.word	2322
	.word	2925
	.word	3686
	.word	4644
	.word	5851
	.word	7372
	.word	9289
	.word	11703
	.word	14745
	.word	18578
	.word	23407
	.word	29491
	.word	37156
	.word	46814
	.word	58982
	.word	74313
	.word	93628
	.word	117964
	.word	148626
	.word	187257
	.word	235929
	.word	297252
	.word	374514
	.word	471859
	.word	594505
	.word	749029
	.word	943718
	.word	1189010
	.word	1498059
	.word	1887436
	.word	2378020
	.word	2996118
	.type	h264e_lambda_cvr, %object
	.size	h264e_lambda_cvr, 240
h264e_lambda_cvr:
	.word	9
	.word	11
	.word	14
	.word	17
	.word	22
	.word	27
	.word	34
	.word	43
	.word	54
	.word	69
	.word	86
	.word	109
	.word	137
	.word	173
	.word	218
	.word	274
	.word	345
	.word	435
	.word	548
	.word	691
	.word	870
	.word	1097
	.word	1382
	.word	1741
	.word	2193
	.word	2763
	.word	3482
	.word	5057
	.word	6372
	.word	8028
	.word	10115
	.word	12744
	.word	16056
	.word	20230
	.word	25488
	.word	36372
	.word	45826
	.word	57738
	.word	72745
	.word	91653
	.word	115475
	.word	162529
	.word	204774
	.word	257999
	.word	325059
	.word	452485
	.word	570095
	.word	718275
	.word	990842
	.word	1248383
	.word	1572864
	.word	1981684
	.word	2496766
	.word	3145728
	.word	3963368
	.word	4993532
	.word	6291456
	.word	7926736
	.word	9987064
	.word	201326592
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC1:
	.ascii	"\0016%s:%d: lkt_done finish\000"
.LC2:
	.ascii	"\0016%s:%d: enc_done finish\000"
.LC3:
	.ascii	"\0016%s:%d: enc_slice finsh\000"
.LC4:
	.ascii	"\0016%s:%d: safe clear finsh\000"
.LC5:
	.ascii	"\0016%s:%d: bit stream overflow\000"
.LC6:
	.ascii	"\0016%s:%d: bus write full\000"
.LC7:
	.ascii	"\0016%s:%d: bus error\000"
.LC8:
	.ascii	"\0016%s:%d: wdg timeout\000"
.LC9:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC10:
	.ascii	"\0013%s:%d: set register write failed %d\012\000"
.LC11:
	.ascii	"\0013%s:%d: set register read failed %d\012\000"
.LC12:
	.ascii	"\0013%s:%d: send cmd failed %d\012\000"
.LC13:
	.ascii	"\0016%s:%d: update cfg\000"
.LC14:
	.ascii	"\0016%s:%d: update sps\000"
.LC15:
	.ascii	"\0016%s:%d: update pps\000"
.LC16:
	.ascii	"\0016%s:%d: update slice\000"
.LC17:
	.ascii	"\0016%s:%d: update frames\000"
.LC18:
	.ascii	"\0016%s:%d: update prefix nal\000"
.LC19:
	.ascii	"\0016%s:%d: invalid syntax type %d\012\000"
.LC20:
	.ascii	"hal_h264e_vepu540c\000"
.LC21:
	.ascii	"\0016%s:%d: frame size %d -> %d max count %d -> %d\012"
	.ascii	"\000"
.LC22:
	.ascii	"\0013%s:%d: mpp_dev_init failed. ret: %d\012\000"
.LC23:
	.ascii	"\0013%d: HalVepu540cRegSet alloc fail\000"
.LC24:
	.ascii	"\0013%s:%d: poll cmd failed %d\012\000"
.LC25:
	.ascii	"\0016%s:%d: frame %d generate regs now\000"
.LC26:
	.ascii	"\0016%s:%d: enter\012\000"
.LC27:
	.ascii	"\0016%s:%d: leave\012\000"
.LC28:
	.ascii	"\0013%s:%d: invalid modification_of_pic_nums_idc %d"
	.ascii	"\012\000"
.LC29:
	.ascii	"\0013%s:%d: unsupported mmco 0 %d\012\000"
.LC30:
	.ascii	"\0016%s:%d: bittarget %d qp [%d %d %d]\012\000"
.LC31:
	.ascii	"\0013%d: online case set full frame err\000"
.LC32:
	.ascii	"buf_thumb\000"
.LC33:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC34:
	.ascii	"buf_pixel\000"
.LC35:
	.ascii	"\0016%s:%d: cur is idr  lt %d\012\000"
.LC36:
	.ascii	"\0016%s:%d: ref type %d\012\000"
.LC37:
	.ascii	"\0013%d: WARNING: not support lt ref to st when buf"
	.ascii	" is wrap\000"
.LC38:
	.ascii	"\0013%d: WARNING: not support lt ref to lt when buf"
	.ascii	" is wrap\000"
.LC39:
	.ascii	"\0016%s:%d: cur_is_ref %d\012\000"
.LC40:
	.ascii	"\0016%s:%d: hdr[size %d top %d bot %d cur %d pre %d"
	.ascii	"]\012\000"
.LC41:
	.ascii	"\0016%s:%d: bdy [size %d top %d bot %d cur %d pre %"
	.ascii	"d]\012\000"
.LC42:
	.ascii	"\0016%s:%d: invalide slice split mode %d\012\000"
.LC43:
	.ascii	"\0013%d: buf_pass1 maSlloc fail, debreath invaild\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
