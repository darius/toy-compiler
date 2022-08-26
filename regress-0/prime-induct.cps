Lproc n
 Prim Mod X:n I:2	-> mergeval.171
  Loop merge.173 mergeval.172
   Branch = X:mergeval.172 I:0
    Prim Mod X:n I:3	-> mergeval.174
     Loop merge.176 mergeval.175
      Branch = X:mergeval.175 I:0
       Loop scan.166 i.167 step.168 i_squared.169
        Loop merge.178 mergeval.177
         Branch = X:mergeval.177 I:0
          Prim Mod X:n X:i.167	-> mergeval.179
           Loop merge.181 mergeval.180
            Branch = X:mergeval.180 I:0
             Prim + X:i.167 I:2	-> mergeval.182
              Prim Mod X:n X:mergeval.182	-> mergeval.183
               Loop merge.185 mergeval.184
                Branch = X:mergeval.184 I:0
                 Prim + X:i.167 I:6	-> mergeval.186
                  Prim + X:step.168 I:72	-> mergeval.187
                   Prim + X:i_squared.169 X:step.168	-> mergeval.188
                    Jump scan.166 X:mergeval.186 X:mergeval.187 X:mergeval.188
                 Prim + X:i.167 X:i.167	-> mergeval.194
                  Prim + X:mergeval.194 X:mergeval.194	-> mergeval.189
                   Prim + X:i_squared.169 X:mergeval.189	-> mergeval.190
                    Prim + X:mergeval.190 I:4	-> mergeval.191
                     Loop merge.193 mergeval.192
                      Ret X:mergeval.192
                      Branch < X:n X:mergeval.191
                       Jump merge.193 I:0
                       Jump merge.193 I:1
                Branch = X:mergeval.183 I:0
                 Jump merge.185 I:1
                 Jump merge.185 I:0
             Ret I:1
            Branch = X:mergeval.179 I:0
             Jump merge.181 I:1
             Jump merge.181 I:0
          Ret I:0
         Branch < X:n X:i_squared.169
          Jump merge.178 I:1
          Jump merge.178 I:0
        Jump scan.166 I:5 I:96 I:25
       Loop merge.196 mergeval.195
        Ret X:mergeval.195
        Branch = X:n I:3
         Jump merge.196 I:1
         Jump merge.196 I:0
      Branch = X:mergeval.174 I:0
       Jump merge.176 I:1
       Jump merge.176 I:0
    Loop merge.198 mergeval.197
     Ret X:mergeval.197
     Branch = X:n I:2
      Jump merge.198 I:1
      Jump merge.198 I:0
   Branch = X:mergeval.171 I:0
    Jump merge.173 I:1
    Jump merge.173 I:0
