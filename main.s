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
	ldr	ip, .L13
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L13+4
	ldr	r1, .L13+8
	ldr	r5, .L13+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L13+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L12
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	mov	r0, r4
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	mov	r1, #3
	ldr	r2, .L13+28
	ldr	r3, .L13+32
	str	r1, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	state
	.word	100704256
	.word	bgMap
	.word	DMANow
	.word	.LANCHOR0
	.word	initializeEnemies
	.word	initializePlayer
	.word	.LANCHOR1
	.word	round
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
	mov	r3, #2048
	push	{r4, lr}
	mov	r0, #3
	ldr	r2, .L22
	ldr	r1, .L22+4
	ldr	r4, .L22+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r3, .L22+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
.L15:
	pop	{r4, lr}
	bx	lr
.L21:
	pop	{r4, lr}
	b	goToGameOne
.L23:
	.align	2
.L22:
	.word	100704256
	.word	startMap
	.word	DMANow
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
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
	ldr	r3, .L30+16
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L30+20
	streq	r2, [r3]
.L24:
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	mov	r3, #2048
	push	{r4, lr}
	ldr	r2, .L36
	mov	r0, #3
	ldr	r1, .L36+4
	ldr	r4, .L36+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L36+12
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L35
.L33:
	mov	r2, #2
	ldr	r3, .L36+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	mov	r4, #3
	mov	lr, #2
	ldr	r0, .L36+20
	ldr	ip, .L36+24
	ldr	r1, .L36+28
	str	r3, [r2, #4]
	str	r4, [r0]
	ldr	r2, .L36+32
	mov	r0, #1
	str	r3, [r1]
	str	lr, [ip]
	mov	lr, pc
	bx	r2
	ldr	r3, .L36+36
	mov	lr, pc
	bx	r3
	b	.L33
.L37:
	.align	2
.L36:
	.word	100704256
	.word	bg2Map
	.word	DMANow
	.word	.LANCHOR0
	.word	state
	.word	.LANCHOR1
	.word	round
	.word	playerImmuneToBombs
	.word	initializeEnemies
	.word	initializePlayer
	.size	goToGameTwo, .-goToGameTwo
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"          \000"
	.text
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+4
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L44+8
	mov	lr, pc
	bx	r4
	mov	r1, #19
	ldr	r2, .L44+8
	mov	r0, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
	ldr	r3, .L44+24
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L44+28
	streq	r2, [r3]
.L38:
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	updateGameTwo
	.word	drawText
	.word	.LC0
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
	ldr	r3, .L47
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
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
	mov	r2, #1
	push	{r4, lr}
	ldr	r4, .L62
	ldr	r3, .L62+4
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r2, .L62+12
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L50
	ldr	r3, .L62+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L61
	bl	goToGameTwo
.L52:
	mov	r3, #0
	str	r3, [r4]
.L49:
	pop	{r4, lr}
	bx	lr
.L50:
	tst	r3, #4
	beq	.L49
	ldr	r3, .L62+12
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r2, .L62+20
	pop	{r4, lr}
	streq	r3, [r2]
	bx	lr
.L61:
	bl	goToGameOne
	b	.L52
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	round
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
	ldr	r3, .L65
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
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
	push	{r4, r5, r6, lr}
	mov	r0, #3
	ldr	r2, .L73
	ldr	r1, .L73+4
	mov	r3, #2048
	ldr	r4, .L73+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L73+16
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L73+20
	mov	lr, pc
	bx	r5
	mov	r1, #19
	mov	r0, #1
	ldr	r2, .L73+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L73+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L73+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L73+36
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L73+40
	streq	r3, [r2]
.L67:
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	100704256
	.word	loserMap
	.word	DMANow
	.word	hideSprites
	.word	drawText
	.word	.LC0
	.word	waitForVBlank
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	state
	.size	lose, .-lose
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
	ldr	r3, .L76
	str	r2, [r3]
	bx	lr
.L77:
	.align	2
.L76:
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
	push	{r4, r5, r6, lr}
	mov	r0, #3
	ldr	r2, .L84
	ldr	r1, .L84+4
	mov	r3, #2048
	ldr	r4, .L84+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L84+16
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L84+20
	mov	lr, pc
	bx	r5
	mov	r1, #19
	mov	r0, #1
	ldr	r2, .L84+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L84+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L78
	ldr	r3, .L84+36
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L84+40
	streq	r3, [r2]
.L78:
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	100704256
	.word	winnerMap
	.word	DMANow
	.word	hideSprites
	.word	drawText
	.word	.LC0
	.word	waitForVBlank
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	state
	.size	win, .-win
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
	ldr	r3, .L97
	mov	lr, pc
	bx	r3
	ldr	r9, .L97+4
	ldr	r4, .L97+8
	ldr	r8, .L97+12
	ldr	fp, .L97+16
	ldr	r10, .L97+20
	ldr	r6, .L97+24
	ldr	r7, .L97+28
	ldr	r5, .L97+32
.L95:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r2, [r7, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L87
.L89:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L88
.L88:
	ldr	r3, .L97+36
	mov	lr, pc
	bx	r3
.L87:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L95
.L90:
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	b	.L87
.L91:
	ldr	r3, .L97+44
	mov	lr, pc
	bx	r3
	b	.L87
.L92:
	ldr	r3, .L97+48
	mov	lr, pc
	bx	r3
	b	.L87
.L94:
	mov	lr, pc
	bx	fp
	b	.L87
.L93:
	mov	lr, pc
	bx	r10
	b	.L87
.L98:
	.align	2
.L97:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	start
	.word	gameOne
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	lose
	.word	win
	.word	pause
	.word	gameTwo
	.size	main, .-main
	.comm	player,52,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	paused
	.global	lives
	.global	score
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	paused, %object
	.size	paused, 4
paused:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
