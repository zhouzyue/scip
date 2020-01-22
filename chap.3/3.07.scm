(load "3.03.scm")

(define (make-joint account password new-password)
  (lambda (x y)
    (if (eq? x new-password)
        (account password y)
        (lambda (x) "Incorrect password"))))
