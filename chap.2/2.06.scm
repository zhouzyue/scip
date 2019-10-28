(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;(add one two)
;(add (lambda (f) (lambda (x) (f x))) two)
;(lambda (f) (lambda (x) (f (f x))))
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (multi a b)
  (lambda (f) (lambda (x) ((a (b f)) x))))

;((one square) 2)
;((two square) 2)
;(((add one one) square) 2)
