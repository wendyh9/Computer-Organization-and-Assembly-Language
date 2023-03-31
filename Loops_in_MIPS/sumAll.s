# use a "while loop"
# compare $zero register in while loop

# use sll (shift logical left) by 31
# sll $d, $t, h
# Which makes $d = $t shifted left h times.
# if value after shift is 0 => the int is even
# another way is if first bit is 1 => the int is odd
# if last bit is one, the int is odd
# ex. 5 = 101
    # 6 = 110

.data
prompt:		.asciiz "Please enter a number: "
even_prompt: 	.asciiz "Sum of even numbers is: "
odd_prompt:	.asciiz "Sum of odd numbers is: "
new_line:	.asciiz "\n"


.text
main:		jal get_input
				
while:		beq $t0, $zero, after	# checks if input is 0
		jal check_num
		jal get_input
		j while


get_input:	la $a0, prompt
		li $v0, 4		# 4 = service number to print string
		syscall
		
		li $v0, 5		# 5 = service number to read integer
		syscall
		
		move $t0, $v0		# move input into $t0 ($v0 holds integer read)
		
		jr $ra

		
		
after:		j print_even_sum
		j print_odd_sum	
		j finish
		
check_num:	sll $t1, $t0, 31	# shift left logical by 31
		beq $t1, $zero, add_even_sum		# if shifted value == 0, number is even
		bne $t1, $zero, add_odd_sum		# if shifted value != 0, number is odd 
		jr $ra

add_even_sum:	add $s0, $s0, $t0
		jr $ra


add_odd_sum:	add $s1, $s1, $t0
		jr $ra

print_even_sum:
		la $a0, new_line
		li $v0, 4
		syscall		       # print new line
		
		la $a0, even_prompt
		li $v0, 4
		syscall			# print even_prompt
		
		move $a0, $s0
		li $v0, 1		# 1 = service number to print integers
		syscall			# print even sum
		
		la $a0, new_line
		li $v0, 4
		syscall		       # print new line
		
		

print_odd_sum:		
		la $a0, odd_prompt
		li $v0, 4
		syscall			# print odd_prompt
		
		move $a0, $s1
		li $v0, 1		# 1 = service number to print integers
		syscall			# print odd sum		
		
		la $a0, new_line
		li $v0, 4
		syscall		       # print new line
		

finish:
	 	li $v0, 10
        	syscall  
