(define (make-rat n d)
  (cond ((or (and (> n 0) (< d 0))
             (and (< n 0) (< d 0))) (cons (* -1 n) (* -1 d)))
        (else (cons n d))))
