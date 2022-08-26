Lproc x
 Loop join.297 temp.294
  Loop con.295
   Jump foo X:x
   Loop alt.296
    Jump bar X:x
    Branch = X:temp.294 I:0
     Jump alt.296
     Jump con.295
  Loop con.298
   Loop con.300
    Jump join.297 I:1
    Loop alt.301
     Jump join.297 I:0
     Prim Mod X:x I:2	-> mergeval.302
      Loop merge.304 mergeval.303
       Branch = X:mergeval.303 I:0
        Jump alt.301
        Jump con.300
       Branch = X:mergeval.302 I:0
        Jump merge.304 I:1
        Jump merge.304 I:0
   Loop alt.299
    Jump join.297 I:0
    Loop merge.306 mergeval.305
     Branch = X:mergeval.305 I:0
      Jump alt.299
      Jump con.298
     Branch < I:0 X:x
      Jump merge.306 I:0
      Jump merge.306 I:1
