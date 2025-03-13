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
	.file	"gameTwo.c"
	.text
	.align	2
	.global	updateGameTwo
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGameTwo, %function
updateGameTwo:
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
	.word	goToLose
	.size	updateGameTwo, .-updateGameTwo
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score:\000"
	.align	2
.LC1:
	.ascii	"Lives:\000"
	.text
	.align	2
	.global	drawGameTwo
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGameTwo, %function
drawGameTwo:
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
	mov	r1, #10
	ldr	r5, .L14+12
	mov	r0, r1
	ldr	r2, .L14+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+20
	ldr	r4, .L14+24
	ldr	r2, [r3]
	mov	r1, #10
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r1, #20
	ldr	r2, .L14+28
	mov	r0, #10
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+32
	mov	r1, #20
	mov	r0, #60
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
	.size	drawGameTwo, .-drawGameTwo
	.ident	"GCC: (devkitARM release 53) 9.1.0"
