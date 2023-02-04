	.macro pushw (%x)
	addi sp, sp, -4
	sw %x, 0(sp)
	.end_macro
	
	.macro popw (%x)
	lw %x, 0(sp)
	addi sp, sp, +4
	.end_macro
	
	
	.macro print_int (%x)
	pushw(a7)
	pushw(a0)
	# addi sp, sp, -8
	# sw a0, (sp)  # 0(sp)
	# sw a7, 4(sp)
	
	mv a0, %x
	li a7, 1
	ecall
	
	popw(a0)
	popw(a7)
	# lw a7, 4(sp)
	# lw a0, (sp)
	# addi sp, sp, 8
	.end_macro

	li a7, -10
	print_int(a7)
	