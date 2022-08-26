structure Codegen = struct

local open Cps
      open Cps_freevars
      open Maps
      open Stuff

      open List
in


(* 
   Register assignment: create a map assigning a register # to each cps variable.
   If two variables are both free in the same subexpression, they must use distinct
   registers.  

   Originally we created any old map satisfying that constraint.  To try to minimize
   register shuffling, we now:

    - locally target procedure params and returns and jump params.
    - assign other vars from other end of the available list

   (Actually we don't target for local jumps yet.  Maybe when we do the results won't
   be quite so disappointing.  The real problem, though, is that saves/restores and
   shuffling are too abstract in this phase; best to represent them explicitly.)
*)

val registers = [4,5,6,7,8,9,10,11]        (* arg and temp registers, in order *)

val return_reg = 2
val temp_reg   = 3

val argument_regs = registers
val random_regs = rev registers   (* reverse order to help avoid conflicts with args *)


(* Return register assignments for procedure parameters xs. *)

fun bind_params xs = make_map (xs, take (argument_regs, length xs))

(* 
   Add assignments for xs to env that don't conflict with xs'. 
   preference: x -> (int list, int list) returns a pair of good and bad choices.
   For each x we prefer choices in the first list, over ones in neither, over ones
   in the second list.  (Choices in both lists are considered only in the first...  (except for return_reg)
   I should at least prefer the ones in `good' that aren't in `bad', to the ones
   in both -- not implemented yet.  Also note that the targeter/antitargeter data
   gathering doesn't follow jumps...)
*)

(* 
   If we want to admit the return register into the allocation pool, we need to ensure 
   it never gets preserved across a Call.  The rule would be: target x in Ret (X x) 
   or Prim (Call, ts, x, m) unless there is a Call anywhere in x's live range.  The live
   range must account for jumps, of course.

   Ought to work without these painful cases when we allocate at the assembly level instead.
*)

fun bind (xs, xs', env, preference) =
      let val conflict_vars = Sets.intersect (xs', domain env)
          val avail_regs = Sets.difference (random_regs, map (lookup env) conflict_vars)
          val good_and_bad = map preference xs

          val (regs, _) = foldr (fn (x, (regs, avail)) => 
                                  let fun try candidates fail_k = 
                                        case find (fn r => Sets.member (r, avail)) candidates of
                                          SOME r => (r :: regs, Sets.difference (avail, [r]))
                                        | NONE => fail_k ()
                                      val (good, bad) = preference x
                                      val first = good
                                      val second = Sets.difference (Sets.difference (avail, bad),
                                                                    good)
                                      val third  = bad
                                   in try first
                                          (fn () => 
                                             try second
                                                 (fn () => 
                                                    try third
                                                        (fn () => 
                                                           raise (Fail "out of regs"))))
                                  end)
                                ([], avail_regs)
                                xs

       in TextIO.output (TextIO.stdOut,
			 "bind " ^ (foldr (fn (V x, str) => x ^ " " ^ str) "" xs)
			         ^ ";"
			         ^ (foldr (fn (V x, str) => x ^ " " ^ str) "" xs')
			         ^ " => "
			         ^ (foldr (fn (r, str) => (Int.toString r) ^ " " ^ str) "" regs)
			         ^ "\n");
	  Maps.print (TextIO.stdOut, env,
		      fn (strm, V x) => TextIO.output (strm, x),
		      fn (strm, r)   => TextIO.output (strm, Int.toString r));
	  extend (make_map (xs, regs), env)
      end

fun is_local_label l = 
      Sets.member (l, domain (!jump_env))     (* ugh *)

fun combine ((good, bad), (good', bad')) = (good @ good', bad @ bad')

fun target_call (r, x, ts) = 
      ([],
       Sets.flatmap (fn (reg, X x') => if x' = x then [reg] else []
                      | (_, _) => [])
                    (zip (take (argument_regs, length ts)) ts))

fun target (r, x, Ret t) = 
      if t = X x then ([], []) else ([], [])

  | target (r, x, Jump (l, ts)) = 
      if is_local_label l
      then ([], [])    (* can be improved using r *)
      else target_call (r, x, ts)

  | target (r, x, Prim (Call, (F _) :: ts, _, m)) = 
      combine (target_call (r, x, ts), target (r, x, m))

  | target (r, x, Prim (p, ts, _, m))    = target (r, x, m)

  | target (r, x, Branch (_, _, tm, fm)) = combine (target (r, x, tm), target (r, x, fm))

  | target (r, x, Loop (_, _, body, m))  = combine (target (r, x, body), target (r, x, m))


fun assign_m (Ret t, env)                  = env
  | assign_m (Jump (l, ts), env)           = env

  | assign_m (Prim (p, ts, x, m), env)     = 
      assign_m (m, bind ([x], free_vars m, env,
                         (fn x => target (env, x, m))))

  | assign_m (Branch (p, ts, tm, fm), env) = 
      assign_m (tm, assign_m (fm, env))

  | assign_m (Loop (l, xs, body, m), env) =
      let val l_fv = lookup (with_default (fn _ => raise (Fail "bug: missing label"), 
					   (!jump_env)))
	                    l
          val env' = bind (xs, l_fv, env, 
                           fn x => combine (target (env, x, body), target (env, x, m)))
       in assign_m (m, assign_m (body, env'))
      end

fun assign_registers (Lproc (xs, m)) = 
      (
(*           TextIO.print "starting update_jump_env\n";  *)
       update_jump_env m;
(*
       Maps.print (TextIO.stdOut, 
                   !jump_env,
                   fn (out, L l) => TextIO.output (out, l),
                   fn (out, xs) => app (fn (V x) => TextIO.output (out, x)) xs);
*)  
       assign_m (m, bind_params xs))


(* 
   Jobs of the code generator:
    - linearize the cps tree
    - choose registers and instructions
    - calling sequences -- save/restore, load standard argument registers
*)

datatype q = R of int | W of int

datatype oper = 
    oAdd of int * q * q 
  | oSub of int * q * q 
  | oMul of int * q * q 
  | oDiv of int * q * q 
  | oMod of int * q * q
  | oMov of int * q 
  | oBne of l * q * q
  | oBge of l * q * q
  | oJmp of l
  | oJal of l
  | oRet
  | oPsh of int list
  | oPop of int list

datatype line = O of oper | E of l


(*    
   Generate move instructions from each q to the corresponding reg, and append seq.
   Pre: the regs are distinct, and length regs = length qs.

   The catch is, qs and regs may overlap; in such a case naively generating moves in
   any old order might clobber a register before it's used.  So we do a topological sort 
   where r <- x precedes x <- y:

         0. Filter out any self-assignments.
   loop: 1. If any assignments remain, find a LHS that doesn't occur on any RHS.
         2a. If none, pick any a <- b, generate t <- a, replace all RHS's of a with t, and loop.
         2b. Else generate the pair with that LHS, remove it from the set, and loop.

   Note -- it's probably a good idea in 2a to pick the LHS that occurs in the most RHSs.
   Try that out later.

   Loads of the same constant might be worth special-casing...
   Remember this'll have to work with a mixture of int and fp registers.
   Assigning to fp regs must be interesting on the x86.
*)

fun moves (regs, qs, seq) =
       let fun find_unused pairs = 
                 find (fn (reg, rhs) => all (fn (_, rhs') => rhs' <> R reg) pairs)
                      pairs
           fun replace_rhs (old, new, pairs) = 
                 map (fn (lhs, rhs) => (lhs, if rhs = old then new else rhs)) pairs
           fun loop ([], assigns) = rev assigns
             | loop (pairs as ((r,rhs)::_), assigns) = 
                 (case find_unused pairs of
                      NONE => loop (replace_rhs (R r, R temp_reg, pairs), 
                                    O (oMov (temp_reg, R r)) :: assigns)
                    | SOME pair => loop (Sets.remove (pair, pairs), 
                                         O (oMov pair) :: assigns))
           val pairs = filter (fn (_,   W _) => true
                                | (reg, R r) => reg <> r)
                              (zip regs qs)
        in loop (pairs, []) @ seq
       end

fun move (reg, q, seq) = moves ([reg], [q], seq)


(* Translate a cps t-value to an instruction field, using register map r. *)

fun q r (I i) = W i
  | q r (X x) = R (lookup r x)
  | q r _     = raise Match

(* Generate seq1 followed by seq2, with clobbered registers preserved across seq1. *)

fun wrap_save_restore (clobbered, seq1, seq2) = 
      O (oPsh clobbered) :: seq1 @ (O (oPop clobbered) :: seq2)

(* Place parameters ts in the proper function-argument registers for a call. *)

fun gen_params (r, ts, seq) = 
      moves (take (argument_regs, length ts), map (q r) ts, seq)

(* Primitive and branch operations. *)

fun gen_prim (_, Add, [u, v], x, r, seq) = O (oAdd (lookup r x, q r u, q r v)) :: seq
  | gen_prim (_, Sub, [u, v], x, r, seq) = O (oSub (lookup r x, q r u, q r v)) :: seq
  | gen_prim (_, Mul, [u, v], x, r, seq) = O (oMul (lookup r x, q r u, q r v)) :: seq
  | gen_prim (_, Div, [u, v], x, r, seq) = O (oDiv (lookup r x, q r u, q r v)) :: seq
  | gen_prim (_, Mod, [u, v], x, r, seq) = O (oMod (lookup r x, q r u, q r v)) :: seq
  | gen_prim (m, Call, F f :: ts, x, r, seq) = 
      let val clobbered = map (lookup r) (Sets.remove (x, free_vars m))
       in wrap_save_restore (clobbered, 
                             gen_params (r, ts, [O (oJal f)]), 
			     move (lookup r x, R return_reg, seq))
      end
  | gen_prim _ = raise Match

fun gen_branch (Eq, [u, v], l, r, seq) = O (oBne (l, q r u, q r v)) :: seq
  | gen_branch (Lt, [u, v], l, r, seq) = O (oBge (l, q r u, q r v)) :: seq
  | gen_branch _ = raise Match

(* Return a map from all labels to their parameter lists. *)

fun label_param_map (Ret _)                  = empty_map ()
  | label_param_map (Jump _)                 = empty_map ()
  | label_param_map (Prim (p, ts, x, m))     = label_param_map m
  | label_param_map (Branch (p, ts, tm, fm)) = extend (label_param_map tm, label_param_map fm)
  | label_param_map (Loop (l, xs, body, m))  = extend1 (l, xs, extend (label_param_map body,
                                                                       label_param_map m))

(* Generate asm code for m with register map r. *)

fun codegen_with (m, r) = 
      let open Sets

	  val label_reg_map = 
            (* A map from labels to register lists assigned to their parameters. *)
            let val pmap = label_param_map m
             in make_map (domain pmap, map (map (lookup r)) (range pmap))
            end

	  val label_body_map = 
	        let fun walk (Ret _) = empty_map ()
		      | walk (Jump _) = empty_map ()
		      | walk (Prim (_, _, _, m)) = walk m
		      | walk (Branch (_, _, tm, fm)) = extend (walk tm, walk fm)
		      | walk (Loop (l, _, body, m)) = 
		         extend1 (l, body, extend (walk body, walk m))
		 in walk m
		end

	  val labels_generated = ref (empty_set : l list) (* lack of abstraction is glaring *)

          fun loop (Ret t) = 
                move (return_reg, q r t, [O oRet])

            | loop (Jump (l, ts)) = 
                if member (l, domain label_reg_map)      (* Jump to a local label? *)
                then moves (lookup label_reg_map l, 
			    map (q r) ts, 
			    if member (l, !labels_generated)
		   	    then [O (oJmp l)]
(*
				 case seq of
				   E l' :: _ => (* eliminate (some) jumps to the next instr *)
				                (* actually I don't think this happens anymore *)
				     if l' = l then seq else [O (oJmp l)]
				 | _ => [O (oJmp l)]
*)
			    else (labels_generated := l :: !labels_generated;
				  E l :: loop (lookup label_body_map l)))
                else gen_params (r, ts, [O (oJmp l)])    (* Tail call to a procedure. *)

            | loop (Prim (p, ts, x, m)) = 
                gen_prim (m, p, ts, x, r, loop m)

            | loop (Branch (p, ts, tm, fm)) = 
                let val f_asm = loop fm
		    val t_asm = loop tm
		    val l = L (fresh_variable "target")
                 in gen_branch (p, ts, l, r, t_asm @ (E l :: f_asm))
                end

            | loop (Loop (l, xs, body, m)) = loop m

       in loop m
      end

(* Generate asm code for a procedure. *)

fun codegen (p as Lproc (xs, m)) = codegen_with (m, assign_registers p)


end

end
