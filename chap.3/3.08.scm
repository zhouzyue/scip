(define (f n)
  (let ((wait-init true)
        (val 0))
    (if wait-init
        (set! val n))
    val))
