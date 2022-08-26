	.text
	.align	2
	.globl	Ldandiest_under
Ldandiest_under:
	or	$9, $0, 1
	or	$10, $0, $0
	or	$11, $0, $4
Lrecur.32:
	bne	$11, 1, Ltarget.67
Lcon.40:
	or	$2, $0, $9
	j	$31
Ltarget.67:
Lalt.41:
	or	$8, $0, $0
Linner.36:
	bne	$11, 1, Ltarget.66
Lcon.42:
	bge	$8, $10, Ltarget.65
Lalt.45:
	subu	$11, $11, 1
	b	Lrecur.32
Ltarget.65:
Lcon.44:
	subu	$11, $11, 1
	or	$9, $0, $11
	or	$10, $0, $8
	b	Lrecur.32
Ltarget.66:
Lalt.43:
	rem	$7, $11, 2
	bne	$7, $0, Ltarget.64
Lcon.52:
	div	$11, $11, 2
	b	Ljoin.51
Ltarget.64:
Lalt.53:
	mul	$11, 3, $11
	addu	$11, $11, 1
Ljoin.51:
	addu	$8, $8, 1
	b	Linner.36
