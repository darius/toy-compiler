Lproc n
 Loop recur.76 i.77 a.78 b.79
  Loop merge.81 mergeval.80
   Branch = X:mergeval.80 I:0
    Prim + X:i.77 I:1	-> mergeval.82
     Prim + X:a.78 X:b.79	-> mergeval.83
      Jump recur.76 X:mergeval.82 X:mergeval.83 X:a.78
    Ret X:a.78
   Branch < X:i.77 X:n
    Jump merge.81 I:0
    Jump merge.81 I:1
  Jump recur.76 I:1 I:1 I:1
