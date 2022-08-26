	.text
	.align	2
	.globl	Lis_prime
Lis_prime:
	rem	$11, $4, 2
	bne	$11, $0, Ltarget.185
Lcon.142:
	bne	$4, 2, Ltarget.184
	or	$2, $0, 1
	b	Lmerge.145
Ltarget.184:
	or	$2, $0, $0
Lmerge.145:
	j	$31
Ltarget.185:
Lalt.143:
	rem	$11, $4, 3
	bne	$11, $0, Ltarget.183
Lcon.146:
	bne	$4, 3, Ltarget.182
	or	$2, $0, 1
	b	Lmerge.149
Ltarget.182:
	or	$2, $0, $0
Lmerge.149:
	j	$31
Ltarget.183:
Lalt.147:
	or	$11, $0, 5
Lscan.140:
	mul	$10, $11, $11
	bge	$4, $10, Ltarget.181
Lcon.150:
	or	$2, $0, $0
	j	$31
Ltarget.181:
Lalt.151:
	rem	$10, $4, $11
	bne	$10, $0, Ltarget.180
Lcon.152:
	or	$2, $0, 1
	j	$31
Ltarget.180:
Lalt.153:
	addu	$10, $11, 2
	rem	$10, $4, $10
	bne	$10, $0, Ltarget.179
Lcon.154:
	addu	$11, $11, 2
	addu	$10, $11, 2
	mul	$11, $11, $10
	bge	$4, $11, Ltarget.178
	or	$2, $0, $0
	b	Lmerge.160
Ltarget.178:
	or	$2, $0, 1
Lmerge.160:
	j	$31
Ltarget.179:
Lalt.155:
	addu	$11, $11, 6
	b	Lscan.140
