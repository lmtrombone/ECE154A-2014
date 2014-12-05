# Exponentiality.
# [insert code here]

####################
# Vincent "Styxx" Chang
# Write a MicroMIPS assembly language program to implement the computation of part b, using the procedure of
# part c and limiting yourself to the same instructions specified in part c. Run your program on at least 10 different
# test triples (a, b, p), the first five of which are specified under "Sample assembly file" below. The complete
# program file for this part will be one of your project's deliverables. Using the naming convention of Project 1, call
# the .s file [last name]_[first name]_[perm no].
####################

		.data
N:		.word 10					            # number of test cases supplied; at least 10
A:		.word 5,25,9,12345,54321,... 			# parameter A in (A^B) mod P; add 5 or more test cases
B:		.word 0,16,8,54321,10000,... 			# parameter B in (A^B) mod P; add 5 or more test cases
P:		.word 8,13,2,10000,65535,... 			# parameter P in (A^B) mod P; add 5 or more test cases
C:	    .word 1,1,1,1,1,... 				    # results of test cases 
		.globl main
		.text
		
main:	    la  $s0, A                          # Load base array
            la  $s1, B                          # Load exponent array
            la  $s2, P                          # Load modding array
            la  $t0, N                          
            lw  $s3, 0($t0)                     # Loading number of test cases
            add $s4, $0, $0                     # initialize i at 0
            
            # Past initialization
            
start:          #For each test case
                #Put A in $t0
                #Put B in $t1
                #Put P in $t2
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
                                                # if not, the exponent is zero
            
expzero:    # The exponent is 0
            # Make the result 1
            # Jump to end of program/next loop
            
expone:     # The exponent is 1
            # Result = base % mod
            # Jump to end of program/next loop

found1:     # Most significant 1 found


# int result = base % mod




# for (i-1; i >= 1; i--) {
    # result = (result * result) % mod
    # if (exponent[i] == 1)
        #result = (result * base) % mod
# endfor
# return result
            
            
            
            
            
