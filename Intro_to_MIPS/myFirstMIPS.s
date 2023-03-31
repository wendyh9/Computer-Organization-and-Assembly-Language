# author: Wendy Haw
.data 

.text
main:

    # remember value of $s0 will be manually set

    add $t0, $t0, $s0       # load value of $s0 into $t0
    addi $t1, $t0, -7       # add value of $t0 and -7 and store sum in $t1 
    add $t2, $t1, $t0       # add values of $t1 and $t0 and store sum in $t2
    addi $t3, $t2, 2        # add value of $t2 and 2 and store sum in $t3
    add $t4, $t3 $t2        # add values of $t3 and $t2 and store sum in $t4
    addi $t5, $t4, -28      # add value of $t4 and -28 and store sum in $t5
    sub $t6, $t4, $t5       # add values of $t4 and $t5 and store sum in $t6
    addi $t7, $t6, 12       # add value of $t6 and 12 and store sum in $t7

Exit:
    li $v0, 10              # Load a 10 (service number for halt) into $v0.
    syscall                 # The program ends because syscall reads the value of 10 in $v0.
