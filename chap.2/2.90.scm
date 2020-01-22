; same with implementation of complex package: make-from-real-imag & make-from-mag-ang 

(define (install-sparse-polynomial-package)
  (define (adjoin term term-list)
    ...)
  (put 'adjoin-term 'sparse adjoin)
  'done)

(define (install-dense-polynomial-package)
  (define (tag x) (attach-tag 'dense x))
  (define (adjoin term term-list)
    ...)
  (put 'adjoin-term 'dense adjoin)
  (put 'make-poly 'dense
       (lambda (variable terms) (tag (make-poly variable terms))))
  'done)


