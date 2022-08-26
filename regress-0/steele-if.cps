Lproc x y z
 Loop join.32 temp.31
  Branch = X:temp.31 I:0
   Ret I:137
   Ret I:42
  Branch = X:x I:0
   Jump join.32 X:z
   Jump join.32 X:y

Lproc x y z
 Loop A 
  Ret I:137
  Loop B
   Ret I:42
   Branch = X:x I:0
    Branch = X:z I:0
     Jump A
     Jump B
    Branch = X:y I:0
     Jump A
     Jump B

