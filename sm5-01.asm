	.eqv .x t1
	.eqv .y t2
	.eqv .tmp t3
	
	# read x
	li a7, 5
	ecall
	mv .x, a0
	
	# read y
	li a7, 5
	ecall
	mv .y, a0
	

	# if (y>x) swap(x, y)
	
if_start:  # y > x
	bge .x, .y, if_end
           # swap(x, y)
        mv .tmp, .x
        mv .x, .y
        mv .y, .tmp
if_end:
	# output [y, x]
	
loop:
	# print y
	mv a0, .y
	li a7, 1
	ecall
	# print '\n'
	# ... TODO
	# y += 1
	addi .y, .y, 1
	# if y > x: loop_end
	bgt .y, .x, loop_end
	b loop
loop_end:
      	