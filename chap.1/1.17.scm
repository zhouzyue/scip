(define (fast-multi a b)
	(define (double n)
		(+ n n))
	(define (halve n)
		(/ n 2))
	(define (even? n)
		(= (remainder n 2) 0))
	(cond ((= b 0) 0)
		((even? b) (fast-multi (double a) (halve b)))
		(else (+ a (fast-multi a (- b 1))))))
