    	.eqv .x, t0
	
	li a7, 5
	ecall # read int
	
        # x / 2
	mv .x, a0
	
	mv a0, .x
	srli a0, a0, 1
	
	li a7, 1
	ecall # write int
	
	li a0, '\n'  # const 10
	li a7, 11
	ecall # write nl
	
	# li t5, 0b001110
    
    # x / 3
    # x / 5
    # x / 31
    