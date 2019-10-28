(define (sqrt x)
	(sqrt-iter 0 1.0 x))

(define (sqrt-iter prev cur x)
	(if (good-enough? prev cur x)
		cur
		(sqrt-iter cur (improve cur x) x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? prev cur x)
	(< (abs (/ (- prev cur) x)) 0.001))
