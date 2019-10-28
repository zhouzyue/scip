; (a b) = 2^a * 3^b

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (max-divisor x n)
  (define (iter x r)
    (if (= (remainder x n) 0)
        (iter (/ x n) (+ r 1))
        r))
  (iter x 0))

(define (car z)
  (max-divisor z 2))

(define (cdr z)
  (max-divisor z 3))
