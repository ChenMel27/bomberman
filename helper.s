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
	cmp	r2, #1
	beq	.L9
	cmp	r2, #2
	bxne	lr
	cmp	r1, #255
	cmpls	r0, #512
	bcc	.L10
.L6:
	mov	r0, #0
	bx	lr
.L9:
	cmp	r1, #255
	cmpls	r0, #512
	ldrcc	r3, .L11
	bcs	.L6
.L7:
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #1
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L10:
	ldr	r3, .L11+4
	b	.L7
.L12:
	.align	2
.L11:
	.word	collisionMapBitmap
	.word	collisionMap2Bitmap
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
	ldr	r2, .L16
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bhi	.L15
	cmp	r1, #0
	movlt	r1, r3
	asr	r1, r1, #3
	ldr	r3, .L16+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L15:
	ldr	r0, .L16+8
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r5, .L28
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
	bne	.L19
	ldr	r7, .L28+4
	add	r3, lr, r4, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #1
	moveq	r0, r3
	beq	.L18
.L19:
	cmp	r2, #0
	addlt	r0, r0, #14
	movge	r0, r2
	cmp	r0, #255
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r3, r5
	asr	r2, r0, #3
	bne	.L21
	ldr	r0, .L28+4
	add	r4, r2, r4, lsl #5
	lsl	r4, r4, #1
	ldrh	r0, [r0, r4]
	cmp	r0, #1
	beq	.L18
.L21:
	ldr	r4, .L28
	cmp	ip, #0
	add	r0, r1, #14
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r0, r4
	movls	ip, #0
	movhi	ip, #1
	orrs	r0, r6, ip
	asr	r1, r1, #3
	bne	.L22
	ldr	r0, .L28+4
	add	lr, lr, r1, lsl #5
	lsl	lr, lr, #1
	ldrh	r0, [r0, lr]
	cmp	r0, #1
	beq	.L18
.L22:
	orrs	r3, r3, ip
	movne	r0, #0
	bne	.L18
	ldr	r3, .L28+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r0, [r3, r2]
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
.L18:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	ldr	r5, .L40
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
	bne	.L31
	ldr	r7, .L40+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #3
	beq	.L37
.L31:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L33
	ldr	r5, .L40+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #3
	beq	.L37
.L33:
	ldr	r5, .L40
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L34
	ldr	r2, .L40+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #3
	beq	.L37
.L34:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L30
	ldr	r3, .L40+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L37:
	mov	r0, #1
.L30:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r5, .L52
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
	bne	.L43
	ldr	r7, .L52+4
	add	lr, ip, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #4
	beq	.L49
.L43:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L45
	ldr	r5, .L52+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #4
	beq	.L49
.L45:
	ldr	r5, .L52
	add	r3, r1, #14
	cmp	r2, #0
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	r2, r4, r3
	asr	r1, r1, #3
	bne	.L46
	ldr	r2, .L52+4
	add	ip, ip, r1, lsl #5
	lsl	ip, ip, #1
	ldrh	r2, [r2, ip]
	cmp	r2, #4
	beq	.L49
.L46:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L42
	ldr	r3, .L52+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L49:
	mov	r0, #1
.L42:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L53:
	.align	2
.L52:
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
	ldr	r5, .L64
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
	bne	.L55
	ldr	r7, .L64+4
	add	lr, r2, r3, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #0
	bne	.L55
.L61:
	mov	r0, #1
.L54:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L55:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L57
	ldr	r5, .L64+4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	beq	.L61
.L57:
	ldr	r5, .L64
	add	r3, r1, #14
	cmp	ip, #0
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r3, r5
	movls	r3, #0
	movhi	r3, #1
	orrs	ip, r4, r3
	asr	r1, r1, #3
	bne	.L58
	ldr	ip, .L64+4
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	beq	.L61
.L58:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L54
	ldr	r3, .L64+4
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L65:
	.align	2
