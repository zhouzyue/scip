(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(a b c)

((george))

((y1 y2))

(y1 y2)

false

false

(red shoes blue socks)
