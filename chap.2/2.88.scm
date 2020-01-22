(define (sub-terms L1 L2)
  (add-terms L1 (negative L2)))

(define (negate-terms term-list)
  (if (empty-termlist? term-list)
      '()
      (let ((first (first-term term-list)))
        (adjoin-term (make-term (order first)
                         (negate (coeff first)))
              (negative (reset-termss term-list))))))

; inside package
(put 'negate 'sheme-number
     (lambda (x) (tag (* x -1))))

(put 'negate 'ratinal
     (lambda (x) (make-rational (* -1 (numer x)) (denom x))))

(put 'negate 'complex
     (lambda (x) (make-from-real-imag (* -1 (real-part x))
                                      (* -1 (imag-part x)))))

(put 'negate 'polynomial 
     (lambda (x) (make-poly (variable x)
                            (negate-terms (term-list x)))))

(define (negate x) (apply-generic 'negate x))
