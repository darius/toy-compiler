#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[9] = r[0]|1
  r[10] = r[0]|0
  r[11] = r[0]|r[4]
Lrecur.32:
  if (r[11]!=1) goto Ltarget.67
Lcon.40:
  r[2] = r[0]|r[9]
  RETURN;
Ltarget.67:
Lalt.41:
  r[8] = r[0]|0
Linner.36:
  if (r[11]!=1) goto Ltarget.66
Lcon.42:
  if (r[8]>=r[10]) goto Ltarget.65
Lalt.45:
  r[11] = r[11]-1
  goto Lrecur.32
Ltarget.65:
Lcon.44:
  r[11] = r[11]-1
  r[9] = r[0]|r[11]
  r[10] = r[0]|r[8]
  goto Lrecur.32
Ltarget.66:
Lalt.43:
  r[7] = r[11]%2
  if (r[7]!=0) goto Ltarget.64
Lcon.52:
  r[11] = r[11]/2
  goto Ljoin.51
Ltarget.64:
Lalt.53:
  r[11] = 3*r[11]
  r[11] = r[11]+1
Ljoin.51:
  r[8] = r[8]+1
  goto Linner.36
we_are_done: ;
}
