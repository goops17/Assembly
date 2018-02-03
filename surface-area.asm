#surface-area.asm 
# Written by: Gopal Chitaure (gochit01@wsc.edu)
# Taking user input and calculating surface area
# Concepts used: User input
.data 
B: .asciiz "\nEnter area of base: " 
C: .asciiz "\nEnter circumference: " 
h: .asciiz "\nEnter height: " 
answer: .asciiz "\n\n SA = 2B + C*h is " 

.text 
#printing B
main: li $v0, 4  
la $a0, B 
syscall 

#taking B from user
li $v0, 5 
syscall 
add $s0, $v0, $zero  

#Printing C
li $v0, 4 
la $a0, C 
syscall 

#taking C from user
li $v0, 5 
syscall 
add $s1, $v0, $zero

#Printing C
li $v0, 4 
la $a0, h  
syscall 

#taking C from user
li $v0, 5 
syscall 
add $s2, $v0, $zero

#Calculating 2B
add $s0, $s0, $s0 #2B = B+B or 2*B

#Calculating Ch
mult $s2, $s1
mflo $a0
#Calculating 2B+Ch
add $t0, $a0, $s0
 
#Print message
li $v0, 4 
la $a0, answer 
syscall

#Print answer
li $v0, 1 
move $a0, $t0 
syscall

#end of program 
li $v0, 10 #system call code for exit 
syscall
