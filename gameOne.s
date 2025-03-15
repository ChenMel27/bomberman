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
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L2
	ldr	r2, .L15+16
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L13
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L15+24
	mov	lr, pc
	bx	r3
.L2:
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L14
	pop	{r4, lr}
	bx	lr
.L13:
	ldr	r3, .L15+32
	mov	lr, pc
	bx	r3
	b	.L2
.L14:
	ldr	r3, .L15+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	updatePlayer
	.word	updateEnemies
	.word	updateBomb
	.word	checkPlayerEnemyCollision
	.word	lives
	.word	initializePlayer
	.word	initializeEnemies
	.word	winCondition
	.word	goToLose
	.word	goToGameTwo
	.size	updateGameOne, .-updateGameOne
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SCORE:\000"
	.align	2
.LC1:
	.ascii	"   \000"
	.align	2
.LC2:
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
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L19+8
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+16
	mov	r1, #18
	mov	r0, #1
	ldr	r2, .L19+20
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r1, #18
	mov	r0, #9
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+24
	ldr	r5, .L19+28
	ldr	r2, [r3]
	mov	r1, #18
	mov	r0, #9
	mov	lr, pc
	bx	r5
	mov	r1, #19
	mov	r0, #1
	ldr	r2, .L19+32
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r1, #19
	mov	r0, #9
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+36
	mov	r1, #19
	mov	r0, #9
	ldr	r2, [r3]
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	drawEnemies
	.word	drawPlayer
	.word	.LC1
	.word	drawBomb
	.word	drawText
	.word	.LC0
	.word	score
	.word	drawNumber
	.word	.LC2
	.word	lives
	.size	drawGameOne, .-drawGameOne
	.ident	"GCC: (devkitARM release 53) 9.1.0"
