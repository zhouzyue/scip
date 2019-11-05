(define (split a b)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split a b) painter (- n 1))))
          (a (b smaller smaller))))))

; (define right-split (split beside below))
