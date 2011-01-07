(define (bad-square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))
;This procedure produces the list in the reverse order because it passes the
;list as the second parameter to cons.

(define (bad-square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
;This doesn't work as intended becaue it passes the answer list as the first
;parameter to cons which produces a multi-demensional list. It could be fixed
;by calling append instead (see below).

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer 
                      (list (square (car things)))))))
  (iter items nil))

