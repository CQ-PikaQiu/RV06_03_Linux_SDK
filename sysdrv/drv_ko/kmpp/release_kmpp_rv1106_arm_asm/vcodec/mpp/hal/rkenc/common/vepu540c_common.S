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
	.file	"vepu540c_common.c"
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
	.type	vepu540c_jpeg_set_uv_offset.constprop.0, %function
vepu540c_jpeg_set_uv_offset.constprop.0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r0, [r2, #52]
	mov	r7, r1
	mov	r5, r2
	bl	mpp_frame_get_hor_stride
	cbz	r0, .L2
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_hor_stride
.L24:
	mov	r4, r0
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_ver_stride
	cbz	r0, .L4
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_ver_stride
.L5:
	muls	r4, r0, r4
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_fmt
	tst	r0, #15728640
	beq	.L6
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_fbc_offset
	movw	r1, #586
	mov	r4, r0
	mov	r2, r0
	ldr	r0, .L26
	bl	printk
	cmp	r4, #0
	bne	.L16
.L8:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L2:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_width
	b	.L24
.L4:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_height
	b	.L5
.L6:
	cmp	r7, #9
	bhi	.L9
	adr	r3, .L10
	ldr	pc, [r3, r7, lsl #2]
	.p2align 2
.L10:
	.word	.L8+1
	.word	.L8+1
	.word	.L8+1
	.word	.L9+1
	.word	.L17+1
	.word	.L13+1
	.word	.L17+1
	.word	.L25+1
	.word	.L8+1
	.word	.L8+1
	.p2align 1
.L13:
	add	r3, r4, r4, lsl #1
	lsrs	r3, r3, #1
.L12:
	cbz	r4, .L14
.L7:
	ldr	r0, [r6, #36]
	add	r0, r0, r4
	str	r0, [r6, #36]
.L14:
	cmp	r3, #0
	beq	.L8
	ldr	r2, [r6, #40]
	add	r3, r3, r2
	str	r3, [r6, #40]
	b	.L8
.L9:
	mov	r2, r7
	movw	r1, #619
	ldr	r0, .L26+4
	bl	printk
.L25:
	add	r3, r4, r4, lsl #2
	lsrs	r3, r3, #2
	b	.L12
.L17:
	mov	r3, r4
	b	.L12
.L16:
	movs	r3, #0
	b	.L7
.L27:
	.align	2
.L26:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	vepu540c_jpeg_set_uv_offset.constprop.0, .-vepu540c_jpeg_set_uv_offset.constprop.0
	.align	1
	.global	vepu540c_set_roi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_roi, %function
vepu540c_set_roi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r0, #16
	mov	r5, r0
	.pad #24
	sub	sp, sp, #24
	mov	r6, r1
	mov	r7, r2
	movs	r1, #0
	movs	r2, #128
	mov	r0, r4
	mov	r8, r3
	bl	memset
	cbz	r5, .L29
	cbnz	r6, .L30
.L29:
	ldr	r1, .L55
	mov	r3, r5
	ldr	r0, .L55+4
	movs	r2, #39
	str	r6, [sp]
.L54:
	bl	printk
	b	.L53
.L30:
	ldr	r3, [r6, #4]
	cmp	r3, #8
	bhi	.L32
	ldr	r0, .L55+8
	add	r2, r6, #24
	ldr	ip, .L55+32
	movs	r3, #0
.L33:
	ldr	r1, [r6, #4]
	sub	r5, r2, #16
	cmp	r1, r3
	bgt	.L41
.L31:
	movs	r0, #0
	b	.L28
.L32:
	movs	r2, #44
	ldr	r1, .L55
	ldr	r0, .L55+12
	bl	printk
.L53:
	mov	r0, #-1
.L28:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L41:
	ldrh	lr, [r2, #-16]
	ldrh	r1, [r2, #-12]
	add	r1, r1, lr
	cmp	r1, r7
	bgt	.L42
	ldrh	r1, [r2, #-14]
	ldrh	r9, [r2, #-10]
	add	r1, r1, r9
	cmp	r1, r8
	mov	r1, #-1
	it	le
	movle	r1, #0
.L34:
	ldrh	r9, [r2, #-8]
	ldrb	r10, [r2, #-1]	@ zero_extendqisi2
	cmp	r9, #1
	bhi	.L45
	ldrh	r9, [r2, #-4]
	cmp	r9, #7
	bhi	.L45
	ldrb	r9, [r2, #-2]	@ zero_extendqisi2
	cmp	r9, #1
	bhi	.L45
	cmp	r10, #2
	it	cs
	movcs	r1, #-1
.L35:
	ldrsh	r9, [r2, #-6]
	cmp	r10, #0
	beq	.L36
	cmp	r9, #51
	ble	.L38
.L37:
	movs	r2, #65
	ldr	r1, .L55
	ldr	r0, .L55+16
	bl	printk
	ldrh	r3, [r5]
	ldr	r1, .L55
	ldr	r0, .L55+20
	strd	r7, r8, [sp, #12]
	ldrh	r2, [r5, #6]
	str	r2, [sp, #8]
	ldrh	r2, [r5, #4]
	str	r2, [sp, #4]
	ldrh	r2, [r5, #2]
	str	r2, [sp]
	movs	r2, #68
	bl	printk
	ldrh	r2, [r5, #12]
	ldrh	r3, [r5, #8]
	ldr	r1, .L55
	ldr	r0, .L55+24
	str	r2, [sp]
	movs	r2, #70
	bl	printk
	ldrsh	r2, [r5, #10]
	ldrb	r3, [r5, #15]	@ zero_extendqisi2
	ldr	r1, .L55
	ldr	r0, .L55+28
	str	r2, [sp]
	movs	r2, #72
	b	.L54
.L42:
	mov	r1, #-1
	b	.L34
.L45:
	mov	r1, #-1
	b	.L35
.L36:
	add	r9, r9, #51
	uxth	r9, r9
	cmp	r9, #102
	bhi	.L37
.L38:
	cmp	r1, #0
	bne	.L37
	add	lr, lr, #15
	ldrh	r1, [r4]
	ldrh	r5, [r4, #2]
	asr	lr, lr, #4
	bfi	r1, lr, #0, #10
	strh	r1, [r4]	@ movhi
	ldrh	r1, [r2, #-14]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	strh	r5, [r4, #2]	@ movhi
	ldrh	r5, [r2, #-12]
	ldrh	r1, [r2, #-16]
	add	r1, r1, r5
	ldrh	r5, [r4, #4]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	strh	r5, [r4, #4]	@ movhi
	ldrh	r5, [r2, #-10]
	ldrh	r1, [r2, #-14]
	add	r1, r1, r5
	ldrh	r5, [r4, #6]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	strh	r5, [r4, #6]	@ movhi
	ldrh	r5, [r2, #-6]
	bfi	r1, r5, #0, #7
	strb	r1, [r4, #8]
	ldrb	r5, [r2, #-1]	@ zero_extendqisi2
	bfi	r1, r5, #7, #1
	strb	r1, [r4, #8]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	bic	r1, r1, #63
	orr	r1, r1, #63
	strb	r1, [r4, #9]
	ldrh	r1, [r2, #-8]
	cbz	r1, .L40
	ldr	r1, [r4, #12]
	ands	r1, r1, r0
	orr	r1, r1, ip
	str	r1, [r4, #12]
.L40:
	adds	r4, r4, #16
	adds	r3, r3, #1
	adds	r2, r2, #16
	b	.L33
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	.LC2
	.word	-15732481
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	1048832
	.fnend
	.size	vepu540c_set_roi, .-vepu540c_set_roi
	.align	1
	.global	vepu540c_set_qpmap_smart
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_qpmap_smart, %function
vepu540c_set_qpmap_smart:
	.fnstart
	@ args = 20, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r0
	mov	r9, r3
	mov	r10, r2
	ldrd	r8, r6, [sp, #48]
	mov	r0, r1
	ldrd	r4, r3, [sp, #56]
	ldr	r7, [sp, #64]
	cbz	r1, .L125
	cbz	r2, .L125
	cmp	r9, #0
	beq	.L125
	clz	r2, r7
	ldrb	r1, [r5, #12]	@ zero_extendqisi2
	lsrs	r2, r2, #5
	bfi	r1, r2, #0, #1
	strb	r1, [r5, #12]
	ldr	r1, .L169
	ldr	r2, [r5, #12]
	ands	r1, r1, r2
	ldr	r2, .L169+4
	orrs	r2, r2, r1
	ldr	r1, .L169+8
	str	r2, [r5, #12]
	cmp	r3, #0
	bne	.L59
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L169+8
	adds	r6, r6, #63
	adds	r4, r4, #15
	asrs	r4, r4, #4
	str	r0, [sp, #4]
	mov	r0, r10
	bl	mpp_buffer_get_ptr_with_caller
	bics	r6, r6, #63
	it	mi
	addmi	r6, r6, #15
	asrs	r6, r6, #4
	muls	r4, r6, r4
	mov	fp, r0
	cbz	r7, .L61
.L168:
	mov	r2, r4
	movs	r1, #0
	mov	r0, r9
	bl	memset
.L125:
	mov	r7, #-1
	b	.L58
.L61:
	lsls	r2, r4, #2
	mov	r1, r7
	bl	memset
	ldr	r3, .L169+12
	add	lr, r9, #-1
	mov	r6, r7
	mov	r2, r7
	mov	ip, r7
.L62:
	cmp	ip, r4
	blt	.L66
	ldr	r1, .L169+8
	mov	r0, r10
	str	r2, [sp, #4]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldr	r2, [sp, #4]
	adds	r1, r2, r6
	cmp	r1, #0
	bgt	.L67
.L110:
	ldr	r1, .L169+8
	mov	r0, r10
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_end_cpu_access
.L58:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L66:
	ldr	r1, [sp, #4]
	ldr	r0, [r1, ip, lsl #2]
	uxtb	r1, r0
	ubfx	r0, r0, #8, #4
	adds	r1, r1, #7
	add	r0, r0, r3
	add	r1, r3, r1, lsr #3
	ldrb	r0, [r0, #75]	@ zero_extendqisi2
	ldrb	r1, [r1, #42]	@ zero_extendqisi2
	orrs	r1, r1, r0
	ldrb	r0, [lr, #1]!	@ zero_extendqisi2
	lsls	r0, r0, #2
	and	r0, r0, #63
	orrs	r1, r1, r0
	strb	r1, [lr]
	lsls	r0, r1, #30
	beq	.L63
	adds	r6, r6, #1
.L64:
	add	ip, ip, #1
	b	.L62
.L63:
	lsls	r0, r1, #28
	bmi	.L65
	tst	r1, #48
	beq	.L64
	tst	r1, #12
	beq	.L64
.L65:
	adds	r2, r2, #1
	b	.L64
.L67:
	cmp	r8, #35
	bls	.L126
	cmp	r8, #41
	bls	.L127
	cmp	r8, #46
	ite	cc
	movcc	r1, #2
	movcs	r1, #3
.L68:
	movs	r0, #100
	lsl	ip, r4, #1
	muls	r6, r0, r6
	cmp	ip, r6
	ble	.L69
	cmp	r8, #40
	ldrh	r2, [r5, #12]
	bls	.L70
	movs	r0, #26
.L164:
	bfi	r2, r0, #6, #6
	strh	r2, [r5, #12]	@ movhi
	add	r2, r4, r4, lsr #31
	cmp	r6, r2, asr #1
	bge	.L73
	adds	r1, r1, #5
.L74:
	rsb	r1, r1, #128
	movs	r2, #0
.L76:
	cmp	r2, r4
	bge	.L110
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	lsls	r0, r0, #30
	it	ne
	strbne	r1, [fp, r2, lsl #2]
	adds	r2, r2, #1
	b	.L76
.L126:
	movs	r1, #0
	b	.L68
.L127:
	movs	r1, #1
	b	.L68
.L70:
	cmp	r8, #35
	ite	hi
	movhi	r0, #25
	movls	r0, #23
	b	.L164
.L73:
	cmp	r4, r6
	ite	gt
	addgt	r1, r1, #4
	addle	r1, r1, #3
	b	.L74
.L69:
	muls	r2, r0, r2
	movs	r0, #10
	muls	r0, r4, r0
	cmp	r0, r2
	ble	.L110
	cmp	r8, #40
	ldrh	r0, [r5, #12]
	bls	.L80
	movs	r6, #26
.L165:
	cmp	ip, r2
	bfi	r0, r6, #6, #6
	ite	gt
	addgt	r1, r1, #2
	addle	r1, r1, #1
	rsb	r1, r1, #128
	movs	r2, #0
	movs	r6, #3
	strh	r0, [r5, #12]	@ movhi
.L85:
	cmp	r2, r4
	bge	.L110
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	lsls	r3, r0, #30
	bne	.L86
	lsls	r5, r0, #28
	bmi	.L87
	tst	r0, #48
	beq	.L86
	tst	r0, #12
	beq	.L86
.L87:
	add	r0, fp, r2, lsl #2
	strb	r1, [fp, r2, lsl #2]
	ldrb	r5, [r0, #2]	@ zero_extendqisi2
	bfi	r5, r6, #0, #4
	strb	r5, [r0, #2]
.L86:
	adds	r2, r2, #1
	b	.L85
.L80:
	cmp	r8, #35
	ite	hi
	movhi	r6, #25
	movls	r6, #23
	b	.L165
.L59:
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L169+8
	adds	r6, r6, #31
	adds	r4, r4, #31
	str	r0, [sp, #4]
	mov	r0, r10
	bl	mpp_buffer_get_ptr_with_caller
	bics	r6, r6, #31
	it	mi
	addmi	r6, r6, #15
	bics	r4, r4, #31
	it	mi
	addmi	r4, r4, #15
	asrs	r6, r6, #4
	asrs	r4, r4, #4
	muls	r4, r6, r4
	mov	fp, r0
	cmp	r7, #0
	bne	.L168
	bic	r2, r4, #-1073741824
	mov	r1, r7
	bl	memset
	ldr	r3, .L169+12
	add	lr, r9, #-1
	mov	r6, r7
	mov	r2, r7
	mov	ip, r7
.L92:
	cmp	ip, r4
	blt	.L96
	ldr	r1, .L169+8
	mov	r0, r10
	str	r2, [sp, #4]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldr	r2, [sp, #4]
	adds	r1, r2, r6
	cmp	r1, #0
	ble	.L110
	cmp	r8, #35
	bls	.L129
	cmp	r8, #41
	bls	.L130
	cmp	r8, #46
	ite	cc
	movcc	r1, #2
	movcs	r1, #3
.L98:
	movs	r0, #100
	lsl	ip, r4, #1
	muls	r6, r0, r6
	cmp	ip, r6
	ble	.L99
	cmp	r8, #40
	ldrh	r2, [r5, #12]
	bls	.L100
	movs	r0, #26
.L166:
	bfi	r2, r0, #6, #6
	strh	r2, [r5, #12]	@ movhi
	add	r2, r4, r4, lsr #31
	cmp	r6, r2, asr #1
	bge	.L103
	adds	r1, r1, #5
.L104:
	movs	r2, #0
	rsb	r1, r1, #128
	mov	r5, r2
	mov	r6, r2
.L106:
	cmp	r2, r4
	bge	.L110
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	adds	r2, r2, #1
	ands	r0, r0, #3
	it	ne
	movne	r0, #1
	cmp	r5, r0
	it	cc
	movcc	r5, r0
	lsls	r3, r2, #30
	bne	.L106
	cbz	r5, .L108
	strb	r1, [fp, r6, lsl #2]
.L108:
	adds	r6, r6, #1
	movs	r5, #0
	b	.L106
.L96:
	ldr	r1, [sp, #4]
	ldr	r0, [r1, ip, lsl #2]
	uxtb	r1, r0
	ubfx	r0, r0, #8, #4
	adds	r1, r1, #7
	add	r0, r0, r3
	add	r1, r3, r1, lsr #3
	ldrb	r0, [r0, #75]	@ zero_extendqisi2
	ldrb	r1, [r1, #42]	@ zero_extendqisi2
	orrs	r1, r1, r0
	ldrb	r0, [lr, #1]!	@ zero_extendqisi2
	lsls	r0, r0, #2
	and	r0, r0, #63
	orrs	r1, r1, r0
	strb	r1, [lr]
	lsls	r0, r1, #30
	beq	.L93
	adds	r6, r6, #1
.L94:
	add	ip, ip, #1
	b	.L92
.L93:
	tst	r1, #40
	bne	.L95
	tst	r1, #48
	beq	.L94
	tst	r1, #12
	beq	.L94
.L95:
	adds	r2, r2, #1
	b	.L94
.L129:
	movs	r1, #0
	b	.L98
.L130:
	movs	r1, #1
	b	.L98
.L100:
	cmp	r8, #35
	ite	hi
	movhi	r0, #25
	movls	r0, #23
	b	.L166
.L103:
	cmp	r4, r6
	ite	gt
	addgt	r1, r1, #4
	addle	r1, r1, #3
	b	.L104
.L170:
	.align	2
.L169:
	.word	-524287
	.word	209570
	.word	.LANCHOR0+17
	.word	.LANCHOR0
.L99:
	muls	r2, r0, r2
	movs	r0, #10
	muls	r0, r4, r0
	cmp	r0, r2
	ble	.L110
	cmp	r8, #40
	ldrh	r0, [r5, #12]
	bls	.L111
	movs	r6, #26
.L167:
	cmp	r4, r2
	bfi	r0, r6, #6, #6
	strh	r0, [r5, #12]	@ movhi
	ble	.L114
	adds	r1, r1, #5
.L115:
	movs	r2, #0
	rsb	r1, r1, #128
	mov	r5, r2
	mov	ip, r2
.L118:
	cmp	r2, r4
	bge	.L110
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	lsls	r6, r0, #30
	bne	.L132
	tst	r0, #40
	bne	.L133
	ands	r6, r0, #48
	beq	.L119
	tst	r0, #12
	ite	ne
	movne	r6, #1
	moveq	r6, #0
.L119:
	cmp	r5, r6
	add	r2, r2, #1
	it	cc
	movcc	r5, r6
	lsls	r3, r2, #30
	bne	.L118
	cbz	r5, .L121
	strb	r1, [fp, ip, lsl #2]
.L121:
	add	ip, ip, #1
	movs	r5, #0
	b	.L118
.L111:
	cmp	r8, #35
	ite	hi
	movhi	r6, #25
	movls	r6, #23
	b	.L167
.L114:
	add	ip, ip, r4
	cmp	ip, r2
	ble	.L116
	adds	r1, r1, #4
	b	.L115
.L116:
	add	r0, r4, r4, lsl #2
	cmp	r0, r2
	ite	gt
	addgt	r1, r1, #3
	addle	r1, r1, #2
	b	.L115
.L132:
	movs	r6, #0
	b	.L119
.L133:
	movs	r6, #1
	b	.L119
	.fnend
	.size	vepu540c_set_qpmap_smart, .-vepu540c_set_qpmap_smart
	.align	1
	.global	vepu540c_set_qpmap_normal
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_qpmap_normal, %function
vepu540c_set_qpmap_normal:
	.fnstart
	@ args = 20, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r6, r0
	mov	r8, r2
	mov	r9, r3
	ldrd	r7, r4, [sp, #48]
	mov	r0, r1
	ldrd	r2, r5, [sp, #60]
	cbz	r1, .L215
	cmp	r8, #0
	beq	.L215
	cbz	r3, .L215
	clz	r3, r5
	ldrb	r1, [r6, #12]	@ zero_extendqisi2
	lsrs	r3, r3, #5
	bfi	r1, r3, #0, #1
	strb	r1, [r6, #12]
	ldr	r1, .L236
	ldr	r3, [r6, #12]
	ands	r1, r1, r3
	ldr	r3, .L236+4
	orrs	r3, r3, r1
	ldr	r1, .L236+8
	str	r3, [r6, #12]
	cmp	r2, #0
	bne	.L173
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L236+8
	adds	r4, r4, #63
	mov	fp, r0
	mov	r0, r8
	bl	mpp_buffer_get_ptr_with_caller
	bics	r4, r4, #63
	it	mi
	addmi	r4, r4, #15
	asrs	r4, r4, #4
	ldr	r3, [sp, #56]
	mov	r10, r0
	adds	r3, r3, #15
	asrs	r3, r3, #4
	muls	r4, r3, r4
	cbz	r5, .L175
.L235:
	mov	r2, r4
	movs	r1, #0
	mov	r0, r9
	bl	memset
.L215:
	mov	r5, #-1
	b	.L172
.L175:
	mov	r1, r5
	lsls	r2, r4, #2
	bl	memset
	ldr	ip, .L236+12
	add	r0, r9, #-1
	mov	r3, r5
	mov	r1, r5
.L176:
	cmp	r1, r4
	blt	.L178
	cmp	r7, #35
	bls	.L216
	cmp	r7, #46
	ite	cc
	movcc	fp, #4
	movcs	fp, #3
.L179:
	movs	r2, #100
	muls	r3, r2, r3
	rsb	r2, r4, r4, lsl #4
	cmp	r2, r3
	ble	.L180
	cmp	r3, r4, asr #5
	ble	.L180
	cmp	r7, #40
	ldrh	r1, [r6, #12]
	bls	.L181
	movs	r0, #28
.L233:
	bfi	r1, r0, #6, #6
	strh	r1, [r6, #12]	@ movhi
.L180:
	ldr	r1, .L236+8
	mov	r0, r8
	strd	r2, r3, [sp]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldrd	r2, r3, [sp]
	cmp	r2, r3
	bgt	.L183
.L203:
	ldr	r1, .L236+8
	mov	r0, r8
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_end_cpu_access
.L172:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L178:
	ldr	r2, [fp, r1, lsl #2]
	uxtb	lr, r2
	ubfx	r2, r2, #8, #4
	add	lr, lr, #7
	add	r2, r2, ip
	add	lr, ip, lr, lsr #3
	ldrb	r2, [r2, #75]	@ zero_extendqisi2
	ldrb	lr, [lr, #42]	@ zero_extendqisi2
	orr	r2, lr, r2
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	lsl	lr, lr, #2
	and	lr, lr, #63
	orr	r2, r2, lr
	strb	r2, [r0]
	tst	r2, #3
	bne	.L177
	tst	r2, #40
	it	ne
	addne	r3, r3, #1
.L177:
	adds	r1, r1, #1
	b	.L176
.L216:
	mov	fp, #0
	b	.L179
.L181:
	cmp	r7, #35
	ite	hi
	movhi	r0, #27
	movls	r0, #25
	b	.L233
.L183:
	cmp	r3, #0
	ble	.L203
	cmp	r3, r4
	bge	.L185
	add	fp, fp, #7
.L186:
	rsb	fp, fp, #128
	movs	r3, #0
.L189:
	cmp	r3, r4
	bge	.L203
	ldrb	r2, [r9, r3]	@ zero_extendqisi2
	lsls	r0, r2, #30
	bne	.L190
	tst	r2, #40
	it	ne
	strbne	fp, [r10, r3, lsl #2]
.L190:
	adds	r3, r3, #1
	b	.L189
.L185:
	add	r2, r4, r4, lsl #1
	cmp	r2, r3
	ble	.L187
	add	fp, fp, #6
	b	.L186
.L187:
	rsb	r2, r4, r4, lsl #3
	cmp	r2, r3
	ite	gt
	addgt	fp, fp, #5
	addle	fp, fp, #4
	b	.L186
.L173:
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L236+8
	adds	r4, r4, #31
	mov	fp, r0
	mov	r0, r8
	bl	mpp_buffer_get_ptr_with_caller
	bics	r4, r4, #31
	it	mi
	addmi	r4, r4, #15
	asrs	r4, r4, #4
	ldr	r3, [sp, #56]
	mov	r10, r0
	adds	r3, r3, #31
	bics	r3, r3, #31
	it	mi
	addmi	r3, r3, #15
	asrs	r3, r3, #4
	muls	r4, r3, r4
	cmp	r5, #0
	bne	.L235
	bic	r2, r4, #-1073741824
	mov	r1, r5
	bl	memset
	ldr	lr, .L236+12
	add	ip, r9, #-1
	mov	r3, r5
	mov	r0, r5
.L195:
	cmp	r0, r4
	blt	.L197
	cmp	r7, #35
	bls	.L218
	cmp	r7, #46
	ite	cc
	movcc	fp, #4
	movcs	fp, #3
.L198:
	movs	r2, #100
	muls	r3, r2, r3
	rsb	r2, r4, r4, lsl #4
	cmp	r2, r3
	ble	.L199
	cmp	r3, r4, asr #5
	ble	.L199
	cmp	r7, #40
	ldrh	r1, [r6, #12]
	bls	.L200
	movs	r0, #28
.L234:
	bfi	r1, r0, #6, #6
	strh	r1, [r6, #12]	@ movhi
.L199:
	ldr	r1, .L236+8
	mov	r0, r8
	strd	r2, r3, [sp]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldrd	r2, r3, [sp]
	cmp	r2, r3
	ble	.L203
	cmp	r3, #0
	ble	.L203
	cmp	r3, r4
	bge	.L204
	add	fp, fp, #7
.L205:
	movs	r3, #0
	rsb	fp, fp, #128
	mov	r2, r3
	mov	r1, r3
.L208:
	cmp	r3, r4
	bge	.L203
	ldrb	r0, [r9, r3]	@ zero_extendqisi2
	lsls	r6, r0, #30
	bne	.L220
	tst	r0, #40
	ite	ne
	movne	r0, #1
	moveq	r0, #0
.L209:
	cmp	r2, r0
	add	r3, r3, #1
	it	cc
	movcc	r2, r0
	lsls	r0, r3, #30
	bne	.L208
	cbz	r2, .L211
	strb	fp, [r10, r1, lsl #2]
.L211:
	adds	r1, r1, #1
	movs	r2, #0
	b	.L208
.L197:
	ldr	r2, [fp, r0, lsl #2]
	uxtb	r1, r2
	ubfx	r2, r2, #8, #4
	adds	r1, r1, #7
	add	r2, r2, lr
	add	r1, lr, r1, lsr #3
	ldrb	r2, [r2, #75]	@ zero_extendqisi2
	ldrb	r1, [r1, #42]	@ zero_extendqisi2
	orrs	r2, r2, r1
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	lsls	r1, r1, #2
	and	r1, r1, #63
	orrs	r2, r2, r1
	strb	r2, [ip]
	lsls	r1, r2, #30
	bne	.L196
	tst	r2, #40
	it	ne
	addne	r3, r3, #1
.L196:
	adds	r0, r0, #1
	b	.L195
.L218:
	mov	fp, #0
	b	.L198
.L200:
	cmp	r7, #35
	ite	hi
	movhi	r0, #27
	movls	r0, #25
	b	.L234
.L204:
	add	r2, r4, r4, lsl #1
	cmp	r2, r3
	ble	.L206
	add	fp, fp, #6
	b	.L205
.L206:
	rsb	r2, r4, r4, lsl #3
	cmp	r2, r3
	ite	gt
	addgt	fp, fp, #5
	addle	fp, fp, #4
	b	.L205
.L220:
	movs	r0, #0
	b	.L209
.L237:
	.align	2
.L236:
	.word	-524287
	.word	209570
	.word	.LANCHOR0+91
	.word	.LANCHOR0
	.fnend
	.size	vepu540c_set_qpmap_normal, .-vepu540c_set_qpmap_normal
	.align	1
	.global	vepu540c_set_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_osd, %function
vepu540c_set_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r0
	ldr	r4, [r0, #8]
	.pad #40
	sub	sp, sp, #40
	cmp	r4, #0
	beq	.L254
	ldr	r6, [r4, #4]
	cmp	r6, #0
	beq	.L254
	cmp	r6, #8
	bls	.L240
	mov	r3, r6
	movw	r2, #495
	ldr	r1, .L255
	ldr	r0, .L255+4
	bl	printk
	ldr	r3, [r4, #4]
	cmp	r3, #8
	bls	.L246
	mov	r1, #496
	ldr	r3, .L255+8
	str	r1, [sp]
	ldr	r2, .L255+12
	ldr	r0, .L255+16
	bl	printk
.L246:
	mov	r0, #-1
	b	.L238
.L240:
	ldr	r5, [r0]
	adds	r4, r4, #148
	mov	r9, #0
	mov	r10, #36
	add	r7, r5, #24
.L243:
	ldr	r1, [r4, #-128]
	add	r0, sp, #12
	bl	vepu541_set_fmt
	mul	r1, r10, r9
	ldr	r3, [r4, #-140]
	adds	r2, r5, r1
	ldrb	r0, [r5, r1]	@ zero_extendqisi2
	bfi	r0, r3, #0, #1
	strb	r0, [r5, r1]
	ldr	r3, [r4, #-136]
	bfi	r0, r3, #6, #1
	strb	r0, [r5, r1]
	ldr	r3, [r4, #-132]
	bfi	r0, r3, #7, #1
	strb	r0, [r5, r1]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r2, #20]
	ldr	r3, [sp, #12]
	bfi	r0, r3, #0, #4
	strb	r0, [r2, #1]
	ldr	r3, [r4, #-124]
	bfi	r0, r3, #5, #1
	strb	r0, [r2, #1]
	ldrh	r0, [r2, #4]
	ldr	r3, [r4, #-120]
	bfi	r0, r3, #0, #14
	strh	r0, [r2, #4]	@ movhi
	ldr	r3, [r4, #-116]
	ldr	r0, [r2, #4]
	bfi	r0, r3, #14, #14
	str	r0, [r2, #4]
	ldrh	r0, [r2, #8]
	ldr	r3, [r4, #-112]
	bfi	r0, r3, #0, #14
	strh	r0, [r2, #8]	@ movhi
	ldr	r3, [r4, #-108]
	ldr	r0, [r2, #8]
	bfi	r0, r3, #14, #14
	str	r0, [r2, #8]
	ldrb	r0, [r2, #7]	@ zero_extendqisi2
	ldr	r3, [r4, #-96]
	bfi	r0, r3, #4, #4
	strb	r0, [r2, #7]
	ldr	r0, [r4, #-104]
	bfi	lr, r0, #0, #17
	str	lr, [r2, #20]
	ldr	r0, [r4, #-100]
	ubfx	lr, lr, #24, #8
	bfi	lr, r0, #1, #1
	strb	lr, [r2, #23]
	ldrb	lr, [r5, r1]	@ zero_extendqisi2
	ldr	r0, [r4, #-92]
	bfi	lr, r0, #1, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-88]
	bfi	lr, r0, #2, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-84]
	bfi	lr, r0, #3, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-80]
	bfi	lr, r0, #4, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-76]
	ldrb	lr, [r2, #11]	@ zero_extendqisi2
	ldrh	ip, [r2, #22]
	bfi	lr, r0, #4, #1
	strb	lr, [r2, #11]
	ldr	r0, [r4, #-72]
	bfi	lr, r0, #5, #2
	strb	lr, [r2, #11]
	ldr	r0, [r4, #-68]
	bfi	ip, r0, #1, #8
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	strh	ip, [r2, #22]	@ movhi
	ldr	r3, [r4, #-56]
	bfi	r0, r3, #4, #1
	strb	r0, [r2, #1]
	ldr	r3, [r4, #-52]
	ldr	r0, [r5, r1]
	bfi	r0, r3, #14, #8
	str	r0, [r5, r1]
	ldr	r3, [r4, #-48]
	ldrh	r0, [r2, #2]
	bfi	r0, r3, #6, #8
	strh	r0, [r2, #2]	@ movhi
	ldr	r3, [r4, #-44]
	ubfx	r0, r0, #8, #8
	bfi	r0, r3, #6, #2
	strb	r0, [r2, #3]
	ldr	r3, [r4, #-40]
	ldrb	r0, [r5, r1]	@ zero_extendqisi2
	bfi	r0, r3, #5, #1
	strb	r0, [r5, r1]
	ldrb	r3, [r2, #32]	@ zero_extendqisi2
	add	r0, r2, #32
	ldr	r1, [r4, #-36]
	bfi	r3, r1, #0, #1
	strb	r3, [r2, #32]
	ldr	r1, [r4, #-32]
	bfi	r3, r1, #1, #7
	ldrb	r1, [r2, #33]	@ zero_extendqisi2
	strb	r3, [r2, #32]
	ldr	r3, [r4, #-28]
	bfi	r1, r3, #0, #6
	strb	r1, [r2, #33]
	ldr	r3, [r2, #32]
	ldr	r1, [r4, #-24]
	bfi	r3, r1, #14, #6
	str	r3, [r2, #32]
	ldr	r2, [r4, #-20]
	ubfx	r3, r3, #16, #16
	bfi	r3, r2, #4, #5
	strh	r3, [r0, #2]	@ movhi
	ldr	r1, [r4, #-60]
	cbz	r1, .L241
	movs	r2, #0
	ldr	r0, [r8, #4]
	bl	mpp_dev_get_mpi_ioaddress
	str	r0, [r7, #-8]
.L241:
	ldr	r1, [r4, #-12]
	cbz	r1, .L242
	movs	r2, #0
	ldr	r0, [r8, #4]
	bl	mpp_dev_get_mpi_ioaddress
	str	r0, [r7, #-12]
.L242:
	mov	r2, r4
	add	r9, r9, #1
	ldr	r3, [r2, #-8]!	@ unaligned
	cmp	r6, r9
	add	r4, r4, #140
	add	r7, r7, #36
	str	r3, [r7, #-36]	@ unaligned
	ldr	r3, [r2, #4]	@ unaligned
	str	r3, [r7, #-32]	@ unaligned
	bne	.L243
	ldr	r3, [r5, #288]
	and	r2, r3, #-134217728
	ldr	r3, .L255+20
	orrs	r3, r3, r2
	str	r3, [r5, #288]
	ldr	r3, [r5, #292]
	and	r2, r3, #-134217728
	ldr	r3, .L255+24
	orrs	r3, r3, r2
	str	r3, [r5, #292]
	ldr	r3, [r5, #296]
	and	r2, r3, #-134217728
	ldr	r3, .L255+28
	orrs	r3, r3, r2
	str	r3, [r5, #296]
	ldr	r3, [r5, #300]
	and	r3, r3, #-16777216
	orr	r3, r3, #8388608
	orr	r3, r3, #32768
	str	r3, [r5, #300]
	mov	r3, #-16711936
	str	r3, [r5, #304]
	mov	r3, #65280
	strh	r3, [r5, #308]	@ movhi
.L254:
	movs	r0, #0
.L238:
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L256:
	.align	2
.L255:
	.word	.LANCHOR0+117
	.word	.LC8
	.word	.LANCHOR0+134
	.word	.LC9
	.word	.LC10
	.word	7679053
	.word	33773525
	.word	128920192
	.fnend
	.size	vepu540c_set_osd, .-vepu540c_set_osd
	.global	__aeabi_uidivmod
	.align	1
	.global	vepu540c_set_jpeg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_jpeg_reg, %function
vepu540c_set_jpeg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r5, [r0, #12]
	mov	r6, r0
	ldr	r4, [r0, #4]
	ldr	r10, [r0, #16]
	ldr	r3, [r5, #52]
	ldr	fp, [r5, #16]
	mov	r0, r3
	str	r3, [sp]
	ldrd	r9, r8, [fp]
	bl	mpp_frame_get_height
	cmp	r0, r8
	bcs	.L278
	ldr	r7, [fp, #136]
	cbz	r7, .L258
	ldr	r0, [sp]
	bl	mpp_frame_get_width
	mov	r9, r0
	ldr	r0, [sp]
	bl	mpp_frame_get_height
	ldr	r2, [r6, #24]
	mov	r8, r0
	cbz	r2, .L280
	movs	r1, #0
	ldr	r0, [r5, #28]
	str	r1, [r5, #48]
	bl	mpp_packet_set_length
.L280:
	movs	r7, #1
	b	.L258
.L278:
	movs	r7, #0
.L258:
	ldr	r2, [r6, #20]
	cbnz	r2, .L259
	mov	r2, #264
	ldr	r1, [r5, #56]
	ldr	r0, [r6]
	bl	mpp_dev_get_iova_address
	mov	r2, r5
	strd	r0, r0, [r4, #32]
	str	r0, [r4, #40]
	mov	r0, r4
	ldr	r1, [r10]
	bl	vepu540c_jpeg_set_uv_offset.constprop.0
.L259:
	ldr	r2, [r5, #32]
	ldr	r1, [r2, #28]
	ldr	r0, [r2]
	cmp	r1, #0
	bne	.L260
	cmp	r0, #0
	beq	.L261
	movw	r2, #257
	mov	r1, r0
	ldr	r0, [r6]
	bl	mpp_dev_get_iova_address
	ldr	r2, [r5, #32]
	ldr	r2, [r2, #12]
	add	r0, r0, r2
	str	r0, [r4, #4]
.L262:
	ldr	r1, [r5, #32]
	ldr	r2, [r4, #4]
	ldr	r1, [r1, #24]
	subs	r0, r2, #1
	str	r2, [r4, #8]
	add	r1, r1, r0
	str	r1, [r4]
	ldr	r0, [r5, #28]
	str	r2, [sp, #4]
	bl	mpp_packet_get_length
	ldr	r2, [sp, #4]
	add	r0, r0, r2
	str	r0, [r4, #12]
.L263:
	add	r1, r9, #15
	ldr	r2, .L290
	ldrh	r0, [r4, #64]
	uxtb	r9, r9
	and	r1, r2, r1, lsr #3
	subs	r1, r1, #1
	bfi	r0, r1, #0, #11
	add	r1, r9, #15
	bic	r1, r1, #15
	strh	r0, [r4, #64]	@ movhi
	sub	r9, r1, r9
	ldrb	r1, [r4, #68]	@ zero_extendqisi2
	bfi	r1, r9, #0, #6
	strb	r1, [r4, #68]
	add	r1, r8, #15
	uxtb	r8, r8
	and	r2, r2, r1, lsr #3
	ldrh	r1, [r4, #66]
	subs	r2, r2, #1
	bfi	r1, r2, #0, #11
	add	r2, r8, #15
	bic	r2, r2, #15
	strh	r1, [r4, #66]	@ movhi
	sub	r8, r2, r8
	ldrb	r2, [r4, #70]	@ zero_extendqisi2
	bfi	r2, r8, #0, #6
	strb	r2, [r4, #70]
	ldr	r0, [r10]
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	and	r0, r0, #15
	bfi	r2, r0, #2, #4
	strb	r2, [r4, #72]
	ldr	r1, [r10, #4]
	bfi	r2, r1, #0, #1
	strb	r2, [r4, #72]
	ldr	r1, [r10, #8]
	bfi	r2, r1, #1, #1
	strb	r2, [r4, #72]
	ldrh	r2, [r4, #72]
	bic	r2, r2, #1920
	orr	r2, r2, #128
	strh	r2, [r4, #72]	@ movhi
	ldr	r2, [fp, #36]
	cmp	r2, #0
	ldrb	r2, [r4, #95]	@ zero_extendqisi2
	ite	le
	movle	r1, #0
	movgt	r1, #1
	bfi	r2, r1, #2, #1
	strb	r2, [r4, #95]
	ldr	r1, [fp, #32]
	bfi	r2, r1, #3, #2
	strb	r2, [r4, #95]
	ldr	r2, [fp, #8]
	ldrb	r1, [r4, #72]	@ zero_extendqisi2
	cbnz	r2, .L265
	ands	ip, r1, #60
	bne	.L266
	ldr	r2, [fp]
	lsls	r2, r2, #2
.L265:
	and	r1, r1, #52
	cmp	r1, #16
	itet	ne
	addne	ip, r2, r2, lsr #31
	moveq	ip, r2
	asrne	ip, ip, #1
	cmp	r0, #2
	bhi	.L270
	ldr	r1, [r4, #76]
	and	r0, r1, #-134217728
	ldr	r1, .L290+4
	orrs	r1, r1, r0
	str	r1, [r4, #76]
	ldr	r1, [r4, #80]
	and	r0, r1, #-134217728
	ldr	r1, .L290+8
	orrs	r1, r1, r0
	str	r1, [r4, #80]
	ldr	r1, [r4, #84]
	and	r0, r1, #-134217728
	ldr	r1, .L290+12
	orrs	r1, r1, r0
	str	r1, [r4, #84]
	ldr	r1, [r4, #88]
	lsrs	r1, r1, #21
	lsls	r1, r1, #21
	orr	r1, r1, #32768
	orr	r1, r1, #128
	str	r1, [r4, #88]
.L270:
	ldr	r1, [r4, #100]
	strh	ip, [r4, #104]	@ movhi
	bfi	r1, r2, #0, #17
	str	r1, [r4, #100]
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r2, [r4, #98]
	bfi	r2, r0, #0, #14
	strh	r2, [r4, #98]	@ movhi
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r2, [r4, #96]
	bfi	r2, r0, #0, #14
	strh	r2, [r4, #96]	@ movhi
	ldrh	r2, [r4, #108]
	bic	r2, r2, #816
	bic	r2, r2, #3
	strh	r2, [r4, #108]	@ movhi
	ldrh	r2, [r4, #112]
	bfc	r2, #0, #15
	strh	r2, [r4, #112]	@ movhi
	ldrh	r2, [r4, #116]
	bfc	r2, #0, #15
	strh	r2, [r4, #116]	@ movhi
	ldrh	r2, [r4, #120]
	bfc	r2, #0, #15
	strh	r2, [r4, #120]	@ movhi
	ldr	r2, [r4, #124]
	ldr	r3, [fp, #136]
	bfi	r2, r3, #0, #25
	str	r2, [r4, #124]
	ubfx	r3, r2, #24, #8
	bfc	r3, #1, #1
	strb	r3, [r4, #127]
	ldr	r2, [r6, #24]
	bfi	r3, r2, #2, #3
	strb	r3, [r4, #127]
	cmp	r7, #0
	beq	.L271
	ldr	r0, [sp]
	bl	mpp_frame_get_eos
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L272
	orr	r3, r3, #32
	strb	r3, [r4, #127]
	movs	r3, #0
.L289:
	str	r3, [r6, #24]
.L273:
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	and	r3, r3, #63
	orn	r3, r3, #127
	strb	r3, [r4, #127]
	ldr	r3, [r4, #128]
	and	r3, r3, #-1073741824
	str	r3, [r4, #128]
	ldr	r3, [r6, #20]
	cbz	r3, .L274
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_is_full
	cmp	r0, #0
	bne	.L275
	add	r2, sp, #20
	movs	r1, #19
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #24]
	str	r3, [r4, #16]
	ldr	r3, [sp, #36]
	str	r3, [r4, #20]
	ldr	r3, [sp, #20]
	str	r3, [r4, #24]
	ldr	r3, [sp, #32]
	str	r3, [r4, #28]
	ldr	r3, [sp, #28]
	str	r3, [r4, #32]
	ldr	r3, [sp, #40]
	strd	r3, r3, [r4, #36]
.L274:
	movs	r0, #0
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L261:
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #12]
	add	r2, r2, r1
	str	r2, [r4, #4]
	b	.L262
.L260:
	ldr	r1, .L290+16
	bl	mpp_buffer_get_size_with_caller
	ldr	r1, [r5, #32]
	movw	r2, #257
	ldr	r1, [r1]
	str	r0, [sp, #4]
	ldr	r0, [r6]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #4]
	ldr	r2, [r5, #32]
	str	r0, [sp, #12]
	ldr	r0, [r5, #28]
	ldr	r2, [r2, #12]
	str	r2, [sp, #8]
	bl	mpp_packet_get_length
	ldrd	r1, r2, [sp, #4]
	add	r0, r0, r2
	bl	__aeabi_uidivmod
	ldr	r2, [r4, #4]
	ldr	r3, [sp, #12]
	add	r1, r1, r3
	str	r1, [r4, #12]
	ldr	r1, [r5, #32]
	ldr	r3, [sp, #4]
	ldr	r1, [r1, #16]
	add	r1, r1, r2
	add	r2, r2, r3
	str	r1, [r4, #8]
	str	r2, [r4]
	b	.L263
.L266:
	cmp	ip, #4
	bne	.L267
	ldr	r2, [fp]
	add	r2, r2, r2, lsl #1
	b	.L265
.L267:
	cmp	ip, #8
	beq	.L268
	and	ip, r1, #56
	cmp	ip, #32
	bne	.L265
.L268:
	ldr	r2, [fp]
	lsls	r2, r2, #1
	b	.L265
.L272:
	bfi	r3, r0, #5, #1
	strb	r3, [r4, #127]
	ldr	r3, [r6, #24]
	adds	r3, r3, #1
	b	.L289
.L271:
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	orr	r3, r3, #32
	strb	r3, [r4, #127]
	b	.L273
.L275:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_phy_addr
	cbz	r0, .L277
	strd	r0, r0, [r4, #32]
	mov	r2, r5
	str	r0, [r4, #40]
	mov	r0, r4
	ldr	r1, [r10]
	bl	vepu540c_jpeg_set_uv_offset.constprop.0
	b	.L274
.L277:
	mov	r1, #796
	ldr	r0, .L290+20
	bl	printk
	b	.L274
.L291:
	.align	2
.L290:
	.word	536870910
	.word	20261917
	.word	123164288
	.word	33762283
	.word	.LANCHOR0+151
	.word	.LC11
	.fnend
	.size	vepu540c_set_jpeg_reg, .-vepu540c_set_jpeg_reg
	.align	1
	.global	vepu540c_set_dvbm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_dvbm, %function
vepu540c_set_dvbm:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.pad #40
	sub	sp, sp, #40
	mov	r4, r0
	add	r2, sp, #4
	movs	r1, #19
	movs	r0, #0
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #4]
	str	r3, [r4]
	ldr	r3, [sp, #16]
	str	r3, [r4, #4]
	ldr	r3, [sp, #8]
	str	r3, [r4, #8]
	ldr	r3, [sp, #20]
	str	r3, [r4, #12]
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
	.fnend
	.size	vepu540c_set_dvbm, .-vepu540c_set_dvbm
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.35563, %object
	.size	__func__.35563, 17
__func__.35563:
	.ascii	"vepu540c_set_roi\000"
	.type	__FUNCTION__.35599, %object
	.size	__FUNCTION__.35599, 25
__FUNCTION__.35599:
	.ascii	"vepu540c_set_qpmap_smart\000"
	.type	md_idx0, %object
	.size	md_idx0, 33
md_idx0:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	md_idx1, %object
	.size	md_idx1, 16
md_idx1:
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	__FUNCTION__.35653, %object
	.size	__FUNCTION__.35653, 26
__FUNCTION__.35653:
	.ascii	"vepu540c_set_qpmap_normal\000"
	.type	__func__.35679, %object
	.size	__func__.35679, 17
__func__.35679:
	.ascii	"vepu540c_set_osd\000"
	.type	__FUNCTION__.35680, %object
	.size	__FUNCTION__.35680, 17
__FUNCTION__.35680:
	.ascii	"vepu540c_set_osd\000"
	.type	__FUNCTION__.35726, %object
	.size	__FUNCTION__.35726, 22
__FUNCTION__.35726:
	.ascii	"vepu540c_set_jpeg_reg\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%d: fbc case u_offset = %d\000"
.LC1:
	.ascii	"\0013%d: unknown color space: %d\012\000"
.LC2:
	.ascii	"\0013%s:%d: invalid buf %p roi %p\012\000"
.LC3:
	.ascii	"\0013%s:%d: invalid region number %d\012\000"
.LC4:
	.ascii	"\0013%s:%d: region %d invalid param:\012\000"
.LC5:
	.ascii	"\0013%s:%d: position [%d:%d:%d:%d] vs [%d:%d]\012\000"
.LC6:
	.ascii	"\0013%s:%d: force intra %d qp area index %d\012\000"
.LC7:
	.ascii	"\0013%s:%d: abs qp mode %d value %d\012\000"
.LC8:
	.ascii	"\0013%s:%d: do NOT support more than 8 regions inva"
	.ascii	"lid num %d\012\000"
.LC9:
	.ascii	"osd->num_region <= 8\000"
.LC10:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC11:
	.ascii	"\0013%d: online case set full frame err\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
