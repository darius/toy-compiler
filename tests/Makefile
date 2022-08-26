CFLAGS = -O2

CFILES = fact.c fib.c gcd.c hairy-if.c \
         hotpo-flat.c hotpo.c iter-fact.c iter-fib.c \
         prime-induct.c \
         prime.c prime0.c shadow.c steele-if.c tak.c

EXES   = fact fib gcd hairy-if \
         hotpo-flat hotpo iter-fact iter-fib \
         prime-induct \
         prime prime0 shadow steele-if tak

RUNTIME = ../runtime/scaffold.o ../runtime/libdjb.o

all: $(EXES)

okay:
	for f in $(EXES); do echo $$f:; ./check $$f; done

clean:	
	rm *~ *.alpha *.ast *.cps *.opt *.regs *.s *.tail *.c *.o $(EXES)

blah:		blah.o $(RUNTIME)
dupvars:	dupvars.o $(RUNTIME)
fact:		fact.o $(RUNTIME)
fib:		fib.o $(RUNTIME)
gcd:		gcd.o $(RUNTIME)
hairy-if:	hairy-if.o $(RUNTIME)
hotpo-flat:	hotpo-flat.o $(RUNTIME)
hotpo:		hotpo.o $(RUNTIME)
iter-fact:	iter-fact.o $(RUNTIME)
iter-fib:	iter-fib.o $(RUNTIME)
nest:		nest.o $(RUNTIME)
nest1:		nest1.o $(RUNTIME)
nest2:		nest2.o $(RUNTIME)
nest3:		nest3.o $(RUNTIME)
nested-loops:	nested-loops.o $(RUNTIME)
prime-induct:	prime-induct.o $(RUNTIME)
prime:		prime.o $(RUNTIME)
prime0:		prime0.o $(RUNTIME)
shadow:		shadow.o $(RUNTIME)
steele-if:	steele-if.o $(RUNTIME)
tak:		tak.o $(RUNTIME)
test:		test.o $(RUNTIME)
