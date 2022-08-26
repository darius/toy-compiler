	.text
	.align	2
	.globl	Ldandiest_under
Ldandiest_under:
	or	$10, $0, 1
	or	$11, $0, $0
	or	$2, $0, $4
Lrecur.119:
	bne	$2, 1, Ltarget.139
Lcon.126:
	or	$2, $0, $10
	j	$31
Ltarget.139:
Lalt.127:
	or	$9, $0, $0
Lrecur.124:
	bne	$2, 1, Ltarget.138
	b	Ljoin.129
Ltarget.138:
Lalt.131:
	addu	$9, $9, 1
	subu	$sp, $sp, 16
	sw	$31, 0($sp)
	sw	$10, 4($sp)
	sw	$11, 8($sp)
	sw	$2, 12($sp)
	or	$4, $0, $9
	jal	Lrecur.124
	lw	$31, 0($sp)
	lw	$10, 4($sp)
	lw	$11, 8($sp)
	lw	$2, 12($sp)
	addu	$sp, $sp, 16
	or	$9, $0, $2
Ljoin.129:
	subu	$9, $2, 1
	or	$2, $0, $9
	b	Lrecur.119
