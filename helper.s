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
	beq	.L8
	cmp	r2, #2
	bxne	lr
	cmp	r1, #255
	cmpls	r0, #512
	bcc	.L9
.L6:
	mov	r0, #0
	bx	lr
.L8:
	cmp	r1, #255
	cmpls	r0, #512
	bcs	.L6
	ldr	r3, .L10
	add	r0, r0, r1, lsl #9
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	tst	r3, #253
	movne	r0, #1
	moveq	r0, #0
	bx	lr
.L9:
	ldr	r3, .L10+4
	add	r0, r0, r1, lsl #9
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	subs	r0, r3, #3
	movne	r0, #1
	cmp	r3, #0
	moveq	r0, #0
	bx	lr
.L11:
	.align	2
.L10:
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
	ldr	r2, .L19
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bls	.L17
	ldr	r0, .L19+4
	bx	lr
.L17:
	cmp	r1, #0
	movlt	r1, r3
	ldr	r3, .L19+8
	ldr	r3, [r3]
	asr	r1, r1, #3
	cmp	r3, #1
	add	r0, r0, r1, lsl #5
	beq	.L18
	cmp	r3, #2
	ldreq	r3, .L19+12
	lsleq	r0, r0, #1
	ldrheq	r0, [r3, r0]
	bx	lr
.L18:
	ldr	r3, .L19+16
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	lr, .L51
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
	beq	.L43
.L22:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r4, #0
	movhi	r4, #1
	orrs	r0, r4, lr
	asr	r3, r3, #3
	beq	.L44
.L26:
	ldr	r0, .L51
	cmp	r2, #0
	add	lr, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	lr, r0
	movls	r2, #0
	movhi	r2, #1
	orrs	r0, r6, r2
	asr	r1, r1, #3
	beq	.L45
.L29:
	orrs	r2, r4, r2
	movne	r0, #0
	beq	.L46
.L21:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L44:
	ldr	r0, .L51+4
	ldr	lr, [r0]
	cmp	lr, #1
	add	r0, r3, r7, lsl #5
	beq	.L47
	cmp	lr, #2
	bne	.L26
	ldr	lr, .L51+8
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
.L28:
	cmp	r0, #1
	bne	.L26
	b	.L21
.L45:
	ldr	r0, .L51+4
	ldr	r0, [r0]
	cmp	r0, #1
	add	ip, ip, r1, lsl #5
	beq	.L48
	cmp	r0, #2
	bne	.L29
	ldr	r0, .L51+8
	lsl	ip, ip, #1
	ldrh	r0, [r0, ip]
.L31:
	cmp	r0, #1
	beq	.L21
	orrs	r2, r4, r2
	movne	r0, #0
	bne	.L21
.L46:
	ldr	r2, .L51+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L49
	cmp	r2, #2
	ldreq	r3, .L51+8
	lsleq	r1, r1, #1
	ldrheq	r5, [r3, r1]
.L33:
	sub	r3, r5, #1
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	ldr	r4, .L51+4
	ldr	r4, [r4]
	cmp	r4, #1
	add	r8, ip, r7, lsl #5
	beq	.L50
	cmp	r4, #2
	bne	.L22
	ldr	r4, .L51+8
	lsl	r8, r8, #1
	ldrh	r4, [r4, r8]
.L24:
	cmp	r4, #1
	moveq	r0, r4
	bne	.L22
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L50:
	ldr	r4, .L51+12
	lsl	r8, r8, #1
	ldrh	r4, [r4, r8]
	b	.L24
.L47:
	ldr	lr, .L51+12
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	b	.L28
.L48:
	ldr	r0, .L51+12
	lsl	ip, ip, #1
	ldrh	r0, [r0, ip]
	b	.L31
.L49:
	ldr	r3, .L51+12
	lsl	r1, r1, #1
	ldrh	r5, [r3, r1]
	b	.L33
.L52:
	.align	2
.L51:
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
	ldr	ip, .L82
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
	beq	.L74
