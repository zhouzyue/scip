(define (remainder-terms l1 l2)
  (cadr (div-terms l1 l2)))

(define (greatest-common-divisor a b)
  (apply-generic 'greatest-common-divisor a b))

(put 'gratest-common-divisor '(scheme-number scheme-number)
     (lambda (a b) (gcd a b)))

(define (gcd-poly a b)
  (if (same-variable? (variable a) (variable b))
      (make-poly (variable a)
                 (gcd-terms (term-list a) (term-list b)))
      (error "different variable")))

(put 'greatest-common-divisor '(polynomial polynomial)
     (lambda (a b) (tab (gcd-poly a b))))
