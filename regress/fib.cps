Lproc n
 Loop con.12
  Ret I:1
  Loop alt.13
   Prim - X:n I:1	-> mergeval.16
    Prim Call F:fib X:mergeval.16	-> temp.10
     Prim - X:n I:2	-> mergeval.15
      Prim Call F:fib X:mergeval.15	-> temp.11
       Prim + X:temp.10 X:temp.11	-> mergeval.14
        Ret X:mergeval.14
   Loop merge.18 mergeval.17
    Branch = X:mergeval.17 I:0
     Jump alt.13
     Jump con.12
    Branch < X:n I:2
     Jump merge.18 I:1
     Jump merge.18 I:0
