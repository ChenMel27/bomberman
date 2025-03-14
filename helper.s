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
	ldr	r2, .L17
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bhi	.L16
	cmp	r1, #0
	movlt	r1, r3
	ldr	r3, .L17+4
	ldr	r3, [r3]
	asr	r1, r1, #3
	cmp	r3, #1
	ldreq	r3, .L17+8
	ldrne	r3, .L17+12
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L16:
	ldr	r0, .L17+16
	bx	lr
.L18:
	.align	2
.L17:
	.word	262
	.word	round
	.word	bgMap
	.word	bg2Map
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
	add	ip, r0, #7
	push	{r4, r5, r6, r7, lr}
	movge	r4, r0
	movlt	r4, ip
	ldr	r6, .L37
	cmp	r4, #255
	add	lr, r1, #7
	movls	r5, #0
	movhi	r5, #1
	cmp	lr, r6
	movls	r6, #0
	movhi	r6, #1
	cmp	r1, #0
	movge	r2, r1
	movlt	r2, lr
	orrs	r3, r5, r6
	asr	r4, r4, #3
	asr	r2, r2, #3
	bne	.L20
	ldr	r3, .L37+4
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r7, .L37+8
	ldrne	r7, .L37+12
	add	r3, r4, r2, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #1
	moveq	r0, r3
	beq	.L19
.L20:
	cmp	ip, #0
	addlt	r0, r0, #14
	movge	r0, ip
	cmp	r0, #255
	movls	ip, #0
	movhi	ip, #1
	orrs	r3, ip, r6
	asr	r3, r0, #3
	bne	.L24
	ldr	r0, .L37+4
	ldr	r0, [r0]
	cmp	r0, #1
	ldreq	r0, .L37+8
	ldrne	r0, .L37+12
	add	r2, r3, r2, lsl #5
	lsl	r2, r2, #1
	ldrh	r0, [r0, r2]
	cmp	r0, #1
	beq	.L19
.L24:
	ldr	r2, .L37
	add	r0, r1, #14
	cmp	lr, #0
	addlt	r1, r1, #14
	movge	r1, lr
	cmp	r0, r2
	movls	r2, #0
	movhi	r2, #1
	orrs	r0, r5, r2
	asr	r1, r1, #3
	bne	.L27
	ldr	r0, .L37+4
	ldr	r0, [r0]
	cmp	r0, #1
	ldreq	r0, .L37+8
	ldrne	r0, .L37+12
	add	r4, r4, r1, lsl #5
	lsl	r4, r4, #1
	ldrh	r0, [r0, r4]
	cmp	r0, #1
	beq	.L19
.L27:
	orrs	r2, ip, r2
	movne	r0, #0
	bne	.L19
	ldr	r2, .L37+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	ldreq	r3, .L37+8
	ldrne	r3, .L37+12
	lsl	r1, r1, #1
	ldrh	r0, [r3, r1]
	sub	r3, r0, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
.L19:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	262
	.word	round
	.word	bgMap
	.word	bg2Map
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
	movge	r2, r0
	movlt	r2, r6
	ldr	r5, .L57
	cmp	r2, #255
	add	r3, r1, #7
	movls	r4, #0
	movhi	r4, #1
	cmp	r3, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	ip, r1
	movlt	ip, r3
	orrs	lr, r4, r5
	asr	r2, r2, #3
	asr	ip, ip, #3
	bne	.L40
	ldr	lr, .L57+4
	ldr	lr, [lr]
	cmp	lr, #1
	ldreq	r7, .L57+8
	ldrne	r7, .L57+12
	add	lr, r2, ip, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #3
	beq	.L54
.L40:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L44
	ldr	r5, .L57+4
	ldr	r5, [r5]
	cmp	r5, #1
	ldreq	r5, .L57+8
	ldrne	r5, .L57+12
	add	ip, r0, ip, lsl #5
	lsl	ip, ip, #1
	ldrh	ip, [r5, ip]
	cmp	ip, #3
	beq	.L54
.L44:
	ldr	ip, .L57
	cmp	r3, #0
	add	r5, r1, #14
	addlt	r1, r1, #14
	movge	r1, r3
	cmp	r5, ip
	movls	r3, #0
	movhi	r3, #1
	orrs	ip, r4, r3
	asr	r1, r1, #3
	bne	.L47
	ldr	ip, .L57+4
	ldr	ip, [ip]
	cmp	ip, #1
	ldreq	ip, .L57+8
	ldrne	ip, .L57+12
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #3
	beq	.L54
.L47:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L39
	ldr	r3, .L57+4
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r3, .L57+8
	ldrne	r3, .L57+12
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L54:
	mov	r0, #1
