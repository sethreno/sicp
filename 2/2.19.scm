(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (count-change amount)
  (cc amount us-coins))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount
                        (first-denomination coin-values))
                     coin-values)))))
(define (first-denomination vals)
  (car vals))
(define (except-first-denomination vals)
  (cdr vals))
(define (no-more? vals)
  (= (length vals) 0))

;The order of the list does not affect the answer because all
;combinations are tried regardless. Sorting the list with the
;higher values fist does produce a "smaller" process becuase
;it causes the branches to end more quickly.
