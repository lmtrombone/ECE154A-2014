####################
# Part D of Project 2 of ECE 154
####################

	    .data
N:	    .word 10						# number of test cases supplied; at least 10
A:	    .word 5,25,9,12345,54321,... 			# parameter A in (A^B) mod P; add 5 or more test cases
B:	    .word 3,16,8,54321,10000,... 			# parameter B in (A^B) mod P; add 5 or more test cases
P:	    .word 7,13,2,10000,65535,... 			# parameter P in (A^B) mod P; add 5 or more test cases
C:	    .word 1,1,1,1,1,... 				# results of test cases 
	    .globl main
	    .text
		
main:	    la  $s0, A                          # Load A array (base)
            la  $s1, B                          # Load B array (exponent)
            la  $s2, P                          # Load P array (mod)
            la  $t0, N                          
            lw  $s3, 0($t0)                     # Loading number of test cases
            add $s4, $0, $0                     # initialize i at 0
            la  $s5, C				# Load C array (results)
            
            # Past initialization
            
start:      #For each test case
            lw $t0, 0($s0) 			#Put A in $t0
            lw $t1, 0($s1)			#Put B in $t1
            lw $t2, 0($s2)			#Put C in $t2
            #Put result in $t3
                
            addi $s4, $0, 16                    # set bit counter to MSB
            addi $t0, $0, 32767                 # binary 1000 0000 0000 0000
            slt  $t9, $t0, $t1                  # is 32767 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 16384                 # binary 0100 0000 0000 0000
            slt  $t9, $t0, $t1                  # is 16384 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 8192                  # binary 0010 0000 0000 0000
            slt  $t9, $t0, $t1                  # is 8192 < exponent?
            bne  $t9, $zero, found1             # if so, move on

            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 4096                  # binary 0001 0000 0000 0000
            slt  $t9, $t0, $t1                  # is 4096 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 2048                  # binary 0000 1000 0000 0000
            slt  $t9, $t0, $t1                  # is 2048 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 1024                  # binary 0000 0100 0000 0000
            slt  $t9, $t0, $t1                  # is 1024 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 512                   # binary 0000 0010 0000 0000
            slt  $t9, $t0, $t1                  # is 512 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 216                   # binary 0000 0001 0000 0000
            slt  $t9, $t0, $t1                  # is 216 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 128                   # binary 0000 0000 1000 0000
            slt  $t9, $t0, $t1                  # is 128 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 64                    # binary 0000 0000 0100 0000
            slt  $t9, $t0, $t1                  # is 64 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 32                    # binary 0000 0000 0010 0000
            slt  $t9, $t0, $t1                  # is 32 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 16                    # binary 0000 0000 0001 0000
            slt  $t9, $t0, $t1                  # is 16 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 8                     # binary 0000 0000 0000 1000
            slt  $t9, $t0, $t1                  # is 8 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 4                     # binary 0000 0000 0000 0100
            slt  $t9, $t0, $t1                  # is 4 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 2                     # binary 0000 0000 0000 0010
            slt  $t9, $t0, $t1                  # is 2 < exponent?
            bne  $t9, $zero, found1             # if so, move on
            
            addi $s4, $s4, -1                   # decrement bit counter
            addi $t0, $0, 1                     # binary 0000 0000 0000 0001
            slt  $t9, $t0, $t1                  # is 1 < exponent?
            bne  $t9, $zero, expone             # if so, move on
            
expzero:    # If not, the exponent is 0
            addi $t6, $0, 1			# Make the result 1
            j RET

            
expone:     # If the exponent is 1
            # Result = base % mod
            slt   $t7,$a0,$a2             # set ($t7) to 1 if base < mod
            bne   $t7,$0,RET	          # if base < mod, move on
            sub   $a0,$a0,$a2             # else, subtract base by mod and repeat
            j expone

found1:     # Most significant 1 found
            # X = A (This has been done above) ($t0)
            # if (B[LSB == 1]) {Y = A}; else {Y = 1}
            # Find LSB of B ($t1)
            addi    $t9, $0, 1                          # $t9 = 1
            and     $t8, $t1, $t9                       # AND B with 1 to obtain LSB of B (in $t8)
            bne     $t8, $0, LSB1                       # if $t8 == 1, goto LSB1
            j       LSB0

