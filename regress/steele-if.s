	.text
	.align	2
	.globl	Lfoo
Lfoo:
	bne	$4, $0, Ltarget.342
	bne	$6, $0, Ltarget.341
	b	Lalt.336
Ltarget.341:
	b	Lcon.335
Ltarget.342:
	bne	$5, $0, Ltarget.340
Lalt.336:
	or	$2, $0, 137
	j	$31
Ltarget.340:
Lcon.335:
	or	$2, $0, 42
	j	$31
