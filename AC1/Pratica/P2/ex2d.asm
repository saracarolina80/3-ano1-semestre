	.data
	.text
	.globl main

main:	ori $t1 , $0 , 5 	# $t1 = bin
	
	srl $t2 , $t1 , 1	# $t2 = bin >> 1
	xor $t0 , $t1 , $t2	# $t0 = $t1 ^ $t2   =>   gray = bin ^ ( bin >> 1 )
	
	jr $ra