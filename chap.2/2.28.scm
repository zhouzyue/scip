; is append expensive?
(define (fringe items)
  (cond ((null? items) items)
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))))

(define (fringe2 items)
  (define (iter items result)
    (cond ((null? items) result)
          ((not (pair? items)) (cons items result))
          (else (iter (car items) (iter (cdr items) result)))))
  (iter items (list)))
