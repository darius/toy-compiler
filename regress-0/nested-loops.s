	.text
	.align	2
	.globl	Ldandiest_under
Ldandiest_under:
	or	$2, $0, 1
	or	$10, $0, $0
	or	$11, $0, $4
Lrecur.95:
	bne	$11, 1, Ltarget.110
	j	$31
Ltarget.110:
	or	$9, $0, $0
Lrecur.100:
	bne	$11, 1, Ltarget.111
	b	Ljoin.105
Ltarget.111:
	addu	$9, $9, 1
	subu	$sp, $sp, 16
	sw	$31, 0($sp)
	sw	$2, 4($sp)
	sw	$10, 8($sp)
	sw	$11, 12($sp)
	or	$4, $0, $9
	jal	Lrecur.100
	lw	$31, 0($sp)
	lw	$2, 4($sp)
	lw	$10, 8($sp)
	lw	$11, 12($sp)
	addu	$sp, $sp, 16
	or	$9, $0, $2
Ljoin.105:
	subu	$11, $11, 1
	b	Lrecur.95
