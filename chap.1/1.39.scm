(define (tan-cf x k)
  (* (/ (cont-frac (lambda (i) (* -1 (square x)))
             (lambda (i) (- (* 2 i) 1))
             k) x) -1.0))
