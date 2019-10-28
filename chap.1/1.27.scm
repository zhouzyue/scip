(define (check n)
	(inner-check n 2))

(define (inner-check n a)
	(cond ((= a n) true)
		((= (expmod a n n) a) (inner-check n (+ 1 a)))
		(else false)))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m))
				m))
			(else
				(remainder (* base (expmod base (- exp 1) m))
					m))))