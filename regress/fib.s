	.text
	.align	2
	.globl	Lfib
Lfib:
	bge	$4, 2, Ltarget.19
Lcon.12:
	or	$2, $0, 1
	j	$31
Ltarget.19:
Lalt.13:
	subu	$11, $4, 1
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$4, 4($sp)
	or	$4, $0, $11
	jal	Lfib
	lw	$31, 0($sp)
	lw	$4, 4($sp)
	addu	$sp, $sp, 8
	or	$11, $0, $2
	subu	$10, $4, 2
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$11, 4($sp)
	or	$4, $0, $10
	jal	Lfib
	lw	$31, 0($sp)
	lw	$11, 4($sp)
	addu	$sp, $sp, 8
	or	$10, $0, $2
	addu	$2, $11, $10
	j	$31
