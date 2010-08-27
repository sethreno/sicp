(define (f n)
   (if (< n 3) n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3)))
      )
   )
)


(define (fi n)
   (define (f-iter a b c n)
      (if (= n 3) (+ a b c)
          (f-iter 
             (+ a b c)
             (* a 2)
             (* (/ b 2) 3)
             (- n 1)
          )
      )
   )

   (if (< n 3) n
       (f-iter 2 2 0 n)
   )
)
