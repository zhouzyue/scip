(define (pseudoremainder-terms p q)
  (let ((o1 (order (first-term p)))
        (o2 (order (first-term q)))
        (c (coeff (first-term q))))
    (cadr (div-terms (mul-terms (make-term 0 (expt c (+ 1 (- o1 o2))))
                          p)
                     q))))


(define (gcd-terms a b)
  (if (empty-termlist? b)
      (simplify a)
      (gcd-terms b (pseudoremainder-terms a b))))

(define (simplify a)
  (let ((coeff-list (map cadr a)))
    (div-terms a (make-term 0 (apply gcd coeff-list)))))
