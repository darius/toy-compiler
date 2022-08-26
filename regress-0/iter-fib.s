	.text
	.align	2
	.globl	Lfib
Lfib:
	or	$10, $0, 1
	or	$2, $0, 1
	or	$11, $0, 1
Lrecur.76:
	bge	$10, $4, Ltarget.84
	addu	$10, $10, 1
	addu	$11, $2, $11
	or	$3, $0, $2
	or	$2, $0, $11
	or	$11, $0, $3
	b	Lrecur.76
Ltarget.84:
	j	$31
