Lproc x
 Loop join.9 temp.8
  Branch = X:temp.8 I:0
   Jump bar X:x
   Jump foo X:x
  Loop merge.11 mergeval.10
   Branch = X:mergeval.10 I:0
    Jump join.9 I:0
    Prim Mod X:x I:2	-> mergeval.12
     Loop merge.14 mergeval.13
      Branch = X:mergeval.13 I:0
       Jump join.9 I:0
       Jump join.9 I:1
      Branch = X:mergeval.12 I:0
       Jump merge.14 I:1
       Jump merge.14 I:0
   Branch < I:0 X:x
    Jump merge.11 I:0
    Jump merge.11 I:1
