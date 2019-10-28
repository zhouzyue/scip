(define (div-interval x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
    (error "divide by 0" y)
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))
