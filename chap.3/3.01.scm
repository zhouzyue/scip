(define (make-accumulator init)
  (lambda (next)
    (begin (set! init (+ init next))
           init)))
