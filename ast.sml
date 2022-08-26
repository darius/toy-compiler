structure Ast = struct

local open Stuff
in


datatype primop = Add | Sub | Mul | Div | Mod 
                | Eq | Ne | Lt | Le | Gt | Ge

datatype e =               (* expressions *)
    Int of int
  | Var of x
  | Prim of primop * e list
  | App of l * e list       (* l must be a function label *)
  | Jump of l * e list      (* l must be a loop label *)
  | If of e * e * e
  | Let of (x * e) list * e     (* FIXME: changed from x * e * e -- now propagate *)
  | Loop of l * (x * e) list * e

datatype p =                (* procedures *)
    Lambda of x list * e


end

end
