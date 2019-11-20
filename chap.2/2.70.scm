(define pairs '((A 2)
                (NA 16)
                (BOOM 1)
                (SHA 3)
                (GET 2)
                (YIP 9)
                (JOB 2)
                (WAH 1)))

(define tree (generate-huffman-tree pairs))

(define ly (append '(get a job)
                   '(sha na na na na na na na na)
                   '(get a job)
                   '(sha na na na na na na na na)
                   '(wah yip yip yip yip yip yip yip yip yip)
                   '(sha boom)))

(display (length (encode ly tree)))


; 84
; 2 ^ 3 = 8, so at least: 3 bits * 36 words = 108 bits
