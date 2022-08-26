#include "libdjb.h"

#include <stdio.h>

#define STACK_SIZE 65536

extern void sim (int *);


static void 
dump_regs (FILE *out, int *regs)
{
  int i;
  for (i = 0; i < 16; ++i)
    fprintf (out, "r[%2d] = %d\tr[%2d] = %d\n", 
	     i, regs [i], 16 + i, regs [16 + i]);
}

static int 
run (int argc, char **argv, int *regs, void *stack)
{
  /* Initialize the registers. */
  {
    int i, arg_reg = 4;
    for (i = 0; i < 32; ++i)
      regs [i] = 0;

    for (i = 1; i < argc; ++i, ++arg_reg)
      regs [arg_reg] = parse_int (argv [i]);

    regs [30] = (int) stack + STACK_SIZE;
  }

  /* Run the simulation. */
  sim (regs);

  /* Check invariants. */
  if (regs [30] != (int) stack + STACK_SIZE)
    error ("Unbalanced stack!\n");

  if (regs [0] != 0)
    error ("Zero reg nonzero! (%d)", regs [0]);

  return regs[2];
}

int 
main (int argc, char **argv)
{
  void *stack;
  int regs[32];
  int do_dump = 0;
  int result;

  stack = allot (STACK_SIZE);

  if (strcmp (argv [1], "dump") == 0)
    do_dump = 1;

  result = run (argc - do_dump, argv + do_dump, regs, stack);

  if (do_dump)
    dump_regs (stderr, regs);
  printf ("%d\n", result);

  return 0;
}
