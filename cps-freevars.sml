structure Cps_freevars = 
struct

local open Cps
      open Maps
      open List
      open Stuff
in


(* Free variables -- variables used in an expression, but not bound in it.
   (A Jump is considered to use the free variables of its target, too.  This
   means we need to iterate to find the least fixed point of the free-variable
   function.) *)

(* Yuck, this needs work. *)


fun fixpoint (same, f, value) = 
      let val value' = f value
       in if same (value, value')
          then value
          else fixpoint (same, f, value')
      end

(* Free vars of each jump target. *)

val jump_env = ref (with_default (fn _ => [], empty_map ())): (l, x list) map ref 

local open Sets

      fun fv bvs (I _) = empty_set
	| fv bvs (F f) = empty_set                  (* functions are always known, currently *)
	| fv bvs (X x) = if member (x, bvs) then empty_set else singleton x

      fun fvs bvs xs = flatmap (fv bvs) xs

in 
   fun combine_jump_envs (l, env1, env2) =                  (* ugh *)
         let fun pickout ([], [], fv, env) = (fv, env)
               | pickout (l'::ls, fv'::fvs, fv, env) = 
                   if l' = l 
                   then pickout (ls, fvs, fv', env)
                   else pickout (ls, fvs, fv, extend1 (l', fv', env))
               | pickout _ = raise Match
             val (fv1, env1') = pickout (domain env1, range env1, [], empty_map ())
             val (fv2, env2') = pickout (domain env2, range env2, [], empty_map ())
          in extend1 (l, union (fv1, fv2), extend (env1', env2'))
         end
           
   fun loop_fv (l, xs, body, lmap) = 
         let fun done fs = extend1 (l, fs, empty_map ())
             fun vs fs bs t = union (fvs bs t, fs)
             fun w (bs, fs, Ret t)                  = done (vs fs bs [t])
	       | w (bs, fs, Jump (l, ts))           = done (vs (union (fs, difference (lmap l, bs)))
                                                               bs ts)
	       | w (bs, fs, Prim (p, ts, x, m))     = w (x::bs, vs fs bs ts, m)
	       | w (bs, fs, Branch (p, ts, tm, fm)) = combine_jump_envs (l, w (bs, vs fs bs ts, tm),
									    w (bs, vs fs bs ts, fm))
	       | w (bs, fs, Loop (l, xs, body, m))  = extend (w (bs, fs, m),
                                                              loop_fv (l, xs, body, lmap))
          in w (xs, empty_set, body)
         end

   fun free_vars m = 
     (* Return a list of the variables that are live blah blah... *)
         let val lmap = lookup (!jump_env)
             fun vs fs bs t = union (fvs bs t, fs)
             fun w (bs, fs, Ret t)                  = vs fs bs [t]
	       | w (bs, fs, Jump (l, ts))           = vs (union (fs, difference (lmap l, bs))) bs ts
	       | w (bs, fs, Prim (p, ts, x, m))     = w (x::bs, vs fs bs ts, m)
	       | w (bs, fs, Branch (p, ts, tm, fm)) = w (bs, w (bs, vs fs bs ts, fm), tm)
	       | w (bs, fs, Loop (l, xs, body, m))  = w (bs, fs, m)
          in w (empty_set, empty_set, m)
         end

   fun print_env env = 
         Maps.print (TextIO.stdOut, 
		     env,
		     fn (out, L l) => TextIO.output (out, l),
		     fn (out, xs) => app (fn (V x) => TextIO.output (out, x)) xs)

   val fixpoint_fv = 
        let val dummy = L (fresh_variable "dummy")
          in fn (m, lenv) => 
	       let fun same (env, env') =
		        (
(*
			 TextIO.output (TextIO.stdOut, "from: (I think)\n");
			 print_env env;
			 TextIO.output (TextIO.stdOut, "to: \n");
			 print_env env';
*)
		         (* equals (map_to_set env, map_to_set env') *)
		         let val s  = map_to_set env
			     val s' = map_to_set env'
			     fun subset (s, s') = 
				   List.all (fn (l, fvs) => 
					       exists (fn (l', fvs') => 
						         l' = l andalso equals (fvs', fvs))
					              s')
				            s
			  in subset (s, s') andalso subset (s', s)
			 end
			)

		   fun next env = 
		         (
			 print_env env;  
		         loop_fv (dummy, [], m, 
				  lookup (with_default (fn _ => [], env)))
			 )
		in fixpoint (same, next, lenv)
	       end
         end

   fun update_jump_env m = 
         jump_env := with_default (fn _ => [],     (* wow, how ugly can this get? *)
                                   fixpoint_fv (m, empty_map ()))

end


end

end
