structure Ast_tailify = 
struct

local open Ast
      open List
      open Stuff
in


(* 
   Transform an expression so that all nontrivial expressions appear
   either in tail position or bound by a Let.  We try to introduce as few
   new variables as we can, for no good reason. 
   
   Trivial expressions use only Int, Var, and Prim.
*)

exception Bad_loop

fun tailify (Int i)               = Int i
  | tailify (Var x)               = Var x
  | tailify (Prim (p, es))        = headify_list (es, fn es' => Prim (p, es'))
  | tailify (App (f, es))         = headify_list (es, fn es' => App (f, es'))
  | tailify (Jump (l, es))        = headify_list (es, fn es' => Jump (l, es'))
  | tailify (If (pred, con, alt)) = headify (pred, fn p => If (p, tailify con, tailify alt))
  | tailify (Let (decls, body))   = Let (map (fn (x, e) => (x, tailify e)) decls,
                                         tailify body)
  | tailify (Loop (l, decls, body)) = 
      headify_list (map #2 decls,
                    fn es' => Loop (l, zip (map #1 decls) es', tailify body))

and headify (Int i, k)             = k (Int i)
  | headify (Var x, k)             = k (Var x)
  | headify (Prim (p, es), k)      = headify_list (es, fn es' => k (Prim (p, es')))
  | headify (Jump (l, es), k)      = raise Bad_loop
  | headify (Let (decls, body), k) = Let (map (fn (x, e) => (x, tailify e)) decls,
				          headify (body, k))
  | headify (e, k)                 = let val x = V (fresh_variable "$t")
                                      in Let ([(x, tailify e)], k (Var x))
                                     end

and headify_list ([],    ek) = ek []
  | headify_list (e::es, ek) = headify (e, fn e' => 
                                             headify_list (es, fn es' => 
                                                                 ek (e'::es')))

fun tailify_proc (Lambda (xs, e)) = Lambda (xs, tailify e)


end

end

