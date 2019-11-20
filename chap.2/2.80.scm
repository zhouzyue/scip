(define (=zero? x) (apply-generic '=zero? x))

(define (install-scheme-number-zero)
  (put '=zero? '(scheme-number scheme-number)
       (lambda (x) (= x 0)))
  'done)

(define (install-rational-zero)
  (put '=zero? '(rational rational)
       (lambda (x) (= (number x) 0)))
  'done)

(define (install-complex-zero)
  (put '=zero? '(complex complex)
       (lambda (x) (and (= (real-part x) 0)
                        (= (imag-part x) 0))))
  'done)
