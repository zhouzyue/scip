(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; 可以将这个过程看成两部分之和
; 1. 除了第一个数外所有数字可能的子集
; 2. 包含第一个数字在内所有数字可能的子集
; 其中 2 就是 1 中每个可能的子集加上第一个数字的集合
