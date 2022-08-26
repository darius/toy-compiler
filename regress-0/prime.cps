Lproc n
 Prim Mod X:n I:2	-> mergeval.114
  Loop merge.116 mergeval.115
   Branch = X:mergeval.115 I:0
    Prim Mod X:n I:3	-> mergeval.117
     Loop merge.119 mergeval.118
      Branch = X:mergeval.118 I:0
       Loop scan.112 i.113
        Prim * X:i.113 X:i.113	-> mergeval.120
         Loop merge.122 mergeval.121
          Branch = X:mergeval.121 I:0
           Prim Mod X:n X:i.113	-> mergeval.123
            Loop merge.125 mergeval.124
             Branch = X:mergeval.124 I:0
              Prim + X:i.113 I:2	-> mergeval.126
               Prim Mod X:n X:mergeval.126	-> mergeval.127
                Loop merge.129 mergeval.128
                 Branch = X:mergeval.128 I:0
                  Prim + X:i.113 I:6	-> mergeval.130
                   Jump scan.112 X:mergeval.130
                  Prim + X:i.113 I:2	-> mergeval.131
                   Prim + X:i.113 I:2	-> mergeval.132
                    Prim * X:mergeval.131 X:mergeval.132	-> mergeval.133
                     Loop merge.135 mergeval.134
                      Ret X:mergeval.134
                      Branch < X:n X:mergeval.133
                       Jump merge.135 I:0
                       Jump merge.135 I:1
                 Branch = X:mergeval.127 I:0
                  Jump merge.129 I:1
                  Jump merge.129 I:0
              Ret I:1
             Branch = X:mergeval.123 I:0
              Jump merge.125 I:1
              Jump merge.125 I:0
           Ret I:0
          Branch < X:n X:mergeval.120
           Jump merge.122 I:1
           Jump merge.122 I:0
        Jump scan.112 I:5
       Loop merge.137 mergeval.136
        Ret X:mergeval.136
        Branch = X:n I:3
         Jump merge.137 I:1
         Jump merge.137 I:0
      Branch = X:mergeval.117 I:0
       Jump merge.119 I:1
       Jump merge.119 I:0
    Loop merge.139 mergeval.138
     Ret X:mergeval.138
     Branch = X:n I:2
      Jump merge.139 I:1
      Jump merge.139 I:0
   Branch = X:mergeval.114 I:0
    Jump merge.116 I:1
    Jump merge.116 I:0
