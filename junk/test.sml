open Stuff

local open Ast
in 
val test = 
  let val [limit, i, c, x, c'] = map V ["limit", "i", "c", "x", "c'"]
      val f = L "f"
      val l = L "l"
   in Lambda ([limit],
       Loop (l, [(i, Int 0), (c, Int 0)],
	If (Prim (Eq, [Var i, Var limit]),
	    Var c,
	    Let ([(c', If (Prim (Eq, [App (f, [Var i]), Int 0]),
			   Prim (Add, [Var c, Int 1]),
			   Var c))],
	      Jump (l, [Prim (Add, [Var i, Int 1]), Var c'])))))
  end
end

val cp = Cps_convert.convert_proc (Ast_tailify.tailify_proc test)

open Codegen

val env = assign_registers cp

val cg = codegen cp

val dummy = Mips.print_proc (TextIO.stdOut, L "countzeros", cg)


(*
val [(proclabel, proc)] = Parse.parse "tests/test.toy"

val cp' = Cps_convert.convert_proc (Ast_tailify.tailify_proc proc)
val env' = assign_registers cp'
val cg' = codegen cp'
val dummy' = Mips.print_proc (TextIO.stdOut, proclabel, cg')
*)
