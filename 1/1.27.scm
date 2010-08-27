(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))


(fermat-test 561 3)
(fermat-test 1105 3)
(fermat-test 1729 3)
(fermat-test 2465 3)
(fermat-test 2821 3)
(fermat-test 6601 3)

