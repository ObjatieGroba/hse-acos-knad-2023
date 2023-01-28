	.eqv .x, t0
	.eqv .y, t1
	
	li a7, 5
	ecall # read int
	
	mv .x, a0
	
	ecall # read int
	
	mv .y, a0
	
	# (x - y) << 3
	sub a0, .x, .y  # a0 = x - y
	slli a0, a0, 3  # a0 <<= 3
	
	li a7, 1
	ecall # write int
	
	li a0, '\n'  # const 10
	li a7, 11
	ecall # write nl
	
	
	# (x + 5) + (x - 7)
	.eqv .l, t2
	.eqv .r, t3
	addi .l, .x, 5
	addi .r, .x, -7
	add a0, .l, .r
	
	li a7, 1
	ecall # write int
