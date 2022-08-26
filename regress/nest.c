#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[30] -= 4
STACK_REF(0) = r[31]
  r[31] = (int)&&ret0
goto Lf
Lret0:
  r[31] = STACK_REF(0)
r[30] += 4
  r[4] = r[0]|r[2]
  goto Lf
we_are_done: ;
}
