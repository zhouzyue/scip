(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.0001)

; (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)
; (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)
