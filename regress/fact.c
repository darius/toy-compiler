#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[4]!=0) goto Ltarget.9
Lcon.3:
  r[2] = r[0]|1
  RETURN;
Ltarget.9:
Lalt.4:
  r[11] = r[4]-1
  r[30] -= 8
STACK_REF(0) = r[31]
STACK_REF(4) = r[4]
  r[4] = r[0]|r[11]
  r[31] = (int)&&ret0
goto Lfact
Lret0:
  r[31] = STACK_REF(0)
r[4] = STACK_REF(4)
r[30] += 8
  r[11] = r[0]|r[2]
  r[2] = r[4]*r[11]
  RETURN;
we_are_done: ;
}
