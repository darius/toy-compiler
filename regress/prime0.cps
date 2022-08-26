Lproc n
 Loop con.188
  Loop merge.191 mergeval.190
   Ret X:mergeval.190
   Branch = X:n I:2
    Jump merge.191 I:1
    Jump merge.191 I:0
  Loop alt.189
   Loop scan.186 i.187
    Loop con.192
     Ret I:0
     Loop alt.193
      Loop con.194
       Ret I:1
       Loop alt.195
        Prim + X:i.187 I:2	-> mergeval.196
         Jump scan.186 X:mergeval.196
        Prim Mod X:n X:i.187	-> mergeval.197
         Loop merge.199 mergeval.198
          Branch = X:mergeval.198 I:0
           Jump alt.195
           Jump con.194
          Branch = X:mergeval.197 I:0
           Jump merge.199 I:1
           Jump merge.199 I:0
      Prim * X:i.187 X:i.187	-> mergeval.200
       Loop merge.202 mergeval.201
        Branch = X:mergeval.201 I:0
         Jump alt.193
         Jump con.192
        Branch < X:n X:mergeval.200
         Jump merge.202 I:1
         Jump merge.202 I:0
    Jump scan.186 I:3
   Prim Mod X:n I:2	-> mergeval.203
    Loop merge.205 mergeval.204
     Branch = X:mergeval.204 I:0
      Jump alt.189
      Jump con.188
     Branch = X:mergeval.203 I:0
      Jump merge.205 I:1
      Jump merge.205 I:0
