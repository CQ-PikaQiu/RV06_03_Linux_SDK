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
	.file	"valloc.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_free_all_cma:					
	.asciz 	"free_all_cma"					
__kstrtabns_free_all_cma:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_dma_buf_phy_addr:					
	.asciz 	"get_dma_buf_phy_addr"					
__kstrtabns_get_dma_buf_phy_addr:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mpi_buf:					
	.asciz 	"get_mpi_buf"					
__kstrtabns_get_mpi_buf:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_compat_ioctl, %function
valloc_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	valloc_compat_ioctl, .-valloc_compat_ioctl
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	early_dma_heap_cma, %function
early_dma_heap_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	str	r0, [sp, #4]
	cbnz	r0, .L3
	ldr	r0, .L6
	bl	printk
	mvn	r0, #21
.L2:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L3:
	add	r1, sp, #4
	ldr	r4, .L6+4
	bl	memparse
	str	r0, [r4]
	ldr	r0, [sp, #4]
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #64
	bne	.L5
	add	r1, sp, #4
	adds	r0, r0, #1
	bl	memparse
	str	r0, [r4, #4]
.L5:
	movs	r0, #0
	b	.L2
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	early_dma_heap_cma, .-early_dma_heap_cma
	.text
	.align	1
	.global	get_dma_buf_phy_addr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_dma_buf_phy_addr, %function
get_dma_buf_phy_addr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L14
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r8, r0
	ldr	r1, [r3, #192]
	bl	dma_buf_attach
	cmn	r0, #4096
	mov	r6, r0
	bls	.L9
	movs	r3, #158
	movs	r0, #1
	ldr	r2, .L14+4
	movs	r1, #2
	strd	r3, r0, [sp]
	ldr	r3, .L14+8
	bl	vlog
	mov	r0, r6
.L8:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L9:
	movs	r1, #0
	bl	dma_buf_map_attachment
	cmn	r0, #4096
	mov	r5, r0
	bls	.L11
	movs	r3, #163
	movs	r0, #1
	ldr	r2, .L14+12
	movs	r1, #2
	strd	r3, r0, [sp]
	ldr	r3, .L14+8
	bl	vlog
	mov	r0, r5
	b	.L8
.L11:
	ldr	r0, [r0]
	movs	r7, #0
	ldr	r9, .L14+16
	ldr	r10, .L14+20
.L12:
	ldr	r3, [r5, #8]
	cmp	r3, r7
	bhi	.L13
	movs	r2, #0
	mov	r1, r5
	mov	r0, r6
	bl	dma_buf_unmap_attachment
	mov	r0, r8
	mov	r1, r6
	bl	dma_buf_detach
	mov	r0, r4
	b	.L8
.L13:
	ldr	r4, [r0]
	adds	r7, r7, #1
	ldr	r3, [r9]
	bic	r4, r4, #3
	ldr	r2, [r0, #4]
	subs	r4, r4, r3
	ldr	r3, [r10]
	add	r4, r3, r4, asr #5
	add	r4, r2, r4, lsl #12
	bl	sg_next
	b	.L12
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.word	mem_map
	.word	__pv_phys_pfn_offset
	.fnend
	.size	get_dma_buf_phy_addr, .-get_dma_buf_phy_addr
	.align	1
	.global	get_mpi_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf, %function
get_mpi_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	bl	dma_buf_get
	cbnz	r0, .L17
.L22:
	movs	r4, #0
.L16:
	mov	r0, r4
	pop	{r4, pc}
.L17:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L30
	ldr	r4, [r3]
.L29:
	subs	r4, r4, #36
	add	r1, r4, #36
	cmp	r1, r3
	bne	.L21
	movs	r4, #0
.L20:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bl	dma_buf_put
	cmp	r4, #0
	beq	.L22
	ldr	r0, [r4, #444]
	cmp	r0, #0
	beq	.L16
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L16
	mov	r1, r4
	bl	mpi_buf_pool_request_buf
	movs	r3, #1
	str	r3, [r4, #588]
	b	.L16
.L21:
	ldr	r1, [r4, #448]
	cmp	r1, r0
	beq	.L20
	ldr	r4, [r4, #36]
	b	.L29
.L31:
	.align	2
.L30:
	.word	mpi_buf_list
	.fnend
	.size	get_mpi_buf, .-get_mpi_buf
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_thread_fn, %function
valloc_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	add	r5, r0, #64
	mov	r4, r0
.L35:
	bl	kthread_should_stop
	cbz	r0, .L36
.L34:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L36:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	bne	.L34
	mov	r0, r5
	bl	down
	ldr	r0, [r4, #84]
	bl	mpi_queue_pop_obj
	cmp	r0, #0
	beq	.L35
	bl	mpi_obj_unref
	b	.L35
	.fnend
	.size	valloc_thread_fn, .-valloc_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_read, %function
valloc_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #52
	sub	sp, sp, #52
	ldr	r5, [r0, #128]
	strd	r1, r2, [sp, #36]
	adds	r5, r5, #12
	mov	r0, r5
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r4, r0
	bne	.L40
	ldr	r3, .L73
	mov	r0, r5
	ldr	r2, .L73+4
	mov	r8, #0
	ldr	r1, .L73+8
	str	r3, [sp]
	ldr	r3, .L73+12
	ldr	r2, [r2, #8]
	bl	mpi_fs_buf_add
	ldr	r1, .L73+16
	mov	r0, r5
	ldr	r7, .L73+20
	bl	mpi_fs_buf_add
	ldr	r1, .L73+24
	mov	r0, r5
	ldr	r9, .L73+60
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	subs	r4, r4, #36
	str	r7, [sp, #44]
.L41:
	ldr	r2, [sp, #44]
	add	r3, r4, #36
	cmp	r3, r2
	beq	.L57
	ldr	r3, [r4, #444]
	ldr	r2, [r4]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r3]
.L42:
	ldr	r1, [r4, #448]
	ldr	r6, [r4, #16]
	cmp	r1, #0
	beq	.L67
	ldr	r1, [r1, #4]
	ldr	r1, [r1, #28]
.L43:
	ldr	r0, [r4, #600]
	ldr	r7, [r4, #4]
	cmp	r0, #0
	ite	ge
	ldrge	r0, [r4, #596]
	movlt	r0, #-1
	str	r7, [sp, #24]
	ldr	r7, [r4, #608]
	str	r7, [sp, #20]
	ldr	r7, [r4, #604]
	strd	r1, r0, [sp, #4]
	mov	r0, r5
	str	r6, [sp]
	strd	r4, r7, [sp, #12]
	ldr	r1, .L73+28
	bl	mpi_fs_buf_add
	mov	r6, r0
	cmp	r0, #0
	beq	.L45
.L57:
	mov	r2, r8
	ldr	r1, .L73+32
	mov	r0, r5
	ldr	r7, .L73+36
	bl	mpi_fs_buf_add
	ldr	r1, .L73+40
	mov	r0, r5
	ldr	r9, .L73+64
	bl	mpi_fs_buf_add
	ldr	r1, .L73+44
	mov	r0, r5
	ldr	r10, .L73+68
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	ldr	fp, .L73+48
	subs	r4, r4, #36
.L46:
	add	r3, r4, #36
	cmp	r3, r7
	beq	.L64
	ldr	r1, [r4, #4]
	mov	r0, r5
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #68]
	str	r1, [sp, #12]
	ldr	r1, [r4, #56]
	str	r1, [sp, #8]
	ldr	r1, [r4, #72]
	strd	r2, r1, [sp]
	mov	r1, r9
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L58
.L64:
	ldr	r1, .L73+48
	mov	r0, r5
	bl	mpi_fs_buf_add
	mov	r0, r5
	ldrd	r1, r2, [sp, #36]
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L66:
	mov	r3, #-1
	b	.L42
.L67:
	mov	r1, #-1
	b	.L43
.L45:
	ldr	fp, .L73+72
	add	r10, r4, #452
.L54:
	ldr	r3, [r10], #4
	subs	r2, r3, #1
	adds	r2, r2, #3
	bhi	.L48
	ldr	r2, [r9]
.L71:
	subs	r2, r2, #36
	add	r1, r2, #36
	cmp	r1, r9
	bne	.L51
	str	r6, [sp]
	mov	r2, fp
	ldr	r1, .L73+52
	mov	r0, r5
	bl	mpi_fs_buf_add
	cbz	r0, .L48
.L52:
	ldr	r1, .L73+48
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r3, [r4, #600]
	cmp	r3, #0
	ite	ge
	ldrge	r3, [r4, #596]
	movlt	r3, #0
	ldr	r4, [r4, #36]
	add	r8, r8, r3
	subs	r4, r4, #36
	b	.L41
.L51:
	cmp	r3, r2
	bne	.L50
	ldr	r2, [r3, #44]
	mov	r0, r5
	str	r6, [sp]
	ldr	r1, .L73+56
	ldr	r3, [r3]
	ldr	r2, [r2, #44]
	bl	mpi_fs_buf_add
.L48:
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L54
	b	.L52
.L50:
	ldr	r2, [r2, #36]
	b	.L71
.L58:
	mov	r8, r4
	ldr	r6, [r8, #84]!
.L72:
	subs	r6, r6, #64
	add	r3, r6, #64
	cmp	r3, r8
	beq	.L62
	ldr	r2, [r6, #44]
	mov	r1, r10
	ldr	r3, [r6]
	mov	r0, r5
	ldr	r2, [r2, #44]
	bl	mpi_fs_buf_add
	cbz	r0, .L60
.L62:
	mov	r1, fp
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r4, #36]
	subs	r4, r4, #36
	b	.L46
.L60:
	ldr	r6, [r6, #64]
	b	.L72
.L40:
	cbnz	r0, .L39
	mov	r0, r5
	bl	mpi_fs_buf_reset
.L39:
	mov	r0, r4
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L74:
	.align	2
.L73:
	.word	.LC5
	.word	.LANCHOR0
	.word	.LC4
	.word	.LC3
	.word	.LC6
	.word	mpi_buf_list
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	mpi_buf_pool_list
	.word	.LC10
	.word	.LC11
	.word	.LC15
	.word	.LC14
	.word	.LC12
	.word	mpi_node_list
	.word	.LC16
	.word	.LC17
	.word	.LC13
	.fnend
	.size	valloc_read, .-valloc_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_create, %function
valloc_mb_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r7, [r0, #128]
	cmp	r3, #28
	beq	.L76
	movw	r3, #401
	ldr	r2, .L81
	str	r3, [sp]
	ldr	r3, .L81+4
.L80:
	movs	r1, #2
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L75:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L76:
	ldr	r2, [r1, #16]	@ unaligned
	ldr	r0, .L81+8
	ldr	r1, [r1, #20]	@ unaligned
	bl	mpi_allocator_alloc
	mov	r5, r0
	cbnz	r0, .L78
	mov	r3, #406
	ldr	r2, .L81+12
	str	r3, [sp]
	ldr	r3, .L81+4
	b	.L80
.L78:
	movs	r1, #0
	bl	mpi_buf_create
	mov	r4, r0
	cbnz	r0, .L79
	movw	r3, #411
	ldr	r2, .L81+16
	str	r3, [sp]
	ldr	r3, .L81+4
	b	.L80
.L79:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #12]
	add	r3, r3, #736
	str	r3, [r0, #4]
	mov	r0, r5
	mov	r5, r4
	bl	dma_buf_put
	ldr	r3, [r5], #44
	ldr	r2, .L81+20
	movs	r1, #5
	movs	r0, #1
	str	r3, [r6, #4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #417
	str	r3, [sp]
	ldr	r3, .L81+4
	bl	vlog
	ldr	r3, [r7, #4]
	str	r5, [r7, #4]
	movs	r1, #5
	ldr	r2, .L81+24
	movs	r0, #1
	strd	r7, r3, [r4, #44]
	str	r5, [r3]
	ldr	r3, [r4, #40]
	str	r3, [sp, #8]
	ldr	r3, [r4, #36]
	str	r3, [sp, #4]
	movw	r3, #419
	str	r3, [sp]
	ldr	r3, .L81+4
	bl	vlog
	movs	r0, #0
	b	.L75
.L82:
	.align	2
.L81:
	.word	.LC18
	.word	.LANCHOR1+21
	.word	.LANCHOR0+12
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.fnend
	.size	valloc_mb_create, .-valloc_mb_create
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_alloc, %function
dma_buf_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L92
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r2
	ldr	r5, [r3, #68]
	.pad #20
	sub	sp, sp, #20
	cmp	r5, #0
	beq	.L83
	ldr	r4, [r3, #268]
	cbnz	r4, .L88
	str	r2, [sp, #4]
	movw	r3, #271
	ldr	r2, .L92+4
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #1
	ldr	r3, .L92+8
	movs	r6, #4
	bl	vlog
	ldr	r8, .L92+20
	ldr	r9, .L92+24
.L85:
	subs	r6, r6, #1
	bne	.L87
	cmn	r4, #4096
	bls	.L86
	mov	r3, #282
	str	r7, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L92+8
	movs	r0, #1
	ldr	r2, .L92+12
	bl	vlog
.L88:
	movs	r5, #0
	b	.L83
.L87:
	str	r8, [sp]
	movs	r3, #0
	mov	r2, r9
	mov	r1, r7
	mov	r0, r5
	bl	rk_dma_heap_buffer_alloc
	cmn	r0, #4096
	mov	r4, r0
	bls	.L86
	movs	r0, #10
	bl	msleep
	b	.L85
.L86:
	ldr	r3, [r4, #4]
	movs	r1, #5
	ldr	r2, .L92+16
	movs	r0, #1
	mov	r5, r4
	ldr	r3, [r3, #28]
	str	r3, [sp, #12]
	ldr	r3, [r4]
	strd	r4, r3, [sp, #4]
	movw	r3, #285
	str	r3, [sp]
	ldr	r3, .L92+8
	bl	vlog
.L83:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	.LC23
	.word	.LANCHOR1+38
	.word	.LC25
	.word	.LC26
	.word	.LC24
	.word	524290
	.fnend
	.size	dma_buf_alloc, .-dma_buf_alloc
	.align	1
	.global	free_all_cma
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	free_all_cma, %function
free_all_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r5, .L99
	ldr	r3, [r5, #4]
	cbz	r3, .L94
	ldr	r3, [r5]
	cmp	r3, #65536
	bls	.L94
	ldr	r0, .L99+4
	bl	printk
	ldr	r0, .L99+8
	bl	printk
	ldr	r4, [r5]
	ldr	r0, [r5, #4]
	sub	r4, r4, #65536
	add	r0, r0, #65536
	lsrs	r4, r4, #12
	lsrs	r0, r0, #12
	mov	r1, r4
	bl	free_contig_range
	ldr	r3, .L99+12
	pld	[r3]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, r4
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #1
	str	r3, [r5, #268]
.L94:
	pop	{r3, r4, r5, pc}
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.word	.LC27
	.word	.LC28
	.word	_totalram_pages
	.fnend
	.size	free_all_cma, .-free_all_cma
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_id, %function
valloc_mb_get_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #28
	beq	.L102
	mov	r3, #378
	ldr	r2, .L105
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L105+4
	movs	r0, #1
	bl	vlog
.L104:
	mov	r0, #-1
	b	.L101
.L102:
	ldr	r0, [r1, #8]	@ unaligned
	bl	get_mpi_buf
	cmp	r0, #0
	beq	.L104
	ldr	r3, [r0]
	movs	r0, #0
	str	r3, [r4, #4]	@ unaligned
.L101:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L106:
	.align	2
.L105:
	.word	.LC18
	.word	.LANCHOR1+52
	.fnend
	.size	valloc_mb_get_id, .-valloc_mb_get_id
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_ioctl, %function
valloc_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #20
	sub	sp, sp, #20
	uxtb	r4, r1
	movw	r3, #469
	mov	r6, r0
	str	r3, [sp]
	mov	r5, r1
	ldr	r3, .L111
	movs	r1, #5
	mov	r7, r2
	strd	r4, r4, [sp, #4]
	movs	r0, #1
	ldr	r2, .L111+4
	bl	vlog
	ldr	r3, .L111+8
	ldr	r1, [r3, #264]
	cmp	r1, r4
	bhi	.L108
	mov	r3, #472
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L111
	movs	r0, #1
	ldr	r2, .L111+12
	bl	vlog
.L109:
.L107:
	mvn	r0, #21
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L108:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r3, #260]
	movs	r3, #20
	mla	r1, r3, r4, r1
	cbnz	r1, .L110
	movw	r3, #479
	ldr	r2, .L111+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L111
	movs	r0, #1
	bl	vlog
	b	.L107
.L110:
	ldr	r3, .L111+20
	mov	r2, r5
	mov	r0, r6
	str	r3, [r1, #16]
	mov	r3, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	mpi_ioctl_kernel
.L112:
	.align	2
.L111:
	.word	.LANCHOR1+69
	.word	.LC29
	.word	.LANCHOR0
	.word	.LC30
	.word	.LC31
	.word	.LANCHOR2
	.fnend
	.size	valloc_ioctl, .-valloc_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_phy_addr, %function
valloc_mb_get_phy_addr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #28
	beq	.L114
	mov	r3, #352
	ldr	r2, .L119
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L119+4
	movs	r0, #1
	bl	vlog
.L118:
	mov	r0, #-1
.L113:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L114:
	movs	r1, #4
	ldr	r0, [r4, #4]	@ unaligned
	bl	mpi_obj_from_id
	mov	r5, r0
	cbnz	r0, .L116
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L119+8
	movs	r0, #1
	str	r3, [sp, #4]
	movw	r3, #357
	str	r3, [sp]
	ldr	r3, .L119+4
	bl	vlog
	b	.L118
.L116:
	ldr	r3, [r0, #608]
	cbnz	r3, .L117
	ldr	r0, [r0, #448]
	bl	get_dma_buf_phy_addr
	str	r0, [r5, #608]
.L117:
	ldr	r3, [r5, #608]
	movs	r1, #5
	ldr	r2, [r4, #4]	@ unaligned
	movs	r0, #1
	str	r3, [r4, #24]	@ unaligned
	strd	r3, r2, [sp, #4]
	movw	r3, #363
	ldr	r2, .L119+12
	str	r3, [sp]
	ldr	r3, .L119+4
	bl	vlog
	movs	r0, #0
	b	.L113
.L120:
	.align	2
.L119:
	.word	.LC18
	.word	.LANCHOR1+82
	.word	.LC32
	.word	.LC33
	.fnend
	.size	valloc_mb_get_phy_addr, .-valloc_mb_get_phy_addr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_delete, %function
valloc_mb_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r3, r1
	ldr	r2, [r1, #12]	@ unaligned
	cmp	r2, #28
	beq	.L122
	mov	r3, #434
	ldr	r2, .L134
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L134+4
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L121:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L122:
	movs	r1, #4
	ldr	r0, [r3, #4]	@ unaligned
	bl	mpi_obj_from_id
	mov	r4, r0
	cbnz	r0, .L124
.L133:
	movs	r0, #0
	b	.L121
.L124:
	ldr	r3, [r0, #16]
	movs	r1, #5
	ldr	r2, .L134+8
	strd	r0, r3, [sp, #4]
	movw	r3, #439
	movs	r0, #1
	str	r3, [sp]
	ldr	r3, .L134+4
	bl	vlog
	ldrd	r2, r3, [r4, #44]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	mov	r2, #256
	strd	r2, r3, [r4, #44]
	ldr	r3, [r4, #444]
	cbz	r3, .L125
	ldr	r3, [r4, #588]
	cmp	r3, #0
	beq	.L133
.L125:
	mov	r0, r4
	bl	mpi_obj_unref
	b	.L133
.L135:
	.align	2
.L134:
	.word	.LC18
	.word	.LANCHOR1+105
	.word	.LC34
	.fnend
	.size	valloc_mb_delete, .-valloc_mb_delete
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_version, %function
valloc_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #32]	@ unaligned
	cmp	r3, #76
	beq	.L137
	movw	r3, #301
	ldr	r2, .L141
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L141+4
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L136:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L137:
	movs	r3, #1
	strb	r3, [r1]
	ldr	r3, .L141+8
	movs	r5, #0
	strb	r5, [r1, #1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	ldr	r6, [r3, #8]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	mov	r0, r6
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
	bl	strlen
	mov	r1, r6
	cmp	r0, #16
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	movhi	r3, #16
	strbhi	r5, [r4, #14]
	strbhi	r3, [r4, #12]
	strbhi	r5, [r4, #15]
	ldr	r2, [r4, #12]	@ unaligned
	bl	strncpy
	movs	r0, #0
	strb	r0, [r4, #36]
	strb	r0, [r4, #37]
	strb	r0, [r4, #38]
	strb	r0, [r4, #39]
	strb	r0, [r4, #56]
	strb	r0, [r4, #57]
	strb	r0, [r4, #58]
	strb	r0, [r4, #59]
	b	.L136
.L142:
	.align	2
.L141:
	.word	.LC35
	.word	.LANCHOR1+122
	.word	.LANCHOR0
	.fnend
	.size	valloc_version, .-valloc_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_open, %function
valloc_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L148
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	ldr	r0, [r3, #20]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L144
	movw	r3, #503
	ldr	r2, .L148+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L148+8
	movs	r0, #1
	bl	vlog
.L147:
	mov	r5, #-1
.L143:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L144:
	str	r0, [r4]
	mov	r1, #10240
	str	r0, [r4, #4]
	adds	r0, r0, #12
	bl	mpi_fs_buf_init
	mov	r5, r0
	cbz	r0, .L146
	mov	r0, r4
	bl	kfree
	b	.L147
.L146:
	ldr	r6, .L148+12
	add	r7, r6, #96
	mov	r0, r7
	bl	mpi_obj_ref
	ldr	r3, [r6, #96]
	str	r7, [r4, #8]
	movs	r1, #5
	str	r4, [r8, #128]
	movs	r0, #1
	ldr	r2, .L148+16
	str	r3, [sp, #4]
	movw	r3, #515
	str	r3, [sp]
	ldr	r3, .L148+8
	bl	vlog
	b	.L143
.L149:
	.align	2
.L148:
	.word	kmalloc_caches
	.word	.LC36
	.word	.LANCHOR1+137
	.word	.LANCHOR0
	.word	.LC37
	.fnend
	.size	valloc_open, .-valloc_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_release, %function
valloc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	movw	r7, #526
	ldr	r5, [r1, #128]
	ldr	r8, .L153+4
	ldr	r9, .L153+8
	ldr	r0, [r5, #8]
	bl	mpi_obj_unref
	ldr	r3, [r5, #8]
	ldr	r2, .L153
	movs	r1, #5
	movs	r0, #1
	ldr	r3, [r3]
	str	r3, [sp, #4]
	mov	r3, #524
	str	r3, [sp]
	ldr	r3, .L153+4
	bl	vlog
	ldr	r4, [r5]
	ldr	r6, [r4], #-44
	subs	r6, r6, #44
.L151:
	add	r3, r4, #44
	cmp	r5, r3
	bne	.L152
	add	r0, r4, #56
	bl	mpi_fs_buf_deinit
	mov	r0, r5
	bl	kfree
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L152:
	ldr	r3, [r4]
	mov	r2, r9
	movs	r1, #4
	movs	r0, #1
	strd	r7, r3, [sp]
	mov	r3, r8
	bl	vlog
	ldrd	r2, r3, [r4, #44]
	mov	r0, r4
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	mov	r2, #256
	strd	r2, r3, [r4, #44]
	bl	mpi_obj_unref
	ldr	r3, [r6, #44]
	mov	r4, r6
	sub	r6, r3, #44
	b	.L151
.L154:
	.align	2
.L153:
	.word	.LC37
	.word	.LANCHOR1+149
	.word	.LC38
	.fnend
	.size	valloc_release, .-valloc_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_dma_buf, %function
get_dma_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
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
	bx	lr
	.fnend
	.size	get_dma_buf, .-get_dma_buf
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_fd, %function
valloc_mb_get_fd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #28
	beq	.L157
	movw	r3, #327
	ldr	r2, .L161
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L161+4
	movs	r0, #1
	bl	vlog
.L160:
	mov	r0, #-1
.L156:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L157:
	movs	r1, #4
	ldr	r0, [r4, #4]	@ unaligned
	bl	mpi_obj_from_id
	mov	r5, r0
	cbnz	r0, .L159
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L161+8
	movs	r0, #1
	str	r3, [sp, #4]
	mov	r3, #332
	str	r3, [sp]
	ldr	r3, .L161+4
	bl	vlog
	b	.L160
.L159:
	movs	r1, #0
	ldr	r0, [r0, #448]
	bl	dma_buf_fd
	str	r0, [r4, #8]	@ unaligned
	ldr	r0, [r5, #448]
	bl	get_dma_buf
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, .L161+12
	movs	r1, #5
	movs	r0, #1
	str	r3, [sp, #8]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #337
	str	r3, [sp]
	ldr	r3, .L161+4
	bl	vlog
	movs	r0, #0
	b	.L156
.L162:
	.align	2
.L161:
	.word	.LC18
	.word	.LANCHOR1+164
	.word	.LC32
	.word	.LC39
	.fnend
	.size	valloc_mb_get_fd, .-valloc_mb_get_fd
	.align	1
	.global	valloc_mmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mmap, %function
valloc_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #448]
	cbz	r0, .L163
	bl	dma_buf_vmap
	str	r0, [r4, #604]
.L163:
	pop	{r4, pc}
	.fnend
	.size	valloc_mmap, .-valloc_mmap
	.align	1
	.global	valloc_munmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_munmap, %function
valloc_munmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	ldr	r1, [r0, #604]
	cbz	r1, .L168
	ldr	r0, [r0, #448]
	cbz	r0, .L168
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r5, [r3, #4]
	bic	r5, r5, #-16777216
	bic	r5, r5, #255
	cbnz	r5, .L170
	bl	dma_buf_vunmap
	str	r5, [r4, #604]
.L168:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L170:
	movs	r1, #0
	mov	r0, r1
	bl	mpi_buf_create
	mov	r5, r0
	cbnz	r0, .L171
	movs	r3, #116
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L179
	movs	r0, #1
	ldr	r2, .L179+4
	bl	vlog
	b	.L168
.L171:
	ldr	r0, [r4, #448]
	ldr	r6, .L179+8
	str	r0, [r5, #448]
	bl	get_dma_buf
	ldr	r3, [r4, #604]
	mov	r1, r5
	ldr	r0, [r6, #92]
	str	r3, [r5, #604]
	bl	mpi_queue_push_obj
	cbnz	r0, .L172
	str	r4, [sp, #4]
	movs	r3, #123
	ldr	r2, .L179+4
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #1
	ldr	r3, .L179
	bl	vlog
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unref
.L172:
	add	r0, r6, #72
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	up
.L180:
	.align	2
.L179:
	.word	.LANCHOR1+181
	.word	.LC40
	.word	.LANCHOR0
	.fnend
	.size	valloc_munmap, .-valloc_munmap
	.align	1
	.global	valloc_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_probe, %function
valloc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r7, r0
	.pad #20
	sub	sp, sp, #20
	ldr	r0, .L185
	bl	rk_dma_heap_find
	ldr	r4, .L185+4
	str	r0, [r4, #68]
	cbnz	r0, .L182
	movw	r3, #639
	ldr	r2, .L185+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L185+12
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L181:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L182:
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L185+16
	movs	r0, #1
	movs	r6, #0
	mov	r5, r4
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]
	str	r3, [sp, #4]
	movw	r3, #642
	str	r3, [sp]
	ldr	r3, .L185+12
	bl	vlog
	ldr	r3, .L185+20
	mov	r1, #3264
	mov	r0, r7
	str	r6, [r4, #268]
	str	r3, [r4, #64]
	bl	kstrdup
	mov	r2, r7
	movs	r1, #8
	str	r0, [r5, #8]!
	add	r0, r4, #12
	bl	mpi_allocator_register
	ldr	r3, .L185+24
	mov	r2, r7
	movs	r1, #8
	add	r0, r4, #96
	str	r5, [r4, #256]
	str	r3, [r4, #260]
	movs	r3, #6
	str	r3, [r4, #264]
	bl	mpi_dev_register
	mov	r2, r6
	ldr	r1, .L185+28
	add	r0, r4, #96
	bl	mpi_sysfs_dev_add
	ldr	r0, [r4, #192]
	bl	rk_dma_heap_set_dev
	ldr	r2, .L185+32
	movs	r1, #4
	movs	r0, #20
	bl	mpi_queue_create
	add	r3, r4, #76
	mov	r1, r5
	strd	r3, r3, [r4, #76]
	mov	r2, #-1
	ldr	r3, .L185+36
	str	r6, [r4, #72]
	str	r0, [r4, #92]
	ldr	r0, .L185+40
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L184
	bl	wake_up_process
.L184:
	str	r5, [r4, #84]
	movs	r0, #0
	b	.L181
.L186:
	.align	2
.L185:
	.word	.LC41
	.word	.LANCHOR0
	.word	.LC42
	.word	.LANCHOR1+195
	.word	.LC43
	.word	dma_buf_alloc
	.word	.LANCHOR2+12
	.word	.LANCHOR1+208
	.word	mpi_obj_unref
	.word	.LC44
	.word	valloc_thread_fn
	.fnend
	.size	valloc_probe, .-valloc_probe
	.section	.init.text
	.align	1
	.global	valloc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_init, %function
valloc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L188
	b	valloc_probe
.L189:
	.align	2
.L188:
	.word	.LC44
	.fnend
	.size	valloc_init, .-valloc_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	valloc_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_exit, %function
valloc_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	valloc_exit, .-valloc_exit
	.global	valloc_mutex
	.global	g_valloc_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.37693, %object
	.size	__func__.37693, 21
__func__.37693:
	.ascii	"get_dma_buf_phy_addr\000"
	.type	__func__.37785, %object
	.size	__func__.37785, 17
__func__.37785:
	.ascii	"valloc_mb_create\000"
	.type	__func__.37745, %object
	.size	__func__.37745, 14
__func__.37745:
	.ascii	"dma_buf_alloc\000"
	.type	__func__.37776, %object
	.size	__func__.37776, 17
__func__.37776:
	.ascii	"valloc_mb_get_id\000"
	.type	__func__.37810, %object
	.size	__func__.37810, 13
__func__.37810:
	.ascii	"valloc_ioctl\000"
	.type	__func__.37769, %object
	.size	__func__.37769, 23
__func__.37769:
	.ascii	"valloc_mb_get_phy_addr\000"
	.type	__func__.37792, %object
	.size	__func__.37792, 17
__func__.37792:
	.ascii	"valloc_mb_delete\000"
	.type	__func__.37755, %object
	.size	__func__.37755, 15
__func__.37755:
	.ascii	"valloc_version\000"
	.type	__func__.37832, %object
	.size	__func__.37832, 12
__func__.37832:
	.ascii	"valloc_open\000"
	.type	__func__.37841, %object
	.size	__func__.37841, 15
__func__.37841:
	.ascii	"valloc_release\000"
	.type	__func__.37762, %object
	.size	__func__.37762, 17
__func__.37762:
	.ascii	"valloc_mb_get_fd\000"
	.type	__func__.37674, %object
	.size	__func__.37674, 14
__func__.37674:
	.ascii	"valloc_munmap\000"
	.type	__func__.37948, %object
	.size	__func__.37948, 13
__func__.37948:
	.ascii	"valloc_probe\000"
	.type	valloc_driver_fops, %object
	.size	valloc_driver_fops, 128
valloc_driver_fops:
	.word	0
	.space	4
	.word	valloc_read
	.space	24
	.word	0
	.word	valloc_ioctl
	.word	valloc_compat_ioctl
	.word	0
	.space	4
	.word	valloc_open
	.space	4
	.word	valloc_release
	.space	60
	.type	__param_str_rk_dma_heap_base, %object
	.size	__param_str_rk_dma_heap_base, 24
__param_str_rk_dma_heap_base:
	.ascii	"rockit.rk_dma_heap_base\000"
	.type	__param_str_rk_dma_heap_size, %object
	.size	__param_str_rk_dma_heap_size, 24
__param_str_rk_dma_heap_size:
	.ascii	"rockit.rk_dma_heap_size\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	valloc_mutex, %object
	.size	valloc_mutex, 12
valloc_mutex:
	.word	0
	.word	valloc_mutex+4
	.word	valloc_mutex+4
	.type	valloc_ioctls, %object
	.size	valloc_ioctls, 120
valloc_ioctls:
	.word	-1068736256
	.word	0
	.word	valloc_version
	.word	.LC45
	.word	0
	.word	-1071881983
	.word	0
	.word	valloc_mb_get_fd
	.word	.LC46
	.word	0
	.word	-1071881982
	.word	0
	.word	valloc_mb_create
	.word	.LC47
	.word	0
	.word	-1071881981
	.word	0
	.word	valloc_mb_delete
	.word	.LC48
	.word	0
	.word	-1071881980
	.word	0
	.word	valloc_mb_get_phy_addr
	.word	.LC49
	.word	0
	.word	-1071881979
	.word	0
	.word	valloc_mb_get_id
	.word	.LC50
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rk_dma_heap_size, %object
	.size	rk_dma_heap_size, 4
rk_dma_heap_size:
	.space	4
	.type	rk_dma_heap_base, %object
	.size	rk_dma_heap_base, 4
rk_dma_heap_base:
	.space	4
	.type	g_valloc_dev, %object
	.size	g_valloc_dev, 264
g_valloc_dev:
	.space	264
	.section	.init.rodata,"a"
	.type	__setup_str_early_dma_heap_cma, %object
	.size	__setup_str_early_dma_heap_cma, 16
__setup_str_early_dma_heap_cma:
	.ascii	"rk_dma_heap_cma\000"
	.section	.init.setup,"aw"
	.align	2
	.type	__setup_early_dma_heap_cma, %object
	.size	__setup_early_dma_heap_cma, 12
__setup_early_dma_heap_cma:
	.word	__setup_str_early_dma_heap_cma
	.word	early_dma_heap_cma
	.word	0
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_rk_dma_heap_basetype229, %object
	.size	__UNIQUE_ID_rk_dma_heap_basetype229, 38
__UNIQUE_ID_rk_dma_heap_basetype229:
	.ascii	"rockit.parmtype=rk_dma_heap_base:uint\000"
	.type	__UNIQUE_ID_rk_dma_heap_sizetype228, %object
	.size	__UNIQUE_ID_rk_dma_heap_sizetype228, 38
__UNIQUE_ID_rk_dma_heap_sizetype228:
	.ascii	"rockit.parmtype=rk_dma_heap_size:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013Config string not provided\012\000"
.LC1:
	.ascii	"\033[1;31mattach fail = %d\033[0m\000"
.LC2:
	.ascii	"\033[1;31mmap fail = %d\033[0m\000"
.LC3:
	.ascii	"vmpi:a9dd19f6acbf3ae9d621a285aa64278d958f9b03-v1.4."
	.ascii	"67\000"
.LC4:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC5:
	.ascii	"-2024-01-22-17:02:23\000"
.LC6:
	.ascii	"*******************************************mpi buf "
	.ascii	"list***************************************\012\000"
.LC7:
	.ascii	"buf_id-pool_id-refcnt-dmacnt-size------handle-----v"
	.ascii	"addr------paddr------create-----------user---------"
	.ascii	"----------------\012\000"
.LC8:
	.ascii	"%-#6d %-#7d %-#6d %-#6d %-#9d %-#10x %-#10x %-#10x "
	.ascii	"%-#16s \000"
.LC9:
	.ascii	"total:%-#16d\012\000"
.LC10:
	.ascii	"*************************************mpi pool list*"
	.ascii	"**********************************\012\000"
.LC11:
	.ascii	"poid-total-free-min-size-------------create--------"
	.ascii	"---user---------------------------\012\000"
.LC12:
	.ascii	"%s_%d(%d) \000"
.LC13:
	.ascii	"deleted\000"
.LC14:
	.ascii	"%s_%x(%d) \000"
.LC15:
	.ascii	"\012\000"
.LC16:
	.ascii	"%-#4d %-#5d %-#4d %-#3d %-#16d %-#16s \000"
.LC17:
	.ascii	"%s_%d\000"
.LC18:
	.ascii	"\033[1;31mstruct valloc_mb mismatching\033[0m\000"
.LC19:
	.ascii	"\033[1;31mdma buf create fail\033[0m\000"
.LC20:
	.ascii	"\033[1;31mmpi buf create fail\033[0m\000"
.LC21:
	.ascii	"mpi buf buf_id(%d)\000"
.LC22:
	.ascii	"buf->list->next = %x, %x\000"
.LC23:
	.ascii	"alloc(%d)\000"
.LC24:
	.ascii	"vmpi\000"
.LC25:
	.ascii	"\033[1;31malloc(%d) fail\033[0m\000"
.LC26:
	.ascii	"cma buf = %p, size = %d, refcnt = %d\000"
.LC27:
	.ascii	"please make sure all rockit is closed\000"
.LC28:
	.ascii	"please reset system if want use rockit once more\000"
.LC29:
	.ascii	"valloc_ioctl: nr = %d, index = %d\000"
.LC30:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC31:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC32:
	.ascii	"\033[1;31mmpi buf get fail buf_id(%d)\033[0m\000"
.LC33:
	.ascii	"mpi buf get phys (%08x) buf_id(%d)\000"
.LC34:
	.ascii	"unref %x buffer refcnt = %d\000"
.LC35:
	.ascii	"\033[1;31mstruct valloc_version mismatching\033[0m\000"
.LC36:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC37:
	.ascii	"%d\000"
.LC38:
	.ascii	"\033[1;32mbuf id = %d, user process exit\033[0m\000"
.LC39:
	.ascii	"mpi buf get fd (%d) buf_id(%d)\000"
.LC40:
	.ascii	"\033[1;31mbuf = %x, not unmap\033[0m\000"
.LC41:
	.ascii	"rk-dma-heap-cma\000"
.LC42:
	.ascii	"\033[1;31mvalloc get rk_dma_heap fail\033[0m\000"
.LC43:
	.ascii	"\033[1;32mrk dma heap addr = %08x size = %d\033[0m\000"
.LC44:
	.ascii	"valloc\000"
.LC45:
	.ascii	"VALLOC_IOCTL_VERSION\000"
.LC46:
	.ascii	"VALLOC_IOCTL_MB_GET_FD\000"
.LC47:
	.ascii	"VALLOC_IOCTL_MB_CREATE\000"
.LC48:
	.ascii	"VALLOC_IOCTL_MB_DELETE\000"
.LC49:
	.ascii	"VALLOC_IOCTL_MB_GET_PHY_ADDR\000"
.LC50:
	.ascii	"VALLOC_IOCTL_MB_GET_ID\000"
	.section	___ksymtab_gpl+free_all_cma,"a"
	.align	2
	.type	__ksymtab_free_all_cma, %object
	.size	__ksymtab_free_all_cma, 12
__ksymtab_free_all_cma:
	.word	free_all_cma
	.word	__kstrtab_free_all_cma
	.word	__kstrtabns_free_all_cma
	.section	___ksymtab_gpl+get_dma_buf_phy_addr,"a"
	.align	2
	.type	__ksymtab_get_dma_buf_phy_addr, %object
	.size	__ksymtab_get_dma_buf_phy_addr, 12
__ksymtab_get_dma_buf_phy_addr:
	.word	get_dma_buf_phy_addr
	.word	__kstrtab_get_dma_buf_phy_addr
	.word	__kstrtabns_get_dma_buf_phy_addr
	.section	___ksymtab_gpl+get_mpi_buf,"a"
	.align	2
	.type	__ksymtab_get_mpi_buf, %object
	.size	__ksymtab_get_mpi_buf, 12
__ksymtab_get_mpi_buf:
	.word	get_mpi_buf
	.word	__kstrtab_get_mpi_buf
	.word	__kstrtabns_get_mpi_buf
	.section	__param,"a"
	.align	2
	.type	__param_rk_dma_heap_base, %object
	.size	__param_rk_dma_heap_base, 20
__param_rk_dma_heap_base:
	.word	__param_str_rk_dma_heap_base
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_dma_heap_base
	.type	__param_rk_dma_heap_size, %object
	.size	__param_rk_dma_heap_size, 20
__param_rk_dma_heap_size:
	.word	__param_str_rk_dma_heap_size
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_dma_heap_size
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
