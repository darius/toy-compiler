Lproc n
 Loop again.68 product.69 counter.70
  Loop merge.72 mergeval.71
   Branch = X:mergeval.71 I:0
    Prim * X:product.69 X:counter.70	-> mergeval.73
     Prim - X:counter.70 I:1	-> mergeval.74
      Jump again.68 X:mergeval.73 X:mergeval.74
    Ret X:product.69
   Branch = X:counter.70 I:0
    Jump merge.72 I:1
    Jump merge.72 I:0
  Jump again.68 I:1 X:n
