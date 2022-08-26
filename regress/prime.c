#define STACK_REF(i)  (*(int*)((char*)(r[30]) + (i)))
#define RETURN        goto *(void*) (r[31])

void sim(int *r)
{
  r[31] = (int) &&we_are_done;
  r[11] = r[4]%2
  if (r[11]!=0) goto Ltarget.185
Lcon.142:
  if (r[4]!=2) goto Ltarget.184
  r[2] = r[0]|1
  goto Lmerge.145
Ltarget.184:
  r[2] = r[0]|0
Lmerge.145:
  RETURN;
Ltarget.185:
Lalt.143:
  r[11] = r[4]%3
  if (r[11]!=0) goto Ltarget.183
Lcon.146:
  if (r[4]!=3) goto Ltarget.182
  r[2] = r[0]|1
  goto Lmerge.149
Ltarget.182:
  r[2] = r[0]|0
Lmerge.149:
  RETURN;
Ltarget.183:
Lalt.147:
  r[11] = r[0]|5
Lscan.140:
  r[10] = r[11]*r[11]
  if (r[4]>=r[10]) goto Ltarget.181
Lcon.150:
  r[2] = r[0]|0
  RETURN;
Ltarget.181:
Lalt.151:
  r[10] = r[4]%r[11]
  if (r[10]!=0) goto Ltarget.180
Lcon.152:
  r[2] = r[0]|1
  RETURN;
Ltarget.180:
Lalt.153:
  r[10] = r[11]+2
  r[10] = r[4]%r[10]
  if (r[10]!=0) goto Ltarget.179
Lcon.154:
  r[11] = r[11]+2
  r[10] = r[11]+2
  r[11] = r[11]*r[10]
  if (r[4]>=r[11]) goto Ltarget.178
  r[2] = r[0]|0
  goto Lmerge.160
Ltarget.178:
  r[2] = r[0]|1
Lmerge.160:
  RETURN;
Ltarget.179:
Lalt.155:
  r[11] = r[11]+6
  goto Lscan.140
we_are_done: ;
}
