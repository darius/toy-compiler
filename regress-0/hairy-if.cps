Lproc p q r x y
 Loop join.25 temp.20
  Loop join.23 temp.19
   Loop join.22 temp.18
    Branch = X:temp.18 I:0
     Ret X:y
     Ret X:x
    Branch = X:temp.19 I:0
     Jump join.22 I:1
     Jump join.22 I:0
   Branch = X:temp.20 I:0
    Jump join.23 I:0
    Loop join.24 temp.21
     Branch = X:temp.21 I:0
      Jump join.23 I:0
      Jump join.23 I:1
     Branch = X:r I:0
      Jump join.24 I:1
      Jump join.24 I:0
  Branch = X:p I:0
   Jump join.25 I:0
   Branch = X:q I:0
    Jump join.25 I:0
    Jump join.25 I:1
