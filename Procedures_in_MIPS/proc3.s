		.data
x:		.word 1
y:		.word 2
z:		.word 3
foo_string:	.asciiz "p + q: "
new_line:	.asciiz "\n"	

		.text
main:		la $t0, x		# load address of x into $t0
		lw $s0, 0($t0)		# store value of x into $s0
	
		la $t0, y		# load address of y into $t0
		lw $s1, 0($t0)		# load value of y into $s1
	
		la $t0, z		# load address of z into $t0
		lw $s2, 0($t0)		# load value of z into $s2
	
		# prep arguments for foo(x,y,z)
		add $a0, $zero, $s0	# set $a0 to value of x
		add $a1, $zero, $s1	# set $a1 to value of y
		add $a2, $zero, $s2	# set $a2 to value of z
	
		jal foo			# call foo(x,y,z)
		
		lw $t0, 0($sp)		# restore $t0 from foo
		addi $sp, $sp, 4
		
		# addition
		add $s1, $s1, $s0	# y = x + y
		add $s1, $s1, $s2	# y = x + y + z
		add $s2, $s1, $t0	# z = x + y + z + foo(x,y,z) #last argument was $v0
		
		# printing
		la $a0, new_line
		li $v0, 4
		syscall
		
		addi $a0, $s2, 0	# load z into $a0 to print
		li $v0, 1		# print z 
		syscall	
		
		j finish		# end program


foo:		addi $sp, $sp, -4
		sw $s0, 0($sp)		# store $s0 from main
		addi $sp, $sp, -4
		sw $s1, 0($sp)		# store $s1 from main
		addi $sp, $sp, -4
		sw $s2, 0($sp)		# store $s2 from main
		addi $sp, $sp, -4
		sw $ra, 0($sp)		# store $ra from main
		
		
		# prep arguments for bar(m + o, n + o, m + n)
		add $t0, $a0, $a2 	# m + o
		add $t1, $a1, $a2	# n + o
		add $t2, $a0, $a1	# m + n
		
		addi $sp, $sp, -4
		sw $a0, 0($sp)		# store $a0 from foo
		addi $sp, $sp, -4
		sw $a1, 0($sp)		# store $a1 from foo
		addi $sp, $sp, -4
		sw $a2, 0($sp)		# store $a2 from foo
		
		
		add $a0, $t0, $zero	# put m + o in $a0
		add $a1, $t1, $zero	# put n + o in $a1 
		add $a2, $t2, $zero	# put m + n in $a2
		
		
		jal bar 
		
		lw $a0, 0($sp)		# restore $a0 from bar
		addi $sp, $sp, 4
		
		add $s0, $zero, $a0	# put value of p in $s0
		
		# restoring values from foo
		lw $a2, 0($sp)		# restore $a2 from foo
		addi $sp, $sp, 4
		lw $a1, 0($sp)		# restore $a1 from foo
		addi $sp, $sp, 4
		lw $a0, 0($sp)		# restore $a0 from foo
		addi $sp, $sp, 4
		
		# prep arguments for bar(m - o, n - m, n + n)
		sub $t0, $a0, $a2 	# m - o
		sub $t1, $a1, $a0	# n - m
		add $t2, $a1, $a1	# n + n
		
		add $a0, $t0, $zero	# store m - o in $a0
		add $a1, $t1, $zero	# store n - m in $a1 
		add $a2, $t2, $zero	# store n + m in $a2
		
		
		jal bar	
		lw $a0, 0($sp)		# restore $a0 from bar
		addi $sp, $sp, 4
		add $s1, $zero, $a0	# put value of q in $s1
		

		
		la $a0, foo_string	# load address of foo_string
		li $v0, 4		# 4 = service number to print string
		syscall
		
		add $t0, $s0, $s1	# load $t0 with p + q
		add $a0, $t0, $zero	# load $a0 with $t0
		
		li $v0, 1		# 1 = service number to print integer
		syscall
		
		# restoring values from main	
		lw $ra, 0($sp)		# restore $ra from main
		addi $sp, $sp, 4
		lw $s2, 0($sp)		# restore $a2 from main
		addi $sp, $sp, 4
		lw $s1, 0($sp)		# restore $a1 from main
		addi $sp, $sp, 4
		lw $s0, 0($sp)		# restore $a0 from main
		addi $sp, $sp ,4
		
		addi $sp, $sp, -4
		sw $t0, 0($sp)		# store $t0 from foo
		
		jr $ra
	
bar:	
		sub $t0, $a1, $a0	# b - a
		sllv $a0, $t0, $a2	# (b - a) << c
		addi $sp, $sp, -4
		sw $a0, 0($sp)		# store $a0 from bar
		
		jr $ra
	
	
finish:		li $v0, 10
		syscall	