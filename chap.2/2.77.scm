; (magnitude (complex z))
; -> (apply-generic 'magnitude (complex z))
; -> ((get 'magnitude 'complex) (rectangular z))
; -> (magnitude (rectangular z))
; -> (apply-generic 'magnitude (rectangular z))
; -> ((get 'magnitude 'rectangular) '(3 4))

; twice
