(define (project-rational n)
  (make-scheme-number (round (/ (numer n) (denom n)))))

(define (project-complex n)
  (make-rational (real-part n) 1))

(define (drop n)
  (let ((proc (get 'project (type-tag n))))
    (if proc
        (let ((dropped (proc (content n))))
          (if (equ? (raise-up dropped) n)
              dropped
              false))
        false)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          ;...
