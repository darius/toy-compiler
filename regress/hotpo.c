#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[10] = r[0]|0
  r[11] = r[0]|r[4]
Lrecur.68:
  if (r[11]!=1) goto Ltarget.87
Lcon.72:
  r[2] = r[0]|r[10]
  RETURN;
Ltarget.87:
Lalt.73:
  r[9] = r[11]%2
  if (r[9]!=0) goto Ltarget.86
Lcon.76:
  r[11] = r[11]/2
  goto Ljoin.75
Ltarget.86:
Lalt.77:
  r[11] = 3*r[11]
  r[11] = r[11]+1
Ljoin.75:
  r[10] = r[10]+1
  goto Lrecur.68
we_are_done: ;
}
