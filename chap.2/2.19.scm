(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (no-more? coin-values)
  (null? coin-values))

; 不会影响
; 因为该算法将问题拆解成两部分：
; 1. 包含第一种硬币在内可以获得的兑换方式数量
; 2. 加上不包含第一种硬币在内，全部使用其他硬币的兑换方式的数量
; 表 coin-values 排列的顺序的不会影响这两部分
