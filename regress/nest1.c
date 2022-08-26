#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[30] -= 8
STACK_REF(0) = r[31]
STACK_REF(4) = r[4]
  r[31] = (int)&&ret0
goto Lh
Lret0:
  r[31] = STACK_REF(0)
r[4] = STACK_REF(4)
r[30] += 8
  r[11] = r[4]+1
  r[30] -= 8
STACK_REF(0) = r[31]
STACK_REF(4) = r[2]
  r[4] = r[0]|r[11]
  r[31] = (int)&&ret1
goto Lh
Lret1:
  r[31] = STACK_REF(0)
r[2] = STACK_REF(4)
r[30] += 8
  r[11] = r[0]|r[2]
  r[4] = r[0]|r[2]
  r[5] = r[0]|r[11]
  goto Lg
we_are_done: ;
}
