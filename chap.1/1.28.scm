(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((and (> base 1) (< base (- exp 1)) (= (remainder (square base) m) 1)) 0)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m))
				m))
			(else
				(remainder (* base (expmod base (- exp 1) m))
					m))))

(define (miller-rabin n)
	(define (iter n a)
		(cond ((= n a) true)
			((= (expmod a (- n 1) n) 1) (iter n (+ 1 a)))
			(else false)))
	(iter n 1))