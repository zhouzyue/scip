(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (x) (iter x)))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.0001))

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  ((iterative-improve (lambda (guess) (close-enough? (square guess) x))
                      (lambda (guess) (average guess (/ x guess)))) 1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (close-enough? x (f x)))
                      (lambda (x) (f x))) first-guess))

(define (sqrt-fixed-point x)
  (define (average x y)
    (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y)))
              1.0))
