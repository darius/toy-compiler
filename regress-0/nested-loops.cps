Lproc limit
 Loop recur.95 best_start.96 best_period.97 k.98
  Loop merge.103 mergeval.102
   Branch = X:mergeval.102 I:0
    Loop recur.100 p.101
     Loop join.105 p.99
      Prim - X:k.98 I:1	-> mergeval.104
       Jump recur.95 X:best_start.96 X:best_period.97 X:mergeval.104
      Loop merge.107 mergeval.106
       Branch = X:mergeval.106 I:0
        Prim + X:p.101 I:1	-> mergeval.108
         Prim Call F:recur.100 X:mergeval.108	-> retval.109
          Jump join.105 X:retval.109
        Jump join.105 X:p.101
       Branch = X:k.98 I:1
        Jump merge.107 I:1
        Jump merge.107 I:0
     Jump recur.100 I:0
    Ret X:best_start.96
   Branch = X:k.98 I:1
    Jump merge.103 I:1
    Jump merge.103 I:0
  Jump recur.95 I:1 I:0 X:limit
