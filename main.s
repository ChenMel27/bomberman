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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #4864
	mov	r2, #5120
	ldr	r0, .L4+4
	ldr	r4, .L4+8
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #2048
	strh	r0, [r1, #8]	@ movhi
	ldr	r2, .L4+12
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1568
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+52
	ldr	r1, .L4+56
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+60
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r3, .L4+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+72
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+76
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+80
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	7172
	.word	DMANow
	.word	100704256
	.word	bgMap
	.word	tilesetPal
	.word	tilesetTiles
	.word	100679680
	.word	fontTiles
	.word	83886112
	.word	fontPal
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
	ldr	r3, .L7
	str	r2, [r3]
	bx	lr
.L8:
	.align	2
.L7:
	.word	state
	.size	goToStart, .-goToStart
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
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	ip, .L11
	ldr	r2, .L11+4
	ldr	r1, .L11+8
	mov	r3, #2048
	mov	r0, #3
	ldr	r5, .L11+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L11+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r1, .L11+24
	ldr	r3, .L11+28
	str	r4, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	100704256
	.word	bgMap
	.word	DMANow
	.word	initializeEnemies
	.word	initializePlayer
	.word	round
	.word	.LANCHOR0
	.size	goToGameOne, .-goToGameOne
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
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToGameOne
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
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
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
	ldr	r3, .L28+16
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L28+20
	streq	r2, [r3]
.L22:
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	updateGameOne
	.word	drawGameOne
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
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
	push	{r4, lr}
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L32
	ldr	r1, .L32+4
	ldr	r4, .L32+8
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r4, #2
	mov	ip, #3
	ldr	r3, .L32+12
	ldr	r1, .L32+16
	ldr	r2, .L32+20
	str	r0, [r3]
	mov	r0, #1
	ldr	r3, .L32+24
	str	r4, [r2]
	str	ip, [r1]
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+32
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	100704256
	.word	bg2Map
	.word	DMANow
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	round
	.word	initializeEnemies
	.word	initializePlayer
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
	push	{r4, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L34
	ldr	r3, .L40+16
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L40+20
	streq	r2, [r3]
.L34:
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	updateGameTwo
	.word	drawGameTwo
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
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
	ldr	r3, .L43
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r3, .L56
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
	ldr	r2, .L56+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L55
.L46:
	tst	r3, #4
	beq	.L45
	ldr	r3, .L56+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r2, .L56+12
	streq	r3, [r2]
.L45:
	pop	{r4, lr}
	bx	lr
.L55:
	pop	{r4, lr}
	b	goToGameOne
.L57:
	.align	2
.L56:
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
	ldr	r3, .L59
	str	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	r3, .L67
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L67+12
	streq	r3, [r2]
.L61:
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
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
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r9, .L79+4
	ldr	r4, .L79+8
	ldr	r8, .L79+12
	ldr	fp, .L79+16
	ldr	r10, .L79+20
	ldr	r6, .L79+24
	ldr	r7, .L79+28
	ldr	r5, .L79+32
.L77:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r2, [r7, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L70
.L72:
	.word	.L76
	.word	.L75
	.word	.L74
	.word	.L73
	.word	.L71
	.word	.L71
.L71:
	mov	lr, pc
	bx	r10
.L70:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L77
.L73:
	ldr	r3, .L79+36
	mov	lr, pc
	bx	r3
	b	.L70
.L74:
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	b	.L70
.L76:
	mov	lr, pc
	bx	fp
	b	.L70
.L75:
	ldr	r3, .L79+44
	mov	lr, pc
	bx	r3
	b	.L70
.L80:
	.align	2
.L79:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	start
	.word	lose
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	pause
	.word	gameTwo
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
	ldr	r3, .L82
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
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
	.comm	player,52,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	lives
	.global	score
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
