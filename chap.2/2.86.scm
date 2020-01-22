; 目前 complex 中的定义使用了常规的算术运算 + - * /
; 需要替换成通用算术来支持其他数值类型

; inside scheme-number package
(put 'sine 'scheme-number
     (lambda (x) (tag (sin x))))
(put 'cosine 'scheme-number
     (lambda (x) (tag (cos x))))

; inside rational package
(put 'sine 'rational
     (lambda (x) (tag (sin (/ (numer x) (denom x))))))
(put 'cosine 'rational
     (lambda (x) (tag (cos (/ (numer x) (denom x))))))

(define (sine x) (apply-generic 'sine x))
(define (cosine x) (apply-generic 'cosine x))
