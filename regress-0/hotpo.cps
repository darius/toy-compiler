Lproc k
 Loop recur.52 p.53 k.54
  Loop merge.57 mergeval.56
   Branch = X:mergeval.56 I:0
    Loop join.59 temp.55
     Prim + X:p.53 I:1	-> mergeval.58
      Jump recur.52 X:mergeval.58 X:temp.55
     Prim Mod X:k.54 I:2	-> mergeval.60
      Loop merge.62 mergeval.61
       Branch = X:mergeval.61 I:0
        Prim * I:3 X:k.54	-> mergeval.63
         Prim + X:mergeval.63 I:1	-> mergeval.64
          Jump join.59 X:mergeval.64
        Prim Div X:k.54 I:2	-> mergeval.65
         Jump join.59 X:mergeval.65
       Branch = X:mergeval.60 I:0
        Jump merge.62 I:1
        Jump merge.62 I:0
    Ret X:p.53
   Branch = X:k.54 I:1
    Jump merge.57 I:1
    Jump merge.57 I:0
  Jump recur.52 I:0 X:k
