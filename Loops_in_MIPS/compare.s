# use la "load address"

# this is in 2 steps
# la $t1 label
# lw $t2 0($t1)

# this is in 1 step (pseudointstruction)
# lw $t2 label

.data
n:      .word 25
prompt: .asciiz "Enter a number: "
str1:   .asciiz "Less than \n"
str2:   .asciiz "Less than or equal to \n"
str3:   .asciiz "Greater than \n"
str4:   .asciiz "Greater than or equal to \n"

.text
main:   lw      $s0, n
        la      $a0, prompt
        li 	 $v0, 4	     # 4 = service code to print string
        syscall				
        li      $v0, 5      # 5 = service code to read integers
        syscall

        move $t0, $v0	     # move input into $t0 		 

        # less than
        blt $t0, $s0, less

        # less than or equal to
        ble $t0, $s0, lessOrEqual

        # greater than
        bgt $t0, $s0, greater

        # greater than or equal to
        bge $t0, $s0, greaterOrEqual



less:   li      $v0, 4      # 4 = service code to print string       
        la      $a0, str1
        syscall
        j finish

lessOrEqual:
        li      $v0, 4      # 4 = service code to print string       
        la      $a0, str2
        syscall  
        j finish

greater:
        li      $v0, 4      # 4 = service code to print string       
        la      $a0, str3
        syscall  
        j finish

greaterOrEqual:
        li      $v0, 4      # 4 = service code to print string       
        la      $a0, str4
        syscall 
        j finish
        
finish:
	 li $v0, 10
        syscall  

