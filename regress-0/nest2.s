	.text
	.align	2
	.globl	Lm
Lm:
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$4, 4($sp)
	or	$4, $0, $5
	jal	Lh
	lw	$31, 0($sp)
	lw	$4, 4($sp)
	addu	$sp, $sp, 8
	or	$11, $0, $2
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$11, 4($sp)
	or	$5, $0, $4
	jal	Lh
	lw	$31, 0($sp)
	lw	$11, 4($sp)
	addu	$sp, $sp, 8
	or	$10, $0, $2
	addu	$2, $11, $10
	j	$31
