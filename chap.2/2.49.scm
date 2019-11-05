(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

(define edge->painter
  (segments->painter (list (make-segment (make-vector 0 0) (make-vector 1 0))
                           (make-segment (make-vector 0 0) (make-vector 0 1))
                           (make-segment (make-vector 1 0) (make-vector 1 1))
                           (make-segment (make-vector 0 1) (make-vector 1 1)))))

