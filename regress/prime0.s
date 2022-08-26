	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.209
Lcon.188:
	bne	$4, 2, Ltarget.208
	or	$2, $0, 1
	b	Lmerge.191
Ltarget.208:
	or	$2, $0, $0
Lmerge.191:
	j	$31
Ltarget.209:
Lalt.189:
	or	$11, $0, 3
Lscan.186:
	mul	$10, $11, $11
	bge	$4, $10, Ltarget.207
Lcon.192:
	or	$2, $0, $0
	j	$31
Ltarget.207:
Lalt.193:
	rem	$10, $4, $11
	bne	$10, $0, Ltarget.206
Lcon.194:
	or	$2, $0, 1
	j	$31
Ltarget.206:
Lalt.195:
	addu	$11, $11, 2
	b	Lscan.186
