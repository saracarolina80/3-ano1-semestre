	.data
str1:	.asciiz "Introduza 2 numeros "
str2:	.asciiz "A soma dos 2 numeros e´: "
	.eqv print_string , 4
	.eqv read_int , 5
	.eqv print_int10 , 1
	
	.text
	.globl main

main:	la $a0 , str1
	ori $v0 , $0 , print_string
	syscall 
	
	ori $v0,$0,read_int 
 	syscall # valor lido e' retornado em $v0 
 	or $t0,$v0,$0 # $t0=read_int()
 	
 	ori $v0 , $0 , read_int
 	syscall
 	or $t1 , $v0 , $0   # 2º numero
 	
 	la $a0 , str2
 	ori $v0 , $0 , print_string
 	syscall 
 	
 	add $t2 , $t1 , $t0 
 	
 	ori $v0 , $0 , print_int10
 	or $a0 , $0 , $t2
 	syscall 