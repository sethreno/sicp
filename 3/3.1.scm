; sicp ex 3.1
(define (make-accumulator a)
  (lambda (b)
	(set! a (+ a b))
	  a))

; sicp ex 3.2
(define (make-monitored f)
  (let ((count 0))
	(begin (set! count (+ count 1))
	f)))

