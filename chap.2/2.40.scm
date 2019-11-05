(define (unique-pairs n)
  (flatmap (lambda (j) 
         (map (lambda (i) 
                (list i j)) 
              (range 1 (- j 1)))) 
       (range 2 n)))

(define (flatmap proc seq)
  (accumulate append (list) (map proc seq)))

(define (range a b)
  (cond ((> a b) (list))
        ((< a b) (cons a (range (+ a 1) b)))
        (else (list b))))

; prime?
; (load "../chap.1/1.22.scm")

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum 
       (filter prime-sum? 
               (unique-pairs n))))
