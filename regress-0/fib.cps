Lproc n
 Loop merge.11 mergeval.10
  Branch = X:mergeval.10 I:0
   Prim - X:n I:1	-> mergeval.14
    Prim Call F:fib X:mergeval.14	-> temp.8
     Prim - X:n I:2	-> mergeval.13
      Prim Call F:fib X:mergeval.13	-> temp.9
       Prim + X:temp.8 X:temp.9	-> mergeval.12
        Ret X:mergeval.12
   Ret I:1
  Branch < X:n I:2
   Jump merge.11 I:1
   Jump merge.11 I:0
