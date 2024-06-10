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
	.file	"rockit_isp.c"
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
	.type	rockit_rkisp_ioctl, %function
rockit_rkisp_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_ioctl, .-rockit_rkisp_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_open, %function
rockit_rkisp_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_open, .-rockit_rkisp_open
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rk_cam_num_setup, %function
rk_cam_num_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, r2
	bl	simple_strtoul
	ldr	r3, .L4
	str	r0, [r3]
	movs	r0, #1
	pop	{r3, pc}
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.fnend
	.size	rk_cam_num_setup, .-rk_cam_num_setup
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_buf_que, %function
rockit_rkisp_buf_que:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r1
	.pad #20
	sub	sp, sp, #20
	mov	r6, r0
	cmp	r0, #0
	beq	.L7
	ldr	r4, [r0, #288]
	cmp	r4, #0
	beq	.L18
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L7
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	fp, .L25+8
	movs	r5, #0
.L8:
	movs	r1, #0
	mov	r0, r6
	bl	mpi_node_request_buf
	mov	r7, r0
	cmp	r0, #0
	beq	.L14
	ldr	r3, [r7]
	movs	r1, #5
	ldr	r2, .L25
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r6]
	str	r3, [sp, #8]
	ldr	r3, [r6, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movs	r3, #245
	str	r3, [sp]
	ldr	r3, .L25+4
	bl	vlog
	adds	r1, r4, #4
	movs	r3, #0
.L12:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L9
	ldr	r0, [r2]
	ldr	r2, [r7]
	cmp	r0, r2
	bne	.L24
.L10:
	add	r10, r4, r3, lsl #3
	movs	r2, #1
	strb	r2, [r10, #8]
	ldr	r1, [r6, #56]
	strb	r2, [r4, #48]
	strd	r6, r7, [r4, #80]
	str	r1, [r4, #72]
	ldr	r2, [r7]
	str	r2, [r4, #64]
	ldr	r2, [r7, #448]
	str	r2, [r4, #100]
	ldr	r2, [r6, #44]
	ldr	r2, [r2, #44]
	str	r2, [r4, #52]
	ldr	r2, [fp]
	cbnz	r2, .L13
.L15:
	adds	r5, r5, #1
	cmp	r5, r8
	bne	.L8
.L14:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r5, #0
	it	ne
	movne	r0, #1
.L7:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	add	r2, r4, r3, lsl #3
	str	r7, [r2, #4]
	b	.L10
.L24:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L12
	b	.L10
.L13:
	add	r0, r4, #48
	blx	r2
	cmp	r0, #0
	bge	.L15
	movs	r2, #0
	mov	r0, r7
	strb	r2, [r10, #8]
	strb	r2, [r4, #1]
	bl	mpi_obj_unref
	ldr	r3, [r4, #100]
	cmp	r3, #0
	beq	.L15
	b	.L14
.L18:
	mov	r0, r4
	b	.L7
.L26:
	.align	2
.L25:
	.word	.LC0
	.word	.LANCHOR1
	.word	.LANCHOR2
	.fnend
	.size	rockit_rkisp_buf_que, .-rockit_rkisp_buf_que
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_destroy_ctx, %function
isp_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	kfree
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	isp_destroy_ctx, .-isp_destroy_ctx
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_handle_message, %function
rockit_rkisp_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L29
	cbnz	r0, .L30
	mov	r3, #292
	ldr	r2, .L54
	str	r3, [sp]
	ldr	r3, .L54+4
.L52:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L29:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L30:
	ldr	r4, [r0, #288]
	cbz	r4, .L31
	cmp	r1, #5
	beq	.L32
	cmp	r1, #6
	beq	.L33
	cmp	r1, #0
	bne	.L29
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L29
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L29
	mov	r1, r3
	bl	rockit_rkisp_buf_que
	b	.L29
.L31:
	movw	r3, #301
	ldr	r2, .L54+8
	str	r3, [sp]
	ldr	r3, .L54+4
	b	.L52
.L32:
	strb	r3, [r4]
	ldr	r4, .L54+12
.L35:
	movs	r1, #5
	mov	r0, r5
	bl	rockit_rkisp_buf_que
	cbnz	r0, .L36
	movs	r0, #100
	bl	msleep
	ldr	r1, [r5, #56]
	mov	r0, r4
	bl	printk
	b	.L35
.L36:
	ldr	r0, .L54+16
.L53:
	bl	printk
	b	.L29
.L33:
	mov	r0, r4
	movs	r5, #0
	strb	r5, [r0], #48
	add	r6, r4, #40
	bl	rkisp_rockit_free_stream_buf
.L38:
	ldr	r0, [r4, #4]
	cbz	r0, .L37
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cbz	r3, .L37
	bl	mpi_obj_unref
	str	r5, [r4, #4]
.L37:
	adds	r4, r4, #8
	cmp	r4, r6
	bne	.L38
	ldr	r0, .L54+20
	b	.L53
.L55:
	.align	2
.L54:
	.word	.LC1
	.word	.LANCHOR1+21
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.fnend
	.size	rockit_rkisp_handle_message, .-rockit_rkisp_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_compat_ioctl, %function
rockit_rkisp_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_compat_ioctl, .-rockit_rkisp_compat_ioctl
	.align	1
	.global	rockit_rkisp_mpibuf_done
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_mpibuf_done, %function
rockit_rkisp_mpibuf_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #20
	sub	sp, sp, #20
	cbnz	r0, .L58
	movs	r3, #121
	ldr	r2, .L106
	str	r3, [sp]
	ldr	r3, .L106+4
.L104:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L95:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L58:
	ldr	r6, [r0, #32]
	cbnz	r6, .L60
	ldr	r2, .L106+8
	ldr	r3, [r2, #4]
	cmp	r3, #9
	add	r1, r3, #1
	str	r1, [r2, #4]
	bgt	.L95
	movs	r3, #126
	ldr	r2, .L106+12
	str	r3, [sp]
	ldr	r3, .L106+4
	b	.L104
.L60:
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	ldr	r8, [r6, #288]
	cbz	r1, .L62
	movs	r1, #1
	mov	r0, r6
	bl	rockit_rkisp_buf_que
	cbz	r0, .L63
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r8, #1]
.L63:
	movs	r3, #0
	strb	r3, [r4, #2]
	b	.L95
.L62:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L64
	mov	r0, r6
	bl	mpi_node_request_buf
	mov	r5, r0
.L65:
	cmp	r5, #0
	beq	.L95
	ldr	r3, [r4, #64]
	movs	r7, #0
	str	r3, [r5, #624]
	ldr	r3, [r4, #60]
	str	r3, [r5, #620]
	ldr	r3, .L106+16
	ldr	r2, [r4, #80]
	sub	r9, r3, #72
.L68:
	ldr	r1, [r3, r7, lsl #3]
	cmp	r2, r1
	beq	.L67
	adds	r7, r7, #1
	cmp	r7, #24
	bne	.L68
	movs	r3, #157
	ldr	r2, .L106+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L106+4
	movs	r0, #8
	bl	vlog
.L67:
	add	r7, r9, r7, lsl #3
	mov	r2, #1000
	ldr	r3, [r7, #76]
	str	r3, [r5, #640]
	ldr	r3, [r4, #68]
	str	r3, [r5, #628]
	ldr	r3, [r4, #72]
	str	r3, [r5, #632]
	add	r3, sp, #12
	ldrd	r0, [r4, #104]
	bl	div_s64_rem
	strd	r0, [r5, #672]
	ldr	r3, [r4, #100]
	str	r3, [r5, #668]
	ldr	r3, [r4, #28]
	str	r3, [r5, #584]
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cbz	r2, .L70
	orr	r3, r3, #4
.L71:
	str	r3, [r5, #584]
	movs	r2, #0
	mov	r1, r5
	mov	r0, r6
	bl	mpi_node_buffer_out
	ldr	r3, .L106+24
	ldr	r2, [r3]
	mov	r9, r3
	cmp	r2, #1
	bne	.L73
	ldr	r3, [r6, #44]
	ldr	r0, [r3, #44]
	bl	rkisp_rockit_get_isp_mode
	cmp	r0, #3
	bne	.L73
	ldr	r10, .L106+32
	movs	r7, #0
	ldr	fp, .L106+36
.L74:
	ldr	r3, [r8, #3088]
	ldr	r3, [r3]
	ubfx	r3, r3, #0, #11
	cbz	r3, .L76
	ldr	r3, [r10, #4]
	mov	r0, fp
	blx	r3
	ldr	r3, [r9, #4]
	adds	r7, r7, #1
	cmp	r3, r7
	bne	.L74
.L76:
	mov	r1, r7
	ldr	r0, .L106+28
	bl	printk
.L73:
	ldr	r3, [r5, #448]
	cbnz	r3, .L78
.L105:
	mov	r0, r5
	bl	mpi_obj_unref
	b	.L95
.L64:
	ldr	r5, [r0, #36]
	b	.L65
.L70:
	orr	r3, r3, #2
	b	.L71
.L78:
	cmp	r8, #0
	beq	.L105
	add	r1, r8, #4
	movs	r3, #0
.L79:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L80
	ldr	r0, [r5]
	ldr	r2, [r2]
	cmp	r0, r2
	bne	.L80
	add	r3, r8, r3, lsl #3
	movs	r2, #0
	strb	r2, [r3, #8]
.L81:
	mov	r0, r5
	bl	mpi_obj_unref
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cbz	r3, .L82
	movs	r1, #1
	mov	r0, r6
	bl	rockit_rkisp_buf_que
	cbz	r0, .L82
	movs	r3, #0
	strb	r3, [r4, #1]
	b	.L95
.L80:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L79
	b	.L81
.L82:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	strb	r3, [r8, #1]
	b	.L95
.L107:
	.align	2
.L106:
	.word	.LC6
	.word	.LANCHOR1+47
	.word	.LANCHOR2
	.word	.LC7
	.word	.LANCHOR1+72
	.word	.LC9
	.word	.LANCHOR0
	.word	.LC8
	.word	arm_delay_ops
	.word	214748000
	.fnend
	.size	rockit_rkisp_mpibuf_done, .-rockit_rkisp_mpibuf_done
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_create_ctx, %function
isp_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L113
	mov	r1, #3520
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L108
	movs	r1, #4
	ldr	r0, .L113+4
	bl	ioremap
	str	r0, [r4, #3088]
.L108:
	mov	r0, r4
	pop	{r4, pc}
.L114:
	.align	2
.L113:
	.word	kmalloc_caches
	.word	-5943292
	.fnend
	.size	isp_create_ctx, .-isp_create_ctx
	.align	1
	.global	rockit_rkisp_dev_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_dev_register, %function
rockit_rkisp_dev_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #3264
	ldr	r6, .L132
	mov	r8, r0
	mov	r9, #0
	mov	r10, #1
	mov	fp, r9
	ldr	r0, [r6, #8]
	bl	kmem_cache_alloc
	movs	r2, #164
	movs	r1, #0
	mov	r4, r0
	bl	memset
	ldr	r3, .L132+4
	add	r7, r4, #60
	str	r7, [r4, #60]
	str	r7, [r4, #64]
	str	r3, [r4, #68]
	ldr	r3, .L132+8
	str	r3, [r4, #76]
	movs	r3, #2
	strd	r3, r3, [r4, #48]
	movs	r3, #3
	str	r3, [r4, #56]
.L116:
	ldr	r2, [r4, #52]
	ldr	r0, [r6, #20]
	cmp	r2, fp
	bgt	.L120
	ldr	r2, [r4, #48]
	add	r9, r9, #1
	cmp	r2, r9
	bgt	.L125
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbz	r0, .L123
	mov	r3, #-1
	movs	r1, #2
	str	r3, [r0, #16]
	strd	r1, r3, [r0, #8]
	mov	r1, #3520
	ldr	r0, [r6, #20]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L123
	movs	r3, #16
	movs	r2, #1
	strd	r3, r3, [r0, #8]
	strd	r2, r3, [r0]
	str	r3, [r0, #16]
	ldr	r3, [r4, #64]
	str	r5, [r4, #64]
	strd	r7, r3, [r5]
	str	r5, [r3]
.L123:
	mov	r2, r8
	movs	r1, #8
	mov	r0, r4
	bl	mpi_dev_register
	ldr	r3, .L132+12
	mov	r0, r4
	movs	r2, #0
	ldr	r1, .L132+16
	str	r3, [r4, #80]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_sysfs_dev_add
.L120:
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L118
	strd	r10, r9, [r0, #8]
	mov	r1, #3520
	str	fp, [r0, #16]
	ldr	r0, [r6, #4]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L118
	mov	r2, #2160
	mov	r3, #3840
	strd	r3, r2, [r0, #8]
	movs	r2, #4
	str	r2, [r0, #36]
	ldr	r2, [r0, #64]
	str	r10, [r0, #32]
	orr	r2, r2, #3
	str	r2, [r0, #64]
	ldr	r2, [r0, #68]
	strd	r10, r10, [r0, #40]
	orr	r2, r2, #3
	str	r2, [r0, #68]
	ldr	r2, [r0, #56]
	orr	r2, r2, #3
	str	r2, [r0, #56]
	ldr	r2, [r0, #60]
	orr	r2, r2, #3
	str	r2, [r0, #60]
	ldr	r2, [r0, #72]
	orr	r2, r2, #3
	str	r2, [r0, #72]
	ldr	r2, [r0, #76]
	orr	r2, r2, #14
	str	r2, [r0, #76]
	ldr	r2, [r4, #64]
	str	r5, [r4, #64]
	strd	r7, r2, [r5]
	str	r5, [r2]
.L118:
	add	fp, fp, #1
	b	.L116
.L125:
	mov	fp, #0
	b	.L116
.L133:
	.align	2
.L132:
	.word	kmalloc_caches
	.word	isp_create_ctx
	.word	isp_destroy_ctx
	.word	rockit_rkisp_handle_message
	.word	.LANCHOR1+264
	.fnend
	.size	rockit_rkisp_dev_register, .-rockit_rkisp_dev_register
	.section	.init.text
	.align	1
	.global	rockit_rkisp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_init, %function
rockit_rkisp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movs	r4, #0
	ldr	r5, .L141
	.pad #20
	sub	sp, sp, #20
	mov	r1, r4
	strd	r4, r4, [sp, #4]
	ldr	r0, [r5]
	str	r4, [sp, #12]
	bl	rkisp_rockit_function_register
	movs	r1, #1
	str	r0, [r5]
	ldr	r0, .L141+4
	bl	rkisp_rockit_function_register
	add	r0, sp, #4
	bl	rkisp_rockit_get_ispdev
	add	r5, sp, #4
.L136:
	ldr	r0, [r5], #4
	cbz	r0, .L135
	bl	rockit_rkisp_dev_register
.L135:
	adds	r4, r4, #1
	cmp	r4, #3
	bne	.L136
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L142:
	.align	2
.L141:
	.word	.LANCHOR2
	.word	rockit_rkisp_mpibuf_done
	.fnend
	.size	rockit_rkisp_init, .-rockit_rkisp_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	rockit_rkisp_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_exit, %function
rockit_rkisp_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	add	r0, sp, #4
	movs	r3, #0
	strd	r3, r3, [sp, #4]
	str	r3, [sp, #12]
	bl	rkisp_rockit_get_ispdev
	mov	r5, r0
	cbnz	r0, .L143
	add	r4, sp, #4
.L148:
	ldr	r0, [r4], #4
	cbz	r0, .L146
	bl	mpi_dev_find_by_name
	cbz	r0, .L146
	bl	mpi_dev_unregister
.L146:
	adds	r5, r5, #1
	cmp	r5, #3
	bne	.L148
.L143:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	rockit_rkisp_exit, .-rockit_rkisp_exit
	.global	rockit_buf_que
	.global	rk_cam_num
	.global	rk_virtual_vblank
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.41994, %object
	.size	__func__.41994, 21
__func__.41994:
	.ascii	"rockit_rkisp_buf_que\000"
	.type	__func__.42015, %object
	.size	__func__.42015, 26
__func__.42015:
	.ascii	"rockit_rkisp_node_message\000"
	.type	__func__.41968, %object
	.size	__func__.41968, 25
__func__.41968:
	.ascii	"rockit_rkisp_mpibuf_done\000"
	.type	v4l2_rockit_fmt, %object
	.size	v4l2_rockit_fmt, 192
v4l2_rockit_fmt:
	.word	842094158
	.word	0
	.word	909203022
	.word	2
	.word	1345466932
	.word	7
	.word	1448695129
	.word	9
	.word	1498831189
	.word	10
	.word	875836505
	.word	14
	.word	1431918169
	.word	17
	.word	1498765654
	.word	18
	.word	1346520914
	.word	65536
	.word	1329743698
	.word	65538
	.word	875836498
	.word	65540
	.word	825770306
	.word	131072
	.word	1196573255
	.word	131073
	.word	1195528775
	.word	131074
	.word	1111967570
	.word	131075
	.word	808535874
	.word	131076
	.word	808534599
	.word	131077
	.word	808534338
	.word	131078
	.word	808535890
	.word	131079
	.word	842090306
	.word	131080
	.word	842089031
	.word	131081
	.word	842088770
	.word	131082
	.word	842090322
	.word	131083
	.word	844257602
	.word	131085
	.type	rockit_rkisp_driver_fops, %object
	.size	rockit_rkisp_driver_fops, 128
rockit_rkisp_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	rockit_rkisp_ioctl
	.word	rockit_rkisp_compat_ioctl
	.word	0
	.space	4
	.word	rockit_rkisp_open
	.space	4
	.word	0
	.space	60
	.type	__param_str_rk_cam_num, %object
	.size	__param_str_rk_cam_num, 18
__param_str_rk_cam_num:
	.ascii	"rockit.rk_cam_num\000"
	.type	__param_str_rk_virtual_vblank, %object
	.size	__param_str_rk_virtual_vblank, 25
__param_str_rk_virtual_vblank:
	.ascii	"rockit.rk_virtual_vblank\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rk_cam_num, %object
	.size	rk_cam_num, 4
rk_cam_num:
	.word	1
	.type	rk_virtual_vblank, %object
	.size	rk_virtual_vblank, 4
rk_virtual_vblank:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rockit_buf_que, %object
	.size	rockit_buf_que, 4
rockit_buf_que:
	.space	4
	.type	__func____LINE__.41969, %object
	.size	__func____LINE__.41969, 4
__func____LINE__.41969:
	.space	4
	.section	.init.rodata,"a"
	.type	__setup_str_rk_cam_num_setup, %object
	.size	__setup_str_rk_cam_num_setup, 12
__setup_str_rk_cam_num_setup:
	.ascii	"rk_cam_num=\000"
	.section	.init.setup,"aw"
	.align	2
	.type	__setup_rk_cam_num_setup, %object
	.size	__setup_rk_cam_num_setup, 12
__setup_rk_cam_num_setup:
	.word	__setup_str_rk_cam_num_setup
	.word	rk_cam_num_setup
	.word	0
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_rk_cam_numtype229, %object
	.size	__UNIQUE_ID_rk_cam_numtype229, 32
__UNIQUE_ID_rk_cam_numtype229:
	.ascii	"rockit.parmtype=rk_cam_num:uint\000"
	.type	__UNIQUE_ID_rk_virtual_vblanktype228, %object
	.size	__UNIQUE_ID_rk_virtual_vblanktype228, 39
__UNIQUE_ID_rk_virtual_vblanktype228:
	.ascii	"rockit.parmtype=rk_virtual_vblank:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"vvi(%s-%d) processing, bufs: %d\000"
.LC1:
	.ascii	"\033[1;31merr:node null\033[0m\000"
.LC2:
	.ascii	"\033[1;31merr: ctx is null\033[0m\000"
.LC3:
	.ascii	"rkisp queue buf fail, id = %d\000"
.LC4:
	.ascii	"rkisp queue buf done\000"
.LC5:
	.ascii	"rockit isp stream off\000"
.LC6:
	.ascii	"\033[1;31merr, rockit_cfg null\033[0m\000"
.LC7:
	.ascii	"\033[1;31merr, node null\033[0m\000"
.LC8:
	.ascii	"wait %d ms\000"
.LC9:
	.ascii	"\033[1;31mthe format is not find!\033[0m\000"
	.section	__param,"a"
	.align	2
	.type	__param_rk_cam_num, %object
	.size	__param_rk_cam_num, 20
__param_rk_cam_num:
	.word	__param_str_rk_cam_num
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_cam_num
	.type	__param_rk_virtual_vblank, %object
	.size	__param_rk_virtual_vblank, 20
__param_rk_virtual_vblank:
	.word	__param_str_rk_virtual_vblank
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_virtual_vblank
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
