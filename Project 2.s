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
N: 			.word ...										# number of test cases supplied; at least 10
A: 			.word 5,25,9,12345,54321,... 					# parameter A in (A^B) mod P; add 5 or more test cases
B: 			.word 0,16,8,54321,10000,... 					# parameter B in (A^B) mod P; add 5 or more test cases
P: 			.word 8,13,2,10000,65535,... 					# parameter P in (A^B) mod P; add 5 or more test cases
C: 			.word 1,1,1,1,1,... 							# results of test cases 
			.globl main
			.text
main:
