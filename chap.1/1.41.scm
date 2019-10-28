(define (double f)
  (lambda (x) (f (f x))))

(define (inc a)
  (+ 1 a))

