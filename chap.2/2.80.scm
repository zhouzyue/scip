(define (=zero? x) (apply-generic '=zero? x))

(define (install-scheme-number-zero)
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0)))
  'done)

(define (install-rational-zero)
  (put '=zero? '(rational)
       (lambda (x) (= (denom x) 0)))
  'done)

(define (install-complex-zero)
  (put '=zero? '(complex)
       (lambda (x) (and (= (real-part x) 0)
                        (= (imag-part x) 0))))
  'done)
