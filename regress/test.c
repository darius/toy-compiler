#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[11] = r[0]|0
  r[2] = r[0]|0
Ll.276:
  if (r[11]!=r[4]) goto Ltarget.293
Lcon.281:
  RETURN;
Ltarget.293:
Lalt.282:
  r[30] -= 16
STACK_REF(0) = r[31]
STACK_REF(4) = r[2]
STACK_REF(8) = r[11]
STACK_REF(12) = r[4]
  r[4] = r[0]|r[11]
  r[31] = (int)&&ret0
goto Lf
Lret0:
  r[31] = STACK_REF(0)
r[2] = STACK_REF(4)
r[11] = STACK_REF(8)
r[4] = STACK_REF(12)
r[30] += 16
  r[10] = r[0]|r[2]
  if (r[10]!=0) goto Ltarget.292
Lcon.285:
  r[10] = r[2]+1
  goto Ljoin.284
Ltarget.292:
  r[10] = r[0]|r[2]
Ljoin.284:
  r[11] = r[11]+1
  r[2] = r[0]|r[10]
  goto Ll.276
we_are_done: ;
}
