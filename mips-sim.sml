(* Generate C code to simulate MIPS program. *)

structure Mips_sim = struct

local open Codegen
      open Stuff
in


fun print_proc (stream, f, seq) = 

let fun pi i = TextIO.output (stream, Int.toString i)
    fun ps s = TextIO.output (stream, s)

    fun p_label (L l) = (ps "L"; ps l)

    fun p_q (W 0) = ps "0"
      | p_q (W i) = pi i
      | p_q (R 0) = ps "0"
      | p_q (R r) = (ps "r"; pi r)

    fun p_pushpop (pushing, regs) = 
	  let fun adjust oper =
	            (ps ("r30 " ^ oper ^ "= "); pi (4 * length regs); ps ";\n")
	      fun p_each order = 
		    app (fn (reg, offset) => 
			  let val (dest, source) = order ("r" ^ Int.toString reg, 
							  "STACK_REF(" ^ Int.toString offset ^ ")")
			   in ps ("  " ^ dest ^ " = " ^ source ^ ";\n")
			  end)
			(zip regs (List.tabulate (length regs, fn i => 4 * i)))
	   in if pushing
	      then (adjust "-"; p_each (fn (reg, mem) => (mem, reg)))
	      else (p_each (fn (reg, mem) => (reg, mem)); ps "  "; adjust "+")
	  end

    fun p_jump l = (ps "goto "; p_label l; ps ";\n")

    fun p_branch oper [q1, q2] l = 
	  (ps "if ("; p_q q1; ps oper; p_q q2; ps ") "; p_jump l)

    fun p_instr oper dest [q1, q2] = 
	  (p_q (R dest); ps " = "; p_q q1; ps oper; p_q q2; ps ";\n")

    val next_return_point = 
	  let val count = ref (~1)
	   in fn () => (count := !count + 1;
			"ret" ^ Int.toString (!count))
	  end

    fun p_oper (oAdd (r, t, u)) = (p_instr  " + " r [t, u])
      | p_oper (oSub (r, t, u)) = (p_instr  " - " r [t, u])
      | p_oper (oMul (r, t, u)) = (p_instr  " * " r [t, u])
      | p_oper (oDiv (r, t, u)) = (p_instr  " / " r [t, u])
      | p_oper (oMod (r, t, u)) = (p_instr  " % " r [t, u])
      | p_oper (oMov (r, t))    = (p_instr  " | " r [R 0, t])
      | p_oper (oBne (l, t, u)) = (p_branch " != " [t, u] l)
      | p_oper (oBge (l, t, u)) = (p_branch " >= " [t, u] l)
      | p_oper (oJmp l)         = (p_jump l)
      | p_oper (oJal f)         = (let val return = L (next_return_point ())
				    in ps "r31 = (int)&&"; p_label return; ps ";\n";
				       p_jump f; print_code [E return]
				   end)
      | p_oper (oRet)           = (ps "RETURN;\n")
      | p_oper (oPsh rs)        = (p_pushpop (true,  31 :: rs))  (* saving return addr around calls *)
      | p_oper (oPop rs)        = (p_pushpop (false, 31 :: rs))

    and print_code seq = 
	  app (fn E l    => (p_label l; ps ":\n")
		| O oper => (ps "  "; p_oper oper))
	      seq

    fun iota n = 
          let fun loop (0, ls) = ls
                | loop (k, ls) = loop (k - 1, k :: ls)
           in loop (n, [])
	  end

in
   ps "#define STACK_REF(i)  (*(int*)((char*)(r30) + (i)))\n";
   ps "#define RETURN        goto *(void*) (r31)\n\n";
   ps "void sim(int *regs)\n";
   ps "{\n";
   app (fn r => (ps "  int r"; pi r; ps " = regs ["; pi r; ps "];\n"))
       (iota 31);
   ps "  r31 = (int) &&we_are_done;\n";
   print_code (E f :: seq);
   ps "we_are_done: ;\n";
   app (fn r => (ps "  regs ["; pi r; ps "] = r"; pi r; ps ";\n"))
       (iota 31);
   ps "}\n"
end


end

end
