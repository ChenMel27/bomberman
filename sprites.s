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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #1
	mov	ip, #8
	mov	r4, #4
	mov	r0, #0
	mov	r7, #104
	mov	r2, #15
	mov	r5, #136
	mov	r6, #24
	mov	r8, #2
	mov	lr, #3
	ldr	r3, .L8
	str	r0, [r3, #40]
	str	r7, [r3]
	str	r7, [r3, #4]
	str	r1, [r3, #32]
	strb	r1, [r3, #48]
	str	r1, [r3, #24]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r3, #44]
	str	r2, [r3, #28]
	ldr	r3, .L8+4
	str	r2, [r3, #28]
	ldr	r2, .L8+8
	stm	r3, {r5, r6}
	str	r0, [r3, #40]
	str	r1, [r3, #32]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r3, #44]
	str	r1, [r3, #24]
	strb	r8, [r3, #48]
	ldr	r3, .L8+12
	strb	lr, [r2, #48]
	str	lr, [r2, #44]
	str	lr, [r2, #8]
	str	r6, [r2]
	str	r5, [r2, #4]
	str	r0, [r2, #40]
	str	r1, [r2, #32]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	str	r4, [r2, #28]
	str	r1, [r2, #24]
	str	lr, [r2, #12]
	ldr	r2, .L8+16
	str	r5, [r3]
	str	r5, [r3, #4]
	strb	r4, [r3, #48]
	str	lr, [r3, #44]
	str	r4, [r3, #28]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	r0, [r3, #40]
	str	r1, [r3, #32]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #24]
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
	ldr	r4, .L45
	ldr	r8, .L45+4
	ldr	r7, [r4]
	ldr	r6, [r4, #16]
	ldr	r10, [r4, #4]
	ldr	r5, [r4, #20]
	ldrh	r3, [r8]
	add	r6, r7, r6
	add	r5, r10, r5
	tst	r3, #128
	sub	sp, sp, #12
	sub	fp, r6, #1
	sub	r9, r5, #1
	bne	.L11
	cmp	r5, #255
	ble	.L41
.L12:
	mov	r2, #0
	str	r2, [r4, #32]
.L11:
	tst	r3, #64
	bne	.L15
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L42
	mov	r2, #2
	str	r2, [r4, #32]
.L15:
	tst	r3, #16
	bne	.L19
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	cmp	r2, #512
	blt	.L43
	mov	r2, #1
	str	r2, [r4, #32]
.L19:
	tst	r3, #32
	bne	.L23
	ldr	r3, [r4]
	cmp	r3, #0
	bgt	.L44
.L25:
	mov	r3, #3
	str	r3, [r4, #32]
.L23:
	ldr	r3, .L45+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L10
	ldrh	r3, [r8]
	tst	r3, #4
	bne	.L10
	ldr	r3, .L45+12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L10
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
	stm	r3, {r1, r2, ip}
	str	r0, [r3, #16]
.L10:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L42:
	sub	r1, r10, #1
	mov	r0, r7
	ldr	r5, .L45+16
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldr	r1, [sp, #4]
	bne	.L17
.L39:
	mov	r2, #2
	ldrh	r3, [r8]
	str	r2, [r4, #32]
	b	.L15
.L44:
	sub	r7, r7, #1
	mov	r1, r10
	mov	r0, r7
	ldr	r5, .L45+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L25
	mov	r1, r9
	mov	r0, r7
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4]
	subne	r3, r3, #1
	strne	r3, [r4]
	b	.L25
.L41:
	ldr	r3, .L45+16
	mov	r1, r5
	mov	r0, r7
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldr	r3, .L45+16
	bne	.L13
.L38:
	ldrh	r3, [r8]
	b	.L12
.L43:
	mov	r1, r10
	mov	r0, r6
	ldr	r5, .L45+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L21
.L40:
	mov	r2, #1
	ldrh	r3, [r8]
	str	r2, [r4, #32]
	b	.L19
.L17:
	mov	r0, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	subne	r3, r3, #1
	strne	r3, [r4, #4]
	b	.L39
.L13:
	mov	r1, r5
	mov	r0, fp
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #1
	strne	r3, [r4, #4]
	b	.L38
.L21:
	mov	r0, r6
	mov	r1, r9
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, [r4]
	addne	r3, r3, #1
	strne	r3, [r4]
	b	.L40
.L46:
	.align	2
.L45:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L136
	ldr	r3, [r7]
	ldr	r2, .L136+4
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	asr	r4, r3, #31
	add	r2, r2, r3
	rsb	r4, r4, r2, asr #4
	ldr	r6, .L136+8
	rsb	r4, r4, r4, lsl #4
	subs	r4, r3, r4, lsl #1
	str	r3, [r7]
	ldr	r3, [r6, #32]
	beq	.L125
	ldr	r5, .L136+12
.L48:
	ldr	r0, [r6]
	ldr	r8, [r6, #16]
	ldr	r1, [r6, #4]
	ldr	r2, [r6, #20]
	add	r8, r0, r8
	cmp	r3, #0
	sub	r9, r8, #1
	add	r4, r1, r2
	beq	.L127
	cmp	r3, #2
	beq	.L128
	cmp	r3, #1
	sub	r4, r4, #1
	beq	.L129
	cmp	r3, #3
	beq	.L130
.L58:
	ldr	r0, [r5]
	ldr	r6, [r5, #16]
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	add	r6, r0, r6
	cmp	r2, #0
	sub	r8, r6, #1
	add	r4, r1, r3
	beq	.L131
	cmp	r2, #2
	beq	.L132
	cmp	r2, #1
	sub	r4, r4, #1
	beq	.L133
	cmp	r2, #3
	beq	.L134
.L64:
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	cmp	r3, #2
	strle	r3, [r7, #4]
	ble	.L47
	mov	ip, #0
	ldr	r3, .L136+16
	ldr	r1, .L136+20
	ldr	r2, [r3]
	ldr	r0, [r1]
	cmp	r0, r2
	addgt	r2, r2, #1
	str	ip, [r7, #4]
	strgt	r2, [r3]
	bgt	.L71
	sublt	r2, r2, #1
	strlt	r2, [r3]
.L71:
	ldr	r2, [r3, #4]
	ldr	r1, [r1, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	bgt	.L73
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
.L73:
	ldr	r3, .L136+24
	ldr	r2, [r3]
	cmp	r0, r2
	addgt	r2, r2, #1
	strgt	r2, [r3]
	bgt	.L75
	sublt	r2, r2, #1
	strlt	r2, [r3]
.L75:
	ldr	r2, [r3, #4]
	cmp	r1, r2
	addgt	r2, r2, #1
	strgt	r2, [r3, #4]
	bgt	.L47
	sublt	r2, r2, #1
	strlt	r2, [r3, #4]
.L47:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L125:
	bic	r3, r3, #2
	cmp	r3, #1
	ldr	r8, .L136+28
	beq	.L135
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #3
	moveq	r3, #1
	str	r3, [r6, #32]
.L51:
	ldr	r5, .L136+12
	ldr	r3, [r5, #32]
	bic	r3, r3, #2
	cmp	r3, #1
	bne	.L53
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r4, #2
	ldr	r3, [r6, #32]
	str	r4, [r5, #32]
	b	.L48
.L135:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r6, #32]
	b	.L51
.L131:
	mov	r1, r4
	ldr	r6, .L136+32
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L64
	mov	r1, r4
	mov	r0, r8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	addne	r3, r3, #1
	strne	r3, [r5, #4]
	b	.L64
.L127:
	mov	r1, r4
	ldr	r8, .L136+32
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L58
	mov	r1, r4
	mov	r0, r9
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r6, #4]
	addne	r3, r3, #1
	strne	r3, [r6, #4]
	b	.L58
.L53:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	movne	r2, #3
	moveq	r2, #1
	ldr	r3, [r6, #32]
	str	r2, [r5, #32]
	b	.L48
.L129:
	mov	r0, r8
	ldr	r9, .L136+32
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L58
	mov	r1, r4
	mov	r0, r8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r6]
	addne	r3, r3, #1
	strne	r3, [r6]
	b	.L58
.L132:
	sub	r4, r1, #1
	mov	r1, r4
	ldr	r6, .L136+32
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L64
	mov	r1, r4
	mov	r0, r8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r3, [r5, #4]
	subne	r3, r3, #1
	strne	r3, [r5, #4]
	b	.L64
.L128:
	sub	r4, r1, #1
	mov	r1, r4
	ldr	r8, .L136+32
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L58
	mov	r1, r4
	mov	r0, r9
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r6, #4]
	subne	r3, r3, #1
	strne	r3, [r6, #4]
	b	.L58
.L133:
	mov	r0, r6
	ldr	r8, .L136+32
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L64
	mov	r1, r4
	mov	r0, r6
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r5]
	addne	r3, r3, #1
	strne	r3, [r5]
	b	.L64
.L130:
	sub	r8, r0, #1
	mov	r0, r8
	ldr	r9, .L136+32
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L58
	mov	r1, r4
	mov	r0, r8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r6]
	subne	r3, r3, #1
	strne	r3, [r6]
	b	.L58
.L134:
	sub	r6, r0, #1
	mov	r0, r6
	ldr	r8, .L136+32
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L64
	mov	r1, r4
	mov	r0, r6
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r5]
	subne	r3, r3, #1
	strne	r3, [r5]
	b	.L64
.L137:
	.align	2
.L136:
	.word	.LANCHOR1
	.word	-2004318071
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	player
	.word	enemy4
	.word	rand
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
	ldr	r1, .L148
	str	lr, [sp, #-4]!
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L139
	mov	ip, #13
	ldr	r0, [r1]
	ldr	r3, .L148+4
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r0, r0, #23
	add	r1, r3, r2, lsl #3
	lsr	r0, r0, #23
	lsl	r2, r2, #3
	strh	r0, [r1, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L140:
	ldr	r1, .L148+8
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L141
	mov	ip, #13
	ldr	r0, [r1]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r1, r0, #23
	lsr	r1, r1, #23
	add	r0, r3, r2, lsl #3
	lsl	r2, r2, #3
	strh	r1, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
.L142:
	ldr	r1, .L148+12
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L143
	mov	ip, #14
	ldr	r0, [r1]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r1, r0, #23
	lsr	r1, r1, #23
	add	r0, r3, r2, lsl #3
	lsl	r2, r2, #3
	strh	r1, [r0, #2]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
.L144:
	ldr	r1, .L148+16
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	beq	.L145
	mov	ip, #14
	ldr	r0, [r1]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	lsl	r1, r0, #23
	lsr	r1, r1, #23
	add	r0, r3, r2, lsl #3
	lsl	r2, r2, #3
	strh	lr, [r3, r2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L139:
	mov	r1, #512
	ldr	r3, .L148+4
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L140
.L145:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L143:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L144
.L141:
	mov	r1, #512
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	b	.L142
.L149:
	.align	2
.L148:
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
	ldr	r1, .L154
	ldr	r3, [r1, #32]
	sub	r3, r3, #1
	cmp	r3, #2
	movhi	r0, #0
	str	lr, [sp, #-4]!
	ldrls	r2, .L154+4
	ldrls	r0, [r2, r3, lsl #2]
	ldr	r3, [r1]
	ldrb	r2, [r1, #48]	@ zero_extendqisi2
	ldr	ip, .L154+8
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
.L155:
	.align	2
.L154:
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
	ldr	r4, .L191
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L156
	ldr	r3, [r4, #8]
	cmp	r3, #0
	ble	.L158
	mov	ip, #96
	ldr	r3, [r4]
	ldr	r2, [r4, #20]
	ldr	r0, .L191+4
	ldrb	lr, [r4, #4]	@ zero_extendqisi2
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
.L156:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L158:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	ble	.L156
	mov	lr, #130
	ldr	r0, [r4]
	ldr	r3, [r4, #20]
	ldr	r5, .L191+4
	ldr	r1, [r4, #4]
	lsl	r2, r0, #23
	add	ip, r5, r3, lsl #3
	lsr	r2, r2, #23
	strh	r2, [ip, #2]	@ movhi
	lsl	r3, r3, #3
	and	r2, r1, #255
	ldr	r7, .L191+8
	strh	lr, [ip, #4]	@ movhi
	sub	r0, r0, #8
	strh	r2, [r5, r3]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L186
.L159:
	ldm	r4, {r0, r1}
	ldr	r6, .L191+12
	sub	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L187
	mov	r3, #512
	ldr	r1, [r4, #4]
	strh	r3, [r5, #48]	@ movhi
	ldr	r0, [r4]
.L161:
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L188
.L162:
	ldm	r4, {r0, r1}
	add	r0, r0, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L163
	mov	r2, #131
	ldm	r4, {r0, r1}
	add	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #58]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #56]	@ movhi
	strh	r2, [r5, #60]	@ movhi
.L164:
	sub	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L189
.L165:
	ldm	r4, {r0, r1}
	sub	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L166
	mov	r2, #98
	ldm	r4, {r0, r1}
	sub	r3, r1, #8
	and	r3, r3, #255
	strh	r3, [r5, #64]	@ movhi
	lsl	r3, r0, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #66]	@ movhi
	strh	r2, [r5, #68]	@ movhi
.L167:
	add	r1, r1, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L190
.L168:
	ldm	r4, {r0, r1}
	add	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r3, #512
	strhne	r3, [r5, #72]	@ movhi
	bne	.L156
	mov	r1, #162
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	add	r2, r2, #8
	lsl	r3, r3, #23
	and	r2, r2, #255
	lsr	r3, r3, #23
	strh	r2, [r5, #72]	@ movhi
	strh	r3, [r5, #74]	@ movhi
	strh	r1, [r5, #76]	@ movhi
	b	.L156
.L187:
	mov	r2, #129
	ldm	r4, {r0, r1}
	sub	r3, r0, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r5, #50]	@ movhi
	and	r3, r1, #255
	strh	r3, [r5, #48]	@ movhi
	strh	r2, [r5, #52]	@ movhi
	b	.L161
.L166:
	mov	r3, #512
	ldr	r1, [r4, #4]
	strh	r3, [r5, #64]	@ movhi
	ldr	r0, [r4]
	b	.L167
.L163:
	mov	r3, #512
	ldr	r1, [r4, #4]
	strh	r3, [r5, #56]	@ movhi
	ldr	r0, [r4]
	b	.L164
.L189:
	ldm	r4, {r0, r1}
	ldr	r3, .L191+16
	sub	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L165
.L188:
	ldm	r4, {r0, r1}
	ldr	r3, .L191+16
	add	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L162
.L186:
	ldm	r4, {r0, r1}
	ldr	r3, .L191+16
	sub	r0, r0, #8
	mov	lr, pc
	bx	r3
	b	.L159
.L190:
	ldm	r4, {r0, r1}
	ldr	r3, .L191+16
	add	r1, r1, #8
	mov	lr, pc
	bx	r3
	b	.L168
.L192:
	.align	2
.L191:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L198
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #20
	ldr	r0, .L198+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L198+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L194
.L196:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L194:
	ldr	r0, .L198+12
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
	bne	.L196
	ldr	r0, .L198+16
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
	bne	.L196
	ldr	r0, .L198+20
	add	r6, r4, #16
	ldm	r6, {r6, r7}
	ldm	r4, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
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
.L199:
	.align	2
.L198:
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
	ldr	r3, .L202
	push	{r4, lr}
	ldr	r2, .L202+4
	ldm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L203:
	.align	2
.L202:
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r10, .L241
	sub	sp, sp, #60
	add	r3, r1, #8
	str	r3, [sp, #52]
	ldr	r3, [r10, #24]
	sub	ip, r0, #8
	sub	r2, r1, #8
	add	r0, r0, #8
	cmp	r3, #0
	mov	fp, r1
	str	r1, [sp, #28]
	str	r1, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #48]
	str	ip, [sp, #24]
	str	r0, [sp, #32]
	str	r2, [sp, #44]
	ldr	r9, .L241+4
	ldr	r8, .L241+8
	ldr	r7, .L241+12
	ldr	r6, .L241+16
	add	r5, sp, #16
	bne	.L236
.L206:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L237
.L209:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	bne	.L238
.L212:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L239
.L215:
	mov	r1, fp
	mov	r0, r4
	ldr	r3, .L241+20
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L240
.L217:
	mov	r3, #8
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldm	r6, {ip, lr}
	mov	r2, r3
	stm	sp, {ip, lr}
	mov	r1, fp
	mov	r0, r4
	ldr	ip, .L241+24
	mov	lr, pc
	bx	ip
	add	r3, sp, #48
	cmp	r5, r3
	beq	.L204
	ldr	r3, [r10, #24]
	add	r4, r5, #8
	cmp	r3, #0
	ldm	r4, {r4, fp}
	add	r5, r5, #8
	beq	.L206
.L236:
	mov	r3, #8
	add	ip, r10, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r10, #4]
	ldr	r1, [r10]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	mov	r1, fp
	mov	r0, r4
	ldr	ip, .L241+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L206
	mov	r1, #512
	mov	r2, #0
	ldrb	r3, [r10, #48]	@ zero_extendqisi2
	ldr	r0, .L241+28
	lsl	r3, r3, #3
	strh	r1, [r0, r3]	@ movhi
	ldr	r3, [r9, #24]
	cmp	r3, #0
	str	r2, [r10, #24]
	beq	.L209
.L237:
	mov	r3, #8
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	mov	r1, fp
	mov	r0, r4
	ldr	ip, .L241+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L209
	mov	r1, #512
	mov	r2, #0
	ldrb	r3, [r9, #48]	@ zero_extendqisi2
	ldr	r0, .L241+28
	lsl	r3, r3, #3
	strh	r1, [r0, r3]	@ movhi
	ldr	r3, [r8, #24]
	cmp	r3, #0
	str	r2, [r9, #24]
	beq	.L212
.L238:
	mov	r3, #8
	add	ip, r8, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r8, #4]
	ldr	r1, [r8]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	mov	r1, fp
	mov	r0, r4
	ldr	ip, .L241+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L212
	mov	r1, #512
	mov	r2, #0
	ldrb	r3, [r8, #48]	@ zero_extendqisi2
	ldr	r0, .L241+28
	lsl	r3, r3, #3
	strh	r1, [r0, r3]	@ movhi
	ldr	r3, [r7, #24]
	cmp	r3, #0
	str	r2, [r8, #24]
	beq	.L215
.L239:
	mov	r3, #8
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r7, #4]
	ldr	r1, [r7]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	mov	r1, fp
	mov	r0, r4
	ldr	ip, .L241+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L215
	mov	r1, #512
	mov	r2, #0
	ldrb	r3, [r7, #48]	@ zero_extendqisi2
	ldr	r0, .L241+28
	lsl	r3, r3, #3
	strh	r1, [r0, r3]	@ movhi
	str	r2, [r7, #24]
	b	.L215
.L240:
	mov	r1, fp
	mov	r0, r4
	ldr	r3, .L241+32
	mov	lr, pc
	bx	r3
	b	.L217
.L204:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L242:
	.align	2
.L241:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	checkCollisionDestructableWall
	.word	collision
	.word	shadowOAM
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
	ldr	r3, .L248
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #8]
	cmp	r2, #0
	ble	.L246
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #8]
	bxne	lr
	mov	r2, #20
	ldm	r3, {r0, r1}
	str	r2, [r3, #12]
	b	handleExplosion
.L246:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bxle	lr
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #12]
	bxne	lr
	mov	r0, #512
	ldr	ip, [r3, #20]
	ldr	r1, .L248+4
	lsl	ip, ip, #3
	strh	r0, [r1, ip]	@ movhi
	str	r2, [r3, #16]
	strh	r0, [r1, #48]	@ movhi
	strh	r0, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	bx	lr
.L249:
	.align	2
.L248:
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
	ldr	r3, .L254
	add	r2, r3, #1024
.L251:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L251
	bx	lr
.L255:
	.align	2
.L254:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	bomb
	.comm	player,52,4
	.comm	enemy4,52,4
	.comm	enemy3,52,4
	.comm	enemy2,52,4
	.comm	enemy1,52,4
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
	.set	.LANCHOR0,. + 0
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
	.type	changeTimer.4667, %object
	.size	changeTimer.4667, 4
changeTimer.4667:
	.space	4
	.type	enemyDelayCounter.4676, %object
	.size	enemyDelayCounter.4676, 4
enemyDelayCounter.4676:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
