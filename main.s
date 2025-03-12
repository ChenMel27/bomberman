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
	.file	"main.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameOne.part.0, %function
gameOne.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L4
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L4+4
	streq	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	buttons
	.word	state
	.size	gameOne.part.0, .-gameOne.part.0
	.set	gameTwo.part.0,gameOne.part.0
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4608
	mov	r1, #5120
	ldr	r4, .L8+4
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #2048
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+56
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L8+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	DMANow
	.word	100704256
	.word	bgMap
	.word	tilesetPal
	.word	tilesetTiles
	.word	100728832
	.word	spriteTiles
	.word	83886592
	.word	spritePal
	.word	initializePlayer
	.word	initializeEnemies
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L11
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L19+8
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L19+12
	streq	r2, [r3]
.L13:
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGameOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameOne, %function
goToGameOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L22
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	state
	.size	goToGameOne, .-goToGameOne
	.align	2
	.global	gameOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameOne, %function
gameOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+12
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	gameOne.part.0
.L24:
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	updateGameOne
	.word	drawGameOne
	.word	waitForVBlank
	.word	oldButtons
	.size	gameOne, .-gameOne
	.align	2
	.global	goToGameTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameTwo, %function
goToGameTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L30
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	state
	.size	goToGameTwo, .-goToGameTwo
	.align	2
	.global	gameTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameTwo, %function
gameTwo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	gameTwo.part.0
.L35:
	.align	2
.L34:
	.word	oldButtons
	.size	gameTwo, .-gameTwo
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L37
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L40
	mov	r2, #1
	ldr	r3, .L49+12
	str	r2, [r3]
.L39:
	pop	{r4, lr}
	bx	lr
.L40:
	tst	r3, #4
	beq	.L39
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r2, .L49+12
	pop	{r4, lr}
	streq	r3, [r2]
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	ldr	r3, .L52
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L60
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L60+12
	streq	r3, [r2]
.L54:
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	ldr	r4, .L75+4
	ldr	r9, .L75+8
	ldr	r8, .L75+12
	ldr	fp, .L75+16
	ldr	r10, .L75+20
	ldr	r6, .L75+24
	ldr	r7, .L75+28
	ldr	r5, .L75+32
.L70:
	ldrh	r2, [r4]
	strh	r2, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r1, [r7, #48]
	strh	r1, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L63
.L65:
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L64
	.word	.L64
.L64:
	mov	lr, pc
	bx	r10
.L63:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L70
.L66:
	ldr	r3, .L75+36
	mov	lr, pc
	bx	r3
	b	.L63
.L67:
	tst	r2, #8
	beq	.L63
	ldr	r3, .L75+40
	mov	lr, pc
	bx	r3
	b	.L63
.L69:
	mov	lr, pc
	bx	fp
	b	.L63
.L68:
	ldr	r3, .L75+44
	mov	lr, pc
	bx	r3
	b	.L63
.L76:
	.align	2
.L75:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	lose
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	pause
	.word	gameTwo.part.0
	.word	gameOne
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L78
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.align	2
	.global	colorAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	colorAt, %function
colorAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L82
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	bx	lr
.L83:
	.align	2
.L82:
	.word	collisionMapBitmap
	.size	colorAt, .-colorAt
	.comm	player,52,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	lives,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
