	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"helper.c"
	.text
	.align	2
	.global	getTileAtWorld
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	getTileAtWorld, %function
getTileAtWorld:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	ldr	r2, .L5
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bhi	.L3
	cmp	r1, #0
	movlt	r1, r3
	asr	r1, r1, #3
	ldr	r3, .L5+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L3:
	ldr	r0, .L5+8
	bx	lr
.L6:
	.align	2
.L5:
	.word	262
	.word	bgMap
	.word	65535
	.size	getTileAtWorld, .-getTileAtWorld
	.align	2
	.global	checkCollisionWorld
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWorld, %function
checkCollisionWorld:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	add	r2, r0, #7
	push	{r4, r5, r6, r7, lr}
	movge	lr, r0
	movlt	lr, r2
	ldr	r5, .L17
	cmp	lr, #255
	add	ip, r1, #7
	movls	r6, #0
	movhi	r6, #1
	cmp	ip, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	r4, r1
	movlt	r4, ip
	orrs	r3, r6, r5
	asr	lr, lr, #3
	asr	r4, r4, #3
	bne	.L8
	ldr	r7, .L17+4
	add	r3, lr, r4, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #1
	moveq	r0, r3
	beq	.L7
.L8:
	cmp	r2, #0
	addlt	r0, r0, #14
	movge	r0, r2
	cmp	r0, #255
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r3, r5
	asr	r2, r0, #3
	bne	.L10
	ldr	r0, .L17+4
	add	r4, r2, r4, lsl #5
	lsl	r4, r4, #1
	ldrh	r0, [r0, r4]
	cmp	r0, #1
	beq	.L7
.L10:
	ldr	r4, .L17
	cmp	ip, #0
	add	r0, r1, #14
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r0, r4
	movls	ip, #0
	movhi	ip, #1
	orrs	r0, r6, ip
	asr	r1, r1, #3
	bne	.L11
	ldr	r0, .L17+4
	add	lr, lr, r1, lsl #5
	lsl	lr, lr, #1
	ldrh	r0, [r0, lr]
	cmp	r0, #1
	beq	.L7
.L11:
	orrs	r3, r3, ip
	movne	r0, #0
	bne	.L7
	ldr	r3, .L17+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r0, [r3, r2]
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
.L7:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	262
	.word	bgMap
	.size	checkCollisionWorld, .-checkCollisionWorld
	.align	2
	.global	checkCollisionDestructableWall
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionDestructableWall, %function
checkCollisionDestructableWall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	cmp	r0, #0
	add	r6, r0, #7
	movge	ip, r0
	movlt	ip, r6
	ldr	r5, .L29
	cmp	ip, #255
	add	r2, r1, #7
	movls	r4, #0
	movhi	r4, #1
	cmp	r2, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	r3, r1
	movlt	r3, r2
	orrs	lr, r4, r5
	asr	ip, ip, #3
	asr	r3, r3, #3
	bne	.L20
	ldr	r7, .L29+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #3
	beq	.L26
.L20:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L22
	ldr	r5, .L29+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #3
	beq	.L26
.L22:
	ldr	r5, .L29
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L23
	ldr	r2, .L29+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #3
	beq	.L26
.L23:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L19
	ldr	r3, .L29+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L26:
	mov	r0, #1
.L19:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	262
	.word	bgMap
	.size	checkCollisionDestructableWall, .-checkCollisionDestructableWall
	.align	2
	.global	checkCollisionSoftBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionSoftBlock, %function
checkCollisionSoftBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	cmp	r0, #0
	add	r6, r0, #7
	movge	ip, r0
	movlt	ip, r6
	ldr	r5, .L41
	cmp	ip, #255
	add	r2, r1, #7
	movls	r4, #0
	movhi	r4, #1
	cmp	r2, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	r3, r1
	movlt	r3, r2
	orrs	lr, r4, r5
	asr	ip, ip, #3
	asr	r3, r3, #3
	bne	.L32
	ldr	r7, .L41+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #4
	beq	.L38
.L32:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L34
	ldr	r5, .L41+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #4
	beq	.L38
.L34:
	ldr	r5, .L41
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L35
	ldr	r2, .L41+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #4
	beq	.L38
.L35:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L31
	ldr	r3, .L41+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L38:
	mov	r0, #1
.L31:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	262
	.word	bgMap
	.size	checkCollisionSoftBlock, .-checkCollisionSoftBlock
	.align	2
	.global	checkCollisionWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWin, %function
checkCollisionWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	cmp	r0, #0
	add	r6, r0, #7
	movge	r2, r0
	movlt	r2, r6
	ldr	r5, .L53
	cmp	r2, #255
	add	ip, r1, #7
	movls	r4, #0
	movhi	r4, #1
	cmp	ip, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	r3, r1
	movlt	r3, ip
	orrs	lr, r4, r5
	asr	r2, r2, #3
	asr	r3, r3, #3
	bne	.L44
	ldr	r7, .L53+4
	add	lr, r2, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #0
	bne	.L44
.L50:
	mov	r0, #1
.L43:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L44:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L46
	ldr	r5, .L53+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	beq	.L50
.L46:
	ldr	r5, .L53
	add	r3, r1, #14
	cmp	ip, #0
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	ip, r4, r3
	asr	r1, r1, #3
	bne	.L47
	ldr	ip, .L53+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L50
.L47:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L43
	ldr	r3, .L53+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	262
	.word	bgMap
	.size	checkCollisionWin, .-checkCollisionWin
	.align	2
	.global	destroySoftBlockAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	destroySoftBlockAt, %function
destroySoftBlockAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	ldr	r3, .L57
	add	r2, r1, #7
	cmp	r0, #255
	cmpls	r2, r3
	asr	r0, r0, #3
	movhi	r3, #1
	movls	r3, #0
	bxhi	lr
	cmp	r1, #0
	movlt	r1, r2
	asr	r1, r1, #3
	ldr	r2, .L57+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r1, [r2, r0]
	cmp	r1, #4
	strheq	r3, [r2, r0]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	262
	.word	bgMap
	.size	destroySoftBlockAt, .-destroySoftBlockAt
	.ident	"GCC: (devkitARM release 53) 9.1.0"
