	.text
	.align	2
	.globl	Lfact
Lfact:
	or	$10, $0, 1
	or	$11, $0, $4
Lagain.88:
	bne	$11, $0, Ltarget.97
Lcon.91:
	or	$2, $0, $10
	j	$31
Ltarget.97:
Lalt.92:
	mul	$10, $10, $11
	subu	$11, $11, 1
	b	Lagain.88
