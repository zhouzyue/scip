(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ".")
  (display (y-point p))
  (display ")"))

(define (make-segment point-x point-y)
  (cons point-x point-y))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (define (average a b)
    (/ (+ a b) 2))
  (let ((a (start-segment s))
        (b (end-segment s)))
    (make-point (average (x-point a)
                         (x-point b))
                (average (y-point a)
                         (y-point b)))))

;(define s (make-segment (make-point 0 0)
;                        (make-point 4 4)))
;(print-point (midpoint-segment s))
