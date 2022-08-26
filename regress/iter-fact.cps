Lproc n
 Loop again.88 product.89 counter.90
  Loop con.91
   Ret X:product.89
   Loop alt.92
    Prim * X:product.89 X:counter.90	-> mergeval.93
     Prim - X:counter.90 I:1	-> mergeval.94
      Jump again.88 X:mergeval.93 X:mergeval.94
    Loop merge.96 mergeval.95
     Branch = X:mergeval.95 I:0
      Jump alt.92
      Jump con.91
     Branch = X:counter.90 I:0
      Jump merge.96 I:1
      Jump merge.96 I:0
  Jump again.88 I:1 X:n
