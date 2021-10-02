.data
prompt1: .asciiz "Enter the sequence index\n"
space: .asciiz " "
next_line: .asciiz "\n"
.text

main:
    j   L1
        
L1:
    li  $t0, 0  # fibinacci f0 = 0
    li  $t1, 1  # fibinacci f1 = 1
    li  $t2, 0  # Next fibinacci number , you can change register name t2 by yourself
    
    #  Print next line
    li $v0, 4
    la $a0, next_line
    syscall

    # Print prompt1
    li $v0, 4
    la $a0, prompt1
    syscall

    # Input number
    li $v0 , 5
    syscall
    move $t5 , $v0
    # If input number equal 0 , end program
    beq $t5 , $0 , Exit

    
    
    LOOP:
        # TODO implement the fibinacci 
        add $t0, $t1,$0
        add $t1, $t2,$0
        add $t2, $t0,$t1
        
        
        # output the result of fibinacci,you can change the register name t2 by yourself
        li $v0 , 1
        move $a0, $t2
        syscall

        # output the space
        li $v0, 4
    	la $a0, space
    	syscall

        # TODO implement the for loop with slt and beq instructions 
	subi $t5,$t5,1
	beq $t5,$0, L1
	j LOOP
	
	

#EXIT
Exit:
        li      $v0, 10
        syscall	
