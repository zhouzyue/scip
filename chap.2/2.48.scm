(define (make-segment v w)
  (cons v w))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))
