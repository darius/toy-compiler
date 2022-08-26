	.text
	.align	2
	.globl	Ldandiest_under
Ldandiest_under:
	or	$2, $0, 1
	or	$10, $0, $0
	or	$11, $0, $4
Lrecur.24:
	bne	$11, 1, Ltarget.48
	j	$31
Ltarget.48:
	or	$9, $0, $0
Linner.28:
	bne	$11, 1, Ltarget.49
	bge	$9, $10, Ltarget.51
	subu	$11, $11, 1
	b	Lrecur.24
Ltarget.51:
	subu	$10, $11, 1
	or	$2, $0, $11
	or	$11, $0, $10
	or	$10, $0, $9
	b	Lrecur.24
Ltarget.49:
	rem	$8, $11, 2
	bne	$8, $0, Ltarget.50
	div	$11, $11, 2
	b	Ljoin.37
Ltarget.50:
	mul	$11, 3, $11
	addu	$11, $11, 1
Ljoin.37:
	addu	$9, $9, 1
	b	Linner.28
