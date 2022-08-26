	.text
	.align	2
	.globl	Lf
Lf:
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$4, 4($sp)
	jal	Lh
	lw	$31, 0($sp)
	lw	$4, 4($sp)
	addu	$sp, $sp, 8
	addu	$11, $4, 1
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$2, 4($sp)
	or	$4, $0, $11
	jal	Lh
	lw	$31, 0($sp)
	lw	$2, 4($sp)
	addu	$sp, $sp, 8
	or	$11, $0, $2
	or	$4, $0, $2
	or	$5, $0, $11
	b	Lg
