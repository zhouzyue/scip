(define (variable? x) (symbol? x))

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (make-sum m n)
  (cond ((=number? m 0) n)
        ((=number? n 0) m)
        ((and (number? m) (number? n)) (+ m n))
        (else (list '+ m n))))

(define (make-product m n)
  (cond ((or (=number? m 0) (=number? n 0)) 0)
        ((=number? m 1) n)
        ((=number? n 1) m)
        ((and (number? m) (number? n)) (* m n))
        (else (list '* m n))))

(define (install-sum-package)
  (define (addend s) (car s))
  (define (augend s) 
    (if (null? (cddr s))
        (cadr s)
        (cons '+ (cdr s))))
  (define (sum-deriv operands var)
    (make-sum (deriv (addend operands) var)
              (deriv (augend operands) var)))

  (put 'deriv '+ sum-deriv)
  'done)

(define (install-product-package)
  (define (multiplier p) (car p))
  (define (multiplicand p) 
    (if (null? (cddr p))
        (cadr p)
        (cons '* (cdr p))))
  (define (product-deriv operands var)
    (make-sum (make-product (multiplier operands)
                            (deriv (multiplicand operands) var))
              (make-product (deriv (multiplier operands) var)
                            (multiplicand operands))))

  (put 'deriv '* product-deriv)
  'done)

(define (install-exponent-package)
  (define (make-exponentiation base exponent)
    (cond ((and (number? exponent) (= exponent 0)) 1)
          ((and (number? exponent) (= exponent 1)) base)
          (else (list '** base exponent))))
  (define (base e)
    (car e))
  (define (exponent e)
    (cadr e))
  (define (exponent-deriv operands var)
    (make-product 
      (make-product (exponent operands)
                    (make-exponentiation (base operands)
                                         (- (exponent operands) 1)))
      (deriv (base operands) var)))

  (put 'deriv '** exponent-deriv)
  'done)

(install-sum-package)
(install-product-package)
(install-exponent-package)

; d. (put '+ 'deriv make-sum)
