; (load "2.57.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (make-product (exponent exp)
                         (make-exponentiation (base exp)
                                              (- (exponent exp) 1)))
           (deriv (base exp) var)))
        (else
          (error "unkown expression type" exp))))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponentiation base exponent)
  (cond ((and (number? exponent) (= exponent 0)) 1)
        ((and (number? exponent) (= exponent 1)) base)
        (else (list '** base exponent))))

