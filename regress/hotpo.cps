Lproc k
 Loop recur.68 p.69 k.70
  Loop con.72
   Ret X:p.69
   Loop alt.73
    Loop join.75 temp.71
     Prim + X:p.69 I:1	-> mergeval.74
      Jump recur.68 X:mergeval.74 X:temp.71
     Loop con.76
      Prim Div X:k.70 I:2	-> mergeval.78
       Jump join.75 X:mergeval.78
      Loop alt.77
       Prim * I:3 X:k.70	-> mergeval.79
        Prim + X:mergeval.79 I:1	-> mergeval.80
         Jump join.75 X:mergeval.80
       Prim Mod X:k.70 I:2	-> mergeval.81
        Loop merge.83 mergeval.82
         Branch = X:mergeval.82 I:0
          Jump alt.77
          Jump con.76
         Branch = X:mergeval.81 I:0
          Jump merge.83 I:1
          Jump merge.83 I:0
    Loop merge.85 mergeval.84
     Branch = X:mergeval.84 I:0
      Jump alt.73
      Jump con.72
     Branch = X:k.70 I:1
      Jump merge.85 I:1
      Jump merge.85 I:0
  Jump recur.68 I:0 X:k
