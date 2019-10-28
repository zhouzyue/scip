; recursive
(define (f n)
  (if (< n 3) 
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; iterate
(define (f n)
  (iter-f 0 1 2 n))
(define (iter-f a b c count)
	(if (= count 0)
		a
		(iter-f b c (+ (* 3 a) (* 2 b) c) (- count 1))))
