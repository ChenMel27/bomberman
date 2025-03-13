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
	.file	"sprites.c"
	.text
	.align	2
	.global	initializePlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r1, #8
	mov	r4, #24
	mov	lr, #4
	mov	ip, #15
	mov	r0, #1
	ldr	r3, .L4
	strb	r2, [r3, #48]
	str	r4, [r3, #4]
	str	lr, [r3, #44]
	str	r2, [r3]
	str	r2, [r3, #40]
	str	ip, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initializePlayer, .-initializePlayer
	.align	2
	.global	initializeEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeEnemies, %function
initializeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	beq	.L7
	mov	lr, #1
	mov	ip, lr
	mov	r4, lr
	mov	r5, lr
	ldr	r0, .L26
	ldr	r1, .L26+4
	ldr	r2, .L26+8
	ldr	r3, .L26+12
	str	lr, [r0, #24]
	str	lr, [r1, #24]
	str	lr, [r2, #24]
	str	lr, [r3, #24]
.L8:
	mov	r7, #104
	mov	r6, #1
	mov	lr, #8
	mov	r10, #2
	mov	r9, #4
	mov	r8, #15
	str	r7, [r0]
	str	r7, [r0, #4]
	str	r10, [r0, #40]
	str	r6, [r0, #32]
	strb	r6, [r0, #48]
	str	lr, [r0, #16]
	str	lr, [r0, #20]
	str	r9, [r0, #44]
	str	r8, [r0, #28]
.L9:
	cmp	r5, #0
	beq	.L10
	mov	r0, #8
	mov	r10, #136
	mov	r9, #24
	mov	r8, #0
	mov	r7, #1
	mov	r6, #2
	mov	r5, #4
	mov	lr, #15
	str	r10, [r1]
	str	r9, [r1, #4]
	str	r8, [r1, #40]
	str	r7, [r1, #32]
	strb	r6, [r1, #48]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	str	r5, [r1, #44]
	str	lr, [r1, #28]
.L10:
	cmp	r4, #0
	beq	.L11
	mov	r1, #3
	mov	r0, #8
	mov	r7, #24
	mov	r6, #136
	mov	r5, #0
	mov	r4, #1
	mov	lr, #4
	str	r7, [r2]
	str	r6, [r2, #4]
	str	r5, [r2, #40]
	str	r4, [r2, #32]
	strb	r1, [r2, #48]
	str	r1, [r2, #44]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	lr, [r2, #28]
.L11:
	cmp	ip, #0
	beq	.L6
	mov	r2, #3
	mov	ip, #136
	mov	r0, #4
	mov	r1, #8
	mov	r4, #0
	mov	lr, #1
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r4, [r3, #40]
	str	lr, [r3, #32]
	strb	r0, [r3, #48]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #44]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
.L6:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	ldr	r0, .L26
	ldr	ip, [r0, #24]
	ldr	r1, .L26+4
	ldr	r2, .L26+8
	ldr	r3, .L26+12
	cmp	ip, #0
	ldr	r5, [r1, #24]
	ldr	r4, [r2, #24]
	ldr	ip, [r3, #24]
	beq	.L9
	b	.L8
.L27:
	.align	2
.L26:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.size	initializeEnemies, .-initializeEnemies
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L63
	ldr	r7, .L63+4
	ldr	r6, [r4]
	ldr	r5, [r4, #16]
	ldr	r8, [r4, #4]
	ldr	r1, [r4, #20]
	ldrh	r3, [r7]
	add	r5, r6, r5
	add	r1, r8, r1
	tst	r3, #128
	sub	sp, sp, #12
	sub	r10, r5, #1
	sub	r9, r1, #1
	bne	.L29
	cmp	r1, #255
	ble	.L59
.L30:
	mov	r2, #0
	str	r2, [r4, #32]
.L29:
	tst	r3, #64
	bne	.L33
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L60
	mov	r2, #2
	str	r2, [r4, #32]
.L33:
	tst	r3, #16
	bne	.L37
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	cmp	r2, #512
	blt	.L61
	mov	r2, #1
	str	r2, [r4, #32]
.L37:
	tst	r3, #32
	bne	.L41
	ldr	r3, [r4]
	cmp	r3, #0
	bgt	.L62
.L43:
	mov	r3, #3
	str	r3, [r4, #32]
.L41:
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L28
	ldrh	r3, [r7]
	tst	r3, #4
	bne	.L28
	ldr	r3, .L63+12
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L28
	ldm	r4, {r1, r2}
	add	ip, r1, #7
	cmp	r1, #0
	movlt	r1, ip
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mov	ip, #60
	mov	r0, #1
	bic	r1, r1, #7
	bic	r2, r2, #7
	stmib	r3, {r1, r2, ip}
	str	r0, [r3, #20]
.L28:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L60:
	ldr	r3, .L63+12
	sub	r1, r8, #1
	ldr	r2, [r3]
	mov	r0, r6
	ldr	fp, .L63+16
	str	r1, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #4]
	ldr	r3, .L63+12
	bne	.L35
.L57:
	mov	r2, #2
	ldrh	r3, [r7]
	str	r2, [r4, #32]
	b	.L33
.L62:
	ldr	r10, .L63+12
	sub	r6, r6, #1
	mov	r1, r8
	mov	r0, r6
	ldr	r2, [r10]
	ldr	r5, .L63+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L43
	mov	r1, r9
	mov	r0, r6
	ldr	r2, [r10]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #1
	strne	r3, [r4]
	b	.L43
.L59:
	ldr	r3, .L63+12
	mov	r0, r6
	ldr	r2, [r3]
	ldr	fp, .L63+16
	str	r1, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r3, .L63+12
	ldr	r1, [sp, #4]
	bne	.L31
.L56:
	ldrh	r3, [r7]
	b	.L30
.L61:
	ldr	fp, .L63+12
	mov	r1, r8
	mov	r0, r5
	ldr	r2, [fp]
	ldr	r10, .L63+16
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L39
.L58:
	mov	r2, #1
	ldrh	r3, [r7]
	str	r2, [r4, #32]
	b	.L37
.L35:
	ldr	r2, [r3]
	mov	r0, r10
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	subne	r3, r3, #1
	strne	r3, [r4, #4]
	b	.L57
.L31:
	ldr	r2, [r3]
	mov	r0, r10
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #1
	strne	r3, [r4, #4]
	b	.L56
.L39:
	mov	r0, r5
	mov	r1, r9
	ldr	r2, [fp]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	ldrne	r3, [r4]
	addne	r3, r3, #1
	strne	r3, [r4]
	b	.L58
.L64:
	.align	2
.L63:
	.word	player
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	isPassablePixel
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L169
	ldr	r3, [r5]
	ldr	r2, .L169+4
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	asr	r4, r3, #31
	add	r2, r2, r3
	rsb	r4, r4, r2, asr #4
	ldr	r6, .L169+8
	rsb	r4, r4, r4, lsl #4
	subs	r4, r3, r4, lsl #1
	str	r3, [r5]
	ldr	r3, [r6, #24]
	beq	.L158
	ldr	r7, .L169+12
.L66:
	cmp	r3, #0
	bne	.L76
.L77:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L83
	ldr	r3, [r7, #32]
	cmp	r3, #0
	beq	.L160
	cmp	r3, #2
	beq	.L161
	cmp	r3, #1
	beq	.L162
	cmp	r3, #3
	beq	.L163
.L83:
	ldr	r3, [r5, #4]
	add	r3, r3, #1
	cmp	r3, #2
	strle	r3, [r5, #4]
	ble	.L65
	mov	r2, #0
	ldr	r3, .L169+16
	ldr	r1, [r3, #24]
	cmp	r1, r2
	str	r2, [r5, #4]
	beq	.L91
	ldr	r2, .L169+20
	ldr	r1, [r3]
	ldr	r0, [r2]
	cmp	r0, r1
	addgt	r1, r1, #1
	strgt	r1, [r3]
	bgt	.L93
	sublt	r1, r1, #1
	strlt	r1, [r3]
.L93:
	ldr	r1, [r2, #4]
	ldr	r2, [r3, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	ble	.L164
.L91:
	ldr	r3, .L169+24
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L65
	ldr	r2, .L169+20
	ldr	r1, [r3]
	ldr	r0, [r2]
	cmp	r0, r1
	addgt	r1, r1, #1
	strgt	r1, [r3]
	bgt	.L98
	sublt	r1, r1, #1
	strlt	r1, [r3]
.L98:
	ldr	r1, [r2, #4]
	ldr	r2, [r3, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	bgt	.L65
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
.L65:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L158:
	cmp	r3, #0
	beq	.L67
	ldr	r3, [r6, #32]
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r8, .L169+28
	beq	.L165
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	str	r3, [r6, #32]
.L70:
	ldr	r7, .L169+12
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L100
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L83
.L76:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L166
	cmp	r3, #2
	beq	.L167
	cmp	r3, #1
	beq	.L168
	cmp	r3, #3
	bne	.L77
	ldr	r0, [r6]
	ldr	r8, .L169+32
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r4, .L169+36
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L77
	ldr	r3, [r6, #20]
	ldr	r1, [r6, #4]
	ldr	r0, [r6]
	add	r1, r1, r3
	ldr	r2, [r8]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r6]
	subne	r3, r3, #1
	strne	r3, [r6]
	b	.L77
.L67:
	ldr	r7, .L169+12
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L83
	ldr	r8, .L169+28
.L100:
	ldr	r3, [r7, #32]
	bic	r3, r3, #2
	cmp	r3, #1
	bne	.L73
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r4, #2
	ldr	r3, [r6, #24]
	str	r4, [r7, #32]
	b	.L66
.L166:
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r8, .L169+32
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r4, .L169+36
	add	r1, r1, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L77
	ldr	r2, [r6, #16]
	ldr	r0, [r6]
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	ldr	r2, [r8]
	add	r1, r1, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r6, #4]
	addne	r3, r3, #1
	strne	r3, [r6, #4]
	b	.L77
.L160:
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #20]
	ldr	r6, .L169+32
	ldr	r0, [r7]
	ldr	r2, [r6]
	ldr	r4, .L169+36
	add	r1, r1, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L83
	ldr	r2, [r7, #16]
	ldr	r0, [r7]
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	ldr	r2, [r6]
	add	r1, r1, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r7, #4]
	addne	r3, r3, #1
	strne	r3, [r7, #4]
	b	.L83
.L164:
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
	b	.L91
.L165:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r6, #32]
	b	.L70
.L73:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r2, #3
	moveq	r2, #1
	ldr	r3, [r6, #24]
	str	r2, [r7, #32]
	b	.L66
.L167:
	ldr	r1, [r6, #4]
	ldr	r8, .L169+32
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r4, .L169+36
	sub	r1, r1, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L77
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	r1, [r6, #4]
	add	r0, r0, r3
	ldr	r2, [r8]
	sub	r0, r0, #1
	sub	r1, r1, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r6, #4]
	subne	r3, r3, #1
	strne	r3, [r6, #4]
	b	.L77
.L161:
	ldr	r1, [r7, #4]
	ldr	r6, .L169+32
	ldr	r0, [r7]
	ldr	r2, [r6]
	ldr	r4, .L169+36
	sub	r1, r1, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L83
	ldr	r0, [r7]
	ldr	r3, [r7, #16]
	ldr	r1, [r7, #4]
	add	r0, r0, r3
	ldr	r2, [r6]
	sub	r0, r0, #1
	sub	r1, r1, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r7, #4]
	subne	r3, r3, #1
	strne	r3, [r7, #4]
	b	.L83
.L168:
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	r8, .L169+32
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r4, .L169+36
	add	r0, r0, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L77
	ldr	r2, [r6, #20]
	ldr	r1, [r6, #4]
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	add	r1, r1, r2
	sub	r1, r1, #1
	ldr	r2, [r8]
	add	r0, r0, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r6]
	addne	r3, r3, #1
	strne	r3, [r6]
	b	.L77
.L162:
	ldr	r0, [r7]
	ldr	r3, [r7, #16]
	ldr	r6, .L169+32
	ldr	r1, [r7, #4]
	ldr	r2, [r6]
	ldr	r4, .L169+36
	add	r0, r0, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L83
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #4]
	ldr	r0, [r7]
	ldr	r3, [r7, #16]
	add	r1, r1, r2
	sub	r1, r1, #1
	ldr	r2, [r6]
	add	r0, r0, r3
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r7]
	addne	r3, r3, #1
	strne	r3, [r7]
	b	.L83
.L163:
	ldr	r0, [r7]
	ldr	r6, .L169+32
	ldr	r1, [r7, #4]
	ldr	r2, [r6]
	ldr	r4, .L169+36
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L83
	ldr	r3, [r7, #20]
	ldr	r1, [r7, #4]
	ldr	r0, [r7]
	add	r1, r1, r3
	ldr	r2, [r6]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r3, [r7]
	subne	r3, r3, #1
	strne	r3, [r7]
	b	.L83
.L170:
	.align	2
.L169:
	.word	.LANCHOR1
	.word	-2004318071
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	player
	.word	enemy4
	.word	rand
	.word	.LANCHOR0
	.word	isPassablePixel
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L185
	push	{r4, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ldrb	r2, [r0, #48]	@ zero_extendqisi2
	beq	.L172
	ldr	ip, [r0]
	ldr	r1, [r0, #40]
	ldr	r3, .L185+4
	ldr	r4, [r0, #32]
	cmp	r1, #0
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	and	r1, r1, #1
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r0, r3, r2, lsl #3
	rsblt	r1, r1, #0
	lsl	r2, r2, #3
	cmp	r4, #1
	strh	ip, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r1, r1, #64
	strheq	ip, [r0, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L174:
	ldr	r0, .L185+8
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrb	r2, [r0, #48]	@ zero_extendqisi2
	beq	.L175
	ldr	ip, [r0]
	ldr	r1, [r0, #40]
	ldr	r4, [r0, #32]
	cmp	r1, #0
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	and	r1, r1, #1
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r0, r3, r2, lsl #3
	rsblt	r1, r1, #0
	lsl	r2, r2, #3
	cmp	r4, #1
	strh	ip, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r1, r1, #64
	strheq	ip, [r0, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L177:
	ldr	r0, .L185+12
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrb	r2, [r0, #48]	@ zero_extendqisi2
	beq	.L178
	ldr	r1, [r0, #40]
	ldr	ip, [r0]
	cmp	r1, #0
	ldr	r4, [r0, #32]
	and	r1, r1, #1
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	rsblt	r1, r1, #0
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r0, r3, r2, lsl #3
	cmp	r4, #1
	lsl	r2, r2, #3
	add	r1, r1, #2
	strh	ip, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r1, r1, #64
	strheq	ip, [r0, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L180:
	ldr	r0, .L185+16
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrb	r2, [r0, #48]	@ zero_extendqisi2
	beq	.L181
	ldr	r1, [r0, #40]
	ldr	ip, [r0]
	ldr	r4, [r0, #32]
	cmp	r1, #0
	and	r1, r1, #1
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	rsblt	r1, r1, #0
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r0, r3, r2, lsl #3
	cmp	r4, #1
	lsl	r2, r2, #3
	add	r1, r1, #2
	strh	ip, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r1, r1, #64
	strheq	ip, [r0, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L172:
	mov	r1, #512
	ldr	r3, .L185+4
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L174
.L181:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L178:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L180
.L175:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L177
.L186:
	.align	2
.L185:
	.word	enemy1
	.word	shadowOAM
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L191
	ldr	r3, [r1, #32]
	sub	r3, r3, #1
	cmp	r3, #2
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L191+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	ldr	ip, .L191+8
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lslls	r0, r0, #16
	lsl	r3, r3, #23
	add	r1, ip, r2, lsl #3
	lsrls	r0, r0, #16
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	lr, [ip, r2]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L192:
	.align	2
.L191:
	.word	player
	.word	.LANCHOR2
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBomb
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBomb, %function
drawBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L228
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L193
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L195
	mov	ip, #96
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #24]
	ldr	r0, .L228+4
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L193:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L195:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L193
	mov	lr, #130
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #24]
	ldr	r5, .L228+4
	ldr	r1, [r4, #8]
	lsl	r2, r0, #23
	add	ip, r5, r3, lsl #3
	lsr	r2, r2, #23
	strh	r2, [ip, #2]	@ movhi
	lsl	r3, r3, #3
	and	r2, r1, #255
	ldr	r7, .L228+8
	strh	lr, [ip, #4]	@ movhi
	sub	r0, r0, #8
	strh	r2, [r5, r3]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L223
.L196:
	ldmib	r4, {r0, r1}
	ldr	r6, .L228+12
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L224
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #48]	@ movhi
	ldr	r0, [r4, #4]
.L198:
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L225
.L199:
	ldmib	r4, {r0, r1}
	add	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L200
	mov	r2, #131
	ldmib	r4, {r0, r1}
	add	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #58]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #56]	@ movhi
	strh	r2, [r5, #60]	@ movhi
.L201:
	sub	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L226
.L202:
	ldmib	r4, {r0, r1}
	sub	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L203
	mov	r2, #98
	ldmib	r4, {r0, r1}
	sub	r3, r1, #8
	and	r3, r3, #255
	strh	r3, [r5, #64]	@ movhi
	lsl	r3, r0, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #66]	@ movhi
	strh	r2, [r5, #68]	@ movhi
.L204:
	add	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L227
.L205:
	ldmib	r4, {r0, r1}
	add	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #512
	strhne	r3, [r5, #72]	@ movhi
	bne	.L193
	mov	r1, #162
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #4]
	add	r2, r2, #8
	lsl	r3, r3, #23
	and	r2, r2, #255
	lsr	r3, r3, #23
	strh	r2, [r5, #72]	@ movhi
	strh	r3, [r5, #74]	@ movhi
	strh	r1, [r5, #76]	@ movhi
	b	.L193
.L224:
	mov	r2, #129
	ldmib	r4, {r0, r1}
	sub	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #50]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #48]	@ movhi
	strh	r2, [r5, #52]	@ movhi
	b	.L198
.L203:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #64]	@ movhi
	ldr	r0, [r4, #4]
	b	.L204
.L200:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #56]	@ movhi
	ldr	r0, [r4, #4]
	b	.L201
.L226:
	ldmib	r4, {r0, r1}
	ldr	r3, .L228+16
	sub	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L202
.L225:
	ldmib	r4, {r0, r1}
	ldr	r3, .L228+16
	add	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L199
.L223:
	ldmib	r4, {r0, r1}
	ldr	r3, .L228+16
	sub	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L196
.L227:
	ldmib	r4, {r0, r1}
	ldr	r3, .L228+16
	add	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L205
.L229:
	.align	2
.L228:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	checkCollisionDestructableWall
	.word	checkCollisionWorld
	.word	destroySoftBlockAt
	.size	drawBomb, .-drawBomb
	.align	2
	.global	loseCondition
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseCondition, %function
loseCondition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L239
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r0, .L239+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L239+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L231
.L234:
	ldr	r2, .L239+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L238
	mov	r1, #1
	mov	r3, #0
	mov	r2, #8
	mov	r5, #24
	mov	lr, #4
	mov	ip, #15
	mov	r0, r1
	str	r1, [r4, #32]
	str	r3, [r4]
	str	r3, [r4, #40]
	strb	r3, [r4, #48]
	str	r5, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	lr, [r4, #44]
	str	ip, [r4, #28]
.L230:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L231:
	ldr	r0, .L239+16
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L234
	ldr	r0, .L239+20
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L234
	ldr	r0, .L239+24
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L230
	b	.L234
.L238:
	ldr	r3, .L239+28
	mov	lr, pc
	bx	r3
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L240:
	.align	2
.L239:
	.word	player
	.word	enemy1
	.word	collision
	.word	lives
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	goToLose
	.size	loseCondition, .-loseCondition
	.align	2
	.global	winCondition
	.syntax unified
	.arm
	.fpu softvfp
	.type	winCondition, %function
winCondition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L243
	push	{r4, lr}
	ldr	r2, .L243+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L244:
	.align	2
.L243:
	.word	player
	.word	checkCollisionWin
	.size	winCondition, .-winCondition
	.align	2
	.global	handleExplosion
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleExplosion, %function
handleExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r10, .L283
	sub	sp, sp, #68
	add	r3, r1, #8
	str	r3, [sp, #60]
	ldr	r3, [r10, #24]
	sub	ip, r0, #8
	sub	r2, r1, #8
	add	r0, r0, #8
	cmp	r3, #0
	str	r1, [sp, #36]
	str	r1, [sp, #44]
	str	r5, [sp, #48]
	str	r5, [sp, #56]
	str	ip, [sp, #32]
	str	r0, [sp, #40]
	str	r2, [sp, #52]
	ldr	fp, .L283+4
	ldr	r9, .L283+8
	ldr	r8, .L283+12
	ldr	r7, .L283+16
	ldr	r4, .L283+20
	add	r6, sp, #24
	bne	.L278
.L247:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L279
.L250:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	bne	.L280
.L253:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L281
.L256:
	mov	r3, #8
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r4, {ip, lr}
	mov	r0, r5
	mov	r2, r3
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L258
	ldr	r2, .L283+24
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L282
	mov	ip, #0
	mov	r0, #24
	mov	r1, #4
	mov	r2, #15
	mov	r3, #1
	str	ip, [r4]
	str	ip, [r4, #40]
	strb	ip, [r4, #48]
	mov	ip, #8
	str	r0, [r4, #4]
	str	ip, [r4, #16]
	str	ip, [r4, #20]
	str	r1, [r4, #44]
	str	r2, [r4, #28]
	str	r3, [r4, #32]
.L258:
	add	r3, sp, #56
	cmp	r6, r3
	beq	.L245
	ldr	r3, [r10, #24]
	cmp	r3, #0
	ldr	r5, [r6, #8]
	ldr	r1, [r6, #12]
	add	r6, r6, #8
	beq	.L247
.L278:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r10, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r10]
	mov	r2, r3
	str	r0, [sp]
	mov	r0, r5
	str	r1, [sp, #20]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L247
	mov	lr, #0
	mov	r0, #512
	ldr	ip, .L283+28
	ldr	r3, [ip]
	add	r3, r3, #100
	ldrb	r2, [r10, #48]	@ zero_extendqisi2
	str	r3, [ip]
	ldr	r3, [r9, #24]
	str	lr, [r10, #24]
	ldr	lr, .L283+32
	lsl	r2, r2, #3
	cmp	r3, #0
	strh	r0, [lr, r2]	@ movhi
	beq	.L250
.L279:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r9]
	mov	r2, r3
	str	r0, [sp]
	mov	r0, r5
	str	r1, [sp, #20]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L250
	mov	lr, #0
	mov	r0, #512
	ldr	ip, .L283+28
	ldr	r3, [ip]
	add	r3, r3, #100
	ldrb	r2, [r9, #48]	@ zero_extendqisi2
	str	r3, [ip]
	ldr	r3, [r8, #24]
	str	lr, [r9, #24]
	ldr	lr, .L283+32
	lsl	r2, r2, #3
	cmp	r3, #0
	strh	r0, [lr, r2]	@ movhi
	beq	.L253
.L280:
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r8]
	mov	r2, r3
	str	r0, [sp]
	mov	r0, r5
	str	r1, [sp, #20]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L253
	mov	lr, #0
	mov	r0, #512
	ldr	ip, .L283+28
	ldr	r3, [ip]
	add	r3, r3, #150
	ldrb	r2, [r8, #48]	@ zero_extendqisi2
	str	r3, [ip]
	ldr	r3, [r7, #24]
	str	lr, [r8, #24]
	ldr	lr, .L283+32
	lsl	r2, r2, #3
	cmp	r3, #0
	strh	r0, [lr, r2]	@ movhi
	beq	.L256
.L281:
	mov	r3, #8
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r7, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r7]
	mov	r2, r3
	str	r0, [sp]
	mov	r0, r5
	str	r1, [sp, #20]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L256
	mov	lr, #0
	mov	r0, #512
	ldr	ip, .L283+28
	ldrb	r2, [r7, #48]	@ zero_extendqisi2
	ldr	r3, [ip]
	str	lr, [r7, #24]
	ldr	lr, .L283+32
	lsl	r2, r2, #3
	add	r3, r3, #150
	strh	r0, [lr, r2]	@ movhi
	str	r3, [ip]
	b	.L256
.L245:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L282:
	ldr	r3, .L283+36
	mov	lr, pc
	bx	r3
	b	.L258
.L284:
	.align	2
.L283:
	.word	enemy1
	.word	collision
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	lives
	.word	score
	.word	shadowOAM
	.word	goToLose
	.size	handleExplosion, .-handleExplosion
	.align	2
	.global	updateBomb
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBomb, %function
updateBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L290
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ble	.L288
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	bxne	lr
	mov	r2, #20
	ldmib	r3, {r0, r1}
	str	r2, [r3, #16]
	b	handleExplosion
.L288:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #16]
	bxne	lr
	mov	r0, #512
	ldr	ip, [r3, #24]
	ldr	r1, .L290+4
	lsl	ip, ip, #3
	strh	r0, [r1, ip]	@ movhi
	str	r2, [r3, #20]
	strh	r0, [r1, #48]	@ movhi
	strh	r0, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	bx	lr
.L291:
	.align	2
.L290:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	updateBomb, .-updateBomb
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L296
	add	r2, r3, #1024
.L293:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L293
	bx	lr
.L297:
	.align	2
.L296:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	bomb
	.comm	player,52,4
	.comm	enemy4,52,4
	.comm	enemy3,52,4
	.comm	enemy2,52,4
	.comm	enemy1,52,4
	.global	round
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.52, %object
	.size	CSWTCH.52, 12
CSWTCH.52:
	.word	4
	.word	2
	.word	6
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	round, %object
	.size	round, 4
round:
	.word	1
	.type	bomb, %object
	.size	bomb, 24
bomb:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	5
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	changeTimer.4672, %object
	.size	changeTimer.4672, 4
changeTimer.4672:
	.space	4
	.type	enemyDelayCounter.4673, %object
	.size	enemyDelayCounter.4673, 4
enemyDelayCounter.4673:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
