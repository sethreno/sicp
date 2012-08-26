;; sicp ex 5.4.a
;; register machine for:
;; (a recursive process)
(define (expt b n)
	(if (= n 0)
		1
		(* b (expt b (- n 1 )))))

;; {1}-->/-\-->[n]-->(=)<--{0}
;;  |     ^     |
;;  |     |-----|
;;  v     
;; [v]<--    [stack]
;;  |   |     |   ^
;;  v   |     v   |
;; /*\---   [continue]
;;  ^         ^   ^
;;  |         |   |
;; [b]  {after}   {done}

(controller
	(assign continue (label done))
 loop
	(test (op =) (reg n) (const 0))
	(branch (label bottom))
	(assign n (op -) (reg n) (const 1))
	(save continue)
	(assign continue (label after))
	(goto (label loop))
 after
	(restore continue)
	(assign v (op *) (reg v) (reg b))
	(goto (reg continue))
 bottom
	(assign v (const 1))
	(goto (reg continue))
 done)

;; register and stack contents for (expt 3 3)
;; *-----------------------------------------------*
;; |  v | b | n | continue | stack                 |
;; *-----------------------------------------------*
;; |    | 3 | 3 | done     | 
;; |    | 3 | 2 | after    | done
;; |    | 3 | 1 | after    | done : after
;; |    | 3 | 0 | after    | done : after : after
;; | 1  | 3 | 0 | after    | done : after : after
;; | 3  | 3 | 0 | after    | done : after
;; | 9  | 3 | 0 | after    | done
;; | 27 | 3 | 0 | after    |
;; *------------------------------------------------

;; sicp ex 5.4.b
;; register machine for:
;; (an iterative process)
(define (expt b n)
	(define (expt-iter counter product)
		(if (= counter 0)
			product
			(expt-iter (- counter 1) (* b product))))
	(expt-iter n 1))

;; We can use the same machine as 5.4.a without the
;; stack and continue register.
;;
;; {1}-->/-\-->[n]-->(=)<--{0}
;;  |     ^     |
;;  |     |-----|
;;  v     
;; [v]<-- 
;;  |   |
;;  v   |
;; /*\--- 
;;  ^
;;  | 
;; [b] 

(controller
	(assign v (const 1))
 loop
	(test (op =) (reg n) (const 0))
	(branch (label done))
	(assign v (op *) (reg v) (reg b))
	(assign n (op -) (reg n) (const 1))
	(goto (label loop))
 done)

;; register and stack contents for (expt 3 3)
;; *------------*
;; |  v | b | n | 
;; *------------*
;; | 1  | 3 | 3 |
;; | 3  | 3 | 2 |
;; | 9  | 3 | 1 |
;; | 27 | 3 | 0 |
;; *------------*

