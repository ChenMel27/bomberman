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
	.type	updateTimer.part.0, %function
updateTimer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r2, .L4
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, r0
	str	r3, [r2]
	movle	r2, #5
	ldr	r1, .L4+4
	ldrle	r3, .L4+8
	str	r0, [r1]
	strle	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	timer
	.word	frameCounter
	.word	state
	.size	updateTimer.part.0, .-updateTimer.part.0
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
	mov	r1, #67108864
	mov	r3, #4864
	mov	r2, #5120
	ldr	r0, .L8+4
	ldr	r4, .L8+8
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #2048
	strh	r0, [r1, #8]	@ movhi
	ldr	r2, .L8+12
	mov	r0, #3
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	mov	r3, #1568
	mov	r0, #3
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+44
	ldr	r1, .L8+48
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+52
	ldr	r1, .L8+56
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+60
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r3, .L8+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+72
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+76
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L8+80
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
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
	ldr	r3, .L11
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	ip, .L17
	mov	r3, #2048
	ldr	r5, .L17+4
	mov	r0, #3
	ldr	r2, .L17+8
	ldr	r1, .L17+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L17+16
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L16
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	mov	r0, r4
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	mov	r0, #60
	ldr	r3, .L17+28
	ldr	r1, .L17+32
	str	r2, [r3]
	ldr	r2, .L17+36
	ldr	r3, .L17+40
	str	r4, [r2]
	str	r5, [r3]
	str	r0, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	state
	.word	DMANow
	.word	100704256
	.word	bgMap
	.word	.LANCHOR0
	.word	initializeEnemies
	.word	initializePlayer
	.word	.LANCHOR1
	.word	timer
	.word	round
	.word	frameCounter
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
	ldr	r2, .L26
	ldr	r1, .L26+4
	ldr	r4, .L26+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L26+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L25
.L19:
	pop	{r4, lr}
	bx	lr
.L25:
	pop	{r4, lr}
	b	goToGameOne
.L27:
	.align	2
.L26:
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
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L35+4
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #59
	str	r3, [r2]
	blgt	updateTimer.part.0
.L29:
	ldr	r3, .L35+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r3, .L35+20
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L35+24
	streq	r2, [r3]
.L28:
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	updateGameOne
	.word	frameCounter
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
	mov	r0, #3
	ldr	r4, .L41
	ldr	r2, .L41+4
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+12
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L40
.L38:
	mov	r2, #2
	ldr	r3, .L41+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	mov	lr, #3
	mov	ip, #2
	ldr	r0, .L41+20
	ldr	r1, .L41+24
	ldr	r2, .L41+28
	str	lr, [r0]
	str	r4, [r3, #4]
	mov	r0, #1
	ldr	r3, .L41+32
	str	ip, [r1]
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+36
	mov	lr, pc
	bx	r3
	mov	r1, #60
	ldr	r2, .L41+40
	ldr	r3, .L41+44
	str	r1, [r2]
	str	r4, [r3]
	b	.L38
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	100704256
	.word	bg2Map
	.word	.LANCHOR0
	.word	state
	.word	.LANCHOR1
	.word	round
	.word	playerImmuneToBombs
	.word	initializeEnemies
	.word	initializePlayer
	.word	timer
	.word	frameCounter
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
	ldr	r3, .L50
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r2, .L50+4
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #59
	str	r3, [r2]
	blgt	updateTimer.part.0
.L44:
	ldr	r4, .L50+8
	mov	r1, #17
	mov	r0, #1
	ldr	r2, .L50+12
	mov	lr, pc
	bx	r4
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L50+12
	mov	lr, pc
	bx	r4
	mov	r1, #19
	ldr	r2, .L50+12
	mov	r0, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
	ldr	r3, .L50+28
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #3
	ldreq	r3, .L50+32
	streq	r2, [r3]
.L43:
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	updateGameTwo
	.word	frameCounter
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
	ldr	r3, .L53
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r4, .L68
	ldr	r3, .L68+4
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L68+12
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L56
	ldr	r3, .L68+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L67
	bl	goToGameTwo
.L58:
	mov	r3, #0
	str	r3, [r4]
.L55:
	pop	{r4, lr}
	bx	lr
.L56:
	tst	r3, #4
	beq	.L55
	ldr	r3, .L68+12
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r2, .L68+20
	pop	{r4, lr}
	streq	r3, [r2]
	bx	lr
.L67:
	bl	goToGameOne
	b	.L58
.L69:
	.align	2
.L68:
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
	ldr	r3, .L71
	str	r2, [r3]
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r2, .L79
	ldr	r1, .L79+4
	mov	r3, #2048
	ldr	r5, .L79+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+16
	mov	r1, #17
	mov	r0, #1
	ldr	r2, .L79+20
	mov	lr, pc
	bx	r4
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L79+20
	mov	lr, pc
	bx	r4
	mov	r1, #19
	mov	r0, #1
	ldr	r2, .L79+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L79+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
	ldr	r3, .L79+36
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L79+40
	streq	r3, [r2]
.L73:
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	.align	2
.L79:
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
	push	{r4, r5, r6, lr}
	mov	r0, #3
	ldr	r2, .L90
	ldr	r1, .L90+4
	mov	r3, #2048
	ldr	r5, .L90+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L90+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L90+16
	mov	r1, #17
	mov	r0, #1
	ldr	r2, .L90+20
	mov	lr, pc
	bx	r4
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L90+20
	mov	lr, pc
	bx	r4
	mov	r1, #19
	mov	r0, #1
	ldr	r2, .L90+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L90+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L90+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L90+36
	ldrh	r3, [r3]
	ands	r3, r3, #8
	ldreq	r2, .L90+40
	streq	r3, [r2]
.L84:
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
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
	ldr	r3, .L103
	mov	lr, pc
	bx	r3
	ldr	r9, .L103+4
	ldr	r4, .L103+8
	ldr	r8, .L103+12
	ldr	fp, .L103+16
	ldr	r10, .L103+20
	ldr	r6, .L103+24
	ldr	r7, .L103+28
	ldr	r5, .L103+32
.L101:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r2, [r7, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L93
.L95:
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L94
.L94:
	ldr	r3, .L103+36
	mov	lr, pc
	bx	r3
.L93:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L101
.L96:
	ldr	r3, .L103+40
	mov	lr, pc
	bx	r3
	b	.L93
.L97:
	ldr	r3, .L103+44
	mov	lr, pc
	bx	r3
	b	.L93
.L98:
	ldr	r3, .L103+48
	mov	lr, pc
	bx	r3
	b	.L93
.L100:
	mov	lr, pc
	bx	fp
	b	.L93
.L99:
	mov	lr, pc
	bx	r10
	b	.L93
.L104:
	.align	2
.L103:
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
	.text
	.align	2
	.global	updateTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTimer, %function
updateTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L107
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #59
	str	r3, [r2]
	bxle	lr
	b	updateTimer.part.0
.L108:
	.align	2
.L107:
	.word	frameCounter
	.size	updateTimer, .-updateTimer
	.comm	player,52,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	paused
	.comm	frameCounter,4,4
	.comm	timer,4,4
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
