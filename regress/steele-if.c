#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[4]!=0) goto Ltarget.342
  if (r[6]!=0) goto Ltarget.341
  goto Lalt.336
Ltarget.341:
  goto Lcon.335
Ltarget.342:
  if (r[5]!=0) goto Ltarget.340
Lalt.336:
  r[2] = r[0]|137
  RETURN;
Ltarget.340:
Lcon.335:
  r[2] = r[0]|42
  RETURN;
we_are_done: ;
}