.L54:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r0, #0
	movhi	r0, #1
	orrs	ip, r0, ip
	asr	r3, r3, #3
	beq	.L75
.L58:
	ldr	ip, .L82
	cmp	r2, #0
	add	r6, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r6, ip
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r5, r2
	asr	r1, r1, #3
	beq	.L76
.L61:
	orrs	r2, r0, r2
	movne	r0, #0
	beq	.L77
.L53:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L75:
	ldr	ip, .L82+4
	ldr	r7, [ip]
	cmp	r7, #1
	add	ip, r3, r6, lsl #5
	beq	.L78
	cmp	r7, #2
	bne	.L58
	ldr	r6, .L82+8
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
.L60:
	cmp	ip, #3
	bne	.L58
	b	.L68
.L76:
	ldr	ip, .L82+4
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L79
	cmp	ip, #2
	bne	.L61
	ldr	ip, .L82+8
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L63:
	cmp	ip, #3
	beq	.L68
	orrs	r2, r0, r2
	movne	r0, #0
	bne	.L53
.L77:
	ldr	r2, .L82+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L80
	cmp	r2, #2
	ldreq	r3, .L82+8
	lsleq	r1, r1, #1
	ldrheq	r4, [r3, r1]
.L65:
	sub	r3, r4, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L74:
	ldr	r7, .L82+4
	ldr	r7, [r7]
	cmp	r7, #1
	add	r8, lr, r6, lsl #5
	beq	.L81
	cmp	r7, #2
	bne	.L54
	ldr	r7, .L82+8
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
.L56:
	cmp	r7, #3
	bne	.L54
.L68:
	mov	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L81:
	ldr	r7, .L82+12
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
	b	.L56
.L78:
	ldr	r6, .L82+12
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
	b	.L60
.L79:
	ldr	ip, .L82+12
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L63
.L80:
	ldr	r3, .L82+12
	lsl	r1, r1, #1
	ldrh	r4, [r3, r1]
	b	.L65
.L83:
	.align	2
.L82:
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
	ldr	ip, .L113
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
	beq	.L105
.L85:
	cmp	r3, #0
	addlt	r3, r0, #14
	cmp	r3, #255
	movls	r0, #0
	movhi	r0, #1
	orrs	ip, r0, ip
	asr	r3, r3, #3
	beq	.L106
.L89:
	ldr	ip, .L113
	cmp	r2, #0
	add	r6, r1, #14
	addlt	r1, r1, #14
	movge	r1, r2
	cmp	r6, ip
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r5, r2
	asr	r1, r1, #3
	beq	.L107
.L92:
	orrs	r2, r0, r2
	movne	r0, #0
	beq	.L108
.L84:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L106:
	ldr	ip, .L113+4
	ldr	r7, [ip]
	cmp	r7, #1
	add	ip, r3, r6, lsl #5
	beq	.L109
	cmp	r7, #2
	bne	.L89
	ldr	r6, .L113+8
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
.L91:
	cmp	ip, #4
	bne	.L89
	b	.L99
.L107:
	ldr	ip, .L113+4
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L110
	cmp	ip, #2
	bne	.L92
	ldr	ip, .L113+8
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L94:
	cmp	ip, #4
	beq	.L99
	orrs	r2, r0, r2
	movne	r0, #0
	bne	.L84
.L108:
	ldr	r2, .L113+4
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L111
	cmp	r2, #2
	ldreq	r3, .L113+8
	lsleq	r1, r1, #1
	ldrheq	r4, [r3, r1]
.L96:
	sub	r3, r4, #4
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L105:
	ldr	r7, .L113+4
	ldr	r7, [r7]
	cmp	r7, #1
	add	r8, lr, r6, lsl #5
	beq	.L112
	cmp	r7, #2
	bne	.L85
	ldr	r7, .L113+8
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
.L87:
	cmp	r7, #4
	bne	.L85
.L99:
	mov	r0, #1
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L112:
	ldr	r7, .L113+12
	lsl	r8, r8, #1
	ldrh	r7, [r7, r8]
	b	.L87
