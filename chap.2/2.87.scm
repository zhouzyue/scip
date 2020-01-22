; 2.80 =zero?
(define (zero-poly? poly)
  (define (zero-terms? termlist)
    (if (empty-termlist? termlist) 
        true
        (and (=zero? (coeff (first-term termlist)))
             (zero-poly? (rest-terms termlist)))))
  (zero-terms? (term-list termlist)))

(put '=zero? 'polynomial zero-poly?)
