	.text
	.align	2
	.globl	Lcountzeros
Lcountzeros:
	or	$11, $0, $0
	or	$2, $0, $0
Ll.276:
	bne	$11, $4, Ltarget.293
Lcon.281:
	j	$31
Ltarget.293:
Lalt.282:
	subu	$sp, $sp, 16
	sw	$31, 0($sp)
	sw	$2, 4($sp)
	sw	$11, 8($sp)
	sw	$4, 12($sp)
	or	$4, $0, $11
	jal	Lf
	lw	$31, 0($sp)
	lw	$2, 4($sp)
	lw	$11, 8($sp)
	lw	$4, 12($sp)
	addu	$sp, $sp, 16
	or	$10, $0, $2
	bne	$10, $0, Ltarget.292
Lcon.285:
	addu	$10, $2, 1
	b	Ljoin.284
Ltarget.292:
	or	$10, $0, $2
Ljoin.284:
	addu	$11, $11, 1
	or	$2, $0, $10
	b	Ll.276
