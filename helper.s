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
	ldr	r2, .L20
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bls	.L18
	ldr	r0, .L20+4
	bx	lr
.L18:
	cmp	r1, #0
	movlt	r1, r3
	ldr	r3, .L20+8
	ldr	r3, [r3]
	asr	r1, r1, #3
	cmp	r3, #1
	add	r0, r0, r1, lsl #5
	beq	.L19
	cmp	r3, #2
	ldreq	r3, .L20+12
	lsleq	r0, r0, #1
	ldrheq	r0, [r3, r0]
	bx	lr
.L19:
	ldr	r3, .L20+16
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L21:
	.align	2
.L20:
	.word	262
	.word	65535
	.word	round
	.word	bg2Map
	.word	bgMap
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
	add	r3, r0, #7
	movge	ip, r0
	movlt	ip, r3
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L52
	cmp	ip, #255
	add	r2, r1, #7
	movls	r6, #0
	movhi	r6, #1
	cmp	r2, lr
	movls	lr, #0
	movhi	lr, #1
	cmp	r1, #0
	movge	r4, r1
	movlt	r4, r2
	orrs	r5, r6, lr
	asr	ip, ip, #3
	mov	r5, #0
	asr	r7, r4, #3
	beq	.L44
.L23:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r4, #0
	movhi	r4, #1
	orrs	r0, r4, lr
	asr	r3, r3, #3
	beq	.L45
.L27:
	ldr	r0, .L52
	cmp	r2, #0
	add	lr, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	lr, r0
	movls	r2, #0
	movhi	r2, #1
	orrs	r0, r6, r2
	asr	r1, r1, #3
	beq	.L46
.L30:
	orrs	r2, r4, r2
	movne	r0, #0
	beq	.L47
.L22:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L45:
	ldr	r0, .L52+4
	ldr	lr, [r0]
	cmp	lr, #1
	add	r0, r3, r7, lsl #5
	beq	.L48
	cmp	lr, #2
	bne	.L27
	ldr	lr, .L52+8
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
.L29:
	cmp	r0, #1
	bne	.L27
	b	.L22
.L46:
	ldr	r0, .L52+4
	ldr	r0, [r0]
	cmp	r0, #1
	add	ip, ip, r1, lsl #5
	beq	.L49
	cmp	r0, #2
	bne	.L30
	ldr	r0, .L52+8
	lsl	ip, ip, #1
	ldrh	r0, [r0, ip]
.L32:
	cmp	r0, #1
	beq	.L22
	orrs	r2, r4, r2
	movne	r0, #0
	bne	.L22
.L47:
	ldr	r2, .L52+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L50
	cmp	r2, #2
	ldreq	r3, .L52+8
	lsleq	r1, r1, #1
	ldrheq	r5, [r3, r1]
.L34:
	sub	r3, r5, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L44:
	ldr	r4, .L52+4
	ldr	r4, [r4]
	cmp	r4, #1
	add	r8, ip, r7, lsl #5
	beq	.L51
	cmp	r4, #2
	bne	.L23
	ldr	r4, .L52+8
	lsl	r8, r8, #1
	ldrh	r4, [r4, r8]
.L25:
	cmp	r4, #1
	moveq	r0, r4
	bne	.L23
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L51:
	ldr	r4, .L52+12
	lsl	r8, r8, #1
	ldrh	r4, [r4, r8]
	b	.L25
.L48:
	ldr	lr, .L52+12
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	b	.L29
.L49:
	ldr	r0, .L52+12
	lsl	ip, ip, #1
	ldrh	r0, [r0, ip]
	b	.L32
.L50:
	ldr	r3, .L52+12
	lsl	r1, r1, #1
	ldrh	r5, [r3, r1]
	b	.L34
.L53:
	.align	2
.L52:
	.word	262
	.word	round
	.word	bg2Map
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
	cmp	r0, #0
	add	r3, r0, #7
	push	{r4, r5, r6, r7, r8, lr}
	movge	lr, r0
	movlt	lr, r3
	ldr	ip, .L83
	cmp	lr, #255
	add	r2, r1, #7
	movls	r5, #0
	movhi	r5, #1
	cmp	r2, ip
	movls	ip, #0
	movhi	ip, #1
	cmp	r1, #0
	movge	r4, r1
	movlt	r4, r2
	orrs	r6, r5, ip
	asr	lr, lr, #3
	asr	r6, r4, #3
	mov	r4, #0
	beq	.L75
