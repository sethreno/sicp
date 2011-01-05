(define (same-parity n1 . nums)
  (define (spr accum remain)
    (cond ((null? remain) accum)
          (else (cond ((equal? (even? n1) (even? (car remain))) (spr (append accum (list (car remain))) (cdr remain)))
                      (else (spr accum (cdr remain)))))))
  (spr (list) nums))

