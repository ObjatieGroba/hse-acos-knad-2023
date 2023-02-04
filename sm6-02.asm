	.macro macro (%x)
label:  # label 1
	b main # OK
	b label # OK label 1
	.end_macro 
	
	.macro macro2 (%y)
label:  # label 2
	b main # OK
	b label # OK label 2
	.end_macro 
	
main:
	macro(1)
	b label  # label 3
label:  # label 3
	li a0, 1
	
	# jal not_label
	jalr zero, 0(%addr)
	
	
	# mv ra, pc
	jal metka
metka:
	# YESYESYES
	