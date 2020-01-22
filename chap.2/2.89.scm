; (x (3 2 1))
; 3x^2 + 2x + 1

(define (first-term term-list)
  (make-term (- (length term-list) 1)
             (car term-list)))

; suppose only add new term
(define (adjoin-term term term-list)
  (cond ((=zero? (coeff term)) term-list)
        ((= (order term) (length term-list)) 
         (cons (coeff term) term-list))
        (else (cons term (cons 0 term-list)))))
