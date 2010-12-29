(define (reverse x)
  (define (reverse-i x y)
    (if (= (length x) 0) y
      (reverse-i (cdr x) (append (list (car x)) y))))
  (reverse-i x (list)))

