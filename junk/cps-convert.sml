structure Cps_convert = 
struct

local open Cps
      open Maps
      open List
      open Stuff
in


(* Symbolic continuations *)

datatype c =
    Cret
  | Cjump of l
  | Clambda of x * m


(* Trivialize: cps-convert a trivial expression. *)

fun is_branch Ast.Eq = true
  | is_branch Ast.Ne = true
  | is_branch Ast.Lt = true
  | is_branch Ast.Ge = true
  | is_branch Ast.Gt = true
  | is_branch Ast.Le = true
  | is_branch _      = false

fun same [x, y] = [x, y]
fun swap [x, y] = [y, x]

fun normalize_branch Ast.Eq = (Eq, same, 1)
  | normalize_branch Ast.Ne = (Eq, same, 0)
  | normalize_branch Ast.Lt = (Lt, same, 1)
  | normalize_branch Ast.Ge = (Lt, same, 0)
  | normalize_branch Ast.Gt = (Lt, swap, 1)
  | normalize_branch Ast.Le = (Lt, swap, 0)
  | normalize_branch _ = raise Match

fun triv_prim Ast.Add = Add
  | triv_prim Ast.Sub = Sub
  | triv_prim Ast.Mul = Mul
  | triv_prim Ast.Div = Div
  | triv_prim Ast.Mod = Mod
  | triv_prim _ = raise Match

fun trivialize (Ast.Int i, cont) = cont (I i)
  | trivialize (Ast.Var x, cont) = cont (X x)
  | trivialize (Ast.Prim (p, es), cont) = 
      trivialize_list (es, fn ts => 
                             let val x = V (fresh_variable "mergeval")
			      in if is_branch p
				 then let val j = L (fresh_variable "merge")
				       in Loop (j, [x], cont (X x),
                                                let val (p', pi, truth) = normalize_branch p
                                                 in Branch (p', pi ts, 
							    Jump (j, [I truth]), 
                                                            Jump (j, [I (1 - truth)]))
                                                end)
				      end
				 else Prim (triv_prim p, ts, x, cont (X x))
                             end)
  | trivialize _ = raise Match

and trivialize_list (es, cont) = 
      let fun accum ([], ts) = cont (rev ts)
            | accum (e::es, ts) = trivialize (e, fn t => accum (es, t::ts))
       in accum (es, [])
      end


(* cps-convert a tailified expression *)

fun convert_trivial (e, c) = 
      trivialize (e, fn t => case c of
                                 Cret => Ret t
                               | Cjump l => Jump (l, [t])
                               | Clambda (x, m') => substitute (t, x, m'))

fun convert (e as Ast.Int _, c)  = convert_trivial (e, c)
  | convert (e as Ast.Var _, c)  = convert_trivial (e, c)
  | convert (e as Ast.Prim _, c) = convert_trivial (e, c)
  | convert (Ast.App (f, args), c) = 
      trivialize_list (args, 
                       fn ts => 
			 case c of 
			     Cret => Jump (f, ts)  (* WATCHOUT: invalid after you add arrays *)
			   | Clambda (x, m) => Prim (Call, F f :: ts, x, m)
			   | Cjump l => let val v = V (fresh_variable "retval")
					 in Prim (Call, F f :: ts, v, Jump (l, [X v]))
					end)
  | convert (Ast.If (pred, con, alt), Clambda (x, m')) = 
      let val j = L (fresh_variable "join")
       in Loop (j, [x], m', convert_if (pred, con, alt, Cjump j))
      end                              
  | convert (Ast.If (pred, con, alt), c) = convert_if (pred, con, alt, c)
  | convert (Ast.Let (decls, m), c) = 
      let fun nest []               = convert (m, c)
            | nest ((x,m) :: decls) = convert (m, Clambda (x, nest decls))
       in nest decls
      end
  | convert (Ast.Loop (l, inits, m), c) = 
      Loop (l, map #1 inits, convert (m, c), 
	    trivialize_list (map #2 inits,
                             fn ts => Jump (l, ts)))
  | convert (Ast.Jump (l, es), c) = 
      trivialize_list (es, fn ts => Jump (l, ts))
    
and convert_if (pred, con, alt, c) = 
      trivialize (pred, fn tpred => 
                          Branch (Eq, [tpred, I 0],
                                  convert (alt, c),
                                  convert (con, c)))


fun convert_proc (Ast.Lambda (xs, m)) = 
     Lproc (xs, convert (m, Cret))

(*
     let val cpsified = convert (m, Cret)
      in TextIO.print "cpsified:\n";
         Cps_pp.print (TextIO.stdOut, Lproc (xs, cpsified));
         let val alphatized = alphatize (empty_map (), empty_map (), cpsified)
          in TextIO.print "alphatized:\n";
             Cps_pp.print (TextIO.stdOut, Lproc (xs, alphatized));
             Lproc (xs, alphatized)
         end
     end
*)

end

end
