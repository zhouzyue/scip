(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

; (define x (cons 1 2))
; (define y (cons x x))
; (define z (cons y y))
; (count-pairs z)
; 7

; (define x (cons 1 2))
; (define y (cons 3 x))
; (define z (cons x y))
; (count-pairs z)
; 4

