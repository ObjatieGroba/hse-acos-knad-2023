	.eqv _ptr a1
	# Array of words (4 bytes)
	lw t1, (_ptr)  # Load first element
	lw t1, 4(_ptr)  # Load second element
	
	.eqv _iterator_ptr t3
	mv _iterator_ptr _ptr
	
	lw t1, (_iterator_ptr)  # Load first element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load second element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load 3 element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load 4 element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load 5 element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load 6 element
	addi _iterator_ptr, _iterator_ptr, 4
	lw t1, (_iterator_ptr)  # Load 7 element
	