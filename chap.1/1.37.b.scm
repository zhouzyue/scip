(define (cont-frac n d k)
  (define (iter k result)
      (if (= k 0)
          result
          (iter (- k 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(define (check k)
  (cont-frac (lambda (x) 1.0)
             (lambda (x) 1.0)
             k))
