structure Ast_alphatize = struct

local open Ast
      open Maps
      open Stuff
in


(* Alpha-convert all bound variables (both x and l type) in m to fresh variables, 
   with further substitutions xenv (on x vars) and lenv (on l labels). 
   After we're done, all bindings in m are to distinct variables. 
   (Further transformations in this compiler should preserve that invariant.) *)

(* FIXME: rename xenv, etc., to tenv, etc. *)
(* FIXME: I don't really like having separate label and variable namespaces... *)

fun alphatize (xenv, lenv, m) =

      let fun xl (V x) = V (lookup xenv x)
          fun ll (L l) = L (lookup lenv l)

          fun walk (Int i)          = Int i
            | walk (Var x)          = Var (xl x)
            | walk (Prim (p, es))   = Prim (p, map walk es)
            | walk (App (l, es))    = App (ll l, map walk es)
            | walk (Jump (l, es))   = Jump (ll l, map walk es)
            | walk (If (p, c, a))   = If (walk p, walk c, walk a)
            | walk (Let (decls, e)) = 
                let val xs    = map (fn (V x, e) => x) decls
                    val xs'   = map fresh_variable xs
                    val xenv' = extend (make_map (xs, xs'), xenv)
                 in Let (map (fn (x', (x, e)) => (V x', walk e)) 
                             (zip xs' decls), 
                         alphatize (xenv', lenv, e))
                end
            | walk (Loop (L l, decls, e)) = 
                let val l'    = fresh_variable l
                    val lenv' = extend1 (l, l', lenv)
                    val xs    = map (fn (V x, e) => x) decls
                    val xs'   = map fresh_variable xs
                    val xenv' = extend (make_map (xs, xs'), xenv)
                 in Loop (L l', 
		          map (fn (V x, e) => (V (lookup xenv' x), walk e)) decls,
                          alphatize (xenv', lenv', e))
                end

       in
       (* TextIO.print "alphatizing:\n";
          Ast_pp.print (TextIO.stdOut, Lambda ([], m));
          TextIO.print "with lenv:\n";
	  Maps.print (TextIO.stdOut, lenv, TextIO.output, TextIO.output);
       *)
          walk m
      end

fun alpha_proc (Lambda (xs, proc)) = 
      Lambda (xs, alphatize (with_default (fn x => x, Maps.empty_map ()), 
                             with_default (fn l => l, Maps.empty_map ()), 
                             proc))

end

end
