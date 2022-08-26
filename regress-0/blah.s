	.text
	.align	2
	.globl	Lblah
Lblah:
	bge	$0, $4, Ltarget.16
	or	$2, $0, $0
	b	Ljoin.9
Ltarget.16:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.17
	or	$2, $0, 1
	b	Ljoin.9
Ltarget.17:
	or	$2, $0, $0
Ljoin.9:
	bne	$2, $0, Ltarget.15
	b	Lbar
Ltarget.15:
	b	Lfoo
