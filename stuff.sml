(* cps-ssa prototype stuff *)

(* use names from the paper's grammars *)

structure Stuff = struct


(* Variable types *)

type variable = string

datatype x = V of variable      (* variables *)

datatype l = L of variable      (* jump or function labels *)

val fresh_variable = 
  let val counter = ref 0
   in fn stem => (counter := !counter + 1; stem ^ "_" ^ (Int.toString (!counter)))
  end


(* Random utilities *)

exception Zip_match

fun zip [] [] = []
  | zip (x::xs) (y::ys) = (x, y) :: zip xs ys
  | zip xs ys = raise Zip_match


end
