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
	.file	"gameOne.c"
	.text
	.align	2
	.global	updateGameOne
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGameOne, %function
updateGameOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L10
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L1
	ldr	r2, .L10+16
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L9
	ldr	r3, .L10+20
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L10+24
	mov	lr, pc
	bx	r3
.L1:
	pop	{r4, lr}
	bx	lr
.L9:
	ldr	r3, .L10+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	updatePlayer
	.word	updateEnemies
	.word	updateBomb
	.word	checkPlayerEnemyCollision
	.word	lives
	.word	initializePlayer
	.word	initializeEnemies
	.word	goToGameTwo
	.size	updateGameOne, .-updateGameOne
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SCORE:\000"
	.align	2
.LC1:
	.ascii	"LIVES:\000"
	.text
	.align	2
	.global	drawGameOne
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGameOne, %function
drawGameOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r5, .L14+12
	mov	r0, r1
	ldr	r2, .L14+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+20
	ldr	r4, .L14+24
	ldr	r2, [r3]
	mov	r1, #2
	mov	r0, #9
	mov	lr, pc
	bx	r4
	mov	r1, #4
	ldr	r2, .L14+28
	mov	r0, #2
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+32
	mov	r1, #4
	mov	r0, #9
	ldr	r2, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	drawEnemies
	.word	drawPlayer
	.word	drawBomb
	.word	drawText
	.word	.LC0
	.word	score
	.word	drawNumber
	.word	.LC1
	.word	lives
	.size	drawGameOne, .-drawGameOne
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"%d\000"
	.text
	.align	2
	.global	drawSpriteNumber
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpriteNumber, %function
drawSpriteNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #16
	mov	r5, r0
	mov	r4, r1
	ldr	r6, .L22
	ldr	r1, .L22+4
	add	r0, sp, #4
	mov	lr, pc
	bx	r6
	ldrb	lr, [sp, #4]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L16
	lsl	r0, r5, #16
	ldr	r2, .L22+8
	lsr	r0, r0, #16
	ldr	r6, .L22+12
	ldr	r5, .L22+16
	and	r1, r4, #255
	sub	r0, r0, r2
	add	r4, sp, #5
.L18:
	mov	r3, r2
	sub	ip, lr, #48
	strh	r1, [r3], r0	@ movhi
	ldrb	lr, [r4], #1	@ zero_extendqisi2
	and	ip, ip, r5
	and	r3, r3, r6
	cmp	lr, #0
	strh	ip, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L18
.L16:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	sprintf
	.word	.LC2
	.word	shadowOAM+800
	.word	511
	.word	1023
	.size	drawSpriteNumber, .-drawSpriteNumber
	.ident	"GCC: (devkitARM release 53) 9.1.0"
