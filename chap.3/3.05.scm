(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
          (/ trials-passed trials))
         ((experiment)
          (iter (- trials-remaining 1) (+ trials-passed 1)))
         (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (rect-square x1 x2 y1 y2)
  (* (- x2 x1) (- y2 y1)))

(define (circle x y)
  (<= (+ (square (- x 1)) (square (- y 1))) 1))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (* (rect-square x1 x2 y1 y2)
     (monte-carlo trials (lambda () 
                            (P (random-in-range x1 x2)
                               (random-in-range y1 y2))))))

(define (estimate-pi trials)
  (/ (estimate-integral circle 0 2.0 0 2.0 trials) 1))
