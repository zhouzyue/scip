(define (filtered-accumulater filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

(define (prime-sum a b)
  (filtered-accumulater prime? + 0 (lambda (x) x) a (lambda (x) (+ 1 x)) b))

(define (prime-sum2 n)
  (define (gcd? i)
    (= 1 (gcd i n)))
  (filtered-accumulater gcd? + 0 (lambda (x) x) 1 (lambda (x) (+ 1 x)) (- 1 n)))
