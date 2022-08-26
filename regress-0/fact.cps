Lproc n
 Loop merge.4 mergeval.3
  Branch = X:mergeval.3 I:0
   Prim - X:n I:1	-> mergeval.6
    Prim Call F:fact X:mergeval.6	-> temp.2
     Prim * X:n X:temp.2	-> mergeval.5
      Ret X:mergeval.5
   Ret I:1
  Branch = X:n I:0
   Jump merge.4 I:1
   Jump merge.4 I:0
