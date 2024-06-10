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
	.file	"mpp_enc_impl.c"
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
	.type	check_hal_task_pkt_len, %function
check_hal_task_pkt_len:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r4, [r0, #48]
	ldr	r0, [r0, #28]
	bl	mpp_packet_get_length
	cmp	r4, r0
	beq	.L1
	strd	r4, r0, [sp]
	mov	r3, r5
	movs	r2, #181
	ldr	r1, .L3
	ldr	r0, .L3+4
	bl	printk
.L1:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	check_hal_task_pkt_len, .-check_hal_task_pkt_len
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_frm_pkt, %function
mpp_enc_check_frm_pkt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movs	r3, #0
	str	r3, [r0, #392]
	mov	r4, r0
	ldr	r3, [r0, #372]
	cbz	r3, .L6
.L10:
	ldr	r0, [r4, #368]
	cbnz	r0, .L7
.L8:
	mov	r0, #-1
	b	.L5
.L6:
	add	r0, r0, #372
	bl	mpp_packet_new
	cmp	r0, #0
	beq	.L10
.L5:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L7:
	bl	mpp_frame_get_pts
	mov	r6, r0
	ldr	r0, [r4, #368]
	mov	r7, r1
	bl	mpp_frame_get_dts
	mov	r8, r0
	ldr	r0, [r4, #368]
	mov	r9, r1
	bl	mpp_frame_get_buffer
	mov	r5, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_ver_stride
	ldr	r3, [r4, #620]
	cmp	r3, r10
	bne	.L11
	ldr	r3, [r4, #624]
	cmp	r3, r0
	beq	.L12
.L11:
	movw	r1, #1195
	ldr	r0, .L18
	bl	printk
.L12:
	mov	r2, r6
	mov	r3, r7
	ldr	r0, [r4, #372]
	strd	r6, [r4, #384]
	str	r5, [r4, #392]
	bl	mpp_packet_set_pts
	ldr	r0, [r4, #372]
	mov	r2, r8
	mov	r3, r9
	bl	mpp_packet_set_dts
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_eos
	cbz	r0, .L13
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_eos
.L14:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L8
	ldr	r0, [r4, #392]
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L5
.L13:
	ldr	r0, [r4, #372]
	bl	mpp_packet_clr_eos
	b	.L14
.L19:
	.align	2
.L18:
	.word	.LC1
	.fnend
	.size	mpp_enc_check_frm_pkt, .-mpp_enc_check_frm_pkt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_two_pass, %function
mpp_enc_proc_two_pass:
	.fnstart
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #140
	sub	sp, sp, #140
	ldr	r0, [r0, #460]
	mov	r7, r1
	bl	mpp_enc_refs_next_frm_is_intra
	mov	r5, r0
	cmp	r0, #0
	beq	.L20
	ldrd	r2, [r4, #216]
	add	r1, r4, #224
	add	r0, sp, #32
	add	r5, r4, #64
	strd	r2, [sp, #24]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r7, #68]
	ldr	r10, [r7, #48]
	ldrd	fp, r8, [r4, #4]
	mov	r0, r10
	str	r3, [sp, #12]
	ldr	r3, [r7, #64]
	str	r3, [sp, #20]
	bl	mpp_packet_get_length
	ldr	r3, .L70
	ldr	r3, [r3]
	lsls	r6, r3, #26
	str	r0, [sp, #16]
	bpl	.L22
	ldrh	r3, [r4, #222]
	movw	r2, #1365
	ldr	r1, .L70+4
	ldr	r0, .L70+8
	bl	printk
.L22:
	movs	r2, #104
	add	r1, r4, #496
	add	r0, r4, #224
	bl	memcpy
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L23
	ldrh	r3, [r4, #222]
	mov	r2, #1368
	ldr	r1, .L70+4
	ldr	r0, .L70+12
	bl	printk
.L23:
	mov	r1, r5
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb_pass1
	ldr	r3, [r9]
	lsls	r5, r3, #15
	bpl	.L24
	ldrh	r3, [r4, #78]
	movw	r2, #1371
	ldr	r1, .L70+4
	ldr	r0, .L70+16
	bl	printk
.L24:
	add	r6, r7, #20
	mov	r0, fp
	mov	r1, r6
	bl	enc_impl_proc_dpb
	mov	r5, r0
	cbz	r0, .L25
	str	r0, [sp]
	movw	r3, #1372
	ldr	r0, .L70+20
	mov	r2, r4
	mov	r1, r3
.L69:
	bl	printk
.L21:
.L20:
	mov	r0, r5
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L25:
	ldr	r3, [r9]
	lsls	r0, r3, #26
	bpl	.L27
	ldrh	r3, [r4, #222]
	movw	r2, #1374
	ldr	r1, .L70+4
	ldr	r0, .L70+24
	bl	printk
.L27:
	mov	r1, r6
	mov	r0, fp
	bl	enc_impl_proc_hal
	mov	r5, r0
	cbz	r0, .L28
	movw	r3, #1375
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+28
	b	.L69
.L28:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L29
	ldrh	r3, [r4, #222]
	movw	r2, #1377
	ldr	r1, .L70+4
	ldr	r0, .L70+32
	bl	printk
.L29:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	mov	r5, r0
	cbz	r0, .L30
	movw	r3, #1378
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+36
	b	.L69
.L30:
	ldr	r3, [r9]
	lsls	r1, r3, #26
	bpl	.L31
	ldrh	r3, [r4, #222]
	movw	r2, #1380
	ldr	r1, .L70+4
	ldr	r0, .L70+40
	bl	printk
.L31:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r5, r0
	cbz	r0, .L32
	movw	r3, #1381
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+44
	b	.L69
.L32:
	ldr	r3, [r9]
	lsls	r2, r3, #26
	bpl	.L33
	ldrh	r3, [r4, #222]
	movw	r2, #1383
	ldr	r1, .L70+4
	ldr	r0, .L70+48
	bl	printk
.L33:
	movs	r2, #0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r5, r0
	cbz	r0, .L34
	movw	r3, #1385
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+52
	b	.L69
.L34:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L35
	ldrh	r3, [r4, #222]
	movw	r2, #1387
	ldr	r1, .L70+4
	ldr	r0, .L70+56
	bl	printk
.L35:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbz	r0, .L36
	movw	r3, #1388
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+60
	b	.L69
.L36:
	mov	r2, r0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cbz	r0, .L37
	mov	r3, #1392
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+64
	b	.L69
.L37:
	ldr	r1, [sp, #16]
	mov	r0, r10
	bl	mpp_packet_set_length
	add	r0, r4, #224
	ldr	r3, [sp, #20]
	add	r1, sp, #32
	str	r3, [r7, #64]
	ldr	r3, [sp, #12]
	str	r3, [r7, #68]
	ldrd	r2, [sp, #24]
	strd	r2, [r4, #216]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r9]
	lsls	r3, r3, #26
	bpl	.L20
	ldrh	r3, [r4, #222]
	movw	r2, #1402
	ldr	r1, .L70+4
	ldr	r0, .L70+68
	bl	printk
	b	.L20
.L71:
	.align	2
.L70:
	.word	mpp_enc_debug
	.word	.LANCHOR0+23
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.fnend
	.size	mpp_enc_proc_two_pass, .-mpp_enc_proc_two_pass
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	update_rc_cfg_log.constprop.1, %function
update_rc_cfg_log.constprop.1:
	.fnstart
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	.save {r1, r2, r3}
	push	{r0, r1, r2, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #12
	mov	r5, r0
	ldrd	r4, r6, [r0, #444]
	add	r3, sp, #32
	ldr	r0, [r0, #436]
	subs	r1, r6, r4
	ldr	r2, .L74
	add	r0, r0, r4
	str	r3, [sp, #4]
	bl	vsnprintf
	add	r4, r4, r0
	cmp	r6, r4
	bgt	.L73
	movw	r2, #957
	ldr	r1, .L74+4
	ldr	r0, .L74+8
	bl	printk
.L73:
	str	r4, [r5, #444]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, lr}
	add	sp, sp, #12
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LC18
	.word	.LANCHOR0+45
	.word	.LC19
	.fnend
	.size	update_rc_cfg_log.constprop.1, .-update_rc_cfg_log.constprop.1
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_terminate_task, %function
mpp_enc_terminate_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #368]
	mov	r5, r1
	cbz	r3, .L77
	add	r0, r0, #368
	bl	mpp_frame_deinit
	movs	r3, #0
	str	r3, [r4, #368]
.L77:
	ldr	r0, [r4, #372]
	cbz	r0, .L78
	movs	r1, #0
	bl	mpp_packet_set_length
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L78:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [r5, #8]
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpp_enc_terminate_task, .-mpp_enc_terminate_task
	.global	__aeabi_idiv
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_comb_end_jpeg, %function
mpp_enc_comb_end_jpeg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r0, #456]
	mov	r4, r0
	ldr	r6, [r0, #8]
	add	r7, r0, #64
	str	r1, [sp, #28]
	bl	get_mpidev_ops
	ldrd	r2, r3, [r5, #64]
	add	r1, r5, #20
	ldr	r8, .L139+40
	subs	r3, r3, r2
	movs	r2, #0
	str	r3, [r5, #68]
	mov	r9, r0
	mov	r0, r6
	bl	mpp_enc_hal_ret_task
	mov	r6, r0
	cmp	r0, #0
	beq	.L86
	str	r0, [sp]
	movw	r3, #1925
	ldr	r0, .L139
	mov	r2, r4
	mov	r1, r3
.L137:
	bl	printk
	ldr	r3, [r4, #52]
	movs	r1, #0
	ldr	r0, [r4, #372]
	adds	r3, r3, #1
	str	r3, [r4, #52]
	bl	mpp_packet_set_length
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L97:
	ldr	r3, [r4, #372]
	ldr	r2, [sp, #28]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #372]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L98
	ldrd	r2, [r4, #384]
	ldr	r1, .L139+4
	ldr	r0, .L139+8
	strd	r2, [sp]
	movw	r2, #1975
	ldrh	r3, [r4, #222]
	bl	printk
.L98:
	ldr	r3, [r4, #368]
	cbz	r3, .L99
	add	r0, r4, #368
	bl	mpp_frame_deinit
.L99:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	mov	r0, r6
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [r5, #8]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L86:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_end
	mov	r6, r0
	cbz	r0, .L88
	movw	r3, #1926
	str	r0, [sp]
.L138:
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L139+12
	b	.L137
.L88:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L89
	ldrh	r3, [r4, #222]
	movw	r2, #1927
	ldr	r1, .L139+4
	ldr	r0, .L139+16
	bl	printk
.L89:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_end
	mov	r6, r0
	cbz	r0, .L90
	str	r0, [sp]
	mov	r3, #1928
	b	.L138
.L90:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L91
	ldrh	r3, [r4, #222]
	movw	r2, #1929
	ldr	r1, .L139+4
	ldr	r0, .L139+20
	bl	printk
.L91:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	mov	r6, r0
	cbz	r0, .L92
	movw	r3, #1930
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L139+24
	b	.L137
.L92:
	ldr	r2, [r4, #364]
	movw	r3, #10804
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #48]
	adds	r3, r3, #1
	str	r3, [r4, #48]
	strd	r0, [r4, #32]
	cmp	r9, #0
	beq	.L93
	ldr	r3, [r9, #24]
	cbz	r3, .L93
	ldr	r0, [r5, #72]
	bl	mpp_frame_get_dts
	mov	r6, r0
	ldr	r0, [r5, #72]
	mov	r7, r1
	bl	mpp_frame_get_pts
	movs	r3, #1
	mov	r2, r6
	strd	r0, [sp]
	movw	r0, #10808
	str	r3, [sp, #8]
	mov	r3, r7
	ldr	r1, [r9, #24]
	ldr	r0, [r4, r0]
	blx	r1
.L93:
	ldr	r3, [r4, #12]
	cbz	r3, .L94
	ldrd	r10, [r4, #24]
	orrs	r3, r10, fp
	beq	.L94
	ldrd	r6, [r4, #32]
	orrs	r3, r6, r7
	beq	.L94
	subs	r3, r6, r10
	str	r3, [sp, #16]
	sbc	r3, r7, fp
	str	r3, [sp, #20]
	ldrd	r0, [sp, #16]
	movs	r3, #0
	ldr	r2, .L139+28
	cmp	r2, r0
	sbcs	r3, r3, r1
	bge	.L94
	ldr	r0, .L139+32
	sub	r10, r6, r10
	ldr	r3, [r4, #48]
	add	r9, r4, #5344
	smull	r0, r1, r10, r0
	asr	r10, r10, #31
	movw	r0, #10000
	muls	r0, r3, r0
	rsb	r1, r10, r1, asr #6
	bl	__aeabi_idiv
	movs	r3, #0
	str	r0, [r9]
	strd	r6, [r4, #24]
	str	r3, [r4, #48]
.L94:
	ldrh	r3, [r4, #220]
	ldr	r0, [r4, #372]
	and	r3, r3, #251
	strh	r3, [r4, #220]	@ movhi
	ldr	r1, [r5, #68]
	bl	mpp_packet_set_length
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r2, r3, #27
	bpl	.L95
	movs	r1, #16
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L95:
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_eos
	cbz	r0, .L96
	movs	r1, #1
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L96:
	ldrb	r1, [r4, #217]	@ zero_extendqisi2
	ldr	r0, [r4, #372]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	mov	r6, r0
	cmp	r0, #0
	beq	.L97
	movw	r2, #1963
	ldr	r1, .L139+4
	ldr	r0, .L139+36
	movs	r6, #0
	bl	printk
	b	.L97
.L140:
	.align	2
.L139:
	.word	.LC16
	.word	.LANCHOR0+63
	.word	.LC24
	.word	.LC20
	.word	.LC14
	.word	.LC21
	.word	.LC22
	.word	999999
	.word	274877907
	.word	.LC23
	.word	mpp_enc_debug
	.fnend
	.size	mpp_enc_comb_end_jpeg, .-mpp_enc_comb_end_jpeg
	.align	1
	.global	mpp_enc_proc_rc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_cfg, %function
mpp_enc_proc_rc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #236
	sub	sp, sp, #236
	mov	r5, r1
	cmp	r6, #0
	beq	.L184
	mov	r1, r0
	movs	r2, #200
	add	r0, sp, #32
	bl	memcpy
	ldrd	r8, r3, [r4, #112]
	lsls	r7, r6, #31
	ldrd	r9, r10, [r4, #128]
	ldr	fp, [r4, #140]
	str	r3, [sp, #16]
	ldr	r3, [r4, #120]
	str	r3, [sp, #20]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #136]
	str	r3, [sp, #28]
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #4]
	lsls	r0, r6, #30
	itt	mi
	ldrmi	r3, [r5, #8]
	strmi	r3, [r4, #8]
	lsls	r1, r6, #29
	bpl	.L145
	ldr	r3, [r5, #12]
	str	r3, [r4, #12]
	ldr	r3, [r5, #16]
	str	r3, [r4, #16]
	ldr	r3, [r5, #20]
	str	r3, [r4, #20]
.L145:
	lsls	r2, r6, #26
	bpl	.L146
	ldr	r3, [r5, #24]
	str	r3, [r4, #24]
	ldr	r3, [r5, #28]
	str	r3, [r4, #28]
	ldr	r3, [r5, #32]
	str	r3, [r4, #32]
.L146:
	lsls	r3, r6, #25
	bpl	.L147
	ldr	r3, [r5, #36]
	str	r3, [r4, #36]
	ldr	r3, [r5, #40]
	str	r3, [r4, #40]
	ldr	r3, [r5, #44]
	str	r3, [r4, #44]
.L147:
	lsls	r7, r6, #24
	itt	mi
	ldrmi	r3, [r5, #48]
	strmi	r3, [r4, #48]
	lsls	r0, r6, #22
	itt	mi
	ldrmi	r3, [r5, #56]
	strmi	r3, [r4, #56]
	lsls	r1, r6, #21
	bpl	.L150
	ldr	r3, [r5, #64]
	str	r3, [r4, #64]
	ldr	r3, [r5, #68]
	str	r3, [r4, #68]
	ldr	r3, [r5, #72]
	str	r3, [r4, #72]
.L150:
	ands	r7, r6, #16384
	beq	.L151
	ldr	r2, [r5, #88]
	cmp	r2, #1
	bls	.L186
	movs	r3, #2
	movw	r1, #373
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L261
	mvn	r7, #5
	bl	printk
.L152:
	ldr	r3, [r5, #88]
	str	r3, [r4, #88]
.L151:
	lsls	r2, r6, #16
	bpl	.L153
	ldr	r2, [r5, #76]
	cmp	r2, #2
	bls	.L154
	movs	r3, #3
	mov	r1, #384
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L261+4
	mvn	r7, #5
	bl	printk
.L154:
	ldr	r3, [r5, #76]
	str	r3, [r4, #76]
	ldr	r3, [r5, #80]
	str	r3, [r4, #80]
	ldr	r3, [r5, #84]
	str	r3, [r4, #84]
.L153:
	lsls	r3, r6, #7
	bpl	.L155
	ldr	r2, [r5, #92]
	str	r2, [r4, #92]
	ldr	r3, [r5, #96]
	str	r3, [r4, #96]
	cbz	r2, .L155
	cmp	r3, #35
	bls	.L155
	movs	r3, #35
	movs	r2, #0
	movw	r1, #397
	ldr	r0, .L261+8
	bl	printk
	mvn	r7, #5
.L155:
	lsls	r0, r6, #20
	itt	mi
	ldrmi	r3, [r5, #100]
	strmi	r3, [r4, #100]
	lsls	r1, r6, #19
	itt	mi
	ldrmi	r3, [r5, #104]
	strmi	r3, [r4, #104]
	lsls	r2, r6, #18
	itt	mi
	ldrmi	r3, [r5, #108]
	strmi	r3, [r4, #108]
	lsls	r3, r6, #15
	itt	mi
	ldrmi	r3, [r5, #112]
	strmi	r3, [r4, #112]
	lsls	r0, r6, #14
	itttt	mi
	ldrmi	r3, [r5, #124]
	strmi	r3, [r4, #124]
	ldrmi	r3, [r5, #116]
	strmi	r3, [r4, #116]
	lsls	r1, r6, #13
	itttt	mi
	ldrmi	r3, [r5, #128]
	strmi	r3, [r4, #128]
	ldrmi	r3, [r5, #120]
	strmi	r3, [r4, #120]
	lsls	r2, r6, #12
	itt	mi
	ldrmi	r3, [r5, #132]
	strmi	r3, [r4, #132]
	lsls	r3, r6, #11
	itt	mi
	ldrmi	r3, [r5, #136]
	strmi	r3, [r4, #136]
	lsls	r0, r6, #10
	itt	mi
	ldrmi	r3, [r5, #140]
	strmi	r3, [r4, #140]
	lsls	r1, r6, #4
	bpl	.L165
	ldr	r3, [r5, #144]
	str	r3, [r4, #144]
	ldr	r3, [r5, #148]
	str	r3, [r4, #148]
	ldr	r3, [r5, #152]
	str	r3, [r4, #152]
	ldr	r3, [r5, #156]
	str	r3, [r4, #156]
	ldr	r3, [r5, #160]
	str	r3, [r4, #160]
.L165:
	lsls	r2, r6, #6
	bpl	.L166
	ldr	r3, [r5, #164]
	add	r2, r4, #168
	add	r1, r5, #184
	str	r3, [r4, #164]
	add	r3, r5, #168
.L167:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L167
	add	r3, r5, #184
	add	r2, r4, #184
	add	r1, r5, #200
.L168:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L168
.L166:
	lsls	r3, r6, #5
	itt	mi
	ldrmi	r3, [r5, #60]
	strmi	r3, [r4, #60]
	ldr	r3, [r4, #4]
	cmp	r3, #4
	bls	.L170
	ldr	r2, [r5, #4]
	mov	r1, #456
	ldr	r0, .L261+12
	mvn	r7, #5
	bl	printk
.L170:
	ldr	r2, [r4, #8]
	cmp	r2, #6
	bls	.L171
	movw	r1, #461
	ldr	r0, .L261+16
	bl	printk
	mvn	r7, #5
.L171:
	ldr	r3, [r4, #4]
	cmp	r3, #2
	beq	.L172
	ldrd	r2, r0, [r4, #12]
	mvn	lr, #1024
	ldr	r1, .L261+20
	add	r5, r2, lr
	ldr	r3, [r4, #20]
	cmp	r5, r1
	bhi	.L173
	mvn	ip, #1024
	add	r5, r0, ip
	cmp	r5, r1
	bhi	.L173
	mvn	r5, #1024
	adds	r5, r3, r5
	cmp	r5, r1
	bls	.L172
.L173:
	str	r0, [sp]
	movw	r1, #473
	ldr	r0, .L261+24
	mvn	r7, #5
	bl	printk
.L172:
	ldrd	r0, r3, [r4, #124]
	ldr	r2, [r4, #112]
	cmp	r3, #0
	ldrd	r5, r3, [r4, #116]
	it	le
	strle	r0, [r4, #128]
	cmp	r3, #0
	ldr	r3, [r4, #128]
	it	le
	strle	r5, [r4, #120]
	cmp	r0, #0
	ldr	r1, [r4, #120]
	blt	.L176
	cmp	r5, #0
	blt	.L176
	cmp	r5, r0
	blt	.L176
	cmp	r3, #0
	blt	.L176
	cmp	r1, #0
	blt	.L176
	cmp	r1, r3
	blt	.L176
	cmp	r2, #0
	ble	.L177
	cmp	r1, r2
	blt	.L176
	cmp	r3, r2
	ble	.L177
.L176:
	strd	r0, r5, [sp, #4]
	str	r1, [sp]
	movw	r1, #489
	ldr	r0, .L261+28
	bl	printk
	str	r8, [r4, #112]
	str	r9, [r4, #128]
	mov	r2, r8
	movw	r1, #499
	ldr	r0, .L261+32
	ldr	r3, [sp, #20]
	str	r3, [r4, #120]
	ldr	r3, [sp, #24]
	str	r3, [r4, #124]
	ldr	r3, [sp, #16]
	str	r3, [r4, #116]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r3, [sp, #4]
	ldr	r3, [sp, #20]
	str	r3, [sp]
	mov	r3, r9
	bl	printk
.L177:
	ldr	r2, [r4, #136]
	cmp	r2, #0
	bge	.L178
	ldr	r3, [sp, #28]
	movw	r1, #503
	ldr	r0, .L261+36
	bl	printk
	ldr	r3, [sp, #28]
	str	r3, [r4, #136]
.L178:
	ldr	r2, [r4, #140]
	cmp	r2, #0
	bge	.L179
	mov	r3, fp
	mov	r1, #508
	ldr	r0, .L261+40
	bl	printk
	str	fp, [r4, #140]
.L179:
	ldr	r2, [r4, #132]
	cmp	r2, #0
	bge	.L180
	mov	r3, r10
	movw	r1, #513
	ldr	r0, .L261+44
	bl	printk
	str	r10, [r4, #132]
.L180:
	ldr	r2, [r4, #60]
	cmp	r2, #60
	ble	.L181
	movw	r1, #518
	ldr	r0, .L261+48
	bl	printk
.L181:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r7, .L182
	mov	r2, #524
	ldr	r1, .L261+52
	ldr	r0, .L261+56
	bl	printk
	movs	r2, #200
	mov	r0, r4
	add	r1, sp, #32
	bl	memcpy
.L141:
	mov	r0, r7
	add	sp, sp, #236
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L186:
	movs	r7, #0
	b	.L152
.L182:
	ldr	r3, [r4, #48]
	movw	r1, #529
	ldr	r2, [r4, #12]
	ldr	r0, .L261+60
	str	r3, [sp, #12]
	ldr	r3, [r4, #40]
	str	r3, [sp, #8]
	ldr	r3, [r4, #28]
	str	r3, [sp, #4]
	ldr	r3, [r4, #16]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	bl	printk
	b	.L141
.L184:
	mov	r7, r6
	b	.L141
.L262:
	.align	2
.L261:
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	104856574
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LANCHOR0+85
	.word	.LC37
	.word	.LC38
	.fnend
	.size	mpp_enc_proc_rc_cfg, .-mpp_enc_proc_rc_cfg
	.align	1
	.global	mpp_enc_proc_hw_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_hw_cfg, %function
mpp_enc_proc_hw_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #288
	sub	sp, sp, #288
	mov	r5, r1
	cmp	r6, #0
	beq	.L288
	mov	r1, r0
	mov	r2, #288
	mov	r0, sp
	bl	memcpy
	lsls	r1, r6, #31
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #4]
	lsls	r2, r6, #30
	itt	mi
	ldrmi	r3, [r5, #8]
	strmi	r3, [r4, #8]
	lsls	r3, r6, #25
	itt	mi
	ldrmi	r3, [r5, #12]
	strmi	r3, [r4, #12]
	lsls	r0, r6, #24
	itt	mi
	ldrmi	r3, [r5, #16]
	strmi	r3, [r4, #16]
	lsls	r1, r6, #23
	itt	mi
	ldrmi	r3, [r5, #20]
	strmi	r3, [r4, #20]
	lsls	r2, r6, #22
	itt	mi
	ldrmi	r3, [r5, #24]
	strmi	r3, [r4, #24]
	lsls	r3, r6, #21
	itt	mi
	ldrmi	r3, [r5, #28]
	strmi	r3, [r4, #28]
	lsls	r0, r6, #29
	bpl	.L272
	add	r3, r5, #32
	add	r2, r4, #32
	add	r1, r5, #96
.L273:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L273
.L272:
	lsls	r1, r6, #28
	bpl	.L274
	add	r3, r5, #96
	add	r2, r4, #96
	add	r1, r5, #160
.L275:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L275
.L274:
	lsls	r2, r6, #27
	bpl	.L276
	add	r3, r5, #160
	add	r2, r4, #160
	add	r1, r5, #224
.L277:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L277
.L276:
	lsls	r3, r6, #26
	bpl	.L278
	add	r3, r5, #224
	add	r2, r4, #224
	add	r5, r5, #288
.L279:
	ldr	r1, [r3], #4	@ unaligned
	cmp	r3, r5
	str	r1, [r2], #4	@ unaligned
	bne	.L279
.L278:
	ldrd	r3, r2, [r4, #4]
	cmp	r3, #0
	blt	.L280
	cmp	r2, #0
	bge	.L289
.L280:
	movw	r1, #583
	ldr	r0, .L330
	bl	printk
	mvn	r5, #5
.L281:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bge	.L282
	mov	r1, #588
	ldr	r0, .L330+4
	bl	printk
	mvn	r5, #5
.L282:
	ldrd	r2, r3, [r4, #12]
	cmp	r2, #0
	blt	.L283
	cmp	r3, #0
	bge	.L284
.L283:
	movw	r1, #594
	ldr	r0, .L330+8
	bl	printk
	mvn	r5, #5
.L284:
	ldrd	r2, r3, [r4, #24]
	cmp	r2, #0
	blt	.L285
	cmp	r3, #0
	bge	.L286
.L285:
	mov	r1, #600
	ldr	r0, .L330+12
	bl	printk
	mvn	r5, #5
.L286:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r5, .L263
	movw	r2, #607
	ldr	r1, .L330+16
	ldr	r0, .L330+20
	bl	printk
	mov	r2, #288
	mov	r0, r4
	mov	r1, sp
	bl	memcpy
.L263:
	mov	r0, r5
	add	sp, sp, #288
	@ sp needed
	pop	{r4, r5, r6, pc}
.L289:
	movs	r5, #0
	b	.L281
.L288:
	mov	r5, r6
	b	.L263
.L331:
	.align	2
.L330:
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LANCHOR0+105
	.word	.LC43
	.fnend
	.size	mpp_enc_proc_hw_cfg, .-mpp_enc_proc_hw_cfg
	.align	1
	.global	mpp_enc_unref_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unref_osd_buf, %function
mpp_enc_unref_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	cbz	r0, .L345
	ldr	r3, [r0]
	cbz	r3, .L345
	ldr	r7, .L349
	mov	r5, r0
	ldr	r8, .L349+4
	movs	r6, #0
.L335:
	ldr	r3, [r4, #4]
	cmp	r6, r3
	bcc	.L338
.L345:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L338:
	ldr	r0, [r5, #136]
	cbz	r0, .L336
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L336:
	ldr	r0, [r5, #88]
	cbz	r0, .L337
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L337:
	adds	r6, r6, #1
	adds	r5, r5, #140
	b	.L335
.L350:
	.align	2
.L349:
	.word	.LANCHOR0+125
	.word	.LC44
	.fnend
	.size	mpp_enc_unref_osd_buf, .-mpp_enc_unref_osd_buf
	.align	1
	.global	mpp_enc_proc_export_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_export_osd_buf, %function
mpp_enc_proc_export_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #104
	sub	sp, sp, #104
	mov	r7, r0
	bl	get_mpibuf_ops
	movs	r2, #104
	movs	r1, #0
	mov	r5, r0
	mov	r0, sp
	bl	memset
	cbz	r5, .L352
	ldr	r3, [r5, #44]
	cbz	r3, .L352
	ldr	r9, .L366+8
	mov	r4, r7
	ldr	r10, .L366+12
	movs	r6, #0
.L353:
	ldr	r3, [r7, #4]
	cmp	r3, r6
	bhi	.L359
	movs	r0, #0
	b	.L351
.L352:
	movw	r2, #721
	ldr	r1, .L366
	ldr	r0, .L366+4
	bl	printk
	mov	r0, #-1
.L351:
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L359:
	ldr	r0, [r4, #132]
	cmp	r0, #0
	ble	.L355
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L356
	ldr	r3, [r5, #44]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #136]
	mov	r0, r8
	bl	dma_buf_put
.L355:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	ble	.L357
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L358
	ldr	r3, [r5, #44]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #88]
	mov	r0, r8
	bl	dma_buf_put
.L357:
	adds	r6, r6, #1
	adds	r4, r4, #140
	b	.L353
.L356:
	ldr	r2, [r4, #132]
	mov	r1, #736
	mov	r0, r9
	bl	printk
	b	.L355
.L358:
	ldr	r2, [r4, #84]
	movw	r1, #747
	mov	r0, r10
	bl	printk
	b	.L357
.L367:
	.align	2
.L366:
	.word	.LANCHOR0+147
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.fnend
	.size	mpp_enc_proc_export_osd_buf, .-mpp_enc_proc_export_osd_buf
	.align	1
	.global	mpp_enc_proc_tune_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_tune_cfg, %function
mpp_enc_proc_tune_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r7, [r1]
	.pad #24
	sub	sp, sp, #24
	mov	r8, r1
	cmp	r7, #0
	beq	.L375
	ldm	r0, {r0, r1, r2}
	add	r5, sp, #12
	stm	r5, {r0, r1, r2}
	lsls	r2, r7, #31
	itt	mi
	ldrmi	r3, [r8, #4]
	strmi	r3, [r4, #4]
	ldr	r2, [r4, #4]
	cmp	r2, #1
	bls	.L376
	movs	r3, #1
	movw	r1, #767
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L386
	mvn	r6, #5
	bl	printk
.L371:
	lsls	r3, r7, #30
	itt	mi
	ldrmi	r3, [r8, #8]
	strmi	r3, [r4, #8]
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bls	.L373
	movs	r3, #1
	movs	r2, #0
	movw	r1, #775
	ldr	r0, .L386+4
	bl	printk
	mvn	r6, #5
.L373:
	ldr	r3, [r4]
	orrs	r7, r7, r3
	str	r7, [r4]
	cbz	r6, .L368
	movw	r2, #782
	ldr	r1, .L386+8
	ldr	r0, .L386+12
	bl	printk
	ldm	r5, {r0, r1, r2}
	stm	r4, {r0, r1, r2}
.L368:
	mov	r0, r6
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L376:
	movs	r6, #0
	b	.L371
.L375:
	mov	r6, r7
	b	.L368
.L387:
	.align	2
.L386:
	.word	.LC48
	.word	.LC49
	.word	.LANCHOR0+175
	.word	.LC50
	.fnend
	.size	mpp_enc_proc_tune_cfg, .-mpp_enc_proc_tune_cfg
	.align	1
	.global	mpp_enc_proc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_cfg, %function
mpp_enc_proc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L521
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	cmp	r1, r3
	mov	r4, r0
	mov	r7, r1
	mov	r5, r2
	beq	.L389
	bhi	.L390
	subs	r3, r3, #6
	cmp	r1, r3
	beq	.L391
	bhi	.L392
	subs	r3, r3, #8
	cmp	r1, r3
	beq	.L393
	adds	r3, r3, #4
	cmp	r1, r3
	beq	.L394
.L395:
	mov	r2, r5
	mov	r1, r7
	b	.L514
.L392:
	ldr	r3, .L521+4
	cmp	r1, r3
	bcc	.L395
	ldrb	r3, [r0, #416]	@ zero_extendqisi2
	lsls	r6, r3, #31
	bmi	.L411
	ldr	r1, [r0, #404]
	ldr	r0, [r0, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #404]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #416]
	str	r0, [r4, #412]
.L411:
	ldr	r3, .L521+8
	cmp	r7, r3
	bne	.L412
	movw	r1, #857
	ldr	r0, .L521+12
	bl	printk
	movw	r1, #858
	ldr	r0, .L521+16
	bl	printk
	ldr	r3, [r4, #404]
	str	r3, [r5]
.L413:
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r4, #416]
	b	.L512
.L390:
	ldr	r3, .L521+20
	cmp	r1, r3
	beq	.L397
	bhi	.L398
	ldr	r3, .L521+24
	cmp	r1, r3
	beq	.L399
	adds	r3, r3, #2
	cmp	r1, r3
	bne	.L395
	movs	r2, #136
	mov	r1, r5
	addw	r0, r0, #4036
	bl	memcpy
	b	.L512
.L398:
	ldr	r3, .L521+28
	cmp	r1, r3
	beq	.L401
	adds	r3, r3, #253
	cmp	r1, r3
	beq	.L402
	subw	r3, r3, #767
	cmp	r1, r3
	bne	.L395
	movs	r3, #0
	str	r3, [sp]
	movw	r3, #5324
	ldr	r3, [r0, r3]
	str	r3, [sp, #4]
	ldr	r3, [r2]
	cbz	r3, .L419
	mov	r0, sp
	bl	mpp_enc_ref_cfg_init
.L419:
	ldr	r3, [sp, #4]
	cbnz	r3, .L420
	add	r0, sp, #4
	bl	mpp_enc_ref_cfg_init
	movw	r3, #5324
	ldr	r2, [sp, #4]
	str	r2, [r4, r3]
.L420:
	ldr	r1, [r5]
	cmp	r1, #5
	bhi	.L421
	tbh	[pc, r1, lsl #1]
.L423:
	.2byte	(.L426-.L423)/2
	.2byte	(.L425-.L423)/2
	.2byte	(.L425-.L423)/2
	.2byte	(.L425-.L423)/2
	.2byte	(.L424-.L423)/2
	.2byte	(.L422-.L423)/2
	.p2align 1
.L393:
	ldr	r6, [r2]
	mov	r1, #800
	ldr	r0, .L521+32
	bl	printk
	cbz	r6, .L404
	lsls	r3, r6, #31
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #604]
	movs	r3, #0
	str	r3, [r5]
.L404:
	ldr	r3, [r5, #104]
	cbz	r3, .L406
	add	r1, r5, #104
	add	r0, r4, #704
	bl	mpp_enc_proc_rc_cfg
	movs	r3, #0
	str	r3, [r5, #104]
.L406:
	ldr	r3, [r5, #304]
	cbz	r3, .L407
	add	r1, r5, #304
	add	r0, r4, #904
	bl	mpp_enc_proc_hw_cfg
	movs	r3, #0
	str	r3, [r5, #304]
.L407:
	movw	r6, #4728
	adds	r1, r5, r6
	ldr	r3, [r5, r6]
	cbz	r3, .L408
	add	r0, r4, #5312
	adds	r0, r0, #16
	bl	mpp_enc_proc_tune_cfg
	movs	r3, #0
	str	r3, [r5, r6]
.L408:
	ldr	r1, .L521+36
	mov	r2, r5
.L514:
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_cfg
	b	.L515
.L394:
	cbnz	r2, .L410
.L512:
	movs	r6, #0
	b	.L409
.L410:
	mov	r1, r2
	add	r0, r0, #704
	bl	mpp_enc_proc_rc_cfg
.L515:
	mov	r6, r0
	b	.L409
.L391:
	ldr	r3, [r0, #468]
	adds	r3, r3, #1
	str	r3, [r0, #468]
	b	.L512
.L412:
	ldr	r1, [r4, #404]
	mov	r0, r5
	bl	mpp_packet_copy
	b	.L413
.L399:
	mov	r1, #868
	ldr	r0, .L521+40
	bl	printk
	b	.L512
.L397:
	cbz	r2, .L414
	ldr	r3, [r2]
	cmp	r3, #1
	bhi	.L415
	ldr	r2, .L521+44
	str	r3, [r0, #420]
	ldr	r2, [r2]
	lsls	r0, r2, #30
	bpl	.L512
	ldr	r1, .L521+48
	mov	r2, #876
	ldr	r0, .L521+52
.L519:
	bl	printk
	b	.L512
.L415:
	ldr	r1, .L521+48
	movw	r2, #878
	ldr	r0, .L521+56
.L516:
	bl	printk
.L513:
	mov	r6, #-1
.L409:
	ldr	r3, [r4, #1192]
	bic	r8, r7, #4
	sub	r2, r3, #8
	cmp	r2, #1
	bls	.L437
	ldr	r2, .L521+60
	cmp	r8, r2
	beq	.L459
	adds	r2, r2, #6
	cmp	r7, r2
	beq	.L459
	subs	r2, r2, #4
	cmp	r7, r2
	bne	.L439
	ldr	r3, [r5]
	tst	r3, #225
	beq	.L440
	movs	r3, #2
	b	.L438
.L414:
	movw	r2, #882
.L520:
	ldr	r1, .L521+48
	ldr	r0, .L521+64
.L518:
	bl	printk
	b	.L513
.L389:
	cbz	r2, .L417
	ldr	r3, [r2]
	cmp	r3, #2
	bhi	.L418
	ldr	r2, .L521+44
	str	r3, [r0, #424]
	ldr	r2, [r2]
	lsls	r1, r2, #30
	bpl	.L512
	mov	r2, #892
	ldr	r1, .L521+48
	ldr	r0, .L521+68
	b	.L519
.L418:
	movw	r2, #894
	ldr	r1, .L521+48
	ldr	r0, .L521+72
	b	.L516
.L417:
	movw	r2, #898
	b	.L520
.L426:
	bl	mpp_enc_ref_default
	str	r0, [sp]
.L427:
	ldr	r1, [sp]
	cmp	r1, #0
	beq	.L456
	ldr	r0, [sp, #4]
	bl	mpp_enc_ref_cfg_copy
	mov	r3, r0
	cbz	r0, .L429
	movw	r2, #678
	ldr	r1, .L521+76
	ldr	r0, .L521+80
	bl	printk
.L429:
	ldr	r1, [sp, #4]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_cfg
	mov	r6, r0
	cbz	r0, .L430
	mov	r3, r0
	movw	r2, #682
	ldr	r1, .L521+76
	ldr	r0, .L521+84
	bl	printk
.L430:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_update_hdr
	cbz	r0, .L431
	movs	r3, #0
	str	r3, [r4, #416]
.L431:
	ldr	r3, [r5]
	cbz	r3, .L428
	ldr	r3, [sp]
	cbz	r3, .L428
	mov	r0, sp
	bl	mpp_enc_ref_cfg_deinit
.L428:
	add	r3, r4, #5280
	add	r1, r5, #24
	adds	r3, r3, #20
	mov	r2, r5
.L432:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [r3], #4	@ unaligned
	bne	.L432
	b	.L409
.L522:
	.align	2
.L521:
	.word	3276815
	.word	3276813
	.word	3276814
	.word	.LC52
	.word	.LC53
	.word	3309569
	.word	3276817
	.word	3310595
	.word	.LC51
	.word	3276801
	.word	.LC54
	.word	mpp_enc_debug
	.word	.LANCHOR0+197
	.word	.LC55
	.word	.LC56
	.word	3276803
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LANCHOR0+214
	.word	.LC61
	.word	.LC62
.L425:
	ldr	r0, [sp]
	bl	mpi_enc_gen_ref_cfg
	b	.L427
.L424:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_smart_gop_ref_cfg
	b	.L427
.L422:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_hir_skip_ref
	b	.L427
.L421:
	mov	r1, #672
	ldr	r0, .L523
	bl	printk
	b	.L427
.L456:
	mov	r6, r1
	b	.L428
.L401:
	add	r6, r0, #4160
	adds	r6, r6, #12
	mov	r0, r6
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r5
	mov	r0, r6
	bl	memcpy
	mov	r0, r6
	bl	mpp_enc_proc_export_osd_buf
	b	.L512
.L402:
	movw	r3, #6654
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	cbnz	r3, .L433
	movw	r1, #621
	ldr	r0, .L523+4
	bl	printk
	b	.L513
.L433:
	ldr	r6, [r2]
	movw	r3, #6653
	ldrb	r8, [r0, r3]	@ zero_extendqisi2
	cmp	r6, #1024
	and	r8, r8, #3
	bls	.L434
	mov	r2, r6
	mov	r1, #628
	ldr	r0, .L523+8
	b	.L518
.L434:
	mov	r3, sp
	bic	r3, r3, #8160
	add	r9, r0, r8, lsl #10
	bic	r3, r3, #31
	add	r9, r9, #6656
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #8]
	add	r9, r9, #3
	.syntax unified
@ 157 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r1, r6; sbcscc r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r2, r6
	cbnz	r3, .L435
	mov	r0, r9
	bl	arm_copy_from_user
	mov	r2, r0
.L435:
	cmp	r2, #0
	beq	.L436
	subs	r0, r6, r2
	movs	r1, #0
	add	r0, r0, r9
	mvn	r6, #13
	bl	memset
	b	.L409
.L439:
	ldr	r2, .L523+12
	cmp	r7, r2
	bne	.L441
	ldr	r2, [r4, #608]
	tst	r2, #21
	bne	.L461
	ldr	r2, [r4, #704]
	tst	r2, #225
	bne	.L462
	cmp	r3, #7
	beq	.L443
	ldr	r2, .L523+16
	cmp	r3, r2
	beq	.L443
.L437:
	ldr	r3, .L523+20
	cmp	r7, r3
	beq	.L440
	ldr	r3, .L523+24
	cmp	r7, r3
	beq	.L440
.L441:
	ldr	r3, .L523+28
	cmp	r7, r3
	beq	.L440
	sub	r3, r3, #33280
	cmp	r7, r3
	bne	.L510
.L445:
	ldr	r3, [r4, #608]
	tst	r3, #5
	beq	.L508
.L440:
	movs	r3, #1
	str	r3, [r4, #452]
	ldr	r3, .L523+20
	cmp	r7, r3
	beq	.L447
	ldr	r3, .L523+12
	cmp	r7, r3
	beq	.L447
.L450:
	ldr	r3, .L523+24
	cmp	r8, r3
	bne	.L511
.L453:
	movs	r3, #0
	str	r3, [r4, #56]
.L388:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L443:
	ldr	r3, [r4, #1196]
	cmp	r3, #0
	beq	.L445
	movs	r3, #5
	b	.L438
.L459:
	movs	r3, #1
.L438:
	ldr	r2, .L523+32
	mov	r1, #270
	ldr	r0, .L523+36
	add	r3, r2, r3, lsl #2
	ldr	r2, [r3, #236]
	bl	printk
	ldr	r3, [r4, #464]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	movs	r3, #0
	str	r3, [r4, #416]
	b	.L437
.L461:
	movs	r3, #3
	b	.L438
.L462:
	movs	r3, #4
	b	.L438
.L508:
	ldr	r3, [r4, #704]
	bics	r3, r3, #2
	bne	.L440
	movw	r3, #5328
	ldr	r3, [r4, r3]
	lsls	r2, r3, #30
	bmi	.L440
.L451:
	ldr	r3, .L523+12
	cmp	r8, r3
	bne	.L450
	b	.L453
.L447:
	ldr	r3, [r4, #704]
	lsls	r3, r3, #24
	bpl	.L451
	ldr	r1, [r4, #752]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_rc_igop
	b	.L451
.L511:
	ldr	r3, .L523+28
	cmp	r7, r3
.L517:
	bne	.L388
	b	.L453
.L436:
	ldr	r0, [r5]
	add	r1, r4, r8
	movw	r3, #6655
	add	r8, r8, #1
	strb	r0, [r1, r3]
	movw	r3, #6653
	movw	r1, #6654
	strb	r8, [r4, r3]
	ldrb	r3, [r4, r1]	@ zero_extendqisi2
	subs	r3, r3, #1
	strb	r3, [r4, r1]
	b	.L512
.L510:
	ldr	r3, .L523+24
	cmp	r8, r3
	b	.L517
.L524:
	.align	2
.L523:
	.word	.LC60
	.word	.LC63
	.word	.LC64
	.word	3276801
	.word	16777220
	.word	3276805
	.word	3276803
	.word	3310081
	.word	.LANCHOR0
	.word	.LC65
	.fnend
	.size	mpp_enc_proc_cfg, .-mpp_enc_proc_cfg
	.align	1
	.global	mpp_enc_proc_rc_update
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_update, %function
mpp_enc_proc_rc_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 264
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r5, [r0, #452]
	.pad #308
	sub	sp, sp, #308
	cmp	r5, #0
	beq	.L525
	ldr	r6, .L586
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L527
	movw	r2, #1130
	ldr	r1, .L586+4
	ldr	r0, .L586+8
	bl	printk
.L527:
	mov	r2, #260
	movs	r1, #0
	add	r0, sp, #44
	bl	memset
	ldrd	r9, r8, [r4, #732]
	movw	r3, #5324
	ldr	r7, [r4, r3]
	cmp	r8, #0
	beq	.L559
	mov	r1, r8
	mov	r0, r9
	bl	__aeabi_idiv
	mov	r1, r0
	cbz	r0, .L560
.L528:
	ldr	r0, [r4, #752]
	bl	__aeabi_idiv
	lsls	r5, r0, #2
	cmp	r5, #8
	it	ge
	movge	r5, #8
.L529:
	ldr	r3, [r4, #612]
	str	r3, [sp, #44]
	ldr	r3, [r4, #616]
	str	r3, [sp, #48]
	ldr	r3, [r4, #708]
	cmp	r3, #4
	bhi	.L530
	tbh	[pc, r3, lsl #1]
.L532:
	.2byte	(.L535-.L532)/2
	.2byte	(.L534-.L532)/2
	.2byte	(.L533-.L532)/2
	.2byte	(.L530-.L532)/2
	.2byte	(.L531-.L532)/2
	.p2align 1
.L559:
	movs	r1, #1
	b	.L528
.L560:
	movs	r5, #8
	b	.L529
.L587:
	.align	2
.L586:
	.word	mpp_enc_debug
	.word	.LANCHOR0+260
	.word	.LC68
.L534:
	movs	r3, #1
.L583:
	str	r3, [sp, #52]
.L535:
	ldr	r3, [r4, #728]
	add	ip, sp, #276
	ldr	lr, [r4, #744]
	str	r8, [sp, #64]
	strd	r3, r9, [sp, #56]
	add	r9, r4, #904
	ldr	r3, [r4, #740]
	str	lr, [sp, #72]
	str	r3, [sp, #68]
	ldr	r3, [r4, #748]
	str	r3, [sp, #76]
	ldr	r3, [r4, #752]
	str	r3, [sp, #84]
	ldr	r3, [r4, #804]
	str	r3, [sp, #108]
	ldr	r3, [r4, #808]
	str	r3, [sp, #112]
	ldr	r3, [r4, #812]
	str	r3, [sp, #116]
	ldr	r3, [r4, #852]
	str	r3, [sp, #164]
	ldr	r3, [r4, #848]
	str	r3, [sp, #168]
	ldr	r3, [r4, #860]
	str	r3, [sp, #172]
	ldr	r3, [r4, #856]
	str	r3, [sp, #176]
	ldr	r3, [r4, #864]
	str	r3, [sp, #180]
	ldr	r3, [r4, #716]
	str	r3, [sp, #96]
	ldr	r3, [r4, #720]
	str	r3, [sp, #100]
	ldr	r3, [r4, #724]
	str	r3, [sp, #92]
	movw	r3, #5332
	ldr	r3, [r4, r3]
	str	r3, [sp, #296]
	movw	r3, #5336
	ldr	r3, [r4, r3]
	str	r3, [sp, #300]
	ldr	r3, [r4, #868]
	str	r3, [sp, #256]
	add	r3, r4, #888
	mov	r8, r3
.L536:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r9
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L536
	add	r3, r4, #872
	add	ip, sp, #260
.L537:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r8
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L537
	cmp	lr, #0
	bne	.L538
	mov	r1, #1048
	ldr	r3, .L588
	str	r1, [sp]
	ldr	r2, .L588+4
	ldr	r0, .L588+8
	bl	printk
.L538:
	ldr	r3, [r4, #764]
	cbz	r3, .L584
	cmp	r3, #60
	it	ge
	movge	r3, #60
	mov	r5, r3
.L584:
	cmp	r5, #1
	ldr	r3, [r4, #1192]
	it	lt
	movlt	r5, #1
	cmp	r3, #8
	str	r5, [sp, #104]
	beq	.L540
	bhi	.L541
	cmp	r3, #7
.L585:
	bne	.L543
.L542:
	ldr	r3, [r4, #816]
	ldr	r1, [r4, #820]
	ldr	r2, [r4, #828]
	str	r3, [sp, #136]
	ldr	r3, [r4, #824]
	str	r1, [sp, #140]
	cmp	r3, #0
	it	eq
	moveq	r3, r1
	str	r3, [sp, #148]
	ldr	r3, [r4, #832]
	str	r2, [sp, #144]
	cmp	r3, #0
	it	eq
	moveq	r3, r2
	str	r3, [sp, #152]
	ldr	r3, [r4, #840]
	str	r3, [sp, #156]
	ldr	r3, [r4, #844]
	str	r3, [sp, #160]
.L546:
	movs	r3, #0
	mov	r2, #256
	strd	r3, r3, [sp, #128]
	strd	r2, r3, [sp, #120]
	ldr	r3, [r4, #760]
	str	r3, [sp, #200]
	ldr	r3, [r4, #768]
	str	r3, [sp, #220]
	ldr	r3, [r4, #772]
	str	r3, [sp, #224]
	ldr	r3, [r4, #776]
	str	r3, [sp, #228]
	ldr	r3, [r4, #792]
	str	r3, [sp, #244]
	ldr	r3, [r4, #780]
	str	r3, [sp, #232]
	ldr	r3, [r4, #784]
	str	r3, [sp, #236]
	ldr	r3, [r4, #788]
	str	r3, [sp, #240]
	ldr	r3, [r4, #796]
	str	r3, [sp, #248]
	ldr	r3, [r4, #800]
	str	r3, [sp, #252]
	ldr	r5, [r7, #64]
	cbz	r5, .L548
	ldrd	r0, r1, [r4, #744]
	str	r5, [sp, #88]
	bl	__aeabi_idiv
	cmp	r5, r0
	blt	.L548
	ldr	r3, [sp, #84]
	cmp	r5, r3
	bge	.L548
	movs	r3, #1
	str	r3, [sp, #80]
	ldr	r3, [sp, #160]
	cbnz	r3, .L548
	movs	r3, #2
	str	r3, [sp, #160]
.L548:
	ldr	r3, [r4, #1192]
	ldr	r7, .L588+12
	cmp	r3, #7
	beq	.L550
	ldr	r2, .L588+16
	cmp	r3, r2
	bne	.L551
.L550:
	ldr	r2, .L588+20
	ldr	r3, .L588+24
	ldr	r0, [sp, #68]
	ldr	r1, [sp, #56]
	cmp	r1, #0
	ite	ne
	movne	r1, r3
	moveq	r1, r2
	cmp	r0, #0
	it	eq
	moveq	r3, r2
	ldr	r0, [sp, #88]
	ldr	r2, [sp, #52]
	str	r0, [sp, #36]
	ldr	r0, [sp, #84]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r0, [sp, #32]
	ldr	r0, [sp, #76]
	str	r0, [sp, #28]
	ldr	r0, [sp, #72]
	strd	r3, r0, [sp, #20]
	ldr	r3, [sp, #64]
	ldr	r0, .L588+28
	str	r3, [sp, #16]
	ldr	r3, [sp, #60]
	strd	r1, r3, [sp, #8]
	movw	r1, #1115
	ldr	r3, [r4, #720]
	str	r3, [sp, #4]
	ldr	r3, [r4, #716]
	str	r3, [sp]
	ldr	r3, [r4, #724]
	bl	printk
.L551:
	movw	r3, #5360
	ldr	r3, [r4, r3]
	cbnz	r3, .L554
	movw	r3, #5364
	ldr	r3, [r4, r3]
	cbz	r3, .L555
.L554:
	movs	r3, #1
	str	r3, [sp, #292]
.L555:
	add	r1, sp, #44
	ldr	r0, [r4, #60]
	bl	rc_update_usr_cfg
	movs	r3, #0
	str	r3, [r4, #704]
	str	r3, [r4, #608]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	mov	r5, r0
	bpl	.L556
	movw	r2, #1142
	ldr	r1, .L588+32
	ldr	r0, .L588+36
	bl	printk
.L556:
	movs	r3, #0
	str	r3, [r4, #452]
	ldr	r3, [r4, #440]
	mov	r0, r4
	ldr	r2, [sp, #80]
	ldr	r1, .L588+40
	str	r3, [r4, #444]
	movw	r3, #5340
	str	r2, [r4, r3]
	ldr	r3, [sp, #156]
	ldr	r2, [sp, #52]
	str	r3, [sp, #32]
	ldr	r3, [sp, #148]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r3, [sp, #28]
	ldr	r3, [sp, #152]
	str	r3, [sp, #24]
	ldr	r3, [sp, #140]
	str	r3, [sp, #20]
	ldr	r3, [sp, #144]
	str	r3, [sp, #16]
	ldr	r3, [sp, #136]
	str	r3, [sp, #12]
	ldr	r3, [sp, #84]
	str	r3, [sp, #8]
	ldr	r3, [sp, #100]
	str	r3, [sp, #4]
	ldr	r3, [sp, #92]
	str	r3, [sp]
	ldr	r3, [sp, #96]
	bl	update_rc_cfg_log.constprop.1
.L525:
	mov	r0, r5
	add	sp, sp, #308
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L530:
	movs	r3, #3
	b	.L583
.L533:
	movs	r3, #2
	b	.L583
.L531:
	movs	r3, #4
	b	.L583
.L541:
	cmp	r3, #9
	beq	.L542
	ldr	r2, .L588+16
	cmp	r3, r2
	b	.L585
.L540:
	ldr	r3, [r4, #1204]
	ldr	r2, [r4, #1208]
	str	r3, [sp, #136]
	ldr	r3, [r4, #1212]
	str	r2, [sp, #140]
	strd	r3, r2, [sp, #144]
	str	r3, [sp, #152]
	b	.L546
.L543:
	movw	r2, #1075
	ldr	r1, .L588+44
	ldr	r0, .L588+48
	bl	printk
	b	.L546
.L589:
	.align	2
.L588:
	.word	.LANCHOR0+283
	.word	.LC69
	.word	.LC70
	.word	.LANCHOR0
	.word	16777220
	.word	.LC67
	.word	.LC66
	.word	.LC72
	.word	.LANCHOR0+260
	.word	.LC73
	.word	.LC18
	.word	.LANCHOR0+294
	.word	.LC71
	.fnend
	.size	mpp_enc_proc_rc_update, .-mpp_enc_proc_rc_update
	.align	1
	.global	mpp_enc_alloc_output_from_bufpool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_bufpool, %function
mpp_enc_alloc_output_from_bufpool:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #56
	sub	sp, sp, #56
	mov	r5, r0
	bl	mpp_enc_check_frm_pkt
	mov	r6, r0
	cmp	r0, #0
	bne	.L590
	mov	r1, r0
	ldr	r0, [r5, #372]
	bl	mpp_packet_set_length
	ldr	r8, [r5, #396]
	ldr	r7, .L624
	cmp	r8, #0
	bne	.L592
	ldr	r4, [r5, #612]
	ldr	r8, [r5, #372]
	adds	r4, r4, #15
	bic	r3, r4, #15
	ldr	r4, [r5, #616]
	adds	r4, r4, #15
	bic	r4, r4, #15
	muls	r4, r3, r4
	ldr	r3, [r5]
	cmp	r3, #8
	mov	r3, #0
	str	r3, [sp, #20]
	itt	eq
	addeq	r4, r4, r4, lsl #1
	lsreq	r4, r4, #1
	bl	get_mpibuf_ops
	mov	r9, r0
	cbnz	r4, .L594
	movw	r1, #1229
	ldr	r3, .L624+4
	str	r1, [sp]
	ldr	r2, .L624+8
	ldr	r0, .L624+12
	bl	printk
.L594:
	cmp	r9, #0
	beq	.L596
	movw	r10, #5384
	ldr	r3, [r5, r10]
	cbnz	r3, .L597
	ldr	r3, [r9, #52]
	cbz	r3, .L597
	movs	r1, #2
	mov	r0, r4
	blx	r3
	str	r0, [r5, r10]
.L597:
	movw	r3, #5384
	ldr	r0, [r5, r3]
	cbz	r0, .L596
	ldr	r3, [r9, #60]
	cbz	r3, .L596
	blx	r3
	movs	r2, #32
	movs	r1, #0
	mov	r10, r0
	add	r0, sp, #24
	bl	memset
	cmp	r10, #0
	beq	.L596
	ldr	r3, .L624+4
	add	r2, sp, #20
	add	r1, sp, #24
	movs	r0, #0
	str	r10, [sp, #36]
	str	r3, [sp]
	ldr	r3, .L624+16
	str	r4, [sp, #28]
	bl	mpp_buffer_import_with_tag
	ldr	r3, [r9, #16]
	cbz	r3, .L596
	mov	r0, r10
	blx	r3
.L596:
	ldr	r0, [sp, #20]
	cbnz	r0, .L603
	ldr	r9, .L624+4
	mov	r2, r4
	ldr	r3, .L624+16
	add	r1, sp, #20
	str	r9, [sp]
	bl	mpp_buffer_get_with_tag
	ldr	r3, [sp, #20]
	cbnz	r3, .L603
	movw	r1, #1253
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L624+20
	ldr	r0, .L624+12
	bl	printk
.L603:
	ldr	r0, [sp, #20]
	add	r3, r8, #72
	ldr	r1, .L624+4
	movs	r4, #0
	str	r3, [r5, #396]
	str	r0, [r8, #72]
	bl	mpp_buffer_get_mpi_buf_id_with_caller
	ldr	r1, .L624+4
	str	r4, [r8, #84]
	str	r0, [r8, #76]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r1, .L624+4
	str	r0, [r8, #96]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L624+4
	strd	r0, r0, [r8, #24]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r2, [r7]
	lsls	r2, r2, #26
	ldr	r3, [sp, #20]
	strd	r0, r4, [r8, #32]
	str	r3, [r8, #68]
	bpl	.L590
	str	r3, [sp]
	movw	r2, #1267
	ldr	r3, [r5, #372]
	ldr	r1, .L624+24
	ldr	r0, .L624+28
	bl	printk
.L590:
	mov	r0, r6
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L592:
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L590
	ldr	r4, [r5, #372]
	mov	r0, r4
	bl	mpp_packet_get_pos
	mov	r7, r0
	ldr	r0, [r5, #372]
	bl	mpp_packet_get_length
	mov	r3, r4
	mov	r2, #1272
	ldr	r1, .L624+24
	strd	r7, r0, [sp, #4]
	str	r8, [sp]
	ldr	r0, .L624+32
	bl	printk
	b	.L590
.L625:
	.align	2
.L624:
	.word	mpp_enc_debug
	.word	.LANCHOR0+328
	.word	.LC74
	.word	.LC70
	.word	.LC44
	.word	.LC75
	.word	.LANCHOR0+362
	.word	.LC76
	.word	.LC77
	.fnend
	.size	mpp_enc_alloc_output_from_bufpool, .-mpp_enc_alloc_output_from_bufpool
	.align	1
	.global	mpp_enc_alloc_output_from_ringbuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_ringbuf, %function
mpp_enc_alloc_output_from_ringbuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	movs	r3, #0
	ldr	r5, [r0, #612]
	mov	r4, r0
	str	r3, [sp, #12]
	adds	r5, r5, #15
	bic	r3, r5, #15
	ldr	r5, [r0, #616]
	adds	r5, r5, #15
	bic	r5, r5, #15
	muls	r5, r3, r5
	ldr	r3, [r0]
	ldrd	r6, r0, [r0, #456]
	cmp	r3, #8
	it	ne
	lsrne	r5, r5, #1
	bl	mpp_enc_refs_next_frm_is_intra
	cmp	r0, #0
	bne	.L638
	ldr	r6, [r6, #4]
	cmp	r6, #1
	beq	.L628
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_next_frm_is_kpfrm
	adds	r6, r0, #0
	it	ne
	movne	r6, #1
.L628:
	movw	r3, #10756
	ldr	r3, [r4, r3]
	cbz	r3, .L630
	ldr	r3, [r3, #28]
	cbnz	r3, .L630
	bl	get_vsm_ops
	cbnz	r0, .L630
	movw	r3, #10760
	ldr	r2, [r4, r3]
	cbnz	r2, .L632
	str	r5, [r4, r3]
.L632:
	ldr	r2, [r4, r3]
	cmp	r2, #16384
	it	cc
	movcc	r2, #16384
	addw	r2, r2, #4095
	bic	r2, r2, #4080
	bic	r2, r2, #15
	str	r2, [r4, r3]
	movw	r3, #10788
	ldr	r3, [r4, r3]
	ldr	r0, [r3, #12]
	cbz	r0, .L633
	str	r0, [sp, #12]
.L634:
	movw	r3, #10764
	ldr	r1, [sp, #12]
	ldr	r2, [r4, r3]
	movw	r3, #10756
	ldr	r0, [r4, r3]
	bl	ring_buf_init
.L630:
	movw	r3, #10808
	movw	r1, #10756
	ldr	r3, [r4, r3]
	movs	r2, #0
	ldr	r1, [r4, r1]
	add	r0, r4, #372
	str	r3, [sp]
	mov	r3, r6
	bl	mpp_packet_new_ring_buf
	cbz	r0, .L636
	adds	r3, r0, #3
	ite	eq
	movweq	r2, #10768
	movwne	r2, #10772
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
	b	.L626
.L638:
	movs	r6, #1
	b	.L628
.L633:
	ldr	r3, .L644
	add	r1, sp, #12
	str	r3, [sp]
	ldr	r3, .L644+4
	bl	mpp_ring_buffer_get_with_tag
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L634
	movw	r1, #1311
	ldr	r0, .L644+8
	bl	printk
	mov	r0, #-1
.L626:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L636:
	ldr	r3, [r4, #372]
	mov	r0, r4
	adds	r3, r3, #72
	str	r3, [r4, #396]
	bl	mpp_enc_check_frm_pkt
	b	.L626
.L645:
	.align	2
.L644:
	.word	.LANCHOR0+396
	.word	.LC44
	.word	.LC78
	.fnend
	.size	mpp_enc_alloc_output_from_ringbuf, .-mpp_enc_alloc_output_from_ringbuf
	.align	1
	.global	mpp_enc_impl_alloc_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_alloc_task, %function
mpp_enc_impl_alloc_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r1, #124
	mov	r4, r0
	ldr	r0, .L649
	bl	mpp_osal_calloc
	str	r0, [r4, #456]
	cbz	r0, .L648
	bl	mpp_time
	strd	r0, [r4, #40]
	bl	mpp_time
	strd	r0, [r4, #24]
	bl	mpp_time
	strd	r0, [r4, #32]
	movs	r0, #0
.L646:
	pop	{r4, pc}
.L648:
	mov	r0, #-1
	b	.L646
.L650:
	.align	2
.L649:
	.word	.LANCHOR0+430
	.fnend
	.size	mpp_enc_impl_alloc_task, .-mpp_enc_impl_alloc_task
	.align	1
	.global	mpp_enc_impl_free_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_free_task, %function
mpp_enc_impl_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r1, [r0, #456]
	cbz	r1, .L652
	ldr	r0, .L656
	bl	mpp_osal_free
	movs	r3, #0
	str	r3, [r4, #456]
.L652:
	movs	r0, #0
	pop	{r4, pc}
.L657:
	.align	2
.L656:
	.word	.LANCHOR0+454
	.fnend
	.size	mpp_enc_impl_free_task, .-mpp_enc_impl_free_task
	.align	1
	.global	mpp_enc_impl_get_roi_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_get_roi_osd, %function
mpp_enc_impl_get_roi_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r3, [r0, #4036]
	mov	r6, r1
	cbz	r3, .L659
	addw	r1, r0, #4036
	add	r0, r0, #5376
	movs	r2, #136
	adds	r0, r0, #12
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, #4036]
.L659:
	movw	r7, #4172
	add	r8, r4, r7
	ldr	r3, [r4, r7]
	cbz	r3, .L660
	add	r5, r4, #5504
	adds	r5, r5, #20
	mov	r0, r5
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r8
	mov	r0, r5
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, r7]
.L660:
	cbz	r6, .L662
	movw	r3, #5388
	adds	r1, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L663
	mov	r0, r6
	bl	mpp_frame_add_roi
.L663:
	movw	r3, #5524
	adds	r1, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L662
	mov	r0, r6
	bl	mpp_frame_add_osd
.L662:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	mpp_enc_impl_get_roi_osd, .-mpp_enc_impl_get_roi_osd
	.align	1
	.global	mpp_enc_impl_reg_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_reg_cfg, %function
mpp_enc_impl_reg_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r0, #456]
	.pad #52
	sub	sp, sp, #52
	mov	r8, r1
	add	r7, r0, #64
	add	r5, r6, #20
	ldrb	r3, [r6, #11]	@ zero_extendqisi2
	ands	r3, r3, #1
	beq	.L678
	ldr	r6, .L855
	ldr	r8, [r0, #8]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L679
	movw	r2, #1583
	ldr	r1, .L855+4
	ldr	r0, .L855+8
	bl	printk
.L679:
	ldr	r3, [r4, #224]
	movs	r1, #0
	movs	r2, #104
	add	r0, r4, #224
	ldrd	fp, r10, [r4, #228]
	str	r3, [sp, #36]
	ldrd	r9, r3, [r4, #236]
	str	r3, [sp, #28]
	ldr	r3, [r4, #244]
	str	r3, [sp, #32]
	bl	memset
	strd	r10, r9, [r4, #232]
	ldr	r3, [sp, #36]
	strd	r3, fp, [r4, #224]
	ldr	r3, [sp, #28]
	str	r3, [r4, #240]
	ldr	r3, [sp, #32]
	str	r3, [r4, #244]
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L680
	ldrh	r3, [r4, #222]
	movw	r2, #1586
	ldr	r1, .L855+4
	ldr	r0, .L855+12
	bl	printk
.L680:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L681
	str	r0, [sp]
	movw	r3, #1587
	ldr	r0, .L855+16
	mov	r2, r4
	mov	r1, r3
.L854:
	bl	printk
	mov	r9, #0
	b	.L677
.L681:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L683
	ldrh	r3, [r4, #222]
	movw	r2, #1589
	ldr	r1, .L855+4
	ldr	r0, .L855+20
	bl	printk
.L683:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	cbz	r0, .L684
	movw	r3, #1590
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L855+24
	bl	printk
.L677:
	mov	r0, r9
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L684:
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L685
	ldrh	r3, [r4, #222]
	mov	r2, #1592
	ldr	r1, .L855+4
	ldr	r0, .L855+28
	bl	printk
.L685:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_start
	cbz	r0, .L686
	movw	r3, #1593
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L855+32
	b	.L854
.L686:
	ldr	r3, [r6]
	lsls	r7, r3, #26
	bpl	.L687
	ldrh	r3, [r4, #222]
	movw	r2, #1595
	ldr	r1, .L855+4
	ldr	r0, .L855+36
	bl	printk
.L687:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L688
	movw	r3, #1596
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L855+40
	b	.L854
.L688:
	ldr	r3, [r6]
	lsls	r5, r3, #26
	bpl	.L689
	ldrb	r3, [r4, #221]	@ zero_extendqisi2
	movw	r2, #1599
	ldr	r1, .L855+4
	ldr	r0, .L855+44
	str	r3, [sp, #4]
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L689:
	ldr	r3, [r6]
	lsls	r4, r3, #31
	bpl	.L677
	mov	r2, #1600
	ldr	r1, .L855+4
	ldr	r0, .L855+48
	bl	printk
	b	.L677
.L678:
	strd	r1, r3, [r0, #368]
	cbz	r1, .L744
	ldr	r3, [r0, #4028]
	cbnz	r3, .L691
	mov	r0, r1
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_ver_stride
	mov	fp, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_width
	mov	r9, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_height
	ldr	r2, [r4, #656]
	bic	r2, r2, #2
	cmp	r2, #1
	it	eq
	moveq	r2, r9
	mov	r3, r0
	it	eq
	moveq	r9, r0
	ldrd	r0, ip, [r4, #620]
	it	eq
	moveq	r3, r2
	ldrd	r2, r1, [r4, #612]
	cmp	r10, r0
	bne	.L693
	cmp	fp, ip
	bne	.L693
	cmp	r2, r9
	bhi	.L693
	cmp	r1, r3
	bls	.L691
.L693:
	strd	r2, r1, [sp, #8]
	mov	r2, r9
	strd	r0, ip, [sp, #16]
	mov	r1, #1752
	strd	r10, fp, [sp]
	ldr	r0, .L855+52
	bl	printk
.L744:
	mov	r9, #-1
.L690:
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_terminate_task
	b	.L677
.L691:
	mov	r0, r8
	bl	mpp_frame_get_idr_request
	cbz	r0, .L694
	ldr	r3, [r4, #464]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	movs	r3, #0
	str	r3, [r4, #416]
.L694:
	movs	r2, #100
	movs	r1, #0
	mov	r0, r5
	add	r10, r4, #464
	bl	memset
	mov	r2, #304
	movs	r1, #0
	mov	r0, r7
	bl	memset
	ldr	r3, [r6, #4]
	adds	r2, r3, #1
	str	r2, [r6, #4]
	strh	r3, [r4, #222]	@ movhi
	movs	r3, #0
	strd	r7, r10, [r6, #24]
	str	r3, [r6, #80]
	ldr	r3, [r4, #368]
	str	r3, [r4, #360]
	ldr	r3, .L855
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #32
	beq	.L695
	ldrh	r3, [r4, #222]
	movw	r2, #1798
	ldr	r1, .L855+56
	ldr	r0, .L855+60
	bl	printk
.L695:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_check_drop
	mov	r9, r0
	cbz	r0, .L696
	str	r0, [sp]
	movw	r3, #1799
	ldr	r0, .L855+64
	mov	r2, r4
	mov	r1, r3
.L852:
	bl	printk
	b	.L690
.L696:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #16
	strb	r3, [r6, #8]
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L697
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	movw	r2, #1801
	ldr	r1, .L855+56
	and	r3, r3, #1
	ldr	r0, .L855+68
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L697:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L698
	movs	r3, #0
	str	r3, [r6, #20]
	str	r3, [r6, #68]
	b	.L744
.L856:
	.align	2
.L855:
	.word	mpp_enc_debug
	.word	.LANCHOR0+477
	.word	.LC79
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC80
	.word	.LC81
	.word	.LC10
	.word	.LC11
	.word	.LC82
	.word	.LC83
	.word	.LC84
	.word	.LANCHOR0+498
	.word	.LC85
	.word	.LC86
	.word	.LC87
.L698:
	ldr	r3, [r4, #464]
	cbz	r3, .L699
	mov	r1, r10
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_usr_cfg
.L699:
	movs	r3, #1
	mov	r0, r4
	str	r3, [r6, #20]
	bl	mpp_enc_alloc_output_from_ringbuf
	mov	r9, r0
	cmp	r0, #0
	bne	.L690
	ldr	r3, [r4, #368]
	str	r3, [r6, #72]
	ldr	r3, [r4, #392]
	str	r3, [r6, #76]
	ldr	r3, [r4, #372]
	str	r3, [r6, #48]
	ldr	r3, [r4, #396]
	str	r3, [r6, #52]
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #32
	strb	r3, [r6, #8]
	ldr	r3, [r4, #396]
	str	r3, [r6, #52]
	ldr	r3, [r4, #372]
	cbnz	r3, .L700
	movw	r1, #1827
	ldr	r3, .L857
	str	r1, [sp]
	ldr	r2, .L857+4
	ldr	r0, .L857+8
	bl	printk
.L700:
	ldr	r1, [r4, #368]
	mov	r0, r4
	bl	mpp_enc_impl_get_roi_osd
	ldr	r3, [r4, #56]
	cbnz	r3, .L701
	movs	r3, #1
	str	r3, [r4, #56]
.L701:
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bmi	.L702
	ldr	r1, [r4, #404]
	ldr	r0, [r4, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #404]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #416]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	str	r0, [r4, #412]
	bpl	.L703
	str	r0, [sp]
	movw	r2, #1843
	ldrh	r3, [r4, #222]
	ldr	r1, .L857+12
	ldr	r0, .L857+16
	bl	printk
.L703:
	ldr	r1, [r4, #404]
	ldr	r0, [r4, #372]
	bl	mpp_packet_append
	ldr	r3, [r4, #412]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #412]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r4, #416]
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L705
	movw	r2, #1850
	ldr	r1, .L857+12
	ldr	r0, .L857+20
	bl	printk
.L702:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L705
	movw	r2, #1852
	ldr	r1, .L857+12
	ldr	r0, .L857+24
	bl	printk
.L705:
	ldr	r1, .L857+28
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L707
	ldrh	r3, [r4, #222]
	mov	r2, #1856
	ldr	r1, .L857+12
	ldr	r0, .L857+32
	bl	printk
.L707:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_start
	mov	r9, r0
	cbz	r0, .L708
	movw	r3, #1857
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L857+36
	b	.L852
.L708:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_stash
	ldrd	r10, r3, [r4, #4]
	ldr	fp, [r6, #48]
	str	r3, [sp, #32]
	movw	r3, #5368
	ldr	r3, [r4, r3]
	cbz	r3, .L709
	movw	r3, #10792
	ldr	r3, [r4, r3]
	str	r3, [r6, #84]
	movw	r3, #10796
	ldr	r3, [r4, r3]
	str	r3, [r6, #88]
	movw	r3, #10800
	ldr	r3, [r4, r3]
	str	r3, [r6, #92]
	movw	r3, #10804
	ldr	r3, [r4, r3]
	str	r3, [r6, #96]
.L709:
	movw	r3, #5360
	ldr	r3, [r4, r3]
	cbz	r3, .L710
.L713:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L712
	ldrh	r3, [r4, #222]
	movw	r2, #1442
	ldr	r1, .L857+40
	ldr	r0, .L857+44
	bl	printk
.L712:
	mov	r1, r7
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L715
	ldrh	r3, [r4, #78]
	movw	r2, #1446
	ldr	r1, .L857+40
	ldr	r0, .L857+48
	bl	printk
.L715:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_dpb
	mov	r9, r0
	cmp	r0, #0
	beq	.L716
	str	r0, [sp]
	movw	r3, #1447
	ldr	r0, .L857+52
	mov	r2, r4
	mov	r1, r3
.L853:
	bl	printk
	movw	r2, #10776
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
	b	.L714
.L710:
	ldr	r3, [r4, #796]
	cmp	r3, #0
	beq	.L713
	movw	r3, #5364
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L713
	ldr	r3, [r4, #464]
	cmp	r3, #0
	bne	.L713
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_proc_two_pass
	mov	r9, r0
	cmp	r0, #0
	beq	.L713
.L714:
	movw	r3, #1860
	str	r9, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L857+56
	b	.L852
.L858:
	.align	2
.L857:
	.word	.LANCHOR0+519
	.word	.LC88
	.word	.LC70
	.word	.LANCHOR0+498
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LANCHOR0+540
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC110
.L716:
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L743
	ldrh	r3, [r4, #78]
	movw	r2, #1449
	ldr	r1, .L859
	ldr	r0, .L859+4
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L743
	ldrh	r3, [r4, #78]
	movw	r2, #1451
	ldr	r1, .L859
	ldr	r0, .L859+8
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	ldr	r1, .L859
	ubfx	r2, r2, #5, #1
	ldr	r0, .L859+12
	str	r2, [sp]
	movw	r2, #1453
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #1
	ldr	r1, .L859
	ubfx	r2, r2, #4, #1
	ldr	r0, .L859+16
	str	r2, [sp]
	movw	r2, #1455
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #6, #1
	ldr	r1, .L859
	ubfx	r2, r2, #6, #1
	ldr	r0, .L859+20
	str	r2, [sp]
	movw	r2, #1457
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ldr	r1, .L859
	lsrs	r3, r3, #7
	ldr	r0, .L859+24
	lsrs	r2, r2, #7
	str	r2, [sp]
	movw	r2, #1459
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #217]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	and	r3, r3, #15
	ldr	r1, .L859
	and	r2, r2, #15
	ldr	r0, .L859+28
	str	r2, [sp]
	movw	r2, #1461
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L743
	ldrb	r3, [r4, #217]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	ldr	r1, .L859
	lsrs	r3, r3, #4
	ldr	r0, .L859+32
	lsrs	r2, r2, #4
	str	r2, [sp]
	movw	r2, #1463
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L743
	ldrh	r3, [r4, #78]
	movw	r2, #1465
	ldr	r1, .L859
	ldr	r0, .L859+36
	bl	printk
.L743:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L726
	ldrh	r3, [r4, #222]
	movw	r2, #1467
	ldr	r1, .L859
	ldr	r0, .L859+40
	bl	printk
.L726:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_start
	mov	r9, r0
	cbz	r0, .L727
	movw	r3, #1468
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L859+44
	b	.L853
.L727:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L728
	ldrh	r3, [r4, #222]
	movw	r2, #1469
	ldr	r1, .L859
	ldr	r0, .L859+48
	bl	printk
.L728:
	ldr	r3, [r4, #420]
	cmp	r3, #1
	bne	.L729
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L729
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	tst	r3, #14
	bne	.L729
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L730
	ldr	r3, [r4, #412]
	movw	r2, #1476
	ldr	r1, .L859
	ldr	r0, .L859+52
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L730:
	ldr	r1, [r4, #404]
	mov	r0, fp
	bl	mpp_packet_append
	ldr	r3, [r4, #412]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #412]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #416]
.L729:
	ldr	r1, .L859+56
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r3, r3, #26
	bpl	.L731
	ldr	r3, [r4, #424]
	cbz	r3, .L731
	ldr	r3, [r4, #432]
	add	r2, sp, #44
	mov	r1, fp
	mov	r0, r10
	mov	r9, #0
	str	r9, [sp, #44]
	str	r3, [sp, #4]
	ldr	r3, [r4, #428]
	str	r3, [sp]
	ldr	r3, .L859+60
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	mov	r0, r10
	ldr	r1, [sp, #44]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	mov	r1, fp
	str	r3, [r6, #68]
	add	r2, sp, #44
	ldr	r3, [r4, #444]
	str	r9, [sp, #44]
	str	r3, [sp, #4]
	ldr	r3, [r4, #436]
	str	r3, [sp]
	ldr	r3, .L859+64
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	ldr	r1, [sp, #44]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	str	r3, [r6, #68]
.L731:
	movw	r3, #6654
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #3
	bhi	.L735
	add	r9, r4, #6624
	adds	r3, r4, r3
	add	r9, r9, #28
	str	r3, [sp, #36]
.L732:
	ldrb	r3, [r9]	@ zero_extendqisi2
	mov	r1, fp
	and	r3, r3, #3
	str	r3, [sp, #28]
	movs	r3, #0
	str	r3, [sp, #44]
	ldr	r3, [sp, #28]
	adds	r2, r4, r3
	movw	r3, #6655
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	add	r2, sp, #44
	str	r3, [sp, #4]
	ldr	r3, [sp, #28]
	add	r3, r4, r3, lsl #10
	add	r3, r3, #6656
	adds	r3, r3, #3
	str	r3, [sp]
	ldr	r3, .L859+68
	ldr	r0, [r4, #4]
	bl	enc_impl_add_prefix
	ldr	r3, [r6, #68]
	ldr	r2, [r6, #60]
	ldr	r1, [sp, #44]
	add	r3, r3, r1
	str	r3, [r6, #68]
	ldr	r3, [sp, #36]
	add	r2, r2, r1
	str	r2, [r6, #60]
	ldr	r2, [sp, #36]
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r2]
	cmp	r3, #3
	ldr	r2, [sp, #28]
	add	r2, r2, #1
	strb	r2, [r9]
	bls	.L732
.L735:
	mov	r0, r5
	ldr	r1, .L859+72
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L734
	ldrh	r3, [r4, #222]
	movw	r2, #1510
	ldr	r1, .L859
	ldr	r0, .L859+76
	bl	printk
.L734:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L736
	movw	r3, #1511
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L859+80
	b	.L853
.L860:
	.align	2
.L859:
	.word	.LANCHOR0+540
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LC107
	.word	.LC108
	.word	.LANCHOR1
	.word	.LANCHOR1+16
	.word	.LANCHOR1+32
	.word	.LC109
	.word	.LC6
	.word	.LC7
.L736:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L737
	ldrh	r3, [r4, #222]
	movw	r2, #1513
	ldr	r1, .L861
	ldr	r0, .L861+4
	bl	printk
.L737:
	mov	r1, r5
	ldr	r0, [sp, #32]
	bl	mpp_enc_hal_get_task
	mov	r9, r0
	cbz	r0, .L738
	movw	r3, #1514
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L861+8
	b	.L853
.L738:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L739
	ldrh	r3, [r4, #222]
	movw	r2, #1516
	ldr	r1, .L861
	ldr	r0, .L861+12
	bl	printk
.L739:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_start
	mov	r9, r0
	cbz	r0, .L740
	movw	r3, #1517
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L861+16
	b	.L853
.L740:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L741
	ldrh	r3, [r4, #222]
	movw	r2, #1519
	ldr	r1, .L861
	ldr	r0, .L861+20
	bl	printk
.L741:
	mov	r1, r5
	ldr	r0, [sp, #32]
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L742
	mov	r3, #1520
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L861+24
	b	.L853
.L742:
	str	r0, [r4, #464]
	b	.L677
.L862:
	.align	2
.L861:
	.word	.LANCHOR0+540
	.word	.LC8
	.word	.LC9
	.word	.LC80
	.word	.LC81
	.word	.LC10
	.word	.LC11
	.fnend
	.size	mpp_enc_impl_reg_cfg, .-mpp_enc_impl_reg_cfg
	.align	1
	.global	mpp_enc_impl_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_hw_start, %function
mpp_enc_impl_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r7, [r0, #456]
	.pad #20
	sub	sp, sp, #20
	ldr	r8, [r0, #8]
	mov	r5, r1
	add	r9, r7, #20
	cbz	r1, .L871
	ldr	r6, [r1, #456]
	adds	r6, r6, #20
.L864:
	ldr	r3, .L884
	ldr	r3, [r3]
	lsls	r3, r3, #26
	bpl	.L865
	ldrh	r3, [r4, #222]
	mov	r2, #1888
	ldr	r1, .L884+4
	ldr	r0, .L884+8
	bl	printk
.L865:
	mov	r2, r6
	mov	r1, r9
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r6, r0
	cbz	r0, .L866
	movw	r3, #1889
	str	r0, [sp]
	mov	r1, r3
	mov	r2, r4
	ldr	r0, .L884+12
	bl	printk
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_terminate_task
	cbz	r5, .L867
	ldr	r1, [r5, #456]
	mov	r0, r5
	bl	mpp_enc_terminate_task
.L867:
	movw	r2, #10776
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
.L863:
	mov	r0, r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L871:
	mov	r6, r1
	b	.L864
.L866:
	bl	get_mpidev_ops
	mov	r5, r0
	cmp	r0, #0
	beq	.L863
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L863
	ldr	r0, [r7, #72]
	bl	mpp_frame_get_dts
	movw	r3, #5360
	ldr	r3, [r4, r3]
	strd	r0, [sp, #8]
	cmp	r3, #0
	beq	.L863
	movw	r0, #10808
	ldr	r3, [r5, #32]
	add	r2, sp, #8
	mov	r1, r6
	ldr	r0, [r4, r0]
	blx	r3
	b	.L863
.L885:
	.align	2
.L884:
	.word	mpp_enc_debug
	.word	.LANCHOR0+559
	.word	.LC12
	.word	.LC13
	.fnend
	.size	mpp_enc_impl_hw_start, .-mpp_enc_impl_hw_start
	.align	1
	.global	mpp_enc_impl_int
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_int, %function
mpp_enc_impl_int:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	fp, [r0, #456]
	mov	r4, r0
	strd	r3, r2, [sp, #32]
	mov	r9, r1
	ldr	r5, [r0, #8]
	add	r8, fp, #20
	cmp	r1, #0
	beq	.L931
	ldr	r7, [r1, #456]
.L887:
	ldr	r3, .L1032
	ldr	r2, [r3]
	mov	r10, r3
	tst	r2, #32
	beq	.L888
	ldrh	r3, [r4, #222]
	movw	r2, #2002
	ldr	r1, .L1032+4
	ldr	r0, .L1032+8
	bl	printk
.L888:
	mov	r0, r5
	mov	r1, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbnz	r0, .L889
	ldr	r3, [r4, #8]
	str	r3, [sp, #16]
	cbz	r7, .L890
	adds	r7, r7, #20
.L890:
	ldr	r3, [r10]
	lsls	r5, r3, #26
	bpl	.L891
	ldrh	r3, [r4, #222]
	movw	r2, #1540
	ldr	r1, .L1032+12
	ldr	r0, .L1032+16
	bl	printk
.L891:
	add	r6, r4, #64
	ldr	r0, [r4, #60]
	mov	r1, r6
	bl	rc_hal_end
	mov	r5, r0
	cmp	r0, #0
	beq	.L892
	str	r0, [sp]
	movw	r3, #1541
	ldr	r0, .L1032+20
	mov	r2, r4
	mov	r1, r3
.L1028:
	bl	printk
.L889:
	ldr	r3, [r4, #52]
	movs	r1, #0
	ldr	r0, [r4, #372]
	adds	r3, r3, #1
	str	r3, [r4, #52]
	ldr	r3, [r4, #464]
	str	r1, [r4, #416]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	bl	mpp_packet_set_length
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L923:
	ldr	r3, [r4, #372]
	ldr	r2, [sp, #36]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #372]
	ldr	r3, [r10]
	lsls	r2, r3, #26
	bpl	.L925
	ldrd	r2, [r4, #384]
	ldr	r1, .L1032+4
	ldr	r0, .L1032+24
	strd	r2, [sp]
	movw	r2, #2082
	ldrh	r3, [r4, #222]
	bl	printk
.L925:
	bl	get_mpidev_ops
	mov	r8, r0
	cbz	r0, .L926
	ldr	r3, [r0, #24]
	cbz	r3, .L926
	ldr	r0, [fp, #72]
	bl	mpp_frame_get_dts
	mov	r6, r0
	ldr	r0, [fp, #72]
	mov	r7, r1
	bl	mpp_frame_get_pts
	ldr	r3, [r4, #1192]
	mov	r2, r6
	cmp	r3, #8
	itet	ne
	ldrbne	r3, [r4, #216]	@ zero_extendqisi2
	moveq	r3, #1
	ubfxne	r3, r3, #4, #1
	strd	r0, [sp]
	movw	r0, #10808
	str	r3, [sp, #8]
	mov	r3, r7
	ldr	r1, [r8, #24]
	ldr	r0, [r4, r0]
	blx	r1
.L926:
	ldr	r3, [r4, #368]
	cbz	r3, .L928
	add	r0, r4, #368
	bl	mpp_frame_deinit
.L928:
	movw	r3, #5360
	ldr	r3, [r4, r3]
	cbnz	r3, .L929
	ldr	r3, [r4, #796]
	cbz	r3, .L929
	movw	r3, #5364
	ldr	r3, [r4, r3]
	cbnz	r3, .L929
	movs	r2, #104
	add	r1, r4, #224
	add	r0, r4, #496
	bl	memcpy
.L929:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [fp, #8]
	b	.L1031
.L931:
	mov	r7, r1
	b	.L887
.L892:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L893
	ldrh	r3, [r4, #222]
	movw	r2, #1543
	ldr	r1, .L1032+12
	ldr	r0, .L1032+28
	bl	printk
.L893:
	mov	r2, r7
	mov	r1, r8
	ldr	r0, [sp, #16]
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cmp	r0, #0
	bne	.L889
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L894
	ldrh	r3, [r4, #222]
	movw	r2, #1548
	ldr	r1, .L1032+12
	ldr	r0, .L1032+32
	bl	printk
.L894:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_check_reenc
	mov	r5, r0
	cmp	r0, #0
	beq	.L895
	movw	r3, #1549
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1032+36
	b	.L1028
.L930:
	ldrb	r2, [r4, #221]	@ zero_extendqisi2
	ldr	r3, [r4, #760]
	cmp	r2, r3
	bcs	.L896
	ldrd	r1, r2, [fp, #64]
	ldr	r3, [r10]
	subs	r2, r2, r1
	strd	r5, r2, [fp, #64]
	ldrb	r2, [fp, #11]	@ zero_extendqisi2
	and	r3, r3, #32
	orr	r2, r2, #1
	strb	r2, [fp, #11]
	movw	r2, #5360
	ldr	r2, [r4, r2]
	cbnz	r2, .L897
	movw	r2, #5364
	ldr	r2, [r4, r2]
	cbz	r2, .L898
.L897:
	cbz	r3, .L932
	movw	r2, #2017
	ldr	r1, .L1032+4
	ldr	r0, .L1032+40
	bl	printk
.L932:
	mov	r5, #-1
	b	.L889
.L1033:
	.align	2
.L1032:
	.word	mpp_enc_debug
	.word	.LANCHOR0+581
	.word	.LC14
	.word	.LANCHOR0+598
	.word	.LC111
	.word	.LC20
	.word	.LC24
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
.L898:
	cbz	r3, .L899
	ldrb	r3, [r4, #221]	@ zero_extendqisi2
	movw	r2, #2023
	ldr	r1, .L1034
	ldr	r0, .L1034+4
	str	r3, [sp, #4]
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L899:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L900
	ldr	r3, [r10]
	lsls	r3, r3, #31
	bpl	.L901
	movw	r2, #1615
	ldr	r1, .L1034+8
	ldr	r0, .L1034+12
	bl	printk
.L901:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_rollback
	ldr	r3, [fp, #68]
	str	r3, [r4, #248]
	ldr	r3, [r4, #236]
	str	r3, [r4, #252]
	ldr	r3, [r10]
	lsls	r7, r3, #26
	bpl	.L902
	ldrh	r3, [r4, #222]
	movw	r2, #1621
	ldr	r1, .L1034+8
	ldr	r0, .L1034+16
	bl	printk
.L902:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	cmp	r0, #0
	beq	.L903
	movw	r3, #1622
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1034+20
	bl	printk
.L904:
	ldr	r3, [r10]
	lsls	r0, r3, #31
	bpl	.L905
	movw	r2, #1626
	ldr	r1, .L1034+8
	ldr	r0, .L1034+24
	bl	printk
.L905:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [fp, #11]
.L900:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L906
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	tst	r3, #160
	bne	.L906
	add	r3, r4, #464
	str	r3, [sp, #16]
	ldr	r3, [r10]
	ldr	r7, [r4, #4]
	lsls	r2, r3, #31
	bpl	.L907
	movw	r2, #1641
	ldr	r1, .L1034+28
	ldr	r0, .L1034+12
	bl	printk
.L907:
	ldr	r3, [r4, #472]
	ldr	r0, [r4, #460]
	adds	r3, r3, #1
	str	r3, [r4, #472]
	ldr	r3, [r4, #464]
	orr	r3, r3, #2
	str	r3, [r4, #464]
	bl	mpp_enc_refs_rollback
	ldr	r0, [r4, #460]
	ldr	r1, [sp, #16]
	bl	mpp_enc_refs_set_usr_cfg
	ldr	r3, [r10]
	lsls	r3, r3, #26
	bpl	.L908
	ldrh	r3, [r4, #222]
	movw	r2, #1651
	ldr	r1, .L1034+28
	ldr	r0, .L1034+32
	bl	printk
.L908:
	mov	r1, r6
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r10]
	lsls	r0, r3, #15
	bpl	.L909
	ldrh	r3, [r4, #78]
	movw	r2, #1655
	ldr	r1, .L1034+28
	ldr	r0, .L1034+36
	bl	printk
.L909:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_proc_dpb
	cbz	r0, .L910
	str	r0, [sp]
	mov	r3, #1656
	ldr	r0, .L1034+40
	mov	r2, r4
	mov	r1, r3
.L1027:
	bl	printk
.L911:
	ldr	r3, [r10]
	lsls	r3, r3, #31
	bpl	.L916
	movw	r2, #1666
	ldr	r1, .L1034+28
	ldr	r0, .L1034+24
	bl	printk
.L916:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [fp, #11]
.L906:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	lsls	r7, r3, #31
	bpl	.L896
.L1031:
	cmp	r9, #0
	beq	.L886
	ldr	r1, [sp, #32]
	mov	r0, r9
	bl	mpp_enc_comb_end_jpeg
.L886:
	mov	r0, r5
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L903:
	ldr	r2, [r4, #364]
	movw	r3, #10804
	str	r2, [r4, r3]
	b	.L904
.L910:
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L912
	ldrh	r3, [r4, #222]
	movw	r2, #1658
	ldr	r1, .L1034+28
	ldr	r0, .L1034+44
	bl	printk
.L912:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_sw_enc
	cbz	r0, .L913
	movw	r3, #1659
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1034+48
	b	.L1027
.L913:
	ldr	r3, [r10]
	lsls	r2, r3, #26
	bpl	.L914
	ldrh	r3, [r4, #222]
	movw	r2, #1661
	ldr	r1, .L1034+28
	ldr	r0, .L1034+16
	bl	printk
.L914:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	cbz	r0, .L915
	movw	r3, #1662
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1034+20
	b	.L1027
.L915:
	ldr	r2, [r4, #364]
	movw	r3, #10804
	str	r2, [r4, r3]
	b	.L911
.L919:
	ldr	r2, [r4, #364]
	movw	r3, #10804
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #12]
	mov	r6, r0
	ldr	r0, [r4, #48]
	mov	r7, r1
	strd	r6, [r4, #32]
	add	ip, r0, #1
	str	ip, [r4, #48]
	cbz	r3, .L920
	ldrd	r2, [r4, #24]
	strd	r2, [sp, #16]
	orrs	r3, r2, r3
	beq	.L920
	orrs	r3, r6, r7
	beq	.L920
	ldr	r3, [sp, #16]
	ldr	r0, .L1034+52
	subs	r1, r6, r3
	ldr	r3, [sp, #20]
	str	r1, [sp, #24]
	sbc	r1, r7, r3
	str	r1, [sp, #28]
	ldrd	r2, [sp, #24]
	movs	r1, #0
	cmp	r0, r2
	sbcs	r3, r1, r3
	bge	.L920
	ldr	r3, [sp, #16]
	add	r8, r4, #5344
	ldr	r0, .L1034+56
	subs	r2, r6, r3
	smull	r0, r1, r2, r0
	asrs	r2, r2, #31
	movw	r0, #10000
	mul	r0, r0, ip
	rsb	r1, r2, r1, asr #6
	bl	__aeabi_idiv
	str	r0, [r8]
	strd	r6, [r4, #24]
	str	r5, [r4, #48]
.L920:
	ldrh	r3, [r4, #220]
	ldr	r0, [r4, #372]
	and	r3, r3, #251
	strh	r3, [r4, #220]	@ movhi
	ldr	r1, [fp, #68]
	bl	mpp_packet_set_length
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L922
	movs	r1, #16
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L922:
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_eos
	cbz	r0, .L924
	movs	r1, #1
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L924:
	ldrb	r1, [r4, #217]	@ zero_extendqisi2
	ldr	r0, [r4, #372]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10808
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	mov	r5, r0
	cmp	r0, #0
	beq	.L923
	movw	r2, #2072
	ldr	r1, .L1034
	ldr	r0, .L1034+60
	movs	r5, #0
	bl	printk
	b	.L923
.L1035:
	.align	2
.L1034:
	.word	.LANCHOR0+581
	.word	.LC82
	.word	.LANCHOR0+610
	.word	.LC79
	.word	.LC116
	.word	.LC22
	.word	.LC83
	.word	.LANCHOR0+629
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC117
	.word	.LC118
	.word	999999
	.word	274877907
	.word	.LC23
.L895:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r3, r3, #29
	bmi	.L930
.L896:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L918
	ldrh	r3, [r4, #222]
	mov	r2, #2040
	ldr	r1, .L1036
	ldr	r0, .L1036+4
	bl	printk
.L918:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	mov	r5, r0
	cmp	r0, #0
	beq	.L919
	movw	r3, #2041
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1036+8
	b	.L1028
.L1037:
	.align	2
.L1036:
	.word	.LANCHOR0+581
	.word	.LC21
	.word	.LC22
	.fnend
	.size	mpp_enc_impl_int, .-mpp_enc_impl_int
	.align	1
	.global	mpp_enc_impl_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_pkt_full_inc, %function
mpp_enc_impl_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r2, #10784
	ldr	r3, [r0, r2]
	adds	r3, r3, #1
	str	r3, [r0, r2]
	bx	lr
	.fnend
	.size	mpp_enc_impl_pkt_full_inc, .-mpp_enc_impl_pkt_full_inc
	.align	1
	.global	mpp_enc_impl_poc_debug_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_poc_debug_info, %function
mpp_enc_impl_poc_debug_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r7, [r1, #456]
	.pad #76
	sub	sp, sp, #76
	ldr	r1, .L1053
	mov	r5, r0
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L1053+4
	mov	r0, r5
	ldr	r2, .L1053+8
	ldr	r1, .L1053+12
	str	r3, [sp, #36]
	ldr	r3, .L1053+16
	str	r3, [sp, #32]
	ldr	r3, .L1053+20
	str	r3, [sp, #28]
	ldr	r3, .L1053+24
	str	r3, [sp, #24]
	ldr	r3, .L1053+28
	str	r3, [sp, #20]
	ldr	r3, .L1053+32
	str	r3, [sp, #16]
	ldr	r3, .L1053+36
	str	r3, [sp, #12]
	ldr	r3, .L1053+40
	str	r3, [sp, #8]
	ldr	r3, .L1053+44
	str	r3, [sp, #4]
	ldr	r3, .L1053+48
	str	r3, [sp]
	ldr	r3, .L1053+52
	bl	seq_printf
	ldr	r0, [r4, #1192]
	ldrd	r8, r9, [r4, #612]
	bl	strof_coding_type
	movw	r3, #5340
	ldr	r7, [r7, #4]
	mov	r10, r0
	ldr	r0, [r4, r3]
	bl	strof_gop_mode
	movw	r3, #5364
	ldr	r3, [r4, r3]
	mov	r2, r6
	ldr	r1, .L1053+56
	str	r3, [sp, #36]
	movw	r3, #5360
	ldr	r3, [r4, r3]
	str	r7, [sp, #12]
	ldr	r7, .L1053+60
	str	r3, [sp, #32]
	ldr	r3, [r4, #632]
	strd	r10, r7, [sp, #4]
	str	r9, [sp]
	str	r3, [sp, #28]
	ldr	r3, [r4, #628]
	str	r3, [sp, #24]
	movs	r3, #0
	strd	r0, r3, [sp, #16]
	mov	r3, r8
	mov	r0, r5
	bl	seq_printf
	ldrd	r0, r1, [r4, #732]
	bl	__aeabi_idiv
	mov	r8, r0
	ldrd	r0, r1, [r4, #744]
	bl	__aeabi_idiv
	ldr	r1, .L1053+64
	mov	r9, r0
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1053+68
	ldr	r1, .L1053+72
	mov	r0, r5
	ldr	r2, .L1053+8
	str	r3, [sp, #24]
	ldr	r3, .L1053+76
	str	r3, [sp, #20]
	ldr	r3, .L1053+80
	str	r3, [sp, #16]
	ldr	r3, .L1053+84
	str	r3, [sp, #12]
	ldr	r3, .L1053+88
	str	r3, [sp, #8]
	ldr	r3, .L1053+92
	str	r3, [sp, #4]
	ldr	r3, .L1053+96
	str	r3, [sp]
	ldr	r3, .L1053+100
	bl	seq_printf
	ldr	r2, [r4, #40]
	ldr	r0, [r4, #636]
	str	r2, [sp, #68]
	bl	strof_pixel_fmt
	add	r3, r4, #5344
	ldr	r3, [r3]
	mov	fp, r0
	ldr	r0, [r4, #656]
	str	r3, [sp, #64]
	bl	strof_rotation
	mov	r10, r0
	ldr	r0, [r4, #660]
	bl	strof_bool
	ldr	r1, .L1053+104
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #68]
	strd	r10, r0, [sp, #20]
	mov	r0, r5
	strd	fp, r3, [sp, #12]
	mov	r3, r7
	strd	r9, r2, [sp, #4]
	mov	r2, r6
	str	r8, [sp]
	movw	r8, #10756
	bl	seq_printf
	ldr	r3, [r4, r8]
	cmp	r3, #0
	beq	.L1040
	ldr	r1, .L1053+108
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1053+112
	ldr	r2, .L1053+8
	mov	r0, r5
	ldr	r1, .L1053+116
	str	r3, [sp, #20]
	ldr	r3, .L1053+120
	str	r3, [sp, #16]
	ldr	r3, .L1053+124
	str	r3, [sp, #12]
	ldr	r3, .L1053+128
	str	r3, [sp, #8]
	ldr	r3, .L1053+132
	str	r3, [sp, #4]
	ldr	r3, .L1053+136
	str	r3, [sp]
	ldr	r3, .L1053+140
	bl	seq_printf
	ldr	r2, [r4, r8]
	ldr	r1, .L1053+144
	mov	r0, r5
	ldr	r3, [r2, #36]
	str	r3, [sp, #20]
	ldr	r3, [r2, #40]
	str	r3, [sp, #16]
	ldr	r3, [r2, #32]
	str	r3, [sp, #12]
	ldr	r3, [r2, #8]
	str	r3, [sp, #8]
	ldr	r3, [r2, #12]
	str	r3, [sp, #4]
	ldr	r3, [r2]
	str	r3, [sp]
	ldr	r3, [r2, #4]
	mov	r2, r6
	bl	seq_printf
.L1040:
	ldr	r1, .L1053+148
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1053+152
	ldr	r2, .L1053+8
	mov	r0, r5
	ldr	r1, .L1053+156
	str	r3, [sp, #20]
	ldr	r3, .L1053+160
	str	r3, [sp, #16]
	ldr	r3, .L1053+164
	str	r3, [sp, #12]
	ldr	r3, .L1053+168
	str	r3, [sp, #8]
	ldr	r3, .L1053+172
	str	r3, [sp, #4]
	ldr	r3, .L1053+176
	str	r3, [sp]
	ldr	r3, .L1053+180
	bl	seq_printf
	movw	r2, #10784
	ldr	r2, [r4, r2]
	movw	r3, #5352
	ldr	r3, [r4, r3]
	mov	r0, r5
	ldr	r1, .L1053+184
	str	r2, [sp, #20]
	movw	r2, #10780
	ldr	r2, [r4, r2]
	str	r2, [sp, #16]
	movw	r2, #10776
	ldr	r2, [r4, r2]
	str	r2, [sp, #12]
	movw	r2, #10772
	ldr	r2, [r4, r2]
	str	r2, [sp, #8]
	movw	r2, #10768
	ldr	r2, [r4, r2]
	str	r2, [sp, #4]
	movw	r2, #5356
	ldr	r2, [r4, r2]
	str	r2, [sp]
	mov	r2, r6
	bl	seq_printf
	ldr	r3, [r4, #1192]
	cmp	r3, #7
	beq	.L1041
	ldr	r2, .L1053+188
	cmp	r3, r2
	bne	.L1042
.L1041:
	ldr	r1, .L1053+192
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1053+196
	ldr	r2, .L1053+8
	mov	r0, r5
	ldr	r1, .L1053+200
	str	r3, [sp, #20]
	ldr	r3, .L1053+204
	str	r3, [sp, #16]
	ldr	r3, .L1053+208
	str	r3, [sp, #12]
	ldr	r3, .L1053+212
	str	r3, [sp, #8]
	ldr	r3, .L1053+216
	str	r3, [sp, #4]
	ldr	r3, .L1053+220
	str	r3, [sp]
	ldr	r3, .L1053+224
	bl	seq_printf
	ldr	r3, [r4, #932]
	mov	r2, r6
	ldr	r1, .L1053+228
	mov	r0, r5
	str	r3, [sp, #20]
	ldr	r3, [r4, #928]
	str	r3, [sp, #16]
	ldr	r3, [r4, #920]
	str	r3, [sp, #12]
	ldr	r3, [r4, #916]
	str	r3, [sp, #8]
	ldr	r3, [r4, #924]
	str	r3, [sp, #4]
	ldr	r3, [r4, #908]
	str	r3, [sp]
	ldr	r3, [r4, #912]
	bl	seq_printf
	ldr	r3, .L1053+232
	ldr	r2, .L1053+8
	mov	r0, r5
	ldr	r1, .L1053+236
	bl	seq_printf
	ldr	r3, [r4, #996]
	mov	r2, r6
	ldr	r1, .L1053+240
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #992]
	str	r3, [sp, #52]
	ldr	r3, [r4, #988]
	str	r3, [sp, #48]
	ldr	r3, [r4, #984]
	str	r3, [sp, #44]
	ldr	r3, [r4, #980]
	str	r3, [sp, #40]
	ldr	r3, [r4, #976]
	str	r3, [sp, #36]
	ldr	r3, [r4, #972]
	str	r3, [sp, #32]
	ldr	r3, [r4, #968]
	str	r3, [sp, #28]
	ldr	r3, [r4, #964]
	str	r3, [sp, #24]
	ldr	r3, [r4, #960]
	str	r3, [sp, #20]
	ldr	r3, [r4, #956]
	str	r3, [sp, #16]
	ldr	r3, [r4, #952]
	str	r3, [sp, #12]
	b	.L1054
.L1055:
	.align	2
.L1053:
	.word	.LC119
	.word	.LC123
	.word	.LC121
	.word	.LC122
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC120
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC138
	.word	.LC137
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC136
	.word	.LC145
	.word	.LC146
	.word	.LC149
	.word	.LC148
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC147
	.word	.LC155
	.word	.LC156
	.word	.LC159
	.word	.LC158
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC157
	.word	.LC165
	.word	16777220
	.word	.LC166
	.word	.LC169
	.word	.LC168
	.word	.LC170
	.word	.LC171
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC167
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
.L1054:
	ldr	r3, [r4, #948]
	str	r3, [sp, #8]
	ldr	r3, [r4, #944]
	str	r3, [sp, #4]
	ldr	r3, [r4, #940]
	str	r3, [sp]
	ldr	r3, [r4, #936]
	bl	seq_printf
	ldr	r3, .L1056
	ldr	r2, .L1056+4
	mov	r0, r5
	ldr	r1, .L1056+8
	bl	seq_printf
	ldr	r3, [r4, #1060]
	mov	r2, r6
	ldr	r1, .L1056+12
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1056]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1052]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1048]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1044]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1040]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1036]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1032]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1028]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1024]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1020]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1016]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1012]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1008]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1004]
	str	r3, [sp]
	ldr	r3, [r4, #1000]
	bl	seq_printf
	ldr	r3, .L1056+16
	ldr	r2, .L1056+4
	mov	r0, r5
	ldr	r1, .L1056+8
	bl	seq_printf
	ldr	r3, [r4, #1124]
	mov	r2, r6
	ldr	r1, .L1056+20
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1120]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1116]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1112]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1108]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1104]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1100]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1096]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1092]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1088]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1084]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1080]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1076]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1072]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1068]
	str	r3, [sp]
	ldr	r3, [r4, #1064]
	bl	seq_printf
	ldr	r3, .L1056+24
	ldr	r2, .L1056+4
	mov	r0, r5
	ldr	r1, .L1056+8
	bl	seq_printf
	ldr	r3, [r4, #1188]
	mov	r2, r6
	ldr	r1, .L1056+20
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1184]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1180]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1176]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1172]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1168]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1164]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1160]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1156]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1152]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1148]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1144]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1140]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1136]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1132]
	str	r3, [sp]
	ldr	r3, [r4, #1128]
	bl	seq_printf
.L1042:
	ldr	r3, [r4, #4040]
	cbnz	r3, .L1043
.L1046:
	mov	r1, r6
	mov	r0, r5
	bl	mpp_show_session_info
	mov	r2, r6
	ldr	r1, [r4, #4]
	mov	r0, r5
	bl	enc_impl_proc_debug
	mov	r2, r6
	ldr	r1, [r4, #60]
	mov	r0, r5
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	rc_proc_show
.L1043:
	ldr	r1, .L1056+28
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1056+32
	ldr	r2, .L1056+4
	mov	r0, r5
	ldr	r1, .L1056+36
	mov	r8, #0
	ldr	r9, .L1056+64
	str	r3, [sp, #24]
	ldr	r3, .L1056+40
	str	r3, [sp, #20]
	ldr	r3, .L1056+44
	str	r3, [sp, #16]
	ldr	r3, .L1056+48
	str	r3, [sp, #12]
	ldr	r3, .L1056+52
	strd	r7, r3, [sp, #4]
	addw	r7, r4, #4044
	ldr	r3, .L1056+56
	str	r3, [sp]
	ldr	r3, .L1056+60
	bl	seq_printf
.L1044:
	ldr	r3, [r4, #4040]
	adds	r7, r7, #16
	cmp	r3, r8
	bls	.L1046
	ldrb	r3, [r7, #-1]	@ zero_extendqisi2
	mov	r2, r6
	mov	r1, r9
	mov	r0, r5
	str	r3, [sp, #24]
	ldrh	r3, [r7, #-8]
	str	r3, [sp, #20]
	ldrsh	r3, [r7, #-6]
	str	r3, [sp, #16]
	ldrh	r3, [r7, #-10]
	str	r3, [sp, #12]
	ldrh	r3, [r7, #-12]
	str	r3, [sp, #8]
	ldrh	r3, [r7, #-14]
	str	r3, [sp, #4]
	ldrh	r3, [r7, #-16]
	str	r3, [sp]
	mov	r3, r8
	bl	seq_printf
	add	r8, r8, #1
	b	.L1044
.L1057:
	.align	2
.L1056:
	.word	.LC179
	.word	.LC121
	.word	.LC177
	.word	.LC178
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC186
	.word	.LC185
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	.word	.LC184
	.word	.LC192
	.fnend
	.size	mpp_enc_impl_poc_debug_info, .-mpp_enc_impl_poc_debug_info
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37130, %object
	.size	__func__.37130, 23
__func__.37130:
	.ascii	"check_hal_task_pkt_len\000"
	.type	__func__.37389, %object
	.size	__func__.37389, 22
__func__.37389:
	.ascii	"mpp_enc_proc_two_pass\000"
	.type	__func__.37273, %object
	.size	__func__.37273, 18
__func__.37273:
	.ascii	"update_rc_cfg_log\000"
	.type	__func__.37548, %object
	.size	__func__.37548, 22
__func__.37548:
	.ascii	"mpp_enc_comb_end_jpeg\000"
	.type	__func__.37172, %object
	.size	__func__.37172, 20
__func__.37172:
	.ascii	"mpp_enc_proc_rc_cfg\000"
	.type	__func__.37180, %object
	.size	__func__.37180, 20
__func__.37180:
	.ascii	"mpp_enc_proc_hw_cfg\000"
	.type	__FUNCTION__.37209, %object
	.size	__FUNCTION__.37209, 22
__FUNCTION__.37209:
	.ascii	"mpp_enc_unref_osd_buf\000"
	.type	__func__.37221, %object
	.size	__func__.37221, 28
__func__.37221:
	.ascii	"mpp_enc_proc_export_osd_buf\000"
	.type	__func__.37233, %object
	.size	__func__.37233, 22
__func__.37233:
	.ascii	"mpp_enc_proc_tune_cfg\000"
	.type	__func__.37254, %object
	.size	__func__.37254, 17
__func__.37254:
	.ascii	"mpp_enc_proc_cfg\000"
	.type	__func__.37203, %object
	.size	__func__.37203, 21
__func__.37203:
	.ascii	"mpp_enc_proc_ref_cfg\000"
	.space	1
	.type	resend_reason.37146, %object
	.size	resend_reason.37146, 24
resend_reason.37146:
	.word	.LC193
	.word	.LC194
	.word	.LC195
	.word	.LC196
	.word	.LC197
	.word	.LC198
	.type	__func__.37321, %object
	.size	__func__.37321, 23
__func__.37321:
	.ascii	"mpp_enc_proc_rc_update\000"
	.type	__FUNCTION__.37302, %object
	.size	__FUNCTION__.37302, 11
__FUNCTION__.37302:
	.ascii	"set_rc_cfg\000"
	.type	__func__.37312, %object
	.size	__func__.37312, 11
__func__.37312:
	.ascii	"set_rc_cfg\000"
	.space	3
	.type	name_of_rc_mode, %object
	.size	name_of_rc_mode, 20
name_of_rc_mode:
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.type	__FUNCTION__.37343, %object
	.size	__FUNCTION__.37343, 34
__FUNCTION__.37343:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__func__.37350, %object
	.size	__func__.37350, 34
__func__.37350:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__FUNCTION__.37366, %object
	.size	__FUNCTION__.37366, 34
__FUNCTION__.37366:
	.ascii	"mpp_enc_alloc_output_from_ringbuf\000"
	.type	__FUNCTION__.37476, %object
	.size	__FUNCTION__.37476, 24
__FUNCTION__.37476:
	.ascii	"mpp_enc_impl_alloc_task\000"
	.type	__FUNCTION__.37480, %object
	.size	__FUNCTION__.37480, 23
__FUNCTION__.37480:
	.ascii	"mpp_enc_impl_free_task\000"
	.type	__func__.37443, %object
	.size	__func__.37443, 21
__func__.37443:
	.ascii	"mpp_enc_reenc_simple\000"
	.type	__func__.37509, %object
	.size	__func__.37509, 21
__func__.37509:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__FUNCTION__.37510, %object
	.size	__FUNCTION__.37510, 21
__FUNCTION__.37510:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__func__.37408, %object
	.size	__func__.37408, 19
__func__.37408:
	.ascii	"mpp_enc_normal_cfg\000"
	.type	__func__.37529, %object
	.size	__func__.37529, 22
__func__.37529:
	.ascii	"mpp_enc_impl_hw_start\000"
	.type	__func__.37567, %object
	.size	__func__.37567, 17
__func__.37567:
	.ascii	"mpp_enc_impl_int\000"
	.type	__func__.37422, %object
	.size	__func__.37422, 12
__func__.37422:
	.ascii	"mpp_enc_end\000"
	.type	__func__.37454, %object
	.size	__func__.37454, 19
__func__.37454:
	.ascii	"mpp_enc_reenc_drop\000"
	.type	__func__.37467, %object
	.size	__func__.37467, 26
__func__.37467:
	.ascii	"mpp_enc_reenc_force_pskip\000"
	.data
	.set	.LANCHOR1,. + 0
	.type	uuid_version, %object
	.size	uuid_version, 16
uuid_version:
	.byte	61
	.byte	7
	.byte	109
	.byte	69
	.byte	115
	.byte	15
	.byte	65
	.byte	-88
	.byte	-79
	.byte	-60
	.byte	37
	.byte	-41
	.byte	-105
	.byte	107
	.byte	-15
	.byte	-84
	.type	uuid_rc_cfg, %object
	.size	uuid_rc_cfg, 16
uuid_rc_cfg:
	.byte	-41
	.byte	-36
	.byte	3
	.byte	-61
	.byte	-59
	.byte	111
	.byte	64
	.byte	-32
	.byte	-114
	.byte	-87
	.byte	23
	.byte	26
	.byte	-46
	.byte	-17
	.byte	94
	.byte	35
	.type	uuid_usr_data, %object
	.size	uuid_usr_data, 16
uuid_usr_data:
	.byte	-2
	.byte	57
	.byte	-84
	.byte	76
	.byte	74
	.byte	-114
	.byte	75
	.byte	75
	.byte	-123
	.byte	-39
	.byte	-78
	.byte	-94
	.byte	79
	.byte	-95
	.byte	25
	.byte	91
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: %s check failed: task length is not mat"
	.ascii	"ch to packet length %d vs %d\012\000"
.LC1:
	.ascii	"\0013%d: frame stride set equal cfg stride\000"
.LC2:
	.ascii	"\0016%s:%d: task %d two pass mode enter\012\000"
.LC3:
	.ascii	"\0016%s:%d: task %d enc proc dpb\012\000"
.LC4:
	.ascii	"\0016%s:%d: frm %d start **************************"
	.ascii	"*********\012\000"
.LC5:
	.ascii	"\0013%d: enc %p enc_impl_proc_dpb:%-4d failed retur"
	.ascii	"n %d\000"
.LC6:
	.ascii	"\0016%s:%d: task %d enc proc hal\012\000"
.LC7:
	.ascii	"\0013%d: enc %p enc_impl_proc_hal:%-4d failed retur"
	.ascii	"n %d\000"
.LC8:
	.ascii	"\0016%s:%d: task %d hal get task\012\000"
.LC9:
	.ascii	"\0013%d: enc %p mpp_enc_hal_get_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC10:
	.ascii	"\0016%s:%d: task %d hal generate reg\012\000"
.LC11:
	.ascii	"\0013%d: enc %p mpp_enc_hal_gen_regs:%-4d failed re"
	.ascii	"turn %d\000"
.LC12:
	.ascii	"\0016%s:%d: task %d hal start\012\000"
.LC13:
	.ascii	"\0013%d: enc %p mpp_enc_hal_start:%-4d failed retur"
	.ascii	"n %d\000"
.LC14:
	.ascii	"\0016%s:%d: task %d hal wait\012\000"
.LC15:
	.ascii	"\0013%d: enc %p mpp_enc_hal_wait:%-4d failed return"
	.ascii	" %d\000"
.LC16:
	.ascii	"\0013%d: enc %p mpp_enc_hal_ret_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC17:
	.ascii	"\0016%s:%d: task %d two pass mode leave\012\000"
.LC18:
	.ascii	"%s-b:%d[%d:%d]-g:%d-q:%d:[%d:%d]:[%d:%d]:%d\012\000"
.LC19:
	.ascii	"\0016%s:%d: rc cfg log is full\012\000"
.LC20:
	.ascii	"\0013%d: enc %p rc_hal_end:%-4d failed return %d\000"
.LC21:
	.ascii	"\0016%s:%d: task %d rc enc->frame end\012\000"
.LC22:
	.ascii	"\0013%d: enc %p rc_frm_end:%-4d failed return %d\000"
.LC23:
	.ascii	"\0013%s:%d: ring_buf_put_used fail \012\000"
.LC24:
	.ascii	"\0016%s:%d: task %d enqueue packet pts %lld\012\000"
.LC25:
	.ascii	"\0013%d: invalid rc_priority %d should be[%d, %d] \012"
	.ascii	"\000"
.LC26:
	.ascii	"\0013%d: invalid super_mode %d should be[%d, %d] \012"
	.ascii	"\000"
.LC27:
	.ascii	"\0013%d: invalid debre_strength should be[%d, %d] \012"
	.ascii	"\000"
.LC28:
	.ascii	"\0013%d: invalid rc mode %d should be RC_MODE_VBR o"
	.ascii	"r RC_MODE_CBR\012\000"
.LC29:
	.ascii	"\0013%d: invalid quality %d should be from QUALITY_"
	.ascii	"WORST to QUALITY_BEST\012\000"
.LC30:
	.ascii	"\0013%d: invalid bit per second %d [%d:%d] out of r"
	.ascii	"ange 1K~100M\012\000"
.LC31:
	.ascii	"\0013%d: invalid qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC32:
	.ascii	"\0013%d: restore qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC33:
	.ascii	"\0013%d: invalid qp delta ip %d restore to %d\012\000"
.LC34:
	.ascii	"\0013%d: invalid qp delta vi %d restore to %d\012\000"
.LC35:
	.ascii	"\0013%d: invalid qp max step %d restore to %d\012\000"
.LC36:
	.ascii	"\0013%d: warning: bitrate statistic time %d is larg"
	.ascii	"er than 60s\012\000"
.LC37:
	.ascii	"\0013%s:%d: failed to accept new rc config\012\000"
.LC38:
	.ascii	"\0016%d: MPP_ENC_SET_RC_CFG bps %d [%d : %d] fps [%"
	.ascii	"d:%d] gop %d\012\000"
.LC39:
	.ascii	"\0013%d: invalid hw qp delta row [%d:%d]\012\000"
.LC40:
	.ascii	"\0013%d: invalid hw qbias_en [%d]\012\000"
.LC41:
	.ascii	"\0013%d: invalid hw qp bias [%d:%d]\012\000"
.LC42:
	.ascii	"\0013%d: invalid filter strength [%d:%d]\012\000"
.LC43:
	.ascii	"\0013%s:%d: failed to accept new hw config\012\000"
.LC44:
	.ascii	"mpp_enc\000"
.LC45:
	.ascii	"\0013%s:%d: mpibuf_ops get fail\000"
.LC46:
	.ascii	"\0013%d: osd buf dma_buf_get fd %d failed\012\000"
.LC47:
	.ascii	"\0013%d: osd inv buf dma_buf_get fd %d failed\012\000"
.LC48:
	.ascii	"\0013%d: invalid scene mode %d not in range [%d:%d]"
	.ascii	"\012\000"
.LC49:
	.ascii	"\0013%d: invalid motion static switch enable not in"
	.ascii	" range [%d : %d]\012\000"
.LC50:
	.ascii	"\0013%s:%d: failed to accept new tuning config\012\000"
.LC51:
	.ascii	"\0016%d: MPP_ENC_SET_CFG in \012\000"
.LC52:
	.ascii	"\0013%d: Please use MPP_ENC_GET_HDR_SYNC instead of"
	.ascii	" unsafe MPP_ENC_GET_EXTRA_INFO\012\000"
.LC53:
	.ascii	"\0013%d: NOTE: MPP_ENC_GET_HDR_SYNC needs MppPacket"
	.ascii	" input\012\000"
.LC54:
	.ascii	"\0016%d: deprecated MPP_ENC_PRE_ALLOC_BUFF control\012"
	.ascii	"\000"
.LC55:
	.ascii	"\0016%s:%d: header mode set to %d\012\000"
.LC56:
	.ascii	"\0013%s:%d: invalid header mode %d\012\000"
.LC57:
	.ascii	"\0013%s:%d: invalid NULL ptr on setting header mode"
	.ascii	"\012\000"
.LC58:
	.ascii	"\0016%s:%d: sei mode set to %d\012\000"
.LC59:
	.ascii	"\0013%s:%d: invalid sei mode %d\012\000"
.LC60:
	.ascii	"\0013%d: ref param_error\000"
.LC61:
	.ascii	"\0013%s:%d: failed to copy ref cfg ret %d\012\000"
.LC62:
	.ascii	"\0013%s:%d: failed to set ref cfg ret %d\012\000"
.LC63:
	.ascii	"\0013%d: user data is overflow\000"
.LC64:
	.ascii	"\0013%d: usr data is big then 1k byte len %d\000"
.LC65:
	.ascii	"\0016%d: send header for %s\012\000"
.LC66:
	.ascii	"flex\000"
.LC67:
	.ascii	"fix\000"
.LC68:
	.ascii	"\0016%s:%d: rc update cfg start\012\000"
.LC69:
	.ascii	"rc->fps_out_num\000"
.LC70:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC71:
	.ascii	"\0013%s:%d: unsupport coding type %d\012\000"
.LC72:
	.ascii	"\0016%d: mode %s bps [%d:%d:%d] fps %s [%d/%d] -> %"
	.ascii	"s [%d/%d] gop i [%d] v [%d]\012\000"
.LC73:
	.ascii	"\0016%s:%d: rc update cfg done\012\000"
.LC74:
	.ascii	"size\000"
.LC75:
	.ascii	"buffer\000"
.LC76:
	.ascii	"\0016%s:%d: create output pkt %p buf %p\012\000"
.LC77:
	.ascii	"\0016%s:%d: output to pkt %p buf %p pos %p length %"
	.ascii	"d\012\000"
.LC78:
	.ascii	"\0013%d: ring buf get mpp_buf fail \012\000"
.LC79:
	.ascii	"\0016%s:%d: enter\012\000"
.LC80:
	.ascii	"\0016%s:%d: task %d rc hal start\012\000"
.LC81:
	.ascii	"\0013%d: enc %p rc_hal_start:%-4d failed return %d\000"
.LC82:
	.ascii	"\0016%s:%d: task %d reenc %d times %d\012\000"
.LC83:
	.ascii	"\0016%s:%d: leave\012\000"
.LC84:
	.ascii	"\0016%d: frame info no equal set drop: frame [%d, %"
	.ascii	"d, %d, %d], prep [%d, %d, %d, %d]\000"
.LC85:
	.ascii	"\0016%s:%d: task seq idx %d start\012\000"
.LC86:
	.ascii	"\0013%d: enc %p rc_frm_check_drop:%-4d failed retur"
	.ascii	"n %d\000"
.LC87:
	.ascii	"\0016%s:%d: task %d drop %d\012\000"
.LC88:
	.ascii	"enc->packet\000"
.LC89:
	.ascii	"\0016%s:%d: task %d update header length %d\012\000"
.LC90:
	.ascii	"\0016%s:%d: added_by_change \012\000"
.LC91:
	.ascii	"\0016%s:%d: check_hal_task_pkt_len \012\000"
.LC92:
	.ascii	"gen_hdr and adding\000"
.LC93:
	.ascii	"\0016%s:%d: task %d enc start\012\000"
.LC94:
	.ascii	"\0013%d: enc %p enc_impl_start:%-4d failed return %"
	.ascii	"d\000"
.LC95:
	.ascii	"\0016%s:%d: frm %d compare\012\000"
.LC96:
	.ascii	"\0016%s:%d: seq_idx      %d vs %d\012\000"
.LC97:
	.ascii	"\0016%s:%d: is_idr       %d vs %d\012\000"
.LC98:
	.ascii	"\0016%s:%d: is_intra     %d vs %d\012\000"
.LC99:
	.ascii	"\0016%s:%d: is_non_ref   %d vs %d\012\000"
.LC100:
	.ascii	"\0016%s:%d: is_lt_ref    %d vs %d\012\000"
.LC101:
	.ascii	"\0016%s:%d: lt_idx       %d vs %d\012\000"
.LC102:
	.ascii	"\0016%s:%d: temporal_id  %d vs %d\012\000"
.LC103:
	.ascii	"\0016%s:%d: frm %d done  **************************"
	.ascii	"*********\012\000"
.LC104:
	.ascii	"\0016%s:%d: task %d rc frame start\012\000"
.LC105:
	.ascii	"\0013%d: enc %p rc_frm_start:%-4d failed return %d\000"
.LC106:
	.ascii	"\0016%s:%d: task %d rc frame start ok \012\000"
.LC107:
	.ascii	"\0016%s:%d: task %d IDR header length %d\012\000"
.LC108:
	.ascii	"header adding\000"
.LC109:
	.ascii	"user data adding\000"
.LC110:
	.ascii	"\0013%d: enc %p mpp_enc_normal_cfg:%-4d failed retu"
	.ascii	"rn %d\000"
.LC111:
	.ascii	"\0016%s:%d: task %d rc hal end\012\000"
.LC112:
	.ascii	"\0016%s:%d: task %d hal ret task\012\000"
.LC113:
	.ascii	"\0016%s:%d: task %d rc frame check reenc\012\000"
.LC114:
	.ascii	"\0013%d: enc %p rc_frm_check_reenc:%-4d failed retu"
	.ascii	"rn %d\000"
.LC115:
	.ascii	"\0016%s:%d: shared status can't reenc drop request "
	.ascii	"idr\012\000"
.LC116:
	.ascii	"\0016%s:%d: task %d rc frame end\012\000"
.LC117:
	.ascii	"\0016%s:%d: task %d enc sw enc start\012\000"
.LC118:
	.ascii	"\0013%d: enc %p enc_impl_sw_enc:%-4d failed return "
	.ascii	"%d\000"
.LC119:
	.ascii	"\012--------venc chn attr 1------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC120:
	.ascii	"Width\000"
.LC121:
	.ascii	"ID\000"
.LC122:
	.ascii	"%8s|%8s|%8s|%6s|%9s|%10s|%10s|%6s|%10s|%11s|%8s|%10"
	.ascii	"s\012\000"
.LC123:
	.ascii	"RefShare\000"
.LC124:
	.ascii	"Online\000"
.LC125:
	.ascii	"MaxHeight\000"
.LC126:
	.ascii	"MaxWidth\000"
.LC127:
	.ascii	"Prio\000"
.LC128:
	.ascii	"GopMode\000"
.LC129:
	.ascii	"Sequence\000"
.LC130:
	.ascii	"ByFrame\000"
.LC131:
	.ascii	"Type\000"
.LC132:
	.ascii	"Height\000"
.LC133:
	.ascii	"%8d|%8u|%8u|%6s|%9s|%10u|%10s|%6d|%10d|%11d|%8d|%10"
	.ascii	"d\012\000"
.LC134:
	.ascii	"y\000"
.LC135:
	.ascii	"\012--------venc chn attr 2------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC136:
	.ascii	"VeStr\000"
.LC137:
	.ascii	"%8s|%8s|%8s|%8s|%12s|%12s|%12s|%12s|%10s\012\000"
.LC138:
	.ascii	"mirror\000"
.LC139:
	.ascii	"rotation\000"
.LC140:
	.ascii	"RealFps*10\000"
.LC141:
	.ascii	"PixFmt\000"
.LC142:
	.ascii	"Timeref\000"
.LC143:
	.ascii	"TarFr\000"
.LC144:
	.ascii	"SrcFr\000"
.LC145:
	.ascii	"%8d|%8s|%8d|%8d|%12x|%12s|%12u|%12s|%10s\012\000"
.LC146:
	.ascii	"\012--------ring buf status------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC147:
	.ascii	"w_pos\000"
.LC148:
	.ascii	"%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s\012\000"
.LC149:
	.ascii	"l_r_pos\000"
.LC150:
	.ascii	"l_w_pos\000"
.LC151:
	.ascii	"min_size\000"
.LC152:
	.ascii	"total_len\000"
.LC153:
	.ascii	"usd_len\000"
.LC154:
	.ascii	"r_pos\000"
.LC155:
	.ascii	"%8d|%8d|%8d|%8d|%10d|%10d|%10d|%10d\012\000"
.LC156:
	.ascii	"\012--------hw status------------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC157:
	.ascii	"hw_run\000"
.LC158:
	.ascii	"%8s|%8s|%12s|%14s|%14s|%14s|%16s|%14s\012\000"
.LC159:
	.ascii	"pkt_full_cnt\000"
.LC160:
	.ascii	"start_fail_cnt\000"
.LC161:
	.ascii	"cfg_fail_cnt\000"
.LC162:
	.ascii	"ring_fail_cnt\000"
.LC163:
	.ascii	"pkt_fail_cnt\000"
.LC164:
	.ascii	"enc_status\000"
.LC165:
	.ascii	"%8d|%8d|%12d|%14u|%14u|%14u|%16u|%14u\012\000"
.LC166:
	.ascii	"\012--------hw param-------------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC167:
	.ascii	"qp_dlt_row_i\000"
.LC168:
	.ascii	"%8s|%14s|%12s|%12s|%12s|%12s|%12s|%12s|\012\000"
.LC169:
	.ascii	"flt_str_p\000"
.LC170:
	.ascii	"flt_str_i\000"
.LC171:
	.ascii	"qbias_p\000"
.LC172:
	.ascii	"qbias_i\000"
.LC173:
	.ascii	"qbias_en\000"
.LC174:
	.ascii	"qp_dlt_row\000"
.LC175:
	.ascii	"%8u|%14d|%12d|%12d|%12d|%12d|%12d|%12d\012\000"
.LC176:
	.ascii	"thrd_i[0] ~ thrd_i[15]\000"
.LC177:
	.ascii	"%8s|%24s\012\000"
.LC178:
	.ascii	"%8u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u"
	.ascii	"|%4u|%4u|%4u|%4u\012\000"
.LC179:
	.ascii	"thrd_p[0] ~ thrd_p[15]\000"
.LC180:
	.ascii	"step_i[0] ~ step_i[15]\000"
.LC181:
	.ascii	"%8u|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d"
	.ascii	"|%4d|%4d|%4d|%4d\012\000"
.LC182:
	.ascii	"step_p[0] ~ step_p[15]\000"
.LC183:
	.ascii	"\012--------venc roi attr -------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC184:
	.ascii	"roi\000"
.LC185:
	.ascii	"%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s\012\000"
.LC186:
	.ascii	"abs_qp\000"
.LC187:
	.ascii	"intra\000"
.LC188:
	.ascii	"quality\000"
.LC189:
	.ascii	"h\000"
.LC190:
	.ascii	"w\000"
.LC191:
	.ascii	"x\000"
.LC192:
	.ascii	"%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d\012\000"
.LC193:
	.ascii	"unchanged\000"
.LC194:
	.ascii	"codec/prep cfg change\000"
.LC195:
	.ascii	"rc cfg change rc_mode/fps/gop\000"
.LC196:
	.ascii	"set cfg change input/format \000"
.LC197:
	.ascii	"set cfg change rc_mode/fps/gop\000"
.LC198:
	.ascii	"set cfg change codec\000"
.LC199:
	.ascii	"vbr\000"
.LC200:
	.ascii	"cbr\000"
.LC201:
	.ascii	"fixqp\000"
.LC202:
	.ascii	"avbr\000"
.LC203:
	.ascii	"smtrc\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
