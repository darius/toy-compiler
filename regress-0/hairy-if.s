	.text
	.align	2
	.globl	Lhairy_condition
Lhairy_condition:
	bne	$4, $0, Ltarget.29
	or	$11, $0, $0
	b	Ljoin.25
Ltarget.29:
	bne	$5, $0, Ltarget.30
	or	$11, $0, $0
	b	Ljoin.25
Ltarget.30:
	or	$11, $0, 1
Ljoin.25:
	bne	$11, $0, Ltarget.27
	or	$11, $0, $0
	b	Ljoin.23
Ltarget.27:
	bne	$6, $0, Ltarget.28
	or	$11, $0, 1
	b	Ljoin.23
Ltarget.28:
	or	$11, $0, $0
Ljoin.23:
	bne	$11, $0, Ltarget.26
	or	$2, $0, $7
	j	$31
Ltarget.26:
	or	$2, $0, $8
	j	$31
