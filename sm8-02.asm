  .macro pushw (%x)
    addi sp, sp, -4
    sw %x, 0(sp)
    .end_macro

    .macro popw (%x)
    lw %x, 0(sp)
    addi sp, sp, +4
    .end_macro

    .macro print_float (%x)
    pushw(a7)
    fmv.s fa0, %x
    li a7, 2
    ecall
    popw(a7)
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
	

    .macro read_float (%x)
    pushw(a7)
    li a7, 6
    ecall
    fmv.s %x, fa0
    popw(a7)
    .end_macro
    
    .data
const:
    .float 0.5
    
    
    .text
    
main:
    .eqv _x fs1
    .eqv _y fs2
    .eqv _ans fs3
    # sqrt (x^2 + y^2)
    
    read_float(_x)
    read_float(_y)
    
    fmul.s _x, _x, _x #fmul.s
    fmul.s _y, _y, _y #fmul.s
    fadd.s _ans, _x, _y
    fsqrt.s _ans, _ans
    
    print_float(_ans)
	
	li a7, 11
	li a0, '\n'
	ecall
    
    la t4, const
    flw fs4 (t4)
    fsub.s _ans _ans fs4
    
    print_float(_ans)
	
	li a7, 11
	li a0, '\n'
	ecall
    
    .eqv _rounded_ans t1
    fcvt.w.s _rounded_ans _ans
    
    
    print_int(_rounded_ans)
	
	li a7, 11
	li a0, '\n'
	ecall
    