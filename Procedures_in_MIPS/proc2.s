		.data
x:		.word 5
y:		.word 10
m:		.word 15
b:		.word 2

		.text
MAIN:	la $t0, x
		lw $s0, 0($t0)		# s0 = x
		la $t0, y
		lw $s1, 0($t0)		# s1 = y
		
		# Prepare to call sum(x)
		add $a0, $zero, $s0	# Set a0 as input argument for SUM
		jal SUM			# jump and link to SUM label
		add $t0, $s1, $s0	# $t0 = x + y
		add $s1, $t0, $v0	# y = $t0 + SUM_result
		addi $a0, $s1, 0 	# load y into $a0 to print
		li $v0, 1		# print y 
		syscall	
		j END

		
SUM: 	addi $sp, $sp, -4
		sw $s0, 0($sp)		# store $s0 from MAIN
		addi $sp, $sp, -4
		sw $ra, 0($sp)		# store $ra of MAIN
		addi $sp, $sp, -4
		sw $a0, 0($sp)		# store $a0 from MAIN
		
		# orginal code
		la $t0, m
		lw $s0, 0($t0)		# s0 = m
		add $a0, $s0, $a0	# Update a0 as new argument for SUB
		jal SUB
		
		# my code
		lw $a0, 0($sp)		# Restore a0 from MAIN
		addi $sp, $sp 4
		add $v0, $a0, $v0
		
		lw $ra, 0($sp)		# Restore $ra from MAIN
		addi $sp, $sp 4
		lw $s0, 0($sp)		# Restore $s0 from MAIN
		addi $sp, $sp 4

		
		# original code
		jr $ra		
		
SUB:	la $t0, b
		addi $sp, $sp -4
		sw $s0, 0($sp)		# Backup s0 from SUM
		lw $s0, 0($t0)		# s0 = b
		sub $v0, $a0, $s0
		lw $s0, 0($sp)		# Restore s0 from SUM
		addi $sp, $sp 4
		jr $ra

		
END:	li      $v0, 10		
		syscall	
	
