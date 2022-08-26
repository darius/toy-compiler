	.text
	.align	2
	.globl	Lgcd
Lgcd:
	bne	$5, $0, Ltarget.22
	bge	$4, $0, Ltarget.23
	subu	$2, $0, $4
	j	$31
Ltarget.23:
	or	$2, $0, $4
	j	$31
Ltarget.22:
	rem	$2, $4, $5
	or	$4, $0, $5
	or	$5, $0, $2
	b	Lgcd
