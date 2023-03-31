.data

prompt: .asciiz "Please enter a number: " 

.text
main:
	la $a0, prompt
	li $v0, 4					# 4 = service number to print string
	syscall
	
	li $v0, 5					# 5 = service number to read integer
	syscall
	
	add $a0, $v0, $zero				# prep $a0 for recursion()
	
	jal recursion

	add $a0, $v0, $zero				# load value of $v0 into $a0
	
	li $v0, 1					# 1 = service number to print int
	syscall 
	
	j finish


recursion: addi $sp, $sp, -12
	sw $ra, 0($sp)
	
	addi $t0, $zero, -1
	bne $a0, $t0, not_neg_one			# branch if $a0 != -1
	
	addi $v0, $zero, 3				# return 3 if $a0 == -1
	j finish_recursion

not_neg_one:
	addi $t0, $zero, -2
	bgt $a0, $t0, else				# branch if $a0 > -2
	blt $a0, $t0, not_neg_two			# branch if $a0 < -2
	
	addi $v0, $zero, 1				# return 1 if $a0 == -2
	j finish_recursion

not_neg_two:
	addi $v0, $zero, 2				# return 2 if $a0 < -2
	j finish_recursion	

else:
	# need to recreate return recursion(m - 3) + m + recursion(m - 2);
	sw $a0, 4($sp)					# store $a0 (original value of m)	
	
	addi $a0, $a0, -3				# prep $a0 for recursion(m - 3)
	jal recursion					# call recursion(m - 3)
	
	sw $v0, 8($sp)
	
	lw $a0, 4($sp)					# get original value of m
	
	addi $a0, $a0, -2				# prep $a0 for recursion(m - 2)
	jal recursion					# call recursion(m - 2)
	
	
	lw $a0, 8($sp)					# get value of recursion(m - 3)
	add $v0, $v0, $a0				# recursion(m - 2) + recursion(m - 3)
	
	lw $a0, 4($sp)					# get original value of m
	add $v0, $v0, $a0				# recursion(m - 2) + recursion(m - 3) + m
	
	j finish_recursion

finish_recursion:
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra


finish:					
	li $v0, 10 
	syscall