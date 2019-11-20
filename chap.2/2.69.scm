(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set)) 
      (car set)
      (successive-merge (adjoin-set (make-code-tree (car set) 
                              (cadr set)) 
                        (cddr set)))))
