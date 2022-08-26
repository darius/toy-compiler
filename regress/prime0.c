#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[11] = r[4]%2
  if (r[11]!=0) goto Ltarget.209
Lcon.188:
  if (r[4]!=2) goto Ltarget.208
  r[2] = r[0]|1
  goto Lmerge.191
Ltarget.208:
  r[2] = r[0]|0
Lmerge.191:
  RETURN;
Ltarget.209:
Lalt.189:
  r[11] = r[0]|3
Lscan.186:
  r[10] = r[11]*r[11]
  if (r[4]>=r[10]) goto Ltarget.207
Lcon.192:
  r[2] = r[0]|0
  RETURN;
Ltarget.207:
Lalt.193:
  r[10] = r[4]%r[11]
  if (r[10]!=0) goto Ltarget.206
Lcon.194:
  r[2] = r[0]|1
  RETURN;
Ltarget.206:
Lalt.195:
  r[11] = r[11]+2
  goto Lscan.186
we_are_done: ;
}
