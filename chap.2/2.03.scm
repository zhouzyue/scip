;(load "2.2.scm")

(define (make-rect bottom right)
  (cons bottom right))

(define (make-rect2 bottom height)
  (define bottom-right
    (end-segment bottom))
  (let ((top-right (make-point (x-point bottom-right)
                               (+ (y-point bottom-right) height))))
    (cons bottom (make-segment bottom-right top-right))))

(define (len s)
  (sqrt (+ (square (- (x-point (end-segment s))
                      (x-point (start-segment s))))
           (square (- (y-point (end-segment s))
                      (y-point (start-segment s)))))))

(define (bottom r)
  (car r))

(define (right r)
  (cdr r))

(define (perimeter r)
  (* (+ (len (bottom r))
        (len (right r)))
     2))

(define (area r)
  (* (len (bottom r))
     (len (right r))))
