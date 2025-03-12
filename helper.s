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
	.global	isPassablePixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	isPassablePixel, %function
isPassablePixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #255
	cmpls	r0, #512
	bcc	.L5
	mov	r0, #0
	bx	lr
.L5:
	ldr	r3, .L6
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #1
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L7:
	.align	2
.L6:
	.word	collisionMapBitmap
	.size	isPassablePixel, .-isPassablePixel
	.align	2
	.global	getTileAtWorld
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
	ldr	r2, .L11
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bhi	.L10
	cmp	r1, #0
	movlt	r1, r3
	asr	r1, r1, #3
	ldr	r3, .L11+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L10:
	ldr	r0, .L11+8
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r5, .L23
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
	bne	.L14
	ldr	r7, .L23+4
	add	r3, lr, r4, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #1
	moveq	r0, r3
	beq	.L13
.L14:
	cmp	r2, #0
	addlt	r0, r0, #14
	movge	r0, r2
	cmp	r0, #255
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r3, r5
	asr	r2, r0, #3
	bne	.L16
	ldr	r0, .L23+4
	add	r4, r2, r4, lsl #5
	lsl	r4, r4, #1
	ldrh	r0, [r0, r4]
	cmp	r0, #1
	beq	.L13
.L16:
	ldr	r4, .L23
	cmp	ip, #0
	add	r0, r1, #14
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r0, r4
	movls	ip, #0
	movhi	ip, #1
	orrs	r0, r6, ip
	asr	r1, r1, #3
	bne	.L17
	ldr	r0, .L23+4
	add	lr, lr, r1, lsl #5
	lsl	lr, lr, #1
	ldrh	r0, [r0, lr]
	cmp	r0, #1
	beq	.L13
.L17:
	orrs	r3, r3, ip
	movne	r0, #0
	bne	.L13
	ldr	r3, .L23+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r0, [r3, r2]
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
.L13:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L24:
	.align	2
.L23:
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
	ldr	r5, .L35
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
	bne	.L26
	ldr	r7, .L35+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #3
	beq	.L32
.L26:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L28
	ldr	r5, .L35+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #3
	beq	.L32
.L28:
	ldr	r5, .L35
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L29
	ldr	r2, .L35+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #3
	beq	.L32
.L29:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L25
	ldr	r3, .L35+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L32:
	mov	r0, #1
.L25:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L36:
	.align	2
.L35:
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
	ldr	r5, .L47
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
	bne	.L38
	ldr	r7, .L47+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #4
	beq	.L44
.L38:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L40
	ldr	r5, .L47+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #4
	beq	.L44
.L40:
	ldr	r5, .L47
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L41
	ldr	r2, .L47+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #4
	beq	.L44
.L41:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L37
	ldr	r3, .L47+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L44:
	mov	r0, #1
.L37:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r5, .L59
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
	bne	.L50
	ldr	r7, .L59+4
	add	lr, r2, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #0
	bne	.L50
.L56:
	mov	r0, #1
.L49:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L50:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L52
	ldr	r5, .L59+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	beq	.L56
.L52:
	ldr	r5, .L59
	add	r3, r1, #14
	cmp	ip, #0
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	ip, r4, r3
	asr	r1, r1, #3
	bne	.L53
	ldr	ip, .L59+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L56
.L53:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L49
	ldr	r3, .L59+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L60:
	.align	2
.L59:
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
	cmp	r0, #0
	add	r3, r0, #7
	movlt	r0, r3
	ldr	r2, .L68
	push	{r4, r5, r6, r7, r8, lr}
	add	r6, r1, #7
	cmp	r0, #255
	cmpls	r6, r2
	movhi	ip, #1
	movls	ip, #0
	bls	.L67
.L61:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L67:
	cmp	r1, #0
	movlt	r1, r6
	asr	r4, r0, #3
	asr	r6, r1, #3
	add	r0, r4, r6, lsl #5
	ldr	r1, .L68+4
	lsl	r0, r0, #1
	ldrh	r5, [r1, r0]
	cmp	r5, #3
	bne	.L61
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r5
	ldr	r2, .L68+8
	ldr	r7, .L68+12
	mov	lr, pc
	bx	r7
	mov	r0, r5
	ldr	r3, .L68+16
	lsl	r2, r6, #12
	add	r3, r3, r6, lsl #12
	add	r4, r3, r4, lsl #3
	add	r1, r2, #4096
.L63:
	sub	r3, r4, #8
.L64:
	strb	r0, [r3], #1
	cmp	r3, r4
	bne	.L64
	add	r2, r2, #512
	cmp	r2, r1
	add	r4, r4, #512
	bne	.L63
	b	.L61
.L69:
	.align	2
.L68:
	.word	262
	.word	bgMap
	.word	100704256
	.word	DMANow
	.word	collisionMapBitmap+8
	.size	destroySoftBlockAt, .-destroySoftBlockAt
	.ident	"GCC: (devkitARM release 53) 9.1.0"
