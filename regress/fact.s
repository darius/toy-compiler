	.text
	.align	2
	.globl	Lfact
Lfact:
	bne	$4, $0, Ltarget.9
Lcon.3:
	or	$2, $0, 1
	j	$31
Ltarget.9:
Lalt.4:
	subu	$11, $4, 1
	subu	$sp, $sp, 8
	sw	$31, 0($sp)
	sw	$4, 4($sp)
	or	$4, $0, $11
	jal	Lfact
	lw	$31, 0($sp)
	lw	$4, 4($sp)
	addu	$sp, $sp, 8
	or	$11, $0, $2
	mul	$2, $4, $11
	j	$31
