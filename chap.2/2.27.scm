(define (deep-reverse items)
  (define (iter items result)
    (cond ((null? items) result)
          ((not (pair? items)) items)
          (else (iter (cdr items) (cons (iter (car items) (list)) result)))))
  (iter items (list)))

; clean solution but I think it's an expensive way
(define (deep-reverse2 items)
  (if (pair? items)
      (append (deep-reverse2 (cdr items)) (list (deep-reverse2 (car items))))
      items))
