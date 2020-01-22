(define (coerce-list l target)
  (map (lambda (x) 
         (let ((t->target (get-coercion x target)))
           (if t->target
               t->target
               x)))
       l))

(define (apply-generic op . args)
  (define (apply-coerced remaining-type-tags)
    (if (null? remaining-type-tags)
        (error "not found")
        (let ((type-tags (map type-tag args)))
          (let ((coerced (coerce-list type-tags (car remaining-type-tags))))
            (let ((proc (get op coerced)))
              (if proc
                  (apply proc (map contents args))
                  (apply-coerced (cdr remaining-type-tags))))))))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (apply-coerced type-tags)))))


; all coercions:
; (define (apply-generic op . args)
;   (let ((type-tags (map type-tag args)))
;     (let ((procs (get-procs op type-tags)))
;       (if (null? procs)
;           (error "not found")
;           (apply (car procs) (map contents args))))))

; (define (get-procs op type-tags)
;   (filter (lambda (x) x)
;           (map (lambda (x) (get op x)) 
;                (coerced-list type-tags type-tags))))

; (define (coerced-list remaining tags)
;   (if (null? remaining)
;       '()
;       (map (lambda (x) 
;              (if (null? (cdr remaining))
;                  x
;                  (map (lambda (y) (cons x y))
;                       (coerced-list (cdr remaining) tags))))
;            (coercions (car remaining) tags))))

; (define (coercions target tags)
;   (filter (lambda (x) x)
;           (cons target 
;                 (map (lambda (x) (get-coercion target x)) tags))))

