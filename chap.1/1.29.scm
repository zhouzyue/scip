(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
		   (sum term (next a) next b))))

(define (simpson f a b n)
	(define h
		(/ (- b a) n))
	(define (next x)
		(+ x (* 2 h)))
	(* (/ h 3.0)
	   (+ (f a)
	   	  (f b)
	   	  (* 4.0 (sum f (+ a h) next b))
	   	  (* 2.0 (sum f (+ a (* 2 h)) next (- b h))))))
