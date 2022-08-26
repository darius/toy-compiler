Lproc x y z
 Loop join.337 temp.334
  Loop con.335
   Ret I:42
   Loop alt.336
    Ret I:137
    Branch = X:temp.334 I:0
     Jump alt.336
     Jump con.335
  Loop con.338
   Jump join.337 X:y
   Loop alt.339
    Jump join.337 X:z
    Branch = X:x I:0
     Jump alt.339
     Jump con.338
