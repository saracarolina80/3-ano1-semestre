# Mapa de Registos
# $t0 - > gray
# $t1 - > bin
# $t2 - > mask

 	.data
 str1:	.asciiz "Introduza um numero: "
 str2:	.asciiz "\nValor em c�digo Gray: "
 str3:	.asciiz "\nValor em binario: "
 	.eqv print_string , 4
 	.eqv read_int , 5
 	.eqv print_int16 , 34
 	.text
 	.globl main
 
 main:	la $a0 , str1
 	li $v0 , print_string
 	syscall
 	
 	li $v0 , read_int
 	syscall
 	move $t0 , $v0                  # gray = read_int()
 	
 	srl $t2, $t0 , 1		# mask = gray >> 1;
 	move $t1 , $t0
 	
while:	beqz $t2 , endW
	xor $t1 , $t1 , $t2 
	srl $t2 , $t2 , 1

 	j while
 
 endW:	la $a0 , str2
 	li $v0 , print_string
 	syscall
 	
 	move $a0 , $t0
 	li $v0 , print_int16
 	syscall
 	
 	la $a0 , str3
 	li $v0 , print_string
 	syscall
 	
 	move $a0 , $t1
 	li $v0 , print_int16
 	syscall
 	
 	jr $ra
 	
 	  