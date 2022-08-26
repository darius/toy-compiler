Lproc n
 Prim Mod X:n I:2	-> mergeval.150
  Loop merge.152 mergeval.151
   Branch = X:mergeval.151 I:0
    Loop scan.148 i.149
     Prim * X:i.149 X:i.149	-> mergeval.153
      Loop merge.155 mergeval.154
       Branch = X:mergeval.154 I:0
        Prim Mod X:n X:i.149	-> mergeval.156
         Loop merge.158 mergeval.157
          Branch = X:mergeval.157 I:0
           Prim + X:i.149 I:2	-> mergeval.159
            Jump scan.148 X:mergeval.159
           Ret I:1
          Branch = X:mergeval.156 I:0
           Jump merge.158 I:1
           Jump merge.158 I:0
        Ret I:0
       Branch < X:n X:mergeval.153
        Jump merge.155 I:1
        Jump merge.155 I:0
     Jump scan.148 I:3
    Loop merge.161 mergeval.160
     Ret X:mergeval.160
     Branch = X:n I:2
      Jump merge.161 I:1
      Jump merge.161 I:0
   Branch = X:mergeval.150 I:0
    Jump merge.152 I:1
    Jump merge.152 I:0
