(define (same-parity n1 . nums)
  (define (sp-iter accum remain)
    (cond 
      ((null? remain) accum)
      (else 
        (cond 
          ((equal? (even? n1) (even? (car remain)))
            (sp-iter (append accum (list (car remain))) (cdr remain)))
          (else (sp-iter accum (cdr remain)))))))
  (sp-iter (list) nums))

