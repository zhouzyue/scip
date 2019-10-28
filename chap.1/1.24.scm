(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (real-time-clock) start-time))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (search-for-prime n count)
	(cond ((= 0 count))
		((even? n) (search-for-prime (+ n 1) count))
		((prime? n) (timed-prime-test n) (search-for-prime (+ 2 n) (- count 1)))
		(else (search-for-prime (+ 2 n) count))))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)))

(define (prime? n)
	(fast-prime? n 1000))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m))
				m))
			(else
				(remainder (* base (expmod base (- exp 1) m))
					m))))

; 超过两倍，猜测是由于大数运算的时间不是常数，会带来额外的时间花费