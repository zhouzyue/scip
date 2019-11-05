(define (variable? x) (symbol? x))

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (make-product m n)
  (cond ((or (=number? m 0) (=number? n 0)) 0)
        ((=number? m 1) n)
        ((=number? n 1) m)
        ((and (number? m) (number? n)) (* m n))
        (else (list '* m n))))

(define (make-sum m n)
  (cond ((=number? m 0) n)
        ((=number? n 0) m)
        ((and (number? m) (number? n)) (+ m n))
        (else (list '+ m n))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) 
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) 
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))
