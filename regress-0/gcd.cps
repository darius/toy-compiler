Lproc x y
 Loop merge.17 mergeval.16
  Branch = X:mergeval.16 I:0
   Prim Mod X:x X:y	-> mergeval.18
    Jump gcd X:y X:mergeval.18
   Loop merge.20 mergeval.19
    Branch = X:mergeval.19 I:0
     Ret X:x
     Prim - I:0 X:x	-> mergeval.21
      Ret X:mergeval.21
    Branch < X:x I:0
     Jump merge.20 I:1
     Jump merge.20 I:0
  Branch = X:y I:0
   Jump merge.17 I:1
   Jump merge.17 I:0
