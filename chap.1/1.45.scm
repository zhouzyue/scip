(define (fixed-point f first-guess)
  (define tolerance 0.0001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (expt x n)
  (define (iter x n result)
    (cond ((= n 0) result)
          ((even? n) (iter (square x) (/ n 2) result))
          (else (iter x (- n 1) (* result x)))))
  (iter x n 1))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))


(define (root x n)
  (define (iter x result)
    (if (< x 1)
        (- result 1)
        (iter (/ x 2) (+ result 1))))
  (define (iter-sqrt x)
    (iter x 0))
  (fixed-point ((repeated average-damp (iter-sqrt n)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))



;2 1
;3 1
;4 2
;5 2
;6 2
;7 2
;8 3
;16 4
