Lproc x y
 Loop con.20
  Loop con.22
   Prim - I:0 X:x	-> mergeval.24
    Ret X:mergeval.24
   Loop alt.23
    Ret X:x
    Loop merge.26 mergeval.25
     Branch = X:mergeval.25 I:0
      Jump alt.23
      Jump con.22
     Branch < X:x I:0
      Jump merge.26 I:1
      Jump merge.26 I:0
  Loop alt.21
   Prim Mod X:x X:y	-> mergeval.27
    Jump gcd X:y X:mergeval.27
   Loop merge.29 mergeval.28
    Branch = X:mergeval.28 I:0
     Jump alt.21
     Jump con.20
    Branch = X:y I:0
     Jump merge.29 I:1
     Jump merge.29 I:0
