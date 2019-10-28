(define (product term a next b)
	(if (> a b) 
		1
		(* (term a) (product term (next a) next b))))

(define (factorial n)
	(define (term x) x)
	(define (next x) (+ x 1))
	(product term 1 next n))

(define (pi)
	(define (next x)
		(+ x 2))
	(* 4.0
		(product (lambda (x) (/ x (+ x 1))) 2 next 1000)
		(product (lambda (x) (/ x (- x 1))) 4 next 1002)))