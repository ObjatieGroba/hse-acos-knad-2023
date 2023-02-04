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
	mv a0, %x
	li a7, 1
	ecall
	popw(a0)
	popw(a7)
	.end_macro
	
	.macro read_int (%x)
	pushw(a7)
	pushw(a0)
	li a7, 5
	ecall
	mv %x, a0
	popw(a0)
	popw(a7)
	.end_macro
	
main:	
	.eqv .x t0
	
	pushw(zero)
	
read_loop:
	read_int(.x)
	pushw(.x)
	beqz .x, end_read_loop
	b read_loop
end_read_loop:

	popw(.x)
	print_int(.x)
write_loop:
	popw(.x)
	beqz .x, end_write_loop
	print_int(.x)
	b write_loop
end_write_loop:


	