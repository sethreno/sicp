(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n) 
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (cond ((< start end)
     (timed-prime-test start)
     (search-for-primes (+ start (if (even? start) 1 2)) end)
  ))
)

(newline)
(display " *** 1,000,000,000,000 ")
(search-for-primes 1000000000000 1000000000100)
(newline)
(display " *** 10,000,000,000,000 ")
(search-for-primes 10000000000000 10000000000100)
(newline)
(display " *** 100,000,000,000,000 ")
(search-for-primes 100000000000000 100000000000100)

;; 1.23.scm runs 1.38 times faster thant 1.22.scm due to the
;; performance improvements made to find-divisor.
;; 
;; It's not 2x faster because of the additional step added by
;; the next procedure.
