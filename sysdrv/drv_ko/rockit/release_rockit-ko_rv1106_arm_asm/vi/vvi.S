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
	.file	"vvi.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_get_tb_stream_info:					
	.asciz 	"rockit_get_tb_stream_info"					
__kstrtabns_rockit_get_tb_stream_info:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_free_tb_stream_buf:					
	.asciz 	"rockit_free_tb_stream_buf"					
__kstrtabns_rockit_free_tb_stream_buf:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_compat_ioctl, %function
vi_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vi_compat_ioctl, .-vi_compat_ioctl
	.align	1
	.global	vvi_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_get_version, %function
vvi_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r2, #112
	ldr	r3, [r0, #128]
	mov	r4, r1
	movs	r1, #0
	add	r0, r4, #12
	movs	r5, #0
	ldr	r6, [r3, #160]
	bl	memset
	movs	r3, #1
	strb	r5, [r4, #1]
	strb	r3, [r4]
	movs	r3, #21
	strb	r5, [r4, #2]
	strb	r3, [r4, #4]
	strb	r5, [r4, #3]
	strb	r5, [r4, #5]
	strb	r5, [r4, #6]
	strb	r5, [r4, #7]
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6]
	bl	strlen
	movs	r3, #20
	strb	r5, [r4, #53]
	strb	r3, [r4, #52]
	movs	r3, #17
	strb	r5, [r4, #54]
	strb	r5, [r4, #55]
	strb	r3, [r4, #88]
	strb	r5, [r4, #89]
	strb	r5, [r4, #90]
	strb	r5, [r4, #91]
	cmp	r0, #31
	str	r0, [r4, #12]	@ unaligned
	bls	.L3
	movs	r3, #31
	strb	r5, [r4, #13]
	strb	r3, [r4, #12]
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
.L3:
	ldr	r2, [r4, #12]	@ unaligned
	add	r0, r4, #16
	ldr	r1, [r6]
	bl	strncpy
	ldr	r2, [r4, #52]	@ unaligned
	ldr	r1, .L4
	add	r0, r4, #56
	bl	strncpy
	ldr	r2, [r4, #88]	@ unaligned
	ldr	r1, .L4+4
	add	r0, r4, #92
	bl	strncpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	vvi_get_version, .-vvi_get_version
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_new_wrap_line, %function
get_new_wrap_line:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r7, r0
	mov	r1, r0
	.pad #24
	sub	sp, sp, #24
	mov	r8, r2
	mul	r0, r3, r2
	mov	r6, r3
	bl	__aeabi_uidiv
	movw	r3, #259
	ldr	r2, .L13
	movs	r1, #4
	mov	r4, r0
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r0, #8
	strd	r5, r8, [sp, #16]
	strd	r6, r7, [sp, #8]
	ldr	r3, .L13+4
	bl	vlog
	cmp	r4, r5
	bcs	.L9
.L8:
	mov	r1, r4
	mov	r0, r5
	bl	__aeabi_uidivmod
	and	r3, r4, #1
	orrs	r3, r1, r3
	beq	.L6
	subs	r4, r4, #1
	b	.L8
.L9:
	mov	r4, r5
.L6:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L14:
	.align	2
.L13:
	.word	.LC2
	.word	.LANCHOR0
	.fnend
	.size	get_new_wrap_line, .-get_new_wrap_line
	.align	1
	.global	vvi_node_set_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_dev_status, %function
vvi_node_set_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	ldr	r3, [r1, #204]	@ unaligned
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #220
	ldr	r2, [r0, #128]
	beq	.L16
	movw	r3, #599
	ldr	r2, .L25
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L25+4
	movs	r0, #8
	bl	vlog
.L23:
	mov	r4, #-1
	b	.L15
.L16:
	adds	r0, r4, #1
	bne	.L18
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r5, #2
	bls	.L19
	movs	r3, #3
	strd	r5, r3, [sp, #4]
	movw	r3, #605
.L24:
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L25+4
	movs	r0, #8
	ldr	r2, .L25+8
	bl	vlog
.L15:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	ldr	r0, [r1, #8]	@ unaligned
	cmp	r0, #5
	bls	.L20
	movs	r3, #6
	strd	r5, r3, [sp, #4]
	movw	r3, #610
	b	.L24
.L20:
	mov	r4, #1320
	ldr	r6, [r1, #208]	@ unaligned
	muls	r4, r5, r4
	mla	r4, r3, r0, r4
	add	r4, r4, r2
	str	r6, [r4, #1076]
	ldr	r3, [r1, #200]	@ unaligned
	str	r3, [r4, #1068]
.L22:
	movs	r4, #0
	b	.L15
.L18:
	cmp	r4, #2
	bls	.L21
	movs	r3, #3
	ldr	r2, .L25+12
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #617
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L25+4
	bl	vlog
	b	.L23
.L21:
	mla	r4, r3, r4, r2
	ldr	r1, [r1, #208]	@ unaligned
	str	r1, [r4, #416]
	b	.L22
.L26:
	.align	2
.L25:
	.word	.LC3
	.word	.LANCHOR0+18
	.word	.LC4
	.word	.LC5
	.fnend
	.size	vvi_node_set_dev_status, .-vvi_node_set_dev_status
	.align	1
	.global	vvi_node_get_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_status, %function
vvi_node_get_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r3, [r1, #16]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #136
	beq	.L28
	movw	r3, #355
	ldr	r2, .L34
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
.L33:
	mov	r0, #-1
	b	.L27
.L28:
	mov	r3, #358
	ldr	r2, .L34+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
	ldr	r2, [r7, #4]	@ unaligned
	ldr	r1, [r7]	@ unaligned
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L33
	ldr	r4, [r0, #60]
	movs	r1, #5
	ldr	r2, .L34+12
	movs	r0, #8
	ldr	r8, .L34+4
	movs	r6, #0
	ldr	r3, [r4]
	ldr	r9, .L34+20
	str	r3, [sp, #4]
	movw	r3, #363
	str	r3, [sp]
	ldr	r3, .L34+4
	bl	vlog
	ldr	r3, [r4, #76]!
	ldr	r5, [r3], #-36
	subs	r5, r5, #36
.L30:
	add	r2, r3, #36
	cmp	r2, r4
	bne	.L32
	movw	r3, #373
	ldr	r2, .L34+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
.L27:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L32:
	ldr	r2, [r3, #16]
	cmp	r6, #7
	it	le
	addle	r1, r7, r6, lsl #2
	mov	r0, #8
	itt	le
	addle	r6, r6, #1
	strle	r2, [r1, #20]	@ unaligned
	movs	r1, #5
	strd	r3, r2, [sp, #4]
	mov	r3, #370
	mov	r2, r9
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	ldr	r2, [r5, #36]
	mov	r3, r5
	sub	r5, r2, #36
	b	.L30
.L35:
	.align	2
.L34:
	.word	.LC6
	.word	.LANCHOR0+42
	.word	.LC7
	.word	.LC8
	.word	.LC10
	.word	.LC9
	.fnend
	.size	vvi_node_get_status, .-vvi_node_get_status
	.align	1
	.global	vvi_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_start, %function
vvi_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r5, [r3, #160]
	ldr	r3, [r1, #28]	@ unaligned
	cmp	r3, #200
	beq	.L37
	movw	r3, #287
	ldr	r2, .L51
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L51+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L36:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L37:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	ldr	r3, [r4, #56]	@ unaligned
	lsls	r3, r3, #29
	mov	r7, r0
	bpl	.L39
	ldr	r3, [r4, #52]	@ unaligned
	str	r3, [r5, #236]
	ldr	r8, [r4, #32]	@ unaligned
	ldr	r6, [r4, #52]	@ unaligned
	mov	r0, r8
	mov	r1, r6
	bl	__aeabi_uidivmod
	cbz	r1, .L40
	mov	r3, r6
	ldr	r2, [r4, #12]	@ unaligned
	mov	r1, r8
	ldr	r0, [r4, #24]	@ unaligned
	bl	get_new_wrap_line
	mov	r6, r0
.L40:
	bl	mcu_wrap_end
	mov	r0, r6
	bl	mcu_set_wrap_line
	movs	r1, #0
	ldr	r0, [r4, #32]	@ unaligned
	bl	mcu_wrap_config
	movs	r3, #1
	str	r3, [r5, #228]
	ldr	r3, [r4, #52]	@ unaligned
	str	r3, [r5, #232]
.L39:
	movs	r3, #1
	str	r3, [r5, #4]
	cbz	r7, .L41
	mov	r3, #308
	ldr	r2, .L51+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L51+4
	movs	r0, #8
	bl	vlog
	mov	r0, r7
	bl	mpi_node_streamon
.L41:
	mov	r3, #312
	ldr	r2, .L51+12
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L51+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
	b	.L36
.L52:
	.align	2
.L51:
	.word	.LC11
	.word	.LANCHOR0+62
	.word	.LC12
	.word	.LC13
	.fnend
	.size	vvi_node_start, .-vvi_node_start
	.align	1
	.global	vvi_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stop, %function
vvi_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #28]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r3, #200
	beq	.L54
	mov	r3, #324
	ldr	r2, .L64
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L64+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L53:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L54:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L56
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L64+8
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #330
	str	r3, [sp]
	ldr	r3, .L64+4
	bl	vlog
	movs	r1, #1
	mov	r0, r6
	bl	mpi_node_flush
	movs	r1, #0
	str	r1, [r5, #-28]
	mov	r2, #1320
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	muls	r2, r0, r2
	movs	r0, #220
	mla	r3, r0, r3, r2
	add	r3, r3, r5
	str	r1, [r3, #1068]
.L56:
	ldr	r0, [r5, #196]
	cmp	r0, #0
	beq	.L53
	ldr	r4, [r4, #8]	@ unaligned
	cbnz	r4, .L57
	strd	r4, r4, [r5, #196]
	bl	mcu_wrap_end
	movs	r0, #10
	bl	msleep
.L57:
	movs	r0, #0
	b	.L53
.L65:
	.align	2
.L64:
	.word	.LC11
	.word	.LANCHOR0+77
	.word	.LC14
	.fnend
	.size	vvi_node_stop, .-vvi_node_stop
	.align	1
	.global	vvi_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_get, %function
vvi_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1, #16]	@ unaligned
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r0, #128]
	cmp	r3, #136
	beq	.L67
	mov	r3, #414
	ldr	r2, .L77
	str	r3, [sp]
	ldr	r3, .L77+4
.L76:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L75:
	mov	r0, #-1
.L66:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L67:
	ldr	r3, [r6, #196]
	ldr	r2, [r1, #4]	@ unaligned
	cbz	r3, .L69
	cbnz	r2, .L69
	movw	r3, #419
	ldr	r2, .L77+8
	str	r3, [sp]
	ldr	r3, .L77+4
	b	.L76
.L69:
	ldr	r1, [r4]	@ unaligned
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L70
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L77+12
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #425
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	b	.L75
.L70:
	ldr	r3, [r4, #12]	@ unaligned
	movs	r1, #0
	str	r3, [r0, #384]
	bl	mpi_node_get_out_buffer
	mov	r5, r0
	cbnz	r0, .L71
	ldr	r3, [r4, #12]	@ unaligned
	movs	r1, #2
	ldr	r2, .L77+16
	movs	r0, #8
	str	r3, [sp, #4]
	mov	r3, #432
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	b	.L75
.L71:
	ldr	r2, [r4]	@ unaligned
	ldr	r1, [r7, #76]
	movs	r7, #6
	ldr	r3, [r4, #4]	@ unaligned
	muls	r7, r2, r7
	add	r0, r0, r1, lsl #3
	add	r0, r0, #308
	adds	r2, r3, r7
	addw	r3, r3, #607
	add	r3, r3, r7
	add	r2, r6, r2, lsl #3
	add	r2, r2, #4832
	add	r6, r6, r3, lsl #3
	subs	r6, r6, #28
	ldr	ip, [r2]
	str	r0, [r2]
	add	r2, r5, r1, lsl #3
	add	r1, r5, #616
	strd	r6, ip, [r2, #308]
	movs	r2, #80
	str	r0, [ip]
	add	r0, r4, #56
	ldr	r3, [r5, #448]
	ldr	r3, [r3]
	str	r3, [r4, #52]	@ unaligned
	bl	memcpy
	ldr	r1, [r4, #112]	@ unaligned
	ldr	r2, [r4, #116]	@ unaligned
	movs	r0, #8
	ldr	r3, [r5]
	str	r3, [r4, #8]	@ unaligned
	strd	r1, r2, [sp, #16]
	movs	r1, #5
	ldr	r2, [r4, #108]	@ unaligned
	str	r5, [sp, #4]
	strd	r3, r2, [sp, #8]
	mov	r3, #442
	ldr	r2, .L77+20
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	ldrd	r2, [r5, #672]
	movs	r1, #5
	movs	r0, #8
	strd	r2, [sp, #24]
	ldr	r3, [r5, #624]
	ldr	r2, .L77+24
	str	r3, [sp, #16]
	ldr	r3, [r5, #620]
	str	r3, [sp, #12]
	ldr	r3, [r5, #448]
	ldr	r3, [r3]
	str	r3, [sp, #8]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #446
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	movs	r0, #0
	b	.L66
.L78:
	.align	2
.L77:
	.word	.LC6
	.word	.LANCHOR0+91
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.fnend
	.size	vvi_mb_get, .-vvi_mb_get
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_release, %function
vi_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r1, #128]
	mov	r0, r5
	bl	mpi_obj_unref
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L80
	mov	r10, r5
	ldr	r1, .L103
	ldr	r2, [r10], #208
	add	r9, r5, #4800
	ldr	r0, .L103+4
	add	r9, r9, #28
	bl	printk
	mov	r8, #0
	add	r3, r5, #868
	str	r3, [sp, #24]
.L90:
	movs	r2, #220
	movs	r1, #0
	mov	r0, r10
	sub	fp, r9, #4800
	bl	memset
	sub	fp, fp, #28
	movs	r7, #0
	ldr	r3, [sp, #24]
	str	r3, [sp, #16]
.L83:
	ldr	r3, [sp, #16]
	cbz	r3, .L81
	movs	r2, #220
	movs	r1, #0
	mov	r0, r3
	bl	memset
.L81:
	mov	r2, r7
	mov	r1, r8
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbnz	r0, .L82
.L89:
	adds	r7, r7, #1
	ldr	r3, [sp, #16]
	cmp	r7, #6
	add	fp, fp, #8
	add	r3, r3, #220
	str	r3, [sp, #16]
	bne	.L83
	add	r8, r8, #1
	ldr	r3, [sp, #24]
	cmp	r8, #3
	add	r10, r10, #220
	add	r3, r3, #1320
	add	r9, r9, #48
	str	r3, [sp, #24]
	bne	.L90
	movs	r3, #0
	strd	r3, r3, [r5, #196]
.L80:
	movs	r0, #0
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L82:
	ldr	r4, [r0, #60]
	mov	r2, r7
	mov	r1, r8
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	cbz	r4, .L85
	movs	r1, #1
	mov	r0, r4
	bl	mpi_buf_pool_destroy
.L85:
	mov	r3, #856
	ldr	r2, .L103+8
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L103
	movs	r0, #8
	strd	r8, r7, [sp, #4]
	bl	vlog
	ldr	r2, [r6, #76]
	ldr	r4, [r9, r7, lsl #3]
	mvn	r3, #43
	add	r1, r2, #33
	sub	r3, r3, r1, lsl #3
	add	r4, r4, r3
	add	r2, r4, r2, lsl #3
	ldr	r2, [r2, #308]
	adds	r3, r2, r3
	str	r3, [sp, #20]
	add	r3, fp, #4800
	adds	r3, r3, #28
	str	r3, [sp, #28]
.L86:
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #28]
	add	r3, r4, r3, lsl #3
	add	r3, r3, #308
	cmp	r3, r2
	beq	.L89
	cbz	r4, .L87
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L103+12
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #859
	str	r3, [sp]
	ldr	r3, .L103
	bl	vlog
	ldr	r3, [r6, #76]
	mov	r0, r4
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	bl	mpi_obj_unref
.L87:
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #20]
	add	r1, r3, #33
	ldr	r4, [sp, #20]
	add	r3, r2, r3, lsl #3
	mvn	r2, #43
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	add	r3, r3, r2
	str	r3, [sp, #20]
	b	.L86
.L104:
	.align	2
.L103:
	.word	.LANCHOR0+102
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.fnend
	.size	vi_release, .-vi_release
	.align	1
	.global	vvi_node_get_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_dev_status, %function
vvi_node_get_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	ldr	r3, [r1, #204]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #220
	ldr	r7, [r1, #4]	@ unaligned
	ldr	r6, [r1, #8]	@ unaligned
	ldr	r9, [r0, #128]
	beq	.L106
	movw	r3, #634
	ldr	r2, .L125
	str	r3, [sp]
	ldr	r3, .L125+4
.L124:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L122:
	mov	r4, #-1
	b	.L105
.L106:
	ldr	r3, .L125+8
	ldr	r3, [r3]
	cbnz	r3, .L117
.L109:
	adds	r3, r4, #1
	bne	.L113
	cmp	r7, #2
	bls	.L114
	movs	r3, #3
	strd	r7, r3, [sp, #4]
	movw	r3, #655
.L123:
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L125+4
	movs	r0, #8
	ldr	r2, .L125+12
	bl	vlog
.L105:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L111:
	bl	mcu_get_wrap_status
	cbnz	r0, .L110
	movs	r0, #10
	bl	msleep
.L108:
	adds	r8, r8, #-1
	bcs	.L111
.L112:
	mov	r3, #648
	ldr	r2, .L125+16
	str	r3, [sp]
	ldr	r3, .L125+4
	b	.L124
.L117:
	mov	r8, #50
	b	.L108
.L110:
	cmp	r8, #0
	bne	.L109
	b	.L112
.L114:
	cmp	r6, #5
	bls	.L115
	movs	r3, #6
	strd	r7, r3, [sp, #4]
	mov	r3, #660
	b	.L123
.L115:
	mov	r3, #1320
	movs	r4, #220
	muls	r7, r3, r7
	mla	r6, r4, r6, r7
	add	r6, r6, r9
	ldr	r3, [r6, #1076]
	str	r3, [r5, #208]	@ unaligned
	ldr	r3, [r6, #1068]
	str	r3, [r5, #200]	@ unaligned
.L121:
	movs	r4, #0
	b	.L105
.L113:
	cmp	r4, #2
	bls	.L116
	movs	r3, #3
	ldr	r2, .L125+20
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #667
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L125+4
	bl	vlog
	b	.L122
.L116:
	movs	r3, #220
	mla	r4, r3, r4, r9
	ldr	r3, [r4, #416]
	str	r3, [r5, #208]	@ unaligned
	b	.L121
.L126:
	.align	2
.L125:
	.word	.LC3
	.word	.LANCHOR0+113
	.word	.LANCHOR1
	.word	.LC4
	.word	.LC23
	.word	.LC5
	.fnend
	.size	vvi_node_get_dev_status, .-vvi_node_get_dev_status
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_open, %function
vi_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r3, #15
	ldr	r0, .L128
	str	r0, [r1, #128]
	str	r3, [r0, #-4]
	bl	mpi_obj_ref
	movw	r3, #827
	ldr	r2, .L128+4
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L128+8
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L129:
	.align	2
.L128:
	.word	g_vvi_dev+32
	.word	.LC24
	.word	.LANCHOR0+137
	.fnend
	.size	vi_open, .-vi_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_ioctl, %function
vi_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r3, r2
	ldr	r2, [r0, #128]
	mov	r6, r1
	uxtb	r4, r6
	ldr	r1, [r2, #160]
	ldr	r5, [r1, #28]
	cmp	r5, r4
	bls	.L131
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #24]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r1, r5, r4, r1
	cbz	r1, .L131
	mov	r2, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L131:
	str	r4, [sp, #4]
	movw	r3, #809
	ldr	r2, .L136
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L136+4
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L137:
	.align	2
.L136:
	.word	.LC25
	.word	.LANCHOR0+145
	.fnend
	.size	vi_ioctl, .-vi_ioctl
	.align	1
	.global	vvi_node_get_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chn_fr, %function
vvi_node_get_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r7, [r1]	@ unaligned
	cmp	r3, #20
	ldr	r6, [r1, #4]	@ unaligned
	ldr	r5, [r0, #128]
	beq	.L139
	movw	r3, #714
	ldr	r2, .L142
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L142+4
	movs	r0, #8
	bl	vlog
.L141:
	mov	r0, #-1
	b	.L138
.L139:
	mov	r2, r6
	mov	r1, r7
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L141
	mov	r2, #1320
	movs	r3, #220
	muls	r2, r7, r2
	movs	r0, #0
	mla	r2, r3, r6, r2
	add	r2, r2, r5
	ldr	r3, [r2, #996]
	str	r3, [r4, #12]	@ unaligned
	ldr	r3, [r2, #1000]
	str	r3, [r4, #16]	@ unaligned
.L138:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L143:
	.align	2
.L142:
	.word	.LC26
	.word	.LANCHOR0+154
	.fnend
	.size	vvi_node_get_chn_fr, .-vvi_node_get_chn_fr
	.align	1
	.global	vvi_node_set_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chn_fr, %function
vvi_node_set_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r3, #20
	ldr	r7, [r1]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	beq	.L145
	movw	r3, #686
	ldr	r2, .L149
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L149+4
	movs	r0, #8
	bl	vlog
.L144:
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L145:
	mov	r2, r6
	mov	r1, r7
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L144
	mov	r1, #1320
	movs	r2, #220
	muls	r1, r7, r1
	ldr	r3, [r4, #12]	@ unaligned
	mla	r1, r2, r6, r1
	add	r2, r0, #212
	add	r1, r1, r5
	str	r3, [r1, #996]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [r1, #1000]
	add	r3, r0, #204
	ldr	r1, [r4, #16]	@ unaligned
	ldr	r0, [r4, #12]	@ unaligned
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	mpi_node_set_frame_rate
.L150:
	.align	2
.L149:
	.word	.LC26
	.word	.LANCHOR0+174
	.fnend
	.size	vvi_node_set_chn_fr, .-vvi_node_set_chn_fr
	.align	1
	.global	vvi_node_set_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chns_attr, %function
vvi_node_set_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r2, [r1, #204]	@ unaligned
	ldr	r5, [r1]	@ unaligned
	cmp	r2, #220
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r0, [r0, #128]
	beq	.L152
	movw	r3, #547
	ldr	r2, .L158
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L158+4
	movs	r0, #8
	bl	vlog
.L157:
	mov	r0, #-1
.L151:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L152:
	cmp	r5, #2
	bls	.L154
	movs	r3, #3
	ldr	r2, .L158+8
	strd	r5, r3, [sp, #4]
	movw	r3, #551
	str	r3, [sp]
	ldr	r3, .L158+4
.L156:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L157
.L154:
	cmp	r3, #5
	bls	.L155
	movs	r2, #6
	strd	r3, r2, [sp, #4]
	movw	r3, #555
	ldr	r2, .L158+12
	str	r3, [sp]
	ldr	r3, .L158+4
	b	.L156
.L155:
	mov	r4, #1320
	muls	r4, r5, r4
	mla	r3, r2, r3, r4
	adds	r4, r0, r3
	add	r0, r4, #868
	ldr	r5, [r4, #1076]
	bl	memcpy
	movs	r0, #0
	str	r5, [r4, #1076]
	b	.L151
.L159:
	.align	2
.L158:
	.word	.LC3
	.word	.LANCHOR0+194
	.word	.LC5
	.word	.LC27
	.fnend
	.size	vvi_node_set_chns_attr, .-vvi_node_set_chns_attr
	.align	1
	.global	vvi_node_get_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chns_attr, %function
vvi_node_get_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r1
	ldr	r2, [r5, #204]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1]	@ unaligned
	cmp	r2, #220
	ldr	r4, [r1, #8]	@ unaligned
	ldr	r1, [r0, #128]
	beq	.L161
	movw	r3, #574
	ldr	r2, .L167
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L167+4
	movs	r0, #8
	bl	vlog
.L166:
	mov	r0, #-1
.L160:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L161:
	cmp	r3, #2
	bls	.L163
	movs	r2, #3
	strd	r3, r2, [sp, #4]
	movw	r3, #578
	ldr	r2, .L167+8
	str	r3, [sp]
	ldr	r3, .L167+4
.L165:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L166
.L163:
	cmp	r4, #5
	bls	.L164
	movs	r3, #6
	ldr	r2, .L167+12
	strd	r4, r3, [sp, #4]
	movw	r3, #582
	str	r3, [sp]
	ldr	r3, .L167+4
	b	.L165
.L164:
	muls	r4, r2, r4
	mov	r0, #1320
	mla	r3, r0, r3, r4
	mov	r0, r5
	add	r1, r1, r3
	add	r1, r1, #868
	bl	memcpy
	movs	r0, #0
	b	.L160
.L168:
	.align	2
.L167:
	.word	.LC3
	.word	.LANCHOR0+217
	.word	.LC5
	.word	.LC27
	.fnend
	.size	vvi_node_get_chns_attr, .-vvi_node_get_chns_attr
	.align	1
	.global	vvi_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_delete, %function
vvi_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r1
	ldr	r3, [r1, #28]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	ldr	r7, [r0, #128]
	cmp	r3, #200
	ldr	r8, [r1]	@ unaligned
	sub	fp, r7, #32
	ldr	r4, [r1, #8]	@ unaligned
	beq	.L170
	movs	r3, #214
	ldr	r2, .L192
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L192+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L169:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L170:
	mov	r2, r4
	mov	r1, r8
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L172
	movs	r5, #6
	addw	r3, r4, #607
	mul	r5, r5, r8
	add	r3, r3, r5
	add	r5, r5, r4
	add	r3, fp, r3, lsl #3
	add	r5, r7, r5, lsl #3
	adds	r3, r3, #4
	str	r3, [sp, #20]
	movw	r3, #4828
	ldr	r2, [sp, #20]
	ldr	r3, [r5, r3]
	cmp	r2, r3
	bne	.L173
	movs	r3, #221
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L192+4
	movs	r0, #8
	ldr	r2, .L192+8
	bl	vlog
.L173:
	ldr	r2, [r6, #76]
	movw	r1, #4828
	ldr	r5, [r5, r1]
	mvn	r10, #43
	add	r3, r2, #33
	sub	r3, r10, r3, lsl #3
	add	r5, r5, r3
	add	r2, r5, r2, lsl #3
	ldr	r2, [r2, #308]
.L191:
	add	r10, r3, r2
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #20]
	add	r3, r5, r3, lsl #3
	add	r3, r3, #308
	cmp	r2, r3
	bne	.L176
	ldr	r5, [r6, #60]
	mov	r0, r6
	bl	mpi_node_del_out_watcher
	ldr	r2, [r9, #8]	@ unaligned
	ldr	r1, [r9]	@ unaligned
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	cbz	r5, .L177
	movs	r1, #1
	mov	r0, r5
	bl	mpi_buf_pool_destroy
.L177:
	movs	r3, #237
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L192+4
	movs	r0, #8
	ldr	r2, .L192+12
	bl	vlog
.L172:
	cmp	fp, #0
	beq	.L178
	mov	r0, #1320
	movs	r2, #220
	mul	r8, r0, r8
	movs	r1, #0
	mla	r4, r2, r4, r8
	add	r7, r7, r4
	add	r4, r4, #900
	add	r0, fp, r4
	ldr	r5, [r7, #1076]
	bl	memset
	str	r5, [r7, #1076]
.L178:
	movs	r3, #247
	ldr	r2, .L192+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L192+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
	b	.L169
.L176:
	cbz	r5, .L175
	ldr	r3, [r5]
	movs	r1, #4
	ldr	r2, .L192+20
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #225
	str	r3, [sp]
	ldr	r3, .L192+4
	bl	vlog
	ldr	r3, [r6, #76]
	mov	r0, r5
	add	r3, r5, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	bl	mpi_obj_unref
.L175:
	ldr	r3, [r6, #76]
	mvn	r2, #43
	mov	r5, r10
	add	r1, r3, #33
	add	r3, r10, r3, lsl #3
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	b	.L191
.L193:
	.align	2
.L192:
	.word	.LC11
	.word	.LANCHOR0+240
	.word	.LC28
	.word	.LC21
	.word	.LC29
	.word	.LC22
	.fnend
	.size	vvi_node_delete, .-vvi_node_delete
	.align	1
	.global	rockit_free_tb_stream_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_free_tb_stream_buf, %function
rockit_free_tb_stream_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r1, #3520
	ldr	r3, .L197
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L195
	ldr	r0, .L197+4
	bl	printk
	mov	r0, #-1
.L194:
	pop	{r3, r4, r5, pc}
.L195:
	ldr	r3, .L197+8
	movs	r4, #0
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_free_tb_stream_buf
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L194
.L198:
	.align	2
.L197:
	.word	kmalloc_caches
	.word	.LC30
	.word	.LC31
	.fnend
	.size	rockit_free_tb_stream_buf, .-rockit_free_tb_stream_buf
	.align	1
	.global	vvi_change_resolution
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_change_resolution, %function
vvi_change_resolution:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r6, r1
	ldr	r3, [r0, #128]
	mov	r1, #3520
	ldr	r7, [r3, #160]
	ldr	r3, .L220
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L200
	ldr	r0, .L220+4
	bl	printk
.L211:
	mov	r0, #-1
	b	.L199
.L200:
	ldr	r3, [r6, #16]	@ unaligned
	cmp	r3, #33
	beq	.L202
	ldr	r1, .L220+8
	mov	r2, #470
	ldr	r0, .L220+12
.L219:
	bl	printk
	b	.L211
.L202:
	ldr	r2, [r6, #4]	@ unaligned
	movs	r0, #8
	ldr	r1, [r6]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r4, r0
	cmp	r0, #0
	beq	.L211
	ldr	r3, [r0, #56]
	movs	r1, #4
	ldr	r8, [r7, #232]
	ldr	r10, [r6, #20]	@ unaligned
	ldr	r9, [r6, #24]	@ unaligned
	str	r3, [r5, #24]
	ldr	r3, [r0, #44]
	movs	r0, #8
	ldr	r2, .L220+16
	ldr	r3, [r3, #44]
	str	r3, [r5, #4]
	ldr	r3, [r7, #228]
	str	r3, [sp, #4]
	movw	r3, #487
	str	r3, [sp]
	ldr	r3, .L220+8
	bl	vlog
	ldr	r3, [r7, #228]
	cbz	r3, .L203
	ldr	r3, [r6, #4]	@ unaligned
	cbnz	r3, .L203
	ldr	r3, [r7, #236]
	mov	r1, r9
	ldr	r2, [r6, #8]	@ unaligned
	mov	r0, r10
	bl	get_new_wrap_line
	mov	r8, r0
	bl	mcu_wrap_end
	movs	r0, #10
	bl	msleep
.L203:
	ldr	r3, [r4, #44]
	ldr	r1, .L220+20
	ldr	r0, [r3, #44]
	bl	strstr
	cbnz	r0, .L204
	ldr	r3, [r4, #56]
	str	r3, [r5, #24]
	ldr	r3, [r4, #44]
	movs	r4, #2
	ldr	r3, [r3, #44]
	str	r3, [r5, #4]
.L208:
	mov	r0, r5
	bl	rkisp_rockit_pause_stream
	cbz	r0, .L205
	movw	r2, #503
	ldr	r1, .L220+8
	ldr	r0, .L220+24
	b	.L219
.L205:
	mov	r3, r8
	mov	r2, r9
	mov	r1, r10
	mov	r0, r5
	bl	rkisp_rockit_config_stream
	cbz	r0, .L206
	mov	r2, #508
	ldr	r1, .L220+8
	ldr	r0, .L220+28
	bl	printk
	mvn	r0, #1
.L199:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L206:
	mov	r0, r5
	bl	rkisp_rockit_resume_stream
	cbz	r0, .L207
	movw	r2, #514
	ldr	r1, .L220+8
	ldr	r0, .L220+32
	bl	printk
	mvn	r0, #2
	b	.L199
.L207:
	cmp	r4, #1
	beq	.L209
	movs	r4, #1
	b	.L208
.L204:
	mov	r0, r4
	bl	mpi_node_streamoff
	ldr	r3, [r4, #80]
	mov	r0, r4
	str	r10, [r3, #4]
	ldr	r3, [r4, #80]
	str	r9, [r3, #8]
	bl	mpi_node_streamon
.L209:
	ldr	r3, [r7, #228]
	cbz	r3, .L210
	ldr	r3, [r6, #4]	@ unaligned
	cbnz	r3, .L210
	mov	r0, r8
	bl	mcu_set_wrap_line
	mov	r1, r8
	mov	r0, r9
	bl	mcu_wrap_config
	str	r8, [r7, #232]
.L210:
	mov	r0, r5
	bl	kfree
	movs	r0, #0
	b	.L199
.L221:
	.align	2
.L220:
	.word	kmalloc_caches
	.word	.LC30
	.word	.LANCHOR0+256
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.fnend
	.size	vvi_change_resolution, .-vvi_change_resolution
	.align	1
	.global	rockit_get_tb_stream_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_get_tb_stream_info, %function
rockit_get_tb_stream_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L225
	mov	r1, #3520
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L223
	ldr	r0, .L225+4
	bl	printk
	mov	r0, #-1
.L222:
	pop	{r4, r5, r6, pc}
.L223:
	ldr	r3, .L225+8
	movs	r4, #0
	mov	r1, r6
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_get_tb_stream_info
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L222
.L226:
	.align	2
.L225:
	.word	kmalloc_caches
	.word	.LC30
	.word	.LC31
	.fnend
	.size	rockit_get_tb_stream_info, .-rockit_get_tb_stream_info
	.align	1
	.global	vvi_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_create, %function
vvi_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L263
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #76
	sub	sp, sp, #76
	ldr	r2, [r3]
	mov	r4, r1
	mov	r8, r3
	str	r2, [sp, #68]
	ldr	r2, [r0, #128]
	ldr	r5, [r2, #160]
	ldr	r2, [r1, #28]	@ unaligned
	cmp	r2, #200
	beq	.L228
	movs	r3, #102
	ldr	r2, .L263+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L263+8
	movs	r0, #8
	bl	vlog
.L260:
	mov	r0, #-1
	b	.L227
.L228:
	ldr	r0, .L263+12
	bl	mpi_allocator_find_by_name
	mov	r9, r0
	cbnz	r0, .L230
	movs	r3, #107
	ldr	r2, .L263+16
	str	r3, [sp]
	ldr	r3, .L263+8
	str	r0, [sp, #4]
.L262:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L260
.L230:
	ldr	r7, [r4, #8]	@ unaligned
	movs	r0, #8
	ldr	r6, [r4]	@ unaligned
	mov	r2, r7
	mov	r1, r6
	bl	vsys_get_node_from_map
	mov	fp, r0
	cbz	r0, .L231
	movs	r3, #116
	str	r7, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L263+8
	movs	r0, #8
	ldr	r2, .L263+20
	bl	vlog
	mvn	r0, #1
.L227:
	ldr	r2, [sp, #68]
	ldr	r3, [r8]
	cmp	r2, r3
	beq	.L246
	bl	__stack_chk_fail
.L231:
	add	r3, sp, #36
	mov	r1, r0
	movs	r2, #32
	add	r5, r5, r6, lsl #2
	mov	r0, r3
	bl	memset
	add	r2, r4, #60
	ldr	r10, [r4, #56]	@ unaligned
	mov	r0, r2
	uxtb	r10, r10
	str	r2, [sp, #28]
	bl	mpi_dev_find_by_name
	movs	r1, #4
	ldr	r2, [sp, #28]
	add	r3, sp, #36
	str	r0, [r5, #196]
	strd	r0, r3, [sp, #8]
	movs	r3, #132
	str	r2, [sp, #16]
	movs	r0, #8
	str	r3, [sp]
	str	r6, [sp, #4]
	ldr	r3, .L263+8
	ldr	r2, .L263+24
	bl	vlog
	cmp	r10, #1
	bhi	.L232
	ldr	r3, .L263+28
	mov	r1, #3520
	ldr	r0, [r3, #4]
	bl	kmem_cache_alloc
	movs	r2, #80
	mov	r1, fp
	bl	memset
	ldr	r1, [r4, #24]	@ unaligned
	str	r1, [r0, #4]
	mov	r3, r0
	ldr	r2, [r4, #32]	@ unaligned
	strd	r2, r1, [r0, #8]
	str	r2, [r0, #16]
	ldr	r2, [r4, #100]	@ unaligned
	str	r2, [r0, #24]
	ldr	r0, [r5, #196]
	cbnz	r0, .L233
.L236:
	movs	r3, #147
	ldr	r2, .L263+32
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L263+8
	movs	r0, #8
	strd	r6, r7, [sp, #4]
	bl	vlog
	ldr	r2, .L263+36
	ldr	r3, .L263+40
	cmp	r10, #1
	it	hi
	movhi	r3, r2
	ldr	r2, .L263+44
	str	r3, [sp, #4]
	movs	r3, #148
	str	r3, [sp]
	ldr	r3, .L263+8
	b	.L262
.L233:
	mov	r2, fp
	mov	r1, r7
.L257:
	bl	mpi_dev_create_node_with_params
	mov	r5, r0
	cmp	r0, #0
	beq	.L236
	movs	r3, #151
	movs	r1, #4
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L263+8
	strd	r6, r7, [sp, #4]
	ldr	r2, .L263+48
	bl	vlog
	ldr	r1, .L263+52
	str	r1, [r5, #4]
	ldr	r3, [r4, #44]	@ unaligned
	cmp	r3, #1
	bne	.L238
	ldr	r2, [r4, #40]	@ unaligned
	cbnz	r2, .L239
	movs	r3, #4
	strb	r2, [r4, #37]
	strb	r3, [r4, #36]
	strb	r2, [r4, #38]
	strb	r2, [r4, #39]
.L239:
	ldr	r3, [r4, #36]	@ unaligned
	cmp	r3, #1
	bne	.L240
	str	r1, [sp]
	movs	r0, #0
	ldr	r1, .L263+56
	movs	r3, #4
	strb	r0, [r4, #37]
	strb	r3, [r4, #36]
	strb	r0, [r4, #38]
	strb	r0, [r4, #39]
.L258:
	mov	r0, r9
	bl	mpi_buf_pool_create
	ldr	r3, [r4, #36]	@ unaligned
	ldr	r2, .L263+60
	movs	r1, #4
	str	r3, [sp, #8]
	mov	r6, r0
	ldr	r3, [r4, #8]	@ unaligned
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #165
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
.L261:
	cbnz	r6, .L259
.L245:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L263+64
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #178
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	mov	r0, r5
	bl	mpi_node_destroy
	b	.L260
.L232:
	mov	r3, fp
	mov	r2, fp
	mov	r1, r7
	ldr	r0, [r5, #196]
	b	.L257
.L240:
	str	r1, [sp]
	movs	r1, #1
	b	.L258
.L238:
	cmp	r3, #0
	bne	.L244
	ldr	r0, [r4, #48]	@ unaligned
	bl	vsys_get_pool
	ldr	r3, [r4, #48]	@ unaligned
	ldr	r2, .L263+68
	movs	r1, #4
	mov	r6, r0
	str	r3, [sp, #4]
	movs	r0, #8
	movs	r3, #172
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	b	.L261
.L259:
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_add_user
.L243:
	add	r3, r5, #204
	add	r2, r5, #212
	ldr	r1, [r4, #132]	@ unaligned
	ldr	r0, [r4, #128]	@ unaligned
	bl	mpi_node_set_frame_rate
	ldr	r3, [r4, #20]	@ unaligned
	ldr	r2, .L263+72
	movs	r1, #4
	movs	r0, #8
	strd	r7, r3, [sp, #4]
	movs	r3, #188
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	ldr	r1, [r4, #20]	@ unaligned
	mov	r0, r5
	bl	mpi_node_add_out_watcher
	mov	r3, r5
	ldr	r2, [r4, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_add_user
	movs	r3, #194
	ldr	r2, .L263+76
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	movs	r0, #0
	b	.L227
.L244:
	movs	r6, #0
	cmp	r6, #0
	bne	.L243
	b	.L245
.L246:
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L264:
	.align	2
.L263:
	.word	__stack_chk_guard
	.word	.LC11
	.word	.LANCHOR0+278
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	kmalloc_caches
	.word	.LC43
	.word	.LC38
	.word	.LC34
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	-2147483647
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.fnend
	.size	vvi_node_create, .-vvi_node_create
	.align	1
	.global	vvi_mb_put
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_put, %function
vvi_mb_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r1
	ldr	r3, [r1, #16]	@ unaligned
	cmp	r3, #136
	beq	.L266
	movw	r3, #387
	ldr	r2, .L270
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L270+4
	movs	r0, #8
	bl	vlog
.L268:
	mov	r0, #-1
	b	.L265
.L266:
	ldr	r2, [r1, #4]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L268
	movs	r1, #4
	ldr	r0, [r5, #8]	@ unaligned
	bl	mpi_obj_from_id
	ldr	r2, .L270+8
	movs	r1, #5
	ldr	r3, [r0, #448]
	mov	r4, r0
	strd	r0, r3, [sp, #8]
	movs	r0, #8
	ldr	r3, [r5, #8]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #396
	str	r3, [sp]
	ldr	r3, .L270+4
	bl	vlog
	cbz	r4, .L269
	ldr	r3, [r6, #76]
	movs	r0, #8
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	movw	r3, #399
	ldr	r2, .L270+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L270+4
	bl	vlog
	mov	r0, r6
	add	r2, r6, #400
	mov	r1, r4
	bl	mpi_node_release_buffer_flag
	movs	r0, #0
.L265:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L269:
	mov	r0, r4
	b	.L265
.L271:
	.align	2
.L270:
	.word	.LC6
	.word	.LANCHOR0+294
	.word	.LC52
	.word	.LC53
	.fnend
	.size	vvi_mb_put, .-vvi_mb_put
	.align	1
	.global	vvi_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_probe, %function
vvi_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r2, #5004
	ldr	r4, .L277
	mov	r5, r0
	movs	r1, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #224]
	mov	r2, r5
	ldr	r3, .L277+4
	movs	r1, #8
	str	r4, [r4, #192]
	str	r3, [r4, #24]
	movs	r3, #15
	str	r3, [r4, #28]
	str	r0, [r4]
	add	r0, r4, #32
	bl	mpi_dev_register
	movs	r3, #0
	str	r3, [r4, #100]
	movs	r0, #4
	strd	r3, r3, [r4, #108]
	ldr	r4, .L277+8
.L273:
	subs	r2, r4, r3
	movs	r1, #0
.L274:
	adds	r1, r1, #1
	adds	r5, r2, r3
	cmp	r1, #6
	str	r2, [r2]
	str	r2, [r5, r0]
	add	r2, r2, #8
	bne	.L274
	subs	r3, r3, #48
	adds	r0, r0, #48
	cmn	r3, #144
	bne	.L273
	movs	r2, #0
	ldr	r1, .L277+12
	ldr	r0, .L277+16
	pop	{r3, r4, r5, lr}
	b	mpi_sysfs_dev_add
.L278:
	.align	2
.L277:
	.word	g_vvi_dev
	.word	.LANCHOR0+308
	.word	g_vvi_dev+4860
	.word	.LANCHOR0+608
	.word	g_vvi_dev+32
	.fnend
	.size	vvi_probe, .-vvi_probe
	.align	1
	.global	vvi_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_shutdown, %function
vvi_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L280
	add	r0, r4, #32
	str	r3, [r4, #12]
	bl	mpi_dev_unregister
	ldr	r0, [r4]
	pop	{r4, lr}
	b	kfree
.L281:
	.align	2
.L280:
	.word	g_vvi_dev
	.fnend
	.size	vvi_shutdown, .-vvi_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vvi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_init, %function
vvi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L283
	bl	vvi_probe
	movs	r0, #0
	pop	{r3, pc}
.L284:
	.align	2
.L283:
	.word	.LC46
	.fnend
	.size	vvi_init, .-vvi_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vvi_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_exit, %function
vvi_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vvi_shutdown
	.fnend
	.size	vvi_exit, .-vvi_exit
	.global	wait_mcu_flag
	.global	g_vvi_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.40281, %object
	.size	__func__.40281, 18
__func__.40281:
	.ascii	"get_new_wrap_line\000"
	.type	__func__.40433, %object
	.size	__func__.40433, 24
__func__.40433:
	.ascii	"vvi_node_set_dev_status\000"
	.type	__func__.40319, %object
	.size	__func__.40319, 20
__func__.40319:
	.ascii	"vvi_node_get_status\000"
	.type	__func__.40294, %object
	.size	__func__.40294, 15
__func__.40294:
	.ascii	"vvi_node_start\000"
	.type	__func__.40308, %object
	.size	__func__.40308, 14
__func__.40308:
	.ascii	"vvi_node_stop\000"
	.type	__func__.40365, %object
	.size	__func__.40365, 11
__func__.40365:
	.ascii	"vvi_mb_get\000"
	.type	__func__.40568, %object
	.size	__func__.40568, 11
__func__.40568:
	.ascii	"vi_release\000"
	.type	__func__.40449, %object
	.size	__func__.40449, 24
__func__.40449:
	.ascii	"vvi_node_get_dev_status\000"
	.type	__func__.40546, %object
	.size	__func__.40546, 8
__func__.40546:
	.ascii	"vi_open\000"
	.type	__func__.40530, %object
	.size	__func__.40530, 9
__func__.40530:
	.ascii	"vi_ioctl\000"
	.type	__func__.40489, %object
	.size	__func__.40489, 20
__func__.40489:
	.ascii	"vvi_node_get_chn_fr\000"
	.type	__func__.40472, %object
	.size	__func__.40472, 20
__func__.40472:
	.ascii	"vvi_node_set_chn_fr\000"
	.type	__func__.40402, %object
	.size	__func__.40402, 23
__func__.40402:
	.ascii	"vvi_node_set_chns_attr\000"
	.type	__func__.40417, %object
	.size	__func__.40417, 23
__func__.40417:
	.ascii	"vvi_node_get_chns_attr\000"
	.type	__func__.40253, %object
	.size	__func__.40253, 16
__func__.40253:
	.ascii	"vvi_node_delete\000"
	.type	__func__.40381, %object
	.size	__func__.40381, 22
__func__.40381:
	.ascii	"vvi_change_resolution\000"
	.type	__func__.40228, %object
	.size	__func__.40228, 16
__func__.40228:
	.ascii	"vvi_node_create\000"
	.type	__func__.40350, %object
	.size	__func__.40350, 11
__func__.40350:
	.ascii	"vvi_mb_put\000"
	.space	3
	.type	vvi_ioctls, %object
	.size	vvi_ioctls, 300
vvi_ioctls:
	.word	-1065585152
	.word	0
	.word	vvi_get_version
	.word	.LC54
	.word	0
	.word	-1060604415
	.word	0
	.word	vvi_node_create
	.word	.LC55
	.word	0
	.word	-1060604414
	.word	0
	.word	vvi_node_delete
	.word	.LC56
	.word	0
	.word	-1064798717
	.word	0
	.word	vvi_node_get_status
	.word	.LC57
	.word	0
	.word	-1060604412
	.word	0
	.word	vvi_node_start
	.word	.LC58
	.word	0
	.word	-1060604411
	.word	0
	.word	vvi_node_stop
	.word	.LC59
	.word	0
	.word	-1064798714
	.word	0
	.word	vvi_mb_put
	.word	.LC60
	.word	0
	.word	-1064798713
	.word	16
	.word	vvi_mb_get
	.word	.LC61
	.word	0
	.word	-1071548920
	.word	0
	.word	vvi_change_resolution
	.word	.LC62
	.word	0
	.word	-1059293687
	.word	0
	.word	vvi_node_set_chns_attr
	.word	.LC63
	.word	0
	.word	-1059293686
	.word	0
	.word	vvi_node_get_chns_attr
	.word	.LC64
	.word	0
	.word	-1059293685
	.word	0
	.word	vvi_node_set_dev_status
	.word	.LC65
	.word	0
	.word	-1059293684
	.word	0
	.word	vvi_node_get_dev_status
	.word	.LC66
	.word	0
	.word	-1072400883
	.word	0
	.word	vvi_node_set_chn_fr
	.word	.LC67
	.word	0
	.word	-1072400882
	.word	0
	.word	vvi_node_get_chn_fr
	.word	.LC68
	.word	0
	.type	vvi_driver_fops, %object
	.size	vvi_driver_fops, 128
vvi_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	vi_ioctl
	.word	vi_compat_ioctl
	.word	0
	.space	4
	.word	vi_open
	.space	4
	.word	vi_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	wait_mcu_flag, %object
	.size	wait_mcu_flag, 4
wait_mcu_flag:
	.space	4
	.type	g_vvi_dev, %object
	.size	g_vvi_dev, 5004
g_vvi_dev:
	.space	5004
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"-2024-01-22-17:02:23\000"
.LC1:
	.ascii	"vmpi:a9dd19f6acbf3ae9d621a285aa64278d958f9b03-v1.4."
	.ascii	"67\000"
.LC2:
	.ascii	"\033[1;32mtmp = %d, vi_res->wrap_line = %d, cur_w ="
	.ascii	" %d, cur_h = %d, max_res_width = %d\033[0m\000"
.LC3:
	.ascii	"\033[1;31mstruct vi_attr_kn_ctx mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;31mpipeId %d need less than %d\033[0m\000"
.LC5:
	.ascii	"\033[1;31mdevId %d need less than %d\033[0m\000"
.LC6:
	.ascii	"\033[1;31mstruct vvi_buff_info mismatching\033[0m\000"
.LC7:
	.ascii	"enter...\000"
.LC8:
	.ascii	"buf pool(%d) find\000"
.LC9:
	.ascii	"buf = %px ref cnt = %d\000"
.LC10:
	.ascii	"exit...\000"
.LC11:
	.ascii	"\033[1;31mstruct vvi_node_info mismatching\033[0m\000"
.LC12:
	.ascii	"mpi_node_streamon start\000"
.LC13:
	.ascii	"\033[1;32mvvi_node_start done\033[0m\000"
.LC14:
	.ascii	"\033[1;32mdo vi vvi_node_stop dev:%d, chn:%d\033[0m"
	.ascii	"\000"
.LC15:
	.ascii	"\033[1;31mwrap mode not support get buffer from chn"
	.ascii	" 0\033[0m\000"
.LC16:
	.ascii	"\033[1;31mget node fail devid = %d, chnid = %d\033["
	.ascii	"0m\000"
.LC17:
	.ascii	"\033[1;31mget buf fail timeout = %d\033[0m\000"
.LC18:
	.ascii	"get buff: %px, dma_buf id = %d, frame seq=%d, pts:%"
	.ascii	"lld\000"
.LC19:
	.ascii	"buf id:%d size:%d w:%d h:%d pts:%llu\000"
.LC20:
	.ascii	"%s %d\000"
.LC21:
	.ascii	"\033[1;32mdelete vvi node: dev:%d, chn:%d\033[0m\000"
.LC22:
	.ascii	"\033[1;32mbuf id = %d, user process exit\033[0m\000"
.LC23:
	.ascii	"\033[1;31mwait mcu start fail\033[0m\000"
.LC24:
	.ascii	"\033[1;32m--------- vi open ----------\033[0m\000"
.LC25:
	.ascii	"\033[1;31mvi_ioctl: error vvi ioctl, invalid ioctrl"
	.ascii	" index %d\033[0m\000"
.LC26:
	.ascii	"\033[1;31mstruct vi_frame_rate mismatching\033[0m\000"
.LC27:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC28:
	.ascii	"\033[1;32mdev = %d, chn = %d is empty\033[0m\000"
.LC29:
	.ascii	"do vi vvi_node_delete\000"
.LC30:
	.ascii	"\0013no memory for rockit_cfg\000"
.LC31:
	.ascii	"rkisp-vir0\000"
.LC32:
	.ascii	"\0013%s[%d] struct vvi_resolution mismatching\000"
.LC33:
	.ascii	"\033[1;32mvi_res->wrap_mode = %d\033[0m\000"
.LC34:
	.ascii	"rkcif\000"
.LC35:
	.ascii	"\0013%s[%d]:rkisp_rockit_pause_stream fail\000"
.LC36:
	.ascii	"\0013%s[%d]:rkisp_rockit_config_stream fail\000"
.LC37:
	.ascii	"\0013%s[%d]:rkisp_rockit_resume_stream fail\000"
.LC38:
	.ascii	"rkisp\000"
.LC39:
	.ascii	"valloc\000"
.LC40:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC41:
	.ascii	"\033[1;32mvvi chn:%d node have exist!\033[0m\000"
.LC42:
	.ascii	"\033[1;32m>>>>>> videv %d: %p, isp_name: %s, modeln"
	.ascii	"ame: %s\033[0m\000"
.LC43:
	.ascii	"\033[1;31merror create dev:%d, chn:%d %s vvi node\033"
	.ascii	"[0m\000"
.LC44:
	.ascii	"\033[1;31mdevice is %s\033[0m\000"
.LC45:
	.ascii	"\033[1;32m vvi dev:%d, chn:%d node create success\033"
	.ascii	"[0m\000"
.LC46:
	.ascii	"vvi\000"
.LC47:
	.ascii	"\033[1;32mvvi_node_create chn:%d pool create bufcnt"
	.ascii	":%d\033[0m\000"
.LC48:
	.ascii	"\033[1;31mchn:%d pool create fail\033[0m\000"
.LC49:
	.ascii	"\033[1;32mvvi_node_create vi_node_info->mbPool:%d\033"
	.ascii	"[0m\000"
.LC50:
	.ascii	"\033[1;32mchn:%d depth: %d\033[0m\000"
.LC51:
	.ascii	"\033[1;32mvvi_node_create done\033[0m\000"
.LC52:
	.ascii	"put buff: id:%d, buf:%p, dma_buf:%p\000"
.LC53:
	.ascii	"unref buffer\000"
.LC54:
	.ascii	"VVI_IOCTL_VERSION\000"
.LC55:
	.ascii	"VVI_IOCTL_NODE_CREATE\000"
.LC56:
	.ascii	"VVI_IOCTL_NODE_DELETE\000"
.LC57:
	.ascii	"VVI_IOCTL_NODE_GET_STATUS\000"
.LC58:
	.ascii	"VVI_IOCTL_NODE_START\000"
.LC59:
	.ascii	"VVI_IOCTL_NODE_STOP\000"
.LC60:
	.ascii	"VVI_IOCTL_MB_PUT\000"
.LC61:
	.ascii	"VVI_IOCTL_MB_GET\000"
.LC62:
	.ascii	"VVI_IOCTL_RES_CHANGE\000"
.LC63:
	.ascii	"VVI_IOCTL_SET_ATTR\000"
.LC64:
	.ascii	"VVI_IOCTL_GET_ATTR\000"
.LC65:
	.ascii	"VVI_IOCTL_SET_DEV_STA\000"
.LC66:
	.ascii	"VVI_IOCTL_GET_DEV_STA\000"
.LC67:
	.ascii	"VVI_IOCTL_SET_FR\000"
.LC68:
	.ascii	"VVI_IOCTL_GET_FR\000"
	.section	___ksymtab_gpl+rockit_free_tb_stream_buf,"a"
	.align	2
	.type	__ksymtab_rockit_free_tb_stream_buf, %object
	.size	__ksymtab_rockit_free_tb_stream_buf, 12
__ksymtab_rockit_free_tb_stream_buf:
	.word	rockit_free_tb_stream_buf
	.word	__kstrtab_rockit_free_tb_stream_buf
	.word	__kstrtabns_rockit_free_tb_stream_buf
	.section	___ksymtab_gpl+rockit_get_tb_stream_info,"a"
	.align	2
	.type	__ksymtab_rockit_get_tb_stream_info, %object
	.size	__ksymtab_rockit_get_tb_stream_info, 12
__ksymtab_rockit_get_tb_stream_info:
	.word	rockit_get_tb_stream_info
	.word	__kstrtab_rockit_get_tb_stream_info
	.word	__kstrtabns_rockit_get_tb_stream_info
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
