	.text
	.align	2
	.globl	Ltak
Ltak:
	bge	$5, $4, Ltarget.275
Lalt.269:
	subu	$2, $4, 1
	subu	$sp, $sp, 16
	sw	$31, 0($sp)
	sw	$5, 4($sp)
	sw	$4, 8($sp)
	sw	$6, 12($sp)
	or	$4, $0, $2
	jal	Ltak
	lw	$31, 0($sp)
	lw	$5, 4($sp)
	lw	$4, 8($sp)
	lw	$6, 12($sp)
	addu	$sp, $sp, 16
	subu	$11, $5, 1
	subu	$sp, $sp, 20
	sw	$31, 0($sp)
	sw	$2, 4($sp)
	sw	$6, 8($sp)
	sw	$5, 12($sp)
	sw	$4, 16($sp)
	or	$5, $0, $6
	or	$6, $0, $4
	or	$4, $0, $11
	jal	Ltak
	lw	$31, 0($sp)
	lw	$2, 4($sp)
	lw	$6, 8($sp)
	lw	$5, 12($sp)
	lw	$4, 16($sp)
	addu	$sp, $sp, 20
	or	$11, $0, $2
	subu	$10, $6, 1
	subu	$sp, $sp, 12
	sw	$31, 0($sp)
	sw	$2, 4($sp)
	sw	$11, 8($sp)
	or	$6, $0, $5
	or	$5, $0, $4
	or	$4, $0, $10
	jal	Ltak
	lw	$31, 0($sp)
	lw	$2, 4($sp)
	lw	$11, 8($sp)
	addu	$sp, $sp, 12
	or	$10, $0, $2
	or	$4, $0, $2
	or	$5, $0, $11
	or	$6, $0, $10
	b	Ltak
Ltarget.275:
Lcon.268:
	or	$2, $0, $6
	j	$31
