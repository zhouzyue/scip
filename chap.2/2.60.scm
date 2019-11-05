; element-of-set - same

(define (adjoin-set x set)
  (cons x set))

; intersection-set - same

(define (union-set set1 set2)
  (append set1 set2))
