Lproc x y z
 Loop con.268
  Ret X:z
  Loop alt.269
   Prim - X:x I:1	-> mergeval.272
    Prim Call F:tak X:mergeval.272 X:y X:z	-> temp.265
     Prim - X:y I:1	-> mergeval.271
      Prim Call F:tak X:mergeval.271 X:z X:x	-> temp.266
       Prim - X:z I:1	-> mergeval.270
        Prim Call F:tak X:mergeval.270 X:x X:y	-> temp.267
         Jump tak X:temp.265 X:temp.266 X:temp.267
   Loop merge.274 mergeval.273
    Branch = X:mergeval.273 I:0
     Jump alt.269
     Jump con.268
    Branch < X:y X:x
     Jump merge.274 I:0
     Jump merge.274 I:1
