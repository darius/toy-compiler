Lproc n
 Loop recur.98 i.99 a.100 b.101
  Loop con.102
   Ret X:a.100
   Loop alt.103
    Prim + X:i.99 I:1	-> mergeval.104
     Prim + X:a.100 X:b.101	-> mergeval.105
      Jump recur.98 X:mergeval.104 X:mergeval.105 X:a.100
    Loop merge.107 mergeval.106
     Branch = X:mergeval.106 I:0
      Jump alt.103
      Jump con.102
     Branch < X:i.99 X:n
      Jump merge.107 I:0
      Jump merge.107 I:1
  Jump recur.98 I:1 I:1 I:1
