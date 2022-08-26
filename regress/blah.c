#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (0>=r[4]) goto Ltarget.308
  goto Lbar
Ltarget.308:
Lcon.298:
  r[2] = r[4]%2
  if (r[2]!=0) goto Ltarget.307
  goto Lfoo
Ltarget.307:
  goto Lbar
we_are_done: ;
}
