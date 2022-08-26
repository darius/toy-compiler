(* The cps language *)

structure Cps = struct

local open Stuff
in 


datatype t =         (* trivial values *)
    X of x 
  | I of int     (* FIXME: strictly speaking, should be I of 32-bit word... *)
  | F of l       (* used only by the Call instruction, and l must be a function (not a loop) *)

datatype branchop = Eq | Lt

datatype primop = 
    Add | Sub | Mul | Div | Mod 
  | Call
    
datatype m = 
    Ret of t
  | Jump of l * t list
  | Prim of primop * t list * x * m
  | Branch of branchop * t list * m * m
  | Loop of l * x list * m * m

datatype proc =
    Lproc of x list * m


(* walk_m f m returns m with each direct m-subexpression m' replaced by (f m'). *)

fun walk_m f (Ret t)                  = Ret t
  | walk_m f (Jump (l, ts))           = Jump (l, ts)
  | walk_m f (Prim (p, ts, x, m))     = Prim (p, ts, x, f m)
  | walk_m f (Branch (p, ts, tm, fm)) = Branch (p, ts, f tm, f fm)
  | walk_m f (Loop (l, xs, body, m))  = Loop (l, xs, f body, f m)


(* Substitute t for x in m.
   Pre: t is not bound in m. *)

(* FIXME: make it a simultaneous substitution, so it's useful for beta-expansion. *)

fun substitute (t, x, m) = 
      let fun s (X x') = if x = x' then t else X x'
            | s t'     = t'

          val ss = map s

          fun walk (Ret t)                  = Ret (s t)
	    | walk (Jump (l, ts))           = Jump (l, ss ts)
	    | walk (Prim (p, ts, x, m))     = Prim (p, ss ts, x, walk m)
	    | walk (Branch (p, ts, tm, fm)) = Branch (p, ss ts, walk tm, walk fm)
	    | walk (Loop (l, xs, body, m))  = Loop (l, xs, walk body, walk m)
       in walk m
      end


end

end
