(define (print-tests tests)
  (for-each (lambda (output+inputs)
	      (write (car output+inputs))
	      (write-char #\tab)
	      (for-each (lambda (input) 
			  (write input)
			  (write-char #\space))
			(cdr output+inputs))
	      (newline))
	    tests))

(define (make-regression-tests fn inputs)
  (map (lambda (input) (cons (apply fn input) input))
       inputs))

(define (pairs-less-than N)
  (tensor-product (iota N) (iota N)))

(define (iota N)
  (let loop ((k N) (ls '()))
    (if (= k 0)
	ls
	(loop (- k 1) (cons (- k 1) ls)))))

(define (tensor-product ls1 . lists)
  (if (null? lists)
      (map list ls1)
      (flatmap (lambda (rest) (map (lambda (item1) (cons item1 rest)) ls1))
	       (apply tensor-product lists))))

(define (flatmap fn ls)
  (apply append (map fn ls)))

(define (flagify n)
  (not (= 0 n)))


;; Equivalents of test programs:
;; (N.B. Equivalence guaranteed only for sufficiently small numbers.)

(define (fact n)
  (if (= n 0) 1 (* n (fact (- n 1)))))

(define (fib n)
  (let recur ((i 1) (a 1) (b 1))
    (if (<= n i)
	a
	(recur (+ i 1) (+ a b) a))))

(define hairy-if
  (lambda (p q r x y)
    (if (not (and (flagify p) (flagify q) (not (flagify r))))
	x
	y)))

(define (hotpo-period k)
  (let loop ((p 0) (k k))
    (if (= k 1)
	p
	(loop (+ p 1) 
	      (if (even? k)
		  (quotient k 2)
		  (+ (* 3 k) 1))))))

(define (dandiest-under limit)
  (let loop ((best-start 1) (best-period 0) (k limit))
    (if (= k 1)
	best-start
	(let ((p (hotpo-period k)))
	  (if (<= best-period p)
	      (loop k p (- k 1))
	      (loop best-start best-period (- k 1)))))))

(require 'factor)			;for PRIME?

(define (shadow x y)
  (let* ((x (+ x y))
	 (y (- x y)))
    y))

(define (steele-if x y z)
  (if (if (flagify x) (flagify y) (flagify z)) 42 137))

(define (tak x y z)
  (if (<= x y)
      z
      (tak (tak (- x 1) y z)
           (tak (- y 1) z x)
           (tak (- z 1) x y))))


;; Now the tests themselves:

(define (print-em filename tests)
  (display "printing ")
  (display filename)
  (newline)
  (with-output-to-file filename (lambda () (print-tests tests))))

(define (fact-tests)
  (make-regression-tests fact (map list (iota 13))))

(print-em "expected.fact" (fact-tests))

(print-em "expected.iter-fact" (fact-tests))

(define (fib-tests)
  (make-regression-tests fib (map list (iota 14))))

(print-em "expected.fib" (fib-tests))

(print-em "expected.iter-fib" (fib-tests))

(define (gcd-tests N)
  (make-regression-tests 
   gcd
   (append (map (lambda (pair) (map (lambda (k) (- k N)) pair))
		(pairs-less-than (* 2 N)))
	   (list (list (fib 20) (fib 21)))
	   '((243 1342)
	     (4312 444445762)
	     (8659765 1233509)
	     (9387 34457)
	     (464608964 6404098)
	     (4320789 0234981)
	     (53103247 74092)
	     (23165 10632)
	     (1061246342 68411235)
	     (1839042 094873290)
	     (43210 4890321)))))

(print-em "expected.gcd" (gcd-tests 6))

(define (hairy-if-tests)
  (make-regression-tests hairy-if
			 (tensor-product (iota 2) (iota 2) (iota 2) '(42) '(137))))

(print-em "expected.hairy-if" (hairy-if-tests))

(define (hotpo-tests)
  (make-regression-tests hotpo-period 
			 (map (lambda (x) (list (+ x 1))) (iota 100))))

(print-em "expected.hotpo" (hotpo-tests))

(define (hotpo-flat-tests)
  (make-regression-tests dandiest-under '((60000))))

(print-em "expected.hotpo-flat" (hotpo-flat-tests))

(define (prime-tests)
  (make-regression-tests (lambda (n) (if (prime? n) 1 0))
			 (map list (iota 100))))

(print-em "expected.prime0" (prime-tests))

(print-em "expected.prime" (prime-tests))

(print-em "expected.prime-induct" (prime-tests))

(define (shadow-tests)
  (make-regression-tests shadow '((5 2) (43 7))))

(print-em "expected.shadow" (shadow-tests))

(define (steele-if-tests)
  (make-regression-tests steele-if (tensor-product (iota 2) (iota 2) (iota 2))))

(print-em "expected.steele-if" (steele-if-tests))

(define (tak-tests)
  (make-regression-tests tak '((18 12 6))))

(print-em "expected.tak" (tak-tests))
