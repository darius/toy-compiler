	.text
	.align	2
	.globl	Lhotpo_period
Lhotpo_period:
	or	$2, $0, $0
	or	$11, $0, $4
Lrecur.52:
	bne	$11, 1, Ltarget.66
	j	$31
Ltarget.66:
	rem	$10, $11, 2
	bne	$10, $0, Ltarget.67
	div	$11, $11, 2
	b	Ljoin.59
Ltarget.67:
	mul	$11, 3, $11
	addu	$11, $11, 1
Ljoin.59:
	addu	$10, $2, 1
	or	$2, $0, $10
	b	Lrecur.52
