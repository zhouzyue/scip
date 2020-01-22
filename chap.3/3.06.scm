(define rand
  (let ((x 1))
    (define (dispatch m)
      (cond ((eq? m 'generate) 
             (begin (set! x (rand-update x))
                    x))
            ((eq? m 'reset)
             (lambda (y) (set! x y) y))
            (else (error "unknown"))))
    dispatch))

(define (rand-update n)
  (modulo (+ (* 7 n) 97) 31))
