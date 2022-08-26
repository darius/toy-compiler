	.text
	.align	2
	.globl	Lhotpo_period
Lhotpo_period:
	or	$10, $0, $0
	or	$11, $0, $4
Lrecur.68:
	bne	$11, 1, Ltarget.87
Lcon.72:
	or	$2, $0, $10
	j	$31
Ltarget.87:
Lalt.73:
	rem	$9, $11, 2
	bne	$9, $0, Ltarget.86
Lcon.76:
	div	$11, $11, 2
	b	Ljoin.75
Ltarget.86:
Lalt.77:
	mul	$11, 3, $11
	addu	$11, $11, 1
Ljoin.75:
	addu	$10, $10, 1
	b	Lrecur.68
