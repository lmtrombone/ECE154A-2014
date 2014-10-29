			.data
N:			.word 5				#num elements in array
X:			.word 1,4,6,2,-3	#Array thing
MIN:		.word 0
MAX:		.word 0
	
			.global main
			.text

			

main:		sw 0(X),MAX;				#set max and min as first element of array
			sw 0(X),MIN;
			lw $t1, X;					#load array into t1
			lw $t2, N;					#load num elements into t2
			
			lw $t8, $zero;				#initialize number of comparisons made (basically N/2) to 0
			
sortloop:	lw $t3, N($t1);				#put last number into t3
			slt $t4, $t1,$t3;			#set $t4 = 1 if t1 < t3
			beq $zero, $t4, swap;		#go to swap if t1 is larger or equal to
			
			
			
#Do stuff where t3 goes to max side of array and t1 goes to the min side of array
#Make sure to update pointers so sortL doesn't get screwed	
sortR:		
			
			j Next;
#do stuff where t1 goes to max side of array and t3 go to min side of array		
#make sure to update pointers so sortR doesn't get screwed
sortL:		

			j Next;

Next:		addi $t8, $t8,1;				#increment count by 1
			lw $t1, 8(X);					#load next number into t1
			beq $t1, $X, done1;			#if all elements examined, move on
			jal sortloop;					#loop back to continue sorting

#Precon: Data has been sorted into top min and bottom max array.
#Beginning to run through min list 
done1:		




minloop:










