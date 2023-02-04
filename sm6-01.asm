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


fib:    # a0 is n
	# if a0 < 2: return a0
	li t1 2
	bge a0 t1 else
	ret
	# else return fib(a0-1) + fib(a0-2)
else:
	.eqv .l s1
	.eqv .r s2
	.eqv .n s3
	
	pushw(ra)
	pushw(.l)
	pushw(.r)
	pushw(.n)
	mv .n a0
	
	# call fib(a0-1)
	addi a0 .n -1
	jal fib
	mv .l a0
	
	# call fib(a0-2)
	addi a0 .n -2
	jal fib
	mv .r a0
	
	add a0 .l .r
	
	popw(.n)
	popw(.r)
	popw(.l)
	popw(ra)
	
	ret  # jalr zero 0(ra)

	
	.globl main
main:
	read_int(a1)
	mv a0 a1
	jal fib
	print_int(a0)
	