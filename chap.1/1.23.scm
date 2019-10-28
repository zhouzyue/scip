(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (next test-divisor)))))

(define (next n)
	(if (= n 2)
		(+ 1 n)
		(+ 2 n)))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n)))


; 不符合, 会有额外的过程调用的开销、 (= n 2) 的判断开销等等