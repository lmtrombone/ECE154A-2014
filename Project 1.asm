			.data
N:			.word 5				#num elements in array
X:			.word 1,4,6,2,-3	#Array thing
MIN:		.word 0
MAX:		.word 0

A:		.asciiz "Max: "
B:		.asciiz "\nMin: "

			.globl main
			.text

			

main:		lw $t1, X;
			sw $t1,MAX;					#set max and min as first element of array
			sw $t1,MIN;
			lw $t2, N;					#load num elements into t2
			lw $t7, N;					#load num elements into t7
			addi $t7, $t2,-1;			#subtract t7 by 1;
			add $t7, $t7,$t7;			#t7 x4;
			add $t7, $t7,$t7;			#t7 = pos of last entry in array relative to 0.
			add $t4, $t1, $t7;			#t4 is set to the last entry in the array.
			lw $t3, 0($t4);				#set t3 to last entry in array
			lw $t8, 0($zero);			#initialize number of comparisons made (basically N/2) to 0
			
sortloop:	slt $t4, $t1,$t3;			#set $t4 = 1 if t1 < t3
			beq $zero, $t4, swap;		#go to swap if t1 is larger or equal to t4
			j Next1;

#Swap function used if t1 is larger than t3
swap:		lw $t4, 0($t1);				#temp = t1;
			lw $t1, 0($t3);				#t1 = t3;
			lw $t3, 0($t4);				#t3 = temp;
			addi $t8, $t8,1;			#increment count by 1
			j Next1;
			


Next1:		addi $t1, $t1, 4;				#load next number into t1
			addi $t3, $t3, -4;				#load next number into t3 (from the bottom)
checkdone:	sub $t6, $t2,$t8;				#N is even case. Subtract count from N.		
			beq $t6, $t8, done1;			#N is even case. If result = count, move on.
			beq $t1, $t3, done1;			#N is odd case. t1 at same place t3 is, move on.
			jal sortloop;					#loop back to continue sorting

#Precon: Data has been sorted into top min and bottom max array.
#Beginning to run through min list 
done1:		lw $t4, X;					#load beginning into t1
			sw $t6, 0($zero);			#clear t6 to use as temp
			add $t6, $t1, $t8;			#t6 set as last entry of min list
			lw $t8, 0($t8);				#put t8 at end of min list
minloop:	beq $t4, $t8, done2;		#if t1 is at end of min list, move on.
			lw $t6, MIN;				#Load current MIN into t6
			slt $t5, $t6, $t4;			#set $t5 = 1 if MIN < t4;
			beq $zero, $t5,MinA;		#goto MinA swap process if $t5 is zero (since t1 is less than MIN)
			j Next2;
			
MinA:		sw $t4, MIN;				#put t1 into MIN, since it is smaller than MIN
			j Next2;
			
Next2:		addi $t4, $t4,4;			#load next number into t1
			j minloop;
			
done2:		sw $t4, 0($t3);				#Store MIN into t3
			lw $t8, 0($t7);			#Set t8 to last element in array
										#t1 already at beginning of max list (count-1); no need to initialize
maxloop:	beq $t4, $t8, done3;		#if t4 is at the end of the max list, move on.
			lw $t6, MAX;				#Load current MAX into t6
			slt $t5, $t4, $t6;			#set $t5 = 1 if $t4 < MAX
			beq $zero, $t5,MaxA;		#goto MaxA, since $t4 is  greater than MAX
			j Next3;
			
MaxA: 		sw $t4, MAX;				#put t1 into MAX, since it is larger than MAX
			j Next3;
			
Next3:		addi $t4, $t4,4;			#load next number into t1
			j maxloop;

			
			
#Done with process. Just output stuff.
done3:		sw $t4, 0($t2);				#Store MAX into t3;

			li	$v0, 4;
			la	$a0, A;
			syscall;
	
			li	$v0, 1;
			add	$a0, $t2, $zero	;		#Print MAX
			syscall;
			
			li	$v0, 4;
			la	$a0, B;
			syscall;
	
			li	$v0, 1;
			add	$a0, $t3, $zero;		#Print MIN
			syscall;
	
			li $v0, 10;					#End program
			syscall;









