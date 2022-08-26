	.text
	.align	2
	.globl	Lf
Lf:
	subu	$sp, $sp, 4
	sw	$31, 0($sp)
	jal	Lf
	lw	$31, 0($sp)
	addu	$sp, $sp, 4
	or	$4, $0, $2
	b	Lf
