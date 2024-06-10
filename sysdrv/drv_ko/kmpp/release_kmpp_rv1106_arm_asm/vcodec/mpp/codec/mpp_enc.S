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
	.file	"mpp_enc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_enc_deinit_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit_frame, %function
mpp_enc_deinit_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L1
	ldr	r3, [r0, #368]
	cbz	r3, .L1
	ldr	r0, [r0, #372]
	cbz	r0, .L1
	movw	r3, #5352
	movs	r2, #0
	str	r2, [r4, r3]
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
	add	r0, r4, #368
	pop	{r4, lr}
	b	mpp_frame_deinit
.L1:
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_deinit_frame, .-mpp_enc_deinit_frame
	.align	1
	.global	mpp_enc_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit, %function
mpp_enc_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	add	r6, r4, #5344
	adds	r6, r6, #28
	mov	r7, r0
	mov	r0, r6
	bl	down
	cbnz	r4, .L13
	movs	r2, #180
	ldr	r1, .L81
	ldr	r0, .L81+4
	bl	printk
	mvn	r0, #2
.L12:
	pop	{r4, r5, r6, r7, r8, pc}
.L13:
	movw	r3, #5360
	ldr	r3, [r4, r3]
	cbz	r3, .L15
	mov	r0, r4
	bl	mpp_enc_deinit_frame
.L15:
	mov	r0, r4
	bl	mpp_enc_impl_free_task
	ldr	r0, [r4, #4]
	cbz	r0, .L16
	bl	enc_impl_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L16:
	ldr	r0, [r4, #8]
	cbz	r0, .L17
	bl	mpp_enc_hal_deinit
	movs	r3, #0
	str	r3, [r4, #8]
.L17:
	ldr	r3, [r4, #404]
	cbz	r3, .L18
	add	r0, r4, #404
	bl	mpp_packet_deinit
.L18:
	ldr	r1, [r4, #408]
	cbz	r1, .L19
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L19:
	movw	r5, #5324
	mov	r8, #0
	str	r8, [r4, #408]
	adds	r0, r4, r5
	ldr	r3, [r4, r5]
	cbz	r3, .L20
	bl	mpp_enc_ref_cfg_deinit
	str	r8, [r4, r5]
.L20:
	ldr	r3, [r4, #460]
	cbz	r3, .L21
	add	r0, r4, #460
	bl	mpp_enc_refs_deinit
	movs	r3, #0
	str	r3, [r4, #460]
.L21:
	ldr	r0, [r4, #60]
	cbz	r0, .L22
	bl	rc_deinit
	movs	r3, #0
	str	r3, [r4, #60]
.L22:
	movw	r3, #10756
	ldr	r3, [r4, r3]
	cbz	r3, .L23
	movw	r2, #10788
	ldr	r2, [r4, r2]
	ldr	r2, [r2, #12]
	cbnz	r2, .L24
	ldr	r0, [r3, #20]
	cbz	r0, .L24
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L24:
	movw	r3, #10756
	ldr	r1, [r4, r3]
	mov	r5, r3
	cbz	r1, .L25
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L25:
	movs	r3, #0
	str	r3, [r4, r5]
.L23:
	add	r0, r4, #5504
	adds	r0, r0, #20
	bl	mpp_enc_unref_osd_buf
	movw	r3, #5368
	ldr	r3, [r4, r3]
	cbz	r3, .L27
	movw	r3, #10792
	ldr	r0, [r4, r3]
	cbz	r0, .L28
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L28:
	movw	r3, #10796
	ldr	r0, [r4, r3]
	cbz	r0, .L29
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L29:
	movw	r3, #10800
	ldr	r1, [r4, r3]
	cbz	r1, .L27
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L27:
	ldr	r1, [r4, #436]
	cbz	r1, .L31
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L31:
	movs	r5, #0
	mov	r0, r6
	str	r5, [r4, #436]
	movw	r6, #5384
	strd	r5, r5, [r4, #444]
	bl	up
	ldr	r3, [r4, r6]
	cbz	r3, .L32
	movs	r1, #244
	ldr	r0, .L81+12
	bl	printk
	ldr	r3, [r7, #56]
	ldr	r0, [r4, r6]
	blx	r3
	movs	r1, #246
	ldr	r0, .L81+16
	bl	printk
	str	r5, [r4, r6]
.L32:
	ldr	r0, .L81+8
	mov	r1, r4
	bl	mpp_osal_free
	movs	r0, #0
	b	.L12
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+15
	.word	.LC1
	.word	.LC2
	.fnend
	.size	mpp_enc_deinit, .-mpp_enc_deinit
	.align	1
	.global	mpp_enc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_init, %function
mpp_enc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L95
	movs	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #72
	sub	sp, sp, #72
	mov	r6, r1
	ldr	r7, [r1]
	strd	r3, r3, [sp]
	mov	r8, r0
	str	r2, [sp, #8]
	cbnz	r0, .L84
	movs	r2, #43
	ldr	r1, .L95+4
	ldr	r0, .L95+8
	mvn	r5, #2
	bl	printk
.L83:
	mov	r0, r5
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L84:
	str	r3, [r0]
	mov	r1, #10816
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	mov	r4, r0
	cbnz	r0, .L86
	movs	r2, #51
	ldr	r1, .L95+4
	ldr	r0, .L95+8
	mvn	r5, #3
	bl	printk
	b	.L83
.L86:
	add	r0, r0, #460
	bl	mpp_enc_refs_init
	mov	r5, r0
	cbz	r0, .L87
	ldr	r1, .L95+4
	movs	r2, #57
	ldr	r0, .L95+16
.L94:
	bl	printk
.L88:
	mov	r0, r4
	bl	mpp_enc_deinit
	b	.L83
.L87:
	ldr	r1, [r6, #4]
	movs	r2, #29
	strd	r2, r0, [sp, #60]
	add	r3, r4, #600
	ldr	r0, [r6, #8]
	str	r1, [sp, #40]
	ldr	r1, [r6, #16]
	str	r3, [sp, #36]
	str	r3, [sp, #20]
	str	r1, [sp, #44]
	ldr	r1, [r6, #24]
	str	r7, [sp, #32]
	strd	r7, r2, [sp, #12]
	str	r1, [sp, #68]
	ldr	r1, [r6, #28]
	str	r1, [sp, #48]
	ldr	r1, [r6, #20]
	str	r1, [sp, #52]
	ldr	r1, [r6, #36]
	str	r1, [sp, #56]
	movw	r1, #10760
	str	r0, [r4, r1]
	movw	r1, #10764
	ldr	r0, [r6, #12]
	str	r0, [r4, r1]
	add	r1, sp, #32
	ldr	r3, [r4, #460]
	add	r0, sp, #4
	str	r3, [sp, #24]
	movs	r3, #2
	str	r3, [sp, #28]
	bl	mpp_enc_hal_init
	mov	r5, r0
	cbz	r0, .L89
	movs	r2, #82
	ldr	r1, .L95+4
	ldr	r0, .L95+20
	b	.L94
.L89:
	ldr	r3, [sp, #60]
	add	r1, sp, #12
	mov	r0, sp
	str	r3, [sp, #16]
	mov	r3, #-1
	str	r3, [sp, #28]
	bl	enc_impl_init
	mov	r5, r0
	cbz	r0, .L90
	movs	r2, #91
	ldr	r1, .L95+4
	ldr	r0, .L95+24
	b	.L94
.L90:
	mov	r0, r4
	bl	mpp_enc_impl_alloc_task
	ldr	r2, [r6, #20]
	add	r0, r4, #60
	cbz	r2, .L91
	add	r2, sp, #8
.L91:
	mov	r1, r7
	mov	r5, #1024
	bl	rc_init
	str	r7, [r4]
	mov	r1, r5
	str	r5, [r4, #448]
	ldr	r0, .L95+12
	ldr	r3, [sp]
	str	r3, [r4, #4]
	ldr	r3, [sp, #4]
	str	r3, [r4, #8]
	ldr	r3, [sp, #64]
	str	r3, [r4, #12]
	movs	r3, #0
	str	r3, [r4, #424]
	ldr	r3, .L95+28
	str	r3, [r4, #428]
	movs	r3, #83
	str	r3, [r4, #432]
	bl	mpp_osal_calloc
	mov	r1, r5
	str	r0, [r4, #436]
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	mov	r2, r5
	mov	r1, r0
	str	r0, [r4, #408]
	add	r0, r4, #404
	bl	mpp_packet_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	mov	r1, r0
	ldr	r0, [r4, #404]
	bl	mpp_packet_set_length
	str	r7, [r4, #1192]
	movw	r7, #5324
	adds	r0, r4, r7
	bl	mpp_enc_ref_cfg_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r5, [r4, r7]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_ref_cfg_copy
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r5, [r4, #460]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_refs_set_cfg
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r1, [r4, #752]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_rc_igop
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	movw	r0, #5372
	adds	r1, r4, r0
	movs	r2, #1
	add	r3, r4, #5376
	str	r2, [r4, r0]
	strd	r3, r3, [r1, #4]
	movw	r3, #5348
	str	r2, [r4, r3]
	movw	r3, #5352
	str	r5, [r4, r3]
	movw	r3, #6654
	movs	r2, #4
	strb	r2, [r4, r3]
	bl	get_vsm_ops
	cbnz	r0, .L92
	movs	r1, #44
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	movw	r3, #10756
	str	r0, [r4, r3]
.L92:
	ldr	r2, [r6, #4]
	movw	r3, #5360
	str	r2, [r4, r3]
	movw	r3, #10788
	ldr	r2, [r6, #24]
	str	r2, [r4, r3]
	movw	r3, #5368
	ldr	r2, [r6, #28]
	str	r2, [r4, r3]
	movw	r3, #10808
	ldr	r2, [r6, #32]
	str	r2, [r4, r3]
	movw	r3, #5364
	ldr	r2, [r6, #16]
	str	r2, [r4, r3]
	str	r4, [r8]
	b	.L83
.L96:
	.align	2
.L95:
	.word	.LC3
	.word	.LANCHOR0+30
	.word	.LC4
	.word	.LANCHOR0+43
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.fnend
	.size	mpp_enc_init, .-mpp_enc_init
	.align	1
	.global	mpp_enc_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_start, %function
mpp_enc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L106
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L98
	mov	r3, r0
	mov	r2, #258
	ldr	r1, .L106+4
	ldr	r0, .L106+8
	bl	printk
.L98:
	add	r6, r4, #5344
	adds	r6, r6, #28
	mov	r0, r6
	bl	down
	movw	r3, #5348
	movs	r2, #0
	mov	r0, r6
	str	r2, [r4, r3]
	bl	up
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L99
	mov	r3, r4
	movw	r2, #265
	ldr	r1, .L106+4
	ldr	r0, .L106+12
	bl	printk
.L99:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L107:
	.align	2
.L106:
	.word	.LANCHOR1
	.word	.LANCHOR0+56
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_start, .-mpp_enc_start
	.align	1
	.global	mpp_enc_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_stop, %function
mpp_enc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r5, r0, #5344
	adds	r5, r5, #28
	ldr	r6, .L117
	mov	r4, r0
	mov	r0, r5
	bl	down
	ldr	r2, [r6]
	lsls	r2, r2, #31
	bpl	.L109
	mov	r3, r4
	mov	r2, #276
	ldr	r1, .L117+4
	ldr	r0, .L117+8
	bl	printk
.L109:
	movw	r3, #5348
	movs	r2, #1
	str	r2, [r4, r3]
	movw	r3, #5352
	ldr	r7, [r4, r3]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L110
	mov	r3, r4
	movw	r2, #279
	ldr	r1, .L117+4
	ldr	r0, .L117+12
	bl	printk
.L110:
	mov	r0, r5
	bl	up
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, pc}
.L118:
	.align	2
.L117:
	.word	.LANCHOR1
	.word	.LANCHOR0+70
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_stop, .-mpp_enc_stop
	.align	1
	.global	mpp_enc_check_pkt_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_pkt_pool, %function
mpp_enc_check_pkt_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbz	r0, .L119
	ldr	r3, [r0, #64]
	cbz	r3, .L119
	movw	r2, #5384
	ldr	r0, [r4, r2]
	pop	{r4, lr}
	bx	r3
.L119:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_check_pkt_pool, .-mpp_enc_check_pkt_pool
	.align	1
	.global	mpp_enc_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_reset, %function
mpp_enc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L132
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L126
	mov	r3, r0
	movw	r2, #303
	ldr	r1, .L132+4
	ldr	r0, .L132+8
	bl	printk
.L126:
	cbnz	r4, .L128
	movw	r2, #305
	ldr	r1, .L132+4
	ldr	r0, .L132+12
	bl	printk
	mvn	r0, #2
.L125:
	pop	{r4, pc}
.L128:
	movs	r0, #0
	b	.L125
.L133:
	.align	2
.L132:
	.word	.LANCHOR1
	.word	.LANCHOR0+83
	.word	.LC9
	.word	.LC11
	.fnend
	.size	mpp_enc_reset, .-mpp_enc_reset
	.align	1
	.global	mpp_enc_oneframe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_oneframe, %function
mpp_enc_oneframe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L135
	mov	r2, #318
	ldr	r1, .L143
	ldr	r0, .L143+4
	bl	printk
	mvn	r0, #2
.L134:
	pop	{r3, r4, r5, pc}
.L135:
	ldr	r5, .L143+8
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bmi	.L137
.L142:
	movs	r0, #0
	b	.L134
.L137:
	mov	r3, r0
	mov	r2, #322
	ldr	r1, .L143
	ldr	r0, .L143+12
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L142
	mov	r3, r4
	mov	r2, #324
	ldr	r1, .L143
	ldr	r0, .L143+16
	bl	printk
	b	.L142
.L144:
	.align	2
.L143:
	.word	.LANCHOR0+97
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_oneframe, .-mpp_enc_oneframe
	.align	1
	.global	mpp_enc_cfg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_reg, %function
mpp_enc_cfg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r7, r1
	mov	r4, r0
	cbnz	r0, .L146
	mov	r2, #336
	ldr	r1, .L168
	ldr	r0, .L168+4
	mvn	r7, #2
	bl	printk
.L145:
	mov	r0, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L146:
	ldr	r6, .L168+8
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L148
	mov	r3, r0
	mov	r2, #340
	ldr	r1, .L168
	ldr	r0, .L168+12
	bl	printk
.L148:
	add	r5, r4, #5344
	adds	r5, r5, #28
	mov	r0, r5
	bl	down
	movw	r3, #5348
	ldr	r8, [r4, r3]
	cmp	r8, #0
	beq	.L149
	mov	r0, r5
	mov	r7, #-1
	bl	up
	b	.L145
.L149:
	mov	r0, r4
	bl	mpp_enc_proc_rc_update
	movw	r3, #5356
	str	r8, [r4, r3]
	movw	r3, #5368
	ldr	r3, [r4, r3]
	cmp	r3, #0
	beq	.L151
	movw	r3, #10792
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L151
	ldr	r2, [r4, #1192]
	ldrd	r1, r3, [r4, #628]
	cmp	r2, #7
	bne	.L153
	adds	r1, r1, #63
	adds	r3, r3, #63
	bics	r1, r1, #63
	it	mi
	addmi	r1, r1, #15
	bics	r3, r3, #63
	asr	r1, r1, #4
.L167:
	it	mi
	addmi	r3, r3, #15
	ldr	r10, .L168+20
	movs	r0, #0
	asrs	r3, r3, #4
	str	r10, [sp]
	mul	r8, r3, r1
	add	r1, r4, #10752
	ldr	r3, .L168+16
	adds	r1, r1, #40
	lsl	r9, r8, #2
	mov	r2, r9
	bl	mpp_buffer_get_with_tag
	movw	r3, #10796
	ldr	r0, [r4, r3]
	adds	r1, r4, r3
	cbnz	r0, .L159
	str	r10, [sp]
	mov	r2, r9
	ldr	r3, .L168+16
	bl	mpp_buffer_get_with_tag
.L159:
	mov	r1, r8
	ldr	r0, .L168+20
	bl	mpp_osal_calloc
	movw	r3, #10800
	str	r0, [r4, r3]
	cbnz	r0, .L151
	movw	r1, #365
	ldr	r0, .L168+24
	bl	printk
.L151:
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_impl_reg_cfg
	movw	r3, #5356
	movs	r2, #1
	str	r2, [r4, r3]
	mov	r7, r0
	mov	r0, r5
	bl	up
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L145
	mov	r3, r4
	mov	r2, #370
	ldr	r1, .L168
	ldr	r0, .L168+28
	bl	printk
	b	.L145
.L153:
	adds	r1, r1, #31
	adds	r3, r3, #31
	bics	r1, r1, #31
	it	mi
	addmi	r1, r1, #15
	bics	r3, r3, #31
	asr	r1, r1, #4
	b	.L167
.L169:
	.align	2
.L168:
	.word	.LANCHOR0+114
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC12
	.word	.LANCHOR0+130
	.word	.LC13
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_reg, .-mpp_enc_cfg_reg
	.align	1
	.global	mpp_enc_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_hw_start, %function
mpp_enc_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r8, r1
	mov	r4, r0
	cbnz	r0, .L171
	movw	r2, #381
	ldr	r1, .L182
	ldr	r0, .L182+4
	mvn	r6, #2
	bl	printk
.L170:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L171:
	ldr	r7, .L182+8
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L173
	mov	r3, r0
	movw	r2, #385
	ldr	r1, .L182
	ldr	r0, .L182+12
	bl	printk
.L173:
	add	r5, r4, #5344
	adds	r5, r5, #28
	mov	r0, r5
	bl	down
	movw	r3, #5348
	ldr	r3, [r4, r3]
	cbz	r3, .L174
	mov	r0, r5
	mov	r6, #-1
	bl	up
	b	.L170
.L174:
	movw	r6, #5356
	movs	r3, #2
	mov	r1, r8
	str	r3, [r4, r6]
	mov	r0, r4
	bl	mpp_enc_impl_hw_start
	movs	r3, #3
	str	r3, [r4, r6]
	mov	r6, r0
	cbnz	r0, .L175
	movw	r3, #5352
	movs	r2, #1
	str	r2, [r4, r3]
.L175:
	mov	r0, r5
	bl	up
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L170
	mov	r3, r4
	mov	r2, #398
	ldr	r1, .L182
	ldr	r0, .L182+16
	bl	printk
	b	.L170
.L183:
	.align	2
.L182:
	.word	.LANCHOR0+146
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_hw_start, .-mpp_enc_hw_start
	.align	1
	.global	mpp_enc_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_run_task, %function
mpp_enc_run_task:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	cbnz	r0, .L185
	movw	r2, #409
	ldr	r1, .L198
	ldr	r0, .L198+4
	mvn	r8, #2
	bl	printk
.L184:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, pc}
.L185:
	ldr	r5, .L198+8
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L187
	mov	r3, r0
	movw	r2, #413
	ldr	r1, .L198
	ldr	r0, .L198+12
	bl	printk
.L187:
	movs	r2, #0
	movs	r1, #7
	ldr	r0, [r4, #12]
	bl	mpp_dev_ioctl
	mov	r8, r0
	cbnz	r0, .L188
	ldr	r0, [r4, #372]
	cbz	r0, .L188
	mov	r2, r6
	mov	r3, r7
	bl	mpp_packet_set_pts
	ldr	r0, [r4, #372]
	ldrd	r2, [sp, #24]
	bl	mpp_packet_set_dts
.L188:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L184
	mov	r3, r4
	movw	r2, #427
	ldr	r1, .L198
	ldr	r0, .L198+16
	bl	printk
	b	.L184
.L199:
	.align	2
.L198:
	.word	.LANCHOR0+163
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_run_task, .-mpp_enc_run_task
	.align	1
	.global	mpp_enc_check_hw_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_hw_running, %function
mpp_enc_check_hw_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L204
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_check_running
.L204:
	movw	r2, #437
	ldr	r1, .L205
	ldr	r0, .L205+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L206:
	.align	2
.L205:
	.word	.LANCHOR0+180
	.word	.LC11
	.fnend
	.size	mpp_enc_check_hw_running, .-mpp_enc_check_hw_running
	.align	1
	.global	mpp_enc_unbind_jpeg_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unbind_jpeg_task, %function
mpp_enc_unbind_jpeg_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L211
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_unbind_jpeg_task
.L211:
	movw	r2, #449
	ldr	r1, .L212
	ldr	r0, .L212+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L213:
	.align	2
.L212:
	.word	.LANCHOR0+205
	.word	.LC11
	.fnend
	.size	mpp_enc_unbind_jpeg_task, .-mpp_enc_unbind_jpeg_task
	.align	1
	.global	mpp_enc_check_is_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_is_int_process, %function
mpp_enc_check_is_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L215
	mov	r2, #462
	ldr	r1, .L217
	ldr	r0, .L217+4
	bl	printk
.L216:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L215:
	add	r5, r0, #5344
	adds	r5, r5, #28
	mov	r0, r5
	bl	down
	movw	r3, #5356
	ldr	r4, [r4, r3]
	mov	r0, r5
	subs	r3, r4, #4
	rsbs	r4, r3, #0
	adcs	r4, r4, r3
	bl	up
	b	.L216
.L218:
	.align	2
.L217:
	.word	.LANCHOR0+230
	.word	.LC11
	.fnend
	.size	mpp_enc_check_is_int_process, .-mpp_enc_check_is_int_process
	.align	1
	.global	mpp_enc_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_int_process, %function
mpp_enc_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	mov	r8, r2
	mov	r9, r3
	mov	r4, r0
	cbnz	r0, .L220
	movw	r2, #481
	ldr	r1, .L229
	ldr	r0, .L229+4
	mvn	r5, #2
	bl	printk
.L219:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L220:
	ldr	r7, .L229+8
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L222
	mov	r3, r0
	movw	r2, #485
	ldr	r1, .L229
	ldr	r0, .L229+12
	bl	printk
.L222:
	movw	r6, #5356
	movs	r3, #4
	mov	r2, r8
	str	r3, [r4, r6]
	mov	r1, r5
	mov	r3, r9
	mov	r0, r4
	bl	mpp_enc_impl_int
	movs	r3, #5
	str	r3, [r4, r6]
	movw	r3, #5352
	movs	r2, #0
	str	r2, [r4, r3]
	ldr	r3, [r7]
	lsls	r3, r3, #31
	mov	r5, r0
	bpl	.L219
	mov	r3, r4
	mov	r2, #490
	ldr	r1, .L229
	ldr	r0, .L229+16
	bl	printk
	b	.L219
.L230:
	.align	2
.L229:
	.word	.LANCHOR0+259
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_int_process, .-mpp_enc_int_process
	.align	1
	.global	mpp_enc_proc_debug
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_debug, %function
mpp_enc_proc_debug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r7, r2
	mov	r4, r1
	cbnz	r1, .L232
	movw	r2, #499
	ldr	r1, .L238
	ldr	r0, .L238+4
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L232:
	ldr	r5, .L238+8
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L233
	mov	r3, r1
	movw	r2, #503
	ldr	r1, .L238
	ldr	r0, .L238+12
	bl	printk
.L233:
	mov	r2, r7
	mov	r1, r4
	mov	r0, r6
	bl	mpp_enc_impl_poc_debug_info
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L231
	mov	r3, r4
	movw	r2, #507
	ldr	r1, .L238
	ldr	r0, .L238+16
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L231:
	pop	{r4, r5, r6, r7, r8, pc}
.L239:
	.align	2
.L238:
	.word	.LANCHOR0+279
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_proc_debug, .-mpp_enc_proc_debug
	.align	1
	.global	mpp_enc_register_chl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_register_chl, %function
mpp_enc_register_chl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L241
	movw	r2, #519
	ldr	r1, .L243
	ldr	r0, .L243+4
	bl	printk
	mvn	r0, #2
.L240:
	pop	{r3, pc}
.L241:
	movw	r3, #5360
	ldr	r3, [r0, r3]
	ldr	r0, [r0, #12]
	orr	r2, r2, r3, lsl #16
	bl	mpp_dev_chnl_register
	movs	r0, #0
	b	.L240
.L244:
	.align	2
.L243:
	.word	.LANCHOR0+298
	.word	.LC11
	.fnend
	.size	mpp_enc_register_chl, .-mpp_enc_register_chl
	.align	1
	.global	mpp_enc_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_notify, %function
mpp_enc_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L252
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L247
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #534
	ldr	r1, .L252+4
	ldr	r0, .L252+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L247
	mov	r3, r4
	mov	r2, #536
	ldr	r1, .L252+4
	ldr	r0, .L252+12
	bl	printk
.L247:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L253:
	.align	2
.L252:
	.word	.LANCHOR1
	.word	.LANCHOR0+319
	.word	.LC14
	.word	.LC10
	.fnend
	.size	mpp_enc_notify, .-mpp_enc_notify
	.align	1
	.global	mpp_enc_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_control, %function
mpp_enc_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r6, r1
	mov	r4, r2
	mov	r5, r0
	cbnz	r0, .L255
	mov	r2, #552
	ldr	r1, .L322
	ldr	r0, .L322+4
	bl	printk
.L319:
	mvn	r0, #2
.L254:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L255:
	cbnz	r2, .L257
	ldr	r3, .L322+8
	cmp	r1, r3
	beq	.L257
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #557
	ldr	r1, .L322
	ldr	r0, .L322+12
	bl	printk
	b	.L319
.L257:
	ldr	r7, .L322+16
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L258
	str	r4, [sp]
	mov	r3, r6
	movw	r2, #561
	ldr	r1, .L322
	ldr	r0, .L322+20
	bl	printk
.L258:
	ldr	r3, .L322+24
	cmp	r6, r3
	beq	.L259
	bhi	.L260
	subs	r3, r3, #4
	cmp	r6, r3
	beq	.L261
	bhi	.L262
	subs	r3, r3, #1
	cmp	r6, r3
	beq	.L263
.L264:
	add	r8, r5, #5344
	add	r8, r8, #28
	mov	r0, r8
	bl	down
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	mpp_enc_proc_cfg
	ldr	r0, [r5, #8]
	bl	mpp_enc_hal_prepare
	mov	r0, r8
	bl	up
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L318
	mov	r3, r6
	mov	r2, #620
	ldr	r1, .L322
	ldr	r0, .L322+28
	bl	printk
	b	.L318
.L262:
	ldr	r3, .L322+32
	cmp	r6, r3
	beq	.L265
	adds	r3, r3, #2
	cmp	r6, r3
	bne	.L264
	ldr	r3, [r7]
	lsls	r7, r3, #30
	bpl	.L277
	mov	r2, #592
	ldr	r1, .L322
	ldr	r0, .L322+36
	bl	printk
.L277:
	movs	r2, #200
	add	r1, r5, #704
	b	.L320
.L260:
	ldr	r3, .L322+40
	cmp	r6, r3
	beq	.L267
	bhi	.L268
	subs	r3, r3, #12
	cmp	r6, r3
	bne	.L264
	ldr	r3, [r7]
	lsls	r6, r3, #30
	bpl	.L278
	movw	r2, #597
	ldr	r1, .L322
	ldr	r0, .L322+44
	bl	printk
.L278:
	mov	r2, #2832
	add	r1, r5, #1192
	b	.L320
.L268:
	ldr	r3, .L322+48
	cmp	r6, r3
	beq	.L270
	add	r3, r3, #512
	cmp	r6, r3
	bne	.L264
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L280
	movw	r2, #607
	ldr	r1, .L322
	ldr	r0, .L322+52
	bl	printk
.L280:
	add	r5, r5, #5280
	adds	r5, r5, #20
	add	r3, r5, #24
.L281:
	ldr	r2, [r5], #4	@ unaligned
	cmp	r5, r3
	str	r2, [r4], #4	@ unaligned
	bne	.L281
	b	.L318
.L263:
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L272
	movw	r2, #567
	ldr	r1, .L322
	ldr	r0, .L322+56
	bl	printk
.L272:
	movw	r2, #4740
	add	r1, r5, #600
	mov	r0, r4
	bl	memcpy
	ldr	r3, [r4, #56]
	bic	r3, r3, #2
	cmp	r3, #1
	itttt	eq
	ldrdeq	r2, r3, [r4, #12]
	strdeq	r3, r2, [r4, #12]
	ldrdeq	r2, r3, [r4, #28]
	strdeq	r3, r2, [r4, #28]
.L318:
	movs	r0, #0
	b	.L254
.L261:
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L274
	movw	r2, #577
	ldr	r1, .L322
	ldr	r0, .L322+60
	bl	printk
.L274:
	add	r0, r5, #608
	movs	r2, #96
	mov	r1, r4
.L321:
	bl	memcpy
	b	.L318
.L259:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L275
	movw	r2, #582
	ldr	r1, .L322
	ldr	r0, .L322+64
	bl	printk
.L275:
	mov	r2, #2832
	mov	r1, r4
	add	r0, r5, #1192
	b	.L321
.L265:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L276
	movw	r2, #587
	ldr	r1, .L322
	ldr	r0, .L322+68
	bl	printk
.L276:
	add	r1, r5, #608
	movs	r2, #96
.L320:
	mov	r0, r4
	b	.L321
.L270:
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L279
	movw	r2, #602
	ldr	r1, .L322
	ldr	r0, .L322+72
	bl	printk
.L279:
	ldr	r3, [r5, #420]	@ unaligned
	str	r3, [r4]	@ unaligned
	b	.L318
.L267:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L282
	mov	r2, #612
	ldr	r1, .L322
	ldr	r0, .L322+76
	bl	printk
.L282:
	movs	r2, #136
	addw	r1, r5, #4036
	b	.L320
.L323:
	.align	2
.L322:
	.word	.LANCHOR0+334
	.word	.LC15
	.word	3276809
	.word	.LC16
	.word	.LANCHOR1
	.word	.LC17
	.word	3276807
	.word	.LC27
	.word	3276804
	.word	.LC22
	.word	3276820
	.word	.LC23
	.word	3309570
	.word	.LC25
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC24
	.word	.LC26
	.fnend
	.size	mpp_enc_control, .-mpp_enc_control
	.align	1
	.global	mpp_enc_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_pkt_full_inc, %function
mpp_enc_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_enc_impl_pkt_full_inc
	.fnend
	.size	mpp_enc_pkt_full_inc, .-mpp_enc_pkt_full_inc
	.global	mpp_enc_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.22499, %object
	.size	__func__.22499, 15
__func__.22499:
	.ascii	"mpp_enc_deinit\000"
	.type	__FUNCTION__.22500, %object
	.size	__FUNCTION__.22500, 15
__FUNCTION__.22500:
	.ascii	"mpp_enc_deinit\000"
	.type	__func__.22479, %object
	.size	__func__.22479, 13
__func__.22479:
	.ascii	"mpp_enc_init\000"
	.type	__FUNCTION__.22480, %object
	.size	__FUNCTION__.22480, 13
__FUNCTION__.22480:
	.ascii	"mpp_enc_init\000"
	.type	__func__.22505, %object
	.size	__func__.22505, 14
__func__.22505:
	.ascii	"mpp_enc_start\000"
	.type	__func__.22511, %object
	.size	__func__.22511, 13
__func__.22511:
	.ascii	"mpp_enc_stop\000"
	.type	__func__.22526, %object
	.size	__func__.22526, 14
__func__.22526:
	.ascii	"mpp_enc_reset\000"
	.type	__func__.22534, %object
	.size	__func__.22534, 17
__func__.22534:
	.ascii	"mpp_enc_oneframe\000"
	.type	__func__.22542, %object
	.size	__func__.22542, 16
__func__.22542:
	.ascii	"mpp_enc_cfg_reg\000"
	.type	__FUNCTION__.22545, %object
	.size	__FUNCTION__.22545, 16
__FUNCTION__.22545:
	.ascii	"mpp_enc_cfg_reg\000"
	.type	__func__.22552, %object
	.size	__func__.22552, 17
__func__.22552:
	.ascii	"mpp_enc_hw_start\000"
	.type	__func__.22563, %object
	.size	__func__.22563, 17
__func__.22563:
	.ascii	"mpp_enc_run_task\000"
	.type	__func__.22568, %object
	.size	__func__.22568, 25
__func__.22568:
	.ascii	"mpp_enc_check_hw_running\000"
	.type	__func__.22573, %object
	.size	__func__.22573, 25
__func__.22573:
	.ascii	"mpp_enc_unbind_jpeg_task\000"
	.type	__func__.22579, %object
	.size	__func__.22579, 29
__func__.22579:
	.ascii	"mpp_enc_check_is_int_process\000"
	.type	__func__.22588, %object
	.size	__func__.22588, 20
__func__.22588:
	.ascii	"mpp_enc_int_process\000"
	.type	__func__.22598, %object
	.size	__func__.22598, 19
__func__.22598:
	.ascii	"mpp_enc_proc_debug\000"
	.type	__func__.22606, %object
	.size	__func__.22606, 21
__func__.22606:
	.ascii	"mpp_enc_register_chl\000"
	.type	__func__.22612, %object
	.size	__func__.22612, 15
__func__.22612:
	.ascii	"mpp_enc_notify\000"
	.type	__func__.22620, %object
	.size	__func__.22620, 16
__func__.22620:
	.ascii	"mpp_enc_control\000"
	.type	__param_str_mpp_enc_debug, %object
	.size	__param_str_mpp_enc_debug, 25
__param_str_mpp_enc_debug:
	.ascii	"mpp_vcodec.mpp_enc_debug\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpp_enc_debug, %object
	.size	mpp_enc_debug, 4
mpp_enc_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_mpp_enc_debug163, %object
	.size	__UNIQUE_ID_mpp_enc_debug163, 61
__UNIQUE_ID_mpp_enc_debug163:
	.ascii	"mpp_vcodec.parm=mpp_enc_debug:bits mpp_enc debug in"
	.ascii	"formation\000"
	.type	__UNIQUE_ID_mpp_enc_debugtype162, %object
	.size	__UNIQUE_ID_mpp_enc_debugtype162, 39
__UNIQUE_ID_mpp_enc_debugtype162:
	.ascii	"mpp_vcodec.parmtype=mpp_enc_debug:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: found NULL input\012\000"
.LC1:
	.ascii	"\0016%d: buf_pool_destroy in\000"
.LC2:
	.ascii	"\0016%d: buf_pool_destroy out\000"
.LC3:
	.ascii	"smart\000"
.LC4:
	.ascii	"\0013%s:%d: failed to malloc context\012\000"
.LC5:
	.ascii	"\0013%s:%d: could not init enc refs\012\000"
.LC6:
	.ascii	"\0013%s:%d: could not init enc hal\012\000"
.LC7:
	.ascii	"\0013%s:%d: could not init impl\012\000"
.LC8:
	.ascii	"67a7527e author: Yandong Lin 2024-01-17 [h264e_sps]"
	.ascii	": fix constraint_set value issue\000"
.LC9:
	.ascii	"\0016%s:%d: %p in\012\000"
.LC10:
	.ascii	"\0016%s:%d: %p out\012\000"
.LC11:
	.ascii	"\0013%s:%d: found NULL input enc\012\000"
.LC12:
	.ascii	"mpp_enc\000"
.LC13:
	.ascii	"\0016%d: alloc mv_flag failed!\012\000"
.LC14:
	.ascii	"\0016%s:%d: %p in flag %08x\012\000"
.LC15:
	.ascii	"\0013%s:%d: found NULL enc\012\000"
.LC16:
	.ascii	"\0013%s:%d: found NULL param enc %p cmd %x\012\000"
.LC17:
	.ascii	"\0016%s:%d: sending cmd %d param %p\012\000"
.LC18:
	.ascii	"\0016%s:%d: get all config\012\000"
.LC19:
	.ascii	"\0016%s:%d: set prep config\012\000"
.LC20:
	.ascii	"\0016%s:%d: set codec config\012\000"
.LC21:
	.ascii	"\0016%s:%d: get prep config\012\000"
.LC22:
	.ascii	"\0016%s:%d: get rc config\012\000"
.LC23:
	.ascii	"\0016%s:%d: get codec config\012\000"
.LC24:
	.ascii	"\0016%s:%d: get header mode\012\000"
.LC25:
	.ascii	"\0016%s:%d: get ref config\012\000"
.LC26:
	.ascii	"\0016%s:%d: get roi config\012\000"
.LC27:
	.ascii	"\0016%s:%d: sending cmd %d done\012\000"
	.section	__param,"a"
	.align	2
	.type	__param_mpp_enc_debug, %object
	.size	__param_mpp_enc_debug, 20
__param_mpp_enc_debug:
	.word	__param_str_mpp_enc_debug
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	mpp_enc_debug
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
