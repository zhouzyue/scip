(define (make-interval a b) (cons a b))

(define (upper-bound t)
  (cdr t))

(define (lower-bound t)
  (car t))
