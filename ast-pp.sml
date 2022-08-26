structure Ast_pp = struct

local 
  open Ast 
  open Stuff
in


fun print (outstream, e) =

  let fun say s = TextIO.output (outstream, s)

      fun indent 0 = ()
        | indent i = (say "  "; indent (i - 1))

      fun ind d = (say "\n"; indent d)

      fun op_name Add = "+"
        | op_name Sub = "-"
        | op_name Mul = "*"
        | op_name Div = "div"
        | op_name Mod = "mod"
        | op_name Eq  = "="
        | op_name Ne  = "~="
        | op_name Lt  = "<"
        | op_name Le  = "<="
        | op_name Gt  = ">"
        | op_name Ge  = ">="

      fun nest d f [a]    = (ind (d+1); f (d+1, a))
        | nest d f (a::r) = (ind (d+1); f (d+1, a); nest d f r)
        | nest d f []     = ()

      fun p_x (V x) = say x
      fun p_l (L l) = say l

      fun p_decl (d, (x, e))       = (say "Decl "; p_x x; nest d p_e [e])

      and p_e (d, Int i)           = (say "Int ";  say (Int.toString i))
        | p_e (d, Var x)           = (say "Var ";  p_x x)
        | p_e (d, Prim (p, args))  = (say "Prim "; say (op_name p); 
                                                   nest d p_e args)
        | p_e (d, App (l, args))   = (say "App ";  p_l l; nest d p_e args)
        | p_e (d, Jump (l, args))  = (say "Jump "; p_l l; nest d p_e args)
        | p_e (d, If (p, c, a))    = (say "If ";   nest d p_e [p, c, a])
        | p_e (d, Let (decls, b))  = (say "Let ";  nest d p_decl decls; 
                                                   nest d p_e [b])
        | p_e (d, Loop (l, decls, b)) 
                                   = (say "Loop "; p_l l; nest d p_decl decls;
                                                   nest d p_e [b])

      fun p_l (d, Lambda (xs, b))  = (say "Lambda";
                                      app (fn x => (say " "; p_x x)) xs;
                                      nest d p_e [b])

      fun pretty_print_l lambda = p_l (0, lambda)
      fun pretty_print_e exp    = p_e (0, exp)

  in (pretty_print_l e; say "\n")
  end

end 

end
