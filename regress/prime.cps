Lproc n
 Loop con.142
  Loop merge.145 mergeval.144
   Ret X:mergeval.144
   Branch = X:n I:2
    Jump merge.145 I:1
    Jump merge.145 I:0
  Loop alt.143
   Loop con.146
    Loop merge.149 mergeval.148
     Ret X:mergeval.148
     Branch = X:n I:3
      Jump merge.149 I:1
      Jump merge.149 I:0
    Loop alt.147
     Loop scan.140 i.141
      Loop con.150
       Ret I:0
       Loop alt.151
        Loop con.152
         Ret I:1
         Loop alt.153
          Loop con.154
           Prim + X:i.141 I:2	-> mergeval.156
            Prim + X:i.141 I:2	-> mergeval.157
             Prim * X:mergeval.156 X:mergeval.157	-> mergeval.158
              Loop merge.160 mergeval.159
               Ret X:mergeval.159
               Branch < X:n X:mergeval.158
                Jump merge.160 I:0
                Jump merge.160 I:1
           Loop alt.155
            Prim + X:i.141 I:6	-> mergeval.161
             Jump scan.140 X:mergeval.161
            Prim + X:i.141 I:2	-> mergeval.162
             Prim Mod X:n X:mergeval.162	-> mergeval.163
              Loop merge.165 mergeval.164
               Branch = X:mergeval.164 I:0
                Jump alt.155
                Jump con.154
               Branch = X:mergeval.163 I:0
                Jump merge.165 I:1
                Jump merge.165 I:0
          Prim Mod X:n X:i.141	-> mergeval.166
           Loop merge.168 mergeval.167
            Branch = X:mergeval.167 I:0
             Jump alt.153
             Jump con.152
            Branch = X:mergeval.166 I:0
             Jump merge.168 I:1
             Jump merge.168 I:0
        Prim * X:i.141 X:i.141	-> mergeval.169
         Loop merge.171 mergeval.170
          Branch = X:mergeval.170 I:0
           Jump alt.151
           Jump con.150
          Branch < X:n X:mergeval.169
           Jump merge.171 I:1
           Jump merge.171 I:0
      Jump scan.140 I:5
     Prim Mod X:n I:3	-> mergeval.172
      Loop merge.174 mergeval.173
       Branch = X:mergeval.173 I:0
        Jump alt.147
        Jump con.146
       Branch = X:mergeval.172 I:0
        Jump merge.174 I:1
        Jump merge.174 I:0
   Prim Mod X:n I:2	-> mergeval.175
    Loop merge.177 mergeval.176
     Branch = X:mergeval.176 I:0
      Jump alt.143
      Jump con.142
     Branch = X:mergeval.175 I:0
      Jump merge.177 I:1
      Jump merge.177 I:0
