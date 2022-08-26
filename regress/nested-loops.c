#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[10] = r[0]|1
  r[11] = r[0]|0
  r[2] = r[0]|r[4]
Lrecur.119:
  if (r[2]!=1) goto Ltarget.139
Lcon.126:
  r[2] = r[0]|r[10]
  RETURN;
Ltarget.139:
Lalt.127:
  r[9] = r[0]|0
Lrecur.124:
  if (r[2]!=1) goto Ltarget.138
  goto Ljoin.129
Ltarget.138:
Lalt.131:
  r[9] = r[9]+1
  r[30] -= 16
STACK_REF(0) = r[31]
STACK_REF(4) = r[10]
STACK_REF(8) = r[11]
STACK_REF(12) = r[2]
  r[4] = r[0]|r[9]
  r[31] = (int)&&ret0
goto Lrecur.124
Lret0:
  r[31] = STACK_REF(0)
r[10] = STACK_REF(4)
r[11] = STACK_REF(8)
r[2] = STACK_REF(12)
r[30] += 16
  r[9] = r[0]|r[2]
Ljoin.129:
  r[9] = r[2]-1
  r[2] = r[0]|r[9]
  goto Lrecur.119
we_are_done: ;
}
