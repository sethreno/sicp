(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (count-powers power n count)
  (if (= (remainder n power) 0)
    (count-powers power (/ n power) (+ count 1))
    count))

(define (car n)
  (count-powers 2 n 0))

(define (cdr n)
  (count-powers 3 n 0))

