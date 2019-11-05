(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s)
  (car s))

(define (augend s)
  (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p)
  (car p))

(define (multiplicand p)
  (caddr p))

(define (make-product m n)
  (cond ((or (=number? m 0) (=number? n 0)) 0)
        ((=number? m 1) n)
        ((=number? n 1) m)
        ((and (number? m) (number? n)) (* m n))
        (else (list m '* n))))

(define (make-sum m n)
  (cond ((=number? m 0) n)
        ((=number? n 0) m)
        ((and (number? m) (number? n)) (+ m n))
        (else (list m '+ n))))

(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cddr s)))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cddr p)))
