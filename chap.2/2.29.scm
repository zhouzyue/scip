(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (if (pair? mobile)
      (+ (iter (branch-structure (left-branch mobile)))
         (iter (branch-structure (right-branch mobile))))
      mobile))

(define (balanced? mobile)
  (define (f branch)
    (* (branch-length branch)
        (total-weight branch)))
  (if (pair? mobile)
      (and (= (f (left-branch mobile))
              (f (right-branch mobile)))
           (balanced? (left-branch mobile))
           (balanced? (right-branch mobile)))
      true))
