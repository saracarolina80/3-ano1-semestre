	
	.data
	.text
	.globl main

main:	ori $t0 , $0 , 0xE543	# $t0 = x
	ori $t1 , $0 , 0xA3E4	# $t1 = y
	and $t2 , $t0 , $t1 	# $t2 = $t0 & $t1
	or  $t3 , $t0 , $t1	# $t3 = $t0 | $t1
	nor $t4 , $t0 , $t1	# $t4 = ~($t0 | $t1)
	xor $t5 , $t0 , $t1   	# $t5 = $t0 ^ $t1
	
	xori $t7 , $t0 , 0xFFFF
	
	jr $ra