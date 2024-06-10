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
	.file	"venc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vcodec_get_chnl_ctx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_ctx, %function
vcodec_get_chnl_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #288]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_ctx, .-vcodec_get_chnl_ctx
	.align	1
	.global	vcodec_get_chnl_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_id, %function
vcodec_get_chnl_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #56]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_id, .-vcodec_get_chnl_id
	.align	1
	.global	vcodec_get_chnl_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_type, %function
vcodec_get_chnl_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #1
	bx	lr
	.fnend
	.size	vcodec_get_chnl_type, .-vcodec_get_chnl_type
	.align	1
	.global	mpi_buf_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_map, %function
mpi_buf_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #604]
	bx	lr
	.fnend
	.size	mpi_buf_map, .-mpi_buf_map
	.align	1
	.global	mpi_buf_unmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unmap, %function
mpi_buf_unmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpi_buf_unmap, .-mpi_buf_unmap
	.align	1
	.global	mpi_buf_get_dmabuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_dmabuf, %function
mpi_buf_get_dmabuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L7
	ldr	r0, [r0, #448]
.L7:
	bx	lr
	.fnend
	.size	mpi_buf_get_dmabuf, .-mpi_buf_get_dmabuf
	.align	1
	.global	mpi_buffer_pool_get_free_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_get_free_num, %function
mpi_buffer_pool_get_free_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L12
	ldr	r3, [r0, #12]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L13
.L12:
	movs	r0, #1
	bx	lr
.L13:
	ldr	r0, [r0, #68]
	bx	lr
	.fnend
	.size	mpi_buffer_pool_get_free_num, .-mpi_buffer_pool_get_free_num
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_compat_ioctl, %function
venc_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	venc_compat_ioctl, .-venc_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_poll, %function
venc_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r2, r1
	ldr	r4, [r0, #128]
	cbz	r1, .L20
	ldr	r5, [r1]
	cbz	r5, .L20
	add	r1, r4, #36864
	adds	r1, r1, #224
	cbz	r1, .L20
	blx	r5
.L20:
	movw	r3, #37160
	ldr	r3, [r4, r3]
	cmp	r3, #0
	ite	ne
	movne	r0, #65
	moveq	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	venc_poll, .-venc_poll
	.align	1
	.global	venc_node_pp_get_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_md_attr, %function
venc_node_pp_get_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #4]	@ unaligned
	ldr	r2, [r0, #128]
	cmp	r3, #36
	beq	.L33
	mov	r3, #1992
	ldr	r2, .L42
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L42+4
	movs	r0, #4
	bl	vlog
.L41:
	mov	r0, #-1
.L32:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L33:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #0
	ble	.L35
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1997
	ldr	r2, .L42+8
	str	r3, [sp]
	ldr	r3, .L42+4
	bl	vlog
	b	.L41
.L35:
	movw	r3, #64680
	ldr	r0, [r2, r3]
	cmp	r0, #0
	ble	.L36
	movw	r0, #64676
	ldr	r0, [r2, r0]
	cmp	r0, #0
	ble	.L36
	str	r0, [r1, #8]	@ unaligned
	ldr	r3, [r2, r3]
	str	r3, [r1, #12]	@ unaligned
.L37:
	movw	r3, #64684
	movs	r0, #0
	ldr	r3, [r2, r3]
	str	r3, [r1, #16]	@ unaligned
	movw	r3, #64688
	ldr	r3, [r2, r3]
	str	r3, [r1, #20]	@ unaligned
	movw	r3, #64692
	ldr	r3, [r2, r3]
	str	r3, [r1, #24]	@ unaligned
	movw	r3, #64696
	ldr	r3, [r2, r3]
	str	r3, [r1, #28]	@ unaligned
	movw	r3, #64700
	ldr	r3, [r2, r3]
	str	r3, [r1, #32]	@ unaligned
	b	.L32
.L36:
	movw	r3, #37264
	ldr	r0, [r2, r3]
	movs	r3, #0
	cmp	r0, #1
	bne	.L38
	movs	r0, #70
	strb	r0, [r1, #8]
	movs	r0, #3
	strb	r3, [r1, #9]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
.L40:
	strb	r0, [r1, #12]
	strb	r3, [r1, #13]
	strb	r3, [r1, #14]
	strb	r3, [r1, #15]
	b	.L37
.L38:
	cmp	r0, #2
	bne	.L39
	movs	r4, #50
	strb	r3, [r1, #9]
	strb	r4, [r1, #8]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L40
.L39:
	movs	r0, #30
	strb	r3, [r1, #9]
	strb	r0, [r1, #8]
	movs	r0, #1
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L40
.L43:
	.align	2
.L42:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	venc_node_pp_get_md_attr, .-venc_node_pp_get_md_attr
	.align	1
	.global	venc_node_enable_tb
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_enable_tb, %function
venc_node_enable_tb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1]
	ldr	r3, [r0, #128]
	cmp	r2, #15
	ble	.L45
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2030
	ldr	r2, .L47
	str	r3, [sp]
	ldr	r3, .L47+4
	bl	vlog
	mov	r0, #-1
.L44:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L45:
	add	r3, r3, r2
	movw	r2, #37948
	movs	r1, #1
	movs	r0, #0
	strb	r1, [r3, r2]
	b	.L44
.L48:
	.align	2
.L47:
	.word	.LC1
	.word	.LANCHOR0+25
	.fnend
	.size	venc_node_enable_tb, .-venc_node_enable_tb
	.align	1
	.global	venc_node_tb_bind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_bind, %function
venc_node_tb_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r0, #128]
	ldr	r0, [r1]	@ unaligned
	ldr	r2, [r1, #4]	@ unaligned
	cmp	r0, #15
	bgt	.L50
	cmp	r2, #15
	ble	.L51
.L50:
	movs	r3, #16
	str	r0, [sp, #4]
	strd	r2, r3, [sp, #8]
	movs	r1, #2
	movw	r3, #2046
	ldr	r2, .L53
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L53+4
	bl	vlog
	mov	r0, #-1
.L49:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L51:
	add	r3, r3, r0
	movw	r1, #37964
	movs	r0, #0
	strb	r2, [r3, r1]
	b	.L49
.L54:
	.align	2
.L53:
	.word	.LC2
	.word	.LANCHOR0+45
	.fnend
	.size	venc_node_tb_bind, .-venc_node_tb_bind
	.align	1
	.global	venc_node_tb_request
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_request, %function
venc_node_tb_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1]
	ldr	r2, [r0, #128]
	cmp	r3, #15
	ble	.L56
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #2061
	ldr	r2, .L58
	str	r3, [sp]
	ldr	r3, .L58+4
	bl	vlog
	mov	r0, #-1
.L55:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L56:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r3, #9472
	adds	r3, r3, #24
	add	r3, r2, r3, lsl #2
	movs	r2, #1
	str	r2, [r3, #-4]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L55
.L59:
	.align	2
.L58:
	.word	.LC1
	.word	.LANCHOR0+63
	.fnend
	.size	venc_node_tb_request, .-venc_node_tb_request
	.align	1
	.global	mpi_buf_ref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref, %function
mpi_buf_ref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	.save {r4, r5, r6}
	cbz	r0, .L60
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L66
	movs	r3, #0
	movs	r1, #12
.L64:
	mul	r2, r1, r3
	ldr	r6, [r2, r5]
	cmp	r6, r0
	bne	.L62
	ldr	r3, .L66+4
	movw	r1, #64712
	add	r3, r3, r2
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L63:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6}
	b	mpi_obj_ref
.L62:
	adds	r3, r3, #1
	cmp	r3, #512
	bne	.L64
	b	.L63
.L60:
	pop	{r4, r5, r6}
	bx	lr
.L67:
	.align	2
.L66:
	.word	g_venc_dev+64708
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref, .-mpi_buf_ref
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_open, %function
venc_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L69
	push	{r3, lr}
	.save {r3, lr}
	str	r0, [r1, #128]
	bl	mpi_obj_ref
	movs	r0, #0
	pop	{r3, pc}
.L70:
	.align	2
.L69:
	.word	g_venc_dev+4
	.fnend
	.size	venc_open, .-venc_open
	.align	1
	.global	mpi_buffer_queue_push
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_push, %function
mpi_buffer_queue_push:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpi_queue_push_obj
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_push, .-mpi_buffer_queue_push
	.align	1
	.global	vcodec_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify, %function
vcodec_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	.pad #20
	sub	sp, sp, #20
	cmp	r1, #0
	bne	.L75
	ldr	r5, .L76
	ldr	r3, [r5, #328]
	orrs	r3, r0, r3
	bne	.L73
	ldrd	r6, [r2]
	movw	r3, #979
	ldr	r2, .L76+4
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L76+8
	strd	r6, [sp, #8]
	bl	vlog
	ldrd	r2, [r5, #344]
	mov	r0, r4
	strd	r2, [sp]
	ldrd	r2, [r5, #336]
	bl	mpp_vcodec_run_task
	mov	r4, r0
	cbnz	r0, .L74
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L74
	movs	r3, #1
	str	r3, [r5, #328]
.L73:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L74:
	movw	r3, #983
	strd	r6, [sp, #8]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L76+8
	movs	r0, #4
	ldr	r2, .L76+12
	movs	r4, #0
	bl	vlog
	b	.L73
.L75:
	mov	r4, #-1
	b	.L73
.L77:
	.align	2
.L76:
	.word	g_venc_dev
	.word	.LC3
	.word	.LANCHOR0+84
	.word	.LC4
	.fnend
	.size	vcodec_notify, .-vcodec_notify
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_venc_node, %function
get_venc_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #4
	b	vsys_get_node_from_map
	.fnend
	.size	get_venc_node, .-get_venc_node
	.align	1
	.global	vcodec_set_intra_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_set_intra_info, %function
vcodec_set_intra_info:
	.fnstart
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #15
	.pad #20
	sub	sp, sp, #20
	mov	r5, r0
	mov	r8, r2
	mov	r9, r3
	ldrd	r6, [sp, #56]
	ldr	r10, [sp, #64]
	bls	.L80
	movs	r3, #16
	ldr	r2, .L113
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #907
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L113+4
	bl	vlog
	mov	r0, #-1
.L79:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L80:
	bl	get_venc_node
	cbz	r0, .L82
	ldr	r3, [r0, #116]
	cbz	r3, .L82
	blx	r3
.L82:
	ldr	r4, .L113+8
	ldr	r3, [r4, #220]
	cbz	r3, .L84
	cbz	r5, .L84
	ldr	r3, [r4, #328]
	cbnz	r3, .L84
	addw	r3, r5, #2302
	add	r3, r4, r3, lsl #4
	ldr	fp, [r3, #4]
	cmp	fp, #0
	bne	.L84
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L84
	movw	r3, #917
	ldr	r2, .L113+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L113+4
	movs	r0, #4
	str	r5, [sp, #4]
	bl	vlog
	ldrd	r2, [r4, #344]
	mov	r0, fp
	strd	r2, [sp]
	ldrd	r2, [r4, #336]
	bl	mpp_vcodec_run_task
	cmp	r0, #0
	bne	.L86
	movs	r3, #1
	str	r3, [r4, #328]
.L84:
	cmp	r10, #0
	beq	.L112
	add	r3, r5, #15872
	adds	r3, r3, #40
	ldr	r3, [r4, r3, lsl #2]
	cmp	r3, #9
	beq	.L87
	cmp	r3, #15
	bne	.L88
.L87:
	add	r2, r4, r5, lsl #4
	movw	r1, #36844
	ldr	r3, [r2, r1]
	cmp	r3, #0
	ble	.L88
	subs	r3, r3, #1
	str	r3, [r2, r1]
	movw	r3, #36848
	movs	r1, #0
	str	r1, [r2, r3]
.L88:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r2, r4, r5
	movw	r3, #37968
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	movw	r2, #37952
	add	r3, r3, r4
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cbz	r3, .L89
	add	r10, r5, #9472
	add	r10, r10, #24
	ldr	r3, [r4, r10, lsl #2]
	cmp	r3, #0
	ble	.L89
	mov	r3, #800
	movs	r2, #0
	mla	r3, r3, r5, r4
	add	r3, r3, #50688
	adds	r3, r3, #160
.L92:
	ldrd	r0, [r3], #8
	cmp	r1, r7
	it	eq
	cmpeq	r0, r6
	beq	.L90
	orrs	r1, r0, r1
	bne	.L91
	movs	r3, #100
	mla	r5, r3, r5, r2
	add	r3, r5, #4736
	add	r5, r5, #6336
	adds	r3, r3, #20
	adds	r5, r5, #20
	add	r3, r4, r3, lsl #3
	add	r5, r4, r5, lsl #3
	strd	r8, [r3]
	strd	r6, [r5]
.L90:
	ldr	r3, [r4, r10, lsl #2]
	subs	r3, r3, #1
	str	r3, [r4, r10, lsl #2]
.L89:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L112:
	movs	r0, #0
	b	.L79
.L86:
	movw	r3, #921
	str	r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L113+4
	movs	r0, #4
	ldr	r2, .L113+16
	bl	vlog
	b	.L84
.L91:
	adds	r2, r2, #1
	cmp	r2, #100
	bne	.L92
	mov	r3, #948
	str	r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L113+4
	movs	r0, #4
	ldr	r2, .L113+20
	bl	vlog
	b	.L90
.L114:
	.align	2
.L113:
	.word	.LC1
	.word	.LANCHOR0+98
	.word	g_venc_dev
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.fnend
	.size	vcodec_set_intra_info, .-vcodec_set_intra_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_pp_node, %function
get_pp_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #20
	b	vsys_get_node_from_map
	.fnend
	.size	get_pp_node, .-get_pp_node
	.align	1
	.global	vcodec_destory_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_destory_dev, %function
vcodec_destory_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L118
	bl	mpi_dev_unregister
	mov	r0, r4
	bl	kfree
	movs	r0, #0
.L116:
	pop	{r4, pc}
.L118:
	mov	r0, #-1
	b	.L116
	.fnend
	.size	vcodec_destory_dev, .-vcodec_destory_dev
	.align	1
	.global	mpi_buf_alloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_alloc, %function
mpi_buf_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r0, .L125
	bl	mpi_allocator_find_by_name
	mov	r2, r4
	movs	r1, #1
	bl	mpi_allocator_alloc
	mov	r5, r0
	cbz	r0, .L121
	movs	r1, #0
	bl	mpi_buf_create
	mov	r4, r0
	cbz	r0, .L119
	ldr	r3, .L125+4
	str	r3, [r0, #4]
	mov	r0, r5
	bl	dma_buf_put
.L119:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L121:
	mov	r4, r0
	b	.L119
.L126:
	.align	2
.L125:
	.word	.LC8
	.word	.LC9
	.fnend
	.size	mpi_buf_alloc, .-mpi_buf_alloc
	.align	1
	.global	mpi_buf_unref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unref, %function
mpi_buf_unref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	cmp	r0, #0
	beq	.L127
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, .L139
	movs	r2, #0
	movs	r3, #12
.L132:
	mul	r1, r3, r2
	ldr	r6, [r1, r0]
	cmp	r6, r4
	bne	.L129
	ldr	r3, .L139+4
	add	r3, r3, r1
	movw	r1, #64712
	ldr	r2, [r3, r1]
	subs	r2, r2, #1
	str	r2, [r3, r1]
	cbnz	r2, .L130
	movw	r1, #64716
	movw	r6, #64708
	ldr	r0, [r3, r1]
	str	r2, [r3, r6]
	mov	r2, #-1
	str	r2, [r3, r1]
.L131:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r0, #0
	blt	.L133
	movs	r2, #0
	mov	r1, r4
	bl	remove_user_from_buf
.L133:
	ldr	r3, [r4, #444]
	cbz	r3, .L134
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L139+8
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #1097
	str	r3, [sp]
	ldr	r3, .L139+12
	bl	vlog
.L134:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unref
.L129:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L132
.L130:
	mov	r0, #-1
	b	.L131
.L127:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L140:
	.align	2
.L139:
	.word	g_venc_dev+64708
	.word	g_venc_dev
	.word	.LC10
	.word	.LANCHOR0+120
	.fnend
	.size	mpi_buf_unref, .-mpi_buf_unref
	.align	1
	.global	mpi_buffer_queue_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_create, %function
mpi_buffer_queue_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L142
	movs	r1, #4
	b	mpi_queue_create
.L143:
	.align	2
.L142:
	.word	mpi_obj_unref
	.fnend
	.size	mpi_buffer_queue_create, .-mpi_buffer_queue_create
	.align	1
	.global	mpi_buffer_queue_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_destroy, %function
mpi_buffer_queue_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	movs	r1, #0
	bl	mpi_queue_destroy
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_destroy, .-mpi_buffer_queue_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_destroy_ctx, %function
venc_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0]
	cbz	r0, .L146
	movs	r1, #0
	bl	mpi_queue_destroy
.L146:
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	venc_destroy_ctx, .-venc_destroy_ctx
	.align	1
	.global	mpi_buffer_pool_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_create, %function
mpi_buffer_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r0, .L155
	mov	r6, r1
	bl	mpi_allocator_find_by_name
	mov	r4, r0
	cbz	r0, .L150
	ldr	r3, .L155+4
	mov	r2, r5
	movs	r1, #1
	str	r3, [sp]
	mov	r3, r6
	bl	mpi_buf_pool_create
	mov	r4, r0
.L150:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L156:
	.align	2
.L155:
	.word	.LC8
	.word	.LC9
	.fnend
	.size	mpi_buffer_pool_create, .-mpi_buffer_pool_create
	.align	1
	.global	mpi_buffer_pool_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_destroy, %function
mpi_buffer_pool_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_destroy
	.fnend
	.size	mpi_buffer_pool_destroy, .-mpi_buffer_pool_destroy
	.align	1
	.global	mpi_buffer_pool_request_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_request_buf, %function
mpi_buffer_pool_request_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_request_buf
	.fnend
	.size	mpi_buffer_pool_request_buf, .-mpi_buffer_pool_request_buf
	.align	1
	.global	mpi_buffer_queue_pop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_pop, %function
mpi_buffer_queue_pop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpi_queue_pop_obj
	.fnend
	.size	mpi_buffer_queue_pop, .-mpi_buffer_queue_pop
	.align	1
	.global	venc_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_create, %function
venc_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	ldr	r0, .L168
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r5, [r5, #128]
	cmp	r2, #16
	mov	r6, r0
	beq	.L161
	movw	r3, #1483
	ldr	r2, .L168+4
	str	r3, [sp]
	ldr	r3, .L168+8
.L167:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L166
.L161:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #15
	ble	.L163
	strd	r3, r2, [sp, #4]
	movs	r1, #2
	movw	r3, #1487
	ldr	r2, .L168+12
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L168+8
	bl	vlog
.L166:
	mov	r0, #-1
.L160:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L163:
	ldr	r0, .L168+16
	bl	mpi_allocator_find_by_name
	cbnz	r0, .L164
	movw	r3, #1493
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L168+8
	movs	r0, #4
	ldr	r2, .L168+20
	bl	vlog
	b	.L166
.L164:
	mov	r0, r6
	movs	r3, #0
	movs	r2, #1
	ldr	r1, [r4, #4]	@ unaligned
	bl	mpi_dev_create_node_with_params
	mov	r6, r0
	cbnz	r0, .L165
	movw	r3, #1499
	ldr	r2, .L168+24
	str	r3, [sp]
	ldr	r3, .L168+8
	b	.L167
.L165:
	ldr	r3, .L168+28
	movs	r1, #1
	str	r3, [r0, #4]
	bl	mpi_node_enable_auto_streamon
	mov	r3, r6
	ldr	r2, [r4, #4]	@ unaligned
	movs	r0, #4
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, [r4, #12]	@ unaligned
	movs	r0, #0
	add	r3, r3, #15872
	adds	r3, r3, #40
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #-4]
	b	.L160
.L169:
	.align	2
.L168:
	.word	.LC11
	.word	.LC12
	.word	.LANCHOR0+134
	.word	.LC1
	.word	.LC8
	.word	.LC13
	.word	.LC14
	.word	.LC9
	.fnend
	.size	venc_node_create, .-venc_node_create
	.align	1
	.global	venc_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_delete, %function
venc_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]
	ldr	r7, [r0, #128]
	cmp	r4, #15
	ble	.L171
	movs	r3, #16
	ldr	r2, .L197
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1519
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L197+4
	bl	vlog
	mov	r0, #-1
.L170:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L171:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L197+8
	add	r3, r5, r4, lsl #2
	ldr	r3, [r3, #220]
	cbz	r3, .L173
	ldr	r0, [r5, #352]
	cbz	r0, .L173
	bl	mpi_buf_unref
	movs	r3, #0
	str	r3, [r5, #352]
	str	r3, [r5, #332]
.L173:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r4
	bl	get_venc_node
	mov	r6, r0
	cbz	r0, .L174
	mov	r2, r4
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L174:
	add	r8, r7, r4
	movw	r9, #37948
	ldrb	r3, [r8, r9]	@ zero_extendqisi2
	cbz	r3, .L175
	mov	fp, #800
	movw	r3, #37964
	mul	r6, fp, r4
	movs	r2, #255
	strb	r2, [r8, r3]
	add	r3, r4, #9472
	adds	r3, r3, #24
	mov	r10, #0
	add	r0, r6, #37888
	mov	r2, fp
	add	r3, r7, r3, lsl #2
	adds	r0, r0, #160
	subs	r7, r7, #4
	mov	r1, r10
	str	r10, [r3, #-4]
	add	r0, r0, r7
	bl	memset
	add	r0, r6, #50688
	adds	r0, r0, #160
	mov	r2, fp
	mov	r1, r10
	add	r0, r0, r7
	bl	memset
	strb	r10, [r8, r9]
.L175:
	cbnz	r4, .L176
	ldr	r3, [r5, #220]
	cbz	r3, .L176
	bl	mcu_wrap_end
	str	r4, [r5, #220]
	strd	r4, r4, [r5, #212]
.L176:
	movs	r5, #0
.L177:
	mov	r0, r5
	bl	get_venc_node
	mov	r4, r0
	cbnz	r0, .L179
	adds	r5, r5, #1
	cmp	r5, #16
	bne	.L177
	bl	mpp_vcodec_clear_buf_resource
	mov	r0, r4
	b	.L170
.L179:
	movs	r0, #0
	b	.L170
.L198:
	.align	2
.L197:
	.word	.LC1
	.word	.LANCHOR0+151
	.word	g_venc_dev
	.fnend
	.size	venc_node_delete, .-venc_node_delete
	.align	1
	.global	venc_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_start, %function
venc_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #36
	beq	.L200
	movw	r2, #1563
	ldr	r1, .L239
	ldr	r0, .L239+4
	bl	printk
.L238:
	mov	r4, #-1
.L199:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L200:
	cmp	r4, #15
	ble	.L202
	movs	r3, #16
	ldr	r2, .L239+8
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1568
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L239
	bl	vlog
	b	.L238
.L202:
	ldr	r3, [r1, #8]	@ unaligned
	movs	r0, #4
	ldr	r6, .L239+12
	ldr	r2, .L239+16
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	movs	r1, #5
	strd	r4, r3, [sp, #4]
	movw	r3, #1571
	str	r3, [sp]
	ldr	r3, .L239
	bl	vlog
	add	r3, r6, r4, lsl #2
	ldr	r3, [r3, #220]
	cbnz	r3, .L203
	ldr	r3, [r5, #4]	@ unaligned
	cbz	r3, .L204
.L203:
	cbnz	r4, .L206
	strd	r4, r4, [r6, #320]
	str	r4, [r6, #332]
.L207:
	ldr	r3, [r5, #4]	@ unaligned
	cbz	r3, .L206
	str	r3, [r6, #220]
	b	.L206
.L204:
	cmp	r4, #0
	beq	.L207
.L206:
	mov	r0, r4
	bl	get_venc_node
	cbz	r0, .L209
	mov	r0, r4
	bl	get_venc_node
	bl	mpi_node_streamon
.L209:
	cbz	r4, .L210
.L212:
	movs	r4, #0
	b	.L199
.L210:
	ldr	r3, .L239+20
	add	r7, r5, #32
.L211:
	ldr	r0, [r5]	@ unaligned
	adds	r5, r5, #8
	ldr	r1, [r5, #-4]	@ unaligned
	cmp	r5, r7
	mov	r2, r3
	stmia	r2!, {r0, r1}
	mov	r3, r2
	bne	.L211
	ldr	r0, [r5]	@ unaligned
	str	r0, [r2]
	ldr	r3, [r6, #220]
	cmp	r3, #0
	beq	.L212
	ldr	r0, .L239+24
	bl	mpi_dev_find_by_name
	mov	r9, r0
	movs	r0, #0
	bl	get_venc_node
	movs	r1, #0
	mov	r7, r0
	mov	r0, r1
	bl	mpi_buf_create
	mov	r5, r0
	cmp	r0, #0
	beq	.L212
	cmp	r9, #0
	beq	.L212
	cmp	r7, #0
	beq	.L212
	ldr	r3, .L239+28
	str	r3, [r0, #4]
	ldr	r3, [r6, #296]
	ldr	r2, [r6, #300]
	ldr	ip, [r6, #308]
	ldr	lr, [r6, #312]
	ldr	r1, [r6, #316]
	str	r3, [r0, #620]
	str	r2, [r0, #624]
	str	r1, [r0, #640]
	movs	r1, #0
	str	ip, [r0, #628]
	str	lr, [r0, #632]
	movs	r0, #0
	strd	r0, [r5, #672]
	movs	r1, #0
	str	r1, [r5, #668]
	movs	r1, #4
	strd	r3, r2, [sp, #4]
	mov	r0, r1
	movw	r3, #670
	strd	ip, lr, [sp, #12]
	str	r3, [sp]
	ldr	r2, .L239+32
	ldr	r3, .L239+36
	bl	vlog
	ldr	r3, [r7, #288]
	ldr	r8, [r3]
	cmp	r8, #0
	bne	.L213
	movw	r3, #673
	ldr	r2, .L239+40
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L239+36
	movs	r0, #4
	bl	vlog
	b	.L199
.L213:
	mov	r0, r8
	bl	mpi_queue_pop_obj
	cbz	r0, .L214
	bl	mpi_buf_unref
.L214:
	mov	r1, r5
	mov	r0, r8
	movs	r3, #1
	str	r3, [r6, #328]
	bl	mpi_queue_push_obj
	cbnz	r0, .L215
	movw	r3, #681
	ldr	r2, .L239+44
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L239+36
	movs	r0, #4
	bl	vlog
	mov	r0, r5
	bl	mpi_obj_unref
.L215:
	ldr	r3, [r9, #80]
	movs	r2, #0
	movs	r1, #7
	mov	r0, r7
	blx	r3
	b	.L199
.L240:
	.align	2
.L239:
	.word	.LANCHOR0+168
	.word	.LC15
	.word	.LC1
	.word	g_venc_dev
	.word	.LC16
	.word	g_venc_dev+284
	.word	.LC11
	.word	.LC9
	.word	.LC17
	.word	.LANCHOR0+184
	.word	.LC18
	.word	.LC19
	.fnend
	.size	venc_node_start, .-venc_node_start
	.align	1
	.global	venc_node_pp_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_start, %function
venc_node_pp_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, [r1]
	cmp	r4, #0
	ble	.L242
	movs	r3, #1
	ldr	r2, .L245
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1890
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L245+4
	bl	vlog
	mov	r0, #-1
.L241:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L242:
	mov	r0, r4
	bl	get_pp_node
	cmp	r0, #0
	beq	.L241
	mov	r0, r4
	bl	get_pp_node
	bl	mpi_node_streamon
	movs	r0, #0
	b	.L241
.L246:
	.align	2
.L245:
	.word	.LC1
	.word	.LANCHOR0+199
	.fnend
	.size	venc_node_pp_start, .-venc_node_pp_start
	.align	1
	.global	venc_node_set_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_vcodec_attr, %function
venc_node_set_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #128]
	cmp	r3, #15
	bls	.L248
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	mov	r3, #1672
	ldr	r2, .L252
	str	r3, [sp]
	ldr	r3, .L252+4
	bl	vlog
	mov	r0, #-1
.L247:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L248:
	movs	r0, #60
	mla	r3, r0, r3, r2
	adds	r2, r1, r0
	add	r3, r3, #63488
	adds	r3, r3, #220
.L250:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L250
	movs	r0, #0
	b	.L247
.L253:
	.align	2
.L252:
	.word	.LC1
	.word	.LANCHOR0+218
	.fnend
	.size	venc_node_set_vcodec_attr, .-venc_node_set_vcodec_attr
	.align	1
	.global	venc_node_get_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_vcodec_attr, %function
venc_node_get_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #128]
	cmp	r3, #15
	bls	.L255
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1685
	ldr	r2, .L259
	str	r3, [sp]
	ldr	r3, .L259+4
	bl	vlog
	mov	r0, #-1
.L254:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L255:
	movs	r0, #60
	mla	r3, r0, r3, r2
	add	r3, r3, #63488
	adds	r3, r3, #220
	adds	r2, r3, r0
.L257:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L257
	movs	r0, #0
	b	.L254
.L260:
	.align	2
.L259:
	.word	.LC1
	.word	.LANCHOR0+244
	.fnend
	.size	venc_node_get_vcodec_attr, .-venc_node_get_vcodec_attr
	.align	1
	.global	venc_node_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_send_frame, %function
venc_node_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L275
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L262
	movw	r3, #1599
	ldr	r2, .L275+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L275+8
	movs	r0, #4
	bl	vlog
.L274:
	mov	r0, #-1
.L261:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L262:
	ldr	r6, [r4]	@ unaligned
	cmp	r6, #15
	ble	.L264
	movs	r3, #16
	ldr	r2, .L275+12
	strd	r6, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1604
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L275+8
	bl	vlog
	b	.L274
.L264:
	mov	r0, r6
	bl	get_venc_node
	mov	r7, r0
	cbnz	r0, .L265
.L266:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r6, r7, [sp, #4]
	movs	r0, #4
	ldr	r2, .L275+16
	strd	r8, r3, [sp, #12]
	movw	r3, #1623
	str	r3, [sp]
	ldr	r3, .L275+8
	bl	vlog
	b	.L274
.L265:
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L266
	cmp	r0, #0
	blt	.L266
	bl	get_mpi_buf
	mov	r5, r0
	cmp	r0, #0
	beq	.L266
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #616
	bl	memcpy
	movs	r3, #4
	str	r3, [r5, #584]
	movs	r2, #0
	ldr	r3, [r4, #84]	@ unaligned
	mov	r1, r5
	mov	r0, r7
	cmp	r3, #0
	itt	lt
	movlt	r3, #12
	strlt	r3, [r5, #584]
	bl	mpi_node_buffer_in
	cmp	r0, #0
	beq	.L261
	b	.L266
.L276:
	.align	2
.L275:
	.word	.LC11
	.word	.LC20
	.word	.LANCHOR0+270
	.word	.LC1
	.word	.LC21
	.fnend
	.size	venc_node_send_frame, .-venc_node_send_frame
	.align	1
	.global	venc_node_pp_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_send_frame, %function
venc_node_pp_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L292
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L278
	movw	r3, #1907
	ldr	r2, .L292+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L292+8
	movs	r0, #4
	bl	vlog
.L291:
	mov	r0, #-1
	b	.L277
.L278:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #0
	ble	.L280
	movs	r3, #1
	ldr	r2, .L292+12
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1912
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L292+8
	bl	vlog
	b	.L291
.L280:
	mov	r0, r5
	bl	get_pp_node
	mov	r6, r0
	cbz	r0, .L281
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L281
	cmp	r0, #0
	blt	.L281
	bl	get_mpi_buf
	mov	r7, r0
	cbz	r0, .L281
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #616
	bl	memcpy
	movs	r2, #1
	mov	r1, r7
	mov	r0, r6
	bl	mpi_node_buffer_in
	movs	r0, #0
.L277:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L281:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r5, r6, [sp, #4]
	movs	r0, #4
	ldr	r2, .L292+16
	strd	r8, r3, [sp, #12]
	mov	r3, #1928
	str	r3, [sp]
	ldr	r3, .L292+8
	bl	vlog
	b	.L291
.L293:
	.align	2
.L292:
	.word	.LC9
	.word	.LC20
	.word	.LANCHOR0+291
	.word	.LC1
	.word	.LC22
	.fnend
	.size	venc_node_pp_send_frame, .-venc_node_pp_send_frame
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_thread_fn, %function
venc_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 504
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #524
	sub	sp, sp, #524
	add	r8, sp, #68
	mov	r4, r0
	movs	r2, #40
	movs	r1, #0
	mov	r0, r8
	movs	r6, #0
	bl	memset
	adds	r3, r4, #4
	ldr	r2, .L364
	movs	r1, #5
	movs	r0, #4
	str	r3, [sp, #8]
	ldr	r3, [r4, #48]
	str	r3, [sp, #4]
	movw	r3, #2289
	str	r3, [sp]
	ldr	r3, .L364+4
	bl	vlog
	add	r3, r4, #37120
	adds	r3, r3, #40
	str	r3, [sp, #16]
.L295:
	bl	kthread_should_stop
	cbz	r0, .L328
	movs	r1, #4
	movw	r3, #2431
	ldr	r2, .L364+8
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L364+4
	bl	vlog
	movs	r0, #0
	add	sp, sp, #524
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L328:
	ldr	r3, [r4, #180]
	cbz	r3, .L296
	movs	r0, #1
	bl	msleep
	b	.L295
.L365:
	.align	2
.L364:
	.word	.LC23
	.word	.LANCHOR0+315
	.word	.LC24
.L296:
	add	r0, r4, #196
	bl	down
	ldr	r5, [r4, #92]
.L363:
	subs	r5, r5, #48
	add	r2, r4, #92
	add	r3, r5, #48
	cmp	r3, r2
	beq	.L295
	ldr	r3, [r5, #288]
	ldr	r0, [r3]
	bl	mpi_queue_pop_obj
	mov	r7, r0
	cmp	r0, #0
	beq	.L299
	movs	r3, #6
	str	r3, [sp, #260]
	adds	r3, r6, #1
	str	r3, [sp, #20]
	movw	r3, #37248
	str	r0, [sp, #276]
	ldr	r3, [r4, r3]
	add	r2, sp, #256
	movs	r1, #16
	movs	r0, #0
	str	r6, [sp, #256]
	str	r3, [sp, #264]
	movs	r3, #1
	strd	r3, r3, [sp, #268]
	bl	vepu_pp_control
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [sp, #16]
	ldr	r6, [r2]
	adds	r6, r6, #1
	cmp	r6, #5
	it	ge
	movge	r6, #0
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #37116
	ldr	r3, [r4, r3]
	cmp	r3, #0
	beq	.L301
	add	r3, r6, #9280
	adds	r3, r3, #38
	ldr	r3, [r4, r3, lsl #2]
	str	r3, [sp, #200]
	movw	r3, #64688
	ldr	r3, [r4, r3]
	usat	r3, #2, r3
	str	r3, [sp, #204]
	movw	r3, #64684
	ldr	r3, [r4, r3]
	cmp	r3, #0
	ble	.L302
	movw	r2, #64680
	ldr	r2, [r4, r2]
	cmp	r2, #0
	ble	.L302
	movw	r1, #4095
	cmp	r2, r1
	ite	le
	strle	r2, [sp, #208]
	strgt	r1, [sp, #208]
	cmp	r3, #4
	it	ge
	movge	r3, #4
.L360:
	str	r3, [sp, #212]
	movw	r3, #37260
	ldr	r3, [r4, r3]
	add	r2, sp, #200
	movs	r1, #32
	movs	r0, #0
	str	r3, [sp, #216]
	movw	r3, #64692
	ldr	r3, [r4, r3]
	str	r3, [sp, #220]
	movw	r3, #64696
	ldr	r3, [r4, r3]
	str	r3, [sp, #224]
	movw	r3, #64700
	ldr	r3, [r4, r3]
	str	r3, [sp, #228]
	movw	r3, #64704
	ldr	r3, [r4, r3]
	str	r3, [sp, #232]
	bl	vepu_pp_control
.L301:
	add	r10, r4, #37120
	ldr	r3, [r10]
	cbz	r3, .L306
	movw	r3, #37264
	ldr	r2, [r4, r3]
	movw	r3, #37100
	ldr	r1, [r4, r3]
	movw	r3, #37104
	ldr	r3, [r4, r3]
	muls	r3, r1, r3
	movw	r1, #37124
	ldr	r1, [r4, r1]
	cmp	r1, #0
	beq	.L307
	asrs	r3, r3, #8
.L308:
	cmp	r2, #6
	bgt	.L309
	movs	r1, #230
	ldr	r0, [sp, #32]
	muls	r1, r3, r1
	cmp	r0, r1
	it	gt
	addgt	r2, r2, #1
.L309:
	muls	r3, r2, r3
	movs	r0, #1
	movs	r1, #12
	add	r2, sp, #108
	strd	r0, r1, [sp, #108]
	movs	r1, #48
	movs	r0, #0
	asrs	r3, r3, #3
	str	r3, [sp, #116]
	bl	vepu_pp_control
.L306:
	movw	r9, #37108
	ldr	r3, [r4, r9]
	cbz	r3, .L310
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #37948
	movw	r1, #37816
	ldr	r3, [r4, r3]
	movs	r0, #0
	add	r3, r4, r3, lsl #3
	ldr	r1, [r3, r1]
	str	r1, [sp, #388]
	movw	r1, #37820
	str	r0, [r3, r1]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #64
	add	r2, sp, #388
	bl	vepu_pp_control
.L310:
	movw	fp, #37112
	ldr	r2, [r4, fp]
	cbz	r2, .L311
	add	r2, sp, #320
	movs	r1, #80
	movs	r0, #0
	bl	vepu_pp_control
.L311:
	movw	r3, #37116
	ldr	r2, [r4, r3]
	cbnz	r2, .L312
	ldr	r2, [r10]
	cbnz	r2, .L312
	ldr	r2, [r4, r9]
	cbnz	r2, .L312
	ldr	r2, [r4, fp]
	cmp	r2, #0
	beq	.L313
.L312:
	add	r2, sp, #256
	movs	r1, #96
	movs	r0, #0
	bl	vepu_pp_control
	ldr	r2, [r10]
	cbz	r2, .L314
	add	r2, sp, #28
	movs	r1, #112
	movs	r0, #0
	bl	vepu_pp_control
	add	r2, sp, #104
.L316:
	ldr	r1, [r2, #-4]
	str	r1, [r2], #-4
	cmp	r2, r8
	bne	.L316
	ldr	r2, [sp, #32]
	ldr	r1, [sp, #28]
	str	r2, [r8]
	cbz	r1, .L314
	movs	r0, #95
	mov	ip, #105
	muls	r0, r2, r0
	mov	lr, #100
	mul	ip, ip, r2
	movs	r2, #1
.L319:
	ldr	r1, [r8, r2, lsl #2]
	mul	r1, lr, r1
	cmp	r0, r1
	bgt	.L317
	cmp	r1, ip
	ble	.L318
.L317:
	movs	r2, #0
	str	r2, [sp, #28]
.L314:
	ldr	r3, [r4, fp]
	cbz	r3, .L313
	add	r2, sp, #152
	movs	r1, #128
	movs	r0, #0
	bl	vepu_pp_control
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	lr, #37812
	movs	r2, #52
	ldr	r3, [r4, lr]
	add	r10, sp, #200
	mla	r3, r2, r3, r4
	add	r2, sp, #152
	add	r3, r3, #37120
	adds	r3, r3, #172
.L320:
	mov	ip, r2
	adds	r3, r3, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r10
	str	r0, [r3, #-8]	@ unaligned
	mov	r2, ip
	str	r1, [r3, #-4]	@ unaligned
	bne	.L320
	ldr	r3, [r4, lr]
	movs	r1, #52
	ldr	r2, [r7, #668]
	movw	r0, #37340
	mla	r1, r1, r3, r4
	adds	r3, r3, #1
	cmp	r3, #9
	it	gt
	movgt	r3, #0
	str	r2, [r1, r0]
	str	r3, [r4, lr]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L313:
	ldr	r3, [r4, r9]
	cbz	r3, .L323
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r0, #37948
	ldr	r1, [r7, #668]
	ldr	r3, [r4, r0]
	add	r2, r3, #4704
	adds	r3, r3, #1
	adds	r2, r2, #23
	cmp	r3, #1
	add	r2, r4, r2, lsl #3
	it	gt
	movgt	r3, #0
	str	r1, [r2, #4]
	str	r3, [r4, r0]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L323:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [sp, #16]
	movs	r2, #1
	str	r6, [r3]
	movw	r3, #37164
	str	r2, [r4, r3]
	add	r3, r4, #37120
	add	r6, sp, #28
	adds	r3, r3, #52
.L326:
	mov	r2, r6
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [r3, #-8]	@ unaligned
	mov	r6, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L326
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r4, #36864
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	adds	r0, r0, #228
	bl	__wake_up
	movs	r2, #0
	mov	r1, r7
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
	mov	r0, r7
	bl	mpi_buf_unref
	ldr	r6, [sp, #20]
.L299:
	ldr	r5, [r5, #48]
	b	.L363
.L302:
	movw	r3, #37268
	ldr	r3, [r4, r3]
	cmp	r3, #1
	bne	.L304
	movs	r3, #70
	str	r3, [sp, #208]
	movs	r3, #3
	b	.L360
.L304:
	cmp	r3, #2
	itett	ne
	movne	r3, #30
	moveq	r2, #50
	strne	r3, [sp, #208]
	movne	r3, #1
	it	eq
	streq	r2, [sp, #208]
	b	.L360
.L307:
	asrs	r3, r3, #4
	b	.L308
.L318:
	adds	r2, r2, #1
	cmp	r2, #10
	bne	.L319
	b	.L314
	.fnend
	.size	venc_thread_fn, .-venc_thread_fn
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_handle_message, %function
venc_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r3, [r0, #8]
	.pad #28
	sub	sp, sp, #28
	mov	r4, r2
	cmp	r3, #1
	bne	.L373
	cmp	r1, #1
	bne	.L373
	cmp	r2, #0
	beq	.L374
	ldr	r2, .L378
	movw	r3, #37252
	ldr	r1, [r2, r3]
	cmp	r1, #1
	ble	.L368
	ldr	r0, [r4, #668]
	bl	__aeabi_uidivmod
	cbz	r1, .L368
	movs	r2, #0
	mov	r1, r4
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
.L373:
	movs	r6, #0
	b	.L366
.L368:
	ldr	r3, [r5, #288]
	movs	r1, #5
	ldr	r2, .L378+4
	movs	r0, #4
	ldr	r10, .L378+8
	movs	r6, #0
	ldr	r7, [r3]
	movw	r9, #843
	ldr	fp, .L378+16
	ldr	r3, [r7, #16]
	str	r3, [sp, #16]
	ldr	r3, [r4]
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r5, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #830
	str	r3, [sp]
	ldr	r3, .L378+8
	bl	vlog
	mov	r0, r4
	bl	mpi_obj_ref
.L369:
	mov	r1, r4
	mov	r0, r7
	bl	mpi_queue_push_obj
	mov	r8, r0
	cbz	r0, .L371
	ldr	r0, .L378+12
	bl	up
	b	.L366
.L371:
	mov	r0, r7
	bl	mpi_queue_pop_obj
	mov	r6, r0
	cbnz	r0, .L370
	mov	r0, r4
	bl	mpi_obj_unref
	mov	r2, r6
	mov	r1, r4
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
	mov	r6, #-1
.L366:
	mov	r0, r6
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L370:
	ldr	r3, [r0]
	mov	r2, fp
	movs	r1, #5
	movs	r0, #4
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r5, #44]
	ldr	r3, [r3, #44]
	strd	r9, r3, [sp]
	mov	r3, r10
	bl	vlog
	mov	r0, r6
	bl	mpi_obj_unref
	mov	r1, r6
	mov	r2, r8
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
	mov	r6, #-1
	b	.L369
.L374:
	mov	r6, r2
	b	.L366
.L379:
	.align	2
.L378:
	.word	g_venc_dev
	.word	.LC25
	.word	.LANCHOR0+330
	.word	g_venc_dev+196
	.word	.LC26
	.fnend
	.size	venc_handle_message, .-venc_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_release, %function
venc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	ldr	r4, [r1, #128]
	mov	r0, r4
	bl	mpi_obj_unref
	ldr	r3, [r4, #16]
	cmp	r3, #1
	bne	.L381
	ldr	r5, .L412
	ldr	r2, [r4]
	ldr	r1, .L412+4
	ldr	r0, .L412+8
	bl	printk
	ldr	r3, [r5, #220]
	cbz	r3, .L382
	bl	mcu_wrap_end
	movs	r3, #0
	str	r3, [r5, #220]
.L382:
	ldr	r3, [r4, #164]
	cbz	r3, .L383
	cmn	r3, #4096
	bhi	.L383
	movs	r3, #1
	add	r0, r4, #192
	str	r3, [r4, #176]
	bl	up
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L412+12
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2204
	str	r3, [sp]
	ldr	r3, .L412+4
	bl	vlog
	ldr	r0, [r4, #164]
	bl	kthread_stop
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L412+16
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2206
	str	r3, [sp]
	ldr	r3, .L412+4
	bl	vlog
	movs	r3, #0
	str	r3, [r4, #164]
.L383:
	add	r5, r4, #37120
	add	r6, r4, #37120
	adds	r5, r5, #148
	adds	r6, r6, #168
	movs	r7, #0
.L385:
	ldr	r0, [r5], #4
	cbz	r0, .L384
	bl	mpi_obj_unref
	str	r7, [r5, #-4]
.L384:
	cmp	r6, r5
	bne	.L385
	movw	r5, #37812
	ldr	r0, [r4, r5]
	cbz	r0, .L386
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L386:
	movw	r5, #37820
	ldr	r0, [r4, r5]
	cbz	r0, .L387
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L387:
	movs	r0, #0
	bl	get_pp_node
	mov	r5, r0
	cbz	r0, .L388
	movs	r0, #0
	bl	vepu_pp_destroy_chn
	movs	r2, #0
	mov	r1, r2
	movs	r0, #20
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L388:
	movs	r6, #0
.L391:
	mov	r0, r6
	bl	get_venc_node
	mov	r5, r0
	cbz	r0, .L390
	mov	r2, r6
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L390:
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L391
	subs	r5, r4, #4
	mov	r2, #36096
	movs	r1, #0
	add	r0, r4, #352
	bl	memset
	add	r0, r5, #36352
	mov	r2, #384
	movs	r1, #0
	adds	r0, r0, #100
	bl	memset
	add	r0, r5, #36608
	mov	r2, #256
	movs	r1, #0
	adds	r0, r0, #228
	bl	memset
	add	r0, r5, #36864
	movs	r2, #172
	movs	r1, #0
	adds	r0, r0, #236
	bl	memset
	add	r0, r5, #64512
	movs	r2, #36
	movs	r1, #0
	adds	r0, r0, #160
	bl	memset
	add	r0, r5, #37888
	mov	r2, r6
	mov	r1, #-1
	adds	r0, r0, #80
	bl	memset
	add	r0, r5, #37888
	movs	r2, #64
	movs	r1, #0
	adds	r0, r0, #96
	bl	memset
	add	r0, r5, #37888
	mov	r2, #12800
	movs	r1, #0
	adds	r0, r0, #160
	bl	memset
	add	r0, r5, #50688
	mov	r2, #12800
	movs	r1, #0
	adds	r0, r0, #160
	bl	memset
	add	r0, r5, #37888
	mov	r2, r6
	movs	r1, #0
	adds	r0, r0, #64
	bl	memset
	bl	mpp_vcodec_clear_buf_resource
.L381:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L413:
	.align	2
.L412:
	.word	g_venc_dev
	.word	.LANCHOR0+358
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.fnend
	.size	venc_release, .-venc_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_ioctl, %function
venc_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r3, r2
	ldr	r2, [r0, #128]
	uxtb	r4, r1
	ldr	r6, [r2, #160]
	ldr	r5, [r6, #192]
	cmp	r5, r4
	bhi	.L415
	movw	r3, #2113
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L418
	movs	r0, #4
	ldr	r2, .L418+4
	bl	vlog
.L416:
	movw	r3, #2129
	ldr	r2, .L418+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L418
	movs	r0, #4
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L415:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r6, #188]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r4, r5, r4, r2
	cbnz	r4, .L417
	movw	r3, #2120
	ldr	r2, .L418+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L418
	movs	r0, #4
	bl	vlog
	b	.L416
.L417:
	mov	r2, r1
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L419:
	.align	2
.L418:
	.word	.LANCHOR0+371
	.word	.LC30
	.word	.LC32
	.word	.LC31
	.fnend
	.size	venc_ioctl, .-venc_ioctl
	.align	1
	.global	vcodec_notify_drop_frm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify_drop_frm, %function
vcodec_notify_drop_frm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #15
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	bls	.L421
	movs	r3, #16
	ldr	r2, .L429
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #961
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L429+4
	bl	vlog
	mov	r0, #-1
.L420:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L421:
	ldr	r3, .L429+8
	add	r2, r0, #15872
	adds	r2, r2, #40
	ldr	r2, [r3, r2, lsl #2]
	cmp	r2, #9
	beq	.L423
	cmp	r2, #15
	bne	.L424
.L423:
	add	r3, r3, r0, lsl #4
	movw	r2, #36844
	movs	r0, #0
	ldr	r2, [r3, r2]
	cmp	r2, #0
	ble	.L420
	movw	r2, #36848
	str	r0, [r3, r2]
	b	.L420
.L424:
	movs	r0, #0
	b	.L420
.L430:
	.align	2
.L429:
	.word	.LC1
	.word	.LANCHOR0+382
	.word	g_venc_dev
	.fnend
	.size	vcodec_notify_drop_frm, .-vcodec_notify_drop_frm
	.align	1
	.global	venc_node_set_combo
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_combo, %function
venc_node_set_combo:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #8]	@ unaligned
	ldr	r3, [r0, #128]
	cmp	r2, #12
	beq	.L432
	movw	r3, #1698
	ldr	r2, .L436
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L436+4
	movs	r0, #4
	bl	vlog
.L435:
	mov	r0, #-1
.L431:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L432:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #15
	ble	.L434
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1703
	ldr	r2, .L436+8
	str	r3, [sp]
	ldr	r3, .L436+4
	bl	vlog
	b	.L435
.L434:
	add	r3, r3, r2, lsl #4
	movw	r2, #36832
	movs	r0, #1
	str	r0, [r3, r2]
	movw	r2, #36836
	ldr	r1, [r1, #4]	@ unaligned
	movs	r0, #0
	str	r1, [r3, r2]
	b	.L431
.L437:
	.align	2
.L436:
	.word	.LC33
	.word	.LANCHOR0+405
	.word	.LC1
	.fnend
	.size	venc_node_set_combo, .-venc_node_set_combo
	.align	1
	.global	venc_node_set_snap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_snap, %function
venc_node_set_snap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r2, [r0, #128]
	cmp	r3, #12
	beq	.L439
	mov	r3, #1720
	ldr	r2, .L444
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L444+4
	movs	r0, #4
	bl	vlog
.L443:
	mov	r0, #-1
.L438:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L439:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L441
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1725
	ldr	r2, .L444+8
	str	r3, [sp]
	ldr	r3, .L444+4
	bl	vlog
	b	.L443
.L441:
	ldr	r5, [r1, #4]	@ unaligned
	add	r0, r2, r3, lsl #4
	movw	r4, #36840
	str	r5, [r0, r4]
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #4]	@ unaligned
	cmp	r1, #0
	itttt	gt
	addgt	r3, r3, #9472
	addgt	r3, r3, #24
	addgt	r3, r2, r3, lsl #2
	strgt	r1, [r3, #-4]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L438
.L445:
	.align	2
.L444:
	.word	.LC34
	.word	.LANCHOR0+425
	.word	.LC1
	.fnend
	.size	venc_node_set_snap, .-venc_node_set_snap
	.align	1
	.global	venc_node_set_framerate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_framerate, %function
venc_node_set_framerate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #16
	beq	.L447
	movw	r3, #1745
	ldr	r2, .L452
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L452+4
	movs	r0, #4
	bl	vlog
.L451:
	mov	r4, #-1
.L446:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L447:
	ldr	r4, [r1]	@ unaligned
	cmp	r4, #15
	ble	.L449
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1750
	ldr	r2, .L452+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L452+4
	bl	vlog
	b	.L451
.L449:
	cbnz	r4, .L450
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r0, [r0, #128]
	str	r3, [r0, #208]
	ldr	r2, [r1, #12]	@ unaligned
	movs	r1, #4
	str	r2, [r0, #212]
	mov	r0, r1
	strd	r3, r2, [sp, #4]
	movw	r3, #1756
	ldr	r2, .L452+12
	str	r3, [sp]
	ldr	r3, .L452+4
	bl	vlog
	b	.L446
.L450:
	movs	r4, #0
	b	.L446
.L453:
	.align	2
.L452:
	.word	.LC35
	.word	.LANCHOR0+444
	.word	.LC1
	.word	.LC36
	.fnend
	.size	venc_node_set_framerate, .-venc_node_set_framerate
	.align	1
	.global	venc_node_check
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_check, %function
venc_node_check:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #16
	beq	.L455
	movw	r3, #1459
	ldr	r2, .L459
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L459+4
	movs	r0, #4
	bl	vlog
.L458:
	mov	r0, #-1
.L454:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L455:
	ldr	r0, [r1, #4]	@ unaligned
	cmp	r0, #15
	ble	.L457
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1463
	ldr	r2, .L459+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L459+4
	bl	vlog
	b	.L458
.L457:
	bl	get_venc_node
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L454
.L460:
	.align	2
.L459:
	.word	.LC12
	.word	.LANCHOR0+468
	.word	.LC1
	.fnend
	.size	venc_node_check, .-venc_node_check
	.align	1
	.global	mpi_buf_get_paddr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_paddr, %function
mpi_buf_get_paddr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L463
	ldr	r0, [r0, #608]
	cmp	r0, #0
	bgt	.L461
	ldr	r0, [r4, #448]
	bl	get_dma_buf_phy_addr
	str	r0, [r4, #608]
.L461:
	pop	{r4, pc}
.L463:
	mov	r0, #-1
	b	.L461
	.fnend
	.size	mpi_buf_get_paddr, .-mpi_buf_get_paddr
	.align	1
	.global	venc_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_get_version, %function
venc_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r6, [r3, #160]
	ldr	r3, [r1, #32]	@ unaligned
	cmp	r3, #76
	beq	.L465
	movw	r3, #1438
	ldr	r2, .L469
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L469+4
	movs	r0, #4
	bl	vlog
	mov	r0, #-1
.L464:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L465:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r1, #1]
	strb	r3, [r1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
	strb	r5, [r1, #36]
	strb	r5, [r1, #37]
	strb	r5, [r1, #38]
	strb	r5, [r1, #39]
	strb	r5, [r1, #56]
	strb	r5, [r1, #57]
	strb	r5, [r1, #58]
	strb	r5, [r1, #59]
	ldr	r0, [r6]
	bl	strlen
	cmp	r0, #16
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	strbhi	r5, [r4, #14]
	movhi	r3, #16
	strbhi	r5, [r4, #15]
	strbhi	r3, [r4, #12]
	ldr	r2, [r4, #12]	@ unaligned
	ldr	r1, [r6]
	bl	strncpy
	movs	r0, #0
	b	.L464
.L470:
	.align	2
.L469:
	.word	.LC37
	.word	.LANCHOR0+484
	.fnend
	.size	venc_get_version, .-venc_get_version
	.align	1
	.global	venc_node_set_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_crop, %function
venc_node_set_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #12]	@ unaligned
	ldr	r0, [r0, #128]
	cmp	r2, #24
	beq	.L472
	movw	r3, #1634
	ldr	r2, .L478
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L478+4
	movs	r0, #4
	bl	vlog
.L477:
	mov	r0, #-1
.L471:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L472:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L474
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1639
	ldr	r2, .L478+8
	str	r3, [sp]
	ldr	r3, .L478+4
	bl	vlog
	b	.L477
.L474:
	mla	r3, r2, r3, r0
	add	r2, r1, #24
	add	r3, r3, #36352
	adds	r3, r3, #96
.L475:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L475
	movs	r0, #0
	b	.L471
.L479:
	.align	2
.L478:
	.word	.LC38
	.word	.LANCHOR0+501
	.word	.LC1
	.fnend
	.size	venc_node_set_crop, .-venc_node_set_crop
	.align	1
	.global	venc_node_get_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_crop, %function
venc_node_get_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #12]	@ unaligned
	ldr	r0, [r0, #128]
	cmp	r2, #24
	beq	.L481
	movw	r3, #1653
	ldr	r2, .L487
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L487+4
	movs	r0, #4
	bl	vlog
.L486:
	mov	r0, #-1
.L480:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L481:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L483
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1658
	ldr	r2, .L487+8
	str	r3, [sp]
	ldr	r3, .L487+4
	bl	vlog
	b	.L486
.L483:
	mla	r3, r2, r3, r0
	add	r3, r3, #36352
	adds	r3, r3, #96
	add	r2, r3, #24
.L484:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L484
	movs	r0, #0
	b	.L480
.L488:
	.align	2
.L487:
	.word	.LC38
	.word	.LANCHOR0+520
	.word	.LC1
	.fnend
	.size	venc_node_get_crop, .-venc_node_get_crop
	.align	1
	.global	venc_node_pp_set_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_set_md_attr, %function
venc_node_pp_set_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #4]	@ unaligned
	ldr	r3, [r0, #128]
	cmp	r2, #36
	beq	.L490
	movw	r3, #1973
	ldr	r2, .L496
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L496+4
	movs	r0, #4
	bl	vlog
.L495:
	mov	r0, #-1
.L489:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L490:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #0
	ble	.L492
	movs	r3, #1
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1978
	ldr	r2, .L496+8
	str	r3, [sp]
	ldr	r3, .L496+4
	bl	vlog
	b	.L495
.L492:
	add	r3, r3, #64512
	add	r2, r1, #36
	adds	r3, r3, #156
.L493:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L493
	movs	r0, #0
	b	.L489
.L497:
	.align	2
.L496:
	.word	.LC0
	.word	.LANCHOR0+539
	.word	.LC1
	.fnend
	.size	venc_node_pp_set_md_attr, .-venc_node_pp_set_md_attr
	.align	1
	.global	venc_node_pp_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_create, %function
venc_node_pp_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r3, [r1, #8]	@ unaligned
	.pad #80
	sub	sp, sp, #80
	cmp	r3, #60
	beq	.L499
	movw	r3, #1774
	ldr	r2, .L524
	str	r3, [sp]
	ldr	r3, .L524+4
.L521:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L522
.L499:
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #0
	ble	.L501
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1778
	ldr	r2, .L524+8
	str	r3, [sp]
	ldr	r3, .L524+4
	bl	vlog
.L522:
	mov	r8, #-1
.L498:
	mov	r0, r8
	add	sp, sp, #80
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L501:
	ldr	r3, [r1, #16]	@ unaligned
	movw	r2, #37168
	ldr	r8, .L524+44
	movs	r4, #0
	sbfx	r3, r3, #1, #29
	ldr	r7, .L524+12
	adds	r3, r3, #3
	sub	r5, r8, #104
	asrs	r3, r3, #2
	lsls	r3, r3, #6
	str	r3, [r7, r2]
.L505:
	ldr	r0, [r5]
	bl	mpi_buf_alloc
	str	r0, [r8], #4
	cbnz	r0, .L502
	movw	r3, #1788
.L523:
	str	r3, [sp]
	ldr	r2, .L524+16
	ldr	r3, .L524+4
	b	.L521
.L502:
	ldr	r0, [r0, #604]
	cbnz	r0, .L504
	mov	r3, #1792
	b	.L523
.L504:
	ldr	r2, [r5]
	movs	r1, #0
	adds	r4, r4, #1
	bl	memset
	cmp	r4, #5
	bne	.L505
	ldr	r3, [r6, #20]	@ unaligned
	cbz	r3, .L506
	ldr	r4, [r6, #12]	@ unaligned
	sbfx	r4, r4, #1, #29
	adds	r4, r4, #3
	asrs	r4, r4, #2
	adds	r4, r4, #7
	asrs	r3, r4, #3
	ldr	r4, [r6, #16]	@ unaligned
	sbfx	r4, r4, #1, #29
	adds	r4, r4, #15
	asrs	r4, r4, #4
	muls	r4, r3, r4
	lsls	r4, r4, #6
	mov	r0, r4
	bl	mpi_buf_alloc
	movw	r3, #37816
	str	r0, [r7, r3]
	cbnz	r0, .L507
.L508:
	movw	r3, #1804
	b	.L523
.L507:
	mov	r0, r4
	bl	mpi_buf_alloc
	movw	r3, #37824
	str	r0, [r7, r3]
	cmp	r0, #0
	beq	.L508
.L506:
	ldr	r3, [r6, #12]	@ unaligned
	add	r1, sp, #20
	ldr	r0, [r6, #4]	@ unaligned
	movs	r4, #1
	str	r4, [sp, #44]
	str	r3, [sp, #20]
	ldr	r3, [r6, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r6, #28]	@ unaligned
	str	r3, [sp, #36]
	ldr	r3, [r6, #32]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r6, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r6, #24]	@ unaligned
	str	r3, [sp, #32]
	bl	vepu_pp_create_chn
	mov	r8, r0
	cbz	r0, .L509
	movw	r3, #1819
	b	.L523
.L509:
	mov	r3, r0
	mov	r2, r4
	ldr	r1, [r6, #4]	@ unaligned
	ldr	r0, .L524+20
	bl	mpi_dev_create_node_with_params
	mov	ip, r0
	cbnz	r0, .L510
	movw	r3, #1825
	ldr	r2, .L524+24
	str	r3, [sp]
	ldr	r3, .L524+4
	b	.L521
.L510:
	add	r4, sp, #20
	add	r5, r7, #36864
	adds	r5, r5, #236
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	mov	r3, r6
	ldm	r4, {r0, r1, r2}
	stm	r5, {r0, r1, r2}
	add	r5, r6, #56
	ldr	r2, .L524+28
.L511:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r5
	mov	r4, r2
	stmia	r4!, {r0, r1}
	mov	r2, r4
	bne	.L511
	ldr	r0, [r3]	@ unaligned
	mov	r3, ip
	str	r0, [r4]
	movs	r0, #20
	ldr	r2, [r6, #4]	@ unaligned
	ldr	r1, [r6]	@ unaligned
	bl	vsys_add_node_to_map
	movs	r3, #0
	mov	r2, #-1
	str	r3, [r7, #180]
	ldr	r1, .L524+12
	ldr	r3, .L524+32
	ldr	r0, .L524+36
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L512
	bl	wake_up_process
.L512:
	movs	r1, #4
	movw	r3, #1836
	str	r4, [sp, #4]
	mov	r0, r1
	str	r3, [sp]
	ldr	r2, .L524+40
	ldr	r3, .L524+4
	str	r4, [r7, #168]
	bl	vlog
	b	.L498
.L525:
	.align	2
.L524:
	.word	.LC39
	.word	.LANCHOR0+564
	.word	.LC1
	.word	g_venc_dev
	.word	.LC40
	.word	g_venc_dev+4
	.word	.LC41
	.word	g_venc_dev+37212
	.word	.LC9
	.word	venc_thread_fn
	.word	.LC42
	.word	g_venc_dev+37272
	.fnend
	.size	venc_node_pp_create, .-venc_node_pp_create
	.align	1
	.global	venc_node_pp_get_result
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_result, %function
venc_node_pp_get_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r1
	ldr	r3, [r1, #4]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r0, #128]
	cmp	r3, #32
	beq	.L527
	movw	r3, #1941
	ldr	r2, .L545
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L545+4
	movs	r0, #4
	bl	vlog
.L544:
	mov	r0, #-1
.L526:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L527:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #0
	ble	.L529
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1946
	ldr	r2, .L545+8
	str	r3, [sp]
	ldr	r3, .L545+4
	bl	vlog
	b	.L544
.L529:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #37156
	ldr	r6, [r4, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #37112
	ldr	r3, [r4, r3]
	cbz	r3, .L530
	ldr	r3, [r1, #8]	@ unaligned
	cbz	r3, .L530
	movw	r3, #37164
	add	r6, r4, r6, lsl #2
	ldr	r3, [r4, r3]
	movw	r7, #37268
	str	r3, [r1, #20]	@ unaligned
	movs	r1, #0
	ldr	r3, [r6, r7]
	ldr	r0, [r3, #448]
	bl	dma_buf_fd
	str	r0, [r5, #16]	@ unaligned
	ldr	r3, [r6, r7]
	ldr	r3, [r3, #448]
	ldr	r3, [r3, #4]
	add	r2, r3, #28
	pld	[r2]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
.L530:
	movw	r3, #37116
	ldr	r3, [r4, r3]
	cbz	r3, .L531
	ldr	r3, [r5, #12]	@ unaligned
	cbz	r3, .L531
	movw	r3, #37168
	ldr	r3, [r4, r3]
	str	r3, [r5, #24]	@ unaligned
	movw	r3, #37172
	ldr	r3, [r4, r3]
	str	r3, [r5, #28]	@ unaligned
.L531:
	movw	r3, #37160
	movs	r0, #0
	str	r0, [r4, r3]
	b	.L526
.L546:
	.align	2
.L545:
	.word	.LC43
	.word	.LANCHOR0+584
	.word	.LC1
	.fnend
	.size	venc_node_pp_get_result, .-venc_node_pp_get_result
	.align	1
	.global	vcodec_create_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_create_dev, %function
vcodec_create_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L552
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	mov	r5, r1
	ldr	r0, [r3, #8]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L547
	ldr	r3, [r5]
	mov	r2, r6
	movs	r1, #8
	str	r3, [r0, #68]
	ldr	r3, [r5, #8]
	str	r3, [r0, #80]
	ldr	r3, [r5, #4]
	str	r3, [r0, #76]
	bl	mpi_dev_register
.L547:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L553:
	.align	2
.L552:
	.word	kmalloc_caches
	.fnend
	.size	vcodec_create_dev, .-vcodec_create_dev
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_create_ctx, %function
venc_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r1, #3520
	ldr	r3, .L559
	ldr	r0, [r3, #12]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L554
	ldr	r2, .L559+4
	movs	r1, #4
	movs	r0, #1
	bl	mpi_queue_create
	mov	r5, r0
	str	r0, [r4]
	cbnz	r0, .L554
	mov	r0, r4
	mov	r4, r5
	bl	kfree
.L554:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L560:
	.align	2
.L559:
	.word	kmalloc_caches
	.word	mpi_obj_unref
	.fnend
	.size	venc_create_ctx, .-venc_create_ctx
	.align	1
	.global	venc_node_pp_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_delete, %function
venc_node_pp_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	ldr	r6, [r1]
	ldr	r4, [r0, #128]
	cmp	r6, #0
	ble	.L562
	movs	r3, #1
	ldr	r2, .L586
	strd	r6, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1849
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L586+4
	bl	vlog
	mov	r0, #-1
.L561:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L562:
	ldr	r3, [r4, #164]
	cbz	r3, .L564
	cmn	r3, #4096
	bhi	.L564
	movs	r3, #1
	add	r0, r4, #192
	str	r3, [r4, #176]
	bl	up
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L586+8
	mov	r0, r1
	str	r3, [sp, #4]
	mov	r3, #1856
	str	r3, [sp]
	ldr	r3, .L586+4
	bl	vlog
	ldr	r0, [r4, #164]
	bl	kthread_stop
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L586+12
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #1858
	str	r3, [sp]
	ldr	r3, .L586+4
	bl	vlog
	movs	r3, #0
	str	r3, [r4, #164]
.L564:
	add	r5, r4, #37120
	add	r7, r4, #37120
	adds	r5, r5, #148
	adds	r7, r7, #168
	mov	r8, #0
.L566:
	ldr	r0, [r5], #4
	cbz	r0, .L565
	bl	mpi_obj_unref
	str	r8, [r5, #-4]
.L565:
	cmp	r5, r7
	bne	.L566
	movw	r5, #37812
	ldr	r0, [r4, r5]
	cbz	r0, .L567
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L567:
	movw	r5, #37820
	ldr	r0, [r4, r5]
	cbz	r0, .L568
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L568:
	mov	r0, r6
	bl	vepu_pp_destroy_chn
	mov	r0, r6
	bl	get_pp_node
	mov	r5, r0
	cbz	r0, .L569
	mov	r2, r6
	movs	r1, #0
	movs	r0, #20
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L569:
	add	r0, r4, #64512
	movs	r2, #36
	movs	r1, #0
	adds	r0, r0, #156
	bl	memset
	movs	r0, #0
	b	.L561
.L587:
	.align	2
.L586:
	.word	.LC1
	.word	.LANCHOR0+608
	.word	.LC28
	.word	.LC29
	.fnend
	.size	venc_node_pp_delete, .-venc_node_pp_delete
	.align	1
	.global	to_osd_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_stride, %function
to_osd_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r0, r0, #65536
	subs	r0, r0, #10
	cmp	r0, #16
	bhi	.L594
	movs	r2, #1
	movw	r3, #15375
	lsl	r0, r2, r0
	ands	r3, r0, r3
	bne	.L592
	tst	r0, #960
	bne	.L593
	lsls	r3, r0, #15
	bpl	.L594
	movs	r0, #2
	mov	r3, r2
.L590:
	muls	r1, r3, r1
	asr	r0, r1, r0
	bx	lr
.L592:
	movs	r0, #0
	movs	r3, #2
	b	.L590
.L593:
	mov	r0, r3
	movs	r3, #4
	b	.L590
.L594:
	mov	r0, #-1
	bx	lr
	.fnend
	.size	to_osd_stride, .-to_osd_stride
	.align	1
	.global	set_2bpp_color_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_2bpp_color_lut, %function
set_2bpp_color_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r5, #42
	ldr	r2, [r1]
	mvn	r4, #84
	ldr	r3, [r1, #4]
	mvn	r8, #106
	ubfx	ip, r2, #16, #8
	ubfx	r7, r2, #8, #8
	uxtb	r2, r2
	mvn	r9, #20
	mov	r10, #150
	mov	fp, #77
	mul	r1, r5, r2
	ubfx	lr, r3, #16, #8
	ubfx	r6, r3, #8, #8
	uxtb	r3, r3
	add	r1, r1, #32768
	muls	r5, r3, r5
	mla	r1, r4, r7, r1
	add	r5, r5, #32768
	add	r1, r1, ip, lsl #7
	mla	r4, r4, r6, r5
	asrs	r1, r1, #8
	strb	r1, [r0]
	lsls	r1, r2, #7
	add	r1, r1, #32768
	add	r4, r4, lr, lsl #7
	mla	r1, r8, r7, r1
	asrs	r4, r4, #8
	strb	r4, [r0, #3]
	mla	r1, r9, ip, r1
	asrs	r1, r1, #8
	strb	r1, [r0, #1]
	movs	r1, #29
	mul	ip, r1, ip
	mla	r7, r10, r7, ip
	mla	r2, fp, r2, r7
	asrs	r2, r2, #8
	strb	r2, [r0, #2]
	lsls	r2, r3, #7
	add	r2, r2, #32768
	mla	r8, r8, r6, r2
	mla	r9, r9, lr, r8
	mul	lr, r1, lr
	mla	r6, r10, r6, lr
	asr	r9, r9, #8
	strb	r9, [r0, #4]
	mla	r3, fp, r3, r6
	asrs	r3, r3, #8
	strb	r3, [r0, #5]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	set_2bpp_color_lut, .-set_2bpp_color_lut
	.align	1
	.global	set_invert_buffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_invert_buffer, %function
set_invert_buffer:
	.fnstart
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldrd	r4, r6, [sp, #56]
	strd	r1, r2, [sp]
	str	r3, [sp, #8]
	cmp	r4, #0
	beq	.L597
	cmp	r0, #0
	beq	.L614
	cmp	r6, #0
	beq	.L615
	ldr	r3, [r4, #604]
	cmp	r3, #0
	beq	.L616
	ldr	r2, [r6, #12]
	cbz	r2, .L598
	cmp	r2, #1
	bne	.L599
	mov	ip, #0
	mov	lr, r0
	mov	r8, ip
	str	r2, [sp, #12]
.L600:
	ldr	r2, [sp, #4]
	cmp	r8, r2
	bge	.L599
	mov	r10, lr
	movs	r5, #0
	b	.L613
.L598:
	mov	lr, r0
	mov	r8, r2
.L601:
	ldr	r1, [sp, #4]
	cmp	r8, r1
	bge	.L599
	mov	r10, lr
	mov	ip, #0
	b	.L607
.L605:
	add	r9, r2, ip, lsr #3
	and	r5, ip, #7
	movs	r1, #1
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	lsl	r5, r1, r5
	ldr	r7, [r6, #8]
	ldrsb	r1, [r3, r9]
	add	ip, ip, #1
	sxtb	r5, r5
	cmp	fp, r7
	ite	cc
	orrcc	r1, r1, r5
	biccs	r1, r1, r5
	strb	r1, [r3, r9]
.L607:
	ldr	r1, [sp]
	cmp	ip, r1
	blt	.L605
	add	lr, lr, r1
	ldr	r1, [sp, #8]
	add	r8, r8, #1
	add	r2, r2, r1
	b	.L601
.L611:
	ldr	r2, [sp, #12]
	add	r9, ip, r5, lsr #3
	and	r1, r5, #7
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	ldr	r7, [r6, #8]
	adds	r5, r5, #1
	lsl	r1, r2, r1
	ldrsb	r2, [r3, r9]
	cmp	fp, r7
	sxtb	r1, r1
	ite	hi
	orrhi	r2, r2, r1
	bicls	r2, r2, r1
	strb	r2, [r3, r9]
.L613:
	ldr	r2, [sp]
	cmp	r5, r2
	blt	.L611
	add	lr, lr, r2
	ldr	r2, [sp, #8]
	add	r8, r8, #1
	add	ip, ip, r2
	b	.L600
.L599:
	bl	kfree
	ldr	r1, [r4, #604]
	ldr	r0, [r4, #448]
	bl	dma_buf_vunmap
	movs	r3, #0
	str	r3, [r4, #604]
.L597:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L614:
	mov	r4, r0
	b	.L597
.L615:
	mov	r4, r6
	b	.L597
.L616:
	mov	r4, r3
	b	.L597
	.fnend
	.size	set_invert_buffer, .-set_invert_buffer
	.align	1
	.global	create_lingt_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	create_lingt_lut, %function
create_lingt_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r1, #3520
	mov	r4, r0
	bl	__kmalloc
	cbnz	r0, .L626
.L622:
	pop	{r4, pc}
.L625:
	strb	r3, [r0, r3]
	adds	r3, r3, #1
.L623:
	cmp	r3, r4
	blt	.L625
	b	.L622
.L626:
	movs	r3, #0
	b	.L623
	.fnend
	.size	create_lingt_lut, .-create_lingt_lut
	.global	__aeabi_uidiv
	.align	1
	.global	to_osd_invert_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_invert_cfg, %function
to_osd_invert_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r4, r0
	ldr	r7, [r1, #12]
	mov	r6, r1
	ldr	r5, [r1, #72]
	ldr	r0, [r7, #40]
	subs	r3, r5, #1
	mov	r1, r5
	add	r3, r3, r0
	rsbs	r0, r5, #0
	ands	r0, r0, r3
	bl	__aeabi_uidiv
	ldr	r1, [r6, #76]
	subs	r3, r1, #1
	mov	r8, r0
	ldr	r0, [r7, #44]
	add	r7, r8, #7
	add	r3, r3, r0
	rsbs	r0, r1, #0
	ands	r0, r0, r3
	asrs	r7, r7, #3
	bl	__aeabi_uidiv
	cmp	r5, #32
	mov	r9, r0
	mul	r10, r0, r8
	beq	.L628
	cmp	r5, #64
	beq	.L629
	cmp	r5, #16
	bne	.L630
	movs	r3, #0
.L634:
	str	r3, [r4, #20]
.L631:
	movs	r3, #0
	movs	r2, #1
	str	r3, [r4, #8]
	mov	r0, r10
	strd	r2, r2, [r4]
	strd	r3, r3, [r4, #12]
	str	r7, [r4, #24]
	bl	create_lingt_lut
	cbnz	r0, .L632
	movw	r3, #530
	ldr	r2, .L635
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L635+4
	movs	r0, #4
	bl	vlog
.L627:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L628:
	movs	r3, #1
	b	.L634
.L629:
	movs	r3, #3
	b	.L634
.L630:
	ldr	r0, .L635+8
	bl	printk
	b	.L631
.L632:
	add	r3, r6, #72
	str	r3, [sp, #4]
	ldr	r3, [r6, #16]
	mov	r2, r9
	mov	r1, r8
	str	r3, [sp]
	mov	r3, r7
	bl	set_invert_buffer
	str	r0, [r4, #32]
	b	.L627
.L636:
	.align	2
.L635:
	.word	.LC45
	.word	.LANCHOR0+628
	.word	.LC44
	.fnend
	.size	to_osd_invert_cfg, .-to_osd_invert_cfg
	.align	1
	.global	set_osd_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_osd_data, %function
set_osd_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r0
	ldr	r3, [r1, #104]
	mov	r9, r1
	cbnz	r3, .L638
	str	r3, [r0, #4]
.L637:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L638:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, [r1, #84]
	movs	r6, #0
	subs	r4, r4, #4
.L640:
	adds	r3, r4, #4
	add	r2, r9, #84
	cmp	r3, r2
	bne	.L656
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	str	r6, [r5, #4]
	b	.L637
.L656:
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #1752]
	cmp	r3, #0
	beq	.L641
	movs	r3, #140
	ldr	r2, [r4, #20]
	mla	r3, r3, r6, r5
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
	str	r2, [r3, #8]
	ldr	r2, [r4, #28]
	str	r2, [r3, #28]
	ldr	r2, [r4, #32]
	str	r2, [r3, #32]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #28]
	ldr	r2, [r2, #40]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #36]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #32]
	ldr	r2, [r2, #44]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #40]
	ldr	r2, [r4, #12]
	ldr	r0, [r2, #1752]
	str	r0, [r3, #136]
	cbz	r0, .L642
	bl	mpi_obj_ref
.L642:
	ldr	r3, [r4, #12]
	movs	r7, #140
	ldrd	r0, r1, [r3, #36]
	bl	to_osd_stride
	movs	r3, #140
	mla	r3, r3, r6, r5
	movs	r1, #1
	add	r10, r6, r1
	str	r0, [r3, #44]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	itet	ls
	ldrls	r2, .L679
	movhi	r3, #-1
	addls	r3, r2, r3, lsl #2
	mla	r2, r7, r6, r5
	it	ls
	ldrls	r3, [r3, #648]
	mul	r7, r7, r10
	str	r3, [r2, #20]
	movs	r3, #0
	strd	r3, r1, [r2, #12]
	add	r8, r5, r7
	ldrd	r2, r0, [r4, #36]
	strb	r3, [r5, r7]
	strb	r3, [r8, #1]
	strb	r3, [r8, #2]
	strb	r3, [r8, #3]
	strb	r3, [r8, #4]
	strb	r3, [r8, #5]
	strb	r0, [r8, #6]
	strb	r2, [r8, #7]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L644
	lsl	r3, r1, r3
	movw	r2, #9797
	ands	r2, r3, r2
	bne	.L645
	ldr	r1, .L679+4
	tst	r3, r1
	bne	.L659
.L644:
	ldr	r0, .L679+8
	bl	printk
	mov	r1, #-1
.L645:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r1, [r2, #24]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L646
	movs	r1, #1
	lsl	r3, r1, r3
	ands	r2, r3, #207
	bne	.L647
	ldr	r1, .L679+12
	tst	r3, r1
	bne	.L661
.L646:
	ldr	r0, .L679+16
	bl	printk
	mov	r1, #-1
.L647:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r1, [r2, #92]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L648
	movs	r2, #1
	movw	r1, #13260
	lsl	r3, r2, r3
	tst	r3, r1
	bne	.L662
	ldr	r1, .L679+20
	tst	r3, r1
	bne	.L649
.L648:
	movw	r3, #395
	ldr	r2, .L679+24
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L679+28
	movs	r0, #4
	bl	vlog
.L662:
	movs	r2, #0
.L649:
	movs	r3, #140
	mla	r3, r3, r6, r5
	str	r2, [r3, #104]
	ldr	r2, [r4, #40]
	str	r2, [r3, #96]
	ldr	r2, [r4, #36]
	str	r2, [r3, #100]
	ldr	r3, [r3, #20]
	cmp	r3, #17
	bne	.L650
	add	r1, r4, #64
	mov	r0, r8
	bl	set_2bpp_color_lut
.L650:
	ldr	r3, [r4, #88]
	cbz	r3, .L652
	ldr	r3, [r4, #16]
	cbz	r3, .L652
	sub	r0, r7, #84
	mov	r1, r4
	add	r0, r0, r5
	bl	to_osd_invert_cfg
	movs	r3, #140
	mla	r3, r3, r6, r5
	ldr	r0, [r3, #88]
	cbz	r0, .L652
	bl	mpi_obj_ref
.L652:
	ldr	r3, [r4, #48]
	cbz	r3, .L654
	movs	r3, #140
	movs	r2, #1
	mla	r6, r3, r6, r5
	movs	r1, #51
	movs	r3, #0
	str	r2, [r6, #108]
	strd	r1, r3, [r6, #120]
	ldr	r3, [r4, #60]
	str	r3, [r6, #116]
	ldr	r3, [r4, #52]
	cmp	r3, #0
	it	ne
	movne	r3, r2
	str	r3, [r6, #112]
.L654:
	mov	r6, r10
.L641:
	ldr	r4, [r4, #4]
	subs	r4, r4, #4
	b	.L640
.L659:
	mov	r1, r2
	b	.L645
.L661:
	mov	r1, r2
	b	.L647
.L680:
	.align	2
.L679:
	.word	.LANCHOR0
	.word	72074
	.word	.LC46
	.word	81664
	.word	.LC47
	.word	68611
	.word	.LC48
	.word	.LANCHOR0+716
	.fnend
	.size	set_osd_data, .-set_osd_data
	.align	1
	.global	mpi_buf_ref_with_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref_with_node, %function
mpi_buf_ref_with_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	.save {r4, r5, r6, r7}
	cbz	r0, .L681
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r6, .L687
	movs	r2, #0
	movs	r3, #12
.L685:
	mul	r4, r3, r2
	ldr	r7, [r4, r6]
	cbnz	r7, .L683
	ldr	r3, .L687+4
	movw	r2, #64708
	add	r3, r3, r4
	str	r0, [r3, r2]
	movw	r2, #64716
	ldr	r1, [r1, #76]
	str	r1, [r3, r2]
	movw	r1, #64712
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L684:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7}
	b	mpi_obj_ref
.L683:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L685
	b	.L684
.L681:
	pop	{r4, r5, r6, r7}
	bx	lr
.L688:
	.align	2
.L687:
	.word	g_venc_dev+64708
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref_with_node, .-mpi_buf_ref_with_node
	.align	1
	.global	vcodec_handle_message
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_handle_message, %function
vcodec_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r3, [r0, #8]
	.pad #28
	sub	sp, sp, #28
	mov	r7, r1
	mov	r5, r2
	cmp	r3, #1
	beq	.L720
.L760:
	movs	r7, #0
.L732:
	mov	r0, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L720:
	movs	r6, #0
.L690:
	mov	r0, r6
	bl	get_venc_node
	cmp	r8, r0
	beq	.L692
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L690
	mov	r3, #696
	mov	r2, #-1
	strd	r3, r2, [sp]
	ldr	r3, .L762
	ldr	r2, .L762+4
.L761:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L760
.L692:
	ldr	r3, [r8, #288]
	ldr	r10, [r3]
	cmp	r10, #0
	bne	.L757
	movw	r3, #702
	str	r6, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L762+8
	ldr	r3, .L762
	b	.L761
.L757:
	cmp	r7, #1
	beq	.L696
	subs	r3, r7, #7
	rsbs	r7, r3, #0
	adcs	r7, r7, r3
	b	.L732
.L696:
	cmp	r5, #0
	beq	.L760
	ldr	r4, .L762+12
	add	r9, r6, #54
	add	r3, r4, r9, lsl #2
	ldr	r3, [r3, #4]
	cbz	r3, .L698
	ldr	r0, [r4, #212]
	cbz	r0, .L699
	ldr	r1, [r4, #216]
	cbz	r1, .L699
	add	r3, r8, #144
	add	r2, r8, #152
	bl	mpi_node_set_frame_rate
	movs	r3, #0
	strd	r3, r3, [r4, #212]
.L699:
	ldr	r3, [r4, #332]
	ldr	r2, [r5, #668]
	cmp	r3, r2
	beq	.L700
	movs	r1, #4
	strd	r3, r2, [sp, #4]
	mov	r0, r1
	movw	r3, #726
	ldr	r2, .L762+16
	str	r3, [sp]
	ldr	r3, .L762
	bl	vlog
.L700:
	ldr	r3, [r5, #668]
	adds	r3, r3, #1
	str	r3, [r4, #332]
.L698:
	ldr	r3, [r4, #324]
	cmp	r3, #0
	ble	.L701
	subs	r3, r3, #1
	str	r3, [r4, #324]
	b	.L760
.L701:
	add	r3, r6, #15872
	adds	r3, r3, #40
	ldr	r3, [r4, r3, lsl #2]
	cmp	r3, #9
	beq	.L702
	cmp	r3, #15
	bne	.L703
.L702:
	add	r3, r4, r6, lsl #4
	movw	r2, #36844
	ldr	r2, [r3, r2]
	cmp	r2, #0
	beq	.L760
	ble	.L703
	movw	r2, #36848
	ldr	r1, [r3, r2]
	cmp	r1, #0
	bne	.L760
	movs	r1, #1
	str	r1, [r3, r2]
.L703:
	adds	r2, r4, r6
	movw	r3, #37952
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L704
	ldr	r3, .L762+20
	mov	ip, #0
.L706:
	ldrb	r2, [r3], #1	@ zero_extendqisi2
	cmp	r2, r6
	beq	.L705
	add	ip, ip, #1
	cmp	ip, #16
	bne	.L706
	b	.L760
.L707:
	add	fp, fp, #1
	cmp	fp, #100
	bne	.L708
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, lr	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L760
.L710:
	str	r5, [r4, #352]
	b	.L712
.L709:
	ldrd	r2, [r5, #672]
	movs	r1, #4
	mov	r0, r1
	mov	r7, #-1
	strd	r2, [sp, #8]
	movw	r3, #770
	ldr	r2, .L762+24
	str	r3, [sp]
	ldr	r3, .L762
	bl	vlog
	mov	r0, r5
	bl	mpi_buf_unref
	b	.L732
.L718:
	strd	r3, r0, [sp, #4]
	movs	r1, #5
	mov	r3, #796
	ldr	r2, .L762+28
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L762
	str	r6, [r4, #328]
	bl	vlog
	b	.L732
.L705:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	lr, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r2, #800
	mov	fp, #0
	mla	r2, r2, ip, r4
	add	r2, r2, #50688
	adds	r2, r2, #160
.L708:
	ldrd	r0, [r2], #8
	orrs	r3, r0, r1
	beq	.L707
	movs	r3, #100
	strd	r0, [r5, #672]
	mla	r3, r3, ip, fp
	movs	r0, #0
	movs	r1, #0
	add	r2, r3, #4736
	add	r3, r3, #6336
	adds	r2, r2, #20
	adds	r3, r3, #20
	add	r2, r4, r2, lsl #3
	add	r3, r4, r3, lsl #3
	strd	r0, [r2]
	strd	r0, [r3]
.L704:
	ldr	r3, [r10, #16]
	movs	r1, #5
	ldr	r2, .L762+32
	movs	r0, #4
	str	r3, [sp, #16]
	ldr	r3, [r5]
	str	r3, [sp, #12]
	ldr	r3, [r8]
	str	r3, [sp, #8]
	ldr	r3, [r8, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #751
	str	r3, [sp]
	ldr	r3, .L762
	bl	vlog
	mov	r1, r8
	mov	r0, r5
	mov	r2, r6
	bl	mpi_buf_ref_with_node
	mov	r1, r5
	mov	r0, r10
	bl	mpi_queue_push_obj
	cbnz	r0, .L713
	add	r3, r4, r9, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L709
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #352]
	cmp	r3, #0
	beq	.L710
	ldr	r2, .L762+36
	ldr	r3, [r2]
	cmp	r3, #19
	add	r1, r3, #1
	str	r1, [r2]
	bgt	.L711
	ldr	r3, [r5, #668]
	movs	r1, #2
	ldr	r2, .L762+40
	movs	r0, #4
	str	r3, [sp, #4]
	mov	r3, #760
	str	r3, [sp]
	ldr	r3, .L762
	bl	vlog
.L711:
	mov	r0, r5
	bl	mpi_buf_unref
.L712:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r7, #-1
.L713:
	ldr	r3, [r4, #320]
	cbz	r3, .L715
	bl	mcu_get_wrap_status
	cmp	r0, #2
	itt	ne
	movne	r3, #0
	strne	r3, [r4, #320]
.L715:
	add	r9, r4, r9, lsl #2
	ldr	r3, [r9, #4]
	cbz	r3, .L717
	ldr	r3, [r4, #320]
	cbnz	r3, .L717
	bl	mcu_wrap_start
	movs	r3, #1
	str	r3, [r4, #320]
	movs	r1, #4
	ldr	r3, [r5, #668]
	mov	r0, r1
	ldr	r2, .L762+44
	str	r3, [sp, #20]
	ldr	r3, [r5, #632]
	str	r3, [sp, #16]
	ldr	r3, [r5, #628]
	str	r3, [sp, #12]
	ldr	r3, [r5, #624]
	str	r3, [sp, #8]
	ldr	r3, [r5, #620]
	str	r3, [sp, #4]
	mov	r3, #784
	str	r3, [sp]
	ldr	r3, .L762
	bl	vlog
.L717:
	cmp	r6, #0
	bne	.L732
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L732
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L732
	ldr	r3, [r5, #668]
	mov	r0, r6
	strd	r3, r6, [sp]
	ldrd	r2, [r5, #672]
	bl	mpp_vcodec_run_task
	ldrd	r2, [r5, #672]
	strd	r2, [r4, #336]
	ldr	r3, [r5, #668]
	strd	r3, r6, [r4, #344]
	cmp	r0, #0
	bne	.L718
	movs	r3, #1
	str	r3, [r4, #328]
	b	.L732
.L763:
	.align	2
.L762:
	.word	.LANCHOR0+736
	.word	.LC49
	.word	.LC50
	.word	g_venc_dev
	.word	.LC51
	.word	g_venc_dev+37968
	.word	.LC53
	.word	.LC55
	.word	.LC56
	.word	.LANCHOR1
	.word	.LC52
	.word	.LC54
	.fnend
	.size	vcodec_handle_message, .-vcodec_handle_message
	.global	__aeabi_idiv
	.align	1
	.global	to_frame_pixel_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_pixel_stride, %function
to_frame_pixel_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r0
	cmp	r3, #65537
	mov	r0, r1
	bhi	.L765
	cmp	r3, #65536
	bcs	.L768
	cmp	r3, #8
	beq	.L768
	cmp	r3, #10
	ite	eq
	moveq	r1, #2
	movne	r1, #1
.L766:
	bl	__aeabi_idiv
	pop	{r3, pc}
.L765:
	ldr	r2, .L773
	cmp	r3, r2
	bcc	.L770
	adds	r2, r2, #1
	cmp	r3, r2
	bls	.L771
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #3
	ite	hi
	movhi	r1, #1
	movls	r1, #4
	b	.L766
.L768:
	movs	r1, #2
	b	.L766
.L770:
	movs	r1, #1
	b	.L766
.L771:
	movs	r1, #3
	b	.L766
.L774:
	.align	2
.L773:
	.word	65542
	.fnend
	.size	to_frame_pixel_stride, .-to_frame_pixel_stride
	.align	1
	.global	dma_buf_import_mpi_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_import_mpi_buf, %function
dma_buf_import_mpi_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	movs	r1, #0
	mov	r6, r2
	bl	mpi_buf_create
	mov	r4, r0
	cmp	r0, #0
	beq	.L775
	ldr	r3, .L788
	str	r3, [r0, #4]
	ldr	r3, [r5]
	str	r3, [r0, #620]
	ldr	r3, [r5, #4]
	str	r3, [r0, #624]
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #28]
	bl	to_frame_pixel_stride
	ldr	r2, .L788+4
	add	r7, r2, #764
	str	r0, [r4, #628]
	ldr	r3, [r5, #12]
	str	r3, [r4, #632]
	movs	r3, #0
	ldr	r0, [r5, #28]
.L779:
	lsls	r1, r3, #3
	add	ip, r1, r7
	ldr	ip, [ip, #4]
	cmp	r0, ip
	bne	.L777
	add	r2, r2, r1
	ldr	r3, [r2, #764]
.L778:
	str	r3, [r4, #640]
	ldrd	r2, [r5, #40]
	strd	r2, [r4, #672]
	movs	r3, #4
	str	r3, [r4, #584]
	ldrb	r3, [r5, #96]	@ zero_extendqisi2
	lsls	r3, r3, #31
	itt	mi
	movmi	r3, #12
	strmi	r3, [r4, #584]
	cmp	r6, #0
	blt	.L775
	ldr	r3, [r5, #48]
	cmp	r3, #15
	bhi	.L775
	ldr	r2, .L788+8
	addw	r3, r3, #2302
	movs	r1, #1
	add	r3, r2, r3, lsl #4
	str	r1, [r3, #4]
	ldr	r3, [r5, #48]
	addw	r3, r3, #2302
	add	r3, r2, r3, lsl #4
	str	r6, [r3, #8]
	ldr	r3, [r5, #48]
	add	r2, r2, r3, lsl #4
	movw	r3, #36844
	str	r1, [r2, r3]
.L775:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L777:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L779
	mov	r3, #-1
	b	.L778
.L789:
	.align	2
.L788:
	.word	.LC9
	.word	.LANCHOR0
	.word	g_venc_dev
	.fnend
	.size	dma_buf_import_mpi_buf, .-dma_buf_import_mpi_buf
	.align	1
	.global	to_frame_hor_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_hor_stride, %function
to_frame_hor_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #65537
	bhi	.L791
	cmp	r0, #65536
	bcs	.L793
	subs	r0, r0, #9
	cmp	r0, #1
	ite	hi
	movhi	r0, #1
	movls	r0, #2
.L792:
	muls	r0, r1, r0
	bx	lr
.L791:
	ldr	r3, .L798
	cmp	r0, r3
	bcc	.L795
	adds	r3, r3, #1
	cmp	r0, r3
	bls	.L796
	sub	r0, r0, #65536
	subs	r0, r0, #16
	cmp	r0, #3
	ite	hi
	movhi	r0, #1
	movls	r0, #4
	b	.L792
.L793:
	movs	r0, #2
	b	.L792
.L795:
	movs	r0, #1
	b	.L792
.L796:
	movs	r0, #3
	b	.L792
.L799:
	.align	2
.L798:
	.word	65542
	.fnend
	.size	to_frame_hor_stride, .-to_frame_hor_stride
	.align	1
	.global	get_mpi_buf_frm_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_frm_info, %function
get_mpi_buf_frm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r5, r0
	ldr	r3, .L876
	mov	r4, r1
	mov	r7, r2
	mov	r8, #0
.L803:
	ldr	r2, [r3]
	cbz	r2, .L801
	ldr	r2, [r3, #4]
	cmp	r7, r2
	bne	.L801
	ldr	r3, .L876+4
	movw	r2, #36844
	add	r3, r3, r8, lsl #4
	ldr	r3, [r3, r2]
	adds	r2, r3, #1
	beq	.L802
	cmp	r3, #0
	it	le
	movle	r8, #-1
.L802:
	cbnz	r5, .L804
.L875:
	movs	r0, #0
.L800:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L801:
	add	r8, r8, #1
	adds	r3, r3, #16
	cmp	r8, #16
	bne	.L803
	mov	r8, #-1
	b	.L802
.L804:
	cmp	r4, #0
	beq	.L875
	ldr	r3, [r5, #620]
	str	r3, [r4]
	ldr	r3, [r5, #624]
	str	r3, [r4, #4]
	ldr	r1, [r5, #628]
	ldr	r0, [r5, #640]
	bl	to_frame_hor_stride
	ldrb	r2, [r4, #96]	@ zero_extendqisi2
	cmp	r7, #0
	str	r0, [r4, #8]
	ldr	r3, [r5, #632]
	str	r3, [r4, #12]
	ldr	r3, [r5, #584]
	asr	r3, r3, #3
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #96]
	blt	.L808
	ldrd	r2, [r5, #672]
	ldr	r6, .L876+4
	strd	r2, [r4, #40]
	ldr	r3, [r5, #668]
	str	r3, [r4, #80]
	movs	r3, #0
	str	r3, [r4, #84]
	add	r3, r6, r7, lsl #2
	ldr	r3, [r3, #220]
	cbz	r3, .L808
	ldrd	r2, [r5, #672]
	ldr	r1, [r5, #668]
	orrs	r0, r2, r3
	bne	.L810
	cbz	r1, .L811
.L810:
	adds	r2, r1, #1
	movs	r3, #0
.L811:
	strd	r2, [r4, #80]
	ldrd	r2, [r5, #672]
	orrs	r3, r2, r3
	bne	.L812
	ldr	r3, [r5, #668]
	cmp	r3, #0
	bne	.L812
.L815:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r6, #352]
	cmp	r3, #0
	bne	.L813
.L814:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L808:
	cmp	r7, #15
	mov	r3, #0
	strd	r3, r3, [r4, #20]
	bhi	.L817
	ldr	r2, .L876+4
	movs	r3, #24
	mla	r3, r3, r7, r2
	movw	r2, #36452
	ldr	r2, [r3, r2]
	cmp	r2, r7
	bne	.L817
	movw	r2, #36456
	ldr	r2, [r3, r2]
	str	r2, [r4, #20]
	movw	r2, #36460
	ldr	r3, [r3, r2]
	str	r3, [r4, #24]
.L817:
	movs	r3, #0
	str	r8, [r4, #48]
	str	r3, [r4, #52]
	mov	r0, r7
	str	r3, [r4, #60]
	mov	r6, #2256
	bl	get_venc_node
	muls	r6, r7, r6
	mov	r1, r0
	cmp	r0, #0
	bne	.L818
.L820:
	movs	r3, #0
	str	r3, [r4, #52]
.L819:
	cmp	r8, #-1
	beq	.L821
	mov	r0, r8
	bl	get_venc_node
	mov	r1, r0
	cmp	r0, #0
	bne	.L822
.L823:
	movs	r3, #0
	str	r3, [r4, #60]
.L821:
	ldr	r3, [r5]
	ldr	r2, .L876+8
	str	r3, [r4, #56]
	add	r0, r2, #764
	ldr	r1, [r5, #640]
	movs	r3, #0
.L826:
	ldr	r6, [r0, r3, lsl #3]
	cmp	r1, r6
	bne	.L824
	add	r3, r2, r3, lsl #3
	ldr	r3, [r3, #768]
.L825:
	ldr	r6, .L876+4
	str	r3, [r4, #28]
	add	r3, r6, r7, lsl #2
	ldr	r3, [r3, #220]
	cmp	r3, #0
	bne	.L837
	ldr	r3, [r5, #584]
	tst	r3, #4
	ite	eq
	moveq	r3, #1
	movne	r3, #0
.L827:
	str	r3, [r4, #64]
	movs	r3, #0
	str	r3, [r4, #88]
	cmp	r7, #0
	bne	.L875
	movw	r3, #37108
	ldr	r2, [r6, r3]
	movw	r3, #37112
	ldr	r3, [r6, r3]
	orrs	r3, r2, r3
	beq	.L828
	movw	r1, #5500
	movw	r0, #4500
	bl	usleep_range
.L828:
	movs	r2, #112
	movs	r1, #0
	ldr	r0, .L876+12
	bl	memset
	movw	r3, #37108
	ldr	r3, [r6, r3]
	cbz	r3, .L829
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #37820
	ldr	r3, [r5, #668]
	ldr	r2, [r6, r2]
	cmp	r2, r3
	beq	.L838
	movw	r2, #37828
	ldr	r2, [r6, r2]
	cmp	r2, r3
	bne	.L831
	movs	r1, #1
.L830:
	add	r3, r1, #4704
	movw	r2, #37832
	adds	r3, r3, #23
	ldr	r3, [r6, r3, lsl #3]
	ldr	ip, [r3, #448]
	movs	r3, #56
	muls	r3, r1, r3
	adds	r7, r6, r3
	add	r3, r3, r2
	add	r3, r3, r6
	str	ip, [r7, r2]
	str	r3, [r4, #88]
	movw	r3, #37944
	str	r1, [r6, r3]
.L831:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L829:
	movw	r3, #37112
	ldr	r3, [r6, r3]
	cmp	r3, #0
	beq	.L875
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, .L876+16
	movs	r3, #0
	ldr	r0, [r5, #668]
	mov	ip, #52
.L834:
	mul	r2, ip, r3
	ldr	r5, [r2, r7]
	cmp	r0, r5
	bne	.L832
	movw	r3, #37944
	add	r2, r2, r6
	ldr	r0, [r6, r3]
	movs	r3, #56
	movw	r5, #37292
	ldr	r5, [r2, r5]
	movw	r2, #37840
	muls	r3, r0, r3
	adds	r0, r6, r3
	add	r3, r3, #37632
	adds	r3, r3, #200
	str	r5, [r0, r2]
	add	r6, r6, r3
	str	r6, [r4, #88]
.L833:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L875
.L812:
	bl	mcu_get_wrap_status
	cmp	r0, #2
	beq	.L815
	mov	r0, #-1
	b	.L800
.L813:
	mov	r0, r7
	bl	get_venc_node
	ldr	r1, [r6, #352]
	ldr	r3, [r0, #288]
	ldr	r0, [r3]
	bl	mpi_queue_push_obj
	cbz	r0, .L816
	movs	r3, #0
	str	r3, [r6, #352]
	b	.L814
.L816:
	ldr	r1, [r6, #352]
	movs	r0, #4
	ldrd	r2, [r1, #672]
	strd	r2, [sp, #8]
	ldr	r3, [r1, #668]
	movs	r1, #2
	ldr	r2, .L876+20
	str	r3, [sp, #4]
	movw	r3, #1339
	str	r3, [sp]
	ldr	r3, .L876+24
	bl	vlog
	b	.L814
.L818:
	ldr	r10, .L876+4
	add	r9, r6, #356
	add	r9, r9, r10
	add	r10, r10, r6
	mov	r0, r9
	bl	set_osd_data
	ldr	r3, [r10, #360]
	cmp	r3, #0
	beq	.L820
	str	r9, [r4, #52]
	b	.L819
.L822:
	ldr	r8, .L876+4
	addw	r6, r6, #1484
	add	r6, r6, r8
	mov	r0, r6
	bl	set_osd_data
	mov	r3, #2256
	mla	r3, r3, r7, r8
	ldr	r3, [r3, #1488]
	cmp	r3, #0
	beq	.L823
	str	r6, [r4, #60]
	b	.L821
.L877:
	.align	2
.L876:
	.word	g_venc_dev+36836
	.word	g_venc_dev
	.word	.LANCHOR0
	.word	g_venc_dev+37832
	.word	g_venc_dev+37340
	.word	.LC57
	.word	.LANCHOR0+1012
.L824:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L826
	mov	r3, #-1
	b	.L825
.L837:
	movs	r3, #0
	b	.L827
.L838:
	movs	r1, #0
	b	.L830
.L832:
	adds	r3, r3, #1
	cmp	r3, #10
	bne	.L834
	b	.L833
	.fnend
	.size	get_mpi_buf_frm_info, .-get_mpi_buf_frm_info
	.align	1
	.global	venc_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_probe, %function
venc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movs	r1, #0
	ldr	r4, .L879
	mov	r7, r0
	ldr	r2, .L879+4
	adds	r5, r4, #4
	ldr	r6, .L879+8
	mov	r0, r4
	bl	memset
	movs	r2, #16
	mov	r1, #-1
	ldr	r0, .L879+12
	bl	memset
	ldr	r2, .L879+16
	ldr	r1, .L879+20
	ldr	r0, .L879+24
	bl	__init_waitqueue_head
	mov	r1, #3264
	mov	r0, r7
	bl	kstrdup
	mov	r2, r7
	movs	r1, #8
	addw	r3, r6, #1036
	str	r4, [r4, #164]
	str	r3, [r4, #188]
	movs	r3, #23
	str	r3, [r4, #192]
	str	r0, [r4]
	mov	r0, r5
	bl	mpi_dev_register
	ldr	r3, .L879+28
	movs	r2, #0
	add	r1, r6, #1496
	mov	r0, r5
	str	r3, [r4, #72]
	ldr	r3, .L879+32
	str	r3, [r4, #80]
	ldr	r3, .L879+36
	str	r3, [r4, #84]
	bl	mpi_sysfs_dev_add
	add	r3, r4, #172
	str	r3, [r4, #172]
	str	r3, [r4, #176]
	movs	r3, #0
	str	r3, [r4, #196]
	add	r3, r4, #200
	strd	r3, r3, [r4, #200]
	pop	{r3, r4, r5, r6, r7, pc}
.L880:
	.align	2
.L879:
	.word	g_venc_dev
	.word	70856
	.word	.LANCHOR0
	.word	g_venc_dev+37968
	.word	.LANCHOR1+4
	.word	.LC58
	.word	g_venc_dev+37092
	.word	venc_create_ctx
	.word	venc_destroy_ctx
	.word	venc_handle_message
	.fnend
	.size	venc_probe, .-venc_probe
	.align	1
	.global	venc_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_shutdown, %function
venc_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L882
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-4]
	pop	{r4, lr}
	b	kfree
.L883:
	.align	2
.L882:
	.word	g_venc_dev+4
	.fnend
	.size	venc_shutdown, .-venc_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	venc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_init, %function
venc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L885
	ldr	r0, .L885+4
	bl	venc_probe
	add	r0, r4, #68
	mov	r1, r4
	bl	vmpi_register_fn2vcocdec
	mov	r0, r4
	bl	register_vmpibuf_func_to_pp
	movs	r0, #0
	pop	{r4, pc}
.L886:
	.align	2
.L885:
	.word	.LANCHOR2
	.word	.LC9
	.fnend
	.size	venc_init, .-venc_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	venc_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_exit, %function
venc_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	vmpi_unregister_fn2vcocdec
	bl	unregister_vmpibuf_func_pp
	pop	{r3, lr}
	b	venc_shutdown
	.fnend
	.size	venc_exit, .-venc_exit
	.global	gmpi_buf_ops
	.global	gmpidev_ops
	.global	g_venc_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.39073, %object
	.size	__func__.39073, 25
__func__.39073:
	.ascii	"venc_node_pp_get_md_attr\000"
	.type	__func__.39086, %object
	.size	__func__.39086, 20
__func__.39086:
	.ascii	"venc_node_enable_tb\000"
	.type	__func__.39099, %object
	.size	__func__.39099, 18
__func__.39099:
	.ascii	"venc_node_tb_bind\000"
	.type	__func__.39113, %object
	.size	__func__.39113, 21
__func__.39113:
	.ascii	"venc_node_tb_request\000"
	.type	__func__.38571, %object
	.size	__func__.38571, 14
__func__.38571:
	.ascii	"vcodec_notify\000"
	.type	__func__.38549, %object
	.size	__func__.38549, 22
__func__.38549:
	.ascii	"vcodec_set_intra_info\000"
	.type	__func__.38637, %object
	.size	__func__.38637, 14
__func__.38637:
	.ascii	"mpi_buf_unref\000"
	.type	__func__.38813, %object
	.size	__func__.38813, 17
__func__.38813:
	.ascii	"venc_node_create\000"
	.type	__func__.38829, %object
	.size	__func__.38829, 17
__func__.38829:
	.ascii	"venc_node_delete\000"
	.type	__func__.38845, %object
	.size	__func__.38845, 16
__func__.38845:
	.ascii	"venc_node_start\000"
	.type	__func__.38440, %object
	.size	__func__.38440, 15
__func__.38440:
	.ascii	"send_first_buf\000"
	.type	__func__.39012, %object
	.size	__func__.39012, 19
__func__.39012:
	.ascii	"venc_node_pp_start\000"
	.type	__func__.38898, %object
	.size	__func__.38898, 26
__func__.38898:
	.ascii	"venc_node_set_vcodec_attr\000"
	.type	__func__.38912, %object
	.size	__func__.38912, 26
__func__.38912:
	.ascii	"venc_node_get_vcodec_attr\000"
	.type	__func__.38856, %object
	.size	__func__.38856, 21
__func__.38856:
	.ascii	"venc_node_send_frame\000"
	.type	__func__.39023, %object
	.size	__func__.39023, 24
__func__.39023:
	.ascii	"venc_node_pp_send_frame\000"
	.type	__func__.39229, %object
	.size	__func__.39229, 15
__func__.39229:
	.ascii	"venc_thread_fn\000"
	.type	__func__.38496, %object
	.size	__func__.38496, 28
__func__.38496:
	.ascii	"venc_handle_node_pp_message\000"
	.type	__func__.39192, %object
	.size	__func__.39192, 13
__func__.39192:
	.ascii	"venc_release\000"
	.type	__func__.39132, %object
	.size	__func__.39132, 11
__func__.39132:
	.ascii	"venc_ioctl\000"
	.type	__func__.38563, %object
	.size	__func__.38563, 23
__func__.38563:
	.ascii	"vcodec_notify_drop_frm\000"
	.type	__func__.38926, %object
	.size	__func__.38926, 20
__func__.38926:
	.ascii	"venc_node_set_combo\000"
	.type	__func__.38941, %object
	.size	__func__.38941, 19
__func__.38941:
	.ascii	"venc_node_set_snap\000"
	.type	__func__.38961, %object
	.size	__func__.38961, 24
__func__.38961:
	.ascii	"venc_node_set_framerate\000"
	.type	__func__.38796, %object
	.size	__func__.38796, 16
__func__.38796:
	.ascii	"venc_node_check\000"
	.type	__func__.38789, %object
	.size	__func__.38789, 17
__func__.38789:
	.ascii	"venc_get_version\000"
	.type	__func__.38870, %object
	.size	__func__.38870, 19
__func__.38870:
	.ascii	"venc_node_set_crop\000"
	.type	__func__.38884, %object
	.size	__func__.38884, 19
__func__.38884:
	.ascii	"venc_node_get_crop\000"
	.type	__func__.39059, %object
	.size	__func__.39059, 25
__func__.39059:
	.ascii	"venc_node_pp_set_md_attr\000"
	.type	__func__.38974, %object
	.size	__func__.38974, 20
__func__.38974:
	.ascii	"venc_node_pp_create\000"
	.type	__func__.39039, %object
	.size	__func__.39039, 24
__func__.39039:
	.ascii	"venc_node_pp_get_result\000"
	.type	__func__.39000, %object
	.size	__func__.39000, 20
__func__.39000:
	.ascii	"venc_node_pp_delete\000"
	.type	__func__.38382, %object
	.size	__func__.38382, 18
__func__.38382:
	.ascii	"to_osd_invert_cfg\000"
	.space	2
	.type	CSWTCH.96, %object
	.size	CSWTCH.96, 68
CSWTCH.96:
	.word	65551
	.word	65551
	.word	65550
	.word	65550
	.word	-1
	.word	-1
	.word	65546
	.word	65546
	.word	65546
	.word	65546
	.word	65551
	.word	65551
	.word	65550
	.word	65550
	.word	-1
	.word	-1
	.word	17
	.type	__func__.38319, %object
	.size	__func__.38319, 20
__func__.38319:
	.ascii	"to_osd_alpha_source\000"
	.type	__func__.38456, %object
	.size	__func__.38456, 25
__func__.38456:
	.ascii	"venc_handle_node_message\000"
	.space	3
	.type	fmt, %object
	.size	fmt, 248
fmt:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
	.word	6
	.word	5
	.word	7
	.word	6
	.word	8
	.word	7
	.word	9
	.word	8
	.word	10
	.word	10
	.word	12
	.word	13
	.word	13
	.word	14
	.word	15
	.word	15
	.word	16
	.word	16
	.word	17
	.word	9
	.word	18
	.word	11
	.word	65536
	.word	65536
	.word	65537
	.word	65537
	.word	65538
	.word	65538
	.word	65539
	.word	65539
	.word	65540
	.word	65540
	.word	65541
	.word	65541
	.word	65542
	.word	65542
	.word	65543
	.word	65543
	.word	65544
	.word	65544
	.word	65545
	.word	65545
	.word	65552
	.word	65546
	.word	65553
	.word	65547
	.word	65554
	.word	65548
	.word	65555
	.word	65549
	.type	__func__.38748, %object
	.size	__func__.38748, 21
__func__.38748:
	.ascii	"get_mpi_buf_frm_info\000"
	.space	3
	.type	venc_ioctls, %object
	.size	venc_ioctls, 460
venc_ioctls:
	.word	-1068735232
	.word	0
	.word	venc_get_version
	.word	.LC59
	.word	0
	.word	-1072667391
	.word	0
	.word	venc_node_create
	.word	.LC60
	.word	0
	.word	1074029826
	.word	0
	.word	venc_node_delete
	.word	.LC61
	.word	0
	.word	1076126979
	.word	0
	.word	venc_node_start
	.word	.LC62
	.word	0
	.word	1079796996
	.word	0
	.word	venc_node_send_frame
	.word	.LC63
	.word	0
	.word	1075340549
	.word	0
	.word	venc_node_set_crop
	.word	.LC64
	.word	0
	.word	1074554118
	.word	0
	.word	venc_node_set_combo
	.word	.LC65
	.word	0
	.word	1074554119
	.word	0
	.word	venc_node_set_snap
	.word	.LC66
	.word	0
	.word	-1069783800
	.word	0
	.word	venc_node_pp_create
	.word	.LC67
	.word	0
	.word	1074029833
	.word	0
	.word	venc_node_pp_delete
	.word	.LC68
	.word	0
	.word	1074029834
	.word	0
	.word	venc_node_pp_start
	.word	.LC69
	.word	0
	.word	1079797003
	.word	0
	.word	venc_node_pp_send_frame
	.word	.LC70
	.word	0
	.word	-1071618804
	.word	0
	.word	venc_node_pp_get_result
	.word	.LC71
	.word	0
	.word	1074029837
	.word	0
	.word	venc_node_enable_tb
	.word	.LC72
	.word	0
	.word	1074291982
	.word	0
	.word	venc_node_tb_bind
	.word	.LC73
	.word	0
	.word	1074029839
	.word	0
	.word	venc_node_tb_request
	.word	.LC74
	.word	0
	.word	-1072143088
	.word	0
	.word	venc_node_get_crop
	.word	.LC75
	.word	0
	.word	1077699857
	.word	0
	.word	venc_node_set_vcodec_attr
	.word	.LC76
	.word	0
	.word	-1069783790
	.word	0
	.word	venc_node_get_vcodec_attr
	.word	.LC77
	.word	0
	.word	-1071356653
	.word	0
	.word	venc_node_pp_set_md_attr
	.word	.LC78
	.word	0
	.word	-1071356652
	.word	0
	.word	venc_node_pp_get_md_attr
	.word	.LC79
	.word	0
	.word	1074816277
	.word	0
	.word	venc_node_check
	.word	.LC80
	.word	0
	.word	1074816278
	.word	0
	.word	venc_node_set_framerate
	.word	.LC81
	.word	0
	.type	venc_driver_fops, %object
	.size	venc_driver_fops, 128
venc_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	venc_poll
	.word	venc_ioctl
	.word	venc_compat_ioctl
	.word	0
	.space	4
	.word	venc_open
	.space	4
	.word	venc_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	gmpi_buf_ops, %object
	.size	gmpi_buf_ops, 68
gmpi_buf_ops:
	.word	mpi_buf_alloc
	.word	mpi_buf_map
	.word	mpi_buf_unmap
	.word	mpi_buf_ref
	.word	mpi_buf_unref
	.word	mpi_buf_get_dmabuf
	.word	mpi_buf_get_paddr
	.word	mpi_buffer_queue_create
	.word	mpi_buffer_queue_destroy
	.word	mpi_buffer_queue_push
	.word	mpi_buffer_queue_pop
	.word	dma_buf_import_mpi_buf
	.word	get_mpi_buf_frm_info
	.word	mpi_buffer_pool_create
	.word	mpi_buffer_pool_destroy
	.word	mpi_buffer_pool_request_buf
	.word	mpi_buffer_pool_get_free_num
	.type	gmpidev_ops, %object
	.size	gmpidev_ops, 36
gmpidev_ops:
	.word	vcodec_create_dev
	.word	vcodec_destory_dev
	.word	vcodec_handle_message
	.word	vcodec_get_chnl_ctx
	.word	vcodec_get_chnl_id
	.word	vcodec_get_chnl_type
	.word	vcodec_set_intra_info
	.word	vcodec_notify_drop_frm
	.word	vcodec_notify
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	__func____LINE__.38476, %object
	.size	__func____LINE__.38476, 4
__func____LINE__.38476:
	.space	4
	.type	__key.39311, %object
	.size	__key.39311, 0
__key.39311:
	.space	4
	.type	g_venc_dev, %object
	.size	g_venc_dev, 70856
g_venc_dev:
	.space	70856
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct venc_pp_md_attr mismatching\033[0m"
	.ascii	"\000"
.LC1:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC2:
	.ascii	"\033[1;31mchnId %d and %d need less than %d\033[0m\000"
.LC3:
	.ascii	"wrap trigger again, seq: %llu\000"
.LC4:
	.ascii	"wrap trigger again fail, seq: %llu\000"
.LC5:
	.ascii	"chn %d wrap trigger again\000"
.LC6:
	.ascii	"chn %d wrap trigger again fail\000"
.LC7:
	.ascii	"\033[1;31mrequest thumbnail more than %d\033[0m\000"
.LC8:
	.ascii	"valloc\000"
.LC9:
	.ascii	"venc\000"
.LC10:
	.ascii	"buf(%d)\000"
.LC11:
	.ascii	"rkv_enc\000"
.LC12:
	.ascii	"\033[1;31mstruct venc_info mismatching\033[0m\000"
.LC13:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC14:
	.ascii	"\033[1;31m====== error create venc node\033[0m\000"
.LC15:
	.ascii	"\0013%s[%d] struct venc_frame mismatching\000"
.LC16:
	.ascii	"ch = %d, warp enable = %d, wrap line = %d\000"
.LC17:
	.ascii	"\033[1;32msend first buf to venc %d, %d, %d ,%d\033"
	.ascii	"[0m\000"
.LC18:
	.ascii	"\033[1;31msend first buf to venc fail: queue is NUL"
	.ascii	"L!\033[0m\000"
.LC19:
	.ascii	"\033[1;31msend first buf to venc fail: push queue e"
	.ascii	"rror!\033[0m\000"
.LC20:
	.ascii	"\033[1;31mstruct venc_frame mismatching\033[0m\000"
.LC21:
	.ascii	"\033[1;31mchnId %d send frame fail: node %px, enc_d"
	.ascii	"ev %px, frameFd %d\033[0m\000"
.LC22:
	.ascii	"\033[1;31mchnId %d send frame fail: pp_node %px, en"
	.ascii	"c_dev %px, frameFd %d\033[0m\000"
.LC23:
	.ascii	"%s register ok = %p\000"
.LC24:
	.ascii	"\033[1;32mthread exit\012\033[0m\000"
.LC25:
	.ascii	"venc_pp(%s-%d) buf(%d) ready, pending: %d\000"
.LC26:
	.ascii	"venc(%s-%d) drop buf(%d)\000"
.LC27:
	.ascii	"%s %d\000"
.LC28:
	.ascii	"\033[1;32mstop thread %p\012\033[0m\000"
.LC29:
	.ascii	"\033[1;32mstop thread %p ok\012\033[0m\000"
.LC30:
	.ascii	"======error: index = %d\000"
.LC31:
	.ascii	"======error: ioctl is null\000"
.LC32:
	.ascii	"======error venc ioctl\000"
.LC33:
	.ascii	"\033[1;31mstruct venc_combo mismatching\033[0m\000"
.LC34:
	.ascii	"\033[1;31mstruct venc_snap mismatching\033[0m\000"
.LC35:
	.ascii	"\033[1;31mstruct venc_framerate mismatching\033[0m\000"
.LC36:
	.ascii	"\033[1;32mvdev->wrap_in %d, vdev->wrap_out %d\012\033"
	.ascii	"[0m\000"
.LC37:
	.ascii	"\033[1;31mstruct venc_version mismatching\033[0m\000"
.LC38:
	.ascii	"\033[1;31mstruct venc_crop mismatching\033[0m\000"
.LC39:
	.ascii	"\033[1;31mstruct venc_pp_info mismatching\033[0m\000"
.LC40:
	.ascii	"\033[1;31merror\033[0m\000"
.LC41:
	.ascii	"\033[1;31m====== error create venc pp node\033[0m\000"
.LC42:
	.ascii	"\033[1;32mcreate thread %p\012\033[0m\000"
.LC43:
	.ascii	"\033[1;31mstruct venc_pp_result mismatching\033[0m\000"
.LC44:
	.ascii	"Inverted cells do not support size\012\000"
.LC45:
	.ascii	"\033[1;31mcreate light lut failed!\033[0m\000"
.LC46:
	.ascii	"rbuv_swap not support\000"
.LC47:
	.ascii	"alpha_swap not support\000"
.LC48:
	.ascii	"\033[1;31merror format!\033[0m\000"
.LC49:
	.ascii	"\033[1;31mchn %d error!\033[0m\000"
.LC50:
	.ascii	"\033[1;31mchn %d queue is NULL!\033[0m\000"
.LC51:
	.ascii	"\033[1;32mseq lost = %d, %d\033[0m\000"
.LC52:
	.ascii	"\033[1;31mwrap mode lost buf, seq = %d\033[0m\000"
.LC53:
	.ascii	"\033[1;32mvenc lost a buf pts = %d\033[0m\000"
.LC54:
	.ascii	"\033[1;32mstart wrap buf: %d, %d, %d ,%d, seq_id = "
	.ascii	"%d\033[0m\000"
.LC55:
	.ascii	"wrap trigger fail, seq: %d, result %d\000"
.LC56:
	.ascii	"venc(%s-%d) buf(%d) ready, pending: %d\000"
.LC57:
	.ascii	"\033[1;31mre send a buf fail seq = %d, pts = %d\033"
	.ascii	"[0m\000"
.LC58:
	.ascii	"&vdev->wait\000"
.LC59:
	.ascii	"VENC_IOCTL_VERSION\000"
.LC60:
	.ascii	"VENC_IOCTL_NODE_CREATE\000"
.LC61:
	.ascii	"VENC_IOCTL_NODE_DELETE\000"
.LC62:
	.ascii	"VENC_IOCTL_NODE_START\000"
.LC63:
	.ascii	"VENC_IOCTL_NODE_SEND_FRAME\000"
.LC64:
	.ascii	"VENC_IOCTL_NODE_SET_CROP\000"
.LC65:
	.ascii	"VENC_IOCTL_NODE_SET_COMBO\000"
.LC66:
	.ascii	"VENC_IOCTL_NODE_SET_SNAP\000"
.LC67:
	.ascii	"VENC_IOCTL_NODE_PP_CREATE\000"
.LC68:
	.ascii	"VENC_IOCTL_NODE_PP_DELETE\000"
.LC69:
	.ascii	"VENC_IOCTL_NODE_PP_START\000"
.LC70:
	.ascii	"VENC_IOCTL_NODE_PP_SEND_FRAME\000"
.LC71:
	.ascii	"VENC_IOCTL_NODE_PP_GET_RESULT\000"
.LC72:
	.ascii	"VENC_IOCTL_NODE_ENABLE_TB\000"
.LC73:
	.ascii	"VENC_IOCTL_NODE_TB_BIND\000"
.LC74:
	.ascii	"VENC_IOCTL_NODE_TB_REQUEST\000"
.LC75:
	.ascii	"VENC_IOCTL_NODE_GET_CROP\000"
.LC76:
	.ascii	"VENC_IOCTL_NODE_SET_VCODEC_ATTR\000"
.LC77:
	.ascii	"VENC_IOCTL_NODE_GET_VCODEC_ATTR\000"
.LC78:
	.ascii	"VENC_IOCTL_NODE_PP_SET_MD_ATTR\000"
.LC79:
	.ascii	"VENC_IOCTL_NODE_PP_GET_MD_ATTR\000"
.LC80:
	.ascii	"VENC_IOCTL_NODE_CHECK\000"
.LC81:
	.ascii	"VENC_IOCTL_NODE_SET_FRAMERATE\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
