	
	.data
	.text
	.globl main
	
main:	li $t0 , 0x862A5C1B
	sll $t2, $t0 , 4	# $t2 = $t0 << imm
	srl $t3, $t0 , 4	# $t3 = $t0 >> imm
	sra $t4, $t0 , 4	# $t4 = $t0 \ 2^imm
	
	jr $ra