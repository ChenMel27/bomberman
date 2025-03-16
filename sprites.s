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
	ldr	r4, .L171
	ldr	r5, .L171+4
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #24]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4, #4]
	beq	.L71
	ldr	r2, [r4, #8]
	cmp	r2, #0
	beq	.L164
.L71:
	ldr	r6, .L171+8
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ldr	r3, [r4, #12]
	beq	.L84
	cmp	r3, #0
	beq	.L165
.L84:
	ldr	r2, [r4, #16]
	add	r2, r2, #1
	cmp	r2, #2
	add	r1, r4, #20
	str	r2, [r4, #16]
	ldm	r1, {r1, r2}
	ble	.L106
	mov	ip, #0
	ldr	r0, .L171+12
	ldr	lr, [r0, #24]
	cmp	lr, ip
	str	ip, [r4, #16]
	beq	.L108
	cmp	r1, ip
	bne	.L108
	ldr	ip, .L171+16
	ldr	lr, [r0]
	ldr	r7, [ip]
	cmp	r7, lr
	addgt	lr, lr, #1
	strgt	lr, [r0]
	bgt	.L111
	sublt	lr, lr, #1
	strlt	lr, [r0]
.L111:
	ldr	lr, [ip, #4]
	ldr	ip, [r0, #4]
	cmp	lr, ip
	addgt	ip, ip, #1
	strgt	ip, [r0, #4]
	bgt	.L108
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
.L108:
	ldr	r0, .L171+20
	ldr	ip, [r0, #24]
	cmp	ip, #0
	bne	.L166
.L106:
	ldr	r0, [r4, #8]
	cmp	r0, #0
	ble	.L118
	sub	r0, r0, #1
	cmp	r0, #0
	str	r0, [r4, #8]
	beq	.L167
.L118:
	cmp	r3, #0
	ble	.L121
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #12]
	beq	.L168
.L121:
	cmp	r1, #0
	ble	.L124
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r4, #20]
	beq	.L169
.L124:
	cmp	r2, #0
	ble	.L69
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r4, #24]
	bne	.L69
	mov	ip, #512
	ldr	r1, .L171+20
	ldrb	r3, [r1, #48]	@ zero_extendqisi2
	ldr	r0, .L171+24
	lsl	r3, r3, #3
	str	r2, [r1, #24]
	strh	ip, [r0, r3]	@ movhi
.L69:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L169:
	mov	ip, #512
	ldr	r0, .L171+12
	ldrb	r3, [r0, #48]	@ zero_extendqisi2
	str	r1, [r0, #24]
	ldr	r1, .L171+24
	lsl	r3, r3, #3
	strh	ip, [r1, r3]	@ movhi
	b	.L124
.L168:
	mov	ip, #512
	ldrb	r0, [r6, #48]	@ zero_extendqisi2
	str	r3, [r6, #24]
	ldr	r3, .L171+24
	lsl	r0, r0, #3
	strh	ip, [r3, r0]	@ movhi
	b	.L121
.L167:
	mov	lr, #512
	ldrb	ip, [r5, #48]	@ zero_extendqisi2
	str	r0, [r5, #24]
	ldr	r0, .L171+24
	lsl	ip, ip, #3
	strh	lr, [r0, ip]	@ movhi
	b	.L118
.L166:
	cmp	r2, #0
	bne	.L106
	ldr	ip, .L171+16
	ldr	lr, [r0]
	ldr	r7, [ip]
	cmp	r7, lr
	addgt	lr, lr, #1
	strgt	lr, [r0]
	bgt	.L115
	sublt	lr, lr, #1
	strlt	lr, [r0]
.L115:
	ldr	lr, [ip, #4]
	ldr	ip, [r0, #4]
	cmp	lr, ip
	addgt	ip, ip, #1
	strgt	ip, [r0, #4]
	bgt	.L106
	sublt	ip, ip, #1
	strlt	ip, [r0, #4]
	b	.L106
.L165:
	ldr	r2, [r4, #4]
	add	r2, r2, r2, lsl #4
	ldr	r1, .L171+28
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	sub	r2, r1, r2
	cmp	r1, r2, ror #1
	ldr	r2, [r6, #32]
	bcc	.L85
	bic	r2, r2, #2
	cmp	r2, #1
	ldr	r3, .L171+32
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
	ldr	r8, .L171+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L171+40
	sub	r1, r1, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L163
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
	beq	.L163
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldr	r3, [r4, #12]
	ldrgt	r2, [r6, #4]
	subgt	r2, r2, #1
	strgt	r2, [r6, #4]
	b	.L84
.L164:
	add	r3, r3, r3, lsl #4
	ldr	r2, .L171+28
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	ldr	r3, [r5, #32]
	bcs	.L170
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
	ldr	r7, .L171+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L171+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	ldr	r0, [r5]
	add	r1, r1, r3
	ldr	r2, [r7]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L71
	ldr	r3, [r5]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r5]
	b	.L71
.L170:
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r3, .L171+32
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
	ldr	r7, .L171+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L171+40
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
	beq	.L71
	ldr	r3, [r5, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r5, #4]
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
	ldr	r8, .L171+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L171+40
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L163
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r0, [r6]
	add	r1, r1, r3
	ldr	r2, [r8]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L163
	ldr	r2, [r6]
	cmp	r2, #0
	subgt	r2, r2, #1
	ldr	r3, [r4, #12]
	strgt	r2, [r6]
	b	.L84
.L76:
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	ldr	r7, .L171+36
	ldr	r0, [r5]
	ldr	r2, [r7]
	ldr	r6, .L171+40
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
	beq	.L71
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	add	r3, r2, r3
	cmp	r3, #159
	addle	r2, r2, #1
	strle	r2, [r5, #4]
	b	.L71
.L89:
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r8, .L171+36
	ldr	r0, [r6]
	ldr	r2, [r8]
	ldr	r7, .L171+40
	add	r1, r1, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L94
.L163:
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
	ldr	r7, .L171+36
	ldr	r1, [r5, #4]
	ldr	r2, [r7]
	ldr	r6, .L171+40
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
	beq	.L71
	ldr	r2, [r5]
	ldr	r3, [r5, #16]
	add	r3, r2, r3
	cmp	r3, #239
	addle	r2, r2, #1
	strle	r2, [r5]
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
	ldr	r8, .L171+36
	ldr	r1, [r6, #4]
	ldr	r2, [r8]
	ldr	r7, .L171+40
	add	r0, r0, r3
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L163
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
	beq	.L163
	ldr	r3, [r5]
	ldr	r2, [r5, #20]
	add	r3, r3, r2
	cmp	r3, #239
	ldrle	r3, [r6]
	addle	r3, r3, #1
	strle	r3, [r6]
	b	.L163
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
	beq	.L163
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #16]
	add	r3, r3, r2
	cmp	r3, #159
	ldr	r3, [r4, #12]
	ldrle	r2, [r6, #4]
	addle	r2, r2, #1
	strle	r2, [r6, #4]
	b	.L84
.L172:
	.align	2
.L171:
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
	ldr	r1, .L197
	push	{r4, r5, lr}
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L174
	ldr	r3, .L197+4
	ldr	r3, [r3, #8]
	cmp	r3, #0
	ble	.L175
	cmp	r3, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L176:
	ldr	ip, [r1]
	ldr	r3, .L197+8
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
	ldr	r3, .L197+8
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L178:
	ldr	r1, .L197+12
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L179
	ldr	r0, .L197+4
	ldr	r0, [r0, #12]
	cmp	r0, #0
	ble	.L180
	cmp	r0, #15
	movgt	r0, #0
	movle	r0, #1
	mov	lr, #32
.L181:
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
	b	.L183
.L179:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L183:
	ldr	r1, .L197+16
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L184
	ldr	r0, .L197+4
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
	b	.L188
.L184:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
.L188:
	ldr	r1, .L197+20
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L189
	ldr	r0, .L197+4
	ldr	r0, [r0, #24]
	cmp	r0, #0
	ble	.L190
	cmp	r0, #15
	movgt	ip, #34
	movle	ip, #35
.L191:
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
.L189:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L175:
	ldr	r3, [r1, #40]
	cmp	r3, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	mov	lr, #64
	mov	r0, r3
	b	.L176
.L190:
	ldr	ip, [r1, #40]
	cmp	ip, #0
	and	ip, ip, #1
	rsblt	ip, ip, #0
	add	ip, ip, #66
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L191
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
	ldr	r0, [r1, #40]
	cmp	r0, #0
	and	r0, r0, #1
	mov	lr, #64
	rsblt	r0, r0, #0
	b	.L181
.L198:
	.align	2
.L197:
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
	ldr	r1, .L203
	ldr	r3, [r1, #32]
	cmp	r3, #3
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L203+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	ldr	ip, .L203+8
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
.L204:
	.align	2
.L203:
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
	ldr	r4, .L240
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L205
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L207
	mov	ip, #96
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #24]
	ldr	r0, .L240+4
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L205:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L207:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L205
	mov	lr, #130
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #24]
	ldr	r5, .L240+4
	ldr	r1, [r4, #8]
	lsl	r2, r0, #23
	add	ip, r5, r3, lsl #3
	lsr	r2, r2, #23
	strh	r2, [ip, #2]	@ movhi
	lsl	r3, r3, #3
	and	r2, r1, #255
	ldr	r7, .L240+8
	strh	lr, [ip, #4]	@ movhi
	sub	r0, r0, #8
	strh	r2, [r5, r3]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L235
.L208:
	ldmib	r4, {r0, r1}
	ldr	r6, .L240+12
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L236
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #48]	@ movhi
	ldr	r0, [r4, #4]
.L210:
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L237
.L211:
	ldmib	r4, {r0, r1}
	add	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L212
	mov	r2, #131
	ldmib	r4, {r0, r1}
	add	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #58]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #56]	@ movhi
	strh	r2, [r5, #60]	@ movhi
.L213:
	sub	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L238
.L214:
	ldmib	r4, {r0, r1}
	sub	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L215
	mov	r2, #98
	ldmib	r4, {r0, r1}
	sub	r3, r1, #8
	and	r3, r3, #255
	strh	r3, [r5, #64]	@ movhi
	lsl	r3, r0, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #66]	@ movhi
	strh	r2, [r5, #68]	@ movhi
.L216:
	add	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L239
.L217:
	ldmib	r4, {r0, r1}
	add	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #512
	strhne	r3, [r5, #72]	@ movhi
	bne	.L205
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
	b	.L205
.L236:
	mov	r2, #129
	ldmib	r4, {r0, r1}
	sub	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #50]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #48]	@ movhi
	strh	r2, [r5, #52]	@ movhi
	b	.L210
.L215:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #64]	@ movhi
	ldr	r0, [r4, #4]
	b	.L216
.L212:
	mov	r3, #512
	ldr	r1, [r4, #8]
	strh	r3, [r5, #56]	@ movhi
	ldr	r0, [r4, #4]
	b	.L213
.L238:
	ldmib	r4, {r0, r1}
	ldr	r3, .L240+16
	sub	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L214
.L237:
	ldmib	r4, {r0, r1}
	ldr	r3, .L240+16
	add	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L211
.L235:
	ldmib	r4, {r0, r1}
	ldr	r3, .L240+16
	sub	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L208
.L239:
	ldmib	r4, {r0, r1}
	ldr	r3, .L240+16
	add	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L217
.L241:
	.align	2
.L240:
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
	ldr	r4, .L251
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r0, .L251+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L251+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L243
.L246:
	ldr	r2, .L251+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L250
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
.L242:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L243:
	ldr	r0, .L251+16
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
	bne	.L246
	ldr	r0, .L251+20
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
	bne	.L246
	ldr	r0, .L251+24
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
	beq	.L242
	b	.L246
.L250:
	ldr	r3, .L251+28
	mov	lr, pc
	bx	r3
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L252:
	.align	2
.L251:
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
	ldr	r3, .L255
	push	{r4, lr}
	ldr	r2, .L255+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L256:
	.align	2
.L255:
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
	ldr	fp, .L299
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
	ldr	r5, .L299+4
	ldr	r10, .L299+8
	ldr	r9, .L299+12
	ldr	r8, .L299+16
	ldr	r7, .L299+20
	add	r4, sp, #24
	beq	.L259
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L292
.L259:
	ldr	r3, [r10, #24]
	cmp	r3, #0
	beq	.L262
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L293
.L262:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	beq	.L265
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L294
.L265:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L268
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L295
.L268:
	ldr	r3, [r5]
	cmp	r3, #0
	str	r3, [sp, #20]
	beq	.L296
.L271:
	add	r3, sp, #56
	cmp	r4, r3
	beq	.L257
.L298:
	ldr	r3, [fp, #24]
	cmp	r3, #0
	ldr	r6, [r4, #8]
	ldr	r1, [r4, #12]
	add	r4, r4, #8
	beq	.L259
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L259
.L292:
	mov	r3, #8
	add	ip, fp, #16
	ldm	ip, {ip, lr}
	ldr	r0, [fp, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [fp]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L299+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L259
	mov	r2, #50
	ldr	r0, .L299+28
	ldr	r3, [r0]
	add	r3, r3, #100
	str	r3, [r0]
	str	r2, [r5, #8]
	b	.L259
.L296:
	mov	r3, #8
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r7, {ip, lr}
	mov	r0, r6
	stm	sp, {ip, lr}
	mov	r2, r3
	ldr	ip, .L299+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L271
	ldr	r2, .L299+32
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L297
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
	bne	.L298
.L257:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L293:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r10, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r10]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L299+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L262
	mov	r2, #50
	ldr	r0, .L299+28
	ldr	r3, [r0]
	add	r3, r3, #100
	str	r3, [r0]
	str	r2, [r5, #12]
	b	.L262
.L294:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r9]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L299+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L265
	mov	r2, #50
	ldr	r0, .L299+28
	ldr	r3, [r0]
	add	r3, r3, #150
	str	r3, [r0]
	str	r2, [r5, #20]
	b	.L265
.L295:
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	stmib	sp, {r0, ip, lr}
	ldr	r0, [r8]
	mov	r2, r3
	str	r0, [sp]
	ldr	ip, .L299+24
	mov	r0, r6
	str	r1, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r1, [sp, #20]
	beq	.L268
	mov	r2, #50
	ldr	r0, .L299+28
	ldr	r3, [r0]
	add	r3, r3, #150
	str	r3, [r0]
	str	r2, [r5, #24]
	b	.L268
.L297:
	ldr	r3, .L299+36
	mov	lr, pc
	bx	r3
	b	.L271
.L300:
	.align	2
.L299:
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
	ldr	r3, .L306
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ble	.L304
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	bxne	lr
	mov	r2, #20
	ldmib	r3, {r0, r1}
	str	r2, [r3, #16]
	b	handleExplosion
.L304:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #16]
	bxne	lr
	mov	r0, #512
	ldr	ip, [r3, #24]
	ldr	r1, .L306+4
	lsl	ip, ip, #3
	strh	r0, [r1, ip]	@ movhi
	str	r2, [r3, #20]
	strh	r0, [r1, #48]	@ movhi
	strh	r0, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	bx	lr
.L307:
	.align	2
.L306:
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
	ldr	r3, .L312
	add	r2, r3, #1024
.L309:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L309
	bx	lr
.L313:
	.align	2
.L312:
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
	.type	changeTimer.4691, %object
	.size	changeTimer.4691, 4
changeTimer.4691:
	.space	4
	.type	enemy1DeathTimer, %object
	.size	enemy1DeathTimer, 4
enemy1DeathTimer:
	.space	4
	.type	enemy2DeathTimer, %object
	.size	enemy2DeathTimer, 4
enemy2DeathTimer:
	.space	4
	.type	enemyDelayCounter.4692, %object
	.size	enemyDelayCounter.4692, 4
enemyDelayCounter.4692:
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
