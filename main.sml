structure Toy = 
struct


fun with_output_file (filename, receiver) = 
      let val stream = TextIO.openOut filename
       in receiver stream;
          TextIO.closeOut stream
      end

fun compile file_stem = 
      let val sourcefile = file_stem ^ ".toy"
          val ast_file   = file_stem ^ ".ast"
          val alpha_file = file_stem ^ ".alpha"
          val tail_file  = file_stem ^ ".tail"
          val cps_file   = file_stem ^ ".cps"
	  val contracted_file = file_stem ^ ".opt"
	  val regs_file  = file_stem ^ ".regs"
          val asm_file   = file_stem ^ ".s"
	  val c_file     = file_stem ^ ".c"

          val [(proclabel, proc)] = Parse.parse sourcefile

       in TextIO.output (TextIO.stdOut, "compiling " ^ file_stem ^ "\n");
	  with_output_file (ast_file,
                            fn out => Ast_pp.print (out, proc));
          let val alphatized = Ast_alphatize.alpha_proc (proc)
           in with_output_file (alpha_file, 
                                fn out => Ast_pp.print (out, alphatized));
              let val tailified = Ast_tailify.tailify_proc alphatized
               in with_output_file (tail_file, 
                                    fn out => Ast_pp.print (out, tailified));
                  let val cps = Cps_convert.convert_proc tailified
                   in with_output_file (cps_file, 
                                        fn out => Cps_pp.print (out, cps));
                      let val contracted = Cps_contract.contract_proc cps
                       in with_output_file (contracted_file, 
                                            fn out => Cps_pp.print (out, contracted));
			  let val reg_map = Codegen.assign_registers contracted  (* for debugging *)
			   in with_output_file 
				(regs_file,
				 fn out => 
				   Maps.print (out, reg_map, 
					       fn (out, Stuff.V x) => TextIO.output (out, x),
					       fn (out, reg) => 
                                                 TextIO.output (out, Int.toString reg)))
			  end;
			  let val cg = Codegen.codegen contracted
			   in with_output_file 
				(asm_file,
				 fn out => Mips.print_proc (out, proclabel, cg));
			      with_output_file
			        (c_file,
				 fn out => Mips_sim.print_proc (out, proclabel, cg))
                          end
                      end
                  end
              end
          end 
      end

fun regress () = 
      app compile ["tests/dupvars", "tests/fact", "tests/fib", "tests/gcd", 
                   "tests/hotpo-flat", "tests/hotpo", 
                   "tests/iter-fact", "tests/iter-fib", "tests/nest", "tests/nest1", 
                   "tests/nest2", "tests/nest3", "tests/nested-loops", "tests/prime", 
                   "tests/prime0", "tests/prime-induct", "tests/shadow", "tests/tak", 
                   "tests/test", "tests/blah", "tests/hairy-if", "tests/steele-if"]


end
