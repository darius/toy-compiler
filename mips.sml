structure Mips = struct

local open Codegen
      open Stuff
in


fun print_proc (stream, f, seq) = 

let fun pi i = TextIO.output (stream, Int.toString i)
    fun ps s = TextIO.output (stream, s)

    fun p_mnem mnem = (ps "\t"; ps mnem; ps "\t")

    fun p_label (L l) = (ps "L"; ps l)

    fun p_q (W 0) = ps "$0"
      | p_q (W i) = pi i
      | p_q (R r) = (ps "$"; pi r)

    fun p_qs [] = ()
      | p_qs [q] = p_q q
      | p_qs (q::qs) = (p_q q; ps ", "; p_qs qs)

    fun p_pushpop (pushing, regs) = 
	  let fun adjust mnem =
		    (p_mnem mnem; ps "$sp, $sp, "; pi (4 * length regs); ps "\n")
	      fun p_each mnem = 
		    app (fn (reg, offset) => 
			  (p_mnem mnem; ps "$"; pi reg; ps ", "; pi offset; ps "($sp)\n"))
			(zip regs (List.tabulate (length regs, fn i => 4 * i)))
	   in if pushing
	      then (adjust "subu"; p_each "sw")
	      else (p_each "lw"; adjust "addu")
	  end

    fun p_instr mnem qs = (p_mnem mnem; p_qs qs; ps "\n")

    fun p_oper (oAdd (r, t, u)) = (p_instr "addu" [R r, t, u])
      | p_oper (oSub (r, t, u)) = (p_instr "subu" [R r, t, u])
      | p_oper (oMul (r, t, u)) = (p_instr "mul"  [R r, t, u])
      | p_oper (oDiv (r, t, u)) = (p_instr "div"  [R r, t, u])
      | p_oper (oMod (r, t, u)) = (p_instr "rem"  [R r, t, u])
      | p_oper (oMov (r, t))    = (p_instr "or"   [R r, R 0, t])
      | p_oper (oBne (l, t, u)) = (p_mnem  "bne"; p_qs [t, u]; ps ", "; p_label l; ps "\n")
      | p_oper (oBge (l, t, u)) = (p_mnem  "bge"; p_qs [t, u]; ps ", "; p_label l; ps "\n")
      | p_oper (oJmp l)         = (p_mnem  "b";   p_label l; ps "\n")
      | p_oper (oJal f)         = (p_mnem  "jal"; p_label f; ps "\n")
      | p_oper (oRet)           = (p_instr "j"    [R 31])
      | p_oper (oPsh rs)        = (p_pushpop (true,  31 :: rs))  (* saving return addr around calls *)
      | p_oper (oPop rs)        = (p_pushpop (false, 31 :: rs))

    fun print_code seq = 
	  app (fn E l    => (p_label l; ps ":\n")
		| O oper => p_oper oper)
	      seq

in
   ps "\t.text\n";
   ps "\t.align\t2\n";
   ps "\t.globl\t"; p_label f; ps "\n";
   p_label f; ps ":\n";

   print_code seq
end


end

end
