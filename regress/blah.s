	.text
	.align	2
	.globl	Lblah
Lblah:
	bge	$0, $4, Ltarget.308
	b	Lbar
Ltarget.308:
Lcon.298:
	rem	$2, $4, 2
	bne	$2, $0, Ltarget.307
	b	Lfoo
Ltarget.307:
	b	Lbar
