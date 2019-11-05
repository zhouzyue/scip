(define (tuple-sum n)
  (define (sum-eq? tuple)
    (= (accumulate + 0 tuple) n))
  (filter sum-eq? (tuple n)))


(define (tuple n)
  (flatmap (lambda (k)
             (flatmap (lambda (j) 
                        (map (lambda (i)
                           (list i j k))
                         (range 1 (- j 1))))
                      (range 2 (- k 1))))
           (range 3 n)))

; 2.40 unique-pairs
(define (tuple2 n)
  (flatmap (lambda (x)
             (map (lambda (y) (cons y x))
                      (range 1 (- (car x) 1))))
           (unique-pairs n)))
