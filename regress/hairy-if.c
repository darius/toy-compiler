#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[4]!=0) goto Ltarget.333
  goto Lcon.313
Ltarget.333:
Lcon.327:
  if (r[5]!=0) goto Ltarget.332
  goto Lcon.313
Ltarget.332:
Lcon.319:
  if (r[6]!=0) goto Ltarget.331
Lalt.314:
  r[2] = r[0]|r[8]
  RETURN;
Ltarget.331:
Lcon.313:
  r[2] = r[0]|r[7]
  RETURN;
we_are_done: ;
}