.L109:
	ldr	r6, .L113+12
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
	b	.L91
.L110:
	ldr	ip, .L113+12
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L94
.L111:
	ldr	r3, .L113+12
	lsl	r1, r1, #1
	ldrh	r4, [r3, r1]
	b	.L96
.L114:
	.align	2
.L113:
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
	ldr	r2, .L151
	ldr	r0, .L151+4
	ldr	ip, .L151+8
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r2, [r2, #24]
	ldr	lr, [r0, #24]
	ldr	r0, .L151+12
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
	ldr	r4, .L151+16
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
	beq	.L143
.L116:
	cmp	r2, #0
	addlt	r3, r3, #14
	movge	r3, r2
	cmp	r3, #255
	movls	r8, #0
	movhi	r8, #1
	orrs	r2, r8, r4
	asr	r3, r3, #3
	beq	.L144
.L120:
	ldr	r2, .L151+16
	cmp	ip, #0
	add	r4, r1, #14
	addlt	r1, r1, #14
	movge	r1, ip
	cmp	r4, r2
	movls	r2, #0
	movhi	r2, #1
	orrs	ip, r7, r2
	asr	r1, r1, #3
	beq	.L145
.L123:
	orrs	r2, r8, r2
	movne	r0, #0
	beq	.L146
.L115:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L144:
	ldr	r2, .L151+20
	ldr	r4, [r2]
	cmp	r4, #1
	add	r2, r3, r9, lsl #5
	beq	.L147
	cmp	r4, #2
	bne	.L120
	ldr	r4, .L151+24
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
.L122:
	cmp	r2, #2
	bne	.L120
	b	.L115
.L145:
	ldr	ip, .L151+20
	ldr	ip, [ip]
	cmp	ip, #1
	add	lr, lr, r1, lsl #5
	beq	.L148
	cmp	ip, #2
	bne	.L123
	ldr	ip, .L151+24
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
.L125:
	cmp	ip, #2
	beq	.L115
	orrs	r2, r8, r2
	movne	r0, #0
	bne	.L115
.L146:
	ldr	r2, .L151+20
	ldr	r2, [r2]
	cmp	r2, #1
	add	r1, r3, r1, lsl #5
	beq	.L149
	cmp	r2, #2
	ldreq	r3, .L151+24
	lsleq	r1, r1, #1
	ldrheq	r6, [r3, r1]
.L127:
	cmp	r6, #2
	movne	r0, #0
	andeq	r0, r5, #1
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L143:
	ldr	r8, .L151+20
	ldr	r8, [r8]
	cmp	r8, #1
	add	r10, lr, r9, lsl #5
	beq	.L150
	cmp	r8, #2
	bne	.L116
	ldr	r8, .L151+24
	lsl	r10, r10, #1
	ldrh	r8, [r8, r10]
.L118:
	cmp	r8, #2
	bne	.L116
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L150:
	ldr	r8, .L151+28
	lsl	r10, r10, #1
	ldrh	r8, [r8, r10]
	b	.L118
.L147:
	ldr	r4, .L151+28
	lsl	r2, r2, #1
	ldrh	r2, [r4, r2]
	b	.L122
.L148:
	ldr	ip, .L151+28
	lsl	lr, lr, #1
	ldrh	ip, [ip, lr]
	b	.L125
.L149:
	ldr	r3, .L151+28
	lsl	r1, r1, #1
	ldrh	r6, [r3, r1]
	b	.L127
.L152:
	.align	2
.L151:
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
	ldr	r3, .L165
	push	{r4, r5, r6, r7, r8, lr}
	add	r5, r1, #7
	cmp	r0, #255
	cmpls	r5, r3
	movhi	ip, #1
	movls	ip, #0
	bls	.L163
.L153:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L163:
	cmp	r1, #0
	movlt	r1, r5
	ldr	r3, .L165+4
	ldr	r3, [r3]
	asr	r4, r0, #3
	asr	r5, r1, #3
	cmp	r3, #1
	add	r3, r4, r5, lsl #5
	beq	.L164
	ldr	r1, .L165+8
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	cmp	r0, #3
	bne	.L153
	strh	ip, [r1, r2]	@ movhi
	mov	r3, #2048
	ldr	r2, .L165+12
	ldr	r6, .L165+16
	mov	lr, pc
	bx	r6
	mov	r2, #2
	ldr	r0, .L165+20
	lsl	r1, r5, #12
	add	r0, r0, r5, lsl #12
	add	r0, r0, r4, lsl #3
	add	ip, r1, #4096
.L158:
	sub	r3, r0, #8
.L159:
	strb	r2, [r3], #1
	cmp	r3, r0
	bne	.L159
	add	r1, r1, #512
	cmp	r1, ip
	add	r0, r0, #512
	bne	.L158
	b	.L153
.L164:
	ldr	r1, .L165+24
	lsl	r0, r3, #1
	ldrh	r6, [r1, r0]
	cmp	r6, #3
	bne	.L153
	strh	ip, [r1, r0]	@ movhi
	mov	r3, #2048
	mov	r0, r6
	ldr	r2, .L165+12
	ldr	r7, .L165+16
	mov	lr, pc
	bx	r7
	mov	r2, r6
	ldr	r3, .L165+28
	lsl	r1, r5, #12
	add	r5, r3, r5, lsl #12
	add	r0, r5, r4, lsl #3
	add	ip, r1, #4096
.L156:
	sub	r3, r0, #8
.L157:
	strb	r2, [r3], #1
	cmp	r3, r0
	bne	.L157
	add	r1, r1, #512
	cmp	r1, ip
	add	r0, r0, #512
	bne	.L156
	b	.L153
.L166:
	.align	2
.L165:
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
	ldr	r4, .L184
	ldr	lr, .L184+4
	b	.L168
.L169:
	sub	r3, ip, #33
	orr	r3, r3, #4096
	cmp	r5, #25
	sub	r6, ip, #97
	lsl	r3, r3, #16
	bls	.L182
	sub	r3, ip, #39
	orr	r3, r3, #4096
	cmp	r6, #25
	lsl	r3, r3, #16
	bls	.L182
	cmp	ip, #58
	movne	r3, #4096
	moveq	r3, r4
.L170:
	lsl	r0, r0, #1
	strh	r3, [lr, r0]	@ movhi
	ldrb	ip, [r2, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L183
.L168:
	sub	r0, ip, #48
	sub	r3, ip, #33
	orr	r3, r3, #4096
	cmp	r0, #9
	sub	r5, ip, #65
	lsl	r3, r3, #16
	add	r0, r2, r1
	bhi	.L169
.L182:
	lsr	r3, r3, #16
	b	.L170
.L183:
	pop	{r4, r5, r6, lr}
	bx	lr
.L185:
	.align	2
.L184:
	.word	4121
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
	ldr	r3, .L188
	ldr	r1, .L188+4
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
.L189:
	.align	2
.L188:
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
	ldr	r3, .L208
	ldr	r2, [r3, #24]
	cmp	r2, #0
	sub	sp, sp, #20
	bne	.L191
.L194:
	ldr	r3, .L208+4
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L205
	ldr	r3, .L208+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L206
.L197:
	ldr	r3, .L208+12
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L207
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L207:
	ldr	r0, .L208+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L208+20
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L191:
	ldr	r0, .L208+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L208+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L194
.L198:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L205:
	ldr	r0, .L208+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L208+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L198
	ldr	r3, .L208+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L197
.L206:
	ldr	r0, .L208+16
	add	r4, r3, #16
	ldm	r4, {r4, r5}
	ldm	r3, {ip, lr}
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	str	r5, [sp, #12]
	ldr	r4, .L208+20
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L197
	b	.L198
.L209:
	.align	2
.L208:
	.word	enemy1
	.word	enemy2
	.word	enemy3
	.word	enemy4
	.word	player
	.word	collision
	.size	checkPlayerEnemyCollision, .-checkPlayerEnemyCollision
	.ident	"GCC: (devkitARM release 53) 9.1.0"
