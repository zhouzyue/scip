(define (cube-root x)
	(cube-iter x 1.0))

(define (cube-iter x y)
	(if (good-enough? x y)
	    y
	    (cube-iter x (/ (+ (/ x (square y)) (* 2 y)) 3))))

(define (good-enough? x y)
	(< (abs (- x (* (square y) y))) 0.001))