(define (width t)
  (/ (- (upper-bound t) (lower-bound)) 2))

; (u - l) / 2
; (add-interval x y): [lx + ly, ux + uy]
; (width (add-interval x y)): (ux + uy - lx - ly) / 2 = (ux -lx + uy - ly) / 2 = (+ (width x) (width y))
; (sub-interval x y): [lx - uy, ux - ly]
; (width (sub-interval x y)): (ux - ly - lx + uy) / 2 = (ux - lx + uy - ly) / 2 = (+ (width x) (width y))
; 如果输出结果的宽度是输入区间宽度的函数，以下计算得出的结果应该是相同的，事实并非如此
; ((mul-interval [1, 2] [2, 4])) -> [2, 8] -> 3
; ((mul-interval [-1, 0] [0, 2])) -> [-2, 0] -> 1