.L39:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	262
	.word	round
	.word	bgMap
	.word	bg2Map
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
	movge	r2, r0
	movlt	r2, r6
	ldr	r5, .L77
	cmp	r2, #255
	add	r3, r1, #7
	movls	r4, #0
	movhi	r4, #1
	cmp	r3, r5
	movls	r5, #0
	movhi	r5, #1
	cmp	r1, #0
	movge	ip, r1
	movlt	ip, r3
	orrs	lr, r4, r5
	asr	r2, r2, #3
	asr	ip, ip, #3
	bne	.L60
	ldr	lr, .L77+4
	ldr	lr, [lr]
	cmp	lr, #1
	ldreq	r7, .L77+8
	ldrne	r7, .L77+12
	add	lr, r2, ip, lsl #5
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #4
	beq	.L74
.L60:
	cmp	r6, #0
	addlt	r0, r0, #14
	movge	r0, r6
	cmp	r0, #255
	movls	lr, #0
	movhi	lr, #1
	orrs	r5, lr, r5
	asr	r0, r0, #3
	bne	.L64
	ldr	r5, .L77+4
	ldr	r5, [r5]
	cmp	r5, #1
	ldreq	r5, .L77+8
	ldrne	r5, .L77+12
	add	ip, r0, ip, lsl #5
	lsl	ip, ip, #1
	ldrh	ip, [r5, ip]
	cmp	ip, #4
	beq	.L74
.L64:
	ldr	ip, .L77
	cmp	r3, #0
	add	r5, r1, #14
	addlt	r1, r1, #14
	movge	r1, r3
	cmp	r5, ip
	movls	r3, #0
	movhi	r3, #1
	orrs	ip, r4, r3
	asr	r1, r1, #3
	bne	.L67
	ldr	ip, .L77+4
	ldr	ip, [ip]
	cmp	ip, #1
	ldreq	ip, .L77+8
	ldrne	ip, .L77+12
	add	r2, r2, r1, lsl #5
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #4
	beq	.L74
.L67:
	orrs	r3, lr, r3
	movne	r0, #0
	bne	.L59
	ldr	r3, .L77+4
	ldr	r3, [r3]
	cmp	r3, #1
	ldreq	r3, .L77+8
	ldrne	r3, .L77+12
	add	r0, r0, r1, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	sub	r3, r0, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L74:
	mov	r0, #1
