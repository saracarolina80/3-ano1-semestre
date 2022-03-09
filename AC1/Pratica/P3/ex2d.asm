# Mapa de registos:
# $t0 � value
# $t1 � bit
# $t2 - i
# $t3 - rem
# $t4 - flag

	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "\nO valor em bin�rio e':"
str3:	.asciiz " "
 	.eqv print_string , 4
 	.eqv read_int, 5
 	.eqv print_char, 11
 	.text
 	.globl main
 
main:	la $a0 , str1 
	li $v0 , print_string
	syscall
	
	li $v0 , read_int
	syscall
	or $t0 , $v0 , $0
	
	la $a0 , str2
	li $v0 , print_string
	syscall
	
	li $t2 , 0
	li $t4 , 0

for:	bge $t2 , 32 , endfor
	andi $t1 , $t0 , 0x80000000
	srl $t1 , $t1 , 31
	rem $t3 , $t2 , 4

if1:	beq $t4 , 1 , if3
	beq $t1 , 0 , endif
	
if3:	li	$t4, 1			# 		flag = 1
	bne	$t3, $0, endif3		#		if(i%4 == 0) {
	li	$a0, ' '		#			$a0 = ' '
	li	$v0, print_char		#
	syscall				#			print_char(' ')	
	j	endif3			#		}
endif3:	addi	$a0, $t1, '0'		#		'0' + bit
	li	$v0, print_char		# 		$v0 = 11
	syscall				#		print_char('0' + bit)
	j	endif			#	}
endif:	sll	$t0, $t0, 1		#	value = value << 1;
	addi	$t2, $t2, 1		#	i++;
	j	for			# }
					#
endfor: 				#
	jr 	$ra			# fim do programa