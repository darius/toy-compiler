	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.162
	bne	$4, 2, Ltarget.165
	or	$2, $0, 1
	j	$31
Ltarget.165:
	or	$2, $0, $0
	j	$31
Ltarget.162:
	or	$11, $0, 3
Lscan.148:
	mul	$10, $11, $11
	bge	$4, $10, Ltarget.163
	or	$2, $0, $0
	j	$31
Ltarget.163:
	rem	$10, $4, $11
	bne	$10, $0, Ltarget.164
	or	$2, $0, 1
	j	$31
Ltarget.164:
	addu	$11, $11, 2
	b	Lscan.148