.L59:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	262
	.word	round
	.word	bgMap
	.word	bg2Map
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
	mov	r2, r0
	ldr	r3, .L103
	ldr	r0, .L103+4
	ldr	ip, .L103+8
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r3, #24]
	ldr	lr, [r0, #24]
	ldr	r0, .L103+12
	ldr	ip, [ip, #24]
	ldr	r0, [r0, #24]
	orr	r3, r3, lr
	orr	r3, r3, ip
	orrs	r3, r3, r0
	moveq	r5, #1
	movne	r5, #0
	add	r3, r2, #7
	cmp	r2, #0
	movge	r4, r2
	movlt	r4, r3
	ldr	r7, .L103+16
	cmp	r4, #255
	add	lr, r1, #7
	movls	r6, #0
	movhi	r6, #1
	cmp	lr, r7
	movls	r7, #0
	movhi	r7, #1
	cmp	r1, #0
	movge	ip, r1
	movlt	ip, lr
	orrs	r0, r6, r7
	asr	r4, r4, #3
	mov	r0, r5
	asr	ip, ip, #3
	bne	.L80
	ldr	r8, .L103+20
	ldr	r8, [r8]
	cmp	r8, #1
	ldreq	r9, .L103+24
	ldrne	r9, .L103+28
	add	r8, r4, ip, lsl #5
	lsl	r8, r8, #1
	ldrh	r8, [r9, r8]
	cmp	r8, #2
	beq	.L79
.L80:
	cmp	r3, #0
	addlt	r3, r2, #14
	cmp	r3, #255
	movls	r2, #0
	movhi	r2, #1
	orrs	r7, r2, r7
	asr	r3, r3, #3
	bne	.L84
	ldr	r7, .L103+20
	ldr	r7, [r7]
	cmp	r7, #1
	ldreq	r7, .L103+24
	ldrne	r7, .L103+28
	add	ip, r3, ip, lsl #5
	lsl	ip, ip, #1
	ldrh	ip, [r7, ip]
	cmp	ip, #2
	beq	.L79
.L84:
	ldr	ip, .L103+16
	cmp	lr, #0
	add	r7, r1, #14
	addlt	r1, r1, #14
	movge	r1, lr
	cmp	r7, ip
	movls	ip, #0
	movhi	ip, #1
	orrs	lr, r6, ip
	asr	r1, r1, #3
	bne	.L87
	ldr	lr, .L103+20
	ldr	lr, [lr]
	cmp	lr, #1
	ldreq	lr, .L103+24
	ldrne	lr, .L103+28
	add	r4, r4, r1, lsl #5
	lsl	r4, r4, #1
	ldrh	lr, [lr, r4]
	cmp	lr, #2
	beq	.L79
.L87:
	orrs	r2, r2, ip
	movne	r0, #0
	bne	.L79
	ldr	r2, .L103+20
	ldr	r2, [r2]
	cmp	r2, #1
	ldreq	r2, .L103+24
	ldrne	r2, .L103+28
	add	r3, r3, r1, lsl #5
	lsl	r3, r3, #1
	ldrh	r0, [r2, r3]
	cmp	r0, #2
	movne	r0, #0
	andeq	r0, r5, #1
.L79:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	262
	.word	round
	.word	bgMap
	.word	bg2Map
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
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	ldr	r3, .L117
	push	{r4, r5, r6, r7, r8, lr}
	add	r5, r1, #7
	cmp	r0, #255
	cmpls	r5, r3
	movhi	ip, #1
	movls	ip, #0
	bls	.L115
.L105:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L115:
	cmp	r1, #0
	movlt	r1, r5
	ldr	r3, .L117+4
	ldr	r3, [r3]
	asr	r4, r0, #3
	asr	r5, r1, #3
	cmp	r3, #1
	add	r3, r4, r5, lsl #5
	beq	.L116
	ldr	r1, .L117+8
	lsl	r0, r3, #1
	ldrh	r6, [r1, r0]
	cmp	r6, #3
	bne	.L105
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r6
	ldr	r2, .L117+12
	ldr	r7, .L117+16
	mov	lr, pc
	bx	r7
	mov	r0, r6
	ldr	r3, .L117+20
	lsl	r2, r5, #12
	add	r5, r3, r5, lsl #12
	add	r4, r5, r4, lsl #3
	add	r1, r2, #4096
.L110:
	sub	r3, r4, #8
.L111:
	strb	r0, [r3], #1
	cmp	r3, r4
	bne	.L111
	add	r2, r2, #512
	cmp	r2, r1
	add	r4, r4, #512
	bne	.L110
	b	.L105
.L116:
	ldr	r1, .L117+24
	lsl	r0, r3, #1
	ldrh	r6, [r1, r0]
	cmp	r6, #3
	bne	.L105
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r6
	ldr	r2, .L117+12
	ldr	r7, .L117+16
	mov	lr, pc
	bx	r7
	mov	r2, r6
	ldr	r3, .L117+28
	lsl	r1, r5, #12
	add	r5, r3, r5, lsl #12
	add	r0, r5, r4, lsl #3
	add	ip, r1, #4096
.L108:
	sub	r3, r0, #8
.L109:
	strb	r2, [r3], #1
	cmp	r3, r0
	bne	.L109
	add	r1, r1, #512
	cmp	r1, ip
	add	r0, r0, #512
	bne	.L108
	b	.L105
.L118:
	.align	2
.L117:
	.word	262
	.word	round
	.word	bg2Map
	.word	100704256
	.word	DMANow
	.word	collisionMap2Bitmap+8
	.word	bgMap
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
	ldr	ip, .L137
	ldr	r4, .L137+4
	ldr	r5, .L137+8
	ldr	lr, .L137+12
	sub	r0, r0, r2
	b	.L120
.L121:
	sub	r6, r3, #65
	cmp	r6, #25
	bls	.L135
	sub	r6, r3, #97
	cmp	r6, #25
	bhi	.L124
	sub	r3, r3, #39
	orr	r3, r3, #4096
	lsl	r3, r3, #16
	lsr	r3, r3, #16
.L122:
	lsl	r1, r1, #1
	strh	r3, [ip, r1]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L136
.L120:
	sub	r1, r3, #48
	cmp	r1, #9
	add	r1, r2, r0
	bhi	.L121
.L135:
	sub	r3, r3, #33
	orr	r3, r3, #4096
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L122
.L124:
	cmp	r3, #58
	moveq	r3, r4
	beq	.L122
	cmp	r3, #64
	moveq	r3, r5
	beq	.L122
	cmp	r3, #63
	moveq	r3, lr
	movne	r3, #4096
	b	.L122
.L136:
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	.align	2
.L137:
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
	ldr	r3, .L141
	ldr	r1, .L141+4
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
.L142:
	.align	2
.L141:
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
	ldr	r3, .L161
	ldr	r2, [r3, #24]
	cmp	r2, #0
	sub	sp, sp, #20
	bne	.L144
.L147:
	ldr	r3, .L161+4
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L158
	ldr	r3, .L161+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L159
.L150:
	ldr	r3, .L161+12
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L160
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L160:
	ldr	r0, .L161+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L161+20
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L144:
	ldr	r0, .L161+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L161+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L147
.L151:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L158:
	ldr	r0, .L161+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L161+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L151
	ldr	r3, .L161+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L150
.L159:
	ldr	r0, .L161+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L161+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L150
	b	.L151
.L162:
	.align	2
.L161:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	collision
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.ident	"GCC: (devkitARM release 53) 9.1.0"
