(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons (list) mat))

(define (matrix-*-matrx m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector m v)) m)))
