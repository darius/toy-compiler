	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.199
	bne	$4, 2, Ltarget.206
	or	$2, $0, 1
	j	$31
Ltarget.206:
	or	$2, $0, $0
	j	$31
Ltarget.199:
	rem	$11, $4, 3
	bne	$11, $0, Ltarget.200
	bne	$4, 3, Ltarget.205
	or	$2, $0, 1
	j	$31
Ltarget.205:
	or	$2, $0, $0
	j	$31
Ltarget.200:
	or	$9, $0, 5
	or	$10, $0, 96
	or	$11, $0, 25
Lscan.166:
	bge	$4, $11, Ltarget.201
	or	$2, $0, $0
	j	$31
Ltarget.201:
	rem	$8, $4, $9
	bne	$8, $0, Ltarget.202
	or	$2, $0, 1
	j	$31
Ltarget.202:
	addu	$8, $9, 2
	rem	$8, $4, $8
	bne	$8, $0, Ltarget.203
	addu	$10, $9, $9
	addu	$10, $10, $10
	addu	$11, $11, $10
	addu	$11, $11, 4
	bge	$4, $11, Ltarget.204
	or	$2, $0, $0
	j	$31
Ltarget.204:
	or	$2, $0, 1
	j	$31
Ltarget.203:
	addu	$9, $9, 6
	addu	$8, $10, 72
	addu	$11, $11, $10
	or	$10, $0, $8
	b	Lscan.166
