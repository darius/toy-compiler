Lproc limit
 Loop l.220 i.221 c.222
  Loop merge.226 mergeval.225
   Branch = X:mergeval.225 I:0
    Prim Call F:f X:i.221	-> temp.224
     Loop join.228 c'.223
      Prim + X:i.221 I:1	-> mergeval.227
       Jump l.220 X:mergeval.227 X:c'.223
      Loop merge.230 mergeval.229
       Branch = X:mergeval.229 I:0
        Jump join.228 X:c.222
        Prim + X:c.222 I:1	-> mergeval.231
         Jump join.228 X:mergeval.231
       Branch = X:temp.224 I:0
        Jump merge.230 I:1
        Jump merge.230 I:0
    Ret X:c.222
   Branch = X:i.221 X:limit
    Jump merge.226 I:1
    Jump merge.226 I:0
  Jump l.220 I:0 I:0
