#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  if (r[5]!=0) goto Ltarget.31
Lcon.20:
  if (r[4]>=0) goto Ltarget.30
Lcon.22:
  r[2] = 0-r[4]
  RETURN;
Ltarget.30:
Lalt.23:
  r[2] = r[0]|r[4]
  RETURN;
Ltarget.31:
Lalt.21:
  r[2] = r[4]%r[5]
  r[4] = r[0]|r[5]
  r[5] = r[0]|r[2]
  goto Lgcd
we_are_done: ;
}
