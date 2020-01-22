(define (raise-up arg)
  (let ((proc (get 'raise (type-tag arg))))
    (if proc
        (proc (content arg))
        false)))

(define (raise-to a b)
  (let ((raised (raise-up a)))
    (if raised
        (if (equal? raised b)
            raised
            (raise-to raised b))
        false)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (if (raise-up a1)
                        (apply-generic op (raise-up a1) (raise-up a1))
                        (error "No method for these types"))
                    (let ((t2 (raise-to a1 a2))
                          (t1 (raise-to a2 a1)))
                      (cond (t2
                              (apply-generic op t2 a2))
                            (t1
                              (apply-generic op a1 t1))
                            (else
                              (error "No method"))))))
              (error "No method for these types" 
                     (list op type-tags)))))))
