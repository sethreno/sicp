(define (timed-prime-test n) 
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
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

(define (fast-prime? n times)
  (define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
  (define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(newline)
(display " *** 10^12 ")
(search-for-primes (expt 10 12) (+ (expt 10 12) 100))
(newline)
(display " *** 10^15 ")
(search-for-primes (expt 10 15) (+ (expt 10 15) 100))
(newline)
(display " *** 10^18 ")
(search-for-primes (expt 10 18) (+ (expt 10 18) 100))

;; expected time increase
;;log2 (10^12) = 43.18
;;log2 (10^15) = 53.15 | 1.23
;;log2 (10^18) = 63.11 | 1.19

;; actual time increase
;;10^12 + 39 = 18.25
;;10^15 + 37 = 24.24 | 1.32
;;10^18 + 31 = 29.59 | 1.22

;; The time it takes to test primes n : n*1000 behaved exactly as expected.
