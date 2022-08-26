Lproc n
 Loop con.3
  Ret I:1
  Loop alt.4
   Prim - X:n I:1	-> mergeval.6
    Prim Call F:fact X:mergeval.6	-> temp.2
     Prim * X:n X:temp.2	-> mergeval.5
      Ret X:mergeval.5
   Loop merge.8 mergeval.7
    Branch = X:mergeval.7 I:0
     Jump alt.4
     Jump con.3
    Branch = X:n I:0
     Jump merge.8 I:1
     Jump merge.8 I:0
