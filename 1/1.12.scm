;; recursive process for computer pascal's triangle
(define (pascal n)
   (if (= n 0) n
       (+  (* (pascal (- n 1)) 2) 1)))

;; iterative process for computing pascal's triangle
(define (pascal-i n)
   (define (pascal-iter a count)
      (if (= count 0) a
         (pascal-iter
            (+ (* a 2) 1)
            (- count 1))))
   (pascal-iter 0 n))

;; the answer i found online
(define (pascal-o row col)
  (cond ((or (= 0 col) (= row col)) 1)
        (else (+ (pascal-o (- row 1) (- col 1))
                 (pascal-o (- row 1) col)))))

;; I may have misunderstood what the excersice was asking for.
;; All the answers I found online interpreted the exercise as:
;; - given a row and column determine the value of that element.
;; And I thought it meant:
;; - given a depth compute the sum of all elements.

