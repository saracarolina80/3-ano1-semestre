.data
	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	read_int, 5
str:	.asciiz ", " 
str1:	.asciiz "Size of array : "
str2:	.asciiz "array["
str3:	.asciiz "] = "
str4:	.asciiz "Enter the value to be inserted:  "
str5:	.asciiz "Enter the position: "
str6:	.asciiz "\nOriginal array: "
str7:	.asciiz "\nModified array: "
array:	.space 	200
	.text
	.globl main
	
# Mapa de Registos
# $t0 - i
# $s1 - array_size
# $s2 - insert_value
# $s3 - insert_pos
# $t4 - &array
# $t5 - &(array[i])
# $t6 - i*4

main:						# int maind(void) {
	addiu	$sp, $sp, -20			#	abrir espaco na pilha
	sw	$ra, 0($sp)			#	salvar o $ra na pilha
	sw	$s1, 4($sp)			
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
	sw	$s0, 16($sp)
	
	li	$t0, 0				# 	i = 0;
	la	$t4, array			#	$t4 = &array
	la	$a0, str1			#	$a0 = str1;
	li	$v0, print_string		#
	syscall					#	print_string(str1);
	li	$v0, read_int			#	
	syscall					#	read_int();
	move	$s1, $v0			#	array_size = read_int();
						#
for:	bge	$t0, $s1, endfor		#	for(i = 0; i<array_size; i++) {
	la	$a0, str2			#		$a0 = str2;
	li	$v0, print_string		#
	syscall					#		print_string(str2);
	move	$a0, $t0			#		$a0 = i;
	li	$v0, 1				#
	syscall					#		print_int10(i);
	la	$a0, str3			#		$a0 = str3;
	li	$v0, print_string		#		
	syscall					#		print_string(str3);
	li	$v0, read_int			#	
	syscall					#		read_int();
	sll	$t6, $t0, 2			#		$t6 = i * 4;
	addu	$t5, $t4, $t6			#		&array[i] = array + i *4
	sw	$v0, 0($t5)			#		array[i] = read_int();
	addi	$t0, $t0, 1			#		i++;
	j 	for				#	}
endfor:						#
	la	$a0, str4			#	$a0 = str4;
	li	$v0, print_string		#
	syscall					#	print_string(str4);
	li	$v0, read_int			#	read_int();
	syscall					#
	move	$s2, $v0			#	insert_value = read_int();
	la	$a0, str5			#	$a0 = str5;
	li	$v0, print_string		#
	syscall					#	print_string(str5);
	li	$v0, read_int			#	read_int();
	syscall					#
	move	$s3, $v0			#	insert_pos = read_int();
	la	$a0, str6			#	$a0 = str6;
	li	$v0, print_string		#
	syscall					#	print_string(str6);
	move	$s0, $t4
	move	$a0, $s0			#
	move 	$a1, $s1			#
	jal	print_array			#	print_array(array, array_size);
	move	$a0, $s0			#
	move 	$a1, $s2			#
	move 	$a2, $s3			#
	move 	$a3, $s1			#
	jal	insert				#	insert(array, array_size, insert_pos, insert_value);
	la	$a0, str7			#	$a0 = str7;
	li	$v0, print_string		#
	syscall					#	print_string(str7);
	move	$a0, $s0			#	$a0 = &array
	addi	$a1, $s1, 1			#	$a1 = array_size + 1
	jal	print_array			#	print_arary(array, array_size+1);
						#
	li	$v0, 0				#	return 0;
	lw	$ra, 0($sp)			#	restabelecer o $ra
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	lw	$s0, 16($sp)
	addiu	$sp, $sp, 20			#	repor o espaco na pilha
	jr 	$ra				# } fim do programa

insert:	move $t0 , $a0			# array
	move $t1 , $a1 			# value
	move $t2 , $a2 			# pos
	move $t3 , $a3 			# size

if:	ble $t2 , $t3 , else
	li $v0 , 1
	j endif

else:	
	addi $t4 , $t3 , -1 # i = size -1
for2:	blt $t4 , $t2 , endfor2
	sll $t6 , $t4 , 2
	addu $t0 , $t0 , $t6
	lw $t5 , 0($t0)		# $t5 = array[i]
	sw $t5 , 4($t0)
	addi $t4 , $t4 , -1
	j for2
endfor2:	sll $t6 , $t4 , 2
	addu $t0 , $t0 , $t6
	sw $t1 , -4($t0) 	# array[pos] = value
	li $v0 , 0
endif:	jr $ra


print_array: move $t0 , $a0
	     move $t1 , $a1 
	     sll $t1 , $t1 , 2
	     addu $t2 , $t0 , $t1   # p = &(a+n)
for1:	     bge $t0 , $t2 , endfor1
	     lw $a0 , 0($t0)
	     li $v0 , print_int10
	     syscall
	     la $a0 , str
	     li $v0 , print_string
	     syscall
	     
	     addiu $t0 , $t0 , 4
	     
	     j for1
endfor1:     jr $ra
	