	.text
	.align	2
	.globl	Lhairy_condition
Lhairy_condition:
	bne	$4, $0, Ltarget.333
	b	Lcon.313
Ltarget.333:
Lcon.327:
	bne	$5, $0, Ltarget.332
	b	Lcon.313
Ltarget.332:
Lcon.319:
	bne	$6, $0, Ltarget.331
Lalt.314:
	or	$2, $0, $8
	j	$31
Ltarget.331:
Lcon.313:
	or	$2, $0, $7
	j	$31
