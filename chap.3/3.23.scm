(define (make-deque)
  (cons '() '()))

(define (front-deque q)
  (car q))

(define (rear-deque q)
  (cdr q))

(define (empty-deque? q)
  (null? (front-deque q)))

(define (node-ptr node)
  (cdr node))

(define (node-val node)
  (car node))

(define (next-node node)
  (cdr (node-ptr node)))

(define (prev-node node)
  (car (node-ptr node)))

(define (front-insert-deque! q item)
  (cond ((empty-deque? q)
         (let ((new-pair (cons item (cons '() '()))))
           (set-car! q new-pair)
           (set-cdr! q new-pair)))
          (else
            (let ((new-pair (cons item (cons '() (front-deque q)))))
              (set-car! (node-ptr (front-deque q)) new-pair)
              (set-car! q new-pair)))))

(define (rear-insert-deque! q item)
  (cond ((empty-deque? q)
         (let ((new-pair (cons item (cons '() '()))))
           (set-car! q new-pair)
           (set-cdr! q new-pair)))
        (else
          (let ((new-pair (cons item (cons (rear-deque q) '()))))
            (set-cdr! (node-ptr (rear-deque q)) new-pair)
            (set-cdr! q new-pair)))))

(define (front-delete-deque! q)
  (cond ((empty-deque? q) (error "empty" q))
        (else
          (let ((next (next-node (front-deque q))))
            (set-car! q next)
            (if (null? next)
                (set-cdr! q next)
                (set-car! (node-ptr next) '()))))))

(define (rear-delete-deque! q)
  (cond ((empty-deque? q) (error "empty" q))
        (else
          (let ((prev (prev-node (rear-deque q))))
            (set-cdr! q prev)
            (if (null? prev)
                (set-car! q prev)
                (set-cdr! (node-ptr prev) '()))))))

(define (print-deque q)
  (define (iter n)
    (cond ((null? n) (display "'()\n"))
          (else
            (display (node-val n))
            (display "<->")
            (iter (next-node n)))))
  (cond ((empty-deque? q) (newline))
        (else
          (display "'()<->")
          (iter (front-deque q)))))

