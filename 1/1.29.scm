(define (integral f a b n)
  (define (h (/ (- b a) n)))
  (define (y k) ((f (+ a (* k h))))
