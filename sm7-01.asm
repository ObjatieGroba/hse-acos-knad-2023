	li a7, 7
	ecall
	
	fsd fa0, dbl, t1
	
	
	la a0, dbl
	addi a0, a0, 4
	lw a0, (a0)
	li a7, 35
	ecall
	
	lw a0, dbl
	li a7, 35
	ecall
	
	li a7, 11
	li a0, '\n'
	ecall
	
	
	la a0, dbl
	addi a0, a0, 7
	lbu a0, (a0)
	
	srli a0, a0, 7
	li a7, 35
	ecall
	
	li a7, 11
	li a0, '\n'
	ecall
	
	
	
	la a0, dbl
	addi a0, a0, 4
	lw a0, (a0)
	
	slli a0, a0, 1  # Стерли знак
	srli a0, a0, 21  # Убираем остаток мантисы 32 + 1 - x = 11
	
	addi a0, a0, -1023
	li a7, 1
	ecall
	
	li a7, 11
	li a0, '\n'
	ecall
	
	
	
	.data
dbl:
	.double 0.0
	
