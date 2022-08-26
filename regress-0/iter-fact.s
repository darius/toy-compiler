	.text
	.align	2
	.globl	Lfact
Lfact:
	or	$2, $0, 1
	or	$11, $0, $4
Lagain.68:
	bne	$11, $0, Ltarget.75
	j	$31
Ltarget.75:
	mul	$10, $2, $11
	subu	$11, $11, 1
	or	$2, $0, $10
	b	Lagain.68
