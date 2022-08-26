structure Cps_contract = struct

local open Cps
      open Maps
      open Stuff
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

and contract_branch (p, [I i, I i'], tm, fm) = 
      (case p of
	 Eq => if i = i' then tm else fm
       | Lt => if i < i' then tm else fm)
  | contract_branch (p, ts, tm, fm) = 
      Branch (p, ts, tm, fm)

and contract_loop (l, xs, body, m) = 

      let fun dead_vars () = 
          (* Loop (l, xs, body, Jump (l, ts)) ==> body, if xs aren't used in body. *)
          (* Probably not needed, since the codegen optimizes out the jump... *)
                case m of
                  Jump (l', ts) => 
                    if 0 = foldr (fn (x, sum) => sum + usage_count (X x, body)) 0 xs 
                    then SOME body 
                    else NONE
                | _ => NONE

	  (* FIXME: alphatize the result, and rewrite Cps.substitute so you can use it here. *)
	  fun beta_expand (ts, xs, m) = 
	        let val tmap = pairs_map (zip (map X xs) ts)
		    val r    = lookup (with_default (fn t' => t', tmap))
                    fun walk (Ret t)                  = Ret (r t)
		      | walk (Jump (l, ts))           = Jump (l, map r ts)
		      | walk (Prim (p, ts, x, m))     = Prim (p, map r ts, x, walk m)
		      | walk (Branch (p, ts, tm, fm)) = Branch (p, map r ts, walk tm, walk fm)
		      | walk (Loop (l, xs', body, m)) = Loop (l, xs', walk body, walk m)
		 in walk m
		end

          fun simple_body () =
          (* Loop (l, xs, <simple>, ... Jump (l, ts') ...) ==> ... <simple'> ...
              where simple' is the beta-expansion of the jump. *)
                if case body of
		     Ret t => false (* true *)
                   | Jump (l', ts') => l' <> l
                   | Branch (p, ts, Jump (l', ts'), Jump (l'', ts'')) => 
                       xs <> [] andalso l' <> l andalso l'' <> l 
		                andalso length ts' <= 1 andalso length ts'' <= 1  (* pretty crude... *)
		       (* still need to worry about blowup... *)
		   | _ => false
		then let fun subst (m' as Jump (l', ts')) =
			       if l' = l
			       then beta_expand (ts', xs, body)
			       else m'
			   | subst m' = walk_m subst m'
                      in SOME (contract (subst m))
		     end
		else NONE
		    
	  fun hoisted_too_high () = 
	        NONE
	  (* This is incorrect: 
	  (* Loop (l, xs, Loop (l', [], body', m'), m) => 
             Loop (l', [], body', Loop (l, xs, m', m)), 
	     if body' has no refs to l. *)
	        (case body of
		  Loop (l', [], body', m') => 
		    if 0 = usage_count (F l, body')
		    then SOME (contract (Loop (l', [], body', Loop (l, xs, m', m))))
		    else NONE
		 | _ => NONE)
	  *)

       in
	  case hoisted_too_high () of   (* can ML express this more elegantly? *)
            SOME m' => m'
          | NONE =>
                    (case dead_vars () of
                       SOME m' => m'
                     | NONE => (case simple_body () of
                                  SOME m' => m'
                                | NONE => Loop (l, xs, body, m)))
      end


fun contract_proc (Lproc (xs, m)) = Lproc (xs, contract m)


end

end
