Lproc limit
 Loop recur.32 best_start.33 best_period.34 k.35
  Loop con.40
   Ret X:best_start.33
   Loop alt.41
    Loop inner.36 p.37 k.38
     Loop con.42
      Loop con.44
       Prim - X:k.38 I:1	-> mergeval.46
        Jump recur.32 X:k.38 X:p.37 X:mergeval.46
       Loop alt.45
        Prim - X:k.38 I:1	-> mergeval.47
         Jump recur.32 X:best_start.33 X:best_period.34 X:mergeval.47
        Loop merge.49 mergeval.48
         Branch = X:mergeval.48 I:0
          Jump alt.45
          Jump con.44
         Branch < X:p.37 X:best_period.34
          Jump merge.49 I:0
          Jump merge.49 I:1
      Loop alt.43
       Loop join.51 temp.39
        Prim + X:p.37 I:1	-> mergeval.50
         Jump inner.36 X:mergeval.50 X:temp.39
        Loop con.52
         Prim Div X:k.38 I:2	-> mergeval.54
          Jump join.51 X:mergeval.54
         Loop alt.53
          Prim * I:3 X:k.38	-> mergeval.55
           Prim + X:mergeval.55 I:1	-> mergeval.56
            Jump join.51 X:mergeval.56
          Prim Mod X:k.38 I:2	-> mergeval.57
           Loop merge.59 mergeval.58
            Branch = X:mergeval.58 I:0
             Jump alt.53
             Jump con.52
            Branch = X:mergeval.57 I:0
             Jump merge.59 I:1
             Jump merge.59 I:0
       Loop merge.61 mergeval.60
        Branch = X:mergeval.60 I:0
         Jump alt.43
         Jump con.42
        Branch = X:k.38 I:1
         Jump merge.61 I:1
         Jump merge.61 I:0
     Jump inner.36 I:0 X:k.35
    Loop merge.63 mergeval.62
     Branch = X:mergeval.62 I:0
      Jump alt.41
      Jump con.40
     Branch = X:k.35 I:1
      Jump merge.63 I:1
      Jump merge.63 I:0
  Jump recur.32 I:1 I:0 X:limit
