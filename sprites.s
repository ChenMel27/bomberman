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
	ldr	r4, .L166
	ldr	r5, .L166+4
	ldr	r3, [r4]
	ldr	r2, [r5, #24]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4]
	beq	.L67
	ldr	r2, [r4, #4]
	cmp	r2, #0
	beq	.L159
.L67:
	ldr	r6, .L166+8
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ldr	r3, [r4, #8]
	beq	.L80
	cmp	r3, #0
	beq	.L160
.L80:
	ldr	r2, [r4, #12]
	add	r2, r2, #1
	cmp	r2, #2
	add	r1, r4, #16
	str	r2, [r4, #12]
	ldm	r1, {r1, r2}
	ble	.L101
	mov	ip, #0
	ldr	r0, .L166+12
	ldr	lr, [r0, #24]
	cmp	lr, ip
	str	ip, [r4, #12]
	beq	.L103
	cmp	r1, ip
	bne	.L103
	ldr	ip, .L166+16
	ldr	lr, [r0]
	ldr	r7, [ip]
	cmp	r7, lr
	addgt	lr, lr, #1
	strgt	lr, [r0]
	bgt	.L106
	sublt	lr, lr, #1
	strlt	lr, [r0]
.L106:
	ldr	lr, [ip, #4]
	ldr	ip, [r0, #4]
	cmp	lr, ip
	addgt	ip, ip, #1
	strgt	ip, [r0, #4]
	bgt	.L103
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
.L103:
	ldr	r0, .L166+20
	ldr	ip, [r0, #24]
	cmp	ip, #0
	bne	.L161
.L101:
	ldr	r0, [r4, #4]
	cmp	r0, #0
	ble	.L113
	sub	r0, r0, #1
	cmp	r0, #0
	str	r0, [r4, #4]
	beq	.L162
.L113:
	cmp	r3, #0
	ble	.L116
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	beq	.L163
.L116:
	cmp	r1, #0
	ble	.L119
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #16]
	beq	.L164
.L119:
	cmp	r2, #0
	ble	.L65
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r4, #20]
	bne	.L65
	mov	ip, #512
	ldr	r1, .L166+20
	ldrb	r3, [r1, #48]	@ zero_extendqisi2
	ldr	r0, .L166+24
	lsl	r3, r3, #3
	str	r2, [r1, #24]
	strh	ip, [r0, r3]	@ movhi
.L65:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L164:
	mov	ip, #512
	ldr	r0, .L166+12
	ldrb	r3, [r0, #48]	@ zero_extendqisi2
	str	r1, [r0, #24]
	ldr	r1, .L166+24
	lsl	r3, r3, #3
	strh	ip, [r1, r3]	@ movhi
	b	.L119
.L163:
	mov	ip, #512
	ldrb	r0, [r6, #48]	@ zero_extendqisi2
	str	r3, [r6, #24]
	ldr	r3, .L166+24
	lsl	r0, r0, #3
	strh	ip, [r3, r0]	@ movhi
	b	.L116
.L162:
	mov	lr, #512
	ldrb	ip, [r5, #48]	@ zero_extendqisi2
	str	r0, [r5, #24]
	ldr	r0, .L166+24
	lsl	ip, ip, #3
	strh	lr, [r0, ip]	@ movhi
	b	.L113
.L161:
	cmp	r2, #0
	bne	.L101
	ldr	ip, .L166+16
	ldr	lr, [r0]
	ldr	r7, [ip]
	cmp	r7, lr
	addgt	lr, lr, #1
	strgt	lr, [r0]
	bgt	.L110
	sublt	lr, lr, #1
	strlt	lr, [r0]
.L110:
	ldr	lr, [ip, #4]
	ldr	ip, [r0, #4]
	cmp	lr, ip
	addgt	ip, ip, #1
	strgt	ip, [r0, #4]
	bgt	.L101
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
	b	.L101
.L160:
	ldr	r2, [r4]
	add	r2, r2, r2, lsl #4
	ldr	r1, .L166+28
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, r1, r2
	cmp	r1, r2, ror #1
	ldr	r2, [r6, #32]
	bcc	.L81
	bic	r2, r2, #2
	cmp	r2, #1
	ldr	r3, .L166+32
	bne	.L82
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	movne	r3, #2
	streq	r0, [r6, #32]
	strne	r3, [r6, #32]
	beq	.L85
.L84:
	ldr	r1, [r6, #4]
	ldr	r8, .L166+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L166+40
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	r1, [r6, #4]
	add	r0, r0, r3
	ldr	r2, [r8]
	sub	r0, r0, #1
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r3, [r6, #4]
	sub	r3, r3, #1
	str	r3, [r6, #4]
	ldr	r3, [r4, #8]
	b	.L80
.L159:
	add	r3, r3, r3, lsl #4
	ldr	r2, .L166+28
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	ldr	r3, [r5, #32]
	bcs	.L165
	cmp	r3, #0
	beq	.L72
	cmp	r3, #2
	beq	.L73
	cmp	r3, #1
	beq	.L76
	cmp	r3, #3
	bne	.L67
.L75:
	ldr	r0, [r5]
	ldr	r7, .L166+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L166+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L67
	ldr	r3, [r5, #20]
	ldr	r1, [r5, #4]
	ldr	r0, [r5]
	add	r1, r1, r3
	ldr	r2, [r7]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5]
	subne	r3, r3, #1
	strne	r3, [r5]
	b	.L67
.L165:
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r3, .L166+32
	bne	.L70
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	movne	r3, #2
	streq	r0, [r5, #32]
	strne	r3, [r5, #32]
	beq	.L72
.L73:
	ldr	r1, [r5, #4]
	ldr	r7, .L166+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L166+40
	sub	r1, r1, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L67
	ldr	r0, [r5]
	ldr	r3, [r5, #16]
	ldr	r1, [r5, #4]
	add	r0, r0, r3
	ldr	r2, [r7]
	sub	r0, r0, #1
	sub	r1, r1, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	subne	r3, r3, #1
	strne	r3, [r5, #4]
	b	.L67
.L81:
	cmp	r2, #0
	beq	.L85
	cmp	r2, #2
	beq	.L84
	cmp	r2, #1
	beq	.L88
	cmp	r2, #3
	bne	.L80
.L87:
	ldr	r0, [r6]
	ldr	r8, .L166+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L166+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r3, [r6, #20]
	ldr	r1, [r6, #4]
	ldr	r0, [r6]
	add	r1, r1, r3
	ldr	r2, [r8]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r6]
	subne	r3, r3, #1
	strne	r3, [r6]
	b	.L158
.L72:
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	ldr	r7, .L166+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L166+40
	add	r1, r1, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L67
	ldr	r2, [r5, #16]
	ldr	r0, [r5]
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	ldr	r2, [r7]
	add	r1, r1, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	addne	r3, r3, #1
	strne	r3, [r5, #4]
	b	.L67
.L85:
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r8, .L166+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L166+40
	add	r1, r1, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L90
.L158:
	ldr	r3, [r4, #8]
	b	.L80
.L70:
	mov	lr, pc
	bx	r3
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	strne	r3, [r5, #32]
	streq	r3, [r5, #32]
	bne	.L75
.L76:
	ldr	r0, [r5]
	ldr	r3, [r5, #16]
	ldr	r7, .L166+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L166+40
	add	r0, r0, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L67
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #4]
	ldr	r0, [r5]
	ldr	r3, [r5, #16]
	add	r1, r1, r2
	sub	r1, r1, #1
	ldr	r2, [r7]
	add	r0, r0, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5]
	addne	r3, r3, #1
	strne	r3, [r5]
	b	.L67
.L82:
	mov	lr, pc
	bx	r3
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	strne	r3, [r6, #32]
	streq	r3, [r6, #32]
	bne	.L87
.L88:
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	r8, .L166+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L166+40
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r2, [r6, #20]
	ldr	r1, [r6, #4]
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	add	r1, r1, r2
	sub	r1, r1, #1
	ldr	r2, [r8]
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	ldr	r3, [r4, #8]
	b	.L80
.L90:
	ldr	r2, [r6, #16]
	ldr	r0, [r6]
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	add	r0, r0, r2
	sub	r0, r0, #1
	ldr	r2, [r8]
	add	r1, r1, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L158
	ldr	r3, [r6, #4]
	add	r3, r3, #1
	str	r3, [r6, #4]
	ldr	r3, [r4, #8]
	b	.L80
.L167:
	.align	2
.L166:
	.word	.LANCHOR1
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	player
	.word	enemy4
	.word	shadowOAM
	.word	143165576
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
	ldr	r1, .L192
	push	{r4, r5, lr}
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L169
	ldr	r3, .L192+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L170
	cmp	r3, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L171:
	ldr	ip, [r1]
	ldr	r3, .L192+8
	ldr	r5, [r1, #32]
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r1, r3, r2, lsl #3
	cmp	r5, #1
	lsl	r2, r2, #3
	strh	ip, [r1, #2]	@ movhi
	strh	r4, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r0, lr, r0
	strheq	ip, [r1, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	b	.L173
.L169:
	mov	r1, #512
	ldr	r3, .L192+8
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L173:
	ldr	r1, .L192+12
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L174
	ldr	r0, .L192+4
	ldr	r0, [r0, #8]
	cmp	r0, #0
	ble	.L175
	cmp	r0, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L176:
	ldr	ip, [r1]
	ldr	r5, [r1, #32]
	ldrb	r4, [r1, #4]	@ zero_extendqisi2
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	add	r1, r3, r2, lsl #3
	cmp	r5, #1
	lsl	r2, r2, #3
	strh	ip, [r1, #2]	@ movhi
	strh	r4, [r3, r2]	@ movhi
	orreq	ip, ip, #4096
	add	r2, r3, r2
	add	r0, lr, r0
	strheq	ip, [r1, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	b	.L178
.L174:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L178:
	ldr	r1, .L192+16
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L179
	ldr	r0, .L192+4
	ldr	r0, [r0, #16]
	cmp	r0, #0
	ble	.L180
	cmp	r0, #15
	movgt	ip, #34
	movle	ip, #35
.L181:
	ldr	r0, [r1]
	ldr	r4, [r1, #32]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	add	r1, r3, r2, lsl #3
	cmp	r4, #1
	lsl	r2, r2, #3
	strh	r0, [r1, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	r0, r0, #4096
	add	r2, r3, r2
	strheq	r0, [r1, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	b	.L183
.L179:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L183:
	ldr	r1, .L192+20
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L184
	ldr	r0, .L192+4
	ldr	r0, [r0, #20]
	cmp	r0, #0
	ble	.L185
	cmp	r0, #15
	movgt	ip, #34
	movle	ip, #35
.L186:
	ldr	r0, [r1]
	ldr	r4, [r1, #32]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	add	r1, r3, r2, lsl #3
	cmp	r4, #1
	lsl	r2, r2, #3
	strh	r0, [r1, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	orreq	r0, r0, #4096
	add	r2, r3, r2
	strheq	r0, [r1, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L184:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L170:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	mov	lr, #64
	mov	r0, r3
	b	.L171
.L185:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	and	ip, ip, #1
	rsblt	ip, ip, #0
	add	ip, ip, #66
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L186
.L180:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	and	ip, ip, #1
	rsblt	ip, ip, #0
	add	ip, ip, #66
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L181
.L175:
	ldr	r0, [r1, #40]
	cmp	r0, #0
	and	r0, r0, #1
	mov	lr, #64
	rsblt	r0, r0, #0
	b	.L176
.L193:
	.align	2
.L192:
	.word	enemy1
	.word	.LANCHOR1
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
	ldr	r1, .L198
	ldr	r3, [r1, #32]
	sub	r3, r3, #1
	cmp	r3, #2
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L198+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	ldr	ip, .L198+8
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
.L199:
	.align	2
.L198:
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
	ldr	r4, .L235
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L200
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L202
	mov	ip, #96
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #24]
	ldr	r0, .L235+4
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L200:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L202:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L200
	mov	lr, #130
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #24]
	ldr	r5, .L235+4
	ldr	r1, [r4, #8]
	lsl	r2, r0, #23
	add	ip, r5, r3, lsl #3
	lsr	r2, r2, #23
	strh	r2, [ip, #2]	@ movhi
	lsl	r3, r3, #3
	and	r2, r1, #255
	ldr	r7, .L235+8
	strh	lr, [ip, #4]	@ movhi
	sub	r0, r0, #8
	strh	r2, [r5, r3]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L230
.L203:
	ldmib	r4, {r0, r1}
	ldr	r6, .L235+12
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L231
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #48]	@ movhi
	ldr	r0, [r4, #4]
.L205:
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L232
.L206:
	ldmib	r4, {r0, r1}
	add	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L207
	mov	r2, #131
	ldmib	r4, {r0, r1}
	add	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #58]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #56]	@ movhi
	strh	r2, [r5, #60]	@ movhi
.L208:
	sub	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L233
.L209:
	ldmib	r4, {r0, r1}
	sub	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L210
	mov	r2, #98
	ldmib	r4, {r0, r1}
	sub	r3, r1, #8
	and	r3, r3, #255
	strh	r3, [r5, #64]	@ movhi
	lsl	r3, r0, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #66]	@ movhi
	strh	r2, [r5, #68]	@ movhi
.L211:
	add	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L234
.L212:
	ldmib	r4, {r0, r1}
	add	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #512
	strhne	r3, [r5, #72]	@ movhi
	bne	.L200
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
	b	.L200
.L231:
	mov	r2, #129
	ldmib	r4, {r0, r1}
	sub	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #50]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #48]	@ movhi
	strh	r2, [r5, #52]	@ movhi
	b	.L205
.L210:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #64]	@ movhi
	ldr	r0, [r4, #4]
	b	.L211
.L207:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #56]	@ movhi
	ldr	r0, [r4, #4]
	b	.L208
.L233:
	ldmib	r4, {r0, r1}
	ldr	r3, .L235+16
	sub	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L209
.L232:
	ldmib	r4, {r0, r1}
	ldr	r3, .L235+16
	add	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L206
.L230:
	ldmib	r4, {r0, r1}
	ldr	r3, .L235+16
	sub	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L203
.L234:
	ldmib	r4, {r0, r1}
	ldr	r3, .L235+16
	add	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L212
.L236:
	.align	2
.L235:
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
	ldr	r4, .L246
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r0, .L246+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L246+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L238
.L241:
	ldr	r2, .L246+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L245
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
.L237:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L238:
	ldr	r0, .L246+16
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
	bne	.L241
	ldr	r0, .L246+20
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
	bne	.L241
	ldr	r0, .L246+24
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
	beq	.L237
	b	.L241
.L245:
	ldr	r3, .L246+28
	mov	lr, pc
	bx	r3
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L247:
	.align	2
.L246:
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
	ldr	r3, .L250
	push	{r4, lr}
	ldr	r2, .L250+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L251:
	.align	2
.L250:
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
	mov	r6, r0
	ldr	fp, .L290
	sub	sp, sp, #68
	add	r3, r1, #8
	str	r3, [sp, #60]
	ldr	r3, [fp, #24]
	sub	ip, r0, #8
	sub	r2, r1, #8
	add	r0, r0, #8
	cmp	r3, #0
	str	r1, [sp, #36]
	str	r1, [sp, #44]
	str	r6, [sp, #48]
	str	r6, [sp, #56]
	str	ip, [sp, #32]
	str	r0, [sp, #40]
	str	r2, [sp, #52]
	ldr	r10, .L290+4
	ldr	r9, .L290+8
	ldr	r8, .L290+12
	ldr	r4, .L290+16
	ldr	r7, .L290+20
	add	r5, sp, #24
	beq	.L254
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L285
.L254:
	ldr	r3, [r10, #24]
	cmp	r3, #0
	beq	.L257
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L286
.L257:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	beq	.L260
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L287
.L260:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L263
	ldr	r3, [r7, #20]
	cmp	r3, #0
	beq	.L288
.L263:
	mov	r3, #8
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r4, {ip, lr}
	mov	r0, r6
	stm	sp, {ip, lr}
	mov	r2, r3
	ldr	ip, .L290+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L265
	ldr	r2, .L290+28
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L289
	mov	r3, #0
	mov	lr, #8
	mov	ip, #24
	mov	r0, #4
	mov	r1, #15
	mov	r2, #1
	str	lr, [r4, #16]
	str	lr, [r4, #20]
	str	r3, [r4]
	str	r3, [r4, #40]
	strb	r3, [r4, #48]
	str	ip, [r4, #4]
	str	r0, [r4, #44]
	str	r1, [r4, #28]
	str	r2, [r4, #32]
.L265:
	add	r3, sp, #56
	cmp	r5, r3
	beq	.L252
	ldr	r3, [fp, #24]
	cmp	r3, #0
	ldr	r6, [r5, #8]
	ldr	r1, [r5, #12]
	add	r5, r5, #8
	beq	.L254
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L254
.L285:
	mov	r3, #8
	add	ip, fp, #16
	ldm	ip, {ip, lr}
	ldr	r0, [fp, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [fp]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L290+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L254
	mov	r0, #50
	ldr	r2, .L290+32
	ldr	r3, [r2]
	add	r3, r3, #100
	str	r0, [r7, #4]
	str	r3, [r2]
	b	.L254
.L252:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L286:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r10, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r10]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L290+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L257
	mov	r0, #50
	ldr	r2, .L290+32
	ldr	r3, [r2]
	add	r3, r3, #100
	str	r0, [r7, #8]
	str	r3, [r2]
	b	.L257
.L287:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r9]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L290+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L260
	mov	r0, #50
	ldr	r2, .L290+32
	ldr	r3, [r2]
	add	r3, r3, #150
	str	r0, [r7, #16]
	str	r3, [r2]
	b	.L260
.L288:
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r8]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L290+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L263
	mov	r0, #50
	ldr	r2, .L290+32
	ldr	r3, [r2]
	add	r3, r3, #150
	str	r0, [r7, #20]
	str	r3, [r2]
	b	.L263
.L289:
	ldr	r3, .L290+36
	mov	lr, pc
	bx	r3
	b	.L265
.L291:
	.align	2
.L290:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	.LANCHOR1
	.word	collision
	.word	lives
	.word	score
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
	ldr	r3, .L297
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ble	.L295
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	bxne	lr
	mov	r2, #20
	ldmib	r3, {r0, r1}
	str	r2, [r3, #16]
	b	handleExplosion
.L295:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #16]
	bxne	lr
	mov	r0, #512
	ldr	ip, [r3, #24]
	ldr	r1, .L297+4
	lsl	ip, ip, #3
	strh	r0, [r1, ip]	@ movhi
	str	r2, [r3, #20]
	strh	r0, [r1, #48]	@ movhi
	strh	r0, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	bx	lr
.L298:
	.align	2
.L297:
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
	ldr	r3, .L303
	add	r2, r3, #1024
.L300:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L300
	bx	lr
.L304:
	.align	2
.L303:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	bomb
	.comm	player,52,4
	.comm	enemy4,52,4
	.comm	enemy3,52,4
	.comm	enemy2,52,4
	.comm	enemy1,52,4
	.global	round
	.global	enemy4DeathTimer
	.global	enemy3DeathTimer
	.global	enemy2DeathTimer
	.global	enemy1DeathTimer
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.83, %object
	.size	CSWTCH.83, 12
CSWTCH.83:
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
	.type	changeTimer.4676, %object
	.size	changeTimer.4676, 4
changeTimer.4676:
	.space	4
	.type	enemy1DeathTimer, %object
	.size	enemy1DeathTimer, 4
enemy1DeathTimer:
	.space	4
	.type	enemy2DeathTimer, %object
	.size	enemy2DeathTimer, 4
enemy2DeathTimer:
	.space	4
	.type	enemyDelayCounter.4677, %object
	.size	enemyDelayCounter.4677, 4
enemyDelayCounter.4677:
	.space	4
	.type	enemy3DeathTimer, %object
	.size	enemy3DeathTimer, 4
enemy3DeathTimer:
	.space	4
	.type	enemy4DeathTimer, %object
	.size	enemy4DeathTimer, 4
enemy4DeathTimer:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
