#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[5]>=r[4]) goto Ltarget.275
Lalt.269:
  r[2] = r[4]-1
  r[30] -= 16
STACK_REF(0) = r[31]
STACK_REF(4) = r[5]
STACK_REF(8) = r[4]
STACK_REF(12) = r[6]
  r[4] = r[0]|r[2]
  r[31] = (int)&&ret0
goto Ltak
Lret0:
  r[31] = STACK_REF(0)
r[5] = STACK_REF(4)
r[4] = STACK_REF(8)
r[6] = STACK_REF(12)
r[30] += 16
  r[11] = r[5]-1
  r[30] -= 20
STACK_REF(0) = r[31]
STACK_REF(4) = r[2]
STACK_REF(8) = r[6]
STACK_REF(12) = r[5]
STACK_REF(16) = r[4]
  r[5] = r[0]|r[6]
  r[6] = r[0]|r[4]
  r[4] = r[0]|r[11]
  r[31] = (int)&&ret1
goto Ltak
Lret1:
  r[31] = STACK_REF(0)
r[2] = STACK_REF(4)
r[6] = STACK_REF(8)
r[5] = STACK_REF(12)
r[4] = STACK_REF(16)
r[30] += 20
  r[11] = r[0]|r[2]
  r[10] = r[6]-1
  r[30] -= 12
STACK_REF(0) = r[31]
STACK_REF(4) = r[2]
STACK_REF(8) = r[11]
  r[6] = r[0]|r[5]
  r[5] = r[0]|r[4]
  r[4] = r[0]|r[10]
  r[31] = (int)&&ret2
goto Ltak
Lret2:
  r[31] = STACK_REF(0)
r[2] = STACK_REF(4)
r[11] = STACK_REF(8)
r[30] += 12
  r[10] = r[0]|r[2]
  r[4] = r[0]|r[2]
  r[5] = r[0]|r[11]
  r[6] = r[0]|r[10]
  goto Ltak
Ltarget.275:
Lcon.268:
  r[2] = r[0]|r[6]
  RETURN;
we_are_done: ;
}
