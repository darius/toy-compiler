Lproc p q r x y
 Loop join.326 temp.311
  Loop join.318 temp.310
   Loop join.315 temp.309
    Loop con.313
     Ret X:x
     Loop alt.314
      Ret X:y
      Branch = X:temp.309 I:0
       Jump alt.314
       Jump con.313
    Loop con.316
     Jump join.315 I:0
     Loop alt.317
      Jump join.315 I:1
      Branch = X:temp.310 I:0
       Jump alt.317
       Jump con.316
   Loop con.319
    Loop join.323 temp.312
     Loop con.321
      Jump join.318 I:1
      Loop alt.322
       Jump join.318 I:0
       Branch = X:temp.312 I:0
        Jump alt.322
        Jump con.321
     Loop con.324
      Jump join.323 I:0
      Loop alt.325
       Jump join.323 I:1
       Branch = X:r I:0
        Jump alt.325
        Jump con.324
    Loop alt.320
     Jump join.318 I:0
     Branch = X:temp.311 I:0
      Jump alt.320
      Jump con.319
  Loop con.327
   Loop con.329
    Jump join.326 I:1
    Loop alt.330
     Jump join.326 I:0
     Branch = X:q I:0
      Jump alt.330
      Jump con.329
   Loop alt.328
    Jump join.326 I:0
    Branch = X:p I:0
     Jump alt.328
     Jump con.327
