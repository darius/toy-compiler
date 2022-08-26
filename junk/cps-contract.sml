structure Cps_contract = struct

local open Cps
in


(* 
   Return number of uses of t in m.
   Pre: t is not bound in m.
 *)

fun usage_count (t, m) = 
      let fun count_in ts = 
                foldr ((op +): int * int -> int)
                      0 
                      (map (fn t' => if t' = t then 1 else 0)
                           ts)

          fun walk (Ret t)                  = count_in [t]
            | walk (Jump (l, ts))           = count_in ((F l) :: ts)
            | walk (Prim (p, ts, x, m))     = count_in ts + walk m
            | walk (Branch (p, ts, tm, fm)) = count_in ts + walk tm + walk fm
            | walk (Loop (l, xs, body, m))  = walk body + walk m

       in walk m
      end

fun contract (Ret t)                  = Ret t
  | contract (Jump (l, ts))           = Jump (l, ts)
  | contract (Prim (p, ts, x, m))     = contract_prim (p, ts, x, contract m)
  | contract (Branch (p, ts, tm, fm)) = contract_branch (p, ts, contract tm, contract fm)
  | contract (Loop (l, xs, body, m))  = contract_loop (l, xs, contract body, contract m)

and contract_prim (p, ts, x, m) = 
      Prim (p, ts, x, m)

and contract_branch (p, ts, tm, fm) = 
      Branch (p, ts, tm, fm)

and contract_loop (l, xs, body, m) = 

      let fun dead_vars () = 
          (* Loop (l, xs, body, Jump (l, ts)) ==> body, if xs aren't used in body. *)
                case m of
                  Jump (l', ts) => 
                    if 0 = foldr (fn (x, sum) => sum + usage_count (X x, body)) 0 xs 
                    then SOME body 
                    else NONE
                | _ => NONE

          fun boolean_idiom () = 
          (* Loop (l, [x], Branch (Eq, [X x, I 0], tm, fm),
                           Branch (p, ts, Jump (l, [I ti]), Jump (l, [I fi]))) ==>
             Loop (l, [x], Branch (p, ts, tm', fm'), Jump (l, [I 0])), 
             if ti and fi are each 0 or 1, and not equal,
             and x is not used in tm or fm, 
             and where tm' and fm' are the appropriate permutation of tm and fm. *)
           (* FIXME: given those conditions, you might as well optimize out the Loop entirely *)
                case (xs, body, m) of
                  ([mergeval], 
                   Branch (Eq, [X test, I 0], tm, fm),
                   Branch (p, ts, Jump (tl, [I ti]), Jump (fl, [I fi])))
                  => if tl = l andalso fl = l 
                        andalso ((ti = 0 andalso fi <> 0) orelse (ti <> 0 andalso fi = 0))
                        andalso mergeval = test andalso 1 = usage_count (X mergeval, body)
                     then SOME
                           (contract (Loop (l, [mergeval], 
                                            Branch (p, ts, if ti = 0 then tm else fm,
                                                           if ti = 0 then fm else tm),
                                            Jump (l, [I 0]))))
                     else NONE
                | _ => NONE

          fun simple_body () =
          (* Loop (l, [x], Ret t, ... Jump (l, [t']) ...) ==>
             Loop (l, [x], Ret t, ... Ret t'' ...) where t'' = t', if t = X x, 
                                                            or t,  otherwise. *)
                case (xs, body) of
                  ([x], Ret t) =>             (* and similarly for Jump ... *)
                    let fun subst (m' as Jump (l', [t'])) =
                              if l' = l
                              then Ret (if t = X x then t' else t)
                              else m'
                          | subst m' = walk_m subst m'
                     in SOME (contract (subst m))
                    end
                | _ => NONE

       in case boolean_idiom () of   (* can ML express this more elegantly? *)
            SOME m' => m'
          | NONE => (case dead_vars () of
                       SOME m' => m'
                     | NONE => (case simple_body () of
                                  SOME m' => m'
                                | NONE => Loop (l, xs, body, m)))
      end


(******
and contract_loop (l, xs as [mergeval], 
                   body as Branch (Eq, [X test, I 0], tm, fm),
                   m as Branch (p, ts, Jump (tl, [I ti]), Jump (fl, [I fi]))) = 
      if tl = l andalso fl = l 
         andalso ((ti = 0 andalso fi <> 0) orelse (ti <> 0 andalso fi = 0))
         andalso mergeval = test andalso 1 = usage_count (X mergeval, body)
      then contract (Loop (l, [mergeval], 
                           Branch (p, ts, if ti = 0 then tm else fm,
                                          if ti = 0 then fm else tm),
                           Jump (l, [I 0])))
      else Loop (l, xs, body, m)

  | contract_loop (l, xs, body, m as Jump (l', ts)) =    (* this could be more general... *)
      if 0 = foldr (fn (x, sum) => sum + usage_count (X x, body)) 0 xs 
      then body 
      else Loop (l, xs, body, m)

  | contract_loop (l, [t], Ret t', 

  | contract_loop (l, xs, body, m) = 
      Loop (l, xs, body, m)
*******)


fun contract_proc (Lproc (xs, m)) = Lproc (xs, contract m)


end

end
