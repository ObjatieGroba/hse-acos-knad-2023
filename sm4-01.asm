	.eqv .x t1
	.eqv .y t2
	
	# read x
	li a7, 5
	ecall
	mv .x, a0
	
	# read y
	li a7, 5
	ecall
	mv .y, a0
	
	bge .x, .y, greater
	blt .x, .y, lower

greater:
	# x - y
	sub a0, .x, .y
	li a7, 1
	ecall
	b end

lower:
	# x + y
	add a0, .x, .y
	li a7, 1
	ecall
	b end

end:
