#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[10] = r[0]|1
  r[11] = r[0]|r[4]
Lagain.88:
  if (r[11]!=0) goto Ltarget.97
Lcon.91:
  r[2] = r[0]|r[10]
  RETURN;
Ltarget.97:
Lalt.92:
  r[10] = r[10]*r[11]
  r[11] = r[11]-1
  goto Lagain.88
we_are_done: ;
}