.L64:
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
	ldr	r2, .L73
	push	{r4, r5, r6, r7, r8, lr}
	add	r6, r1, #7
	cmp	r0, #255
	cmpls	r6, r2
	movhi	ip, #1
	movls	ip, #0
	bls	.L72
.L66:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L72:
	cmp	r1, #0
	movlt	r1, r6
	asr	r4, r0, #3
	asr	r6, r1, #3
	add	r0, r4, r6, lsl #5
	ldr	r1, .L73+4
	lsl	r0, r0, #1
	ldrh	r5, [r1, r0]
	cmp	r5, #3
	bne	.L66
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r5
	ldr	r2, .L73+8
	ldr	r7, .L73+12
	mov	lr, pc
	bx	r7
	mov	r0, r5
	ldr	r3, .L73+16
	lsl	r2, r6, #12
	add	r3, r3, r6, lsl #12
	add	r4, r3, r4, lsl #3
	add	r1, r2, #4096
.L68:
	sub	r3, r4, #8
.L69:
	strb	r0, [r3], #1
	cmp	r3, r4
	bne	.L69
	add	r2, r2, #512
	cmp	r2, r1
	add	r4, r4, #512
	bne	.L68
	b	.L66
.L74:
	.align	2
.L73:
	.word	262
	.word	bgMap
	.word	100704256
	.word	DMANow
	.word	collisionMapBitmap+8
	.size	destroySoftBlockAt, .-destroySoftBlockAt
	.align	2
	.global	drawText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, r1, lsl #5
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	ip, .L93
	ldr	r4, .L93+4
	ldr	r5, .L93+8
	ldr	lr, .L93+12
	sub	r0, r0, r2
	b	.L76
.L77:
	sub	r6, r3, #65
	cmp	r6, #25
	bls	.L91
	sub	r6, r3, #97
	cmp	r6, #25
	bhi	.L80
	sub	r3, r3, #39
	orr	r3, r3, #4096
	lsl	r3, r3, #16
	lsr	r3, r3, #16
.L78:
	lsl	r1, r1, #1
	strh	r3, [ip, r1]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L92
.L76:
	sub	r1, r3, #48
	cmp	r1, #9
	add	r1, r2, r0
	bhi	.L77
.L91:
	sub	r3, r3, #33
	orr	r3, r3, #4096
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L78
.L80:
	cmp	r3, #58
	moveq	r3, r4
	beq	.L78
	cmp	r3, #64
	moveq	r3, r5
	beq	.L78
	cmp	r3, #63
	moveq	r3, lr
	movne	r3, #4096
	b	.L78
.L92:
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	100720640
	.word	4122
	.word	4127
	.word	4126
	.size	drawText, .-drawText
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	drawNumber
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	sub	sp, sp, #20
	ldr	r3, .L97
	ldr	r1, .L97+4
	add	r0, sp, #4
	mov	lr, pc
	bx	r3
	mov	r1, r5
	mov	r0, r4
	add	r2, sp, #4
	bl	drawText
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	sprintf
	.word	.LC0
	.size	drawNumber, .-drawNumber
	.align	2
	.global	checkPlayerEnemyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPlayerEnemyCollision, %function
checkPlayerEnemyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L117
	ldr	r2, [r3, #24]
	cmp	r2, #0
	sub	sp, sp, #20
	bne	.L100
.L103:
	ldr	r3, .L117+4
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L114
	ldr	r3, .L117+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L115
.L106:
	ldr	r3, .L117+12
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L116
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L116:
	ldr	r0, .L117+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L117+20
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L100:
	ldr	r0, .L117+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L117+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L103
.L107:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L114:
	ldr	r0, .L117+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L117+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L107
	ldr	r3, .L117+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L106
.L115:
	ldr	r0, .L117+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L117+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L106
	b	.L107
.L118:
	.align	2
.L117:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	collision
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.ident	"GCC: (devkitARM release 53) 9.1.0"
