#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[9] = r[0]|1
  r[10] = r[0]|1
  r[11] = r[0]|1
Lrecur.98:
  if (r[9]>=r[4]) goto Ltarget.108
Lalt.103:
  r[9] = r[9]+1
  r[11] = r[10]+r[11]
  r[3] = r[0]|r[10]
  r[10] = r[0]|r[11]
  r[11] = r[0]|r[3]
  goto Lrecur.98
Ltarget.108:
Lcon.102:
  r[2] = r[0]|r[10]
  RETURN;
we_are_done: ;
}
