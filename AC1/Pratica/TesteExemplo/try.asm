# Mapa de registos 
# p: $t0 
# *p: $t1 
# lista+Size: $t2

	.data
	.eqv SIZE , 10
	.eqv print_string , 4
	.eqv print_int10 , 1
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
	.align 2
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.text
	.globl main

main:	la $a0 , str1
	li $v0 , print_string
	syscall
	
	la $t0 , lista		# p = &lista[0]
	li $t2 , SIZE
	sll $t2 , $t2 , 2
	addu $t2 , $t0 , $t2

for:	bgeu $t0 , $t2 , endfor
	lw $t1 , 0($t0)
	
	move $a0 , $t1 
	li $v0 , print_int10
	syscall
	
	la $a0 , str2
	li $v0 , print_string
	syscall
	
	addiu $t0 ,$t0 , 1
	j for
endfor:
	jr $ra
