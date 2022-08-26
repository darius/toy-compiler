Lproc limit
 Loop recur.24 best_start.25 best_period.26 k.27
  Loop merge.33 mergeval.32
   Branch = X:mergeval.32 I:0
    Loop inner.28 p.29 k.30
     Loop merge.35 mergeval.34
      Branch = X:mergeval.34 I:0
       Loop join.37 temp.31
        Prim + X:p.29 I:1	-> mergeval.36
         Jump inner.28 X:mergeval.36 X:temp.31
        Prim Mod X:k.30 I:2	-> mergeval.38
         Loop merge.40 mergeval.39
          Branch = X:mergeval.39 I:0
           Prim * I:3 X:k.30	-> mergeval.41
            Prim + X:mergeval.41 I:1	-> mergeval.42
             Jump join.37 X:mergeval.42
           Prim Div X:k.30 I:2	-> mergeval.43
            Jump join.37 X:mergeval.43
          Branch = X:mergeval.38 I:0
           Jump merge.40 I:1
           Jump merge.40 I:0
       Loop merge.45 mergeval.44
        Branch = X:mergeval.44 I:0
         Prim - X:k.30 I:1	-> mergeval.46
          Jump recur.24 X:best_start.25 X:best_period.26 X:mergeval.46
         Prim - X:k.30 I:1	-> mergeval.47
          Jump recur.24 X:k.30 X:p.29 X:mergeval.47
        Branch < X:p.29 X:best_period.26
         Jump merge.45 I:0
         Jump merge.45 I:1
      Branch = X:k.30 I:1
       Jump merge.35 I:1
       Jump merge.35 I:0
     Jump inner.28 I:0 X:k.27
    Ret X:best_start.25
   Branch = X:k.27 I:1
    Jump merge.33 I:1
    Jump merge.33 I:0
  Jump recur.24 I:1 I:0 X:limit
