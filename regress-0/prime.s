	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.140
	bne	$4, 2, Ltarget.147
	or	$2, $0, 1
	j	$31
Ltarget.147:
	or	$2, $0, $0
	j	$31
Ltarget.140:
	rem	$11, $4, 3
	bne	$11, $0, Ltarget.141
	bne	$4, 3, Ltarget.146
	or	$2, $0, 1
	j	$31
Ltarget.146:
	or	$2, $0, $0
	j	$31
Ltarget.141:
	or	$11, $0, 5
Lscan.112:
	mul	$10, $11, $11
	bge	$4, $10, Ltarget.142
	or	$2, $0, $0
	j	$31
Ltarget.142:
	rem	$10, $4, $11
	bne	$10, $0, Ltarget.143
	or	$2, $0, 1
	j	$31
Ltarget.143:
	addu	$10, $11, 2
	rem	$10, $4, $10
	bne	$10, $0, Ltarget.144
	addu	$10, $11, 2
	addu	$11, $11, 2
	mul	$11, $10, $11
	bge	$4, $11, Ltarget.145
	or	$2, $0, $0
	j	$31
Ltarget.145:
	or	$2, $0, 1
	j	$31
Ltarget.144:
	addu	$11, $11, 6
	b	Lscan.112
