(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (super-get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error "not found")))))

(map (lambda (x) (get-coercion)))

(define (super-get op type-tags)
  (if (get op type-tags)
      (get op type-tags)
      (super-get op )))


(define (iter type-tags)
  (if (null? type-tags)
      '()
      (cons (car type-tags)
            (iter (cdr type-tags)))))
