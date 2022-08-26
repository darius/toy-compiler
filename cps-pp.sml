structure Cps_pp = struct

local open Cps
      open Stuff
in


fun print (outstream, e) =

  let fun say s = TextIO.output (outstream, s)

      fun indent 0 = ()
        | indent i = (say " "; indent (i - 1))

      fun ind d = (say "\n"; indent d)

      fun branch_name Eq = "="
        | branch_name Lt = "<"

      fun op_name Add  = "+"
        | op_name Sub  = "-"
        | op_name Mul  = "*"
        | op_name Div  = "div"
        | op_name Mod  = "mod"
        | op_name Call = "call"

      fun nest d f [a]    = (ind (d+1); f (d+1, a))
        | nest d f (a::r) = (ind (d+1); f (d+1, a); nest d f r)
        | nest d f []     = ()

      fun dolist f ls = app (fn x => (say " "; f x)) ls

      fun p_x (V x) = say x
      fun p_l (L l) = say l

      fun p_t (X x) = (p_x x)
        | p_t (I i) = (say "#"; say (Int.toString i))
        | p_t (F l) = (p_l l)

      fun continue d x m  = (say "\t-> "; p_x x; nest d p_m [m])
(*
      and p_c (d, Cret)            = (say "Cret")
        | p_c (d, Cjump l)         = (say "Cjump "; p_l l)
        | p_c (d, Clambda (x, m))  = (say "Clambda"; continue d x m)
*)
      and p_m (d, Ret t)                  = (say "Ret "; p_t t)
        | p_m (d, Jump (l, ts))           = (say "Go "; p_l l; dolist p_t ts)
        | p_m (d, Prim (p, ts, x, m))     = (say (op_name p); 
                                             dolist p_t ts; continue d x m)
        | p_m (d, Branch (p, ts, tm, fm)) = (say "If "; say (branch_name p);
                                             dolist p_t ts; nest d p_m [tm, fm])
        | p_m (d, Loop (l, xs, body, m))  = (say "Loop "; p_l l;  dolist p_x xs; 
					     nest d p_m [m];
					     ind d; p_l l; say ":";
                                             nest d p_m [body])

      fun p_l (d, Lproc (xs, m))   = (say "Lproc"; dolist p_x xs; nest d p_m [m])

      fun pretty_print_l lambda = p_l (0, lambda)
      fun pretty_print_m cexp   = p_m (0, cexp)

  in (pretty_print_l e; say "\n")
  end

end 

end
