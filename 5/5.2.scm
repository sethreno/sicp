(controller
  init
  	(assign c (const 1))
	(assign p (reg c))
  test-c-gt-n
  	(test (op >) (reg c) (reg n))
	(branch (label done))
	(assign p (op *) (reg p) (reg c) )
	(assign c (op +) (reg c) (const 1))
	(goto (label test-c-gt-n))
  done)
	
