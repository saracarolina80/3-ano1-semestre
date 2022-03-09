	.data
	.text
	.globl main
	
main: 	ori $t0,$0,2 	       # $t0 = 2 
 	sra $t2,$t0,4          # $t2 = shift aritmetico logico de $t0
 	xor $t3,$t0,$t2
 	sra $t4,$t3,2	       # $t3 = shift aritmetico logico de $t2
 	xor $t5,$t3,$t4
 	sra $t6,$t5,1          # $t4 = shift aritmetico logico de $t3
 	xor $t7,$t5,$t6
 	andi $t1,$t7,0xFFFF    # $t1 = $t4	
 	jr $ra 		       # fim do programa

	