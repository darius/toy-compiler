	.text
	.align	2
	.globl	Lfoo
Lfoo:
	bne	$4, $0, Ltarget.34
	or	$11, $0, $6
	b	Ljoin.32
Ltarget.34:
	or	$11, $0, $5
Ljoin.32:
	bne	$11, $0, Ltarget.33
	or	$2, $0, 137
	j	$31
Ltarget.33:
	or	$2, $0, 42
	j	$31
