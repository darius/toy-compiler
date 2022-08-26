Lproc x y z
 Loop merge.215 mergeval.214
  Branch = X:mergeval.214 I:0
   Prim - X:x I:1	-> mergeval.218
    Prim Call F:tak X:mergeval.218 X:y X:z	-> temp.211
     Prim - X:y I:1	-> mergeval.217
      Prim Call F:tak X:mergeval.217 X:z X:x	-> temp.212
       Prim - X:z I:1	-> mergeval.216
        Prim Call F:tak X:mergeval.216 X:x X:y	-> temp.213
         Jump tak X:temp.211 X:temp.212 X:temp.213
   Ret X:z
  Branch < X:y X:x
   Jump merge.215 I:0
   Jump merge.215 I:1