.L55:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r0, #0
	movhi	r0, #1
	orrs	ip, r0, ip
	asr	r3, r3, #3
	beq	.L76
.L59:
	ldr	ip, .L83
	cmp	r2, #0
	add	r6, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r6, ip
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r5, r2
	asr	r1, r1, #3
	beq	.L77
.L62:
	orrs	r2, r0, r2
	movne	r0, #0
	beq	.L78
.L54:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	ldr	ip, .L83+4
	ldr	r7, [ip]
	cmp	r7, #1
	add	ip, r3, r6, lsl #5
	beq	.L79
	cmp	r7, #2
	bne	.L59
	ldr	r6, .L83+8
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
.L61:
	cmp	ip, #3
	bne	.L59
	b	.L69
.L77:
	ldr	ip, .L83+4
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L80
	cmp	ip, #2
	bne	.L62
	ldr	ip, .L83+8
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L64:
	cmp	ip, #3
	beq	.L69
	orrs	r2, r0, r2
	movne	r0, #0
	bne	.L54
.L78:
	ldr	r2, .L83+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L81
	cmp	r2, #2
	ldreq	r3, .L83+8
	lsleq	r1, r1, #1
	ldrheq	r4, [r3, r1]
.L66:
	sub	r3, r4, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L75:
	ldr	r7, .L83+4
	ldr	r7, [r7]
	cmp	r7, #1
	add	r8, lr, r6, lsl #5
	beq	.L82
	cmp	r7, #2
	bne	.L55
	ldr	r7, .L83+8
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
.L57:
	cmp	r7, #3
	bne	.L55
.L69:
	mov	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L82:
	ldr	r7, .L83+12
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
	b	.L57
.L79:
	ldr	r6, .L83+12
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
	b	.L61
.L80:
	ldr	ip, .L83+12
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L64
.L81:
	ldr	r3, .L83+12
	lsl	r1, r1, #1
	ldrh	r4, [r3, r1]
	b	.L66
.L84:
	.align	2
.L83:
	.word	262
	.word	round
	.word	bg2Map
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
	cmp	r0, #0
	add	r3, r0, #7
	push	{r4, r5, r6, r7, r8, lr}
	movge	lr, r0
	movlt	lr, r3
	ldr	ip, .L114
	cmp	lr, #255
	add	r2, r1, #7
	movls	r5, #0
	movhi	r5, #1
	cmp	r2, ip
	movls	ip, #0
	movhi	ip, #1
	cmp	r1, #0
	movge	r4, r1
	movlt	r4, r2
	orrs	r6, r5, ip
	asr	lr, lr, #3
	asr	r6, r4, #3
	mov	r4, #0
	beq	.L106
.L86:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r0, #0
	movhi	r0, #1
	orrs	ip, r0, ip
	asr	r3, r3, #3
	beq	.L107
.L90:
	ldr	ip, .L114
	cmp	r2, #0
	add	r6, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r6, ip
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r5, r2
	asr	r1, r1, #3
	beq	.L108
.L93:
	orrs	r2, r0, r2
	movne	r0, #0
	beq	.L109
.L85:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	ldr	ip, .L114+4
	ldr	r7, [ip]
	cmp	r7, #1
	add	ip, r3, r6, lsl #5
	beq	.L110
	cmp	r7, #2
	bne	.L90
	ldr	r6, .L114+8
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
.L92:
	cmp	ip, #4
	bne	.L90
	b	.L100
.L108:
	ldr	ip, .L114+4
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L111
	cmp	ip, #2
	bne	.L93
	ldr	ip, .L114+8
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L95:
	cmp	ip, #4
	beq	.L100
	orrs	r2, r0, r2
	movne	r0, #0
	bne	.L85
.L109:
	ldr	r2, .L114+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L112
	cmp	r2, #2
	ldreq	r3, .L114+8
	lsleq	r1, r1, #1
	ldrheq	r4, [r3, r1]
