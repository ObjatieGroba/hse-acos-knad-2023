	li a7, 5
	ecall # read int
	
	mv t0, a0
	
	ecall # read int
	
	mv t1, a0
	
	sub t2, t0, t1  # t2 = x - y
	slli t2, t2, 3  # t2 <<= 3
	
	mv a0, t2
	li a7, 1
	ecall # write int

	# (x - y) << 3