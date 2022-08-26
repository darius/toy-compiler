Lproc limit
 Loop recur.119 best_start.120 best_period.121 k.122
  Loop con.126
   Ret X:best_start.120
   Loop alt.127
    Loop recur.124 p.125
     Loop join.129 p.123
      Prim - X:k.122 I:1	-> mergeval.128
       Jump recur.119 X:best_start.120 X:best_period.121 X:mergeval.128
      Loop con.130
       Jump join.129 X:p.125
       Loop alt.131
        Prim + X:p.125 I:1	-> mergeval.132
         Prim Call F:recur.124 X:mergeval.132	-> retval.133
          Jump join.129 X:retval.133
        Loop merge.135 mergeval.134
         Branch = X:mergeval.134 I:0
          Jump alt.131
          Jump con.130
         Branch = X:k.122 I:1
          Jump merge.135 I:1
          Jump merge.135 I:0
     Jump recur.124 I:0
    Loop merge.137 mergeval.136
     Branch = X:mergeval.136 I:0
      Jump alt.127
      Jump con.126
     Branch = X:k.122 I:1
      Jump merge.137 I:1
      Jump merge.137 I:0
  Jump recur.119 I:1 I:0 X:limit
