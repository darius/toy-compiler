#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[4]>=2) goto Ltarget.19
Lcon.12:
  r[2] = r[0]|1
  RETURN;
Ltarget.19:
Lalt.13:
  r[11] = r[4]-1
  r[30] -= 8
STACK_REF(0) = r[31]
STACK_REF(4) = r[4]
  r[4] = r[0]|r[11]
  r[31] = (int)&&ret0
goto Lfib
Lret0:
  r[31] = STACK_REF(0)
r[4] = STACK_REF(4)
r[30] += 8
  r[11] = r[0]|r[2]
  r[10] = r[4]-2
  r[30] -= 8
STACK_REF(0) = r[31]
STACK_REF(4) = r[11]
  r[4] = r[0]|r[10]
  r[31] = (int)&&ret1
goto Lfib
Lret1:
  r[31] = STACK_REF(0)
r[11] = STACK_REF(4)
r[30] += 8
  r[10] = r[0]|r[2]
  r[2] = r[11]+r[10]
  RETURN;
we_are_done: ;
}
