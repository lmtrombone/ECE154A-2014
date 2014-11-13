		.data
N:		.word 5						#num elements in array
X:		.word -5,6,2,0,7				#array
MIN:		.word 0
MAX:	.	word 0
A:		.asciiz "Min: "
B:		.asciiz "\nMax: "

		.globl main
		.text

main:		la $t1, X;					#load array into t1
		lw $t0,	N;					#load number of elements into t0
		addi $t2, $zero, 1;				#count starts at 1
		lw $t8, 0($t1);					#initialize temp MAX as first in array.
		lw $t9, 0($t1);					#initialize temp MIN as first in array.

#Past initialization
		
		lw $t3, 0($t1);					#load first value of array into t3
		lw $t4, 4($t1);					#load second value of array into t4
		
		slt $t5, $t3, $t4;				#t5 = 1 if t3 < t4 else 0
		beq $zero, $t5, tSmall;				#if t5 = 0, t4 is smaller. branch to method.
								#else t3 is smaller.
		add $t8, $t4, $zero;				#set local MAX to t4 (bigger)
		add $t9, $t3, $zero;				#set local MIN to t3 (smaller)
		j Next1;
		
tSmall: 	add $t8, $t3, $zero;				#set local MAX to t3 (bigger)
		add $t9, $t4, $zero;				#set local MIN to t4 (smaller)
		j Next1;

Next1:		addi $t1, $t1, 8;				#set next pointer (2 bytes down)
		addi $t2, $t2, 2;				#count++
		
#Looping now

loops:		beq $t2, $t0, loopDone;				#if count = N, done
		slt $t5, $t2,$t0;				#t5 = 1 if count < N else 0
		beq $zero, $t5, loopDone;			#if count > N, done;
		lw $t3, 0($t1);					#load first value into t3
		lw $t4, 0($t1);					#load second value into t4
		slt $t5, $t3, $t4;				#t5 = 1 if t3 < t4 else 0
		beq $zero, $t5, oBig;				#if 0, then first value (t3) is bigger
		j oSmall;					#if 1, then second value (t4) is bigger

#t3 > t4
oBig:		slt $t5, $t3, $t8;				#t5 = 1 if t3 < MAX, else 0
		beq $zero, $t5, rMax1;				#if t3 > MAX, go to replace max
		j cMin1;					#else move on;
rMax1:		add $t8, $t3, $zero;				#set local MAX to t3 (new MAX)
		j cMin1;
cMin1:		slt $t5, $t9, $t4;				#t5 = 1 if MIN < t4, else 0
		beq $zero, $t5, rMin1;				#if t4 < MIN, go to replace min
		j checkd;					#else move on;
rMin1:		add $t9, $t4, $zero;				#set local MIN to t4 (new MIN)
		j checkd;					


#t3 < t4
oSmall:		slt $t5, $t4, $t8;				#t5 = 1 if t4 < MAX, else 0
		beq $zero, $t5, rMax2;				#if t4 > MAX, go to replace max
		j cMin2;					#else move on
rMax2:		add $t8, $t4, $zero;				#set local MAX to t4 (new MAX)
		j cMin2;
cMin2:		slt $t5, $t9, $t3;				#t5 = 1 if MIN < t3, else 0
		beq $zero, $t5, rMin2;				#if t3 < MIN, go to replace min
		j checkd;					#else move on;
rMin2:		add $t9, $t3, $zero;				#set local MIN to t3 (new MIN)
		j checkd;
		
checkd		addi $t1, $t1, 8;				#set next pointer (2 bytes down)
		addi $t2, $t2, 2;				#count++

loopDone:
		
#N is odd check
		andi $t7, $t0, 1;				#t7 = 0 if N is even, else 1
		beq $t7, $zero, skip;				#if t7 = 0, no need to check final number
								#else, check final number
		lw $t3, 0($t1);					#load last element into t3
		slt $t5, $t3, $t8;				#t5 = 1 if t3 < MAX, else 0
		beq $zero, $t5, rMax3;				#if t3 > MAX, go to replace max
		j cMin3;					#else move on
rMax3:		add $t8, $t3, $zero;				#set local MAX to t3 (new MAX)
		j cMin3;
cMin3:		slt $t5, $t9, $t3;				#t5 = 1 if MIN < t3, else 0
		beq $zero, $t5, rMin3;				#if t3 < MIN, go to replace min
		j skip;						#else move on
rMin3:		add $t9, $t3, $zero;				#set local MIN to t3 (new MIN)
		j skip;

skip:


#Saving to memory
		sw $t8, MAX;					#store MAX to memory
		sw $t9, MIN;					#store MIN to memory

#Printing to console
		li	$v0, 4
		la	$a0, A
		syscall
		
		li	$v0, 1
		add	$a0, $t8, $zero
		syscall

		li	$v0, 4
		la	$a0, B
		syscall
		
		li	$v0, 1
		add	$a0, $t9, $zero
		syscall
		
#System end
		li $v0, 10
		syscall
