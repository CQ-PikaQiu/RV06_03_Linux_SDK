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
	.file	"rc_model_v2_smt.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_coef, %function
set_coef:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	mov	r5, r1
	ldr	r0, [r0, #328]
	movs	r1, #0
	mov	r4, r2
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r6, r0
	ldr	r0, [r7, #328]
	bl	mpp_data_get_pre_val_v2
	mov	r8, r0
	ldr	r0, [r7, #328]
	bl	mpp_data_sum_v2
	cbnz	r0, .L2
.L25:
	str	r4, [r5]
	pop	{r4, r5, r6, r7, r8, pc}
.L2:
	cmp	r0, #1
	bne	.L4
	cbnz	r6, .L5
	adds	r4, r4, #10
	b	.L25
.L5:
	adds	r4, r4, #25
	b	.L25
.L4:
	cmp	r0, #2
	bne	.L6
	cmp	r6, #0
	beq	.L5
.L8:
	adds	r4, r4, #35
	b	.L25
.L6:
	cmp	r0, #3
	bne	.L7
	cmp	r6, #0
	beq	.L8
.L11:
	adds	r4, r4, #51
	b	.L25
.L7:
	subs	r3, r0, #4
	cmp	r3, #2
	bhi	.L9
	cbnz	r6, .L10
	cmp	r8, #0
	beq	.L8
	b	.L11
.L10:
	adds	r4, r4, #64
	b	.L25
.L9:
	subs	r0, r0, #7
	cmp	r0, #2
	bhi	.L12
	orrs	r3, r6, r8
	beq	.L10
	adds	r4, r4, #72
	b	.L25
.L12:
	adds	r4, r4, #80
	b	.L25
	.fnend
	.size	set_coef, .-set_coef
	.global	__aeabi_idiv
	.global	__aeabi_uidiv
	.align	1
	.global	rc_model_v2_smt_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_start, %function
rc_model_v2_smt_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #84
	sub	sp, sp, #84
	ldr	r3, [r0, #48]
	mov	r4, r0
	ldr	fp, [r0, #32]
	ldr	r6, [r0, #564]
	str	r3, [sp, #28]
	ldr	r3, [r0, #56]
	str	r1, [sp, #12]
	str	r3, [sp, #36]
	ldr	r3, [r0, #28]
	str	r3, [sp, #32]
	ldr	r3, [r0, #124]
	str	r3, [sp, #24]
	ldr	r3, [r0, #120]
	str	r3, [sp, #16]
	ldr	r3, [r0, #132]
	str	r3, [sp, #52]
	ldr	r3, [r0, #128]
	ldr	r0, [r0, #324]
	str	r3, [sp, #20]
	bl	mpp_data_sum_v2
	movs	r1, #0
	str	r0, [sp, #40]
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	str	r0, [sp, #44]
	ldr	r0, [r4, #328]
	bl	mpp_data_sum_v2
	ldr	r3, [sp, #12]
	str	r0, [sp, #56]
	ldrb	r3, [r3, #156]	@ zero_extendqisi2
	lsls	r1, r3, #29
	bmi	.L192
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #296]
	bl	mpp_frame_get_ppinfo
	mov	r7, r0
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	ldr	r8, [r4, #48]
	ldr	r9, [r4, #56]
	mov	r5, r0
	cbz	r7, .L29
	ldr	r3, [r7, #8]
	lsls	r2, r3, #31
	bpl	.L29
	ubfx	r2, r3, #4, #9
	asrs	r3, r3, #16
	tst	r3, #254
	uxtb	r1, r3
	bne	.L30
	cmp	r1, #0
	bne	.L146
	movs	r3, #30
	cmp	r2, #0
	bne	.L205
	str	r3, [sp, #16]
	b	.L29
.L30:
	movs	r3, #33
	str	r3, [sp, #16]
	orrs	r3, r2, r1
	beq	.L29
.L31:
	ldr	r3, [sp, #20]
	cmp	r3, #37
	it	ge
	movge	r3, #37
	str	r3, [sp, #20]
.L29:
	ldr	r0, [r4, #324]
	bl	mpp_data_sum_v2
	cbnz	r0, .L33
	ldr	r3, [r4, #256]
	cbz	r3, .L33
	ldr	r3, [r4, #136]
	str	r3, [sp, #24]
	str	r3, [sp, #16]
.L33:
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #12]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	tst	r3, #16
	ite	ne
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r4, #260]
	ldrb	r2, [r2, #154]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #3
	it	eq
	moveq	r3, r2
	ldr	r2, [r4, #288]
	str	r3, [r4, #260]
	cbz	r2, .L36
	cmp	r2, #1
	beq	.L37
	cmp	r3, #2
	bne	.L41
	add	r7, r4, #336
	mov	r0, r7
	bl	mpp_pid_calc
	ldr	r3, [r4, #340]
	mov	r8, r0
	subs	r3, r3, r0
	mov	r0, r7
	str	r3, [r4, #316]
	bl	mpp_pid_reset
	ldrd	r2, [r4, #296]
	ldr	r7, [r4, #380]
	orrs	r3, r2, r3
	beq	.L42
	ldr	r3, [r4, #388]
	add	r7, r7, r8
	str	r7, [r4, #372]
	add	r3, r3, r8
	b	.L206
.L146:
	movs	r3, #32
.L205:
	str	r3, [sp, #16]
	b	.L31
.L36:
	cmp	r3, #2
	bne	.L39
	ldr	r3, [r4, #380]
	str	r3, [r4, #372]
	ldr	r3, [r4, #388]
.L206:
	str	r3, [r4, #376]
.L40:
	ldr	r3, [r4, #320]
	cbnz	r3, .L47
	cmp	r5, #14
	bgt	.L48
	lsls	r1, r5, #2
.L49:
	ldr	r5, [r4, #404]
	add	r0, r4, #320
	cmp	r1, r5
	it	lt
	movlt	r1, r5
	cmp	r1, #50
	it	ge
	movge	r1, #50
	cmp	r1, #20
	it	lt
	movlt	r1, #20
	bl	mpp_data_init
.L47:
	ldrd	r3, r2, [r4, #372]
	mov	r1, fp
	ldr	r0, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #12]
	cmp	r3, #199
	ite	gt
	asrgt	r3, r3, #1
	movle	r3, #100
	str	r3, [r2, #164]
	bl	__aeabi_idiv
	mov	r1, #-1
	ldr	r3, [sp, #12]
	mov	fp, r0
	ldr	r0, [r4, #320]
	ldr	r7, [r3, #164]
	movs	r3, #1
	mov	r2, r3
	bl	mpp_data_avg
	ldrd	r8, [r4, #272]
	orrs	r3, r8, r9
	str	r0, [sp, #32]
	bne	.L53
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bge	.L54
	ldr	r2, .L219
	asr	r1, fp, #31
	ldr	r0, [r4]
	ldr	r5, .L219+4
	smull	r2, r3, fp, r2
	adds	r0, r0, #15
	asrs	r2, r0, #4
	rsb	r1, r1, r3, asr #2
	ldr	r3, [r4, #376]
	adds	r1, r1, #1
	cmp	r1, #3
	it	ge
	movge	r1, #3
	cmp	r1, #1
	it	lt
	movlt	r1, #1
	muls	r1, r3, r1
	ldr	r3, [r4, #4]
	add	r0, r3, #15
	asrs	r0, r0, #4
	muls	r0, r2, r0
	movs	r2, #0
.L55:
	adds	r2, r2, #1
	cmp	r2, #8
	beq	.L56
	ldr	r3, [r5, r2, lsl #2]
	cmp	r0, r3
	bcs	.L55
.L56:
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #132]
	muls	r0, r3, r0
	sub	r0, r0, #350
	bl	__aeabi_uidiv
	ldr	r2, [r4, #284]
	cmp	r0, #95
	ldr	r1, [sp, #24]
	it	ge
	movge	r0, #95
	cmp	r0, #4
	ite	ge
	addge	r5, r5, r0
	addlt	r5, r5, #4
	cmp	r1, #31
	ldrb	r3, [r5, #36]	@ zero_extendqisi2
	ble	.L58
	cmp	r3, r1
	blt	.L149
.L209:
	cmp	r3, r2
	it	ge
	movge	r3, r2
.L54:
	str	r3, [r4, #560]
.L53:
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #36]
	add	r3, r3, r2
	add	r0, r3, r3, lsr #31
	asrs	r3, r0, #1
	str	r3, [sp, #28]
	ldr	r3, [r4, #260]
	cmp	r3, #2
	bne	.L59
	cmp	r8, #1
	sbcs	r3, r9, #0
	blt	.L61
	ldrd	r9, r3, [r4, #280]
	ldr	r2, [sp, #32]
	cmp	r2, r9
	blt	.L62
	cmp	r2, r3
	it	ge
	movge	r2, r3
	mov	r9, r2
.L62:
	ldrd	r3, r5, [r4, #568]
	cmp	r3, r7
	blt	.L63
	add	r2, r7, r7, lsl #2
	cmp	r3, r2
	ble	.L64
	adds	r7, r5, #3
.L65:
	ldr	r3, [r4, #588]
	cmp	r3, #0
	bne	.L70
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L70
	ldrd	r10, r3, [r4, #576]
	str	r3, [sp, #36]
	ldr	r3, [r4, #584]
	asr	r8, r3, #5
	ldr	r3, .L219+8
	cmp	r8, #7
	ldr	r3, [r3]
	it	ge
	movge	r8, #7
	lsls	r3, r3, #31
	bpl	.L72
	mov	r3, r4
	mov	r2, #462
	ldr	r1, .L219+12
	ldr	r0, .L219+16
	bl	printk
.L72:
	mov	r0, r10
	ldr	r1, [sp, #36]
	bl	__aeabi_idiv
	ldr	r3, .L219+8
	ldr	r3, [r3]
	cmp	r0, #35
	it	ge
	movge	r0, #35
	mov	r10, r0
	lsls	r0, r3, #24
	bpl	.L73
	ldr	r3, [r4, #584]
	movw	r2, #467
	ldr	r1, .L219+12
	ldr	r0, .L219+20
	strd	r10, r3, [sp]
	ldr	r3, [r4, #560]
	bl	printk
.L73:
	ldr	r2, .L219+4
	ldr	r3, [r4, #208]
	uxtab	r8, r2, r8
	add	r3, r3, r2
	ldrsb	r2, [r8, #225]
	ldrsb	r3, [r3, #189]
	subs	r1, r3, r2
	cmp	r10, r1
	itt	gt
	subgt	r10, r10, r3
	addgt	r10, r10, r2
	ldrd	r2, r3, [r4, #104]
	cmp	r3, r10
	bgt	.L75
	cmp	r2, r10
	mov	r3, r2
	it	ge
	movge	r3, r10
.L75:
	str	r3, [r4, #560]
	movs	r3, #0
	strd	r3, r3, [r4, #576]
	ldr	r3, .L219+8
	ldr	r3, [r3]
	lsls	r1, r3, #31
	bpl	.L70
	mov	r3, r4
	mov	r2, #478
	ldr	r1, .L219+12
	ldr	r0, .L219+24
	bl	printk
.L70:
	ldr	r3, .L219+4
	add	r9, r9, r3
	ldrb	r2, [r9, #233]	@ zero_extendqisi2
	ldrb	r1, [r9, #285]	@ zero_extendqisi2
	cmp	r2, r7
	bgt	.L76
	cmp	r1, r7
	mov	r2, r1
	it	ge
	movge	r2, r7
.L76:
	add	r6, r6, r3
	ldrb	r1, [r6, #233]	@ zero_extendqisi2
	ldrb	r3, [r6, #285]	@ zero_extendqisi2
	cmp	r1, r2
	bgt	.L77
	cmp	r3, r2
	it	ge
	movge	r3, r2
	mov	r1, r3
.L77:
	ldr	r3, .L219+4
	cmp	r1, #27
	add	r5, r5, r3
	ldrb	r2, [r5, #337]	@ zero_extendqisi2
	ble	.L78
	ldrb	r3, [r5, #389]	@ zero_extendqisi2
.L218:
	cmp	r3, r1
	bgt	.L83
	cmp	r1, r2
	mov	r3, r1
	it	ge
	movge	r3, r2
.L83:
	ldr	r6, [r4, #316]
	str	r3, [r4, #560]
	cmp	r6, #0
	bge	.L61
	mov	r1, fp
	ldr	r0, [r4, #404]
	bl	__aeabi_idiv
	ldr	r5, [r4, #560]
	ldr	r3, [sp, #28]
	muls	r3, r0, r3
	mov	r0, r3
	mvn	r3, #4
	muls	r3, r6, r3
	cmp	r3, r0
	ble	.L85
	cmp	r5, #51
	mov	r3, r5
	it	ge
	movge	r3, #51
	cmp	r3, #20
	it	lt
	movlt	r3, #20
.L214:
	str	r3, [r4, #560]
	b	.L61
.L39:
	ldr	r0, [r4, #552]
	ldr	r7, [r4, #384]
	bl	mpp_data_mean_v2
	subs	r0, r7, r0
	str	r0, [r4, #372]
	ldr	r0, [r4, #556]
	ldr	r7, [r4, #392]
	bl	mpp_data_mean_v2
.L216:
	subs	r0, r7, r0
.L207:
	str	r0, [r4, #376]
	b	.L40
.L37:
	ldr	r7, [r4, #380]
.L42:
	add	r0, r4, #408
	bl	mpp_pid_calc
	subs	r0, r7, r0
	str	r0, [r4, #372]
	add	r0, r4, #444
	ldr	r7, [r4, #388]
	bl	mpp_pid_calc
	b	.L216
.L41:
	ldr	r3, [r4, #264]
	cmp	r3, #2
	bne	.L43
	ldr	r3, [r4, #404]
	mov	r1, r5
	ldr	r2, [r4, #568]
	ldr	r7, [r4, #316]
	add	r10, r3, #-1
	mul	r0, r3, r8
	subs	r7, r7, r2
	str	r3, [sp, #48]
	bl	__aeabi_idiv
	mov	r1, r10
	add	r0, r0, r7
	bl	__aeabi_idiv
	mov	r1, r5
	ldr	r3, [sp, #48]
	str	r0, [r4, #384]
	str	r0, [r4, #372]
	mul	r0, r3, r9
	bl	__aeabi_idiv
	mov	r1, r10
	add	r0, r0, r7
	bl	__aeabi_idiv
	str	r0, [r4, #392]
	b	.L207
.L43:
	ldr	r0, [r4, #552]
	bl	mpp_data_mean_v2
	mov	r10, r0
	ldr	r0, [r4, #556]
	bl	mpp_data_mean_v2
	ldrd	r2, r1, [r4, #28]
	mov	r7, r0
	mov	r0, r8
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r8, r0
	mov	r0, r9
	bl	axb_div_c
	ldr	r3, [r4, #384]
	lsl	r8, r8, #1
	sub	r3, r3, r10
	cmp	r3, r8
	ite	le
	strle	r3, [r4, #372]
	strgt	r8, [r4, #372]
	ldr	r3, [r4, #392]
	subs	r7, r3, r7
	lsls	r0, r0, #1
	cmp	r7, r0
	ite	le
	strle	r7, [r4, #376]
	strgt	r0, [r4, #376]
	b	.L40
.L48:
	cmp	r5, #24
	lsl	r1, r5, #1
	it	le
	addle	r1, r1, r5
	b	.L49
.L58:
	cmp	r3, #30
	bgt	.L209
	movs	r3, #31
	b	.L54
.L149:
	ldr	r3, [sp, #24]
	b	.L54
.L64:
	lsls	r2, r7, #1
	cmp	r3, r2
	ble	.L66
	adds	r7, r5, #2
	b	.L65
.L66:
	add	r7, r7, r2
	cmp	r7, r3, lsl #1
	bge	.L152
	adds	r7, r5, #1
	b	.L65
.L63:
	lsls	r2, r3, #1
	add	r3, r3, r2
	cmp	r3, r7
	bge	.L67
	subs	r7, r5, #3
	b	.L65
.L67:
	cmp	r2, r7
	bge	.L68
	subs	r7, r5, #2
	b	.L65
.L68:
	cmp	r3, r7, lsl #1
	bge	.L152
	subs	r7, r5, #1
	b	.L65
.L220:
	.align	2
.L219:
	.word	1717986919
	.word	.LANCHOR0
	.word	rc_debug
	.word	.LANCHOR0+168
	.word	.LC1
	.word	.LC2
	.word	.LC3
.L152:
	mov	r7, r5
	b	.L65
.L78:
	cmp	r1, #22
	ite	gt
	ldrbgt	r3, [r5, #441]	@ zero_extendqisi2
	ldrble	r3, [r5, #493]	@ zero_extendqisi2
	b	.L218
.L85:
	mvn	r3, #19
	muls	r3, r6, r3
	cmp	r0, r3
	bge	.L61
	cmp	r5, #51
	mov	r3, r5
	it	ge
	movge	r3, #51
	cmp	r3, #15
	it	lt
	movlt	r3, #15
	b	.L214
.L59:
	ldr	r3, [r4, #264]
	cmp	r3, #2
	bne	.L86
	cmp	r6, #32
	ble	.L153
	cmp	r6, #35
	ite	lt
	movlt	r3, #2
	movge	r3, #1
.L87:
	add	r6, r6, r3
	str	r6, [r4, #560]
.L61:
	ldr	r3, [sp, #40]
	cmp	r3, #700
	bge	.L166
	ldr	r3, [sp, #44]
	cmp	r3, #200
	beq	.L166
	ldr	r3, [sp, #40]
	cmp	r3, #400
	bge	.L167
	ldr	r3, [sp, #44]
	cmp	r3, #100
	mov	r3, #4
	bne	.L168
.L215:
	movs	r0, #5
	b	.L133
.L153:
	movs	r3, #3
	b	.L87
.L86:
	ldr	r0, [r4, #324]
	mov	r3, #1024
	str	r3, [sp, #76]
	bl	mpp_data_sum_v2
	movs	r1, #0
	mov	r5, r0
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r7, r0
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	cmp	r5, #99
	bgt	.L88
	movs	r2, #0
.L210:
	mov	r0, r4
	add	r1, sp, #76
	bl	set_coef
	ldr	r3, [sp, #76]
	cmp	r3, #1024
	itt	gt
	movgt	r3, #1024
	strgt	r3, [sp, #76]
	ldr	r0, [sp, #76]
	cmp	r0, #900
	bge	.L155
	cmp	r0, #306
	ble	.L108
	mvn	r2, #306
	add	r0, r0, r2
	ldr	r3, .L221
	lsls	r0, r0, #9
	umull	r0, r1, r0, r3
	lsrs	r0, r1, #7
	add	r0, r0, #512
.L109:
	cmp	r0, #1024
	it	ge
	movge	r0, #1024
	mov	r10, r0
.L107:
	ldrd	r0, r3, [r4, #372]
	ldr	r1, [r4, #520]
	subs	r3, r3, r0
	str	r3, [sp, #48]
	ldr	r3, [r4, #484]
	ldrd	r7, r2, [r4, #396]
	add	r3, r3, r1
	ldr	r5, [r4, #560]
	subs	r2, r2, r7
	lsls	r7, r7, #10
	asrs	r3, r3, #1
	str	r3, [sp, #60]
	lsls	r3, r0, #10
	str	r3, [sp, #36]
	ldr	r1, [sp, #36]
	movs	r0, #100
	ldr	r3, [sp, #48]
	mla	r9, r10, r2, r7
	mla	r3, r10, r3, r1
	asr	r9, r9, #10
	eor	r1, r9, r9, asr #31
	asrs	r3, r3, #10
	sub	r1, r1, r9, asr #31
	cmp	r3, #100
	mul	r8, r0, r1
	it	lt
	movlt	r3, #100
	lsl	ip, r3, #1
	add	lr, ip, r3
	cmp	r8, lr
	bgt	.L110
.L117:
	subs	r5, r6, #1
	b	.L111
.L88:
	cmp	r5, #199
	bgt	.L90
	cmp	r7, #99
	bgt	.L91
	movs	r2, #102
	b	.L210
.L91:
	movs	r2, #154
	b	.L210
.L90:
	cmp	r5, #300
	bge	.L92
	cmp	r7, #99
	ble	.L91
	cmp	r7, #100
	bne	.L93
	cmp	r0, #99
	bgt	.L94
	movs	r2, #205
	b	.L210
.L94:
	cmp	r0, #100
	bne	.L93
	mov	r2, #256
	b	.L210
.L93:
	movw	r2, #307
	b	.L210
.L92:
	cmp	r5, #600
	bge	.L95
	cmp	r7, #99
	bgt	.L96
	cmp	r0, #99
	ble	.L93
	cmp	r0, #100
	bne	.L97
.L99:
	mov	r2, #358
	b	.L210
.L97:
	mov	r2, #410
	b	.L210
.L96:
	cmp	r7, #100
	bne	.L98
	cmp	r0, #99
	ble	.L99
	cmp	r0, #100
	beq	.L97
.L98:
	movw	r2, #461
	b	.L210
.L95:
	cmp	r5, #900
	bge	.L100
	cmp	r7, #99
	bgt	.L101
	cmp	r0, #99
	ble	.L97
	cmp	r0, #100
	beq	.L98
.L103:
	mov	r2, #512
	b	.L210
.L101:
	cmp	r7, #100
	bne	.L102
	cmp	r0, #99
	ble	.L103
	cmp	r0, #100
	bne	.L102
	movw	r2, #563
	b	.L210
.L102:
	movw	r2, #614
	b	.L210
.L100:
	movw	r3, #1499
	cmp	r5, r3
	bgt	.L104
	movw	r2, #666
	b	.L210
.L104:
	movw	r3, #1899
	cmp	r5, r3
	ite	le
	movle	r2, #768
	movgt	r2, #900
	b	.L210
.L108:
	movw	r1, #307
	lsls	r0, r0, #9
	bl	__aeabi_idiv
	b	.L109
.L155:
	mov	r10, #1024
	b	.L107
.L110:
	mul	r0, r0, r9
	cmp	lr, r0
	bge	.L112
	cmp	r9, r3
	blt	.L113
	cmp	r5, #29
	ble	.L212
	subs	r5, r6, #4
.L111:
	ldrd	r8, r3, [r4, #280]
	cmp	r8, r5
	bgt	.L120
	cmp	r5, r3
	it	ge
	movge	r5, r3
	cmp	r5, #34
	ble	.L121
.L144:
	mov	r1, fp
	ldr	r0, [sp, #28]
	strd	r3, r2, [sp, #64]
	bl	__aeabi_idiv
	rsb	ip, r0, #0
	ldr	r0, .L221+4
	smull	r2, r3, ip, r0
	asr	r0, ip, #31
	rsb	r0, r0, r3, asr #1
	ldrd	r3, r2, [sp, #64]
	cmp	r9, r0, lsl #1
	ble	.L157
	cmp	r9, r0
	ite	le
	movle	r9, #102
	movgt	r9, #51
.L122:
	add	r10, r10, r9
	cmp	r10, #1024
	bge	.L159
	cmp	r5, #35
	it	ne
	movne	r10, #1024
.L123:
	mla	r7, r2, r10, r7
	ldr	r1, [sp, #36]
	ldr	r2, [sp, #48]
	mla	fp, r2, r10, r1
	asrs	r7, r7, #10
	movs	r2, #100
	eor	r5, r7, r7, asr #31
	sub	r5, r5, r7, asr #31
	asr	fp, fp, #10
	cmp	fp, #100
	mul	ip, r2, r5
	it	lt
	movlt	fp, #100
	lsl	r1, fp, #1
	add	r0, r1, fp
	cmp	ip, r0
	ble	.L162
	muls	r2, r7, r2
	cmp	r0, r2
	bge	.L124
	cmp	fp, r7
	bgt	.L125
	subs	r5, r6, #3
.L121:
	cmp	r8, r5
	bgt	.L127
.L145:
	cmp	r3, r5
	it	ge
	movge	r3, r5
	mov	r8, r3
.L127:
	cmp	r8, #36
	bgt	.L128
	cmp	r8, #33
	bgt	.L163
	cmp	r8, #30
	mov	r3, #1
	ite	gt
	movgt	r2, #3
	movle	r2, #4
.L129:
	subs	r3, r6, r3
	cmp	r3, r8
	bgt	.L131
	adds	r3, r6, r2
	cmp	r3, r8
	it	ge
	movge	r3, r8
.L131:
	ldr	r2, [sp, #60]
	str	r3, [r4, #560]
	cmp	r2, #0
	ble	.L61
	ldr	r2, [sp, #28]
	ldr	r1, [sp, #28]
	add	r2, r2, r2, lsl #2
	cmp	r2, r1
	ble	.L132
	cmp	r3, #51
	it	ge
	movge	r3, #51
	cmp	r3, #25
	it	lt
	movlt	r3, #25
	b	.L214
.L113:
	cmp	r3, r9, lsl #2
	bgt	.L115
	cmp	r5, #29
	ble	.L213
.L212:
	subs	r5, r6, #3
	b	.L111
.L115:
	movs	r1, #10
	mul	r1, r1, r9
	cmp	r1, r3
	ble	.L117
.L213:
	subs	r5, r6, #2
	b	.L111
.L112:
	cmp	r6, #35
	ite	gt
	movgt	r5, #0
	movle	r5, #1
	cmp	ip, r1
	bgt	.L118
	adds	r3, r6, #2
.L211:
	add	r5, r5, r3
	b	.L111
.L118:
	add	r0, r1, r1, lsl #1
	cmp	ip, r0
	bgt	.L119
	adds	r3, r6, #1
	b	.L211
.L119:
	add	r1, r1, r1, lsl #2
	cmp	r1, r3
	ite	gt
	addgt	r5, r6, #1
	movle	r5, r6
	b	.L111
.L157:
	mov	r9, #205
	b	.L122
.L159:
	mov	r10, #1024
	b	.L123
.L125:
	cmp	fp, r7, lsl #2
	bgt	.L126
	subs	r5, r6, #2
	b	.L121
.L126:
	movs	r2, #10
	muls	r7, r2, r7
	cmp	r7, fp
	ble	.L162
	subs	r5, r6, #1
	b	.L121
.L124:
	add	r5, r5, r5, lsl #1
	cmp	r5, r1
	ite	lt
	movlt	r5, r6
	addge	r5, r6, #1
	b	.L121
.L162:
	mov	r5, r6
	b	.L121
.L163:
	movs	r2, #2
	mov	r3, r2
	b	.L129
.L132:
	ldr	r1, [sp, #28]
	movs	r2, #20
	muls	r2, r1, r2
	cmp	r2, r1
	ble	.L61
	cmp	r3, #51
	it	ge
	movge	r3, #51
	cmp	r3, #21
	it	lt
	movlt	r3, #21
	b	.L214
.L222:
	.align	2
.L221:
	.word	1340867839
	.word	1717986919
.L166:
	movs	r3, #5
	movs	r0, #6
.L133:
	ldr	r2, [sp, #56]
	ldr	r1, [r4, #560]
	cmp	r2, #11
	ldr	r2, [r4, #260]
	itt	gt
	addgt	r0, r0, #1
	addgt	r3, r3, #1
	cmp	r2, #2
	bne	.L135
	ldr	r3, [sp, #24]
	add	r0, r0, r3
	cmp	r0, r1
	bgt	.L136
	ldr	r3, [sp, #52]
	cmp	r3, r1
	it	ge
	movge	r3, r1
	mov	r0, r3
.L136:
	str	r0, [r4, #560]
.L137:
	ldr	r2, [r4, #560]
	ldrd	r3, r1, [r4, #280]
	cmp	r2, r3
	blt	.L141
	cmp	r2, r1
	mov	r3, r2
	it	ge
	movge	r3, r1
.L141:
	ldr	r2, [sp, #12]
	str	r3, [r4, #560]
	str	r3, [r2, #172]
	movs	r3, #0
	str	r3, [r2, #212]
	ldr	r3, [r4, #260]
	cbnz	r3, .L142
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #32]
	subs	r3, r3, #1
	cmp	r3, r2
	bgt	.L142
	ldr	r3, [r4, #560]
	ldr	r2, [sp, #20]
	cmp	r3, r2
	bne	.L142
	ldr	r3, [r4, #564]
	cmp	r3, r2
	ittt	eq
	ldreq	r2, [sp, #12]
	moveq	r3, #1
	streq	r3, [r2, #212]
.L142:
	ldr	r3, [r4, #96]
	ldr	r2, [sp, #12]
	str	r3, [r2, #176]
	ldr	r3, [r4, #100]
	str	r3, [r2, #180]
	ldrd	r3, r2, [r4, #272]
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #272]
	movs	r3, #0
	str	r3, [r4, #588]
	ldr	r3, .L223
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L192
	mov	r3, r4
	mov	r2, #888
	ldr	r1, .L223+4
	ldr	r0, .L223+8
	bl	printk
.L192:
	movs	r0, #0
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L167:
	movs	r3, #4
	b	.L215
.L168:
	mov	r0, r3
	b	.L133
.L135:
	ldr	r5, [sp, #16]
	add	r3, r3, r5
	cmp	r3, r1
	bgt	.L138
	ldr	r3, [sp, #20]
	cmp	r3, r1
	it	ge
	movge	r3, r1
.L138:
	cmp	r2, #3
	beq	.L139
	str	r3, [r4, #560]
	b	.L137
.L139:
	ldr	r2, [sp, #16]
	subs	r3, r3, #1
	subs	r2, r2, #1
	add	r2, r2, r0
	cmp	r3, r2
	blt	.L140
	ldr	r2, [sp, #20]
	cmp	r2, r3
	it	ge
	movge	r2, r3
.L140:
	str	r2, [r4, #560]
	b	.L137
.L128:
	cmp	r8, #41
	mov	r2, #1
	ite	lt
	movlt	r3, #3
	movge	r3, #4
	b	.L129
.L120:
	cmp	r8, #34
	mov	r5, r8
	bgt	.L144
	b	.L145
.L224:
	.align	2
.L223:
	.word	rc_debug
	.word	.LANCHOR0+545
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_start, .-rc_model_v2_smt_start
	.align	1
	.global	rc_model_v2_smt_proc_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_proc_show, %function
rc_model_v2_smt_proc_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	.pad #44
	sub	sp, sp, #44
	ldr	r1, .L240
	mov	r5, r0
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L240+4
	ldr	r2, .L240+8
	mov	r0, r5
	ldr	r1, .L240+12
	ldr	r7, .L240+16
	ldr	r8, .L240+288
	str	r3, [sp, #28]
	ldr	r3, .L240+20
	str	r3, [sp, #24]
	ldr	r3, .L240+24
	str	r3, [sp, #20]
	ldr	r3, .L240+28
	str	r3, [sp, #16]
	ldr	r3, .L240+32
	str	r3, [sp, #12]
	ldr	r3, .L240+36
	str	r3, [sp, #8]
	ldr	r3, .L240+40
	str	r3, [sp, #4]
	ldr	r3, .L240+44
	str	r3, [sp]
	ldr	r3, .L240+48
	bl	seq_printf
	ldr	r10, [r4, #8]
	ldr	r9, [r4, #60]
	cmp	r10, #2
	bne	.L226
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	fp, [r4, #40]
	str	r0, [sp, #36]
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	str	r0, [sp, #32]
	mov	r0, r10
	bl	strof_rc_mode
	ldr	r2, [r4, #92]
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	strd	r2, r2, [sp, #24]
	mov	r2, r6
	str	r1, [sp, #8]
	ldr	r1, .L240+52
	strd	r9, r3, [sp]
	mov	r3, fp
	strd	r7, r7, [sp, #16]
	str	r0, [sp, #12]
.L237:
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L240+56
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+60
	ldr	r2, .L240+8
	mov	r0, r5
	ldr	r1, .L240+64
	str	r3, [sp, #8]
	ldr	r3, .L240+68
	str	r3, [sp, #4]
	ldr	r3, .L240+72
	str	r3, [sp]
	ldr	r3, .L240+76
	bl	seq_printf
	ldr	r0, [r4, #176]
	bl	strof_drop
	ldr	r3, [r4, #184]
	mov	r2, r6
	ldr	r1, .L240+80
	str	r3, [sp, #8]
	ldr	r3, [r4, #592]
	str	r3, [sp, #4]
	ldr	r3, [r4, #180]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L240+84
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+88
	ldr	r2, .L240+8
	mov	r0, r5
	ldr	r1, .L240+92
	str	r3, [sp, #8]
	ldr	r3, .L240+96
	str	r3, [sp, #4]
	ldr	r3, .L240+100
	str	r3, [sp]
	ldr	r3, .L240+104
	bl	seq_printf
	ldr	r0, [r4, #188]
	bl	strof_suprmode
	ldr	r3, [r4, #200]
	mov	r2, r6
	ldr	r1, .L240+108
	str	r3, [sp, #8]
	ldr	r3, [r4, #196]
	str	r3, [sp, #4]
	ldr	r3, [r4, #192]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L240+112
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+116
	mov	r0, r5
	ldr	r2, .L240+8
	ldr	r1, .L240+120
	str	r3, [sp, #8]
	ldr	r3, .L240+124
	str	r3, [sp, #4]
	ldr	r3, .L240+128
	str	r3, [sp]
	ldr	r3, .L240+132
	bl	seq_printf
	ldr	r0, [r4, #36]
	cmp	r0, #1
	bne	.L228
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #44]
	ldr	r1, .L240+136
	strd	r3, r2, [sp]
	mov	r2, r6
	str	r3, [sp, #8]
	mov	r3, r0
.L238:
	mov	r0, r5
	bl	seq_printf
	ldr	r3, [r4, #8]
	cbz	r3, .L230
	cmp	r3, #4
	bne	.L231
.L230:
	ldr	r1, .L240+140
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+144
	ldr	r2, .L240+8
	mov	r0, r5
	ldr	r1, .L240+148
	str	r3, [sp, #28]
	ldr	r3, .L240+152
	str	r3, [sp, #24]
	ldr	r3, .L240+156
	str	r3, [sp, #20]
	ldr	r3, .L240+160
	str	r3, [sp, #16]
	ldr	r3, .L240+164
	str	r3, [sp, #12]
	ldr	r3, .L240+168
	str	r3, [sp, #8]
	ldr	r3, .L240+172
	str	r3, [sp, #4]
	ldr	r3, .L240+176
	str	r3, [sp]
	ldr	r3, .L240+180
	bl	seq_printf
	ldr	r3, [r4, #156]
	mov	r2, r6
	ldr	r1, .L240+184
	mov	r0, r5
	str	r3, [sp, #28]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #132]
	str	r3, [sp, #20]
	ldr	r3, [r4, #120]
	str	r3, [sp, #16]
	ldr	r3, [r4, #128]
	str	r3, [sp, #12]
	ldr	r3, [r4, #108]
	str	r3, [sp, #8]
	ldr	r3, [r4, #104]
	str	r3, [sp, #4]
	ldr	r3, [r4, #100]
	str	r3, [sp]
	ldr	r3, [r4, #96]
	bl	seq_printf
.L231:
	ldr	r1, .L240+188
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+192
	ldr	r2, .L240+8
	mov	r0, r5
	ldr	r1, .L240+196
	str	r3, [sp, #28]
	ldr	r3, .L240+200
	str	r3, [sp, #24]
	ldr	r3, .L240+204
	str	r3, [sp, #20]
	ldr	r3, .L240+208
	str	r3, [sp, #16]
	ldr	r3, .L240+212
	str	r3, [sp, #12]
	ldr	r3, .L240+216
	str	r3, [sp, #8]
	ldr	r3, .L240+220
	str	r3, [sp, #4]
	ldr	r3, .L240+224
	str	r3, [sp]
	ldr	r3, .L240+228
	bl	seq_printf
	ldr	r0, [r4, #212]
	bl	strof_bool
	ldr	r3, [r4, #228]
	mov	r2, r6
	ldr	r1, .L240+232
	str	r3, [sp, #28]
	ldr	r3, [r4, #224]
	str	r3, [sp, #24]
	ldr	r3, [r4, #220]
	str	r3, [sp, #20]
	ldr	r3, [r4, #216]
	str	r3, [sp, #16]
	ldr	r3, [r4, #244]
	str	r3, [sp, #12]
	ldr	r3, [r4, #240]
	str	r3, [sp, #8]
	ldr	r3, [r4, #236]
	str	r3, [sp, #4]
	ldr	r3, [r4, #232]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L240+236
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L240+240
	mov	r0, r5
	ldr	r2, .L240+8
	ldr	r1, .L240+244
	str	r3, [sp, #4]
	ldr	r3, .L240+248
	str	r3, [sp]
	ldr	r3, .L240+228
	bl	seq_printf
	ldr	r9, [r4, #204]
	mov	r0, r9
	cmp	r9, #0
	beq	.L232
	bl	strof_bool
	movs	r3, #0
	ldr	r1, .L240+252
	mov	r2, r6
	str	r3, [sp, #4]
	ldr	r3, [r4, #208]
	str	r3, [sp]
	mov	r3, r0
.L239:
	mov	r0, r5
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L240+256
	bl	seq_puts
	ldr	r3, .L240+260
	mov	r0, r5
	ldr	r2, .L240+8
	ldr	r1, .L240+264
	str	r3, [sp, #16]
	ldr	r3, .L240+268
	str	r3, [sp, #12]
	ldr	r3, .L240+272
	str	r3, [sp, #8]
	ldr	r3, .L240+276
	str	r3, [sp, #4]
	ldr	r3, .L240+280
	str	r3, [sp]
	ldr	r3, .L240+284
	bl	seq_printf
	b	.L241
.L242:
	.align	2
.L240:
	.word	.LC4
	.word	.LC8
	.word	.LC6
	.word	.LC7
	.word	.LC17
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC5
	.word	.LC16
	.word	.LC20
	.word	.LC23
	.word	.LC22
	.word	.LC24
	.word	.LC25
	.word	.LC21
	.word	.LC26
	.word	.LC27
	.word	.LC30
	.word	.LC29
	.word	.LC31
	.word	.LC32
	.word	.LC28
	.word	.LC33
	.word	.LC34
	.word	.LC37
	.word	.LC36
	.word	.LC38
	.word	.LC39
	.word	.LC35
	.word	.LC40
	.word	.LC42
	.word	.LC45
	.word	.LC44
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC43
	.word	.LC53
	.word	.LC54
	.word	.LC57
	.word	.LC56
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC55
	.word	.LC65
	.word	.LC66
	.word	.LC68
	.word	.LC67
	.word	.LC69
	.word	.LC70
	.word	.LC72
	.word	.LC75
	.word	.LC74
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.word	.LC79
	.word	.LC73
	.word	274877907
.L241:
	ldr	r2, [r4, #252]
	ldr	r3, [r4, #312]
	mov	r0, r5
	ldr	r1, .L243
	smull	r8, r9, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r9, asr #6
	str	r2, [sp, #16]
	ldr	r2, [r4, #136]
	str	r2, [sp, #12]
	ldr	r2, [r4, #256]
	str	r2, [sp, #8]
	ldr	r2, [r4, #92]
	str	r2, [sp, #4]
	ldr	r2, [r4, #72]
	str	r2, [sp]
	mov	r2, r6
	bl	seq_printf
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L226:
	ldr	r3, [r4, #56]
	strd	r7, r7, [sp, #24]
	smull	r0, r1, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #20]
	ldr	r3, [r4, #48]
	smull	r0, r1, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #16]
	ldr	r3, .L243+4
	ldrd	r0, r1, [r4, #28]
	str	r3, [sp, #12]
	bl	__aeabi_idiv
	str	r0, [sp, #8]
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	r3, [r4, #40]
	mov	r2, r6
	ldr	r1, .L243+8
	strd	r9, r0, [sp]
	b	.L237
.L228:
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	mov	r2, r6
	ldr	r1, .L243+12
	str	r3, [sp]
	mov	r3, r0
	strd	r7, r7, [sp, #4]
	b	.L238
.L232:
	bl	strof_bool
	mov	r2, r6
	ldr	r1, .L243+16
	strd	r7, r9, [sp]
	mov	r3, r0
	b	.L239
.L244:
	.align	2
.L243:
	.word	.LC80
	.word	.LC19
	.word	.LC18
	.word	.LC41
	.word	.LC71
	.fnend
	.size	rc_model_v2_smt_proc_show, .-rc_model_v2_smt_proc_show
	.align	1
	.global	rc_model_v2_smt_hal_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_start, %function
rc_model_v2_smt_hal_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	mov	r3, r0
	ldr	r2, .L250
	ldr	r2, [r2]
	lsls	r2, r2, #31
	bpl	.L246
	str	r1, [sp]
	movw	r2, #1078
	ldr	r1, .L250+4
	ldr	r0, .L250+8
	bl	printk
.L246:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L251:
	.align	2
.L250:
	.word	rc_debug
	.word	.LANCHOR0+567
	.word	.LC81
	.fnend
	.size	rc_model_v2_smt_hal_start, .-rc_model_v2_smt_hal_start
	.align	1
	.global	rc_model_v2_smt_hal_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_end, %function
rc_model_v2_smt_hal_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L259
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L254
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #1084
	ldr	r1, .L259+4
	ldr	r0, .L259+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L254
	mov	r3, r4
	movw	r2, #1085
	ldr	r1, .L259+4
	ldr	r0, .L259+12
	bl	printk
.L254:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L260:
	.align	2
.L259:
	.word	rc_debug
	.word	.LANCHOR0+593
	.word	.LC82
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_hal_end, .-rc_model_v2_smt_hal_end
	.align	1
	.global	bits_model_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_deinit, %function
bits_model_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, .L294
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L262
	mov	r3, r0
	movs	r2, #82
	ldr	r1, .L294+4
	ldr	r0, .L294+8
	bl	printk
.L262:
	ldr	r0, [r4, #320]
	cbz	r0, .L263
	bl	mpp_data_deinit
	movs	r3, #0
	str	r3, [r4, #320]
.L263:
	ldr	r0, [r4, #324]
	cbz	r0, .L264
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #324]
.L264:
	ldr	r0, [r4, #328]
	cbz	r0, .L265
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #328]
.L265:
	ldr	r0, [r4, #332]
	cbz	r0, .L266
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #332]
.L266:
	ldr	r0, [r4, #552]
	cbz	r0, .L267
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #552]
.L267:
	ldr	r0, [r4, #556]
	cbz	r0, .L268
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #556]
.L268:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L269
	mov	r3, r4
	movs	r2, #114
	ldr	r1, .L294+4
	ldr	r0, .L294+12
	bl	printk
.L269:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L295:
	.align	2
.L294:
	.word	rc_debug
	.word	.LANCHOR0+617
	.word	.LC1
	.word	.LC3
	.fnend
	.size	bits_model_smt_deinit, .-bits_model_smt_deinit
	.align	1
	.global	rc_model_v2_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_deinit, %function
rc_model_v2_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, .L305
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L297
	mov	r3, r0
	movw	r2, #293
	ldr	r1, .L305+4
	ldr	r0, .L305+8
	bl	printk
.L297:
	mov	r0, r5
	bl	bits_model_smt_deinit
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L298
	mov	r3, r5
	movw	r2, #295
	ldr	r1, .L305+4
	ldr	r0, .L305+12
	bl	printk
.L298:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L306:
	.align	2
.L305:
	.word	rc_debug
	.word	.LANCHOR0+639
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_deinit, .-rc_model_v2_smt_deinit
	.align	1
	.global	bits_model_smt_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_init, %function
bits_model_smt_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r7, .L349
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #40]
	add	r6, sp, #20
	ldrd	r8, r9, [r4, #28]
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	mov	r1, r9
	ldr	r3, [r7]
	mov	r0, r8
	str	r3, [r6]
	bl	__aeabi_idiv
	mov	r1, r9
	mov	r6, r0
	ldr	r0, [r4, #60]
	mul	r0, r0, r8
	bl	__aeabi_idiv
	mov	r7, r0
	cbnz	r0, .L308
	mov	r1, r9
	lsl	r0, r8, #3
	bl	__aeabi_idiv
	mov	r7, r0
.L308:
	ldr	r3, .L349+4
	ldr	r2, [r3]
	str	r3, [sp, #12]
	tst	r2, #1
	beq	.L309
	mov	r3, r4
	movs	r2, #131
	ldr	r1, .L349+8
	ldr	r0, .L349+12
	bl	printk
.L309:
	ldr	r0, [r4, #324]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #10
	strd	r2, [r4, #272]
	movs	r3, #1
	str	r5, [r4, #404]
	str	r3, [r4, #268]
	movs	r3, #0
	strd	r3, r3, [r4, #576]
	movs	r3, #51
	strd	r1, r3, [r4, #280]
	cbz	r0, .L310
	bl	mpp_data_deinit_v2
.L310:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #324
	bl	mpp_data_init_v2
	ldr	r0, [r4, #328]
	cbz	r0, .L311
	bl	mpp_data_deinit_v2
.L311:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #328
	bl	mpp_data_init_v2
	ldr	r0, [r4, #332]
	cbz	r0, .L312
	bl	mpp_data_deinit_v2
.L312:
	ldr	r2, [r4, #392]
	mov	r1, r7
	add	r0, r4, #332
	bl	mpp_data_init_v2
	ldr	r0, [r4, #552]
	cbz	r0, .L313
	bl	mpp_data_deinit_v2
.L313:
	movs	r2, #0
	mov	r1, r7
	add	r0, r4, #552
	bl	mpp_data_init_v2
	ldr	r0, [r4, #556]
	cbz	r0, .L314
	bl	mpp_data_deinit_v2
.L314:
	mov	r1, r7
	add	r7, r4, #336
	movs	r2, #0
	add	fp, r4, #408
	add	r0, r4, #556
	add	r10, r4, #444
	bl	mpp_data_init_v2
	mov	r0, r7
	bl	mpp_pid_reset
	add	r9, r4, #480
	mov	r0, fp
	add	r8, r4, #516
	bl	mpp_pid_reset
	mov	r0, r10
	bl	mpp_pid_reset
	mov	r0, r9
	bl	mpp_pid_reset
	mov	r0, r8
	bl	mpp_pid_reset
	mov	r0, r7
	movs	r3, #90
	movs	r2, #6
	movs	r1, #4
	movs	r7, #100
	str	r3, [sp]
	movs	r3, #0
	str	r6, [sp, #4]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, fp
	str	r7, [sp]
	str	r6, [sp, #4]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, r10
	strd	r7, r6, [sp]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, r9
	strd	r7, r5, [sp]
	bl	mpp_pid_set_param
	movs	r3, #0
	mov	r0, r8
	movs	r2, #6
	movs	r1, #4
	strd	r7, r5, [sp]
	bl	mpp_pid_set_param
	ldrd	r2, r1, [r4, #28]
	ldr	r0, [r4, #48]
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r7, r0
	ldr	r0, [r4, #56]
	bl	axb_div_c
	movs	r3, #0
	movs	r2, #0
	strd	r2, [r4, #296]
	strd	r2, [r4, #304]
	movs	r3, #0
	str	r3, [r4, #312]
	mov	r8, r0
	cbnz	r5, .L315
	movs	r3, #10
	str	r7, [r4, #384]
	muls	r7, r3, r7
	str	r5, [r4, #288]
	muls	r3, r0, r3
	str	r0, [r4, #392]
	str	r7, [r4, #380]
	str	r3, [r4, #388]
.L316:
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L320
	mov	r3, r4
	movs	r2, #212
	ldr	r1, .L349+8
	ldr	r0, .L349+16
	bl	printk
.L320:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L315:
	cmp	r5, #1
	bne	.L317
	ldr	r2, [r4, #204]
	str	r5, [r4, #288]
	strd	r7, r3, [r4, #380]
	strd	r0, r3, [r4, #388]
	cmp	r2, #0
	beq	.L316
	str	r3, [r4, #204]
	b	.L316
.L317:
	cmp	r5, r6
	bge	.L318
	asrs	r7, r7, #1
	adds	r5, r5, #1
	asrs	r0, r0, #1
	str	r7, [r4, #384]
	str	r0, [r4, #392]
	movs	r3, #2
	muls	r7, r5, r7
	str	r3, [r4, #288]
	muls	r0, r5, r0
	str	r7, [r4, #380]
	str	r0, [r4, #388]
	b	.L316
.L318:
	cmp	r5, #50
	ble	.L319
	cmp	r5, #100
	ble	.L322
	cmp	r5, #200
	ble	.L323
	cmp	r5, #300
	ite	le
	movle	r3, #3
	movgt	r3, #4
.L319:
	movs	r2, #3
	str	r2, [r4, #288]
	add	r2, sp, #40
	rsb	r6, r6, #1
	add	r3, r2, r3, lsl #2
	mov	r1, r6
	ldr	r5, [r3, #-20]
	mul	r0, r7, r5
	mul	r5, r8, r5
	add	r0, r0, r0, lsr #31
	add	r5, r5, r5, lsr #31
	asrs	r0, r0, #1
	str	r0, [r4, #380]
	asrs	r5, r5, #1
	str	r5, [r4, #388]
	bl	__aeabi_idiv
	mov	r1, r6
	add	r0, r0, r7
	str	r0, [r4, #384]
	mov	r0, r5
	bl	__aeabi_idiv
	add	r0, r0, r8
	str	r0, [r4, #392]
	b	.L316
.L322:
	movs	r3, #1
	b	.L319
.L323:
	movs	r3, #2
	b	.L319
.L350:
	.align	2
.L349:
	.word	.LANCHOR0+664
	.word	rc_debug
	.word	.LANCHOR0+684
	.word	.LC1
	.word	.LC3
	.fnend
	.size	bits_model_smt_init, .-bits_model_smt_init
	.align	1
	.global	rc_model_v2_smt_h265_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h265_init, %function
rc_model_v2_smt_h265_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L360
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L352
	mov	r3, r0
	mov	r2, #268
	ldr	r1, .L360+4
	ldr	r0, .L360+8
	bl	printk
.L352:
	mov	r2, #260
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L353
	mov	r3, r4
	movw	r2, #273
	ldr	r1, .L360+4
	ldr	r0, .L360+12
	bl	printk
.L353:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L361:
	.align	2
.L360:
	.word	rc_debug
	.word	.LANCHOR0+704
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_h265_init, .-rc_model_v2_smt_h265_init
	.align	1
	.global	rc_model_v2_smt_h264_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h264_init, %function
rc_model_v2_smt_h264_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L371
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L363
	mov	r3, r0
	movw	r2, #281
	ldr	r1, .L371+4
	ldr	r0, .L371+8
	bl	printk
.L363:
	mov	r2, #260
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L364
	mov	r3, r4
	mov	r2, #286
	ldr	r1, .L371+4
	ldr	r0, .L371+12
	bl	printk
.L364:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L372:
	.align	2
.L371:
	.word	rc_debug
	.word	.LANCHOR0+730
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_h264_init, .-rc_model_v2_smt_h264_init
	.global	__aeabi_idivmod
	.align	1
	.global	bits_model_update_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_update_smt, %function
bits_model_update_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, .L388
	mov	r5, r1
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L374
	mov	r3, r0
	movs	r2, #223
	ldr	r1, .L388+4
	ldr	r0, .L388+8
	bl	printk
.L374:
	mov	r1, r5
	ldr	r0, [r4, #332]
	bl	mpp_data_update_v2
	ldr	r1, [r4, #372]
	subs	r3, r1, r5
	str	r3, [r4, #396]
	ldr	r3, [r4, #376]
	subs	r1, r5, r1
	subs	r3, r3, r5
	str	r3, [r4, #400]
	ldr	r3, [r4, #260]
	cmp	r3, #2
	bne	.L375
	ldrd	r3, r2, [r4, #296]
	add	r0, r4, #408
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #296]
	movs	r2, #1
	bl	mpp_pid_update
	ldr	r1, [r4, #376]
	movs	r2, #1
	add	r0, r4, #444
	subs	r1, r5, r1
	bl	mpp_pid_update
.L376:
	ldr	r1, [r4, #372]
	movs	r2, #1
	add	r0, r4, #480
	subs	r1, r5, r1
	bl	mpp_pid_update
	ldr	r1, [r4, #376]
	movs	r2, #1
	add	r0, r4, #516
	subs	r1, r5, r1
	bl	mpp_pid_update
	ldr	r3, [r4, #312]
	ldr	r0, [r4, #296]
	add	r5, r5, r3
	ldr	r3, [r4, #304]
	str	r5, [r4, #312]
	ldr	r1, [r4, #28]
	add	r0, r0, r3
	bl	__aeabi_idivmod
	mov	r2, r1
	cbnz	r1, .L377
	ldr	r3, [r4, #48]
	add	r0, r4, #336
	ldr	r7, [r4, #56]
	adds	r1, r3, r7
	asrs	r1, r1, #1
	add	ip, r1, r1, lsl #1
	cmp	ip, r5, lsl #1
	ble	.L378
.L387:
	subs	r1, r1, r5
	bl	mpp_pid_update
	movs	r3, #0
	str	r3, [r4, #312]
.L377:
	ldr	r3, [r4, #560]
	str	r3, [r4, #564]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L380
	mov	r3, r4
	movw	r2, #259
	ldr	r1, .L388+4
	ldr	r0, .L388+12
	bl	printk
.L380:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L375:
	ldrd	r3, r2, [r4, #304]
	ldr	r0, [r4, #552]
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #304]
	bl	mpp_data_update_v2
	ldr	r1, [r4, #376]
	ldr	r0, [r4, #556]
	subs	r1, r5, r1
	bl	mpp_data_update_v2
	b	.L376
.L378:
	movs	r1, #6
	ldr	r8, .L388+16
	muls	r1, r7, r1
	lsls	r3, r3, #2
	smull	r10, fp, r3, r8
	asrs	r3, r3, #31
	smull	r8, r9, r1, r8
	asrs	r1, r1, #31
	rsb	r3, r3, fp, asr #2
	rsb	r1, r1, r9, asr #2
	add	r1, r1, r3
	b	.L387
.L389:
	.align	2
.L388:
	.word	rc_debug
	.word	.LANCHOR0+756
	.word	.LC1
	.word	.LC3
	.word	1717986919
	.fnend
	.size	bits_model_update_smt, .-bits_model_update_smt
	.align	1
	.global	rc_model_v2_smt_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_end, %function
rc_model_v2_smt_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r6, .L413
	mov	r5, r1
	ldr	r7, [r1, #184]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L391
	add	r3, r1, #160
	movw	r2, #1050
	str	r3, [sp]
	mov	r3, r4
	ldr	r1, .L413+4
	ldr	r0, .L413+8
	bl	printk
.L391:
	ldr	r3, [r6]
	lsls	r1, r3, #25
	bpl	.L392
	ldr	r3, [r5, #208]
	movw	r2, #1051
	ldr	r1, .L413+4
	ldr	r0, .L413+12
	str	r3, [sp]
	ldr	r3, [r5, #204]
	bl	printk
.L392:
	ldr	r1, [r5, #204]
	ldr	r0, [r4, #324]
	bl	mpp_data_update_v2
	ldr	r1, [r5, #208]
	ldr	r0, [r4, #328]
	bl	mpp_data_update_v2
	movs	r3, #0
	str	r3, [r4, #268]
	ldr	r3, [r4, #260]
	cbz	r3, .L393
	ldr	r3, [r4, #288]
	cmp	r3, #1
	bne	.L394
.L393:
	ldr	r1, [r4, #560]
	ldr	r0, [r4, #320]
	bl	mpp_data_update
.L395:
	ldr	r3, [r6]
	lsls	r2, r3, #25
	bpl	.L396
	mov	r3, r7
	mov	r2, #1064
	ldr	r1, .L413+4
	ldr	r0, .L413+16
	bl	printk
.L396:
	mov	r1, r7
	mov	r0, r4
	bl	bits_model_update_smt
	ldr	r1, [r4, #560]
	ldr	r3, [r4, #260]
	ldr	r2, [r4, #580]
	str	r1, [r4, #564]
	str	r3, [r4, #264]
	adds	r2, r2, #1
	ldr	r3, [r5, #200]
	str	r2, [r4, #580]
	str	r3, [r4, #584]
	ldr	r3, [r4, #576]
	add	r3, r3, r1
	str	r3, [r4, #576]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L397
	mov	r3, r4
	mov	r2, #1072
	ldr	r1, .L413+4
	ldr	r0, .L413+20
	bl	printk
.L397:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L394:
	ldr	r3, [r4, #560]
	strd	r7, r3, [r4, #568]
	b	.L395
.L414:
	.align	2
.L413:
	.word	rc_debug
	.word	.LANCHOR0+778
	.word	.LC83
	.word	.LC84
	.word	.LC85
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_end, .-rc_model_v2_smt_end
	.align	1
	.global	check_super_frame_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_super_frame_smt, %function
check_super_frame_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r6, .L433
	mov	r7, r1
	ldr	r8, [r0, #260]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L416
	mov	r3, r5
	mov	r2, #900
	ldr	r1, .L433+4
	ldr	r0, .L433+8
	bl	printk
.L416:
	ldr	r4, [r5, #188]
	cbz	r4, .L417
	cmp	r8, #2
	ldr	r3, [r5, #196]
	ldr	r2, [r7, #24]
	it	eq
	ldreq	r3, [r5, #192]
	cmp	r2, r3
	bcc	.L422
	cmp	r4, #1
	bne	.L423
	ldr	r3, [r6]
	lsls	r1, r3, #25
	bpl	.L419
	mov	r2, #908
	ldr	r1, .L433+4
	ldr	r0, .L433+12
	bl	printk
.L419:
	movs	r3, #1
	str	r3, [r5, #176]
	movs	r3, #0
	str	r3, [r5, #184]
.L423:
	mov	r4, #-1
	b	.L417
.L422:
	movs	r4, #0
.L417:
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L415
	mov	r3, r5
	movw	r2, #915
	ldr	r1, .L433+4
	ldr	r0, .L433+16
	bl	printk
.L415:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L434:
	.align	2
.L433:
	.word	rc_debug
	.word	.LANCHOR0+798
	.word	.LC1
	.word	.LC86
	.word	.LC3
	.fnend
	.size	check_super_frame_smt, .-check_super_frame_smt
	.align	1
	.global	check_re_enc_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_re_enc_smt, %function
check_re_enc_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r0
	ldr	r5, [r0, #60]
	mov	r7, r1
	ldr	r10, [r0, #260]
	ldr	r0, [r0, #332]
	bl	mpp_data_sum_v2
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, #-1
	mul	r6, r0, r5
	mov	r8, r0
	ldr	r0, [r4, #332]
	bl	mpp_data_get_pre_val_v2
	ldr	r3, [r7, #24]
	mov	r1, r5
	subs	r0, r3, r0
	add	r0, r0, r6
	bl	__aeabi_idiv
	ldr	r3, .L474
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #1
	mov	r6, r0
	beq	.L436
	mov	r3, r4
	movw	r2, #931
	ldr	r1, .L474+4
	ldr	r0, .L474+8
	bl	printk
.L436:
	ldr	r3, [r9]
	lsls	r0, r3, #25
	bpl	.L437
	strd	r8, r6, [sp]
	movw	r2, #933
	ldr	r3, [r4, #52]
	ldr	r1, .L474+4
	ldr	r0, .L474+12
	bl	printk
.L437:
	ldr	r2, [r4, #588]
	ldr	r3, [r4, #156]
	cmp	r2, r3
	blt	.L438
.L440:
	movs	r5, #0
.L435:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L438:
	ldr	r3, [r4, #248]
	cmp	r3, #0
	bne	.L440
	mov	r1, r7
	mov	r0, r4
	bl	check_super_frame_smt
	mov	r5, r0
	cmp	r0, #0
	bne	.L448
	ldr	r3, [r4, #204]
	cbz	r3, .L441
	ldr	r3, [r4, #268]
	cmp	r3, #0
	beq	.L440
.L441:
	ldr	r3, [r9]
	lsls	r1, r3, #22
	bpl	.L442
	str	r10, [sp]
	movw	r2, #947
	ldr	r3, [r4, #176]
	ldr	r1, .L474+4
	ldr	r0, .L474+16
	bl	printk
.L442:
	ldr	r3, [r4, #176]
	ldr	r2, [r9]
	cbz	r3, .L443
	cmp	r10, #0
	bne	.L443
	ldr	r0, [r4, #180]
	lsls	r2, r2, #22
	add	r1, r0, #100
	ldr	r0, [r4, #56]
	mul	r0, r0, r1
	ldr	r1, .L474+20
	umull	r0, r1, r0, r1
	lsr	r5, r1, #5
	bpl	.L444
	ldr	r2, [r4, #52]
	strd	r5, r6, [sp, #4]
	ldr	r1, .L474+4
	str	r2, [sp]
	movw	r2, #951
	ldr	r0, .L474+24
	bl	printk
.L444:
	cmp	r6, r5
	mov	r5, #-1
	it	le
	movle	r5, #0
	b	.L435
.L443:
	cmp	r10, #0
	beq	.L445
	cmp	r10, #2
	bne	.L449
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsr #31
	asrs	r3, r3, #1
.L446:
	ldr	r1, [r7, #24]
	cmp	r1, r3
	ble	.L447
	ldr	r3, [r4, #56]
	sub	r1, r3, r3, asr #3
	cmp	r1, r6
	bge	.L447
	ldr	r0, .L474+28
	asrs	r5, r3, #31
	sub	r6, r6, r8
	smull	r0, r1, r3, r0
	rsb	r5, r5, r1, asr #3
	cmp	r5, r6
	mov	r5, #-1
	it	ge
	movge	r5, #0
.L447:
	lsls	r3, r2, #31
	bpl	.L435
	str	r5, [sp]
	mov	r3, r4
	mov	r2, #972
	ldr	r1, .L474+4
	ldr	r0, .L474+32
	bl	printk
	b	.L435
.L445:
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	b	.L446
.L449:
	movs	r3, #0
	b	.L446
.L448:
	mov	r5, #-1
	b	.L435
.L475:
	.align	2
.L474:
	.word	rc_debug
	.word	.LANCHOR0+820
	.word	.LC1
	.word	.LC87
	.word	.LC88
	.word	1374389535
	.word	.LC89
	.word	1717986919
	.word	.LC90
	.fnend
	.size	check_re_enc_smt, .-check_re_enc_smt
	.align	1
	.global	rc_model_v2_smt_check_reenc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_check_reenc, %function
rc_model_v2_smt_check_reenc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r5, r1
	ldr	r7, .L518
	add	r6, r1, #160
	mov	r4, r0
	ldr	r3, [r7]
	lsls	r1, r3, #31
	bpl	.L477
	mov	r3, r0
	str	r6, [sp]
	movw	r2, #983
	ldr	r1, .L518+4
	ldr	r0, .L518+8
	bl	printk
.L477:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r5, #156]
	ldr	r3, [r4, #8]
	cmp	r3, #2
	beq	.L479
	ldr	r3, [r5, #264]
	lsls	r2, r3, #31
	bmi	.L479
	ldr	r3, [r4, #596]
	cmp	r3, #0
	bne	.L479
	ldr	r3, [r4, #600]
	cmp	r3, #0
	bne	.L479
	mov	r1, r6
	mov	r0, r4
	bl	check_re_enc_smt
	cmp	r0, #0
	beq	.L479
	ldrb	r3, [r5, #152]	@ zero_extendqisi2
	ldr	r6, [r4, #176]
	tst	r3, #16
	ldr	r3, [r4, #184]
	it	ne
	movne	r6, #0
	cbz	r3, .L482
	ldr	r2, [r4, #592]
	cmp	r3, r2
	it	ls
	movls	r6, #0
.L482:
	ldr	r3, [r7]
	lsls	r3, r3, #22
	bpl	.L483
	ldr	r3, [r4, #592]
	movw	r2, #1001
	ldr	r1, .L518+4
	ldr	r0, .L518+12
	str	r3, [sp]
	mov	r3, r6
	bl	printk
.L483:
	ldr	r1, [r7]
	cmp	r6, #1
	and	r1, r1, #512
	beq	.L484
	cmp	r6, #2
	beq	.L485
	ldr	r3, [r4, #260]
	ldr	r0, [r4, #196]
	cmp	r3, #2
	ldr	r6, [r5, #184]
	ldr	r3, [r5, #172]
	it	eq
	ldreq	r0, [r4, #192]
	lsls	r2, r0, #1
	cmp	r6, r2
	ble	.L488
	adds	r3, r3, #3
.L516:
	str	r3, [r5, #172]
.L489:
	ldrd	r2, r3, [r5, #172]
	cmp	r2, r3
	bge	.L491
	ldr	r3, [r4, #588]
	adds	r3, r3, #1
	str	r3, [r4, #588]
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r5, #156]
.L491:
	movs	r3, #0
	str	r3, [r4, #592]
	cbz	r1, .L479
	movw	r2, #1036
	ldr	r1, .L518+4
	ldr	r0, .L518+16
	b	.L517
.L484:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #5
	orr	r3, r3, #5
	strb	r3, [r5, #156]
	ldr	r3, [r4, #592]
	str	r6, [r4, #596]
	adds	r3, r3, #1
	str	r3, [r4, #592]
	cbz	r1, .L479
	ldr	r1, .L518+4
	movw	r2, #1009
	ldr	r0, .L518+20
.L517:
	bl	printk
.L479:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L485:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #20
	orr	r3, r3, #20
	strb	r3, [r5, #156]
	movs	r3, #1
	str	r3, [r4, #600]
	ldr	r3, [r4, #592]
	adds	r3, r3, #1
	str	r3, [r4, #592]
	cmp	r1, #0
	beq	.L479
	mov	r2, #1016
	ldr	r1, .L518+4
	ldr	r0, .L518+24
	b	.L517
.L488:
	add	r2, r2, r0
	add	r2, r2, r2, lsr #31
	cmp	r6, r2, asr #1
	ble	.L490
	adds	r3, r3, #2
	b	.L516
.L490:
	cmp	r6, r0
	ble	.L489
	adds	r3, r3, #1
	b	.L516
.L519:
	.align	2
.L518:
	.word	rc_debug
	.word	.LANCHOR0+837
	.word	.LC83
	.word	.LC91
	.word	.LC94
	.word	.LC92
	.word	.LC93
	.fnend
	.size	rc_model_v2_smt_check_reenc, .-rc_model_v2_smt_check_reenc
	.global	smt_h265e
	.global	smt_h264e
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mb_num, %object
	.size	mb_num, 36
mb_num:
	.word	0
	.word	200
	.word	700
	.word	1200
	.word	2000
	.word	4000
	.word	8000
	.word	16000
	.word	20000
	.type	qscale2qp, %object
	.size	qscale2qp, 96
qscale2qp:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	16
	.byte	18
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	30
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	40
	.byte	40
	.byte	40
	.byte	40
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.type	tab_bit, %object
	.size	tab_bit, 36
tab_bit:
	.word	3780
	.word	3570
	.word	3150
	.word	2940
	.word	2730
	.word	3780
	.word	2100
	.word	1680
	.word	2100
	.type	__func__.25734, %object
	.size	__func__.25734, 21
__func__.25734:
	.ascii	"calc_smt_debreath_qp\000"
	.type	strength_map.25733, %object
	.size	strength_map.25733, 36
strength_map.25733:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.type	intra_qp_map.25731, %object
	.size	intra_qp_map.25731, 8
intra_qp_map.25731:
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	inter_pqp0, %object
	.size	inter_pqp0, 52
inter_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	21
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.type	inter_pqp1, %object
	.size	inter_pqp1, 52
inter_pqp1:
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	44
	.type	intra_pqp1, %object
	.size	intra_pqp1, 52
intra_pqp1:
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.type	intra_pqp0, %object
	.size	intra_pqp0, 156
intra_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	17
	.byte	18
	.byte	18
	.byte	19
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	16
	.byte	16
	.byte	17
	.byte	17
	.byte	18
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	23
	.byte	24
	.byte	26
	.byte	28
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.type	__func__.25953, %object
	.size	__func__.25953, 22
__func__.25953:
	.ascii	"rc_model_v2_smt_start\000"
	.type	__func__.26008, %object
	.size	__func__.26008, 26
__func__.26008:
	.ascii	"rc_model_v2_smt_hal_start\000"
	.type	__func__.26013, %object
	.size	__func__.26013, 24
__func__.26013:
	.ascii	"rc_model_v2_smt_hal_end\000"
	.type	__func__.25655, %object
	.size	__func__.25655, 22
__func__.25655:
	.ascii	"bits_model_smt_deinit\000"
	.type	__func__.25695, %object
	.size	__func__.25695, 23
__func__.25695:
	.ascii	"rc_model_v2_smt_deinit\000"
	.space	2
.LC0:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.type	__func__.25668, %object
	.size	__func__.25668, 20
__func__.25668:
	.ascii	"bits_model_smt_init\000"
	.type	__func__.25684, %object
	.size	__func__.25684, 26
__func__.25684:
	.ascii	"rc_model_v2_smt_h265_init\000"
	.type	__func__.25690, %object
	.size	__func__.25690, 26
__func__.25690:
	.ascii	"rc_model_v2_smt_h264_init\000"
	.type	__func__.25678, %object
	.size	__func__.25678, 22
__func__.25678:
	.ascii	"bits_model_update_smt\000"
	.type	__func__.26003, %object
	.size	__func__.26003, 20
__func__.26003:
	.ascii	"rc_model_v2_smt_end\000"
	.type	__func__.25962, %object
	.size	__func__.25962, 22
__func__.25962:
	.ascii	"check_super_frame_smt\000"
	.type	__func__.25975, %object
	.size	__func__.25975, 17
__func__.25975:
	.ascii	"check_re_enc_smt\000"
	.type	__func__.25988, %object
	.size	__func__.25988, 28
__func__.25988:
	.ascii	"rc_model_v2_smt_check_reenc\000"
	.space	3
	.type	smt_h265e, %object
	.size	smt_h265e, 48
smt_h265e:
	.word	.LC19
	.word	16777220
	.word	608
	.word	rc_model_v2_smt_h265_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.type	smt_h264e, %object
	.size	smt_h264e, 48
smt_h264e:
	.word	.LC19
	.word	7
	.word	608
	.word	rc_model_v2_smt_h264_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC1:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC2:
	.ascii	"\0016%s:%d: i qp_out %d, qp_start_sum = %d, intra_l"
	.ascii	"v4_prop %d\000"
.LC3:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC4:
	.ascii	"\012--------RC base param--------------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC5:
	.ascii	"Gop\000"
.LC6:
	.ascii	"ChnId\000"
.LC7:
	.ascii	"%7s|%7s|%8s|%6s|%6s|%8s|%13s|%13s|%5s|%5s \012\000"
.LC8:
	.ascii	"PQp\000"
.LC9:
	.ascii	"IQp\000"
.LC10:
	.ascii	"MaxBr(kbps)\000"
.LC11:
	.ascii	"MinBr(kbps)\000"
.LC12:
	.ascii	"RcMode\000"
.LC13:
	.ascii	"TrgFr\000"
.LC14:
	.ascii	"ViFr\000"
.LC15:
	.ascii	"StatTm\000"
.LC16:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13s|%13s|%5u|%5u \012\000"
.LC17:
	.ascii	"N/A\000"
.LC18:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13u|%13u|%5s|%5s \012\000"
.LC19:
	.ascii	"smart\000"
.LC20:
	.ascii	"\012--------RC run comm param 1--------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC21:
	.ascii	"bLost\000"
.LC22:
	.ascii	"%7s|%8s|%12s|%12s|%10s \012\000"
.LC23:
	.ascii	"EncGap\000"
.LC24:
	.ascii	"LostFrmStr\000"
.LC25:
	.ascii	"LostThr\000"
.LC26:
	.ascii	"%7d|%8s|%12u|%12d|%10u \012\000"
.LC27:
	.ascii	"\012--------RC run comm param 2--------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC28:
	.ascii	"SprFrmMod\000"
.LC29:
	.ascii	"%7s|%12s|%12s|%12s|%12s \012\000"
.LC30:
	.ascii	"RCPriority\000"
.LC31:
	.ascii	"SprPFrm\000"
.LC32:
	.ascii	"SprIFrm\000"
.LC33:
	.ascii	"%7d|%12s|%12u|%12u|%12u \012\000"
.LC34:
	.ascii	"\012--------RC gop mode attr-----------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC35:
	.ascii	"GopMode\000"
.LC36:
	.ascii	"%7s|%10s|%10s|%12s|%10s \012\000"
.LC37:
	.ascii	"ViQpDelta\000"
.LC38:
	.ascii	"BgInterval\000"
.LC39:
	.ascii	"IpQpDelta\000"
.LC40:
	.ascii	"%7d|%10s|%10d|%12u|%10d\012\000"
.LC41:
	.ascii	"%7d|%10s|%10d|%12s|%10s\012\000"
.LC42:
	.ascii	"\012--------RC run smart common param--------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC43:
	.ascii	"MaxQp\000"
.LC44:
	.ascii	"%7s|%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s|%15s\012\000"
.LC45:
	.ascii	"MaxReEncTimes\000"
.LC46:
	.ascii	"FrmMinIQp\000"
.LC47:
	.ascii	"FrmMaxIQp\000"
.LC48:
	.ascii	"FrmMinQp\000"
.LC49:
	.ascii	"FrmMaxQp\000"
.LC50:
	.ascii	"MinIQp\000"
.LC51:
	.ascii	"MaxIQp\000"
.LC52:
	.ascii	"MinQp\000"
.LC53:
	.ascii	"%7d|%8u|%8u|%8u|%8u|%10d|%10d|%10d|%10d|%15d\012\000"
.LC54:
	.ascii	"\012--------RC HierarchicalQp INFO-----------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC55:
	.ascii	"bEnable\000"
.LC56:
	.ascii	"%7s|%10s|%12s|%12s|%12s|%12s|%12s|%12s|%12s|%12s\012"
	.ascii	"\000"
.LC57:
	.ascii	"QpDelta[3]\000"
.LC58:
	.ascii	"QpDelta[2]\000"
.LC59:
	.ascii	"QpDelta[1]\000"
.LC60:
	.ascii	"QpDelta[0]\000"
.LC61:
	.ascii	"FrameNum[3]\000"
.LC62:
	.ascii	"FrameNum[2]\000"
.LC63:
	.ascii	"FrameNum[1]\000"
.LC64:
	.ascii	"FrameNum[0]\000"
.LC65:
	.ascii	"%7d|%10s|%12d|%12d|%12d|%12d|%12d|%12d|%12d|%12d\012"
	.ascii	"\000"
.LC66:
	.ascii	"\012--------RC debreath_effect info----------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC67:
	.ascii	"%7s|%10s|%10s|%18s\012\000"
.LC68:
	.ascii	"DeBrthEfctCnt\000"
.LC69:
	.ascii	"Strength0\000"
.LC70:
	.ascii	"%7d|%10s|%10d|%18u\012\000"
.LC71:
	.ascii	"%7d|%10s|%10s|%18u\012\000"
.LC72:
	.ascii	"\012--------RC run smart info1---------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"-----\012\000"
.LC73:
	.ascii	"RealBt(kb)\000"
.LC74:
	.ascii	"%7s|%12s|%10s|%10s|%15s|%15s|%12s\012\000"
.LC75:
	.ascii	"scene_mode\000"
.LC76:
	.ascii	"md_switch_qp\000"
.LC77:
	.ascii	"md_switch_en\000"
.LC78:
	.ascii	"StartQp\000"
.LC79:
	.ascii	"IPRatio\000"
.LC80:
	.ascii	"%7d|%12u|%10d|%10u|%15d|%15d|%12d\012\000"
.LC81:
	.ascii	"\0016%s:%d: smt_hal_start enter ctx %p task %p\012\000"
.LC82:
	.ascii	"\0016%s:%d: smt_hal_end enter ctx %p task %p\012\000"
.LC83:
	.ascii	"\0016%s:%d: enter ctx %p cfg %p\012\000"
.LC84:
	.ascii	"\0016%s:%d: motion_level %u, complex_level %u\012\000"
.LC85:
	.ascii	"\0016%s:%d: bits_mode_update real_bit %d\000"
.LC86:
	.ascii	"\0016%s:%d: super frame drop current frame\000"
.LC87:
	.ascii	"\0016%s:%d: reenc check target_bps %d last_ins_bps "
	.ascii	"%d ins_bps %d\000"
.LC88:
	.ascii	"\0016%s:%d: drop mode %d frame_type %d\012\000"
.LC89:
	.ascii	"\0016%s:%d: drop mode %d check max_bps %d bit_thr %"
	.ascii	"d ins_bps %d\000"
.LC90:
	.ascii	"\0016%s:%d: leave %p ret %d\012\000"
.LC91:
	.ascii	"\0016%s:%d: reenc drop_mode %d drop_cnt %d\012\000"
.LC92:
	.ascii	"\0016%s:%d: drop\012\000"
.LC93:
	.ascii	"\0016%s:%d: force_pskip\012\000"
.LC94:
	.ascii	"\0016%s:%d: drop disable\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
