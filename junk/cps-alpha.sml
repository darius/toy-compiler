(* Alpha-convert all bound variables (both x and l type) in m to fresh variables, 
   with further substitutions xenv (on x vars) and lenv (on l labels). 
   After we're done, all bindings in m are to distinct variables. 
   (Further transformations in this compiler should preserve that invariant.) *)

(* FIXME: rename xenv, etc., to tenv, etc. *)

fun alphatize (xenv, lenv, m) =

      let val xenv = with_default (fn v => v, xenv)
          val lenv = with_default (fn l => l, lenv)

          val ll = lookup lenv

          fun xl (I i) = I i
            | xl (F f) = F (lookup lenv f)
            | xl (X x) = X (lookup xenv x)

          fun alpha (cons, decons, env, vs) =
                let val vs' = map (fn v => cons (fresh_variable (decons v))) vs
                 in (vs', extend (make_map (vs, vs'), env))
                end

          fun unV (V v) = v
          fun unL (L l) = l

          fun walk (Ret t)                  = Ret (xl t)
	    | walk (Jump (l, ts))           = Jump (ll l, map xl ts)
	    | walk (Prim (p, ts, x, m))     = let val ([x'], xenv') = alpha (V, unV, xenv, [x])
                                               in Prim (p, map xl ts, x', 
                                                        alphatize (xenv', lenv, m))
                                              end
	    | walk (Branch (p, ts, tm, fm)) = Branch (p, map xl ts, walk tm, walk fm)
	    | walk (Loop (l, xs, body, m))  = let val (xs',  xenv') = alpha (V, unV, xenv, xs)
                                                  val ([l'], lenv') = alpha (L, unL, lenv, [l])
                                               in Loop (l', xs', alphatize (xenv', lenv', body), 
                                                        alphatize (xenv, lenv', m))
                                              end
       in TextIO.print "alphatizing:\n";
          Cps_pp.print (TextIO.stdOut, Lproc ([], m));
          TextIO.print "with lenv:\n";
	  Maps.print (TextIO.stdOut, 
                      lenv,
                      fn (out, Stuff.L l) => TextIO.output (out, l),
                      fn (out, Stuff.L l) => TextIO.output (out, l));
          walk m
      end

