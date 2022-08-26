#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[11] = r[4]%2
  if (r[11]!=0) goto Ltarget.260
Lcon.215:
  if (r[4]!=2) goto Ltarget.259
  r[2] = r[0]|1
  goto Lmerge.218
Ltarget.259:
  r[2] = r[0]|0
Lmerge.218:
  RETURN;
Ltarget.260:
Lalt.216:
  r[11] = r[4]%3
  if (r[11]!=0) goto Ltarget.258
Lcon.219:
  if (r[4]!=3) goto Ltarget.257
  r[2] = r[0]|1
  goto Lmerge.222
Ltarget.257:
  r[2] = r[0]|0
Lmerge.222:
  RETURN;
Ltarget.258:
Lalt.220:
  r[9] = r[0]|5
  r[10] = r[0]|96
  r[11] = r[0]|25
Lscan.210:
  if (r[4]>=r[11]) goto Ltarget.256
Lcon.223:
  r[2] = r[0]|0
  RETURN;
Ltarget.256:
Lalt.224:
  r[8] = r[4]%r[9]
  if (r[8]!=0) goto Ltarget.255
Lcon.225:
  r[2] = r[0]|1
  RETURN;
Ltarget.255:
Lalt.226:
  r[8] = r[9]+2
  r[8] = r[4]%r[8]
  if (r[8]!=0) goto Ltarget.254
Lcon.227:
  r[11] = r[9]+r[9]
  r[11] = r[11]+r[11]
  r[11] = r[11]+r[11]
  r[11] = r[11]+4
  if (r[4]>=r[11]) goto Ltarget.253
  r[2] = r[0]|0
  goto Lmerge.233
Ltarget.253:
  r[2] = r[0]|1
Lmerge.233:
  RETURN;
Ltarget.254:
Lalt.228:
  r[9] = r[9]+6
  r[8] = r[10]+72
  r[11] = r[11]+r[10]
  r[10] = r[0]|r[8]
  goto Lscan.210
we_are_done: ;
}
