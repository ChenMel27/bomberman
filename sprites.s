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
	ldr	r4, .L67
	ldr	r6, .L67+4
	ldr	r7, [r4]
	ldr	r5, [r4, #16]
	ldr	r8, [r4, #4]
	ldr	r1, [r4, #20]
	ldrh	r3, [r6]
	add	r5, r7, r5
	add	r1, r8, r1
	tst	r3, #128
	sub	sp, sp, #12
	sub	r10, r5, #1
	sub	r9, r1, #1
	bne	.L29
	cmp	r1, #255
	ble	.L63
.L30:
	mov	r2, #0
	str	r2, [r4, #32]
.L29:
	tst	r3, #64
	bne	.L33
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L64
	mov	r2, #2
	str	r2, [r4, #32]
.L33:
	tst	r3, #16
	bne	.L37
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	cmp	r2, #512
	blt	.L65
	mov	r2, #1
	str	r2, [r4, #32]
.L37:
	tst	r3, #32
	bne	.L41
	ldr	r3, [r4]
	cmp	r3, #0
	bgt	.L66
.L43:
	mov	r3, #3
	str	r3, [r4, #32]
.L41:
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L45
	ldrh	r2, [r6]
	tst	r2, #4
	bne	.L45
	ldr	r2, .L67+12
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L45
	ldm	r4, {r0, r1}
	add	lr, r0, #7
	cmp	r0, #0
	movlt	r0, lr
	add	ip, r1, #7
	cmp	r1, #0
	movlt	r1, ip
	mov	lr, #60
	mov	ip, #1
	bic	r0, r0, #7
	bic	r1, r1, #7
	stmib	r2, {r0, r1, lr}
	str	ip, [r2, #20]
.L45:
	tst	r3, #512
	beq	.L28
	ldrh	r3, [r6]
	tst	r3, #512
	moveq	r2, #1
	ldreq	r3, .L67+16
	streq	r2, [r3]
.L28:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	ldr	r3, .L67+12
	sub	r1, r8, #1
	ldr	r2, [r3]
	mov	r0, r7
	ldr	fp, .L67+20
	str	r1, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r1, [sp, #4]
	ldr	r3, .L67+12
	bne	.L35
.L61:
	mov	r2, #2
	ldrh	r3, [r6]
	str	r2, [r4, #32]
	b	.L33
.L66:
	ldr	r10, .L67+12
	sub	r7, r7, #1
	mov	r1, r8
	mov	r0, r7
	ldr	r2, [r10]
	ldr	r5, .L67+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L43
	mov	r1, r9
	mov	r0, r7
	ldr	r2, [r10]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #1
	strne	r3, [r4]
	b	.L43
.L63:
	ldr	r3, .L67+12
	mov	r0, r7
	ldr	r2, [r3]
	ldr	fp, .L67+20
	str	r1, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r3, .L67+12
	ldr	r1, [sp, #4]
	bne	.L31
.L60:
	ldrh	r3, [r6]
	b	.L30
.L65:
	ldr	fp, .L67+12
	mov	r1, r8
	mov	r0, r5
	ldr	r2, [fp]
	ldr	r10, .L67+20
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L39
.L62:
	mov	r2, #1
	ldrh	r3, [r6]
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
	b	.L61
.L31:
	ldr	r2, [r3]
	mov	r0, r10
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #1
	strne	r3, [r4, #4]
	b	.L60
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
	b	.L62
.L68:
	.align	2
.L67:
	.word	player
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	.LANCHOR1
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
	ldr	r4, .L170
	ldr	r5, .L170+4
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #24]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4, #4]
	beq	.L71
	ldr	r2, [r4, #8]
	cmp	r2, #0
	beq	.L163
.L71:
	ldr	r6, .L170+8
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ldr	r3, [r4, #12]
	beq	.L84
	cmp	r3, #0
	beq	.L164
.L84:
	ldr	r2, [r4, #16]
	add	r2, r2, #1
	cmp	r2, #2
	add	r1, r4, #20
	str	r2, [r4, #16]
	ldm	r1, {r1, r2}
	ble	.L105
	mov	ip, #0
	ldr	r0, .L170+12
	ldr	lr, [r0, #24]
	cmp	lr, ip
	str	ip, [r4, #16]
	beq	.L107
	cmp	r1, ip
	bne	.L107
	ldr	ip, .L170+16
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
	bgt	.L107
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
.L107:
	ldr	r0, .L170+20
	ldr	ip, [r0, #24]
	cmp	ip, #0
	bne	.L165
.L105:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	ble	.L117
	sub	r0, r0, #1
	cmp	r0, #0
	str	r0, [r4, #8]
	beq	.L166
.L117:
	cmp	r3, #0
	ble	.L120
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #12]
	beq	.L167
.L120:
	cmp	r1, #0
	ble	.L123
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #20]
	beq	.L168
.L123:
	cmp	r2, #0
	ble	.L69
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r4, #24]
	bne	.L69
	mov	ip, #512
	ldr	r1, .L170+20
	ldrb	r3, [r1, #48]	@ zero_extendqisi2
	ldr	r0, .L170+24
	lsl	r3, r3, #3
	str	r2, [r1, #24]
	strh	ip, [r0, r3]	@ movhi
.L69:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L168:
	mov	ip, #512
	ldr	r0, .L170+12
	ldrb	r3, [r0, #48]	@ zero_extendqisi2
	str	r1, [r0, #24]
	ldr	r1, .L170+24
	lsl	r3, r3, #3
	strh	ip, [r1, r3]	@ movhi
	b	.L123
.L167:
	mov	ip, #512
	ldrb	r0, [r6, #48]	@ zero_extendqisi2
	str	r3, [r6, #24]
	ldr	r3, .L170+24
	lsl	r0, r0, #3
	strh	ip, [r3, r0]	@ movhi
	b	.L120
.L166:
	mov	lr, #512
	ldrb	ip, [r5, #48]	@ zero_extendqisi2
	str	r0, [r5, #24]
	ldr	r0, .L170+24
	lsl	ip, ip, #3
	strh	lr, [r0, ip]	@ movhi
	b	.L117
.L165:
	cmp	r2, #0
	bne	.L105
	ldr	ip, .L170+16
	ldr	lr, [r0]
	ldr	r7, [ip]
	cmp	r7, lr
	addgt	lr, lr, #1
	strgt	lr, [r0]
	bgt	.L114
	sublt	lr, lr, #1
	strlt	lr, [r0]
.L114:
	ldr	lr, [ip, #4]
	ldr	ip, [r0, #4]
	cmp	lr, ip
	addgt	ip, ip, #1
	strgt	ip, [r0, #4]
	bgt	.L105
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
	b	.L105
.L164:
	ldr	r2, [r4, #4]
	add	r2, r2, r2, lsl #4
	ldr	r1, .L170+28
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, r1, r2
	cmp	r1, r2, ror #1
	ldr	r2, [r6, #32]
	bcc	.L85
	bic	r2, r2, #2
	cmp	r2, #1
	ldr	r3, .L170+32
	bne	.L86
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	movne	r3, #2
	streq	r0, [r6, #32]
	strne	r3, [r6, #32]
	beq	.L89
.L88:
	ldr	r1, [r6, #4]
	ldr	r8, .L170+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L170+40
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L162
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
	beq	.L162
	ldr	r3, [r6, #4]
	sub	r3, r3, #1
	str	r3, [r6, #4]
	ldr	r3, [r4, #12]
	b	.L84
.L163:
	add	r3, r3, r3, lsl #4
	ldr	r2, .L170+28
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	ldr	r3, [r5, #32]
	bcs	.L169
	cmp	r3, #0
	beq	.L76
	cmp	r3, #2
	beq	.L77
	cmp	r3, #1
	beq	.L80
	cmp	r3, #3
	bne	.L71
.L79:
	ldr	r0, [r5]
	ldr	r7, .L170+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L170+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
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
	b	.L71
.L169:
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r3, .L170+32
	bne	.L74
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	movne	r3, #2
	streq	r0, [r5, #32]
	strne	r3, [r5, #32]
	beq	.L76
.L77:
	ldr	r1, [r5, #4]
	ldr	r7, .L170+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L170+40
	sub	r1, r1, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
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
	b	.L71
.L85:
	cmp	r2, #0
	beq	.L89
	cmp	r2, #2
	beq	.L88
	cmp	r2, #1
	beq	.L92
	cmp	r2, #3
	bne	.L84
.L91:
	ldr	r0, [r6]
	ldr	r8, .L170+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L170+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L162
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
	b	.L162
.L76:
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	ldr	r7, .L170+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L170+40
	add	r1, r1, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
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
	b	.L71
.L89:
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r8, .L170+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L170+40
	add	r1, r1, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L94
.L162:
	ldr	r3, [r4, #12]
	b	.L84
.L74:
	mov	lr, pc
	bx	r3
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	strne	r3, [r5, #32]
	streq	r3, [r5, #32]
	bne	.L79
.L80:
	ldr	r0, [r5]
	ldr	r3, [r5, #16]
	ldr	r7, .L170+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L170+40
	add	r0, r0, r3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
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
	b	.L71
.L86:
	mov	lr, pc
	bx	r3
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	strne	r3, [r6, #32]
	streq	r3, [r6, #32]
	bne	.L91
.L92:
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	r8, .L170+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L170+40
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L162
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
	beq	.L162
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	ldr	r3, [r4, #12]
	b	.L84
.L94:
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
	beq	.L162
	ldr	r3, [r6, #4]
	add	r3, r3, #1
	str	r3, [r6, #4]
	ldr	r3, [r4, #12]
	b	.L84
.L171:
	.align	2
.L170:
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
	ldr	r1, .L196
	push	{r4, r5, lr}
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L173
	ldr	r3, .L196+4
	ldr	r3, [r3, #8]
	cmp	r3, #0
	ble	.L174
	cmp	r3, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L175:
	ldr	ip, [r1]
	ldr	r3, .L196+8
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
	b	.L177
.L173:
	mov	r1, #512
	ldr	r3, .L196+8
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L177:
	ldr	r1, .L196+12
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L178
	ldr	r0, .L196+4
	ldr	r0, [r0, #12]
	cmp	r0, #0
	ble	.L179
	cmp	r0, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L180:
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
	b	.L182
.L178:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L182:
	ldr	r1, .L196+16
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L183
	ldr	r0, .L196+4
	ldr	r0, [r0, #20]
	cmp	r0, #0
	ble	.L184
	cmp	r0, #15
	movgt	ip, #34
	movle	ip, #35
.L185:
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
	b	.L187
.L183:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L187:
	ldr	r1, .L196+20
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L188
	ldr	r0, .L196+4
	ldr	r0, [r0, #24]
	cmp	r0, #0
	ble	.L189
	cmp	r0, #15
	movgt	ip, #34
	movle	ip, #35
.L190:
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
.L188:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L174:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	mov	lr, #64
	mov	r0, r3
	b	.L175
.L189:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	and	ip, ip, #1
	rsblt	ip, ip, #0
	add	ip, ip, #66
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L190
.L184:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	and	ip, ip, #1
	rsblt	ip, ip, #0
	add	ip, ip, #66
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L185
.L179:
	ldr	r0, [r1, #40]
	cmp	r0, #0
	and	r0, r0, #1
	mov	lr, #64
	rsblt	r0, r0, #0
	b	.L180
.L197:
	.align	2
.L196:
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
	ldr	r1, .L202
	ldr	r3, [r1, #32]
	cmp	r3, #3
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L202+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	ldr	ip, .L202+8
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
.L203:
	.align	2
.L202:
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
	ldr	r4, .L239
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L204
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L206
	mov	ip, #96
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #24]
	ldr	r0, .L239+4
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L204:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L206:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L204
	mov	lr, #130
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #24]
	ldr	r5, .L239+4
	ldr	r1, [r4, #8]
	lsl	r2, r0, #23
	add	ip, r5, r3, lsl #3
	lsr	r2, r2, #23
	strh	r2, [ip, #2]	@ movhi
	lsl	r3, r3, #3
	and	r2, r1, #255
	ldr	r7, .L239+8
	strh	lr, [ip, #4]	@ movhi
	sub	r0, r0, #8
	strh	r2, [r5, r3]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L234
.L207:
	ldmib	r4, {r0, r1}
	ldr	r6, .L239+12
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L235
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #48]	@ movhi
	ldr	r0, [r4, #4]
.L209:
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L236
.L210:
	ldmib	r4, {r0, r1}
	add	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L211
	mov	r2, #131
	ldmib	r4, {r0, r1}
	add	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #58]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #56]	@ movhi
	strh	r2, [r5, #60]	@ movhi
.L212:
	sub	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L237
.L213:
	ldmib	r4, {r0, r1}
	sub	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L214
	mov	r2, #98
	ldmib	r4, {r0, r1}
	sub	r3, r1, #8
	and	r3, r3, #255
	strh	r3, [r5, #64]	@ movhi
	lsl	r3, r0, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #66]	@ movhi
	strh	r2, [r5, #68]	@ movhi
.L215:
	add	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L238
.L216:
	ldmib	r4, {r0, r1}
	add	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #512
	strhne	r3, [r5, #72]	@ movhi
	bne	.L204
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
	b	.L204
.L235:
	mov	r2, #129
	ldmib	r4, {r0, r1}
	sub	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #50]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #48]	@ movhi
	strh	r2, [r5, #52]	@ movhi
	b	.L209
.L214:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #64]	@ movhi
	ldr	r0, [r4, #4]
	b	.L215
.L211:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #56]	@ movhi
	ldr	r0, [r4, #4]
	b	.L212
.L237:
	ldmib	r4, {r0, r1}
	ldr	r3, .L239+16
	sub	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L213
.L236:
	ldmib	r4, {r0, r1}
	ldr	r3, .L239+16
	add	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L210
.L234:
	ldmib	r4, {r0, r1}
	ldr	r3, .L239+16
	sub	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L207
.L238:
	ldmib	r4, {r0, r1}
	ldr	r3, .L239+16
	add	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L216
.L240:
	.align	2
.L239:
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
	ldr	r4, .L250
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r0, .L250+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L250+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L242
.L245:
	ldr	r2, .L250+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L249
	mov	r0, #0
	mov	r3, #8
	mov	ip, #24
	mov	r1, #4
	mov	r2, #15
	mov	r5, #1
	str	r0, [r4]
	str	r0, [r4, #40]
	strb	r0, [r4, #48]
	str	ip, [r4, #4]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r1, [r4, #44]
	str	r2, [r4, #28]
	str	r5, [r4, #32]
	bl	initializeEnemies
	mov	r0, r5
.L241:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L242:
	ldr	r0, .L250+16
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
	bne	.L245
	ldr	r0, .L250+20
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
	bne	.L245
	ldr	r0, .L250+24
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
	beq	.L241
	b	.L245
.L249:
	ldr	r3, .L250+28
	mov	lr, pc
	bx	r3
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L251:
	.align	2
.L250:
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
	ldr	r3, .L254
	push	{r4, lr}
	ldr	r2, .L254+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L255:
	.align	2
.L254:
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
	ldr	fp, .L298
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
	ldr	r5, .L298+4
	ldr	r10, .L298+8
	ldr	r9, .L298+12
	ldr	r8, .L298+16
	ldr	r7, .L298+20
	add	r4, sp, #24
	beq	.L258
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L291
.L258:
	ldr	r3, [r10, #24]
	cmp	r3, #0
	beq	.L261
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L292
.L261:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	beq	.L264
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L293
.L264:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L267
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L294
.L267:
	ldr	r3, [r5]
	cmp	r3, #0
	str	r3, [sp, #20]
	beq	.L295
.L270:
	add	r3, sp, #56
	cmp	r4, r3
	beq	.L256
.L297:
	ldr	r3, [fp, #24]
	cmp	r3, #0
	ldr	r6, [r4, #8]
	ldr	r1, [r4, #12]
	add	r4, r4, #8
	beq	.L258
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L258
.L291:
	mov	r3, #8
	add	ip, fp, #16
	ldm	ip, {ip, lr}
	ldr	r0, [fp, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [fp]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L298+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L258
	mov	r2, #50
	ldr	r0, .L298+28
	ldr	r3, [r0]
	add	r3, r3, #100
	str	r3, [r0]
	str	r2, [r5, #8]
	b	.L258
.L295:
	mov	r3, #8
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r7, {ip, lr}
	mov	r0, r6
	stm	sp, {ip, lr}
	mov	r2, r3
	ldr	ip, .L298+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L270
	ldr	r2, .L298+32
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L296
	mov	r3, #1
	mov	lr, #8
	mov	ip, #24
	mov	r1, #4
	mov	r2, #15
	ldr	r0, [sp, #20]
	str	r3, [r7, #32]
	str	r0, [r7]
	str	r0, [r7, #40]
	strb	r0, [r7, #48]
	str	lr, [r7, #16]
	str	lr, [r7, #20]
	str	ip, [r7, #4]
	str	r1, [r7, #44]
	str	r2, [r7, #28]
	bl	initializeEnemies
	add	r3, sp, #56
	cmp	r4, r3
	bne	.L297
.L256:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L292:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r10, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r10]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L298+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L261
	mov	r2, #50
	ldr	r0, .L298+28
	ldr	r3, [r0]
	add	r3, r3, #100
	str	r3, [r0]
	str	r2, [r5, #12]
	b	.L261
.L293:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r9]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L298+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L264
	mov	r2, #50
	ldr	r0, .L298+28
	ldr	r3, [r0]
	add	r3, r3, #150
	str	r3, [r0]
	str	r2, [r5, #20]
	b	.L264
.L294:
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r8]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L298+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L267
	mov	r2, #50
	ldr	r0, .L298+28
	ldr	r3, [r0]
	add	r3, r3, #150
	str	r3, [r0]
	str	r2, [r5, #24]
	b	.L267
.L296:
	ldr	r3, .L298+36
	mov	lr, pc
	bx	r3
	b	.L270
.L299:
	.align	2
.L298:
	.word	enemy1
	.word	.LANCHOR1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	collision
	.word	score
	.word	lives
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
	ldr	r3, .L305
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ble	.L303
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	bxne	lr
	mov	r2, #20
	ldmib	r3, {r0, r1}
	str	r2, [r3, #16]
	b	handleExplosion
.L303:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #16]
	bxne	lr
	mov	r0, #512
	ldr	ip, [r3, #24]
	ldr	r1, .L305+4
	lsl	ip, ip, #3
	strh	r0, [r1, ip]	@ movhi
	str	r2, [r3, #20]
	strh	r0, [r1, #48]	@ movhi
	strh	r0, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	bx	lr
.L306:
	.align	2
.L305:
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
	ldr	r3, .L311
	add	r2, r3, #1024
.L308:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L308
	bx	lr
.L312:
	.align	2
.L311:
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
	.global	playerImmuneToBombs
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.86, %object
	.size	CSWTCH.86, 16
CSWTCH.86:
	.word	10
	.word	11
	.word	2
	.word	8
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
	.type	playerImmuneToBombs, %object
	.size	playerImmuneToBombs, 4
playerImmuneToBombs:
	.space	4
	.type	changeTimer.4690, %object
	.size	changeTimer.4690, 4
changeTimer.4690:
	.space	4
	.type	enemy1DeathTimer, %object
	.size	enemy1DeathTimer, 4
enemy1DeathTimer:
	.space	4
	.type	enemy2DeathTimer, %object
	.size	enemy2DeathTimer, 4
enemy2DeathTimer:
	.space	4
	.type	enemyDelayCounter.4691, %object
	.size	enemyDelayCounter.4691, 4
enemyDelayCounter.4691:
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
