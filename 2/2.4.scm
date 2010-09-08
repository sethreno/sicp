; cons returns a method that expects a method as a parameter (m)
; this method expects two parameters x & y
(define (cons x y)
  (lambda (m) (m x y)))

; car expects the method created by cons as a paramter and
; returns the result of calling this method passing in a new
; method that takes two parameters and returns the first
(define (car z)
  (z (lambda (p q) p)))

; cdr expects the method created by cons as a paramter and
; returns the result of calling this method passing in a new
; method that takes two parameters and returns the second
(define (cdr z)
  (z (lambda (p q) q)))