.L97:
	sub	r3, r4, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L106:
	ldr	r7, .L114+4
	ldr	r7, [r7]
	cmp	r7, #1
	add	r8, lr, r6, lsl #5
	beq	.L113
	cmp	r7, #2
	bne	.L86
	ldr	r7, .L114+8
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
.L88:
	cmp	r7, #4
	bne	.L86
.L100:
	mov	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L113:
	ldr	r7, .L114+12
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
	b	.L88
.L110:
	ldr	r6, .L114+12
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
	b	.L92
.L111:
	ldr	ip, .L114+12
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L95
.L112:
	ldr	r3, .L114+12
	lsl	r1, r1, #1
	ldrh	r4, [r3, r1]
	b	.L97
.L115:
	.align	2
.L114:
	.word	262
	.word	round
	.word	bg2Map
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
	mov	r3, r0
	ldr	r2, .L152
	ldr	r0, .L152+4
	ldr	ip, .L152+8
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r2, [r2, #24]
	ldr	lr, [r0, #24]
	ldr	r0, .L152+12
	ldr	ip, [ip, #24]
	orr	r2, r2, lr
	ldr	r0, [r0, #24]
	orr	r2, r2, ip
	orrs	r2, r2, r0
	moveq	r5, #1
	movne	r5, #0
	add	r2, r3, #7
	cmp	r3, #0
	movge	lr, r3
	movlt	lr, r2
	ldr	r4, .L152+16
	cmp	lr, #255
	add	ip, r1, #7
	movls	r7, #0
	movhi	r7, #1
	cmp	ip, r4
	movls	r4, #0
	movhi	r4, #1
	cmp	r1, #0
	movge	r6, r1
	movlt	r6, ip
	orrs	r0, r7, r4
	asr	r9, r6, #3
	mov	r0, r5
	mov	r6, #0
	asr	lr, lr, #3
	beq	.L144
.L117:
	cmp	r2, #0
	addlt	r3, r3, #14
	movge	r3, r2
	cmp	r3, #255
	movls	r8, #0
	movhi	r8, #1
	orrs	r2, r8, r4
	asr	r3, r3, #3
	beq	.L145
.L121:
	ldr	r2, .L152+16
	cmp	ip, #0
	add	r4, r1, #14
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r4, r2
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r7, r2
	asr	r1, r1, #3
	beq	.L146
.L124:
	orrs	r2, r8, r2
	movne	r0, #0
	beq	.L147
.L116:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L145:
	ldr	r2, .L152+20
	ldr	r4, [r2]
	cmp	r4, #1
	add	r2, r3, r9, lsl #5
	beq	.L148
	cmp	r4, #2
	bne	.L121
	ldr	r4, .L152+24
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
.L123:
	cmp	r2, #2
	bne	.L121
	b	.L116
.L146:
	ldr	ip, .L152+20
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L149
	cmp	ip, #2
	bne	.L124
	ldr	ip, .L152+24
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L126:
	cmp	ip, #2
	beq	.L116
	orrs	r2, r8, r2
	movne	r0, #0
	bne	.L116
.L147:
	ldr	r2, .L152+20
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L150
	cmp	r2, #2
	ldreq	r3, .L152+24
	lsleq	r1, r1, #1
	ldrheq	r6, [r3, r1]
.L128:
	cmp	r6, #2
	movne	r0, #0
	andeq	r0, r5, #1
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L144:
	ldr	r8, .L152+20
	ldr	r8, [r8]
	cmp	r8, #1
	add	r10, lr, r9, lsl #5
	beq	.L151
	cmp	r8, #2
	bne	.L117
	ldr	r8, .L152+24
	lsl	r10, r10, #1
	ldrh	r8, [r8, r10]
.L119:
	cmp	r8, #2
	bne	.L117
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L151:
	ldr	r8, .L152+28
	lsl	r10, r10, #1
	ldrh	r8, [r8, r10]
	b	.L119
.L148:
	ldr	r4, .L152+28
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
	b	.L123
.L149:
	ldr	ip, .L152+28
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L126
.L150:
	ldr	r3, .L152+28
	lsl	r1, r1, #1
	ldrh	r6, [r3, r1]
	b	.L128
.L153:
	.align	2
.L152:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	262
	.word	round
	.word	bg2Map
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
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	ldr	r3, .L166
	push	{r4, r5, r6, r7, r8, lr}
	add	r5, r1, #7
	cmp	r0, #255
	cmpls	r5, r3
	movhi	ip, #1
	movls	ip, #0
	bls	.L164
.L154:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L164:
	cmp	r1, #0
	movlt	r1, r5
	ldr	r3, .L166+4
	ldr	r3, [r3]
	asr	r4, r0, #3
	asr	r5, r1, #3
	cmp	r3, #1
	add	r3, r4, r5, lsl #5
	beq	.L165
	ldr	r1, .L166+8
	lsl	r0, r3, #1
	ldrh	r6, [r1, r0]
	cmp	r6, #3
	bne	.L154
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r6
	ldr	r2, .L166+12
	ldr	r7, .L166+16
	mov	lr, pc
	bx	r7
	mov	r0, r6
	ldr	r3, .L166+20
	lsl	r2, r5, #12
	add	r5, r3, r5, lsl #12
	add	r4, r5, r4, lsl #3
	add	r1, r2, #4096
.L159:
	sub	r3, r4, #8
.L160:
	strb	r0, [r3], #1
	cmp	r3, r4
	bne	.L160
	add	r2, r2, #512
	cmp	r2, r1
	add	r4, r4, #512
	bne	.L159
	b	.L154
.L165:
	ldr	r1, .L166+24
	lsl	r0, r3, #1
	ldrh	r6, [r1, r0]
	cmp	r6, #3
	bne	.L154
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r6
	ldr	r2, .L166+12
	ldr	r7, .L166+16
	mov	lr, pc
	bx	r7
	mov	r2, r6
	ldr	r3, .L166+28
	lsl	r1, r5, #12
	add	r5, r3, r5, lsl #12
	add	r0, r5, r4, lsl #3
	add	ip, r1, #4096
.L157:
	sub	r3, r0, #8
.L158:
	strb	r2, [r3], #1
	cmp	r3, r0
	bne	.L158
	add	r1, r1, #512
	cmp	r1, ip
	add	r0, r0, #512
	bne	.L157
	b	.L154
.L167:
	.align	2
.L166:
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
	ldrb	ip, [r2]	@ zero_extendqisi2
	cmp	ip, #0
	add	r1, r0, r1, lsl #5
	bxeq	lr
	push	{r4, r5, r6, lr}
	sub	r1, r1, r2
	ldr	r4, .L185
	ldr	lr, .L185+4
	b	.L169
.L170:
	sub	r3, ip, #33
	orr	r3, r3, #4096
	cmp	r5, #25
	sub	r6, ip, #97
	lsl	r3, r3, #16
	bls	.L183
	sub	r3, ip, #39
	orr	r3, r3, #4096
	cmp	r6, #25
	lsl	r3, r3, #16
	bls	.L183
	cmp	ip, #58
	movne	r3, #4096
	moveq	r3, r4
.L171:
	lsl	r0, r0, #1
	strh	r3, [lr, r0]	@ movhi
	ldrb	ip, [r2, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L184
.L169:
	sub	r0, ip, #48
	sub	r3, ip, #33
	orr	r3, r3, #4096
	cmp	r0, #9
	sub	r5, ip, #65
	lsl	r3, r3, #16
	add	r0, r2, r1
	bhi	.L170
.L183:
	lsr	r3, r3, #16
	b	.L171
.L184:
	pop	{r4, r5, r6, lr}
	bx	lr
.L186:
	.align	2
.L185:
	.word	4122
	.word	100720640
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
	ldr	r3, .L189
	ldr	r1, .L189+4
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
.L190:
	.align	2
.L189:
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
	ldr	r3, .L209
	ldr	r2, [r3, #24]
	cmp	r2, #0
	sub	sp, sp, #20
	bne	.L192
.L195:
	ldr	r3, .L209+4
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L206
	ldr	r3, .L209+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L207
.L198:
	ldr	r3, .L209+12
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L208
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L208:
	ldr	r0, .L209+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L209+20
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L192:
	ldr	r0, .L209+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L209+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L195
.L199:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L206:
	ldr	r0, .L209+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L209+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L199
	ldr	r3, .L209+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L198
.L207:
	ldr	r0, .L209+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L209+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L198
	b	.L199
.L210:
	.align	2
.L209:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	collision
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.ident	"GCC: (devkitARM release 53) 9.1.0"
