(define (square x) (* x x))
(define (sum-squares x y) (+ (square x) (square y)))
(define (sum-top-2-squares x y z)
   (cond 
      ((and (<= z x) (<= z y))(sum-squares x y))
      ((and (<= y x) (<= y z))(sum-squares x z))
      ((and (<= x y) (<= x z))(sum-squares y z))
   )
)

(define (sum-square-max x y z)
   (if (and (<= x y) (<= x z))
      (sum-squares y z)
      (sum-square-max y z x)
   )
)

