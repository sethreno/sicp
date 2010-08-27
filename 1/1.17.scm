(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mult a b)
  (define (mult-iter a b remainder)
    (cond ((= b 0) remainder)
          ((= b 1) (+ a remainder))
          ((even? b) (mult-iter (double a) (halve b) remainder))
          ((mult-iter a (- b 1) (+ a remainder)))
    )
  )
  (mult-iter a b 0)
)

;; turns out this was the solution to 1.18
