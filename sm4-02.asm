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
	
	# bge .x, .y, greater
	# blt .x, .y, lower
	# b lower
	blt .x, .y, lower
	# else greater or equal

greater:
	# x - y
	sub a0, .x, .y
	# b end
        jal end

lower:
	# x + y
	add a0, .x, .y
	# b end

end:
	li a7, 1
	ecall
	
	# jal zero, label
	# li a7, 1
	# li a7, 1
	# li a7, 1
label:

