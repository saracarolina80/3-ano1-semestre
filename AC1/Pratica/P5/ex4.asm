# MAPA DE REGISTOS:
# p/lista:	 	$t0
# SIZE:			$t1
# SIZE + lista:  	$t2
# houveTroca:	 	$t3
# *pUltimo:		$t4
# *p:			$t5 (aux)
# *(p+1):		$t6 (aux1)


	.data
	.eqv SIZE, 10
	.eqv print_string 4
	.eqv read_int , 5
	.eqv print_int10 , 1
	.eqv FALSE , 0
	.eqv TRUE , 1
	
str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "\nConteudo do array:\n"
str3:   .asciiz  "; "

	.align 2
lista:  .space 40

	.text
	.globl main

main:	la $t0 , lista
	li $t1 ,SIZE 
	
	sll $t1 , $t1 , 2   # SIZE * 4	
	addu $t2 , $t1 , $t0 

	
for1:   bgeu $t0 , $t2 , endF1
	
	la $a0 , str1
	li $v0 , print_string
	syscall
	
	li $v0,read_int	
	syscall	
	sw $v0 , 0 ($t0)
	
	addiu $t0 , $t0 , 4
	
	j for1

endF1:
do:	li $t3 , FALSE 
	la $t0 , lista
	li $t1 , SIZE
	
	sub $t1, $t1 , 1
	sll $t1 , $t1 , 2
	addu $t4 , $t0 , $t1   # pUltimo = lista + (SIZE-1)

for2:	bge $t0 , $t4 , endF2
	lw $t5 , 0($t0)
	lw $t6 , 4($t0) 

if:	ble $t5 , $t6 , endIf
	
	sw $t5 , 0($t0)
	sw $t6 , 4($t0)
	
	li $t3 , TRUE 
	
endIf:	addiu $t0 , $t0 , 4
        j for2
 
endF2:

while:	beq $t3 , TRUE , do 
	la 	$t0,lista		# p = lista 
	la 	$a0,str2		#
	li	$v0,print_string	#
	syscall				# print_string("\nConteudo do array:\n")

	li 	$t1,SIZE		# t2 = size
	sll	$t1,$t1,2		# t2 = size * 4
	addu 	$t1,$t1,$t0		# t2 = lista + SIZE
	
for:	bgeu	$t0,$t1,endfor		# while( p < lista + SIZE) 
					# {
	lw	$t5,0($t0)		# 	t1(&(lista[0])) = *P					
	move 	$a0,$t5			# 	a0 = *p
	li	$v0,print_int10		#
	syscall				#	 print_int10(*p);
					#				
	la	$a0,str3
	li	$v0,print_string
	syscall				# print_string("; ")
	addiu	$t0,$t0,4		# 	p++
	j for 				# }
endfor:

	jr	$ra	#Termina programa