	.data
free_dd:
	.word 0x10040000
	
	.macro pushw (%x)
	addi sp, sp, -4
	sw %x, 0(sp)
	.end_macro
	
	.macro popw (%x)
	lw %x, 0(sp)
	addi sp, sp, +4
	.end_macro
	
	.macro alloci(%ptr, %size)
	pushw(t1)
	pushw(t2)
	lw %ptr, free_dd
	
	lw t1, free_dd
	addi t1, t1, %size
	sw t1, free_dd, t2
	popw(t2)
	popw(t1)
	.end_macro
	
	
	.text
main:
	alloci(t0, 16)
	