	.text
	.align	2
	.globl	Lfib
Lfib:
	or	$9, $0, 1
	or	$10, $0, 1
	or	$11, $0, 1
Lrecur.98:
	bge	$9, $4, Ltarget.108
Lalt.103:
	addu	$9, $9, 1
	addu	$11, $10, $11
	or	$3, $0, $10
	or	$10, $0, $11
	or	$11, $0, $3
	b	Lrecur.98
Ltarget.108:
Lcon.102:
	or	$2, $0, $10
	j	$31
