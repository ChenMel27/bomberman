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
	mov	r1, #32
	mov	r4, #24
	mov	lr, #4
	mov	ip, #15
	mov	r0, #1
	ldr	r3, .L4
	strb	r2, [r3, #44]
	str	r4, [r3, #4]
	str	lr, [r3, #40]
	str	r2, [r3]
	str	r2, [r3, #36]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #8
	mov	lr, #4
	mov	r4, #1
	mov	r0, #0
	mov	r7, #104
	mov	r2, #15
	mov	r5, #136
	mov	r6, #24
	mov	r8, #2
	mov	ip, #3
	ldr	r3, .L8
	str	r7, [r3]
	str	r7, [r3, #4]
	str	lr, [r3, #40]
	str	r0, [r3, #36]
	str	r4, [r3, #28]
	strb	r4, [r3, #44]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, .L8+4
	str	r2, [r3, #24]
	ldr	r2, .L8+8
	stm	r3, {r5, r6}
	str	lr, [r3, #40]
	str	r0, [r3, #36]
	str	r4, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	strb	r8, [r3, #44]
	ldr	r3, .L8+12
	str	lr, [r2, #24]
	str	r6, [r2]
	str	r5, [r2, #4]
	str	r0, [r2, #36]
	str	r4, [r2, #28]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	strb	ip, [r2, #44]
	str	ip, [r2, #40]
	str	ip, [r2, #8]
	str	ip, [r2, #12]
	ldr	r2, .L8+16
	str	r5, [r3]
	str	r5, [r3, #4]
	str	r0, [r3, #36]
	str	r4, [r3, #28]
	strb	lr, [r3, #44]
	str	lr, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #40]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	mov	lr, pc
	bx	r2
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	srand
	.size	initializeEnemies, .-initializeEnemies
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
	ldr	r5, .L57
	ldr	r3, [r5]
	ldr	r2, .L57+4
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	asr	r4, r3, #31
	add	r2, r2, r3
	rsb	r4, r4, r2, asr #4
	ldr	r7, .L57+8
	rsb	r4, r4, r4, lsl #4
	subs	r4, r3, r4, lsl #1
	str	r3, [r5]
	ldr	r3, [r7, #28]
	beq	.L46
	ldr	r6, .L57+12
.L11:
	cmp	r3, #0
	beq	.L48
.L19:
	cmp	r3, #2
	beq	.L49
	cmp	r3, #1
	beq	.L50
	cmp	r3, #3
	beq	.L51
.L21:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L52
	cmp	r3, #2
	beq	.L53
	cmp	r3, #1
	beq	.L54
	cmp	r3, #3
	beq	.L55
.L27:
	ldr	r3, [r5, #4]
	add	r3, r3, #1
	cmp	r3, #2
	strle	r3, [r5, #4]
	ble	.L10
	mov	ip, #0
	ldr	r3, .L57+16
	ldr	r1, .L57+20
	ldr	r2, [r3]
	ldr	r0, [r1]
	cmp	r0, r2
	addgt	r2, r2, #1
	str	ip, [r5, #4]
	strgt	r2, [r3]
	bgt	.L34
	sublt	r2, r2, #1
	strlt	r2, [r3]
.L34:
	ldr	r2, [r3, #4]
	ldr	r1, [r1, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	bgt	.L36
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
.L36:
	ldr	r3, .L57+24
	ldr	r2, [r3]
	cmp	r0, r2
	addgt	r2, r2, #1
	strgt	r2, [r3]
	bgt	.L38
	sublt	r2, r2, #1
	strlt	r2, [r3]
.L38:
	ldr	r2, [r3, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	bgt	.L10
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
.L10:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r8, .L57+28
	beq	.L56
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	str	r3, [r7, #28]
.L14:
	ldr	r6, .L57+12
	ldr	r3, [r6, #28]
	bic	r3, r3, #2
	cmp	r3, #1
	bne	.L16
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r4, #2
	ldr	r3, [r7, #28]
	cmp	r3, #0
	str	r4, [r6, #28]
	bne	.L19
.L48:
	ldm	r7, {r0, r1}
	ldr	r3, .L57+32
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L21
	ldm	r7, {r0, r1}
	ldr	r3, .L57+36
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r7, #4]
	addeq	r3, r3, #1
	streq	r3, [r7, #4]
	b	.L21
.L56:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r7, #28]
	b	.L14
.L52:
	ldm	r6, {r0, r1}
	ldr	r3, .L57+32
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L27
	ldm	r6, {r0, r1}
	ldr	r3, .L57+36
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r6, #4]
	addeq	r3, r3, #1
	streq	r3, [r6, #4]
	b	.L27
.L16:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r2, #3
	moveq	r2, #1
	ldr	r3, [r7, #28]
	str	r2, [r6, #28]
	b	.L11
.L50:
	ldm	r7, {r0, r1}
	ldr	r3, .L57+32
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L21
	ldm	r7, {r0, r1}
	ldr	r3, .L57+36
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r7]
	addeq	r3, r3, #1
	streq	r3, [r7]
	b	.L21
.L53:
	ldm	r6, {r0, r1}
	ldr	r3, .L57+32
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L27
	ldm	r6, {r0, r1}
	ldr	r3, .L57+36
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r6, #4]
	subeq	r3, r3, #1
	streq	r3, [r6, #4]
	b	.L27
.L49:
	ldm	r7, {r0, r1}
	ldr	r3, .L57+32
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L21
	ldm	r7, {r0, r1}
	ldr	r3, .L57+36
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r7, #4]
	subeq	r3, r3, #1
	streq	r3, [r7, #4]
	b	.L21
.L54:
	ldm	r6, {r0, r1}
	ldr	r3, .L57+32
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L27
	ldm	r6, {r0, r1}
	ldr	r3, .L57+36
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r6]
	addeq	r3, r3, #1
	streq	r3, [r6]
	b	.L27
.L51:
	ldm	r7, {r0, r1}
	ldr	r3, .L57+32
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L21
	ldm	r7, {r0, r1}
	ldr	r3, .L57+36
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r7]
	subeq	r3, r3, #1
	streq	r3, [r7]
	b	.L21
.L55:
	ldm	r6, {r0, r1}
	ldr	r3, .L57+32
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L27
	ldm	r6, {r0, r1}
	ldr	r3, .L57+36
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r6]
	subeq	r3, r3, #1
	streq	r3, [r6]
	b	.L27
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	-2004318071
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	player
	.word	enemy4
	.word	rand
	.word	checkCollisionWorld
	.word	checkCollisionDestructableWall
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L88
	ldrh	r3, [r5]
	tst	r3, #128
	bne	.L60
	ldr	r4, .L88+4
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	rsb	r2, r2, #256
	cmp	r1, r2
	blt	.L84
.L61:
	mov	r2, #0
	str	r2, [r4, #28]
.L60:
	tst	r3, #64
	bne	.L64
	ldr	r4, .L88+4
	ldr	r1, [r4, #4]
	cmp	r1, #0
	bgt	.L85
	mov	r2, #2
	str	r2, [r4, #28]
.L64:
	tst	r3, #16
	bne	.L68
	ldr	r4, .L88+4
	ldr	r2, [r4, #16]
	ldr	r0, [r4]
	rsb	r2, r2, #256
	cmp	r0, r2
	blt	.L86
	mov	r2, #1
	str	r2, [r4, #28]
.L68:
	tst	r3, #32
	bne	.L72
	ldr	r4, .L88+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L87
.L74:
	mov	r3, #3
	str	r3, [r4, #28]
.L72:
	ldr	r3, .L88+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L59
	ldrh	r3, [r5]
	tst	r3, #1
	bne	.L59
	ldr	r3, .L88+12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L59
	ldr	r2, .L88+4
	ldm	r2, {r1, r2}
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
	stm	r3, {r1, r2, ip}
	str	r0, [r3, #16]
.L59:
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	ldr	r0, [r4]
	ldr	r3, .L88+16
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L66
.L82:
	mov	r2, #2
	ldrh	r3, [r5]
	str	r2, [r4, #28]
	b	.L64
.L87:
	ldr	r1, [r4, #4]
	ldr	r3, .L88+16
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L74
	ldm	r4, {r0, r1}
	ldr	r3, .L88+20
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r4]
	subeq	r3, r3, #1
	streq	r3, [r4]
	b	.L74
.L84:
	ldr	r0, [r4]
	ldr	r3, .L88+16
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L62
.L81:
	ldrh	r3, [r5]
	b	.L61
.L86:
	ldr	r1, [r4, #4]
	ldr	r3, .L88+16
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L70
.L83:
	mov	r2, #1
	ldrh	r3, [r5]
	str	r2, [r4, #28]
	b	.L68
.L66:
	ldm	r4, {r0, r1}
	ldr	r3, .L88+20
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r4, #4]
	subeq	r3, r3, #1
	streq	r3, [r4, #4]
	b	.L82
.L62:
	ldm	r4, {r0, r1}
	ldr	r3, .L88+20
	add	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r4, #4]
	addeq	r3, r3, #1
	streq	r3, [r4, #4]
	b	.L81
.L70:
	ldm	r4, {r0, r1}
	ldr	r3, .L88+20
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldreq	r3, [r4]
	addeq	r3, r3, #1
	streq	r3, [r4]
	b	.L83
.L89:
	.align	2
.L88:
	.word	buttons
	.word	player
	.word	oldButtons
	.word	.LANCHOR1
	.word	checkCollisionWorld
	.word	checkCollisionDestructableWall
	.size	updatePlayer, .-updatePlayer
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
	push	{r4, r5, r6, r7, lr}
	mov	r6, #13
	mov	lr, #14
	ldr	r0, .L92
	ldrb	r2, [r0, #44]	@ zero_extendqisi2
	ldr	r3, .L92+4
	ldrb	r7, [r0, #4]	@ zero_extendqisi2
	ldr	r1, [r0]
	lsl	r0, r2, #3
	strh	r7, [r3, r0]	@ movhi
	ldr	r0, .L92+8
	ldr	r5, .L92+12
	add	r2, r3, r2, lsl #3
	and	r1, r1, r0
	strh	r1, [r2, #2]	@ movhi
	ldrb	r1, [r5, #44]	@ zero_extendqisi2
	strh	r6, [r2, #4]	@ movhi
	lsl	r2, r1, #3
	add	r1, r3, r1, lsl #3
	strh	r6, [r1, #4]	@ movhi
	ldr	ip, .L92+16
	ldrb	r6, [r5, #4]	@ zero_extendqisi2
	ldr	r5, [r5]
	strh	r6, [r3, r2]	@ movhi
	and	r5, r5, r0
	ldrb	r2, [ip, #44]	@ zero_extendqisi2
	strh	r5, [r1, #2]	@ movhi
	ldr	r4, .L92+20
	ldrb	r5, [ip, #4]	@ zero_extendqisi2
	lsl	r1, r2, #3
	strh	r5, [r3, r1]	@ movhi
	ldr	ip, [ip]
	ldr	r1, [r4]
	and	ip, ip, r0
	and	r0, r0, r1
	ldrb	r1, [r4, #44]	@ zero_extendqisi2
	add	r2, r3, r2, lsl #3
	ldrb	r4, [r4, #4]	@ zero_extendqisi2
	strh	ip, [r2, #2]	@ movhi
	add	ip, r3, r1, lsl #3
	lsl	r1, r1, #3
	strh	lr, [r2, #4]	@ movhi
	strh	r4, [r3, r1]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	enemy1
	.word	shadowOAM
	.word	511
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
	ldr	r1, .L98
	ldr	r3, [r1, #28]
	sub	r3, r3, #1
	cmp	r3, #2
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L98+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #44]	@ zero_extendqisi2
	ldr	ip, .L98+8
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
.L99:
	.align	2
.L98:
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
	ldr	r3, .L110
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #8]
	cmp	r2, #0
	push	{r4, r5, lr}
	ble	.L102
	ldr	r2, [r3]
	ldr	r1, [r3, #20]
	ldr	r0, .L110+4
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	ldr	ip, .L110+8
	lsl	r2, r2, #23
	add	r3, r0, r1, lsl #3
	lsr	r2, r2, #23
	lsl	r1, r1, #3
	strh	r2, [r3, #2]	@ movhi
	strh	lr, [r0, r1]	@ movhi
	strh	ip, [r3, #4]	@ movhi
.L100:
	pop	{r4, r5, lr}
	bx	lr
.L102:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ble	.L100
	ldrh	r0, [r3]
	ldr	r2, .L110+4
	ldr	r5, .L110+12
	ldr	r1, [r3, #20]
	ldrb	r4, [r3, #4]	@ zero_extendqisi2
	ldr	lr, .L110+16
	sub	ip, r0, #8
	and	r3, ip, r5
	and	r0, r0, r5
	add	ip, r2, r1, lsl #3
	lsl	r1, r1, #3
	strh	r4, [r2, r1]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r4, [r2, #48]	@ movhi
	strh	lr, [r2, #52]	@ movhi
	strh	r3, [r2, #50]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	.LANCHOR1
	.word	shadowOAM
	.word	258
	.word	511
	.word	259
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L117
	ldr	r0, .L117+4
	ldm	r4, {r2, ip}
	ldr	lr, [r4, #16]
	sub	sp, sp, #20
	ldr	r3, [r0, #4]
	ldr	r5, [r4, #20]
	stm	sp, {r2, ip, lr}
	str	r5, [sp, #12]
	mov	r1, r3
	ldr	r2, [r0, #16]
	ldr	r5, .L117+8
	ldr	r0, [r0]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L113
.L115:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L113:
	ldr	r0, .L117+12
	ldr	ip, [r4, #16]
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r6, [r4, #20]
	ldr	r0, [r0]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	mov	r1, r3
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L115
	ldr	r0, .L117+16
	ldr	ip, [r4, #16]
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r6, [r4, #20]
	ldr	r0, [r0]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	mov	r1, r3
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L115
	ldr	r0, .L117+20
	ldr	r7, [r4, #20]
	ldr	r3, [r0, #4]
	ldr	r6, [r4, #16]
	ldm	r4, {ip, lr}
	ldr	r2, [r0, #16]
	mov	r1, r3
	ldr	r0, [r0]
	stm	sp, {ip, lr}
	str	r7, [sp, #12]
	str	r6, [sp, #8]
	mov	lr, pc
	bx	r5
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	player
	.word	enemy1
	.word	collision
	.word	enemy2
	.word	enemy3
	.word	enemy4
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
	ldr	r3, .L121
	push	{r4, lr}
	ldr	r2, .L121+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L122:
	.align	2
.L121:
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
	mov	r4, r0
	mov	fp, r1
	sub	sp, sp, #68
	add	r3, r1, #8
	sub	ip, r0, #8
	str	r3, [sp, #60]
	add	r0, r0, #8
	sub	r2, r1, #8
	add	r3, sp, #24
	str	r1, [sp, #36]
	str	r1, [sp, #44]
	str	r4, [sp, #48]
	str	r4, [sp, #56]
	str	ip, [sp, #32]
	str	r0, [sp, #40]
	str	r2, [sp, #52]
	ldr	r9, .L149
	ldr	r5, .L149+4
	ldr	r8, .L149+8
	ldr	r7, .L149+12
	ldr	r6, .L149+16
	ldr	r10, .L149+20
	str	r3, [sp, #20]
.L131:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	mov	r2, r3
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r0, r4
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #512
	ldrbne	r3, [r9, #44]	@ zero_extendqisi2
	ldrne	r1, .L149+24
	lslne	r3, r3, #3
	strhne	r2, [r1, r3]	@ movhi
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	ldr	r1, [r8]
	mov	r2, r3
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r0, r4
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #512
	ldrbne	r3, [r8, #44]	@ zero_extendqisi2
	ldrne	r1, .L149+24
	lslne	r3, r3, #3
	strhne	r2, [r1, r3]	@ movhi
	mov	r3, #8
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r7, #4]
	ldr	r1, [r7]
	mov	r2, r3
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r0, r4
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #512
	ldrbne	r3, [r7, #44]	@ zero_extendqisi2
	ldrne	r1, .L149+24
	lslne	r3, r3, #3
	strhne	r2, [r1, r3]	@ movhi
	mov	r3, #8
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r6, #4]
	ldr	r1, [r6]
	mov	r2, r3
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r0, r4
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #512
	ldrbne	r3, [r6, #44]	@ zero_extendqisi2
	ldrne	r1, .L149+24
	lslne	r3, r3, #3
	strhne	r2, [r1, r3]	@ movhi
	mov	r0, r4
	mov	r1, fp
	ldr	r3, .L149+28
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L148
.L128:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r10, {ip, lr}
	mov	r1, fp
	mov	r0, r4
	mov	r2, r3
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L123
	ldr	r3, [sp, #20]
	add	r2, sp, #56
	cmp	r3, r2
	beq	.L123
	add	r4, r3, #8
	add	r3, r3, #8
	ldm	r4, {r4, fp}
	str	r3, [sp, #20]
	b	.L131
.L148:
	mov	r1, fp
	mov	r0, r4
	ldr	r3, .L149+32
	mov	lr, pc
	bx	r3
	b	.L128
.L123:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	enemy1
	.word	collision
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	shadowOAM
	.word	checkCollisionSoftBlock
	.word	destroySoftBlockAt
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
	ldr	r3, .L156
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #8]
	cmp	r2, #0
	ble	.L154
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #8]
	bxne	lr
	mov	r2, #15
	ldm	r3, {r0, r1}
	str	r2, [r3, #12]
	b	handleExplosion
.L154:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	streq	r2, [r3, #16]
	bx	lr
.L157:
	.align	2
.L156:
	.word	.LANCHOR1
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
	ldr	r3, .L162
	add	r2, r3, #1024
.L159:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L159
	bx	lr
.L163:
	.align	2
.L162:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	bomb
	.comm	player,48,4
	.comm	enemy4,48,4
	.comm	enemy3,48,4
	.comm	enemy2,48,4
	.comm	enemy1,48,4
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.20, %object
	.size	CSWTCH.20, 12
CSWTCH.20:
	.word	4
	.word	2
	.word	6
	.data
	.align	2
	.set	.LANCHOR1,. + 0
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
	.set	.LANCHOR0,. + 0
	.type	changeTimer.4635, %object
	.size	changeTimer.4635, 4
changeTimer.4635:
	.space	4
	.type	enemyDelayCounter.4654, %object
	.size	enemyDelayCounter.4654, 4
enemyDelayCounter.4654:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
