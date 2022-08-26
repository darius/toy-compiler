	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.260
Lcon.215:
	bne	$4, 2, Ltarget.259
	or	$2, $0, 1
	b	Lmerge.218
Ltarget.259:
	or	$2, $0, $0
Lmerge.218:
	j	$31
Ltarget.260:
Lalt.216:
	rem	$11, $4, 3
	bne	$11, $0, Ltarget.258
Lcon.219:
	bne	$4, 3, Ltarget.257
	or	$2, $0, 1
	b	Lmerge.222
Ltarget.257:
	or	$2, $0, $0
Lmerge.222:
	j	$31
Ltarget.258:
Lalt.220:
	or	$9, $0, 5
	or	$10, $0, 96
	or	$11, $0, 25
Lscan.210:
	bge	$4, $11, Ltarget.256
Lcon.223:
	or	$2, $0, $0
	j	$31
Ltarget.256:
Lalt.224:
	rem	$8, $4, $9
	bne	$8, $0, Ltarget.255
Lcon.225:
	or	$2, $0, 1
	j	$31
Ltarget.255:
Lalt.226:
	addu	$8, $9, 2
	rem	$8, $4, $8
	bne	$8, $0, Ltarget.254
Lcon.227:
	addu	$11, $9, $9
	addu	$11, $11, $11
	addu	$11, $11, $11
	addu	$11, $11, 4
	bge	$4, $11, Ltarget.253
	or	$2, $0, $0
	b	Lmerge.233
Ltarget.253:
	or	$2, $0, 1
Lmerge.233:
	j	$31
Ltarget.254:
Lalt.228:
	addu	$9, $9, 6
	addu	$8, $10, 72
	addu	$11, $11, $10
	or	$10, $0, $8
	b	Lscan.210
