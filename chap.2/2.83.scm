; inside install-scheme-number package
(put 'raise 'scheme-number 
  (lambda (x) (make-rational x 1)))

; (put 'raise 'rational raise-rational
;   (lambda (x) (make-real (/ (numer x) (denom x)))))

(put 'raise 'rational
  (lambda (x) (make-complex-from-real-imag (/ (numer x) (denom x)) 0)))

(define (raise x)
  (apply-generic 'raise x))