LSB1:       add     $t3, $0, $t0                        # result = A (base)
	    j LOOP					# jumps to LOOP
LSB0:       addi    $t3, $0, 1                          # result = 1

LOOP:	    addi $t4, $t5, 0				# initializes counter 
	    jal ummu					# jump and link to amumu (registers for X and P)
	    srl $t1, $t1, 1				# implements shift to right
	    and $t6, $t1, 1				# checks if bit is a 1
	    bne $t7, $zero, BIS1			# checks value of $t6
	    addi $t4, $t4, -1				# decrement counter
	    slt $s7, $0, $t4				# check if for loop ends; if 0 < $t4, $s7 = 1
	    bne $s7, $0, LOOP				# if 0 < $t4, then restart loop
	    j RET					# if 0 = $t4, then end loop
	    
BIS1:	    and $t6, $s8, 1				# check if y is odd
	    beq $t6, $0, YIS0				# if y is 0
	    bne $t6, $0, YIS1				# if y is 1
	    
YIS1:	    add $t6, $t0, $0				# if y is 1, set y = x
	    j LOOP

YIS0:	    jal ummu					# if y is 0, y = y * x (mod m)
	    j LOOP
	    
RET:	    # return y ($t6 for now)
	    sw $t6, 0($s5)
	    add $v1, $t6, $zero
	    
	    #increment test case counter ($s4)
	    addi $s4, $s4, 4;
	    
	    ##### Need to figure out how to go betwen test cases
	    ##### As well as figuring out when to stop after all test cases have been completed
	    ##### (N == $s4)
	    
	    
            # for (i = 0; i < 15; i++)
                # x = x * x % m
                # if (B[i] == 1)
                    # if (y == 1) { y = x; }
                    # else {y * x % m}
            #endfor
            #return y
            
            



ummu: 
Multiplication:
	# $a0 - Multiplicand
	# $a1 - Multiplier
	# $v0 - Result
	# $t0 - The mask for the right bit
	# $t1 - The LSB of the multiplier

	li $v0, 0	# Initialize the result register
	#li $v1, 0
	li $t0, 1	# Initialize the mask 
	li $t1, 0	# Initialize the LSB result
	#li $t2, 0
	#li $t3, 0
	#li $t4, 0

	Multiplication_loop:
		beq $a1, $zero, Multiplication_end	# If the multiplier is zero we finished
		and $t1, $t0, $a1			# Get the LSB
		beq $t1, 1, Multiplication_do_add	# If the LSB is not zero add the multiplicand to the result
		beq $t1, 0, Multiplication_do_shift	# If the LSB is zero add just do the shifts

		Multiplication_do_add: 
			addu $v0, $v0, $a0	
			#mod starts here
			addu $t2, $0, $a0 
			addu $t4, $0, $a2 #move P to $t4
			addu $t3, $0, 1 #initialize mask to 1  
			blt $t4, $t2, modShift
			j findMod
			
		modShift:
			sll $t4, $t4, 1 #shift left p
			sll $t3, $t3, 1 #shift left mask
			blt $t4, $t2, modShift
			
		findMod:
			bge $t2, $t4, mod2
			j mod3
		mod2:
			subu $t2, $t2, $t4
			
		mod3:
			srl $t4, $t4, 1 
			srl $t3, $t3, 1 
			bne $t3, 0, findMod
			addu $v1 $v1, $t2

		Multiplication_do_shift:
			sll $a0, $a0, 1			# Shift left the multiplicand
			srl $a1, $a1, 1			# Shift right the multiplier

		j Multiplication_loop			# Back to the loop

	Multiplication_end:
		#jr $ra					# Return with the result in $v0 register
		j finalMod

	finalMod:
		addu $t2, $0, $v1
		addu $t4, $0, $a2 #move P to $t4
		addu $t3, $0, 1 #initialize mask to 1  
		blt $t4, $t2, modShift2

	modShift2:
			sll $t4, $t4, 1 #shift left p
			sll $t3, $t3, 1 #shift left mask
			blt $t4, $t2, modShift2
			
		findMod2:
			bge $t2, $t4, mod4
			j mod5
		mod4:
			subu $t2, $t2, $t4
			
		mod5:
			srl $t4, $t4, 1 
			srl $t3, $t3, 1 
			bne $t3, 0, findMod2
			addu $v1 $0, $t2
	
	jr $ra
